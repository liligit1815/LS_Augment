package ls.augment.com.hook;

import android.content.Context;
import android.content.DialogInterface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.SignalStylePolicy;
import ls.augment.com.SystemUiOptions;

/** Uses the OEM notification-icon dialog shell with three graphic signal choices. */
final class SettingsSignalEntryHook {
    static final String PAGE="com.zte.settings.notification.StatusBarIconsSettingsFragment";
    static final String ENTRY="ls_augment_signal_style";
    static final String BATTERY="zte_battery_percentage";
    private static final Uri CONFIG=Uri.parse("content://ls.augment.com.config");
    private static final ExecutorService BRIDGE=Executors.newSingleThreadExecutor(task->{
        Thread thread=new Thread(task,"LSA-SettingsSignal");thread.setDaemon(true);return thread;
    });
    private final Profile profile;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final ArrayList<WeakReference<Object>> pages=new ArrayList<>();
    private final WeakHashMap<Object,EntryState> entries=new WeakHashMap<>();
    private boolean installed,observing;

    private static final class EntryState {
        final WeakReference<Object> preference;
        final Context context;
        long generation,revision;
        boolean saving;
        int choice;
        WeakReference<Object> dialogFragment;
        WeakReference<SettingsSignalStyleChoices> graphicChoices;
        EntryState(Object preference,Context context){
            this.preference=new WeakReference<>(preference);
            Context app=context.getApplicationContext();this.context=app==null?context:app;
        }
    }
    private SettingsSignalEntryHook(Profile profile){this.profile=profile;}

    static void install(AugmentModule module,ClassLoader loader){
        try{
            SettingsSignalEntryHook hooks=new SettingsSignalEntryHook(new Profile(loader));
            hooks.installHooks(module);hooks.installed=true;
            module.logFeatureInfo("SETTINGS_SIGNAL_ENTRY_INSTALLED native_list_dialog=true graphic_choices=true page="+PAGE);
        }catch(Throwable failure){module.logFeatureError("SETTINGS_SIGNAL_ENTRY_UNAVAILABLE",failure);}
    }
    private void installHooks(AugmentModule module){
        module.registerFeatureHook(module.prepareFeatureHook(profile.create,"settings.signal_entry.create",false).intercept(chain->{
            Object original=chain.proceed();attach(chain.getThisObject(),module);return original;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(profile.resume,"settings.signal_entry.resume",false).intercept(chain->{
            Object original=chain.proceed();attach(chain.getThisObject(),module);return original;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(profile.prepareDialog,"settings.signal_entry.graphic_choices",false).intercept(chain->{
            prepareDialogState(chain.getThisObject(),module);
            Object original=chain.proceed();decorateDialog(chain.getThisObject(),chain.getArg(0),module);return original;
        }));
    }
    private void prepareDialogState(Object fragment,AugmentModule module){
        try{
            if(!installed||!signalDialog(fragment))return;
            EntryState state=entries.get(profile.fragmentPreference.invoke(fragment));update(state);
            // Saved AndroidX dialog state can contain the old two-option arrays.
            // Replace only this owned preference's data before native preparation.
            profile.dialogEntries.set(fragment,new CharSequence[]{"平铺","荣耀双排","iOS双排"});
            profile.dialogValues.set(fragment,new CharSequence[]{"0","1","2"});
            profile.clickedIndex.setInt(fragment,state.choice);
        }catch(Throwable failure){module.logFeatureError("SETTINGS_SIGNAL_DIALOG_STATE_FAILED",failure);}
    }
    private void decorateDialog(Object fragment,Object builder,AugmentModule module){
        CharSequence[] originalItems=null;DialogInterface.OnClickListener originalClick=null;int selected=-1;boolean replaced=false;
        try{
            if(!installed||!signalDialog(fragment)||builder==null)return;
            Object params=profile.builderParams.get(builder);
            originalClick=(DialogInterface.OnClickListener)profile.nativeClick.get(params);
            originalItems=(CharSequence[])profile.nativeItems.get(params);
            if(originalClick==null||originalItems==null||originalItems.length!=3)return;
            Context context=(Context)profile.builderContext.invoke(builder);
            EntryState state=entries.get(profile.fragmentPreference.invoke(fragment));
            update(state);
            // OEM fragment restoration may retain an index captured before the bridge
            // finished reading. Use the same confirmed state as the row summary.
            selected=state.choice;profile.clickedIndex.setInt(fragment,selected);
            DialogInterface.OnClickListener nativeListener=originalClick;
            SettingsSignalStyleChoices choices=new SettingsSignalStyleChoices(context,selected,index->{
                try{
                    Object dialog=profile.fragmentDialog.invoke(fragment);
                    if(dialog instanceof DialogInterface)nativeListener.onClick((DialogInterface)dialog,index);
                }catch(Throwable failure){module.logFeatureError("SETTINGS_SIGNAL_NATIVE_CHOICE_FAILED",failure);}
            });
            // setView alone leaves the original list in AlertParams. Clear only this
            // preference's list, retaining the OEM title, cancel button and dialog theme.
            replaced=true;
            profile.singleChoice.invoke(builder,null,-1,null);
            profile.customView.invoke(builder,choices);
            state.dialogFragment=new WeakReference<>(fragment);state.graphicChoices=new WeakReference<>(choices);
        }catch(Throwable failure){
            if(replaced)try{
                profile.singleChoice.invoke(builder,originalItems,selected,originalClick);
                profile.customView.invoke(builder,(Object)null);
            }catch(ReflectiveOperationException ignored){}
            module.logFeatureError("SETTINGS_SIGNAL_GRAPHIC_CHOICES_FAILED",failure);
        }
    }
    private boolean signalDialog(Object fragment)throws ReflectiveOperationException{
        if(fragment==null||!profile.listDialog.isInstance(fragment))return false;
        Bundle arguments=(Bundle)profile.fragmentArguments.invoke(fragment);
        if(arguments==null||!ENTRY.equals(arguments.getString("key")))return false;
        Object target=profile.fragmentTarget.invoke(fragment);
        if(target==null||target.getClass()!=profile.page)return false;
        Object screen=profile.screen.invoke(target);Object entry=screen==null?null:profile.find.invoke(screen,ENTRY);
        EntryState state=entries.get(entry);return state!=null&&live(state)&&entry==profile.fragmentPreference.invoke(fragment);
    }
    private void attach(Object page,AugmentModule module){
        if(!installed||page==null||page.getClass()!=profile.page)return;
        try{
            Object screen=profile.screen.invoke(page);if(screen==null)return;
            Object entry=profile.find.invoke(screen,ENTRY);
            // A restored page can still contain the former navigation preference.
            if(entry!=null&&!profile.list.isInstance(entry)){
                Object oldParent=profile.parent.invoke(entry);if(oldParent==null)return;
                profile.remove.invoke(oldParent,entry);entries.remove(entry);entry=null;
            }
            if(entry==null){
                Object battery=profile.find.invoke(screen,BATTERY);if(battery==null)return;
                Object parent=profile.parent.invoke(battery);if(parent==null)return;
                Context context=(Context)profile.context.invoke(battery);if(context==null)return;
                int order=(Integer)profile.order.invoke(battery);if(order>=Integer.MAX_VALUE-1)return;
                entry=profile.preference.newInstance(context);
                profile.key.invoke(entry,ENTRY);profile.persistent.invoke(entry,false);
                profile.value.invoke(entry,"0");
                profile.setOrder.invoke(entry,order+1);
                int count=(Integer)profile.count.invoke(parent);
                for(int i=0;i<count;i++){
                    Object sibling=profile.child.invoke(parent,i);int siblingOrder=(Integer)profile.order.invoke(sibling);
                    if(sibling!=battery&&siblingOrder>order&&siblingOrder<Integer.MAX_VALUE)profile.setOrder.invoke(sibling,siblingOrder+1);
                }
                if(!Boolean.TRUE.equals(profile.add.invoke(parent,entry)))return;
                module.logFeatureInfo("SETTINGS_SIGNAL_ENTRY_ATTACHED below="+BATTERY+" native_list_dialog=true");
            }
            profile.setEntries.invoke(entry,(Object)new CharSequence[]{"平铺","荣耀双排","iOS双排"});
            profile.setEntryValues.invoke(entry,(Object)new CharSequence[]{"0","1","2"});
            profile.title.invoke(entry,"双卡信号样式");profile.dialogTitle.invoke(entry,"双卡信号样式");
            Context context=(Context)profile.context.invoke(entry);
            EntryState state=entries.get(entry);
            if(state==null){
                state=new EntryState(entry,context);entries.put(entry,state);
                EntryState target=state;
                Object listener=Proxy.newProxyInstance(profile.listener.getClassLoader(),new Class<?>[]{profile.listener},(proxy,method,args)->{
                    if(method.getName().equals("onPreferenceChange")){
                        if(args!=null&&args.length==2&&args[0]==target.preference.get()){
                            Object value=args[1];
                            if("0".equals(value)||"1".equals(value)||"2".equals(value))select(target,Integer.parseInt((String)value));
                        }
                        // The original dialog dismisses normally. Only a confirmed module save
                        // may update the preference; Android must not persist an optimistic value.
                        return false;
                    }
                    if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                    if(method.getName().equals("equals"))return args!=null&&args.length==1&&proxy==args[0];
                    return "DuoSignalStyleChange";
                });
                profile.changeListener.invoke(entry,listener);
            }
            remember(page);update(state);read(state);
            if(!observing)observing=FeatureSettings.addSnapshotListener(context,this::refresh);
        }catch(Throwable failure){module.logFeatureError("SETTINGS_SIGNAL_ENTRY_ATTACH_FAILED",failure);}
    }
    private void remember(Object page){
        for(Iterator<WeakReference<Object>> it=pages.iterator();it.hasNext();){Object existing=it.next().get();if(existing==null)it.remove();else if(existing==page)return;}
        pages.add(new WeakReference<>(page));
    }
    private void refresh(){
        if(Looper.myLooper()!=Looper.getMainLooper()){main.post(this::refresh);return;}
        for(Iterator<WeakReference<Object>> it=pages.iterator();it.hasNext();){
            Object page=it.next().get();if(page==null){it.remove();continue;}
            try{Object screen=profile.screen.invoke(page);Object entry=screen==null?null:profile.find.invoke(screen,ENTRY);
                EntryState state=entries.get(entry);if(state!=null)update(state);
            }catch(Throwable ignored){}
        }
    }
    private boolean live(EntryState state){
        Object entry=state.preference.get();if(entry==null||entries.get(entry)!=state)return false;
        try{return profile.parent.invoke(entry)!=null;}catch(ReflectiveOperationException unavailable){return false;}
    }
    private void update(EntryState state)throws ReflectiveOperationException{
        if(!live(state))return;
        ConfigSnapshot snapshot=FeatureSettings.verifiedSnapshot(state.context);
        if(snapshot!=null&&snapshot.revision>=state.revision)
            display(state,ConfigSchema.truthy(snapshot.get(SystemUiOptions.SIGNAL_DUAL)),SignalStylePolicy.style(snapshot.get(SystemUiOptions.SIGNAL_DUAL_STYLE)),snapshot.revision);
    }
    private void display(EntryState state,boolean dual,int style,long revision)throws ReflectiveOperationException{
        if(!live(state)||revision<state.revision)return;
        Object entry=state.preference.get();state.revision=revision;state.choice=SignalStylePolicy.choice(dual,style);
        profile.value.invoke(entry,Integer.toString(state.choice));profile.summary.invoke(entry,SignalStylePolicy.choiceLabel(state.choice));
        Object fragment=state.dialogFragment==null?null:state.dialogFragment.get();
        SettingsSignalStyleChoices choices=state.graphicChoices==null?null:state.graphicChoices.get();
        if(fragment!=null&&choices!=null&&entry==profile.fragmentPreference.invoke(fragment)){
            // A bridge reply or Duo publication can arrive after the popup opens.
            // Keep its radio and the native callback index tied to the row state.
            profile.clickedIndex.setInt(fragment,state.choice);choices.setSelection(state.choice);
        }
    }
    private Bundle call(Context context,String method,Bundle extras){
        try{return context.getContentResolver().call(CONFIG,method,null,extras);}catch(RuntimeException unavailable){return null;}
    }
    private void read(EntryState state){
        long generation=state.generation;
        BRIDGE.execute(()->{Bundle reply=call(state.context,SignalStylePolicy.READ,null);main.post(()->{
            if(live(state)&&generation==state.generation)applyReply(state,reply);
        });});
    }
    private void select(EntryState state,int choice){
        if(!live(state)||state.saving)return;
        long generation=++state.generation;state.saving=true;
        try{profile.enabled.invoke(state.preference.get(),false);}catch(ReflectiveOperationException ignored){}
        BRIDGE.execute(()->{
            Bundle request=new Bundle();request.putInt("choice",choice);
            Bundle saved=call(state.context,SignalStylePolicy.SELECT,request);
            Bundle current=call(state.context,SignalStylePolicy.READ,null);
            main.post(()->{
                if(!live(state)||generation!=state.generation)return;
                state.saving=false;
                try{profile.enabled.invoke(state.preference.get(),true);update(state);}catch(ReflectiveOperationException ignored){}
                applyReply(state,current!=null&&current.getBoolean("ok",false)?current:saved);
                if(saved==null||!saved.getBoolean("ok",false))Toast.makeText(state.context,
                        saved==null?"双卡信号样式未保存，请重试":saved.getString("message","双卡信号样式未保存，请重试"),Toast.LENGTH_LONG).show();
            });
        });
    }
    private void applyReply(EntryState state,Bundle reply){
        if(reply==null||!(reply.get("dual") instanceof Boolean)||reply.getLong("revision",0)<=0)return;
        try{display(state,reply.getBoolean("dual"),SignalStylePolicy.style(reply.getString("style")),reply.getLong("revision"));}catch(ReflectiveOperationException ignored){}
    }
    /** Resolve the original notification-icon preference shape before installing callbacks. */
    private static final class Profile {
        final Class<?> page,list,listener,listDialog;
        final Constructor<?> preference;
        final Method create,resume,screen,find,parent,context,key,title,summary,persistent,order,setOrder,count,child,add,remove,
                setEntries,setEntryValues,dialogTitle,value,changeListener,enabled,prepareDialog,builderContext,singleChoice,customView,
                fragmentArguments,fragmentTarget,fragmentDialog,fragmentPreference;
        final Field builderParams,nativeClick,nativeItems,clickedIndex,dialogEntries,dialogValues;

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        Profile(ClassLoader loader)throws ReflectiveOperationException{
            page=Class.forName(PAGE,false,loader);
            Class<?> dashboard=Class.forName("com.android.settings.dashboard.DashboardFragment",false,loader);
            Class<?> base=Class.forName("androidx.preference.Preference",false,loader);
            Class<?> group=Class.forName("androidx.preference.PreferenceGroup",false,loader);
            Class<?> dialog=Class.forName("androidx.preference.DialogPreference",false,loader);
            list=Class.forName("androidx.preference.ListPreference",false,loader);
            listener=Class.forName("androidx.preference.Preference$OnPreferenceChangeListener",false,loader);
            Class<?> oem=Class.forName("com.zte.mifavor.androidx.preference.ListPreferenceZTEX",false,loader);
            if(!dashboard.isAssignableFrom(page)||!list.isAssignableFrom(oem))throw new NoSuchMethodException("Unsupported status-bar list preference profile");
            preference=oem.getConstructor(Context.class);
            create=dashboard.getDeclaredMethod("onCreatePreferences",Bundle.class,String.class);resume=dashboard.getDeclaredMethod("onResume");
            screen=page.getMethod("getPreferenceScreen");find=group.getMethod("findPreference",CharSequence.class);parent=base.getMethod("getParent");
            context=base.getMethod("getContext");key=base.getMethod("setKey",String.class);title=base.getMethod("setTitle",CharSequence.class);
            summary=base.getMethod("setSummary",CharSequence.class);persistent=base.getMethod("setPersistent",boolean.class);order=base.getMethod("getOrder");
            setOrder=base.getMethod("setOrder",int.class);count=group.getMethod("getPreferenceCount");child=group.getMethod("getPreference",int.class);
            add=group.getMethod("addPreference",base);remove=group.getMethod("removePreference",base);
            setEntries=list.getMethod("setEntries",CharSequence[].class);setEntryValues=list.getMethod("setEntryValues",CharSequence[].class);
            dialogTitle=dialog.getMethod("setDialogTitle",CharSequence.class);value=list.getMethod("setValue",String.class);
            changeListener=base.getMethod("setOnPreferenceChangeListener",listener);enabled=base.getMethod("setEnabled",boolean.class);
            listDialog=Class.forName("androidx.preference.ListPreferenceDialogFragmentCompat",false,loader);
            Class<?> fragment=Class.forName("androidx.fragment.app.Fragment",false,loader);
            Class<?> dialogFragment=Class.forName("androidx.fragment.app.DialogFragment",false,loader);
            Class<?> builder=Class.forName("androidx.appcompat.app.AlertDialog$Builder",false,loader);
            Class<?> params=Class.forName("androidx.appcompat.app.AlertController$AlertParams",false,loader);
            prepareDialog=listDialog.getDeclaredMethod("onPrepareDialogBuilder",builder);prepareDialog.setAccessible(true);
            builderContext=builder.getMethod("getContext");customView=builder.getMethod("setView",android.view.View.class);
            singleChoice=builder.getMethod("setSingleChoiceItems",CharSequence[].class,int.class,DialogInterface.OnClickListener.class);
            builderParams=builder.getDeclaredField("P");builderParams.setAccessible(true);
            nativeClick=params.getDeclaredField("mOnClickListener");nativeClick.setAccessible(true);
            nativeItems=params.getDeclaredField("mItems");nativeItems.setAccessible(true);
            clickedIndex=listDialog.getDeclaredField("mClickedDialogEntryIndex");clickedIndex.setAccessible(true);
            dialogEntries=listDialog.getDeclaredField("mEntries");dialogEntries.setAccessible(true);
            dialogValues=listDialog.getDeclaredField("mEntryValues");dialogValues.setAccessible(true);
            if(dialogEntries.getType()!=CharSequence[].class||dialogValues.getType()!=CharSequence[].class)
                throw new NoSuchFieldException("Unsupported native list dialog choice arrays");
            fragmentArguments=fragment.getMethod("getArguments");fragmentTarget=fragment.getMethod("getTargetFragment");
            fragmentDialog=dialogFragment.getMethod("getDialog");fragmentPreference=listDialog.getMethod("getPreference");
        }
    }
}
