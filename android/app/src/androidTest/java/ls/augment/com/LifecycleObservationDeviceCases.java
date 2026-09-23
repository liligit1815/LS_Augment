package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import dalvik.system.PathClassLoader;
import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.json.JSONArray;
import org.json.JSONObject;

/** Actual OEM utility classes, with two new maps only; never obtains a PMS object. */
final class LifecycleObservationDeviceCases {
    private static final String PACKAGE = "ls.augment.com";
    private static final String SERVICES = "/system/framework/services.jar";
    private static final String BRIDGE = "ls.augment.com.RootStateWatcher";
    // Host source reference, not a claim that Java source exists on the device.
    private static final String BRIDGE_SOURCE_SHA256 =
            "b8713078dbe16468621f53d00e57c1ffccb08636565f090bf2b1dc73db244c9f";
    private LifecycleObservationDeviceCases() { }

    static JSONObject run(Context context, Bundle arguments) throws Exception {
        JSONObject report = new JSONObject().put("success", false)
                .put("entryType", "ACTUAL_OEM_CLASSES_ISOLATED_MAPS")
                .put("package", PACKAGE).put("realPmsObjectsAccessed", false)
                .put("packageStateMutations", 0).put("configurationAccessed", false)
                .put("rootCommands", 0).put("hiddenApiBypass", false)
                .put("runnerWritesResultFile", true).put("classLoadingMayCreateRuntimeArtifacts", true)
                .put("recoveryImplemented", false).put("realPmsAbaObserved", false);
        try {
            require(PACKAGE.equals(context.getPackageName()), "Fixed main package context required");
            require(!arguments.containsKey("package") || PACKAGE.equals(arguments.getString("package")),
                    "Only the fixed main package is allowed");
            File services = new File(SERVICES);
            String servicesBefore = digest(services);
            report.put("servicesPath", SERVICES).put("servicesCanonicalPath", services.getCanonicalPath())
                    .put("servicesSha256", servicesBefore)
                    .put("expectedServicesSha256", RootCriticalProfile.SERVICES_SHA256);
            require(RootCriticalProfile.SERVICES_SHA256.equals(servicesBefore),
                    "Actual services.jar does not match the retained OEM profile");
            File apk = new File(context.getPackageCodePath());
            String apkBefore = digest(apk);
            report.put("moduleApkPath", apk.getAbsolutePath()).put("moduleApkSha256", apkBefore)
                    .put("bridgeSourceReference", new JSONObject()
                            .put("path", "android/app/src/main/java/ls/augment/com/RootStateWatcher.java")
                            .put("sha256", BRIDGE_SOURCE_SHA256).put("kind", "HOST_SOURCE_REFERENCE"));
            ClassLoader boot = Object.class.getClassLoader();
            PathClassLoader servicesLoader = new PathClassLoader(SERVICES, boot);
            PathClassLoader bridgeLoader = new PathClassLoader(context.getPackageCodePath(), servicesLoader);
            Class<?> mapClass = Class.forName("com.android.server.utils.WatchedArrayMap", false, servicesLoader);
            Class<?> watcherClass = Class.forName("com.android.server.utils.Watcher", false, servicesLoader);
            Class<?> watchableClass = Class.forName("com.android.server.utils.Watchable", false, servicesLoader);
            Class<?> bridgeClass = Class.forName(BRIDGE, false, bridgeLoader);
            report.put("loaders", new JSONArray().put(loader("boot", boot))
                    .put(loader("services", servicesLoader)).put(loader("bridge", bridgeLoader)))
                    .put("classes", new JSONArray().put(source(mapClass, SERVICES))
                            .put(source(watcherClass, SERVICES)).put(source(watchableClass, SERVICES))
                            .put(source(bridgeClass, apk.getAbsolutePath())));
            require(mapClass.getClassLoader() == servicesLoader && watcherClass.getClassLoader() == servicesLoader
                    && watchableClass.getClassLoader() == servicesLoader,
                    "OEM classes were delegated to an unexpected defining loader");
            require(bridgeClass.getClassLoader() == bridgeLoader && bridgeClass.getSuperclass() == watcherClass,
                    "Existing production watcher was not loaded through the exact services parent");
            Methods methods = new Methods(mapClass, watcherClass, bridgeClass);
            Object a = new Object();
            Trace aba = new Trace(methods, a, true);
            Trace unrelated = new Trace(methods, a, false);
            report.put("reentrantAba", aba.report).put("unrelatedControl", unrelated.report);
            aba.run();
            unrelated.run();
            require(aba.map != unrelated.map, "The two traces must use distinct isolated maps");
            require(aba.lateSnapshots.size() == 2 && unrelated.lateSnapshots.size() == 2,
                    "Both later observers must receive exactly two notifications");
            for (int index = 0; index < 2; index++)
                require(aba.lateSnapshots.get(index) == a && unrelated.lateSnapshots.get(index) == a,
                        "Later-observer target snapshots differ between the two actual traces");
            String servicesAfter = digest(services), apkAfter = digest(apk);
            report.put("servicesSha256After", servicesAfter).put("moduleApkSha256After", apkAfter);
            require(servicesBefore.equals(servicesAfter) && apkBefore.equals(apkAfter),
                    "A loaded source file changed during the fixture");
            report.put("laterTargetSnapshotsIdentical", true).put("sameSnapshotCountPerTrace", 2)
                    .put("isolatedMapMutationCalls", aba.mutations + unrelated.mutations)
                    .put("conclusion", "Target get(A) snapshots alone cannot distinguish these two isolated histories; "
                            + "the fixture does not prove that either history occurred in the live PMS")
                    .put("success", true);
        } catch (Throwable failure) {
            report.put("error", android.util.Log.getStackTraceString(failure))
                    .put("errorClass", failure.getClass().getName());
        }
        return report;
    }

    private static final class Methods {
        final Constructor<?> map, watcher;
        final Method put, remove, get, size, register, unregister, registered;
        Methods(Class<?> mapClass, Class<?> watcherClass, Class<?> bridgeClass) throws Exception {
            map = mapClass.getConstructor();
            watcher = bridgeClass.getConstructor(Consumer.class);
            put = mapClass.getMethod("put", Object.class, Object.class);
            remove = mapClass.getMethod("remove", Object.class);
            get = mapClass.getMethod("get", Object.class);
            size = mapClass.getMethod("size");
            register = mapClass.getMethod("registerObserver", watcherClass);
            unregister = mapClass.getMethod("unregisterObserver", watcherClass);
            registered = mapClass.getMethod("isRegisteredObserver", watcherClass);
        }
    }

    private static final class Trace {
        final Methods methods;
        final Object a, b = new Object();
        final boolean reentrant;
        final JSONArray events = new JSONArray();
        final List<Object> lateSnapshots = new ArrayList<>();
        final JSONObject report;
        Object map, early, late;
        boolean insertedAgain;
        int earlyCallbacks, lateCallbacks, mutations;
        Trace(Methods methods, Object a, boolean reentrant) throws Exception {
            this.methods = methods; this.a = a; this.reentrant = reentrant;
            report = new JSONObject().put("kind", reentrant ? "REMOVE_A_REENTRANT_PUT_SAME_A" : "PUT_REMOVE_UNRELATED_B")
                    .put("targetKey", PACKAGE).put("unrelatedKey", "__isolated_B__")
                    .put("events", events).put("success", false);
        }
        void run() throws Throwable {
            map = methods.map.newInstance();
            Throwable primary = null;
            try {
                require(mutate("initial-put-A", methods.put, PACKAGE, a) == null,
                        "New map unexpectedly contained A");
                early = methods.watcher.newInstance((Consumer<Object>) what -> callback(true, what));
                late = methods.watcher.newInstance((Consumer<Object>) what -> callback(false, what));
                invoke(methods.register, map, early);
                invoke(methods.register, map, late);
                require(Boolean.TRUE.equals(invoke(methods.registered, map, early))
                        && Boolean.TRUE.equals(invoke(methods.registered, map, late)), "Observers not registered");
                event("observers-registered-earlier-then-later", null);
                if (reentrant) {
                    require(mutate("remove-A", methods.remove, PACKAGE) == a, "remove(A) did not return original A");
                    require(insertedAgain, "Earlier observer did not perform the reentrant put");
                } else {
                    require(mutate("put-B", methods.put, "__isolated_B__", b) == null, "B was unexpectedly present");
                    require(mutate("remove-B", methods.remove, "__isolated_B__") == b, "remove(B) returned a different value");
                }
                require(earlyCallbacks == 2 && lateCallbacks == 2, "Unexpected actual OEM notification counts");
                require(invoke(methods.get, map, PACKAGE) == a
                        && Integer.valueOf(1).equals(invoke(methods.size, map)), "Final isolated map differs");
                report.put("earlyCallbacks", earlyCallbacks).put("lateCallbacks", lateCallbacks)
                        .put("mutationCalls", mutations).put("finalAIsOriginal", true).put("success", true);
            } catch (Throwable failure) {
                primary = failure;
                report.put("error", android.util.Log.getStackTraceString(failure));
                throw failure;
            } finally {
                // These are local objects only; removal is attempted even after an assertion fails.
                Throwable cleanup = null;
                for (Object observer : new Object[] {early, late}) {
                    if (observer == null) continue;
                    try {
                        invoke(methods.unregister, map, observer);
                        require(Boolean.FALSE.equals(invoke(methods.registered, map, observer)), "Observer remained registered");
                    } catch (Throwable error) {
                        if (cleanup == null) cleanup = error; else cleanup.addSuppressed(error);
                    }
                }
                report.put("observersDetached", cleanup == null).put("earlyCallbacks", earlyCallbacks)
                        .put("lateCallbacks", lateCallbacks).put("mutationCalls", mutations);
                if (cleanup != null) {
                    report.put("cleanupError", android.util.Log.getStackTraceString(cleanup)).put("success", false);
                    if (primary != null) primary.addSuppressed(cleanup); else throw cleanup;
                }
            }
        }
        void callback(boolean first, Object what) {
            try {
                require(what == map, "Callback source is not this isolated map");
                if (first) earlyCallbacks++; else lateCallbacks++;
                event(first ? "earlier-callback-enter" : "later-callback-enter", what);
                Object seen = invoke(methods.get, map, PACKAGE);
                if (!first) {
                    lateSnapshots.add(seen);
                    require(seen == a, "Later observer saw a different target snapshot");
                } else if (reentrant && !insertedAgain) {
                    require(seen == null, "Earlier remove callback did not see A absent");
                    insertedAgain = true; // Bound reentrancy to one actual put, before invoking it.
                    require(mutate("reentrant-put-same-A", methods.put, PACKAGE, a) == null,
                            "Reentrant put did not replace an absent key");
                }
                event(first ? "earlier-callback-return" : "later-callback-return", what);
            } catch (Throwable failure) {
                throw new CallbackFailure(failure); // Preserve cause; do not turn failed evidence into success.
            }
        }
        Object mutate(String label, Method method, Object... arguments) throws Throwable {
            mutations++;
            event("mutator-begin:" + label, null);
            Object result = invoke(method, map, arguments);
            event("mutator-return:" + label, result);
            return result;
        }
        void event(String kind, Object value) throws Throwable {
            require(events.length() < 64, "Isolated callback trace exceeded the finite event budget");
            Object current = invoke(methods.get, map, PACKAGE);
            events.put(new JSONObject().put("sequence", events.length() + 1).put("event", kind)
                    .put("aAbsent", current == null).put("aIsOriginal", current == a)
                    .put("mapSize", invoke(methods.size, map)).put("valueIsA", value == a)
                    .put("valueIsB", value == b).put("valueIsMap", value == map)
                    .put("valueIsNull", value == null));
        }
    }

    private static final class CallbackFailure extends RuntimeException {
        CallbackFailure(Throwable cause) { super("Isolated OEM observer callback failed", cause); }
    }
    private static Object invoke(Method method, Object receiver, Object... arguments) throws Throwable {
        try { return method.invoke(receiver, arguments); }
        catch (InvocationTargetException failure) { throw failure.getCause(); }
    }
    private static JSONObject loader(String role, ClassLoader loader) throws Exception {
        return new JSONObject().put("role", role).put("description", String.valueOf(loader))
                .put("identity", loader == null ? "null" : Integer.toHexString(System.identityHashCode(loader)))
                .put("parent", loader == null ? "none" : String.valueOf(loader.getParent()));
    }
    private static JSONObject source(Class<?> type, String archive) throws Exception {
        return new JSONObject().put("name", type.getName()).put("requestedArchive", archive)
                .put("definingLoader", String.valueOf(type.getClassLoader()));
    }
    private static String digest(File file) throws Exception {
        require(file.isAbsolute() && file.isFile() && file.canRead(), "Unreadable fixed source: " + file);
        require(file.getAbsoluteFile().equals(file.getCanonicalFile()), "Source path is not canonical: " + file);
        long size = file.length(), read = 0;
        require(size > 0 && size <= 256L * 1024 * 1024, "Source exceeds finite file budget: " + file);
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (FileInputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[65536];
            for (int count; (count = input.read(buffer)) != -1;) {
                read += count;
                require(read <= size, "Source grew while hashing: " + file);
                digest.update(buffer, 0, count);
            }
        }
        require(read == size && file.length() == size, "Source length changed while hashing: " + file);
        StringBuilder out = new StringBuilder(64);
        for (byte value : digest.digest()) out.append(Character.forDigit((value >>> 4) & 15, 16))
                .append(Character.forDigit(value & 15, 16));
        return out.toString();
    }
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
