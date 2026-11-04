package ls.augment.com.step;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.UserHandle;
import android.os.UserManager;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.*;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import static ls.augment.com.step.StepRuntime.*;

/** A session-owned physical toolbar. Optional launcher capabilities do not own any task. */
final class WorkspaceQuickBar {
    static final String TITLE = "RedMagicDuoStepQuickApps";
    final LiveWorkspace host;
    final Context ctx;
    final UserHandle user;
    final LauncherApps launcher;
    final ExecutorService worker = Executors.newSingleThreadExecutor();
    final LinkedHashSet<String> iconRequests = new LinkedHashSet<>();
    FrameLayout bar;
    LinearLayout band;
    UpperPane upper;
    TextView title;
    int topInset;
    WorkspaceActions tools;
    LinearLayout tiles;
    WorkspaceDeck deck;
    StepGlyph clips, shot, torch, exit, settings, prev, next, recorder;
    LinearLayout leading, trailing;
    boolean hasRecorder;
    int button;
    QuickPicker picker;
    android.graphics.Bitmap wallpaper;
    android.hardware.camera2.CameraManager cameras;
    String flashId;
    Boolean torchOn;
    boolean torchWatch;
    final android.hardware.camera2.CameraManager.TorchCallback torchState=new android.hardware.camera2.CameraManager.TorchCallback(){
        @Override public void onTorchModeChanged(String id,boolean on){if(id.equals(flashId)){torchOn=on;refreshTorch();}}
        @Override public void onTorchModeUnavailable(String id){if(id.equals(flashId)){torchOn=null;refreshTorch();}}
    };
    HorizontalScrollView scroll;
    List<QuickCatalog.App> catalog = Collections.emptyList(), order = Collections.emptyList();
    String selected;
    int headerGeneration,servicesGeneration;
    android.animation.ValueAnimator railMotion;
    boolean headerMoving;
    int epoch, userId;
    boolean closed, attached, watching, choosing, launching;

    WorkspaceQuickBar(LiveWorkspace host) {
        this.host = host; user = host.quickUser;
        ctx = new android.view.ContextThemeWrapper(Shell.context, android.R.style.Theme_Material_Light_NoActionBar);
        launcher = ctx.getSystemService(LauncherApps.class);
    }
    int dp(int n) { return Math.round(ctx.getResources().getDisplayMetrics().density*n); }
    boolean currentUser() {
        return android.os.Process.myUserHandle().equals(user) && ctx.getSystemService(UserManager.class).isUserForeground();
    }
    void open() {
        Rect screen = host.windows.getCurrentWindowMetrics().getBounds();
        int inset=host.windows.getCurrentWindowMetrics().getWindowInsets().getInsetsIgnoringVisibility(
                android.view.WindowInsets.Type.statusBars()|android.view.WindowInsets.Type.displayCutout()).top;
        int available=host.geometry.top;
        userId=currentUser()?(Integer)call(user,"getIdentifier"):-1;
        if(available<dp(92))throw new IllegalStateException("顶区不足以显示工具与应用栏");
        host.topAvailable &= inset+dp(34)<available;
        topInset=inset;
        tools=new WorkspaceActions(this);
        bar=new FrameLayout(ctx);bar.setBackground(StepMaterial.glass(ctx,true,0));
        wall=StepMaterial.wallView(ctx);bar.addView(wall,-1,-1);
        loadWall();
        try{ctx.registerReceiver(wallChanges,new android.content.IntentFilter(Intent.ACTION_WALLPAPER_CHANGED),
                Context.RECEIVER_NOT_EXPORTED);watchWall=true;}catch(RuntimeException e){host.log("壁纸监听不可用："+e);}
        band=new LinearLayout(ctx);band.setOrientation(1);
        int edge=dp(8),bottomGap=Math.min(10,dp(4));
        int compactHeight=Math.max(0,available-dp(92));
        band.setPadding(edge,Math.min(dp(14),dp(4)+compactHeight/4),edge,bottomGap);
        bar.addView(band,-1,-1);
        int line=Math.min(dp(28),dp(19)+compactHeight/5),rail=Math.min(dp(34),dp(23)+compactHeight/5);
        deck=new WorkspaceDeck(this);band.addView(deck,new LinearLayout.LayoutParams(-1,0,1));
        LinearLayout header=new LinearLayout(ctx){
            @Override public boolean onInterceptTouchEvent(MotionEvent event){
                return headerMoving || super.onInterceptTouchEvent(event);
            }
        };header.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams headerParams=new LinearLayout.LayoutParams(-1,line);
        headerParams.topMargin=Math.min(edge,Math.max(0,(available-dp(100))/4));
        headerParams.bottomMargin=dp(1);
        button=Math.max(1,Math.min(dp(36),(screen.width()-2*edge-dp(76))/8));
        leading=new LinearLayout(ctx);trailing=new LinearLayout(ctx);
        header.addView(leading,4*button,-1);
        title=StepMaterial.label(ctx,"红魔 Step",21,true);title.setMaxLines(1);
        title.setPadding(dp(2),0,dp(2),0);
        title.setAutoSizeTextTypeUniformWithConfiguration(12,21,1,android.util.TypedValue.COMPLEX_UNIT_SP);
        header.addView(title,new LinearLayout.LayoutParams(0,-1,1));header.addView(trailing,4*button,-1);
        trailing.setGravity(Gravity.RIGHT);leading.setGravity(Gravity.LEFT);header.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
        band.addView(header,headerParams);
        exit=new StepGlyph(ctx,host.leftSide?"exitLeft":"exitRight","退出工作区",()->host.close("手动退出工作区"));
        settings=new StepGlyph(ctx,"settings","打开系统设置",()->systemAction(new Intent(android.provider.Settings.ACTION_SETTINGS)));
        settings.setOnLongClickListener(v->{chooseCount();return true;});
        updateCapacity();
        clips=new StepGlyph(ctx,"clipboard","剪贴板历史",tools::openClips);
        shot=new StepGlyph(ctx,"screenshot","截图",tools::capture);
        clips.setEnabled(WorkspaceClipboard.available());shot.setEnabled(tools.takeShot!=null);
        clips.setAlpha(clips.isEnabled()?1f:.45f);shot.setAlpha(shot.isEnabled()?1f:.45f);
        prev=new StepGlyph(ctx,"prev","上一个快捷应用",()->step(-1));
        next=new StepGlyph(ctx,"next","下一个快捷应用",()->step(1));
        torch=new StepGlyph(ctx,"torch","手电筒",this::toggleTorch);
        recorder=new StepGlyph(ctx,"record","录屏",()->{});
        recorder.setOnClickListener(v->activateTile("videoscreen",v));
        hasRecorder=NativeTiles.read(userId,"videoscreen")>=0;
        arrangeHeader();
        startTorch();
        scroll=new HorizontalScrollView(ctx);scroll.setHorizontalScrollBarEnabled(false);tiles=new LinearLayout(ctx);
        scroll.setBackgroundColor(android.graphics.Color.TRANSPARENT);
        scroll.setOutlineProvider(new android.view.ViewOutlineProvider(){@Override public void getOutline(View v,android.graphics.Outline o){
            o.setRoundRect(0,0,v.getWidth(),v.getHeight(),v.getHeight()/2f);
        }});scroll.setClipToOutline(true);
        tiles.setGravity(Gravity.CENTER_VERTICAL);tiles.setPadding(dp(10),0,dp(10),0);
        tiles.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
        scroll.addView(tiles);band.addView(scroll,-1,rail);
        scroll.setOnScrollChangeListener((View v,int x,int y,int oldX,int oldY)->visibleIcons());
        WindowManager.LayoutParams lp=new WindowManager.LayoutParams(screen.width(),available,
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED|WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM | WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE|
                WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL,PixelFormat.TRANSLUCENT);
        lp.setFitInsetsTypes(0);lp.layoutInDisplayCutoutMode=WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
        lp.setTitle(TITLE);lp.gravity=Gravity.TOP|Gravity.LEFT;lp.y=0;lp.alpha=0;
        host.windows.addView(bar,lp);attached=true;
        configureUpper();
        if(!currentUser() || launcher==null){refreshCodes();host.log("当前用户无法使用快捷应用目录");return;}
        try{
            userId=(Integer)call(user,"getIdentifier");
            launcher.registerCallback(packages,host.main);watching=true;refresh();
        }catch(RuntimeException | LinkageError unavailable){host.log("快捷应用目录不可用："+unavailable.getMessage());refreshCodes();}
    }
    void arrangeHeader(){
        final int ticket=++headerGeneration;
        if(attached){
            headerMoving=true;
            leading.animate().cancel();trailing.animate().cancel();
            leading.animate().alpha(0).setDuration(90).start();
            trailing.animate().alpha(0).setDuration(90).withEndAction(()->{
                if(closed || headerGeneration!=ticket)return;
                layoutHeader();leading.animate().alpha(1).setDuration(150).start();
                trailing.animate().alpha(1).setDuration(150).withEndAction(()->{if(ticket==headerGeneration)headerMoving=false;}).start();
            }).start();return;
        }
        layoutHeader();
    }
    void layoutHeader(){
        leading.removeAllViews();trailing.removeAllViews();
        LinearLayout near=host.leftSide?leading:trailing,far=host.leftSide?trailing:leading;
        exit.glyph=host.leftSide?"exitLeft":"exitRight";
        exit.invalidate();
        if(host.leftSide){near.addView(exit,button,-1);near.addView(settings,button,-1);near.addView(clips,button,-1);near.addView(shot,button,-1);}
        else {near.addView(shot,button,-1);near.addView(clips,button,-1);near.addView(settings,button,-1);near.addView(exit,button,-1);}
        if(host.leftSide){if(hasRecorder)far.addView(recorder,button,-1);far.addView(torch,button,-1);far.addView(prev,button,-1);far.addView(next,button,-1);}
        else{far.addView(prev,button,-1);far.addView(next,button,-1);far.addView(torch,button,-1);if(hasRecorder)far.addView(recorder,button,-1);}
    }
    ImageView wall;
    int wallRevision;
    boolean watchWall;
    final android.content.BroadcastReceiver wallChanges=new android.content.BroadcastReceiver(){
        public void onReceive(Context c,Intent event){if(!closed)loadWall();}
    };
    void loadWall(){
        int revision=++wallRevision;
        worker.execute(()->{
            android.graphics.Bitmap image=StepMaterial.wallpaper(ctx);
            android.app.WallpaperColors colors=null;
            if(image==null)try{colors=ctx.getSystemService(android.app.WallpaperManager.class)
                    .getWallpaperColors(android.app.WallpaperManager.FLAG_SYSTEM);}catch(RuntimeException ignored){}
            android.app.WallpaperColors fallback=colors;
            host.main.post(()->{
                if(closed || revision!=wallRevision)return;
                wallpaper=image;
                if(image!=null){wall.setImageBitmap(image);wall.setAlpha(.48f);}
                else if(fallback!=null){
                    int primary=fallback.getPrimaryColor().toArgb();
                    int secondary=fallback.getSecondaryColor()==null?primary:fallback.getSecondaryColor().toArgb();
                    wall.setImageDrawable(new android.graphics.drawable.GradientDrawable(
                        android.graphics.drawable.GradientDrawable.Orientation.TL_BR,new int[]{primary,secondary}));
                    wall.setAlpha(.38f);
                }else wall.setImageDrawable(null);
            });
        });
    }
    void windowsUpdate(WindowManager.LayoutParams lp){host.windows.updateViewLayout(bar,lp);}
    void logUnavailable(String text){host.log(text);Toast.makeText(ctx,text,Toast.LENGTH_SHORT).show();}
    SlotCountDialog counts;
    void configureUpper(){
        boolean enabled=host.upperEnabled && host.topAvailable;
        if(enabled && upper==null)upper=new UpperPane(this,topInset);
        if(!enabled && upper!=null){
            upper.render(false);upper.close();bar.removeView(upper.face);bar.removeView(upper.roll);upper=null;
        }
        title.setOnClickListener(enabled?v->upper.toggle(true):null);title.setClickable(enabled);
        title.setContentDescription(enabled?"打开顶部任务窗口":null);
        if(enabled && deck.topPage.getParent()==null)deck.addView(deck.topPage,-1,-1);
        if(!enabled && deck.topPage.getParent()!=null){deck.leaveUpperPage();deck.removeView(deck.topPage);}
        deck.positionPages();
    }
    void chooseCount(){
        try{checkAction();if(counts!=null)counts.dismiss();
            counts=new SlotCountDialog(ctx,true,host.visibleSlots,host.upperEnabled,host.topAvailable,host::resizeSlots);counts.show();
        }catch(RuntimeException error){note(error);}
    }
    void updateCapacity(){
        if(settings!=null)settings.setTooltipText("打开系统设置；长按调整工作区布局（"+host.visibleSlots+" 个侧格）");
    }
    void refreshCodes(){
        if(closed)return;
        int ticket=++servicesGeneration;
        worker.execute(()->{
            try{
                Map<WorkspaceActions.Code,List<WorkspaceActions.Service>> services=tools.codeServices();
                host.main.post(()->{if(!closed && ticket==servicesGeneration)deck.bindCodes(services);});
            }catch(RuntimeException e){host.log("工作区快捷服务不可用："+e.getClass().getSimpleName());}
        });
    }
    void startTorch(){
        torch.setVisibility(View.GONE);
        try{
            cameras=ctx.getSystemService(android.hardware.camera2.CameraManager.class);
            for(String id:cameras.getCameraIdList()){
                android.hardware.camera2.CameraCharacteristics c=cameras.getCameraCharacteristics(id);
                if(Boolean.TRUE.equals(c.get(android.hardware.camera2.CameraCharacteristics.FLASH_INFO_AVAILABLE)) &&
                        Integer.valueOf(android.hardware.camera2.CameraCharacteristics.LENS_FACING_BACK).equals(c.get(android.hardware.camera2.CameraCharacteristics.LENS_FACING))){flashId=id;break;}
            }
            if(flashId!=null){cameras.registerTorchCallback(torchState,host.main);torchWatch=true;}
        }catch(Exception ignored){flashId=null;}
    }
    void refreshTorch(){if(torch!=null&&!closed){torch.setVisibility(torchOn==null?View.GONE:View.VISIBLE);torch.accent=Boolean.TRUE.equals(torchOn)?0xff3585ee:0;torch.invalidate();}}
    void toggleTorch(){if(torchOn!=null && !closed)try{checkAction();cameras.setTorchMode(flashId,!torchOn);}catch(Exception error){note(error);}}
    void activateTile(String key,View v){
        try{checkAction();NativeTiles.activate(userId,key,v);host.log("已交给原厂磁贴："+key);}
        catch(ReflectiveOperationException|RuntimeException e){note(e);}
    }
    boolean canOpenSystem(Intent i){
        android.content.pm.ResolveInfo resolved=ctx.getPackageManager().resolveActivity(i,android.content.pm.PackageManager.MATCH_DEFAULT_ONLY);
        return resolved!=null && resolved.activityInfo!=null && resolved.activityInfo.exported &&
                (resolved.activityInfo.applicationInfo.flags & android.content.pm.ApplicationInfo.FLAG_SYSTEM)!=0;
    }
    void systemAction(Intent request){
        try{
            checkAction();if(!canOpenSystem(request))throw new IllegalStateException("没有可用的系统入口");
            android.content.pm.ActivityInfo info=ctx.getPackageManager().resolveActivity(request,android.content.pm.PackageManager.MATCH_DEFAULT_ONLY).activityInfo;
            ComponentName target=new ComponentName(info.packageName,info.name);
            List<Match> matches=new ArrayList<>();
            for(int slot=0;slot<host.visibleSlots;slot++){
                int id=host.slots.task(slot);if(id<0)continue;
                ActivityManager.RunningTaskInfo task=host.info(id);
                if(task==null)throw new IllegalStateException("副格身份正在变化");
                if(LiveWorkspace.number(task,"userId")!=userId)continue;
                if(belongs(task.baseActivity,target.getPackageName()))matches.add(new Match(slot,task));
            }
            if(matches.size()>1){choose(target.getPackageName(),matches);return;}
            Intent start=new Intent(request).setComponent(target).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            if(matches.size()==1){
                promote(matches.get(0));
                dispatchAfterPromotion(start,target,matches.get(0).id,0);
            }else{ctx.startActivity(start);launching=true;confirmLaunch(target,0);}
        }catch(RuntimeException error){note(error);}
    }
    void dispatchAfterPromotion(Intent start,ComponentName target,int id,int attempt){
        if(closed||host.closing)return;
        ActivityManager.RunningTaskInfo focused=host.focused();
        if(!host.fence.busy() && focused!=null && focused.taskId==id && host.slots.index(id)<0){
            try{checkAction();ctx.startActivity(start);launching=true;confirmLaunch(target,0);}catch(RuntimeException error){note(error);}
        }else if(attempt<30)host.main.postDelayed(()->dispatchAfterPromotion(start,target,id,attempt+1),70);
        else host.log("未确认系统任务已回到主区");
    }
    void refresh() {
        if (closed) return;
        refreshCodes();
        int request = ++epoch;
        worker.execute(() -> {
            try {
                List<QuickCatalog.App> apps = QuickCatalog.load(ctx,user,true);
                host.main.post(() -> {
                    if (!closed && epoch==request) { catalog=apps; updateOrder(); }
                });
            } catch (RuntimeException | LinkageError error) {
                host.main.post(() -> {
                    if (!closed && epoch==request) {
                        catalog=Collections.emptyList(); updateOrder();
                        host.log("桌面应用列表不可用：" + error.getMessage());
                    }
                });
            }
        });
    }
    void updateOrder() {
        if (closed || tiles == null) return;
        cancelRailMotion();
        order = QuickCatalog.arranged(catalog,host.pinned==null ? new LinkedHashSet<>() : new LinkedHashSet<>(host.pinned));
        choosing=false; tiles.removeAllViews(); iconRequests.clear();
        for (QuickCatalog.App app : order) {
            ImageView tile = new ImageView(ctx);tile.setTag(app);tile.setContentDescription("打开 "+app.label);
            int pad=(dp(48)-dp(31))/2;
            tile.setPadding(pad,0,pad,0);tile.setScaleType(ImageView.ScaleType.FIT_CENTER);
            tile.setFocusable(true);tile.setOnClickListener(v->openApp(app));
            tile.setOnTouchListener((v,e)->{
                int a=e.getActionMasked();if(a==MotionEvent.ACTION_DOWN || a==MotionEvent.ACTION_CANCEL || a==MotionEvent.ACTION_UP){
                    if(a==MotionEvent.ACTION_DOWN)cancelRailMotion();
                    float scale=a==MotionEvent.ACTION_DOWN?1.18f:1f;v.animate().scaleX(scale).scaleY(scale).setDuration(90).start();
                }return false;
            });
            tile.setOnLongClickListener(v->{edit();return true;});
            tiles.addView(tile,new LinearLayout.LayoutParams(dp(48),-1));
        }
        if (order.isEmpty()) {
            TextView empty = new TextView(ctx); empty.setText("暂无可用应用");
            empty.setTextColor(0xffefefef); empty.setGravity(Gravity.CENTER);
            tiles.addView(empty,new LinearLayout.LayoutParams(dp(120),-1));
        }
        scroll.post(this::visibleIcons);
    }
    TextView action(String label,String description,Runnable action) {
        TextView v=new TextView(ctx); v.setText(label); v.setContentDescription(description);
        v.setGravity(Gravity.CENTER); v.setTextColor(StepMaterial.ink(ctx)); v.setTextSize(15);
        v.setFocusable(true); v.setOnClickListener(view -> action.run()); return v;
    }
    void visibleIcons() {
        if (closed || choosing || tiles==null || scroll.getWidth()==0) return;
        int w=dp(48), first=Math.max(0,scroll.getScrollX()/w-1);
        int stop=Math.min(tiles.getChildCount(),(scroll.getScrollX()+scroll.getWidth())/w+2);
        for (int i=first;i<stop;i++) {
            View child=tiles.getChildAt(i);if(!(child instanceof ImageView))continue;ImageView tile=(ImageView)child;
            if (!(tile.getTag() instanceof QuickCatalog.App)) continue;
            QuickCatalog.App app=(QuickCatalog.App)tile.getTag();
            if (!iconRequests.add(app.key)) continue;
            worker.execute(() -> {
                try {
                    Drawable icon=app.info.getBadgedIcon(ctx.getResources().getDisplayMetrics().densityDpi);
                    host.main.post(() -> {
                        if (closed || tile.getParent()!=tiles || icon==null) return;
                        tile.setImageDrawable(icon);
                    });
                } catch (RuntimeException | LinkageError ignored) { /* The text is also the launch control. */ }
            });
        }
    }
    void step(int direction) {
        if (choosing) { updateOrder(); return; }
        if (order.isEmpty()) return;
        int current=-1;
        for (int i=0;i<order.size();i++) if (order.get(i).key.equals(selected)) { current=i; break; }
        int next=current<0 ? (direction>0 ? 0 : order.size()-1) : Math.floorMod(current+direction,order.size());
        cancelRailMotion();
        QuickCatalog.App app=order.get(next);selected=app.key;
        View incoming=tiles.getChildAt(next),outgoing=tiles.getChildAt(current<0?Math.floorMod(next-direction,order.size()):current);
        if(incoming==null || outgoing==incoming){openApp(app);return;}
        int travel=direction*dp(48);
        scroll.smoothScrollTo(Math.max(0,incoming.getLeft()-(scroll.getWidth()-incoming.getWidth())/2),0);
        incoming.animate().cancel();outgoing.animate().cancel();
        android.animation.ValueAnimator motion=android.animation.ValueAnimator.ofFloat(0f,1f);
        railMotion=motion;motion.setDuration(230);
        motion.setInterpolator(new android.view.animation.DecelerateInterpolator(1.3f));
        motion.addUpdateListener(a->{
            float p=(float)a.getAnimatedValue();
            pose(outgoing,travel*p,1-.24f*p,1-p);
            pose(incoming,-travel*(1-p),.76f+.24f*p,p);
        });
        motion.addListener(new android.animation.AnimatorListenerAdapter(){
            @Override public void onAnimationEnd(android.animation.Animator a){
                pose(outgoing,0,1,1);pose(incoming,0,1,1);
                if(railMotion!=a)return;
                railMotion=null;
                if(!closed && incoming.getParent()==tiles)openApp(app);
            }
        });
        motion.start();
    }
    private static void pose(View v,float x,float scale,float alpha){
        v.setTranslationX(x);v.setScaleX(scale);v.setScaleY(scale);v.setAlpha(alpha);
    }
    private void cancelRailMotion(){
        android.animation.ValueAnimator old=railMotion;railMotion=null;if(old!=null)old.cancel();
    }
    void checkAction() {
        host.preflight();
        if (closed || !currentUser() || launching) throw new IllegalStateException("当前用户或前台切换尚未就绪");
    }
    void edit() {
        try {
            checkAction();
            if(picker!=null || catalog.isEmpty())return;
            final long version=host.pinRevision;
            picker=new QuickPicker(ctx,true,catalog,host.pinned==null?Collections.emptyList():host.pinned,wallpaper,keys->{
                if(closed||!currentUser())return false;
                android.os.Bundle data=new android.os.Bundle();data.putStringArrayList("keys",new ArrayList<>(keys));data.putLong("revision",version);
                try{
                    android.os.Bundle answer=ctx.getContentResolver().call(WorkspacePrefsProvider.URI,"save",null,data);
                    if(answer==null || !answer.getBoolean("saved"))return false;
                    host.updateQuickPins(new Intent().putExtras(answer));return true;
                }catch(RuntimeException error){host.log("固定列表写入失败："+error);return false;}
            },()->picker=null);
            picker.show();

        } catch (RuntimeException | LinkageError error) {
            if(picker!=null && !picker.dialog.isShowing())picker=null;
            note(error);
        }
    }
    void note(Throwable error) {
        String msg="快捷操作未执行："+error.getMessage();
        host.log(msg); Toast.makeText(ctx,msg,Toast.LENGTH_SHORT).show();
    }
    static final class Match {
        final int slot,id,user; final Object token;
        Match(int slot, ActivityManager.RunningTaskInfo task) {
            this.slot=slot; id=task.taskId;user=LiveWorkspace.number(task,"userId");token=field(task,"token");
        }
    }
    static boolean belongs(ComponentName name,String pkg) { return name!=null && name.getPackageName().equals(pkg); }
    static boolean entry(ActivityManager.RunningTaskInfo task, ComponentName key) {
        return key.equals(task.baseActivity) || (task.baseIntent!=null && key.equals(task.baseIntent.getComponent()));
    }
    void openApp(QuickCatalog.App app) {
        try {
            checkAction();
            int appUser=WorkspaceUsers.id(app.info.getUser());
            if (!WorkspaceUsers.allows(ctx,userId,appUser) || !launcher.isActivityEnabled(app.component,app.info.getUser()))throw new IllegalStateException("用户或桌面入口已失效");
            selected=app.key;
            ArrayList<Match> exact=new ArrayList<>(), related=new ArrayList<>();
            ActivityManager.RunningTaskInfo mainTask;
            synchronized (host.organizerLock) {
                mainTask=host.focused();
                if (mainTask==null || !WorkspaceUsers.allows(ctx,userId,LiveWorkspace.number(mainTask,"userId")))
                    throw new IllegalStateException("无法核对主任务用户");
                for (int slot=0;slot<host.visibleSlots;slot++) {
                    int id=host.slots.task(slot);
                    if (id<0) continue;
                    ActivityManager.RunningTaskInfo task=host.info(id);
                    if (task==null || task.taskId!=id || !LiveWorkspace.root(task)
                            || LiveWorkspace.number(task,"displayId")!=0
                            || task.baseActivity==null || field(task,"token")==null)
                        throw new IllegalStateException("副格身份正在变化");
                    if(LiveWorkspace.number(task,"userId")!=appUser)continue;
                    if (entry(task,app.component)) exact.add(new Match(slot,task));
                    else if (belongs(task.baseActivity,app.component.getPackageName())) related.add(new Match(slot,task));
                }
            }
            if (exact.isEmpty() && LiveWorkspace.number(mainTask,"userId")==appUser && entry(mainTask,app.component)) return;
            boolean singleEntry = launcher.getActivityList(app.component.getPackageName(),app.info.getUser()).size()==1;
            List<Match> matches=exact.isEmpty() && singleEntry ? related : exact;
            if (matches.size()==1) { promote(matches.get(0)); return; }
            if (!matches.isEmpty()) { choose(app.label,matches); return; }
            if (LiveWorkspace.number(mainTask,"userId")==appUser && belongs(mainTask.baseActivity,app.component.getPackageName())
                    && singleEntry) return;
            launch(app.component,app.info.getUser());
        } catch (RuntimeException | LinkageError error) { note(error); }
    }
    void choose(String label,List<Match> matches) {
        choosing=true; tiles.removeAllViews();
        tiles.addView(action("返回","返回常用应用",this::updateOrder),new LinearLayout.LayoutParams(dp(52),-1));
        for (Match match:matches) {
            String name="副格 "+(match.slot+1);
            tiles.addView(action(name,label+" · "+name,() -> {
                updateOrder();
                try { checkAction(); promote(match); } catch (RuntimeException error) { note(error); }
            }),new LinearLayout.LayoutParams(dp(66),-1));
        }
        scroll.scrollTo(0,0);
    }
    void promote(Match match) {
        ActivityManager.RunningTaskInfo task=host.info(match.id);
        if (host.slots.task(match.slot)!=match.id || task==null || match.token==null
                || !match.token.equals(field(task,"token")) || LiveWorkspace.number(task,"userId")!=match.user || !WorkspaceUsers.allows(ctx,userId,match.user))
            throw new IllegalStateException("所选副格已变化");
        ActivityManager.RunningTaskInfo mainTask=host.focused();
        if (mainTask!=null && belongs(mainTask.baseActivity,PACKAGE)) host.returnSide(match.slot,false);
        else host.change(match.slot);
    }
    void launch(ComponentName target,UserHandle profile) {
        launcher.startMainActivity(target,profile,null,null);
        launching=true;
        confirmLaunch(target,0,WorkspaceUsers.id(profile));
    }
    void confirmLaunch(ComponentName target,int attempt) {confirmLaunch(target,attempt,userId);}
    void confirmLaunch(ComponentName target,int attempt,int targetUser) {
        if (closed) return;
        try {
            ActivityManager.RunningTaskInfo top=host.focused();
            if (top!=null && LiveWorkspace.number(top,"userId")==targetUser
                    && (belongs(top.baseActivity,target.getPackageName()) || belongs(top.topActivity,target.getPackageName()))
                    && Boolean.TRUE.equals(call(host.nativeTransitions,"isIdle"))) {
                launching=false; return;
            }
        } catch (RuntimeException ignored) { /* Recheck after the native transition. */ }
        if (attempt>=24) { launching=false; host.log("未确认快捷入口进入前台："+target.getPackageName()); return; }
        host.main.postDelayed(() -> confirmLaunch(target,attempt+1,targetUser),100);
    }
    final LauncherApps.Callback packages = new LauncherApps.Callback() {
        void changed(UserHandle changed) { if (changed.equals(user) || WorkspaceUsers.allows(ctx,userId,WorkspaceUsers.id(changed))) refresh(); }
        public void onPackageAdded(String pkg,UserHandle u) { changed(u); }
        public void onPackageRemoved(String pkg,UserHandle u) { changed(u); }
        public void onPackageChanged(String pkg,UserHandle u) { changed(u); }
        public void onPackagesAvailable(String[] pkgs,UserHandle u,boolean replacing) { changed(u); }
        public void onPackagesUnavailable(String[] pkgs,UserHandle u,boolean replacing) { changed(u); }
        @Override public void onShortcutsChanged(String pkg,List<android.content.pm.ShortcutInfo> shortcuts,UserHandle u){
            if(!closed && user.equals(u))refreshCodes();
        }
    };
    void close() {
        if (closed) return;
        closed=true;if(counts!=null)counts.dismiss(); worker.shutdownNow();
        cancelRailMotion();headerGeneration++;if(watchWall){ctx.unregisterReceiver(wallChanges);watchWall=false;}
        if(tools!=null)tools.closeClips();
        if(upper!=null)upper.close();
        if(picker!=null)try{picker.close();}catch(RuntimeException error){host.log("选择弹层清理状态："+error);}
        try { if(deck!=null)deck.close(); } finally {
            try { if(torchWatch)cameras.unregisterTorchCallback(torchState); } finally {
                try { if (watching) launcher.unregisterCallback(packages); }
                finally { if (attached) host.windows.removeViewImmediate(bar); }
            }
        }
    }
}
