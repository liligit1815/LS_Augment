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
        System.out.println("PASS launcher preflight: original baseline, modified version and incremented build remain unverified, mismatched versions, unknown ROM/model/signature, missing package/permissions/ABI and read failures");
    }
}
