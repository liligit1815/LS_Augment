package ls.augment.com;

import android.app.*;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.text.*;
import android.widget.*;
import java.util.*;
import java.util.concurrent.*;

final class LauncherEditorController extends NativeEditorController {
    LauncherEditorController(Activity owner,String route,boolean embedded){super(owner,route,embedded);}
    private UiKit ui;private AppConfig config;private Spinner space;private Button choose;
    private EditText name;private ImageView image;private TextView selected,status;
    private String pkg="",icon="",originalLabel="";private int user;private Uri cropUri;
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    // Serial across recreation; slow app enumeration never blocks saving a draft.
    private static final ExecutorService WRITES=Executors.newSingleThreadExecutor();
    private final LauncherEditQueue editQueue=new LauncherEditQueue();
    private android.content.SharedPreferences pendingStore,gateMemory;
    private Switch overrideControl;private UiKit.Fold overrideFold;
    private boolean bindingGate;
    private long gateGeneration;
    private final android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
    private final Runnable autoSave=this::save;
    private boolean loading=true;
    private List<RootHideManager.UserRecord> users=Collections.emptyList();
    @Override public void onCreate(Bundle state){
        super.onCreate(state);ui=editorUi();config=new AppConfig(this);
        pendingStore=getSharedPreferences("native_launcher_drafts",0);gateMemory=getSharedPreferences("native_value_overrides",0);
        for(Map.Entry<String,?> entry:pendingStore.getAll().entrySet())if(entry.getValue() instanceof String)editQueue.restore(entry.getKey(),(String)entry.getValue());
        if(state!=null){pkg=state.getString("package","");user=state.getInt("user");icon=state.getString("icon","");originalLabel=state.getString("label","");String uri=state.getString("cropUri");if(uri!=null)cropUri=Uri.parse(uri);ArrayList<Bundle> drafts=state.getParcelableArrayList("pending-drafts");if(drafts!=null)for(Bundle draft:drafts)editQueue.put(draft.getInt("user"),draft.getString("pkg"),draft.getString("name"),draft.getString("icon"));}
        LinearLayout container=ui.detailPage("APP图标名称编辑",null);
        LinearLayout page=new LinearLayout(this);page.setOrientation(LinearLayout.VERTICAL);
        page.addView(ui.featureTitle("用户空间", "选择要修改的 Android 用户空间，再选择该空间内可从桌面启动的应用。不同空间的图标和名称独立保存。"));
        space=ui.choiceSpinner("选择应用空间");page.addView(space);choose=ui.tonalButton("选择应用");choose.setEnabled(false);choose.setOnClickListener(v->chooseApp());page.addView(choose);
        LinearLayout card=ui.card();page.addView(card,ui.margins(0,12,0,12));card.addView(ui.featureTitle("应用图标", "先选择应用，再点击图片选择并裁剪新图标。裁剪完成后自动保存，取消裁剪保留原图标。"));image=new ImageView(this);image.setScaleType(ImageView.ScaleType.FIT_CENTER);LinearLayout.LayoutParams imageParams=new LinearLayout.LayoutParams(ui.dp(84),ui.dp(84));imageParams.gravity=android.view.Gravity.CENTER_HORIZONTAL;card.addView(image,imageParams);image.setContentDescription("选择并裁剪应用图标");
        selected=ui.text("尚未选择应用",13,ui.muted,false);card.addView(selected,ui.margins(0,8,0,8));
        card.addView(ui.featureTitle("应用名称", "设置当前应用在桌面显示的名称，最多 80 个字符。输入自动保存，留空恢复原名，不会更改应用包名。"));
        name=new EditText(this);ui.styleInput(name);name.setSingleLine(true);name.setFilters(new InputFilter[]{new InputFilter.LengthFilter(80)});name.setHint("自定义名称，留空恢复原名");card.addView(name);
        if(state!=null)name.setText(state.getString("name",""));
        name.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){scheduleSave();}public void afterTextChanged(Editable e){}});
        image.setOnClickListener(v->{if(pkg.isEmpty()){toast("请先选择应用");return;}
            startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),41);});
        LinearLayout actions=new LinearLayout(this);
        Button resetImage=ui.tonalButton("恢复原图标");resetImage.setOnClickListener(v->{icon="";render();scheduleSave();});
        LinearLayout.LayoutParams resetParams=new LinearLayout.LayoutParams(0,ui.dp(44),1);actions.addView(resetImage,resetParams);card.addView(actions,ui.margins(0,12,0,0));
        status=ui.text("",12,ui.muted,false);page.addView(status);
        String actual=config.get(ConfigSchema.LAUNCHER_OVERRIDES);LauncherOverrides current=LauncherOverrides.parse(actual);boolean enabled=current!=null&&!current.entries().isEmpty();
        if(actual.equals(gateMemory.getString("value:"+ConfigSchema.LAUNCHER_OVERRIDES,null)))enabled=gateMemory.getBoolean("open:"+ConfigSchema.LAUNCHER_OVERRIDES,enabled);
        overrideControl=new Switch(this);overrideControl.setChecked(enabled);container.addView(ui.featureRow("自定义应用图标与名称","按用户空间选择应用。关闭时恢复原厂名称和图标，再次开启恢复之前保存的修改。",overrideControl));container.addView(page,ui.wrap());overrideFold=ui.fold(overrideControl,page);
        overrideControl.setOnCheckedChangeListener((button,on)->{if(bindingGate)return;long requested=++gateGeneration;overrideFold.sync();if(!on)save(true);WRITES.execute(()->{
            String key=ConfigSchema.LAUNCHER_OVERRIDES,before=config.get(key),next=on?gateMemory.getString("remember:"+key,before):ConfigSchema.defaultValue(key);String normalized=ConfigSchema.normalize(key,next);if(normalized==null)normalized=ConfigSchema.defaultValue(key);
            if(!on&&!gateMemory.edit().putString("remember:"+key,before).commit()){runOnUiThread(()->{if(requested==gateGeneration)gateFailed("未能保存图标配置记忆");});return;}
            AppConfig.SaveResult result=config.save(Collections.singletonMap(key,normalized));
            if(result.success)gateMemory.edit().putBoolean("open:"+key,on).putString("value:"+key,normalized).commit();
            runOnUiThread(()->{if(isDestroyed()||requested!=gateGeneration)return;if(!result.success)gateFailed(result.message);else if(on)save();});
        });});
        loadUsers();render();loading=false;if(!editQueue.snapshot().isEmpty())main.post(autoSave);
    }
    private void loadUsers(){worker.execute(()->{List<RootHideManager.UserRecord> loaded=new RootHideManager(this).listUsers();runOnUiThread(()->{
        if(isDestroyed())return;users=loaded;List<String> names=new ArrayList<>();int selectedIndex=0;
        for(int i=0;i<users.size();i++){RootHideManager.UserRecord u=users.get(i);names.add(u.name);if(u.userId==user)selectedIndex=i;}
        space.setAdapter(labelAdapter(android.R.layout.simple_spinner_dropdown_item,names));space.setSelection(selectedIndex);choose.setEnabled(!users.isEmpty());
        space.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener(){public void onNothingSelected(android.widget.AdapterView<?> a){}
            public void onItemSelected(android.widget.AdapterView<?> a,android.view.View v,int position,long id){int next=users.get(position).userId;if(next!=user){save();loading=true;user=next;pkg="";icon="";name.setText("");render();loading=false;}}});
        if(users.isEmpty())status.setText("无法读取用户空间，请检查 Root 授权。");
    });});}
    private void chooseApp(){if(users.isEmpty())return;int requested=users.get(space.getSelectedItemPosition()).userId;choose.setEnabled(false);choose.setText("正在读取应用…");
        worker.execute(()->{List<RootHideManager.AppRecord> all=new RootHideManager(this).listApps(requested);
            RootShell.Result result=RootShell.run("cmd package query-activities --brief --components --user "+requested+" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER",null,12,262144);
            Set<String> launchable=new HashSet<>();for(String line:result.output.split("\\r?\\n")){String text=line.trim();int slash=text.indexOf('/');if(slash>0&&text.substring(0,slash).matches("[A-Za-z0-9_.]+"))launchable.add(text.substring(0,slash));}
            List<RootHideManager.AppRecord> apps=new ArrayList<>();for(RootHideManager.AppRecord r:all)if(launchable.contains(r.target.packageName))apps.add(r);
            apps.sort(Comparator.comparing(r->r.label,java.text.Collator.getInstance(Locale.CHINA)));
            runOnUiThread(()->{if(isDestroyed()||isFinishing())return;choose.setEnabled(true);choose.setText("选择应用");if(apps.isEmpty()){toast("未读到可在桌面启动的应用，请先解锁该空间");return;}picker(apps,requested);});
        });
    }
    private void picker(List<RootHideManager.AppRecord> all,int requested){
        LinearLayout panel=new LinearLayout(this);panel.setOrientation(LinearLayout.VERTICAL);panel.setPadding(ui.dp(16),ui.dp(8),ui.dp(16),0);
        EditText search=new EditText(this);ui.styleInput(search);search.setSingleLine(true);search.setHint("搜索名称或包名");panel.addView(search);
        ListView list=new ListView(this);panel.addView(list,new LinearLayout.LayoutParams(-1,ui.dp(360)));
        List<RootHideManager.AppRecord> filtered=new ArrayList<>();ArrayAdapter<String> adapter=labelAdapter(android.R.layout.simple_list_item_1,new ArrayList<>());list.setAdapter(adapter);
        Runnable filter=()->{String q=search.getText().toString().toLowerCase(Locale.ROOT);filtered.clear();adapter.clear();
            for(RootHideManager.AppRecord app:all)if((app.label+" "+app.target.packageName).toLowerCase(Locale.ROOT).contains(q)){filtered.add(app);adapter.add(app.label+"\n"+app.target.packageName);}adapter.notifyDataSetChanged();};
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){filter.run();}public void afterTextChanged(Editable e){}});filter.run();
        AlertDialog dialog=AppDialogs.builder(this).setTitle("选择要修改的应用").setView(panel).setNegativeButton("取消",null).create();
        list.setOnItemClickListener((a,v,position,id)->{save();loading=true;RootHideManager.AppRecord app=filtered.get(position);pkg=app.target.packageName;originalLabel=app.label;user=requested;
            LauncherOverrides overrides=LauncherOverrides.parse(config.get(ConfigSchema.LAUNCHER_OVERRIDES));LauncherOverrides.Entry e=overrides==null?null:overrides.get(user,pkg);LauncherEditQueue.Draft pending=editQueue.get(user,pkg);icon=pending!=null?pending.icon:e==null?"":e.icon;name.setText(pending!=null?pending.name:e==null?"":e.name);status.setText(pending==null?"":"此应用还有未保存的修改");render();loading=false;dialog.dismiss();});dialog.show();
    }
    private void render(){selected.setText(pkg.isEmpty()?"尚未选择应用":originalLabel+"\n"+pkg);image.setImageDrawable(null);
        try{if(icon.isEmpty()&&!pkg.isEmpty())image.setImageDrawable(getPackageManager().getApplicationIcon(pkg));else if(!icon.isEmpty())image.setImageBitmap(BitmapFactory.decodeFile(LauncherIconStore.file(this,icon).getPath()));}catch(Exception ignored){}
        name.setEnabled(!pkg.isEmpty());
    }
    private void scheduleSave(){if(loading||pkg.isEmpty())return;LauncherEditQueue.Draft draft=editQueue.put(user,pkg,name.getText().toString(),icon);name.setError(draft.entry()==null?"名称过长或包含控制字符，已保留上次保存的值":null);main.removeCallbacks(autoSave);main.postDelayed(autoSave,280);}
    private void gateFailed(String message){if(isDestroyed())return;String value=config.get(ConfigSchema.LAUNCHER_OVERRIDES);LauncherOverrides actual=LauncherOverrides.parse(value);bindingGate=true;overrideControl.setChecked(actual!=null&&!actual.entries().isEmpty());bindingGate=false;overrideFold.sync();status.setText("未保存："+message);}
    private void save(){save(false);}
    private void save(boolean beforeDisable){main.removeCallbacks(autoSave);
        for(LauncherEditQueue.Draft draft:editQueue.snapshot())if(draft.entry()==null)WRITES.execute(()->pendingStore.edit().putString(draft.key(),LauncherEditQueue.encode(draft)).commit());
        if(!beforeDisable&&overrideControl!=null&&!overrideControl.isChecked())return;
        for(LauncherEditQueue.Draft draft:editQueue.takePending())WRITES.execute(()->{
            String encoded=LauncherEditQueue.encode(draft);
            if(!pendingStore.edit().putString(draft.key(),encoded).commit()){runOnUiThread(()->{editQueue.complete(draft,false);if(!isDestroyed()&&user==draft.user&&pkg.equals(draft.pkg))status.setText("未能保存待提交草稿，请重试");});return;}
            LauncherOverrides values=LauncherOverrides.parse(config.get(ConfigSchema.LAUNCHER_OVERRIDES));if(values==null)values=LauncherOverrides.empty();
            Map<String,String> changes=new LinkedHashMap<>();changes.put(ConfigSchema.LAUNCHER_OVERRIDES,values.with(draft.entry()).serialize());AppConfig.SaveResult result=config.save(changes);
            if(result.success&&encoded.equals(pendingStore.getString(draft.key(),null)))pendingStore.edit().remove(draft.key()).commit();
            runOnUiThread(()->{editQueue.complete(draft,result.success);if(isDestroyed()||user!=draft.user||!pkg.equals(draft.pkg))return;LauncherEditQueue.Draft pending=editQueue.get(user,pkg);if(!result.success&&pending!=null&&pending.generation==draft.generation)status.setText("未保存："+result.message);else if(pending==null)status.setText("");});
        });
    }
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request==42)releaseCropPermission();if(result!=RESULT_OK||data==null)return;
        if(request==41&&data.getData()!=null){releaseCropPermission();Uri uri=data.getData();cropUri=uri;try{getContentResolver().takePersistableUriPermission(uri,Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(Exception ignored){}
            startActivityForResult(new Intent(this,IconCropActivity.class).setData(uri).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),42);
        }else if(request==42){icon=data.getStringExtra("icon");if(icon==null)icon="";render();scheduleSave();}}
    private void toast(String text){Toast.makeText(this,text,Toast.LENGTH_LONG).show();}
    private ArrayAdapter<String> labelAdapter(int layout,List<String> values){
        return new ArrayAdapter<String>(this,layout,values){
            @Override public android.view.View getView(int position,android.view.View convertView,android.view.ViewGroup parent){android.view.View view=super.getView(position,convertView,parent);if(view instanceof TextView){((TextView)view).setTextSize(12.5f);((TextView)view).setTextColor(ui.text);}return view;}
            @Override public android.view.View getDropDownView(int position,android.view.View convertView,android.view.ViewGroup parent){android.view.View view=super.getDropDownView(position,convertView,parent);if(view instanceof TextView)((TextView)view).setTextSize(13);return view;}
        };
    }
    private void releaseCropPermission(){if(cropUri!=null)try{getContentResolver().releasePersistableUriPermission(cropUri,Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(Exception ignored){}finally{cropUri=null;}}
    @Override protected void onSaveInstanceState(Bundle b){super.onSaveInstanceState(b);ArrayList<Bundle> drafts=new ArrayList<>();for(LauncherEditQueue.Draft draft:editQueue.snapshot()){Bundle saved=new Bundle();saved.putInt("user",draft.user);saved.putString("pkg",draft.pkg);saved.putString("name",draft.name);saved.putString("icon",draft.icon);drafts.add(saved);}b.putParcelableArrayList("pending-drafts",drafts);b.putString("package",pkg);b.putInt("user",user);b.putString("icon",icon);b.putString("label",originalLabel);b.putString("name",name.getText().toString());if(cropUri!=null)b.putString("cropUri",cropUri.toString());}
    @Override protected void onPause(){save();super.onPause();}
    @Override protected void onDestroy(){save();main.removeCallbacks(autoSave);if(isFinishing())releaseCropPermission();worker.shutdown();super.onDestroy();}
}
