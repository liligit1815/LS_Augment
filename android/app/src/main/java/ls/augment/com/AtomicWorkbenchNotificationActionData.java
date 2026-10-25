package ls.augment.com;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/** Only public labels and opaque short-lived capabilities; never a PendingIntent. */
final class AtomicWorkbenchNotificationActionData {
    static final class Action {
        final int index; final String label,id,status;
        final boolean enabled,authenticationRequired,remoteInput;
        Action(Bundle b,int expected) {
            exact(b,Set.of("index","label","action_id","status","enabled","authentication_required","remote_input"));
            index=i(b,"index");label=s(b,"label",80);id=s(b,"action_id",32);status=s(b,"status",40);
            enabled=bool(b,"enabled");authenticationRequired=bool(b,"authentication_required");remoteInput=bool(b,"remote_input");
            if(index!=expected||!Set.of("ready","unavailable","remote_input_required","open_source_required","creator_mismatch","already_requested","capacity_limited").contains(status)
                    ||enabled&&(!status.equals("ready")||label.isBlank()||!id.matches("[0-9a-f]{32}")||remoteInput)
                    ||!enabled&&!id.isEmpty())throw invalid();
        }
    }
    final boolean success,sent,limited;
    final String status;
    final long until;
    final List<Action> actions;
    private AtomicWorkbenchNotificationActionData(Bundle b,AtomicWorkbenchNotificationCardData source,String operation,String request,long now){
        exact(b,Set.of("schema","success","operation","request_id","source_id","source_generation","source_revision","status","sent","valid_until_elapsed","limited","actions"));
        if(i(b,"schema")!=1||!operation.equals(s(b,"operation",16))||!request.equals(s(b,"request_id",32))
                ||!source.id.equals(s(b,"source_id",32))||!source.generation.equals(s(b,"source_generation",48))||source.revision!=n(b,"source_revision"))throw invalid();
        success=bool(b,"success");sent=bool(b,"sent");limited=bool(b,"limited");status=s(b,"status",40);until=n(b,"valid_until_elapsed");
        if(!Set.of("ready","sent","rejected","canceled","outcome_unknown","unavailable").contains(status)
                ||sent&&(!success||!operation.equals("send")||!status.equals("sent"))||success&&operation.equals("send")&&!sent)throw invalid();
        Object raw=b.get("actions");if(!(raw instanceof List<?>)||((List<?>)raw).size()>8)throw invalid();
        ArrayList<Action> rows=new ArrayList<>();for(Object value:(List<?>)raw){if(!(value instanceof Bundle))throw invalid();rows.add(new Action((Bundle)value,rows.size()));}
        if(operation.equals("describe")&&success&&(until<=now||until-now>5000||!status.equals("ready"))
                ||operation.equals("send")&&(!rows.isEmpty()||until!=0))throw invalid();
        actions=List.copyOf(rows);
    }
    static AtomicWorkbenchNotificationActionData parse(Bundle b,AtomicWorkbenchNotificationCardData source,String operation,String request,long now){
        try{return new AtomicWorkbenchNotificationActionData(b,source,operation,request,now);}catch(RuntimeException malformed){return null;}
    }
    private static void exact(Bundle b,Set<String> keys){if(b==null||!b.keySet().equals(keys))throw invalid();}
    private static int i(Bundle b,String k){Object v=b.get(k);if(!(v instanceof Integer))throw invalid();return(Integer)v;}
    private static long n(Bundle b,String k){Object v=b.get(k);if(!(v instanceof Long))throw invalid();return(Long)v;}
    private static boolean bool(Bundle b,String k){Object v=b.get(k);if(!(v instanceof Boolean))throw invalid();return(Boolean)v;}
    private static String s(Bundle b,String k,int max){Object v=b.get(k);if(!(v instanceof String)||((String)v).length()>max)throw invalid();String text=(String)v;for(int at=0;at<text.length();at++)if(Character.isISOControl(text.charAt(at)))throw invalid();return text;}
    private static IllegalArgumentException invalid(){return new IllegalArgumentException("invalid_notification_action_metadata");}
}
