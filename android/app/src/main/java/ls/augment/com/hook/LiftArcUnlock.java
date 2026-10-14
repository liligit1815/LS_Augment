package ls.augment.com.hook;

import static ls.augment.com.hook.SystemUiAdapter.*;

/** Requests the ROM's normal security flow; never changes authentication state. */
final class LiftArcUnlock {
    private static volatile Object manager;
    static void capture(Object value) {
        manager=value!=null&&LiftArcUnlockEntry.supported(value.getClass())?value:null;
        LiftArcRuntime.unlockReady(manager!=null);
    }
    static Object manager() { return manager; }
    static boolean show() {
        Object owner=manager;if(owner==null)return false;
        try {
            // A concrete selected user and exact None security mode are both required.
            // No fallback to user zero is allowed for this direct no-security route.
            Object selected=field(owner,"mSelectedUserInteractor");
            Object raw=selected==null?null:call(selected,"getSelectedUserId");
            if(raw instanceof Integer&&((Integer)raw)>=0) {
                int user=(Integer)raw;Object model=field(owner,"mKeyguardSecurityModel");
                Object mode=model==null?null:call(model,"getSecurityMode",user);
                if(mode instanceof Enum<?> && "None".equals(((Enum<?>)mode).name())) {
                    Object callback=field(owner,"mViewMediatorCallback");
                    if(callback!=null) { call(callback,"keyguardDone",user); LiftArcLog.d("转交原厂无安全锁解锁");return true; }
                }
            }
        } catch(ReflectiveOperationException unavailable) {
            // Unknown user/security state follows the secure native bouncer route.
        }
        try {
            LiftArcUnlockEntry.show(owner);
            LiftArcLog.d("转交原厂锁屏验证");return true;
        } catch(ReflectiveOperationException error) { LiftArcRuntime.error("原厂验证入口",error);return false; }
    }
    private LiftArcUnlock() { }
}
