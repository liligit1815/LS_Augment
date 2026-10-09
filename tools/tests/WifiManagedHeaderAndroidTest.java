package ls.augment.com.hook;

import android.graphics.RectF;
import android.util.TypedValue;
import android.view.*;
import android.widget.*;
import ls.augment.com.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** Real Android 36 Views, matrices, text shaping, measure and layout, with production
 * HeaderClockLayout + Wi-Fi budget/size records. OEM cost and HeaderState registration
 * are explicit test ports, not a claim that the OEM binary or hook transport ran. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class WifiManagedHeaderAndroidTest {
    static class Managed {
        final WifiNativeBudgetAndroidTest.Fixture f=WifiNativeBudgetAndroidTest.fullRow(501);
        final FrameLayout time=new FrameLayout(f.c);
        final RelativeLayout dateGroup=new RelativeLayout(f.c);
        final TextView clock=new TextView(f.c),date=new TextView(f.c);
        final NotificationAppearanceHook.HeaderState state;
        int passes;
        Managed()throws Exception{
            f.header.removeView(f.header.findViewById(101));f.header.removeView(f.header.findViewById(102));
            time.setId(101);dateGroup.setId(102);
            clock.setText("07:25:36");clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,150);
            date.setText("October 4, Sunday");date.setTextSize(TypedValue.COMPLEX_UNIT_PX,42);
            time.addView(clock,new FrameLayout.LayoutParams(-2,185));dateGroup.addView(date,new RelativeLayout.LayoutParams(-2,81));
            f.header.addView(time,new RelativeLayout.LayoutParams(381,185));f.header.addView(dateGroup,new RelativeLayout.LayoutParams(326,81));
            f.header.removeView(f.footer);f.branch.addView(f.footer,new RelativeLayout.LayoutParams(346,98));
            f.row.getLayoutParams().width=-1;f.row.requestLayout();f.layout();
            arrange();state=NotificationAppearanceHook.manage(f.header,f.branch,f.row);
            f.pair.replan();WifiNativeBudgetAndroidTest.register(f);
        }
        void measure(){f.header.measure(View.MeasureSpec.makeMeasureSpec(988,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(f.header.getLayoutParams().height,View.MeasureSpec.EXACTLY));f.header.layout(0,0,988,f.header.getMeasuredHeight());passes++;}
        void arrange(){
            HeaderClockGeometry.Plan plan=HeaderClockLayout.apply(f.header,clock,date,time,dateGroup,f.branch,f.row,f.footer,null,
                new HeaderClockLayout.Below[0],107,185,81,0,1500,26,0,0,0,0,false);
            assertNotNull(plan);assertTrue(plan.valid);assertTrue(plan.stacked);measure();
        }
        int capacity()throws Exception{return f.budget()[0];}
        void choose(boolean small){f.pair.plan=small?f.pair.make(new StatusBarIconSpacingSpec.Insets(2,1,1,1),new StatusBarIconSpacingSpec.Insets(1,1,2,1)):f.pair.make(StatusBarIconSpacingSpec.ZERO,StatusBarIconSpacingSpec.ZERO);}
        void apply()throws Exception{
            int[] cap=f.budget();f.pair.accept(cap[0],cap[1],"native_slot");assertTrue(f.pair.active);
            // The separate header-spacing adapter supplies this proven vertical
            // reservation. We exercise real row measurement, not its ownership port.
            f.row.getLayoutParams().height=Math.max(42,f.pair.plan.height);f.row.requestLayout();
            StatusBarIconLayoutHook.apply(f.pair);arrange();
        }
        void assertHealthy(){
            assertEquals(150f,clock.getTextSize(),0f);assertEquals(42f,date.getTextSize(),0f);
            assertEquals(46,f.signal.getWidth());assertEquals(42,f.signal.getHeight());
            assertEquals(46,f.activity.getWidth());assertEquals(42,f.activity.getHeight());
            assertEquals(f.pair.plan.width,f.group.getWidth());assertEquals(f.pair.plan.width,f.owner.getWidth());
            assertEquals(f.pair.plan.signalX,f.signal.getLeft());assertEquals(f.pair.plan.activityX,f.activity.getLeft());
            assertEquals(f.pair.plan.signalY,f.signal.getTop());assertEquals(f.pair.plan.activityY,f.activity.getTop());
            assertTrue(StatusBarWifiAssetSpacingHook.allowArtwork(f.signal));assertTrue(StatusBarWifiAssetSpacingHook.allowArtwork(f.activity));
            assertFalse(((com.android.systemui.statusbar.phone.StatusIconContainer)f.row).mNeedsUnderflow);
            for(Integer s:((com.android.systemui.statusbar.phone.StatusIconContainer)f.row).visibleState.values())assertEquals(Integer.valueOf(0),s);
        }
    }
    @Test public void currentOwnedClockColumnUsesActualStripAndBothCanvasesWithoutFontReduction()throws Exception{
        Managed m=new Managed();assertEquals(988,m.f.branch.getWidth());assertEquals(988,m.f.row.getWidth());
        assertTrue(RectF.intersects(WifiNativeBudgetAndroidTest.occupied(m.f.branch),WifiNativeBudgetAndroidTest.occupied(m.time)));
        assertEquals(571,m.capacity());m.choose(true);m.apply();m.assertHealthy();assertEquals(571,m.capacity());
        RectF band=WifiNativeBudgetAndroidTest.occupied(m.f.row);assertFalse(RectF.intersects(band,WifiNativeBudgetAndroidTest.occupied(m.time)));
    }
    @Test public void pendingTopAndBottomEdgesCannotBorrowTheClockRowBeforeMeasurement()throws Exception{
        Managed m=new Managed();m.f.pair.plan=m.f.pair.make(new StatusBarIconSpacingSpec.Insets(0,24,0,24),StatusBarIconSpacingSpec.ZERO);
        assertEquals(42,m.f.row.getHeight());assertTrue(m.f.pair.plan.height>m.time.getTop()-150);
        assertEquals("future content reaches the real clock even while old row is 42",0,m.capacity());
        m.choose(false);assertEquals(571,m.capacity());
    }
    @Test public void sameBandRootAndInnerObstaclesAndInvisibleSlotsStillBlock()throws Exception{
        Managed m=new Managed();View blocker=new View(m.f.c);RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(30,20);p.leftMargin=900;p.topMargin=160;m.f.header.addView(blocker,p);m.measure();
        assertEquals(0,m.capacity());blocker.setVisibility(View.INVISIBLE);blocker.setAlpha(0);assertEquals(0,m.capacity());
        blocker.setVisibility(View.GONE);m.measure();assertEquals(571,m.capacity());
        RelativeLayout.LayoutParams footer=(RelativeLayout.LayoutParams)m.f.footer.getLayoutParams();footer.topMargin=160;m.f.footer.setLayoutParams(footer);m.measure();assertEquals(0,m.capacity());
    }
    @Test public void ownershipIsExactAndNativeOrUncommittedStatesDoNotRelaxGenericBudget()throws Exception{
        Managed m=new Managed();assertEquals(571,m.capacity());m.state.applied=false;assertEquals(0,m.capacity());m.state.applied=true;
        m.state.nativeDepth=1;assertEquals(0,m.capacity());m.state.nativeDepth=0;m.state.refreshing=true;assertEquals(0,m.capacity());m.state.refreshing=false;
        m.state.right=new RelativeLayout(m.f.c);assertEquals(0,m.capacity());m.state.right=m.f.branch;
        m.state.band=new View(m.f.c);assertEquals(0,m.capacity());m.state.band=m.f.row;assertEquals(571,m.capacity());
        m.f.pair.close();m.measure();assertEquals(46,m.f.owner.getWidth());assertEquals(0,m.f.activity.getLeft());
    }
    @Test public void transformedPendingFootprintUnknownGeometryAndFixedAncestorsStayBounded()throws Exception{
        Managed m=new Managed();m.f.group.setTranslationY(40);assertEquals("pending pair reaches clock through a real matrix",0,m.capacity());m.f.group.setTranslationY(0);assertEquals(571,m.capacity());
        m.f.group.setTranslationY(Float.NaN);assertEquals(0,m.capacity());m.f.group.setTranslationY(0);
        View unknown=new View(m.f.c);m.f.header.addView(unknown,new RelativeLayout.LayoutParams(0,0));assertFalse(unknown.isLaidOut());assertEquals(0,m.capacity());m.measure();assertEquals(571,m.capacity());
        m.f.row.getLayoutParams().width=501;m.f.row.requestLayout();m.measure();assertEquals(84,m.capacity());
    }
    @Test public void rtlHasCompleteTwoCellReservationAndFourInsets()throws Exception{
        Managed m=new Managed();m.f.c.getApplicationInfo().flags|=android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;m.f.c.getApplicationInfo().targetSdkVersion=36;for(View v:new View[]{m.f.header,m.f.branch,m.f.row,m.f.owner,m.f.group,m.f.signal,m.f.activity})v.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        m.measure();m.choose(true);assertEquals(571,m.capacity());m.apply();m.assertHealthy();assertTrue(m.f.signal.getLeft()>m.f.activity.getLeft());
    }
    @Test public void realRefreshTraversalAndBinderRewriteStayActiveFor120CyclesAndCloseRestores()throws Exception{
        Managed m=new Managed();m.choose(true);m.apply();int height=m.f.header.getHeight(),capacity=m.capacity();
        for(int i=0;i<120;i++){
            m.clock.setText(i%2==0?"07:25:36":"07:25:37");m.arrange();assertEquals(capacity,m.capacity());
            // Binder writes original 46 on the same LP. Budget sees the native
            // slot before owned width is re-applied, then traverses a real layout.
            m.f.owner.getLayoutParams().width=46;m.f.owner.setLayoutParams(m.f.owner.getLayoutParams());m.measure();
            assertEquals(capacity,m.capacity());m.apply();m.assertHealthy();assertEquals(height,m.f.header.getHeight());
        }
        assertTrue(m.passes>=360);com.android.systemui.statusbar.phone.StatusIconContainer row=(com.android.systemui.statusbar.phone.StatusIconContainer)m.f.row;assertTrue(row.measurePasses>=120);assertTrue(row.layoutPasses>=120);m.f.pair.close();m.f.row.getLayoutParams().height=42;m.f.row.requestLayout();m.arrange();
        assertEquals(46,m.f.owner.getWidth());assertEquals(46,m.f.group.getWidth());assertEquals(0,m.f.activity.getLeft());
        m.state.applied=false;assertEquals(0,m.capacity());m.state.applied=true;WifiNativeBudgetAndroidTest.register(m.f);m.choose(false);m.apply();m.assertHealthy();
    }
}
