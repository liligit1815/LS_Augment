package ls.augment.com.hook;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.Hooker;
import java.lang.reflect.Executable;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import ls.augment.com.hook.HookTelemetryObserver.*;
import org.json.JSONArray;
import org.json.JSONObject;

/** Instrumentation-only adapter; runs the production observer without installing any hook. */
public final class LogRepairHookDeviceCases {
    private static final Object VALUE=new Object(),RECEIVER=new Object();
    private static final Object[] ARGS={"fixture",Integer.valueOf(7)};
    private static final Executable METHOD;
    static {
        try{METHOD=LogRepairHookDeviceCases.class.getDeclaredMethod("target",Object.class);}
        catch(Exception error){throw new AssertionError(error);}
    }
    private static void target(Object value) { }
    private static final class FixtureChain implements Chain {
        final List<Object> args=Arrays.asList(ARGS);
        Throwable failure;
        int entry;
        Object receiver;
        Object[] replacements;
        public Executable getExecutable(){return METHOD;}
        public Object getThisObject(){return RECEIVER;}
        public List<Object> getArgs(){return args;}
        public Object getArg(int index){return args.get(index);}
        public Object proceed()throws Throwable{return call(1,null,null);}
        public Object proceed(Object[] values)throws Throwable{return call(2,null,values);}
        public Object proceedWith(Object self)throws Throwable{return call(3,self,null);}
        public Object proceedWith(Object self,Object[] values)throws Throwable{return call(4,self,values);}
        private Object call(int selected,Object self,Object[] values)throws Throwable{
            entry=selected;receiver=self;replacements=values;if(failure!=null)throw failure;return VALUE;
        }
    }
    private static Object proceed(Chain chain,int entry)throws Throwable{
        switch(entry){case 1:return chain.proceed();case 2:return chain.proceed(ARGS);
            case 3:return chain.proceedWith(RECEIVER);case 4:return chain.proceedWith(RECEIVER,ARGS);
            default:throw new AssertionError("Unknown entry");}
    }
    private static ErrorRecorder recorder(StackBudget budget){return new ErrorRecorder(){
        public StackResult capture(Throwable error){return budget.capture(error);}
        public void firstFailure(Counter counter,ErrorRecord error){ }
    };}
    private static void require(boolean value,String detail){if(!value)throw new AssertionError(detail);}
    private static void throwsSame(Hooker hook,FixtureChain chain,Throwable expected)throws Throwable{
        try{hook.intercept(chain);throw new AssertionError("Expected exception");}
        catch(Throwable actual){require(actual==expected,"Exception identity changed: "+actual);}
    }
    public static void run(JSONObject report)throws Throwable{
        JSONArray passed=new JSONArray();report.put("passedCases",passed)
                .put("fixtureOnly",true).put("installedHooks",0).put("permissionPolicyChanged",false);
        ErrorRecorder capture=recorder(new StackBudget(8,4096));
        for(int selected=1;selected<=4;selected++){
            final int entry=selected;FixtureChain chain=new FixtureChain();Counter counter=new Counter("device-entry-"+entry);
            Hooker hook=HookTelemetryObserver.observe(c->{
                require(c.getExecutable()==METHOD&&c.getThisObject()==RECEIVER,"Metadata changed");
                require(c.getArgs()==chain.args&&c.getArg(0)==ARGS[0],"Argument identities changed");
                return proceed(c,entry);
            },counter,System::currentTimeMillis,capture);
            require(hook.intercept(chain)==VALUE,"Result identity changed");
            require(chain.entry==entry,"Wrong proceed overload");
            require(chain.receiver==(entry>=3?RECEIVER:null),"Receiver identity changed");
            require(chain.replacements==(entry==2||entry==4?ARGS:null),"Replacement args changed");
            SecurityException permission=new SecurityException("Missing DETECT_SCREEN_CAPTURE (fixture)");chain.failure=permission;
            throwsSame(hook,chain,permission);Failures failures=counter.failures();
            require(failures.total==1&&failures.module==0&&failures.proceed==1,"Permission exception attributed to module");
            require(failures.last.source==ErrorSource.PROCEED_CHAIN&&failures.last.at>0,"Missing error origin/time");
            passed.put("proceed-entry-"+entry+"-result-and-permission-identity");
        }
        FixtureChain chain=new FixtureChain();Throwable downstream=new SecurityException("downstream-fixture");
        Throwable module=new IllegalStateException("module-finally-fixture");chain.failure=downstream;
        Counter finallyCounter=new Counter("device-finally");
        throwsSame(HookTelemetryObserver.observe(c->{try{return c.proceed();}finally{throw module;}},
                finallyCounter,System::currentTimeMillis,capture),chain,module);
        require(finallyCounter.failures().module==1&&finallyCounter.failures().proceed==0,"Finally error origin changed");
        passed.put("finally-new-exception-is-module-callback");
        Counter handled=new Counter("device-handled");
        require(HookTelemetryObserver.observe(c->{try{c.proceed();}catch(SecurityException expected){}return VALUE;},
                handled,System::currentTimeMillis,capture).intercept(chain)==VALUE,"Handled exception altered result");
        require(handled.failures().total==0&&handled.returned.get()==1,"Handled exception counted as escaping");
        passed.put("handled-proceed-error-does-not-count-as-escaping");
        StackBudget budget=new StackBudget(1,256);ErrorRecorder bounded=recorder(budget);Counter records=new Counter("device-records");
        throwsSame(HookTelemetryObserver.observe(c->{throw downstream;},records,()->11L,bounded),chain,downstream);
        Failures saved=records.failures();
        throwsSame(HookTelemetryObserver.observe(c->{throw module;},records,()->22L,bounded),chain,module);
        Failures latest=records.failures();
        require(saved.total==1&&saved.last==latest.first,"First error record mutated");
        require(latest.first.at==11&&latest.last.at==22&&latest.last.sequence==2,"Error time/event mismatched");
        require(latest.first.stack.contains("downstream-fixture")&&latest.last.stack.isEmpty()
                &&"BUDGET_EXHAUSTED".equals(latest.last.stackState),"Old stack reused after budget exhausted");
        require(latest.first.stack.length()<=256&&budget.used()==1,"Stack budget not bounded");
        passed.put("immutable-events-and-empty-stack-after-budget-exhausted");
        concurrent(report,passed);
        report.put("success",true);
    }
    private static void concurrent(JSONObject report,JSONArray passed)throws Throwable{
        Counter counter=new Counter("device-concurrency");StackBudget budget=new StackBudget(8,256);
        ErrorRecorder capture=recorder(budget);CountDownLatch start=new CountDownLatch(1);
        AtomicReference<Throwable> failure=new AtomicReference<>();Thread[] threads=new Thread[4];
        for(int t=0;t<threads.length;t++){
            final int id=t;threads[t]=new Thread(()->{
                try{
                    start.await();FixtureChain chain=new FixtureChain();Throwable error=id%2==0
                            ?new SecurityException("concurrent-chain"):new IllegalStateException("concurrent-module");
                    if(id%2==0)chain.failure=error;
                    Hooker delegate=id%2==0?Chain::proceed:c->{throw error;};
                    Hooker hook=HookTelemetryObserver.observe(delegate,counter,System::currentTimeMillis,capture);
                    for(int n=0;n<200;n++){
                        throwsSame(hook,chain,error);Failures snapshot=counter.failures();
                        require(snapshot.total==snapshot.module+snapshot.proceed,"Torn error counts");
                        require(snapshot.first.sequence==1&&snapshot.last.sequence==snapshot.total,"Torn event publication");
                    }
                }catch(Throwable error){failure.compareAndSet(null,error);}
            },"LogRepairFixture-"+t);threads[t].start();
        }
        start.countDown();for(Thread thread:threads)thread.join(10000);
        for(Thread thread:threads)require(!thread.isAlive(),"Concurrent fixture timed out");
        if(failure.get()!=null)throw failure.get();Failures snapshot=counter.failures();
        require(snapshot.total==800&&snapshot.module==400&&snapshot.proceed==400,"Concurrent error count lost");
        require(budget.used()==8&&snapshot.last.stack.isEmpty(),"Concurrent stack budget exceeded");
        report.put("concurrentCalls",800).put("moduleCallbackThrows",snapshot.module).put("proceedChainThrows",snapshot.proceed);
        passed.put("four-thread-counter-and-record-consistency");
    }
}
