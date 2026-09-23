"""Host tests execute production stores; Android stubs model memory-before-disk failure.

No device, root executable, installation, provider call or Global setting is used.
Provider tests compile its actual entry prefix and allowedCaller method, excluding
unrelated routes. This verifies policy ordering, not Android Binder integration.
"""
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "outputs/native-fixes/runtime-store-tests"
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
STUBS = {
    "android/content/SharedPreferences.java": """package android.content;
import java.util.Map;
public interface SharedPreferences {
 Map<String,?> getAll(); String getString(String k,String d); boolean getBoolean(String k,boolean d);
 int getInt(String k,int d); long getLong(String k,long d); Editor edit();
 interface Editor { Editor putString(String k,String v); Editor putBoolean(String k,boolean v);
 Editor putInt(String k,int v); Editor putLong(String k,long v); Editor putFloat(String k,float v);
 Editor clear(); boolean commit(); }
}""",
    "android/content/Context.java": """package android.content;
public abstract class Context {
 private final android.content.pm.PackageManager packages = new android.content.pm.PackageManager();
 public abstract SharedPreferences getSharedPreferences(String name,int mode);
 public abstract ContentResolver getContentResolver();
 public android.content.pm.PackageManager getPackageManager(){return packages;}
}""",
    "android/content/ContentResolver.java": """package android.content;
public class ContentResolver { public int notifications;
 public void notifyChange(android.net.Uri uri,Object observer){notifications++;} }
""",
    "android/content/pm/PackageManager.java": """package android.content.pm;
public class PackageManager { public final java.util.Map<Integer,String[]> packages=new java.util.HashMap<>();
 public String[] getPackagesForUid(int uid){return packages.get(uid);} }
""",
    "android/net/Uri.java": """package android.net;
public class Uri { public static Uri parse(String value){return new Uri();} }
""",
    "android/os/Bundle.java": """package android.os;
public class Bundle { private final java.util.Map<String,Object> data=new java.util.HashMap<>();
 public void putBoolean(String k,boolean v){data.put(k,v);} public boolean getBoolean(String k){return getBoolean(k,false);}
 public boolean getBoolean(String k,boolean d){Object v=data.get(k);return v instanceof Boolean?(Boolean)v:d;}
 public void putString(String k,String v){data.put(k,v);} public String getString(String k){return getString(k,null);}
 public String getString(String k,String d){Object v=data.get(k);return v instanceof String?(String)v:d;}
 public void putInt(String k,int v){data.put(k,v);} public int getInt(String k){return getInt(k,0);}
 public int getInt(String k,int d){Object v=data.get(k);return v instanceof Integer?(Integer)v:d;}
 public void putLong(String k,long v){data.put(k,v);} public long getLong(String k){Object v=data.get(k);return v instanceof Long?(Long)v:0;}
} """,
    "android/os/Binder.java": """package android.os;
public class Binder { public static int uid=12000,clears,restores;
 public static int getCallingUid(){return uid;} public static long clearCallingIdentity(){clears++;int old=uid;uid=Process.myUid();return old;}
 public static void restoreCallingIdentity(long old){restores++;uid=(int)old;} }
""",
    "android/os/Process.java": """package android.os;
public class Process { public static final int SYSTEM_UID=1000,ROOT_UID=0;public static int myUid(){return 10055;} }
""",
    "ls/augment/com/RootShell.java": """package ls.augment.com;
final class RootShell { static Result next=new Result(0,"null\\nnull\\nnull",false);static int calls;
 static Result run(String c,String i,long t,int m){calls++;return next;}
 static final class Result { final int exitCode;final String output;final boolean timedOut;
 Result(int code,String out,boolean timeout){exitCode=code;output=out;timedOut=timeout;}
 boolean isSuccess(){return exitCode==0&&!timedOut;} }
}""",
    "ls/augment/com/FrameworkConfigSync.java": """package ls.augment.com;
final class FrameworkConfigSync { static int requests;static void request(){requests++;} }
""",
    "ls/augment/com/BootJobService.java": """package ls.augment.com;
final class BootJobService { static int requests;static boolean accepted=true;
 static boolean scheduleHiddenRefresh(android.content.Context context){
 if(android.os.Binder.getCallingUid()!=android.os.Process.myUid())throw new AssertionError("recovery scheduled before identity clear");
 requests++;return accepted;} }
""",
    "ls/augment/com/BuildConfig.java": """package ls.augment.com;
final class BuildConfig { static boolean DEBUG=true; }
""",
    "ls/augment/com/HookTargetRegistry.java": """package ls.augment.com;
final class HookTargetRegistry { static boolean contains(String name){return "com.android.systemui".equals(name);} }
""",
}

provider = (SRC / "LSConfigProvider.java").read_text(encoding="utf-8")
call_start = provider.index("        Bundle result = new Bundle();", provider.index("public Bundle call("))
call_end = provider.index("        if (ShoulderQuickSwitchPolicy.CALL", call_start)
prefix = provider[call_start:call_end]
assert prefix.index("!allowedCaller()") < prefix.index('"runtime_snapshot"')
crash_prefix = prefix.split('if ("crash_fuse".equals(method))', 1)[1]
assert crash_prefix.index("Binder.getCallingUid() != Process.SYSTEM_UID") < crash_prefix.index("Binder.clearCallingIdentity()")
recovery_prefix = prefix.split('if ("recovery_refresh".equals(method))', 1)[1].split('if (!allowedCaller())', 1)[0]
assert recovery_prefix.index("Binder.getCallingUid() != Process.ROOT_UID") < recovery_prefix.index("Binder.clearCallingIdentity()")
gate_start = provider.index("    private boolean allowedCaller()")
gate_end = provider.index("    private Bundle recordRapidRoute", gate_start)
gate = provider[gate_start:gate_end]
STUBS["ls/augment/com/ProviderEntry.java"] = """package ls.augment.com;
import android.content.Context;import android.os.Bundle;import android.os.Binder;import android.os.Process;
final class ProviderEntry { private final Context context;ProviderEntry(Context c){context=c;}Context getContext(){return context;}
public Bundle call(String method,String arg,Bundle extras){
""" + prefix + "return result;}\n" + gate + "}\n"

files = []
for relative, content in STUBS.items():
    path = OUT / "src" / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")
    files.append(path)
classes = OUT / "classes"
classes.mkdir(parents=True, exist_ok=True)
files += [SRC / name for name in ("DurablePreferences.java", "RuntimeStateStore.java", "CrashFuseStore.java", "RemoteConfig.java")]
files += [ROOT / "tools" / name for name in ("TestRuntimeStores.java", "TestProviderEntry.java")]
subprocess.run(["javac", "-encoding", "UTF-8", "--release", "17", "-d", str(classes), *map(str, files)], check=True)
cases = ("runtime_success", "runtime_failed_retry", "runtime_failed_snapshot", "runtime_idempotent",
         "fuse_unmigrated", "fuse_failed_reset", "fuse_failed_migration", "fuse_bad_migration",
         "fuse_third_crash", "fuse_failed_arm", "fuse_stable", "fuse_repeated_session",
         "fuse_failed_counter", "durable_failed_key_leak", "runtime_cold_reload", "fuse_cold_reload")
if '--provider-only' in sys.argv:
    cases = ()
failed = []
for case in cases:
    result = subprocess.run(["java", "-cp", str(classes), "ls.augment.com.TestRuntimeStores", case], check=False)
    if result.returncode:
        failed.append(case)
result = subprocess.run(["java", "-cp", str(classes), "ls.augment.com.TestProviderEntry"], check=False)
if result.returncode:
    failed.append("provider_entry")
if cases:
    print(f"Runtime store scenarios: {len(cases) - len([x for x in failed if x != 'provider_entry'])}/{len(cases)} passed")
if failed:
    raise SystemExit("Failed: " + ", ".join(failed))
