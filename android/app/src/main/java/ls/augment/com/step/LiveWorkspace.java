package ls.augment.com.step;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.os.ResultReceiver;
import android.util.SparseArray;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.reflect.Proxy;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;
import java.util.function.Consumer;
import static ls.augment.com.step.StepRuntime.*;

/** Multiple original task surfaces share one unbound preview parent on the physical display. */
final class LiveWorkspace {
    static LiveWorkspace current;
    final Handler main = new Handler(Looper.getMainLooper());
    final Binder owner = new Binder();
    final String session = UUID.randomUUID().toString();
    final OperationFence fence = new OperationFence();
    final Map<Integer, Lease> leases = new LinkedHashMap<>();
    final ResultReceiver reportTo;
    boolean leftSide;
    final android.os.UserHandle quickUser;
    java.util.ArrayList<String> pinned;
    long pinRevision;
    WorkspaceQuickBar quickBar;
    boolean topAvailable,upperEnabled, localLandscape, edgeHandoff, forceResize;
    int upperId=-1;
    final boolean renewable;
    boolean retainOnExit,homeExit;
    int[] retained;
    int restorePage,exitPage;boolean restoreTopFace,exitTopFace;
    long viewRevision;
    void publishViewState(){
        if(quickBar==null || quickBar.deck==null || !ready || closed || closing || retained!=null)return;
        Bundle b=new Bundle();b.putBinder("owner",owner);b.putString("session",session);b.putLong("viewRevision",++viewRevision);
        b.putInt("page",quickBar.deck.savedPage());b.putBoolean("topFace",quickBar.upper!=null && quickBar.upper.visible);
        android.app.BroadcastOptions delivery=android.app.BroadcastOptions.makeBasic().setShareIdentityEnabled(true);
        Shell.context.sendBroadcast(new Intent(NativeWorkspaceGuard.ACTION).setPackage("android").putExtra("operation","viewState").putExtras(b),null,delivery.toBundle());
    }
    int resumeIndex;
    int resumeWait;
    final Runnable renew=new Runnable(){public void run(){
        if(!ready || closing || closed)return;
        if(!fence.busy() && interactive(Shell.context))rpc("renew",new Bundle(),r->{});
        main.postDelayed(this,25000);
    }};
    long rpcSequence;
    final SideSlots slots = new SideSlots();
    volatile int visibleSlots = SideSlots.DEFAULT_COUNT;
    int previewWidth, previewHeight;
    volatile boolean ready, closing, closed;
    android.animation.ValueAnimator chromeMotion;
    boolean cleaning, checkingState;
    Object controller, organizer, organizerLock, nativeTransitions;
    OwnershipBridge ownership;
    Rect logical;
    View taskView;
    LinearLayout panel;
    final Button[] cells = new Button[SideSlots.MAX_COUNT];
    volatile WorkspaceLayout geometry;
    volatile FlipStage flipStage;
    android.animation.ValueAnimator releaseMotion;
    volatile int dragSlot=-1;
    volatile float dragX;
    volatile int[] shiftFrom;
    volatile float shiftProgress;
    boolean dragFrame;
    WindowManager windows;
    WorkspaceInput input;

    LiveWorkspace(ResultReceiver target, Intent options) {
        reportTo = target;
        leftSide = options.getBooleanExtra("leftSide", false);
        renewable=options.getBooleanExtra("normalEntry",false);
        quickUser = options.getParcelableExtra("quickUser", android.os.UserHandle.class);
        int count=options.getIntExtra("sideCount",SideSlots.DEFAULT_COUNT);
        if(SideSlots.validCount(count))visibleSlots=count;
        upperEnabled=options.getBooleanExtra("upperEnabled",false) && WorkspaceCapacity.fitsLayout(visibleSlots,true);
        updateQuickPins(options);
    }
    void updateQuickPins(Intent data) {
        if (quickUser == null || !quickUser.equals(data.getParcelableExtra("quickUser", android.os.UserHandle.class))) return;
        long version = data.getLongExtra("quickRevision", -1);
        if (version < pinRevision) return;
        java.util.ArrayList<String> keys = data.getStringArrayListExtra("quickPins");
        if (keys == null) return;
        pinned = keys; pinRevision = version;
        if (quickBar != null) quickBar.updateOrder();
    }
    static boolean running() { return current != null && !current.closed; }
    static void open(ResultReceiver report, Intent options) {
        if (!StepRuntime.enabled || running() || Wm.active) { StepRuntime.report(report, 13, "工作台已关闭或正在运行", -1); return; }
        LiveWorkspace workspace = new LiveWorkspace(report, options); current = workspace; workspace.create();
    }
    static void stop(String reason) { if (running()) current.close(reason); }
    void log(String message) { StepRuntime.report(reportTo, 10, message, -1); }
    void create() {
        if (Shell.factory == null || Shell.executor == null || Shell.transitions == null) { fail("TaskView运行时能力未就绪"); return; }
        try {
            call(Shell.factory, "create", Shell.context, Shell.executor, (Consumer<Object>) value -> main.post(() -> {
                if (closing || closed) { try { call(value, "release"); } catch (Throwable ignored) { } return; }
                try { attach((View) value); }
                catch (Throwable error) { fail("完整预览容器不可用: " + error); }
            }));
            main.postDelayed(() -> { if (!ready && !closed) fail("工作区创建超时"); }, 10000);
        } catch (Throwable error) { fail("无法创建TaskView容器: " + error); }
    }
    void attach(View view) throws Exception {
        taskView = view;
        controller = call(view, "getController");
        organizer = field(controller, "mTaskOrganizer"); organizerLock = field(organizer, "mLock");
        if (!(field(organizer, "mTasks") instanceof SparseArray) || !(field(organizer, "mTaskListeners") instanceof SparseArray))
            throw new IllegalStateException("未知任务表结构");
        ClassLoader cl = Shell.loader;
        Class<?> infoClass = Class.forName("android.app.ActivityManager$RunningTaskInfo", false, cl);
        Class<?> surfaceClass = Class.forName("android.view.SurfaceControl", false, cl);
        Class<?> listenerClass = Class.forName("com.android.wm.shell.ShellTaskOrganizer$TaskListener", false, cl);
        OwnershipBridge.taskVanished(listenerClass, infoClass);
        ownership = new OwnershipBridge(organizer, infoClass, surfaceClass, listenerClass);
        nativeTransitions = field(Shell.transitions, "mTransitions");
        OwnershipBridge.method(nativeTransitions.getClass(), "isIdle");
        Class<?> taskListener = Class.forName("com.android.wm.shell.taskview.TaskView$Listener", false, cl);
        Object listener = Proxy.newProxyInstance(cl, new Class<?>[]{taskListener}, (proxy, method, args) -> {
            switch (method.getName()) {
                case "hashCode": return System.identityHashCode(proxy);
                case "equals": return proxy == args[0];
                case "toString": return "StepFullFrameContainer";
                case "onInitialized": main.post(this::beginNative); break;
                case "onReleased": if (!closing) main.post(() -> fail("预览容器已释放")); break;
            }
            return null;
        });
        call(view, "setListener", Shell.executor, listener);
        Context themed = new android.view.ContextThemeWrapper(Shell.context, android.R.style.Theme_Material_Light_NoActionBar);
        windows = Shell.context.getSystemService(WindowManager.class);
        input=new WorkspaceInput(themed,main,this::log,message->{
            log(message);if(!closed){closing=true;cleaning=false;fence.close();requestEnd();}
        });
        Rect screen = windows.getCurrentWindowMetrics().getBounds();
        geometry = new WorkspaceLayout(screen.width(),screen.height(),themed.getResources().getDisplayMetrics().density,leftSide);
        if(geometry.top<StepMaterial.dp(themed,92))throw new IllegalStateException("工作区顶栏物理高度不足");
        previewWidth=geometry.sideWidth; previewHeight=geometry.railHeight;
        if (OwnershipBridge.method(view.getClass(), "setObscuredTouchRect", Rect.class).getReturnType() != void.class)
            throw new IllegalStateException("未知的预览触摸区域接口");
        call(view, "setObscuredTouchRect", new Rect(0, 0, previewWidth, previewHeight));
        logical = new Rect(0, 0, screen.width(), screen.height());
        panel = new LinearLayout(themed); panel.setOrientation(LinearLayout.VERTICAL);
        FrameLayout preview = new FrameLayout(themed);
        preview.addView(view, new FrameLayout.LayoutParams(-1, -1));
        LinearLayout rows = new LinearLayout(themed);
        rows.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < cells.length; i++) {
            final int slot = i;
            Button cell = new Button(themed);
            cells[i] = cell;
            cell.setTextSize(14);
            cell.setPadding(0, 0, 0, 0);
            cell.setOnClickListener(v -> change(slot));
            cell.setOnLongClickListener(v -> { returnSide(slot, false); return true; });
            cell.setOnTouchListener(new View.OnTouchListener() {
                float startX, startY;
                boolean swiped, invalid;
                @Override public boolean onTouch(View target, MotionEvent event) {
                    switch (event.getActionMasked()) {
                        case MotionEvent.ACTION_DOWN:
                            swiped=false;
                            if(releaseMotion!=null || dragSlot>=0 || fence.busy() || closing){invalid=true;return true;}
                            startX=event.getRawX(); startY=event.getRawY(); swiped=false; invalid=false; break;
                        case MotionEvent.ACTION_POINTER_DOWN:
                            invalid=true; target.cancelLongPress(); target.setPressed(false);
                            if(swiped && dragSlot==slot)settleDrag(slot,false);
                            swiped=false;return true;
                        case MotionEvent.ACTION_MOVE:
                            if(invalid || closing || fence.busy() || slots.task(slot)<0)return invalid;
                            float dx=WorkspaceLayout.outward(event.getRawX()-startX,leftSide);
                            if(!swiped && target.isPressed() && dx>ViewConfiguration.get(themed).getScaledTouchSlop()
                                    && dx>Math.abs(event.getRawY()-startY)*1.5f){
                                swiped=true;target.cancelLongPress();target.setPressed(false);
                            }
                            if(swiped)slide(slot,(leftSide?-1:1)*Math.min(cell.getWidth(),Math.max(0,dx)));
                            break;
                        case MotionEvent.ACTION_UP:
                            if(invalid)return true;
                            if(swiped){
                                float outward=WorkspaceLayout.outward(event.getRawX()-startX,leftSide);
                                boolean accept=WorkspaceMotion.acceptsRelease(outward,event.getRawY()-startY,cell.getWidth(),
                                        StepMaterial.dp(themed,32),ViewConfiguration.get(themed).getScaledTouchSlop());
                                settleDrag(slot,accept);return true;
                            }
                            break;
                        case MotionEvent.ACTION_CANCEL:
                            if(swiped && dragSlot==slot)settleDrag(slot,false);
                            swiped=false;break;
                    }
                    return swiped;
                }
            });
            rows.addView(cell, new LinearLayout.LayoutParams(-1, 0));
        }
        preview.addView(rows, new FrameLayout.LayoutParams(-1, -1));
        panel.addView(preview, new LinearLayout.LayoutParams(previewWidth, previewHeight));
        panel.setBackgroundColor(0xff202126);
        showSlots();
        WindowManager.LayoutParams lp = new WindowManager.LayoutParams(previewWidth, -2,
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM | WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL | WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED, PixelFormat.TRANSLUCENT);
        lp.gravity = Gravity.TOP | Gravity.LEFT; lp.x = geometry.sideX; lp.y = geometry.top;
        lp.setFitInsetsTypes(0);lp.layoutInDisplayCutoutMode=WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
        lp.alpha=0;lp.setTitle(TITLE);windows.addView(panel, lp);
        taskView.addOnLayoutChangeListener((v,a,b,c,d,e,f,g,h) -> {
            try {
                // TaskView subtracts its content from the host input region. Put
                // the thumbnail shield back, using the same window coordinates.
                int[] at = new int[2]; v.getLocationInWindow(at);
                call(v, "setObscuredTouchRect", new Rect(at[0], at[1], at[0]+v.getWidth(), at[1]+v.getHeight()));
            } catch (Throwable error) { fail("预览触摸区域不可用: " + error); return; }
            if (ready && !closing) Shell.executor.execute(() -> { try { render(); } catch (Throwable error) { main.post(() -> reconcile("预览尺寸变化: " + error)); } });
        });
    }
    void slide(int slot,float offset){
        dragSlot=slot;dragX=offset;
        if(dragFrame || closed || closing || taskView==null)return;
        dragFrame=true;taskView.postOnAnimation(()->{
            dragFrame=false;
            if(ready && !closing && !fence.busy())Shell.executor.execute(()->{
                try{render();}catch(Throwable error){main.post(()->reconcile("副格手势画面："+error));}
            });
        });
    }
    void settleDrag(int slot,boolean dismiss) {
        if(releaseMotion!=null || closing || fence.busy() || dragSlot!=slot)return;
        final int id=slots.task(slot);
        float travel=previewWidth+StepMaterial.dp(Shell.context,8);
        float end=dismiss?(leftSide?-travel:travel):0;
        android.animation.ValueAnimator run=android.animation.ValueAnimator.ofFloat(dragX,end);
        releaseMotion=run;
        run.setInterpolator(new android.view.animation.PathInterpolator(.22f,.7f,.12f,1));
        run.setDuration(WorkspaceMotion.releaseTime(dragX,end,previewWidth));
        run.addUpdateListener(a->{if(releaseMotion==run)slide(slot,(Float)a.getAnimatedValue());});
        run.addListener(new android.animation.AnimatorListenerAdapter(){
            @Override public void onAnimationEnd(android.animation.Animator a){
                if(releaseMotion!=run || closing)return;
                dragX=end;
                Shell.executor.execute(()->{
                    try{render(()->main.post(()->{
                        if(releaseMotion!=run || closing)return;
                        releaseMotion=null;
                        if(slots.task(slot)!=id || id<0){slide(-1,0);return;}
                        if(dismiss)returnSide(slot,true,true);else slide(-1,0);
                    }));}catch(Throwable e){main.post(()->fail("副格外划末帧未提交："+e));}
                });
            }
        });
        run.start();
        main.postDelayed(()->{
            if(!closing && releaseMotion==run)close("副格外划等待图层确认超时");
        },1400);
    }
    void clearDrag() {
        android.animation.ValueAnimator run=releaseMotion;releaseMotion=null;
        if(run!=null)run.cancel();
        dragSlot=-1;dragX=0;
    }
    void showSlots() {
        for (int slot = 0; slot < cells.length; slot++) {
            Button cell = cells[slot];
            cell.setVisibility(slot < visibleSlots ? View.VISIBLE : View.GONE);
            LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) cell.getLayoutParams();
            if(slot < visibleSlots) { params.height=geometry.rowHeight(slot,visibleSlots); params.topMargin=slot==0?0:geometry.gap; cell.setLayoutParams(params); }
            boolean empty = slots.task(slot) < 0;
            cell.setText(empty ? "＋" : "");
            cell.setTextSize(34);
            cell.setTextColor(0xffeeeeee);
            if(empty)cell.setBackground(StepMaterial.glass(cell.getContext(),true,0));
            else cell.setBackgroundColor(0x00000000);
            cell.setTextColor(StepMaterial.ink(cell.getContext()));
            cell.setContentDescription((empty ? "收纳到副格 " : "交换副格 ") + (slot + 1));
        }
        if (quickBar != null) quickBar.updateCapacity();
    }
    void resizeSlots(int count,boolean upper) {
        try {
            preflight();
            if(count==visibleSlots && upper==upperEnabled)return;
            if(!WorkspaceCapacity.fitsLayout(count,upper) || upper && !topAvailable)return;
            if(retained!=null || !slots.fits(count) || !upper && upperId>=0){quickBar.logUnavailable("请先归还所选布局容纳不了的副任务");return;}
            long ticket = fence.begin();
            input.acquire(() -> {
                if (!fence.current(ticket)) return;
                visibleSlots=count;
                if(upperEnabled!=upper){upperEnabled=upper;quickBar.configureUpper();}
                showSlots();
                Shell.executor.execute(() -> {
                    try {
                        render(() -> main.post(() -> {
                            if (fence.current(ticket)) input.release(() -> {
                                fence.complete(ticket);
                                Bundle data=new Bundle();data.putInt("sideCount",count);data.putBoolean("upperEnabled",upper);
                                try{Bundle result=Shell.context.getContentResolver().call(WorkspacePrefsProvider.URI,"sideCount",null,data);
                                    if(result==null || !result.getBoolean("saved"))quickBar.logUnavailable("已调整本次布局，未保存默认数量");}
                                catch(RuntimeException error){quickBar.logUnavailable("已调整本次布局，未保存默认数量");}
                            });
                        }));
                    } catch (Throwable error) { main.post(() -> fail("预览布局提交失败：" + error)); }
                });
            });
        } catch (Throwable error) { log("暂未调整副格：" + error.getMessage()); }
    }
    void beginNative() {
        if (ready || closing || closed) return;
        try {
            surface();
            Bundle b = new Bundle();
            b.putBoolean("leftSide", leftSide);
            b.putBoolean("renewable",renewable);
            int user=android.os.Process.myUserHandle().equals(quickUser)?(Integer)call(quickUser,"getIdentifier"):-1;
            b.putInt("user",user);b.putInt("sideCount",visibleSlots);b.putBoolean("upperEnabled",upperEnabled);
            try{
                ActivityManager.RunningTaskInfo launcher=home(user);
                b.putInt("home",launcher.taskId);b.putParcelable("homeToken",(Parcelable)field(launcher,"token"));
            }catch(RuntimeException absent){log("桌面任务暂不可用："+absent);}
            b.putParcelable("events", remote(new ResultReceiver(main) {
                @Override protected void onReceiveResult(int code, Bundle data) {
                    if (closed||!session.equals(data.getString("session"))) return;
                    log(data.getString("message", "系统服务事件"));
                    if(code==95){
                        if(closing || quickBar==null || quickBar.upper==null || !fence.busy())return;
                        ResultReceiver reply=data.getParcelable("ready");if(reply==null)return;
                        quickBar.upper.render(true,true);
                        awaitUpperCaption(reply,android.os.SystemClock.uptimeMillis()+800);return;
                    }
                    if(code==96){WorkspaceRoutes.hostRoute(LiveWorkspace.this,data);return;}
                    if (code == 97) retireSlot(data.getInt("slot"), data.getInt("removed"));
                    if (code == 98 && !closing) startRecovery(() -> {});
                    if (code == 99) { closing = true; fence.close(); cleanup(); }
                }
            }));
            rpc("begin", b, result -> { logical = result.getParcelable("logical");ready=true;topAvailable=result.getBoolean("topAvailable");
                leftSide=result.getBoolean("left",leftSide);
                geometry=new WorkspaceLayout(logical.width(),logical.height(),Shell.context.getResources().getDisplayMetrics().density,leftSide);
                WindowManager.LayoutParams bounds=(WindowManager.LayoutParams)panel.getLayoutParams();bounds.x=geometry.sideX;windows.updateViewLayout(panel,bounds);
                restorePage=result.getInt("page",0);restoreTopFace=result.getBoolean("topFace");
                forceResize=result.getBoolean("forceResize");localLandscape=result.getBoolean("localLandscape");edgeHandoff=result.getBoolean("edgeHandoff");
                try {
                    quickBar = new WorkspaceQuickBar(this);
                    quickBar.open();
                } catch (RuntimeException | LinkageError unavailable) {
                    closeQuickBar();
                    log("工作区顶区不可用：" + unavailable.getMessage()); close("归还原任务"); return;
                }
                zoom(true,()->{
                    StepRuntime.report(reportTo,11,"工作区已就绪；任务交接路径=" + ownership.path()
                            +(renewable?"；角部工作区，宿主续期。":"；90秒自动退出。"),-1);
                    if(renewable)main.postDelayed(renew,25000);
                    retained=result.getIntArray("retained");resumeNext();
                }); });
        } catch (Throwable error) { fail("原任务工作区初始化失败: " + error); }
    }
    void rpc(String action, Bundle args, Consumer<Bundle> success) {
        if (closed || (closing && !"end".equals(action)&&!"state".equals(action))) return;
        final long request = ++rpcSequence;
        final boolean[] answered = {false};
        ResultReceiver callback = new ResultReceiver(main) {
            @Override protected void onReceiveResult(int code, Bundle data) {
                if (answered[0] || closed) return;
                answered[0] = true;
                if (!session.equals(data.getString("session"))) { fail("系统服务会话不匹配"); return; }
                if(closing&&!"end".equals(action)&&!"state".equals(action))return;
                if (code != 0) {
                    if(closing){log(data.getString("message","归还尚未确认"));main.postDelayed(thisWorkspace()::requestEnd,1000);}
                    else fail(data.getString("message", "系统服务未完成请求"));
                    return;
                }
                String state=data.getString("state","");
                if(!"begin".equals(action)&&("RESTORING".equals(state)||"RESTORED".equals(state))){
                    if ("RESTORED".equals(state)) {
                        closing = true;
                        fence.close();
                        cleanup();
                    } else {
                        if (!closing) startRecovery(() -> {});
                        main.postDelayed(() -> { if (!closed) requestEnd(); }, 2000);
                    }
                    return;
                }
                try { success.accept(data); } catch (Throwable error) { fail("交接回调失败: " + error); }
            }
        };
        args.putBinder("owner", owner); args.putString("session", session); args.putLong("sequence", request);
        args.putString("operation", action); args.putParcelable("reply",remote(callback));
        android.app.BroadcastOptions delivery=android.app.BroadcastOptions.makeBasic().setShareIdentityEnabled(true);
        Shell.context.sendBroadcast(new Intent(NativeWorkspaceGuard.ACTION).setPackage("android").putExtras(args),null,delivery.toBundle());
        main.postDelayed(() -> {
            if (!answered[0] && !closed) {
                answered[0] = true;
                if ("end".equals(action)) {
                    if (!ready && leases.isEmpty()) {
                        // No task can be admitted before begin is acknowledged. An unavailable
                        // recovery receiver must not leave an empty, permanent overlay behind.
                        Shell.context.sendBroadcast(StepRuntime.command("android", "stop", reportTo));
                        cleanup();
                    } else {
                        log("系统服务尚未确认归还，保留容器并继续请求恢复"); main.postDelayed(this::requestEnd, 1000);
                    }
                }
                else if(!closing)fail("系统服务响应超时: " + action);
            }
        }, 4000);
    }
    void reconcile(String detail) {
        if(closed||closing||fence.busy()||checkingState)return;
        checkingState=true;
        rpc("state",new Bundle(),state->{
            checkingState=false;
            if(!closing)close("副任务状态由系统改变，归还工作区："+detail);
        });
    }
    LiveWorkspace thisWorkspace(){return this;}
    void awaitUpperCaption(ResultReceiver reply,long deadline){
        if(closing || quickBar==null || !fence.busy())return;
        quickBar.bar.getViewTreeObserver().registerFrameCommitCallback(()->main.post(()->{
            if(closing || quickBar==null || !fence.busy())return;
            int[] at=new int[2];quickBar.bar.getLocationOnScreen(at);
            if(at[0]==0 && at[1]==0 && quickBar.bar.getHeight()==quickBar.upper.caption)reply.send(1,new Bundle());
            else if(android.os.SystemClock.uptimeMillis()<deadline)awaitUpperCaption(reply,deadline);
        }));quickBar.bar.invalidate();
    }
    void fadeWindow(View view,float alpha){
        if(view==null || !view.isAttachedToWindow())return;
        WindowManager.LayoutParams lp=(WindowManager.LayoutParams)view.getLayoutParams();lp.alpha=alpha;windows.updateViewLayout(view,lp);
    }
    void zoom(boolean enter,Runnable done){
        long ticket=fence.begin();input.acquire(()->{
            if(!fence.current(ticket))return;
            long starts=android.os.SystemClock.uptimeMillis()+48;
            chromeMotion=android.animation.ValueAnimator.ofFloat(enter?0:1,enter?1:0);
            chromeMotion.setDuration(300);chromeMotion.setStartDelay(48);
            chromeMotion.setInterpolator(new android.view.animation.PathInterpolator(.34f,.69f,.1f,1));
            chromeMotion.addUpdateListener(a->{
                if(!fence.current(ticket))return;
                try{float value=(Float)a.getAnimatedValue();fadeWindow(panel,value);fadeWindow(quickBar.bar,value);}
                catch(RuntimeException e){fail("顶区转场失败："+e);}
            });
            Bundle b=new Bundle();b.putLong("starts",starts);chromeMotion.start();
            rpc(enter?"enterZoom":"exitZoom",b,result->{
                if(!fence.current(ticket))return;
                chromeMotion.cancel();chromeMotion=null;fadeWindow(panel,enter?1:0);fadeWindow(quickBar.bar,enter?1:0);
                if(!enter){fence.complete(ticket);done.run();return;}
                input.release(()->{if(fence.complete(ticket))done.run();});
            });
        });
    }
    ActivityManager.RunningTaskInfo info(int id) {
        synchronized (organizerLock) {
            Object appeared = ((SparseArray<?>) field(organizer, "mTasks")).get(id);
            return appeared == null ? null : (ActivityManager.RunningTaskInfo) call(appeared, "getTaskInfo");
        }
    }
    Object leash(int id) {
        Object appeared = ((SparseArray<?>) field(organizer, "mTasks")).get(id);
        Object value = appeared == null ? null : call(appeared, "getLeash"); NativeWorkspaceGuard.validSurface(value); return value;
    }
    static int number(Object value, String name) { return StepMembers.getIntField(value, name); }
    static boolean flag(Object value, String name) { return StepMembers.getBooleanField(value, name); }
    static boolean root(ActivityManager.RunningTaskInfo info) { return !Boolean.TRUE.equals(call(info, "hasParentTask")); }
    ActivityManager.RunningTaskInfo focused() {
        synchronized (organizerLock) {
            SparseArray<?> tasks = (SparseArray<?>) field(organizer, "mTasks"); ActivityManager.RunningTaskInfo found = null;
            for (int n=0; n<tasks.size(); n++) {
                ActivityManager.RunningTaskInfo item = (ActivityManager.RunningTaskInfo) call(tasks.valueAt(n), "getTaskInfo");
                if (number(item, "displayId") != 0 || !flag(item, "isFocused") || !root(item)) continue;
                if (found != null) throw new IllegalStateException("主屏焦点不唯一"); found = item;
            }
            return found;
        }
    }
    ActivityManager.RunningTaskInfo home(int user) {
        synchronized (organizerLock) {
            SparseArray<?> tasks = (SparseArray<?>) field(organizer, "mTasks"); ActivityManager.RunningTaskInfo found = null;
            for (int n=0; n<tasks.size(); n++) {
                ActivityManager.RunningTaskInfo item = (ActivityManager.RunningTaskInfo) call(tasks.valueAt(n), "getTaskInfo");
                if (number(item, "displayId") != 0 || number(item, "userId") != user || !root(item) || (Integer) call(item, "getActivityType") != 2) continue;
                if (found != null) throw new IllegalStateException("桌面任务不唯一"); found = item;
            }
            if (found == null) throw new IllegalStateException("原屏桌面不可用"); return found;
        }
    }
    void preflight() {preflight(false);}
    void preflight(boolean atOuterEdge) {
        if (!ready || closing || closed || fence.busy() || releaseMotion!=null || dragSlot>=0 && !atOuterEdge)
            throw new IllegalStateException("请等待当前操作结束");
        if (!interactive(Shell.context) || !Boolean.TRUE.equals(call(nativeTransitions, "isIdle"))) throw new IllegalStateException("系统正在切换界面，请稍后重试");
        surface();
    }
    void resumeNext(){
        if(closing || closed || retained==null)return;
        while(resumeIndex<retained.length && retained[resumeIndex]<0)resumeIndex++;
        if(resumeIndex==retained.length){
            boolean lost=false;
            for(int n=0;n<visibleSlots;n++)if(retained[n]>=0 && slots.task(n)!=retained[n])lost=true;
            if(lost && !java.util.Arrays.equals(slots.snapshot(),SideSlots.compacted(slots.snapshot()))){
                long ticket=fence.begin();
                input.acquire(()->{if(fence.current(ticket))compactCells(ticket,()->{
                    showSlots();input.release(()->{if(fence.complete(ticket))finishReadmission();});
                });});
            }else finishReadmission();
            return;
        }
        if(!Boolean.TRUE.equals(call(nativeTransitions,"isIdle")) && resumeWait++<18){main.postDelayed(this::resumeNext,80);return;}
        resumeWait=0;
        int slot=resumeIndex++,id=retained[slot];
        if(slot==ParkedWorkspace.UPPER && quickBar.upper==null){main.post(this::resumeNext);return;}
        if(slot!=ParkedWorkspace.UPPER && slot>=visibleSlots){main.post(this::resumeNext);return;}
        change(slot==ParkedWorkspace.UPPER?-1:slot,id);
    }
    void finishReadmission(){
        retained=null;quickBar.deck.restorePage(restorePage);
        if(restoreTopFace && quickBar.upper!=null && upperId>=0)upperAction("show");
        else if(restoreTopFace && quickBar.upper!=null)quickBar.upper.render(true,false);
    }
    void change(int slot){if(retained==null)change(slot,-1);}
    void change(int slot,int resumeId) {
        try {
            preflight();
            final boolean upper=slot==-1;
            final int previous=upper?-1:slots.task(slot);
            if(upper && (!topAvailable || upperId>=0))throw new IllegalStateException("顶部窗口当前不可收纳");
            if(previous<0 && !WorkspaceCapacity.canAdd(slots.count(),upperId>=0))throw new IllegalStateException("工作区最多六个任务");
            ActivityManager.RunningTaskInfo target = resumeId<0?focused():info(resumeId);
            if(resumeId>=0 && (target==null || !root(target) || number(target,"displayId")!=0)){
                main.post(this::resumeNext);return;
            }
            if (previous >= 0 && target != null && (Integer) call(target, "getActivityType") == 2) { returnSide(slot, false); return; }
            if (target == null || (Integer) call(target, "getActivityType") != 1 || (Integer) call(target, "getWindowingMode") != 1
                    || (!forceResize && !flag(target, "isResizeable")) || target.topActivity == null || PACKAGE.equals(target.topActivity.getPackageName()))
                throw new IllegalStateException("请先打开一个普通全屏应用");
            final long ticket = fence.begin();
            input.acquire(()->{
            if(!fence.current(ticket))return;
            Bundle reserve = new Bundle(); reserve.putInt("task", target.taskId); reserve.putParcelable("token", (Parcelable) field(target, "token"));
            if(resumeId>=0)reserve.putInt("retainedSlot",upper?ParkedWorkspace.UPPER:slot);
            try { synchronized (organizerLock) { reserve.putInt("layerId", (Integer) call(leash(target.taskId), "getLayerId")); } }
            catch(Throwable error){fail("收纳前任务已变化: "+error);return;}
            rpc("reserve", reserve, snapshot -> {
                if (!fence.current(ticket)) return;
                if(snapshot.getBoolean("skip")){input.release(()->{fence.complete(ticket);resumeNext();});return;}
                ActivityManager.RunningTaskInfo admitted = snapshot.getParcelable("info");
                Shell.executor.execute(() -> {
                    try {
                        if (!fence.current(ticket)) return;
                        Lease lease = new Lease(admitted, snapshot.getInt("layerId", -1));
                        leases.put(lease.id, lease); // Also retain a partially acquired lease for exit recovery.
                        lease.acquire(resumeId>=0);
                        main.post(() -> {
                            if (!fence.current(ticket)) return;
                            try {
                                Bundle b = new Bundle(); b.putInt("task", lease.id); b.putParcelable("token", (Parcelable) lease.token);
                                b.putInt("slot", slot); b.putInt("previous", previous);
                                if(resumeId>=0)b.putBoolean("readmit",true);
                                if (previous < 0 && resumeId<0) {
                                    ActivityManager.RunningTaskInfo h = home(quickBar.userId); b.putInt("home", h.taskId); b.putParcelable("homeToken", (Parcelable) field(h, "token"));
                                }
                                if(upper){
                                    b.putString("topAction",resumeId<0?"take":"resume");b.putParcelable("bounds",quickBar.upper.bounds());
                                    rpc("top",b,result->completeUpper(ticket,lease,result,resumeId<0));return;
                                }
                                b.putParcelable("surface", (Parcelable) surface()); b.putInt("width", previewWidth); b.putInt("height",geometry.rowHeight(slot,visibleSlots)); b.putInt("rowTop",geometry.rowTop(slot,visibleSlots));
                                if(resumeId<0)startFlip(b,ticket,slot,previous,lease.id);
                                else submitRoles(b,ticket,slot,previous,lease.id);
                            } catch (Throwable error) { fail("无法提交原任务交接: " + error); }
                        });
                    } catch (Throwable error) { main.post(() -> fail("原任务监听交接失败: " + error)); }
                });
            });
            });
        } catch (Throwable refusal) { log("暂未操作: " + refusal.getMessage()); if(resumeId>=0)main.post(this::resumeNext); }
    }
    void submitRoles(Bundle b,long ticket,int slot,int previous,int next){
        rpc("roles",b,result->confirmRoles(result,ticket,slot,previous,next));
    }
    boolean homeAloneBehindUpper(){
        synchronized(organizerLock){
            SparseArray<?> tasks=(SparseArray<?>)field(organizer,"mTasks");boolean home=false;
            for(int n=0;n<tasks.size();n++){
                ActivityManager.RunningTaskInfo t=(ActivityManager.RunningTaskInfo)call(tasks.valueAt(n),"getTaskInfo");
                if(t.taskId==upperId || !root(t) || number(t,"displayId")!=0 || !flag(t,"isVisible"))continue;
                if((Integer)call(t,"getActivityType")==2)home=true;
                else if((Integer)call(t,"getWindowingMode")==1)return false;
            }
            return home;
        }
    }
    void upperAction(String action){
        try{
            preflight();Lease lease=leases.get(upperId);
            if(lease==null || lease.checkedInfo()==null)throw new IllegalStateException("顶部原任务不可用");
            final long ticket=fence.begin();
            input.acquire(()->{
                if(!fence.current(ticket))return;
                Bundle b=new Bundle();b.putInt("task",lease.id);b.putParcelable("token",(Parcelable)lease.token);b.putString("topAction",action);
                rpc("top",b,result->completeUpper(ticket,lease,result,"show".equals(action)));
            });
        }catch(Throwable error){log("顶部操作未执行："+error.getMessage());}
    }
    void completeUpper(long ticket,Lease lease,Bundle result,boolean face){
        if(!fence.current(ticket))return;
        int next=result.getInt("upper",-2);
        final boolean refused=result.getBoolean("topRefused");
        if(refused)log(result.getString("message","顶窗未接管"));
        if(next!=-1 && next!=lease.id)throw new IllegalStateException("顶部任务提交不匹配");
        upperId=next;
        Shell.executor.execute(()->{
            try{
                if(!fence.current(ticket))return;
                if(next<0){ownership.releaseIfOwned(lease.id,lease.listener);leases.remove(lease.id);}
                main.post(()->{
                    if(!fence.current(ticket))return;
                    try{quickBar.upper.render(refused?face:face && next>=0);input.release(()->{if(fence.complete(ticket))resumeNext();});}
                    catch(Throwable e){fail("顶部窗口布局失败："+e);}
                });
            }catch(Throwable e){main.post(()->fail("顶部任务恢复失败："+e));}
        });
    }
    void startFlip(Bundle roles,long ticket,int slot,int previous,int next) {
        boolean targetLeft=previous<0?leftSide:!leftSide;
        WorkspaceLayout target=new WorkspaceLayout(geometry.width,geometry.height,panel.getResources().getDisplayMetrics().density,targetLeft);
        try{
            if(!panel.isHardwareAccelerated())throw new IllegalStateException("副栏不能确认绘制提交");
            flipStage=new FlipStage(input.view,geometry,slot,slots.snapshot(),visibleSlots,leftSide,quickBar.wallpaper);
        }catch(Exception|LinkageError unavailable){
            log("独立换边图层不可用，沿用原侧交换："+unavailable);submitRoles(roles,ticket,slot,previous,next);return;
        }
        Bundle args=flipStage.surfaces(new Bundle(roles));
        args.putBoolean("leftSide",leftSide);args.putInt("visible",visibleSlots);
        args.putInt("fromX",geometry.mainX);args.putInt("toX",target.mainX);args.putInt("top",geometry.top);
        rpc("flip",args,result->{
            if(!fence.current(ticket))return;
            if(!result.containsKey("targetLeft") || result.getBoolean("targetLeft")!=targetLeft)
                throw new IllegalStateException("主副换边方向未提交");
            if(previous<0){submitRoles(roles,ticket,slot,previous,next);return;}
            leftSide=targetLeft;geometry=target;
            WindowManager.LayoutParams lp=(WindowManager.LayoutParams)panel.getLayoutParams();
            lp.x=target.sideX;windows.updateViewLayout(panel,lp);
            if(quickBar!=null)quickBar.arrangeHeader();
            awaitPanel(roles,ticket,slot,previous,next,android.os.SystemClock.uptimeMillis()+800);
        });
    }
    void awaitPanel(Bundle roles,long ticket,int slot,int previous,int next,long deadline){
        if(!fence.current(ticket))return;
        panel.getViewTreeObserver().registerFrameCommitCallback(()->main.post(()->{
            if(!fence.current(ticket))return;
            int[] origin=new int[2];panel.getLocationOnScreen(origin);
            if(origin[0]==geometry.sideX && origin[1]==geometry.top)submitRoles(roles,ticket,slot,previous,next);
            else if(android.os.SystemClock.uptimeMillis()<deadline)awaitPanel(roles,ticket,slot,previous,next,deadline);
            else fail("目标副栏物理位置未确认");
        }));
        panel.invalidate();
    }
    void returnSide(int slot, boolean background) {returnSide(slot,background,false);}
    void returnSide(int slot, boolean background,boolean atOuterEdge) {
        final int previous = slots.task(slot);
        if (previous < 0) { log("副格为空"); return; }
        try {
            preflight(atOuterEdge); final long ticket = fence.begin();
            input.acquire(()->{
                if(!fence.current(ticket))return;
                Bundle b = new Bundle(); b.putInt("task", -1);
                b.putInt("slot", slot); b.putInt("previous", previous); b.putBoolean("background", background);
                rpc("roles", b, result -> confirmRoles(result, ticket, slot, previous, -1));
            });
        } catch (Throwable refusal) {
            log("暂未归还: " + refusal.getMessage());
            if(atOuterEdge)settleDrag(slot,false);
        }
    }
    void confirmRoles(Bundle result, long ticket, int slot, int previous, int next) {
        if (!result.getBoolean("committed") || result.getInt("slot", -1) != slot
                || result.getInt("side", -2) != next || result.getInt("previous", -2) != previous)
            throw new IllegalStateException("副格图层或身份尚未确认");
        settle(ticket, slot, previous, next, 0);
    }
    void settle(long ticket, int slot, int previous, int next, int attempt) {
        Shell.executor.execute(() -> {
            if (!fence.current(ticket)) return;
            try {
                boolean seen = Boolean.TRUE.equals(call(nativeTransitions,"isIdle"));
                if (previous >= 0) {
                    Lease old = leases.get(previous); ActivityManager.RunningTaskInfo info = old.checkedInfo();
                    seen &= info == null || (Integer) call(info, "getWindowingMode") == 1;
                }
                if (next >= 0) {
                    ActivityManager.RunningTaskInfo info = leases.get(next).checkedInfo();
                    seen &= info != null && (Integer) call(info, "getWindowingMode") == 6;
                }
                if (!seen) {
                    if (attempt >= 20) throw new IllegalStateException("系统任务信息未确认交接");
                    main.postDelayed(() -> settle(ticket, slot, previous, next, attempt + 1), 100); return;
                }
                slots.replace(slot, previous, next);
                if (previous >= 0) { Lease old = leases.get(previous); ownership.release(previous, old.listener); leases.remove(previous); }
                render(()->main.post(() -> {
                    if (!fence.current(ticket)) return;
                    rpc("replay", new Bundle(), replayed -> {
                        boolean compact=next<0 && dragSlot==slot;
                        clearDrag();closeFlipStage();
                        Runnable done=()->{showSlots();input.release(()->{
                            if(!fence.complete(ticket))return;
                            log("交接完成；副格=" + java.util.Arrays.toString(slots.snapshot()) + "；任务、图层与输入末帧已确认");
                            resumeNext();
                        });};
                        if(compact)compactCells(ticket,done);else done.run();
                    });
                }));
            } catch (Throwable error) { main.post(() -> fail("任务交接确认失败: " + error)); }
        });
    }
    Object surface() {
        if (controller == null || !Boolean.TRUE.equals(field(controller, "mSurfaceCreated"))) throw new IllegalStateException("预览图层尚未创建");
        Object value = field(controller, "mSurfaceControl"); NativeWorkspaceGuard.validSurface(value); return value;
    }
    void compactCells(long ticket,Runnable done){
        int[] before=slots.snapshot(),after=SideSlots.compacted(before);
        if(java.util.Arrays.equals(before,after)){done.run();return;}
        Bundle b=new Bundle();b.putIntArray("before",before);
        rpc("compact",b,result->{
            if(!fence.current(ticket))return;
            if(!java.util.Arrays.equals(after,result.getIntArray("slots")))throw new IllegalStateException("副格补位顺序不一致");
            int[] origins=new int[after.length];for(int n=0;n<after.length;n++)origins[n]=slots.index(after[n]);
            shiftProgress=0;shiftFrom=origins;slots.compact(before);
            // Empty hints are restored only after the last committed frame.
            for(int n=0;n<visibleSlots;n++)if(before[n]>=0 || after[n]>=0){cells[n].setText("");cells[n].setBackgroundColor(0);}
            android.animation.ValueAnimator move=android.animation.ValueAnimator.ofFloat(0,1);move.setDuration(240);
            move.setInterpolator(new android.view.animation.PathInterpolator(.22f,.7f,.12f,1));
            move.addUpdateListener(a->{if(!fence.current(ticket))return;shiftProgress=(Float)a.getAnimatedValue();
                Shell.executor.execute(()->{if(!fence.current(ticket))return;try{render();}catch(Throwable e){main.post(()->fail("补位图层变化："+e));}});});
            move.addListener(new android.animation.AnimatorListenerAdapter(){public void onAnimationEnd(android.animation.Animator a){
                if(!fence.current(ticket))return;shiftFrom=null;
                Shell.executor.execute(()->{try{render(()->main.post(()->{if(fence.current(ticket))done.run();}));}
                    catch(Throwable e){main.post(()->fail("补位末帧失败："+e));}});
            }});
            move.start();
        });
    }
    void render() throws Exception {render(null);}
    void render(Runnable committed) throws Exception {
        if (closing || closed) return;
        if(flipStage!=null && fence.busy() && committed==null)return;
        if(slots.count()==0){if(committed!=null)committed.run();return;}
        synchronized (organizerLock) {
            Object parent = surface();

            Object tx = NativeWorkspaceGuard.surfaceTransaction();
            try {
                for (int slot = 0; slot < visibleSlots; slot++) {
                    int id = slots.task(slot);
                    if (id < 0) continue;
                    Lease lease = leases.get(id);
                    if (lease == null) throw new IllegalStateException("副任务未持有：" + id);
                    ActivityManager.RunningTaskInfo info = lease.checkedInfo();
                    if (info == null || (Integer) call(info, "getWindowingMode") != 6) {
                        if (committed == null && info == null) continue; // Native removal confirms retirement.
                        throw new IllegalStateException("副任务离开预览模式：" + id);
                    }
                    Object child = lease.checkedLeash();
                    PreviewGeometry fit = new PreviewGeometry(logical.width(),logical.height(),previewWidth,geometry.rowHeight(slot,visibleSlots));
                    call(tx, "reparent", child, parent); call(tx, "setMatrix", child, fit.scale, 0f, 0f, fit.scale);
                    float y=geometry.rowTop(slot,visibleSlots);int[] origins=shiftFrom;
                    if(origins!=null && origins[slot]>=0)y+=(geometry.rowTop(origins[slot],visibleSlots)-y)*(1-shiftProgress);
                    call(tx, "setPosition", child, fit.x+(dragSlot==slot?dragX:0f), fit.y+y);call(tx, "setWindowCrop", child, logical);
                    call(tx, "setAlpha", child, 1f); call(tx, "show", child);
                }
                if(committed!=null)SurfaceCommit.observe(tx,Shell.executor,committed);
                call(tx, "apply");
            } finally { call(tx, "close"); }
        }
    }
    void retireSlot(int slot, int id) {
        if (closing || closed) return;
        if (fence.busy() || slots.task(slot) != id) { close("任务结束与交接重叠，归还工作区"); return; }
        if(dragSlot==slot)clearDrag();
        long ticket = fence.begin();
        input.acquire(() -> Shell.executor.execute(() -> {
            if (!fence.current(ticket)) return;
            try {
                Lease retired = leases.get(id);
                if (retired == null) throw new IllegalStateException("副格身份已变化");
                ownership.releaseIfOwned(id, retired.listener);
                leases.remove(id);
                slots.replace(slot, id, -1);
                render(() -> main.post(() -> {
                    if (!fence.current(ticket)) return;
                    compactCells(ticket,()->{showSlots();input.release(()->fence.complete(ticket));});
                }));
            } catch (Throwable error) { main.post(() -> fail("副格清理失败：" + error)); }
        }));
    }
    final class Lease {
        final int id, user, layerId; final Object token; final Object listener; final TaskIdentity identity;
        Lease(ActivityManager.RunningTaskInfo item, int layer) throws Exception {
            id = item.taskId; user = number(item, "userId"); token = field(item, "token");
            if (layer <= 0) throw new IllegalStateException("缺少任务图层身份"); layerId = layer;
            identity = new TaskIdentity(id, user, 0, token);
            Class<?> type = Class.forName("com.android.wm.shell.ShellTaskOrganizer$TaskListener", false, Shell.loader);
            listener = Proxy.newProxyInstance(Shell.loader, new Class<?>[]{type}, (proxy, method, args) -> {
                try {
                    switch (method.getName()) {
                        case "hashCode": return System.identityHashCode(proxy);
                        case "equals": return proxy == args[0];
                        case "toString": return "StepExactTask(" + id + ")";
                        case "onNewTaskListenerDetected": return true;
                        case "onTaskVanished":
                            if (args != null && args.length == 1 && args[0] instanceof ActivityManager.RunningTaskInfo)
                                vanished((ActivityManager.RunningTaskInfo) args[0]);
                            break;
                        case "onTaskAppeared": case "onTaskInfoChanged":
                            if (!closing && slots.index(id) >= 0 && !fence.busy()) Shell.executor.execute(() -> { try { render(); } catch (Throwable e) { main.post(() -> reconcile("副任务状态变化: " + e)); } }); break;
                        case "attachChildSurfaceToTask": if ((Integer) args[0] == id) call(args[1], "setParent", checkedLeash()); break;
                        case "reparentChildSurfaceToTask": if ((Integer) args[0] == id) call(args[2], "reparent", args[1], checkedLeash()); break;
                    }
                } catch (Throwable error) { main.post(() -> fail("任务监听回调未完成: " + error)); }
                if (method.getReturnType() == boolean.class) return false;
                if (method.getReturnType() == int.class) return 0;
                return null;
            });
        }
        void vanished(ActivityManager.RunningTaskInfo notice) {
            if (closing || !identity.matches(notice.taskId, number(notice, "userId"),
                    number(notice, "displayId"), field(notice, "token"))) return;
            // Native listener transfers also send onTaskVanished. Recheck after the
            // organizer has finished dispatching and the transfer can release this lease.
            main.post(() -> Shell.executor.execute(() -> {
                try {
                    synchronized (organizerLock) {
                        if (closing || leases.get(id) != this) return;
                        if (checkedInfo() != null && ownership.exact(id) == listener) return;
                    }
                    main.post(() -> {
                        if(closing)return;
                        if(upperId==id){close("顶部原任务监听结束，归还工作区");return;}
                        if(slots.index(id)<0)return;
                        Bundle b = new Bundle(); b.putInt("task", id); b.putParcelable("token", (Parcelable) token);
                        rpc("lost", b, result -> {});
                    });
                } catch (Throwable error) {
                    main.post(() -> close("副任务身份已变化，归还工作区：" + error));
                }
            }));
        }
        ActivityManager.RunningTaskInfo checkedInfo() {
            ActivityManager.RunningTaskInfo value = info(id); if (value == null) return null;
            if (!identity.matches(value.taskId, number(value, "userId"), number(value, "displayId"), field(value, "token")) || !root(value))
                throw new IllegalStateException("任务身份或父级已变化: " + id);
            return value;
        }
        void acquire(boolean readmit) throws Exception {
            synchronized (organizerLock) {
                ActivityManager.RunningTaskInfo value = checkedInfo();
                if (value == null || (Integer) call(value, "getWindowingMode") != 1 || !readmit && !flag(value,"isFocused")) throw new IllegalStateException("目标已不在原来的角色");
                ownership.acquire(id, value, checkedLeash(), listener);
            }
        }
        Object checkedLeash() {
            Object surface = leash(id);
            if ((Integer) call(surface, "getLayerId") != layerId) throw new IllegalStateException("任务图层已重建");
            return surface;
        }
    }
    void fail(String message) { log(message); close("异常退出并归还原任务"); }
    void close(String reason) {
        if (closing || closed) return;
        log(reason);
        homeExit="桌面暂挂".equals(reason);
        if(quickBar!=null){exitPage=quickBar.deck.savedPage();exitTopFace=quickBar.upper!=null && quickBar.upper.visible;}
        retainOnExit=!fence.busy() && ("手动退出工作区".equals(reason)||"桌面暂挂".equals(reason)||"息屏暂挂".equals(reason)||"配置暂挂".equals(reason));
        if(retainOnExit && "手动退出工作区".equals(reason) && ready && quickBar!=null && interactive(Shell.context)){
            zoom(false,()->startRecovery(this::requestEnd));return;
        }
        startRecovery(this::requestEnd);
    }
    void startRecovery(Runnable readyToRestore) {
        closing = true;
        if(chromeMotion!=null){chromeMotion.cancel();chromeMotion=null;}
        main.removeCallbacks(renew);retained=null;
        clearDrag();
        closeQuickBar();
        fence.close();
        // Supersede the handoff frame while the same window continues to own a held finger.
        if (input != null) input.acquire(readyToRestore);
        else readyToRestore.run();
    }
    void requestEnd() {
        if (closed) return;
        if (organizer == null) { cleanup(); return; }
        Bundle end=new Bundle();end.putBoolean("retain",retainOnExit);end.putInt("page",exitPage);end.putBoolean("topFace",exitTopFace);
        end.putBoolean("homeExit",homeExit);
        rpc("end", end, reply -> {
            if("RESTORED".equals(reply.getString("state")))cleanup();
            else main.postDelayed(()->{if(!closed)requestEnd();},2000);
        });
    }
    void cleanup() {
        if (closed || cleaning) return;
        clearDrag();closeFlipStage();
        closeQuickBar();
        cleaning = true;
        Runnable cleanup = () -> {
            try {
                // Restore native listeners before destroying their previous visual parent.
                for (Lease lease : leases.values()) ownership.releaseIfOwned(lease.id, lease.listener);
                leases.clear();
                main.post(() -> {
                    try {
                        if (taskView != null) {
                            if (controller != null && field(controller, "mTaskToken") != null) throw new IllegalStateException("容器意外持有其他任务，未释放");
                            call(taskView, "release");
                        }
                        if (panel != null) windows.removeViewImmediate(panel);
                        panel = null; taskView = null;
                        Runnable done=()->{closed=true;ready=false;StepRuntime.report(reportTo,3,"工作区已退出，原任务未删除",-1);};
                        if(input!=null)input.release(done);else done.run();
                    } catch (Throwable error) { cleaning = false; log("容器清理尚未完成: " + error);main.postDelayed(this::cleanup,1000); }
                });
            } catch (Throwable error) { main.post(() -> { cleaning = false; log("等待原生任务监听恢复: " + error); main.postDelayed(this::cleanup, 1000); }); }
        };
        if (Shell.executor == null) cleanup.run(); else Shell.executor.execute(cleanup);
    }
    void closeFlipStage(){
        FlipStage done=flipStage;flipStage=null;
        if(done!=null)try{done.close();}catch(RuntimeException e){log("换边辅助图层释放："+e);}
    }
    void closeQuickBar() {
        WorkspaceQuickBar old = quickBar;
        quickBar = null;
        if (old != null) try { old.close(); }
        catch (RuntimeException error) { log("快捷栏清理状态：" + error.getMessage()); }
    }
}
