package ls.augment.com;

/** Only standard source progress, never a percentage inferred from a title or elapsed time. */
public final class IslandNotificationProgress {
    public static final IslandNotificationProgress NONE=new IslandNotificationProgress(false,false,0,0);
    public final boolean present,indeterminate;
    public final int value,maximum,percent;
    private IslandNotificationProgress(boolean present,boolean indeterminate,int value,int maximum){
        this.present=present;this.indeterminate=indeterminate;this.value=value;this.maximum=maximum;
        this.percent=present&&!indeterminate?(int)((long)value*100/maximum):-1;
    }
    public static IslandNotificationProgress of(Object value,Object maximum,Object indeterminate){
        if(Boolean.TRUE.equals(indeterminate))return new IslandNotificationProgress(true,true,0,0);
        if(indeterminate!=null&&!(indeterminate instanceof Boolean))return NONE;
        if(!(value instanceof Integer)||!(maximum instanceof Integer))return NONE;
        int current=(Integer)value,total=(Integer)maximum;
        if(current<0||total<=0||current>total)return NONE;
        return new IslandNotificationProgress(true,false,current,total);
    }
    public String text(){return !present||indeterminate?"":percent+"%";}
    public String status(){return !present?"":indeterminate?"进行中":text();}
    public Object identity(){return java.util.List.of(present,indeterminate,value,maximum);}
    public Object displayIdentity(){return java.util.List.of(present,indeterminate,percent);}
}
