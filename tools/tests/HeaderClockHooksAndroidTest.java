package ls.augment.com;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.util.TypedValue;
import java.lang.reflect.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import ls.augment.com.hook.FeatureSettings;
import static org.junit.Assert.*;

/** Runs actual production HeaderState/formatter with real Android widgets.
 * Settings/Xposed transport is isolated; tests call the exact production lifecycle boundaries. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class HeaderClockHooksAndroidTest {
    static Class<?> appearance,format;static Object owner;
    static Object call(Object object,String name,Class<?>[] types,Object...args)throws Exception{
        Class<?> type=object instanceof Class?(Class<?>)object:object.getClass();Method method=type.getDeclaredMethod(name,types);method.setAccessible(true);
        try{return method.invoke(object instanceof Class?null:object,args);}catch(InvocationTargetException e){throw new AssertionError(name,e.getCause());}
    }
    static Object call(Object object,String name)throws Exception{return call(object,name,new Class<?>[]{});}
    static void init()throws Exception{
        org.robolectric.RuntimeEnvironment.getApplication().getResources().getConfiguration().orientation=Configuration.ORIENTATION_PORTRAIT;
        FeatureSettings.clear();appearance=Class.forName("ls.augment.com.hook.NotificationAppearanceHook");format=Class.forName("ls.augment.com.hook.ControlCenterHeaderHook");
        for(Class<?> c:new Class<?>[]{appearance,format})for(String name:new String[]{"HEADERS","STACKS","FOOTERS","STATES"})try{Field f=c.getDeclaredField(name);f.setAccessible(true);((java.util.Map<?,?>)f.get(null)).clear();}catch(NoSuchFieldException ignored){}
        Field module=appearance.getDeclaredField("module");module.setAccessible(true);module.set(null,new ls.augment.com.hook.AugmentModule());
    }
    static Object[] attach(HeaderClockAndroidTest.Model m)throws Exception{
        Object h=call(appearance,"header",new Class<?>[]{View.class},m.header);
        Object f=call(format,"state",new Class<?>[]{Object.class},m.header);call(f,"attach");return new Object[]{h,f};
    }
    static void frame(HeaderClockAndroidTest.Model m,Object[] state)throws Exception{
        call(state[1],"refresh");call(state[1],"renderClock");call(state[0],"refresh");m.layout();
    }
    static int pixels(HeaderClockAndroidTest.Model m,float dp){return Math.round(dp*m.header.getResources().getDisplayMetrics().density);}
    static void orientation(HeaderClockAndroidTest.Model m,int value){
        m.context.getResources().getConfiguration().orientation=value;
        m.header.getResources().getConfiguration().orientation=value;
    }
    /** NX809J primitive landscape + data usage, from CCHeaderView.updateHeaderResources:
     * date END_OF/ALIGN_BOTTOM(time_group), a 30dp time top, 28dp clock and 33dp
     * clock height. The larger-font variant supplies a new native font baseline.
     * The outer height is a primitive host allocation, not the hidden QS 33dp header. */
    static void landscapeResources(HeaderClockAndroidTest.Model m,float font){
        orientation(m,Configuration.ORIENTATION_LANDSCAPE);m.header.panelType=0;
        m.header.getLayoutParams().height=pixels(m,100);
        m.header.getLayoutParams().width=m.width;
        RelativeLayout.LayoutParams time=new RelativeLayout.LayoutParams(-2,-2);
        time.topMargin=pixels(m,30);time.addRule(RelativeLayout.ALIGN_PARENT_START);
        m.timeGroup.setLayoutParams(time);m.timeGroup.setVisibility(View.VISIBLE);
        m.clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,pixels(m,28)*font);
        RelativeLayout.LayoutParams clock=new RelativeLayout.LayoutParams(-2,Math.round(pixels(m,33)*font));
        clock.addRule(RelativeLayout.ALIGN_PARENT_START);clock.addRule(RelativeLayout.ALIGN_PARENT_TOP);
        m.clock.setLayoutParams(clock);m.clock.setSingleLine(true);m.clock.setHorizontallyScrolling(true);
        m.date.setTextSize(TypedValue.COMPLEX_UNIT_PX,pixels(m,14)*font);
        m.date.setLayoutParams(new RelativeLayout.LayoutParams(-2,Math.round(pixels(m,23)*font)));
        RelativeLayout.LayoutParams date=new RelativeLayout.LayoutParams(-2,-2);
        date.addRule(RelativeLayout.END_OF,HeaderClockAndroidTest.GROUP);date.addRule(RelativeLayout.ALIGN_BOTTOM,HeaderClockAndroidTest.GROUP);
        date.leftMargin=pixels(m,5);date.setMarginStart(pixels(m,5));date.bottomMargin=-pixels(m,2);
        m.dateGroup.setLayoutParams(date);m.dateGroup.setVisibility(View.VISIBLE);
        RelativeLayout.LayoutParams right=new RelativeLayout.LayoutParams(-2,-1);
        right.addRule(RelativeLayout.RIGHT_OF,HeaderClockAndroidTest.GROUP);right.addRule(RelativeLayout.ALIGN_PARENT_END);
        m.right.setLayoutParams(right);
        RelativeLayout.LayoutParams icons=new RelativeLayout.LayoutParams(-1,42);
        icons.topMargin=pixels(m,9);icons.addRule(RelativeLayout.ALIGN_PARENT_TOP);m.icons.setLayoutParams(icons);
        RelativeLayout.LayoutParams footer=new RelativeLayout.LayoutParams(-2,98);
        footer.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);footer.addRule(RelativeLayout.ALIGN_PARENT_END);m.footer.setLayoutParams(footer);m.footer.setVisibility(View.VISIBLE);
        RelativeLayout.LayoutParams usage=new RelativeLayout.LayoutParams(-2,50);
        usage.addRule(RelativeLayout.BELOW,HeaderClockAndroidTest.DATE_GROUP);usage.addRule(RelativeLayout.ALIGN_PARENT_START);
        m.usage.setLayoutParams(usage);m.usage.setVisibility(View.VISIBLE);
        RelativeLayout.LayoutParams am=new RelativeLayout.LayoutParams(-2,50);
        am.addRule(RelativeLayout.END_OF,m.clock.getId());am.addRule(RelativeLayout.ALIGN_PARENT_TOP);am.topMargin=pixels(m,11);
        m.amPm.setLayoutParams(am);m.amPm.setVisibility(View.VISIBLE);m.layout();
    }
    static HeaderClockAndroidTest.Model landscape(boolean rtl,float font){
        HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(2093,1216,rtl,font);landscapeResources(m,font);return m;
    }
    /** Captures native rules after Android resolves logical anchors, including RTL. */
    static final class NativeLandscape {
        final int height,width;final View[] children;final RelativeLayout.LayoutParams[] layouts;
        final Rect actions;final int usageTop,dateTop;final float clockSize;
        NativeLandscape(HeaderClockAndroidTest.Model m){
            height=m.header.getLayoutParams().height;width=m.header.getLayoutParams().width;clockSize=m.clock.getTextSize();
            children=new View[]{m.clock,m.timeGroup,m.date,m.dateGroup,m.right,m.icons,m.footer,m.usage,m.amPm};layouts=new RelativeLayout.LayoutParams[children.length];
            for(int i=0;i<children.length;i++)layouts[i]=new RelativeLayout.LayoutParams((RelativeLayout.LayoutParams)children[i].getLayoutParams());
            actions=m.rect(m.footer);usageTop=m.usage.getTop();dateTop=m.dateGroup.getTop();
        }
        void unchanged(HeaderClockAndroidTest.Model m,boolean visible)throws Exception{
            assertEquals("format preserves primitive host height",height,m.header.getLayoutParams().height);
            assertEquals("format preserves host width",width,m.header.getLayoutParams().width);
            assertEquals("format preserves native clock font",clockSize,m.clock.getTextSize(),0);
            for(int i=0;i<children.length;i++){
                RelativeLayout.LayoutParams expected=layouts[i],actual=(RelativeLayout.LayoutParams)children[i].getLayoutParams();
                assertEquals("native child width "+i,expected.width,actual.width);assertEquals("native child height "+i,expected.height,actual.height);
                assertEquals("native child top "+i,expected.topMargin,actual.topMargin);assertEquals("native child bottom "+i,expected.bottomMargin,actual.bottomMargin);
                assertEquals("native child start "+i,expected.getMarginStart(),actual.getMarginStart());assertEquals("native child end "+i,expected.getMarginEnd(),actual.getMarginEnd());
                assertArrayEquals("native relative anchors "+i,expected.getRules(),actual.getRules());
            }
            assertEquals("plain landscape format does not own notification clock",false,call(appearance,"ownsClock",new Class<?>[]{android.widget.TextView.class},m.clock));
            assertEquals("plain landscape format does not own icon spacing",-1,(Float)call(appearance,"iconSpacingBottom",new Class<?>[]{View.class},m.header),0);
            if(!visible)return;
            assertEquals("footer stays at native action position",actions,m.rect(m.footer));
            assertEquals("date keeps its native row",dateTop,m.dateGroup.getTop());assertEquals("usage keeps its native row",usageTop,m.usage.getTop());
            Rect time=m.rect(m.clock),date=m.rect(m.date),flow=m.rect(m.usage),buttons=m.rect(m.footer);
            assertTrue("date and time remain on one horizontal band",date.top<time.bottom&&date.bottom>time.top);
            assertFalse("native date is outside time glyph box",Rect.intersects(time,date));
            int nativeDateBottom=m.rect(m.dateGroup).bottom+((RelativeLayout.LayoutParams)m.dateGroup.getLayoutParams()).bottomMargin;
            assertTrue("usage follows native date anchor including OEM negative margin",flow.top>=nativeDateBottom);
            assertTrue("flow remains above following content",flow.bottom<=m.body.getTop());assertTrue("buttons remain above following content",buttons.bottom<=m.body.getTop());
            for(View child:new View[]{m.clock,m.date,m.usage,m.button,m.nfc}){
                Rect actual=new Rect();assertTrue("native child has real visible bounds",child.getGlobalVisibleRect(actual));
                assertEquals("native child is not horizontally cropped",child.getWidth(),actual.width());assertEquals("native child is not vertically cropped",child.getHeight(),actual.height());
            }
            assertTrue("native clock remains single line",m.clock.isSingleLine());assertEquals("actual text stays on one line",1,m.clock.getLineCount());
            assertTrue("complete formatted line fits native wrap width",m.clock.getLayout().getLineWidth(0)<=m.clock.getWidth()+1);
            m.button.performClick();assertEquals("native action listener remains usable",1,m.clicks);m.clicks=0;
        }
    }
    static void clockOptions(int mode){FeatureSettings.put("ls_augment_rm_qs_clock_seconds",(mode&1)!=0?"1":"0");FeatureSettings.put("ls_augment_rm_qs_clock_period",(mode&2)!=0?"1":"0");}
    static void formatted(HeaderClockAndroidTest.Model m,int mode){
        String text=m.clock.getText().toString();assertFalse("landscape has no inherited semantic newline",text.contains("\n"));
        assertEquals("seconds toggle really changes time format",(mode&1)!=0?2:1,text.chars().filter(c->c==':').count());
        assertEquals("period toggle really displays Chinese period",(mode&2)!=0,text.matches(".*[\\p{IsHan}].*"));
        assertEquals("accessibility describes complete formatted time",text,m.clock.getContentDescription().toString());
        assertEquals("seconds remains enabled in native clock",(mode&1)!=0,m.clock.mShowSeconds);
    }
    @Test public void trueLandscapeFormatPreservesNativeDateFlowAndActions()throws Exception{
        for(boolean rtl:new boolean[]{false,true})for(float font:new float[]{1,1.3f}){
            init();HeaderClockAndroidTest.Model m=landscape(rtl,font);NativeLandscape nativeLayout=new NativeLandscape(m);Object[] state=attach(m);
            assertEquals(Configuration.ORIENTATION_LANDSCAPE,m.header.getResources().getConfiguration().orientation);
            for(int mode:new int[]{1,2,3}){
                clockOptions(mode);frame(m,state);formatted(m,mode);nativeLayout.unchanged(m,true);
                assertEquals("only Chinese period suppresses native AM",(mode&2)!=0?View.GONE:View.VISIBLE,m.amPm.getVisibility());
                int wanted=m.clock.getText().toString().lastIndexOf(':');m.clock.setText(new android.text.SpannableStringBuilder(m.clock.getText()).insert(wanted,"\n"));
                call(state[1],"renderClock");m.layout();formatted(m,mode);nativeLayout.unchanged(m,true);
                for(int i=0;i<8;i++)frame(m,state);nativeLayout.unchanged(m,true);
                clockOptions(0);frame(m,state);nativeLayout.unchanged(m,true);assertEquals(View.VISIBLE,m.amPm.getVisibility());assertFalse(m.clock.mShowSeconds);
            }
            clockOptions(3);frame(m,state);call(state[0],"close");call(state[1],"detach");m.layout();assertEquals("detach restores native period",View.VISIBLE,m.amPm.getVisibility());nativeLayout.unchanged(m,true);
        }
    }
    @Test public void landscapeNativeCallbacksAndRotationRestoreLatestBaseline()throws Exception{
        for(boolean rtl:new boolean[]{false,true})for(float font:new float[]{1,1.3f}){
            init();HeaderClockAndroidTest.Model m=landscape(rtl,font);Object[] state=attach(m);clockOptions(3);frame(m,state);
            call(state[0],"beginNative");assertEquals("native callback first receives its period",View.VISIBLE,m.amPm.getVisibility());
            m.header.getLayoutParams().height=pixels(m,110);m.clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,pixels(m,26)*font);m.amPm.setVisibility(View.INVISIBLE);m.layout();
            NativeLandscape latest=new NativeLandscape(m);call(state[1],"resources");call(state[0],"endNative");frame(m,state);latest.unchanged(m,true);formatted(m,3);
            clockOptions(0);frame(m,state);assertEquals("off restores latest native INVISIBLE period",View.INVISIBLE,m.amPm.getVisibility());latest.unchanged(m,true);
            clockOptions(3);frame(m,state);call(state[0],"beginNative");orientation(m,Configuration.ORIENTATION_PORTRAIT);m.header.panelType=0;
            m.header.getLayoutParams().height=369;m.clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,156*font);m.clock.setLayoutParams(new RelativeLayout.LayoutParams(-2,Math.round(185*font)));
            RelativeLayout.LayoutParams time=new RelativeLayout.LayoutParams(-2,-2);time.topMargin=103;time.addRule(RelativeLayout.ALIGN_PARENT_START);m.timeGroup.setLayoutParams(time);
            RelativeLayout.LayoutParams date=new RelativeLayout.LayoutParams(-2,-2);date.addRule(RelativeLayout.BELOW,HeaderClockAndroidTest.GROUP);date.addRule(RelativeLayout.ALIGN_PARENT_START);m.dateGroup.setLayoutParams(date);
            m.usage.setVisibility(View.GONE);m.amPm.setVisibility(View.VISIBLE);m.layout();call(state[1],"resources");call(state[0],"endNative");frame(m,state);
            assertEquals("portrait still uses deliberate full-size layout",true,call(appearance,"ownsClock",new Class<?>[]{android.widget.TextView.class},m.clock));
            assertTrue("portrait date remains below time",m.rect(m.date).top>=m.rect(m.clock).bottom);
            call(state[0],"beginNative");landscapeResources(m,font);NativeLandscape rotated=new NativeLandscape(m);call(state[1],"resources");call(state[0],"endNative");frame(m,state);
            formatted(m,3);rotated.unchanged(m,true);clockOptions(0);frame(m,state);rotated.unchanged(m,true);assertEquals(View.VISIBLE,m.amPm.getVisibility());
            call(state[0],"close");call(state[1],"detach");
        }
    }
    @Test public void hiddenNativeLandscapeQsHeaderIsNotResurrected()throws Exception{
        init();HeaderClockAndroidTest.Model m=landscape(false,1);m.header.panelType=1;
        m.timeGroup.setVisibility(View.GONE);m.dateGroup.setVisibility(View.GONE);m.usage.setVisibility(View.GONE);m.amPm.setVisibility(View.GONE);m.footer.setVisibility(View.GONE);
        m.header.getLayoutParams().height=pixels(m,33);m.right.getLayoutParams().height=pixels(m,33);m.layout();NativeLandscape nativeLayout=new NativeLandscape(m);Object[] state=attach(m);
        for(int mode:new int[]{1,2,3,0}){
            clockOptions(mode);frame(m,state);nativeLayout.unchanged(m,false);assertEquals(View.GONE,m.timeGroup.getVisibility());assertEquals(View.GONE,m.dateGroup.getVisibility());assertEquals(View.GONE,m.amPm.getVisibility());
        }
        call(state[0],"close");call(state[1],"detach");assertEquals(View.GONE,m.amPm.getVisibility());
    }
    @Test public void actualHooksOffOnOffAndLatestResourceRestore()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,2688,false,1);Object[] state=attach(m);
        int originalHeight=m.header.getLayoutParams().height;float size=m.clock.getTextSize();
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);m.visible();assertEquals(size,m.clock.getTextSize(),0);
        for(int i=0;i<12;i++)frame(m,state);int expanded=m.header.getHeight();assertTrue(expanded>originalHeight);
        FeatureSettings.put("ls_augment_rm_qs_clock_period","1");frame(m,state);m.visible();String text=m.clock.getText().toString().replace('\n',' ');assertEquals(text,m.clock.getContentDescription().toString());
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);assertTrue(m.clock.getContentDescription().toString().contains(" "));assertEquals(m.clock.getText().toString().replace('\n',' '),m.clock.getContentDescription().toString());
        FeatureSettings.put("ls_augment_rm_qs_clock_period","0");frame(m,state);assertEquals(originalHeight,m.header.getLayoutParams().height);assertTrue(m.clock.isSingleLine());assertTrue(m.clock.isHorizontallyScrollable());assertEquals(size,m.clock.getTextSize(),0);
        assertEquals(HeaderClockAndroidTest.GROUP,((RelativeLayout.LayoutParams)m.right.getLayoutParams()).getRule(RelativeLayout.RIGHT_OF));
        // Outer panel native callback: the native transaction, not an old cached rectangle, owns the new resource values.
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);call(state[0],"beginNative");
        m.header.getLayoutParams().height=400;m.header.getLayoutParams().width=800;m.clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,140);
        call(state[0],"endNative");FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);
        assertEquals("latest native outer height",400,m.header.getLayoutParams().height);assertEquals("latest native width survives",800,m.header.getLayoutParams().width);assertEquals("latest native font",140,m.clock.getTextSize(),0);
        call(state[0],"close");call(state[1],"detach");
    }
    @Test public void weatherNativeVisibilityAndFontRemainWithTheirOwner()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,2688,false,1);Object[] state=attach(m);android.widget.TextView weather=m.weather("晴 26°");
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);weather.setTextSize(TypedValue.COMPLEX_UNIT_PX,60);weather.setVisibility(View.GONE);frame(m,state);
        assertEquals("native weather GONE is not resurrected",View.GONE,weather.getVisibility());assertEquals("weather source still owns its live font",60,weather.getTextSize(),0);assertEquals(false,call(appearance,"ownsWeather",new Class<?>[]{android.widget.TextView.class},weather));
        weather.setVisibility(View.VISIBLE);frame(m,state);m.weatherVisible(weather);FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);assertEquals(60,weather.getTextSize(),0);assertEquals(View.VISIBLE,weather.getVisibility());
        call(state[0],"close");call(state[1],"detach");
    }
    public static class Stack extends FrameLayout {
        public static class Ambient {public int mStatusBarState;public boolean mDozing,mShowingStackOnLockscreen,mShadeExpanded=true;public float mTopPadding=100;}
        public final Ambient mAmbientState=new Ambient();public int mOwnScrollY,calls;public Object mFooterView;
        Stack(Context c){super(c);}
        public void updateTopPadding(float value,boolean animated){mAmbientState.mTopPadding=value;calls++;}
    }
    @Test public void notificationPaddingAndControlHeaderOwnershipRemainSeparate()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,2688,false,1);Stack stack=new Stack(m.context);
        m.root.removeView(m.body);m.root.addView(stack,new LinearLayout.LayoutParams(988,2200));
        android.app.Activity activity=org.robolectric.Robolectric.buildActivity(android.app.Activity.class).setup().get();activity.setContentView(m.root);m.layout();
        assertTrue("stack participates in a real attached Android window",stack.isAttachedToWindow());call(appearance,"stack",new Class<?>[]{View.class},stack);
        Object[] state=attach(m);FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);
        assertEquals("control format never reserves notification padding",100,stack.mAmbientState.mTopPadding,0);
        call(state[0],"beginNative");m.header.panelType=2;call(state[0],"endNative");frame(m,state);
        // In this fixture stack is positioned below header by LinearLayout; top padding need not grow. Move it to the same origin as the real notification overlay.
        stack.layout(0,0,988,2200);call(state[0],"refresh");
        assertTrue("notification gets real current header bottom",stack.mAmbientState.mTopPadding>100);
        FeatureSettings.put(NotificationAppearanceOptions.CLOCK_PORTRAIT,"1");FeatureSettings.put(NotificationAppearanceOptions.clock(false,"size"),"64");frame(m,state);assertEquals(64*m.header.getResources().getDisplayMetrics().scaledDensity,m.clock.getTextSize(),.1f);
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");FeatureSettings.put(NotificationAppearanceOptions.CLOCK_PORTRAIT,"0");frame(m,state);assertEquals("native padding restored",100,stack.mAmbientState.mTopPadding,0);
        call(state[0],"close");call(state[1],"detach");
    }
    @Test public void nativePeriodAndDataUsageRemainOwnedByTheirNativeMode()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,2688,false,1);m.amPm.setVisibility(View.VISIBLE);m.usage.setVisibility(View.VISIBLE);m.layout();Object[] state=attach(m);
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");FeatureSettings.put("ls_augment_rm_qs_clock_period","1");frame(m,state);
        assertEquals("Chinese period suppresses duplicate native AM",View.GONE,m.amPm.getVisibility());assertTrue("usage below date",m.usage.getTop()>=m.dateGroup.getBottom());assertTrue(m.usage.getBottom()<=m.header.getHeight());
        FeatureSettings.put("ls_augment_rm_qs_clock_period","0");frame(m,state);assertEquals("seconds-only restores native AM",View.VISIBLE,m.amPm.getVisibility());
        assertFalse("native AM has its own measured space",android.graphics.Rect.intersects(m.rect(m.amPm),m.rect(m.clock)));assertTrue(m.rect(m.amPm).right<=m.header.getWidth());
        int height=m.header.getHeight();for(int i=0;i<8;i++)frame(m,state);assertEquals("usage/footer positions never accumulate",height,m.header.getHeight());
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);assertEquals(HeaderClockAndroidTest.DATE_GROUP,((RelativeLayout.LayoutParams)m.usage.getLayoutParams()).getRule(RelativeLayout.BELOW));
        call(state[0],"close");call(state[1],"detach");
    }
    @Test public void insufficientViewportStopsFormattingAndRecoversWithoutShrinking()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,400,false,1.3f);Object[] state=attach(m);float size=m.clock.getTextSize();
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);assertFalse("invalid viewport returns native seconds flag",m.clock.mShowSeconds);assertEquals(369,m.header.getLayoutParams().height);assertEquals(size,m.clock.getTextSize(),0);assertEquals("05:38",m.clock.getText().toString());
        FeatureSettings.put("ls_augment_rm_qs_clock_period","1");frame(m,state);assertFalse("settings while blocked cannot restart native seconds",m.clock.mShowSeconds);assertEquals("05:38",m.clock.getText().toString());
        m.root.measure(View.MeasureSpec.makeMeasureSpec(988,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(2688,View.MeasureSpec.EXACTLY));m.root.layout(0,0,988,2688);call(state[0],"refresh");
        assertTrue("new viewport retries rather than sticking on rejection",m.clock.mShowSeconds);assertTrue(m.header.getLayoutParams().height>369);assertEquals(size,m.clock.getTextSize(),0);
        call(state[0],"close");call(state[1],"detach");assertFalse("detach returns native seconds",m.clock.mShowSeconds);assertEquals(369,m.header.getLayoutParams().height);
    }
    @Test public void liveNativeIconRowHeightDoesNotAccumulateOrGetRestoredByClock()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,2688,false,1);Object[] state=attach(m);FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);int base=m.header.getHeight();
        m.icons.getLayoutParams().height=82;m.icons.requestLayout();frame(m,state);assertEquals("new icon capacity grows once",base+40,m.header.getHeight());for(int i=0;i<12;i++)frame(m,state);assertEquals(base+40,m.header.getHeight());
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);assertEquals("clock does not own the native/spacing row",82,m.icons.getLayoutParams().height);
        call(state[0],"close");call(state[1],"detach");
    }
    @Test public void absoluteSpacingLimitCannotGrowFromTheHeightItOwns()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,1400,false,1);Object[] state=attach(m);
        // A full-canvas pair occupies two real cells, not the native overlapping
        // signal/activity paint masks. This only models its measured allocation;
        // asset matching/animation is covered by the separate adapter suite.
        m.nfc.getLayoutParams().width=92;FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);
        Class<?> spacing=Class.forName("ls.augment.com.hook.StatusBarHeaderSpacingHook$State");
        float absolute=(Float)call(appearance,"iconSpacingBottom",new Class<?>[]{View.class},m.header);assertTrue(absolute>188);
        for(int i=0;i<120;i++){
            int safe=(Integer)call(spacing,"safeHeight",new Class<?>[]{ViewGroup.class,ViewGroup.class,int.class},m.icons,m.header,42);
            assertTrue("true Android sibling and viewport budget",146+safe<=absolute+1);
            m.icons.getLayoutParams().height=Math.min(42+i*8,safe);m.icons.requestLayout();frame(m,state);
            assertEquals("applied row growth is never budget income",absolute,(Float)call(appearance,"iconSpacingBottom",new Class<?>[]{View.class},m.header),0);
            assertTrue("clock keeps requested size",m.clock.getTextSize()==156);assertTrue(m.header.getHeight()<=880);
        }
        m.icons.getLayoutParams().height=42;frame(m,state);assertEquals(absolute,(Float)call(appearance,"iconSpacingBottom",new Class<?>[]{View.class},m.header),0);
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);assertEquals(-1,(Float)call(appearance,"iconSpacingBottom",new Class<?>[]{View.class},m.header),0);
        call(state[0],"beginNative");m.clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,120);m.header.getLayoutParams().height=300;call(state[0],"endNative");
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);assertTrue("new native resource font recomputes its independent absolute budget",(Float)call(appearance,"iconSpacingBottom",new Class<?>[]{View.class},m.header)>=absolute);
        call(state[0],"close");call(state[1],"detach");
    }
    @Test public void actualOuterPanelInterceptorsRebaseAndReapplyRealLayout()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,2688,false,1);Object[] state=attach(m);
        ls.augment.com.hook.AugmentModule module=new ls.augment.com.hook.AugmentModule();
        call(appearance,"install",new Class<?>[]{ls.augment.com.hook.AugmentModule.class,ClassLoader.class},module,getClass().getClassLoader());
        Field hooksField=module.getClass().getDeclaredField("hooks");hooksField.setAccessible(true);java.util.Map<?,?> hooks=(java.util.Map<?,?>)hooksField.get(module);
        long outerHooks=hooks.keySet().stream().filter(v->((Method)v).getDeclaringClass().getName().equals("com.zte.controlcenter.view.ControlCenterPanelView")).count();
        assertEquals("both verified native outer setters are intercepted",2,outerHooks);
        com.zte.controlcenter.view.ControlCenterPanelView panel=new com.zte.controlcenter.view.ControlCenterPanelView(m.context);panel.ccHeaderView=m.header;
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);int correct=m.header.getHeight();
        panel.nativeHeight=400;module.invoke(panel,"checkTopPanel");m.layout();assertEquals("native writer cannot crop active rows",correct,m.header.getHeight());m.visible();assertEquals(1,panel.calls);
        panel.nativeWidth=900;panel.nativeHeight=360;module.invoke(panel,"updateResources");m.layout();frame(m,state);m.visible();assertEquals(900,m.header.getWidth());
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);assertEquals("off restores latest panel height",360,m.header.getHeight());assertEquals(900,m.header.getWidth());
        call(state[0],"close");call(state[1],"detach");assertEquals(0,module.errors);
    }
    @Test public void actualWeatherOwnershipLateRefreshRemovalAndNativeRestore()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,2688,true,1.3f);Object[] state=attach(m);
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);
        android.widget.TextView weather=m.weather("晴 26°");float size=weather.getTextSize();frame(m,state);m.weatherVisible(weather);
        assertEquals(true,call(appearance,"ownsWeather",new Class<?>[]{android.widget.TextView.class},weather));
        // Call the real provider hook's alignment method, with its true native
        // END_OF/ALIGN_BASELINE child. No provider queries or scheduled refresh.
        Class<?> w=Class.forName("ls.augment.com.hook.NotificationWeatherHook$State");Constructor<?> constructor=w.getDeclaredConstructor(RelativeLayout.class);constructor.setAccessible(true);Object weatherState=constructor.newInstance(m.header);
        Field label=w.getDeclaredField("label");label.setAccessible(true);label.set(weatherState,new java.lang.ref.WeakReference<>(weather));
        call(weatherState,"alignLabel");assertEquals("owned weather width is not recapped by stale whole-header arithmetic",Integer.MAX_VALUE,weather.getMaxWidth());
        weather.setText("内蒙古自治区呼和浩特市 多云转晴伴有间歇性小雨 当前温度二十六摄氏度");frame(m,state);m.weatherVisible(weather);assertTrue(weather.getLineCount()>1);assertEquals(size,weather.getTextSize(),0);
        int full=m.header.getHeight();weather.setText("晴 26°");frame(m,state);assertTrue("short provider update gives height back",m.header.getHeight()<full);
        Field originals=state[0].getClass().getDeclaredField("originals");originals.setAccessible(true);for(Object record:(java.util.List<?>)originals.get(state[0])){Field rv=record.getClass().getDeclaredField("view"),rl=record.getClass().getDeclaredField("layout");rv.setAccessible(true);rl.setAccessible(true);if(((java.lang.ref.WeakReference<?>)rv.get(record)).get()==weather)assertEquals("snapshot keeps resolved RTL END_OF",m.date.getId(),((RelativeLayout.LayoutParams)rl.get(record)).getRule(RelativeLayout.LEFT_OF));}
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);
        RelativeLayout.LayoutParams nativeLp=(RelativeLayout.LayoutParams)weather.getLayoutParams();assertEquals("RTL END_OF restored",m.date.getId(),nativeLp.getRule(RelativeLayout.LEFT_OF));assertEquals("ALIGN_BASELINE restored",m.date.getId(),nativeLp.getRule(RelativeLayout.ALIGN_BASELINE));assertEquals(26,nativeLp.getMarginStart());assertEquals(640,weather.getMaxWidth());assertTrue(weather.isSingleLine());assertTrue(weather.isHorizontallyScrollable());assertEquals(android.text.TextUtils.TruncateAt.END,weather.getEllipsize());
        FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);m.dateGroup.removeView(weather);frame(m,state);assertNull("removed weather is never reattached",weather.getParent());assertEquals(false,call(appearance,"ownsWeather",new Class<?>[]{android.widget.TextView.class},weather));
        android.widget.TextView replacement=m.weather("北京 晴 26°");frame(m,state);m.weatherVisible(replacement);assertEquals(true,call(appearance,"ownsWeather",new Class<?>[]{android.widget.TextView.class},replacement));assertNull(weather.getParent());
        call(state[0],"beginNative");replacement.setMaxWidth(700);replacement.setTextSize(TypedValue.COMPLEX_UNIT_PX,52);call(state[0],"endNative");frame(m,state);FeatureSettings.put("ls_augment_rm_qs_clock_seconds","0");frame(m,state);assertEquals("rotation/latest native cap restored",700,replacement.getMaxWidth());assertEquals(52,replacement.getTextSize(),0);
        call(weatherState,"close");call(state[0],"close");call(state[1],"detach");
    }
    @Test public void weatherViewportRejectionAndRemovalCanRecover()throws Exception{
        init();HeaderClockAndroidTest.Model m=new HeaderClockAndroidTest.Model(988,1400,false,1.3f);Object[] state=attach(m);
        android.widget.TextView weather=m.weather("很长的城市天气信息".repeat(80));float size=weather.getTextSize();FeatureSettings.put("ls_augment_rm_qs_clock_seconds","1");frame(m,state);
        assertEquals("overfull weather uses native layout",369,m.header.getLayoutParams().height);assertEquals(false,call(appearance,"ownsWeather",new Class<?>[]{android.widget.TextView.class},weather));assertEquals("fallback does not shrink weather",size,weather.getTextSize(),0);assertTrue(weather.isSingleLine());assertEquals(640,weather.getMaxWidth());
        m.dateGroup.removeView(weather);frame(m,state);assertTrue("removing rejected weather invalidates viewport rejection",m.header.getLayoutParams().height>369);assertNull(weather.getParent());m.visible();
        call(state[0],"close");call(state[1],"detach");
    }
}
