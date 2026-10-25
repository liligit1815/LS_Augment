package ls.augment.com.hook;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.ServiceInfo;
import android.graphics.Rect;
import android.graphics.Region;
import android.os.IBinder;
import android.os.Process;
import android.view.Display;
import android.view.WindowManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.LinkedHashMap;
import java.util.ArrayList;
import java.util.function.Consumer;

/** Local system-server metadata only. No node, text, title, pixels or clipboard is read here. */
final class AtomicWorkbenchExtractionWindowResolver {
    static final String PACKAGE = "ls.augment.com";
    static final ComponentName SERVICE = new ComponentName(PACKAGE, PACKAGE + ".AtomicWorkbenchPasteService");
    private static final Class<?>[] NONE = new Class<?>[0];
    private final Object wms, ams;
    private final Class<?> policyCache;
    private final Map<Object, Generation> generations = new LinkedHashMap<>();

    static final class Refusal extends Exception {
        final String reason;
        final String capability;
        Refusal(String reason) { this(reason, ""); }
        Refusal(String reason, String capability) { super("extraction_" + reason); this.reason = reason; this.capability = capability; }
    }
    static final class Connection {
        final Object connection;
        final IBinder binder;
        final int id;
        Connection(Object c, IBinder b, int id) { connection=c; binder=b; this.id=id; }
        boolean same(Connection c) { return c!=null&&connection==c.connection&&binder.equals(c.binder)&&id==c.id; }
    }
    static final class Window {
        final Object content, state, task, activity, surface;
        final IBinder token;
        final Rect bounds, frame;
        final Region region;
        final String name, unique, pkg, generation;
        final int display, uid, user, taskId, pid, rotation;
        final float x,y;
        Window(Object c,Object s,Object t,Object a,Object surface,IBinder token,Rect b,Rect frame,Region region,
                String name,String unique,String pkg,String generation,int display,int uid,int user,int taskId,int pid,int rotation,float x,float y) {
            content=c;state=s;task=t;activity=a;this.surface=surface;this.token=token;bounds=b;this.frame=frame;
            this.region=region;this.name=name;this.unique=unique;this.pkg=pkg;this.generation=generation;
            this.display=display;this.uid=uid;this.user=user;this.taskId=taskId;this.pid=pid;this.rotation=rotation;this.x=x;this.y=y;
        }
        boolean same(Window b) {
            return b!=null&&content==b.content&&state==b.state&&task==b.task&&activity==b.activity&&surface==b.surface
                &&token.equals(b.token)&&bounds.equals(b.bounds)&&frame.equals(b.frame)&&region.equals(b.region)
                &&name.equals(b.name)&&unique.equals(b.unique)&&pkg.equals(b.pkg)&&generation.equals(b.generation)
                &&display==b.display&&uid==b.uid&&user==b.user&&taskId==b.taskId&&pid==b.pid&&rotation==b.rotation
                &&Float.compare(x,b.x)==0&&Float.compare(y,b.y)==0;
        }
    }
    private static final class Generation {
        Window value;
        final String id=random();
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    AtomicWorkbenchExtractionWindowResolver(Object wms, ClassLoader loader) throws Exception {
        this.wms=wms;
        Object resolved=Class.forName("android.os.ServiceManager",false,loader).getMethod("getService",String.class).invoke(null,"accessibility");
        Class<?> type=Class.forName("com.android.server.accessibility.AccessibilityManagerService",false,loader);
        if(!type.isInstance(resolved))throw new Refusal("unavailable");
        ams=resolved;
        policyCache=Class.forName("android.app.admin.DevicePolicyCache",false,loader);
    }
    Context context() throws Exception { return (Context) field(wms,"mContext"); }

    /** Caller PID must be an actual ATMS-managed main process, not an app_process impostor. */
    void caller(int uid,int pid) throws Exception {
        if(uid<10000||pid<=0||pidUid(pid)!=uid)throw new Refusal("rejected");
        synchronized(field(wms,"mGlobalLock")) {
            if(number(wms,"mCurrentUserId")!=uid/100000)throw new Refusal("stale");
            Object p=call(field(wms,"mAtmService"),"getProcessController",new Class<?>[]{int.class,int.class},pid,uid);
            if(p==null||number(p,"mUid")!=uid||number(p,"mPid")!=pid||number(p,"mUserId")!=uid/100000
                    ||!PACKAGE.equals(field(p,"mName")))throw new Refusal("rejected");
            ApplicationInfo info=(ApplicationInfo)field(p,"mInfo");
            if(info==null||info.uid!=uid||!PACKAGE.equals(info.packageName))throw new Refusal("rejected");
        }
        // Package lookup is deliberately outside WMS and accessibility locks.
        if(userContext(context(),uid/100000).getPackageManager().getApplicationInfo(PACKAGE,0).uid!=uid)
            throw new Refusal("rejected");
    }
    Connection connection(int user,int uid) throws Exception {
        synchronized(field(ams,"mLock")) {
            if(number(ams,"mCurrentUserId")!=user)throw new Refusal("stale");
            Object us=call(ams,"getUserStateLocked",new Class<?>[]{int.class},user);
            if(us==null||!((Set<?>)field(us,"mEnabledServices")).contains(SERVICE))throw new Refusal("unavailable");
            Connection found=null;
            for(Object c:(List<?>)field(us,"mBoundServices")) {
                if(!SERVICE.equals(field(c,"mComponentName")))continue;
                if(found!=null)throw new Refusal("unavailable");
                IBinder client=(IBinder)field(c,"mClientBinder");
                AccessibilityServiceInfo info=(AccessibilityServiceInfo)field(c,"mAccessibilityServiceInfo");
                if(client==null||!client.isBinderAlive()||!Boolean.TRUE.equals(call(c,"isConnectedLocked",NONE))
                        ||!Boolean.TRUE.equals(field(c,"mRetrieveInteractiveWindows"))||info==null
                        ||(info.getCapabilities()&AccessibilityServiceInfo.CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT)==0
                        ||(info.flags&AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS)==0||info.getResolveInfo()==null)
                    throw new Refusal("unavailable");
                ServiceInfo si=info.getResolveInfo().serviceInfo;
                if(si==null||si.applicationInfo==null||si.applicationInfo.uid!=uid||!PACKAGE.equals(si.packageName)
                        ||!SERVICE.getClassName().equals(si.name)||!PACKAGE.equals(si.processName))throw new Refusal("rejected");
                found=new Connection(c,client,number(c,"mId"));
            }
            if(found==null)throw new Refusal("unavailable");return found;
        }
    }
    int accessibility(Window w,Connection expected) throws Exception {
        // connection() also takes only this one reentrant accessibility lock.
        synchronized(field(ams,"mLock")) {
            if(!expected.same(connection(w.user, expectedUid(expected))))throw new Refusal("stale");
            Object m=field(ams,"mA11yWindowManager");
            if(field(m,"mLock")!=field(ams,"mLock"))throw new Refusal("unavailable");
            int id=(Integer)call(m,"findWindowIdLocked",new Class<?>[]{int.class,IBinder.class},w.user,w.token);
            if(id<0||!w.token.equals(call(m,"getWindowTokenForUserAndWindowIdLocked",new Class<?>[]{int.class,int.class},w.user,id)))
                throw new Refusal("stale");
            return id;
        }
    }
    private static int expectedUid(Connection c) throws Exception {
        AccessibilityServiceInfo i=(AccessibilityServiceInfo)field(c.connection,"mAccessibilityServiceInfo");
        return i.getResolveInfo().serviceInfo.applicationInfo.uid;
    }

    Window window(int displayId,int user,float x,float y) throws Exception {
        if(displayId<0||!Float.isFinite(x)||!Float.isFinite(y))throw new Refusal("rejected");
        final List<AtomicWorkbenchDecorTransparency.Overlay> decorations=new ArrayList<>();
        final Window resolved;
        synchronized(field(wms,"mGlobalLock")) {
            if(number(wms,"mCurrentUserId")!=user)throw new Refusal("stale");
            Object drag=field(wms,"mDragDropController");
            if(field(drag,"mDragState")!=null||Boolean.TRUE.equals(call(drag,"dragDropActiveLocked",NONE)))throw new Refusal("cancelled");
            Object content=call(field(wms,"mRoot"),"getDisplayContent",new Class<?>[]{int.class},displayId);
            if(content==null)throw new Refusal("stale");
            Display d=(Display)field(content,"mDisplay");
            if(d==null||!d.isValid()||d.getDisplayId()!=displayId)throw new Refusal("stale");
            String unique=(String)call(d,"getUniqueId",NONE),name=d.getName();
            if(!identifier(name,256)||!identifier(unique,512))throw new Refusal("unavailable");
            Object s=call(content,"getTouchableWinAtPointLocked",new Class<?>[]{float.class,float.class},x,y);
            if(s==null||call(s,"getDisplayContent",NONE)!=content||!Boolean.TRUE.equals(call(s,"isVisible",NONE))
                    ||!Boolean.TRUE.equals(call(s,"isDisplayed",NONE))||!Boolean.TRUE.equals(field(s,"mHasSurface"))
                    ||Boolean.TRUE.equals(field(s,"mRemoved"))||Boolean.TRUE.equals(field(s,"mDestroying")))throw new Refusal("stale");
            WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)field(s,"mAttrs");
            if(attrs.type<1||attrs.type>=2000||(attrs.flags&WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE)!=0)throw new Refusal("rejected");
            Object a=field(s,"mActivityRecord"),session=field(s,"mSession"),t=call(s,"getTask",NONE);
            int uid=number(s,"mOwnerUid"),pid=number(session,"mPid");
            if(a==null||t==null||uid<0||uid/100000!=user||number(session,"mUid")!=uid||pidUid(pid)!=uid
                    ||number(a,"mUserId")!=user||number(t,"mUserId")!=user||call(t,"getDisplayContent",NONE)!=content)
                throw new Refusal("stale");
            String pkg=(String)field(a,"packageName");
            android.content.pm.ActivityInfo ai=(android.content.pm.ActivityInfo)field(a,"info");
            if(!identifier(pkg,256)||ai==null||ai.applicationInfo==null||ai.applicationInfo.uid!=uid
                    ||!pkg.equals(ai.packageName))throw new Refusal("rejected");
            IBinder token=binder(field(s,"mClient"));
            if(!token.isBinderAlive()||((Map<?,?>)field(wms,"mWindowMap")).get(token)!=s)throw new Refusal("stale");
            protectedWindow(s,attrs,pkg,uid,user);
            Rect frame=new Rect((Rect)call(s,"getFrame",NONE)),bounds=new Rect();
            call(s,"getVisibleBounds",new Class<?>[]{Rect.class},bounds);
            Region region=new Region();call(s,"getTouchableRegion",new Class<?>[]{Region.class},region);
            android.graphics.Point size=new android.graphics.Point();d.getRealSize(size);
            if(!bounds.intersect(frame)||!bounds.intersect(0,0,size.x,size.y)||!bounds.contains((int)x,(int)y)
                    ||!region.contains((int)x,(int)y))throw new Refusal("stale");
            // NOT_TOUCHABLE alone proves nothing. Only the original committed transparent region
            // of the exact privileged decoration client can resolve an overlapping rectangle.
            final boolean[] reached={false},blocked={false};
            final String[] blockage={""};
            Consumer<Object> visitor=above->{
                if(reached[0])return;
                if(above==s){reached[0]=true;return;}
                try {
                    if(Boolean.TRUE.equals(call(above,"isVisible",NONE))&&Boolean.TRUE.equals(call(above,"isDisplayed",NONE))) {
                        Rect r=new Rect();call(above,"getVisibleBounds",new Class<?>[]{Rect.class},r);
                        if(r.contains((int)x,(int)y)){
                            WindowManager.LayoutParams overlay=(WindowManager.LayoutParams)field(above,"mAttrs");
                            try{
                                if(displayId!=0||d.getRotation()!=android.view.Surface.ROTATION_0||decorations.size()>=4)throw new Refusal("unavailable");
                                decorations.add(new AtomicWorkbenchDecorTransparency.Overlay(above,content,displayId,size.x,size.y));
                            }catch(Exception unavailable){
                                blocked[0]=true;
                                blockage[0]=unavailable instanceof Refusal?((Refusal)unavailable).capability:"decor_"+unavailable.getClass().getSimpleName();
                                if(unavailable instanceof NoSuchFieldException||unavailable instanceof NoSuchMethodException){
                                    String field=unavailable.getMessage();if(field!=null&&field.matches("[A-Za-z0-9_]{1,64}"))blockage[0]+="_"+field;
                                }
                            }
                        }
                    }
                }catch(Exception unknown){blocked[0]=true;blockage[0]="overlay_capability_missing";}
            };
            call(content,"forAllWindows",new Class<?>[]{Consumer.class,boolean.class},visitor,true);
            if(!reached[0]||blocked[0])throw new Refusal("unavailable",blocked[0]?blockage[0]:"window_order_unknown");
            Object surface=field(s,"mSurfaceControl");
            Window structural=new Window(content,s,t,a,surface,token,bounds,frame,region,name,unique,pkg,"",displayId,uid,user,
                    number(t,"mTaskId"),pid,d.getRotation(),x,y);
            Generation g=generations.get(s);
            if(g==null||!sameStructure(g.value,structural)){g=new Generation();g.value=structural;generations.put(s,g);}
            while(generations.size()>64)generations.remove(generations.keySet().iterator().next());
            resolved=new Window(content,s,t,a,surface,token,bounds,frame,region,name,unique,pkg,g.id,displayId,uid,user,
                    structural.taskId,pid,structural.rotation,x,y);
        }
        // Cross-process work always occurs outside the WMS lock. Older/missing interfaces retain
        // the original refusal; this does not make a system or NOT_TOUCHABLE window transparent.
        for(AtomicWorkbenchDecorTransparency.Overlay overlay:decorations){
            if(userContext(context(),overlay.uid/100000).getPackageManager().getApplicationInfo("com.android.systemui",0).uid!=overlay.uid
                    ||pidUid(overlay.pid)!=overlay.uid||!overlay.clear(x,y))
                throw new Refusal("unavailable","decor_transparency_unconfirmed");
        }
        if(!decorations.isEmpty())synchronized(field(wms,"mGlobalLock")){
            for(AtomicWorkbenchDecorTransparency.Overlay overlay:decorations)if(!overlay.same())throw new Refusal("stale","decor_surface_changed");
            if(number(wms,"mCurrentUserId")!=user
                    ||call(resolved.content,"getTouchableWinAtPointLocked",new Class<?>[]{float.class,float.class},x,y)!=resolved.state
                    ||((Map<?,?>)field(wms,"mWindowMap")).get(resolved.token)!=resolved.state
                    ||!resolved.frame.equals(call(resolved.state,"getFrame",NONE))
                    ||((Display)field(resolved.content,"mDisplay")).getRotation()!=resolved.rotation)
                throw new Refusal("stale");
            protectedWindow(resolved.state,(WindowManager.LayoutParams)field(resolved.state,"mAttrs"),resolved.pkg,resolved.uid,user);
            // A newly displayed NOT_TOUCHABLE window can appear during the remote read without
            // changing the touch target. Recheck the actual complete order, not only the target.
            boolean[] reached={false},blocked={false};
            Consumer<Object> recheck=above->{
                if(reached[0])return;if(above==resolved.state){reached[0]=true;return;}
                try{
                    if(Boolean.TRUE.equals(call(above,"isVisible",NONE))&&Boolean.TRUE.equals(call(above,"isDisplayed",NONE))){
                        Rect bounds=new Rect();call(above,"getVisibleBounds",new Class<?>[]{Rect.class},bounds);
                        if(bounds.contains((int)x,(int)y)&&decorations.stream().noneMatch(overlay->overlay.state==above))blocked[0]=true;
                    }
                }catch(Exception unknown){blocked[0]=true;}
            };
            call(resolved.content,"forAllWindows",new Class<?>[]{Consumer.class,boolean.class},recheck,true);
            if(!reached[0]||blocked[0])throw new Refusal("stale","decor_window_order_changed");
        }
        return resolved;
    }
    void packageIdentity(Window w) throws Exception {
        if(userContext(context(),w.user).getPackageManager().getApplicationInfo(w.pkg,0).uid!=w.uid)throw new Refusal("stale");
    }
    private void protectedWindow(Object state,WindowManager.LayoutParams a,String pkg,int uid,int user) throws Exception {
        if((a.flags&WindowManager.LayoutParams.FLAG_SECURE)!=0||Boolean.TRUE.equals(call(state,"isSecureLocked",NONE)))throw new Refusal("protected","secure_window");
        if(number(state,"mShowUserId")!=user)throw new Refusal("protected","window_user");
        Object cache=policyCache.getMethod("getInstance").invoke(null);
        if(!Boolean.TRUE.equals(call(cache,"isScreenCaptureAllowed",new Class<?>[]{int.class},user)))throw new Refusal("protected","capture_policy");
        Object sensitive=field(wms,"mSensitiveContentPackages");
        if(sensitive==null)throw new Refusal("unavailable","sensitive_policy_missing");
        if(Boolean.TRUE.equals(call(sensitive,"shouldBlockScreenCaptureForApp",new Class<?>[]{String.class,int.class,IBinder.class},
                pkg,uid,call(state,"getWindowToken",NONE))))throw new Refusal("protected","sensitive_content");
    }
    private static boolean sameStructure(Window a,Window b) {
        return a!=null&&a.content==b.content&&a.state==b.state&&a.task==b.task&&a.activity==b.activity&&a.surface==b.surface
                &&a.token.equals(b.token)&&a.bounds.equals(b.bounds)&&a.frame.equals(b.frame)&&a.region.equals(b.region)
                &&a.name.equals(b.name)&&a.unique.equals(b.unique)&&a.pkg.equals(b.pkg)&&a.display==b.display&&a.uid==b.uid
                &&a.user==b.user&&a.taskId==b.taskId&&a.pid==b.pid&&a.rotation==b.rotation;
    }
    static Context userContext(Context context,int user) throws Exception {
        Object handle=android.os.UserHandle.class.getMethod("of",int.class).invoke(null,user);
        return (Context)Context.class.getMethod("createContextAsUser",android.os.UserHandle.class,int.class).invoke(context,handle,0);
    }
    static String random(){return UUID.randomUUID().toString().replace("-","");}
    static boolean hex(String s,int n){return s!=null&&s.length()==n&&s.matches("[0-9a-f]+");}
    static boolean identifier(String s,int max){if(s==null||s.isEmpty()||s.length()>max)return false;for(int i=0;i<s.length();i++)if(Character.isISOControl(s.charAt(i)))return false;return true;}
    static Object field(Object object,String name)throws Exception{if(object==null)throw new Refusal("unavailable");for(Class<?> c=object.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static int number(Object object,String name)throws Exception{return (Integer)field(object,name);}
    static Object call(Object object,String name,Class<?>[] types,Object...values)throws Exception{if(object==null)throw new Refusal("unavailable");for(Class<?> c=object.getClass();c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(object,values);}catch(NoSuchMethodException ignored){}throw new NoSuchMethodException(name);}
    static IBinder binder(Object object)throws Exception{return object instanceof IBinder?(IBinder)object:(IBinder)call(object,"asBinder",NONE);}
    static int pidUid(int pid)throws Exception{return (Integer)Process.class.getMethod("getUidForPid",int.class).invoke(null,pid);}
}
