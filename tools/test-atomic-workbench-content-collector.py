"""Run the production foreground clipboard collector; retain real repository and private disk persistence."""
from pathlib import Path
import runpy
import subprocess
import tempfile
import sys

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-phone-content.py")))
ROOT, SRC, JAVAC, JAVA, ENV = (BASE[name] for name in ("ROOT", "SRC", "JAVAC", "JAVA", "ENV"))
STUBS = dict(BASE["STUBS"])
STUBS.update({
    "android/content/pm/PackageManager.java": "package android.content.pm;public class PackageManager {public static final int PERMISSION_GRANTED=0;public static class NameNotFoundException extends Exception {}}",
    "android/os/PersistableBundle.java": "package android.os;public class PersistableBundle {public boolean sensitive;public boolean getBoolean(String key,boolean fallback){return sensitive;}}",
    "android/content/ClipDescription.java": "package android.content;public class ClipDescription {public static final String EXTRA_IS_SENSITIVE=\"sensitive\";public long timestamp;public long getTimestamp(){return timestamp;}public android.os.PersistableBundle extras=new android.os.PersistableBundle();public android.os.PersistableBundle getExtras(){return extras;}}",
    "android/content/ClipData.java": "package android.content;public class ClipData {public final ClipDescription description=new ClipDescription();public final Item item;public ClipData(CharSequence text){item=new Item(text);}public static ClipData newPlainText(CharSequence label,CharSequence text){return new ClipData(text);}public ClipDescription getDescription(){return description;}public int getItemCount(){return 1;}public Item getItemAt(int index){return item;}public static class Item {private final CharSequence text;Item(CharSequence text){this.text=text;}public CharSequence getText(){return text;}}}",
    "android/content/ClipboardManager.java": r'''package android.content;import java.util.*;public class ClipboardManager {
 public interface OnPrimaryClipChangedListener {void onPrimaryClipChanged();}public final Set<OnPrimaryClipChangedListener> listeners=new HashSet<>();
 public ClipData clip;public boolean deny,rejectWrite,rejectClear;public int reads,adds,removes,writes,clears;
 public ClipData getPrimaryClip(){reads++;if(deny)throw new SecurityException("synthetic denial");return clip;}
 public void addPrimaryClipChangedListener(OnPrimaryClipChangedListener value){adds++;listeners.add(value);}
 public void removePrimaryClipChangedListener(OnPrimaryClipChangedListener value){removes++;listeners.remove(value);}
 public void setPrimaryClip(ClipData value){if(rejectWrite)throw new SecurityException("synthetic write denial");writes++;copy(value);}
 public void clearPrimaryClip(){if(rejectClear)throw new SecurityException("synthetic clear denial");clears++;copy(null);}
 public void copy(ClipData value){clip=value;for(OnPrimaryClipChangedListener listener:List.copyOf(listeners))listener.onPrimaryClipChanged();}}
''',
    "android/content/Context.java": r'''package android.content;import android.os.*;import java.io.*;import java.util.*;public class Context {
 public static final int RECEIVER_NOT_EXPORTED=4;public final UserManager users=new UserManager();public final ClipboardManager clipboard=new ClipboardManager();
 public final Set<String> permissions=new HashSet<>();public Set<String> volumes=new LinkedHashSet<>(List.of("external_primary"));public ContentResolver resolver;
 public File files;public boolean deviceProtected;public Context credential;
 public Context getApplicationContext(){return this;}public boolean isDeviceProtectedStorage(){return deviceProtected;}
 public Context createPackageContext(String pkg,int flags)throws android.content.pm.PackageManager.NameNotFoundException{return credential==null?this:credential;}
 public String getPackageName(){return "ls.augment.com";}public File getFilesDir(){return files;}public ContentResolver getContentResolver(){return resolver;}
 public int checkSelfPermission(String p){return permissions.contains(p)?0:-1;}
 public <T>T getSystemService(Class<T> type){return type.cast(type==UserManager.class?users:type==ClipboardManager.class?clipboard:null);}
 public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,int flags){return null;}public void unregisterReceiver(BroadcastReceiver r){}}
''',
    "ls/augment/com/AtomicWorkbenchPhoneContentSource.java": r'''package ls.augment.com;final class AtomicWorkbenchPhoneContentSource implements AtomicWorkbenchContentSource {
 static int closed;AtomicWorkbenchPhoneContentSource(android.content.Context context){}
 public Result scan(AtomicWorkbenchContentItem.Kind kind){return new Result(java.util.List.of(),AtomicWorkbenchContentPermissionState.simple(AtomicWorkbenchContentPermissionState.Scope.DENIED),State.PERMISSION_REQUIRED);}
 public void start(Runnable changed){}public void stop(){}public void close(){closed++;}}
''',
})
STUBS["android/os/Handler.java"] = STUBS["android/os/Handler.java"].replace(
    "public Handler(Looper l){}", "public Handler(Looper l){}public boolean post(Runnable task){return postDelayed(task,0);}")

TEST = r'''package ls.augment.com;
import android.content.*;import android.os.*;import java.nio.file.*;import java.util.*;import java.util.function.*;
public class TestAtomicWorkbenchContentCollector {
 static int checks,cases;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static void until(BooleanSupplier condition,String message)throws Exception{long end=System.nanoTime()+2_000_000_000L;do{Handler.fire(0);if(condition.getAsBoolean())return;Thread.sleep(5);}while(System.nanoTime()<end);throw new AssertionError(message);}
 static Context context()throws Exception{Context c=new Context();c.files=Files.createTempDirectory("duo-clipboard-synthetic-").toFile();return c;}
 static void run(String name,Checked test)throws Exception{test.run();cases++;System.out.println("PASS foreground collector: "+name);}interface Checked{void run()throws Exception;}
 static void fails(Checked test,String message)throws Exception{try{test.run();throw new AssertionError(message);}catch(java.io.IOException expected){checks++;check(expected.getMessage()!=null&&!expected.getMessage().isEmpty(),"failure lacks readable feedback");}}
 static List<AtomicWorkbenchContentItem> history(AtomicWorkbenchContentCollector c){return c.repository.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).items;}
 public static void main(String[] args)throws Exception{
  run("foreground ownership and sensitive/URI exclusion",()->{
   Context c=context();c.clipboard.clip=new ClipData("synthetic-first");AtomicWorkbenchContentCollector collector=new AtomicWorkbenchContentCollector(c);
   collector.readCurrentClipboard();Handler.fire(0);check(c.clipboard.reads==0,"background user read accessed clipboard");
   collector.setForeground(true);until(()->history(collector).size()==1,"first foreground text not recorded");
   collector.setForeground(true);Handler.fire(0);check(c.clipboard.adds==1&&c.clipboard.listeners.size()==1,"duplicate listener registration");
   ClipData sensitive=new ClipData("synthetic-sensitive");sensitive.description.extras.sensitive=true;c.clipboard.copy(sensitive);
   c.clipboard.copy(new ClipData(null));c.clipboard.copy(new ClipData("synthetic-second"));until(()->history(collector).size()==2,"text change not recorded");
   check(history(collector).stream().noneMatch(i->i.text().contains("sensitive")),"sensitive clip persisted");
   ClipboardManager.OnPrimaryClipChangedListener queued=c.clipboard.listeners.iterator().next();collector.setForeground(false);Handler.fire(0);
   int reads=c.clipboard.reads;queued.onPrimaryClipChanged();c.clipboard.copy(new ClipData("synthetic-background"));Handler.fire(0);
   check(c.clipboard.listeners.isEmpty()&&c.clipboard.reads==reads,"background or queued listener continued collection");
   collector.close();Handler.fire(0);check(c.clipboard.listeners.isEmpty(),"close retained clipboard listener");
  });
  run("current clip denial does not block persisted private history",()->{
   Context c=context();c.clipboard.clip=new ClipData("synthetic-history");AtomicWorkbenchContentCollector first=new AtomicWorkbenchContentCollector(c);
   first.setForeground(true);until(()->history(first).size()==1,"capture before restart");first.close();Handler.fire(0);
   c.clipboard.deny=true;AtomicWorkbenchContentCollector restored=new AtomicWorkbenchContentCollector(c);restored.setForeground(true);
   until(()->history(restored).size()==1&&restored.repository.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).state==AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED,"restore or denial state missing");
   AtomicWorkbenchContentItem item=history(restored).get(0);
   check(restored.repository.selection(AtomicWorkbenchContentItem.Kind.CLIPBOARD,List.of(item.key)).size()==1,"system clipboard denial locked owned history");
   restored.close();Handler.fire(0);
  });
  run("locked users do not collect or select",()->{
   Context c=context();c.users.unlocked=false;c.clipboard.clip=new ClipData("synthetic-locked");AtomicWorkbenchContentCollector collector=new AtomicWorkbenchContentCollector(c);
   collector.setForeground(true);until(()->collector.repository.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).state==AtomicWorkbenchContentSource.State.LOCKED,"locked state missing");
   check(c.clipboard.reads==0&&c.clipboard.listeners.isEmpty()&&history(collector).isEmpty(),"locked user clipboard read");collector.close();Handler.fire(0);
  });
  run("history copy is a real foreground system write with original whitespace",()->{
   Context c=context();AtomicWorkbenchContentCollector collector=new AtomicWorkbenchContentCollector(c);
   AtomicWorkbenchContentItem text=AtomicWorkbenchContentItem.clipboard("  synthetic copy\n",1);
   fails(()->collector.copyHistory(text),"background copy permitted");collector.setForeground(true);Handler.fire(0);
   check(collector.copyHistory(text)&&c.clipboard.writes==1&&c.clipboard.clip.getItemAt(0).getText().equals("  synthetic copy\n"),"clipboard copy changed whitespace or did not write");
   until(()->history(collector).size()==1,"copied history not observed");
   AtomicWorkbenchContentItem maximum=AtomicWorkbenchContentItem.clipboard(" "+"x".repeat(32766)+" ",1);
   check(collector.copyHistory(maximum)&&c.clipboard.clip.getItemAt(0).getText().length()==32768,"32k exact boundary or surrounding spaces lost");
   AtomicWorkbenchContentItem file=AtomicWorkbenchContentItem.file(AtomicWorkbenchContentItem.Kind.MEDIA,AtomicWorkbenchContentItem.Source.MEDIA_STORE,"content://media/external/file/1","image/png","synthetic",1,1,0);
   fails(()->collector.copyHistory(file),"file item copied as text");
   c.clipboard.rejectWrite=true;fails(()->collector.copyHistory(text),"rejected system write pretended success");c.clipboard.rejectWrite=false;
   c.users.unlocked=false;fails(()->collector.copyHistory(text),"locked user write permitted");collector.close();Handler.fire(0);
  });
  run("confirmed system clear is real and failures stay visible",()->{
   Context c=context();c.clipboard.clip=new ClipData("synthetic-current");AtomicWorkbenchContentCollector collector=new AtomicWorkbenchContentCollector(c);
   fails(collector::clearSystemClipboard,"background clear permitted");collector.setForeground(true);until(()->history(collector).size()==1,"capture before clear");
   check(collector.clearSystemClipboard()&&c.clipboard.clears==1&&c.clipboard.clip==null,"system clip not actually cleared");
   check(history(collector).size()==1,"system clear silently changed independent private history");
   collector.repository.clearHistory(AtomicWorkbenchContentItem.Kind.CLIPBOARD);until(()->history(collector).isEmpty(),"private clear not applied");
   c.clipboard.rejectClear=true;fails(collector::clearSystemClipboard,"rejected clear pretended success");c.clipboard.rejectClear=false;
   c.users.unlocked=false;fails(collector::clearSystemClipboard,"locked user clear permitted");collector.close();Handler.fire(0);
   fails(collector::clearSystemClipboard,"closed collector cleared system clip");
  });
  run("foreground capture recovers after unlocking without recreating history",()->{
   Context c=context();c.users.unlocked=false;c.clipboard.clip=new ClipData("synthetic-after-unlock");AtomicWorkbenchContentCollector collector=new AtomicWorkbenchContentCollector(c);
   collector.setForeground(true);until(()->collector.repository.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).state==AtomicWorkbenchContentSource.State.LOCKED,"precondition locked");
   c.users.unlocked=true;collector.readCurrentClipboard();until(()->history(collector).size()==1,"explicit read failed after unlock");
   check(c.clipboard.listeners.size()==1,"foreground observer not recovered after unlock");collector.close();Handler.fire(0);
  });
  run("device protected input context resolves private credential storage",()->{
   Context device=context(),credential=context();device.deviceProtected=true;device.credential=credential;credential.clipboard.clip=new ClipData("synthetic-credential");
   AtomicWorkbenchContentCollector collector=new AtomicWorkbenchContentCollector(device);collector.setForeground(true);until(()->history(collector).size()==1,"credential context not used");
   check(new java.io.File(credential.files,"workbench-content/workbench-content-v1.bin").isFile(),"history not stored in credential directory");
   check(!new java.io.File(device.files,"workbench-content/workbench-content-v1.bin").exists(),"history leaked into device protected directory");collector.close();Handler.fire(0);
  });
  run("system copy timestamp survives reopen and invalid times fall back",()->{
   Context c=context();long copiedAt=System.currentTimeMillis()-3L*24*3600*1000;c.clipboard.clip=new ClipData("synthetic-old-clip");c.clipboard.clip.description.timestamp=copiedAt;
   AtomicWorkbenchContentCollector first=new AtomicWorkbenchContentCollector(c);first.setForeground(true);until(()->history(first).size()==1,"old clip capture");
   check(history(first).get(0).modifiedMillis==copiedAt,"opening old system clip renamed it today");first.close();Handler.fire(0);
   AtomicWorkbenchContentCollector restored=new AtomicWorkbenchContentCollector(c);restored.setForeground(true);until(()->history(restored).size()==1&&c.clipboard.listeners.size()==1,"reopen old clip");
   check(history(restored).get(0).modifiedMillis==copiedAt,"reopening changed original copy time");
   long before=System.currentTimeMillis();ClipData future=new ClipData("synthetic-invalid-future");future.description.timestamp=Long.MAX_VALUE;c.clipboard.copy(future);
   until(()->history(restored).size()==2,"future fallback capture");long observed=history(restored).get(0).modifiedMillis;
   check(observed>=before&&observed<=System.currentTimeMillis(),"invalid future did not use actual observation time");restored.close();Handler.fire(0);
  });
  System.out.println("CONTENT COLLECTOR RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''


def main():
    with tempfile.TemporaryDirectory(prefix="duo-collector-tests-") as temporary:
        folder = Path(temporary)
        sources = []
        for name, source in STUBS.items():
            file = folder / name
            file.parent.mkdir(parents=True, exist_ok=True)
            file.write_text(source, encoding="utf-8")
            sources.append(str(file))
        test = folder / "ls/augment/com/TestAtomicWorkbenchContentCollector.java"
        test.write_text(TEST, encoding="utf-8")
        sources.append(str(test))
        for suffix in ("Item", "Policy", "PermissionState", "Source", "Snapshot", "Store", "Repository", "Collector"):
            sources.append(str(SRC / ("AtomicWorkbenchContent" + suffix + ".java")))
        subprocess.run([JAVAC, "--release", "17", "-encoding", "UTF-8", "-d", str(folder / "classes"), *sources], check=True, env=ENV)
        process = subprocess.run([JAVA, "-Dfile.encoding=UTF-8", "-cp", str(folder / "classes"),
                                  "ls.augment.com.TestAtomicWorkbenchContentCollector"], capture_output=True, text=True,
                                 encoding="utf-8", errors="replace", env=ENV)
        print(process.stdout, end="")
        if process.returncode:
            raise SystemExit(process.stderr)


if __name__ == "__main__":
    main()
