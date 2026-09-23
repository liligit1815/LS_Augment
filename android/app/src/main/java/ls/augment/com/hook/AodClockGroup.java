package ls.augment.com.hook;

import android.text.Layout;
import android.text.Spanned;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.style.RelativeSizeSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/** Fit split clock digits together, retaining the OEM size ratios and spacing. */
final class AodClockGroup {
    private static final Map<View,Fit> CACHE=new WeakHashMap<>();
    private static final class Fit {String key;float scale;Fit(String k,float s){key=k;scale=s;}}
    private static final class Size {int w,h;Size(int width,int height){w=width;h=height;}int axis(boolean horizontal){return horizontal?w:h;}}
    static View owner(View view){
        for(View v=view;v!=null;v=parent(v)){
            String name=v.getClass().getSimpleName();
            if(name.equals("NubiaAodNumClockLayout")||name.equals("AodClockStyleVertical")||name.equals("AodDualClockStyle"))return v;
        }return null;
    }
    static View parent(View v){return v.getParent() instanceof View?(View)v.getParent():null;}
    static boolean contains(View root,View child){for(View v=child;v!=null;v=parent(v))if(v==root)return true;return false;}
    static View commonParent(Set<TextView> views){
        View v=parent(views.iterator().next());
        while(v!=null){boolean all=true;for(View child:views)if(!contains(v,child)){all=false;break;}if(all)return v;v=parent(v);}return null;
    }
    static int textHeight(TextView view,TextPaint paint){
        CharSequence text=view.getText();StaticLayout.Builder b=StaticLayout.Builder.obtain(text,0,text.length(),paint,Math.max(1,(int)Math.ceil(Layout.getDesiredWidth(text,paint))))
                .setIncludePad(view.getIncludeFontPadding()).setLineSpacing(view.getLineSpacingExtra(),view.getLineSpacingMultiplier());
        if(android.os.Build.VERSION.SDK_INT>=28)b.setUseLineSpacingFromFallbacks(view.isFallbackLineSpacing());
        return b.build().getHeight();
    }
    static float fit(View root,Map<TextView,Float> bases,Map<View,Integer> overlaps,int width,int height,float requested){
        StringBuilder key=new StringBuilder().append(width).append('|').append(height).append('|').append(requested);signature(root,bases,overlaps,key);
        String value=key.toString();Fit previous=CACHE.get(root);if(previous!=null&&value.equals(previous.key))return previous.scale;
        float low=0,high=requested;Size size=measure(root,bases,overlaps,high);
        if(size.w>width||size.h>height){Size fixed=measure(root,bases,overlaps,0);if(fixed.w>width||fixed.h>height)high=Math.min(requested,1);
            else {for(int i=0;i<18;i++){float middle=(low+high)/2;size=measure(root,bases,overlaps,middle);if(size.w<=width&&size.h<=height)low=middle;else high=middle;}high=low;}}
        CACHE.put(root,new Fit(value,high));return high;
    }
    private static void signature(View v,Map<TextView,Float>bases,Map<View,Integer>overlaps,StringBuilder out){
        out.append(';').append(v.getVisibility());ViewGroup.LayoutParams p=v.getLayoutParams();if(p!=null)out.append(':').append(p.width).append(',').append(p.height);
        if(p instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)p;out.append(',').append(m.leftMargin).append(',').append(overlaps.containsKey(v)?overlaps.get(v):m.topMargin).append(',').append(m.rightMargin).append(',').append(m.bottomMargin);}
        if(v instanceof TextView){TextView t=(TextView)v;out.append(':').append(t.getText()).append(':').append(bases.containsKey(t)?bases.get(t):t.getTextSize()).append(':').append(System.identityHashCode(t.getTypeface())).append(':').append(t.getTextScaleX());
            if(t.getText() instanceof Spanned)for(RelativeSizeSpan span:((Spanned)t.getText()).getSpans(0,t.length(),RelativeSizeSpan.class))out.append(':').append(span.getSizeChange());}
        if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)signature(g.getChildAt(i),bases,overlaps,out);}
    }
    private static Size measure(View v,Map<TextView,Float>bases,Map<View,Integer>overlaps,float scale){
        if(v.getVisibility()==View.GONE)return new Size(0,0);
        int w=0,h=0;ViewGroup.LayoutParams p=v.getLayoutParams();
        if(v instanceof TextView){TextView t=(TextView)v;TextPaint paint=new TextPaint(t.getPaint());Float base=bases.get(t);if(base!=null)paint.setTextSize(base*scale);
            w=(int)Math.ceil(Layout.getDesiredWidth(t.getText(),paint))+t.getCompoundPaddingLeft()+t.getCompoundPaddingRight();h=textHeight(t,paint)+t.getCompoundPaddingTop()+t.getCompoundPaddingBottom();}
        else if(v instanceof ViewGroup){ViewGroup group=(ViewGroup)v;Map<View,Size> children=new HashMap<>();for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(child.getVisibility()!=View.GONE)children.put(child,measure(child,bases,overlaps,scale));}
            int orientation=orientation(group);
            for(Map.Entry<View,Size> entry:children.entrySet()){View child=entry.getKey();Size size=entry.getValue();int cw=size.w+margin(child,true,false,overlaps,scale)+margin(child,true,true,overlaps,scale),ch=size.h+margin(child,false,false,overlaps,scale)+margin(child,false,true,overlaps,scale);
                if(group instanceof RelativeLayout){cw=position(child,true,children,overlaps,scale,new HashSet<>())+size.w+margin(child,true,true,overlaps,scale);ch=position(child,false,children,overlaps,scale,new HashSet<>())+size.h+margin(child,false,true,overlaps,scale);}
                w=orientation==LinearLayout.HORIZONTAL?w+cw:Math.max(w,cw);h=orientation==LinearLayout.VERTICAL?h+ch:Math.max(h,ch);}
            w+=v.getPaddingLeft()+v.getPaddingRight();h+=v.getPaddingTop()+v.getPaddingBottom();}
        // A MATCH_PARENT spacer consumes the final available width, but has
        // no intrinsic requirement for its previously measured full width.
        else {w=p!=null&&p.width==ViewGroup.LayoutParams.MATCH_PARENT?v.getMinimumWidth():Math.max(v.getMinimumWidth(),v.getMeasuredWidth());h=p!=null&&p.height==ViewGroup.LayoutParams.MATCH_PARENT?v.getMinimumHeight():Math.max(v.getMinimumHeight(),v.getMeasuredHeight());}
        return new Size(p!=null&&p.width>0?p.width:w,p!=null&&p.height>0?p.height:h);
    }
    private static int margin(View v,boolean horizontal,boolean end,Map<View,Integer>overlaps,float scale){
        ViewGroup.LayoutParams p=v.getLayoutParams();if(!(p instanceof ViewGroup.MarginLayoutParams))return 0;ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)p;
        if(!horizontal&&!end&&overlaps.containsKey(v))return Math.round(overlaps.get(v)*Math.min(1,scale));
        return horizontal?(end?m.rightMargin:m.leftMargin):(end?m.bottomMargin:m.topMargin);
    }
    private static int orientation(ViewGroup group){
        if(group instanceof LinearLayout)return ((LinearLayout)group).getOrientation();
        // OEM MaskLinearLayout extends LinearLayoutCompat. Its children still
        // consume consecutive space; treating them as overlays misses height.
        try{return (Integer)SystemUiAdapter.call(group,"getOrientation");}
        catch(ReflectiveOperationException ignored){return -1;}
    }
    private static int position(View v,boolean horizontal,Map<View,Size>sizes,Map<View,Integer>overlaps,float scale,Set<View>visiting){
        int start=margin(v,horizontal,false,overlaps,scale);if(!visiting.add(v)||!(v.getLayoutParams() instanceof RelativeLayout.LayoutParams))return start;
        RelativeLayout.LayoutParams p=(RelativeLayout.LayoutParams)v.getLayoutParams();int[] rules=p.getRules();
        int after=rules[horizontal?RelativeLayout.RIGHT_OF:RelativeLayout.BELOW];if(horizontal&&after==0)after=rules[RelativeLayout.END_OF];
        int alignEnd=rules[horizontal?RelativeLayout.ALIGN_RIGHT:RelativeLayout.ALIGN_BOTTOM];if(horizontal&&alignEnd==0)alignEnd=rules[RelativeLayout.ALIGN_END];
        for(Map.Entry<View,Size> entry:sizes.entrySet()){View anchor=entry.getKey();if(anchor==v||anchor.getId()==View.NO_ID)continue;
            if(after!=0&&anchor.getId()==after)return start+position(anchor,horizontal,sizes,overlaps,scale,visiting)+entry.getValue().axis(horizontal)+margin(anchor,horizontal,true,overlaps,scale);
            if(alignEnd!=0&&anchor.getId()==alignEnd)return position(anchor,horizontal,sizes,overlaps,scale,visiting)+entry.getValue().axis(horizontal)-sizes.get(v).axis(horizontal)-margin(v,horizontal,true,overlaps,scale);}
        return start;
    }
}
