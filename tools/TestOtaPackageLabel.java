package ls.augment.com;

public final class TestOtaPackageLabel {
    private static int checks;
    public static void main(String[] args){
        OtaPackageLabel current=label("LZGcjUJG_GEN_CN_NX809SV1.0.0B07MR1_TO_GEN_CN_NX809SV1.0.0B10MR1.up");
        check(current.title.equals("系统更新 · B07MR1 → B10MR1"),"Readable upgrade versions, without random prefix or extension");
        check(current.details.equals("中国版 · 固件分支 NX809S · 基础版本 V1.0.0"),"Keep branch, region and base; do not claim a device model");
        check(!current.details.contains("NX809J")&&!current.title.contains("11.5"),"No invented device or marketing-version conversion");
        OtaPackageLabel major=label("GEN_CN_NX809SV1.0.0B10_TO_GEN_CN_NX809SV2.0.0B01.zip");
        check(major.title.equals("系统更新 · V1.0.0B10 → V2.0.0B01"),"Changed version bases remain visible");
        OtaPackageLabel branches=label("GEN_CN_NX809JV1.0.0B01_TO_GEN_EEA_NX809SV1.0.0B02.up");
        check(branches.details.contains("中国版 → 地区 EEA")&&branches.details.contains("NX809J → NX809S"),"Different branches and regions are never hidden");
        OtaPackageLabel single=label("prefix_GEN_CN_NX809SV1.0.0B10MR1.up");
        check(single.title.equals("系统包 · B10MR1")&&!single.details.contains("完整"),"Single version does not prove a full update");
        check(label("gen_cn_nx809sv1.0.0b07mr1_to_gen_cn_nx809sv1.0.0b10mr1.UP").title.equals(current.title),"Case variants keep the same meaning");
        OtaPackageLabel unknown=label("vendor_special_package.zip");
        check(unknown.title.equals("vendor special package")&&unknown.details.equals("来源：updates.example.com"),"Unknown names are readable without fabricated version metadata");
        check(label("download.do").title.equals("系统更新包"),"Download endpoint is not shown as a package name");
        check(label("").title.equals("系统更新包"),"Missing filename has a useful fallback");
        check(label("broken_TO_GEN_CN_NX809SV1.0.0B10.up").title.startsWith("broken →"),"Incomplete source version is not silently discarded");
        check(!label("name\nwith\rcontrols.zip").title.contains("\n"),"Decoded control characters cannot add misleading lines");
        System.out.println("OtaPackageLabel: "+checks+" checks passed");
    }
    private static OtaPackageLabel label(String name){return OtaPackageLabel.describe(name,"updates.example.com");}
    private static void check(boolean pass,String message){checks++;if(!pass)throw new AssertionError(message);}
}
