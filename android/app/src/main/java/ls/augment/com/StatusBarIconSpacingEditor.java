package ls.augment.com;

import android.content.Context;
import android.os.SystemClock;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import android.widget.*;
import java.util.function.*;

/** Shared boundary editor; artwork state/layer selection never changes the layout rule. */
final class StatusBarIconSpacingEditor {
    private StatusBarIconSpacingEditor(){}
    private static StatusBarWifiSpacingObservation wifiContract(Context context,String scope,String id){
        if(!StatusBarWifiSpacingPolicy.member(id))return null;
        WindowManager wm=(WindowManager)context.getSystemService(Context.WINDOW_SERVICE);Display display=wm==null?null:wm.getDefaultDisplay();if(display==null)return null;
        StatusBarWifiSpacingObservation nativeValue=null;long now=SystemClock.elapsedRealtime();
        for(String surface:scope.equals("all")?new String[]{"control","notification"}:new String[]{scope}){
            StatusBarWifiSpacingObservation value=StatusBarWifiSpacingObservation.parse(context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(StatusBarWifiSpacingObservation.key(surface,display.getRotation(),id),""));
            if(value==null||!value.profile.current(now,System.currentTimeMillis()-now,BuildConfig.VERSION_CODE,display.getDisplayId(),display.getRotation(),Math.round(context.getResources().getDisplayMetrics().density*1000),Math.round(context.getResources().getConfiguration().fontScale*1000),context.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0))return null;
            if(!value.reason.equals("native"))return value;nativeValue=value;
        }return nativeValue;
    }
    private static Integer verticalCapacity(Context context,String scope,String id,StatusBarIconSpacingSpec spec){
        if(!StatusBarHeaderSpacingObservation.child(id)||!scope.equals("all")&&!scope.equals("control")&&!scope.equals("notification"))return StatusBarIconSpacingSpec.MAX_DP*2;
        WindowManager wm=(WindowManager)context.getSystemService(Context.WINDOW_SERVICE);Display display=wm==null?null:wm.getDefaultDisplay();if(display==null)return null;
        long now=SystemClock.elapsedRealtime();int limit=48;
        for(String surface:scope.equals("all")?new String[]{"control","notification"}:new String[]{scope}){
            StatusBarHeaderSpacingObservation value=StatusBarHeaderSpacingObservation.parse(context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(StatusBarHeaderSpacingObservation.KEY+surface+"_"+display.getRotation(),""));
            if(value==null||!value.current(now,System.currentTimeMillis()-now,BuildConfig.VERSION_CODE,display.getDisplayId(),display.getRotation(),Math.round(context.getResources().getDisplayMetrics().density*1000),Math.round(context.getResources().getConfiguration().fontScale*1000),context.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0))return null;
            int peer=StatusBarWifiSpacingPolicy.member(id)?spec.resolve(surface,StatusBarWifiSpacingPolicy.peer(id)).vertical():0;
            limit=Math.min(limit,Math.max(0,value.vertical-peer));
        }return limit;
    }
    static void add(Context activity,UiKit ui,LinearLayout parent,String scope,String id,Supplier<String> read,Consumer<String> write,Runnable refresh){
        add(activity,ui,parent,scope,id,read,write,refresh,()->{java.util.Map<String,String> values=new java.util.LinkedHashMap<>(new AppConfig(activity).snapshot());values.put(StatusBarIconSpacingSpec.KEY,read.get());return values;});
    }
    static void add(Context activity,UiKit ui,LinearLayout parent,String scope,String id,Supplier<String> read,Consumer<String> write,Runnable refresh,Supplier<java.util.Map<String,String>> fullDraft){
        if(!StatusBarIconSpacingSpec.supported(id))return;
        if(StatusBarCircleSpacingResolver.applies(scope,id,fullDraft.get())){StatusBarMobileSpacingEditor.add(activity,ui,parent,scope,id,read,write,refresh,fullDraft);return;}
        if(StatusBarMobileSpacingResolver.member(id)&&!StatusBarMobileSpacingResolver.useNativeEditor(activity,scope,fullDraft.get())){StatusBarMobileSpacingEditor.add(activity,ui,parent,scope,id,read,write,refresh,fullDraft);return;}
        if("privacy.dot".equals(id)){PrivacyDotSpacingEditor.add(activity,ui,parent,scope,read,write,refresh);return;}
        StatusBarIconSpacingSpec parsed=StatusBarIconSpacingSpec.parse(read.get());
        final StatusBarIconSpacingSpec initial=parsed==null?StatusBarIconSpacingSpec.empty():parsed;
        if(StatusBarWifiAssetSpacingEditor.applies(activity,scope,id,initial)){StatusBarWifiAssetSpacingEditor.add(activity,ui,parent,scope,id,read,write,refresh);return;}
        StatusBarIconSpacingSpec.Insets value=initial.resolve(scope,id);
        LinearLayout form=new LinearLayout(activity);form.setOrientation(LinearLayout.VERTICAL);
        form.setTag("icon-spacing:"+scope+":"+id);
        form.addView(ui.text(StatusBarWifiSpacingPolicy.member(id)?"为原厂 Wi-Fi 图层预留额外空间，信号与箭头保持原厂相对位置。起始与末尾随文字方向镜像。下方显示当前图层是否适配；自定义子图层素材的独立间距尚待适配。":"为图标预留额外空间，随图标一起参与排列。0 保留原厂间距；起始与末尾随文字方向镜像。所有动态状态共用，不依赖素材绑定。",12,ui.muted,false),ui.wrap());
        if(StatusBarMobileSpacingResolver.member(id))form.addView(ui.text("当前沿用原生子图标间距规则；参数范围不代表图标此刻可见。通知中心和控制中心的上下边距仍按本机页头空间限制，起始和末尾沿用原有规则。",12,ui.muted,false),ui.margins(0,4,0,0));
        StatusBarWifiSpacingObservation wifi=wifiContract(activity,scope,id);
        boolean wifiBlocked=StatusBarWifiSpacingPolicy.member(id)&&(wifi==null||!wifi.reason.equals("native"));
        if(StatusBarWifiSpacingPolicy.member(id)){
            TextView status=ui.text(wifi==null?"尚未取得本显示设置下的 Wi-Fi 图层信息。请展开对应页面再刷新；所有位置需展开通知中心和控制中心。当前暂停调整，恢复原厂和继承仍可用。":wifi.explanation()+"。",12,ui.muted,false);
            status.setTag("icon-spacing-wifi-contract:"+scope+":"+id);form.addView(status,ui.margins(0,8,0,0));
        }
        Integer vertical=verticalCapacity(activity,scope,id,initial);
        boolean headerBound=StatusBarHeaderSpacingObservation.child(id)&&(scope.equals("all")||scope.equals("control")||scope.equals("notification"));
        if(headerBound){
            TextView capacity=ui.text(vertical==null?"尚未取得此显示设置下的顶部和底部可用空间。请在手机上展开对应通知中心或控制中心，再回到这里刷新；所有位置需分别展开两处。起始和末尾仍可调整。":"本机最近实测：顶部与底部合计最多 "+vertical+" dp。超过当前空间时纵向保留原厂，参数仍保存；起始和末尾照常使用。",12,ui.muted,false);
            capacity.setTag("icon-spacing-vertical-capacity:"+scope+":"+id);form.addView(capacity,ui.margins(0,8,0,0));
            if(StatusBarWifiSpacingPolicy.member(id))form.addView(ui.text("Wi-Fi 信号与活动箭头共享原厂绘制框；本页上限已扣除另一图层的顶部和底部间距，所有位置还会计入各页面的单独设置。信号边距包围组合，箭头边距在原厂位置外增加留白。",12,ui.muted,false),ui.margins(0,4,0,0));
            if(scope.equals("all"))form.addView(ui.text("所有位置采用通知中心与控制中心中较小的上限；桌面与应用、锁屏可分别设置。",12,ui.muted,false),ui.margins(0,4,0,0));
            if(vertical!=null&&value.vertical()>vertical)form.addView(ui.text("已保存的顶部 "+value.top+"、底部 "+value.bottom+" dp 超出当前上限。先恢复原厂或继承边距，再按当前空间设置。",12,ui.muted,false),ui.margins(0,4,0,0));
        }
        if(initial.explicit(scope,id)==null&&!"all".equals(scope))form.addView(ui.text("当前继承共享方案；修改任意一边后单独保存此位置。",12,ui.muted,false),ui.margins(0,4,0,0));
        String[] titles={"起始边距","顶部边距","末尾边距","底部边距"};int[] values={value.start,value.top,value.end,value.bottom};
        SeekBar[] bars=new SeekBar[4];TextView[] labels=new TextView[4];
        Runnable sync=()->{for(int i=0;i<4;i++){
            boolean verticalEdge=i==1||i==3;
            boolean allowed=!verticalEdge||!headerBound||vertical!=null&&values[1]+values[3]<=vertical;
            int max=verticalEdge&&headerBound?(vertical==null?values[i]:Math.max(0,Math.min(StatusBarIconSpacingSpec.MAX_DP,vertical-values[(i+2)%4]))):StatusBarIconSpacingSpec.MAX_DP;
            bars[i].setMax(Math.max(max,values[i]));bars[i].setProgress(values[i]);bars[i].setEnabled(!wifiBlocked&&allowed&&max>0);
            labels[i].setText(titles[i]+" · "+values[i]+" dp"+(verticalEdge&&headerBound&&vertical!=null?" / 当前最多 "+max+" dp":""));
        }};
        for(int i=0;i<titles.length;i++){
            LinearLayout parameter=ui.parameterInputGroup();form.addView(parameter,ui.wrap());
            final int index=i;TextView label=ui.text(titles[i]+" · "+values[i]+" dp",12,ui.muted,false);parameter.addView(label,ui.wrap());
            SeekBar bar=new SeekBar(activity);bars[i]=bar;labels[i]=label;bar.setMax(StatusBarIconSpacingSpec.MAX_DP);bar.setProgress(values[i]);bar.setMinimumHeight(ui.dp(48));bar.setContentDescription(titles[i]);bar.setTag("icon-spacing-"+i+":"+id);parameter.addView(bar,ui.wrap());
        }
        sync.run();
        for(int i=0;i<titles.length;i++){
            final int index=i;TextView label=labels[i];SeekBar bar=bars[i];
            bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
                public void onProgressChanged(SeekBar b,int progress,boolean user){label.setText(titles[index]+" · "+progress+" dp");}
                public void onStartTrackingTouch(SeekBar b){}
                public void onStopTrackingTouch(SeekBar b){if(values[index]==b.getProgress())return;
                    if(StatusBarWifiSpacingPolicy.member(id)){StatusBarWifiSpacingObservation latest=wifiContract(activity,scope,id);if(latest==null||!latest.reason.equals("native")){Toast.makeText(activity,"当前 Wi-Fi 图层已变化，本次未保存。请刷新后查看适配状态。",Toast.LENGTH_LONG).show();refresh.run();return;}}
                    if((index==1||index==3)&&headerBound){StatusBarIconSpacingSpec latestSpec=StatusBarIconSpacingSpec.parse(read.get());if(latestSpec==null)latestSpec=StatusBarIconSpacingSpec.empty();Integer latest=verticalCapacity(activity,scope,id,latestSpec);if(latest==null||b.getProgress()+values[(index+2)%4]>latest){Toast.makeText(activity,"当前可用空间已变化，本次未保存。请刷新后重新调整。",Toast.LENGTH_LONG).show();refresh.run();return;}}
                    values[index]=b.getProgress();StatusBarIconSpacingSpec current=StatusBarIconSpacingSpec.parse(read.get());if(current==null)current=StatusBarIconSpacingSpec.empty();write.accept(current.with(scope,id,new StatusBarIconSpacingSpec.Insets(values[0],values[1],values[2],values[3])).serialize());sync.run();}
            });
        }
        if(headerBound){Button reload=ui.tonalButton("刷新本机纵向空间");reload.setOnClickListener(v->refresh.run());form.addView(reload,ui.margins(0,8,0,0));}
        else if(StatusBarWifiSpacingPolicy.member(id)){Button reload=ui.tonalButton("刷新本机图层状态");reload.setOnClickListener(v->refresh.run());form.addView(reload,ui.margins(0,8,0,0));}
        Button reset=ui.tonalButton("all".equals(scope)?"恢复此图标原厂边距":"恢复继承共享边距");reset.setOnClickListener(v->{StatusBarIconSpacingSpec current=StatusBarIconSpacingSpec.parse(read.get());if(current!=null)write.accept(current.with(scope,id,null).serialize());refresh.run();});form.addView(reset,ui.wrap());
        if(!"all".equals(scope)){Button original=ui.tonalButton("此位置使用原厂边距");original.setOnClickListener(v->{StatusBarIconSpacingSpec current=StatusBarIconSpacingSpec.parse(read.get());if(current==null)current=StatusBarIconSpacingSpec.empty();write.accept(current.with(scope,id,StatusBarIconSpacingSpec.ZERO).serialize());refresh.run();});form.addView(original,ui.wrap());}
        parent.addView(ui.foldingSection("图标边界间距",form,false),ui.margins(0,8,0,0));
    }
}
