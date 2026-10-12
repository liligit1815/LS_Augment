import java.util.*;
import ls.augment.com.ConnectivityIconState;
import ls.augment.com.ConnectivityIconLayout;
import ls.augment.com.CircleConnectivityPlan;
import ls.augment.com.StatusBarIconSpacingSpec;

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
    private static void sameBox(float[] actual,float[] expected,String message){
        for(int i=0;i<actual.length;i++)check(Math.abs(actual[i]-expected[i])<.001f,message+" coordinate "+i);
    }
    private static void circleRoleGeometry(){
        ConnectivityIconState onSim1=state(2,1,false,Arrays.asList(new ConnectivityIconState.Sim(2,0,3,5),new ConnectivityIconState.Sim(1,1,4,4)));
        ConnectivityIconState onSim2=state(1,2,false,Arrays.asList(new ConnectivityIconState.Sim(2,0,4,4),new ConnectivityIconState.Sim(1,1,3,5)));
        for(int region=0;region<3;region++)for(int rows:new int[]{1,2}){
            sameBox(ConnectivityIconLayout.signalBox(onSim2,region,rows==1?0:1,1,rows,1),ConnectivityIconLayout.signalBox(onSim1,region,0,0,rows,1),"data role keeps its circle arc after switching physical slot");
            sameBox(ConnectivityIconLayout.signalBox(onSim2,region,0,0,rows,1),ConnectivityIconLayout.signalBox(onSim1,region,rows==1?0:1,1,rows,1),"other role keeps its circle arc after switching physical slot");
        }
        for(String content:new String[]{"data","dual"}){
            String[] contents={"none","none",content};int[] scales={100,100,100};
            float first=ConnectivityIconLayout.signalGap(onSim1,contents,scales,6,new ConnectivityIconLayout());
            float second=ConnectivityIconLayout.signalGap(onSim2,contents,scales,6,new ConnectivityIconLayout());
            check(Math.abs(first-second)<.001f,"circle cutout uses selected data/other bar counts rather than physical index zero: "+content);
        }
        for(int region=0;region<3;region++)for(String content:new String[]{"data","other","dual"}){
            String[] contents={"none","none","none"};contents[region]=content;
            CircleConnectivityPlan reference=CircleConnectivityPlan.create(100,1,onSim1,contents,new int[]{100,100,100},6,new ConnectivityIconLayout(),id->StatusBarIconSpacingSpec.ZERO,false,Collections.emptyList(),null,200,200,false,false);
            CircleConnectivityPlan changed=CircleConnectivityPlan.create(100,1,onSim2,contents,new int[]{100,100,100},6,new ConnectivityIconLayout(),id->StatusBarIconSpacingSpec.ZERO,false,Collections.emptyList(),null,200,200,false,false);
            check(reference.accepted&&changed.accepted,"both role assignments retain valid measured circle cells");
            if(!content.equals("other")){
                CircleConnectivityPlan.Box a=reference.cell(region,0).glyph,b=changed.cell(region,1).glyph;
                sameBox(new float[]{a.left,a.top,a.right,a.bottom},new float[]{b.left,b.top,b.right,b.bottom},"measured data cell follows subscription on its original arc");
            }
            if(!content.equals("data")){
                CircleConnectivityPlan.Box a=reference.cell(region,1).glyph,b=changed.cell(region,0).glyph;
                sameBox(new float[]{a.left,a.top,a.right,a.bottom},new float[]{b.left,b.top,b.right,b.bottom},"measured other cell follows subscription on its original arc");
            }
        }
    }
    public static void main(String[] args){
        List<ConnectivityIconState.Sim> sims=Arrays.asList(sim(101,0,1,true),sim(220,1,2,true));
        ConnectivityIconState first=state(220,101,false,sims);
        check(first.activeDataSubscription==220&&first.defaultDataSubscription==101,"active data differs from user preference");
        check(first.sims.get(0).subscriptionId==101&&first.sims.get(1).subscriptionId==220,"physical SIM slots retain a fixed row order");
        check(first.simForSlot(0).subscriptionId==101&&first.simForSlot(1).subscriptionId==220,"fixed SIM styles retain slot identity");
        check(first.simForSubscription(101).activityIn()&&!first.simForSubscription(101).activityOut(),"SIM 1 download does not inherit SIM 2 upload");
        check(first.dataActivity(220)==2&&first.dataActivity(101)==1,"activity belongs to subscription");
        check(first.activeDataSim().slot==1&&first.activeDataRow()==1&&first.otherDataRow()==0,"data and other roles use active subscription rather than row priority");
        ConnectivityIconState switched=state(101,101,false,sims);
        check(switched.activeDataSim().slot==0&&switched.activeDataRow()==0&&switched.otherDataRow()==1&&switched.sims.get(1).subscriptionId==220,"switching data changes its role while both physical rows stay fixed");
        check(switched.dataActivity(220)==2,"switching data does not move per-subscription callbacks");
        ConnectivityIconState.Sim sim1=sim(2,0,1,true),sim2=sim(1,1,2,true);
        for(List<ConnectivityIconState.Sim> input:Arrays.asList(Arrays.asList(sim2,sim1),Arrays.asList(sim1,sim2))){
            for(int active:new int[]{2,1,2}){
                ConnectivityIconState stable=state(active,active==2?1:2,false,input);
                check(stable.sims.get(0)==sim1&&stable.sims.get(1)==sim2,"reversed subscription IDs and callback order cannot swap physical rows");
                check(stable.activeDataRow()==(active==2?0:1)&&stable.otherDataRow()==(active==2?1:0),"data/other roles move to the actual active subscription");
                check(stable.activeDataSim().subscriptionId==active&&stable.activeDataSim().slot==(active==2?0:1),"preferred data subscription never overrides active identity");
                check(stable.dataActivity(2)==1&&stable.dataActivity(1)==2,"both activity streams retain their own subscription");
                check(stable.litDots(0)==4&&stable.litDots(1)==2,"each fixed row retains its independent strength");
            }
        }
        ConnectivityIconState removed=state(1,2,false,Collections.singletonList(sim1));
        check(removed.sims.size()==1&&removed.sims.get(0)==sim1&&removed.activeDataRow()==-1,"removing active SIM2 cannot relabel SIM1 as data");
        ConnectivityIconState reinserted=state(1,2,false,Arrays.asList(sim2,sim1));
        check(reinserted.sims.get(0)==sim1&&reinserted.sims.get(1)==sim2&&reinserted.activeDataRow()==1,"reinserting SIM2 restores physical order and its data role");
        ConnectivityIconState loneSim2=state(1,2,false,Collections.singletonList(sim2));
        check(loneSim2.sims.get(0).slot==1&&loneSim2.activeDataRow()==0,"single visible SIM keeps physical identity while using one render row");
        ConnectivityIconState invalid=state(99,2,false,Arrays.asList(sim1,sim(99,-1,3,true),sim2));
        check(invalid.sims.size()==2&&invalid.activeDataRow()==-1,"invalid slot cannot borrow a physical row or become an activity owner");
        ConnectivityIconState.Sim refreshed=sim(2,0,3,true);
        ConnectivityIconState duplicate=state(1,2,false,Arrays.asList(sim1,sim2,refreshed));
        check(duplicate.sims.size()==2&&duplicate.sims.get(0)==refreshed&&duplicate.sims.get(1)==sim2,"latest callback replaces one subscription without moving its physical row");
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
        circleRoleGeometry();
        System.out.println("PASS connectivity identity and state: "+checks+" checks");
    }
}
