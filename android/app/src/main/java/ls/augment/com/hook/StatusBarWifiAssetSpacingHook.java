package ls.augment.com.hook;

import android.graphics.Rect;
import android.graphics.RectF;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import java.util.*;
import ls.augment.com.*;

/** Isolated full-canvas cells in the real OEM pair. Never creates or reparents an icon. */
final class StatusBarWifiAssetSpacingHook {
    private static final Map<ViewGroup,Pair> PAIRS=new WeakHashMap<>();
    private static final Set<View> PENDING=Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<View,Long> SIGNALS=new WeakHashMap<>();
    private StatusBarWifiAssetSpacingHook(){}
    static void changed(View child){
        if(child==null||!StatusBarWifiSpacingPolicy.member(StatusBarAssetsHook.semanticId(child)))return;
        StatusBarAssetsHook.LayoutRendering rendering=StatusBarAssetsHook.layoutRendering(child);
        long signature=rendering.generation*31+(rendering.current?1:0);signature=signature*31+(rendering.series?1:0);signature=signature*31+System.identityHashCode(child.getParent());signature=signature*31+child.getVisibility();
        if(SIGNALS.getOrDefault(child,Long.MIN_VALUE)==signature)return;SIGNALS.put(child,signature);
        if(!PENDING.add(child))return;
        child.post(()->{PENDING.remove(child);refreshOwner(child);});
    }
    private static void refreshOwner(View child){for(View at=child;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(StatusBarIconLayoutHook.composite(at)){StatusBarIconLayoutHook.refreshComposite(at);at.requestLayout();at.invalidate();break;}}
    static boolean allowArtwork(View view){
        if(view==null||!StatusBarWifiSpacingPolicy.member(StatusBarAssetsHook.semanticId(view)))return true;
        Pair pair=view.getParent() instanceof ViewGroup?PAIRS.get(view.getParent()):null;
        // The first decoded frame must not flash over its sibling before a safe plan exists.
        if(pair==null||!pair.active||pair.plan==null)return false;
        int x=view==pair.signal?pair.plan.signalX:pair.plan.activityX,y=view==pair.signal?pair.plan.signalY:pair.plan.activityY;
        if(!StatusBarGridHook.configuredIconLayout(pair.parent)
                &&(pair.parent.getWidth()<pair.plan.width||pair.parent.getHeight()<pair.plan.height))return false;
        return view.getWidth()==pair.width()&&view.getHeight()==pair.height()&&Math.abs(view.getLeft()-x)<=1&&Math.abs(view.getTop()-y)<=1;
    }
    static Pair pair(View view){
        if(view instanceof ViewGroup){Pair direct=PAIRS.get(view);if(direct!=null&&direct.series)return direct;
            ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){Pair result=pair(group.getChildAt(i));if(result!=null)return result;}}
        return null;
    }
    static void prepareGrid(View composite,float scale){
        if(!Float.isFinite(scale)||scale<=0)return;
        Pair p=pair(composite);if(p!=null&&Math.abs(p.scale-scale)>.0001f){p.scale=scale;p.replan();StatusBarIconLayoutHook.refreshComposite(composite);}
    }
    /** null = no proven custom series; original-anchor code remains the owner. */
    static int[] margins(View child,View signal,View activity,String structural){
        ViewGroup parent=(ViewGroup)child.getParent();Pair pair=PAIRS.get(parent);
        if(!parent.isAttachedToWindow())return null;
        StatusBarAssetsHook.LayoutRendering s=StatusBarAssetsHook.layoutRendering(signal),a=StatusBarAssetsHook.layoutRendering(activity);
        if(!s.series&&!a.series){if(pair!=null){pair.setActive(false);pair.series=false;}return null;}
        if(pair==null||pair.signal!=signal||pair.activity!=activity){if(pair!=null)pair.close();pair=new Pair(parent,signal,activity);PAIRS.put(parent,pair);}
        pair.series=true;pair.generation=Math.max(s.generation,a.generation);
        if(!structural.equals("native")||!StatusBarIconLayoutHook.zeroNativeMargins(signal)||!StatusBarIconLayoutHook.zeroNativeMargins(activity)){
            pair.setActive(false);pair.plan=null;pair.maxWidth=pair.maxHeight=0;pair.reason="layout";pair.publish();return new int[4];
        }
        pair.replan();
        if(!StatusBarGridHook.configuredIconLayout(parent)){
            pair.scale=1;pair.replan();int[] capacity=nativeBudget(pair);pair.accept(capacity[0],capacity[1],"native_slot");
        }
        pair.publish();return pair.active?(child==signal?pair.plan.signalMargins:pair.plan.activityMargins):new int[4];
    }
    static Rect bounds(View view){Pair p=PAIRS.get(view);return p!=null&&p.series&&p.plan!=null&&(p.active||StatusBarGridHook.configuredIconLayout(view))?new Rect(0,0,p.plan.width,p.plan.height):null;}
    static boolean includeBoundary(View child,RectF bounds){
        Pair p=child.getParent() instanceof ViewGroup?PAIRS.get(child.getParent()):null;
        // The pair's complete reservation is returned once by bounds(parent).
        return p!=null&&p.series;
    }
    static void gridRejected(View root){for(Pair p:new ArrayList<>(PAIRS.values()))if(p.series&&below(p.parent,root)){p.setActive(false);p.reason="capacity";p.publish();refreshOwner(p.parent);}}
    static boolean below(View child,View root){for(View at=child;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(at==root)return true;return false;}
    interface Fits {boolean test(float width,float height);}
    /** Complete Grid snapshot supplies this predicate; trial work never mutates a View. */
    static void gridBudget(Pair pair,long signature,Fits fits){
        if(pair==null||!pair.series||pair.plan==null)return;
        if(pair.budgetSignature==signature){pair.accept(pair.maxWidth,pair.maxHeight,"grid_slot");pair.publish();return;}
        pair.budgetSignature=signature;
        StatusBarWifiAssetSpacingPolicy.Plan zero=pair.make(StatusBarIconSpacingSpec.ZERO,StatusBarIconSpacingSpec.ZERO);
        int maxW=0,maxH=0;
        if(fits.test(zero.width,zero.height)){
            // Find a conservative rectangle: its far corner must itself fit.
            maxH=maximum(zero.height,zero.height+Math.round(48*pair.units()),h->fits.test(zero.width,h));
            final int height=maxH;maxW=maximum(zero.width,zero.width+Math.round(96*pair.units()),w->fits.test(w,height));
        }
        pair.accept(maxW,maxH,"grid_slot");if(pair.active&&!fits.test(pair.plan.width,pair.plan.height)){pair.setActive(false);pair.reason="capacity";}
        pair.publish();
    }
    private interface IntFits {boolean test(int value);}
    private static int maximum(int low,int high,IntFits fits){while(low<high){int mid=low+(high-low+1)/2;if(fits.test(mid))low=mid;else high=mid-1;}return low;}
    /** Known CCHeader only; unavailable or unmeasured ancestors never imply unlimited capacity. */
    private static int[] nativeBudget(Pair pair){
        pair.widthLimitOrigin="none";
        int vertical=StatusBarHeaderSpacingHook.assetVerticalCapacity(pair.parent);
        if(vertical<0)return nativeFailure(pair,"unknown_vertical",vertical,0,-1,pair.parent.getParent() instanceof View?(View)pair.parent.getParent():null,pair.parent,null);
        int consumed=0,limit=Integer.MAX_VALUE;View branch=pair.parent;boolean bounded=false;
        for(View at=pair.parent.getParent() instanceof View?(View)pair.parent.getParent():null;at instanceof ViewGroup;at=at.getParent() instanceof View?(View)at.getParent():null){
            ViewGroup parent=(ViewGroup)at;if(parent.getWidth()<=0||parent.getHeight()<=0)return nativeFailure(pair,"unmeasured",vertical,consumed,limit,parent,branch,null);
            ViewGroup.LayoutParams lp=parent.getLayoutParams();boolean wraps=lp!=null&&lp.width==ViewGroup.LayoutParams.WRAP_CONTENT;
            int nativeWidth=StatusBarIconLayoutHook.nativeWidthLimit(parent);
            // NX809J's WifiViewBinder writes the original single-canvas width to
            // this exact outer View on every WifiIcon emission. It is a content
            // envelope, not the row's available space. SizeRecord adds the proven
            // cell extent and rebases later native writes; all outer fixed limits
            // and occupied siblings below still constrain that extension.
            wraps|=nativeWifiEnvelope(pair,parent,branch,nativeWidth);
            int available=nativeWidth-parent.getPaddingLeft()-parent.getPaddingRight();
            if(parent.getClass().getName().equals("com.android.systemui.statusbar.phone.StatusIconContainer")){
                NativeRowCost cost=NativeRowCost.read(parent,branch);
                if(cost.reason!=null)return nativeFailure(pair,cost.reason,vertical,consumed,limit,parent,branch,cost.blocker);
                consumed+=cost.reserved;
            }else if(parent instanceof LinearLayout&&((LinearLayout)parent).getOrientation()==LinearLayout.HORIZONTAL){
                for(int i=0;i<parent.getChildCount();i++){View sibling=parent.getChildAt(i);if(sibling==branch||sibling.getVisibility()==View.GONE)continue;consumed+=sibling.getMeasuredWidth()+horizontalMargins(sibling);}
            }else{
                // Fixed native anchors: use the free interval around the current branch.
                int left=parent.getPaddingLeft(),right=nativeWidth-parent.getPaddingRight();
                RectF branchRect=budgetRect(branch,0);
                if(parent.getClass().getName().equals("com.zte.controlcenter.widget.CCHeaderView")){
                    View band=NotificationAppearanceHook.ownedIconBand(parent,branch);
                    if(band!=null&&below(pair.parent,band))branchRect=managedBandRect(pair,band,parent);
                }
                if(branchRect==null||branchRect.isEmpty())return nativeFailure(pair,"unmeasured",vertical,consumed,limit,parent,branch,null);
                for(int i=0;i<parent.getChildCount();i++){View sibling=parent.getChildAt(i);if(sibling==branch||sibling.getVisibility()==View.GONE)continue;
                    RectF occupied=budgetRect(sibling,0);
                    if(occupied==null)return nativeFailure(pair,"unmeasured",vertical,consumed,limit,parent,branch,sibling);
                    // VISIBLE is a layout flag, not proof of occupied area. The OEM
                    // zero-height footer is laid out and empty, unlike an unknown View.
                    if(occupied.isEmpty()||occupied.bottom<=branchRect.top||occupied.top>=branchRect.bottom)continue;
                    if(occupied.right<=branchRect.left)left=Math.max(left,(int)Math.ceil(occupied.right));
                    else if(occupied.left>=branchRect.right)right=Math.min(right,(int)Math.floor(occupied.left));
                    else return nativeFailure(pair,"overlap",vertical,consumed,limit,parent,branch,sibling);
                }
                if(!wraps)available=Math.max(0,right-left);
            }
            consumed+=parent.getPaddingLeft()+parent.getPaddingRight()+horizontalMargins(branch);
            if(!wraps){int next=available-consumed;if(next<limit){pair.widthLimitOrigin="nativeWidth="+nativeWidth+",available="+available+",consumed="+consumed+",limit="+next+","+budgetView(parent);}limit=Math.min(limit,next);bounded=true;}
            if(parent.getClass().getName().equals("com.zte.controlcenter.widget.CCHeaderView")){
                pair.budgetDiagnostic.capture("bounded",vertical,consumed,limit,budgetView(parent),budgetView(branch),null,pair.widthLimitOrigin);
                return new int[]{bounded?Math.max(0,limit):0,pair.height()+vertical};
            }
            branch=parent;
        }
        return nativeFailure(pair,"no_header",vertical,consumed,limit,branch.getParent() instanceof View?(View)branch.getParent():null,branch,null);
    }
    /** Project the complete native icon strip, not its full-height right column.
     * Include the pending plan before the real pair/row have grown: checking only
     * the current 42px strip could admit vertical edges into the clock below it. */
    private static RectF managedBandRect(Pair pair,View band,ViewGroup header){
        if(pair.plan==null||pair.plan.width<=0||pair.plan.height<=0||!(band.getParent() instanceof View))return null;
        RectF nativeBand=budgetRect(band,0);
        if(nativeBand==null||nativeBand.isEmpty())return null;
        View parent=(View)band.getParent();nativeBand.offset(-parent.getScrollX(),-parent.getScrollY());
        nativeBand=projectReservation(parent,header,nativeBand);
        RectF pending=projectReservation(pair.parent,header,new RectF(0,0,
                Math.max(pair.parent.getWidth(),pair.plan.width),Math.max(pair.parent.getHeight(),pair.plan.height)));
        if(nativeBand==null||pending==null)return null;
        nativeBand.union(pending);return nativeBand;
    }
    /** Retain resting allocation as well as transformed pixels at every ancestor.
     * A nonfinite/unknown transform or incomplete path never donates capacity. */
    private static RectF projectReservation(View at,View ancestor,RectF box){
        for(int depth=0;at!=ancestor;depth++){
            if(depth>12||!at.isLaidOut()||at.getWidth()<=0||at.getHeight()<=0||!(at.getParent() instanceof View))return null;
            View parent=(View)at.getParent();RectF transformed=new RectF(box);at.getMatrix().mapRect(transformed);
            if(!Float.isFinite(transformed.left)||!Float.isFinite(transformed.top)||!Float.isFinite(transformed.right)||!Float.isFinite(transformed.bottom))return null;
            box.union(transformed);box.offset(at.getLeft()-parent.getScrollX(),at.getTop()-parent.getScrollY());at=parent;
        }
        return box;
    }
    /** The OEM row adds padding and its end margin in both pure width helpers.
     * Read those helpers (including existing icon-spacing hooks) rather than add
     * padding again or infer a density-dependent gap from screenshot positions.
     * Eligibility is the native measurement contract: an overflow-hidden or
     * INVISIBLE child must not donate room while isIconVisible remains true. */
    private static final class NativeRowCost {
        private static final Map<Class<?>,RowAccess> ROWS=new HashMap<>();
        private static final Map<Class<?>,IconAccess> ICONS=new HashMap<>();
        int reserved;String reason="native_cost_unknown";View blocker;
        static NativeRowCost read(ViewGroup row,View branch){
            NativeRowCost result=new NativeRowCost();
            try{
                RowAccess access=ROWS.get(row.getClass());
                if(access==null){access=new RowAccess(row.getClass());ROWS.put(row.getClass(),access);}
                int spacing=access.spacing.getInt(row),maximum=access.maximum.getInt(null);
                Object ignored=access.ignored.get(row);
                if(spacing<0||maximum<=0||!(ignored instanceof Collection))return result;
                boolean restrict=access.restrict.getBoolean(row),found=false;int count=0;long reserved=0;
                for(int i=0;i<row.getChildCount();i++){
                    View child=row.getChildAt(i);result.blocker=child;
                    IconAccess icon=ICONS.get(child.getClass());
                    if(icon==null){icon=new IconAccess(child.getClass());ICONS.put(child.getClass(),icon);}
                    Object visible=icon.visible.invoke(child),blocked=icon.blocked.invoke(child),slot=icon.slot.invoke(child);
                    if(!(visible instanceof Boolean)||!(blocked instanceof Boolean)||!(slot instanceof String))return result;
                    if(!(Boolean)visible||(Boolean)blocked||((Collection<?>)ignored).contains(slot))continue;
                    int measured=child.getMeasuredWidth(),actual=child.getWidth();
                    if(measured<=0||actual<=0)return result;
                    Object measuredTotal=access.measured.invoke(null,child),actualTotal=access.actual.invoke(null,child);
                    if(!(measuredTotal instanceof Integer)||!(actualTotal instanceof Integer))return result;
                    int measuredCost=(Integer)measuredTotal,actualCost=(Integer)actualTotal;
                    if(measuredCost<measured||actualCost<actual)return result;
                    int cost=Math.max(measuredCost,actualCost);count++;
                    if(child==branch){found=true;reserved+=cost-Math.max(measured,actual);}
                    else reserved+=cost;
                }
                result.blocker=null;
                if(!found){result.reason="native_branch_hidden";return result;}
                if(restrict&&count>maximum){result.reason="native_icon_limit";return result;}
                reserved+=(long)Math.max(0,count-1)*spacing;
                if(reserved<0||reserved>Integer.MAX_VALUE)return result;
                result.reserved=(int)reserved;result.reason=null;return result;
            }catch(ReflectiveOperationException|RuntimeException unavailable){return result;}
        }
        private static final class RowAccess {
            final java.lang.reflect.Method measured,actual;
            final java.lang.reflect.Field spacing,maximum,ignored,restrict;
            RowAccess(Class<?> type)throws ReflectiveOperationException{
                measured=type.getMethod("getViewTotalMeasuredWidth",View.class);actual=type.getMethod("getViewTotalWidth",View.class);
                spacing=type.getField("mIconSpacing");maximum=type.getField("MAX_ICONS");
                ignored=type.getField("mIgnoredSlots");restrict=type.getField("mShouldRestrictIcons");
                if(!java.lang.reflect.Modifier.isStatic(measured.getModifiers())||!java.lang.reflect.Modifier.isStatic(actual.getModifiers()))throw new NoSuchMethodException("native static width contract");
            }
        }
        private static final class IconAccess {
            final java.lang.reflect.Method visible,blocked,slot;
            IconAccess(Class<?> type)throws ReflectiveOperationException{
                visible=type.getMethod("isIconVisible");blocked=type.getMethod("isIconBlocked");slot=type.getMethod("getSlot");
            }
        }
    }
    private static boolean nativeWifiEnvelope(Pair pair,ViewGroup owner,View branch,int nativeWidth){
        if(!owner.getClass().getName().equals("com.android.systemui.statusbar.pipeline.wifi.ui.view.ModernStatusBarWifiView")
                ||!(owner.getParent() instanceof ViewGroup)
                ||!owner.getParent().getClass().getName().equals("com.android.systemui.statusbar.phone.StatusIconContainer"))return false;
        ViewGroup group=pair.parent;ViewGroup.LayoutParams box=owner.getLayoutParams(),inner=group.getLayoutParams();
        if(branch!=group||group.getParent()!=owner||!(group instanceof FrameLayout)||group.getChildCount()!=2
                ||pair.signal.getParent()!=group||pair.activity.getParent()!=group||box==null||box.width<=0
                ||inner==null||inner.width!=ViewGroup.LayoutParams.WRAP_CONTENT||nativeWidth!=pair.width())return false;
        for(View view:new View[]{owner,group})if(view.getVisibility()!=View.VISIBLE||view.getScaleX()!=1f||view.getScaleY()!=1f||view.getRotation()!=0f
                ||view.getPaddingLeft()!=0||view.getPaddingRight()!=0||view.getLayoutDirection()!=pair.signal.getLayoutDirection())return false;
        return true;
    }
    private static int[] nativeFailure(Pair pair,String reason,int vertical,int consumed,int limit,View parent,View branch,View blocker){
        pair.budgetDiagnostic.capture(reason,vertical,consumed,limit,budgetView(parent),budgetView(branch),budgetView(blocker),pair.widthLimitOrigin);
        return new int[]{0,0};
    }
    /** Occupancy in the immediate parent's coordinates, including un-clipped children.
     * Keep native allocated space as well as transformed pixels: INVISIBLE/alpha-zero
     * slots and animations must not temporarily donate their resting layout space. */
    private static RectF budgetRect(View view,int depth){
        if(view.getVisibility()==View.GONE)return new RectF();
        if(depth>12||!view.isLaidOut())return null;
        RectF local=new RectF(0,0,view.getWidth(),view.getHeight());
        if(view instanceof ViewGroup&&!((ViewGroup)view).getClipChildren()){
            ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++){
                RectF child=budgetRect(group.getChildAt(i),depth+1);
                if(child==null)return null;if(!child.isEmpty())local.union(child);
            }
        }
        if(local.isEmpty()){local.offset(view.getLeft(),view.getTop());return local;}
        RectF transformed=new RectF(local);view.getMatrix().mapRect(transformed);
        if(!Float.isFinite(transformed.left)||!Float.isFinite(transformed.top)||!Float.isFinite(transformed.right)||!Float.isFinite(transformed.bottom))return null;
        local.union(transformed);local.offset(view.getLeft(),view.getTop());return local;
    }
    /** Only resource/class/layout metadata, never text, descriptions, tags or artwork. */
    private static String budgetView(View view){
        if(view==null)return null;
        String resource="none";try{if(view.getId()>0)resource=view.getResources().getResourceEntryName(view.getId());}catch(Exception ignored){}
        ViewGroup.LayoutParams params=view.getLayoutParams();
        String result="class="+view.getClass().getName()+",resource="+resource+",visibility="+view.getVisibility()
                +",local="+view.getLeft()+","+view.getTop()+","+view.getRight()+","+view.getBottom()
                +",measured="+view.getMeasuredWidth()+","+view.getMeasuredHeight()
                +",lp="+(params==null?"none":params.width+","+params.height)
                +",translation="+view.getTranslationX()+","+view.getTranslationY()
                +",scale="+view.getScaleX()+","+view.getScaleY();
        if(params instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams margins=(ViewGroup.MarginLayoutParams)params;
            result+=",margins="+margins.getMarginStart()+","+margins.topMargin+","+margins.getMarginEnd()+","+margins.bottomMargin;}
        return result;
    }
    private static int horizontalMargins(View view){ViewGroup.LayoutParams lp=view.getLayoutParams();if(!(lp instanceof ViewGroup.MarginLayoutParams))return 0;ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)lp;return Math.max(0,p.getMarginStart())+Math.max(0,p.getMarginEnd());}
    static final class Pair {
        final ViewGroup parent;final View signal,activity;
        final StatusBarWifiBudgetDiagnostic budgetDiagnostic=new StatusBarWifiBudgetDiagnostic();
        final View.OnAttachStateChangeListener attachment;
        boolean series,active;float scale=1;long generation,reportedAt,budgetSignature=Long.MIN_VALUE;String reason="pending",reported="",snapshotKey="",environmentKey="",widthLimitOrigin="none";
        int maxWidth,maxHeight;StatusBarWifiAssetSpacingPolicy.Plan plan;
        Pair(ViewGroup parent,View signal,View activity){
            this.parent=parent;this.signal=signal;this.activity=activity;
            attachment=new View.OnAttachStateChangeListener(){
                public void onViewAttachedToWindow(View view){}
                public void onViewDetachedFromWindow(View view){close();}
            };parent.addOnAttachStateChangeListener(attachment);
        }
        void close(){if(PAIRS.get(parent)==this)PAIRS.remove(parent);setActive(false);series=false;StatusBarIconLayoutHook.restoreWifiAssetPair(parent,signal,activity);parent.removeOnAttachStateChangeListener(attachment);SIGNALS.remove(signal);SIGNALS.remove(activity);}
        int width(){return signal.getLayoutParams().width;}int height(){return signal.getLayoutParams().height;}
        float units(){return parent.getResources().getDisplayMetrics().density/scale;}
        StatusBarWifiAssetSpacingPolicy.Plan make(StatusBarIconSpacingSpec.Insets s,StatusBarIconSpacingSpec.Insets a){return StatusBarWifiAssetSpacingPolicy.plan(width(),height(),s,a,units(),parent.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL,signal.getVisibility()!=View.GONE,activity.getVisibility()!=View.GONE);}
        void replan(){if(width()<=0||height()<=0){plan=null;setActive(false);return;}plan=make(StatusBarIconLayoutHook.insets(signal),StatusBarIconLayoutHook.insets(activity));if(active&&!plan.fits(maxWidth,maxHeight))setActive(false);}
        void accept(int w,int h,String source){maxWidth=Math.max(0,w);maxHeight=Math.max(0,h);setActive(plan!=null&&plan.fits(maxWidth,maxHeight));reason=active?source:"capacity";}
        /** Every eligibility transition owns redraw, including rejection during
         * replan before accept and a close which leaves native dimensions equal.
         * Static artwork has no animation tick to invalidate its recorded pixels. */
        void setActive(boolean value){if(active!=value){active=value;signal.requestLayout();activity.requestLayout();signal.invalidate();activity.invalidate();changed(signal);}}
        void publish(){
            if(parent.getDisplay()==null||!parent.isShown()||width()<=0||height()<=0)return;long now=SystemClock.elapsedRealtime();String surface=StatusBarAssetsHook.surfaceFor(parent);
            String id=StatusBarAssetsHook.semanticId(signal);
            String budget=budgetDiagnostic.pending(surface,parent.getDisplay().getRotation(),id,now,BuildConfig.VERSION_CODE);
            if(budget!=null)FeatureSettings.diagnostic(parent.getContext(),StatusBarWifiBudgetDiagnostic.key(surface,parent.getDisplay().getRotation(),id),budget);
            ConfigSnapshot snapshot=FeatureSettings.snapshot(parent.getContext());
            String signature=surface+":"+reason+":"+generation+":"+maxWidth+":"+maxHeight+":"+units()+":"+width()+":"+height()+":"+signal.getVisibility()+":"+activity.getVisibility()+":"+parent.getDisplay().getRotation()+":"+snapshot.checksum;
            if(signature.equals(reported)&&now-reportedAt<30_000)return;reported=signature;reportedAt=now;
            if(!snapshotKey.equals(snapshot.checksum)){snapshotKey=snapshot.checksum;environmentKey=StatusBarWifiAssetSpacingObservation.environment(snapshot.values(),id);}
            StatusBarHeaderSpacingObservation profile=new StatusBarHeaderSpacingObservation(System.currentTimeMillis()-now,now,BuildConfig.VERSION_CODE,parent.getDisplay().getDisplayId(),parent.getDisplay().getRotation(),Math.round(parent.getResources().getDisplayMetrics().density*1000),Math.round(parent.getResources().getConfiguration().fontScale*1000),parent.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0,0);
            StatusBarWifiAssetSpacingObservation observation=new StatusBarWifiAssetSpacingObservation(profile,environmentKey,reason,width(),height(),maxWidth,maxHeight,units(),signal.getVisibility()!=View.GONE,activity.getVisibility()!=View.GONE);
            FeatureSettings.diagnostic(parent.getContext(),StatusBarWifiAssetSpacingObservation.key(surface,profile.rotation,id),observation.serialize());
        }
    }
}
