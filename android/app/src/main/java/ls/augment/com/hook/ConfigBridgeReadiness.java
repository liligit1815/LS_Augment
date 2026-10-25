package ls.augment.com.hook;

import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.os.IBinder;
import android.os.IInterface;
import android.os.SystemClock;
import android.os.UserManager;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/** Worker-only admission for the credential-protected module provider and its observer service. */
final class ConfigBridgeReadiness {
    private static final String AUTHORITY="ls.augment.com.config";
    private static final Uri PROVIDER=Uri.parse("content://"+AUTHORITY);
    static final long STARTUP_GRACE_MS=120_000L;
    private long waitingSince=-1;

    static final class Result {
        final String state,error,probeError;
        Result(String state,String error,String probeError){this.state=state;this.error=error;this.probeError=probeError;}
        boolean ready(){return "READY".equals(state);}
        boolean waiting(){return state.startsWith("WAITING_FOR_");}
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    Result check(Context context) {
        String probeError="";
        try {
            UserManager users=context.getSystemService(UserManager.class);
            if(users==null)return unavailable("WAITING_FOR_USER_SERVICE","user_service_unavailable",probeError);
            if(!users.isUserUnlocked()){
                // Unlock is a user prerequisite, not an outage with a deadline.
                waitingSince=-1;return new Result("WAITING_FOR_UNLOCK","",probeError);
            }
            IBinder content;
            try {
                Object service=invoke(Class.forName("android.os.ServiceManager"),"checkService",new Class<?>[]{String.class},"content");
                content=service==null?null:(IBinder)service;
            }catch(Exception unavailable){
                if(unavailable instanceof SecurityException)throw unavailable;
                probeError="service_manager_probe:"+callFailure(unavailable);
                // Older/OEM reflection surfaces may omit checkService. The
                // resolver's actual IContentService is an independent fallback.
                try {
                    Object service=invoke(ContentResolver.class,"getContentService",new Class<?>[0]);
                    content=service==null?null:((IInterface)service).asBinder();
                }catch(Exception fallback){
                    return new Result("FAILED","content_service_probe_failed:"+callFailure(fallback),probeError);
                }
            }
            if(content==null||!content.isBinderAlive())return unavailable("WAITING_FOR_SERVICE","content_service_unavailable",probeError);
            // PackageManager queries can hide a package from a hooked host even
            // when its exported provider is callable. The resolver belongs to
            // this Context's user; only real acquisition decides availability.
            try(ContentProviderClient client=context.getContentResolver().acquireUnstableContentProviderClient(PROVIDER)){
                if(client==null)return unavailable("WAITING_FOR_PROVIDER","module_provider_not_acquirable",probeError);
            }catch(IllegalArgumentException unavailable){
                if(!unknownAuthority(unavailable))throw unavailable;
                return unavailable("WAITING_FOR_PROVIDER","module_provider_not_acquirable",probeError);
            }
            waitingSince=-1;return new Result("READY","",probeError);
        }catch(Exception failure){return new Result("FAILED","readiness_probe_failed:"+callFailure(failure),probeError);}
    }

    private Result unavailable(String state,String reason,String probeError){
        long now=SystemClock.elapsedRealtime();
        if(waitingSince<0||now<waitingSince)waitingSince=now;
        if(now-waitingSince>=STARTUP_GRACE_MS)return new Result("FAILED",reason+":readiness_timeout",probeError);
        return new Result(state,"",probeError);
    }
    private static boolean unknownAuthority(IllegalArgumentException error){
        String message=error.getMessage();
        return message!=null&&(message.equals("Unknown authority "+AUTHORITY)
                ||message.equals("Unknown authority: "+AUTHORITY));
    }
    /** IPC exceptions can contain payload text; publish a bounded type and a known reason only. */
    static String callFailure(Throwable failure){
        if(failure instanceof IllegalArgumentException&&unknownAuthority((IllegalArgumentException)failure))
            return "provider_unavailable;exception=IllegalArgumentException";
        if(failure instanceof SecurityException)return "permission_denied;exception=SecurityException";
        String type=failure.getClass().getName();
        if(type.length()>160||!type.matches("[A-Za-z0-9_.$]+"))type="unknown";
        return "call_exception;type="+type;
    }
    private static Object invoke(Class<?> type,String name,Class<?>[] signature,Object...args)throws Exception{
        Method method=type.getDeclaredMethod(name,signature);method.setAccessible(true);
        try{return method.invoke(null,args);}catch(InvocationTargetException wrapped){
            Throwable cause=wrapped.getCause();
            if(cause instanceof Exception)throw (Exception)cause;
            if(cause instanceof Error)throw (Error)cause;
            throw wrapped;
        }
    }
}
