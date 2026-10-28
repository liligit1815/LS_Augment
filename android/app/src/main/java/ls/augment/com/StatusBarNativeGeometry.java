package ls.augment.com;

import android.view.View;
import android.view.ViewGroup;
import org.json.JSONObject;

/** OEM layout coordinates only: module transforms never become the next baseline. */
public final class StatusBarNativeGeometry {
    public final float left,top,right,bottom,width,height,density;
    public final String source;
    private StatusBarNativeGeometry(float l,float t,float r,float b,View root,String source){
        left=l;top=t;right=r;bottom=b;width=root.getWidth();height=root.getHeight();density=root.getResources().getDisplayMetrics().density;this.source=source;
    }
    public static StatusBarNativeGeometry read(ViewGroup root){
        if(root.getWidth()<=0||root.getHeight()<=0)return null;
        for(String name:new String[]{"status_bar_contents","keyguard_status_bar_contents"}){
            View content=measured(root,name);if(content!=null)return fromInsets(root,insets(root,content),name);
        }
        // Older keyguard layouts express their OEM insets on the two edge
        // children, not on a shared contents container or the bar root.
        View start=measured(root,"keyguard_carrier_text"),end=measured(root,"system_icons_container");
        if(start!=null&&end!=null){float[] a=insets(root,start),b=insets(root,end);if(a!=null&&b!=null)
            return fromInsets(root,new float[]{a[0],Math.max(a[1],b[1]),b[2],Math.max(a[3],b[3])},"keyguard_edge_contents");}
        if(root.getPaddingLeft()==0&&root.getPaddingTop()==0&&root.getPaddingRight()==0&&root.getPaddingBottom()==0)return null;
        return fromInsets(root,insets(root,root),"root_padding");
    }
    private static View measured(ViewGroup root,String name){int id=root.getResources().getIdentifier(name,"id",root.getContext().getPackageName());View view=id==0?null:root.findViewById(id);return view!=null&&view.getWidth()>0&&view.getHeight()>0?view:null;}
    private static float[] insets(ViewGroup root,View content){
        float x=0,y=0;View at=content;
        while(at!=root){x+=at.getLeft();y+=at.getTop();if(!(at.getParent() instanceof View))return null;at=(View)at.getParent();x-=at.getScrollX();y-=at.getScrollY();}
        float l=x+content.getPaddingLeft(),t=y+content.getPaddingTop();
        float r=root.getWidth()-x-content.getWidth()+content.getPaddingRight(),b=root.getHeight()-y-content.getHeight()+content.getPaddingBottom();
        return new float[]{l,t,r,b};
    }
    private static StatusBarNativeGeometry fromInsets(ViewGroup root,float[] v,String source){
        if(v==null||v[0]+v[2]>=root.getWidth()||v[1]+v[3]>=root.getHeight())return null;
        return new StatusBarNativeGeometry(v[0],v[1],v[2],v[3],root,source);
    }
    public JSONObject json(){JSONObject out=new JSONObject();try{out.put("left",left/density).put("top",top/density).put("right",right/density).put("bottom",bottom/density)
            .put("width",width/density).put("height",height/density).put("source",source);}catch(org.json.JSONException ignored){}return out;}
}
