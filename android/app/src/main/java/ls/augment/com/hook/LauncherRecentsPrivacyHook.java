package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewParent;
import android.widget.ImageView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import ls.augment.com.AppPackageSet;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.RecentsPrivacyOptions;

/** Replaces only a selected task's snapshot drawing; never modifies the app or its snapshot data. */
final class LauncherRecentsPrivacyHook {
    private static boolean installed;

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        installed = true;
        try {
            Binding binding = new Binding(module, loader);
            int count = 0;
            for (String name : new String[]{"com.android.quickstep.views.TaskThumbnailViewDeprecated",
                    "com.android.quickstep.views.TaskThumbnailView"}) {
                try { binding.installLegacy(Class.forName(name, false, loader)); count++; }
                catch (ClassNotFoundException absent) { /* Other supported family may be present. */ }
                catch (ReflectiveOperationException | RuntimeException error) {
                    module.logFeatureError("RECENTS_PRIVACY_LEGACY_CAPABILITY", error);
                }
            }
            try {
                binding.installModern(Class.forName("com.android.quickstep.task.thumbnail.TaskThumbnailView", false, loader), loader);
                count++;
            } catch (ClassNotFoundException absent) { /* Legacy thumbnail-only launcher. */ }
            catch (ReflectiveOperationException | RuntimeException error) {
                module.logFeatureError("RECENTS_PRIVACY_MODERN_CAPABILITY", error);
            }
            if (count == 0) throw new NoSuchMethodException("No supported Recents thumbnail drawing/identity capability");
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            module.logFeatureError("RECENTS_PRIVACY_INSTALL", error);
        }
    }

    private static final class Binding {
        final AugmentModule module;
        final Class<?> taskType;
        final Field taskKey;
        final Method component;
        final Field taskThumbnail;
        final Method thumbnailGetter;
        final Field thumbnailField;
        final RecentsPrivacyBackdrop backdrop;
        final Map<View, Boolean> observed = new WeakHashMap<>();
        ConfigSnapshot lastSnapshot;
        Set<String> packages = Collections.emptySet();
        boolean enabled, listening, drawErrorLogged;
        Drawable icon;

        Binding(AugmentModule module, ClassLoader loader) throws ReflectiveOperationException {
            this.module = module;
            taskType = Class.forName("com.android.systemui.shared.recents.model.Task", false, loader);
            Class<?> keyType = Class.forName("com.android.systemui.shared.recents.model.Task$TaskKey", false, loader);
            taskKey = HookCompatibility.field(taskType, keyType, false, "key");
            component = method(keyType, ComponentName.class, "getComponent");
            Class<?> data=Class.forName("com.android.systemui.shared.recents.model.ThumbnailData",false,loader);
            taskThumbnail=HookCompatibility.field(taskType,data,false,"thumbnail");
            Method getter=null;Field field=null;
            try{getter=method(data,Bitmap.class,"getThumbnail");}
            catch(NoSuchMethodException older){field=HookCompatibility.field(data,Bitmap.class,false,"thumbnail");}
            thumbnailGetter=getter;thumbnailField=field;
            backdrop=new RecentsPrivacyBackdrop(module);
        }

        void installLegacy(Class<?> type) throws ReflectiveOperationException {
            if (!View.class.isAssignableFrom(type)) throw new NoSuchMethodException(type.getName()+" is not View");
            Field task = HookCompatibility.field(type, taskType, false, "mTask");
            Method thumbnail=method(type,Bitmap.class,"getThumbnail");
            Method matrix=method(type,Matrix.class,"getThumbnailMatrix");
            Method draw = method(type, void.class, "drawOnCanvas", Canvas.class,
                    float.class, float.class, float.class, float.class, float.class);
            module.registerFeatureHook(module.prepareFeatureHook(draw,"launcher.recents.privacy.legacy",false).intercept(chain -> {
                View view = (View) chain.getThisObject();
                try {
                    Object identity=task.get(view);
                    if (selected(view, identity)) {
                        // The OEM's live-tile CLEAR operation is inside this method.
                        // Skipping it keeps an opaque mask over the live surface as well.
                        Bitmap source=(Bitmap)thumbnail.invoke(view);
                        Matrix transform=source==null?null:(Matrix)matrix.invoke(view);
                        if(source==null)source=taskBitmap(identity);
                        drawMask(view,identity,source,transform,(Canvas)chain.getArg(0), (Float)chain.getArg(1), (Float)chain.getArg(2),
                                (Float)chain.getArg(3), (Float)chain.getArg(4), (Float)chain.getArg(5));
                        return null;
                    }
                } catch (ReflectiveOperationException | RuntimeException error) { logDraw(error); }
                return chain.proceed();
            }));
            module.deoptimize(draw);
        }

        void installModern(Class<?> type, ClassLoader loader) throws ReflectiveOperationException {
            if (!android.view.ViewGroup.class.isAssignableFrom(type)) throw new NoSuchMethodException(type.getName()+" is not ViewGroup");
            Class<?> owner = Class.forName("com.android.quickstep.views.TaskView", false, loader);
            Class<?> container;
            try { container = Class.forName("com.android.quickstep.views.TaskContainer", false, loader); }
            catch (ClassNotFoundException absent) { container = Class.forName("com.android.quickstep.views.TaskView$TaskContainer", false, loader); }
            Method containers = method(owner, List.class, "getTaskContainers");
            Method snapshot = container.getDeclaredMethod("getSnapshotView");
            if (!View.class.isAssignableFrom(snapshot.getReturnType())) throw new NoSuchMethodException("getSnapshotView does not return View");
            snapshot.setAccessible(true);
            Method task = method(container, taskType, "getTask");
            Method radius = method(type, float.class, "getCornerRadius");
            Method bounds = method(type, Rect.class, "getOutlineBounds");
            Class<?> stateType=Class.forName("com.android.quickstep.task.thumbnail.TaskThumbnailUiState",false,loader);
            Class<?> snapshotType=Class.forName(stateType.getName()+"$Snapshot",false,loader);
            Field state=HookCompatibility.field(type,stateType,false,"uiState");
            // Older Snapshot is abstract, with concrete WithHeader/WithoutHeader
            // subclasses. This is a reader, not a hook: virtual dispatch is needed.
            Method bitmap=snapshotType.getMethod("getBitmap");
            if(bitmap.getReturnType()!=Bitmap.class)throw new NoSuchMethodException("Snapshot.getBitmap return type");
            Method image=type.getDeclaredMethod("getThumbnailView");
            if(!ImageView.class.isAssignableFrom(image.getReturnType()))throw new NoSuchMethodException("getThumbnailView return type");
            image.setAccessible(true);
            RecentsPrivacyOverlay.Painter painter=(view,canvas)->{
                Object identity = null;
                    ViewParent parent = view.getParent();
                    while (parent instanceof View && !owner.isInstance(parent)) parent = parent.getParent();
                    if (owner.isInstance(parent)) {
                        // Resolve from today's binding on EVERY draw. Recycled and split
                        // cards must not inherit a previously selected package.
                        for (Object item : (List<?>)containers.invoke(parent)) {
                            if (snapshot.invoke(item) == view) { identity = task.invoke(item); break; }
                        }
                    }
                    if (selected(view, identity)) {
                        if(canvas==null)return true;
                        Rect rect = (Rect) bounds.invoke(view);
                        if (rect == null || rect.isEmpty()) rect = new Rect(0,0,view.getWidth(),view.getHeight());
                        // Suppress the thumbnail AND LiveTileView children. Their CLEAR
                        // paint otherwise reveals the remote app surface beneath Recents.
                        Object current=state.get(view);
                        Bitmap source=null;Matrix transform=null;
                        if(snapshotType.isInstance(current)){
                            source=(Bitmap)bitmap.invoke(current);
                            ImageView child=(ImageView)image.invoke(view);
                            if(child!=null){transform=new Matrix(child.getImageMatrix());transform.postTranslate(child.getLeft(),child.getTop());}
                        }
                        if(source==null)source=taskBitmap(identity);
                        drawMask(view,identity,source,transform,canvas,rect.left,rect.top,rect.right,rect.bottom,(Float)radius.invoke(view));
                        return true;
                    }
                    return false;
            };
            if(RecentsPrivacyOverlay.install(module,type,stateType,painter))return;
            Class<?> declaration = type;
            Method draw = null;
            while (declaration != null && draw == null) {
                try { draw = method(declaration, void.class, "dispatchDraw", Canvas.class); }
                catch (NoSuchMethodException inherited) { declaration = declaration.getSuperclass(); }
            }
            if (draw == null) throw new NoSuchMethodException(type.getName()+".dispatchDraw");
            module.registerFeatureHook(module.prepareFeatureHook(draw,"launcher.recents.privacy.modern",false).intercept(chain->{
                if(type.isInstance(chain.getThisObject()))try{
                    if(painter.paint((View)chain.getThisObject(),(Canvas)chain.getArg(0)))return null;
                }catch(ReflectiveOperationException|RuntimeException error){logDraw(error);}
                return chain.proceed();
            }));
            module.deoptimize(draw);
        }

        boolean selected(View view, Object task) throws ReflectiveOperationException {
            observed.put(view, Boolean.TRUE);
            Context context = view.getContext();
            if (!listening) listening = FeatureSettings.addSnapshotListener(context, () -> {
                backdrop.clear();
                for (View item : new ArrayList<>(observed.keySet())) {
                    if (item != null) item.postInvalidateOnAnimation();
                }
            });
            ConfigSnapshot snapshot = FeatureSettings.snapshot(context);
            if (lastSnapshot != snapshot) {
                lastSnapshot = snapshot;
                enabled = snapshot != null && "1".equals(snapshot.get(RecentsPrivacyOptions.ENABLED));
                packages = snapshot == null ? Collections.emptySet() : AppPackageSet.parse(snapshot.get(RecentsPrivacyOptions.APPS));
            }
            if (!enabled || packages.isEmpty() || !taskType.isInstance(task)){backdrop.release(view);return false;}
            Object key = taskKey.get(task);
            ComponentName name = key == null ? null : (ComponentName)component.invoke(key);
            boolean selected=name != null && packages.contains(name.getPackageName());
            if(!selected)backdrop.release(view);
            return selected;
        }

        Bitmap taskBitmap(Object task)throws ReflectiveOperationException{
            if(!taskType.isInstance(task))return null;
            Object data=taskThumbnail.get(task);
            return data==null?null:(Bitmap)(thumbnailGetter!=null?thumbnailGetter.invoke(data):thumbnailField.get(data));
        }

        void drawMask(View view,Object task,Bitmap source,Matrix matrix,Canvas canvas, float left, float top, float right, float bottom, float radius) {
            if (!Float.isFinite(left) || !Float.isFinite(top) || !Float.isFinite(right) || !Float.isFinite(bottom)
                    || !Float.isFinite(radius) || right <= left || bottom <= top) throw new IllegalArgumentException("Invalid snapshot bounds/radius");
            if (icon == null) {
                try { icon = view.getContext().getPackageManager().getApplicationIcon("ls.augment.com").mutate(); }
                catch (android.content.pm.PackageManager.NameNotFoundException error) { throw new IllegalStateException("Duo icon unavailable", error); }
            }
            float corner = Math.max(0, Math.min(radius, Math.min(right-left,bottom-top)/2));
            backdrop.draw(view,task,source,matrix,canvas,left,top,right,bottom,corner);
            int size = Math.max(1, Math.round(Math.min(56 * view.getResources().getDisplayMetrics().density,
                    Math.min(right-left,bottom-top)*.26f)));
            int x = Math.round((left+right-size)/2), y = Math.round((top+bottom-size)/2);
            icon.setBounds(x,y,x+size,y+size);
            icon.draw(canvas);
        }

        void logDraw(Throwable error) {
            if (!drawErrorLogged) { drawErrorLogged = true; module.logFeatureError("RECENTS_PRIVACY_DRAW_CAPABILITY",error); }
        }
        static Method method(Class<?> type, Class<?> result, String name, Class<?>... args) throws NoSuchMethodException {
            return HookCompatibility.method(type,result,false,new String[]{name},args);
        }
    }
}
