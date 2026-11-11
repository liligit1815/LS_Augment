package ls.augment.com.step;

import android.app.ActivityOptions;
import android.app.Application;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Optional;
import java.util.concurrent.Executor;
import java.util.function.Consumer;
/** Phone-side entry points in the physical display owner and its SystemUI host. */
public final class StepRuntime {
    static final String PACKAGE = "ls.augment.com";
    static final String PERMISSION = PACKAGE + ".STEP_CONTROL";
    static final String ACTION = PACKAGE + ".STEP_COMMAND";
    static final String TITLE = "RedMagicDuoStepPanel";
    static final long DURATION = 20000;
    static void report(ResultReceiver sink, int code, String message, int task) {
        android.util.Log.i("RedMagicDuoStep", message);
        if(code!=10)diagnostic("RUNTIME","code="+code+";task="+task+";message="+message);

        if (sink != null) {
            try { Bundle b = new Bundle(); b.putString("message", message); b.putInt("task", task); sink.send(code, b); }
            catch (Throwable ignored) { }
        }
    }
    static void diagnostic(String stage,String detail) {
        ls.augment.com.StartupDiagnostics.record("STEP_"+stage,
                detail.length()>1000?detail.substring(0,1000):detail,null);
    }
    // Bundles crossing into framework processes must name the platform Parcelable,
    // not the anonymous module subclass whose class loader the recipient does not own.
    static ResultReceiver remote(ResultReceiver receiver){
        if(receiver==null)return null;
        android.os.Parcel parcel=android.os.Parcel.obtain();
        try{receiver.writeToParcel(parcel,0);parcel.setDataPosition(0);return ResultReceiver.CREATOR.createFromParcel(parcel);}
        finally{parcel.recycle();}
    }
    static ResultReceiver sink(Intent i) { return i.getParcelableExtra("reply"); }
    static Intent command(String target, String operation, ResultReceiver receiver) {
        return new Intent(ACTION).setPackage(target).putExtra("operation", operation).putExtra("reply", remote(receiver));
    }
    static void register(Context context, Handler handler, BroadcastReceiver receiver) {
        context.registerReceiver(receiver, new IntentFilter(ACTION), PERMISSION, handler, Context.RECEIVER_EXPORTED);
    }
    static Object call(Object value, String name, Object... args) { return StepMembers.callMethod(value, name, args); }
    static Object field(Object value, String name) { return StepMembers.getObjectField(value, name); }
    static boolean interactive(Context context) {
        return context.getSystemService(android.os.PowerManager.class).isInteractive()
                && !context.getSystemService(android.app.KeyguardManager.class).isKeyguardLocked();
    }

    static volatile boolean enabled;
    private static volatile boolean installed;
    public static boolean isInstalled() { return installed; }
    public static void notifyUiPreferences(Context context) {
        context.sendBroadcast(QuickPreferences.snapshot(context, new Intent(ACTION).setPackage("com.android.systemui")
                .putExtra("operation", "quickPins")));
    }
    public static void query(Context context, String target, ResultReceiver callback) {
        context.sendBroadcast(command(target, "query", callback));
    }
    public static synchronized void install(ls.augment.com.hook.AugmentModule module,ClassLoader loader,boolean server){
        if(installed)return;
        StepHooks.module=module;
        if(server) installed=Wm.install(loader);
        else { Shell.install(loader); installed=true; }
    }
    static void observeSwitch(Context ctx,Handler handler,boolean server){
        Runnable changed=()->handler.post(()->{
            boolean wasEnabled=enabled;
            enabled=StepHooks.module.stepEnabled(ctx);
            if(!server && enabled!=wasEnabled) Shell.onSwitchChanged();
            if(enabled && server)GameInput.prepare();
            if(!enabled){
                if(server){if(Wm.active)Wm.stop("配置暂挂");}
                else{WorkspaceWake.cancel();LiveWorkspace.stop("配置暂挂");WorkspaceClipboard.history.reset();PlayerCard.forget();}
            }
        });
        StepHooks.module.observeStep(ctx,changed);
        changed.run();
    }
    static void answer(Intent intent,boolean ready,String details){
        ResultReceiver r=sink(intent);
        if(r!=null){Bundle b=new Bundle();
            if(Wm.registered && ready)b.putBoolean("topAvailable",NativeTopTask.available());
            if(!Wm.registered)CornerEntry.describe(b);
            b.putString("details",details);b.putInt("version",ls.augment.com.BuildConfig.VERSION_CODE);r.send(ready?1:0,b);}
    }
    static final class Wm {
        static Object display, lock, service;
        static Handler handler;
        static Context context;
        static volatile boolean registered;
        static volatile boolean active;
        static int sideTask = -1;
        static Object ownedSpec;
        static Object applyingSpec;
        static ResultReceiver reply;
        static final Runnable TIMEOUT = () -> stop(NativeWorkspaceGuard.active ? "90秒到时恢复" : "20秒到时恢复");
        static ClassLoader loader;

        static boolean install(ClassLoader cl) {
            loader = cl;
            try {
                Class<?> dc = StepMembers.findClass("com.android.server.wm.DisplayContent", cl);
                Class<?> spec = StepMembers.findClass("android.view.MagnificationSpec", cl);
                dc.getDeclaredMethod("applyMagnificationSpec", spec);
                dc.getDeclaredMethod("getDisplayId");
                Class<?> ws = StepMembers.findClass("com.android.server.wm.WindowState", cl);
                ws.getDeclaredMethod("shouldMagnify");
                StepMembers.findAndHookMethod(ws, "shouldMagnify", new StepHook() {
                    @Override protected void afterHookedMethod(MethodHookParam p) {
                        if (!active) return;
                        try {
                            if (call(p.thisObject, "getDisplayContent") != display) return;
                            WindowManager.LayoutParams attrs = (WindowManager.LayoutParams) field(p.thisObject, "mAttrs");
                            Object task = call(p.thisObject, "getTask");
                            boolean side = task != null && (NativeTransitionPose.owns(task) || NativeWorkspaceGuard.ownsMagnification(task) || StepMembers.getIntField(task, "mTaskId") == sideTask);
                            if(PhysicalFingerprint.window(p.thisObject))p.setResult(false);
                            else if(PhysicalIme.window(p.thisObject,attrs)){p.setResult(false);PhysicalIme.exclusions++;}
                            else if (side || NativeWorkspaceGuard.physicalNativeWindow(task) || TITLE.contentEquals(attrs.getTitle()) || WorkspaceInput.TITLE.contentEquals(attrs.getTitle())
                                    || WorkspaceQuickBar.TITLE.contentEquals(attrs.getTitle()) || QuickPicker.TITLE.contentEquals(attrs.getTitle())
                                    || SlotCountDialog.TITLE.contentEquals(attrs.getTitle()) || WorkspaceActions.TITLE.contentEquals(attrs.getTitle())
                                    || WorkspaceToolMenu.TITLE.contentEquals(attrs.getTitle())
                                    || WorkspaceSideToolbar.physical(attrs.type,attrs.getTitle(),StepMembers.getIntField(p.thisObject,"mOwnerUid"),NativeWorkspaceGuard.systemUiUid)
                                    || WorkspaceRecentSheet.physical(attrs.type,attrs.getTitle(),StepMembers.getIntField(p.thisObject,"mOwnerUid"),NativeWorkspaceGuard.systemUiUid)) p.setResult(false);
                            else if(!PhysicalIme.current() && (attrs.type==2011 || attrs.type==2012)){
                                Object target=call(display,"getImeInputTarget");
                                Object w=target==null?null:call(target,"getWindowState"),t=w==null?null:call(w,"getTask");
                                boolean picker=w!=null && QuickPicker.TITLE.contentEquals(((WindowManager.LayoutParams)field(w,"mAttrs")).getTitle());
                                p.setResult(!picker && (t==null || !NativeWorkspaceGuard.ownsMagnification(t) && !NativeWorkspaceGuard.physicalNativeWindow(t) && StepMembers.getIntField(t,"mTaskId")!=sideTask));
                            }
                        } catch (Throwable ignored) { }
                    }
                });
                StepHooks.hookAllMethods(dc, "configureSurfaces", new StepHook.Discovery() {
                    @Override protected void afterHookedMethod(MethodHookParam p) {
                        if (p.hasThrowable()) return;
                        try {
                            if (!Integer.valueOf(0).equals(call(p.thisObject, "getDisplayId"))) return;
                            if (active && handler != null){
                                android.os.IBinder expected=NativeWorkspaceGuard.owner;
                                handler.post(()->{if(active && expected==NativeWorkspaceGuard.owner)stop("配置暂挂");});
                            }
                            attachDisplay(p.thisObject);
                        } catch (Throwable error) { report(null, -1, "WMS捕获失败: " + error, -1); }
                    }
                });
                // PackageReady can arrive after the primary display's initial configuration.
                Looper main=Looper.getMainLooper();
                if(main!=null)new Handler(main).postDelayed(()->findExistingDisplay(1),5000);
                return true;
            } catch (Throwable error) { report(null, -1, "系统框架工作台入口不可用: " + error, -1); return false; }
        }
        static synchronized void attachDisplay(Object primary) {
            Object manager=field(primary,"mWmService");
            Handler owner=(Handler)field(manager,"mH");
            Context host=(Context)field(manager,"mContext");
            Object global=field(manager,"mGlobalLock");
            if(owner==null || host==null || global==null)return;
            service=manager;lock=global;handler=owner;context=host;display=primary;
            if(!registered)owner.postDelayed(Wm::registerCommands,1000);
        }
        static void findExistingDisplay(int attempt) {
            if(registered)return;
            try {
                Class<?> services=Class.forName("android.os.ServiceManager",false,loader);
                Object manager=StepMembers.callStaticMethod(services,"checkService","window");
                Class<?> wm=Class.forName("com.android.server.wm.WindowManagerService",false,loader);
                if(wm.isInstance(manager)){
                    Object global=field(manager,"mGlobalLock");
                    synchronized(global) {
                        Object primary=call(manager,"getDefaultDisplayContentLocked");
                        if(primary!=null && field(primary,"mWmService")==manager && Integer.valueOf(0).equals(call(primary,"getDisplayId")))
                            attachDisplay(primary);
                    }
                }
            } catch(ReflectiveOperationException|RuntimeException|LinkageError missing) {
                if(attempt==1)report(null,0,"无法取得现有主屏，等待系统配置回调："+missing,-1);
            }
            if(attempt<12)new Handler(Looper.getMainLooper()).postDelayed(()->findExistingDisplay(attempt+1),5000);
        }
        static void registerCommands() {
            if (registered || context == null) return;
            try {
                register(context, handler, new BroadcastReceiver() {
                    @Override public void onReceive(Context c, Intent i) {
                        ResultReceiver r = sink(i);
                        String op = i.getStringExtra("operation");
                        if ("query".equals(op)) answer(i,NativeWorkspaceGuard.registered,"系统框架");
                        else if ("stop".equals(op)) stop("工作区暂挂");
                    }
                });
                IntentFilter lifecycle = new IntentFilter(Intent.ACTION_SCREEN_OFF);
                lifecycle.addAction(Intent.ACTION_CONFIGURATION_CHANGED);
                lifecycle.addAction("android.intent.action.USER_SWITCHED");
                lifecycle.addAction("android.intent.action.MANAGED_PROFILE_UNAVAILABLE");lifecycle.addAction("android.intent.action.PROFILE_UNAVAILABLE");
                lifecycle.addAction("android.intent.action.USER_STOPPED");
                context.registerReceiver(new BroadcastReceiver() {
                    @Override public void onReceive(Context c, Intent i) {
                        if("android.intent.action.USER_SWITCHED".equals(i.getAction())){
                            NativeWorkspaceGuard.parked=new ParkedWorkspace();NativeWorkspaceGuard.afterRestore=null;
                        }
                        if(active)stop(Intent.ACTION_SCREEN_OFF.equals(i.getAction())?"息屏暂挂":
                                Intent.ACTION_CONFIGURATION_CHANGED.equals(i.getAction())?"配置暂挂":"用户变化恢复");
                    }
                }, lifecycle, null, handler, Context.RECEIVER_NOT_EXPORTED);
                registered = true;
                NativeWorkspaceGuard.install(loader);
                observeSwitch(context,handler,true);
                report(null, 0, "系统框架入口就绪", -1);
            } catch (Throwable error) { report(null, -1, "WMS入口注册失败: " + error, -1); }
        }
        static Object newSpec(float scale, float x, float y) throws Exception {
            Class<?> type = Class.forName("android.view.MagnificationSpec", false, loader);
            java.lang.reflect.Constructor<?> ctor = type.getDeclaredConstructor(); ctor.setAccessible(true);
            Object spec = ctor.newInstance();
            StepMembers.setFloatField(spec, "scale", scale);
            StepMembers.setFloatField(spec, "offsetX", x);
            StepMembers.setFloatField(spec, "offsetY", y);
            return spec;
        }
        static void start() {
            if(active)throw new IllegalStateException("已有工作台运行");
            reply=null;
            try {
                if (!interactive(context)) throw new IllegalStateException("屏幕已锁定或息屏，无法进入工作台");
                synchronized (lock) {
                    if (field(display, "mMagnificationSpec") != null) throw new IllegalStateException("已有系统缩放占用，保持原状");
                    StepMembers.findMethodExact(field(display,"mInputMonitor").getClass(),"updateInputWindowsLw",boolean.class);
                    ownedSpec=null;
                    active = true;
                    // Arm restoration before changing display state; exceptions take the same restore path.
                    handler.postDelayed(TIMEOUT, DURATION);
                    if (field(display, "mMagnificationSpec") != ownedSpec) throw new IllegalStateException("缩放对象未持有");
                    Object monitor = field(display, "mInputMonitor");
                    call(monitor, "updateInputWindowsLw", true);
                }
                report(reply, 1, "主屏已为工作区入场预留", sideTask);
            } catch (Throwable error) {
                report(reply, -1, "主屏入场未完成: " + error, sideTask);
                if (active) stop("启动失败恢复");
            }
        }
        static void moveWorkspace(WorkspaceLayout target) throws Exception {
            if(target.reflow)WorkspaceMainBounds.use(target);
            moveSpec(target.mainScale,target.mainX,target.top);
        }
        static void moveSpec(float scale,float x,float y)throws Exception{
            if(!active || field(display,"mMagnificationSpec")!=ownedSpec)
                throw new IllegalStateException("原屏缩放所有权已改变");
            Object next=newSpec(scale,x,y);
            boolean identity=scale==1f && x==0 && y==0;
            applyingSpec=next;
            try {call(display,"applyMagnificationSpec",next);}
            finally {
                Object current=field(display,"mMagnificationSpec");
                if(current==next || identity && current==null)ownedSpec=current;
                applyingSpec=null;
            }
            if(!identity && ownedSpec!=next || identity && ownedSpec!=null)throw new IllegalStateException("目标主区缩放未接管");
            call(field(display,"mInputMonitor"),"updateInputWindowsLw",true);
            GameInput.geometry(scale,x,y);
        }
        static void stop(String reason) {
            if (NativeWorkspaceGuard.active && !NativeWorkspaceGuard.ending) { NativeWorkspaceGuard.finish(reason); return; }
            if (!active) return;
            handler.removeCallbacks(TIMEOUT);
            try {
                synchronized (lock) {
                    WorkspaceMainBounds.clear();
                    Object current = field(display, "mMagnificationSpec");
                    active = false;
                    if (current == ownedSpec) {
                        call(display, "applyMagnificationSpec", newSpec(1f, 0f, 0f));
                        NativeTransitionPose.refresh(call(display,"getPendingTransaction"));
                        call(field(display, "mInputMonitor"), "updateInputWindowsLw", true);
                        if (field(display, "mMagnificationSpec") != null) throw new IllegalStateException("缩放未归零");
                    } else if (current != null) {
                        report(reply, -1, "缩放所有权已变化，未覆盖其他系统缩放", sideTask);
                    }
                    ownedSpec = null; sideTask = -1;
                }
                report(reply, 3, reason + "：本次主屏缩放已结束", -1);
            } catch (Throwable error) {
                active = true;
                handler.postDelayed(TIMEOUT, 1000);
                report(reply, -1, "恢复失败，1秒后重试: " + error, sideTask);
            }
        }
    }

    static final class Shell {
        static final Handler main = new Handler(Looper.getMainLooper());
        // A signed module setting alone cannot prove that system_server loaded this APK.
        static boolean serverReady;
        static int probeGeneration;
        static String handshake="not_requested";
        static void onSwitchChanged() {
            serverReady=false;
            handshake=enabled?"waiting":"disabled";
            int token=++probeGeneration;
            if(enabled) queryServer(token,1000);
        }
        static void queryServer(int token,int retryMs) {
            if(token!=probeGeneration || !enabled || serverReady)return;
            ResultReceiver reply=new ResultReceiver(main) {
                @Override protected void onReceiveResult(int code,Bundle data) {
                    if(token!=probeGeneration || !enabled || serverReady)return;
                    serverReady=code==1 && data!=null && data.getInt("version")==ls.augment.com.BuildConfig.VERSION_CODE;
                    String state=serverReady?"ready":data!=null&&data.getInt("version")!=ls.augment.com.BuildConfig.VERSION_CODE?"version_mismatch":"server_not_ready";
                    if(!state.equals(handshake))diagnostic("HANDSHAKE",state);
                    handshake=state;
                }
            };
            android.app.BroadcastOptions delivery=android.app.BroadcastOptions.makeBasic().setShareIdentityEnabled(true);
            try {
                context.sendBroadcast(new Intent(NativeWorkspaceGuard.ACTION).setPackage("android")
                        .putExtra("operation","readiness").putExtra("reply",remote(reply)),null,delivery.toBundle());
            } catch(RuntimeException unavailable) { report(null,-1,"系统框架能力查询失败："+unavailable,-1); }
            main.postDelayed(()->queryServer(token,Math.min(retryMs*2,60000)),retryMs);
        }
        // The app's two independent queries do not prove that SystemUI can
        // reach the authenticated task receiver used by the actual gesture.
        // Probe that exact route, including while enabling from OFF.
        static void checkEntry(Intent request) {
            diagnostic("ENTRY_CHECK",CornerEntry.snapshot()+";handshake="+handshake
                    +";factory="+(factory!=null)+";executor="+(executor!=null)+";transitions="+(transitions!=null));
            if(factory==null || executor==null || transitions==null || !CornerEntry.supported) {
                answer(request,false,"系统界面（工作台组件或手势入口未接入）");return;
            }
            // Supersede older background replies: this check must describe a
            // fresh request, and an older negative reply must not undo it.
            int generation=++probeGeneration;
            boolean wasEnabled=enabled;
            boolean[] completed={false};
            Runnable timeout=()->{
                if(completed[0])return;
                completed[0]=true;
                if(generation==probeGeneration){serverReady=false;handshake="timeout";}
                diagnostic("ENTRY_CHECK_RESULT","timeout;"+CornerEntry.snapshot());
                answer(request,false,"系统界面（与系统框架通信超时）");
                if(generation==probeGeneration && enabled)onSwitchChanged();
            };
            main.postDelayed(timeout,2500);
            ResultReceiver reply=new ResultReceiver(main) {
                @Override protected void onReceiveResult(int code,Bundle data) {
                    if(completed[0])return;
                    completed[0]=true;main.removeCallbacks(timeout);
                    boolean current=generation==probeGeneration && wasEnabled==enabled;
                    boolean version=data!=null && data.getInt("version")==ls.augment.com.BuildConfig.VERSION_CODE;
                    boolean ready=current && code==1 && version;
                    if(current){serverReady=ready&&enabled;handshake=ready?"ready":"server_not_ready";}
                    diagnostic("ENTRY_CHECK_RESULT","ready="+ready+";current="+current+";version="+version+";"+CornerEntry.snapshot());
                    answer(request,ready,"系统界面（"+(!current?"配置已变化，请重试":!version?"系统框架版本未匹配":code!=1?"系统框架尚未就绪":"与系统框架通信正常")+"）");
                    if(current && !ready && enabled)onSwitchChanged();
                }
            };
            try {
                android.app.BroadcastOptions delivery=android.app.BroadcastOptions.makeBasic().setShareIdentityEnabled(true);
                context.sendBroadcast(new Intent(NativeWorkspaceGuard.ACTION).setPackage("android")
                        .putExtra("operation",wasEnabled?"readiness":"probe").putExtra("reply",remote(reply)),null,delivery.toBundle());
            } catch(RuntimeException unavailable) {
                main.removeCallbacks(timeout);timeout.run();
                diagnostic("ENTRY_CHECK_ERROR",unavailable.getClass().getSimpleName());
            }
        }
        static Object factory, transitions;
        static Executor executor;
        static Context context;
        static ClassLoader loader;
        static boolean registered;
        static void install(ClassLoader cl) {
            loader = cl;
            try {
                CornerEntry.install(cl);
                WorkspaceFinish.install(cl);
                NativeTiles.install(cl);
                NativeBrightnessBinding.install(cl);
                WorkspaceRoutes.installNotification(cl);
                Class<?> module = Class.forName("com.android.wm.shell.dagger.WMShellBaseModule", false, cl);
                for (Method m : module.getDeclaredMethods()) {
                    if (!m.getName().startsWith("provideTaskView")) continue;
                    final String name = m.getName();
                    StepHooks.hookMethod(m, new StepHook.Discovery() {
                        @Override protected void afterHookedMethod(MethodHookParam p) {
                            if (p.hasThrowable()) return;
                            if (name.equals("provideTaskViewFactory") && p.getResult() instanceof Optional) factory = ((Optional<?>) p.getResult()).orElse(null);
                            if (name.equals("provideTaskViewTransitions")) transitions = p.getResult();
                            if (name.equals("provideTaskViewFactoryController")) for (Object arg : p.args) if (arg instanceof Executor) executor = (Executor) arg;
                        }
                    });
                }
                StepMembers.findAndHookMethod(Application.class, "attach", Context.class, new StepHook.Discovery() {
                    @Override protected void afterHookedMethod(MethodHookParam p) {
                        context = (Context) p.thisObject;
                        main.postDelayed(Shell::registerCommands, 5000);
                    }
                });
            } catch (Throwable error) { report(null, -1, "系统界面工作台入口不可用: " + error, -1); }
        }
        static void registerCommands() {
            if (registered || context == null) return;
            try {
                register(context, main, new BroadcastReceiver() {
                    @Override public void onReceive(Context c, Intent i) {
                        ResultReceiver r = sink(i);
                        String op = i.getStringExtra("operation");
                        if ("query".equals(op)) checkEntry(i);
                        else if ("stop".equals(op)) LiveWorkspace.stop("手动退出工作区");
                        else if ("quickPins".equals(op) && LiveWorkspace.running()) LiveWorkspace.current.updateQuickPins(i);
                    }
                });
                IntentFilter life = new IntentFilter(Intent.ACTION_SCREEN_OFF); life.addAction(Intent.ACTION_CONFIGURATION_CHANGED);
                life.addAction(Intent.ACTION_SCREEN_ON);life.addAction(Intent.ACTION_USER_PRESENT);
                life.addAction("android.intent.action.USER_SWITCHED");
                life.addAction(Intent.ACTION_CLOSE_SYSTEM_DIALOGS);
                context.registerReceiver(new BroadcastReceiver() {
                    @Override public void onReceive(Context c, Intent i) {
                        if(Intent.ACTION_SCREEN_ON.equals(i.getAction()) || Intent.ACTION_USER_PRESENT.equals(i.getAction())){
                            WorkspaceWake.awaken();return;
                        }
                        if(Intent.ACTION_SCREEN_OFF.equals(i.getAction()))WorkspaceWake.remember(LiveWorkspace.current);
                        if("android.intent.action.USER_SWITCHED".equals(i.getAction()))WorkspaceWake.cancel();
                        if(Intent.ACTION_CLOSE_SYSTEM_DIALOGS.equals(i.getAction())){
                            if("homekey".equals(i.getStringExtra("reason")))LiveWorkspace.stop("桌面暂挂");
                            return;
                        }
                        WorkspaceClipboard.systemEvent(i.getAction());
                        if(Intent.ACTION_CONFIGURATION_CHANGED.equals(i.getAction()) && LiveWorkspace.current!=null
                                && LiveWorkspace.current.preparingPortrait)return;
                        LiveWorkspace.stop(Intent.ACTION_SCREEN_OFF.equals(i.getAction())?"息屏暂挂":
                                Intent.ACTION_CONFIGURATION_CHANGED.equals(i.getAction())?"配置暂挂":"用户变化退出");

                    }
                }, life, null, main, Context.RECEIVER_NOT_EXPORTED);
                registered = true;
                observeSwitch(context,main,false);
                WorkspaceClipboard.install(context);
                report(null, 0, "系统界面入口就绪", -1);
            } catch (Throwable error) { report(null, -1, "SystemUI入口注册失败: " + error, -1); }
        }
    }
}
