package ls.augment.com.hook;

import android.content.Context;
import android.view.Gravity;
import android.view.WindowManager;
import java.lang.reflect.Method;
import ls.augment.com.SystemUiOptions;
import ls.augment.com.VolumePositionSettings;

/** Positions only the verified OEM multi-app volume window at its framework boundary. */
final class MultiAppVolumePositionHook {
    @android.annotation.SuppressLint({"WrongConstant", "RtlHardcoded"}) // Clear relative flags before assigning the selected physical side.
    static int install(AugmentModule module, ClassLoader loader) {
        int count = 0;
        try {
            Class<?> service = Class.forName("com.android.server.wm.WindowManagerService", false, loader);
            java.lang.reflect.Field contextField = HookCompatibility.field(service, Context.class, false, "mContext");
            for (Method method : service.getDeclaredMethods()) {
                if ((!method.getName().equals("addWindow") && !method.getName().equals("relayoutWindow"))
                        || method.getReturnType() != int.class) continue;
                Class<?>[] types = method.getParameterTypes(); int parameter = -1; boolean client = false, session = false;
                for (int i = 0; i < types.length; i++) {
                    if (types[i] == WindowManager.LayoutParams.class) parameter = parameter == -1 ? i : -2;
                    if (types[i].getName().equals("android.view.IWindow")) client = true;
                    if (types[i].getName().equals("com.android.server.wm.Session")) session = true;
                }
                if (parameter < 0 || !client || !session) continue;
                final int index = parameter;
                module.registerFeatureHook(module.prepareFeatureHook(method, "volume.position.expanded", true).intercept(chain -> {
                    Object[] changed = null;
                    try {
                        Object raw = chain.getArg(index);
                        if (raw instanceof WindowManager.LayoutParams) {
                            WindowManager.LayoutParams source = (WindowManager.LayoutParams)raw;
                            if (source.type == 2020 && "com.zte.zsound".equals(source.packageName)
                                    && "MultiAppVolumesWindow".contentEquals(source.getTitle())) {
                                Context context = (Context)contextField.get(chain.getThisObject());
                                if (FeatureSettings.enabled(context, SystemUiOptions.VOLUME_SAME_SIDE)
                                        && VolumePositionSettings.multiAppEnabled(context)) {
                                    WindowManager.LayoutParams copy = new WindowManager.LayoutParams(); copy.copyFrom(source);
                                    boolean left = "0".equals(FeatureSettings.snapshot(context).get(SystemUiOptions.VOLUME_POSITION));
                                    copy.gravity = (copy.gravity & ~(Gravity.HORIZONTAL_GRAVITY_MASK | Gravity.RELATIVE_LAYOUT_DIRECTION))
                                            | (left ? Gravity.LEFT : Gravity.RIGHT);
                                    changed = chain.getArgs().toArray(); changed[index] = copy;
                                }
                            }
                        }
                    } catch (ReflectiveOperationException | RuntimeException error) {
                        module.logFeatureError("VOLUME_POSITION_EXPANDED", error);
                    }
                    return changed == null ? chain.proceed() : chain.proceed(changed);
                }));
                module.deoptimize(method); count++;
            }
            if (count == 0) throw new NoSuchMethodException("addWindow/relayoutWindow with Session, IWindow, LayoutParams");
        } catch (ReflectiveOperationException | LinkageError error) { module.logFeatureError("VOLUME_POSITION_EXPANDED_CAPABILITY", error); }
        return count;
    }
    private MultiAppVolumePositionHook() { }
}
