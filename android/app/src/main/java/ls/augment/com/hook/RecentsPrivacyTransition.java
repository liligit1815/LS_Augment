package ls.augment.com.hook;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.Surface;
import android.view.View;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Set;
import ls.augment.com.AppPackageSet;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.RecentsPrivacyOptions;

/** Protect the remote app layer during the gesture, before a thumbnail is visible.
 * The opaque child follows the OEM leash's matrix/crop in the SAME transaction.
 * App surfaces, their alpha and their stored snapshots are never changed. */
final class RecentsPrivacyTransition {
    private static boolean installed;
    private final AugmentModule module;
    private final Contract t;
    private final Map<Object, Cover> covers = new IdentityHashMap<>();
    private boolean listening, failed;

    private RecentsPrivacyTransition(AugmentModule module, Contract t) { this.module=module; this.t=t; }
    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Contract t = new Contract(loader);
            RecentsPrivacyTransition adapter = new RecentsPrivacyTransition(module, t);
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
            module.deoptimize(t.create); module.deoptimize(t.releaseTargets);
            installed=true;
        } catch (ReflectiveOperationException | RuntimeException error) {
            module.logFeatureError("RECENTS_PRIVACY_TRANSITION_CAPABILITY", error);
        }
    }

    private synchronized void prepare(Object params, Object wrapper) throws ReflectiveOperationException {
        Object targets=t.getTargets.invoke(params);
        if (targets==null || wrapper==null) return;
        Context context=(Context)t.application.invoke(null);
        if (context==null) return;
        if (!listening) listening=FeatureSettings.addSnapshotListener(context, () -> {
            try { clearUnselected(context); } catch (ReflectiveOperationException | RuntimeException error) { error(error); }
        });
        Set<String> selected=selected(context);
        Object transaction=t.transaction.invoke(wrapper);
        Object apps=t.apps.get(targets);
        for (int i=0; i<Array.getLength(apps); i++) {
            Object target=Array.get(apps,i), leash=t.leash.get(target);
            ActivityManager.RunningTaskInfo task=(ActivityManager.RunningTaskInfo)t.task.get(target);
            ComponentName component=task==null?null:task.baseActivity;
            if (component==null && task!=null) component=task.topActivity;
            String pkg=component==null?"":component.getPackageName();
            boolean protect=t.mode.getInt(target)==1 && task!=null && t.activityType(task,target)!=2
                    && task!=null && task.taskId==t.taskId.getInt(target) && selected.contains(pkg);
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
                current=create(context,leash,task.taskId,pkg,bounds.width(),bounds.height());
                covers.put(leash,current);
                FeatureSettings.diagnostic(context,"ls_augment_recents_privacy_transition_runtime",
                        "cover_prepared;task="+task.taskId+";same_native_transaction=true;app_surface_unchanged=true");
            }
            t.layer.invoke(transaction,current.control,Integer.MAX_VALUE);
            t.matrix.invoke(transaction,current.control,(float)current.width/current.bufferWidth,0f,0f,(float)current.height/current.bufferHeight);
            t.position.invoke(transaction,current.control,0f,0f);
            t.show.invoke(transaction,current.control);
        }
    }

    private Cover create(Context context,Object leash,int taskId,String pkg,int width,int height) throws ReflectiveOperationException {
        int bw=Math.max(1,Math.round(256f*width/Math.max(width,height)));
        int bh=Math.max(1,Math.round(256f*height/Math.max(width,height)));
        Object builder=t.builder.newInstance();
        t.name.invoke(builder,"DuoRecentsPrivacy-"+taskId);
        t.parent.invoke(builder,leash); t.size.invoke(builder,bw,bh); t.hidden.invoke(builder,true);
        Object control=t.build.invoke(builder);
        Surface surface=null;
        try {
            surface=(Surface)t.surface.newInstance(control);
            Canvas canvas=surface.lockCanvas(null);
            try {
                // Reuse the privacy screen's opaque placeholder while the native
                // screenshot is pending. No readable app pixels are copied here.
                new RecentsPrivacyBackdrop(module).draw(new View(context),control,null,null,canvas,0,0,bw,bh,0);
                Drawable icon=context.getPackageManager().getApplicationIcon("ls.augment.com").mutate();
                int side=Math.max(1,Math.round(Math.min(bw,bh)*.26f));
                int x=(bw-side)/2,y=(bh-side)/2;icon.setBounds(x,y,x+side,y+side);icon.draw(canvas);
            } catch (android.content.pm.PackageManager.NameNotFoundException error) { throw new IllegalStateException(error); }
            finally { surface.unlockCanvasAndPost(canvas); }
            return new Cover(control,taskId,pkg,width,height,bw,bh);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Object transaction=t.newTransaction.newInstance();
            try { t.remove.invoke(transaction,control);t.apply.invoke(transaction); }
            finally { t.close.invoke(transaction);t.releaseSurface.invoke(control); }
            throw error;
        } finally { if(surface!=null) surface.release(); }
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
        t.remove.invoke(transaction,cover.control);covers.remove(leash);t.releaseSurface.invoke(cover.control);
    }
    private void error(Throwable error) { if(!failed){failed=true;module.logFeatureError("RECENTS_PRIVACY_TRANSITION",error);} }
    private static final class Cover {
        final Object control;final int taskId,width,height,bufferWidth,bufferHeight;final String pkg;
        Cover(Object c,int id,String p,int w,int h,int bw,int bh){control=c;taskId=id;pkg=p;width=w;height=h;bufferWidth=bw;bufferHeight=bh;}
    }

    static final class Contract {
        final Method create,getTargets,transaction,releaseTargets,application,valid,releaseSurface,name,parent,size,hidden,build,
                layer,matrix,position,show,remove,apply,close;
        final Field apps,leash,task,taskId,mode,activityType,bounds,released;
        final Method taskActivityType;
        final Constructor<?> builder,surface,newTransaction;
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
            surface=Surface.class.getDeclaredConstructor(control);surface.setAccessible(true);
            newTransaction=tx.getDeclaredConstructor();newTransaction.setAccessible(true);
            name=method(b,b,"setName",String.class);parent=method(b,b,"setParent",control);size=method(b,b,"setBufferSize",int.class,int.class);
            hidden=method(b,b,"setHidden",boolean.class);build=method(b,control,"build");valid=method(control,boolean.class,"isValid");
            releaseSurface=method(control,void.class,"release");
            layer=method(tx,tx,"setLayer",control,int.class);matrix=method(tx,tx,"setMatrix",control,float.class,float.class,float.class,float.class);
            position=method(tx,tx,"setPosition",control,float.class,float.class);show=method(tx,tx,"show",control);
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
