package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.view.View;
import ls.augment.com.*;

/** One measured square replaces all three native icon families. */
final class ConnectivityIconView extends View {
    private final ConnectivityIconPainter painter=new ConnectivityIconPainter();
    final ConnectivityIconSource source;
    private int tint=0xffffffff;
    private final String[] contents=new String[3];
    private final int[] scales=new int[3];
    ConnectivityIconView(Context context){super(context);setTag("ls_augment_connectivity_circle");
        setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        source=new ConnectivityIconSource(context,()->post(()->{setContentDescription(sourceState().description());invalidate();}));}
    ConnectivityIconState sourceState(){return source==null?ConnectivityIconState.unknown():source.state;}
    boolean ready(){return source!=null&&source.ready;}
    void tint(int color){if(tint!=color){tint=color;invalidate();}}
    @Override protected void onDraw(Canvas canvas){super.onDraw(canvas);
        for(int i=0;i<3;i++){
            contents[i]=FeatureSettings.text(getContext(),ConfigSchema.CONNECTIVITY_CONTENT_KEYS[i],ConfigSchema.defaultValue(ConfigSchema.CONNECTIVITY_CONTENT_KEYS[i]));
            scales[i]=FeatureSettings.integer(getContext(),ConfigSchema.CONNECTIVITY_SCALE_KEYS[i],100,ConfigSchema.CONNECTIVITY_SCALE_MIN,ConfigSchema.CONNECTIVITY_SCALE_MAX);
        }
        int[] batteryColors=palette(false),textColors=palette(true);
        painter.draw(canvas,0,0,Math.min(getWidth(),getHeight()),sourceState(),tint,
                FeatureSettings.integer(getContext(),ConfigSchema.STATUSBAR_CONNECTIVITY_STROKE,6,3,10),
                FeatureSettings.integer(getContext(),ConfigSchema.STATUSBAR_CONNECTIVITY_INACTIVE,28,10,65),
                FeatureSettings.enabled(getContext(),ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS,true),contents,scales,batteryColors,textColors,
                Color.parseColor(FeatureSettings.text(getContext(),ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR,ConfigSchema.defaultValue(ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR))),
                ConnectivityIconLayout.read(key->FeatureSettings.text(getContext(),key,ConfigSchema.defaultValue(key))));}
    private int[] palette(boolean text){
        String base=SystemUiOptions.PREFIX+(text?"battery_text_":"battery_");
        if(!FeatureSettings.enabled(getContext(),base+"colors"))return null;
        int[] colors=new int[5];
        for(int i=0;i<colors.length;i++){
            String key=base+(i==4?"charging_color":"color_"+i);
            colors[i]=Color.parseColor(FeatureSettings.text(getContext(),key,ConfigSchema.defaultValue(key)));
        }
        return colors;
    }
    void close(){source.close();}
}
