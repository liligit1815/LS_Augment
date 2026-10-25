package ls.augment.com;

import android.view.Display;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/** The creation and extraction paths require the same actual native display capabilities. */
public final class AtomicWorkbenchDisplayPolicy {
    private AtomicWorkbenchDisplayPolicy() { }
    private static int flag(String name) {
        try {
            Field field=Display.class.getDeclaredField(name);field.setAccessible(true);
            if(field.getType()!=int.class||!Modifier.isStatic(field.getModifiers()))throw new ReflectiveOperationException();
            int value=field.getInt(null);
            if(value<=0||(value&(value-1))!=0)throw new ReflectiveOperationException();
            return value;
        } catch(ReflectiveOperationException unavailable) {
            throw new IllegalStateException("native_display_policy_unavailable");
        }
    }
    public static int requiredFocusFlags() {
        int trusted=flag("FLAG_TRUSTED"),focus=flag("FLAG_OWN_FOCUS");
        if(trusted==focus)throw new IllegalStateException("native_display_policy_unavailable");
        return trusted|focus;
    }
    public static int forbiddenFlags() {
        int privateFlag=flag("FLAG_PRIVATE"),presentation=flag("FLAG_PRESENTATION");
        if(privateFlag==presentation||((privateFlag|presentation)&requiredFocusFlags())!=0)
            throw new IllegalStateException("native_display_policy_unavailable");
        return privateFlag|presentation;
    }
}
