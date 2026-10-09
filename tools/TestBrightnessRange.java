package ls.augment.com;

public final class TestBrightnessRange {
    private static void check(boolean value,String message) { if(!value)throw new AssertionError(message); }
    public static void main(String[] args) {
        check(BrightnessRange.driver(0)==1,"lowest nonzero hardware code");
        check(BrightnessRange.driver(12150)==8190,"verified panel maximum");
        check(BrightnessRange.driver(500)==-1 && BrightnessRange.driver(10500)==-1,"OEM owns entire normal interval");
        check(BrightnessRange.label(0).equals("极低 0.5%"),"explicit low-end meaning");
        check(BrightnessRange.label(500).equals("0%") && BrightnessRange.label(10500).equals("100%"),"retain original labels");
        check(BrightnessRange.label(12150).equals("116.5%"),"upper calibration");
        check(BrightnessRange.fromNative(500,0,1000)==5500,"midpoint is not quantized");
        for(int maximum:new int[]{1000,65535}) {
            int last=-1;
            for(int x=0;x<=maximum;x++) {
                int p=BrightnessRange.fromNative(x,0,maximum);
                check(p>=last,"native mapping monotonic");last=p;
                check(Math.abs(x-BrightnessRange.toNative(p,0,maximum))<=Math.max(1,maximum/10000),"roundtrip bounded");
            }
        }
        int previous=7030;
        for(int p=10501;p<=12150;p++) { int driver=BrightnessRange.driver(p);check(driver>=previous && driver<=8190,"extension monotonic/bounded");previous=driver; }
        check(BrightnessRange.allowedCaller(1000,10123,"com.android.settings",new String[]{"com.android.settings"}),"verified settings caller");
        check(!BrightnessRange.allowedCaller(10124,10123,"com.android.settings",new String[]{"other.app"}),"claimed package denied");
        check(!BrightnessRange.allowedCaller(101000,10123,"com.android.systemui",new String[]{"com.android.systemui"}),"cross-user denied");
        check(!BrightnessRange.allowedCaller(2000,10123,"com.android.shell",new String[]{"com.android.shell"}),"shell cannot call root bridge");
        System.out.println("PASS brightness range, round trips, limits and caller authorization");
    }
}
