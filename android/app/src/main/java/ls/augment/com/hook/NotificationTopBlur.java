package ls.augment.com.hook;

import android.graphics.RenderEffect;
import android.graphics.Canvas;
import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RenderNode;
import android.graphics.Shader;
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

/** Live notification pixels below the native clock children, never an effect on the first row. */
final class NotificationTopBlur extends Drawable implements ViewTreeObserver.OnPreDrawListener {
    interface Source {
        boolean active();
        boolean eligible(View row) throws ReflectiveOperationException;
        int clip(View row) throws ReflectiveOperationException;
        void clip(View row,int value) throws ReflectiveOperationException;
    }
    private final WeakReference<ViewGroup> stack;
    private final Source source;
    private final ArrayList<WeakReference<View>> rows=new ArrayList<>();
    private WeakReference<View> header=new WeakReference<>(null);
    private Drawable original;
    private LayerDrawable installed;
    private RenderNode node;
    private Bitmap pixels;
    private final Paint paint=new Paint(Paint.FILTER_BITMAP_FLAG);
    private final Rect region=new Rect();
    private String reason="inactive";
    private String failure="",geometryFailure="";
    private int drawn;
    private boolean failed;
    private ViewTreeObserver observer;
    private long frameStamp=Long.MIN_VALUE;
    private long lastDrawAt,lastReportAt;

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
        rows.clear();for(View row:candidates)rows.add(new WeakReference<>(row));
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
        pixels=null;
        rows.clear();installed=null;original=null;header.clear();drawn=0;lastDrawAt=0;reason="inactive";
    }
    @Override public boolean onPreDraw(){
        View view=header.get();ViewGroup host=stack.get();
        if(view==null||host==null||!source.active()||view.getBackground()!=installed||!geometry(view,host)){clear();return true;}
        // Follow native property animations too; do not continuously schedule new
        // frames while a scrolled shade is stationary.
        int[] location=new int[2];view.getLocationInWindow(location);
        long stamp=31L*(31L*location[0]+location[1])+region.top;
        stamp=31*stamp+region.bottom;stamp=31*stamp+region.right;
        for(WeakReference<View> reference:rows){View row=reference.get();if(row==null)continue;
            row.getLocationInWindow(location);stamp=31*stamp+location[0];stamp=31*stamp+location[1];
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
    String evidence(){return reason+";header_pixels="+region.left+","+region.top+","+region.right+","+region.bottom+";drawn_rows="+drawn+";last_draw_at="+lastDrawAt;}
    @Override public void draw(Canvas canvas){
        View view=header.get();ViewGroup host=stack.get();drawn=0;
        if(failed||view==null||host==null||!canvas.isHardwareAccelerated()||!source.active()
                ||view.getBackground()!=installed||!geometry(view,host))return;
        try{
            if(node==null){node=new RenderNode("DuoNotificationClockBackdrop");
                float radius=12*view.getResources().getDisplayMetrics().density;
                node.setRenderEffect(RenderEffect.createBlurEffect(radius,radius,Shader.TileMode.CLAMP));}
            // A small reusable pixel buffer avoids retaining the OEM children's
            // mutable RenderNodes after their geometric clip has been restored.
            // It is redrawn from native views, never read from a screen capture.
            float sampling=Math.min(1,540f/region.width());
            int width=Math.max(1,Math.round(region.width()*sampling)),height=Math.max(1,Math.round(region.height()*sampling));
            if((long)width*height>1_048_576){reason="header_too_large";return;}
            if(pixels==null||pixels.getWidth()!=width||pixels.getHeight()!=height)
                pixels=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);
            pixels.eraseColor(0);
            Canvas recording=new Canvas(pixels);recording.scale(sampling,sampling);
            try{
                int[] origin=new int[2];view.getLocationInWindow(origin);
                for(int i=rows.size()-1;i>=0;i--){View row=rows.get(i).get();
                    if(row==null||row.getParent()!=host||!shown(row)||!untransformed(row)||!source.eligible(row))continue;
                    int[] point=new int[2];row.getLocationInWindow(point);
                    int x=point[0]-origin[0]-region.left,y=point[1]-origin[1]-region.top;
                    if(y>=region.height()||y+row.getHeight()<=0||x>=region.width()||x+row.getWidth()<=0)continue;
                    int save=recording.save();int clip=source.clip(row);
                    try{
                        recording.translate(x,y);
                        recording.clipRect(0,0,row.getWidth(),row.getHeight());
                        if(row.getAlpha()<1)recording.saveLayerAlpha(0,0,row.getWidth(),row.getHeight(),Math.round(255*row.getAlpha()));
                        // Lift only the geometric top clip for this synchronous
                        // offscreen draw. OEM public/private content and bottom
                        // clipping remain intact; the actual list stays clipped.
                        if(clip>0)source.clip(row,0);
                        Rect nativeClip=row.getClipBounds();if(nativeClip!=null)recording.clipRect(nativeClip);
                        row.draw(recording);drawn++;
                    }finally{if(clip>0)source.clip(row,clip);recording.restoreToCount(save);}
                }
            }finally{recording.setBitmap(null);}
            node.setPosition(0,0,region.width(),region.height());
            Canvas display=node.beginRecording();
            try{display.drawBitmap(pixels,null,new Rect(0,0,region.width(),region.height()),paint);}
            finally{node.endRecording();}
            if(drawn>0){int save=canvas.save();try{
                // Clip AFTER the blur so its kernel cannot spill onto the first row.
                canvas.clipRect(region);canvas.translate(region.left,region.top);canvas.drawRenderNode(node);
            }finally{canvas.restoreToCount(save);}}
            reason="drawn";lastDrawAt=System.currentTimeMillis();
            if(lastDrawAt-lastReportAt>=1000){lastReportAt=lastDrawAt;
                FeatureSettings.diagnostic(host.getContext(),"ls_augment_notification_top_blur_runtime",evidence());}
        }catch(ReflectiveOperationException|RuntimeException|LinkageError error){
            failed=true;reason=failure="draw_unavailable:"+error.getClass().getSimpleName();
            if(node!=null)node.discardDisplayList();
            FeatureSettings.diagnostic(host.getContext(),"ls_augment_notification_top_blur_runtime",evidence());
        }
    }
    private boolean geometry(View view,ViewGroup host){
        geometryFailure="visibility_transform_or_root";
        if(!notificationHeader(view)||!shown(view)||!shown(host)||!untransformed(view)||!untransformed(host)
                ||view.getRootView()!=host.getRootView()||view.getWidth()<=0||view.getHeight()<=0)return false;
        Object rawClock=field(view,"mClockView"),rawDate=field(view,"mDateView");
        geometryFailure="mClockView_or_mDateView_not_TextView";
        if(!(rawClock instanceof TextView)||!(rawDate instanceof TextView))return false;
        View clock=(View)rawClock,date=(View)rawDate;
        geometryFailure="clock_date_subtree_or_layout";
        if(!inside(clock,view)||!inside(date,view)||!shown(clock)||!untransformed(clock)||!untransformed(date)||clock.getHeight()<=0)return false;
        int[] h=new int[2],c=new int[2],d=new int[2];view.getLocationInWindow(h);clock.getLocationInWindow(c);date.getLocationInWindow(d);
        int top=c[1]-h[1],bottom=top+clock.getHeight();
        if(shown(date)&&date.getHeight()>0){top=Math.min(top,d[1]-h[1]);bottom=Math.max(bottom,d[1]-h[1]+date.getHeight());}
        region.set(0,Math.max(0,top),view.getWidth(),Math.min(view.getHeight(),bottom));
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
