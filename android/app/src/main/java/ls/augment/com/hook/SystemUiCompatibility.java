package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Select only the two inspected controller contracts; class names alone are insufficient. */
final class SystemUiCompatibility {
    private static final String WINDOW = "com.android.systemui.statusbar.window.StatusBarWindowController";
    private static final String PRIVACY = "com.android.systemui.statusbar.events.PrivacyDotViewController";
    private SystemUiCompatibility() { }

    static Class<?> windowController(ClassLoader loader) throws ClassNotFoundException {
        for (String name : new String[]{WINDOW + "Impl", WINDOW}) try {
            Class<?> type = Class.forName(name, false, loader);
            if (windowContract(type)) return type;
        } catch (ClassNotFoundException | LinkageError ignored) { }
        throw new ClassNotFoundException("No verified status-bar window controller contract");
    }

    static Class<?> privacyController(ClassLoader loader) throws ClassNotFoundException {
        for (String name : new String[]{PRIVACY + "Impl", PRIVACY}) try {
            Class<?> type = Class.forName(name, false, loader);
            if (has(type, "initialize", "void", "android.view.View", "android.view.View", "android.view.View", "android.view.View")
                    && has(type, "showDotView", "void", "android.view.View", "boolean")
                    && has(type, "hideDotView", "void", "android.view.View", "boolean")) return type;
        } catch (ClassNotFoundException | LinkageError ignored) { }
        throw new ClassNotFoundException("No verified privacy-dot controller contract");
    }

    static boolean windowContract(Class<?> type) {
        try {
            return !Modifier.isAbstract(type.getModifiers())
                    && type.getDeclaredField("mContext").getType().getName().equals("android.content.Context")
                    && type.getDeclaredField("mBarHeight").getType() == int.class
                    && type.getDeclaredField("mLpChanged").getType().getName().equals("android.view.WindowManager$LayoutParams")
                    && has(type, "attach", "void") && has(type, "refreshStatusBarHeight", "void")
                    && has(type, "getStatusBarHeight", "int")
                    && has(type, "getBarLayoutParamsForRotation", "android.view.WindowManager$LayoutParams", "int")
                    && has(type, "applyHeight", "void", type.getName() + "$State");
        } catch (ReflectiveOperationException | LinkageError unavailable) { return false; }
    }

    static boolean windowSizing(Method method) {
        return matches(method, "refreshStatusBarHeight", "void")
                || matches(method, "getBarLayoutParamsForRotation", "android.view.WindowManager$LayoutParams", "int")
                || matches(method, "applyHeight", "void", method.getDeclaringClass().getName() + "$State");
    }

    static boolean privacyMethod(Method method) {
        return matches(method, "initialize", "void", "android.view.View", "android.view.View", "android.view.View", "android.view.View")
                || matches(method, "showDotView", "void", "android.view.View", "boolean")
                || matches(method, "hideDotView", "void", "android.view.View", "boolean")
                || matches(method, "updateDesignatedCorner", "void", "android.view.View", "boolean")
                || matches(method, "updateDotView", "void", "com.android.systemui.statusbar.events.ViewState");
    }

    static boolean has(Class<?> type, String name, String result, String... params) {
        for (Method method : type.getDeclaredMethods()) if (matches(method, name, result, params)) return true;
        return false;
    }

    private static boolean matches(Method method, String name, String result, String... params) {
        if (!method.getName().equals(name) || !method.getReturnType().getName().equals(result)
                || method.isSynthetic() || Modifier.isStatic(method.getModifiers())
                || Modifier.isAbstract(method.getModifiers()) || method.getParameterCount() != params.length) return false;
        Class<?>[] actual = method.getParameterTypes();
        for (int i = 0; i < params.length; i++) if (!actual[i].getName().equals(params[i])) return false;
        return true;
    }
}
