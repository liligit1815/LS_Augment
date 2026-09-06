package ls.augment.com;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.*;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** One draft, one preview and one atomic Apply across all status-bar tabs. */
public final class StatusBarSettingsActivity extends Activity {
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final LinkedHashMap<String, String> draft = new LinkedHashMap<>();
    private AppConfig config;
    private UiKit ui;
    private LinearLayout content;
    private ScrollView configScroll;
    private Preview preview;
    private Button apply;
    private StatusBarGridSpec grid;
    private int tab;
    private boolean loading, saving, dirty;
    private long generation;
    private final android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
    private final Runnable autoSave=()->save();
    private Button reset;
    private final Map<String,Switch> controls=new LinkedHashMap<>();
    private UiKit.Fold sectionFold;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        config = new AppConfig(this); ui = new UiKit(this);
        for (String key : ConfigSchema.keys()) if (key.startsWith("ls_augment_statusbar_")
                || key.equals(ConfigSchema.SYSTEMUI_MASTER)) draft.put(key, config.get(key));
        if (state != null) {
            Bundle saved = state.getBundle("draft");
            if (saved != null) for (String key : draft.keySet())
                if (saved.containsKey(key)) draft.put(key, saved.getString(key));
            tab = state.getInt("tab");
        }
        grid = StatusBarGridSpec.parse(draft.get(ConfigSchema.STATUSBAR_GRID));
        if (grid == null) grid = StatusBarGridSpec.defaults();
        LinearLayout page = new LinearLayout(this);page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(0,0,0,0);page.setBackground(ui.backgroundDrawable());
        setContentView(page);ui.applyGestureInset(page,0);
        LinearLayout header=ui.header("状态栏",true);header.setPadding(ui.dp(10),ui.dp(4),ui.dp(12),ui.dp(2));ScopeRestartDialog.addButton(this,ui,header,ScopeRestartDialog.SYSTEM_UI);page.addView(header);page.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(ui.dp(14),ui.dp(10),ui.dp(14),0);page.addView(body,new LinearLayout.LayoutParams(-1,0,1));
        body.addView(ui.text("选择显示区域和大小，修改后自动保存，预览实时更新。", 12, ui.muted, false), ui.margins(0, 8, 0, 10));
        preview = new Preview(); body.addView(preview, new LinearLayout.LayoutParams(-1, ui.dp(100)));
        LinearLayout tabs = new LinearLayout(this);
        String[] names = {"布局", "时钟", "硬件 / 网速", "图标"};
        for (int i = 0; i < names.length; i++) {
            final int selected = i; Button button = ui.tonalButton(names[i]); button.setTextSize(11);
            button.setOnClickListener(v -> { tab = selected; render(); });
            LinearLayout.LayoutParams tabParams=new LinearLayout.LayoutParams(0,ui.dp(44),1);if(i>0)tabParams.setMargins(ui.dp(6),0,0,0);tabs.addView(button,tabParams);
        }
        body.addView(tabs);
        configScroll=new ScrollView(this);configScroll.setFillViewport(true);
        content = new LinearLayout(this); content.setOrientation(LinearLayout.VERTICAL);content.setPadding(0,ui.dp(8),0,ui.dp(12));
        configScroll.addView(content,new ScrollView.LayoutParams(-1,-2));
        body.addView(configScroll,new LinearLayout.LayoutParams(-1,0,1));
        LinearLayout actions = new LinearLayout(this);
        reset = ui.tonalButton("恢复默认");
        reset.setOnClickListener(v -> {
            for (String key : draft.keySet()) draft.put(key, ConfigSchema.defaultValue(key));
            grid = StatusBarGridSpec.defaults(); changed(); render();
        });
        apply = ui.accentButton("应用");
        apply.setOnClickListener(v -> save());

        render();
    }

    private void render() {
        loading = true; sectionFold=null;controls.clear();content.removeAllViews();configScroll.scrollTo(0,0);
        if (tab == 0) {
            toggle(ConfigSchema.SYSTEMUI_MASTER, "启用状态栏增强");
            content.addView(ui.text("关闭总开关会恢复系统布局。各组件可以单独选上排、下排或跨两排；空间不足时自动缩小，避开屏幕开孔。", 12, ui.muted, false));
            number(ConfigSchema.STATUSBAR_HEIGHT_DP, "状态栏高度（0 跟随系统）", 0, 80);
            number(ConfigSchema.STATUSBAR_LEFT_MARGIN_DP, "左侧留白", 0, 40);
            number(ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP, "右侧留白", 0, 40);
            number(ConfigSchema.STATUSBAR_TOP_MARGIN_DP, "顶部留白", 0, 12);
            number(ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP, "底部留白", 0, 12);
            number(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP, "两排间距", 0, 8);
        } else if (tab == 1) {
            component("clock", "时钟");
            toggle(ConfigSchema.STATUSBAR_CLOCK_CUSTOM, "自定义时钟文字");
            LinearLayout presets = new LinearLayout(this);
            String[][] patterns = {{"单行", "HH:mm", ""}, {"双行", "HH:mm", "MM/dd E"}};
            for (String[] p : patterns) {
                Button b = ui.tonalButton(p[0]);
                b.setOnClickListener(v -> {
                    draft.put(ConfigSchema.STATUSBAR_CLOCK_ROWS,p[2].isEmpty()?"1":"2");
                    draft.put(ConfigSchema.STATUSBAR_CLOCK_CUSTOM, "1");
                    draft.put(ConfigSchema.STATUSBAR_CLOCK_PATTERN, p[1]);
                    draft.put(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND, p[2]);
                    StatusBarGridSpec.Item old = grid.get("clock");
                    if (!p[2].isEmpty()) grid = grid.with("clock", new StatusBarGridSpec.Item(old.zone.substring(0, 1) + "S", old.order, old.size, true));
                    changed(); render();
                });
                presets.addView(b, new LinearLayout.LayoutParams(0, -2, 1));
            }
            content.addView(presets);
            edit(ConfigSchema.STATUSBAR_CLOCK_PATTERN, "第一行格式，例如 HH:mm");
            edit(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND, "第二行格式，留空为单行");
            toggle(ConfigSchema.STATUSBAR_CLOCK_24H, "默认使用 24 小时制");
            toggle(ConfigSchema.STATUSBAR_CLOCK_SECONDS, "默认显示秒");
            toggle(ConfigSchema.STATUSBAR_CLOCK_WEEK, "默认显示星期");
        } else if (tab == 2) {
            content.addView(ui.text("硬件温度：CPU、GPU、电池可分别开关，并单独设置显示区域、大小和顺序。", 12, ui.muted, false));
            for (int i = 4; i < StatusBarGridSpec.IDS.length; i++) component(StatusBarGridSpec.IDS[i], StatusBarGridSpec.LABELS[i]);
        } else {
            content.addView(ui.text("双排图标统一使用状态栏的上下两排，可选择左侧、中间或右侧；间距跟随布局页设置。", 12, ui.muted, false));
            for (int i = 1; i < 4; i++) component(StatusBarGridSpec.IDS[i], StatusBarGridSpec.LABELS[i]);
            number(ConfigSchema.STATUSBAR_NOTIFICATION_MAX, "通知数量（0 跟随系统）", 0, 20);
        }
        if(tab==0||tab==1){
            String key=tab==0?ConfigSchema.SYSTEMUI_MASTER:ConfigSchema.STATUSBAR_CLOCK_CUSTOM;
            Switch control=controls.get(key);LinearLayout row=(LinearLayout)control.getParent();int index=content.indexOfChild(row);
            LinearLayout card=ui.card(),body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
            content.removeView(row);card.addView(row);
            while(content.getChildCount()>index){View child=content.getChildAt(index);content.removeViewAt(index);body.addView(child);}
            card.addView(body);content.addView(card,ui.margins(0,8,0,8));sectionFold=ui.fold(control,body);
        }
        if(reset.getParent()!=null)((android.view.ViewGroup)reset.getParent()).removeView(reset);content.addView(reset,ui.margins(0,20,0,0));
        loading = false; preview.invalidate();
    }

    private void component(String id, String title) {
        LinearLayout card = ui.card(); content.addView(card, ui.margins(0, 8, 0, 8));
        StatusBarGridSpec.Item item = grid.get(id);
        Switch visible = new Switch(this);visible.setChecked(item.visible);card.addView(ui.featureRow(title,"",visible));
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);card.addView(body);UiKit.Fold fold=ui.fold(visible,body);
        card=body;
        visible.setOnCheckedChangeListener((button, checked) -> {fold.sync();updateItem(id,null,-1,-1,checked);});
        if(id.equals("notifications"))toggle(card,ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,"通知图标分两排");
        if(id.equals("system_icons"))toggle(card,ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,"系统图标分两排");
        if(id.equals("network")){
            card.addView(ui.text("显示方式",12,ui.muted,false));
            Spinner mode=new Spinner(this);
            mode.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,StatusBarNetworkDisplay.LABELS));
            mode.setSelection(networkMode()-1);card.addView(mode);
            mode.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
                public void onNothingSelected(AdapterView<?> parent){}
                public void onItemSelected(AdapterView<?> parent,View view,int position,long rowId){
                    if(loading||position+1==networkMode())return;
                    draft.put(ConfigSchema.STATUSBAR_NETWORK_DISPLAY,String.valueOf(position+1));
                    draft.put(ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,position==3?"1":"0");
                    changed();renderKeepingScroll();
                }
            });
        }
        if(id.equals("clock")){
            card.addView(ui.text("显示排数",12,ui.muted,false));Spinner rows=new Spinner(this);
            rows.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,new String[]{"单排","双排"}));rows.setSelection(number(ConfigSchema.STATUSBAR_CLOCK_ROWS)-1);card.addView(rows);
            rows.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int pos,long rowId){if(!loading&&number(ConfigSchema.STATUSBAR_CLOCK_ROWS)!=pos+1){draft.put(ConfigSchema.STATUSBAR_CLOCK_ROWS,""+(pos+1));changed();renderKeepingScroll();}}});
        }
        Spinner zone = new Spinner(this);
        boolean paired=isTwoRows(id);
        String[] zones=paired?new String[]{"LS","CS","RS"}:StatusBarGridSpec.ZONES;
        String[] labels=paired?new String[]{"左侧（上下两排）","中间（上下两排）","右侧（上下两排）"}:StatusBarGridSpec.ZONE_LABELS;
        zone.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, labels));
        zone.setSelection(java.util.Arrays.asList(zones).indexOf(paired?item.zone.substring(0,1)+"S":item.zone)); card.addView(zone);
        zone.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(AdapterView<?> p, View v, int position, long ignored) {
                String current=grid.get(id).zone;
                if (!(paired?current.substring(0,1)+"S":current).equals(zones[position])) updateItem(id, zones[position], -1, -1, null);
            }
            @Override public void onNothingSelected(AdapterView<?> p) { }
        });
        slider(card, "大小", item.size, 6, 32, value -> updateItem(id, null, -1, value, null));
        slider(card, "区内顺序", item.order, 0, 20, value -> updateItem(id, null, value, -1, null));
    }
    private void updateItem(String id, String zone, int order, int size, Boolean visible) {
        if (loading) return;
        StatusBarGridSpec.Item old = grid.get(id);
        grid = grid.with(id, new StatusBarGridSpec.Item(zone == null ? old.zone : zone,
                order < 0 ? old.order : order, size < 0 ? old.size : size, visible == null ? old.visible : visible));
        changed();
    }
    private void toggle(String key, String label) {
        toggle(content,key,label);
    }
    private void renderKeepingScroll(){int y=configScroll.getScrollY();render();configScroll.post(()->configScroll.scrollTo(0,y));}
    private void toggle(LinearLayout parent,String key, String label) {
        Switch s = new Switch(this);s.setChecked(ConfigSchema.truthy(draft.get(key)));controls.put(key,s);parent.addView(ui.featureRow(label,"",s),ui.margins(0,4,0,4));
        s.setOnCheckedChangeListener((b, checked) -> { if (!loading) { draft.put(key, checked ? "1" : "0"); changed();
            if(key.equals(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS)||key.equals(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS))renderKeepingScroll();
        } });
    }
    private void edit(String key, String label) {
        content.addView(ui.text(label, 12, ui.muted, false));
        EditText e = new EditText(this); e.setSingleLine(true); e.setText(draft.get(key)); content.addView(e);
        e.addTextChangedListener(new android.text.TextWatcher() {
            public void beforeTextChanged(CharSequence s, int a, int c, int n) { }
            public void onTextChanged(CharSequence s, int a, int b, int c) { if (!loading) { draft.put(key, s.toString()); changed(); } }
            public void afterTextChanged(android.text.Editable e) { }
        });
    }
    private interface ValueChanged { void set(int value); }
    private void number(String key, String label, int min, int max) {
        int value; try { value = Integer.parseInt(draft.get(key)); } catch (Exception e) { value = min; }
        slider(content, label, value, min, max, v -> { draft.put(key, String.valueOf(v)); changed(); });
    }
    private void slider(LinearLayout parent, String label, int value, int min, int max, ValueChanged changed) {
        TextView text = ui.text(label + " · " + value, 12, ui.muted, false); parent.addView(text);
        SeekBar bar = new SeekBar(this); bar.setMax(max - min); bar.setProgress(value - min); parent.addView(bar);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar b, int p, boolean fromUser) {
                text.setText(label + " · " + (p + min)); if (fromUser && !loading) changed.set(p + min);
            }
            public void onStartTrackingTouch(SeekBar b) { }
            public void onStopTrackingTouch(SeekBar b) { }
        });
    }
    private void changed() {
        if(sectionFold!=null)sectionFold.sync();
        draft.put(ConfigSchema.STATUSBAR_GRID, grid.serialize());
        if (preview != null) preview.invalidate();
        if(!loading){dirty=true;generation++;main.removeCallbacks(autoSave);main.postDelayed(autoSave,450);}
    }
    private void save() {
        if (saving||!dirty) return;main.removeCallbacks(autoSave);
        if(ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))&&!previewClock().valid){
            Toast.makeText(this,"时钟格式有误，请修改格式或使用单行、双行预设",Toast.LENGTH_LONG).show();return;
        }
        for (Map.Entry<String, String> e : draft.entrySet()) if (ConfigSchema.normalize(e.getKey(), e.getValue()) == null) {
            Toast.makeText(this, "请检查格式或数值", Toast.LENGTH_LONG).show(); return;
        }
        LinkedHashMap<String, String> update = new LinkedHashMap<>(draft);
        final long current=generation;saving=true;
        worker.execute(() -> {
            AppConfig.SaveResult result = config.save(update);
            runOnUiThread(() -> { saving=false;if(result.success){dirty=current!=generation;if(dirty&&!isDestroyed())main.post(autoSave);}else Toast.makeText(this,result.message,Toast.LENGTH_LONG).show(); });
        });
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        Bundle b = new Bundle(); for (Map.Entry<String, String> e : draft.entrySet()) b.putString(e.getKey(), e.getValue());
        state.putBundle("draft", b); state.putInt("tab", tab); super.onSaveInstanceState(state);
    }
    @Override protected void onPause(){main.removeCallbacks(autoSave);save();super.onPause();}
    @Override public void onDestroy() { main.removeCallbacks(autoSave);worker.shutdown(); super.onDestroy(); }

    private ls.augment.com.hook.StatusBarClockFormatter.FormatResult previewClock(){
        return ls.augment.com.hook.StatusBarClockFormatter.formatDetailed(System.currentTimeMillis(),java.util.Locale.getDefault(),
                ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_24H)),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_SECONDS)),
                ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_PERIOD)),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_WEEK)),
                draft.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN),number(ConfigSchema.STATUSBAR_CLOCK_ROWS)==1?"":draft.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND));
    }
    private int number(String key){try{return Integer.parseInt(draft.get(key));}catch(Exception ignored){return 0;}}
    private boolean isTwoRows(String id){
        if(id.equals("clock"))return number(ConfigSchema.STATUSBAR_CLOCK_ROWS)==2;
        if(id.equals("network"))return networkMode()==4;
        String key=id.equals("network")?ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS:id.equals("notifications")?ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS:id.equals("system_icons")?ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS:null;
        return key!=null&&ConfigSchema.truthy(draft.get(key));
    }
    private int networkMode(){return StatusBarNetworkDisplay.resolve(draft.get(ConfigSchema.STATUSBAR_NETWORK_DISPLAY),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS)));}
    private static String baseId(String id){int split=id.indexOf('#');return split<0?id:id.substring(0,split);}

    private final class Preview extends View {
        final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        Preview() { super(StatusBarSettingsActivity.this); setContentDescription("状态栏布局预览，左中右各分上下两排"); }
        @Override protected void onDraw(Canvas c) {
            p.setColor(ui.cardHigh); c.drawRoundRect(0, 0, getWidth(), getHeight(), ui.dp(12), ui.dp(12), p);
            p.setColor(ui.outline); c.drawLine(0, getHeight()/2f, getWidth(), getHeight()/2f, p);
            for (int i = 1; i < 3; i++) c.drawLine(getWidth()*i/3f, 0, getWidth()*i/3f, getHeight(), p);
            java.util.ArrayList<Map.Entry<String, StatusBarGridSpec.Item>> entries = new java.util.ArrayList<>(grid.items().entrySet());
            entries.sort(java.util.Comparator.comparingInt(e -> e.getValue().order));
            java.util.List<StatusBarGridLayout.Node> nodes = new java.util.ArrayList<>();
            java.util.Map<String, String> labels = new java.util.LinkedHashMap<>();
            for (Map.Entry<String, StatusBarGridSpec.Item> e : entries) {
                StatusBarGridSpec.Item item = e.getValue(); if (!item.visible) continue;
                String id = e.getKey();
                String label = id.equals("clock") ? "12:30" : id.equals("network") ? StatusBarNetworkDisplay.format(networkMode(),"12K","36K") : id.equals("notifications") ? "● ●\n● ●" : id.equals("system_icons") ? "◉ ◇\n◉ ◇" : id.equals("battery") ? "82%" : id.equals("cpu") ? "C:37°" : id.equals("gpu") ? "G:36°" : id.equals("battery_temp") ? "B:33°" : id.equals("current") ? "I:600mA" : "P:2.4W";
                if (id.equals("clock") && ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))){
                    ls.augment.com.hook.StatusBarClockFormatter.FormatResult clock=previewClock();label=clock.valid?clock.text:"格式有误";
                }
                if ((id.equals("network") && networkMode()!=4)
                        || (id.equals("notifications") && !ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS)))
                        || (id.equals("system_icons") && !ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS)))) label = label.replace('\n', ' ');
                p.setTextSize(ui.dp(item.size));String[] lines = label.split("\n");
                if(isTwoRows(id)){
                    for(int row=0;row<lines.length;row++){
                        String part=id+"#"+row;
                        nodes.add(new StatusBarGridLayout.Node(part,item.zone.substring(0,1)+(row+1),item.order,p.measureText(lines[row]),ui.dp(item.size)*1.15f));
                        labels.put(part,lines[row]);
                    }
                }else{
                    float width=1;for(String line:lines)width=Math.max(width,p.measureText(line));
                    nodes.add(new StatusBarGridLayout.Node(id,item.zone,item.order,width,ui.dp(item.size)*lines.length*1.15f));labels.put(id,label);
                }
            }
            int heightId=getResources().getIdentifier("status_bar_height","dimen","android");
            int nativeHeight=heightId==0?ui.dp(24):getResources().getDimensionPixelSize(heightId);
            float barHeight=Math.max(nativeHeight,ui.dp(number(ConfigSchema.STATUSBAR_HEIGHT_DP)));
            float barWidth=getResources().getDisplayMetrics().widthPixels,cutLeft=0,cutRight=0;
            android.view.WindowInsets insets=getRootWindowInsets();
            if(insets!=null&&insets.getDisplayCutout()!=null)for(android.graphics.Rect r:insets.getDisplayCutout().getBoundingRects()){
                if(r.top<barHeight&&r.bottom>0){cutLeft=r.left-ui.dp(2);cutRight=r.right+ui.dp(2);}
            }
            java.util.Map<String, StatusBarGridLayout.Box> boxes = StatusBarGridLayout.pack(nodes, barWidth, barHeight,
                    ui.dp(4+number(ConfigSchema.STATUSBAR_LEFT_MARGIN_DP)),ui.dp(4+number(ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP)),
                    ui.dp(number(ConfigSchema.STATUSBAR_TOP_MARGIN_DP)),ui.dp(number(ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP)),
                    ui.dp(number(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP)),cutLeft,cutRight);
            float scale=Math.min(getWidth()/barWidth,(getHeight()-ui.dp(8))/barHeight);
            c.save();c.translate((getWidth()-barWidth*scale)/2,(getHeight()-barHeight*scale)/2);c.scale(scale,scale);
            for (Map.Entry<String, StatusBarGridLayout.Box> e : boxes.entrySet()) {
                StatusBarGridLayout.Box b = e.getValue(); String[] lines = labels.get(e.getKey()).split("\n");
                p.setColor(ui.text); p.setTextAlign(Paint.Align.LEFT); p.setTextSize(ui.dp(grid.get(baseId(e.getKey())).size)*b.scale);
                for (int i=0; i<lines.length; i++) c.drawText(lines[i], b.x, b.y+(i+.82f)*b.height/lines.length, p);
            }
            c.restore();
        }
    }
}
