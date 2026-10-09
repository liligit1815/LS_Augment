package ls.augment.com;

import java.util.function.Function;

/** Offsets are percentages of the complete icon diameter, independent of content size. */
public final class ConnectivityIconLayout {
    public final int[] x=new int[3],y=new int[3];
    public final int[] powerX=new int[2],powerY=new int[2],powerScale={100,100};

    public static String content(String[] values,int region){
        return values!=null&&region<values.length?values[region]:new String[]{"battery","wifi","dual"}[region];
    }
    public static float contentScale(int[] values,int region){
        int value=values!=null&&region<values.length?values[region]:100;
        return Math.max(ConfigSchema.CONNECTIVITY_SCALE_MIN,Math.min(ConfigSchema.CONNECTIVITY_SCALE_MAX,value))/100f;
    }
    public static float contentFit(String content,int region,float scale){
        boolean battery=content.equals("battery");
        float w=region==1?(battery?62:56):40,h=region==1?(battery?36:24):(battery?26:18);
        return Math.min(w/(battery?52:content.equals("wifi")?44:42),h/(content.equals("wifi")?30:battery?32:18))*(scale/1.5f);
    }
    public static float signalRadius(int region,int row,int sim,int rows){
        return region==2?(sim==0?43:35.5f):rows==1?34:region==0?(row==0?34:26.5f):(row==0?26.5f:34);
    }
    /** Original vector and artwork canvas before region offset, in 100-unit circle space. */
    public static float[] signalBox(ConnectivityIconState state,int region,int row,int sim,int rows,float scale){
        float centerY=region==1?19:50,radius=signalRadius(region,row,sim,rows),dot=2.15f*scale;
        float half=(state.barCount(sim)-1)*(6.96f*scale)/2/radius;
        float l=50-radius*(float)Math.sin(half)-dot,inner=radius*(float)Math.cos(half);
        return new float[]{l,region==0?centerY-radius-dot:centerY+inner-dot,100-l,region==0?centerY-inner+dot:centerY+radius+dot};
    }
    public static float signalGap(ConnectivityIconState state,String[] contents,int[] scales,float stroke,ConnectivityIconLayout layout){
        String lower=content(contents,2);float scale=contentScale(scales,2),ringStroke=Math.max(3,Math.min(10,stroke));
        boolean enabled=layout.x[2]==0&&layout.y[2]==0&&!state.sims.isEmpty()&&(lower.equals("dual")||lower.equals("data")&&state.activeDataRow()>=0);
        float gap=enabled?(float)Math.toDegrees((state.barCount(0)-1)*(6.96f*scale)/2/43f+Math.asin((2.15f*scale+ringStroke/2+1.1f)/43f)):0;
        if(enabled&&lower.equals("dual")&&state.sims.size()>1){
            float inner=(float)Math.toDegrees((state.barCount(1)-1)*(6.96f*scale)/2/35.5f+Math.asin((2.15f*scale+ringStroke/2+1.1f)/35.5f));gap=Math.max(gap,inner);
        }
        return gap;
    }

    public static ConnectivityIconLayout read(Function<String,String> values){
        ConnectivityIconLayout layout=new ConnectivityIconLayout();
        for(int i=0;i<3;i++){
            layout.x[i]=read(values,ConfigSchema.CONNECTIVITY_X_KEYS[i]);
            layout.y[i]=read(values,ConfigSchema.CONNECTIVITY_Y_KEYS[i]);
        }
        for(int i=0;i<2;i++){
            layout.powerX[i]=read(values,ConfigSchema.CONNECTIVITY_POWER_X_KEYS[i]);
            layout.powerY[i]=read(values,ConfigSchema.CONNECTIVITY_POWER_Y_KEYS[i]);
            layout.powerScale[i]=read(values,ConfigSchema.CONNECTIVITY_POWER_SCALE_KEYS[i]);
        }
        return layout;
    }
    private static int read(Function<String,String> values,String key){
        String value=values.apply(key);
        String normalized=value==null?null:ConfigSchema.normalize(key,value);
        return Integer.parseInt(normalized==null?ConfigSchema.defaultValue(key):normalized);
    }
}
