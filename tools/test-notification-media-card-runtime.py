"""Run the production OEM card hooks: hot restore, native updates and media surface isolation."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
'android/content/Context.java': 'package android.content;public class Context {}',
'android/os/Looper.java': 'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java': '''package android.os;public class Handler{public Handler(Looper l){}
 public static final java.util.List<Runnable> queue=new java.util.ArrayList<>();public boolean post(Runnable r){queue.add(r);return true;}
 public static void drain(){while(!queue.isEmpty())queue.remove(0).run();}}''',
'android/view/View.java': '''package android.view;public class View{
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8;private int visibility;private final android.content.Context context=new android.content.Context();
 public int getVisibility(){return visibility;}public void setVisibility(int v){visibility=v;}public android.content.Context getContext(){return context;}}''',
'io/github/libxposed/api/XposedInterface.java': 'package io.github.libxposed.api;public interface XposedInterface{interface HookHandle{void unhook();}}',
'ls/augment/com/SystemUiOptions.java': 'package ls.augment.com;public class SystemUiOptions{public static final String NOTIFICATION_MEDIA_HIDE="ls_augment_rm_notification_media_hide";}',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;public class FeatureSettings{
 static boolean hidden,fail;static Runnable listener;static int subscriptions,diagnostics;
 static final java.util.Map<String,String> diagnosticValues=new java.util.HashMap<>();
 static android.content.Context from(Object owner){return new android.content.Context();}
 static boolean enabled(android.content.Context c,String key){if(fail)throw new IllegalStateException("settings unavailable");return hidden;}
 static boolean addSnapshotListener(android.content.Context c,Runnable r){listener=r;subscriptions++;return true;}
 static void diagnostic(android.content.Context c,String key,String value){diagnostics++;diagnosticValues.put(key,value);}
 static void change(boolean value){hidden=value;if(listener!=null)listener.run();android.os.Handler.drain();}}''',
'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
 import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.HookHandle;
 public class AugmentModule{
 public static AugmentModule active;final Map<Method,Interceptor> hooks=new HashMap<>();int failAt=-1,built,removed,errors,deoptimized;
 interface Interceptor{Object run(Chain c)throws Throwable;}
 static class Chain{final Object target;final Method method;final Object[] args;Chain(Object t,Method m,Object[] a){target=t;method=m;args=a;}
 Object getThisObject(){return target;}List<Object> getArgs(){return Arrays.asList(args);}Object proceed()throws Throwable{return proceed(args);}
 Object proceed(Object[] a)throws Throwable{try{return target.getClass().getMethod("native_"+method.getName(),method.getParameterTypes()).invoke(target,a);}
 catch(InvocationTargetException e){throw e.getCause();}}}
 class Builder{final Method method;Builder(Method m){method=m;}HookHandle intercept(Interceptor i){if(++built==failAt)throw new IllegalStateException("partial install");hooks.put(method,i);return ()->{hooks.remove(method);removed++;};}}
 Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(m);}void registerFeatureHook(HookHandle h){}void logFeatureInfo(String s){}
 void logFeatureError(String s,Throwable e){errors++;}void deoptimize(Method m){deoptimized++;}
 public static Object invoke(Object target,String name,Class<?>[] types,Object...args){try{Method m=target.getClass().getDeclaredMethod(name,types);Chain c=new Chain(target,m,args);
 Interceptor hook=active.hooks.get(m);return hook==null?c.proceed():hook.run(c);}catch(RuntimeException e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}
 }''',
'com/android/systemui/plugins/statusbar/StatusBarStateController.java': 'package com.android.systemui.plugins.statusbar;public interface StatusBarStateController{int getState();}',
'com/android/systemui/media/controls/ui/controller/KeyguardMediaController.java': '''package com.android.systemui.media.controls.ui.controller;
 import android.content.Context;import android.view.View;import ls.augment.com.hook.AugmentModule;import com.android.systemui.plugins.statusbar.StatusBarStateController;
 public class KeyguardMediaController{
 public final Context context=new Context();public final StatusBarStateController statusBarStateController=new Status();
 public final View singlePaneContainer=new View(),splitShadeContainer=new View();public boolean mediaPresent=true,baseAllowed=true,visible,useSplitShade;
 public int refreshCalls,predicateCalls;public static class Status implements StatusBarStateController{public int value;public int getState(){return value;}}
 public void refreshMediaPosition(String reason){AugmentModule.invoke(this,"refreshMediaPosition",new Class<?>[]{String.class},reason);}
 public void native_refreshMediaPosition(String reason){refreshCalls++;boolean allowed=shouldBeVisibleForSplitShade();visible=mediaPresent&&allowed;
 singlePaneContainer.setVisibility(visible&&!useSplitShade?View.VISIBLE:View.GONE);splitShadeContainer.setVisibility(visible&&useSplitShade?View.VISIBLE:View.GONE);}
 public boolean shouldBeVisibleForSplitShade(){return (Boolean)AugmentModule.invoke(this,"shouldBeVisibleForSplitShade",new Class<?>[]{});}
 public boolean native_shouldBeVisibleForSplitShade(){predicateCalls++;return baseAllowed;}
 }''',
'com/zte/feature/notification/module/NotificationMediaPanel.java': '''package com.zte.feature.notification.module;
 import ls.augment.com.hook.AugmentModule;
 public class NotificationMediaPanel extends android.view.View{
 public int visibilityCalls,inflates,attaches,bindings,removed;public boolean sessionPlaying,failVisibility;public Object media;
 public void setVisibility(int v){AugmentModule.invoke(this,"setVisibility",new Class<?>[]{int.class},v);}
 public void native_setVisibility(int v){visibilityCalls++;if(failVisibility)throw new IllegalStateException("OEM setter failure");super.setVisibility(v);}
 public void onFinishInflate(){AugmentModule.invoke(this,"onFinishInflate",new Class<?>[]{});}public void native_onFinishInflate(){inflates++;}
 public void onAttachedToWindow(){AugmentModule.invoke(this,"onAttachedToWindow",new Class<?>[]{});}public void native_onAttachedToWindow(){attaches++;}
 public void bindPlayer(Object data,String key){bindings++;media=data;sessionPlaying=data!=null;setVisibility(data==null?GONE:VISIBLE);}
 public void removePlayer(String key){removed++;media=null;sessionPlaying=false;setVisibility(GONE);}
 }''',
'ls/augment/com/hook/TestNotificationMediaCard.java': '''package ls.augment.com.hook;
 import android.view.View;import com.zte.feature.notification.module.NotificationMediaPanel;
 public class TestNotificationMediaCard{
 static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 public static void main(String[] args)throws Exception{
 AugmentModule bad=new AugmentModule();AugmentModule.active=bad;bad.failAt=2;
 ClassLoader panelOnly=new ClassLoader(TestNotificationMediaCard.class.getClassLoader()){
 @Override protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{if(name.endsWith("KeyguardMediaController"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}};
 check(NotificationMediaCardHook.install(bad,panelOnly)==0&&bad.hooks.isEmpty()&&bad.removed==1,"partial hooks roll back");
 AugmentModule module=new AugmentModule();AugmentModule.active=module;
 check(NotificationMediaCardHook.install(module,TestNotificationMediaCard.class.getClassLoader())==5,"both native notification card contracts hooked");
 check(NotificationMediaCardHook.install(module,TestNotificationMediaCard.class.getClassLoader())==0&&module.hooks.size()==5,"single install");
 check(module.deoptimized==3,"small visibility callers deoptimized");
 check(FeatureSettings.diagnosticValues.get("ls_augment_notification_media_card_installed").contains("controllerHooks=2"),"real installation path recorded before first view callback");
 View controlCenter=new View(),island=new View(),notificationRow=new View();
 NotificationMediaPanel card=new NotificationMediaPanel();card.onFinishInflate();card.onAttachedToWindow();Object media=new Object();card.bindPlayer(media,"one");
 check(card.getVisibility()==View.VISIBLE&&card.bindings==1&&card.media==media&&card.sessionPlaying,"disabled leaves playback and card native");
 check(card.inflates==1&&card.attaches==1&&FeatureSettings.subscriptions==1,"native lifecycle executes once and observes snapshot once");
 int before=card.visibilityCalls;FeatureSettings.change(true);
 check(card.getVisibility()==View.GONE&&card.visibilityCalls==before+1,"hot enable removes existing card and its layout space");
 check(card.bindings==1&&card.media==media&&card.sessionPlaying,"hiding does not cancel media session or rebind data");
 check(controlCenter.getVisibility()==View.VISIBLE&&island.getVisibility()==View.VISIBLE&&notificationRow.getVisibility()==View.VISIBLE,"control center island and notification rows unaffected");
 card.bindPlayer(media,"one");check(card.getVisibility()==View.GONE&&card.bindings==2,"new native visible request stays hidden");
 FeatureSettings.change(false);check(card.getVisibility()==View.VISIBLE&&card.media==media&&card.sessionPlaying,"hot disable restores latest OEM visible request");
 FeatureSettings.change(true);card.removePlayer("one");FeatureSettings.change(false);
 check(card.getVisibility()==View.GONE&&card.media==null,"removed session stays gone on disable");
 card.bindPlayer(media,"two");FeatureSettings.change(true);card.setVisibility(View.INVISIBLE);FeatureSettings.change(false);
 check(card.getVisibility()==View.INVISIBLE,"restore preserves native invisible instead of forcing visible");
 FeatureSettings.change(true);NotificationMediaPanel fresh=new NotificationMediaPanel();fresh.onFinishInflate();fresh.onAttachedToWindow();fresh.bindPlayer(media,"fresh");
 check(fresh.getVisibility()==View.GONE&&fresh.media==media&&fresh.sessionPlaying,"newly inflated card is hidden while session stays bound");
 check(FeatureSettings.subscriptions==1,"all cards share one process snapshot observer");
 FeatureSettings.change(false);check(fresh.getVisibility()==View.VISIBLE&&card.getVisibility()==View.INVISIBLE,"each card restores its own OEM visibility");
 // A paused/removed card can change its desired visibility repeatedly while hidden.
 FeatureSettings.change(true);fresh.setVisibility(View.GONE);fresh.setVisibility(View.VISIBLE);FeatureSettings.change(false);
 check(fresh.getVisibility()==View.VISIBLE,"latest native request wins while hidden");
 fresh.setVisibility(View.GONE);FeatureSettings.change(true);FeatureSettings.change(false);
 check(fresh.getVisibility()==View.GONE,"already hidden card never resurrected");
 card.failVisibility=true;before=card.visibilityCalls;try{card.setVisibility(View.VISIBLE);throw new AssertionError("missing OEM failure");}catch(IllegalStateException expected){}
 check(card.visibilityCalls==before+1,"OEM setter failure propagates without replay");card.failVisibility=false;
 FeatureSettings.hidden=true;FeatureSettings.fail=true;fresh.setVisibility(View.VISIBLE);FeatureSettings.fail=false;
 check(fresh.getVisibility()==View.VISIBLE&&module.errors>0,"snapshot failure fails open to native visibility");
 FeatureSettings.change(true);check(fresh.getVisibility()==View.GONE,"later snapshot repairs fail-open state");
 FeatureSettings.change(false);check(fresh.getVisibility()==View.VISIBLE,"failure did not corrupt restoration");
 // The current NX809J runtime uses this path even though NotificationMediaPanel exists in the APK.
 com.android.systemui.media.controls.ui.controller.KeyguardMediaController controller=new com.android.systemui.media.controls.ui.controller.KeyguardMediaController();
 com.android.systemui.media.controls.ui.controller.KeyguardMediaController.Status status=(com.android.systemui.media.controls.ui.controller.KeyguardMediaController.Status)controller.statusBarStateController;
 controller.refreshMediaPosition("first attach");
 check(controller.visible&&controller.singlePaneContainer.getVisibility()==View.VISIBLE,"standard native media container initially visible");
 int refreshBefore=controller.refreshCalls;FeatureSettings.change(true);
 check(!controller.visible&&controller.singlePaneContainer.getVisibility()==View.GONE&&controller.refreshCalls==refreshBefore+1,"hot enable re-evaluates OEM visibility and collapses actual container");
 check(controller.mediaPresent&&controlCenter.getVisibility()==View.VISIBLE&&island.getVisibility()==View.VISIBLE,"container policy preserves media data control center and island");
 check(FeatureSettings.diagnosticValues.get("ls_augment_notification_media_card").contains("hidden=true"),"actual hide callback records applied state");
 controller.refreshMediaPosition("native refresh");check(!controller.visible,"native refresh cannot reshow hidden notification card");
 status.value=1;controller.refreshMediaPosition("lockscreen");check(controller.visible,"KEYGUARD retains native lockscreen media visibility");
 status.value=2;controller.refreshMediaPosition("locked notification shade");check(!controller.visible,"SHADE_LOCKED still hides notification card");
 status.value=3;controller.refreshMediaPosition("unknown surface");check(controller.visible,"unknown status is left native");
 status.value=0;controller.useSplitShade=true;controller.refreshMediaPosition("split shade");
 check(!controller.visible&&controller.splitShadeContainer.getVisibility()==View.GONE,"split notification shade follows same native policy");
 FeatureSettings.change(false);check(controller.visible&&controller.splitShadeContainer.getVisibility()==View.VISIBLE,"hot disable restores native split shade");
 FeatureSettings.change(true);controller.mediaPresent=false;FeatureSettings.change(false);
 check(!controller.visible&&controller.splitShadeContainer.getVisibility()==View.GONE,"removed media cannot be resurrected by disabling hide");
 controller.mediaPresent=true;controller.baseAllowed=false;controller.refreshMediaPosition("native suppression");
 check(!controller.visible,"native bypass and doze suppression are preserved");
 System.out.println("PASS notification media card production hooks: "+checks+" checks");
 }}''',
'ls/augment/com/hook/TestNotificationMediaContainerOnly.java': '''package ls.augment.com.hook;
 import android.view.View;import com.android.systemui.media.controls.ui.controller.KeyguardMediaController;
 public class TestNotificationMediaContainerOnly{
 static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 public static void main(String[] args){
 AugmentModule module=new AugmentModule();AugmentModule.active=module;
 ClassLoader noPanel=new ClassLoader(TestNotificationMediaContainerOnly.class.getClassLoader()){
 @Override protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{if(name.endsWith("NotificationMediaPanel"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}};
 check(NotificationMediaCardHook.install(module,noPanel)==2,"standard container installs independently of optional OEM panel");
 check(FeatureSettings.diagnosticValues.get("ls_augment_notification_media_card_installed").contains("panelHooks=0;controllerHooks=2"),"installation diagnostic distinguishes actual supported adapters");
 KeyguardMediaController controller=new KeyguardMediaController();FeatureSettings.hidden=true;
 controller.refreshMediaPosition("initial already-enabled setting");
 check(!controller.visible&&controller.singlePaneContainer.getVisibility()==View.GONE,"initial enabled setting hides card with zero optional-panel callbacks");
 check(FeatureSettings.subscriptions==1&&FeatureSettings.listener!=null,"native container independently bootstraps configuration observation");
 check(FeatureSettings.diagnosticValues.get("ls_augment_notification_media_card").contains("adapter=KeyguardMediaController;hidden=true"),"native container writes actual callback evidence");
 FeatureSettings.change(false);check(controller.visible&&controller.singlePaneContainer.getVisibility()==View.VISIBLE,"container-only hot disable restores card");
 FeatureSettings.change(true);check(!controller.visible,"container-only hot enable hides again");
 check(FeatureSettings.subscriptions==1,"container refresh never duplicates the observer");
 System.out.println("PASS standalone notification media container bootstrap: "+checks+" checks");
 }}''',
}

with tempfile.TemporaryDirectory(prefix='lsa-notification-media-') as folder:
    work = Path(folder)
    for name, content in FILES.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding='utf-8')
    sources = [str(path) for path in work.rglob('*.java')]
    sources.append(str(ROOT / 'android/app/src/main/java/ls/augment/com/hook/NotificationMediaCardHook.java'))
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(work), *sources], check=True)
    subprocess.run(['java', '-cp', str(work), 'ls.augment.com.hook.TestNotificationMediaCard'], check=True)
    subprocess.run(['java', '-cp', str(work), 'ls.augment.com.hook.TestNotificationMediaContainerOnly'], check=True)
