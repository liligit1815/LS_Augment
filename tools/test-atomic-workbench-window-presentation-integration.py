"""Independent actual window presentation policies and Activity geometry/commit integration.

No Gradle/ADB/phone. Android View boundaries are not device layout acceptance.
"""
from pathlib import Path
import argparse
import hashlib
import os
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JDK=Path(r'C:\Program Files\Android\openjdk\jdk-21.0.8\bin')
FIXTURE=ROOT/'tools/fixtures/AtomicWorkbenchWindowPresentationIntegrationCases.java'
FILES=['AtomicWorkbenchWindowPresentationPolicy.java','AtomicWorkbenchWindowLayoutPlan.java','AtomicWorkbenchWorkspaceModel.java','AtomicWorkbenchPoolTopology.java','AtomicWorkbenchCapacityLayoutPlan.java']


def compile_run(folder, sources, runner):
    folder.mkdir(parents=True,exist_ok=False);paths=[]
    for name,text in sources.items():
        p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');paths.append(str(p))
    c=subprocess.run([str(JDK/'javac.exe'),'-J-Dfile.encoding=UTF-8','-J-Duser.language=en','--release','17','-encoding','UTF-8','-cp',str(_CAPACITY_JSON),'-d',str(folder/'classes'),*paths],capture_output=True,text=True,encoding='utf-8',errors='replace',timeout=45)
    if c.returncode:raise AssertionError(c.stdout+c.stderr)
    return subprocess.run([str(JDK/'java.exe'),'-Dfile.encoding=UTF-8','-cp',str(folder/'classes')+os.pathsep+str(_CAPACITY_JSON),runner],capture_output=True,text=True,encoding='utf-8',errors='replace',timeout=30)


def policy_sources():
    return {'ls/augment/com/'+name:(SRC/name).read_text(encoding='utf-8') for name in FILES}|{'ls/augment/com/AtomicWorkbenchWindowPresentationIntegrationCases.java':FIXTURE.read_text(encoding='utf-8')}


VIEW = r"""package android.view;public class View{public static final int IMPORTANT_FOR_ACCESSIBILITY_AUTO=0,IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS=4;public int left,top,width=1,height=1,measuredHeight=40;public boolean requested,enabled=true;public android.widget.FrameLayout.LayoutParams params=new android.widget.FrameLayout.LayoutParams(1,1);public int getLeft(){return left;}public int getTop(){return top;}public int getWidth(){return width;}public int getHeight(){return height;}public Object getLayoutParams(){return params;}public void setLayoutParams(android.widget.FrameLayout.LayoutParams p){params=p;requested=true;}public boolean isLayoutRequested(){return requested;}public void layout(int l,int t,int r,int b){left=l;top=t;width=r-l;height=b-t;requested=false;}public void setEnabled(boolean e){enabled=e;}public void setImportantForAccessibility(int i){}}"""
FRAME = r"""package android.widget;public class FrameLayout extends android.view.View{public boolean clipChildren=true;public void setClipChildren(boolean b){clipChildren=b;}public static class LayoutParams{public int leftMargin,topMargin,rightMargin,bottomMargin,width,height,gravity=-1,start=Integer.MIN_VALUE,end=Integer.MIN_VALUE;public LayoutParams(int w,int h){width=w;height=h;}public boolean isMarginRelative(){return start!=Integer.MIN_VALUE||end!=Integer.MIN_VALUE;}public void setMarginStart(int v){start=v;}public void setMarginEnd(int v){end=v;}}}"""
GRAVITY = r"""package android.view;public final class Gravity{public static final int LEFT=3,RIGHT=5,TOP=48,BOTTOM=80,CENTER_HORIZONTAL=1,CENTER_VERTICAL=16,CENTER=17,RELATIVE_LAYOUT_DIRECTION=0x00800000,START=RELATIVE_LAYOUT_DIRECTION|LEFT,END=RELATIVE_LAYOUT_DIRECTION|RIGHT;}"""
BUNDLE = r"""package android.os;import java.util.*;public class Bundle{final Map<String,Object>m=new HashMap<>();public <T>void putParcelableArrayList(String k,ArrayList<T>v){m.put(k,v);}public <T>ArrayList<T>getParcelableArrayList(String k){return (ArrayList<T>)m.get(k);}public Bundle(){}public Bundle(Bundle b){m.putAll(b.m);}public Set<String>keySet(){return m.keySet();}public Object get(String k){return m.get(k);}public void remove(String k){m.remove(k);}public void putLong(String k,long v){m.put(k,v);}public long getLong(String k,long d){return m.get(k) instanceof Long?(Long)m.get(k):d;}public void putBundle(String k,Bundle b){m.put(k,b);}public Bundle getBundle(String k){return (Bundle)m.get(k);}public boolean getBoolean(String k){return Boolean.TRUE.equals(m.get(k));}public boolean containsKey(String k){return m.containsKey(k);}public String getString(String k){return (String)m.get(k);}public void putBoolean(String k,boolean v){m.put(k,v);}public boolean getBoolean(String k,boolean d){return m.get(k) instanceof Boolean?(Boolean)m.get(k):d;}public void putInt(String k,int v){m.put(k,v);}public int getInt(String k,int d){return m.get(k) instanceof Integer?(Integer)m.get(k):d;}public void putString(String k,String v){m.put(k,v);}public String getString(String k,String d){return m.get(k) instanceof String?(String)m.get(k):d;}}"""


def member(source, signature):
    start=source.index(signature);brace=source.index('{',start);depth=1;i=brace+1;state='code'
    while i<len(source) and depth:
        c=source[i];n=source[i+1] if i+1<len(source) else ''
        if state=='line':
            if c=='\n':state='code'
        elif state=='block':
            if c=='*' and n=='/':state='code';i+=1
        elif state in ('string','char'):
            if c=='\\':i+=1
            elif c==('"' if state=='string' else "'"):state='code'
        elif c=='/' and n=='/':state='line';i+=1
        elif c=='/' and n=='*':state='block';i+=1
        elif c=='"':state='string'
        elif c=="'":state='char'
        elif c=='{':depth+=1
        elif c=='}':depth-=1
        i+=1
    if depth:raise AssertionError('Unclosed actual Java method '+signature)
    return source[start:i]


def activity_sources():
    source=(SRC/'AtomicWorkbenchActivity.java').read_text(encoding='utf-8')
    signatures=['private void layoutWorkspace()', 'private void prepareMainLayout(', 'private void invalidateMainLayout(',
        'private boolean mainLayoutMatches(', 'private boolean onWorkspacePreDraw()', 'private void setSlotVisible(',
        'private void place(', 'private Roles presentationRoles()', 'private Lease presentationLease(',
        'private Receipt beginPresentationFocus(', 'private Receipt proposalPresentation(', 'private Receipt bindPresentationReply(',
        'private boolean confirmPresentationPromotion(', 'private void invalidatePresentationGeometry()', 'private boolean mainReady()',
        'private boolean canInteract()', 'private void focusWindow(int id)', 'private void focusWindow(int id, EntryProof proof)',
        'private void focusAppWindow(int id, ComponentName component, AtomicWorkbenchMediaOpenRequest mediaOpen)',
        'private void focusAppWindow(int id, ComponentName component, AtomicWorkbenchMediaOpenRequest mediaOpen, EntryProof proof)',
        'private boolean mutationAllowed(', 'private void completeOperation(', 'private void resumeDeferredOperation()',
        'private void beginHomePresentation(', 'private void acceptHomePresentation(', 'private void clearHomePresentation()', 'private boolean completeHomePresentation()',
        'private static long homeDrawBoundary(', 'private static String readinessText(', 'private boolean canReuseHomeFrame(',
        'private void acceptTaskReply(', 'private void queryPendingTaskOperation()',
        'private static final class EntryProof', 'private static final class EntryRejected', 'private void dispatchEntrySide()',
        'private void runMediaAction(', 'private void readTaskSnapshot(', 'private void tryIncoming()', 'private void tryNativeHome()', 'private boolean readIncoming(', 'private String entryProblem(', 'private void requireCurrentEntry(',
        'private void rejectIncoming(', 'private static void clearEntryExtras(',
        'private void launchApp(AtomicWorkbenchAppRepository.App app, int taskId, EntryProof proof,',
        'private void launchApp(AtomicWorkbenchAppRepository.App app, int taskId, EntryProof proof)',
        'private void launchSourceApp(', 'private void focusSourceAppWindow(', 'private boolean workspaceOpenDescriptorCurrent(']
    fixture=(ROOT/'tools/fixtures/AtomicWorkbenchWindowPresentationActivityCases.java').read_text(encoding='utf-8')
    fixture=fixture.replace('import android.os.Bundle;','import android.os.Bundle;import android.os.SystemClock;import android.content.ComponentName;import android.content.Intent;')
    # Only host dependencies: retain the real extracted readTaskSnapshot catch/body.
    for old,new in (
        ('Object getApplicationContext(){return this;}',
         'final android.content.Context diagnosticContext=new android.content.Context();android.content.Context getApplicationContext(){return diagnosticContext;}'),
        ('final Queue WORKER=new Queue(),main=new Queue();',
         'final Queue WORKER=new Queue(),main=new Queue();static final Queue APP_READER=new Queue();static final java.util.concurrent.atomic.AtomicBoolean TASK_SNAPSHOT_DIAGNOSTIC_QUEUED=new java.util.concurrent.atomic.AtomicBoolean();long taskSnapshotDiagnosticLast,taskSnapshotDiagnosticSuppressed;')):
        if fixture.count(old)!=1:raise AssertionError('Diagnostic fixture dependency anchor changed: '+old)
        fixture=fixture.replace(old,new,1)
    fixture=fixture.replace('// ACTUAL_METHODS','\n'.join(member(source,s) for s in signatures))
    fixture=fixture.replace('// ACTUAL_FIT_SURFACE',member(source,'void fitSurface()'))
    return {'ls/augment/com/'+name:(SRC/name).read_text(encoding='utf-8') for name in FILES+['AtomicWorkbenchTaskUiSnapshot.java','AtomicWorkbenchMediaOpenRequest.java','AtomicWorkbenchConfig.java','AtomicWorkbenchTaskIdentity.java','AtomicWorkbenchTaskOperationRequest.java','AtomicWorkbenchTaskOperationResult.java']}|{
        'android/view/View.java':VIEW,'android/widget/FrameLayout.java':FRAME,'android/view/Gravity.java':GRAVITY,
        'android/os/Bundle.java':BUNDLE,'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now=1000;public static long elapsedRealtime(){return now;}public static long uptimeMillis(){return now;}}',
        'android/content/Context.java':'package android.content;public class Context{}',
        'ls/augment/com/AtomicWorkbenchDiagnostics.java':'package ls.augment.com;public final class AtomicWorkbenchDiagnostics{public static int records;public static Throwable lastError;public static void record(android.content.Context context,long generation,String event,int window,int user,String component,int display,String detail,Throwable error){if(context==null)throw new IllegalArgumentException("missing context");records++;lastError=error;}}',
        'android/content/ComponentName.java':'package android.content;public final class ComponentName{final String p,c;public ComponentName(String p,String c){this.p=p;this.c=c;}public String flattenToString(){return p+"/"+c;}public String getPackageName(){return p;}public static ComponentName unflattenFromString(String s){int i=s.indexOf("/");return i<1?null:new ComponentName(s.substring(0,i),s.substring(i+1));}}',
        'android/view/Surface.java':'package android.view;public class Surface{}',
        'android/os/Process.java':'package android.os;public class Process{public static int uid=10515;public static int myUid(){return uid;}}',
        'android/content/Intent.java':"package android.content;import java.util.*;public class Intent{final Map<String,Object>m=new HashMap<>();public Intent(){}public Intent(Intent i){m.putAll(i.m);}public Intent putExtra(String k,long v){m.put(k,v);return this;}public Intent putExtra(String k,int v){m.put(k,v);return this;}public Intent putExtra(String k,String v){m.put(k,v);return this;}public Intent removeExtra(String k){m.remove(k);return this;}public boolean hasExtra(String k){return m.containsKey(k);}public long getLongExtra(String k,long d){return m.get(k) instanceof Long?(Long)m.get(k):d;}public int getIntExtra(String k,int d){return m.get(k) instanceof Integer?(Integer)m.get(k):d;}public String getStringExtra(String k){return (String)m.get(k);}}",
        'ls/augment/com/AtomicWorkbenchWindowPresentationActivityCases.java':fixture}



def changed(sources, filename, old, new):
    result=dict(sources)
    source=result[filename]
    if source.count(old)!=1:raise AssertionError('Mutation anchor changed: '+filename+' '+old)
    result[filename]=source.replace(old,new,1)
    return result


def method_change(sources, signature, transform):
    filename='ls/augment/com/AtomicWorkbenchWindowPresentationActivityCases.java'
    old=member(sources[filename],signature);new=transform(old)
    if old==new:raise AssertionError('Unchanged actual-method mutation '+signature)
    return changed(sources,filename,old,new)


def negative_controls(folder, policy, activity):
    policy_file='ls/augment/com/AtomicWorkbenchWindowPresentationPolicy.java'
    mutations=[]
    def pm(name,old,new,witness):mutations.append((name,changed(policy,policy_file,old,new),'ls.augment.com.AtomicWorkbenchWindowPresentationIntegrationCases',witness))
    def am(name,signature,old,new,witness,occurrences=1):
        def transform(text):
            if text.count(old)!=occurrences:raise AssertionError('Actual mutation anchor changed: '+name)
            return text.replace(old,new,occurrences)
        mutations.append((name,method_change(activity,signature,transform),'ls.augment.com.AtomicWorkbenchWindowPresentationActivityCases',witness))
    pm('old-continuation-cancel', 'if (current(receipt)) activeReceipt = null;',
       'if (receipt != null && activeReceipt != null && receipt.id == activeReceipt.id) activeReceipt = null;', 'stale continuation closed current focus receipt')
    pm('old-confirm-retires-current', 'if (!current(receipt) || receipt.sessionGeneration != session || receipt.uiEpoch != epoch) return false;',
       'if (!current(receipt) || receipt.sessionGeneration != session || receipt.uiEpoch != epoch) { if (receipt != null && activeReceipt != null && receipt.id == activeReceipt.id) activeReceipt = null; return false; }', 'stale continuation closed current focus receipt')
    pm('role-ABA-without-generation', 'if (!observed.equals(roles)) { roles = observed; roleGeneration++; activeReceipt = null; }',
       'if (!observed.equals(roles)) { roles = observed; }', 'stale focus receipt flipped: role_ABA')
    pm('consume-without-TTL', 'boolean valid = stillAuthenticated && fresh(key.triggered, now, pendingMaxAge);',
       'boolean valid = stillAuthenticated;', 'stale entry side consumed')
    pm('entry-dedup-removed', 'if (seenEntries.containsKey(key)) return Offer.DUPLICATE;',
       'if (false) return Offer.DUPLICATE;', 'duplicate entry reissued')
    pm('same-main-also-flips', 'accepted && receipt.sidePromotion && !receipt.startedDual && receipt.sourceMainId != receipt.targetId',
       'accepted', 'same main focus flipped direction')
    pm('lease-generation-ignored', 'receipt.lease != null && receipt.lease.equals(actual)',
       'receipt.lease != null', 'stale display lease flipped')
    pm('proposal-premature-flip', 'activeReceipt = copy(receipt, receipt.sessionGeneration, receipt.uiEpoch, after, receipt.lease);',
       'railSide = railSide == AtomicWorkbenchWindowLayoutPlan.RailSide.RIGHT ? AtomicWorkbenchWindowLayoutPlan.RailSide.LEFT : AtomicWorkbenchWindowLayoutPlan.RailSide.RIGHT; activeReceipt = copy(receipt, receipt.sessionGeneration, receipt.uiEpoch, after, receipt.lease);', 'launch proposal flipped before real focus')
    am('physical-place-replaced-by-START','private void place(',
       'layout.gravity = Gravity.TOP | Gravity.LEFT;', 'layout.gravity = Gravity.TOP | Gravity.START;', 'settled main not input-ready')
    am('main-input-origin-cache-lost','private void prepareMainLayout(',
       'mainLayoutLeft = left;', 'mainLayoutLeft = 0;', 'settled main not input-ready')
    am('overlay-uses-old-origin','private void layoutWorkspace()',
       'message.leftMargin = mainBounds.left;', 'message.leftMargin = 0;', 'actual overlay origin wrong')
    am('first-layout-swipe-sign-stale','private void layoutWorkspace()',
       'RailSide.LEFT ? -1 : 1', 'RailSide.LEFT ? 1 : -1', 'first layout outward sign stale')
    # Reproduce the observed helper bug: changing roles before stale/null receipt is rejected.
    guard=member(activity['ls/augment/com/AtomicWorkbenchWindowPresentationActivityCases.java'],'private boolean confirmPresentationPromotion(')
    start=guard.index('        if (!presentationPolicy.eligible(');end=guard.index('        if (!model.promote(',start)
    am('stale-helper-promotes-before-check','private boolean confirmPresentationPromotion(',guard[start:end], '', 'duplicate helper promotion not rejected')
    am('success-status-mistaken-for-focus-ACK','private Receipt bindPresentationReply(',
       '|| response.getInt("focused_window_id", -2) != id', '', 'unbound Root reply accepted')
    am('HOME-geometry-proof-skipped','private boolean completeHomePresentation()',
       'boolean configuredGeometry = slot.surface.isFrameFromConfiguredGeometry();', 'boolean configuredGeometry = true;', 'HOME not-ready frame promoted')
    restore=member(activity['ls/augment/com/AtomicWorkbenchWindowPresentationActivityCases.java'],'private void acceptTaskReply(')
    start=restore.index('                    if (!presentationPolicy.eligible(');end=restore.index('                    model.setHostedWindow(',start)
    am('late-RESTORE-promotes-stale-role','private void acceptTaskReply(',restore[start:end], '', 'late RESTORE query stole current main')
    am('entry-authentication-bypassed','private String entryProblem(',
       '        if (proof == null)', '        if (SystemClock.elapsedRealtime() >= 0) return "";\n        if (proof == null)', 'expired queued entry changed work or survived')
    am('OPEN-before-direction-admission','private void tryIncoming()',
       'if (pendingLayoutProof != null) return;', '', 'task proposal escaped pending side admission')
    am('launch-OPEN-ACK-premature-flip','private void launchSourceApp(',
       'final Receipt launchPresentation = proposalPresentation(launchBefore);',
       'final Receipt launchPresentation = proposalPresentation(launchBefore); presentationPolicy.confirm(launchPresentation,sessionGeneration,epoch+1,presentationRoles(),presentationLease(plan.windowId));', 'launch precommit incorrectly flipped or dispatched synchronously')
    am('late-entry-after-authorization-not-rechecked','private void launchSourceApp(',
       'if (proof != null || taskId > 0) requireCurrentEntry(proof);\n                    if (mediaOpen', 'if (mediaOpen', 'late original-task entry dispatched an OPEN/focus/cleanup')
    am('automatic-focus-window-ignores-proof','private void focusWindow(int id, EntryProof proof)',
       'if (proof != null) requireCurrentEntry(proof);', '', 'expired automatic existing-app entry dispatched focus or changed role',occurrences=2)
    am('automatic-focus-app-ignores-proof','private void focusSourceAppWindow(',
       'if (proof != null) requireCurrentEntry(proof);', '', 'expired automatic existing-app entry dispatched focus or changed role',occurrences=2)
    am('old-media-selection-launches-after-new-entry','private void runMediaAction(',
       'if (entryGeneration != presentationPolicy.entryGeneration())', 'if (false && entryGeneration != presentationPolicy.entryGeneration())', 'old media selection opened or kept busy')
    am('old-task-snapshot-consumer-runs-after-new-entry','private void readTaskSnapshot(',
       'if (entryGeneration != presentationPolicy.entryGeneration())', 'if (false && entryGeneration != presentationPolicy.entryGeneration())', 'late snapshot callback launched task or chooser')
    am('layout-mutates-task','private void layoutWorkspace()',
       'workspace.setClipChildren(true);', 'workspace.setClipChildren(true); client.closeWindow(roles.mainId);', 'presentation triggered task mutation')
    am('layout-resizes-native-buffer','private void layoutWorkspace()',
       'for (Slot slot : slots) slot.fitSurface();', 'for (Slot slot : slots) { slot.surface.getHolder().setFixedSize(5,5); slot.fitSurface(); }', 'presentation resized native buffer')
    failures=[]
    for index,(name,sources,runner,witness) in enumerate(mutations):
        try:
            result=compile_run(folder/str(index),sources,runner)
            output=result.stdout+result.stderr
            if result.returncode==0 or 'java.lang.AssertionError' not in output or witness not in output:
                failures.append(name+' did not fail at required behavioral witness '+witness+'\n'+output)
                print('NEGATIVE CONTROL INVALID '+name,flush=True)
            else:print('NEGATIVE CONTROL KILLED '+name+': '+witness,flush=True)
        except Exception as error:
            failures.append(name+' failed compilation or execution boundary: '+str(error))
    if failures:raise AssertionError('Negative controls are not accepted:\n'+'\n'.join(failures))
    return len(mutations)


def sdk(folder):
    files=[SRC/name for name in FILES+['AtomicWorkbenchActivity.java','AtomicWorkbenchClient.java','AtomicWorkbenchProtocol.java']]
    files+=sorted(SRC.glob('AtomicWorkbenchTaskReference*.java'))
    cp=[ROOT/'audit-output/android-sdk/platforms/android-36/android.jar',
        ROOT/'android/app/build/intermediates/javac/debug/compileDebugJavaWithJavac/classes',
        ROOT/'android/app/build/intermediates/compile_and_runtime_not_namespaced_r_class_jar/debug/processDebugResources/R.jar']
    result=subprocess.run([str(JDK/'javac.exe'),'-J-Duser.language=en','-J-Dfile.encoding=UTF-8','--release','17','-encoding','UTF-8','-classpath',os.pathsep.join(map(str,cp)),'-d',str(folder),*map(str,files)],capture_output=True,text=True,encoding='utf-8',errors='replace',timeout=90)
    if result.returncode:raise AssertionError(result.stdout+result.stderr)
    print('ACTUAL ACTIVITY/POLICIES/CLIENT/PROTOCOL/REFERENCE UI SDK36 PASS '+str(len(files))+' source files')


# External dependency adaptation; the new physical hold behavior is tested separately by its owner.
_HOLD_SIGNATURES=['private static final class NativeShieldLayoutHold', 'private void beginNativeShieldLayout(', 'private boolean nativeShieldLayoutCurrent(', 'private boolean deferNativeShieldLayout()', 'private boolean acceptNativeShieldClick(', 'private void cancelNativeShieldLayout(', 'private void retireNativeShieldLayout(', 'private void finishNativeShieldTouch(', 'private void postNativeShieldLayoutFlush(', 'private void nativeShieldLayoutDiagnostic(']
_HOLD_FIELDS='\n NativeShieldLayoutHold nativeShieldLayoutHold;boolean nativeShieldLayoutDeferred,nativeShieldDispatchingUp;\n long nativeShieldTouchSequence,nativeShieldDownTime,nativeShieldEventTime;\n static final java.util.concurrent.atomic.AtomicInteger NATIVE_SHIELD_DIAGNOSTIC_PENDING=new java.util.concurrent.atomic.AtomicInteger();\n static final java.util.concurrent.atomic.AtomicLong NATIVE_SHIELD_DIAGNOSTIC_DROPPED=new java.util.concurrent.atomic.AtomicLong();\n'

VIEW=VIEW.rsplit('}',1)[0]+'public void cancelPendingInputEvents(){}}'
_original_activity_sources=activity_sources
def activity_sources():
 sources=_original_activity_sources()
 key='ls/augment/com/AtomicWorkbenchWindowPresentationActivityCases.java'
 text=sources[key]
 source=(SRC / "AtomicWorkbenchActivity.java").read_text(encoding='utf-8')
 text=text.replace('final AtomicWorkbenchWorkspaceModel model=',_HOLD_FIELDS+'boolean hostTouchActive,hostDragActive;\n'+'final AtomicWorkbenchWorkspaceModel model=',1)
 text=text.replace('void post(Runnable r){q.add(r);}', 'boolean post(Runnable r){q.add(r);return true;}',1)
 text=text.replace('// ACTUAL_METHODS','// ACTUAL_METHODS',1) if '// ACTUAL_METHODS' in text else text
 # The original assembly already inserted its methods; append the exact new dependency closure inside the host class.
 marker=' static void layoutCases()throws Exception{'
 assert text.count(marker)==1,'original Activity fixture insertion boundary changed'
 text=text.replace(marker,'\n'.join(member(source,s) for s in _HOLD_SIGNATURES)+'\n'+marker,1)
 sources[key]=text
 sources['android/view/MotionEvent.java']='package android.view;public class MotionEvent{public static final int ACTION_CANCEL=3;public long getDownTime(){return 1000;}public long getEventTime(){return 1000;}public int getActionMasked(){return ACTION_CANCEL;}}'
 return sources

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--negative-controls',action='store_true');p.add_argument('--host-only',action='store_true');a=p.parse_args()
    source_files=[SRC/name for name in FILES+['AtomicWorkbenchTaskUiSnapshot.java','AtomicWorkbenchMediaOpenRequest.java','AtomicWorkbenchConfig.java','AtomicWorkbenchActivity.java','AtomicWorkbenchTaskIdentity.java','AtomicWorkbenchTaskOperationRequest.java','AtomicWorkbenchTaskOperationResult.java','AtomicWorkbenchClient.java','AtomicWorkbenchProtocol.java']]
    source_files+=sorted(SRC.glob('AtomicWorkbenchTaskReference*.java'))
    source_files+=[Path(__file__).resolve(),FIXTURE,ROOT/'tools/fixtures/AtomicWorkbenchWindowPresentationActivityCases.java']
    before={str(path):hashlib.sha256(path.read_bytes()).hexdigest() for path in source_files}
    policy=policy_sources();activity=activity_sources()
    with tempfile.TemporaryDirectory(prefix='duo-window-presentation-integration-') as tmp:
        run=compile_run(Path(tmp)/'policy',policy,'ls.augment.com.AtomicWorkbenchWindowPresentationIntegrationCases');print(run.stdout,end='',flush=True)
        if run.returncode:raise AssertionError(run.stdout+run.stderr)
        run=compile_run(Path(tmp)/'activity',activity,'ls.augment.com.AtomicWorkbenchWindowPresentationActivityCases');print(run.stdout,end='',flush=True)
        if run.returncode:raise AssertionError(run.stdout+run.stderr)
        if a.negative_controls:print('NEGATIVE CONTROLS RESULT '+str(negative_controls(Path(tmp)/'mutants',policy,activity))+' compiled behavioral mutants killed',flush=True)
        if not a.host_only:sdk(Path(tmp)/'sdk')
    if any(before[str(path)]!=hashlib.sha256(path.read_bytes()).hexdigest() for path in source_files):raise AssertionError('Sources changed during integration verification')
    print('SOURCE IDENTITY STABLE; ACTUAL METHODS AND POLICIES VERIFIED OFFLINE; DEVICE UI/ROOT/BINDER ACCEPTANCE PENDING')



# Real freshness predicate, with a mutable typed PackageManager catalog boundary.
# The old tests create catalog candidates through their original constructor.
_app_activity_sources=activity_sources
def app_activity_sources():
    result=_app_activity_sources()
    source=(SRC/'AtomicWorkbenchAppRepository.java').read_text(encoding='utf-8')
    result['ls/augment/com/AtomicWorkbenchAppListModel.java']=(SRC/'AtomicWorkbenchAppListModel.java').read_text(encoding='utf-8')
    key='ls/augment/com/AtomicWorkbenchWindowPresentationActivityCases.java'
    text=result[key]
    original=member(text,'static final class AtomicWorkbenchAppRepository')
    app=member(source,'static final class App extends AtomicWorkbenchAppListModel.Item')
    app=app.rsplit('}',1)[0]+'App(String p,String c){this(new ComponentName(p,c),"fixture application",null,p,10001,1L);android.content.pm.PackageManager.add(component,uid,firstInstallTime);}}'
    actual='static final class AtomicWorkbenchAppRepository{'+app+member(source,'static boolean allowed(')+member(source,'static boolean current(')+'}'
    assert text.count(original)==1
    text=text.replace(original,actual,1).replace('import android.os.Bundle;','import android.os.Bundle;import android.content.Context;import android.content.Intent;import android.content.pm.*;import android.graphics.drawable.Drawable;',1)
    result[key]=text
    result['android/content/Context.java']='package android.content;public class Context{private final android.content.pm.PackageManager pm=new android.content.pm.PackageManager();public android.content.pm.PackageManager getPackageManager(){return pm;}public String getPackageName(){return "ls.augment.com";}}'
    result['android/content/ComponentName.java']=result['android/content/ComponentName.java'].rsplit('}',1)[0]+'public String getClassName(){return c;}}'
    result['android/content/Intent.java']=result['android/content/Intent.java'].rsplit('}',1)[0]+r'''
public static final String ACTION_MAIN="android.intent.action.MAIN",CATEGORY_LAUNCHER="android.intent.category.LAUNCHER";
public String action,pkg;public final java.util.Set<String>categories=new java.util.HashSet<>();public Intent(String action){this.action=action;}public Intent addCategory(String category){categories.add(category);return this;}public Intent setPackage(String value){pkg=value;return this;}}
'''
    result['android/graphics/drawable/Drawable.java']='package android.graphics.drawable;public class Drawable{}'
    result['android/content/pm/ApplicationInfo.java']='package android.content.pm;public class ApplicationInfo{public int uid;public boolean enabled=true;}'
    result['android/content/pm/ActivityInfo.java']='package android.content.pm;public class ActivityInfo{public ApplicationInfo applicationInfo;public boolean enabled=true,exported=true;public String packageName,name,permission;}'
    result['android/content/pm/PackageInfo.java']='package android.content.pm;public class PackageInfo{public long firstInstallTime;}'
    result['android/content/pm/ResolveInfo.java']='package android.content.pm;public class ResolveInfo{public ActivityInfo activityInfo;}'
    result['android/content/pm/PackageManager.java']=r'''
package android.content.pm;import android.content.*;import java.util.*;public class PackageManager{
 public static class NameNotFoundException extends Exception{}
 public static final Map<String,ActivityInfo> activities=new LinkedHashMap<>();public static final Map<String,PackageInfo>packages=new LinkedHashMap<>();
 public static void add(ComponentName component,int uid,long install){ApplicationInfo owner=new ApplicationInfo();owner.uid=uid;ActivityInfo activity=new ActivityInfo();activity.applicationInfo=owner;activity.packageName=component.getPackageName();activity.name=component.getClassName();activities.put(component.flattenToString(),activity);PackageInfo pkg=new PackageInfo();pkg.firstInstallTime=install;packages.put(activity.packageName,pkg);}
 public ActivityInfo getActivityInfo(ComponentName component,int flags)throws NameNotFoundException{ActivityInfo found=activities.get(component.flattenToString());if(found==null)throw new NameNotFoundException();return found;}
 public PackageInfo getPackageInfo(String pkg,int flags)throws NameNotFoundException{PackageInfo found=packages.get(pkg);if(found==null)throw new NameNotFoundException();return found;}
 public java.util.List<ResolveInfo>queryIntentActivities(Intent query,int flags){if(!Intent.ACTION_MAIN.equals(query.action)||!query.categories.contains(Intent.CATEGORY_LAUNCHER))throw new AssertionError("wrong real launcher query");ArrayList<ResolveInfo>found=new ArrayList<>();for(ActivityInfo activity:activities.values())if(query.pkg==null||query.pkg.equals(activity.packageName)){ResolveInfo result=new ResolveInfo();result.activityInfo=activity;found.add(result);}return found;}
}
'''
    return result
activity_sources=app_activity_sources



# Compile the real shared wrapper/notification DTO. Preserve the old controlled
# media/Root endpoint boundary; original cases never dispatch a notification.
_media_activity_sources=activity_sources
def notification_activity_sources():
    result=_media_activity_sources()
    for name in ['AtomicWorkbenchWorkspaceOpenRequest.java','AtomicWorkbenchNotificationOpenRequest.java']:
        result['ls/augment/com/'+name]=(SRC/name).read_text(encoding='utf-8')
    key='ls/augment/com/AtomicWorkbenchWindowPresentationActivityCases.java';text=result[key]
    old='static class AtomicWorkbenchClient{';assert text.count(old)==1
    text=text.replace(old,'static class AtomicWorkbenchClient extends ls.augment.com.AtomicWorkbenchClient{',1)
    extra_methods=r"""
Bundle openNotificationWindow(int id,android.view.Surface s,int w,int h,int density,ComponentName c,AtomicWorkbenchNotificationOpenRequest target)throws Exception{throw new AssertionError("notification dispatch outside original presentation cases");}
Bundle focusNotificationWindow(int id,ComponentName c,AtomicWorkbenchNotificationOpenRequest target)throws Exception{throw new AssertionError("notification dispatch outside original presentation cases");}
"""
    client=member(text,'static class AtomicWorkbenchClient extends')
    text=text.replace(client,client.rsplit('}',1)[0]+extra_methods+'}',1)
    text=text.replace('// ACTUAL_METHODS','// ACTUAL_METHODS',1)
    # Called only by the notification branch of the actual shared predicate.
    at=text.index('boolean mediaOpenDescriptorCurrent(')
    text=text[:at]+'boolean notificationOpenDescriptorCurrent(Bundle b,String id){throw new AssertionError("notification identity outside original media cases");}\n '+text[at:]
    result[key]=text
    result['ls/augment/com/AtomicWorkbenchClient.java']=r"""package ls.augment.com;import android.os.Bundle;import android.view.Surface;import android.content.ComponentName;
abstract class AtomicWorkbenchClient{
 abstract Bundle openMediaWindow(int id,Surface s,int w,int h,int d,ComponentName c,AtomicWorkbenchMediaOpenRequest target)throws Exception;
 abstract Bundle focusMediaWindow(int id,ComponentName c,AtomicWorkbenchMediaOpenRequest target)throws Exception;
 abstract Bundle openNotificationWindow(int id,Surface s,int w,int h,int d,ComponentName c,AtomicWorkbenchNotificationOpenRequest target)throws Exception;
 abstract Bundle focusNotificationWindow(int id,ComponentName c,AtomicWorkbenchNotificationOpenRequest target)throws Exception;
}
"""
    return result
activity_sources=notification_activity_sources

_CAPACITY_JSON=ROOT/'audit-output/release-test20497/dependencies/json-20240303.jar'
_CAPACITY_FIXTURE='package ls.augment.com;import android.os.Bundle;import java.util.*;\nfinal class CapacityFixtureState {\n static Bundle owner(int id,Bundle actual){\n  Bundle b=actual==null?new Bundle():new Bundle(actual);b.putInt("window_id",id);\n  if(!b.containsKey("display_id"))b.putInt("display_id",-1);\n  if(!b.containsKey("success"))b.putBoolean("success",true);\n  if(!b.containsKey("state"))b.putString("state","closed");\n  for(String k:new String[]{"window_session","display_name","display_unique_id"})if(!b.containsKey(k))b.putString(k,"");\n  for(String k:new String[]{"recovery_pending","operation_unconfirmed","task_recovery_pending","input_focus_cleanup_pending","guard_cleanup_pending","input_cancel_pending","input_rebind_pending","output_transition_pending"})if(!b.containsKey(k))b.putBoolean(k,false);\n  if(!b.containsKey("output_attached_known"))b.putBoolean("output_attached_known",true);\n  if(!b.containsKey("output_attached"))b.putBoolean("output_attached",false);\n  if(!b.containsKey("task_count"))b.putInt("task_count",0);return b;\n }\n static Bundle raw(Bundle envelope,Map<Integer,Bundle> actual){\n  Bundle b=new Bundle(envelope);ArrayList<Bundle> states=new ArrayList<>();\n  boolean success=!Boolean.FALSE.equals(b.get("success")),pending=Boolean.TRUE.equals(b.get("recovery_pending")),unknown=Boolean.TRUE.equals(b.get("operation_unconfirmed"));\n  for(int id=0;id<AtomicWorkbenchSlotDomain.POOL_SIZE;id++){\n   Bundle state=owner(id,actual.get(id));states.add(state);success&=state.getBoolean("success");pending|=state.getBoolean("recovery_pending");unknown|=state.getBoolean("operation_unconfirmed");\n  }\n  b.putBoolean("success",success);b.putBoolean("recovery_pending",pending);b.putBoolean("operation_unconfirmed",unknown);\n  b.putParcelableArrayList("windows",states);b.putBundle("legacy_recovery",owner(-1,null));return b;\n }\n}'

# Strict full-pool/hidden-output dependencies. No real high display is created.
_capacity_activity_sources=activity_sources
def activity_sources():
    result=_capacity_activity_sources()
    source=(SRC/'AtomicWorkbenchActivity.java').read_text(encoding='utf-8')
    key='ls/augment/com/AtomicWorkbenchWindowPresentationActivityCases.java';text=result[key]
    for name in ['AtomicWorkbenchSlotDomain.java','AtomicWorkbenchRecoveryScope.java','AtomicWorkbenchProtocol.java']:
        result['ls/augment/com/'+name]=(SRC/name).read_text(encoding='utf-8')
    marker=' static void layoutCases()throws Exception{'
    signatures=['private boolean outputPresented(', 'private static final class FocusOutput', 'private FocusOutput captureFocusOutput(', 'private boolean focusOutputCurrent(', 'private Bundle attachFocusOutput(', 'private static Bundle focusOutputFailure(', 'private static ArrayList<Bundle> poolWindowsOrNull(', 'private static Bundle poolStatus(', 'private static Bundle findWindow(', 'private static Bundle outputIdentity(']
    assert text.count(marker)==1
    text=text.replace(marker,'\n'.join(member(source,s) for s in signatures)+'\n'+marker,1)
    text=text.replace('final AtomicWorkbenchWorkspaceModel model=', 'static final int COUNT=AtomicWorkbenchWorkspaceModel.WINDOW_COUNT;String[] pendingTaskAllocations=new String[COUNT];long outputTransition,outputSequence;\nfinal AtomicWorkbenchWorkspaceModel model=',1)
    text=text.replace('new Slot(0),new Slot(1),new Slot(2),new Slot(3)', 'new Slot(0),new Slot(1),new Slot(2),new Slot(3),new Slot(4),new Slot(5),new Slot(6),new Slot(7)',1)
    text=text.replace('new boolean[4]', 'new boolean[COUNT]')
    text=text.replace(marker,'static android.view.Surface duplicateOutput(android.view.Surface original){if(original==null||!original.isValid())return null;return new android.view.Surface();}\n'+marker,1)
    client=member(text,'static class AtomicWorkbenchClient extends')
    extra=r"""
final java.util.Map<Integer,Bundle> capacityRows=new java.util.LinkedHashMap<>();
Bundle status(){return AtomicWorkbenchProtocol.recoveryState(CapacityFixtureState.raw(new Bundle(),capacityRows),AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8);}
Bundle updateOutput(int id,Bundle expected,long sequence,android.view.Surface output){throw new AssertionError("hidden output ACK is not configured in these original default-three cases");}
static java.util.ArrayList<Bundle> recoveryPoolWindows(Bundle b){return AtomicWorkbenchProtocol.recoveryPoolWindows(b);}
"""
    text=text.replace(client,client.rsplit('}',1)[0]+extra+'}',1);result[key]=text
    result['ls/augment/com/CapacityFixtureState.java']=_CAPACITY_FIXTURE
    result['android/view/Surface.java']='package android.view;public class Surface{public boolean valid=true;public int releases;public boolean isValid(){return valid;}public void release(){releases++;}}'
    bundle=result['android/os/Bundle.java']
    if 'getInt(String k)' not in bundle:bundle=bundle.rsplit('}',1)[0]+'public int getInt(String k){return getInt(k,0);}}'
    if ' deepCopy()' not in bundle:
        bundle=bundle.rsplit('}',1)[0]+r"""public Bundle deepCopy(){Bundle b=new Bundle();for(String k:m.keySet())b.m.put(k,copyValue(m.get(k)));return b;}private static Object copyValue(Object v){if(v instanceof Bundle)return ((Bundle)v).deepCopy();if(v instanceof java.util.ArrayList<?>){java.util.ArrayList<Object> list=new java.util.ArrayList<>();for(Object x:(java.util.ArrayList<?>)v)list.add(copyValue(x));return list;}return v;}}"""
    result['android/os/Bundle.java']=bundle
    return result

if __name__=='__main__':main()
