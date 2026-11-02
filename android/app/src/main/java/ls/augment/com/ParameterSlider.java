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
    private final UiKit ui;
    final SeekBar bar;
    private final TextView value, range;
    private final EnhancementOption option;
    private final int scale;
    private final boolean commitOnRelease;
    private String saved;
    private boolean tracking, cancelled, touchArmed;
    private String trackingSaved;
    private final NumericParameterEditor editor;
    private String markerLabel, markerValue;
    private Integer markerProgress;
    private SliderMarkerView marker;
    private Runnable pendingMarker;
    private String unavailableReason;

    ParameterSlider(UiKit ui, EnhancementOption option, String initial, Consumer<String> changed) {
        this(ui, option, initial, changed, false);
    }

    // Gesture observer/forwarder retains native click handling or its separate accessible actions; do not synthesize a second click.
    //noinspection ClickableViewAccessibility
    ParameterSlider(UiKit ui, EnhancementOption option, String initial, Consumer<String> changed, boolean commitOnRelease) {
        super(ui.activity);
        this.ui=ui;
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
                if(pendingMarker!=null){Runnable next=pendingMarker;pendingMarker=null;next.run();}
            }
            public void onProgressChanged(SeekBar s,int progress,boolean user){
                if(!user||!s.isEnabled()||unavailableReason!=null||commitOnRelease&&cancelled)return;
                if(markerProgress!=null&&tracking){
                    float distance=Math.abs(SliderMarkerView.thumbX(bar,progress)-SliderMarkerView.thumbX(bar,markerProgress));
                    if(distance<=ui.dp(4)){progress=markerProgress;bar.setProgress(progress);}
                }
                String next=markerProgress!=null&&progress==markerProgress?markerValue:
                        BigDecimal.valueOf(progress).divide(BigDecimal.valueOf(scale),2,RoundingMode.HALF_UP).stripTrailingZeros().toPlainString();
                String normalized=option.normalize(next);
                if(normalized!=null){saved=normalized;render();if(!commitOnRelease||!tracking)changed.accept(normalized);}
            }
        });
        editor=NumericParameterEditor.bind(ui,bar,option.title,
                ()->new NumericValueSpec(bar.getMin()/(double)scale,bar.getMax()/(double)scale,1.0/scale,""),
                ()->markerValue!=null&&markerValue.equals(saved)&&markerProgress!=null
                        ?BigDecimal.valueOf(markerProgress).divide(BigDecimal.valueOf(scale)).toPlainString():saved,
                next->unavailableReason==null?option.normalize(next):null,next->{discardEdit();
                    if(markerProgress!=null&&(int)Math.round(Double.parseDouble(next)*scale)==markerProgress)next=markerValue;
                    setValue(next);changed.accept(next);},value);
    }
    void bindTitle(View title){
        editor.addTarget(title);
        if(title==null||!(title.getParent() instanceof LinearLayout)||value.getParent()!=this)return;
        LinearLayout owner=(LinearLayout)title.getParent();
        if(getParent()!=null&&getParent()!=owner)return;
        LinearLayout.LayoutParams headerParams=new LinearLayout.LayoutParams(-1,-2);
        headerParams.topMargin=owner.indexOfChild(title)>0?ui.dp(4):0;
        owner.removeView(title);removeView(value);
        addView(new NumericParameterHeader(ui,title,value),0,headerParams);
    }
    String getValue(){return saved;}
    /** Project a semantic setting onto a measured numeric position, preserving old saved offsets. */
    void marker(String storedValue,String label,Integer position,int maximum,String unavailable){
        if(tracking){pendingMarker=()->marker(storedValue,label,position,maximum,unavailable);return;}
        markerValue=storedValue;markerLabel=label;markerProgress=position==null?null:position*scale;
        if(marker==null){marker=new SliderMarkerView(ui,bar);addView(marker,indexOfChild(bar)+1,ui.wrap());}
        marker.setVisibility(position==null?GONE:VISIBLE);
        if(position!=null)marker.setMarker(markerProgress,label);
        bar.setContentDescription(option.title+(position==null?"":"，"+label+"刻度："+position));
        range(0,maximum,position==null?unavailable:"范围：0～"+maximum+" dp");
    }
    void measuredMarker(String storedValue,String label,Integer position,int maximum,String waiting,boolean enabled){
        if(tracking){pendingMarker=()->measuredMarker(storedValue,label,position,maximum,waiting,enabled);return;}
        marker(storedValue,label,position,position==null?0:maximum,waiting);
        if(position==null)unavailable(waiting);else bar.setEnabled(enabled);
    }
    void measuredRange(Integer maximum,String waiting,boolean enabled){
        if(tracking){pendingMarker=()->measuredRange(maximum,waiting,enabled);return;}
        range(0,maximum==null?0:maximum,maximum==null?waiting:"范围：0～"+maximum+" dp");
        if(maximum==null)unavailable(waiting);else bar.setEnabled(enabled);
    }
    void setError(String message){range.setText(message==null?"":message);range.setVisibility(message==null?GONE:VISIBLE);}
    private void cancelPendingEdit(){
        if(commitOnRelease&&(tracking||touchArmed)){cancelled=true;if(trackingSaved!=null)setValue(trackingSaved);}
    }
    void discardEdit(){cancelPendingEdit();tracking=false;trackingSaved=null;touchArmed=false;
        if(pendingMarker!=null){Runnable next=pendingMarker;pendingMarker=null;next.run();}}
    @Override protected void onDetachedFromWindow(){
        cancelPendingEdit();tracking=false;trackingSaved=null;cancelled=false;touchArmed=false;pendingMarker=null;super.onDetachedFromWindow();
    }
    @Override public void onWindowFocusChanged(boolean focused){
        if(!focused)cancelPendingEdit();else if(cancelled){tracking=false;trackingSaved=null;cancelled=false;}
        if(!focused&&marker!=null){tracking=false;if(pendingMarker!=null){Runnable next=pendingMarker;pendingMarker=null;next.run();}}
        super.onWindowFocusChanged(focused);
    }
    void setValue(String next){
        saved=next;
        boolean semantic=markerValue!=null&&markerValue.equals(saved);
        bar.setVisibility(semantic&&markerProgress==null?GONE:VISIBLE);
        bar.setProgress(semantic&&markerProgress!=null?markerProgress:(int)Math.round(Double.parseDouble(next)*scale));render();
    }
    void range(int minimum,int maximum,String explanation){
        unavailableReason=null;
        bar.setMin(Math.min(bar.getMin(),minimum*scale));bar.setMax(maximum*scale);bar.setMin(minimum*scale);setValue(saved);
        range.setText(explanation);range.setVisibility(explanation.isEmpty()?GONE:VISIBLE);
    }
    void unavailable(String reason){unavailableReason=reason;bar.setEnabled(false);range.setText(reason);range.setVisibility(VISIBLE);render();}
    private void render(){
        String shown=new BigDecimal(saved).stripTrailingZeros().toPlainString();
        int requested=(int)Math.round(Double.parseDouble(saved)*scale);
        if(unavailableReason!=null){
            if(markerValue!=null&&markerValue.equals(saved))shown=markerLabel;
            value.setText("已保存："+shown+" · 待测量");bar.setStateDescription(shown+"，"+unavailableReason);return;
        }
        if(markerValue!=null&&markerValue.equals(saved)){
            shown=markerLabel+(markerProgress==null?"（待测量）":" · "+BigDecimal.valueOf(markerProgress).divide(BigDecimal.valueOf(scale)).stripTrailingZeros().toPlainString()+" dp");
            value.setText("当前："+shown);bar.setStateDescription(shown);return;
        }
        String actual=BigDecimal.valueOf(bar.getProgress()).divide(BigDecimal.valueOf(scale),2,RoundingMode.HALF_UP).stripTrailingZeros().toPlainString();
        value.setText(requested==bar.getProgress()?"当前："+shown:"已保存："+shown+" · 当前实际："+actual);
        bar.setStateDescription(shown);
    }
}
