package ls.augment.com.hook;

import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.Consumer;
import java.util.function.Predicate;

/** Enum-based OEM capsule renderer. Provider state is never filtered or cancelled. */
final class EnumIslandCapsules {
    private static final Map<String,String> NAMES;
    static {
        Map<String,String> names = new LinkedHashMap<>();
        names.put("CALL", "call"); names.put("RECORD", "record");
        names.put("MEETING", "meeting"); names.put("AI", "ai");
        names.put("SCREEN_RECORD", "screen_record"); names.put("HOTSPOT", "hotspot");
        NAMES = Collections.unmodifiableMap(names);
    }
    private final Predicate<String> owns;
    private final Map<Object,String> scenes = new LinkedHashMap<>();
    private final Map<Object,Boolean> layouts = Collections.synchronizedMap(new WeakHashMap<>());
    private final ThreadLocal<Integer> rendering = ThreadLocal.withInitial(() -> 0);
    private Field visibility;
    private Method refresh, update;
    private boolean ready;

    EnumIslandCapsules(Predicate<String> owns) { this.owns = owns; }

    int install(AugmentModule module, Class<?> layout) throws ReflectiveOperationException {
        Class<?> kind = null;
        for(Class<?> c=layout;c!=null&&c!=View.class;c=c.getSuperclass())
            for(Method candidate:c.getDeclaredMethods())
                if(candidate.getName().equals("isViewVisible")&&candidate.getReturnType()==boolean.class
                        &&candidate.getParameterCount()==1&&candidate.getParameterTypes()[0].isEnum())
                    kind=candidate.getParameterTypes()[0];
        if(kind==null)throw new NoSuchMethodException("capsule_view_type_missing");
        if (!kind.isEnum()) throw new NoSuchFieldException("capsule_view_type_not_enum");
        visibility = NativeIslandSceneContract.field(layout, "mViewTypeVisibility", EnumMap.class);
        Field types = NativeIslandSceneContract.field(layout, "mViewTypes", EnumMap.class);
        Method visible = exact(layout, "isViewVisible", boolean.class, kind);
        Method current = exact(layout, "getCurrentVisibility", int.class, kind);
        Method show = exact(layout, "showView", void.class, kind);
        Method set = exact(layout, "setVisibility", void.class, int.class);
        refresh = exact(layout, "handleVisibilityChanged", void.class);
        update = NativeIslandSceneContract.method(layout, "updateVisibility", void.class);
        Method top = null;
        for (Class<?> c = layout; c != null && c != View.class; c = c.getSuperclass())
            for (Method method : c.getDeclaredMethods())
                if (method.getName().equals("resolveTopVisibleViewType") && method.getParameterCount() == 0
                        && !Modifier.isStatic(method.getModifiers())
                        && method.getReturnType().getName().equals("com.zte.feature.callnotify.CallLayoutViewType")) {
                    method.setAccessible(true); top = method;
                }
        if (visibility == null || types == null || top == null || set.getDeclaringClass() == View.class)
            throw new NoSuchMethodException("enum_capsule_renderer_contract");
        for (Object value : kind.getEnumConstants()) {
            String scene = NAMES.get(((Enum<?>)value).name());
            if (scene != null) scenes.put(value, scene);
        }
        if (scenes.isEmpty()) throw new NoSuchFieldException("enum_capsule_scene_names");
        ArrayList<Method> boundaries = new ArrayList<>(); boundaries.add(top);
        boundaries.add(exact(layout, "hasHigherPriorityViewVisible", boolean.class, kind));
        Method any = NativeIslandSceneContract.method(layout, "isAnyViewShouldVisible", boolean.class);
        if (any != null) boundaries.add(any);
        for(Method boundary:boundaries)if(!module.deoptimize(boundary))
            throw new NoSuchMethodException("enum_capsule_renderer_deopt:"+boundary.getName());
        module.registerFeatureHook(module.prepareFeatureHook(visible, "rm.ui.enum_capsule.visible", false).intercept(chain -> {
            track(chain.getThisObject());
            return suppress(chain.getArg(0)) ? false : chain.proceed();
        }));
        module.registerFeatureHook(module.prepareFeatureHook(show, "rm.ui.enum_capsule.show", false).intercept(chain -> {
            track(chain.getThisObject());
            return suppress(chain.getArg(0)) ? null : chain.proceed();
        }));
        module.registerFeatureHook(module.prepareFeatureHook(set, "rm.ui.enum_capsule.visibility", false).intercept(chain -> {
            Object owner = track(chain.getThisObject()); Object[] args = chain.getArgs().toArray();
            if (Integer.valueOf(View.VISIBLE).equals(args[0]) && suppressing() && !anotherVisible(owner)) args[0] = View.GONE;
            return chain.proceed(args);
        }));
        module.registerFeatureHook(module.prepareFeatureHook(current,"rm.ui.enum_capsule.render_read",false).intercept(chain->
                rendering.get()>0&&suppress(chain.getArg(0))?View.GONE:chain.proceed()));
        int count = 4;
        // Only reads made by the deoptimized renderers are filtered. The source EnumMap is
        // never mutated, including during exceptions, nested callbacks and producer updates.
        for (Method boundary : boundaries) {
            module.registerFeatureHook(module.prepareFeatureHook(boundary, "rm.ui.enum_capsule." + boundary.getName(), false).intercept(chain -> {
                Object owner = track(chain.getThisObject());
                if (!suppressing()) return chain.proceed();
                int depth = rendering.get(); rendering.set(depth + 1);
                try {
                    return chain.proceed();
                } finally {
                    if (depth == 0) rendering.remove(); else rendering.set(depth);
                }
            })); count++;
        }
        Method time = exact(layout, "getTimeCount", String.class, kind);
        module.registerFeatureHook(module.prepareFeatureHook(time, "rm.ui.enum_capsule.time", false).intercept(chain ->
                rendering.get() > 0 && suppress(chain.getArg(0)) ? null : chain.proceed())); count++;
        Method launcher = exact(layout, "updateViewVisibilityFromLauncher", void.class, kind);
        module.registerFeatureHook(module.prepareFeatureHook(launcher, "rm.ui.enum_capsule.launcher", false).intercept(chain -> {
            Object owner = track(chain.getThisObject());
            if (suppress(chain.getArg(0))) { refresh.invoke(owner); return null; }
            return chain.proceed();
        })); count++;
        ready = true;
        module.logFeatureInfo("NATIVE_SCENE_CAPSULE enum_renderer_ready scenes=" + scenes.values());
        return count;
    }

    boolean ready() { return ready; }
    boolean supportsScene(String scene) { return !NAMES.containsValue(scene) || ready && scenes.containsValue(scene); }
    private boolean suppress(Object kind) { String scene = scenes.get(kind); return ready && scene != null && owns.test(scene); }
    private boolean suppressing() { for (Object key : scenes.keySet()) if (suppress(key)) return true; return false; }
    private Object track(Object owner) { if (owner instanceof View) layouts.put(owner, Boolean.TRUE); return owner; }
    @SuppressWarnings("unchecked") private Map<Object,Object> values(Object owner) throws IllegalAccessException {
        return (Map<Object,Object>) visibility.get(owner);
    }
    private boolean anotherVisible(Object owner) throws IllegalAccessException {
        for (Map.Entry<Object,Object> entry : values(owner).entrySet())
            if (!suppress(entry.getKey()) && Integer.valueOf(View.VISIBLE).equals(entry.getValue())) return true;
        return false;
    }
    void refresh(Consumer<String> report) {
        ArrayList<Object> copy; synchronized (layouts) { copy = new ArrayList<>(layouts.keySet()); }
        for (Object owner : copy) if (((View)owner).isAttachedToWindow()) try {
            if (update != null) update.invoke(owner);
            refresh.invoke(owner);
        } catch (ReflectiveOperationException | RuntimeException missing) {
            report.accept("enum_capsule_restore_unavailable:" + missing.getClass().getSimpleName());
        }
    }
    private static Method exact(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method method = NativeIslandSceneContract.method(type, name, result, args);
        if (method == null || Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException(name);
        return method;
    }
}
