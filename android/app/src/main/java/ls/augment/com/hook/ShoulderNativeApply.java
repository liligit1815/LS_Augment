package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Rect;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/** Observe the real framework call before the OEM proxy can swallow its exception. */
final class ShoulderNativeApply {
    private static final ThreadLocal<Attempt> ACTIVE = new ThreadLocal<>();
    private static boolean installed;
    private static boolean ready;
    private static boolean stringLinks;

    static synchronized boolean install(AugmentModule module, ClassLoader loader) {
        if (installed) return ready;
        installed = true;
        try {
            Class<?> input = Class.forName("android.hardware.input.InputManager", false, loader);
            int required = 0;
            required += observe(module, input, "setTgkPoint", int[].class, int[].class, int.class) ? 1 : 0;
            required += observe(module, input, "setTgkMode", int.class, int.class) ? 1 : 0;
            required += observe(module, input, "setGameKeyEnable", boolean.class, Context.class) ? 1 : 0;
            required += observe(module, input, "setLeftTgkEnable", boolean.class) ? 1 : 0;
            required += observe(module, input, "setRightTgkEnable", boolean.class) ? 1 : 0;
            required += observeLink(module, input, "setGameLeftKeyLinkFunction") ? 1 : 0;
            required += observeLink(module, input, "setGameRightKeyLinkFunction") ? 1 : 0;
            required += observe(module, input, "releaseTgk") ? 1 : 0;
            observe(module, input, "setMiddleTgkEnable", boolean.class);
            observeLink(module, input, "setGameMiddleKeyLinkFunction");
            observe(module, input, "setTgkRapidFireCount", int.class, int.class);
            ready = required == 8;
            HookTelemetry.shoulderSwitch(ready ? "INFO" : "ERROR", "stage=INPUT_OBSERVER status="
                    + (ready ? "READY" : "MISSING") + " registered=" + required+" string_links="+stringLinks);
        } catch (Throwable error) {
            HookTelemetry.shoulderSwitch("ERROR", "stage=INPUT_OBSERVER status=FAILED errorClass="
                    + error.getClass().getSimpleName());
        }
        return ready;
    }

    private static boolean observeLink(AugmentModule module,Class<?> input,String name){
        boolean integer=observe(module,input,name,int.class),text=observe(module,input,name,String.class);
        stringLinks|=text;
        if(!integer&&!text)HookTelemetry.shoulderSwitch("ERROR","stage=INPUT_OBSERVER missing="+name+"(int|String)");
        return integer||text;
    }

    private static boolean observe(AugmentModule module, Class<?> input, String name, Class<?>... args) {
        try {
            Method method = null;
            for(Class<?> type=input;type!=null;type=type.getSuperclass())try{method=type.getDeclaredMethod(name,args);break;}
                catch(NoSuchMethodException absent){}
            if(method==null||method.getReturnType()!=void.class||java.lang.reflect.Modifier.isStatic(method.getModifiers()))return false;
            module.registerFeatureHook(module.prepareFeatureHook(method, "shoulder.input." + name, true)
                    .intercept(chain -> {
                        Attempt attempt = ACTIVE.get();
                        Object[] values = null;
                        if (attempt != null) {
                            try {
                                values = new Object[args.length];
                                for (int i = 0; i < values.length; i++) {
                                    Object value = chain.getArg(i);
                                    values[i] = value instanceof int[] ? ((int[]) value).clone() : value;
                                }
                            } catch (Throwable observationError) {
                                attempt.failed = "observation_unavailable";
                            }
                        }
                        try {
                            Object result = chain.proceed();
                            if (attempt != null) attempt.safeRecord(name, values, null);
                            return result;
                        } catch (Throwable error) {
                            if (attempt != null) attempt.safeRecord(name, values, error);
                            throw error;
                        }
                    }));
            return true;
        } catch (Throwable error) {
            return false;
        }
    }

    static Expected expected(Object data, boolean middle) throws ReflectiveOperationException {
        Expected out = new Expected();
        out.values.put("release", true);
        boolean main = Boolean.TRUE.equals(TargetReflection.field(data, "mainSw"));
        out.values.put("global", main);
        boolean[] switches = (boolean[]) TargetReflection.field(data, "optionSwArray");
        int[] modes = (int[]) TargetReflection.field(data, "optionArray");
        Rect[][] points = (Rect[][]) TargetReflection.field(data, "pointsArray");
        int[] rates = (int[]) TargetReflection.field(data, "rapidFireCountArray");
        int count = middle ? 3 : 2;
        int[] keys = {137, 138, 136};
        if (switches == null || switches.length < count || modes == null || modes.length < count)
            throw new IllegalArgumentException("invalid_shoulder_scheme");
        for (int i = 0; i < count; i++) {
            int key = keys[i];
            boolean enabled = main && switches[i];
            out.values.put("enable:" + key, enabled);
            out.values.put("link:" + key, enabled && modes[i] == 4 ? key : 0);
            if(stringLinks){
                String token="";
                if(enabled&&modes[i]==4){
                    Class<?> helper=Class.forName("cn.nubia.tgk.TgkHelper",false,data.getClass().getClassLoader());
                    Method make=helper.getDeclaredMethod("getTgkLinkKey",long.class,int.class,int.class);
                    if(make.getReturnType()!=String.class||!java.lang.reflect.Modifier.isStatic(make.getModifiers()))
                        throw new NoSuchMethodException("getTgkLinkKey(long,int,int):String");
                    token=(String)make.invoke(null,((Number)TargetReflection.field(data,"ID")).longValue(),
                            ((Number)TargetReflection.field(data,"state")).intValue(),key);
                    if(token==null||token.isEmpty())throw new IllegalStateException("native_link_token_missing");
                }
                out.links.put("link:"+key,token);
            }
            if (!main) continue;
            if (points == null || points.length <= i || points[i] == null || points[i].length < 2)
                throw new IllegalArgumentException("invalid_shoulder_points");
            int[] centers = new int[4];
            for (int j = 0; j < 2; j++) {
                Rect rect = points[i][j];
                centers[j * 2] = rect == null ? -1 : (rect.left + rect.right) / 2;
                centers[j * 2 + 1] = rect == null ? -1 : (rect.top + rect.bottom) / 2;
            }
            out.values.put("point:" + key, centers);
            if (enabled) {
                out.values.put("mode:" + key, modes[i]);
                if (modes[i] == 6) {
                    if (rates == null || rates.length <= i) throw new IllegalArgumentException("invalid_rate");
                    out.values.put("rate:" + key, rates[i]);
                }
            }
        }
        return out;
    }

    static Attempt begin(Expected expected, long sequence) {
        if (!ready) throw new IllegalStateException("input_observer_unavailable");
        Attempt result = new Attempt(expected, sequence, ACTIVE.get());
        ACTIVE.set(result);
        return result;
    }

    /** Called only by the validated rapid-fire route, before its framework call.
     * Keep coordinates/modes and delivery failures under the same strict observer. */
    static void rapidFireOverride(int keyCode, int original, int effective) {
        Attempt attempt = ACTIVE.get();
        if (attempt == null || original <= 0 || effective <= 0) return;
        String key = "rate:" + keyCode;
        if (!Integer.valueOf(original).equals(attempt.expected.values.get(key))) return;
        attempt.expected.values.put(key, effective);
        HookTelemetry.shoulderSwitch("INFO", "tx=" + attempt.sequence
                + " stage=RAPID_RATE_OVERRIDE key=" + keyCode + " native=" + original + " effective=" + effective);
    }

    static final class Expected {
        final Map<String, Object> values = new LinkedHashMap<>();
        final Map<String, String> links = new LinkedHashMap<>();
        String hash() { return digest(values); }
    }

    static final class Attempt implements AutoCloseable {
        final Expected expected;
        final long sequence;
        final Attempt previous;
        final Map<String, Object> delivered = new LinkedHashMap<>();
        String failed = "";
        int calls;

        Attempt(Expected expected, long sequence, Attempt previous) {
            this.expected = expected;
            this.sequence = sequence;
            this.previous = previous;
        }

        void safeRecord(String name, Object[] args, Throwable error) {
            try { record(name, args, error); }
            catch (Throwable ignored) { failed = "observation_unavailable"; }
        }

        void record(String name, Object[] args, Throwable error) {
            String key;
            Object value;
            if (name.equals("releaseTgk")) {
                key = "release"; value = true;
            } else if (name.equals("setTgkPoint")) {
                key = "point:" + args[2];
                int[] a = (int[]) args[0], b = (int[]) args[1];
                value = new int[]{a[0], a[1], b[0], b[1]};
            } else if (name.equals("setTgkMode")) {
                key = "mode:" + args[1]; value = args[0];
            } else if (name.equals("setTgkRapidFireCount")) {
                key = "rate:" + args[1]; value = args[0];
            } else if (name.equals("setGameKeyEnable")) {
                key = "global"; value = args[0];
            } else {
                int code = name.contains("Left") ? 137 : name.contains("Right") ? 138 : 136;
                key = (name.contains("LinkFunction") ? "link:" : "enable:") + code;
                value = args[0];
                // New firmware uses the full native table/case/key token, not
                // a decimal key code. Verify it before normalizing the receipt.
                if(value instanceof String&&value.equals(expected.links.get(key)))value=expected.values.get(key);
            }
            if (!expected.values.containsKey(key)) return;
            calls++;
            if (error != null) {
                failed = name + ":" + error.getClass().getSimpleName();
                HookTelemetry.shoulderSwitch("ERROR", "tx=" + sequence
                        + " stage=INPUT_THROW route=" + name + " errorClass=" + error.getClass().getSimpleName());
            } else {
                delivered.put(key, value);
            }
        }

        void verify() {
            if (!failed.isEmpty()) reject("input_failed:" + failed);
            for (Map.Entry<String, Object> entry : expected.values.entrySet()) {
                Object actual = delivered.get(entry.getKey());
                boolean match = entry.getValue() instanceof int[]
                        ? actual instanceof int[] && Arrays.equals((int[]) entry.getValue(), (int[]) actual)
                        : entry.getValue().equals(actual);
                if (!match) reject("input_missing_or_mismatched:" + entry.getKey());
            }
            HookTelemetry.shoulderSwitch("INFO", "tx=" + sequence + " stage=INPUT_DELIVERED status=CALLS_VERIFIED"
                    + " calls=" + calls + " expectedHash=" + expected.hash() + " observedHash=" + digest(delivered));
        }

        private void reject(String reason) {
            HookTelemetry.shoulderSwitch("ERROR", "tx=" + sequence + " stage=INPUT_REJECTED status=FAILED"
                    + " reason=" + reason + " calls=" + calls + " expectedHash=" + expected.hash()
                    + " observedHash=" + digest(delivered));
            throw new IllegalStateException(reason);
        }

        @Override public void close() { ACTIVE.set(previous); }
    }

    private static String digest(Map<String, Object> values) {
        try {
            StringBuilder text = new StringBuilder();
            for (Map.Entry<String, Object> entry : new java.util.TreeMap<>(values).entrySet())
                text.append(entry.getKey()).append('=').append(entry.getValue() instanceof int[]
                        ? Arrays.toString((int[]) entry.getValue()) : entry.getValue()).append(';');
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(text.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder();
            for (byte value : hash) result.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
            return result.toString();
        } catch (Exception error) { throw new IllegalStateException(error); }
    }

    private ShoulderNativeApply() { }
}
