package ls.augment.com.hook;

import android.graphics.Rect;
import android.graphics.RectF;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import java.util.*;
import org.json.*;
import ls.augment.com.*;

/** NX809J CCHeaderView fixes status_icons_group to 42px; reserve real vertical space there. */
final class StatusBarHeaderSpacingHook {
    private static final String HEADER="com.zte.controlcenter.widget.CCHeaderView";
    private static final Map<ViewGroup,State> STATES=new WeakHashMap<>();
    private StatusBarHeaderSpacingHook(){}
    static int install(AugmentModule module,ClassLoader loader){
        int count=SystemUiAdapter.hookNamed(module,loader,"icon_spacing",HEADER,"updateHeaderResources",0,
                (o,a,r)->{State state=STATES.get(o);if(state!=null)state.prepareNative();return SystemUiAdapter.PASS;},
                (o,a,r)->{if(o instanceof ViewGroup)watch((ViewGroup)o);return SystemUiAdapter.PASS;});
        count+=SystemUiAdapter.hookNamed(module,loader,"icon_spacing",HEADER,"onAttachedToWindow",0,null,(o,a,r)->{watch((ViewGroup)o);return SystemUiAdapter.PASS;});
        count+=SystemUiAdapter.hookNamed(module,loader,"icon_spacing",HEADER,"updateVisibilities",0,null,(o,a,r)->{watch((ViewGroup)o);return SystemUiAdapter.PASS;});
        count+=SystemUiAdapter.hookNamed(module,loader,"icon_spacing",HEADER,"onDetachedFromWindow",0,(o,a,r)->{State state=STATES.remove(o);if(state!=null)state.close();return SystemUiAdapter.PASS;},null);
        return count;
    }
    static void refresh(View child){State state=stateFor(child,true);if(state!=null)state.refresh();}
    private static void watch(ViewGroup header){State state=STATES.get(header);if(state==null){state=new State(header);STATES.put(header,state);}state.refresh();}
    private static State stateFor(View child,boolean create){
        for(View at=child;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
            if(at.getClass().getName().equals(HEADER)){State state=STATES.get(at);if(state==null&&create){state=new State((ViewGroup)at);STATES.put((ViewGroup)at,state);}return state;}
        return null;
    }
    static StatusBarIconSpacingSpec.Insets bounded(View child,String id,StatusBarIconSpacingSpec.Insets requested){
        if(!StatusBarHeaderSpacingObservation.child(id)||requested.vertical()==0)return requested;
        State state=stateFor(child,true);if(state==null)return requested;
        int pixels=Math.round(requested.top*child.getResources().getDisplayMetrics().density)+Math.round(requested.bottom*child.getResources().getDisplayMetrics().density);
        // Keep the saved value. In a smaller profile, reject the entire vertical
        // pair instead of silently clipping a glyph or proportionally shrinking it.
        return state.capacity>=pixels?requested:new StatusBarIconSpacingSpec.Insets(requested.start,0,requested.end,0);
    }
    static boolean fitsVerticalPixels(View child,int pixels){State state=stateFor(child,true);return pixels==0||state==null||state.capacity>=pixels;}
    static int assetVerticalCapacity(View child){State state=stateFor(child,true);return state==null?-1:state.capacity;}
    private static View find(View root,String id){
        if(id.equals(name(root)))return root;if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){View result=find(((ViewGroup)root).getChildAt(i),id);if(result!=null)return result;}return null;
    }
    private static String name(View view){if(view.getId()==View.NO_ID||view.getId()==0)return "";try{return view.getResources().getResourceEntryName(view.getId());}catch(RuntimeException ignored){return "";}}
    private static boolean inside(View child,View parent){for(View at=child;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(at==parent)return true;return false;}
    private static final class State {
        final java.lang.ref.WeakReference<ViewGroup> header;
        java.lang.ref.WeakReference<ViewGroup> row=new java.lang.ref.WeakReference<>(null);
        ViewGroup.LayoutParams params;int nativeHeight,appliedHeight,capacity=-1;boolean applied,busy,awaitingNativeLayout,requestedVertical;
        long reportedAt,lastOccupancy;String signature="";
        final Rect occupancyVisible=new Rect();final int[] occupancyLocation=new int[2];final float[] occupancyMatrix=new float[9];
        final View.OnLayoutChangeListener layout=(v,l,t,r,b,ol,ot,or,ob)->{awaitingNativeLayout=false;refresh();};
        final android.view.ViewTreeObserver.OnPreDrawListener draw=this::beforeDraw;
        private boolean beforeDraw(){
            ViewGroup target=row.get(),root=header.get();if(root==null)return true;
            if(awaitingNativeLayout){awaitingNativeLayout=false;int before=params==null?0:params.height;refresh();return params==null||params.height==before;}
            if(target==null||!applied||!requestedVertical&&appliedHeight<=nativeHeight)return true;
            long current=occupancy(target,root);if(current==lastOccupancy)return true;
            lastOccupancy=current;int before=params==null?0:params.height;refresh();
            // A native visibility animation can occupy the same bounds without
            // a root layout callback. Re-measure before drawing a now-too-tall row.
            return params==null||params.height==before;
        }
        State(ViewGroup view){header=new java.lang.ref.WeakReference<>(view);view.addOnLayoutChangeListener(layout);view.getViewTreeObserver().addOnPreDrawListener(draw);}
        void refresh(){
            if(busy||awaitingNativeLayout)return;ViewGroup root=header.get();if(root==null)return;busy=true;
            try{
                View found=find(root,"status_icons_group");if(!(found instanceof ViewGroup))return;
                ViewGroup target=(ViewGroup)found;if(row.get()!=target){ViewGroup old=row.get();if(old!=null)old.removeOnLayoutChangeListener(layout);restoreNative();row=new java.lang.ref.WeakReference<>(target);target.addOnLayoutChangeListener(layout);params=null;}
                ViewGroup.LayoutParams live=target.getLayoutParams();if(live==null)return;
                if(params!=live){params=live;nativeHeight=live.height;applied=false;}
                else if(!applied||live.height!=appliedHeight){nativeHeight=live.height;applied=false;}
                if(nativeHeight<=0){capacity=0;StatusBarIconLayoutHook.refreshHeaderComposites(target);publish(root,target,0,0);return;}
                int safeHeight=safeHeight(target,root,nativeHeight),previousCapacity=capacity;capacity=safeHeight<0?-1:Math.max(0,safeHeight-nativeHeight);
                if(capacity<previousCapacity){reportedAt=0;signature="";} // A smaller limit must not wait for throttling.
                if(capacity<0)invalidateCapacity();
                if(!StatusBarIconLayoutHook.hasChildWork(target)){
                    // Capacity is still observed for the editor. Empty spacing
                    // does not need semantic discovery, margin reconciliation or
                    // another walk through every native signal/type view.
                    requestedVertical=false;
                    StatusBarIconLayoutHook.restoreInactiveComposites(target);
                    if(params.height!=nativeHeight){params.height=nativeHeight;target.requestLayout();}
                    appliedHeight=nativeHeight;applied=true;
                    publish(root,target,safeHeight,0);return;
                }
                StatusBarIconLayoutHook.refreshHeaderComposites(target);
                requestedVertical=false;for(View child:StatusBarIconLayoutHook.spacingChildren(target))if(StatusBarIconLayoutHook.insets(child).vertical()>0){requestedVertical=true;break;}
                int extra=StatusBarIconLayoutHook.headerExtraHeight(target);
                // Capacity was computed from native row placement and sibling
                // controls; no clip disabling, translations or glyph scaling.
                int requested=nativeHeight+Math.min(Math.max(0,capacity),Math.max(0,extra));
                if(params.height!=requested){params.height=requested;target.requestLayout();}
                appliedHeight=requested;applied=true;
                publish(root,target,safeHeight,extra);
            }finally{busy=false;}
        }
        private static int safeHeight(ViewGroup target,ViewGroup root,int nativeHeight){
            if(!(target.getParent() instanceof ViewGroup))return -1;ViewGroup parent=(ViewGroup)target.getParent();
            if(parent.getHeight()<=0||target.getWidth()<=0)return -1;
            RectF nativeBox=boxInRoot(target,root,nativeHeight);if(nativeBox==null||nativeBox.height()<=0)return -1;
            float unit=nativeBox.height()/nativeHeight,bottom=Float.POSITIVE_INFINITY;
            View branch=target;
            for(ViewGroup container=parent;;){
                RectF allocation=boxInRoot(container,root,container.getHeight()-container.getPaddingBottom());if(allocation==null)return -1;
                bottom=Math.min(bottom,allocation.bottom);
                for(int i=0;i<container.getChildCount();i++){
                    // INVISIBLE and alpha-zero still reserve layout space. Check
                    // ancestor-level date/time/privacy blocks too, not just footer.
                    View sibling=container.getChildAt(i);if(sibling==branch||sibling.getVisibility()==View.GONE||sibling.getWidth()<=0||sibling.getHeight()<=0)continue;
                    RectF occupied=boxInRoot(sibling,root,sibling.getHeight());if(occupied==null)continue;
                    if(occupied.right>nativeBox.left&&occupied.left<nativeBox.right){
                        if(occupied.top>=nativeBox.bottom)bottom=Math.min(bottom,occupied.top);
                        else if(occupied.bottom>nativeBox.top)bottom=Math.min(bottom,nativeBox.bottom);
                    }
                }
                if(container==root)break;branch=container;if(!(container.getParent() instanceof ViewGroup))return -1;container=(ViewGroup)container.getParent();
            }
            ViewGroup.LayoutParams layout=target.getLayoutParams();if(layout instanceof ViewGroup.MarginLayoutParams)bottom-=Math.max(0,((ViewGroup.MarginLayoutParams)layout).bottomMargin)*unit;
            float clockLimit=NotificationAppearanceHook.iconSpacingBottom(root);if(clockLimit>=0)bottom=Math.min(bottom,clockLimit);
            Rect visible=new Rect();if(root.getGlobalVisibleRect(visible)){int[] point=new int[2];root.getLocationOnScreen(point);bottom=Math.min(bottom,visible.bottom-point[1]);}
            return Math.max(nativeHeight,(int)Math.floor((bottom-nativeBox.top)/unit));
        }
        private static RectF boxInRoot(View view,ViewGroup root,int height){
            RectF box=new RectF(0,0,view.getWidth(),height);
            for(View at=view;at!=root;){if(!(at.getParent() instanceof View))return null;View parent=(View)at.getParent();at.getMatrix().mapRect(box);box.offset(at.getLeft()-parent.getScrollX(),at.getTop()-parent.getScrollY());at=parent;}
            return box;
        }
        private long occupancy(ViewGroup target,ViewGroup root){
            if(!(target.getParent() instanceof ViewGroup))return 0;ViewGroup parent=(ViewGroup)target.getParent();
            long value=target.getWidth();value=value*31+target.getHeight();value=value*31+target.getLeft();value=value*31+target.getTop();value=transformInput(value,target);
            if(target.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)value=value*31+((ViewGroup.MarginLayoutParams)target.getLayoutParams()).bottomMargin;
            View branch=target;for(ViewGroup container=parent;;){
                value=value*31+container.getWidth();value=value*31+container.getHeight();value=value*31+container.getPaddingBottom();
                value=value*31+container.getLeft();value=value*31+container.getTop();value=value*31+container.getScrollX();value=value*31+container.getScrollY();value=transformInput(value,container);
                for(int i=0;i<container.getChildCount();i++){View sibling=container.getChildAt(i);if(sibling==branch)continue;value=value*31+sibling.getVisibility();value=value*31+sibling.getLeft();value=value*31+sibling.getTop();value=value*31+sibling.getRight();value=value*31+sibling.getBottom();value=transformInput(value,sibling);}
                if(container==root||!(container.getParent() instanceof ViewGroup))break;branch=container;container=(ViewGroup)container.getParent();
            }
            value=value*31+Float.floatToIntBits(NotificationAppearanceHook.iconSpacingBottom(root));
            if(root.getGlobalVisibleRect(occupancyVisible)){root.getLocationOnScreen(occupancyLocation);value=value*31+occupancyVisible.bottom-occupancyLocation[1];}
            else value=value*31-1;
            return value;
        }
        private long transformInput(long value,View view){
            view.getMatrix().getValues(occupancyMatrix);
            for(float component:occupancyMatrix)value=value*31+Float.floatToIntBits(component);
            return value;
        }
        void prepareNative(){restoreNative();invalidateCapacity();awaitingNativeLayout=true;}
        void invalidateCapacity(){
            capacity=-1;signature="";reportedAt=0;ViewGroup root=header.get();if(root==null||root.getDisplay()==null)return;String surface=StatusBarAssetsHook.surfaceFor(root);
            if(surface.equals("control")||surface.equals("notification"))FeatureSettings.diagnostic(root.getContext(),StatusBarHeaderSpacingObservation.KEY+surface+"_"+root.getDisplay().getRotation(),"");
        }
        void restoreNative(){
            ViewGroup target=row.get();if(target!=null&&params==target.getLayoutParams()&&applied){
                if(params.height==appliedHeight){params.height=nativeHeight;target.requestLayout();}
                else if(params.height>0)nativeHeight=params.height;
                appliedHeight=params.height;applied=false;
            }
        }
        void close(){restoreNative();ViewGroup root=header.get(),target=row.get();if(root!=null){root.removeOnLayoutChangeListener(layout);if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(draw);}if(target!=null)target.removeOnLayoutChangeListener(layout);}
        void publish(ViewGroup root,ViewGroup target,int safeHeight,int extra){
            if(!root.isShown()||capacity<0||root.getDisplay()==null)return;
            long now=SystemClock.elapsedRealtime();float density=root.getResources().getDisplayMetrics().density;
            String surface=StatusBarAssetsHook.surfaceFor(root);if(!surface.equals("control")&&!surface.equals("notification"))return;
            String current=surface+":"+nativeHeight+":"+safeHeight+":"+extra+":"+target.getHeight()+":"+root.getDisplay().getRotation()+":"+density+":"+root.getResources().getConfiguration().fontScale+":"+root.getLayoutDirection()+":"+FeatureSettings.snapshot(root.getContext()).get(StatusBarIconSpacingSpec.KEY);
            if(now-reportedAt<1000||current.equals(signature)&&now-reportedAt<30_000)return;
            reportedAt=now;signature=current;
            // The Wi-Fi pair combines four independently rounded vertical edges.
            // Reserve two pixels so a legal shared budget also fits after rounding.
            int limit=Math.min(48,Math.max(0,(int)Math.floor((capacity-1.999f)/density)));
            StatusBarHeaderSpacingObservation observation=new StatusBarHeaderSpacingObservation(System.currentTimeMillis()-now,now,BuildConfig.VERSION_CODE,root.getDisplay().getDisplayId(),root.getDisplay().getRotation(),Math.round(density*1000),Math.round(root.getResources().getConfiguration().fontScale*1000),root.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0,limit);
            FeatureSettings.diagnostic(root.getContext(),StatusBarHeaderSpacingObservation.KEY+surface+"_"+root.getDisplay().getRotation(),observation.serialize());
            try{
                JSONObject detail=new JSONObject().put("surface",surface).put("nativeRowHeight",nativeHeight).put("capacityPx",capacity).put("maximumVerticalDp",limit).put("requestedExtra",extra).put("row",geometry(target));
                JSONArray children=new JSONArray();for(View child:StatusBarIconLayoutHook.spacingChildren(target)){
                    JSONObject item=geometry(child).put("id",StatusBarIconLayoutHook.semanticId(child)).put("requested",edge(StatusBarIconLayoutHook.insets(child))).put("appliedMargins",StatusBarIconLayoutHook.marginDiagnostic(child));
                    JSONArray parents=new JSONArray();for(View at=child.getParent() instanceof View?(View)child.getParent():null;at!=null&&inside(at,target);at=at.getParent() instanceof View?(View)at.getParent():null){parents.put(geometry(at));if(at==target)break;}
                    item.put("parents",parents);children.put(item);if(children.length()>=16)break;
                }
                detail.put("children",children);
                FeatureSettings.diagnostic(root.getContext(),"ls_augment_statusbar_header_spacing_geometry_"+surface,detail.toString());
            }catch(JSONException ignored){}
        }
        private static JSONArray edge(StatusBarIconSpacingSpec.Insets value){return new JSONArray(Arrays.asList(value.start,value.top,value.end,value.bottom));}
        private static JSONObject geometry(View view)throws JSONException{
            ViewGroup.LayoutParams params=view.getLayoutParams();int[] location=new int[2];view.getLocationOnScreen(location);Rect visible=new Rect();boolean shown=view.getGlobalVisibleRect(visible);
            JSONObject result=new JSONObject().put("resource",name(view)).put("class",view.getClass().getSimpleName()).put("lp",new JSONArray(Arrays.asList(params==null?0:params.width,params==null?0:params.height)))
                    .put("measured",new JSONArray(Arrays.asList(view.getMeasuredWidth(),view.getMeasuredHeight()))).put("layout",new JSONArray(Arrays.asList(view.getLeft(),view.getTop(),view.getRight(),view.getBottom())))
                    .put("globalOrigin",new JSONArray(Arrays.asList(location[0],location[1]))).put("visible",shown?visible.flattenToString():"").put("scale",new JSONArray(Arrays.asList(view.getScaleX(),view.getScaleY()))).put("translation",new JSONArray(Arrays.asList(view.getTranslationX(),view.getTranslationY())));
            if(params instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams margin=(ViewGroup.MarginLayoutParams)params;result.put("margins",new JSONArray(Arrays.asList(margin.getMarginStart(),margin.topMargin,margin.getMarginEnd(),margin.bottomMargin)));}
            if(view instanceof ViewGroup)result.put("clipChildren",((ViewGroup)view).getClipChildren()).put("clipPadding",((ViewGroup)view).getClipToPadding());
            return result;
        }
    }
}
