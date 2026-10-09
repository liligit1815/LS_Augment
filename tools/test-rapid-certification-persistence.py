"""Exercise production certification across app upgrades and real identity changes."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
STUBS = {
    'android/content/Context.java': '''package android.content; public class Context {
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
}''',
    'android/content/pm/PackageInfo.java': '''package android.content.pm; public class PackageInfo {
 public String versionName; public long version; public long getLongVersionCode(){return version;}
}''',
    'android/content/pm/PackageManager.java': '''package android.content.pm; public class PackageManager {
 public static class NameNotFoundException extends Exception {}
 public static String gameSpace="space",gameAssist="assist";public static long spaceVersion=1,assistVersion=2;
 public PackageInfo getPackageInfo(String name,int flags)throws NameNotFoundException {
  PackageInfo info=new PackageInfo();boolean space=name.equals("cn.nubia.gamelauncher");
  info.versionName=space?gameSpace:gameAssist;info.version=space?spaceVersion:assistVersion;return info;
 }
}''',
    'android/os/Build.java': '''package android.os; public class Build {
 public static String ID="id",FINGERPRINT="rom";public static String[] SUPPORTED_ABIS={"arm64-v8a"};
 public static class VERSION {public static int SDK_INT=36;public static String RELEASE="16",SECURITY_PATCH="2026-09";}
}''',
    'android/os/SystemClock.java': '''package android.os; public class SystemClock {
 public static long elapsedRealtime(){return System.nanoTime()/1000000;}
}''',
    'ls/augment/com/BuildConfig.java': '''package ls.augment.com; public class BuildConfig {
 public static String VERSION_NAME="2.0.0-alpha1-test20439";
}''',
    'ls/augment/com/ConfigSchema.java': 'package ls.augment.com; public class ConfigSchema {public static int VERSION=1;}',
    'ls/augment/com/RapidFireNativeLayout.java': '''package ls.augment.com; public class RapidFireNativeLayout {
 public static final String PROFILE="arm64_tgk_split_phase_v1";public static Object inspectFile(java.io.File file){return null;}
}''',
    'ls/augment/com/TestRapidCertificationPersistence.java': r'''package ls.augment.com;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.lang.reflect.Field;

public class TestRapidCertificationPersistence {
 static final String NATIVE="1".repeat(64);
 static final String ENV="sdk=36|release=16|security=2026-09|buildId=id|fingerprint=rom|abi=arm64-v8a"
  +"|gamespace=space:1|gameassist=assist:2|inputreader="+NATIVE
  +"|symbol=android::EventProducer::updateTgkRapidFireData(int)/v1";
 static int checks;
 static void yes(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static void field(String name,Object value)throws Exception {
  Field field=RapidFireCompatibility.class.getDeclaredField(name);field.setAccessible(true);field.set(null,value);
 }
 static String current()throws Exception {
  field("cachedFingerprintAt",0L);return RapidFireCompatibility.currentFingerprint(new Context());
 }
 static String sha(String text)throws Exception {
  byte[] bytes=MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8));
  StringBuilder out=new StringBuilder();for(byte value:bytes)out.append(String.format("%02x",value&255));return out.toString();
 }
 static RapidFireCompatibility.Token token(String fingerprint){
  return RapidFireCompatibility.Token.issue(fingerprint,10,20,30,11,21,31,1750000000000L);
 }
 static RapidFireCompatibility.Token legacy(int version)throws Exception {
  return token(sha(ENV+"|module=2.0.0-alpha1-test"+version+"|schema=1"));
 }
 static RapidFireCompatibility.Token roundtrip(RapidFireCompatibility.Token token){
  RapidFireCompatibility.Token parsed=RapidFireCompatibility.Token.parse(token.serialize());
  yes(parsed!=null&&parsed.serialize().equals(token.serialize()),"credential remains byte-for-byte unchanged");
  return parsed;
 }
 interface Change {void run()throws Exception;}
 static void changed(String name,Change mutate,Change restore)throws Exception {
  RapidFireCompatibility.Token stable=token(sha(ENV+"|shoulderCompatibility=1")), old=legacy(20438);
  mutate.run();String next=current();
  yes(!stable.validFor(next),name+" invalidates stable certificate");
  yes(!old.validFor(next),name+" cannot migrate legacy certificate");
  restore.run();yes(stable.validFor(current()),name+" restoring certified environment restores validity");
 }
 public static void main(String[] args)throws Exception {
  field("cachedNativeHash",NATIVE);String identity=current();
  if(RapidFireCompatibility.COMPATIBILITY_REVISION!=1){
   yes(!token(sha(ENV+"|shoulderCompatibility=1")).validFor(identity),"new contract requires a new test");
   for(int version:new int[]{20354,20378,20438,20439})
    yes(!legacy(version).validFor(identity),"new contract cannot reuse a legacy alias");
   yes(token(identity).validFor(identity),"fresh certification accepts new contract");
  } else {
   yes(identity.equals(sha(ENV+"|shoulderCompatibility=1")),"environment plus shoulder contract identity");
   RapidFireCompatibility.Token stable=roundtrip(token(identity));
   for(int version=20354;version<=20439;version++)
    yes(roundtrip(legacy(version)).validFor(identity),"audited legacy build retained: "+version);
   yes(!legacy(20353).validFor(identity)&&!legacy(20440).validFor(identity),"legacy range is frozen and bounded");
   yes(!token(sha(ENV+"|module=2.0.0-alpha1-test20439|schema=2")).validFor(identity),"unrecognized legacy schema rejected");
   for(String version:new String[]{"2.0.0-alpha1-test20440","2.1.0","3.0.0"}){
    BuildConfig.VERSION_NAME=version;ConfigSchema.VERSION++;
    yes(current().equals(identity)&&stable.validFor(current())&&legacy(20438).validFor(current()),
     "app/config upgrades retain both certifications: "+version);
   }
   changed("SDK",()->Build.VERSION.SDK_INT++,()->Build.VERSION.SDK_INT=36);
   changed("system release",()->Build.VERSION.RELEASE="17",()->Build.VERSION.RELEASE="16");
   changed("security patch",()->Build.VERSION.SECURITY_PATCH="2026-10",()->Build.VERSION.SECURITY_PATCH="2026-09");
   changed("build ID",()->Build.ID="other",()->Build.ID="id");
   changed("ROM fingerprint",()->Build.FINGERPRINT="other",()->Build.FINGERPRINT="rom");
   changed("ABI",()->Build.SUPPORTED_ABIS=new String[]{"x86_64"},()->Build.SUPPORTED_ABIS=new String[]{"arm64-v8a"});
   changed("GameSpace name",()->PackageManager.gameSpace="new",()->PackageManager.gameSpace="space");
   changed("GameSpace version",()->PackageManager.spaceVersion++,()->PackageManager.spaceVersion=1);
   changed("GameAssist name",()->PackageManager.gameAssist="new",()->PackageManager.gameAssist="assist");
   changed("GameAssist version",()->PackageManager.assistVersion++,()->PackageManager.assistVersion=2);
   changed("system native library",()->field("cachedNativeHash","2".repeat(64)),()->field("cachedNativeHash",NATIVE));
   yes(!stable.validFor("")&&!legacy(20438).validFor("")&&!stable.validFor(null),"unavailable identity remains locked");
   yes(RapidFireCompatibility.Token.parse("")==null,"untested state cannot become certified");
   String encoded=stable.serialize();
   yes(RapidFireCompatibility.Token.parse(encoded.substring(0,encoded.length()-1)+"x")==null,"damaged token rejected");
   yes(stable.physicalLeft==10&&stable.systemRight==31&&stable.passedAt==1750000000000L,"mappings and original test time preserved");
   RapidFireCompatibility.Session pending=RapidFireCompatibility.Session.start(legacy(20438).fingerprint,1750000000000L);
   yes(!pending.validFor(identity),"unfinished old sessions do not inherit completed-token migration");
  }
  System.out.println("PASS certification persistence revision "+RapidFireCompatibility.COMPATIBILITY_REVISION+": "+checks+" checks");
 }
}''',
}

with tempfile.TemporaryDirectory(prefix='duo-rapid-certification-') as temp:
    for revision in (1, 2):
        work = Path(temp) / str(revision)
        for name, source in STUBS.items():
            target = work / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(source, encoding='utf-8')
        for name in ('RapidFireCompatibility', 'RapidFireLifecyclePolicy'):
            source = (JAVA / (name + '.java')).read_text(encoding='utf-8')
            if revision == 2 and name == 'RapidFireCompatibility':
                assert 'COMPATIBILITY_REVISION = 1;' in source
                source = source.replace('COMPATIBILITY_REVISION = 1;', 'COMPATIBILITY_REVISION = 2;')
            (work / 'ls/augment/com' / (name + '.java')).write_text(source, encoding='utf-8')
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(work)] +
                       [str(path) for path in work.rglob('*.java')], check=True)
        subprocess.run(['java', '-cp', str(work), 'ls.augment.com.TestRapidCertificationPersistence'], check=True)
