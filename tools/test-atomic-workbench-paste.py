"""Exercise the production text-drop policy/coordinator/service; no phone or clipboard backend."""
from pathlib import Path
import argparse
import runpy
import subprocess
import tempfile
import xml.etree.ElementTree as ET

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-focus-window-hook.py")))
SUPPORT = BASE["SUPPORT"]
MODELS = ["AtomicWorkbenchPasteRequest.java", "AtomicWorkbenchPasteResult.java", "AtomicWorkbenchPastePolicy.java",
          "AtomicWorkbenchPasteCoordinator.java", "AtomicWorkbenchEditorEvidence.java", "AtomicWorkbenchPasteService.java"]
SOURCES = {
 "android/os/IBinder.java": '''package android.os;public interface IBinder {boolean isBinderAlive();default boolean transact(int code,Parcel data,Parcel reply,int flags)throws Exception{return false;}}''',
 "android/os/Parcel.java": '''package android.os;public class Parcel {public java.util.ArrayList<Object> values=new java.util.ArrayList<>();public int cursor;public static Parcel obtain(){return new Parcel();}public void recycle(){}public void writeInt(int v){values.add(v);}public int readInt(){return (Integer)values.get(cursor++);}public void writeLong(long v){values.add(v);}public long readLong(){return (Long)values.get(cursor++);}public void writeString(String v){values.add(v);}public String readString(){return (String)values.get(cursor++);}public void writeInterfaceToken(String s){writeString(s);}public void enforceInterface(String s){if(!s.equals(readString()))throw new SecurityException();}public void writeNoException(){writeInt(0);}public void readException(){if(readInt()!=0)throw new SecurityException();}public int dataAvail(){return values.size()-cursor;}public int dataSize(){return values.toString().length()*2;}public void setDataPosition(int p){cursor=p;}}''',
 "android/os/SystemClock.java": 'package android.os;public class SystemClock {public static long time=1000;public static long elapsedRealtime(){return time;}}',
 "android/os/Bundle.java": '''package android.os;public class Bundle extends java.util.HashMap<String,Object> {public Bundle(){}public Bundle(Bundle other){super(other);}public void putInt(String k,int v){put(k,v);}public int getInt(String k){return getInt(k,0);}public int getInt(String k,int d){return containsKey(k)?(Integer)get(k):d;}public void putLong(String k,long v){put(k,v);}public long getLong(String k,long d){return containsKey(k)?(Long)get(k):d;}public void putString(String k,String v){put(k,v);}public String getString(String k){return (String)get(k);}public void putBoolean(String k,boolean v){put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(get(k));}public void putBundle(String k,Bundle v){put(k,v);}public Bundle getBundle(String k){return (Bundle)get(k);}}''',
 "android/os/Looper.java": 'package android.os;public class Looper {static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return MAIN;}}',
 "android/os/Handler.java": 'package android.os;public class Handler {public Handler(Looper l){}public boolean post(Runnable r){r.run();return true;}}',
 "android/content/Intent.java": 'package android.content;public class Intent {}',
 "android/util/SparseArray.java": 'package android.util;public class SparseArray<T> extends java.util.HashMap<Integer,T> {public T get(int k){return super.get(k);}public void put(int k,T v){super.put(k,v);}}',
 "android/view/inputmethod/EditorInfo.java": 'package android.view.inputmethod;public class EditorInfo {public String packageName="example.editor";public int inputType=1,fieldId;}',
 "android/view/inputmethod/SurroundingText.java": 'package android.view.inputmethod;public class SurroundingText {final CharSequence text;final int start,end,offset;public SurroundingText(CharSequence t,int s,int e,int o){text=t;start=s;end=e;offset=o;}public CharSequence getText(){return text;}public int getSelectionStart(){return start;}public int getSelectionEnd(){return end;}public int getOffset(){return offset;}}',
 "android/accessibilityservice/AccessibilityServiceInfo.java": 'package android.accessibilityservice;public class AccessibilityServiceInfo {public static final int FLAG_INPUT_METHOD_EDITOR=32768,FLAG_RETRIEVE_INTERACTIVE_WINDOWS=64,CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT=1;public int flags=32768;public int getCapabilities(){return 0;}}',
 "android/accessibilityservice/AccessibilityService.java": '''package android.accessibilityservice;public abstract class AccessibilityService {public static android.util.SparseArray<java.util.List<android.view.accessibility.AccessibilityWindowInfo>> windows=new android.util.SparseArray<>();public AccessibilityServiceInfo getServiceInfo(){return new AccessibilityServiceInfo();}protected void onServiceConnected(){}public InputMethod onCreateInputMethod(){return null;}public abstract void onAccessibilityEvent(android.view.accessibility.AccessibilityEvent event);public abstract void onInterrupt();public boolean onUnbind(android.content.Intent i){return false;}public void onDestroy(){}public android.util.SparseArray<java.util.List<android.view.accessibility.AccessibilityWindowInfo>> getWindowsOnAllDisplays(){return windows;}}''',
 "android/accessibilityservice/InputMethod.java": '''package android.accessibilityservice;public class InputMethod {public static AccessibilityInputConnection connection;public static int getterCalls;public InputMethod(AccessibilityService s){}public AccessibilityInputConnection getCurrentInputConnection(){getterCalls++;return connection;}public boolean getCurrentInputStarted(){return true;}public void onStartInput(android.view.inputmethod.EditorInfo info,boolean restart){}public void onFinishInput(){}public static abstract class AccessibilityInputConnection {public abstract android.view.inputmethod.SurroundingText getSurroundingText(int before,int after,int flags);public abstract void commitText(CharSequence text,int cursor,Object attribute);}}''',
 "android/view/accessibility/AccessibilityEvent.java": 'package android.view.accessibility;public class AccessibilityEvent {public int getEventType(){return 0;}public int getWindowId(){return -1;}}',
 "android/view/accessibility/AccessibilityWindowInfo.java": '''package android.view.accessibility;public class AccessibilityWindowInfo {public static final int TYPE_APPLICATION=1;public int display=88,id=71,type=1;public boolean focused=true;public AccessibilityNodeInfo root;public int getDisplayId(){return display;}public int getId(){return id;}public int getType(){return type;}public boolean isFocused(){return focused;}public AccessibilityNodeInfo getRoot(int flags){if(flags!=0)throw new AssertionError("prefetched full node tree");return root;}}''',
 "android/view/accessibility/AccessibilityNodeInfo.java": '''package android.view.accessibility;public class AccessibilityNodeInfo {public static final int FOCUS_INPUT=1;public int window=71,identity=1,type=1,start=2,end=2;public boolean editable=true,focused=true,visible=true,password,valid=true,hint;public CharSequence text="甲乙丙丁";public boolean isShowingHintText(){return hint;}public CharSequence getText(){return text;}public String pkg="example.editor";public AccessibilityNodeInfo focus;public AccessibilityNodeInfo findFocus(int kind){return focus==null?this:focus;}public int getWindowId(){return window;}public boolean isEditable(){return editable;}public boolean isFocused(){return focused;}public boolean isVisibleToUser(){return visible;}public boolean isPassword(){return password;}public int getInputType(){return type;}public CharSequence getPackageName(){return pkg;}public boolean refresh(){return valid;}public int getTextSelectionStart(){return start;}public int getTextSelectionEnd(){return end;}public boolean equals(Object o){return o instanceof AccessibilityNodeInfo n&&n.window==window&&n.identity==identity;}public int hashCode(){return window*31+identity;}}''',
}

# Editing regressions deliberately isolate the new read-only subsystem. Its real implementation
# is compiled and exercised by test-atomic-workbench-extraction.py, never replaced there.
SOURCES.update({
 "ls/augment/com/AtomicWorkbenchExtractionSystemBridge.java": 'package ls.augment.com;final class AtomicWorkbenchExtractionSystemBridge{static void connect(AtomicWorkbenchPasteService s){}static void disconnect(AtomicWorkbenchPasteService s){}}',
 "ls/augment/com/AtomicWorkbenchExtractionRequest.java": 'package ls.augment.com;final class AtomicWorkbenchExtractionRequest{}',
 "ls/augment/com/AtomicWorkbenchExtractionResult.java": 'package ls.augment.com;final class AtomicWorkbenchExtractionResult{enum State{UNAVAILABLE}static AtomicWorkbenchExtractionResult failure(AtomicWorkbenchExtractionRequest r,State s){return new AtomicWorkbenchExtractionResult();}}',
 "ls/augment/com/AtomicWorkbenchExtractionEngine.java": '''package ls.augment.com;final class AtomicWorkbenchExtractionEngine {AtomicWorkbenchExtractionEngine(android.accessibilityservice.AccessibilityService s,java.util.concurrent.Executor e){}boolean submit(AtomicWorkbenchExtractionRequest r,java.util.function.Consumer<AtomicWorkbenchExtractionResult> cb){throw new AssertionError("paste path attempted extraction");}void cancel(String id){}void event(int t,int w){}void interrupt(){}void close(){}}''',
})

# Native node focus metadata/actions; existing editor/IC tests retain their original defaults.
SOURCES["android/view/accessibility/AccessibilityNodeInfo.java"]=SOURCES["android/view/accessibility/AccessibilityNodeInfo.java"].replace('public static final int FOCUS_INPUT=1;', 'public static final int FOCUS_INPUT=1,ACTION_FOCUS=1;public boolean enabled=true;public int focusActions;public Runnable onFocus,onRefresh;public java.util.List<AccessibilityNodeInfo> children=new java.util.ArrayList<>();public boolean isEnabled(){return enabled;}public int getChildCount(){return children.size();}public AccessibilityNodeInfo getChild(int i){return children.get(i);}public boolean performAction(int action){if(action!=ACTION_FOCUS||!enabled)return false;focusActions++;focused=true;if(onFocus!=null)onFocus.run();return true;}').replace('public boolean refresh(){return valid;}', 'public boolean refresh(){if(onRefresh!=null)onRefresh.run();return valid;}')

TEST = r'''package ls.augment.com;
import java.util.*;import java.util.concurrent.*;import android.os.*;import android.accessibilityservice.*;import android.view.accessibility.*;import android.view.inputmethod.*;
public final class TestPaste {
 static int cases,checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}interface Case{void run()throws Exception;}static void test(String n,Case c)throws Exception{SystemClock.time=1000;c.run();cases++;System.out.println("PASS text drop: "+n);}
 static AtomicWorkbenchPasteRequest request(){return request("0123456789abcdef0123456789abcdef","新");}
 static AtomicWorkbenchPasteRequest request(String id,String text){return new AtomicWorkbenchPasteRequest(id,7,2,4,0,88,"DuoAtomic-10055-w0-12345678-1234-1234-1234-123456789abc","virtual:root,88",0,10055,10101,42,"example.editor","source1",3,text,1000,6000);}
 static AtomicWorkbenchEditorEvidence evidence(){var r=request();return new AtomicWorkbenchEditorEvidence(r.windowId,r.displayId,r.displayName,r.displayUniqueId,r.userId,r.moduleUid,r.targetUid,r.taskId,r.packageName,71,"11111111111111111111111111111111","22222222222222222222222222222222",1,0,1000);}
 static final class Fixture implements AtomicWorkbenchPasteCoordinator.Backend,AtomicWorkbenchPasteCoordinator.Editor,AtomicWorkbenchPasteCoordinator.Host {
  String body="甲乙丙丁";int start=2,end=2,commits,reads,validations,releases;boolean current=true,ignore,throwAfter,prepareFailure,restore=true,closeFailure;Runnable readHook,commitHook;AtomicWorkbenchEditorEvidence proof=evidence();
  final AtomicWorkbenchPasteCoordinator coordinator=new AtomicWorkbenchPasteCoordinator(SystemClock::elapsedRealtime,this,Runnable::run,Runnable::run);
  AtomicWorkbenchPasteResult result;AtomicWorkbenchPasteResult run(AtomicWorkbenchPasteRequest r){coordinator.submit(r,this,v->result=v);return result;}
  public AtomicWorkbenchEditorEvidence prepare(AtomicWorkbenchPasteRequest r)throws Exception{if(prepareFailure)throw new Exception();return proof;}
  public boolean validate(AtomicWorkbenchPasteRequest r,AtomicWorkbenchEditorEvidence e){validations++;return current;}
  public boolean release(AtomicWorkbenchPasteRequest r,AtomicWorkbenchEditorEvidence e){releases++;return restore;}
  public AtomicWorkbenchPasteCoordinator.Editor capture(AtomicWorkbenchPasteRequest r,AtomicWorkbenchEditorEvidence e){return this;}
  public AtomicWorkbenchPastePolicy.Snapshot read(){reads++;if(readHook!=null)readHook.run();return new AtomicWorkbenchPastePolicy.Snapshot(body,start,end,0);}
  public boolean current(){return current;}public void commit(String text)throws Exception{commits++;if(commitHook!=null)commitHook.run();if(!ignore){int lo=Math.min(start,end),hi=Math.max(start,end);body=body.substring(0,lo)+text+body.substring(hi);start=end=lo+text.length();}if(throwAfter)throw new Exception();}
  public void close(){if(closeFailure)throw new IllegalStateException();}
 }
 static final class ServiceFixture {
  final AtomicWorkbenchPasteService service=new AtomicWorkbenchPasteService();final AccessibilityWindowInfo window=new AccessibilityWindowInfo();final AccessibilityNodeInfo node=new AccessibilityNodeInfo();final InputMethod method;String body="甲乙丙丁";int commits;Integer connectionStart,connectionEnd;int connectionOffset;Runnable readHook;
  final InputMethod.AccessibilityInputConnection connection=new InputMethod.AccessibilityInputConnection(){public SurroundingText getSurroundingText(int before,int after,int flags){if(readHook!=null)readHook.run();return new SurroundingText(body,connectionStart==null?node.start:connectionStart,connectionEnd==null?node.end:connectionEnd,connectionOffset);}public void commitText(CharSequence t,int cursor,Object attribute){commits++;int lo=Math.min(connectionStart==null?node.start:connectionStart,connectionEnd==null?node.end:connectionEnd),hi=Math.max(connectionStart==null?node.start:connectionStart,connectionEnd==null?node.end:connectionEnd);body=body.substring(0,lo)+t+body.substring(hi);node.start=node.end=lo+t.length();connectionStart=connectionEnd=null;node.text=body;node.hint=false;}};
  ServiceFixture(){InputMethod.connection=connection;InputMethod.getterCalls=0;window.root=node;AccessibilityService.windows.clear();AccessibilityService.windows.put(88,new ArrayList<>(List.of(window)));method=service.onCreateInputMethod();service.onServiceConnected();method.onStartInput(new EditorInfo(),false);}
  AtomicWorkbenchPasteCoordinator.Editor capture()throws Exception{return AtomicWorkbenchPasteService.backend().capture(request(),evidence());}
 }
 public static void main(String[] args)throws Exception{
  test("middle cursor inserts once and verifies exact body",()->{Fixture f=new Fixture();check(f.run(request()).verified&&f.body.equals("甲乙新丙丁")&&f.commits==1,"middle insertion not verified");check(f.releases==1&&f.result.focusRestored,"focus lease not released");});
  for(boolean reversed:new boolean[]{false,true})test("existing selection replacement reversed="+reversed,()->{Fixture f=new Fixture();f.start=reversed?3:1;f.end=reversed?1:3;check(f.run(request()).verified&&f.body.equals("甲新丁"),"selection appended or overwritten");});
  test("empty editor and emoji/newline preserve UTF16 semantics",()->{Fixture f=new Fixture();f.body="";f.start=f.end=0;check(f.run(request("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","😀\n甲")).verified&&f.body.equals("😀\n甲"),"empty/unicode edit wrong");});
  test("duplicate request ID returns prior terminal result without another commit",()->{Fixture f=new Fixture();var r=request();var first=f.run(r);check(f.run(r)==first&&f.commits==1,"duplicate request repeated mutation");check(f.run(request(r.id,"different"))==first&&f.commits==1,"same ID changed payload repeated mutation");});
  test("expired queued request cannot enter prepare or edit",()->{Fixture f=new Fixture();SystemClock.time=6000;check(!f.run(request()).dispatched&&f.commits==0&&f.releases==1,"expired request mutated editor");});
  test("selection change between reads cancels mutation",()->{Fixture f=new Fixture();f.readHook=()->{if(f.reads==2)f.start=f.end=1;};check(!f.run(request()).dispatched&&f.commits==0&&f.result.reason.equals("selection_changed"),"changed cursor wrote text");});
  test("focus changes and task proof rejects before dispatch",()->{Fixture f=new Fixture();f.readHook=()->f.current=false;check(!f.run(request()).dispatched&&f.commits==0,"lost editor was edited");Fixture g=new Fixture();var b=evidence().toBundle();b.putInt("task",99);g.proof=AtomicWorkbenchEditorEvidence.fromBundle(b);check(!g.run(request()).dispatched&&g.commits==0,"foreign task proof accepted");});
  test("void commit ignored by application remains unverified",()->{Fixture f=new Fixture();f.ignore=true;check(f.run(request()).state==AtomicWorkbenchPasteResult.State.UNVERIFIED&&f.commits==1,"void call was treated as verified");});
  test("mutation then transport exception is unknown and never retried",()->{Fixture f=new Fixture();f.throwAfter=true;var r=request();check(f.run(r).state==AtomicWorkbenchPasteResult.State.UNVERIFIED&&f.result.dispatched&&f.body.equals("甲乙新丙丁"),"transport error falsely rejected possible mutation");f.run(r);check(f.commits==1,"ambiguous mutation automatically retried");});
  test("prepare and close failure always release focus",()->{Fixture f=new Fixture();f.prepareFailure=true;check(!f.run(request()).dispatched&&f.releases==1,"partial prepare leaked focus");Fixture g=new Fixture();g.closeFailure=true;g.restore=false;check(g.run(request()).verified&&!g.result.focusRestored&&g.releases==1,"close failure skipped release or hid restore failure");});
  test("cancellation and TTL after dispatch do not claim rollback",()->{Fixture f=new Fixture();f.commitHook=()->f.coordinator.cancelAll();check(f.run(request()).state==AtomicWorkbenchPasteResult.State.UNVERIFIED&&f.commits==1,"cancelled dispatched mutation misreported");Fixture g=new Fixture();g.commitHook=()->SystemClock.time=6001;check(g.run(request()).state==AtomicWorkbenchPasteResult.State.UNVERIFIED&&g.commits==1,"late edit mislabeled verified");});
  test("unknown formatting readback never adds a second copy",()->{Fixture f=new Fixture();f.commitHook=()->f.body="X"+f.body;check(f.run(request()).state==AtomicWorkbenchPasteResult.State.UNVERIFIED&&f.commits==1,"formatter result retried or falsely verified");});
  test("all Android password variations rejected",()->{for(int type:new int[]{129,145,225,18}){check(AtomicWorkbenchPastePolicy.password(type),"password variation accepted");var b=evidence().toBundle();b.putInt("input_type",type);check(!AtomicWorkbenchEditorEvidence.fromBundle(b).matches(request(),1000),"password system evidence accepted");}check(!AtomicWorkbenchPastePolicy.password(1)&&!AtomicWorkbenchPastePolicy.password(2),"ordinary input rejected");});
  test("editor evidence bundle accepts only its bounded primitive schema",()->{for(int mode=0;mode<3;mode++){Bundle b=evidence().toBundle();if(mode==0)b.putString("text","private");else if(mode==1)b.put("sampled",new Object());else b.putString("unique","u".repeat(513));try{AtomicWorkbenchEditorEvidence.fromBundle(b);throw new AssertionError("unbounded/Parcelable-shaped evidence accepted");}catch(IllegalArgumentException expected){checks++;}}});
  test("surrogate split, oversized text and invalid identity reject",()->{for(String text:new String[]{"\ud800","\udc00","a".repeat(32769)}){try{request("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",text);throw new AssertionError("invalid text accepted");}catch(IllegalArgumentException expected){checks++;}}try{new AtomicWorkbenchPastePolicy.Snapshot("😀",1,1,0);throw new AssertionError("split surrogate selection accepted");}catch(IllegalArgumentException expected){checks++;}});
  test("readback supports shifted surrounding window but requires whole insertion",()->{var before=new AtomicWorkbenchPastePolicy.Snapshot("abcd",2,2,100);check(AtomicWorkbenchPastePolicy.verifies(before,"NEW",new AtomicWorkbenchPastePolicy.Snapshot("abNEWcd",5,5,100)),"known offset failed");check(!AtomicWorkbenchPastePolicy.verifies(before,"NEW",new AtomicWorkbenchPastePolicy.Snapshot("EWcd",2,2,103)),"partial insertion falsely verified");});
  test("real service captures once and retains existing editor cursor",()->{ServiceFixture f=new ServiceFixture();var lease=f.capture();check(lease.read()!=null&&lease.current(),"captured lease unavailable");InputMethod.connection=null;lease.commit("新");check(f.body.equals("甲乙新丙丁")&&f.commits==1&&InputMethod.getterCalls==1,"service switched to newer current wrapper");check(lease.current(),"captured editor became invalid after normal commit");lease.close();check(!lease.current(),"closed editor usable");});
  test("service lifecycle old connection cannot retarget same package fieldId zero",()->{ServiceFixture f=new ServiceFixture();var lease=f.capture();lease.read();f.method.onStartInput(new EditorInfo(),true);check(!lease.current(),"same-package restart retained old lease");try{lease.commit("新");throw new AssertionError("stale service generation committed");}catch(Exception expected){checks++;}check(f.commits==0,"old connection wrote after restart");});
  test("focused source node identity and exact a11y window are mandatory",()->{ServiceFixture f=new ServiceFixture();var lease=f.capture();AccessibilityNodeInfo other=new AccessibilityNodeInfo();other.identity=2;f.node.focus=other;check(!lease.current(),"another same-package field reused old node lease");f.window.id=72;try{f.capture();throw new AssertionError("wrong a11y window accepted");}catch(Exception expected){checks++;}});
  test("node password, invisibility, noneditable and background window fail closed",()->{for(int mode=0;mode<4;mode++){ServiceFixture f=new ServiceFixture();switch(mode){case 0:f.node.password=true;break;case 1:f.node.visible=false;break;case 2:f.node.editable=false;break;case 3:f.window.focused=false;break;}try{f.capture();throw new AssertionError("unsafe node captured");}catch(Exception expected){checks++;}}});
  test("finish and service disconnect invalidate all captured leases",()->{ServiceFixture f=new ServiceFixture();var lease=f.capture();f.method.onFinishInput();check(!lease.current(),"finished lease remained active");f.service.onDestroy();check(!AtomicWorkbenchPasteService.available(),"destroyed service ready");});
  test("selection race at actual main-thread commit is rejected",()->{ServiceFixture f=new ServiceFixture();var lease=f.capture();lease.read();f.node.start=f.node.end=1;try{lease.commit("新");throw new AssertionError("cursor changed before dispatch accepted");}catch(Exception expected){checks++;}check(f.commits==0,"selection race wrote text");});
  test("service rejects oversized/unknown selected ranges before reading editor content",()->{for(int size:new int[]{-1,9000}){ServiceFixture f=new ServiceFixture();f.node.start=0;f.node.end=size;var lease=f.capture();f.readHook=()->{throw new AssertionError("unbounded selection read entered editor");};try{lease.read();throw new AssertionError("unbounded selection accepted");}catch(Exception expected){checks++;}check(f.commits==0,"unbounded selected text edited");}});
  test("native empty editor missing node selection requires captured connection empty origin",()->{for(int mode=0;mode<3;mode++){ServiceFixture f=new ServiceFixture();f.body="";f.node.text=mode==0?null:mode==1?"":"hint";f.node.hint=mode==2;f.node.start=f.node.end=-1;f.connectionStart=f.connectionEnd=0;var lease=f.capture();var before=lease.read();check(before.text.isEmpty()&&before.start==0&&before.end==0&&before.offset==0,"empty origin not independently read");lease.commit("😀新");check(f.commits==1&&f.body.equals("😀新")&&AtomicWorkbenchPastePolicy.verifies(before,"😀新",lease.read()),"native empty selection did not fill and verify once");}});
  test("nonempty node with missing selection rejects before native read",()->{ServiceFixture f=new ServiceFixture();f.node.start=f.node.end=-1;f.readHook=()->{throw new AssertionError("nonempty unknown selection read");};var lease=f.capture();try{lease.read();throw new AssertionError("nonempty missing selection accepted");}catch(Exception expected){checks++;}check(f.commits==0,"nonempty missing selection committed");});
  test("empty node cannot authorize nonempty or shifted connection snapshots",()->{for(int mode=0;mode<4;mode++){ServiceFixture f=new ServiceFixture();f.node.text="";f.node.start=f.node.end=-1;f.body=mode==0?"body":"";f.connectionStart=f.connectionEnd=mode==1?1:0;if(mode==2)f.connectionOffset=1;if(mode==3)f.connectionStart=-1;var lease=f.capture();try{lease.read();throw new AssertionError("nonempty or shifted missing selection accepted");}catch(Exception expected){checks++;}check(f.commits==0,"unproven empty origin committed");}});
  test("empty origin is rechecked against the refreshed node at commit",()->{ServiceFixture f=new ServiceFixture();f.body="";f.node.text="";f.node.start=f.node.end=-1;f.connectionStart=f.connectionEnd=0;var lease=f.capture();lease.read();f.node.text="newer body";try{lease.commit("新");throw new AssertionError("empty node changed before commit accepted");}catch(Exception expected){checks++;}check(f.commits==0,"changed empty node committed");});
  test("bounded idempotence capacity never evicts a still-live request",()->{Fixture f=new Fixture();for(int i=0;i<128;i++){f.run(request(String.format("%032x",i),"新"));}int commits=f.commits;f.run(request(String.format("%032x",0),"新"));check(f.commits==commits,"live terminal entry evicted");f.run(request(String.format("%032x",999),"新"));check(f.commits==commits&&f.result.reason.equals("operation_busy"),"full once-only ledger allowed untracked mutation");});
  System.out.println("TEXT DROP RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def sdk_compile():
    sdk = SUPPORT["ROOT"] / "audit-output/android-sdk/platforms/android-36/android.jar"
    with tempfile.TemporaryDirectory(prefix="lsa-paste-sdk36-") as directory:
        work = Path(directory)
        files = []
        for name in ("io/github/libxposed/api/XposedInterface.java", "ls/augment/com/hook/AugmentModule.java"):
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(BASE["SOURCES"][name], encoding="utf-8")
            files.append(path)
        files += [SUPPORT["SRC"] / name for name in MODELS]
        files += sorted(SUPPORT["SRC"].glob("AtomicWorkbenchExtraction*.java"))
        files += [SUPPORT["SRC"] / "UiKit.java", SUPPORT["SRC"] / "AtomicWorkbenchTextTool.java"]
        files += [SUPPORT["SRC"] / "ResetWriteFence.java"]
        files += [SUPPORT["SRC"] / "AtomicWorkbenchPasteHost.java"]
        files += [SUPPORT["SRC"] / "hook" / name for name in ("AtomicWorkbenchImeHook.java", "AtomicWorkbenchEditorEvidenceHook.java", "AtomicWorkbenchDisplayDeviceEvidence.java")]
        dependencies=SUPPORT["ROOT"] / "android/app/build/intermediates/javac/debug/compileDebugJavaWithJavac/classes"
        resources=SUPPORT["ROOT"] / "android/app/build/intermediates/compile_and_runtime_not_namespaced_r_class_jar/debug/processDebugResources/R.jar"
        result = subprocess.run([SUPPORT["JAVAC"], "-encoding", "UTF-8", "-cp", __import__('os').pathsep.join(map(str,(sdk,dependencies,resources))), "-d", str(work / "classes"), *map(str, files)],
                                capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=30)
        if result.returncode:
            raise AssertionError(result.stdout + result.stderr)
        print("PASS text-drop service/models + editor evidence + IME Hook: SDK36 javac")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--negative-controls", action="store_true")
    args = parser.parse_args()
    sources = dict(SOURCES)
    sources["ls/augment/com/TestPaste.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="lsa-paste-") as directory:
        SUPPORT["compile_run"](Path(directory), sources, MODELS, "ls.augment.com.TestPaste")
    sdk_compile()
    xml = ET.parse(SUPPORT["ROOT"] / "android/app/src/main/res/xml/atomic_workbench_accessibility.xml").getroot()
    android = "{http://schemas.android.com/apk/res/android}"
    assert xml.attrib[android + "isAccessibilityTool"] == "false"
    assert "flagInputMethodEditor" in xml.attrib[android + "accessibilityFlags"]
    print("PASS service XML: explicit ordinary-use declaration and real IME editor flag")
    if args.negative_controls:
        negatives(sources)


def negatives(sources):
    changes = [
        ("AtomicWorkbenchPasteCoordinator.java", "AtomicWorkbenchPastePolicy.verifies(before, r.text, after)", "true", "void call was treated as verified"),
        ("AtomicWorkbenchPasteCoordinator.java", "ticket.dispatched = true;", "ticket.dispatched = false;", "transport error falsely rejected possible mutation"),
        ("AtomicWorkbenchPasteService.java", "generation != epoch", "false", "same-package restart retained old lease"),
        ("AtomicWorkbenchPasteService.java", "if (!boundedSelection && !emptyOrigin(snapshot))", "if (false)", "nonempty or shifted missing selection accepted"),
        ("AtomicWorkbenchPasteService.java", "|| emptyOrigin(value) && emptySelectionCandidate(node)", "|| emptyOrigin(value)", "empty node changed before commit accepted"),
    ]
    for filename, before, after, expected in changes:
        source = (SUPPORT["SRC"] / filename).read_text(encoding="utf-8")
        assert source.count(before) == 1, filename
        with tempfile.TemporaryDirectory(prefix="lsa-paste-negative-") as directory:
            work = Path(directory)
            files = []
            all_sources = dict(sources)
            all_sources.update({"ls/augment/com/" + name: (SUPPORT["SRC"] / name).read_text(encoding="utf-8") for name in MODELS})
            all_sources["ls/augment/com/" + filename] = source.replace(before, after)
            for name, value in all_sources.items():
                path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(value, encoding="utf-8"); files.append(str(path))
            compiled = subprocess.run([SUPPORT["JAVAC"], "-encoding", "UTF-8", "-d", str(work / "classes"), *files], capture_output=True, text=True, encoding="utf-8", env=SUPPORT["ENV"], timeout=30)
            if compiled.returncode: raise AssertionError(compiled.stdout + compiled.stderr)
            result = subprocess.run([SUPPORT["JAVA"], "-cp", str(work / "classes"), "ls.augment.com.TestPaste"], capture_output=True, text=True, encoding="utf-8", env=SUPPORT["ENV"], timeout=30)
            if result.returncode == 0 or expected not in result.stdout + result.stderr: raise AssertionError(result.stdout + result.stderr)
            print("PASS paste negative control: " + filename + " / " + before)


if __name__ == "__main__":
    main()
