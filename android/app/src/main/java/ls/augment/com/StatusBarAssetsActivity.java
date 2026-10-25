package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Typeface;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.provider.OpenableColumns;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.*;
import java.text.DateFormat;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Independent asset draft: importing never overwrites a layout editor's transaction. */
public final class StatusBarAssetsActivity extends Activity implements ModuleNavigation.AncestorHandler {
    private static final int IMAGE=301,FONT=302,PACK=303,EXPORT=304;
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor();
    private static final String[] FONT_ROLES={"global","clock","network","metrics","battery","bluetooth","other"};
    private static final String[] FONT_TITLES={"统一字体","时钟","网速","硬件信息","电量数字","蓝牙电量","其他状态栏文字"};
    private final ArrayDeque<String[]> history=new ArrayDeque<>();
    private final LinkedHashMap<String,String> visibilityDraft=new LinkedHashMap<>();
    private final LinkedHashMap<String,String> visibilityBaseline=new LinkedHashMap<>();
    private final Map<String,TextView> rowLabels=new LinkedHashMap<>();
    private final android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
    private boolean foreground,inventoryReading;
    private final Runnable pollInventory=new Runnable(){public void run(){if(!foreground)return;refreshInventory();main.postDelayed(this,1000);}};
    private AppConfig config;
    private UiKit ui;
    private StatusBarThemeSpec theme;
    private StatusBarFontSpec fonts;
    private String savedTheme,savedFonts,selected="",surface="main",query="",group="全部分类";
    private String scope="all",pendingScope="all",entryIcon="";
    private final ArrayDeque<String> selectionHistory=new ArrayDeque<>();
    private String state="default",layer="whole",pageMode="icons",pendingRole="",pendingId="",pendingState="",pendingLayer="";
    private String exportName="",exportAuthor="",exportLicense="";
    private String pendingExportTheme,pendingExportFonts;
    private int filter;
    private boolean saving;
    private LinearLayout body,rows,detail;
    private TextView status,saveStatus,previewStatus;
    private Button apply,undo;
    private Preview preview;
    private JSONObject inventory=new JSONObject();
    private final Map<String,List<JSONObject>> observed=new LinkedHashMap<>();
    private int previewGeneration;

    @Override public void onCreate(Bundle bundle){
        super.onCreate(bundle);config=new AppConfig(this);ui=new UiKit(this);
        for(String name:new String[]{"hidden_icon_slots","hide_wifi_scope","hide_hotspot_scope","hide_mobile_scope","hide_wifi_activity","hide_wifi_standard","hide_mobile_activity","hide_mobile_type","hide_hd_small","hide_hd_large","hide_sim1","hide_sim2","privacy_hide","battery_style"})visibilityBaseline.put(SystemUiOptions.PREFIX+name,config.get(SystemUiOptions.PREFIX+name));
        visibilityBaseline.put(StatusBarVisibilitySpec.KEY,config.get(StatusBarVisibilitySpec.KEY));
        visibilityBaseline.put(StatusBarIconSpacingSpec.KEY,config.get(StatusBarIconSpacingSpec.KEY));
        savedTheme=config.get(StatusBarThemeSpec.KEY);savedFonts=config.get(StatusBarFontSpec.KEY);
        theme=parseTheme(savedTheme);fonts=parseFonts(savedFonts);
        String requestedRoute=getIntent().getStringExtra(ModuleNavigation.EXTRA_ROUTE);
        if(requestedRoute!=null&&requestedRoute.startsWith("asset/")&&StatusBarIconCatalog.find(requestedRoute.substring(6))!=null)entryIcon=selected=requestedRoute.substring(6);
        String requestedScope=getIntent().getStringExtra("status_surface");if(StatusBarSurfaceSpec.validScope(requestedScope))scope=requestedScope;
        if(StatusBarSurfaceSpec.valid(scope))surface=scope;
        String requestedPage=getIntent().getStringExtra("status_assets_page");if("fonts".equals(requestedPage)||"share".equals(requestedPage))pageMode=requestedPage;
        String requestedLayer=getIntent().getStringExtra("status_asset_layer");if(Arrays.asList("whole","background","foreground").contains(requestedLayer))layer=requestedLayer;
        if(bundle!=null){
            theme=parseTheme(bundle.getString("theme",savedTheme));fonts=parseFonts(bundle.getString("fonts",savedFonts));
            savedTheme=bundle.getString("saved-theme",savedTheme);savedFonts=bundle.getString("saved-fonts",savedFonts);
            selected=bundle.getString("selected","");surface=bundle.getString("surface","main");query=bundle.getString("query","");
            scope=bundle.getString("scope","all");pendingScope=bundle.getString("pending-scope","all");entryIcon=bundle.getString("entry-icon",entryIcon);
            ArrayList<String> selections=bundle.getStringArrayList("selection-history");if(selections!=null)selectionHistory.addAll(selections);
            group=bundle.getString("group","全部分类");filter=bundle.getInt("filter");pageMode=bundle.getString("page","icons");
            state=bundle.getString("state","default");layer=bundle.getString("layer","whole");
            pendingRole=bundle.getString("pending-role","");pendingId=bundle.getString("pending-id","");
            pendingState=bundle.getString("pending-state","");pendingLayer=bundle.getString("pending-layer","");
            exportName=bundle.getString("export-name","");exportAuthor=bundle.getString("export-author","");exportLicense=bundle.getString("export-license","");
            pendingExportTheme=bundle.getString("export-theme");pendingExportFonts=bundle.getString("export-fonts");
            restoreVisibility(bundle.getString("visibility","{}"));
            ArrayList<String> old=bundle.getStringArrayList("undo");if(old!=null)for(int i=0;i+2<old.size();i+=3)history.add(new String[]{old.get(i),old.get(i+1),old.get(i+2)});
        }
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT,this::onBackPressed);
        showPage();refreshInventory();
    }
    private static StatusBarThemeSpec parseTheme(String value){StatusBarThemeSpec found=StatusBarThemeSpec.parse(value);return found==null?StatusBarThemeSpec.empty():found;}
    private static StatusBarFontSpec parseFonts(String value){StatusBarFontSpec found=StatusBarFontSpec.parse(value);return found==null?StatusBarFontSpec.empty():found;}
    private boolean dirty(){return !visibilityDraft.isEmpty()||!theme.serialize().equals(parseTheme(savedTheme).serialize())||!fonts.serialize().equals(parseFonts(savedFonts).serialize());}
    private String visibilitySnapshot(){Map<String,String> values=new LinkedHashMap<>(visibilityBaseline);values.putAll(visibilityDraft);return new JSONObject(values).toString();}
    private void remember(){history.push(new String[]{theme.serialize(),fonts.serialize(),visibilitySnapshot()});while(history.size()>20)history.removeLast();}
    private void restoreVisibility(String value){visibilityDraft.clear();try{JSONObject json=new JSONObject(value);Iterator<String> keys=json.keys();while(keys.hasNext()){String key=keys.next();if(visibilityBaseline.containsKey(key)){String clean=ConfigSchema.normalize(key,json.optString(key)),current=config.get(key);visibilityBaseline.put(key,current);if(clean!=null&&!clean.equals(current))visibilityDraft.put(key,clean);}}}catch(Exception ignored){}}
    private void changed(){updateActions();if(preview!=null)loadPreview();}
    private void showPage(){
        if(preview!=null)preview.release();preview=null;previewGeneration++;rows=null;rowLabels.clear();
        getIntent().putExtra(ModuleNavigation.EXTRA_ROUTE,selected.isEmpty()?"status_assets":"asset/"+selected);
        StatusBarIconCatalog.Icon selectedIcon=StatusBarIconCatalog.find(selected);
        body=ui.detailPage(selectedIcon==null?StatusBarPages.title("status_assets"):selectedIcon.title,ScopeRestartDialog.SYSTEM_UI);
        bindHeaderBack(getWindow().getDecorView());
        String[] scopes=new String[StatusBarSurfaceSpec.SCOPES.length];for(int i=0;i<scopes.length;i++)scopes[i]=StatusBarSurfaceSpec.label(StatusBarSurfaceSpec.SCOPES[i]);
        choice(body,"配置作用位置",scopes,Arrays.asList(StatusBarSurfaceSpec.SCOPES).indexOf(scope),index->{scope=StatusBarSurfaceSpec.SCOPES[index];if(StatusBarSurfaceSpec.valid(scope)){surface=scope;indexInventory();}showPage();});
        LinearLayout tabs=row();addButton(tabs,"图标总览",()->{selected="";selectionHistory.clear();pageMode="icons";showPage();});
        addButton(tabs,"字体",()->{selected="";selectionHistory.clear();pageMode="fonts";showPage();});addButton(tabs,"导入与分享",()->{selected="";selectionHistory.clear();pageMode="share";showPage();});body.addView(tabs,ui.margins(0,0,0,8));
        if("fonts".equals(pageMode))showFonts();else if("share".equals(pageMode))showSharing();else if(!selected.isEmpty()&&StatusBarIconCatalog.find(selected)!=null)showDetail();else showInventory();
        LinearLayout actions=row();undo=ui.tonalButton("撤销");undo.setOnClickListener(v->{if(history.isEmpty())return;String[] value=history.pop();theme=parseTheme(value[0]);fonts=parseFonts(value[1]);restoreVisibility(value[2]);showPage();});actions.addView(undo,new LinearLayout.LayoutParams(0,-2,1));
        apply=ui.accentButton("应用到状态栏");apply.setOnClickListener(v->save(false));actions.addView(apply,new LinearLayout.LayoutParams(0,-2,2));body.addView(actions,ui.margins(0,18,0,0));
        saveStatus=ui.text("",12,ui.muted,false);body.addView(saveStatus,ui.margins(0,6,0,0));
        Button reset=ui.tonalButton("恢复图标素材和字体默认设置");reset.setOnClickListener(v->AppDialogs.builder(this).setTitle("恢复素材与字体默认设置？").setMessage("清除图标素材绑定和字体选择。导入的文件继续保存在素材库中，状态栏布局保持现有设置；应用前可撤销。")
                .setNegativeButton("取消",null).setPositiveButton("恢复默认",(d,w)->{remember();theme=StatusBarThemeSpec.empty();fonts=StatusBarFontSpec.empty();showPage();}).show());body.addView(reset,ui.margins(0,8,0,0));updateActions();
    }
    private LinearLayout row(){LinearLayout result=new LinearLayout(this);result.setOrientation(LinearLayout.HORIZONTAL);result.setGravity(Gravity.CENTER_VERTICAL);return result;}
    private void bindHeaderBack(View view){if(view instanceof ImageButton&&"返回上一页".contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))view.setOnClickListener(v->onBackPressed());if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)bindHeaderBack(group.getChildAt(i));}}
    private void addButton(LinearLayout parent,String title,Runnable action){Button button=ui.tonalButton(title);button.setTextSize(12);button.setOnClickListener(v->action.run());parent.addView(button,new LinearLayout.LayoutParams(0,-2,1));}
    private void updateActions(){if(apply==null)return;apply.setEnabled(!saving&&dirty());undo.setEnabled(!saving&&!history.isEmpty());if(saveStatus!=null)saveStatus.setText(saving?"正在保存…":dirty()?"有未应用的更改；当前状态栏仍使用已保存的方案。":"当前素材与字体已保存。关闭主布局开关也可查看图标与管理素材。");}
    private Spinner choice(LinearLayout parent,String title,String[] values,int position,java.util.function.IntConsumer select){
        parent.addView(ui.text(title,12,ui.muted,false),ui.margins(0,parent.getChildCount()==0?0:8,0,3));Spinner spinner=ui.choiceSpinner(title);spinner.setContentDescription(title);spinner.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,values));
        spinner.setSelection(Math.max(0,Math.min(position,values.length-1)));parent.addView(spinner,ui.wrap());
        final int[] previous={spinner.getSelectedItemPosition()};spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int index,long id){if(index!=previous[0]){previous[0]=index;select.accept(index);}}});return spinner;
    }
    private void showInventory(){
        Button pack=ui.accentButton("导入整套图标与字体");pack.setOnClickListener(v->{pageMode="share";showPage();});body.addView(pack,ui.margins(0,0,0,8));
        body.addView(ui.text("常用图标示例 · 点击图样进入编辑，不是实时截图",11,ui.muted,false));
        LinearLayout samples=row();for(String id:new String[]{"airplane","wifi","mobile1","bluetooth","battery","cooling_fan","privacy.dot"}){SampleView sample=new SampleView(id,"default");sample.setClickable(true);sample.setFocusable(true);sample.setContentDescription(StatusBarIconCatalog.find(id).title+"示例，点击编辑");sample.setOnClickListener(v->{selected=id;state="default";layer="whole";showPage();});samples.addView(sample,new LinearLayout.LayoutParams(0,ui.dp(52),1));}body.addView(samples,ui.margins(0,3,0,6));
        String[] surfaces=new String[StatusBarSurfaceSpec.SURFACES.length];for(int i=0;i<surfaces.length;i++)surfaces[i]=StatusBarSurfaceSpec.label(StatusBarSurfaceSpec.SURFACES[i]);
        choice(body,"查看手机实际状态",surfaces,Arrays.asList(StatusBarSurfaceSpec.SURFACES).indexOf(surface),index->{surface=StatusBarSurfaceSpec.SURFACES[index];indexInventory();populate();});
        status=ui.text("正在读取图标状态…",12,ui.muted,false);body.addView(status,ui.margins(0,6,0,4));
        Button refresh=ui.tonalButton("刷新状态");refresh.setOnClickListener(v->refreshInventory());body.addView(refresh,ui.wrap());
        EditText search=new EditText(this);ui.styleInput(search);search.setSingleLine(true);search.setHint("搜索图标，例如蓝牙、Wi-Fi、风扇");search.setContentDescription("搜索系统图标");search.setText(query);body.addView(search,ui.margins(0,8,0,0));
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){query=s.toString();populate();}public void afterTextChanged(Editable e){}});
        LinkedHashSet<String> groups=new LinkedHashSet<>();groups.add("全部分类");for(StatusBarIconCatalog.Icon icon:StatusBarIconCatalog.all())groups.add(icon.group);String[] groupNames=groups.toArray(new String[0]);
        choice(body,"分类",groupNames,Math.max(0,Arrays.asList(groupNames).indexOf(group)),index->{group=groupNames[index];populate();});
        choice(body,"状态筛选",new String[]{"全部图标","正在显示","当前未显示","已自定义"},filter,index->{filter=index;populate();});
        rows=new LinearLayout(this);rows.setOrientation(LinearLayout.VERTICAL);body.addView(rows,ui.margins(0,8,0,0));indexInventory();populate();
    }
    private void refreshInventory(){
        if(inventoryReading)return;inventoryReading=true;
        WORKER.execute(()->{JSONObject result=new JSONObject();String failure="";try{Bundle response=getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"statusbar_inventory_get",null,null);String payload=response==null?"":response.getString("payload","");if(!payload.isEmpty())result=new JSONObject(payload);}catch(Exception e){failure=e.getMessage();}
            final JSONObject next=result;final String error=failure;onUi(()->{inventoryReading=false;Set<String> previousIds=new HashSet<>(observed.keySet());inventory=next;indexInventory();if("icons".equals(pageMode)&&selected.isEmpty()){if(filter==1||filter==2||!previousIds.equals(observed.keySet()))populate();else{if(status!=null)status.setText(snapshotLabel());for(Map.Entry<String,TextView> item:rowLabels.entrySet()){StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(item.getKey());if(icon!=null)item.getValue().setText(item.getValue().getContext().getString(R.string.status_statusbarassetsactivity_38 ,String.valueOf(icon.title+(customized(icon.id)?"  · 已自定义":"")), String.valueOf(currentStatus(icon.id))));}}}else if(!selected.isEmpty())updateDetailStatus();if(!error.isEmpty()&&status!=null)status.setText(status.getContext().getString(R.string.status_statusbarassetsactivity_39 ,String.valueOf(error)));});});
    }
    private void indexInventory(){
        observed.clear();JSONObject surfaces=inventory.optJSONObject("surfaces");JSONArray entries=surfaces==null?null:surfaces.optJSONArray(surface);
        if(entries!=null)for(int i=0;i<entries.length();i++){
            JSONObject item=entries.optJSONObject(i);if(item==null)continue;String id=item.optString("id");
            observed.computeIfAbsent(id,key->new ArrayList<>()).add(item);
            String role=item.optString("activeDataRole");
            if(!role.equals(id)&&(role.equals("mobile_data")||role.startsWith("mobile_data."))&&StatusBarIconCatalog.find(role)!=null)
                observed.computeIfAbsent(role,key->new ArrayList<>()).add(item);
        }
    }
    private String snapshotLabel(){JSONObject times=inventory.optJSONObject("surfaceObservedAt");long time=times==null?inventory.optLong("observedAt"):times.optLong(surface);if(time<=0)return "尚未收到"+StatusBarSurfaceSpec.label(surface)+"的系统界面快照。请进入对应界面观察；当前仍可预先配置素材。";long age=System.currentTimeMillis()-time;boolean observing=false;JSONArray live=inventory.optJSONArray("observedSurfaces");if(live!=null)for(int i=0;i<live.length();i++)if(surface.equals(live.optString(i)))observing=true;return StatusBarSurfaceSpec.label(surface)+"快照 · "+DateFormat.getDateTimeInstance(DateFormat.SHORT,DateFormat.MEDIUM).format(new Date(time))+(age>30000||!observing?"\n这是上次观察的状态，返回对应界面后再刷新。":"\n本位置正在观察；未检测到不等于被隐藏。");}
    private boolean currentlyVisible(String id){List<JSONObject> items=observed.get(id);if(items!=null)for(JSONObject item:items)if("visible".equals(item.optString("state")))return true;return false;}
    private String currentStatus(String id){List<JSONObject> items=observed.get(id);if(items==null||items.isEmpty())return "暂未检测到 · 可预先配置";LinkedHashSet<String> labels=new LinkedHashSet<>();for(JSONObject item:items){String reason=item.optString("reason");String value=item.optString("state");String title="visible".equals(value)?"正在显示":"dot".equals(value)?"显示为溢出圆点":"hidden".equals(value)?"当前未显示":"inactive".equals(value)?"条件未触发":"unsupported".equals(value)?"尚未适配":"状态未知";labels.add(reason.isEmpty()?title:title+" · "+reason);}return String.join("；",labels);}
    private boolean customized(String id){for(StatusBarThemeSpec.Binding binding:theme.entries())if(id.equals(binding.id)&&(scope.equals(binding.surface)||"all".equals(binding.surface)))return true;StatusBarIconSpacingSpec spacing=StatusBarIconSpacingSpec.parse(visibilityValue(StatusBarIconSpacingSpec.KEY));return spacing!=null&&(spacing.explicit(scope,id)!=null||spacing.explicit("all",id)!=null);}
    private void populate(){
        if(rows==null||!"icons".equals(pageMode)||!selected.isEmpty())return;rows.removeAllViews();rowLabels.clear();if(status!=null)status.setText(snapshotLabel());int count=0;String search=query.trim().toLowerCase(Locale.ROOT);
        for(StatusBarIconCatalog.Icon icon:StatusBarIconCatalog.all()){
            if(!"全部分类".equals(group)&&!group.equals(icon.group))continue;if(!search.isEmpty()&&!(icon.title+" "+icon.id+" "+icon.group).toLowerCase(Locale.ROOT).contains(search))continue;
            boolean custom=customized(icon.id),visible=currentlyVisible(icon.id);if(filter==1&&!visible||filter==2&&visible||filter==3&&!custom)continue;
            LinearLayout item=row();item.setTag("navigation:asset/"+icon.id);item.setPadding(ui.dp(7),ui.dp(8),ui.dp(7),ui.dp(8));item.setBackground(ui.roundStroke(ui.accentContainer,12,ui.outline,1));item.setClickable(true);item.setFocusable(true);item.setContentDescription(icon.title+"示例，"+currentStatus(icon.id)+"，打开自定义");
            SampleView sample=new SampleView(icon.id,"default");sample.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);item.addView(sample,new LinearLayout.LayoutParams(ui.dp(42),ui.dp(42)));TextView label=ui.text(icon.title+(custom?"  · 已自定义":"")+"\n"+currentStatus(icon.id),13,ui.text,false);item.addView(label,new LinearLayout.LayoutParams(0,-2,1));rowLabels.put(icon.id,label);
            item.setOnClickListener(v->{selected=icon.id;state="default";layer="whole";showPage();});rows.addView(item,ui.margins(0,4,0,0));count++;
        }
        for(Map.Entry<String,List<JSONObject>> entry:observed.entrySet())if(StatusBarIconCatalog.find(entry.getKey())==null){if(!search.isEmpty()&&!entry.getKey().toLowerCase(Locale.ROOT).contains(search))continue;if(!"全部分类".equals(group))continue;if(filter==3||filter==1&&!currentlyVisible(entry.getKey())||filter==2&&currentlyVisible(entry.getKey()))continue;rows.addView(ui.text("新发现："+entry.getKey()+"\n"+currentStatus(entry.getKey())+" · 等待适配，保留原厂显示",12,ui.muted,false),ui.margins(0,8,0,4));count++;}
        if(count==0)rows.addView(ui.text("没有符合筛选条件的图标。",14,ui.muted,false));
    }
    private void showDetail(){
        StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(selected);detail=ui.card();body.addView(detail,ui.margins(0,8,0,0));
        Button back=ui.tonalButton("返回全部图标");back.setOnClickListener(v->{selected="";selectionHistory.clear();showPage();});detail.addView(back,ui.wrap());
        status=ui.text("",12,ui.muted,false);detail.addView(status,ui.margins(0,8,0,0));updateDetailStatus();
        preview=new Preview();detail.addView(preview,new LinearLayout.LayoutParams(-1,ui.dp(146)));detail.addView(ui.text("语义示例 · 左浅右深，不是原厂截图。整图绑定优先；使用背景和前景分层时，请先清除该图标的整图绑定。",11,ui.muted,false));
        previewStatus=ui.text("",12,ui.muted,false);detail.addView(previewStatus,ui.margins(0,4,0,8));
        if(!Arrays.asList(icon.states).contains(state))state=icon.states[0];if(!Arrays.asList(icon.layers).contains(layer))layer=icon.layers[0];
        String[] states=new String[icon.states.length];for(int i=0;i<states.length;i++)states[i]=StatusBarIconCatalog.stateLabel(icon.states[i]);
        choice(detail,"预览与编辑状态",states,Arrays.asList(icon.states).indexOf(state),index->{state=icon.states[index];showPage();});
        String[] layers=new String[icon.layers.length];for(int i=0;i<layers.length;i++)layers[i]=StatusBarIconCatalog.layerLabel(icon.layers[i]);
        choice(detail,"替换方式与图层",layers,Arrays.asList(icon.layers).indexOf(layer),index->{layer=icon.layers[index];showPage();});
        boolean compositeWhole=StatusBarAssetPolicy.composite(selected)&&"whole".equals(layer);
        boolean blockedWhole=unsupportedWhole();
        detail.addView(ui.text(compositeWhole?"整组包含信号、箭头或电量等独立信息，不能用一张图片代替。请在下方选择子组件，或改用背景 / 前景装饰；已有整图配置会保留并安全回退。":blockedWhole?"动态图标不能用一张默认图代替全部状态。先在上方选择强度、断网或电量状态，再选择对应素材；也可导入包含多状态的素材包。":"“整图”替换这一视觉元素；背景与前景用于分层。动态信号请分别配置强度与断网状态。",11,ui.muted,false),ui.margins(0,5,0,4));
        StatusBarThemeSpec.Binding binding=exact(selected,state,layer);String reference=binding==null?"":binding.asset;
        StatusBarThemeSpec.Binding effective=theme.resolve(selected,new String[]{state,"default"},layer,scope);
        detail.addView(ui.text(reference.isEmpty()?effective==null?"本状态／图层未指定素材":"当前继承"+StatusBarSurfaceSpec.label(effective.surface)+"的素材 · "+assetName(effective.asset,"已导入素材"):"此位置已选择素材 · "+assetName(reference,"素材 "+reference.substring(0,12)),12,ui.muted,false));
        LinearLayout assets=row();addButton(assets,"导入图片或动画",()->pickImage());addButton(assets,"从本地素材选择",this::chooseImage);detail.addView(assets,ui.wrap());
        if(blockedWhole)for(int i=0;i<assets.getChildCount();i++){assets.getChildAt(i).setEnabled(false);assets.getChildAt(i).setAlpha(.45f);}
        Button clear=ui.tonalButton("清除此位置、状态与图层的素材");clear.setEnabled(binding!=null);clear.setOnClickListener(v->{remember();theme=theme.without(selected,state,layer,scope);showPage();});detail.addView(clear,ui.wrap());
        final int startScale=binding==null?100:binding.scale,startX=binding==null?0:binding.offsetX,startY=binding==null?0:binding.offsetY,startOpacity=binding==null?100:binding.opacity;
        slider(detail,"大小",startScale,10,400,"%",value->changeBinding("scale",value));slider(detail,"向右偏移",startX,-64,64," dp",value->changeBinding("x",value));slider(detail,"向下偏移",startY,-64,64," dp",value->changeBinding("y",value));slider(detail,"不透明度",startOpacity,0,100,"%",value->changeBinding("opacity",value));
        Switch original=new Switch(this);original.setChecked(binding!=null&&binding.originalColor);original.setEnabled(binding!=null&&!blockedWhole);detail.addView(ui.featureRow("保留素材原色","关闭后跟随状态栏深浅色。",original));original.setOnCheckedChangeListener((b,on)->changeBinding("color",on?1:0));
        Switch mirror=new Switch(this);mirror.setChecked(binding!=null&&binding.mirror);mirror.setEnabled(binding!=null&&!blockedWhole);detail.addView(ui.featureRow("水平镜像","对当前状态和图层生效。",mirror));mirror.setOnCheckedChangeListener((b,on)->changeBinding("mirror",on?1:0));
        Button restore=ui.tonalButton("清除此位置的全部状态素材");restore.setOnClickListener(v->{remember();theme=theme.without(selected,scope);showPage();});detail.addView(restore,ui.margins(0,8,0,0));showVisibility(detail,selected);
        StatusBarIconSpacingEditor.add(this,ui,detail,scope,selected,()->visibilityValue(StatusBarIconSpacingSpec.KEY),value->visibilityChange(StatusBarIconSpacingSpec.KEY,value),this::showPage,this::spacingDraftSnapshot);
        for(StatusBarIconCatalog.Icon child:StatusBarIconCatalog.all())if(child.id.startsWith(selected+"."))detail.addView(ui.preferenceRow("asset/"+child.id,child.title,"单独设置显示与状态素材",()->{selectionHistory.push(selected);selected=child.id;state="default";layer="whole";showPage();}),ui.wrap());
        loadPreview();
    }
    private void updateDetailStatus(){if(status!=null&&!selected.isEmpty()){String capability="本位置尚未观测，实际适配能力未确认";LinkedHashSet<String> applied=new LinkedHashSet<>();List<JSONObject> items=observed.get(selected);if(items!=null)for(JSONObject item:items){String value=item.optString("capability");if("whole_layers".equals(value))capability="已适配整图与分层素材";else if("observe_only".equals(value))capability="当前只能观察，保持原厂呈现";String reason=item.optString("applicationReason"),covered=item.optString("coveredBy");if(!reason.isEmpty())applied.add(reason);if(!covered.isEmpty())applied.add("由 "+covered+" 的整图素材覆盖");String matched=item.optString("matchedState");if(!matched.isEmpty())applied.add("匹配状态："+StatusBarIconCatalog.stateLabel(matched));}status.setText(status.getContext().getString(R.string.status_statusbarassetsactivity_40 ,String.valueOf(currentStatus(selected)), String.valueOf(capability), String.valueOf((applied.isEmpty()?"":"\n"+String.join("；",applied))), String.valueOf(snapshotLabel())));}}
    private StatusBarThemeSpec.Binding exact(String id,String targetState,String targetLayer){return theme.exact(id,targetState,targetLayer,scope);}
    private boolean unsupportedWhole(){return "whole".equals(layer)&&(StatusBarAssetPolicy.composite(selected)||"default".equals(state)&&StatusBarAssetPolicy.needsLiveState(selected));}
    private Map<String,String> spacingDraftSnapshot(){Map<String,String> values=new LinkedHashMap<>(config.snapshot());values.putAll(visibilityBaseline);values.putAll(visibilityDraft);values.put(StatusBarThemeSpec.KEY,theme.serialize());values.put(StatusBarFontSpec.KEY,fonts.serialize());return values;}
    private static Map<String,String> spacingSaveSnapshot(Map<String,String> live,Map<String,String> changed,String artwork,String typography){Map<String,String> values=new LinkedHashMap<>(live);values.putAll(changed);values.put(StatusBarThemeSpec.KEY,artwork);values.put(StatusBarFontSpec.KEY,typography);return values;}
    private String visibilityValue(String key){return visibilityDraft.getOrDefault(key,visibilityBaseline.getOrDefault(key,config.get(key)));}
    private void visibilityChange(String key,String value){remember();if(value.equals(config.get(key)))visibilityDraft.remove(key);else visibilityDraft.put(key,value);updateActions();}
    private void showVisibility(LinearLayout parent,String id){
        StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.parse(visibilityValue(StatusBarVisibilitySpec.KEY));
        if(visibility==null)visibility=StatusBarVisibilitySpec.parse("");
        final StatusBarVisibilitySpec currentVisibility=visibility;final String targetScope=this.scope;
        Switch hidden=new Switch(this);hidden.setChecked(visibility.explicitlyHidden(targetScope,id));
        parent.addView(ui.featureRow("在"+StatusBarSurfaceSpec.label(targetScope)+"额外隐藏","关闭后继承共享方案及原厂显示条件，不会强制显示尚未出现的图标。",hidden),ui.margins(0,8,0,0));
        if(!visibility.explicitlyHidden(targetScope,id)&&visibility.hidden(targetScope,id))parent.addView(ui.text("当前继承了共享方案或所属图标的隐藏规则。",12,ui.muted,false),ui.wrap());
        hidden.setOnCheckedChangeListener((button,on)->{visibilityChange(StatusBarVisibilitySpec.KEY,currentVisibility.with(targetScope,id,on).serialize());});
        // Existing system-icon rules have one editor in their corresponding
        // network, battery or system-icon page. This page owns only scoped
        // additions, so editing artwork cannot expose a second copy of a switch.
    }
    private void slider(LinearLayout parent,String title,int value,int min,int max,String unit,java.util.function.IntConsumer changed){TextView label=ui.text(title+" · "+value+unit,12,ui.muted,false);parent.addView(label,ui.margins(0,9,0,0));SeekBar bar=ui.slider();bar.setMax(max-min);bar.setProgress(value-min);bar.setEnabled(exact(selected,state,layer)!=null&&!unsupportedWhole());bar.setContentDescription(title);parent.addView(bar,ui.wrap());NumericParameterEditor.linear(ui,bar,title,min,1,unit,label);final int[] last={value};bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onProgressChanged(SeekBar s,int progress,boolean user){label.setText(label.getContext().getString(R.string.status_statusbarassetsactivity_41 ,String.valueOf(title), String.valueOf((progress+min)), String.valueOf(unit)));}public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){int next=s.getProgress()+min;if(next!=last[0]){last[0]=next;changed.accept(next);}}});}
    private void changeBinding(String field,int value){StatusBarThemeSpec.Binding b=exact(selected,state,layer);if(b==null){toast("请先为这个状态和图层选择素材");return;}remember();theme=theme.with(new StatusBarThemeSpec.Binding(b.id,b.state,b.layer,b.asset,"color".equals(field)?value==1:b.originalColor,"scale".equals(field)?value:b.scale,"x".equals(field)?value:b.offsetX,"y".equals(field)?value:b.offsetY,"opacity".equals(field)?value:b.opacity,"mirror".equals(field)?value==1:b.mirror,b.surface));changed();}
    private void assign(String id,String targetState,String targetLayer,String hash,String targetScope){StatusBarThemeSpec.Binding b=theme.exact(id,targetState,targetLayer,targetScope);try{StatusBarThemeSpec next=theme.with(new StatusBarThemeSpec.Binding(id,targetState,targetLayer,hash,b!=null&&b.originalColor,b==null?100:b.scale,b==null?0:b.offsetX,b==null?0:b.offsetY,b==null?100:b.opacity,b!=null&&b.mirror,targetScope));remember();theme=next;showPage();}catch(IllegalArgumentException error){toast("无法应用这个素材："+error.getMessage());}}
    private void pickImage(){pendingId=selected;pendingState=state;pendingLayer=layer;pendingScope=scope;startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*"),IMAGE);}
    private void chooseImage(){String id=selected,targetState=state,targetLayer=layer,targetScope=scope,draft=theme.serialize();WORKER.execute(()->{try{List<StatusBarAssetStore.Asset> assets=StatusBarAssetStore.list(this);Set<String> active=hashes(parseTheme(config.get(StatusBarThemeSpec.KEY))),pending=hashes(parseTheme(draft));String[] names=new String[assets.size()];for(int i=0;i<names.length;i++){StatusBarAssetStore.Asset asset=assets.get(i);names[i]=assetName(asset.hash,asset.name)+" · "+asset.width+"×"+asset.height+(asset.animated?" · 动画":"")+(active.contains(asset.hash)?" · 正在使用":pending.contains(asset.hash)?" · 草稿使用":"");}onUi(()->{if(names.length==0){toast("还没有本地素材，请先导入图片或动画");return;}AppDialogs.builder(this).setTitle("选择本地素材").setItems(names,(d,index)->assign(id,targetState,targetLayer,assets.get(index).hash,targetScope)).setNegativeButton("取消",null).show();});}catch(Exception e){notice("素材库读取失败："+e.getMessage());}});}
    private static Set<String> hashes(StatusBarThemeSpec spec){Set<String> result=new HashSet<>();for(StatusBarThemeSpec.Binding binding:spec.entries())result.add(binding.asset);return result;}
    private void showFonts(){
        final String fontScope=scope;
        body.addView(ui.text("统一字体应用到状态栏文字；每个角色可以单独覆盖或恢复原厂。以下文字使用所选字体实际绘制，缺失字符由系统补充。4G／5G 等原厂图片标志在图标总览中更换素材。",12,ui.muted,false));
        for(int i=0;i<FONT_ROLES.length;i++){String role=FONT_ROLES[i],title=FONT_TITLES[i],value=fonts.get(role,fontScope);LinearLayout card=ui.card();body.addView(card,ui.margins(0,10,0,0));card.addView(ui.section(title,"global".equals(role)&&"inherit".equals(value)?"跟随共享方案 / 原厂字体":fontName(value)));
            TextView sample=ui.text(role.equals("clock")?"12:34  周二  9月29日":role.equals("battery")||role.equals("bluetooth")?"80%  100%":"12:34  5.2 MB/s  36.5°C",23,ui.text,false);sample.setTypeface(Typeface.DEFAULT);sample.setGravity(Gravity.CENTER);card.addView(sample,ui.margins(0,8,0,8));
            String resolved=fonts.resolve(role,fontScope);if(ManagedFont.reference(resolved)){TextView actual=ui.text("正在加载字体…",11,ui.muted,false);card.addView(actual,ui.wrap());WORKER.execute(()->{Typeface face=ManagedFont.load(this,resolved);onUi(()->{if(face!=null){sample.setTypeface(face);actual.setText(actual.getContext().getString(R.string.status_statusbarassetsactivity_42 ,String.valueOf(fontName(resolved))));}else actual.setText(actual.getContext().getString(R.string.status_statusbarassetsactivity_43));});});}
            LinearLayout actions=row();addButton(actions,"导入字体",()->{pendingRole=role;pendingScope=fontScope;startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*").putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"font/ttf","font/otf","application/x-font-ttf","application/x-font-opentype","application/octet-stream"}),FONT);});
            addButton(actions,"选择已导入字体",()->chooseFont(role));card.addView(actions,ui.wrap());
            String[] labels={"跟随共享方案 / 统一字体","使用原厂字体"};Button policy=ui.tonalButton("字体跟随方式");policy.setOnClickListener(v->AppDialogs.builder(this).setTitle(title).setItems(labels,(d,index)->{remember();fonts=fonts.with(role,index==1?"original":"inherit",fontScope);showPage();}).show());card.addView(policy,ui.wrap());
        }
    }
    private String fontName(String value){if("inherit".equals(value)||value==null||value.isEmpty())return "跟随统一字体";if("original".equals(value))return "原厂字体";return getSharedPreferences("statusbar_asset_names",0).getString(value,"已导入字体 · "+value.substring(Math.max(0,value.length()-10)));}
    private String assetName(String hash,String fallback){return getSharedPreferences("statusbar_asset_names",0).getString("image:"+hash,fallback);}
    private void rememberPackNames(StatusBarAssetPack.Preview pack){android.content.SharedPreferences names=getSharedPreferences("statusbar_asset_names",0);android.content.SharedPreferences.Editor edit=names.edit();Set<String> named=new HashSet<>();StatusBarFontSpec imported=parseFonts(pack.fonts);for(int i=0;i<FONT_ROLES.length;i++){String reference=imported.get(FONT_ROLES[i]);if(ManagedFont.reference(reference)&&!names.contains(reference)&&named.add(reference))edit.putString(reference,pack.name+" · "+FONT_TITLES[i]);}for(StatusBarThemeSpec.Binding binding:parseTheme(pack.theme).entries()){String key="image:"+binding.asset;if(!names.contains(key)&&named.add(key)){StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(binding.id);edit.putString(key,pack.name+" · "+(icon==null?binding.id:icon.title));}}edit.apply();}
    private void chooseFont(String role){String targetScope=scope;Set<String> draft=new HashSet<>(fonts.hashes());WORKER.execute(()->{File directory=new File(getFilesDir(),"fonts");File[] files=directory.listFiles((dir,name)->name.matches("[0-9a-f]{64}\\.font"));List<String> refs=new ArrayList<>();if(files!=null)for(File file:files)refs.add("font:"+file.getName().substring(0,64));Collections.sort(refs);Set<String> active=StatusBarAssetReferences.fonts(config.snapshot());String[] names=new String[refs.size()];for(int i=0;i<names.length;i++){String reference=refs.get(i),hash=reference.substring(5);names[i]=fontName(reference)+(active.contains(hash)?" · 正在使用":draft.contains(hash)?" · 草稿使用":"");}onUi(()->{if(refs.isEmpty()){toast("尚未导入字体");return;}AppDialogs.builder(this).setTitle("选择已导入字体").setItems(names,(d,index)->{remember();fonts=fonts.with(role,refs.get(index),targetScope);showPage();}).setNegativeButton("取消",null).show();});});}
    private void showSharing(){
        LinearLayout card=ui.card();body.addView(card,ui.margins(0,8,0,0));card.addView(ui.section("本地导入与社区素材","下载素材包后在这里导入。导入先校验内容，再预览；应用前可以撤销。"));
        Button importPack=ui.tonalButton("导入素材包");importPack.setOnClickListener(v->startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*"),PACK));card.addView(importPack,ui.wrap());
        Button repository=ui.tonalButton("打开社区素材库");repository.setOnClickListener(v->openUrl(StatusBarAssetPack.REPOSITORY_URL));card.addView(repository,ui.wrap());
        Button manage=ui.tonalButton("管理本地图片素材");manage.setOnClickListener(v->manageImages());card.addView(manage,ui.wrap());
        Button export=ui.tonalButton("选择图标和字体导出分享包");export.setOnClickListener(v->exportDialog());card.addView(export,ui.wrap());
        Button submit=ui.tonalButton("向 GitHub 投稿");submit.setOnClickListener(v->AppDialogs.builder(this).setTitle("分享素材").setMessage("先导出分享包，预览确认后在 GitHub 投稿页提交。仅分享你有权分发的素材与字体；本地导入不会自动上传任何内容。")
                .setNegativeButton("关闭",null).setPositiveButton("打开投稿页",(d,w)->openUrl(StatusBarAssetPack.SUBMIT_URL)).show());card.addView(submit,ui.wrap());
        card.addView(ui.text("分享包只包含图标绑定、字体方案及引用的素材文件，不包含设备快照、应用名单或完整设置。",12,ui.muted,false),ui.margins(0,10,0,0));
    }
    private void manageImages(){
        Set<String> protectedHashes=hashes(theme);for(String[] previous:history)protectedHashes.addAll(hashes(parseTheme(previous[0])));
        WORKER.execute(()->{List<StatusBarAssetStore.Asset> assets=StatusBarAssetStore.list(this);Set<String> current=hashes(parseTheme(config.get(StatusBarThemeSpec.KEY)));String[] names=new String[assets.size()];for(int i=0;i<names.length;i++){StatusBarAssetStore.Asset asset=assets.get(i);names[i]=assetName(asset.hash,asset.name)+(current.contains(asset.hash)?" · 正在使用":protectedHashes.contains(asset.hash)?" · 草稿或撤销记录使用":" · 未使用");}
            onUi(()->{if(assets.isEmpty()){toast("尚未导入图片素材");return;}AppDialogs.builder(this).setTitle("本地图片素材").setItems(names,(d,index)->{StatusBarAssetStore.Asset asset=assets.get(index);boolean used=current.contains(asset.hash)||protectedHashes.contains(asset.hash);android.app.AlertDialog.Builder info=AppDialogs.builder(this).setTitle(assetName(asset.hash,asset.name)).setMessage(asset.width+" × "+asset.height+" · "+asset.mime+(asset.animated?" · 动画":"")+"\n"+(used?"正在被已保存方案、草稿或撤销记录使用，不能删除。":"这项素材尚未使用，可以删除本地副本。")).setNegativeButton("关闭",null);if(!used)info.setPositiveButton("删除本地副本",(dialog,which)->WORKER.execute(()->{try{StatusBarAssetStore.deleteUnused(this,asset.hash);getSharedPreferences("statusbar_asset_names",0).edit().remove("image:"+asset.hash).apply();notice("本地素材已删除");}catch(Exception e){notice("没有删除："+e.getMessage());}}));info.show();}).setNegativeButton("关闭",null).show();});});
    }
    private EditText input(LinearLayout parent,String hint,String value){EditText edit=new EditText(this);ui.styleInput(edit);edit.setHint(hint);edit.setContentDescription(hint);edit.setText(value);edit.setSingleLine(true);parent.addView(edit,ui.margins(0,5,0,5));return edit;}
    private void exportDialog(){
        StatusBarThemeSpec sourceTheme=theme;StatusBarFontSpec sourceFonts=fonts;
        LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);form.setPadding(ui.dp(20),ui.dp(8),ui.dp(20),ui.dp(16));
        EditText name=input(form,"素材包名称",exportName),author=input(form,"作者",exportAuthor),license=input(form,"素材与字体的分发许可证",exportLicense);
        form.addView(ui.text("填写实际许可证，例如 CC0-1.0 或 CC-BY-4.0。请确认其中每个素材和字体都允许按该许可分发。",12,ui.muted,false));
        form.addView(ui.text("选择要分享的内容：可只选图标、只选字体，或两者组合。每个图标会包含当前草稿中该图标的全部状态与图层。",12,ui.muted,false),ui.margins(0,10,0,6));
        Map<String,String> iconNames=new LinkedHashMap<>(),fontNames=new LinkedHashMap<>();
        for(StatusBarThemeSpec.Binding binding:sourceTheme.entries()){StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(binding.id);iconNames.put(binding.id,icon==null?binding.id:icon.title);}
        for(int i=0;i<FONT_ROLES.length;i++)for(String fontScope:StatusBarSurfaceSpec.SCOPES){String value=sourceFonts.get(FONT_ROLES[i],fontScope);if(!"inherit".equals(value))fontNames.put(fontScope+"/"+FONT_ROLES[i],StatusBarSurfaceSpec.label(fontScope)+" · "+FONT_TITLES[i]+" · "+fontName(value));}
        Map<String,CheckBox> iconChoices=exportChoices(form,"图标素材",iconNames),fontChoices=exportChoices(form,"字体角色",fontNames);
        ScrollView scroll=new ScrollView(this);scroll.setFillViewport(false);scroll.addView(form,new ScrollView.LayoutParams(-1,-2));
        android.app.AlertDialog dialog=AppDialogs.builder(this).setTitle("导出选中素材").setView(scroll).setNegativeButton("取消",null).setPositiveButton("选择保存位置",null).create();
        dialog.setOnShowListener(v->dialog.getButton(android.app.AlertDialog.BUTTON_POSITIVE).setOnClickListener(button->{
            StatusBarThemeSpec chosenTheme=StatusBarThemeSpec.empty();StatusBarFontSpec chosenFonts=StatusBarFontSpec.empty();
            for(StatusBarThemeSpec.Binding binding:sourceTheme.entries())if(iconChoices.get(binding.id).isChecked())chosenTheme=chosenTheme.with(binding);
            for(Map.Entry<String,CheckBox> choice:fontChoices.entrySet())if(choice.getValue().isChecked()){String[] role=choice.getKey().split("/",2);chosenFonts=chosenFonts.with(role[1],sourceFonts.get(role[1],role[0]),role[0]);}
            if(chosenTheme.entries().isEmpty()&&chosenFonts.serialize().isEmpty()){toast("请至少选择一个图标或字体角色");return;}
            if(name.getText().toString().trim().isEmpty()||author.getText().toString().trim().isEmpty()||license.getText().toString().trim().isEmpty()){toast("请填写名称、作者与许可证");return;}
            exportName=name.getText().toString().trim();exportAuthor=author.getText().toString().trim();exportLicense=license.getText().toString().trim();
            pendingExportTheme=chosenTheme.serialize();pendingExportFonts=chosenFonts.serialize();
            dialog.dismiss();startActivityForResult(new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("application/zip").putExtra(Intent.EXTRA_TITLE,"RedMagicDuo-assets-"+System.currentTimeMillis()+".zip"),EXPORT);
        }));dialog.show();
    }
    private Map<String,CheckBox> exportChoices(LinearLayout parent,String title,Map<String,String> names){
        Map<String,CheckBox> choices=new LinkedHashMap<>();parent.addView(ui.section(title,names.isEmpty()?"当前没有可分享的设置":"默认全选，可单独取消；未明确设置的继承字体不导出。"),ui.margins(0,10,0,4));
        if(!names.isEmpty()){LinearLayout actions=row();addButton(actions,"全选",()->{for(CheckBox check:choices.values())check.setChecked(true);});addButton(actions,"清除选择",()->{for(CheckBox check:choices.values())check.setChecked(false);});parent.addView(actions,ui.wrap());}
        for(Map.Entry<String,String> entry:names.entrySet()){CheckBox check=new CheckBox(this);check.setText(entry.getValue());check.setTextColor(ui.text);check.setTextSize(14);check.setChecked(true);check.setContentDescription(title+"："+entry.getValue());choices.put(entry.getKey(),check);parent.addView(check,ui.wrap());}return choices;
    }
    private void openUrl(String url){try{startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(url)));}catch(android.content.ActivityNotFoundException e){toast("未找到可以打开链接的浏览器");}}
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(result!=RESULT_OK||data==null||data.getData()==null){if(request==EXPORT){pendingExportTheme=null;pendingExportFonts=null;}return;}Uri uri=data.getData();String role=pendingRole,id=pendingId,targetState=pendingState,targetLayer=pendingLayer,targetScope=pendingScope;String exportTheme=pendingExportTheme,exportFonts=pendingExportFonts,packageName=exportName,packageAuthor=exportAuthor,packageLicense=exportLicense;if(request==EXPORT){pendingExportTheme=null;pendingExportFonts=null;if(exportTheme==null||exportFonts==null||exportTheme.isEmpty()&&exportFonts.isEmpty()){toast("导出选择已失效，请重新选择素材");return;}}
        WORKER.execute(()->{try{
            if(request==IMAGE){String hash,name=displayName(uri);try(InputStream input=getContentResolver().openInputStream(uri)){if(input==null)throw new IOException("无法读取图片");hash=StatusBarAssetStore.importFile(this,input,name);}getSharedPreferences("statusbar_asset_names",0).edit().putString("image:"+hash,name).apply();onUi(()->{assign(id,targetState,targetLayer,hash,targetScope);toast("素材已导入，预览后点击应用");});}
            else if(request==FONT){String ref,name=displayName(uri);try(InputStream input=getContentResolver().openInputStream(uri)){if(input==null)throw new IOException("无法读取字体");ref=ManagedFont.importFile(this,input);}getSharedPreferences("statusbar_asset_names",0).edit().putString(ref,name).apply();onUi(()->{remember();fonts=fonts.with(role,ref,targetScope);showPage();toast("字体已导入，预览后点击应用");});}
            else if(request==PACK){StatusBarAssetPack.Preview inspected;try(InputStream input=getContentResolver().openInputStream(uri)){if(input==null)throw new IOException("无法读取素材包");inspected=StatusBarAssetPack.inspect(input);}onUi(()->AppDialogs.builder(this).setTitle("素材包预检").setMessage(inspected.summary()+"\n\n只替换包内涉及图标的状态与图层、明确指定的字体角色，其余草稿保留。应用前可以撤销。").setNegativeButton("取消",null).setPositiveButton("载入并预览",(d,w)->WORKER.execute(()->{try{StatusBarAssetPack.install(this,inspected);rememberPackNames(inspected);onUi(()->{try{Map<String,String> current=new LinkedHashMap<>();current.put(StatusBarThemeSpec.KEY,theme.serialize());current.put(StatusBarFontSpec.KEY,fonts.serialize());Map<String,String> values=StatusBarAssetPack.merge(current,inspected);remember();theme=parseTheme(values.get(StatusBarThemeSpec.KEY));fonts=parseFonts(values.get(StatusBarFontSpec.KEY));selected="";pageMode="icons";showPage();toast("已载入素材包，预览后点击应用");}catch(Exception error){toast("素材包未合并："+error.getMessage());}});}catch(Exception e){notice("素材包未导入："+e.getMessage());}})).show());}
            else if(request==EXPORT){Map<String,String> values=new LinkedHashMap<>();values.put(StatusBarThemeSpec.KEY,exportTheme);values.put(StatusBarFontSpec.KEY,exportFonts);try(OutputStream output=getContentResolver().openOutputStream(uri,"wt")){if(output==null)throw new IOException("无法写入文件");StatusBarAssetPack.export(this,values,packageName,packageAuthor,packageLicense,output);}notice("选中素材的分享包已导出");}
        }catch(Exception e){notice("操作未完成："+e.getMessage());}});
    }
    private String displayName(Uri uri){try(Cursor cursor=getContentResolver().query(uri,new String[]{OpenableColumns.DISPLAY_NAME},null,null,null)){if(cursor!=null&&cursor.moveToFirst()){String name=cursor.getString(0);if(name!=null&&!name.isEmpty())return name;}}catch(Exception ignored){}return "导入的素材";}
    private StatusBarMobileSpacingResolver.Validation spacingValidation(Map<String,String> before,Map<String,String> draft){
        StatusBarMobileSpacingResolver.Validation mobile=StatusBarMobileSpacingResolver.validateChanges(this,before,draft);if(!mobile.allowed)return mobile;
        StatusBarMobileSpacingResolver.Validation circle=StatusBarCircleSpacingResolver.validateWifiChanges(this,before,draft);if(!circle.allowed)return circle;
        return circle.deferred?circle:mobile;
    }
    private void save(boolean finishAfter){
        if(saving)return;if(!dirty()){if(finishAfter)finishExit();return;}String artwork=theme.serialize(),typography=fonts.serialize();Map<String,String> changedVisibility=new LinkedHashMap<>(visibilityDraft);Map<String,String> beforeSpacing=config.snapshot(),draftSpacing=spacingSaveSnapshot(beforeSpacing,changedVisibility,artwork,typography);StatusBarMobileSpacingResolver.Validation spacing=spacingValidation(beforeSpacing,draftSpacing);if(!spacing.allowed){toast(spacing.message);return;}saving=true;updateActions();
        WORKER.execute(()->{try{Map<String,String> values=new LinkedHashMap<>(changedVisibility);values.put(StatusBarThemeSpec.KEY,artwork);values.put(StatusBarFontSpec.KEY,typography);AppConfig.SaveResult result=config.save(values);onUi(()->{saving=false;if(result.success){savedTheme=artwork;savedFonts=typography;for(Map.Entry<String,String> entry:changedVisibility.entrySet()){visibilityBaseline.put(entry.getKey(),entry.getValue());if(entry.getValue().equals(visibilityDraft.get(entry.getKey())))visibilityDraft.remove(entry.getKey());}toast(spacing.deferred?spacing.message:result.runtimeSynced?"素材、字体与已修改的显示设置已应用":"已保存，等待模块同步后生效");if(finishAfter){finishExit();return;}}else toast("保存失败："+result.message);updateActions();});}catch(Exception error){onUi(()->{saving=false;toast("保存未完成："+error.getMessage());updateActions();});}});
    }
    // onCreate explicitly routes the platform back gesture to this shared handler.
    @android.annotation.SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed(){
        if(saving){toast("正在保存，请稍候");return;}
        if(!selectionHistory.isEmpty()){selected=selectionHistory.pop();state="default";layer="whole";showPage();return;}
        if(!entryIcon.isEmpty()&&entryIcon.equals(selected)){requestExit(this::finish);return;}
        if(!selected.isEmpty()){selected="";showPage();return;}
        requestExit(this::finish);
    }
    private Runnable exitAction;
    private void finishExit(){Runnable action=exitAction;exitAction=null;if(action!=null)action.run();else finish();}
    private void requestExit(Runnable action){
        if(saving){toast("正在保存，请稍候");return;}
        if(!dirty()){action.run();return;}
        AppDialogs.builder(this).setTitle("还有未应用的更改").setMessage("是否应用当前素材、字体与已修改的显示设置？")
            .setNegativeButton("放弃更改",(d,w)->action.run()).setNeutralButton("继续编辑",null)
            .setPositiveButton("应用并返回",(d,w)->{exitAction=action;save(true);}).show();
    }
    @Override public void navigateToAncestor(String route){
        if("status_assets".equals(route)){selected="";selectionHistory.clear();showPage();return;}
        requestExit(()->ModuleNavigation.returnTo(this,route));
    }

    @Override protected void onSaveInstanceState(Bundle out){super.onSaveInstanceState(out);out.putString("scope",scope);out.putString("pending-scope",pendingScope);out.putString("entry-icon",entryIcon);out.putStringArrayList("selection-history",new ArrayList<>(selectionHistory));out.putString("theme",theme.serialize());out.putString("fonts",fonts.serialize());out.putString("saved-theme",savedTheme);out.putString("saved-fonts",savedFonts);out.putString("visibility",visibilitySnapshot());out.putString("selected",selected);out.putString("surface",surface);out.putString("query",query);out.putString("group",group);out.putInt("filter",filter);out.putString("page",pageMode);out.putString("state",state);out.putString("layer",layer);out.putString("pending-role",pendingRole);out.putString("pending-id",pendingId);out.putString("pending-state",pendingState);out.putString("pending-layer",pendingLayer);out.putString("export-name",exportName);out.putString("export-author",exportAuthor);out.putString("export-license",exportLicense);out.putString("export-theme",pendingExportTheme);out.putString("export-fonts",pendingExportFonts);ArrayList<String> old=new ArrayList<>();int length=0;for(String[] value:history){length+=value[0].length()+value[1].length()+value[2].length();if(length>64*1024)break;Collections.addAll(old,value);}out.putStringArrayList("undo",old);}
    private void onUi(Runnable action){runOnUiThread(()->{if(!isFinishing()&&!isDestroyed())action.run();});}
    private void toast(String message){Toast.makeText(this,message,Toast.LENGTH_LONG).show();}
    private void notice(String message){onUi(()->toast(message));}
    private void loadPreview(){
        if(preview==null)return;Preview target=preview;int generation=++previewGeneration;StatusBarThemeSpec snapshot=theme;String id=selected,previewState=state,previewScope=scope;
        WORKER.execute(()->{LinkedHashMap<String,Drawable> art=new LinkedHashMap<>();LinkedHashMap<String,StatusBarThemeSpec.Binding> bindings=new LinkedHashMap<>();String error="";
            for(String part:new String[]{"whole","background","foreground"}){if(art.containsKey("whole"))break;StatusBarAssetPolicy.Resolution resolution=StatusBarAssetPolicy.resolve(snapshot,id,new String[]{previewState,"default"},part,previewScope);StatusBarThemeSpec.Binding binding=resolution.binding;if(binding==null){if(!"native_unmapped".equals(resolution.code))error=resolution.reason;continue;}try{art.put(part,StatusBarAssetStore.decode(StatusBarAssetStore.read(this,binding.asset),512));bindings.put(part,binding);}catch(Exception e){error="素材读取失败，实际使用时保留原厂："+e.getMessage();}}
            final String message=error;onUi(()->{if(generation!=previewGeneration||target!=preview)return;target.set(art,bindings);if(previewStatus!=null)previewStatus.setText(!message.isEmpty()?message:art.isEmpty()?"此状态沿用原厂图标。":"此状态已匹配素材；应用后可在上方核对手机实际结果。");});});
    }
    private final class SampleView extends View {
        private final StatusBarIconSamples painter=new StatusBarIconSamples();
        private final RectF sampleBounds=new RectF();
        private final String id,sampleState;
        SampleView(String id,String state){super(StatusBarAssetsActivity.this);this.id=id;sampleState=state;}
        @Override protected void onDraw(Canvas canvas){super.onDraw(canvas);float size=Math.min(getWidth(),getHeight())*.64f;float x=(getWidth()-size)/2,y=(getHeight()-size)/2;sampleBounds.set(x,y,x+size,y+size);painter.draw(canvas,id,sampleState,sampleBounds,ui.text);}
    }
    private final class Preview extends View {
        private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        private final StatusBarIconSamples samples=new StatusBarIconSamples();
        private final RectF sampleBounds=new RectF();
        private final Map<String,Drawable> art=new LinkedHashMap<>();
        private final Map<String,StatusBarThemeSpec.Binding> bindings=new LinkedHashMap<>();
        private boolean rendering;
        private final PorterDuffColorFilter lightTint=new PorterDuffColorFilter(0xff152034,PorterDuff.Mode.SRC_IN),darkTint=new PorterDuffColorFilter(Color.WHITE,PorterDuff.Mode.SRC_IN);
        Preview(){super(StatusBarAssetsActivity.this);setContentDescription("当前状态的素材浅色和深色背景示例");}
        void set(Map<String,Drawable> images,Map<String,StatusBarThemeSpec.Binding> styles){release();art.putAll(images);bindings.putAll(styles);for(Drawable drawable:art.values()){drawable.setCallback(this);if(drawable instanceof Animatable&&foreground&&isShown())((Animatable)drawable).start();}invalidate();}
        void release(){for(Drawable drawable:art.values()){if(drawable instanceof Animatable)((Animatable)drawable).stop();drawable.setCallback(null);}art.clear();bindings.clear();}
        @Override protected boolean verifyDrawable(Drawable drawable){return art.containsValue(drawable)||super.verifyDrawable(drawable);}
        // A shared preview drawable is tinted twice. Synchronous appearance setters
        // must not schedule a new frame; decoder callbacks outside draw still do.
        @Override public void invalidateDrawable(Drawable drawable){if(!rendering)super.invalidateDrawable(drawable);}
        @Override protected void onDetachedFromWindow(){for(Drawable drawable:art.values())if(drawable instanceof Animatable)((Animatable)drawable).stop();super.onDetachedFromWindow();}
        @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);for(Drawable drawable:art.values())if(drawable instanceof Animatable){if(visibility==VISIBLE&&foreground)((Animatable)drawable).start();else ((Animatable)drawable).stop();}}
        @Override protected void onDraw(Canvas canvas){
            super.onDraw(canvas);float half=getWidth()/2f;rendering=true;try{
            for(int side=0;side<2;side++){
                float left=side*half,x=left+half/2,y=getHeight()/2f-ui.dp(10);
                paint.setColor(side==0?0xfff2f5fa:0xff17202e);canvas.drawRoundRect(left+ui.dp(4),ui.dp(12),left+half-ui.dp(4),getHeight()-ui.dp(12),ui.dp(14),ui.dp(14),paint);
                int tint=side==0?0xff152034:Color.WHITE;paint.setColor(tint);paint.setTextSize(ui.dp(12));paint.setTextAlign(Paint.Align.CENTER);canvas.drawText(side==0?"浅色背景":"深色背景",x,getHeight()-ui.dp(25),paint);
                canvas.save();canvas.clipRect(left+ui.dp(5),ui.dp(13),left+half-ui.dp(5),getHeight()-ui.dp(40));
                drawLayer(canvas,"background",x,y,tint);
                if(art.containsKey("whole"))drawLayer(canvas,"whole",x,y,tint);
                else {sampleBounds.set(x-ui.dp(25),y-ui.dp(25),x+ui.dp(25),y+ui.dp(25));samples.draw(canvas,selected,state,sampleBounds,tint);}
                drawLayer(canvas,"foreground",x,y,tint);canvas.restore();
            }}finally{rendering=false;}
        }
        private void drawLayer(Canvas canvas,String part,float centerX,float centerY,int tint){
            Drawable drawable=art.get(part);if(drawable==null)return;StatusBarThemeSpec.Binding binding=bindings.get(part);
            float size=ui.dp(50)*binding.scale/100f,ratio=Math.min(size/Math.max(1,drawable.getIntrinsicWidth()),size/Math.max(1,drawable.getIntrinsicHeight()));
            int width=Math.max(1,Math.round(drawable.getIntrinsicWidth()*ratio)),height=Math.max(1,Math.round(drawable.getIntrinsicHeight()*ratio));
            canvas.save();canvas.translate(centerX+ui.dp(binding.offsetX),centerY+ui.dp(binding.offsetY));if(binding.mirror)canvas.scale(-1,1);
            drawable.setBounds(-width/2,-height/2,(width+1)/2,(height+1)/2);int alpha=binding.opacity*255/100;if(drawable.getAlpha()!=alpha)drawable.setAlpha(alpha);drawable.setColorFilter(binding.originalColor?null:tint==Color.WHITE?darkTint:lightTint);drawable.draw(canvas);canvas.restore();
        }
    }
    @Override protected void onPause(){foreground=false;main.removeCallbacks(pollInventory);if(preview!=null)for(Drawable drawable:preview.art.values())if(drawable instanceof Animatable)((Animatable)drawable).stop();super.onPause();}
    @Override protected void onResume(){super.onResume();foreground=true;main.removeCallbacks(pollInventory);main.post(pollInventory);if(preview!=null)for(Drawable drawable:preview.art.values())if(drawable instanceof Animatable)((Animatable)drawable).start();}
    @Override protected void onDestroy(){foreground=false;main.removeCallbacks(pollInventory);previewGeneration++;if(preview!=null)preview.release();super.onDestroy();}
}
