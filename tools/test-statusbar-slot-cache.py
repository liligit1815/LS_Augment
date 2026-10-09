"""Run the production slot resolver with the shared reflection cache and live OEM values."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
UI = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/SystemUiHook.java').read_text(encoding='utf-8')
ADAPTER = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/SystemUiAdapter.java').read_text(encoding='utf-8')


def extract(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


HARNESS = r'''import java.util.*;import java.lang.reflect.*;import java.util.concurrent.ConcurrentHashMap;
public class TestSlotCache {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static class View{}
 static class BaseStatusBarIconView extends View {String live="wifi";private String getSlot(){return live;}}
 static class StatusBarIconView extends BaseStatusBarIconView{}
 static class FieldStatusIconView extends View {private String mSlot="mobile";}
 static class AlternateIconView extends View {private String slot="bluetooth";}
 static class ThrowingIconView extends View {private String mSlot="fallback";private String getSlot(){throw new IllegalStateException("OEM getter unavailable");}}
 static class MissingIconView extends View{}
 static class UnrelatedView extends View {int calls;private String getSlot(){calls++;return "wifi";}}
 static class SystemUiAdapter {
  // ACCESSORS
  // TYPE
  // FIELD
  // OPTIONAL
 }
 // RESOLVE
 // CLEAN
 public static void main(String[] args)throws Exception {
  StatusBarIconView method=new StatusBarIconView();FieldStatusIconView field=new FieldStatusIconView();AlternateIconView alternate=new AlternateIconView();
  check("wifi".equals(slotOf(method)),"private inherited OEM getter is resolved");
  check("mobile".equals(slotOf(field)),"private mSlot fallback is resolved");check("bluetooth".equals(slotOf(alternate)),"alternate slot field is resolved");
  check("fallback".equals(slotOf(new ThrowingIconView())),"getter failure retains field fallback");
  UnrelatedView unrelated=new UnrelatedView();check(slotOf(unrelated)==null&&unrelated.calls==0,"unrelated views retain the existing eligibility gate");
  MissingIconView missing=new MissingIconView();for(int i=0;i<1000;i++){method.live="slot:"+i;field.mSlot="field-"+i;alternate.slot="alt_"+i;
   check(method.live.equals(slotOf(method)),"cached method reads the current native slot");check(field.mSlot.equals(slotOf(field)),"cached mSlot reads the current field");check(alternate.slot.equals(slotOf(alternate)),"cached alternate field reads the current value");check(slotOf(missing)==null,"known-absent OEM getters/fields stay absent without exceptions");}
  Random random=new Random(20496);for(int i=0;i<5000;i++){StringBuilder value=new StringBuilder();for(int n=random.nextInt(90);n>0;n--)value.append((char)random.nextInt(128));
   String input=value.toString(),old=input.trim().replace(',', '_').replace(';', '_');String expected=old.matches("[A-Za-z0-9_.:-]{1,80}")?old:null;
   check(Objects.equals(expected,cleanSlot(input)),"slot sanitizer remains compatible with prior native identifiers");}
  method.live=null;check(slotOf(method)==null,"a live getter value becoming null is not stale");method.live=" wifi;mobile,1 ";check("wifi_mobile_1".equals(slotOf(method)),"slot normalization remains compatible");
  System.out.println("Status-bar cached live slot resolver: "+checks+" assertions passed");
 }
}'''

generated = HARNESS
for marker, member in {
    '// ACCESSORS': extract(ADAPTER, 'private static final ClassValue<Accessors> ACCESSORS') + ';',
    '// TYPE': extract(ADAPTER, 'private static final class Accessors'),
    '// FIELD': extract(ADAPTER, 'static Object field('),
    '// OPTIONAL': extract(ADAPTER, 'static Object callIfPresent('),
    '// RESOLVE': extract(UI, 'static String slotOf('),
    '// CLEAN': extract(UI, 'private static String cleanSlot('),
}.items():
    generated = generated.replace(marker, member)
with tempfile.TemporaryDirectory(prefix='duo-slot-cache-') as tmp:
    path = Path(tmp) / 'TestSlotCache.java'
    path.write_text(generated, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '--release', '17', '-d', tmp, str(path)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestSlotCache'], check=True, timeout=20)
