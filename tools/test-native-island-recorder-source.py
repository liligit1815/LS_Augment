"""Run the recorder producer with production hook callbacks and deterministic Android doubles."""
from pathlib import Path
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
# Share Android/framework doubles without importing or executing the other test.
tree = ast.parse((ROOT / 'tools/test-native-island-clock-source.py').read_text(encoding='utf-8'))
files = ast.literal_eval(next(n.value for n in tree.body if isinstance(n, ast.Assign)
                              and any(isinstance(t, ast.Name) and t.id == 'files' for t in n.targets)))
files = {k: v for k, v in files.items() if not k.startswith('zte/') and not k.endswith('TestClockSource.java')}
files.update({
 'android/net/Uri.java': 'package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}',
 'android/database/Cursor.java': '''package android.database;public class Cursor implements AutoCloseable {
 public final String value;public Cursor(String s){value=s;}public boolean moveToFirst(){return true;}
 public int getColumnIndex(String s){return 0;}public boolean isNull(int c){return value==null;}public String getString(int c){return value;}public void close(){}}''',
 'android/content/ContentResolver.java': '''package android.content;public class ContentResolver {public int observers;public static String value;
 public void registerContentObserver(Object uri,boolean b,android.database.ContentObserver o){observers++;}
 public void unregisterContentObserver(android.database.ContentObserver o){observers--;}
 public android.database.Cursor query(android.net.Uri u,String[] p,String s,String[] a,String sort){return new android.database.Cursor(value);}}''',
 'cn/zte/recorder/Config.java':'package cn.zte.recorder;public class Config {public static boolean nubia;public static boolean isFlavorNubia(){return nubia;}}',
 'cn/zte/recorder/common/config/CommonConfig.java':'''package cn.zte.recorder.common.config;public class CommonConfig {
 public static boolean full;public static boolean supportFullScreenLiveIsland(){return full;}}''',
 'cn/zte/recorder/manager/RecorderState.java':'''package cn.zte.recorder.manager;public class RecorderState {public static int state;
 public static int getCurrentState(){return state;}}''',
 'cn/zte/recorder/notification/SystemUiResolver.java':'''package cn.zte.recorder.notification;public class SystemUiResolver {
 private static String RECORD_VISIBLE_URI="content://com.android.systemui.zte/record_visible_status";
 public static int publishes;public static void updateVisible(android.content.Context c,int n){publishes++;android.content.ContentResolver.value=Integer.toString(n);}}''',
 'cn/zte/recorder/RecorderService.java':'''package cn.zte.recorder;public class RecorderService extends android.app.Service {
 public static boolean foreground=true;public static int counts,lastCountState;
 public static boolean isForeGroundRecording(){return foreground;}
 public static void updateCount(android.content.Context c,int state){counts++;lastCountState=state;}}''',
 'ls/augment/com/hook/TestRecorderSource.java':'''package ls.augment.com.hook;
 import android.content.*;import android.os.Handler;import cn.zte.recorder.*;import cn.zte.recorder.manager.RecorderState;
 import cn.zte.recorder.notification.SystemUiResolver;import cn.zte.recorder.common.config.CommonConfig;
 public class TestRecorderSource {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static final Class<?>[] NONE=new Class<?>[0];
 static void tick(RecorderService s)throws Throwable {AugmentModule.invoke(null,RecorderService.class,"updateCount",new Class<?>[]{Context.class,int.class},s,RecorderState.state);Handler.flush();}
 static void recover(RecorderService s){s.receiver.onReceive(s,new Intent(NativeIslandScenePolicy.RECORDER_SYNC_ACTION));Handler.flush();}
 public static void main(String[]args)throws Throwable {
 AugmentModule module=new AugmentModule();NativeIslandRecorderSource.install(module,TestRecorderSource.class.getClassLoader());
 check(module.errors==0&&AugmentModule.hooks.size()==3,"all source signatures checked before installation");
 RecorderService s=new RecorderService();AugmentModule.invoke(s,RecorderService.class,"onCreate",NONE);Handler.flush();
 check(SystemUiResolver.publishes==0,"default config does not publish");
 FeatureSettings.change("record",true);FeatureSettings.change("master",true);tick(s);check(SystemUiResolver.publishes==0,"source requires native selection");
 FeatureSettings.change("native",true);check("0".equals(ContentResolver.value),"idle source cannot fabricate recording");
 RecorderState.state=1;RecorderService.foreground=false;tick(s);
 check("1".equals(ContentResolver.value)&&RecorderState.state==1,"first real tick repairs early-background state gap without changing recording");
 int writes=SystemUiResolver.publishes;tick(s);check(SystemUiResolver.publishes==writes,"matching provider does not republish every tick");
 check(NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION.equals(s.requiredPermission),"recovery receiver requires platform sender permission");
 RecorderState.state=2;ContentResolver.value=null;recover(s);
 check("2".equals(ContentResolver.value)&&RecorderService.lastCountState==2&&RecorderState.state==2,"restart recovery uses real paused model and actual duration publisher");
 RecorderService.foreground=true;recover(s);check("0".equals(ContentResolver.value),"foreground recorder remains hidden");
 RecorderService.foreground=false;RecorderState.state=0;recover(s);check("0".equals(ContentResolver.value),"completed recording cannot be revived");
 RecorderState.state=1;writes=SystemUiResolver.publishes;Config.nubia=true;recover(s);check(SystemUiResolver.publishes==writes,"Nubia broadcast protocol left native");Config.nubia=false;
 CommonConfig.full=true;recover(s);check(SystemUiResolver.publishes==writes,"full-screen source not overwritten");CommonConfig.full=false;
 FeatureSettings.change("record",false);recover(s);check(SystemUiResolver.publishes==writes,"disabled scene cannot be resurrected by recovery");
 FeatureSettings.change("record",true);writes=SystemUiResolver.publishes;FeatureSettings.change("duo",true);recover(s);check(SystemUiResolver.publishes==writes,"Duo mode remains exclusive");
 BroadcastReceiver receiver=s.receiver;AugmentModule.invoke(s,RecorderService.class,"onDestroy",NONE);receiver.onReceive(s,new Intent(NativeIslandScenePolicy.RECORDER_SYNC_ACTION));Handler.flush();
 check(s.receiver==null&&s.resolver.observers==0&&FeatureSettings.listeners.isEmpty()&&SystemUiResolver.publishes==writes,"destroy releases all listeners and ignores queued recovery");
 AugmentModule.hooks.clear();java.lang.reflect.Field uri=SystemUiResolver.class.getDeclaredField("RECORD_VISIBLE_URI");uri.setAccessible(true);uri.set(null,"content://untrusted/status");
 NativeIslandRecorderSource.install(module,TestRecorderSource.class.getClassLoader());check(module.errors==1&&AugmentModule.hooks.isEmpty(),"wrong producer protocol rejected before hooks");
 System.out.println("PASS native recorder source: "+checks+" checks");}}
 '''
})
with tempfile.TemporaryDirectory(prefix='duo-native-recorder-') as folder:
    sources = []
    for name, value in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding='utf-8')
        sources.append(str(path))
    sources += [str(ROOT / 'android/app/src/main/java/ls/augment/com/hook' / name) for name in
                ['NativeIslandRecorderSource.java', 'NativeIslandSceneContract.java', 'NativeIslandScenePolicy.java']]
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', folder, 'ls.augment.com.hook.TestRecorderSource'], check=True)
