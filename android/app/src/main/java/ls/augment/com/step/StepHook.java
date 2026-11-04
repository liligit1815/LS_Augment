package ls.augment.com.step;

import java.util.HashMap;

/** Mutable state belongs to one invocation, including nested calls on the same thread. */
abstract class StepHook {
    static abstract class Discovery extends StepHook { }

    protected void beforeHookedMethod(MethodHookParam call) throws Throwable { }
    protected void afterHookedMethod(MethodHookParam call) throws Throwable { }

    static final class MethodHookParam {
        final Object thisObject;
        final Object[] args;
        Object result;
        Throwable error;
        boolean handled;
        private HashMap<String, Object> extras;

        MethodHookParam(Object receiver, Object[] args) {
            this.thisObject = receiver;
            this.args = args;
        }
        Object getResult() { return result; }
        boolean hasThrowable() { return error != null; }
        void setResult(Object value) {
            handled = true;
            result = value;
            error = null;
        }
        void setObjectExtra(String key, Object value) {
            if (extras == null) extras = new HashMap<>();
            extras.put(key, value);
        }
        Object getObjectExtra(String key) { return extras == null ? null : extras.get(key); }
    }
}
