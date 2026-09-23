package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Pre-install comparison with this repository's OEM launcher baseline, not a boot guarantee. */
public final class LauncherCompatibility {
    public static final String PACKAGE = "com.zte.mifavor.launcher";
    public static final String VERSION = "16.0.010.000.2604151532";
    public static final String MODIFIED_VERSION = "26.9.260.908.2609081608";
    public static final long MODIFIED_MIN_VERSION_CODE = 260000;
    public static final String OEM_CERT = "d7bb72ea42adfcadf52c3d641b2b40181d6a36932a81c93207db172811ca46b7";
    public enum Status { BASELINE_MATCH, MISMATCH, UNVERIFIED }
    public static final class Result {
        public final Status status;
        public final List<String> reasons;
        Result(Status status,List<String> reasons){this.status=status;this.reasons=Collections.unmodifiableList(reasons);}
    }
    private LauncherCompatibility() { }
    public static Result evaluate(String model,int sdk,boolean arm64,String rom,
            boolean installed,boolean systemApp,String version,long code,String certificate,
            boolean permissions,String readError) {
        List<String> reasons=new ArrayList<>();
        if(readError!=null&&!readError.isEmpty()){
            reasons.add("读取未完成："+readError);return new Result(Status.UNVERIFIED,reasons);
        }
        if(!installed)reasons.add("未找到红魔原厂桌面，不能将此包作为普通桌面直接安装。");
        if(!arm64)reasons.add("设备不提供 arm64-v8a 运行环境。");
        if(sdk<31)reasons.add("Android 版本低于桌面安装包要求。");
        if(installed&&!systemApp)reasons.add("当前桌面不是系统应用，缺少原厂系统集成条件。");
        if(installed&&!permissions)reasons.add("当前桌面缺少最近任务必需的系统权限。");
        boolean originalVersion=VERSION.equals(version)&&code==160000;
        boolean modifiedVersion=MODIFIED_VERSION.equals(version)&&code>=MODIFIED_MIN_VERSION_CODE;
        if(installed&&!originalVersion&&!modifiedVersion)reasons.add("桌面版本不在当前记录中：原厂底包为 "+VERSION+"（160000），修改版为 "+MODIFIED_VERSION+"（"+MODIFIED_MIN_VERSION_CODE+" 起）。");
        if(!reasons.isEmpty())return new Result(Status.MISMATCH,reasons);
        if(!"NX809J".equals(model))reasons.add("此机型尚无本项目的匹配验证记录。");
        if(sdk!=36||!"RedMagicOS11.5.7MR1".equals(rom))reasons.add("此系统版本尚未验证；同一机型的 MR2 等更新不能沿用 MR1 的结论。");
        if(modifiedVersion)reasons.add("已识别修改版桌面版本标识；标识本身不能证明安装包内容与兼容性，仍需实际验证。");
        if(!OEM_CERT.equals(certificate))reasons.add("当前桌面不是已记录的原厂签名，无法据此确认原厂底包；已安装修改版也属于此情况。");
        if(!reasons.isEmpty())return new Result(Status.UNVERIFIED,reasons);
        reasons.add("机型、系统、桌面版本、原厂签名及关键权限与已记录基准一致。");
        reasons.add("静态检测不能证明开机、手势和桌面数据迁移一定成功，安装前仍需保留原厂恢复包。");
        return new Result(Status.BASELINE_MATCH,reasons);
    }
}
