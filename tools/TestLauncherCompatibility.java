package ls.augment.com;

public final class TestLauncherCompatibility {
    private static LauncherCompatibility.Status check(String model,int sdk,String rom,boolean installed,
            boolean system,String version,String cert,boolean permissions,String error){
        return LauncherCompatibility.evaluate(model,sdk,true,rom,installed,system,version,160000,cert,permissions,error).status;
    }
    private static LauncherCompatibility.Status checkVersion(String version,long code,String cert){
        return LauncherCompatibility.evaluate("NX809J",36,true,"RedMagicOS11.5.7MR1",true,true,version,code,cert,true,"").status;
    }
    private static void expect(LauncherCompatibility.Status expected,LauncherCompatibility.Status actual){
        if(expected!=actual)throw new AssertionError(expected+" != "+actual);
    }
    public static void main(String[] args){
        String version=LauncherCompatibility.VERSION,cert=LauncherCompatibility.OEM_CERT,rom="RedMagicOS11.5.7MR1";
        expect(LauncherCompatibility.Status.BASELINE_MATCH,check("NX809J",36,rom,true,true,version,cert,true,""));
        expect(LauncherCompatibility.Status.UNVERIFIED,check("NX809J",36,"RedMagicOS11.5.7MR2",true,true,version,cert,true,""));
        expect(LauncherCompatibility.Status.UNVERIFIED,check("NX999J",36,rom,true,true,version,cert,true,""));
        expect(LauncherCompatibility.Status.UNVERIFIED,check("NX809J",36,rom,true,true,version,"modified",true,""));
        expect(LauncherCompatibility.Status.UNVERIFIED,check("NX809J",36,rom,false,false,version,"",false,"permission denied"));
        expect(LauncherCompatibility.Status.MISMATCH,check("NX809J",36,rom,false,false,version,cert,false,""));
        expect(LauncherCompatibility.Status.MISMATCH,check("NX809J",36,rom,true,true,"other",cert,true,""));
        expect(LauncherCompatibility.Status.MISMATCH,check("NX809J",36,rom,true,true,version,cert,false,""));
        expect(LauncherCompatibility.Status.MISMATCH,check("NX809J",30,rom,true,true,version,cert,true,""));
        expect(LauncherCompatibility.Status.MISMATCH,check("NX809J",36,rom,true,false,version,cert,true,""));
        expect(LauncherCompatibility.Status.MISMATCH,LauncherCompatibility.evaluate("NX809J",36,false,rom,true,true,version,160000,cert,true,"").status);
        String modified=LauncherCompatibility.MODIFIED_VERSION;
        expect(LauncherCompatibility.Status.UNVERIFIED,checkVersion(modified,260000,"modified"));
        expect(LauncherCompatibility.Status.UNVERIFIED,checkVersion(modified,260001,"modified"));
        expect(LauncherCompatibility.Status.UNVERIFIED,checkVersion(modified,260000,cert));
        expect(LauncherCompatibility.Status.MISMATCH,checkVersion(modified,259999,"modified"));
        expect(LauncherCompatibility.Status.MISMATCH,checkVersion(version,260000,cert));
        expect(LauncherCompatibility.Status.MISMATCH,checkVersion("other",260000,"modified"));
        expect(LauncherCompatibility.Status.MISMATCH,checkVersion(modified+"-other",260000,"modified"));
        expect(LauncherCompatibility.Status.MISMATCH,checkVersion(null,260000,"modified"));
        String original12=LauncherCompatibility.REDMAGIC12_VERSION;
        String modified12=LauncherCompatibility.REDMAGIC12_MODIFIED_VERSION;
        String cert12=LauncherCompatibility.REDMAGIC12_OEM_CERT;
        // Even the accepted 11 device/ROM tuple must never validate a 12 package.
        expect(LauncherCompatibility.Status.UNVERIFIED,checkVersion(original12,170000,cert12));
        expect(LauncherCompatibility.Status.UNVERIFIED,checkVersion(original12,170000,cert));
        expect(LauncherCompatibility.Status.UNVERIFIED,checkVersion(modified12,270001,"modified"));
        expect(LauncherCompatibility.Status.UNVERIFIED,checkVersion(modified12,270002,cert12));
        expect(LauncherCompatibility.Status.MISMATCH,checkVersion(modified12,270000,"modified"));
        expect(LauncherCompatibility.Status.MISMATCH,checkVersion(original12,270001,cert12));
        expect(LauncherCompatibility.Status.MISMATCH,checkVersion(modified12+"-other",270001,"modified"));
        expect(LauncherCompatibility.Status.UNVERIFIED,LauncherCompatibility.evaluate("unknown",37,true,"unknown",true,true,original12,170000,cert12,true,"").status);
        expect(LauncherCompatibility.Status.MISMATCH,LauncherCompatibility.evaluate("unknown",37,true,"unknown",true,true,modified12,270001,"modified",false,"").status);
        expect(LauncherCompatibility.Status.MISMATCH,LauncherCompatibility.evaluate("unknown",37,true,"unknown",true,false,original12,170000,cert12,true,"").status);
        expect(LauncherCompatibility.Status.MISMATCH,LauncherCompatibility.evaluate("unknown",37,false,"unknown",true,true,original12,170000,cert12,true,"").status);
        LauncherCompatibility.Result recognized12=LauncherCompatibility.evaluate("unknown",37,true,"unknown",true,true,original12,170000,cert12,true,"");
        if(recognized12.reasons.isEmpty()||!recognized12.reasons.get(0).contains("尚无实机验证"))throw new AssertionError("12 verification boundary missing");
        System.out.println("PASS launcher compatibility: 11 baseline retained; OEM12 and 270001+ recognized but unverified; version, permission, system and ABI mismatches rejected");
    }
}
