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
    static int install(AugmentModule module, ClassLoader loader) {
        int count=0;
        try {
            Class<?> type=Class.forName(ROOT,false,loader);
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
                for(ViewParent p=view.getParent();p!=null;p=p.getParent())if(p.getClass().getName().equals(ROOT)){phone=true;break;}
                int limit=FeatureSettings.integer(view.getContext(),ConfigSchema.STATUSBAR_NOTIFICATION_MAX,0,0,20);
                if(!phone||limit==0||!FeatureSettings.enabled(view.getContext(),ConfigSchema.SYSTEMUI_MASTER))return chain.proceed();
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
        final Map<String,String> metricValues=new LinkedHashMap<>();
        final Map<View,Rect> contentBounds=new IdentityHashMap<>();
        android.graphics.Bitmap batteryBitmap;int[] batteryPixels;Rect batteryInk;long batteryInkAt;int batteryInkWidth,batteryInkHeight;
        final ContentObserver observer;
        final ViewTreeObserver.OnPreDrawListener draw=()->{layout();return true;};
        HandlerThread thread; volatile Handler worker; volatile long metricsGeneration;
        FrameLayout overlay; boolean attached,active,applying;
        StatusBarGridSpec spec=StatusBarGridSpec.defaults(); int nativeHeight=Integer.MIN_VALUE;
        long previousRx=-1,previousTx=-1,previousTime,lastWitness,layoutFrames,positionWrites; String lastRaw="",lastConfig="";
        State(ViewGroup root){this.root=root;context=root.getContext();observer=new ContentObserver(main){
            @Override public void onChange(boolean selfChange){refresh();}
            @Override public void onChange(boolean selfChange,Uri uri){refresh();}
        };}
        void attach(){if(attached)return;attached=true;
            if(root.getLayoutParams()!=null)nativeHeight=root.getLayoutParams().height;
            root.getViewTreeObserver().addOnPreDrawListener(draw);
            try{context.getContentResolver().registerContentObserver(Uri.parse("content://ls.augment.com.config/config"),true,observer);}catch(Throwable ignored){}
            main.post(this::refresh);
        }
        void refresh(){if(!attached)return;
            FeatureSettings.invalidateSnapshot();
            boolean enabled=FeatureSettings.enabled(context,ConfigSchema.SYSTEMUI_MASTER);
            String raw=FeatureSettings.text(context,ConfigSchema.STATUSBAR_GRID,"");
            StatusBarGridSpec parsed=StatusBarGridSpec.parse(raw);if(parsed==null)return;
            StringBuilder config=new StringBuilder().append(enabled);
            ls.augment.com.ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
            for(String key:ConfigSchema.keys())if(key.startsWith("ls_augment_statusbar_"))config.append('|').append(key).append('=').append(snapshot.get(key));
            if(lastConfig.equals(config.toString()))return;
            lastConfig=config.toString();
            restore(); spec=parsed;lastRaw=raw;active=enabled;
            if(!enabled){stopMetrics();
                // Recompute OEM content padding as well as the root height. Its
                // top inset may have been calculated during a previous layout.
                try{TargetReflection.call(root,"updateResources");}catch(Exception ignored){}
                applyHeight(0);SystemUiHook.refreshGridClock(root);
                FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"0");
                FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,"grid_v2;restored_native=1");
                root.requestLayout(); return;}
            applyHeight(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_HEIGHT_DP,0,0,80));
            SystemUiHook.refreshGridClock(root); startMetrics();root.requestLayout();root.invalidate();
        }
        void applyHeight(int dp){ViewGroup.LayoutParams p=root.getLayoutParams();if(p==null)return;
            // A view inflated during an enabled boot/rotation can already have our
            // enlarged height. Query the unmodified dimension instead of restoring it.
            int original=StatusBarWindowSizingHook.nativeHeight(context);
            int target=dp>0?Math.max(original,px(dp)):original>0?original:nativeHeight;
            if(target!=Integer.MIN_VALUE&&p.height!=target){p.height=target;root.setLayoutParams(p);}}
        int px(float dp){return Math.round(dp*context.getResources().getDisplayMetrics().density);}
        boolean two(String id){return FeatureSettings.enabled(context,id.equals("notifications")?ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS:ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,true);}
        void layout(){if(!active||applying||root.getWidth()==0||root.getHeight()==0)return;applying=true;
            try {
                layoutFrames++;
                for(Map.Entry<View,Geometry> e:geometry.entrySet())e.getValue().observe(e.getKey());
                Map<String,View> views=new LinkedHashMap<>();contentBounds.clear();groups.clear();
                View clock=findView(root,"clock","status_bar_clock");
                View notifications=findClass(root,"NotificationIconContainer");
                View systems=findClass(root,"StatusIconContainer");
                if(systems==null)systems=findView(root,"statusIcons","status_icons");
                View battery=findView(root,"battery","battery_view");
                ArrayList<StatusBarGridLayout.Node> nodes=new ArrayList<>();
                add(nodes,views,"clock",clock);
                addGroup(nodes,views,"notifications",notifications);
                // RedMagic's fan/refresh-rate/cooling icons live outside StatusIconContainer.
                // Pack their native children alongside system icons so notifications cannot cover them.
                addGroup(nodes,views,"system_icons",systems,findView(root,"red_magic_function_icon_container"));
                add(nodes,views,"battery",battery);
                // These native indicators are siblings of the ordinary icon lists, not their children.
                // Keep compound chips intact (icon + text + click target) and reserve a complete box.
                addCompanion(nodes,views,"clock.operator","clock",findView(root,"operator_name_frame"),-10,false);
                addCompanion(nodes,views,"notifications.ongoing_primary","notifications",findView(root,"ongoing_activity_chip_primary"),-9,false);
                addCompanion(nodes,views,"notifications.ongoing_secondary","notifications",findView(root,"ongoing_activity_chip_secondary"),-8,false);
                addCompanion(nodes,views,"notifications.heads_up","notifications",findView(root,"heads_up_status_bar_view"),-7,false);
                addCompanion(nodes,views,"notifications.join","notifications",findView(root,"ll_notification_icon_join"),-1,true);
                addCompanion(nodes,views,"system_icons.user","system_icons",findView(root,"user_switcher_container"),10,false);
                for(Map.Entry<String,TextView> e:metrics.entrySet()){
                    if(clock instanceof TextView)e.getValue().setTextColor(((TextView)clock).getTextColors());
                    add(nodes,views,e.getKey(),e.getValue());
                }
                float cutLeft=0,cutRight=0;
                WindowInsets insets=root.getRootWindowInsets();
                if(insets!=null&&insets.getDisplayCutout()!=null){int[] rp=new int[2];root.getLocationOnScreen(rp);
                    for(Rect r:insets.getDisplayCutout().getBoundingRects())if(r.top<rp[1]+root.getHeight()&&r.bottom>rp[1]){cutLeft=r.left-rp[0]-px(2);cutRight=r.right-rp[0]+px(2);}}
                Map<String,StatusBarGridLayout.Box> boxes=StatusBarGridLayout.pack(nodes,root.getWidth(),root.getHeight(),
                        px(4+FeatureSettings.integer(context,ConfigSchema.STATUSBAR_LEFT_MARGIN_DP,0,0,40)),
                        px(4+FeatureSettings.integer(context,ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP,0,0,40)),
                        px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_TOP_MARGIN_DP,0,0,12)),
                        px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP,0,0,12)),
                        px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,0,0,8)),cutLeft,cutRight);
                for(Map.Entry<String,StatusBarGridLayout.Box> e:boxes.entrySet())place(e.getKey(),views.get(e.getKey()),e.getValue());
                long now=SystemClock.elapsedRealtime();
                if(now-lastWitness>5000){lastWitness=now;
                    FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"1");
                    FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,"grid_v2;build="+ls.augment.com.BuildConfig.VERSION_CODE+";patch=20260906r6-native-indicators;frames="+layoutFrames+";position_writes="+positionWrites+";native_clock="+(clock!=null)+";notifications="+(notifications!=null)+";system_icons="+(systems!=null)+";items="+boxes.size()+";size="+root.getWidth()+"x"+root.getHeight());
                    StringBuilder detail=new StringBuilder();
                    StatusBarGridLayout.Box notificationTop=boxes.get("notifications#0"),notificationBottom=boxes.get("notifications#1");
                    if(notificationTop!=null&&notificationBottom!=null)detail.append("notifications_x=").append(notificationTop.x).append(',').append(notificationBottom.x).append(';');
                    for(Map.Entry<String,TextView> metric:metrics.entrySet()){
                        StatusBarGridLayout.Box box=boxes.get(metric.getKey());if(box==null)continue;
                        int[] point=new int[2];metric.getValue().getLocationInWindow(point);
                        detail.append(metric.getKey()).append('=').append(metric.getValue().getText()).append('@').append(point[0]).append(',').append(point[1])
                                .append('/').append(Math.round(box.width)).append('x').append(Math.round(box.height)).append(';');
                    }
                    if(battery!=null){detail.append("battery=").append(battery.getClass().getSimpleName()).append('/').append(battery.getWidth()).append('x').append(battery.getHeight()).append('/').append(contentBounds.get(battery));
                        if(battery instanceof ViewGroup)for(int i=0;i<((ViewGroup)battery).getChildCount();i++){View child=((ViewGroup)battery).getChildAt(i);detail.append('/').append(name(child)).append(':').append(child.getWidth()).append('x').append(child.getHeight());}}
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_metrics_state",detail.toString());
                    StringBuilder rows=new StringBuilder();
                    for(Map.Entry<String,StatusBarGridLayout.Box> e:boxes.entrySet()){
                        StatusBarGridLayout.Box b=e.getValue();rows.append(e.getKey()).append('@').append(b.y).append('+').append(b.height).append(';');
                    }
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_rows_state",rows.toString());
                    StringBuilder icons=new StringBuilder();for(Map.Entry<String,List<View>> group:groups.entrySet()){
                        if(!group.getKey().startsWith("system_icons"))continue;
                        icons.append(group.getKey()).append('=');for(View child:group.getValue())icons.append(name(child).isEmpty()?SystemUiHook.slotOf(child):name(child)).append(',');icons.append(';');}
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_system_items",icons.toString());}
            }catch(Throwable e){FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAST_ERROR,"grid_layout:"+e);restore();active=false;}
            finally{applying=false;}
        }
        Geometry own(View view){Geometry g=geometry.get(view);if(g==null){g=new Geometry(view);geometry.put(view,g);}return g;}
        void add(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,View view){
            StatusBarGridSpec.Item item=spec.get(baseId(id));if(view==null||item==null||!visibleInRoot(view))return;
            Geometry state=own(view);if(!item.visible){view.setAlpha(0);state.mark(view);return;}view.setAlpha(state.alpha);
            if(view instanceof TextView&&metrics.containsKey(id)){
                TextView text=(TextView)view;
                // setMaxLines requests layout even when unchanged. Styling inside
                // OnPreDraw was scheduling another layout on every rendered frame.
                if(text.isLayoutRequested()||text.getWidth()==0||text.getHeight()==0){
                    text.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                    text.layout(0,0,text.getMeasuredWidth(),text.getMeasuredHeight());
                }
            }
            float h=view.getHeight(),w=view.getWidth();if(h<=0||w<=0)return;
            if(id.equals("battery")&&view instanceof ViewGroup){Rect bounds=batteryBounds(view);
                if(!bounds.isEmpty()){contentBounds.put(view,bounds);h=bounds.height();w=bounds.width();}}
            float scale=px(item.size)/h;
            if(view instanceof TextView){TextView t=(TextView)view;
                float lineHeight=t.getTextSize();if(lineHeight>0)scale=px(item.size)/lineHeight;
            }
            String zone=id.contains("#")?item.zone.substring(0,1)+(id.endsWith("#0")?"1":"2"):item.zone;
            nodes.add(new StatusBarGridLayout.Node(id,zone,item.order*100,w*scale,h*scale));views.put(id,view);
        }
        void addGroup(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,View parent,View... additionalParents){
            ArrayList<ViewGroup> sources=new ArrayList<>();
            if(parent instanceof ViewGroup&&visibleInRoot(parent))sources.add((ViewGroup)parent);
            for(View extra:additionalParents)if(extra instanceof ViewGroup&&visibleInRoot(extra)&&extra!=parent)sources.add((ViewGroup)extra);
            if(sources.isEmpty())return;
            if(parent==null)parent=sources.get(0);
            StatusBarGridSpec.Item item=spec.get(id);int n=0;
            int max=id.equals("notifications")?FeatureSettings.integer(context,ConfigSchema.STATUSBAR_NOTIFICATION_MAX,0,0,20):0;
            float size=px(item.size), width=0;ArrayList<View> children=new ArrayList<>();
            for(ViewGroup group:sources)for(int i=0;i<group.getChildCount();i++){
                View child=group.getChildAt(i);if(child.getVisibility()!=View.VISIBLE||child.getHeight()==0||child.getWidth()==0)continue;
                Geometry g=own(child);
                String slot = SystemUiHook.slotOf(child);
                if (spec.get("network").visible && ("NET_SPEED".equalsIgnoreCase(slot)
                        || child.getClass().getSimpleName().toLowerCase(Locale.ROOT).contains("netspeed"))) {
                    child.setAlpha(0); g.mark(child); continue;
                }
                // A native dot/hidden state must not be turned back into an icon.
                if(g.alpha==0)continue;
                if(!item.visible||(max>0&&n>=max)){child.setAlpha(0);g.mark(child);continue;}
                child.setAlpha(g.alpha);children.add(child);n++;
            }
            boolean rows=two(id);
            for(int row=0;row<(rows?2:1);row++){
                ArrayList<View> members=new ArrayList<>();width=0;
                for(int i=row;i<children.size();i+=rows?2:1){View child=children.get(i);members.add(child);width+=child.getWidth()*size/child.getHeight()+px(1);}
                if(members.isEmpty())continue;
                String part=rows?id+"#"+row:id;
                String zone=rows?item.zone.substring(0,1)+(row+1):item.zone;
                nodes.add(new StatusBarGridLayout.Node(part,zone,item.order*100,Math.max(1,width-px(1)),size));
                views.put(part,parent);groups.put(part,members);
            }
        }
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
            if(followsVisibility&&!item.visible){view.setAlpha(0);nativeGeometry.mark(view);return;}
            view.setAlpha(nativeGeometry.alpha);if(nativeGeometry.alpha==0)return;
            float height=px(item.size),width=view.getWidth()*height/view.getHeight();
            nodes.add(new StatusBarGridLayout.Node(id,item.zone,item.order*100+offset,width,height));views.put(id,view);
        }
        final Map<String,List<View>> groups=new HashMap<>();
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
                for(View child:children){float h=box.height,w=child.getWidth()*h/Math.max(1,child.getHeight());
                    move(child,x,box.y,w,h);x+=w+gap;}return;
            }
            move(view,box.x,box.y,box.width,box.height);
        }
        void move(View v,float x,float y,float width,float height){Geometry g=own(v);
            Rect bounds=contentBounds.get(v);float sx=width/Math.max(1,bounds==null?v.getWidth():bounds.width()),sy=height/Math.max(1,bounds==null?v.getHeight():bounds.height());v.setScaleX(sx);v.setScaleY(sy);
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
                float[] target={x,y};rootToParent.mapPoints(target);
                float[] origin={bounds==null?0:bounds.left,bounds==null?0:bounds.top};v.getMatrix().mapPoints(origin);
                float dx=target[0]-origin[0],dy=target[1]-origin[1];
                if(Math.abs(dx)>.001f){v.setTranslationX(v.getTranslationX()+dx);positionWrites++;}
                if(Math.abs(dy)>.001f){v.setTranslationY(v.getTranslationY()+dy);positionWrites++;}
            }
            g.mark(v);ViewParent parent=v.getParent();while(parent instanceof ViewGroup){ViewGroup p=(ViewGroup)parent;
                if(!clips.containsKey(p))clips.put(p,new boolean[]{p.getClipChildren(),p.getClipToPadding()});p.setClipChildren(false);p.setClipToPadding(false);if(p==root)break;parent=p.getParent();}
        }
        void startMetrics(){stopMetrics();boolean needed=false;for(int i=4;i<StatusBarGridSpec.IDS.length;i++)if(spec.get(StatusBarGridSpec.IDS[i]).visible)needed=true;
            if(!needed)return;overlay=new FrameLayout(context);overlay.setClipChildren(false);overlay.setClickable(false);
            overlay.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            root.addView(overlay,new ViewGroup.LayoutParams(-1,-1));
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
                    values.put(kind,Double.isFinite(degrees)?String.format(Locale.ROOT,"%s%.0f°",temperatureLabel(kind),degrees):temperature(kind));
                }
            }
            Long temp=readLong("/sys/class/power_supply/battery/temp");values.put("battery_temp",temp==null?"B:—":String.format(Locale.ROOT,"B:%.1f°",temp/10d));
            Long current=readLong("/sys/class/power_supply/battery/current_now"),voltage=readLong("/sys/class/power_supply/battery/voltage_now");
            values.put("current",current==null?"I:—":String.format(Locale.ROOT,"I:%.0fmA",current/1000d));
            values.put("power",current==null||voltage==null?"P:—":String.format(Locale.ROOT,"P:%.1fW",Math.abs(current.doubleValue()*voltage/1e12)));
            long rx=TrafficStats.getTotalRxBytes(),tx=TrafficStats.getTotalTxBytes(),now=SystemClock.elapsedRealtime();
            long down=previousRx<0||rx<previousRx||now<=previousTime?0:(rx-previousRx)*1000/(now-previousTime);
            long up=previousTx<0||tx<previousTx||now<=previousTime?0:(tx-previousTx)*1000/(now-previousTime);
            previousRx=rx;previousTx=tx;previousTime=now;
            values.put("network",ls.augment.com.StatusBarNetworkDisplay.format(networkMode(),rate(up),rate(down)));
            main.post(()->{if(!active||metricsGeneration!=generation)return;for(Map.Entry<String,TextView> e:metrics.entrySet()){
                String value=values.get(baseId(e.getKey()));
                if(value!=null&&e.getKey().contains("#")){String[] lines=value.split("\n",-1);int row=e.getKey().endsWith("#0")?0:1;value=row<lines.length?lines[row]:"";}
                if(value!=null&&!value.contentEquals(e.getValue().getText()))e.getValue().setText(value);
            }});
            if(worker==sessionWorker&&metricsGeneration==generation)sessionWorker.postDelayed(this,1000);
        }});
        }
        final Map<String,String> thermalPaths=new HashMap<>();
        String temperature(String kind){String path=thermalPaths.get(kind);if(path==null){File[] zones=new File("/sys/class/thermal").listFiles();if(zones!=null)for(File zone:zones){String type=read(new File(zone,"type").getPath()).toLowerCase(Locale.ROOT);
                if(type.contains(kind)){path=new File(zone,"temp").getPath();thermalPaths.put(kind,path);break;}}}
            Long value=path==null?null:readLong(path);double c=value==null?Double.NaN:Math.abs(value)>300?value/1000d:value;
            return temperatureLabel(kind)+ (Double.isFinite(c)&&c>-20&&c<150?String.format(Locale.ROOT,"%.0f°",c):"—");}
        int networkMode(){return ls.augment.com.StatusBarNetworkDisplay.resolve(FeatureSettings.text(context,ConfigSchema.STATUSBAR_NETWORK_DISPLAY,"0"),FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,true));}
        String temperatureLabel(String kind){return "gpu".equals(kind)?"G:":"C:";}
        String rate(long value){return value>=1024*1024?String.format(Locale.ROOT,"%.1fM",value/1048576d):String.format(Locale.ROOT,"%.0fK",value/1024d);}
        void stopMetrics(){metricsGeneration++;Handler h=worker;worker=null;if(h!=null)h.removeCallbacksAndMessages(null);if(thread!=null){thread.quitSafely();thread=null;}
            if(overlay!=null){root.removeView(overlay);overlay=null;}metrics.clear();}
        void restore(){for(Map.Entry<View,Geometry> e:geometry.entrySet())e.getValue().restore(e.getKey());geometry.clear();groups.clear();
            for(Map.Entry<ViewGroup,boolean[]> e:clips.entrySet()){e.getKey().setClipChildren(e.getValue()[0]);e.getKey().setClipToPadding(e.getValue()[1]);}clips.clear();}
        void detach(){attached=false;active=false;main.removeCallbacksAndMessages(null);stopMetrics();restore();
            if(batteryBitmap!=null){batteryBitmap.recycle();batteryBitmap=null;batteryPixels=null;}batteryInk=null;
            if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(draw);
            try{context.getContentResolver().unregisterContentObserver(observer);}catch(Throwable ignored){}
        }
    }
    private static String read(String path){try(BufferedReader r=new BufferedReader(new FileReader(path))){String s=r.readLine();return s==null?"":s.trim();}catch(Exception e){return "";}}
    private static String baseId(String id){int split=id.indexOf('#');return split<0?id:id.substring(0,split);}
    private static Long readLong(String path){try{return Long.parseLong(read(path));}catch(Exception e){return null;}}
}
