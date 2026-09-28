package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;
import android.view.ViewGroup;
import java.util.List;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.OemHooks.*;

/** Uses native groups and expansion state; never moves or recreates notification entries. */
final class NotificationStackHook {
    private static final java.util.Map<View,float[]> TOUCH=new java.util.WeakHashMap<>();
    private static final String TYPE="com.android.systemui.statusbar.notification.stack.NotificationChildrenContainer";
    static int install(AugmentModule module,ClassLoader loader){
        int count=methods(module,loader,TYPE,"getMaxAllowedVisibleChildren",int.class,1,SystemUiOptions.NOTIFICATION_STACK,chain->{
            Object owner=chain.getThisObject();
            return active(owner)&&!Boolean.TRUE.equals(chain.getArg(0))&&fraction(owner)==0?1:chain.proceed();
        },new Class<?>[]{boolean.class});
        count+=methods(module,loader,TYPE,"getMinHeight",int.class,0,SystemUiOptions.NOTIFICATION_STACK,chain->
                active(chain.getThisObject())?collapsedHeight(chain.getThisObject()):chain.proceed(),new Class<?>[]{});
        count+=methods(module,loader,TYPE,"getMinHeight",int.class,3,SystemUiOptions.NOTIFICATION_STACK,chain->{
            if(!active(chain.getThisObject()))return chain.proceed();
            return collapsedHeight(chain.getThisObject());
        },new Class<?>[]{int.class,boolean.class,int.class});
        count+=methods(module,loader,TYPE,"getIntrinsicHeight",int.class,1,SystemUiOptions.NOTIFICATION_STACK,chain->{
            Object nativeHeight=chain.proceed(),owner=chain.getThisObject();if(!active(owner))return nativeHeight;
            float f=fraction(owner);return Math.round(collapsedHeight(owner)*(1-f)+(((Integer)nativeHeight)+spacing(owner)*children(owner).size())*f);
        },new Class<?>[]{float.class});
        count+=methods(module,loader,TYPE,"updateState",void.class,1,SystemUiOptions.NOTIFICATION_STACK,chain->{
            Object result=chain.proceed(),owner=chain.getThisObject();if(!active(owner))return result;
            float f=fraction(owner);List<?> children=children(owner);
            for(int i=0;i<children.size();i++){
                Object state=invoke(children.get(i),"getViewState");
                float y=((Number)invoke(state,"getYTranslation")).floatValue();
                invoke(state,"setYTranslation",(y+(i+1)*spacing(owner))*f);
                if(i>0)invoke(state,"setAlpha",f);
                if(i==0){set(state,false,"hidden");invoke(state,"setAlpha",1f);
                    if(f==0)set(state,collapsedHeight(owner)-tail(owner),"height");}
            }
            for(String key:new String[]{"mHeaderViewState","mGroupOverFlowState","mTopLineViewState","mExpandButtonViewState"}){
                Object state=field(owner,key);if(state!=null)invoke(state,"setAlpha",f);
            }
            return result;
        });
        count+=methods(module,loader,TYPE,"drawChild",boolean.class,3,SystemUiOptions.NOTIFICATION_STACK,chain->{
            Object owner=chain.getThisObject();
            if(active(owner)&&chain.getArg(1)==children(owner).get(0)){
                Canvas canvas=(Canvas)chain.getArg(0);ViewGroup group=(ViewGroup)owner;
                float fade=1-fraction(owner),d=group.getResources().getDisplayMetrics().density;
                float bottom=collapsedHeight(owner)-tail(owner),width=group.getWidth();
                Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
                int night=group.getResources().getConfiguration().uiMode&android.content.res.Configuration.UI_MODE_NIGHT_MASK;
                int color=night==android.content.res.Configuration.UI_MODE_NIGHT_YES?0xff46464c:0xffe4e4e8;
                int saved=canvas.save();canvas.clipRect(0,bottom,width,bottom+tail(owner));
                for(int i=Math.min(2,children(owner).size()-1);i>=1;i--){
                    float inset=i*7*d,offset=i*5*d;paint.setColor(color);paint.setAlpha(Math.round((i==1?210:145)*fade));
                    canvas.drawRoundRect(inset,bottom-22*d+offset,width-inset,bottom+offset,14*d,14*d,paint);
                }
                canvas.restoreToCount(saved);
            }
            if(active(owner)&&(children(owner).contains(chain.getArg(1))||chain.getArg(1)==field(owner,"mCurrentHeader"))){
                Canvas c=(Canvas)chain.getArg(0);View child=(View)chain.getArg(1);
                float radius=14*child.getResources().getDisplayMetrics().density;
                float top=child.getTranslationY();
                float height=children(owner).contains(child)?((Number)invoke(child,"getActualHeight")).floatValue():child.getHeight();
                android.graphics.Path clip=new android.graphics.Path();
                clip.addRoundRect(child.getTranslationX(),top,child.getTranslationX()+child.getWidth(),top+height,radius,radius,android.graphics.Path.Direction.CW);
                int saved=c.save();try{c.clipPath(clip);return chain.proceed();}finally{c.restoreToCount(saved);}
            }
            return chain.proceed();
        },new Class<?>[]{Canvas.class,View.class,long.class});
        count+=methods(module,loader,TYPE,"updateChildrenAppearance",void.class,0,SystemUiOptions.NOTIFICATION_STACK,chain->{
            Object result=chain.proceed(),owner=chain.getThisObject();
            if(active(owner))for(Object child:children(owner))invoke(field(owner,"mGroupingUtil"),"restoreChildNotification",child);
            return result;
        },new Class<?>[]{});
        String content="com.android.systemui.statusbar.notification.row.NotificationContentView";
        count+=methods(module,loader,content,"calculateVisibleType",int.class,0,SystemUiOptions.NOTIFICATION_STACK,chain->{
            Object group=parentGroup(field(chain.getThisObject(),"mContainingNotification"));
            return active(group)&&fraction(group)==0?0:chain.proceed();
        },new Class<?>[]{});
        count+=methods(module,loader,content,"getMinHeight",int.class,1,SystemUiOptions.NOTIFICATION_STACK,chain->{
            Object group=parentGroup(field(chain.getThisObject(),"mContainingNotification"));
            return active(group)?chain.proceed(new Object[]{true}):chain.proceed();
        },new Class<?>[]{boolean.class});
        String row="com.android.systemui.statusbar.notification.row.ExpandableNotificationRow";
        count+=methods(module,loader,row,"hideBackground",boolean.class,0,SystemUiOptions.NOTIFICATION_STACK,chain->{
            if(active(field(chain.getThisObject(),"mChildrenContainer")))return true;
            if(active(parentGroup(chain.getThisObject())))return false;
            return chain.proceed();
        },new Class<?>[]{});
        count+=methods(module,loader,"com.android.systemui.statusbar.notification.row.NotificationBackgroundView","onDraw",void.class,1,SystemUiOptions.NOTIFICATION_STACK,chain->{
            View view=(View)chain.getThisObject();
            return active(field(view.getParent(),"mChildrenContainer"))?null:chain.proceed();
        },new Class<?>[]{Canvas.class});
        // Let native scrolling and group swipe dismissal handle movement. A stationary tap
        // expands the group via its existing listener and never launches the hidden child.
        count+=methods(module,loader,"com.android.systemui.statusbar.notification.row.ActivatableNotificationView","dispatchTouchEvent",boolean.class,1,SystemUiOptions.NOTIFICATION_STACK,chain->{
            Object object=chain.getThisObject();
            Object group=field(object,"mChildrenContainer");
            View view=(View)object;android.view.MotionEvent event=(android.view.MotionEvent)chain.getArg(0);
            if(!active(group)||fraction(group)!=0){TOUCH.remove(view);return chain.proceed();}
            int action=event.getActionMasked();
            if(action==android.view.MotionEvent.ACTION_DOWN)TOUCH.put(view,new float[]{event.getX(),event.getY(),0});
            float[] down=TOUCH.get(view);
            if(down!=null&&(Math.abs(event.getX()-down[0])+Math.abs(event.getY()-down[1])>android.view.ViewConfiguration.get(view.getContext()).getScaledTouchSlop()))down[2]=1;
            if(action==android.view.MotionEvent.ACTION_UP&&down!=null&&down[2]==0&&event.getEventTime()-event.getDownTime()<android.view.ViewConfiguration.getLongPressTimeout()){
                TOUCH.remove(view);Object listener=field(view,"mExpandClickListener");
                if(listener instanceof View.OnClickListener){
                    android.view.MotionEvent cancel=android.view.MotionEvent.obtain(event);cancel.setAction(android.view.MotionEvent.ACTION_CANCEL);
                    try{chain.proceed(new Object[]{cancel});}finally{cancel.recycle();}
                    ((View.OnClickListener)listener).onClick(view);return true;
                }
            }
            if(action==android.view.MotionEvent.ACTION_CANCEL||action==android.view.MotionEvent.ACTION_UP)TOUCH.remove(view);
            Object handled=chain.proceed();
            return action==android.view.MotionEvent.ACTION_DOWN?true:handled;
        },new Class<?>[]{android.view.MotionEvent.class});
        for(String name:new String[]{TYPE,content,row,"com.android.systemui.statusbar.notification.row.ActivatableNotificationView"})try{
            for(java.lang.reflect.Method method:Class.forName(name,false,loader).getDeclaredMethods()){
                if(java.lang.reflect.Modifier.isAbstract(method.getModifiers())||java.lang.reflect.Modifier.isNative(method.getModifiers()))continue;
                try{module.deoptimize(method);}catch(RuntimeException rejected){module.logFeatureError("NOTIFICATION_STACK_DEOPT_METHOD "+method.getName(),rejected);}
            }
        }catch(ClassNotFoundException|LinkageError error){module.logFeatureError("NOTIFICATION_STACK_DEOPT",error);}
        return count;
    }
    private static Object parentGroup(Object row){return field(field(row,"mNotificationParent"),"mChildrenContainer");}
    private static boolean active(Object owner){return owner instanceof ViewGroup&&children(owner).size()>1
            &&!Boolean.TRUE.equals(field(owner,"mIsLowPriority"));}
    private static List<?> children(Object owner){Object value=field(owner,"mAttachedChildren");return value instanceof List?(List<?>)value:java.util.Collections.emptyList();}
    private static float fraction(Object owner){
        if(Boolean.TRUE.equals(field(owner,"mUserLocked")))try{return Math.max(0,Math.min(1,((Number)invoke(owner,"getGroupExpandFraction")).floatValue()));}
        catch(ReflectiveOperationException ignored){}
        return Boolean.TRUE.equals(field(owner,"mChildrenExpanded"))?1:0;
    }
    private static int spacing(Object owner){return Math.round(8*((View)owner).getResources().getDisplayMetrics().density);}
    private static int tail(Object owner){return Math.round(Math.min(2,children(owner).size()-1)*5*((View)owner).getResources().getDisplayMetrics().density);}
    private static int collapsedHeight(Object owner)throws ReflectiveOperationException{
        Object layout=field(children(owner).get(0),"mPrivateLayout");
        return ((Number)invoke(layout,"getMinHeight",true)).intValue()+tail(owner);
    }
}
