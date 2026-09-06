import java.time.*;
import java.util.*;
import ls.augment.com.StepPlan;
import ls.augment.com.StepMath;

public class TestStepPlan {
    static void check(boolean v,String m){if(!v)throw new AssertionError(m);}
    public static void main(String[] args){
        LocalDate day=LocalDate.of(2026,9,5);
        StepPlan p=new StepPlan("1".repeat(32),"2".repeat(64),"Asia/Shanghai",day,600,720,12345,true,42);
        SortedMap<Long,Integer> times=p.timetable(day);
        check(times.values().stream().mapToInt(Integer::intValue).sum()==12345,"exact count");
        check(times.equals(StepPlan.parse(p.serialize()).timetable(day)),"restart stable");
        check(!times.equals(p.timetable(day.plusDays(1))),"daily fresh schedule");
        for(long t:times.keySet()){
            LocalDateTime at=LocalDateTime.ofInstant(Instant.ofEpochSecond(t),ZoneId.of(p.zone));
            check(at.toLocalDate().equals(day)&&at.getHour()>=10&&at.getHour()<12,"window");
        }
        check(StepPlan.parse(p.serialize().replace("|720|","|600|"))==null,"empty interval");
        check(StepPlan.parse(p.serialize().replace("|1|42","|2|42"))==null,"invalid repeat");
        StepPlan once=new StepPlan(p.id,p.account,p.zone,day,0,1,1,false,42);
        check(once.timetable(day.plusDays(1)).isEmpty(),"one off");
        check(StepMath.multiply(11,250)==27,"fixed point multiplication");
        Map<String,Long> sources=new HashMap<>();sources.put("phone",300L);sources.put("watch",800L);
        int extra=StepMath.phoneAddition(sources,"phone",123);
        sources.merge("phone",(long)extra,Long::sum);
        check(StepMath.merged(sources)==923,"bonus survives watch merge exactly once");
        sources.put("phone",300L);sources.put("watch",1000L);
        check(StepMath.phoneAddition(sources,"phone",123)==823,"later watch sync recalculates compensation");
        LocalDate monday=LocalDate.of(2026,9,7);
        StepPlan weekly=new StepPlan(p.id,p.account,p.zone,monday,1380,60,10,200,31,43);
        SortedMap<Long,Integer> week=weekly.timetable(monday);
        check(week.size()==10,"exact number of executions");
        check(week.values().stream().allMatch(v->v==200),"exact increment per execution");
        check(week.equals(StepPlan.parse(weekly.serialize()).timetable(monday)),"SP2 stable round trip");
        check(weekly.timetable(monday.plusDays(5)).isEmpty(),"weekend excluded");
        check(weekly.timetable(monday.minusDays(1)).isEmpty(),"no work before start date");
        for(long at:week.keySet())check(at>=monday.atStartOfDay(ZoneId.of(p.zone)).plusHours(23).toEpochSecond()&&at<monday.plusDays(1).atStartOfDay(ZoneId.of(p.zone)).plusHours(1).toEpochSecond(),"cross-midnight bound");
        check(StepPlan.parse(weekly.serialize().replace("|31|43","|0|43"))==null,"reject empty weekdays");
        check(StepPlan.parse(weekly.serialize().replace("|10|200|","|101|200|"))==null,"reject excess executions");
        System.out.println("Step schedules and source merge checks passed");
    }
}
