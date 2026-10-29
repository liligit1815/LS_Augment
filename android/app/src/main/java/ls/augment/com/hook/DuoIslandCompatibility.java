package ls.augment.com.hook;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Duo's ordinary OEM window contract; this does not select the OEM Nebula Island product. */
final class DuoIslandCompatibility {
    final boolean legacyCards,legacyLifecycle;
    final Constructor<?> islandConstructor;
    final Method configRegistration;
    final String route;
    private DuoIslandCompatibility(boolean cards,boolean lifecycle,Constructor<?> constructor,Method registration){
        legacyCards=cards;legacyLifecycle=lifecycle;islandConstructor=constructor;configRegistration=registration;
        route=cards?"legacy_ordinary":"app_template_ordinary";
    }
    static DuoIslandCompatibility resolve(ClassLoader loader,Object manager,Object permanent,Context context)throws Exception {
        if(context==null)throw new IllegalStateException("duo_host_context_missing");
        Class<?> tools=Class.forName("com.zte.tools.AppTools",false,loader);
        Field full=optionalField(tools,"ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN");
        if(full!=null){
            if(full.getType()!=boolean.class||!Modifier.isStatic(full.getModifiers()))
                throw new NoSuchFieldException("duo_fullscreen_flag_requires_static_boolean");
            full.setAccessible(true);
            if(full.getBoolean(null))throw new IllegalStateException("duo_fullscreen_branch_requires_adapter");
        }
        Class<?> pm=permanent.getClass(),dm=manager.getClass();
        boolean legacy="permanent_visibility".equals(NativeIslandWake.contract(manager,permanent));
        // Missing is not false: only the verified pre-fullscreen AOD/window contract may omit the flag.
        if(full==null&&(!legacy||optionalField(pm,"mDynamicIslandPanelRoot")!=null
                ||optionalField(pm,"mDynamicIslandFuncEnable")!=null||optionalField(pm,"mStickyAnimationView")!=null))
            throw new NoSuchFieldException("duo_fullscreen_flag_missing_on_unknown_host");
        for(String name:new String[]{"mDynamicIslandRoot","mDynamicIslandContainer","mDynamicPanelContainer","mDynamicPermanentContainer"})
            field(pm,name,ViewGroup.class);
        field(pm,"mParams",WindowManager.LayoutParams.class);field(pm,"mWindowManager",WindowManager.class);
        field(pm,"mIsDynamicIslandEnable",boolean.class);field(dm,"mContext",Context.class);
        method(dm,"initDynamicIsland",void.class);
        Method registration=optionalMethod(dm,"registerConfigChangeListener");
        if(registration!=null)method(dm,"registerConfigChangeListener",void.class);
        else if(!legacy)throw new NoSuchMethodException("duo_config_listener_missing_on_unknown_host");
        Class<?> island=Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,loader);
        method(pm,"addPermanentIslandInner",void.class,island);method(pm,"removePermanentIslandInner",void.class,island);
        method(pm,"getPermanentIsland",island);method(pm,"showPermanentPanelIsland",void.class);
        method(pm,"onKeyguardStateChanged",void.class,boolean.class);
        layout(context,"dynamic_island_layout");layout(context,"media_island_layout");layout(context,"charging_island_layout");
        boolean app=hasLayout(context,"app_island_layout"),panel=hasLayout(context,"app_island_panel_layout");
        Method init=optionalMethod(island,"initAppIsland",String.class,String.class,String.class,byte[].class,byte[].class,String.class,byte[].class,String.class);
        Method initPanel=optionalMethod(island,"initPanelIsland",String.class,String.class);
        Method setPanel=optionalMethod(island,"setPanelIsland",island);
        if(app&&panel&&init!=null&&initPanel!=null&&setPanel!=null){
            requireVoid(init);requireVoid(initPanel);requireVoid(setPanel);
            method(pm,"updateResources",void.class);method(pm,"updateDynamicWindowParams",void.class);
            return new DuoIslandCompatibility(false,false,null,registration);
        }
        // A partial new contract is a broken/unknown template, not an invitation to replace it.
        if(!legacy||app||panel||init!=null||initPanel!=null||setPanel!=null)
            throw new NoSuchMethodException("duo_app_templates_incomplete");
        if(!FrameLayout.class.isAssignableFrom(island)||Modifier.isAbstract(island.getModifiers()))
            throw new NoSuchMethodException("duo_legacy_island_not_concrete_frame");
        Constructor<?> constructor=island.getDeclaredConstructor(Context.class,AttributeSet.class);constructor.setAccessible(true);
        field(island,"mViewList",java.util.List.class);field(island,"mKeyguardIsland",boolean.class);
        method(island,"getPanelIsland",island);method(island,"getPanelType",int.class);
        method(island,"updateViewVisibility",void.class,boolean.class,boolean.class);
        method(island,"updatePanelVisibility",void.class,boolean.class,boolean.class,boolean.class);
        method(island,"updateViewAlpha",void.class,android.view.View.class,boolean.class,boolean.class);
        method(pm,"updateDynamicWindowHeightParams",void.class,boolean.class);
        return new DuoIslandCompatibility(true,true,constructor,registration);
    }
    void registerConfiguration(Object manager)throws Exception {if(configRegistration!=null)configRegistration.invoke(manager);}
    private static void requireVoid(Method method)throws NoSuchMethodException {
        if(method.getReturnType()!=void.class||Modifier.isStatic(method.getModifiers())||Modifier.isAbstract(method.getModifiers()))
            throw new NoSuchMethodException("duo_incompatible_method_"+method.getName());
    }
    private static Method method(Class<?> type,String name,Class<?> result,Class<?>...args)throws NoSuchMethodException {
        Method method=optionalMethod(type,name,args);
        if(method==null||method.getReturnType()!=result||Modifier.isStatic(method.getModifiers())||Modifier.isAbstract(method.getModifiers()))
            throw new NoSuchMethodException("duo_missing_method_"+name);
        return method;
    }
    private static Method optionalMethod(Class<?> type,String name,Class<?>...args){
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(name,args);m.setAccessible(true);return m;}
        catch(NoSuchMethodException absent){/* OEM subclass. */}
        return null;
    }
    private static Field field(Class<?> type,String name,Class<?> expected)throws NoSuchFieldException {
        Field value=optionalField(type,name);
        if(value==null||!expected.isAssignableFrom(value.getType())||Modifier.isStatic(value.getModifiers()))
            throw new NoSuchFieldException("duo_missing_field_"+name+":"+expected.getSimpleName());
        return value;
    }
    private static Field optionalField(Class<?> type,String name){
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{return c.getDeclaredField(name);}
        catch(NoSuchFieldException absent){/* OEM subclass. */}
        return null;
    }
    // Names refer to the injected SystemUI host, never the module APK.
    //noinspection DiscouragedApi
    private static boolean hasLayout(Context c,String name){return c.getResources().getIdentifier(name,"layout","com.android.systemui")!=0;}
    private static void layout(Context c,String name){if(!hasLayout(c,name))throw new IllegalStateException("duo_missing_layout_"+name);}
}
