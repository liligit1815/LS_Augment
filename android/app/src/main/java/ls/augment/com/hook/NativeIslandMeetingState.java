package ls.augment.com.hook;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Rechecks actual meeting state when asynchronous start/resume finishes after onPause. */
final class NativeIslandMeetingState {
    private final Field viewModel, toFloatingWindow, needsFloatingWindow;
    private final Method getManager, getState, getValue, isRecording;
    private final Class<?> stateType;
    private WeakReference<Object> fragment = new WeakReference<>(null);
    private WeakReference<Object> owner = new WeakReference<>(null);
    private boolean background, destroyed;

    static NativeIslandMeetingState install(AugmentModule module, ClassLoader loader, Runnable changed) {
        try { return new NativeIslandMeetingState(module, loader, changed); }
        catch (Throwable missing) {
            module.logFeatureError("NATIVE_MEETING_STATE_CONTRACT", missing);
            return null; // Existing producer visibility remains usable on older structures.
        }
    }

    private NativeIslandMeetingState(AugmentModule module, ClassLoader loader, Runnable changed) throws Exception {
        String pkg = "com.zte.nebulatranslation.";
        Class<?> screen = Class.forName(pkg + "ui.view.fragments.SimultaneousSubtitlesFragment", false, loader);
        Class<?> model = Class.forName(pkg + "ui.model.fragment.SimultaneousSubtitlesViewModel", false, loader);
        Class<?> manager = Class.forName(pkg + "ui.IslandManager", false, loader);
        Class<?> flow = Class.forName("kotlinx.coroutines.flow.StateFlow", false, loader);
        stateType = Class.forName(pkg + "ui.model.service.SimultaneousSubtitlesService$RecordUiState", false, loader);
        viewModel = requireField(screen, "viewModel", model);
        toFloatingWindow = requireField(screen, "toFloatingWindow", boolean.class);
        needsFloatingWindow = requireField(screen, "isNeedShow", boolean.class);
        getManager = require(screen, "getIslandMgr", manager);
        getState = require(model, "getRecordState", flow);
        getValue = require(flow, "getValue", Object.class);
        isRecording = require(stateType, "isRecording", boolean.class);
        Method resume = require(screen, "onResume", void.class);
        Method pause = require(screen, "onPause", void.class);
        Method destroy = require(screen, "onDestroy", void.class);
        for (Method lifecycle : new Method[]{resume, pause, destroy}) {
            module.registerFeatureHook(module.prepareFeatureHook(lifecycle,
                    "rm.translation.native_cards.meeting_" + lifecycle.getName(), false).intercept(chain -> {
                Object result = chain.proceed(chain.getArgs().toArray());
                Object instance = chain.getThisObject();
                try {
                    if (lifecycle == destroy) {
                        if (fragment.get() == instance) { destroyed = true; fragment.clear(); changed.run(); }
                    } else {
                        Object actualOwner = getManager.invoke(instance);
                        fragment = new WeakReference<>(instance); owner = new WeakReference<>(actualOwner);
                        destroyed = false; background = lifecycle == pause;
                        changed.run();
                    }
                } catch (Exception failure) { module.logFeatureError("NATIVE_MEETING_STATE_LIFECYCLE", failure); }
                return result;
            }));
        }
    }

    /** Null means this source/lifecycle has not been verified: use its original visibility. */
    Boolean visible(Object manager) throws Exception {
        if (owner.get() != manager) return null;
        Object screen = fragment.get();
        if (destroyed || screen == null || !background) return false;
        if (toFloatingWindow.getBoolean(screen) || needsFloatingWindow.getBoolean(screen)) return false;
        Object model = viewModel.get(screen);
        if (model == null) return null;
        Object state = getValue.invoke(getState.invoke(model));
        if (!stateType.isInstance(state)) return null;
        return Boolean.TRUE.equals(isRecording.invoke(state));
    }

    private static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method method = NativeIslandSceneContract.method(type, name, result, args);
        if (method == null) throw new NoSuchMethodException(type.getName() + "." + name);
        return method;
    }
    private static Field requireField(Class<?> type, String name, Class<?> value) throws NoSuchFieldException {
        Field field = NativeIslandSceneContract.field(type, name, value);
        if (field == null) throw new NoSuchFieldException(type.getName() + "." + name);
        return field;
    }
}
