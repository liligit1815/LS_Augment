package ls.augment.com;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Describes only filename evidence; never maps a firmware branch to a device or marketing OS version. */
final class OtaPackageLabel {
    private static final String VERSION="GEN_([A-Z]{2,5})_(NX[0-9]{3,5}[A-Z]*)(V[0-9]+(?:\\.[0-9]+)*)(B[0-9]+[A-Z0-9]*)";
    private static final String EXTENSION="(?:\\.(?:up|zip|bin))?$";
    private static final Pattern UPGRADE=Pattern.compile("(?:^|_)"+VERSION+"_TO_"+VERSION+EXTENSION,Pattern.CASE_INSENSITIVE);
    private static final Pattern PACKAGE=Pattern.compile("(?:^|_)"+VERSION+EXTENSION,Pattern.CASE_INSENSITIVE);
    final String title,details;
    private OtaPackageLabel(String title,String details){this.title=title;this.details=details;}

    static OtaPackageLabel describe(String filename,String host){
        String name=filename==null?"":filename.replaceAll("[\\p{Cntrl}]"," ").trim();
        Matcher upgrade=UPGRADE.matcher(name);
        if(upgrade.find()){
            String region=upper(upgrade,1),branch=upper(upgrade,2),base=upper(upgrade,3),from=upper(upgrade,4);
            String nextRegion=upper(upgrade,5),nextBranch=upper(upgrade,6),nextBase=upper(upgrade,7),to=upper(upgrade,8);
            boolean sameBase=base.equals(nextBase);
            String versions=sameBase?from+" → "+to:base+from+" → "+nextBase+to;
            String regions=region.equals(nextRegion)?region(region):region(region)+" → "+region(nextRegion);
            String branches=branch.equals(nextBranch)?branch:branch+" → "+nextBranch;
            return new OtaPackageLabel("系统更新 · "+versions,regions+" · 固件分支 "+branches+(sameBase?" · 基础版本 "+base:""));
        }
        // A lone version does not prove that the payload is a full update package.
        Matcher single=PACKAGE.matcher(name);
        if(!name.toUpperCase(Locale.ROOT).contains("_TO_")&&single.find())
            return new OtaPackageLabel("系统包 · "+upper(single,4),region(upper(single,1))+" · 固件分支 "+upper(single,2)+" · 基础版本 "+upper(single,3));
        String readable=name.replaceFirst("(?i)\\.(up|zip|bin)$","").replaceAll("(?i)_TO_"," → ").replace('_',' ').replaceAll(" +"," ").trim();
        if(readable.isEmpty()||readable.equalsIgnoreCase("download.do")||readable.equalsIgnoreCase("payload"))readable="系统更新包";
        return new OtaPackageLabel(readable,host==null||host.isEmpty()?"版本信息未包含在链接中":"来源："+host);
    }
    private static String upper(Matcher match,int group){return match.group(group).toUpperCase(Locale.ROOT);}
    private static String region(String value){return "CN".equals(value)?"中国版":"地区 "+value;}
}
