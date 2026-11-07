"""Exercise the real picker fallback when the optional OEM adaptor is absent."""
from pathlib import Path
import runpy
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = dict(runpy.run_path(str(ROOT / 'tools/test-screen-timeout-runtime.py'))['FILES'])
FILES['ls/augment/com/hook/OemHooks.java'] = FILES['ls/augment/com/hook/OemHooks.java'].replace(
    'if(n.equals("setDefaultTimeValue")&&!guardAvailable)return 0;',
    'if(n.equals("getInitialValuesLength")||n.equals("setDefaultTimeValue")&&!guardAvailable)return 0;')
FILES.update({
    'com/android/settingslib/widget/CandidateInfo.java': '''package com.android.settingslib.widget;
public abstract class CandidateInfo {final boolean enabled;protected CandidateInfo(boolean e){enabled=e;}
public boolean isEnabled(){return enabled;}public abstract String getKey();public abstract CharSequence loadLabel();}''',
    'com/android/settings/display/ScreenTimeoutSettings.java': '''package com.android.settings.display;
import android.content.Context;import android.content.res.Resources;import java.util.*;import ls.augment.com.hook.OemHooks;
import com.android.settingslib.widget.CandidateInfo;
public class ScreenTimeoutSettings {
 public final Context mContext=new Context();private CharSequence[] mInitialEntries=Resources.LABELS.clone(),mInitialValues=Resources.VALUES.clone();
 public long maximum=Long.MAX_VALUE;public boolean disabled,unknown,partial,full,failMaximum;public List<CandidateInfo> original;
 private Long getMaxScreenTimeout(Context c){if(failMaximum)throw new IllegalStateException("policy unavailable");return maximum;}
 public void arrays(CharSequence[] e,CharSequence[] v){mInitialEntries=e;mInitialValues=v;}
 protected List<CandidateInfo> getCandidates(){return (List<CandidateInfo>)OemHooks.call(this,"getCandidates",new Object[0],()->{
  ArrayList<CandidateInfo> out=new ArrayList<>();int length=full?8:6;
  for(int i=partial?1:0;i<length;i++)if(Long.parseLong(Resources.VALUES[i].toString())<=maximum)
   out.add(unknown?new Unknown(Resources.VALUES[i].toString()):new Renamed(Resources.LABELS[i],Resources.VALUES[i].toString(),!disabled));
  original=Collections.unmodifiableList(out);return original;});}
 public List<CandidateInfo> rows(){return getCandidates();}
 // The fallback must use the runtime row class, not a hardcoded nested name.
 public static class Renamed extends CandidateInfo {private final CharSequence label;private final String key;
  private Renamed(CharSequence l,String k,boolean e){super(e);label=l;key=k;}public String getKey(){return key;}public CharSequence loadLabel(){return label;}}
 public static class Unknown extends CandidateInfo {private final String key;Unknown(String k){super(true);key=k;}public String getKey(){return key;}public CharSequence loadLabel(){return key;}}
}''',
    'ls/augment/com/hook/TestScreenTimeoutPicker.java': '''package ls.augment.com.hook;
import com.android.settings.display.*;import android.content.res.Resources;
public class TestScreenTimeoutPicker {
 static int checks;static void yes(boolean v,String s){checks++;if(!v)throw new AssertionError(s);}
 static class Child extends ScreenTimeoutSettings {}
 static class MissingModule extends AugmentModule {int errors;public void logFeatureError(String s,Throwable e){errors++;}}
 public static void main(String[] args)throws Exception {
  AugmentModule module=new AugmentModule();ClassLoader loader=TestScreenTimeoutPicker.class.getClassLoader();
  yes(ScreenTimeoutHook.install(module,loader)==2,"missing adaptor installs guard and native picker");
  ScreenTimeoutSettings picker=new ScreenTimeoutSettings();FeatureSettings.enabled=false;
  yes(picker.rows().size()==6,"disabled retains native six choices");FeatureSettings.enabled=true;
  var rows=picker.rows();yes(rows.size()==8&&picker.original.size()==6,"append extended choices without mutating native list");
  yes(rows.get(6).getKey().equals("1800000")&&rows.get(6).loadLabel().equals("30分钟"),"native label and 30min value retained");
  yes(rows.get(7).getKey().equals("2147483647")&&rows.get(7).loadLabel().equals("从不"),"native never choice retained");
  yes(rows.get(6).getClass()==rows.get(0).getClass(),"uses actual renamed native candidate class");
  for(int i=0;i<6;i++)yes(rows.get(i)==picker.original.get(i),"existing row identity retained");
  yes(picker.rows().size()==8,"repeated refresh never duplicates additions");
  yes(new Child().rows().size()==8,"inherited picker fields and behavior supported");
  picker.full=true;yes(picker.rows()==picker.original,"already extended native list untouched");picker.full=false;
  picker.maximum=1800000;yes(picker.rows().size()==7,"exact admin limit keeps 30min and removes never");
  picker.maximum=600000;yes(picker.rows()==picker.original&&picker.original.size()==6,"ten-minute admin limit preserved");
  picker.maximum=1;yes(picker.rows()==picker.original&&picker.original.isEmpty(),"empty policy-filtered list unchanged");picker.maximum=Long.MAX_VALUE;
  picker.disabled=true;yes(picker.rows()==picker.original,"disabled native rows cannot gain enabled choices");picker.disabled=false;
  picker.partial=true;yes(picker.rows()==picker.original,"unknown filtering remains native");picker.partial=false;
  picker.unknown=true;yes(picker.rows()==picker.original,"unknown row constructor fails closed");picker.unknown=false;
  picker.failMaximum=true;yes(picker.rows()==picker.original,"unreadable policy remains native");picker.failMaximum=false;
  Resources.missing=true;yes(picker.rows()==picker.original,"missing resources cannot invent choices");Resources.missing=false;
  picker.arrays(new CharSequence[]{"30min"},new CharSequence[]{"1800000"});yes(picker.rows()==picker.original,"picker and parent resource mismatch rejected");
  picker.arrays(null,null);yes(picker.rows()==picker.original,"missing arrays rejected");
  for(long value:new long[]{1800000,Integer.MAX_VALUE}){
   var c=new ScreenTimeoutPreferenceController(new android.content.Context());c.mContext.resolver.value=value;c.updateState(null);c.updateState(null);
   yes(c.mContext.resolver.value==value&&c.mContext.resolver.writes==0,"newly exposed value survives repeated parent refresh");}
  OemHooks.hooks.clear();OemHooks.guardAvailable=false;yes(ScreenTimeoutHook.install(module,loader)==0&&!OemHooks.hooks.containsKey("getCandidates"),"no choices without parent writeback guard");
  OemHooks.guardAvailable=true;
  for(String absent:new String[]{"com.android.settings.display.ScreenTimeoutSettings","com.android.settingslib.widget.CandidateInfo"}) {
   OemHooks.hooks.clear();MissingModule missing=new MissingModule();
   ClassLoader incomplete=new ClassLoader(loader){protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.equals(absent))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
   yes(ScreenTimeoutHook.install(missing,incomplete)==1&&missing.errors==1&&!OemHooks.hooks.containsKey("getCandidates"),"missing picker dependency records capability and preserves native");
  }
  System.out.println("PASS ScreenTimeout picker: "+checks+" adaptor-absent/native/subclass/policy/resource checks");
 }
}''',
})

with tempfile.TemporaryDirectory(prefix='lsa-timeout-picker-') as folder:
    root = Path(folder)
    for name, source in FILES.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
    target = root / 'ls/augment/com/hook/ScreenTimeoutHook.java'
    target.write_bytes((ROOT / 'android/app/src/main/java/ls/augment/com/hook/ScreenTimeoutHook.java').read_bytes())
    subprocess.run([shutil.which('javac'), '-encoding', 'UTF-8', '-d', folder,
                    *map(str, root.rglob('*.java'))], check=True)
    subprocess.run([shutil.which('java'), '-cp', folder, 'ls.augment.com.hook.TestScreenTimeoutPicker'], check=True)
