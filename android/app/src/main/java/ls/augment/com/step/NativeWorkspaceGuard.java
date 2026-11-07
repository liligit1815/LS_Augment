package ls.augment.com.step;

import android.app.ActivityManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcelable;
import android.os.ResultReceiver;
import java.util.LinkedHashMap;
import java.util.Map;
import static ls.augment.com.step.StepRuntime.*;

/** Recovery owner lives in system_server, independently of the SystemUI host and test activity. */
final class NativeWorkspaceGuard {
    static final String ACTION = PACKAGE + ".WORKSPACE_NATIVE";
    static final long LIFETIME = 90000;
    static final Map<Integer, SavedTask> saved = new LinkedHashMap<>();
    static final java.util.LinkedHashSet<String> retired = new java.util.LinkedHashSet<>();
    static boolean registered, ending;
    static java.lang.reflect.Method replayPending;
    static int systemUiUid=-1, rejectedSenders, transitionReplays, committedOperations, completedRecoveries, sideFocusExclusions;
    static Class<?> physicalTaskType;
    static final String SYSTEM_CONTROL="android.permission.MANAGE_ACTIVITY_TASKS";
    static volatile boolean active;
    static IBinder owner;
    static String session;
    static ResultReceiver events;
    static IBinder.DeathRecipient death;
    static long lastSequence;
    static final SideSlots slots = new SideSlots();
    static Rect logical;
    static boolean sideLeft;
    static volatile NativeFlip flip;
    static ParkedWorkspace parked=new ParkedWorkspace(), readmitting=new ParkedWorkspace(), afterRestore;
    static boolean renewable;
    static int principal;
    static TaskIdentity lastMain,lastStandard,sessionHome,exitMain;
    static Object lastMainTask;
    static long homeSince;
    static TaskIdentity mainBeforeHomeKey;
    static long homeKeyAt;
    static boolean lastStandardManual;
    static long hostRevision;
    static int hostPage;
    static boolean hostTopFace;
    static Object unpublishedSurface;
    static CommitBarrier pendingCommit;
    static IBinder completedOwner;
    static String completedSession, recoveryReason;
    static long startedAt, recoveryStartedAt, recoveredAt;

    static final class SavedTask {
        final int id, user, requestedMode, layerId;
        final Object token, task, parent;
        final Rect bounds;
        final Point position;
        final TaskIdentity identity;
        boolean dirty;
        SavedTask(Object t, ActivityManager.RunningTaskInfo info) {
            id = info.taskId; user = StepMembers.getIntField(info, "userId"); token = field(info, "token"); task = t;
            identity = new TaskIdentity(id, user, 0, token);
            layerId = (Integer) call(call(t, "getSurfaceControl"), "getLayerId");
            parent = call(t, "getParent");
            bounds = new Rect((Rect) call(t, "getRequestedOverrideBounds"));
            requestedMode = (Integer) call(t, "getRequestedOverrideWindowingMode");
            position = new Point((Point) field(info, "positionInParent"));
        }
    }

    static void install(ClassLoader loader) {
        WorkspaceReadmit.probe(loader);
        try{
            Class<?> policy=Class.forName("com.android.server.policy.PhoneWindowManager",false,loader);
            java.lang.reflect.Method home=OwnershipBridge.method(policy,"handleShortPressOnHome",int.class);
            if(home.getReturnType()!=void.class || java.lang.reflect.Modifier.isStatic(home.getModifiers()))throw new NoSuchMethodException("Home 按键签名");
            StepHooks.hookMethod(home,new StepHook(){
                @Override protected void beforeHookedMethod(MethodHookParam p){
                    if(!active || ending || !Integer.valueOf(0).equals(p.args[0]))return;
                    synchronized(Wm.lock){
                        if(!active || ending)return;
                        rememberMain();mainBeforeHomeKey=mainAtExit("");homeKeyAt=android.os.SystemClock.uptimeMillis();
                    }
                }
            });
        }catch(ReflectiveOperationException|LinkageError unavailable){report(null,0,"未识别原屏 Home 按键入口："+unavailable,-1);}
        try {
            observeTaskRemoval(Class.forName("com.android.server.wm.Task", false, loader));
            Class<?> window=Class.forName("com.android.server.wm.WindowState",false,loader);
            java.util.ArrayList<java.lang.reflect.Method> focusMethods=new java.util.ArrayList<>();
            for(Class<?>[] args:new Class<?>[][]{new Class<?>[]{},new Class<?>[]{boolean.class}}){
                try{focusMethods.add(OwnershipBridge.method(window,"canReceiveKeys",args));}
                catch(NoSuchMethodException absent){}
            }
            if(focusMethods.isEmpty())throw new NoSuchMethodException("WindowState.canReceiveKeys");
            focusMethods.add(SideFocus.imeMethod(window));
            java.lang.reflect.Method updateFocus=OwnershipBridge.method(Wm.service.getClass(),"updateFocusedWindowLocked",int.class,boolean.class);
            if(updateFocus.getReturnType()!=boolean.class)throw new NoSuchMethodException("WMS focus update result");
            StepHooks.hookMethod(updateFocus,new StepHook(){
                void observe(){
                    if(!active || ending || !Thread.holdsLock(Wm.lock))return;
                    try{
                        Object w=field(Wm.display,"mCurrentFocus");
                        if(w!=null)rememberMain(call(w,"getTask"));
                    }catch(RuntimeException|LinkageError ignored){}
                }
                @Override protected void beforeHookedMethod(MethodHookParam p){observe();}
                @Override protected void afterHookedMethod(MethodHookParam p){observe();GameInput.refreshUnderLock();WorkspaceIme.request();}
            });
            for(java.lang.reflect.Method method:focusMethods){
                if(method.getReturnType()!=boolean.class||java.lang.reflect.Modifier.isStatic(method.getModifiers()))
                    throw new NoSuchMethodException("Unknown focus selection contract");
                StepHooks.hookMethod(method,new StepHook(){
                    @Override protected void afterHookedMethod(MethodHookParam p){
                        if(p.hasThrowable()||!Boolean.TRUE.equals(p.getResult())||!active||ending)return;
                        try{
                            Object task=call(p.thisObject,"getTask");
                            int id=task==null?-1:StepMembers.getIntField(task,"mTaskId");
                            if (slots.index(id) < 0) return;
                            SavedTask record=saved.get(id);
                            if(call(p.thisObject,"getDisplayContent")==Wm.display
                                    && (Integer)call(task,"getWindowingMode")==6
                                    &&SideFocus.excludes(active,ending,id,id,record==null?null:record.task,task,record!=null&&record.dirty)){
                                p.setResult(false);sideFocusExclusions++;
                            }
                        }catch(Throwable error){final IBinder expected=owner;Wm.handler.post(()->{if(owner==expected)finish("副任务焦点身份不可核验");});}
                    }
                });
            }
            Class<?> transition=StepMembers.findClass("com.android.server.wm.Transition",loader);
            replayPending=TransitionCompletion.transactionReplay(Wm.display.getClass(),
                    Class.forName("android.view.SurfaceControl$Transaction",false,loader));
            // Shell may apply its finish transaction after this session exits. Writing
            // workspace matrices to that transaction can resurrect a cleared display
            // transform. Reconcile on native completion against the live owner below.
            java.lang.reflect.Method finish=TransitionCompletion.resolve(transition,
                    StepMembers.findClassIfExists("com.android.server.wm.ActionChain",loader));
            StepHooks.hookMethod(finish,new StepHook(){
                @Override protected void afterHookedMethod(MethodHookParam p){
                    if(p.hasThrowable()||!active||ending||Wm.handler==null)return;
                    final IBinder expected=owner;
                    // Shell's native finish transaction resets a newly opened task's
                    // matrix. Reconcile after native completion, only for this lease.
                    // A queued callback from a closed workspace cannot touch a new one.
                    Wm.handler.post(()->{
                        synchronized(Wm.lock){
                            if(!active||ending||owner!=expected||!Wm.active
                                    ||field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec)return;
                            try{replay();transitionReplays++;}
                            catch(Throwable failure){finish("原厂转场结束后主屏恢复失败");}
                        }
                    });
                }
            });
            Class<?> wc = StepMembers.findClass("com.android.server.wm.WindowContainer", loader);
            Class<?> tx = StepMembers.findClass("android.view.SurfaceControl$Transaction", loader);
            Class<?> spec = StepMembers.findClass("android.view.MagnificationSpec", loader);
            if(OwnershipBridge.method(wc,"shouldMagnify").getReturnType()!=boolean.class
                    || OwnershipBridge.method(wc,"clearMagnificationSpec",tx).getReturnType()!=void.class)
                throw new NoSuchMethodException("原生缩放归属迁移接口");
            try{
                Class<?> task=Class.forName("com.android.server.wm.Task",false,loader);
                if(OwnershipBridge.method(task,"getWindowingMode").getReturnType()==int.class
                        && OwnershipBridge.method(task,"clearMagnificationSpec",tx).getReturnType()==void.class
                        && StepMembers.findField(task,"mLastMagnificationSpec").getType()==spec)physicalTaskType=task;
            }catch(ReflectiveOperationException|LinkageError absent){physicalTaskType=null;}
            StepMembers.findAndHookMethod(wc, "applyMagnificationSpec", tx, spec, new StepHook() {
                @Override protected void beforeHookedMethod(MethodHookParam p) {
                    if (!active) return;
                    try {
                        if(PhysicalIme.ownsContainer(p.thisObject) || PhysicalFingerprint.window(p.thisObject) || physicalNativeWindow(p.thisObject)){
                            if(field(p.thisObject,"mLastMagnificationSpec")!=null)call(p.thisObject,"clearMagnificationSpec",p.args[0]);
                            p.setResult(null);
                        }else if (ownsMagnification(p.thisObject)) p.setResult(null);
                        else normalizeMagnificationOwner(p.thisObject,p.args[0],p.args[1]);
                    } catch (Throwable error) {
                        final IBinder expected = owner;
                        Wm.handler.post(() -> { if (owner == expected) finish("侧窗缩放能力失效"); });
                    }
                }
            });
        } catch (Throwable error) { report(null, -1, "原任务缩放隔离不可用: " + error, -1); return; }
        if (registered) return;
        try {
            android.content.pm.ApplicationInfo ui=Wm.context.getPackageManager().getApplicationInfo("com.android.systemui",0);
            if ((ui.flags&(android.content.pm.ApplicationInfo.FLAG_SYSTEM|android.content.pm.ApplicationInfo.FLAG_UPDATED_SYSTEM_APP))==0
                    ||Wm.context.checkPermission(SYSTEM_CONTROL,-1,ui.uid)!=android.content.pm.PackageManager.PERMISSION_GRANTED)
                throw new IllegalStateException("SystemUI缺少原生任务管理权限");
            systemUiUid=ui.uid;
            Wm.context.registerReceiver(new BroadcastReceiver() {
                @Override public void onReceive(Context c, Intent i) {
                    // Check framework-provided sender identity before reading any payload.
                    if(!WorkspaceCaller.trusted(systemUiUid,getSentFromUid())){
                        rejectedSenders++;
                        if(rejectedSenders==1)diagnostic("SENDER_REJECTED","expected_uid="+systemUiUid+";delivered_uid="+getSentFromUid());
                        return;
                    }
                    if ("probe".equals(i.getStringExtra("operation"))) {
                        // Capability-only query; it never enables or begins a workspace.
                        answer(i,registered,"系统框架");return;
                    }
                    if ("readiness".equals(i.getStringExtra("operation"))) {
                        answer(i,registered && StepRuntime.enabled,"系统框架");return;
                    }
                    execute(i);
                }
            }, new IntentFilter(ACTION), SYSTEM_CONTROL, Wm.handler, Context.RECEIVER_EXPORTED);
            registered = true;
            try{WorkspaceGestureGate.installServer();}catch(RuntimeException missing){report(null,0,"工作区手势状态通道不可用："+missing,-1);}
            LocalLandscape.install(loader); PhysicalIme.install(loader); WorkspaceIme.install(loader); PhysicalFingerprint.install(loader); WorkspaceResize.install(loader);WorkspaceResize.installUpperBounds(loader); EdgeHandoff.install(loader);
            WorkspaceRoutes.installDesktop(loader);WorkspaceRecents.install(loader);WorkspaceRecents.installShade(loader);
        } catch (Throwable error) { report(null, -1, "原任务恢复入口注册失败: " + error, -1); }
    }
    static void observeTaskRemoval(Class<?> taskType) throws Exception {
        boolean found = false;
        for (Class<?>[] arguments : new Class<?>[][] { {}, { String.class } }) {
            java.lang.reflect.Method remove;
            try { remove = taskType.getDeclaredMethod("removeImmediately", arguments); }
            catch (NoSuchMethodException absent) { continue; }
            if (remove.getReturnType() != void.class || java.lang.reflect.Modifier.isStatic(remove.getModifiers()))
                throw new NoSuchMethodException("Unknown original task removal signature");
            StepHooks.hookMethod(remove, new StepHook() {
                @Override protected void afterHookedMethod(MethodHookParam p) {
                    if (p.hasThrowable() || !active || ending) return;
                    synchronized (Wm.lock) {
                        int id = StepMembers.getIntField(p.thisObject, "mTaskId");
                        if(NativeTopTask.upper!=null && NativeTopTask.upper.task==p.thisObject){
                            IBinder expected=owner;SavedTask upper=NativeTopTask.upper;
                            Wm.handler.post(()->{
                                boolean gone;synchronized(Wm.lock){gone=owner==expected && NativeTopTask.upper==upper && liveTask(upper.id,upper.token)==null;}
                                if(gone)finish("顶部任务已结束");
                            });
                        }
                        SavedTask side = slots.index(id) < 0 ? null : saved.get(id);
                        if (side != null && side.dirty && side.task == p.thisObject) {
                            IBinder expected = owner;
                            Wm.handler.post(() -> recoverRemovedSide(expected, side));
                        }
                    }
                }
            });
            found = true;
        }
        if (!found) throw new NoSuchMethodException("Task.removeImmediately");
    }
    static void recoverRemovedSide(IBinder expected, SavedTask side) {
        int slot = slots.index(side.id);
        if (!active || ending || owner != expected || slot < 0) return;
        try {
            synchronized (Wm.lock) {
                if (saved.get(side.id) != side || !side.dirty || liveTask(side.id, side.token) == side.task) return;
            }
            if (pendingCommit != null || flip != null || slots.count() == 1) {
                finish("系统确认副任务已结束，归还工作区");
                return;
            }
            synchronized (Wm.lock) {
                slots.replace(slot, side.id, -1);
                side.dirty = false;
                saved.remove(side.id);
                replay();
            }
            Bundle change = base();
            change.putInt("slot", slot);
            change.putInt("removed", side.id);
            respond(events, 97, change, "副任务已结束，释放第" + (slot + 1) + "格");
        } catch (Throwable error) {
            finish("副任务移除后身份不可核验，归还工作区：" + error);
        }
    }
    static boolean ownsTask(Object candidate) {
        if (candidate == null || !active) return false;
        SavedTask upper=NativeTopTask.upper;
        if(!ending && upper!=null && upper.dirty && upper.task==candidate)return true;
        NativeFlip moving=flip;
        if (!ending && moving!=null)for(SavedTask actor:moving.actors)
            if(actor!=null && actor.task==candidate)return true;
        // applyMagnificationSpec is invoked for non-Task containers too.
        for (int slot = 0; slot < SideSlots.MAX_COUNT; slot++) {
            int id = slots.task(slot);
            if (id < 0) continue;
            SavedTask record = saved.get(id);
            // An OEM launch can promote this exact task before Shell reports it.
            // Its fullscreen transition must no longer inherit preview isolation.
            if (record != null && record.dirty && record.task == candidate
                    && (Integer)call(candidate,"getWindowingMode")==6) return true;
        }
        return false;
    }
    static boolean ownsMagnification(Object candidate) {
        if(!ownsTask(candidate))return false;
        NativeFlip moving=flip;
        // The outgoing fullscreen task stays on its native parent while HOME
        // draws. Keep magnifying it until the first animation transaction also
        // reparents it; logical ownership still blocks competing operations.
        if(!ending && moving!=null && !moving.ownsTransforms && moving.actors[0]!=null
                && moving.actors[0].task==candidate)return false;
        return true;
    }
    static void normalizeMagnificationOwner(Object container,Object transaction,Object spec) {
        if(!Wm.active || spec==null || spec!=Wm.ownedSpec
                || field(Wm.display,"mMagnificationSpec")!=spec
                || call(container,"getDisplayContent")!=Wm.display)return;
        // Native applyMagnificationSpec returns immediately when a parent can own
        // the transform. It does not clear the former child owners in that branch.
        // Clear their cached transforms in THIS transaction before native applies
        // the one parent transform; otherwise the last preview returning produces M*M.
        // Physical/preview owners are excluded by the caller and shouldMagnify.
        if(Boolean.TRUE.equals(call(container,"shouldMagnify")))
            call(container,"clearMagnificationSpec",transaction);
    }
    static boolean physicalNativeWindow(Object task){
        if(!active || physicalTaskType==null || !physicalTaskType.isInstance(task) || call(task,"getDisplayContent")!=Wm.display)return false;
        int mode=(Integer)call(task,"getWindowingMode");
        return mode==5 || mode==2;
    }
    static Bundle base() {
        Bundle b = new Bundle(); b.putString("session", session);
        b.putBoolean("homeBackdropAvailable",WorkspaceReadmit.available);
        b.putString("state", ending ? "RESTORING" : active ? "ACTIVE" : "RESTORED");
        b.putLong("elapsed",android.os.SystemClock.elapsedRealtime()-startedAt);
        b.putIntArray("slots", slots.snapshot()); return b;
    }
    static void respond(ResultReceiver r, int code, Bundle b, String message) {
        b.putString("message", message);
        report(null, 0, message, b.getInt("side", -1));
        if (r != null) try { r.send(code, b); } catch (Throwable ignored) { }
    }
    static void execute(Intent intent) {
        ResultReceiver reply = intent.getParcelableExtra("reply");
        String action = intent.getStringExtra("operation");
        boolean applyingRoles = false;
        try {
            Bundle extras = intent.getExtras();
            boolean current=extras!=null&&owner!=null&&owner.equals(extras.getBinder("owner"))
                    &&session!=null&&session.equals(intent.getStringExtra("session"));
            boolean completed=extras!=null&&completedOwner!=null&&completedOwner.equals(extras.getBinder("owner"))
                    &&completedSession.equals(intent.getStringExtra("session"));
            if ("state".equals(action) || ("end".equals(action)&&completed&&!active)) {
                if(!current&&!completed)throw new IllegalStateException("状态查询凭据不匹配");
                Bundle b=base();b.putString("session",intent.getStringExtra("session"));
                if(completed&&!current)b.putString("state","RESTORED");
                respond(reply,0,b,"系统服务工作区状态="+b.getString("state"));return;
            }
            if ("end".equals(action) && !active) {
                retire(intent.getStringExtra("session"));
                Bundle b = new Bundle(); b.putString("session", intent.getStringExtra("session"));
                b.putString("state","RESTORED");
                respond(reply, 0, b, "该工作区未持有系统任务"); return;
            }
            if ("begin".equals(action)) { begin(intent, reply); return; }
            if (!active || !current) throw new IllegalStateException("旧会话或恢复凭据不匹配");
            if(ending){respond(reply,0,base(),"系统服务正在归还原任务");return;}
            if("viewState".equals(action)){
                long revision=intent.getLongExtra("viewRevision",-1);
                if(revision>hostRevision){
                    hostRevision=revision;hostPage=Math.max(0,Math.min(4,intent.getIntExtra("page",0)));
                    hostTopFace=intent.getBooleanExtra("topFace",false);
                }
                return;
            }
            long sequence = intent.getLongExtra("sequence", -1);
            if (sequence <= lastSequence) throw new IllegalStateException("过期的工作区操作");
            lastSequence = sequence;
            if(pendingCommit!=null&& !"end".equals(action))throw new IllegalStateException("等待前一次图层提交");
            if(WorkspaceZoom.motion!=null && !"end".equals(action))throw new IllegalStateException("原屏正在转场");
            if("enterZoom".equals(action) || "exitZoom".equals(action)){
                WorkspaceZoom.start("enterZoom".equals(action),intent.getLongExtra("starts",android.os.SystemClock.uptimeMillis()),reply);return;
            }
            if ("lost".equals(action)) {
                int id = intent.getIntExtra("task", -1);
                SavedTask record = saved.get(id);
                if (record != null && slots.index(id) >= 0 && record.token.equals(intent.getParcelableExtra("token"))) {
                    recoverRemovedSide(owner, record);
                    if (!ending && slots.index(id) >= 0) finish("副任务监听权已移交，归还工作区");
                }
                respond(reply, 0, base(), "已核对结束任务"); return;
            }
            if (flip != null && !"roles".equals(action) && !"end".equals(action))
                throw new IllegalStateException("换边正在进行");
            if ("flip".equals(action)) {
                synchronized(Wm.lock) {
                    if(!interactive(Wm.context))throw new IllegalStateException("屏幕已锁定");
                    flip=new NativeFlip(intent);
                    flip.start(reply);
                }
            }
            else if ("position".equals(action)) {
                applyingRoles=true;
                position(intent,reply);
            }
            else if ("renew".equals(action)) {
                if(!renewable || !interactive(Wm.context) || owner==null || !owner.isBinderAlive())
                    throw new IllegalStateException("当前会话不能续期");
                Wm.handler.removeCallbacks(Wm.TIMEOUT);Wm.handler.postDelayed(Wm.TIMEOUT,LIFETIME);
                respond(reply,0,base(),"原屏工作区已续期");
            }
            else if ("localLandscape".equals(action) || "edgeHandoff".equals(action)){
                synchronized(Wm.lock){
                    try{
                        int id=intent.getIntExtra("task",-1);Object token=intent.getParcelableExtra("token");
                        Object task=liveTask(id,token);
                        if(!interactive(Wm.context) || task==null || task!=call(Wm.display,"getFocusedRootTask") || ownsTask(task)
                                || (Integer)call(task,"getWindowingMode")!=1 || (Integer)call(task,"getActivityType")!=1
                                || !WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId")))throw new IllegalStateException("主应用已变化");
                        if("edgeHandoff".equals(action)){EdgeHandoff.request(task,id,token,reply);return;}
                        LocalLandscape.toggle(task);respond(reply,0,base(),LocalLandscape.manual?"当前应用已独立横屏":"已恢复应用自身方向");
                    }catch(Exception e){respond(reply,0,base(),"当前操作不可用："+e.getMessage());}
                }
            }
            else if ("compact".equals(action)){
                synchronized(Wm.lock){slots.compact(intent.getIntArrayExtra("before"));}
                respond(reply,0,base(),"副格顺序已提交");
            }
            else if ("reserve".equals(action)){
                try{reserve(intent,reply);}
                catch(RuntimeException stale){
                    if(intent.getIntExtra("retainedSlot",-1)<0)throw stale;
                    Bundle b=base();b.putBoolean("skip",true);respond(reply,0,b,"原格已不满足重新收纳条件");
                }
            }
            else if ("top".equals(action)) {
                applyingRoles=true;
                try{NativeTopTask.change(intent,reply);}
                catch(IllegalStateException refused){
                    if(pendingCommit!=null || NativeTopTask.upper!=null)throw refused;
                    Bundle b=base();b.putBoolean("topRefused",true);b.putInt("upper",-1);
                    respond(reply,0,b,"此任务保留原窗口："+refused.getMessage());
                }
            }
            else if ("adoptPromotion".equals(action)) {
                // A native launcher may promote a leased task through an OEM
                // launch path. Validate that exact task before relinquishing it.
                synchronized(Wm.lock){
                    if(!canAdoptPromotion(intent))throw new IllegalStateException("系统切回主区的任务身份未确认");
                }
                applyingRoles=true;
                roles(new Intent(intent).putExtra("task",-1).putExtra("previous",intent.getIntExtra("task",-1))
                        .putExtra("externalPromotion",true),reply);
            }
            else if ("roles".equals(action)) {
                applyingRoles = true;
                roles(intent, reply);
            }
            else if ("replay".equals(action)) {
                CommitBarrier group=pendingCommit=new CommitBarrier();
                IBinder expected=owner;
                synchronized (Wm.lock) { replay(group,null); }
                group.seal();
                awaitCommit(group,expected,android.os.SystemClock.uptimeMillis()+1800,
                        ()->respond(reply,0,base(),"主屏缩放与输入事务已提交"),
                        ()->finish("主屏缩放交接提交未确认"));
            } else if ("end".equals(action)) {
                hostPage=intent.getIntExtra("page",0);hostTopFace=intent.getBooleanExtra("topFace",false);
                finish(!intent.getBooleanExtra("retain",false)?"手动退出":intent.getBooleanExtra("homeExit",false)?"桌面暂挂":"工作区暂挂");
                respond(reply, 0, base(), "系统服务已接收归还请求");
            } else throw new IllegalArgumentException("unknown workspace command");
        } catch (Throwable error) {
            if (unpublishedSurface != null) {
                // clearMagnificationSpec updates WM's cache while filling this transaction. If
                // admission aborts before WCT consumes it, publish the matching clears before undo.
                try { call(unpublishedSurface, "apply"); } catch (Throwable ignored) { }
                unpublishedSurface = null;
            }
            respond(reply, -1, base(), "工作区操作未完成: " + error);
            if (active && applyingRoles) finish("任务交接失败回退 ("+action+")："+error);
        }
    }
    static void begin(Intent i, ResultReceiver reply) throws Exception {
        if(!StepRuntime.enabled)throw new IllegalStateException("红魔Step已关闭");
        if (active || Wm.active || ending) throw new IllegalStateException("已有缩放或工作区运行");
        IBinder candidate = i.getExtras().getBinder("owner");
        String candidateSession = i.getStringExtra("session");
        if (candidate == null || candidateSession == null || !candidate.isBinderAlive() || retired.contains(candidateSession)) throw new IllegalStateException("缺少恢复凭据或会话已经退出");
        // Check every mutating and inverse primitive before activating any display change.
        ClassLoader cl = Wm.loader;
        Class<?> token = Class.forName("android.window.WindowContainerToken", false, cl);
        Class<?> transaction = Class.forName("android.window.WindowContainerTransaction", false, cl);
        for (String name : new String[]{"setFocusable", "setAlwaysOnTop", "setForceTranslucent", "setHidden", "reorder"})
            OwnershipBridge.method(transaction, name, token, boolean.class);
        OwnershipBridge.method(transaction, "setWindowingMode", token, int.class);
        OwnershipBridge.method(transaction, "setBounds", token, Rect.class);
        OwnershipBridge.method(transaction, "setBoundsChangeTransaction", token, Class.forName("android.view.SurfaceControl$Transaction", false, cl));
        OwnershipBridge.method(Wm.display.getClass(), "reapplyMagnificationSpec");
        // This cache is part of the inverse operation, so reject unknown layouts
        // before enabling magnification or borrowing any original task surface.
        WorkspaceTransform.requireCache(Class.forName("com.android.server.wm.WindowContainer",false,cl),
                Class.forName("android.view.MagnificationSpec",false,cl));
        WorkspaceZoom.entered=false;principal=WorkspaceUsers.foreground();
        if(principal<0 || i.getIntExtra("user",-1)!=principal)throw new IllegalStateException("当前用户未核实");
        owner = candidate; session = candidateSession; lastSequence = i.getLongExtra("sequence", 0);
        events = i.getParcelableExtra("events"); saved.clear(); slots.clear();NativeTopTask.reset();
        logical = new Rect((Rect) call(Wm.display, "getBounds")); logical.offsetTo(0, 0);
        death = () -> Wm.handler.post(() -> {
            if (owner == candidate && candidateSession.equals(session)) finish("系统界面进程结束，归还原任务");
        });
        owner.linkToDeath(death, 0);
        lastMain=null;lastStandard=null;lastMainTask=null;lastStandardManual=false;homeSince=0;hostPage=0;hostTopFace=false;
        mainBeforeHomeKey=null;homeKeyAt=0;
        readmitting=parked.principal==principal?parked.copy():new ParkedWorkspace();
        hostRevision=0;hostPage=readmitting.page;hostTopFace=readmitting.topFace;
        sideLeft=readmitting.principal==principal?readmitting.left:i.getBooleanExtra("leftSide", false);
        Wm.start();
        if (!Wm.active) { owner.unlinkToDeath(death, 0); owner = null; throw new IllegalStateException("主屏缩放启动失败"); }
        active = true;pendingCommit=null;recoveryReason=null;recoveredAt=0;
        renewable=i.getBooleanExtra("renewable",false);afterRestore=null;
        startedAt=android.os.SystemClock.elapsedRealtime();
        Wm.handler.removeCallbacks(Wm.TIMEOUT);
        Wm.handler.postDelayed(Wm.TIMEOUT, LIFETIME);
        Bundle b = base(); b.putParcelable("logical", logical);
        b.putBoolean("topAvailable",NativeTopTask.available());
        b.putBoolean("forceResize",WorkspaceResize.available);b.putBoolean("localLandscape",LocalLandscape.available && logical.width()<logical.height());b.putBoolean("edgeHandoff",EdgeHandoff.enter!=null);
        synchronized(Wm.lock){
            int homeId=i.getIntExtra("home",-1);Object homeToken=i.getParcelableExtra("homeToken");
            Object home=homeToken==null?null:liveTask(homeId,homeToken);
            sessionHome=home!=null && home==call(home,"getRootTask") && (Integer)call(home,"getActivityType")==2
                    && (Integer)field(home,"mUserId")==principal?new TaskIdentity(homeId,principal,0,homeToken):null;
            if(sessionHome==null)report(null,0,"未找到当前用户原屏桌面任务",-1);
            if(readmitting.principal==principal){
                int count=i.getIntExtra("sideCount",SideSlots.DEFAULT_COUNT);
                readmitting.retainRunning(id->eligibleMain(id)!=null,SideSlots.validCount(count)?count:SideSlots.DEFAULT_COUNT,i.getBooleanExtra("upperEnabled",false));
                restoreMain(readmitting);
            }else rememberMain();
        }
        b.putBoolean("left",sideLeft);b.putInt("page",readmitting.page);b.putBoolean("topFace",readmitting.topFace);
        PhysicalIme.refreshParent();
        WorkspaceGestureGate.keepAlive(owner);
        if(LocalLandscape.available)LocalLandscape.watch(owner);
        b.putIntArray("retained",readmitting.idsFor(user->WorkspaceUsers.allows(Wm.context,principal,user)));
        respond(reply, 0, b, "工作区已准备；90秒恢复计时由系统服务持有");
    }
    static boolean runningActivity(Object task){
        if(task==null)return false;
        try{
            Object a=call(task,"topRunningActivity");
            return a!=null && Boolean.TRUE.equals(call(a,"attachedToProcess"));
        }catch(RuntimeException|LinkageError missing){return false;}
    }
    static void rememberMain(){
        rememberMain(call(Wm.display,"getFocusedRootTask"));
    }
    static void rememberMain(Object task){
        if(task!=null && task==lastMainTask){
            if(homeSince==0)lastStandardManual=LocalLandscape.manualApp!=null && call(LocalLandscape.manualApp,"getTask")==task;
            return;
        }
        if(task==null || call(task,"getDisplayContent")!=Wm.display || (Integer)call(task,"getWindowingMode")!=1 ||
                task!=call(task,"getRootTask") || !runningActivity(task) || ownsTask(task))return;
        ActivityManager.RunningTaskInfo t=(ActivityManager.RunningTaskInfo)call(task,"getTaskInfo");
        int type=(Integer)call(t,"getActivityType"),user=(Integer)field(t,"userId");
        if((type==1 || type==2) && t.topActivity!=null && WorkspaceUsers.allows(Wm.context,principal,user)){
            lastMain=new TaskIdentity(t.taskId,user,(Integer)field(t,"displayId"),field(t,"token"));lastMainTask=task;
            if(type==1){
                lastStandard=lastMain;homeSince=0;lastStandardManual=LocalLandscape.manualApp!=null && call(LocalLandscape.manualApp,"getTask")==task;
            }else homeSince=android.os.SystemClock.uptimeMillis();
        }
    }
    static TaskIdentity mainAtExit(String reason){
        if("桌面暂挂".equals(reason) && mainBeforeHomeKey!=null && android.os.SystemClock.uptimeMillis()-homeKeyAt<1800){
            return eligibleMain(mainBeforeHomeKey)!=null?mainBeforeHomeKey:sessionHome;
        }
        // Home changes WM focus before SystemUI receives CLOSE_SYSTEM_DIALOGS. Keep the
        // preceding app for that transition, but preserve a desktop that was already in use.
        if("桌面暂挂".equals(reason) && lastStandard!=null && homeSince>0 && android.os.SystemClock.uptimeMillis()-homeSince<1800){
            Object previous=liveTask(lastStandard.id,lastStandard.token);
            if(runningActivity(previous) && !ownsTask(previous) && (Integer)call(previous,"getWindowingMode")==1)return lastStandard;
        }
        return eligibleMain(lastMain)!=null?lastMain:sessionHome;
    }
    static Object eligibleMain(TaskIdentity old){
        if(old==null || !WorkspaceUsers.allows(Wm.context,principal,old.user))return null;
        Object task=liveTask(old.id,old.token);
        if(!runningActivity(task) || task!=call(task,"getRootTask") || (Integer)call(task,"getWindowingMode")!=1
                || (Integer)field(task,"mUserId")!=old.user || ownsTask(task))return null;
        return task;
    }
    static void restoreMain(ParkedWorkspace scene){
        TaskIdentity old=scene.main==null?sessionHome:scene.main;
        Object task=eligibleMain(old);
        if(task==null)return;
        try{
            if(task!=call(Wm.display,"getFocusedRootTask")){
                Object wct=transaction();call(wct,"reorder",old.token,true);apply(wct);
            }
            if(task==call(Wm.display,"getFocusedRootTask")){
                lastMainTask=null;rememberMain(task);
                if(scene.manualMain && LocalLandscape.available && LocalLandscape.scene() && LocalLandscape.manualApp==null)LocalLandscape.toggle(task);
            }
        }catch(Exception|LinkageError e){report(null,0,"主任务未恢复："+e,old.id);}
    }
    static Object liveTask(int id, Object expectedToken) {
        // Mode 0 only looks up an already running task; it cannot resurrect a task from Recents.
        Object task = call(field(Wm.service, "mRoot"), "anyTaskForId", id, 0);
        if (task == null) return null;
        ActivityManager.RunningTaskInfo info = (ActivityManager.RunningTaskInfo) call(task, "getTaskInfo");
        if (info.taskId != id || StepMembers.getIntField(info, "displayId") != 0 || expectedToken == null || !expectedToken.equals(field(info, "token")))
            return null; // A reused ID is not the original task and must never be restored or modified.
        return task;
    }
    static void reserve(Intent i, ResultReceiver reply) {
        synchronized (Wm.lock) {
            if (!interactive(Wm.context)) throw new IllegalStateException("请在解锁状态收纳");
            int id = i.getIntExtra("task", -1); Object token = i.getParcelableExtra("token");
            Object task = liveTask(id, token);
            int from=i.getIntExtra("retainedSlot",-1);
            if(from>=0 && (!runningActivity(task) || !readmitting.matches(from,id,(Integer)field(task,"mUserId"),token)
                    || (Integer)call(task,"getWindowingMode")!=1)){
                Bundle stale=base();stale.putBoolean("skip",true);respond(reply,0,stale,"旧任务已变化或已在主区，跳过恢复");return;
            }
            if (task == null || task != call(task, "getRootTask")) throw new IllegalStateException("仅支持正在运行的独立根任务");
            if(from>=0)WorkspaceReadmit.wake(task,owner);
            ActivityManager.RunningTaskInfo info = (ActivityManager.RunningTaskInfo) call(task, "getTaskInfo");
            if ((Integer) call(info, "getActivityType") != 1 || (Integer) call(info, "getWindowingMode") != 1
                    || from<0 && !StepMembers.getBooleanField(info, "isFocused") || (!WorkspaceResize.available && !StepMembers.getBooleanField(info, "isResizeable")) || info.topActivity == null
                    || Boolean.TRUE.equals(call(task, "isAlwaysOnTop")) || Boolean.TRUE.equals(call(task, "isForceTranslucent"))
                    || !Boolean.TRUE.equals(call(task, "isFocusable")) || StepMembers.getIntField(task, "mForceHiddenFlags") != 0)
                throw new IllegalStateException("当前应用不是可收纳的普通全屏任务");
            SavedTask existing = saved.get(id);
            if(NativeTopTask.upper!=null && NativeTopTask.upper.id==id)throw new IllegalStateException("顶窗已持有任务");
            if (slots.index(id) >= 0) throw new IllegalStateException("任务已经在副格中");
            if(!WorkspaceUsers.allows(Wm.context,principal,(Integer)field(info,"userId")))throw new IllegalStateException("任务不属于当前用户或已解锁的原生分身");
            if (existing != null && !existing.token.equals(token)) throw new IllegalStateException("拒绝复用任务编号");
            if (i.getIntExtra("layerId", -1) <= 0 || i.getIntExtra("layerId", -1) != (Integer) call(call(task, "getSurfaceControl"), "getLayerId"))
                throw new IllegalStateException("任务原始图层身份不一致");
            if (saved.size() >= 32 && existing == null) throw new IllegalStateException("本轮任务记录已满，请退出后重试");
            if (existing == null || !existing.dirty) saved.put(id, new SavedTask(task, info));
            Bundle b = base(); b.putParcelable("info", info); b.putParcelable("logical", logical); b.putInt("layerId", saved.get(id).layerId);
            respond(reply, 0, b, "原任务状态已记录: " + id);
        }
    }
    static Object transaction() throws Exception { return Class.forName("android.window.WindowContainerTransaction").getDeclaredConstructor().newInstance(); }
    static Object surfaceTransaction() throws Exception { return Class.forName("android.view.SurfaceControl$Transaction").getDeclaredConstructor().newInstance(); }
    static void trackCommit(Object transaction, CommitBarrier group) throws Exception {
        final int index=group.add();
        SurfaceCommit.observe(transaction,runnable->Wm.handler.post(runnable),()->group.commit(index));
    }
    static void awaitCommit(CommitBarrier group,IBinder expected,long deadline,Runnable done,Runnable failed) {
        if(pendingCommit!=group||owner!=expected)return;
        if(group.ready()){
            pendingCommit=null;
            try{done.run();}catch(Throwable failure){
                report(null,-1,"原生事务收尾失败："+failure,-1);
                if(active){if(ending)retryRecovery("归还结果未确认");else finish("图层收尾失败");}
            }
            return;
        }
        if(android.os.SystemClock.uptimeMillis()>=deadline){group.cancel();pendingCommit=null;failed.run();return;}
        Wm.handler.postDelayed(()->awaitCommit(group,expected,deadline,done,failed),16);
    }
    static void apply(Object wct) throws Exception {
        Object organizer = Class.forName("android.window.WindowOrganizer").getDeclaredConstructor().newInstance();
        call(organizer, "applyTransaction", wct);
    }
    static void validSurface(Object value) { if (value == null || !Boolean.TRUE.equals(call(value, "isValid"))) throw new IllegalStateException("任务图层已失效"); }
    static void restore(Object wct, SavedTask r, CommitBarrier group) throws Exception {
        restore(wct,r,group,null);
    }
    static void restore(Object wct, SavedTask r, CommitBarrier group,Object sharedSurface) throws Exception {
        Object task = liveTask(r.id, r.token);
        if (task == null) { r.dirty = false; return; }
        ActivityManager.RunningTaskInfo now = (ActivityManager.RunningTaskInfo) call(task, "getTaskInfo");
        if (!r.identity.matches(now.taskId, StepMembers.getIntField(now, "userId"), StepMembers.getIntField(now, "displayId"), field(now, "token"))) {
            r.dirty = false; return;
        }
        if (task != r.task || call(task, "getParent") != r.parent) {
            r.dirty = false; report(null, -1, "任务已被其他窗口模式接管，不覆盖新父级: " + r.id, r.id); return;
        }
        int mode=(Integer)call(task,"getWindowingMode");
        if(mode==5 || mode==2){r.dirty=false;report(null,0,"任务已进入原厂小窗，保留系统所有权",r.id);return;}
        for (String name : new String[]{"setAlwaysOnTop", "setForceTranslucent", "setHidden"}) call(wct, name, r.token, false);
        call(wct, "setFocusable", r.token, true);
        call(wct, "setWindowingMode", r.token, r.requestedMode);
        call(wct, "setBounds", r.token, new Rect(r.bounds));
        // An interrupted flip may still be fullscreen. Its final restoration transaction
        // restores the actual parent even when there is no resize to consume a deferred tx.
        if(ending && flip!=null && flip.moves(r))return;
        Object surface = call(task, "getSurfaceControl"), parent = call(r.parent, "getSurfaceControl");
        validSurface(surface); validSurface(parent);
        Object st = sharedSurface==null?surfaceTransaction():sharedSurface;
        call(st, "reparent", surface, parent);
        // The returned task is already the new main, not a fullscreen frame
        // waiting for a later magnification replay to shrink it again.
        WorkspaceLayout target=!ending && Wm.active && field(Wm.display,"mMagnificationSpec")==Wm.ownedSpec && (r.requestedMode==0 || r.requestedMode==1)
                ?flip!=null?flip.to:new WorkspaceLayout(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,sideLeft):null;
        stageMainTransform(r,st,surface,target);
        call(st, "setWindowCrop", surface, (Object) null);
        call(st, "setAlpha", surface, 1f); call(st, "show", surface);
        if(sharedSurface==null){trackCommit(st,group);call(wct, "setBoundsChangeTransaction", r.token, st);}
    }
    static void stageMainTransform(SavedTask r,Object st,Object surface,WorkspaceLayout target)throws Exception{
        java.lang.reflect.Field cache=StepMembers.findField(r.task.getClass(),"mLastMagnificationSpec");
        // A native replay may move the spec between Task and TaskDisplayArea.
        // Raw .75 on a task below a .75 parent produces a .5625-sized frame.
        WorkspaceTransform inherited=new WorkspaceTransform(1,0,0);
        if(target!=null){
            int depth=0;
            for(Object p=r.parent;p!=null && p!=Wm.display;p=call(p,"getParent")){
                if(++depth>32)throw new IllegalStateException("任务父层链异常");
                Object spec=field(p,"mLastMagnificationSpec");
                if(spec!=null)inherited=inherited.then(new WorkspaceTransform(
                        StepMembers.getFloatField(spec,"scale"),StepMembers.getFloatField(spec,"offsetX"),
                        StepMembers.getFloatField(spec,"offsetY")));
            }
        }
        WorkspaceTransform physical=target==null?new WorkspaceTransform(1,0,0)
                :new WorkspaceTransform(target.mainScale,target.mainX,target.top);
        WorkspaceTransform local=physical.inside(inherited);
        // Keep the native cache consistent with the staged matrix. Without it,
        // clearMagnificationSpec skips this task when the parent takes the scale.
        Object spec=local.identity()?null:Wm.newSpec(local.scale,local.x,local.y);
        if(spec!=null && !cache.getType().isInstance(spec))throw new IllegalStateException("原生缩放缓存类型变化");
        call(r.task,"clearMagnificationSpec",st);
        call(st,"setMatrix",surface,local.scale,0f,0f,local.scale);
        call(st,"setPosition",surface,r.position.x+local.x,r.position.y+local.y);
        cache.set(r.task,spec);
    }
    static boolean canAdoptPromotion(Intent i){
        int id=i.getIntExtra("task",-1),slot=i.getIntExtra("slot",-1);
        SavedTask r=saved.get(id);
        if(!active || ending || flip!=null || pendingCommit!=null || slot<0 || slot>=SideSlots.MAX_COUNT
                || slots.task(slot)!=id || r==null || !r.dirty || !r.token.equals(i.getParcelableExtra("token"))
                || !WorkspaceUsers.allows(Wm.context,principal,r.user))return false;
        return isPromotedTask(r);
    }
    static boolean isPromotedTask(SavedTask r){
        if(!Wm.active || field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec)return false;
        Object task=liveTask(r.id,r.token);
        if(task!=r.task || task!=call(task,"getRootTask") || call(task,"getParent")!=r.parent
                || call(task,"getDisplayContent")!=Wm.display || (Integer)call(task,"getWindowingMode")!=1
                || (Integer)call(task,"getActivityType")!=1
                || (Integer)call(call(task,"getSurfaceControl"),"getLayerId")!=r.layerId)return false;
        ActivityManager.RunningTaskInfo info=(ActivityManager.RunningTaskInfo)call(task,"getTaskInfo");
        return r.identity.matches(info.taskId,StepMembers.getIntField(info,"userId"),StepMembers.getIntField(info,"displayId"),field(info,"token"))
                && info.topActivity!=null && StepMembers.getBooleanField(info,"isVisible");
    }
    static void roles(Intent i, ResultReceiver reply) throws Exception {
        Object wct = transaction();
        final CommitBarrier group=pendingCommit=new CommitBarrier();
        final IBinder expected=owner;
        int next = i.getIntExtra("task", -1);
        int slot = i.getIntExtra("slot", -1);
        int previous = i.getIntExtra("previous", -2);
        final long handoffSequence=i.getLongExtra("sequence",-1);
        boolean resuming=i.getBooleanExtra("readmit",false);
        boolean external=i.getBooleanExtra("externalPromotion",false);
        // Both participants and the animation backdrop land in ONE surface
        // transaction. Separate deferred transactions can reveal a blank/oversized frame.
        final Object landing=flip!=null || external?surfaceTransaction():null;
        final TaskIdentity returnMain;
        synchronized (Wm.lock) {
            if(resuming)rememberMain();
            returnMain=lastMain;
            slots.check(slot, previous, next);
            if(previous<0 && next>=0 && !WorkspaceCapacity.canAdd(slots.count(),NativeTopTask.upper!=null))
                throw new IllegalStateException("工作区最多六个任务");
            if (!interactive(Wm.context)) throw new IllegalStateException("屏幕已锁定");
            if(flip!=null)flip.checkRoles(i);
            SavedTask old = saved.get(previous), incoming = saved.get(next);
            if(external && (old==null || !old.dirty || !old.token.equals(i.getParcelableExtra("token")) || !isPromotedTask(old)))
                throw new IllegalStateException("原厂主任务在交接前已变化");
            if (next >= 0) {
                if (incoming == null || !incoming.token.equals(i.getParcelableExtra("token"))) throw new IllegalStateException("未记录新副任务");
                Object task = liveTask(next, incoming.token);
                if(resuming && (!runningActivity(task) || previous>=0 || !readmitting.matches(slot,next,incoming.user,incoming.token)))
                    throw new IllegalStateException("没有对应的原格记录");
                if (task == null || task != incoming.task || call(task, "getParent") != incoming.parent
                        || (Integer) call(call(task, "getSurfaceControl"), "getLayerId") != incoming.layerId
                        || !resuming && !Boolean.TRUE.equals(field(call(task, "getTaskInfo"), "isFocused"))
                        || (Integer) call(task, "getWindowingMode") != 1) throw new IllegalStateException("待收纳任务已离开主屏");
                if(!WorkspaceUsers.allows(Wm.context,principal,incoming.user))throw new IllegalStateException("副任务用户已变化");
            }
            if(old!=null && !WorkspaceUsers.allows(Wm.context,principal,old.user))throw new IllegalStateException("原副任务用户已变化");
            traceHandoff("before_roles",handoffSequence,previous,next);
            if (old != null && old.dirty) restore(wct, old,group,landing);
            if (old != null && !old.dirty) throw new IllegalStateException("原副任务已结束或由系统接管");
            if (incoming != null) {
                Object parent = i.getParcelableExtra("surface"); validSurface(parent);
                PreviewGeometry geometry = new PreviewGeometry(logical.width(), logical.height(), i.getIntExtra("width", 0), i.getIntExtra("height", 0));
                incoming.dirty = true; // Recovery ownership precedes any task mutation.
                call(wct, "setWindowingMode", incoming.token, 6);
                call(wct, "setBounds", incoming.token, logical);
                call(wct, "setAlwaysOnTop", incoming.token, true);
                call(wct, "setForceTranslucent", incoming.token, true);
                call(wct, "setFocusable", incoming.token, resuming && WorkspaceReadmit.available);
                call(wct, "setHidden", incoming.token, false);
                Object surface = call(incoming.task, "getSurfaceControl"); validSurface(surface);
                Object st = landing==null?surfaceTransaction():landing;
                unpublishedSurface = st;
                // Remove only WM's previous main magnification, including descendant caches, before
                // assigning the preview matrix. Otherwise a later display replay can erase the fit.
                call(incoming.task, "clearMagnificationSpec", st);
                call(st, "reparent", surface, parent);
                call(st, "setMatrix", surface, geometry.scale, 0f, 0f, geometry.scale);
                call(st, "setPosition", surface, geometry.x, geometry.y + i.getIntExtra("rowTop", 0));
                call(st, "setWindowCrop", surface, logical); call(st, "setAlpha", surface, 1f); call(st, "show", surface);
                if(flip!=null)flip.land((android.view.SurfaceControl.Transaction)st,(android.view.SurfaceControl)parent);
                trackCommit(st,group);
                call(wct, "setBoundsChangeTransaction", incoming.token, st);
            }
            if(incoming==null && flip!=null){
                Object preview=i.getParcelableExtra("surface");validSurface(preview);
                flip.land((android.view.SurfaceControl.Transaction)landing,(android.view.SurfaceControl)preview);
                // Returning from the desktop has no incoming task to carry a bounds tx.
                // Defer to the promoted task so its native mode and all surfaces land together.
                trackCommit(landing,group);
                call(wct,"setBoundsChangeTransaction",old.token,landing);
            }
            if (old != null) call(wct, "reorder", old.token, !i.getBooleanExtra("background", false));
            else if (incoming != null && !resuming) {
                int homeId = i.getIntExtra("home", -1); Object homeToken = i.getParcelableExtra("homeToken");
                Object home = liveTask(homeId, homeToken);
                if (home == null || (Integer) call(home, "getActivityType") != 2
                        || StepMembers.getIntField(home, "mUserId") != principal)
                    throw new IllegalStateException("原屏桌面任务不可用");
                call(wct, "reorder", homeToken, true);
            }
            if (incoming != null) call(wct, "reorder", incoming.token, true);
            slots.replace(slot, previous, next);
            if(flip!=null && sideLeft!=flip.targetLeft){
                Wm.moveWorkspace(flip.to);
                sideLeft=flip.targetLeft;
            }
        }
        apply(wct);
        unpublishedSurface = null;
        synchronized (Wm.lock) {
            if (next >= 0) {
                SavedTask in = saved.get(next); Object task = liveTask(next, in.token);
                if (task == null || (Integer) call(task, "getWindowingMode") != 6 || !logical.equals(call(task, "getBounds")))
                    throw new IllegalStateException("系统未保持完整页面尺寸，已触发归还");
            }
            SavedTask old = saved.get(previous);
            if (old != null&&old.dirty) verifyRestored(old);
            replay();
            // A native promotion is already fullscreen: there may be no bounds
            // change to consume a deferred transaction. Publish its explicit return.
            if(external){trackCommit(landing,group);call(landing,"apply");call(landing,"close");}
        }
        group.seal();
        Runnable complete=()->{
            if(!active||ending)return;
            SavedTask old=saved.get(previous);if(old!=null)old.dirty=false;
            if(resuming)readmitting.consumed(slot);
            committedOperations++;
            Bundle b = base(); b.putInt("slot", slot); b.putInt("side", next); b.putInt("previous", previous);b.putBoolean("committed",true);
            respond(reply, 0, b, "任务角色与原生图层提交已确认；副任务="+next);
        };
        awaitCommit(group,expected,android.os.SystemClock.uptimeMillis()+1800,()->{
            CommitBarrier normalized=pendingCommit=new CommitBarrier();
            synchronized(Wm.lock){
                NativeFlip landed=flip;flip=null;
                try{
                    traceHandoff("before_final_normalization",handoffSequence,previous,next);
                    replay(normalized,saved.get(previous));
                    traceHandoff("normalization_submitted",handoffSequence,previous,next);
                }
                finally{if(landed!=null)landed.close();}
            }
            normalized.seal();
            awaitCommit(normalized,expected,android.os.SystemClock.uptimeMillis()+1800,()->{
                synchronized(Wm.lock){traceHandoff("normalization_committed",handoffSequence,previous,next);}
                if(resuming && next>=0 && WorkspaceReadmit.available)WorkspaceReadmit.settle(saved.get(next),expected,returnMain,android.os.SystemClock.uptimeMillis(),complete);
                else complete.run();
            },()->finish("任务坐标归一提交未确认，归还原任务"));
        },()->finish("任务图层提交未确认，归还原任务"));
    }
    static void verifyRestored(SavedTask r) {
        Object task = liveTask(r.id, r.token);
        if (task == null) return;
        if ((Integer) call(task, "getRequestedOverrideWindowingMode") != r.requestedMode
                || !r.bounds.equals(call(task, "getRequestedOverrideBounds"))
                || Boolean.TRUE.equals(call(task, "isAlwaysOnTop")) || Boolean.TRUE.equals(call(task, "isForceTranslucent"))
                || !Boolean.TRUE.equals(call(task, "isFocusable"))) throw new IllegalStateException("原任务状态恢复未确认: " + r.id);
    }
    static void stageMagnification(Object transaction)throws Exception{
        // Keep the first reparent and the native parent's scale in one commit.
        // Older displays retain their existing no-argument replay path.
        if(replayPending!=null)replayPending.invoke(Wm.display,transaction);
    }
    /** Move the same main/side tasks together; no role exchange or task relaunch. */
    static void position(Intent request,ResultReceiver reply)throws Exception{
        final boolean targetLeft=request.getBooleanExtra("leftSide",sideLeft);
        final IBinder expected=owner;
        final CommitBarrier group=pendingCommit=new CommitBarrier();
        synchronized(Wm.lock){
            if(!interactive(Wm.context) || !java.util.Arrays.equals(slots.snapshot(),request.getIntArrayExtra("slots"))
                    || request.getBooleanExtra("fromLeft",!sideLeft)!=sideLeft)
                throw new IllegalStateException("工作区位置或任务已变化");
            WorkspaceLayout target=new WorkspaceLayout(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,targetLeft);
            Wm.moveWorkspace(target);
            Object tx=call(Wm.display,"getPendingTransaction");
            trackCommit(tx,group);call(tx,"apply");
            sideLeft=targetLeft;
        }
        group.seal();
        awaitCommit(group,expected,android.os.SystemClock.uptimeMillis()+1800,()->{
            if(!active || ending)return;
            Bundle result=base();result.putBoolean("left",sideLeft);result.putBoolean("committed",true);
            respond(reply,0,result,"主工作区已移到"+(sideLeft?"右":"左")+"侧");
        },()->finish("主工作区位置提交未确认"));
    }
    static void replay() {replay(null,null);}
    static void replay(CommitBarrier group,SavedTask restored) {
        if (Wm.active && field(Wm.display, "mMagnificationSpec") == Wm.ownedSpec) {
            call(Wm.service,"updateFocusedWindowLocked",0,true);
            Object pending=call(Wm.display,"getPendingTransaction");
            if(restored!=null)resetReturnedTransform(restored,pending);
            if(replayPending==null)call(Wm.display,"reapplyMagnificationSpec");
            else try{replayPending.invoke(Wm.display,pending);}
            catch(ReflectiveOperationException failure){throw new IllegalStateException("原屏缩放同步失败",failure);}
            if(group!=null)try{trackCommit(pending,group);}
            catch(Exception failure){throw new IllegalStateException("缩放事务无法确认",failure);}
            call(pending,"apply");
            call(field(Wm.display, "mInputMonitor"), "updateInputWindowsLw", true);
            WorkspaceIme.request();
        }else if(group!=null)throw new IllegalStateException("原屏缩放所有权已变化");
    }
    static void resetReturnedTransform(SavedTask r,Object transaction){
        Object task=liveTask(r.id,r.token);
        if(task==null)return;
        if(task!=r.task || call(task,"getParent")!=r.parent || call(task,"getDisplayContent")!=Wm.display
                || (Integer)call(task,"getWindowingMode")!=1
                || (Integer)call(call(task,"getSurfaceControl"),"getLayerId")!=r.layerId)
            throw new IllegalStateException("归一前主任务身份已变化："+r.id);
        // The role transaction has now committed. An earlier native replay may
        // have cleared the cache before that deferred transaction wrote its matrix.
        // Reset this exact returned surface even when its cache is already null,
        // then apply the final native hierarchy in the SAME pending transaction.
        call(task,"clearMagnificationSpec",transaction);
        Object surface=call(task,"getSurfaceControl");
        Point at=(Point)field(call(task,"getTaskInfo"),"positionInParent");
        call(transaction,"setMatrix",surface,1f,0f,0f,1f);
        call(transaction,"setPosition",surface,(float)at.x,(float)at.y);
        call(transaction,"setWindowCrop",surface,(Object)null);
    }
    static void traceHandoff(String phase,long operation,int previous,int next){
        try{
            StringBuilder detail=new StringBuilder("operation=").append(operation).append(";phase=").append(phase)
                    .append(";evidence=wm_cache_not_presented_frame");
            for(int id:new int[]{previous,next}){
                SavedTask r=saved.get(id);if(r==null)continue;
                detail.append(";task=").append(id).append(";chain=");
                int depth=0;
                for(Object node=r.task;node!=null && node!=Wm.display && depth++<12;node=call(node,"getParent")){
                    Object surface=call(node,"getSurfaceControl"),spec=field(node,"mLastMagnificationSpec");
                    detail.append(node.getClass().getSimpleName()).append('#').append(surface==null?-1:call(surface,"getLayerId")).append('[');
                    if(spec==null)detail.append("no_cached_spec");
                    else detail.append(StepMembers.getFloatField(spec,"scale")).append(',')
                            .append(StepMembers.getFloatField(spec,"offsetX")).append(',').append(StepMembers.getFloatField(spec,"offsetY"));
                    detail.append("]/");
                }
            }
            diagnostic("HANDOFF",detail.toString());
        }catch(Throwable unavailable){diagnostic("HANDOFF","operation="+operation+";phase="+phase+";cache_trace_unavailable="+unavailable.getClass().getSimpleName());}
    }
    static boolean finish(String reason) {
        if (!active || ending) return !active;
        WorkspaceIme.cancel();
        afterRestore=null;
        synchronized(Wm.lock){rememberMain();exitMain=mainAtExit(reason);}
        if(("工作区暂挂".equals(reason) || "桌面暂挂".equals(reason) || "息屏暂挂".equals(reason) || "配置暂挂".equals(reason)) && flip==null && pendingCommit==null){
            afterRestore=new ParkedWorkspace();
            synchronized(Wm.lock){
                afterRestore.principal=principal;afterRestore.left=sideLeft;afterRestore.page=hostPage;afterRestore.topFace=hostTopFace || NativeTopTask.upper!=null && !NativeTopTask.hidden;
                afterRestore.main=exitMain;
                TaskIdentity main=afterRestore.main;
                afterRestore.manualMain=main!=null && (main==lastStandard && lastStandardManual ||
                        LocalLandscape.manualApp!=null && call(LocalLandscape.manualApp,"getTask")==liveTask(main.id,main.token));
                for(int n=0;n<SideSlots.MAX_COUNT;n++){
                    SavedTask r=saved.get(slots.task(n));if(r!=null && r.dirty && runningActivity(r.task))afterRestore.put(n,r.identity);
                }
                if(NativeTopTask.upper!=null && NativeTopTask.upper.dirty)afterRestore.put(ParkedWorkspace.UPPER,NativeTopTask.upper.identity);
            }
        }
        ending = true;
        GameInput.geometry(1,0,0);
        WorkspaceZoom.cancel();
        UpperMotion.cancel();
        if(flip!=null)flip.cancelAnimator();
        WorkspaceGestureGate.publish();
        recoveryReason=reason;recoveryStartedAt=android.os.SystemClock.elapsedRealtime();
        respond(events,98,base(),"开始归还："+reason+"；服务计时="+(recoveryStartedAt-startedAt)+"ms");
        restoreAttempt();
        return false;
    }
    static TaskIdentity exitTarget(){
        if(WorkspaceUsers.foreground()!=principal)return null;
        if(eligibleMain(exitMain)!=null)return exitMain;
        return eligibleMain(sessionHome)!=null?sessionHome:null;
    }
    static void restoreAttempt() {
        if(pendingCommit!=null)pendingCommit.cancel();
        final CommitBarrier group=pendingCommit=new CommitBarrier();
        final IBinder expected=owner;
        final String reason = recoveryReason;
        try {
            Object wct = transaction();
            synchronized (Wm.lock) {
                LocalLandscape.clear();EdgeHandoff.pending=false;
                for (SavedTask record : saved.values()) if (record.dirty) restore(wct, record,group);
                TaskIdentity target=exitTarget();
                if(target!=null)call(wct,"reorder",target.token,true);
                slots.clear(); Wm.sideTask = -1;
            }
            apply(wct);
            synchronized (Wm.lock) {
                for (SavedTask record : saved.values()) if (record.dirty) verifyRestored(record);
                // Some ROMs move a former always-on-top task forward while applying mode changes.
                TaskIdentity target=exitTarget();
                Object task=eligibleMain(target);
                if(task!=null && task!=call(Wm.display,"getFocusedRootTask")){
                    Object front=transaction();call(front,"reorder",target.token,true);apply(front);
                }
            }
            Wm.stop(reason);PhysicalIme.refreshParent();
            if(Wm.active)throw new IllegalStateException("主屏缩放尚未恢复");
            // Include the final native display/input transaction, including an empty workspace.
            synchronized(Wm.lock){
                Object finalTx=call(Wm.display,"getPendingTransaction");
                if(flip!=null)flip.restoreParents((android.view.SurfaceControl.Transaction)finalTx);
                trackCommit(finalTx,group);call(finalTx,"apply");
            }
            group.seal();
            awaitCommit(group,expected,android.os.SystemClock.uptimeMillis()+1800,()->{
                active=false;ending=false;completedRecoveries++;recoveredAt=android.os.SystemClock.elapsedRealtime();
                if(flip!=null){flip.close();flip=null;}
                completedOwner=owner;completedSession=session;
                if(owner!=null&&death!=null)try{owner.unlinkToDeath(death,0);}catch(Throwable ignored){}
                respond(events,99,base(),reason+"；原任务和图层已归还；服务耗时="+(recoveredAt-recoveryStartedAt)+"ms");
                if(afterRestore!=null)parked=afterRestore;else if("手动退出".equals(reason))parked=new ParkedWorkspace();
                lastMainTask=null;sessionHome=null;exitMain=null;afterRestore=null;readmitting=new ParkedWorkspace();
                retire(session);saved.clear();NativeTopTask.reset();owner=null;
            },()->retryRecovery("恢复图层提交超时"));
        } catch (Throwable error) {
            retryRecovery("恢复尚未完成: "+error);
        }
    }
    static void retryRecovery(String why) {
        if(pendingCommit!=null)pendingCommit.cancel();pendingCommit=null;
        report(null,-1,"系统服务保留恢复记录，稍后重试: "+why,-1);
        try{Wm.stop("先恢复主屏尺寸");}catch(Throwable ignored){}
        final IBinder expected=owner;
        Wm.handler.postDelayed(() -> {
            if (active && owner == expected && ending) restoreAttempt();
        }, 1000);
    }
    static void retire(String value) {
        if (value == null) return;
        retired.add(value);
        while (retired.size() > 32) retired.remove(retired.iterator().next());
    }
}
