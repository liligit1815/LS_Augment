package ls.augment.com.hook;

/** The production resolver must retain OEM visibility decisions on both legacy engines. */
public final class TestNativeIslandWake {
    static int checks;
    static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    static class Wake {int calls;void onStartedWakingUp(){calls++;}}
    static class WakeChild extends Wake {}
    static class Legacy {
        boolean mAODVisibility,mIsDynamicIslandEnable,mPayJoyControlled;
        int mCurRotation,calls;
        void setAODVisibility(boolean value){throw new AssertionError("AOD setter must not be called");}
        void updateRooterVisibility(){calls++;}
    }
    static class Power {
        boolean mAODVisibility,mIsDynamicIslandEnable,mSuperPowerSave,visible;
        int mCurRotation,calls;
        boolean disableDynamicIsland(){return !mIsDynamicIslandEnable||mCurRotation==1||mCurRotation==3||mAODVisibility||mSuperPowerSave;}
        void setAODVisibility(boolean value){throw new AssertionError("AOD setter must not be called");}
        void setSuperPowerSave(boolean value){throw new AssertionError("power setter must not be called");}
        void updateRooterVisibility(){calls++;visible=!disableDynamicIsland();}
    }
    static class PowerChild extends Power {}
    static class WrongPower extends Power {String mSuperPowerSave;}
    static class WrongPayJoy extends Power {String mPayJoyControlled;}
    static class Interactive extends Power {boolean mInteractive;}
    static class StaticGate {
        boolean mAODVisibility,mIsDynamicIslandEnable,mSuperPowerSave;int mCurRotation;
        static boolean disableDynamicIsland(){return false;}
        void setAODVisibility(boolean value){}void setSuperPowerSave(boolean value){}
        void updateRooterVisibility(){throw new AssertionError("unknown contract executed");}
    }
    static class MissingGate {
        boolean mAODVisibility,mIsDynamicIslandEnable,mSuperPowerSave;int mCurRotation;
        void setAODVisibility(boolean value){}void setSuperPowerSave(boolean value){}
        void updateRooterVisibility(){throw new AssertionError("missing predicate executed");}
    }
    static class WrongCallback {boolean onStartedWakingUp(){return true;}}
    static class BrokenPower extends Power {void updateRooterVisibility(){throw new IllegalStateException("native failure");}}
    static void reject(Object manager,Object permanent)throws Exception {
        try{NativeIslandWake.synchronize(manager,permanent);throw new AssertionError("unknown contract accepted");}
        catch(NoSuchMethodException expected){checks++;}
    }
    public static void main(String[] args)throws Exception {
        Legacy old=new Legacy();old.mPayJoyControlled=true;old.mAODVisibility=true;old.mCurRotation=3;
        check("permanent_visibility".equals(NativeIslandWake.synchronize(new Object(),old)),"old visibility path lost");
        check(old.calls==1&&old.mPayJoyControlled&&old.mAODVisibility&&old.mCurRotation==3,"old policy state changed");
        for(Power p:new Power[]{new Power(),new PowerChild()}) {
            check("permanent_visibility".equals(NativeIslandWake.contract(new Object(),p))&&p.calls==0,"preflight changed OEM state");
            for(int flags=0;flags<8;flags++)for(int rotation=0;rotation<4;rotation++) {
                p.mIsDynamicIslandEnable=(flags&1)!=0;p.mAODVisibility=(flags&2)!=0;p.mSuperPowerSave=(flags&4)!=0;p.mCurRotation=rotation;
                int before=p.calls;boolean hidden=p.disableDynamicIsland();
                NativeIslandWake.synchronize(new Object(),p);
                check(p.calls==before+1&&p.visible==!hidden,"OEM visibility predicate ignored");
                check(p.mIsDynamicIslandEnable==((flags&1)!=0)&&p.mAODVisibility==((flags&2)!=0)
                        &&p.mSuperPowerSave==((flags&4)!=0)&&p.mCurRotation==rotation,"native lifecycle was fabricated");
            }
        }
        WakeChild manager=new WakeChild();Power p=new Power();
        check("manager".equals(NativeIslandWake.synchronize(manager,p))&&manager.calls==1&&p.calls==0,"native wake must take precedence");
        for(Object unknown:new Object[]{new WrongPower(),new WrongPayJoy(),new Interactive(),new StaticGate(),new MissingGate(),new Object()})reject(new Object(),unknown);
        reject(new WrongCallback(),new Power());
        try{NativeIslandWake.synchronize(new Object(),new BrokenPower());throw new AssertionError("native exception lost");}
        catch(java.lang.reflect.InvocationTargetException expected){check(expected.getCause() instanceof IllegalStateException,"wrong error propagated");}
        System.out.println("PASS native island wake: "+checks+" checks");
    }
}
