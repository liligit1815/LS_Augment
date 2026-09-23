package ls.augment.com.hook;

import android.content.res.Configuration;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSnapshot;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Native tile editor uses fixed-size frames and caches its adapter's column count. */
final class QuickSettingsEditorHook {
    private static final String CONTROLLER="com.zte.controlcenter.CCCustomizerController";
    private static final String TILE="com.android.systemui.qs.customize.CustomizeTileView";
    private static final String P="ls_augment_rm_qs_";
    private static final Map<Object,State> STATES=new WeakHashMap<>();
    private static final Map<View,int[]> FRAMES=new WeakHashMap<>();
    private QuickSettingsEditorHook(){ }

    static int install(AugmentModule module,ClassLoader loader){
        int count=hook(module,loader,CONTROLLER,"onViewAttached",0,null,(owner,args,result)->{
            Object root=field(owner,"mView"),adapter=field(owner,"mTileAdapter");
            Object list=call(root,"getRecyclerView");
            if(list instanceof ViewGroup&&!STATES.containsKey(owner)){
                State state=new State((ViewGroup)list,adapter);STATES.put(owner,state);state.attach();
            }
            return PASS;
        });
        count+=hook(module,loader,CONTROLLER,"onViewDetached",0,null,(owner,args,result)->{
            State state=STATES.remove(owner);if(state!=null)state.detach();return PASS;
        });
        count+=hook(module,loader,"com.android.systemui.qs.customize.TileAdapter","onCreateViewHolder",2,null,(owner,args,result)->{
            Object frame=field(result,"itemView");
            if(frame instanceof ViewGroup&&args[0] instanceof ViewGroup)fitFrame((ViewGroup)frame,(ViewGroup)args[0]);
            return PASS;
        });
        count+=hook(module,loader,"com.zte.feature.qs.layout.QsCustomizerModule","updateTileAdapterResource",0,null,(owner,args,result)->{
            Object root=field(owner,"mQSCustomizer"),list=call(root,"getRecyclerView"),padding=field(owner,"mGridpadding");
            if(list instanceof ViewGroup&&padding instanceof Integer&&FeatureSettings.enabled(((View)list).getContext(),P+"grid")){
                ViewGroup view=(ViewGroup)list;int width=dimension(view,"mifavor_qs_tile_width");
                if(width>0&&view.getWidth()>0)set(owner,"mGridpadding",Math.max(0,(Integer)padding+(width-cellWidth(view,width))/2));
            }
            return PASS;
        });
        return count;
    }
    static boolean customTile(View view){return TILE.equals(view.getClass().getName())&&FeatureSettings.enabled(view.getContext(),P+"grid");}
    private static int dimension(View view,String name){int id=view.getResources().getIdentifier(name,"dimen","com.android.systemui");return id==0?0:view.getResources().getDimensionPixelSize(id);}
    private static int cellWidth(ViewGroup list,int nativeWidth){
        boolean land=list.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;
        int columns=FeatureSettings.integer(list.getContext(),P+(land?"land_":"")+"edit_columns",land?6:4,2,10);
        int gap=Math.round(4*list.getResources().getDisplayMetrics().density);
        int available=list.getWidth()-list.getPaddingLeft()-list.getPaddingRight();
        return Math.max(1,Math.min(nativeWidth,available/columns-gap));
    }
    private static void fitFrame(ViewGroup frame,ViewGroup list){
        View tile=null;
        for(int i=0;i<frame.getChildCount();i++)if(TILE.equals(frame.getChildAt(i).getClass().getName())){tile=frame.getChildAt(i);break;}
        if(tile==null||frame.getLayoutParams()==null)return;
        if(!customTile(tile)){restoreFrame(frame);return;}
        int nativeWidth=dimension(tile,"mifavor_qs_tile_width"),nativeHeight=dimension(tile,"mifavor_qs_wide_tile_height");
        if(nativeWidth<=0||nativeHeight<=0||list.getWidth()<=0)return;
        int width=cellWidth(list,nativeWidth);
        float scale=width/(float)nativeWidth;
        ViewGroup.LayoutParams params=frame.getLayoutParams();
        if(!FRAMES.containsKey(frame))FRAMES.put(frame,new int[]{params.width,params.height});
        int height=Math.round(nativeHeight*scale);
        if(params.width!=width||params.height!=height){params.width=width;params.height=height;frame.setLayoutParams(params);}
        tile.setPivotX(0);tile.setPivotY(0);tile.setScaleX(scale);tile.setScaleY(scale);
    }
    private static void restoreFrame(ViewGroup frame){
        int[] saved=FRAMES.remove(frame);if(saved==null||frame.getLayoutParams()==null)return;
        ViewGroup.LayoutParams params=frame.getLayoutParams();params.width=saved[0];params.height=saved[1];frame.setLayoutParams(params);
        for(int i=0;i<frame.getChildCount();i++){
            View tile=frame.getChildAt(i);if(TILE.equals(tile.getClass().getName())){
                tile.setScaleX(1);tile.setScaleY(1);
                // During off/rotation, native onMeasure can report its fixed
                // outer size while its label was measured against the old small
                // frame. Force those inner contents to measure at restored width.
                tile.requestLayout();
            }
        }
        // TextView's running marquee can retain a ghost offset from the narrow
        // layout even after measurement is repaired. Restart only native marquee
        // labels after the restored layout has completed.
        WeakReference<ViewGroup> reference=new WeakReference<>(frame);
        ViewTreeObserver observer=frame.getViewTreeObserver();
        observer.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener(){
            @Override public boolean onPreDraw(){
                if(observer.isAlive())observer.removeOnPreDrawListener(this);
                ViewGroup view=reference.get();
                if(view!=null){
                    ViewTreeObserver current=view.getViewTreeObserver();
                    if(current!=observer&&current.isAlive())current.removeOnPreDrawListener(this);
                    if(view.isAttachedToWindow())resetMarquee(view);
                }
                return true;
            }
        });
    }
    private static void resetMarquee(View view){
        if(view instanceof TextView&&view.isSelected()&&((TextView)view).getEllipsize()==TextUtils.TruncateAt.MARQUEE){view.setSelected(false);view.setSelected(true);}
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)resetMarquee(((ViewGroup)view).getChildAt(i));
    }
    private static final class State implements ViewTreeObserver.OnPreDrawListener {
        final WeakReference<ViewGroup> list;
        final WeakReference<Object> adapter;
        final Runnable listener=this::refresh;
        ConfigSnapshot lastSnapshot;
        int lastOrientation=-1,lastWidth=-1;
        String signature="";
        boolean attached,refreshing;
        State(ViewGroup list,Object adapter){this.list=new WeakReference<>(list);this.adapter=new WeakReference<>(adapter);}
        void attach(){
            ViewGroup view=list.get();if(view==null)return;attached=true;
            view.getViewTreeObserver().addOnPreDrawListener(this);FeatureSettings.addSnapshotListener(view.getContext(),listener);view.post(listener);
        }
        void refresh(){
            ViewGroup view=list.get();Object target=adapter.get();if(view==null||target==null||!attached||refreshing)return;
            ConfigSnapshot snapshot=FeatureSettings.snapshot(view.getContext());int orientation=view.getResources().getConfiguration().orientation;
            if(lastSnapshot==snapshot&&lastWidth==view.getWidth()&&lastOrientation==orientation)return;
            lastSnapshot=snapshot;lastWidth=view.getWidth();lastOrientation=orientation;
            String prefix=P+(orientation==Configuration.ORIENTATION_LANDSCAPE?"land_":"");
            String next=snapshot.get(P+"grid")+'|'+snapshot.get(prefix+"edit_columns")+'|'+orientation+'|'+lastWidth;
            if(next.equals(signature))return;signature=next;refreshing=true;
            try{
                // Keep the adapter, full-width section headers and layout manager
                // in agreement. Replacing only the layout's span count breaks drag.
                call(target,"updateNumColumns");Object columns=call(target,"getNumColumns"),layout=call(view,"getLayoutManager");
                if(columns instanceof Integer&&layout!=null)call(layout,"setSpanCount",columns);
                Object feature=field(call(target,"getAdapt"),"sQSPanelLayoutFeature"),customizer=field(feature,"mQsCustomizerModule");
                if(customizer!=null)call(customizer,"updateTileAdapterResource");
                call(view,"invalidateItemDecorations");call(target,"notifyDataSetChanged");view.requestLayout();
            }catch(ReflectiveOperationException error){FeatureSettings.diagnostic(view.getContext(),"ls_augment_rm_qs_editor_error",error.toString());}
            finally{refreshing=false;}
        }
        @Override public boolean onPreDraw(){
            refresh();ViewGroup view=list.get();
            if(view!=null)for(int i=0;i<view.getChildCount();i++)if(view.getChildAt(i) instanceof ViewGroup)fitFrame((ViewGroup)view.getChildAt(i),view);
            return true;
        }
        void detach(){
            attached=false;FeatureSettings.removeSnapshotListener(listener);ViewGroup view=list.get();if(view==null)return;
            view.getViewTreeObserver().removeOnPreDrawListener(this);
            for(int i=0;i<view.getChildCount();i++)if(view.getChildAt(i) instanceof ViewGroup)restoreFrame((ViewGroup)view.getChildAt(i));
        }
    }
}
