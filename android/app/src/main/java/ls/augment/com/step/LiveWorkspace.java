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
import android.os.SystemClock;
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
    boolean topAvailable,homeBackdropAvailable,upperEnabled, pageIndicator=true, toolbarAutoCollapse=true, localLandscape, edgeHandoff, forceResize;
    int upperId=-1,upperAppId=-1,upperNavigationId=-1;
    boolean holdsUpper(int id){return id>=0 && (upperAppId==id || upperNavigationId==id);}
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
        if(!fence.busy() && interactive(Shell.context))rpc("renew",new Bundle(),r->{
            if(r.getBoolean("sleeping"))WorkspaceWake.renewalSuspended(LiveWorkspace.this);
        });
        main.postDelayed(this,25000);
    }};
    long rpcSequence;
    android.os.IBinder channel;
    String exitReason="工作区归还";
    final SideSlots slots = new SideSlots();
    volatile int visibleSlots = SideSlots.DEFAULT_COUNT;
    int previewWidth, previewHeight, layoutInset;
    boolean nativeReflow=true;
    Intent layoutRestart;
    volatile boolean ready, closing, closed;
    android.animation.ValueAnimator chromeMotion;
    boolean cleaning, checkingState;
    boolean preparingPortrait;
    Object controller, organizer, organizerLock, nativeTransitions;
    OwnershipBridge ownership;
    Rect logical;
    View taskView;
    LinearLayout panel;
    final Button[] cells = new Button[SideSlots.MAX_COUNT];
    volatile WorkspaceLayout geometry;
    volatile FlipStage flipStage;
    RegionTransition regionTransition;
    WorkspaceEntry entry;
    long slotFrameGeneration;
    int pendingNativeSlot=-1;
    android.animation.ValueAnimator releaseMotion;
    volatile int dragSlot=-1;
    volatile float dragX;
    volatile int[] shiftFrom;
    volatile float shiftProgress;
    boolean dragFrame;
    WindowManager windows;
    WorkspaceInput input;
    final PreviewFrames previewFrames=new PreviewFrames();
    long previewDrainStarted;
    boolean previewDrainReported;

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
        pageIndicator=data.getBooleanExtra("pageIndicator",true);
        toolbarAutoCollapse=data.getBooleanExtra("toolbarAutoCollapse",true);
        if(quickBar!=null)quickBar.updatePageIndicator();
        long version = data.getLongExtra("quickRevision", -1);
        if (version < pinRevision) return;
        java.util.ArrayList<String> keys = data.getStringArrayListExtra("quickPins");
        if (keys == null) return;
        pinned = keys; pinRevision = version;
        if (quickBar != null) {quickBar.updateOrder();quickBar.loadTopWall();}
    }
    static boolean running() { return current != null && !current.closed; }
    static void open(ResultReceiver report, Intent options) {
        if (!StepRuntime.enabled || running() || Wm.active) { StepRuntime.report(report, 13, "工作台已关闭或正在运行", -1); return; }
        LiveWorkspace workspace = new LiveWorkspace(report, options); current = workspace; workspace.prepare();
    }
    static void stop(String reason) { if (running()) {current.layoutRestart=null;current.close(reason);} }
    void log(String message) { StepRuntime.report(reportTo, 10, message, -1); }
    void prepare(){
        Rect bounds=Shell.context.getSystemService(WindowManager.class).getCurrentWindowMetrics().getBounds();
        if(bounds.width()<=bounds.height()){create();return;}
        preparingPortrait=true;
        Bundle request=new Bundle();request.putInt("user",(Integer)call(quickUser,"getIdentifier"));
        rpc("portraitEntry",request,ignored->awaitPortrait(SystemClock.uptimeMillis()+3500,0));
    }
    void awaitPortrait(long deadline,int stable){
        if(closed || closing || current!=this)return;
        Rect bounds=Shell.context.getSystemService(WindowManager.class).getCurrentWindowMetrics().getBounds();
        int count=bounds.width()<bounds.height()?stable+1:0;
        if(count>=3){preparingPortrait=false;create();return;}
        if(SystemClock.uptimeMillis()>=deadline){preparingPortrait=false;fail("原屏未完成工作区方向准备");return;}
        main.postDelayed(()->awaitPortrait(deadline,count),100);
    }
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
            log(message);if(!closed){exitReason=message;closing=true;cleaning=false;fence.close();requestEnd();}
        });
        Rect screen = windows.getCurrentWindowMetrics().getBounds();
        android.view.WindowInsets insets=windows.getCurrentWindowMetrics().getWindowInsets();
        int physicalInset=insets.getInsetsIgnoringVisibility(android.view.WindowInsets.Type.statusBars()
                |android.view.WindowInsets.Type.displayCutout()).top;
        // The device/menu entry stays visible for every count. Reserve the real
        // cutout bounds before placing controls, including central/off-center holes.
        layoutInset=0;
        if(insets.getDisplayCutout()!=null)for(Rect hole:insets.getDisplayCutout().getBoundingRects())
            if(hole.top<physicalInset)layoutInset=Math.max(layoutInset,hole.bottom);
        geometry = WorkspaceLayout.create(screen.width(),screen.height(),themed.getResources().getDisplayMetrics().density,leftSide,visibleSlots,layoutInset,nativeReflow);
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
            boolean empty = slots.task(slot) < 0 || slot==pendingNativeSlot;
            StepMaterial.slot(cell,empty);
            cell.setContentDescription((empty ? "收纳到副格 " : "交换副格 ") + (slot + 1));
        }
        if (quickBar != null) quickBar.updateCapacity();
    }
    void resizeSlots(int count,boolean upper) {
        try {
            preflight();
            if(count==visibleSlots && upper==upperEnabled)return;
            if(!WorkspaceCapacity.fitsLayout(count,upper) || upper && !topAvailable)return;
            if(retained!=null || !slots.fits(count) || !upper && (upperAppId>=0 || upperNavigationId>=0)){quickBar.logUnavailable("请先归还所选布局容纳不了的副任务");return;}
            quickBar.validateLayout(count);
            // A geometry change affects native main/input/IME and an optional
            // upper task too. Return the exact scene before preparing the new
            // layout, rather than exposing mixed old/new dimensions in-place.
            Bundle data=new Bundle();data.putInt("sideCount",count);data.putBoolean("upperEnabled",upper);
            Bundle result=Shell.context.getContentResolver().call(WorkspacePrefsProvider.URI,"sideCount",null,data);
            if(result==null || !result.getBoolean("saved") || result.getInt("sideCount",-1)!=count
                    || result.getBoolean("upperEnabled")!=upper)throw new IllegalStateException("工作区布局未保存");
            layoutRestart=new Intent().putExtras(result).putExtra("normalEntry",renewable).putExtra("leftSide",leftSide);
            StepRuntime.diagnostic("LAYOUT","reprepare;from="+visibleSlots+";to="+count+";upper="+upper);
            close("配置暂挂");
        } catch (Throwable error) {
            if(quickBar!=null)quickBar.note(error);else log("暂未调整副格：" + error.getMessage());
        }
    }
    void beginNative() {
        if (ready || entry!=null || closing || closed) return;
        try {
            entry=new WorkspaceEntry((android.view.SurfaceControl)surface());
            final long deadline=SystemClock.uptimeMillis()+WorkspaceEntry.TIMEOUT_MS;
            input.holdEntry(deadline);
            main.postAtTime(()->{if(!closing && !closed && !entry.complete)fail("整组工作区准备超时");},deadline);
            Bundle b = new Bundle();
            b.putBoolean("leftSide", leftSide);
            b.putBoolean("renewable",renewable);
            b.putBoolean("transitionStart",WorkspaceFinish.startAvailable);
            b.putBinder("gameGestureGate",GameGestureGate.host(this));
            b.putBoolean("nativeGestureCoordinates",WorkspaceNativeGesture.available);
            int user=android.os.Process.myUserHandle().equals(quickUser)?(Integer)call(quickUser,"getIdentifier"):-1;
            b.putInt("user",user);b.putInt("sideCount",visibleSlots);b.putInt("layoutInset",layoutInset);b.putBoolean("upperEnabled",upperEnabled);
            try{
                ActivityManager.RunningTaskInfo launcher=home(user);
                b.putInt("home",launcher.taskId);b.putParcelable("homeToken",(Parcelable)field(launcher,"token"));
            }catch(RuntimeException absent){log("桌面任务暂不可用："+absent);}
            b.putParcelable("events", remote(new ResultReceiver(main) {
                @Override protected void onReceiveResult(int code, Bundle data) {
                    if (closed||!session.equals(data.getString("session"))) return;
                    log(data.getString("message", "系统服务事件"));
                    if(code==94){retireUpper(data);return;}
                    if(code==95){
                        if(closing || quickBar==null || quickBar.upper==null || !fence.busy())return;
                        ResultReceiver reply=data.getParcelable("ready");if(reply==null)return;
                        quickBar.upper.render(true,true);
                        awaitUpperCaption(reply,android.os.SystemClock.uptimeMillis()+800);return;
                    }
                    if(code==96){WorkspaceRoutes.hostRoute(LiveWorkspace.this,data);return;}
                    if (code == 97) retireSlot(data.getInt("slot"), data.getInt("removed"));
                    if (code == 98 && !closing) {
                        if("息屏暂挂".equals(data.getString("recoveryReason"))){
                            WorkspaceWake.remember(LiveWorkspace.this);exitReason="息屏暂挂";
                        }
                        startRecovery(() -> {});
                    }
                    if (code == 99) { closing = true; fence.close(); cleanup(); }
                }
            }));
            rpc("begin", b, result -> { logical = result.getParcelable("logical");ready=true;topAvailable=result.getBoolean("topAvailable");
                if(result.getInt("layoutCount",-1)!=visibleSlots || result.getInt("layoutInset",-1)!=layoutInset)
                    throw new IllegalStateException("系统与界面的工作区布局不一致");
                homeBackdropAvailable=result.getBoolean("homeBackdropAvailable");
                leftSide=result.getBoolean("left",leftSide);
                nativeReflow=result.getBoolean("mainReflow");
                geometry=WorkspaceLayout.create(logical.width(),logical.height(),Shell.context.getResources().getDisplayMetrics().density,leftSide,visibleSlots,layoutInset,nativeReflow);
                previewWidth=geometry.sideWidth;previewHeight=geometry.railHeight;
                call(taskView,"setObscuredTouchRect",new Rect(0,0,previewWidth,previewHeight));
                WindowManager.LayoutParams bounds=(WindowManager.LayoutParams)panel.getLayoutParams();bounds.x=geometry.sideX;bounds.y=geometry.top;bounds.width=geometry.sideWidth;bounds.height=geometry.railHeight;windows.updateViewLayout(panel,bounds);
                restorePage=result.getInt("page",0);restoreTopFace=result.getBoolean("topFace");
                retained=result.getIntArray("retained");
                if(retained==null || retained.length!=ParkedWorkspace.COUNT)throw new IllegalStateException("原格恢复集合缺失");
                forceResize=result.getBoolean("forceResize");localLandscape=result.getBoolean("localLandscape");edgeHandoff=result.getBoolean("edgeHandoff");
                try {
                    quickBar = new WorkspaceQuickBar(this);
                    quickBar.open();
                } catch (RuntimeException | LinkageError unavailable) {
                    closeQuickBar();
                    log("工作区顶区不可用：" + unavailable.getMessage()); close("归还原任务"); return;
                }
                resumeNext(); });
        } catch (Throwable error) { fail("原任务工作区初始化失败: " + error); }
    }
    void rpc(String action, Bundle args, Consumer<Bundle> success) {
        if (closed || (closing && !"end".equals(action)&&!"state".equals(action))) return;
        final long request = ++rpcSequence;
        final long sent=SystemClock.uptimeMillis();
        final boolean[] answered = {false};
        ResultReceiver callback = new ResultReceiver(main) {
            @Override protected void onReceiveResult(int code, Bundle data) {
                if (answered[0] || closed) return;
                answered[0] = true;
                diagnostic("RPC","reply;action="+action+";request="+request+";elapsedMs="+(SystemClock.uptimeMillis()-sent));
                if("begin".equals(action) && code==0)channel=data.getBinder("channel");
                if (!session.equals(data.getString("session"))) { fail("系统服务会话不匹配"); return; }
                if(closing&&!"end".equals(action)&&!"state".equals(action))return;
                if (code != 0) {
                    if("renew".equals(action) && !interactive(Shell.context) && !closing){
                        WorkspaceWake.renewalSuspended(LiveWorkspace.this);return;
                    }
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
        args.putLong("sentAt",sent);
        android.app.BroadcastOptions delivery=android.app.BroadcastOptions.makeBasic().setShareIdentityEnabled(true);
        Intent intent=new Intent(NativeWorkspaceGuard.ACTION).setPackage("android").addFlags(Intent.FLAG_RECEIVER_FOREGROUND).putExtras(args);
        try{
            if(channel!=null)WorkspaceChannel.command(channel,owner,intent);
            else Shell.context.sendBroadcast(intent,null,delivery.toBundle());
        }catch(android.os.RemoteException unavailable){fail("系统服务交接通道中断："+unavailable);return;}
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
        try {
            int promoted=-1;
            for(int slot=0;slot<visibleSlots;slot++){
                Lease lease=leases.get(slots.task(slot));
                ActivityManager.RunningTaskInfo info=lease==null?null:lease.checkedInfo();
                if(info!=null && (Integer)call(info,"getWindowingMode")==1 && flag(info,"isVisible")){
                    if(promoted>=0)throw new IllegalStateException("多个副任务同时改变角色");
                    promoted=slot;
                }
            }
            if(promoted>=0){pendingNativeSlot=promoted;showSlots();awaitPromotion(promoted);return;}
        }catch(RuntimeException mismatch){detail+="；"+mismatch.getMessage();}
        final String reason=detail;
        checkingState=true;
        rpc("state",new Bundle(),state->{
            checkingState=false;
            if(!closing)close("副任务状态由系统改变，归还工作区："+reason);
        });
    }
    void awaitPromotion(int slot){
        final int id=slots.task(slot);final Lease lease=leases.get(id);
        if(lease==null)return;
        checkingState=true;
        final long began=android.os.SystemClock.uptimeMillis();
        Shell.executor.execute(new Runnable(){
            @Override public void run(){
                try{
                    if(closing || closed || leases.get(id)!=lease){main.post(()->checkingState=false);return;}
                    // Shell owns the live leash until its finish transaction lands.
                    // Reparenting it earlier interrupts the native expand animation.
                    boolean idle=Boolean.TRUE.equals(call(nativeTransitions,"isIdle"));
                    if(!idle){
                        if(android.os.SystemClock.uptimeMillis()-began>=2500){
                            main.post(()->{checkingState=false;if(!closing)close("原厂应用转场超时，归还工作区");});return;
                        }
                        main.postDelayed(()->Shell.executor.execute(this),32);return;
                    }
                    main.post(()->{
                        checkingState=false;
                        if(closing || closed || fence.busy() || slots.task(slot)!=id || leases.get(id)!=lease)return;
                        try{
                            if(!Boolean.TRUE.equals(call(nativeTransitions,"isIdle"))){
                                checkingState=true;main.postDelayed(()->Shell.executor.execute(this),32);return;
                            }
                            ActivityManager.RunningTaskInfo now=lease.checkedInfo();
                            if(now!=null && (Integer)call(now,"getWindowingMode")==1 && flag(now,"isVisible")){
                                StepRuntime.diagnostic("PROMOTION","native_transition_settled;task="+id+";waitMs="+(android.os.SystemClock.uptimeMillis()-began));
                                adoptPromotion(slot);
                            }else if(now!=null && (Integer)call(now,"getWindowingMode")==6){
                                // A cancelled native launch kept the original side task.
                                pendingNativeSlot=-1;showSlots();
                                Shell.executor.execute(()->{try{render();}catch(Throwable error){main.post(()->reconcile("原厂取消切换后复核："+error));}});
                            }else reconcile("原厂切换后复核任务角色");
                        }catch(Throwable changed){close("原厂切换后任务身份变化："+changed);}
                    });
                }catch(Throwable error){main.post(()->{checkingState=false;if(!closing)close("原厂切换状态不可核验："+error);});}
            }
        });
    }
    void adoptPromotion(int slot){
        final int id=slots.task(slot);final Lease lease=leases.get(id);
        if(lease==null)throw new IllegalStateException("原副任务监听已变化");
        StepRuntime.diagnostic("PROMOTION","native_fullscreen_observed;task="+id+";slot="+slot);
        final long ticket=fence.begin();
        input.acquire(()->{
            Bundle b=new Bundle();b.putInt("task",id);b.putInt("slot",slot);b.putParcelable("token",(Parcelable)lease.token);
            rpc("adoptPromotion",b,result->{
                if(!fence.current(ticket))return;
                if(!result.getBoolean("committed") || result.getInt("previous",-1)!=id || result.getInt("slot",-1)!=slot || result.getInt("side",-2)!=-1)
                    throw new IllegalStateException("原任务回主区尚未确认");
                Shell.executor.execute(()->{
                    try{
                        if(!fence.current(ticket))return;
                        ownership.releaseIfOwned(id,lease.listener);leases.remove(id);slots.replace(slot,id,-1);
                        render(()->main.post(()->finishHandoff(ticket,"原厂副任务已回主区："+id)));
                    }catch(Throwable failure){main.post(()->fail("原任务回主区收尾失败："+failure));}
                });
            });
        });
    }
    LiveWorkspace thisWorkspace(){return this;}
    void awaitUpperCaption(ResultReceiver reply,long deadline){
        if(closing || quickBar==null || !fence.busy())return;
        quickBar.bar.getViewTreeObserver().registerFrameCommitCallback(()->main.post(()->{
            if(closing || quickBar==null || !fence.busy())return;
            int[] at=new int[2];quickBar.bar.getLocationOnScreen(at);
            if(at[0]==0 && at[1]==0
                    && quickBar.bar.getHeight()==1)reply.send(1,new Bundle());
            else if(android.os.SystemClock.uptimeMillis()<deadline)awaitUpperCaption(reply,deadline);
        }));quickBar.bar.invalidate();
    }
    void fadeWindow(View view,float alpha){
        if(view==null || !view.isAttachedToWindow())return;
        WindowManager.LayoutParams lp=(WindowManager.LayoutParams)view.getLayoutParams();lp.alpha=alpha;windows.updateViewLayout(view,lp);
        if(quickBar!=null && view==quickBar.bar && quickBar.sideToolbar!=null)quickBar.sideToolbar.setChromeAlpha(alpha);
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
            Bundle b=new Bundle();b.putLong("starts",starts);
            if(enter){b.putParcelable("entryStage",entry.surface);b.putIntArray("entrySlots",slots.snapshot());}
            chromeMotion.start();
            rpc(enter?"enterZoom":"exitZoom",b,result->{
                if(!fence.current(ticket))return;
                chromeMotion.cancel();chromeMotion=null;fadeWindow(panel,enter?1:0);fadeWindow(quickBar.bar,enter?1:0);
                if(!enter){fence.complete(ticket);done.run();return;}
                releaseStepInput(()->{if(fence.complete(ticket))done.run();});
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
    ActivityManager.RunningTaskInfo focused() {return WorkspaceMainFocus.read(this);}
    ActivityManager.RunningTaskInfo cachedFocus() {
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
    void preflight() {preflight(false,false);}
    void preflight(boolean atOuterEdge) {preflight(atOuterEdge,false);}
    void preflight(boolean atOuterEdge,boolean preparing) {
        if(!preparing && entry!=null && !entry.complete)throw new IllegalStateException("请等待整组工作区准备完成");
        if (!ready || closing || closed || checkingState || fence.busy() || releaseMotion!=null || dragSlot>=0 && !atOuterEdge)
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
                    showSlots();releaseStepInput(()->{if(fence.complete(ticket))finishReadmission();});
                });});
            }else finishReadmission();
            return;
        }
        if(!Boolean.TRUE.equals(call(nativeTransitions,"isIdle")) && resumeWait++<18){main.postDelayed(this::resumeNext,80);return;}
        resumeWait=0;
        int slot=resumeIndex++,id=retained[slot];
        if(slot>=ParkedWorkspace.UPPER && quickBar.upper==null){main.post(this::resumeNext);return;}
        if(slot<ParkedWorkspace.UPPER && slot>=visibleSlots){main.post(this::resumeNext);return;}
        change(slot>=ParkedWorkspace.UPPER?-1:slot,id,slot==ParkedWorkspace.NAVIGATION);
    }
    void finishReadmission(){
        if(closing || closed || entry==null || !entry.preparing)return;
        entry.preparing=false;retained=null;quickBar.deck.restorePage(restorePage);
        if(restoreTopFace && quickBar.upper!=null && upperId<0)quickBar.upper.render(false);
        Shell.executor.execute(()->{
            try{render(()->main.post(()->{
                if(closing || closed)return;
                // All real side windows are drawn, still behind the shared alpha.
                // Paint final cells and the restored deck before starting entry.
                entry.frames(main,()->{
                    if(closing || closed)return;
                    zoom(true,()->{
                        int restoredTop=restorePage==WorkspaceDeck.NAVIGATION?upperNavigationId:upperAppId;
                        if(restoreTopFace && quickBar.upper!=null && restoredTop>=0)upperActionFor(restoredTop,"show",this::finishEntry);
                        else finishEntry();
                    });
                },this::fail,panel,quickBar.bar);
            }));}catch(Throwable error){main.post(()->fail("整组副卡准备失败："+error));}
        });
    }
    void releaseStepInput(Runnable done){
        // Per-task fences still serialize recovery, but input is held until the
        // entire entry (including the final native/view frames) is acknowledged.
        if(entry!=null && !entry.complete && !closing && !closed)done.run();
        else input.release(done);
    }
    void finishEntry(){
        if(closing || closed || entry==null || entry.finishing || entry.complete)return;
        entry.finishing=true;
        final long ticket=fence.begin();
        entry.frames(main,()->{
            if(!fence.current(ticket))return;
            int[] at=new int[2];panel.getLocationOnScreen(at);
            if(at[0]!=geometry.sideX || at[1]!=geometry.top || panel.getWidth()!=previewWidth){fail("整组副栏最终位置未确认");return;}
            Bundle b=new Bundle();b.putIntArray("entrySlots",slots.snapshot());
            rpc("entryReady",b,result->{
                if(!fence.current(ticket))return;
                if(!result.getBoolean("entryReady") || !java.util.Arrays.equals(slots.snapshot(),result.getIntArray("slots")))
                    throw new IllegalStateException("整组工作区最终结果不一致");
                input.endEntryHold();
                input.release(()->{
                    if(!fence.complete(ticket) || closing || closed)return;
                    entry.complete=true;
                    if(renewable)CornerEntry.completedAt=android.os.SystemClock.elapsedRealtime();
                    StepRuntime.report(reportTo,11,"工作区已就绪；整组任务、图层与界面已确认；任务交接路径="+ownership.path()
                            +(renewable?"；角部工作区，宿主续期。":"；90秒自动退出。"),-1);
                    if(renewable)main.postDelayed(renew,25000);
                    publishViewState();
                });
            });
        },this::fail,panel,quickBar.bar);
    }
    void change(int slot){if(retained==null)change(slot,-1);}
    void change(int slot,int resumeId) {
        change(slot,resumeId,false);
    }
    void change(int slot,int resumeId,boolean navigation) {
        change(slot,resumeId,navigation,-1);
    }
    int topExchangeId(){
        return quickBar!=null && quickBar.upper!=null && quickBar.upper.visible?upperId:upperAppId;
    }
    boolean canSwapMainTop(){
        int id=topExchangeId();
        if(id<0 || id==upperNavigationId && upperAppId>=0)return false;
        try{
            ActivityManager.RunningTaskInfo main=focused();
            return main!=null && !holdsUpper(main.taskId) && (Integer)call(main,"getActivityType")==1
                    && (Integer)call(main,"getWindowingMode")==1;
        }catch(RuntimeException unavailable){return false;}
    }
    void swapMainTop(){
        if(!canSwapMainTop()){quickBar.logUnavailable("当前主区与顶区没有可交换的应用");return;}
        change(-1,-1,false,topExchangeId());
    }
    void change(int slot,int resumeId,boolean navigation,int exchangeId) {
        diagnostic("ACTION","change;slot="+slot+";resume="+resumeId+";busy="+fence.busy()+";ready="+ready+";closing="+closing);
        try {
            preflight(false,resumeId>=0);
            final boolean upper=slot==-1;
            final int previous=upper?-1:slots.task(slot);
            final int outgoing=exchangeId>=0?exchangeId:upperAppId;
            final Lease exchanged=upper && !navigation && resumeId<0 && outgoing>=0?leases.get(outgoing):null;
            if(exchangeId>=0 && (!holdsUpper(exchangeId) || exchangeId==upperNavigationId && upperAppId>=0))
                throw new IllegalStateException("顶部交换目标已变化");
            if(upper && (!topAvailable || (navigation?upperNavigationId:upperAppId)>=0 && exchanged==null))throw new IllegalStateException("顶部窗口当前不可收纳");
            if(exchanged!=null && exchanged.checkedInfo()==null)throw new IllegalStateException("顶部原任务不可用");
            if(previous<0 && !WorkspaceCapacity.canAdd(slots.count(),!upper && (upperAppId>=0 || upperNavigationId>=0)))throw new IllegalStateException("侧边最多五个副区，顶部页面独立保留");
            ActivityManager.RunningTaskInfo target = resumeId<0?focused():info(resumeId);
            if(resumeId>=0 && (target==null || !root(target) || number(target,"displayId")!=0)){
                main.post(this::resumeNext);return;
            }
            if (previous >= 0 && target != null && ((Integer) call(target, "getActivityType") == 2
                    || target.taskId==upperId && homeAloneBehindUpper())) { returnSide(slot, false); return; }
            if (target == null || (Integer) call(target, "getActivityType") != 1 || (Integer) call(target, "getWindowingMode") != 1
                    || (!forceResize && !flag(target, "isResizeable")) || target.topActivity == null)
                throw new IllegalStateException("请先打开一个普通全屏应用");
            final long ticket = fence.begin();
            input.acquire(()->{
            if(!fence.current(ticket))return;
            Bundle reserve = new Bundle(); reserve.putInt("task", target.taskId); reserve.putParcelable("token", (Parcelable) field(target, "token"));
            if(resumeId>=0)reserve.putInt("retainedSlot",upper?(navigation?ParkedWorkspace.NAVIGATION:ParkedWorkspace.UPPER):slot);
            try { synchronized (organizerLock) { reserve.putInt("layerId", (Integer) call(leash(target.taskId), "getLayerId")); } }
            catch(Throwable error){fail("收纳前任务已变化: "+error);return;}
            rpc("reserve", reserve, snapshot -> {
                if (!fence.current(ticket)) return;
                if(snapshot.getBoolean("skip")){releaseStepInput(()->{fence.complete(ticket);resumeNext();});return;}
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
                                if (previous < 0 && resumeId<0 && exchanged==null) {
                                    ActivityManager.RunningTaskInfo h = home(quickBar.userId); b.putInt("home", h.taskId); b.putParcelable("homeToken", (Parcelable) field(h, "token"));
                                }
                                if(upper){
                                    b.putString("topAction",exchanged!=null?"swap":resumeId<0?"take":"resume");b.putParcelable("bounds",quickBar.upper.bounds());
                                    if(exchanged!=null){b.putInt("previous",exchanged.id);b.putParcelable("previousToken",(Parcelable)exchanged.token);}
                                    b.putBoolean("navigation",navigation);
                                    Runnable submit=()->{
                                        b.putBoolean("frameBridge",regionTransition!=null);
                                        rpc("top",b,result->completeUpper(ticket,lease,result,resumeId<0,null,exchanged));
                                    };
                                    if(resumeId<0)RegionTransition.prepare(this,ticket,lease,exchanged,false,submit);
                                    else submit.run();
                                    return;
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
        } catch (Throwable refusal) {
            String message="暂未操作: " + refusal.getMessage();
            diagnostic("ACTION_REFUSED","change;slot="+slot+";reason="+refusal);
            if(resumeId<0 && quickBar!=null)quickBar.logUnavailable(message);else log(message);
            if(resumeId>=0)main.post(this::resumeNext);
        }
    }
    void submitRoles(Bundle b,long ticket,int slot,int previous,int next){
        rpc("roles",b,result->confirmRoles(result,ticket,slot,previous,next));
    }
    boolean homeAloneBehindUpper(){
        synchronized(organizerLock){
            SparseArray<?> tasks=(SparseArray<?>)field(organizer,"mTasks");boolean home=false;
            for(int n=0;n<tasks.size();n++){
                ActivityManager.RunningTaskInfo t=(ActivityManager.RunningTaskInfo)call(tasks.valueAt(n),"getTaskInfo");
                if(holdsUpper(t.taskId) || !root(t) || number(t,"displayId")!=0 || !flag(t,"isVisible"))continue;
                if((Integer)call(t,"getActivityType")==2)home=true;
                else if((Integer)call(t,"getWindowingMode")==1)return false;
            }
            return home;
        }
    }
    void upperAction(String action){upperAction(action,null);}
    void upperAction(String action,Runnable completed){
        upperActionFor(upperId,action,completed);
    }
    void upperActionFor(int id,String action,Runnable completed){
        diagnostic("ACTION","upper;action="+action+";task="+upperId+";busy="+fence.busy()+";closing="+closing);
        try{
            preflight(false,completed!=null);Lease lease=leases.get(id);
            if(lease==null || lease.checkedInfo()==null)throw new IllegalStateException("顶部原任务不可用");
            final long ticket=fence.begin();
            // Draw the resting page before the original task changes orientation
            // and returns to main. Releasing an inactive task preserves its peer.
            if("dismiss".equals(action) && id==upperId && quickBar.upper.visible)quickBar.upper.render(false);
            input.acquire(()->{
                if(!fence.current(ticket))return;
                Runnable submit=()->{
                    if(!fence.current(ticket))return;
                    Bundle b=new Bundle();b.putInt("task",lease.id);b.putParcelable("token",(Parcelable)lease.token);b.putString("topAction",action);
                    b.putBoolean("frameBridge",regionTransition!=null);
                    if("release".equals(action) && id==upperId && quickBar.upper.visible)quickBar.upper.render(false);
                    rpc("top",b,result->completeUpper(ticket,lease,result,"show".equals(action),completed));
                };
                if("park".equals(action))quickBar.upper.coverBeforePark(submit);
                else if("release".equals(action))RegionTransition.prepare(this,ticket,lease,null,true,submit);
                else submit.run();
            });
        }catch(Throwable error){diagnostic("ACTION_REFUSED","upper;action="+action+";reason="+error);if(completed!=null)fail("顶部恢复未完成："+error);else log("顶部操作未执行："+error.getMessage());}
    }
    void completeUpper(long ticket,Lease lease,Bundle result,boolean face){
        completeUpper(ticket,lease,result,face,null);
    }
    void completeUpper(long ticket,Lease lease,Bundle result,boolean face,Runnable completed){
        completeUpper(ticket,lease,result,face,completed,null);
    }
    void completeUpper(long ticket,Lease lease,Bundle result,boolean face,Runnable completed,Lease exchanged){
        if(!fence.current(ticket))return;
        int next=result.getInt("upper",-2);
        if(exchanged!=null && (next!=lease.id || result.getInt("released",-1)!=exchanged.id || leases.get(exchanged.id)!=exchanged))
            throw new IllegalStateException("顶部交换任务提交不匹配");
        final boolean refused=result.getBoolean("topRefused");
        if(refused)log(result.getString("message","顶窗未接管"));
        boolean released=result.getInt("released",-1)==lease.id;
        if(next!=-1 && next!=lease.id && !(released && holdsUpper(next)))throw new IllegalStateException("顶部任务提交不匹配");
        upperId=next;
        upperAppId=result.getInt("upperApp",next);upperNavigationId=result.getInt("upperNavigation",-1);
        Shell.executor.execute(()->{
            try{
                if(!fence.current(ticket))return;
                if(next<0 || result.getInt("released",-1)==lease.id){ownership.releaseIfOwned(lease.id,lease.listener);leases.remove(lease.id);}
                if(exchanged!=null){ownership.releaseIfOwned(exchanged.id,exchanged.listener);leases.remove(exchanged.id);}
                main.post(()->{
                    if(!fence.current(ticket))return;
                    try{quickBar.configureUpper();quickBar.upper.render(refused?face:(released?next>=0 && !result.getBoolean("hidden"):face && next>=0));finishRegionTransition(()->releaseStepInput(()->{
                        if(fence.complete(ticket)){
                            if(quickBar.sideToolbar!=null)quickBar.sideToolbar.refreshTools();
                            if(completed!=null)completed.run();else resumeNext();
                        }
                    }));}
                    catch(Throwable e){fail("顶部窗口布局失败："+e);}
                });
            }catch(Throwable e){main.post(()->fail("顶部任务恢复失败："+e));}
        });
    }
    void startFlip(Bundle roles,long ticket,int slot,int previous,int next) {
        if(previous<0 && next>=0 && !homeBackdropAvailable){
            log("桌面绘制接口不可用，沿用原生任务交接");submitRoles(roles,ticket,slot,previous,next);return;
        }
        boolean targetLeft=WorkspaceMotion.targetLeft(leftSide,next,previous);
        WorkspaceLayout target=WorkspaceLayout.create(geometry.width,geometry.height,panel.getResources().getDisplayMetrics().density,targetLeft,visibleSlots,layoutInset,nativeReflow);
        try{
            if(!panel.isHardwareAccelerated())throw new IllegalStateException("副栏不能确认绘制提交");
            flipStage=new FlipStage(input.view,geometry,slot,slots.snapshot(),visibleSlots,leftSide,quickBar.wallpaper,next<0);
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
            if(result.getBoolean("flipLanded")){confirmRoles(result,ticket,slot,previous,next);return;}
            if(targetLeft==leftSide){submitRoles(roles,ticket,slot,previous,next);return;}
            leftSide=targetLeft;geometry=target;
            WindowManager.LayoutParams lp=(WindowManager.LayoutParams)panel.getLayoutParams();
            lp.x=target.sideX;windows.updateViewLayout(panel,lp);
            if(quickBar!=null)quickBar.arrangeHeader();
            awaitPanel(roles,ticket,slot,previous,next,android.os.SystemClock.uptimeMillis()+800);
        });
    }
    void finishRegionTransition(Runnable done){
        RegionTransition bridge=regionTransition;
        if(bridge==null)done.run();else bridge.landed(done);
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
    void positionMain(boolean right){
        try{
            preflight();
            if(retained!=null || quickBar==null || quickBar.picker!=null || quickBar.tools.clipboard!=null)
                throw new IllegalStateException("请先关闭当前选择窗口");
            if(leftSide==right)return;
            final long ticket=fence.begin();
            final WorkspaceLayout target=WorkspaceLayout.create(geometry.width,geometry.height,panel.getResources().getDisplayMetrics().density,right,visibleSlots,layoutInset,nativeReflow);
            final Bundle request=new Bundle();request.putBoolean("fromLeft",leftSide);request.putBoolean("leftSide",right);
            request.putIntArray("slots",slots.snapshot());
            input.acquire(()->{
                if(!fence.current(ticket))return;
                WindowManager.LayoutParams lp=(WindowManager.LayoutParams)panel.getLayoutParams();
                lp.x=target.sideX;windows.updateViewLayout(panel,lp);
                awaitPositionPanel(target,request,ticket,android.os.SystemClock.uptimeMillis()+800);
            });
        }catch(Throwable refusal){
            if(quickBar!=null)quickBar.logUnavailable("暂未移动："+refusal.getMessage());
        }
    }
    void awaitPositionPanel(WorkspaceLayout target,Bundle request,long ticket,long deadline){
        if(!fence.current(ticket))return;
        panel.getViewTreeObserver().registerFrameCommitCallback(()->main.post(()->{
            if(!fence.current(ticket))return;
            int[] origin=new int[2];panel.getLocationOnScreen(origin);
            if(origin[0]!=target.sideX || origin[1]!=target.top){
                if(android.os.SystemClock.uptimeMillis()<deadline)awaitPositionPanel(target,request,ticket,deadline);
                else fail("主工作区换边的副栏位置未确认");
                return;
            }
            rpc("position",request,result->{
                if(!fence.current(ticket))return;
                if(!result.getBoolean("committed") || result.getBoolean("left")!=request.getBoolean("leftSide")
                        || !java.util.Arrays.equals(slots.snapshot(),result.getIntArray("slots")))
                    throw new IllegalStateException("主工作区换边结果未确认");
                leftSide=result.getBoolean("left");geometry=target;quickBar.arrangeHeader();
                Shell.executor.execute(()->{
                    try{render(()->main.post(()->{
                        if(!fence.current(ticket))return;
                        input.release(()->{if(fence.complete(ticket)){
                            if(quickBar.sideToolbar!=null)quickBar.sideToolbar.refreshTools();
                            publishViewState();
                        }});
                    }));}catch(Throwable error){main.post(()->fail("换边副任务末帧未确认："+error));}
                });
            });
        }));
        panel.invalidate();
    }
    void returnSide(int slot, boolean background,boolean atOuterEdge) {
        final int previous = slots.task(slot);
        if (previous < 0) { log("副格为空"); return; }
        try {
            preflight(atOuterEdge); final long ticket = fence.begin();
            input.acquire(()->{
                if(!fence.current(ticket))return;
                Bundle b = new Bundle(); b.putInt("task", -1);
                b.putInt("slot", slot); b.putInt("previous", previous); b.putBoolean("background", background);
                if(!background && !atOuterEdge){
                    b.putParcelable("surface",(Parcelable)surface());b.putInt("width",previewWidth);
                    b.putInt("height",geometry.rowHeight(slot,visibleSlots));b.putInt("rowTop",geometry.rowTop(slot,visibleSlots));
                    startFlip(b,ticket,slot,previous,-1);
                }else submitRoles(b,ticket,slot,previous,-1);
            });
        } catch (Throwable refusal) {
            log("暂未归还: " + refusal.getMessage());
            if(atOuterEdge)settleDrag(slot,false);
        }
    }
    void confirmRoles(Bundle result, long ticket, int slot, int previous, int next) {
        if(result.getBoolean("readmitSkipped") && retained!=null && previous==-1 && next>=0
                && result.getBoolean("committed") && result.getInt("slot",-1)==slot
                && result.getInt("side",-2)==-1 && result.getInt("skippedTask",-1)==next){
            Shell.executor.execute(()->{
                if(!fence.current(ticket))return;
                try{
                    Lease lease=leases.get(next);
                    if(lease!=null){ownership.releaseIfOwned(next,lease.listener);leases.remove(next);}
                    main.post(()->{if(fence.current(ticket))releaseStepInput(()->{if(fence.complete(ticket))resumeNext();});});
                }catch(Throwable error){main.post(()->fail("跳过副格后监听归还失败："+error));}
            });
            return;
        }
        if (!result.getBoolean("committed") || result.getInt("slot", -1) != slot
                || result.getInt("side", -2) != next || result.getInt("previous", -2) != previous)
            throw new IllegalStateException("副格图层或身份尚未确认");
        settle(ticket, slot, previous, next, 0);
    }
    void settle(long ticket, int slot, int previous, int next, int attempt) {
        Shell.executor.execute(() -> {
            if (!fence.current(ticket)) return;
            try {
                // The reply already confirms the owned surfaces. Unrelated Shell animations
                // must not keep the input guard up after these two tasks have landed.
                boolean seen = true;
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
                    main.postDelayed(() -> settle(ticket, slot, previous, next, attempt + 1), 32); return;
                }
                slots.replace(slot, previous, next);
                if (previous >= 0) { Lease old = leases.get(previous); ownership.release(previous, old.listener); leases.remove(previous); }
                render(()->main.post(() -> {
                    finishHandoff(ticket,"副格="+java.util.Arrays.toString(slots.snapshot()));
                }));
            } catch (Throwable error) { main.post(() -> fail("任务交接确认失败: " + error)); }
        });
    }
    void finishHandoff(long ticket,String detail){
        if(!fence.current(ticket) || closing || closed)return;
        // Both manual and native promotion arrive here after the exact listener
        // was returned and the final slot UI submitted its frame.
        rpc("replay",new Bundle(),replayed->{
            if(!fence.current(ticket))return;
            clearDrag();closeFlipStage();
            releaseStepInput(()->{
                if(!fence.complete(ticket))return;
                log("交接完成；"+detail+"；任务、图层事务与副格绘制已提交");
                resumeNext();
            });
        });
    }
    void commitSlotFrame(Runnable committed){
        main.post(()->{
            if(closing || closed)return;
            final long generation=++slotFrameGeneration;
            final boolean[] delivered={false};
            try{
                if(!panel.isAttachedToWindow() || !panel.isHardwareAccelerated())
                    throw new IllegalStateException("副格绘制窗口未就绪");
                pendingNativeSlot=-1;showSlots();
                panel.getViewTreeObserver().registerFrameCommitCallback(()->main.post(()->{
                    if(delivered[0] || generation!=slotFrameGeneration || closing || closed)return;
                    delivered[0]=true;
                    int[] at=new int[2];panel.getLocationOnScreen(at);
                    if(at[0]!=geometry.sideX || at[1]!=geometry.top || panel.getWidth()!=previewWidth){
                        fail("副格最终绘制位置不一致");return;
                    }
                    committed.run();
                }));
                panel.invalidate();
                main.postDelayed(()->{
                    if(!delivered[0] && generation==slotFrameGeneration && !closing && !closed){
                        delivered[0]=true;fail("副格最终绘制提交超时");
                    }
                },1200);
            }catch(Throwable error){fail("副格绘制确认失败："+error);}
        });
    }
    Object surface() {
        if (controller == null || !Boolean.TRUE.equals(field(controller, "mSurfaceCreated"))) throw new IllegalStateException("预览图层尚未创建");
        Object value = field(controller, "mSurfaceControl"); NativeWorkspaceGuard.validSurface(value);
        return entry==null?value:entry.parent((android.view.SurfaceControl)value);
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
    int[] stageFinishedPreviews(Object tx) throws Exception {
        synchronized(organizerLock){
            // A Shell finish must not overwrite a swap, drag, entry or exit that
            // owns a different intermediate pose. Only settled leases are copied.
            if(this!=current || !ready || closing || closed || fence.busy()
                    || flipStage!=null || shiftFrom!=null || dragSlot>=0)return null;
            stagePreviews(tx,true);
            return slots.snapshot();
        }
    }
    void stagePreviews(Object tx,boolean requireAll) throws Exception {
        Object parent=surface();
        for(int slot=0;slot<visibleSlots;slot++){
            int id=slots.task(slot);if(id<0)continue;
            Lease lease=leases.get(id);
            if(lease==null)throw new IllegalStateException("副任务未持有："+id);
            ActivityManager.RunningTaskInfo info=lease.checkedInfo();
            if(info==null || (Integer)call(info,"getWindowingMode")!=6){
                if(!requireAll && info==null)continue;
                throw new IllegalStateException("副任务离开预览模式："+id);
            }
            Object child=lease.checkedLeash();
            PreviewGeometry fit=new PreviewGeometry(logical.width(),logical.height(),previewWidth,geometry.rowHeight(slot,visibleSlots));
            call(tx,"reparent",child,parent);call(tx,"setMatrix",child,fit.scale,0f,0f,fit.scale);
            float y=geometry.rowTop(slot,visibleSlots);int[] origins=shiftFrom;
            if(origins!=null && origins[slot]>=0)y+=(geometry.rowTop(origins[slot],visibleSlots)-y)*(1-shiftProgress);
            call(tx,"setPosition",child,fit.x+(dragSlot==slot?dragX:0f),fit.y+y);call(tx,"setWindowCrop",child,logical);
            call(tx,"setAlpha",child,1f);call(tx,"show",child);
        }
    }
    void render(Runnable committed) throws Exception {
        if (closing || closed) return;
        if(flipStage!=null && fence.busy() && committed==null)return;
        if(slots.count()==0){if(committed!=null)commitSlotFrame(committed);return;}
        synchronized (organizerLock) {
            // A renderer may have passed the outer check before exit took this lock.
            if(closing || closed)return;
            Object tx = NativeWorkspaceGuard.surfaceTransaction();
            try {
                stagePreviews(tx,committed!=null);
                final long frame=previewFrames.add();
                SurfaceCommit.observe(tx,Shell.executor,()->{
                    previewFrames.commit(frame);
                    if(committed!=null && !closing && !closed)commitSlotFrame(committed);
                });
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
    void retireUpper(Bundle data){
        int id=data.getInt("removed",-1);
        if(closing || closed || !holdsUpper(id))return;
        if(fence.busy()){main.postDelayed(()->retireUpper(data),32);return;}
        final Lease retired=leases.get(id);
        boolean selected=upperId==id;
        if(selected)upperId=-1;
        if(upperAppId==id)upperAppId=-1;
        if(upperNavigationId==id)upperNavigationId=-1;
        // Cover the vanished native page immediately; the other held page and
        // every main/side task keep their original ownership and geometry.
        if(quickBar!=null){
            quickBar.configureUpper();
            if(selected && quickBar.upper!=null){quickBar.deck.jump(WorkspaceDeck.CONTROLS);quickBar.upper.render(false);}
            if(quickBar.sideToolbar!=null)quickBar.sideToolbar.refreshTools();
        }
        Shell.executor.execute(()->{
            try{if(retired!=null && leases.get(id)==retired){ownership.releaseIfOwned(id,retired.listener);leases.remove(id);}}
            catch(Throwable error){main.post(()->fail("顶部结束任务清理失败："+error));}
        });
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
                        ActivityManager.RunningTaskInfo live=checkedInfo();
                        if(live!=null && slots.index(id)>=0 && (Integer)call(live,"getWindowingMode")==1 && flag(live,"isVisible")){
                            main.post(()->reconcile("原厂已将原副任务监听切回主区"));return;
                        }
                        if (live != null && ownership.exact(id) == listener) return;
                    }
                    main.post(() -> {
                        if(closing)return;
                        if(!holdsUpper(id) && slots.index(id)<0)return;
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
            ActivityManager.RunningTaskInfo selected=readmit?null:focused();
            synchronized (organizerLock) {
                ActivityManager.RunningTaskInfo value = checkedInfo();
                if (value == null || (Integer) call(value, "getWindowingMode") != 1
                        || !readmit && (selected==null || selected.taskId!=id || !token.equals(field(selected,"token"))))
                    throw new IllegalStateException("目标已不在原来的角色");
                ownership.acquire(id, value, checkedLeash(), listener);
            }
        }
        Object checkedLeash() {
            Object surface = leash(id);
            if ((Integer) call(surface, "getLayerId") != layerId) throw new IllegalStateException("任务图层已重建");
            return surface;
        }
    }
    void fail(String message) { layoutRestart=null;StepRuntime.diagnostic("WORKSPACE_FAILURE",message);log(message); close("异常退出并归还原任务"); }
    void close(String reason) {
        if (closing || closed) return;
        exitReason=reason;
        log(reason);
        homeExit="桌面暂挂".equals(reason);
        if(quickBar!=null){exitPage=quickBar.deck.savedPage();exitTopFace=quickBar.upper!=null && quickBar.upper.visible;}
        retainOnExit=!fence.busy() && (entry==null || entry.complete) && ("手动退出工作区".equals(reason)||"桌面暂挂".equals(reason)||"息屏暂挂".equals(reason)||"配置暂挂".equals(reason));
        if(retainOnExit && "手动退出工作区".equals(reason) && ready && quickBar!=null && interactive(Shell.context)){
            zoom(false,()->startRecovery(this::requestEnd));return;
        }
        startRecovery(this::requestEnd);
    }
    void startRecovery(Runnable readyToRestore) {
        closing = true;
        if(regionTransition!=null)regionTransition.close();
        if(entry!=null)entry.cancelFrames();
        if(input!=null)input.endEntryHold();
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
        // Serialize against an in-flight render, then refuse every queued/late write.
        synchronized(organizerLock){previewFrames.seal();}
        if(previewDrainStarted==0)previewDrainStarted=SystemClock.uptimeMillis();
        long waited=SystemClock.uptimeMillis()-previewDrainStarted;
        if(!previewFrames.ready() && waited<1800){main.postDelayed(this::requestEnd,32);return;}
        if(!previewDrainReported){
            previewDrainReported=true;
            StepRuntime.diagnostic("EXIT_DRAIN","session="+session+";pending="+previewFrames.pending()
                    +";waitMs="+waited+";committed="+previewFrames.ready()
                    +";action="+(previewFrames.ready()?"restore":"recover_unconfirmed_preview"));
        }
        // A lost preview callback must not strand the workspace. All writers are
        // stopped; the server still verifies and commits its own recovery transaction.
        Bundle end=new Bundle();end.putBoolean("retain",retainOnExit);end.putInt("page",exitPage);end.putBoolean("topFace",exitTopFace);
        end.putBoolean("homeExit",homeExit);
        end.putString("exitReason",exitReason);
        rpc("end", end, reply -> {
            if("RESTORED".equals(reply.getString("state")))cleanup();
            else main.postDelayed(()->{if(!closed)requestEnd();},2000);
        });
    }
    void cleanup() {
        if (closed || cleaning) return;
        if(regionTransition!=null)regionTransition.close();
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
                        if(entry!=null)entry.close();
                        if (taskView != null) {
                            if (controller != null && field(controller, "mTaskToken") != null) throw new IllegalStateException("容器意外持有其他任务，未释放");
                            call(taskView, "release");
                        }
                        if (panel != null) windows.removeViewImmediate(panel);
                        panel = null; taskView = null;
                        Runnable done=()->{closed=true;ready=false;
                            StepRuntime.diagnostic("EXIT_UI","session="+session+";listenersReleased=true;containerRemoved=true;inputRemoved=true");
                            StepRuntime.report(reportTo,3,"工作区已退出，原任务未删除",-1);
                            restartLayout();};
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
    void restartLayout(){
        Intent next=layoutRestart;layoutRestart=null;
        if(next==null)return;
        main.post(()->{
            if(current!=this || !closed || !"配置暂挂".equals(exitReason) || !StepRuntime.enabled
                    || !interactive(Shell.context) || !android.os.Process.myUserHandle().equals(quickUser)
                    || !Shell.context.getSystemService(android.os.UserManager.class).isUserForeground())return;
            open(reportTo,next);
        });
    }
    void closeQuickBar() {
        WorkspaceQuickBar old = quickBar;
        quickBar = null;
        if (old != null) try { old.close(); }
        catch (RuntimeException error) { log("快捷栏清理状态：" + error.getMessage()); }
    }
}
