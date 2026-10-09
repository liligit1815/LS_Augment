package ls.augment.regression.island;

/** Command admission only; no I/O and no Android dependency. Used by the actual fixture. */
final class IslandFixtureProtocol {
    static final int REJECT=0,ACCEPT=1,EXPIRED=2;
    private IslandFixtureProtocol(){}
    static boolean identity(String value){return value!=null&&value.matches("[a-f0-9]{32}");}
    static boolean known(String c){return "play".equals(c)||"pause".equals(c)||"stop".equals(c)||"release".equals(c)
            ||"notice-expiry".equals(c)||"notice-click".equals(c)||"finish".equals(c)||"observe".equals(c);}
    static int admit(String run,String secret,int sequence,long deadline,boolean closed,
            String receivedRun,String receivedSecret,int next,String command,long now){
        if(closed||!identity(run)||!identity(secret)||!run.equals(receivedRun)||!secret.equals(receivedSecret)
                ||sequence<0||sequence>=Integer.MAX_VALUE||next!=sequence+1||!known(command))return REJECT;
        return now>=deadline?EXPIRED:ACCEPT;
    }
    static long notificationTimeout(long deadline,long now){return Math.max(1,deadline-now);}
}
