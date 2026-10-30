"""Production URI provider tests; OS-level permission grants still require a device."""
from pathlib import Path
import subprocess,tempfile,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[1]
A='{http://schemas.android.com/apk/res/android}'
provider=next(p for p in ET.parse(ROOT/'android/app/src/main/AndroidManifest.xml').findall('.//provider') if p.get(A+'name')=='.UpdateApkProvider')
assert provider.get(A+'exported')=='false' and provider.get(A+'grantUriPermissions')=='false'
assert [x.get(A+'pathPrefix') for x in provider.findall('grant-uri-permission')]==['/verified/']
sources={
'android/content/Context.java':'''package android.content;public class Context {
 public static final int MODE_PRIVATE=0;public final java.io.File cache;final SharedPreferences prefs=new SharedPreferences();
 public Context(java.io.File c){cache=c;}public Context getApplicationContext(){return this;}public java.io.File getCacheDir(){return cache;}public String getPackageName(){return "ls.augment.com";}
 public SharedPreferences getSharedPreferences(String n,int m){return prefs;}}''',
'android/content/SharedPreferences.java':'''package android.content;public class SharedPreferences {
 final java.util.Map<String,Object> values=new java.util.HashMap<>();public String getString(String k,String d){return (String)values.getOrDefault(k,d);}
 public long getLong(String k,long d){return (Long)values.getOrDefault(k,d);}public java.util.Map<String,?>getAll(){return new java.util.HashMap<>(values);}public Editor edit(){return new Editor();}
 public class Editor {public Editor remove(String k){values.remove(k);return this;}public Editor putString(String k,String v){values.put(k,v);return this;}public Editor putLong(String k,long v){values.put(k,v);return this;}public boolean commit(){return true;}}}''',
'ls/augment/com/AppUpdatePolicy.java':'package ls.augment.com;final class AppUpdatePolicy {static final long MAX_APK_BYTES=2L*1024*1024*1024-1;}',
'android/content/ContentProvider.java':'''package android.content;public abstract class ContentProvider {
 public Context context;public Context getContext(){return context;}public abstract boolean onCreate();public abstract String getType(android.net.Uri u);
 public abstract android.os.ParcelFileDescriptor openFile(android.net.Uri u,String m)throws java.io.FileNotFoundException;
 public abstract android.database.Cursor query(android.net.Uri u,String[]p,String s,String[]a,String o);
 public abstract android.net.Uri insert(android.net.Uri u,ContentValues v);public abstract int update(android.net.Uri u,ContentValues v,String s,String[]a);
 public abstract int delete(android.net.Uri u,String s,String[]a);}''',
'android/content/ContentValues.java':'package android.content;public class ContentValues {}',
'android/database/Cursor.java':'package android.database;public interface Cursor {}',
'android/database/MatrixCursor.java':'package android.database;public class MatrixCursor implements Cursor {public MatrixCursor(String[]c,int n){}public void addRow(Object[]v){}}',
'android/provider/OpenableColumns.java':'package android.provider;public class OpenableColumns {public static final String DISPLAY_NAME="name",SIZE="size";}',
'android/os/ParcelFileDescriptor.java':'''package android.os;public class ParcelFileDescriptor {
 public static final int MODE_READ_ONLY=1;public static ParcelFileDescriptor open(java.io.File f,int m){if(m!=1)throw new AssertionError();return new ParcelFileDescriptor();}}''',
'android/net/Uri.java':'''package android.net;public class Uri {final java.net.URI uri;public Uri(String s){uri=java.net.URI.create(s);}
 public String getScheme(){return uri.getScheme();}public String getAuthority(){return uri.getAuthority();}public String getQuery(){return uri.getQuery();}
 public String getFragment(){return uri.getFragment();}public java.util.List<String> getPathSegments(){return java.util.Arrays.asList(uri.getPath().substring(1).split("/"));}
 public String toString(){return uri.toString();}public static class Builder {String scheme,authority;java.util.List<String> parts=new java.util.ArrayList<>();
 public Builder scheme(String s){scheme=s;return this;}public Builder authority(String s){authority=s;return this;}public Builder appendPath(String s){parts.add(s);return this;}
 public Uri build(){return new Uri(scheme+"://"+authority+"/"+String.join("/",parts));}}}''',
'ls/augment/com/TestProvider.java':'''package ls.augment.com;import android.net.Uri;import android.content.Context;import java.nio.file.*;
 public class TestProvider {static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static void denied(UpdateApkProvider p,String uri,String mode)throws Exception {boolean bad=false;try{p.openFile(new Uri(uri),mode);}catch(java.io.FileNotFoundException e){bad=true;}check(bad,"deny "+uri+" "+mode);}
 public static void main(String[]a)throws Exception {Context c=new Context(Path.of(a[0]).toFile());Path dir=UpdateApkProvider.directory(c).toPath();Files.createDirectories(dir);
 String name="verified-"+"a".repeat(64)+".apk";Path apk=dir.resolve(name);Files.write(apk,new byte[]{1});
 UpdateApkProvider p=new UpdateApkProvider();p.context=c;Uri uri=UpdateApkProvider.grant(c,apk.toFile());String s=uri.toString();
 check(uri.getPathSegments().size()==3&&uri.getPathSegments().get(0).equals("verified"),"new grant restricted prefix");
 check(p.openFile(uri,"r")!=null,"read valid verified URI");check(p.getType(uri).equals("application/vnd.android.package-archive"),"MIME of verified APK");
 String token=uri.getPathSegments().get(1);check(p.openFile(new Uri("content://ls.augment.com.updates/"+token+"/"+name),"r")!=null,"old still-valid grant readable");
 denied(p,s,"rw");denied(p,s.replace(token,"invalid"),"r");denied(p,s.replace("verified/","foreign/"),"r");denied(p,s+"?x=1","r");denied(p,s+"#x","r");
 denied(p,s.replace("ls.augment.com.updates","foreign"),"r");denied(p,s.replace(name,"other.apk"),"r");
 c.getSharedPreferences("update-apk-grants",0).edit().putLong(token+":expires",0).commit();denied(p,s,"r");
 Path outside=Path.of(a[0]).resolve(name);Files.write(outside,new byte[]{1});boolean bad=false;try{UpdateApkProvider.grant(c,outside.toFile());}catch(java.io.FileNotFoundException e){bad=true;}check(bad,"outside cache cannot receive grant");
 UpdateApkProvider.clean(c);check(!c.getSharedPreferences("update-apk-grants",0).getAll().containsKey(token),"expired token metadata pruned");
 Uri live=UpdateApkProvider.grant(c,apk.toFile());check(live.toString().equals(UpdateApkProvider.grant(c,apk.toFile()).toString()),"same file reuses live token");
 Path stale=dir.resolve("download-1234.part");Files.write(stale,new byte[]{3});
 try(UpdateApkProvider.DownloadLease lease=UpdateApkProvider.beginDownload(c,"b".repeat(64),1024)){
  Files.write(lease.temporary.toPath(),new byte[]{4});UpdateApkProvider.clean(c);
  check(!Files.exists(stale)&&lease.temporary.isFile()&&Files.exists(apk),"orphan part removed; download and live grant protected");
  boolean busy=false;try{UpdateApkProvider.beginDownload(c,"c".repeat(64),1);}catch(java.io.IOException e){busy=true;}check(busy,"one in-flight download");
  Files.write(lease.cached.toPath(),new byte[]{4});UpdateApkProvider.grant(c,lease.cached);
 }
 try(UpdateApkProvider.DownloadLease lease=UpdateApkProvider.beginDownload(c,"c".repeat(64),1)){
  check(lease!=null,"third update admitted while two installer grants are alive");
  check(p.openFile(live,"r")!=null,"new download preserves old installer URI");
  check(Files.exists(dir.resolve("verified-"+"b".repeat(64)+".apk")),"second installer package retained");
 }
 for(int i=0;i<100;i++)c.getSharedPreferences("update-apk-grants",0).edit().putString("expired"+i,name).putLong("expired"+i+":expires",0).commit();
 UpdateApkProvider.clean(c);check(c.getSharedPreferences("update-apk-grants",0).getAll().size()==4,"stale grant pairs bounded after sweep");
 for(var entry:c.getSharedPreferences("update-apk-grants",0).getAll().entrySet())if(entry.getKey().endsWith(":expires"))c.getSharedPreferences("update-apk-grants",0).edit().putLong(entry.getKey(),0).commit();
 try(UpdateApkProvider.DownloadLease lease=UpdateApkProvider.beginDownload(c,"c".repeat(64),1024)){check(dir.toFile().listFiles(f->f.getName().endsWith(".apk")).length<=1,"admission makes room within count quota");}
 System.out.println("PASS update APK provider: "+checks+" URI/expiry/read-only/path/cache/lease checks + manifest restrictions");}}
'''
}
with tempfile.TemporaryDirectory(prefix='duo-updates-') as folder:
 p=Path(folder)
 for name,source in sources.items():
  target=p/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(source,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-d',str(p),*map(str,p.rglob('*.java')),str(ROOT/'android/app/src/main/java/ls/augment/com/UpdateApkProvider.java')],check=True)
 subprocess.run(['java','-cp',str(p),'ls.augment.com.TestProvider',str(p/'cache')],check=True)
