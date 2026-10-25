package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.*;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Display preferences only: usable while the workspace and quick bar are switched off. */
public final class AtomicWorkbenchAppsActivity extends Activity {
    static final String DISPLAY_ROUTE="atomic_workbench_apps", SORT_ROUTE="atomic_workbench_app_sort";
    private static final String SAVED_QUERY="app_management.query",SAVED_GROUP="app_management.group",
            SAVED_SCROLL="app_management.scroll";
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->new Thread(r,"Duo-AppPreferences"));
    private final Handler main=new Handler(Looper.getMainLooper());
    private UiKit ui;
    private AtomicWorkbenchAppPreferences preferences;
    private AtomicWorkbenchAppListModel.State state;
    private AtomicWorkbenchAppListModel.Usage usage=AtomicWorkbenchAppListModel.Usage.unavailable("");
    private ArrayList<AtomicWorkbenchAppRepository.App> catalog=new ArrayList<>();
    private final Map<Character,View> firstLetter=new HashMap<>();
    private final ArrayList<View> actions=new ArrayList<>();
    private LinearLayout rows;
    private ScrollView scroll;
    private EditText search;
    private TextView status, floating;
    private View index;
    private int group=AtomicWorkbenchAppListModel.ALL, request;
    private long generation;
    private boolean busy,readable,sortPage;
    private String notice="";
    private int pendingScrollY=-1;
    private boolean pageVisible;
    private android.view.ViewTreeObserver.OnGlobalLayoutListener scrollRestoreLayout;
    private AtomicWorkbenchAppOrderTouch orderTouch;
    private final Map<String,View> orderRows=new LinkedHashMap<>();

    @Override public void onCreate(Bundle saved){
        super.onCreate(saved);generation=ResetWriteFence.generation();ui=new UiKit(this);
        String restoredQuery=saved==null?"":saved.getString(SAVED_QUERY,"");
        if(saved!=null){
            group=saved.getInt(SAVED_GROUP,AtomicWorkbenchAppListModel.ALL);
            if(group<AtomicWorkbenchAppListModel.ALL||group>AtomicWorkbenchAppListModel.HIDDEN)group=AtomicWorkbenchAppListModel.ALL;
            pendingScrollY=Math.max(0,saved.getInt(SAVED_SCROLL,0));
        }
        preferences=new AtomicWorkbenchAppPreferences(getApplicationContext());
        sortPage=SORT_ROUTE.equals(ModuleNavigation.route(this));
        LinearLayout root=ui.detailChrome(sortPage?"应用列表排序":"应用列表显示",null);
        FrameLayout frame=new FrameLayout(this);
        root.addView(frame,new LinearLayout.LayoutParams(-1,0,1));
        scroll=new ScrollView(this);scroll.setFillViewport(true);scroll.setVerticalScrollBarEnabled(false);
        scroll.setOnScrollChangeListener((v,x,y,oldX,oldY)->{
            if(pendingScrollY>=0&&y!=oldY)cancelScrollRestore();
        });
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(ui.dp(16),0,ui.dp(sortPage?16:60),ui.dp(24));
        scroll.addView(body,new ScrollView.LayoutParams(-1,-2));frame.addView(scroll,new FrameLayout.LayoutParams(-1,-1));
        // detailChrome already supplies the only 8dp path-to-content gap.
        status=ui.text("正在读取当前用户的应用…",12,ui.muted,false);
        status.setTag("atomic-workbench-app-preferences-status");
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        body.addView(status,ui.wrap());
        if(!sortPage){
            search=new EditText(this);ui.styleInput(search);search.setSingleLine(true);
            search.setText(restoredQuery);
            search.setHint("搜索应用名称或包名");search.setContentDescription("搜索应用名称或包名");
            search.setTag("atomic-workbench-app-management-search");body.addView(search,ui.margins(0,8,0,0));
            Spinner filter=ui.choiceSpinner("显示分组");
            ArrayAdapter<String> adapter=new ArrayAdapter<>(this,android.R.layout.simple_spinner_item,new String[]{"已选与未选","仅已选","仅未选"});
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);filter.setAdapter(adapter);
            filter.setSelection(group);
            filter.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
                public void onNothingSelected(AdapterView<?> p){}
                public void onItemSelected(AdapterView<?> p,View v,int position,long id){
                    if(group!=position)cancelScrollRestore();group=position;render();
                }
            });body.addView(filter,ui.margins(0,8,0,0));
            LinearLayout batch=new LinearLayout(this);
            batch.addView(button("全选",()->save((prior,current)->prior.select(current,false))),new LinearLayout.LayoutParams(0,-2,1));
            batch.addView(button("反选",()->save((prior,current)->prior.select(current,true))),new LinearLayout.LayoutParams(0,-2,1));
            body.addView(batch,ui.margins(0,8,0,0));
            body.addView(button("字母定位",this::chooseLetter),ui.margins(0,8,0,0));
            body.addView(ui.text("选择在快捷栏与应用网格显示的入口。隐藏不结束任务；当前运行应用仍在已选入口中优先。拖序只在手动模式、同一分组内生效。全选和反选作用于本次全部真实候选，不受搜索限制。",12,ui.muted,false),ui.margins(0,8,0,0));
            search.addTextChangedListener(new TextWatcher(){
                public void beforeTextChanged(CharSequence s,int start,int count,int after){}
                public void onTextChanged(CharSequence s,int start,int before,int count){cancelScrollRestore();render();}
                public void afterTextChanged(Editable e){}
            });
            addIndex(frame);
        }
        rows=new LinearLayout(this);rows.setOrientation(LinearLayout.VERTICAL);body.addView(rows,ui.margins(0,8,0,0));
        orderTouch=new AtomicWorkbenchAppOrderTouch(scroll,getResources().getDisplayMetrics().density,new AtomicWorkbenchAppOrderTouch.Host(){
            @Override public boolean current(String key,View row,int ticket){return pageVisible&&hasWindowFocus()&&movable()&&ticket==request
                    &&orderRows.get(key)==row&&row.isAttachedToWindow()&&row.isShown();}
            @Override public String target(String source,float x,float y){
                android.graphics.Rect viewport=new android.graphics.Rect();
                if(!scroll.getGlobalVisibleRect(viewport)||!viewport.contains((int)x,(int)y))return null;
                AtomicWorkbenchAppListModel.Entry from=state.entry(source);
                for(Map.Entry<String,View> candidate:orderRows.entrySet()){
                    if(candidate.getKey().equals(source))continue;AtomicWorkbenchAppListModel.Entry to=state.entry(candidate.getKey());
                    if(from.visible!=to.visible||from.pinned!=to.pinned)continue;
                    android.graphics.Rect bounds=new android.graphics.Rect();
                    if(candidate.getValue().getGlobalVisibleRect(bounds)&&bounds.contains((int)x,(int)y))return candidate.getKey();
                }return null;
            }
            @Override public void move(String source,String before){save((prior,current)->{
                requireCandidate(current,source);requireCandidate(current,before);return prior.move(current,source,before);});}
        });
        ui.setContentView(root);ui.applyGestureInset(root,8);
    }
    private Button button(String label,Runnable action){
        Button b=ui.tonalButton(label);b.setMinimumHeight(ui.dp(48));b.setOnClickListener(v->action.run());actions.add(b);return b;
    }
    @Override protected void onResume(){super.onResume();pageVisible=true;if(!busy)load();}
    @Override public void onWindowFocusChanged(boolean focused){super.onWindowFocusChanged(focused);if(!focused&&orderTouch!=null)orderTouch.cancel();}
    @Override protected void onStop(){pageVisible=false;detachScrollRestore();if(orderTouch!=null)orderTouch.cancel();if(floating!=null)floating.setVisibility(View.GONE);super.onStop();}
    @Override protected void onDestroy(){request++;cancelScrollRestore();if(orderTouch!=null)orderTouch.close();ui.closeHostDialogs();super.onDestroy();}
    @Override protected void onSaveInstanceState(Bundle out){
        super.onSaveInstanceState(out);
        out.putString(SAVED_QUERY,search==null?"":search.getText().toString());out.putInt(SAVED_GROUP,group);
        out.putInt(SAVED_SCROLL,pendingScrollY>=0?pendingScrollY:scroll==null?0:Math.max(0,scroll.getScrollY()));
    }
    @Override public boolean dispatchTouchEvent(MotionEvent event){
        if(event!=null&&event.getActionMasked()==MotionEvent.ACTION_DOWN)cancelScrollRestore();
        return super.dispatchTouchEvent(event);
    }
    private void detachScrollRestore(){
        if(scrollRestoreLayout==null)return;
        if(scroll!=null&&scroll.getViewTreeObserver().isAlive())
            scroll.getViewTreeObserver().removeOnGlobalLayoutListener(scrollRestoreLayout);
        scrollRestoreLayout=null;
    }
    private void cancelScrollRestore(){pendingScrollY=-1;detachScrollRestore();}
    private void restoreScrollAfterLayout(){
        if(!pageVisible||pendingScrollY<0||scroll==null)return;
        detachScrollRestore();final int ticket=request;
        scrollRestoreLayout=new android.view.ViewTreeObserver.OnGlobalLayoutListener(){
            @Override public void onGlobalLayout(){
                if(scrollRestoreLayout!=this)return;
                if(isDestroyed()||!pageVisible||ticket!=request||pendingScrollY<0||ResetWriteFence.stale(generation)){
                    detachScrollRestore();return;
                }
                if(scroll.getChildCount()==0)return;
                int viewport=Math.max(0,scroll.getHeight()-scroll.getPaddingTop()-scroll.getPaddingBottom());
                int range=Math.max(0,scroll.getChildAt(0).getHeight()-viewport),target=Math.min(pendingScrollY,range);
                detachScrollRestore();pendingScrollY=-1;scroll.scrollTo(0,target);
            }
        };
        scroll.getViewTreeObserver().addOnGlobalLayoutListener(scrollRestoreLayout);scroll.requestLayout();
    }
    private void load(){
        if(busy)return;busy=true;renderEnabled();int ticket=++request;
        WORKER.execute(()->{
            ArrayList<AtomicWorkbenchAppRepository.App> apps=new ArrayList<>();String error="";
            try{apps=AtomicWorkbenchAppRepository.load(getApplicationContext());}
            catch(RuntimeException failure){error="无法读取当前用户应用，未使用旧配置生成入口。";}
            AtomicWorkbenchAppPreferences.Result result=preferences.read();
            AtomicWorkbenchAppListModel.State next=result.success?result.state:new AtomicWorkbenchAppListModel.State(android.os.Process.myUid()/100000);
            AtomicWorkbenchAppListModel.Usage stats=AtomicWorkbenchAppUsage.read(getApplicationContext(),next.mode);
            ArrayList<AtomicWorkbenchAppRepository.App> found=apps;String failure=error;
            main.post(()->{if(isDestroyed()||ticket!=request)return;
                if(ResetWriteFence.stale(generation)){busy=false;readable=false;status.setText("配置已重置，请返回后重新打开应用管理。");renderEnabled();return;}
                busy=false;catalog=found;state=next;usage=stats;readable=result.success&&failure.isEmpty();
                if(!failure.isEmpty())notice=failure;else if(!result.success)notice=result.message;render();restoreScrollAfterLayout();});
        });
    }
    private interface Change{AtomicWorkbenchAppListModel.State apply(AtomicWorkbenchAppListModel.State prior,ArrayList<AtomicWorkbenchAppRepository.App> current);}
    private void save(Change change){
        cancelScrollRestore();
        if(busy||!readable||ResetWriteFence.stale(generation)){notice="页面或配置已变化，请返回后重新打开。";render();return;}
        busy=true;renderEnabled();int ticket=++request;
        WORKER.execute(()->{
            AtomicWorkbenchAppPreferences.Result saved;
            try{
                ArrayList<AtomicWorkbenchAppRepository.App> current=AtomicWorkbenchAppRepository.load(getApplicationContext());
                saved=preferences.change(generation,prior->change.apply(prior,current));
            }catch(RuntimeException failure){saved=new AtomicWorkbenchAppPreferences.Result(false,"应用列表已变化或读取失败，请重新核对。",null);}
            AtomicWorkbenchAppPreferences.Result result=saved;
            main.post(()->{if(isDestroyed()||ticket!=request)return;busy=false;
                if(ResetWriteFence.stale(generation)){readable=false;status.setText("配置已重置，本次回调未重新应用；请返回后重新打开。");renderEnabled();return;}
                notice=result.message;load();});
        });
    }
    private void renderEnabled(){boolean ready=!busy&&readable&&!ResetWriteFence.stale(generation);for(View action:actions)action.setEnabled(ready);}
    private void render(){
        if(rows==null||state==null)return;if(orderTouch!=null)orderTouch.cancel();orderRows.clear();rows.removeAllViews();firstLetter.clear();
        // Keep permanent controls; row controls are discarded on every render.
        actions.removeIf(v->v.getTag()!=null&&"app-row-action".equals(v.getTag()));
        String mode=state.mode==0?"手动":state.mode==1?"使用频率":"首字母";
        String effective=AtomicWorkbenchAppListModel.effectiveMode(state,usage)==0?"手动":mode;
        status.setText(status.getContext().getString(R.string.status_atomicworkbenchappsactivity_2 ,String.valueOf((notice.isEmpty()?"":notice+"\n")), String.valueOf(mode), String.valueOf(effective), String.valueOf((state.mode==1?usage.message:"手动顺序与置顶独立保存。"))));
        if(sortPage){renderSort();renderEnabled();return;}
        ArrayList<AtomicWorkbenchAppRepository.App> ordered=AtomicWorkbenchAppListModel.ordered(catalog,state,usage,false,Collections.emptyList());
        ArrayList<AtomicWorkbenchAppRepository.App> matches=AtomicWorkbenchAppListModel.filter(ordered,state,search.getText().toString(),group);
        for(boolean selected:new boolean[]{true,false}){
            ArrayList<AtomicWorkbenchAppRepository.App> items=new ArrayList<>();
            for(AtomicWorkbenchAppRepository.App app:matches)if(state.entry(app.key()).visible==selected)items.add(app);
            if(items.isEmpty())continue;
            TextView heading=ui.text((selected?"已选":"未选")+" · "+items.size(),12,ui.muted,true);heading.setAccessibilityHeading(true);
            rows.addView(heading,ui.margins(0,8,0,8));
            LinearLayout card=ui.preferenceCard();rows.addView(card,ui.wrap());
            for(AtomicWorkbenchAppRepository.App app:items){View row=appRow(app);card.addView(row,ui.wrap());firstLetter.putIfAbsent(app.initial,row);}
        }
        if(matches.isEmpty())rows.addView(ui.text(catalog.isEmpty()?"当前没有可用的应用入口。":"未找到匹配的应用；清空搜索或切换分组后重试。",14,ui.muted,false),ui.margins(0,8,0,0));
        if(index!=null)index.setVisibility(matches.isEmpty()?View.GONE:View.VISIBLE);
        renderEnabled();
    }
    private void renderSort(){
        String[] names={"手动（默认）","使用频率","首字母"};
        String[] descriptions={"按保存的拖动顺序；新入口按名称加入。","最近14天系统 ACTIVITY_RESUMED 前台进入次数降序，同次数按最近时间，再按首字母。含同应用内部页面再次进入；同包多个入口共享统计。","中文使用手机 ICU 转拼音首字母，其他名称按 A–Z、#；相同首字母按中文名称与入口键排序。"};
        for(int i=0;i<names.length;i++){
            final int mode=i;LinearLayout card=ui.preferenceCard();rows.addView(card,ui.margins(0,i==0?0:8,0,0));
            Button choice=button((state.mode==i?"✓ ":"")+names[i],()->save((prior,current)->prior.mode(mode)));
            choice.setTag("app-row-action");choice.setContentDescription(names[i]+(state.mode==i?"，已保存":""));card.addView(choice,ui.wrap());
            card.addView(ui.text(descriptions[i],12,ui.muted,false),ui.margins(0,0,0,8));
        }
        rows.addView(ui.text("已选入口中的当前主窗、副窗和其他运行应用始终优先，其后置顶，再按当前模式排列。管理页与工作台使用同一排序器；隐藏不结束任务。未授权或统计失败只降级本次显示，不改写已保存的频率模式和手动顺序。",12,ui.muted,false),ui.margins(0,8,0,0));
        Button permission=ui.tonalButton("管理使用情况访问权限");permission.setMinimumHeight(ui.dp(48));
        permission.setOnClickListener(v->{try{startActivity(new Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS,Uri.parse("package:"+getPackageName())));}
            catch(RuntimeException failure){notice="此手机没有可用的使用情况授权页面，请在系统设置中搜索“使用情况访问权限”。";render();}});
        rows.addView(permission,ui.margins(0,8,0,0));
    }
    private View appRow(AtomicWorkbenchAppRepository.App app){
        LinearLayout block=new LinearLayout(this);block.setOrientation(LinearLayout.VERTICAL);
        LinearLayout row=ui.groupRow();row.setPadding(0,ui.dp(4),0,ui.dp(4));row.setMinimumHeight(ui.dp(56));
        AtomicWorkbenchAppListModel.Entry entry=state.entry(app.key());
        CheckBox selected=new CheckBox(this);ui.styleCheckBox(selected);selected.setChecked(entry.visible);
        selected.setTag("app-row-action");selected.setContentDescription((entry.visible?"隐藏 ":"恢复 ")+app.label);
        selected.setOnCheckedChangeListener((b,value)->save((prior,current)->{
            requireCandidate(current,app.key());return prior.visible(app.key(),value);}));actions.add(selected);row.addView(selected);
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);
        TextView title=ui.text(app.label,15,ui.text,true);title.setMaxLines(2);copy.addView(title,ui.wrap());
        TextView pkg=ui.text(app.component.getPackageName(),12,ui.muted,false);pkg.setMaxLines(2);copy.addView(pkg,ui.wrap());
        copy.setContentDescription(app.label+"，"+app.component.flattenToShortString());
        row.addView(copy,new LinearLayout.LayoutParams(0,-2,1));
        block.addView(row,ui.wrap());
        LinearLayout tools=new LinearLayout(this);tools.setGravity(Gravity.END);
        Button pin=button(entry.pinned?"取消置顶":"置顶",()->save((prior,current)->{
            requireCandidate(current,app.key());return prior.pinned(app.key(),!prior.entry(app.key()).pinned);}));
        pin.setTag("app-row-action");tools.addView(pin,new LinearLayout.LayoutParams(0,-2,1));
        Button handle=button("移序",()->chooseMove(app));handle.setTag("app-row-action");handle.setContentDescription("移动 "+app.label);
        orderRows.put(app.key(),block);orderTouch.bind(handle,block,app.key(),request);
        tools.addView(handle,new LinearLayout.LayoutParams(0,-2,1));block.addView(tools,ui.margins(0,0,0,4));
        return block;
    }
    private boolean movable(){return state!=null&&state.mode==0&&readable&&!busy&&!ResetWriteFence.stale(generation)&&search.getText().toString().trim().isEmpty();}
    private void chooseMove(AtomicWorkbenchAppRepository.App app){
        if(!movable()){notice="请切换到手动排序并清空搜索后移动。";render();return;}
        ArrayList<AtomicWorkbenchAppRepository.App> ordered=AtomicWorkbenchAppListModel.ordered(catalog,state,usage,false,Collections.emptyList());
        ArrayList<AtomicWorkbenchAppRepository.App> peers=new ArrayList<>();
        for(AtomicWorkbenchAppRepository.App item:ordered)if(state.entry(item.key()).visible==state.entry(app.key()).visible&&state.entry(item.key()).pinned==state.entry(app.key()).pinned)peers.add(item);
        int at=peers.indexOf(app);
        ui.choiceDialog("移动“"+app.label+"”",new String[]{"向前一位","向后一位"},new String[]{"在同一显隐及置顶分组中移动","在同一显隐及置顶分组中移动"},choice->{
            if(choice==0&&at>0)save((prior,current)->prior.move(current,app.key(),peers.get(at-1).key()));
            else if(choice==1&&at+1<peers.size())save((prior,current)->prior.move(current,peers.get(at+1).key(),app.key()));
        });
    }
    private static void requireCandidate(ArrayList<AtomicWorkbenchAppRepository.App> current,String key){
        if(AtomicWorkbenchAppListModel.find(current,key)==null)throw new IllegalArgumentException("app_missing");
    }

    // Continuous letter scrubber has an existing accessible chooseLetter dialog button; drag release is not a second click.
    //noinspection ClickableViewAccessibility
    private void addIndex(FrameLayout frame){
        LinearLayout letters=new LinearLayout(this);letters.setOrientation(LinearLayout.VERTICAL);letters.setGravity(Gravity.CENTER);
        for(char letter:"ABCDEFGHIJKLMNOPQRSTUVWXYZ#".toCharArray()){
            TextView label=ui.text(String.valueOf(letter),10,ui.accent,true);label.setGravity(Gravity.CENTER);
            label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);letters.addView(label,new LinearLayout.LayoutParams(-1,0,1));
        }
        FrameLayout.LayoutParams bounds=new FrameLayout.LayoutParams(ui.dp(44),ui.dp(432),Gravity.END|Gravity.CENTER_VERTICAL);
        frame.addView(letters,bounds);index=letters;letters.setContentDescription("字母索引，滑动定位；也可使用字母定位按钮");
        frame.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->{
            int height=Math.max(1,Math.min(ui.dp(432),(b-t)*3/4));
            if(letters.getLayoutParams().height!=height){letters.getLayoutParams().height=height;letters.requestLayout();}
        });
        floating=ui.text("",26,ui.accent,true);floating.setGravity(Gravity.CENTER);floating.setBackground(ui.round(ui.accentContainer,28));floating.setVisibility(View.GONE);
        FrameLayout.LayoutParams bubble=new FrameLayout.LayoutParams(ui.dp(56),ui.dp(56),Gravity.END|Gravity.CENTER_VERTICAL);bubble.rightMargin=ui.dp(52);frame.addView(floating,bubble);
        letters.setOnTouchListener((v,event)->{
            int action=event.getActionMasked();if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL){floating.setVisibility(View.GONE);return true;}
            if(action==MotionEvent.ACTION_DOWN||action==MotionEvent.ACTION_MOVE){
                int position=Math.max(0,Math.min(26,(int)(event.getY()*27/Math.max(1,v.getHeight()))));
                char letter="ABCDEFGHIJKLMNOPQRSTUVWXYZ#".charAt(position);floating.setText(String.valueOf(letter));floating.setVisibility(View.VISIBLE);jump(letter);return true;
            }return true;
        });
    }
    private void chooseLetter(){
        ArrayList<Character> available=new ArrayList<>(firstLetter.keySet());available.sort((a,b)->Integer.compare(a=='#'?27:a-'A',b=='#'?27:b-'A'));
        if(available.isEmpty())return;String[] names=new String[available.size()];for(int i=0;i<names.length;i++)names[i]=String.valueOf(available.get(i));
        ui.choiceDialog("定位到首字母",names,null,position->jump(available.get(position)));
    }
    private void jump(char letter){cancelScrollRestore();View target=firstLetter.get(letter);if(target==null)return;
        android.graphics.Rect bounds=new android.graphics.Rect();target.getDrawingRect(bounds);
        ((android.view.ViewGroup)scroll.getChildAt(0)).offsetDescendantRectToMyCoords(target,bounds);scroll.smoothScrollTo(0,bounds.top);
    }
}
