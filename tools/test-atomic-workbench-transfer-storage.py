"""Real TransferStore/Provider/AtomicFile adapter and bounded stage with synthetic sources.

Framework IO edges are controlled; actual production Java performs copying, manifest writes,
read-back verification, rollback, cancellation, and per-URI cache resolution. No phone/ADB.
"""
from pathlib import Path
import os
import subprocess
import tempfile
import sys

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
JAVAC, JAVA = str(JDK / "javac.exe"), str(JDK / "java.exe")
ENV = dict(os.environ, PATH=str(JDK) + os.pathsep + os.environ.get("PATH", ""))
JSON = next((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").rglob("json-*.jar"))
if hasattr(sys.stdout, "reconfigure"): sys.stdout.reconfigure(encoding="utf-8")
STUBS = {
"android/os/Bundle.java": "package android.os;public class Bundle {}",
"ls/augment/com/NativeIslandRecoveryStore.java": 'package ls.augment.com;final class NativeIslandRecoveryStore {static final String PREFS="native-island-record-recovery-v1";static boolean clearForReset(android.content.Context c){return true;}}',
"android/net/Uri.java": r'''package android.net;import java.net.*;import java.util.*;
public final class Uri {final String value;private Uri(String s){value=s;}public static Uri parse(String s){return new Uri(s);}
 URI parsed(){return URI.create(value);}public String getScheme(){return parsed().getScheme();}public String getAuthority(){return parsed().getAuthority();}
 public String getQuery(){return parsed().getQuery();}public String getFragment(){return parsed().getFragment();}
 public List<String>getPathSegments(){var out=new ArrayList<String>();String p=parsed().getRawPath();if(p!=null)for(String v:p.split("/"))if(!v.isEmpty())out.add(URLDecoder.decode(v,java.nio.charset.StandardCharsets.UTF_8));return out;}
 public String getLastPathSegment(){var s=getPathSegments();return s.isEmpty()?null:s.get(s.size()-1);}public String toString(){return value;}
 public boolean equals(Object o){return o instanceof Uri&&value.equals(((Uri)o).value);}public int hashCode(){return value.hashCode();}
 public static class Builder {String scheme,authority;List<String>path=new ArrayList<>();public Builder scheme(String s){scheme=s;return this;}public Builder authority(String s){authority=s;return this;}
 public Builder appendPath(String s){path.add(URLEncoder.encode(s,java.nio.charset.StandardCharsets.UTF_8).replace("+","%20"));return this;}public Uri build(){return parse(scheme+"://"+authority+"/"+String.join("/",path));}}}
''',
"android/content/ClipData.java": r'''package android.content;import android.net.Uri;import java.util.*;public class ClipData {
 final List<Item>items=new ArrayList<>();public ClipData(String l,String[]m,Item i){items.add(i);}public void addItem(Item i){items.add(i);}public int getItemCount(){return items.size();}public Item getItemAt(int n){return items.get(n);}
 public static class Item {final Uri uri;final CharSequence text;public Item(Uri u){uri=u;text=null;}public Item(CharSequence s){text=s;uri=null;}public Item(CharSequence s,Object h,Intent i,Uri u){text=s;uri=u;}
 public Uri getUri(){return uri;}public CharSequence getText(){return text;}}}
''',
"android/content/Intent.java": r'''package android.content;import android.net.Uri;import java.util.*;public class Intent {
 public static final String ACTION_SEND="send",ACTION_SEND_MULTIPLE="multi",EXTRA_TEXT="text",EXTRA_STREAM="stream";public static final int FLAG_GRANT_READ_URI_PERMISSION=1,FLAG_GRANT_WRITE_URI_PERMISSION=2;
 String action;Uri data;ClipData clip;Map<String,Object>extras=new HashMap<>();public Intent(){}public Intent(String a){action=a;}public Intent(Intent o){action=o.action;data=o.data;clip=o.clip;extras.putAll(o.extras);}
 public String getAction(){return action;}public Intent putExtra(String k,Object v){extras.put(k,v);return this;}public CharSequence getCharSequenceExtra(String k){return (CharSequence)extras.get(k);}
 public <T>T getParcelableExtra(String k,Class<T>t){return t.cast(extras.get(k));}@SuppressWarnings("unchecked")public <T>ArrayList<T>getParcelableArrayListExtra(String k,Class<T>t){return (ArrayList<T>)extras.get(k);}
 public Uri getData(){return data;}public Intent setData(Uri u){data=u;return this;}public ClipData getClipData(){return clip;}public void setClipData(ClipData c){clip=c;}}
''',
"android/content/SharedPreferences.java": r'''package android.content;import java.util.*;public class SharedPreferences {
 final Map<String,String> values=new HashMap<>();public boolean fail;public synchronized Map<String,?>getAll(){return new HashMap<>(values);}public synchronized String getString(String k,String d){return values.getOrDefault(k,d);}public Editor edit(){return new Editor();}
 public class Editor {Map<String,String>puts=new HashMap<>();Set<String>removes=new HashSet<>();boolean cleared;public Editor clear(){cleared=true;return this;}public Editor putString(String k,String v){puts.put(k,v);return this;}public Editor remove(String k){removes.add(k);return this;}
 public boolean commit(){synchronized(SharedPreferences.this){if(fail)return false;if(cleared)values.clear();for(String k:removes)values.remove(k);values.putAll(puts);return true;}}}}
''',
"android/content/Context.java": r'''package android.content;import java.io.*;import java.util.*;import android.net.Uri;public class Context {
 public static final int MODE_PRIVATE=0;final File base;public final SharedPreferences prefs=new SharedPreferences();public ContentResolver resolver;public int revocations;
 public Context(File f){base=f;getCacheDir().mkdirs();getFilesDir().mkdirs();}public Context getApplicationContext(){return this;}
 public File getDataDir(){return base;}public File getCodeCacheDir(){return new File(base,"code_cache");}public File[]getExternalFilesDirs(String type){return new File[0];}public File[]getExternalCacheDirs(){return new File[0];}
 public File getCacheDir(){return new File(base,"cache");}public File getFilesDir(){return new File(base,"files");}public String getPackageName(){return "ls.augment.com";}
 public SharedPreferences getSharedPreferences(String n,int m){return prefs;}public ContentResolver getContentResolver(){return resolver;}public void revokeUriPermission(Uri u,int f){revocations++;}}
''',
"android/content/ContentResolver.java": r'''package android.content;import java.io.*;import android.net.Uri;import android.database.Cursor;
public abstract class ContentResolver {public abstract InputStream openInputStream(Uri u)throws IOException;public String getType(Uri u){return "image/png";}public Cursor query(Uri u,String[]p,String s,String[]a,String o){return null;}public java.util.List<UriPermission>getPersistedUriPermissions(){return java.util.List.of();}public void releasePersistableUriPermission(Uri u,int f){}}
''',
"android/content/UriPermission.java": 'package android.content;public class UriPermission {public boolean isReadPermission(){return true;}public boolean isWritePermission(){return false;}public android.net.Uri getUri(){return null;}}',
"android/content/ContentValues.java": "package android.content;public class ContentValues {}",
"android/content/ContentProvider.java": r'''package android.content;import android.database.Cursor;import android.net.Uri;import android.os.ParcelFileDescriptor;import java.io.*;public abstract class ContentProvider {
 public Context context;public Context getContext(){return context;}public abstract boolean onCreate();public abstract String getType(Uri u);public abstract Cursor query(Uri u,String[]p,String s,String[]a,String o);
 public abstract ParcelFileDescriptor openFile(Uri u,String m)throws FileNotFoundException;public abstract Uri insert(Uri u,ContentValues v);public abstract int delete(Uri u,String s,String[]a);public abstract int update(Uri u,ContentValues v,String s,String[]a);}
''',
"android/database/Cursor.java": "package android.database;public interface Cursor extends AutoCloseable {boolean moveToFirst();String getString(int n);void close();}",
"android/database/MatrixCursor.java": "package android.database;public class MatrixCursor implements Cursor {public MatrixCursor(String[]c,int n){}public void addRow(Object[]o){}public boolean moveToFirst(){return false;}public String getString(int n){return null;}public void close(){}}",
"android/provider/OpenableColumns.java": 'package android.provider;public class OpenableColumns {public static final String DISPLAY_NAME="name",SIZE="size";}',
"android/webkit/MimeTypeMap.java": "package android.webkit;public class MimeTypeMap {public static MimeTypeMap getSingleton(){return new MimeTypeMap();}public String getMimeTypeFromExtension(String s){return null;}}",
"android/os/ParcelFileDescriptor.java": r'''package android.os;import java.io.*;public class ParcelFileDescriptor implements AutoCloseable {
 public static final int MODE_READ_ONLY=1;public final File file;private ParcelFileDescriptor(File f){file=f;}public static ParcelFileDescriptor open(File f,int m)throws FileNotFoundException {if(!f.isFile())throw new FileNotFoundException();return new ParcelFileDescriptor(f);}public void close(){}}
''',
"android/util/AtomicFile.java": r'''package android.util;import java.io.*;import java.nio.file.*;public class AtomicFile {
 public static int fail;public static int writes;public static volatile boolean pauseNextRead;public static java.util.concurrent.CountDownLatch readEntered,releaseRead;final File base,next;public AtomicFile(File f){base=f;next=new File(f+".new");}public File getBaseFile(){return base;}
 public FileInputStream openRead()throws IOException{if(pauseNextRead){pauseNextRead=false;readEntered.countDown();try{releaseRead.await();}catch(InterruptedException e){throw new IOException();}}if(fail==6)throw new IOException();return new FileInputStream(base);}public FileOutputStream startWrite()throws IOException{writes++;if(fail==1)throw new IOException();return new FileOutputStream(next);}
 public void finishWrite(FileOutputStream out)throws IOException {out.close();if(fail==2){fail=0;return;}Files.move(next.toPath(),base.toPath(),StandardCopyOption.REPLACE_EXISTING);if(fail==3){fail=4;Files.write(base.toPath(),new byte[]{0});}if(fail==5)fail=6;}
 public void failWrite(FileOutputStream out){try{out.close();}catch(IOException e){}next.delete();}public void delete(){base.delete();next.delete();}}
''',
"ls/augment/com/ResetFixtures.java": r'''package ls.augment.com;
class AtomicWorkbenchReset {static void requireClearSafe(android.content.Context c,android.os.Bundle b){}static void clearFiles(android.content.Context c,android.os.Bundle b)throws java.io.IOException{OwnedFileCleaner.clear(c.getFilesDir());}}class LegacyRootStorageMigration{static void requireResetSafe(android.content.Context c){}}
class AtomicWorkbenchExtractionPresentation{static void clear(){}}
class RuntimeStateStore{static boolean clearForReset(android.content.Context c){return true;}}class CrashFuseStore{static boolean clearForReset(android.content.Context c){return true;}}
class GfrcRecoveryStore{static final String PREFS="recovery";}class LauncherOwnedStateStore{static final String GRID_PREFS="grid";}class AppConfig{static final String PREFS="config";}
class AtomicWorkbenchSettingsActivity{static void onStorageReset(){}}class HidePrivateStorage{static void clearedForReset(){}}
class OwnedFileCleaner{static void clear(java.io.File folder)throws java.io.IOException {if(!folder.exists())return;try(var paths=java.nio.file.Files.walk(folder.toPath())){for(var path:paths.sorted(java.util.Comparator.reverseOrder()).toList())if(!path.equals(folder.toPath()))java.nio.file.Files.deleteIfExists(path);}}}
''',
}
TEST = r'''package ls.augment.com;import android.content.*;import android.net.Uri;import android.util.AtomicFile;import java.io.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;import org.json.*;
public class TestTransferStorage {
 static int cases,checks;interface Case{void run()throws Exception;}static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}static void test(String n,Case r)throws Exception{r.run();cases++;System.out.println("PASS transfer storage: "+n);}
 static final byte[] BYTES=new byte[131073];static {for(int i=0;i<BYTES.length;i++)BYTES[i]=(byte)(i%251);}
 static final class Fixture implements AutoCloseable {final Path dir=Files.createTempDirectory("duo-storage-");final Context c=new Context(dir.toFile());final AtomicWorkbenchTransferProvider provider=new AtomicWorkbenchTransferProvider();
 Fixture()throws IOException{c.resolver=new ContentResolver(){public InputStream openInputStream(Uri u){return new ByteArrayInputStream(BYTES);}};provider.context=c;}
 public void close()throws IOException{try(var paths=Files.walk(dir)){for(Path p:paths.sorted(Comparator.reverseOrder()).toList())Files.deleteIfExists(p);}}}
 static Intent source(String text,int count){Intent i=new Intent(Intent.ACTION_SEND_MULTIPLE).putExtra(Intent.EXTRA_TEXT,text);ClipData clip=null;for(int n=0;n<count;n++){var item=new ClipData.Item(n==0?text:null,null,null,Uri.parse("content://synthetic/"+n));if(clip==null)clip=new ClipData("synthetic",new String[]{"image/png","text/plain"},item);else clip.addItem(item);}i.setClipData(clip);return i;}
 static AtomicWorkbenchPendingPayload publish(Fixture f,AtomicWorkbenchTransferStore.Payload p)throws Exception{var repo=AtomicWorkbenchPendingStorage.repository(f.c);var old=repo.load();var r=repo.put(old.id,old.revision,AtomicWorkbenchTransferStore.batch(f.c,p),AtomicWorkbenchPendingRepository.Mode.REPLACE,AtomicWorkbenchPendingRepository.TextChoice.REPLACE);check(r.success,"publish");AtomicWorkbenchTransferStore.published(p);return r.snapshot;}
 static void expectIO(Case r)throws Exception{try{r.run();throw new AssertionError("expected IO failure");}catch(IOException e){checks++;}}
 static void waitIdle()throws Exception{long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);while(AtomicWorkbenchTransferStage.busy()&&System.nanoTime()<end)Thread.sleep(5);check(!AtomicWorkbenchTransferStage.busy(),"source worker did not finish");}
 public static void main(String[] args)throws Exception{
 test("production copier keeps mixed ClipData text with all 16 URI bytes",()->{try(Fixture f=new Fixture()){
  Intent clipOnly=source(" \n mixed \t",16);clipOnly.putExtra(Intent.EXTRA_TEXT,null);var p=AtomicWorkbenchTransferStore.importIntent(f.c,clipOnly,false);check(p.text.equals(" \n mixed \t")&&p.uris.size()==16,"mixed input lost");
  for(Uri u:p.uris){check(Arrays.equals(BYTES,Files.readAllBytes(f.provider.openFile(u,"r").file.toPath())),"copied bytes changed");}
  check(p.ownedIds.size()==16,"new ownership missing");AtomicWorkbenchTransferStore.discardUnpublished(f.c,p);check(f.c.getCacheDir().listFiles()[0].listFiles().length==0,"unpublished cleanup");
 }});
 test("URI duplicate dedup and malformed limits do not leave partial cache",()->{try(Fixture f=new Fixture()){
  Intent i=source("x",1);i.getClipData().addItem(i.getClipData().getItemAt(0));var p=AtomicWorkbenchTransferStore.importIntent(f.c,i,false);check(p.uris.size()==1,"duplicate copied twice");AtomicWorkbenchTransferStore.discardUnpublished(f.c,p);
  expectIO(()->AtomicWorkbenchTransferStore.importIntent(f.c,source("x",17),false));check(f.c.getCacheDir().listFiles()[0].listFiles().length==0,"oversize partial cache");
 }});
 test("remove/reorder/clear preserve fresh provider bytes and existing grant responsibility",()->{try(Fixture f=new Fixture()){
  var raw=AtomicWorkbenchTransferStore.importIntent(f.c,source("text",2),false);var saved=publish(f,raw);var repo=AtomicWorkbenchPendingStorage.repository(f.c);
  var moved=repo.moveBefore(saved.id,saved.revision,saved.files.get(1).id,saved.files.get(0).id);check(moved.success,"move");var removed=repo.remove(saved.id,moved.snapshot.revision,saved.files.get(0).id);check(removed.success,"remove");check(repo.clear(saved.id,removed.snapshot.revision).success,"clear");
  AtomicWorkbenchTransferStore.discardUnpublished(f.c,raw);
  for(Uri u:raw.uris)check(Arrays.equals(BYTES,Files.readAllBytes(f.provider.openFile(u,"r").file.toPath())),"fresh shared URI deleted");check(f.c.revocations==0,"fresh read grants revoked");
  expectIO(()->f.provider.openFile(raw.uris.get(0),"w"));
 }});
 test("source own-cache reuse does not recopy or renew item TTL",()->{try(Fixture f=new Fixture()){
  var original=AtomicWorkbenchTransferStore.importIntent(f.c,source("",1),false);var originalEntry=AtomicWorkbenchTransferStore.resolve(f.c,original.uris.get(0));
  Intent own=new Intent(Intent.ACTION_SEND).putExtra(Intent.EXTRA_STREAM,original.uris.get(0));var reused=AtomicWorkbenchTransferStore.importIntent(f.c,own,false);
  check(reused.uris.equals(original.uris)&&reused.ownedIds.isEmpty(),"cache copied again");check(AtomicWorkbenchTransferStore.batch(f.c,reused).files.get(0).created==originalEntry.created,"TTL renewed");
  AtomicWorkbenchTransferStore.discardUnpublished(f.c,reused);check(originalEntry.file.isFile(),"reused cache deleted on cancelled append");
 }});
 test("partial cache deletion remains visible and provider rejects only missing item",()->{try(Fixture f=new Fixture()){
  var raw=AtomicWorkbenchTransferStore.importIntent(f.c,source("text",2),false);var old=publish(f,raw);var gone=AtomicWorkbenchTransferStore.resolve(f.c,raw.uris.get(0));check(gone.file.delete(),"fixture deletion");
  var repo=AtomicWorkbenchPendingStorage.repository(f.c);var partial=repo.load();check(partial.files.size()==2&&partial.state==AtomicWorkbenchPendingPayload.State.PARTIAL,"partial cleared list");
  expectIO(()->repo.delivery(old.id,old.revision,null,false));expectIO(()->f.provider.openFile(raw.uris.get(0),"r"));check(f.provider.openFile(raw.uris.get(1),"r").file.isFile(),"good item blocked");
 }});
 test("AtomicFile silent finish failure is caught by readback and old durable revision survives",()->{try(Fixture f=new Fixture()){
  var old=publish(f,AtomicWorkbenchTransferStore.importIntent(f.c,source("old",1),false));var repo=AtomicWorkbenchPendingStorage.repository(f.c);
  AtomicFile.fail=2;var failed=repo.clear(old.id,old.revision);check(!failed.success&&failed.reason.equals("save_failed"),"silent failed rename claimed success");
  var read=repo.load();check(read.revision==old.revision&&read.text.equals("old"),"old disk replaced after failure");
 }});
 test("AtomicFile start failure and actual post-finish corruption rollback are verified",()->{try(Fixture f=new Fixture()){
  var old=publish(f,AtomicWorkbenchTransferStore.importIntent(f.c,source("old",1),false));var repo=AtomicWorkbenchPendingStorage.repository(f.c);
  for(int fault:new int[]{1,3}){AtomicFile.fail=fault;var failed=repo.clear(old.id,old.revision);check(!failed.success,"write fault reported success");AtomicFile.fail=0;check(repo.load().text.equals("old")&&repo.load().revision==old.revision,"durable rollback failed");}
 }});
 test("legacy migration retains missing row and independently expired items",()->{try(Fixture f=new Fixture()){
  var raw=AtomicWorkbenchTransferStore.importIntent(f.c,source("  legacy  ",2),false);String id=raw.uris.get(0).getPathSegments().get(0);JSONObject metadata=new JSONObject(f.c.prefs.getString(id,""));metadata.put("created",System.currentTimeMillis()-AtomicWorkbenchTransferPolicy.LIFETIME_MS-1);f.c.prefs.edit().putString(id,metadata.toString()).commit();
  JSONObject legacy=new JSONObject().put("text",raw.text).put("created",raw.created).put("uris",new JSONArray(raw.uris.stream().map(Uri::toString).toList()));f.c.prefs.edit().putString("pending",legacy.toString()).commit();
  var migrated=AtomicWorkbenchPendingStorage.repository(f.c).load();check(migrated.files.size()==2&&migrated.text.equals("  legacy  ")&&migrated.state==AtomicWorkbenchPendingPayload.State.PARTIAL,"migration discarded partial batch");check(new File(f.c.getFilesDir(),"workbench-pending-v2.bin").isFile()&&f.c.prefs.getString("pending","").isEmpty(),"migration not durably published");
 }});
 test("unknown durable result is reported honestly and becomes visible only after successful reread",()->{try(Fixture f=new Fixture()){
  var old=publish(f,AtomicWorkbenchTransferStore.importIntent(f.c,source("old",1),false));var repo=AtomicWorkbenchPendingStorage.repository(f.c);
  AtomicFile.fail=5;var unknown=repo.clear(old.id,old.revision);check(!unknown.success&&unknown.reason.equals("save_unknown")&&unknown.snapshot.state==AtomicWorkbenchPendingPayload.State.READ_FAILED,"unconfirmed rollback pretended success/old durability");
  check(repo.load().state==AtomicWorkbenchPendingPayload.State.READ_FAILED,"failed read looked empty");AtomicFile.fail=0;check(repo.load().empty(),"actual successful disk result not reloaded");
 }});
 test("blocked source never holds metadata/provider lock; cancellation fences late result and bounded busy",()->{try(Fixture f=new Fixture()){
  var saved=publish(f,AtomicWorkbenchTransferStore.importIntent(f.c,source("saved",1),false));var repo=AtomicWorkbenchPendingStorage.repository(f.c);
  CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1),closed=new CountDownLatch(1),done=new CountDownLatch(1);AtomicInteger callbacks=new AtomicInteger();AtomicReference<AtomicWorkbenchTransferStore.Payload> late=new AtomicReference<>();
  f.c.resolver=new ContentResolver(){public InputStream openInputStream(Uri u){return new InputStream(){boolean emitted;public int read(){return -1;}public int read(byte[] out){entered.countDown();for(;;)try{release.await();break;}catch(InterruptedException ignored){}if(emitted)return -1;emitted=true;out[0]=42;return 1;}public void close(){closed.countDown();for(;;)try{release.await();return;}catch(InterruptedException ignored){}}};}};
  var job=AtomicWorkbenchTransferStage.start(f.c,source("late",1),false,(p,e)->{callbacks.incrementAndGet();late.set(p);done.countDown();},60);
  check(entered.await(2,TimeUnit.SECONDS),"source not entered");check(done.await(2,TimeUnit.SECONDS),"deadline did not return");check(late.get()==null&&AtomicWorkbenchTransferStage.busy(),"timeout faked completed worker");
  check(closed.await(2,TimeUnit.SECONDS),"close not attempted independently");long at=System.nanoTime();var cleared=repo.clear(saved.id,saved.revision);check(cleared.success&&TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-at)<300,"source held metadata lock");
  check(f.provider.openFile(Uri.parse(saved.files.get(0).uri),"r").file.isFile(),"source blocked existing provider");
  AtomicReference<String> busy=new AtomicReference<>();AtomicWorkbenchTransferStage.start(f.c,source("blocked-new",1),false,(p,e)->busy.set(e));check(busy.get()!=null,"new unbounded source worker allowed");
  release.countDown();waitIdle();Thread.sleep(30);check(callbacks.get()==1&&repo.load().empty(),"late result resurrected queue");
  File[] retained=new File(f.c.getCacheDir(),"workbench-transfer").listFiles();check(retained!=null&&retained.length==1,"cancel deleted fresh cache or leaked unpublished file");
 }});
 test("completed source is unpublished until CAS; cancelled stale batch owns only its own files",()->{try(Fixture f=new Fixture()){
  var old=publish(f,AtomicWorkbenchTransferStore.importIntent(f.c,source("old",1),false));var repo=AtomicWorkbenchPendingStorage.repository(f.c);CountDownLatch done=new CountDownLatch(1);AtomicReference<AtomicWorkbenchTransferStore.Payload> staged=new AtomicReference<>();
  AtomicWorkbenchTransferStage.start(f.c,source("new",1),false,(p,e)->{staged.set(p);done.countDown();});check(done.await(2,TimeUnit.SECONDS),"stage not complete");waitIdle();check(repo.load().text.equals("old"),"stage silently replaced pending");
  check(repo.clear(old.id,old.revision).success,"clear");var incoming=staged.get();var stale=repo.put(old.id,old.revision,AtomicWorkbenchTransferStore.batch(f.c,incoming),AtomicWorkbenchPendingRepository.Mode.APPEND,AtomicWorkbenchPendingRepository.TextChoice.REPLACE);check(!stale.success,"late CAS allowed");
  AtomicWorkbenchTransferStore.discardUnpublished(f.c,incoming);check(f.provider.openFile(Uri.parse(old.files.get(0).uri),"r").file.isFile(),"cancel deleted old exported cache");expectIO(()->f.provider.openFile(incoming.uris.get(0),"r"));
 }});
 test("real module reset chain durably clears queue; failed tombstone stops file deletion",()->{for(boolean refuse:new boolean[]{true,false})try(Fixture f=new Fixture()){
  var raw=AtomicWorkbenchTransferStore.importIntent(f.c,source("old",1),false);var old=publish(f,raw);AtomicFile.fail=refuse?1:0;
  ResetWriteFence.begin();try{if(refuse)expectIO(()->ModuleResetStorage.clear(f.c));else ModuleResetStorage.clear(f.c);}finally{ResetWriteFence.end();AtomicFile.fail=0;}
  var current=AtomicWorkbenchPendingStorage.repository(f.c).load();check(refuse?current.text.equals("old"):current.empty(),"module reset queue result false");
  check(refuse?f.provider.openFile(raw.uris.get(0),"r").file.isFile():!new File(f.c.getFilesDir(),"workbench-pending-v2.bin").exists(),"failed reset deleted bytes or successful reset retained manifest");
 }});
 test("reset blocks non-owner metadata writes and old batch cannot publish after generation changed",()->{try(Fixture f=new Fixture()){
  var raw=AtomicWorkbenchTransferStore.importIntent(f.c,source("old",1),false);var old=publish(f,raw);var repo=AtomicWorkbenchPendingStorage.repository(f.c);var staged=AtomicWorkbenchTransferStore.importIntent(f.c,source("pre-reset",1),false);
  ResetWriteFence.begin();try{ExecutorService writer=Executors.newSingleThreadExecutor();try{var denied=writer.submit(()->repo.clear(old.id,old.revision)).get(2,TimeUnit.SECONDS);check(!denied.success&&repo.load().text.equals("old"),"non-owner wrote during reset");}finally{writer.shutdownNow();}AtomicWorkbenchTransferStore.clearForReset(f.c);}finally{ResetWriteFence.end();}
  check(repo.load().empty(),"owner clear not durable");expectIO(()->AtomicWorkbenchTransferStore.batch(f.c,staged));AtomicWorkbenchTransferStore.discardUnpublished(f.c,staged);check(f.provider.openFile(raw.uris.get(0),"r").file.isFile(),"private reset clear revoked old cache");
 }});
 test("reset cancellation rejects uncooperative stage late metadata after reset ended",()->{try(Fixture f=new Fixture()){
  var old=publish(f,AtomicWorkbenchTransferStore.importIntent(f.c,source("old",1),false));var repo=AtomicWorkbenchPendingStorage.repository(f.c);CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1),done=new CountDownLatch(1);AtomicInteger callbacks=new AtomicInteger();
  f.c.resolver=new ContentResolver(){public InputStream openInputStream(Uri u){return new InputStream(){public int read(){return -1;}public int read(byte[]out){entered.countDown();for(;;)try{release.await();break;}catch(InterruptedException ignored){}return -1;}public void close(){}};}};
  AtomicWorkbenchTransferStage.start(f.c,source("stale",1),false,(p,e)->{check(p==null,"reset returned staged payload");callbacks.incrementAndGet();done.countDown();});check(entered.await(2,TimeUnit.SECONDS),"source not reading");ResetWriteFence.begin();try{AtomicWorkbenchTransferStore.clearForReset(f.c);check(AtomicWorkbenchTransferStage.busy(),"reset faked source exit");}finally{ResetWriteFence.end();}
  check(done.await(1,TimeUnit.SECONDS),"reset cancellation callback missing");release.countDown();waitIdle();Thread.sleep(20);check(callbacks.get()==1&&repo.load().empty(),"post-reset stale stage published");
 }});
 test("reset begin and end during metadata read still fences old batch at actual disk write",()->{try(Fixture f=new Fixture()){
  var old=publish(f,AtomicWorkbenchTransferStore.importIntent(f.c,source("old",1),false));var repo=AtomicWorkbenchPendingStorage.repository(f.c);var raw=AtomicWorkbenchTransferStore.importIntent(f.c,source("stale",1),false);var incoming=AtomicWorkbenchTransferStore.batch(f.c,raw);
  AtomicFile.readEntered=new CountDownLatch(1);AtomicFile.releaseRead=new CountDownLatch(1);AtomicFile.pauseNextRead=true;ExecutorService writer=Executors.newSingleThreadExecutor();
  try{var saved=writer.submit(()->AtomicWorkbenchPendingStorage.withWriteGeneration(raw.generation,()->repo.put(old.id,old.revision,incoming,AtomicWorkbenchPendingRepository.Mode.REPLACE,AtomicWorkbenchPendingRepository.TextChoice.REPLACE)));
   check(AtomicFile.readEntered.await(2,TimeUnit.SECONDS),"metadata read barrier");ResetWriteFence.begin();ResetWriteFence.end();AtomicFile.releaseRead.countDown();var rejected=saved.get(2,TimeUnit.SECONDS);check(!rejected.success&&repo.load().text.equals("old"),"reset generation race wrote old batch after reset ended");
  }finally{AtomicFile.releaseRead.countDown();AtomicFile.pauseNextRead=false;writer.shutdownNow();AtomicWorkbenchTransferStore.discardUnpublished(f.c,raw);}
 }});
 System.out.println("TRANSFER STORAGE PASS "+cases+" cases / "+checks+" assertions");}}
'''

def execute(folder, mutation=None):
    folder = Path(folder); files = []
    for name in ("AtomicWorkbenchTransferPolicy.java", "AtomicWorkbenchTransferStore.java", "AtomicWorkbenchTransferProvider.java", "AtomicWorkbenchTransferStage.java", "AtomicWorkbenchPendingPayload.java", "AtomicWorkbenchPendingRepository.java", "AtomicWorkbenchPendingStorage.java", "ModuleResetStorage.java", "ResetWriteFence.java"):
        value = (SRC / name).read_text(encoding="utf-8")
        if mutation and mutation[0] == name:
            assert mutation[1] in value
            value = value.replace(mutation[1], mutation[2], 1)
        target = folder / "ls/augment/com" / name; target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(value, encoding="utf-8"); files.append(str(target))
    for name, value in {**STUBS, "ls/augment/com/TestTransferStorage.java": TEST}.items():
        target = folder / name; target.parent.mkdir(parents=True, exist_ok=True); target.write_text(value, encoding="utf-8"); files.append(str(target))
    build = subprocess.run([JAVAC, "-J-Duser.language=en", "-J-Dfile.encoding=UTF-8", "--release", "17", "-encoding", "UTF-8", "-cp", str(JSON), "-d", str(folder / "classes"), *files], capture_output=True, encoding="utf-8", errors="replace", env=ENV)
    if build.returncode: raise AssertionError(build.stdout + build.stderr)
    return subprocess.run([JAVA, "-Dfile.encoding=UTF-8", "-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8", "-cp", str(folder / "classes") + os.pathsep + str(JSON), "ls.augment.com.TestTransferStorage"], capture_output=True, encoding="utf-8", env=ENV, timeout=25)

def main():
    with tempfile.TemporaryDirectory(prefix="duo-transfer-storage-") as folder:
        result = execute(folder); print(result.stdout, end="")
        if result.returncode: raise AssertionError(result.stderr)
    for name, mutation in {
        "silent AtomicFile finish falsely reports success": ("AtomicWorkbenchPendingStorage.java", 'if (!Arrays.equals(bytes, readFile())) throw new IOException("素材保存尚未确认");', "// faulty no durable readback"),
        "timeout drops uncooperative source responsibility": ("AtomicWorkbenchTransferStage.java", "cancelled = true; Thread current", "BUSY.set(false); cancelled = true; Thread current"),
        "URI plus text item loses text": ("AtomicWorkbenchTransferStore.java", "if (!picker && text.isEmpty() && item.getText() != null)", "else if (!picker && text.isEmpty() && item.getText() != null)"),
        "module reset skips checked durable queue clearing": ("ModuleResetStorage.java", "AtomicWorkbenchTransferStore.clearForReset(app);", "// faulty skip checked pending clear"),
        "ended reset generation no longer fences durable write": ("AtomicWorkbenchPendingStorage.java", "expected != null && ResetWriteFence.stale(expected)", "false"),
    }.items():
        with tempfile.TemporaryDirectory(prefix="duo-transfer-storage-negative-") as folder:
            result = execute(folder, mutation)
            if result.returncode == 0: raise AssertionError("negative survived: " + name)
            print("EXPECTED FAILURE " + name)
    print("TRANSFER STORAGE OFFLINE PASS; ANDROID WM/URI GRANTS/DRAG UI REQUIRE DEVICE ACCEPTANCE")

if __name__ == "__main__": main()
