package ls.augment.com;

import android.app.Activity;
import android.content.res.Configuration;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout;
import com.zte.mifavor.qs.MfvQSContainerImpl;
import ls.augment.com.hook.AugmentModule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static ls.augment.com.HeaderClockHooksAndroidTest.call;
import static org.junit.Assert.*;

/** Real Android header measurement and the registered native top-padding hook.
 * The fixture also records OEM changed-only top-padding animation requests;
 * OEM notification row rendering/StackStateAnimator remain outside its boundary. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class NotificationHeaderSpacingAndroidTest {
    static java.lang.reflect.Field stateField(Object state,String name)throws Exception{
        java.lang.reflect.Field field=state.getClass().getDeclaredField(name);field.setAccessible(true);return field;
    }
    static void stateFlag(Object state,String name,boolean value)throws Exception{stateField(state,name).setBoolean(state,value);}
    /** Earlier negative-control source has no allocating field. Its padding behavior,
     * rather than this implementation detail, must decide whether the test fails. */
    static void optionalAllocating(Object state,boolean value)throws Exception{
        try{stateFlag(state,"allocating",value);}catch(NoSuchFieldException ignored){}
    }
    /** The production adapter must also recognize OEM subclasses through their superclass. */
    static final class DerivedQsContainer extends MfvQSContainerImpl {
        DerivedQsContainer(android.content.Context context){super(context);}
    }
    static final class Model implements AutoCloseable {
        final HeaderClockAndroidTest.Model header;
        final Activity activity;
        final FrameLayout root;
        final NotificationStackScrollLayout stack;
        final View card;
        final MfvQSContainerImpl qs;
        final AugmentModule module=new AugmentModule();
        final Object headerState,formatter,stackState;
        Model(boolean rtl,float font)throws Exception{this(rtl,font,0);}
        Model(boolean rtl,float font,int qsMode)throws Exception{
            HeaderClockHooksAndroidTest.init();header=new HeaderClockAndroidTest.Model(988,2688,rtl,font);
            header.header.panelType=2;header.footer.getLayoutParams().height=0;header.footer.setVisibility(View.INVISIBLE);
            header.weather("碑林区 阴 19°C");header.root.removeView(header.header);
            activity=Robolectric.buildActivity(Activity.class).setup().get();root=new FrameLayout(activity);
            stack=new NotificationStackScrollLayout(activity);root.setLayoutDirection(header.root.getLayoutDirection());
            FrameLayout rows=new FrameLayout(activity);stack.addView(rows,new ScrollView.LayoutParams(988,2688));
            card=new View(activity);card.setBackgroundColor(android.graphics.Color.MAGENTA);rows.addView(card,new FrameLayout.LayoutParams(988,180));stack.firstCard=card;
            qs=qsMode==0?null:new DerivedQsContainer(activity);
            if(qs==null){root.addView(stack,new FrameLayout.LayoutParams(988,2688));root.addView(header.header,new FrameLayout.LayoutParams(988,369));}
            else{
                root.addView(qs,new FrameLayout.LayoutParams(988,2688));
                if(qsMode==2)qs.addView(stack,new FrameLayout.LayoutParams(988,2688));else root.addView(stack,new FrameLayout.LayoutParams(988,2688));
                qs.addView(header.header,new FrameLayout.LayoutParams(988,369));
            }
            activity.setContentView(root);layout();assertTrue(stack.isAttachedToWindow());
            call(HeaderClockHooksAndroidTest.appearance,"install",new Class<?>[]{AugmentModule.class,ClassLoader.class},module,getClass().getClassLoader());
            stack.testModule=module;
            stackState=call(HeaderClockHooksAndroidTest.appearance,"stack",new Class<?>[]{View.class},stack);
            Object[] states=HeaderClockHooksAndroidTest.attach(header);headerState=states[0];formatter=states[1];
        }
        void layout(){root.measure(View.MeasureSpec.makeMeasureSpec(988,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(2688,View.MeasureSpec.EXACTLY));root.layout(0,0,988,2688);}
        void frame()throws Exception{call(formatter,"refresh");call(formatter,"renderClock");call(headerState,"refresh");layout();call(stackState,"refresh");layout();}
        void nativePadding(float value)throws Exception{nativePadding(value,false);}
        void nativePadding(float value,boolean animated)throws Exception{module.invoke(stack,"updateTopPadding",value,animated);}
        float nativeBaseline()throws Exception{java.lang.reflect.Field field=stackState.getClass().getDeclaredField("nativePadding");field.setAccessible(true);return field.getFloat(stackState);}
        void formatOnlyWithStackDisabled(){
            ls.augment.com.hook.FeatureSettings.put("ls_augment_rm_notification_stack","0");
            ls.augment.com.hook.FeatureSettings.put(NotificationAppearanceOptions.CLOCK_PORTRAIT,"0");
            ls.augment.com.hook.FeatureSettings.put(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"0");
            HeaderClockHooksAndroidTest.clockOptions(3);
        }
        void settleInitialFrame()throws Exception{frame();stack.dispatchChildrenPreDraw();layout();}
        /** Only this explicit offset substitutes the captured OEM per-row spring transport.
         * Real Android coordinates/measurement and all registered header hooks still execute. */
        void springPreDraw(float nativeRowSpring){
            stack.requestChildrenUpdate();stack.dispatchChildrenPreDraw();
            card.setTranslationY(card.getTranslationY()+nativeRowSpring);
        }
        float screenTop(View view){int[] position=new int[2];view.getLocationOnScreen(position);return position[1];}
        float visualDateToCardGap(){return screenTop(card)-screenTop(header.dateGroup)-header.dateGroup.getHeight();}
        float budget()throws Exception{return ((Number)call(HeaderClockHooksAndroidTest.appearance,"headerBudget",new Class<?>[]{View.class,View.class},header.header,stack)).floatValue();}
        String signature()throws Exception{return (String)call(headerState,"spaceSignature",new Class<?>[]{View.class,View.class},header.header,stack);}
        float expectedPadding(float gap){int[] h=new int[2],s=new int[2];header.header.getLocationOnScreen(h);stack.getLocationOnScreen(s);return h[1]+header.header.getLayoutParams().height-s[1]+gap*header.header.getResources().getDisplayMetrics().density;}
        void exactGap(float gap){assertEquals("current header owns exactly its requested list gap",expectedPadding(gap),stack.mAmbientState.mTopPadding,.99f);}
        @Override public void close()throws Exception{call(headerState,"close");call(formatter,"detach");activity.finish();assertEquals("native padding adapter did not log errors",0,module.errors);}
    }
    @Test public void formatOnlyUnsharedQsSpringMovesDateAndFirstCardOncePerFrame()throws Exception{
        for(boolean rtl:new boolean[]{false,true})for(float font:new float[]{1,1.3f})try(Model m=new Model(rtl,font,1)){
            m.formatOnlyWithStackDisabled();m.settleInitialFrame();m.stack.clearPaddingChanges();
            float padding=m.stack.mAmbientState.mTopPadding,gap=m.visualDateToCardGap();int dateTop=m.header.dateGroup.getTop(),dateHeight=m.header.dateGroup.getHeight();
            for(float spring:new float[]{0,42,96,-31,0,.35f,.7f,.5f,-.5f,42.35f,96.7f,-.4f,-31.7f,0}){
                m.qs.setTranslationY(spring);m.springPreDraw(spring);
                assertEquals("this same pre-draw keeps date/card visual gap; native row spring occurs once: "+spring,gap,m.visualDateToCardGap(),.99f);
                assertEquals("unshared QS spring is not added to layout padding: "+spring,padding,m.stack.mAmbientState.mTopPadding,.99f);
                assertEquals("native first-card translation keeps its spring offset",(int)padding+spring,m.card.getTranslationY(),.01f);
                assertEquals("drawing spring does not rewrite date layout",dateTop,m.header.dateGroup.getTop());assertEquals(dateHeight,m.header.dateGroup.getHeight());
                assertFalse("one native pre-draw consumes its own request",m.stack.mChildrenUpdateRequested);
            }
            assertEquals("spring-only motion must not rewrite top-padding transport",0,m.stack.paddingChanges.size());
        }
    }
    @Test public void formatOnlyUnsharedQsSpringDoesNotChangeLayoutBudgetOrRejectionSignature()throws Exception{
        try(Model m=new Model(false,1.3f,1)){
            m.formatOnlyWithStackDisabled();m.settleInitialFrame();float budget=m.budget(),padding=m.stack.mAmbientState.mTopPadding;String signature=m.signature();
            for(float spring:new float[]{0,.35f,.7f,.5f,-.5f,63.35f,119.7f,-.4f,-52.7f,0}){
                m.qs.setTranslationY(spring);
                assertEquals("drawing-only spring keeps the available header budget: "+spring,budget,m.budget(),.01f);
                assertEquals("subpixel spring cannot churn rejected-space retry signatures: "+spring,signature,m.signature());
                m.springPreDraw(spring);assertEquals("padding remains stable after the same pre-draw",padding,m.stack.mAmbientState.mTopPadding,.99f);
            }
        }
    }
    @Test public void unsharedQsCorrectionPreservesDirectHeaderAndStackPositionChanges()throws Exception{
        try(Model m=new Model(false,1.3f,1)){
            m.formatOnlyWithStackDisabled();m.settleInitialFrame();float base=m.stack.mAmbientState.mTopPadding,gap=m.visualDateToCardGap(),budget=m.budget();
            m.header.header.setTranslationY(17);m.stack.setTranslationY(-12);
            for(float spring:new float[]{0,.35f,78.7f,-38.4f,0}){
                m.qs.setTranslationY(spring);m.springPreDraw(spring);
                assertEquals("header +17 and stack -12 remain genuine layout changes",base+29,m.stack.mAmbientState.mTopPadding,.99f);
                assertEquals("direct view displacement still preserves the same visible gap",gap,m.visualDateToCardGap(),.99f);
                assertEquals("layout budget still includes direct relative displacement",budget-29,m.budget(),.01f);
            }
            m.header.header.setTranslationY(0);m.stack.setTranslationY(0);m.qs.setTranslationY(0);m.springPreDraw(0);
            assertEquals("direct displacement removal restores its original allocation",base,m.stack.mAmbientState.mTopPadding,.99f);
        }
    }
    @Test public void sharedQsAncestorMotionIsNotSubtractedTwice()throws Exception{
        for(boolean rtl:new boolean[]{false,true})try(Model m=new Model(rtl,1.3f,2)){
            m.formatOnlyWithStackDisabled();m.settleInitialFrame();m.header.header.setTranslationY(17);m.stack.setTranslationY(-12);m.springPreDraw(0);
            float padding=m.stack.mAmbientState.mTopPadding,gap=m.visualDateToCardGap(),budget=m.budget();String signature=m.signature();
            for(float spring:new float[]{0,.35f,.7f,71.35f,-.4f,-46.7f,0}){
                m.qs.setTranslationY(spring);
                // The common Android ancestor already transports both views once.
                m.springPreDraw(0);
                assertEquals("shared QS screen motion already cancels in header/stack coordinates",padding,m.stack.mAmbientState.mTopPadding,.99f);
                assertEquals("common ancestor keeps the visual date/card gap",gap,m.visualDateToCardGap(),.99f);
                assertEquals("shared ancestor cannot change layout budget",budget,m.budget(),.01f);assertEquals(signature,m.signature());
            }
        }
    }
    @Test public void delayedNativeExpansionPaddingCannotMoveAnUnchangedDate()throws Exception{
        for(boolean rtl:new boolean[]{false,true})for(float font:new float[]{1,1.3f})try(Model m=new Model(rtl,font)){
            HeaderClockHooksAndroidTest.clockOptions(3);m.frame();m.exactGap(8);
            int dateTop=m.header.dateGroup.getTop(),dateBottom=m.header.dateGroup.getBottom();float committed=m.stack.mAmbientState.mTopPadding;
            for(float nativeValue:new float[]{committed+40,committed+140,committed+40}){
                m.nativePadding(nativeValue);assertEquals("registered setter never paints a late larger gap",committed,m.stack.mAmbientState.mTopPadding,.99f);
                for(int i=0;i<8;i++)m.frame();m.exactGap(8);
                assertEquals("date top did not cause list movement",dateTop,m.header.dateGroup.getTop());assertEquals(dateBottom,m.header.dateGroup.getBottom());
            }
            m.header.header.setTranslationY(17);m.stack.setTranslationY(-12);m.frame();m.exactGap(8);
            HeaderClockHooksAndroidTest.clockOptions(0);m.frame();assertEquals("disable restores latest actual native padding",committed+40,m.stack.mAmbientState.mTopPadding,.99f);
        }
    }
    @Test public void compactClockTracksItsOwnGapBelowLargerNativePadding()throws Exception{
        try(Model m=new Model(false,1.3f)){
            HeaderClockHooksAndroidTest.clockOptions(3);
            ls.augment.com.hook.FeatureSettings.put(NotificationAppearanceOptions.CLOCK_PORTRAIT,"1");
            ls.augment.com.hook.FeatureSettings.put(NotificationAppearanceOptions.clock(false,"list_gap"),"16");m.frame();m.exactGap(16);
            m.nativePadding(1400);m.exactGap(16);int expanded=m.header.header.getHeight();
            for(int scroll:new int[]{390,180,0,390,0}){
                m.stack.mOwnScrollY=scroll;m.frame();m.exactGap(16);
                if(scroll==390)assertTrue("native scroll really compacts the clock",m.header.header.getHeight()<expanded);
                m.nativePadding(1400);m.exactGap(16);
            }
            ls.augment.com.hook.FeatureSettings.put(NotificationAppearanceOptions.CLOCK_PORTRAIT,"0");HeaderClockHooksAndroidTest.clockOptions(0);m.frame();
            assertEquals("lower owned allocation is still restored on disable",1400,m.stack.mAmbientState.mTopPadding,0);
        }
    }
    @Test public void nativeHeaderTransactionKeepsCommittedPaddingAndUnpollutedRestoreValue()throws Exception{
        try(Model m=new Model(false,1)){
            HeaderClockHooksAndroidTest.clockOptions(3);m.frame();m.exactGap(8);float committed=m.stack.mAmbientState.mTopPadding;
            m.nativePadding(920);assertEquals(920,m.nativeBaseline(),0);m.exactGap(8);
            call(m.headerState,"beginNative");call(m.headerState,"beginNative");
            m.nativePadding(committed);call(m.stackState,"refresh");
            assertEquals("resource echo cannot replace native baseline",920,m.nativeBaseline(),0);
            assertEquals("temporary native header restore cannot move notifications",committed,m.stack.mAmbientState.mTopPadding,.99f);
            assertEquals("native transaction retains viewport ownership",true,call(m.stackState,"ownsHeader"));
            m.nativePadding(940);assertEquals("different genuine resource padding is retained",940,m.nativeBaseline(),0);
            assertEquals("new native value waits for header commit",committed,m.stack.mAmbientState.mTopPadding,.99f);
            m.header.clock.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,140);m.header.header.getLayoutParams().height=400;
            call(m.headerState,"endNative");call(m.stackState,"refresh");assertEquals("nested native callback cannot release padding",committed,m.stack.mAmbientState.mTopPadding,.99f);
            call(m.headerState,"endNative");m.frame();m.exactGap(8);assertEquals("latest native font is still used",140,m.header.clock.getTextSize(),0);
            m.stack.mAmbientState.mShadeExpanded=false;m.frame();assertEquals("closed shade uses latest native spacing",940,m.stack.mAmbientState.mTopPadding,0);
            m.stack.mAmbientState.mShadeExpanded=true;m.frame();m.exactGap(8);
            HeaderClockHooksAndroidTest.clockOptions(0);m.frame();assertEquals("off preserves genuine callback baseline",940,m.stack.mAmbientState.mTopPadding,0);
        }
    }
    @Test public void adjustingSelfWriteRevalidatesHeaderBeforeTheSameNativePreDraw()throws Exception{
        for(boolean rtl:new boolean[]{false,true})try(Model m=new Model(rtl,1.3f)){
            m.formatOnlyWithStackDisabled();m.settleInitialFrame();float committed=m.stack.mAmbientState.mTopPadding,gap=m.visualDateToCardGap();
            float nativeBaseline=committed-39;m.nativePadding(nativeBaseline);assertEquals(nativeBaseline,m.nativeBaseline(),0);
            int dateTop=m.header.dateGroup.getTop(),dateHeight=m.header.dateGroup.getHeight();
            // Reentrant work committed the current header after updatePadding computed
            // an older argument. Enter the actual registered setter while it still owns
            // its write; do not run a stabilizing header/layout frame before rendering.
            stateFlag(m.stackState,"adjusting",true);
            try{
                for(float stale:new float[]{committed-39,committed+40,committed-39}){
                    m.nativePadding(stale);m.springPreDraw(0);
                    assertEquals("a stale owned argument cannot paint a one-frame date/card gap",gap,m.visualDateToCardGap(),.99f);
                    assertEquals("own setter revalidates current committed padding",committed,m.stack.mAmbientState.mTopPadding,.99f);
                    assertEquals("adjusting writes cannot become the original restore baseline",nativeBaseline,m.nativeBaseline(),0);
                    assertEquals("date layout stays unchanged through the stale write",dateTop,m.header.dateGroup.getTop());assertEquals(dateHeight,m.header.dateGroup.getHeight());
                    assertFalse("this jump is not explained by pending OEM top-padding animation",m.stack.mTopPaddingNeedsAnimation);
                }
            }finally{stateFlag(m.stackState,"adjusting",false);}
            HeaderClockHooksAndroidTest.clockOptions(0);m.frame();
            assertEquals("disable restores the genuine baseline after reentrant own writes",nativeBaseline,m.stack.mAmbientState.mTopPadding,0);
        }
    }
    @Test public void ownHeaderTransactionHoldsCommittedPaddingAndReleasesNativeModes()throws Exception{
        try(Model m=new Model(false,1.3f)){
            m.formatOnlyWithStackDisabled();m.settleInitialFrame();float committed=m.stack.mAmbientState.mTopPadding,gap=m.visualDateToCardGap();
            float nativeBaseline=committed-39;m.nativePadding(nativeBaseline);assertEquals(nativeBaseline,m.nativeBaseline(),0);
            int dateTop=m.header.dateGroup.getTop(),dateHeight=m.header.dateGroup.getHeight();
            assertEquals("this is the module's refresh, outside native resource callbacks",0,stateField(m.headerState,"nativeDepth").getInt(m.headerState));
            stateFlag(m.headerState,"refreshing",true);optionalAllocating(m.headerState,true);
            try{
                call(m.headerState,"restore");assertFalse("own refresh briefly restores its layout snapshot",stateField(m.headerState,"applied").getBoolean(m.headerState));
                assertTrue("restore has requested layout but its native frame is not committed",m.header.header.isLayoutRequested());
                m.nativePadding(nativeBaseline);m.springPreDraw(0);
                assertEquals("temporary own restore cannot paint a shorter date/card gap",gap,m.visualDateToCardGap(),.99f);
                assertEquals("allowed own transaction holds the committed allocation",committed,m.stack.mAmbientState.mTopPadding,.99f);
                assertEquals("pending restore did not yet move the measured date",dateTop,m.header.dateGroup.getTop());assertEquals(dateHeight,m.header.dateGroup.getHeight());
                assertEquals("viewport ownership survives the uncommitted own restore",true,call(m.stackState,"ownsHeader"));
                m.nativePadding(committed);m.springPreDraw(0);
                assertEquals("echoed owned value during own restore cannot overwrite native baseline",nativeBaseline,m.nativeBaseline(),0);
                assertEquals("the following pre-draw still sees the committed gap",gap,m.visualDateToCardGap(),.99f);
            }finally{optionalAllocating(m.headerState,false);stateFlag(m.headerState,"refreshing",false);}
            m.frame();m.springPreDraw(0);m.exactGap(8);assertEquals("completed refresh keeps its original restore baseline",nativeBaseline,m.nativeBaseline(),0);
            HeaderClockHooksAndroidTest.clockOptions(0);m.frame();
            assertEquals("disabled/native mode immediately releases committed padding",nativeBaseline,m.stack.mAmbientState.mTopPadding,0);
            assertEquals(false,call(m.stackState,"ownsHeader"));

            HeaderClockHooksAndroidTest.clockOptions(3);m.frame();m.exactGap(8);
            HeaderClockHooksAndroidTest.orientation(m.header,Configuration.ORIENTATION_LANDSCAPE);call(m.headerState,"refresh");
            assertEquals("format-only landscape does not retain the previous portrait allocation",nativeBaseline,m.stack.mAmbientState.mTopPadding,0);
            assertEquals(false,call(m.stackState,"ownsHeader"));
            HeaderClockHooksAndroidTest.orientation(m.header,Configuration.ORIENTATION_PORTRAIT);m.frame();m.exactGap(8);

            m.stack.getLayoutParams().height=150;m.stack.requestLayout();m.layout();m.frame();
            assertNotNull("insufficient viewport exercises actual geometry rejection",stateField(m.headerState,"rejectedSpace").get(m.headerState));
            assertEquals("rejected own refresh releases padding before returning",nativeBaseline,m.stack.mAmbientState.mTopPadding,0);
            assertEquals(false,call(m.stackState,"ownsHeader"));
            m.stack.getLayoutParams().height=2688;m.stack.requestLayout();m.layout();m.frame();m.exactGap(8);

            // A new layout may be marked applied before its initial plan has a bottom.
            // That intermediate value must not allocate the list at the header origin.
            float bottom=stateField(m.headerState,"contentBottom").getFloat(m.headerState);
            stateField(m.headerState,"contentBottom").setFloat(m.headerState,0);
            try{
                assertEquals("uncommitted zero-bottom geometry is not a valid header allocation",-1,((Number)call(m.headerState,"bottomInStack",new Class<?>[]{View.class},m.stack)).floatValue(),0);
                m.nativePadding(nativeBaseline);assertEquals("initial geometry falls back to native padding",nativeBaseline,m.stack.mAmbientState.mTopPadding,0);
                assertEquals(false,call(m.stackState,"ownsHeader"));
            }finally{stateField(m.headerState,"contentBottom").setFloat(m.headerState,bottom);}
            m.frame();m.exactGap(8);
        }
    }
    @Test public void oemChangedOnlyTransportIncludesPendingAnimationAndKeepsOtherWork()throws Exception{
        try(Model m=new Model(false,1)){
            // Native mode passes its animation semantics through the registered hook.
            HeaderClockHooksAndroidTest.clockOptions(0);m.frame();m.stack.clearPaddingChanges();
            m.stack.mAnimateNextTopPaddingChange=true;m.nativePadding(100.99f,false);
            assertTrue("same truncated pixel does not consume pending animation",m.stack.mAnimateNextTopPaddingChange);
            assertEquals("same pixel does not enqueue top-padding work",0,m.stack.paddingChanges.size());
            m.nativePadding(101.99f,false);
            assertEquals(101,m.stack.mAmbientState.mTopPadding,0);
            assertEquals("false still merges the OEM pending flag",1,m.stack.topAnimationCount());
            assertFalse(m.stack.mAnimateNextTopPaddingChange);assertTrue(m.stack.mTopPaddingNeedsAnimation);
            m.stack.consumeAnimationFrame();m.stack.clearPaddingChanges();
            m.nativePadding(130.9f,true);assertEquals("ordinary native animated padding remains animated",1,m.stack.topAnimationCount());
            m.stack.consumeAnimationFrame();m.stack.clearPaddingChanges();m.stack.mKeyguardBypassEnabled=true;
            m.nativePadding(140,true);assertEquals("native bypass blocks only the explicit request",0,m.stack.topAnimationCount());
            m.stack.mAnimateNextTopPaddingChange=true;m.nativePadding(150,false);
            assertEquals("pending animation is independent of native bypass",1,m.stack.topAnimationCount());
            m.stack.consumeAnimationFrame();m.stack.clearPaddingChanges();m.stack.mAmbientState.mStatusBarState=1;
            m.stack.mKeyguardBypassEnabled=false;m.stack.mShouldSkipTopPaddingAnimationAfterFold=true;
            m.nativePadding(160,true);assertEquals("native fold skip remains honored",0,m.stack.topAnimationCount());
            m.nativePadding(170,true);assertEquals("subsequent lockscreen change remains animated",1,m.stack.topAnimationCount());
            m.stack.addNotificationAnimation();m.stack.consumeAnimationFrame();
            assertTrue("notification add animation survives a top-padding frame",m.stack.mNeedsAnimation);
            assertTrue(m.stack.mAddAnimationPending);
        }
    }
    @Test public void ownedCoordinateChangesDoNotRearmOemTopPaddingAnimation()throws Exception{
        for(boolean rtl:new boolean[]{false,true})try(Model m=new Model(rtl,1.3f)){
            HeaderClockHooksAndroidTest.clockOptions(3);m.frame();m.exactGap(8);m.stack.clearPaddingChanges();
            int dateTop=m.header.dateGroup.getTop();m.stack.addNotificationAnimation();
            // A real transformed header/stack changes the owned absolute padding.
            // Observe every native setter before another stabilizing frame can hide it.
            for(int translation:new int[]{17,-12,17,0}){
                m.stack.consumeAnimationFrame();m.stack.mAnimateNextTopPaddingChange=true;
                m.header.header.setTranslationY(translation);m.frame();m.exactGap(8);
                assertEquals("coordinate move does not alter native date layout",dateTop,m.header.dateGroup.getTop());
                assertTrue("independent notification work remains pending",m.stack.mNeedsAnimation);
                assertTrue(m.stack.mAddAnimationPending);
            }
            assertTrue("test exercised actual integer top-padding changes "+m.stack.paddingChanges,m.stack.paddingChanges.size()>=4);
            assertEquals("owned coordinate changes must not start OEM top-padding animation: "+m.stack.paddingChanges,0,m.stack.topAnimationCount());
        }
    }
    @Test public void nativeChildrenPreDrawUsesCurrentHeaderBeforeApplyingCardTarget()throws Exception{
        try(Model m=new Model(false,1.3f)){
            HeaderClockHooksAndroidTest.clockOptions(3);m.frame();m.stack.dispatchChildrenPreDraw();m.layout();
            m.stack.cardTargets.clear();m.stack.clearPaddingChanges();
            float initial=m.stack.mAmbientState.mTopPadding;
            for(int translation:new int[]{17,-12,17,0}){
                m.header.header.setTranslationY(translation);
                m.stack.mAnimateNextTopPaddingChange=true;m.stack.addNotificationAnimation();
                int accepted=m.stack.acceptedChildrenUpdates;
                assertTrue("native wrapper starts with its update request armed",m.stack.mChildrenUpdateRequested);
                m.stack.dispatchChildrenPreDraw();
                float wanted=m.expectedPadding(8);
                assertEquals("current absolute header gap is committed within this pre-draw",wanted,m.stack.mAmbientState.mTopPadding,.99f);
                assertEquals("card target is computed after header refresh, before wrapper clears its request: "+m.stack.cardTargets,(int)wanted,(int)m.stack.cardTargets.get(m.stack.cardTargets.size()-1));
                assertEquals("actual Android card receives this frame's target",(int)wanted,m.card.getTranslationY(),0);
                assertFalse("wrapper clears the request only after updateChildren",m.stack.mChildrenUpdateRequested);
                assertEquals("changed padding during native update cannot enqueue a second listener",accepted,m.stack.acceptedChildrenUpdates);
                assertTrue("independent add animation remains available to native children",m.stack.mAddAnimationPending);
                m.stack.consumeAnimationFrame();
            }
            assertEquals("return translation commits the original card position",(int)initial,(int)m.stack.cardTargets.get(3));
            assertEquals("coordinate updates do not animate obsolete targets: "+m.stack.paddingChanges,0,m.stack.topAnimationCount());
        }
    }
    @Test public void inlinedTopPaddingCallbackStillUsesCallerGuardAndPreservesNativeAnimations()throws Exception{
        try(Model m=new Model(false,1.3f)){
            HeaderClockHooksAndroidTest.clockOptions(3);m.frame();m.stack.inlineTopPaddingChanged=true;m.stack.clearPaddingChanges();
            m.stack.mAnimateNextTopPaddingChange=true;m.stack.addNotificationAnimation();
            m.nativePadding(940,true);
            assertTrue("unchanged owned integer padding retains the pending native flag",m.stack.mAnimateNextTopPaddingChange);
            assertEquals("unchanged setter does not dispatch its inlined callback",0,m.stack.paddingChanges.size());
            for(int translation:new int[]{17,-12,0}){
                m.stack.mAnimateNextTopPaddingChange=true;m.header.header.setTranslationY(translation);m.frame();m.exactGap(8);
                assertTrue("caller guard keeps unrelated notification-add work",m.stack.mNeedsAnimation);
                assertTrue(m.stack.mAddAnimationPending);
            }
            assertEquals("reflection-entered setter is guarded even if the internal callback is inlined: "+m.stack.paddingChanges,0,m.stack.topAnimationCount());
            assertTrue("inline test exercised genuine changed integer padding",m.stack.paddingChanges.size()>=3);
            m.stack.consumeAnimationFrame();m.stack.clearPaddingChanges();m.stack.mAmbientState.mStatusBarState=1;m.frame();
            m.nativePadding(1200,true);assertEquals("enabled clock does not suppress lockscreen's native top animation",1,m.stack.topAnimationCount());
            m.stack.consumeAnimationFrame();m.stack.clearPaddingChanges();m.stack.mAmbientState.mStatusBarState=0;m.stack.mAmbientState.mShadeExpanded=false;m.frame();
            m.nativePadding(1210,true);assertEquals("closed shade keeps its native animated update",1,m.stack.topAnimationCount());
            m.stack.consumeAnimationFrame();m.stack.clearPaddingChanges();m.stack.mAmbientState.mShadeExpanded=true;m.stack.mLaunchingNotification=true;m.frame();m.stack.clearPaddingChanges();
            m.header.header.setTranslationY(17);m.nativePadding(1300,true);
            assertEquals("notification launch keeps native explicit top animation",1,m.stack.topAnimationCount());
            HeaderClockHooksAndroidTest.clockOptions(0);m.frame();m.stack.clearPaddingChanges();m.stack.mLaunchingNotification=false;
            m.stack.mAnimateNextTopPaddingChange=true;m.nativePadding(1320,false);
            assertEquals("disabled feature preserves native pending animation",1,m.stack.topAnimationCount());
            assertTrue("independent notification-add work survives every ownership transition",m.stack.mAddAnimationPending);
        }
    }
}
