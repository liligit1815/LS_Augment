package ls.augment.com;

import java.util.*;

/** Immutable radio/battery presentation with each SIM's native signal scale. */
public final class ConnectivityIconState {
    public enum PowerState { NONE, CHARGING, BYPASS }
    public static PowerState powerState(boolean plugged,boolean charging,int separation){
        if(!plugged)return PowerState.NONE;
        return separation==1?PowerState.BYPASS:charging?PowerState.CHARGING:PowerState.NONE;
    }
    public static final class Sim {
        public final int subscriptionId, slot, level, bars;
        public Sim(int subscriptionId,int slot,int level){this(subscriptionId,slot,level,4);}
        public Sim(int subscriptionId,int slot,int level,int bars){
            this.subscriptionId=subscriptionId;this.slot=slot;this.bars=bars==5?5:4;
            this.level=level<0?-1:Math.min(this.bars,level);
        }
    }
    public final int battery, wifiLevel;
    public final boolean charging, bypassCharging, wifiConnected, airplane;
    public final List<Sim> sims;
    public ConnectivityIconState(int battery,boolean charging,boolean wifiConnected,int wifiLevel,
            boolean airplane,int dataSubscription,List<Sim> input){
        this(battery,charging?PowerState.CHARGING:PowerState.NONE,wifiConnected,wifiLevel,airplane,dataSubscription,input);
    }
    public ConnectivityIconState(int battery,PowerState power,boolean wifiConnected,int wifiLevel,
            boolean airplane,int dataSubscription,List<Sim> input){
        this.battery=battery<0?-1:Math.min(100,battery);this.charging=power==PowerState.CHARGING;
        this.bypassCharging=power==PowerState.BYPASS;
        this.wifiConnected=wifiConnected;this.wifiLevel=Math.max(0,Math.min(3,wifiLevel));this.airplane=airplane;
        Map<Integer,Sim> unique=new LinkedHashMap<>();
        for(Sim sim:input)if(sim!=null&&sim.subscriptionId>=0&&sim.slot>=0)unique.put(sim.subscriptionId,sim);
        ArrayList<Sim> sorted=new ArrayList<>(unique.values());
        sorted.sort(Comparator.<Sim>comparingInt(s->s.subscriptionId==dataSubscription?0:1)
                .thenComparingInt(s->s.slot).thenComparingInt(s->s.subscriptionId));
        sims=Collections.unmodifiableList(new ArrayList<>(sorted.subList(0,Math.min(2,sorted.size()))));
    }
    public static ConnectivityIconState unknown(){return new ConnectivityIconState(-1,false,false,0,false,-1,Collections.emptyList());}
    public int litDots(int row){return row<0||row>=sims.size()||airplane?0:Math.max(0,sims.get(row).level);}
    public int barCount(int row){return row<0||row>=sims.size()?4:sims.get(row).bars;}
    public float batteryFraction(){return Math.max(0,battery)/100f;}
    public String description(){StringBuilder s=new StringBuilder(battery<0?"电量未读取":"电量 "+battery+"%");
        if(bypassCharging)s.append("，旁路充电");else if(charging)s.append("，正在充电");s.append(wifiConnected?"，Wi-Fi 信号 "+wifiLevel+"/3":"，Wi-Fi 未连接");
        if(airplane)s.append("，飞行模式");
        if(sims.isEmpty())s.append("，无可用 SIM 卡");
        for(int i=0;i<sims.size();i++)s.append("，第").append(i+1).append("排 SIM ").append(sims.get(i).slot+1)
                .append(sims.get(i).level<0?" 信号未读取":" 信号 "+litDots(i)+"/"+barCount(i));return s.toString();}
}
