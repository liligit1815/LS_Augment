package ls.augment.com;

import android.app.Dialog;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Supplier;

/** Shared title/value activation and transactional exact input for all numeric editors. */
final class NumericParameterEditor {
    private final UiKit ui;
    private final SeekBar bar;
    private final String title;
    private final Supplier<NumericValueSpec> specification;
    private final Supplier<String> read;
    private final Function<String,String> validate;
    private final Consumer<String> commit;
    private final List<View> targets = new ArrayList<>();
    private Dialog dialog;

    static NumericParameterEditor linear(UiKit ui, SeekBar bar, String title,
            double offset, double step, String unit, View... targets) {
        if (!(bar instanceof ParameterSeekBar)) throw new IllegalArgumentException("Use UiKit.slider()");
        return bind(ui, bar, title,
                () -> new NumericValueSpec(Double.parseDouble(NumericValueSpec.valueAt(bar.getMin(),offset,step)),
                        Double.parseDouble(NumericValueSpec.valueAt(bar.getMax(),offset,step)),step,unit),
                () -> NumericValueSpec.valueAt(bar.getProgress(),offset,step), value -> value,
                value -> ((ParameterSeekBar)bar).commitExactProgress(NumericValueSpec.progressOf(value,offset,step)), targets);
    }

    static NumericParameterEditor bind(UiKit ui, SeekBar bar, String title,
            Supplier<NumericValueSpec> specification, Supplier<String> read,
            Function<String,String> validate, Consumer<String> commit, View... targets) {
        NumericParameterEditor editor = new NumericParameterEditor(ui,bar,title,specification,read,validate,commit);
        for (View target : targets) editor.addTarget(target);
        if(targets.length==2)ui.compactNumericHeader(targets[0],targets[1]);
        if(targets.length==1&&targets[0]!=null&&targets[0].getParent()==bar.getParent()&&bar.getParent() instanceof LinearLayout){
            LinearLayout parent=(LinearLayout)bar.getParent();int at=parent.indexOfChild(targets[0]);
            if(parent.getOrientation()==LinearLayout.VERTICAL&&at>0&&parent.getChildAt(at-1) instanceof SeekBar){
                LinearLayout.LayoutParams p=(LinearLayout.LayoutParams)targets[0].getLayoutParams();p.topMargin=Math.min(p.topMargin,ui.dp(4));targets[0].setLayoutParams(p);
            }
        }
        return editor;
    }

    private NumericParameterEditor(UiKit ui, SeekBar bar, String title, Supplier<NumericValueSpec> specification,
            Supplier<String> read, Function<String,String> validate, Consumer<String> commit) {
        this.ui=ui;this.bar=bar;this.title=title;this.specification=specification;
        this.read=read;this.validate=validate;this.commit=commit;
        if (bar instanceof ParameterSeekBar) ((ParameterSeekBar)bar).observeEditorState(this::syncEnabled);
        bar.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            public void onViewAttachedToWindow(View v) { syncEnabled(); }
            public void onViewDetachedFromWindow(View v) { dismiss(); }
        });
    }

    void addTarget(View target) {
        // A feature title may also contain a help button. Keep its action independent.
        if (target instanceof ViewGroup) {
            ViewGroup group=(ViewGroup)target;
            for(int i=0;i<group.getChildCount();i++) if(group.getChildAt(i) instanceof TextView
                    && !(group.getChildAt(i) instanceof Button)) { addTarget(group.getChildAt(i)); return; }
            return;
        }
        if(target==null || targets.contains(target)) return;
        targets.add(target);
        target.setMinimumHeight(ui.dp(44));
        if(target instanceof TextView) {
            ((TextView)target).setGravity(Gravity.CENTER_VERTICAL);
            ((TextView)target).setMaxLines(Integer.MAX_VALUE);
        }
        target.setBackground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT,8)));
        target.setTooltipText("点击精确输入" + title);
        target.setFocusable(true);
        target.setOnClickListener(v -> show());
        target.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host,android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host,info);
                info.addAction(new android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction(
                        android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK,"精确输入"+title));
            }
        });
        syncEnabled();
    }

    private void syncEnabled() { for(View target:targets) target.setEnabled(bar.isEnabled()); }
    private boolean available() {
        if(ui.activity.isFinishing() || ui.activity.isDestroyed() || !bar.isAttachedToWindow() || !bar.isShown()) return false;
        for(View v=bar;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null) if(!v.isEnabled()) return false;
        return true;
    }
    void dismiss() { if(dialog!=null) { dialog.dismiss(); dialog=null; } }

    void show() {
        if(!available() || dialog!=null && dialog.isShowing()) return;
        final long generation=ResetWriteFence.generation();
        final String initial=read.get();
        NumericValueSpec spec=specification.get();
        LinearLayout body=new LinearLayout(ui.activity);body.setOrientation(LinearLayout.VERTICAL);
        TextView limits=ui.text(spec.description(),12,ui.muted,false);body.addView(limits,ui.margins(0,0,0,10));
        EditText input=new EditText(ui.activity);
        int type=InputType.TYPE_CLASS_NUMBER;
        if(spec.minimum.signum()<0) type|=InputType.TYPE_NUMBER_FLAG_SIGNED;
        if(spec.step.stripTrailingZeros().scale()>0) type|=InputType.TYPE_NUMBER_FLAG_DECIMAL;
        input.setInputType(type);ui.styleInput(input);input.setSingleLine(true);
        input.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(32)});
        input.setTag("numeric-exact-input");input.setContentDescription(title+"，精确数值");
        input.setImeOptions(EditorInfo.IME_ACTION_DONE);input.setText(initial);input.selectAll();
        body.addView(input,ui.wrap());
        TextView error=ui.inlineInputError(input,"numeric-exact");body.addView(error,ui.margins(0,6,0,0));
        final Dialog opened=ui.glassDialog(title,body,"确定",null,"取消");dialog=opened;
        Runnable submit=()->{
            if(!available() || ResetWriteFence.stale(generation)) { dismiss(); return; }
            NumericValueSpec latest=specification.get();limits.setText(latest.description());
            String value=latest.normalize(input.getText().toString());
            String normalized=value==null?null:validate.apply(value);
            // validate returns the normalized value, or null for a rejected value.
            if(value==null || normalized==null) {
                error.setText(value==null?"请输入有效数值。"+latest.description():"该数值不符合当前配置要求，请重新输入。");
                error.setVisibility(View.VISIBLE);input.requestFocus();return;
            }
            if(!java.util.Objects.equals(initial,read.get())) {
                error.setText("当前参数已变化，请取消后重新打开。");error.setVisibility(View.VISIBLE);return;
            }
            opened.dismiss();dialog=null;
            if(new java.math.BigDecimal(initial).compareTo(new java.math.BigDecimal(normalized))!=0) commit.accept(normalized);
        };
        View confirm=opened.getWindow().getDecorView().findViewWithTag("glass-dialog-confirm");
        confirm.setOnClickListener(v->submit.run());
        input.setOnEditorActionListener((v,action,event)->{if(action==EditorInfo.IME_ACTION_DONE){submit.run();return true;}return false;});
        // Preserve host-owned OnDismiss listeners (workbench uses them to release its input fence).
        body.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View v){}
            public void onViewDetachedFromWindow(View v){if(dialog==opened)dialog=null;}
        });
        input.requestFocus();input.post(()->{if(opened.isShowing()) {
            InputMethodManager keyboard=ui.activity.getSystemService(InputMethodManager.class);
            if(keyboard!=null)keyboard.showSoftInput(input,InputMethodManager.SHOW_IMPLICIT);
        }});
    }
}
