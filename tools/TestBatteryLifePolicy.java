package ls.augment.com;
public final class TestBatteryLifePolicy {
    public static void main(String[] args) {
        String source="# Battery lifetime\nzbl,enable = <1>\nzbl,reduce-fcv-enable = <1>\nzbl,cycle-count = <200 300 500>\nzbl,fcv-cut-table = <30 50 80>\n";
        String changed=BatteryLifePolicy.disableReduction(source);
        check(Boolean.FALSE.equals(BatteryLifePolicy.reductionEnabled(changed)),"age voltage reduction disabled");
        check(changed.equals(source.replace("reduce-fcv-enable = <1>","reduce-fcv-enable = <0>")),"only the explicit age flag changes");
        check(changed.equals(BatteryLifePolicy.disableReduction(changed)),"idempotent");
        check(BatteryLifePolicy.reductionEnabled(source+"zbl,reduce-fcv-enable = <0>\n")==null,"conflicting duplicate flags rejected");
        check(BatteryLifePolicy.disableReduction("unknown vendor layout")==null,"unknown layout not changed");
        check(Long.valueOf(170).equals(BatteryLifePolicy.lastRecordedCycles("DATE:2025-09-01; 1:0;\n#\nDATE:2026-09-04; 1:170;")),"latest OEM persistent record");
        check(BatteryLifePolicy.lastRecordedCycles("no data")==null,"missing is not zero");
        System.out.println("PASS TestBatteryLifePolicy");
    }
    static void check(boolean ok,String name){if(!ok)throw new AssertionError(name);}
}
