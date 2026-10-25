package ls.augment.com.hook;

import android.view.Display;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** In-process, identity-bound evidence from the actual primary display device. */
final class AtomicWorkbenchDisplayDeviceEvidence {
    private static final int OWN_CONTENT_ONLY = 0x80; // DisplayDeviceInfo domain, never Display flags.
    private final Class<?> serviceType, localType, dmsType, syncType, infoType, displayInfoType;
    private final Field wmLock, localService, dmsOwner, syncRoot, flags, type, ownerUid, name, unique;
    private final Field displayLock, displayInfo, displayName, displayUnique;
    private final Method deviceInfo, displayType, displayOwner;
    private final int virtualType;
    private Object boundService, boundLocal, boundDms, boundSync;

    static AtomicWorkbenchDisplayDeviceEvidence resolve(ClassLoader loader) throws Exception {
        return new AtomicWorkbenchDisplayDeviceEvidence(loader);
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    private AtomicWorkbenchDisplayDeviceEvidence(ClassLoader loader) throws Exception {
        serviceType = Class.forName("com.android.server.wm.WindowManagerService", false, loader);
        Class<?> globalLockType = Class.forName("com.android.server.wm.WindowManagerGlobalLock", false, loader);
        Class<?> internalType = Class.forName("android.hardware.display.DisplayManagerInternal", false, loader);
        localType = Class.forName("com.android.server.display.DisplayManagerService$LocalService", false, loader);
        dmsType = Class.forName("com.android.server.display.DisplayManagerService", false, loader);
        syncType = Class.forName("com.android.server.display.DisplayManagerService$SyncRoot", false, loader);
        infoType = Class.forName("com.android.server.display.DisplayDeviceInfo", false, loader);
        displayInfoType = Class.forName("android.view.DisplayInfo", false, loader);
        if (localType.getSuperclass() != internalType) throw new NoSuchFieldException("display_local_service_shape");
        wmLock = field(serviceType, "mGlobalLock", globalLockType, true);
        localService = field(serviceType, "mDisplayManagerInternal", internalType, true);
        dmsOwner = field(localType, "this$0", dmsType, true);
        syncRoot = field(dmsType, "mSyncRoot", syncType, true);
        deviceInfo = method(dmsType, "getDisplayDeviceInfoInternal", infoType, false, int.class);
        flags = field(infoType, "flags", int.class, false);
        type = field(infoType, "type", int.class, false);
        ownerUid = field(infoType, "ownerUid", int.class, false);
        name = field(infoType, "name", String.class, false);
        unique = field(infoType, "uniqueId", String.class, false);
        displayLock = field(Display.class, "mLock", Object.class, true);
        displayInfo = field(Display.class, "mDisplayInfo", displayInfoType, false);
        displayName = field(displayInfoType, "name", String.class, false);
        displayUnique = field(displayInfoType, "uniqueId", String.class, false);
        displayType = method(Display.class, "getType", int.class, false);
        displayOwner = method(Display.class, "getOwnerUid", int.class, false);
        Field virtual = Display.class.getDeclaredField("TYPE_VIRTUAL");
        if (virtual.getType() != int.class || !Modifier.isStatic(virtual.getModifiers())) throw new NoSuchFieldException("TYPE_VIRTUAL");
        virtual.setAccessible(true); virtualType = virtual.getInt(null);
        if (virtualType <= 0) throw new NoSuchFieldException("display_virtual_type");
        // R8 may remove constant fields. Validate this bit's actual system-class semantics instead.
        Method describe = method(infoType, "flagsToString", String.class, true, int.class);
        Object own = describe.invoke(null, OWN_CONTENT_ONLY), zero = describe.invoke(null, 0);
        if (!(own instanceof String) || !(zero instanceof String)) throw new NoSuchFieldException("display_own_content_profile");
        String token = ((String) own).trim();
        if (token.startsWith(",")) token = token.substring(1).trim();
        if (!"FLAG_OWN_CONTENT_ONLY".equals(token) || ((String) zero).contains("FLAG_OWN_CONTENT_ONLY"))
            throw new NoSuchFieldException("display_own_content_profile");
    }

    boolean ownsContentOnly(Object service, Display display) throws Exception {
        if (service == null || !serviceType.isInstance(service) || display == null) return false;
        Object global = wmLock.get(service);
        if (global == null || !Thread.holdsLock(global)) return false;
        Object local = localService.get(service);
        if (local == null || local.getClass() != localType) return false;
        Object dms = dmsOwner.get(local);
        if (dms == null || dms.getClass() != dmsType) return false;
        Object sync = syncRoot.get(dms);
        if (sync == null || sync.getClass() != syncType || Thread.holdsLock(sync)) return false;
        int id = display.getDisplayId(), expectedType = (Integer) displayType.invoke(display);
        int expectedOwner = (Integer) displayOwner.invoke(display);
        if (id <= Display.DEFAULT_DISPLAY || expectedType != virtualType || expectedOwner != 0) return false;
        String expectedName, expectedUnique;
        Object cachedLock = displayLock.get(display);
        if (cachedLock == null || Thread.holdsLock(cachedLock)) return false;
        // getName() refreshes through DisplayManagerGlobal on this ROM. Read only the cache.
        synchronized (cachedLock) {
            Object cached = displayInfo.get(display);
            if (cached == null || cached.getClass() != displayInfoType) return false;
            expectedName = (String) displayName.get(cached);
            expectedUnique = (String) displayUnique.get(cached);
        }
        if (expectedName == null || expectedName.isEmpty() || expectedUnique == null || expectedUnique.isEmpty()) return false;
        synchronized (this) {
            if (boundService == null) {
                boundService = service; boundLocal = local; boundDms = dms; boundSync = sync;
            } else if (boundService != service || boundLocal != local || boundDms != dms || boundSync != sync) return false;
        }
        int actualFlags, actualType, actualOwner;
        String actualName, actualUnique;
        synchronized (sync) {
            if (localService.get(service) != local || dmsOwner.get(local) != dms || syncRoot.get(dms) != sync) return false;
            // The public getter reenters this same monitor; its returned DDI is shared, not a copy.
            Object info = deviceInfo.invoke(dms, id);
            if (info == null || info.getClass() != infoType) return false;
            actualFlags = flags.getInt(info); actualType = type.getInt(info); actualOwner = ownerUid.getInt(info);
            actualName = (String) name.get(info); actualUnique = (String) unique.get(info);
        }
        return (actualFlags & OWN_CONTENT_ONLY) == OWN_CONTENT_ONLY && actualType == expectedType
                && actualOwner == expectedOwner && expectedName.equals(actualName) && expectedUnique.equals(actualUnique);
    }

    private static Field field(Class<?> owner, String name, Class<?> type, boolean immutable) throws Exception {
        Field field = owner.getDeclaredField(name);
        int modifiers = field.getModifiers();
        if (field.getType() != type || Modifier.isStatic(modifiers) || immutable && !Modifier.isFinal(modifiers))
            throw new NoSuchFieldException(name);
        field.setAccessible(true); return field;
    }

    private static Method method(Class<?> owner, String name, Class<?> result, boolean isStatic, Class<?>... parameters) throws Exception {
        Method method = owner.getDeclaredMethod(name, parameters);
        int modifiers = method.getModifiers();
        if (method.getReturnType() != result || Modifier.isStatic(modifiers) != isStatic || !Modifier.isPublic(modifiers))
            throw new NoSuchMethodException(name);
        method.setAccessible(true); return method;
    }
}
