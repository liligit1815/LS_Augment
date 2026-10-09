import java.util.*;
import ls.augment.com.ConnectivityIconState;

/** Identity survives visual ordering, active-data switches and incomplete callbacks. */
public final class TestConnectivityIconState {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static ConnectivityIconState.Sim sim(int id,int slot,int activity,boolean connected){
        return new ConnectivityIconState.Sim(id,slot,slot==0?4:2,4,true,true,false,true,connected,activity,true,13);
    }
    private static ConnectivityIconState state(int active,int preferred,boolean airplane,List<ConnectivityIconState.Sim> sims){
        return new ConnectivityIconState(75,ConnectivityIconState.PowerState.NONE,true,true,2,airplane,active,preferred,sims);
    }
    public static void main(String[] args){
        List<ConnectivityIconState.Sim> sims=Arrays.asList(sim(101,0,1,true),sim(220,1,2,true));
        ConnectivityIconState first=state(220,101,false,sims);
        check(first.activeDataSubscription==220&&first.defaultDataSubscription==101,"active data differs from user preference");
        check(first.sims.get(0).subscriptionId==220,"current data SIM leads the composite layout");
        check(first.simForSlot(0).subscriptionId==101&&first.simForSlot(1).subscriptionId==220,"fixed SIM styles retain slot identity");
        check(first.simForSubscription(101).activityIn()&&!first.simForSubscription(101).activityOut(),"SIM 1 download does not inherit SIM 2 upload");
        check(first.dataActivity(220)==2&&first.dataActivity(101)==1,"activity belongs to subscription");
        check(first.activeDataSim().slot==1&&first.otherDataRow()==1,"data and other roles use active subscription");
        ConnectivityIconState switched=state(101,101,false,sims);
        check(switched.activeDataSim().slot==0&&switched.sims.get(1).subscriptionId==220,"switching data reorders views without changing identities");
        check(switched.dataActivity(220)==2,"switching default visual order does not move callbacks");
        ConnectivityIconState unknown=state(-1,101,false,sims);
        check(unknown.activeDataSim()==null&&unknown.activeDataRow()==-1&&unknown.otherDataRow()==-1,"unknown active data never falls back to the preferred SIM");
        ConnectivityIconState filtered=state(220,101,false,Collections.singletonList(sims.get(0)));
        check(filtered.activeDataRow()==-1&&filtered.otherDataRow()==0,"hidden data SIM does not relabel the remaining SIM as data");
        check(state(220,101,true,sims).dataActivity(220)==0,"airplane mode suppresses stale activity");
        check(sim(101,0,3,false).dataActivity==0,"disconnected radio suppresses stale activity");
        ConnectivityIconState.Sim unread=new ConnectivityIconState.Sim(101,0,-1,5);
        check(!unread.serviceKnown&&!unread.activityKnown&&!unread.dataConnectionKnown&&unread.level==-1,"unread source remains distinct from disconnected");
        check(!ConnectivityIconState.unknown().wifiKnown&&ConnectivityIconState.unknown().battery==-1,"unread WiFi/battery remain unknown");
        ConnectivityIconState wifi=new ConnectivityIconState(50,ConnectivityIconState.PowerState.NONE,true,true,4,4,false,-1,-1,sims);
        check(wifi.wifiLevel==4&&wifi.wifiBars==4,"WiFi preserves the framework's signal scale instead of clamping it to three");
        check(ConnectivityIconState.powerState(false,true,1)==ConnectivityIconState.PowerState.NONE,"unplug clears stale power mode");
        check(ConnectivityIconState.powerState(true,false,1)==ConnectivityIconState.PowerState.BYPASS,"bypass need not report charging");
        check(ConnectivityIconState.powerState(true,false,0)==ConnectivityIconState.PowerState.NONE,"paused charge is not bypass");
        System.out.println("PASS connectivity identity and state: "+checks+" checks");
    }
}
