"""Execute production selection UI and import/export methods with offline Java boundaries.

The codec and manager Target/UserRecord models are real production code. The
Activity methods register real checkbox/import callbacks and run on deterministic
worker/main queues. Android widgets, storage, media and Root transport are doubles;
they implement no serial-binding policy. No device, su or provider is accessed.
This verifies event/persistence decisions, not Android layout or ROM integration.
"""
from pathlib import Path
import argparse
import importlib.util
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
# Reuse only the lexical Java-member extractor, never another suite's safety logic.
spec = importlib.util.spec_from_file_location("scope_extractor", ROOT / "tools/test-hide-automation-scope.py")
extractor = importlib.util.module_from_spec(spec)
spec.loader.exec_module(extractor)
member = extractor.member

BOUNDARIES = r'''
package ls.augment.com;
import java.util.*;import java.io.*;import java.nio.file.*;import java.nio.charset.StandardCharsets;
import java.text.DateFormat;

class Queue {
 final ArrayDeque<Runnable> tasks=new ArrayDeque<>();void execute(Runnable r){tasks.add(r);}
 void next(){tasks.remove().run();}boolean runAll(){boolean any=!tasks.isEmpty();while(!tasks.isEmpty())next();return any;}
}
class Handler {
 long now;final LinkedHashMap<Runnable,Long> tasks=new LinkedHashMap<>();
 void post(Runnable r){tasks.put(r,now);}void postDelayed(Runnable r,long delay){tasks.put(r,now+delay);}
 void removeCallbacks(Runnable r){tasks.remove(r);}
 boolean runDue(){boolean ran=false;for(var e:new ArrayList<>(tasks.entrySet()))if(e.getValue()<=now){tasks.remove(e.getKey());e.getKey().run();ran=true;}return ran;}
}
class View {
 static final int VISIBLE=0,GONE=8;interface Click{void run(View v);}Click click;boolean enabled=true;
 final List<View> children=new ArrayList<>();
 void setOnClickListener(Click c){click=c;}void performClick(){if(enabled&&click!=null)click.run(this);}
 void setEnabled(boolean v){enabled=v;}void setVisibility(int x){}void setBackground(Object x){}
 void setPadding(int a,int b,int c,int d){}
}
class TextView extends View {
 String text="";void setText(String t){text=t;}void setTextSize(int n){}void setTextColor(int c){}
 void setGravity(int n){}void setMinWidth(int n){}
}
class Button extends TextView {}
class EditText extends TextView {String getText(){return text;}}
class CheckBox extends Button {
 interface Changed{void run(CheckBox box,boolean value);}Changed changed;boolean checked;
 CheckBox(Object ignored){}boolean isChecked(){return checked;}
 void setChecked(boolean v){if(v!=checked){checked=v;if(changed!=null)changed.run(this,v);}}
 void setOnCheckedChangeListener(Changed c){changed=c;}
 @Override void performClick(){if(enabled){setChecked(!checked);super.performClick();}}
}
class Switch extends CheckBox {Switch(){super(null);}}
class LinearLayout extends View {
 static final int VERTICAL=1;LinearLayout(Object context){}void setOrientation(int n){}void setGravity(int n){}
 void addView(View child,Object... layout){children.add(child);}void removeAllViews(){children.clear();}
 static class LayoutParams {LayoutParams(int a,int b){}LayoutParams(int a,int b,int c){}void setMargins(int a,int b,int c,int d){}}
}
class Drawable {}
class ImageView extends View {ImageView(Object context){}void setImageDrawable(Drawable d){}}
class Color {static int argb(int a,int b,int c,int d){return 0;}}
class Gravity {static final int CENTER=1,CENTER_VERTICAL=2;}
class R {static class drawable {static int ic_tile;}}
class PackageManager {
 static class NameNotFoundException extends Exception{}
 Object getApplicationInfo(String p,int f)throws NameNotFoundException{return new Object();}
 Drawable getApplicationIcon(Object info){return new Drawable();}
}
class UiKit {
 int danger=1,muted=2,accent=3,text=4,accentContainer=5,outline=6;
 static class Fold{void sync(){}}int dp(int x){return x;}Object wrap(){return null;}
 Object margins(int a,int b,int c,int d){return null;}Object roundStroke(Object... x){return null;}
 Object pressable(Object x){return x;}void styleCheckBox(CheckBox b){}
 LinearLayout card(){return new LinearLayout(this);}Button button(String text){Button b=new Button();b.text=text;return b;}
 TextView text(String t,int size,int color,boolean bold){TextView v=new TextView();v.text=t;return v;}
 void setButtonEnabled(Button b,boolean enabled){b.setEnabled(enabled);}
}
class Toast {static final int LENGTH_LONG=1;static Toast makeText(Object c,String t,int l){return new Toast();}void show(){}}
class Intent {RootHideManager.Target focus;Boolean configured;}
class HideRecoveryActivity {
 static Intent intent(Object c,boolean configured){Intent i=new Intent();i.configured=configured;return i;}
 static Intent intent(Object c,RootHideManager.Target t){Intent i=new Intent();i.focus=t;return i;}
}
class ScreenAutomation {static void sync(Object c){}}
class AuditLog {static void write(Object c,String action,String detail){}}
class UserResolution {
 final boolean resolved;final int userId;final String message;
 UserResolution(boolean r,int id,String m){resolved=r;userId=id;message=m;}
 static UserResolution failure(String m){return new UserResolution(false,-1,m);}
}
class AppConfig {
 static final String HIDE_TARGETS="targets",HIDE_MASTER="master",AUTOMATION_ENABLED="auto",AUTOMATION_SCOPE="scope",TILE_LABEL="label",TILE_DESCRIPTION="description";
 final Map<String,String> values=new LinkedHashMap<>();int saves;boolean fail;
 AppConfig(){values.put(HIDE_TARGETS,"");}String get(String key){return values.getOrDefault(key,"");}
 Map<String,String> snapshot(){return new LinkedHashMap<>(values);}
 SaveResult save(Map<String,String> updates){saves++;if(fail)return new SaveResult(false,"failed");values.putAll(updates);return new SaveResult(true,"saved");}
 static class SaveResult {final boolean success,runtimeSynced;final String message;SaveResult(boolean s,String m){success=s;runtimeSynced=s;message=m;}}
}
class ConfigSchema {
 static final String HIDE_TARGETS=AppConfig.HIDE_TARGETS,HEALTH_PLAN="health",HEALTH_ACCOUNT="account",HEALTH_ENABLED="health_on",HEALTH_MULTIPLY_ENABLED="multiply",HEALTH_PLAN_ENABLED="plan_on",TGK_RAPID_FIRE_COMPAT_TOKEN="token",TGK_RAPID_FIRE_ENABLED="rapid",TILE_ICON="icon",LAUNCHER_OVERRIDES="overrides";
 static int targetNormalizations;static boolean contains(String key){return !key.equals("unknown");}
 static String normalize(String key,String value){if(key.equals(HIDE_TARGETS))targetNormalizations++;return value.replace('\n',' ').replace('\r',' ').trim();}
}
class JSONObject {
 final Map<String,Object> data=new LinkedHashMap<>();JSONObject(){}JSONObject(Map<String,String> source){data.putAll(source);}
 JSONObject put(String k,Object v){data.put(k,v);return this;}Object get(String k){if(!data.containsKey(k))throw new IllegalArgumentException(k);return data.get(k);}
 JSONObject getJSONObject(String k){return (JSONObject)get(k);}JSONObject optJSONObject(String k){return data.get(k) instanceof JSONObject?(JSONObject)data.get(k):null;}
 String getString(String k){return (String)get(k);}String optString(String k){return optString(k,"");}String optString(String k,String d){return data.get(k) instanceof String?(String)data.get(k):d;}
 int optInt(String k){return data.get(k) instanceof Integer?(int)data.get(k):0;}boolean has(String k){return data.containsKey(k);}Iterator<String> keys(){return data.keySet().iterator();}
 String toString(int indent){return data.toString();}
}
class AlertDialog {
 interface Click {void run(Object d,int which);}interface Cancel{void run(Object d);}
 static Builder last;static class Builder {
 Click positive,negative;Cancel cancel;String message="";Builder(Object context){}
 Builder setTitle(String s){return this;}Builder setMessage(String s){message=s;return this;}
 Builder setNegativeButton(String s,Click c){negative=c;return this;}Builder setPositiveButton(String s,Click c){positive=c;return this;}
 Builder setOnCancelListener(Cancel c){cancel=c;return this;}void show(){last=this;}
 void confirm(){positive.run(null,0);}void cancel(){if(cancel!=null)cancel.run(null);}
 }
}
class File {
 static int directoryWrites;File(Object... ignored){}boolean mkdirs(){directoryWrites++;return true;}boolean isFile(){return false;}
 Path toPath(){throw new AssertionError("No media I/O expected");}
}
class LauncherIconStore {static File directory(Object c){return new File();}static File file(Object c,String h){return new File();}}
class ManagedFont {static File file(Object c,String h){return new File();}static void store(Object c,String h,byte[] b){throw new AssertionError("media");}static void validate(String h,byte[] b){} }
class RapidFireCompatibility {static Object currentFingerprint(Object c){return null;}static class Token {static Token parse(String s){return null;}boolean validFor(Object o){return false;}}}
class BuildConfig {static final String VERSION_NAME="fixture";}
'''

UI_PREFIX = r'''
class HideAppsActivity {
 final Queue executor=new Queue();final Handler main=new Handler();final UiKit ui=new UiKit();
 final Set<RootHideManager.Target> selected=new LinkedHashSet<>(),savedTargets=new LinkedHashSet<>();
 final List<AppItem> loaded=new ArrayList<>();final AppConfig config=new AppConfig();final RootHideManager manager=new RootHideManager(config);
 final TextView summary=new TextView(),userStatus=new TextView();final Button save=new Button();
 final LinearLayout retainedList=new LinearLayout(this),spaceTabs=new LinearLayout(this);
 EditText search=new EditText(),tileLabel=new EditText(),tileDescription=new EditText();
 Switch master=new Switch(),automationEnabled=new Switch(),automationAllUsers=new Switch();
 List<RootHideManager.UserRecord> userRecords=new ArrayList<>();UserResolution currentUser=UserResolution.failure("unknown");
 int activeUserId=-1;long activeUserSerial=-1,appLoadGeneration,editGeneration;String selectionProblem="";
 boolean loading,dirty,saving,finished,destroyed,appListExpanded;Intent launched;
 UiKit.Fold hideFold,automationFold;private final Runnable autoSave=()->{if(dirty)saveSettings();};
 boolean isFinishing(){return finished;}boolean isDestroyed(){return destroyed;}void startActivity(Intent i){launched=i;}
 void renderApps(){renderRetainedTargets();}interface Op{RootHideManager.OperationResult run();}void runOperation(Op op){op.run();}
 PackageManager getPackageManager(){return new PackageManager();}Drawable getDrawable(int i){return new Drawable();}
 void boot(String raw){config.values.put(AppConfig.HIDE_TARGETS,raw);loadSelection();}
 void choose(RootHideManager.Target t){loaded.add(new AppItem(new RootHideManager.AppRecord(t),null));box(loaded.size()-1).performClick();}
 CheckBox box(int index){return findBox(appRow(loaded.get(index)));}static CheckBox findBox(View v){if(v instanceof CheckBox)return (CheckBox)v;for(View c:v.children){CheckBox b=findBox(c);if(b!=null)return b;}return null;}
 void bindSpace(int id,long serial){activeUserId=id;activeUserSerial=serial;userRecords=Arrays.asList(new RootHideManager.UserRecord(id,serial,"Work"));}
 void editLabel(String label){tileLabel.text=label;markDirty();}
 View recoveryRow(RootHideManager.Target target){return appRow(new AppItem(new RootHideManager.AppRecord(target),null));}
 void review(Intent intent){openRecovery(intent);}
 void flush(){main.now+=500;for(int n=0;n<30;n++){boolean a=executor.runAll(),b=main.runDue();if(!a&&!b)return;}throw new AssertionError("queue did not settle");}
 void beginLoad(){loadApps(activeUserId);}void beginUsers(){loadUsers();}void refresh(){refreshAppStates();}
 void remove(RootHideManager.Target t){removeRetainedTarget(t);}List<RootHideManager.Target> retained(){return retainedTargets();}
}
'''

IMPORT_PREFIX = r'''
class ConfigTransferActivity {
 static final int MAX_DOCUMENT_BYTES=32*1024*1024;static final Set<String> EXCLUDED=Collections.emptySet();
 final AppConfig config=new AppConfig();final RootHideManager manager=new RootHideManager(config);final Queue worker=new Queue();
 final List<String> notices=new ArrayList<>();boolean closed;
 ConfigTransferActivity(){RootHideManager.importing=manager;AlertDialog.last=null;}
 void prepare(String raw)throws Exception{prepareDocument(raw,raw!=null);}
 void prepareDocument(String raw,boolean include)throws Exception{JSONObject settings=new JSONObject().put("label","imported");if(include)settings.put(AppConfig.HIDE_TARGETS,raw);prepareImport(new JSONObject().put("format","LS_Augment.settings").put("version",1).put("settings",settings));}
 JSONObject exported()throws Exception{return exportDocument();}
 void confirm(){AlertDialog.last.confirm();worker.runAll();}
 void runWhileOpen(Runnable r){if(!closed)r.run();}void finishDirect(){closed=true;}
 void notice(String s){notices.add(s);}void reviewReport(String title,String s){notices.add(s);}
 static Set<String> iconHashes(JSONObject v){return Collections.emptySet();}static Set<String> fontHashes(JSONObject v){return Collections.emptySet();}
 Preferences getSharedPreferences(String s,int n){return new Preferences();}static class Preferences{Preferences edit(){return this;}Preferences clear(){return this;}boolean commit(){return true;}}
}
'''

TEST = r'''
public final class TestUserUiTransfer {
 static int passed,failed;static final String PKG="org.example.app";
 interface Test {void run()throws Exception;}static void test(String name,Test run){try{File.directoryWrites=0;ConfigSchema.targetNormalizations=0;run.run();passed++;System.out.println("PASS "+name);}catch(Throwable e){failed++;System.out.println("FAIL "+name+": "+e);}}
 static void check(boolean ok,String m){if(!ok)throw new AssertionError(m);}
 static RootHideManager.Target bound(int user,long serial){return new RootHideManager.Target(user,serial,PKG);}
 static String texts(View v){String s=v instanceof TextView?((TextView)v).text:"";for(View c:v.children)s+="\n"+texts(c);return s;}
 static Button action(View v,String label){if(v instanceof Button&&((Button)v).text.equals(label))return (Button)v;for(View child:v.children){Button found=action(child,label);if(found!=null)return found;}return null;}
 static HideAppsActivity ui(String raw){HideAppsActivity a=new HideAppsActivity();a.boot(raw);a.bindSpace(10,42);return a;}
 static void noWrites(ConfigTransferActivity a){check(a.config.saves==0&&a.manager.targetWrites==0&&File.directoryWrites==0,"partial import writes");}
 public static void main(String[] args)throws Exception{
  test("legacy and imported pending remain unchanged on initialization",()->{var a=ui("10:"+PKG+";p3:10:41:"+PKG);check(a.selected.size()==2&&a.selected.stream().noneMatch(t->t.isBound()),"legacy rebound");check(!a.dirty&&a.manager.targetWrites==0,"init saved");});
  test("retained list names pending and stale entries without collapsing same package",()->{var a=ui("10:"+PKG+";v3:10:41:"+PKG+";v3:10:42:"+PKG);a.renderApps();check(a.retained().size()==2,"lost retained rows");String text=texts(a.retainedList);check(text.contains("2 个")&&text.contains(PKG)&&text.contains("41"),"retained count/identity not shown");});
  test("ordinary autosave preserves all unresolved records byte for byte",()->{String raw="10:"+PKG+"\np3:10:41:"+PKG;var a=ui(raw);a.editLabel("new label");a.flush();check(a.config.get(AppConfig.HIDE_TARGETS).equals(raw)&&a.manager.targetWrites==0,"unrelated edit rebound or rewrote targets");check(a.config.get(AppConfig.TILE_LABEL).equals("new label")&&!a.dirty,"ordinary setting not saved");});
  test("invalid raw remains intact while other settings save",()->{String raw="v9:10:42:"+PKG;var a=ui(raw);a.renderApps();check(!a.selectionProblem.isEmpty()&&texts(a.retainedList).contains("完整保留"),"invalid treated as empty");a.choose(bound(10,42));a.editLabel("safe");a.flush();check(a.selected.isEmpty()&&a.config.get(AppConfig.HIDE_TARGETS).equals(raw)&&a.manager.targetWrites==0,"invalid raw replaced");});
  test("actual checkbox explicitly replaces old same-user slot only",()->{var a=ui("10:"+PKG+";v3:10:41:"+PKG+";v3:0:0:"+PKG);a.choose(bound(10,42));check(a.selected.equals(new LinkedHashSet<>(Arrays.asList(bound(10,42),bound(0,0)))),"checkbox failed replacement/isolation");a.flush();check(a.manager.lastTargets.equals(a.selected)&&a.manager.targetWrites==1,"new binding not saved");});
  test("checkbox construction and state refresh do not grant intent",()->{var a=ui("10:"+PKG);a.loaded.add(new HideAppsActivity.AppItem(new RootHideManager.AppRecord(bound(10,42)),null));a.box(0);a.refresh();a.flush();check(a.selected.iterator().next().userSerial==-1&&!a.dirty&&a.manager.targetWrites==0,"render/refresh rebound");});
  test("unchecking exact current binding preserves unrelated pending row",()->{var a=ui("v3:10:42:"+PKG+";p3:77:88:"+PKG);a.loaded.add(new HideAppsActivity.AppItem(new RootHideManager.AppRecord(bound(10,42)),null));a.box(0).performClick();check(a.selected.size()==1&&a.selected.iterator().next().userId==77,"unchecked wrong item");});
  test("remove retained selection is explicit and persisted",()->{var a=ui("10:"+PKG);var t=a.selected.iterator().next();a.renderApps();Button b=(Button)a.retainedList.children.get(1).children.get(1);b.performClick();a.flush();check(a.selected.isEmpty()&&a.manager.targetWrites==1,"remove did not save");});
  test("stale displayed checkbox cannot select another serial",()->{var a=ui("10:"+PKG);a.loaded.add(new HideAppsActivity.AppItem(new RootHideManager.AppRecord(bound(10,41)),null));a.box(0).performClick();check(a.selected.iterator().next().userSerial==-1&&!a.dirty,"stale checkbox rebound");});
  test("removed item callback and loading clicks do not save",()->{var a=ui("10:"+PKG);a.loaded.add(new HideAppsActivity.AppItem(new RootHideManager.AppRecord(bound(10,42)),null));var checkbox=a.box(0);a.loaded.clear();checkbox.performClick();a.loading=true;a.choose(bound(10,42));check(!a.dirty&&a.selected.iterator().next().userSerial==-1,"obsolete event rebound");});
  test("app load passes displayed serial and excludes returned wrong binding",()->{var a=ui("");a.manager.apps=Arrays.asList(new RootHideManager.AppRecord(bound(10,42)),new RootHideManager.AppRecord(bound(10,99)),new RootHideManager.AppRecord(new RootHideManager.Target(10,PKG)));a.beginLoad();a.flush();check(a.manager.requestSerial==42&&a.loaded.size()==1&&a.loaded.get(0).record.target.userSerial==42,"load changed binding");});
  test("old load callback cannot replace new same-number space",()->{var a=ui("");a.manager.apps=Arrays.asList(new RootHideManager.AppRecord(bound(10,42)));a.beginLoad();a.executor.next();a.bindSpace(10,99);a.manager.apps=Arrays.asList(new RootHideManager.AppRecord(bound(10,99)));a.beginLoad();a.main.runDue();check(a.loaded.isEmpty()&&a.loading,"old callback accepted");a.flush();check(a.loaded.size()==1&&a.loaded.get(0).record.target.userSerial==99,"new callback lost");});
  test("finish drops pending load result",()->{var a=ui("");a.manager.apps=Arrays.asList(new RootHideManager.AppRecord(bound(10,42)));a.beginLoad();a.executor.next();a.finished=true;a.main.runDue();check(a.loaded.isEmpty(),"finished Activity accepted load");});
  test("unknown serial space is disabled and not selected by current-user ID",()->{var a=ui("");a.manager.users=Arrays.asList(new RootHideManager.UserRecord(10,-1,"Unknown"),new RootHideManager.UserRecord(77,88,"Known"));a.manager.resolved=new UserResolution(true,10,"");a.beginUsers();a.flush();check(a.activeUserId==77&&a.activeUserSerial==88,"unknown serial active");check(!a.spaceTabs.children.get(0).enabled&&a.spaceTabs.children.get(1).enabled,"unknown tab selectable");});
  test("state queries omit pending and stale selection",()->{var a=ui("10:"+PKG+";v3:10:41:"+PKG+";v3:10:42:"+PKG);a.refresh();a.flush();check(a.manager.queried.equals(Collections.singleton(bound(10,42))),"query used stale/unbound target");});
  test("target save failure preserves draft and old persistent selection",()->{var a=ui("10:"+PKG);a.manager.failSave=true;a.choose(bound(10,42));a.flush();check(a.dirty&&a.selected.contains(bound(10,42))&&a.config.get(AppConfig.HIDE_TARGETS).equals("10:"+PKG),"failed save lost state");});
  test("unselected current app retains an exact recovery navigation action",()->{var a=ui("");var target=bound(10,42);var row=a.recoveryRow(target);Button button=action(row,"查找隐藏记录");check(button!=null,"unselected app lost recovery entry");button.performClick();check(a.launched!=null&&target.equals(a.launched.focus),"navigation lost precise target");check(a.manager.targetWrites==0&&a.config.saves==0,"browsing saved or executed a target");});
  test("pending removal still opens the original exact target rather than all history",()->{var a=ui("v3:10:42:"+PKG);var target=bound(10,42);a.selected.clear();a.dirty=true;Button button=action(a.recoveryRow(target),"查找隐藏记录");check(button!=null,"pending removal lost history action");button.performClick();check(target.equals(a.launched.focus)&&a.launched.configured==null,"pending removal changed navigation scope");check(a.dirty&&a.manager.targetWrites==0,"browsing discarded or saved draft");});
  test("save failure keeps the draft and does not block browsing existing records",()->{var a=ui("10:"+PKG);a.manager.failSave=true;a.choose(bound(10,42));a.flush();String old=a.config.get(AppConfig.HIDE_TARGETS);int writes=a.manager.targetWrites;check(a.dirty,"failed draft missing");a.review(HideRecoveryActivity.intent(a,bound(10,42)));check(a.launched!=null&&a.launched.focus.equals(bound(10,42)),"failed save blocked recovery navigation");check(a.dirty&&a.manager.targetWrites==writes&&old.equals(a.config.get(AppConfig.HIDE_TARGETS)),"browsing silently retried or discarded failed save");});
  test("in-flight save is retained while a fixed target opens for review",()->{var a=ui("");a.saving=true;a.dirty=true;a.review(HideRecoveryActivity.intent(a,bound(10,42)));check(a.launched!=null&&a.saving&&a.dirty&&a.manager.targetWrites==0,"review cancelled or waited for configuration write");});
  test("closed selection page cannot launch another recovery activity",()->{var a=ui("");a.finished=true;a.review(HideRecoveryActivity.intent(a,bound(10,42)));check(a.launched==null,"closed page launched recovery");a.finished=false;a.destroyed=true;a.review(HideRecoveryActivity.intent(a,bound(10,42)));check(a.launched==null,"destroyed page launched recovery");});
  for(String raw:new String[]{"10:"+PKG,"v3:10:42:"+PKG,"p3:10:42:"+PKG,"v3:0:0:"+PKG+"\nv3:10:42:"+PKG})test("import pending conversion "+raw.replace('\n',';'),()->{var a=new ConfigTransferActivity();a.prepare(raw);noWrites(a);check(a.manager.validations==1,"missing preview validation");check(a.manager.validated.stream().noneMatch(t->t.isBound()),"import auto-bound");check(ConfigSchema.targetNormalizations==0,"target source normalized first");a.confirm();check(a.manager.validations==2&&a.manager.targetWrites==1,"missing confirmation validation/save");var parsed=HideTargetCodec.parse(a.config.get(AppConfig.HIDE_TARGETS));check(parsed.valid&&parsed.entries.stream().noneMatch(t->t.isBound()),"saved import is bound");if(raw.contains(":42:"))check(parsed.entries.stream().anyMatch(t->t.userSerial==42),"source serial discarded");});
  test("same-number existing binding is demoted by import",()->{var a=new ConfigTransferActivity();a.config.values.put(AppConfig.HIDE_TARGETS,"v3:10:42:"+PKG);a.prepare("v3:10:42:"+PKG);a.confirm();check(a.config.get(AppConfig.HIDE_TARGETS).equals("p3:10:42:"+PKG),"equal user/pkg bypassed reauthorization");});
  test("same pending import still preserves target save ordering",()->{var a=new ConfigTransferActivity();a.config.values.put(AppConfig.HIDE_TARGETS,"p3:10:42:"+PKG);a.prepare("p3:10:42:"+PKG);a.confirm();check(a.manager.targetWrites==1,"equal set bypassed archive/save");});
  test("omitted targets field leaves original bytes untouched",()->{var a=new ConfigTransferActivity();String raw="bad\nraw";a.config.values.put(AppConfig.HIDE_TARGETS,raw);a.prepare(null);a.confirm();check(a.manager.validations==0&&a.manager.targetWrites==0&&a.config.get(AppConfig.HIDE_TARGETS).equals(raw),"omitted targets rewritten");});
  for(String raw:new String[]{"v9:10:42:"+PKG,"10:"+PKG+";bad"," v3:10:42:"+PKG,"x".repeat(65537)})test("bad import rejects complete document length="+raw.length(),()->{var a=new ConfigTransferActivity();a.config.values.put(AppConfig.HIDE_TARGETS,"original");boolean failed=false;try{a.prepare(raw);}catch(Exception expected){failed=true;}check(failed&&AlertDialog.last==null,"invalid import offered confirmation");noWrites(a);check(a.config.get(AppConfig.HIDE_TARGETS).equals("original"),"old selection changed");});
  for(int step:new int[]{1,2})test("validation failure at step "+step+" has zero writes",()->{var a=new ConfigTransferActivity();a.manager.failValidationAt=step;if(step==1){try{a.prepare("10:"+PKG);throw new AssertionError("accepted");}catch(IOException expected){}}else{a.prepare("10:"+PKG);a.confirm();}noWrites(a);});
  test("cancel import leaves all targets/settings untouched",()->{var a=new ConfigTransferActivity();a.prepare("v3:10:42:"+PKG);AlertDialog.last.cancel();a.worker.runAll();noWrites(a);});
  test("export keeps mixed records and imported source serials",()->{var a=new ConfigTransferActivity();String raw="10:"+PKG+"\np3:10:41:"+PKG+";v3:10:42:"+PKG;a.config.values.put(AppConfig.HIDE_TARGETS,raw);var doc=a.exported();check(doc.getJSONObject("settings").getString(AppConfig.HIDE_TARGETS).equals(raw),"export lost raw selection");check(doc.optInt("version")==1,"unexpected envelope change");});
  test("export preserves unknown raw for diagnosis and future recovery",()->{var a=new ConfigTransferActivity();String raw="v9:10:42:"+PKG;a.config.values.put(AppConfig.HIDE_TARGETS,raw);check(a.exported().getJSONObject("settings").getString(AppConfig.HIDE_TARGETS).equals(raw),"unknown export lost");});
  System.out.println("User UI/transfer: "+passed+" passed, "+failed+" failed, 0 skipped");if(failed>0)System.exit(1);
 }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--activity-source", type=Path, default=SRC / "HideAppsActivity.java")
    parser.add_argument("--transfer-source", type=Path, default=SRC / "ConfigTransferActivity.java")
    args = parser.parse_args()
    activity = args.activity_source.read_text(encoding="utf-8-sig")
    transfer = args.transfer_source.read_text(encoding="utf-8-sig")
    manager = (SRC / "RootHideManager.java").read_text(encoding="utf-8-sig")
    ui_names = ["loadSelection()", "currentBinding(", "retainedTargets()", "renderRetainedTargets()",
                "removeRetainedTarget(", "selectTarget(", "loadUsers()", "updateUserAvailability(",
                "renderSpaceTabs()", "selectSpace(", "loadApps(", "stateTargets(", "refreshAppStates()",
                "appRow(", "localizedState(", "saveSettings()", "markDirty()", "openRecovery("]
    def find_method(text, name):
        import re
        matches = list(re.finditer(r"^    private (?:static )?[\w<>.]+ " + re.escape(name), text, re.M))
        if len(matches) != 1:
            raise ValueError("Expected one method: " + name)
        return member(text, matches[0].group())
    ui_methods = "\n".join(find_method(activity, n) for n in ui_names)
    # AppItem is an internal model, made package-visible only for fixture setup.
    ui_methods += "\n" + member(activity, "    private static final class AppItem {").replace("private static final", "static final", 1)
    ui_class = UI_PREFIX.rsplit("}", 1)[0] + ui_methods + "\n}"
    transfer_methods = "\n".join(find_method(transfer, n) for n in ["prepareImport(", "importTargets(", "exportDocument()"])
    transfer_class = IMPORT_PREFIX.rsplit("}", 1)[0] + transfer_methods + "\n}"
    models = "\n".join(member(manager, "    static final class " + name) for name in ["Target", "UserRecord", "UserDirectory"])
    manager_class = r'''
class RootHideManager {
 static final int APP_METADATA_FLAGS=0;enum State{VISIBLE,HIDDEN,MISSING,ERROR}
 static RootHideManager importing;final AppConfig config;int targetWrites,validations,failValidationAt;boolean failSave;
 long requestSerial=-1;List<AppRecord> apps=Collections.emptyList();List<UserRecord> users=Collections.emptyList();
 UserResolution resolved=UserResolution.failure("unknown");Set<Target> lastTargets=Collections.emptySet(),validated=Collections.emptySet(),queried=Collections.emptySet();
 RootHideManager(AppConfig c){config=c;}RootHideManager(ConfigTransferActivity c){config=c.config;}
 UserDirectory userDirectory(){return UserDirectory.success(users);}UserResolution currentUser(UserDirectory d){return resolved;}
 List<AppRecord> listApps(int user,long serial){requestSerial=serial;return apps;}
 Map<Target,State> queryStates(Set<Target> targets){queried=new LinkedHashSet<>(targets);Map<Target,State> result=new LinkedHashMap<>();for(Target t:targets)result.put(t,State.VISIBLE);return result;}
 Set<Target> targets(){Set<Target> out=new LinkedHashSet<>();for(var e:HideTargetCodec.parse(config.get(AppConfig.HIDE_TARGETS)).entries)out.add(new Target(e));return out;}
 OperationResult validateImportTargets(Set<Target> targets){if(importing!=null&&config==importing.config&&this!=importing)return importing.validateImportTargets(targets);validations++;validated=new LinkedHashSet<>(targets);return validations==failValidationAt?OperationResult.failure("validation failed"):OperationResult.success("validated");}
 OperationResult saveTargets(Set<Target> targets,Map<String,String> updates){if(importing!=null&&config==importing.config&&this!=importing)return importing.saveTargets(targets,updates);targetWrites++;lastTargets=new LinkedHashSet<>(targets);if(failSave)return OperationResult.failure("save failed");var all=new LinkedHashMap<>(updates);all.put(AppConfig.HIDE_TARGETS,HideTargetCodec.encode(targets));var saved=config.save(all);return saved.success?OperationResult.success("saved"):OperationResult.failure("failed");}
 OperationResult hide(Target t){throw new AssertionError("No PM expected");}
 static class AppRecord{final Target target;boolean system,protectedApp;String label="Example";long installedAt;AppRecord(Target t){target=t;}}
 static class OperationResult{final boolean success,runtimeSynced,reviewRequired=false;final String message;OperationResult(boolean s,String m){success=s;runtimeSynced=s;message=m;}static OperationResult success(String m){return new OperationResult(true,m);}static OperationResult failure(String m){return new OperationResult(false,m);}}
''' + models + "\n}"
    sources = {
        "ls/augment/com/TestUserUiTransfer.java": BOUNDARIES + manager_class + ui_class + transfer_class + TEST,
        "ls/augment/com/HideTargetCodec.java": (SRC / "HideTargetCodec.java").read_text(encoding="utf-8-sig"),
        "android/util/AtomicFile.java": "package android.util;public class AtomicFile {public AtomicFile(Object f){}public java.io.FileOutputStream startWrite(){throw new AssertionError(\"media\");}public void finishWrite(java.io.FileOutputStream f){}public void failWrite(java.io.FileOutputStream f){}}",
        "android/graphics/BitmapFactory.java": "package android.graphics;public class BitmapFactory {public static class Options{public boolean inJustDecodeBounds;public int outWidth,outHeight;}public static void decodeByteArray(byte[] b,int x,int y,Options o){}}",
    }
    with tempfile.TemporaryDirectory(prefix="lsa-user-ui-transfer-") as directory:
        out = Path(directory)
        paths = []
        for name, text in sources.items():
            path = out / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
            paths.append(str(path))
        for command in (["javac", "--release", "17", "-encoding", "UTF-8", "-d", str(out / "classes"), *paths],
                        ["java", "-cp", str(out / "classes"), "ls.augment.com.TestUserUiTransfer"]):
            result = subprocess.run(command, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=90)
            print(result.stdout + result.stderr, end="")
            if result.returncode:
                return result.returncode
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
