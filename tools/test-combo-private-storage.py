"""Execute the real private cache against JVM Android/FD doubles; no device operations."""
from pathlib import Path
import argparse
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
JAVA = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'

STUBS = {
'android/os/Process.java': 'package android.os;public class Process{public static int myUid(){return 10123;}}',
'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle extends HashMap<String,Object>{
public void putInt(String k,int v){put(k,v);}public int getInt(String k,int d){return containsKey(k)?(Integer)get(k):d;}
public void putLong(String k,long v){put(k,v);}public long getLong(String k,long d){return containsKey(k)?(Long)get(k):d;}
public void putFloat(String k,float v){put(k,v);}public float getFloat(String k,float d){return containsKey(k)?(Float)get(k):d;}
public void putBoolean(String k,boolean v){put(k,v);}public boolean getBoolean(String k,boolean d){return containsKey(k)?(Boolean)get(k):d;}
public void putString(String k,String v){put(k,v);}public String getString(String k,String d){return containsKey(k)?(String)get(k):d;}
public void putParcelable(String k,Object v){put(k,v);}@SuppressWarnings("unchecked")public <T>T getParcelable(String k){return(T)get(k);}}
''',
'android/content/pm/ApplicationInfo.java': 'package android.content.pm;public class ApplicationInfo{public int uid=10044;}',
'android/content/pm/PackageManager.java': 'package android.content.pm;public class PackageManager{public final ApplicationInfo info=new ApplicationInfo();public ApplicationInfo getApplicationInfo(String p,int f){return info;}}',
'android/content/Context.java': '''package android.content;import java.io.*;import android.content.pm.*;public class Context{
public final File cache;public final PackageManager pm=new PackageManager();public Context(File f){cache=f;}public File getCacheDir(){return cache;}public PackageManager getPackageManager(){return pm;}}
''',
'android/net/Uri.java': '''package android.net;import java.util.*;public class Uri{private final java.net.URI uri;private Uri(String u){uri=java.net.URI.create(u);}public static Uri parse(String u){return new Uri(u);}public String getAuthority(){return uri.getAuthority();}public String getQuery(){return uri.getQuery();}public String getFragment(){return uri.getFragment();}public List<String> getPathSegments(){List<String> out=new ArrayList<>();for(String v:uri.getPath().split("/"))if(!v.isEmpty())out.add(v);return out;}public String getLastPathSegment(){List<String> s=getPathSegments();return s.get(s.size()-1);}}
''',
'android/os/ParcelFileDescriptor.java': '''package android.os;import java.io.*;import java.util.*;public class ParcelFileDescriptor implements Closeable{
public static final int MODE_READ_ONLY=0x10000000,MODE_READ_WRITE=0x30000000;public static final Map<FileDescriptor,ParcelFileDescriptor> ALL=new IdentityHashMap<>();
public final File file;public final int mode;public boolean closed;private final RandomAccessFile input;
private ParcelFileDescriptor(File f,int m)throws IOException{file=f;mode=m;input=new RandomAccessFile(f,m==MODE_READ_ONLY?"r":"rw");ALL.put(input.getFD(),this);}
public static ParcelFileDescriptor open(File f,int m)throws FileNotFoundException{try{return new ParcelFileDescriptor(f,m);}catch(IOException e){throw new FileNotFoundException(e.toString());}}
public static ParcelFileDescriptor dup(FileDescriptor fd)throws IOException{ParcelFileDescriptor old=ALL.get(fd);ParcelFileDescriptor out=new ParcelFileDescriptor(old.file,old.mode);out.input.seek(old.input.getFilePointer());return out;}
public FileDescriptor getFileDescriptor(){try{return input.getFD();}catch(IOException e){throw new RuntimeException(e);}}
public void close()throws IOException{if(!closed){closed=true;input.close();}}
public static class AutoCloseInputStream extends FileInputStream{private final ParcelFileDescriptor owner;public AutoCloseInputStream(ParcelFileDescriptor p){super(p.getFileDescriptor());owner=p;}public void close()throws IOException{super.close();owner.close();}}
}
''',
'android/system/StructStat.java': 'package android.system;public class StructStat{public int st_mode=0100000;public long st_size;public StructStat(long n){st_size=n;}}',
'android/system/OsConstants.java': 'package android.system;public class OsConstants{public static int F_GETFL=3,O_ACCMODE=3,O_RDONLY=0;public static boolean S_ISREG(int mode){return mode==0100000;}}',
'android/system/Os.java': '''package android.system;import java.io.*;import android.os.ParcelFileDescriptor;public class Os{
public static StructStat fstat(FileDescriptor fd){return new StructStat(ParcelFileDescriptor.ALL.get(fd).file.length());}
public static int fcntlInt(FileDescriptor fd,int cmd,int value){return ParcelFileDescriptor.ALL.get(fd).mode==ParcelFileDescriptor.MODE_READ_ONLY?0:2;}
public static StructStat lstat(String p)throws IOException{File f=new File(p);StructStat s=new StructStat(f.length());if(!f.isFile()||java.nio.file.Files.isSymbolicLink(f.toPath()))s.st_mode=0;return s;}}
''',
'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public class BuildConfig{public static final int VERSION_CODE=20538;}',
}

HARNESS = r'''package ls.augment.com;
import java.io.*;import java.nio.file.*;import java.nio.charset.*;import java.util.*;
import android.content.*;import android.net.*;import android.os.*;import org.json.*;
public class TestComboPrivateStorage{
static final String HOST="cn.nubia.gamehelpmodule";static final String[] PACKAGES={HOST};static int checks;static File source;static Context context;
static void yes(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
static Bundle args()throws Exception{Bundle b=new Bundle();b.putInt("version",BuildConfig.VERSION_CODE);b.putParcelable("source",ParcelFileDescriptor.open(source,ParcelFileDescriptor.MODE_READ_ONLY));b.putString("source_id","a".repeat(64));b.putString("digest",ComboMotionPrivateScaler.contentDigest(source,16777216));b.putLong("size",source.length());b.putLong("modified",source.lastModified());b.putFloat("rate",2);return b;}
static Bundle call(Bundle b){return ComboMotionPrivateCache.prepare(context,10044,HOST,PACKAGES,b);}
static void closeArgs(Bundle b)throws Exception{((ParcelFileDescriptor)b.getParcelable("source")).close();}
static Uri uri(String id){return Uri.parse("content://ls.augment.com.config/combo-motion/"+id);}
static void denied(Uri u,String mode,String caller)throws Exception{try{ComboMotionPrivateCache.open(context,10044,caller,PACKAGES,u,mode);throw new AssertionError("open admitted");}catch(FileNotFoundException expected){checks++;}}
public static void main(String[] ignored)throws Exception{
 Path temp=Files.createTempDirectory("duo-combo-private-");
 try{
  Path host=temp.resolve("host");Files.createDirectory(host);source=host.resolve("motion.json").toFile();
  String raw="{\"name\":\"source\",\"events\":[{\"sampleEventTime\":1000,\"downTime\":1000,\"action\":0},{\"sampleEventTime\":5000,\"downTime\":1000,\"action\":1}]}";
  Files.writeString(source.toPath(),raw);Path module=temp.resolve("module");Files.createDirectory(module);context=new Context(module.toFile());
  yes(ComboMotionPrivateCache.allowed(context,10044,HOST,PACKAGES),"exact caller allowed");
  yes(!ComboMotionPrivateCache.allowed(context,110044,HOST,PACKAGES),"cross-user rejected");
  yes(!ComboMotionPrivateCache.allowed(context,10045,HOST,PACKAGES),"forged package uid rejected");
  yes(!ComboMotionPrivateCache.allowed(context,10044,"other",PACKAGES),"wrong attribution rejected");
  yes(!ComboMotionPrivateCache.allowed(context,10044,HOST,new String[]{"other"}),"uid package mismatch rejected");
  Bundle wrong=args();wrong.putInt("version",0);yes(!call(wrong).getBoolean("ok",false),"stale version rejected");closeArgs(wrong);
  wrong=args();wrong.putString("unexpected","x");yes(!call(wrong).getBoolean("ok",false),"extra key rejected");closeArgs(wrong);
  wrong=args();wrong.putString("digest","b".repeat(64));yes(!call(wrong).getBoolean("ok",false),"source integrity rejected");
  wrong=args();((ParcelFileDescriptor)wrong.getParcelable("source")).close();wrong.putParcelable("source",ParcelFileDescriptor.open(source,ParcelFileDescriptor.MODE_READ_WRITE));yes(!call(wrong).getBoolean("ok",false),"writable source rejected");
  wrong=args();wrong.putFloat("rate",0);yes(!call(wrong).getBoolean("ok",false),"invalid rate rejected");
  ResetWriteFence.begin();try{yes(!call(args()).getBoolean("ok",false),"active reset rejects owner too");}finally{ResetWriteFence.end();}
  Bundle first=call(args());yes(first.getBoolean("ok",false),"private generation succeeds "+first);
  String id=first.getString("identity","");yes(id.matches("[0-9a-f]{64}"),"opaque cache identity");
  yes(first.getInt("events",0)==2&&first.getLong("source_span",0)==4000&&first.getLong("output_span",0)==2000,"correct speed metrics");
  yes(!first.containsKey("outputPath")&&!first.toString().contains(module.toString()),"private path not exposed");
  yes(call(args()).getBoolean("cache_hit",false),"private cache persists across preparations");
  try(ParcelFileDescriptor one=ComboMotionPrivateCache.open(context,10044,HOST,PACKAGES,uri(id),"r");
      ParcelFileDescriptor.AutoCloseInputStream readOne=new ParcelFileDescriptor.AutoCloseInputStream(one)){
   byte[] output=readOne.readAllBytes();JSONObject json=new JSONObject(new String(output,StandardCharsets.UTF_8));
   yes(json.getJSONArray("events").getJSONObject(1).getLong("sampleEventTime")==3000,"private bytes transformed");
   yes(json.getJSONArray("events").getJSONObject(1).getInt("action")==1,"release retained");
   try(ParcelFileDescriptor two=ComboMotionPrivateCache.open(context,10044,HOST,PACKAGES,uri(id),"r");
       ParcelFileDescriptor.AutoCloseInputStream readTwo=new ParcelFileDescriptor.AutoCloseInputStream(two)){
    yes(Arrays.equals(output,readTwo.readAllBytes()),"repeated playback independently starts at offset zero");
    yes(two.mode==ParcelFileDescriptor.MODE_READ_ONLY,"descriptor read-only");
   }
  }
  for(String mode:new String[]{"w","rw","rwt","wa"})denied(uri(id),mode,HOST);
  denied(uri(id),"r","other");denied(uri(id+"?x=1"),"r",HOST);denied(uri(id+"#x"),"r",HOST);
  denied(uri("../source"),"r",HOST);denied(uri("%2e%2e"),"r",HOST);denied(Uri.parse("content://other/combo-motion/"+id),"r",HOST);
  ResetWriteFence.begin();try{denied(uri(id),"r",HOST);}finally{ResetWriteFence.end();}
  yes(Files.readString(source.toPath()).equals(raw),"native original unchanged");
  try(var files=Files.list(host)){yes(files.count()==1,"no generated files in host sandbox");}
  try(var files=Files.list(module.resolve("combo-motion-v1"))){yes(files.noneMatch(p->p.getFileName().toString().startsWith("source-")),"staging removed");}
  yes(ComboMotionPrivateCache.clear(context),"reset clears module private derivatives");
  yes(!Files.exists(module.resolve("combo-motion-v1")),"private cache removed");
  yes(Files.readString(source.toPath()).equals(raw),"reset preserves native source");
  yes(ComboMotionPrivateCache.clear(context),"reset idempotent");
  System.out.println("PASS combo private provider storage: "+checks+" checks");
 }finally{try(var files=Files.walk(temp)){for(Path file:files.sorted(Comparator.reverseOrder()).toList())Files.deleteIfExists(file);}}
}}
'''

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--json-jar', type=Path)
    args = parser.parse_args()
    jar = args.json_jar or next((Path.home()/'.gradle/caches/modules-2/files-2.1/org.json/json').rglob('*.jar'))
    with tempfile.TemporaryDirectory(prefix='duo-combo-private-jvm-') as folder:
        work = Path(folder)
        sources = dict(STUBS)
        sources['ls/augment/com/TestComboPrivateStorage.java'] = HARNESS
        files = []
        for name, text in sources.items():
            path = work/name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding='utf-8')
            files.append(path)
        files += [SRC/(name+'.java') for name in ('ComboMotionPrivateCache','ComboMotionPrivateScaler','ResetWriteFence')]
        files += [SRC/'hook/ComboSpeedPolicy.java', SRC/'hook/ComboMotionLeases.java', ROOT/'tools/TestComboMotionLeases.java']
        subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-cp',str(jar),'-d',folder,*map(str,files)],check=True)
        cp=folder+os.pathsep+str(jar)
        for name in ('ls.augment.com.TestComboPrivateStorage','ls.augment.com.hook.TestComboMotionLeases'):
            subprocess.run([str(JAVA/'java.exe'),'-cp',cp,name],check=True,timeout=30)

if __name__ == '__main__':
    main()
