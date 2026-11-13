package ls.augment.com.hook;

import android.view.View;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.function.Predicate;

/** Arbitrate only OEM capsule rendering; provider state and ongoing notifications remain native. */
final class NativeIslandCapsules {
    private static final String TYPE = "com.zte.feature.callnotify.CallLayout";
    private static final String[] SCENES = {"call", "record", null, "meeting", null, "ai"};
    private static final String[] FIELDS = {"mCallingVisible", "mRecordingVisible", "mCastVisible",
            "mMeetingVisible", "mAntiFraudVisible", "mAiVisible"};
    private final Map<String, Field> scenes = new LinkedHashMap<>();
    private final List<Field> visibility = new ArrayList<>();
    private final Map<Object, Boolean> layouts = Collections.synchronizedMap(new WeakHashMap<>());
    private final Predicate<String> owns;
    private final ThreadLocal<Integer> rendering = ThreadLocal.withInitial(() -> 0);
    private Method refresh, update;
    private Method recordTime, higherPriority;
    private Field displayText;
    private java.util.function.Consumer<String> report;
    private boolean textFailureReported;
    private boolean ready;
    private EnumIslandCapsules enumAdapter;

    NativeIslandCapsules(Predicate<String> owns) { this.owns = owns; }

    int install(AugmentModule module, ClassLoader loader) {
        try { return install(module, Class.forName(TYPE, false, loader)); }
        catch (Throwable missing) { module.logFeatureError("NATIVE_SCENE_CAPSULE", missing); return 0; }
    }

    int install(AugmentModule module, Class<?> type) throws ReflectiveOperationException {
        report=module::logFeatureInfo;
        // Do not hook framework View globally when an OEM override or the renderer is missing.
        Method set = method(type, "setVisibility", void.class, int.class);
        Method visible = method(type, "isViewVisible", boolean.class, int.class);
        if (visible == null) {
            try {
                enumAdapter = new EnumIslandCapsules(owns);
                int count = enumAdapter.install(module, type);
                ready = enumAdapter.ready();
                return count;
            } catch (ReflectiveOperationException missing) {
                module.logFeatureInfo("NATIVE_SCENE_MISSING capsule_render_contract:" + missing.getMessage());
                return 0;
            }
        }
        refresh = method(type, "handleVisibilityChanged", void.class);
        update = method(type, "updateVisibility", void.class);
        recordTime=method(type,"getTimeCount",String.class,int.class);
        higherPriority=method(type,"hasHigherPriorityViewVisible",boolean.class,int.class);
        displayText=NativeIslandSceneContract.field(type,"mDisplayText",TextView.class);
        if (set == null || set.getDeclaringClass() == View.class || visible == null || refresh == null) {
            module.logFeatureInfo("NATIVE_SCENE_MISSING capsule_render_contract"); return 0;
        }
        for (int i = 0; i < SCENES.length; i++) if (SCENES[i] != null) {
            Field f = NativeIslandSceneContract.field(type, FIELDS[i], int.class);
            if (f != null && !Modifier.isStatic(f.getModifiers())) scenes.put(SCENES[i], f);
            else module.logFeatureInfo("NATIVE_SCENE_MISSING capsule_field:" + FIELDS[i]);
        }
        for (Class<?> c = type; c != null && c != View.class; c = c.getSuperclass())
            for (Field f : c.getDeclaredFields()) {
                // Paused is a recorder status (0/1/2), not a separately visible scene.
                if (!f.getName().endsWith("Visible") || f.getName().equals("mRecordPausedVisible")
                        || Modifier.isStatic(f.getModifiers()) || (f.getType() != int.class && f.getType() != boolean.class)) continue;
                f.setAccessible(true); visibility.add(f);
            }
        if (scenes.isEmpty()) return 0;
        module.registerFeatureHook(module.prepareFeatureHook(set, "rm.ui.native_scene.capsule.setVisibility", false).intercept(chain -> {
            Object layout = track(chain.getThisObject()); Object[] args = chain.getArgs().toArray();
            if (type.isInstance(layout) && (Integer) args[0] == View.VISIBLE && suppressing() && !anotherVisible(layout))
                args[0] = View.GONE;
            if (type.isInstance(layout) && (Integer)args[0]==View.VISIBLE) prepareRecordText(layout);
            return chain.proceed(args);
        }));
        module.registerFeatureHook(module.prepareFeatureHook(visible, "rm.ui.native_scene.capsule.isViewVisible", false).intercept(chain -> {
            Object layout = track(chain.getThisObject());
            if (type.isInstance(layout) && suppress((Integer) chain.getArg(0))) return false;
            return chain.proceed();
        }));
        int count = 2;
        // These are rendering boundaries only. Never mask getViewStatus/getCurrentVisibility or
        // isVisibilityChanged: they maintain the producer cache needed when ownership is released.
        Set<Method> methods = new LinkedHashSet<>();
        for (String name : new String[]{"handleVisibilityChanged", "updateRecorderTimeCount", "updateCallTimeCount",
                "updateMeetingTimeCount", "updateAiWordingCount", "isAnyViewShouldVisible"}) {
            Method m = method(type, name, name.equals("isAnyViewShouldVisible") ? boolean.class : void.class);
            if (m != null) methods.add(m);
        }
        for (String name : new String[]{"handleFinalVisibility", "hasHigherPriorityViewVisible", "skipUpdateText", "showView"}) {
            Method m = method(type, name, name.equals("handleFinalVisibility") ? int.class : name.equals("showView") ? void.class : boolean.class, int.class);
            if (m != null) methods.add(m);
        }
        // OEM handleVisibilityChanged posts this renderer. Masking only the posting method
        // restores fields too early; include the actual callback, including synthetic methods.
        for (Class<?> c = type; c != null && c != View.class; c = c.getSuperclass())
            for (Method m : c.getDeclaredMethods())
                if (m.getName().startsWith("lambda$handleVisibilityChanged$") && m.getReturnType() == void.class
                        && m.getParameterCount() == 0 && !Modifier.isStatic(m.getModifiers())) {
                    m.setAccessible(true); methods.add(m);
                }
        for (Method m : methods) {
            module.registerFeatureHook(module.prepareFeatureHook(m, "rm.ui.native_scene.capsule." + m.getName(), false).intercept(chain -> {
                Object layout = track(chain.getThisObject());
                if (!type.isInstance(layout) || !suppressing()) return chain.proceed();
                if (m.getName().equals("showView") && suppress((Integer) chain.getArg(0))) return null;
                Map<Field, Integer> before = new LinkedHashMap<>();
                int depth = rendering.get(); rendering.set(depth + 1);
                try {
                    for (Map.Entry<String, Field> entry : scenes.entrySet()) if (suppresses(entry.getKey())) {
                        Field f = entry.getValue(); before.put(f, f.getInt(layout)); f.setInt(layout, View.GONE);
                    }
                    return chain.proceed();
                } finally {
                    for (Map.Entry<Field, Integer> entry : before.entrySet()) entry.getKey().setInt(layout, entry.getValue());
                    if (depth == 0) rendering.remove(); else rendering.set(depth);
                }
            })); count++;
        }
        Method time = method(type, "getTimeCount", String.class, int.class);
        if (time != null) {
            module.registerFeatureHook(module.prepareFeatureHook(time, "rm.ui.native_scene.capsule.render_time", false).intercept(chain -> {
                if (type.isInstance(chain.getThisObject()) && rendering.get() > 0 && suppress((Integer) chain.getArg(0))) return null;
                return chain.proceed();
            })); count++;
        }
        Method launcher = method(type, "updateViewVisibilityFromLauncher", void.class, int.class);
        if (launcher != null) {
            module.registerFeatureHook(module.prepareFeatureHook(launcher, "rm.ui.native_scene.capsule.launcher", false).intercept(chain -> {
                Object layout = track(chain.getThisObject());
                if (type.isInstance(layout) && suppress((Integer) chain.getArg(0))) {
                    // Re-evaluate other active scenes instead of allowing this shortcut to force
                    // the taken-over scene's text, alpha and visibility back on screen.
                    refresh.invoke(layout); return null;
                }
                return chain.proceed();
            })); count++;
        } else module.logFeatureInfo("NATIVE_SCENE_MISSING capsule_launcher_entry");
        // Old queued text callbacks must not overwrite the freshly restored recording label.
        for (Class<?> current=type;current!=null && current!=View.class;current=current.getSuperclass()) {
            for (Method callback:current.getDeclaredMethods()) {
            boolean text=callback.getName().startsWith("lambda$updateDisplayText$")
                    && Arrays.equals(callback.getParameterTypes(),new Class<?>[]{String.class});
            boolean pause=callback.getName().startsWith("lambda$updateRecorderTimeCount$") && callback.getParameterCount()==0;
            if ((!text && !pause) || callback.getReturnType()!=void.class || Modifier.isStatic(callback.getModifiers())) continue;
            callback.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(callback,"rm.ui.native_scene.capsule.restore_text",false).intercept(chain->{
                if (prepareRecordText(chain.getThisObject())) return null;
                return chain.proceed();
            })); count++;
        }
        }
        Method attach = method(type, "onAttachedToWindow", void.class);
        if (attach != null && attach.getDeclaringClass() != View.class) {
            module.registerFeatureHook(module.prepareFeatureHook(attach, "rm.ui.native_scene.capsule.attach", false).intercept(chain -> {
                Object value = chain.proceed(); if (type.isInstance(chain.getThisObject())) track(chain.getThisObject()); return value;
            })); count++;
        }
        ready = true;
        return count;
    }

    boolean ready() { return ready; }
    private boolean prepareRecordText(Object layout) {
        try {
            Field record=scenes.get("record");
            if (record==null || recordTime==null || displayText==null || higherPriority==null
                    || suppresses("record") || record.getInt(layout)!=View.VISIBLE
                    || Boolean.TRUE.equals(higherPriority.invoke(layout,1))) return false;
            Object label=displayText.get(layout);
            if (!(label instanceof TextView)) return false;
            String current=(String)recordTime.invoke(layout,1);
            ((TextView)label).setText(current==null?"":current);
            return true;
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            if (!textFailureReported && report!=null) {
                textFailureReported=true;
                report.accept("NATIVE_SCENE_MISSING capsule_record_text:"+unavailable.getClass().getSimpleName());
            }
            return false;
        }
    }
    boolean supportsScene(String scene) {
        if (enumAdapter != null) return enumAdapter.supportsScene(scene);
        return !Arrays.asList(SCENES).contains(scene) || ready && scenes.containsKey(scene);
    }
    private Object track(Object layout) { if (layout instanceof View) layouts.put(layout, Boolean.TRUE); return layout; }
    private boolean suppress(int type) { return type >= 0 && type < SCENES.length && suppresses(SCENES[type]); }
    private boolean suppresses(String scene) { return ready && scene != null && scenes.containsKey(scene) && owns.test(scene); }
    private boolean suppressing() { for (String scene : scenes.keySet()) if (suppresses(scene)) return true; return false; }
    private boolean anotherVisible(Object layout) throws IllegalAccessException {
        for (Field f : visibility) {
            boolean masked = false;
            for (Map.Entry<String, Field> scene : scenes.entrySet()) if (scene.getValue().equals(f) && suppresses(scene.getKey())) { masked = true; break; }
            if (!masked && (f.getType() == boolean.class ? f.getBoolean(layout) : f.getInt(layout) == View.VISIBLE)) return true;
        }
        return false;
    }
    void refresh(java.util.function.Consumer<String> report) {
        if (enumAdapter != null) { enumAdapter.refresh(report); return; }
        ArrayList<Object> copy;
        synchronized (layouts) { copy = new ArrayList<>(layouts.keySet()); }
        for (Object layout : copy) if (layout instanceof View && ((View) layout).isAttachedToWindow()) try {
            // Source observers keep their state while rendering is masked. Re-read first to
            // include native updates received during an ownership/configuration transition.
            if (update != null) update.invoke(layout);
            refresh.invoke(layout);
        } catch (Exception missing) { report.accept("capsule_restore_unavailable:" + missing.getClass().getSimpleName()); }
    }
    private static Method method(Class<?> type, String name, Class<?> result, Class<?>... args) {
        Method m = NativeIslandSceneContract.method(type, name, result, args);
        return m == null || Modifier.isStatic(m.getModifiers()) ? null : m;
    }
}
