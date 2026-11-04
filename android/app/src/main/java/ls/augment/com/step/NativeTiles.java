package ls.augment.com.step;

import android.view.View;
import java.lang.reflect.*;
import java.util.List;
/** Resolve the current user's original tile at click time; never create or replace a QS tile. */
final class NativeTiles {
    static volatile Object interactor;
    static Class<?> model,tile;
    static Method current,user,value,getTile,spec,getState,available,click,fromView;
    static Field state;
    static Object companion;
    static void install(ClassLoader cl){
        try{
            Class<?> owner=Class.forName("com.android.systemui.qs.pipeline.domain.interactor.CurrentTilesInteractorImpl",false,cl);
            Class<?> flow=Class.forName("kotlinx.coroutines.flow.StateFlow",false,cl);
            model=Class.forName("com.android.systemui.qs.pipeline.domain.model.TileModel",false,cl);
            tile=Class.forName("com.android.systemui.plugins.qs.QSTile",false,cl);
            current=owner.getMethod("getCurrentTiles");user=owner.getMethod("getUserId");value=flow.getMethod("getValue");
            getTile=model.getMethod("getTile");spec=tile.getMethod("getTileSpec");getState=tile.getMethod("getState");
            available=tile.getMethod("isAvailable");state=getState.getReturnType().getField("state");
            if(!flow.isAssignableFrom(current.getReturnType()) || !flow.isAssignableFrom(user.getReturnType()) ||
                    !tile.isAssignableFrom(getTile.getReturnType()) || available.getReturnType()!=boolean.class ||
                    state.getType()!=int.class || spec.getReturnType()!=String.class)throw new NoSuchMethodException("未知原厂磁贴结构");
            try {
                Class<?> expandable=Class.forName("com.android.systemui.animation.Expandable",false,cl);
                click=tile.getMethod("click",expandable);
                companion=expandable.getField("Companion").get(null);
                fromView=companion.getClass().getMethod("fromView",View.class);
                if(fromView.getReturnType()!=expandable)throw new NoSuchMethodException("未知磁贴动画来源");
            }catch(ClassNotFoundException|NoSuchMethodException old){
                click=tile.getMethod("click",View.class);fromView=null;companion=null;
            }
            if(click.getReturnType()!=void.class)throw new NoSuchMethodException("未知磁贴点击结果");
            installIcons(cl);
            StepHooks.hookAllConstructors(owner,new StepHook.Discovery(){
                @Override protected void afterHookedMethod(MethodHookParam p){if(!p.hasThrowable())interactor=p.thisObject;}
            });
        }catch(Exception|LinkageError e){StepRuntime.report(null,-1,"原厂磁贴入口不可用："+e,-1);}
    }
    static Object find(int id,String key)throws ReflectiveOperationException{
        Object host=interactor;if(host==null || !Integer.valueOf(id).equals(value.invoke(user.invoke(host))))return null;
        Object rows=value.invoke(current.invoke(host));if(!(rows instanceof List))return null;
        Object found=null;
        for(Object row:(List<?>)rows){
            if(!model.isInstance(row))return null;Object item=getTile.invoke(row);
            if(!tile.isInstance(item) || !key.equals(spec.invoke(item)))continue;
            if(found!=null || !Boolean.TRUE.equals(available.invoke(item)))return null;found=item;
        }
        return found;
    }
    static int read(int id,String key){
        try{Object t=find(id,key);return t==null?-1:state.getInt(getState.invoke(t));}
        catch(ReflectiveOperationException|RuntimeException e){return -1;}
    }
    static Field iconField;static Method drawable;
    static void installIcons(ClassLoader cl){
        try{
            Class<?> icon=Class.forName("com.android.systemui.plugins.qs.QSTile$Icon",false,cl);
            Field f=getState.getReturnType().getField("icon");Method m=icon.getMethod("getDrawable",android.content.Context.class);
            if(f.getType()!=icon || !android.graphics.drawable.Drawable.class.isAssignableFrom(m.getReturnType()))throw new NoSuchMethodException("QSTile icon type");
            drawable=m;iconField=f;
        }catch(ReflectiveOperationException|LinkageError e){StepRuntime.report(null,0,"磁贴沿用工作区图标："+e,-1);}
    }
    static Object icon(int userId,String spec){
        if(iconField==null)return null;
        try{Object tile=find(userId,spec);return tile==null?null:iconField.get(getState.invoke(tile));}
        catch(ReflectiveOperationException|RuntimeException e){return null;}
    }
    static void activate(int id,String key,View anchor)throws ReflectiveOperationException{
        Object t=find(id,key);
        if(t==null || state.getInt(getState.invoke(t))<=0)throw new IllegalStateException("磁贴当前不可用");
        click.invoke(t,fromView==null?anchor:fromView.invoke(companion,anchor));
    }
}
