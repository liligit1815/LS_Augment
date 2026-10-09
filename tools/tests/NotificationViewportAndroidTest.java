package ls.augment.com.hook;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import com.android.systemui.shade.NotificationsQuickSettingsContainer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** Real margin solver, framework draw and touch dispatch, and ScrollView range.
 * The OEM stack's private notification algorithm is not executed or claimed as phone evidence. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=36,qualifiers="w1216dp-h2688dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class NotificationViewportAndroidTest {
    static final int CLEAR=1201,STACK=1202;
    static final class Stack extends com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout {
        android.content.res.Resources mapped;int touches;
        Stack(Context context){super(context);setClipChildren(false);setClipToPadding(false);setVerticalScrollBarEnabled(false);
            android.content.res.Resources base=super.getResources();mapped=new android.content.res.Resources(base.getAssets(),base.getDisplayMetrics(),base.getConfiguration()){
                @Override public int getIdentifier(String name,String type,String pkg){return "iv_dismiss_notification_view".equals(name)?CLEAR:0;}
            };
        }
        @Override public android.content.res.Resources getResources(){return mapped==null?super.getResources():mapped;}
        @Override public boolean dispatchTouchEvent(MotionEvent event){touches++;return super.dispatchTouchEvent(event);}
    }
    static final class Model implements AutoCloseable {
        final Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
        final FrameLayout root=new FrameLayout(activity);
        final NotificationsQuickSettingsContainer parent=new NotificationsQuickSettingsContainer(activity);
        final Stack stack=new Stack(activity);
        final LinearLayout content=new LinearLayout(activity);
        final View clear=new View(activity);final TextView last=new TextView(activity);
        final NotificationViewportInset inset;
        boolean enabled;int clearClicks,lastClicks,changed;int width=1216,height=2688;
        Model(){
            FeatureSettings.clear();stack.getResources().getDisplayMetrics().density=3.25f;
            root.setClipChildren(false);root.setBackgroundColor(Color.WHITE);root.addView(parent,new FrameLayout.LayoutParams(-1,-1));
            parent.mStackScroller=stack;stack.setId(STACK);ConstraintLayout.LayoutParams p=new ConstraintLayout.LayoutParams(-1,-1);p.startToStart=0;p.endToEnd=0;parent.addView(stack,p);
            content.setOrientation(LinearLayout.VERTICAL);stack.addView(content,new ScrollView.LayoutParams(-1,-2));
            View spacer=new View(activity);spacer.setBackgroundColor(Color.BLUE);content.addView(spacer,new LinearLayout.LayoutParams(-1,3200));
            last.setText("最后一条通知的完整正文");last.setTextColor(Color.BLACK);last.setTextSize(22);last.setBackgroundColor(Color.RED);last.setOnClickListener(v->lastClicks++);content.addView(last,new LinearLayout.LayoutParams(-1,200));
            clear.setId(CLEAR);clear.setBackgroundColor(Color.GREEN);clear.setOnClickListener(v->clearClicks++);FrameLayout.LayoutParams cp=new FrameLayout.LayoutParams(137,137);cp.leftMargin=540;cp.topMargin=2388;root.addView(clear,cp);
            activity.setContentView(root);layout();assertTrue("actual attached clear is visible",clear.isShown());
            inset=new NotificationViewportInset(stack,()->enabled,()->changed++);
        }
        void layout(){
            View decor=activity.getWindow().getDecorView();decor.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));decor.layout(0,0,width,height);
            root.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));root.layout(0,0,width,height);
            // This is a programmatic window fixture; rotate its real ancestor frames too,
            // otherwise getGlobalVisibleRect still clips to the old portrait decor width.
            for(android.view.ViewParent p=root.getParent();p instanceof View;p=p.getParent())((View)p).layout(0,0,width,height);
        }
        void frame(){inset.refresh();layout();inset.refresh();layout();}
        int margin(){return ((ViewGroup.MarginLayoutParams)stack.getLayoutParams()).bottomMargin;}
        void tap(int x,int y){long t=android.os.SystemClock.uptimeMillis();MotionEvent down=MotionEvent.obtain(t,t,MotionEvent.ACTION_DOWN,x,y,0),up=MotionEvent.obtain(t,t+12,MotionEvent.ACTION_UP,x,y,0);root.dispatchTouchEvent(down);root.dispatchTouchEvent(up);down.recycle();up.recycle();org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();}
        Bitmap draw(){Bitmap b=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);root.draw(new Canvas(b));return b;}
        @Override public void close(){inset.close();activity.finish();}
    }
    @Test public void actualMarginChangesViewportDrawTouchAndNativeScrolling(){
        try(Model m=new Model()){
            assertEquals(2688,m.stack.getHeight());m.enabled=true;m.frame();
            assertEquals("fixed button reserves actual bottom margin",326,m.margin());
            assertEquals("native layout height shrinks, not just paint",2362,m.stack.getHeight());
            assertEquals("same absolute capacity after applying",2362,m.inset.heightForHeader());
            int before=m.stack.touches;m.tap(100,2400);assertEquals("excluded area cannot hit notifications",before,m.stack.touches);
            m.tap(608,2456);assertEquals("native clear listener unchanged",1,m.clearClicks);
            Bitmap first=m.draw();assertEquals("body does not paint behind fixed clear",Color.WHITE,first.getPixel(100,2400));first.recycle();
            m.stack.scrollTo(0,99999);assertEquals("native Android scroll range uses actual viewport",3400-2362,m.stack.getScrollY());
            Rect r=new Rect();assertTrue(m.last.getGlobalVisibleRect(r));assertEquals("complete final content reachable",200,r.height());
            m.tap(400,2300);assertEquals("visible final notification still clickable",1,m.lastClicks);
            int scroll=m.stack.getScrollY();for(int i=0;i<15;i++)m.frame();assertEquals("adapter does not move scrolling",scroll,m.stack.getScrollY());assertEquals(326,m.margin());
            m.enabled=false;m.frame();assertEquals("original native inset restored",0,m.margin());assertEquals(2688,m.stack.getHeight());assertNull(m.stack.getClipBounds());
        }
    }
    @Test public void nativeIncomingMarginCloneAndResourceChangesDoNotBecomeOwnedBaseline(){
        try(Model m=new Model()){
            m.enabled=true;m.frame();ConstraintSet clone=new ConstraintSet();clone.clone(m.parent);
            m.inset.beginNative();m.parent.applyConstraints(clone);m.inset.endNative();m.frame();m.enabled=false;m.frame();
            assertEquals("clone of owned inset must not become native",0,m.margin());
            m.enabled=true;m.frame();int rewritten=m.inset.beforeNativeMargin(81);m.parent.setNotificationsMarginBottom(rewritten);m.frame();assertEquals("explicit native update does not double-count inset",326,m.margin());
            m.enabled=false;m.frame();assertEquals("latest explicit original native margin survives",81,m.margin());
            m.enabled=true;m.frame();m.inset.beginNative();m.parent.setNotificationsMarginBottom(103);m.inset.endNative();m.frame();m.enabled=false;m.frame();assertEquals("genuine new native constraint preserved",103,m.margin());
        }
    }
    @Test public void rotationInsetsVisibilityAndNativeClipRestoreWithoutFeedback(){
        try(Model m=new Model()){
            m.enabled=true;m.frame();m.clear.setVisibility(View.GONE);m.frame();assertEquals("hidden clear returns whole viewport",0,m.margin());assertNull(m.stack.getClipBounds());
            m.clear.setVisibility(View.VISIBLE);m.width=2688;m.height=1216;FrameLayout.LayoutParams cp=(FrameLayout.LayoutParams)m.clear.getLayoutParams();cp.topMargin=1000;cp.leftMargin=540;m.clear.setLayoutParams(cp);m.layout();m.frame();
            assertEquals("rotation uses new parent absolute height",974,m.stack.getHeight());assertEquals(242,m.margin());
            m.parent.setPadding(0,20,0,41);m.layout();m.frame();assertEquals("native padding not counted twice",201,m.margin());assertEquals(954,m.stack.getHeight());
            Rect nativeClip=new Rect(4,7,2600,800);m.stack.setClipBounds(nativeClip);m.frame();assertEquals("native tighter clipping remains",nativeClip,m.stack.getClipBounds());
            m.enabled=false;m.frame();assertEquals(nativeClip,m.stack.getClipBounds());assertEquals(0,m.margin());assertEquals(1155,m.stack.getHeight());
            m.enabled=true;m.frame();m.inset.close();assertEquals("detach restores",0,m.margin());assertEquals(nativeClip,m.stack.getClipBounds());
        }
    }
    @Test public void parentTranslationAndNonOverlappingButtonRemainConservative(){
        try(Model m=new Model()){
            m.enabled=true;m.stack.setTranslationY(20);m.frame();assertEquals("screen-space offset is respected",346,m.margin());
            m.clear.setTranslationX(2000);m.frame();assertEquals("no horizontal overlap needs no exclusion",0,m.margin());
            m.clear.setTranslationX(0);m.clear.setAlpha(0);m.frame();assertEquals(0,m.margin());m.clear.setAlpha(1);m.frame();assertEquals(346,m.margin());
            m.stack.setScaleY(.8f);m.frame();assertEquals("scaled animation retains native viewport",0,m.margin());assertNull(m.stack.getClipBounds());
        }
    }
    @Test public void equalNativeClipUpdateStillReplacesTheRestoreBaseline(){
        try(Model m=new Model()){
            m.enabled=true;m.frame();Rect explicit=new Rect(m.stack.getClipBounds());
            m.inset.beginNativeClip();m.stack.setClipBounds(explicit);m.inset.endNativeClip();
            m.enabled=false;m.frame();assertEquals("equal-valued explicit native clip survives disable",explicit,m.stack.getClipBounds());
            m.enabled=true;m.frame();m.inset.beginNativeClip();m.stack.setClipBounds(null);m.inset.endNativeClip();assertNotNull("active viewport still capped after native clears clip",m.stack.getClipBounds());
            m.enabled=false;m.frame();assertNull("latest null native clip restored",m.stack.getClipBounds());
        }
    }
    @Test public void failedNativeSetterDoesNotClaimLayoutOrCancelEveryFrame(){
        for(int reject:new int[]{1,2})try(Model m=new Model()){
            m.parent.rejectMode=reject;m.enabled=true;
            for(int i=0;i<12;i++)assertTrue("rejected inset must not blank SystemUI frames",m.inset.onPreDraw());
            assertEquals("unapplied setter does not change hit viewport",2688,m.stack.getHeight());assertEquals(0,m.margin());assertNull("no clip-only success",m.stack.getClipBounds());
            assertEquals("no every-frame failed setter loop",1,m.parent.marginCalls);
            assertTrue(FeatureSettings.diagnostics.get("ls_augment_notification_viewport_runtime").contains("native-setter-unavailable"));
        }
    }
    @Test public void unsupportedNewNativeLayoutReleasesOldOwnership(){
        try(Model m=new Model()){
            m.enabled=true;m.frame();ViewGroup.LayoutParams lp=m.stack.getLayoutParams();lp.height=500;m.stack.setLayoutParams(lp);m.frame();
            assertEquals("new native height is retained",500,m.stack.getHeight());assertEquals("old inset released on unsupported contract",0,m.margin());assertNull(m.stack.getClipBounds());
        }
    }
    @Test public void windowOffsetDoesNotMixGlobalVisibleAndScreenCoordinates(){
        try(Model m=new Model()){
            Object info=org.robolectric.util.ReflectionHelpers.getField(m.stack,"mAttachInfo");
            org.robolectric.util.ReflectionHelpers.setField(info,"mWindowTop",90);
            int[] screen=new int[2],window=new int[2];m.stack.getLocationOnScreen(screen);m.stack.getLocationInWindow(window);
            assertEquals("fixture has a real Android window origin offset",90,screen[1]-window[1]);
            m.enabled=true;m.frame();assertEquals("window offset does not add phantom exclusion",326,m.margin());
        }
    }
    @Test public void registeredNativeSetterAndDetachHooksDoNotRecreateTheClosingOwner()throws Exception{
        try(Model m=new Model()){
            m.enabled=true;m.frame();
            java.lang.reflect.Method bind=NotificationAppearanceHook.class.getDeclaredMethod("stack",View.class);bind.setAccessible(true);Object state=bind.invoke(null,m.stack);
            java.lang.reflect.Field viewport=state.getClass().getDeclaredField("viewport");viewport.setAccessible(true);((NotificationViewportInset)viewport.get(state)).close();
            // Keep the real adapter with an active ownership supplier; separate HeaderState
            // integration verifies that supplier's shade/feature conditions.
            viewport.set(state,m.inset);
            AugmentModule module=new AugmentModule();NotificationAppearanceHook.install(module,getClass().getClassLoader());m.parent.hookModule=module;
            m.parent.setNotificationsMarginBottom(81);m.layout();assertEquals(326,m.margin());
            ConstraintSet clone=new ConstraintSet();clone.clone(m.parent);m.parent.applyConstraints(clone);m.layout();assertEquals(326,m.margin());
            module.invoke(m.stack,"onDetachedFromWindow");
            java.lang.reflect.Field registry=NotificationAppearanceHook.class.getDeclaredField("STACKS");registry.setAccessible(true);
            assertFalse("detached viewport must not be recreated by the restoring native setter",((java.util.Map<?,?>)registry.get(null)).containsKey(m.stack));
            assertEquals("detach restores latest original margin through actual registered setter",81,m.margin());assertNull("detach restores native clipping",m.stack.getClipBounds());assertEquals(0,module.errors);
        }
    }
}
