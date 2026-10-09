package ls.augment.com.hook;

import android.content.Context;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.zte.controlcenter.widget.CCHeaderView;
import com.android.systemui.statusbar.phone.StatusIconContainer;
import java.lang.reflect.Method;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Real Android 16 measurement/matrices; known vertical capacity is a supplied port.
 * This does not claim OEM installation or successful artwork pixels on the phone. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=36)
public class WifiNativeBudgetAndroidTest {
    public static class NativeIcon extends View implements com.android.systemui.statusbar.StatusIconDisplayable {
        public boolean nativeVisible=true,blocked=false;public final String slot;
        NativeIcon(Context c,String slot){super(c);this.slot=slot;}
        public boolean isIconVisible(){return nativeVisible;}public boolean isIconBlocked(){return blocked;}public String getSlot(){return slot;}
    }
    static class Fixture {
        final Context c=RuntimeEnvironment.getApplication();
        final CCHeaderView header=new CCHeaderView(c);
        final RelativeLayout branch=new RelativeLayout(c);
        final LinearLayout row;
        final FrameLayout owner,group=new FrameLayout(c),footer=new FrameLayout(c);
        final ImageView signal=new ImageView(c),activity=new ImageView(c);
        final StatusBarWifiAssetSpacingHook.Pair pair;
        long traceTime=100000;
        Fixture(){this(false,false);}
        Fixture(boolean modern,boolean nativeRow){
            row=nativeRow?new com.android.systemui.statusbar.phone.StatusIconContainer(c):new LinearLayout(c);
            owner=modern?new com.android.systemui.statusbar.pipeline.wifi.ui.view.ModernStatusBarWifiView(c):new FrameLayout(c);
            header.setLayoutParams(new ViewGroup.LayoutParams(988,374));
            View time=new View(c);time.setId(101);RelativeLayout.LayoutParams tp=new RelativeLayout.LayoutParams(381,185);tp.topMargin=107;header.addView(time,tp);
            View date=new View(c);date.setId(102);RelativeLayout.LayoutParams dp=new RelativeLayout.LayoutParams(326,81);dp.topMargin=292;header.addView(date,dp);
            RelativeLayout.LayoutParams bp=new RelativeLayout.LayoutParams(-2,-1);bp.addRule(RelativeLayout.RIGHT_OF,time.getId());bp.addRule(RelativeLayout.ALIGN_PARENT_RIGHT);bp.addRule(RelativeLayout.ALIGN_BOTTOM,date.getId());header.addView(branch,bp);
            RelativeLayout.LayoutParams rp=new RelativeLayout.LayoutParams(-1,42);rp.topMargin=150;branch.addView(row,rp);row.setOrientation(LinearLayout.HORIZONTAL);
            row.addView(owner,new LinearLayout.LayoutParams(modern?46:-2,42));owner.addView(group,new FrameLayout.LayoutParams(-2,42));
            group.addView(signal,new FrameLayout.LayoutParams(46,42));group.addView(activity,new FrameLayout.LayoutParams(46,42));
            View other=new NativeIcon(c,"other");row.addView(other,new LinearLayout.LayoutParams(431,42));
            RelativeLayout.LayoutParams fp=new RelativeLayout.LayoutParams(-1,0);fp.topMargin=156;header.addView(footer,fp);
            signal.setTag("wifi.signal");activity.setTag("wifi.activity_inout");
            pair=new StatusBarWifiAssetSpacingHook.Pair(group,signal,activity);pair.series=true;StatusBarHeaderSpacingHook.capacity=83;layout();
        }
        void layout(){header.measure(View.MeasureSpec.makeMeasureSpec(988,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(374,View.MeasureSpec.EXACTLY));header.layout(0,0,988,374);}
        int[] budget()throws Exception{Method m=StatusBarWifiAssetSpacingHook.class.getDeclaredMethod("nativeBudget",StatusBarWifiAssetSpacingHook.Pair.class);m.setAccessible(true);return (int[])m.invoke(null,pair);}
        String trace()throws Exception{budget();traceTime+=3000;return pair.budgetDiagnostic.pending("control",0,"wifi.signal",traceTime,20456);}
        void footerSize(int w,int h){footer.getLayoutParams().width=w;footer.getLayoutParams().height=h;footer.requestLayout();layout();}
    }
    static RectF occupied(View v)throws Exception{Method m=StatusBarWifiAssetSpacingHook.class.getDeclaredMethod("budgetRect",View.class,int.class);m.setAccessible(true);return (RectF)m.invoke(null,v,0);}

    @Test public void actualZeroHeightFooterIsEmptyAndWrapOwnerCanGrow()throws Exception{
        Fixture f=new Fixture();assertTrue(f.footer.isLaidOut());assertEquals(0,f.footer.getHeight());assertEquals(46,f.owner.getMeasuredWidth());assertEquals(-2,f.owner.getLayoutParams().width);assertEquals(-2,f.branch.getLayoutParams().width);assertEquals(607,f.branch.getWidth());assertEquals(373,f.branch.getHeight());
        assertEquals(176,f.budget()[0]);assertEquals(125,f.budget()[1]);assertTrue("two original 46px canvases fit the proven row",f.budget()[0]>=92);
        String trace=f.trace();assertTrue(trace.contains("reason=bounded"));assertTrue(trace.contains("widthOrigin={nativeWidth=607,available=607,consumed=431,limit=176"));
    }
    @Test public void fixedOwnerStays46AndTraceIdentifiesFirstNarrowing()throws Exception{
        Fixture f=new Fixture();f.owner.getLayoutParams().width=46;f.owner.requestLayout();f.layout();assertEquals(46,f.budget()[0]);
        String trace=f.trace();assertTrue(trace.contains("widthOrigin={nativeWidth=46,available=46,consumed=0,limit=46,class=android.widget.FrameLayout"));
    }
    @Test public void invisibleNonEmptySlotStillBlocksAndGoneFreesIt()throws Exception{
        Fixture f=new Fixture();f.footerSize(-1,1);f.footer.setVisibility(View.INVISIBLE);assertEquals(0,f.budget()[0]);
        f.footer.setAlpha(0);assertEquals(0,f.budget()[0]);f.footer.setVisibility(View.GONE);f.layout();assertEquals(176,f.budget()[0]);
    }
    @Test public void zeroWidthAndZeroHeightBothEmptyButLaterBlockerStillChecked()throws Exception{
        Fixture f=new Fixture();f.footerSize(0,100);assertEquals(176,f.budget()[0]);
        View blocker=new View(f.c);RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(50,20);p.leftMargin=500;p.topMargin=160;f.header.addView(blocker,p);f.layout();assertEquals(0,f.budget()[0]);
    }
    @Test public void actualTranslationAndRotationEnterBranchAndNativeSlotIsRetained()throws Exception{
        Fixture f=new Fixture();f.footerSize(100,30);RelativeLayout.LayoutParams p=(RelativeLayout.LayoutParams)f.footer.getLayoutParams();p.leftMargin=0;p.topMargin=10;f.footer.requestLayout();f.layout();assertTrue("disjoint sibling leaves a finite interval",f.budget()[0]>0);
        f.footer.setTranslationX(450);f.footer.setTranslationY(150);assertEquals(0,f.budget()[0]);
        f.footer.setTranslationX(0);f.footer.setTranslationY(0);f.footer.setPivotX(0);f.footer.setPivotY(0);f.footer.setScaleX(5);assertEquals(0,f.budget()[0]);
        f.footer.setScaleX(1);f.footer.setRotation(90);RectF r=occupied(f.footer);assertTrue("matrix reaches x<0",r.left<0);assertTrue("native resting extent retained",r.right>=100);
    }
    @Test public void emptyUnclippedParentCannotHideOverflowChild()throws Exception{
        Fixture f=new Fixture();View child=new View(f.c);f.footer.addView(child,new FrameLayout.LayoutParams(600,20));f.footer.setClipChildren(false);f.layout();assertEquals(20,child.getHeight());assertEquals(0,f.budget()[0]);
        f.footer.setClipChildren(true);assertEquals(176,f.budget()[0]);
    }
    @Test public void unmeasuredOrUnknownCapacityNeverDonatesRoom()throws Exception{
        Fixture f=new Fixture();View unknown=new View(f.c);RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(0,0);p.topMargin=156;f.header.addView(unknown,p);assertFalse(unknown.isLaidOut());assertEquals(0,f.budget()[0]);
        f.layout();assertEquals(176,f.budget()[0]);StatusBarHeaderSpacingHook.capacity=-1;assertEquals(0,f.budget()[0]);
    }
    @Test public void repeatedMeasurementsAndRestoreNeverInflateCapacity()throws Exception{
        Fixture f=new Fixture();for(int i=0;i<120;i++){f.owner.getLayoutParams().width=-2;f.activity.setTranslationX(i%2==0?46:0);f.layout();assertEquals(176,f.budget()[0]);}
        f.owner.getLayoutParams().width=46;f.owner.requestLayout();f.layout();assertEquals(46,f.budget()[0]);f.owner.getLayoutParams().width=-2;f.owner.requestLayout();f.layout();assertEquals(176,f.budget()[0]);
    }
    @Test public void exactOemEnvelopeUsesActualRowAndConsumesTwoRealCanvases()throws Exception{
        Fixture f=new Fixture(true,true);assertEquals(46,f.owner.getLayoutParams().width);assertEquals(176,f.budget()[0]);
        f.pair.replan();int[] budget=f.budget();f.pair.accept(budget[0],budget[1],"native_slot");assertTrue(f.pair.active);
        register(f);assertFalse("budget admission is not completed measurement",StatusBarWifiAssetSpacingHook.allowArtwork(f.signal));
        StatusBarIconLayoutHook.apply(f.pair);f.layout();
        assertEquals(92,f.owner.getWidth());assertEquals(92,f.group.getWidth());assertEquals(46,f.signal.getWidth());assertEquals(46,f.activity.getWidth());
        assertEquals(0,f.signal.getLeft());assertEquals(46,f.activity.getLeft());assertEquals(92,f.row.getChildAt(1).getLeft());
        assertTrue(StatusBarWifiAssetSpacingHook.allowArtwork(f.signal));assertTrue(StatusBarWifiAssetSpacingHook.allowArtwork(f.activity));assertEquals(176,f.budget()[0]);
        String trace=f.trace();assertTrue(trace.contains("nativeWidth=607,available=607,consumed=431,limit=176"));
    }
    @Test public void binderRewriteHideShowAndCloseKeepLatestNativeWidth()throws Exception{
        Fixture f=new Fixture(true,true);f.pair.replan();f.pair.accept(176,125,"native_slot");
        for(int i=0;i<120;i++){
            // Exact native writer: reuse LP, set width 46 and request another layout.
            f.owner.getLayoutParams().width=46;f.owner.setLayoutParams(f.owner.getLayoutParams());
            StatusBarIconLayoutHook.apply(f.pair);f.layout();assertEquals(92,f.owner.getWidth());assertEquals(176,f.budget()[0]);
        }
        f.owner.getLayoutParams().width=0;f.owner.setVisibility(View.GONE);f.pair.active=false;StatusBarIconLayoutHook.apply(f.pair);f.layout();assertEquals(0,f.owner.getLayoutParams().width);
        f.owner.getLayoutParams().width=46;f.owner.setVisibility(View.VISIBLE);f.layout();f.pair.replan();f.pair.accept(f.budget()[0],125,"native_slot");StatusBarIconLayoutHook.apply(f.pair);f.layout();assertEquals(92,f.owner.getWidth());
        f.pair.close();f.layout();assertEquals(46,f.owner.getWidth());assertEquals(46,f.group.getWidth());assertEquals(0,f.activity.getLeft());
        // Late OEM change at shutdown is kept, rather than restored to an old 46.
        f.pair.replan();f.pair.accept(176,125,"native_slot");StatusBarIconLayoutHook.apply(f.pair);f.layout();f.owner.getLayoutParams().width=50;f.pair.close();f.layout();assertEquals(50,f.owner.getWidth());
    }
    @Test public void fixedAncestorsUnknownRowsAndChangedEnvelopeRemainBounded()throws Exception{
        Fixture f=new Fixture(true,true);f.row.getLayoutParams().width=500;f.row.requestLayout();f.layout();assertEquals(69,f.budget()[0]);
        f.pair.replan();f.pair.accept(f.budget()[0],125,"native_slot");assertFalse(f.pair.active);StatusBarIconLayoutHook.apply(f.pair);f.layout();assertEquals(46,f.owner.getWidth());
        Fixture unknown=new Fixture(true,false);assertEquals(46,unknown.budget()[0]);
        Fixture changed=new Fixture(true,true);changed.owner.getLayoutParams().width=40;changed.owner.requestLayout();changed.layout();assertEquals(40,changed.budget()[0]);
        Fixture extra=new Fixture(true,true);View blocker=new View(extra.c);extra.owner.addView(blocker,new FrameLayout.LayoutParams(1,42));extra.layout();assertEquals(0,extra.budget()[0]);
        blocker.setVisibility(View.INVISIBLE);assertEquals(0,extra.budget()[0]);blocker.setVisibility(View.GONE);extra.layout();assertEquals(176,extra.budget()[0]);
    }
    @Test public void directionAndSmallInsetsUseRealNativePlacementAndRestore()throws Exception{
        Fixture f=new Fixture(true,true);for(int direction:new int[]{View.LAYOUT_DIRECTION_LTR,View.LAYOUT_DIRECTION_RTL}){
            f.header.setLayoutDirection(direction);f.row.setLayoutDirection(direction);f.owner.setLayoutDirection(direction);f.group.setLayoutDirection(direction);f.signal.setLayoutDirection(direction);f.activity.setLayoutDirection(direction);f.layout();
            f.pair.plan=f.pair.make(new ls.augment.com.StatusBarIconSpacingSpec.Insets(2,1,1,1),new ls.augment.com.StatusBarIconSpacingSpec.Insets(1,1,2,1));
            f.pair.accept(176,125,"native_slot");StatusBarIconLayoutHook.apply(f.pair);f.layout();
            assertEquals(f.pair.plan.width,f.owner.getWidth());assertEquals(f.pair.plan.width,f.group.getWidth());assertEquals(f.pair.plan.signalX,f.signal.getLeft());assertEquals(f.pair.plan.activityX,f.activity.getLeft());
            assertEquals(f.pair.plan.signalY,f.signal.getTop());assertEquals(f.pair.plan.activityY,f.activity.getTop());assertTrue(Math.min(f.signal.getRight(),f.activity.getRight())<=Math.max(f.signal.getLeft(),f.activity.getLeft()));
            f.pair.close();f.layout();assertEquals(46,f.owner.getWidth());assertEquals(42,f.owner.getHeight());assertEquals(0,f.signal.getLeft());assertEquals(0,f.activity.getLeft());
        }
    }
    /** Recorded 20457 control row: eight eligible icons, 501px real parent,
     * 407px raw widths. 7px here is an explicit fixture input to the OEM helper,
     * never a production constant. This reproduces the observed NFC underflow. */
    static Fixture fullRow(int width){
        Fixture f=new Fixture(true,true);StatusIconContainer row=(StatusIconContainer)f.row;
        row.removeAllViews();row.nativeLayout=true;row.nativeEndMargin=7;row.getLayoutParams().width=width;
        String[] slots={"nfc","bluetooth","volume","netspeed","wifi","hd","mobile1","mobile2"};
        int[] widths={42,38,42,62,46,47,65,65};
        for(int i=0;i<widths.length;i++)row.addView(i==4?f.owner:new NativeIcon(f.c,slots[i]),new LinearLayout.LayoutParams(widths[i],42));
        row.requestLayout();f.layout();return f;
    }
    @Test public void recordedFullNativeCostRejectsTheActualNfcUnderflowAndRestoresAllNeighbors()throws Exception{
        Fixture f=fullRow(501);StatusIconContainer row=(StatusIconContainer)f.row;View nfc=row.getChildAt(0);
        float[] original=new float[8];for(int i=0;i<8;i++){original[i]=row.getChildAt(i).getTranslationX();assertEquals(Integer.valueOf(0),row.visibleState.get(row.getChildAt(i)));}
        assertEquals(38f,nfc.getTranslationX(),0f);assertFalse(row.mNeedsUnderflow);
        assertEquals(84,f.budget()[0]);assertTrue(f.trace().contains("consumed=417,limit=84"));
        // Demonstrate that the former raw-width budget admits exactly the failed
        // 92px envelope and the native algorithm hides NFC, not only clips 8px.
        f.pair.replan();f.pair.accept(140,125,"old_raw_width");StatusBarIconLayoutHook.apply(f.pair);f.layout();
        assertEquals(92,f.owner.getWidth());assertTrue(row.mNeedsUnderflow);assertEquals(-8f,nfc.getTranslationX(),0f);assertEquals(Integer.valueOf(2),row.visibleState.get(nfc));
        assertEquals("hidden native states must not donate capacity",84,f.budget()[0]);
        f.pair.accept(f.budget()[0],125,"native_slot");assertFalse(f.pair.active);StatusBarIconLayoutHook.apply(f.pair);f.layout();
        assertEquals(46,f.owner.getWidth());assertFalse(row.mNeedsUnderflow);
        for(int i=0;i<8;i++){View child=row.getChildAt(i);assertEquals(Integer.valueOf(0),row.visibleState.get(child));assertEquals(original[i],child.getTranslationX(),0f);assertEquals(View.VISIBLE,child.getVisibility());assertEquals(1f,child.getScaleX(),0f);}
    }
    @Test public void fullCostBoundaryAdmitsExactlyEnoughRoomAndRefusesOnePixelLess()throws Exception{
        for(int width:new int[]{508,509}){
            Fixture f=fullRow(width);StatusIconContainer row=(StatusIconContainer)f.row;
            assertEquals(width-417,f.budget()[0]);f.pair.replan();f.pair.accept(f.budget()[0],125,"native_slot");assertEquals(width==509,f.pair.active);
            StatusBarIconLayoutHook.apply(f.pair);f.layout();assertFalse(row.mNeedsUnderflow);
            for(int i=0;i<8;i++)assertEquals(Integer.valueOf(0),row.visibleState.get(row.getChildAt(i)));
            assertEquals(width==509?92:46,f.owner.getWidth());assertEquals(width-417,f.budget()[0]);
        }
    }
    @Test public void nativeHelpersAlreadyIncludePaddingAndOwnedSpacingAndGapUsesEligibleCount()throws Exception{
        Fixture f=fullRow(501);StatusIconContainer row=(StatusIconContainer)f.row;View nfc=row.getChildAt(0);
        nfc.setPadding(3,0,5,0);row.extraCost.put(f.owner,9);row.mIconSpacing=2;f.layout();
        assertEquals("8 native margins, padding once, hooked whole-icon cost once, seven gaps",53,f.budget()[0]);
        row.mIgnoredSlots.add("nfc");f.layout();assertEquals("remove only native-ignored cost and one gap",112,f.budget()[0]);
        row.nativeEndMargin=11;f.layout();assertEquals("read changed native helper; no cached density/gap guess",84,f.budget()[0]);
    }
    @Test public void nativeEligibilityReservesInvisibleAlphaZeroAndOverflowHiddenViews()throws Exception{
        Fixture f=fullRow(501);StatusIconContainer row=(StatusIconContainer)f.row;NativeIcon nfc=(NativeIcon)row.getChildAt(0);
        nfc.setVisibility(View.INVISIBLE);nfc.setAlpha(0);row.visibleState.put(nfc,2);assertEquals(84,f.budget()[0]);
        nfc.setVisibility(View.GONE);f.layout();assertEquals("native measurement does not use View.visibility",84,f.budget()[0]);
        nfc.nativeVisible=false;assertEquals(133,f.budget()[0]);nfc.nativeVisible=true;nfc.blocked=true;assertEquals(133,f.budget()[0]);
        nfc.blocked=false;row.mIgnoredSlots.add("nfc");assertEquals(133,f.budget()[0]);row.mIgnoredSlots.clear();assertEquals(84,f.budget()[0]);
        com.android.systemui.statusbar.pipeline.wifi.ui.view.ModernStatusBarWifiView wifi=(com.android.systemui.statusbar.pipeline.wifi.ui.view.ModernStatusBarWifiView)f.owner;
        wifi.iconBlocked=true;assertEquals(0,f.budget()[0]);assertTrue(f.trace().contains("native_branch_hidden"));
    }
    @Test public void nativeMaximumAndUnknownContractsNeverPermitOverflow()throws Exception{
        Fixture f=fullRow(600);StatusIconContainer row=(StatusIconContainer)f.row;
        try{StatusIconContainer.MAX_ICONS=7;row.mShouldRestrictIcons=true;assertEquals(0,f.budget()[0]);assertTrue(f.trace().contains("native_icon_limit"));
            row.mShouldRestrictIcons=false;assertEquals(183,f.budget()[0]);
        }finally{StatusIconContainer.MAX_ICONS=10;}
        row.throwWidth=true;assertEquals(0,f.budget()[0]);assertTrue(f.trace().contains("native_cost_unknown"));row.throwWidth=false;
        row.mIconSpacing=-1;assertEquals(0,f.budget()[0]);row.mIconSpacing=0;
        row.mIgnoredSlots=null;assertEquals(0,f.budget()[0]);row.mIgnoredSlots=new java.util.ArrayList<>();
        View unknown=new View(f.c);row.addView(unknown,new LinearLayout.LayoutParams(1,42));assertEquals(0,f.budget()[0]);row.removeView(unknown);
        row.extraCost.put(f.owner,-100);assertEquals(0,f.budget()[0]);
    }
    @Test public void fitThenCapacityLossRestoresInsteadOfKeepingPreviouslyAdmittedEnvelope()throws Exception{
        Fixture f=fullRow(509);StatusIconContainer row=(StatusIconContainer)f.row;
        f.pair.replan();f.pair.accept(f.budget()[0],125,"native_slot");StatusBarIconLayoutHook.apply(f.pair);f.layout();assertEquals(92,f.owner.getWidth());
        row.getLayoutParams().width=501;row.requestLayout();f.layout();f.pair.accept(f.budget()[0],125,"native_slot");StatusBarIconLayoutHook.apply(f.pair);f.layout();
        assertFalse(f.pair.active);assertEquals(46,f.owner.getWidth());assertEquals(84,f.budget()[0]);assertFalse(row.mNeedsUnderflow);assertEquals(Integer.valueOf(0),row.visibleState.get(row.getChildAt(0)));
        f.pair.close();f.layout();assertEquals(46,f.owner.getWidth());
    }
    @Test public void pendingMeasureAndLayoutEachReserveTheirFullNativeCost()throws Exception{
        Fixture f=fullRow(501);View nfc=f.row.getChildAt(0);
        nfc.measure(View.MeasureSpec.makeMeasureSpec(50,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(42,View.MeasureSpec.EXACTLY));
        assertEquals(42,nfc.getWidth());assertEquals(50,nfc.getMeasuredWidth());assertEquals(76,f.budget()[0]);
        nfc.measure(View.MeasureSpec.makeMeasureSpec(34,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(42,View.MeasureSpec.EXACTLY));
        assertEquals(42,nfc.getWidth());assertEquals(34,nfc.getMeasuredWidth());assertEquals(84,f.budget()[0]);
    }
    @SuppressWarnings("unchecked") static void register(Fixture f)throws Exception{
        java.lang.reflect.Field field=StatusBarWifiAssetSpacingHook.class.getDeclaredField("PAIRS");field.setAccessible(true);((java.util.Map<ViewGroup,StatusBarWifiAssetSpacingHook.Pair>)field.get(null)).put(f.group,f.pair);
    }
}
