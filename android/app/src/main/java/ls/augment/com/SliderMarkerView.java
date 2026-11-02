package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.SeekBar;

/** A caption and tick aligned with the native thumb; does not replace its track or touch handling. */
// Code-only UiKit decoration.
//noinspection ViewConstructor
final class SliderMarkerView extends View {
    private final UiKit ui;
    private final SeekBar bar;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private int progress;
    private String label="";
    SliderMarkerView(UiKit ui,SeekBar bar) {
        super(ui.activity);this.ui=ui;this.bar=bar;
        paint.setTextSize(ui.text("",12,ui.muted,false).getTextSize());
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        bar.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->invalidate());
    }
    void setMarker(int progress,String label) {this.progress=progress;this.label=label;invalidate();}
    static float thumbX(SeekBar bar,int progress) {
        Drawable thumb=bar.getThumb();int thumbWidth=thumb==null?0:thumb.getIntrinsicWidth();
        int offset=thumb==null?0:bar.getThumbOffset();
        return SliderMarkerPosition.x(progress,bar.getMin(),bar.getMax(),bar.getWidth(),bar.getPaddingLeft(),
                bar.getPaddingRight(),thumbWidth,offset,bar.getLayoutDirection()==LAYOUT_DIRECTION_RTL);
    }
    @Override protected void onMeasure(int w,int h) {
        Paint.FontMetrics font=paint.getFontMetrics();
        setMeasuredDimension(MeasureSpec.getSize(w),resolveSize(ui.dp(6)+(int)Math.ceil(font.bottom-font.top),h));
    }
    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float x=thumbX(bar,progress),textWidth=paint.measureText(label);
        paint.setColor(bar.isEnabled()?ui.accent:ui.muted);paint.setStrokeWidth(ui.dp(1));
        canvas.drawLine(x,0,x,ui.dp(4),paint);
        paint.setColor(ui.muted);
        float left=Math.max(0,Math.min(getWidth()-textWidth,x-textWidth/2));
        canvas.drawText(label,left,ui.dp(6)-paint.getFontMetrics().top,paint);
    }
}
