"""Exercise production OEM diagnostic scopes and bounded periodic inventory deferral."""
from pathlib import Path
import subprocess,tempfile
from notification_view_runtime_facade import FILES
ROOT=Path(__file__).resolve().parents[1]
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
module=FILES['ls/augment/com/hook/AugmentModule.java']
module=module.replace('target.getClass().getMethod("native_"+method.getName()', '(target==null?method.getDeclaringClass():target.getClass()).getMethod("native_"+method.getName()')
module=module.replace('target.getClass().getDeclaredMethod(name,types)','lookup(target.getClass(),name,types)')
module=module.replace('public static Object invoke(','''static Method lookup(Class<?> c,String n,Class<?>[] p)throws Exception{for(;c!=null;c=c.getSuperclass())try{return c.getDeclaredMethod(n,p);}catch(NoSuchMethodException e){}throw new NoSuchMethodException(n);}
public static Object invokeStatic(Class<?> owner,String name,Class<?>[] types,Object...args){try{Method m=owner.getDeclaredMethod(name,types);Chain c=new Chain(null,m,args);Interceptor h=active.hooks.get(m);return h==null?c.proceed():h.run(c);}catch(RuntimeException e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}
public static Object invoke(''')
source=ROOT/'android/app/src/main/java/ls/augment/com/hook'
assets=(source/'StatusBarAssetsHook.java').read_text('utf-8')
poll=assets[assets.index('    private static final Runnable POLL'):assets.index('    private static final Runnable ARTWORK_TICK')]
files={
'ls/augment/com/hook/AugmentModule.java':module,
'io/github/libxposed/api/XposedInterface.java':FILES['io/github/libxposed/api/XposedInterface.java'],
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now=1000;public static long uptimeMillis(){return now;}}',
'android/view/View.java':'package android.view;public class View{}',
'android/view/MotionEvent.java':'package android.view;public class MotionEvent{public static final int ACTION_MOVE=2;final int action;public MotionEvent(int a){action=a;}public int getActionMasked(){return action;}}',
'android/os/Debug.java':'''package android.os;public class Debug{public static int captures;
public static String getCallers(int depth){return (String)ls.augment.com.hook.AugmentModule.invokeStatic(Debug.class,"getCallers",new Class<?>[]{int.class},depth);}
public static String native_getCallers(int depth){captures++;return "native "+depth;}}''',
'ls/augment/com/hook/FeatureSettings.java':'package ls.augment.com.hook;class FeatureSettings{static Object from(Object v){return v;}static String last;static void diagnostic(Object c,String k,String v){last=v;}}',
'com/android/systemui/shade/NotificationPanelViewController.java':'''package com.android.systemui.shade;
public class NotificationPanelViewController{public int heightWrites;public float height;
public void setExpandedHeightInternal(float f){heightWrites++;height=f;}}''',
'com/zte/controlcenter/policy/MfvNotificationPanelViewController.java':'''package com.zte.controlcenter.policy;
public class MfvNotificationPanelViewController extends com.android.systemui.shade.NotificationPanelViewController{
public boolean mNCSwitching,mPanelOpening,mPanelCollapsing;public String trace;
@Override public void setExpandedHeightInternal(float f){ls.augment.com.hook.AugmentModule.invoke(this,"setExpandedHeightInternal",new Class<?>[]{float.class},f);}
public void native_setExpandedHeightInternal(float f){trace=android.os.Debug.getCallers(7);super.setExpandedHeightInternal(mNCSwitching?Math.min(500,f):f);}}
''',
'com/zte/controlcenter/policy/NCSwitchController.java':'''package com.zte.controlcenter.policy;
public class NCSwitchController{public boolean mIsCNHandleTouch;public float mInitialTouchX,mInitialTouchY;public int mTouchSlop,writes;public String trace;
public boolean handleCNSwitchTouch(android.view.MotionEvent e,boolean b){return (Boolean)ls.augment.com.hook.AugmentModule.invoke(this,"handleCNSwitchTouch",new Class<?>[]{android.view.MotionEvent.class,boolean.class},e,b);}
public boolean native_handleCNSwitchTouch(android.view.MotionEvent e,boolean b){writes++;mIsCNHandleTouch=b;trace=android.os.Debug.getCallers(2);return e.getActionMasked()==2&&b;}}
''',
'com/zte/controlcenter/ControlPanelWindowView.java':'''package com.zte.controlcenter;
public class ControlPanelWindowView extends android.view.View{
public float mExpandHeight,mBlurRatio;public boolean mAttached,mContentShowing,extra,nested,fail;public int heights,blurs;public String heightTrace,blurTrace,extraTrace;
public void updateExpandHeight(float f){ls.augment.com.hook.AugmentModule.invoke(this,"updateExpandHeight",new Class<?>[]{float.class},f);}
public void native_updateExpandHeight(float f){heights++;mExpandHeight=f;heightTrace=android.os.Debug.getCallers(4);if(nested)updateBlur(f,true,false);if(extra)extraTrace=android.os.Debug.getCallers(4);if(fail)throw new IllegalStateException("native error");}
public void updateBlur(float f,boolean a,boolean b){ls.augment.com.hook.AugmentModule.invoke(this,"updateBlur",new Class<?>[]{float.class,boolean.class,boolean.class},f,a,b);}
public void native_updateBlur(float f,boolean a,boolean b){blurs++;mBlurRatio=f;blurTrace=android.os.Debug.getCallers(4);if(!a||b)throw new IllegalStateException("arguments changed");}}
''',
'ls/augment/com/hook/ShadeAnimationTraceHook.java':(source/'ShadeAnimationTraceHook.java').read_text('utf-8'),
'ls/augment/com/hook/PollCase.java':'''package ls.augment.com.hook;
import java.util.*;import android.os.SystemClock;
class PollCase{
static boolean interactive=true,polling;static int scans;static List<Object> ROOTS=List.of(1),ENTRIES=List.of();
static class Handler{Runnable pending;long delay;void postDelayed(Runnable r,long d){pending=r;delay=d;}}static Handler MAIN=new Handler();
static void updatePower(){}static void discover(){scans++;}static void requestSurface(){}static void schedulePoll(){polling=true;MAIN.postDelayed(POLL,5000);}
'''+poll+'''
static void check(boolean b){if(!b)throw new AssertionError("poll starvation/restoration");}
static void test(com.zte.controlcenter.ControlPanelWindowView w){
SystemClock.now=10000;w.updateExpandHeight(5);POLL.run();check(scans==0&&polling&&MAIN.delay==250);
for(int i=1;i<=3;i++){SystemClock.now=10000+i*250;w.updateExpandHeight(5);POLL.run();check(scans==0);}
SystemClock.now=11000;w.updateExpandHeight(5);POLL.run();check(scans==1&&MAIN.delay==5000);
SystemClock.now=12000;POLL.run();check(scans==2&&MAIN.delay==5000);
SystemClock.now=13000;w.updateExpandHeight(5);POLL.run();interactive=false;SystemClock.now=13250;POLL.run();check(scans==3&&!polling);
}}
''',
'ls/augment/com/hook/TestShade.java':'''package ls.augment.com.hook;
import android.os.*;import android.view.*;import com.zte.controlcenter.*;import com.zte.controlcenter.policy.*;
public class TestShade{
static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
public static class Sub extends ControlPanelWindowView{}
public static class PanelSub extends MfvNotificationPanelViewController{}
public static void main(String[] args)throws Exception{
String mode=args[0];AugmentModule m=new AugmentModule();AugmentModule.active=m;
if(mode.equals("partial"))m.failAt=2;
ClassLoader loader=new ClassLoader(TestShade.class.getClassLoader()){@Override protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException{if((mode.equals("missing")&&n.startsWith("com.zte."))||(mode.equals("missing_base")&&n.equals("com.android.systemui.shade.NotificationPanelViewController")))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
int count=ShadeAnimationTraceHook.install(m,loader);
if(!mode.equals("modern")){check(count==(mode.equals("missing")?0:mode.equals("wrong_type")?3:4),"capability paths independent");check(m.hooks.size()==count,"partial installation releases failed scope/global no-target hook");System.out.println("PASS shade fallback "+mode);return;}
check(count==5,"four exact native targets and scoped helper");ControlPanelWindowView w=new Sub();NCSwitchController c=new NCSwitchController();MfvNotificationPanelViewController panel=new PanelSub();
for(int i=0;i<1000;i++){check(c.handleCNSwitchTouch(new MotionEvent(2),true),"native touch return");w.updateExpandHeight(i);w.updateBlur(i,true,false);panel.setExpandedHeightInternal(i);}
check(c.writes==1000&&w.heights==1000&&w.blurs==1000&&w.mExpandHeight==999&&w.mBlurRatio==999,"all native writes retained");
check(Debug.captures==4&&w.heightTrace.contains("omitted")&&c.trace.contains("omitted")&&panel.trace.contains("omitted"),"separate bounded budgets");
check(panel.heightWrites==1000&&panel.height==999,"notification animation reaches native parent");
panel.mNCSwitching=true;panel.setExpandedHeightInternal(999);check(panel.height==500,"native horizontal-switch height clamp preserved");
int panelBefore=Debug.captures;panel.setExpandedHeightInternal(Float.NaN);check(Float.isNaN(panel.height)&&Debug.captures==panelBefore+1,"notification invalid-height diagnostic preserved");
for(int action:new int[]{0,1,3}){int before=Debug.captures;check(!c.handleCNSwitchTouch(new MotionEvent(action),true)&&Debug.captures==before+1,"DOWN/UP/CANCEL untouched");}
int before=Debug.captures;w.updateExpandHeight(Float.NaN);w.updateBlur(Float.POSITIVE_INFINITY,true,false);check(Debug.captures==before+2&&Float.isNaN((float)w.mExpandHeight)&&Float.isInfinite(w.mBlurRatio),"invalid native values and diagnostics preserved");
check(Debug.getCallers(4).equals("native 4"),"outside call preserved");
w.extra=true;w.nested=true;w.updateExpandHeight(6);check(w.extraTrace.equals("native 4")&&w.blurTrace.contains("omitted"),"first-call-only and nested scope restored");w.extra=false;w.nested=false;
w.fail=true;try{w.updateExpandHeight(4);throw new AssertionError();}catch(IllegalStateException expected){check(expected.getMessage().equals("native error"),"exception preserved");}w.fail=false;
check(Debug.getCallers(4).equals("native 4"),"exception clears scope");
Thread other=new Thread(()->check(Debug.getCallers(4).equals("native 4"),"other thread native"));other.start();other.join();
SystemClock.now=7000;w.updateExpandHeight(8);check(w.heightTrace.equals("native 4")&&FeatureSettings.last.contains("suppressed="),"periodic sample and diagnostics");
check(ShadeAnimationTraceHook.motionRecent(7100)&&!ShadeAnimationTraceHook.motionRecent(7250)&&!ShadeAnimationTraceHook.motionRecent(6000),"motion cooldown/time reversal");
PollCase.test(w);System.out.println("PASS shade "+checks+" checks + bounded periodic poll, native movement/results/exceptions preserved");}}
'''
}
for variant in ['modern','partial','missing','wrong_type','legacy','missing_base','wrong_panel_type']:
 with tempfile.TemporaryDirectory(prefix='duo-shade-budget-') as folder:
  paths=[]
  for name,text in files.items():
   if variant=='wrong_type' and name.endswith('/ControlPanelWindowView.java'):text=text.replace('public float mExpandHeight,mBlurRatio;','public double mExpandHeight;public float mBlurRatio;')
   if variant=='legacy' and name.endswith('/NCSwitchController.java'):text=text.replace('boolean b','Boolean b').replace('boolean.class','Boolean.class')
   if variant=='wrong_panel_type' and name.endswith('/MfvNotificationPanelViewController.java'):text=text.replace('boolean mNCSwitching,mPanelOpening,mPanelCollapsing;','boolean mNCSwitching,mPanelOpening;public int mPanelCollapsing;')
   target=Path(folder)/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(text,'utf-8');paths.append(str(target))
  subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*paths],check=True)
  subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestShade',variant],check=True)
