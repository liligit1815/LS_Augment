package ls.augment.com.hook;

import android.graphics.RenderEffect;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.graphics.Shader;
import android.graphics.Paint;
import android.graphics.BlendMode;
import android.graphics.LinearGradient;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/** GPU-only notification backdrop inside the clock/date region; foreground text stays native. */
final class NotificationTopBlur extends Drawable implements ViewTreeObserver.OnPreDrawListener {
    interface Source {
        boolean active();
        boolean eligible(View row) throws ReflectiveOperationException;
        default float scrollDistance(){return Float.POSITIVE_INFINITY;}
    }
    private final WeakReference<ViewGroup> stack;
    private final Source source;
    private final ArrayList<WeakReference<View>> rows=new ArrayList<>();
    private WeakReference<View> header=new WeakReference<>(null);
    private Drawable original;
    private LayerDrawable installed;
    private RenderNode node;
    private final int[] origin=new int[2],point=new int[2];
    private View clock,date;
    private final Rect region=new Rect();
    private final Paint mask=new Paint(Paint.ANTI_ALIAS_FLAG);
    private Shader verticalMask,horizontalMask;
    private final Rect maskRegion=new Rect();
    private String reason="inactive";
    private String failure="",geometryFailure="";
    private int drawn;
    private boolean failed;
    private ViewTreeObserver observer;
    private long frameStamp=Long.MIN_VALUE;
    private long lastDrawAt,lastReportAt;
    private RenderNode nativeStack,transitionBand;
    private boolean recordingStack,transitionFailed;
    private int transitionTop,transitionEnd,bandTop,bandHeight;
    private float effectDensity=-1;
    private int effectStrength=-1;
    private String transitionReason="inactive";
    private boolean clipResolved;
    private Field nativeRounded,nativeCut,nativeLaunching,nativeBlur;
    private String clipFailure="",transitionFailure="";
    // Complementary premultiplied weights are added, not drawn source-over:
    // otherwise translucent cards darken midway through the blur crossfade.
    private static final String WEIGHT_SHADER="uniform shader content; uniform float edge; uniform float span; uniform float feather; uniform float blurred; uniform float strength;"
            +"half4 main(float2 p) { float t=clamp((p.y-edge)/span,0.0,1.0);"
            +"float soft=strength*(1.0-t*t*(3.0-2.0*t)); float a=mix(1.0,smoothstep(edge,edge+feather,p.y),strength);"
            +"return content.eval(p)*half(a*mix(1.0-soft,soft,blurred)); }";

    NotificationTopBlur(ViewGroup host,Source source){stack=new WeakReference<>(host);this.source=source;}
    void update(List<View> candidates){
        ViewGroup host=stack.get();
        if(failed||host==null||!source.active()){clear();if(failed)reason=failure;return;}
        View target=header.get();
        if(target==null||target.getRootView()!=host.getRootView()||!notificationHeader(target))
            target=findHeader(host.getRootView());
        if(target==null){clear();reason="missing_notification_clock";return;}
        if(!geometry(target,host)){clear();reason="unavailable_clock_geometry:"+geometryFailure;return;}
        if(target!=header.get()||target.getBackground()!=installed){
            clear();header=new WeakReference<>(target);original=target.getBackground();
            installed=new LayerDrawable(new Drawable[]{original==null?new ColorDrawable(0):original,this});
            installed.setPaddingMode(LayerDrawable.PADDING_MODE_STACK);
            background(target,installed);
            observer=target.getViewTreeObserver();observer.addOnPreDrawListener(this);
        }
        boolean same=rows.size()==candidates.size();
        if(same)for(int i=0;i<rows.size();i++)if(rows.get(i).get()!=candidates.get(i)){same=false;break;}
        if(!same){rows.clear();for(View row:candidates)rows.add(new WeakReference<>(row));}
        reason="ready";target.invalidate();
    }
    private static void background(View view,Drawable value){
        int l=view.getPaddingLeft(),t=view.getPaddingTop(),r=view.getPaddingRight(),b=view.getPaddingBottom();
        view.setBackground(value);view.setPadding(l,t,r,b);
    }
    void clear(){
        if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);
        observer=null;frameStamp=Long.MIN_VALUE;
        View view=header.get();
        if(view!=null&&installed!=null&&view.getBackground()==installed)background(view,original);
        if(node!=null)node.discardDisplayList();
        if(nativeStack!=null)nativeStack.discardDisplayList();
        if(transitionBand!=null)transitionBand.discardDisplayList();
        transitionReason=transitionFailed?transitionFailure:"inactive";
        rows.clear();installed=null;original=null;header.clear();drawn=0;lastDrawAt=0;reason="inactive";
    }
    @Override public boolean onPreDraw(){
        View view=header.get();ViewGroup host=stack.get();
        if(view==null||host==null||!source.active()||view.getBackground()!=installed||!geometry(view,host)){clear();return true;}
        // Follow native property animations too; do not continuously schedule new
        // frames while a scrolled shade is stationary.
        int[] location=point;view.getLocationInWindow(location);
        long stamp=31L*(31L*location[0]+location[1])+region.top;
        stamp=31*stamp+region.bottom;stamp=31*stamp+region.right;
        int headerX=location[0],headerY=location[1];
        for(WeakReference<View> reference:rows){View row=reference.get();if(row==null)continue;
            row.getLocationInWindow(location);
            int left=location[0]-headerX,top=location[1]-headerY;
            if(top>=region.bottom||top+row.getHeight()<=region.top||left>=region.right||left+row.getWidth()<=region.left)continue;
            stamp=31*stamp+location[0];stamp=31*stamp+location[1];
            stamp=31*stamp+row.getWidth();stamp=31*stamp+row.getHeight();stamp=31*stamp+row.getVisibility();
            stamp=31*stamp+Float.floatToIntBits(row.getAlpha());stamp=31*stamp+Float.floatToIntBits(row.getScaleY());
            stamp=31*stamp+Float.floatToIntBits(row.getScaleX());stamp=31*stamp+Float.floatToIntBits(row.getRotation());
            stamp=31*stamp+Float.floatToIntBits(row.getRotationX());stamp=31*stamp+Float.floatToIntBits(row.getRotationY());
            stamp=31*stamp+(row.isAttachedToWindow()?1:0);
            Rect clip=row.getClipBounds();if(clip!=null){stamp=31*stamp+clip.top;stamp=31*stamp+clip.bottom;stamp=31*stamp+clip.left;stamp=31*stamp+clip.right;}
            try{stamp=31*stamp+(row.getParent()==host&&source.eligible(row)?1:0);}
            catch(ReflectiveOperationException unavailable){stamp=31*stamp;}
        }
        if(stamp!=frameStamp){frameStamp=stamp;view.invalidate();}
        return true;
    }
    String evidence(){return reason+";target=clock_region_backdrop;renderer=hardware;radius_dp=10;software_draws=0"+";header_pixels="+region.left+","+region.top+","+region.right+","+region.bottom+";drawn_rows="+drawn+";soft_edge_dp=16;last_draw_at="+lastDrawAt
            +";transition="+transitionReason+";transition_pixels="+transitionTop+","+transitionEnd+";transition_dp=48;fade_dp=16;transition_strength="+effectStrength+"/32";}

    /** Capture the OEM dispatchDraw once, with its clips, privacy and child ordering intact. */
    Canvas beginTransition(Canvas output){
        ViewGroup host=stack.get();View view=header.get();
        if(recordingStack||transitionFailed||host==null||view==null||!output.isHardwareAccelerated()
                ||!source.active()||view.getBackground()!=installed||!geometry(view,host))return null;
        if(!clipResolved){
            clipResolved=true;
            try{
                nativeRounded=clipField(host,"mShouldUseRoundedRectClipping",boolean.class);
                nativeCut=clipField(host,"mRoundedRectClippingTop",int.class);
                nativeLaunching=clipField(host,"mLaunchingNotification",boolean.class);
                nativeBlur=clipField(host,"mBlurEffect",RenderEffect.class);
            }catch(ReflectiveOperationException|RuntimeException unavailable){
                nativeRounded=null;clipFailure="missing_native_clip_contract:"+unavailable.getMessage();
            }
        }
        if(nativeRounded==null){transitionReason=clipFailure;return null;}
        try{
            if(!nativeRounded.getBoolean(host)||nativeLaunching.getBoolean(host)||nativeBlur.get(host)!=null){
                transitionReason="native_clip_or_animation";return null;
            }
            transitionTop=nativeCut.getInt(host);
        }catch(IllegalAccessException unavailable){transitionReason="unreadable_native_clip_contract";return null;}
        float density=host.getResources().getDisplayMetrics().density;
        float entering=Math.max(0,Math.min(1,source.scrollDistance()/(32*density)));
        int strength=Math.round(32*entering*entering*(3-2*entering));
        // No full-strength mask on the first pixel of a drag from the top.
        if(strength==0){transitionReason="entering_native";return null;}
        view.getLocationInWindow(origin);host.getLocationInWindow(point);
        int clockBottom=origin[1]+region.bottom-point[1];
        // A different clipping surface (QS/keyguard/launch animation) must not
        // be mistaken for the measured notification-clock boundary.
        if(transitionTop<clockBottom-Math.round(32*density)||transitionTop>clockBottom+Math.round(64*density)
                ||transitionTop<0||transitionTop>=host.getHeight()){
            transitionReason="clip_outside_clock_boundary";return null;
        }
        transitionEnd=Math.min(host.getHeight(),transitionTop+Math.round(48*density));
        int padding=Math.round(30*density);
        bandTop=transitionTop-padding;bandHeight=transitionEnd-transitionTop+2*padding;
        try{
            if(nativeStack==null)nativeStack=new RenderNode("DuoNativeNotificationStack");
            if(transitionBand==null)transitionBand=new RenderNode("DuoNotificationTopTransition");
            if(effectDensity!=density||effectStrength!=strength){
                RenderEffect sharp=weight(density,padding,false,strength/32f);
                RenderEffect blurred=RenderEffect.createChainEffect(weight(density,padding,true,strength/32f),
                        RenderEffect.createBlurEffect(10*density,10*density,Shader.TileMode.CLAMP));
                transitionBand.setRenderEffect(RenderEffect.createBlendModeEffect(sharp,blurred,BlendMode.PLUS));
                effectDensity=density;effectStrength=strength;
            }
            nativeStack.setPosition(0,0,host.getWidth(),host.getHeight());
            Canvas recording=nativeStack.beginRecording();recordingStack=true;
            if(!recording.isHardwareAccelerated())throw new IllegalStateException("hardware_canvas_required");
            return recording;
        }catch(RuntimeException|LinkageError error){
            if(recordingStack){nativeStack.endRecording();recordingStack=false;}
            failTransition(host,error);return null;
        }
    }
    private static Field clipField(View host,String name,Class<?> type)throws NoSuchFieldException{
        for(Class<?> c=host.getClass();c!=null;c=c.getSuperclass())try{
            Field field=c.getDeclaredField(name);
            if(field.getType()!=type||java.lang.reflect.Modifier.isStatic(field.getModifiers()))
                throw new NoSuchFieldException(name+":"+type.getSimpleName());
            field.setAccessible(true);return field;
        }catch(NoSuchFieldException missing){if(c.getSuperclass()==null)throw missing;}
        throw new NoSuchFieldException(name+":"+type.getSimpleName());
    }
    private static RenderEffect weight(float density,int padding,boolean blurred,float strength){
        RuntimeShader shader=new RuntimeShader(WEIGHT_SHADER);
        shader.setFloatUniform("edge",padding);shader.setFloatUniform("span",48*density);
        shader.setFloatUniform("feather",16*density);shader.setFloatUniform("blurred",blurred?1:0);
        shader.setFloatUniform("strength",strength);
        return RenderEffect.createRuntimeShaderEffect(shader,"content");
    }
    void endTransition(Canvas output,boolean nativeSucceeded){
        if(!recordingStack)return;
        nativeStack.endRecording();recordingStack=false;
        if(!nativeSucceeded){nativeStack.discardDisplayList();return;}
        ViewGroup host=stack.get();
        try{
            // Only the narrow seam is filtered; the rest of the native display
            // list is replayed without a full-screen blur allocation.
            transitionBand.setPosition(0,0,host.getWidth(),bandHeight);
            Canvas band=transitionBand.beginRecording();
            try{band.translate(0,-bandTop);band.drawRenderNode(nativeStack);}
            finally{transitionBand.endRecording();}
        }catch(RuntimeException|LinkageError error){
            failTransition(host,error);output.drawRenderNode(nativeStack);return;
        }
        int save=output.save();
        try{output.clipRect(0,0,host.getWidth(),transitionTop);output.drawRenderNode(nativeStack);}
        finally{output.restoreToCount(save);}
        save=output.save();
        try{output.clipRect(0,transitionEnd,host.getWidth(),host.getHeight());output.drawRenderNode(nativeStack);}
        finally{output.restoreToCount(save);}
        save=output.save();
        try{output.clipRect(0,transitionTop,host.getWidth(),transitionEnd);output.translate(0,bandTop);output.drawRenderNode(transitionBand);}
        finally{output.restoreToCount(save);}
        transitionReason="drawn_native_clip_preserved";
    }
    private void failTransition(ViewGroup host,Throwable error){
        transitionFailed=true;transitionReason=transitionFailure="unavailable:"+error.getClass().getSimpleName();
        FeatureSettings.diagnostic(host.getContext(),"ls_augment_notification_top_transition_runtime",evidence());
    }
    @Override public void draw(Canvas canvas){
        View view=header.get();ViewGroup host=stack.get();drawn=0;
        if(failed||view==null||host==null||!canvas.isHardwareAccelerated()||!source.active()
                ||view.getBackground()!=installed||!geometry(view,host))return;
        try{
            if(node==null){node=new RenderNode("DuoNotificationClockBackdrop");
                float radius=10*view.getResources().getDisplayMetrics().density;
                node.setRenderEffect(RenderEffect.createBlurEffect(radius,radius,Shader.TileMode.CLAMP));}
            // RecordingCanvas accepts native hardware bitmaps/RenderNodes. A
            // software Bitmap Canvas makes OEM RemoteViews cancel notifications
            // internally on drawing errors; never use that path as a fallback.
            node.setPosition(0,0,region.width(),region.height());
            Canvas recording=node.beginRecording();
            try{
                if(!recording.isHardwareAccelerated())throw new IllegalStateException("hardware_canvas_required");
                view.getLocationInWindow(origin);
                for(int i=rows.size()-1;i>=0;i--){View row=rows.get(i).get();
                    if(row==null||row.getParent()!=host)continue;
                    row.getLocationInWindow(point);
                    int x=point[0]-origin[0]-region.left,y=point[1]-origin[1]-region.top;
                    if(y>=region.height()||y+row.getHeight()<=0||x>=region.width()||x+row.getWidth()<=0)continue;
                    if(!shown(row)||!untransformed(row)||!source.eligible(row))continue;
                    int save=recording.save();
                    try{
                        recording.translate(x,y);recording.clipRect(0,0,row.getWidth(),row.getHeight());
                        // Keep the native top/bottom/privacy clips. No setter is
                        // called on the original row or any child RenderNode.
                        Rect clip=row.getClipBounds();if(clip!=null)recording.clipRect(clip);
                        if(row.getAlpha()<1)recording.saveLayerAlpha(0,0,row.getWidth(),row.getHeight(),Math.round(255*row.getAlpha()));
                        row.draw(recording);drawn++;
                    }finally{recording.restoreToCount(save);}
                }
            }finally{node.endRecording();}
            if(drawn>0){
                prepareMask(view.getResources().getDisplayMetrics().density);
                int save=canvas.saveLayer(region.left,region.top,region.right,region.bottom,null);
                try{
                    // Blur and feather only this layer, before the sharp clock/date
                    // children draw. The first visible notification is never masked.
                    canvas.clipRect(region);int translated=canvas.save();
                    try{canvas.translate(region.left,region.top);canvas.drawRenderNode(node);}
                    finally{canvas.restoreToCount(translated);}
                    mask.setShader(verticalMask);canvas.drawRect(region,mask);
                    mask.setShader(horizontalMask);canvas.drawRect(region,mask);
                }finally{canvas.restoreToCount(save);}
            }
            reason="drawn";lastDrawAt=System.currentTimeMillis();
            if(lastDrawAt-lastReportAt>=1000){lastReportAt=lastDrawAt;
                FeatureSettings.diagnostic(host.getContext(),"ls_augment_notification_top_blur_runtime",evidence());}
        }catch(ReflectiveOperationException|RuntimeException|LinkageError error){
            failed=true;reason=failure="draw_unavailable:"+error.getClass().getSimpleName();
            if(node!=null)node.discardDisplayList();
            FeatureSettings.diagnostic(host.getContext(),"ls_augment_notification_top_blur_runtime",evidence());
        }
    }
    private void prepareMask(float density){
        if(verticalMask!=null&&maskRegion.left==region.left&&maskRegion.top==region.top
                &&maskRegion.right==region.right&&maskRegion.bottom==region.bottom)return;
        float y=Math.min(.45f,16*density/region.height()),x=Math.min(.45f,16*density/region.width());
        int[] colors={0,0xffffffff,0xffffffff,0};
        verticalMask=new LinearGradient(0,region.top,0,region.bottom,colors,new float[]{0,y,1-y,1},Shader.TileMode.CLAMP);
        horizontalMask=new LinearGradient(region.left,0,region.right,0,colors,new float[]{0,x,1-x,1},Shader.TileMode.CLAMP);
        mask.setBlendMode(BlendMode.DST_IN);
        maskRegion.set(region.left,region.top,region.right,region.bottom);
    }
    private boolean geometry(View view,ViewGroup host){
        geometryFailure="visibility_transform_or_root";
        if(!notificationHeader(view)||!shown(view)||!shown(host)||!untransformed(view)||!untransformed(host)
                ||view.getRootView()!=host.getRootView()||view.getWidth()<=0||view.getHeight()<=0)return false;
        Object rawClock=clock!=null&&inside(clock,view)?clock:field(view,"mClockView");
        Object rawDate=date!=null&&inside(date,view)?date:field(view,"mDateView");
        geometryFailure="mClockView_or_mDateView_not_TextView";
        if(!(rawClock instanceof TextView)||!(rawDate instanceof TextView))return false;
        clock=(View)rawClock;date=(View)rawDate;
        geometryFailure="clock_date_subtree_or_layout";
        if(!inside(clock,view)||!inside(date,view)||!shown(clock)||!untransformed(clock)||!untransformed(date)||clock.getHeight()<=0)return false;
        view.getLocationInWindow(origin);clock.getLocationInWindow(point);
        int top=point[1]-origin[1],bottom=top+clock.getHeight();
        if(shown(date)&&date.getHeight()>0){date.getLocationInWindow(point);top=Math.min(top,point[1]-origin[1]);bottom=Math.max(bottom,point[1]-origin[1]+date.getHeight());}
        float density=view.getResources().getDisplayMetrics().density;
        region.set(0,Math.max(0,top-Math.round(6*density)),view.getWidth(),Math.min(view.getHeight(),bottom+Math.round(10*density)));
        geometryFailure="empty_clock_region";
        return !region.isEmpty();
    }
    private static boolean inside(View child,View parent){
        for(View v=child;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null)if(v==parent)return true;
        return false;
    }
    private static boolean shown(View view){
        if(!view.isAttachedToWindow())return false;
        for(View v=view;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null)
            if(v.getVisibility()!=View.VISIBLE||v.getAlpha()<=0)return false;
        return true;
    }
    private static boolean untransformed(View view){
        for(View v=view;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null)
            if(Math.abs(v.getScaleX()-1)>.001f||Math.abs(v.getScaleY()-1)>.001f
                    ||Math.abs(v.getRotation())>.001f||Math.abs(v.getRotationX())>.001f||Math.abs(v.getRotationY())>.001f)return false;
        return true;
    }
    private static boolean notificationHeader(View view){
        boolean known=false;for(Class<?> c=view.getClass();c!=null;c=c.getSuperclass())
            if("com.zte.controlcenter.widget.CCHeaderView".equals(c.getName())){known=true;break;}
        Object type=known?field(view,"panelType"):null;return type instanceof Integer&&(Integer)type==2;
    }
    private static View findHeader(View view){
        if(notificationHeader(view)&&shown(view))return view;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){
            View found=findHeader(group.getChildAt(i));if(found!=null)return found;
        }}return null;
    }
    private static Object field(Object target,String name){
        for(Class<?> c=target.getClass();c!=null;c=c.getSuperclass())try{
            Field field=c.getDeclaredField(name);field.setAccessible(true);return field.get(target);
        }catch(NoSuchFieldException missing){continue;}catch(ReflectiveOperationException|RuntimeException unavailable){return null;}
        return null;
    }
    @Override public void setAlpha(int alpha){}
    @Override public void setColorFilter(ColorFilter colorFilter){}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
