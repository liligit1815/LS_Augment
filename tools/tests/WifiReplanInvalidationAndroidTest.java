package ls.augment.com.hook;
import android.graphics.*;
import android.graphics.drawable.ColorDrawable;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** Real Android Views/Canvas/drawable. A retained Picture consumer is explicit,
 * not a claim that desktop Robolectric executes the phone GPU RenderNode. */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class WifiReplanInvalidationAndroidTest {
 static class Signal extends ImageView {int invalidations;Signal(android.content.Context c){super(c);}@Override public void invalidate(){invalidations++;super.invalidate();}}
 static class RecordedImage {
  final Signal view;Picture picture;int consumed=-1;
  RecordedImage(Signal v){view=v;}
  int pixel(){
   if(picture==null||consumed!=view.invalidations){picture=new Picture();Canvas c=picture.beginRecording(46,42);view.draw(c);picture.endRecording();consumed=view.invalidations;}
   Bitmap b=Bitmap.createBitmap(46,42,Bitmap.Config.ARGB_8888);new Canvas(b).drawPicture(picture);int color=b.getPixel(10,10);b.recycle();return color;
  }
 }
 @SuppressWarnings("unchecked") @Test public void nativeActivityAppearanceRejectsTwoCellsAndInvalidatesAlreadyRecordedStaticPng()throws Exception{
  WifiNativeBudgetAndroidTest.Fixture f=WifiNativeBudgetAndroidTest.fullRow(501);f.pair.close();f.group.removeAllViews();
  Signal signal=new Signal(f.c);ImageView activity=new ImageView(f.c);signal.setTag("wifi.signal");activity.setTag("wifi.activity_inout");
  signal.setScaleType(ImageView.ScaleType.FIT_XY);f.group.addView(signal,new FrameLayout.LayoutParams(46,42));f.group.addView(activity,new FrameLayout.LayoutParams(46,42));activity.setVisibility(View.GONE);f.layout();
  StatusBarWifiAssetSpacingHook.Pair pair=new StatusBarWifiAssetSpacingHook.Pair(f.group,signal,activity);pair.series=true;
  Field field=StatusBarWifiAssetSpacingHook.class.getDeclaredField("PAIRS");field.setAccessible(true);Map<ViewGroup,StatusBarWifiAssetSpacingHook.Pair> pairs=(Map<ViewGroup,StatusBarWifiAssetSpacingHook.Pair>)field.get(null);pairs.put(f.group,pair);
  StatusBarAssetDrawable[] wrapper=new StatusBarAssetDrawable[1];wrapper[0]=new StatusBarAssetDrawable(new ColorDrawable(Color.BLUE),(canvas,area)->{if(StatusBarWifiAssetSpacingHook.allowArtwork(signal))canvas.drawColor(Color.RED);else wrapper[0].drawOriginal(canvas);});signal.setImageDrawable(wrapper[0]);wrapper[0].attach();
  pair.replan();assertEquals(46,pair.plan.width);pair.accept(84,125,"native_slot");StatusBarIconLayoutHook.apply(pair);f.layout();assertTrue(pair.active);assertTrue(StatusBarWifiAssetSpacingHook.allowArtwork(signal));
  RecordedImage recorded=new RecordedImage(signal);assertEquals(Color.RED,recorded.pixel());
  // Real OEM visibility changes after static artwork recording. Signal's native
  // size and margins stay identical on this single-cell capacity fallback.
  activity.setVisibility(View.VISIBLE);f.layout();int before=signal.invalidations;
  pair.replan();assertEquals(92,pair.plan.width);pair.accept(84,125,"native_slot");StatusBarIconLayoutHook.apply(pair);f.layout();
  assertFalse(pair.active);assertFalse(StatusBarWifiAssetSpacingHook.allowArtwork(signal));assertEquals(46,f.group.getWidth());assertEquals(46,signal.getWidth());
  System.out.println("REPLAN static signal invalidations before="+before+" after="+signal.invalidations+" color="+Integer.toHexString(recorded.pixel()));
  assertTrue("accepted->rejected needs signal invalidation even when replan clears active before accept",signal.invalidations>before);
  assertEquals("retained real Picture redraws native after invalidation",Color.BLUE,recorded.pixel());
  com.android.systemui.statusbar.phone.StatusIconContainer row=(com.android.systemui.statusbar.phone.StatusIconContainer)f.row;assertFalse(row.mNeedsUnderflow);assertEquals(Integer.valueOf(0),row.visibleState.get(row.getChildAt(0)));
  activity.setVisibility(View.GONE);f.layout();pair.replan();pair.accept(84,125,"native_slot");StatusBarIconLayoutHook.apply(pair);f.layout();assertEquals(Color.RED,recorded.pixel());
  before=signal.invalidations;pair.close();f.layout();assertTrue(signal.invalidations>before);assertEquals(Color.BLUE,recorded.pixel());assertEquals(46,f.owner.getWidth());
 }
}
