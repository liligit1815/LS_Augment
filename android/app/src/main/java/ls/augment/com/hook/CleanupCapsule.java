package ls.augment.com.hook;

import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.view.View;
import java.lang.reflect.Method;

/** Measured from the user's 869px-wide OPPO reference, not an OEM theme asset. */
final class CleanupCapsule {
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF body=new RectF();
    private Drawable blur;
    private Method blurCorner;
    private boolean attempted;
    private String material="tinted_gradient";
    private float shaderWidth,shaderHeight;
    private LinearGradient tint,rim,shade;

    static float unit(View view){
        View root=view.getRootView();
        int w=root.getWidth(),h=root.getHeight();
        if(w<=0)w=view.getResources().getDisplayMetrics().widthPixels;
        if(h>0)w=Math.min(w,h);
        return w>0?w/869f:1f;
    }
    static float width(View view){return 276f*unit(view);}
    static float textSize(View view){
        android.util.DisplayMetrics dm=view.getResources().getDisplayMetrics();
        return 27f*unit(view)*dm.scaledDensity/dm.density;
    }
    static float height(View view){return Math.max(70f*unit(view),textSize(view)*1.25f+16f*unit(view));}

    void draw(View view,Canvas canvas,float x,float y){
        float w=Math.min(view.getWidth(),width(view)),h=Math.min(view.getHeight(),height(view));
        float u=unit(view),left=x-w/2,top=y-h/2;
        body.set(left,top,left+w,top+h);
        if(shaderWidth!=w||shaderHeight!=h||tint==null){
            shaderWidth=w;shaderHeight=h;
            tint=new LinearGradient(0,0,w,h*.35f,new int[]{0xC93F5368,0xC934485F,0xC920364D},new float[]{0f,.47f,1f},Shader.TileMode.CLAMP);
            shade=new LinearGradient(0,0,0,h,new int[]{0x00FFFFFF,0x150D1E32},null,Shader.TileMode.CLAMP);
            rim=new LinearGradient(0,0,0,h,new int[]{0x2F8AA2B2,0x086C849A,0x406D8AAB},new float[]{0f,.5f,1f},Shader.TileMode.CLAMP);
        }
        initBlur(view,canvas);
        // BackgroundBlurDrawable submits a compositor blur region; RenderEffect
        // on the painted pill would only blur the pill itself, not the wallpaper.
        if(blur!=null&&canvas.isHardwareAccelerated()){
            try{
                blur.setBounds(Math.round(left),Math.round(top),Math.round(left+w),Math.round(top+h));
                blurCorner.invoke(blur,h/2);
                blur.draw(canvas);
            }catch(ReflectiveOperationException|RuntimeException error){release();material="tinted_gradient:blur_draw_unavailable";}
        }
        int save=canvas.save();canvas.translate(left,top);
        paint.setStyle(Paint.Style.FILL);paint.setShader(tint);
        canvas.drawRoundRect(0,0,w,h,h/2,h/2,paint);
        paint.setShader(shade);canvas.drawRoundRect(0,0,w,h,h/2,h/2,paint);
        paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(2f*u);paint.setShader(rim);
        canvas.drawRoundRect(u,u,w-u,h-u,h/2,h/2,paint);
        paint.setShader(null);paint.setStyle(Paint.Style.FILL);
        // Keep the native pressed/focused lifecycle and click listener. A subtle
        // luminance response supplies feedback without resizing the hit target.
        if(view.isPressed()||(view.getParent() instanceof View&&((View)view.getParent()).isPressed())){
            paint.setColor(0x18FFFFFF);canvas.drawRoundRect(0,0,w,h,h/2,h/2,paint);
        }
        paint.setColor(0xFFF7F8FA);paint.setTextAlign(Paint.Align.CENTER);
        paint.setTextSize(textSize(view));
        paint.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));
        // The reference's two-character ink box is 51x23px. Keep its width
        // while matching the shorter OPPO glyph height with the host CJK font.
        canvas.scale(1f,.90f,w/2,h/2);
        canvas.drawText("清除",w/2,h/2-(paint.ascent()+paint.descent())/2,paint);
        canvas.restoreToCount(save);
    }
    String material(){return material;}
    private void initBlur(View view,Canvas canvas){
        if(attempted||!view.isAttachedToWindow()||!canvas.isHardwareAccelerated())return;
        attempted=true;
        try{
            Method rootMethod=View.class.getDeclaredMethod("getViewRootImpl");rootMethod.setAccessible(true);
            Object root=rootMethod.invoke(view);if(root==null)throw new IllegalStateException("no_view_root");
            Method create=root.getClass().getMethod("createBackgroundBlurDrawable");
            if(!Drawable.class.isAssignableFrom(create.getReturnType()))throw new NoSuchMethodException("blur_return_type");
            Drawable candidate=(Drawable)create.invoke(root);
            Method radius=candidate.getClass().getMethod("setBlurRadius",int.class);
            Method corner=candidate.getClass().getMethod("setCornerRadius",float.class);
            Method color=candidate.getClass().getMethod("setColor",int.class);
            if(radius.getReturnType()!=void.class||corner.getReturnType()!=void.class||color.getReturnType()!=void.class)
                throw new NoSuchMethodException("blur_setters");
            radius.invoke(candidate,Math.round(24f*unit(view)));color.invoke(candidate,Color.TRANSPARENT);
            blur=candidate;blurCorner=corner;material="compositor_blur+tinted_gradient";
        }catch(ReflectiveOperationException|RuntimeException error){
            material="tinted_gradient:blur_unavailable:"+error.getClass().getSimpleName();
        }
    }
    void release(){
        if(blur!=null){blur.setVisible(false,false);blur=null;blurCorner=null;}
    }
    void clear(){release();attempted=false;}
}
