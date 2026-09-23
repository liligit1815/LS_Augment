package ls.augment.com;

import android.content.pm.ApplicationInfo;
import dalvik.system.DexClassLoader;
import io.github.libxposed.api.XposedInterface;
import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

/**
 * Loads just the tiny native Watcher subclass, using the actual services loader
 * as parent. The caller must establish the supplied platform classes' provenance
 * and must check failure() before granting or exercising ownership. This factory
 * neither registers observers nor establishes that notification coverage exists.
 */
final class RootWatcherBridgeFactory {
    private static final String BRIDGE = "ls.augment.com.RootStateWatcher";
    private final Constructor<?> constructor;
    private final AtomicReference<Throwable> firstFailure = new AtomicReference<>();
    private final AtomicReference<Throwable> reportingFailure = new AtomicReference<>();

    private RootWatcherBridgeFactory(Constructor<?> constructor) {
        this.constructor = constructor;
    }

    static RootWatcherBridgeFactory load(XposedInterface module, ClassLoader services,
            Class<?> watcherClass, Class<?> watchableClass) throws Throwable {
        Objects.requireNonNull(module, "module");
        Objects.requireNonNull(services, "services");
        requirePlatformShape(services, watcherClass, watchableClass);
        ApplicationInfo info = Objects.requireNonNull(module.getModuleApplicationInfo(), "module info");
        if (!"ls.augment.com".equals(info.packageName) || info.sourceDir == null) {
            throw new IllegalStateException("Unrecognized framework module source");
        }
        File source = new File(info.sourceDir);
        if (!source.isAbsolute() || !source.isFile() || !source.canRead()) {
            throw new IllegalStateException("Unreadable framework module source");
        }
        // Never use a path supplied by an app command, a copied dex, or a mutable
        // optimized output directory. Modern Android ignores optimizedDirectory.
        ClassLoader bridgeLoader = new DexClassLoader(source.getAbsolutePath(), null, null, services);
        Class<?> bridge = Class.forName(BRIDGE, false, bridgeLoader);
        if (bridge.getClassLoader() != bridgeLoader || bridge.getSuperclass() != watcherClass
                || bridge.getModifiers() != (Modifier.PUBLIC | Modifier.FINAL)
                || bridge.getInterfaces().length != 0) {
            throw new IllegalStateException("Watcher bridge class identity mismatch");
        }
        Constructor<?> constructor = bridge.getDeclaredConstructor(Consumer.class);
        if (constructor.getModifiers() != Modifier.PUBLIC
                || bridge.getDeclaredConstructors().length != 1) {
            throw new IllegalStateException("Watcher bridge constructor mismatch");
        }
        Method callback = bridge.getDeclaredMethod("onChange", watchableClass);
        if (callback.getReturnType() != void.class || callback.getModifiers() != Modifier.PUBLIC
                || bridge.getDeclaredMethods().length != 1) {
            throw new IllegalStateException("Watcher bridge callback mismatch");
        }
        Field[] fields = bridge.getDeclaredFields();
        if (fields.length != 1 || fields[0].getType() != Consumer.class
                || fields[0].getModifiers() != (Modifier.PRIVATE | Modifier.FINAL)) {
            throw new IllegalStateException("Watcher bridge callback field mismatch");
        }
        return new RootWatcherBridgeFactory(constructor);
    }

    private static void requirePlatformShape(ClassLoader services, Class<?> watcher,
            Class<?> watchable) throws ReflectiveOperationException {
        if (watcher == null || watchable == null
                || Class.forName("com.android.server.utils.Watcher", false, services) != watcher
                || Class.forName("com.android.server.utils.Watchable", false, services) != watchable
                || watcher.getSuperclass() != Object.class
                || watcher.getModifiers() != (Modifier.PUBLIC | Modifier.ABSTRACT)
                || watchable.getModifiers() != (Modifier.PUBLIC | Modifier.INTERFACE | Modifier.ABSTRACT)) {
            throw new IllegalStateException("Native Watcher class identity mismatch");
        }
        if (watcher.getDeclaredConstructor().getModifiers() != Modifier.PUBLIC) {
            throw new IllegalStateException("Native Watcher constructor mismatch");
        }
        requireAbstractMethod(watcher, "onChange", void.class, watchable);
        requireAbstractMethod(watchable, "registerObserver", void.class, watcher);
        requireAbstractMethod(watchable, "unregisterObserver", void.class, watcher);
        requireAbstractMethod(watchable, "isRegisteredObserver", boolean.class, watcher);
        requireAbstractMethod(watchable, "dispatchChange", void.class, watchable);
    }

    private static void requireAbstractMethod(Class<?> owner, String name, Class<?> result,
            Class<?> parameter) throws ReflectiveOperationException {
        Method method = owner.getDeclaredMethod(name, parameter);
        if (method.getReturnType() != result
                || method.getModifiers() != (Modifier.PUBLIC | Modifier.ABSTRACT)) {
            throw new IllegalStateException("Native Watcher method mismatch: " + name);
        }
    }

    Object create(Consumer<Object> callback, Consumer<Throwable> failure) throws Throwable {
        Objects.requireNonNull(callback, "callback");
        Objects.requireNonNull(failure, "failure");
        if (firstFailure.get() != null) {
            throw new IllegalStateException("Watcher bridge is no longer usable", firstFailure.get());
        }
        Consumer<Object> guarded = what -> {
            if (firstFailure.get() != null) return;
            try {
                callback.accept(what);
            } catch (Throwable error) {
                // A notification failure revokes this factory's capability. It
                // must never abort or retry the native system notification.
                if (firstFailure.compareAndSet(null, error)) {
                    try {
                        failure.accept(error);
                    } catch (Throwable reportError) {
                        reportingFailure.compareAndSet(null, reportError);
                    }
                }
            }
        };
        try {
            return constructor.newInstance(guarded);
        } catch (InvocationTargetException error) {
            throw error.getCause();
        }
    }

    /** Persistent first callback failure; null does not establish observer coverage. */
    Throwable failure() { return firstFailure.get(); }

    /** Preserves a failed failure-report callback without throwing into the system. */
    Throwable failureReportingError() { return reportingFailure.get(); }
}
