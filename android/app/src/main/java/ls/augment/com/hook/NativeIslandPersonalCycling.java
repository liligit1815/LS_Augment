package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** The original return action uses a registered OEM tool; its presence is checked without executing it. */
final class NativeIslandPersonalCycling {
    private static final String TOOL = "one_step_return_bike";
    final Method capabilityChanged;
    private final Method state, tools, toolPackage, toolSdk;

    NativeIslandPersonalCycling(ClassLoader loader, Class<?> card, Class<?> iCard) throws Exception {
        state = exact(card, "getState", String.class);
        exact(card, "returnBikeSuccess", void.class);
        exact(card, "returnBikeFail", void.class);
        Class<?> action = Class.forName("com.zte.briefagent.event.scene.cycling.card.ReturnBikeCardAction", false, loader);
        action.getConstructor(iCard);
        exact(action, "execute", void.class);
        Class<?> handler = Class.forName("com.zte.briefagent.event.scene.cycling.card.DefaultReturnBikeActionHandler", false, loader);
        handler.getConstructor();
        exact(handler, "onActionHandle", boolean.class, iCard, String.class);
        Class<?> result = Class.forName("com.zte.briefagent.event.supplier.misc.OneStepTaskResult", false, loader);
        exact(result, "getFinalText", String.class);
        requireStatic(Class.forName("com.zte.briefagent.event.supplier.misc.MiscAgentTool", false, loader),
                "oneStepGeneralTask", result, Context.class, String.class);
        requireStatic(Class.forName("com.zte.briefagent.util.BikeAppLauncher", false, loader),
                "launchBikeApp", boolean.class, Context.class, String.class);
        Class<?> capability = Class.forName("com.zte.toolsdk.common.ToolsCapabilityHandler", false, loader);
        tools = requireStatic(capability, "getInstance", capability);
        toolPackage = exact(capability, "getToolPackage", String.class, String.class);
        toolSdk = exact(capability, "getToolSdkInfo", Class.forName("com.zte.toolsdk.entity.SdkInfo", false, loader), String.class);
        capabilityChanged = exact(capability, "parseToolsCapability", void.class, String.class);
    }

    String unavailable(Context context) {
        try {
            Object handler = tools.invoke(null);
            String pkg = (String) toolPackage.invoke(handler, TOOL);
            if (pkg == null || pkg.isEmpty() || toolSdk.invoke(handler, TOOL) == null) return "return_bike_tool_not_registered";
            ActivityInfo receiver = context.getPackageManager().getReceiverInfo(new ComponentName(pkg, "com.zte.toolsdk.producer.ToolsReceiver"), 0);
            if (!receiver.enabled || !receiver.exported || receiver.applicationInfo == null || !receiver.applicationInfo.enabled)
                return "return_bike_receiver_disabled:" + pkg;
            if (receiver.permission != null && !receiver.permission.isEmpty() && context.checkSelfPermission(receiver.permission) != android.content.pm.PackageManager.PERMISSION_GRANTED)
                return "return_bike_receiver_permission:" + receiver.permission;
            return "";
        } catch (Exception unavailable) { return "return_bike_tool_unavailable:" + unavailable; }
    }

    boolean validState(Object card) throws Exception {
        String value = (String) state.invoke(card);
        return "cycling".equals(value) || "returning".equals(value) || "finished".equals(value);
    }

    boolean actionAllowed(Context context, Object card, int viewId) throws Exception {
        // A previously delivered button must not submit a second return while the source is returning/finished.
        int button = context.getResources().getIdentifier("btn_return_bike", "id", "com.zte.personalagent");
        return button != 0 && (viewId != button || "cycling".equals(state.invoke(card)));
    }

    private static Method exact(Class<?> owner, String name, Class<?> result, Class<?>... args) throws Exception {
        Method method = NativeIslandPersonalScene.exact(owner, name, result, args);
        if (Modifier.isStatic(method.getModifiers()))
            throw new NoSuchMethodException(owner.getName() + "." + name + " instance");
        return method;
    }
    private static Method requireStatic(Class<?> owner, String name, Class<?> result, Class<?>... args) throws Exception {
        Method method = NativeIslandPersonalScene.exact(owner, name, result, args);
        if (!Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException(owner.getName() + "." + name + " static");
        return method;
    }
}
