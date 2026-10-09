package ls.augment.com;

/** Bounded, content-free layout failure telemetry. It does not decide capacity. */
public final class StatusBarWifiBudgetDiagnostic {
    public static final String PREFIX="ls_augment_statusbar_wifi_asset_budget_";
    private String detail="",reported="";
    private long reportedAt=Long.MIN_VALUE;

    public void capture(String reason,int vertical,int consumed,int limit,String parent,String branch,String blocker){
        capture(reason,vertical,consumed,limit,parent,branch,blocker,null);
    }
    public void capture(String reason,int vertical,int consumed,int limit,String parent,String branch,String blocker,String widthOrigin){
        detail="WAB1;reason="+token(reason,24)+";vertical="+vertical+";consumed="+consumed+";limit="+limit
                +";parent={"+token(parent,460)+"};branch={"+token(branch,460)+"};blocker={"+token(blocker,460)+"};widthOrigin={"+token(widthOrigin,360)+"}";
    }
    /** Changed animated geometry is coalesced; unchanged geometry performs no I/O. */
    public String pending(String surface,int rotation,String id,long now,int build){
        String key=key(surface,rotation,id);
        if(key==null||detail.isEmpty())return null;
        String signature=key+'|'+detail;
        if(signature.equals(reported)||reportedAt!=Long.MIN_VALUE&&now>=reportedAt&&now-reportedAt<2000)return null;
        reported=signature;reportedAt=now;
        return detail+";build="+build+";uptime="+now;
    }
    public static String key(String surface,int rotation,String id){
        if(surface==null||!surface.matches("main|lock|control|notification")||rotation<0||rotation>3||id==null)return null;
        String owner=id.startsWith("secondary_wifi.")?"secondary_wifi":id.startsWith("wifi.")?"wifi":null;
        return owner==null?null:PREFIX+surface+'_'+rotation+'_'+owner;
    }
    private static String token(String value,int limit){
        if(value==null)return "none";
        String clean=value.replace(';',',').replace('{','(').replace('}',')').replace('\n',' ').replace('\r',' ');
        return clean.length()<=limit?clean:clean.substring(0,limit);
    }
}
