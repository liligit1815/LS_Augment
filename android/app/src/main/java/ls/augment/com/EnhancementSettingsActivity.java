package ls.augment.com;

import android.app.*;
import android.content.*;
import android.content.ClipboardManager;
import android.graphics.Rect;
import android.os.*;
import android.text.*;
import android.view.*;
import android.widget.*;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.*;

/** Direct application controls backed by the real catalogue and reusable native editors. */
public class EnhancementSettingsActivity extends Activity implements NativeEditorController.Host {
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private final Handler main=new Handler(Looper.getMainLooper());
    private final LinkedHashMap<String,String> draft=new LinkedHashMap<>(),pending=new LinkedHashMap<>();
    private final Map<String,EnhancementOption> options=new LinkedHashMap<>();
    private final Map<String,NativeEditorController> editors=new LinkedHashMap<>();
    private final Map<String,View> controls=new LinkedHashMap<>();
    private final Runnable autoSave=this::flush;
    private UiKit ui;private AppConfig config;private LinearLayout body;private SharedPreferences gateMemory;
    private String group,targetId,query="",fontKey,pendingEditor;
    private View queryAnchor;private Bundle editorStates;
    private ArrayAdapter<String> memoryContentAdapter;
    private View memoryColorsRow;
    private static final String UI_MEMORY="native_value_overrides";
    public static void open(Activity owner,String group){owner.startActivity(new Intent(owner,EnhancementSettingsActivity.class).putExtra("group",group));}
    @Override public void onCreate(Bundle state){
        super.onCreate(state);config=new AppConfig(this);ui=new UiKit(this);
        group=getIntent().getStringExtra("group");if(group==null)group="system";
        targetId=getIntent().getStringExtra("target");query=getIntent().getStringExtra("query");if(query==null)query="";
        if(targetId!=null&&HookAppCatalog.find(targetId)==null){toast("未找到此应用的配置页面");finish();return;}
        for(EnhancementOption o:EnhancementCatalog.options()){options.put(o.key,o);draft.put(o.key,config.get(o.key));}
        gateMemory=getSharedPreferences(UI_MEMORY,MODE_PRIVATE);
        if(state!=null){fontKey=state.getString("fontKey");pendingEditor=state.getString("pendingEditor");editorStates=state.getBundle("editors");Bundle saved=state.getBundle("draft");if(saved!=null)for(String key:draft.keySet()){String value=saved.getString(key);if(value!=null&&ConfigSchema.normalize(key,value)!=null){draft.put(key,value);if(!value.equals(config.get(key)))pending.put(key,value);}}}
        if(this instanceof StatusBarSettingsActivity){
            StatusBarEditorController editor=new StatusBarEditorController(this,"status_layout",false);
            editor.setRelatedFeatures(NativeFeatureGroups.forGroup("statusbar"),this::feature);
            editors.put("status_layout",editor);
            editor.onCreate(editorStates==null?null:editorStates.getBundle("status_layout"));
        }else render(state==null?0:state.getInt("scrollY"));
        if(!pending.isEmpty())main.post(autoSave);
    }
    private static final class SectionPlan {
        final String id,title;final List<NativeFeatureGroups.Feature> features=new ArrayList<>();final List<HookAppCatalog.Entry> entries=new ArrayList<>();
        SectionPlan(String id,String title){this.id=id;this.title=title;}
    }
    private void render(int previousY){
        HookAppCatalog.Target target=HookAppCatalog.find(targetId);
        String scope=target!=null?target.restartScope:Arrays.asList("statusbar","lockscreen","aod","quicksettings").contains(group)?ScopeRestartDialog.SYSTEM_UI:ScopeRestartDialog.APPS;
        body=ui.detailPage(target==null?EnhancementCatalog.title(group):target.title,scope);
        LinkedHashMap<String,SectionPlan> sections=new LinkedHashMap<>();
        if(target==null){SectionPlan s=new SectionPlan(group,EnhancementCatalog.title(group));s.features.addAll(NativeFeatureGroups.forGroup(group));sections.put(group,s);}
        else{
            for(NativeFeatureGroups.Section section:NativeFeatureGroups.forTarget(target.id)){SectionPlan s=new SectionPlan(section.id,section.title);s.features.addAll(section.features);sections.put(s.id,s);}
            for(HookAppCatalog.Entry entry:HookAppCatalog.entries(target.id)){
                if("launcher_compatibility".equals(entry.route))continue;
                String id=entrySection(entry.route);SectionPlan s=sections.get(id);
                if(s==null){s=new SectionPlan(id,sectionTitle(id,entry.title));sections.put(id,s);}s.entries.add(entry);
            }
        }
        List<SectionPlan> ordered=new ArrayList<>(sections.values());
        if("system".equals(targetId)){List<String> order=Arrays.asList("freeform","system","audio","battery","connections","installer");ordered.sort(Comparator.comparingInt(s->{int i=order.indexOf(s.id);return i<0?99:i;}));}
        boolean groupedSystemUi="systemui".equals(targetId)||target==null&&Arrays.asList("statusbar","quicksettings","lockscreen","aod").contains(group);
        for(SectionPlan section:ordered){
            LinearLayout card=category(section.id,sectionTitle(section.id,section.title));
            for(HookAppCatalog.Entry entry:section.entries){
                if(card.getChildCount()>0)divider(card);
                if("status_layout".equals(entry.route)){
                    View open;
                    if(groupedSystemUi){
                        LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.VERTICAL);
                        row.setPadding(0,ui.dp(8),0,ui.dp(8));row.setClickable(true);row.setFocusable(true);
                        row.setForeground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT,12)));
                        row.addView(ui.featureTitle("编辑状态栏","点选预览编辑 · 自动避让 · 布局预设"),ui.wrap());
                        row.setOnClickListener(v->startActivity(new Intent(this,StatusBarSettingsActivity.class)));open=row;
                    }else open=ui.categoryCard("","编辑状态栏","点选预览编辑 · 自动避让 · 布局预设",null,v->startActivity(new Intent(this,StatusBarSettingsActivity.class)));
                    open.setContentDescription("编辑状态栏");card.addView(open,ui.wrap());
                    considerQuery(open,entry.title,entry.summary);
                    for(NativeFeatureGroups.Feature f:section.features)for(String key:f.allKeys()){
                        EnhancementOption option=options.get(key);if(option!=null)considerQuery(open,option.title,option.summary);
                    }
                    section.features.clear();continue;
                }
                NativeEditorController editor=createEditor(entry.route);editors.put(entry.route,editor);
                if(editor instanceof StatusBarEditorController){
                    ((StatusBarEditorController)editor).setRelatedFeatures(new ArrayList<>(section.features),this::feature);
                    section.features.clear();
                }
                editor.onCreate(editorStates==null?null:editorStates.getBundle(entry.route));
                card.addView(editor.view(),ui.wrap());considerQuery(editor.view(),entry.title,entry.summary);
            }
            java.util.Set<String> shownGroups=new java.util.HashSet<>();
            for(NativeFeatureGroups.Feature feature:section.features){
                String object=NativeFeatureGroups.objectGroup(feature);
                if(!object.isEmpty()&&!shownGroups.add(object))continue;
                if(card.getChildCount()>0)divider(card);
                if(object.isEmpty()){
                    card.addView(feature(feature),ui.wrap());
                }
                else{
                    LinearLayout settings=new LinearLayout(this);settings.setOrientation(LinearLayout.VERTICAL);
                    for(NativeFeatureGroups.Feature member:section.features)if(object.equals(NativeFeatureGroups.objectGroup(member))){
                        if(settings.getChildCount()>0)divider(settings);settings.addView(feature(member),ui.wrap());
                    }
                    card.addView(groupedSystemUi?ui.foldingSection(object,settings,!query.isEmpty()):ui.collapsible(object,"同一对象的显示与行为集中配置，各项保留独立开关。",settings,!query.isEmpty()),ui.wrap());
                }
            }
        }
        if("settings".equals(targetId)||target==null&&"connections".equals(group))DeviceSettingsActions.add(this,ui,category("developer","开发者设置"),worker);
        if("update".equals(targetId)||target==null&&"update".equals(group)){
            LinearLayout card=category("update-link","更新链接");Button url=ui.tonalButton("查看已提取的更新链接");card.addView(url,ui.wrap());
            url.setOnClickListener(v->worker.execute(()->{Bundle data=getContentResolver().call(android.net.Uri.parse("content://ls.augment.com.config"),"ota_url_get",null,null);String value=data==null?"":data.getString("url","");runOnUiThread(()->{if(isDestroyed())return;if(value.isEmpty()){toast("尚未提取到链接；更新应用准备安装时才会产生。");return;}AppDialogs.builder(this).setTitle("系统更新链接").setMessage(value).setNegativeButton("关闭",null).setPositiveButton("复制",(d,w)->{getSystemService(ClipboardManager.class).setPrimaryClip(ClipData.newPlainText("系统更新链接",value));toast("链接已复制");}).show();});}));
        }
        body.post(()->{ScrollView scroll=scrollView();if(scroll==null)return;if(queryAnchor!=null){Rect r=new Rect();queryAnchor.getDrawingRect(r);body.offsetDescendantRectToMyCoords(queryAnchor,r);scroll.scrollTo(0,Math.max(0,r.top-ui.dp(10)));}else scroll.scrollTo(0,previousY);});
    }
    private LinearLayout category(String id,String title){
        TextView heading=ui.overline(title);AppearanceController.section(heading,title);body.addView(heading,ui.margins(3,body.getChildCount()==0?0:16,3,16));
        LinearLayout card=ui.card();card.setTag("application-category:"+targetId+":"+id);card.setPadding(ui.dp(12),ui.dp(2),ui.dp(12),ui.dp(2));body.addView(card,ui.wrap());return card;
    }
    private void divider(LinearLayout card){card.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));}
    private View feature(NativeFeatureGroups.Feature f){
        LinearLayout card=new LinearLayout(this);card.setOrientation(LinearLayout.VERTICAL);card.setTag("native-feature:"+f.id);
        String key=f.toggleKey==null?f.parameterKeys[0]:f.toggleKey;EnhancementOption option=options.get(key);
        Switch toggle=new Switch(this);toggle.setTag("config:"+key);
        boolean active=f.toggleKey!=null?ConfigSchema.truthy(value(key)):ValueOverrideState.active(f.comparison,value(key),f.noOpValue);
        if(f.toggleKey==null&&gateMemory.contains("value:"+key)
                &&!ValueOverrideState.active(f.comparison,value(key),gateMemory.getString("value:"+key,value(key))))
            active=gateMemory.getBoolean("open:"+key,active);
        toggle.setChecked(active);card.addView(ui.featureRow(f.title,FeatureHelp.forOption(option),toggle),ui.wrap());
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
        if("ls_augment_rm_recents_memory_custom".equals(f.id))memoryControls(content);
        else for(String parameter:f.parameterKeys)content.addView(input(options.get(parameter)),ui.wrap());
        for(NativeFeatureGroups.Feature child:f.children)content.addView(feature(child),ui.wrap());
        UiKit.Fold fold=null;if(f.hasConfiguration()){card.addView(content,ui.wrap());fold=ui.fold(toggle,content);}
        final UiKit.Fold configFold=fold;
        toggle.setOnCheckedChangeListener((view,on)->{
            if(configFold!=null)configFold.sync();
            if(f.toggleKey!=null)change(key,on?"1":"0",toggle);
            else{
                SharedPreferences.Editor memory=gateMemory.edit().putBoolean("open:"+key,on);String next;
                if(!on){memory.putString("remember:"+key,value(key));next=f.noOpValue;}
                else next=ValueOverrideState.restore(option,gateMemory.getString("remember:"+key,value(key)),f.noOpValue);
                memory.putString("value:"+key,next).apply();change(key,next,toggle);refreshInput(key,next);
            }
        });
        for(String owned:f.allKeys()){EnhancementOption o=options.get(owned);if(o!=null)considerQuery(card,o.title,o.summary);}
        return card;
    }
    private void memoryControls(LinearLayout content){
        String prefix="ls_augment_rm_recents_memory_";
        for(String key:new String[]{"style","content","color_mode"})content.addView(input(options.get(prefix+key)),ui.wrap());
        memoryColorsRow=memoryPair(content,prefix+"light_color",prefix+"dark_color");
        syncMemoryColorsVisibility();
        for(String[] pair:new String[][]{{"simple_size","detailed_size"},
                {"portrait_top","portrait_left"},{"landscape_top","landscape_left"}})
            memoryPair(content,prefix+pair[0],prefix+pair[1]);
        // Keep the existing height controls available without interrupting the four requested rows.
        LinearLayout heights=new LinearLayout(this);heights.setOrientation(LinearLayout.VERTICAL);heights.setVisibility(View.GONE);
        Button more=ui.tonalButton("展开显示区域高度");content.addView(more,ui.wrap());
        more.setOnClickListener(v->{boolean open=heights.getVisibility()!=View.VISIBLE;heights.setVisibility(open?View.VISIBLE:View.GONE);more.setText(open?"收起显示区域高度":"展开显示区域高度");});
        memoryPair(heights,prefix+"portrait_height",prefix+"landscape_height");content.addView(heights,ui.wrap());
    }
    private LinearLayout memoryPair(LinearLayout parent,String left,String right){
        LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.HORIZONTAL);row.setBaselineAligned(false);
        LinearLayout.LayoutParams first=new LinearLayout.LayoutParams(0,-2,1);first.setMarginEnd(ui.dp(6));
        LinearLayout.LayoutParams second=new LinearLayout.LayoutParams(0,-2,1);second.setMarginStart(ui.dp(6));
        row.addView(input(options.get(left)),first);row.addView(input(options.get(right)),second);parent.addView(row,ui.wrap());
        return row;
    }
    private void syncMemoryColorsVisibility(){
        if(memoryColorsRow!=null)memoryColorsRow.setVisibility("2".equals(value("ls_augment_rm_recents_memory_color_mode"))?View.VISIBLE:View.GONE);
    }
    private String value(String key){return draft.getOrDefault(key,config.get(key));}
    private View input(EnhancementOption option){
        LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.VERTICAL);row.setPadding(0,ui.dp(3),0,ui.dp(8));row.addView(ui.featureTitle(option.title,FeatureHelp.forOption(option)),ui.wrap());
        if(option.kind==EnhancementOption.Kind.CHOICE){
            Spinner choice=ui.choiceSpinner("选择选项","ls_augment_rm_recents_memory_content".equals(option.key)?this::memoryExampleText:null);choice.setContentDescription(option.title);if("ls_augment_rm_recents_memory_content".equals(option.key)){
                memoryContentAdapter=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_dropdown_item,option.choices){
                    @Override public View getView(int position,View recycled,ViewGroup parent){return memoryContentExample(option,position,false);}
                    @Override public View getDropDownView(int position,View recycled,ViewGroup parent){return memoryContentExample(option,position,true);}
                };
                choice.setAdapter(memoryContentAdapter);
            }else choice.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,option.choices));choice.setSelection(Integer.parseInt(value(option.key)));row.addView(choice,ui.wrap());controls.put(option.key,choice);
            choice.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int position,long id){change(option.key,String.valueOf(position),choice);}});
        }else if(option.key.endsWith("_clock_font")){
            Button button=ui.tonalButton(value(option.key).isEmpty()?"选择字体文件":"更换字体");row.addView(button,ui.wrap());controls.put(option.key,button);
            button.setOnClickListener(v->AppDialogs.builder(this).setTitle(option.title).setItems(new String[]{"选择字体文件","恢复原厂字体"},(d,i)->{if(i==1){change(option.key,"",button);refreshInput(option.key,"");return;}fontKey=option.key;startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*"),84);}).show());
        }else if(option.key.endsWith("hidden_icon_slots")){
            String[] labels={"闹钟","蓝牙","勿扰模式","耳机","VPN","定位","飞行模式","投屏","旋转锁定","热点","NFC"};String[] slots={"alarm_clock","bluetooth","zen","headset","vpn","location","airplane","cast","rotate","hotspot","nfc"};
            LinearLayout checks=new LinearLayout(this);checks.setOrientation(LinearLayout.VERTICAL);controls.put(option.key,checks);row.addView(checks,ui.wrap());
            for(int i=0;i<slots.length;i++){String slot=slots[i];CheckBox box=new CheckBox(this);box.setTag(slot);box.setText(labels[i]);ui.styleCheckBox(box);box.setChecked(tokens(value(option.key)).contains(slot));checks.addView(box,ui.wrap());box.setOnCheckedChangeListener((v,on)->{Set<String> selected=tokens(value(option.key));if(on)selected.add(slot);else selected.remove(slot);change(option.key,String.join(",",selected),box);});}
        }else{
            EditText field=new EditText(this);ui.styleInput(field);field.setContentDescription(option.title);field.setText(value(option.key));
            if(option.kind==EnhancementOption.Kind.INTEGER)field.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_SIGNED);
            else if(option.kind==EnhancementOption.Kind.DECIMAL)field.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_DECIMAL|InputType.TYPE_NUMBER_FLAG_SIGNED);
            row.addView(field,ui.wrap());controls.put(option.key,field);
            field.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){String normalized=option.normalize(s.toString());if(normalized==null){field.setError(option.kind==EnhancementOption.Kind.INTEGER||option.kind==EnhancementOption.Kind.DECIMAL?"请输入 "+option.minimum+"～"+option.maximum+" 之间的有效数值":"请输入有效内容");return;}field.setError(null);change(option.key,normalized,field);}public void afterTextChanged(Editable e){}});
        }
        return row;
    }
    private String memoryExampleText(int position){
        int style="1".equals(value("ls_augment_rm_recents_memory_style"))?1:0;
        long gib=1024L*1024L*1024L;
        return "示例："+LauncherMemoryPresentation.format(8*gib,3*gib,style,position);
    }
    private View memoryContentExample(EnhancementOption option,int position,boolean dropdown){
        LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(ui.dp(12),ui.dp(8),ui.dp(12),ui.dp(8));
        if(dropdown)row.setBackgroundColor(ui.card);
        String example=memoryExampleText(position);
        row.addView(ui.text(option.choices[position],14,ui.text,true),ui.wrap());
        row.addView(ui.text(example,12,ui.muted,false),ui.wrap());
        row.setContentDescription(option.choices[position]+"，"+example);
        return row;
    }
    private static Set<String> tokens(String value){Set<String> result=new LinkedHashSet<>();for(String token:value.split(","))if(!token.trim().isEmpty())result.add(token.trim());return result;}
    private void refreshInput(String key,String next){
        View view=controls.get(key);if(view instanceof EditText){EditText field=(EditText)view;if(!next.contentEquals(field.getText()))field.setText(next);}
        else if(view instanceof Spinner)((Spinner)view).setSelection(Integer.parseInt(next));
        else if(view instanceof Button)((Button)view).setText(next.isEmpty()?"选择字体文件":"更换字体");
        else if(view instanceof LinearLayout){LinearLayout checks=(LinearLayout)view;Set<String> selected=tokens(next);for(int i=0;i<checks.getChildCount();i++){CheckBox box=(CheckBox)checks.getChildAt(i);box.setChecked(selected.contains(box.getTag()));}}
    }
    private void change(String key,String value,View control){
        if(value.equals(draft.get(key)))return;String normalized=ConfigSchema.normalize(key,value);if(normalized==null)return;
        draft.put(key,normalized);pending.put(key,normalized);main.removeCallbacks(autoSave);main.postDelayed(autoSave,280);
        if("ls_augment_rm_recents_memory_style".equals(key)&&memoryContentAdapter!=null)memoryContentAdapter.notifyDataSetChanged();
        if("ls_augment_rm_recents_memory_color_mode".equals(key))syncMemoryColorsVisibility();
    }
    private void flush(){
        main.removeCallbacks(autoSave);if(pending.isEmpty()||worker.isShutdown())return;
        LinkedHashMap<String,String> batch=new LinkedHashMap<>(pending);pending.clear();
        worker.execute(()->{AppConfig.SaveResult result=config.save(batch);if(result.success){SharedPreferences.Editor memory=gateMemory.edit();for(Map.Entry<String,String> entry:batch.entrySet())memory.putString("value:"+entry.getKey(),entry.getValue());memory.commit();}else runOnUiThread(()->{if(!isDestroyed()){for(Map.Entry<String,String> entry:batch.entrySet())if(entry.getValue().equals(draft.get(entry.getKey())))pending.putIfAbsent(entry.getKey(),entry.getValue());toast("未保存："+result.message);}});});
    }
    private void considerQuery(View view,String title,String summary){if(queryAnchor==null&&!query.isEmpty()&&(title+summary).toLowerCase(Locale.ROOT).contains(query.toLowerCase(Locale.ROOT)))queryAnchor=view;}
    private ScrollView scrollView(){ViewParent parent=body==null?null:body.getParent();while(parent!=null){if(parent instanceof ScrollView)return (ScrollView)parent;parent=parent.getParent();}return null;}
    private NativeEditorController createEditor(String route){
        if("status_layout".equals(route))return new StatusBarEditorController(this,route,true);
        if("mi_health".equals(route))return new HealthEditorController(this,route,true);
        if("launcher_custom".equals(route))return new LauncherEditorController(this,route,true);
        return new FeatureEditorController(this,route,true);
    }
    @Override public void launchEditorResult(NativeEditorController editor,Intent intent,int request){pendingEditor=editor.route;startActivityForResult(intent,request);}
    @Override protected void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);
        if(pendingEditor!=null){NativeEditorController editor=editors.get(pendingEditor);pendingEditor=null;if(editor!=null)editor.onActivityResult(request,result,data);return;}
        if(request!=84||result!=RESULT_OK||data==null||data.getData()==null||fontKey==null)return;
        String key=fontKey;worker.execute(()->{try(InputStream in=getContentResolver().openInputStream(data.getData())){if(in==null)throw new IllegalArgumentException("无法打开文件");String reference=ManagedFont.importFile(this,in);runOnUiThread(()->{if(isDestroyed())return;change(key,reference,controls.get(key));refreshInput(key,reference);});}catch(Exception error){runOnUiThread(()->{if(!isDestroyed())toast("字体未导入："+error.getMessage());});}});
    }
    @Override protected void onResume(){super.onResume();for(NativeEditorController editor:editors.values())editor.onResume();}
    @Override protected void onPause(){for(NativeEditorController editor:editors.values())editor.onPause();flush();super.onPause();}
    @Override protected void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);state.putString("fontKey",fontKey);state.putString("pendingEditor",pendingEditor);ScrollView scroll=scrollView();state.putInt("scrollY",scroll==null?0:scroll.getScrollY());Bundle values=new Bundle();for(Map.Entry<String,String> e:draft.entrySet())values.putString(e.getKey(),e.getValue());state.putBundle("draft",values);Bundle saved=new Bundle();for(Map.Entry<String,NativeEditorController> entry:editors.entrySet()){Bundle b=new Bundle();entry.getValue().onSaveInstanceState(b);saved.putBundle(entry.getKey(),b);}state.putBundle("editors",saved);}
    @Override protected void onDestroy(){main.removeCallbacks(autoSave);flush();for(NativeEditorController editor:editors.values())editor.onDestroy();worker.shutdown();super.onDestroy();}
    private void toast(String message){Toast.makeText(this,message,Toast.LENGTH_LONG).show();}
    private static String entrySection(String route){switch(route){case "audio_gain":return "audio";case "status_layout":return "statusbar";case "launcher_custom":return "launcher";case "signature_install":return "installer";case "combo_speed":return "combo";case "super_resolution":return "performance";case "ai_trigger":return "ai";case "fan_control":return "fan";case "beautify":return "theme";case "double_app":return "double";case "store_download":return "download";case "mi_health":return "health";default:return route;}}
    private static String sectionTitle(String id,String fallback){switch(id){case "freeform":return "小窗与多任务";case "audio":return "音量增强与规则";case "battery":return "电池";case "installer":return "应用安装规则";case "statusbar":return "状态栏";case "launcher":return "桌面与应用图标";case "shoulder":return "肩键";case "combo":return "连招";case "performance":return "性能与超分";case "ai":return "AI 触发器";case "fan":return "风扇";case "double":return "应用双开";case "download":return "下载管理";case "health":return "步数与每日计划";default:return fallback;}}
}
