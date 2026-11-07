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
'android/os/Handler.java':'''package android.os;public class Handler{public Handler(Looper l){}static java.util.Queue<Runnable> q=new java.util.concurrent.ConcurrentLinkedQueue<>();public void post(Runnable r){q.add(r);}public void postDelayed(Runnable r,long delay){}public void removeCallbacks(Runnable r){q.remove(r);}public static void drain(){int count=0;Runnable r;while((r=q.poll())!=null){if(++count>1000)throw new AssertionError("refresh loop");r.run();}}}''',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now=1000;public static long elapsedRealtime(){return now;}}',
'android/os/BatteryManager.java':'package android.os;public class BatteryManager{public static final String EXTRA_STATUS="status",EXTRA_LEVEL="level",EXTRA_SCALE="scale";public static final int BATTERY_STATUS_FULL=5,BATTERY_PROPERTY_CHARGE_COUNTER=1;public static volatile long counter=Long.MIN_VALUE;public long getLongProperty(int property){return counter;}}',
'android/os/PowerManager.java':'package android.os;public class PowerManager{public boolean isInteractive(){return false;}}',
'android/content/Intent.java':'''package android.content;public class Intent{public static final String ACTION_BATTERY_CHANGED="battery",ACTION_SCREEN_ON="on",ACTION_SCREEN_OFF="off"; public String action=ACTION_BATTERY_CHANGED;public int status=2,level=80,scale=100,counter=-1,altCounter=-1,full=-1;public String getAction(){return action;}public int getIntExtra(String key,int fallback){return switch(key){case "status"->status;case "level"->level;case "scale"->scale;case "charge_counter"->counter;case "chg_counter"->altCounter;case "chg_full"->full;default->fallback;};}}''',
'android/content/IntentFilter.java':'package android.content;public class IntentFilter{public IntentFilter(String s){}public void addAction(String s){}}',
'android/content/BroadcastReceiver.java':'package android.content;public abstract class BroadcastReceiver{public abstract void onReceive(Context c,Intent i);}',
'android/content/Context.java':'''package android.content;public class Context{public static final int RECEIVER_EXPORTED=2;public static BroadcastReceiver receiver;public static final Intent sticky=new Intent();public Context getApplicationContext(){return this;}public <T>T getSystemService(Class<T> type){try{return type.getConstructor().newInstance();}catch(Exception e){throw new AssertionError(e);}}public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,String permission,android.os.Handler h,int flags){receiver=r;return sticky;}public static void send(int level,int status){sticky.level=level;sticky.status=status;receiver.onReceive(new Context(),sticky);android.os.Handler.drain();}public static void screen(String action){Intent i=new Intent();i.action=action;receiver.onReceive(new Context(),i);android.os.Handler.drain();}}''',
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
 if(args.length>0&&args[0].equals("no_raw")){
   check(module.errors>0&&module.hooks.size()==2,"missing native raw hook isolated");
   new Child().updateBatteryLevelText();Handler.drain();config(2,2);
   Context.sticky.counter=2870000;Context.sticky.full=7000000;Context.send(41,3);
   Context.sticky.counter-=700;Context.send(41,3);check(BatteryPercentageHook.text(41).equals("40.99"),"counter works without OEM getter");
   System.out.println("battery counter fallback without OEM hook passed");return;
 }
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
 for(int digits=0;digits<=2;digits++)for(int rule=0;rule<=2;rule++)for(int status=1;status<=5;status++)
   check(BatteryPercentagePolicy.format(100,9999,digits,rule,status).equals("100"),"system 100 overrides decimals in every state and rule");
 check(BatteryPercentagePolicy.format(99,9995,1,2,2).equals("100"),"rounded 100 is also an integer");
 check(BatteryPercentagePolicy.format(99,9995,2,2,2).equals("99.95"),"actual fraction below 100 retained");
 check(BatteryPercentagePolicy.format(99,10000,2,2,2).equals("100"),"exact OEM 100 is an integer");
 Context.send(100,2);raw(9999);check(views[1].mCurrentUsedBatteryLevelView.text.equals("100%")&&views[0].mBatteryIconView.lp.width==30&&lock.last.contains("100%"),"native charging labels and lockscreen show integer at 100");
 check(BatteryPercentagePolicy.RULE_LABELS.length==3,"exactly three rule choices");
 counterScenarios();
 System.out.println("battery runtime: "+checks+" checks");}
 static void counterScenarios(){
   config(2,2);
   var intent=Context.sticky;
   intent.full=7_000_000;intent.counter=2_870_000;Context.send(41,2);
   check(BatteryPercentageHook.text(41).equals("41.00"),"cold start at native level");
   raw(4154);
   android.os.SystemClock.now+=1000;intent.counter+=7000;Context.send(42,2);
   check(BatteryPercentageHook.text(42).equals("41.54"),"fresh OEM has priority");
   android.os.SystemClock.now+=5000;Context.send(42,2);
   check(BatteryPercentageHook.text(42).equals("41.64"),"continue from OEM with counter delta across integer transition");
   raw(0);Context.send(42,3);
   check(BatteryPercentageHook.text(42).equals("41.64"),"unplug keeps estimate");
   intent.counter-=3500;Context.send(42,3);
   check(BatteryPercentageHook.text(42).equals("41.59"),"discharge follows measured loss");
   config(1,2);check(BatteryPercentageHook.text(42).equals("41.6"),"estimate honors requested decimal places");
   config(2,2);raw(4162);check(BatteryPercentageHook.text(42).equals("41.62"),"new native sample takes over");
   android.os.SystemClock.now+=30001;intent.counter-=1400;Context.send(42,3);
   check(BatteryPercentageHook.text(42).equals("41.60"),"expired raw hands off to measured estimate");
   for(int i=0;i<7;i++){intent.counter-=100;Context.send(42,3);}
   check(BatteryPercentageHook.text(42).equals("41.59"),"sub-hundredth increments accumulate");
   int saved=intent.counter;intent.counter=0;Context.send(42,3);
   check(BatteryPercentageHook.text(42).equals("42"),"zero sentinel at nonzero charge invalidates counter");
   intent.altCounter=saved;Context.send(42,3);intent.full=-1;intent.altCounter-=700;
   Context.send(42,3);check(BatteryPercentageHook.text(42).equals("41.99"),"alternate counter and remembered learned full");
   intent.altCounter-=350000;Context.send(42,3);
   check(BatteryPercentageHook.text(42).equals("42.00"),"counter reset cannot create a five-percent jump");
   Context.send(39,3);check(BatteryPercentageHook.text(39).equals("39.00"),"large system correction realigns");
   android.os.BatteryManager.counter=intent.altCounter-1400;
   Context.screen(android.content.Intent.ACTION_SCREEN_ON);
   for(int i=0;i<150&&!BatteryPercentageHook.text(39).equals("38.98");i++){
     try{Thread.sleep(5);}catch(InterruptedException e){throw new AssertionError(e);}Handler.drain();
   }
   check(BatteryPercentageHook.text(39).equals("38.98"),"interactive polling updates without a battery broadcast");
   Context.screen(android.content.Intent.ACTION_SCREEN_OFF);
   intent.counter=-1;intent.altCounter=-1;android.os.SystemClock.now+=61000;Context.send(39,3);
   check(BatteryPercentageHook.text(39).equals("39"),"missing counter cannot display stale estimate");
   intent.counter=(int)android.os.BatteryManager.counter-70000;Context.send(38,3);
   check(BatteryPercentageHook.text(38).equals("37.98"),"resume with measured sleep delta rather than discard fraction");
   intent.scale=10000;Context.send(3992,3);check(BatteryPercentageHook.text(40).equals("39.92"),"higher-resolution native broadcast still wins");
   intent.scale=100;intent.counter=0;Context.send(0,3);
   check(BatteryPercentageHook.text(0).equals("0.00"),"measured empty distinct from missing OEM zero");
   intent.counter=7000000;Context.send(100,5);check(BatteryPercentageHook.text(100).equals("100"),"full remains integer");
   intent.counter-=700;Context.send(100,3);check(BatteryPercentageHook.text(100).equals("100"),"unplugged 100 hides counter fraction");
   intent.counter-=35000;Context.send(99,3);check(BatteryPercentageHook.text(99).equals("99.49"),"counter kept tracking while 100 was displayed");
   long before=sequence();raw(9949);long preciseSequence=sequence();
   android.os.SystemClock.now+=5000;raw(9949);
   check(preciseSequence>before && sequence()==preciseSequence,
         "new precise anchors supersede in-flight HAL reads; repeated anchors leave them eligible");
   intent.counter-=1400;Context.send(99,3);
   check(BatteryPercentageHook.text(99).equals("99.47"),"repeated OEM value must not pin a moving charge counter");
   android.os.SystemClock.now+=61000;Context.send(99,3);
   check(BatteryPercentageHook.text(99).equals("99"),"duplicate HAL samples cannot keep an old fraction alive");
   BatteryChargeEstimate primary=new BatteryChargeEstimate(),direct=new BatteryChargeEstimate();
   primary.sample(57,3900000,7000000,100);direct.sample(57,4000000,7000000,100);
   primary.sample(57,3900000,-1,5100);direct.sample(57,3998600,-1,5100);
   check(primary.sampledAt()==100 && direct.sampledAt()==5100 && direct.value()==5698,
         "a live gauge has its own baseline even when the HAL is cached");

 }
 static long sequence(){
   try{var f=BatteryPercentageHook.class.getDeclaredField("counterSequence");f.setAccessible(true);return f.getLong(null);}
   catch(ReflectiveOperationException e){throw new AssertionError(e);}
 }}
'''
})
for variant in ['modern','legacy','wrong_field','no_raw']:
    current=dict(files)
    if variant=='legacy':
        k='com/android/systemui/statusbar/KeyguardIndicationController.java';current[k]=current[k].replace('updateIndicationPublic','updateIndication')
    if variant=='wrong_field':
        k='com/zte/mifavor/views/MFVBatteryViewLayout.java';current[k]=current[k].replace('public int mBateryLevel','public float mBateryLevel')
    if variant=='no_raw':
        k='com/zte/utils/SystemuiUtils.java';current[k]=current[k].replace('int getRawBatteryLevel','long getRawBatteryLevel')
    with tempfile.TemporaryDirectory(prefix='duo-battery-') as folder:
        paths=[]
        for name,source in current.items():
            p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf8');paths.append(p)
        paths += [SRC/'BatteryPercentagePolicy.java',SRC/'hook/BatteryChargeEstimate.java',SRC/'hook/BatteryPercentageHook.java']
        subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*map(str,paths)],check=True)
        subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestBattery',*([variant] if variant in ('wrong_field','no_raw') else [])],check=True)
