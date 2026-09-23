package ls.augment.com.hook;

import android.content.Context;
import android.database.ContentObserver;
import android.graphics.Rect;
import android.graphics.Matrix;
import android.net.TrafficStats;
import android.net.Uri;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.Method;
import java.util.*;
import ls.augment.com.ConfigSchema;
import ls.augment.com.StatusBarGridSpec;
import ls.augment.com.StatusBarGridLayout;

/** Places native icon views into measured rows without taking over their lifecycle. */
final class StatusBarGridHook {
    private static final Map<ViewGroup, State> STATES = new WeakHashMap<>();
    private static final String ROOT = "com.android.systemui.statusbar.phone.PhoneStatusBarView";
    private static final String KEYGUARD = "com.android.systemui.statusbar.phone.KeyguardStatusBarView";
    static boolean isBarRoot(View view) {
        for (Class<?> type=view.getClass(); type!=null; type=type.getSuperclass())
            if (ROOT.equals(type.getName()) || KEYGUARD.equals(type.getName())) return true;
        return false;
    }
    private static boolean isKeyguard(View view) {
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())
            if(KEYGUARD.equals(type.getName()))return true;
        return false;
    }
    /** Root overlays must follow the native icon region, which OEMs hide without hiding the root. */
    private static float overlayAlpha(View root,View anchor) {
        if(anchor==null||!(anchor.getParent() instanceof View))return 0;
        float alpha=1;
        // Ignore the battery's own alpha: the three-in-one replacement deliberately sets it to zero.
        // Root/outer-window alpha already applies to both children and must not be multiplied twice.
        for(View parent=(View)anchor.getParent();parent!=root;){
            if(parent.getVisibility()!=View.VISIBLE)return 0;
            alpha*=parent.getAlpha()*parent.getTransitionAlpha();
            if(!(parent.getParent() instanceof View))return 0;
            parent=(View)parent.getParent();
        }
        return Math.max(0,Math.min(1,alpha));
    }
    static boolean inBar(View view) {
        for (View current=view; current!=null;
                current=current.getParent() instanceof View?(View)current.getParent():null)
            if (isBarRoot(current)) return true;
        return false;
    }
    static int install(AugmentModule module, ClassLoader loader) {
        int count=0;
        for (String rootClass : new String[]{ROOT, KEYGUARD}) try {
            Class<?> type=Class.forName(rootClass,false,loader);
            Method updateHeight=find(type,"updateStatusBarHeight");
            if(updateHeight!=null){
                module.registerFeatureHook(module.prepareFeatureHook(updateHeight,"systemui.grid.native_height",false).intercept(chain->{
                    Object result=chain.proceed();State state=STATES.get(chain.getThisObject());
                    if(state!=null)state.applyHeight(state.active?FeatureSettings.integer(state.context,ConfigSchema.STATUSBAR_HEIGHT_DP,0,0,80):0);
                    return result;
                }));count++;
            }
            for (String name : new String[]{"onFinishInflate", "onAttachedToWindow", "onDetachedFromWindow"}) {
                Method method=find(type,name); if (method==null) continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,"systemui.grid."+name,false).intercept(chain -> {
                    Object result=chain.proceed(); Object owner=chain.getThisObject();
                    if (type.isInstance(owner) && owner instanceof ViewGroup) {
                        ViewGroup root=(ViewGroup)owner;
                        if (name.equals("onDetachedFromWindow")) { State s=STATES.remove(root); if(s!=null)s.detach(); }
                        else { State s=STATES.get(root); if(s==null){s=new State(root);STATES.put(root,s);} s.attach(); }
                    }
                    return result;
                })); count++;
            }
        } catch(Throwable e) { FeatureSettings.diagnostic(FeatureSettings.from(null),FeatureSettings.SYSTEMUI_LAST_ERROR,"grid_install:"+e); }
        try{
            Class<?> container=Class.forName("com.android.systemui.statusbar.phone.NotificationIconContainer",false,loader);
            Method calculate=container.getDeclaredMethod("calculateIconXTranslations");
            java.lang.reflect.Field maximum=container.getDeclaredField("mMaxIcons"),width=container.getDeclaredField("mActualLayoutWidth"),speedBump=container.getDeclaredField("mSpeedBumpIndex");
            maximum.setAccessible(true);width.setAccessible(true);speedBump.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(calculate,"systemui.grid.notification_capacity",true).intercept(chain->{
                ViewGroup view=(ViewGroup)chain.getThisObject();boolean phone=false;
                phone=inBar(view);
                int limit=FeatureSettings.integer(view.getContext(),ConfigSchema.STATUSBAR_NOTIFICATION_MAX,0,0,20);
                if(!phone||limit==0||!FeatureSettings.enabled(view.getContext(),ConfigSchema.SYSTEMUI_MASTER)
                        ||FeatureSettings.enabled(view.getContext(),ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY))return chain.proceed();
                int oldMax=maximum.getInt(view),oldWidth=width.getInt(view),oldBump=speedBump.getInt(view);
                int room=view.getWidth();for(int i=0;i<view.getChildCount();i++)room+=view.getChildAt(i).getWidth();
                maximum.setInt(view,limit);width.setInt(view,room);speedBump.setInt(view,-1);
                try{return chain.proceed();}finally{maximum.setInt(view,oldMax);width.setInt(view,oldWidth);speedBump.setInt(view,oldBump);}
            }));count++;
        }catch(Throwable e){module.logFeatureError("STATUSBAR_NOTIFICATION_CAPACITY",e);}
        return count;
    }
    private static Method find(Class<?> type,String name) {
        for(Class<?> c=type;c!=null;c=c.getSuperclass()) try{return c.getDeclaredMethod(name);}catch(NoSuchMethodException ignored){}
        return null;
    }
    private static String name(View v) { try{return v.getResources().getResourceEntryName(v.getId());}catch(Exception e){return "";} }
    private static boolean colorOnlySetting(String key) {
        return key.equals(ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS)
                ||key.equals(ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR)
                ||key.equals("ls_augment_rm_battery_colors")
                ||key.startsWith("ls_augment_rm_battery_color_")
                ||key.equals("ls_augment_rm_battery_charging_color")
                ||key.equals("ls_augment_rm_battery_text_colors")
                ||key.startsWith("ls_augment_rm_battery_text_color_")
                ||key.equals("ls_augment_rm_battery_text_charging_color");
    }
    private static View findView(View root,String... names) {
        if(Arrays.asList(names).contains(name(root)))return root;
        if(root instanceof ViewGroup) for(int i=0;i<((ViewGroup)root).getChildCount();i++) {
            View found=findView(((ViewGroup)root).getChildAt(i),names);if(found!=null)return found;
        }
        return null;
    }
    private static View findClass(View root,String suffix) {
        if(root.getClass().getSimpleName().equals(suffix))return root;
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){
            View result=findClass(((ViewGroup)root).getChildAt(i),suffix);if(result!=null)return result;
        }return null;
    }
    private static final class Geometry {
        float x,y,sx,sy,alpha,lastX,lastY,lastSx,lastSy,lastAlpha; boolean applied;
        Geometry(View v){capture(v);}
        void capture(View v){x=v.getTranslationX();y=v.getTranslationY();sx=v.getScaleX();sy=v.getScaleY();alpha=v.getAlpha();}
        void observe(View v){if(!applied){capture(v);return;}
            if(v.getTranslationX()!=lastX)x=v.getTranslationX(); if(v.getTranslationY()!=lastY)y=v.getTranslationY();
            if(v.getScaleX()!=lastSx)sx=v.getScaleX();if(v.getScaleY()!=lastSy)sy=v.getScaleY();if(v.getAlpha()!=lastAlpha)alpha=v.getAlpha();}
        void mark(View v){lastX=v.getTranslationX();lastY=v.getTranslationY();lastSx=v.getScaleX();lastSy=v.getScaleY();lastAlpha=v.getAlpha();applied=true;}
        void restore(View v){observe(v);v.setTranslationX(x);v.setTranslationY(y);v.setScaleX(sx);v.setScaleY(sy);v.setAlpha(alpha);applied=false;}
    }
    private static final class State {
        final ViewGroup root; final Context context; final Handler main=new Handler(Looper.getMainLooper());
        final Map<View,Geometry> geometry=new IdentityHashMap<>();
        final Map<ViewGroup,boolean[]> clips=new IdentityHashMap<>();
        final Map<String,TextView> metrics=new LinkedHashMap<>();
        final TextView[] clockLines=new TextView[2];
        final Map<String,String> metricValues=new LinkedHashMap<>();
        final Map<View,Rect> contentBounds=new IdentityHashMap<>();
        android.graphics.Bitmap batteryBitmap;int[] batteryPixels;Rect batteryInk;long batteryInkAt;int batteryInkWidth,batteryInkHeight;
        final Runnable snapshotListener=this::refresh;
        final ViewTreeObserver.OnPreDrawListener draw=()->{layout();return true;};
        HandlerThread thread; volatile Handler worker; volatile long metricsGeneration;
        FrameLayout overlay; TextView keyguardClock; boolean attached,active,applying;
        ConnectivityIconView connectivityIcon;
        StatusBarGridSpec spec=StatusBarGridSpec.defaults(); int nativeHeight=Integer.MIN_VALUE;
        long previousRx=-1,previousTx=-1,previousTime,lastWitness,layoutFrames,positionWrites;
        String lastRaw="",lastConfig="",lastLayoutConfig="";
        State(ViewGroup root){this.root=root;context=root.getContext();}
        void attach(){if(attached)return;attached=true;
            if(root.getLayoutParams()!=null)nativeHeight=root.getLayoutParams().height;
            root.getViewTreeObserver().addOnPreDrawListener(draw);
            FeatureSettings.addSnapshotListener(context,snapshotListener);
            main.post(this::refresh);
        }
        void refresh(){if(!attached)return;
            // The background reader can publish between any two calls. Use one immutable
            // snapshot for both rendered values and the deduplication signature.
            ls.augment.com.ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
            boolean enabled=ConfigSchema.truthy(snapshot.get(ConfigSchema.SYSTEMUI_MASTER));
            String raw=snapshot.get(ConfigSchema.STATUSBAR_GRID);
            StatusBarGridSpec parsed=StatusBarGridSpec.parse(raw);if(parsed==null)return;
            StringBuilder config=new StringBuilder().append(enabled);
            StringBuilder layoutConfig=new StringBuilder().append(enabled);
            for(String key:ConfigSchema.keys())if(key.startsWith("ls_augment_statusbar_")
                    ||key.startsWith("ls_augment_rm_battery_")){
                String value=snapshot.get(key);
                config.append('|').append(key).append('=').append(value);
                if(!colorOnlySetting(key))layoutConfig.append('|').append(key).append('=').append(value);
            }
            if(lastConfig.equals(config.toString()))return;
            lastConfig=config.toString();
            if(enabled&&active&&lastLayoutConfig.equals(layoutConfig.toString())){
                // Palette changes only affect drawing. Preserve the view, radio
                // callbacks, cached signal state and the running metrics worker.
                // onDraw reads the published palette; no restore/requestLayout.
                if(connectivityIcon!=null)connectivityIcon.invalidate();
                root.invalidate();
                String surface=isKeyguard(root)?"keyguard":"phone";
                FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_color_refresh",
                        "build="+ls.augment.com.BuildConfig.VERSION_CODE+";mode=redraw;icon="
                        +(connectivityIcon==null?"native":System.identityHashCode(connectivityIcon))
                        +";source="+(connectivityIcon==null?"native":System.identityHashCode(connectivityIcon.source)));
                return;
            }
            lastLayoutConfig=layoutConfig.toString();
            restore(); spec=parsed;lastRaw=raw;active=enabled;
            if(!enabled){stopMetrics();
                // Recompute OEM content padding as well as the root height. Its
                // top inset may have been calculated during a previous layout.
                try{TargetReflection.call(root,"updateResources");}catch(Exception ignored){}
                applyHeight(0);SystemUiHook.refreshGridClock(root);
                FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"0");
                FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,"grid_v2;restored_native=1");
                root.requestLayout(); return;}
            applyHeight(Integer.parseInt(snapshot.get(ConfigSchema.STATUSBAR_HEIGHT_DP)));
            SystemUiHook.refreshGridClock(root); startMetrics();root.requestLayout();root.invalidate();
        }
        void applyHeight(int dp){ViewGroup.LayoutParams p=root.getLayoutParams();if(p==null)return;
            // A view inflated during an enabled boot/rotation can already have our
            // enlarged height. Query the unmodified dimension instead of restoring it.
            int original=StatusBarWindowSizingHook.nativeHeight(context);
            if(isKeyguard(root)){
                int resource=context.getResources().getIdentifier("status_bar_header_height_keyguard","dimen",context.getPackageName());
                original=resource!=0?context.getResources().getDimensionPixelSize(resource):nativeHeight>0?nativeHeight:original;
            }
            int target=dp>0?Math.max(original,px(dp)):original>0?original:nativeHeight;
            if(target!=Integer.MIN_VALUE&&p.height!=target){p.height=target;root.setLayoutParams(p);}}
        int px(float dp){return Math.round(dp*context.getResources().getDisplayMetrics().density);}
        boolean positionOnly(){return FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY);}
        boolean connectivityGroup(){return !positionOnly()&&FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP);}
        boolean usingConnectivityIcon(){return connectivityGroup()&&connectivityIcon!=null&&connectivityIcon.ready();}
        boolean two(String id){return !positionOnly()&&FeatureSettings.enabled(context,id.equals("notifications")?ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS:ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,true);}
        boolean showItem(String id){return positionOnly()||spec.get(id).visible && (!id.equals("notifications")
                || !FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NOTIFICATION_HIDE));}
        void layout(){if(!active||applying||root.getWidth()==0||root.getHeight()==0)return;applying=true;
            try {
                applyHeight(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_HEIGHT_DP,0,0,80));
                layoutFrames++;
                for(Map.Entry<View,Geometry> e:geometry.entrySet())if(isDescendant(e.getKey(),root))e.getValue().observe(e.getKey());
                Map<String,View> views=new LinkedHashMap<>();contentBounds.clear();groups.clear();iconHeights.clear();
                if(connectivityGroup()&&connectivityIcon==null){connectivityIcon=new ConnectivityIconView(context);
                    root.addView(connectivityIcon,new ViewGroup.LayoutParams(px(26),px(26)));}
                View clock=keyguardClock!=null?keyguardClock:findView(root,"clock","status_bar_clock");
                View notifications=findClass(root,"NotificationIconContainer");
                View systems=findClass(root,"StatusIconContainer");
                if(systems==null)systems=findView(root,"statusIcons","status_icons");
                View battery=findView(root,"battery","battery_view");
                float regionAlpha=overlayAlpha(root,battery!=null?battery:systems);
                if(connectivityIcon!=null)connectivityIcon.setAlpha(usingConnectivityIcon()?regionAlpha:0);
                if(overlay!=null)overlay.setAlpha(regionAlpha);
                ArrayList<StatusBarGridLayout.Node> nodes=new ArrayList<>();
                if(!addClockRows(nodes,views,clock))add(nodes,views,"clock",clock);
                if(positionOnly()){
                    applyNativeNetworkSize(systems);
                    addCompanion(nodes,views,"notifications","notifications",notifications,0,false);
                    addCompanion(nodes,views,"system_icons","system_icons",systems,0,false);
                    View vendor=findView(root,"red_magic_function_icon_container");
                    if(vendor!=null&&!isDescendant(vendor,systems))addCompanion(nodes,views,"system_icons.vendor","system_icons",vendor,1,false);
                }else{
                addGroup(nodes,views,"notifications",notifications);
                // RedMagic's fan/refresh-rate/cooling icons live outside StatusIconContainer.
                // Pack their native children alongside system icons so notifications cannot cover them.
                addGroup(nodes,views,"system_icons",systems,findView(root,"red_magic_function_icon_container"));
                }
                if(usingConnectivityIcon()){
                    if(clock instanceof TextView)connectivityIcon.tint(((TextView)clock).getCurrentTextColor());
                    addConnectivity(nodes,views,battery);
                }else add(nodes,views,"battery",battery);
                // These native indicators are siblings of the ordinary icon lists, not their children.
                // Keep compound chips intact (icon + text + click target) and reserve a complete box.
                addCompanion(nodes,views,"clock.operator","clock",findView(root,"operator_name_frame"),-10,false);
                addCompanion(nodes,views,"notifications.ongoing_primary","notifications",findView(root,"ongoing_activity_chip_primary"),-9,false);
                addCompanion(nodes,views,"notifications.ongoing_secondary","notifications",findView(root,"ongoing_activity_chip_secondary"),-8,false);
                addCompanion(nodes,views,"notifications.heads_up","notifications",findView(root,"heads_up_status_bar_view"),-7,false);
                addCompanion(nodes,views,"notifications.join","notifications",findView(root,"ll_notification_icon_join"),-1,true);
                addCompanion(nodes,views,"system_icons.user","system_icons",findView(root,"user_switcher_container"),10,false);
                addCompanion(nodes,views,"system_icons.avatar","system_icons",findView(root,"multi_user_avatar"),11,false);
                View carrier=findView(root,"keyguard_carrier_text");
                updateKeyguardCarrier(carrier);
                if(!replaceKeyguardCarrier())addCompanion(nodes,views,"clock.carrier","clock",carrier,-11,false);
                for(Map.Entry<String,TextView> e:metrics.entrySet()){
                    if(clock instanceof TextView)e.getValue().setTextColor(((TextView)clock).getTextColors());
                    add(nodes,views,e.getKey(),e.getValue());
                }
                if(keyguardClock!=null){
                    if(carrier instanceof TextView)keyguardClock.setTextColor(((TextView)carrier).getTextColors());}
                float cutLeft=0,cutRight=0;
                WindowInsets insets=root.getRootWindowInsets();
                if(insets!=null&&insets.getDisplayCutout()!=null){int[] rp=new int[2];root.getLocationOnScreen(rp);
                    for(Rect r:insets.getDisplayCutout().getBoundingRects())if(r.top<rp[1]+root.getHeight()&&r.bottom>rp[1]){cutLeft=r.left-rp[0]-px(2);cutRight=r.right-rp[0]+px(2);}}
                Map<String,StatusBarGridLayout.Box> boxes=StatusBarGridLayout.pack(nodes,root.getWidth(),root.getHeight(),
                        px(4+FeatureSettings.integer(context,ConfigSchema.STATUSBAR_LEFT_MARGIN_DP,0,0,40)),
                        px(4+FeatureSettings.integer(context,ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP,0,0,40)),
                        px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_TOP_MARGIN_DP,0,0,12)),
                        px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP,0,0,12)),
                        px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,0,-8,8)),cutLeft,cutRight);
                for(Map.Entry<String,StatusBarGridLayout.Box> e:boxes.entrySet())place(e.getKey(),views.get(e.getKey()),e.getValue());
                long now=SystemClock.elapsedRealtime();
                if(now-lastWitness>5000){lastWitness=now;
                    FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"1");
                    String surface=isKeyguard(root)?"keyguard":"phone";
                    String evidence="grid_v2;build="+ls.augment.com.BuildConfig.VERSION_CODE+";surface="+surface+";patch=20260908r1;frames="+layoutFrames+";position_writes="+positionWrites+";clock="+(clock!=null)+";notifications="+(notifications!=null)+";system_icons="+(systems!=null)+";carrier_replaced="+replaceKeyguardCarrier()+";items="+boxes.size()+";size="+root.getWidth()+"x"+root.getHeight();
                    FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,evidence);
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_layout_state",evidence);
                    if(connectivityIcon!=null)FeatureSettings.diagnostic(context,"ls_augment_statusbar_connectivity_"+surface,
                            "circle;ready="+connectivityIcon.ready()+";alpha="+connectivityIcon.getAlpha()+";"+connectivityIcon.sourceState().description()+";error="+connectivityIcon.source.error);
                    StringBuilder detail=new StringBuilder();
                    for(int row=0;row<2;row++){String id="clock#"+row;StatusBarGridLayout.Box b=boxes.get(id);TextView line=clockLines[row];
                        if(b!=null&&line!=null){Rect ink=contentBounds.get(line);detail.append(id).append("=baseline:").append(b.y+(line.getBaseline()-ink.top)*line.getScaleY()).append("@").append(b.x).append(',').append(b.y).append(';');}}
                    if(clock instanceof TextView){StatusBarGridLayout.Box box=boxes.get("clock");
                        int[] cp=new int[2];clock.getLocationOnScreen(cp);TextView ct=(TextView)clock;
                        detail.append("clockText=").append(((TextView)clock).getText()).append("/alpha=").append(clock.getAlpha()).append("/view=").append(clock.getWidth()).append('x').append(clock.getHeight());
                        detail.append("/at=").append(cp[0]).append(',').append(cp[1]).append("/baseline=").append(ct.getBaseline()).append("/scroll=").append(ct.getScrollX()).append(',').append(ct.getScrollY()).append("/padding=").append(ct.getTotalPaddingTop()).append(',').append(ct.getTotalPaddingBottom()).append("/layout=").append(ct.getLayout()==null?"null":ct.getLayout().getHeight()).append("/shown=").append(ct.isShown());
                        if(box!=null)detail.append("/box=").append(box.x).append(',').append(box.y).append(',').append(box.width).append(',').append(box.height);
                        detail.append(';');}
                    StatusBarGridLayout.Box notificationTop=boxes.get("notifications#0"),notificationBottom=boxes.get("notifications#1");
                    if(notificationTop!=null&&notificationBottom!=null)detail.append("notifications_x=").append(notificationTop.x).append(',').append(notificationBottom.x).append(';');
                    for(Map.Entry<String,TextView> metric:metrics.entrySet()){
                        StatusBarGridLayout.Box box=boxes.get(metric.getKey());if(box==null)continue;
                        int[] point=new int[2];metric.getValue().getLocationInWindow(point);
                        detail.append(metric.getKey()).append('=').append(metric.getValue().getText()).append('@').append(point[0]).append(',').append(point[1])
                                .append('/').append(Math.round(box.width)).append('x').append(Math.round(box.height));
                        Rect ink=contentBounds.get(metric.getValue());if(ink!=null)detail.append("/baseline:").append(box.y+(metric.getValue().getBaseline()-ink.top)*metric.getValue().getScaleY());detail.append(';');
                    }
                    if(battery!=null){detail.append("battery=").append(battery.getClass().getSimpleName()).append('/').append(battery.getWidth()).append('x').append(battery.getHeight()).append('/').append(contentBounds.get(battery));
                        if(battery instanceof ViewGroup)for(int i=0;i<((ViewGroup)battery).getChildCount();i++){View child=((ViewGroup)battery).getChildAt(i);detail.append('/').append(name(child)).append(':').append(child.getWidth()).append('x').append(child.getHeight());}}
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_metrics_state",detail.toString());
                    // Hidden keyguard and phone roots can both relayout. Retain
                    // separate witnesses so a hidden empty root cannot erase
                    // the visible surface's metrics during diagnostics.
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_metrics_state",detail.toString());
                    StringBuilder rows=new StringBuilder();
                    for(Map.Entry<String,StatusBarGridLayout.Box> e:boxes.entrySet()){
                        StatusBarGridLayout.Box b=e.getValue();rows.append(e.getKey()).append('@').append(b.y).append('+').append(b.height).append(';');
                    }
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_rows_state",rows.toString());
                    StringBuilder icons=new StringBuilder();for(Map.Entry<String,List<View>> group:groups.entrySet()){
                        if(!group.getKey().startsWith("system_icons"))continue;
                        icons.append(group.getKey()).append('=');for(View child:group.getValue())icons.append(name(child).isEmpty()?SystemUiHook.slotOf(child):name(child)).append(',');icons.append(';');}
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_system_items",icons.toString());}
            }catch(Throwable e){failLayout(e);}
            finally{applying=false;}
        }
        void failLayout(Throwable error){
            // Remove replacement content before restoring native alpha/transforms. Restoring
            // the overlay's children in place would pile every label at its original (0,0).
            // Stopping the worker also invalidates samples already queued on the main thread.
            active=false;stopMetrics();restore();
            String surface=isKeyguard(root)?"keyguard":"phone";
            String evidence="grid_v2;build="+ls.augment.com.BuildConfig.VERSION_CODE+";surface="+surface
                    +";fallback_native=1;size="+root.getWidth()+"x"+root.getHeight();
            FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAST_ERROR,"grid_layout:"+error);
            FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"0");
            FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,evidence);
            FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_layout_state",evidence);
        }
        Geometry own(View view){Geometry g=geometry.get(view);if(g==null){
            // OEM reparents icons between keyguard and the unlocked bar. Transfer
            // ownership before capturing, otherwise the previous grid becomes the baseline.
            for(State other:STATES.values())if(other!=this){Geometry old=other.geometry.remove(view);if(old!=null)old.restore(view);}
            g=new Geometry(view);geometry.put(view,g);}return g;}
        boolean replaceKeyguardCarrier(){return isKeyguard(root)&&!positionOnly()&&keyguardClock!=null;}
        void updateKeyguardCarrier(View carrier){
            if(carrier==null)return;
            // The injected clock replaces the OEM carrier in the configured clock slot.
            // An extra, unconfigured carrier must not push the clock/metrics to the right,
            // including when the user hides the clock. Geometry restores native alpha
            // when the grid is disabled, detached, or falls back after a layout failure.
            Geometry original=own(carrier);
            carrier.setAlpha(replaceKeyguardCarrier()?0:original.alpha);original.mark(carrier);
        }
        boolean splitClock(){return !positionOnly()&&FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_CLOCK_CUSTOM)
                &&FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CLOCK_ROWS,2,1,2)==2;}
        boolean addClockRows(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,View source){
            if(!splitClock()||overlay==null||!(source instanceof TextView))return false;
            TextView clock=(TextView)source;Geometry original=own(clock);clock.setAlpha(0);original.mark(clock);
            String[] lines=clock.getText().toString().split("\n",-1);
            int width=px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP,0,0,240));
            for(String line:lines)width=Math.max(width,(int)Math.ceil(android.text.Layout.getDesiredWidth(line,clock.getPaint())));
            for(int row=0;row<2;row++){
                TextView line=clockLines[row];if(line==null){line=new TextView(context);line.setIncludeFontPadding(false);line.setSingleLine(true);line.setEllipsize(null);
                    overlay.addView(line,new FrameLayout.LayoutParams(-2,-2));clockLines[row]=line;}
                String value=row<lines.length?lines[row]:"";
                if(!value.contentEquals(line.getText()))line.setText(value);
                if(line.getTypeface()!=clock.getTypeface())line.setTypeface(clock.getTypeface());
                if(line.getTextSize()!=clock.getTextSize())line.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,clock.getTextSize());
                if(line.getLetterSpacing()!=clock.getLetterSpacing())line.setLetterSpacing(clock.getLetterSpacing());
                if(line.getGravity()!=clock.getGravity())line.setGravity(clock.getGravity());
                if(line.getMinWidth()!=width)line.setMinWidth(width);
                if(line.getCurrentTextColor()!=clock.getCurrentTextColor())line.setTextColor(clock.getTextColors());
                boolean visible=visibleInRoot(clock)&&showItem("clock")&&!value.isEmpty();line.setVisibility(visible?View.VISIBLE:View.GONE);
                if(visible){add(nodes,views,"clock#"+row,line);line.setAlpha(original.alpha*overlayAlpha(root,clock));own(line).mark(line);}
            }
            return true;
        }
        void add(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,View view){
            StatusBarGridSpec.Item item=spec.get(baseId(id));if(view==null||item==null||!visibleInRoot(view))return;
            if(id.equals("battery")&&!positionOnly()&&!connectivityGroup()
                    &&!FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,true))item=StatusBarGridSpec.DEFAULT_BATTERY;
            Geometry state=own(view);if(!positionOnly()&&!item.visible){view.setAlpha(0);state.mark(view);return;}view.setAlpha(state.alpha);
            if(view instanceof TextView&&(metrics.containsKey(id)||baseId(id).equals("clock"))){
                TextView text=(TextView)view;
                // setMaxLines requests layout even when unchanged. Styling inside
                // OnPreDraw was scheduling another layout on every rendered frame.
                if(id.equals("clock")||text.isLayoutRequested()||text.getWidth()==0||text.getHeight()==0){
                    // The OEM clock is measured inside its original single-row
                    // parent. Measure the full custom text before grid scaling,
                    // otherwise extra line spacing clips the second row.
                    ViewGroup.LayoutParams params=text.getLayoutParams();
                    int fixedWidth=params==null?0:params.width;
                    // Treat a requested width as reserved space, never as a crop
                    // of the hour when an app changes the OEM clock allocation.
                    text.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                    if(fixedWidth>text.getMeasuredWidth())text.measure(View.MeasureSpec.makeMeasureSpec(fixedWidth,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                    // onPreDraw follows the parent's layout pass, so the clock
                    // can already report no pending layout despite being clipped.
                    // Repeated measure calls with identical specs are cached by View.
                    if(text.isLayoutRequested()||text.getWidth()!=text.getMeasuredWidth()||text.getHeight()!=text.getMeasuredHeight()){
                        text.layout(0,0,text.getMeasuredWidth(),text.getMeasuredHeight());
                        // This correction runs after the native layout pass.
                        // Refresh its display list as well: otherwise switching
                        // from two lines can leave a clipped clock until its next tick.
                        text.invalidate();
                    }
                    if(id.equals("clock"))text.scrollTo(0,0);
                }
            }
            float h=view.getHeight(),w=view.getWidth();if(h<=0||w<=0)return;
            float baseline=-1;
            if(!positionOnly()&&view instanceof TextView&&(metrics.containsKey(id)||baseId(id).equals("clock"))){
                TextView text=(TextView)view;String value=text.getText().toString();
                if(!value.isEmpty()&&!value.contains("\n")){
                    Rect ink=new Rect();text.getPaint().getTextBounds(value,0,value.length(),ink);
                    if(!ink.isEmpty()){ink.set(Math.min(0,ink.left),text.getBaseline()+ink.top,Math.max(view.getWidth(),ink.right),text.getBaseline()+ink.bottom);
                        contentBounds.put(view,ink);w=ink.width();h=ink.height();baseline=text.getBaseline()-ink.top;}
                }
            }
            if(id.equals("battery")&&view instanceof ViewGroup){Rect bounds=new Rect(batteryBounds(view));
                if(!bounds.isEmpty()){contentBounds.put(view,bounds);h=bounds.height();w=bounds.width();}}
            float scale=px(item.size)/h;
            if(view instanceof TextView){TextView t=(TextView)view;
                float targetSize=px(item.size);
                if(baseId(id).equals("clock")&&!positionOnly()&&FeatureSettings.enabled(context,FeatureSettings.STATUSBAR_CLOCK_CUSTOM)){
                    float customSize=FeatureSettings.decimal(context,FeatureSettings.STATUSBAR_CLOCK_SIZE_SP,0,0,40);
                    if(customSize>0)targetSize=android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,
                            customSize,context.getResources().getDisplayMetrics());
                }
                float lineHeight=t.getTextSize();if(lineHeight>0)scale=targetSize/lineHeight;
            }
            if(id.equals("battery")&&contentBounds.containsKey(view)){
                int fixed=!positionOnly()&&FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,true)
                        ?FeatureSettings.integer(context,"ls_augment_rm_battery_width_dp",0,0,120):0;
                if(fixed>0){
                    float reserved=px(fixed);scale=Math.min(scale,reserved/w);
                    Rect bounds=contentBounds.get(view);
                    bounds.right=bounds.left+(int)Math.ceil(reserved/scale);
                    w=bounds.width();
                }
            }
            String zone=positionOnly()?item.zone.substring(0,1)+"S":id.contains("#")?item.zone.substring(0,1)+(id.endsWith("#0")?"1":"2"):item.zone;
            // A multiline native clock is one view. Reserve both rows just as
            // the editor does, even when an old layout stores a single-row zone.
            if(id.equals("clock")&&!positionOnly()&&FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CLOCK_ROWS,2,1,2)==2)
                zone=item.zone.substring(0,1)+"S";
            nodes.add(new StatusBarGridLayout.Node(id,zone,item.order*100,w*scale,h*scale,baseline<0?-1:baseline*scale));views.put(id,view);
        }
        void addGroup(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,View parent,View... additionalParents){
            ArrayList<ViewGroup> sources=new ArrayList<>();
            if(parent instanceof ViewGroup&&visibleInRoot(parent))sources.add((ViewGroup)parent);
            for(View extra:additionalParents)if(extra instanceof ViewGroup&&visibleInRoot(extra)&&extra!=parent){
                // Some ROMs nest the vendor container inside statusIcons. Its
                // descendants must not be moved once as a group and again individually.
                boolean covered=false;
                for(ViewGroup source:sources)if(isDescendant(extra,source))covered=true;
                if(!covered)sources.add((ViewGroup)extra);
            }
            if(sources.isEmpty())return;
            if(parent==null)parent=sources.get(0);
            StatusBarGridSpec.Item item=spec.get(id);int n=0;
            int max=id.equals("notifications")?FeatureSettings.integer(context,ConfigSchema.STATUSBAR_NOTIFICATION_MAX,0,0,20):0;
            float size=px(item.size), width=0;ArrayList<View> children=new ArrayList<>();
            for(ViewGroup group:sources)for(int i=0;i<group.getChildCount();i++){
                View child=group.getChildAt(i);if(child.getVisibility()!=View.VISIBLE||child.getHeight()==0||child.getWidth()==0
                        ||RedMagicSystemUiHook.isCollapsedSignal(child))continue;
                Geometry g=own(child);
                if(id.equals("system_icons")&&usingConnectivityIcon()&&isConnectivity(child)){
                    child.setAlpha(0);g.mark(child);continue;
                }
                if (spec.get("network").visible && isNativeNetwork(child)) {
                    child.setAlpha(0); g.mark(child); continue;
                }
                // A native dot/hidden state must not be turned back into an icon.
                if(g.alpha==0)continue;
                child.setAlpha(g.alpha);Rect ink=iconBounds(child);if(ink.isEmpty())continue;contentBounds.put(child,ink);n++;
                if(!showItem(id)||(max>0&&n>max)){child.setAlpha(0);g.mark(child);continue;}
                float height=desiredIconHeight(child,size);iconHeights.put(child,height);
                if(RedMagicSystemUiHook.stackedSignalBounds(child)!=null){
                    String part=id+".dual"+n;Rect bounds=contentBounds.get(child);
                    nodes.add(new StatusBarGridLayout.Node(part,item.zone.substring(0,1)+"S",item.order*100+n,bounds.width()*height/bounds.height(),height));
                    views.put(part,child);continue;
                }
                children.add(child);
            }
            boolean rows=two(id);
            for(int row=0;row<(rows?2:1);row++){
                ArrayList<View> members=new ArrayList<>();width=0;float rowHeight=0;
                for(int i=row;i<children.size();i+=rows?2:1){View child=children.get(i);members.add(child);Rect bounds=contentBounds.get(child);float height=iconHeights.get(child);width+=bounds.width()*height/bounds.height()+px(1);rowHeight=Math.max(rowHeight,height);}
                if(members.isEmpty())continue;
                String part=rows?id+"#"+row:id;
                String zone=rows?item.zone.substring(0,1)+(row+1):item.zone;
                nodes.add(new StatusBarGridLayout.Node(part,zone,item.order*100,Math.max(1,width-px(1)),rowHeight));
                views.put(part,parent);groups.put(part,members);
            }
        }
        boolean isDescendant(View view,View ancestor){
            for(View current=view;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null)
                if(current==ancestor)return true;
            return false;
        }
        Rect iconBounds(View view){return StatusBarContentBounds.of(view);}
        boolean visibleInRoot(View view){
            for(View current=view;current!=null;){
                if(current.getVisibility()!=View.VISIBLE)return false;
                if(current==root)return true;
                current=current.getParent() instanceof View?(View)current.getParent():null;
            }return false;
        }
        void addCompanion(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,String style,View view,int offset,boolean followsVisibility){
            if(view==null||!visibleInRoot(view)||view.getWidth()<=0||view.getHeight()<=0)return;
            StatusBarGridSpec.Item item=spec.get(style);Geometry nativeGeometry=own(view);
            if(followsVisibility&&!showItem(style)){view.setAlpha(0);nativeGeometry.mark(view);return;}
            view.setAlpha(nativeGeometry.alpha);if(nativeGeometry.alpha==0)return;
            Rect bounds=iconBounds(view);
            if(bounds.isEmpty())return;
            // CarrierText fills the remaining keyguard width. Reserve the text
            // actually displayed, not that empty layout allocation.
            if(view instanceof TextView){TextView text=(TextView)view;android.text.Layout layout=text.getLayout();
                if(layout!=null&&layout.getLineCount()>0){float right=0;for(int i=0;i<layout.getLineCount();i++)right=Math.max(right,layout.getLineRight(i));
                    int left=text.getTotalPaddingLeft(),top=text.getTotalPaddingTop();
                    if(right>0)bounds.set(left,top,left+Math.min(view.getWidth(),(int)Math.ceil(right)),top+layout.getHeight());}}
            contentBounds.put(view,bounds);
            float height=px(item.size);
            if(positionOnly()&&(id.equals("system_icons")||id.equals("notifications")))height*=bounds.height()/nativeIconHeight(view,px(item.size));
            float width=bounds.width()*height/Math.max(1,bounds.height());
            nodes.add(new StatusBarGridLayout.Node(id,positionOnly()?item.zone.substring(0,1)+"S":item.zone,item.order*100+offset,width,height));views.put(id,view);
        }
        final Map<String,List<View>> groups=new HashMap<>();
        final Map<View,Float> iconHeights=new IdentityHashMap<>();
        boolean isNativeNetwork(View view){String slot=SystemUiHook.slotOf(view),type=view.getClass().getSimpleName().toLowerCase(Locale.ROOT);
            return "NET_SPEED".equalsIgnoreCase(slot)||type.contains("netspeed")||type.contains("networkspeed");}
        boolean isConnectivity(View view){String slot=SystemUiHook.slotOf(view),type=view.getClass().getSimpleName().toLowerCase(Locale.ROOT);
            // Vendor containers and icons being rebound can legitimately have no slot.
            return "wifi".equalsIgnoreCase(slot)||"mobile".equalsIgnoreCase(slot)||type.contains("statusbarwifi")||type.contains("statusbarmobile");}
        TextView firstText(View view){if(view instanceof TextView)return (TextView)view;
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView found=firstText(((ViewGroup)view).getChildAt(i));if(found!=null)return found;}return null;}
        float desiredIconHeight(View view,float size){Rect bounds=contentBounds.get(view);
            float row=RedMagicSystemUiHook.stackedSignalRowHeight(view);
            if(row>0)return size*bounds.height()/row;
            int sp=FeatureSettings.integer(context,ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP,0,0,32);
            TextView text=isNativeNetwork(view)?firstText(view):null;
            if(sp>0&&text!=null&&text.getTextSize()>0)return bounds.height()*android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,sp,context.getResources().getDisplayMetrics())/text.getTextSize();
            return size;}
        float nativeIconHeight(View view,float fallback){float height=0;
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View child=((ViewGroup)view).getChildAt(i);
                if(child.getVisibility()==View.VISIBLE&&child.getAlpha()>0&&!isNativeNetwork(child))height=Math.max(height,iconBounds(child).height());}
            return height>0?height:Math.max(1,fallback);}
        void applyNativeNetworkSize(View parent){if(!(parent instanceof ViewGroup))return;
            int sp=FeatureSettings.integer(context,ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP,0,0,32);if(sp==0)return;
            ViewGroup group=(ViewGroup)parent;
            float groupScale=px(spec.get("system_icons").size)/nativeIconHeight(parent,px(spec.get("system_icons").size));
            // Preserve native order and row membership while reserving any
            // extra width. Compensate for the later whole-group transform.
            Map<View,Float> expansions=new IdentityHashMap<>();
            for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);Geometry g=own(child);
                child.setTranslationX(g.x);child.setScaleX(g.sx);child.setScaleY(g.sy);
                if(!isNativeNetwork(child)||child.getVisibility()!=View.VISIBLE||g.alpha==0||child.getTransitionAlpha()==0)continue;
                TextView text=firstText(child);if(text==null||text.getTextSize()<=0)continue;
                Rect bounds=iconBounds(child);if(bounds.isEmpty())continue;
                float ratio=android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,sp,context.getResources().getDisplayMetrics())/text.getTextSize()/groupScale;
                child.setScaleX(ratio);child.setScaleY(ratio);
                child.setTranslationX(g.x+(bounds.left-child.getPivotX())*(g.sx-ratio));
                expansions.put(child,Math.max(0,bounds.width()*(ratio-g.sx)));
            }
            for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);float shift=0;
                Geometry childNative=geometry.get(child);
                Rect childInk=iconBounds(child);
                float childLeft=child.getLeft()+childNative.x+child.getPivotX()
                        +(childInk.left-child.getPivotX())*childNative.sx;
                for(Map.Entry<View,Float> entry:expansions.entrySet()){
                    View network=entry.getKey();Geometry networkNative=geometry.get(network);
                    float networkRight=network.getLeft()+networkNative.x+network.getPivotX()
                            +(iconBounds(network).right-network.getPivotX())*networkNative.sx;
                    if(child!=network&&childLeft>=networkRight-.001f)shift+=entry.getValue();
                }
                child.setTranslationX(child.getTranslationX()+shift);geometry.get(child).mark(child);
            }}
        void addConnectivity(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,View battery){
            if(battery!=null){Geometry original=own(battery);battery.setAlpha(0);original.mark(battery);}
            int size=px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE,26,18,40));
            if(connectivityIcon.getWidth()!=size||connectivityIcon.getHeight()!=size){
                connectivityIcon.measure(View.MeasureSpec.makeMeasureSpec(size,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(size,View.MeasureSpec.EXACTLY));
                connectivityIcon.layout(0,0,size,size);}
            StatusBarGridSpec.Item item=spec.get("battery");String id="battery.connectivity";
            nodes.add(new StatusBarGridLayout.Node(id,item.zone.substring(0,1)+"S",item.order*100,size,size));
            contentBounds.put(connectivityIcon,new Rect(0,0,size,size));views.put(id,connectivityIcon);}
        Rect batteryBounds(View view){
            long now=SystemClock.elapsedRealtime();int w=view.getWidth(),h=view.getHeight();
            if(batteryInk!=null&&batteryInkWidth==w&&batteryInkHeight==h&&now-batteryInkAt<1000)return batteryInk;
            int padding=px(12),bw=w+padding*2,bh=h+padding*2;
            Rect result=new Rect(0,0,w,h);
            if(bw>0&&bh>0&&bw<=768&&bh<=768)try{
                if(batteryBitmap==null||batteryBitmap.getWidth()!=bw||batteryBitmap.getHeight()!=bh){
                    if(batteryBitmap!=null)batteryBitmap.recycle();
                    batteryBitmap=android.graphics.Bitmap.createBitmap(bw,bh,android.graphics.Bitmap.Config.ARGB_8888);batteryPixels=new int[bw*bh];}
                batteryBitmap.eraseColor(android.graphics.Color.TRANSPARENT);
                android.graphics.Canvas canvas=new android.graphics.Canvas(batteryBitmap);canvas.translate(padding,padding);
                // Native percentage labels and vectors contain large transparent padding.
                // Measure their actual drawing, without changing any native child layout.
                view.draw(canvas);batteryBitmap.getPixels(batteryPixels,0,bw,0,0,bw,bh);
                int left=bw,top=bh,right=0,bottom=0;
                for(int y=0;y<bh;y++)for(int x=0;x<bw;x++)if((batteryPixels[y*bw+x]>>>24)>16){
                    left=Math.min(left,x);top=Math.min(top,y);right=Math.max(right,x+1);bottom=Math.max(bottom,y+1);}
                if(right>left&&bottom>top)result.set(left-padding,top-padding,right-padding,bottom-padding);
            }catch(RuntimeException ignored){ }
            batteryInk=result;batteryInkAt=now;batteryInkWidth=w;batteryInkHeight=h;return result;
        }
        void place(String id,View view,StatusBarGridLayout.Box box){if(view==null)return;
            List<View> children=groups.get(id);
            if(children!=null){float x=box.x,gap=px(1)*box.scale;
                for(View child:children){Rect bounds=contentBounds.get(child);float h=iconHeights.get(child)*box.scale,w=bounds.width()*h/Math.max(1,bounds.height());
                    move(child,x,box.y+(box.height-h)/2,w,h);x+=w+gap;}return;
            }
            move(view,box.x,box.y,box.width,box.height);
        }
        void move(View v,float x,float y,float width,float height){Geometry g=own(v);
            Rect bounds=contentBounds.get(v);
            // Keep subpixel precision. Integer window coordinates fed their
            // rounding error back into translation and made static text oscillate.
            Matrix parentToRoot=new Matrix();View child=v;
            while(child!=root&&child.getParent() instanceof View){
                View parent=(View)child.getParent();
                parentToRoot.postTranslate(child.getLeft()-parent.getScrollX(),child.getTop()-parent.getScrollY());
                if(parent==root)break;
                parentToRoot.postConcat(parent.getMatrix());child=parent;
            }
            Matrix rootToParent=new Matrix();
            if(parentToRoot.invert(rootToParent)){
                float[] axes={1,0,0,1};parentToRoot.mapVectors(axes);
                float parentSx=(float)Math.hypot(axes[0],axes[1]),parentSy=(float)Math.hypot(axes[2],axes[3]);
                if(parentSx<.001f||parentSy<.001f)return;
                float sx=ls.augment.com.StatusBarTransform.scale(width,bounds==null?v.getWidth():bounds.width(),parentSx);
                float sy=ls.augment.com.StatusBarTransform.scale(height,bounds==null?v.getHeight():bounds.height(),parentSy);
                v.setScaleX(sx);v.setScaleY(sy);
                float[] target={x,y};rootToParent.mapPoints(target);
                float tx=ls.augment.com.StatusBarTransform.translation(target[0],bounds==null?0:bounds.left,v.getPivotX(),sx);
                float ty=ls.augment.com.StatusBarTransform.translation(target[1],bounds==null?0:bounds.top,v.getPivotY(),sy);
                if(v.getRotation()!=0||v.getRotationX()!=0||v.getRotationY()!=0){
                    // Animated vendor icons can rotate independently of their
                    // container. Keep that native transform when aligning the origin.
                    float[] origin={bounds==null?0:bounds.left,bounds==null?0:bounds.top};v.getMatrix().mapPoints(origin);
                    tx=target[0]-(origin[0]-v.getTranslationX());ty=target[1]-(origin[1]-v.getTranslationY());
                }
                if(Math.abs(tx-v.getTranslationX())>.001f){v.setTranslationX(tx);positionWrites++;}
                if(Math.abs(ty-v.getTranslationY())>.001f){v.setTranslationY(ty);positionWrites++;}
            }
            g.mark(v);ViewParent parent=v.getParent();while(parent instanceof ViewGroup){ViewGroup p=(ViewGroup)parent;
                if(!clips.containsKey(p))clips.put(p,new boolean[]{p.getClipChildren(),p.getClipToPadding()});p.setClipChildren(false);p.setClipToPadding(false);if(p==root)break;parent=p.getParent();}
        }
        void startMetrics(){stopMetrics();if(positionOnly())return;boolean needsClock=isKeyguard(root)&&findView(root,"clock","status_bar_clock")==null;
            boolean needed=false;for(int i=4;i<StatusBarGridSpec.IDS.length;i++)if(spec.get(StatusBarGridSpec.IDS[i]).visible)needed=true;
            if(!needed&&!needsClock&&!splitClock())return;overlay=new FrameLayout(context);overlay.setClipChildren(false);overlay.setClickable(false);
            overlay.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            root.addView(overlay,new ViewGroup.LayoutParams(-1,-1));
            if(needsClock){keyguardClock=new TextView(context);keyguardClock.setTag(SystemUiHook.GRID_CLOCK_TAG);
                keyguardClock.setTextSize(14);keyguardClock.setTextColor(android.graphics.Color.WHITE);
                overlay.addView(keyguardClock,new FrameLayout.LayoutParams(-2,-2));SystemUiHook.refreshGridClock(root);}
            if(!needed)return;
            for(int i=4;i<StatusBarGridSpec.IDS.length;i++){String id=StatusBarGridSpec.IDS[i];if(!spec.get(id).visible)continue;
                int rows=id.equals("network")&&networkMode()==4?2:1;
                for(int row=0;row<rows;row++){
                    TextView view=new TextView(context);view.setIncludeFontPadding(false);view.setGravity(Gravity.CENTER);view.setText("—");
                    view.setTextSize(spec.get(id).size);view.setSingleLine(true);view.setEllipsize(null);
                    overlay.addView(view,new FrameLayout.LayoutParams(-2,-2));metrics.put(rows==2?id+"#"+row:id,view);
                }}
            previousRx=previousTx=-1;previousTime=0;
            thread=new HandlerThread("LS-status-metrics",android.os.Process.THREAD_PRIORITY_BACKGROUND);thread.start();
            final Handler sessionWorker=new Handler(thread.getLooper());worker=sessionWorker;
            final long generation=metricsGeneration;
            sessionWorker.post(new Runnable(){
            long previousRx=-1,previousTx=-1,previousTime;
            public void run(){
            if(worker!=sessionWorker||metricsGeneration!=generation)return;Map<String,String> values=new LinkedHashMap<>();
            PowerManager powerManager=(PowerManager)context.getSystemService(Context.POWER_SERVICE);
            if(powerManager!=null&&!powerManager.isInteractive()){sessionWorker.postDelayed(this,2000);return;}
            if(spec.get("cpu").visible||spec.get("gpu").visible){
                Bundle sample=null;
                try{sample=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"hardware_telemetry",null,null);}catch(Exception ignored){}
                for(String kind:new String[]{"cpu","gpu"}){
                    double degrees=sample==null?Double.NaN:sample.getDouble(kind,Double.NaN);
                    values.put(kind,Double.isFinite(degrees)?temperatureLabel(kind)+metricNumber(kind,degrees)+"°":temperature(kind));
                }
            }
            Long temp=readLong("/sys/class/power_supply/battery/temp");values.put("battery_temp",temp==null?"B:—":"B:"+metricNumber("battery_temp",temp/10d)+"°");
            Long current=readLong("/sys/class/power_supply/battery/current_now"),voltage=readLong("/sys/class/power_supply/battery/voltage_now");
            values.put("current",current==null?"I:—":"I:"+metricNumber("current",current/1000d)+"mA");
            values.put("power",current==null||voltage==null?"P:—":"P:"+metricNumber("power",Math.abs(current.doubleValue()*voltage/1e12))+"W");
            if(FeatureSettings.enabled(context,"ls_augment_rm_metrics_custom")) {
                boolean units=FeatureSettings.enabled(context,"ls_augment_rm_metrics_hide_units");
                boolean chargingOnly=FeatureSettings.enabled(context,"ls_augment_rm_metrics_charging_only");
                String batteryStatus=read("/sys/class/power_supply/battery/status");
                boolean charging=batteryStatus.equalsIgnoreCase("Charging")||batteryStatus.equalsIgnoreCase("Full");
                for(String kind:new String[]{"cpu","gpu","battery_temp","current","power"}) {
                    String value=values.get(kind);if(value==null)continue;
                    int colon=value.indexOf(':');String fallback=colon>=0?value.substring(0,colon+1):"";
                    String numeric=colon>=0?value.substring(colon+1):value;
                    if(units)numeric=numeric.replace("mA","").replace("W","").replace("°","");
                    String prefix=FeatureSettings.text(context,"ls_augment_rm_metric_prefix_"+kind,fallback);
                    values.put(kind,chargingOnly&&!charging&&(kind.equals("current")||kind.equals("power"))?"":prefix+numeric);
                }
            }
            long rx=TrafficStats.getTotalRxBytes(),tx=TrafficStats.getTotalTxBytes(),now=SystemClock.elapsedRealtime();
            long down=previousRx<0||rx<previousRx||now<=previousTime?0:(rx-previousRx)*1000/(now-previousTime);
            long up=previousTx<0||tx<previousTx||now<=previousTime?0:(tx-previousTx)*1000/(now-previousTime);
            previousRx=rx;previousTx=tx;previousTime=now;
            String uploadMark=FeatureSettings.text(context,ConfigSchema.STATUSBAR_NETWORK_UPLOAD_MARK,"↑");
            String downloadMark=FeatureSettings.text(context,ConfigSchema.STATUSBAR_NETWORK_DOWNLOAD_MARK,"↓");
            values.put("network",ls.augment.com.StatusBarNetworkDisplay.format(networkMode(),rate(up),rate(down),uploadMark,downloadMark));
            if(FeatureSettings.enabled(context,"ls_augment_rm_network_custom")) {
                int threshold=FeatureSettings.integer(context,"ls_augment_rm_network_hide_below_kb",0,0,10240);
                int digits=FeatureSettings.integer(context,"ls_augment_rm_network_digits",3,1,5);
                int unit=FeatureSettings.integer(context,"ls_augment_rm_network_unit",0,0,2);
                boolean suffix=FeatureSettings.enabled(context,"ls_augment_rm_network_per_second");
                values.put("network",ls.augment.com.SystemUiPolicy.hideNetwork(up,down,threshold)?"":
                    ls.augment.com.StatusBarNetworkDisplay.format(networkMode(),ls.augment.com.SystemUiPolicy.networkRate(up,digits,unit,suffix),ls.augment.com.SystemUiPolicy.networkRate(down,digits,unit,suffix),uploadMark,downloadMark));
            }
            main.post(()->{if(!active||metricsGeneration!=generation)return;for(Map.Entry<String,TextView> e:metrics.entrySet()){
                String value=values.get(baseId(e.getKey()));
                if(value!=null&&e.getKey().contains("#")){String[] lines=value.split("\n",-1);int row=e.getKey().endsWith("#0")?0:1;value=row<lines.length?lines[row]:"";}
                if(value!=null&&!value.contentEquals(e.getValue().getText()))e.getValue().setText(value);
                String kind=baseId(e.getKey());
                boolean custom=FeatureSettings.enabled(context,"ls_augment_rm_"+(kind.equals("network")?"network_custom":"metrics_custom"));
                int width=custom?FeatureSettings.integer(context,kind.equals("network")?"ls_augment_rm_network_width_dp":"ls_augment_rm_metric_width_"+kind,0,0,180):0;
                int desired=width>0?px(width):ViewGroup.LayoutParams.WRAP_CONTENT;
                ViewGroup.LayoutParams params=e.getValue().getLayoutParams();
                if(params!=null&&params.width!=desired){params.width=desired;e.getValue().setLayoutParams(params);}
            }});
            if(worker==sessionWorker&&metricsGeneration==generation)sessionWorker.postDelayed(this,1000);
        }});
        }
        final Map<String,String> thermalPaths=new HashMap<>();
        String temperature(String kind){String path=thermalPaths.get(kind);if(path==null){File[] zones=new File("/sys/class/thermal").listFiles();if(zones!=null)for(File zone:zones){String type=read(new File(zone,"type").getPath()).toLowerCase(Locale.ROOT);
                if(type.contains(kind)){path=new File(zone,"temp").getPath();thermalPaths.put(kind,path);break;}}}
            Long value=path==null?null:readLong(path);double c=value==null?Double.NaN:Math.abs(value)>300?value/1000d:value;
            return temperatureLabel(kind)+ (Double.isFinite(c)&&c>-20&&c<150?metricNumber(kind,c)+"°":"—");}
        String metricNumber(String kind,double value){int fallback=kind.equals("battery_temp")||kind.equals("power")?1:0;
            return StatusBarMetricsFormatter.number(value,FeatureSettings.integer(context,"ls_augment_statusbar_"+kind+"_decimals",fallback,0,3));}
        int networkMode(){return ls.augment.com.StatusBarNetworkDisplay.resolve(FeatureSettings.text(context,ConfigSchema.STATUSBAR_NETWORK_DISPLAY,"0"),FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,true));}
        String temperatureLabel(String kind){return "gpu".equals(kind)?"G:":"C:";}
        String rate(long value){return value>=1024*1024?String.format(Locale.ROOT,"%.1fM",value/1048576d):String.format(Locale.ROOT,"%.0fK",value/1024d);}
        void stopMetrics(){metricsGeneration++;Handler h=worker;worker=null;if(h!=null)h.removeCallbacksAndMessages(null);if(thread!=null){thread.quitSafely();thread=null;}
            if(keyguardClock!=null){SystemUiHook.releaseGridClock(keyguardClock);keyguardClock=null;}
            if(overlay!=null){root.removeView(overlay);overlay=null;}metrics.clear();Arrays.fill(clockLines,null);}
        void restore(){for(Map.Entry<View,Geometry> e:geometry.entrySet())e.getValue().restore(e.getKey());geometry.clear();groups.clear();
            if(connectivityIcon!=null){connectivityIcon.close();root.removeView(connectivityIcon);connectivityIcon=null;}
            for(Map.Entry<ViewGroup,boolean[]> e:clips.entrySet()){e.getKey().setClipChildren(e.getValue()[0]);e.getKey().setClipToPadding(e.getValue()[1]);}clips.clear();}
        void detach(){attached=false;active=false;main.removeCallbacksAndMessages(null);stopMetrics();restore();
            if(batteryBitmap!=null){batteryBitmap.recycle();batteryBitmap=null;batteryPixels=null;}batteryInk=null;
            if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(draw);
            FeatureSettings.removeSnapshotListener(snapshotListener);
        }
    }
    private static String read(String path){try(BufferedReader r=new BufferedReader(new FileReader(path))){String s=r.readLine();return s==null?"":s.trim();}catch(Exception e){return "";}}
    private static String baseId(String id){int split=id.indexOf('#');return split<0?id:id.substring(0,split);}
    private static Long readLong(String path){try{return Long.parseLong(read(path));}catch(Exception e){return null;}}
}
