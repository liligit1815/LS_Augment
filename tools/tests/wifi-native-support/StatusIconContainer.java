package com.android.systemui.statusbar.phone;

import android.view.View;
import android.widget.LinearLayout;
import com.android.systemui.statusbar.StatusIconDisplayable;
import java.util.*;

/** Test-only port of NX809J's pure width and right-to-left overflow calculation.
 * Android measurement/layout is real. This is not execution of the OEM binary.
 * Source: cached SystemUI StatusIconContainer + StatusIconContainerAdapt smali. */
public class StatusIconContainer extends LinearLayout {
    public static int MAX_ICONS=10;
    public int mIconSpacing=0,nativeEndMargin=0,measurePasses=0,layoutPasses=0;
    public ArrayList<String> mIgnoredSlots=new ArrayList<>();
    public boolean mShouldRestrictIcons=false,mNeedsUnderflow=false,nativeLayout=false,throwWidth=false;
    public final Map<View,Integer> extraCost=new IdentityHashMap<>(),visibleState=new IdentityHashMap<>();
    public StatusIconContainer(android.content.Context c){super(c);setOrientation(HORIZONTAL);}
    private static int extra(View v){
        StatusIconContainer row=(StatusIconContainer)v.getParent();
        if(row.throwWidth)throw new IllegalStateException("unknown native width helper");
        return v.getPaddingStart()+v.getPaddingEnd()+row.nativeEndMargin+row.extraCost.getOrDefault(v,0);
    }
    public static int getViewTotalMeasuredWidth(View v){return v.getMeasuredWidth()+extra(v);}
    public static int getViewTotalWidth(View v){return v.getWidth()+extra(v);}
    boolean eligible(View v){StatusIconDisplayable i=(StatusIconDisplayable)v;return i.isIconVisible()&&!i.isIconBlocked()&&!mIgnoredSlots.contains(i.getSlot());}
    @Override protected void onMeasure(int ws,int hs){
        measurePasses++;
        if(!nativeLayout){super.onMeasure(ws,hs);return;}
        int count=0,needed=getPaddingStart()+getPaddingEnd(),height=0;
        for(int i=0;i<getChildCount();i++){
            View v=getChildAt(i);measureChild(v,ws,hs);
            if(!eligible(v))continue;
            needed+=getViewTotalMeasuredWidth(v);height=Math.max(height,v.getMeasuredHeight());count++;
        }
        needed+=Math.max(0,count-1)*mIconSpacing;
        int width=resolveSize(needed,ws);mNeedsUnderflow=needed>width||(mShouldRestrictIcons&&count>MAX_ICONS);
        setMeasuredDimension(width,resolveSize(height,hs));
    }
    @Override protected void onLayout(boolean changed,int l,int t,int r,int b){
        layoutPasses++;
        if(!nativeLayout){super.onLayout(changed,l,t,r,b);return;}
        int x=getWidth()-getPaddingEnd(),count=0,total=0;
        for(int i=0;i<getChildCount();i++)if(eligible(getChildAt(i)))total++;
        int max=total>MAX_ICONS?MAX_ICONS-1:MAX_ICONS;
        for(int i=getChildCount()-1;i>=0;i--){
            View v=getChildAt(i);v.layout(0,0,v.getMeasuredWidth(),v.getMeasuredHeight());
            if(!eligible(v)){visibleState.put(v,2);continue;}
            x-=getViewTotalWidth(v);
            // NX809J getUnderFlowWidth() is zero; SHOW_DOT_ICON=false.
            // handleNotShowDotIcon hides the negative leftmost state and all
            // preceding states, rather than drawing the AOSP overflow dot.
            boolean hidden=(mNeedsUnderflow&&x<getPaddingStart())||(mShouldRestrictIcons&&count>=max);
            visibleState.put(v,hidden?2:0);
            v.setTranslationX(getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?getWidth()-x-v.getWidth():x);
            x-=mIconSpacing;count++;
        }
    }
}
