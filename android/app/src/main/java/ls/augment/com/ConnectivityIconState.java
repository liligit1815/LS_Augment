package ls.augment.com;

import java.util.*;

/** Immutable radio/battery presentation with each SIM's native signal scale. */
public final class ConnectivityIconState {
    public enum PowerState { NONE, CHARGING, BYPASS }
    public enum WifiInternet { UNKNOWN, VALIDATED, NO_INTERNET }
    public static PowerState powerState(boolean plugged,boolean charging,int separation){
        if(!plugged)return PowerState.NONE;
        return separation==1?PowerState.BYPASS:charging?PowerState.CHARGING:PowerState.NONE;
    }
    public static final class Sim {
        public final int subscriptionId, slot, level, bars;
        public final int dataActivity, networkType;
        public final boolean serviceKnown, inService, roaming, dataConnectionKnown, dataConnected, activityKnown;
        public Sim(int subscriptionId,int slot,int level){this(subscriptionId,slot,level,4);}
        public Sim(int subscriptionId,int slot,int level,int bars){
            this(subscriptionId,slot,level,bars,false,false,false,false,false,0,false,0);
        }
        public Sim(int subscriptionId,int slot,int level,int bars,boolean serviceKnown,
                boolean inService,boolean roaming,boolean dataConnectionKnown,boolean dataConnected,
                int dataActivity,boolean activityKnown,int networkType){
            this.subscriptionId=subscriptionId;this.slot=slot;this.bars=bars==5?5:4;
            this.level=level<0?-1:Math.min(this.bars,level);
            this.serviceKnown=serviceKnown;this.inService=inService;this.roaming=serviceKnown&&roaming;
            this.dataConnectionKnown=dataConnectionKnown;this.dataConnected=dataConnectionKnown&&dataConnected;
            this.activityKnown=activityKnown;
            this.dataActivity=activityKnown&&(!dataConnectionKnown||dataConnected)&&dataActivity>=0&&dataActivity<=4?dataActivity:0;
            this.networkType=Math.max(0,networkType);
        }
        public boolean activityIn(){return dataActivity==1||dataActivity==3;}
        public boolean activityOut(){return dataActivity==2||dataActivity==3;}
    }
    public final int battery, wifiLevel,wifiBars;
    public final int activeDataSubscription, defaultDataSubscription;
    public final boolean wifiKnown;
    public final WifiInternet wifiInternet;
    public final boolean charging, bypassCharging, wifiConnected, airplane;
    public final List<Sim> sims;
    public ConnectivityIconState(int battery,boolean charging,boolean wifiConnected,int wifiLevel,
            boolean airplane,int dataSubscription,List<Sim> input){
        this(battery,charging?PowerState.CHARGING:PowerState.NONE,wifiConnected,wifiLevel,airplane,dataSubscription,input);
    }
    public ConnectivityIconState(int battery,PowerState power,boolean wifiConnected,int wifiLevel,
            boolean airplane,int dataSubscription,List<Sim> input){
        this(battery,power,true,wifiConnected,wifiLevel,airplane,dataSubscription,dataSubscription,input);
    }
    public ConnectivityIconState(int battery,PowerState power,boolean wifiKnown,boolean wifiConnected,int wifiLevel,
            boolean airplane,int activeDataSubscription,int defaultDataSubscription,List<Sim> input){
        this(battery,power,wifiKnown,wifiConnected,wifiLevel,3,airplane,activeDataSubscription,defaultDataSubscription,input);
    }
    public ConnectivityIconState(int battery,PowerState power,boolean wifiKnown,boolean wifiConnected,int wifiLevel,int wifiBars,
            boolean airplane,int activeDataSubscription,int defaultDataSubscription,List<Sim> input){
        this(battery,power,wifiKnown,wifiConnected,wifiLevel,wifiBars,airplane,activeDataSubscription,defaultDataSubscription,input,WifiInternet.UNKNOWN);
    }
    public ConnectivityIconState(int battery,PowerState power,boolean wifiKnown,boolean wifiConnected,int wifiLevel,int wifiBars,
            boolean airplane,int activeDataSubscription,int defaultDataSubscription,List<Sim> input,WifiInternet wifiInternet){
        this.wifiInternet=wifiKnown&&wifiConnected&&wifiInternet!=null?wifiInternet:WifiInternet.UNKNOWN;
        this.battery=battery<0?-1:Math.min(100,battery);this.charging=power==PowerState.CHARGING;
        this.bypassCharging=power==PowerState.BYPASS;
        this.wifiKnown=wifiKnown;
        this.wifiBars=Math.max(1,Math.min(8,wifiBars));
        this.wifiConnected=wifiConnected;this.wifiLevel=Math.max(0,Math.min(this.wifiBars,wifiLevel));this.airplane=airplane;
        this.activeDataSubscription=activeDataSubscription;this.defaultDataSubscription=defaultDataSubscription;
        Map<Integer,Sim> unique=new LinkedHashMap<>();
        if(input!=null)for(Sim sim:input)if(sim!=null&&sim.subscriptionId>=0&&sim.slot>=0)unique.put(sim.subscriptionId,sim);
        ArrayList<Sim> sorted=new ArrayList<>(unique.values());
        // Subscription identifiers can be assigned in either physical-slot order.
        // A data subscription switch changes its role, not the two SIM rows.
        sorted.sort(Comparator.<Sim>comparingInt(s->s.slot).thenComparingInt(s->s.subscriptionId));
        sims=Collections.unmodifiableList(new ArrayList<>(sorted.subList(0,Math.min(2,sorted.size()))));
    }
    public static ConnectivityIconState unknown(){return new ConnectivityIconState(-1,PowerState.NONE,false,false,0,false,-1,-1,Collections.emptyList());}
    public Sim simForSubscription(int id){for(Sim sim:sims)if(sim.subscriptionId==id)return sim;return null;}
    public Sim simForSlot(int slot){for(Sim sim:sims)if(sim.slot==slot)return sim;return null;}
    public Sim activeDataSim(){return simForSubscription(activeDataSubscription);}
    public int activeDataRow(){for(int i=0;i<sims.size();i++)if(sims.get(i).subscriptionId==activeDataSubscription)return i;return -1;}
    public int otherDataRow(){if(activeDataSubscription<0)return -1;for(int i=0;i<sims.size();i++)if(sims.get(i).subscriptionId!=activeDataSubscription)return i;return -1;}
    public int dataActivity(int id){Sim sim=simForSubscription(id);return airplane||sim==null?0:sim.dataActivity;}
    public int litDots(int row){return row<0||row>=sims.size()||airplane?0:Math.max(0,sims.get(row).level);}
    public int barCount(int row){return row<0||row>=sims.size()?4:sims.get(row).bars;}
    public float batteryFraction(){return Math.max(0,battery)/100f;}
    public String description(){StringBuilder s=new StringBuilder(battery<0?"电量未读取":"电量 "+battery+"%");
        if(bypassCharging)s.append("，旁路充电");else if(charging)s.append("，正在充电");s.append(!wifiKnown?"，Wi-Fi 状态未读取":wifiConnected?"，Wi-Fi 信号 "+wifiLevel+"/"+wifiBars:"，Wi-Fi 未连接");
        if(wifiKnown&&wifiConnected){if(wifiInternet==WifiInternet.NO_INTERNET)s.append("，无互联网");
            else if(wifiInternet==WifiInternet.UNKNOWN)s.append("，联网状态未读取");}
        if(airplane)s.append("，飞行模式");
        if(sims.isEmpty())s.append("，无可用 SIM 卡");
        for(int i=0;i<sims.size();i++)s.append("，第").append(i+1).append("排 SIM ").append(sims.get(i).slot+1)
                .append(sims.get(i).level<0?" 信号未读取":" 信号 "+litDots(i)+"/"+barCount(i));return s.toString();}
}
