package ls.augment.com.hook;

import android.content.Context;
import cn.nubia.tgk.TgkHelper;
import cn.nubia.tgk.data.TgkData;
import cn.nubia.tgk.data.TgkGameInfo;
import cn.nubia.tgk.proxy.InputManagerProxy;

/** Fresh-VM admission test when one actual framework hook cannot be registered. */
public final class TestShoulderNativeMissing {
    public static void main(String[] args) throws Exception {
        boolean required = args.length == 0 || args[0].equals("required");
        AugmentModule.failRoute = required ? "setTgkPoint" : "setMiddleTgkEnable";
        Context context = new Context();
        FeatureSettings.current = context;
        AugmentModule module = new AugmentModule();
        boolean ready = ShoulderNativeApply.install(module, TestShoulderNativeMissing.class.getClassLoader());
        if (ready == required) throw new AssertionError("incorrect observer readiness");
        TgkData data = new TgkData(11, "A", 100, 0);
        if (required) {
            try {
                ShoulderNativeApply.begin(ShoulderNativeApply.expected(data, false), 1);
                throw new AssertionError("required observer missing but scheme admitted");
            } catch (IllegalStateException expected) {
                if (!expected.getMessage().contains("unavailable")) throw expected;
            }
        } else {
            // Middle is optional for devices without that shoulder. Once the caller
            // declares a middle shoulder, missing delivery must still fail verification.
            try (ShoulderNativeApply.Attempt attempt = ShoulderNativeApply.begin(
                    ShoulderNativeApply.expected(data, true), 2)) {
                InputManagerProxy proxy = new InputManagerProxy(context);
                proxy.releaseTgk();
                TgkHelper.setTgkParaToNative(proxy, data, new TgkGameInfo(), 1);
                try {
                    attempt.verify();
                    throw new AssertionError("expected middle setter missing but apply verified");
                } catch (IllegalStateException expected) {
                    if (!expected.getMessage().contains("enable:136")) throw expected;
                }
            }
        }
        System.out.println("PASS shoulder observer fail-closed: missing " + (required ? "required" : "expected middle") + " route");
    }
}
