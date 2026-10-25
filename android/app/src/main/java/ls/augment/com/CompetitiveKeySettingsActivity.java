package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Native third-level editor using the same navigation, cards and controls as module settings. */
public final class CompetitiveKeySettingsActivity extends Activity {
    private static final class Session {
        final ExecutorService worker=Executors.newSingleThreadExecutor();
        final LinkedHashMap<String,String> draft=new LinkedHashMap<>(),pending=new LinkedHashMap<>();
        final Map<String,String> rawShell=new LinkedHashMap<>();
        String failure="";boolean gateBusy;Boolean expanded;
        java.lang.ref.WeakReference<CompetitiveKeySettingsActivity> owner;
    }
    private Session session;private AppConfig config;private UiKit ui;
    private LinearLayout parameters;private Switch enabled;private UiKit.Fold fold;private TextView status;
    private boolean rendering;private SharedPreferences diagnostics;private Dialog appDialog,unsavedDialog;
    private final android.window.OnBackInvokedCallback backCallback=this::handleBack;
    private boolean backCallbackRegistered;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Runnable save=this::flush;
    private final SharedPreferences.OnSharedPreferenceChangeListener diagnosticListener=(prefs,key)->main.post(this::refreshStatus);

    @Override public void onCreate(Bundle state){
        super.onCreate(state);config=new AppConfig(this);ui=new UiKit(this);ui.setBackAction(this::handleBack);
        Object retained=getLastNonConfigurationInstance();session=retained instanceof Session?(Session)retained:new Session();
        session.owner=new java.lang.ref.WeakReference<>(this);
        if(session.draft.isEmpty())for(EnhancementOption option:CompetitiveKeyOptions.options())session.draft.put(option.key,config.get(option.key));
        if(state!=null){Bundle draft=state.getBundle("draft");if(draft!=null)for(String key:draft.keySet())session.draft.put(key,draft.getString(key));
            Bundle raw=state.getBundle("raw");if(raw!=null)for(String key:raw.keySet())session.rawShell.put(key,raw.getString(key));
            session.expanded=state.getBoolean("expanded",false);}
        LinearLayout body=ui.detailPage("自定义竞技键","system");
        ui.addDetailSectionTitle(body,"竞技键操作");
        LinearLayout card=ui.preferenceCard();body.addView(card,ui.wrap());
        enabled=new Switch(this);enabled.setTag("config:"+CompetitiveKeyOptions.ENABLED);
        enabled.setChecked(on());enabled.setEnabled(!session.gateBusy);
        card.addView(ui.featureRow("自定义竞技键","启用时自动将原厂竞技键操作设为空；上推、下拉分别配置，关闭后恢复原厂设置。自定义命令通过手机已有的 Root 授权执行。",enabled),ui.wrap());
        status=ui.text("",12,ui.muted,false);status.setTag("competitive-key-runtime");status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        card.addView(status,ui.margins(0,4,0,8));
        parameters=column();parameters.setTag("competitive-key-parameters");body.addView(parameters,ui.margins(0,8,0,0));
        fold=ui.fold(enabled,parameters);fold.show(session.expanded!=null&&session.expanded);
        renderParameters();enabled.setOnCheckedChangeListener((control,checked)->toggle(checked));refreshStatus();
        if(!backCallbackRegistered){getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT,backCallback);backCallbackRegistered=true;}
    }
    private boolean on(){return "1".equals(session.draft.get(CompetitiveKeyOptions.ENABLED));}
    private LinearLayout column(){LinearLayout value=new LinearLayout(this);value.setOrientation(LinearLayout.VERTICAL);return value;}
    private String value(String key){String value=session.draft.get(key);return value==null?"":value;}
    private void change(String key,String next){if(next.equals(value(key)))return;session.draft.put(key,next);session.pending.put(key,next);main.removeCallbacks(save);main.postDelayed(save,400);}
    private void toggle(boolean checked){
        if(rendering)return;
        if(checked&&!ready()){
            rendering=true;enabled.setChecked(on());rendering=false;
            Toast.makeText(this,"竞技键接管尚未就绪，请确认模块已作用于系统框架并重启手机",Toast.LENGTH_LONG).show();refreshStatus();return;
        }
        flush();session.gateBusy=true;enabled.setEnabled(false);fold.sync();
        session.worker.execute(()->{
            AppConfig.SaveResult result=CompetitiveKeyControl.setEnabled(getApplicationContext(),checked);
            main.post(()->{
                session.gateBusy=false;
                CompetitiveKeySettingsActivity page=session.owner.get();
                if(page==null||page.isDestroyed()){if(!result.success)session.failure=result.message;return;}
                session.draft.put(CompetitiveKeyOptions.ENABLED,page.config.get(CompetitiveKeyOptions.ENABLED));
                page.rendering=true;page.enabled.setChecked(page.on());page.enabled.setEnabled(true);page.rendering=false;page.fold.sync();
                if(!result.success||!checked)Toast.makeText(page,result.message,Toast.LENGTH_LONG).show();
                page.refreshStatus();
            });
        });
    }
    private void renderParameters(){
        rendering=true;parameters.removeAllViews();
        LinearLayout category=ui.preferenceCard();parameters.addView(category,ui.wrap());
        category.addView(ui.featureTitle("类别","先选择用途，再分别设置上推动作和下拉动作。"),ui.wrap());
        Spinner type=spinner("类别",CompetitiveKeyOptions.CATEGORY,CompetitiveKeyOptions.CATEGORIES,
                CompetitiveKeyPolicy.integer(value(CompetitiveKeyOptions.CATEGORY),0));category.addView(type,ui.wrap());
        type.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> v){}
            public void onItemSelected(AdapterView<?> p,View v,int position,long id){if(rendering||position==CompetitiveKeyPolicy.integer(value(CompetitiveKeyOptions.CATEGORY),0))return;
                change(CompetitiveKeyOptions.CATEGORY,String.valueOf(position));
                change(CompetitiveKeyOptions.UP_ACTION,String.valueOf(CompetitiveKeyPolicy.defaultAction(position,true)));
                change(CompetitiveKeyOptions.DOWN_ACTION,String.valueOf(CompetitiveKeyPolicy.defaultAction(position,false)));
                renderParameters();}});
        int kind=CompetitiveKeyPolicy.integer(value(CompetitiveKeyOptions.CATEGORY),0);
        if(kind==0){
            LinearLayout app=ui.preferenceCard();parameters.addView(app,ui.margins(0,8,0,0));
            app.addView(ui.featureTitle("指定app","两个方向共用此应用；“关闭指定app”会停止选定应用。"),ui.wrap());
            Button choose=ui.tonalButton(value(CompetitiveKeyOptions.APP_PACKAGE).isEmpty()?"选择应用":appLabel(value(CompetitiveKeyOptions.APP_PACKAGE)));
            choose.setTag("competitive-key-app-picker");choose.setMinHeight(ui.dp(48));choose.setOnClickListener(v->chooseApp());app.addView(choose,ui.margins(0,0,0,8));
            if(!value(CompetitiveKeyOptions.APP_PACKAGE).isEmpty())app.addView(ui.text(value(CompetitiveKeyOptions.APP_PACKAGE),12,ui.muted,false),ui.margins(0,0,0,8));
        }
        direction(kind,true);direction(kind,false);rendering=false;
    }
    private Spinner spinner(String title,String key,String[] labels,int selection){
        Spinner spinner=ui.choiceSpinner(title);spinner.setContentDescription(title);spinner.setTag("config:"+key);
        spinner.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,labels));spinner.setSelection(Math.max(0,Math.min(labels.length-1,selection)));return spinner;
    }
    private void direction(int category,boolean up){
        String title=up?"上推":"下拉",key=up?CompetitiveKeyOptions.UP_ACTION:CompetitiveKeyOptions.DOWN_ACTION;
        LinearLayout card=ui.preferenceCard();parameters.addView(card,ui.margins(0,8,0,0));
        card.addView(ui.featureTitle(title+"动作",null),ui.margins(0,8,0,8));
        int[] choices=CompetitiveKeyPolicy.actions(category);
        String[] names=new String[choices.length];int selected=0,action=CompetitiveKeyPolicy.action(this::value,up);
        for(int i=0;i<choices.length;i++){names[i]=CompetitiveKeyPolicy.actionName(choices[i]);if(choices[i]==action)selected=i;}
        Spinner actionChoice=spinner(title+"动作",key,names,selected);card.addView(actionChoice,ui.wrap());
        LinearLayout shell=column();card.addView(shell,ui.margins(0,0,0,8));
        if(category==3){
            String shellKey=up?CompetitiveKeyOptions.UP_SHELL:CompetitiveKeyOptions.DOWN_SHELL;
            shell.addView(ui.text(title+"命令",12,ui.muted,false),ui.margins(0,8,0,4));
            EditText input=new EditText(this);input.setTag("config:"+shellKey);input.setContentDescription(title+"命令");
            input.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE|android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            ui.styleInput(input);input.setGravity(android.view.Gravity.TOP);input.setMinLines(4);input.setMaxLines(8);
            String decoded=CompetitiveKeyPolicy.decodeShell(value(shellKey));input.setText(session.rawShell.getOrDefault(shellKey,decoded==null?"":decoded));
            shell.addView(input,ui.wrap());TextView error=ui.text("",12,ui.danger,false);error.setTag("input-error:"+shellKey);error.setVisibility(View.GONE);shell.addView(error,ui.wrap());
            input.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){}
                public void afterTextChanged(Editable text){String raw=text.toString();session.rawShell.put(shellKey,raw);String encoded=CompetitiveKeyPolicy.encodeShell(raw);
                    error.setVisibility(encoded==null?View.VISIBLE:View.GONE);error.setText(encoded==null?"命令不能含空字符，UTF-8 长度最多 16 KiB":"");
                    if(encoded!=null)change(shellKey,encoded);}});
            shell.setVisibility(action==CompetitiveKeyPolicy.SHELL?View.VISIBLE:View.GONE);
        }
        actionChoice.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}
            public void onItemSelected(AdapterView<?> p,View v,int position,long id){if(rendering)return;change(key,String.valueOf(choices[position]));
                if(category==3)shell.setVisibility(choices[position]==CompetitiveKeyPolicy.SHELL?View.VISIBLE:View.GONE);}});
    }
    private String appLabel(String pkg){try{return String.valueOf(getPackageManager().getApplicationLabel(getPackageManager().getApplicationInfo(pkg,0)));}catch(Exception absent){return pkg;}}
    private void chooseApp(){
        LinearLayout body=column();EditText search=new EditText(this);search.setSingleLine(true);search.setHint("搜索应用名称或包名");ui.styleInput(search);body.addView(search,ui.wrap());
        ListView list=new ListView(this);list.setMinimumHeight(ui.dp(180));body.addView(list,new LinearLayout.LayoutParams(-1,ui.dp(330)));
        ArrayList<String[]> apps=new ArrayList<>(),visible=new ArrayList<>();
        Runnable render=()->{visible.clear();ArrayList<String> labels=new ArrayList<>();String filter=search.getText().toString().trim().toLowerCase(java.util.Locale.ROOT);
            for(String[] item:apps)if((item[0]+" "+item[1]).toLowerCase(java.util.Locale.ROOT).contains(filter)){visible.add(item);labels.add(item[0]+"\n"+item[1]);}
            list.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,labels));};
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){render.run();}public void afterTextChanged(Editable s){}});
        appDialog=ui.glassDialog("选择指定app",body,null,null,"取消");
        list.setOnItemClickListener((p,v,position,id)->{change(CompetitiveKeyOptions.APP_PACKAGE,visible.get(position)[1]);appDialog.dismiss();renderParameters();});
        session.worker.execute(()->{
            LinkedHashMap<String,String[]> packages=new LinkedHashMap<>();
            try{for(String category:new String[]{Intent.CATEGORY_INFO,Intent.CATEGORY_LAUNCHER})
                for(ResolveInfo item:getPackageManager().queryIntentActivities(new Intent(Intent.ACTION_MAIN).addCategory(category),0))
                    if(item.activityInfo!=null&&item.activityInfo.enabled)packages.put(item.activityInfo.packageName,new String[]{String.valueOf(item.loadLabel(getPackageManager())),item.activityInfo.packageName});
                ArrayList<String[]> found=new ArrayList<>(packages.values());found.sort((a,b)->a[0].compareToIgnoreCase(b[0]));
                main.post(()->{if(isDestroyed()||appDialog==null||!appDialog.isShowing())return;apps.addAll(found);render.run();});
            }catch(RuntimeException error){main.post(()->{if(!isDestroyed())Toast.makeText(this,"无法读取应用列表，请重试",Toast.LENGTH_LONG).show();});}
        });
    }
    private boolean ready(){
        String raw=config.diagnostic(CompetitiveKeyOptions.READY);
        if(!raw.startsWith(BuildConfig.VERSION_CODE+";routes="))return false;
        try{String[] parts=raw.split(";");int routes=Integer.parseInt(parts[1].substring(7));long at=Long.parseLong(parts[3].substring(3));
            long age=System.currentTimeMillis()-at;return routes>0&&age>=0&&age<45000;
        }catch(RuntimeException invalid){return false;}
    }
    private void refreshStatus(){if(status==null)return;
        String runtime=config.diagnostic(CompetitiveKeyOptions.RUNTIME);
        status.setText(session.gateBusy?"正在应用竞技键设置…":!ready()?"竞技键接管尚未就绪，请确认模块已作用于系统框架并重启手机":on()?(runtime.isEmpty()?"已接管竞技键":runtime):"已关闭");
    }
    private void flush(){main.removeCallbacks(save);if(session.pending.isEmpty())return;
        LinkedHashMap<String,String> updates=new LinkedHashMap<>(session.pending);session.pending.clear();
        session.worker.execute(()->{AppConfig.SaveResult result=new AppConfig(getApplicationContext()).save(updates);
            if(!result.success){main.post(()->{session.failure=result.message;
                for(Map.Entry<String,String> item:updates.entrySet())if(item.getValue().equals(session.draft.get(item.getKey())))session.pending.putIfAbsent(item.getKey(),item.getValue());
                CompetitiveKeySettingsActivity page=session.owner.get();if(page!=null&&!page.isDestroyed())Toast.makeText(page,result.message,Toast.LENGTH_LONG).show();
            });}});
    }
    @Override protected void onResume(){super.onResume();diagnostics=getSharedPreferences(AppConfig.DIAGNOSTICS,0);diagnostics.registerOnSharedPreferenceChangeListener(diagnosticListener);refreshStatus();
        if(!session.failure.isEmpty())Toast.makeText(this,session.failure,Toast.LENGTH_LONG).show();}
    @Override protected void onPause(){flush();if(diagnostics!=null)diagnostics.unregisterOnSharedPreferenceChangeListener(diagnosticListener);super.onPause();}
    @Override public Object onRetainNonConfigurationInstance(){session.expanded=parameters.getVisibility()==View.VISIBLE;return session;}
    @Override protected void onSaveInstanceState(Bundle state){Bundle draft=new Bundle(),raw=new Bundle();for(Map.Entry<String,String> item:session.draft.entrySet())draft.putString(item.getKey(),item.getValue());
        for(Map.Entry<String,String> item:session.rawShell.entrySet())raw.putString(item.getKey(),item.getValue());state.putBundle("draft",draft);state.putBundle("raw",raw);state.putBoolean("expanded",parameters.getVisibility()==View.VISIBLE);super.onSaveInstanceState(state);}
    @Override protected void onDestroy(){
        if(backCallbackRegistered){getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(backCallback);backCallbackRegistered=false;}
        main.removeCallbacks(save);if(appDialog!=null)appDialog.dismiss();if(unsavedDialog!=null)unsavedDialog.dismiss();
        if(isFinishing())session.worker.shutdown();super.onDestroy();
    }
    private void handleBack(){
        if(isFinishing()||isDestroyed())return;
        boolean invalid=false;for(String command:session.rawShell.values())if(CompetitiveKeyPolicy.encodeShell(command)==null){invalid=true;break;}
        if(invalid||!session.failure.isEmpty()&&!session.pending.isEmpty()){
            if(unsavedDialog!=null&&unsavedDialog.isShowing())return;
            LinearLayout message=column();message.addView(ui.text("部分修改尚未保存，退出将丢弃未保存的内容。",14,ui.text,false));
            unsavedDialog=ui.glassDialog("未保存的修改",message,"丢弃并退出",()->{session.pending.clear();finish();},"继续编辑");
            unsavedDialog.setOnDismissListener(dialog->unsavedDialog=null);return;
        }
        super.onBackPressed();
    }
}
