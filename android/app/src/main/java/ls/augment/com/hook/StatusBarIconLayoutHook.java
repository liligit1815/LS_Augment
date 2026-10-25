package ls.augment.com.hook;

import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.*;
import java.util.*;
import ls.augment.com.*;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** RedMagic's actual icon-container measurement and eligibility, not drawable padding. */
final class StatusBarIconLayoutHook {
    private static final String CONTAINER="com.android.systemui.statusbar.phone.StatusIconContainer";
    private static final String NOTIFICATIONS="com.android.systemui.statusbar.phone.NotificationIconContainer";
    private static final ThreadLocal<ViewGroup> NOTIFICATION_LAYOUT=new ThreadLocal<>();
    private static final Map<ViewGroup,Boolean> CONTAINERS=new WeakHashMap<>();
    private static final Map<View,float[]> Y_OFFSETS=new WeakHashMap<>();
    private static final Map<View,float[]> NOTIFICATION_X_OFFSETS=new WeakHashMap<>();
    private static final Map<View,MarginRecord> MARGINS=new WeakHashMap<>();
    private static final Map<ViewGroup,SizeRecord> CHILD_BOXES=new WeakHashMap<>();
    private static final Map<ViewGroup,Boolean> COMPOSITES=new WeakHashMap<>();
    private static final Map<ViewGroup,Boolean> COMPOSITE_ACTIVE=new WeakHashMap<>();
    private static final Map<ViewGroup,int[]> CHILD_EXTENTS=new WeakHashMap<>();
    private static final Map<ViewGroup,String> WIFI_CONTRACT=new WeakHashMap<>();
    private static final Map<ViewGroup,Long> WIFI_CONTRACT_AT=new WeakHashMap<>();
    private static final Map<Class<?>,Map<String,Method>> METHODS=new HashMap<>();
    private static String rawSpacing="";
    private static StatusBarIconSpacingSpec cachedSpacing=StatusBarIconSpacingSpec.empty();
    private static boolean listenerInstalled;
    private static boolean marginLookup;
    private static Method nativeMargin;
    private StatusBarIconLayoutHook(){}

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static int install(AugmentModule module,ClassLoader loader){
        int count=0;
        try{
            Class<?> type=Class.forName(CONTAINER,false,loader);
            for(Method method:type.getDeclaredMethods())if(Arrays.asList("getMeasuredWidth","getMeasuredHeight","onLayout").contains(method.getName()))module.deoptimize(method);
            for(String name:new String[]{"onMeasure","calculateIconTranslations"}){
                Method method=name.equals("onMeasure")?type.getDeclaredMethod(name,int.class,int.class):type.getDeclaredMethod(name);
                method.setAccessible(true);module.deoptimize(method);
                module.registerFeatureHook(module.prepareFeatureHook(method,"systemui.icon_layout."+name,false).intercept(chain->{
                    ViewGroup parent=(ViewGroup)chain.getThisObject();watch(parent);
                    Object ignored=field(parent,"mIgnoredSlots");
                    Object underflow=field(parent,"mNeedsUnderflow");
                    List<String> exclusions=excluded(parent,name.equals("onMeasure"));
                    if(!exclusions.isEmpty()&&ignored instanceof List){List<Object> temporary=new ArrayList<>((List<?>)ignored);temporary.addAll(exclusions);set(parent,"mIgnoredSlots",temporary);}
                    boolean fit=!exclusions.isEmpty()&&name.equals("calculateIconTranslations")&&fitsOriginalBounds(parent);
                    if(fit)set(parent,"mNeedsUnderflow",false);
                    try{
                        Object result=chain.proceed();
                        if(name.equals("calculateIconTranslations"))applyNativeInsets(parent);
                        return result;
                    }finally{if(!exclusions.isEmpty()&&ignored instanceof List)set(parent,"mIgnoredSlots",ignored);if(fit&&underflow instanceof Boolean)set(parent,"mNeedsUnderflow",underflow);}
                }));count++;
            }
            for(String name:new String[]{"getViewTotalMeasuredWidth","getViewTotalWidth"}){
                Method helper=type.getDeclaredMethod(name,View.class);module.deoptimize(helper);
                count+=hookNamed(module,loader,"icon_spacing",CONTAINER,name,1,null,(o,a,result)->{
                    View child=(View)a[0];if(!(result instanceof Integer)||StatusBarGridHook.ownsIconLayout(child))return PASS;
                    return (Integer)result+(int)Math.ceil(insets(child).horizontal()*density(child));
                });
            }
            count+=hookNamed(module,loader,"icon_spacing",CONTAINER,"getMeasuredHeight",2,null,(o,a,result)->{
                if(!(o instanceof ViewGroup)||!(result instanceof Integer)||StatusBarGridHook.ownsIconLayout((View)o))return PASS;
                ViewGroup parent=(ViewGroup)o;int desired=(Integer)result;
                for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);if(eligible(parent,child))desired=Math.max(desired,child.getMeasuredHeight()+Math.round(insets(child).vertical()*density(child))+parent.getPaddingTop()+parent.getPaddingBottom());}
                return View.resolveSize(desired,(Integer)a[0]);
            });
            count+=hookNamed(module,loader,"icon_spacing",CONTAINER,"resetViewStates",0,(o,a,r)->{restoreY((ViewGroup)o);return PASS;},null);
        }catch(Throwable error){module.logFeatureError("STATUSBAR_ICON_LAYOUT_ADAPTER",error);}
        count+=installNotifications(module,loader);
        count+=StatusBarHeaderSpacingHook.install(module,loader);
        // NX809J rewrites fixed inner signal/type boxes on configuration changes.
        // Rebase immediately after the native writer, before the next measurement.
        for(String event:new String[]{"setWifiIconLayout","setMobileIconLayout"})
            count+=hookNamed(module,loader,"icon_spacing","com.zte.feature.statusbar.StatusBarIconSizeFeature",event,-1,
                    (o,a,r)->{for(ViewGroup owner:argumentOwners(a))restoreChildBoxes(owner);return PASS;},
                    (o,a,r)->{for(ViewGroup owner:argumentOwners(a))refreshComposite(owner);return PASS;});
        return count;
    }
    private static Set<ViewGroup> argumentOwners(Object[] args){
        Set<ViewGroup> owners=Collections.newSetFromMap(new IdentityHashMap<>());
        for(Object arg:args)if(arg instanceof View){View view=(View)arg;ViewGroup owner=composite(view)?(ViewGroup)view:compositeOwner(view);if(owner!=null)owners.add(owner);}
        return owners;
    }
    private static void restoreChildBoxes(ViewGroup parent){
        for(int i=0;i<parent.getChildCount();i++)if(parent.getChildAt(i) instanceof ViewGroup)restoreChildBoxes((ViewGroup)parent.getChildAt(i));
        SizeRecord previous=CHILD_BOXES.get(parent);if(previous!=null&&previous.params==parent.getLayoutParams())previous.apply(parent,0,0,false);
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static int installNotifications(AugmentModule module,ClassLoader loader){
        int count=0;
        try{
            Class<?> type=Class.forName(NOTIFICATIONS,false,loader);
            Method calculate=type.getDeclaredMethod("calculateIconXTranslations");module.deoptimize(calculate);
            Method drawing=type.getDeclaredMethod("getDrawingScale",View.class);module.deoptimize(drawing);
            module.registerFeatureHook(module.prepareFeatureHook(calculate,"systemui.icon_spacing.notifications",false).intercept(chain->{
                ViewGroup parent=(ViewGroup)chain.getThisObject();watch(parent);
                restoreNotificationX(parent,false);
                StatusBarIconSpacingSpec.Insets edge=insets(parent,"notifications");
                if(edge.isZero()||StatusBarGridHook.ownsIconLayout(parent)||!notificationSurface(parent)||StatusBarNotificationSummaryHook.measure(parent)!=null)return chain.proceed();
                Object size=field(parent,"mIconSize");ViewGroup previous=NOTIFICATION_LAYOUT.get();
                if(size instanceof Number)set(parent,"mIconSize",((Number)size).intValue()+Math.round(edge.horizontal()*density(parent)));
                NOTIFICATION_LAYOUT.set(parent);
                try{Object result=chain.proceed();applyNotificationInsets(parent,edge);return result;}
                finally{NOTIFICATION_LAYOUT.set(previous);if(size instanceof Number)set(parent,"mIconSize",size);}
            }));count++;
            count+=hookNamed(module,loader,"icon_spacing",NOTIFICATIONS,"getDrawingScale",1,null,(o,a,r)->{
                if(o!=NOTIFICATION_LAYOUT.get()||!(r instanceof Number))return PASS;
                View child=(View)a[0];if(child.getWidth()<=0||!notificationVisible((ViewGroup)o,child))return PASS;
                // OEM multiplies this measurement factor by child width and its live appear amount.
                // The actual drawable and ViewState scale remain unchanged.
                return ((Number)r).floatValue()+insets(child,"notifications").horizontal()*density(child)/child.getWidth();
            });
            count+=hookNamed(module,loader,"icon_spacing",NOTIFICATIONS,"onMeasure",2,null,(o,a,r)->{
                ViewGroup parent=(ViewGroup)o;watch(parent);StatusBarIconSpacingSpec.Insets edge=insets(parent,"notifications");
                if(edge.isZero()||StatusBarGridHook.ownsIconLayout(parent)||!notificationSurface(parent)||StatusBarNotificationSummaryHook.measure(parent)!=null)return PASS;
                int max=number(field(parent,"mMaxIcons"),0),width=Math.round(value(invoke(parent,"getActualPaddingStart"))+value(invoke(parent,"getActualPaddingEnd"))),height=parent.getMeasuredHeight();
                for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);boolean visible=notificationVisible(parent,child);if(i<=max)width+=child.getMeasuredWidth()+(visible?(int)Math.ceil(edge.horizontal()*density(child)):0);if(visible)height=Math.max(height,child.getMeasuredHeight()+(int)Math.ceil(edge.vertical()*density(child)));}
                invoke(parent,"setMeasuredDimension",View.resolveSize(width,(Integer)a[0]),View.resolveSize(height,(Integer)a[1]));return PASS;
            });
            count+=hookNamed(module,loader,"icon_spacing",NOTIFICATIONS,"resetViewStates",0,(o,a,r)->{restoreY((ViewGroup)o);restoreNotificationX((ViewGroup)o,true);return PASS;},null);
        }catch(Throwable error){module.logFeatureError("STATUSBAR_NOTIFICATION_SPACING_ADAPTER",error);}
        return count;
    }
    private static boolean notificationVisible(ViewGroup parent,View child){
        if(child.getVisibility()!=View.VISIBLE||Boolean.FALSE.equals(invoke(child,"isIconVisible"))||Boolean.TRUE.equals(invoke(child,"isIconBlocked")))return false;
        Object states=field(parent,"mIconStates"),state=states instanceof Map?((Map<?,?>)states).get(child):null;
        return state==null||!Boolean.TRUE.equals(field(state,"hidden"));
    }
    private static boolean notificationSurface(View view){
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            String type=at.getClass().getSimpleName();
            if(type.contains("Shelf")||type.contains("Aod")||type.contains("AOD"))return false;
            if(StatusBarGridHook.isBarRoot(at))return true;
        }return false;
    }
    private static void applyNotificationInsets(ViewGroup parent,StatusBarIconSpacingSpec.Insets edge){
        Object states=field(parent,"mIconStates");if(!(states instanceof Map))return;
        boolean rtl=parent.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;
        Object isolated=field(parent,"mIsolatedIcon");
        for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);Object state=((Map<?,?>)states).get(child);
            if(child==isolated||state==null||child.getVisibility()!=View.VISIBLE||Boolean.TRUE.equals(field(state,"hidden"))||number(field(state,"visibleState"),2)!=0)continue;
            Object x=invoke(state,"getXTranslation");if(x instanceof Number){float before=((Number)x).floatValue(),after=before+(rtl?-1:1)*edge.start*density(child);invoke(state,"setXTranslation",after);NOTIFICATION_X_OFFSETS.put(child,new float[]{before,after});}
            applyY(parent,child,state,edge);
        }
    }
    private static void watch(ViewGroup parent){
        CONTAINERS.put(parent,Boolean.TRUE);
        if(!listenerInstalled)listenerInstalled=FeatureSettings.addSnapshotListener(parent.getContext(),()->{
            for(View view:new ArrayList<>(MARGINS.keySet()))if(view!=null)observeIcon(view);
            for(ViewGroup target:new ArrayList<>(COMPOSITES.keySet()))if(target!=null)refreshComposite(target);
            for(ViewGroup target:new ArrayList<>(CONTAINERS.keySet()))if(target!=null){restoreY(target);restoreNotificationX(target,true);target.requestLayout();target.invalidate();}
        });
    }
    static boolean releaseStackedChildBoundaries(View owner){
        boolean changed=false;
        for(View child:new ArrayList<>(MARGINS.keySet())){
            if(child==null||!StatusBarIconSpacingSpec.independentChild(semanticId(child)))continue;
            for(View at=child;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
                if(at==owner){MarginRecord record=MARGINS.remove(child);if(record!=null){record.restore(child);changed=true;}break;}
        }
        return changed;
    }
    /** Ordinary header rows consume MarginLayoutParams; custom icon containers use adapters above. */
    static void observeIcon(View view){
        if(view==null)return;
        MarginRecord previous=MARGINS.get(view);
        if(!hasChildWork(view)&&previous==null)return;
        if("privacy.dot".equals(semanticId(view)))return; // Dedicated, bounded decorations adapter.
        if(!(view.getLayoutParams() instanceof ViewGroup.MarginLayoutParams))return;
        String id=semanticId(view);
        if(StatusBarIconSpacingSpec.independentChild(id)&&RedMagicSystemUiHook.ownsStackedChildBoundary(view)){
            if(previous!=null){previous.restore(view);MARGINS.remove(view);}return;
        }
        StatusBarIconSpacingSpec.Insets edge=StatusBarHeaderSpacingHook.bounded(view,id,insets(view,id));
        int[] wifi=wifiChildMargins(view,id);
        boolean ordinary=view.getParent() instanceof android.widget.LinearLayout||view.getParent() instanceof android.widget.RelativeLayout||view.getParent() instanceof android.widget.FrameLayout;
        // Grid owns a whole signal cell, never its real signal/type/traffic children.
        // The keyguard's standalone avatar is itself a packed companion instead.
        boolean nested=StatusBarIconSpacingSpec.independentChild(id)&&compositeOwner(view)!=null||id.equals("user_switcher");
        if(!ordinary||(StatusBarGridHook.ownsIconLayout(view)&&!nested)||(wifi==null?edge.isZero():wifi[0]+wifi[1]+wifi[2]+wifi[3]==0)){
            if(previous!=null){previous.restore(view);MARGINS.remove(view);}return;
        }
        ViewGroup parent=(ViewGroup)view.getParent();
        if(parent.getClass().getSimpleName().equals("StatusIconContainer")||parent.getClass().getSimpleName().equals("NotificationIconContainer")){
            if(previous!=null){previous.restore(view);MARGINS.remove(view);}return;
        }
        ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)view.getLayoutParams();
        if(previous==null||previous.params!=params){previous=new MarginRecord(params);MARGINS.put(view,previous);}
        if(wifi==null)previous.apply(view,edge);else previous.applyPixels(view,wifi[0],wifi[1],wifi[2],wifi[3]);watch(parent);
    }
    /** Real OEM signal/traffic layers: padding changes must preserve their native anchor. */
    private static int[] wifiChildMargins(View child,String id){
        if(!StatusBarWifiSpacingPolicy.member(id)||!(child.getParent() instanceof android.widget.FrameLayout))return null;
        ViewGroup parent=(ViewGroup)child.getParent();View signal=null,traffic=null;String owner=id.substring(0,id.indexOf('.'));
        for(int i=0;i<parent.getChildCount();i++){View candidate=parent.getChildAt(i);String semantic=semanticId(candidate);if((owner+".signal").equals(semantic))signal=candidate;else if((owner+".activity_inout").equals(semantic))traffic=candidate;}
        if(signal==null||traffic==null){publishWifiContract(parent,id,"missing");return new int[]{0,0,0,0};}
        // ZFT.xml uses TOP|START (unspecified child gravity). Never pretend the
        // same calculation is safe for a different carrier's centered/end layer.
        String contract=wifiContract(signal,traffic);
        int[] asset=StatusBarWifiAssetSpacingHook.margins(child,signal,traffic,contract);
        if(asset!=null){publishWifiContract(parent,id,"asset_cells");return asset;}
        publishWifiContract(parent,id,contract);
        if(!contract.equals("native"))return new int[]{0,0,0,0};
        StatusBarIconSpacingSpec.Insets primary=signal.getVisibility()==View.GONE?StatusBarIconSpacingSpec.ZERO:insets(signal);
        StatusBarIconSpacingSpec.Insets activity=traffic.getVisibility()==View.GONE?StatusBarIconSpacingSpec.ZERO:insets(traffic);
        boolean vertical=StatusBarHeaderSpacingHook.fitsVerticalPixels(child,StatusBarWifiSpacingPolicy.verticalPixels(primary,activity,density(child)));
        return StatusBarWifiSpacingPolicy.pixels(primary,activity,density(child),child.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL,child==traffic,vertical);
    }
    private static boolean wifiAnchor(View child){
        if(!(child.getLayoutParams() instanceof android.widget.FrameLayout.LayoutParams))return false;
        android.widget.FrameLayout.LayoutParams params=(android.widget.FrameLayout.LayoutParams)child.getLayoutParams();
        int gravity=params.gravity;
        return gravity==-1||gravity==(android.view.Gravity.TOP|android.view.Gravity.START);
    }
    private static String wifiContract(View signal,View traffic){
        if(!wifiAnchor(signal)||!wifiAnchor(traffic))return "gravity";
        ViewGroup owner=compositeOwner(signal);
        if(signal.getVisibility()!=View.VISIBLE||owner!=null&&owner.getVisibility()!=View.VISIBLE)return "hidden";
        if(!(signal instanceof android.widget.ImageView)||!(traffic instanceof android.widget.ImageView))return "drawable";
        android.widget.ImageView s=(android.widget.ImageView)signal,a=(android.widget.ImageView)traffic;
        android.graphics.drawable.Drawable sd=StatusBarAssetsHook.nativeDrawable(s),ad=StatusBarAssetsHook.nativeDrawable(a);
        if(sd==null||ad==null)return "drawable";
        if(sd.isAutoMirrored()||ad.isAutoMirrored())return "mirror";
        if(s.getScaleType()!=android.widget.ImageView.ScaleType.FIT_XY||a.getScaleType()!=android.widget.ImageView.ScaleType.FIT_XY)return "scale";
        for(View layer:new View[]{s,a})if(layer.getScaleX()!=1f||layer.getScaleY()!=1f||layer.getRotation()!=0f||layer.getTranslationX()!=0f||layer.getTranslationY()!=0f)return "scale";
        if(s.getLayoutDirection()!=a.getLayoutDirection()||((View)s.getParent()).getLayoutDirection()!=s.getLayoutDirection())return "direction";
        ViewGroup.LayoutParams sp=s.getLayoutParams(),ap=a.getLayoutParams();
        if(sp.width<=0||sp.height<=0||sp.width!=ap.width||sp.height!=ap.height)return "size";
        return "native";
    }
    private static void publishWifiContract(ViewGroup parent,String id,String reason){
        if(parent.getDisplay()==null)return;long now=android.os.SystemClock.elapsedRealtime();String surface=StatusBarAssetsHook.surfaceFor(parent);
        int rotation=parent.getDisplay().getRotation();float d=density(parent),f=parent.getResources().getConfiguration().fontScale;int rtl=parent.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0;
        String signature=surface+":"+rotation+":"+d+":"+f+":"+rtl+":"+reason;
        if(signature.equals(WIFI_CONTRACT.get(parent))&&now-WIFI_CONTRACT_AT.getOrDefault(parent,0L)<30_000)return;
        WIFI_CONTRACT.put(parent,signature);WIFI_CONTRACT_AT.put(parent,now);
        StatusBarHeaderSpacingObservation profile=new StatusBarHeaderSpacingObservation(System.currentTimeMillis()-now,now,BuildConfig.VERSION_CODE,parent.getDisplay().getDisplayId(),rotation,Math.round(d*1000),Math.round(f*1000),rtl,0);
        FeatureSettings.diagnostic(parent.getContext(),StatusBarWifiSpacingObservation.key(surface,rotation,id),new StatusBarWifiSpacingObservation(reason,profile).serialize());
    }
    /** Include only additions actually consumed by native MarginLayoutParams. */
    static void includeChildBoundary(View child,android.graphics.RectF bounds){
        if(StatusBarWifiAssetSpacingHook.includeBoundary(child,bounds))return;
        MarginRecord record=MARGINS.get(child);if(record==null||!record.applied||bounds.isEmpty()||child.getLayoutParams()!=record.params)return;
        boolean rtl=child.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;
        int start=record.params.getMarginStart()==record.appliedStart?record.appliedStart-record.start:0;
        int end=record.params.getMarginEnd()==record.appliedEnd?record.appliedEnd-record.end:0;
        bounds.left-=rtl?end:start;bounds.right+=rtl?start:end;
        if(record.params.topMargin==record.appliedTop)bounds.top-=record.appliedTop-record.top;
        if(record.params.bottomMargin==record.appliedBottom)bounds.bottom+=record.appliedBottom-record.bottom;
    }
    static boolean composite(View view){
        if(!(view instanceof ViewGroup))return false;String type=view.getClass().getSimpleName();
        return type.contains("ModernStatusBarWifi")||type.contains("ModernStatusBarMobile")||type.equals("StatusBarWifiView")||type.equals("StatusBarMobileView")||type.contains("OngoingPrivacyChip")||"user_switcher".equals(StatusBarAssetsHook.semanticId(view));
    }
    private static ViewGroup compositeOwner(View child){
        for(View at=child.getParent() instanceof View?(View)child.getParent():null;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            if(composite(at))return (ViewGroup)at;
            if(StatusBarGridHook.isBarRoot(at)||at.getClass().getSimpleName().equals("StatusIconContainer"))break;
        }return null;
    }
    /** Called after a complete asset-tree scan, so all sibling margins are known. */
    static void refreshComposite(View view){
        if(!composite(view))return;ViewGroup owner=(ViewGroup)view;
        if(!COMPOSITES.containsKey(owner)){
            COMPOSITES.put(owner,Boolean.TRUE);watch(owner);
            // Native binders can change visibility or replace dimensions without
            // recreating the combination view. Reconcile after its native layout.
            owner.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->refreshComposite(v));
        }
        boolean work=hasChildWork(owner);
        // Keep the configuration listener, but never resolve semantic children or
        // resize OEM boxes when neither spacing nor artwork can affect them.
        // A previously active owner still gets one complete restoration pass.
        if(!work&&COMPOSITE_ACTIVE.remove(owner)==null)return;
        if(work)COMPOSITE_ACTIVE.put(owner,Boolean.TRUE);
        observeChildren(owner,0);CHILD_EXTENTS.put(owner,resizeChildren(owner,0));
        StatusBarHeaderSpacingHook.refresh(owner);
    }
    static void refreshHeaderComposites(View root){
        for(ViewGroup owner:new ArrayList<>(COMPOSITES.keySet()))if(below(owner,root))refreshComposite(owner);
    }
    static void restoreInactiveComposites(View root){
        if(COMPOSITE_ACTIVE.isEmpty())return;
        for(ViewGroup owner:new ArrayList<>(COMPOSITE_ACTIVE.keySet()))if(below(owner,root))refreshComposite(owner);
    }
    static int headerExtraHeight(View root){int extra=0;for(Map.Entry<ViewGroup,int[]> entry:CHILD_EXTENTS.entrySet())if(below(entry.getKey(),root)&&entry.getKey().getVisibility()!=View.GONE)extra=Math.max(extra,entry.getValue()[1]);return extra;}
    static List<View> spacingChildren(View root){if(!hasChildWork(root))return Collections.emptyList();List<View> found=new ArrayList<>();collectSpacingChildren(root,found,0);return found;}
    private static void collectSpacingChildren(View view,List<View> found,int depth){if(depth>12||found.size()>=16)return;if(StatusBarIconSpacingSpec.independentChild(semanticId(view))&&!insets(view).isZero())found.add(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)collectSpacingChildren(((ViewGroup)view).getChildAt(i),found,depth+1);}
    static org.json.JSONArray marginDiagnostic(View child){MarginRecord record=MARGINS.get(child);return record==null?new org.json.JSONArray():new org.json.JSONArray(Arrays.asList(record.start,record.top,record.end,record.bottom,record.appliedStart,record.appliedTop,record.appliedEnd,record.appliedBottom));}
    private static boolean below(View child,View root){for(View at=child;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(at==root)return true;return false;}
    static void gridModeChanged(View root){
        for(ViewGroup owner:new ArrayList<>(COMPOSITES.keySet())){
            for(View at=owner;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
                if(at==root){refreshComposite(owner);break;}
        }
    }
    private static void observeChildren(ViewGroup parent,int depth){
        if(depth>12)return;
        for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);if(StatusBarIconSpacingSpec.independentChild(semanticId(child))||MARGINS.containsKey(child))observeIcon(child);if(child instanceof ViewGroup)observeChildren((ViewGroup)child,depth+1);}
    }
    private static int[] resizeChildren(ViewGroup parent,int depth){
        if(depth>12)return new int[]{0,0};int width=0,height=0;
        boolean horizontal=parent instanceof android.widget.LinearLayout&&((android.widget.LinearLayout)parent).getOrientation()==android.widget.LinearLayout.HORIZONTAL;
        boolean vertical=parent instanceof android.widget.LinearLayout&&!horizontal;
        for(int i=0;i<parent.getChildCount();i++){
            View child=parent.getChildAt(i);int[] nested=child instanceof ViewGroup?resizeChildren((ViewGroup)child,depth+1):new int[]{0,0};
            if(child.getVisibility()==View.GONE)continue;
            MarginRecord record=MARGINS.get(child);int x=nested[0],y=nested[1];
            if(record!=null&&record.applied&&child.getLayoutParams()==record.params){
                x+=Math.max(0,record.appliedStart-record.start)+Math.max(0,record.appliedEnd-record.end);
                y+=Math.max(0,record.appliedTop-record.top)+Math.max(0,record.appliedBottom-record.bottom);
            }
            width=horizontal?width+x:Math.max(width,x);height=vertical?height+y:Math.max(height,y);
        }
        ViewGroup.LayoutParams params=parent.getLayoutParams();SizeRecord previous=CHILD_BOXES.get(parent);
        if(params!=null){
            if(previous==null||previous.params!=params){previous=new SizeRecord(params);CHILD_BOXES.put(parent,previous);}
            previous.apply(parent,width,height,StatusBarGridHook.ownsIconLayout(parent));
        }
        return new int[]{width,height};
    }
    /** Fixed OEM boxes need the extra extent; WRAP_CONTENT already measures it. */
    private static final class SizeRecord{
        final ViewGroup.LayoutParams params;int width,height,appliedWidth,appliedHeight;boolean applied;
        boolean clipChildren,clipPadding,unclipped;
        SizeRecord(ViewGroup.LayoutParams params){this.params=params;width=params.width;height=params.height;}
        void apply(ViewGroup view,int extraWidth,int extraHeight,boolean grid){
            if(applied){if(params.width!=appliedWidth)width=params.width;if(params.height!=appliedHeight)height=params.height;}
            int nextWidth=width>0?width+extraWidth:width,nextHeight=height>0?height+extraHeight:height;
            if(params.width!=nextWidth||params.height!=nextHeight){params.width=nextWidth;params.height=nextHeight;view.requestLayout();}
            appliedWidth=nextWidth;appliedHeight=nextHeight;applied=true;
            // An EXACTLY-height bar may constrain the outer match-parent box.
            // Grid reserves the full content union and fits it within its safe
            // region; release only these inner clips, never native header clips.
            if(grid&&(extraWidth>0||extraHeight>0)){
                if(!unclipped){clipChildren=view.getClipChildren();clipPadding=view.getClipToPadding();unclipped=true;}
                view.setClipChildren(false);view.setClipToPadding(false);
            }else if(unclipped){if(!view.getClipChildren())view.setClipChildren(clipChildren);if(!view.getClipToPadding())view.setClipToPadding(clipPadding);unclipped=false;}
        }
    }
    static boolean zeroNativeMargins(View view){
        MarginRecord saved=MARGINS.get(view);if(saved!=null&&saved.params==view.getLayoutParams()){
            ViewGroup.MarginLayoutParams p=saved.params;
            int s=saved.applied&&p.getMarginStart()!=saved.appliedStart?p.getMarginStart():saved.start,e=saved.applied&&p.getMarginEnd()!=saved.appliedEnd?p.getMarginEnd():saved.end;
            int t=saved.applied&&p.topMargin!=saved.appliedTop?p.topMargin:saved.top,b=saved.applied&&p.bottomMargin!=saved.appliedBottom?p.bottomMargin:saved.bottom;
            return s==0&&e==0&&t==0&&b==0;
        }
        if(!(view.getLayoutParams() instanceof ViewGroup.MarginLayoutParams))return false;
        ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)view.getLayoutParams();return p.getMarginStart()==0&&p.getMarginEnd()==0&&p.topMargin==0&&p.bottomMargin==0;
    }
    static int nativeWidthLimit(ViewGroup view){
        SizeRecord saved=CHILD_BOXES.get(view);ViewGroup.LayoutParams p=view.getLayoutParams();
        if(saved!=null&&saved.params==p&&p.width==saved.appliedWidth&&saved.width>0)return Math.min(view.getWidth(),saved.width);
        return p!=null&&p.width>0?Math.min(view.getWidth(),p.width):view.getWidth();
    }
    static void restoreWifiAssetPair(ViewGroup parent,View signal,View activity){
        for(View child:new View[]{signal,activity}){MarginRecord record=MARGINS.remove(child);if(record!=null)record.restore(child);}
        ViewGroup owner=compositeOwner(signal);restoreChildBoxes(owner==null?parent:owner);
    }
    private static final class MarginRecord{
        final ViewGroup.MarginLayoutParams params;int left,top,right,bottom,start,end;boolean relative;int appliedStart,appliedTop,appliedEnd,appliedBottom;boolean applied;
        MarginRecord(ViewGroup.MarginLayoutParams params){this.params=params;capture();}
        void capture(){left=params.leftMargin;top=params.topMargin;right=params.rightMargin;bottom=params.bottomMargin;relative=params.isMarginRelative();start=params.getMarginStart();end=params.getMarginEnd();}
        void apply(View view,StatusBarIconSpacingSpec.Insets edge){
            applyPixels(view,Math.round(edge.start*density(view)),Math.round(edge.top*density(view)),Math.round(edge.end*density(view)),Math.round(edge.bottom*density(view)));
        }
        void applyPixels(View view,int extraStart,int extraTop,int extraEnd,int extraBottom){
            if(applied){
                // OEM may rewrite one edge during a density/configuration change.
                // Do not accidentally absorb our still-owned additions on the other edges.
                if(params.getMarginStart()!=appliedStart){start=params.getMarginStart();if(!relative){if(view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL)right=start;else left=start;}}
                if(params.getMarginEnd()!=appliedEnd){end=params.getMarginEnd();if(!relative){if(view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL)left=end;else right=end;}}
                if(params.topMargin!=appliedTop)top=params.topMargin;
                if(params.bottomMargin!=appliedBottom)bottom=params.bottomMargin;
            }
            int s=start+extraStart,t=top+extraTop,e=end+extraEnd,b=bottom+extraBottom;
            if(params.getMarginStart()!=s||params.topMargin!=t||params.getMarginEnd()!=e||params.bottomMargin!=b){params.setMarginStart(s);params.setMarginEnd(e);params.topMargin=t;params.bottomMargin=b;params.resolveLayoutDirection(view.getLayoutDirection());view.requestLayout();}
            appliedStart=s;appliedTop=t;appliedEnd=e;appliedBottom=b;applied=true;
        }
        void restore(View view){
            if(view.getLayoutParams()!=params||!applied)return;
            boolean ownStart=params.getMarginStart()==appliedStart,ownEnd=params.getMarginEnd()==appliedEnd;
            // Restore each edge we still own; a late OEM update to one edge must
            // neither be overwritten nor strand our additions on the other three.
            if(ownStart&&ownEnd&&!relative){params.setMarginStart(Integer.MIN_VALUE);params.setMarginEnd(Integer.MIN_VALUE);params.leftMargin=left;params.rightMargin=right;}
            else{if(ownStart)params.setMarginStart(start);if(ownEnd)params.setMarginEnd(end);}
            if(params.topMargin==appliedTop)params.topMargin=top;
            if(params.bottomMargin==appliedBottom)params.bottomMargin=bottom;
            params.resolveLayoutDirection(view.getLayoutDirection());view.requestLayout();
        }
    }
    static boolean hasChildWork(View view){
        if(view==null)return false;
        ConfigSnapshot snapshot=FeatureSettings.snapshot(view.getContext());
        if(!ConfigSchema.truthy(snapshot.get(ConfigSchema.SYSTEMUI_MASTER)))return false;
        String spacing=snapshot.get(StatusBarIconSpacingSpec.KEY),artwork=snapshot.get(StatusBarThemeSpec.KEY);
        return spacing!=null&&!spacing.isEmpty()||!ConfigSchema.truthy(snapshot.get(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY))&&artwork!=null&&!artwork.isEmpty();
    }
    static StatusBarIconSpacingSpec.Insets insets(View view){
        if(view==null||!FeatureSettings.enabled(view.getContext(),ConfigSchema.SYSTEMUI_MASTER)
                ||FeatureSettings.snapshot(view.getContext()).get(StatusBarIconSpacingSpec.KEY).isEmpty())return StatusBarIconSpacingSpec.ZERO;
        return insets(view,semanticId(view));
    }
    static StatusBarIconSpacingSpec.Insets insets(View view,String id){
        if(view==null||!FeatureSettings.enabled(view.getContext(),ConfigSchema.SYSTEMUI_MASTER))return StatusBarIconSpacingSpec.ZERO;
        String surface=StatusBarAssetsHook.surfaceFor(view);if(!StatusBarSurfaceSpec.valid(surface))return StatusBarIconSpacingSpec.ZERO;
        String raw=FeatureSettings.snapshot(view.getContext()).get(StatusBarIconSpacingSpec.KEY);
        if(!Objects.equals(raw,rawSpacing)){rawSpacing=raw;StatusBarIconSpacingSpec parsed=StatusBarIconSpacingSpec.parse(raw);cachedSpacing=parsed==null?StatusBarIconSpacingSpec.empty():parsed;}
        return cachedSpacing.resolve(surface,id);
    }
    static String semanticId(View view){
        if(view==null)return "";
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            if(at.getClass().getSimpleName().equals("NotificationIconContainer"))return "notifications";
            if(at!=view&&at.getClass().getSimpleName().equals("StatusIconContainer"))break;
        }
        return StatusBarAssetsHook.semanticId(view);
    }
    private static List<String> excluded(ViewGroup parent,boolean measuring){
        if(!FeatureSettings.enabled(parent.getContext(),ConfigSchema.SYSTEMUI_MASTER)
                ||!FeatureSettings.enabled(parent.getContext(),StatusBarIconOrderPolicy.ENABLED)
                ||FeatureSettings.enabled(parent.getContext(),ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY)
                ||!StatusBarSurfaceSpec.valid(StatusBarAssetsHook.surfaceFor(parent)))return Collections.emptyList();
        int limit=FeatureSettings.integer(parent.getContext(),StatusBarIconOrderPolicy.LIMIT,0,0,20);
        List<View> eligible=new ArrayList<>();int coreCount=0;float occupied=0;
        int gap=number(field(parent,"mIconSpacing"),0);
        for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);if(!eligible(parent,child))continue;eligible.add(child);if(!StatusBarIconOrderPolicy.hint(semanticId(child))){coreCount++;occupied+=extent(child)+gap;}}
        int originalMax=Integer.MAX_VALUE;
        if(Boolean.TRUE.equals(field(parent,"mShouldRestrictIcons")))originalMax=staticNumber(parent.getClass(),"MAX_ICONS",Integer.MAX_VALUE);
        int capacity=originalMax==Integer.MAX_VALUE?Integer.MAX_VALUE:Math.max(0,originalMax-coreCount);
        if(limit>0)capacity=Math.min(capacity,limit);
        // OEM adds spacing between cells, never after the final cell. Give back
        // that last gap when fitting per-cell (extent + gap) costs.
        float room=measuring||StatusBarGridHook.ownsIconLayout(parent)?Float.POSITIVE_INFINITY:Math.max(0,parent.getWidth()-parent.getPaddingLeft()-parent.getPaddingRight()-occupied+gap);
        List<View> ranked=StatusBarIconOrderPolicy.prioritize(eligible,StatusBarIconLayoutHook::semanticId,FeatureSettings.snapshot(parent.getContext()).get(StatusBarIconOrderPolicy.ORDER));
        Set<View> kept=StatusBarIconOrderPolicy.fitHints(eligible,StatusBarIconLayoutHook::semanticId,child->extent(child)+gap,FeatureSettings.snapshot(parent.getContext()).get(StatusBarIconOrderPolicy.ORDER),capacity,room);
        List<String> excluded=new ArrayList<>();for(View child:ranked)if(!kept.contains(child)){Object slot=invoke(child,"getSlot");if(slot instanceof String&&!excluded.contains(slot))excluded.add((String)slot);}
        if(!measuring){List<String> retained=new ArrayList<>();for(View child:kept)retained.add(semanticId(child));FeatureSettings.diagnostic(parent.getContext(),"ls_augment_statusbar_hint_priority_runtime","surface="+StatusBarAssetsHook.surfaceFor(parent)+";limit="+limit+";eligible="+ranked.size()+";retained="+String.join(",",retained)+";excluded="+String.join(",",excluded));}
        return excluded;
    }
    private static float extent(View view){
        int margin=0;try{if(!marginLookup){marginLookup=true;Class<?> adapt=Class.forName("com.zte.adapt.mifavor.statusbar.StatusIconContainerAdapt",false,view.getClass().getClassLoader());nativeMargin=adapt.getDeclaredMethod("getIconMarginEnd");nativeMargin.setAccessible(true);}if(nativeMargin!=null)margin=((Number)nativeMargin.invoke(null)).intValue();}catch(ReflectiveOperationException|RuntimeException ignored){}
        return Math.max(view.getMeasuredWidth(),view.getWidth())+view.getPaddingStart()+view.getPaddingEnd()+margin+(float)Math.ceil(insets(view).horizontal()*density(view));
    }
    private static boolean fitsOriginalBounds(ViewGroup parent){
        int count=0,gap=number(field(parent,"mIconSpacing"),0);float width=0;
        for(int i=0;i<parent.getChildCount();i++)if(eligible(parent,parent.getChildAt(i))){width+=extent(parent.getChildAt(i));count++;}
        if(Boolean.TRUE.equals(field(parent,"mShouldRestrictIcons"))&&count>staticNumber(parent.getClass(),"MAX_ICONS",Integer.MAX_VALUE))return false;
        return width+Math.max(0,count-1)*gap<=parent.getWidth()-parent.getPaddingLeft()-parent.getPaddingRight();
    }
    static boolean eligible(ViewGroup parent,View child){
        if(child.getVisibility()!=View.VISIBLE||!Boolean.TRUE.equals(invoke(child,"isIconVisible"))||Boolean.TRUE.equals(invoke(child,"isIconBlocked")))return false;
        Object ignored=field(parent,"mIgnoredSlots"),slot=invoke(child,"getSlot");
        return !(ignored instanceof Collection&&((Collection<?>)ignored).contains(slot))&&!StatusBarAssetsHook.hiddenByPolicy(child)&&!StatusBarAssetsHook.isHidden(child,semanticId(child));
    }
    private static void applyNativeInsets(ViewGroup parent){
        if(StatusBarGridHook.ownsIconLayout(parent))return;
        boolean rtl=parent.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;int changed=0;
        for(int i=0;i<parent.getChildCount();i++){
            View child=parent.getChildAt(i);StatusBarIconSpacingSpec.Insets insets=insets(child);if(insets.isZero())continue;
            Object state=null;try{state=parent.getClass().getDeclaredMethod("getViewStateFromChild",View.class).invoke(null,child);}catch(ReflectiveOperationException ignored){}
            if(state==null||number(field(state,"visibleState"),2)!=0||!eligible(parent,child))continue;
            Object x=invoke(state,"getXTranslation");if(x instanceof Number)invoke(state,"setXTranslation",((Number)x).floatValue()+(rtl?-1:1)*insets.start*density(child));
            applyY(parent,child,state,insets);
            changed++;
        }
        if(changed>0)FeatureSettings.diagnostic(parent.getContext(),"ls_augment_statusbar_icon_spacing_runtime","native;surface="+StatusBarAssetsHook.surfaceFor(parent)+";count="+changed+";rtl="+rtl);
    }
    private static void applyY(ViewGroup parent,View child,Object state,StatusBarIconSpacingSpec.Insets edge){
        Object y=invoke(state,"getYTranslation");if(!(y instanceof Number))return;
        float before=((Number)y).floatValue(),delta=(edge.top-edge.bottom)*density(child)/2f;
        float[] previous=Y_OFFSETS.get(child);if(previous!=null&&Math.abs(before-previous[1])<.01f)before=previous[0];
        float min=parent.getPaddingTop()-child.getTop(),max=parent.getHeight()-parent.getPaddingBottom()-child.getBottom();
        // An EXACTLY-height status bar cannot grow. Keep glyphs inside its measured bounds.
        float after=Math.max(min,Math.min(max,before+delta));
        invoke(state,"setYTranslation",after);Y_OFFSETS.put(child,new float[]{before,after});
    }
    private static void restoreNotificationX(ViewGroup parent,boolean viewToo){
        Object states=field(parent,"mIconStates");if(!(states instanceof Map))return;
        for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);float[] before=NOTIFICATION_X_OFFSETS.remove(child);if(before==null)continue;
            Object state=((Map<?,?>)states).get(child),x=invoke(state,"getXTranslation");if(x instanceof Number&&Math.abs(((Number)x).floatValue()-before[1])<.01f)invoke(state,"setXTranslation",before[0]);
            if(viewToo&&Math.abs(child.getTranslationX()-before[1])<.01f)child.setTranslationX(before[0]);
        }
    }
    private static void restoreY(ViewGroup parent){for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);float[] baseline=Y_OFFSETS.remove(child);if(baseline!=null&&Math.abs(child.getTranslationY()-baseline[1])<.01f)child.setTranslationY(baseline[0]);}}
    private static Object invoke(Object owner,String name,Object... args){
        if(owner==null)return null;
        String key=name+"/"+args.length;Map<String,Method> cached=METHODS.computeIfAbsent(owner.getClass(),unused->new HashMap<>());
        if(!cached.containsKey(key)){Method found=null;for(Class<?> type=owner.getClass();type!=null&&found==null;type=type.getSuperclass())for(Method m:type.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);found=m;break;}cached.put(key,found);}
        Method method=cached.get(key);try{return method==null?null:method.invoke(owner,args);}catch(ReflectiveOperationException|RuntimeException ignored){return null;}
    }
    private static int staticNumber(Class<?> type,String name,int fallback){try{Field value=type.getDeclaredField(name);value.setAccessible(true);return value.getInt(null);}catch(ReflectiveOperationException ignored){return fallback;}}
    private static int number(Object value,int fallback){return value instanceof Number?((Number)value).intValue():fallback;}
    private static float value(Object value){return value instanceof Number?((Number)value).floatValue():0;}
    private static float density(View view){return view.getResources().getDisplayMetrics().density;}
}
