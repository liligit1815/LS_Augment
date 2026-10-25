package ls.augment.com;

import android.app.*;
import android.content.Intent;
import android.os.*;
import android.text.*;
import android.view.*;
import android.content.res.ColorStateList;
import android.widget.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.*;

final class HealthEditorController extends NativeEditorController {
    HealthEditorController(Activity owner,String route,boolean embedded){super(owner,route,embedded);}
    private UiKit ui;private AppConfig config;private TextView accountView,accountHint,accountAction,preview,rate,planSummary;
    private Switch multiplyEnabled,planEnabled,dailyLimitEnabled;private SeekBar multiplier;
    private EditText executions,steps,dailyLimitSteps;private Button fromButton,toButton;
    private final CheckBox[] days=new CheckBox[7];
    private final Handler main=new Handler(Looper.getMainLooper());
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private String bound="",planId=UUID.randomUUID().toString().replace("-","");
    private long seed=new Random().nextLong(),generation,queuedGeneration=-1;private LocalDate date=LocalDate.now();
    private int from=540,to=1080,pendingSaves;private boolean loading=true,dirty,planDraftChanged,resumed,invalidDraft;
    private final Map<String,String> queuedValues=new LinkedHashMap<>();
    private View planDetails;private LinearLayout planBody;
    private UiKit.Fold multiplyFold,planFold,limitFold;
    private boolean revertingToggle,awaitingBinding,bindingDialogVisible;private long bindingRequestedAt;
    private final Runnable autoSave=()->save();
    private final Runnable statusRefresh=new Runnable(){public void run(){if(!resumed)return;showAccount();checkPendingBinding();main.postDelayed(this,2000);}};
    @Override public void onCreate(Bundle state){
        super.onCreate(state);ui=editorUi();config=new AppConfig(this);
        StepPlan old=StepPlan.parse(config.get(ConfigSchema.HEALTH_PLAN));bound=config.get(ConfigSchema.HEALTH_ACCOUNT);
        if(old!=null){planId=old.id;seed=old.seed;date=old.startDate;from=old.fromMinute;to=old.toMinute;}
        LinearLayout page=ui.detailPage("小米运动健康",ScopeRestartDialog.APPS);
        ui.addDetailSectionTitle(page,"账号绑定");
        LinearLayout connection=ui.preferenceCard();page.addView(connection,ui.margins(0,0,0,9));
        accountView=ui.text("",12,ui.muted,false);accountView.setTag("health-account");
        LinearLayout accountRow=navigationRow("小米账号","people",accountView,this::requestBinding);
        accountAction=ui.text("",12,ui.muted,false);accountRow.addView(accountAction,accountRow.getChildCount()-1,new LinearLayout.LayoutParams(-2,-2));
        connection.addView(accountRow,ui.wrap());divider(connection);
        connection.addView(navigationRow("打开运动健康","heart",null,this::openHealth),ui.wrap());
        accountHint=ui.text("",12,ui.muted,false);page.addView(accountHint,ui.margins(3,0,3,8));

        ui.addDetailSectionTitle(page,"步数设置");
        LinearLayout settings=ui.preferenceCard();page.addView(settings,ui.margins(0,0,0,9));
        multiplyEnabled=new Switch(this);multiplyEnabled.setChecked(config.getBoolean(ConfigSchema.HEALTH_MULTIPLY_ENABLED));
        LinearLayout multiply=column(),multiplyBody=editorBody();
        LinearLayout multiplyHeader=featureRow("修改步数倍率","新记录的真实步数按 1–10 倍计入，1 倍保持原值。随机增加的步数不会再次乘倍数。","settings",multiplyEnabled);
        multiply.addView(multiplyHeader,ui.wrap());multiply.addView(multiplyBody,ui.wrap());settings.addView(multiply,ui.wrap());
        multiplyFold=featureFold(multiplyEnabled,multiplyHeader,multiplyBody);
        rate=ui.text("",12,ui.muted,false);rate.setContentDescription("当前步数倍率");multiplyBody.addView(rate,ui.margins(0,2,0,0));
        multiplier=ui.slider();multiplier.setContentDescription("步数倍率，1 至 10 倍");multiplier.setMax(9);
        multiplier.setProgress(Math.max(0,Math.min(9,config.getInt(ConfigSchema.HEALTH_MULTIPLIER,100)/100-1)));
        multiplyBody.addView(multiplier,ui.margins(0,6,0,0));
        Runnable showRate=()->rate.setText(rate.getContext().getString(R.string.status_healtheditorcontroller_19 ,String.valueOf((multiplier.getProgress()+1))));showRate.run();
        multiplier.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}
            public void onProgressChanged(SeekBar s,int n,boolean user){showRate.run();if(user)changed();}});

        divider(settings);
        planEnabled=new Switch(this);planEnabled.setChecked(config.getBoolean(ConfigSchema.HEALTH_PLAN_ENABLED));
        LinearLayout plan=column(),body=editorBody();planBody=body;
        LinearLayout planHeader=featureRow("随机增加步数","在指定时间段内随机执行，按所选星期重复。当天已生成的时间表保持不变，修改从下一执行日应用。","heart",planEnabled);
        plan.addView(planHeader,ui.wrap());plan.addView(body,ui.wrap());settings.addView(plan,ui.wrap());
        planFold=featureFold(planEnabled,planHeader,body);planDetails=planHeader;
        planSummary=ui.text("",12,ui.muted,false);body.addView(planSummary,ui.margins(0,2,0,6));
        body.addView(ui.featureTitle("执行时间","每次执行须落在不同分钟。结束时间早于开始时间时按跨午夜处理，执行星期归开始当天；开始和结束不能相同。"),ui.wrap());
        LinearLayout times=row();fromButton=ui.tonalButton("");toButton=ui.tonalButton("");
        fromButton.setOnClickListener(v->pickTime(true));toButton.setOnClickListener(v->pickTime(false));times.addView(fromButton,new LinearLayout.LayoutParams(0,ui.dp(44),1));
        LinearLayout.LayoutParams tp=new LinearLayout.LayoutParams(0,ui.dp(44),1);tp.leftMargin=ui.dp(8);times.addView(toButton,tp);body.addView(times,ui.margins(0,0,0,6));
        LinearLayout numbers=row(),countColumn=column(),stepsColumn=column();numbers.setBaselineAligned(false);numbers.addView(countColumn,new LinearLayout.LayoutParams(0,-2,1));LinearLayout.LayoutParams np=new LinearLayout.LayoutParams(0,-2,1);np.leftMargin=ui.dp(10);numbers.addView(stepsColumn,np);body.addView(numbers);
        executions=input(countColumn,"随机执行次数",old==null?10:old.executions>0?old.executions:1);
        steps=input(stepsColumn,"每次增加步数",old==null?200:old.executions>0?old.stepsPerExecution:old.amount);
        body.addView(ui.featureTitle("重复星期","选择至少一天。跨午夜的时间范围归开始当天。"),ui.margins(0,6,0,0));
        String[] labels={"一","二","三","四","五","六","日"};
        for(int r=0;r<2;r++){
            LinearLayout week=row();
            for(int i=r*4;i<Math.min(7,r*4+4);i++){
                CheckBox box=new CheckBox(this);box.setText(box.getContext().getString(R.string.status_healtheditorcontroller_20 ,String.valueOf(labels[i])));box.setContentDescription("星期"+labels[i]);box.setTextSize(UiKit.compactTextSize(14));ui.styleCheckBox(box);box.setChecked(((old==null?31:old.weekdays)&(1<<i))!=0);days[i]=box;
                week.addView(box,new LinearLayout.LayoutParams(0,ui.dp(48),1));box.setOnCheckedChangeListener((b,c)->planChanged());
            }
            if(r==1)week.addView(new View(this),new LinearLayout.LayoutParams(0,ui.dp(48),1));body.addView(week,ui.wrap());
        }
        preview=ui.text("",12,ui.muted,false);body.addView(preview,ui.margins(0,4,0,0));

        divider(settings);
        dailyLimitEnabled=new Switch(this);dailyLimitEnabled.setChecked(config.getBoolean(ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED));
        LinearLayout limit=column(),limitBody=editorBody();
        LinearLayout limitHeader=featureRow("当日步数上限","达到上限后停止倍率和计划带来的额外增步。真实步行继续记录，已有步数保留；提高或关闭上限不会补发先前受限的计划步数。","shield",dailyLimitEnabled);
        limit.addView(limitHeader,ui.wrap());limit.addView(limitBody,ui.wrap());settings.addView(limit,ui.wrap());limitFold=featureFold(dailyLimitEnabled,limitHeader,limitBody);
        dailyLimitSteps=input(limitBody,"上限步数",config.getInt(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,10000),this::changed);
        limitBody.addView(ui.text("可设置 1–1000000 步",12,ui.muted,false),ui.margins(0,6,0,0));

        installGate(multiplyEnabled);installGate(planEnabled);installGate(dailyLimitEnabled);
        if(state!=null){awaitingBinding=state.getBoolean("healthAwaitingBinding");bindingRequestedAt=state.getLong("healthBindingRequestedAt");showPlan(state.getBoolean("healthPlanExpanded"));}
        loading=false;showAccount();updatePreview();ui.restoreState(state);
    }
    private LinearLayout row(){return ui.groupRow();}
    private LinearLayout column(){LinearLayout column=new LinearLayout(this);column.setOrientation(LinearLayout.VERTICAL);return column;}
    private LinearLayout editorBody(){LinearLayout body=column();body.setPadding(ui.dp(12),0,ui.dp(6),ui.dp(12));return body;}
    private void divider(LinearLayout card){card.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));}
    private ImageView icon(String glyph,int size,boolean tile){
        ImageView icon=new ImageView(this);icon.setImageDrawable(new GlassIcon(glyph,ui.accent));icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        if(tile){icon.setPadding(ui.dp(8),ui.dp(8),ui.dp(8),ui.dp(8));icon.setBackground(ui.round(ui.accentContainer,12));}
        icon.setLayoutParams(new LinearLayout.LayoutParams(ui.dp(size),ui.dp(size)));return icon;
    }
    private LinearLayout navigationRow(String title,String glyph,TextView summary,Runnable action){
        LinearLayout row=ui.groupRow();row.setPadding(0,ui.dp(4),0,ui.dp(4));row.addView(icon(glyph,28,false));
        LinearLayout copy=column();copy.addView(ui.text(title,15,ui.text,true));if(summary!=null)copy.addView(summary,ui.margins(0,4,0,0));
        LinearLayout.LayoutParams cp=new LinearLayout.LayoutParams(0,-2,1);cp.leftMargin=ui.dp(12);cp.rightMargin=ui.dp(6);row.addView(copy,cp);
        ImageView arrow=new ImageView(this);arrow.setImageDrawable(new GlassIcon("arrow",ui.muted));arrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);row.addView(arrow,new LinearLayout.LayoutParams(ui.dp(15),ui.dp(15)));
        row.setForeground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT,22)));row.setFocusable(true);row.setOnClickListener(v->action.run());return row;
    }
    private LinearLayout featureRow(String title,String help,String glyph,Switch toggle){
        LinearLayout row=ui.featureRow(title,help,toggle);row.setMinimumHeight(ui.dp(48));
        ImageView icon=icon(glyph,38,true);LinearLayout.LayoutParams p=(LinearLayout.LayoutParams)icon.getLayoutParams();p.rightMargin=ui.dp(12);row.addView(icon,0,p);return row;
    }
    private UiKit.Fold featureFold(Switch toggle,LinearLayout header,LinearLayout body){
        UiKit.Fold fold=ui.fold(toggle,body);
        header.setForeground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT,22)));header.setFocusable(true);header.setOnClickListener(v->fold.show(body.getVisibility()!=View.VISIBLE));return fold;
    }
    private void showPlan(boolean show){planFold.show(show);}
    private EditText input(LinearLayout parent,String label,int value){return input(parent,label,value,this::planChanged);}
    private EditText input(LinearLayout parent,String label,int value,Runnable onChange){parent.addView(ui.text(label,13,ui.muted,false),ui.margins(0,8,0,6));EditText e=new EditText(this);ui.styleInput(e);e.setSingleLine(true);e.setSelectAllOnFocus(true);e.setInputType(InputType.TYPE_CLASS_NUMBER);e.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_DONE);e.setContentDescription(label);e.setText(String.valueOf(value));parent.addView(e,new LinearLayout.LayoutParams(-1,ui.dp(48)));
        e.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int n){}public void onTextChanged(CharSequence s,int a,int b,int c){onChange.run();}public void afterTextChanged(Editable e){}});return e;}
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
    private void updatePreview(){fromButton.setText(fromButton.getContext().getString(R.string.status_healtheditorcontroller_21 ,String.valueOf(time(from))));toButton.setText(toButton.getContext().getString(to<=from?R.string.plan_end_next_day:R.string.plan_end_today,time(to)));
        int mask=0;for(int i=0;i<7;i++)if(days[i].isChecked())mask|=1<<i;
        String repeat=mask==127?"每天":mask==31?"工作日":mask==96?"周末":"每周 "+Integer.bitCount(mask)+" 天";
        try{long total=Math.multiplyExact(Long.parseLong(executions.getText().toString()),Long.parseLong(steps.getText().toString()));planSummary.setText(planSummary.getContext().getString(R.string.status_healtheditorcontroller_22 ,String.valueOf(time(from)), String.valueOf((to<=from?"次日 ":"")), String.valueOf(time(to)), String.valueOf(repeat), String.valueOf(total)));}
        catch(Exception ignored){planSummary.setText("请完善执行次数和每次步数");}
        StepPlan existing=StepPlan.parse(config.get(ConfigSchema.HEALTH_PLAN));
        if(!planDraftChanged&&existing!=null&&existing.executions==0){planSummary.setText(planSummary.getContext().getString(R.string.status_healtheditorcontroller_23 ,String.valueOf(existing.startDate), String.valueOf(existing.amount)));preview.setText(preview.getContext().getString(R.string.status_healtheditorcontroller_24));return;}
        try{StepPlan p=draft();LocalDate day=LocalDate.now();if(day.isBefore(p.startDate))day=p.startDate;for(int i=0;i<7&&!p.runsOn(day);i++)day=day.plusDays(1);
            StringBuilder text=new StringBuilder("时间示例 · "+day+"\n");int n=0;
            for(Map.Entry<Long,Integer> e:p.timetable(day).entrySet()){if(n++>=3){text.append("… 共 ").append(p.executions).append(" 次");break;}text.append(Instant.ofEpochSecond(e.getKey()).atZone(ZoneId.of(p.zone)).format(DateTimeFormatter.ofPattern("MM/dd HH:mm"))).append(" +").append(e.getValue()).append(" 步\n");}preview.setText(text.toString().trim());
        }catch(Exception e){preview.setText(bound.isEmpty()?"绑定账户后可预览计划。":"请设置有效次数、步数、时间范围，并至少选择一天。每次须落在不同分钟，每日合计不超过 1000000 步。");}}
    private void planChanged(){if(loading)return;planDraftChanged=true;changed();}
    private void changed(){if(loading)return;updatePreview();dirty=true;generation++;main.removeCallbacks(autoSave);main.postDelayed(autoSave,600);}
    private void save(){save(false);}
    private void save(boolean flushPending){
        if(!dirty||worker.isShutdown()||(!flushPending&&pendingSaves>0)
                ||(pendingSaves>0&&queuedGeneration==generation))return;
        LinkedHashMap<String,String> updates=new LinkedHashMap<>();
        invalidDraft=false;
        appendDailyLimitUpdates(updates);
        appendHealthUpdates(updates);
        if(updates.isEmpty())return;
        // Freeze the valid UI values now; the serial queue survives Activity destruction.
        Map<String,String> frozen=Collections.unmodifiableMap(new LinkedHashMap<>(updates));
        long current=generation;boolean partial=invalidDraft;queuedGeneration=current;queuedValues.putAll(frozen);pendingSaves++;
        worker.execute(()->{AppConfig.SaveResult result=config.save(frozen);main.post(()->{
            pendingSaves--;if(pendingSaves==0)queuedValues.clear();
            if(result.success){dirty=generation!=current;if(!isDestroyed()&&!dirty&&partial)toast("部分输入无效，请修正后保存");if(dirty&&pendingSaves==0&&!isDestroyed())main.post(autoSave);}
            else{toast(result.message);}
        });});
    }
    private String queuedOrSaved(String key){return queuedValues.containsKey(key)?queuedValues.get(key):config.get(key);}
    private void appendDailyLimitUpdates(Map<String,String> updates){
        String value=ConfigSchema.normalize(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,dailyLimitSteps.getText().toString());
        boolean enabled=dailyLimitEnabled.isChecked();
        if(enabled&&!ConfigSchema.truthy(queuedOrSaved(ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED))&&!canEnable()){
            revert(dailyLimitEnabled);enabled=false;showBindingRequired();
        }
        if(value==null)invalidDraft=true;
        dailyLimitSteps.setError(value==null&&enabled?"请输入 1–1000000 的整数；此项未保存，仍使用原上限设置。":null);
        // An unfinished limit draft must not block switching it off or saving other settings.
        if(value!=null){updates.put(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,value);updates.put(ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED,enabled?"1":"0");}
        else if(!enabled)updates.put(ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED,"0");
    }
    private void appendHealthUpdates(Map<String,String> updates){
        for(Switch toggle:new Switch[]{multiplyEnabled,planEnabled}){
            String key=toggle==multiplyEnabled?ConfigSchema.HEALTH_MULTIPLY_ENABLED:ConfigSchema.HEALTH_PLAN_ENABLED;
            if(toggle.isChecked()&&!ConfigSchema.truthy(queuedOrSaved(key))&&!canEnable()){revert(toggle);showBindingRequired();}
        }
        boolean enabled=multiplyEnabled.isChecked()||planEnabled.isChecked();if(enabled&&bound.isEmpty())return;
        String plan=queuedOrSaved(ConfigSchema.HEALTH_PLAN);if(!bound.isEmpty()&&(planDraftChanged||(plan.isEmpty()&&planEnabled.isChecked())))try{plan=draft().serialize();}catch(Exception e){invalidDraft=true;}
        updates.put(ConfigSchema.HEALTH_ENABLED,enabled?"1":"0");updates.put(ConfigSchema.HEALTH_MULTIPLY_ENABLED,multiplyEnabled.isChecked()?"1":"0");updates.put(ConfigSchema.HEALTH_PLAN_ENABLED,planEnabled.isChecked()?"1":"0");
        updates.put(ConfigSchema.HEALTH_BACKGROUND,"1");updates.put(ConfigSchema.HEALTH_MULTIPLIER,""+((multiplier.getProgress()+1)*100));updates.put(ConfigSchema.HEALTH_ACCOUNT,bound);updates.put(ConfigSchema.HEALTH_PLAN,plan);
        if(multiplyEnabled.isChecked()&&(!ConfigSchema.truthy(queuedOrSaved(ConfigSchema.HEALTH_MULTIPLY_ENABLED))||!bound.equals(queuedOrSaved(ConfigSchema.HEALTH_ACCOUNT))))updates.put(ConfigSchema.HEALTH_SINCE,""+(System.currentTimeMillis()/1000));
    }
    private HealthAccountState activeAccount(){return HealthAccountState.parse(config.diagnostic(HealthAccountState.RUNTIME));}
    private boolean canEnable(){return HealthAccountState.canEnable(bound,activeAccount(),System.currentTimeMillis());}
    private void rememberAccount(HealthAccountState account){
        if(account==null||!account.matches(bound))return;
        String value=HealthAccountState.encode(account.binding,account.account,account.observedAt);
        HealthAccountState previous=HealthAccountState.parse(config.diagnostic(HealthAccountState.BINDING));
        if(previous==null||!previous.matches(bound)||!previous.account.equals(account.account))
            getSharedPreferences(AppConfig.DIAGNOSTICS,MODE_PRIVATE).edit().putString(HealthAccountState.BINDING,value).apply();
    }
    private void showAccount(){
        HealthAccountState active=activeAccount();boolean fresh=active!=null&&active.fresh(System.currentTimeMillis());
        if(fresh&&active.matches(bound))rememberAccount(active);
        HealthAccountState display=HealthAccountState.parse(config.diagnostic(HealthAccountState.BINDING));
        accountView.setText(bound.isEmpty()?"尚未绑定本机账户":display!=null&&display.matches(bound)?"已绑定本机账户："+display.account:"已绑定本机账户：待读取小米账号");
        boolean ready=HealthAccountState.canEnable(bound,active,System.currentTimeMillis());
        accountHint.setVisibility(ready?View.GONE:View.VISIBLE);
        accountHint.setText(ready?"仅对这个小米账号生效，切换账号后需重新绑定。":fresh&&!active.signedIn()?"请先在小米运动健康登录小米账号。":fresh&&!bound.isEmpty()&&!active.matches(bound)?"检测到账号已切换，请重新绑定后再开启功能。":bound.isEmpty()?"开启功能前，请先绑定小米运动健康中的账号。":"打开运动健康核验账号后，可开启新的功能。");
        accountAction.setText(ready?"已绑定":bound.isEmpty()?"去绑定":"待核验");
    }
    private void installGate(Switch toggle){toggle.setOnCheckedChangeListener((button,on)->{
        if(loading||revertingToggle)return;
        if(on&&!canEnable()){revert(toggle);showBindingRequired();return;}
        if(on&&toggle==planEnabled){try{StepPlan existing=StepPlan.parse(queuedOrSaved(ConfigSchema.HEALTH_PLAN));if(planDraftChanged||existing==null||!bound.equals(existing.account))draft();}catch(Exception invalid){restorePlanInputs();toast("无效的计划参数已恢复为上次有效设置");}}
        if(on&&toggle==dailyLimitEnabled&&ConfigSchema.normalize(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,dailyLimitSteps.getText().toString())==null){
            loading=true;try{dailyLimitSteps.setText(queuedOrSaved(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS));dailyLimitSteps.setError(null);}finally{loading=false;}toast("无效的上限已恢复为上次有效设置");
        }
        multiplyFold.sync();planFold.sync();limitFold.sync();changed();
    });}
    private void restorePlanInputs(){
        // Closed features cannot expose their editor, so an unfinished draft must
        // not prevent the next enable from opening it with valid parameters.
        StepPlan saved=StepPlan.parse(queuedOrSaved(ConfigSchema.HEALTH_PLAN));
        loading=true;try{
            from=saved==null?540:saved.fromMinute;to=saved==null?1080:saved.toMinute;
            executions.setText(String.valueOf((saved==null?10:saved.executions>0?saved.executions:1)));
            steps.setText(String.valueOf((saved==null?200:saved.executions>0?saved.stepsPerExecution:saved.amount)));
            for(int i=0;i<7;i++)days[i].setChecked(((saved==null?31:saved.weekdays)&(1<<i))!=0);
        }finally{loading=false;}
    }
    private void revert(Switch toggle){revertingToggle=true;try{toggle.setChecked(false);}finally{revertingToggle=false;}multiplyFold.sync();planFold.sync();limitFold.sync();}
    private void showBindingRequired(){
        if(isDestroyed()||!resumed||bindingDialogVisible)return;
        HealthAccountState active=activeAccount();String message=bound.isEmpty()?"请先绑定小米运动健康账号，再开启此功能。":active!=null&&active.fresh(System.currentTimeMillis())&&!active.matches(bound)?"小米运动健康当前账号与绑定账号不一致，请先重新绑定。":"请先打开小米运动健康核验当前账号，再开启此功能。";
        bindingDialogVisible=true;Dialog dialog=ui.glassDialog("需要绑定账号",ui.text(message,15,ui.text,false),"去绑定",()->{bindingDialogVisible=false;requestBinding();},"取消");dialog.setOnDismissListener(d->{bindingDialogVisible=false;});
    }
    private void requestBinding(){
        HealthAccountState active=activeAccount();
        if(active==null||!active.fresh(System.currentTimeMillis())||!active.signedIn()){
            awaitingBinding=true;bindingRequestedAt=System.currentTimeMillis();toast("请在小米运动健康登录账号，然后返回此页完成绑定");openHealth();return;
        }
        awaitingBinding=false;confirmBinding(active);
    }
    private void checkPendingBinding(){
        if(!awaitingBinding||bindingDialogVisible)return;
        HealthAccountState active=activeAccount();if(active!=null&&active.signedIn()&&active.fresh(System.currentTimeMillis())&&active.observedAt>=bindingRequestedAt){awaitingBinding=false;confirmBinding(active);}
    }
    private void confirmBinding(HealthAccountState observed){
        if(bindingDialogVisible||isDestroyed())return;
        bindingDialogVisible=true;boolean same=observed.matches(bound);
        Dialog dialog=ui.glassDialog(same?"本机绑定账号":"绑定小米账号",ui.text("小米账号："+observed.account+"\n\n"+(same?"当前账号与绑定账号一致。":"绑定后，请手动开启需要的功能。切换绑定将关闭原有功能开关。"),15,ui.text,false),same?"完成":"确认绑定",()->{
            HealthAccountState current=activeAccount();if(current==null||!current.fresh(System.currentTimeMillis())||!current.binding.equals(observed.binding)){toast("账号状态已变化，请重新核验");return;}
            if(!observed.matches(bound)){revert(multiplyEnabled);revert(planEnabled);revert(dailyLimitEnabled);planId=UUID.randomUUID().toString().replace("-","");date=LocalDate.now();planDraftChanged=true;bound=observed.binding;changed();}
            rememberAccount(current);showAccount();
        },same?null:"取消");dialog.setOnDismissListener(d->{bindingDialogVisible=false;});
    }
    private void openHealth(){Intent i=getPackageManager().getLaunchIntentForPackage("com.mi.health");if(i==null){awaitingBinding=false;toast("未找到小米运动健康");}else {
        // Account discovery is requested only by this explicit action. A later reset
        // replaces the snapshot checksum, so an old launch cannot revive a probe.
        save(true);worker.execute(()->main.post(()->{
            if(isDestroyed()||isFinishing())return;
            i.putExtra(HealthIdentityProbe.EXTRA,HealthIdentityProbe.create(config.configSnapshot(),android.os.Process.myUid()/100000,System.currentTimeMillis()));
            try{startActivity(i);}catch(android.content.ActivityNotFoundException|SecurityException error){awaitingBinding=false;toast("无法打开小米运动健康，请确认应用未被停用");}
        }));
    }}
    private void toast(String text){Toast.makeText(this,text,Toast.LENGTH_LONG).show();}
    @Override protected void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);ui.saveState(state);state.putBoolean("healthPlanExpanded",planBody.getVisibility()==View.VISIBLE);state.putBoolean("healthAwaitingBinding",awaitingBinding);state.putLong("healthBindingRequestedAt",bindingRequestedAt);}
    @Override protected void onResume(){super.onResume();resumed=true;main.removeCallbacks(statusRefresh);main.post(statusRefresh);}
    @Override protected void onPause(){resumed=false;main.removeCallbacks(statusRefresh);main.removeCallbacks(autoSave);save(true);super.onPause();}
    @Override protected void onDestroy(){resumed=false;main.removeCallbacks(statusRefresh);main.removeCallbacks(autoSave);save(true);worker.shutdown();super.onDestroy();}
}
