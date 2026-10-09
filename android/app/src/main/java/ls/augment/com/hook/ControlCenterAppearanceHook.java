package ls.augment.com.hook;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.*;
import android.graphics.drawable.*;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.util.*;
import ls.augment.com.ControlCenterAppearanceOptions;
import ls.augment.com.ControlCenterAppearancePolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;
import static ls.augment.com.ControlCenterAppearanceOptions.*;

/** Targets audited RedMagic controls only. The parent panel, hit regions and gestures remain native. */
final class ControlCenterAppearanceHook {
    static final String PANEL="com.zte.controlcenter.view.ControlCenterPanelView";
    static final String WIDE="com.zte.qs.tileimpl.QSTileViewWide", CIRCLE="com.zte.qs.tileimpl.QSTileViewCircle";
    static final String MEDIA_VIEW="com.zte.controlcenter.view.ControlCenterMediaPlayerView";
    private static final Map<View,State> STATES=new WeakHashMap<>();
    private static final Map<View,Boolean> DISABLED=new WeakHashMap<>();
    private ControlCenterAppearanceHook() { }
    static int install(AugmentModule module,ClassLoader loader){
        int count=hookNamed(module,loader,"cc_appearance",PANEL,"onFinishInflate",0,null,(owner,args,result)->{if(owner instanceof View)watch((View)owner);return PASS;});
        count+=hookNamed(module,loader,"cc_appearance",PANEL,"dispatchDraw",1,(owner,args,result)->{if(owner instanceof View)watch((View)owner).prepare();return PASS;},null);
        // Color animations can invalidate just a child; repaint after OEM state/theme changes too.
        for(String type:new String[]{WIDE,CIRCLE,"com.zte.qs.tileimpl.QSTileViewBase"})
            for(String method:new String[]{"handleStateChanged","updateResources","setGradientBackColors"}){
                if("setGradientBackColors".equals(method)&&!"com.zte.qs.tileimpl.QSTileViewBase".equals(type))continue;
                count+=hookNamed(module,loader,"cc_appearance",type,method,-1,null,(owner,args,result)->{if(owner instanceof View){if(args.length==1&&"handleStateChanged".equals(method))DISABLED.put((View)owner,Boolean.TRUE.equals(field(args[0],"disabledByPolicy")));changedTile((View)owner);}return PASS;});
            }
        return count+ControlCenterMediaAppearanceHook.install(module,loader);
    }
    /** Glass calls this before binding, so one renderer owns each material at a time. */
    static boolean ownsMaterial(View view,View owner,boolean slider){
        if(view==null||owner==null)return false;
        Context c=view.getContext();String type=owner.getClass().getName();
        if(slider)return FeatureSettings.enabled(c,CORNERS);
        if(WIDE.equals(type)||CIRCLE.equals(type))return FeatureSettings.enabled(c,CORNERS)||FeatureSettings.enabled(c,TILES);
        return MEDIA_VIEW.equals(type)&&(FeatureSettings.enabled(c,CORNERS)||FeatureSettings.enabled(c,MEDIA));
    }
    static boolean inPanel(View view){for(View at=view;at!=null;){if(PANEL.equals(at.getClass().getName()))return true;ViewParent p=at.getParent();at=p instanceof View?(View)p:null;}return false;}
    private static void changedTile(View tile){for(View at=tile;at!=null;){State state=STATES.get(at);if(state!=null){state.prepare();return;}ViewParent p=at.getParent();at=p instanceof View?(View)p:null;}}
    private static State watch(View view){State s=STATES.get(view);if(s==null){s=new State(view);STATES.put(view,s);view.addOnAttachStateChangeListener(s);}if(view.isAttachedToWindow())s.attach();return s;}
    static void setBackground(View view,Drawable drawable){int l=view.getPaddingLeft(),t=view.getPaddingTop(),r=view.getPaddingRight(),b=view.getPaddingBottom();view.setBackground(drawable);if(l!=view.getPaddingLeft()||t!=view.getPaddingTop()||r!=view.getPaddingRight()||b!=view.getPaddingBottom())view.setPadding(l,t,r,b);}
    private static View child(View view,String name){int id=view.getResources().getIdentifier(name,"id","com.android.systemui");return id==0?null:view.findViewById(id);}
    private static boolean belongs(View view,View panel){for(View at=view;at!=null;){if(at==panel)return true;ViewParent p=at.getParent();at=p instanceof View?(View)p:null;}return false;}
    private static View materialOwner(View view,Drawable original,int depth){Drawable d=view.getBackground();if(d==original||d instanceof Material&&((Material)d).original==original)return view;if(depth<2&&view instanceof ViewGroup){ViewGroup g=(ViewGroup)view;for(int i=0;i<g.getChildCount();i++){View found=materialOwner(g.getChildAt(i),original,depth+1);if(found!=null)return found;}}return null;}

    private static final class State implements View.OnAttachStateChangeListener {
        final WeakReference<View> panel;final Runnable changed=this::refresh;
        final Map<View,WeakReference<Surface>> surfaces=new WeakHashMap<>();
        boolean attached,preparing;String diagnostic="";
        State(View view){panel=new WeakReference<>(view);}
        void attach(){if(attached)return;View v=panel.get();if(v==null)return;attached=true;FeatureSettings.addSnapshotListener(v.getContext(),changed);refresh();}
        void refresh(){View v=panel.get();if(v==null)return;if(!attached||!FeatureSettings.enabled(v.getContext(),CORNERS)&&!FeatureSettings.enabled(v.getContext(),TILES))clear();else prepare();v.invalidate();}
        List<Surface> live(){List<Surface> list=new ArrayList<>();for(WeakReference<Surface> ref:surfaces.values()){Surface s=ref.get();if(s!=null)list.add(s);}return list;}
        void prepare(){
            View v=panel.get();if(preparing||!attached||v==null)return;
            boolean corners=FeatureSettings.enabled(v.getContext(),CORNERS),fill=FeatureSettings.enabled(v.getContext(),TILES);
            if(!corners&&!fill){if(!surfaces.isEmpty())clear();return;}preparing=true;
            try{
                for(Surface s:live())s.seen=false;
                for(String name:new String[]{"allTilesLayout","bigTilesLayout","topPanel"}){Object group=field(v,name);if(group instanceof ViewGroup)tiles((ViewGroup)group,corners,fill);}
                if(corners){Object top=field(v,"topPanel");Object brightness=field(top,"brightness"),volume=field(top,"volume"),slider=field(top,"mVolumeSlider");
                    if(brightness instanceof View){View frame=child((View)brightness,"slider_frame"),seek=child((View)brightness,"slider");if(frame!=null&&seek instanceof SeekBar)bind(frame,frame,((SeekBar)seek).getProgressDrawable(),true,false);}
                    if(volume instanceof View&&slider instanceof SeekBar)bind((View)volume,(View)volume,((SeekBar)slider).getProgressDrawable(),true,false);
                }
                for(Surface s:live()){if(!s.seen||!belongs(s.view,v)){s.restore();surfaces.remove(s.view);}else s.update();}
                String next="surfaces="+surfaces.size()+";corners="+corners+";activeFill="+fill;
                if(!next.equals(diagnostic)){diagnostic=next;FeatureSettings.diagnostic(v.getContext(),"ls_augment_rm_cc_appearance_state",next);}
            }catch(RuntimeException|LinkageError error){clear();FeatureSettings.diagnostic(v.getContext(),"ls_augment_rm_cc_appearance_state","native_fallback:"+error.getClass().getSimpleName());}
            finally{preparing=false;}
        }
        void tiles(ViewGroup group,boolean corners,boolean fill){for(int i=0;i<Math.min(64,group.getChildCount());i++){View tile=group.getChildAt(i);String type=tile.getClass().getName();if(!WIDE.equals(type)&&!CIRCLE.equals(type))continue;Object bg=field(tile,"colorBackgroundDrawable");if(bg instanceof GradientDrawable){View target=materialOwner(tile,(Drawable)bg,0);if(target!=null)bind(target,tile,null,corners,fill);}}}
        void bind(View target,View owner,Drawable progress,boolean corners,boolean fill){
            if(!belongs(target,panel.get()))return;WeakReference<Surface> ref=surfaces.get(target);Surface s=ref==null?null:ref.get();
            if(s!=null&&(target.getBackground()!=s.material||s.progress!=progress)){s.restore();surfaces.remove(target);s=null;}
            if(s==null){
                // Let the glass renderer restore its own wrapper first. Never wrap another feature's material.
                Drawable current=target.getBackground();if(current!=null&&current.getClass().getName().contains("LiquidGlassControlCenterHook$"))return;
                if(surfaces.size()>=64)return;s=new Surface(target,owner,progress);surfaces.put(target,new WeakReference<>(s));
            }
            s.seen=true;s.corners=corners;s.fill=fill;
        }
        void clear(){for(Surface s:live())s.restore();surfaces.clear();}
        @Override public void onViewAttachedToWindow(View view){attach();}
        @Override public void onViewDetachedFromWindow(View view){attached=false;FeatureSettings.removeSnapshotListener(changed);clear();diagnostic="";}
    }
    private static final class Surface {
        final View view,owner;final Drawable progress;final Material material;final List<Corner> mutations=new ArrayList<>();
        boolean seen,corners,fill;float appliedRadius=-1;
        Surface(View view,View owner,Drawable progress){this.view=view;this.owner=owner;this.progress=progress;material=new Material(this,view.getBackground());setBackground(view,material);material.bind();collectCorners(material.original,mutations,0);collectCorners(progress,mutations,0);}
        void update(){
            float density=view.getResources().getDisplayMetrics().density;
            float radius=ControlCenterAppearancePolicy.radius(FeatureSettings.integer(view.getContext(),RADIUS,24,0,48),density,view.getWidth(),view.getHeight());
            for(Corner corner:mutations)if(corners)corner.apply(radius);else corner.restore();
            appliedRadius=corners?radius:-1;material.configure();
        }
        void restore(){for(Corner corner:mutations)corner.restore();if(view.getBackground()==material)setBackground(view,material.original);material.release();}
    }
    /** Restore only radii still owned by us; native theme/resource replacements remain authoritative. */
    static final class Corner {
        final GradientDrawable drawable;float nativeRadius,ours=-1;float[] nativeRadii;
        Corner(GradientDrawable drawable){this.drawable=drawable;capture();}
        void capture(){nativeRadius=drawable.getCornerRadius();float[] values=drawable.getCornerRadii();nativeRadii=values==null?null:values.clone();}
        boolean owned(){return ours>=0&&drawable.getCornerRadii()==null&&Math.abs(drawable.getCornerRadius()-ours)<.01f;}
        void apply(float radius){if(ours>=0&&!owned())capture();else if(ours<0)capture();if(!owned()||Math.abs(ours-radius)>.01f){drawable.setCornerRadius(radius);ours=radius;}}
        void restore(){if(owned()){if(nativeRadii!=null)drawable.setCornerRadii(nativeRadii.clone());else drawable.setCornerRadius(nativeRadius);}ours=-1;}
    }
    static void collectCorners(Drawable d,List<Corner> out,int depth){if(d==null||depth>5)return;if(d instanceof GradientDrawable){if(((GradientDrawable)d).getShape()==GradientDrawable.RECTANGLE)out.add(new Corner((GradientDrawable)d));}else if(d instanceof LayerDrawable){LayerDrawable l=(LayerDrawable)d;for(int i=0;i<l.getNumberOfLayers();i++)collectCorners(l.getDrawable(i),out,depth+1);}else if(d instanceof InsetDrawable)collectCorners(((InsetDrawable)d).getDrawable(),out,depth+1);else if(d instanceof ScaleDrawable)collectCorners(((ScaleDrawable)d).getDrawable(),out,depth+1);else if(d instanceof ClipDrawable)collectCorners(((ClipDrawable)d).getDrawable(),out,depth+1);}

    private static final class Material extends ControlCenterNativeDrawable {
        final Surface surface;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);final RectF rect=new RectF();
        final Path outline=new Path();
        boolean active;int first,last,direction,width=-1,height=-1;float radius;float[] radii;Shader shader;
        boolean colorsCached;int colorA,colorB,colorFill,colorEnd,colorOpacity,colorForeground,cachedA,cachedB;
        Material(Surface surface,Drawable original){super(original);this.surface=surface;}
        void configure(){
            View tile=surface.owner;Object nativeState=field(tile,"lastState");boolean nextActive=surface.fill&&nativeState instanceof Number&&ControlCenterAppearancePolicy.activeTile(((Number)nativeState).intValue(),Boolean.TRUE.equals(DISABLED.get(tile)));
            int opacity=FeatureSettings.integer(tile.getContext(),TILE_OPACITY,85,0,100);nextActive&=opacity>0;
            int a=0,b=0,way=FeatureSettings.integer(tile.getContext(),TILE_DIRECTION,0,0,2);
            if(nextActive&&original instanceof GradientDrawable){
                GradientDrawable nativeBg=(GradientDrawable)original;int[] nativeColors=nativeBg.getColors();ColorStateList plain=nativeBg.getColor();int base=plain==null?0xff1677d2:plain.getColorForState(getState(),plain.getDefaultColor());
                int nativeA=nativeColors!=null&&nativeColors.length>0?nativeColors[0]:base,nativeB=nativeColors!=null&&nativeColors.length>0?nativeColors[nativeColors.length-1]:base;
                boolean dark=(tile.getResources().getConfiguration().uiMode&android.content.res.Configuration.UI_MODE_NIGHT_MASK)==android.content.res.Configuration.UI_MODE_NIGHT_YES;
                int fill=ControlCenterAppearancePolicy.color(FeatureSettings.snapshot(tile.getContext()).get(dark?TILE_DARK:TILE_LIGHT),0xff1677d2);
                int end=FeatureSettings.integer(tile.getContext(),TILE_GRADIENT,0,0,1)==1?ControlCenterAppearancePolicy.color(FeatureSettings.snapshot(tile.getContext()).get(dark?TILE_END_DARK:TILE_END_LIGHT),0xff725bc9):fill;
                int foreground=foreground(tile);
                if(!colorsCached||colorA!=nativeA||colorB!=nativeB||colorFill!=fill||colorEnd!=end||colorOpacity!=opacity||colorForeground!=foreground){
                    int[] readable=ControlCenterAppearancePolicy.readableGradient(ControlCenterAppearancePolicy.blend(nativeA,fill,opacity),ControlCenterAppearancePolicy.blend(nativeB,end,opacity),foreground);
                    cachedA=readable[0];cachedB=readable[1];colorA=nativeA;colorB=nativeB;colorFill=fill;colorEnd=end;colorOpacity=opacity;colorForeground=foreground;colorsCached=true;
                }
                a=cachedA;b=cachedB;
            }else nextActive=false;
            int w=surface.view.getWidth(),h=surface.view.getHeight();float r=surface.appliedRadius>=0?surface.appliedRadius:nativeRadius(original,w,h);
            float[] nextRadii=surface.appliedRadius<0&&original instanceof GradientDrawable?((GradientDrawable)original).getCornerRadii():null;
            if(active!=nextActive||first!=a||last!=b||direction!=way||width!=w||height!=h||radius!=r||!Arrays.equals(radii,nextRadii)){active=nextActive;first=a;last=b;direction=way;width=w;height=h;radius=r;radii=nextRadii==null?null:nextRadii.clone();shader=active&&w>0&&h>0?new LinearGradient(0,0,way==1?0:w,way==0?0:h,new int[]{a,b},null,Shader.TileMode.CLAMP):null;outline.reset();if(radii!=null)outline.addRoundRect(new RectF(0,0,w,h),radii,Path.Direction.CW);surface.view.invalidate();}
        }
        @Override public void draw(Canvas canvas){
            if(!active||shader==null){drawNative(canvas);return;}
            Rect bounds=getBounds();rect.set(bounds);paint.setShader(shader);paint.setAlpha(getAlpha());if(radii==null)canvas.drawRoundRect(rect,radius,radius,paint);else canvas.drawPath(outline,paint);
        }
        @Override public void invalidateDrawable(Drawable who){super.invalidateDrawable(who);configure();}
    }
    static float nativeRadius(Drawable d,int width,int height){if(d instanceof GradientDrawable){GradientDrawable g=(GradientDrawable)d;if(g.getShape()==GradientDrawable.OVAL)return Math.min(width,height)/2f;float[] corners=g.getCornerRadii();return corners!=null&&corners.length>0?corners[0]:g.getCornerRadius();}return Math.min(Math.min(width,height)/2f,24);}
    private static int foreground(View tile){
        if(WIDE.equals(tile.getClass().getName())){try{Object label=call(tile,"getLabel");if(label instanceof TextView)return ((TextView)label).getCurrentTextColor();}catch(ReflectiveOperationException ignored){}}
        try{Object icon=call(tile,"getIcon"),inner=call(icon,"getIconView");if(inner instanceof ImageView){ImageView image=(ImageView)inner;ColorStateList tint=image.getImageTintList();if(tint!=null)return tint.getColorForState(image.getDrawableState(),tint.getDefaultColor());ColorFilter filter=image.getColorFilter();if(filter instanceof PorterDuffColorFilter){Object color=call(filter,"getColor");if(color instanceof Integer)return (Integer)color;}if(filter instanceof BlendModeColorFilter)return ((BlendModeColorFilter)filter).getColor();}}catch(ReflectiveOperationException ignored){}
        Object tint=field(tile,"lastIconTint");return tint instanceof Integer&&(((Integer)tint)>>>24)>0?(Integer)tint:Color.WHITE;
    }
}
