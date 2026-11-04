package ls.augment.com.hook;

import android.content.Context;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Read-only, bounded evidence for tasks redirected by this module. Never finishes
 * an auth activity or changes a task: the provider still owns its result delivery. */
final class FreeformLoginTrace {
    private static final List<Session> SESSIONS=new ArrayList<>();
    private static final long MAX_AGE=10L*60*1_000_000_000L;
    private FreeformLoginTrace() { }
    private static final class Session {
        final WeakReference<Object> record,task;
        final String caller;
        final long started=System.nanoTime();
        final List<String> events=new ArrayList<>();
        int dropped;
        Session(Object record,Object task,String caller){this.record=new WeakReference<>(record);this.task=new WeakReference<>(task);this.caller=caller;}
    }
    static void install(AugmentModule module,Class<?> record){
        int installed=0;
        for(Method method:record.getDeclaredMethods()){
            // All known overloads run on the existing WM lock. Do not guess an
            // unsupported finish API or inject a new callback into the auth app.
            if(!method.getName().equals("finishIfPossible"))continue;
            try{
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,"freeform.login.finish."+method.getParameterCount(),false).intercept(chain->{
                    Object activity=chain.getThisObject();Session session=null;
                    try{session=find(activity);}catch(Throwable failure){module.logFeatureError("FREEFORM_LOGIN_TRACE",failure);}
                    Object result=chain.proceed();
                    if(session!=null)observe(module,activity,session,"native_finish_return;result="+result);
                    return result;
                }));
                module.deoptimize(method);installed++;
            }catch(Throwable failure){module.logFeatureError("FREEFORM_LOGIN_TRACE_INSTALL",failure);}
        }
        module.logFeatureInfo("FREEFORM_LOGIN_TRACE finish_hooks="+installed+";read_only=true");
    }
    static void launched(AugmentModule module,Object starter,Object target,String caller,Object result){
        try{
            Object task=task(target);if(task==null)task=field(starter,"mTargetTask");
            Session session=new Session(target,task,caller);
            synchronized(SESSIONS){prune();if(SESSIONS.size()>=16)SESSIONS.remove(0);SESSIONS.add(session);}
            observe(module,target,session,"launch_return;result="+result);
        }catch(Throwable failure){module.logFeatureError("FREEFORM_LOGIN_TRACE",failure);}
    }
    static void returning(AugmentModule module,Object source,Object target){
        try{
            Session session=find(source);
            if(session!=null&&session.caller.equals(field(target,"packageName")))
                observe(module,source,session,"caller_return_requested");
        }catch(Throwable failure){module.logFeatureError("FREEFORM_LOGIN_TRACE",failure);}
    }
    private static Object task(Object record){try{return record==null?null:call(record,"getTask");}catch(ReflectiveOperationException unavailable){return null;}}
    private static void prune(){long now=System.nanoTime();SESSIONS.removeIf(s->now-s.started>MAX_AGE||(s.record.get()==null&&s.task.get()==null));}
    private static Session find(Object record){
        if(record==null)return null;Object task=task(record);
        synchronized(SESSIONS){prune();for(int i=SESSIONS.size()-1;i>=0;i--){Session s=SESSIONS.get(i);
            if(record==s.record.get()||(task!=null&&task==s.task.get()))return s;}}
        return null;
    }
    private static Object readCall(Object owner,String name){try{return owner==null?null:call(owner,name);}catch(ReflectiveOperationException unavailable){return "UNKNOWN";}}
    private static String label(Object value){String text=String.valueOf(value);return text.length()>160?text.substring(0,160)+"...":text;}
    private static void observe(AugmentModule module,Object activity,Session session,String stage){
        try{
            Object task=session.task.get();Object top=readCall(task,"getTopNonFinishingActivity");
            Context ctx=context(field(activity,"mAtmService"));
            String event=stage
                    +";age_ms="+(System.nanoTime()-session.started)/1_000_000
                    +";caller="+label(session.caller)+";activity="+label(field(activity,"shortComponentName"))
                    +";finishing="+field(activity,"finishing")+";task="+field(task,"mTaskId")
                    +";mode="+readCall(task,"getWindowingMode")+";top="+label(field(top,"shortComponentName"))
                    +";task_visible="+readCall(task,"isVisibleRequested");
            // Latest-value storage replaces previous values. Keep a small session
            // breadcrumb here so launch, callback and finish survive in one export.
            String history;
            synchronized(session){
                session.events.add(event);history=String.join(" | ",session.events);
                while(session.events.size()>1&&(session.events.size()>8||history.length()>1750)){
                    session.events.remove(0);session.dropped++;history=String.join(" | ",session.events);
                }
                history="dropped="+session.dropped+";events="+history;
            }
            FeatureSettings.diagnostic(ctx,"ls_augment_freeform_login_lifecycle","session="+Long.toHexString(session.started)+";read_only=true;"+history);
        }catch(Throwable failure){module.logFeatureError("FREEFORM_LOGIN_TRACE",failure);}
    }
}
