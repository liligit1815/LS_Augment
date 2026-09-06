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

public final class LauncherCustomizationActivity extends Activity {
    private UiKit ui;private AppConfig config;private Spinner space;private Button choose,save;
    private EditText name;private ImageView image;private TextView selected,status;
    private String pkg="",icon="",originalLabel="";private int user;private Uri cropUri;
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private List<RootHideManager.UserRecord> users=Collections.emptyList();
    @Override public void onCreate(Bundle state){
        super.onCreate(state);ui=new UiKit(this);config=new AppConfig(this);
        if(state!=null){pkg=state.getString("package","");user=state.getInt("user");icon=state.getString("icon","");originalLabel=state.getString("label","");String uri=state.getString("cropUri");if(uri!=null)cropUri=Uri.parse(uri);}
        LinearLayout page=ui.detailPage("APP图标名称编辑",null);
        page.addView(ui.text("先选择空间和应用，点击图片选择并裁剪，点击确认修改后保存。",12,ui.muted,false));
        space=new Spinner(this);page.addView(space);choose=ui.tonalButton("选择应用");choose.setEnabled(false);choose.setOnClickListener(v->chooseApp());page.addView(choose);
        LinearLayout card=ui.card();page.addView(card,ui.margins(0,12,0,12));image=new ImageView(this);image.setScaleType(ImageView.ScaleType.FIT_CENTER);LinearLayout.LayoutParams imageParams=new LinearLayout.LayoutParams(ui.dp(84),ui.dp(84));imageParams.gravity=android.view.Gravity.CENTER_HORIZONTAL;card.addView(image,imageParams);image.setContentDescription("选择并裁剪应用图标");
        selected=ui.text("尚未选择应用",13,ui.muted,false);card.addView(selected,ui.margins(0,8,0,8));
        name=new EditText(this);name.setSingleLine(true);name.setFilters(new InputFilter[]{new InputFilter.LengthFilter(80)});name.setHint("自定义名称，留空恢复原名");card.addView(name);
        if(state!=null)name.setText(state.getString("name",""));
        image.setOnClickListener(v->{if(pkg.isEmpty()){toast("请先选择应用");return;}
            startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),41);});
        LinearLayout actions=new LinearLayout(this);
        save=ui.tonalButton("确认修改");save.setOnClickListener(v->save());actions.addView(save,new LinearLayout.LayoutParams(0,ui.dp(44),1));
        Button resetImage=ui.tonalButton("恢复原图标");resetImage.setOnClickListener(v->{icon="";render();});
        LinearLayout.LayoutParams resetParams=new LinearLayout.LayoutParams(0,ui.dp(44),1);resetParams.setMargins(ui.dp(8),0,0,0);actions.addView(resetImage,resetParams);card.addView(actions);
        status=ui.text("",12,ui.muted,false);page.addView(status);
        loadUsers();render();
    }
    private void loadUsers(){worker.execute(()->{List<RootHideManager.UserRecord> loaded=new RootHideManager(this).listUsers();runOnUiThread(()->{
        if(isDestroyed())return;users=loaded;List<String> names=new ArrayList<>();int selectedIndex=0;
        for(int i=0;i<users.size();i++){RootHideManager.UserRecord u=users.get(i);names.add(u.name);if(u.userId==user)selectedIndex=i;}
        space.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,names));space.setSelection(selectedIndex);choose.setEnabled(!users.isEmpty());
        space.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener(){public void onNothingSelected(android.widget.AdapterView<?> a){}
            public void onItemSelected(android.widget.AdapterView<?> a,android.view.View v,int position,long id){int next=users.get(position).userId;if(next!=user){user=next;pkg="";icon="";name.setText("");render();}}});
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
        EditText search=new EditText(this);search.setSingleLine(true);search.setHint("搜索名称或包名");panel.addView(search);
        ListView list=new ListView(this);panel.addView(list,new LinearLayout.LayoutParams(-1,ui.dp(360)));
        List<RootHideManager.AppRecord> filtered=new ArrayList<>();ArrayAdapter<String> adapter=new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,new ArrayList<>());list.setAdapter(adapter);
        Runnable filter=()->{String q=search.getText().toString().toLowerCase(Locale.ROOT);filtered.clear();adapter.clear();
            for(RootHideManager.AppRecord app:all)if((app.label+" "+app.target.packageName).toLowerCase(Locale.ROOT).contains(q)){filtered.add(app);adapter.add(app.label+"\n"+app.target.packageName);}adapter.notifyDataSetChanged();};
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){filter.run();}public void afterTextChanged(Editable e){}});filter.run();
        AlertDialog dialog=new AlertDialog.Builder(this).setTitle("选择要修改的应用").setView(panel).setNegativeButton("取消",null).create();
        list.setOnItemClickListener((a,v,position,id)->{RootHideManager.AppRecord app=filtered.get(position);pkg=app.target.packageName;originalLabel=app.label;user=requested;
            LauncherOverrides overrides=LauncherOverrides.parse(config.get(ConfigSchema.LAUNCHER_OVERRIDES));LauncherOverrides.Entry e=overrides==null?null:overrides.get(user,pkg);icon=e==null?"":e.icon;name.setText(e==null?"":e.name);render();dialog.dismiss();});dialog.show();
    }
    private void render(){selected.setText(pkg.isEmpty()?"尚未选择应用":originalLabel+"\n"+pkg);image.setImageDrawable(null);
        try{if(icon.isEmpty()&&!pkg.isEmpty())image.setImageDrawable(getPackageManager().getApplicationIcon(pkg));else if(!icon.isEmpty())image.setImageBitmap(BitmapFactory.decodeFile(LauncherIconStore.file(this,icon).getPath()));}catch(Exception ignored){}
        if(status!=null)status.setText("名称留空并确认后恢复原名。图片修改也需确认保存。");
    }
    private void save(){if(pkg.isEmpty()){toast("请先选择应用");return;}
        LauncherOverrides.Entry entry;try{entry=new LauncherOverrides.Entry(user,pkg,name.getText().toString(),icon);}catch(Exception e){toast("名称过长或包含控制字符");return;}
        save.setEnabled(false);worker.execute(()->{LauncherOverrides values=LauncherOverrides.parse(config.get(ConfigSchema.LAUNCHER_OVERRIDES));if(values==null)values=LauncherOverrides.empty();
            Map<String,String> changes=new LinkedHashMap<>();changes.put(ConfigSchema.LAUNCHER_OVERRIDES,values.with(entry).serialize());AppConfig.SaveResult result=config.save(changes);
            runOnUiThread(()->{if(isDestroyed())return;save.setEnabled(true);toast(result.success?"配置已保存，桌面正在刷新":result.message);render();});});
    }
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request==42)releaseCropPermission();if(result!=RESULT_OK||data==null)return;
        if(request==41&&data.getData()!=null){releaseCropPermission();Uri uri=data.getData();cropUri=uri;try{getContentResolver().takePersistableUriPermission(uri,Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(Exception ignored){}
            startActivityForResult(new Intent(this,IconCropActivity.class).setData(uri).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),42);
        }else if(request==42){icon=data.getStringExtra("icon");if(icon==null)icon="";render();}}
    private void toast(String text){Toast.makeText(this,text,Toast.LENGTH_LONG).show();}
    private void releaseCropPermission(){if(cropUri!=null)try{getContentResolver().releasePersistableUriPermission(cropUri,Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(Exception ignored){}finally{cropUri=null;}}
    @Override protected void onSaveInstanceState(Bundle b){super.onSaveInstanceState(b);b.putString("package",pkg);b.putInt("user",user);b.putString("icon",icon);b.putString("label",originalLabel);b.putString("name",name.getText().toString());if(cropUri!=null)b.putString("cropUri",cropUri.toString());}
    @Override protected void onDestroy(){if(isFinishing())releaseCropPermission();worker.shutdown();super.onDestroy();}
}
