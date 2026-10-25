package ls.augment.com;

import android.content.Context;
import android.os.SystemClock;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import java.util.function.Consumer;
import java.util.function.Supplier;

/** Same asset editor, with measured limits for the independent privacy window. */
final class PrivacyDotSpacingEditor {
    private PrivacyDotSpacingEditor(){}
    private static PrivacyDotSpacingObservation observation(Context context){
        WindowManager wm=(WindowManager)context.getSystemService(Context.WINDOW_SERVICE);
        Display display=wm==null?null:wm.getDefaultDisplay();if(display==null)return null;
        PrivacyDotSpacingObservation value=PrivacyDotSpacingObservation.parse(context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(PrivacyDotSpacingObservation.KEY+display.getRotation(),""));
        long now=SystemClock.elapsedRealtime();
        return value!=null&&value.current(now,System.currentTimeMillis()-now,BuildConfig.VERSION_CODE,display.getDisplayId(),display.getRotation(),
                Math.round(context.getResources().getDisplayMetrics().density*1000),Math.round(context.getResources().getConfiguration().fontScale*1000),context.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0)?value:null;
    }
    static void add(Context context,UiKit ui,LinearLayout parent,String scope,Supplier<String> read,Consumer<String> write,Runnable refresh){
        LinearLayout form=new LinearLayout(context);form.setOrientation(LinearLayout.VERTICAL);form.setTag("icon-spacing:"+scope+":privacy.dot");
        form.addView(ui.text("在系统已留出的安全区域内调整留白，保留圆点尺寸、颜色与系统显隐。起始和末尾随文字方向镜像；不会扩大窗口或挤占其他状态栏内容。",12,ui.muted,false),ui.wrap());
        if("notification".equals(scope)||"control".equals(scope)){
            form.addView(ui.text("系统在展开通知中心或控制中心时收起这个圆点。请在“桌面与应用”“锁屏”或“所有位置”中设置。",12,ui.muted,false),ui.margins(0,8,0,0));
            parent.addView(ui.foldingSection("隐私圆点边界间距",form,false),ui.margins(0,8,0,0));return;
        }
        StatusBarIconSpacingSpec parsed=StatusBarIconSpacingSpec.parse(read.get());
        StatusBarIconSpacingSpec initial=parsed==null?StatusBarIconSpacingSpec.empty():parsed;
        StatusBarIconSpacingSpec.Insets edge=initial.resolve(scope,"privacy.dot");
        PrivacyDotSpacingObservation measured=observation(context);
        boolean available=measured!=null&&measured.available();
        TextView status=ui.text(available?"本机最近实测 · "+measured.rotation*90+"°\n横向两边合计 ≤ "+measured.horizontal+" dp；纵向两边合计 ≤ "+measured.vertical+" dp。\n这是保证各组合均可用的上限；旋转、显示大小或字号改变后须重新获取。":"尚未取得当前方向与显示设置下的有效空间。请让使用摄像头或麦克风的应用在手机上正常显示系统隐私圆点，收起通知中心，再回到这里刷新。无需连接电脑。",12,ui.muted,false);
        status.setTag("privacy-dot-spacing-capacity");form.addView(status,ui.margins(0,8,0,0));
        boolean valid=available&&measured.accepts(edge);
        if(available&&!valid)form.addView(ui.text("已保存：起始 "+edge.start+"、顶部 "+edge.top+"、末尾 "+edge.end+"、底部 "+edge.bottom+" dp。此组合超过当前方向的安全空间，在此方向使用原厂位置，参数仍保留。可先恢复原厂边距再设置。",12,ui.muted,false),ui.margins(0,8,0,0));
        if(measured!=null&&!available)form.addView(ui.text("最近一次原厂布局无法提供可验证的调整空间，继续保留原厂位置。",12,ui.muted,false),ui.margins(0,4,0,0));
        if(valid){
            if(initial.explicit(scope,"privacy.dot")==null&&!"all".equals(scope))form.addView(ui.text("当前继承共享方案；调整任意一边后单独保存此位置。",12,ui.muted,false),ui.margins(0,4,0,0));
            String[] titles={"起始边距","顶部边距","末尾边距","底部边距"};int[] values={edge.start,edge.top,edge.end,edge.bottom};
            SeekBar[] bars=new SeekBar[4];TextView[] labels=new TextView[4];
            Runnable sync=()->{for(int i=0;i<4;i++){int max=measured.maximum(i,values[(i+2)%4]);bars[i].setMax(max);bars[i].setProgress(values[i]);bars[i].setEnabled(max>0);labels[i].setText(labels[i].getContext().getString(R.string.status_privacydotspacingeditor_36 ,String.valueOf(titles[i]), String.valueOf(values[i]), String.valueOf(max)));}};
            for(int i=0;i<4;i++){
                final int index=i;labels[i]=ui.text("",12,ui.muted,false);form.addView(labels[i],ui.margins(0,8,0,0));
                SeekBar bar=ui.slider();bars[i]=bar;bar.setContentDescription(titles[i]);bar.setTag("icon-spacing-"+i+":privacy.dot");form.addView(bar,ui.wrap());
                NumericParameterEditor.linear(ui,bar,titles[i],0,1," dp",labels[i]);
            }
            sync.run();
            for(int i=0;i<4;i++){final int index=i;bars[i].setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
                public void onStartTrackingTouch(SeekBar b){}
                public void onProgressChanged(SeekBar b,int progress,boolean user){if(user){values[index]=progress;sync.run();}}
                public void onStopTrackingTouch(SeekBar b){
                    PrivacyDotSpacingObservation latest=observation(context);
                    StatusBarIconSpacingSpec.Insets next=new StatusBarIconSpacingSpec.Insets(values[0],values[1],values[2],values[3]);
                    if(latest==null||!latest.accepts(next)){Toast.makeText(context,"显示状态或可用空间已变化，请刷新后重新调整；本次未保存。",Toast.LENGTH_LONG).show();refresh.run();return;}
                    StatusBarIconSpacingSpec current=StatusBarIconSpacingSpec.parse(read.get());if(current==null)current=StatusBarIconSpacingSpec.empty();
                    write.accept(current.with(scope,"privacy.dot",next).serialize());
                }
            });}
        }
        Button reload=ui.tonalButton("刷新本机可用空间");reload.setOnClickListener(v->refresh.run());form.addView(reload,ui.margins(0,8,0,0));
        Button nativeButton=ui.tonalButton("此位置使用原厂边距");nativeButton.setOnClickListener(v->{StatusBarIconSpacingSpec current=StatusBarIconSpacingSpec.parse(read.get());if(current==null)current=StatusBarIconSpacingSpec.empty();write.accept(current.with(scope,"privacy.dot",StatusBarIconSpacingSpec.ZERO).serialize());refresh.run();});form.addView(nativeButton,ui.wrap());
        Button reset=ui.tonalButton("all".equals(scope)?"移除共享边距设置":"恢复继承共享边距");reset.setOnClickListener(v->{StatusBarIconSpacingSpec current=StatusBarIconSpacingSpec.parse(read.get());if(current!=null)write.accept(current.with(scope,"privacy.dot",null).serialize());refresh.run();});form.addView(reset,ui.wrap());
        parent.addView(ui.foldingSection("隐私圆点边界间距",form,false),ui.margins(0,8,0,0));
    }
}
