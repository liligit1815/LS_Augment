package ls.augment.com;

import android.app.*;
import android.content.Intent;
import android.os.*;
import android.text.*;
import android.widget.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.*;

final class HealthEditorController extends NativeEditorController {
    HealthEditorController(Activity owner,String route,boolean embedded){super(owner,route,embedded);}
    private UiKit ui;private AppConfig config;private TextView accountView,preview,backgroundView;
    private Switch multiplyEnabled,planEnabled,dailyLimitEnabled;private SeekBar multiplier;
    private EditText executions,steps,dailyLimitSteps;private Button fromButton,toButton;
    private final CheckBox[] days=new CheckBox[7];
    private final Handler main=new Handler(Looper.getMainLooper());
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private String bound="",planId=UUID.randomUUID().toString().replace("-","");
    private long seed=new Random().nextLong(),generation,queuedGeneration=-1;private LocalDate date=LocalDate.now();
    private int from=540,to=1080,pendingSaves;private boolean loading=true,dirty,planDraftChanged,resumed;
    private final Map<String,String> queuedValues=new LinkedHashMap<>();
    private UiKit.Fold multiplyFold,planFold,dailyLimitFold;
    private final Runnable autoSave=()->save();
    private final Runnable statusRefresh=new Runnable(){public void run(){if(!resumed)return;showBackground();main.postDelayed(this,2000);}};
    @Override public void onCreate(Bundle state){
        super.onCreate(state);ui=editorUi();config=new AppConfig(this);
        StepPlan old=StepPlan.parse(config.get(ConfigSchema.HEALTH_PLAN));bound=config.get(ConfigSchema.HEALTH_ACCOUNT);
        if(old!=null){planId=old.id;seed=old.seed;date=old.startDate;from=old.fromMinute;to=old.toMinute;}
        LinearLayout page=ui.detailPage("步数修改",ScopeRestartDialog.APPS);
        LinearLayout connection=ui.card();page.addView(connection,ui.margins(0,8,0,12));
        connection.addView(ui.featureTitle("账户绑定", "先打开小米运动健康并等待账户接入，再绑定当前账户。步数倍速和增步计划只用于已绑定的本机账户；切换账户后需要重新确认绑定。"));
        accountView=ui.text("",13,ui.text,true);connection.addView(accountView,ui.margins(0,0,0,10));
        LinearLayout accountActions=new LinearLayout(this);
        Button open=ui.tonalButton("打开健康应用");open.setOnClickListener(v->openHealth());accountActions.addView(open,new LinearLayout.LayoutParams(0,ui.dp(44),1));
        Button bind=ui.tonalButton("绑定当前账户");bind.setOnClickListener(v->{
            String active=config.diagnostic("ls_augment_health_account_runtime");
            if(!active.matches("[0-9a-f]{64}")||!fresh()){toast("先打开小米运动健康，等待账户接入后再绑定");return;}
            if(!bound.equals(active)){planId=UUID.randomUUID().toString().replace("-","");date=LocalDate.now();planDraftChanged=true;}
            bound=active;showAccount();changed();
        });LinearLayout.LayoutParams bp=new LinearLayout.LayoutParams(0,ui.dp(44),1);bp.setMargins(ui.dp(8),0,0,0);accountActions.addView(bind,bp);connection.addView(accountActions);
        backgroundView=ui.text("",12,ui.muted,false);connection.addView(backgroundView,ui.margins(0,10,0,0));
        connection.addView(ui.text("后台执行需要在系统电池优化中允许小米运动健康自启动和后台运行。强行停止后需重新打开。云同步遵循健康应用的自动同步间隔，需要立即同步时可打开健康应用。",11,ui.muted,false),ui.margins(0,6,0,0));
        LinearLayout multiply=ui.card();page.addView(multiply,ui.margins(0,0,0,12));
        multiplyEnabled=new Switch(this);multiplyEnabled.setChecked(config.getBoolean(ConfigSchema.HEALTH_MULTIPLY_ENABLED));
        multiply.addView(ui.featureRow("真实步数加倍","1 倍为原始步数；随机增加的步数不会再乘倍数。",multiplyEnabled));
        LinearLayout multiplyBody=new LinearLayout(this);multiplyBody.setOrientation(LinearLayout.VERTICAL);multiply.addView(multiplyBody);multiplyFold=ui.fold(multiplyEnabled,multiplyBody);
        multiplyBody.addView(ui.featureTitle("步数倍数", "设置新记录的真实步数按 1–10 倍计入，1 倍保持原值。随机计划增加的步数不会再次乘倍数。"));
        TextView rate=ui.text("",12,ui.muted,false);multiplyBody.addView(rate);multiplier=new SeekBar(this);multiplier.setMax(9);multiplier.setProgress(Math.max(0,Math.min(9,config.getInt(ConfigSchema.HEALTH_MULTIPLIER,100)/100-1)));multiplyBody.addView(multiplier);
        rate.setText("当前："+(multiplier.getProgress()+1)+" 倍");
        multiplier.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}
            public void onProgressChanged(SeekBar s,int n,boolean user){rate.setText("当前："+(n+1)+" 倍");if(user)changed();}});
        LinearLayout plan=ui.card();page.addView(plan,ui.margins(0,0,0,12));planEnabled=new Switch(this);planEnabled.setChecked(config.getBoolean(ConfigSchema.HEALTH_PLAN_ENABLED));
        plan.addView(ui.featureRow("随机增加步数","在指定时间范围内随机执行，按选中的星期重复。",planEnabled));
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);plan.addView(body);planFold=ui.fold(planEnabled,body);
        body.addView(ui.featureTitle("执行时间", "在开始与结束时间之间随机选择执行时刻。结束时间早于开始时间时，按跨午夜范围处理，执行星期归开始当天；开始和结束不能相同。"));
        LinearLayout times=new LinearLayout(this);fromButton=ui.tonalButton("");toButton=ui.tonalButton("");
        fromButton.setOnClickListener(v->pickTime(true));toButton.setOnClickListener(v->pickTime(false));times.addView(fromButton,new LinearLayout.LayoutParams(0,ui.dp(44),1));
        LinearLayout.LayoutParams tp=new LinearLayout.LayoutParams(0,ui.dp(44),1);tp.setMargins(ui.dp(8),0,0,0);times.addView(toButton,tp);body.addView(times,ui.margins(0,10,0,8));
        executions=input(body,"随机执行次数",old==null?10:old.executions>0?old.executions:1);
        steps=input(body,"每次增加步数",old==null?200:old.executions>0?old.stepsPerExecution:old.amount);
        body.addView(ui.section("执行星期","选择需要执行的日期；跨午夜的时间范围归开始当天。"),ui.margins(0,10,0,4));
        String[] labels={"一","二","三","四","五","六","日"};
        for(int r=0;r<2;r++){LinearLayout row=new LinearLayout(this);for(int i=r*4;i<Math.min(7,r*4+4);i++){
            CheckBox box=new CheckBox(this);box.setText("周"+labels[i]);box.setTextSize(12);ui.styleCheckBox(box);box.setChecked(((old==null?31:old.weekdays)&(1<<i))!=0);days[i]=box;row.addView(box,new LinearLayout.LayoutParams(0,-2,1));box.setOnCheckedChangeListener((b,c)->planChanged());}body.addView(row);}
        preview=ui.text("",12,ui.muted,false);body.addView(preview,ui.margins(0,8,0,0));
        body.addView(ui.text("修改自动保存。当天已生成的时间表保持不变，修改用于下一执行日；关闭后停止后续新增，已保存的步数保留。",11,ui.muted,false),ui.margins(0,10,0,0));
        LinearLayout limit=ui.card();page.addView(limit,ui.margins(0,0,0,12));
        dailyLimitEnabled=new Switch(this);dailyLimitEnabled.setChecked(config.getBoolean(ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED));
        limit.addView(ui.featureRow("当日步数上限","当日步数达到或超过上限后，停止加倍和随机增加的额外步数。",dailyLimitEnabled));
        LinearLayout limitBody=new LinearLayout(this);limitBody.setOrientation(LinearLayout.VERTICAL);limit.addView(limitBody);dailyLimitFold=ui.fold(dailyLimitEnabled,limitBody);
        dailyLimitSteps=input(limitBody,"上限步数",config.getInt(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,10000),this::changed);
        limitBody.addView(ui.text("可设置 1–1000000 步，修改自动保存。真实步行仍正常记录，已有步数不会减少；次日按新一天重新计算。提高或关闭上限后恢复后续增步，先前受限的计划步数不补发。",11,ui.muted,false),ui.margins(0,8,0,0));
        multiplyEnabled.setOnCheckedChangeListener((b,c)->{if(c&&bound.isEmpty()){multiplyEnabled.setChecked(false);toast("请先绑定账户");return;}changed();});
        planEnabled.setOnCheckedChangeListener((b,c)->{if(c&&bound.isEmpty()){planEnabled.setChecked(false);toast("请先绑定账户");return;}changed();});
        dailyLimitEnabled.setOnCheckedChangeListener((b,c)->changed());
        loading=false;showAccount();updatePreview();
    }
    private EditText input(LinearLayout parent,String label,int value){return input(parent,label,value,this::planChanged);}
    private EditText input(LinearLayout parent,String label,int value,Runnable onChange){parent.addView(ui.featureTitle(label,inputHelp(label)),ui.margins(0,8,0,4));EditText e=new EditText(this);ui.styleInput(e);e.setSingleLine(true);e.setInputType(InputType.TYPE_CLASS_NUMBER);e.setContentDescription(label);e.setText(""+value);parent.addView(e);
        e.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int n){}public void onTextChanged(CharSequence s,int a,int b,int c){onChange.run();}public void afterTextChanged(Editable e){}});return e;}
    private String inputHelp(String label){
        if("随机执行次数".equals(label))return "设置每个执行日随机增步的次数，范围 1–100。每次必须落在不同分钟，次数不能超过所选时间范围的分钟数。";
        if("每次增加步数".equals(label))return "设置每次计划执行增加的步数。执行次数乘以每次步数为每日计划总量，不能超过 1000000 步；已启用的当日上限仍会限制实际新增。";
        return "设置当日步数上限，范围 1–1000000。两类增步共用额度，到达上限后停止额外新增；真实步行继续记录，已有步数不会减少。";
    }
    private android.app.Dialog pickTime(boolean start){
        int m=start?from:to%1440;
        LinearLayout row=new LinearLayout(this);row.setGravity(android.view.Gravity.CENTER);
        android.widget.NumberPicker hour=timeWheel("小时",23,m/60);
        android.widget.NumberPicker minute=timeWheel("分钟",59,m%60);
        row.addView(hour,new LinearLayout.LayoutParams(0,ui.dp(160),1));
        LinearLayout.LayoutParams separator=new LinearLayout.LayoutParams(-2,-2);
        separator.setMargins(ui.dp(8),0,ui.dp(8),0);
        row.addView(ui.text(":",20,ui.accent,true),separator);
        row.addView(minute,new LinearLayout.LayoutParams(0,ui.dp(160),1));
        return ui.glassDialog(start?"选择开始时间":"选择结束时间",row,"确定",()->{
            hour.clearFocus();minute.clearFocus();
            int value=hour.getValue()*60+minute.getValue();
            if(start)from=value;else to=value;
            planChanged();
        },"取消");
    }
    private android.widget.NumberPicker timeWheel(String label,int max,int value){
        android.widget.NumberPicker picker=new android.widget.NumberPicker(this);
        picker.setMinValue(0);picker.setMaxValue(max);picker.setValue(value);
        picker.setFormatter(n->String.format(Locale.ROOT,"%02d",n));
        picker.setContentDescription(label);picker.setTextColor(ui.text);picker.setTextSize(ui.dp(22));
        picker.setSelectionDividerHeight(ui.dp(1));
        picker.setDescendantFocusability(android.view.ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        return picker;
    }
    private String time(int minute){return String.format(Locale.ROOT,"%02d:%02d",minute/60,minute%60);}
    private StepPlan draft(){int mask=0;for(int i=0;i<7;i++)if(days[i].isChecked())mask|=1<<i;return new StepPlan(planId,bound,ZoneId.systemDefault().getId(),date,from,to,Integer.parseInt(executions.getText().toString()),Integer.parseInt(steps.getText().toString()),mask,seed);}
    private void updatePreview(){fromButton.setText("开始："+time(from));toButton.setText("结束："+time(to));
        StepPlan existing=StepPlan.parse(config.get(ConfigSchema.HEALTH_PLAN));
        if(!planDraftChanged&&existing!=null&&existing.executions==0){preview.setText("保留的一次性计划："+existing.startDate+"，共 "+existing.amount+" 步。修改计划后将按所选星期重复执行。");return;}
        try{StepPlan p=draft();LocalDate day=LocalDate.now();if(day.isBefore(p.startDate))day=p.startDate;for(int i=0;i<7&&!p.runsOn(day);i++)day=day.plusDays(1);
            StringBuilder text=new StringBuilder("每日合计："+p.amount+" 步\n随机时间示例（"+day+"）：\n");int n=0;
            for(Map.Entry<Long,Integer> e:p.timetable(day).entrySet()){if(n++>=8){text.append("……");break;}text.append(Instant.ofEpochSecond(e.getKey()).atZone(ZoneId.of(p.zone)).format(DateTimeFormatter.ofPattern("MM/dd HH:mm"))).append(" +").append(e.getValue()).append(" 步\n");}preview.setText(text);
        }catch(Exception e){preview.setText(bound.isEmpty()?"绑定账户后可预览计划。":"请设置有效次数、步数、时间范围，并至少选择一天。每次须落在不同分钟，每日合计不超过 1000000 步。");}}
    private void planChanged(){if(loading)return;planDraftChanged=true;changed();}
    private void changed(){if(loading)return;multiplyFold.sync();planFold.sync();dailyLimitFold.sync();updatePreview();dirty=true;generation++;main.removeCallbacks(autoSave);main.postDelayed(autoSave,600);}
    private void save(){save(false);}
    private void save(boolean flushPending){
        if(!dirty||worker.isShutdown()||(!flushPending&&pendingSaves>0)
                ||(pendingSaves>0&&queuedGeneration==generation))return;
        LinkedHashMap<String,String> updates=new LinkedHashMap<>();
        appendDailyLimitUpdates(updates);
        appendHealthUpdates(updates);
        if(updates.isEmpty())return;
        // Freeze the valid UI values now; the serial queue survives Activity destruction.
        Map<String,String> frozen=Collections.unmodifiableMap(new LinkedHashMap<>(updates));
        long current=generation;queuedGeneration=current;queuedValues.putAll(frozen);pendingSaves++;
        worker.execute(()->{AppConfig.SaveResult result=config.save(frozen);main.post(()->{
            pendingSaves--;if(pendingSaves==0)queuedValues.clear();
            if(result.success){dirty=generation!=current;if(dirty&&pendingSaves==0&&!isDestroyed())main.post(autoSave);}
            else toast(result.message);
        });});
    }
    private String queuedOrSaved(String key){return queuedValues.containsKey(key)?queuedValues.get(key):config.get(key);}
    private void appendDailyLimitUpdates(Map<String,String> updates){
        String value=ConfigSchema.normalize(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,dailyLimitSteps.getText().toString());
        boolean enabled=dailyLimitEnabled.isChecked();
        dailyLimitSteps.setError(value==null&&enabled?"请输入 1–1000000 的整数；此项未保存，仍使用原上限设置。":null);
        // An unfinished limit draft must not block switching it off or saving other settings.
        if(value!=null){updates.put(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,value);updates.put(ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED,enabled?"1":"0");}
        else if(!enabled)updates.put(ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED,"0");
    }
    private void appendHealthUpdates(Map<String,String> updates){
        boolean enabled=multiplyEnabled.isChecked()||planEnabled.isChecked();if(enabled&&bound.isEmpty())return;
        String plan=queuedOrSaved(ConfigSchema.HEALTH_PLAN);if(!bound.isEmpty()&&(planDraftChanged||(plan.isEmpty()&&planEnabled.isChecked())))try{plan=draft().serialize();}catch(Exception e){if(planEnabled.isChecked())return;}
        updates.put(ConfigSchema.HEALTH_ENABLED,enabled?"1":"0");updates.put(ConfigSchema.HEALTH_MULTIPLY_ENABLED,multiplyEnabled.isChecked()?"1":"0");updates.put(ConfigSchema.HEALTH_PLAN_ENABLED,planEnabled.isChecked()?"1":"0");
        updates.put(ConfigSchema.HEALTH_BACKGROUND,"1");updates.put(ConfigSchema.HEALTH_MULTIPLIER,""+((multiplier.getProgress()+1)*100));updates.put(ConfigSchema.HEALTH_ACCOUNT,bound);updates.put(ConfigSchema.HEALTH_PLAN,plan);
        if(multiplyEnabled.isChecked()&&(!ConfigSchema.truthy(queuedOrSaved(ConfigSchema.HEALTH_MULTIPLY_ENABLED))||!bound.equals(queuedOrSaved(ConfigSchema.HEALTH_ACCOUNT))))updates.put(ConfigSchema.HEALTH_SINCE,""+(System.currentTimeMillis()/1000));
    }
    private boolean fresh(){try{long age=System.currentTimeMillis()-Long.parseLong(config.diagnostic("ls_augment_health_heartbeat"));return age>=0&&age<90000;}catch(Exception e){return false;}}
    private void showAccount(){accountView.setText(bound.isEmpty()?"尚未绑定账户":"已绑定本机账户 · "+bound.substring(0,8));}
    private void showBackground(){
        if(!config.getBoolean(ConfigSchema.HEALTH_ENABLED)||!config.getBoolean(ConfigSchema.HEALTH_BACKGROUND)){backgroundView.setText("后台执行已关闭");return;}
        String status=config.diagnostic("ls_augment_health_background_runtime");
        if("原生数据服务已连接".equals(status))status=fresh()?"后台执行正常":"后台暂无响应，请检查自启动和后台运行权限";
        String runtime=config.diagnostic("ls_augment_health_runtime");
        java.util.regex.Matcher pending=java.util.regex.Pattern.compile("待同步 (\\d+ 段|核对中)").matcher(runtime);
        if(pending.find())status+=(status.isEmpty()?"":" · ")+pending.group();
        backgroundView.setText(status.isEmpty()?"等待后台服务连接":status);
    }
    private void openHealth(){Intent i=getPackageManager().getLaunchIntentForPackage("com.mi.health");if(i==null)toast("未找到小米运动健康");else startActivity(i);}
    private void toast(String text){Toast.makeText(this,text,Toast.LENGTH_LONG).show();}
    @Override protected void onResume(){super.onResume();resumed=true;main.removeCallbacks(statusRefresh);main.post(statusRefresh);}
    @Override protected void onPause(){resumed=false;main.removeCallbacks(statusRefresh);main.removeCallbacks(autoSave);save(true);super.onPause();}
    @Override protected void onDestroy(){main.removeCallbacks(autoSave);save(true);worker.shutdown();super.onDestroy();}
}
