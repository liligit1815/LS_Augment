package ls.augment.com;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/** Immutable public-clock metadata. No notification text, key, action or PendingIntent is accepted. */
final class AtomicWorkbenchNotificationCardData {
    static final int MAX_CARDS=16,MAX_RECORDS=32;
    static final class Record {
        final long time,sample;
        final int number;
        Record(long t,long s,int n){time=t;sample=s;number=n;}
    }
    static final class Snapshot {
        final boolean valid,available,complete,limited,stored;
        final long event;
        final Map<String,AtomicWorkbenchNotificationCardData> cards;
        Snapshot(boolean valid,boolean available,boolean limited,boolean stored,long event,Map<String,AtomicWorkbenchNotificationCardData> cards){
            this.valid=valid;this.available=available;complete=valid&&available&&!limited;this.limited=limited;this.stored=valid&&stored;this.event=event;
            this.cards=Collections.unmodifiableMap(new LinkedHashMap<>(cards));
        }
        static Snapshot parse(Bundle b,int user){
            try{
                exact(b,Set.of("schema","success","available","notification_status","event_revision","cards","card_count","cards_limited","record_stored","recorder_available","notification_actions_available","actions_status"));
                int schema=i(b,"schema");String actions=s(b,"actions_status",64);boolean actionAvailable=bool(b,"notification_actions_available");
                if(schema!=1&&schema!=2||bool(b,"recorder_available")
                        ||schema==1&&(!actions.equals("source_semantics_unavailable")||actionAvailable)
                        ||schema==2&&(!Set.of("public_actions","not_selected","unavailable").contains(actions)||actionAvailable!=actions.equals("public_actions")))throw invalid();
                s(b,"notification_status",64);boolean success=bool(b,"success"),available=bool(b,"available");
                if(success!=available)throw invalid();long event=n(b,"event_revision");if(event<0)throw invalid();
                Object raw=b.get("cards");if(!(raw instanceof List<?>)||((List<?>)raw).size()>MAX_CARDS||i(b,"card_count")!=((List<?>)raw).size())throw invalid();
                Map<String,AtomicWorkbenchNotificationCardData> cards=new LinkedHashMap<>();
                for(Object value:(List<?>)raw){if(!(value instanceof Bundle))throw invalid();AtomicWorkbenchNotificationCardData card=new AtomicWorkbenchNotificationCardData((Bundle)value,user,schema);
                    if(card.appeared>event||cards.put(card.id,card)!=null)throw invalid();}
                return new Snapshot(true,available,bool(b,"cards_limited"),bool(b,"record_stored"),event,cards);
            }catch(RuntimeException malformed){return new Snapshot(false,false,false,false,0,Map.of());}
        }
    }
    final String id,generation,kind,pkg,status;
    final int uid,user;
    final long revision,appeared,time,sample,until;
    final boolean known,advancing,countDown,canRecord,full;
    final boolean canDescribeActions,canOpenSource;final long capabilitiesUntil;final String actionStatus;
    final List<Record> records;
    private AtomicWorkbenchNotificationCardData(Bundle b,int expectedUser,int schema){
        Set<String> keys=new java.util.HashSet<>(Set.of("source_id","source_generation","source_revision","kind","owner_uid","user_id","package","appeared_revision","time_known","time_ms","sample_elapsed","valid_until_elapsed","display_resolution_ms","advancing","count_down","can_record","can_toggle","can_stop","can_lap","time_status","records","records_full"));
        if(schema==2)keys.addAll(Set.of("can_describe_actions","can_open_source","capabilities_until_elapsed","actions_status"));exact(b,keys);
        canDescribeActions=schema==2&&bool(b,"can_describe_actions");canOpenSource=schema==2&&bool(b,"can_open_source");
        capabilitiesUntil=schema==2?n(b,"capabilities_until_elapsed"):0;actionStatus=schema==2?s(b,"actions_status",32):"unavailable";
        if(capabilitiesUntil<0||!Set.of("ready","not_selected","unavailable").contains(actionStatus)
                ||(canDescribeActions||canOpenSource)&&capabilitiesUntil==0||canDescribeActions&&!actionStatus.equals("ready"))throw invalid();
        id=s(b,"source_id",32);generation=s(b,"source_generation",48);kind=s(b,"kind",16);pkg=s(b,"package",256);status=s(b,"time_status",32);
        uid=i(b,"owner_uid");user=i(b,"user_id");revision=n(b,"source_revision");appeared=n(b,"appeared_revision");
        time=n(b,"time_ms");sample=n(b,"sample_elapsed");until=n(b,"valid_until_elapsed");known=bool(b,"time_known");
        advancing=bool(b,"advancing");countDown=bool(b,"count_down");canRecord=bool(b,"can_record");full=bool(b,"records_full");
        if(!id.matches("[0-9a-f]{32}")||!generation.matches("[0-9a-f]{33,48}")||!Set.of("timer","stopwatch").contains(kind)
                ||!pkg.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)*")||uid<0||user!=expectedUser||uid/100000!=user
                ||revision<1||appeared<1||sample<0||i(b,"display_resolution_ms")!=1000||countDown!=kind.equals("timer")
                ||bool(b,"can_toggle")||bool(b,"can_stop")||bool(b,"can_lap")||!Set.of("public_chronometer","clock_changed","unverified").contains(status)
                ||known&&(!status.equals("public_chronometer")||sample>Long.MAX_VALUE-2000||until!=sample+2000)
                ||!known&&(until!=0||advancing||canRecord)||!countDown&&known&&time<0)throw invalid();
        Object raw=b.get("records");if(!(raw instanceof List<?>)||((List<?>)raw).size()>MAX_RECORDS)throw invalid();
        ArrayList<Record> result=new ArrayList<>();
        for(Object v:(List<?>)raw){if(!(v instanceof Bundle))throw invalid();Bundle r=(Bundle)v;exact(r,Set.of("time_ms","sample_elapsed","number"));
            long at=n(r,"sample_elapsed");int number=i(r,"number");if(at<0||number!=result.size()+1)throw invalid();result.add(new Record(n(r,"time_ms"),at,number));}
        records=Collections.unmodifiableList(result);
        if(full!=(records.size()==MAX_RECORDS)||canRecord&&(!known||!countDown||full))throw invalid();
    }
    private AtomicWorkbenchNotificationCardData(AtomicWorkbenchNotificationCardData d){
        id=d.id;generation=d.generation;kind=d.kind;pkg=d.pkg;status=d.status;uid=d.uid;user=d.user;revision=d.revision;appeared=d.appeared;
        time=d.time;sample=d.sample;until=0;known=false;advancing=false;countDown=d.countDown;canRecord=false;full=d.full;records=d.records;
        canDescribeActions=false;canOpenSource=false;capabilitiesUntil=0;actionStatus=d.actionStatus;
    }
    AtomicWorkbenchNotificationCardData stale(){return new AtomicWorkbenchNotificationCardData(this);}
    boolean sameLifetime(AtomicWorkbenchNotificationCardData d){return d!=null&&id.equals(d.id)&&generation.equals(d.generation)&&kind.equals(d.kind)&&pkg.equals(d.pkg)&&uid==d.uid&&user==d.user&&appeared==d.appeared;}
    Long timeAt(long now){
        if(!known||now<sample||now>=until)return null;
        try{return advancing?(countDown?Math.subtractExact(time,now-sample):Math.addExact(time,now-sample)):time;}catch(ArithmeticException overflow){return null;}
    }
    boolean canDescribeAt(long now){return canDescribeActions&&now>=0&&now<capabilitiesUntil&&capabilitiesUntil-now<=2000;}
    boolean canOpenAt(long now){return canOpenSource&&now>=0&&now<capabilitiesUntil&&capabilitiesUntil-now<=2000;}
    boolean canRecordAt(long now){return canRecord&&!full&&countDown&&timeAt(now)!=null;}
    static String format(long millis){
        long seconds=millis/1000,positive=seconds<0?-seconds:seconds,hours=positive/3600,minutes=(positive/60)%60,rest=positive%60;
        return (seconds<0?"−":"")+(hours>0?String.format(Locale.ROOT,"%d:%02d:%02d",hours,minutes,rest):String.format(Locale.ROOT,"%02d:%02d",minutes,rest));
    }
    private static void exact(Bundle b,Set<String> keys){if(b==null||!b.keySet().equals(keys))throw invalid();}
    private static int i(Bundle b,String k){Object v=b.get(k);if(!(v instanceof Integer))throw invalid();return(Integer)v;}
    private static long n(Bundle b,String k){Object v=b.get(k);if(!(v instanceof Long))throw invalid();return(Long)v;}
    private static boolean bool(Bundle b,String k){Object v=b.get(k);if(!(v instanceof Boolean))throw invalid();return(Boolean)v;}
    private static String s(Bundle b,String k,int max){Object v=b.get(k);if(!(v instanceof String)||((String)v).isEmpty()||((String)v).length()>max)throw invalid();String text=(String)v;for(int n=0;n<text.length();n++)if(Character.isISOControl(text.charAt(n)))throw invalid();return text;}
    private static IllegalArgumentException invalid(){return new IllegalArgumentException("invalid_notification_card_metadata");}
}
