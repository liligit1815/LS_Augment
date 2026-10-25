package ls.augment.com;

import android.content.Context;
import android.os.SystemClock;
import android.view.*;
import android.widget.*;
import java.util.function.*;

/** Uses the same controls as native spacing; only the measured capacity rule differs. */
final class StatusBarWifiAssetSpacingEditor {
    private StatusBarWifiAssetSpacingEditor(){}
    private static final String[] SURFACES={"main","lock","control","notification"};
    static boolean applies(Context context,String scope,String id,StatusBarIconSpacingSpec spec){
        if(!StatusBarWifiSpacingPolicy.member(id))return false;
        for(String surface:scope.equals("all")?SURFACES:new String[]{scope}){
            if(!StatusBarWifiAssetSpacingPolicy.affected(spec,scope,surface,id))continue;
            StatusBarWifiSpacingObservation value=contract(context,surface,id);
            if(value!=null&&value.reason.equals("asset_cells"))return true;
        }return false;
    }
    private static Display display(Context context){WindowManager wm=(WindowManager)context.getSystemService(Context.WINDOW_SERVICE);return wm==null?null:wm.getDefaultDisplay();}
    private static boolean current(Context context,StatusBarHeaderSpacingObservation profile){
        Display display=display(context);if(display==null||profile==null)return false;long now=SystemClock.elapsedRealtime();
        return profile.current(now,System.currentTimeMillis()-now,BuildConfig.VERSION_CODE,display.getDisplayId(),display.getRotation(),Math.round(context.getResources().getDisplayMetrics().density*1000),Math.round(context.getResources().getConfiguration().fontScale*1000),context.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0);
    }
    private static String read(Context context,String key){return context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key,"");}
    private static StatusBarWifiSpacingObservation contract(Context context,String surface,String id){
        Display display=display(context);if(display==null)return null;
        StatusBarWifiSpacingObservation value=StatusBarWifiSpacingObservation.parse(read(context,StatusBarWifiSpacingObservation.key(surface,display.getRotation(),id)));
        return value!=null&&current(context,value.profile)?value:null;
    }
    private static StatusBarWifiAssetSpacingObservation observation(Context context,String surface,String id){
        Display display=display(context);if(display==null)return null;
        StatusBarWifiAssetSpacingObservation value=StatusBarWifiAssetSpacingObservation.parse(read(context,StatusBarWifiAssetSpacingObservation.key(surface,display.getRotation(),id)));
        return value!=null&&current(context,value.profile)&&value.assetKey.equals(StatusBarWifiAssetSpacingObservation.environment(new AppConfig(context).snapshot(),id))?value:null;
    }
    static boolean accepts(Context context,String scope,String id,StatusBarIconSpacingSpec spec){
        return budget(context,scope,id).accepts(spec);
    }
    private static Budget budget(Context context,String scope,String id){
        Budget result=new Budget(scope,id);Display display=display(context);if(display==null)return result;
        for(String surface:result.surfaces){
            StatusBarWifiSpacingObservation contract=contract(context,surface,id);if(contract!=null)result.contracts.put(surface,contract);
            if(contract!=null&&contract.reason.equals("asset_cells")){StatusBarWifiAssetSpacingObservation value=observation(context,surface,id);if(value!=null)result.assets.put(surface,value);}
            if(surface.equals("control")||surface.equals("notification")){
                StatusBarHeaderSpacingObservation value=StatusBarHeaderSpacingObservation.parse(read(context,StatusBarHeaderSpacingObservation.KEY+surface+"_"+display.getRotation()));
                if(value!=null&&current(context,value))result.headers.put(surface,value);
            }
        }return result;
    }
    private static final class Budget {
        final String scope,id;final String[] surfaces;
        final java.util.Map<String,StatusBarWifiSpacingObservation> contracts=new java.util.HashMap<>();
        final java.util.Map<String,StatusBarWifiAssetSpacingObservation> assets=new java.util.HashMap<>();
        final java.util.Map<String,StatusBarHeaderSpacingObservation> headers=new java.util.HashMap<>();
        Budget(String scope,String id){this.scope=scope;this.id=id;surfaces=scope.equals("all")?SURFACES:new String[]{scope};}
        boolean accepts(StatusBarIconSpacingSpec spec){boolean affected=false;
            for(String surface:surfaces){
                if(!StatusBarWifiAssetSpacingPolicy.affected(spec,scope,surface,id))continue;affected=true;
                StatusBarWifiSpacingObservation contract=contracts.get(surface);if(contract==null)return false;
                if(contract.reason.equals("asset_cells")){
                    StatusBarWifiAssetSpacingObservation value=assets.get(surface);if(value==null||!value.accepts(spec,surface,id))return false;
                }else if(contract.reason.equals("native")){
                    if(surface.equals("control")||surface.equals("notification")){StatusBarHeaderSpacingObservation header=headers.get(surface);
                        if(header==null||spec.resolve(surface,id).vertical()+spec.resolve(surface,StatusBarWifiSpacingPolicy.peer(id)).vertical()>header.vertical)return false;}
                }else return false;
            }return affected;
        }
    }
    static void add(Context context,UiKit ui,LinearLayout parent,String scope,String id,Supplier<String> read,Consumer<String> write,Runnable refresh){
        LinearLayout form=new LinearLayout(context);form.setOrientation(LinearLayout.VERTICAL);form.setTag("icon-spacing:"+scope+":"+id);
        form.addView(ui.text("导入素材按完整画布独立排列，信号与活动箭头分别留白。PNG 的透明区域和 GIF 每帧共用画布；不改变真实状态，也不缩小已设置的边距。",12,ui.muted,false),ui.wrap());
        TextView status=ui.text("",12,ui.muted,false);status.setTag("icon-spacing-asset-capacity:"+scope+":"+id);form.addView(status,ui.margins(0,8,0,0));
        if(scope.equals("all"))form.addView(ui.text("共享设置只修改仍在继承的页面。主状态栏、锁屏、通知中心和控制中心分别核验；已有单独设置保持优先。尚未观察的位置不会借用其他页面的上限。",12,ui.muted,false),ui.margins(0,4,0,0));
        String[] titles={"起始边距","顶部边距","末尾边距","底部边距"};SeekBar[] bars=new SeekBar[4];TextView[] labels=new TextView[4];
        for(int i=0;i<4;i++){labels[i]=ui.text("",12,ui.muted,false);form.addView(labels[i],ui.margins(0,8,0,0));bars[i]=ui.slider();bars[i].setTag("icon-spacing-"+i+":"+id);bars[i].setContentDescription(titles[i]);form.addView(bars[i],ui.wrap());NumericParameterEditor.linear(ui,bars[i],titles[i],0,1," dp",labels[i]);}
        Runnable sync=()->{
            StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(read.get());if(spec==null)spec=StatusBarIconSpacingSpec.empty();StatusBarIconSpacingSpec.Insets edge=spec.resolve(scope,id);int[] values={edge.start,edge.top,edge.end,edge.bottom};
            Budget limits=budget(context,scope,id);
            StringBuilder description=new StringBuilder();
            for(String surface:scope.equals("all")?SURFACES:new String[]{scope})if(StatusBarWifiAssetSpacingPolicy.affected(spec,scope,surface,id)){
                if(description.length()>0)description.append('\n');description.append(surfaceName(surface)).append("：");StatusBarWifiSpacingObservation contract=limits.contracts.get(surface);
                StatusBarWifiAssetSpacingObservation value=limits.assets.get(surface);
                if(value!=null){description.append("组合可用宽 ").append((int)Math.floor(value.maxWidth/value.units)).append(" dp、高 ").append((int)Math.floor(value.maxHeight/value.units)).append(" dp；四边上限随当前设置联动");}
                else if(contract!=null&&contract.reason.equals("native"))description.append("原厂图层，沿用原厂间距规则");
                else description.append("尚无当前设置下的可用空间，请显示此页面后刷新");
            }
            if(description.length()==0)description.append("各页面已有单独设置，共享设置当前没有生效位置。");
            if(!limits.accepts(spec))description.append("\n当前组合空间未知或不足，手机保留原厂显示；恢复和继承仍可使用。");
            status.setText(description.toString());
            for(int i=0;i<4;i++){int maximum=-1;for(int candidate=0;candidate<=StatusBarIconSpacingSpec.MAX_DP;candidate++){int[] next=values.clone();next[i]=candidate;if(limits.accepts(spec.with(scope,id,new StatusBarIconSpacingSpec.Insets(next[0],next[1],next[2],next[3]))))maximum=candidate;}
                bars[i].setMax(Math.max(values[i],Math.max(0,maximum)));bars[i].setProgress(values[i]);bars[i].setEnabled(maximum>=0&&(maximum>0||values[i]>0));labels[i].setText(labels[i].getContext().getString(R.string.status_statusbariconspacingeditor_44 ,String.valueOf(titles[i]), String.valueOf(values[i]), String.valueOf((maximum>=0?" / 当前最多 "+maximum+" dp":" / 等待可用空间"))));}
        };
        for(int i=0;i<4;i++){final int index=i;bars[i].setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            public void onProgressChanged(SeekBar bar,int progress,boolean user){if(user)labels[index].setText(labels[index].getContext().getString(R.string.status_statusbariconspacingeditor_45 ,String.valueOf(titles[index]), String.valueOf(progress)));}
            public void onStartTrackingTouch(SeekBar bar){}
            public void onStopTrackingTouch(SeekBar bar){StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(read.get());if(spec==null)return;StatusBarIconSpacingSpec.Insets edge=spec.resolve(scope,id);int[] next={edge.start,edge.top,edge.end,edge.bottom};next[index]=bar.getProgress();StatusBarIconSpacingSpec candidate=spec.with(scope,id,new StatusBarIconSpacingSpec.Insets(next[0],next[1],next[2],next[3]));
                if(accepts(context,scope,id,candidate))write.accept(candidate.serialize());else Toast.makeText(context,"当前组合空间已变化，本次未保存。请显示对应页面后刷新。",Toast.LENGTH_LONG).show();sync.run();}
        });}
        sync.run();Button reload=ui.tonalButton("刷新本机可用空间");reload.setOnClickListener(v->refresh.run());form.addView(reload,ui.margins(0,8,0,0));
        Button inherit=ui.tonalButton(scope.equals("all")?"清除共享额外边距":"恢复继承共享边距");inherit.setOnClickListener(v->{StatusBarIconSpacingSpec s=StatusBarIconSpacingSpec.parse(read.get());if(s!=null)write.accept(s.with(scope,id,null).serialize());refresh.run();});form.addView(inherit,ui.wrap());
        if(!scope.equals("all")){Button zero=ui.tonalButton("此位置不增加额外边距");zero.setOnClickListener(v->{StatusBarIconSpacingSpec s=StatusBarIconSpacingSpec.parse(read.get());if(s!=null)write.accept(s.with(scope,id,StatusBarIconSpacingSpec.ZERO).serialize());refresh.run();});form.addView(zero,ui.wrap());}
        parent.addView(ui.foldingSection("图标边界间距",form,false),ui.margins(0,8,0,0));
    }
    private static String surfaceName(String surface){switch(surface){case "main":return "主状态栏";case "lock":return "锁屏";case "control":return "控制中心";case "notification":return "通知中心";default:return surface;}}
}
