package ls.augment.com.step;

import android.animation.*;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.*;
import android.graphics.drawable.*;
import android.view.*;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.*;
import java.util.*;

/** Two stock-art wings in a top-only physical window. No task or workspace bounds are mutated. */
final class WorkspaceSideToolbar implements AutoCloseable {
    static final String TITLE="RedMagicDuoStepSideToolbar";
    static final String LEFT=TITLE+"LeftHandle",RIGHT=TITLE+"RightHandle";
    final WorkspaceQuickBar owner;
    final Context context;
    final WindowManager windows;
    final GameSpacePanelStyle style;
    final int width,height,edgeWidth,edgeHeight,edgeY,slop;
    final PanelRoot root;
    final FrameLayout left,right;
    final EdgeHandle leftHandle,rightHandle;
    final LinearLayout apps,toolRows;
    final Set<View> registered=Collections.newSetFromMap(new IdentityHashMap<>());
    ValueAnimator animator;
    ViewTreeObserver.OnPreDrawListener motionReady;
    Runnable motionStart;
    float progress,chromeAlpha;
    boolean opened,attached,panelAttached,closed,edgeTracking;
    int appGeneration,toolCount;
    Runnable afterClose;

    static WorkspaceSideToolbar create(WorkspaceQuickBar owner){
        WorkspaceSideToolbar toolbar=null;
        try{
            if(!owner.host.geometry.reflow)throw new IllegalStateException("缺少原生主区重排能力，保留旧布局");
            GameSpacePanelStyle style=GameSpacePanelStyle.load(owner.ctx);
            toolbar=new WorkspaceSideToolbar(owner,style);toolbar.attach();
            owner.host.log("Step 双侧工具栏：已读取游戏空间原厂黑金资源；300ms 原厂侧滑参数");return toolbar;
        }catch(Exception|LinkageError missing){
            if(toolbar!=null)toolbar.close();
            StepRuntime.diagnostic("SIDEBAR_UNAVAILABLE","create;reason="+android.util.Log.getStackTraceString(missing));
            owner.host.log("Step 保留旧工具页，原厂侧栏能力缺失："+missing);return null;
        }
    }
    static boolean physical(CharSequence title){return TITLE.contentEquals(title==null?"":title)
            || LEFT.contentEquals(title==null?"":title) || RIGHT.contentEquals(title==null?"":title);}
    static boolean physical(int type,CharSequence title,int uid,int trustedUid){
        return trustedUid>=0 && uid==trustedUid && type==StepMaterial.STATUS_BAR_SUB_PANEL && physical(title);
    }
    WorkspaceSideToolbar(WorkspaceQuickBar owner,GameSpacePanelStyle style){
        this.owner=owner;this.style=style;
        Configuration config=new Configuration(owner.ctx.getResources().getConfiguration());
        config.uiMode=(config.uiMode&~Configuration.UI_MODE_NIGHT_MASK)|Configuration.UI_MODE_NIGHT_YES;
        context=new ContextThemeWrapper(StepMaterial.statusBarPanelContext(owner.ctx.createConfigurationContext(config),owner.ctx.getDisplay()),android.R.style.Theme_Material_NoActionBar);
        windows=context.getSystemService(WindowManager.class);
        width=owner.host.geometry.width;height=owner.host.geometry.contentHeight;
        edgeWidth=owner.dp(6);edgeHeight=Math.min(owner.dp(64),height/2);edgeY=(height-edgeHeight)/2;
        slop=ViewConfiguration.get(context).getScaledTouchSlop();
        root=new PanelRoot();root.setClipChildren(true);root.setClipToPadding(true);
        left=wing(false);right=wing(true);
        leftHandle=new EdgeHandle(false);rightHandle=new EdgeHandle(true);
        LinearLayout leftContent=column(left,false),rightContent=column(right,true);
        toolRows=new LinearLayout(context);toolRows.setOrientation(LinearLayout.VERTICAL);
        ScrollView toolScroll=new ScrollView(context);toolScroll.setFillViewport(true);toolScroll.setVerticalScrollBarEnabled(false);toolScroll.addView(toolRows);
        toolScroll.setContentDescription("工作栏全部功能，上下滑动浏览");
        leftContent.addView(toolScroll,new LinearLayout.LayoutParams(-1,0,1));
        apps=new LinearLayout(context);apps.setOrientation(LinearLayout.VERTICAL);
        ScrollView appScroll=new ScrollView(context);appScroll.setVerticalScrollBarEnabled(false);appScroll.addView(apps);
        rightContent.addView(appScroll,new LinearLayout.LayoutParams(-1,0,1));
        apply(0);refreshTools();refreshApps();
    }
    FrameLayout wing(boolean mirror){
        FrameLayout wing=new FrameLayout(context);
        wing.setBackground(new BitmapDrawable(context.getResources(),style.render(height,mirror)));
        FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams((int)Math.ceil(height*.95f),height,Gravity.TOP|(mirror?Gravity.RIGHT:Gravity.LEFT));
        root.addView(wing,lp);return wing;
    }
    LinearLayout column(FrameLayout wing,boolean mirror){
        LinearLayout column=new LinearLayout(context);column.setOrientation(LinearLayout.VERTICAL);
        int contentWidth=Math.round(height*.40f);
        FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(contentWidth,-1,Gravity.TOP|(mirror?Gravity.RIGHT:Gravity.LEFT));
        lp.leftMargin=mirror?0:owner.dp(6);lp.rightMargin=mirror?owner.dp(6):0;
        wing.addView(column,lp);return column;
    }
    void refreshTools(){
        toolRows.removeAllViews();toolCount=0;
        tool("最近文件","files",()->owner.openRecent(1));
        tool("最近媒体","media",()->owner.openRecent(0));
        tool("剪贴板","clipboard",()->owner.openRecent(2));
        for(WorkspaceActions.Tool item:owner.tools.availableTools(leftHandle))tool(item.label,item.glyph,item.open);
        finishGrid(toolRows,toolCount);
    }
    void tool(String text,String icon,Runnable action){
        FrameLayout entry=iconCell(text);StepGlyph glyph=icon(icon,text);
        entry.addView(glyph,new FrameLayout.LayoutParams(owner.dp(14),owner.dp(14),Gravity.CENTER));
        entry.setOnClickListener(v->{if(progress>.99f)afterClose(action);});
        addCell(toolRows,entry,toolCount++);
    }
    StepGlyph icon(String name,String label){
        StepGlyph glyph=new StepGlyph(context,name,label,()->{});glyph.setFixedInk(0xffededed);
        glyph.setClickable(false);glyph.setFocusable(false);glyph.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return glyph;
    }
    FrameLayout iconCell(String description){
        FrameLayout cell=new FrameLayout(context);cell.setBackground(tileBackground());
        cell.setContentDescription(description);cell.setFocusable(true);return cell;
    }
    void addCell(LinearLayout grid,View cell,int index){
        LinearLayout row;
        if(index%2==0){row=new LinearLayout(context);grid.addView(row,-1,-2);}
        else row=(LinearLayout)grid.getChildAt(grid.getChildCount()-1);
        LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,owner.dp(44),1);
        lp.setMargins(owner.dp(2),owner.dp(2),owner.dp(2),owner.dp(2));row.addView(cell,lp);
    }
    void finishGrid(LinearLayout grid,int count){
        if(count%2!=0){
            View space=new View(context);space.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            addCell(grid,space,count);
        }
    }
    Drawable tileBackground(){
        GradientDrawable base=new GradientDrawable();base.setColor(0x453f3f3f);base.setCornerRadius(owner.dp(8));
        return new RippleDrawable(android.content.res.ColorStateList.valueOf(0x55d7ad42),base,null);
    }
    WindowManager.LayoutParams params(int w,int h,int x,int y,String title){
        WindowManager.LayoutParams lp=new WindowManager.LayoutParams(w,h,StepMaterial.STATUS_BAR_SUB_PANEL,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE|WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                |WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM|WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED,PixelFormat.TRANSLUCENT);
        lp.setTitle(title);lp.gravity=Gravity.TOP|Gravity.LEFT;lp.x=x;lp.y=y;lp.alpha=chromeAlpha;
        if(chromeAlpha<.99f)lp.flags|=WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE;
        lp.setFitInsetsTypes(0);lp.layoutInDisplayCutoutMode=WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;return lp;
    }
    void attach(){
        try{
            // Probe the complete panel window before replacing the legacy page.
            add(root,params(width,height,0,0,TITLE));remove(root);
            add(leftHandle,params(edgeWidth,edgeHeight,0,edgeY,LEFT));
            add(rightHandle,params(edgeWidth,edgeHeight,width-edgeWidth,edgeY,RIGHT));attached=true;
        }catch(RuntimeException e){remove(root);remove(leftHandle);remove(rightHandle);throw e;}
    }
    boolean usable(){return !closed && !owner.closed && owner.host.ready && !owner.host.closing && chromeAlpha>.99f
            && owner.host.retained==null && !owner.host.fence.busy() && owner.host.dragSlot<0 && !owner.launching
            && owner.currentUser() && StepRuntime.interactive(context) && owner.picker==null && owner.recent==null
            && owner.tools.toolMenu==null && owner.tools.clipboard==null && (owner.counts==null || !owner.counts.dialog.isShowing());}
    boolean ownsGesture(float x,float y){return panelAttached || edgeTracking || y>=edgeY && y<edgeY+edgeHeight && (x<edgeWidth || x>=width-edgeWidth);}
    int edgeStart(float x,float y){
        if(!usable() || panelAttached || y<0 || y>=height || x<0 || x>=width)return -1;
        return x<owner.dp(24)?0:x>=width-owner.dp(24)?1:-1;
    }
    void setChromeAlpha(float value){
        if(closed)return;chromeAlpha=value;
        for(View view:new View[]{leftHandle,rightHandle,root})if(registered.contains(view)){
            WindowManager.LayoutParams lp=(WindowManager.LayoutParams)view.getLayoutParams();lp.alpha=value;
            if(value<.99f)lp.flags|=WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE;else lp.flags&=~WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE;
            windows.updateViewLayout(view,lp);
        }
    }
    void afterClose(Runnable action){if(!usable())return;afterClose=action;setOpen(false);}
    void setOpen(boolean open){
        if(closed || open && !usable())return;
        if(open)afterClose=null;
        if(opened==open && animator!=null)return;
        opened=open;stopMotion();
        boolean firstFrame=open && !panelAttached;
        if(open && !panelAttached){
            // Pinned icons are already prepared and refreshed by the catalog /
            // preference callbacks. Rebuilding them here makes icons pop in
            // during the slide and adds work before the first window frame.
            try{refreshTools();apply(0);add(root,params(width,height,0,0,TITLE));panelAttached=true;}
            catch(RuntimeException error){
                StepRuntime.diagnostic("SIDEBAR_UNAVAILABLE","open;reason="+android.util.Log.getStackTraceString(error));
                remove(root);panelAttached=false;opened=false;afterClose=null;apply(0);
                owner.note(error);return;
            }
        }
        float target=open?1:0;
        if(progress==target){finish();return;}
        ValueAnimator motion=ValueAnimator.ofFloat(progress,target);animator=motion;
        motion.setDuration(GameSpacePanelMotion.duration(progress,target));motion.setInterpolator(new AccelerateDecelerateInterpolator());
        motion.addUpdateListener(a->{if(animator==a)apply((Float)a.getAnimatedValue());});
        motion.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){if(animator!=a)return;animator=null;apply(target);finish();}});
        if(firstFrame){
            // addView() does not mean the window has a drawable surface yet.
            // Present the closed pose first, then give the full OEM animation
            // its own frame clock instead of consuming it during attachment.
            motionStart=()->{if(!closed && animator==motion){motionStart=null;motion.start();}};
            motionReady=new ViewTreeObserver.OnPreDrawListener(){@Override public boolean onPreDraw(){
                root.getViewTreeObserver().removeOnPreDrawListener(this);
                if(!closed && animator==motion){motionReady=null;if(motionStart!=null)root.postOnAnimation(motionStart);}
                return true;
            }
            };
            root.getViewTreeObserver().addOnPreDrawListener(motionReady);
        }else motion.start();
    }
    void stopMotion(){
        if(motionReady!=null){
            if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(motionReady);
            motionReady=null;
        }
        if(motionStart!=null){root.removeCallbacks(motionStart);motionStart=null;}
        ValueAnimator old=animator;animator=null;if(old!=null)old.cancel();
    }
    void apply(float value){
        progress=GameSpacePanelMotion.clamp(value);
        left.setTranslationX(GameSpacePanelMotion.translation(height,progress,false));right.setTranslationX(GameSpacePanelMotion.translation(height,progress,true));
        left.setAlpha(progress);right.setAlpha(progress);
        if(leftHandle!=null){leftHandle.setAlpha(1-progress);rightHandle.setAlpha(1-progress);}
    }
    void finish(){
        if(progress!=0 || opened)return;
        // Keep the input target until its current finger stream ends. Removing
        // a closing panel mid-swipe can hand the next gesture to the upper app.
        if(root.touchTracking)return;
        if(panelAttached){remove(root);panelAttached=false;}
        Runnable action=afterClose;afterClose=null;
        if(action!=null && usable())try{owner.checkAction();action.run();}catch(RuntimeException e){owner.note(e);}
    }
    boolean panelSwipe(float downX,float downY,float dx,float dy){
        boolean right=downX>width/2f;
        if(GameSpacePanelMotion.outward(dx,dy,right,slop)){setOpen(false);return true;}
        boolean edge=downY>=edgeY && downY<edgeY+edgeHeight && (downX<edgeWidth || downX>=width-edgeWidth);
        // A new inward swipe may arrive while the old closing panel still owns
        // the edge. Reverse that same panel rather than dropping the gesture.
        if(!opened && edge && GameSpacePanelMotion.inward(dx,dy,right,slop)){setOpen(true);return true;}
        return false;
    }
    void refreshApps(){
        if(closed || apps==null)return;int generation=++appGeneration;apps.removeAllViews();
        List<QuickCatalog.App> list=new ArrayList<>();
        if(owner.host.pinned!=null)for(String key:owner.host.pinned)for(QuickCatalog.App app:owner.catalog)if(key.equals(app.key)){list.add(app);break;}
        for(int i=0;i<list.size();i++){
            QuickCatalog.App app=list.get(i);
            FrameLayout cell=iconCell("打开 "+app.label);
            ImageView image=new ImageView(context);image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            cell.addView(image,new FrameLayout.LayoutParams(owner.dp(18),owner.dp(18),Gravity.CENTER));
            cell.setOnClickListener(v->{if(progress>.99f)afterClose(()->owner.openApp(app));});
            cell.setOnLongClickListener(v->{afterClose(owner::edit);return true;});
            addCell(apps,cell,i);
            owner.worker.execute(()->{try{Drawable drawable=app.info.getBadgedIcon(context.getResources().getDisplayMetrics().densityDpi);
                owner.host.main.post(()->{if(!closed && generation==appGeneration && drawable!=null)image.setImageDrawable(drawable);});
            }catch(RuntimeException|LinkageError ignored){}});
        }
        // The only add entry follows the last pinned app, including an empty list.
        FrameLayout add=iconCell("添加应用启动图标");
        add.addView(icon("add","添加应用启动图标"),new FrameLayout.LayoutParams(owner.dp(18),owner.dp(18),Gravity.CENTER));
        add.setEnabled(!owner.catalog.isEmpty());add.setAlpha(add.isEnabled()?1f:.45f);
        add.setOnClickListener(v->{if(progress>.99f)afterClose(owner::edit);});
        addCell(apps,add,list.size());finishGrid(apps,list.size()+1);
    }
    void choose(String label,List<WorkspaceQuickBar.Match> matches){
        owner.tools.closeMenu();WorkspaceToolMenu menu=new WorkspaceToolMenu(owner);owner.tools.toolMenu=menu;
        menu.dialog.setOnDismissListener(d->{if(owner.tools.toolMenu==menu)owner.tools.toolMenu=null;});
        for(WorkspaceQuickBar.Match match:matches)menu.add(label+" · "+(match.slot==WorkspaceRoutes.UPPER?"顶部工作区":"副格 "+(match.slot+1)),()->owner.promote(match));
        menu.show(rightHandle);
    }
    void add(View view,WindowManager.LayoutParams lp){windows.addView(view,lp);registered.add(view);}
    void remove(View view){
        // WindowManager owns a view immediately; isAttachedToWindow only becomes
        // true at the first traversal. Cleanup must also cover that interval.
        if(registered.remove(view))try{windows.removeViewImmediate(view);}
        catch(IllegalArgumentException gone){owner.host.log("侧栏窗口已由系统移除："+gone.getMessage());}
    }
    @Override public void close(){
        if(closed)return;closed=true;appGeneration++;afterClose=null;
        stopMotion();
        remove(root);remove(leftHandle);remove(rightHandle);attached=panelAttached=false;
    }
    final class EdgeHandle extends View {
        final boolean right;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);float downX,downY;boolean rejected,triggered;
        EdgeHandle(boolean right){super(context);this.right=right;setContentDescription(right?"从右侧呼出工作栏":"从左侧呼出工作栏");setFocusable(true);
            setOnClickListener(v->{if(usable())setOpen(true);});}
        @Override protected void onSizeChanged(int w,int h,int ow,int oh){setSystemGestureExclusionRects(Collections.singletonList(new Rect(0,0,w,h)));}
        @Override protected void onDraw(Canvas c){paint.setColor(0xcce4bd62);float x=right?getWidth()-owner.dp(3):owner.dp(3);c.drawRoundRect(x-owner.dp(1),owner.dp(10),x+owner.dp(1),getHeight()-owner.dp(10),owner.dp(2),owner.dp(2),paint);}
        @Override public boolean onTouchEvent(MotionEvent e){
            int action=e.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){if(!usable())return false;edgeTracking=true;downX=e.getRawX();downY=e.getRawY();rejected=triggered=false;return true;}
            if(!edgeTracking)return false;
            float dx=e.getRawX()-downX,dy=e.getRawY()-downY;
            if(e.getPointerCount()>1 || Math.abs(dy)>slop && Math.abs(dy)>Math.abs(dx))rejected=true;
            if(action==MotionEvent.ACTION_MOVE && !rejected && !triggered && GameSpacePanelMotion.inward(dx,dy,right,slop)){
                triggered=true;setOpen(true);
            }
            if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){
                edgeTracking=false;if(action==MotionEvent.ACTION_UP && !rejected && !triggered && Math.hypot(dx,dy)<slop)performClick();
            }
            return true;
        }
        @Override public boolean performClick(){super.performClick();return true;}
    }
    final class PanelRoot extends FrameLayout {
        float downX,downY;boolean rejected,touchTracking;
        PanelRoot(){super(context);setContentDescription("侧边工作栏，向两侧外滑或点击中间收起");setOnClickListener(v->setOpen(false));setAccessibilityPaneTitle("侧边工作栏");}
        @Override public void requestDisallowInterceptTouchEvent(boolean disallow){
            // A ScrollView stopping an active fling requests exclusive input on
            // DOWN. Keep observing direction so the next outward gesture can
            // close the wings; vertical gestures are rejected below and stay in
            // the scroll child, which still receives its normal event stream.
            super.requestDisallowInterceptTouchEvent(false);
        }
        @Override public boolean dispatchTouchEvent(MotionEvent e){
            int action=e.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN)touchTracking=true;
            try{return super.dispatchTouchEvent(e);}
            finally{
                if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){
                    touchTracking=false;post(WorkspaceSideToolbar.this::finish);
                }
            }
        }
        @Override public void onInitializeAccessibilityNodeInfo(android.view.accessibility.AccessibilityNodeInfo info){
            super.onInitializeAccessibilityNodeInfo(info);info.addAction(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_DISMISS);
        }
        @Override public boolean performAccessibilityAction(int action,android.os.Bundle args){
            if(action==android.view.accessibility.AccessibilityNodeInfo.ACTION_DISMISS){setOpen(false);return true;}return super.performAccessibilityAction(action,args);
        }
        @Override public boolean onInterceptTouchEvent(MotionEvent e){
            int action=e.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){downX=e.getX();downY=e.getY();rejected=false;}
            if(e.getPointerCount()>1)rejected=true;
            float dx=e.getX()-downX,dy=e.getY()-downY;
            if(Math.abs(dy)>slop && Math.abs(dy)>Math.abs(dx))rejected=true;
            if(action==MotionEvent.ACTION_MOVE && !rejected && panelSwipe(downX,downY,dx,dy))return true;
            return false;
        }
        @Override public boolean onTouchEvent(MotionEvent e){
            if(e.getActionMasked()==MotionEvent.ACTION_UP && !rejected && Math.hypot(e.getX()-downX,e.getY()-downY)<slop)performClick();return true;
        }
        @Override public boolean performClick(){super.performClick();return true;}
    }
}
