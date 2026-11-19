package ls.augment.com;

/** A single real charging presentation. Native timeout observation is independent of custom deadlines. */
public final class IslandChargeLifetime {
    private final long started;
    private boolean live=true,nativeExpired;
    public IslandChargeLifetime(long started){this.started=started;}
    /** Native invocation may be postponed; callers must keep the original source identity. */
    public boolean nativeTimeout(int mode,int seconds,long now){
        if(!live)return true;
        nativeExpired=true;
        return shouldFinish(mode,seconds,now);
    }
    /** A custom timer never pretends that the OEM's original timer has elapsed. */
    public boolean shouldFinish(int mode,int seconds,long now){
        if(!live||now<started)return false;
        if(mode==IslandChargeConfig.SYSTEM)return nativeExpired;
        if(mode==IslandChargeConfig.PERSISTENT)return false;
        return now>=deadline(seconds);
    }
    public long remaining(int mode,int seconds,long now){
        if(!live||now<started||mode!=IslandChargeConfig.CUSTOM)return -1;
        return Math.max(0,deadline(seconds)-now);
    }
    public boolean nativeExpired(){return nativeExpired;}
    public void finish(){live=false;}
    private long deadline(int seconds){
        long millis=(long)Math.max(1,Math.min(86400,seconds))*1000;
        return started>Long.MAX_VALUE-millis?Long.MAX_VALUE:started+millis;
    }
}
