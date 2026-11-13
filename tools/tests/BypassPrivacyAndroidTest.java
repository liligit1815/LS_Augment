package ls.augment.com.hook;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.graphics.*;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import ls.augment.com.BypassChargingOptions;
import org.junit.*;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=36,manifest=Config.NONE,application=BypassPrivacyAndroidTest.ServiceApplication.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class BypassPrivacyAndroidTest {
    public static class ServiceApplication extends Application {
        @Override public String getPackageName(){return BypassChargingOptions.SERVICE_PACKAGE;}
    }
    static final String ORDINARY="旁路充电已开启", THERMAL="温度异常，充电保护已启用";
    Context context; NotificationManager notifications; AugmentModule module; Controller controller;
    static class NamedResources extends Resources {
        boolean available=true;
        NamedResources(Resources r){super(r.getAssets(),r.getDisplayMetrics(),r.getConfiguration());}
        @Override public int getIdentifier(String name,String kind,String pkg){if(!available)return 0;return name.equals("game_charge_separation_notification_summit")?501:name.equals("game_charge_separation_3c_notification_new")?502:0;}
        @Override public CharSequence getText(int id){return id==501?ORDINARY:id==502?THERMAL:super.getText(id);}
    }
    static class Controller {
        private final Context mContext;
        private boolean mNotificationVisible,m3CNotificationVisible,mIsSend3CNotification,mIsOpenFor3C;
        boolean on=true; int sends,thermalSends;
        Controller(Context c){mContext=c;}
        public void init(){}
        public boolean isSwitchOn(){return on;}
        public void sendNotification(){sends++;if(!mNotificationVisible){post(mContext,ORDINARY,0);mNotificationVisible=true;}}
        public void send3CNotification(){thermalSends++;post(mContext,THERMAL,0);m3CNotificationVisible=true;}
    }
    static class ChildController extends Controller {ChildController(Context c){super(c);}}
    static class MissingController {public void init(){}public void sendNotification(){}}
    static void post(Context c,String text,int extraFlags){
        NotificationManager n=(NotificationManager)c.getSystemService(Context.NOTIFICATION_SERVICE);
        n.createNotificationChannel(new NotificationChannel("ChargeSeparation","Bypass",NotificationManager.IMPORTANCE_HIGH));
        Notification value=new Notification.Builder(c,"ChargeSeparation").setSmallIcon(android.R.drawable.ic_dialog_info).setContentText(text).setStyle(new Notification.BigTextStyle().bigText(text)).build();
        value.flags|=extraFlags;n.notify(100,value);
    }
    @Before public void setup(){
        FeatureSettings.clear();module=new AugmentModule();Context base=RuntimeEnvironment.getApplication();NamedResources r=new NamedResources(base.getResources());
        context=new ContextWrapper(base){@Override public Resources getResources(){return r;}};
        notifications=(NotificationManager)context.getSystemService(Context.NOTIFICATION_SERVICE);notifications.cancelAll();controller=new Controller(context);
        BypassNotificationHook.install(module,Controller.class);
        assertEquals("Fixture package",BypassChargingOptions.SERVICE_PACKAGE,context.getPackageName());
    }
    Object call(Object target,String method)throws Throwable{return module.invoke(target,method,new Class<?>[0]);}
    void hide(boolean enabled){FeatureSettings.values.put(BypassChargingOptions.HIDE_PROMPTS,enabled?"1":"0");FeatureSettings.changed();idle();}
    void idle(){Shadows.shadowOf(Looper.getMainLooper()).idle();}
    String text(){return notifications.getActiveNotifications().length==0?null:notifications.getActiveNotifications()[0].getNotification().extras.getString(Notification.EXTRA_TEXT);}
    @Test public void futureOrdinarySuppressedButThermalSenderRuns()throws Throwable{
        hide(true);call(controller,"sendNotification");assertNull(text());assertEquals(0,controller.sends);assertFalse(controller.mNotificationVisible);
        call(controller,"send3CNotification");assertEquals(THERMAL,text());assertEquals(1,controller.thermalSends);assertTrue(controller.m3CNotificationVisible);
    }
    @Test public void existingOrdinaryRemovedAndRestoredOnDisable()throws Throwable{
        call(controller,"init");idle();call(controller,"sendNotification");assertEquals(ORDINARY,text());
        hide(true);assertNull(text());assertFalse(controller.mNotificationVisible);
        hide(false);assertEquals(ORDINARY,text());assertTrue(controller.mNotificationVisible);assertEquals(2,controller.sends);
        hide(false);assertEquals(2,controller.sends);
    }
    @Test public void initAfterNoticeAndVerifiedSnapshotDeliveryRemoveOldNotice()throws Throwable{
        controller.sendNotification();FeatureSettings.verified=false;hide(true);call(controller,"init");idle();assertEquals(ORDINARY,text());
        FeatureSettings.verified=true;FeatureSettings.changed();idle();assertNull(text());
    }
    @Test public void sameIdThermalUnknownAndForegroundNotCanceled()throws Throwable{
        call(controller,"init");idle();
        for(String content:new String[]{THERMAL,"充电故障"}){post(context,content,0);hide(true);assertEquals(content,text());hide(false);assertEquals(content,text());}
        post(context,ORDINARY,Notification.FLAG_FOREGROUND_SERVICE);hide(true);assertEquals(ORDINARY,text());
    }
    @Test public void disablingDoesNotReplaceSafetyNoticeEvenWithStaleOrdinaryFlag()throws Throwable{
        hide(true);call(controller,"sendNotification");call(controller,"send3CNotification");controller.mNotificationVisible=true;
        hide(false);assertEquals(THERMAL,text());assertEquals(0,controller.sends);assertTrue(controller.m3CNotificationVisible);
    }
    @Test public void unknownNoticeNotOverwrittenDuringRestore()throws Throwable{
        hide(true);call(controller,"sendNotification");post(context,"新的保护提示",0);hide(false);assertEquals("新的保护提示",text());assertEquals(0,controller.sends);
    }
    @Test public void inactiveAndUnownedDoNotCreateNotice()throws Throwable{
        call(controller,"init");idle();hide(false);assertNull(text());assertEquals(0,controller.sends);
        hide(true);call(controller,"sendNotification");controller.on=false;hide(false);assertNull(text());assertEquals(0,controller.sends);
    }
    @Test public void thermalModeWithoutPostedCardStillPreventsRestore()throws Throwable{
        hide(true);call(controller,"sendNotification");controller.mIsSend3CNotification=true;hide(false);assertNull(text());assertEquals(0,controller.sends);
    }
    @Test public void inheritedPrivateFieldsAndMethodsSupported()throws Throwable{
        module=new AugmentModule();BypassNotificationHook.install(module,ChildController.class);Controller child=new ChildController(context);
        call(child,"init");idle();call(child,"sendNotification");hide(true);assertNull(text());hide(false);assertEquals(ORDINARY,text());assertEquals(2,child.sends);
    }
    @Test public void missingCapabilitiesAndResourcesLeaveNativeBehavior()throws Throwable{
        AugmentModule absent=new AugmentModule();BypassNotificationHook.install(absent,MissingController.class);assertTrue(absent.hooks.isEmpty());assertTrue(absent.logs.get(0).contains("UNAVAILABLE"));
        ((NamedResources)context.getResources()).available=false;hide(true);call(controller,"sendNotification");assertEquals(ORDINARY,text());assertEquals(1,controller.sends);
    }
    @Test public void rapidTogglesUseLatestSnapshot()throws Throwable{
        call(controller,"init");idle();call(controller,"sendNotification");
        FeatureSettings.values.put(BypassChargingOptions.HIDE_PROMPTS,"1");FeatureSettings.changed();FeatureSettings.values.put(BypassChargingOptions.HIDE_PROMPTS,"0");FeatureSettings.changed();idle();
        assertEquals(ORDINARY,text());assertEquals(1,controller.sends);
    }
    public static class Thumb extends FrameLayout {
        boolean fast;int nativeDraws;
        Thumb(Context c){super(c);setBackgroundColor(Color.GREEN);}
        public boolean isAttachedToWindow(){return true;}public void onAttachedToWindow(){}public void onRecycle(){}public void setState(Object s,Integer i){}
        @Override public void draw(Canvas c){nativeDraws++;if(fast){c.drawColor(Color.GREEN);return;}super.draw(c);}
    }
    public static class ChildThumb extends Thumb {ChildThumb(Context c){super(c);}}
    @Test public void realCanvasMasksEarlyReturnAndStandardFramesWithoutOverlay()throws Throwable{
        for(Class<?> type:new Class<?>[]{Thumb.class,ChildThumb.class}){
            AugmentModule m=new AugmentModule();boolean[] selected={true};Thumb view=type==Thumb.class?new Thumb(context):new ChildThumb(context);view.layout(0,0,64,64);
            assertTrue(RecentsPrivacyDraw.install(m,type,(v,c)->{if(!selected[0])return false;c.drawColor(Color.BLUE);return true;}));
            for(boolean fast:new boolean[]{false,true}){view.fast=fast;Bitmap image=Bitmap.createBitmap(64,64,Bitmap.Config.ARGB_8888);m.invoke(view,"draw",new Class[]{Canvas.class},new Canvas(image));
                for(int y=0;y<64;y++)for(int x=0;x<64;x++)assertEquals(Color.BLUE,image.getPixel(x,y));assertEquals(0,view.nativeDraws);}
            selected[0]=false;Bitmap image=Bitmap.createBitmap(64,64,Bitmap.Config.ARGB_8888);m.invoke(view,"draw",new Class[]{Canvas.class},new Canvas(image));assertEquals(Color.GREEN,image.getPixel(32,32));assertEquals(1,view.nativeDraws);
        }
    }
    @Test public void frameworkDrawNotHookedAndStandardOverlayRetained()throws Throwable{
        assertFalse(RecentsPrivacyDraw.install(module,FrameLayout.class,(v,c)->true));
        assertTrue(RecentsPrivacyOverlay.install(module,Thumb.class,Object.class,(v,c)->{if(c!=null)c.drawColor(Color.BLUE);return true;}));
        Thumb view=new Thumb(context);view.layout(0,0,64,64);call(view,"onAttachedToWindow");Bitmap image=Bitmap.createBitmap(64,64,Bitmap.Config.ARGB_8888);view.draw(new Canvas(image));assertEquals(Color.BLUE,image.getPixel(32,32));
    }
}
