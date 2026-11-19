package ls.augment.com.hook;

import android.app.ActivityManager;
import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.hardware.HardwareBuffer;
import android.view.View;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import ls.augment.com.AppPackageSet;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.RecentsPrivacyOptions;

/** Protect the remote app layer during the gesture, before a thumbnail is visible.
 * The opaque child follows the OEM leash's matrix/crop in the SAME transaction.
 * The animation container stays opaque while protected: per-child inherited
 * alpha otherwise blends the original app THROUGH an opaque child buffer.
 * App buffers and stored snapshots are never changed. */
final class RecentsPrivacyTransition {
    private static boolean installed;
    private final AugmentModule module;
    private final Contract t;
    private final Map<Object, Cover> covers = new IdentityHashMap<>();
    private final Map<Integer, LaunchRequest> launches = new HashMap<>();
    private final Map<Object,Float> nativeAlphas = new WeakHashMap<>();
    private boolean listening, failed, writingAlpha;

    private RecentsPrivacyTransition(AugmentModule module, Contract t) { this.module=module; this.t=t; }
    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Contract t = new Contract(loader);
            RecentsPrivacyTransition adapter = new RecentsPrivacyTransition(module, t);
            module.registerFeatureHook(module.prepareFeatureHook(t.alpha,"launcher.recents.privacy.opacity",false).intercept(chain->{
                synchronized(adapter){
                    Object leash=chain.getArg(0);float alpha=(Float)chain.getArg(1);
                    if(!adapter.writingAlpha&&Float.isFinite(alpha)&&alpha>=0f&&alpha<=1f){
                        adapter.nativeAlphas.put(leash,alpha);
                        Cover cover=adapter.covers.get(leash);
                        if(cover!=null){cover.nativeAlpha=alpha;return chain.proceed(new Object[]{leash,alpha==0f?0f:1f});}
                    }
                    return chain.proceed();
                }
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.create, "launcher.recents.privacy.transition", false).intercept(chain -> {
                Object transaction = chain.proceed();
                try { adapter.prepare(chain.getThisObject(), transaction); }
                catch (ReflectiveOperationException | RuntimeException error) { adapter.error(error); }
                return transaction;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.releaseTargets, "launcher.recents.privacy.transition_release", false).intercept(chain -> {
                Object result = chain.proceed();
                try {
                    // release() may be deferred by native release checks. Do not remove
                    // the cover until the native animation actually relinquishes its leash.
                    if (t.released.getBoolean(chain.getThisObject())) adapter.releaseSet(chain.getThisObject());
                } catch (ReflectiveOperationException | RuntimeException error) { adapter.error(error); }
                return result;
            }));
            module.deoptimize(t.create); module.deoptimize(t.releaseTargets);module.deoptimize(t.alpha);
            adapter.installBinding(loader);
            adapter.installLaunch(loader);
            adapter.installFirstDisplay(loader);
            installed=true;
        } catch (ReflectiveOperationException | RuntimeException error) {
            module.logFeatureError("RECENTS_PRIVACY_TRANSITION_CAPABILITY", error);
        }
    }

    private void installFirstDisplay(ClassLoader loader) {
        try {
            Class<?> taskView=Class.forName("com.android.quickstep.views.TaskView",false,loader);
            Class<?> callbacks=Class.forName("com.android.launcher3.util.RunnableList",false,loader);
            Method ids=Contract.method(taskView,int[].class,"getTaskIds");
            Method launch=HookCompatibility.inheritedMethod(taskView,callbacks,false,
                    new String[]{"launchWithAnimation","launchTaskAnimated"});
            Method add=Contract.method(callbacks,void.class,"add",Runnable.class);
            Class<?> compat=Class.forName("com.android.systemui.animation.RemoteAnimationTargetCompat",false,loader);
            Method wrap=HookCompatibility.method(compat,t.apps.getType(),true,new String[]{"wrapApps"},
                    Class.forName("android.window.TransitionInfo",false,loader),t.newTransaction.getDeclaringClass(),
                    Class.forName("android.util.ArrayMap",false,loader));
            module.registerFeatureHook(module.prepareFeatureHook(launch,"launcher.recents.privacy.request",false).intercept(chain->{
                LaunchRequest request;
                try { request=beginLaunch((int[])ids.invoke(chain.getThisObject())); }
                catch(ReflectiveOperationException|RuntimeException error){error(error);return chain.proceed();}
                Object result;
                try {result=chain.proceed();}
                catch(Throwable failure){finishLaunch(request);throw failure;}
                try {
                    if(result==null)finishLaunch(request);
                    else add.invoke(result,(Runnable)()->finishLaunch(request));
                }catch(ReflectiveOperationException|RuntimeException error){finishLaunch(request);error(error);}
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(wrap,"launcher.recents.privacy.first_display",false).intercept(chain->{
                Object apps=chain.proceed();
                try {prepareFirstDisplay(apps,chain.getArg(1));}
                catch(ReflectiveOperationException|RuntimeException error){error(error);}
                return apps;
            }));
            module.deoptimize(launch);module.deoptimize(wrap);
        }catch(ReflectiveOperationException|RuntimeException error){
            module.logFeatureError("RECENTS_PRIVACY_FIRST_DISPLAY_CAPABILITY",error);
        }
    }

    private synchronized LaunchRequest beginLaunch(int[] ids) {
        LaunchRequest request=new LaunchRequest();
        // Expire only an unclaimed intent, never a layer involved in an active
        // animation. This prevents an abandoned click matching a later app launch.
        launches.values().removeIf(old->System.nanoTime()-old.at>10_000_000_000L);
        if(ids!=null)for(int id:ids)if(id>=0)launches.put(id,request);
        return request;
    }

    private synchronized void prepareFirstDisplay(Object apps,Object transaction)throws ReflectiveOperationException {
        if(apps==null||transaction==null||launches.isEmpty())return;
        for(int i=0;i<Array.getLength(apps);i++) {
            Object target=Array.get(apps,i);
            LaunchRequest request=launches.get(t.taskId.getInt(target));
            if(request==null||System.nanoTime()-request.at>10_000_000_000L||t.mode.getInt(target)!=0)continue;
            Object single=Array.newInstance(t.apps.getType().getComponentType(),1);Array.set(single,0,target);
            // Shell's initial visibility transaction is applied BEFORE the UI
            // animation factory runs. Opaque pixels must travel in that same tx.
            prepareApps(single,transaction,false,"first_display");
            request.leashes.add(t.leash.get(target));
        }
    }

    private synchronized void finishLaunch(LaunchRequest request) {
        launches.values().removeIf(value->value==request);
        try {
            Object transaction=t.newTransaction.newInstance();
            try {
                for(Object leash:request.leashes){Cover cover=covers.get(leash);
                    if(cover!=null&&!cover.transformed)remove(leash,cover,transaction);}
                t.apply.invoke(transaction);
            }finally{t.close.invoke(transaction);}
        }catch(ReflectiveOperationException|RuntimeException error){error(error);}
    }

    private static final class LaunchRequest {
        final long at=System.nanoTime();
        final ArrayList<Object> leashes=new ArrayList<>();
    }

    private void installBinding(ClassLoader loader) {
        try {
            Class<?> params=Class.forName("com.android.quickstep.util.TransformParams",false,loader);
            Method bind=Contract.method(params,params,"setTargetSet",t.getTargets.getReturnType());
            module.registerFeatureHook(module.prepareFeatureHook(bind,"launcher.recents.privacy.bind",false).intercept(chain->{
                Object result=chain.proceed(),targets=chain.getArg(0);
                try { prepareBoundTargets(targets); }
                catch(ReflectiveOperationException|RuntimeException error){error(error);}
                return result;
            }));
            module.deoptimize(bind);
        }catch(ReflectiveOperationException|RuntimeException error){
            module.logFeatureError("RECENTS_PRIVACY_BIND_CAPABILITY",error);
        }
    }
    private synchronized void prepareBoundTargets(Object targets)throws ReflectiveOperationException {
        if(targets==null || t.released.getBoolean(targets))return;
        // OEM visibility/corner preparation can precede the first simulator
        // frame. Attach opaque pixels as soon as the actual targets are bound.
        Object transaction=t.newTransaction.newInstance();
        try {prepareApps(t.apps.get(targets),transaction,true,"target_bound");t.apply.invoke(transaction);}
        finally {t.close.invoke(transaction);}
    }

    private void installLaunch(ClassLoader loader) {
        try {
            Class<?> owner=Class.forName("com.android.quickstep.TaskViewUtils",false,loader);
            Class<?> targets=t.apps.getType();
            Method compose=null;
            for(Method method:owner.getDeclaredMethods()) {
                Class<?>[] p=method.getParameterTypes();
                if(!method.getName().equals("composeRecentsLaunchAnimator") || method.getReturnType()!=void.class
                        || !Modifier.isStatic(method.getModifiers()) || p.length<9 || p.length>11
                        || p[0]!=AnimatorSet.class || p[1]!=View.class || p[2]!=targets || p[3]!=targets || p[4]!=targets
                        || p[5]!=boolean.class || p[6].isPrimitive() || p[6].isArray() || p[8].isPrimitive() || p[8].isArray()
                        || !p[7].getName().equals("com.android.quickstep.views.RecentsView") || !View.class.isAssignableFrom(p[7])
                        || p.length>=10 && !p[9].getName().equals("android.window.TransitionInfo")
                        || p.length==11 && p[10]!=int.class)continue;
                if(compose!=null)throw new NoSuchMethodException("ambiguous Recents launch contract");
                compose=method;
            }
            if(compose==null)throw new NoSuchMethodException(owner.getName()+".composeRecentsLaunchAnimator");
            compose.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(compose,"launcher.recents.privacy.launch",false).intercept(chain->{
                Object apps=chain.getArg(2);
                try { prepareLaunch(apps); }
                catch(ReflectiveOperationException|RuntimeException error){error(error);}
                try {
                    Object result=chain.proceed();
                    ((AnimatorSet)chain.getArg(0)).addListener(new AnimatorListenerAdapter(){
                        @Override public void onAnimationEnd(Animator animation){
                            // Normal transformed covers follow RemoteAnimationTargets'
                            // native release checks. Clean only an unused preparation.
                            try{discardUnusedLaunch(apps);}catch(ReflectiveOperationException|RuntimeException error){error(error);}
                            animation.removeListener(this);
                        }
                    });
                    return result;
                }catch(Throwable failure){
                    try{discardUnusedLaunch(apps);}catch(ReflectiveOperationException|RuntimeException error){error(error);}
                    throw failure;
                }
            }));
            module.deoptimize(compose);
        } catch(ReflectiveOperationException|RuntimeException error) {
            // Keep existing entry/transform protection on older unknown launch paths.
            module.logFeatureError("RECENTS_PRIVACY_LAUNCH_CAPABILITY",error);
        }
    }

    private synchronized void prepareLaunch(Object apps)throws ReflectiveOperationException {
        if(apps==null)return;
        Object transaction=t.newTransaction.newInstance();
        try { prepareApps(apps,transaction,false,"before_launch");t.apply.invoke(transaction); }
        finally { t.close.invoke(transaction); }
    }
    private synchronized void discardUnusedLaunch(Object apps)throws ReflectiveOperationException {
        if(apps==null)return;
        Object transaction=t.newTransaction.newInstance();
        try {
            for(int i=0;i<Array.getLength(apps);i++) {
                Object leash=t.leash.get(Array.get(apps,i));Cover cover=covers.get(leash);
                if(cover!=null&&!cover.transformed)remove(leash,cover,transaction);
            }
            t.apply.invoke(transaction);
        }finally{t.close.invoke(transaction);}
    }

    private synchronized void prepare(Object params, Object wrapper) throws ReflectiveOperationException {
        Object targets=t.getTargets.invoke(params);
        if (targets==null || wrapper==null) return;
        prepareApps(t.apps.get(targets),t.transaction.invoke(wrapper),true,"native_transform");
    }

    private void prepareApps(Object apps,Object transaction,boolean transformed,String phase)throws ReflectiveOperationException {
        Context context=(Context)t.application.invoke(null);
        if (context==null) return;
        if (!listening) listening=FeatureSettings.addSnapshotListener(context, () -> {
            try { clearUnselected(context); } catch (ReflectiveOperationException | RuntimeException error) { error(error); }
        });
        Set<String> selected=selected(context);
        for (int i=0; i<Array.getLength(apps); i++) {
            Object target=Array.get(apps,i), leash=t.leash.get(target);
            ActivityManager.RunningTaskInfo task=(ActivityManager.RunningTaskInfo)t.task.get(target);
            ComponentName component=task==null?null:task.baseActivity;
            if (component==null && task!=null) component=task.topActivity;
            String pkg=component==null?"":component.getPackageName();
            int mode=t.mode.getInt(target);
            if(!transformed && mode!=0)continue;
            // Quickstep owns both directions: closing into Recents and opening
            // an existing card. Keep the latter covered until native release,
            // not merely until the live app replaces the card's thumbnail.
            boolean protect=(mode==1 || mode==0) && task!=null && t.activityType(task,target)!=2
                    && task.taskId==t.taskId.getInt(target) && selected.contains(pkg);
            Cover current=covers.get(leash);
            if (!protect) {
                if (current!=null) remove(leash, current, transaction);
                continue;
            }
            if (leash==null || !Boolean.TRUE.equals(t.valid.invoke(leash))) continue;
            Rect bounds=(Rect)t.bounds.get(target);
            if (bounds==null || bounds.width()<=0 || bounds.height()<=0) continue;
            if (current!=null && (current.taskId!=task.taskId || !current.pkg.equals(pkg)
                    || current.width!=bounds.width() || current.height!=bounds.height())) {
                remove(leash,current,transaction); current=null;
            }
            if (current==null) {
                current=create(context,leash,task.taskId,pkg,bounds.width(),bounds.height(),transaction);
                current.nativeAlpha=nativeAlphas.getOrDefault(leash,1f);
                covers.put(leash,current);
                FeatureSettings.diagnostic(context,"ls_augment_recents_privacy_transition_runtime",
                        "cover_prepared;task="+task.taskId+";mode="+mode+";phase="+phase
                                +";buffer_with_visibility=true;container_opaque=true;source_pixels_unchanged=true");
            }
            current.transformed|=transformed;
            // Zero is the OEM's not-positioned/hidden phase. Keep it hidden;
            // forcing it visible would flash a full-screen cover before the
            // first card matrix is committed. Any visible fade must be opaque.
            ownedAlpha(transaction,leash,current.nativeAlpha==0f?0f:1f);
            t.layer.invoke(transaction,current.control,Integer.MAX_VALUE);
            t.matrix.invoke(transaction,current.control,(float)current.width/current.bufferWidth,0f,0f,(float)current.height/current.bufferHeight);
            t.position.invoke(transaction,current.control,0f,0f);
            t.show.invoke(transaction,current.control);
        }
    }

    private Cover create(Context context,Object leash,int taskId,String pkg,int width,int height,Object nativeTransaction) throws ReflectiveOperationException {
        int bw=Math.max(1,Math.round(256f*width/Math.max(width,height)));
        int bh=Math.max(1,Math.round(256f*height/Math.max(width,height)));
        Object builder=t.builder.newInstance();
        t.name.invoke(builder,"DuoRecentsPrivacy-"+taskId);
        t.parent.invoke(builder,leash); t.size.invoke(builder,bw,bh); t.hidden.invoke(builder,true);
        Object control=t.build.invoke(builder);
        Bitmap pixels=null,gpu=null;
        try {
            pixels=Bitmap.createBitmap(bw,bh,Bitmap.Config.ARGB_8888);
            Canvas canvas=new Canvas(pixels);
            try {
                // Reuse the privacy screen's opaque placeholder while the native
                // screenshot is pending. No readable app pixels are copied here.
                new RecentsPrivacyBackdrop(module).draw(new View(context),control,null,null,canvas,0,0,bw,bh,0);
                Drawable icon=context.getPackageManager().getApplicationIcon("ls.augment.com").mutate();
                int side=Math.max(1,Math.round(Math.min(bw,bh)*.26f));
                int x=(bw-side)/2,y=(bh-side)/2;icon.setBounds(x,y,x+side,y+side);icon.draw(canvas);
            } catch (android.content.pm.PackageManager.NameNotFoundException error) { throw new IllegalStateException(error); }
            // BufferQueue posting and the transform transaction were independent:
            // show() could reach the compositor before the opaque pixels did.
            // Submit the buffer, show and native app transform atomically instead.
            gpu=pixels.copy(Bitmap.Config.HARDWARE,false);
            if(gpu==null)throw new IllegalStateException("隐私屏硬件缓冲不可用");
            try(HardwareBuffer buffer=gpu.getHardwareBuffer()){
                if(buffer==null)throw new IllegalStateException("隐私屏缓冲为空");
                t.buffer.invoke(nativeTransaction,control,buffer);
            }
            return new Cover(control,taskId,pkg,width,height,bw,bh);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Object transaction=t.newTransaction.newInstance();
            try { t.remove.invoke(transaction,control);t.apply.invoke(transaction); }
            finally { t.close.invoke(transaction);t.releaseSurface.invoke(control); }
            throw error;
        } finally { if(gpu!=null)gpu.recycle();if(pixels!=null)pixels.recycle(); }
    }

    private Set<String> selected(Context context) {
        ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
        return snapshot!=null && "1".equals(snapshot.get(RecentsPrivacyOptions.ENABLED))
                ? AppPackageSet.parse(snapshot.get(RecentsPrivacyOptions.APPS)) : java.util.Collections.emptySet();
    }
    private synchronized void clearUnselected(Context context) throws ReflectiveOperationException {
        Set<String> selected=selected(context);
        Object transaction=t.newTransaction.newInstance();
        try {
            for (Object leash:new ArrayList<>(covers.keySet())) {
                Cover cover=covers.get(leash);if (!selected.contains(cover.pkg)) remove(leash,cover,transaction);
            }
            t.apply.invoke(transaction);
        } finally { t.close.invoke(transaction); }
    }
    private synchronized void releaseSet(Object targets) throws ReflectiveOperationException {
        Object transaction=t.newTransaction.newInstance(), apps=t.apps.get(targets);
        try {
            for(int i=0;i<Array.getLength(apps);i++) {
                Object leash=t.leash.get(Array.get(apps,i));Cover cover=covers.get(leash);
                if(cover!=null) remove(leash,cover,transaction);
            }
            t.apply.invoke(transaction);
        } finally { t.close.invoke(transaction); }
    }
    private void remove(Object leash,Cover cover,Object transaction) throws ReflectiveOperationException {
        t.remove.invoke(transaction,cover.control);covers.remove(leash);
        if(Boolean.TRUE.equals(t.valid.invoke(leash)))ownedAlpha(transaction,leash,cover.nativeAlpha);
        t.releaseSurface.invoke(cover.control);
    }
    private void ownedAlpha(Object transaction,Object leash,float value)throws ReflectiveOperationException {
        writingAlpha=true;
        try{t.alpha.invoke(transaction,leash,value);}finally{writingAlpha=false;}
    }
    private void error(Throwable error) { if(!failed){failed=true;module.logFeatureError("RECENTS_PRIVACY_TRANSITION",error);} }
    private static final class Cover {
        final Object control;final int taskId,width,height,bufferWidth,bufferHeight;final String pkg;
        boolean transformed;
        float nativeAlpha=1f;
        Cover(Object c,int id,String p,int w,int h,int bw,int bh){control=c;taskId=id;pkg=p;width=w;height=h;bufferWidth=bw;bufferHeight=bh;}
    }

    static final class Contract {
        final Method create,getTargets,transaction,releaseTargets,application,valid,releaseSurface,name,parent,size,hidden,build,
                layer,matrix,position,show,remove,apply,close,buffer,alpha;
        final Field apps,leash,task,taskId,mode,activityType,bounds,released;
        final Method taskActivityType;
        final Constructor<?> builder,newTransaction;
        Contract(ClassLoader loader) throws ReflectiveOperationException {
            Class<?> params=Class.forName("com.android.quickstep.util.TransformParams",false,loader);
            Class<?> proxy=Class.forName(params.getName()+"$BuilderProxy",false,loader);
            Class<?> wrapper=Class.forName("com.android.quickstep.util.SurfaceTransaction",false,loader);
            Class<?> targets=Class.forName("com.android.quickstep.RemoteAnimationTargets",false,loader);
            Class<?> target=Class.forName("android.view.RemoteAnimationTarget",false,loader);
            Class<?> control=Class.forName("android.view.SurfaceControl",false,loader);
            Class<?> tx=Class.forName(control.getName()+"$Transaction",false,loader);
            Class<?> b=Class.forName(control.getName()+"$Builder",false,loader);
            create=method(params,wrapper,"createSurfaceParams",proxy);getTargets=method(params,targets,"getTargetSet");
            transaction=method(wrapper,tx,"getTransaction");releaseTargets=method(targets,void.class,"release");
            released=HookCompatibility.field(targets,boolean.class,false,"mReleased");
            apps=HookCompatibility.field(targets,Array.newInstance(target,0).getClass(),false,"unfilteredApps");
            leash=HookCompatibility.field(target,control,false,"leash");task=HookCompatibility.field(target,ActivityManager.RunningTaskInfo.class,false,"taskInfo");
            taskId=HookCompatibility.field(target,int.class,false,"taskId");mode=HookCompatibility.field(target,int.class,false,"mode");
            Field typeField=null;Method typeMethod=null;
            try { typeField=HookCompatibility.field(target,int.class,false,"activityType"); }
            catch (NoSuchFieldException newer) { typeMethod=method(ActivityManager.RunningTaskInfo.class,int.class,"getActivityType"); }
            activityType=typeField;taskActivityType=typeMethod;
            bounds=HookCompatibility.field(target,Rect.class,false,"screenSpaceBounds");
            Class<?> activityThread=Class.forName("android.app.ActivityThread",false,loader);
            application=HookCompatibility.method(activityThread,android.app.Application.class,true,new String[]{"currentApplication"});
            builder=b.getDeclaredConstructor();builder.setAccessible(true);
            newTransaction=tx.getDeclaredConstructor();newTransaction.setAccessible(true);
            name=method(b,b,"setName",String.class);parent=method(b,b,"setParent",control);size=method(b,b,"setBufferSize",int.class,int.class);
            hidden=method(b,b,"setHidden",boolean.class);build=method(b,control,"build");valid=method(control,boolean.class,"isValid");
            releaseSurface=method(control,void.class,"release");
            layer=method(tx,tx,"setLayer",control,int.class);matrix=method(tx,tx,"setMatrix",control,float.class,float.class,float.class,float.class);
            position=method(tx,tx,"setPosition",control,float.class,float.class);show=method(tx,tx,"show",control);
            buffer=method(tx,tx,"setBuffer",control,HardwareBuffer.class);
            alpha=method(tx,tx,"setAlpha",control,float.class);
            remove=method(tx,tx,"remove",control);apply=method(tx,void.class,"apply");close=method(tx,void.class,"close");
        }
        static Method method(Class<?> owner,Class<?> result,String name,Class<?>... args) throws NoSuchMethodException {
            return HookCompatibility.inheritedMethod(owner,result,false,new String[]{name},args);
        }
        int activityType(ActivityManager.RunningTaskInfo task,Object target) throws ReflectiveOperationException {
            return activityType!=null ? activityType.getInt(target) : (Integer) taskActivityType.invoke(task);
        }
    }
}
