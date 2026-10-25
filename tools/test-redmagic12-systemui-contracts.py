"""Execute production reflection adapters against old/new/subclass/unknown OEM contracts."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOK = ROOT / 'android/app/src/main/java/ls/augment/com/hook'


def extract(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


grid = (HOOK / 'StatusBarGridHook.java').read_text(encoding='utf-8')
stack = (HOOK / 'NotificationStackHook.java').read_text(encoding='utf-8')
adapters = '\n'.join([
    extract(grid, 'private static final class NotificationCapacity'),
    extract(grid, 'private static Method find('),
    extract(stack, 'private static final class AlphaAccess'),
    extract(stack, 'private static final class EntryAccess'),
    extract(stack, 'private static final class GapAccess'),
    extract(stack, 'private static Method method('),
])
harness = r'''
package ls.augment.com.hook;
import java.lang.reflect.*;
public class TestContracts {
 // ADAPTERS
 static int checks;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 interface Checked {void run()throws Exception;}
 static void rejected(Checked work,String message)throws Exception{
  try{work.run();throw new AssertionError(message);}catch(ReflectiveOperationException expected){checks++;}
 }
 static class LegacyIcons {private int mMaxIcons=3,mActualLayoutWidth=120,mSpeedBumpIndex=2;void calculateIconXTranslations(){}}
 static class LegacyChild extends LegacyIcons {}
 static class ModernIcons {private int mMaxIcons=4,mActualLayoutWidth=150;void calculateIconXTranslations(){}boolean shouldForceOverflow(int n,float amount,int max){return n>=max&&amount>0;}}
 static class ModernChild extends ModernIcons {}
 static class MissingOverflow {int mMaxIcons=4,mActualLayoutWidth=120;void calculateIconXTranslations(){}}
 static class WrongField extends ModernIcons {String mSpeedBumpIndex="unknown";}
 static class WrongResult {int mMaxIcons,mActualLayoutWidth;void calculateIconXTranslations(){}int shouldForceOverflow(int n,float f,int max){return 1;}}
 static void icons(Object target)throws Exception{
  NotificationCapacity a=new NotificationCapacity(target.getClass());int[] before=a.snapshot(target);
  try{a.apply(target,12,500);int[] now=a.snapshot(target);check(now[0]==12&&now[1]==500,"expanded count and width reach native algorithm");
   if(a.speedBump!=null)check(now[2]==-1,"legacy speed bump temporarily cleared");
   throw new IllegalStateException("native calculation failed");
  }catch(IllegalStateException expected){}finally{a.restore(target,before);}
  check(java.util.Arrays.equals(before,a.snapshot(target)),"native fields restored even on failure");
 }
 static class LegacyAlpha {float value=.65f;public float getAlpha(){return value;}public void setAlpha(float v){value=v;}}
 static class ModernAlpha {float value=.35f;String reason="native animation";public float getAlpha(){return value;}public String getAlphaReason(){return reason;}public void setAlpha(float v,String r){if(!Float.isFinite(v))return;value=v;reason=r;}}
 static class ModernAlphaChild extends ModernAlpha {}
 static class MissingReason {float getAlpha(){return 1f;}void setAlpha(float v,String r){}}
 static class WrongAlpha {double getAlpha(){return 1;}void setAlpha(float v){}}
 static void alpha(Object target)throws Exception{
  AlphaAccess a=new AlphaAccess(target.getClass());float before=a.get(target);String reason=a.reason(target);
  a.set(target,0f,AlphaAccess.OWNED_REASON);check(a.get(target)==0f&&a.ownedZero(target),"hidden target alpha goes through native setter");
  if(a.reason!=null){check(AlphaAccess.OWNED_REASON.equals(a.reason(target)),"new API receives diagnostic reason");a.set(target,0f,"new native animation");check(!a.ownedZero(target),"cleanup cannot overwrite a newer native zero-alpha reason");}
  a.set(target,before,reason);check(a.get(target)==before&&java.util.Objects.equals(reason,a.reason(target)),"alpha and native reason restored together");
 }
 public static class Pipeline {}
 public interface AdapterInterface {}
 public static class LegacyRow {final Pipeline entry=new Pipeline();public Pipeline getEntry(){return entry;}}
 public static class ModernRow {public AdapterInterface entry=new com.android.systemui.statusbar.notification.collection.NotificationEntryAdapter();public AdapterInterface getEntryAdapter(){return entry;}}
 public static class ModernRowChild extends ModernRow {}
 static class WrongEntry {public String getEntry(){return "wrong";}}
 static class View {boolean groupingDisabled;}
 static class Provider {}
 static class OldGaps {float getGapForLocation(float f,boolean keyguard){return keyguard?8:4;}boolean childNeedsGapHeight(Provider p,int i,View child,View previous){return i>0;}}
 static class NewGaps {int calls;Object seenProvider;View seenChild;float getGapHeightForChild(Provider p,int i,View child,View previous,float f,boolean keyguard){calls++;seenProvider=p;seenChild=child;return i==0?0:child.groupingDisabled?20:5+f;}}
 static class NewGapChild extends NewGaps {}
 public static void main(String[] args)throws Exception{
  icons(new LegacyIcons());icons(new LegacyChild());icons(new ModernIcons());icons(new ModernChild());
  rejected(()->new NotificationCapacity(MissingOverflow.class),"unknown overflow must not install");
  rejected(()->new NotificationCapacity(WrongField.class),"wrong field type must not be ignored");
  rejected(()->new NotificationCapacity(WrongResult.class),"wrong method return type must not install");
  alpha(new LegacyAlpha());alpha(new ModernAlpha());alpha(new ModernAlphaChild());
  rejected(()->new AlphaAccess(MissingReason.class),"cannot discard native alpha reason");
  rejected(()->new AlphaAccess(WrongAlpha.class),"alpha type mismatch must not install");
  ClassLoader loader=TestContracts.class.getClassLoader();LegacyRow old=new LegacyRow();EntryAccess a=new EntryAccess(old.getClass(),Pipeline.class,loader);
  check(a.get(old)==old.entry,"legacy pipeline identity unchanged");
  for(ModernRow row:new ModernRow[]{new ModernRow(),new ModernRowChild()}){
   a=new EntryAccess(row.getClass(),Pipeline.class,loader);Object entry=a.get(row);check(entry==a.get(row)&&entry instanceof Pipeline,"adapter retains exact pipeline identity");
   check(a.nativeContainerKey(row)==null,"ordinary adapter is not a Bundle");
   row.entry=new com.android.systemui.statusbar.notification.collection.BundleEntryAdapter(row);
   check("bundle".equals(a.nativeContainerKey(row)),"Bundle row and subclass retain exact native identity");
   row.entry=new AdapterInterface(){};
   try{a.get(row);throw new AssertionError("unknown bundle must preserve native list");}catch(IllegalStateException expected){checks++;}
   try{a.nativeContainerKey(row);throw new AssertionError("unknown adapter accepted as Bundle");}catch(IllegalStateException expected){checks++;}
  }
  rejected(()->new EntryAccess(WrongEntry.class,Pipeline.class,loader),"non-pipeline entry rejected");
  Provider provider=new Provider();View child=new View(),previous=new View();OldGaps oldGap=new OldGaps();GapAccess gaps=new GapAccess(OldGaps.class,Provider.class);
  check(gaps.get(oldGap,provider,0,child,previous,.3f,true)==0,"first row has no section gap");
  check(gaps.get(oldGap,provider,1,child,previous,.3f,true)==8,"old lockscreen gap preserved");
  NewGapChild next=new NewGapChild();gaps=new GapAccess(next.getClass(),Provider.class);
  check(gaps.get(next,provider,1,child,previous,.5f,false)==5.5f,"new gap uses native fraction");
  child.groupingDisabled=true;check(gaps.get(next,provider,1,child,previous,.5f,false)==20,"per-row grouping state remains native");
  check(next.calls==2&&next.seenProvider==provider&&next.seenChild==child,"no fabricated provider or repeated native call");
  rejected(()->new GapAccess(Object.class,Provider.class),"unknown gap remains native");
  System.out.println("PASS SystemUI compatibility contracts: "+checks+" assertions");
 }
}
'''.replace('// ADAPTERS', adapters)

files = {
    'ls/augment/com/hook/TestContracts.java': harness,
    'com/android/systemui/statusbar/notification/collection/NotificationEntryAdapter.java': '''
package com.android.systemui.statusbar.notification.collection;
import ls.augment.com.hook.TestContracts;
public class NotificationEntryAdapter implements TestContracts.AdapterInterface {
 private final TestContracts.Pipeline entry=new TestContracts.Pipeline();
 public TestContracts.Pipeline getEntry(){return entry;}
}''',
}
files['com/android/systemui/statusbar/notification/collection/BundleEntry.java']='''
package com.android.systemui.statusbar.notification.collection;import ls.augment.com.hook.TestContracts;
public class BundleEntry extends TestContracts.Pipeline {public TestContracts.ModernRow row;public String getKey(){return "bundle";}public TestContracts.ModernRow getRow(){return row;}}
'''
files['com/android/systemui/statusbar/notification/collection/BundleEntryAdapter.java']='''
package com.android.systemui.statusbar.notification.collection;import ls.augment.com.hook.TestContracts;
public class BundleEntryAdapter implements TestContracts.AdapterInterface {final BundleEntry entry=new BundleEntry();public BundleEntryAdapter(TestContracts.ModernRow r){entry.row=r;}
public BundleEntry getEntry(){return entry;}public String getKey(){return entry.getKey();}public boolean isBundle(){return true;}public TestContracts.ModernRow getRow(){return entry.row;}}
'''
java = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='duo-systemui-contracts-') as folder:
    paths = []
    for name, source in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        paths.append(str(path))
    subprocess.run([str(java / 'javac'), '-encoding', 'UTF-8', '-d', folder, *paths], check=True)
    subprocess.run([str(java / 'java'), '-cp', folder, 'ls.augment.com.hook.TestContracts'], check=True)
