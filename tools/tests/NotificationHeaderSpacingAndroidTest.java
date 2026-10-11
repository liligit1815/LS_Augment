package ls.augment.com;

import android.app.Activity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout;
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
    static final class Model implements AutoCloseable {
        final HeaderClockAndroidTest.Model header;
        final Activity activity;
        final FrameLayout root;
        final NotificationStackScrollLayout stack;
        final View card;
        final AugmentModule module=new AugmentModule();
        final Object headerState,formatter,stackState;
        Model(boolean rtl,float font)throws Exception{
            HeaderClockHooksAndroidTest.init();header=new HeaderClockAndroidTest.Model(988,2688,rtl,font);
            header.header.panelType=2;header.footer.getLayoutParams().height=0;header.footer.setVisibility(View.INVISIBLE);
            header.weather("碑林区 阴 19°C");header.root.removeView(header.header);
            activity=Robolectric.buildActivity(Activity.class).setup().get();root=new FrameLayout(activity);
            stack=new NotificationStackScrollLayout(activity);root.setLayoutDirection(header.root.getLayoutDirection());
            FrameLayout rows=new FrameLayout(activity);stack.addView(rows,new ScrollView.LayoutParams(988,2688));
            card=new View(activity);card.setBackgroundColor(android.graphics.Color.MAGENTA);rows.addView(card,new FrameLayout.LayoutParams(988,180));stack.firstCard=card;
            root.addView(stack,new FrameLayout.LayoutParams(988,2688));root.addView(header.header,new FrameLayout.LayoutParams(988,369));
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
        float expectedPadding(float gap){int[] h=new int[2],s=new int[2];header.header.getLocationOnScreen(h);stack.getLocationOnScreen(s);return h[1]+header.header.getLayoutParams().height-s[1]+gap*header.header.getResources().getDisplayMetrics().density;}
        void exactGap(float gap){assertEquals("current header owns exactly its requested list gap",expectedPadding(gap),stack.mAmbientState.mTopPadding,.99f);}
        @Override public void close()throws Exception{call(headerState,"close");call(formatter,"detach");activity.finish();assertEquals("native padding adapter did not log errors",0,module.errors);}
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
