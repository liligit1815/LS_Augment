package ls.augment.com;

import android.content.Context;
import android.graphics.*;
import android.view.View;

/** Composes the actual pair; transforms affect artwork, never the settings card itself. */
final class BackGesturePreview extends View {
    private final int side;
    private final UiKit ui;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
    private final RectF rect=new RectF();
    private final int[] bounds=new int[4];
    private GestureArtwork iconArtwork,backgroundArtwork;
    private Bitmap icon,background;
    private BackGestureIconPolicy.Side settings;
    BackGesturePreview(Context context,int side,UiKit ui){super(context);this.side=side;this.ui=ui;setBackground(ui.round(ui.accentContainer,12));}
    void update(GestureArtwork icon,GestureArtwork background,BackGestureIconPolicy.Side settings){
        if(iconArtwork!=icon){if(iconArtwork!=null)iconArtwork.stop();iconArtwork=icon;if(icon!=null&&isAttachedToWindow())icon.start(this);}
        if(backgroundArtwork!=background){if(backgroundArtwork!=null)backgroundArtwork.stop();backgroundArtwork=background;if(background!=null&&isAttachedToWindow())background.start(this);}
        this.settings=settings;invalidate();
    }
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();if(iconArtwork!=null)iconArtwork.start(this);if(backgroundArtwork!=null)backgroundArtwork.start(this);}
    @Override protected void onDetachedFromWindow(){if(iconArtwork!=null)iconArtwork.stop();if(backgroundArtwork!=null)backgroundArtwork.stop();super.onDetachedFromWindow();}
    @Override protected void onDraw(Canvas canvas){
        super.onDraw(canvas);if(settings==null)return;
        icon=iconArtwork==null?null:iconArtwork.frame();background=backgroundArtwork==null?null:backgroundArtwork.frame();
        float center=getHeight()/2f,depth=ui.dp(28),height=ui.dp(156),edge=side==0?0:getWidth();
        depth*=settings.backgroundScale/100f;height*=settings.backgroundScale/100f;
        paint.setAlpha(255);
        if(background!=null){
            rect.set(side==0?edge:edge-depth,center-height/2,side==0?edge+depth:edge,center+height/2);
            int save=canvas.save();if(side==1)canvas.scale(-1,1,rect.centerX(),rect.centerY());
            canvas.drawBitmap(background,null,rect,paint);canvas.restoreToCount(save);
        }else{
            Path wave=new Path();float inward=side==0?depth:-depth;
            wave.moveTo(edge,center-height/2);wave.cubicTo(edge,center-height/5,edge+inward*2,center-height/6,edge+inward,center);
            wave.cubicTo(edge+inward*2,center+height/6,edge,center+height/5,edge,center+height/2);wave.close();
            paint.setColor(0x44354150);canvas.drawPath(wave,paint);
        }
        depth=ui.dp(28);
        if(settings.custom&&icon!=null){
            float x=side==0?depth/2:getWidth()-depth/2,half=ui.dp(12);
            BackGestureIconPolicy.bounds(x-half,center-half,x+half,center+half,getWidth(),getHeight(),getResources().getDisplayMetrics().density,side,settings,bounds);
            float w=bounds[2]-bounds[0],h=bounds[3]-bounds[1],f=Math.min(w/icon.getWidth(),h/icon.getHeight());
            float cx=(bounds[0]+bounds[2])/2f,cy=(bounds[1]+bounds[3])/2f;
            rect.set(cx-icon.getWidth()*f/2,cy-icon.getHeight()*f/2,cx+icon.getWidth()*f/2,cy+icon.getHeight()*f/2);
            paint.setAlpha(BackGestureIconPolicy.alpha(255,settings.opacity));int save=canvas.save();
            if(settings.mirror)canvas.scale(-1,1,cx,cy);canvas.drawBitmap(icon,null,rect,paint);canvas.restoreToCount(save);
        }else{
            paint.setColor(ui.text);paint.setTextSize(ui.dp(20));paint.setTextAlign(Paint.Align.CENTER);
            canvas.drawText("‹",side==0?depth/2:getWidth()-depth/2,center+ui.dp(6),paint);
        }
        paint.setAlpha(255);
    }
}
