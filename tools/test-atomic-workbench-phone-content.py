"""Execute the production phone source against controlled Android provider boundaries.

No device, filenames, URIs, or content from the user's phone are collected. SDK36
signature compilation is performed separately by test-atomic-workbench-content.py.
"""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
JAVAC = str(JDK / "javac.exe") if (JDK / "javac.exe").exists() else "javac"
JAVA = str(JDK / "java.exe") if (JDK / "java.exe").exists() else "java"
ENV = dict(os.environ)
if JDK.exists():
    ENV["PATH"] = str(JDK) + os.pathsep + ENV.get("PATH", "")
SLOW = "--slow" in sys.argv

STUBS = {
"android/Manifest.java": '''package android;public class Manifest {public static class permission {
 public static final String READ_MEDIA_IMAGES="images",READ_MEDIA_VIDEO="videos",READ_MEDIA_AUDIO="audio",READ_MEDIA_VISUAL_USER_SELECTED="selected";}}''',
"android/net/Uri.java": '''package android.net;public final class Uri {
 private final String value;private Uri(String v){value=v;}public static Uri parse(String v){return new Uri(v);}public String toString(){return value;}
 public boolean equals(Object o){return o instanceof Uri&&value.equals(((Uri)o).value);}public int hashCode(){return value.hashCode();}}''',
"android/os/Looper.java": "package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}",
"android/os/Handler.java": '''package android.os;import java.util.*;public class Handler {
 private static final List<Task> tasks=new ArrayList<>();static class Task {Runnable r;long d;Task(Runnable r,long d){this.r=r;this.d=d;}}
 public Handler(Looper l){}public boolean postDelayed(Runnable r,long d){synchronized(tasks){tasks.add(new Task(r,d));}return true;}
 public void removeCallbacks(Runnable r){synchronized(tasks){tasks.removeIf(t->t.r==r);}}
 public static int pending(long d){synchronized(tasks){return (int)tasks.stream().filter(t->t.d==d).count();}}
 public static void fire(long d){List<Task> copy=new ArrayList<>();synchronized(tasks){for(Task t:tasks)if(t.d==d)copy.add(t);tasks.removeAll(copy);}for(Task t:copy)t.r.run();}}
''',
"android/os/Bundle.java": '''package android.os;import java.util.*;public class Bundle {
 private final Map<String,Object> values=new HashMap<>();public void putString(String k,String v){values.put(k,v);}public String getString(String k){return (String)values.get(k);}
 public void putStringArray(String k,String[] v){values.put(k,v);}public String[] getStringArray(String k){return (String[])values.get(k);}
 public void putInt(String k,int v){values.put(k,v);}public int getInt(String k){return (Integer)values.getOrDefault(k,0);}
 public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}}
''',
"android/os/OperationCanceledException.java": "package android.os;public class OperationCanceledException extends RuntimeException {}",
"android/os/CancellationSignal.java": '''package android.os;public class CancellationSignal {
 public interface OnCancelListener {void onCancel();}private volatile boolean cancelled;private OnCancelListener listener;
 public boolean isCanceled(){return cancelled;}public void throwIfCanceled(){if(cancelled)throw new OperationCanceledException();}
 public void cancel(){OnCancelListener copy;synchronized(this){if(cancelled)return;cancelled=true;copy=listener;}if(copy!=null)copy.onCancel();}
 public void setOnCancelListener(OnCancelListener l){boolean call;synchronized(this){listener=l;call=cancelled&&l!=null;}if(call)l.onCancel();}}
''',
"android/os/Environment.java": "package android.os;public class Environment {public static boolean manager;public static boolean isExternalStorageManager(){return manager;}}",
"android/os/UserManager.java": "package android.os;public class UserManager {public boolean unlocked=true;public boolean isUserUnlocked(){return unlocked;}}",
"android/content/pm/PackageManager.java": "package android.content.pm;public class PackageManager {public static final int PERMISSION_GRANTED=0;}",
"android/content/BroadcastReceiver.java": "package android.content;public abstract class BroadcastReceiver {public abstract void onReceive(Context c,Intent i);}",
"android/content/Intent.java": '''package android.content;public class Intent {
 public static final String ACTION_USER_UNLOCKED="unlocked",ACTION_MEDIA_MOUNTED="mounted",ACTION_MEDIA_UNMOUNTED="unmounted",ACTION_MEDIA_EJECT="eject",ACTION_MEDIA_REMOVED="removed",ACTION_MEDIA_BAD_REMOVAL="bad_removal";}
''',
"android/content/IntentFilter.java": "package android.content;public class IntentFilter {public IntentFilter(){}public IntentFilter(String s){}public void addAction(String s){}public void addDataScheme(String s){}}",
"android/content/UriPermission.java": '''package android.content;import android.net.Uri;public class UriPermission {
 private final Uri uri;private final boolean read;public UriPermission(Uri u,boolean r){uri=u;read=r;}public Uri getUri(){return uri;}public boolean isReadPermission(){return read;}}
''',
"android/content/Context.java": '''package android.content;import android.os.*;import java.util.*;public class Context {
 public static final int RECEIVER_NOT_EXPORTED=4;public final UserManager users=new UserManager();public final Set<String> permissions=new HashSet<>();
 public Set<String> volumes=new LinkedHashSet<>(List.of("external_primary"));public ContentResolver resolver;public int receivers,receiverRegistrations;
 public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}public int checkSelfPermission(String p){return permissions.contains(p)?0:-1;}
 public <T>T getSystemService(Class<T> type){return type.cast(users);}public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,int flags){if(flags!=4)throw new AssertionError("exported receiver");receivers=1;receiverRegistrations++;return null;}
 public void unregisterReceiver(BroadcastReceiver r){receivers=0;}}
''',
"android/content/ContentUris.java": "package android.content;import android.net.Uri;public class ContentUris {public static Uri withAppendedId(Uri base,long id){return Uri.parse(base.toString()+\"/\"+id);}}",
"android/database/ContentObserver.java": "package android.database;import android.os.Handler;import android.net.Uri;public class ContentObserver {public ContentObserver(Handler h){}public void onChange(boolean self){}public void onChange(boolean self,Uri uri){onChange(self);}}",
"android/database/Cursor.java": '''package android.database;import android.os.Bundle;public interface Cursor extends AutoCloseable {
 boolean moveToNext();boolean moveToFirst();int getColumnIndex(String name);boolean isNull(int column);String getString(int column);long getLong(int column);Bundle getExtras();void close();}
''',
"android/content/res/AssetFileDescriptor.java": '''package android.content.res;import java.io.*;public class AssetFileDescriptor implements AutoCloseable {
 private final InputStream stream;public boolean closed;public AssetFileDescriptor(InputStream in){stream=in;}public InputStream createInputStream()throws IOException{return stream;}
 public void close()throws IOException{closed=true;stream.close();}}
''',
"android/content/ContentResolver.java": '''package android.content;import android.net.Uri;import android.os.*;import android.database.*;import android.content.res.*;import java.util.*;import java.io.*;
public abstract class ContentResolver {
 public static final String QUERY_ARG_SQL_SELECTION="selection",QUERY_ARG_SQL_SELECTION_ARGS="selection_args",QUERY_ARG_SORT_COLUMNS="sort_columns",QUERY_ARG_SORT_DIRECTION="sort_direction",QUERY_ARG_LIMIT="limit";
 public static final int QUERY_SORT_DIRECTION_DESCENDING=1;public final Set<ContentObserver> observers=new HashSet<>();public int registrations,unregistrations;
 public abstract Cursor query(Uri uri,String[] projection,Bundle args,CancellationSignal signal);
 public abstract Cursor query(Uri uri,String[] projection,String selection,String[] args,String order,CancellationSignal signal);
 public abstract AssetFileDescriptor openAssetFileDescriptor(Uri uri,String mode,CancellationSignal signal)throws IOException;
 public abstract String getType(Uri uri);public abstract List<UriPermission> getPersistedUriPermissions();
 public void registerContentObserver(Uri uri,boolean descendants,ContentObserver observer){if(!descendants)throw new AssertionError("missing descendant changes");observers.add(observer);registrations++;}
 public void unregisterContentObserver(ContentObserver observer){observers.remove(observer);unregistrations++;}
 public void change(){for(ContentObserver o:List.copyOf(observers))o.onChange(false);}}
''',
"android/provider/OpenableColumns.java": "package android.provider;public interface OpenableColumns {String DISPLAY_NAME=\"_display_name\",SIZE=\"_size\";}",
"android/provider/MediaStore.java": '''package android.provider;import android.content.Context;import android.net.Uri;import java.util.*;public class MediaStore {
 public static Set<String> getExternalVolumeNames(Context c){return c.volumes;}public static class Files {public static Uri getContentUri(String volume){return Uri.parse("content://media/"+volume+"/file");}}
 public interface MediaColumns {String _ID="_id",DISPLAY_NAME="_display_name",MIME_TYPE="mime_type",DATE_MODIFIED="date_modified",DATE_ADDED="date_added",SIZE="_size",DURATION="duration",IS_PENDING="is_pending",IS_TRASHED="is_trashed";}}
''',
"android/provider/DocumentsContract.java": '''package android.provider;import android.net.Uri;import android.content.Context;import java.net.*;import java.nio.charset.StandardCharsets;
public class DocumentsContract {
 public static final String EXTRA_LOADING="loading";public static class Document {
 public static final String COLUMN_DOCUMENT_ID="document_id",COLUMN_MIME_TYPE="mime_type",COLUMN_DISPLAY_NAME="_display_name",COLUMN_LAST_MODIFIED="last_modified",COLUMN_SIZE="_size",COLUMN_FLAGS="flags",MIME_TYPE_DIR="vnd.android.document/directory";public static final int FLAG_VIRTUAL_DOCUMENT=512;}
 public static boolean isTreeUri(Uri uri){return uri.toString().contains("/tree/");}public static boolean isDocumentUri(Context c,Uri uri){return uri.toString().contains("/document/");}
 public static String getTreeDocumentId(Uri uri){String s=uri.toString().split("/tree/",2)[1].split("/",2)[0];return URLDecoder.decode(s,StandardCharsets.UTF_8);}
 private static String root(Uri uri){return uri.toString().split("/document/",2)[0];}
 public static Uri buildChildDocumentsUriUsingTree(Uri uri,String id){return Uri.parse(root(uri)+"/document/"+URLEncoder.encode(id,StandardCharsets.UTF_8)+"/children");}
 public static Uri buildDocumentUriUsingTree(Uri uri,String id){return Uri.parse(root(uri)+"/document/"+URLEncoder.encode(id,StandardCharsets.UTF_8));}}
''',
}

TEST = r'''package ls.augment.com;
import android.Manifest;import android.content.*;import android.content.res.*;import android.database.*;import android.net.*;import android.os.*;import android.provider.*;
import java.io.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public class TestAtomicWorkbenchPhoneContent {
 static int cases,checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 interface Checked {void run()throws Exception;}static void test(Checked body)throws Exception{Environment.manager=false;Handler.fire(250);Handler.fire(30000);body.run();cases++;}
 static void await(java.util.function.BooleanSupplier condition)throws Exception{long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(2);while(!condition.getAsBoolean()&&System.nanoTime()<end)Thread.sleep(2);check(condition.getAsBoolean(),"controlled asynchronous operation did not complete");}
 static final AtomicWorkbenchContentItem.Kind MEDIA=AtomicWorkbenchContentItem.Kind.MEDIA,FILES=AtomicWorkbenchContentItem.Kind.FILES;
 static final AtomicWorkbenchContentSource.State READY=AtomicWorkbenchContentSource.State.READY,PARTIAL=AtomicWorkbenchContentSource.State.PARTIAL;
 static final AtomicWorkbenchContentPermissionState.Scope FULL=AtomicWorkbenchContentPermissionState.Scope.FULL,SELECTED=AtomicWorkbenchContentPermissionState.Scope.SELECTED,DENIED=AtomicWorkbenchContentPermissionState.Scope.DENIED;
 static Map<String,Object> row(long id,String mime,long seconds){Map<String,Object> r=new HashMap<>();r.put("_id",id);r.put("mime_type",mime);r.put("date_modified",seconds);r.put("date_added",seconds);r.put("_display_name","private-synthetic-name");r.put("_size",7L);r.put("duration",123L);return r;}
 static Map<String,Object> doc(String id,String mime,long modified){Map<String,Object> r=row(0,mime,0);r.put("document_id",id);r.put("last_modified",modified);r.put("flags",0L);return r;}
 static class Rows implements Cursor {
  final List<Map<String,Object>> rows;final String[] projection;int at=-1;final Bundle extras=new Bundle();boolean closed;
  Rows(List<Map<String,Object>> rows,String[] projection){this.rows=rows;this.projection=projection;}
  public boolean moveToNext(){return ++at<rows.size();}public boolean moveToFirst(){at=0;return !rows.isEmpty();}
  public int getColumnIndex(String name){for(int i=0;i<projection.length;i++)if(projection[i].equals(name))return i;return -1;}
  Object value(int col){return rows.get(at).get(projection[col]);}public boolean isNull(int col){return value(col)==null;}
  public String getString(int col){return (String)value(col);}public long getLong(int col){return ((Number)value(col)).longValue();}public Bundle getExtras(){return extras;}public void close(){closed=true;}
 }
 static class Provider extends ContentResolver {
  final Context context;final Map<String,List<Map<String,Object>>> media=new HashMap<>(),children=new HashMap<>();final Map<String,Map<String,Object>> documents=new HashMap<>();
  final List<UriPermission> grants=new CopyOnWriteArrayList<>();final List<Rows> cursors=new ArrayList<>();final List<AssetFileDescriptor> descriptors=new ArrayList<>();
  final Set<String> denyRead=new HashSet<>();volatile int queries,opens,bytes;boolean nullQuery,failQuery,denyQuery,ignoreLimit;volatile CancellationSignal latestSignal;
  Runnable firstRead;volatile CountDownLatch entered,release,cancelEntered,cancelRelease;boolean ignoreCancellation;int queryLimit;String[] projection;Bundle queryArgs;
  Provider(Context c){context=c;}
  void signal(CancellationSignal s){check(s!=null,"missing provider cancellation");latestSignal=s;s.throwIfCanceled();}
  void gate(CancellationSignal s){if(entered==null)return;if(cancelEntered!=null)s.setOnCancelListener(()->{cancelEntered.countDown();while(cancelRelease.getCount()>0){try{cancelRelease.await(10,TimeUnit.MILLISECONDS);}catch(InterruptedException ignored){}}});entered.countDown();while(release.getCount()>0){try{release.await(10,TimeUnit.MILLISECONDS);}catch(InterruptedException ignored){}if(!ignoreCancellation)s.throwIfCanceled();}s.throwIfCanceled();}
  Rows result(List<Map<String,Object>> items,String[] columns){Rows r=new Rows(items,columns);cursors.add(r);return r;}
  public Cursor query(Uri uri,String[] columns,Bundle args,CancellationSignal s){signal(s);queries++;gate(s);if(denyQuery)throw new SecurityException();if(failQuery)throw new IllegalStateException();if(nullQuery)return null;
   projection=columns;queryArgs=args;queryLimit=args.getInt(QUERY_ARG_LIMIT);String selection=args.getString(QUERY_ARG_SQL_SELECTION);check(selection.contains("is_pending=0")&&selection.contains("is_trashed=0"),"pending/trash included");
   check(args.getInt(QUERY_ARG_SORT_DIRECTION)==1&&Arrays.equals(args.getStringArray(QUERY_ARG_SORT_COLUMNS),new String[]{"date_modified","date_added","_id"}),"recent sort not sent to provider");
   check(Arrays.asList(columns).containsAll(List.of("_id","_display_name","mime_type","date_modified","date_added","_size","duration")),"media projection incomplete");
   String[] allowed=args.getStringArray(QUERY_ARG_SQL_SELECTION_ARGS);List<Map<String,Object>> selected=new ArrayList<>();for(Map<String,Object> r:media.getOrDefault(uri.toString(),List.of())){
    String type=(String)r.get("mime_type");if(Boolean.TRUE.equals(r.get("pending"))||Boolean.TRUE.equals(r.get("trashed")))continue;
    for(String prefix:allowed)if(type.startsWith(prefix.substring(0,prefix.length()-1))){selected.add(r);break;}}
   selected.sort((a,b)->Long.compare(((Number)b.get("date_modified")).longValue(),((Number)a.get("date_modified")).longValue()));
   if(!ignoreLimit&&selected.size()>queryLimit)selected=new ArrayList<>(selected.subList(0,queryLimit));return result(selected,columns);
  }
  public Cursor query(Uri uri,String[] columns,String selection,String[] args,String order,CancellationSignal s){signal(s);queries++;gate(s);if(denyQuery)throw new SecurityException();if(failQuery)throw new IllegalStateException();if(nullQuery)return null;
   String key=uri.toString();if(key.endsWith("/children"))return result(children.getOrDefault(key,List.of()),columns);
   Map<String,Object> row=documents.get(key);return result(row==null?List.of():List.of(row),columns);
  }
  public AssetFileDescriptor openAssetFileDescriptor(Uri uri,String mode,CancellationSignal s)throws IOException{signal(s);opens++;check(mode.equals("r"),"source requested write access");
   if(denyRead.contains(uri.toString()))throw new SecurityException();if(firstRead!=null){Runnable action=firstRead;firstRead=null;action.run();}
   AssetFileDescriptor d=new AssetFileDescriptor(new InputStream(){boolean closed;public int read()throws IOException{if(closed)throw new IOException();bytes++;return -1;}public void close(){closed=true;}});descriptors.add(d);return d;
  }
  public String getType(Uri uri){Map<String,Object> r=documents.get(uri.toString());return r==null?null:(String)r.get("mime_type");}
  public List<UriPermission> getPersistedUriPermissions(){return List.copyOf(grants);}
 }
 static class F implements AutoCloseable {
  final Context context=new Context();final Provider provider=new Provider(context);final AtomicWorkbenchPhoneContentSource source;
  F(){context.resolver=provider;source=new AtomicWorkbenchPhoneContentSource(context);}void visual(){context.permissions.addAll(List.of("images","videos"));}
  void media(String volume,Map<String,Object>... rows){context.volumes.add(volume);provider.media.put("content://media/"+volume+"/file",List.of(rows));}
  void grant(String uri,Map<String,Object> row){Uri u=Uri.parse(uri);provider.grants.add(new UriPermission(u,true));provider.documents.put(uri,row);}
  AtomicWorkbenchContentSource.Result scan(AtomicWorkbenchContentItem.Kind kind){return source.scan(kind);}
  public void close(){source.close();for(Rows r:provider.cursors)check(r.closed,"cursor leaked");for(AssetFileDescriptor d:provider.descriptors)check(d.closed,"descriptor leaked");check(Handler.pending(30000)==0,"scan timer leaked");}
 }
 public static void main(String[] args)throws Exception {
  test(()->{try(F f=new F()){for(var kind:List.of(MEDIA,FILES)){var r=f.scan(kind);check(r.state==AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED&&r.permission.scope==DENIED&&!r.replaceSnapshot(),"no permissions and no owned rows must request permission, not report unavailable");}f.provider.denyQuery=true;var denied=f.scan(MEDIA);check(denied.state==AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED&&denied.permission.scope==DENIED,"actual provider denial must retain permission-required state");}});
  test(()->{try(F f=new F()){f.media("external_primary",row(1,"image/png",10),row(2,"text/plain",20));for(var kind:List.of(MEDIA,FILES)){var r=f.scan(kind);check(r.state==READY&&r.permission.scope==AtomicWorkbenchContentPermissionState.Scope.LIMITED&&r.items.size()==1,"readable app-owned MediaStore rows require no broad grant and must not overclaim full access");}check(f.context.permissions.isEmpty()&&!Environment.manager,"owned-row fixture silently granted broad permission");}});
  test(()->{try(F f=new F()){f.visual();f.context.volumes.add("card");f.media("external_primary",row(1,"image/png",10),row(2,"video/mp4",30));f.media("card",row(3,"image/jpeg",20));Map<String,Object> hidden=row(4,"image/png",50);hidden.put("pending",true);f.provider.media.get("content://media/card/file");f.media("card",row(3,"image/jpeg",20),hidden);
   var r=f.scan(MEDIA);check(r.state==READY&&r.permission.scope==FULL&&r.items.size()==3,"full media multi-volume scan");check(r.items.get(0).uri.equals("content://media/external_primary/file/2")&&r.items.get(1).uri.equals("content://media/card/file/3"),"global recent order or content URI wrong");check(r.items.get(0).modifiedMillis==30000&&r.items.get(0).durationMillis==123,"seconds/duration conversion");check(f.provider.bytes==3&&f.provider.opens==3,"query visibility accepted without actual byte read");check(f.provider.queryLimit==1200,"media candidate bound wrong");}});
  test(()->{try(F f=new F()){Environment.manager=true;f.media("external_primary",row(1,"video/mp4",1),row(2,"audio/aac",2),row(3,"text/plain",3),row(4,"application/pdf",4),row(5,"image/png",5));var r=f.scan(FILES);check(r.state==READY&&r.permission.scope==FULL&&r.items.size()==4,"file MIME coverage");check(r.items.stream().noneMatch(i->i.image()),"image leaked into non-image file tab");check(f.provider.queryLimit==2000,"file candidate bound wrong");}});
  test(()->{try(F f=new F()){f.visual();check(f.scan(MEDIA).state==READY&&f.scan(MEDIA).items.isEmpty(),"genuine empty authorized library failed");f.provider.nullQuery=true;check(f.scan(MEDIA).state==AtomicWorkbenchContentSource.State.ERROR,"null cursor became successful empty");f.provider.nullQuery=false;f.provider.failQuery=true;check(f.scan(MEDIA).state==AtomicWorkbenchContentSource.State.ERROR,"provider failure became successful empty");}});
  test(()->{try(F f=new F()){f.visual();f.media("external_primary",row(1,"image/png",1));f.provider.denyRead.add("content://media/external_primary/file/1");var r=f.scan(MEDIA);check(r.state==AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED&&r.permission.scope==DENIED&&!r.replaceSnapshot(),"unreadable query row became ready/empty or full authorization");}});
  test(()->{try(F f=new F()){f.visual();f.media("external_primary",row(1,"image/png",1),row(2,"image/png",2));f.provider.denyRead.add("content://media/external_primary/file/1");var r=f.scan(MEDIA);check(r.state==PARTIAL&&r.items.size()==1&&r.items.get(0).uri.endsWith("/2"),"partial read failure discarded readable row or included denied row");}});
  test(()->{try(F f=new F()){f.context.users.unlocked=false;var r=f.scan(MEDIA);check(r.state==AtomicWorkbenchContentSource.State.LOCKED&&r.items.isEmpty()&&f.provider.queries==0,"locked phone queried content");check(f.scan(AtomicWorkbenchContentItem.Kind.CLIPBOARD).state==AtomicWorkbenchContentSource.State.UNAVAILABLE,"clipboard crossed phone source boundary");}});
  test(()->{try(F f=new F()){f.grant("content://docs/document/report",doc("report","application/pdf",99));var media=f.scan(MEDIA);check(media.permission.scope==DENIED&&media.items.isEmpty(),"PDF-only grant authorized media");var files=f.scan(FILES);check(files.state==READY&&files.permission.scope==SELECTED&&files.permission.documentGrants==1&&files.items.size()==1&&files.items.get(0).source==AtomicWorkbenchContentItem.Source.DOCUMENTS,"granted document absent or inaccurate scope");}});
  test(()->{try(F f=new F()){f.grant("content://picker/picked/1",doc("picked","image/png",0));check(f.scan(FILES).permission.scope==DENIED,"image-only grant authorized file tab");var r=f.scan(MEDIA);check(r.permission.scope==SELECTED&&r.items.size()==1,"persisted non-DocumentsContract visual URI unsupported");}});
  test(()->{try(F f=new F()){String tree="content://docs/tree/root";f.provider.grants.add(new UriPermission(Uri.parse(tree),true));f.provider.children.put(tree+"/document/root/children",List.of(doc("folder",DocumentsContract.Document.MIME_TYPE_DIR,0),doc("photo","image/png",20)));f.provider.children.put(tree+"/document/folder/children",List.of(doc("video","video/mp4",30),doc("pdf","application/pdf",40)));var m=f.scan(MEDIA);check(m.state==READY&&m.items.size()==2&&m.items.get(0).video()&&m.permission.documentGrants==1,"SAF tree media recursion/recent order");var files=f.scan(FILES);check(files.state==READY&&files.items.size()==2&&files.items.get(0).mime.equals("application/pdf"),"SAF tree file MIME recursion");}});
  test(()->{try(F f=new F()){String uri="content://docs/document/selected";f.grant(uri,doc("selected","video/mp4",1));f.provider.firstRead=()->{f.provider.grants.clear();f.provider.documents.clear();};var r=f.scan(MEDIA);check(r.items.isEmpty()&&r.permission.scope==DENIED&&r.state==AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED,"revoked grant published earlier readable rows");}});
  test(()->{try(F f=new F()){String uri="content://docs/document/selected";f.grant(uri,doc("selected","video/mp4",1));f.provider.denyRead.add(uri);var r=f.scan(MEDIA);check(r.permission.scope==DENIED&&r.state==AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED&&r.items.isEmpty(),"persisted metadata mistaken for actual read access");}});
  test(()->{try(F f=new F()){AtomicInteger changes=new AtomicInteger();f.source.start(changes::incrementAndGet);f.provider.change();f.provider.change();check(Handler.pending(250)==1,"change bursts not merged");Handler.fire(250);check(changes.get()==1,"merged callback missing");f.provider.change();f.source.stop();check(f.provider.observers.isEmpty()&&f.context.receivers==0&&Handler.pending(250)==0,"stop leaked callbacks/receivers");f.source.start(changes::incrementAndGet);f.provider.change();Handler.fire(250);check(changes.get()==2,"stop/start did not reattach");f.source.close();f.source.start(changes::incrementAndGet);check(f.provider.observers.isEmpty()&&f.scan(MEDIA).state==AtomicWorkbenchContentSource.State.UNAVAILABLE,"closed source revived");}});
  test(()->{try(F f=new F()){f.visual();List<Map<String,Object>> rows=new ArrayList<>();for(int i=1;i<=650;i++)rows.add(row(i,"image/png",i));f.provider.media.put("content://media/external_primary/file",rows);var r=f.scan(MEDIA);check(r.items.size()==600&&r.items.get(0).modifiedMillis==650000&&r.items.get(599).modifiedMillis==51000,"media retention/recent limit");}});
  test(()->{try(F f=new F()){Environment.manager=true;List<Map<String,Object>> rows=new ArrayList<>();for(int i=1;i<=1100;i++)rows.add(row(i,"application/pdf",i));f.provider.media.put("content://media/external_primary/file",rows);var r=f.scan(FILES);check(r.items.size()==1000&&r.items.get(0).modifiedMillis==1100000&&r.items.get(999).modifiedMillis==101000,"file retention/recent limit");}});
  test(()->{try(F f=new F()){String tree="content://docs/tree/root";f.provider.grants.add(new UriPermission(Uri.parse(tree),true));String id="root";for(int depth=0;depth<10;depth++){String next="dir"+depth;f.provider.children.put(tree+"/document/"+id+"/children",List.of(doc(next,DocumentsContract.Document.MIME_TYPE_DIR,0)));id=next;}var r=f.scan(FILES);check(r.state==PARTIAL&&f.provider.queries<=10,"deep SAF traversal unbounded or reported complete");}});
  test(()->{try(F f=new F()){f.visual();f.provider.entered=new CountDownLatch(1);f.provider.release=new CountDownLatch(1);ExecutorService caller=Executors.newSingleThreadExecutor();try{Future<AtomicWorkbenchContentSource.Result> pending=caller.submit(()->f.scan(MEDIA));check(f.provider.entered.await(2,TimeUnit.SECONDS),"controlled provider did not start");await(()->Handler.pending(30000)>0);Handler.fire(30000);var r=pending.get(2,TimeUnit.SECONDS);check(r.state==AtomicWorkbenchContentSource.State.UNAVAILABLE&&!r.replaceSnapshot(),"scan timeout published a result");await(()->f.provider.latestSignal.isCanceled());}finally{f.provider.release.countDown();caller.shutdownNow();}}});
  test(()->{try(F f=new F()){f.visual();f.provider.entered=new CountDownLatch(1);f.provider.release=new CountDownLatch(1);f.provider.ignoreCancellation=true;ExecutorService caller=Executors.newSingleThreadExecutor();try{Future<AtomicWorkbenchContentSource.Result> pending=caller.submit(()->f.scan(MEDIA));check(f.provider.entered.await(2,TimeUnit.SECONDS),"controlled stuck provider did not start");long started=System.nanoTime();f.source.close();var r=pending.get(2,TimeUnit.SECONDS);check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-started)<1500&&r.state==AtomicWorkbenchContentSource.State.UNAVAILABLE,"close blocked behind provider or left caller waiting");await(()->f.provider.latestSignal.isCanceled());}finally{f.provider.release.countDown();caller.shutdownNow();}}});
  test(()->{try(F f=new F()){f.visual();f.provider.entered=new CountDownLatch(1);f.provider.release=new CountDownLatch(1);f.provider.cancelEntered=new CountDownLatch(1);f.provider.cancelRelease=new CountDownLatch(1);f.provider.ignoreCancellation=true;ExecutorService caller=Executors.newSingleThreadExecutor();try{Future<AtomicWorkbenchContentSource.Result> pending=caller.submit(()->f.scan(MEDIA));check(f.provider.entered.await(2,TimeUnit.SECONDS),"blocked-cancel provider did not start");await(()->Handler.pending(30000)>0);long started=System.nanoTime();Handler.fire(30000);check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-started)<500,"main Handler executed blocking provider cancellation");check(f.provider.cancelEntered.await(2,TimeUnit.SECONDS),"blocked cancel listener did not run");check(pending.get(2,TimeUnit.SECONDS).state==AtomicWorkbenchContentSource.State.UNAVAILABLE,"blocked cancel held repository caller");started=System.nanoTime();f.source.close();check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-started)<500,"close waited for blocked provider cancellation");}finally{f.provider.release.countDown();f.provider.cancelRelease.countDown();caller.shutdownNow();}}});
  test(()->{try(F f=new F()){f.visual();f.media("external_primary",row(1,"image/png",1));var r=f.scan(MEDIA);String diagnostic=f.source+" "+r+" "+r.permission+" "+r.items.get(0);check(!diagnostic.contains("content://")&&!diagnostic.contains("private-synthetic-name")&&!diagnostic.contains("image/png"),"toString leaked private metadata");}});
  if(Arrays.asList(args).contains("--real-timeout"))test(()->{try(F f=new F()){f.visual();f.provider.entered=new CountDownLatch(1);f.provider.release=new CountDownLatch(1);f.provider.ignoreCancellation=true;try{long started=System.nanoTime();var r=f.scan(MEDIA);long elapsed=TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-started);check(elapsed>=29000&&elapsed<34000,"repository wait did not honor real 30-second deadline");check(r.state==AtomicWorkbenchContentSource.State.UNAVAILABLE&&!r.replaceSnapshot(),"noncooperative provider published timed-out rows");await(()->f.provider.latestSignal.isCanceled());}finally{f.provider.release.countDown();}}});
  System.out.println("PHONE CONTENT RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''


def execute(folder, mutation=None):
    sources = []
    for name, content in STUBS.items():
        path = folder / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        sources.append(str(path))
    for name in ("AtomicWorkbenchContentItem.java", "AtomicWorkbenchContentPolicy.java",
                 "AtomicWorkbenchContentPermissionState.java", "AtomicWorkbenchContentAccess.java",
                 "AtomicWorkbenchContentSource.java", "AtomicWorkbenchPhoneContentSource.java"):
        content = (SRC / name).read_text(encoding="utf-8")
        if mutation and name == "AtomicWorkbenchPhoneContentSource.java":
            old, new = mutation
            assert content.count(old) == 1, "negative-control target changed"
            content = content.replace(old, new)
        path = folder / name
        path.write_text(content, encoding="utf-8")
        sources.append(str(path))
    test = folder / "TestAtomicWorkbenchPhoneContent.java"
    test.write_text(TEST, encoding="utf-8")
    sources.append(str(test))
    subprocess.run([JAVAC, "--release", "17", "-encoding", "UTF-8", "-d", str(folder / "classes"), *sources],
                   check=True, env=ENV, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return subprocess.run([JAVA, "-Dfile.encoding=UTF-8", "-cp", str(folder / "classes"),
                           "ls.augment.com.TestAtomicWorkbenchPhoneContent", *( ["--real-timeout"] if SLOW else [])],
                          capture_output=True, text=True, encoding="utf-8", errors="replace", env=ENV, timeout=60)


def main():
    with tempfile.TemporaryDirectory(prefix="duo-phone-content-") as temp:
        production = execute(Path(temp))
        print(production.stdout, end="")
        if production.returncode:
            raise SystemExit(production.stderr)
    controls = {
        "read-authorization-bypassed": (
            "if (!readable(uri, scan)) continue;\n                    long modified",
            "if (false) continue;\n                    long modified"),
        "revoked-access-snapshot-check-disabled": ("if (!before.sameAccess(after))", "if (false)"),
    }
    for name, mutation in controls.items():
        with tempfile.TemporaryDirectory(prefix="duo-phone-content-negative-") as temp:
            negative = execute(Path(temp), mutation)
            if negative.returncode == 0:
                raise AssertionError("negative control did not fail: " + name)
            print("EXPECTED FAILURE " + name)
            print(negative.stderr.splitlines()[0])


if __name__ == "__main__":
    try:
        main()
    except subprocess.CalledProcessError as error:
        print(error.stderr.decode("utf-8", errors="replace") if isinstance(error.stderr, bytes) else error.stderr,
              file=sys.stderr)
        raise
