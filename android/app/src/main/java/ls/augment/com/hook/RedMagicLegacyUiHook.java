package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Handler;
import android.os.PowerManager;
import android.os.SystemClock;
import android.telephony.SubscriptionManager;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;
import java.util.WeakHashMap;
import java.lang.ref.WeakReference;
import ls.augment.com.SystemUiOptions;
import ls.augment.com.SystemUiPolicy;
import ls.augment.com.ConfigSchema;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Ports the old module's UI behavior onto inspected RedMagicOS 11.5 adapters. */
final class RedMagicLegacyUiHook {
    private static final String P = SystemUiOptions.PREFIX;
    private static final Map<View, Integer> HIDDEN = new WeakHashMap<>();
    private static final Map<View, Float> ALPHAS = new WeakHashMap<>();
    private static final Map<View, Float> KEYGUARD_TRANSITION_ALPHAS = new WeakHashMap<>();
    private static final Map<ViewGroup, ArrayList<WeakReference<View>>> BATTERY_ORDER = new WeakHashMap<>();
    private static final Map<View,int[]> BATTERY_RULES=new WeakHashMap<>();
    private static final int[] HORIZONTAL_RULES={RelativeLayout.LEFT_OF,RelativeLayout.RIGHT_OF,RelativeLayout.ALIGN_LEFT,RelativeLayout.ALIGN_RIGHT,
            RelativeLayout.ALIGN_PARENT_LEFT,RelativeLayout.ALIGN_PARENT_RIGHT,RelativeLayout.START_OF,RelativeLayout.END_OF,
            RelativeLayout.ALIGN_START,RelativeLayout.ALIGN_END,RelativeLayout.ALIGN_PARENT_START,RelativeLayout.ALIGN_PARENT_END,
            RelativeLayout.CENTER_HORIZONTAL,RelativeLayout.CENTER_IN_PARENT};
    private static final Map<View, TapState> TAPS = new WeakHashMap<>();
    private static final Map<View,Integer> BATTERY_WIDTHS=new WeakHashMap<>();
    private static final Map<View,Float> BATTERY_ALPHAS=new WeakHashMap<>();
    private static final Map<View,String> BATTERY_PALETTES=new WeakHashMap<>();
    private static final Map<View,String> BATTERY_STYLES=new WeakHashMap<>();
    private RedMagicLegacyUiHook() { }
    static int install(AugmentModule module, ClassLoader loader) {
        int count = installBattery(module, loader);
        count += installClock(module, loader);
        count += installQuickSettings(module, loader);
        count += installCharging(module, loader);
        // StatusIconContainer measures its StatusIconDisplayable state, even when
        // the child View is GONE. Exclude module-hidden slots from that state too.
        for (String type : new String[]{"com.android.systemui.statusbar.StatusBarIconView",
                "com.android.systemui.statusbar.pipeline.shared.ui.view.ModernStatusBarView"}) {
            count += hook(module, loader, type, "isIconVisible", 0, null,
                    (owner, args, result) -> owner instanceof View && shouldHideStatusIcon((View) owner)
                            ? false : PASS);
        }
        count += hook(module, loader, "com.zte.feature.volume.MfvVolumeDialog", "shouldKeyguardHandleVolumeKeys", 0,
                (o,a,r) -> on(o,"lock_volume") ? false : PASS, null);
        count += hook(module, loader, "com.zte.adapt.mifavor.volume.VolumeDialogImplAdapt", "richTapVibrateForVolumeKeyLongPress", -1,
                (o,a,r) -> on(o,"audio_no_long_press_vibrate") ? null : PASS, null);
        count += hook(module, loader, "com.android.systemui.statusbar.phone.PhoneStatusBarView", "onTouchEvent", 1,
                (o,a,r) -> {
                    if (!(o instanceof View) || !(a[0] instanceof MotionEvent) || !on(o,"statusbar_double_tap_sleep")) return PASS;
                    View view = (View)o; MotionEvent event = (MotionEvent)a[0];
                    TapState state = TAPS.get(view);
                    if (state == null) { state = new TapState(); TAPS.put(view,state); }
                    float slop=12*view.getResources().getDisplayMetrics().density;
                    if (event.getActionMasked() == MotionEvent.ACTION_DOWN) { state.x=event.getX(); state.y=event.getY(); state.down=event.getEventTime();state.moved=false; }
                    if (event.getActionMasked() == MotionEvent.ACTION_MOVE&&Math.hypot(event.getX()-state.x,event.getY()-state.y)>slop)state.moved=true;
                    if (event.getActionMasked() == MotionEvent.ACTION_CANCEL) { state.up=0; state.down=0; }
                    if (event.getActionMasked() == MotionEvent.ACTION_UP) {
                        boolean tap = !state.moved&&event.getEventTime()-state.down < 250
                                && Math.hypot(event.getX()-state.x,event.getY()-state.y) < slop;
                        if (tap && state.up > 0 && event.getEventTime()-state.up < 320
                                &&Math.hypot(event.getX()-state.lastX,event.getY()-state.lastY)<slop*2) {
                            state.up=0;
                            PowerManager power = view.getContext().getSystemService(PowerManager.class);
                            call(power,"goToSleep",SystemClock.uptimeMillis());
                            return true;
                        }
                        state.up=tap?event.getEventTime():0;
                        state.lastX=event.getX();state.lastY=event.getY();
                    }
                    return PASS;
                }, null);
        return count;
    }

    static void applyView(View view) {
        String type = view.getClass().getSimpleName();
        if (type.equals("PhoneStatusBarView")) alpha(view,on(view,"statusbar_hide"));
        if (type.equals("KeyguardStatusBarView")) keyguardAlpha(view,on(view,"keyguard_statusbar_hide"));
        String id = id(view); boolean hide = false, managed = false;
        if (id.equals("wifi_in") || id.equals("wifi_out") || id.equals("wifi_inout")) {hide=on(view,"hide_wifi_activity");managed=true;}
        if (id.equals("wifi_standard") || id.equals("wifi_type")) {hide=on(view,"hide_wifi_standard");managed=true;}
        if (id.equals("mobile_in") || id.equals("mobile_out")) {hide=on(view,"hide_mobile_activity");managed=true;}
        if (id.equals("mobile_type") || id.equals("mobile_type_container")) {hide=on(view,"hide_mobile_type");managed=true;}
        if (id.equals("mobile_volte")) {hide=on(view,"hide_hd_small");managed=true;}
        if(type.equals("MFVBatteryViewLayout")&&inBar(view)){
            refreshBatteryStyle(view);
            batteryAppearance(view);
        }
        if (type.equals("ModernStatusBarMobileView")) {
            managed=true;
            try { Object sub=call(view,"getSubId"); int slot=sub instanceof Integer?SubscriptionManager.getSlotIndex((Integer)sub):-1;
                hide=slot==0&&on(view,"hide_sim1") || slot==1&&on(view,"hide_sim2");
            } catch (ReflectiveOperationException ignored) { }
        }
        String slot = SystemUiHook.slotOf(view);
        if (slot != null) { managed = true; hide |= shouldHideStatusIcon(view); }
        if(managed)visibility(view,hide&&!preserveNativeAppearance(view));
    }

    private static boolean shouldHideStatusIcon(View view) {
        if (preserveNativeAppearance(view)) return false;
        String slot = SystemUiHook.slotOf(view);
        String type = view.getClass().getSimpleName();
        boolean hide = false;
        if (type.equals("ModernStatusBarMobileView")) {
            try {
                Object sub = call(view, "getSubId");
                int sim = sub instanceof Integer ? SubscriptionManager.getSlotIndex((Integer) sub) : -1;
                hide = sim == 0 && on(view, "hide_sim1") || sim == 1 && on(view, "hide_sim2");
            } catch (ReflectiveOperationException ignored) { }
        }
        // RedMagic renders the standalone HD / HD1+HD2 badge in the IMS slot.
        // mobile_volte above belongs to the separate small per-SIM icon.
        if("ims_icon".equalsIgnoreCase(slot)) hide |= on(view,"hide_hd_large");
        String scope=null;
        if("wifi".equalsIgnoreCase(slot)||type.contains("StatusBarWifiView"))scope="hide_wifi_scope";
        else if("hotspot".equalsIgnoreCase(slot))scope="hide_hotspot_scope";
        else if("mobile".equalsIgnoreCase(slot)||type.equals("ModernStatusBarMobileView"))scope="hide_mobile_scope";
        if(scope!=null){int selected=number(view,scope,0,0,6);hide|=selected==6||selected>0&&selected==iconContext(view);}
        if (slot != null) {
            String names=FeatureSettings.text(view.getContext(),P+"hidden_icon_slots","");
            for(String name:names.split(",")) if(!name.trim().isEmpty()&&name.trim().equalsIgnoreCase(slot)) hide=true;
        }
        return hide;
    }

    private static void refreshBatteryStyle(View view) {
        String style = number(view,"battery_style",0,0,6) + ":" + on(view,"battery_hide_percent");
        String previous = BATTERY_STYLES.put(view,style);
        if(style.equals(previous) || previous==null && style.equals("0:false")) return;
        try {
            // Replay the native getter after suspending the style override, so
            // changing modes restores the system's live battery preference.
            Object mode = call(view,"getLevelDisplayMode");
            if(mode instanceof Integer) call(view,"updateBatteryLayout",mode,true);
            call(view,"updateBatteryLevelText");
        } catch(ReflectiveOperationException ignored) { view.requestLayout(); }
    }

    private static int installBattery(AugmentModule module, ClassLoader loader) {
        String type="com.zte.mifavor.views.MFVBatteryViewLayout";
        int count=hook(module,loader,type,"getLevelDisplayMode",0,(o,a,r)->{
            if(!inBar(o))return PASS;
            int mode=SystemUiPolicy.nativeBatteryMode(number(o,"battery_style",0,0,6));
            return mode<0?PASS:mode;
        },null);
        count+=hook(module,loader,type,"updateBatteryLayout",2,(o,a,r)->{
            if(inBar(o)) {int mode=SystemUiPolicy.nativeBatteryMode(number(o,"battery_style",0,0,6)); if(mode>=0&&a[0] instanceof Integer){a[0]=mode;a[1]=true;}}
            return PASS;
        },(o,a,r)->{batteryLayout(o);return PASS;});
        count+=hook(module,loader,type,"updateBatteryLevelText",0,null,(o,a,r)->{
            if(inBar(o)&&on(o,"battery_hide_percent")) {
                Object label=field(o,"mCurrentUsedBatteryLevelView"),level=field(o,"mBateryLevel");
                if(label instanceof TextView&&level instanceof Integer)((TextView)label).setText(String.valueOf(level));
            }return PASS;
        });
        for(String name:new String[]{"getMappedBatteryIconFgColor","getMappedBatteryIconTextColor"}) {
            count+=hook(module,loader,type,name,-1,null,(o,a,r)->{
                Integer color=batteryColor(o);return r instanceof Integer&&color!=null?color:PASS;
            });
        }
        // The current ROM does not execute the mapped-color accessors when
        // updating its cached palette. Intercept the native drawing inputs too.
        count+=hook(module,loader,"com.zte.mifavor.views.MFVBatteryMeterView","setColorTint",2,(o,a,r)->{
            Integer color=batteryColor(batteryOwner(o));if(color!=null)a[1]=color;return PASS;
        },null);
        count+=hook(module,loader,"com.zte.mifavor.views.MFVBatteryLevelView","updateLevelColor",1,(o,a,r)->{
            Integer color=batteryColor(batteryOwner(o));if(color!=null)a[0]=color;return PASS;
        },null);
        // NX769J writes the outside percentage directly to a TextView.
        count+=hook(module,loader,type,"updateBatteryLevelColor",0,null,(o,a,r)->{
            Integer color=batteryColor(o);Object label=field(o,"mCurrentUsedBatteryLevelView");
            if(color!=null&&label instanceof TextView)((TextView)label).setTextColor(color);
            return PASS;
        });
        return count;
    }

    private static Object batteryOwner(Object child){
        while(child instanceof View){
            if(child.getClass().getSimpleName().equals("MFVBatteryViewLayout"))return child;
            child=((View)child).getParent();
        }
        return null;
    }

    private static Integer batteryColor(Object owner){
        if(!inBar(owner)||!on(owner,"battery_colors"))return null;
        if(Boolean.TRUE.equals(field(owner,"mIsCharing")))return Color.parseColor(text(owner,"battery_charging_color","#FF34C759"));
        Object raw=field(owner,"mBateryLevel");if(!(raw instanceof Integer))return null;
        int band=SystemUiPolicy.batteryBand((Integer)raw);
        String[] defaults={"#FFFF5252","#FFFFB74D","#FF81C784","#FF4CAF50"};
        return Color.parseColor(text(owner,"battery_color_"+band,defaults[band]));
    }

    private static void batteryLayout(Object owner) {
        if(!inBar(owner))return;
        batteryAppearance((View)owner);
        int style=number(owner,"battery_style",0,0,6);
        Object container=field(owner,"mBatteryContainer"),label=field(owner,"mBatteryLevelOutsideView");
        if(container instanceof View) visibility((View)container,style==5||style==6);
        if(owner instanceof RelativeLayout&&container instanceof View&&label instanceof View){
            // The inspected RedMagic widget uses RelativeLayout rules. Child
            // order cannot move the outside number to the other side of it.
            View icon=(View)container,text=(View)label;
            boolean managed=style==2||style==3,numberFirst=style==3;
            relativeBatteryChild(icon,managed,!numberFirst,text.getId());
            relativeBatteryChild(text,managed,numberFirst,icon.getId());
            Object charge=field(owner,"mOutsideChargeView");
            if(charge instanceof View)relativeBatteryChild((View)charge,managed,false,numberFirst?icon.getId():text.getId());
            return;
        }
        if(!(owner instanceof LinearLayout)||!(label instanceof View))return;
        ViewGroup group=(ViewGroup)owner;View text=(View)label;
        if(style==3&&text.getParent()==group) {
            if(!BATTERY_ORDER.containsKey(group)) {ArrayList<WeakReference<View>> order=new ArrayList<>();for(int i=0;i<group.getChildCount();i++)order.add(new WeakReference<>(group.getChildAt(i)));BATTERY_ORDER.put(group,order);}
            if(group.indexOfChild(text)!=0){group.removeView(text);group.addView(text,0);}
        } else {
            ArrayList<WeakReference<View>> order=BATTERY_ORDER.remove(group);
            if(order!=null)for(int i=0;i<order.size();i++){View child=order.get(i).get();if(child!=null&&child.getParent()==group&&group.indexOfChild(child)!=i){group.removeView(child);group.addView(child,Math.min(i,group.getChildCount()));}}
        }
    }

    private static void relativeBatteryChild(View view,boolean managed,boolean first,int preceding){
        if(!(view.getLayoutParams() instanceof RelativeLayout.LayoutParams))return;
        RelativeLayout.LayoutParams original=(RelativeLayout.LayoutParams)view.getLayoutParams();
        int[] saved=BATTERY_RULES.get(view);
        if(!managed&&saved==null)return;
        if(managed&&saved==null){saved=original.getRules().clone();BATTERY_RULES.put(view,saved);}
        RelativeLayout.LayoutParams next=new RelativeLayout.LayoutParams(original);
        for(int rule:HORIZONTAL_RULES)next.removeRule(rule);
        if(managed){if(first)next.addRule(RelativeLayout.ALIGN_PARENT_START);else next.addRule(RelativeLayout.END_OF,preceding);}
        else{for(int rule:HORIZONTAL_RULES)if(saved[rule]!=0)next.addRule(rule,saved[rule]);BATTERY_RULES.remove(view);}
        view.setLayoutParams(next);
    }

    private static void batteryAppearance(View view){
        ViewGroup.LayoutParams params=view.getLayoutParams();
        int width=number(view,"battery_width_dp",0,0,120);
        // The grid reserves the requested width after icon scaling. A native
        // fixed width would be cropped away by its ink measurement instead.
        if(FeatureSettings.enabled(view.getContext(),ls.augment.com.ConfigSchema.SYSTEMUI_MASTER))width=0;
        if(params!=null){
            if(width>0){if(!BATTERY_WIDTHS.containsKey(view))BATTERY_WIDTHS.put(view,params.width);int px=Math.round(width*view.getResources().getDisplayMetrics().density);if(params.width!=px){params.width=px;view.setLayoutParams(params);}}
            else{Integer old=BATTERY_WIDTHS.remove(view);if(old!=null){params.width=old;view.setLayoutParams(params);}}
        }
        Object raw=field(view,"mBatteryContainer");if(!(raw instanceof View))return;
        View icon=(View)raw;int opacity=number(view,"battery_alpha_percent",100,0,100);
        if(opacity<100){if(!BATTERY_ALPHAS.containsKey(icon))BATTERY_ALPHAS.put(icon,icon.getAlpha());icon.setAlpha(BATTERY_ALPHAS.get(icon)*opacity/100f);}
        else{Float old=BATTERY_ALPHAS.remove(icon);if(old!=null)icon.setAlpha(old);}
        String palette="";
        if(on(view,"battery_colors")){
            StringBuilder value=new StringBuilder();
            for(int i=0;i<4;i++)value.append(text(view,"battery_color_"+i,"")).append(';');
            palette=value.append(text(view,"battery_charging_color","")).append(';').append(field(view,"mBateryLevel"))
                    .append(';').append(field(view,"mIsCharing")).toString();
        }
        String previous=BATTERY_PALETTES.put(view,palette);
        if(!palette.equals(previous)&&(!palette.isEmpty()||previous!=null&&!previous.isEmpty())){
            // Native color fields may have been initialized before attachment
            // or before the asynchronous configuration snapshot arrived.
            try{call(view,"updateColor");
                try{call(view,"updateBatteryLevelColor",true);}
                catch(NoSuchMethodException noBooleanOverload){call(view,"updateBatteryLevelColor");}}
            catch(ReflectiveOperationException ignored){}
        }
    }

    private static int installClock(AugmentModule module,ClassLoader loader) {
        return LockscreenClockHook.install(module,loader);
    }

    private static int installQuickSettings(AugmentModule module,ClassLoader loader) {
        int count=0;
        for(String type:new String[]{"com.zte.utils.QsDimenUtils$Companion","com.zte.adapt.mifavor.qs.MfvTileLayoutAdapt"})
            count+=hook(module,loader,type,"getTileColumns",-1,(o,a,r)->on(o,"qs_grid")?grid(o,"columns",4,2,10):PASS,null);
        count+=hook(module,loader,"com.zte.adapt.mifavor.qs.MfvTileLayoutAdapt","getRows",1,(o,a,r)->on(o,"qs_grid")?grid(o,"rows",3,1,8):PASS,null);
        count+=hook(module,loader,"com.zte.utils.QsDimenUtils$Companion","getMaxQsPanelRowCount",0,(o,a,r)->on(o,"qs_grid")?grid(o,"rows",3,1,8):PASS,null);
        count+=hook(module,loader,"com.zte.feature.qs.layout.QsCustomizerModule","getColumns",-1,(o,a,r)->on(o,"qs_grid")?grid(o,"edit_columns",4,2,10):PASS,null);
        String type="com.zte.controlcenter.widget.CCHeaderView";
        count+=hook(module,loader,type,"shouldQsCarrierVisible",0,(o,a,r)->choice(o,"qs_carrier"),null);
        count+=hook(module,loader,type,"showSearchButton",0,(o,a,r)->choice(o,"qs_search"),null);
        count+=hook(module,loader,type,"handleClickDate",0,(o,a,r)->{
            if(!on(o,"qs_calendar"))return PASS;
            // A generic content URI also matches file and cloud-drive handlers.
            // The platform calendar category resolves the user's calendar app.
            Intent intent=Intent.makeMainSelectorActivity(Intent.ACTION_MAIN,Intent.CATEGORY_APP_CALENDAR);
            return startHeaderActivity(o,intent)?null:PASS;
        },null);
        count+=hook(module,loader,type,"handleClickSearch",0,(o,a,r)->{
            String pkg=text(o,"qs_browser","");Context context=context(o);
            if(pkg.isEmpty()||context==null)return PASS;
            Intent intent=context.getPackageManager().getLaunchIntentForPackage(pkg);
            return intent!=null&&startHeaderActivity(o,intent)?null:PASS;
        },null);
        return count;
    }
    private static boolean startHeaderActivity(Object owner,Intent intent) {
        Context context=context(owner);if(context==null||context.getPackageManager().resolveActivity(intent,0)==null)return false;
        try {call(owner,"postStartActivityDismissingKeyguard",intent);return true;}
        catch(ReflectiveOperationException missing){return false;}
    }

    private static int installCharging(AugmentModule module,ClassLoader loader) {
        String type="com.zte.feature.charging.ChargingFeature";
        int count=hook(module,loader,type,"hideChargingViewDelayed",0,(o,a,r)->{
            if(!on(o,"charging_animation"))return PASS;
            Object raw=field(o,"mHandler");if(!(raw instanceof Handler))return PASS;
            Handler handler=(Handler)raw;handler.removeMessages(11001);
            handler.sendEmptyMessageDelayed(11001,number(o,"charging_duration",6,1,120)*1000L);return null;
        },null);
        count+=hook(module,loader,type,"startChargingAnimation",1,(o,a,r)->{
            if(on(o,"charging_animation")&&a[0] instanceof Long)a[0]=number(o,"charging_delay",0,0,60)*1000L;return PASS;
        },null);
        count+=hook(module,loader,type,"onFinishedWakingUp",0,null,(o,a,r)->{
            if(!on(o,"charging_animation")||!on(o,"charging_every_wake"))return PASS;
            if(Boolean.TRUE.equals(field(o,"mChargeIsSeparation")))return PASS;
            if(!Boolean.TRUE.equals(field(o,"mIsCharging"))&&!Boolean.TRUE.equals(field(o,"mPluggedIn")))return PASS;
            if(!Boolean.TRUE.equals(call(o,"isKeyguardViewShowing")))return PASS;
            if(!Boolean.TRUE.equals(call(o,"isAnimationShowing")))call(o,"startChargingAnimation",number(o,"charging_delay",0,0,60)*1000L);
            return PASS;
        });
        return count;
    }
    private static Object choice(Object owner,String name){int value=number(owner,name,0,0,2);return value==0?PASS:value==1;}
    private static int grid(Object owner,String dimension,int fallback,int min,int max){Context context=context(owner);boolean land=context!=null&&context.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;return number(owner,"qs_"+(land?"land_":"")+dimension,land&&dimension.equals("rows")?2:land&&dimension.equals("edit_columns")?6:fallback,min,max);}
    private static boolean on(Object owner,String name){return !suspendAppearance(owner,name)&&FeatureSettings.enabled(context(owner),P+name);}
    private static int number(Object owner,String name,int fallback,int min,int max){return suspendAppearance(owner,name)?fallback:FeatureSettings.integer(context(owner),P+name,fallback,min,max);}
    private static boolean suspendAppearance(Object owner,String name){
        return preserveNativeAppearance(owner)&&appearanceSetting(name)
                ||inBar(owner)&&name.startsWith("battery_")
                &&!FeatureSettings.enabled(context(owner),ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,true);
    }
    private static String text(Object owner,String name,String fallback){return FeatureSettings.text(context(owner),P+name,fallback);}
    private static boolean inBar(Object owner){return owner instanceof View&&StatusBarGridHook.inBar((View)owner);}
    static boolean positionSizeOnly(Context context){return FeatureSettings.enabled(context,ConfigSchema.SYSTEMUI_MASTER)
            &&FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY);}
    static boolean preserveNativeAppearance(Object owner){return inBar(owner)&&positionSizeOnly(context(owner));}
    private static boolean appearanceSetting(String name){return name.startsWith("battery_")
            ||name.equals("statusbar_hide")||name.equals("keyguard_statusbar_hide");}
    private static String id(View view){try{return view.getResources().getResourceEntryName(view.getId());}catch(Exception e){return "";}}
    private static int iconContext(View view){
        boolean header=false,panel=false,qs=false,shadeHeader=false;
        for(View current=view;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null){
            String name=current.getClass().getSimpleName();
            if(name.equals("PhoneStatusBarView"))return 1;
            if(name.equals("KeyguardStatusBarView"))return 2;
            if(name.equals("CCHeaderView")){
                header=true;
                // The notification header and merged QS share the same parent
                // class. Use the header's actual OEM role, updated on mode changes.
                try{Object role=call(current,"getPanelType");if(role instanceof Integer){
                    int value=(Integer)role;
                    if(value==1)return 5; // QS_CENTER_TYPE: standalone controls
                    if(value==2)return 3; // NOTIFICATION_CENTER_TYPE
                    if(value==3)return 4; // PRIMITIVE_CENTER_TYPE: merged shade
                }}catch(ReflectiveOperationException ignored){ }
            }
            if(name.equals("ControlPanelWindowView"))panel=true;
            if(name.equals("MfvQSContainerImpl"))qs=true;
            if(name.equals("NoRemeasureMotionLayout")||id(current).equals("split_shade_status_bar"))shadeHeader=true;
        }
        if(header&&panel)return 5;if(header&&qs)return 4;return shadeHeader?3:0;
    }
    private static void visibility(View view,boolean hide){
        if(hide){if(!HIDDEN.containsKey(view)||view.getVisibility()!=View.GONE)HIDDEN.put(view,view.getVisibility());view.setVisibility(View.GONE);}
        else {Integer old=HIDDEN.remove(view);if(old!=null&&view.getVisibility()==View.GONE)view.setVisibility(old);}
    }
    private static void alpha(View view,boolean hide){
        if(hide){if(!ALPHAS.containsKey(view))ALPHAS.put(view,view.getAlpha());view.setAlpha(0);}
        else{Float old=ALPHAS.remove(view);if(old!=null&&view.getAlpha()==0)view.setAlpha(old);}
    }
    private static void keyguardAlpha(View view,boolean hide){
        if(hide){
            if(!KEYGUARD_TRANSITION_ALPHAS.containsKey(view))KEYGUARD_TRANSITION_ALPHAS.put(view,view.getTransitionAlpha());
            if(view.getTransitionAlpha()!=0f)view.setTransitionAlpha(0f);
        }else{
            Float old=KEYGUARD_TRANSITION_ALPHAS.remove(view);
            if(old!=null&&view.getTransitionAlpha()==0f)view.setTransitionAlpha(old);
        }
    }
    private static final class TapState {long down,up;float x,y,lastX,lastY;boolean moved;}
}
