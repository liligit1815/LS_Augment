"""Exercise real recorder rendering hooks and scene-owner boundary methods with delayed OEM callbacks."""
import ast, os, subprocess, tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-native-island-recorder-handoff.py').read_text('utf-8'))
files={}
for node in tree.body:
    if isinstance(node,ast.Expr) and isinstance(node.value,ast.Call) and isinstance(node.value.func,ast.Attribute) and node.value.func.attr=='update':
        files.update(ast.literal_eval(node.value.args[0]))
files.pop('ls/augment/com/hook/TestRecorderHandoff.java')
files.pop('cn/zte/recorder/RecorderService.java')
source=(ROOT/'android/app/src/main/java/ls/augment/com/hook/NativeIslandScenes.java').read_text('utf-8')
def member(marker):
    start=source.index(marker);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
methods='\n'.join(member(marker) for marker in [
    'static boolean recorderTakeover()', 'static boolean recorderReconcile(',
    'static boolean recorderAdditionBlocked(', 'private String recorderText()', 'private boolean prepareRecorderText()',
    'private void retireRecorderRendering('])
files.update({
'android/os/Looper.java':'package android.os;public class Looper {}',
'android/net/Uri.java':'package android.net;public class Uri {public static Uri parse(String v){return new Uri();}}',
'android/content/Intent.java':'package android.content;public class Intent {}',
'android/content/IntentFilter.java':'package android.content;public class IntentFilter {}',
'android/content/BroadcastReceiver.java':'package android.content;public class BroadcastReceiver {}',
'android/database/ContentObserver.java':'package android.database;public class ContentObserver {}',
'android/database/Cursor.java':'package android.database;public class Cursor {public Cursor(String v){}}',
'android/widget/TextView.java':'package android.widget;public class TextView extends android.view.View {public String text;public void setText(String s){text=s;}}',
'com/zte/feature/dynamicisland/DynamicPermanentIsland.java':'''package com.zte.feature.dynamicisland;
 public class DynamicPermanentIsland extends android.view.View {public android.widget.TextView mDisplayText=new android.widget.TextView();
 public Panel mRecorderPanel=new Panel();public boolean fail;public String getContentText(String raw){if(fail)throw new IllegalStateException("format unavailable");return "formatted:"+raw;}
 public static class Panel {public String text;public void setDisplayText(String s){text=s;}}}''',
'com/zte/feature/dynamicisland/PermanentIslandManager.java':'''package com.zte.feature.dynamicisland;import android.os.Handler;import ls.augment.com.hook.AugmentModule;
 public class PermanentIslandManager {public int providerCalls,queuedCalls,added;public String firstText;
 public void handleDynamicVisibility(String status,DynamicPermanentIsland island){providerCalls++;}
 public void addPermanentIslandInner(DynamicPermanentIsland island){queuedCalls++;new Handler(null).post(()->{try{AugmentModule.invoke(this,getClass(),"lambda$addPermanentIslandInner$3",new Class<?>[]{DynamicPermanentIsland.class},island);}catch(Throwable t){throw new RuntimeException(t);}});}
 public void lambda$addPermanentIslandInner$3(DynamicPermanentIsland island){added++;firstText=island.mDisplayText.text;}}''',
'ls/augment/com/hook/NativeIslandScenes.java':'''package ls.augment.com.hook;import android.os.SystemClock;import static ls.augment.com.hook.SystemUiAdapter.*;
 public class NativeIslandScenes {static NativeIslandScenes selected;boolean closed,recorderEligible=true,foreground,recorderRenderFailed;
 Object permanent,record;int syncs;final NativeIslandRecorderState recorderModel=new NativeIslandRecorderState();
 NativeIslandScenes(Object p,Object r){permanent=p;record=r;selected=this;}boolean recorderForeground(){return foreground;}
 void syncRecorder(){syncs++;}void report(String value){}static String reason(Exception e){return e.getClass().getSimpleName();}
 '''+methods+'}',
'ls/augment/com/hook/TestRecorderRender.java':'''package ls.augment.com.hook;
 import android.os.*;import com.zte.feature.dynamicisland.*;
 public class TestRecorderRender {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static class Child extends PermanentIslandManager {}
 static long sequence;static void state(NativeIslandScenes s,int status,boolean front,String time){check(s.recorderModel.accept(new NativeIslandRecorderState.Snapshot(1,++sequence,SystemClock.now,status,front,time),SystemClock.now),"snapshot accepted");}
 static void add(PermanentIslandManager p,DynamicPermanentIsland i)throws Throwable {AugmentModule.invoke(p,p.getClass(),"addPermanentIslandInner",new Class<?>[]{DynamicPermanentIsland.class},i);}
 static void status(PermanentIslandManager p,DynamicPermanentIsland i,String v)throws Throwable {AugmentModule.invoke(p,p.getClass(),"handleDynamicVisibility",new Class<?>[]{String.class,DynamicPermanentIsland.class},v,i);}
 public static void main(String[] args)throws Throwable {
 AugmentModule module=new AugmentModule();check(NativeIslandRecorderRendering.install(module,TestRecorderRender.class.getClassLoader()),"actual runtime boundary contracts installed");
 for(PermanentIslandManager p:new PermanentIslandManager[]{new PermanentIslandManager(),new Child()}) {
 DynamicPermanentIsland i=new DynamicPermanentIsland();NativeIslandScenes s=new NativeIslandScenes(p,i);
 status(p,i,"1");check(p.providerCalls==1,"no snapshot preserves native provider");
 state(s,1,false,"00:00:00");i.mDisplayText.text="00:00:09";status(p,i,"0");
 check(p.providerCalls==1&&s.syncs==1,"late provider stop reconciles latest model without native close animation");
 add(p,i);check(p.queuedCalls==1&&i.mDisplayText.text.equals("formatted:00:00:00"),"fresh text written before native add is queued");
 s.foreground=true;Handler.flush();check(p.added==0,"foreground barrier cancels already queued background add");
 s.foreground=false;add(p,i);state(s,0,true,null);Handler.flush();check(p.added==0,"stop cancels queued active add");
 state(s,1,false,"00:00:01");add(p,i);i.mDisplayText.text="00:00:99";Handler.flush();
 check(p.added==1&&p.firstText.equals("formatted:00:00:01")&&i.mRecorderPanel.text.equals(p.firstText),"render callback revalidates time before its first visible frame");
 DynamicPermanentIsland other=new DynamicPermanentIsland();status(p,other,"0");add(p,other);Handler.flush();check(p.providerCalls==2&&p.added==2,"other native islands untouched");
 s.recorderEligible=false;status(p,i,"0");add(p,i);Handler.flush();check(p.providerCalls==3&&p.added==3,"OFF preserves original provider and add paths");
 s.recorderEligible=true;SystemClock.now+=4000;status(p,i,"0");check(p.providerCalls==4,"expired lease releases native provider");
 state(s,1,false,"00:00:02");i.fail=true;add(p,i);Handler.flush();status(p,i,"1");
 check(p.added==4&&p.providerCalls==5&&!s.recorderEligible,"formatter failure releases ownership to native renderer");
 }
 System.out.println("PASS recorder rendering: "+checks+" checks; real owner methods, queued adds, stale provider, inherited host, OFF and native fallback");
 }}'''
})
with tempfile.TemporaryDirectory(prefix='duo-recorder-render-') as temp:
    folder=Path(temp)
    for name,text in files.items():
        path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,encoding='utf-8')
    real=['NativeIslandRecorderRendering','NativeIslandRecorderState','NativeIslandSceneContract']
    sources=[*map(str,folder.rglob('*.java')),*[str(ROOT/'android/app/src/main/java/ls/augment/com/hook'/f'{name}.java') for name in real]]
    java=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',temp,*sources],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',temp,'ls.augment.com.hook.TestRecorderRender'],check=True,timeout=30)
