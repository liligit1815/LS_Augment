package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;

/** A quiet, continuous ownership cue; it does not reparent editors or change their state. */
final class ExpandedConfiguration {
    private final View header,content;
    private final Drawable originalHeader;
    private final Drawable expandedHeader;
    private View summary;
    private Drawable originalSummary,expandedSummary;

    ExpandedConfiguration(UiKit ui,View header,View content){
        // Page-wide masters sometimes keep status text in a header card. Include that
        // entire card so the ownership boundary joins the body at the same width.
        if(header.getParent() instanceof View
                &&((View)header.getParent()).getParent()==content.getParent())header=(View)header.getParent();
        this.header=header;this.content=content;
        originalHeader=header.getBackground();
        expandedHeader=ui.pressable(new Surface(ui,0));
        content.setBackground(new Surface(ui,1));
        content.setPadding(Math.max(content.getPaddingLeft(),ui.dp(12)),content.getPaddingTop(),
                Math.max(content.getPaddingRight(),ui.dp(8)),Math.max(content.getPaddingBottom(),ui.dp(8)));
        if(content.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
            ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)content.getLayoutParams();
            p.topMargin=0;p.bottomMargin=Math.max(p.bottomMargin,ui.dp(8));content.setLayoutParams(p);
        }
    }
    void summary(UiKit ui,View view){summary=view;originalSummary=view.getBackground();expandedSummary=new Surface(ui,2);}
    void update(boolean expanded){header.setBackground(expanded?expandedHeader:originalHeader);if(summary!=null)summary.setBackground(expanded?expandedSummary:originalSummary);}

    private static final class Surface extends Drawable {
        private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF area=new RectF();
        private final Path shape=new Path(),outline=new Path();
        private final int fill,edge,guide;
        private final float stroke;
        private final float radius;
        private final int part;
        Surface(UiKit ui,int part){
            this.part=part;stroke=Math.max(1,ui.dp(1));
            radius=ui.dp(ui.angularCards?4:10);
            fill=(ui.cardHigh&0xffffff)|(ui.dark?0x66000000:0x88000000);
            edge=(ui.accent&0xffffff)|0x30000000;guide=(ui.accent&0xffffff)|0x70000000;
        }
        @Override protected void onBoundsChange(Rect bounds){
            area.set(bounds);float r=Math.min(radius,Math.min(area.width(),area.height())/2);
            shape.reset();shape.addRoundRect(area,part==0?new float[]{r,r,r,r,0,0,0,0}:part==1?new float[]{0,0,0,0,r,r,r,r}:new float[8],Path.Direction.CW);
            float left=area.left+stroke/2,right=area.right-stroke/2,top=area.top+stroke/2,bottom=area.bottom-stroke/2;
            outline.reset();
            if(part==0){outline.moveTo(left,area.bottom);outline.lineTo(left,top+r);outline.quadTo(left,top,left+r,top);outline.lineTo(right-r,top);outline.quadTo(right,top,right,top+r);outline.lineTo(right,area.bottom);}
            else if(part==1){outline.moveTo(left,area.top);outline.lineTo(left,bottom-r);outline.quadTo(left,bottom,left+r,bottom);outline.lineTo(right-r,bottom);outline.quadTo(right,bottom,right,bottom-r);outline.lineTo(right,area.top);}
            else{outline.moveTo(left,area.top);outline.lineTo(left,area.bottom);outline.moveTo(right,area.top);outline.lineTo(right,area.bottom);}
        }
        @Override public void draw(Canvas canvas){
            paint.setStyle(Paint.Style.FILL);paint.setColor(fill);canvas.drawPath(shape,paint);
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(stroke);paint.setColor(edge);
            float inset=stroke/2;
            canvas.drawPath(outline,paint);
            if(part!=0){paint.setColor(guide);canvas.drawLine(area.left+inset,area.top,area.left+inset,Math.max(area.top,area.bottom-(part==1?radius:0)),paint);}
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
