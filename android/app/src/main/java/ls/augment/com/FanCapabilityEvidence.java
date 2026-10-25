package ls.augment.com;

/** Capability evidence shared by the editor, provider and injected SystemUI. */
public final class FanCapabilityEvidence {
    public static final String LEVELS="ls_augment_fan_control_installed";
    public static final String SCREEN="ls_augment_fan_screen_off_installed";
    public static boolean levels(String evidence,String hardware) {
        return matches(evidence,hardware)&&token(evidence,"capability=verified_levels_1_5")
                &&token(evidence,"level_writes=1")&&token(evidence,"fan_enable_writes=0");
    }
    public static boolean screen(String evidence,String hardware) {
        return matches(evidence,hardware)&&token(evidence,"scope=running_session")&&token(evidence,"hooks=2");
    }
    private static boolean matches(String evidence,String hardware) {
        return hardware!=null&&!hardware.isEmpty()&&!"unavailable".equals(hardware)
                &&token(evidence,"hardware_identity="+hardware);
    }
    private static boolean token(String evidence,String token) {
        if(evidence==null)return false;
        for(String value:evidence.split(";"))if(value.equals(token))return true;
        return false;
    }
    private FanCapabilityEvidence(){}
}
