package ls.augment.com.hook;

import android.app.Dialog;
import android.app.KeyguardManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.Settings;
import android.text.InputFilter;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.SeekBar;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicLong;

import io.github.libxposed.api.XposedInterface.Chain;
import ls.augment.com.GameOptions;

/** Additional OEM game features. Each named route fails independently on an unsupported ROM. */
final class GameExtrasHook {
    private static final String PERFORMANCE="cn.nubia.gameassist.performance.PerformanceModeController";
    private static final String ALLOCATION="cn.nubia.gamelauncher.gamecontrolpanel.GameFunctionAllocationView";
    private static final AtomicLong KEEP_PANEL_UNTIL=new AtomicLong();
    private static final Map<EditText,InputFilter[]> EDIT_FILTERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<SeekBar,Integer> SEEKBAR_LIMITS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<String,Long> LAST_HIT=Collections.synchronizedMap(new LinkedHashMap<>());
    private final Map<Dialog,PanelReturn> panelReturns=Collections.synchronizedMap(new WeakHashMap<>());
    private final AugmentModule module;
    private final ClassLoader loader;
    private final Map<String,Integer> registered=new LinkedHashMap<>();
    private int total;
    private GameExtrasHook(AugmentModule module,ClassLoader loader){this.module=module;this.loader=loader;}

    static int install(AugmentModule module,ClassLoader loader,String packageName){
        GameExtrasHook hooks=new GameExtrasHook(module,loader);
        switch(packageName){
            case "cn.nubia.gamelauncher": hooks.space();break;
            case "cn.nubia.gameassist": hooks.assist();break;
            case "cn.nubia.gamehelpmodule": hooks.combo();break;
            case "cn.zte.gamefloat": hooks.gameFloat();break;
            case "cn.nubia.gamehighlights": hooks.highlights();break;
            default:return 0;
        }
        for(Map.Entry<String,Integer> e:hooks.registered.entrySet()){
            FeatureSettings.diagnostic(FeatureSettings.from(null),e.getKey()+"_registration",
                    "package="+packageName+"|methods="+e.getValue()+"|device_validation=pending");
        }
        module.logFeatureInfo("GAME_EXTRAS_REGISTERED package="+packageName+" count="+hooks.total+";device_validation=pending");
        return hooks.total;
    }

    private void space(){
        plugin("cn.nubia.gamelauncher.gamecontrolpanel.config.PluginConfig",new String[]{"isPluginEnable"});
        hook(GameOptions.REDMAGIC_TIME,ALLOCATION,"disableRedMagicTime",void.class,chain->null);
        hook(GameOptions.REDMAGIC_TIME,ALLOCATION,"enableRedMagicTime",void.class,chain->null);
        hook(GameOptions.REDMAGIC_TIME,ALLOCATION,"updateUI",void.class,
                chain->chain.proceed(new Object[]{false}),boolean.class);
        hook(GameOptions.REDMAGIC_TIME,ALLOCATION+"$10","onClick",void.class,chain->{
            Object owner=TargetReflection.field(chain.getThisObject(),"this$0");
            Object checkbox=TargetReflection.field(owner,"redmagicTimeCheckbox");
            if(chain.getArg(0)!=checkbox)return chain.proceed();
            TargetReflection.call(owner,"onClick",chain.getArg(0));
            return null;
        },View.class);
        hook(GameOptions.REDMAGIC_TIME,ALLOCATION,"initView",void.class,chain->{
            Object result=chain.proceed();
            try{
                Object owner=chain.getThisObject();
                boolean saved=Boolean.TRUE.equals(TargetReflection.call(owner,"isGameSwitchOn"));
                set(owner,"isRedmagicTimeCheckboxOpen",saved);
                TargetReflection.call(owner,"setChecked",TargetReflection.field(owner,"redmagicTimeCheckbox"),saved);
                TargetReflection.call(owner,"isShowMoreVideo",saved);
                TargetReflection.call(owner,"updateUI",false);
            }catch(Throwable error){runtimeError(GameOptions.REDMAGIC_TIME,error);}
            return result;
        });
    }

    private void plugin(String className,String[] names){
        for(String name:names){
            hook(GameOptions.PLUGINS,className,name,boolean.class,chain->true,Context.class,String.class);
            hook(GameOptions.PLUGINS,className,name,boolean.class,chain->true,Context.class,String.class,String.class);
            hook(GameOptions.PLUGINS,className,name,boolean.class,chain->true,Context.class,String.class,String.class,boolean.class);
        }
    }

    private void assist(){
        // k/l are the exact GameAssist 17 routes already verified by LS_Augment.
        plugin("cn.nubia.gameassist.plugin.config.PluginConfig",new String[]{"isPluginEnable"});
        hook(GameOptions.PLUGINS,"cn.nubia.gameassist.plugin.config.PluginConfig","k",boolean.class,
                chain->true,Context.class,String.class);
        hook(GameOptions.PLUGINS,"cn.nubia.gameassist.plugin.config.PluginConfig","l",boolean.class,
                chain->true,Context.class,String.class,String.class);
        String active="cn.nubia.gameassist.dessert.policy.ActiveModeController";
        // GameAssist 17: preserve freeform and wake-only preferences; p() still resets
        // the global indicator. Game exit still releases the wake lock, and explicit
        // tile OFF and package uninstall still remove the saved choice.
        hook(GameOptions.REMEMBER_ACTIVE,active,"q",void.class,chain->null);
        hook(GameOptions.REMEMBER_ACTIVE,"cn.nubia.gameassist.dessert.policy.WackLockController",
                "e",void.class,chain->null);
        for(String name:new String[]{"n","o"}){
            hook(GameOptions.REMEMBER_ACTIVE,active,name,void.class,chain->{
                for(StackTraceElement frame:Thread.currentThread().getStackTrace())
                    if(frame.getClassName().equals("cn.nubia.gameassist.dessert.tiles.ActiveModeTile")
                            &&frame.getMethodName().equals("G0"))return null;
                return chain.proceed();
            },String.class);
        }
        hook(GameOptions.REMEMBER_ACTIVE,active,"resetActiveModeSharedPreAllKey",void.class,chain->null);
        hook(GameOptions.REMEMBER_ACTIVE,active,"removeActiveModeSharedPreKey",void.class,chain->{
            for(StackTraceElement frame:Thread.currentThread().getStackTrace())
                if(frame.getMethodName().contains("onLauncherFirstPackage"))return null;
            return chain.proceed();
        },String.class);
        // F0 is the current confirmation dialog; its positive button invokes this exact
        // Runnable. The capability check in C0 has already run before F0 is reached.
        hook(GameOptions.HIDE_DIABLO_DIALOG,PERFORMANCE,"F0",void.class,chain->{
            TargetReflection.call(chain.getThisObject(),"X");
            ((Runnable)chain.getArg(0)).run();
            return null;
        },Runnable.class);
        hook(GameOptions.HIDE_DIABLO_DIALOG,PERFORMANCE,"setBiabloModeEnable",void.class,chain->{
            if(Boolean.TRUE.equals(chain.getArg(1))&&Boolean.TRUE.equals(chain.getArg(2)))
                return chain.proceed(new Object[]{chain.getArg(0),true,false});
            return chain.proceed();
        },String.class,boolean.class,boolean.class);
        panel();
        hook(GameOptions.FREE_RECORD,"cn.nubia.gameassist.performance.PerformanceViewController","r0",int.class,chain->{
            Object value=chain.proceed();
            return GameExtrasPolicy.recordMode((Integer)value,GameExtrasPolicy.callerContains(
                    Thread.currentThread().getStackTrace(),".ManualRecordTile"));
        });
        hook(GameOptions.FREE_RECORD,"cn.nubia.gameassist.utils.Utils","A",boolean.class,chain->{
            if(GameExtrasPolicy.callerContains(Thread.currentThread().getStackTrace(),".ManualRecordTile"))return false;
            return chain.proceed();
        },Context.class);
        for(String type:new String[]{"cn.nubia.gameassist.performance.PerformanceViewController",PERFORMANCE}){
            for(Class<?>[] args:new Class<?>[][]{new Class<?>[0],new Class<?>[]{String.class}}){
                hook(GameOptions.FREE_RECORD,type,"getPerformanceMode",int.class,chain->{
                    Object value=chain.proceed();
                    return GameExtrasPolicy.recordMode((Integer)value,GameExtrasPolicy.callerContains(
                            Thread.currentThread().getStackTrace(),".ManualRecordTile"));
                },args);
            }
        }
        hook(GameOptions.FREE_RECORD,"cn.nubia.gameassist.utils.Utils","isChickenMode",boolean.class,chain->{
            if(GameExtrasPolicy.callerContains(Thread.currentThread().getStackTrace(),".ManualRecordTile"))return false;
            return chain.proceed();
        },Context.class);
        try{
            Class<?> data=Class.forName("cn.nubia.plugin.gameratio.GameRatioData",false,loader);
            hook(GameOptions.GAME_RATIO,"cn.nubia.plugin.gameratio.GameRatioSettingsPanel","setData",void.class,chain->{
                Object result=chain.proceed();
                try{
                    Object choice=TargetReflection.field(chain.getThisObject(),"mSizeChoiceView");
                    Context context=(Context)TargetReflection.call(choice,"getContext");
                    String[] labels={"original","4_3","16_9","21_9","32_9"};
                    int[] ids=new int[labels.length];
                    for(int i=0;i<labels.length;i++){
                        ids[i]=context.getResources().getIdentifier("gameratio_size_"+labels[i],"string","cn.nubia.gameassist");
                        if(ids[i]==0)throw new IllegalStateException("ratio label missing: "+labels[i]);
                    }
                    int selected;
                    try{selected=((Number)TargetReflection.call(chain.getArg(0),"c")).intValue();}
                    catch(ReflectiveOperationException legacy){selected=((Number)TargetReflection.call(choice,"getCheckedId")).intValue();}
                    Method setter;
                    try{setter=choice.getClass().getDeclaredMethod("b",int[].class,int[].class,int.class);}
                    catch(NoSuchMethodException legacy){setter=choice.getClass().getDeclaredMethod("setData",int[].class,int[].class,int.class);}
                    setter.setAccessible(true);setter.invoke(choice,new int[]{0,1,2,3,4},ids,selected);
                }catch(Throwable error){runtimeError(GameOptions.GAME_RATIO,error);}
                return result;
            },data);
        }catch(Throwable error){missing(GameOptions.GAME_RATIO,"GameRatioData",error);}
    }

    private void panel(){
        modeConfirmationPanel();
        for(String tile:new String[]{"cn.nubia.gameassist.plugin.tiles.BiabloTile","cn.nubia.gameassist.plugin.tiles.SuperResolutionTile"}){
            try{
                Class<?> type=Class.forName(tile,false,loader);
                Method click;
                try{click=HookCompatibility.method(type,boolean.class,false,new String[]{"handleClick","T"});}
                catch(NoSuchMethodException absent){click=HookCompatibility.method(type,void.class,false,new String[]{"handleClick","T"});}
                register(GameOptions.COLLAPSE_PANEL,click,chain->{
                    KEEP_PANEL_UNTIL.set(android.os.SystemClock.elapsedRealtime()+1000);
                    return chain.proceed();
                });
            }catch(Throwable error){missing(GameOptions.COLLAPSE_PANEL,tile,error);}
        }
        try{
            Class<?> host=Class.forName("cn.nubia.gameassist.common.TileHost",false,loader);
            Method collapse=HookCompatibility.method(host,void.class,false,new String[]{"collapsePanels","b"});
            register(GameOptions.COLLAPSE_PANEL,collapse,chain->{
                StackTraceElement[] stack=Thread.currentThread().getStackTrace();
                if(GameExtrasPolicy.callerContains(stack,".SuperResolutionTile")
                        ||GameExtrasPolicy.callerContains(stack,".BiabloTile"))return null;
                return chain.proceed();
            });
        }catch(Throwable error){missing(GameOptions.COLLAPSE_PANEL,"TileHost.collapsePanels",error);}
        try{
            Class<?> manager=Class.forName("cn.nubia.gameassist.panel.GameAssistWindowManager",false,loader);
            Method hide=HookCompatibility.method(manager,void.class,false,new String[]{"hideWindow","b"},String.class);
            register(GameOptions.COLLAPSE_PANEL,hide,chain->{
                String reason=(String)chain.getArg(0);
                if(KEEP_PANEL_UNTIL.get()>=android.os.SystemClock.elapsedRealtime()
                        &&GameExtrasPolicy.isAutomaticPanelDismiss(reason))return null;
                return chain.proceed();
            });
            // Intercept the entry on both UI and worker threads. Its lambda only
            // redirects to this entry; hooking both would consume the same event twice.
        }catch(Throwable error){missing(GameOptions.COLLAPSE_PANEL,"GameAssistWindowManager.hideWindow",error);}
    }

    private void modeConfirmationPanel(){
        final PanelAccess access;
        try{access=new PanelAccess(loader);}
        catch(ReflectiveOperationException error){missing(GameOptions.COLLAPSE_PANEL,"panel_restore_contract",error);return;}
        // The panel's window sits above OEM confirmation dialogs and intercepts their
        // buttons. Temporarily yield to just these dialogs, preserving OEM listeners.
        hook(GameOptions.COLLAPSE_PANEL,Dialog.class.getName(),"show",void.class,chain->{
            Dialog dialog=(Dialog)chain.getThisObject();
            if(!dialog.isShowing()&&GameExtrasPolicy.isModeConfirmationCaller(Thread.currentThread().getStackTrace())){
                try{
                    Object manager=access.instance.invoke(null,dialog.getContext());
                    if(access.visible.getBoolean(null)){
                        Class<?> system=Class.forName("com.zte.gameassist.common.SystemMgr",false,loader);
                        String pkg=(String)TargetReflection.call(system,"getCurFullscreenPackage");
                        access.hide.invoke(manager,"lsa_mode_confirmation");
                        panelReturns.put(dialog,new PanelReturn(manager,pkg,access));
                    }
                }catch(Throwable error){runtimeError(GameOptions.COLLAPSE_PANEL,error);}
            }
            return chain.proceed();
        });
        try{
            Method dismiss=Dialog.class.getDeclaredMethod("dismiss");
            // Always remove a pending entry, including if the user disabled the option.
            module.registerFeatureHook(module.prepareFeatureHook(dismiss,"game.panel.confirmation_return",true).intercept(chain->{
                Dialog dialog=(Dialog)chain.getThisObject();
                PanelReturn pending=panelReturns.remove(dialog);
                Object value=chain.proceed();
                if(pending!=null){
                    Context context=dialog.getContext();
                    new Handler(Looper.getMainLooper()).postDelayed(()->{
                        try{
                            if(!FeatureSettings.enabled(context,GameOptions.COLLAPSE_PANEL,false))return;
                            PowerManager power=context.getSystemService(PowerManager.class);
                            KeyguardManager keyguard=context.getSystemService(KeyguardManager.class);
                            if(power==null||!power.isInteractive()||(keyguard!=null&&keyguard.isKeyguardLocked()))return;
                            Class<?> system=Class.forName("com.zte.gameassist.common.SystemMgr",false,loader);
                            if(pending.pkg==null||pending.pkg.isEmpty()
                                    ||!pending.pkg.equals(TargetReflection.call(system,"getCurFullscreenPackage"))
                                    ||!Boolean.TRUE.equals(TargetReflection.call(system,"isGameScene")))return;
                            pending.access.show.invoke(pending.manager,"lsa_mode_confirmation_finished");
                            hit(GameOptions.COLLAPSE_PANEL,"confirmation_finished");
                        }catch(Throwable error){runtimeError(GameOptions.COLLAPSE_PANEL,error);}
                    },100);
                }
                return value;
            }));
            registered.merge(GameOptions.COLLAPSE_PANEL,1,Integer::sum);total++;
        }catch(Throwable error){missing(GameOptions.COLLAPSE_PANEL,"Dialog.dismiss",error);}
    }

    private static final class PanelReturn{
        final Object manager;final String pkg;final PanelAccess access;
        PanelReturn(Object manager,String pkg,PanelAccess access){this.manager=manager;this.pkg=pkg;this.access=access;}
    }

    private static final class PanelAccess{
        final Method instance,hide,show;final Field visible;
        PanelAccess(ClassLoader loader)throws ReflectiveOperationException{
            Class<?> type=Class.forName("cn.nubia.gameassist.panel.GameAssistWindowManager",false,loader);
            instance=HookCompatibility.method(type,type,true,new String[]{"getInstance","O"},Context.class);
            hide=HookCompatibility.method(type,void.class,false,new String[]{"hideWindow","b"},String.class);
            show=HookCompatibility.method(type,void.class,false,new String[]{"showWindow","E0"},String.class);
            visible=HookCompatibility.field(type,boolean.class,true,"mVisible","W");
        }
    }

    private void gameFloat(){
        try{
            Class<?> dialog=Class.forName("cn.zte.gamefloat.gamekeys.entity.GameChickenModeDialog$ChickenModeDialog",false,loader);
            Method show;
            try{show=dialog.getDeclaredMethod("show");}
            catch(NoSuchMethodException legacy){show=Dialog.class.getDeclaredMethod("show");}
            register(GameOptions.HIDE_DIABLO_DIALOG,show,chain->dialog.isInstance(chain.getThisObject())?null:chain.proceed());
        }catch(Throwable error){missing(GameOptions.HIDE_DIABLO_DIALOG,"GameChickenModeDialog",error);}
    }

    private void combo(){
        try{
            Method find=View.class.getDeclaredMethod("findViewById",int.class);
            // This hook must run while disabled too, so a reused editor can recover its old bounds.
            module.registerFeatureHook(module.prepareFeatureHook(find,"game.combo_editor_bounds",false).intercept(chain->{
                Object value=chain.proceed();
                if(!(value instanceof EditText)&&!(value instanceof SeekBar))return value;
                View view=(View)value;
                try{
                    String name=view.getResources().getResourceEntryName((Integer)chain.getArg(0));
                    boolean enabled=FeatureSettings.enabled(view.getContext(),GameOptions.COMBO_LIMITS,false);
                    if(value instanceof EditText&&"edt_loop_count".equals(name)){
                        EditText edit=(EditText)value;
                        if(enabled){
                            InputFilter[] originals=EDIT_FILTERS.get(edit);
                            if(originals==null){originals=edit.getFilters();EDIT_FILTERS.put(edit,originals);}
                            ArrayList<InputFilter> filters=new ArrayList<>();
                            for(InputFilter filter:originals)if(!(filter instanceof InputFilter.LengthFilter))filters.add(filter);
                            filters.add(new InputFilter.LengthFilter(6));edit.setFilters(filters.toArray(new InputFilter[0]));
                            hit(GameOptions.COMBO_LIMITS,"loop_digits=6");
                        }else{InputFilter[] originals=EDIT_FILTERS.remove(edit);if(originals!=null)edit.setFilters(originals);}
                    }else if(value instanceof SeekBar&&"seekbar_loop_delay".equals(name)){
                        SeekBar seek=(SeekBar)value;
                        if(enabled){if(!SEEKBAR_LIMITS.containsKey(seek))SEEKBAR_LIMITS.put(seek,seek.getMax());seek.setMax(3600);hit(GameOptions.COMBO_LIMITS,"delay_max=3600_oem_units");}
                        else{Integer original=SEEKBAR_LIMITS.remove(seek);if(original!=null)seek.setMax(original);}
                    }
                }catch(Throwable error){runtimeError(GameOptions.COMBO_LIMITS,error);}
                return value;
            }));
            registered.put(GameOptions.COMBO_LIMITS,1);total++;
        }catch(Throwable error){missing(GameOptions.COMBO_LIMITS,"View.findViewById",error);}
    }

    private void highlights(){
        // Manual recording shares the highlighter engine. Its own switch must cover
        // engine eligibility too, but must not unlock automatic highlights.
        for(String name:new String[]{"L","M"})hook(GameOptions.FREE_RECORD,"p.p",name,boolean.class,chain->{
            if(manualRecordingRequested()&&GameExtrasPolicy.recordingCaller(
                    Thread.currentThread().getStackTrace(),"L".equals(name)))return false;
            return chain.proceed();
        });
        hook(GameOptions.FREE_RECORD,"cn.nubia.gamehighlights.Activity.MainActivity$g$a","c",void.class,chain->{
            if(Integer.valueOf(10).equals(chain.getArg(0))&&manualRecordingRequested())return null;
            return chain.proceed();
        },int.class);
        for(String name:new String[]{"L","M"})hook(GameOptions.HIGHLIGHTS,"p.p",name,boolean.class,chain->{
            if(GameExtrasPolicy.recordingCaller(Thread.currentThread().getStackTrace(),"L".equals(name)))return false;
            return chain.proceed();
        });
        hook(GameOptions.HIGHLIGHTS,"cn.nubia.gamehighlights.Activity.MainActivity$g$a","c",void.class,chain->{
            if(Integer.valueOf(10).equals(chain.getArg(0)))return null;
            return chain.proceed();
        },int.class);
    }

    private boolean manualRecordingRequested(){
        Context context=FeatureSettings.from(null);
        return context!=null&&Settings.Global.getInt(context.getContentResolver(),"manual_record",0)==1;
    }

    private void hook(String key,String type,String name,Class<?> result,Action action,Class<?>...args){
        try{
            Method method=Class.forName(type,false,loader).getDeclaredMethod(name,args);
            if(method.getReturnType()!=result)throw new NoSuchMethodException("return type "+name);
            register(key,method,action);
        }catch(Throwable error){missing(key,type+"."+name,error);}
    }
    private void register(String key,Method method,Action action){
        method.setAccessible(true);
        module.registerFeatureHook(module.prepareFeatureHook(method,"game.extra."+key+"."+method.toGenericString(),true).intercept(chain->{
            Context context=FeatureSettings.from(chain.getThisObject());
            if(!FeatureSettings.enabled(context,key,false))return chain.proceed();
            // Protective exception mode handles errors before original execution. Actions that
            // run after proceed catch their own error, so an OEM operation is never repeated.
            Object value=action.run(chain);
            hit(key,method.getDeclaringClass().getSimpleName()+"."+method.getName());
            return value;
        }));
        registered.put(key,registered.getOrDefault(key,0)+1);total++;
    }
    private void missing(String key,String target,Throwable error){
        registered.putIfAbsent(key,0);
        module.logFeatureInfo("GAME_EXTRA_ROUTE_UNAVAILABLE "+key+" target="+target+" cause="+error.getClass().getSimpleName());
    }
    private static void hit(String key,String detail){
        long now=System.currentTimeMillis();Long previous=LAST_HIT.get(key);
        if(previous!=null&&now-previous<3000)return;LAST_HIT.put(key,now);
        FeatureSettings.diagnostic(FeatureSettings.from(null),key+"_last_hit",detail+"|"+now);
    }
    private void runtimeError(String key,Throwable error){
        FeatureSettings.diagnostic(FeatureSettings.from(null),key+"_error",error.getClass().getSimpleName()+":"+error.getMessage());
    }
    private static void set(Object owner,String name,Object value)throws ReflectiveOperationException{
        Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);field.set(owner,value);
    }
    private interface Action{Object run(Chain chain)throws Throwable;}
}
