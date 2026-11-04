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
    static int systemUiUid=-1, rejectedSenders, transitionReplays, committedOperations, completedRecoveries, finishTransactionReplays, sideFocusExclusions;
    static boolean transactionReplaySupported;
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
                @Override protected void afterHookedMethod(MethodHookParam p){observe();GameInput.refreshUnderLock();}
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
                                    &&SideFocus.excludes(active,ending,id,id,record==null?null:record.task,task,record!=null&&record.dirty)){
                                p.setResult(false);sideFocusExclusions++;
                            }
                        }catch(Throwable error){final IBinder expected=owner;Wm.handler.post(()->{if(owner==expected)finish("副任务焦点身份不可核验");});}
                    }
                });
            }
            Class<?> transition=StepMembers.findClass("com.android.server.wm.Transition",loader);
            Class<?> transactionType=Class.forName("android.view.SurfaceControl$Transaction",false,loader);
            java.lang.reflect.Method replayTransaction=TransitionCompletion.transactionReplay(Wm.display.getClass(),transactionType);
            transactionReplaySupported=replayTransaction!=null;
            if(replayTransaction!=null){
                Class<?> displayType=Class.forName("com.android.server.wm.DisplayContent",false,loader);
                Class<?> displayArray=java.lang.reflect.Array.newInstance(displayType,0).getClass();
                java.lang.reflect.Method build=OwnershipBridge.method(transition,"buildFinishTransaction",transactionType,
                        Class.forName("android.window.TransitionInfo",false,loader),displayArray);
                if(build.getReturnType()!=void.class||java.lang.reflect.Modifier.isStatic(build.getModifiers()))
                    throw new NoSuchMethodException("Unknown native finish transaction contract");
                StepHooks.hookMethod(build,new StepHook(){
                    @Override protected void afterHookedMethod(MethodHookParam p){
                        if(p.hasThrowable()||!active||ending||!Thread.holdsLock(Wm.lock)
                                ||field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec)return;
                        boolean owns=false;for(Object display:(Object[])p.args[2])if(display==Wm.display)owns=true;
                        if(!owns)return;
                        try{replayTransaction.invoke(Wm.display,p.args[0]);finishTransactionReplays++;}
                        catch(Throwable error){final IBinder expected=owner;Wm.handler.post(()->{if(owner==expected)finish("原厂结束事务同步失败");});}
                    }
                });
            }
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
                        if(PhysicalIme.ownsContainer(p.thisObject) || physicalNativeWindow(p.thisObject)){
                            if(field(p.thisObject,"mLastMagnificationSpec")!=null)call(p.thisObject,"clearMagnificationSpec",p.args[0]);
                            p.setResult(null);
                        }else if (ownsTask(p.thisObject)) p.setResult(null);
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
                    if(!WorkspaceCaller.trusted(systemUiUid,getSentFromUid())){rejectedSenders++;return;}
                    if ("readiness".equals(i.getStringExtra("operation"))) {
                        answer(i,registered && StepRuntime.enabled,"系统框架");return;
                    }
                    execute(i);
                }
            }, new IntentFilter(ACTION), SYSTEM_CONTROL, Wm.handler, Context.RECEIVER_EXPORTED);
            registered = true;
            LocalLandscape.install(loader); PhysicalIme.install(loader); WorkspaceResize.install(loader);WorkspaceResize.installUpperBounds(loader); EdgeHandoff.install(loader);
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
        if (!ending && moving!=null && moving.actors[0].task==candidate) return true;
        // applyMagnificationSpec is invoked for non-Task containers too.
        for (int slot = 0; slot < SideSlots.MAX_COUNT; slot++) {
            int id = slots.task(slot);
            if (id < 0) continue;
            SavedTask record = saved.get(id);
            if (record != null && record.dirty && record.task == candidate) return true;
        }
        return false;
    }
    static boolean physicalNativeWindow(Object task){
        if(!active || physicalTaskType==null || !physicalTaskType.isInstance(task) || call(task,"getDisplayContent")!=Wm.display)return false;
        int mode=(Integer)call(task,"getWindowingMode");
        return mode==5 || mode==2;
    }
    static Bundle base() {
        Bundle b = new Bundle(); b.putString("session", session);
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
            else if ("roles".equals(action)) {
                applyingRoles = true;
                roles(intent, reply);
            }
            else if ("replay".equals(action)) {
                synchronized (Wm.lock) { replay(); }
                respond(reply, 0, base(), "主屏缩放与输入已重新同步");
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
        if((type==1 || type==2) && t.topActivity!=null && !PACKAGE.equals(t.topActivity.getPackageName()) && WorkspaceUsers.allows(Wm.context,principal,user)){
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
                    || PACKAGE.equals(info.topActivity.getPackageName())
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
        Object st = surfaceTransaction();
        call(st, "reparent", surface, parent);
        call(st, "setMatrix", surface, 1f, 0f, 0f, 1f);
        call(st, "setPosition", surface, (float) r.position.x, (float) r.position.y);
        call(st, "setWindowCrop", surface, (Object) null);
        call(st, "setAlpha", surface, 1f); call(st, "show", surface);
        trackCommit(st,group);
        call(wct, "setBoundsChangeTransaction", r.token, st);
    }
    static void roles(Intent i, ResultReceiver reply) throws Exception {
        Object wct = transaction();
        final CommitBarrier group=pendingCommit=new CommitBarrier();
        final IBinder expected=owner;
        int next = i.getIntExtra("task", -1);
        int slot = i.getIntExtra("slot", -1);
        int previous = i.getIntExtra("previous", -2);
        boolean resuming=i.getBooleanExtra("readmit",false);
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
            if (old != null && old.dirty) restore(wct, old,group);
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
                Object st = surfaceTransaction();
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
        }
        group.seal();
        Runnable complete=()->{
            if(!active||ending)return;
            SavedTask old=saved.get(previous);if(old!=null)old.dirty=false;
            if(resuming)readmitting.consumed(slot);
            if(flip!=null){flip.close();flip=null;}
            committedOperations++;
            Bundle b = base(); b.putInt("slot", slot); b.putInt("side", next); b.putInt("previous", previous);b.putBoolean("committed",true);
            respond(reply, 0, b, "任务角色与原生图层提交已确认；副任务="+next);
        };
        awaitCommit(group,expected,android.os.SystemClock.uptimeMillis()+1800,()->{
            if(resuming && next>=0 && WorkspaceReadmit.available)WorkspaceReadmit.settle(saved.get(next),expected,returnMain,android.os.SystemClock.uptimeMillis(),complete);
            else complete.run();
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
    static void replay() {
        if (Wm.active && field(Wm.display, "mMagnificationSpec") == Wm.ownedSpec) {
            call(Wm.service,"updateFocusedWindowLocked",0,true);
            call(Wm.display, "reapplyMagnificationSpec");
            call(call(Wm.display, "getPendingTransaction"), "apply");
            call(field(Wm.display, "mInputMonitor"), "updateInputWindowsLw", true);
        }
    }
    static boolean finish(String reason) {
        if (!active || ending) return !active;
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
