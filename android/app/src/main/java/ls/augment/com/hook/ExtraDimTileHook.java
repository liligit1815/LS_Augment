package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Uses the same OEM QSDetail host and opening path as CoolingFanTile. */
final class ExtraDimTileHook {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ExecutorService IO=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"LSA-DimDetail");t.setDaemon(true);return t;});
    private static final Uri URI=Uri.parse("content://ls.augment.com.config");
    private static final Map<Object,Detail> DETAILS=new WeakHashMap<>();
    private static final Map<Object,Boolean> LAYOUTS=java.util.Collections.synchronizedMap(new WeakHashMap<>());
    private static boolean installed;

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static int install(AugmentModule module,ClassLoader loader) {
        if(installed)return 0;
        try {
            Class<?> custom=Class.forName("com.android.systemui.qs.external.CustomTile",false,loader);
            Class<?> base=Class.forName("com.android.systemui.qs.tileimpl.QSTileImpl",false,loader);
            Class<?> adapter=Class.forName("com.android.systemui.plugins.qs.DetailAdapter",false,loader);
            Method component=custom.getMethod("getComponent");
            Method show=base.getMethod("showDetail",boolean.class);
            Method toggle=base.getMethod("fireToggleStateChanged",boolean.class);
            Method get=base.getDeclaredMethod("getDetailAdapter");
            Method longClick=base.getDeclaredMethod("handleLongClick",Class.forName("com.android.systemui.animation.Expandable",false,loader));
            module.registerFeatureHook(module.prepareFeatureHook(get,"extra_dim.detail_adapter",false).intercept(chain->{
                Object tile=chain.getThisObject();
                if(!matches(tile,custom,component))return chain.proceed();
                return detail(tile,adapter,toggle).adapter;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(longClick,"extra_dim.long_click",true).intercept(chain->{
                Object tile=chain.getThisObject();
                if(!matches(tile,custom,component))return chain.proceed();
                MAIN.post(()->{
                    try {detail(tile,adapter,toggle);show.invoke(tile,true);}
                    catch(ReflectiveOperationException error){module.logFeatureError("EXTRA_DIM_DETAIL_OPEN",error);}
                });
                return null;
            }));
            Class<?> layout=Class.forName("com.zte.feature.qs.layout.QsDetailModule",false,loader);
            Method choose=layout.getDeclaredMethod("handleShowDetailTile",Class.forName("com.android.systemui.plugins.qs.QSTile",false,loader),boolean.class,boolean.class,boolean.class);
            Method measure=layout.getDeclaredMethod("updateDetailContainerLayout",android.view.ViewGroup.LayoutParams.class,View.class);
            module.registerFeatureHook(module.prepareFeatureHook(choose,"extra_dim.detail_layout_kind",true).intercept(chain->{
                if(Boolean.TRUE.equals(chain.getArg(1)))LAYOUTS.put(chain.getThisObject(),matches(chain.getArg(0),custom,component));
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(measure,"extra_dim.detail_height",false).intercept(chain->{
                Object result=chain.proceed();
                if(Boolean.TRUE.equals(LAYOUTS.get(chain.getThisObject())))
                    ((android.view.ViewGroup.LayoutParams)chain.getArg(0)).height=android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
                return result;
            }));
            installed=true;return 4;
        }catch(Throwable error){module.logFeatureError("EXTRA_DIM_TILE_INSTALL",error);return 0;}
    }
    private static boolean matches(Object tile,Class<?> custom,Method method) throws ReflectiveOperationException {
        if(!custom.isInstance(tile))return false;
        ComponentName c=(ComponentName)method.invoke(tile);
        return c!=null && c.getPackageName().equals("ls.augment.com") && c.getClassName().equals("ls.augment.com.ExtraDimTileService");
    }
    private static synchronized Detail detail(Object tile,Class<?> type,Method toggle) {
        Detail current=DETAILS.get(tile);
        if(current==null){current=new Detail(tile,type,toggle);DETAILS.put(tile,current);}return current;
    }
    private static final class Detail {
        final WeakReference<Object> tile;
        final Method toggle;
        final Object adapter;
        Panel panel;
        boolean active,ready,sending;
        int strength=50;
        String message="";
        Detail(Object tile,Class<?> type,Method toggle) {
            this.tile=new WeakReference<>(tile);this.toggle=toggle;
            adapter=Proxy.newProxyInstance(type.getClassLoader(),new Class<?>[]{type},(proxy,method,args)->{
                switch(method.getName()) {
                    case "getTitle":return "极暗";
                    case "getMetricsCategory":return 2038401;
                    case "getToggleState":return Boolean.valueOf(active);
                    case "getToggleEnabled":return ready||active;
                    case "getSettingsIntent":return null;
                    case "getSettingsText":return 0;
                    case "shouldAnimate":return true;
                    case "hideDetail":return null;
                    case "createDetailView":
                        panel=new Panel((Context)args[0],this);return panel;
                    case "setToggleState":
                        if(panel!=null && (ready||active&&!((Boolean)args[0])))panel.select((Boolean)args[0],strength);return null;
                    case "toString":return "ExtraDimDetailAdapter";
                    case "hashCode":return System.identityHashCode(proxy);
                    case "equals":return proxy==args[0];
                    default:return null;
                }
            });
        }
        void refreshToggle() {
            Object owner=tile.get();if(owner==null)return;
            try {toggle.invoke(owner,active);}catch(ReflectiveOperationException ignored){ }
        }
    }
    private static final class Panel extends LinearLayout implements View.OnAttachStateChangeListener {
        final Detail detail;
        final SeekBar slider;
        final TextView value,status;
        final Runnable save=this::send;
        final Runnable poll=this::read;
        boolean dragging,reading,attached;
        int revision,pendingLevel=-1;
        boolean pendingActive;
        int foreground,accent;

        // Physical screen/driver/stock-layout coordinates, not logical reading order; changing LEFT/RIGHT would change geometry.
        //noinspection RtlHardcoded
        Panel(Context context,Detail detail) {
            super(context);this.detail=detail;setOrientation(VERTICAL);setPadding(dp(24),dp(6),dp(24),dp(24));
            setLayoutParams(new android.view.ViewGroup.LayoutParams(-1,-2));
            android.util.TypedValue color=new android.util.TypedValue();
            context.getTheme().resolveAttribute(android.R.attr.textColorPrimary,color,true);
            foreground=color.resourceId!=0?context.getColorStateList(color.resourceId).getDefaultColor():color.data;
            accent=0xff7b70ff;
            LinearLayout row=new LinearLayout(context);row.setGravity(Gravity.CENTER_VERTICAL);
            TextView title=text("极暗强度",16);row.addView(title,new LayoutParams(0,dp(44),1));title.setGravity(Gravity.CENTER_VERTICAL);
            value=text("50%",16);value.setTextColor(accent);row.addView(value,new LayoutParams(-2,-2));addView(row);
            slider=new SeekBar(context);slider.setMax(100);slider.setContentDescription("极暗强度");
            slider.setPadding(dp(10),0,dp(10),0);slider.setSplitTrack(false);
            GradientDrawable track=new GradientDrawable();track.setColor(0x337b70ff);track.setCornerRadius(dp(3));
            GradientDrawable fill=new GradientDrawable();fill.setColor(accent);fill.setCornerRadius(dp(3));
            LayerDrawable progress=new LayerDrawable(new android.graphics.drawable.Drawable[]{track,new ClipDrawable(fill,Gravity.LEFT,ClipDrawable.HORIZONTAL)});
            progress.setId(0,android.R.id.background);progress.setId(1,android.R.id.progress);
            for(int i=0;i<2;i++){progress.setLayerHeight(i,dp(5));progress.setLayerGravity(i,Gravity.CENTER_VERTICAL|Gravity.FILL_HORIZONTAL);}
            slider.setProgressDrawable(progress);
            GradientDrawable thumb=new GradientDrawable();thumb.setShape(GradientDrawable.OVAL);thumb.setColor(accent);thumb.setSize(dp(20),dp(20));
            slider.setThumb(thumb);slider.setThumbOffset(dp(10));slider.setThumbTintList(ColorStateList.valueOf(accent));
            addView(slider,new LayoutParams(-1,dp(48)));
            LinearLayout ends=new LinearLayout(context);
            TextView less=text("较亮",12),more=text("更暗",12);less.setAlpha(.6f);more.setAlpha(.6f);more.setGravity(Gravity.END);
            ends.addView(less,new LayoutParams(0,-2,1));ends.addView(more,new LayoutParams(0,-2,1));addView(ends);
            status=text("正在读取…",13);status.setAlpha(.65f);status.setPadding(0,dp(18),0,0);addView(status,new LayoutParams(-1,-2));
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
                public void onStartTrackingTouch(SeekBar bar){dragging=true;}

                // Injected host view uses the host Resources; module R IDs are invalid there. Preserve these short built-in Chinese labels.
                //noinspection SetTextI18n
                public void onProgressChanged(SeekBar bar,int level,boolean user){
                    value.setText(level+"%");bar.setStateDescription(level+"%");
                    if(user)select(true,level);
                }
                public void onStopTrackingTouch(SeekBar bar){dragging=false;MAIN.removeCallbacks(save);send();}
            });
            addOnAttachStateChangeListener(this);render();
        }
        int dp(int n){return Math.round(n*getResources().getDisplayMetrics().density);}
        TextView text(String s,int size){TextView t=new TextView(getContext());t.setText(s);t.setTextSize(size);t.setTextColor(foreground);return t;}
        void render(){
            slider.setEnabled(detail.ready);
            if(!dragging && pendingLevel<0)slider.setProgress(detail.strength);
            status.setText(detail.message.isEmpty()?(detail.ready?"":"正在读取…"):detail.message);
            status.setVisibility(detail.ready&&detail.message.isEmpty() ? View.GONE : View.VISIBLE);
            detail.refreshToggle();
        }
        public void onViewAttachedToWindow(View v){attached=true;MAIN.post(poll);}
        public void onViewDetachedFromWindow(View v){attached=false;MAIN.removeCallbacks(poll);MAIN.removeCallbacks(save);if(pendingLevel>=0)send();}
        void select(boolean on,int level){
            revision++;pendingActive=on;pendingLevel=level;detail.active=on;detail.strength=level;
            render();MAIN.removeCallbacks(save);MAIN.postDelayed(save,120);
        }
        void send(){
            if(pendingLevel<0)return;
            if(detail.sending){MAIN.removeCallbacks(save);MAIN.postDelayed(save,120);return;}
            final int current=revision,level=pendingLevel;final boolean on=pendingActive;
            pendingLevel=-1;detail.sending=true;
            IO.execute(()->{
                Bundle args=new Bundle();args.putBoolean("active",on);args.putInt("strength",level);
                Bundle result=call("extra_dim_select",args);
                MAIN.post(()->{
                    detail.sending=false;
                    if(current==revision){accept(result);if(result==null){status.setText("无法读取极暗执行反馈");status.setVisibility(View.VISIBLE);}}
                    if(pendingLevel>=0)send();
                });
            });
        }
        void read(){
            if(!attached)return;
            if(reading||detail.sending||dragging||pendingLevel>=0){schedule();return;}
            reading=true;final int current=revision;
            IO.execute(()->{Bundle result=call("extra_dim_read",null);MAIN.post(()->{
                reading=false;if(!attached)return;
                if(current==revision){accept(result);}
                schedule();
            });});
        }
        void accept(Bundle result){
            detail.ready=result!=null&&result.getBoolean("ready",result.getBoolean("ok"));
            detail.message=result==null?"无法读取极暗执行反馈":result.getString("message","");
            if(result!=null){detail.active=result.getBoolean("active");detail.strength=result.getInt("strength",50);}
            render();
        }
        void schedule(){MAIN.removeCallbacks(poll);if(attached)MAIN.postDelayed(poll,1200);}
        Bundle call(String method,Bundle args){try{return getContext().getContentResolver().call(URI,method,null,args);}catch(RuntimeException unavailable){return null;}}
    }
}
