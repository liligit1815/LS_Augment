"""Real formatting hooks: shared battery events, native labels, rules and stale data.

Android doubles verify ownership/contract behavior; they do not validate GPU or phone telemetry.
"""
from pathlib import Path
import subprocess,tempfile
from notification_view_runtime_facade import FILES
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
files={k:FILES[k] for k in ['ls/augment/com/hook/AugmentModule.java','io/github/libxposed/api/XposedInterface.java']}
key='ls/augment/com/hook/AugmentModule.java'
files[key]=files[key].replace('target.getClass().getMethod("native_"+method.getName(),method.getParameterTypes())','method.getDeclaringClass().getMethod("native_"+method.getName(),method.getParameterTypes())')
files[key]=files[key].replace('target.getClass().getDeclaredMethod(name,types)','lookup(target instanceof Class?(Class<?>)target:target.getClass(),name,types)').replace(' public static Object invoke(','''static Method lookup(Class<?> c,String n,Class<?>[] p)throws Exception{for(;c!=null;c=c.getSuperclass())try{return c.getDeclaredMethod(n,p);}catch(NoSuchMethodException absent){}throw new NoSuchMethodException(n);} public static Object invoke(''')
files.update({
'android/os/Looper.java':'package android.os;public class Looper{static final Looper M=new Looper();public static Looper myLooper(){return M;}public static Looper getMainLooper(){return M;}}',
'android/os/Handler.java':'''package android.os;public class Handler{public Handler(Looper l){}static java.util.List<Runnable> q=new java.util.ArrayList<>();public void post(Runnable r){q.add(r);}public void postDelayed(Runnable r,long delay){}public void removeCallbacks(Runnable r){q.remove(r);}public static void drain(){int count=0;while(!q.isEmpty()){if(++count>1000)throw new AssertionError("refresh loop");q.remove(0).run();}}}''',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now=1000;public static long elapsedRealtime(){return now;}}',
'android/os/BatteryManager.java':'package android.os;public class BatteryManager{public static final String EXTRA_STATUS="status",EXTRA_LEVEL="level",EXTRA_SCALE="scale";}',
'android/content/Intent.java':'''package android.content;public class Intent{public static final String ACTION_BATTERY_CHANGED="battery";public int status=2,level=80,scale=100;public String getAction(){return ACTION_BATTERY_CHANGED;}public int getIntExtra(String key,int fallback){return key.equals("status")?status:key.equals("level")?level:scale;}}''',
'android/content/IntentFilter.java':'package android.content;public class IntentFilter{public IntentFilter(String s){}}',
'android/content/BroadcastReceiver.java':'package android.content;public abstract class BroadcastReceiver{public abstract void onReceive(Context c,Intent i);}',
'android/content/Context.java':'''package android.content;public class Context{public static final int RECEIVER_EXPORTED=2;public static BroadcastReceiver receiver;public static final Intent sticky=new Intent();public Context getApplicationContext(){return this;}public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,String permission,android.os.Handler h,int flags){receiver=r;return sticky;}public static void send(int level,int status){sticky.level=level;sticky.status=status;receiver.onReceive(new Context(),sticky);android.os.Handler.drain();}}''',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public static class Metrics{public float density=1;}public Metrics getDisplayMetrics(){return new Metrics();}}',
'android/graphics/Paint.java':'package android.graphics;public class Paint{public float measureText(String s){return s.length()*8;}}',
'android/view/ViewGroup.java':'package android.view;public class ViewGroup extends View{public static class LayoutParams{public int width=30,height=20;}}',
'android/view/View.java':'''package android.view;public class View{public boolean attached=true;public android.view.ViewGroup.LayoutParams lp=new android.view.ViewGroup.LayoutParams();public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return new android.content.res.Resources();}public boolean isAttachedToWindow(){return attached;}public void requestLayout(){}public void invalidate(){}public android.view.ViewGroup.LayoutParams getLayoutParams(){return lp;}public void setLayoutParams(android.view.ViewGroup.LayoutParams p){lp=p;}}''',
'android/widget/TextView.java':'package android.widget;public class TextView extends android.view.View{public String text="";public CharSequence getText(){return text;}public void setText(CharSequence s){text=s.toString();}public android.graphics.Paint getPaint(){return new android.graphics.Paint();}public int getPaddingLeft(){return 0;}public int getPaddingRight(){return 0;}}',
'ls/augment/com/hook/SystemUiAdapter.java':'''package ls.augment.com.hook;class SystemUiAdapter{static Object field(Object o,String name){for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{var f=c.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(Exception absent){}return null;}}''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;class FeatureSettings{static java.util.Map<String,Integer> values=new java.util.HashMap<>();static Runnable changed;static int integer(android.content.Context c,String key,int fallback,int min,int max){return values.getOrDefault(key,fallback);}static boolean addSnapshotListener(android.content.Context c,Runnable r){changed=r;return true;}static void diagnostic(android.content.Context c,String key,String value){}}''',
'ls/augment/com/hook/IosBatteryHook.java':'package ls.augment.com.hook;class IosBatteryHook{static void apply(android.view.View v){}}',
'ls/augment/com/hook/ConnectivityIconSource.java':'package ls.augment.com.hook;class ConnectivityIconSource{int refreshes;void refreshBatteryDisplay(){refreshes++;}}',
'com/zte/mifavor/views/MFVBatteryViewLayout.java':'''package com.zte.mifavor.views;public class MFVBatteryViewLayout extends android.view.View{public int mBateryLevel=80;public android.widget.TextView mBatteryLevelInsideView=new android.widget.TextView(),mCurrentUsedBatteryLevelView=mBatteryLevelInsideView;public android.view.View mBatteryIconView=new android.view.View();public boolean percent;public int calls;public void updateBatteryLevelText(){ls.augment.com.hook.AugmentModule.invoke(this,"updateBatteryLevelText",new Class[]{});}public void native_updateBatteryLevelText(){calls++;mCurrentUsedBatteryLevelView.setText(mBateryLevel+(percent?"%":""));}}''',
'com/android/systemui/statusbar/KeyguardIndicationController.java':'''package com.android.systemui.statusbar;public class KeyguardIndicationController{public final android.content.Context mContext=new android.content.Context();public String last="";public String computePowerIndication(){return (String)ls.augment.com.hook.AugmentModule.invoke(this,"computePowerIndication",new Class[]{});}public String native_computePowerIndication(){return "正在超级快充 80% · 20分钟";}public void updateIndicationPublic(boolean animate){last=computePowerIndication();}}''',
'com/zte/utils/SystemuiUtils.java':'''package com.zte.utils;public class SystemuiUtils{public static int nativeCalls;public static int getRawBatteryLevel(){return 0;}public static void setBatteryLevel(int v){ls.augment.com.hook.AugmentModule.invoke(SystemuiUtils.class,"setBatteryLevel",new Class[]{int.class},v);}public static void native_setBatteryLevel(int v){nativeCalls++;}}''',
'ls/augment/com/hook/TestBattery.java':'''package ls.augment.com.hook;
import ls.augment.com.BatteryPercentagePolicy;import com.zte.mifavor.views.MFVBatteryViewLayout;import com.zte.utils.SystemuiUtils;import android.content.Context;import android.os.Handler;
public class TestBattery{static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}static void config(int digits,int rule){FeatureSettings.values.put(BatteryPercentagePolicy.DIGITS,digits);FeatureSettings.values.put(BatteryPercentagePolicy.RULE,rule);if(FeatureSettings.changed!=null)FeatureSettings.changed.run();Handler.drain();}static void raw(int v){SystemuiUtils.setBatteryLevel(v);Handler.drain();}public static class Child extends MFVBatteryViewLayout{}
public static void main(String[] args){AugmentModule module=new AugmentModule();AugmentModule.active=module;BatteryPercentageHook.install(module,TestBattery.class.getClassLoader());
 if(args.length>0){check(module.errors>0,"missing/type contract logged");check(module.hooks.size()==2,"other independent paths remain available");System.out.println("battery missing meter fails closed");return;}
 check(module.errors==0&&module.hooks.size()==3,"typed native contracts installed");
 MFVBatteryViewLayout[] views={new MFVBatteryViewLayout(),new Child(),new MFVBatteryViewLayout(),new Child()};for(int i=0;i<4;i++){views[i].percent=i%2==1;views[i].updateBatteryLevelText();}Handler.drain();
 var lock=new com.android.systemui.statusbar.KeyguardIndicationController();lock.computePowerIndication();
 config(2,2);raw(8046);for(int i=0;i<4;i++)check(views[i].mCurrentUsedBatteryLevelView.text.equals("80.46"+(i%2==1?"%":"")),"same reading on four surfaces and subclasses");
 check(lock.last.equals("正在超级快充 80.46% · 20分钟"),"lock percent replaced without touching remaining-time number");check(SystemuiUtils.nativeCalls==1,"native raw event retained exactly once");
 check(views[0].mBatteryLevelInsideView.lp.width==46&&views[0].mBatteryIconView.lp.width==46,"inside text and icon widen without changing font/height");
 config(1,1);check(views[0].mCurrentUsedBatteryLevelView.text.equals("80.5"),"half-up one digit");
 config(0,2);check(views[0].mCurrentUsedBatteryLevelView.text.equals("80")&&views[0].mBatteryLevelInsideView.lp.width==30,"zero precision restores native width");
 config(2,0);check(views[0].mCurrentUsedBatteryLevelView.text.equals("80"),"discharge only excludes charge");Context.send(80,3);check(BatteryPercentageHook.text(80).equals("80"),"transition invalidates previous charging raw");raw(8034);check(BatteryPercentageHook.text(80).equals("80.34"),"new discharge raw obeys discharge rule");
 config(2,1);check(BatteryPercentageHook.text(80).equals("80"),"charge only excludes discharge");config(2,2);check(BatteryPercentageHook.text(80).equals("80.34"),"both covers discharge");
 for(int status:new int[]{1,4,5,-1}){Context.send(80,status);raw(8045);check(BatteryPercentageHook.text(80).equals("80"),"unknown idle and full always integer");}
 Context.send(80,2);raw(8400);check(BatteryPercentageHook.text(80).equals("80"),"different scale/level is rejected, no 80.4 versus 84 discrepancy");raw(8045);android.os.SystemClock.now+=30001;check(BatteryPercentageHook.text(80).equals("80"),"stale precise value falls back to native");
 for(int digits=0;digits<=2;digits++)for(int rule=0;rule<=2;rule++)for(int status=1;status<=5;status++){String actual=BatteryPercentagePolicy.format(80,8045,digits,rule,status);boolean expect=digits>0&&(status==2&&(rule==1||rule==2)||status==3&&(rule==0||rule==2));check(actual.contains(".")==expect,"rule matrix");}
 for(int invalid:new int[]{-1,0,10100,Integer.MAX_VALUE,804})check(!BatteryPercentagePolicy.validRaw(invalid,80),"invalid raw rejected");
 check(BatteryPercentagePolicy.format(100,9999,1,2,2).equals("100.0"),"100 rounding bounded");check(BatteryPercentagePolicy.RULE_LABELS.length==3,"exactly three rule choices");
 System.out.println("battery runtime: "+checks+" checks");}}
'''
})
for variant in ['modern','legacy','wrong_field']:
    current=dict(files)
    if variant=='legacy':
        k='com/android/systemui/statusbar/KeyguardIndicationController.java';current[k]=current[k].replace('updateIndicationPublic','updateIndication')
    if variant=='wrong_field':
        k='com/zte/mifavor/views/MFVBatteryViewLayout.java';current[k]=current[k].replace('public int mBateryLevel','public float mBateryLevel')
    with tempfile.TemporaryDirectory(prefix='duo-battery-') as folder:
        paths=[]
        for name,source in current.items():
            p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf8');paths.append(p)
        paths += [SRC/'BatteryPercentagePolicy.java',SRC/'hook/BatteryPercentageHook.java']
        subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*map(str,paths)],check=True)
        subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestBattery',*(['missing'] if variant=='wrong_field' else [])],check=True)
