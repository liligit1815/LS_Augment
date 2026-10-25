package ls.augment.com.hook;

import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Message;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Completes the OEM dialog's missing dismissal notification through its original manager. */
final class PowerMenuLifecycleHook {
    private static boolean installed;
    private static final String STATE = "ls_augment_power_menu_lifecycle";

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Class<?> dialogType = Class.forName(
                    "com.zte.feature.globalaction.MfvGlobalActionsDialog$MFVActionsDialog", false, loader);
            if (!Dialog.class.isAssignableFrom(dialogType)) throw new NoSuchMethodException("OEM dialog");
            Field owner = field(dialogType, "this$0");
            CurrentDialog current = new CurrentDialog(owner.getType());
            Field manager = field(owner.getType(), "mWindowManagerFuncs");
            Field dismissMessage = field(Dialog.class, "mDismissMessage");
            if (dismissMessage.getType() != Message.class)
                throw new NoSuchFieldException("OEM dismissal contract");
            Method hidden = manager.getType().getMethod("onGlobalActionsHidden");
            if (hidden.getReturnType() != void.class || java.lang.reflect.Modifier.isStatic(hidden.getModifiers()))
                throw new NoSuchMethodException("onGlobalActionsHidden must return void");
            hidden.setAccessible(true);
            Method start = dialogType.getDeclaredMethod("onStart");
            module.registerFeatureHook(module.prepareFeatureHook(start, "power.lifecycle.dismiss", false)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        try {
                            Dialog dialog = (Dialog) chain.getThisObject();
                            Message existing = (Message) dismissMessage.get(dialog);
                            // Never replace an OEM/application listener. Our own previous listener
                            // may remain when a Dialog is shown again, so give each show a new token.
                            if (existing != null && !(existing.obj instanceof HiddenListener)) {
                                record(dialog, "native_listener_preserved");
                            } else {
                                Object controller = owner.get(dialog);
                                Object target = manager.get(controller);
                                if (target != null) {
                                    dialog.setOnDismissListener(new HiddenListener(module, dialog,
                                            controller, target, current, dismissMessage, hidden));
                                    record(dialog, "missing_listener_bound");
                                }
                            }
                        } catch (Throwable error) {
                            module.logFeatureError("POWER_MENU_LIFECYCLE_BIND", error);
                        }
                        return result;
                    }));
            installed = true;
            // Optional caller deoptimization must not cause duplicate hook registration.
            try {
                for (Method method : Dialog.class.getDeclaredMethods())
                    if (method.getName().equals("show") || method.getName().equals("dispatchOnStart"))
                        module.deoptimize(method);
            } catch (Throwable error) {
                module.logFeatureError("POWER_MENU_LIFECYCLE_DEOPTIMIZE", error);
            }
        } catch (Throwable error) {
            module.logFeatureError("POWER_MENU_LIFECYCLE_UNAVAILABLE", error);
        }
    }

    private static final class HiddenListener implements DialogInterface.OnDismissListener {
        private final AugmentModule module;
        private final Dialog dialog;
        private final Object owner, manager;
        private final CurrentDialog current;
        private final Field dismissMessage;
        private final Method hidden;
        private boolean delivered;

        HiddenListener(AugmentModule module, Dialog dialog, Object owner, Object manager,
                       CurrentDialog current, Field dismissMessage, Method hidden) {
            this.module = module; this.dialog = dialog; this.owner = owner; this.manager = manager;
            this.current = current; this.dismissMessage = dismissMessage; this.hidden = hidden;
        }

        @Override public void onDismiss(DialogInterface dismissed) {
            if (delivered || dismissed != dialog) return;
            delivered = true;
            try {
                Message listener = (Message) dismissMessage.get(dialog);
                Object active = current.get(owner);
                // A queued old dismissal must not hide a replacement or a re-shown dialog.
                if (dialog.isShowing() || (active != null && active != dialog)
                        || listener == null || listener.obj != this) {
                    record(dialog, "stale_dismiss_ignored");
                    return;
                }
                hidden.invoke(manager);
                record(dialog, "hidden_notified");
            } catch (Throwable error) {
                module.logFeatureError("POWER_MENU_LIFECYCLE_NOTIFY", error);
                record(dialog, "hidden_notify_failed");
            }
        }
    }

    /** New OEM controllers move the current dialog into a replaceable delegate. */
    private static final class CurrentDialog {
        final Field delegate, dialog;
        CurrentDialog(Class<?> controller) throws NoSuchFieldException {
            Field direct;
            try { direct = field(controller, "mDialog"); }
            catch (NoSuchFieldException absent) { direct = null; }
            if (direct != null) {
                delegate = null; dialog = direct;
            } else {
                delegate = field(controller, "mDelegate");
                dialog = field(delegate.getType(), "mCurrentDialog");
            }
            if (!Dialog.class.isAssignableFrom(dialog.getType()) || java.lang.reflect.Modifier.isStatic(dialog.getModifiers())
                    || (delegate != null && java.lang.reflect.Modifier.isStatic(delegate.getModifiers())))
                throw new NoSuchFieldException("Current global-actions dialog is not a Dialog");
        }
        Object get(Object controller) throws IllegalAccessException {
            Object target = delegate == null ? controller : delegate.get(controller);
            return target == null ? null : dialog.get(target);
        }
    }

    private static Field field(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> cursor = type; cursor != null; cursor = cursor.getSuperclass()) {
            try { Field result = cursor.getDeclaredField(name); result.setAccessible(true); return result; }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }

    private static void record(Dialog dialog, String state) {
        try { FeatureSettings.diagnostic(dialog.getContext(), STATE, state); }
        catch (Throwable ignored) { }
    }
}
