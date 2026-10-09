package ls.augment.com;

import android.content.Context;
import android.view.View;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.*;
import java.util.*;
import java.util.function.*;

/** Same four controls and folding container; only the phone-measured mobile contract differs. */
final class StatusBarMobileSpacingEditor {
    private StatusBarMobileSpacingEditor(){}
    static void add(Context context,UiKit ui,LinearLayout parent,String scope,String id,Supplier<String> read,
            Consumer<String> write,Runnable refresh,Supplier<Map<String,String>> fullDraft){
        final boolean circleWifi="wifi.signal".equals(id);
        LinearLayout form=new LinearLayout(context);form.setOrientation(LinearLayout.VERTICAL);form.setTag("icon-spacing:"+scope+":"+id);
        TextView status=ui.text("",12,ui.muted,false);status.setTag("icon-spacing-mobile-capacity:"+scope+":"+id);form.addView(status,ui.wrap());
        String[] titles={"起始边距","顶部边距","末尾边距","底部边距"};SeekBar[] bars=new SeekBar[4];TextView[] labels=new TextView[4];
        for(int i=0;i<4;i++){labels[i]=ui.text("",12,ui.muted,false);form.addView(labels[i],ui.margins(0,8,0,0));bars[i]=new SeekBar(context);bars[i].setMinimumHeight(ui.dp(48));bars[i].setTag("icon-spacing-"+i+":"+id);bars[i].setContentDescription(titles[i]);form.addView(bars[i],ui.wrap());}
        final String[] rejectedEdit={""};
        Runnable sync=()->{
            StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(read.get());if(spec==null)return;
            Map<String,String> draft=new LinkedHashMap<>(fullDraft.get());draft.put(StatusBarIconSpacingSpec.KEY,spec.serialize());
            Function<StatusBarIconSpacingSpec,StatusBarMobileSpacingResolver.Result> inspect;
            if(circleWifi){StatusBarCircleSpacingResolver.Snapshot limits=new StatusBarCircleSpacingResolver.Snapshot(context,draft);inspect=candidate->limits.inspectWifi(scope,id,candidate);}
            else{StatusBarMobileSpacingResolver.Snapshot limits=new StatusBarMobileSpacingResolver.Snapshot(context,draft);inspect=candidate->limits.inspect(scope,id,candidate);}
            StatusBarMobileSpacingResolver.Result result=inspect.apply(spec);
            boolean dirty=!Objects.equals(new AppConfig(context).get(StatusBarIconSpacingSpec.KEY),spec.serialize());
            String text=(dirty?"边距草稿，点击应用后保存。":"已保存的边距；以下为最近观察，不代表图标此刻可见。")+"\n"+result.description();
            if(id.endsWith(".activity_inout"))text+="\n非零边距会把活动箭头放到信号左侧独立区域；暂时无收发时保留区域，仅当前数据卡使用。0 保留原来的嵌入位置。";
            if(scope.equals("all"))text+="\n共享值仅作用于继承的位置；待用位置保留参数，不保证当前生效。";
            status.setText(rejectedEdit[0].isEmpty()?text:rejectedEdit[0]+"\n"+text);
            StatusBarIconSpacingSpec.Insets e=spec.resolve(scope,id);int[] values={e.start,e.top,e.end,e.bottom};
            for(int i=0;i<4;i++){
                int maximum=-1;
                for(int v=0;v<=StatusBarIconSpacingSpec.MAX_DP;v++){int[] trial=values.clone();trial[i]=v;StatusBarIconSpacingSpec candidate=spec.with(scope,id,new StatusBarIconSpacingSpec.Insets(trial[0],trial[1],trial[2],trial[3]));draft.put(StatusBarIconSpacingSpec.KEY,candidate.serialize());if(inspect.apply(candidate).editable())maximum=v;}
                draft.put(StatusBarIconSpacingSpec.KEY,spec.serialize());bars[i].setMax(Math.max(values[i],Math.max(0,maximum)));bars[i].setProgress(values[i]);bars[i].setEnabled(maximum>=0&&(maximum>0||values[i]>0));
                labels[i].setText(titles[i]+" · "+values[i]+" dp"+(maximum>=0?" / 可设上限 "+maximum+" dp":" / 等待可用空间"));
            }
        };
        for(int i=0;i<4;i++){final int edge=i;bars[i].setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            public void onProgressChanged(SeekBar b,int progress,boolean user){if(user)labels[edge].setText(titles[edge]+" · "+progress+" dp");}
            public void onStartTrackingTouch(SeekBar b){}
            public void onStopTrackingTouch(SeekBar b){StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(read.get());if(spec==null)return;StatusBarIconSpacingSpec.Insets e=spec.resolve(scope,id);int[] v={e.start,e.top,e.end,e.bottom};if(v[edge]==b.getProgress())return;v[edge]=b.getProgress();StatusBarIconSpacingSpec candidate=spec.with(scope,id,new StatusBarIconSpacingSpec.Insets(v[0],v[1],v[2],v[3]));Map<String,String> draft=new LinkedHashMap<>(fullDraft.get());draft.put(StatusBarIconSpacingSpec.KEY,candidate.serialize());
                StatusBarMobileSpacingResolver.Result decision=circleWifi?StatusBarCircleSpacingResolver.inspect(context,scope,id,draft):StatusBarMobileSpacingResolver.inspect(context,scope,id,draft);
                if(decision.editable()){rejectedEdit[0]="";write.accept(candidate.serialize());}
                else{rejectedEdit[0]="本次未加入草稿：\n"+decision.description();Toast.makeText(context,rejectedEdit[0],Toast.LENGTH_LONG).show();}sync.run();}
        });}
        // These actions stay on the same leaf. Reuse its fold and controls;
        // rebuilding the host would discard both expansion and scroll position.
        ScrollPosition position=new ScrollPosition(form);
        Runnable refreshForm=()->{rejectedEdit[0]="";sync.run();};
        sync.run();Button reload=ui.tonalButton("刷新本机可用空间");reload.setOnClickListener(v->position.update(v,refreshForm));form.addView(reload,ui.margins(0,8,0,0));
        Button inherit=ui.tonalButton(scope.equals("all")?"清除共享额外边距":"恢复继承共享边距");inherit.setOnClickListener(v->position.update(v,()->{StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(read.get());if(spec!=null)write.accept(spec.with(scope,id,null).serialize());refreshForm.run();}));form.addView(inherit,ui.wrap());
        if(!scope.equals("all")){Button zero=ui.tonalButton("此位置不增加额外边距");zero.setOnClickListener(v->position.update(v,()->{StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(read.get());if(spec!=null)write.accept(spec.with(scope,id,StatusBarIconSpacingSpec.ZERO).serialize());refreshForm.run();}));form.addView(zero,ui.wrap());}
        parent.addView(ui.foldingSection("图标边界间距",form,false),ui.margins(0,8,0,0));
    }

    /** One layout only: preserve the acted-on control, not a stale page offset. */
    private static final class ScrollPosition implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        private final View form;
        private View anchor;
        private ScrollView scroll;
        private ViewTreeObserver observer;
        private int offset;
        ScrollPosition(View form){this.form=form;form.addOnAttachStateChangeListener(this);}
        private static ScrollView container(View view){
            for(ViewParent p=view.getParent();p!=null;p=p.getParent())if(p instanceof ScrollView)return (ScrollView)p;
            return null;
        }
        private static int relativeTop(View view,ScrollView scroll){
            int[] a=new int[2],s=new int[2];view.getLocationInWindow(a);scroll.getLocationInWindow(s);return a[1]-s[1];
        }
        void update(View control,Runnable update){
            clear();
            if(form.isAttachedToWindow()&&form.isShown()&&control.isAttachedToWindow()&&control.isShown()){
                scroll=container(control);
                if(scroll!=null&&scroll==container(form)){anchor=control;offset=relativeTop(control,scroll);}else scroll=null;
            }
            try{update.run();}catch(RuntimeException|Error error){clear();throw error;}
            if(scroll!=null){observer=scroll.getViewTreeObserver();observer.addOnPreDrawListener(this);form.invalidate();}
        }
        @Override public boolean onPreDraw(){
            ScrollView target=scroll;View control=anchor;int previous=offset;
            boolean current=target!=null&&control!=null&&form.isAttachedToWindow()&&form.isShown()
                    &&control.isAttachedToWindow()&&control.isShown()&&container(form)==target&&container(control)==target;
            clear();
            if(current)target.scrollBy(0,relativeTop(control,target)-previous);
            return true;
        }
        private void clear(){
            if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);
            observer=null;anchor=null;scroll=null;
        }
        @Override public void onViewAttachedToWindow(View view){}
        @Override public void onViewDetachedFromWindow(View view){clear();}
    }
}
