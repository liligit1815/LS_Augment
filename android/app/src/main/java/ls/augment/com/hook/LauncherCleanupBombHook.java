package ls.augment.com.hook;

import android.animation.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.LauncherOptions;

/** Animation only: the one original dismiss call owns task selection, locks, and cleanup. */
final class LauncherCleanupBombHook {
    private static final ThreadLocal<Blast> CAPTURING=new ThreadLocal<>();
    private static final Map<View,Blast> ACTIVE=new WeakHashMap<>();
    private static final Map<View,Blast> FRAGMENT_VIEWS=new WeakHashMap<>();
    private static final Map<Object,Blast> SPRINGS=new WeakHashMap<>();
    private static final Map<View,IconBinding> ICONS=new WeakHashMap<>();

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static void install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> recents=Class.forName("com.android.quickstep.views.RecentsView",false,loader);
            Class<?> button=Class.forName("com.android.quickstep.views.ClearAllButton",false,loader);
            Method dismiss=recents.getDeclaredMethod("dismissAllTasks",View.class);dismiss.setAccessible(true);
            Method all;
            try { all=recents.getDeclaredMethod("createAllTasksDismissAnimation",long.class); }
            catch (NoSuchMethodException springPath) { all=null; }
            final boolean nativeDuration=all!=null;
            Method draw=button.getDeclaredMethod("draw",Canvas.class);
            Field overview=recents.getDeclaredField("mOverviewStateEnabled");overview.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(draw,"launcher.cleanup.icon",false).intercept(chain->{
                View view=(View)chain.getThisObject();
                IconBinding binding=bindIcon(view);
                if(!FeatureSettings.enabled(view.getContext(),LauncherOptions.CLEANUP_BOMB)||!binding.artwork.ready())return chain.proceed();
                Canvas canvas=(Canvas)chain.getArg(0);
                int save=canvas.saveLayerAlpha(0,0,view.getWidth(),view.getHeight(),0);
                // Preserve the native draw's real clip/geometry and side effects.
                // An empty clip can skip native work via quickReject; hide its pixels in a layer.
                try{chain.proceed();}finally{canvas.restoreToCount(save);}
                float radius=Math.min(view.getWidth(),view.getHeight())*.28f;
                binding.draw(canvas,view.getWidth()/2f,view.getHeight()/2f,radius);
                return null;
            }));
            boolean particlesAvailable=false;
            for(Method method:recents.getDeclaredMethods()){
                Class<?>[] args=method.getParameterTypes();
                if(!method.getName().equals("addDismissedTaskAnimations")||args.length!=4||!View.class.isAssignableFrom(args[0])||args[1]!=long.class||args[3]!=boolean.class)continue;
                module.registerFeatureHook(module.prepareFeatureHook(method,"launcher.cleanup.fragments",false).intercept(chain->{
                    Blast blast=CAPTURING.get();
                    if(blast!=null&&blast.particles!=null&&blast.owner==chain.getThisObject()&&Boolean.TRUE.equals(chain.getArg(3))){
                        try{View card=(View)chain.getArg(0);
                            blast.particles.capture(card,blast.root);
                            if(blast.particles.contains(card))FRAGMENT_VIEWS.put(card,blast);}
                        catch(Throwable error){blast.module.logFeatureError("CLEANUP_FRAGMENT_CAPTURE",error);}
                    }
                    return chain.proceed();
                }));particlesAvailable=true;break;
            }
            if(!particlesAvailable && !nativeDuration){
                Class<?> utils=Class.forName("com.android.quickstep.views.RecentsDismissUtils",false,loader);
                Field owner=HookCompatibility.field(utils,recents,false,"recentsView");
                Class<?> task=Class.forName("com.android.quickstep.views.TaskView",false,loader);
                Class<?> data=Class.forName(utils.getName()+"$DismissedTaskData",false,loader);
                Class<?> spring=Class.forName(utils.getName()+"$SpringSet",false,loader);
                Method capture;
                boolean batch=false;
                try{
                    capture=utils.getDeclaredMethod("createDismissedTaskViewSpringAnimation",task);
                    if(capture.getReturnType().isPrimitive())throw new NoSuchMethodException("batch spring return");
                    capture.setAccessible(true);batch=true;
                }catch(NoSuchMethodException older){
                    capture=HookCompatibility.method(utils,spring,false,new String[]{"createTaskDismissSpringAnimation"},
                            task,boolean.class,data,boolean.class,boolean.class);
                }
                if(batch)installSpringCompletion(module,spring);
                module.deoptimize(capture);
                for(Method caller:utils.getDeclaredMethods())if(caller.getName().equals("dismissAllTasks"))module.deoptimize(caller);
                module.registerFeatureHook(module.prepareFeatureHook(capture,"launcher.cleanup.spring_fragments",false).intercept(chain->{
                    Blast blast=CAPTURING.get();
                    Object result=chain.proceed();
                    if(result!=null&&blast!=null&&owner.get(chain.getThisObject())==blast.owner){
                        try{blast.selectedCards++;View card=(View)chain.getArg(0);
                            if(blast.particles!=null){blast.particles.capture(card,blast.root);
                                if(blast.particles.contains(card))FRAGMENT_VIEWS.put(card,blast);}}
                        catch(Throwable error){blast.module.logFeatureError("CLEANUP_FRAGMENT_CAPTURE",error);}
                    }
                    return result;
                }));particlesAvailable=true;
            }
            if(particlesAvailable && nativeDuration){
                module.deoptimize(all);
                module.registerFeatureHook(module.prepareFeatureHook(all,"launcher.cleanup.duration",false).intercept(chain->{
                    Blast blast=CAPTURING.get();
                    Object result=blast!=null?chain.proceed(new Object[]{blast.duration()}):chain.proceed();
                    if(blast!=null)try{blast.start();}catch(Throwable error){
                        blast.close("start_failed");module.logFeatureError("CLEANUP_BOMB_START",error);
                    }
                    return result;
                }));
            }
            if(particlesAvailable){
                Method cardAlpha=View.class.getDeclaredMethod("setAlpha",float.class);
                module.registerFeatureHook(module.prepareFeatureHook(cardAlpha,"launcher.cleanup.card_alpha",false).intercept(chain->{
                    Blast blast=FRAGMENT_VIEWS.get((View)chain.getThisObject());
                    if(blast==null||blast.closed)return chain.proceed();
                    blast.cardAlphas.put((View)chain.getThisObject(),(Float)chain.getArg(0));
                    return chain.proceed(new Object[]{0f});
                }));
            }
            final boolean canShatter=particlesAvailable;
            module.registerFeatureHook(module.prepareFeatureHook(dismiss,"launcher.cleanup.bomb",false).intercept(chain->{
                View view=(View)chain.getThisObject();
                if(!FeatureSettings.enabled(view.getContext(),LauncherOptions.CLEANUP_BOMB)
                        ||!ValueAnimator.areAnimatorsEnabled()||!view.isAttachedToWindow())return chain.proceed();
                // Append value 2 so existing bomb/particle choices keep their meaning.
                // Icons have their own binding; the native path never captures cards,
                // changes duration, defers completion or plays our sound.
                String animation=FeatureSettings.snapshot(view.getContext()).get(LauncherOptions.CLEANUP_STYLE);
                if(!"0".equals(animation)&&!"1".equals(animation))return chain.proceed();
                if(ACTIVE.containsKey(view))return chain.proceed();
                // DragLayer remains stable while native cards translate out of RecentsView.
                // Exit/detach cleanup still bounds the overlay to this overview session.
                View source=chain.getArg(0) instanceof View?(View)chain.getArg(0):view;
                if(view.getWidth()==0||view.getHeight()==0)return chain.proceed();
                Blast blast=null;
                try{
                    View overlayRoot=view;
                    for(android.view.ViewParent parent=view.getParent();parent instanceof View;parent=parent.getParent()){
                        if(parent.getClass().getName().endsWith(".DragLayer")){overlayRoot=(View)parent;break;}
                    }
                    blast=new Blast(module,view,overlayRoot,source,overview,canShatter&&"1".equals(animation));
                    ACTIVE.put(view,blast);
                    if(!canShatter)blast.start();
                }catch(Throwable error){
                    if(blast!=null)blast.close();blast=null;
                    module.logFeatureError("CLEANUP_BOMB_START",error);
                }
                // The OEM call stays in the original click stack, exactly once. Never
                // re-enter a hooked method reflectively from an animator callback.
                Blast previous=CAPTURING.get();
                if(blast!=null)CAPTURING.set(blast);
                try{
                    if(blast!=null)blast.trace("native_begin");
                    Object result=chain.proceed();
                    if(blast!=null && canShatter && !nativeDuration)blast.start();
                    if(blast!=null)blast.trace("native_return");
                    return result;
                }
                catch(Throwable error){if(blast!=null)blast.close("native_throw");throw error;}
                finally{if(previous==null)CAPTURING.remove();else CAPTURING.set(previous);}
            }));
            Method imageDraw=ImageView.class.getDeclaredMethod("onDraw",Canvas.class);
            module.registerFeatureHook(module.prepareFeatureHook(imageDraw,"launcher.cleanup.image_draw",false).intercept(chain->{
                ImageView image=(ImageView)chain.getThisObject();
                if(!ICONS.containsKey(image)||!FeatureSettings.enabled(image.getContext(),LauncherOptions.CLEANUP_BOMB)||!ICONS.get(image).artwork.ready())return chain.proceed();
                Canvas canvas=(Canvas)chain.getArg(0);int save=canvas.saveLayerAlpha(0,0,image.getWidth(),image.getHeight(),0);
                try{chain.proceed();}finally{canvas.restoreToCount(save);}
                ICONS.get(image).draw(canvas,image.getWidth()/2f,image.getHeight()/2f,Math.min(image.getWidth(),image.getHeight())*.34f);
                return null;
            }));
            bindIconHost(module,loader,"OverviewActionsView","remove_all_button");
            bindIconHost(module,loader,"MFVClearAllButton","mfv_clear_iv");
        }catch(Throwable error){module.logFeatureError("CLEANUP_BOMB_UNAVAILABLE",error);}
    }
    /** Keep the inspected native completion attached to its own SpringSet. The
     * selected tasks and removal listeners are never rebuilt or called twice. */
    private static void installSpringCompletion(AugmentModule module,Class<?> spring)throws ReflectiveOperationException{
        Method start=HookCompatibility.method(spring,spring,false,new String[]{"start"});
        Method end=HookCompatibility.method(spring,void.class,false,new String[]{"onEnd"});
        // Private onEnd can be inlined into the native spring listeners.
        for(Method method:spring.getDeclaredMethods())module.deoptimize(method);
        module.registerFeatureHook(module.prepareFeatureHook(start,"launcher.cleanup.spring_start",false).intercept(chain->{
            Blast blast=CAPTURING.get();
            if(blast!=null&&blast.selectedCards>0){SPRINGS.put(chain.getThisObject(),blast);blast.start();}
            return chain.proceed();
        }));
        module.registerFeatureHook(module.prepareFeatureHook(end,"launcher.cleanup.spring_end",false).intercept(chain->{
            Object owner=chain.getThisObject();Blast blast=SPRINGS.get(owner);
            if(blast==null||blast.closed||!ValueAnimator.areAnimatorsEnabled())return chain.proceed();
            if(blast.completion==null)blast.completion=()->{
                try{end.invoke(owner);}catch(ReflectiveOperationException error){module.logFeatureError("CLEANUP_SPRING_COMPLETION",error);}
            };
            return null;
        }));
    }
    private static void bindIconHost(AugmentModule module,ClassLoader loader,String name,String id){
        try{
            Class<?> host=Class.forName("com.android.quickstep.views."+name,false,loader);
            for(Method method:host.getDeclaredMethods()){
                boolean inflate=method.getName().equals("onFinishInflate")&&method.getParameterCount()==0;
                boolean theme=method.getName().equals("onForeColorChanged")&&java.util.Arrays.equals(method.getParameterTypes(),new Class<?>[]{int.class});
                if(!inflate&&!theme)continue;
                module.registerFeatureHook(module.prepareFeatureHook(method,"launcher.cleanup.icon."+name+"."+method.getName(),false).intercept(chain->{
                    Object result=chain.proceed();
                    try{bindIcon((View)chain.getThisObject(),id);}catch(Throwable error){module.logFeatureError("CLEANUP_ICON_BIND",error);}
                    return result;
                }));
            }
        }catch(ClassNotFoundException optional){}catch(Throwable error){module.logFeatureError("CLEANUP_ICON_UNAVAILABLE "+name,error);}
    }

    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private static void bindIcon(View root,String id){
        View child=null;
        try{Field field=root.getClass().getDeclaredField("mClearAllButton");field.setAccessible(true);Object value=field.get(root);if(value instanceof ImageView)child=(View)value;}
        catch(ReflectiveOperationException ignored){}
        if(child==null){int resource=root.getResources().getIdentifier(id,"id",root.getContext().getPackageName());child=resource==0?null:root.findViewById(resource);}
        if(!(child instanceof ImageView))return;
        CleanupExplosionSound.prepare(root.getContext());
        View clickHost=null;
        try{Field host=root.getClass().getDeclaredField("mClearAllButtonLayout");host.setAccessible(true);
            Object candidate=host.get(root);if(candidate instanceof View&&child.getParent()==candidate)clickHost=(View)candidate;
        }catch(ReflectiveOperationException ignored){}
        bindControl(child,clickHost).refresh();
    }
    private static IconBinding bindIcon(View image){
        return bindControl(image,null);
    }
    private static IconBinding bindControl(View image,View clickHost){
        IconBinding binding=ICONS.get(image);
        if(binding==null){binding=new IconBinding(image,clickHost);ICONS.put(image,binding);image.addOnAttachStateChangeListener(binding);if(image.isAttachedToWindow())binding.onViewAttachedToWindow(image);}
        return binding;
    }
    private static final class IconBinding implements View.OnAttachStateChangeListener {
        final WeakReference<View> view;final CleanupIconImage artwork;final CleanupIconLayout layout;final Runnable changed=this::refresh;boolean attached;
        IconBinding(View image,View host){view=new WeakReference<>(image);artwork=new CleanupIconImage(image);layout=new CleanupIconLayout(image,host);}
        void refresh(){View image=view.get();if(image!=null){
            boolean enabled=FeatureSettings.enabled(image.getContext(),LauncherOptions.CLEANUP_BOMB);
            boolean c17=enabled&&"0".equals(FeatureSettings.snapshot(image.getContext()).get(LauncherOptions.CLEANUP_ICON_STYLE));
            layout.update(c17);
            artwork.update(enabled?(c17?CleanupIconImage.C17:FeatureSettings.snapshot(image.getContext()).get(LauncherOptions.CLEANUP_ICON)):"");image.invalidate();}}
        void draw(Canvas canvas,float x,float y,float radius){artwork.draw(canvas,x,y,radius);}
        @Override public void onViewAttachedToWindow(View image){if(!attached){attached=true;FeatureSettings.addSnapshotListener(image.getContext(),changed);}refresh();}
        @Override public void onViewDetachedFromWindow(View image){attached=false;FeatureSettings.removeSnapshotListener(changed);artwork.clear();layout.update(false);}
    }
    private static final class Blast extends Drawable implements View.OnAttachStateChangeListener {
        final AugmentModule module;final View owner,root,source;final Field overview;
        final RecentsParticleEffect particles;
        final HolographicBlastEffect energy;
        final Map<View,Float> cardAlphas=new WeakHashMap<>();
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);final ValueAnimator animator=ValueAnimator.ofFloat(0,1);
        final float startX,startY,radius;float progress;boolean closed,drawn,sounded,started;int soundStream,selectedCards;
        Runnable completion;
        final long traceId=System.nanoTime();
        Blast(AugmentModule module,View owner,View root,View source,Field overview,boolean shatter){
            particles=shatter?new RecentsParticleEffect():null;
            energy=shatter?null:new HolographicBlastEffect();
            this.module=module;this.owner=owner;this.root=root;this.source=source;this.overview=overview;
            int[] a=new int[2],b=new int[2];root.getLocationOnScreen(a);source.getLocationOnScreen(b);
            startX=b[0]-a[0]+source.getWidth()/2f;startY=b[1]-a[1]+source.getHeight()/2f;
            radius=24*root.getResources().getDisplayMetrics().density;
        }
        long duration(){return particles==null?1450L:1150L;}
        void start(){
            if(started||closed)return;started=true;
            trace("start style="+(particles==null?"bomb":"particles"));
            for(Map.Entry<View,Blast> card:FRAGMENT_VIEWS.entrySet())if(card.getValue()==this){
                View view=card.getKey();float alpha=view.getAlpha();view.setAlpha(0f);cardAlphas.put(view,alpha);
            }
            setBounds(0,0,root.getWidth(),root.getHeight());root.getOverlay().add(this);root.addOnAttachStateChangeListener(this);
            // The native pending animation owns completion and shares the effect timeline.
            animator.setDuration(duration());animator.setInterpolator(new LinearInterpolator());
            animator.addUpdateListener(value->{
                if(closed)return;
                if(!owner.isAttachedToWindow()||!owner.isShown()
                        ||root.getWidth()!=getBounds().width()||root.getHeight()!=getBounds().height()){close("view_changed");return;}
                try{if(!overview.getBoolean(owner)){close("overview_exit");return;}}
                catch(IllegalAccessException error){close("overview_unavailable");return;}
                progress=(float)value.getAnimatedValue();
                if(particles==null&&!sounded&&progress>=HolographicBlastEffect.IMPACT){sounded=true;soundStream=CleanupExplosionSound.play(owner.getContext());}
                invalidateSelf();
            });
            animator.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator value){close("animation_end");}});
            animator.start();
        }
        void close(){
            close("start_failed");
        }
        void close(String reason){
            if(closed)return;closed=true;CleanupExplosionSound.stop(soundStream);animator.cancel();root.getOverlay().remove(this);root.removeOnAttachStateChangeListener(this);ACTIVE.remove(owner);
            trace("close reason="+reason+" drawn="+drawn);
            FRAGMENT_VIEWS.entrySet().removeIf(entry->entry.getValue()==this);
            for(Map.Entry<View,Float> card:cardAlphas.entrySet())card.getKey().setAlpha(card.getValue());
            cardAlphas.clear();
            if(particles!=null)particles.close();
            SPRINGS.entrySet().removeIf(entry->entry.getValue()==this);
            Runnable pending=completion;completion=null;if(pending!=null)pending.run();
        }
        @Override public void onViewAttachedToWindow(View view){}
        void trace(String stage){FeatureSettings.diagnostic(owner.getContext(),"ls_augment_cleanup_visual_runtime",stage+";cards="+(particles==null?0:particles.size()));module.logFeatureInfo("CLEANUP_FLOW id="+traceId+" wall="+System.currentTimeMillis()+" elapsedMs="+((System.nanoTime()-traceId)/1_000_000)+" "+stage);}
        @Override public void onViewDetachedFromWindow(View view){close("detached");}
        @Override public void draw(Canvas canvas){
            if(!drawn){drawn=true;trace("first_draw");}
            if(particles!=null){try{particles.draw(canvas,progress);}catch(Throwable error){module.logFeatureError("CLEANUP_FRAGMENT_DRAW",error);particles.close();}return;}
            try{energy.draw(canvas,progress,getBounds().width(),getBounds().height(),startX,startY,radius*1.6f);}
            catch(RuntimeException error){module.logFeatureError("CLEANUP_EXPLOSION_DRAW",error);close("draw_failed");}
        }
        @Override public void setAlpha(int alpha){}
        @Override public void setColorFilter(ColorFilter filter){}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
