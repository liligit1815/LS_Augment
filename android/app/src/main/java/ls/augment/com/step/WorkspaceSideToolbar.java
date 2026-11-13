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
    final LinearLayout apps,toolRows,leftContent,rightContent,leftHeader,rightHeader;
    final LevelControl brightness,volume;
    final GameSpacePanelStyle.LampDrawable leftLamp,rightLamp;
    final ArrayList<Cell> cells=new ArrayList<>();
    final Set<View> registered=Collections.newSetFromMap(new IdentityHashMap<>());
    ValueAnimator animator,lampAnimator;
    ViewTreeObserver.OnPreDrawListener motionReady;
    Runnable motionStart;
    float progress,chromeAlpha;
    boolean opened,attached,panelAttached,closed,edgeTracking;
    int appGeneration,toolCount,contentTop=-1,cellSize,iconSize;
    Runnable afterClose;
    final Runnable states=new Runnable(){@Override public void run(){
        if(closed || !panelAttached || !opened || chromeAlpha<.99f)return;
        refreshStates();root.postDelayed(this,500);
    }};

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
        leftLamp=style.new LampDrawable(height,false);rightLamp=style.new LampDrawable(height,true);
        left=wing(false);right=wing(true);
        leftHandle=new EdgeHandle(false);rightHandle=new EdgeHandle(true);
        leftHeader=header(left,false);rightHeader=header(right,true);
        leftContent=column(left,false);rightContent=column(right,true);
        toolRows=new LinearLayout(context);toolRows.setOrientation(LinearLayout.VERTICAL);
        ScrollView toolScroll=new ScrollView(context);toolScroll.setFillViewport(true);toolScroll.setVerticalScrollBarEnabled(false);toolScroll.addView(toolRows);
        toolScroll.setContentDescription("工作栏全部功能，上下滑动浏览");
        leftContent.addView(toolScroll,new LinearLayout.LayoutParams(-1,0,1));
        apps=new LinearLayout(context);apps.setOrientation(LinearLayout.VERTICAL);
        ScrollView appScroll=new ScrollView(context);appScroll.setVerticalScrollBarEnabled(false);appScroll.addView(apps);
        rightContent.addView(appScroll,new LinearLayout.LayoutParams(-1,0,1));
        brightness=level(left,false);volume=level(right,true);
        layoutContent(owner.dp(4));
        apply(0);refreshTools();refreshApps();
    }
    FrameLayout wing(boolean mirror){
        FrameLayout wing=new FrameLayout(context);
        wing.setBackground(mirror?rightLamp:leftLamp);
        FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams((int)Math.ceil(height*.95f),height,Gravity.TOP|(mirror?Gravity.RIGHT:Gravity.LEFT));
        root.addView(wing,lp);return wing;
    }
    LinearLayout column(FrameLayout wing,boolean mirror){
        LinearLayout column=new LinearLayout(context);column.setOrientation(LinearLayout.VERTICAL);
        column.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
        FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(1,-1,Gravity.TOP|(mirror?Gravity.RIGHT:Gravity.LEFT));
        lp.leftMargin=mirror?0:owner.dp(6);lp.rightMargin=mirror?owner.dp(6):0;
        wing.addView(column,lp);return column;
    }
    LinearLayout header(FrameLayout wing,boolean mirror){
        LinearLayout row=column(wing,mirror);row.setOrientation(LinearLayout.HORIZONTAL);return row;
    }
    LevelControl level(FrameLayout wing,boolean mirror){
        LevelControl value=new LevelControl(owner,!mirror);
        value.setSidebar(mirror,()->opened && progress>.99f && usable(),()->runAction(()->owner.systemAction(
                new android.content.Intent(mirror?android.provider.Settings.Panel.ACTION_VOLUME:android.provider.Settings.ACTION_DISPLAY_SETTINGS))));
        wing.addView(value,new FrameLayout.LayoutParams(owner.dp(44),owner.dp(64),Gravity.TOP|(mirror?Gravity.RIGHT:Gravity.LEFT)));
        return value;
    }
    void layoutContent(int safeTop){
        // Larger stock stairs follow the sloping lamp edge, just below its
        // arrow bend. Keep the calibrated 48:83 silhouette and mirror it.
        int top=Math.max(safeTop+owner.dp(16),Math.round(height*.34f));
        int stairHeight=Math.min(owner.dp(86),Math.round(height*.40f));
        int stairWidth=Math.round(stairHeight*48f/83f);
        int inset=style.stairInset(height,top,stairWidth,stairHeight,owner.dp(8));
        while(inset<owner.dp(66) && stairHeight>owner.dp(44)){
            stairHeight-=owner.dp(2);stairWidth=Math.round(stairHeight*48f/83f);
            inset=style.stairInset(height,top,stairWidth,stairHeight,owner.dp(8));
        }
        int symbolSize=Math.max(owner.dp(10),Math.round(stairHeight*18f/83f));
        // Use the space up to the real control input band and stock shell.
        // Body grids keep the enlarged two-column cells. The three-entry header
        // can use the wider shell above the level-control input bands.
        int bottom=height-owner.dp(6);
        int shellLimit=style.stairInset(height,safeTop,0,Math.max(1,bottom-safeTop),owner.dp(4));
        int controlLimit=inset-symbolSize/2-owner.dp(4);
        int available=Math.min(shellLimit,controlLimit)-owner.dp(6);
        int nextCellSize=available/2,nextIconSize=Math.min(owner.dp(40),nextCellSize-owner.dp(8));
        int headerLimit=style.stairInset(height,safeTop,0,Math.max(1,nextCellSize),owner.dp(4));
        int headerWidth=Math.min(nextCellSize*3,headerLimit-owner.dp(6));
        if(available<owner.dp(56) || headerWidth/3<nextIconSize+owner.dp(4)){
            String reason="原厂侧栏可用宽度不足："+available;
            if(cellSize==0)throw new IllegalStateException(reason);
            // A later cutout change must not crash SystemUI or leave partially
            // applied geometry over the level controls.
            StepRuntime.diagnostic("SIDEBAR_INSETS_UNAVAILABLE",reason);setOpen(false);return;
        }
        contentTop=safeTop;cellSize=nextCellSize;iconSize=nextIconSize;
        for(LinearLayout header:new LinearLayout[]{leftHeader,rightHeader}){
            FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)header.getLayoutParams();
            lp.width=headerWidth;lp.height=cellSize;lp.topMargin=contentTop;header.setLayoutParams(lp);
            resizeRow(header);
        }
        for(LevelControl level:new LevelControl[]{brightness,volume}){
            level.sidebarGeometry(stairWidth,stairHeight,symbolSize);
            FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)level.getLayoutParams();
            lp.topMargin=top-owner.dp(16);lp.height=owner.dp(16)+stairHeight+owner.dp(2)+symbolSize;
            // Centre the stock symbol on the stair's straight outer edge so
            // the widened symbol does not cross the descending lamp edge.
            lp.width=Math.max(owner.dp(44),stairWidth+symbolSize/2);
            if(level==brightness)lp.leftMargin=inset-symbolSize/2;
            else lp.rightMargin=inset-symbolSize/2;
            level.setLayoutParams(lp);
        }
        for(LinearLayout column:new LinearLayout[]{leftContent,rightContent}){
            FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)column.getLayoutParams();
            lp.width=cellSize*2;lp.height=Math.max(1,bottom-contentTop-cellSize);lp.topMargin=contentTop+cellSize;column.setLayoutParams(lp);
        }
        resizeGrid(toolRows);resizeGrid(apps);
    }
    void resizeGrid(LinearLayout grid){
        for(int r=0;r<grid.getChildCount();r++){
            resizeRow((LinearLayout)grid.getChildAt(r));
        }
    }
    void resizeRow(LinearLayout row){
        boolean header=row==leftHeader || row==rightHeader;
        int captionHeight=0;
        if(!header)for(int c=0;c<row.getChildCount();c++)
            if(row.getChildAt(c) instanceof ToolbarItem item)captionHeight=Math.max(captionHeight,item.captionHeight());
        // Measure the single text line at the user's font scale. Text never
        // consumes space reserved for the large icon.
        int rowHeight=header?cellSize:cellSize+owner.dp(2)+captionHeight;
        for(int c=0;c<row.getChildCount();c++){
            View cell=row.getChildAt(c);cell.setLayoutParams(new LinearLayout.LayoutParams(0,rowHeight,1));
            if(cell instanceof ToolbarItem item)item.size(header,captionHeight);
        }
    }
    void refreshTools(){
        leftHeader.removeAllViews();toolRows.removeAllViews();toolCount=0;cells.removeIf(c->c.app==null);
        headerCell(leftHeader,toolCell("最近媒体","media",()->owner.openRecent(0)).view);
        headerCell(leftHeader,toolCell("最近文件","files",()->owner.openRecent(1)).view);
        headerCell(leftHeader,toolCell("剪贴板","clipboard",()->owner.openRecent(2)).view);
        tool("退出 Step","workspaceExit",()->owner.host.close("手动退出工作区"));
        List<WorkspaceActions.Tool> remaining=new ArrayList<>(owner.tools.availableTools(leftHandle));
        toolSlot(remaining,"mainLeft","mainRight");
        toolSlot(remaining,"capture");toolSlot(remaining,"record");
        toolSlot(remaining,"swapTop");toolSlot(remaining,"moveDown","moveUp");
        toolSlot(remaining,"wallpaper");toolSlot(remaining,"workspace");
        // Conditional task tools remain reachable below the four fixed grid rows.
        // App editing is already available from the right-side add/long press.
        for(WorkspaceActions.Tool item:remaining)
            if(!"workspaceExit".equals(item.glyph) && !"apps".equals(item.glyph))tool(item.label,item.glyph,item.open);
        finishGrid(toolRows,toolCount);
        refreshStates();
    }
    void toolSlot(List<WorkspaceActions.Tool> remaining,String... names){
        for(Iterator<WorkspaceActions.Tool> items=remaining.iterator();items.hasNext();){
            WorkspaceActions.Tool item=items.next();
            if(Arrays.asList(names).contains(item.glyph)){
                items.remove();tool(item.label,item.glyph,item.open);return;
            }
        }
        // Missing native capability leaves an inert slot, never a fake action
        // or a shifted position for the remaining fixed controls.
        View space=new View(context);space.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        addCell(toolRows,space,toolCount++);
    }
    void tool(String text,String icon,Runnable action){
        addCell(toolRows,toolCell(text,icon,action).view,toolCount++);
    }
    Cell toolCell(String text,String name,Runnable action){
        StepGlyph glyph=icon(name,text);
        ToolbarItem entry=new ToolbarItem(glyph,toolCaption(name,text),text);
        Cell cell=new Cell(entry,text,name,null,glyph);cells.add(cell);
        entry.setOnClickListener(v->{refreshStates();if(progress>.99f && entry.isEnabled()){
            boolean moving="swapTop".equals(name)||"moveUp".equals(name)||"moveDown".equals(name);
            if(moving && owner.host.toolbarAutoCollapse){
                // Close while the task lease/capture is prepared, rather than adding
                // a complete 300ms panel wait before a second animation can start.
                if(!usable())return;
                try{owner.checkAction();setOpen(false);action.run();}catch(RuntimeException error){owner.note(error);}
            }else runAction(action);
        }});
        return cell;
    }
    StepGlyph icon(String name,String label){
        StepGlyph glyph=new StepGlyph(context,name,label,()->{});glyph.setFixedInk(0xffededed);
        glyph.setMaxIconSizeDp(40);
        glyph.setClickable(false);glyph.setFocusable(false);glyph.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return glyph;
    }
    String toolCaption(String name,String fallback){
        return switch(name){
            case "workspaceExit" -> "退出Step";
            case "workspace" -> "布局设置";
            case "apps" -> "快捷应用";
            case "wallpaper" -> "顶部壁纸";
            case "moveUp" -> "移到顶区";
            case "moveDown" -> "移到主区";
            case "swapTop" -> "主顶交换";
            case "mainLeft" -> "主区左移";
            case "mainRight" -> "主区右移";
            case "capture" -> "截图";
            case "record" -> "录屏";
            case "landscape" -> "横屏切换";
            case "edgeWindow" -> "小窗贴边";
            case "wallet" -> "系统钱包";
            default -> fallback;
        };
    }
    final class ToolbarItem extends FrameLayout {
        final View symbol;final TextView caption;
        ToolbarItem(View symbol,String text,String description){
            super(context);this.symbol=symbol;setBackground(tileBackground());
            setContentDescription(description);setTooltipText(description);setFocusable(true);
            addView(symbol);
            caption=StepMaterial.label(context,text,8,false);caption.setTextColor(0xffededed);
            caption.setSingleLine(true);caption.setEllipsize(android.text.TextUtils.TruncateAt.MARQUEE);
            caption.setMarqueeRepeatLimit(-1);caption.setSelected(true);
            caption.setShadowLayer(owner.dp(1),0,owner.dp(1)*.5f,0xcc000000);
            caption.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            addView(caption);
        }
        int captionHeight(){
            Rect insets=new Rect();getBackground().getPadding(insets);
            int width=Math.max(1,cellSize-insets.left-insets.right);
            caption.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            return caption.getMeasuredHeight();
        }
        void size(boolean header,int captionHeight){
            FrameLayout.LayoutParams image=new FrameLayout.LayoutParams(iconSize,iconSize,Gravity.TOP|Gravity.CENTER_HORIZONTAL);
            image.topMargin=(cellSize-iconSize)/2;symbol.setLayoutParams(image);
            caption.setVisibility(header?View.GONE:View.VISIBLE);
            FrameLayout.LayoutParams text=new FrameLayout.LayoutParams(-1,captionHeight,Gravity.TOP);
            text.topMargin=(cellSize+iconSize)/2+owner.dp(2);caption.setLayoutParams(text);
        }
    }
    void addCell(LinearLayout grid,View cell,int index){
        LinearLayout row;
        if(index%2==0){row=new LinearLayout(context);grid.addView(row,-1,-2);}
        else row=(LinearLayout)grid.getChildAt(grid.getChildCount()-1);
        row.addView(cell,new LinearLayout.LayoutParams(0,cellSize,1));resizeRow(row);
    }
    void headerCell(LinearLayout header,View cell){
        header.addView(cell,new LinearLayout.LayoutParams(0,cellSize,1));
        if(cell instanceof ToolbarItem item)item.size(true,0);
    }
    void appCell(View cell,int index){
        if(index<3)headerCell(rightHeader,cell);else addCell(apps,cell,index-3);
    }
    void finishGrid(LinearLayout grid,int count){
        if(count%2!=0){
            View space=new View(context);space.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            addCell(grid,space,count);
        }
    }
    Drawable tileBackground(){
        GradientDrawable base=new GradientDrawable();base.setColor(Color.TRANSPARENT);
        GradientDrawable selected=new GradientDrawable();selected.setColor(0x405f4717);selected.setCornerRadius(owner.dp(6));selected.setStroke(owner.dp(1),0xffd7ad42);
        GradientDrawable mask=new GradientDrawable();mask.setColor(Color.WHITE);mask.setCornerRadius(owner.dp(6));
        StateListDrawable states=new StateListDrawable();states.addState(new int[]{android.R.attr.state_selected},selected);states.addState(new int[0],base);
        return new InsetDrawable(new RippleDrawable(android.content.res.ColorStateList.valueOf(0x55d7ad42),states,mask),owner.dp(1));
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
    boolean handleContains(float x,float y){return x>=0 && x<width && y>=edgeY && y<edgeY+edgeHeight && (x<edgeWidth || x>=width-edgeWidth);}
    boolean ownsGesture(float x,float y){return panelAttached || edgeTracking || handleContains(x,y);}
    int edgeStart(float x,float y){
        if(!usable() || panelAttached || y<0 || y>=height || x<0 || x>=width)return -1;
        return x<owner.dp(24)?0:x>=width-owner.dp(24)?1:-1;
    }
    void setChromeAlpha(float value){
        if(closed)return;chromeAlpha=value;
        if(value<.99f){stopLamp();root.removeCallbacks(states);brightness.releasePreview();volume.releasePreview();}
        else if(panelAttached && opened){if(progress==1)startLamp();root.removeCallbacks(states);root.post(states);}
        for(View view:new View[]{leftHandle,rightHandle,root})if(registered.contains(view)){
            WindowManager.LayoutParams lp=(WindowManager.LayoutParams)view.getLayoutParams();lp.alpha=value;
            if(value<.99f)lp.flags|=WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE;else lp.flags&=~WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE;
            windows.updateViewLayout(view,lp);
        }
    }
    void afterClose(Runnable action){if(!usable())return;afterClose=action;setOpen(false);}
    void runAction(Runnable action){
        if(!usable())return;
        if(owner.host.toolbarAutoCollapse){afterClose(action);return;}
        try{owner.checkAction();action.run();}catch(RuntimeException error){owner.note(error);}
        // Keep the existing panel and its scroll position. Refresh task-dependent
        // entries only after this operation has released its input ownership.
        refreshStates();
    }
    void setOpen(boolean open){
        if(closed || open && !usable())return;
        if(open)afterClose=null;
        if(opened==open && (animator!=null || open && panelAttached && progress==1))return;
        opened=open;stopMotion();
        stopLamp();root.removeCallbacks(states);
        boolean firstFrame=open && !panelAttached;
        if(open && !panelAttached){
            // Pinned icons are already prepared and refreshed by the catalog /
            // preference callbacks. Rebuilding them here makes icons pop in
            // during the slide and adds work before the first window frame.
            try{refreshTools();leftLamp.phase(0);rightLamp.phase(0);apply(0);add(root,params(width,height,0,0,TITLE));panelAttached=true;}
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
        motion.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){
            if(animator!=a)return;animator=null;apply(target);
            if(opened && target==1){startLamp();root.removeCallbacks(states);root.post(states);}finish();
        }});
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
    void startLamp(){
        if(closed || !opened || !panelAttached || chromeAlpha<.99f || leftLamp.phase>=1)return;
        ValueAnimator light=ValueAnimator.ofFloat(leftLamp.phase,1);lampAnimator=light;
        light.setDuration(Math.max(1,Math.round(GameSpacePanelMotion.LAMP_DURATION_MS*(1-leftLamp.phase))));
        light.setInterpolator(new AccelerateDecelerateInterpolator());
        light.addUpdateListener(a->{if(lampAnimator==a){float phase=(Float)a.getAnimatedValue();leftLamp.phase(phase);rightLamp.phase(phase);}});
        light.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){if(lampAnimator==a)lampAnimator=null;}});light.start();
    }
    void stopLamp(){ValueAnimator old=lampAnimator;lampAnimator=null;if(old!=null)old.cancel();}
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
        if(closed || apps==null)return;int generation=++appGeneration;rightHeader.removeAllViews();apps.removeAllViews();cells.removeIf(c->c.app!=null);
        List<QuickCatalog.App> list=new ArrayList<>();
        if(owner.host.pinned!=null)for(String key:owner.host.pinned)for(QuickCatalog.App app:owner.catalog)if(key.equals(app.key)){list.add(app);break;}
        for(int i=0;i<list.size();i++){
            QuickCatalog.App app=list.get(i);
            ImageView image=new ImageView(context);image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            ToolbarItem cell=new ToolbarItem(image,app.label,"打开 "+app.label);
            Cell state=new Cell(cell,app.label,"",app,null);cells.add(state);
            try{state.available=owner.launcher!=null && owner.launcher.isActivityEnabled(app.component,app.info.getUser());}
            catch(RuntimeException unavailable){state.available=false;}
            cell.setOnClickListener(v->{refreshStates();if(progress>.99f && cell.isEnabled())runAction(()->owner.openApp(app));});
            cell.setOnLongClickListener(v->{runAction(owner::edit);return true;});
            appCell(cell,i);
            owner.worker.execute(()->{try{Drawable drawable=app.info.getBadgedIcon(context.getResources().getDisplayMetrics().densityDpi);
                owner.host.main.post(()->{if(!closed && generation==appGeneration && drawable!=null)image.setImageDrawable(drawable);});
            }catch(RuntimeException|LinkageError ignored){}});
        }
        // The only add entry follows the last pinned app, including an empty list.
        ToolbarItem add=new ToolbarItem(icon("add","添加应用启动图标"),"添加应用","添加应用启动图标");
        add.setEnabled(!owner.catalog.isEmpty());add.setAlpha(add.isEnabled()?1f:.45f);
        add.setOnClickListener(v->{if(progress>.99f)runAction(owner::edit);});
        appCell(add,list.size());finishGrid(apps,Math.max(0,list.size()+1-3));
        while(rightHeader.getChildCount()<3){
            View space=new View(context);space.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);headerCell(rightHeader,space);
        }
        refreshStates();
    }
    final class Cell {
        final FrameLayout view;final String label,name;final QuickCatalog.App app;final StepGlyph glyph;final TextView badge;
        boolean available=true;
        Cell(FrameLayout view,String label,String name,QuickCatalog.App app,StepGlyph glyph){
            this.view=view;this.label=label;this.name=name;this.app=app;this.glyph=glyph;
            badge=StepMaterial.label(context,"",9,true);badge.setTextColor(0xffefd28b);
            badge.setIncludeFontPadding(false);
            GradientDrawable badgeBackground=new GradientDrawable();badgeBackground.setColor(0xe6000000);badgeBackground.setCornerRadius(owner.dp(2));
            badge.setBackground(badgeBackground);badge.setPadding(owner.dp(1),0,owner.dp(1),0);
            badge.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);badge.setVisibility(View.GONE);
            FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.RIGHT);view.addView(badge,lp);
        }
        void show(boolean enabled,boolean active,String note,String mark){
            view.setEnabled(enabled);view.setAlpha(enabled?1f:.40f);view.setSelected(active);
            // Parent selection communicates task placement. Keep the independent
            // caption marquee running when an app leaves its selected position.
            if(view instanceof ToolbarItem item)item.caption.setSelected(true);
            view.setStateDescription(note);view.setContentDescription(label+"，"+note);view.setTooltipText(label+" · "+note);
            if(glyph!=null)glyph.setFixedInk(active?0xffefd28b:0xffededed);
            if(!mark.contentEquals(badge.getText()))badge.setText(mark);badge.setVisibility(mark.isEmpty()?View.GONE:View.VISIBLE);badge.bringToFront();
        }
    }
    void refreshStates(){
        if(closed)return;boolean ready=usable();
        java.util.LinkedHashMap<String,java.util.LinkedHashSet<String>> placements=new java.util.LinkedHashMap<>();
        try{synchronized(owner.host.organizerLock){
            remember(placements,owner.host.focused(),"主区");
            for(int slot=0;slot<=WorkspaceRoutes.NAVIGATION;slot++){
                if(slot>=owner.host.visibleSlots && slot<WorkspaceRoutes.UPPER)continue;
                int id=WorkspaceRoutes.taskAt(owner.host,slot);if(id<0)continue;
                android.app.ActivityManager.RunningTaskInfo task=owner.host.info(id);
                if(task!=null && task.taskId==id)remember(placements,task,slot==WorkspaceRoutes.NAVIGATION?"导航":slot==WorkspaceRoutes.UPPER?"顶部":"副区 "+(slot+1));
            }
        }}catch(RuntimeException|LinkageError unknown){placements.clear();}
        for(Cell cell:cells){
            boolean enabled=ready && cell.available,active=false;String note="可用",mark="";
            if(cell.app!=null){
                String key=WorkspaceUsers.id(cell.app.info.getUser())+":"+cell.app.component.getPackageName();
                java.util.Set<String> positions=placements.get(key);
                if(positions!=null && !positions.isEmpty()){
                    active=true;note="已在"+android.text.TextUtils.join("、",positions);
                    String first=positions.iterator().next();mark=positions.size()>1?"多":first.startsWith("副区 ")?first.substring(3):first.substring(0,1);
                }else note="打开应用";
            }else if("record".equals(cell.name)){
                int state=NativeTiles.read(owner.userId,"videoscreen");enabled&=state>0;active=state==2;
                note=state<1?"录屏当前不可用":active?"正在录屏":"开始录屏";mark=active?"●":"";
            }else if("wallet".equals(cell.name)){enabled&=NativeTiles.read(owner.userId,"wallet")>0;}
            else if("workspace".equals(cell.name)){note=owner.host.visibleSlots+" 个侧格";mark=String.valueOf(owner.host.visibleSlots);}
            else if("moveDown".equals(cell.name)){enabled&=owner.host.upperId>=0 || owner.host.upperAppId>=0 || owner.host.upperNavigationId>=0;note=enabled?"顶部应用可归还主区":"顶部没有应用";}
            else if("moveUp".equals(cell.name)){enabled&=owner.host.upperEnabled && owner.host.upperAppId<0;note=!owner.host.upperEnabled?"顶部工作区已关闭":enabled?"收纳当前主应用":"顶部已有应用";}
            else if("swapTop".equals(cell.name)){enabled&=owner.host.canSwapMainTop();note=enabled?"交换主区与顶部原任务":"请先在主区和顶区打开可交换的应用";}
            else if("mainLeft".equals(cell.name)||"mainRight".equals(cell.name)){note="主区当前在"+(owner.host.leftSide?"右侧":"左侧");}
            if(!enabled)note=!ready?"工作区当前不可操作":cell.available?note.equals("可用")?"当前不可用":note:"应用当前不可用";
            cell.show(enabled,active,note,mark);
        }
    }
    void remember(java.util.Map<String,java.util.LinkedHashSet<String>> map,android.app.ActivityManager.RunningTaskInfo task,String place){
        if(task==null || !LiveWorkspace.root(task) || LiveWorkspace.number(task,"displayId")!=0 || task.baseActivity==null)return;
        int user=LiveWorkspace.number(task,"userId");if(!WorkspaceUsers.allows(context,owner.userId,user))return;
        String key=user+":"+task.baseActivity.getPackageName();map.computeIfAbsent(key,k->new java.util.LinkedHashSet<>()).add(place);
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
        stopMotion();stopLamp();root.removeCallbacks(states);
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
        float downX,downY;boolean rejected,touchTracking,levelGesture;
        PanelRoot(){super(context);setContentDescription("侧边工作栏，向两侧外滑或点击中间收起");setOnClickListener(v->setOpen(false));setAccessibilityPaneTitle("侧边工作栏");}
        @Override public WindowInsets onApplyWindowInsets(WindowInsets insets){
            int safe=owner.dp(4);
            if(insets.getDisplayCutout()!=null)safe=Math.max(safe,insets.getDisplayCutout().getSafeInsetTop());
            if(contentTop!=safe)layoutContent(safe);
            return super.onApplyWindowInsets(insets);
        }
        boolean levelAt(float x,float y){
            Rect bounds=new Rect();
            for(LevelControl level:new LevelControl[]{brightness,volume}){
                if(level==null || level.getVisibility()!=View.VISIBLE)continue;
                level.getDrawingRect(bounds);offsetDescendantRectToMyCoords(level,bounds);
                if(bounds.contains((int)x,(int)y))return true;
            }
            return false;
        }
        @Override public void requestDisallowInterceptTouchEvent(boolean disallow){
            // A ScrollView stopping an active fling requests exclusive input on
            // DOWN. Keep observing direction so the next outward gesture can
            // close the wings; vertical gestures are rejected below and stay in
            // the scroll child, which still receives its normal event stream.
            super.requestDisallowInterceptTouchEvent(levelGesture && disallow);
        }
        @Override public boolean dispatchTouchEvent(MotionEvent e){
            int action=e.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){touchTracking=true;levelGesture=levelAt(e.getX(),e.getY());}
            try{return super.dispatchTouchEvent(e);}
            finally{
                if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){
                    touchTracking=false;levelGesture=false;post(WorkspaceSideToolbar.this::finish);
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
            if(levelGesture)return false;
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
