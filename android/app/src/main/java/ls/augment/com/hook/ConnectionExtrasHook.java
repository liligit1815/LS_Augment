package ls.augment.com.hook;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.provider.Settings;
import android.text.format.DateFormat;
import android.view.View;
import android.widget.CheckBox;
import android.widget.TextClock;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Calendar;
import java.util.Collections;
import java.util.Map;
import java.util.TimeZone;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface.Hooker;
import ls.augment.com.ConnectionExtrasPolicy;
import ls.augment.com.SystemOptions;

/** Current NX809J OEM connection/settings adapters. Hardware behavior needs device validation. */
final class ConnectionExtrasHook {
    private static final String USB="com.zte.settings.connecteddevice.UsbModeChooserActivity";
    private static final String PICKER="com.zte.mifavor.widget.TimePickerZTE";
    private static final Map<Object,WeakReference<PeriodSpinner>> SPINNERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<TextClock,CharSequence[]> CLOCKS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final java.util.Set<String> WITNESSED=java.util.concurrent.ConcurrentHashMap.newKeySet();
    private static final ThreadLocal<Boolean> CLOCK_EDIT=ThreadLocal.withInitial(()->false);
    private final AugmentModule module;private final ClassLoader loader;private int count;
    private ConnectionExtrasHook(AugmentModule module,ClassLoader loader){this.module=module;this.loader=loader;}
    static int install(AugmentModule module,ClassLoader loader,String packageName){
        ConnectionExtrasHook h=new ConnectionExtrasHook(module,loader);
        switch(packageName){
            case "com.android.settings":h.settings();break;
            case "com.android.systemui":h.usbAuthorization();break;
            case "com.android.nfc":h.nfc();break;
            case "cn.nubia.filebrowser":h.mtp();break;
            case "com.zte.mifavor.launcher":h.clocks(false);break;
            case "com.zte.mifavor.weather":h.clocks(true);break;
            default:break;
        }
        return h.count;
    }
    private void hook(String suffix,String type,String name,Class<?> result,int argc,Hooker action){
        count+=OemHooks.methods(module,loader,type,name,result,argc,suffix.isEmpty()?"":SystemOptions.key(suffix),action);
    }
    private static boolean enabled(Context c,String suffix){return FeatureSettings.enabled(c,SystemOptions.key(suffix),false);}
    private void error(String feature,Throwable error){module.logFeatureError("CONNECTION_EXTRA "+feature,error);}
    private void settings(){
        hook("usb_install_no_account","com.zte.settings.development.EnableAdbInstallPreferenceController",
                "handlePreferenceTreeClick",boolean.class,1,chain->{
            Object owner=chain.getThisObject(),pref=chain.getArg(0);
            Object key=OemHooks.invoke(owner,"getPreferenceKey");
            if(pref==null||!key.equals(OemHooks.invoke(pref,"getKey")))return chain.proceed();
            Object toggle=OemHooks.field(owner,"mEnableAdbInstall");
            if(toggle==null)return chain.proceed();
            boolean checked=Boolean.TRUE.equals(OemHooks.invoke(toggle,"isChecked"));
            Context context=FeatureSettings.from(owner);
            if(context==null)return chain.proceed();
            if(!Settings.System.putInt(context.getContentResolver(),"adb_install_enabled",checked?1:0))return chain.proceed();
            if(Boolean.TRUE.equals(OemHooks.field(owner,"isPMRequest"))){
                OemHooks.set(owner,true,"isSend");OemHooks.invoke(owner,"sendResultToPackageManager",checked);
            }
            return true;
        });
        hook("usb_mode_enabled",USB,"onCreate",void.class,1,chain->{
            Object result=chain.proceed();
            Activity activity=(Activity)chain.getThisObject();
            try{
                if(!activity.isFinishing()&&!fromNotification(activity)){
                    int choice=FeatureSettings.integer(activity,SystemOptions.key("usb_mode"),0,0,3);
                    int mode=ConnectionExtrasPolicy.usbMode(choice);
                    if(mode>=0)OemHooks.invoke(Class.forName("com.zte.settings.connecteddevice.UsbModeUtils",false,loader),
                            "setCurrentMode",activity.getSystemService(Context.USB_SERVICE),mode);
                }
            }catch(Throwable e){error("usb_default",e);}
            return result;
        });
        // This verified delayed callback is the only place onCreate actually shows the dialog.
        hook("usb_hide_dialog",USB,"lambda$onCreate$0",void.class,0,chain->{
            Activity activity=(Activity)chain.getThisObject();
            if(fromNotification(activity)&&!enabled(activity,"usb_hide_notification_dialog"))return chain.proceed();
            activity.finish();return null;
        });
        hook("settings_long_timeout","com.zte.adapt.display.ScreenTimeoutSettingsAdapt",
                "getInitialValuesLength",int.class,2,chain->{
            Object values=chain.getArg(1);return values instanceof CharSequence[]?((CharSequence[])values).length:chain.proceed();
        });
        hook("settings_hide_battery_percent","com.zte.settings.notification.MfvBatteryPercentagePreferenceController",
                "isAvailable",boolean.class,0,chain->false);
        hook("settings_time_period","com.android.settings.datetime.TimePreferenceController","getSummary",CharSequence.class,0,chain->{
            Context c=FeatureSettings.from(chain.getThisObject());
            if(!isChinese(c))return chain.proceed();
            Calendar now=Calendar.getInstance();
            return ConnectionExtrasPolicy.time(now.get(Calendar.HOUR_OF_DAY),now.get(Calendar.MINUTE),DateFormat.is24HourFormat(c),"");
        });
        timePicker();
    }
    private static boolean fromNotification(Activity activity){
        try{if("com.android.systemui".equals(OemHooks.invoke(activity,"getLaunchedFromPackage")))return true;}catch(ReflectiveOperationException ignored){}
        android.net.Uri referrer=activity.getReferrer();
        return referrer!=null&&"android-app".equals(referrer.getScheme())&&"com.android.systemui".equals(referrer.getHost());
    }
    private void usbAuthorization(){
        hook("usb_auto_authorize","com.android.systemui.usb.UsbDebuggingActivity","onCreate",void.class,1,chain->{
            Object result=chain.proceed();Activity activity=(Activity)chain.getThisObject();
            try{
                Object key=OemHooks.field(activity,"mKey");
                if(!activity.isFinishing()&&key instanceof String&&!((String)key).isEmpty()
                        &&!Boolean.TRUE.equals(OemHooks.field(activity,"mServiceNotified"))){
                    Object allow=OemHooks.field(activity,"mAlwaysAllow");if(allow instanceof CheckBox)((CheckBox)allow).setChecked(true);
                    OemHooks.invoke(activity,"notifyService",true,true);
                    if(Boolean.TRUE.equals(OemHooks.field(activity,"mServiceNotified")))activity.finish();
                }
            }catch(Throwable e){error("usb_authorize",e);}
            return result;
        });
    }
    private void nfc(){
        hook("nfc_mute","com.android.nfc.NfcService","playSound",void.class,1,chain->null);
        hook("nfc_screen_off","com.android.nfc.ScreenStateHelper","checkScreenState",int.class,1,
                chain->ConnectionExtrasPolicy.nfcScreenState((Integer)chain.proceed()));
    }
    private void mtp(){
        count+=MtpStartupHook.install(module,loader);
        // The OEM JNI bridge reads mDescription directly; getDescription is not called.
        hook("mtp_name_enabled","cn.nubia.filebrowser.mtpserver.mtp.MtpServer","addStorage",void.class,1,chain->{
            Object storage=chain.getArg(0);
            if(storage==null||((Number)OemHooks.invoke(storage,"getStorageId")).intValue()!=65537)return chain.proceed();
            Object original=OemHooks.field(storage,"mDescription");
            String name=FeatureSettings.text(FeatureSettings.from(storage),SystemOptions.key("mtp_name"),"内部存储");
            if(!OemHooks.set(storage,name,"mDescription"))return chain.proceed();
            try{return chain.proceed();}finally{OemHooks.set(storage,original,"mDescription");}
        });
        hook("mtp_hide_category","cn.nubia.filebrowser.mtpserver.mtp.MtpDatabase","addEmulatedStorage",void.class,1,chain->null);
        hook("mtp_name_enabled","cn.nubia.filebrowser.mtpserver.mtp.MtpStorage","getDescription",String.class,0,chain->{
            Object storage=chain.getThisObject();
            if(((Number)OemHooks.invoke(storage,"getStorageId")).intValue()!=65537)return chain.proceed();
            return FeatureSettings.text(FeatureSettings.from(storage),SystemOptions.key("mtp_name"),"内部存储");
        });
    }
    private void timePicker(){
        hook("settings_time_period","com.zte.mifavor.widget.TimePickerDialogZTE","updateTitle",void.class,3,chain->{
            Object result=chain.proceed();
            try{
                Object dialog=chain.getThisObject();Context c=FeatureSettings.from(dialog);
                if(isChinese(c)&&!Boolean.TRUE.equals(OemHooks.field(dialog,"mIsNeedCustomSubTitle"))){
                    Object title=OemHooks.field(dialog,"tvSubTitle");
                    if(title instanceof TextView)((TextView)title).setText(ConnectionExtrasPolicy.time((Integer)chain.getArg(1),
                            (Integer)chain.getArg(2),Boolean.TRUE.equals(OemHooks.field(dialog,"mIs24HourView")),
                            (String)OemHooks.field(dialog,"mPrefixSubTitle")));
                }
            }catch(Throwable e){error("time_picker_title",e);}
            return result;
        });
        // Run restoration even while disabled; only this picker's AM/PM spinner is decorated.
        hook("",PICKER,"updateAmPmControl",void.class,0,chain->{
            Object result=chain.proceed();
            try{updatePeriodSpinner(chain.getThisObject());}catch(Throwable e){error("time_picker_spinner",e);}
            return result;
        });
        hook("",PICKER,"onTimeChanged",void.class,0,chain->{
            Object result=chain.proceed();
            try{updatePeriodSpinner(chain.getThisObject());}catch(Throwable e){error("time_picker_change",e);}
            return result;
        });
    }
    private void updatePeriodSpinner(Object picker)throws ReflectiveOperationException{
        Object spinner=OemHooks.field(picker,"mAmPmSpinner");if(spinner==null)return;
        Context c=FeatureSettings.from(picker);
        boolean active=enabled(c,"settings_time_period")&&isChinese(c);
        WeakReference<PeriodSpinner> entry=SPINNERS.get(picker);
        PeriodSpinner state=entry==null?null:entry.get();
        if(!active){if(state!=null){state.restore(picker,spinner);SPINNERS.remove(picker);}return;}
        if(state==null){state=new PeriodSpinner(picker,spinner);SPINNERS.put(picker,new WeakReference<>(state));}
        state.update(picker,spinner);
        witness(c,"settings_time_period","period_spinner_bound");
    }
    private static final class PeriodSpinner{
        final Object oldListener;final String[] labels;final int min,max;final Object listener;
        PeriodSpinner(Object picker,Object spinner)throws ReflectiveOperationException{
            oldListener=OemHooks.field(spinner,"mOnValueChangeListener");
            labels=(String[])OemHooks.invoke(spinner,"getDisplayedValues");
            min=((Number)OemHooks.invoke(spinner,"getMinValue")).intValue();max=((Number)OemHooks.invoke(spinner,"getMaxValue")).intValue();
            Class<?> type=Class.forName("com.zte.mifavor.widget.NumberPickerZTE$OnValueChangeListener",false,spinner.getClass().getClassLoader());
            WeakReference<Object> weak=new WeakReference<>(picker);
            listener=Proxy.newProxyInstance(type.getClassLoader(),new Class<?>[]{type},(proxy,method,args)->{
                if(method.getDeclaringClass()==Object.class){
                    if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                    if(method.getName().equals("equals"))return proxy==args[0];return PeriodSpinner.this.toString();
                }
                Object owner=weak.get();
                if(owner!=null&&method.getName().equals("onValueChange")&&args!=null&&args.length==3){
                    int hour=ConnectionExtrasPolicy.periodHour((Integer)args[2]);
                    if(hour>=0)OemHooks.invoke(owner,"setHour",hour);
                }
                return null;
            });
        }
        void update(Object picker,Object spinner)throws ReflectiveOperationException{
            OemHooks.invoke(spinner,"setOnValueChangedListener",(Object)null);
            OemHooks.invoke(spinner,"setDisplayedValues",(Object)null);
            OemHooks.invoke(spinner,"setMinValue",0);OemHooks.invoke(spinner,"setMaxValue",6);
            OemHooks.invoke(spinner,"setDisplayedValues",(Object)ConnectionExtrasPolicy.PERIODS.clone());
            int hour=((Number)OemHooks.invoke(picker,"getHour")).intValue();
            OemHooks.invoke(spinner,"setValue",ConnectionExtrasPolicy.periodIndex(hour));
            OemHooks.invoke(spinner,"setOnValueChangedListener",listener);
        }
        void restore(Object picker,Object spinner)throws ReflectiveOperationException{
            OemHooks.invoke(spinner,"setOnValueChangedListener",(Object)null);
            OemHooks.invoke(spinner,"setDisplayedValues",(Object)null);
            OemHooks.invoke(spinner,"setMinValue",min);OemHooks.invoke(spinner,"setMaxValue",max);
            OemHooks.invoke(spinner,"setDisplayedValues",(Object)labels);
            int hour=((Number)OemHooks.invoke(picker,"getHour")).intValue();
            OemHooks.invoke(spinner,"setValue",hour<12?0:1);
            OemHooks.invoke(spinner,"setOnValueChangedListener",oldListener);
        }
    }
    private void clocks(boolean weather){
        hook("","android.widget.TextClock","onTimeChanged",void.class,0,chain->{
            Object result=chain.proceed();
            if(CLOCK_EDIT.get())return result;
            TextClock clock=(TextClock)chain.getThisObject();
            try{
                CLOCK_EDIT.set(true);updateClock(clock,weather);
            }catch(Throwable e){error("desktop_clock",e);}finally{CLOCK_EDIT.set(false);}
            return result;
        });
        hook("","android.widget.TextClock","onAttachedToWindow",void.class,0,chain->{
            Object result=chain.proceed();
            try{if(!CLOCK_EDIT.get()){CLOCK_EDIT.set(true);updateClock((TextClock)chain.getThisObject(),weather);}}
            catch(Throwable e){error("desktop_clock_attach",e);}finally{CLOCK_EDIT.set(false);}
            return result;
        });
    }
    private static void updateClock(TextClock clock,boolean weather){
        String id;try{id=clock.getResources().getResourceEntryName(clock.getId());}catch(RuntimeException e){return;}
        Context c=clock.getContext();
        // Weather RemoteViews are hosted in the launcher process, with weather-owned IDs.
        boolean time=id.equals("widget_time_mfvclr")||id.equals("appwidget_text_time_mfvclr")
                ||id.equals("widget_time_second_mfvclr");
        if(time){
            if(enabled(c,"desktop_clock_enabled")){
                String pattern=FeatureSettings.text(c,SystemOptions.key("desktop_clock_pattern"),"HH:mm:ss");
                if(ConnectionExtrasPolicy.normalizeClockPattern(pattern)!=null){
                    CLOCKS.putIfAbsent(clock,new CharSequence[]{clock.getFormat12Hour(),clock.getFormat24Hour()});
                    if(!pattern.contentEquals(clock.getFormat12Hour()==null?"":clock.getFormat12Hour()))clock.setFormat12Hour(pattern);
                    if(!pattern.contentEquals(clock.getFormat24Hour()==null?"":clock.getFormat24Hour()))clock.setFormat24Hour(pattern);
                    witness(c,"desktop_clock_enabled","native_textclock_format:"+id);
                }
            }else{CharSequence[] old=CLOCKS.remove(clock);if(old!=null){clock.setFormat12Hour(old[0]);clock.setFormat24Hour(old[1]);}}
        }
        boolean weatherPeriod=id.equals("widget_am_pm")||id.equals("widget_am_pm_second");
        boolean period=weatherPeriod||id.equals("widget_am_pm_mfvclr")||id.equals("widget_am_pm_second_mfvclr")
                ||id.equals("appwidget_text_am_mfvclr")||id.equals("appwidget_text_ampm_mfvclr");
        String key=weatherPeriod?"weather_time_period":"desktop_clock_period";
        if(period&&isChinese(c)&&enabled(c,key)){
            Calendar now=clock.getTimeZone()==null?Calendar.getInstance():Calendar.getInstance(TimeZone.getTimeZone(clock.getTimeZone()));
            clock.setText(ConnectionExtrasPolicy.period(now.get(Calendar.HOUR_OF_DAY)));
            witness(c,key,"native_textclock_period:"+id);
        }
    }
    private static void witness(Context c,String suffix,String detail){
        String key=SystemOptions.key(suffix);
        if(c!=null&&WITNESSED.add(key))FeatureSettings.diagnostic(c,key+"_last_hit",detail+"|"+System.currentTimeMillis());
    }
    private static boolean isChinese(Context c){return c!=null&&"zh".equals(c.getResources().getConfiguration().getLocales().get(0).getLanguage());}
}
