package ls.augment.com;

import android.graphics.text.LineBreaker;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

/** Android layout adapter shared by ordinary header formatting and expanded notification clocks.
 * The caller owns/rebases/restores the native layout records. Children are never reparented. */
public final class HeaderClockLayout {
    private HeaderClockLayout() { }
    /** A native BELOW(date) payload. Only its vertical offset is owned. */
    public static final class Below {
        final View view;final int top;
        public Below(View view){this.view=view;top=((RelativeLayout.LayoutParams)view.getLayoutParams()).topMargin;}
        int extent(){return present(view)?Math.max(0,top)+naturalHeight(view):0;}
    }
    public static boolean present(View view){return view!=null&&view.getVisibility()!=View.GONE;}
    /** The only additional date payload owned by Duo; unrelated OEM children stay native. */
    public static TextView weather(View dateGroup){
        if(!(dateGroup instanceof ViewGroup))return null;ViewGroup group=(ViewGroup)dateGroup;
        for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);
            if(child instanceof TextView&&"ls_augment_notification_weather".equals(child.getTag())&&present(child))return (TextView)child;
        }return null;
    }
    public static int horizontal(View view){ViewGroup.LayoutParams p=view.getLayoutParams();return p instanceof ViewGroup.MarginLayoutParams?((ViewGroup.MarginLayoutParams)p).leftMargin+((ViewGroup.MarginLayoutParams)p).rightMargin:0;}
    public static int vertical(View view){ViewGroup.LayoutParams p=view.getLayoutParams();return p instanceof ViewGroup.MarginLayoutParams?((ViewGroup.MarginLayoutParams)p).topMargin+((ViewGroup.MarginLayoutParams)p).bottomMargin:0;}
    public static int naturalWidth(View view){
        if(!present(view))return 0;
        ViewGroup.LayoutParams allocation=view.getLayoutParams();
        // Dual SIM retains the second native subtree for restoration, but gives
        // its outer cell an explicit zero width. Descendants are no longer
        // occupied header space. A zero-width weighted status container still
        // owns its children's cells through LinearLayout's weight allocation.
        if(allocation!=null&&allocation.width==0
                &&(!(allocation instanceof LinearLayout.LayoutParams)||((LinearLayout.LayoutParams)allocation).weight<=0))return 0;
        if(view instanceof TextView){TextView text=(TextView)view;return (int)Math.ceil(Layout.getDesiredWidth(text.getText(),text.getPaint()))+text.getCompoundPaddingLeft()+text.getCompoundPaddingRight();}
        if(view instanceof ViewGroup){
            ViewGroup group=(ViewGroup)view;boolean row=view instanceof LinearLayout&&((LinearLayout)view).getOrientation()==LinearLayout.HORIZONTAL||view.getClass().getName().endsWith("StatusIconContainer");
            int width=0;for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(!present(child))continue;int value=naturalWidth(child)+horizontal(child);width=row?width+value:Math.max(width,value);}
            if(width>0){
                int content=width+view.getPaddingLeft()+view.getPaddingRight();
                // A reserved full-canvas pair can be a 92px FrameLayout with two
                // 46px layers. Its positive width is real occupied space. A
                // MATCH_PARENT allocation, in contrast, may already be clipped.
                ViewGroup.LayoutParams lp=view.getLayoutParams();
                return Math.max(content,lp!=null&&lp.width>0?lp.width:0);
            }
        }
        ViewGroup.LayoutParams lp=view.getLayoutParams();return lp!=null&&lp.width>=0?lp.width:Math.max(0,view.getMeasuredWidth());
    }
    public static int naturalHeight(View view){
        if(!present(view))return 0;ViewGroup.LayoutParams lp=view.getLayoutParams();
        if(lp!=null&&lp.height>=0)return lp.height;
        if(view instanceof TextView){TextView text=(TextView)view;android.graphics.Paint.FontMetricsInt f=text.getPaint().getFontMetricsInt();return f.bottom-f.top+text.getCompoundPaddingTop()+text.getCompoundPaddingBottom();}
        if(view instanceof ViewGroup){int height=0;ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(present(child))height=Math.max(height,naturalHeight(child)+vertical(child));}if(height>0)return height+view.getPaddingTop()+view.getPaddingBottom();}
        return Math.max(0,view.getMeasuredHeight());
    }
    /** Prefer semantic boundaries; the caller retains the continuous accessible description. */
    public static CharSequence lines(CharSequence source,TextPaint paint,int width){
        SpannableStringBuilder text=new SpannableStringBuilder(source);for(int i=0;i<text.length();i++)if(text.charAt(i)=='\n'){
            if(i+1<text.length()&&text.charAt(i+1)==':'){text.delete(i,i+1);i--;}else text.replace(i,i+1," ");
        }
        if(width<=0||Layout.getDesiredWidth(text,paint)<=width)return text;
        int space=text.toString().lastIndexOf(' ');if(space>0)text.replace(space,space+1,"\n");
        int end=space>0?space:text.length();
        if(Layout.getDesiredWidth(text.subSequence(0,end),paint)>width){
            int colon=text.toString().lastIndexOf(':',end-1),first=text.toString().indexOf(':');
            // HH:mm is the minimum semantic time unit. Only a seconds suffix
            // may move to another row; never split hours/minutes or digits.
            if(first<0||colon==first)return null;
            text.insert(colon,"\n");
        }
        int start=0;for(int endOfLine=0;endOfLine<=text.length();endOfLine++)if(endOfLine==text.length()||text.charAt(endOfLine)=='\n'){
            if(Layout.getDesiredWidth(text.subSequence(start,endOfLine),paint)>width)return null;start=endOfLine+1;
        }
        return text;
    }
    private static int[] textBox(TextView text,int width,int minimumHeight,boolean canWrap){
        int inner=Math.max(1,width-text.getCompoundPaddingLeft()-text.getCompoundPaddingRight());
        StaticLayout layout=StaticLayout.Builder.obtain(text.getText(),0,text.length(),text.getPaint(),inner)
                .setAlignment(Layout.Alignment.ALIGN_NORMAL).setIncludePad(text.getIncludeFontPadding())
                .setLineSpacing(text.getLineSpacingExtra(),text.getLineSpacingMultiplier()).setBreakStrategy(LineBreaker.BREAK_STRATEGY_SIMPLE).build();
        int explicit=1;for(int i=0;i<text.length();i++)if(text.getText().charAt(i)=='\n')explicit++;
        if(!canWrap&&layout.getLineCount()!=explicit)return null;
        float widest=0;for(int i=0;i<layout.getLineCount();i++)widest=Math.max(widest,layout.getLineWidth(i));
        if(widest>inner+.01f)return null;
        return new int[]{(int)Math.ceil(widest)+text.getCompoundPaddingLeft()+text.getCompoundPaddingRight(),Math.max(minimumHeight,layout.getHeight()+text.getCompoundPaddingTop()+text.getCompoundPaddingBottom())};
    }
    public static HeaderClockGeometry.Plan apply(ViewGroup header,TextView clock,TextView date,View timeGroup,View dateGroup,
            View right,View icons,View footer,View period,Below[] below,int nativeTop,int nativeClockHeight,int nativeDateHeight,
            int accessoryBottom,int limit,int gap,int dateGap,int align,int offsetX,int offsetY,boolean expanded){
        int width=header.getWidth()-header.getPaddingLeft()-header.getPaddingRight();
        if(width<=0)return null;
        int inset=expanded?Math.round(16*header.getResources().getDisplayMetrics().density):0;
        int periodWidth=present(period)?naturalWidth(period)+horizontal(period):0;
        int clockBudget=width-2*inset-periodWidth-horizontal(clock);
        if(clockBudget<=0)return null;
        CharSequence wrapped=lines(clock.getText(),clock.getPaint(),clockBudget-clock.getCompoundPaddingLeft()-clock.getCompoundPaddingRight());
        if(wrapped==null)return null;
        if(!wrapped.toString().contentEquals(clock.getText()))clock.setText(wrapped);
        multiline(clock);multiline(date);
        TextView weather=weather(dateGroup);
        int[] cb=textBox(clock,clockBudget,nativeClockHeight,false),db=textBox(date,Math.max(1,width-2*inset-(weather==null?horizontal(date):0)),nativeDateHeight,true);
        if(cb==null||db==null)return null;
        int cw=cb[0]+horizontal(clock)+periodWidth,ch=Math.max(cb[1]+vertical(clock),present(period)?naturalHeight(period)+vertical(period):0);
        int dw=db[0]+horizontal(date),dh=db[1]+vertical(date);
        int[] wb=null;boolean weatherBelow=false;int weatherGap=0;
        if(weather!=null){
            // The native weather hook uses END_OF(date). Both nodes now share
            // this measured box, including when a late provider result changes.
            // Owned child coordinates must never become intrinsic margins on
            // the next pass, especially in RTL.
            int dateBudget=width-2*inset;db=textBox(date,dateBudget,nativeDateHeight,true);
            if(db==null)return null;
            multiline(weather);if(weather.getMaxWidth()!=Integer.MAX_VALUE)weather.setMaxWidth(Integer.MAX_VALUE);
            weatherGap=Math.round(8*header.getResources().getDisplayMetrics().density);
            int wanted=naturalWidth(weather);
            weatherBelow=(long)db[0]+weatherGap+wanted>dateBudget;
            wb=textBox(weather,weatherBelow?dateBudget:Math.max(1,wanted),0,true);
            if(wb==null)return null;
            // Wrapped content keeps its actual measure width so a second
            // TextView layout cannot reflow to more lines than budgeted.
            if(weatherBelow)wb[0]=dateBudget;
            dw=weatherBelow?Math.max(db[0],wb[0]):db[0]+weatherGap+wb[0];
            dh=weatherBelow?db[1]+weatherGap+wb[1]:Math.max(db[1],wb[1]);
        }
        // These direct-child margins become absolute positions owned by this adapter;
        // counting them again as intrinsic content would grow the header every pass.
        int footerHeight=present(footer)?naturalHeight(footer):0;
        // Notification mode keeps a zero-height OEM footer in the tree. Its allocated
        // MATCH_PARENT width is not visible content and must not create another row.
        int footerWidth=footerHeight>0?naturalWidth(footer):0;
        ViewGroup.MarginLayoutParams ip=icons.getLayoutParams() instanceof ViewGroup.MarginLayoutParams?(ViewGroup.MarginLayoutParams)icons.getLayoutParams():null;
        int iconBottom=(ip==null?0:ip.topMargin)+naturalHeight(icons)+right.getPaddingTop()+right.getPaddingBottom();
        int iconWidth=naturalWidth(icons)+(ip==null?0:ip.leftMargin+ip.rightMargin);
        int belowHeight=0;if(below!=null)for(Below item:below)belowHeight=Math.max(belowHeight,item.extent());
        HeaderClockGeometry.Plan plan=HeaderClockGeometry.place(width,limit,Math.max(0,nativeTop)+Math.max(0,offsetY),iconBottom,accessoryBottom,
                iconWidth,cw,ch,dw,dh,footerWidth,footerHeight,gap,dateGap,belowHeight,
                expanded||hasPeriod(clock.getText()));
        if(!plan.valid)return plan;
        size(clock,cb[0],cb[1]);size(date,db[0],db[1]);
        if(weather!=null){
            boolean rtl=header.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;
            place(date,rtl?dw-db[0]:0,weatherBelow?0:(dh-db[1])/2,db[0],db[1]);
            int wx=weatherBelow?(rtl?dw-wb[0]:0):(rtl?0:db[0]+weatherGap);
            place(weather,wx,weatherBelow?db[1]+weatherGap:(dh-wb[1])/2,wb[0],wb[1]);
        }
        int x=aligned(align,width,cw,inset,offsetX);
        // Same-row clocks use logical start, never the occupied trailing icon area.
        if(!plan.stacked)x=header.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?width-cw:0;
        place(timeGroup,x,plan.clockTop,cw,ch);
        int dx=plan.splitFooter||footerWidth==0?aligned(align,width,dw,inset,offsetX):(header.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?width-dw-inset:inset);
        place(dateGroup,dx,plan.dateTop,dw,dh);
        place(right,0,0,width,plan.bottom);
        if(footerWidth>0&&footerHeight>0)place(footer,header.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?0:width-footerWidth,plan.footerTop,footerWidth,footerHeight);
        if(below!=null)for(Below item:below)if(present(item.view)){
            RelativeLayout.LayoutParams lp=(RelativeLayout.LayoutParams)item.view.getLayoutParams();
            int top=item.top+plan.bottom-belowHeight-plan.dateTop-dh;
            if(lp.topMargin!=top){lp.topMargin=top;item.view.setLayoutParams(lp);}
        }
        size(header,header.getLayoutParams().width,header.getPaddingTop()+plan.bottom+header.getPaddingBottom());
        return plan;
    }
    private static int aligned(int align,int width,int child,int inset,int offset){return Math.max(inset,Math.min(Math.max(inset,width-inset-child),Math.round(NotificationLayoutPolicy.alignedX(align,width,child,inset,offset))));}
    // Period formatting has a trailing semantic field (possibly on its own line).
    // Reserve the icon band from the first frame, including while Bluetooth is GONE.
    // A radio state or a proportional time digit must not move the clock/list.
    private static boolean hasPeriod(CharSequence value){
        String text=value.toString().trim();
        for(int i=text.length()-1;i>=0;i--){char c=text.charAt(i);
            if(c==' '||c=='\n')return i+1<text.length()&&!Character.isDigit(text.charAt(i+1))&&text.charAt(i+1)!=':';
        }
        return false;
    }
    private static void multiline(TextView text){
        if(text.isSingleLine())text.setSingleLine(false);
        if(text.isHorizontallyScrollable())text.setHorizontallyScrolling(false);
        if(text.getMaxLines()!=Integer.MAX_VALUE)text.setMaxLines(Integer.MAX_VALUE);
        if(text.getEllipsize()!=null)text.setEllipsize(null);
    }
    private static void size(View view,int width,int height){ViewGroup.LayoutParams p=view.getLayoutParams();if(p!=null&&(p.width!=width||p.height!=height)){p.width=width;p.height=height;view.setLayoutParams(p);}}
    public static void place(View view,int left,int top,int width,int height){
        if(!(view.getLayoutParams() instanceof RelativeLayout.LayoutParams))throw new IllegalArgumentException("native RelativeLayout child required");
        RelativeLayout.LayoutParams p=(RelativeLayout.LayoutParams)view.getLayoutParams();
        boolean changed=p.width!=width||p.height!=height||p.leftMargin!=left||p.topMargin!=top||p.rightMargin!=0||p.bottomMargin!=0||p.isMarginRelative();
        int[] rules=p.getRules();for(int i=0;i<rules.length;i++){int wanted=i==RelativeLayout.ALIGN_PARENT_LEFT||i==RelativeLayout.ALIGN_PARENT_TOP?-1:0;if(rules[i]!=wanted)changed=true;}
        if(!changed)return;
        for(int i=0;i<rules.length;i++)p.removeRule(i);p.addRule(RelativeLayout.ALIGN_PARENT_LEFT);p.addRule(RelativeLayout.ALIGN_PARENT_TOP);
        p.setMarginStart(Integer.MIN_VALUE);p.setMarginEnd(Integer.MIN_VALUE);p.leftMargin=left;p.topMargin=top;p.rightMargin=p.bottomMargin=0;p.width=width;p.height=height;view.setLayoutParams(p);
    }
}
