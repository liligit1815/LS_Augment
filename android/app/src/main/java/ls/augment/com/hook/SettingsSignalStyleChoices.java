package ls.augment.com.hook;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Checkable;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.function.IntConsumer;
import ls.augment.com.DualSignalLayout;
import ls.augment.com.DualSignalPainter;
import ls.augment.com.IosSignalPainter;
import ls.augment.com.SignalStylePolicy;

/** Graphic choices hosted by the OEM preference dialog's original themed builder. */

// Code-only view requires UiKit/state/callbacks; it is never inflated from XML. A partial XML constructor is invalid.
//noinspection ViewConstructor
final class SettingsSignalStyleChoices extends LinearLayout {
    private final Option[] options=new Option[3];

    SettingsSignalStyleChoices(Context context,int selected,IntConsumer onChoice){
        super(context);
        setOrientation(HORIZONTAL);setLayoutDirection(LAYOUT_DIRECTION_LTR);
        setGravity(Gravity.TOP);setPadding(dp(context,16),dp(context,8),dp(context,16),dp(context,8));
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        Colors colors=new Colors(context);
        for(int index=0;index<options.length;index++){
            final int choice=index;
            Option option=new Option(context,index,colors);
            options[index]=option;option.setChecked(index==selected);
            LayoutParams params=new LayoutParams(0,LayoutParams.WRAP_CONTENT,1f);
            if(index>0)params.leftMargin=dp(context,8);
            addView(option,params);
            option.setOnClickListener(view->{
                setSelection(choice);
                onChoice.accept(choice);
            });
        }
    }
    void setSelection(int choice){
        if(choice<0||choice>=options.length)return;
        for(int i=0;i<options.length;i++)options[i].setChecked(i==choice);
    }

    private static int dp(Context context,float value){return Math.round(value*context.getResources().getDisplayMetrics().density);}

    private static final class Colors {
        final int accent,text,muted,edge,surface,check;
        Colors(Context context){
            TypedArray theme=context.obtainStyledAttributes(new int[]{android.R.attr.colorAccent,
                    android.R.attr.textColorPrimary,android.R.attr.colorBackground});
            int background;
            try{accent=theme.getColor(0,Color.rgb(28,135,245));text=theme.getColor(1,Color.rgb(30,30,30));
                background=theme.getColor(2,Color.WHITE);}finally{theme.recycle();}
            muted=blend(background,text,.55f);edge=blend(background,text,.16f);
            surface=blend(background,text,.045f);check=luminance(accent)>.62f?Color.BLACK:Color.WHITE;
        }
        private static int blend(int base,int overlay,float amount){
            return Color.rgb(Math.round(Color.red(base)*(1-amount)+Color.red(overlay)*amount),
                    Math.round(Color.green(base)*(1-amount)+Color.green(overlay)*amount),
                    Math.round(Color.blue(base)*(1-amount)+Color.blue(overlay)*amount));
        }
        private static float luminance(int color){return (Color.red(color)*.2126f+Color.green(color)*.7152f+Color.blue(color)*.0722f)/255f;}
    }

    private static final class Option extends LinearLayout implements Checkable {
        final String label;
        final Preview preview;
        final RadioMark mark;
        boolean checked;
        Option(Context context,int choice,Colors colors){
            super(context);label=SignalStylePolicy.choiceLabel(choice);
            setOrientation(VERTICAL);setGravity(Gravity.CENTER_HORIZONTAL);setClickable(true);setFocusable(true);
            setMinimumHeight(dp(context,48));
            setContentDescription(label);setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
            TypedValue feedback=new TypedValue();
            if(context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground,feedback,true)&&feedback.resourceId!=0)
                setBackgroundResource(feedback.resourceId);
            preview=new Preview(context,choice,colors);preview.setId(android.R.id.icon);
            preview.setContentDescription(label+"信号图示");preview.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            addView(preview,new LayoutParams(LayoutParams.MATCH_PARENT,LayoutParams.WRAP_CONTENT));
            TextView caption=new TextView(context);caption.setId(android.R.id.title);caption.setText(label);
            caption.setTextColor(colors.text);caption.setTextSize(TypedValue.COMPLEX_UNIT_SP,18);
            caption.setGravity(Gravity.CENTER);caption.setMinimumHeight(dp(context,48));
            caption.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            mark=new RadioMark(colors);int size=dp(context,24);mark.setBounds(0,0,size,size);
            // Place the radio above the full caption so three columns retain the
            // system font scale and labels can grow naturally without clipping.
            caption.setCompoundDrawables(null,mark,null,null);caption.setCompoundDrawablePadding(dp(context,6));
            LayoutParams captionParams=new LayoutParams(LayoutParams.MATCH_PARENT,LayoutParams.WRAP_CONTENT);
            captionParams.topMargin=dp(context,10);addView(caption,captionParams);
        }
        @Override public void setChecked(boolean selected){
            if(checked==selected)return;checked=selected;preview.selected=selected;preview.invalidate();mark.checked=selected;mark.invalidateSelf();
            refreshDrawableState();sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED);
        }
        @Override public boolean isChecked(){return checked;}
        @Override public void toggle(){setChecked(!checked);}
        @Override public CharSequence getAccessibilityClassName(){return "android.widget.RadioButton";}
        @Override public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info){
            super.onInitializeAccessibilityNodeInfo(info);info.setText(label);info.setContentDescription(label);
            info.setCheckable(true);info.setChecked(checked);info.setClickable(true);
        }
        @Override protected int[] onCreateDrawableState(int extraSpace){
            int[] state=super.onCreateDrawableState(extraSpace+1);
            if(checked)mergeDrawableStates(state,new int[]{android.R.attr.state_checked});return state;
        }
    }

    private static final class Preview extends View {
        final Colors colors;
        final int choice;
        final IosSignalPainter iosPainter=new IosSignalPainter();
        final DualSignalPainter signalPainter=new DualSignalPainter();
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        final Path path=new Path();
        final float[] barHeights={10,15,21,29,38};
        boolean selected;
        Preview(Context context,int choice,Colors colors){super(context);this.choice=choice;this.colors=colors;}
        @Override protected void onMeasure(int widthMeasureSpec,int heightMeasureSpec){
            int width=MeasureSpec.getMode(widthMeasureSpec)==MeasureSpec.UNSPECIFIED?dp(getContext(),160):MeasureSpec.getSize(widthMeasureSpec);
            int height=Math.round(width/2.4f);setMeasuredDimension(resolveSize(width,widthMeasureSpec),resolveSize(height,heightMeasureSpec));
        }
        @Override protected void onDraw(Canvas canvas){
            super.onDraw(canvas);float scale=getWidth()/216f;if(scale<=0)return;
            int save=canvas.save();canvas.scale(scale,scale);
            // The top and right edges reproduce the phone corner in both supplied examples.
            path.reset();path.moveTo(0,4);path.lineTo(165,4);path.cubicTo(198,4,212,22,212,55);path.lineTo(212,88);path.lineTo(0,88);path.close();
            paint.setStyle(Paint.Style.FILL);paint.setColor(colors.surface);canvas.drawPath(path,paint);
            path.reset();path.moveTo(0,4);path.lineTo(165,4);path.cubicTo(198,4,212,22,212,55);path.lineTo(212,88);
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(6);paint.setStrokeCap(Paint.Cap.BUTT);
            paint.setColor(selected?colors.accent:colors.edge);canvas.drawPath(path,paint);
            paint.setStyle(Paint.Style.FILL);paint.setColor(selected?colors.accent:colors.muted);
            if(choice==SignalStylePolicy.IOS_DUAL||choice==SignalStylePolicy.HONOR_DUAL)
                drawDual(canvas,selected?colors.accent:colors.muted);
            else{bars(canvas,40,72,barHeights,7,4);bars(canvas,120,72,barHeights,7,4);}
            canvas.restoreToCount(save);
        }
        private void drawDual(Canvas canvas,int color){
            boolean ios=choice==SignalStylePolicy.IOS_DUAL;
            DualSignalLayout layout=DualSignalLayout.spaced(48,false,new int[]{0,1},
                    new float[][]{{0,0,0},{0,0,0}},-1,null,1,false,ios);
            if(ios)signalPainter.setArtwork((target,part,layer,left,top,right,bottom,foreground)->{
                if(!part.startsWith("row")||!part.endsWith(".signal")||!"whole".equals(layer))return false;
                int row=part.startsWith("row0")?0:1;
                iosPainter.drawRow(getContext(),target,left,top,right,bottom,
                        row==0?4:3,4,false,foreground,row,false,this::invalidate);
                return true;
            });
            else signalPainter.setArtwork(null);
            try{
                signalPainter.drawSpaced(canvas,(216-layout.width)/2,24,layout,4,3,4,4,color,0,-1,null);
            }finally{signalPainter.setArtwork(null);}
        }
        private void bars(Canvas canvas,float x,float baseline,float[] heights,float width,float gap){
            for(float height:heights){canvas.drawRoundRect(x,baseline-height,x+width,baseline,width/2f,width/2f,paint);x+=width+gap;}
        }
    }

    private static final class RadioMark extends Drawable {
        final Colors colors;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);final Path path=new Path();
        final float[] barHeights={10,15,21,29,38};boolean checked;
        RadioMark(Colors colors){this.colors=colors;}
        @Override public void draw(Canvas canvas){
            Rect bounds=getBounds();float size=Math.min(bounds.width(),bounds.height()),cx=bounds.exactCenterX(),cy=bounds.exactCenterY(),radius=size*.45f;
            paint.setColor(checked?colors.accent:colors.muted);paint.setStyle(checked?Paint.Style.FILL:Paint.Style.STROKE);paint.setStrokeWidth(size*.055f);
            canvas.drawCircle(cx,cy,radius,paint);
            if(checked){
                paint.setColor(colors.check);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(size*.085f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
                path.reset();path.moveTo(cx-size*.2f,cy);path.lineTo(cx-size*.05f,cy+size*.15f);path.lineTo(cx+size*.22f,cy-size*.16f);canvas.drawPath(path,paint);
            }
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
