package ls.augment.com.hook;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Set;
import ls.augment.com.IslandVisualSpec;
import ls.augment.com.MagicIslandPolicy;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Reversible styling of a capability-checked fullscreen host. Native geometry still animates. */
final class IslandNativeSurface {
    private static final Map<View,IslandNativeSurface> SURFACES=new IdentityHashMap<>();
    private static final Set<Class<?>> DRAW_CONTRACTS=Collections.newSetFromMap(new IdentityHashMap<>());
    private final Context context;
    private final Object manager;
    private final View root,panelRoot,backdrop;
    private final Map<View,Snapshot> originals=new IdentityHashMap<>();
    private final Set<View> live=Collections.newSetFromMap(new IdentityHashMap<>());
    private final ViewTreeObserver.OnPreDrawListener draw=()->{refresh();return true;};
    private boolean closed,panelStyled;
    private View insetPanel;

    static int install(AugmentModule module,ClassLoader loader){
        int count=0;
        for(String name:new String[]{"DynamicIslandBackground"})try{
            Class<?> type=Class.forName("com.zte.feature.dynamicisland."+name,false,loader);
            if(!View.class.isAssignableFrom(type))continue;
            Method onDraw=MagicIslandScenes.exact(type,"onDraw",void.class,Canvas.class);
            // Keep the actual liquid material, sampling, light/dark palette and native animation.
            MagicIslandScenes.exact(type,"updatePathWithAnimatedSize",void.class);
            Field radius=MagicIslandScenes.typed(type,"cornerRadius",float.class);
            module.registerFeatureHook(module.prepareFeatureHook(onDraw,"island.surface."+name,false).intercept(chain->{
                Object target=chain.getThisObject();IslandNativeSurface owner=SURFACES.get(target);
                if(owner==null||!owner.active(target))return chain.proceed();
                float previousRadius=radius.getFloat(target);
                try{
                    radius.setFloat(target,Native12IslandStyle.dp(((View)target).getContext(),IslandVisualSpec.PANEL_RADIUS));
                    return chain.proceed();
                }finally{radius.setFloat(target,previousRadius);}
            }));
            DRAW_CONTRACTS.add(type);count++;
        }catch(Throwable missing){module.logFeatureError("ISLAND_SURFACE_CONTRACT_"+name,missing);}
        return count;
    }
    private static boolean drawable(View view){
        if(view==null)return false;
        for(Class<?> type:DRAW_CONTRACTS)if(type.isInstance(view))return true;
        return false;
    }
    IslandNativeSurface(Context context,Object manager)throws Exception{
        this.context=context;this.manager=manager;
        root=(View)MagicIslandScenes.typed(manager.getClass(),"mDynamicIslandRoot",View.class).get(manager);
        panelRoot=(View)MagicIslandScenes.typed(manager.getClass(),"mDynamicIslandPanelRoot",View.class).get(manager);
        backdrop=(View)MagicIslandScenes.typed(manager.getClass(),"mDynamicPanelBg",View.class).get(manager);
        if(root==null||panelRoot==null||!drawable(backdrop))throw new IllegalStateException("native_liquid_path_missing");
    }
    void start(){
        SURFACES.put(backdrop,this);
        root.getViewTreeObserver().addOnPreDrawListener(draw);panelRoot.getViewTreeObserver().addOnPreDrawListener(draw);
        refresh();
    }
    private boolean active(Object surface){
        return !closed&&FeatureSettings.enabled(context,SystemUiOptions.ISLAND)&&surface==backdrop&&panelStyled;
    }
    private String scene(Object island){
        if(!(island instanceof View))return null;
        if(DuoNotificationCards.ownsSurface(manager,island))return "duo";
        Object cards=field(manager,"mAppIslandList");
        if(cards instanceof Map)for(Map.Entry<?,?> entry:((Map<?,?>)cards).entrySet())if(entry.getValue()==island&&entry.getKey() instanceof String){
            String scene=MagicIslandPolicy.scene((String)entry.getKey());
            return scene!=null&&IslandSceneSelection.enabled(context,scene)?scene:null;
        }
        return null;
    }
    private boolean supported(String scene){
        // Business RemoteViews can own light surfaces. Keep those unverified layouts unchanged.
        return "duo".equals(scene)||"countdown".equals(scene)||"record".equals(scene)||"media".equals(scene)||"charging".equals(scene);
    }
    void refresh(){
        if(closed)return;
        live.clear();panelStyled=false;
        try{
            if(FeatureSettings.enabled(context,SystemUiOptions.ISLAND)){
                Object current=call(manager,"getPermanentIsland");
                Object expanded=field(manager,"mTempIsland");
                if(expanded==null)expanded=current;
                String compactScene=scene(current),panelScene=scene(expanded);
                if(supported(compactScene)){
                    styleTree((View)current,compactScene,false);
                    Object mini=call(current,"getSmallIsland");if(mini instanceof View)styleTree((View)mini,compactScene,false);
                }
                if(supported(panelScene)){
                    Object panel=call(expanded,"getPanelIsland");
                    if(panel instanceof View){
                        panelStyled=true;
                        View view=(View)panel;
                        if(!"duo".equals(panelScene)){
                            // Add breathing room once at the native wrapper, not inside source controls.
                            if("countdown".equals(panelScene)||"record".equals(panelScene)){
                                Snapshot saved=save(view);
                                int vertical=Native12IslandStyle.dp(context,10);
                                if(view.getPaddingTop()!=saved.top+vertical||view.getPaddingBottom()!=saved.bottom+vertical)
                                    view.setPadding(saved.left,saved.top+vertical,saved.right,saved.bottom+vertical);
                            }
                            styleTree(view,panelScene,true);
                        }
                        live.add(view);
                        if(insetPanel!=view){insetPanel=view;view.post(()->{
                            if(!closed&&insetPanel==view)try{call(manager,"updatePanelHeight",view);}catch(Exception ignored){}
                        });}
                    }
                }
            }
        }catch(Exception missing){FeatureRuntimeLog.state("ISLAND_SURFACE","unavailable",missing.getClass().getSimpleName());}
        for(View view:originals.keySet().toArray(new View[0]))if(!live.contains(view))originals.remove(view).restore(view);
        if(!panelStyled)insetPanel=null;
    }
    private Snapshot save(View view){live.add(view);return originals.computeIfAbsent(view,Snapshot::new);}
    private void styleTree(View view,String scene,boolean panel){
        save(view);String name=name(view);
        if(view instanceof TextView){
            TextView text=(TextView)view;
            boolean secondary=originals.get(view).secondary||panel&&(name.equals("title")&&"countdown".equals(scene)||name.equals("desc")
                    ||name.contains("second_text")||name.equals("display_text")&&"media".equals(scene)
                    ||name.contains("elapsed_time")||name.contains("total_time"));
            int color=secondary?Native12IslandStyle.secondary(context):Native12IslandStyle.foreground(context);
            if(text.getCurrentTextColor()!=color)text.setTextColor(color);
        }
        if(panel&&view instanceof ImageView&&(name.equals("reset")||name.equals("dismiss")
                ||name.equals("live_island_btn_tag")||name.equals("live_island_btn_resume_pause")
                ||name.contains("panel_prev")||name.contains("panel_next")||name.contains("panel_play"))){
            ImageView icon=(ImageView)view;ColorStateList tint=icon.getImageTintList();
            int color=Native12IslandStyle.foreground(context);
            if(tint==null||tint.getDefaultColor()!=color)icon.setImageTintList(ColorStateList.valueOf(color));
        }
        if(panel&&(name.equals("dynamic_icon_root")||name.equals("dynamic_icon_root_notification"))){
            Snapshot saved=originals.get(view);
            int fill=Native12IslandStyle.night(context)?0x26ffffff:0x14000000;
            if(saved.appliedBackground==null){GradientDrawable bg=new GradientDrawable();bg.setCornerRadius(Native12IslandStyle.dp(context,100));saved.appliedBackground=bg;}
            GradientDrawable bg=(GradientDrawable)saved.appliedBackground;
            if(bg.getColor()==null||bg.getColor().getDefaultColor()!=fill)bg.setColor(fill);
            if(view.getBackground()!=saved.appliedBackground)view.setBackground(saved.appliedBackground);
        }
        // Named native media fields also cover inherited and full-screen implementations.
        if(panel&&"media".equals(scene)){
            role(view,"mDisplayTitle",IslandVisualSpec.TITLE,false);
            role(view,"mDisplayText",IslandVisualSpec.DETAIL,true);
            for(String field:new String[]{"mPanelPrev","mPanelNext","mPanelPlayPause","mPanelFavorite","mPanelCast"}){
                Object control=field(view,field);if(control instanceof ImageView){ImageView image=(ImageView)control;save(image);
                    ColorStateList tint=image.getImageTintList();int color=Native12IslandStyle.foreground(context);
                    if(tint==null||tint.getDefaultColor()!=color)image.setImageTintList(ColorStateList.valueOf(color));}
            }
        }
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)styleTree(group.getChildAt(i),scene,panel);}
    }
    private void role(View owner,String field,int size,boolean secondary){
        Object value=field(owner,field);if(!(value instanceof TextView))return;
        TextView text=(TextView)value;save(text).secondary=secondary;int color=secondary?Native12IslandStyle.secondary(context):Native12IslandStyle.foreground(context);
        if(text.getCurrentTextColor()!=color)text.setTextColor(color);
        float px=size*context.getResources().getDisplayMetrics().scaledDensity;
        if(Math.abs(text.getTextSize()-px)>.1f)text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP,size);
    }
    private static String name(View view){try{return view.getId()==View.NO_ID?"":view.getResources().getResourceEntryName(view.getId());}catch(Exception missing){return "";}}
    private static final class Snapshot{
        final Drawable background;Drawable appliedBackground;boolean secondary;
        final boolean neutralText;
        final ColorStateList textColor,tint;final float textSize;final Typeface font;
        final int left,top,right,bottom;
        Snapshot(View view){background=view.getBackground();left=view.getPaddingLeft();top=view.getPaddingTop();right=view.getPaddingRight();bottom=view.getPaddingBottom();
            TextView text=view instanceof TextView?(TextView)view:null;textColor=text==null?null:text.getTextColors();textSize=text==null?0:text.getTextSize();font=text==null?null:text.getTypeface();
            neutralText=text!=null&&(text.getCurrentTextColor()==Native12IslandStyle.foreground(view.getContext())||text.getCurrentTextColor()==Native12IslandStyle.secondary(view.getContext()));
            secondary=text!=null&&text.getCurrentTextColor()==Native12IslandStyle.secondary(view.getContext())&&text.getCurrentTextColor()!=Native12IslandStyle.foreground(view.getContext());
            tint=view instanceof ImageView?((ImageView)view).getImageTintList():null;}
        void restore(View view){view.setBackground(background);view.setPadding(left,top,right,bottom);
            if(view instanceof TextView){TextView text=(TextView)view;
                if(neutralText)text.setTextColor(secondary?Native12IslandStyle.secondary(view.getContext()):Native12IslandStyle.foreground(view.getContext()));else text.setTextColor(textColor);
                text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,textSize);text.setTypeface(font);}
            if(view instanceof ImageView)((ImageView)view).setImageTintList(tint);}
    }
    void close(){closed=true;SURFACES.remove(backdrop);
        if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(draw);
        if(panelRoot.getViewTreeObserver().isAlive())panelRoot.getViewTreeObserver().removeOnPreDrawListener(draw);
        for(Map.Entry<View,Snapshot> entry:originals.entrySet())entry.getValue().restore(entry.getKey());originals.clear();live.clear();insetPanel=null;
        backdrop.invalidate();}
}
