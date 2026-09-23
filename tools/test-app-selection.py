"""Run the real app picker against bounded PackageManager and UI test doubles.

No APK build, device access, configuration writes, or copied picker implementation.
"""
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
SOURCES = {
    'android/content/Context.java': 'package android.content; public class Context {}',
    'android/content/Intent.java': '''package android.content;
public class Intent {
 public static final String ACTION_MAIN="android.intent.action.MAIN";
 public static final String CATEGORY_INFO="android.intent.category.INFO";
 public static final String CATEGORY_LAUNCHER="android.intent.category.LAUNCHER";
 public final String action; public String category;
 public Intent(String a){action=a;} public Intent addCategory(String c){category=c;return this;}
}''',
    'android/content/DialogInterface.java': '''package android.content;
public interface DialogInterface {
 interface OnClickListener {void onClick(DialogInterface dialog,int which);}
 interface OnShowListener {void onShow(DialogInterface dialog);}
}''',
    'android/content/pm/ApplicationInfo.java': '''package android.content.pm;
public class ApplicationInfo {
 public static final int FLAG_INSTALLED=0x800000, FLAG_SYSTEM=1;
 public String packageName,label; public boolean enabled=true; public int flags=FLAG_INSTALLED;
}''',
    'android/content/pm/ActivityInfo.java': '''package android.content.pm;
public class ActivityInfo {public ApplicationInfo applicationInfo; public String name;}''',
    'android/content/pm/ResolveInfo.java': '''package android.content.pm;
public class ResolveInfo {public ActivityInfo activityInfo;}''',
    'android/content/pm/PackageManager.java': '''package android.content.pm;
import android.content.Intent; import java.util.*;
public abstract class PackageManager {
 public static class NameNotFoundException extends Exception {public NameNotFoundException(String s){super(s);}}
 public abstract List<ResolveInfo> queryIntentActivities(Intent intent,int flags);
 public abstract ApplicationInfo getApplicationInfo(String pkg,int flags) throws NameNotFoundException;
 public CharSequence getApplicationLabel(ApplicationInfo info){return info.label;}
 public List<ApplicationInfo> getInstalledApplications(int flags){throw new AssertionError("restricted enumeration used");}
 public Intent getLaunchIntentForPackage(String pkg){throw new AssertionError("per-package resolver enumeration used");}
}''',
    'android/view/View.java': '''package android.view;
public class View {
 public interface OnClickListener {void onClick(View view);}
 private OnClickListener click;
 public void setOnClickListener(OnClickListener c){click=c;}
 public void click(){if(click!=null)click.onClick(this);}
}''',
    'android/widget/Button.java': 'package android.widget; public class Button extends android.view.View {}',
    'android/widget/LinearLayout.java': '''package android.widget;
import android.content.Context; import android.view.View;
public class LinearLayout extends View {
 public static final int VERTICAL=1; public LinearLayout(Context c){}
 public void setOrientation(int o){} public void setPadding(int a,int b,int c,int d){}
 public void addView(View v,LayoutParams p){}
 public static class LayoutParams {public LayoutParams(int w,int h){}}
}''',
    'android/text/Editable.java': 'package android.text; public interface Editable extends CharSequence {}',
    'android/text/TextWatcher.java': '''package android.text;
public interface TextWatcher {
 void beforeTextChanged(CharSequence s,int start,int count,int after);
 void onTextChanged(CharSequence s,int start,int before,int count);
 void afterTextChanged(Editable value);
}''',
    'android/widget/EditText.java': '''package android.widget;
import android.content.Context; import android.text.*; import java.util.*;
public class EditText extends android.view.View {
 public static EditText last; private String value="";
 private final List<TextWatcher> watchers=new ArrayList<>();
 public EditText(Context c){last=this;} public void setSingleLine(boolean b){} public void setHint(String h){}
 public Editable getText(){final String current=value;return new Editable(){
  public int length(){return current.length();} public char charAt(int i){return current.charAt(i);}
  public CharSequence subSequence(int a,int b){return current.subSequence(a,b);}
  public String toString(){return current;}};}
 public void addTextChangedListener(TextWatcher w){watchers.add(w);}
 public void setText(String s){String old=value;for(TextWatcher w:watchers)w.beforeTextChanged(old,0,old.length(),s.length());
  value=s;for(TextWatcher w:watchers){w.onTextChanged(value,0,old.length(),value.length());w.afterTextChanged(getText());}}
}''',
    'android/widget/ArrayAdapter.java': '''package android.widget;
import android.content.Context; import java.util.*;
public class ArrayAdapter<T> {public final List<T> values;
 public ArrayAdapter(Context c,int resource,List<T> items){values=new ArrayList<>(items);}}
''',
    'android/widget/AdapterView.java': '''package android.widget;
public class AdapterView<T> extends android.view.View {
 public interface OnItemClickListener {void onItemClick(AdapterView<?> p,android.view.View v,int position,long id);}
}''',
    'android/widget/ListView.java': '''package android.widget;
import android.content.Context; import java.util.*;
public class ListView extends AdapterView<Object> {
 public static final int CHOICE_MODE_MULTIPLE=2; public static ListView last;
 public ArrayAdapter<String> adapter; public int publications;
 private final Set<Integer> checked=new HashSet<>(); private OnItemClickListener listener;
 public ListView(Context c){last=this;} public void setChoiceMode(int m){}
 public void setAdapter(ArrayAdapter<String> a){adapter=a;publications++;}
 public void clearChoices(){checked.clear();} public void setItemChecked(int i,boolean b){if(b)checked.add(i);else checked.remove(i);}
 public boolean isItemChecked(int i){return checked.contains(i);}
 public void setOnItemClickListener(OnItemClickListener l){listener=l;}
 public void clickItem(int i){setItemChecked(i,!isItemChecked(i));listener.onItemClick(this,this,i,i);}
}''',
    'android/widget/Toast.java': '''package android.widget;
import android.content.Context;
public class Toast {public static final int LENGTH_SHORT=0;public static int shown;
 public static Toast makeText(Context c,String s,int t){return new Toast();}public void show(){shown++;}}
''',
    'android/app/Activity.java': '''package android.app;
import android.content.Context; import android.content.pm.PackageManager; import java.util.concurrent.*;
public class Activity extends Context {
 public boolean finishing;public PackageManager pm;
 private final ConcurrentLinkedQueue<Runnable> queue=new ConcurrentLinkedQueue<>();
 private final CountDownLatch posted=new CountDownLatch(1);
 public PackageManager getPackageManager(){return pm;}
 public void runOnUiThread(Runnable r){queue.add(r);posted.countDown();}
 public boolean isFinishing(){return finishing;}
 public void drain() throws Exception {if(!posted.await(5,TimeUnit.SECONDS))throw new AssertionError("worker did not post");
  for(Runnable r;(r=queue.poll())!=null;)r.run();}
}''',
    'android/app/AlertDialog.java': '''package android.app;
import android.content.*;import android.widget.*;import java.util.*;
public class AlertDialog implements DialogInterface {
 public static final int BUTTON_NEUTRAL=-3,BUTTON_NEGATIVE=-2,BUTTON_POSITIVE=-1;
 public static AlertDialog last;private boolean showing;private OnShowListener onShow;
 private final Map<Integer,Button> buttons=new HashMap<>();
 public boolean isShowing(){return showing;}public void dismiss(){showing=false;}
 public void setOnShowListener(OnShowListener l){onShow=l;}public Button getButton(int id){return buttons.get(id);}
 public void show(){showing=true;if(onShow!=null)onShow.onShow(this);}
 public static class Builder {
  private final AlertDialog dialog=new AlertDialog();public Builder(Context c){}
  public Builder setTitle(String s){return this;}public Builder setView(android.view.View v){return this;}
  private Builder button(int id,OnClickListener listener){Button b=new Button();dialog.buttons.put(id,b);
   b.setOnClickListener(v->{if(listener!=null)listener.onClick(dialog,id);dialog.dismiss();});return this;}
  public Builder setNegativeButton(String s,OnClickListener l){return button(BUTTON_NEGATIVE,l);}
  public Builder setNeutralButton(String s,OnClickListener l){return button(BUTTON_NEUTRAL,l);}
  public Builder setPositiveButton(String s,OnClickListener l){return button(BUTTON_POSITIVE,l);}
  public AlertDialog create(){last=dialog;return dialog;}
 }
}''',
    'android/R.java': '''package android; public class R {public static class layout {
 public static final int simple_list_item_multiple_choice=1;}}''',
    'ls/augment/com/UiKit.java': 'package ls.augment.com; public class UiKit {public int dp(int value){return value;}}',
    'ls/augment/com/AppSelectionTest.java': r'''package ls.augment.com;
import android.app.*;import android.content.*;import android.content.pm.*;import android.widget.*;
import java.util.*;import java.util.concurrent.*;
public class AppSelectionTest {
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 static ApplicationInfo app(String pkg,String label){ApplicationInfo i=new ApplicationInfo();i.packageName=pkg;i.label=label;return i;}
 static ResolveInfo resolve(ApplicationInfo app,String activity){ResolveInfo r=new ResolveInfo();r.activityInfo=new ActivityInfo();
  r.activityInfo.applicationInfo=app;r.activityInfo.name=activity;return r;}
 static class FakePm extends PackageManager {
  final Thread owner=Thread.currentThread();final Map<String,List<ResolveInfo>> resolvers=new HashMap<>();
  final Map<String,ApplicationInfo> known=new HashMap<>();final List<String> queried=new ArrayList<>(),lookedUp=new ArrayList<>();
  CountDownLatch gate;boolean fail;
  public List<ResolveInfo> queryIntentActivities(Intent intent,int flags){
   check(Thread.currentThread()!=owner,"package query moved onto UI thread");
   check(Intent.ACTION_MAIN.equals(intent.action)&&flags==0,"query scope changed");
   if(gate!=null)try{check(gate.await(5,TimeUnit.SECONDS),"test gate timed out");}catch(InterruptedException e){throw new AssertionError(e);}
   if(fail)throw new SecurityException("fixture query refusal");
   queried.add(intent.category);return resolvers.getOrDefault(intent.category,Collections.emptyList());}
  public ApplicationInfo getApplicationInfo(String pkg,int flags)throws NameNotFoundException {
   check(Thread.currentThread()!=owner&&flags==0,"selected lookup changed thread/flags");lookedUp.add(pkg);
   ApplicationInfo found=known.get(pkg);if(found==null)throw new NameNotFoundException(pkg);return found;}
 }
 static FakePm fixture(){FakePm pm=new FakePm();
  ApplicationInfo a=app("app.alpha","Alpha"),b=app("app.beta","Beta"),i=app("app.info","Info"),h=app("app.headless","Headless");
  b.flags|=ApplicationInfo.FLAG_SYSTEM;
  ApplicationInfo disabled=app("app.disabled","Disabled");disabled.enabled=false;
  ApplicationInfo uninstalled=app("app.uninstalled","Uninstalled");uninstalled.flags=0;
  pm.resolvers.put(Intent.CATEGORY_INFO,Arrays.asList(resolve(a,"A1"),resolve(i,"Info1"),resolve(a,"A2")));
  pm.resolvers.put(Intent.CATEGORY_LAUNCHER,Arrays.asList(resolve(a,"A3"),resolve(b,"B1"),resolve(disabled,"D"),
    resolve(uninstalled,"U"),null,new ResolveInfo(),resolve(null,"missing-application")));
  for(ApplicationInfo value:Arrays.asList(a,b,i,h,disabled,uninstalled))pm.known.put(value.packageName,value);
  return pm;}
 static Activity show(FakePm pm,String initial,List<String> saved){Activity a=new Activity();a.pm=pm;
  AppSelectionDialog.show(a,new UiKit(),"Picker",initial,saved::add);return a;}
 static List<String> rows(){if(ListView.last.adapter==null)return Collections.emptyList();return ListView.last.adapter.values;}
 static List<String> packages(){List<String> result=new ArrayList<>();for(String row:rows())result.add(row.substring(row.indexOf('\n')+1));return result;}
 static boolean checked(String pkg){int i=packages().indexOf(pkg);return i>=0&&ListView.last.isItemChecked(i);}
 public static void main(String[] args)throws Exception {
  String initial="app.alpha;app.disabled;app.headless;app.missing;app.uninstalled";
  List<String> saved=new ArrayList<>();FakePm pm=fixture();Activity a=show(pm,initial,saved);a.drain();
  check(packages().equals(Arrays.asList("app.alpha","app.beta","app.headless","app.info")),
    "duplicates, INFO-only, selected headless, system app, disabled/uninstalled filtering or label ordering failed: "+packages());
  check(pm.queried.equals(Arrays.asList(Intent.CATEGORY_INFO,Intent.CATEGORY_LAUNCHER)),"resolver categories wrong");
  check(pm.lookedUp.equals(Arrays.asList("app.headless","app.missing")),"selected lookup repeated discovered packages or skipped missing/headless");
  check(checked("app.alpha")&&checked("app.headless")&&!checked("app.beta"),"initial checked state lost");
  check(saved.isEmpty(),"load wrote configuration");
  EditText.last.setText("  BETA  ");check(packages().equals(List.of("app.beta")),"case-insensitive trimmed label search failed");
  ListView.last.clickItem(0);EditText.last.setText("APP.INFO");check(packages().equals(List.of("app.info")),"package search failed");
  EditText.last.setText("");check(checked("app.alpha")&&checked("app.headless")&&checked("app.beta"),"search dropped offscreen selections");
  AlertDialog.last.getButton(AlertDialog.BUTTON_POSITIVE).click();
  check(saved.equals(List.of("app.alpha;app.beta;app.disabled;app.headless;app.missing;app.uninstalled")),
    "confirm did not preserve hidden/missing initial configuration and changed selection: "+saved);

  saved.clear();a=show(fixture(),"app.alpha;app.headless",saved);a.drain();
  EditText.last.setText("beta");ListView.last.clickItem(0);AlertDialog.last.getButton(AlertDialog.BUTTON_NEGATIVE).click();
  check(saved.isEmpty()&&!AlertDialog.last.isShowing(),"cancel persisted edits");

  a=show(fixture(),"app.alpha;app.headless",saved);a.drain();EditText.last.setText("beta");
  AlertDialog.last.getButton(AlertDialog.BUTTON_NEUTRAL).click();
  check(saved.isEmpty()&&AlertDialog.last.isShowing(),"clear saved prematurely or dismissed");
  EditText.last.setText("");for(int n=0;n<rows().size();n++)check(!ListView.last.isItemChecked(n),"clear left hidden selected item");
  AlertDialog.last.getButton(AlertDialog.BUTTON_POSITIVE).click();check(saved.equals(List.of("")),"clear was not committed by confirm");

  saved.clear();pm=fixture();a=show(pm,"",saved);a.drain();
  check(!packages().contains("app.headless"),"unselected headless package was introduced");

  saved.clear();pm=fixture();pm.gate=new CountDownLatch(1);a=show(pm,"app.alpha",saved);
  ListView pending=ListView.last;AlertDialog.last.getButton(AlertDialog.BUTTON_NEGATIVE).click();pm.gate.countDown();a.drain();
  check(pending.publications==0&&saved.isEmpty(),"dismissed dialog received late publication/save");

  pm=fixture();pm.gate=new CountDownLatch(1);a=show(pm,"app.alpha",saved);pending=ListView.last;
  a.finishing=true;pm.gate.countDown();a.drain();check(pending.publications==0,"finishing Activity received late publication");

  pm=fixture();pm.gate=new CountDownLatch(1);a=show(pm,"app.headless",saved);
  AlertDialog.last.getButton(AlertDialog.BUTTON_NEUTRAL).click();pm.gate.countDown();a.drain();
  check(packages().contains("app.headless")&&!checked("app.headless"),"late load restored cleared selection");
  AlertDialog.last.getButton(AlertDialog.BUTTON_POSITIVE).click();check(saved.equals(List.of("")),"clear during load lost on confirm");

  saved.clear();pm=fixture();pm.fail=true;int toasts=Toast.shown;a=show(pm,"app.alpha",saved);a.drain();
  check(Toast.shown==toasts+1&&ListView.last.publications==0&&saved.isEmpty(),"query error published a partial list or saved");
  System.out.println("AppSelection: real source passed resolver-only enumeration, duplicate aliases, INFO-only, selected headless/missing, enabled/installed/system scope, label/package search, hidden selections, cancel, clear, late worker lifecycle and query failure checks");
 }
}''',
}

with tempfile.TemporaryDirectory(prefix='ls-app-selection-') as directory:
    base = Path(directory)
    for name, source in SOURCES.items():
        path = base / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
    production = ROOT / 'android/app/src/main/java/ls/augment/com'
    subprocess.run([str(JAVA / 'javac.exe'), '-encoding', 'UTF-8', '--release', '17',
                    '-d', str(base), str(production / 'AppSelectionDialog.java'),
                    str(production / 'AppPackageSet.java'), *map(str, base.rglob('*.java'))], check=True)
    subprocess.run([str(JAVA / 'java.exe'), '-cp', str(base),
                    'ls.augment.com.AppSelectionTest'], check=True, timeout=30)
