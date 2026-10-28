package ls.augment.com.hook;

import android.app.Instrumentation;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.view.Gravity;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.SeekBar;
import org.json.JSONObject;

/** Android's real drawable/tint propagation, without changing system theme or user configuration. */
public final class SliderThemeDeviceCases {
    public static JSONObject run(Instrumentation instrumentation)throws Exception{
        Throwable[] failure={null};int[] checks={0};
        instrumentation.runOnMainSync(()->{try{
            Context base=instrumentation.getTargetContext();Configuration config=new Configuration(base.getResources().getConfiguration());
            config.uiMode=(config.uiMode&~Configuration.UI_MODE_NIGHT_MASK)|Configuration.UI_MODE_NIGHT_YES;
            Context context=base.createConfigurationContext(config);
            SeekBar bar=new SeekBar(context);bar.setMax(254);bar.setProgress(143);
            GradientDrawable track=new GradientDrawable();track.setColor(Color.LTGRAY);track.setCornerRadius(32);
            GradientDrawable fill=new GradientDrawable();fill.setColor(Color.WHITE);fill.setCornerRadius(32);
            ClipDrawable clip=new ClipDrawable(fill,Gravity.LEFT,ClipDrawable.HORIZONTAL);
            LayerDrawable layers=new LayerDrawable(new android.graphics.drawable.Drawable[]{track,clip});layers.setId(0,android.R.id.background);layers.setId(1,android.R.id.progress);
            bar.setProgressDrawable(layers);ImageView icon=new ImageView(context);icon.setImageDrawable(new GradientDrawable());
            ColorStateList original=ColorStateList.valueOf(0xff334455);icon.setImageTintList(original);
            ControlCenterSliderTheme theme=new ControlCenterSliderTheme();theme.refresh(bar,icon);
            require(theme.dark,"night mode detected",checks);require(bar.getProgressTintList().getDefaultColor()==0xff555b63,"native progress uses dark fill",checks);
            require(icon.getImageTintList().getDefaultColor()==0xfff2f3f5,"speaker contrast",checks);
            require(bar.getProgress()==143&&bar.getMax()==254,"brightness/volume range preserved",checks);
            require(((LayerDrawable)bar.getProgressDrawable()).findDrawableByLayerId(android.R.id.progress) instanceof ClipDrawable,"native clipping geometry retained",checks);
            for(int i=0;i<100;i++)theme.refresh(bar,icon);
            theme.restore(bar,icon);require(bar.getProgressTintList()==null,"native progress tint restored",checks);
            require(icon.getImageTintList()==original,"native icon tint restored",checks);
            CheckBox auto=new CheckBox(context);auto.setBackground(new GradientDrawable());theme.refresh(bar,auto);
            require(auto.getBackgroundTintList()!=null&&auto.getBackgroundTintList().isStateful(),"automatic brightness keeps checked state color",checks);
            theme.restore(bar,auto);require(auto.getBackgroundTintList()==null,"automatic brightness restored",checks);
            theme.refresh(bar,icon);config.uiMode=(config.uiMode&~Configuration.UI_MODE_NIGHT_MASK)|Configuration.UI_MODE_NIGHT_NO;
            context.getResources().updateConfiguration(config,context.getResources().getDisplayMetrics());theme.refresh(bar,icon);
            require(!theme.dark&&bar.getProgressTintList()==null,"in-place day transition restores native",checks);
            config.uiMode=(config.uiMode&~Configuration.UI_MODE_NIGHT_MASK)|Configuration.UI_MODE_NIGHT_YES;
            context.getResources().updateConfiguration(config,context.getResources().getDisplayMetrics());
            bar.setProgressDrawable(new GradientDrawable());theme.refresh(bar,icon);
            require(!theme.dark&&bar.getProgressTintList()==null,"unknown drawable stays native",checks);
        }catch(Throwable error){failure[0]=error;}});
        if(failure[0]!=null)throw new AssertionError("Slider theme",failure[0]);
        return new JSONObject().put("success",true).put("checks",checks[0]).put("realAndroidDrawables",true);
    }
    private static void require(boolean condition,String message,int[] checks){checks[0]++;if(!condition)throw new AssertionError(message);}
}
