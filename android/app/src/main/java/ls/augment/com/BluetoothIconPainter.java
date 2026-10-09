package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;

/** Shared vector artwork for the editor and SystemUI, in a 52 x 18 viewport. */
public final class BluetoothIconPainter {
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path=new Path();
    private final RectF oval=new RectF();
    private final StatusBarRingPainter ring=new StatusBarRingPainter();
    private Typeface typeface;
    public void setTypeface(Typeface value){typeface=value;}
    private ArtworkLayers artwork;
    public void setArtwork(ArtworkLayers value){artwork=value;}

    public static float viewportWidth(int style,int battery){return battery<0||battery>100?12:style==2?52:39.5f;}
    /** Actual painted extents, so status-bar sizing excludes viewport whitespace. */
    public static void inkBounds(RectF bounds,int style,int battery){
        if(battery<0||battery>100)bounds.set(1.2f,1.2f,10.8f,16.8f);
        else if(style==2)bounds.set(0,.95f,51.05f,17.05f);
        else bounds.set(.7f,1.8f,37.2f,16.2f);
    }

    public void draw(Canvas canvas,float x,float y,float width,float height,int style,int battery,int color){
        int save=canvas.save();
        try{
            boolean known=battery>=0&&battery<=100;
            float viewport=viewportWidth(style,battery);
            float scale=Math.min(width/viewport,height/18);
            canvas.translate(x+(width-viewport*scale)/2,y+(height-18*scale)/2);
            canvas.scale(scale,scale);
            paint.setColor(color);paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(1.6f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
            if(style!=2||!known){
                path.reset();
                if(known){
                    path.moveTo(3.5f,5.4f);path.lineTo(11,12);path.lineTo(7.2f,15.2f);
                    path.lineTo(7.2f,2.8f);path.lineTo(11,6.2f);path.lineTo(3.5f,12.6f);
                }else{
                    path.moveTo(2,5);path.lineTo(10,12);path.lineTo(6,16);
                    path.lineTo(6,2);path.lineTo(10,6);path.lineTo(2,13);
                }
                canvas.drawPath(path,paint);
                if(known){
                    paint.setStyle(Paint.Style.FILL);
                    diamond(canvas,1.6f,9);diamond(canvas,14,9);
                    paint.setStyle(Paint.Style.STROKE);
                }
            }
            if(!known)return;
            float batteryLeft=style==2?0:18;
            if(artwork!=null&&artwork.draw(canvas,"bluetooth.battery","whole",batteryLeft,0,viewport,18,color))return;
            if(artwork!=null)artwork.draw(canvas,"bluetooth.battery","background",batteryLeft,0,viewport,18,color);
            if(style==2){
                paint.setStyle(Paint.Style.FILL);paint.setTypeface(typeface!=null?typeface:Typeface.create("sans-serif-medium",Typeface.NORMAL));
                paint.setTextSize(13);paint.setTextAlign(Paint.Align.LEFT);
                canvas.drawText(battery+"%",0,9-(paint.ascent()+paint.descent())/2,paint);
                ring.drawBattery(canvas,34,0,battery,color);
            }else{
                // Reference: a horizontal battery capsule with a larger open
                // return arc wrapped around its right end, not concentric pills.
                canvas.translate(-2.5f,0);
                paint.setStrokeWidth(1.4f);
                oval.set(26,2.5f,39,15.5f);canvas.drawArc(oval,-90,228,false,paint);
                oval.set(20.5f,5,36.5f,13);canvas.drawRoundRect(oval,4,4,paint);
                oval.set(23,7.5f,34,10.5f);paint.setStyle(Paint.Style.FILL);
                paint.setAlpha(Math.round(((color>>>24)&255)*.18f));
                canvas.drawRoundRect(oval,1.5f,1.5f,paint);paint.setColor(color);
                if(battery>0){
                    int clip=canvas.save();path.reset();path.addRoundRect(oval,1.5f,1.5f,Path.Direction.CW);canvas.clipPath(path);
                    canvas.drawRect(oval.left,oval.top,oval.left+oval.width()*battery/100f,oval.bottom,paint);
                    canvas.restoreToCount(clip);
                }
            }
            if(style!=2)canvas.translate(2.5f,0);
            if(artwork!=null)artwork.draw(canvas,"bluetooth.battery","foreground",batteryLeft,0,viewport,18,color);
        }finally{canvas.restoreToCount(save);}
    }

    private void diamond(Canvas canvas,float x,float y){
        path.reset();path.moveTo(x,y-.9f);path.lineTo(x+.9f,y);
        path.lineTo(x,y+.9f);path.lineTo(x-.9f,y);path.lineTo(x,y-.9f);
        canvas.drawPath(path,paint);
    }
}
