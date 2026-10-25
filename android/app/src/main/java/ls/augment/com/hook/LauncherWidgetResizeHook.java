package ls.augment.com.hook;

import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.view.View;
import android.view.ViewParent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONObject;
import ls.augment.com.BuildConfig;
import ls.augment.com.LauncherOptions;

/** Unlock the OEM resize frame. Native collision checks, widget updates and model writes remain in charge. */
final class LauncherWidgetResizeHook {
    static final String DIAGNOSTIC="ls_augment_launcher_widget_resize_runtime";
    private static boolean installed;

    static synchronized void install(AugmentModule module,ClassLoader loader){
        if(installed)return;
        try{
            Targets targets=new Targets(loader);Controller controller=new Controller(module,targets);
            module.registerFeatureHook(module.prepareFeatureHook(targets.initSpans,"launcher.widget.resize.spans",true).intercept(chain->{
                Object info=chain.getThisObject();Context context=(Context)chain.getArg(0);
                // Reinitialization must calculate the provider's own constraints, including theme changes.
                try{controller.restore(info);}catch(Throwable failure){
                    module.logFeatureError("LAUNCHER_WIDGET_RESIZE_RESTORE",failure);return chain.proceed();
                }
                Object result=chain.proceed();Object idp=chain.getArg(1);
                try{controller.capture(info,context,targets.columns.getInt(idp),targets.rows.getInt(idp));}
                catch(Throwable failure){module.logFeatureError("LAUNCHER_WIDGET_RESIZE_SPANS",failure);}
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.getInfo,"launcher.widget.resize.entry",true).intercept(chain->{
                Object result=chain.proceed();Object host=chain.getThisObject();
                try{if(targets.host.isInstance(host)&&targets.provider.isInstance(result)){
                    View view=(View)host;int cols=0,rows=0;
                    for(ViewParent parent=view.getParent();parent!=null;parent=parent.getParent()){
                        if(targets.cell.isInstance(parent)){
                            cols=(Integer)targets.countX.invoke(parent);rows=(Integer)targets.countY.invoke(parent);break;
                        }
                    }
                    controller.apply(result,view.getContext(),cols,rows);
                }}catch(Throwable failure){module.logFeatureError("LAUNCHER_WIDGET_RESIZE_ENTRY",failure);}
                return result;
            }));
            installed=true;
        }catch(Throwable failure){module.logFeatureError("LAUNCHER_WIDGET_RESIZE_INSTALL",failure);}
    }

    static final class Targets {
        final String adapter;
        final Class<?> provider,host,cell;
        final Method initSpans,getInfo,countX,countY;
        final Field minX,minY,maxX,maxY,columns,rows;

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        Targets(ClassLoader loader)throws Exception{
            boolean named;
            try{Class.forName("com.android.launcher3.F1",false,loader);named=false;}
            catch(ClassNotFoundException absent){named=true;}
            adapter=named?"android15_named":"android16_obfuscated";
            provider=Class.forName(named?"com.android.launcher3.widget.LauncherAppWidgetProviderInfo":"com.android.launcher3.widget.U",false,loader);
            host=Class.forName(named?"com.android.launcher3.widget.LauncherAppWidgetHostView":"com.android.launcher3.widget.T",false,loader);
            cell=Class.forName("com.android.launcher3.CellLayout",false,loader);
            Class<?> idp=Class.forName(named?"com.android.launcher3.InvariantDeviceProfile":"com.android.launcher3.F1",false,loader);
            if(!AppWidgetProviderInfo.class.isAssignableFrom(provider)||!AppWidgetHostView.class.isAssignableFrom(host))
                throw new IllegalStateException("小组件原生接口不匹配");
            initSpans=method(provider,named?"initSpans":"v",void.class,Context.class,idp);
            getInfo=host.getMethod("getAppWidgetInfo");
            if(!AppWidgetProviderInfo.class.isAssignableFrom(getInfo.getReturnType())||Modifier.isStatic(getInfo.getModifiers()))
                throw new IllegalStateException("小组件信息接口不匹配");
            minX=field(provider,named?"minSpanX":"i",int.class);minY=field(provider,named?"minSpanY":"j",int.class);
            maxX=field(provider,named?"maxSpanX":"k",int.class);maxY=field(provider,named?"maxSpanY":"l",int.class);
            columns=field(idp,named?"numColumns":"H0",int.class);rows=field(idp,named?"numRows":"G0",int.class);
            countX=method(cell,"getCountX",int.class);countY=method(cell,"getCountY",int.class);
            // Resolve the entire native frame contract before changing provider metadata.
            Class<?> frame=Class.forName("com.android.launcher3.AppWidgetResizeFrame",false,loader);
            Class<?> drag=Class.forName("com.android.launcher3.dragndrop.DragLayer",false,loader);
            method(frame,named?"setupForWidget":"l0",void.class,host,cell,drag);
            method(frame,named?"resizeWidgetIfNeeded":"j0",void.class,boolean.class);
            method(frame,"onDetachedFromWindow",void.class);
        }
        static Method method(Class<?> owner,String name,Class<?> result,Class<?>...args)throws Exception{
            for(Class<?> at=owner;at!=null;at=at.getSuperclass())try{
                Method method=at.getDeclaredMethod(name,args);
                if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers())||Modifier.isAbstract(method.getModifiers()))
                    throw new IllegalStateException("小组件方法接口不匹配："+name);
                method.setAccessible(true);return method;
            }catch(NoSuchMethodException absent){ }
            throw new NoSuchMethodException(owner.getName()+"."+name);
        }
        static Field field(Class<?> owner,String name,Class<?> type)throws Exception{
            Field field=owner.getDeclaredField(name);
            if(field.getType()!=type||Modifier.isStatic(field.getModifiers())||Modifier.isFinal(field.getModifiers()))
                throw new IllegalStateException("小组件字段接口不匹配："+name);
            field.setAccessible(true);return field;
        }
    }

    static final class Original {
        final int mode,minX,minY,maxX,maxY;int columns,rows;
        Original(Object info,Targets targets,int columns,int rows)throws Exception{
            mode=((AppWidgetProviderInfo)info).resizeMode;minX=targets.minX.getInt(info);minY=targets.minY.getInt(info);
            maxX=targets.maxX.getInt(info);maxY=targets.maxY.getInt(info);this.columns=columns;this.rows=rows;
        }
        void restore(Object info,Targets targets)throws Exception{
            ((AppWidgetProviderInfo)info).resizeMode=mode;targets.minX.setInt(info,minX);targets.minY.setInt(info,minY);
            targets.maxX.setInt(info,maxX);targets.maxY.setInt(info,maxY);
        }
    }

    static final class Controller {
        final AugmentModule module;final Targets targets;final Map<Object,Original> originals=new WeakHashMap<>();
        Context context;boolean subscribed;String lastReport="";
        Controller(AugmentModule module,Targets targets){this.module=module;this.targets=targets;}
        synchronized void restore(Object info)throws Exception{
            Original original=originals.remove(info);if(original!=null)original.restore(info,targets);
        }
        synchronized void capture(Object info,Context context,int columns,int rows)throws Exception{
            originals.put(info,new Original(info,targets,columns,rows));apply(info,context,columns,rows);
        }
        synchronized void apply(Object info,Context context,int columns,int rows)throws Exception{
            Original original=originals.get(info);
            if(original==null){original=new Original(info,targets,columns,rows);originals.put(info,original);}
            if(columns>0)original.columns=columns;if(rows>0)original.rows=rows;
            Context app=context.getApplicationContext();this.context=app==null?context:app;
            if(!subscribed){subscribed=true;FeatureSettings.addSnapshotListener(this.context,this::settingsChanged);}
            boolean enabled=FeatureSettings.enabled(context,LauncherOptions.WIDGET_RESIZE);
            if(enabled&&original.columns>0&&original.rows>0){
                ((AppWidgetProviderInfo)info).resizeMode=AppWidgetProviderInfo.RESIZE_HORIZONTAL|AppWidgetProviderInfo.RESIZE_VERTICAL;
                targets.minX.setInt(info,1);targets.minY.setInt(info,1);
                targets.maxX.setInt(info,original.columns);targets.maxY.setInt(info,original.rows);
            }else original.restore(info,targets);
            report(enabled,original.columns,original.rows);
        }
        synchronized void settingsChanged(){
            if(context==null)return;
            try{for(Map.Entry<Object,Original> entry:originals.entrySet()){
                Original original=entry.getValue();apply(entry.getKey(),context,original.columns,original.rows);
            }}catch(Throwable failure){module.logFeatureError("LAUNCHER_WIDGET_RESIZE_CONFIG",failure);}
        }
        void report(boolean enabled,int columns,int rows){
            String state=enabled+":"+columns+":"+rows;if(state.equals(lastReport)||context==null)return;lastReport=state;
            try{FeatureSettings.diagnostic(context,DIAGNOSTIC,new JSONObject().put("version",BuildConfig.VERSION_CODE)
                    .put("pid",android.os.Process.myPid()).put("adapter",targets.adapter).put("supported",true)
                    .put("enabled",enabled).put("state",enabled?"active":"native").put("maxSpanX",columns).put("maxSpanY",rows)
                    .put("nativePlacementAndPersistence",true).toString());
            }catch(Exception failure){module.logFeatureError("LAUNCHER_WIDGET_RESIZE_EVIDENCE",failure);}
        }
    }
    private LauncherWidgetResizeHook(){}
}
