package ls.augment.com.hook;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.ColorFilter;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ClipDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.ProgressBar;
import android.widget.SeekBar;
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
    private final View root,panelRoot,backdrop,compactBackdrop;
    private final IslandMediaLayout mediaLayout=new IslandMediaLayout();
    private final Map<View,Snapshot> originals=new IdentityHashMap<>();
    private final Set<View> live=Collections.newSetFromMap(new IdentityHashMap<>());
    private final ViewTreeObserver.OnPreDrawListener draw=()->{refresh();return true;};
    private boolean closed,panelStyled,compactStyled;
    private View insetPanel;

    static int install(AugmentModule module,ClassLoader loader){
        int count=0;
        for(String name:new String[]{"DynamicIslandBackground","StickyAnimationView"})try{
            Class<?> type=Class.forName("com.zte.feature.dynamicisland."+name,false,loader);
            if(!View.class.isAssignableFrom(type))continue;
            Method onDraw=MagicIslandScenes.exact(type,"onDraw",void.class,Canvas.class);
            // Select the OEM opaque branch; it draws the same animated paths, including both islands.
            MagicIslandScenes.exact(type,"drawBlackFill",void.class,Canvas.class,Path.class);
            MagicIslandScenes.exact(type,"drawBlackPath",void.class,Canvas.class,Path.class);
            Field glass=MagicIslandScenes.typed(type,"mGlassVisual",boolean.class);
            boolean panel="DynamicIslandBackground".equals(name);
            if(panel)MagicIslandScenes.exact(type,"updatePathWithAnimatedSize",void.class);
            Field radius=panel?MagicIslandScenes.typed(type,"cornerRadius",float.class):null;
            module.registerFeatureHook(module.prepareFeatureHook(onDraw,"island.surface."+name,false).intercept(chain->{
                Object target=chain.getThisObject();IslandNativeSurface owner=SURFACES.get(target);
                if(owner==null||!owner.active(target))return chain.proceed();
                float previousRadius=radius==null?0:radius.getFloat(target);
                boolean previousGlass=glass.getBoolean(target);
                try{
                    glass.setBoolean(target,false);
                    if(radius!=null)radius.setFloat(target,Native12IslandStyle.dp(((View)target).getContext(),IslandVisualSpec.PANEL_RADIUS));
                    return chain.proceed();
                }finally{glass.setBoolean(target,previousGlass);if(radius!=null)radius.setFloat(target,previousRadius);}
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
    static boolean blackSurfaceAvailable(Object manager,boolean panel){
        if(!(field(manager,"mDynamicIslandRoot") instanceof View)||!(field(manager,"mDynamicIslandPanelRoot") instanceof View))return false;
        Object surface=field(manager,panel?"mDynamicPanelBg":"mStickyAnimationView");
        return surface instanceof View&&drawable((View)surface);
    }
    IslandNativeSurface(Context context,Object manager)throws Exception{
        this.context=context;this.manager=manager;
        root=(View)MagicIslandScenes.typed(manager.getClass(),"mDynamicIslandRoot",View.class).get(manager);
        panelRoot=(View)MagicIslandScenes.typed(manager.getClass(),"mDynamicIslandPanelRoot",View.class).get(manager);
        backdrop=(View)MagicIslandScenes.typed(manager.getClass(),"mDynamicPanelBg",View.class).get(manager);
        Object sticky=field(manager,"mStickyAnimationView");
        compactBackdrop=sticky instanceof View&&drawable((View)sticky)?(View)sticky:null;
        if(root==null||panelRoot==null||!drawable(backdrop))throw new IllegalStateException("native_black_panel_path_missing");
        if(compactBackdrop==null)FeatureRuntimeLog.state("ISLAND_SURFACE_COMPACT","native","black_draw_contract_missing");
    }
    void start(){
        SURFACES.put(backdrop,this);
        if(compactBackdrop!=null)SURFACES.put(compactBackdrop,this);
        root.getViewTreeObserver().addOnPreDrawListener(draw);panelRoot.getViewTreeObserver().addOnPreDrawListener(draw);
        refresh();
    }
    private boolean active(Object surface){
        return !closed&&FeatureSettings.enabled(context,SystemUiOptions.ISLAND)
                &&(surface==backdrop&&panelStyled||surface==compactBackdrop&&compactStyled);
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
    private boolean supportedCompact(String scene){return scene!=null;}
    void refresh(){
        if(closed)return;
        boolean previousPanel=panelStyled,previousCompact=compactStyled;
        live.clear();panelStyled=false;compactStyled=false;
        try{
            if(FeatureSettings.enabled(context,SystemUiOptions.ISLAND)){
                Object current=call(manager,"getPermanentIsland");
                Object expanded=field(manager,"mTempIsland");
                if(expanded==null)expanded=current;
                String compactScene=scene(current),panelScene=scene(expanded);
                Object second=call(manager,"getSmallIsland");
                String secondScene=scene(second);
                compactStyled=compactBackdrop!=null&&supportedCompact(compactScene)&&(second==null||second==current||supportedCompact(secondScene));
                if(compactStyled){
                    restoreOwnedFallback(current);restoreOwnedFallback(second);
                    styleTree((View)current,compactScene,false);
                    Object mini=call(current,"getSmallIsland");if(mini instanceof View)styleTree((View)mini,compactScene,false);
                    if(second instanceof View&&second!=current){
                        styleTree((View)second,secondScene,false);
                        Object small=call(second,"getSmallIsland");if(small instanceof View)styleTree((View)small,secondScene,false);
                    }
                }else{
                    // Unknown neighbour remains native; only Duo's own card gets a contained opaque base.
                    if("duo".equals(compactScene))ownedFallback((View)current);
                    if(second!=current&&"duo".equals(secondScene))ownedFallback((View)second);
                }
                if(supported(panelScene)){
                    Object panel=call(expanded,"getPanelIsland");
                    if(panel instanceof View){
                        panelStyled=true;
                        View view=(View)panel;
                        {
                            // Add breathing room once at the native wrapper, not inside source controls.
                            if("countdown".equals(panelScene)||"record".equals(panelScene)){
                                Snapshot saved=save(view);saved.paddingChanged=true;
                                int vertical=Native12IslandStyle.dp(context,10);
                                if(view.getPaddingTop()!=saved.top+vertical||view.getPaddingBottom()!=saved.bottom+vertical)
                                    view.setPadding(saved.left,saved.top+vertical,saved.right,saved.bottom+vertical);
                            }
                            styleTree(view,panelScene,true);
                            if("media".equals(panelScene))mediaLayout.apply(view,()->{
                                if(!closed&&panelStyled)try{call(manager,"updatePanelHeight",view);}catch(Exception ignored){}
                            });else mediaLayout.clear();
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
        if(!panelStyled){insetPanel=null;mediaLayout.clear();}
        if(previousPanel!=panelStyled)backdrop.invalidate();
        if(previousCompact!=compactStyled&&compactBackdrop!=null)compactBackdrop.invalidate();
    }
    private Snapshot save(View view){live.add(view);return originals.computeIfAbsent(view,Snapshot::new);}
    private void ownedFallback(View view)throws Exception{
        styleTree(view,"duo",false);Snapshot saved=save(view);
        if(saved.appliedBackground==null)saved.appliedBackground=Native12IslandStyle.background(context,false);
        saved.backgroundChanged=true;if(view.getBackground()!=saved.appliedBackground)view.setBackground(saved.appliedBackground);
        Object small=call(view,"getSmallIsland");if(small instanceof View){View mini=(View)small;Snapshot icon=save(mini);
            if(icon.appliedBackground==null)icon.appliedBackground=Native12IslandStyle.background(context,false);
            icon.backgroundChanged=true;if(mini.getBackground()!=icon.appliedBackground)mini.setBackground(icon.appliedBackground);}
    }
    private void restoreOwnedFallback(Object value)throws Exception{
        if(!(value instanceof View))return;
        restoreFallbackBackground((View)value);Object small=call(value,"getSmallIsland");if(small instanceof View)restoreFallbackBackground((View)small);
    }
    private void restoreFallbackBackground(View view){Snapshot saved=originals.get(view);
        if(saved!=null&&saved.backgroundChanged){view.setBackground(saved.background);saved.backgroundChanged=false;}}
    private void styleTree(View view,String scene,boolean panel){
        save(view);String name=name(view);
        if(view instanceof TextView){
            originals.get(view).textChanged=true;
            TextView text=(TextView)view;
            boolean secondary="duo_island_lyric_secondary".equals(view.getTag())||originals.get(view).secondary||panel&&(name.equals("title")&&"countdown".equals(scene)||name.equals("desc")
                    ||name.contains("second_text")||name.equals("display_text")&&"media".equals(scene)
                    ||name.contains("elapsed_time")||name.contains("total_time"));
            int color=secondary?Native12IslandStyle.secondary(context):Native12IslandStyle.foreground(context);
            int current=text.getCurrentTextColor();
            if("duo".equals(scene)&&(current==IslandVisualSpec.INFORMATION||current==IslandVisualSpec.POSITIVE||current==IslandVisualSpec.TIMER||current==IslandVisualSpec.RECORDING))color=current;
            if(text.getCurrentTextColor()!=color)text.setTextColor(color);
        }
        if(panel&&view instanceof ImageView&&(name.equals("reset")||name.equals("dismiss")
                ||name.equals("live_island_btn_tag")||name.equals("live_island_btn_resume_pause")
                ||name.contains("panel_prev")||name.contains("panel_next")||name.contains("panel_play"))){
            ImageView icon=(ImageView)view;ColorStateList tint=icon.getImageTintList();
            originals.get(view).tintChanged=true;
            int color=Native12IslandStyle.foreground(context);
            if(tint==null||tint.getDefaultColor()!=color)icon.setImageTintList(ColorStateList.valueOf(color));
        }
        if(panel&&(name.equals("dynamic_icon_root")||name.equals("dynamic_icon_root_notification"))){
            Snapshot saved=originals.get(view);
            saved.backgroundChanged=true;
            int fill=IslandVisualSpec.CONTROL;
            if(saved.appliedBackground==null){GradientDrawable bg=new GradientDrawable();bg.setCornerRadius(Native12IslandStyle.dp(context,100));saved.appliedBackground=bg;}
            GradientDrawable bg=(GradientDrawable)saved.appliedBackground;
            if(bg.getColor()==null||bg.getColor().getDefaultColor()!=fill)bg.setColor(fill);
            if(view.getBackground()!=saved.appliedBackground)view.setBackground(saved.appliedBackground);
        }
        // Named native media fields also cover inherited and full-screen implementations.
        if(panel&&"duo".equals(scene)&&field(view,"mDisplayText") instanceof TextView&&field(view,"mDisplaySecondText") instanceof TextView){
            // The inner AppIslandPanel owns the inset. Its RemoteView wrapper must stay unpadded.
            Snapshot saved=save(view);saved.paddingChanged=true;int padding=Native12IslandStyle.dp(context,IslandVisualSpec.PANEL_PADDING);
            if(view.getPaddingLeft()!=padding||view.getPaddingTop()!=padding||view.getPaddingRight()!=padding||view.getPaddingBottom()!=padding)
                view.setPadding(padding,padding,padding,padding);
            role(view,"mDisplayText",IslandVisualSpec.TITLE,false);role(view,"mDisplaySecondText",IslandVisualSpec.DETAIL,true);
        }
        if(panel&&"media".equals(scene)){
            role(view,"mDisplayTitle",IslandVisualSpec.TITLE,false);
            role(view,"mDisplayText",IslandVisualSpec.DETAIL,true);
            role(view,"mElapsedTime",11,true);role(view,"mTotalTime",11,true);
            for(String field:new String[]{"mPanelPrev","mPanelNext","mPanelPlayPause","mPanelFavorite","mPanelCast"}){
                Object control=field(view,field);if(control instanceof ImageView){ImageView image=(ImageView)control;Snapshot saved=save(image);saved.tintChanged=true;saved.filterChanged=true;
                    boolean favorite="mPanelFavorite".equals(field)&&Boolean.TRUE.equals(field(view,"mIsFavorite"));
                    ColorStateList tint=image.getImageTintList();int color=favorite?IslandVisualSpec.RECORDING:Native12IslandStyle.foreground(context);
                    if(image.getColorFilter()!=null)image.clearColorFilter();
                    if(tint==null||tint.getDefaultColor()!=color)image.setImageTintList(ColorStateList.valueOf(color));}
            }
        }
        if("media".equals(scene))for(String field:new String[]{"mMusicWaveView","mMusicWaveSmallView"}){
            Object wave=field(view,field);if(wave instanceof View){Snapshot saved=save((View)wave);saved.wave((View)wave);}
        }
        if(view instanceof ProgressBar){
            originals.get(view).progressChanged=true;
            ProgressBar bar=(ProgressBar)view;
            if("media".equals(scene)&&bar instanceof SeekBar)originals.get(view).opaqueProgress(bar);
            int accent="media".equals(scene)?IslandVisualSpec.MUSIC:IslandVisualSpec.INFORMATION;
            tintProgress(bar,accent);
        }
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)styleTree(group.getChildAt(i),scene,panel);}
    }
    private static void tintProgress(ProgressBar bar,int color){
        if(bar.getProgressTintList()==null||bar.getProgressTintList().getDefaultColor()!=color){
            bar.setProgressTintList(ColorStateList.valueOf(color));bar.setIndeterminateTintList(ColorStateList.valueOf(color));
        }
        if(bar.getProgressBackgroundTintList()==null||bar.getProgressBackgroundTintList().getDefaultColor()!=IslandVisualSpec.TRACK)
            bar.setProgressBackgroundTintList(ColorStateList.valueOf(IslandVisualSpec.TRACK));
        if(bar instanceof SeekBar){SeekBar seek=(SeekBar)bar;
            if(seek.getThumbTintList()==null||seek.getThumbTintList().getDefaultColor()!=IslandVisualSpec.PRIMARY)
                seek.setThumbTintList(ColorStateList.valueOf(IslandVisualSpec.PRIMARY));}
    }
    private void role(View owner,String field,int size,boolean secondary){
        Object value=field(owner,field);if(!(value instanceof TextView))return;
        TextView text=(TextView)value;Snapshot saved=save(text);saved.secondary=secondary;saved.textChanged=true;int color=secondary?Native12IslandStyle.secondary(context):Native12IslandStyle.foreground(context);
        if(text.getCurrentTextColor()!=color)text.setTextColor(color);
        float px=android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,size,context.getResources().getDisplayMetrics());
        if(Math.abs(text.getTextSize()-px)>.1f)text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP,size);
        Typeface font=Typeface.create(secondary?"sans-serif":"sans-serif-medium",Typeface.NORMAL);
        if(!font.equals(text.getTypeface()))text.setTypeface(font);
    }
    private static String name(View view){try{return view.getId()==View.NO_ID?"":view.getResources().getResourceEntryName(view.getId());}catch(Exception missing){return "";}}
    private static final class Snapshot{
        final Drawable background;Drawable appliedBackground;boolean secondary;
        boolean backgroundChanged,paddingChanged,textChanged,tintChanged,filterChanged,progressChanged;
        final ColorStateList textColor,tint;final float textSize;final Typeface font;
        final ColorFilter filter;
        final ColorStateList progress,track,indeterminate,thumb;
        final Drawable originalProgress;Drawable appliedProgress;
        Method waveColors;Field waveTop,waveBottom;int oldWaveTop,oldWaveBottom;boolean waveChecked;
        final int left,top,right,bottom;
        Snapshot(View view){background=view.getBackground();left=view.getPaddingLeft();top=view.getPaddingTop();right=view.getPaddingRight();bottom=view.getPaddingBottom();
            TextView text=view instanceof TextView?(TextView)view:null;textColor=text==null?null:text.getTextColors();textSize=text==null?0:text.getTextSize();font=text==null?null:text.getTypeface();
            secondary=text!=null&&text.getCurrentTextColor()==Native12IslandStyle.secondary(view.getContext())&&text.getCurrentTextColor()!=Native12IslandStyle.foreground(view.getContext());
            tint=view instanceof ImageView?((ImageView)view).getImageTintList():null;
            filter=view instanceof ImageView?((ImageView)view).getColorFilter():null;
            ProgressBar bar=view instanceof ProgressBar?(ProgressBar)view:null;
            originalProgress=bar==null?null:bar.getProgressDrawable();
            progress=bar==null?null:bar.getProgressTintList();track=bar==null?null:bar.getProgressBackgroundTintList();
            indeterminate=bar==null?null:bar.getIndeterminateTintList();thumb=view instanceof SeekBar?((SeekBar)view).getThumbTintList():null;}
        void opaqueProgress(ProgressBar bar){
            if(appliedProgress==null){
                GradientDrawable trackShape=new GradientDrawable(),fill=new GradientDrawable();
                float radius=Native12IslandStyle.dp(bar.getContext(),2);
                trackShape.setColor(IslandVisualSpec.TRACK);trackShape.setCornerRadius(radius);
                fill.setColor(IslandVisualSpec.MUSIC);fill.setCornerRadius(radius);
                LayerDrawable layers=new LayerDrawable(new Drawable[]{trackShape,new ClipDrawable(fill,android.view.Gravity.START,ClipDrawable.HORIZONTAL)});
                layers.setId(0,android.R.id.background);layers.setId(1,android.R.id.progress);
                // A 44dp seek target must not stretch the visible track, including at large font scales.
                int thickness=Native12IslandStyle.dp(bar.getContext(),4);
                for(int i=0;i<2;i++){
                    layers.setLayerHeight(i,thickness);
                    layers.setLayerGravity(i,android.view.Gravity.FILL_HORIZONTAL|android.view.Gravity.CENTER_VERTICAL);
                }
                appliedProgress=layers;
            }
            // OEM layer alpha survives tinting. Keep the native SeekBar and listener, replace only its ink.
            if(bar.getProgressDrawable()!=appliedProgress)bar.setProgressDrawable(appliedProgress);
        }
        void wave(View view){try{
            if(!waveChecked){waveChecked=true;
                Method colors=MagicIslandScenes.exact(view.getClass(),"applyColors",void.class,int.class,int.class);
                Field top=MagicIslandScenes.typed(view.getClass(),"topColor",int.class),bottom=MagicIslandScenes.typed(view.getClass(),"bottomColor",int.class);
                oldWaveTop=top.getInt(view);oldWaveBottom=bottom.getInt(view);waveTop=top;waveBottom=bottom;waveColors=colors;
            }
            if(waveColors!=null&&(waveTop.getInt(view)!=IslandVisualSpec.MUSIC||waveBottom.getInt(view)!=IslandVisualSpec.MUSIC))
                waveColors.invoke(view,IslandVisualSpec.MUSIC,IslandVisualSpec.MUSIC);
        }catch(Exception missing){FeatureRuntimeLog.state("ISLAND_WAVE_COLOR","native",missing.getClass().getSimpleName());}}
        void restore(View view){if(backgroundChanged)view.setBackground(background);if(paddingChanged)view.setPadding(left,top,right,bottom);
            if(waveColors!=null)try{waveColors.invoke(view,oldWaveTop,oldWaveBottom);}catch(Exception ignored){}
            if(textChanged&&view instanceof TextView){TextView text=(TextView)view;
                text.setTextColor(textColor);
                text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,textSize);text.setTypeface(font);}
            if(tintChanged&&view instanceof ImageView)((ImageView)view).setImageTintList(tint);
            if(filterChanged&&view instanceof ImageView)((ImageView)view).setColorFilter(filter);
            if(progressChanged&&view instanceof ProgressBar){ProgressBar bar=(ProgressBar)view;bar.setProgressTintList(progress);bar.setProgressBackgroundTintList(track);bar.setIndeterminateTintList(indeterminate);}
            if(appliedProgress!=null&&view instanceof ProgressBar&&((ProgressBar)view).getProgressDrawable()==appliedProgress)((ProgressBar)view).setProgressDrawable(originalProgress);
            if(progressChanged&&view instanceof SeekBar)((SeekBar)view).setThumbTintList(thumb);}
    }
    void close(){closed=true;SURFACES.remove(backdrop);
        if(compactBackdrop!=null)SURFACES.remove(compactBackdrop);mediaLayout.clear();
        if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(draw);
        if(panelRoot.getViewTreeObserver().isAlive())panelRoot.getViewTreeObserver().removeOnPreDrawListener(draw);
        for(Map.Entry<View,Snapshot> entry:originals.entrySet())entry.getValue().restore(entry.getKey());originals.clear();live.clear();insetPanel=null;
        backdrop.invalidate();if(compactBackdrop!=null)compactBackdrop.invalidate();}
}
