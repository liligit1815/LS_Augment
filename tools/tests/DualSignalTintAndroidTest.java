package ls.augment.com.hook;

import android.content.Context;
import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.BlendMode;
import android.graphics.BlendModeColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.systemui.plugins.DarkIconDispatcher.DarkReceiver;
import com.android.systemui.statusbar.phone.DarkIconDispatcherImpl;
import com.android.systemui.statusbar.pipeline.shared.ui.view.ModernStatusBarView;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Map;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Native dispatch is a ROM facade; colour filters, coordinates and widgets are Android objects. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=36,manifest=Config.NONE)
public class DualSignalTintAndroidTest {
    Context context;AugmentModule module;ActivityController<Activity> activity;
    static void clear(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);((Map<?,?>)f.get(null)).clear();}
    static void clearOptional(Class<?> type,String name)throws Exception{try{clear(type,name);}catch(NoSuchFieldException absent){}}
    @Before public void setup()throws Exception{
        context=RuntimeEnvironment.getApplication();activity=Robolectric.buildActivity(Activity.class).setup();module=new AugmentModule();AugmentModule.current=module;
        clear(DualSignalTint.class,"NATIVE");clear(DualSignalTint.class,"WATCHED");clear(StatusBarTintHook.class,"RECEIVERS");clearOptional(StatusBarTintHook.class,"REFRESHED");
        StatusBarGridHook.transformed.clear();StatusBarContentBounds.ink.clear();RedMagicSystemUiHook.changes=0;
        assertEquals(2,DualSignalTint.install(module,getClass().getClassLoader()));
        assertEquals(5,StatusBarTintHook.install(module,getClass().getClassLoader()));
    }
    @After public void cleanup(){activity.pause().stop().destroy();}
    ModernStatusBarView mobile(FrameLayout root,int left){
        ModernStatusBarView owner=new ModernStatusBarView(context);root.addView(owner,new FrameLayout.LayoutParams(100,40));owner.layout(left,0,left+100,40);
        ImageView signal=new ImageView(context);signal.setImageDrawable(new ColorDrawable(0xffffffff));owner.addView(signal,new FrameLayout.LayoutParams(20,30));signal.layout(0,0,20,30);owner.signal=signal;return owner;
    }
    FrameLayout root(){FrameLayout view=new FrameLayout(context);activity.get().setContentView(view);view.layout(0,0,400,60);return view;}
    Object invoke(Object owner,Class<?> type,String name,Class<?>[] params,Object...args)throws Throwable{return AugmentModule.invoke(owner,type,name,params,args);}
    void contrast(ModernStatusBarView owner,int color,int opposite,Rect...rects)throws Throwable{
        invoke(owner,ModernStatusBarView.class,"onDarkChangedWithContrast",new Class<?>[]{ArrayList.class,int.class,int.class},new ArrayList<>(java.util.List.of(rects)),color,opposite);
    }
    void register(DarkIconDispatcherImpl dispatcher,ModernStatusBarView owner)throws Throwable{
        invoke(dispatcher,DarkIconDispatcherImpl.class,"addDarkReceiver",new Class<?>[]{DarkReceiver.class},owner);
    }
    @Test public void nativeForegroundSurvivesEmptyImageTintAndDifferentClockRegion()throws Throwable{
        FrameLayout root=root();ModernStatusBarView owner=mobile(root,200);TextView clock=new TextView(context);clock.setTextColor(0xff333333);root.addView(clock);
        // Delivery precedes pair creation; the right-side owner lies outside the clock's dark region.
        contrast(owner,0xff333333,0xffffffff,new Rect(0,0,150,60));owner.signal.setImageTintList(null);owner.binding=null;
        DualSignalTint.watch(owner,owner.signal);assertEquals(Integer.valueOf(0xffffffff),DualSignalTint.color(owner,owner.signal));
        assertNotEquals(Integer.valueOf(clock.getCurrentTextColor()),DualSignalTint.color(owner,owner.signal));
        assertEquals("initial native palette was cached without an active pair",0,RedMagicSystemUiHook.changes);
        for(int color:new int[]{0xff262626,0xffededed,0xff73579d,0xff262626}){
            contrast(owner,color,0xff010203);owner.signal.setImageTintList(null);owner.binding=null;assertEquals(Integer.valueOf(color),DualSignalTint.color(owner,owner.signal));
        }
        assertTrue(RedMagicSystemUiHook.changes>=4);assertSame(owner,RedMagicSystemUiHook.last);
    }
    @Test public void onlyTwoArgumentStaticSetterOwnsForegroundAndDecorIsIgnored()throws Throwable{
        ModernStatusBarView owner=mobile(root(),0);DualSignalTint.watch(owner,owner.signal);
        invoke(owner,ModernStatusBarView.class,"setStaticDrawableColor",new Class<?>[]{int.class,int.class},0xff73579d,0xffffffff);
        int notifications=RedMagicSystemUiHook.changes;owner.signal.setImageTintList(ColorStateList.valueOf(0xff111111));
        invoke(owner,ModernStatusBarView.class,"setDecorColor",new Class<?>[]{int.class},0xff00ff00);
        invoke(owner,ModernStatusBarView.class,"setStaticDrawableColor",new Class<?>[]{int.class},0xffff0000);
        invoke(owner,ModernStatusBarView.class,"onDarkChanged",new Class<?>[]{ArrayList.class,float.class,int.class},new ArrayList<Rect>(),1f,0xff000000);
        assertEquals(Integer.valueOf(0xff73579d),DualSignalTint.color(owner,owner.signal));assertEquals(notifications,RedMagicSystemUiHook.changes);
    }
    @Test public void fallbackUsesNativeSameOwnerBindingAndNeverNightModeOrClock()throws Throwable{
        ModernStatusBarView owner=mobile(root(),0);owner.signal.setImageTintList(null);
        assertEquals(Integer.valueOf(0xff888888),DualSignalTint.color(owner,owner.signal));
        Configuration next=new Configuration(context.getResources().getConfiguration());next.uiMode=Configuration.UI_MODE_NIGHT_YES;context.getResources().updateConfiguration(next,context.getResources().getDisplayMetrics());
        assertEquals(Integer.valueOf(0xff888888),DualSignalTint.color(owner,owner.signal));
        owner.binding=null;assertNull("unknown palette must leave the presentation native",DualSignalTint.color(owner,owner.signal));
    }
    @Test public void nativeImageTintUsesItsDefaultAndFiltersAreUnwrapped()throws Throwable{
        ModernStatusBarView owner=mobile(root(),0);owner.binding=null;
        owner.signal.setImageTintList(new ColorStateList(new int[][]{new int[]{android.R.attr.state_pressed}},new int[]{0xff496b72}));
        assertEquals(Integer.valueOf(0xff496b72),DualSignalTint.color(owner,owner.signal));owner.signal.setImageTintList(null);
        ColorDrawable nativeIcon=new ColorDrawable(0xffffffff);nativeIcon.setColorFilter(new BlendModeColorFilter(0xff617483,BlendMode.SRC_IN));
        owner.signal.setImageDrawable(new StatusBarAssetsHook.Wrapped(nativeIcon));assertEquals(Integer.valueOf(0xff617483),DualSignalTint.color(owner,owner.signal));
        nativeIcon.setColorFilter(new PorterDuffColorFilter(0xff482b76,PorterDuff.Mode.SRC_IN));assertEquals(Integer.valueOf(0xff482b76),DualSignalTint.color(owner,owner.signal));
    }
    @Test public void failingNativeSetterDoesNotCacheUnappliedColourOrReplaceException()throws Throwable{
        ModernStatusBarView owner=mobile(root(),0);contrast(owner,0xff727272,0xffffffff);
        IllegalStateException failure=new IllegalStateException("native setter rejected");owner.failure=failure;
        try{invoke(owner,ModernStatusBarView.class,"setStaticDrawableColor",new Class<?>[]{int.class,int.class},0xffdcdcdc,0xff111111);fail("native exception expected");}
        catch(Throwable actual){assertSame(failure,actual);}
        assertEquals(Integer.valueOf(0xff727272),DualSignalTint.color(owner,owner.signal));assertEquals(0,module.errors);
    }
    @Test public void stableCachedGeometryStillReplaysDirtyPaletteAtFinalIconPosition()throws Throwable{
        FrameLayout root=root();ModernStatusBarView owner=mobile(root,0),bare=mobile(root,250);StatusBarGridHook.transformed.add(owner);
        DarkIconDispatcherImpl dispatcher=new DarkIconDispatcherImpl();dispatcher.areas.add(new Rect(0,0,150,60));register(dispatcher,owner);register(dispatcher,bare);
        TintStableFrame frame=new TintStableFrame(root);frame.beforeDraw();assertEquals(0,frame.layouts);
        // Native delivery sees restored coordinates; final grid geometry is reapplied before pre-draw.
        owner.layout(0,0,100,40);dispatcher.tint=0xff565656;invoke(dispatcher,DarkIconDispatcherImpl.class,"applyIconTint",new Class<?>[]{});
        assertEquals(Integer.valueOf(0xff565656),DualSignalTint.color(owner,owner.signal));owner.layout(200,0,300,40);
        int calls=dispatcher.applies;frame.beforeDraw();assertEquals("one dirty transformed receiver is replayed",calls+1,dispatcher.applies);
        assertEquals(Integer.valueOf(0xffffffff),DualSignalTint.color(owner,owner.signal));assertEquals("palette does not cause a geometry rebuild",0,frame.layouts);
        for(int i=0;i<100;i++)frame.beforeDraw();assertEquals("stable palette is not redispatched every frame",calls+1,dispatcher.applies);
    }
    @Test public void independentDualReceiverResolvesActualCompositeInkAndGeometryOnce()throws Throwable{
        FrameLayout root=root();ModernStatusBarView owner=mobile(root,0);DualSignalTint.watch(owner,owner.signal);StatusBarContentBounds.ink.put(owner,new RectF(10,0,30,40));
        DarkIconDispatcherImpl dispatcher=new DarkIconDispatcherImpl();dispatcher.areas.add(new Rect(0,0,35,60));register(dispatcher,owner);
        assertEquals("active dual ink is dark despite its wider native allocation",Integer.valueOf(0xff333333),DualSignalTint.color(owner,owner.signal));
        StatusBarTintHook.refresh(root);int calls=dispatcher.applies;for(int i=0;i<50;i++)StatusBarTintHook.refresh(root);assertEquals(calls,dispatcher.applies);
        owner.layout(100,0,200,40);StatusBarTintHook.refresh(root);assertEquals(calls+1,dispatcher.applies);assertEquals(Integer.valueOf(0xffffffff),DualSignalTint.color(owner,owner.signal));
        DualSignalTint.unwatch(owner);owner.layout(0,0,100,40);StatusBarTintHook.refresh(root);assertEquals("released dual receiver no longer gets extra palette replay",calls+1,dispatcher.applies);
    }
    @Test public void detachedOrReleasedSignalIsNotAnExtraManagedTintReceiver()throws Throwable{
        FrameLayout root=root();ModernStatusBarView owner=mobile(root,0);DualSignalTint.watch(owner,owner.signal);assertTrue(DualSignalTint.managed(owner));
        owner.removeView(owner.signal);assertFalse(DualSignalTint.managed(owner));contrast(owner,0xff647382,0xff000000);
        assertEquals("native cache is still recorded for a future pair",Integer.valueOf(0xff647382),DualSignalTint.color(owner,owner.signal));assertEquals(0,RedMagicSystemUiHook.changes);
    }
    @Test public void overlappingRootPairsBalanceTheirOwnTintWatch()throws Throwable{
        ModernStatusBarView owner=mobile(root(),0);DualSignalTint.watch(owner,owner.signal);DualSignalTint.watch(owner,owner.signal);
        DualSignalTint.unwatch(owner);assertTrue("one pair releasing must not remove another pair's receiver",DualSignalTint.managed(owner));
        contrast(owner,0xff839271,0xff000000);assertEquals(1,RedMagicSystemUiHook.changes);
        DualSignalTint.unwatch(owner);assertFalse(DualSignalTint.managed(owner));
        contrast(owner,0xff827190,0xff000000);assertEquals("no extra overlay notification after final release",1,RedMagicSystemUiHook.changes);
    }
}
