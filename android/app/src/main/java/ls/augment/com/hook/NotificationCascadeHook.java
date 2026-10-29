package ls.augment.com.hook;

import android.content.res.Configuration;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.view.View;
import android.view.ViewGroup;
import android.view.MotionEvent;
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
    private final Map<ViewGroup,Surface> surfaces=new WeakHashMap<>();
    private final ThreadLocal<Boolean> nativeRange=ThreadLocal.withInitial(()->false);
    private final ThreadLocal<ViewGroup> scrolling=new ThreadLocal<>();
    private Frame current;
    private final android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
    private boolean listening;
    private NotificationCascadeHook(ClassLoader loader)throws ReflectiveOperationException{access=new Access(loader);}

    static int install(AugmentModule module,ClassLoader loader){
        try{return new NotificationCascadeHook(loader).install(module);}
        catch(ReflectiveOperationException|LinkageError failure){module.logFeatureError("NOTIFICATION_CASCADE_UNAVAILABLE",failure);return 0;}
    }
    private int install(AugmentModule module){
        module.registerFeatureHook(module.prepareFeatureHook(access.reset,"notification.cascade.reset",false).intercept(chain->{
            ViewGroup host=(ViewGroup)access.host.get(chain.getThisObject());
            if(!listening)listening=FeatureSettings.addSnapshotListener(host.getContext(),()->main.post(()->{
                for(ViewGroup view:new ArrayList<>(surfaces.keySet()))if(view!=null&&view.isAttachedToWindow())
                    try{access.refresh.invoke(view);}catch(ReflectiveOperationException error){module.logFeatureError("NOTIFICATION_CASCADE_REFRESH",error);}
            }));
            Frame previous=current,frame;
            try{frame=new Frame(host,chain.getThisObject(),chain.getArg(0));}
            catch(ReflectiveOperationException|RuntimeException unavailable){clear(host);return chain.proceed();}
            current=frame;
            Object result;
            try{result=chain.proceed();}catch(Throwable error){current=previous;clear(host);throw error;}
            try{if(frame.enabled)finish(frame);else {clear(host);report(frame,"native;reason="+frame.reason,0,0,0);}}
            catch(ReflectiveOperationException|RuntimeException error){clear(host);report(frame,"unavailable;reason="+error.getClass().getSimpleName(),0,0,0);}
            finally{current=previous;}
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(access.updateChild,"notification.cascade.lock_space",false).intercept(chain->{
            Frame frame=current;
            if(frame==null||!frame.enabled||!frame.keyguard||chain.getThisObject()!=frame.algorithm)return chain.proceed();
            Object raw=access.children.get(chain.getArg(1));int index=((Number)chain.getArg(0)).intValue();
            if(!(raw instanceof java.util.List)||index<0||index>=((java.util.List<?>)raw).size())return chain.proceed();
            Object child=((java.util.List<?>)raw).get(index);
            if(!(child instanceof View)||!eligible((View)child))return chain.proceed();
            Object state=access.state.invoke(child);
            // Privacy/gone state is never cleared. Only the OEM's geometric capacity
            // input is expanded for this ordinary row, for the duration of its native call.
            if(access.hidden.getBoolean(state)||access.gone.getBoolean(state))return chain.proceed();
            float original=access.lockSpace.getFloat(frame.algorithm);
            try{access.lockSpace.setFloat(frame.algorithm,Float.MAX_VALUE);frame.spacePasses++;return chain.proceed();}
            finally{access.lockSpace.setFloat(frame.algorithm,original);}
        }));
        module.registerFeatureHook(module.prepareFeatureHook(access.scrollRange,"notification.cascade.scroll_range",false).intercept(chain->{
            int original=((Number)chain.proceed()).intValue();
            if(nativeRange.get())return original;
            Surface surface=surfaces.get(chain.getThisObject());
            return surface!=null&&live(surface.frame)?Math.max(original,surface.required):original;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(access.scrollingEnabled,"notification.cascade.lock_scroll",false).intercept(chain->{
            Object original=chain.proceed();Surface surface=surfaces.get(chain.getThisObject());
            return Boolean.TRUE.equals(original)||surface!=null&&surface.gesture&&scrolling.get()==chain.getThisObject()
                    &&live(surface.frame)&&surface.frame.keyguard&&surface.required>0?Boolean.TRUE:original;
        }));
        for(Method touch:access.touches)module.registerFeatureHook(
                module.prepareFeatureHook(touch,"notification.cascade.touch."+touch.getName(),false).intercept(chain->{
            ViewGroup host=(ViewGroup)chain.getThisObject();Surface surface=surfaces.get(host);
            MotionEvent event=(MotionEvent)chain.getArg(0);int action=event.getActionMasked();
            if(surface==null||!live(surface.frame)||!surface.frame.keyguard)return chain.proceed();
            boolean outer=surface.touchDepth==0;
            if(outer&&action==MotionEvent.ACTION_DOWN){Object row=access.childAt.invoke(host,event.getX(),event.getY());
                surface.gesture=surface.required>0&&row instanceof View&&eligible((View)row)
                        &&!access.hidden.getBoolean(access.state.invoke(row));
                // The keyguard parent otherwise intercepts MOVE to unlock before
                // the native notification scroller can cross its touch slop.
                // Retain only gestures that began on a real, visible card. The
                // row's native click, expansion and horizontal swipe still run.
                if(surface.gesture&&host.getParent()!=null){host.getParent().requestDisallowInterceptTouchEvent(true);surface.parentHeld=true;}
            }
            surface.touchDepth++;
            ViewGroup previous=scrolling.get();if(surface.gesture)scrolling.set(host);
            try{return chain.proceed();}finally{
                scrolling.set(previous);surface.touchDepth--;
                if(outer&&(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL))endGesture(host,surface);
            }
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
        for(Method method:new Method[]{access.reset,access.resetRow,access.shelfClamp,access.updateChild,access.positions,access.resetChildren,
                access.scrollRange,access.scrollingEnabled,access.scrollTouch,access.interceptScroll,access.scrollability,access.clampScroll})module.deoptimize(method);
        module.logFeatureInfo("NOTIFICATION_CASCADE_READY alpha="+(access.alpha.getParameterCount()==1?"legacy":"reason")+";subclasses=true");
        for(Method touch:access.touches)module.deoptimize(touch);
        return 6+access.touches.size();
    }
    private boolean live(Frame frame){
        if(frame==null||!frame.enabled||!frame.host.isAttachedToWindow())return false;
        try{return frame.keyguard==(Boolean)access.keyguard.invoke(frame.ambient)
                &&!(Boolean)access.dozing.invoke(frame.ambient)&&((Number)access.hideAmount.invoke(frame.ambient)).floatValue()==0
                &&NotificationStackGate.enabled(frame.host.getContext(),frame.keyguard)
                &&(frame.keyguard||((Number)access.expansion.invoke(frame.ambient)).floatValue()>.98f);}
        catch(ReflectiveOperationException failure){return false;}
    }
    private static final class Surface {
        Frame frame;int required,touchDepth;boolean gesture,parentHeld;final Evidence[] evidence={new Evidence(),new Evidence()};
    }
    private void endGesture(ViewGroup host,Surface surface){
        surface.gesture=false;
        if(surface.parentHeld){surface.parentHeld=false;if(host.getParent()!=null)host.getParent().requestDisallowInterceptTouchEvent(false);}
    }
    private Surface surface(ViewGroup host){
        Surface present=surfaces.get(host);if(present!=null)return present;
        Surface created=new Surface();surfaces.put(host,created);
        host.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View v){}
            public void onViewDetachedFromWindow(View v){clear(host);surfaces.remove(host);host.removeOnAttachStateChangeListener(this);}
        });
        return created;
    }
    private static final class Evidence {long passes,appliedPasses,lastAppliedAt,lastReportAt;String lastStage="";}
    private boolean eligible(View row)throws ReflectiveOperationException{
        if(!access.row.isInstance(row)||row.getVisibility()==View.GONE)return false;
        for(Method method:access.changing)if(Boolean.TRUE.equals(method.invoke(row)))return false;
        return true;
    }
    private final class Frame {
        final ViewGroup host;final boolean enabled,keyguard;final float top,start,end,density,space;
        final Object algorithm,ambient;final String reason;int spacePasses;
        final boolean gradient;
        Frame(ViewGroup host,Object algorithm,Object ambient)throws ReflectiveOperationException{
            this.host=host;this.algorithm=algorithm;this.ambient=ambient;density=host.getResources().getDisplayMetrics().density;
            keyguard=(Boolean)access.keyguard.invoke(ambient);
            gradient=FeatureSettings.enabled(host.getContext(),NotificationAppearanceOptions.STACK_GRADIENT,true);
            int measured=access.maxHeight.getInt(host);if(measured<=0)measured=host.getHeight();
            top=keyguard?((Number)access.stackY.invoke(ambient)).floatValue():0;
            float capacity=access.lockSpace.getFloat(algorithm);
            space=capacity>0?capacity:((Number)access.stackHeight.invoke(ambient)).floatValue();
            end=Math.max(top,Math.min(Math.min(host.getHeight(),measured)-48*density,keyguard?top+space:Float.MAX_VALUE));
            start=top+(end-top)*FeatureSettings.integer(host.getContext(),keyguard?NotificationAppearanceOptions.STACK_LOCK_START:NotificationAppearanceOptions.STACK_START,keyguard?75:70,40,90)/100f;
            boolean landscape=host.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;
            enabled=end>start&&host.isAttachedToWindow()
                    &&NotificationStackGate.enabled(host.getContext(),keyguard)
                    &&!(Boolean)access.dozing.invoke(ambient)&&((Number)access.hideAmount.invoke(ambient)).floatValue()==0
                    &&(keyguard||((Number)access.expansion.invoke(ambient)).floatValue()>.98f);
            reason=enabled?"eligible":!host.isAttachedToWindow()?"detached":end<=start?"no_capacity":
                    !FeatureSettings.enabled(host.getContext(),SystemUiOptions.NOTIFICATION_STACK)?"master_off":
                    !FeatureSettings.enabled(host.getContext(),keyguard?NotificationAppearanceOptions.STACK_LOCK:NotificationAppearanceOptions.STACK_SHADE,true)?"surface_off":
                    landscape&&!FeatureSettings.enabled(host.getContext(),NotificationAppearanceOptions.STACK_LANDSCAPE)?"landscape_off":
                    (Boolean)access.dozing.invoke(ambient)?"dozing":((Number)access.hideAmount.invoke(ambient)).floatValue()!=0?"native_hidden":"shade_not_expanded";
        }
    }
    private void finish(Frame frame)throws ReflectiveOperationException{
        ArrayList<View> rows=new ArrayList<>();int excluded=0;
        for(int i=0;i<frame.host.getChildCount();i++){
            View row=frame.host.getChildAt(i);
            if(eligible(row)){Object state=access.state.invoke(row);
                if(!access.gone.getBoolean(state)&&!access.hidden.getBoolean(state))rows.add(row);else excluded++;}
        }
        // Native child order is not guaranteed during moves and Bundle transitions.
        rows.sort((a,b)->Float.compare(y(a),y(b)));
        boolean hasTail=!rows.isEmpty()&&y(rows.get(rows.size()-1))>frame.start;
        Surface surface=surface(frame.host);surface.frame=frame;
        int prior=surface.required;int scroll=access.scroll.getInt(frame.host);
        if(rows.isEmpty())surface.required=0;
        else{
            View tail=rows.get(rows.size()-1);
            // Reaching the unscaled line alone is insufficient for a tall final row.
            // Its bottom must also clear the viewport's reserved bottom area.
            float target=Math.min(frame.start,frame.end-access.height.getInt(access.state.invoke(tail)));
            surface.required=NotificationCascadePolicy.requiredScroll(y(tail),scroll,target);
        }
        java.util.HashSet<View> retained=new java.util.HashSet<>();float bottom=Float.NaN;int stacked=0,visibleProjected=0;
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
            // OEM keyguard normally has no scroll offset and does not clip rows
            // against the clock. Keep scrolled rows inside the native viewport.
            if(frame.keyguard&&scroll>0){
                int clip=Math.min((int)height,Math.max(0,(int)Math.ceil(frame.top-card.y)));
                access.clipTop.setInt(state,Math.max(access.clipTop.getInt(state),clip));
            }
            if(nativeY<=frame.start)continue;
            Owned baseline=owned.get(row);
            if(baseline==null){baseline=new Owned(row,access.scaleX.getFloat(state),access.scaleY.getFloat(state));owned.put(row,baseline);}
            retained.add(row);stacked++;
            access.y.setFloat(state,card.y);access.scaleX.setFloat(state,baseline.scaleX*card.scale);access.scaleY.setFloat(state,baseline.scaleY*card.scale);
            float nativeAlpha=((Number)access.alphaGet.invoke(state)).floatValue();
            if(card.alpha>0&&nativeAlpha>0)visibleProjected++;
            if(access.alpha.getParameterCount()==1)access.alpha.invoke(state,nativeAlpha*card.alpha);
            else access.alpha.invoke(state,nativeAlpha*card.alpha,"redmagic_duo.cascade");
            if(card.alpha==0)access.hidden.setBoolean(state,true);
            access.clipBottom.setInt(state,0);
            row.setPivotX(row.getWidth()/2f);row.setPivotY(0);
            baseline.blur(row,card.blur);
        }
        for(View row:new ArrayList<>(owned.keySet()))if(row.getParent()==frame.host&&!retained.contains(row))release(row);
        if(prior!=surface.required){access.scrollability.invoke(frame.host);if(prior>surface.required)access.clampScroll.invoke(frame.host);}
        String stage=rows.isEmpty()?"no_visible_rows":visibleProjected>0?"applied":"layout_only";
        report(frame,stage+";stacked="+stacked+";excluded_native="+excluded+";space_passes="+frame.spacePasses,rows.size(),visibleProjected,scroll);
    }
    private float y(View row){try{return access.y.getFloat(access.state.invoke(row));}catch(ReflectiveOperationException failure){return Float.MAX_VALUE;}}
    private void clear(ViewGroup host){for(View row:new ArrayList<>(owned.keySet()))if(row.getParent()==host||!row.isAttachedToWindow())release(row);
        Surface surface=surfaces.get(host);if(surface!=null){boolean changed=surface.required!=0;surface.required=0;surface.frame=null;endGesture(host,surface);
            if(changed)try{access.scrollability.invoke(host);access.clampScroll.invoke(host);}catch(ReflectiveOperationException ignored){}}}
    private void release(View row){Owned baseline=owned.remove(row);if(baseline==null)return;baseline.blur(row,0);
        // A detached row can be recycled before another native reset pass.
        row.setScaleX(baseline.scaleX);row.setScaleY(baseline.scaleY);
        row.setPivotX(baseline.pivotX);row.setPivotY(baseline.pivotY);}
    private void report(Frame frame,String stage,int rows,int applied,int scroll){
        Surface surface=surface(frame.host);Evidence evidence=surface.evidence[frame.keyguard?1:0];
        long now=System.currentTimeMillis();evidence.passes++;
        if(applied>0){evidence.appliedPasses++;evidence.lastAppliedAt=now;}
        String kind=(frame.keyguard?"lock":"shade")+";"+stage.split(";",2)[0]+";"+frame.reason;
        if(kind.equals(evidence.lastStage)&&now-evidence.lastReportAt<1000)return;
        evidence.lastStage=kind;evidence.lastReportAt=now;int original=0;
        try{nativeRange.set(true);original=((Number)access.scrollRange.invoke(frame.host)).intValue();}catch(ReflectiveOperationException ignored){}
        finally{nativeRange.set(false);}
        if(frame.keyguard){
            int nativeRows=0,goneRows=0,invisibleRows=0;
            for(int i=0;i<frame.host.getChildCount();i++){View child=frame.host.getChildAt(i);
                if(access.row.isInstance(child)){nativeRows++;if(child.getVisibility()==View.GONE)goneRows++;else if(child.getVisibility()!=View.VISIBLE)invisibleRows++;}}
            String settings;
            try{android.content.ContentResolver resolver=frame.host.getContext().getContentResolver();
                settings="show="+android.provider.Settings.Secure.getInt(resolver,"lock_screen_show_notifications",-1)
                        +";private="+android.provider.Settings.Secure.getInt(resolver,"lock_screen_allow_private_notifications",-1)
                        +";zen="+android.provider.Settings.Global.getInt(resolver,"zen_mode",-1);
            }catch(RuntimeException unavailable){settings="settings=unavailable";}
            FeatureSettings.diagnostic(frame.host.getContext(),"ls_augment_notification_lock_native_evidence",
                    settings+";children="+frame.host.getChildCount()+";native_rows="+nativeRows+";gone="+goneRows
                    +";invisible="+invisibleRows+";eligible="+rows+";observed_at="+now);
        }
        FeatureSettings.diagnostic(frame.host.getContext(),"ls_augment_notification_cascade_runtime_"+(frame.keyguard?"lock":"shade"),
                stage+";surface="+(frame.keyguard?"lock":"shade")+";rows="+rows+";visible_projected="+applied+";passes="+evidence.passes
                +";applied_passes="+evidence.appliedPasses+";last_applied_at="+evidence.lastAppliedAt+";scroll="+scroll
                +";native_range="+original+";effective_range="+Math.max(original,surface.required)+";start="+frame.start+";end="+frame.end
                +";lock_space="+frame.space+";privacy=native;observed_at="+now);
    }
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
        final Method scrollRange,scrollability,clampScroll,scrollingEnabled,scrollTouch,interceptScroll,childAt,stackY,stackHeight,refresh;
        final Method[] changing;final Field host,maxHeight,y,z,scaleX,scaleY,height,gone,hidden,clipTop,clipBottom,scroll,lockSpace,children;
        final ArrayList<Method> touches=new ArrayList<>();
        Access(ClassLoader loader)throws ReflectiveOperationException{
            Class<?> algorithm=Class.forName(BASE+"stack.StackScrollAlgorithm",false,loader);
            Class<?> layout=Class.forName(BASE+"stack.NotificationStackScrollLayout",false,loader);
            Class<?> ambient=Class.forName(BASE+"stack.AmbientState",false,loader);
            Class<?> algorithmState=Class.forName(BASE+"stack.StackScrollAlgorithm$StackScrollAlgorithmState",false,loader);
            Class<?> expandable=Class.forName(BASE+"row.ExpandableView",false,loader);row=Class.forName(BASE+"row.ExpandableNotificationRow",false,loader);
            state=method(expandable,"getViewState");Class<?> viewState=state.getReturnType();
            reset=method(algorithm,"resetViewStates",ambient,int.class);shelfClamp=method(algorithm,"updateViewWithShelf",expandable,viewState,float.class);
            resetRow=method(expandable,"resetViewState");host=field(algorithm,"mHostView",ViewGroup.class);maxHeight=field(layout,"mMaxLayoutHeight",int.class);
            scroll=field(layout,"mOwnScrollY",int.class);lockSpace=field(algorithm,"mKeyguardNotificationSpace",float.class);
            children=field(algorithmState,"visibleChildren",ArrayList.class);
            scrollRange=method(layout,"getScrollRange");scrollability=method(layout,"updateScrollability");clampScroll=method(layout,"clampScrollPosition");
            refresh=method(layout,"requestChildrenUpdate");result(refresh,void.class);
            scrollingEnabled=method(layout,"isScrollingEnabled");scrollTouch=method(layout,"onScrollTouch",MotionEvent.class);
            interceptScroll=method(layout,"onInterceptTouchEventScroll",MotionEvent.class);childAt=method(layout,"getChildAtPosition",float.class,float.class);
            touches.add(interceptScroll);touches.add(scrollTouch);
            // Keep the override alive through the whole native dispatch, including
            // nested interception and the final UP that starts the native fling.
            Method dispatch=method(layout,"dispatchTouchEvent",MotionEvent.class);result(dispatch,boolean.class);
            if(dispatch.getDeclaringClass()==layout)touches.add(dispatch);
            try{Method offered=method(layout,"offerScrollTouchToScroller",MotionEvent.class);result(offered,boolean.class);touches.add(offered);}
            catch(NoSuchMethodException olderDispatch){/* Original scroll entry points remain installed. */}
            stackY=method(ambient,"getStackY");stackHeight=method(ambient,"getInterpolatedStackHeight");
            result(scrollRange,int.class);result(scrollability,void.class);result(clampScroll,void.class);result(scrollingEnabled,boolean.class);
            result(scrollTouch,boolean.class);result(interceptScroll,boolean.class);result(stackY,float.class);result(stackHeight,float.class);
            updateChild=method(algorithm,"updateChild",int.class,algorithmState,ambient);positions=method(algorithm,"updatePositionsForState",algorithmState,ambient);resetChildren=method(algorithm,"resetChildViewStates");
            y=field(viewState,"mYTranslation",float.class);z=field(viewState,"mZTranslation",float.class);scaleX=field(viewState,"mScaleX",float.class);scaleY=field(viewState,"mScaleY",float.class);
            height=field(viewState,"height",int.class);gone=field(viewState,"gone",boolean.class);hidden=field(viewState,"hidden",boolean.class);clipTop=field(viewState,"clipTopAmount",int.class);clipBottom=field(viewState,"clipBottomAmount",int.class);
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
