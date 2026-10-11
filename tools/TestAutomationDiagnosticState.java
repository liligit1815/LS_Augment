package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

public final class TestAutomationDiagnosticState {
    private static int checks;
    private static AutomationDiagnosticState.Update update(long seq,String bridge,String error,String runtime,String request,String transport) {
        return new AutomationDiagnosticState.Update("42:100",seq,1000+seq,bridge,error,error,error.isEmpty()?0:1000+seq,runtime,request,transport);
    }
    private static void check(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message);}
    private static AutomationDiagnosticState.State restore(AutomationDiagnosticState.State state){return AutomationDiagnosticState.State.read(state.values());}
    public static void main(String[] args) {
        for(String waiting:new String[]{"WAITING_FOR_UNLOCK","WAITING_FOR_SERVICE","WAITING_FOR_PROVIDER","WAITING_FOR_USER_SERVICE"}){
            AutomationDiagnosticState.Update u=update(1,waiting,"","unknown","","");
            check(AutomationDiagnosticState.Update.parse(u.encode())!=null,"waiting wire accepted: "+waiting);
            AutomationDiagnosticState.State waitingState=AutomationDiagnosticState.State.read(new LinkedHashMap<>());
            check(waitingState.apply(u,1)&&waitingState.error().isEmpty()&&waitingState.runtime.equals("unknown"),"waiting never invents success or failure: "+waiting);
        }
        AutomationDiagnosticState.State s=AutomationDiagnosticState.State.read(new LinkedHashMap<>());
        check(s.apply(update(1,"FAILED","Unknown authority","unknown","",""),1),"bridge failure accepted");
        check("CONFIG_BRIDGE".equals(s.errorSource()),"bridge source explicit");
        check(s.apply(update(2,"READY","","disabled","",""),1),"disabled valid read accepted");
        check(s.error().isEmpty()&&"disabled".equals(s.runtime),"disabled read clears only bridge");
        check("Unknown authority".equals(s.lastBridgeError),"ready publication cannot erase retained bridge failure history");
        check(!s.apply(update(1,"FAILED","late failure","unknown","",""),1),"late failure cannot undo recovery");

        check(s.reserve("42:1000",1010),"reserve before execution");
        s=restore(s);check(!s.reserve("42:1000",1011),"restart cannot dispatch same reserved request");
        s.complete("42:1000",false,"Root operation failed",1012);
        s.apply(update(3,"READY","","disabled","",""),1);
        check("Root operation failed".equals(s.executionError)&&"EXECUTION_RESULT".equals(s.errorSource()),"disabled snapshot preserves actual failure");
        check(!s.reserve("42:1000",1013),"confirmed failure does not repeat same epoch");
        check(s.reserve("42:1001",1014),"next screen epoch gets separate request");
        check(s.errorAt()==1012&&s.executionAt==1014,"new attempt retains the old failure's actual occurrence time");
        check(restore(s).executionErrorAt==1012,"failure time survives stored state reload");
        s.apply(update(4,"READY","","unknown","42:1001","reply lost"),1);
        check("EXECUTION_TRANSPORT".equals(s.errorSource()),"unknown current transport does not hide behind previous result");
        s=restore(s);check(!s.reserve("42:1001",1015)&&"RUNNING".equals(s.outcomeFor("42:1001")),"lost response remains query only");
        check("42:1001".equals(s.pendingRequestForEpoch("42:1001")),"pending request found by durable screen epoch");
        check(!s.reserve("42:1002","42:1001",1015),"unknown screen epoch cannot execute with another attempt ID");
        s.complete("42:1001",true,"done",1016);
        check(s.executionErrorAt==0,"actual success clears current execution failure time");
        s.apply(update(5,"READY","","unknown","42:1001","late reply lost"),1);
        check(s.error().isEmpty()&&"handled".equals(s.runtime),"late transport report cannot overwrite known success");
        check("FAILED".equals(s.outcomeFor("42:1000")),"previous request remains independently queryable");
        check(!s.reserve("42:1002","42:1001",1017),"successful screen epoch blocks a new attempt ID");
        check("done".equals(restore(s).successForEpoch("42:1001")),"successful epoch survives restart");
        check(!s.reserve("42:999",1017),"older owner ID cannot replay");
        AutomationDiagnosticState.State unresolved=new AutomationDiagnosticState.State();
        unresolved.reserve("42:3000","42:2900",3000);unresolved.uncertain("42:3000","lost",3001);
        unresolved.reserve("42:4000","42:3900",4000);unresolved.complete("42:4000",true,"done",4001);
        unresolved=restore(unresolved);
        check("42:3000".equals(unresolved.pendingRequestForEpoch("42:2900")),"older unknown epoch is retained after a later epoch completes");
        check(!unresolved.reserve("42:5000","42:2900",5000),"older unknown epoch cannot replay after another epoch");
        Map<String,String> fourColumn=new AutomationDiagnosticState.State().values();
        fourColumn.put("ls_augment_automation_request_id","42:6000");fourColumn.put("ls_augment_automation_request_outcome","UNKNOWN");
        fourColumn.put("ls_augment_automation_screen_epoch","42:5900");
        fourColumn.put("ls_augment_automation_request_ledger",java.util.Base64.getUrlEncoder().withoutPadding().encodeToString("42:6000,UNKNOWN,6000,\n".getBytes(java.nio.charset.StandardCharsets.UTF_8)));
        AutomationDiagnosticState.State migrated=AutomationDiagnosticState.State.read(fourColumn);
        check("42:6000".equals(migrated.pendingRequestForEpoch("42:5900")),"four-column ledger uses retained current screen epoch");
        check(!restore(migrated).reserve("42:6100","42:5900",6100),"migrated ledger blocks a new attempt in unknown epoch after serialization");

        Map<String,Object> legacy=new LinkedHashMap<>();legacy.put(AutomationDiagnosticState.LAST_ERROR,"event_failed:old unknown stage");
        AutomationDiagnosticState.State old=AutomationDiagnosticState.State.read(legacy);
        old.apply(update(1,"READY","","disabled","",""),1);
        check("LEGACY_UNKNOWN".equals(old.errorSource()),"migration never invents old failure origin");
        old.reserve("42:2000",1020);old.complete("42:2000",true,"done",1021);
        check(old.error().isEmpty()&&!old.legacyUnknown.isEmpty(),"real success recovers legacy summary while retaining history");

        AutomationDiagnosticState.State capacity=new AutomationDiagnosticState.State();
        for(int i=1;i<=16;i++)check(capacity.reserve("42:"+i,2000+i),"bounded unknown reservation "+i);
        check(!capacity.reserve("42:17",2017),"unknown records cannot be evicted to permit another operation");
        capacity.complete("42:16",true,"done",2018);
        check(capacity.reserve("42:17",2019),"one confirmed terminal record may be compacted");
        check(!capacity.reserve("42:16",2020),"compacted old request remains blocked by owner watermark");
        capacity=restore(capacity);check(!capacity.reserve("42:17",2021),"deduplication survives stored state reload");
        Map<String,String> corrupt=capacity.values();corrupt.put("ls_augment_automation_request_ledger","bad_base64!");
        check(!AutomationDiagnosticState.State.read(corrupt).reserve("42:18",2022),"corrupt reservation ledger fails closed");

        AutomationDiagnosticState.State sessions=new AutomationDiagnosticState.State();sessions.apply(update(10,"READY","","disabled","",""),1);
        check(!sessions.apply(new AutomationDiagnosticState.Update("43:99",11,3000,"READY","","",0,"disabled","",""),1),"older process publication rejected");
        check(sessions.apply(new AutomationDiagnosticState.Update("43:101",1,3001,"READY","","",0,"disabled","",""),1),"new process sequence can restart");
        check(sessions.apply(new AutomationDiagnosticState.Update("44:1",1,3002,"READY","","",0,"disabled","",""),2),"new boot monotonic origin may restart");
        check(AutomationDiagnosticState.Update.parse(update(1,"READY","","disabled","","").encode())!=null,"wire round trip");
        check(AutomationDiagnosticState.Update.parse(update(1,"READY","contradiction","disabled","","").encode())==null,"ready envelope cannot contain active bridge failure");
        check(AutomationDiagnosticState.Update.parse(update(1,"WAITING_FOR_UNLOCK","","unknown","","").encode())!=null,"credential lock wait is a valid non-error bridge state");
        check(AutomationDiagnosticState.Update.parse(update(1,"WAITING_FOR_UNLOCK","contradiction","unknown","","").encode())==null,"unlock wait cannot contain an active bridge failure");
        check(AutomationDiagnosticState.Update.parse("ADU1|malformed")==null,"incomplete owner envelope rejected");
        check(AutomationDiagnosticState.Update.parse(new AutomationDiagnosticState.Update("42:100",1,1,"FAILED","错".repeat(140),"错".repeat(140),1,"unknown","42:3","错".repeat(140)).encode())!=null,"worst bounded multilingual publication fits existing queue");
        System.out.println("PASS AutomationDiagnosticState "+checks+" checks");
    }
}
