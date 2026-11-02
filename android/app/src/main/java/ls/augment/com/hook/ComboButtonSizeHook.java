package ls.augment.com.hook;

import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.GameOptions;
import ls.augment.com.ComboButtonSizeConfig;

/** Resize the OEM floating macro root itself, so its input window follows its image. */
final class ComboButtonSizeHook {
    private final Access access;
    private final Map<View,Style> windows=new WeakHashMap<>();
    private boolean listening;
    private final Runnable changed=this::refreshWindows;
    private void refreshWindows(){
        for(View view:new ArrayList<>(windows.keySet()))try{
            if(!view.isAttachedToWindow())continue;
            WindowManager.LayoutParams params=(WindowManager.LayoutParams)access.params.get(view);
            if(enabled(view)&&supported(view)){
                int[] size=size(view);DisplayMetrics display=view.getResources().getDisplayMetrics();
                params.x=clamp(params.x,display.widthPixels-size[0]);
                params.y=clamp(params.y,display.heightPixels-size[1]);
            }
            view.requestLayout();view.invalidate();
            ((WindowManager)access.manager.get(view)).updateViewLayout(view,params);
        }catch(Throwable error){error(view,error);}
    }

    private ComboButtonSizeHook(Access access){this.access=access;}

    static void install(AugmentModule module,ClassLoader loader){
        try{
            Access access=new Access(loader);
            ComboButtonSizeHook hook=new ComboButtonSizeHook(access);
            module.registerFeatureHook(module.prepareFeatureHook(access.add,"game.combo_button_size.add",true).intercept(chain->{
                View view=(View)chain.getThisObject();Object[] args=null;boolean tracked=hook.windows.containsKey(view);
                try{
                    if(hook.supported(view)){
                        if(!tracked)hook.windows.put(view,new Style(access,view));
                        if(!hook.listening)hook.listening=FeatureSettings.addSnapshotListener(view.getContext(),hook.changed);
                        if(hook.enabled(view)){
                            int[] size=hook.size(view);DisplayMetrics display=view.getResources().getDisplayMetrics();
                            args=new Object[]{clamp((Integer)chain.getArg(0),display.widthPixels-size[0]),
                                    clamp((Integer)chain.getArg(1),display.heightPixels-size[1])};
                        }
                    }
                }catch(Throwable error){hook.error(view,error);}
                try{return args==null?chain.proceed():chain.proceed(args);}
                catch(Throwable error){if(!tracked)hook.windows.remove(view);throw error;}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(access.measure,"game.combo_button_size.measure",true).intercept(chain->{
                Object result=chain.proceed();View view=(View)chain.getThisObject();
                Style style=hook.windows.get(view);if(style==null)return result;
                try{
                    float scale=1f;
                    boolean enabled=hook.enabled(view);
                    if(enabled&&hook.supported(view)){
                        int[] size=hook.size(view);
                        int width=view.getMeasuredWidth(),height=view.getMeasuredHeight();
                        if(width>0&&height>0){
                            scale=Math.min(size[0]/(float)width,size[1]/(float)height);
                            access.setMeasured.invoke(view,size[0],size[1]);
                            FeatureSettings.diagnostic(view.getContext(),GameOptions.COMBO_BUTTON_SIZE+"_state",
                                    "state=APPLIED;requested="+hook.percent(view)+";size="+size[0]+"x"+size[1]+";input=window_bounds");
                        }
                    }else if(!enabled)FeatureSettings.diagnostic(view.getContext(),GameOptions.COMBO_BUTTON_SIZE+"_state",
                            "state=RESTORED;size="+view.getMeasuredWidth()+"x"+view.getMeasuredHeight());
                    style.apply(access,view,scale);
                }catch(Throwable error){hook.error(view,error);}
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(access.remove,"game.combo_button_size.remove",true).intercept(chain->{
                Object result=chain.proceed();View view=(View)chain.getThisObject();Style style=hook.windows.remove(view);
                if(style!=null)try{style.apply(access,view,1f);}catch(Throwable error){hook.error(view,error);}
                return result;
            }));
            module.logFeatureInfo("COMBO_BUTTON_SIZE_REGISTERED route=DraggableProgressView;device_validation=pending");
        }catch(Throwable error){module.logFeatureError("COMBO_BUTTON_SIZE_ROUTE_UNAVAILABLE",error);}
    }

    private boolean supported(View view)throws IllegalAccessException{
        WindowManager.LayoutParams params=(WindowManager.LayoutParams)access.params.get(view);
        Drawable drawable=(Drawable)access.drawable.get(view);
        boolean supported=params!=null&&params.width==ViewGroup.LayoutParams.WRAP_CONTENT
                &&params.height==ViewGroup.LayoutParams.WRAP_CONTENT&&drawable!=null
                &&drawable.getIntrinsicWidth()>0&&drawable.getIntrinsicHeight()>0;
        if(supported){
            DisplayMetrics display=view.getResources().getDisplayMetrics();
            int width=drawable.getIntrinsicWidth(),height=drawable.getIntrinsicHeight();
            FeatureSettings.diagnostic(view.getContext(),ComboButtonSizeConfig.GEOMETRY,
                    "1|"+width+"|"+height+"|"+display.widthPixels+"|"+display.heightPixels+"|"+display.density);
            supported=ComboButtonSizeConfig.maximum(width,height,display.widthPixels,display.heightPixels)>=GameOptions.COMBO_BUTTON_SIZE_MIN;
        }
        if(!supported)FeatureSettings.diagnostic(view.getContext(),GameOptions.COMBO_BUTTON_SIZE+"_state",
                "state=UNAVAILABLE;missing=wrap_content_window_or_icon_geometry;native_preserved=true");
        return supported;
    }
    private boolean enabled(View view){return FeatureSettings.enabled(view.getContext(),GameOptions.COMBO_BUTTON_SIZE_ENABLED,false);}
    private int percent(View view){return FeatureSettings.integer(view.getContext(),GameOptions.COMBO_BUTTON_SIZE,
            GameOptions.COMBO_BUTTON_SIZE_DEFAULT,GameOptions.COMBO_BUTTON_SIZE_MIN,GameOptions.COMBO_BUTTON_SIZE_MAX);}
    private int[] size(View view)throws IllegalAccessException{
        Drawable icon=(Drawable)access.drawable.get(view);DisplayMetrics display=view.getResources().getDisplayMetrics();
        float scale=Math.min(percent(view),ComboButtonSizeConfig.maximum(icon.getIntrinsicWidth(),icon.getIntrinsicHeight(),
                display.widthPixels,display.heightPixels))/100f;
        return new int[]{Math.max(1,Math.round(icon.getIntrinsicWidth()*scale)),Math.max(1,Math.round(icon.getIntrinsicHeight()*scale))};
    }
    private static int clamp(int value,int maximum){return Math.max(0,Math.min(Math.max(0,maximum),value));}
    private void error(View view,Throwable error){FeatureSettings.diagnosticError(view.getContext(),GameOptions.COMBO_BUTTON_SIZE+"_error","button_size",error);}

    private static final class Style{
        final float stroke,distance,textSize;
        Style(Access access,View view)throws IllegalAccessException{
            stroke=access.stroke.getFloat(view);distance=access.distance.getFloat(view);
            textSize=((Paint)access.textPaint.get(view)).getTextSize();
        }
        void apply(Access access,View view,float scale)throws IllegalAccessException{
            access.stroke.setFloat(view,stroke*scale);access.distance.setFloat(view,distance*scale);
            ((Paint)access.textPaint.get(view)).setTextSize(textSize*scale);
        }
    }
    /** Entire contract validated before interception; inheritance retains the base route. */
    private static final class Access{
        final Field params,manager,drawable,stroke,distance,textPaint;
        final Method add,remove,measure,setMeasured;
        Access(ClassLoader loader)throws ReflectiveOperationException{
            Class<?> type=Class.forName("cn.nubia.gamehelper.view.DraggableProgressView",false,loader);
            if(!View.class.isAssignableFrom(type))throw new NoSuchMethodException("DraggableProgressView:View");
            params=field(type,"mLayoutParams",WindowManager.LayoutParams.class);
            manager=field(type,"mWindowManager",WindowManager.class);
            drawable=field(type,"mDrawable",Drawable.class);
            stroke=field(type,"mStrokeWidth",float.class);distance=field(type,"mDistance",float.class);
            textPaint=field(type,"mTextPaint",Paint.class);
            add=method(type,"addToWindow",int.class,int.class);remove=method(type,"removeFromWindow");
            measure=method(type,"onMeasure",int.class,int.class);
            setMeasured=method(View.class,"setMeasuredDimension",int.class,int.class);
        }
        private static Field field(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException{
            Field value=type.getDeclaredField(name);
            if(value.getType()!=expected)throw new NoSuchFieldException(name+":type");value.setAccessible(true);return value;
        }
        private static Method method(Class<?> type,String name,Class<?>...args)throws ReflectiveOperationException{
            Method value=type.getDeclaredMethod(name,args);
            if(value.getReturnType()!=void.class)throw new NoSuchMethodException(name+":return");value.setAccessible(true);return value;
        }
    }
}
