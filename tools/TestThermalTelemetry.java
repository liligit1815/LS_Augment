import ls.augment.com.ThermalTelemetry;

public final class TestThermalTelemetry {
    private static void check(boolean condition){if(!condition)throw new AssertionError();}
    public static void main(String[] args){
        double[] value=ThermalTelemetry.parse("cpu-hw-trip-0|105000\ncpu-0-1|40200\ncpullc-0|39000\ngpuss-0|36500\ngpu-1|38\ncpu_limit|120000\nnoise|99000\ncpu-2|NaN\ngpu-2|999000");
        check(value[0]==40.2&&value[1]==38);
        value=ThermalTelemetry.parse("cpu-0|-1000\ngpu-0|garbage");check(value[0]==-1&&Double.isNaN(value[1]));
        check(Double.isNaN(ThermalTelemetry.parse("")[0]));
        System.out.println("PASS: real thermal readings, units, missing data and trip-node exclusion");
    }
}
