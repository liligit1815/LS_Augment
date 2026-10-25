package ls.augment.com;

import android.text.Layout;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/** One responsive information row above a native slider. Help keeps its own target. */
// Code-only view; never inflated from XML.
//noinspection ViewConstructor
final class NumericParameterHeader extends ViewGroup {
    private final UiKit ui;
    private final View title;
    private final TextView value;
    private final View help;
    private boolean stacked;
    private int titleHeight, valueWidth, textWidth;

    NumericParameterHeader(UiKit ui, View title, TextView value) {
        super(ui.activity);
        this.ui=ui;this.title=title;this.value=value;
        View trailing=null;
        if(title instanceof ViewGroup){
            ViewGroup group=(ViewGroup)title;
            for(int i=group.getChildCount()-1;i>=0;i--){
                View child=group.getChildAt(i);
                if(child instanceof android.widget.ImageButton){trailing=child;group.removeView(child);break;}
            }
        }
        help=trailing;
        addView(title);addView(value);if(help!=null)addView(help);
        setTag("numeric-parameter-header");
        setMinimumHeight(ui.dp(44));
    }

    static int preferredWidth(View view){
        if(view instanceof TextView){
            TextView text=(TextView)view;
            return (int)Math.ceil(Layout.getDesiredWidth(text.getText(),text.getPaint()))+text.getPaddingLeft()+text.getPaddingRight();
        }
        int width=view.getPaddingLeft()+view.getPaddingRight();
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)width+=preferredWidth(((ViewGroup)view).getChildAt(i));
        return width;
    }
    @Override protected void onMeasure(int widthSpec,int heightSpec){
        int width=MeasureSpec.getSize(widthSpec);
        if(MeasureSpec.getMode(widthSpec)==MeasureSpec.UNSPECIFIED)width=preferredWidth(title)+preferredWidth(value)+ui.dp(help==null?8:33);
        int helpWidth=help==null?0:ui.dp(25),gap=ui.dp(8);
        textWidth=Math.max(0,width-helpWidth);
        valueWidth=Math.min(textWidth,preferredWidth(value));
        stacked=preferredWidth(title)+valueWidth+gap>textWidth;
        title.measure(MeasureSpec.makeMeasureSpec(stacked?textWidth:Math.max(0,textWidth-valueWidth-gap),MeasureSpec.EXACTLY),MeasureSpec.makeMeasureSpec(0,MeasureSpec.UNSPECIFIED));
        value.measure(MeasureSpec.makeMeasureSpec(stacked?textWidth:valueWidth,MeasureSpec.EXACTLY),MeasureSpec.makeMeasureSpec(0,MeasureSpec.UNSPECIFIED));
        titleHeight=title.getMeasuredHeight();
        if(help!=null)help.measure(MeasureSpec.makeMeasureSpec(helpWidth,MeasureSpec.EXACTLY),MeasureSpec.makeMeasureSpec(ui.dp(44),MeasureSpec.EXACTLY));
        int height=stacked?titleHeight+value.getMeasuredHeight():Math.max(titleHeight,value.getMeasuredHeight());
        setMeasuredDimension(width,resolveSize(Math.max(ui.dp(44),height),heightSpec));
    }
    @Override protected void onLayout(boolean changed,int left,int top,int right,int bottom){
        int h=bottom-top;
        if(stacked){title.layout(0,0,textWidth,titleHeight);value.layout(0,titleHeight,textWidth,titleHeight+value.getMeasuredHeight());}
        else{
            int y=(h-title.getMeasuredHeight())/2;title.layout(0,y,title.getMeasuredWidth(),y+title.getMeasuredHeight());
            y=(h-value.getMeasuredHeight())/2;value.layout(textWidth-valueWidth,y,textWidth,y+value.getMeasuredHeight());
        }
        if(help!=null){int y=stacked?0:(h-help.getMeasuredHeight())/2;help.layout(textWidth,y,right-left,y+help.getMeasuredHeight());}
    }
    @Override protected LayoutParams generateDefaultLayoutParams(){return new LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT);}
}
