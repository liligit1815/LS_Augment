"""Execute the real Settings signal hook against native dialog/transport boundaries.

No device, native Settings write, activity navigation, root command, or real IPC is
used. SignalStyleControl's AppConfig behavior is covered by its separate suite;
this fixture checks the native preference integration and async UI publication.
"""
from pathlib import Path
import hashlib
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PACKAGE = ROOT / 'android/app/src/main/java/ls/augment/com'

SOURCES = {
    'android/net/Uri.java': '''package android.net;public final class Uri {public final String value;private Uri(String v){value=v;}public static Uri parse(String v){return new Uri(v);}}''',
    'android/os/Bundle.java': '''package android.os;import java.util.*;public final class Bundle {private final Map<String,Object> data=new HashMap<>();public int size(){return data.size();}public Object get(String k){return data.get(k);}public boolean containsKey(String k){return data.containsKey(k);}public void putBoolean(String k,boolean v){data.put(k,v);}public void putString(String k,String v){data.put(k,v);}public void putLong(String k,long v){data.put(k,v);}public void putInt(String k,int v){data.put(k,v);}public boolean getBoolean(String k){return getBoolean(k,false);}public boolean getBoolean(String k,boolean d){Object v=data.get(k);return v instanceof Boolean?(Boolean)v:d;}public String getString(String k){return getString(k,null);}public String getString(String k,String d){Object v=data.get(k);return v instanceof String?(String)v:d;}public long getLong(String k){return getLong(k,0);}public long getLong(String k,long d){Object v=data.get(k);return v instanceof Long?(Long)v:d;}}''',
    'android/os/Looper.java': '''package android.os;public final class Looper {private static final Looper MAIN=new Looper();private static final Thread OWNER=Thread.currentThread();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return Thread.currentThread()==OWNER?MAIN:null;}}''',
    'android/os/Handler.java': '''package android.os;import java.util.concurrent.*;public final class Handler {private static final ConcurrentLinkedQueue<Runnable> tasks=new ConcurrentLinkedQueue<>();public Handler(Looper l){}public boolean post(Runnable r){tasks.add(r);return true;}public boolean postDelayed(Runnable r,long delay){tasks.add(r);return true;}public void removeCallbacks(Runnable r){tasks.removeIf(v->v==r);}public static void drain(){Runnable r;while((r=tasks.poll())!=null)r.run();}}''',
    'android/content/Intent.java': '''package android.content;public final class Intent {public static int constructions;public Intent(){constructions++;throw new AssertionError("signal popup must not construct a navigation Intent");}public Intent setClassName(String p,String c){throw new AssertionError("activity route returned");}}''',
    'android/content/ContentResolver.java': '''package android.content;import android.net.Uri;import android.os.Bundle;public abstract class ContentResolver {public abstract Bundle call(Uri uri,String method,String arg,Bundle extras);}''',
    'android/content/Context.java': '''package android.content;public class Context {private final ContentResolver resolver;public Context(ContentResolver r){resolver=r;}public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}public String getPackageName(){return "com.android.settings";}public void startActivity(Intent i){throw new AssertionError("popup must never navigate to module activity");}}''',
    'android/widget/Toast.java': '''package android.widget;import android.content.Context;import java.util.*;public final class Toast {public static final int LENGTH_SHORT=0,LENGTH_LONG=1;public static final List<String> shown=new ArrayList<>();private final String value;private Toast(String s){value=s;}public static Toast makeText(Context c,CharSequence text,int duration){return new Toast(text.toString());}public void show(){shown.add(value);}}''',
    'ls/augment/com/SystemUiOptions.java': '''package ls.augment.com;public final class SystemUiOptions {public static final String SIGNAL_DUAL="ls_augment_rm_signal_dual",SIGNAL_DUAL_STYLE="ls_augment_rm_signal_dual_style";}''',
    'ls/augment/com/ConfigSchema.java': '''package ls.augment.com;public final class ConfigSchema {public static final String STATUSBAR_CONNECTIVITY_GROUP="three_in_one",SYSTEMUI_MASTER="master";public static boolean truthy(String v){return "1".equals(v)||"true".equalsIgnoreCase(v);}}''',
    'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com;public final class ConfigSnapshot {public final long revision;public ConfigSnapshot(long r){revision=r;}public String get(String k){return SystemUiOptions.SIGNAL_DUAL_STYLE.equals(k)?ls.augment.com.hook.FeatureSettings.style:ls.augment.com.hook.FeatureSettings.enabled(null,k)?"1":"0";}}''',
    'host/Hooks.java': r'''
package host;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
public final class Hooks {
 public interface Original {Object call()throws Throwable;}
 public interface Interceptor {Object call(Chain chain)throws Throwable;}
 public static final Map<Method,Interceptor> hooks=new ConcurrentHashMap<>();
 public static final Map<Method,Integer> originals=new ConcurrentHashMap<>();
 public static final class Chain {
  final Object owner;final Object[] args;final Method method;final Original original;int proceeded;
  Chain(Object o,Object[] a,Method m,Original p){owner=o;args=a;method=m;original=p;}
  public Object getThisObject(){return owner;}public Object getArg(int n){return args[n];}public List<Object> getArgs(){return Arrays.asList(args);}
  public Object proceed()throws Throwable{if(++proceeded!=1)throw new AssertionError("original repeated "+method);originals.merge(method,1,Integer::sum);return original.call();}
 }
 public static final class Builder {
  final Method method;public Builder(Method m){method=m;}
  public Object intercept(Interceptor h){if(hooks.putIfAbsent(method,h)!=null)throw new AssertionError("duplicate hook");return method;}
 }
 public static Object invoke(Class<?> type,String name,Class<?>[] params,Object owner,Object[] args,Original original){
  try{Method m=type.getDeclaredMethod(name,params);Chain c=new Chain(owner,args,m,original);Interceptor h=hooks.get(m);return h==null?c.proceed():h.call(c);}
  catch(RuntimeException|Error e){throw e;}catch(Throwable t){throw new RuntimeException(t);}
 }
}
''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.Method;import java.util.*;final class AugmentModule {final List<String> failures=new ArrayList<>();host.Hooks.Builder prepareFeatureHook(Method m,String id,boolean deopt){return new host.Hooks.Builder(m);}void registerFeatureHook(Object h){}void logFeatureInfo(String s){}void logFeatureError(String s,Throwable t){failures.add(s+":"+t);}}''',
    'ls/augment/com/hook/FeatureSettings.java': r'''
package ls.augment.com.hook;
import android.content.Context;import java.util.*;import ls.augment.com.*;
public final class FeatureSettings {
 public static volatile boolean dual,three,master;public static volatile long revision=1;public static volatile String style="0";
 static final List<Runnable> listeners=new ArrayList<>();
 public static boolean enabled(Context c,String key){return SystemUiOptions.SIGNAL_DUAL.equals(key)?dual:ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP.equals(key)?three:master;}
 static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}
 static void invalidateSnapshot(){}
 static ConfigSnapshot snapshot(Context c){return new ConfigSnapshot(revision);}static boolean hasVerifiedSnapshot(Context c){return true;}
 static ConfigSnapshot verifiedSnapshot(Context c){return new ConfigSnapshot(revision);}
 static void publish(boolean d,boolean t,boolean m,long r){dual=d;three=t;master=m;revision=r;for(Runnable l:new ArrayList<>(listeners))l.run();}
}
''',
    'androidx/preference/PreferenceManager.java': '''package androidx.preference;public final class PreferenceManager {public int dialogs;public void showDialog(DialogPreference preference){dialogs++;if(!(preference instanceof com.zte.mifavor.androidx.preference.ListPreferenceZTEX))throw new AssertionError("native list preference required");((com.zte.mifavor.androidx.preference.ListPreferenceZTEX)preference).displayDialog();}}''',
    'androidx/preference/Preference.java': r'''
package androidx.preference;
import android.content.*;
public class Preference {
 public interface OnPreferenceChangeListener {boolean onPreferenceChange(Preference preference,Object value);}
 public interface OnPreferenceClickListener {boolean onPreferenceClick(Preference preference);}
 public static int nativeWrites,valueWrites;
 protected final Context context;private PreferenceGroup parent;private PreferenceManager manager;
 private String key;private CharSequence title,summary;private int order;private boolean persistent=true,enabled=true;private Intent intent;
 private OnPreferenceChangeListener change;private OnPreferenceClickListener click;
 public Preference(Context c){context=c;}
 public Context getContext(){return context;}public PreferenceGroup getParent(){return parent;}void attach(PreferenceGroup g,PreferenceManager m){parent=g;manager=m;}
 public PreferenceManager getPreferenceManager(){return manager;}public void setKey(String s){key=s;}public String getKey(){return key;}
 public void setTitle(CharSequence v){title=v;}public CharSequence getTitle(){return title;}public void setSummary(CharSequence v){summary=v;}public CharSequence getSummary(){return summary;}
 public void setOrder(int v){order=v;}public int getOrder(){return order;}public void setPersistent(boolean v){persistent=v;}public boolean isPersistent(){return persistent;}
 public void setEnabled(boolean v){enabled=v;}public boolean isEnabled(){return enabled;}public void setIntent(Intent v){intent=v;}public Intent getIntent(){return intent;}
 public void setOnPreferenceChangeListener(OnPreferenceChangeListener l){change=l;}public OnPreferenceChangeListener getOnPreferenceChangeListener(){return change;}
 public void setOnPreferenceClickListener(OnPreferenceClickListener l){click=l;}
 public boolean callChangeListener(Object value){return change==null||change.onPreferenceChange(this,value);}
 protected void onClick(){}public void performClick(){if(!enabled)return;if(click!=null&&click.onPreferenceClick(this))return;onClick();if(intent!=null)context.startActivity(intent);}
 protected void persistString(String v){if(persistent)nativeWrites++;}
}
''',
    'androidx/preference/PreferenceGroup.java': r'''
package androidx.preference;
import android.content.Context;import java.util.*;
public class PreferenceGroup extends Preference {
 protected final List<Preference> children=new ArrayList<>();private final PreferenceManager manager=new PreferenceManager();
 public PreferenceGroup(Context c){super(c);}public Preference findPreference(CharSequence key){for(Preference p:children){if(key.equals(p.getKey()))return p;if(p instanceof PreferenceGroup){Preference found=((PreferenceGroup)p).findPreference(key);if(found!=null)return found;}}return null;}
 public int getPreferenceCount(){return children.size();}public Preference getPreference(int i){children.sort(Comparator.comparingInt(Preference::getOrder));return children.get(i);}
 public boolean addPreference(Preference p){if(children.contains(p))return false;children.add(p);p.attach(this,manager);return true;}public boolean removePreference(Preference p){boolean removed=children.remove(p);if(removed)p.attach(null,null);return removed;}
}
''',
    'androidx/preference/PreferenceScreen.java': '''package androidx.preference;import android.content.Context;public final class PreferenceScreen extends PreferenceGroup {public PreferenceScreen(Context c){super(c);}}''',
    'androidx/preference/DialogPreference.java': '''package androidx.preference;import android.content.Context;public class DialogPreference extends Preference {private CharSequence dialogTitle;public DialogPreference(Context c){super(c);}public void setDialogTitle(CharSequence s){dialogTitle=s;}public CharSequence getDialogTitle(){return dialogTitle;}}''',
    'androidx/preference/ListPreference.java': r'''
package androidx.preference;
import android.content.Context;
public class ListPreference extends DialogPreference {
 private CharSequence[] entries,values;private String value;public ListPreference(Context c){super(c);}
 public void setEntries(CharSequence[] v){entries=v;}public CharSequence[] getEntries(){return entries;}public void setEntryValues(CharSequence[] v){values=v;}public CharSequence[] getEntryValues(){return values;}
 public void setValue(String v){value=v;valueWrites++;persistString(v);}public String getValue(){return value;}public void setValueIndex(int i){setValue(values[i].toString());}
 public int findIndexOfValue(String v){if(values==null)return -1;for(int i=0;i<values.length;i++)if(values[i].toString().equals(v))return i;return -1;}
 public CharSequence getEntry(){int i=findIndexOfValue(value);return i<0?null:entries[i];}
 @Override protected void onClick(){getPreferenceManager().showDialog(this);}
}
''',
    'com/zte/mifavor/androidx/preference/PreferenceZTEX.java': '''package com.zte.mifavor.androidx.preference;import android.content.Context;public class PreferenceZTEX extends androidx.preference.Preference {public PreferenceZTEX(Context c){super(c);}}''',
    'com/zte/mifavor/androidx/preference/ListPreferenceZTEX.java': r'''
package com.zte.mifavor.androidx.preference;
import android.content.Context;
public class ListPreferenceZTEX extends androidx.preference.ListPreference {
 public int shown,canceled;public boolean open;public String initialValue;
 public ListPreferenceZTEX(Context c){super(c);}
 public void displayDialog(){shown++;open=true;initialValue=getValue();}
 public void choose(int index){if(!open)throw new AssertionError("native dialog must be opened before selection");String next=getEntryValues()[index].toString();open=false;if(callChangeListener(next))setValue(next);}
 public void cancel(){if(!open)throw new AssertionError("no native dialog");open=false;canceled++;}
}
''',
    'com/android/settings/dashboard/DashboardFragment.java': r'''
package com.android.settings.dashboard;
import android.os.Bundle;import androidx.preference.*;import android.content.Context;import host.Hooks;
public class DashboardFragment {
 protected final PreferenceScreen screen;public int created,resumed;
 public DashboardFragment(Context c){screen=new PreferenceScreen(c);}
 public PreferenceScreen getPreferenceScreen(){return screen;}
 public void onCreatePreferences(Bundle b,String root){Hooks.invoke(DashboardFragment.class,"onCreatePreferences",new Class[]{Bundle.class,String.class},this,new Object[]{b,root},()->{created++;return null;});}
 public void onResume(){Hooks.invoke(DashboardFragment.class,"onResume",new Class[]{},this,new Object[]{},()->{resumed++;return null;});}
}
''',
    'com/zte/settings/notification/StatusBarIconsSettingsFragment.java': '''package com.zte.settings.notification;import android.content.Context;public final class StatusBarIconsSettingsFragment extends com.android.settings.dashboard.DashboardFragment {public StatusBarIconsSettingsFragment(Context c){super(c);}}''',
}

# Graphic rendering is verified on the device. These boundaries model the OEM
# dialog lifecycle and builder contract while leaving the custom View opaque.
SOURCES.update({
    'android/content/DialogInterface.java': '''package android.content;public interface DialogInterface {int BUTTON_POSITIVE=-1,BUTTON_NEGATIVE=-2;interface OnClickListener{void onClick(DialogInterface dialog,int which);}void dismiss();}''',
    'android/view/View.java': '''package android.view;import android.content.Context;public class View {private final Context context;public View(Context c){context=c;}public Context getContext(){return context;}}''',
    'android/app/Dialog.java': '''package android.app;import android.content.DialogInterface;public class Dialog implements DialogInterface {public boolean dismissed;public int dismisses;public Runnable onDismiss;public void dismiss(){if(dismissed)return;dismissed=true;dismisses++;if(onDismiss!=null)onDismiss.run();}}''',
    'androidx/fragment/app/Fragment.java': '''package androidx.fragment.app;import android.os.Bundle;public class Fragment {private Bundle arguments;private Fragment target;public Bundle getArguments(){return arguments;}public void setArguments(Bundle value){arguments=value;}public Fragment getTargetFragment(){return target;}public void setTargetFragment(Fragment value,int requestCode){target=value;}}''',
    'androidx/fragment/app/DialogFragment.java': '''package androidx.fragment.app;import android.app.Dialog;import android.content.DialogInterface;public class DialogFragment extends Fragment {protected Dialog dialog;public Dialog getDialog(){return dialog;}public void dismiss(){if(dialog!=null)dialog.dismiss();}public void onDismiss(DialogInterface value){}}''',
    'androidx/appcompat/app/AlertController.java': '''package androidx.appcompat.app;import android.content.*;import android.view.View;public final class AlertController {public static final class AlertParams {public final Context mContext;public CharSequence[] mItems;public Object mCursor,mAdapter;public DialogInterface.OnClickListener mOnClickListener;public int mCheckedItem=-1;public boolean mIsSingleChoice;public View mView;public CharSequence mTitle,mPositiveButtonText,mNegativeButtonText;public DialogInterface.OnClickListener mPositiveButtonListener,mNegativeButtonListener;public AlertParams(Context c){mContext=c;}}}''',
    'androidx/appcompat/app/AlertDialog.java': r'''
package androidx.appcompat.app;
import android.content.*;import android.view.View;
public final class AlertDialog extends android.app.Dialog {
 public final Builder builder;public AlertDialog(Builder b){builder=b;}
 public static final class Builder {
  private final AlertController.AlertParams P;public int views,singleChoiceCalls;
  public Builder(Context c){P=new AlertController.AlertParams(c);}public Context getContext(){return P.mContext;}
  public Builder setTitle(CharSequence title){P.mTitle=title;return this;}public Builder setNegativeButton(CharSequence title,DialogInterface.OnClickListener listener){P.mNegativeButtonText=title;P.mNegativeButtonListener=listener;return this;}
  public Builder setPositiveButton(CharSequence title,DialogInterface.OnClickListener listener){P.mPositiveButtonText=title;P.mPositiveButtonListener=listener;return this;}
  public Builder setSingleChoiceItems(CharSequence[] entries,int selected,DialogInterface.OnClickListener listener){singleChoiceCalls++;P.mItems=entries;P.mCheckedItem=selected;P.mOnClickListener=listener;P.mIsSingleChoice=true;return this;}
  public Builder setView(View view){views++;P.mView=view;return this;}public AlertDialog create(){return new AlertDialog(this);}
  public AlertController.AlertParams params(){return P;}
 }
}
''',
    'androidx/preference/PreferenceManager.java': '''package androidx.preference;import androidx.fragment.app.Fragment;public final class PreferenceManager {public int dialogs;public Fragment host;public void showDialog(DialogPreference preference){dialogs++;if(!(preference instanceof com.zte.mifavor.androidx.preference.ListPreferenceZTEX))throw new AssertionError("native list preference required");((com.zte.mifavor.androidx.preference.ListPreferenceZTEX)preference).displayDialog();}}''',
    'androidx/preference/PreferenceGroup.java': r'''
package androidx.preference;
import android.content.Context;import java.util.*;import androidx.fragment.app.Fragment;
public class PreferenceGroup extends Preference {
 protected final List<Preference> children=new ArrayList<>();private final PreferenceManager manager=new PreferenceManager();
 public PreferenceGroup(Context c){super(c);}public void setHost(Fragment host){manager.host=host;}
 public Preference findPreference(CharSequence key){for(Preference p:children){if(key.equals(p.getKey()))return p;if(p instanceof PreferenceGroup){Preference found=((PreferenceGroup)p).findPreference(key);if(found!=null)return found;}}return null;}
 public int getPreferenceCount(){return children.size();}public Preference getPreference(int i){children.sort(Comparator.comparingInt(Preference::getOrder));return children.get(i);}
 public boolean addPreference(Preference p){if(children.contains(p))return false;children.add(p);p.attach(this,manager);return true;}public boolean removePreference(Preference p){boolean removed=children.remove(p);if(removed)p.attach(null,null);return removed;}
}
''',
    'com/android/settings/dashboard/DashboardFragment.java': r'''
package com.android.settings.dashboard;
import android.os.Bundle;import androidx.preference.*;import android.content.Context;import host.Hooks;
public class DashboardFragment extends androidx.fragment.app.Fragment {
 protected final PreferenceScreen screen;public int created,resumed;
 public DashboardFragment(Context c){screen=new PreferenceScreen(c);screen.setHost(this);}
 public PreferenceScreen getPreferenceScreen(){return screen;}public Preference findPreference(CharSequence key){return screen.findPreference(key);}
 public void onCreatePreferences(Bundle b,String root){Hooks.invoke(DashboardFragment.class,"onCreatePreferences",new Class[]{Bundle.class,String.class},this,new Object[]{b,root},()->{created++;return null;});}
 public void onResume(){Hooks.invoke(DashboardFragment.class,"onResume",new Class[]{},this,new Object[]{},()->{resumed++;return null;});}
}
''',
    'androidx/preference/PreferenceDialogFragmentCompat.java': r'''
package androidx.preference;
import android.app.Dialog;import android.content.*;import androidx.appcompat.app.AlertDialog;
public class PreferenceDialogFragmentCompat extends androidx.fragment.app.DialogFragment implements DialogInterface.OnClickListener {
 private int mWhichButtonClicked=DialogInterface.BUTTON_NEGATIVE;protected DialogPreference preference;
 public DialogPreference getPreference(){return preference;}
 public void onClick(DialogInterface dialog,int which){mWhichButtonClicked=which;}
 public void onDialogClosed(boolean positive){}
 @Override public void onDismiss(DialogInterface dialog){onDialogClosed(mWhichButtonClicked==DialogInterface.BUTTON_POSITIVE);}
 protected void onPrepareDialogBuilder(AlertDialog.Builder builder){}
 protected void createNativeDialog(){
  mWhichButtonClicked=DialogInterface.BUTTON_NEGATIVE;
  AlertDialog.Builder builder=new AlertDialog.Builder(preference.getContext()).setTitle(preference.getDialogTitle()).setNegativeButton("取消",this).setPositiveButton("确定",this);
  onPrepareDialogBuilder(builder);dialog=builder.create();dialog.onDismiss=()->onDismiss(dialog);
 }
}
''',
    'androidx/preference/ListPreferenceDialogFragmentCompat.java': r'''
package androidx.preference;
import android.content.*;import android.os.Bundle;import androidx.appcompat.app.AlertDialog;import androidx.fragment.app.Fragment;import host.Hooks;
public class ListPreferenceDialogFragmentCompat extends PreferenceDialogFragmentCompat {
 int mClickedDialogEntryIndex;private CharSequence[] mEntries,mEntryValues;
 public int nativeChoiceCallbacks,positiveClosures;
 public void initialize(ListPreference value,Fragment target,Integer restoredIndex){
  preference=value;Bundle arguments=new Bundle();arguments.putString("key",value.getKey());setArguments(arguments);setTargetFragment(target,0);
  mEntries=value.getEntries();mEntryValues=value.getEntryValues();mClickedDialogEntryIndex=restoredIndex==null?value.findIndexOfValue(value.getValue()):restoredIndex;
  createNativeDialog();
 }
 public void initializeLegacy(ListPreference value,Fragment target){
  preference=value;Bundle arguments=new Bundle();arguments.putString("key",value.getKey());setArguments(arguments);setTargetFragment(target,0);
  mEntries=new CharSequence[]{"平铺","合并"};mEntryValues=new CharSequence[]{"0","1"};mClickedDialogEntryIndex=0;createNativeDialog();
 }
 @Override protected void onPrepareDialogBuilder(AlertDialog.Builder builder){
  Hooks.invoke(ListPreferenceDialogFragmentCompat.class,"onPrepareDialogBuilder",new Class[]{AlertDialog.Builder.class},this,new Object[]{builder},()->{
   builder.setSingleChoiceItems(mEntries,mClickedDialogEntryIndex,(dialog,which)->{nativeChoiceCallbacks++;mClickedDialogEntryIndex=which;onClick(dialog,DialogInterface.BUTTON_POSITIVE);dialog.dismiss();});
   builder.setPositiveButton(null,null);return null;
  });
 }
 @Override public void onDialogClosed(boolean positive){
  if(preference instanceof com.zte.mifavor.androidx.preference.ListPreferenceZTEX){com.zte.mifavor.androidx.preference.ListPreferenceZTEX p=(com.zte.mifavor.androidx.preference.ListPreferenceZTEX)preference;p.open=false;if(!positive)p.canceled++;}
  if(positive&&mClickedDialogEntryIndex>=0){positiveClosures++;String next=mEntryValues[mClickedDialogEntryIndex].toString();if(preference.callChangeListener(next))((ListPreference)preference).setValue(next);}
 }
 public int selected(){return mClickedDialogEntryIndex;}public AlertDialog.Builder builder(){return ((AlertDialog)getDialog()).builder;}
}
''',
    'com/zte/mifavor/androidx/preference/ListPreferenceZTEX.java': r'''
package com.zte.mifavor.androidx.preference;
import android.content.Context;import androidx.preference.*;
public class ListPreferenceZTEX extends ListPreference {
 public int shown,canceled;public boolean open;public String initialValue;public ListPreferenceDialogFragmentCompat dialog;
 public ListPreferenceZTEX(Context c){super(c);}
 public void displayDialog(){shown++;open=true;initialValue=getValue();dialog=new ListPreferenceDialogFragmentCompat();dialog.initialize(this,getPreferenceManager().host,null);}
 public void choose(int index){
  if(!open)throw new AssertionError("native dialog must be opened before selection");
  android.view.View content=dialog.builder().params().mView;
  if(content==null)dialog.builder().params().mOnClickListener.onClick(dialog.getDialog(),index);
  else ls.augment.com.hook.SettingsSignalStyleChoices.activate(content,index);
 }
 public void cancel(){if(!open)throw new AssertionError("no native dialog");dialog.getDialog().dismiss();}
}
''',
    'ls/augment/com/hook/SettingsSignalStyleChoices.java': r'''
package ls.augment.com.hook;
import android.content.Context;import android.view.View;import java.util.function.IntConsumer;
/** Opaque custom-content boundary. No painting or pixel assertions in this fixture. */
public final class SettingsSignalStyleChoices extends View {
 static int constructions;int selected,style;final IntConsumer onChoice;int activations;
 SettingsSignalStyleChoices(Context context,int selected,IntConsumer onChoice){super(context);constructions++;this.selected=selected;this.style=selected==2?1:0;this.onChoice=onChoice;}
 void setSelection(int choice){selected=choice;style=choice==2?1:0;}
 public static void activate(View view,int index){if(!(view instanceof SettingsSignalStyleChoices))throw new AssertionError("unexpected custom dialog View");if(index<0||index>2)throw new AssertionError("invalid column");SettingsSignalStyleChoices choices=(SettingsSignalStyleChoices)view;choices.activations++;choices.onChoice.accept(index);}
}
''',
})


def execute(sources, entry):
    java_home = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
    javac = str(java_home / 'bin/javac.exe') if os.name == 'nt' else 'javac'
    java = str(java_home / 'bin/java.exe') if os.name == 'nt' else 'java'
    with tempfile.TemporaryDirectory(prefix='lsa-settings-signal-popup-') as directory:
        work = Path(directory)
        files = []
        for name, source in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding='utf-8')
            files.append(str(path))
        classes = work / 'classes'
        subprocess.run([javac, '-J-Duser.language=en', '-J-Duser.country=US', '-encoding', 'UTF-8', '--release', '17', '-d', str(classes), *files], check=True)
        return subprocess.run([java, '-cp', str(classes), entry], timeout=25).returncode


def main():
    sources = dict(SOURCES)
    for relative in ('hook/SettingsSignalEntryHook.java', 'SignalStylePolicy.java'):
        path = PACKAGE / relative
        sources['ls/augment/com/' + relative] = path.read_text(encoding='utf-8')
        print('SOURCE', path.relative_to(ROOT).as_posix(), hashlib.sha256(path.read_bytes()).hexdigest(), flush=True)
    sources['ls/augment/com/hook/TestSettingsSignalPopup.java'] = JAVA
    return execute(sources, 'ls.augment.com.hook.TestSettingsSignalPopup')


JAVA = r'''
package ls.augment.com.hook;
import android.content.*;import android.net.Uri;import android.os.*;import android.widget.Toast;
import androidx.preference.*;import com.zte.mifavor.androidx.preference.*;
import com.zte.settings.notification.StatusBarIconsSettingsFragment;
import ls.augment.com.*;import java.util.*;import java.util.concurrent.*;
public final class TestSettingsSignalPopup {
 static int assertions;static Resolver resolver;static Context context;static AugmentModule module;
 static StatusBarIconsSettingsFragment page;static Preference battery,later;static ListPreferenceZTEX nativeNotification;
 interface Condition {boolean get();}
 static void check(boolean ok,String label){assertions++;if(!ok)throw new AssertionError(label);}
 static void until(Condition condition,String label)throws Exception {
  long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
  while(true){Handler.drain();if(condition.get())return;if(System.nanoTime()>end)throw new AssertionError("timeout: "+label+"; errors="+module.failures);Thread.sleep(2);}
 }
 static void await(CountDownLatch gate,String label)throws Exception {if(!gate.await(5,TimeUnit.SECONDS))throw new AssertionError("timeout: "+label);}
 static void idle()throws Exception{for(int i=0;i<5;i++){Handler.drain();Thread.sleep(3);}}
 static ListPreferenceZTEX entry(){Preference p=page.getPreferenceScreen().findPreference(SettingsSignalEntryHook.ENTRY);check(p instanceof ListPreferenceZTEX,"entry is actual OEM native ListPreferenceZTEX");return (ListPreferenceZTEX)p;}
 static void choose(ListPreferenceZTEX pref,int index){pref.performClick();check(pref.open,"actual native preference click opens native displayDialog");pref.choose(index);}
 static final class Resolver extends ContentResolver {
  volatile boolean dual,three,master;volatile long revision=1;volatile String style="0";
  volatile int selects,reads,wrongThread;volatile boolean failNext,throwNext;
  volatile CountDownLatch selectGate=new CountDownLatch(0),selectEntered=new CountDownLatch(0);
  volatile CountDownLatch readGate=new CountDownLatch(0),readEntered=new CountDownLatch(0);
  synchronized Bundle result(boolean ok,String message){Bundle out=new Bundle();out.putBoolean("ok",ok);out.putString("message",message);out.putBoolean("dual",dual);out.putString("style",style);out.putBoolean("threeInOne",three);out.putBoolean("master",master);out.putLong("revision",revision);return out;}
  synchronized void external(boolean d,boolean t,boolean m,long r){dual=d;three=t;master=m;revision=r;FeatureSettings.publish(d,t,m,r);}
  public Bundle call(Uri uri,String method,String arg,Bundle extras) {
   if(Looper.myLooper()==Looper.getMainLooper())wrongThread++;
   if(!"content://ls.augment.com.config".equals(uri.value)||arg!=null)throw new AssertionError("narrow module provider command required");
   try {
    if(SignalStylePolicy.SELECT.equals(method)){
     selects++;if(extras==null||extras.size()!=1||!(extras.get("choice") instanceof Integer))throw new AssertionError("selection carries only typed choice field");
     int choice=(Integer)extras.get("choice");if(choice<0||choice>2)throw new AssertionError("selection choice outside supported range");
     boolean next=choice!=0;selectEntered.countDown();await(selectGate,"select gate release");
     synchronized(this){
      if(throwNext){throwNext=false;throw new IllegalStateException("provider unavailable");}
      if(failNext){failNext=false;return result(false,"模拟保存失败");}
      if(next&&three)return result(false,SignalStylePolicy.CONFLICT_MESSAGE);
      dual=next;if(next){master=true;style=choice==2?"1":"0";}revision++;return result(true,"");
     }
    }
    if(SignalStylePolicy.READ.equals(method)){
     if(extras!=null)throw new AssertionError("READ cannot carry arbitrary extras");reads++;Bundle captured=result(true,"");
     readEntered.countDown();await(readGate,"read gate release");return captured;
    }
    throw new AssertionError("unexpected provider command "+method);
   }catch(InterruptedException failure){throw new AssertionError(failure);}catch(Exception failure){if(failure instanceof RuntimeException)throw (RuntimeException)failure;throw new AssertionError(failure);}
  }
 }
 static void setup()throws Exception {
  resolver=new Resolver();context=new Context(resolver);module=new AugmentModule();page=new StatusBarIconsSettingsFragment(context);
  nativeNotification=new ListPreferenceZTEX(context);nativeNotification.setKey("notification_icons");nativeNotification.setTitle("通知图标");nativeNotification.setDialogTitle("通知图标");nativeNotification.setEntries(new CharSequence[]{"显示","不显示"});nativeNotification.setEntryValues(new CharSequence[]{"1","0"});nativeNotification.setPersistent(false);nativeNotification.setValue("1");nativeNotification.setOrder(10);
  battery=new PreferenceZTEX(context);battery.setKey(SettingsSignalEntryHook.BATTERY);battery.setOrder(20);
  later=new PreferenceZTEX(context);later.setKey("later");later.setOrder(21);
  page.getPreferenceScreen().addPreference(nativeNotification);page.getPreferenceScreen().addPreference(battery);page.getPreferenceScreen().addPreference(later);
  FeatureSettings.publish(false,false,false,1);SettingsSignalEntryHook.install(module,TestSettingsSignalPopup.class.getClassLoader());
  check(module.failures.isEmpty(),"complete checked OEM profile installs");page.onCreatePreferences(null,null);page.onResume();
  until(()->{Preference p=page.getPreferenceScreen().findPreference(SettingsSignalEntryHook.ENTRY);return p instanceof ListPreferenceZTEX&&p.isEnabled()&&"0".equals(((ListPreferenceZTEX)p).getValue());},"initial native preference state");
 }
 static void creationAndNativeDialog()throws Exception {
  ListPreferenceZTEX p=entry();check("双卡信号样式".contentEquals(p.getTitle()),"entry title matches requested wording");
  check("双卡信号样式".contentEquals(p.getDialogTitle()),"native popup receives matching title");
  check(Arrays.equals(p.getEntries(),new CharSequence[]{"平铺","荣耀双排","iOS双排"})&&Arrays.equals(p.getEntryValues(),new CharSequence[]{"0","1","2"}),"native popup owns all three canonical style options");
  check(!p.isPersistent()&&p.getIntent()==null&&Intent.constructions==0,"popup has no native persistence or module activity Intent");
  check(page.getPreferenceScreen().getPreferenceCount()==4&&page.getPreferenceScreen().getPreference(2)==p&&page.getPreferenceScreen().getPreference(1)==battery&&page.getPreferenceScreen().getPreference(3)==later,"entry immediately follows battery percentage");
  page.onCreatePreferences(null,null);page.onResume();idle();check(entry()==p&&page.getPreferenceScreen().getPreferenceCount()==4,"repeated lifecycle does not duplicate entry");
  nativeNotification.performClick();check(nativeNotification.open&&nativeNotification.shown==1,"original notification icon uses unchanged native displayDialog");nativeNotification.cancel();
  int selects=resolver.selects;p.performClick();check(p.open&&p.shown==1&&"0".equals(p.initialValue),"signal click uses same native dialog with current single selection");p.cancel();idle();
  check(resolver.selects==selects&&"0".equals(p.getValue())&&Preference.nativeWrites==0,"cancel only closes native dialog and never writes");
  Preference.OnPreferenceChangeListener listener=p.getOnPreferenceChangeListener();
  check(!listener.onPreferenceChange(p,"invalid")&&!listener.onPreferenceChange(p,"3")&&!listener.onPreferenceChange(p,2)&&!listener.onPreferenceChange(p,null)&&!listener.onPreferenceChange(nativeNotification,"1"),"change listener rejects invalid values, wrong types and foreign preference identity");
  idle();check(resolver.selects==selects,"invalid or foreign listener callbacks issue no selection commands");
  com.android.settings.dashboard.DashboardFragment unrelated=new com.android.settings.dashboard.DashboardFragment(context);unrelated.onCreatePreferences(null,null);unrelated.onResume();check(unrelated.getPreferenceScreen().getPreferenceCount()==0&&unrelated.created==1&&unrelated.resumed==1,"unrelated Settings page remains unchanged");
 }
 static ListPreferenceZTEX fixture(String key){
  ListPreferenceZTEX value=new ListPreferenceZTEX(context);value.setKey(key);value.setTitle("fixture");value.setDialogTitle("fixture");value.setEntries(new CharSequence[]{"平铺","荣耀双排","iOS双排"});value.setEntryValues(new CharSequence[]{"0","1","2"});value.setPersistent(false);value.setValue("0");return value;
 }
 static void graphicalNativeShell()throws Exception {
  ListPreferenceZTEX p=entry();
  androidx.appcompat.app.AlertController.AlertParams original=nativeNotification.dialog.builder().params();
  check(original.mView==null&&Arrays.equals(original.mItems,nativeNotification.getEntries())&&original.mOnClickListener!=null,
    "notification-icons dialog retains original text items and original native click listener");
  check(nativeNotification.dialog.builder().views==0&&nativeNotification.dialog.builder().singleChoiceCalls==1
    &&"通知图标".contentEquals(original.mTitle)&&"取消".contentEquals(original.mNegativeButtonText),
    "notification-icons builder title, cancel and normal single-choice preparation are unchanged");

  p.performClick();androidx.preference.ListPreferenceDialogFragmentCompat actual=p.dialog;
  androidx.appcompat.app.AlertController.AlertParams custom=actual.builder().params();
  check(custom.mView instanceof SettingsSignalStyleChoices&&custom.mItems==null&&custom.mAdapter==null&&custom.mCursor==null,
    "only signal dialog replaces the native list with opaque graphic content");
  SettingsSignalStyleChoices graphic=(SettingsSignalStyleChoices)custom.mView;
  check(graphic.getContext()==actual.builder().getContext()&&graphic.selected==actual.selected()&&graphic.selected==0,
    "graphic content receives native themed Context and native selected index");
  check("双卡信号样式".contentEquals(custom.mTitle)&&"取消".contentEquals(custom.mNegativeButtonText)
    &&custom.mPositiveButtonText==null&&actual.builder().singleChoiceCalls==2,
    "graphic content keeps original title and cancel shell; clears list after native prepare");
  int selects=resolver.selects;
  SettingsSignalStyleChoices.activate(custom.mView,0);
  check(actual.nativeChoiceCallbacks==1&&actual.positiveClosures==1&&actual.selected()==0
    &&actual.getDialog().dismissed&&actual.getDialog().dismisses==1&&!p.open,
    "graphic option reuses the original native callback, selected index, positive close and dismiss once");
  final int wantedSelects=selects+1;
  until(()->p.isEnabled()&&resolver.selects==wantedSelects,"graphic callback confirms shared save");
  check("0".equals(p.getValue())&&Preference.nativeWrites==0,"graphic callback retains canonical async save contract without native persistence");

  androidx.preference.ListPreferenceDialogFragmentCompat restored=new androidx.preference.ListPreferenceDialogFragmentCompat();
  restored.initialize(p,page,1);
  check(restored.builder().params().mView instanceof SettingsSignalStyleChoices
    &&((SettingsSignalStyleChoices)restored.builder().params().mView).selected==0&&restored.selected()==0&&"0".equals(p.getValue()),
    "recreated graphic content corrects stale native index to confirmed preference value");
  selects=resolver.selects;restored.getDialog().dismiss();idle();
  check(restored.nativeChoiceCallbacks==0&&restored.positiveClosures==0&&resolver.selects==selects,
    "recreated popup cancellation does not invoke selection or provider save");

  int constructions=SettingsSignalStyleChoices.constructions;
  androidx.preference.ListPreferenceDialogFragmentCompat otherKey=new androidx.preference.ListPreferenceDialogFragmentCompat();
  otherKey.initialize(fixture("other_key"),page,null);
  check(otherKey.builder().params().mView==null&&SettingsSignalStyleChoices.constructions==constructions,
    "a non-target key on the status-bar page never replaces native content");otherKey.getDialog().dismiss();
  com.android.settings.dashboard.DashboardFragment unrelated=new com.android.settings.dashboard.DashboardFragment(context);
  ListPreferenceZTEX foreign=fixture(SettingsSignalEntryHook.ENTRY);unrelated.getPreferenceScreen().addPreference(foreign);foreign.performClick();
  check(foreign.dialog.builder().params().mView==null&&SettingsSignalStyleChoices.constructions==constructions,
    "matching key on an unrelated Settings page never replaces native content");foreign.cancel();
  StatusBarIconsSettingsFragment unregistered=new StatusBarIconsSettingsFragment(context);
  ListPreferenceZTEX unowned=fixture(SettingsSignalEntryHook.ENTRY);unregistered.getPreferenceScreen().addPreference(unowned);unowned.performClick();
  check(unowned.dialog.builder().params().mView==null&&SettingsSignalStyleChoices.constructions==constructions,
    "same target page and key without a registered live entry never replace native content");unowned.cancel();
  androidx.preference.ListPreferenceDialogFragmentCompat impostor=new androidx.preference.ListPreferenceDialogFragmentCompat();
  impostor.initialize(fixture(SettingsSignalEntryHook.ENTRY),page,null);
  check(impostor.builder().params().mView==null&&SettingsSignalStyleChoices.constructions==constructions,
    "native popup preference identity must match the registered live signal entry");impostor.getDialog().dismiss();
 }
 static void deferredSuccessAndSync()throws Exception {
  ListPreferenceZTEX p=entry();resolver.selectGate=new CountDownLatch(1);resolver.selectEntered=new CountDownLatch(1);int writes=Preference.valueWrites;
  choose(p,1);await(resolver.selectEntered,"real save entered worker");Handler.drain();
  check("0".equals(p.getValue())&&Preference.valueWrites==writes&&!p.isEnabled(),"native change is vetoed and disabled until provider confirms save");
  resolver.selectGate.countDown();until(()->p.isEnabled()&&"1".equals(p.getValue()),"successful merged canonical publication");
  check(resolver.dual&&resolver.master&&"0".equals(resolver.style)&&"荣耀双排".contentEquals(p.getSummary()),"confirmed module state publishes exact Honor selection and summary");
  check(Preference.nativeWrites==0&&resolver.wrongThread==0,"no native Settings persistence and provider transport stays off main");
  choose(p,0);until(()->p.isEnabled()&&"0".equals(p.getValue())&&!resolver.dual,"flat selection");
  resolver.external(true,false,true,resolver.revision+1);idle();check("1".equals(p.getValue())&&"荣耀双排".contentEquals(p.getSummary()),"Duo snapshot updates original native entry while page stays open");
  resolver.external(false,false,true,resolver.revision+1);idle();check("0".equals(p.getValue()),"Duo disable updates native single selection");
 }
 static void savedStyleSync()throws Exception {
  ListPreferenceZTEX p=entry();resolver.style="1";FeatureSettings.style="1";
  resolver.external(true,false,true,resolver.revision+1);idle();
  check("2".equals(p.getValue())&&"iOS双排".contentEquals(p.getSummary()),"native row value and summary follow Duo's saved iOS style");
  p.performClick();SettingsSignalStyleChoices ios=(SettingsSignalStyleChoices)p.dialog.builder().params().mView;
  check(ios.style==1&&ios.selected==2&&p.dialog.selected()==2,"native graphic popup selects the exact saved iOS option");p.cancel();
  androidx.preference.ListPreferenceDialogFragmentCompat stale=new androidx.preference.ListPreferenceDialogFragmentCompat();stale.initializeLegacy(p,page);
  check(stale.selected()==2&&((SettingsSignalStyleChoices)stale.builder().params().mView).selected==2,"stale flat native restore cannot override canonical iOS choice");stale.getDialog().dismiss();
  androidx.preference.ListPreferenceDialogFragmentCompat legacy=new androidx.preference.ListPreferenceDialogFragmentCompat();legacy.initializeLegacy(p,page);
  int selects=resolver.selects;SettingsSignalStyleChoices.activate(legacy.builder().params().mView,2);
  until(()->p.isEnabled()&&resolver.selects==selects+1,"legacy restored two-entry dialog supports confirmed iOS callback");
  check("2".equals(p.getValue())&&"1".equals(resolver.style)&&legacy.positiveClosures==1,"legacy restore repairs callback value array before iOS selection");
  choose(p,0);until(()->p.isEnabled()&&!resolver.dual,"saved-style flat choice");
  check("1".equals(resolver.style)&&"平铺".contentEquals(p.getSummary()),"flat choice preserves saved iOS style without advertising an active merge");
  p.performClick();check(((SettingsSignalStyleChoices)p.dialog.builder().params().mView).selected==0,"retained inactive iOS style does not select an active merge");p.cancel();
  choose(p,2);until(()->p.isEnabled()&&resolver.dual&&"1".equals(resolver.style)&&"2".equals(p.getValue()),"explicit iOS selection saves gate and style together");
  check("iOS双排".contentEquals(p.getSummary()),"explicit iOS selection has exact iOS summary");
  choose(p,1);until(()->p.isEnabled()&&resolver.dual&&"0".equals(resolver.style)&&"1".equals(p.getValue()),"explicit Honor selection replaces active iOS style");
  check("荣耀双排".contentEquals(p.getSummary()),"explicit Honor selection has exact Honor summary");
  resolver.style="0";FeatureSettings.style="0";resolver.external(false,false,true,resolver.revision+1);idle();
 }
 static void lateReplyAndOpenPopupSync()throws Exception {
  ListPreferenceZTEX p=entry();idle();int selects=resolver.selects;
  resolver.dual=true;resolver.master=true;resolver.style="1";resolver.revision++;
  resolver.readGate=new CountDownLatch(1);resolver.readEntered=new CountDownLatch(1);page.onResume();
  await(resolver.readEntered,"new canonical iOS read held until popup opens");p.performClick();
  SettingsSignalStyleChoices graphic=(SettingsSignalStyleChoices)p.dialog.builder().params().mView;
  check(graphic.selected==0&&p.dialog.selected()==0,"popup initially retains the last confirmed flat state");
  resolver.readGate.countDown();until(()->"2".equals(p.getValue()),"late canonical reply updates row");
  check(graphic.selected==2&&p.dialog.selected()==2&&"iOS双排".contentEquals(p.getSummary()),"late read updates open popup radio and native callback index with iOS summary");
  resolver.style="0";FeatureSettings.style="0";resolver.external(true,false,true,resolver.revision+1);idle();
  check(graphic.selected==1&&p.dialog.selected()==1&&"荣耀双排".contentEquals(p.getSummary()),"Duo publication refreshes active popup to Honor");
  resolver.external(false,false,true,resolver.revision+1);idle();
  check(graphic.selected==0&&p.dialog.selected()==0&&"平铺".contentEquals(p.getSummary()),"Duo disable refreshes active popup to flat");
  long revision=resolver.revision;p.cancel();idle();
  check(resolver.selects==selects&&resolver.revision==revision,"canonical popup refresh and cancellation send no selection writes");
 }
 static void conflictAndFailures()throws Exception {
  ListPreferenceZTEX p=entry();resolver.external(false,true,true,resolver.revision+1);idle();long revision=resolver.revision;int count=Toast.shown.size();final int conflictCount=count;
  choose(p,2);until(()->p.isEnabled()&&Toast.shown.size()>conflictCount,"three-in-one rejection for iOS");
  check("0".equals(p.getValue())&&!resolver.dual&&resolver.three&&resolver.revision==revision,"three-in-one rejection keeps old state and revision");
  check(SignalStylePolicy.CONFLICT_MESSAGE.equals(Toast.shown.get(Toast.shown.size()-1)),"conflict shows exact requested message");
  count=Toast.shown.size();final int honorConflictCount=count;choose(p,1);until(()->p.isEnabled()&&Toast.shown.size()>honorConflictCount,"three-in-one rejection for Honor");
  check("0".equals(p.getValue())&&!resolver.dual&&resolver.revision==revision,"both dual styles share conflict protection");
  resolver.external(false,false,true,resolver.revision+1);idle();revision=resolver.revision;resolver.failNext=true;count=Toast.shown.size();final int failedCount=count;
  choose(p,1);until(()->p.isEnabled()&&Toast.shown.size()>failedCount,"provider rejection feedback");
  check("0".equals(p.getValue())&&!resolver.dual&&resolver.revision==revision,"failed commit cannot publish optimistic native value");
  resolver.throwNext=true;count=Toast.shown.size();final int exceptionCount=count;choose(p,1);until(()->p.isEnabled()&&Toast.shown.size()>exceptionCount,"provider exception feedback");
  check("0".equals(p.getValue())&&!resolver.dual&&resolver.revision==revision,"provider exception preserves canonical entry selection");
 }
 static void staleResponse()throws Exception {
  ListPreferenceZTEX p=entry();resolver.readGate=new CountDownLatch(1);resolver.readEntered=new CountDownLatch(1);
  choose(p,1);await(resolver.readEntered,"canonical old read captured after selection");
  long newer=resolver.revision+10;resolver.external(false,false,true,newer);Handler.drain();
  resolver.readGate.countDown();until(()->p.isEnabled(),"old read callback released");idle();
  check("0".equals(p.getValue())&&"平铺".contentEquals(p.getSummary())&&!resolver.dual&&resolver.revision==newer,"late old canonical result cannot overwrite newer Duo revision");
 }
 static void oldEntryMigration()throws Exception {
  ListPreferenceZTEX old=entry();resolver.readGate=new CountDownLatch(1);resolver.readEntered=new CountDownLatch(1);
  choose(old,1);await(resolver.readEntered,"old live preference read captured before removal");
  check(page.getPreferenceScreen().removePreference(old),"remove prior live entry for migration fixture");
  resolver.external(false,false,true,resolver.revision+10);
  PreferenceZTEX legacy=new PreferenceZTEX(context);legacy.setKey(SettingsSignalEntryHook.ENTRY);legacy.setTitle("信号栏");legacy.setOrder(old.getOrder());page.getPreferenceScreen().addPreference(legacy);page.onResume();
  until(()->{Preference p=page.getPreferenceScreen().findPreference(SettingsSignalEntryHook.ENTRY);return p instanceof ListPreferenceZTEX&&p!=old&&p.isEnabled();},"legacy navigation entry replaced by native popup");
  ListPreferenceZTEX replacement=entry();check(replacement!=old&&legacy.getParent()==null&&replacement.getIntent()==null&&Intent.constructions==0,"legacy entry migrates without navigation route");
  resolver.readGate.countDown();idle();check("0".equals(old.getValue())&&"0".equals(replacement.getValue()),"late result for detached entry updates neither detached value nor replacement");
  choose(replacement,1);until(()->replacement.isEnabled()&&"1".equals(replacement.getValue()),"replacement remains functional");
 }
 static void unsupportedProfile()throws Exception {
  int installed=host.Hooks.hooks.size();AugmentModule missing=new AugmentModule();
  ClassLoader loader=new ClassLoader(TestSettingsSignalPopup.class.getClassLoader()){@Override protected Class<?>loadClass(String name,boolean resolve)throws ClassNotFoundException{if(name.equals("com.zte.mifavor.androidx.preference.ListPreferenceZTEX"))throw new ClassNotFoundException("controlled unsupported ROM");return super.loadClass(name,resolve);}};
  SettingsSignalEntryHook.install(missing,loader);check(host.Hooks.hooks.size()==installed&&!missing.failures.isEmpty(),"unsupported native profile adds no partial callbacks");
 }
 public static void main(String[] args)throws Exception {
  setup();creationAndNativeDialog();graphicalNativeShell();deferredSuccessAndSync();lateReplyAndOpenPopupSync();savedStyleSync();conflictAndFailures();staleResponse();oldEntryMigration();unsupportedProfile();
  check(module.failures.isEmpty(),"real source integration logged no attachment failures");check(Preference.nativeWrites==0&&Intent.constructions==0&&resolver.wrongThread==0,"all popup cases preserve zero native storage, navigation and main-thread IPC");
  System.out.println("Actual SettingsSignalEntryHook: "+assertions+" assertions passed; native shell, directed graphic-content boundary, native choice callback, recreation, cancellation, confirmed save, conflict, failure, stale publication, sync and migration. Android/OEM/transport/custom View are host boundaries, not ART runtime or pixel verification.");
  System.exit(0);
 }
}
'''


if __name__ == '__main__':
    raise SystemExit(main())
