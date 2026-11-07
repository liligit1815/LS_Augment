package ls.augment.com.step;

import java.lang.reflect.Method;

/** Reuse the exact adapter returned to the stock brightness controller, including OEM subclasses. */
final class NativeBrightnessBinding {
    static volatile Object adapter;
    static boolean required;
    static void install(ClassLoader cl){
        required=StepMembers.findClassIfExists("com.zte.adapt.mifavor.statusbar.BrightnessControllerAdapt",cl)!=null;
        for(String name:new String[]{"com.zte.controlcenter.view.brightness.BrightnessController","com.android.systemui.settings.brightness.BrightnessController"}){
            Class<?> type=StepMembers.findClassIfExists(name,cl);if(type==null)continue;
            try{
                Method get=OwnershipBridge.method(type,"getAdapt");
                if(!android.content.Context.class.isAssignableFrom(StepMembers.findField(type,"mContext").getType()))
                    throw new NoSuchFieldException("brightness controller context");
                LocalLandscape.exact(android.content.Context.class,"getDisplayId",int.class);
                Class<?> result=get.getReturnType();
                LocalLandscape.exact(result,"convertToBrightVal",float.class,float.class,float.class,float.class,float.class);
                LocalLandscape.exact(result,"convertToSliderVal",int.class,float.class,float.class,float.class,int.class);
                LocalLandscape.exact(result,"getMax",int.class,int.class);
                // Discover the native instance during SystemUI startup, before the
                // asynchronous Step switch has loaded. This hook never changes it.
                StepHooks.hookMethod(get,new StepHook.Discovery(){
                    @Override protected void afterHookedMethod(MethodHookParam p){
                        if(!p.hasThrowable() && p.getResult()!=null){
                            android.content.Context context=(android.content.Context)StepRuntime.field(p.thisObject,"mContext");
                            if(context!=null && Integer.valueOf(0).equals(StepRuntime.call(context,"getDisplayId")))adapter=p.getResult();
                        }
                    }
                });
            }catch(Exception|LinkageError missing){StepRuntime.report(null,0,"原厂亮度映射接入不可用："+name+";"+missing,-1);}
        }
    }
}
