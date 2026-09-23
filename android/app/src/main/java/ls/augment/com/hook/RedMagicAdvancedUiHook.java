package ls.augment.com.hook;

import android.app.KeyguardManager;
import android.content.Context;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Typeface;
import android.os.BatteryManager;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.TextView;
import android.widget.LinearLayout;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;
import java.util.Calendar;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSchema;
import ls.augment.com.SystemUiOptions;
import ls.augment.com.SystemUiPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** AOD, charging text and secondary SystemUI behavior, isolated from the status-bar geometry. */
final class RedMagicAdvancedUiHook {
    private static final String P=SystemUiOptions.PREFIX;
    private static final Map<View,ChargeTicker> CHARGING=new WeakHashMap<>();
    private static final Map<TextView,Typeface> ORIGINAL_FONTS=new WeakHashMap<>();
    private static final Map<TextView,Boolean> FONT_TARGETS=new WeakHashMap<>();
    private RedMagicAdvancedUiHook(){ }
    static int install(AugmentModule module,ClassLoader loader){
        int count=SystemIconVisibilityHook.install(module,loader);
        count+=hook(module,loader,"com.android.systemui.statusbar.StatusBarIconView","isIconBlocked",0,
                (o,a,r)->on(o,"ignore_system_icon_hide")?false:PASS,null);
        count+=hook(module,loader,"com.zte.feature.signal.WifiUtils$Companion","getWifiSignalStrengthIconId",6,
                (o,a,r)->on(o,"hide_wifi_standard")&&a[5] instanceof Integer?a[5]:PASS,null);
        count+=hook(module,loader,"com.zte.feature.notification.NotificationUtil","shouldShowAppIcon",1,
                (o,a,r)->on(o,"notification_native")?false:PASS,null);
        // The notification shade still uses white small glyphs over its native
        // colored backgrounds. Removing those backgrounds makes them invisible.
        // Status-bar glyphs instead need the tint chosen for the current surface;
        // this ROM replaces that tint with white in its Kotlin icon pipeline.
        count+=hook(module,loader,"com.zte.feature.notification.MfvNotificationExtKt","mfvDecideStatusBarNotifIconColor",1,
                (o,a,r)->on(o,"notification_native")?a[0]:PASS,null);
        count+=hook(module,loader,"com.zte.feature.notification.MfvNotificationExtKt","mfvUpdateBackground",1,
                (o,a,r)->{
                    if(!(a[0] instanceof View)||!on(a[0],"notification_native"))return PASS;
                    ((View)a[0]).setBackground(null);
                    call(a[0],"setUseAppIcon",false);
                    call(a[0],"updateDrawable");
                    return a[0];
                },null);
        // Keep the notification template's resolved small icon and contrast.
        // The OEM replacement clears its tint, including for legacy glyphs.
        count+=hook(module,loader,"com.zte.feature.notification.module.NotificationViewWrapperModule","processAppIcon",4,
                (o,a,r)->nativeNotificationTemplateIcon(o,a),null);
        count+=hook(module,loader,"com.zte.feature.fake.FakeNotchFeature","updateBlackVisibility",3,
                (o,a,r)->{if(on(o,"cutout_always")&&a[1] instanceof Boolean)a[1]=true;return PASS;},null);
        count+=hook(module,loader,"com.android.systemui.clipboardoverlay.ClipboardListener","forceSuppressOverlay",0,
                (o,a,r)->on(o,"clipboard_overlay")?false:PASS,null);
        count+=hook(module,loader,"com.zte.adapt.mifavor.navbar.AssistManagerAdapt","getAssistInfoForUser",1,
                (o,a,r)->on(o,"assist_gesture")?a[0]:PASS,null);
        count+=hook(module,loader,"com.zte.adapt.mifavor.navbar.AssistManagerAdapt","handleStartAssist",2,
                (o,a,r)->on(o,"assist_gesture")?false:PASS,null);
        count+=hook(module,loader,"com.android.wm.shell.onehanded.OneHandedDisplayAreaOrganizer","scheduleOffset",2,
                (o,a,r)->{if(on(o,"onehand_adjust")&&a[1] instanceof Integer){int original=(Integer)a[1],value=offset(o,original);if(original!=0)a[1]=value;}return PASS;},null);
        count+=hook(module,loader,"com.android.wm.shell.onehanded.OneHandedTutorialHandler","getTutorialTargetLayoutParams",-1,
                null,(o,a,r)->{if(on(o,"onehand_adjust")&&r instanceof WindowManager.LayoutParams){WindowManager.LayoutParams p=(WindowManager.LayoutParams)r;p.height=offset(o,p.height);}return PASS;});
        count+=hook(module,loader,"com.android.systemui.doze.DozeUi","roundToNextMinute",1,
                (o,a,r)->on(o,"aod_seconds")&&a[0] instanceof Long?((Long)a[0]/1000+1)*1000:PASS,null);
        // Retain DozeUi's own lifecycle, wake-lock and cancellation handling; only its next tick boundary changes.
        for(String type:new String[]{"android.widget.TextClock","com.zte.mifavor.views.TextClock","com.zte.feature.doze.AodClock.nubia.NubiaAodTextClock"})
            count+=hook(module,loader,type,"onTimeChanged",0,null,(o,a,r)->{aodClock(o);return PASS;});
        for(String name:new String[]{"AodLockScreenClockDefault","AodLockScreenClockArtword","AodLockScreenClockHorizen","AodLockScreenClockVertical"})
            count+=hook(module,loader,"com.zte.feature.doze.AodClock.KeyguardAodClockStyle."+name,"dozeTimeTick",0,
                    null,(o,a,r)->{Object view=field(o,"mClockView");if(view instanceof TextView)aodClock(view);return PASS;});
        count+=hook(module,loader,"com.android.systemui.statusbar.KeyguardIndicationController","setIndicationArea",1,
                null,(o,a,r)->{if(a[0] instanceof View)attachCharging((View)a[0],o);return PASS;});
        count+=hook(module,loader,"com.android.systemui.statusbar.KeyguardIndicationController","setVisible",1,
                null,(o,a,r)->{for(ChargeTicker ticker:CHARGING.values())if(ticker.controller.get()==o)ticker.start();return PASS;});
        count+=hook(module,loader,"com.zte.controlcenter.widget.CCHeaderView","onFinishInflate",0,
                null,(o,a,r)->{header(o);return PASS;});
        count+=hook(module,loader,"com.zte.controlcenter.widget.CCHeaderView","updateHeaderResources",0,
                null,(o,a,r)->{header(o);return PASS;});
        count+=hook(module,loader,"com.android.systemui.statusbar.policy.Clock","updateClock",0,null,(o,a,r)->{
            if(!(o instanceof TextView))return PASS;
            TextView view=(TextView)o;
            nativeFont(view);
            if(ControlCenterHeaderHook.renderClock(view))return PASS;
            if(on(o,"qs_clock_period")&&ancestor(view,"CCHeaderView")){
                android.text.SpannableStringBuilder text=new android.text.SpannableStringBuilder(view.getText()).append(" ");
                int start=text.length();text.append(SystemUiPolicy.period(Calendar.getInstance().get(Calendar.HOUR_OF_DAY)));
                text.setSpan(new android.text.style.RelativeSizeSpan(.35f),start,text.length(),android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                view.setText(text);
            }
            return PASS;
        });
        for(String type:new String[]{"com.zte.mifavor.views.MFVBatteryViewLayout","com.android.systemui.statusbar.phone.KeyguardStatusBarView"})
            count+=hook(module,loader,type,"onFinishInflate",0,null,(o,a,r)->{restoreFonts(o);return PASS;});
        count+=hook(module,loader,"com.zte.feature.speed.StatusBarNetSpeedMFV","init",-1,null,(o,a,r)->{restoreFonts(o);return PASS;});
        return count;
    }

    private static void aodClock(Object owner) { AodClockHook.changed(owner); }

    private static Object nativeNotificationTemplateIcon(Object owner,Object[] args) {
        if(!(args[1] instanceof View)||!on(args[1],"notification_native"))return PASS;
        View root=(View)args[1],icon=root.findViewById(android.R.id.icon);
        Object size=field(owner,"mHeaderIconSize"),margin=field(owner,"mHeaderIconMargin");
        if(icon==null)return null;
        if(!(size instanceof Number)||!(margin instanceof Number)
                ||!(icon.getLayoutParams() instanceof ViewGroup.MarginLayoutParams))return PASS;
        // Keep the OEM template's compact geometry without its drawable/tint
        // replacement. Android's larger default icon otherwise overlaps text.
        ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)icon.getLayoutParams();
        params.width=params.height=((Number)size).intValue();
        int inset=((Number)margin).intValue();
        if(Boolean.TRUE.equals(args[2])&&params instanceof RelativeLayout.LayoutParams){
            ((RelativeLayout.LayoutParams)params).removeRule(RelativeLayout.CENTER_VERTICAL);
            params.topMargin=params.leftMargin=inset;
        }else if(("base".equals(root.getTag())||"headsUp".equals(root.getTag()))&&params instanceof FrameLayout.LayoutParams){
            ((FrameLayout.LayoutParams)params).gravity=Gravity.START;
            params.topMargin=params.leftMargin=inset;
        }
        icon.setLayoutParams(params);
        return null;
    }

    private static String chargingDetails(Object owner) {
        Context context=context(owner);if(context==null)return "";
        Intent battery=context.registerReceiver(null,new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
        if(battery==null||battery.getIntExtra(BatteryManager.EXTRA_PLUGGED,0)==0)return "";
        double temp=battery.getIntExtra(BatteryManager.EXTRA_TEMPERATURE,Integer.MIN_VALUE)/10d;
        int millivolts=battery.getIntExtra(BatteryManager.EXTRA_VOLTAGE,0);
        BatteryManager manager=context.getSystemService(BatteryManager.class);
        int current=manager==null?Integer.MIN_VALUE:manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CURRENT_NOW);
        String temperature=temp < -100?"—":String.format(Locale.ROOT,"%.1f°C",temp);
        String voltage=millivolts<=0?"—":String.format(Locale.ROOT,"%.2fV",millivolts/1000d);
        String amperes=current==Integer.MIN_VALUE?"—":String.format(Locale.ROOT,"%.0fmA",Math.abs(current/1000d));
        String power=current==Integer.MIN_VALUE||millivolts<=0?"—":String.format(Locale.ROOT,"%.2fW",Math.abs(current/1_000_000d)*millivolts/1000d);
        StringBuilder result=new StringBuilder();String[] keys={"temperature","current","voltage","power"},values={temperature,amperes,voltage,power};
        for(int i=0;i<keys.length;i++)if(!on(owner,"lock_charge_hide_"+keys[i])){if(result.length()>0)result.append("  ");result.append(values[i]);}
        return result.toString();
    }
    private static void attachCharging(View view,Object controller){
        ChargeTicker previous=CHARGING.remove(view);if(previous!=null)previous.stop();
        ChargeTicker ticker=new ChargeTicker(view,controller);CHARGING.put(view,ticker);view.addOnAttachStateChangeListener(ticker);
        if(view.isAttachedToWindow())ticker.attach();
    }
    private static final class ChargeTicker implements Runnable,View.OnAttachStateChangeListener {
        final WeakReference<View> view;final WeakReference<Object> controller;final Handler handler=new Handler(Looper.getMainLooper());
        WeakReference<TextView> detail=new WeakReference<>(null);Integer originalHeight;
        final Runnable settingsListener=this::start;
        final BroadcastReceiver lifecycle=new BroadcastReceiver(){@Override public void onReceive(Context context,Intent intent){start();}};
        boolean listening;
        ChargeTicker(View view,Object controller){this.view=new WeakReference<>(view);this.controller=new WeakReference<>(controller);}
        void attach(){
            View owner=view.get();if(owner==null||listening)return;Context context=owner.getContext();
            IntentFilter filter=new IntentFilter();filter.addAction(Intent.ACTION_SCREEN_ON);filter.addAction(Intent.ACTION_SCREEN_OFF);
            filter.addAction(Intent.ACTION_USER_PRESENT);filter.addAction(Intent.ACTION_POWER_CONNECTED);filter.addAction(Intent.ACTION_POWER_DISCONNECTED);
            context.registerReceiver(lifecycle,filter,Context.RECEIVER_NOT_EXPORTED);
            FeatureSettings.addSnapshotListener(context,settingsListener);listening=true;start();
        }
        void detach(){
            handler.removeCallbacks(this);FeatureSettings.removeSnapshotListener(settingsListener);
            View owner=view.get();if(listening&&owner!=null)try{owner.getContext().unregisterReceiver(lifecycle);}catch(IllegalArgumentException ignored){ }
            listening=false;clear();
        }
        void start(){handler.removeCallbacks(this);handler.post(this);}
        void stop(){detach();View owner=view.get();if(owner!=null)owner.removeOnAttachStateChangeListener(this);}
        @Override public void run(){
            View target=view.get();Object owner=controller.get();if(target==null||owner==null||!target.isAttachedToWindow())return;
            Context context=target.getContext();PowerManager power=context.getSystemService(PowerManager.class);KeyguardManager lock=context.getSystemService(KeyguardManager.class);
            if(!on(owner,"lock_charge_details")){clear();return;}
            boolean visible=power!=null&&power.isInteractive()&&lock!=null&&lock.isKeyguardLocked()
                    &&!Boolean.FALSE.equals(field(owner,"mVisible"));
            // A new lockscreen must render immediately even at a 30-second
            // interval. Hidden screens wait for lifecycle events, not polling.
            if(!visible){clear();return;}
            String value=chargingDetails(owner);
            if(value.isEmpty()){clear();return;}else update(value,owner);
            handler.postDelayed(this,FeatureSettings.integer(context,P+"lock_charge_interval",1,1,30)*1000L);
        }
        void update(String value,Object owner){
            View raw=view.get();if(!(raw instanceof LinearLayout))return;
            LinearLayout area=(LinearLayout)raw;TextView text=detail.get();
            if(text==null){text=new TextView(area.getContext());text.setGravity(Gravity.CENTER);text.setIncludeFontPadding(false);text.setMaxLines(2);text.setShadowLayer(2,0,0,0x99000000);area.addView(text,new LinearLayout.LayoutParams(-1,-2));detail=new WeakReference<>(text);}
            Object nativeText=field(owner,"mLockScreenIndicationView");if(nativeText instanceof TextView)text.setTextColor(((TextView)nativeText).getTextColors());else text.setTextColor(0xffffffff);
            text.setText(value);text.setTextSize(TypedValue.COMPLEX_UNIT_SP,FeatureSettings.integer(area.getContext(),P+"lock_charge_text_size",14,8,32));
            int gap=Math.round(FeatureSettings.integer(area.getContext(),P+"lock_charge_line_gap",2,0,40)*area.getResources().getDisplayMetrics().density);
            LinearLayout.LayoutParams own=(LinearLayout.LayoutParams)text.getLayoutParams();if(own.topMargin!=gap){own.topMargin=gap;text.setLayoutParams(own);}
            ViewGroup.LayoutParams params=area.getLayoutParams();if(params==null)return;
            if(originalHeight==null)originalHeight=params.height;
            if(originalHeight>0){int width=area.getWidth()>0?area.getWidth():area.getResources().getDisplayMetrics().widthPixels;text.measure(View.MeasureSpec.makeMeasureSpec(Math.max(1,width-area.getPaddingLeft()-area.getPaddingRight()),View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));int height=originalHeight+text.getMeasuredHeight()+gap;if(params.height!=height){params.height=height;area.setLayoutParams(params);}}
        }
        void clear(){
            TextView text=detail.get();if(text!=null&&text.getParent() instanceof ViewGroup)((ViewGroup)text.getParent()).removeView(text);detail.clear();
            View area=view.get();if(area!=null&&originalHeight!=null&&area.getLayoutParams()!=null){ViewGroup.LayoutParams params=area.getLayoutParams();params.height=originalHeight;area.setLayoutParams(params);}originalHeight=null;
        }
        @Override public void onViewAttachedToWindow(View v){attach();}
        @Override public void onViewDetachedFromWindow(View v){detach();}
    }
    private static void header(Object owner) throws ReflectiveOperationException {
        restoreFonts(owner);
    }
    private static void restoreFonts(Object owner){
        for(String name:new String[]{"mClock","mDateView","mClockView","mCarrierText","mCarrierLabel","mSpeedText","mSpeedUnit","mBatteryLevelInsideView","mBatteryLevelOutsideView"}){
            Object raw=field(owner,name);
            if(raw instanceof TextView)nativeFont((TextView)raw);
        }
    }
    static void applyStatusBarFont(View view){
        if(view instanceof TextView&&StatusBarGridHook.inBar(view)&&FONT_TARGETS.containsKey(view))nativeFont((TextView)view);
    }
    private static void nativeFont(TextView view){
        FONT_TARGETS.put(view,Boolean.TRUE);
        boolean preserve=RedMagicLegacyUiHook.preserveNativeAppearance(view);
        if(!preserve&&StatusBarGridHook.inBar(view)&&view.getClass().getSimpleName().equals("Clock")
                &&FeatureSettings.enabled(view.getContext(),ConfigSchema.STATUSBAR_CLOCK_CUSTOM))return;
        if(!preserve&&on(view,"statusbar_restore_font")){
            if(!ORIGINAL_FONTS.containsKey(view))ORIGINAL_FONTS.put(view,view.getTypeface());
            if(!Typeface.DEFAULT.equals(view.getTypeface()))view.setTypeface(Typeface.DEFAULT);
        }else if(ORIGINAL_FONTS.containsKey(view)){
            Typeface original=ORIGINAL_FONTS.remove(view);
            if(Typeface.DEFAULT.equals(view.getTypeface()))view.setTypeface(original);
        }
    }
    private static int offset(Object owner,int original){if(original<=0)return original;int delta=FeatureSettings.integer(context(owner),P+"onehand_offset",0,-1000,1000);int result=original-delta;return result>0&&result<original*2.5?result:original;}
    private static boolean ancestor(View view,String name){for(View current=view;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null)if(current.getClass().getSimpleName().contains(name))return true;return false;}
    private static boolean on(Object owner,String name){
        if(RedMagicLegacyUiHook.positionSizeOnly(context(owner))&&(name.equals("ignore_system_icon_hide")
                ||name.equals("hide_wifi_standard")||name.equals("notification_native")))return false;
        return FeatureSettings.enabled(context(owner),P+name);
    }
}
