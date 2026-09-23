package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import ls.augment.com.GameOptions;
import ls.augment.com.ShoulderQuickSwitchPolicy;
import ls.augment.com.ShoulderQuickSwitchPolicy.CaseRef;

/** Verified GameSpace 261 TGK case model. Never reorders/truncates the OEM's backing tables. */
final class ShoulderQuickSwitchHook {
    private static final String SERVICE = "cn.nubia.tgk.TgkService";
    private static final String SHOW_ADAPTER = "cn.nubia.tgk.widget.TgkShowCaseListViewAdapter";
    private static final String EDIT_HOLDER = "cn.nubia.tgk.widget.TgkCaseListViewAdapter$TgkCaseHolder";
    private static final Map<Object, Popup> POPUPS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, WeakReference<RowUi>> ROWS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<CaseRef,Boolean> PENDING = new java.util.concurrent.ConcurrentHashMap<>();
    private static final ExecutorService SAVES = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "LSA-ShoulderCandidates"); thread.setDaemon(true); return thread;
    });
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static volatile long lastError;

    static int install(AugmentModule module, ClassLoader loader) {
        int installed = 0;
        try {
            Class<?> service = Class.forName(SERVICE, false, loader);
            Class<?> adapter = Class.forName(SHOW_ADAPTER, false, loader);
            Class<?> data = Class.forName("cn.nubia.tgk.data.TgkData", false, loader);
            Class<?> listener = Class.forName(SHOW_ADAPTER + "$onDataChangeListener", false, loader);
            // Resolve every method used by the direct route before intercepting its click.
            service.getDeclaredMethod("hideTgkCaseListPopView");
            service.getDeclaredMethod("sendMsgDelayed", int.class, Object.class, int.class);
            listener.getDeclaredMethod("onChanged", int.class, int.class);
            listener.getDeclaredMethod("onTgkDataChanged", int.class, data);
            Method click = ShoulderHookTargets.quickSwitchClick(service);
            if (click == null) throw new NoSuchMethodException("TgkService.onTgkCaseViewBottonClick");
            module.registerFeatureHook(module.prepareFeatureHook(click,"shoulder.quick_switch",true).intercept(chain -> {
                Object owner = chain.getThisObject();
                if (!enabled(owner)) return chain.proceed();
                try {
                    Object view = TargetReflection.field(owner,"mTgkCaseShowView");
                    if (view == null || !Boolean.TRUE.equals(TargetReflection.call(view,"getIsNormal"))) return chain.proceed();
                    Catalog catalog = catalog(TargetReflection.field(owner,"mTgkGameInfo"));
                    List<CaseRef> selected = candidates(owner).visible(catalog.refs());
                    CaseRef target = ShoulderQuickSwitchPolicy.directTarget(selected,catalog.current());
                    if (target == null) return chain.proceed();
                    apply(owner,catalog,target);
                    TargetReflection.call(owner,"hideTgkCaseListPopView");
                    TargetReflection.call(view,"setTgkCaseStates",false);
                    Handler handler = (Handler) TargetReflection.field(owner,"mHandler");
                    handler.removeMessages(6);
                    TargetReflection.call(owner,"sendMsgDelayed",6,null,5000);
                    hit(owner,"direct|candidates=" + selected.size());
                    return null;
                } catch (Throwable error) { failure(module,owner,"direct",error); return chain.proceed(); }
            }));
            installed++;
            Method setListener = method(adapter,"setListener",listener);
            module.registerFeatureHook(module.prepareFeatureHook(setListener,"shoulder.menu_owner",false).intercept(chain -> {
                Object result = chain.proceed();
                try {
                    Object owner = TargetReflection.field(chain.getArg(0),"this$0");
                    if (service.isInstance(owner) && enabled(owner)) {
                        Catalog catalog = catalog(TargetReflection.field(owner,"mTgkGameInfo"));
                        List<CaseRef> selected = candidates(owner).visible(catalog.refs());
                        if (!selected.isEmpty()) POPUPS.put(chain.getThisObject(),new Popup(owner,catalog,selected));
                    }
                } catch (Throwable error) { failure(module,null,"menu_owner",error); }
                return result;
            }));
            installed++;
            Method getList = method(adapter,"getList");
            module.registerFeatureHook(module.prepareFeatureHook(getList,"shoulder.menu_filter",true).intercept(chain -> {
                Popup popup = POPUPS.get(chain.getThisObject());
                // An already-open filtered menu keeps its index map until dismissed, including
                // when the setting changes. Never feed a filtered index into the OEM importer.
                if (popup == null) return chain.proceed();
                ArrayList<Object> filtered = new ArrayList<>();
                for (CaseRef ref : popup.visible) filtered.add(popup.catalog.find(ref).data);
                return filtered;
            }));
            installed++;
            Method select = method(adapter,"setSelected",ArrayList.class,int.class,boolean.class);
            module.registerFeatureHook(module.prepareFeatureHook(select,"shoulder.menu_apply",true).intercept(chain -> {
                Popup popup = POPUPS.get(chain.getThisObject());
                Object owner = popup == null ? null : popup.owner.get();
                if (popup == null) return chain.proceed();
                if (owner == null) return null;
                // The OEM passes filtered positions. Its hardcoded position-5 must never run here.
                if (Boolean.TRUE.equals(chain.getArg(2))) {
                    int position = (Integer) chain.getArg(1);
                    try {
                        if (position < 0 || position >= popup.visible.size()) return null;
                        Catalog live = catalog(TargetReflection.field(owner,"mTgkGameInfo"));
                        apply(owner,live,popup.visible.get(position));
                        hit(owner,"menu|candidates=" + popup.visible.size());
                    } catch (Throwable error) {
                        failure(module,owner,"menu_apply",error);
                        Toast.makeText(context(owner),"方案未切换，请重新打开肩键面板",Toast.LENGTH_SHORT).show();
                    }
                }
                return null;
            }));
            installed++;
            Method scroll = method(service,"tgkCaseListPopViewScrollToPosition",int.class,int.class);
            module.registerFeatureHook(module.prepareFeatureHook(scroll,"shoulder.menu_scroll",true).intercept(chain -> {
                Object owner=chain.getThisObject();
                if (!enabled(owner)) return chain.proceed();
                try {
                    Catalog catalog=catalog(TargetReflection.field(owner,"mTgkGameInfo"));
                    List<CaseRef> selected=candidates(owner).visible(catalog.refs());
                    if(selected.isEmpty())return chain.proceed();
                    Object view=TargetReflection.field(owner,"mTgkCaseListShowView");
                    if(view!=null)TargetReflection.call(view,"scrollToPositionWithOffset",Math.max(0,selected.indexOf(catalog.current())));
                    return null;
                } catch(Throwable error){failure(module,owner,"menu_scroll",error);return chain.proceed();}
            }));
            installed++;
        } catch(Throwable error){failure(module,null,"install_switch",error);}
        try {
            Class<?> holder=Class.forName(EDIT_HOLDER,false,loader);
            Method bind=method(holder,"onBindViewHolder",int.class);
            module.registerFeatureHook(module.prepareFeatureHook(bind,"shoulder.candidate_checkbox",false).intercept(chain->{
                Object result=chain.proceed();
                try{bindCandidate(chain.getThisObject(),(Integer)chain.getArg(0));}
                catch(Throwable error){failure(module,chain.getThisObject(),"checkbox",error);}
                return result;
            }));
            installed++;
        }catch(Throwable error){failure(module,null,"install_checkbox",error);}
        module.logFeatureInfo("SHOULDER_QUICK_SWITCH_REGISTERED count="+installed+";device_validation=pending");
        return installed;
    }

    private static void bindCandidate(Object holder,int position)throws Throwable {
        WeakReference<RowUi> existing=ROWS.get(holder);
        RowUi row=existing==null?null:existing.get();
        Object adapter=TargetReflection.field(holder,"this$0");
        Context context=context(adapter);
        if(!FeatureSettings.enabled(context,GameOptions.QUICK_SWITCH,false)){
            if(row!=null)row.restore();
            return;
        }
        @SuppressWarnings("unchecked") List<Object> full=(List<Object>)TargetReflection.call(adapter,"getList");
        if(position<0||position>=full.size())return;
        Object data=full.get(position);
        int table=(((Number)TargetReflection.field(data,"state")).intValue()&4)!=0?0:1;
        CaseRef ref=ref(data,table);
        if(row==null){
            View item=(View)TargetReflection.field(holder,"itemView");
            TextView title=(TextView)TargetReflection.field(holder,"tv");
            if(!(item instanceof ViewGroup))return;
            row=new RowUi((ViewGroup)item,title);
            row.box.setTag(row);
            ROWS.put(holder,new WeakReference<>(row));
        }
        RowUi current=row;
        current.show();
        current.box.setOnCheckedChangeListener(null);
        Boolean pending=PENDING.get(ref);
        current.box.setChecked(pending==null?candidates(adapter).contains(ref):pending);
        current.box.setContentDescription("参与快捷切换："+TargetReflection.field(data,"showName"));
        current.ref=ref;
        current.box.setEnabled(pending==null);
        current.listener=(button,checked)->{
            if(PENDING.putIfAbsent(ref,checked)!=null)return;
            current.box.setEnabled(false);
            SAVES.execute(()->{
                Bundle result=null;
                try{
                    Bundle extras=new Bundle();
                    extras.putString("gamePackage",ref.gamePackage);extras.putInt("tableId",ref.tableId);
                    extras.putLong("caseId",ref.caseId);extras.putBoolean("checked",checked);
                    result=context.getContentResolver().call(PROVIDER,ShoulderQuickSwitchPolicy.CALL,null,extras);
                }catch(RuntimeException ignored){}
                boolean success=result!=null&&result.getBoolean("ok",false);
                FeatureSettings.invalidateSnapshot();
                PENDING.remove(ref);
                current.box.post(()->{
                    if(!ref.equals(current.ref))return; // Holder recycled while the save was in flight.
                    current.box.setEnabled(true);
                    current.box.setOnCheckedChangeListener(null);
                    current.box.setChecked(success?checked:!checked);
                    current.box.setOnCheckedChangeListener(current.listener);
                    if(!success){
                        Toast.makeText(context,"候选未保存，请重试",Toast.LENGTH_SHORT).show();
                    }
                });
            });
        };
        current.box.setOnCheckedChangeListener(current.listener);
    }

    private static void apply(Object service,Catalog catalog,CaseRef target)throws Throwable {
        CaseRef current=catalog.current();
        if(target.equals(current))return;
        Entry next=catalog.find(target), previous=catalog.find(current);
        if(next==null||previous==null)throw new IllegalStateException("case no longer exists");
        Object listener=TargetReflection.field(service,"tgkCaseListViewAdapterListener");
        Object info=TargetReflection.field(service,"mTgkGameInfo");
        int oldState=((Number)TargetReflection.field(previous.data,"state")).intValue();
        int newState=((Number)TargetReflection.field(next.data,"state")).intValue();
        try{
            set(previous.data,"state",oldState&~1);set(next.data,"state",newState|1);
            TargetReflection.call(listener,"onChanged",next.ref.tableId,next.index);
        }catch(Throwable error){
            set(previous.data,"state",oldState);set(next.data,"state",newState);
            set(info,"selectedTableId",previous.ref.tableId);set(info,"selectedCasePosition",previous.index);
            try{TargetReflection.call(listener,"onChanged",previous.ref.tableId,previous.index);}catch(Throwable ignored){}
            throw error;
        }
        // The OEM async writer stores object references. Snapshot the cases to prevent rapid taps
        // from changing a pending write's selected bit before the serial AsyncTask executes it.
        TargetReflection.call(listener,"onTgkDataChanged",previous.ref.tableId,copy(previous.data));
        TargetReflection.call(listener,"onTgkDataChanged",next.ref.tableId,copy(next.data));
    }
    private static Object copy(Object data)throws ReflectiveOperationException {
        Object result=data.getClass().getDeclaredConstructor().newInstance();
        for(Field f:data.getClass().getDeclaredFields())if(!java.lang.reflect.Modifier.isStatic(f.getModifiers())){
            f.setAccessible(true);f.set(result,f.get(data));
        }
        return result;
    }
    private static Catalog catalog(Object info)throws ReflectiveOperationException {
        if(info==null)throw new IllegalStateException("no game case model");
        List<Entry> entries=new ArrayList<>();
        for(int table=0;table<=1;table++){
            Object list=TargetReflection.field(info,table==0?"presetTableList":"importTableList");
            if(!(list instanceof List))continue;
            List<?> data=(List<?>)list;
            for(int i=0;i<data.size();i++)entries.add(new Entry(ref(data.get(i),table),i,data.get(i)));
        }
        int table=((Number)TargetReflection.field(info,"selectedTableId")).intValue();
        int index=((Number)TargetReflection.field(info,"selectedCasePosition")).intValue();
        return new Catalog(entries,table,index);
    }
    private static CaseRef ref(Object data,int table)throws ReflectiveOperationException {
        return new CaseRef(Process.myUid()/100000,(String)TargetReflection.field(data,"packageName"),
                table,((Number)TargetReflection.field(data,"ID")).longValue());
    }
    private static ShoulderQuickSwitchPolicy candidates(Object owner){
        ShoulderQuickSwitchPolicy result=ShoulderQuickSwitchPolicy.parse(FeatureSettings.text(
                context(owner),ShoulderQuickSwitchPolicy.KEY,ShoulderQuickSwitchPolicy.EMPTY));
        return result==null?ShoulderQuickSwitchPolicy.empty():result;
    }
    private static Context context(Object owner){return FeatureSettings.from(owner);}
    private static boolean enabled(Object owner){return owner!=null&&FeatureSettings.enabled(context(owner),GameOptions.QUICK_SWITCH,false);}
    private static Method method(Class<?> owner,String name,Class<?>...args)throws ReflectiveOperationException{
        Method result=owner.getDeclaredMethod(name,args);result.setAccessible(true);return result;
    }
    private static void set(Object owner,String name,Object value)throws ReflectiveOperationException{
        Field f=owner.getClass().getDeclaredField(name);f.setAccessible(true);f.set(owner,value);
    }
    private static void hit(Object owner,String detail){
        FeatureSettings.diagnostic(context(owner),"ls_augment_shoulder_quick_last_hit",detail+"|"+System.currentTimeMillis());
    }
    private static void failure(AugmentModule module,Object owner,String step,Throwable error){
        long now=System.currentTimeMillis();if(now-lastError<5000)return;lastError=now;
        module.logFeatureError("SHOULDER_QUICK_"+step,error);
        FeatureSettings.diagnostic(context(owner),"ls_augment_shoulder_quick_error",step+"|"+error.getClass().getSimpleName());
    }
    private static final class Entry{
        final CaseRef ref;final int index;final Object data;
        Entry(CaseRef ref,int index,Object data){this.ref=ref;this.index=index;this.data=data;}
    }
    private static final class Catalog{
        final List<Entry> entries;final int table,index;
        Catalog(List<Entry> entries,int table,int index){this.entries=entries;this.table=table;this.index=index;}
        List<CaseRef> refs(){List<CaseRef> result=new ArrayList<>();for(Entry e:entries)result.add(e.ref);return result;}
        CaseRef current(){for(Entry e:entries)if(e.ref.tableId==table&&e.index==index)return e.ref;return null;}
        Entry find(CaseRef ref){for(Entry e:entries)if(e.ref.equals(ref))return e;return null;}
    }
    private static final class Popup{
        final WeakReference<Object> owner;final Catalog catalog;final List<CaseRef> visible;
        Popup(Object owner,Catalog catalog,List<CaseRef> visible){this.owner=new WeakReference<>(owner);this.catalog=catalog;this.visible=visible;}
    }
    private static final class RowUi{
        final ViewGroup item;final TextView title;final CheckBox box;
        final int oldHeight,left,top,right,bottom,orientation,titleWidth,titleHeight;
        android.widget.CompoundButton.OnCheckedChangeListener listener;
        final Map<View,Integer> siblingVisibility=new java.util.IdentityHashMap<>();CaseRef ref;
        RowUi(ViewGroup item,TextView title){
            this.item=item;this.title=title;oldHeight=item.getLayoutParams()==null?-2:item.getLayoutParams().height;
            left=title.getPaddingLeft();top=title.getPaddingTop();right=title.getPaddingRight();bottom=title.getPaddingBottom();
            orientation=item instanceof LinearLayout?((LinearLayout)item).getOrientation():-1;
            titleWidth=title.getLayoutParams().width;titleHeight=title.getLayoutParams().height;
            for(int i=0;i<item.getChildCount();i++){
                View child=item.getChildAt(i);if(child!=title)siblingVisibility.put(child,child.getVisibility());
            }
            box=new CheckBox(item.getContext());box.setText("参与快捷切换");box.setTextSize(11);
            box.setTextColor(title.getTextColors());box.setMinHeight(dp(36));box.setMinimumHeight(dp(36));
            box.setSingleLine(false);
            box.setPadding(0,0,dp(4),0);box.setGravity(Gravity.CENTER_VERTICAL|Gravity.END);
            if(item instanceof RelativeLayout){
                RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(-2,dp(36));
                p.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);p.addRule(RelativeLayout.ALIGN_PARENT_END);item.addView(box,p);
            }else if(item instanceof FrameLayout){
                item.addView(box,new FrameLayout.LayoutParams(-2,dp(36),Gravity.BOTTOM|Gravity.END));
            }else if(item instanceof LinearLayout){
                item.addView(box,new LinearLayout.LayoutParams(-1,dp(36)));
            }else{item.addView(box,new ViewGroup.LayoutParams(-1,dp(36)));}
        }
        int dp(int value){return Math.round(value*item.getResources().getDisplayMetrics().density);}
        void show(){
            box.setVisibility(View.VISIBLE);
            if(item instanceof LinearLayout){
                ((LinearLayout)item).setOrientation(LinearLayout.VERTICAL);
                for(View child:siblingVisibility.keySet())child.setVisibility(View.GONE);
                ViewGroup.LayoutParams titleParams=title.getLayoutParams();
                titleParams.width=-1;titleParams.height=dp(32);title.setLayoutParams(titleParams);
                title.setPadding(left+dp(10),top,right,bottom);
            }else title.setPadding(left,top,right,bottom+dp(32));
            ViewGroup.LayoutParams p=item.getLayoutParams();if(p!=null){p.height=Math.max(oldHeight,dp(76));item.setLayoutParams(p);}
        }
        void restore(){box.setOnCheckedChangeListener(null);box.setVisibility(View.GONE);title.setPadding(left,top,right,bottom);
            if(item instanceof LinearLayout){
                ((LinearLayout)item).setOrientation(orientation);
                for(Map.Entry<View,Integer> child:siblingVisibility.entrySet())child.getKey().setVisibility(child.getValue());
                ViewGroup.LayoutParams titleParams=title.getLayoutParams();
                titleParams.width=titleWidth;titleParams.height=titleHeight;title.setLayoutParams(titleParams);
            }
            ViewGroup.LayoutParams p=item.getLayoutParams();if(p!=null){p.height=oldHeight;item.setLayoutParams(p);}}
    }
    private ShoulderQuickSwitchHook(){}
}
