"""Exercise the production recorder contract without a phone or recorder side effects."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    'android/content/Intent.java': '''package android.content;public class Intent {
 public String action,pkg,category;public Intent(String a){action=a;}public Intent setPackage(String p){pkg=p;return this;}
 public Intent addCategory(String c){category=c;return this;}}''',
    'android/os/UserManager.java': '''package android.os;public class UserManager {public boolean unlocked;public boolean isUserUnlocked(){return unlocked;}}''',
    'android/content/pm/ServiceInfo.java': '''package android.content.pm;public class ServiceInfo {public boolean enabled=true,exported=true;
 public String packageName="cn.zte.recorder",name="RecorderIntentService",permission;}''',
    'android/content/pm/ResolveInfo.java': '''package android.content.pm;public class ResolveInfo {public ServiceInfo serviceInfo=new ServiceInfo();}''',
    'android/content/pm/PackageManager.java': '''package android.content.pm;import android.content.Intent;public class PackageManager {
 public static final int PERMISSION_GRANTED=0;public int queries;public String missing;public ResolveInfo result=new ResolveInfo();
 public ResolveInfo resolveService(Intent i,int flags){queries++;
 if(flags!=0||!"cn.zte.recorder".equals(i.pkg)||!"recorder.intent.category.RECORDING".equals(i.category))throw new AssertionError("wrong resolution scope");
 return i.action.equals("recorder.intent.action."+missing)?null:result;}}''',
    'android/content/Context.java': '''package android.content;import android.os.*;import android.content.pm.*;public class Context {
 public UserManager users=new UserManager();public PackageManager pm=new PackageManager();public int permission=0;
 public <T>T getSystemService(Class<T> type){return type.cast(users);}public PackageManager getPackageManager(){return pm;}
 public int checkSelfPermission(String p){return permission;}}''',
    'ls/augment/com/hook/TestRecorderActions.java': '''package ls.augment.com.hook;import android.content.Context;
public class TestRecorderActions {
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static void reject(Context c,String reason){try{RecorderActionContract.require(c);throw new AssertionError("accepted missing capability");}
 catch(IllegalStateException e){check(e.getMessage().contains(reason),"specific missing capability: "+e.getMessage());}}
 public static void main(String[] args){
 Context c=new Context();reject(c,"waiting_user_unlock");check(c.pm.queries==0,"locked context not queried");
 c.users.unlocked=true;RecorderActionContract.require(c);check(c.pm.queries==5,"all actions verified after unlock");
 for(String action:new String[]{"SET_TAG","PAUSE","RESUME","STOP","CANCEL"}){c.pm.missing=action;reject(c,"unavailable:"+action);}
 c.pm.missing=null;c.pm.result.serviceInfo.exported=false;reject(c,"unavailable:SET_TAG");c.pm.result.serviceInfo.exported=true;
 c.pm.result.serviceInfo.enabled=false;reject(c,"unavailable:SET_TAG");c.pm.result.serviceInfo.enabled=true;
 c.pm.result.serviceInfo.packageName="unrelated";reject(c,"unavailable:SET_TAG");c.pm.result.serviceInfo.packageName="cn.zte.recorder";
 c.pm.result.serviceInfo.permission="native.permission";c.permission=-1;reject(c,"permission:SET_TAG");c.permission=0;RecorderActionContract.require(c);
 Context other=new Context();reject(other,"waiting_user_unlock");check(other.pm.queries==0,"new locked user cannot inherit readiness");
 c.pm.result.serviceInfo=null;reject(c,"unavailable:SET_TAG");
 System.out.println("Recorder contract: "+checks+" checks, unlock re-probe, all actions, user isolation and missing capabilities passed");
 }}'''
}
with tempfile.TemporaryDirectory(prefix='duo-recorder-contract-') as directory:
    base = Path(directory)
    files = []
    for name, text in SOURCES.items():
        path = base / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf-8')
        files.append(str(path))
    files.append(str(ROOT / 'android/app/src/main/java/ls/augment/com/hook/RecorderActionContract.java'))
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', directory, *files], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', directory, 'ls.augment.com.hook.TestRecorderActions'], check=True)
