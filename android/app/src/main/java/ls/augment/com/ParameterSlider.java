package ls.augment.com;

import android.view.View;
import android.view.MotionEvent;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.function.Consumer;

/** Validated numeric editor shared by all catalogue-backed feature pages. */

// Code-only view requires UiKit/state/callbacks; it is never inflated from XML. A partial XML constructor is invalid.
//noinspection ViewConstructor
final class ParameterSlider extends LinearLayout {
    final SeekBar bar;
    private final TextView value, range;
    private final EnhancementOption option;
    private final int scale;
    private final boolean commitOnRelease;
    private String saved;
    private boolean tracking, cancelled, touchArmed;
    private String trackingSaved;

    ParameterSlider(UiKit ui, EnhancementOption option, String initial, Consumer<String> changed) {
        this(ui, option, initial, changed, false);
    }

    // Gesture observer/forwarder retains native click handling or its separate accessible actions; do not synthesize a second click.
    //noinspection ClickableViewAccessibility
    ParameterSlider(UiKit ui, EnhancementOption option, String initial, Consumer<String> changed, boolean commitOnRelease) {
        super(ui.activity);
        this.commitOnRelease=commitOnRelease;
        this.option=option;
        scale=option.kind==EnhancementOption.Kind.INTEGER?1:100;
        setOrientation(VERTICAL);
        setTag("parameter-slider:"+option.key);
        value=ui.text("",12,ui.muted,false);
        value.setTag("value:"+option.key);
        addView(value,ui.wrap());
        bar=ui.slider();bar.setContentDescription(option.title);bar.setTag("config:"+option.key);
        bar.setMax((int)Math.round(option.maximum*scale));
        bar.setMin((int)Math.round(option.minimum*scale));
        addView(bar,ui.wrap());
        if(commitOnRelease)bar.setOnTouchListener((view,event)->{
            int action=event.getActionMasked();
            if(event.getPointerCount()!=1||action==MotionEvent.ACTION_POINTER_DOWN||action==MotionEvent.ACTION_POINTER_UP){
                cancelPendingEdit();cancelled=true;touchArmed=false;
            }else if(action==MotionEvent.ACTION_DOWN){cancelled=false;touchArmed=true;}
            else if(action==MotionEvent.ACTION_CANCEL){cancelPendingEdit();cancelled=true;touchArmed=false;}
            else if(!touchArmed)cancelled=true;
            return false;
        });
        if(commitOnRelease)bar.setOnFocusChangeListener((view,focused)->{if(!focused)cancelPendingEdit();});
        range=ui.text("",12,ui.muted,false);range.setVisibility(GONE);addView(range,ui.wrap());
        setValue(initial);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            public void onStartTrackingTouch(SeekBar s) { tracking=true;trackingSaved=saved; }
            public void onStopTrackingTouch(SeekBar s) {
                boolean commit=tracking&&!cancelled;tracking=false;
                if(commitOnRelease){if(commit)changed.accept(saved);else setValue(trackingSaved!=null?trackingSaved:saved);}
                trackingSaved=null;cancelled=false;touchArmed=false;
            }
            public void onProgressChanged(SeekBar s,int progress,boolean user){
                if(!user||commitOnRelease&&cancelled)return;
                String next=BigDecimal.valueOf(progress).divide(BigDecimal.valueOf(scale),2,RoundingMode.HALF_UP).stripTrailingZeros().toPlainString();
                String normalized=option.normalize(next);
                if(normalized!=null){saved=normalized;render();if(!commitOnRelease||!tracking)changed.accept(normalized);}
            }
        });
    }
    private void cancelPendingEdit(){
        if(commitOnRelease&&(tracking||touchArmed)){cancelled=true;if(trackingSaved!=null)setValue(trackingSaved);}
    }
    void discardEdit(){cancelPendingEdit();tracking=false;trackingSaved=null;touchArmed=false;}
    @Override protected void onDetachedFromWindow(){
        cancelPendingEdit();tracking=false;trackingSaved=null;cancelled=false;touchArmed=false;super.onDetachedFromWindow();
    }
    @Override public void onWindowFocusChanged(boolean focused){
        if(!focused)cancelPendingEdit();else if(cancelled){tracking=false;trackingSaved=null;cancelled=false;}
        super.onWindowFocusChanged(focused);
    }
    void setValue(String next){
        saved=next;bar.setProgress((int)Math.round(Double.parseDouble(next)*scale));render();
    }
    void range(int minimum,int maximum,String explanation){
        bar.setMin(Math.min(bar.getMin(),minimum*scale));bar.setMax(maximum*scale);bar.setMin(minimum*scale);setValue(saved);
        range.setText(explanation);range.setVisibility(explanation.isEmpty()?GONE:VISIBLE);
    }
    void unavailable(String reason){bar.setEnabled(false);range.setText(reason);range.setVisibility(VISIBLE);}
    private void render(){
        String shown=new BigDecimal(saved).stripTrailingZeros().toPlainString();
        int requested=(int)Math.round(Double.parseDouble(saved)*scale);
        String actual=BigDecimal.valueOf(bar.getProgress()).divide(BigDecimal.valueOf(scale),2,RoundingMode.HALF_UP).stripTrailingZeros().toPlainString();
        value.setText(requested==bar.getProgress()?"当前："+shown:"已保存："+shown+" · 当前实际："+actual);
        bar.setStateDescription(shown);
    }
}
