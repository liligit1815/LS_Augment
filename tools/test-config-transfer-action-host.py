"""Run the actual transfer Activity through deterministic offline lifecycle boundaries.

Android, document-provider, dialog and media boundaries are doubles. The complete
production Activity and HideTargetCodec are compiled unchanged, and the manager's
Target model is copied verbatim. This checks navigation, cancellation, failure,
recreation and validation decisions; it does not claim Android layout/ROM coverage.
Every configuration save, media commit and reset operation fails with AssertionError.
Only temporary export cache files are written. No device, ADB or Root is accessed.
"""
from pathlib import Path
import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"

STUBS = {
    "android/content/Context.java": r'''package android.content;
import java.io.*;public class Context {
 public static final int MODE_PRIVATE=0;
 public File cache=new File(System.getProperty("fixture.cache"));
 public ContentResolver resolver=new ContentResolver();
 public Context getApplicationContext(){return this;}public File getCacheDir(){return cache;}
 public File getFilesDir(){return new File(cache,"files");}
 public ContentResolver getContentResolver(){return resolver;}
 public SharedPreferences getSharedPreferences(String name,int mode){return new SharedPreferences();}
}''',
    "android/content/SharedPreferences.java": r'''package android.content;
public class SharedPreferences {
 public Editor edit(){throw new AssertionError("preferences edit is forbidden");}
 public static class Editor {public Editor clear(){throw new AssertionError("preferences clear");}
 public boolean commit(){throw new AssertionError("preferences commit");}}
}''',
    "android/content/ContentResolver.java": r'''package android.content;
import java.io.*;import java.util.*;import android.net.Uri;
public class ContentResolver {
 public final Map<String,byte[]> documents=new HashMap<>();public int reads,writes;
 public boolean failRead,failWrite,nullRead,nullWrite;public Runnable onRead;
 public final ByteArrayOutputStream output=new ByteArrayOutputStream();
 public InputStream openInputStream(Uri uri)throws IOException {
  reads++;if(failRead)throw new IOException("provider read failed");if(nullRead)return null;
  if(onRead!=null){Runnable action=onRead;onRead=null;action.run();}
  byte[] data=documents.get(uri.toString());if(data==null)throw new FileNotFoundException(uri.toString());
  return new ByteArrayInputStream(data);
 }
 public OutputStream openOutputStream(Uri uri,String mode)throws IOException {
  writes++;if(failWrite)throw new IOException("provider write failed");if(nullWrite)return null;
  if(!"wt".equals(mode))throw new AssertionError("export must replace destination");return output;
 }
 public void takePersistableUriPermission(Uri u,int flags){}
}''',
    "android/content/Intent.java": r'''package android.content;
import android.net.Uri;import java.util.*;public class Intent {
 public static final String ACTION_CREATE_DOCUMENT="create",ACTION_OPEN_DOCUMENT="open",CATEGORY_OPENABLE="openable",EXTRA_TITLE="title";
 public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000,FLAG_ACTIVITY_CLEAR_TASK=0x8000,FLAG_ACTIVITY_CLEAR_TOP=0x04000000,FLAG_ACTIVITY_SINGLE_TOP=0x20000000,FLAG_GRANT_READ_URI_PERMISSION=1,FLAG_GRANT_PERSISTABLE_URI_PERMISSION=64;
 public String action,type;public Class<?> target;public int flags;public Uri data;public final Map<String,Object> extras=new HashMap<>();
 public Intent(){}public Intent(String a){action=a;}public Intent(Context c,Class<?> t){target=t;}
 public Intent addCategory(String c){return this;}public Intent setType(String t){type=t;return this;}
 public Intent putExtra(String k,String v){extras.put(k,v);return this;}public String getStringExtra(String k){return (String)extras.get(k);}
 public Intent addFlags(int f){flags|=f;return this;}public Intent setData(Uri u){data=u;return this;}public Uri getData(){return data;}
 public int getFlags(){return flags;}
}''',
    "android/content/DialogInterface.java": r'''package android.content;public interface DialogInterface {
 interface OnClickListener{void onClick(DialogInterface d,int which);}interface OnCancelListener{void onCancel(DialogInterface d);}
 interface OnDismissListener{void onDismiss(DialogInterface d);}void dismiss();
}''',
    "android/net/Uri.java": r'''package android.net;public final class Uri {
 private final String raw;private Uri(String s){raw=s;}public static Uri parse(String s){return new Uri(s);}
 @Override public String toString(){return raw;}@Override public boolean equals(Object o){return o instanceof Uri&&raw.equals(o.toString());}
 @Override public int hashCode(){return raw.hashCode();}
}''',
    "android/os/Bundle.java": r'''package android.os;import java.util.*;public class Bundle {
 public final Map<String,Object> values=new HashMap<>();
 public void putString(String k,String v){values.put(k,v);}public String getString(String k){return (String)values.get(k);}
 public String getString(String k,String d){String s=getString(k);return s==null?d:s;}
 public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k){return getBoolean(k,false);}
 public boolean getBoolean(String k,boolean d){Object v=values.get(k);return v instanceof Boolean?(boolean)v:d;}
 public void putInt(String k,int v){values.put(k,v);}public int getInt(String k){return getInt(k,0);}
 public int getInt(String k,int d){Object v=values.get(k);return v instanceof Integer?(int)v:d;}
 public void putLong(String k,long v){values.put(k,v);}public long getLong(String k,long d){Object v=values.get(k);return v instanceof Long?(long)v:d;}
 public boolean containsKey(String k){return values.containsKey(k);}
}''',
    "android/os/Looper.java": "package android.os;public final class Looper {public static Looper getMainLooper(){return new Looper();}}",
    "android/os/Handler.java": r'''package android.os;public class Handler {
 public Handler(){}public Handler(Looper l){}public boolean post(Runnable r){android.app.Activity.main.add(r);return true;}
 public void removeCallbacksAndMessages(Object token){}
}''',
    "android/window/OnBackInvokedCallback.java": "package android.window;public interface OnBackInvokedCallback {void onBackInvoked();}",
    "android/window/OnBackInvokedDispatcher.java": r'''package android.window;import java.util.*;public class OnBackInvokedDispatcher {
 public static final int PRIORITY_DEFAULT=0;public final Set<OnBackInvokedCallback> callbacks=new LinkedHashSet<>();public int registrations,unregistrations;
 public void registerOnBackInvokedCallback(int priority,OnBackInvokedCallback callback){registrations++;if(!callbacks.add(callback))throw new AssertionError("duplicate native Back callback");}
 public void unregisterOnBackInvokedCallback(OnBackInvokedCallback callback){unregistrations++;if(!callbacks.remove(callback))throw new AssertionError("unregistered native Back callback");}
 public boolean invoke(){if(callbacks.isEmpty())return false;callbacks.iterator().next().onBackInvoked();return true;}
}''',
    "android/app/Activity.java": r'''package android.app;
import android.content.*;import android.os.*;import java.util.*;
public class Activity extends Context {
 public static final int RESULT_OK=-1,RESULT_CANCELED=0;
 public static final ArrayDeque<Runnable> main=new ArrayDeque<>();
 public final List<Intent> launched=new ArrayList<>(),pickers=new ArrayList<>();public final List<Integer> requests=new ArrayList<>();
 public Intent intent=new Intent();public boolean finished,destroyed,failPicker,failNavigation,changing;public int finishCalls,contentViews,backCalls;public Object retained;
 public final android.window.OnBackInvokedDispatcher dispatcher=new android.window.OnBackInvokedDispatcher();public android.window.OnBackInvokedDispatcher getOnBackInvokedDispatcher(){return dispatcher;}
 public void hardwareBack(){if(!dispatcher.invoke())onBackPressed();}
 public void onCreate(Bundle b){}protected void onSaveInstanceState(Bundle b){}protected void onActivityResult(int r,int s,Intent d){}
 protected void onDestroy(){destroyed=true;}public void onBackPressed(){backCalls++;finish();}
 public Intent getIntent(){return intent;}public void setIntent(Intent i){intent=i;}
 public Object getLastNonConfigurationInstance(){return retained;}public Object onRetainNonConfigurationInstance(){return null;}
 public boolean isChangingConfigurations(){return changing;}public android.view.Window getWindow(){return new android.view.Window();}
 public void startActivity(Intent i){if(failNavigation)throw new IllegalStateException("navigation failed");launched.add(i);}
 public void startActivityForResult(Intent i,int r){if(failPicker)throw new IllegalStateException("no document provider");pickers.add(i);requests.add(r);}
 public void finish(){finishCalls++;finished=true;}public boolean isFinishing(){return finished;}public boolean isDestroyed(){return destroyed;}
 public void runOnUiThread(Runnable r){main.add(r);}public void setContentView(Object v){contentViews++;throw new AssertionError("old transfer page inflated");}
 public void setTheme(int theme){}public void overridePendingTransition(int enter,int exit){}
 public static void drainMain(){for(int n=0;!main.isEmpty();n++){if(n>1000)throw new AssertionError("main queue does not settle");main.remove().run();}}
}''',
    "android/view/Window.java": "package android.view;public class Window {public View getDecorView(){return new View();}}",
    "android/view/View.java": "package android.view;public class View {public boolean post(Runnable r){android.app.Activity.main.add(r);return true;}}",
    "android/app/Dialog.java": "package android.app;public class Dialog implements android.content.DialogInterface {public boolean showing;public android.content.DialogInterface.OnDismissListener dismissListener;public void show(){showing=true;}public void setOnDismissListener(android.content.DialogInterface.OnDismissListener listener){dismissListener=listener;}public void dismiss(){showing=false;if(dismissListener!=null)dismissListener.onDismiss(this);}public boolean isShowing(){return showing;}}",
    "android/app/AlertDialog.java": r'''package android.app;
import android.content.*;import java.util.*;public class AlertDialog extends Dialog implements DialogInterface {
 public static final List<AlertDialog> shown=new ArrayList<>();
 public String title="",message="",positiveLabel="",negativeLabel="";public boolean showing,cancelable=true;
 public DialogInterface.OnClickListener positive,negative;public DialogInterface.OnCancelListener cancel;public DialogInterface.OnDismissListener dismiss;
 public void show(){showing=true;shown.add(this);}public void dismiss(){showing=false;if(dismiss!=null)dismiss.onDismiss(this);}
 public void setMessage(String s){message=s;}public boolean isShowing(){return showing;}
 public void negative(){if(negative==null)throw new AssertionError("no negative action");negative.onClick(this,-2);dismiss();}
 public void positive(){if(positive==null)throw new AssertionError("no positive action");positive.onClick(this,-1);dismiss();}
 public void cancel(){if(!cancelable)throw new AssertionError("noncancelable dialog");if(cancel!=null)cancel.onCancel(this);dismiss();}
 public static class Builder {
  final AlertDialog dialog=new AlertDialog();public Builder(Context c){}
  public Builder setTitle(String s){dialog.title=s;return this;}public Builder setMessage(String s){dialog.message=s;return this;}
  public Builder setNegativeButton(String s,DialogInterface.OnClickListener l){dialog.negativeLabel=s;dialog.negative=l;return this;}
  public Builder setPositiveButton(String s,DialogInterface.OnClickListener l){dialog.positiveLabel=s;dialog.positive=l;return this;}
  public Builder setOnCancelListener(DialogInterface.OnCancelListener l){dialog.cancel=l;return this;}
  public Builder setOnDismissListener(DialogInterface.OnDismissListener l){dialog.dismiss=l;return this;}
  public Builder setCancelable(boolean v){dialog.cancelable=v;return this;}
  public AlertDialog create(){return dialog;}public AlertDialog show(){dialog.show();return dialog;}
 }
}''',
    "android/widget/Toast.java": r'''package android.widget;import android.content.Context;import java.util.*;public class Toast {
 public static final int LENGTH_SHORT=0,LENGTH_LONG=1;public static final List<String> messages=new ArrayList<>();String text;
 public static Toast makeText(Context c,String s,int duration){Toast t=new Toast();t.text=s;return t;}public void show(){messages.add(text);}
}''',
    "android/widget/Button.java": "package android.widget;public class Button {public void setEnabled(boolean v){}public void setOnClickListener(java.util.function.Consumer<Button> c){}public void performClick(){throw new AssertionError(\"old transfer button\");}}",
    "android/widget/LinearLayout.java": "package android.widget;public class LinearLayout {public void addView(Object v,Object... p){}public void post(Runnable r){android.app.Activity.main.add(r);}}",
    "android/graphics/BitmapFactory.java": r'''package android.graphics;public final class BitmapFactory {
 public static class Options{public boolean inJustDecodeBounds;public int outWidth,outHeight;}
 public static void decodeByteArray(byte[] b,int start,int length,Options o){if(length>=3&&b[0]==1){o.outWidth=1;o.outHeight=1;}}
}''',
    "android/util/AtomicFile.java": r'''package android.util;import java.io.*;public class AtomicFile {
 public AtomicFile(File file){}public FileOutputStream startWrite(){throw new AssertionError("media write forbidden");}
 public void finishWrite(FileOutputStream out){throw new AssertionError("media commit forbidden");}public void failWrite(FileOutputStream out){}
}''',
    "org/json/JSONObject.java": r'''package org.json;
import java.util.*;public class JSONObject {
 final Map<String,Object> data=new LinkedHashMap<>();public JSONObject(){}public JSONObject(Map<?,?> m){for(var e:m.entrySet())data.put((String)e.getKey(),e.getValue());}
 public JSONObject(String text){Parser p=new Parser(text);Object value=p.value();p.space();if(p.pos!=text.length()||!(value instanceof JSONObject))throw new IllegalArgumentException("invalid JSON object");data.putAll(((JSONObject)value).data);}
 public JSONObject put(String k,Object v){data.put(k,v);return this;}public Object get(String k){if(!data.containsKey(k))throw new IllegalArgumentException(k);return data.get(k);}
 public String getString(String k){Object v=get(k);if(!(v instanceof String))throw new IllegalArgumentException(k);return (String)v;}
 public JSONObject getJSONObject(String k){Object v=get(k);if(!(v instanceof JSONObject))throw new IllegalArgumentException(k);return (JSONObject)v;}
 public JSONObject optJSONObject(String k){return data.get(k) instanceof JSONObject?(JSONObject)data.get(k):null;}
 public String optString(String k){return optString(k,"");}public String optString(String k,String d){Object v=data.get(k);return v instanceof String?(String)v:d;}
 public int optInt(String k){Object v=data.get(k);return v instanceof Number?((Number)v).intValue():0;}
 public boolean has(String k){return data.containsKey(k);}public Iterator<String> keys(){return data.keySet().iterator();}
 @Override public String toString(){return encode(this);}public String toString(int indent){return toString();}
 static String encode(Object v){if(v==null)return "null";if(v instanceof JSONObject){StringJoiner j=new StringJoiner(",","{","}");for(var e:((JSONObject)v).data.entrySet())j.add(encode(e.getKey())+":"+encode(e.getValue()));return j.toString();}
 if(v instanceof String){String s=(String)v;return "\""+s.replace("\\","\\\\").replace("\"","\\\"").replace("\n","\\n").replace("\r","\\r").replace("\t","\\t")+"\"";}return String.valueOf(v);}
 static class Parser {
  final String text;int pos;Parser(String s){text=s;}void space(){while(pos<text.length()&&Character.isWhitespace(text.charAt(pos)))pos++;}
  char take(){if(pos>=text.length())throw new IllegalArgumentException("truncated JSON");return text.charAt(pos++);}
  Object value(){space();char c=take();if(c=='{'){JSONObject o=new JSONObject();space();if(pos<text.length()&&text.charAt(pos)=='}'){pos++;return o;}
   while(true){space();if(take()!='"')throw new IllegalArgumentException("JSON key");String k=string();space();if(take()!=':')throw new IllegalArgumentException("JSON colon");o.put(k,value());space();char end=take();if(end=='}')return o;if(end!=',')throw new IllegalArgumentException("JSON delimiter");}}
   if(c=='"')return string();int start=pos-1;while(pos<text.length()&&",} \r\n\t".indexOf(text.charAt(pos))<0)pos++;String token=text.substring(start,pos);
   if(token.equals("null"))return null;if(token.equals("true"))return true;if(token.equals("false"))return false;
   try{return Long.valueOf(token);}catch(NumberFormatException error){throw new IllegalArgumentException("JSON value");}}
  String string(){StringBuilder b=new StringBuilder();while(true){char c=take();if(c=='"')return b.toString();if(c<' ')throw new IllegalArgumentException("JSON control");if(c=='\\'){char e=take();switch(e){case 'n':c='\n';break;case 'r':c='\r';break;case 't':c='\t';break;case 'b':c='\b';break;case 'f':c='\f';break;case 'u':if(pos+4>text.length())throw new IllegalArgumentException("JSON unicode");c=(char)Integer.parseInt(text.substring(pos,pos+4),16);pos+=4;break;case '"':case '\\':case '/':c=e;break;default:throw new IllegalArgumentException("JSON escape");}}b.append(c);}}
 }
}''',
}

BOUNDARIES = r'''package ls.augment.com;
import android.app.*;import android.content.*;import java.io.*;import java.util.*;import java.util.concurrent.locks.ReentrantLock;
final class AppDialogs {static AlertDialog.Builder builder(Context c){return new AlertDialog.Builder(c);}}
final class SettingsActivity extends Activity {}
final class UiKit {
 UiKit(Context c){throw new AssertionError("old transfer UiKit page constructed");}
 android.widget.LinearLayout detailPage(String title,Object menu){throw new AssertionError("old detail page");}
 android.widget.LinearLayout card(){throw new AssertionError("old transfer card");}Object section(String t,String m){return null;}
 Object margins(int a,int b,int c,int d){return null;}android.widget.Button tonalButton(String t){throw new AssertionError("old transfer button");}
}
final class AppConfig {
 static int saves;static boolean failSnapshot;static final Map<String,String> values=new LinkedHashMap<>();
 AppConfig(Context c){}String get(String k){return values.getOrDefault(k,"");}
 Map<String,String> snapshot(){if(failSnapshot)throw new IllegalStateException("snapshot failed");return new LinkedHashMap<>(values);}
 SaveResult save(Map<String,String> updates){saves++;throw new AssertionError("configuration save forbidden");}
 static class SaveResult {boolean success,runtimeSynced;String message;}
}
final class ResetWriteFence {static boolean invalidated;static long generation(){return 0;}static boolean stale(long generation){return invalidated;}}
final class ConfigResetController {
 static int resets;interface Progress {void stage(String message);}
 static Result reset(Context c,Progress p){resets++;throw new AssertionError("actual reset forbidden");}
 static final class Result {final boolean success,runtimeSynced;final String message;Result(boolean s,boolean r,String m){success=s;runtimeSynced=r;message=m;}}
}
final class ScopeRestartDialog {static final String DEVICE="device";static android.app.Dialog last;static android.app.Dialog show(Context c,String s){last=new android.app.Dialog();last.show();return last;}}
final class BuildConfig {static final String VERSION_NAME="offline";}
final class AuditLog {static final List<String> events=new ArrayList<>();static void write(Context c,String event,String detail){events.add(event);}}
final class ScreenAutomation {static void sync(Context c){throw new AssertionError("automation write forbidden");}}
final class LauncherIconStore {static File file(Context c,String hash){return new File(c.getCacheDir(),"missing-icon-"+hash);}static File directory(Context c){throw new AssertionError("media directory write forbidden");}}
final class ManagedFont {static final int MAX_BYTES=4*1024*1024;static File file(Context c,String hash){return new File(c.getCacheDir(),"missing-font-"+hash);}
 static void validate(String hash,byte[] bytes)throws IOException {if(bytes.length==0)throw new IOException("bad font");}static void store(Context c,String hash,byte[] bytes){throw new AssertionError("font store forbidden");}}
final class GestureArtwork {static final int MAX_BYTES=8*1024*1024;static GestureArtwork decode(byte[] bytes,boolean a,boolean b)throws IOException {if(bytes.length==0)throw new IOException("bad gesture");return new GestureArtwork();}void stop(){}}
final class BackGestureIconPolicy {static String key(int side,String slot){return "gesture-"+side+"-"+slot;}}
final class LauncherOverrides {static LauncherOverrides parse(String text){return text.equals("bad")?null:new LauncherOverrides();}List<Entry> entries(){return List.of();}static class Entry {String icon="";}}
final class RapidFireCompatibility {static String currentFingerprint(Context c){return "offline";}static class Token {static Token parse(String s){return null;}boolean validFor(String s){return false;}}}
final class StatusBarAssetReferences {
 static Set<String> fonts(Map<String,String> values){return Set.of();}static Set<String> statusbarIcons(Map<String,String> values){return Set.of();}
}
final class StatusBarSheetSpec {static final String KEY="ls_augment_statusbar_sheet";List<Cell> cells=List.of();
 static StatusBarSheetSpec parse(String raw){return null;}static class Cell{String content="",image="";}}
final class StatusBarAssetStore {static final int MAX_BYTES=8*1024*1024;static File file(Context c,String hash){return new File(c.getCacheDir(),"missing-art-"+hash);}
 static byte[] read(Context c,String hash){throw new AssertionError("art read");}static void validate(String h,byte[] b){}static void store(Context c,String h,byte[] b){throw new AssertionError("art store forbidden");}}
final class StatusBarAssetPack {static org.json.JSONObject exportNotices(Context c,Set<String> hashes){return new org.json.JSONObject();}
 static Map<String,String> parseNotices(org.json.JSONObject o,Set<String> h){return Map.of();}static void restoreNotices(Context c,Map<String,String> m){throw new AssertionError("notices store forbidden");}}
class RootHideManager {
 static final ReentrantLock ACTION_LOCK=new ReentrantLock();static int validations,targetSaves;static boolean rejectTargets;static Set<Target> lastTargets;
 RootHideManager(Context c){}OperationResult validateImportTargets(Set<Target> targets){validations++;lastTargets=new LinkedHashSet<>(targets);return new OperationResult(!rejectTargets,"target validation failed");}
 OperationResult saveTargets(Set<Target> targets,Map<String,String> values){targetSaves++;throw new AssertionError("target save forbidden");}
 static class OperationResult {final boolean success,runtimeSynced=false,reviewRequired=false;final String message;OperationResult(boolean s,String m){success=s;message=m;}}
 TARGET_MODEL
}
'''

TEST = r'''package ls.augment.com;
import android.app.*;import android.content.*;import android.net.*;import android.os.*;import android.widget.*;
import org.json.*;import java.io.*;import java.nio.charset.StandardCharsets;import java.nio.file.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
public final class TestTransferActionHost {
 static int passed,failed,totalSaves,totalTargetSaves,totalResets;static final Uri URI=Uri.parse("content://offline/document");static final String PKG="org.example.app";
 interface Case {void run()throws Exception;}
 static void check(boolean v,String message){if(!v)throw new AssertionError(message);}
 static void test(String name,Case body)throws Exception {reset();try{body.run();noWrites();passed++;System.out.println("PASS "+name);}catch(Throwable error){failed++;System.out.println("FAIL "+name+": "+error);error.printStackTrace(System.out);}finally{totalSaves+=AppConfig.saves;totalTargetSaves+=RootHideManager.targetSaves;totalResets+=ConfigResetController.resets;Activity.main.clear();}}
 static void reset()throws Exception {Activity.main.clear();AlertDialog.shown.clear();Toast.messages.clear();AuditLog.events.clear();AppConfig.values.clear();AppConfig.saves=0;AppConfig.failSnapshot=false;RootHideManager.validations=RootHideManager.targetSaves=ConfigResetController.resets=0;RootHideManager.rejectTargets=false;RootHideManager.lastTargets=null;ResetWriteFence.invalidated=false;ScopeRestartDialog.last=null;queues.clear();
  Field job=ConfigTransferActivity.class.getDeclaredField("resetJob");job.setAccessible(true);job.set(null,null);
  Files.deleteIfExists(Path.of(System.getProperty("fixture.cache"),"pending-config-export.json"));
 }
 static void noWrites(){check(AppConfig.saves==0&&RootHideManager.targetSaves==0&&ConfigResetController.resets==0,"a forbidden configuration/reset operation ran");}
 static final class Queue extends AbstractExecutorService {
  final ArrayDeque<Runnable> tasks=new ArrayDeque<>();boolean closed;
  public void execute(Runnable r){if(closed)throw new RejectedExecutionException();tasks.add(r);}public void shutdown(){closed=true;}
  public List<Runnable> shutdownNow(){closed=true;List<Runnable> copy=new ArrayList<>(tasks);tasks.clear();return copy;}
  public boolean isShutdown(){return closed;}public boolean isTerminated(){return closed&&tasks.isEmpty();}public boolean awaitTermination(long t,TimeUnit u){return isTerminated();}
  void drain(){for(int n=0;!tasks.isEmpty();n++){if(n>1000)throw new AssertionError("worker does not settle");tasks.remove().run();}}
 }
 static final Map<ConfigTransferActivity,Queue> queues=new IdentityHashMap<>();
 static ConfigTransferActivity host(String action,Bundle state)throws Exception {return host(action,state,null,null);}
 static ConfigTransferActivity host(String action,Bundle state,Object retained,ContentResolver resolver)throws Exception {
  ConfigTransferActivity a=new ConfigTransferActivity();Intent intent=new Intent();if(action!=null)intent.putExtra("action",action);a.setIntent(intent);
  a.retained=retained;if(resolver!=null)a.resolver=resolver;a.onCreate(state);
  Field worker=ConfigTransferActivity.class.getDeclaredField("worker");worker.setAccessible(true);ExecutorService prior=(ExecutorService)worker.get(a);Queue queue;
  if(prior instanceof Queue)queue=(Queue)prior;
  else {prior.shutdownNow();queue=new Queue();Field transfer=ConfigTransferActivity.class.getDeclaredField("transfer");transfer.setAccessible(true);Object session=transfer.get(a);Field sessionWorker=session.getClass().getDeclaredField("worker");sessionWorker.setAccessible(true);sessionWorker.set(session,queue);worker.set(a,queue);}
  queues.put(a,queue);return a;
 }
 static void flush(ConfigTransferActivity a){for(int n=0;n<20;n++){boolean main=!Activity.main.isEmpty(),work=!queues.get(a).tasks.isEmpty();Activity.drainMain();queues.get(a).drain();if(!main&&!work)return;}throw new AssertionError("activity did not settle");}
 static void returned(ConfigTransferActivity a){check(a.isFinishing(),"host did not finish to reveal Module page");check(a.contentViews==0,"transfer content view inflated");check(a.launched.size()<=1,"duplicate module navigation");if(!a.launched.isEmpty()){Intent i=a.launched.get(0);check(i.target==SettingsActivity.class&&"settings".equals(i.getStringExtra("tab")),"did not return to module settings");}}
 static AlertDialog dialog(String title){List<AlertDialog> matches=AlertDialog.shown.stream().filter(d->d.showing&&d.title.equals(title)).toList();check(matches.size()==1,"expected one active "+title+", got "+matches.size());return matches.get(0);}
 static Bundle save(ConfigTransferActivity a){Bundle b=new Bundle();a.onSaveInstanceState(b);return b;}
 static ConfigTransferActivity recreate(ConfigTransferActivity a,String action)throws Exception {Bundle state=save(a);Object retained=a.onRetainNonConfigurationInstance();a.changing=true;a.onDestroy();ConfigTransferActivity next=host(action,state,retained,a.resolver);flush(next);return next;}
 static ConfigTransferActivity processDeath(ConfigTransferActivity a,String action)throws Exception {Bundle state=save(a);a.onDestroy();queues.get(a).shutdownNow();Activity.main.clear();ConfigTransferActivity next=host(action,state,null,a.resolver);flush(next);return next;}
 static Object seedReset(ConfigResetController.Result result)throws Exception {Class<?> type=Class.forName("ls.augment.com.ConfigTransferActivity$ResetJob");Constructor<?> constructor=type.getDeclaredConstructor(Context.class);constructor.setAccessible(true);Object job=constructor.newInstance(new Context());Field value=type.getDeclaredField("result");value.setAccessible(true);value.set(job,result);Field global=ConfigTransferActivity.class.getDeclaredField("resetJob");global.setAccessible(true);global.set(null,job);return job;}
 static void resetResult(Object job,ConfigResetController.Result result)throws Exception {Field value=job.getClass().getDeclaredField("result");value.setAccessible(true);value.set(job,result);Method render=job.getClass().getDeclaredMethod("render");render.setAccessible(true);render.invoke(job);Activity.drainMain();}
 static void picked(ConfigTransferActivity a,int request){a.onActivityResult(request,Activity.RESULT_OK,new Intent().setData(URI));}
 static JSONObject doc(JSONObject values){return new JSONObject().put("format","LS_Augment.settings").put("version",1).put("settings",values);}
 static JSONObject valid(){return doc(new JSONObject().put("flag","1"));}
 static void document(ConfigTransferActivity a,JSONObject doc){a.resolver.documents.put(URI.toString(),doc.toString().getBytes(StandardCharsets.UTF_8));}
 static void prepare(ConfigTransferActivity a,JSONObject doc)throws Exception {Method m=ConfigTransferActivity.class.getDeclaredMethod("prepareImport",JSONObject.class);m.setAccessible(true);try{m.invoke(a,doc);}catch(InvocationTargetException e){if(e.getCause() instanceof Exception)throw (Exception)e.getCause();throw e;}Activity.drainMain();}
 static void rejects(ConfigTransferActivity a,JSONObject doc)throws Exception {int dialogs=AlertDialog.shown.size();try{prepare(a,doc);throw new AssertionError("invalid document accepted");}catch(IOException|IllegalArgumentException expected){}check(AlertDialog.shown.size()==dialogs,"invalid document offered confirmation");}
 public static void main(String[] args)throws Exception {
  for(String action:new String[]{null,"unknown","","RESET"})test("no/unknown action returns settings: "+action,()->{var a=host(action,null);flush(a);returned(a);check(a.launched.size()==1,"legacy entry did not explicitly navigate to settings");check(a.pickers.isEmpty()&&AlertDialog.shown.isEmpty(),"unknown action dispatched transfer");a.onDestroy();});
  test("import directly opens exactly one SAF picker",()->{var a=host("import",null);flush(a);check(a.pickers.size()==1&&a.requests.equals(List.of(72))&&a.pickers.get(0).action.equals(Intent.ACTION_OPEN_DOCUMENT),"import did not directly launch SAF");check(a.contentViews==0&&!a.isFinishing(),"import old page or early exit");a.onDestroy();});
  test("export directly prepares backup and opens SAF",()->{var a=host("export",null);flush(a);check(a.pickers.size()==1&&a.requests.equals(List.of(71))&&a.pickers.get(0).action.equals(Intent.ACTION_CREATE_DOCUMENT),"export SAF launch");check(Files.isRegularFile(a.getCacheDir().toPath().resolve("pending-config-export.json")),"backup cache not prepared");a.onDestroy();});
  for(String action:new String[]{"import","export"}){
   int request=action.equals("import")?72:71;
   test(action+" picker cancellation returns module",()->{var a=host(action,null);flush(a);a.onActivityResult(request,Activity.RESULT_CANCELED,null);flush(a);returned(a);a.onDestroy();});
   for(Intent result:new Intent[]{null,new Intent()})test(action+" missing provider URI returns module",()->{var a=host(action,null);flush(a);a.onActivityResult(request,Activity.RESULT_OK,result);flush(a);returned(a);a.onDestroy();});
   test(action+" picker recreation does not relaunch SAF",()->{var a=host(action,null);flush(a);var next=recreate(a,action);check(next.pickers.isEmpty(),"recreated picker relaunched");check(next.launched.isEmpty()&&!next.isFinishing(),"recreated picker abandoned");next.onActivityResult(request,Activity.RESULT_CANCELED,null);flush(next);returned(next);next.onDestroy();});
   test(action+" unavailable SAF provider returns module",()->{var a=host(action,null);a.failPicker=true;flush(a);returned(a);check(!Toast.messages.isEmpty(),"provider launch failure not explained");a.onDestroy();});
  }
  test("export preparation failure returns module",()->{AppConfig.failSnapshot=true;var a=host("export",null);flush(a);returned(a);check(a.pickers.isEmpty(),"failed backup opened SAF");a.onDestroy();});
  test("export provider write failure returns module",()->{var a=host("export",null);flush(a);a.resolver.failWrite=true;picked(a,71);flush(a);returned(a);check(a.resolver.writes==1&&!Toast.messages.isEmpty(),"write failure not exercised");a.onDestroy();});
  test("export null output stream returns module",()->{var a=host("export",null);flush(a);a.resolver.nullWrite=true;picked(a,71);flush(a);returned(a);a.onDestroy();});
  test("export successful provider write returns module",()->{var a=host("export",null);flush(a);picked(a,71);flush(a);returned(a);check(new JSONObject(a.resolver.output.toString(StandardCharsets.UTF_8)).optString("format").equals("LS_Augment.settings"),"wrong export envelope");a.onDestroy();});
  for(boolean nullStream:new boolean[]{false,true})test("import provider read failure/null returns module: "+nullStream,()->{var a=host("import",null);flush(a);a.resolver.failRead=!nullStream;a.resolver.nullRead=nullStream;picked(a,72);flush(a);returned(a);check(AlertDialog.shown.isEmpty(),"read failure offered confirmation");a.onDestroy();});
  test("import invalid JSON returns module",()->{var a=host("import",null);flush(a);a.resolver.documents.put(URI.toString(),"{bad}".getBytes(StandardCharsets.UTF_8));picked(a,72);flush(a);returned(a);check(AlertDialog.shown.isEmpty(),"invalid JSON offered confirmation");a.onDestroy();});
  test("import invalid envelope returns module",()->{var a=host("import",null);flush(a);document(a,new JSONObject().put("format","foreign").put("version",1).put("settings",new JSONObject()));picked(a,72);flush(a);returned(a);check(AlertDialog.shown.isEmpty(),"invalid envelope offered confirmation");a.onDestroy();});
  test("oversized import returns module before confirmation",()->{var a=host("import",null);flush(a);a.resolver.documents.put(URI.toString(),new byte[32*1024*1024+1]);picked(a,72);flush(a);returned(a);check(AlertDialog.shown.isEmpty(),"oversized import offered confirmation");a.onDestroy();});
  for(boolean cancel:new boolean[]{false,true})test("import preview cancellation returns settings: "+cancel,()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);flush(a);AlertDialog d=dialog("导入配置");if(cancel)d.cancel();else d.negative();flush(a);returned(a);a.onDestroy();});
  for(boolean cancel:new boolean[]{false,true})test("reset confirmation cancellation returns settings: "+cancel,()->{var a=host("reset",null);flush(a);AlertDialog d=dialog("重置配置？");check(a.pickers.isEmpty()&&!a.isFinishing(),"reset did not wait for confirmation");if(cancel)d.cancel();else d.negative();flush(a);returned(a);a.onDestroy();});
  test("reset confirmation is restored after recreation",()->{var a=host("reset",null);flush(a);dialog("重置配置？");var next=recreate(a,"reset");dialog("重置配置？").negative();flush(next);returned(next);check(a.launched.isEmpty(),"destroyed host navigated");next.onDestroy();});
  test("reset confirmation is restored after process death without resetting",()->{var a=host("reset",null);flush(a);var next=processDeath(a,"reset");dialog("重置配置？").negative();flush(next);returned(next);next.onDestroy();});
  test("hardware Back from reset confirmation returns module",()->{var a=host("reset",null);flush(a);a.hardwareBack();flush(a);returned(a);a.onDestroy();});
  test("native gesture Back shares default return without duplicate finish",()->{var a=host("reset",null);flush(a);check(a.dispatcher.registrations==1&&a.dispatcher.callbacks.size()==1,"native Back callback absent or duplicated");check(a.dispatcher.invoke(),"native Back was not dispatched");a.dispatcher.invoke();returned(a);check(a.backCalls==1&&a.finishCalls==1,"native return recursed or finished twice");a.onDestroy();check(a.dispatcher.callbacks.isEmpty()&&a.dispatcher.unregistrations==1&&!a.dispatcher.invoke(),"destroyed host retained Back callback");});
  test("native gesture Back preserves running reset guard",()->{seedReset(null);var a=host("reset",null);flush(a);a.dispatcher.invoke();check(!a.isFinishing()&&a.launched.isEmpty()&&a.backCalls==0,"native Back escaped running reset");check(Toast.messages.contains("重置正在进行，请稍候"),"reset guard feedback lost");a.onDestroy();});
  test("native gesture Back after reset completion reopens module once",()->{seedReset(new ConfigResetController.Result(true,false,"offline report"));var a=host("reset",null);flush(a);a.dispatcher.invoke();returned(a);check(a.launched.size()==1&&a.finishCalls==1&&a.backCalls==0,"completed reset native Back repeated navigation");a.onDestroy();});
  test("recreation unregisters old native Back callback and registers new owner once",()->{seedReset(null);var a=host("reset",null);flush(a);var next=recreate(a,"reset");check(a.dispatcher.callbacks.isEmpty()&&!a.dispatcher.invoke(),"obsolete Activity owns native Back");check(next.dispatcher.callbacks.size()==1&&next.dispatcher.registrations==1,"recreated callback duplicated");next.dispatcher.invoke();check(!next.isFinishing()&&next.backCalls==0,"recreated reset lost native Back guard");next.onDestroy();check(next.dispatcher.callbacks.isEmpty(),"recreated host did not unregister");});
  test("import preview recreation retains validated payload without provider replay",()->{var a=host("import",null);flush(a);document(a,doc(new JSONObject().put(ConfigSchema.HIDE_TARGETS,"v3:10:42:"+PKG)));picked(a,72);flush(a);dialog("导入配置");check(a.resolver.reads==1&&RootHideManager.validations==1,"initial validation missing");var next=recreate(a,"import");check(next.pickers.isEmpty()&&next.resolver.reads==1&&RootHideManager.validations==1,"rotation replayed provider I/O/validation");dialog("导入配置").negative();flush(next);returned(next);next.onDestroy();});
  test("provider changes cannot replace already validated retained preview",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);flush(a);String preview=dialog("导入配置").message;document(a,doc(new JSONObject().put("unknown","1")));var next=recreate(a,"import");check(next.resolver.reads==1&&dialog("导入配置").message.equals(preview),"rotation swapped validated payload from provider");dialog("导入配置").negative();flush(next);returned(next);next.onDestroy();});
  test("import read queued before rotation delivers only to new host",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);Bundle state=save(a);Object retained=a.onRetainNonConfigurationInstance();a.changing=true;a.onDestroy();queues.get(a).drain();Activity.drainMain();check(a.launched.isEmpty()&&AlertDialog.shown.stream().noneMatch(d->d.showing),"old read displayed UI");var next=host("import",state,retained,a.resolver);flush(next);dialog("导入配置").negative();flush(next);returned(next);check(next.resolver.reads==1,"rotation restarted queued provider read");next.onDestroy();});
  for(String action:new String[]{"import","export"})test(action+" picker state after process death waits without reopening",()->{var a=host(action,null);flush(a);var next=processDeath(a,action);check(next.pickers.isEmpty()&&!next.isFinishing(),"saved picker reopened or exited");next.onActivityResult(action.equals("import")?72:71,Activity.RESULT_CANCELED,null);flush(next);returned(next);next.onDestroy();});
  test("export cache remains usable after process death while picker is open",()->{var a=host("export",null);flush(a);byte[] cached=Files.readAllBytes(a.getCacheDir().toPath().resolve("pending-config-export.json"));var next=processDeath(a,"export");picked(next,71);flush(next);returned(next);check(Arrays.equals(cached,next.resolver.output.toByteArray()),"restored export did not use exact cached backup");next.onDestroy();});
  test("process death during import read exits without restarting provider work",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);var next=processDeath(a,"import");returned(next);check(next.resolver.reads==0&&AlertDialog.shown.isEmpty()&&!Toast.messages.isEmpty(),"interrupted import replayed or did not explain interruption");next.onDestroy();});
  test("process death during import preview exits without stale confirmation",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);flush(a);var next=processDeath(a,"import");returned(next);check(next.resolver.reads==1&&AlertDialog.shown.stream().noneMatch(d->d.showing),"process-death preview reused an absent validated payload");next.onDestroy();});
  test("process death during export preparation exits without rebuilding backup",()->{var a=host("export",null);Activity.drainMain();check(!queues.get(a).tasks.isEmpty(),"export was not preparing");var next=processDeath(a,"export");returned(next);check(next.pickers.isEmpty()&&!Files.exists(next.getCacheDir().toPath().resolve("pending-config-export.json")),"interrupted export restarted");next.onDestroy();});
  test("process death during export write exits without replaying write",()->{var a=host("export",null);flush(a);picked(a,71);var next=processDeath(a,"export");returned(next);check(next.resolver.writes==0,"interrupted write replayed");next.onDestroy();});
  test("rotation during export preparation sends one picker to the new owner",()->{var a=host("export",null);Activity.drainMain();var next=recreate(a,"export");check(a.pickers.isEmpty()&&next.pickers.size()==1,"picker was sent to old owner or duplicated");next.onActivityResult(71,Activity.RESULT_CANCELED,null);flush(next);returned(next);next.onDestroy();});
  test("rotation during export write finishes on the new owner only",()->{var a=host("export",null);flush(a);picked(a,71);var next=recreate(a,"export");returned(next);check(!a.isFinishing()&&a.launched.isEmpty()&&next.pickers.isEmpty()&&next.resolver.writes==1&&Toast.messages.size()==1,"export write lost/duplicated or UI went to old owner");next.onDestroy();});
  test("confirmed import rechecks target safety before any write",()->{var a=host("import",null);flush(a);document(a,doc(new JSONObject().put(ConfigSchema.HIDE_TARGETS,"v3:10:42:"+PKG)));picked(a,72);flush(a);RootHideManager.rejectTargets=true;dialog("导入配置").positive();flush(a);returned(a);check(RootHideManager.validations==2&&AuditLog.events.contains("CONFIG_IMPORT_FAILED"),"confirmation bypassed target validation");check(!RootHideManager.ACTION_LOCK.isLocked(),"failed import left action lock held");a.onDestroy();});
  test("reset fence rejects a confirmed stale import before any write",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);flush(a);ResetWriteFence.invalidated=true;dialog("导入配置").positive();flush(a);returned(a);check(AuditLog.events.contains("CONFIG_IMPORT_FAILED")&&!RootHideManager.ACTION_LOCK.isLocked(),"stale import was not rejected/unlocked");a.onDestroy();});
  test("rotation during failed confirmed import keeps completion on new owner",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);flush(a);ResetWriteFence.invalidated=true;dialog("导入配置").positive();var next=recreate(a,"import");returned(next);check(a.launched.isEmpty()&&!a.isFinishing()&&Toast.messages.size()==1&&next.resolver.reads==1,"confirmed import failure used old owner or replayed read");next.onDestroy();});
  test("process death during confirmed import exits without retry",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);flush(a);ResetWriteFence.invalidated=true;dialog("导入配置").positive();var next=processDeath(a,"import");returned(next);check(next.resolver.reads==1&&!AuditLog.events.contains("CONFIG_IMPORT_FAILED"),"process-death import retried applying job");next.onDestroy();});
  test("synthetic reset progress survives rotation and blocks hardware Back",()->{Object job=seedReset(null);var a=host("reset",null);flush(a);check(!dialog("正在重置配置").cancelable,"reset progress cancelable");var next=recreate(a,"reset");dialog("正在重置配置");next.hardwareBack();check(!next.isFinishing()&&!Toast.messages.isEmpty(),"Back abandoned running reset");resetResult(job,new ConfigResetController.Result(false,false,"offline failure"));check(AlertDialog.shown.stream().noneMatch(d->d.showing&&d.title.equals("正在重置配置")),"progress was not dismissed on completion");dialog("重置未完成").negative();returned(next);check((next.launched.get(0).flags&Intent.FLAG_ACTIVITY_CLEAR_TASK)!=0,"reset completion did not reopen fresh module task");next.onDestroy();});
  for(boolean success:new boolean[]{false,true})test("synthetic reset report survives rotation: "+success,()->{seedReset(new ConfigResetController.Result(success,false,"offline report"));var a=host("reset",null);flush(a);String title=success?"重置完成":"重置未完成";dialog(title);var next=recreate(a,"reset");AlertDialog report=dialog(title);check(report.positive==null,"unsynced reset offered device restart");report.cancel();returned(next);check(a.launched.isEmpty(),"old reset report owner navigated");next.onDestroy();});
  test("synthetic completed reset hardware Back reopens fresh module task",()->{seedReset(new ConfigResetController.Result(false,false,"offline report"));var a=host("reset",null);flush(a);a.hardwareBack();returned(a);a.onDestroy();});
  test("closing synthetic restart chooser returns to module without device restart",()->{seedReset(new ConfigResetController.Result(true,true,"offline report"));var a=host("reset",null);flush(a);dialog("重置完成").positive();check(ScopeRestartDialog.last!=null&&ScopeRestartDialog.last.isShowing()&&!a.isFinishing(),"restart chooser did not wait");ScopeRestartDialog.last.dismiss();returned(a);a.onDestroy();});
  test("late export completion after hardware Back does not reopen or display toast",()->{var a=host("export",null);flush(a);picked(a,71);a.hardwareBack();Activity.drainMain();returned(a);int toasts=Toast.messages.size(),launches=a.launched.size();queues.get(a).drain();Activity.drainMain();check(a.launched.size()==launches&&Toast.messages.size()==toasts,"closed export emitted stale UI");a.onDestroy();});
  test("late import completion after hardware Back has no confirmation or second navigation",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,72);a.hardwareBack();Activity.drainMain();returned(a);int launches=a.launched.size();queues.get(a).drain();Activity.drainMain();check(AlertDialog.shown.isEmpty()&&a.launched.size()==launches,"closed import emitted stale UI");a.onDestroy();});
  test("unknown activity result never writes provider or opens import",()->{var a=host("import",null);flush(a);document(a,valid());picked(a,99);flush(a);check(a.resolver.reads==0&&a.resolver.writes==0&&AlertDialog.shown.isEmpty(),"unrelated activity result dispatched I/O");a.onDestroy();});
  test("import retains pending identities without binding current space",()->{var a=host("import",null);flush(a);prepare(a,doc(new JSONObject().put(ConfigSchema.HIDE_TARGETS,"v3:10:42:"+PKG+";0:"+PKG)));check(RootHideManager.validations==1&&RootHideManager.lastTargets.size()==2&&RootHideManager.lastTargets.stream().noneMatch(t->t.isBound()),"import auto-bound saved user IDs");check(RootHideManager.lastTargets.stream().anyMatch(t->t.userSerial==42),"source serial discarded");dialog("导入配置").negative();flush(a);returned(a);a.onDestroy();});
  for(String raw:new String[]{"v9:10:42:"+PKG,"10:"+PKG+";bad"," v3:10:42:"+PKG,"x".repeat(65537)})test("malformed target import is rejected length="+raw.length(),()->{var a=host("import",null);flush(a);rejects(a,doc(new JSONObject().put(ConfigSchema.HIDE_TARGETS,raw)));a.onDestroy();});
  test("unknown configuration key is rejected",()->{var a=host("import",null);flush(a);rejects(a,doc(new JSONObject().put("unknown","1")));a.onDestroy();});
  test("non-string setting is rejected",()->{var a=host("import",null);flush(a);rejects(a,doc(new JSONObject().put("flag",1)));a.onDestroy();});
  test("invalid normalized setting is rejected",()->{var a=host("import",null);flush(a);rejects(a,doc(new JSONObject().put("flag","bad")));a.onDestroy();});
  test("invalid image digest is rejected before preview",()->{var a=host("import",null);flush(a);String hash="a".repeat(64);rejects(a,doc(new JSONObject().put(ConfigSchema.TILE_ICON,hash)).put("images",new JSONObject().put(hash,Base64.getEncoder().encodeToString(new byte[]{1,2,3}))));a.onDestroy();});
  test("missing referenced image is rejected",()->{var a=host("import",null);flush(a);rejects(a,doc(new JSONObject().put(ConfigSchema.TILE_ICON,"a".repeat(64))));a.onDestroy();});
  test("invalid authorization metadata is rejected",()->{var a=host("import",null);flush(a);rejects(a,valid().put("statusbarNotices","bad"));a.onDestroy();});
  test("root target validation rejection offers no preview",()->{RootHideManager.rejectTargets=true;var a=host("import",null);flush(a);rejects(a,doc(new JSONObject().put(ConfigSchema.HIDE_TARGETS,"10:"+PKG)));check(RootHideManager.validations==1,"validation was not called");a.onDestroy();});
  System.out.println("Config transfer action host: "+passed+" passed, "+failed+" failed, 0 skipped; configuration saves/target saves/reset operations: "+totalSaves+"/"+totalTargetSaves+"/"+totalResets);if(failed>0)System.exit(1);
 }
}'''


def java_tool(name):
    executable = name + (".exe" if os.name == "nt" else "")
    homes = [os.environ.get("JAVA_HOME", ""), "C:/Program Files/Android/openjdk/jdk-21.0.8"]
    for home in homes:
        candidate = Path(home) / "bin" / executable
        if home and candidate.is_file():
            return str(candidate)
    found = shutil.which(name)
    if found:
        return found
    raise RuntimeError("A JDK 17 or newer is required for offline Java tests")


def target_model():
    # This small model contains no nested braces other than constructors, so a
    # balanced member extraction preserves the production definition unchanged.
    text = (SRC / "RootHideManager.java").read_text(encoding="utf-8-sig")
    start = text.index("    static final class Target extends HideTargetCodec.Entry {")
    opening = text.index("{", start)
    depth = 1
    end = opening + 1
    while depth:
        depth += (text[end] == "{") - (text[end] == "}")
        end += 1
    return text[start:end]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--activity-source", type=Path, default=SRC / "ConfigTransferActivity.java",
                        help="Alternate real Activity source for behavioral negative controls")
    parser.add_argument("--report", type=Path, help="Write the source identity, results and boundary limits as JSON")
    args = parser.parse_args()
    activity = args.activity_source.read_text(encoding="utf-8-sig")
    constants = sorted(set(re.findall(r"ConfigSchema\.([A-Z][A-Z0-9_]+)", activity)))
    schema = "package ls.augment.com;final class ConfigSchema {" + "".join(
        f'static final String {name}="{name}";' for name in constants) + r'''
static boolean contains(String key){return key.equals("flag")||''' + "||".join(
        f"key.equals({name})" for name in constants) + r''';}
static String normalize(String key,String value){return key.equals("flag")&&!value.matches("[01]")?null:value;}}
'''
    sources = dict(STUBS)
    sources.update({
        "ls/augment/com/ConfigTransferActivity.java": activity,
        "ls/augment/com/HideTargetCodec.java": (SRC / "HideTargetCodec.java").read_text(encoding="utf-8-sig"),
        "ls/augment/com/ConfigSchema.java": schema,
        "ls/augment/com/Boundaries.java": BOUNDARIES.replace(" TARGET_MODEL", target_model()),
        "ls/augment/com/TestTransferActionHost.java": TEST,
    })
    with tempfile.TemporaryDirectory(prefix="lsa-transfer-action-host-") as folder:
        work = Path(folder)
        cache = work / "cache"
        cache.mkdir()
        paths = []
        for name, code in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(code, encoding="utf-8")
            paths.append(str(path))
        commands = [
            [java_tool("javac"), "-J-Dfile.encoding=UTF-8", "--release", "17", "-encoding", "UTF-8", "-d", str(work / "classes"), *paths],
            [java_tool("java"), "-Dfile.encoding=UTF-8", f"-Dfixture.cache={cache}", "-cp", str(work / "classes"), "ls.augment.com.TestTransferActionHost"],
        ]
        transcript = ""
        returncode = 0
        for command in commands:
            result = subprocess.run(command, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=90)
            output = result.stdout + result.stderr
            transcript += output
            print(output, end="")
            if result.returncode:
                returncode = result.returncode
                break
        result_counts = re.search(r"Config transfer action host: (\d+) passed, (\d+) failed, (\d+) skipped; configuration saves/target saves/reset operations: (\d+)/(\d+)/(\d+)", transcript)
        counts = list(map(int, result_counts.groups())) if result_counts else [0, 0, 0, 0, 0, 0]
        report = {
            "status": "passed" if returncode == 0 and result_counts else "failed",
            "activity_source": str(args.activity_source.resolve()),
            "activity_sha256": hashlib.sha256(args.activity_source.read_bytes()).hexdigest(),
            "codec_sha256": hashlib.sha256((SRC / "HideTargetCodec.java").read_bytes()).hexdigest(),
            "passed": counts[0], "failed": counts[1], "skipped": counts[2],
            "configuration_save_calls": counts[3], "target_save_calls": counts[4], "reset_calls": counts[5],
            "adb_used": False, "root_used": False,
            "real_production": ["complete ConfigTransferActivity", "HideTargetCodec", "RootHideManager.Target model"],
            "doubles": ["Android lifecycle/UI/queues", "document provider", "JSON parser", "schema/media/Root boundaries"],
            "limits": "Offline lifecycle/event decisions only; Android layout, system back stack, ROM behavior and successful import/reset are not validated.",
            "cases": re.findall(r"^PASS (.+)$", transcript, re.MULTILINE),
            "exit_code": returncode,
        }
        print("SOURCE_SHA256 " + report["activity_sha256"])
        if args.report:
            args.report.parent.mkdir(parents=True, exist_ok=True)
            args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
            print("REPORT " + str(args.report.resolve()))
    return returncode



# New app-document dependencies. This original suite forbids every confirmed write.
for _name in ['AtomicWorkbenchAppListModel.java','AtomicWorkbenchAppPreferences.java','AtomicWorkbenchAppPreferencesTransfer.java']:
    STUBS['ls/augment/com/'+_name]=(SRC/_name).read_text(encoding='utf-8')
STUBS['android/os/Process.java']='package android.os;public class Process{public static int myUid(){return 10001;}}'
STUBS['android/util/AtomicFile.java']=r"""package android.util;import java.io.*;public class AtomicFile{
 final File file;public AtomicFile(File file){this.file=file;}public FileInputStream openRead()throws IOException{return new FileInputStream(file);}
 public FileOutputStream startWrite(){throw new AssertionError("media write forbidden");}public void finishWrite(FileOutputStream stream){}public void failWrite(FileOutputStream stream){}}
"""
_before='static int saves;static boolean failSnapshot;'
assert BOUNDARIES.count(_before)==1
BOUNDARIES=BOUNDARIES.replace(_before,'static final String HIDE_TARGETS=ConfigSchema.HIDE_TARGETS;'+_before,1)
_before='RootHideManager(Context c){}'
assert BOUNDARIES.count(_before)==1
BOUNDARIES=BOUNDARIES.replace(_before,_before+'OperationResult refreshTargets(){throw new AssertionError("confirmed target refresh forbidden in action/cancel suite");}',1)
BOUNDARIES+=r"""
final class HideTargetStore{
 enum ReadStatus{OK,UNAVAILABLE}static class Record{boolean managed,bound;int userId;long userSerial;String packageName;}
 static class Snapshot{java.util.List<Record>records;}static class ReadResult{ReadStatus status;Snapshot snapshot;}
 ReadResult read(){throw new AssertionError("confirmed target readback forbidden in action/cancel suite");}
}
"""

if __name__ == "__main__":
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    raise SystemExit(main())
