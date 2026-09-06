package ls.augment.com;

import java.time.*;
import java.util.*;

/** A stable random timetable: a saved plan never draws new times on restart. */
public final class StepPlan {
    public final String id, account, zone;
    public final LocalDate startDate;
    public final int fromMinute, toMinute, amount;
    public final boolean repeat;
    public final long seed;
    public final int executions, stepsPerExecution, weekdays;
    public StepPlan(String id, String account, String zone, LocalDate date,
            int from, int to, int amount, boolean repeat, long seed) {
        if (!id.matches("[0-9a-f]{32}") || !account.matches("[0-9a-f]{64}")
                || from < 0 || to > 1440 || to <= from || amount < 1 || amount > 1000000)
            throw new IllegalArgumentException("invalid step plan");
        ZoneId.of(zone);
        this.id=id;this.account=account;this.zone=zone;this.startDate=Objects.requireNonNull(date);
        this.executions=0;this.stepsPerExecution=0;this.weekdays=127;
        this.fromMinute=from;this.toMinute=to;this.amount=amount;this.repeat=repeat;this.seed=seed;
    }
    public StepPlan(String id,String account,String zone,LocalDate date,int from,int to,int executions,int steps,int weekdays,long seed) {
        if(!id.matches("[0-9a-f]{32}")||!account.matches("[0-9a-f]{64}")||from<0||from>=1440||to<0||to>1440||from==to
            ||executions<1||executions>100||steps<1||(long)steps*executions>1000000||weekdays<1||weekdays>127)throw new IllegalArgumentException("invalid plan");
        int minutes=(to>from?to:to+1440)-from;
        if(executions>minutes)throw new IllegalArgumentException("not enough distinct minutes");
        ZoneId.of(zone);this.id=id;this.account=account;this.zone=zone;this.startDate=Objects.requireNonNull(date);
        this.fromMinute=from;this.toMinute=to;this.executions=executions;this.stepsPerExecution=steps;this.weekdays=weekdays;
        this.amount=executions*steps;this.repeat=true;this.seed=seed;
    }
    public boolean runsOn(LocalDate day) {
        return !day.isBefore(startDate)&&(repeat||day.equals(startDate))&&(weekdays&(1<<(day.getDayOfWeek().getValue()-1)))!=0;
    }
    public String serialize() {
        if(executions>0)return String.join("|","SP2",id,account,zone,startDate.toString(),""+fromMinute,""+toMinute,""+executions,""+stepsPerExecution,""+weekdays,""+seed);
        return String.join("|", "SP1",id,account,zone,startDate.toString(),""+fromMinute,
                ""+toMinute,""+amount,repeat?"1":"0",""+seed);
    }
    public static StepPlan parse(String text) {
        try {
            String[] v=text.split("\\|",-1);
            if(v.length==11&&v[0].equals("SP2"))return new StepPlan(v[1],v[2],v[3],LocalDate.parse(v[4]),Integer.parseInt(v[5]),Integer.parseInt(v[6]),Integer.parseInt(v[7]),Integer.parseInt(v[8]),Integer.parseInt(v[9]),Long.parseLong(v[10]));
            if(v.length!=10||!v[0].equals("SP1")||!(v[8].equals("0")||v[8].equals("1")))return null;
            return new StepPlan(v[1],v[2],v[3],LocalDate.parse(v[4]),Integer.parseInt(v[5]),
                    Integer.parseInt(v[6]),Integer.parseInt(v[7]),v[8].equals("1"),Long.parseLong(v[9]));
        }catch(Exception ignored){return null;}
    }
    public SortedMap<Long,Integer> timetable(LocalDate day) {
        TreeMap<Long,Integer> result=new TreeMap<>();
        if(!runsOn(day))return result;
        Random random=new Random(seed ^ day.toEpochDay()*0x9e3779b97f4a7c15L ^ account.hashCode());
        if(executions>0){
            int end=toMinute>fromMinute?toMinute:toMinute+1440;
            java.util.List<Integer> minutes=new ArrayList<>();for(int m=fromMinute;m<end;m++)minutes.add(m);
            Collections.shuffle(minutes,random);
            for(int i=0;i<executions;i++)result.put(day.atStartOfDay(ZoneId.of(zone)).plusMinutes(minutes.get(i)).toEpochSecond(),stepsPerExecution);
            return Collections.unmodifiableSortedMap(result);
        }
        int left=amount;
        while(left>0) {
            int minute=fromMinute+random.nextInt(toMinute-fromMinute);
            int chunk=Math.min(left,1+random.nextInt(200));
            long at=day.atStartOfDay(ZoneId.of(zone)).plusMinutes(minute).toEpochSecond();
            result.merge(at,chunk,Integer::sum);left-=chunk;
        }
        return Collections.unmodifiableSortedMap(result);
    }
}
