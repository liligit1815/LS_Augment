package ls.augment.com.hook;

import android.content.res.Configuration;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSnapshot;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Preserve native scrolling/paging while sizing both RedMagic quick-settings layouts. */
final class ControlCenterGridHook {
    private static final String TYPE="com.zte.controlcenter.view.ControlCenterTileLayout";
    private static final String PAGER="com.zte.mifavor.qs.MfvPagedTileLayout";
    private static final String ADAPT="com.zte.adapt.mifavor.qs.MfvTileLayoutAdapt";
    private static final String CIRCLE="com.zte.qs.tileimpl.QSTileViewCircle";
    private static final String P="ls_augment_rm_qs_";
    private static final Map<View,State> STATES=new WeakHashMap<>();
    private static final Map<View,PagerState> PAGERS=new WeakHashMap<>();
    private static final Map<View,float[]> SCALES=new WeakHashMap<>();
    private ControlCenterGridHook(){ }

    static int install(AugmentModule module,ClassLoader loader){
        int count=hook(module,loader,TYPE,"onUpdateColumns",0,null,(owner,args,result)->{
            if(owner instanceof View&&regular((View)owner)){
                View view=(View)owner;
                if(FeatureSettings.enabled(view.getContext(),P+"grid"))
                    set(owner,"mColumns",FeatureSettings.integer(view.getContext(),P+(land(view)?"land_":"")+"columns",4,2,10));
            }
            return PASS;
        });
        count+=hook(module,loader,TYPE,"onAttachedToWindow",0,null,(owner,args,result)->{
            if(owner instanceof ViewGroup&&regular((View)owner)&&!STATES.containsKey(owner)){
                State state=new State((ViewGroup)owner);STATES.put((View)owner,state);state.attach();
            }
            return PASS;
        });
        count+=hook(module,loader,TYPE,"onDetachedFromWindow",0,null,(owner,args,result)->{
            State state=STATES.remove(owner);if(state!=null)state.detach();return PASS;
        });
        count+=hook(module,loader,ADAPT,"getCellWidth",1,null,(owner,args,result)->{
            View view=gridOwner(owner);
            return active(view)&&result instanceof Integer?fitWidth(view,(Integer)result):PASS;
        });
        count+=hook(module,loader,ADAPT,"getCellHeight",1,null,(owner,args,result)->{
            View view=gridOwner(owner);int width=view==null?0:dimension(view,"mifavor_qs_tile_width");
            return active(view)&&width>0&&result instanceof Integer
                    ?Math.max(1,Math.round((Integer)result*fitWidth(view,width)/(float)width)):PASS;
        });
        count+=hook(module,loader,CIRCLE,"onMeasure",2,(owner,args,result)->{
            View tile=(View)owner;
            if(tile.getParent() instanceof View&&active((View)tile.getParent())||QuickSettingsEditorHook.customTile(tile)){
                // Measure the complete native icon and label before scaling. Measuring
                // their fixed-size children against a narrow slot clips the contents.
                int width=dimension(tile,"mifavor_qs_tile_width"),height=dimension(tile,"mifavor_qs_wide_tile_height");
                if(width>0&&height>0){args[0]=View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY);args[1]=View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY);}
            }
            return PASS;
        },null);
        count+=hook(module,loader,TYPE,"onLayout",5,null,(owner,args,result)->{
            if(owner instanceof ViewGroup&&regular((View)owner))fitTiles((ViewGroup)owner);
            return PASS;
        });
        count+=hook(module,loader,"com.zte.mifavor.qs.MfvTileLayout","onLayout",5,null,(owner,args,result)->{
            if(owner instanceof ViewGroup&&"tile_page".equals(id((View)owner)))fitTiles((ViewGroup)owner);
            return PASS;
        });
        count+=hook(module,loader,PAGER,"onFinishInflate",0,null,(owner,args,result)->{
            if(owner instanceof ViewGroup&&!PAGERS.containsKey(owner)){
                PagerState state=new PagerState((ViewGroup)owner);PAGERS.put((View)owner,state);state.install();
            }
            return PASS;
        });
        return count;
    }

    private static View gridOwner(Object adapter){Object owner=field(adapter,"mOwner");return owner instanceof View?(View)owner:null;}
    private static boolean active(View view){return view!=null&&regular(view)&&FeatureSettings.enabled(view.getContext(),P+"grid");}
    private static int dimension(View view,String name){
        int resource=view.getResources().getIdentifier(name,"dimen","com.android.systemui");
        return resource==0?0:view.getResources().getDimensionPixelSize(resource);
    }
    private static int fitWidth(View view,int nativeWidth){
        int columns=FeatureSettings.integer(view.getContext(),P+(land(view)?"land_":"")+"columns",4,2,10);
        int width=view.getWidth();if(width<=0)width=view.getResources().getDisplayMetrics().widthPixels;
        Object start=field(field(field(view,"mAdapt"),"sQSPanelLayoutFeature"),"mCellMarginStart");
        int margin=start instanceof Integer?Math.max(0,(Integer)start):view.getPaddingLeft();
        int gap=Math.round(4*view.getResources().getDisplayMetrics().density);
        return Math.max(1,Math.min(nativeWidth,(width-2*margin-gap*(columns-1))/columns));
    }
    private static void fitTiles(ViewGroup grid){
        boolean enabled=active(grid);
        for(int i=0;i<grid.getChildCount();i++){
            View tile=grid.getChildAt(i);
            if(!CIRCLE.equals(tile.getClass().getName()))continue;
            if(enabled&&tile.getMeasuredWidth()>0){
                float[] saved=SCALES.get(tile);
                // Native appearance starts at 0.75 and settles at 1. Capturing
                // that transient scale would make size depend on rotation timing.
                if(saved==null){saved=new float[]{1,1,tile.getPivotX(),tile.getPivotY()};SCALES.put(tile,saved);}
                float scale=fitWidth(grid,tile.getMeasuredWidth())/(float)tile.getMeasuredWidth();
                // Native layout gives the tile a narrow slot. Retain that slot's
                // origin, but lay out native contents at their measured size so
                // the view transform scales both drawing and hit testing together.
                tile.layout(tile.getLeft(),tile.getTop(),tile.getLeft()+tile.getMeasuredWidth(),tile.getTop()+tile.getMeasuredHeight());
                tile.setPivotX(0);tile.setPivotY(0);tile.setScaleX(saved[0]*scale);tile.setScaleY(saved[1]*scale);
            }else restoreScale(tile);
        }
    }
    private static void restoreScale(View tile){
        float[] saved=SCALES.remove(tile);if(saved==null)return;
        tile.setScaleX(saved[0]);tile.setScaleY(saved[1]);tile.setPivotX(saved[2]);tile.setPivotY(saved[3]);
    }
    private static boolean regular(View view){String name=id(view);return "control_center_all_tiles".equals(name)||"tile_page".equals(name);}
    private static String id(View view){try{return view.getResources().getResourceEntryName(view.getId());}catch(Exception ignored){return "";}}
    private static boolean land(View view){return view.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;}

    /** The merged shade caches its pages. Refresh their native resources and
     * redistribution together; native page capacity keeps every tile reachable. */
    private static final class PagerState implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener {
        final WeakReference<ViewGroup> reference;
        final Runnable listener=this::refresh;
        ConfigSnapshot lastSnapshot;
        int lastWidth=-1,lastOrientation=-1;
        String signature="";
        boolean attached,refreshing;
        PagerState(ViewGroup view){reference=new WeakReference<>(view);}
        void install(){ViewGroup view=reference.get();if(view==null)return;view.addOnAttachStateChangeListener(this);if(view.isAttachedToWindow())onViewAttachedToWindow(view);}
        @Override public void onViewAttachedToWindow(View view){
            if(attached)return;attached=true;lastSnapshot=null;signature="";
            view.getViewTreeObserver().addOnPreDrawListener(this);FeatureSettings.addSnapshotListener(view.getContext(),listener);view.post(listener);
        }
        @Override public void onViewDetachedFromWindow(View view){
            attached=false;FeatureSettings.removeSnapshotListener(listener);view.getViewTreeObserver().removeOnPreDrawListener(this);
        }
        void refresh(){
            ViewGroup view=reference.get();if(view==null||!attached||refreshing)return;
            ConfigSnapshot snapshot=FeatureSettings.snapshot(view.getContext());int width=view.getWidth(),orientation=view.getResources().getConfiguration().orientation;
            if(snapshot==lastSnapshot&&width==lastWidth&&orientation==lastOrientation)return;
            lastSnapshot=snapshot;lastWidth=width;lastOrientation=orientation;
            String prefix=P+(land(view)?"land_":"");
            String next=snapshot.get(P+"grid")+'|'+snapshot.get(prefix+"columns")+'|'+snapshot.get(prefix+"rows")+'|'+width+'|'+orientation;
            if(next.equals(signature))return;signature=next;refreshing=true;
            try{call(view,"updateResources");set(view,"mDistributeTiles",true);view.requestLayout();}
            catch(ReflectiveOperationException error){FeatureSettings.diagnostic(view.getContext(),"ls_augment_rm_qs_pager_error",error.toString());}
            finally{refreshing=false;}
        }
        @Override public boolean onPreDraw(){
            refresh();Object pages=field(reference.get(),"mPages");
            if(pages instanceof Iterable<?>)for(Object page:(Iterable<?>)pages)if(page instanceof ViewGroup)fitTiles((ViewGroup)page);
            return true;
        }
    }

    private static final class State implements ViewTreeObserver.OnPreDrawListener {
        final WeakReference<ViewGroup> reference;
        final Runnable listener=this::refresh;
        WeakReference<View> viewport=new WeakReference<>(null);
        Integer originalHeight;
        String signature="";
        ConfigSnapshot lastSnapshot;
        int lastWidth=-1,lastOrientation=-1;
        boolean enabled,attached,refreshing;
        int rows=3;

        State(ViewGroup view){reference=new WeakReference<>(view);}
        void attach(){
            ViewGroup view=reference.get();if(view==null)return;attached=true;
            view.getViewTreeObserver().addOnPreDrawListener(this);
            FeatureSettings.addSnapshotListener(view.getContext(),listener);view.post(listener);
        }
        void refresh(){
            ViewGroup view=reference.get();if(!attached||view==null||refreshing)return;
            ConfigSnapshot snapshot=FeatureSettings.snapshot(view.getContext());
            int orientation=view.getResources().getConfiguration().orientation;
            if(snapshot==lastSnapshot&&view.getWidth()==lastWidth&&orientation==lastOrientation)return;
            lastSnapshot=snapshot;lastWidth=view.getWidth();lastOrientation=orientation;
            String prefix=P+(land(view)?"land_":"");
            String next=snapshot.get(P+"grid")+'|'+prefix+'|'+snapshot.get(prefix+"columns")+'|'+snapshot.get(prefix+"rows")+'|'+view.getWidth();
            if(next.equals(signature))return;
            signature=next;enabled="1".equals(snapshot.get(P+"grid"));rows=Integer.parseInt(snapshot.get(prefix+"rows"));
            refreshing=true;
            try{
                call(view,"updateResources");
                if(!enabled)restoreViewport();
                view.requestLayout();
            }catch(ReflectiveOperationException error){
                FeatureSettings.diagnostic(view.getContext(),"ls_augment_rm_qs_grid_error",error.toString());
            }finally{refreshing=false;}
        }
        @Override public boolean onPreDraw(){
            refresh();
            if(enabled){
                ViewGroup view=reference.get();
                // The panel's external appearance animator writes native scale=1
                // after layout. The configured tile size must also hold on those
                // frames; native opacity and movement continue to animate normally.
                if(view!=null)fitTiles(view);
                applyViewport();
            }
            return true;
        }
        void applyViewport(){
            ViewGroup view=reference.get();if(view==null||view.getHeight()==0)return;
            View scroller=view;int top=0;
            while(!"content_scroller".equals(id(scroller))){
                top+=scroller.getTop();
                if(!(scroller.getParent() instanceof View))return;
                scroller=(View)scroller.getParent();
            }
            if(!(scroller.getParent() instanceof ViewGroup)||scroller.getLayoutParams()==null)return;
            Object height=field(view,"mCellHeight"),margin=field(view,"mCellMarginVertical"),padding=field(view,"mCellMarginTop");
            if(!(height instanceof Integer)||!(margin instanceof Integer)||!(padding instanceof Integer))return;
            int available=((ViewGroup)scroller.getParent()).getHeight()-scroller.getTop();
            if(available<=0||(Integer)height<=0)return;
            // Keep all native tiles in the scroll content. Only limit the
            // viewport; dropping records would make the remaining tiles unreachable.
            int desired=Math.min(available,top+(Integer)padding+rows*(Integer)height+Math.max(0,rows-1)*(Integer)margin);
            if(viewport.get()!=scroller){restoreViewport();viewport=new WeakReference<>(scroller);originalHeight=scroller.getLayoutParams().height;}
            ViewGroup.LayoutParams params=scroller.getLayoutParams();
            if(params.height!=desired){params.height=desired;scroller.setLayoutParams(params);}
        }
        void restoreViewport(){
            View view=viewport.get();
            if(view!=null&&originalHeight!=null&&view.getLayoutParams()!=null){
                ViewGroup.LayoutParams params=view.getLayoutParams();if(params.height!=originalHeight){params.height=originalHeight;view.setLayoutParams(params);}
            }
            viewport=new WeakReference<>(null);originalHeight=null;
        }
        void detach(){
            attached=false;FeatureSettings.removeSnapshotListener(listener);restoreViewport();
            View view=reference.get();if(view!=null)view.getViewTreeObserver().removeOnPreDrawListener(this);
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)restoreScale(((ViewGroup)view).getChildAt(i));
        }
    }
}
