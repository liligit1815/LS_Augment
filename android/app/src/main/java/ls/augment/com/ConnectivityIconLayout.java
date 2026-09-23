package ls.augment.com;

import java.util.function.Function;

/** Offsets are percentages of the complete icon diameter, independent of content size. */
public final class ConnectivityIconLayout {
    public final int[] x=new int[3],y=new int[3];
    public final int[] powerX=new int[2],powerY=new int[2],powerScale={100,100};

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
