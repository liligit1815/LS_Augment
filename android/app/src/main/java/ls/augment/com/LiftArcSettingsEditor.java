package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import java.util.*;
import java.util.concurrent.ExecutorService;
import org.json.JSONObject;

/** One native page; switches own effects, folds only own the parameter visibility. */
final class LiftArcSettingsEditor {
    interface Host {
        String value(String key);
        View input(EnhancementOption option);
        void change(String key,String value,View control);
        void changeAll(Map<String,String> values);
        void refresh(String key,String value);
    }
    private final Activity activity;
    private final UiKit ui;
    private final Host host;
    private final AppConfig config;
    private final ExecutorService worker;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final LinkedHashMap<String,Switch> switches=new LinkedHashMap<>();
    private final LinkedHashMap<String,UiKit.Fold> folds=new LinkedHashMap<>();
    private final Map<String,View> conditional=new HashMap<>();
    private final Map<String,SeekBar> sliders=new HashMap<>();
    private final Map<String,TextView> numericLabels=new HashMap<>();
    private final Map<String,View> colorSamples=new HashMap<>();
    private final Map<String,Button> cancelEffects=new HashMap<>();
    private final LinearLayout view,parameters;
    private final TextView state,preview,previewTitle;
    private final Button cancelRequest;
    private UiKit.Fold masterFold;
    private Dialog colorDialog;
    private JSONObject runtime=new JSONObject();
    private boolean refreshing,active,destroyed,loading,runtimeCurrent,runtimeFresh;
    private android.os.Bundle restoreState;
    private Runnable restoreScroll;
    private int request;
    private final Runnable refreshRuntime=this::loadRuntime;

    LiftArcSettingsEditor(Activity activity,UiKit ui,Host host,AppConfig config,ExecutorService worker){
        this.activity=activity;this.ui=ui;this.host=host;this.config=config;this.worker=worker;
        view=column();view.setTag("native-feature:liftarc:enabled");
        parameters=column();parameters.setPadding(0,ui.dp(8),0,0);
        LinearLayout masterCard=ui.preferenceCard();view.addView(masterCard,ui.wrap());
        Switch master=control("enabled");master.setChecked(false);
        masterCard.addView(ui.featureRow("锁屏上滑效果",help("enabled"),master),ui.wrap());
        state=ui.text("正在读取系统界面适配状态…",12,ui.muted,false);
        state.setTag("liftarc-runtime-state");state.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        masterCard.addView(state,ui.margins(0,4,0,8));
        cancelRequest=ui.tonalButton("取消启用请求");sizeAction(cancelRequest);cancelRequest.setVisibility(View.GONE);masterCard.addView(cancelRequest,ui.margins(0,0,0,8));
        cancelRequest.setOnClickListener(v->host.change(LiftArcOptions.ENABLED,"0",cancelRequest));
        view.addView(parameters,ui.wrap());masterFold=ui.fold(master,parameters);
        master.setOnCheckedChangeListener((button,on)->toggle("enabled",on));

        LinearLayout handles=group("指示条与触控");
        LinearLayout alpha=column();alpha.addView(editor("handle_alpha"),ui.wrap());
        addToggle(handles,"show_handle",alpha);addToggle(handles,"handle_wide",null);addToggle(handles,"haptic",null);

        LinearLayout gestures=group("上滑交互与解锁");
        addToggle(gestures,"parallax",null);
        addParameter(gestures,"手势行程与动画",new String[]{"drag_ratio","unlock_ms"},false);
        addToggle(gestures,"release_return",null);
        LinearLayout flick=column();flick.addView(editor("flick_velocity"),ui.wrap());addToggle(gestures,"flick_unlock",flick);
        addToggle(gestures,"intercept_swipe",null);

        LinearLayout effects=group("弧形与背景效果");
        LinearLayout stroke=column(),strokeValues=column();for(String key:new String[]{"arc_width","arc_alpha","arc_color"})strokeValues.addView(editor(key),ui.wrap());
        stroke.addView(strokeValues,ui.wrap());conditional.put("stroke",strokeValues);addToggle(effects,"arc_enabled",stroke);
        LinearLayout blur=column();blur.addView(editor("blur_strength"),ui.wrap());addToggle(effects,"blur_enabled",blur);
        LinearLayout glass=column();
        glass.addView(ui.foldingSection("材质",editors("glass_thick","glass_opacity","glass_diffuse","glass_blur"),true),ui.wrap());
        glass.addView(ui.foldingSection("折射",editors("glass_refract","glass_edge_ref","glass_refract_w","glass_fresnel"),false),ui.wrap());
        glass.addView(ui.foldingSection("高光",editors("glass_highlight","glass_hl_width"),false),ui.wrap());
        addToggle(effects,"glass_live",glass);
        LinearLayout common=column();
        View mode=binaryChoice("arc_dim","边界样式","描边","压暗");conditional.put("mode",mode);common.addView(mode,ui.wrap());
        View position=binaryChoice("dim_upper","效果位置","弧线下方","弧线上方");conditional.put("position",position);common.addView(position,ui.wrap());
        View dim=editor("dim_strength");conditional.put("dim",dim);common.addView(dim,ui.wrap());
        divider(effects);LinearLayout commonSection=ui.parameterSection("共用效果参数","弧形、玻璃及背景模糊共用边界位置与明暗参数；每个设置只保存一次。",null,common,true);
        conditional.put("common",commonSection);effects.addView(commonSection,ui.wrap());

        LinearLayout hints=group("提示文字");
        LinearLayout hintContent=column();hintContent.addView(editor("hint_text"),ui.wrap());
        preview=ui.text("",12,ui.text,false);preview.setGravity(Gravity.CENTER);preview.setMinHeight(ui.dp(48));preview.setTag("liftarc-hint-preview");
        hintContent.addView(preview,ui.margins(0,8,0,8));
        previewTitle=ui.text("样式预览",12,ui.muted,false);previewTitle.setTag("liftarc-hint-preview-title");
        hintContent.addView(previewTitle,ui.margins(0,0,0,8));
        for(String suffix:new String[]{"hint_size","hint_weight","hint_font","hint_color","hint_gap","hint_offset_x"})hintContent.addView(editor(suffix),ui.wrap());
        hints.addView(ui.parameterSection("提示文字",null,null,hintContent,true),ui.wrap());
        sync();
    }
    View view(){return view;}
    void restoreState(android.os.Bundle saved,Runnable scroll){if(saved!=null){restoreState=new android.os.Bundle(saved);restoreScroll=scroll;}}
    void onResume(){active=true;loadRuntime();}
    void onPause(){active=false;main.removeCallbacks(refreshRuntime);}
    void onDestroy(){destroyed=true;onPause();request++;if(colorDialog!=null)colorDialog.dismiss();}
    void changed(String key){if(key.startsWith(LiftArcOptions.PREFIX))sync();}
    private String value(String suffix){return host.value(LiftArcOptions.key(suffix));}
    private boolean enabled(String suffix){return "1".equals(value(suffix));}
    private String help(String suffix){return FeatureHelp.forOption(LiftArcOptions.option(suffix));}
    private LinearLayout column(){LinearLayout c=new LinearLayout(activity);c.setOrientation(LinearLayout.VERTICAL);return c;}
    private LinearLayout group(String title){ui.addDetailSectionTitle(parameters,title);LinearLayout c=ui.preferenceCard();parameters.addView(c,ui.wrap());return c;}
    private void divider(LinearLayout c){if(c.getChildCount()>0)c.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));}
    private Switch control(String suffix){Switch s=new Switch(activity);s.setTag("config:"+LiftArcOptions.key(suffix));s.setChecked(enabled(suffix));switches.put(suffix,s);return s;}
    private void addToggle(LinearLayout parent,String suffix,View content){
        divider(parent);Switch toggle=control(suffix);parent.addView(ui.featureRow(LiftArcOptions.option(suffix).title,help(suffix),toggle),ui.wrap());
        if(content!=null){content.setPadding(ui.dp(12),0,0,0);parent.addView(content,ui.wrap());UiKit.Fold fold=ui.fold(toggle,content);fold.show(toggle.isChecked());folds.put(suffix,fold);}
        if(Arrays.asList("arc_enabled","blur_enabled","glass_live").contains(suffix)){
            Button cancel=ui.tonalButton("取消"+LiftArcOptions.option(suffix).title+"启用请求");sizeAction(cancel);cancel.setVisibility(View.GONE);parent.addView(cancel,ui.margins(0,4,0,8));cancelEffects.put(suffix,cancel);cancel.setOnClickListener(v->host.change(LiftArcOptions.key(suffix),"0",cancel));
        }
        toggle.setOnCheckedChangeListener((button,on)->toggle(suffix,on));
    }
    private void addParameter(LinearLayout parent,String title,String[] suffixes,boolean expanded){divider(parent);parent.addView(ui.parameterSection(title,null,null,editors(suffixes),expanded),ui.wrap());}
    private LinearLayout editors(String... suffixes){LinearLayout c=column();c.setPadding(ui.dp(12),0,0,0);for(String suffix:suffixes)c.addView(editor(suffix),ui.wrap());return c;}
    private View binaryChoice(String suffix,String title,String off,String on){
        LinearLayout row=ui.parameterInputGroup();row.addView(ui.featureTitle(title,help(suffix)),ui.wrap());
        Spinner choice=ui.choiceSpinner(title);choice.setContentDescription(title);choice.setAdapter(new ArrayAdapter<>(activity,android.R.layout.simple_spinner_dropdown_item,new String[]{off,on}));choice.setSelection(enabled(suffix)?1:0);row.addView(choice,ui.wrap());
        choice.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int index,long id){if(!refreshing)host.change(LiftArcOptions.key(suffix),index==1?"1":"0",choice);}});
        row.setTag("liftarc-binary:"+suffix);return row;
    }
    private View editor(String suffix){
        EnhancementOption option=LiftArcOptions.option(suffix);
        boolean numeric=option.kind==EnhancementOption.Kind.INTEGER||option.kind==EnhancementOption.Kind.DECIMAL;
        LinearLayout row=numeric?ui.parameterInputGroup():(LinearLayout)host.input(option);row.setTag("liftarc-input:"+suffix);
        if(numeric){
            row.addView(ui.featureTitle(option.title,help(suffix)),ui.wrap());
            SeekBar slider=new SeekBar(activity);slider.setMinHeight(ui.dp(48));slider.setMinimumHeight(ui.dp(48));slider.setContentDescription(option.title);slider.setProgressTintList(android.content.res.ColorStateList.valueOf(ui.accent));slider.setThumbTintList(android.content.res.ColorStateList.valueOf(ui.accent));
            int ticks=suffix.equals("hint_weight")?8:1000;slider.setMax(ticks);slider.setTag("liftarc-slider:"+suffix);sliders.put(suffix,slider);
            TextView label=ui.text("",12,ui.muted,false);label.setTag("liftarc-value:"+suffix);numericLabels.put(suffix,label);row.addView(label,ui.wrap());row.addView(slider,ui.wrap());
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}public void onProgressChanged(SeekBar s,int progress,boolean user){if(!user)return;
                String raw=sliderValue(suffix,progress);
                if(option.normalize(raw)!=null)host.change(option.key,raw,s);
            }});
        }
        if(option.kind==EnhancementOption.Kind.COLOR){
            LinearLayout colorLine=new LinearLayout(activity);colorLine.setGravity(Gravity.CENTER_VERTICAL);
            View sample=new View(activity);sample.setContentDescription(option.title+"预览");colorSamples.put(suffix,sample);LinearLayout.LayoutParams sampleParams=new LinearLayout.LayoutParams(ui.dp(36),ui.dp(36));sampleParams.rightMargin=ui.dp(12);colorLine.addView(sample,sampleParams);
            Button pick=ui.tonalButton("选择颜色");sizeAction(pick);colorLine.addView(pick,new LinearLayout.LayoutParams(0,-2,1));row.addView(colorLine,ui.margins(0,8,0,0));
            pick.setOnClickListener(v->colorDialog=ColorEditorDialog.show(activity,ui,option.title,value(suffix),hex->{host.change(option.key,hex,pick);host.refresh(option.key,hex);}));
        }
        return row;
    }
    private String sliderValue(String suffix,int progress){
        EnhancementOption option=LiftArcOptions.option(suffix);SeekBar slider=sliders.get(suffix);
        int tick=Math.max(0,Math.min(slider.getMax(),progress));
        double n=option.minimum+(option.maximum-option.minimum)*tick/slider.getMax();
        if(option.kind==EnhancementOption.Kind.INTEGER)return String.valueOf(suffix.equals("hint_weight")?100+tick*100:(int)Math.round(n));
        return java.math.BigDecimal.valueOf(n).setScale(suffix.endsWith("alpha")||suffix.endsWith("strength")||suffix.startsWith("glass_")||suffix.equals("drag_ratio")?2:1,java.math.RoundingMode.HALF_UP).stripTrailingZeros().toPlainString();
    }
    private void sizeAction(Button button){button.setMinHeight(ui.dp(48));button.setMinimumHeight(ui.dp(48));}
    private boolean capability(String suffix){
        if(!runtimeFresh||runtime.optInt("build",-1)!=BuildConfig.VERSION_CODE)return false;
        String state=runtime.optString("state");if("paused".equals(state)||"unsupported".equals(state)||"conflict".equals(state))return false;
        if(!runtime.optBoolean("installed")||!runtime.optBoolean("gesture"))return false;
        if("arc_enabled".equals(suffix))return runtime.optBoolean("arc");
        if("blur_enabled".equals(suffix))return runtime.optBoolean("blur");
        if("glass_live".equals(suffix))return runtime.optBoolean("glass");
        return true;
    }
    private void toggle(String suffix,boolean on){
        if(refreshing)return;
        if(on&&(!capability(suffix)||!runtimeCurrent)){
            refreshing=true;switches.get(suffix).setChecked(false);refreshing=false;
            String reason=runtime.optString("reason");toast(!reason.isEmpty()?reason:!runtimeCurrent&&runtime.length()>0?"当前配置正在等待系统界面同步，请稍后重试。":"尚未收到有效适配状态，请使用顶部入口重启系统界面后重试。");sync();return;
        }
        host.change(LiftArcOptions.key(suffix),on?"1":"0",switches.get(suffix));sync();
    }
    private void sync(){
        refreshing=true;
        boolean requested=enabled("enabled"),ready=capability("enabled"),paused="paused".equals(runtime.optString("state"));
        boolean effective=requested&&ready&&"ready".equals(runtime.optString("state"));
        Switch master=switches.get("enabled");master.setChecked(effective);master.setEnabled(ready&&(requested||runtimeCurrent));masterFold.sync();cancelRequest.setVisibility(requested&&!effective?View.VISIBLE:View.GONE);
        for(Map.Entry<String,Switch> entry:switches.entrySet())if(!entry.getKey().equals("enabled")){
            String suffix=entry.getKey();boolean available=capability(suffix);entry.getValue().setChecked(enabled(suffix)&&available);entry.getValue().setEnabled(available);UiKit.Fold fold=folds.get(suffix);if(fold!=null)fold.sync();
            Button cancel=cancelEffects.get(suffix);if(cancel!=null)cancel.setVisibility(enabled(suffix)&&!available?View.VISIBLE:View.GONE);
        }
        String status=runtime.optString("state"),reason=runtime.optString("reason");
        String label=runtime.length()==0?"尚未收到系统界面适配状态。请使用顶部入口重启系统界面。":paused?"最近接入反馈：已暂停，异常保护已停止锁屏上滑效果。":"conflict".equals(status)?"最近接入反馈：存在锁屏手势冲突。":"unsupported".equals(status)?"最近接入反馈：当前锁屏暂不支持此效果。":!runtime.optBoolean("installed")?"锁屏接入尚未加载，请使用顶部入口重启系统界面。":requested&&!effective?"启用请求已保存，等待系统界面应用。":effective?"最近接入反馈：锁屏上滑效果已启用。":"最近接入反馈：锁屏上滑效果已关闭。";
        if(!reason.isEmpty())label+="\n"+reason;
        if(runtime.length()>0&&runtime.optInt("build",-1)!=BuildConfig.VERSION_CODE)label="系统界面尚未加载当前版本，请使用顶部入口重启系统界面。";
        else if(runtime.length()>0&&!runtimeFresh)label="当前接入状态尚未确认，等待系统界面重新回报。";
        else if(runtime.length()>0&&!runtimeCurrent)label+="\n当前设置正在等待系统界面同步。";
        if(runtimeFresh&&((enabled("blur_enabled")&&!runtime.optBoolean("blur"))||(enabled("glass_live")&&!runtime.optBoolean("glass"))))label+="\n壁纸效果尚未准备好，已保留设置；普通手势按适配状态运行。";
        state.setText(label);
        boolean arc=enabled("arc_enabled")&&capability("arc_enabled"),glass=enabled("glass_live")&&capability("glass_live"),blur=enabled("blur_enabled")&&capability("blur_enabled"),dim=enabled("arc_dim");
        visible("stroke",arc&&!dim);folds.get("arc_enabled").arrow.setVisibility(dim?View.INVISIBLE:View.VISIBLE);
        visible("mode",arc||glass);visible("dim",dim&&(arc||glass));visible("position",blur||dim&&(arc||glass));visible("common",arc||glass||blur);
        for(String suffix:new String[]{"arc_dim","dim_upper"}){View row=conditional.get(suffix.equals("arc_dim")?"mode":"position");Spinner choice=(Spinner)((ViewGroup)row).getChildAt(1);choice.setSelection(enabled(suffix)?1:0);}
        for(Map.Entry<String,SeekBar> entry:sliders.entrySet()){
            String suffix=entry.getKey();EnhancementOption option=LiftArcOptions.option(suffix);double n=number(suffix);entry.getValue().setProgress((int)Math.round((n-option.minimum)/(option.maximum-option.minimum)*entry.getValue().getMax()));
            numericLabels.get(suffix).setText(formatValue(suffix,n)+" · 范围 "+formatValue(suffix,option.minimum)+"～"+formatValue(suffix,option.maximum));
        }
        for(Map.Entry<String,View> sample:colorSamples.entrySet())try{sample.getValue().setBackground(ui.roundStroke(Color.parseColor(value(sample.getKey())),8,ui.outline,1));}catch(IllegalArgumentException ignored){}
        if(preview!=null){String text=value("hint_text");preview.setText(text);preview.setVisibility(text.isEmpty()?View.GONE:View.VISIBLE);previewTitle.setVisibility(text.isEmpty()?View.GONE:View.VISIBLE);preview.setTextSize((float)number("hint_size"));preview.setTextColor(Color.parseColor(value("hint_color")));String[] families={"sans-serif","serif","monospace","cursive","sans-serif-condensed"};int font=(int)number("hint_font");int weight=Math.max(100,Math.min(900,Math.round((float)number("hint_weight")/100)*100));preview.setTypeface(Typeface.create(Typeface.create(families[Math.max(0,Math.min(4,font))],Typeface.NORMAL),weight,false));}
        refreshing=false;
    }
    private void visible(String id,boolean show){View v=conditional.get(id);if(v!=null)v.setVisibility(show?View.VISIBLE:View.GONE);}
    private double number(String suffix){try{return Double.parseDouble(value(suffix));}catch(RuntimeException ignored){return Double.parseDouble(LiftArcOptions.option(suffix).defaultValue);}}
    private String formatValue(String suffix,double n){
        if(suffix.endsWith("alpha")||suffix.endsWith("strength")||suffix.equals("drag_ratio")||Arrays.asList("glass_opacity","glass_diffuse","glass_refract","glass_edge_ref","glass_refract_w","glass_fresnel","glass_highlight").contains(suffix))return Math.round(n*100)+"%";
        String unit=Arrays.asList("arc_width","glass_thick","hint_gap","hint_offset_x").contains(suffix)?" dp":"flick_velocity".equals(suffix)?" dp/s":"unlock_ms".equals(suffix)?" ms":"glass_blur".equals(suffix)?" px":"hint_size".equals(suffix)?" sp":"glass_hl_width".equals(suffix)?" 倍":"";
        return java.math.BigDecimal.valueOf(n).stripTrailingZeros().toPlainString()+unit;
    }
    private void loadRuntime(){
        if(!active||destroyed||loading||worker.isShutdown())return;loading=true;int current=++request;
        worker.execute(()->{String raw="",checksum="";long revision=-1;boolean attributed=false;try{
                raw=config.diagnostic(LiftArcOptions.STATUS);ConfigSnapshot snapshot=config.configSnapshot();checksum=snapshot.checksum;revision=snapshot.revision;
                int systemUiUid=activity.getPackageManager().getApplicationInfo("com.android.systemui",0).uid;
                attributed=DiagnosticEvidenceStore.matchesRecentSource(activity,LiftArcOptions.STATUS,raw,"com.android.systemui",systemUiUid,new JSONObject(raw).optInt("pid",-1),90_000);
            }catch(Exception ignored){}String result=raw,expectedChecksum=checksum;long expectedRevision=revision;boolean sourceVerified=attributed;
            main.post(()->{loading=false;if(destroyed||current!=request)return;try{runtime=result.isEmpty()?new JSONObject():new JSONObject(result);}catch(Exception ignored){runtime=new JSONObject();}runtimeCurrent=!expectedChecksum.isEmpty()&&expectedChecksum.equals(runtime.optString("configChecksum"))&&expectedRevision==runtime.optLong("configRevision",-1);
                long nowElapsed=android.os.SystemClock.elapsedRealtime(),nowWall=System.currentTimeMillis(),observedElapsed=runtime.optLong("observedElapsed"),observedAt=runtime.optLong("observedAt");
                runtimeFresh=sourceVerified&&observedElapsed>0&&observedElapsed<=nowElapsed&&nowElapsed-observedElapsed<=90_000&&observedAt>0&&observedAt<=nowWall&&nowWall-observedAt<=90_000;sync();
                boolean restoreConfirmed=runtimeFresh&&runtimeCurrent&&runtime.optInt("build",-1)==BuildConfig.VERSION_CODE;
                if(restoreState!=null&&(!enabled("enabled")||restoreConfirmed)){
                    ui.restoreState(restoreState);restoreState=null;if(restoreScroll!=null)restoreScroll.run();restoreScroll=null;
                }
                if(active)main.postDelayed(refreshRuntime,1500);});
        });
    }
    private void toast(String message){Toast.makeText(activity,message,Toast.LENGTH_LONG).show();}
}
