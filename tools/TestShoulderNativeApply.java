package ls.augment.com.hook;

import android.content.Context;
import cn.nubia.tgk.TgkHelper;
import cn.nubia.tgk.data.TgkData;
import cn.nubia.tgk.data.TgkGameInfo;
import cn.nubia.tgk.proxy.InputManagerProxy;

/** Run by test-shoulder-quick-switch-runtime.py with exact-shape JVM facades. */
public final class TestShoulderNativeApply {
    private static int checks;
    private static void check(boolean ok, String why) {
        checks++;
        if (!ok) throw new AssertionError(why);
    }
    private interface Step { void run() throws Exception; }
    private static void fails(Step step, String needle) throws Exception {
        try {
            step.run();
            throw new AssertionError("expected " + needle);
        } catch (IllegalStateException expected) {
            check(expected.getMessage().contains(needle), "failure reports " + needle + ": " + expected);
        }
    }
    private static void apply(InputManagerProxy proxy, TgkData data) throws Exception {
        try (ShoulderNativeApply.Attempt attempt = ShoulderNativeApply.begin(
                ShoulderNativeApply.expected(data, true), data.ID)) {
            proxy.releaseTgk();
            TgkHelper.setTgkParaToNative(proxy, data, new TgkGameInfo(), 1);
            attempt.verify();
        }
    }

    public static void main(String[] args) throws Exception {
        Context context = new Context();
        FeatureSettings.current = context;
        InputManagerProxy proxy = new InputManagerProxy(context);
        TgkData a = new TgkData(11, "A", 100, 2), b = new TgkData(29, "B", 300, 4);
        a.state |= 1;
        context.resolver.put(0, a);
        context.resolver.put(0, b);
        fails(() -> ShoulderNativeApply.begin(ShoulderNativeApply.expected(a, true), 1), "unavailable");
        AugmentModule module = new AugmentModule();
        check(ShoulderNativeApply.install(module, TestShoulderNativeApply.class.getClassLoader()),
                "all required framework setters available");
        check(module.hooks.size() == 11, "release/points/modes/global/left/right/link/middle/rate observers");
        String originalHash = ShoulderNativeApply.expected(a, true).hash();
        apply(proxy, a);
        check(proxy.points.get(137)[0] == 105 && proxy.points.get(138)[0] == 205
                && proxy.modes.get(137) == 2, "ordinary target coordinates and mode delivered");
        proxy.mutatePointArguments = true;
        apply(proxy, a);
        check(proxy.points.get(137)[0] == 105,
                "observer snapshots coordinate arguments before the framework mutates them");
        proxy.mutatePointArguments = false;
        AugmentModule.failReadRoute = "setTgkPoint";
        int pointCallsBefore = proxy.pointCalls;
        fails(() -> apply(proxy, a), "observation_unavailable");
        check(proxy.pointCalls == pointCallsBefore + 3,
                "sampling exception preserves exactly one original call for each shoulder setter");
        AugmentModule.failReadRoute = "";
        a.pointsArray[0][0].left += 8;
        check(!ShoulderNativeApply.expected(a, true).hash().equals(originalHash),
                "coordinates included in expected fingerprint");
        a.pointsArray[0][0].left -= 8;
        a.optionArray[0] = 6;
        a.rapidFireCountArray[0] = 9;
        apply(proxy, a);
        check(proxy.modes.get(137) == 6, "rapid mode complete expected setter path");
        a.optionArray[0] = 2;

        // A downstream macro binding reads committed selection in this boundary model.
        // This validates save-before-bind ordering, not GameAssist device behavior.
        context.resolver.database.get("0:11").state &= ~1;
        context.resolver.database.get("0:29").state |= 1;
        apply(proxy, b);
        check(proxy.macroCaseId == 29 && proxy.modes.get(137) == 4,
                "macro receives selected persisted scheme");
        proxy.failPoints = true;
        fails(() -> apply(proxy, a), "input_failed:setTgkPoint");
        proxy.failPoints = false;
        check(android.util.Log.messages.stream().anyMatch(s -> s.contains("setTgkPoint failed")),
                "OEM proxy swallowed lower-level point error as inspected");
        proxy.failMode = true;
        fails(() -> apply(proxy, a), "input_failed:setTgkMode");
        proxy.failMode = false;
        apply(proxy, a);
        check(HookTelemetry.events.stream().anyMatch(s -> s.contains("stage=INPUT_THROW")
                && s.contains("setTgkMode")), "framework failure appears in shared diagnostics");

        try (ShoulderNativeApply.Attempt attempt = ShoulderNativeApply.begin(
                ShoulderNativeApply.expected(a, true), 6)) {
            proxy.setGameKeyEnable(true);
            fails(attempt::verify, "missing_or_mismatched");
        }
        try (ShoulderNativeApply.Attempt attempt = ShoulderNativeApply.begin(
                ShoulderNativeApply.expected(a, true), 7)) {
            TgkData wrong = a.copy();
            wrong.pointsArray[0][0].left += 20;
            proxy.releaseTgk();
            TgkHelper.setTgkParaToNative(proxy, wrong, new TgkGameInfo(), 1);
            fails(attempt::verify, "point:137");
        }
        try (ShoulderNativeApply.Attempt outer = ShoulderNativeApply.begin(
                ShoulderNativeApply.expected(a, true), 8)) {
            try (ShoulderNativeApply.Attempt inner = ShoulderNativeApply.begin(
                    ShoulderNativeApply.expected(b, true), 9)) {
                proxy.releaseTgk();
                TgkHelper.setTgkParaToNative(proxy, b, new TgkGameInfo(), 1);
                inner.verify();
            }
            proxy.releaseTgk();
            TgkHelper.setTgkParaToNative(proxy, a, new TgkGameInfo(), 1);
            outer.verify();
            check(true, "nested attempt restores outer thread scope");
        }
        try (ShoulderNativeApply.Attempt attempt = ShoulderNativeApply.begin(
                ShoulderNativeApply.expected(a, true), 10)) {
            Thread worker = new Thread(() -> TgkHelper.setTgkParaToNative(proxy, a, new TgkGameInfo(), 1));
            worker.start();
            worker.join();
            fails(attempt::verify, "missing_or_mismatched");
        }
        TgkData off = a.copy();
        off.mainSw = false;
        apply(proxy, off);
        check(true, "disabled scheme verifies switches without coordinate setters");
        TgkData invalid = a.copy();
        invalid.optionSwArray = null;
        try {
            ShoulderNativeApply.expected(invalid, false);
            throw new AssertionError("malformed scheme accepted");
        } catch (IllegalArgumentException expected) {
            check(true, "invalid array closes admission");
        }
        try {
            ShoulderNativeApply.expected(new Object(), false);
            throw new AssertionError("unknown schema accepted");
        } catch (ReflectiveOperationException expected) {
            check(true, "unknown data fields fail closed");
        }
        check(HookTelemetry.events.stream().filter(s -> s.contains("CALLS_VERIFIED")).count() >= 5,
                "only matched calls emit verified result");
        System.out.println("PASS production shoulder framework apply monitor: " + checks
                + " checks (API call verification; not physical touch proof)");
    }
}
