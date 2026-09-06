package ls.augment.com;

import java.util.Map;

/** Mirrors the target app's maximum-per-source merge within an aggregation interval. */
public final class StepMath {
    private StepMath() { }
    public static int multiply(int original, int percent) {
        if(original<0||percent<100||percent>2000)throw new IllegalArgumentException("step range");
        return (int)Math.min(Integer.MAX_VALUE,(long)original*percent/100);
    }
    public static long merged(Map<String,Long> sourceTotals) {
        long maximum=0;
        for(long value:sourceTotals.values()) {
            if(value<0)throw new IllegalArgumentException("negative source");
            maximum=Math.max(maximum,value);
        }
        return maximum;
    }
    public static int phoneAddition(Map<String,Long> natural, String phone, int bonus) {
        if(bonus<0)throw new IllegalArgumentException("negative bonus");
        long result=Math.addExact(merged(natural)-natural.getOrDefault(phone,0L),bonus);
        if(result>Integer.MAX_VALUE)throw new IllegalArgumentException("step overflow");
        return (int)result;
    }
}
