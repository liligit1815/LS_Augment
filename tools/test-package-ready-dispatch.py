"""Run the production PackageReady dispatcher across shared-process callbacks.

Only Android/libxposed and feature installers are replaced with witnesses. The
actual onPackageReady body and scope registry are compiled unchanged. No device,
Provider, Gradle or application data is accessed.
"""
from pathlib import Path
import re
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/AugmentModule.java'
REGISTRY = ROOT / 'android/app/src/main/java/ls/augment/com/HookTargetRegistry.java'


def source_block(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


HARNESS = r'''package ls.augment.com.hook;
import java.util.*;
import ls.augment.com.HookTargetRegistry;

public class TestPackageReadyDispatch {
    // PRODUCTION_CONSTANTS
    String processName = "";
    String readyPackageName = "";
    boolean systemServerProcess, systemPackageReadySeen, packageReady, detached;
    final List<String> calls = new ArrayList<>(), logs = new ArrayList<>();
    static final List<String> telemetry = new ArrayList<>();
    static final ClassLoader TARGET_LOADER = new ClassLoader() {};
    static final ClassLoader PROVIDER_LOADER = new ClassLoader() {};
    static int assertions;

    static final class HookTelemetry { static void ready(String name) { telemetry.add(name); } }
    static final class Context { String getPackageName() { return "com.android.settings"; } }
    static final class PackageReadyParam {
        final String name;
        final boolean first, mayReadLoader;
        final ClassLoader loader;
        PackageReadyParam(String name, boolean first, boolean mayReadLoader, ClassLoader loader) {
            this.name = name; this.first = first; this.mayReadLoader = mayReadLoader; this.loader = loader;
        }
        String getPackageName() { return name; }
        boolean isFirstPackage() { return first; }
        ClassLoader getClassLoader() {
            check(mayReadLoader, "non-target callback accessed its class loader: " + name);
            return loader;
        }
    }
    static void check(boolean ok, String message) { assertions++; if (!ok) throw new AssertionError(message); }
    static PackageReadyParam target(String name) { return new PackageReadyParam(name, false, true, TARGET_LOADER); }
    static PackageReadyParam ignored(String name) { return new PackageReadyParam(name, true, false, null); }
    static void deliver(TestPackageReadyDispatch module, PackageReadyParam callback) {
        // Framework-level detach prevents all later deliveries to the module.
        if (!module.detached) module.onPackageReady(callback);
    }
    static TestPackageReadyDispatch module(String process) {
        telemetry.clear(); TestPackageReadyDispatch module = new TestPackageReadyDispatch();
        module.processName = process; return module;
    }
    void detach() { detached = true; }
    void logInfo(String value) { logs.add(value); }
    void writePackageReadyWitness(String name) { calls.add("provider-witness:" + name); }
    void installSystemServerHooks(ClassLoader loader, String source) {
        check(systemServerProcess, "server hook without lifecycle authorization");
        check(loader == PROVIDER_LOADER, "server callback loader/source was changed");
        calls.add("server:" + source);
    }
    void feature(String name, ClassLoader loader) {
        check(loader == TARGET_LOADER, "app hooks used a resource/provider loader"); calls.add(name);
    }
    void installAiTriggerHooks(ClassLoader loader, String name) { feature("ai:" + name, loader); }
    void installGameSpaceShoulderHooks(ClassLoader loader) { feature("game-space", loader); }
    void installTgkRapidFireHooks(ClassLoader loader) { feature("rapid-fire", loader); }
    void installGameHelperShoulderHooks(ClassLoader loader) { feature("helper-shoulder", loader); }
    void installGameHelperComboSpeedHooks(ClassLoader loader) { feature("helper-combo", loader); }
    void installGameHelperPreviewSpeedHooks(ClassLoader loader) { feature("helper-preview", loader); }
    void installGameHelperLineHooks(ClassLoader loader) { feature("helper-line", loader); }
    void installGameAssistShoulderHooks(ClassLoader loader) { feature("assist-shoulder", loader); }
    void installSuperMirrorHooks(ClassLoader loader) { feature("super-mirror", loader); }
    void installFreeformIconHooks(ClassLoader loader) { feature("freeform", loader); }
    void installFanControlHooks(ClassLoader loader) { feature("fan", loader); }
    void installSystemUiFeatureHooks(ClassLoader loader) { feature("systemui", loader); }
    void installDoubleAppFeatureHooks(ClassLoader loader) { feature("doubleapp", loader); }
    void installBeautifyFeatureHooks(ClassLoader loader) { feature("beautify", loader); }
    void installBeautifyAdapterFeatureHooks(ClassLoader loader) { feature("beautify-adapter", loader); }
    void installSettingsHooks(ClassLoader loader) { feature("settings", loader); }
    Context currentApplicationContext() { return null; }
    void persistProbeSnapshot(Context context) { calls.add("settings-probe"); }
    void installApplicationWitness() { calls.add("settings-witness"); }
    // FEATURE_STUBS
    // PRODUCTION_METHODS

    public static void main(String[] args) {
        TestPackageReadyDispatch launcher = module("com.zte.mifavor.launcher");
        deliver(launcher, ignored("com.zte.mifavor.launcher.resource"));
        check(!launcher.detached, "resource-first callback detached the entire launcher module");
        check(launcher.calls.isEmpty() && telemetry.isEmpty() && launcher.readyPackageName.isEmpty(),
                "resource callback installed hooks, called Provider or changed accepted package identity");
        deliver(launcher, target("com.zte.mifavor.launcher"));
        check(launcher.calls.contains("LauncherCustomizationHook"), "later launcher callback was lost");
        check(launcher.calls.contains("LauncherPagesHook")
                && launcher.calls.contains("LauncherRecentsMemoryHook"),
                "launcher page and memory features were not installed in the launcher scope");
        check(launcher.logs.stream().anyMatch(s -> s.contains("PACKAGE_READY_TARGET") && s.contains("first=false")),
                "accepted later main-package callback has no explicit diagnostic witness");
        int callCount = launcher.calls.size(), telemetryCount = telemetry.size();
        deliver(launcher, ignored("com.zte.mifavor.launcher.resource"));
        check(!launcher.detached && launcher.calls.size() == callCount, "late resource callback changed existing hooks");
        check(telemetry.size() == telemetryCount && "com.zte.mifavor.launcher".equals(launcher.readyPackageName),
                "late resource callback replaced the accepted package identity");

        // Real package identity, not a process-name match, decides app dispatch.
        for (String process : List.of("cn.nubia.tgk", "cn.nubia.gamelauncher:tgk", "cn.nubia.gameassist")) {
            TestPackageReadyDispatch tgk = module(process);
            deliver(tgk, ignored("cn.nubia.tgk"));
            check(tgk.calls.isEmpty() && !tgk.detached, "alias alone authorized hooks or killed pending delivery");
            deliver(tgk, target("cn.nubia.gamelauncher"));
            check(tgk.calls.contains("game-space") && tgk.calls.contains("rapid-fire")
                    && tgk.calls.contains("ShoulderQuickSwitchHook"), "TGK alias process lost canonical game hooks");
            check(!tgk.calls.contains("systemui"), "unrelated feature installed in alias process");
        }

        TestPackageReadyDispatch server = module("system_server"); server.systemServerProcess = true;
        for (String pkg : List.of("com.android.providers.settings", "android", "system")) {
            deliver(server, new PackageReadyParam(pkg, false, true, PROVIDER_LOADER));
            check(server.systemPackageReadySeen && "system".equals(server.readyPackageName),
                    "hosted provider replaced server identity");
            check("system".equals(telemetry.get(telemetry.size() - 1)), "server telemetry escaped its system identity");
            check(server.calls.contains("server:package_ready:" + pkg), "provider lifecycle retry/source was lost");
        }
        check(server.calls.size() == 3 && !server.detached, "system provider callback ran app hooks or detached");

        TestPackageReadyDispatch ordinary = module("com.android.providers.settings");
        for (String pkg : Arrays.asList("system", "android", "com.android.providers.settings",
                "com.zte.mifavor.launcher.resource", "untrusted.example", "", null)) {
            deliver(ordinary, ignored(pkg));
        }
        check(ordinary.calls.isEmpty() && telemetry.isEmpty() && !ordinary.systemPackageReadySeen,
                "ordinary callback gained Provider access or system-server hooks");
        check(!ordinary.detached, "unrelated callback must not destroy a module that may receive a target later");

        TestPackageReadyDispatch ui = module("com.android.systemui");
        deliver(ui, ignored("android")); deliver(ui, target("com.android.systemui"));
        check(ui.calls.contains("systemui"), "framework resource event killed SystemUI dispatch");
        TestPackageReadyDispatch settings = module("com.android.settings");
        deliver(settings, target("com.android.settings"));
        check(settings.packageReady && settings.calls.contains("settings") && settings.calls.contains("settings-witness"),
                "Settings-specific hooks or application witness regressed");

        for (String pkg : HookTargetRegistry.packages()) {
            if ("system".equals(pkg)) continue;
            TestPackageReadyDispatch scoped = module("arbitrary-oem-process-alias");
            deliver(scoped, target(pkg));
            check(scoped.calls.contains("provider-witness:" + pkg), "registered target lost witness: " + pkg);
            check(scoped.calls.contains("OemAppExtrasHook:" + pkg), "registered app was not dispatched: " + pkg);
            check(!scoped.systemPackageReadySeen, "registered app entered server branch: " + pkg);
        }
        System.out.println("PackageReady dispatch regression: " + assertions + " assertions passed");
    }
}
'''


def main():
    source = SOURCE.read_text(encoding='utf-8')
    constants = '\n'.join(re.findall(r'private static final String \w+\s*=\s*"[^"\n]*";', source))
    methods = '\n'.join(source_block(source, marker) for marker in (
        'public void onPackageReady(',
        'private static boolean isSystemServerPackage(',
        'private static String safePackageName(',
        'private static String safeDiagnostic(',
    ))
    stubs = []
    for name in ('OemAppExtrasHook', 'ConnectionExtrasHook', 'GameExtrasHook'):
        stubs.append(f'static final class {name} {{ static void install(TestPackageReadyDispatch m, ClassLoader l, String p) {{ m.feature("{name}:" + p, l); }} }}')
    for name in ('StoreDownloadHook', 'ShoulderQuickSwitchHook', 'MiHealthHook', 'LauncherCustomizationHook',
                 'LauncherPagesHook', 'LauncherRecentsMemoryHook'):
        stubs.append(f'static final class {name} {{ static void install(TestPackageReadyDispatch m, ClassLoader l) {{ m.feature("{name}", l); }} }}')
    java = HARNESS.replace('// PRODUCTION_CONSTANTS', constants).replace('// PRODUCTION_METHODS', methods)
    java = java.replace('// FEATURE_STUBS', '\n'.join(stubs))
    with tempfile.TemporaryDirectory(prefix='lsa-package-dispatch-') as directory:
        harness = Path(directory) / 'TestPackageReadyDispatch.java'
        harness.write_text(java, encoding='utf-8')
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', directory, str(REGISTRY), str(harness)], check=True)
        subprocess.run(['java', '-cp', directory, 'ls.augment.com.hook.TestPackageReadyDispatch'], check=True)


if __name__ == '__main__':
    main()
