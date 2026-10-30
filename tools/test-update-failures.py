"""Actual transfer loop and error classification: HTTP, stream failure, disk errors and successful writes."""
from pathlib import Path
import runpy,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1];SRC=ROOT/'android/app/src/main/java/ls/augment/com'
body=runpy.run_path(str(ROOT/'tools/test-signal-style-editor.py'))['body']
source=(SRC/'AppUpdater.java').read_text(encoding='utf8')
methods='\n'.join(signature+'{'+body(source,signature)+'}' for signature in [
'private void transfer(AppUpdateManifest selected, File destination, int request,DownloadTrace trace) throws Exception',
'private static final class DownloadTrace'])
test=r'''package ls.augment.com;import java.io.*;import java.net.*;import java.nio.file.*;import android.os.SystemClock;
public class TestUpdateFailures {
 static int checks;static void yes(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 HttpURLConnection connection;long received;final Main main=new Main();String mode="ok";int opens;
 static class Main {void post(Runnable r){r.run();}}void updateProgress(){}boolean current(int r){return true;}void requireCurrent(int r){}
 static class AppUpdateManifest {String url="https://github.com/download";long size=3;}
 static class UpdateError extends IOException {UpdateError(String s){super(s);}}
 HttpURLConnection open(String address,boolean download)throws IOException {
  opens++;if(mode.equals("dns"))throw new UnknownHostException("private-host");if(mode.equals("tls"))throw new javax.net.ssl.SSLException("private-host");
  return new HttpURLConnection(new URL(address)) {
   public void disconnect(){}public boolean usingProxy(){return false;}public void connect(){}
   public int getResponseCode(){return mode.equals("http")?503:mode.equals("redirect")?302:200;}
   public String getHeaderField(String name){return "https://release-assets.githubusercontent.com/download?secret=hidden";}
   public long getContentLengthLong(){return 3;}
   public InputStream getInputStream(){return mode.equals("timeout")?new InputStream(){public int read()throws IOException{throw new SocketTimeoutException("private-host");}}:new ByteArrayInputStream(mode.equals("truncated")?new byte[]{1}:new byte[]{1,2,3});}
  };
 }
 /*METHODS*/
 static void category(Throwable e,String stage,String expected){AppUpdateFailure f=AppUpdateFailure.classify(e,stage);yes(f.category.equals(expected),"category "+expected+": "+f.category);yes(!f.userMessage().isBlank(),"actionable message");}
 public static void main(String[]args)throws Exception {
  var h=new TestUpdateFailures();var selected=new AppUpdateManifest();File file=Path.of(args[0],"update.part").toFile();
  for(String mode:new String[]{"dns","tls","timeout","http","redirect","truncated"}){
   h.mode=mode;h.opens=0;var trace=new DownloadTrace();
   try{h.transfer(selected,file,1,trace);throw new AssertionError("accepted "+mode);}catch(IOException e){
    var f=AppUpdateFailure.classify(e,trace.stage);yes(f.category.equals("network"),mode+" separated from disk failure");
    yes(!AppUpdateFailure.trace(e).contains("private-host"),"exception messages do not leak host/path");
    if(mode.equals("http"))yes(f.reason.equals("http_503")&&f.userMessage().contains("503"),"HTTP status preserved");
    if(mode.equals("redirect"))yes(h.opens==6&&f.reason.equals("redirect_limit"),"redirect limit remains bounded");
    if(mode.equals("truncated"))yes(f.reason.equals("response_truncated")&&trace.bytes==1,"partial response distinguished from validation and disk failure");
   }
  }
  h.mode="ok";var trace=new DownloadTrace();h.transfer(selected,file,1,trace);
  yes(Files.readAllBytes(file.toPath()).length==3&&trace.bytes==3,"actual transfer writes and tracks all bytes");
  try{h.transfer(selected,new File(args[0]),1,new DownloadTrace());throw new AssertionError("directory writable as APK");}
  catch(IOException e){category(e,"write","storage");}
  category(new IOException("update_download_busy"),"cache","cache_busy");category(new IOException("update_cache_busy"),"cache","cache_busy");
  category(new FileNotFoundException("Installer grants busy"),"verify","cache_busy");
  category(new IOException("update_cache_cleanup_failed"),"cache","storage");
  category(new IOException("write failed",new android.system.ErrnoException("write",28)),"write","space");
  category(new IOException("permission denied",new android.system.ErrnoException("write",13)),"write","storage");
  try{AppUpdateFailure.requireSpace(2,3);throw new AssertionError("insufficient space admitted");}catch(AppUpdateFailure e){yes(e.category.equals("space"),"preflight disk full");}
  AppUpdateFailure.requireSpace(3,3);AppUpdateFailure.requireSpace(-1,3);yes(true,"exact size admitted and unknown space never misreported as full");
  System.out.println("PASS updater failures: "+checks+" transfer/classification/redaction/budget checks");
 }
}'''.replace('/*METHODS*/',methods)
sources={
'android/os/SystemClock.java':'package android.os;public class SystemClock {public static long elapsedRealtime(){return 1000;}}',
'android/system/ErrnoException.java':'package android.system;public class ErrnoException extends Exception {public final int errno;public ErrnoException(String s,int n){super(s);errno=n;}}',
'android/system/OsConstants.java':'package android.system;public class OsConstants {public static final int ENOSPC=28;}',
'ls/augment/com/TestUpdateFailures.java':test}
jdk=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
with tempfile.TemporaryDirectory(prefix='duo-update-failures-') as folder:
    paths=[str(SRC/'AppUpdateFailure.java'),str(SRC/'AppUpdatePolicy.java')]
    for name,code in sources.items():
        p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(code,encoding='utf8');paths.append(str(p))
    subprocess.run([str(jdk/'javac.exe'),'-encoding','UTF-8','--release','17','-d',folder,*paths],check=True)
    subprocess.run([str(jdk/'java.exe'),'-cp',folder,'ls.augment.com.TestUpdateFailures',folder],check=True)
