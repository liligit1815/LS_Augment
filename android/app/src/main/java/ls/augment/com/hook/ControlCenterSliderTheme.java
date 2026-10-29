package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.TypedValue;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.SeekBar;
import java.lang.ref.WeakReference;
import ls.augment.com.GlassOptions;

/** Night colors on the audited native layers; keep native shapes, levels and gestures. */
final class ControlCenterSliderTheme {
    private static final ColorStateList FILL=ColorStateList.valueOf(0xff555b63),TRACK=ColorStateList.valueOf(0xff24272c),INK=ColorStateList.valueOf(0xfff2f3f5);
    private ColorStateList originalFill,originalTrack,originalIcon;
    private WeakReference<Drawable> drawable=new WeakReference<>(null);
    private boolean active,glass;
    boolean dark;
    // Shared by the native foreground and its glass track, including in-place theme changes.
    static boolean isNight(View view){
        return (view.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK)==Configuration.UI_MODE_NIGHT_YES;
    }
    void refresh(SeekBar seek,View icon){
        dark=isNight(seek);
        Drawable current=seek.getProgressDrawable();
        if(!dark){restore(seek,icon);return;}
        if(!(current instanceof LayerDrawable)||((LayerDrawable)current).findDrawableByLayerId(android.R.id.background)==null
                ||((LayerDrawable)current).findDrawableByLayerId(android.R.id.progress)==null){restore(seek,icon);dark=false;return;}
        boolean nextGlass=FeatureSettings.enabled(seek.getContext(),GlassOptions.CONTROL_CENTER);
        if(active&&current==drawable.get()&&glass==nextGlass)return;
        if(!active){originalFill=seek.getProgressTintList();originalTrack=seek.getProgressBackgroundTintList();
            originalIcon=icon instanceof ImageView?((ImageView)icon).getImageTintList():icon instanceof CompoundButton?icon.getBackgroundTintList():null;}
        drawable=new WeakReference<>(current);active=true;glass=nextGlass;
        seek.setProgressTintList(FILL);
        seek.setProgressBackgroundTintList(glass?originalTrack:TRACK);
        if(icon instanceof ImageView)((ImageView)icon).setImageTintList(INK);
        else if(icon instanceof CompoundButton){
            TypedValue accent=new TypedValue();int color=0xff50c3cf;
            if(icon.getContext().getTheme().resolveAttribute(android.R.attr.colorAccent,accent,true)&&accent.type>=TypedValue.TYPE_FIRST_COLOR_INT&&accent.type<=TypedValue.TYPE_LAST_COLOR_INT)color=accent.data;
            icon.setBackgroundTintList(new ColorStateList(new int[][]{new int[]{android.R.attr.state_checked},new int[]{}},new int[]{color,INK.getDefaultColor()}));
        }
    }
    void restore(SeekBar seek,View icon){
        if(!active)return;active=false;drawable.clear();
        if(seek!=null){seek.setProgressTintList(originalFill);seek.setProgressBackgroundTintList(originalTrack);}
        if(icon instanceof ImageView)((ImageView)icon).setImageTintList(originalIcon);
        else if(icon instanceof CompoundButton)icon.setBackgroundTintList(originalIcon);
    }
}
