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

public final class HealthSettingsActivity extends Activity {
    private UiKit ui;private AppConfig config;private TextView accountView,preview;
    private Switch multiplyEnabled,planEnabled;private SeekBar multiplier;
    private EditText executions,steps;private Button fromButton,toButton;
    private final CheckBox[] days=new CheckBox[7];
    private final Handler main=new Handler(Looper.getMainLooper());
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private String bound="",planId=UUID.randomUUID().toString().replace("-","");
    private long seed=new Random().nextLong(),generation;private LocalDate date=LocalDate.now();
    private int from=540,to=1080;private boolean loading=true,saving,dirty,planDraftChanged;
    private UiKit.Fold multiplyFold,planFold;
    private final Runnable autoSave=()->save();
    @Override public void onCreate(Bundle state){
        super.onCreate(state);ui=new UiKit(this);config=new AppConfig(this);
        StepPlan old=StepPlan.parse(config.get(ConfigSchema.HEALTH_PLAN));bound=config.get(ConfigSchema.HEALTH_ACCOUNT);
        if(old!=null){planId=old.id;seed=old.seed;date=old.startDate;from=old.fromMinute;to=old.toMinute;}
        LinearLayout page=ui.detailPage("步数修改",ScopeRestartDialog.APPS);
        LinearLayout connection=ui.card();page.addView(connection,ui.margins(0,8,0,12));
        accountView=ui.text("",13,ui.text,true);connection.addView(accountView,ui.margins(0,0,0,10));
        LinearLayout accountActions=new LinearLayout(this);
        Button open=ui.tonalButton("打开健康应用");open.setOnClickListener(v->openHealth());accountActions.addView(open,new LinearLayout.LayoutParams(0,ui.dp(44),1));
        Button bind=ui.tonalButton("绑定当前账户");bind.setOnClickListener(v->{
            String active=config.diagnostic("ls_augment_health_account_runtime");
            if(!active.matches("[0-9a-f]{64}")||!fresh()){toast("先打开小米运动健康，等待账户接入后再绑定");return;}
            if(!bound.equals(active)){planId=UUID.randomUUID().toString().replace("-","");date=LocalDate.now();planDraftChanged=true;}
            bound=active;showAccount();changed();
        });LinearLayout.LayoutParams bp=new LinearLayout.LayoutParams(0,ui.dp(44),1);bp.setMargins(ui.dp(8),0,0,0);accountActions.addView(bind,bp);connection.addView(accountActions);
        LinearLayout multiply=ui.card();page.addView(multiply,ui.margins(0,0,0,12));
        multiplyEnabled=new Switch(this);multiplyEnabled.setChecked(config.getBoolean(ConfigSchema.HEALTH_MULTIPLY_ENABLED));
        multiply.addView(ui.featureRow("真实步数加倍","1 倍为原始步数；随机增加的步数不会再乘倍数。",multiplyEnabled));
        LinearLayout multiplyBody=new LinearLayout(this);multiplyBody.setOrientation(LinearLayout.VERTICAL);multiply.addView(multiplyBody);multiplyFold=ui.fold(multiplyEnabled,multiplyBody);
        TextView rate=ui.text("",12,ui.muted,false);multiplyBody.addView(rate);multiplier=new SeekBar(this);multiplier.setMax(9);multiplier.setProgress(Math.max(0,Math.min(9,config.getInt(ConfigSchema.HEALTH_MULTIPLIER,100)/100-1)));multiplyBody.addView(multiplier);
        rate.setText("倍数："+(multiplier.getProgress()+1));
        multiplier.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}
            public void onProgressChanged(SeekBar s,int n,boolean user){rate.setText("倍数："+(n+1));if(user)changed();}});
        LinearLayout plan=ui.card();page.addView(plan,ui.margins(0,0,0,12));planEnabled=new Switch(this);planEnabled.setChecked(config.getBoolean(ConfigSchema.HEALTH_PLAN_ENABLED));
        plan.addView(ui.featureRow("随机增加步数","在指定时间范围内随机执行，按选中的星期重复。",planEnabled));
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);plan.addView(body);planFold=ui.fold(planEnabled,body);
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
        multiplyEnabled.setOnCheckedChangeListener((b,c)->{if(c&&bound.isEmpty()){multiplyEnabled.setChecked(false);toast("请先绑定账户");return;}changed();});
        planEnabled.setOnCheckedChangeListener((b,c)->{if(c&&bound.isEmpty()){planEnabled.setChecked(false);toast("请先绑定账户");return;}changed();});
        loading=false;showAccount();updatePreview();
    }
    private EditText input(LinearLayout parent,String label,int value){parent.addView(ui.text(label,12,ui.muted,false),ui.margins(0,8,0,4));EditText e=new EditText(this);ui.styleInput(e);e.setSingleLine(true);e.setInputType(InputType.TYPE_CLASS_NUMBER);e.setText(""+value);parent.addView(e);
        e.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int n){}public void onTextChanged(CharSequence s,int a,int b,int c){planChanged();}public void afterTextChanged(Editable e){}});return e;}
    private void pickTime(boolean start){int m=start?from:to%1440;new TimePickerDialog(this,(p,h,min)->{if(start)from=h*60+min;else to=h*60+min;planChanged();},m/60,m%60,true).show();}
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
    private void changed(){if(loading)return;multiplyFold.sync();planFold.sync();updatePreview();dirty=true;generation++;main.removeCallbacks(autoSave);main.postDelayed(autoSave,600);}
    private void save(){if(saving||!dirty)return;LinkedHashMap<String,String> updates=new LinkedHashMap<>();
        boolean enabled=multiplyEnabled.isChecked()||planEnabled.isChecked();if(enabled&&bound.isEmpty())return;
        String plan=config.get(ConfigSchema.HEALTH_PLAN);if(!bound.isEmpty()&&(planDraftChanged||(plan.isEmpty()&&planEnabled.isChecked())))try{plan=draft().serialize();}catch(Exception e){if(planEnabled.isChecked())return;}
        updates.put(ConfigSchema.HEALTH_ENABLED,enabled?"1":"0");updates.put(ConfigSchema.HEALTH_MULTIPLY_ENABLED,multiplyEnabled.isChecked()?"1":"0");updates.put(ConfigSchema.HEALTH_PLAN_ENABLED,planEnabled.isChecked()?"1":"0");
        updates.put(ConfigSchema.HEALTH_BACKGROUND,"1");updates.put(ConfigSchema.HEALTH_MULTIPLIER,""+((multiplier.getProgress()+1)*100));updates.put(ConfigSchema.HEALTH_ACCOUNT,bound);updates.put(ConfigSchema.HEALTH_PLAN,plan);
        if(multiplyEnabled.isChecked()&&(!config.getBoolean(ConfigSchema.HEALTH_MULTIPLY_ENABLED)||!bound.equals(config.get(ConfigSchema.HEALTH_ACCOUNT))))updates.put(ConfigSchema.HEALTH_SINCE,""+(System.currentTimeMillis()/1000));
        long current=generation;saving=true;worker.execute(()->{AppConfig.SaveResult result=config.save(updates);main.post(()->{saving=false;if(result.success){dirty=generation!=current;if(dirty&&!isDestroyed())main.post(autoSave);}else toast(result.message);});});}
    private boolean fresh(){try{long age=System.currentTimeMillis()-Long.parseLong(config.diagnostic("ls_augment_health_heartbeat"));return age>=0&&age<90000;}catch(Exception e){return false;}}
    private void showAccount(){accountView.setText(bound.isEmpty()?"尚未绑定账户":"已绑定本机账户 · "+bound.substring(0,8));}
    private void openHealth(){Intent i=getPackageManager().getLaunchIntentForPackage("com.mi.health");if(i==null)toast("未找到小米运动健康");else startActivity(i);}
    private void toast(String text){Toast.makeText(this,text,Toast.LENGTH_LONG).show();}
    @Override protected void onPause(){main.removeCallbacks(autoSave);save();super.onPause();}
    @Override protected void onDestroy(){main.removeCallbacks(autoSave);worker.shutdown();super.onDestroy();}
}
