package ls.augment.com.hook;

import android.content.Context;
import android.graphics.*;
import android.view.*;
import android.widget.*;
import org.junit.*;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import java.io.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=36,manifest=Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CleanupCapsuleAndroidTest {
    Context context;FrameLayout root,click;ImageView image;View task;
    com.android.quickstep.views.RecentsView recents;
    com.android.quickstep.views.OverviewActionsView actions;
    CleanupCapsulePosition position;
    @Before public void setup(){
        context=RuntimeEnvironment.getApplication();FeatureSettings.clear();
        root=new FrameLayout(context);root.layout(0,0,1216,2688);
        recents=new com.android.quickstep.views.RecentsView(context){};root.addView(recents);recents.layout(0,0,1216,2688);
        task=new View(context){@Override public boolean isShown(){return true;}};
        recents.addView(task);task.layout(234,541,982,2194);recents.task=task;
        actions=new com.android.quickstep.views.OverviewActionsView(context){};root.addView(actions);actions.layout(0,2288,1216,2483);
        click=new FrameLayout(context);actions.addView(click);click.layout(383,0,833,195);
        image=new ImageView(context){@Override public boolean isShown(){return true;}@Override public boolean isAttachedToWindow(){return true;}};
        click.addView(image);image.layout(32,32,418,162);position=new CleanupCapsulePosition(image);
    }
    void enable(){position.update(true);position.place();}
    RectF bounds(){return CleanupCapsulePosition.layoutBounds(image,root);}
    @Test public void usesMeasuredFixedCenterWithInheritedHostCapability(){
        enable();assertEquals(608f,bounds().centerX(),.01f);assertEquals(2441f,bounds().centerY(),.01f);
        for(int i=0;i<100;i++)position.place();
        assertEquals(2441f,bounds().centerY(),.01f);assertEquals(56f,actions.getTranslationY(),.01f);
    }
    @Test public void taskMovementNeverMovesCapsuleAndRotationOnlyUsesScreenRatio(){
        enable();task.setScaleY(.8f);task.setTranslationY(-110f);recents.task=null;root.removeView(recents);
        assertEquals(2441f,bounds().centerY(),.01f);
        root.layout(0,0,2688,1216);actions.layout(0,900,2688,1095);click.layout(383,0,833,195);image.layout(32,32,418,162);
        position.place();assertEquals(1344,bounds().centerX(),.01f);
        assertEquals(1216*CleanupCapsulePosition.CENTER_Y_FRACTION,bounds().centerY(),.01f);
        assertEquals(276f*1216/869,CleanupCapsule.width(image),.01f);
    }
    @Test public void nativeHitHostMovesWithArtworkAndCallsOriginalExactlyOnce(){
        android.app.Activity activity=Robolectric.buildActivity(android.app.Activity.class).setup().visible().get();
        activity.setContentView(root);root.getRootView().layout(0,0,1216,2688);root.layout(0,0,1216,2688);
        recents.layout(0,0,1216,2688);actions.layout(0,2288,1216,2483);click.layout(383,0,833,195);image.layout(32,32,418,162);
        int[] calls={0};click.setOnClickListener(v->calls[0]++);enable();RectF b=bounds();
        MotionEvent down=MotionEvent.obtain(1000,1000,MotionEvent.ACTION_DOWN,b.centerX(),b.centerY(),0);
        MotionEvent up=MotionEvent.obtain(1000,1100,MotionEvent.ACTION_UP,b.centerX(),b.centerY(),0);
        assertTrue(root.dispatchTouchEvent(down));assertTrue(root.dispatchTouchEvent(up));
        Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertEquals(1,calls[0]);down.recycle();up.recycle();
    }
    @Test public void disableRestoresNativePoseAndDoesNotOverwriteNewNativeValue(){
        actions.setTranslationY(7);enable();position.update(false);assertEquals(7,actions.getTranslationY(),0);
        enable();actions.setTranslationY(19);position.update(false);assertEquals(19,actions.getTranslationY(),0);
        actions.layout(0,2000,1216,2195);assertEquals(19,actions.getTranslationY(),0);
    }
    @Test public void emptyRecentsStillUsesFixedPositionButOtherActionsKeepNativeLayout(){
        recents.task=null;enable();assertEquals(2441,bounds().centerY(),.01f);position.update(false);
        View other=new View(context);other.setOnClickListener(v->{});actions.addView(other);other.layout(0,0,80,80);
        enable();assertEquals(0,actions.getTranslationY(),0);
    }
    @Test public void unknownLegacyHostAndUnsupportedScaleStayNative(){
        actions.setScaleY(.9f);enable();assertEquals(0,actions.getTranslationY(),0);position.update(false);
        root.removeView(actions);FrameLayout legacy=new FrameLayout(context);root.addView(legacy);click.removeView(image);legacy.addView(image);
        position=new CleanupCapsulePosition(image);enable();assertEquals(0,image.getTranslationY(),0);
    }
    @Test public void measuredBodyAndTextRemainProportionalAcrossResolutions(){
        for(int width:new int[]{869,1080,1216,1440}){
            root.getRootView().layout(0,0,width,width*2);assertEquals(276f*width/869,CleanupCapsule.width(image),.01f);
            assertEquals(70f*width/869,CleanupCapsule.height(image),.01f);
            assertEquals(27f*width/869,CleanupCapsule.textSize(image),.01f);
        }
    }
    @Test public void gradientRimAndPressedStateRenderOnAndroidWithoutFakeBlur()throws Exception{
        root.getRootView().layout(0,0,869,1920);image.layout(0,0,300,100);
        CleanupCapsule capsule=new CleanupCapsule();Bitmap normal=Bitmap.createBitmap(300,100,Bitmap.Config.ARGB_8888);
        Canvas canvas=new Canvas(normal);canvas.drawColor(Color.rgb(148,178,225));capsule.draw(image,canvas,150,50);
        assertTrue(Color.red(normal.getPixel(50,50))>Color.red(normal.getPixel(250,50))+8);
        assertEquals("tinted_gradient",capsule.material());
        image.setPressed(true);Bitmap pressed=Bitmap.createBitmap(300,100,Bitmap.Config.ARGB_8888);Canvas pc=new Canvas(pressed);pc.drawColor(Color.rgb(148,178,225));capsule.draw(image,pc,150,50);
        assertTrue(Color.red(pressed.getPixel(50,50))>Color.red(normal.getPixel(50,50)));
        for(Bitmap bitmap:new Bitmap[]{normal,pressed}){String label=bitmap==normal?"normal":"pressed";try(FileOutputStream out=new FileOutputStream(new File(System.getProperty("duo.evidence"),"c17-"+label+".png"))){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}}
        capsule.clear();
    }
}
