"""Native Watcher bridge JVM contract tests against the production Java sources.

The modeled DexClassLoader is a URLClassLoader over isolated fixture JARs. Tests
exercise actual factory identity checks, callback forwarding and failure latches;
they do not prove Android dex loading, APK packaging or system_server delivery.
Use --output to preserve complete source inputs, compiler output and JVM results.
"""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com'

STUBS = {
    'android/content/pm/ApplicationInfo.java': '''package android.content.pm;
public class ApplicationInfo { public String sourceDir, packageName; }
''',
    'io/github/libxposed/api/XposedInterface.java': '''package io.github.libxposed.api;
public interface XposedInterface {
    android.content.pm.ApplicationInfo getModuleApplicationInfo();
}
''',
    'dalvik/system/DexClassLoader.java': '''package dalvik.system;
import java.io.File;
import java.net.URLClassLoader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
public final class DexClassLoader extends URLClassLoader {
    public static final List<String> moduleLoads = new ArrayList<>();
    public static String lastPath;
    public DexClassLoader(String path, String optimized, String library, ClassLoader parent) {
        super(url(path), parent);
        if (optimized != null || library != null) throw new AssertionError("Unexpected output/library path");
        lastPath = path;
    }
    private static URL[] url(String path) {
        try { return new URL[]{ new File(path).toURI().toURL() }; }
        catch (Exception e) { throw new IllegalArgumentException(e); }
    }
    @Override protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
        if (name.startsWith("ls.augment.com.")) moduleLoads.add(name);
        return super.loadClass(name, resolve);
    }
}
''',
}

TEST = r'''package ls.augment.com;
import android.content.pm.ApplicationInfo;
import dalvik.system.DexClassLoader;
import io.github.libxposed.api.XposedInterface;
import java.io.File;
import java.lang.reflect.*;
import java.net.*;
import java.util.concurrent.atomic.AtomicInteger;

public final class RootWatcherBridgeTest {
    interface Action { void run() throws Throwable; }
    static int passed, failed, assertions;
    static URLClassLoader services;
    static Class<?> watcher, watchable;
    static String bridgePath;
    static final String BRIDGE = "ls.augment.com.RootStateWatcher";
    static void check(boolean value, String reason) {
        assertions++; if (!value) throw new AssertionError(reason);
    }
    static void test(String name, Action action) {
        try { action.run(); passed++; System.out.println("PASS " + name); }
        catch (Throwable error) { failed++; System.out.println("FAIL " + name); error.printStackTrace(System.out); }
    }
    static Throwable rejects(Action action) throws Throwable {
        try { action.run(); } catch (Throwable error) { return error; }
        throw new AssertionError("Expected refusal");
    }
    static XposedInterface module(String packageName, String source) {
        ApplicationInfo info = new ApplicationInfo(); info.packageName = packageName; info.sourceDir = source;
        return () -> info;
    }
    static RootWatcherBridgeFactory factory() throws Throwable {
        return RootWatcherBridgeFactory.load(module("ls.augment.com", bridgePath), services, watcher, watchable);
    }
    static void signal(Object observer, Object value) throws Throwable {
        try { watcher.getMethod("onChange", watchable).invoke(observer, value); }
        catch (InvocationTargetException error) { throw error.getCause(); }
    }
    static URLClassLoader loader(String... paths) throws Exception {
        URL[] urls = new URL[paths.length];
        for (int i = 0; i < paths.length; i++) urls[i] = new File(paths[i]).toURI().toURL();
        return new URLClassLoader(urls, ClassLoader.getPlatformClassLoader());
    }
    public static void main(String[] args) throws Throwable {
        services = loader(args[0]); bridgePath = args[1];
        watcher = Class.forName("com.android.server.utils.Watcher", false, services);
        watchable = Class.forName("com.android.server.utils.Watchable", false, services);
        test("isolated bridge uses native class identities and only one module class", () -> {
            DexClassLoader.moduleLoads.clear();
            RootWatcherBridgeFactory f = factory();
            Object[] received = {new Object()};
            AtomicInteger callbacks = new AtomicInteger(), failures = new AtomicInteger();
            Object observer = f.create(value -> { received[0] = value; callbacks.incrementAndGet(); },
                    error -> failures.incrementAndGet());
            Object state = java.lang.reflect.Proxy.newProxyInstance(services, new Class<?>[]{watchable},
                    (proxy, method, values) -> method.getReturnType() == boolean.class ? false : null);
            check(observer.getClass().getSuperclass() == watcher, "Superclass identity");
            check(observer.getClass().getClassLoader().getParent() == services, "Exact services parent");
            check(observer.getClass().getClassLoader() != RootWatcherBridgeFactory.class.getClassLoader(), "No module loader reuse");
            signal(observer, state); check(received[0] == state && callbacks.get() == 1, "Original object exactly once");
            signal(observer, null); check(received[0] == null && callbacks.get() == 2, "Null forwarded exactly once");
            check(failures.get() == 0 && f.failure() == null, "No fabricated failure");
            check(DexClassLoader.lastPath.equals(bridgePath), "Exact framework source path");
            check(DexClassLoader.moduleLoads.size() == 1 && DexClassLoader.moduleLoads.get(0).equals(BRIDGE), "Only bridge loaded");
        });
        test("callback exception is latched once and never escapes or retries", () -> {
            RootWatcherBridgeFactory f = factory();
            RuntimeException original = new RuntimeException("observer failed");
            AtomicInteger callbacks = new AtomicInteger(), reports = new AtomicInteger(), otherCallbacks = new AtomicInteger();
            Object[] reported = {null};
            Object observer = f.create(value -> { callbacks.incrementAndGet(); throw original; },
                    error -> { reported[0] = error; reports.incrementAndGet(); });
            Object other = f.create(value -> otherCallbacks.incrementAndGet(), error -> reports.incrementAndGet());
            signal(observer, null); signal(observer, null); signal(other, null);
            check(callbacks.get() == 1 && reports.get() == 1, "No retry or duplicate failure report");
            check(otherCallbacks.get() == 0, "Factory failure stops every existing observer");
            check(f.failure() == original && reported[0] == original, "Exact throwable preserved");
            check(f.failureReportingError() == null, "No fabricated report error");
            Throwable refusal = rejects(() -> f.create(value -> {}, error -> {}));
            check(refusal instanceof IllegalStateException && refusal.getCause() == original, "New observer rejected after failure");
        });
        test("failure reporter exception is retained without breaking native dispatch", () -> {
            RootWatcherBridgeFactory f = factory();
            Error original = new AssertionError("observer error");
            Error reporter = new LinkageError("reporter error");
            AtomicInteger reports = new AtomicInteger();
            Object observer = f.create(value -> { throw original; }, error -> { reports.incrementAndGet(); throw reporter; });
            signal(observer, null); signal(observer, null);
            check(f.failure() == original && f.failureReportingError() == reporter, "Both exact failures available");
            check(reports.get() == 1, "No reporter retry");
        });
        test("reentrant failure notification cannot reenter the failed callback", () -> {
            RootWatcherBridgeFactory f = factory();
            AtomicInteger callbacks = new AtomicInteger(), reports = new AtomicInteger();
            Object[] observer = {null};
            observer[0] = f.create(value -> { callbacks.incrementAndGet(); throw new IllegalArgumentException(); }, error -> {
                reports.incrementAndGet();
                try { signal(observer[0], null); } catch (Throwable unexpected) { throw new AssertionError(unexpected); }
            });
            signal(observer[0], null);
            check(callbacks.get() == 1 && reports.get() == 1 && f.failureReportingError() == null, "Latch precedes failure callback");
        });
        test("null callbacks rejected before observer construction", () -> {
            RootWatcherBridgeFactory f = factory();
            check(rejects(() -> f.create(null, error -> {})) instanceof NullPointerException, "Null callback");
            check(rejects(() -> f.create(value -> {}, null)) instanceof NullPointerException, "Null reporter");
            check(f.failure() == null, "Invalid construction does not fabricate notification failure");
        });
        test("different native class-loader identity is rejected", () -> {
            try (URLClassLoader different = loader(args[0])) {
                Class<?> alien = Class.forName("com.android.server.utils.Watcher", false, different);
                check(rejects(() -> RootWatcherBridgeFactory.load(module("ls.augment.com", bridgePath), services, alien, watchable))
                        instanceof IllegalStateException, "Same name is not same class");
            }
        });
        test("parent-shadowed module bridge is rejected", () -> {
            try (URLClassLoader shadowing = loader(args[0], bridgePath)) {
                Class<?> w = Class.forName("com.android.server.utils.Watcher", false, shadowing);
                Class<?> a = Class.forName("com.android.server.utils.Watchable", false, shadowing);
                check(rejects(() -> RootWatcherBridgeFactory.load(module("ls.augment.com", bridgePath), shadowing, w, a))
                        instanceof IllegalStateException, "Bridge must be defined by new bridge loader");
            }
        });
        test("untrusted or missing module source is rejected", () -> {
            String[] paths = {null, "relative.apk", bridgePath + ".absent", new File(bridgePath).getParent()};
            for (String path : paths) check(rejects(() -> RootWatcherBridgeFactory.load(module("ls.augment.com", path), services, watcher, watchable))
                    instanceof IllegalStateException, "Invalid source " + path);
            check(rejects(() -> RootWatcherBridgeFactory.load(module("different.module", bridgePath), services, watcher, watchable))
                    instanceof IllegalStateException, "Wrong package");
            check(rejects(() -> RootWatcherBridgeFactory.load(() -> null, services, watcher, watchable))
                    instanceof NullPointerException, "Missing info");
        });
        test("bridge superclass, callback and unexpected dependencies are rejected", () -> {
            for (int i = 2; i < args.length; i++) {
                String mutated = args[i];
                Throwable refusal = rejects(() -> RootWatcherBridgeFactory.load(module("ls.augment.com", mutated), services, watcher, watchable));
                check(refusal instanceof ReflectiveOperationException || refusal instanceof IllegalStateException,
                        "Unexpected refusal type for malformed bridge");
            }
        });
        services.close();
        System.out.println("RESULT " + passed + " passed, " + failed + " failed; " + assertions + " assertions; 0 skipped");
        System.out.println("Scope: production factory and bridge on JVM with modeled DexClassLoader; Android ART and APK packaging remain device/build checks.");
        if (failed != 0) System.exit(1);
    }
}
'''


def write(path, content):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(content.encode('utf-8'))


def jar_classes(classes, output):
    with zipfile.ZipFile(output, 'w', zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(classes.rglob('*.class')):
            archive.write(path, path.relative_to(classes).as_posix())


def java_tool(name):
    located = shutil.which(name)
    if located:
        return located
    homes = [os.environ.get('JAVA_HOME', ''), 'C:/Program Files/Java/jdk-21.0.10']
    for home in homes:
        path = Path(home) / 'bin' / (name + ('.exe' if os.name == 'nt' else ''))
        if path.is_file():
            return str(path)
    raise RuntimeError(f'{name} was not found')


def run(output):
    output.mkdir(parents=True, exist_ok=False)
    inputs = []
    runs = []

    def copy(relative, destination):
        data = (ROOT / relative).read_bytes()
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(data)
        inputs.append({'source': relative, 'copy': str(destination.relative_to(output)),
                       'sha256': hashlib.sha256(data).hexdigest()})

    def command(name, argv):
        result = subprocess.run(argv, capture_output=True, text=True, encoding='utf-8', errors='replace')
        write(output / (name + '.stdout.txt'), result.stdout)
        write(output / (name + '.stderr.txt'), result.stderr)
        runs.append({'name': name, 'command': argv, 'exitCode': result.returncode})
        write(output / 'commands.json', json.dumps(runs, ensure_ascii=False, indent=2) + '\n')
        if result.stdout:
            print(result.stdout, end='')
        if result.stderr:
            print(result.stderr, end='')
        if result.returncode:
            raise RuntimeError(f'{name} failed with exit code {result.returncode}')

    compile_prefix = [java_tool('javac'), '-J-Dfile.encoding=UTF-8', '-J-Duser.language=en',
                      '--release', '17', '-encoding', 'UTF-8']
    platform_source = output / 'platform-src'
    for name in ('Watchable', 'Watcher'):
        copy(f'android/observer-stubs/src/com/android/server/utils/{name}.java',
             platform_source / f'com/android/server/utils/{name}.java')
    platform_classes = output / 'platform-classes'
    command('compile-platform', compile_prefix + ['-d', str(platform_classes)] +
            [str(path) for path in sorted(platform_source.rglob('*.java'))])
    platform_jar = output / 'platform.jar'
    jar_classes(platform_classes, platform_jar)

    bridge_source = output / 'bridge-src/ls/augment/com/RootStateWatcher.java'
    copy('android/app/src/main/java/ls/augment/com/RootStateWatcher.java', bridge_source)
    bridge_classes = output / 'bridge-classes'
    command('compile-bridge', compile_prefix + ['-cp', str(platform_jar), '-d', str(bridge_classes), str(bridge_source)])
    bridge_jar = output / 'module-bridge.jar'
    jar_classes(bridge_classes, bridge_jar)

    # Malformed payloads model wrong class shape, not an Android dex verifier.
    mutations = {
        'wrong-superclass': '''package ls.augment.com; import java.util.function.Consumer;
public final class RootStateWatcher { private final Consumer<Object> callback;
public RootStateWatcher(Consumer<Object> callback) { this.callback=callback; }
public void onChange(com.android.server.utils.Watchable what) { callback.accept(what); }}''',
        'extra-method': bridge_source.read_text(encoding='utf-8').rsplit('}', 1)[0] + '\n public void unexpected() {}\n}\n',
        'extra-field': bridge_source.read_text(encoding='utf-8').replace('private final Consumer<Object> callback;',
                'private final Consumer<Object> callback; private Object unexpected;'),
        'wrong-constructor': bridge_source.read_text(encoding='utf-8').replace('RootStateWatcher(Consumer<Object> callback)',
                'RootStateWatcher(Consumer<Object> callback, int unexpected)'),
    }
    mutation_jars = []
    for name, source in mutations.items():
        path = output / name / 'src/ls/augment/com/RootStateWatcher.java'
        write(path, source)
        classes = output / name / 'classes'
        command('compile-' + name, compile_prefix + ['-cp', str(platform_jar), '-d', str(classes), str(path)])
        artifact = output / (name + '.jar')
        jar_classes(classes, artifact)
        mutation_jars.append(str(artifact))

    test_source = output / 'test-src'
    for name, source in STUBS.items():
        write(test_source / name, source)
    write(test_source / 'ls/augment/com/RootWatcherBridgeTest.java', TEST)
    copy('android/app/src/main/java/ls/augment/com/RootWatcherBridgeFactory.java',
         test_source / 'ls/augment/com/RootWatcherBridgeFactory.java')
    copy('android/app/build.gradle', output / 'inputs/build.gradle')
    copy('tools/test-root-watcher-bridge.py', output / 'inputs/test-root-watcher-bridge.py')
    write(output / 'inputs.json', json.dumps(inputs, ensure_ascii=False, indent=2) + '\n')
    test_classes = output / 'test-classes'
    command('compile-tests', compile_prefix + ['-d', str(test_classes)] +
            [str(path) for path in sorted(test_source.rglob('*.java'))])
    command('run-tests', [java_tool('java'), '-cp', str(test_classes), 'ls.augment.com.RootWatcherBridgeTest',
                         str(platform_jar), str(bridge_jar)] + mutation_jars)
    command('bridge-bytecode', [java_tool('javap'), '-J-Dfile.encoding=UTF-8', '-J-Duser.language=en',
                               '-verbose', '-cp', str(bridge_jar), 'ls.augment.com.RootStateWatcher'])
    write(output / 'RESULT.json', json.dumps({'status': 'PASS', 'created': datetime.datetime.now(datetime.timezone.utc).isoformat(),
          'scope': 'JVM bridge/factory behavior with isolated native-class and modeled DexClassLoader fixtures; not ART or APK proof',
          'commands': runs}, ensure_ascii=False, indent=2) + '\n')
    return 0


def main():
    if hasattr(sys.stdout, 'reconfigure'):
        sys.stdout.reconfigure(errors='backslashreplace')
        sys.stderr.reconfigure(errors='backslashreplace')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, help='New directory to retain exact source and result evidence')
    args = parser.parse_args()
    if args.output:
        return run(args.output.resolve())
    with tempfile.TemporaryDirectory(prefix='ls-augment-watcher-bridge-') as temporary:
        return run(Path(temporary) / 'run')


if __name__ == '__main__':
    raise SystemExit(main())
