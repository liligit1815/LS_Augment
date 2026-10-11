package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

/** Pure state reducer. A readable configuration never proves that an operation succeeded. */
public final class AutomationDiagnosticState {
    public static final String OWNER_KEY = "ls_augment_automation_owner_state_v1";
    public static final String STATE_KEY = "ls_augment_automation_state_v1";
    public static final String LAST_ERROR = "ls_augment_automation_last_error";
    public static final int PROTOCOL = 1;
    private static final String PREFIX = "ls_augment_automation_";

    private AutomationDiagnosticState() { }

    /** Full current owner publication, including a failure that may not have reached the provider. */
    public static final class Update {
        public final String session, bridge, bridgeError, lastBridgeError, runtime, request, transportError;
        public final long sequence, observedAt, lastBridgeErrorAt;
        public Update(String session, long sequence, long observedAt, String bridge, String bridgeError,
                String lastBridgeError, long lastBridgeErrorAt, String runtime, String request, String transportError) {
            this.session=session; this.sequence=sequence; this.observedAt=observedAt; this.bridge=bridge;
            this.bridgeError=bounded(bridgeError); this.lastBridgeError=bounded(lastBridgeError);
            this.lastBridgeErrorAt=lastBridgeErrorAt; this.runtime=runtime; this.request=request;
            this.transportError=bounded(transportError);
        }
        public String encode() {
            return String.join("|", "ADU1", session, Long.toString(sequence), Long.toString(observedAt), bridge,
                    encodeText(bridgeError), encodeText(lastBridgeError), Long.toString(lastBridgeErrorAt),
                    runtime, request, encodeText(transportError));
        }
        public static Update parse(String value) {
            try {
                if(value==null||value.length()>2000)return null;
                String[] p=value.split("\\|",-1);
                if(p.length!=11||!"ADU1".equals(p[0])||!p[1].matches("[0-9]+:[0-9]+")
                        || !p[4].matches("READY|FAILED|LISTENER_FAILED|WAITING_FOR_UNLOCK|WAITING_FOR_SERVICE|WAITING_FOR_PROVIDER|WAITING_FOR_USER_SERVICE")
                        || !p[8].matches("disabled|waiting_screen_off|ready|dispatched|unknown|handled")
                        || (!p[9].isEmpty()&&!p[9].matches("[0-9]+:[0-9]+")))return null;
                Update u=new Update(p[1],Long.parseLong(p[2]),Long.parseLong(p[3]),p[4],decodeText(p[5]),
                        decodeText(p[6]),Long.parseLong(p[7]),p[8],p[9],decodeText(p[10]));
                return u.sequence>0&&u.observedAt>0&&u.lastBridgeErrorAt>=0
                        && ((bridgeWithoutError(u.bridge)&&u.bridgeError.isEmpty())
                            ||(!bridgeWithoutError(u.bridge)&&!u.bridgeError.isEmpty()))?u:null;
            }catch(RuntimeException invalid){return null;}
        }
    }

    private static boolean bridgeWithoutError(String state) {
        return "READY".equals(state)||"WAITING_FOR_UNLOCK".equals(state)
                ||"WAITING_FOR_SERVICE".equals(state)||"WAITING_FOR_PROVIDER".equals(state)
                ||"WAITING_FOR_USER_SERVICE".equals(state);
    }

    public static final class State {
        private static final int MAX_REQUESTS=16;
        private final LinkedHashMap<String,Request> requests=new LinkedHashMap<>();
        private boolean ledgerValid=true;
        public String session="", bridge="UNKNOWN", bridgeError="", lastBridgeError="", runtime="unknown";
        public String request="", outcome="NONE", executionError="", executionMessage="", transportError="";
        public String requestEpoch="",lastSucceededEpoch="",lastSucceededMessage="";
        public String legacyUnknown="";
        public long sequence, observedAt, lastBridgeErrorAt, executionAt, executionErrorAt, transportAt;
        public int ownerBoot=-1;
        public boolean legacyActive;

        public static State read(Map<String,?> values) {
            State s=new State();
            if(!"1".equals(text(values,"state_version"))) {
                s.legacyUnknown=raw(values,LAST_ERROR); s.legacyActive=!s.legacyUnknown.isEmpty(); return s;
            }
            s.session=text(values,"owner_session");s.sequence=number(values,"owner_sequence");
            s.ownerBoot=(int)number(values,"owner_boot");s.observedAt=number(values,"owner_observed_at");
            s.bridge=text(values,"bridge_state");s.bridgeError=text(values,"bridge_error");
            s.lastBridgeError=text(values,"bridge_last_error");s.lastBridgeErrorAt=number(values,"bridge_last_error_at");
            s.runtime=text(values,"runtime_state");s.request=text(values,"request_id");s.outcome=text(values,"request_outcome");
            s.requestEpoch=text(values,"screen_epoch");s.lastSucceededEpoch=text(values,"last_succeeded_epoch");
            s.lastSucceededMessage=text(values,"last_succeeded_message");
            s.executionError=text(values,"execution_error");s.executionMessage=text(values,"execution_message");
            s.executionAt=number(values,"execution_at");s.executionErrorAt=number(values,"execution_error_at");
            s.transportError=text(values,"transport_error");
            s.transportAt=number(values,"transport_at");s.legacyUnknown=text(values,"legacy_unknown_error");
            s.legacyActive="1".equals(text(values,"legacy_active"));
            try {
                String ledger=decodeText(text(values,"request_ledger"));
                for(String line:ledger.split("\\n"))if(!line.isEmpty()) {
                    String[] p=line.split(",",-1);
                    if((p.length!=4&&p.length!=5)||!p[0].matches("[0-9]+:[0-9]+")
                            ||!p[1].matches("RUNNING|UNKNOWN|SUCCEEDED|FAILED|NOT_STARTED")||s.requests.containsKey(p[0]))throw new IllegalArgumentException();
                    // Version-one ledgers had four columns; the retained current epoch is authoritative.
                    String epoch=p.length==5?p[4]:p[0].equals(s.request)&&!s.requestEpoch.isEmpty()?s.requestEpoch:p[0];
                    if(!epoch.matches("[0-9]+:[0-9]+"))throw new IllegalArgumentException();
                    s.requests.put(p[0],new Request(p[1],decodeText(p[3]),Long.parseLong(p[2]),epoch));
                }
                if(s.requests.size()>MAX_REQUESTS||(!s.request.isEmpty()&&!s.requests.containsKey(s.request)))s.ledgerValid=false;
            }catch(RuntimeException malformed){s.ledgerValid=false;}
            return s;
        }

        /** Reject publications from an earlier boot, process or callback sequence. */
        public boolean apply(Update u,int boot) {
            if(u==null)return false;
            if(ownerBoot==boot&&!session.isEmpty()) {
                if(session.equals(u.session)) {if(u.sequence<=sequence)return false;}
                else if(start(u.session)<=start(session))return false;
            }
            ownerBoot=boot;session=u.session;sequence=u.sequence;observedAt=u.observedAt;
            bridge=u.bridge;bridgeError=u.bridgeError;
            if(!u.lastBridgeError.isEmpty()){lastBridgeError=u.lastBridgeError;lastBridgeErrorAt=u.lastBridgeErrorAt;}
            runtime=u.runtime;
            if(!u.request.isEmpty()&&terminal(outcomeFor(u.request))
                    &&("dispatched".equals(runtime)||"unknown".equals(runtime)))runtime="handled";
            // A delayed "reply lost" publication cannot overwrite the provider's actual result.
            if(!u.transportError.isEmpty()&&u.request.equals(request)
                    && ("RUNNING".equals(outcome)||"UNKNOWN".equals(outcome))) {
                transportError=u.transportError;transportAt=u.observedAt;
            }
            return true;
        }

        /** Must be durably saved before touching any hidden application. */
        public boolean reserve(String id,long at) {
            return reserve(id,id,at);
        }
        public boolean reserve(String id,String screenEpoch,long at) {
            if(!ledgerValid||id==null||!id.matches("[0-9]+:[0-9]+")||id.length()>80||requests.containsKey(id))return false;
            if(screenEpoch==null||!screenEpoch.matches("[0-9]+:[0-9]+")||screenEpoch.length()>80
                    ||successForEpoch(screenEpoch)!=null||pendingRequestForEpoch(screenEpoch)!=null)return false;
            // A terminal entry may be compacted, but an older ID from this owner cannot run again.
            if(!request.isEmpty()&&id.substring(0,id.indexOf(':')).equals(request.substring(0,request.indexOf(':')))
                    &&start(id)<=start(request))return false;
            if(requests.size()>=MAX_REQUESTS) {
                String removable=null;
                for(Map.Entry<String,Request> entry:requests.entrySet())if(terminal(entry.getValue().outcome)){removable=entry.getKey();break;}
                if(removable==null)return false; // Never evict an operation whose result remains unknown.
                requests.remove(removable);
            }
            request=id;requestEpoch=screenEpoch;outcome="RUNNING";executionMessage="";executionAt=at;transportError="";transportAt=0;
            requests.put(id,new Request("RUNNING","",at,screenEpoch));
            return true;
        }

        public void complete(String id,boolean success,String message,long at) {
            if(!id.equals(request)||!"RUNNING".equals(outcome))return;
            outcome=success?"SUCCEEDED":"FAILED";executionMessage=bounded(message);executionAt=at;
            requests.put(id,new Request(outcome,executionMessage,at,requestEpoch));
            executionError=success?"":bounded(message);executionErrorAt=success?0:at;transportError="";transportAt=0;
            if(success){legacyActive=false;lastSucceededEpoch=requestEpoch;lastSucceededMessage=executionMessage;}
        }

        public void uncertain(String id,String message,long at) {
            if(!id.equals(request)||!"RUNNING".equals(outcome))return;
            outcome="UNKNOWN";executionMessage=bounded(message);transportError=bounded(message);transportAt=at;
            requests.put(id,new Request(outcome,executionMessage,at,requestEpoch));
        }
        public void notStarted(String id,String message,long at) {
            if(!id.equals(request)||!"RUNNING".equals(outcome))return;
            outcome="NOT_STARTED";executionMessage=bounded(message);executionAt=at;
            requests.put(id,new Request(outcome,executionMessage,at,requestEpoch));
        }

        public String outcomeFor(String id){Request r=requests.get(id);return !ledgerValid?"UNKNOWN":r==null?"UNKNOWN_REQUEST":r.outcome;}
        public String messageFor(String id){Request r=requests.get(id);return r==null?"本次请求没有可确认的执行记录":r.message;}
        public boolean containsRequest(String id){return requests.containsKey(id);}
        public String successForEpoch(String epoch){
            if(!epoch.isEmpty()&&epoch.equals(lastSucceededEpoch))return lastSucceededMessage;
            for(Request r:requests.values())if(epoch.equals(r.epoch)&&"SUCCEEDED".equals(r.outcome))return r.message;
            return null;
        }
        public String pendingRequestForEpoch(String epoch){
            if(!ledgerValid&&epoch.equals(requestEpoch)&&!request.isEmpty())return request;
            for(Map.Entry<String,Request> e:requests.entrySet())if(epoch.equals(e.getValue().epoch)
                    &&("RUNNING".equals(e.getValue().outcome)||"UNKNOWN".equals(e.getValue().outcome)))return e.getKey();
            return null;
        }

        public String errorSource() {
            if(!bridgeError.isEmpty())return "CONFIG_BRIDGE";
            if(!transportError.isEmpty()&&("RUNNING".equals(outcome)||"UNKNOWN".equals(outcome)))return "EXECUTION_TRANSPORT";
            if(!executionError.isEmpty())return "EXECUTION_RESULT";
            return legacyActive?"LEGACY_UNKNOWN":"NONE";
        }
        public String error() {
            switch(errorSource()) {
                case "CONFIG_BRIDGE":return bridgeError;
                case "EXECUTION_RESULT":return executionError;
                case "EXECUTION_TRANSPORT":return transportError;
                case "LEGACY_UNKNOWN":return legacyUnknown;
                default:return "";
            }
        }
        public long errorAt() {
            switch(errorSource()) {
                case "CONFIG_BRIDGE":return observedAt;
                case "EXECUTION_RESULT":return executionErrorAt;
                case "EXECUTION_TRANSPORT":return transportAt;
                default:return 0;
            }
        }
        public Map<String,String> values() {
            Map<String,String> out=new LinkedHashMap<>();
            put(out,"state_version","1");put(out,"owner_session",session);put(out,"owner_sequence",sequence);
            put(out,"owner_boot",ownerBoot);put(out,"owner_observed_at",observedAt);put(out,"bridge_state",bridge);
            put(out,"bridge_error",bridgeError);put(out,"bridge_last_error",lastBridgeError);
            put(out,"bridge_last_error_at",lastBridgeErrorAt);put(out,"runtime_state",runtime);
            put(out,"request_id",request);put(out,"request_outcome",outcome);put(out,"execution_error",executionError);
            put(out,"screen_epoch",requestEpoch);put(out,"last_succeeded_epoch",lastSucceededEpoch);
            put(out,"last_succeeded_message",lastSucceededMessage);
            put(out,"execution_message",executionMessage);put(out,"execution_at",executionAt);
            put(out,"execution_error_at",executionErrorAt);
            put(out,"transport_error",transportError);put(out,"transport_at",transportAt);
            put(out,"legacy_unknown_error",legacyUnknown);put(out,"legacy_active",legacyActive?"1":"0");
            StringBuilder ledger=new StringBuilder();
            for(Map.Entry<String,Request> e:requests.entrySet())ledger.append(e.getKey()).append(',').append(e.getValue().outcome)
                    .append(',').append(e.getValue().at).append(',').append(encodeText(e.getValue().message))
                    .append(',').append(e.getValue().epoch).append('\n');
            put(out,"request_ledger",encodeText(ledger.toString()));
            put(out,"error_source",errorSource());put(out,"error_at",errorAt());return out;
        }
        private static final class Request {final String outcome,message,epoch;final long at;Request(String o,String m,long t,String e){outcome=o;message=m;at=t;epoch=e;}}
    }

    public static boolean terminal(String outcome) {return "SUCCEEDED".equals(outcome)||"FAILED".equals(outcome)||"NOT_STARTED".equals(outcome);}
    private static void put(Map<String,String> out,String suffix,Object value){out.put(PREFIX+suffix,String.valueOf(value));}
    private static String raw(Map<String,?> values,String key){Object v=values.get(key);return v instanceof String?(String)v:"";}
    private static String text(Map<String,?> values,String suffix){return raw(values,PREFIX+suffix);}
    private static long number(Map<String,?> values,String suffix){try{return Long.parseLong(text(values,suffix));}catch(RuntimeException bad){return 0;}}
    private static long start(String session){try{return Long.parseLong(session.substring(session.indexOf(':')+1));}catch(RuntimeException bad){return -1;}}
    private static String bounded(String message){if(message==null)return "";return message.length()>140?message.substring(0,140):message;}
    private static String encodeText(String text){return Base64.getUrlEncoder().withoutPadding().encodeToString(text.getBytes(StandardCharsets.UTF_8));}
    private static String decodeText(String text){return new String(Base64.getUrlDecoder().decode(text),StandardCharsets.UTF_8);}
}
