package ls.augment.com.hook;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.service.notification.StatusBarNotification;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import java.lang.ref.WeakReference;
import java.util.IdentityHashMap;
import java.util.ArrayList;
import java.util.function.BiConsumer;
import ls.augment.com.IslandDownloadPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Supplemental content in OEM cards. The OEM manager owns gestures, windows and animations. */
final class DuoNotificationCards {
    private static final String OEM="com.zte.feature.dynamicisland.";
    private static final String ID="ls.augment.com_duo_notification";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    // SystemUI process-owned host; close retires callbacks after native removal completes.
    //noinspection StaticFieldLeak
    private static DuoNotificationCards active;
    // A close callback can arrive after hide(), even after another card or host was attached.
    private static final Map<View, OrdinaryClose> ordinaryCards = new WeakHashMap<>();
    private static boolean closeHook;
    private static final class OrdinaryClose {
        final WeakReference<Object> manager;
        final WeakReference<View> statusBar;
        boolean closing, withdrawing;
        OrdinaryClose(Object manager,View statusBar) {
            this.manager = new WeakReference<>(manager);
            this.statusBar = new WeakReference<>(statusBar);
        }
    }
    static View closingStatusBar(Object manager) {
        if (ordinaryCards.isEmpty()) return null;
        try {
            OrdinaryClose state = ordinaryCards.get(call(manager,"getPermanentIsland"));
            return state != null && state.manager.get() == manager ? state.statusBar.get() : null;
        } catch (ReflectiveOperationException missing) { return null; }
    }
    private final View statusBar;
    private final Context context;
    private final Object manager;
    private final boolean fullscreen;
    private final Runnable open;
    Runnable panelChanged;
    private final Method initialize,add,remove,panelHeight,heartbeat;
    private final Map<String,Object> registry;
    private final int panelWidth,panelHeightId;
    private ViewGroup island,panel;
    private View compact,content;
    private DuoCompactText compactText;
    private ImageView mini;
    private DuoDownloadPanel download;
    private int height;
    private boolean closed,published;
    private final Runnable pulse=this::pulse;
    private final Map<View,Retired> retiring=new IdentityHashMap<>();
    private final Runnable reap=this::reap;
    private long retireDeadline;
    private static final class Retired {
        final View panel;final DuoDownloadPanel content;final int height;
        Retired(View panel,DuoDownloadPanel content,int height){this.panel=panel;this.content=content;this.height=height;}
    }
    private View panelFor(Object view){Retired old=retiring.get(view);return old!=null?old.panel:view==island?panel:null;}
    private int selectedHeight(){try{Object view=call(manager,"getPermanentIsland");Retired old=retiring.get(view);
        return old!=null?old.height:view==island?height:0;}catch(Exception missing){return 0;}}

    static int install(AugmentModule module,ClassLoader loader){
        int count=0;
        int completion = hookNamed(module,loader,"duo_notification_cards",OEM+"PermanentIslandManager",
                "onPermanentIslandPanelCloseAnimationEnd",3,(owner,args,result)->{
            OrdinaryClose state = ordinaryCards.get(args[0]);
            if (state == null || state.manager.get() != owner
                    || !(args[1] instanceof Boolean) || !(args[2] instanceof Boolean)) return PASS;
            if (IslandPanelGuard.owns(owner,args[0]) && IslandPanelGuard.close(owner,args[0],
                    (Boolean)args[1],(Boolean)args[2],"notification_manager_hook")) return null;
            state.closing = false;
            View card = (View)args[0];
            boolean removed = state.withdrawing || (Boolean)args[1];
            boolean handled = NativeIslandPanelCompat.closeEnd(owner,card,removed,(Boolean)args[2],
                    message -> FeatureSettings.diagnostic(card.getContext(),"ls_augment_duo_panel_close",message));
            return handled ? null : PASS;
        },null);
        closeHook = completion > 0;
        count += completion;
        count+=hookNamed(module,loader,"duo_notification_cards",OEM+"PermanentIslandManager","showPermanentPanelIsland",0,(o,a,r)->{
            DuoNotificationCards h=active;
            if(h!=null&&!h.fullscreen&&o==h.manager&&h.selected()&&!h.prepareExpansion())return null;
            return PASS;
        },null);
        count+=hookNamed(module,loader,"duo_notification_cards",OEM+"DynamicPermanentIsland","updateViewVisibility",2,(o,a,r)->{
            DuoNotificationCards h=active;
            if(h!=null&&!h.fullscreen&&h.panelFor(o)!=null){((View)o).setAlpha((Boolean)a[0]?1f:0f);return null;}
            return PASS;
        },null);
        count+=hookNamed(module,loader,"duo_notification_cards",OEM+"DynamicPermanentIsland","updatePanelVisibility",3,(o,a,r)->{
            DuoNotificationCards h=active;
            if(h!=null&&!h.fullscreen&&h.panelFor(o)!=null){
                Class<?> animation=Class.forName(OEM+"DynamicIslandAnimation",false,loader);
                Method alpha=animation.getDeclaredMethod("startPanelAlphaAnimation",View.class,boolean.class,boolean.class);
                alpha.setAccessible(true);alpha.invoke(null,o,!(Boolean)a[0],false);alpha.invoke(null,h.panelFor(o),(Boolean)a[0],true);
                return null;
            }return PASS;
        },null);
        count+=hookNamed(module,loader,"duo_notification_cards","com.zte.utils.ResourceUtil","getDimensionPixelSizeInDefaultDpi",1,(o,a,r)->{
            DuoNotificationCards h=active;
            return h!=null&&!h.fullscreen&&h.selectedHeight()>0&&Integer.valueOf(h.panelHeightId).equals(a[0])?h.selectedHeight():PASS;
        },null);
        count+=hookNamed(module,loader,"duo_notification_cards",OEM+"PermanentIslandManager","onClick",0,(o,a,r)->{
            DuoNotificationCards h=active;
            if(h!=null&&h.fullscreen&&o==h.manager&&h.selected())h.prepareExpansion();
            if(h!=null&&!h.fullscreen&&o==h.manager&&h.selected()){
                if(!Boolean.TRUE.equals(call(o,"forceNotClick")))h.open.run();return null;
            }return PASS;
        },null);
        // Fullscreen long press opens the source. Preserve the original PendingIntent,
        // rather than reconstructing a different activity Intent from its package.
        count+=hookNamed(module,loader,"duo_notification_cards",OEM+"RemoteViewIsland","handleIslandClick",0,(o,a,r)->{
            DuoNotificationCards h=active;
            if(h!=null&&o==h.island){h.open.run();return false;}return PASS;
        },null);
        count+=hookNamed(module,loader,"duo_notification_cards",OEM+"PermanentIslandManager","onLongClick",0,(o,a,r)->{
            DuoNotificationCards h=active;
            // Ordinary long press keeps its OEM scale/open interaction; only prepare its callback.
            if(h!=null&&!h.fullscreen&&o==h.manager&&h.selected()&&!h.prepareExpansion())return null;
            if(h!=null&&h.fullscreen&&o==h.manager&&h.selected()){
                if(!Boolean.TRUE.equals(call(o,"forceNotClick")))h.open.run();return null;
            }return PASS;
        },null);
        return count;
    }

    @SuppressWarnings("unchecked")
    DuoNotificationCards(Context context,ClassLoader loader,Object manager,boolean fullscreen,Runnable open,View statusBar)throws Exception{
        this.statusBar=statusBar;
        this.context=context;this.manager=manager;this.fullscreen=fullscreen;this.open=open;
        Class<?> base=Class.forName(OEM+"DynamicPermanentIsland",false,loader);
        Class<?> type=Class.forName(OEM+"RemoteViewIsland",false,loader);
        Class<?> panelType=Class.forName(OEM+"RemoteViewPanelIsland",false,loader);
        if(!FrameLayout.class.isAssignableFrom(type)||!FrameLayout.class.isAssignableFrom(panelType))throw new IllegalStateException("notification_card_view_type");
        Method init;
        try{init=MagicIslandScenes.exact(type,"initIsland",void.class,String.class,String.class,String.class,Intent.class,String.class,int.class,boolean.class,boolean.class);}
        catch(NoSuchMethodException modern){
            try{init=MagicIslandScenes.exact(type,"initIsland",void.class,String.class,String.class,Intent.class,String.class,int.class);}
            catch(NoSuchMethodException old){init=MagicIslandScenes.exact(type,"initIsland",void.class,String.class,String.class,String.class,int.class);}
        }
        initialize=init;
        add=fullscreen?MagicIslandScenes.exact(manager.getClass(),"addPermanentIslandFullScreen",void.class,base,boolean.class)
                :MagicIslandScenes.exact(manager.getClass(),"addPermanentIslandInner",void.class,base);
        remove=fullscreen?MagicIslandScenes.exact(manager.getClass(),"handleRemoveIsland",void.class,String.class)
                :MagicIslandScenes.exact(manager.getClass(),"removePermanentIsland",void.class,base);
        panelHeight=MagicIslandScenes.exact(manager.getClass(),"updatePanelHeight",void.class,View.class);
        if(!fullscreen){
            MagicIslandScenes.exact(manager.getClass(),"updateDynamicWindowHeightParams",void.class,boolean.class);
            MagicIslandScenes.typed(manager.getClass(),"mDynamicIslandContainer",View.class);
            if (!NativeIslandPanelCompat.canExpand(manager,detail ->
                    FeatureSettings.diagnostic(context,"ls_augment_duo_panel_close",detail))
                    || (NativeIslandPanelCompat.ordinary(manager) && !closeHook))
                throw new IllegalStateException("ordinary_panel_close_contract");
        }
        MagicIslandScenes.exact(type,"setPanelIsland",void.class,base);
        MagicIslandScenes.exact(type,"setSmallIsland",void.class,View.class);
        MagicIslandScenes.exact(type,"handleIslandClick",boolean.class);
        MagicIslandScenes.exact(manager.getClass(),"forceNotClick",boolean.class);
        MagicIslandScenes.exact(manager.getClass(),"onClick",void.class);
        MagicIslandScenes.exact(manager.getClass(),"onLongClick",void.class);
        MagicIslandScenes.exact(manager.getClass(),"getPermanentIsland",base);
        registry=(Map<String,Object>)MagicIslandScenes.typed(manager.getClass(),"mAppIslandList",Map.class).get(manager);
        Method beat=null;
        if(fullscreen)try{beat=MagicIslandScenes.exact(manager.getClass(),"handleIslandHeartBeat",void.class,String.class);}
        catch(NoSuchMethodException older){/* The older application-card engine has no heartbeat protocol. */}
        heartbeat=beat;
        for(String name:new String[]{"remote_view_island_layout","remote_view_panel_island_layout","remote_view_small_island_layout","app_island_layout","app_island_panel_layout"})resource("layout",name);
        if(heartbeat!=null){
            MagicIslandScenes.exact(manager.getClass(),"markIslandOnTime",void.class,String.class);
            MagicIslandScenes.exact(manager.getClass(),"reportIslandStatus",void.class,base,int.class);
            MagicIslandScenes.exact(manager.getClass(),"setIslandShowing",void.class,String.class,boolean.class);
        }
        panelWidth=context.getResources().getDimensionPixelSize(resource("dimen","dynamic_island_window_width"));
        panelHeightId=resource("dimen","dynamic_island_panel_height_normal");
        if(panelWidth<=0)throw new IllegalStateException("notification_card_width");
        active=this;
    }
    private void create(boolean progress)throws Exception{
        if(island!=null&&progress==(download!=null))return;
        hide();
        ViewGroup next=(ViewGroup)inflate("remote_view_island_layout");
        ViewGroup expanded=(ViewGroup)inflate("remote_view_panel_island_layout");
        if (!fullscreen) DuoPanelShape.attach(expanded,field(manager,"mDynamicIslandRoot"));
        View small=inflate("app_island_layout"),large=inflate("app_island_panel_layout");
        call(small,"initAppIsland","ls.augment.com","","",null,null,"",null,"");
        if (progress) prepareCompactLabel(small);
        call(large,"initPanelIsland","ls.augment.com","");
        // New flags grant visibility over fullscreen apps/on keyguard, not the host layout.
        // Supplemental notifications retain the previous native restrictions.
        if(initialize.getParameterCount()==8)initialize.invoke(next,"ls.augment.com",ID,"duo_notification",null,null,1,false,false);
        else if(initialize.getParameterCount()==5)initialize.invoke(next,"ls.augment.com",ID,null,null,1);
        else initialize.invoke(next,"ls.augment.com",ID,null,1);
        call(next,"setPanelIsland",expanded);set(next,"mKeyguardIsland",false);
        ViewGroup smallHost=(ViewGroup)inflate("remote_view_small_island_layout");
        ImageView smallIcon=new ImageView(context);smallIcon.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int iconSize=Math.round(22*context.getResources().getDisplayMetrics().density);
        FrameLayout.LayoutParams iconParams=new FrameLayout.LayoutParams(iconSize,iconSize);iconParams.gravity=android.view.Gravity.CENTER;
        smallHost.addView(smallIcon,iconParams);call(next,"setSmallIsland",smallHost);
        next.addView(small,new FrameLayout.LayoutParams(-1,-1));
        expanded.addView(large,new FrameLayout.LayoutParams(-1,-2));
        DuoDownloadPanel progressPanel=progress?new DuoDownloadPanel(large):null;
        if(!progress)large.setOnClickListener(v->open.run());
        island=next;panel=expanded;compact=small;content=large;download=progressPanel;mini=smallIcon;
        if (!fullscreen && NativeIslandPanelCompat.ordinary(manager))
            ordinaryCards.put(next,new OrdinaryClose(manager,statusBar));
    }
    private void prepareCompactLabel(View card) {
        Object value = field(card,"mDisplayText");
        if (!(value instanceof TextView)) throw new IllegalStateException("compact_text_missing");
        TextView label = (TextView)value;
        // Some ordinary layouts leave AppIsland's text hidden or outside the compact window.
        // This copy belongs to Duo. Keep the OEM icon in its start slot and pin the metric at the end.
        if (label.getParent() instanceof FrameLayout) {
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-1,-2);
            params.gravity = android.view.Gravity.END | android.view.Gravity.CENTER_VERTICAL;
            params.setMarginStart(Math.round(34 * context.getResources().getDisplayMetrics().density));
            params.setMarginEnd(Math.round(10 * context.getResources().getDisplayMetrics().density));
            label.setLayoutParams(params);
        }
        label.setVisibility(View.VISIBLE);
        label.setAlpha(1f);
        label.setSingleLine(true);
        label.setGravity(android.view.Gravity.END | android.view.Gravity.CENTER_VERTICAL);
        label.setEllipsize(android.text.TextUtils.TruncateAt.END);
        // Keep the current OEM text appearance (including light glass and its font).
        int color=context.getResources().getIdentifier("dynamic_island_text_color","color","com.android.systemui");
        if(color!=0)label.setTextColor(context.getColor(color));
        compactText=new DuoCompactText(label);
    }
    boolean show(String title,String subtitle,String label,Drawable icon){
        if(closed)return false;
        try{
            create(false);call(compact,"setDisplayText",label);image(compact,"mDisplayIcon",icon);mini.setImageDrawable(icon);
            text(content,"mDisplayText",title);text(content,"mDisplaySecondText",subtitle);image(content,"mDisplayIcon",icon);
            Object badge=field(content,"mDisplaySmallIcon");if(badge instanceof View)((View)badge).setVisibility(View.GONE);
            publish();return true;
        }catch(Exception failure){failed(failure);return false;}
    }
    boolean showDownload(IslandDownloadPolicy.Entry<StatusBarNotification> entry,Drawable icon,String app,
            BiConsumer<IslandDownloadPolicy.Entry<StatusBarNotification>,PendingIntent> action){
        if(closed||entry==null)return false;
        try{
            create(true);compactText.bind(DuoCompactText.fileName(entry.source.getNotification()),entry.indeterminate?"下载中":entry.percent+"%");
            image(compact,"mDisplayIcon",icon);mini.setImageDrawable(icon);download.bind(entry,icon,app,action);publish();return true;
        }catch(Exception failure){failed(failure);return false;}
    }
    boolean showNotice(StatusBarNotification source,Drawable icon,String app,BiConsumer<StatusBarNotification,PendingIntent> action,
            java.util.function.Consumer<StatusBarNotification> remind){
        if(closed||source==null)return false;
        try{
            create(true);compactText.bind(DuoCompactText.senderOrTitle(source.getNotification(),app),"");image(compact,"mDisplayIcon",icon);mini.setImageDrawable(icon);
            download.bindNotice(source,icon,app,action,remind);publish();return true;
        }catch(Exception failure){failed(failure);return false;}
    }
    private void publish()throws Exception{
        int available=content.getWidth()>0?Math.min(content.getWidth(),panelWidth):panelWidth;
        content.measure(View.MeasureSpec.makeMeasureSpec(available,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        int minimum=download!=null?Math.round(56*context.getResources().getDisplayMetrics().density)
                :context.getResources().getDimensionPixelSize(panelHeightId);
        height=Math.max(minimum,download!=null?download.desiredHeight(available):content.getMeasuredHeight());
        height=Math.min(height,context.getResources().getDisplayMetrics().heightPixels/2);
        content.setLayoutParams(new FrameLayout.LayoutParams(-1,height));
        panel.setLayoutParams(new FrameLayout.LayoutParams(-1,height));
        if(fullscreen){
            // The native manager removes unregistered views during consistency checks.
            if(!published){
                if(heartbeat!=null)call(manager,"markIslandOnTime",ID);
                registry.put(ID,island);
                if(heartbeat!=null)call(manager,"reportIslandStatus",island,1);
                add.invoke(manager,island,true);published=true;
                if(heartbeat!=null)call(manager,"setIslandShowing",ID,true);
            }
            if(registry.get(ID)!=island){hide();return;}
            panelHeight.invoke(manager,panel);
        }else{
            if(island.getParent()==null)add.invoke(manager,island);
            if(expanded()&&!Boolean.TRUE.equals(field(manager,"mAnimProcessing"))){
                View container=(View)field(manager,"mDynamicIslandContainer");
                ViewGroup.LayoutParams params=container.getLayoutParams();
                if(params!=null&&params.height!=height){params.height=height;container.setLayoutParams(params);call(manager,"updateDynamicWindowHeightParams",true);}
            }
        }
        MAIN.removeCallbacks(pulse);
        if(fullscreen&&heartbeat!=null){heartbeat.invoke(manager,ID);MAIN.postDelayed(pulse,2000);}
    }
    private void pulse(){
        if(closed||!published||registry.get(ID)!=island)return;
        try{heartbeat.invoke(manager,ID);MAIN.postDelayed(pulse,2000);}
        catch(Exception failure){failed(failure);}
    }
    private void failed(Exception failure){hide();FeatureSettings.diagnostic(context,"ls_augment_duo_notification_cards","unavailable:"+failure.getClass().getSimpleName()+":"+failure.getMessage());}
    boolean selected(){try{return island!=null&&call(manager,"getPermanentIsland")==island;}catch(Exception missing){return false;}}
    boolean visible(){return island!=null&&(island.isShown()||expanded());}
    boolean readyForFirstExpansion(){
        return visible()&&selected()&&!Boolean.TRUE.equals(field(manager,"mAnimProcessing"))
                &&!Boolean.TRUE.equals(field(manager,"mPriorityProcessing"))&&!Boolean.TRUE.equals(field(manager,"mDynamicPanelClosing"));
    }
    boolean expanded(){return island!=null&&Boolean.TRUE.equals(field(manager,"mDynamicPanelShowing"))
            &&(fullscreen?field(manager,"mTempIsland")==island:selected());}
    void expand(){try{if(selected()){
        // Fullscreen onClick owns the mutating native click throttle. Calling it here
        // first consumes the timestamp and makes the real onClick reject our request.
        if(!fullscreen&&Boolean.TRUE.equals(call(manager,"forceNotClick")))return;
        if(!prepareExpansion())return;
        call(manager,fullscreen?"onClick":"showPermanentPanelIsland");
    }}catch(Exception failure){failed(failure);}}
    private boolean prepareExpansion(){
        IslandPanelInteraction.bind(this,manager,island,panel,true,()->{if(panelChanged!=null)panelChanged.run();});
        if(fullscreen)return true;
        for(String name:new String[]{"mAnimProcessing","mPriorityProcessing","mDynamicPanelShowing","mDynamicPanelClosing"})
            if(Boolean.TRUE.equals(field(manager,name)))return true;
        OrdinaryClose state=ordinaryCards.get(island);
        return IslandPanelGuard.prepare(manager,island,()->{if(state!=null)state.closing=false;});
    }
    void dismiss(){
        if(!expanded())return;
        OrdinaryClose state = ordinaryCards.get(island);
        if (state != null && (state.closing || Boolean.TRUE.equals(field(manager,"mDynamicPanelClosing")))) return;
        try{if(fullscreen)call(manager,"hidePanelIsland",false);
            else {
                if (state != null) state.closing = true;
                call(field(manager,"mDynamicAnimation"),"startPermanentPanelCloseAnimation",island,false,false);
            }}
        catch(Exception failure){
            if (state != null) state.closing = false;
            FeatureSettings.diagnostic(context,"ls_augment_duo_notification_cards","collapse_failed:"+failure.getClass().getSimpleName());}
    }
    void hide(){
        IslandPanelInteraction.release(this);
        MAIN.removeCallbacks(pulse);
        View old=island;
        IslandPanelGuard.withdrawing(manager,old);
        OrdinaryClose state = ordinaryCards.get(old);
        if (state != null) state.withdrawing = true;
        if(old!=null)try{if(fullscreen){if(registry.get(ID)==old)remove.invoke(manager,ID);}
            else if (state == null || !expanded() || (!state.closing && !Boolean.TRUE.equals(field(manager,"mDynamicPanelClosing"))))
                remove.invoke(manager,old);}
        catch(Exception failure){FeatureSettings.diagnostic(context,"ls_augment_duo_notification_cards","remove_failed:"+failure.getClass().getSimpleName());}
        if(old!=null){retiring.put(old,new Retired(panel,download,height));retireDeadline=System.nanoTime()+4_000_000_000L;}
        island=null;panel=null;compact=null;compactText=null;content=null;download=null;mini=null;published=false;
        reap();
    }
    private void reap(){
        MAIN.removeCallbacks(reap);
        for(View view:new ArrayList<>(retiring.keySet())){
            Retired old=retiring.get(view);
            if(view.getParent()==null&&(old.panel==null||old.panel.getParent()==null)){
                if(old.content!=null)old.content.clear();retiring.remove(view);
            }
        }
        // Native removal can finish asynchronously. Keep visibility adapters alive through its callback.
        if(!retiring.isEmpty()&&System.nanoTime()<retireDeadline)MAIN.postDelayed(reap,500);
        else if(!retiring.isEmpty()){
            for(Retired old:retiring.values())if(old.content!=null)old.content.clear();
            retiring.clear();FeatureSettings.diagnostic(context,"ls_augment_duo_notification_cards","native_removal_timeout");
            if(closed&&active==this)active=null;
        }
        else if(closed&&active==this)active=null;
    }
    void close(){closed=true;hide();if(retiring.isEmpty()&&active==this)active=null;}
    private void text(Object owner,String name,String value){Object view=field(owner,name);if(view instanceof TextView)((TextView)view).setText(value);}
    private void image(Object owner,String name,Drawable value){Object view=field(owner,name);if(view instanceof ImageView)((ImageView)view).setImageDrawable(value);}
    private View inflate(String name){return LayoutInflater.from(context).inflate(resource("layout",name),null);}
    // Runtime SystemUI resources, not resources in the module APK.
    //noinspection DiscouragedApi
    private int resource(String type,String name){int id=context.getResources().getIdentifier(name,type,"com.android.systemui");
        if(id==0)throw new IllegalStateException("missing_"+type+":"+name);return id;}
}
