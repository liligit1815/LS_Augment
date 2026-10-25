package ls.augment.com;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** Actual Android 16 RelativeLayout/TextView measurement, native graphics enabled.
 * Reproduces the ROM's relative anchors, weight, fixed outer height and offscreen clipping.
 * This verifies layout contracts, not the OEM SystemUI hook installation or phone pixels. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class HeaderClockAndroidTest {
    static final int GROUP=102,DATE_GROUP=104;
    static class Model {
        final Context context=RuntimeEnvironment.getApplication();
        final LinearLayout root=new LinearLayout(context),icons=new LinearLayout(context),footer=new LinearLayout(context);
        final NativeHeader header=new NativeHeader(context);
        final RelativeLayout timeGroup=new RelativeLayout(context),dateGroup=new RelativeLayout(context),right=new RelativeLayout(context);
        final NativeClock clock=new NativeClock(context);final TextView date=new TextView(context),button=new TextView(context),amPm=new TextView(context),usage=new TextView(context);
        final StatusIconContainer statuses=new StatusIconContainer(context);
        final View nfc=new View(context),battery=new View(context),body=new View(context);
        final int width,viewport;int clicks;
        Model(int width,int viewport,boolean rtl,float fontScale){
            context.getApplicationInfo().flags|=android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;
            context.getApplicationInfo().targetSdkVersion=36;
            for(android.content.res.Resources resources:new android.content.res.Resources[]{context.getResources(),header.getResources()}){
                resources.getDisplayMetrics().density=3.25f;resources.getDisplayMetrics().scaledDensity=3.25f*fontScale;resources.getConfiguration().fontScale=fontScale;
            }
            this.width=width;this.viewport=viewport;root.setOrientation(LinearLayout.VERTICAL);
            root.setLayoutDirection(rtl?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR);
            header.setLayoutDirection(root.getLayoutDirection());
            for(View v:new View[]{timeGroup,dateGroup,right,icons,footer,statuses})v.setLayoutDirection(root.getLayoutDirection());
            assertEquals("fixture really uses requested layout direction",rtl?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR,header.getLayoutDirection());
            root.addView(header,new LinearLayout.LayoutParams(width,369));root.addView(body,new LinearLayout.LayoutParams(width,300));
            header.mClockView=clock;header.mDateView=date;header.mTimeGroup=timeGroup;header.mDateViewContainer=dateGroup;right.setId(106);icons.setId(107);footer.setId(108);
            header.addView(timeGroup,new RelativeLayout.LayoutParams(-2,-2));timeGroup.setId(GROUP);
            RelativeLayout.LayoutParams gp=(RelativeLayout.LayoutParams)timeGroup.getLayoutParams();gp.topMargin=103;gp.addRule(RelativeLayout.ALIGN_PARENT_START);
            clock.setId(101);clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,156*fontScale);clock.setTextColor(Color.BLACK);clock.setSingleLine(true);clock.setText("05:37");
            timeGroup.addView(clock,new RelativeLayout.LayoutParams(-2,Math.round(185*fontScale)));
            amPm.setId(109);amPm.setVisibility(View.GONE);amPm.setText("AM");amPm.setTextSize(TypedValue.COMPLEX_UNIT_PX,40*fontScale);RelativeLayout.LayoutParams ap=new RelativeLayout.LayoutParams(-2,50);ap.addRule(RelativeLayout.END_OF,clock.getId());ap.addRule(RelativeLayout.ALIGN_BOTTOM,clock.getId());timeGroup.addView(amPm,ap);
            dateGroup.setId(DATE_GROUP);RelativeLayout.LayoutParams dp=new RelativeLayout.LayoutParams(-2,-2);dp.addRule(RelativeLayout.BELOW,GROUP);dp.addRule(RelativeLayout.ALIGN_PARENT_START);header.addView(dateGroup,dp);
            date.setId(103);date.setText("10月4日 星期日");date.setTextColor(Color.BLACK);date.setTextSize(TypedValue.COMPLEX_UNIT_PX,46*fontScale);date.setSingleLine(true);dateGroup.addView(date,new RelativeLayout.LayoutParams(-2,Math.round(65*fontScale)));
            RelativeLayout.LayoutParams rp=new RelativeLayout.LayoutParams(-2,-1);rp.addRule(RelativeLayout.RIGHT_OF,GROUP);rp.addRule(RelativeLayout.ALIGN_PARENT_END);rp.addRule(RelativeLayout.ALIGN_BOTTOM,DATE_GROUP);header.addView(right,rp);
            icons.setOrientation(LinearLayout.HORIZONTAL);RelativeLayout.LayoutParams ip=new RelativeLayout.LayoutParams(-1,42);ip.topMargin=146;right.addView(icons,ip);
            icons.addView(statuses,new LinearLayout.LayoutParams(0,-1,1));
            for(int i=0;i<8;i++){View v=i==0?nfc:new View(context);v.setBackgroundColor(Color.BLACK);statuses.addView(v,new ViewGroup.LayoutParams(i==0?42:58,42));}
            battery.setBackgroundColor(Color.BLACK);icons.addView(battery,new LinearLayout.LayoutParams(70,42));
            footer.setOrientation(LinearLayout.HORIZONTAL);footer.setGravity(android.view.Gravity.END);RelativeLayout.LayoutParams fp=new RelativeLayout.LayoutParams(-1,98);fp.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);right.addView(footer,fp);
            button.setText("Search");button.setTextSize(20);button.setOnClickListener(v->clicks++);footer.addView(button,new LinearLayout.LayoutParams(98,98));
            for(int i=0;i<2;i++){View v=new View(context);footer.addView(v,new LinearLayout.LayoutParams(98,98));}
            usage.setId(110);usage.setText("Data usage");usage.setVisibility(View.GONE);RelativeLayout.LayoutParams up=new RelativeLayout.LayoutParams(-1,50);up.addRule(RelativeLayout.BELOW,DATE_GROUP);header.addView(usage,up);
            layout();
        }
        void layout(){root.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(viewport,View.MeasureSpec.EXACTLY));root.layout(0,0,width,viewport);}
        void text(boolean seconds,boolean period){SpannableStringBuilder value=new SpannableStringBuilder(seconds?"05:38:25":"05:38");if(period){value.append(" ");int start=value.length();value.append("早上");value.setSpan(new RelativeSizeSpan(.35f),start,value.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}clock.setText(value);clock.setContentDescription(value.toString());}
        HeaderClockGeometry.Plan apply(boolean expanded){return HeaderClockLayout.apply(header,clock,date,timeGroup,dateGroup,right,icons,footer,null,null,103,185,65,0,viewport-300,26,0,0,0,0,expanded);}
        Rect rect(View view){Rect r=new Rect(0,0,view.getWidth(),view.getHeight());root.offsetDescendantRectToMyCoords(view,r);return r;}
        TextView weather(String text){
            TextView v=new TextView(context);v.setLayoutDirection(dateGroup.getLayoutDirection());v.setTag("ls_augment_notification_weather");v.setText(text);v.setTextSize(TypedValue.COMPLEX_UNIT_PX,date.getTextSize());v.setTextColor(Color.BLACK);v.setSingleLine(true);v.setEllipsize(android.text.TextUtils.TruncateAt.END);v.setMaxWidth(640);
            RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(-2,-2);p.addRule(RelativeLayout.END_OF,date.getId());p.addRule(RelativeLayout.ALIGN_BASELINE,date.getId());p.setMarginStart(26);dateGroup.addView(v,p);return v;
        }
        void weatherVisible(TextView weather){
            Rect actual=new Rect();assertTrue("weather has visible pixels",weather.getGlobalVisibleRect(actual));assertEquals("weather parent does not crop width",weather.getWidth(),actual.width());assertEquals("weather parent does not crop height",weather.getHeight(),actual.height());
            assertTrue("date box contains complete weather",rect(dateGroup).contains(rect(weather)));assertFalse("weather stays outside date",Rect.intersects(rect(date),rect(weather)));assertFalse("weather stays outside footer",Rect.intersects(rect(footer),rect(weather)));assertFalse("weather stays outside clock",Rect.intersects(rect(clock),rect(weather)));
            for(int i=0;i<weather.getLineCount();i++){assertEquals("weather text is not ellipsized",0,weather.getLayout().getEllipsisCount(i));assertTrue("weather full glyph line fits",weather.getLayout().getLineWidth(i)<=weather.getWidth()+1);}
            assertTrue("header includes the whole date payload",header.getBottom()>=rect(weather).bottom);
        }
        void visible(){
            Rect n=new Rect();assertTrue("NFC remains in root",nfc.getGlobalVisibleRect(n));assertEquals("NFC complete width",nfc.getWidth(),n.width());assertEquals("NFC complete height",nfc.getHeight(),n.height());
            for(int i=0;i<statuses.getChildCount();i++){View v=statuses.getChildAt(i);Rect actual=rect(v);assertTrue("clock does not overlap status "+i,!Rect.intersects(rect(clock),actual));}
            assertFalse("date and clock separated",Rect.intersects(rect(clock),rect(date)));
            assertFalse("actions and clock separated",Rect.intersects(rect(clock),rect(footer)));
            assertFalse("actions and date separated",Rect.intersects(rect(date),rect(footer)));
            assertTrue("parent reserves complete content height",header.getBottom()>=Math.max(rect(date).bottom,rect(footer).bottom));
            assertTrue("body follows real header",body.getTop()>=header.getBottom());
            assertTrue("not a clip escape hatch",right.getClipChildren());assertTrue("root clipping retained",header.getClipChildren());
            assertEquals("no scale used",1f,clock.getScaleX(),0f);assertEquals("no scale used",1f,clock.getScaleY(),0f);
            assertTrue("clock actual Android Layout exists",clock.getLayout()!=null);
            for(int i=0;i<clock.getLineCount();i++){assertEquals("no ellipsis",0,clock.getLayout().getEllipsisCount(i));assertTrue("complete lines fit",clock.getLayout().getLineWidth(i)<=clock.getWidth()+1);}
            button.performClick();assertEquals("same native click listener",1,clicks);clicks=0;
        }
    }
    public static final class NativeClock extends TextView {
        public boolean mShowSeconds,mDemoMode;
        NativeClock(Context context){super(context);}
        public void updateShowSeconds() { }
        public void updateClock(){setText(mShowSeconds?"05:38:00":"05:38");setContentDescription(getText());}
    }
    public static final class NativeHeader extends RelativeLayout {
        public TextView mClockView,mDateView;public View mTimeGroup,mDateViewContainer;public int panelType=1;
        android.content.res.Resources mapped;
        NativeHeader(Context context){super(context);android.content.res.Resources base=super.getResources();mapped=new android.content.res.Resources(base.getAssets(),base.getDisplayMetrics(),base.getConfiguration()){
            @Override public int getIdentifier(String name,String type,String pkg){switch(name){case "date":return 103;case "date_view":return DATE_GROUP;case "status_icons_group_container":return 106;case "status_icons_group":return 107;case "qs_footer_actions_container":return 108;case "am_pm_view":return 109;case "cell_date_usage":return 110;default:return 0;}}
            @Override public String getResourceEntryName(int id){switch(id){case 106:return "status_icons_group_container";case 107:return "status_icons_group";default:return "fixture_"+id;}}
        };}
        @Override public android.content.res.Resources getResources(){return mapped==null?super.getResources():mapped;}
        public boolean shouldQsCarrierVisible(){return false;}
        public void updateVisibilities(){ }
    }
    /** The same right-aligned, non-shrinking child placement that exposes the ROM defect. */
    static final class StatusIconContainer extends ViewGroup {
        StatusIconContainer(Context context){super(context);}
        @Override protected void onMeasure(int w,int h){for(int i=0;i<getChildCount();i++){View v=getChildAt(i);v.measure(MeasureSpec.makeMeasureSpec(v.getLayoutParams().width,MeasureSpec.EXACTLY),MeasureSpec.makeMeasureSpec(42,MeasureSpec.EXACTLY));}setMeasuredDimension(MeasureSpec.getSize(w),42);}
        @Override protected void onLayout(boolean change,int l,int t,int r,int b){int right=getWidth();for(int i=getChildCount()-1;i>=0;i--){View v=getChildAt(i);int x=right-v.getMeasuredWidth();if(getLayoutDirection()==View.LAYOUT_DIRECTION_RTL)x=getWidth()-right;v.layout(x,0,x+v.getMeasuredWidth(),42);right-=v.getMeasuredWidth();}}
    }
    @Test public void actualAndroidAllModesRetainSizeAndNativeChildren()throws Exception{
        for(boolean rtl:new boolean[]{false,true})for(float font:new float[]{1f,1.3f})for(int width:new int[]{988,1800})for(int mode=1;mode<4;mode++){
            Model m=new Model(width,width==988?2688:1600,rtl,font);m.text((mode&1)!=0,(mode&2)!=0);float size=m.clock.getTextSize();
            HeaderClockGeometry.Plan p=m.apply(false);assertNotNull(p);assertTrue("room exists",p.valid);m.layout();m.visible();assertEquals("configured font preserved",size,m.clock.getTextSize(),0f);
            int height=m.header.getHeight();String value=m.clock.getText().toString();m.apply(false);m.layout();assertEquals("height never accumulates",height,m.header.getHeight());assertEquals("line breaks stable",value,m.clock.getText().toString());
            if(!rtl&&font==1f&&width==988&&mode==3){String out=System.getProperty("duo.evidence");if(out!=null){Bitmap image=Bitmap.createBitmap(width,m.header.getHeight(),Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(image);canvas.drawColor(Color.WHITE);m.header.draw(canvas);try(FileOutputStream stream=new FileOutputStream(new File(out,"actual-android-header.png"))){image.compress(Bitmap.CompressFormat.PNG,100,stream);}image.recycle();}}
        }
    }
    @Test public void oldHalfWidthAndClipWorkaroundCannotPass(){
        Model m=new Model(988,2688,false,1);m.text(true,false);
        // This is the old production fitClock policy, intentionally exercised as a negative control.
        float size=m.clock.getTextSize();float full=android.text.Layout.getDesiredWidth(m.clock.getText(),m.clock.getPaint());m.clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,size*Math.min(1f,494/full));m.layout();
        Rect visible=new Rect();m.nfc.getGlobalVisibleRect(visible);assertTrue("old half-width clips actual Android child",visible.width()<m.nfc.getWidth());assertTrue("old method shrinks user size",m.clock.getTextSize()<size);
        m.right.setClipChildren(false);m.icons.setClipChildren(false);m.statuses.setClipChildren(false);assertTrue("unclipping is not layout",Rect.intersects(m.rect(m.clock),m.rect(m.nfc)));
    }
    @Test public void missingOuterHeightIsObservableInRealAndroid(){
        Model m=new Model(988,2688,false,1.3f);m.text(true,true);assertTrue(m.apply(false).valid);m.header.getLayoutParams().height=369;m.layout();
        assertTrue("fixed parent crops or overlaps body",m.rect(m.date).bottom>m.header.getBottom()||m.rect(m.footer).bottom>m.header.getBottom());
    }
    @Test public void largeConfiguredTextUsesActualMultiLineLayout(){
        Model m=new Model(988,2688,false,1);m.clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,280);m.text(true,true);assertTrue(m.apply(true).valid);m.layout();m.visible();
        assertEquals(280,m.clock.getTextSize(),0);assertTrue("semantic boundary wraps at original size",m.clock.getLineCount()>1);assertEquals("HH:mm stays one semantic unit","05:38",m.clock.getText().toString().split("\n")[0]);
        m=new Model(988,2688,false,1);m.clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,422);m.text(false,false);assertNull("impossible HH:mm cannot split into hours and minutes",m.apply(true));assertEquals(422,m.clock.getTextSize(),0);assertEquals("05:38",m.clock.getText().toString());
    }
    @Test public void zeroHeightNativeFooterDoesNotReserveAnEmptyRow(){
        Model hidden=new Model(988,2688,false,1);hidden.text(true,false);hidden.weather("碑林区 阴 12°C");
        hidden.footer.getLayoutParams().height=0;hidden.footer.setVisibility(View.INVISIBLE);hidden.layout();
        HeaderClockGeometry.Plan zero=hidden.apply(false);assertTrue(zero.valid);hidden.layout();
        Model gone=new Model(988,2688,false,1);gone.text(true,false);gone.weather("碑林区 阴 12°C");gone.footer.setVisibility(View.GONE);gone.layout();HeaderClockGeometry.Plan absent=gone.apply(false);assertTrue(absent.valid);
        assertEquals("zero-height footer has no phantom row or gap",absent.bottom,zero.bottom);
        assertEquals("zero-height native footer remains zero",0,hidden.footer.getLayoutParams().height);
    }
    @Test public void fullCanvasPairPreservesItsActualParentReservation(){
        Model m=new Model(1800,1600,false,1);FrameLayout pair=new FrameLayout(m.context);pair.addView(new View(m.context),new FrameLayout.LayoutParams(46,42));pair.addView(new View(m.context),new FrameLayout.LayoutParams(46,42));
        m.statuses.removeAllViews();m.statuses.addView(pair,new ViewGroup.LayoutParams(92,42));m.layout();assertEquals("full canvas pair is two cells wide",92,HeaderClockLayout.naturalWidth(pair));assertEquals(162,HeaderClockLayout.naturalWidth(m.icons));
        pair.getLayoutParams().width=ViewGroup.LayoutParams.MATCH_PARENT;assertEquals("a clipped MATCH_PARENT allocation is not natural width",46,HeaderClockLayout.naturalWidth(pair));
    }
    @Test public void collapsedSecondSimCannotMoveFormattedClockToAnotherRow(){
        for(boolean rtl:new boolean[]{false,true}){
            Model sample=new Model(1216,2688,rtl,1);sample.text(true,false);
            int compositeWidth=125,clockWidth=HeaderClockLayout.naturalWidth(sample.clock);
            // The final signal pack fits the same row with eight pixels to spare.
            // Its retained second native SIM must not spend another 65 pixels.
            Model m=new Model(clockWidth+compositeWidth+70+26+8,2688,rtl,1);m.text(true,false);
            m.statuses.removeAllViews();
            FrameLayout composite=new FrameLayout(m.context),second=new FrameLayout(m.context);
            View nativeFirst=new View(m.context),nativeSecond=new View(m.context);
            composite.addView(nativeFirst,new FrameLayout.LayoutParams(65,42));
            second.addView(nativeSecond,new FrameLayout.LayoutParams(65,42));
            m.statuses.addView(composite,new ViewGroup.LayoutParams(65,42));
            m.statuses.addView(second,new ViewGroup.LayoutParams(65,42));m.layout();
            HeaderClockGeometry.Plan nativePlan=m.apply(false);assertNotNull(nativePlan);assertTrue(nativePlan.valid);
            assertFalse("the two original native SIM cells fit beside the clock",nativePlan.stacked);
            composite.getLayoutParams().width=compositeWidth;second.getLayoutParams().width=0;
            nativeFirst.setTransitionAlpha(0);second.setTransitionAlpha(0);m.layout();
            assertEquals("collapsed native SIM has no occupied horizontal cell",0,HeaderClockLayout.naturalWidth(second));
            assertEquals("weighted status container still includes its real children",compositeWidth+70,HeaderClockLayout.naturalWidth(m.icons));
            for(int pass=0;pass<4;pass++){
                HeaderClockGeometry.Plan plan=m.apply(false);assertNotNull(plan);assertTrue(plan.valid);
                assertFalse("a collapsed second SIM cannot force a stacked header",plan.stacked);
                assertEquals("formatted clock retains its original top",103,plan.clockTop);m.layout();
            }
            assertSame("native SIM child stays available for restoration",nativeSecond,second.getChildAt(0));
            second.getLayoutParams().width=65;second.setTransitionAlpha(1);m.layout();
            assertEquals("restoring native width restores its occupied cell",65,HeaderClockLayout.naturalWidth(second));
        }
    }
    @Test public void periodRowsRemainStableWhenBluetoothAppears(){
        for(boolean rtl:new boolean[]{false,true}){
            Model m=new Model(1216,2688,rtl,1);m.text(true,true);m.layout();
            HeaderClockGeometry.Plan initial=m.apply(false);assertTrue(initial.valid);assertTrue(initial.stacked);m.layout();
            int clockTop=m.rect(m.clock).top,dateTop=m.rect(m.date).top,bottom=initial.bottom;
            for(int width:new int[]{0,64,140,64,0}){
                m.nfc.getLayoutParams().width=width;m.text(true,true);m.layout();
                HeaderClockGeometry.Plan changed=m.apply(false);assertTrue(changed.valid);m.layout();
                assertEquals("Bluetooth must not move period clock",clockTop,m.rect(m.clock).top);
                assertEquals("Bluetooth must not move date",dateTop,m.rect(m.date).top);
                assertEquals("notification boundary remains stable",bottom,changed.bottom);
            }
        }
    }
    @Test public void actualWeatherSharesDateBoxAndWrapsBeforeNativeActions(){
        for(boolean rtl:new boolean[]{false,true})for(float font:new float[]{1f,1.3f})for(int width:new int[]{988,1800})for(boolean expanded:new boolean[]{false,true})for(String text:new String[]{"晴 26°","内蒙古自治区呼和浩特市 多云转晴伴有间歇性小雨 当前温度二十六摄氏度"}){
            Model m=new Model(width,2688,rtl,font);m.text(true,true);TextView weather=m.weather(text);float size=weather.getTextSize();int[] clicks={0,0};m.date.setOnClickListener(v->clicks[0]++);weather.setOnClickListener(v->clicks[1]++);
            HeaderClockGeometry.Plan p=m.apply(expanded);assertNotNull(p);assertTrue("weather and footer fit real viewport",p.valid);m.layout();m.visible();m.weatherVisible(weather);assertEquals("weather original font retained",size,weather.getTextSize(),0);
            if(text.length()>10){assertTrue("long weather moves below date",m.rect(weather).top>=m.rect(m.date).bottom);if(width==988)assertTrue("long weather actually wraps",weather.getLineCount()>1);}else assertTrue("short weather shares date row",m.rect(weather).top<m.rect(m.date).bottom);
            m.date.performClick();weather.performClick();assertArrayEquals("both original click targets retained",new int[]{1,1},clicks);
            int height=m.header.getHeight();for(int i=0;i<4;i++){assertTrue(m.apply(expanded).valid);m.layout();m.weatherVisible(weather);}assertEquals("weather positions do not fund another header row",height,m.header.getHeight());
        }
    }
}
