"""Exercise OEM capability selection and the production per-SIM read path on a JVM."""
from pathlib import Path
import os
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook'


def method(source, marker):
    start = source.index(marker)
    opening = source.index('{', start)
    depth = 0
    for token in re.finditer(r'//[^\n]*|/\*[\s\S]*?\*/|"(?:\\.|[^"\\])*"|[{}]', source[opening:]):
        if token.group() == '{':
            depth += 1
        elif token.group() == '}':
            depth -= 1
            if not depth:
                return source[start:opening + token.end()]
    raise AssertionError('Unclosed method')


HARNESS = r'''package ls.augment.com.hook;
import com.android.vts.VendorTelephonyManager;
public class NativeSignalLevelRuntimeTest {
 static int checks;
 static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
 public static class SignalStrength {
  int standard=1,old=1;boolean fail;
  public int getLevel(){return standard;}
  public int getOperatorLevel(){if(fail)throw new SecurityException();return old;}
 }
 public static class StrengthChild extends SignalStrength {public int getOperatorLevel(){return 5;}}
 public static class StandardOnly {public int getLevel(){return 3;}}
 public static class BadLegacy {public String getOperatorLevel(){return "4";}}
 public static class MissingVendor {public static MissingVendor getDefault(){return new MissingVendor();}}
 public static class BadVendor {
  public static BadVendor getDefault(){return new BadVendor();}
  public boolean getOperatorLevel(int slot){return true;}
 }
 public static class VendorBase {
  public static VendorBase getDefault(){return new VendorChild();}
  public Integer getOperatorLevel(int slot){return 2;}
 }
 public static class VendorChild extends VendorBase {public Integer getOperatorLevel(int slot){return 4;}}
 public static class WrongSingleton {
  public static Object getDefault(){return new Object();}
  public int getOperatorLevel(int slot){return 5;}
 }
 static class Radio {
  final int slot;int signalBars=5,level,standardLevel,nativeLevel;
  String levelSource,levelError;NativeSignalLevelReader signalLevelReader;
  Radio(int slot,NativeSignalLevelReader reader){this.slot=slot;signalLevelReader=reader;}
  /* READ_LEVEL */
 }
 static void result(NativeSignalLevelReader r,Object strength,int slot,int standard,int bars,int expected,String source,String error){
  NativeSignalLevelReader.Result v=r.read(strength,slot,standard,bars);
  check(v.level==expected,"level: "+v.level+" expected "+expected);
  check(v.source.equals(source),"source: "+v.source+" expected "+source);
  check(v.error.contains(error),"reason: "+v.error+" expected "+error);
 }
 public static void main(String[] args){
  SignalStrength strength=new SignalStrength();
  NativeSignalLevelReader modern=NativeSignalLevelReader.detect(NativeSignalLevelRuntimeTest.class.getClassLoader(),SignalStrength.class);
  check(modern.capabilities.equals("vendor=available;legacy=available"),"both actual runtime APIs discovered");
  Radio sim1=new Radio(0,modern),sim2=new Radio(1,modern);
  sim1.readLevel(strength);sim2.readLevel(strength);
  check(sim1.level==4&&sim2.level==3,"new per-slot provider wins over two stale legacy one-bar values");
  check(VendorTelephonyManager.calls.equals("01"),"calls use physical slots 0 and 1, not reversed subscription IDs 2 and 1");
  check(sim1.nativeLevel==4&&sim1.standardLevel==1&&sim1.levelSource.equals("vendor"),"diagnostics retain standard and selected native levels");
  VendorTelephonyManager.levels[0]=2;sim1.readLevel(strength);
  check(sim1.level==2,"later signal callback reads live provider, never caches an old level");
  VendorTelephonyManager.levels[0]=5;result(modern,strength,0,1,4,4,"vendor","");
  result(modern,strength,-1,3,5,3,"android_fallback","slot_unknown");
  VendorTelephonyManager.missing=true;result(modern,strength,0,3,5,3,"android_fallback","instance_unavailable");
  VendorTelephonyManager.missing=false;result(modern,strength,0,1,5,5,"vendor","");
  VendorTelephonyManager.deny=true;result(modern,strength,0,3,5,3,"android_fallback","SecurityException");
  VendorTelephonyManager.deny=false;
  for(int value:new int[]{-1,6,999}){VendorTelephonyManager.levels[0]=value;result(modern,strength,0,3,5,3,"android_fallback","invalid_level");}
  VendorTelephonyManager.levels[0]=0;result(modern,strength,0,3,5,0,"vendor","");
  sim1.readLevel(null);check(sim1.level==-1&&sim1.standardLevel==-1&&sim1.levelSource.equals("unread"),"missing strength clears previous display");
  NativeSignalLevelReader legacy=new NativeSignalLevelReader(null,SignalStrength.class);
  strength.old=5;result(legacy,strength,0,1,5,5,"operator","");
  result(legacy,new StrengthChild(),1,1,5,5,"operator","");
  strength.fail=true;result(legacy,strength,0,3,5,3,"android_fallback","SecurityException");strength.fail=false;
  strength.old=9;result(legacy,strength,0,3,5,3,"android_fallback","invalid_level");
  result(new NativeSignalLevelReader(null,StandardOnly.class),new StandardOnly(),0,3,5,3,"android","");
  result(new NativeSignalLevelReader(null,BadLegacy.class),new BadLegacy(),0,3,5,3,"android","");
  for(Class<?> type:new Class<?>[]{MissingVendor.class,BadVendor.class}){
   NativeSignalLevelReader r=new NativeSignalLevelReader(type,SignalStrength.class);
   check(r.capabilities.contains("vendor=contract:"),"unknown vendor signature explicitly diagnosed");
   strength.old=2;result(r,strength,0,3,5,2,"operator","");
   result(new NativeSignalLevelReader(type,StandardOnly.class),new StandardOnly(),0,3,5,3,"android","");
  }
  result(new NativeSignalLevelReader(VendorBase.class,SignalStrength.class),strength,1,1,5,4,"vendor","");
  result(new NativeSignalLevelReader(WrongSingleton.class,SignalStrength.class),strength,1,3,5,3,"android_fallback","instance_unavailable");
  NativeSignalLevelReader absent=NativeSignalLevelReader.detect(new ClassLoader(null){},SignalStrength.class);
  strength.old=2;result(absent,strength,0,1,5,2,"operator","");
  check(absent.capabilities.contains("vendor=missing_class"),"older systems retain legacy path with capability reason");
  System.out.println("PASS native signal level runtime: "+checks+" assertions (including production Radio.readLevel)");
 }
}'''

VENDOR = r'''package com.android.vts;
public class VendorTelephonyManager {
 public static int[] levels={4,3};public static String calls="";public static boolean missing,deny;
 public static VendorTelephonyManager getDefault(){return missing?null:new VendorTelephonyManager();}
 public int getOperatorLevel(int slot){calls+=slot;if(deny)throw new SecurityException();return levels[slot];}
}'''

source = (SRC / 'ConnectivityIconSource.java').read_text('utf-8')
assert 'signalLevelReader=NativeSignalLevelReader.detect(context.getClassLoader(),SignalStrength.class)' in source
assert 'levelError=' in source and 'signalLevelReader.capabilities' in source
java_home = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8'))
with tempfile.TemporaryDirectory(prefix='duo-native-signal-') as tmp:
    folder = Path(tmp)
    harness = folder / 'NativeSignalLevelRuntimeTest.java'
    harness.write_text(HARNESS.replace('/* READ_LEVEL */', method(source, 'void readLevel(SignalStrength strength)')), 'utf-8')
    vendor = folder / 'VendorTelephonyManager.java'
    vendor.write_text(VENDOR, 'utf-8')
    subprocess.run([str(java_home / 'bin/javac'), '-encoding', 'UTF-8', '--release', '17', '-d', tmp,
                    str(SRC / 'NativeSignalLevelReader.java'), str(harness), str(vendor)], check=True)
    subprocess.run([str(java_home / 'bin/java'), '-cp', tmp, 'ls.augment.com.hook.NativeSignalLevelRuntimeTest'], check=True, timeout=20)
