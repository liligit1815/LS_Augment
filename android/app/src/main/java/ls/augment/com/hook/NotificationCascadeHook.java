package ls.augment.com.hook;

import android.content.res.Configuration;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.NotificationAppearanceOptions;
import ls.augment.com.NotificationCascadePolicy;
import ls.augment.com.SystemUiOptions;

/** Projects real OEM rows after native privacy, section, group and scroll calculations. */
final class NotificationCascadeHook {
    private static final String BASE="com.android.systemui.statusbar.notification.";
    private final Access access;
    private final Map<View,Owned> owned=new WeakHashMap<>();
    private Frame current;
    private String lastReport="";
    private NotificationCascadeHook(ClassLoader loader)throws ReflectiveOperationException{access=new Access(loader);}

    static int install(AugmentModule module,ClassLoader loader){
        try{return new NotificationCascadeHook(loader).install(module);}
        catch(ReflectiveOperationException|LinkageError failure){module.logFeatureError("NOTIFICATION_CASCADE_UNAVAILABLE",failure);return 0;}
    }
    private int install(AugmentModule module){
        module.registerFeatureHook(module.prepareFeatureHook(access.reset,"notification.cascade.reset",false).intercept(chain->{
            ViewGroup host=(ViewGroup)access.host.get(chain.getThisObject());
            Frame previous=current,frame;
            try{frame=new Frame(host,chain.getArg(0));}
            catch(ReflectiveOperationException|RuntimeException unavailable){clear(host);report(host,"native:"+unavailable);return chain.proceed();}
            current=frame;
            Object result;
            try{result=chain.proceed();}catch(Throwable error){current=previous;clear(host);throw error;}
            try{if(frame.enabled)finish(frame);else {clear(host);report(host,"native;surface="+(frame.keyguard?"lock":"shade"));}}
            catch(ReflectiveOperationException|RuntimeException error){clear(host);report(host,"unavailable:"+error);}
            finally{current=previous;}
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(access.shelfClamp,"notification.cascade.shelf",false).intercept(chain->{
            // Shelf clamping destroys the natural Y of every off-screen row.
            // Skip it only inside a verified active layout pass for ordinary rows.
            if(current!=null&&current.enabled&&eligible((View)chain.getArg(0)))return null;
            return chain.proceed();
        }));
        module.registerFeatureHook(module.prepareFeatureHook(access.resetRow,"notification.cascade.native_scale",false).intercept(chain->{
            Object result=chain.proceed();Owned old=owned.get(chain.getThisObject());
            // resetViewState copies the animated View scale; never feed our last
            // projection back into the next native layout generation.
            if(old!=null&&result!=null){access.scaleX.setFloat(result,old.scaleX);access.scaleY.setFloat(result,old.scaleY);}
            return result;
        }));
        for(Method method:new Method[]{access.reset,access.resetRow,access.shelfClamp,access.updateChild,access.positions,access.resetChildren})module.deoptimize(method);
        module.logFeatureInfo("NOTIFICATION_CASCADE_READY alpha="+(access.alpha.getParameterCount()==1?"legacy":"reason")+";subclasses=true");
        return 3;
    }
    private boolean eligible(View row)throws ReflectiveOperationException{
        if(!access.row.isInstance(row)||row.getVisibility()==View.GONE)return false;
        for(Method method:access.changing)if(Boolean.TRUE.equals(method.invoke(row)))return false;
        return true;
    }
    private final class Frame {
        final ViewGroup host;final boolean enabled,keyguard;final float start,end,density;
        final boolean gradient;
        Frame(ViewGroup host,Object ambient)throws ReflectiveOperationException{
            this.host=host;density=host.getResources().getDisplayMetrics().density;
            keyguard=(Boolean)access.keyguard.invoke(ambient);
            gradient=FeatureSettings.enabled(host.getContext(),NotificationAppearanceOptions.STACK_GRADIENT,true);
            int measured=access.maxHeight.getInt(host);if(measured<=0)measured=host.getHeight();
            end=Math.max(0,Math.min(host.getHeight(),measured)-48*density);
            start=end*FeatureSettings.integer(host.getContext(),keyguard?NotificationAppearanceOptions.STACK_LOCK_START:NotificationAppearanceOptions.STACK_START,keyguard?75:70,40,90)/100f;
            boolean landscape=host.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;
            enabled=end>start&&host.isAttachedToWindow()
                    &&FeatureSettings.enabled(host.getContext(),SystemUiOptions.NOTIFICATION_STACK)
                    &&FeatureSettings.enabled(host.getContext(),keyguard?NotificationAppearanceOptions.STACK_LOCK:NotificationAppearanceOptions.STACK_SHADE,true)
                    &&(!landscape||FeatureSettings.enabled(host.getContext(),NotificationAppearanceOptions.STACK_LANDSCAPE))
                    &&!(Boolean)access.dozing.invoke(ambient)&&((Number)access.hideAmount.invoke(ambient)).floatValue()==0
                    &&(keyguard||((Number)access.expansion.invoke(ambient)).floatValue()>.98f);
        }
    }
    private void finish(Frame frame)throws ReflectiveOperationException{
        ArrayList<View> rows=new ArrayList<>();
        for(int i=0;i<frame.host.getChildCount();i++){
            View row=frame.host.getChildAt(i);
            if(eligible(row)){Object state=access.state.invoke(row);
                if(!access.gone.getBoolean(state)&&!access.hidden.getBoolean(state))rows.add(row);}
        }
        // Native child order is not guaranteed during moves and Bundle transitions.
        rows.sort((a,b)->Float.compare(y(a),y(b)));
        boolean hasTail=!rows.isEmpty()&&y(rows.get(rows.size()-1))>frame.start;
        java.util.HashSet<View> retained=new java.util.HashSet<>();float bottom=Float.NaN;int stacked=0;
        for(int i=0;i<rows.size();i++){
            View row=rows.get(i);Object state=access.state.invoke(row);
            float nativeY=access.y.getFloat(state),height=access.height.getInt(state);
            if(height<=0)continue;
            NotificationCascadePolicy.Card card=NotificationCascadePolicy.project(nativeY,height,bottom,frame.start,frame.end,frame.density,frame.gradient);
            bottom=card.y+height*card.scale;
            // Front cards must cover the tail too, including cards above the
            // projection line. Raising only projected rows paints their blur
            // over the last lines of the preceding unscaled notification.
            if(hasTail)access.z.setFloat(state,frame.density*(rows.size()-i)/rows.size());
            if(nativeY<=frame.start)continue;
            Owned baseline=owned.get(row);
            if(baseline==null){baseline=new Owned(row,access.scaleX.getFloat(state),access.scaleY.getFloat(state));owned.put(row,baseline);}
            retained.add(row);stacked++;
            access.y.setFloat(state,card.y);access.scaleX.setFloat(state,baseline.scaleX*card.scale);access.scaleY.setFloat(state,baseline.scaleY*card.scale);
            float nativeAlpha=((Number)access.alphaGet.invoke(state)).floatValue();
            if(access.alpha.getParameterCount()==1)access.alpha.invoke(state,nativeAlpha*card.alpha);
            else access.alpha.invoke(state,nativeAlpha*card.alpha,"redmagic_duo.cascade");
            if(card.alpha==0)access.hidden.setBoolean(state,true);
            access.clipBottom.setInt(state,0);
            row.setPivotX(row.getWidth()/2f);row.setPivotY(0);
            baseline.blur(row,card.blur);
        }
        for(View row:new ArrayList<>(owned.keySet()))if(row.getParent()==frame.host&&!retained.contains(row))release(row);
        report(frame.host,"active;surface="+(frame.keyguard?"lock":"shade")+";rows="+rows.size()+";stacked="+stacked+";native_scroll=true");
    }
    private float y(View row){try{return access.y.getFloat(access.state.invoke(row));}catch(ReflectiveOperationException failure){return Float.MAX_VALUE;}}
    private void clear(ViewGroup host){for(View row:new ArrayList<>(owned.keySet()))if(row.getParent()==host||!row.isAttachedToWindow())release(row);}
    private void release(View row){Owned baseline=owned.remove(row);if(baseline==null)return;baseline.blur(row,0);
        // A detached row can be recycled before another native reset pass.
        row.setScaleX(baseline.scaleX);row.setScaleY(baseline.scaleY);
        row.setPivotX(baseline.pivotX);row.setPivotY(baseline.pivotY);}
    private void report(ViewGroup host,String value){if(!value.equals(lastReport)){lastReport=value;FeatureSettings.diagnostic(host.getContext(),"ls_augment_notification_cascade_runtime",value);}}
    private static final class Owned {
        final float scaleX,scaleY,pivotX,pivotY;float radius;
        Owned(View row,float x,float y){scaleX=x;scaleY=y;pivotX=row.getPivotX();pivotY=row.getPivotY();}
        void blur(View row,float requested){
            float next=row.isHardwareAccelerated()?Math.round(requested*2)/2f:0;
            if(radius==next)return;radius=next;
            row.setRenderEffect(next>0?RenderEffect.createBlurEffect(next,next,Shader.TileMode.CLAMP):null);
        }
    }
    private static final class Access {
        final Class<?> row;final Method reset,shelfClamp,resetRow,state,alpha,alphaGet,keyguard,dozing,hideAmount,expansion,updateChild,positions,resetChildren;
        final Method[] changing;final Field host,maxHeight,y,z,scaleX,scaleY,height,gone,hidden,clipBottom;
        Access(ClassLoader loader)throws ReflectiveOperationException{
            Class<?> algorithm=Class.forName(BASE+"stack.StackScrollAlgorithm",false,loader);
            Class<?> layout=Class.forName(BASE+"stack.NotificationStackScrollLayout",false,loader);
            Class<?> ambient=Class.forName(BASE+"stack.AmbientState",false,loader);
            Class<?> algorithmState=Class.forName(BASE+"stack.StackScrollAlgorithm$StackScrollAlgorithmState",false,loader);
            Class<?> expandable=Class.forName(BASE+"row.ExpandableView",false,loader);row=Class.forName(BASE+"row.ExpandableNotificationRow",false,loader);
            state=method(expandable,"getViewState");Class<?> viewState=state.getReturnType();
            reset=method(algorithm,"resetViewStates",ambient,int.class);shelfClamp=method(algorithm,"updateViewWithShelf",expandable,viewState,float.class);
            resetRow=method(expandable,"resetViewState");host=field(algorithm,"mHostView",ViewGroup.class);maxHeight=field(layout,"mMaxLayoutHeight",int.class);
            updateChild=method(algorithm,"updateChild",int.class,algorithmState,ambient);positions=method(algorithm,"updatePositionsForState",algorithmState,ambient);resetChildren=method(algorithm,"resetChildViewStates");
            y=field(viewState,"mYTranslation",float.class);z=field(viewState,"mZTranslation",float.class);scaleX=field(viewState,"mScaleX",float.class);scaleY=field(viewState,"mScaleY",float.class);
            height=field(viewState,"height",int.class);gone=field(viewState,"gone",boolean.class);hidden=field(viewState,"hidden",boolean.class);clipBottom=field(viewState,"clipBottomAmount",int.class);
            Method setter;try{setter=method(viewState,"setAlpha",float.class);}catch(NoSuchMethodException newer){setter=method(viewState,"setAlpha",float.class,String.class);}alpha=setter;alphaGet=method(viewState,"getAlpha");
            keyguard=method(ambient,"isOnKeyguard");dozing=method(ambient,"isDozing");hideAmount=method(ambient,"getHideAmount");expansion=method(ambient,"getExpansionFraction");
            Method user;try{user=method(row,"isUserLocked");}catch(NoSuchMethodException newer){user=method(row,"isUserSwipingToExpandRow");}
            changing=new Method[]{user,method(row,"isPinned"),method(row,"isHeadsUpAnimatingAway"),method(row,"isExpandAnimationRunning"),method(row,"areGutsExposed"),method(row,"isGroupExpansionChanging")};
            for(Method m:changing)result(m,boolean.class);
            result(reset,void.class);result(shelfClamp,void.class);result(resetRow,viewState);result(alpha,void.class);result(alphaGet,float.class);
            result(keyguard,boolean.class);result(dozing,boolean.class);result(hideAmount,float.class);result(expansion,float.class);
        }
        static Method method(Class<?> type,String name,Class<?>...args)throws NoSuchMethodException{
            for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(name,args);if(Modifier.isStatic(m.getModifiers())||Modifier.isAbstract(m.getModifiers()))throw new NoSuchMethodException(name+":instance");m.setAccessible(true);return m;}catch(NoSuchMethodException absent){}
            throw new NoSuchMethodException(type.getName()+"."+name);
        }
        static Field field(Class<?> type,String name,Class<?> expected)throws NoSuchFieldException{
            for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);if(f.getType()!=expected||Modifier.isStatic(f.getModifiers()))throw new NoSuchFieldException(name+":type");f.setAccessible(true);return f;}catch(NoSuchFieldException absent){}
            throw new NoSuchFieldException(type.getName()+"."+name+":"+expected.getName());
        }
        static void result(Method m,Class<?> expected)throws NoSuchMethodException{if(m.getReturnType()!=expected)throw new NoSuchMethodException(m.getName()+":return");}
    }
}
