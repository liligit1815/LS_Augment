package ls.augment.com.hook;

import android.app.Instrumentation;
import android.graphics.Outline;
import android.graphics.Rect;
import android.widget.ImageView;
import org.json.JSONArray;
import org.json.JSONObject;

/** Tests production outline geometry; live SystemUI screenshots verify clipping and layout. */
public final class IslandAppStyleRegressionCases {
    public static JSONObject run(Instrumentation test)throws Exception{
        JSONArray cases=new JSONArray();Throwable[] failure={null};int[] checks={0};
        test.runOnMainSync(()->{
            try{
                float density=test.getTargetContext().getResources().getDisplayMetrics().density;
                for(int sizeDp:new int[]{24,44}){
                    int size=Math.round(sizeDp*density);ImageView icon=new ImageView(test.getTargetContext());
                    icon.layout(0,0,size,size);
                    for(int step=0;step<6;step++){
                        boolean circle=step%2==1;
                        NativeIslandHost.applyIconShape(icon,circle,Math.round(5*density));
                        Outline outline=new Outline();icon.getOutlineProvider().getOutline(icon,outline);
                        Rect bounds=new Rect();float expected=circle?size/2f:Math.round(5*density);
                        require(outline.getRect(bounds)&&bounds.equals(new Rect(0,0,size,size)),"Icon bounds changed",checks);
                        require(Math.abs(outline.getRadius()-expected)<.01f,"Icon shape did not switch",checks);
                        require(icon.getClipToOutline(),"Hardware clipping disabled",checks);
                        require(icon.getWidth()==size&&icon.getHeight()==size,"Shape changed layout",checks);
                        cases.put(new JSONObject().put("sizeDp",sizeDp).put("circle",circle).put("radiusPx",outline.getRadius()));
                    }
                }
            }catch(Throwable error){failure[0]=error;}
        });
        if(failure[0]!=null)throw new AssertionError("Native icon outline regression",failure[0]);
        return new JSONObject().put("success",true).put("assertions",checks[0]).put("cases",cases)
                .put("configurationWrites",0).put("scope","Production native ImageView outline geometry on Android; live-window pixels verified separately");
    }
    private static void require(boolean value,String message,int[] checks){checks[0]++;if(!value)throw new AssertionError(message);}
}
