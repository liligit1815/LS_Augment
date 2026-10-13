"""Exercise charging hook fallback and retained failure evidence without a device."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
base = (ROOT / "tools/test-collab-runtime.py").read_text(encoding="utf-8")
ns = {"__file__": str(ROOT / "tools/test-collab-runtime.py")}
exec(base[:base.index("with tempfile.TemporaryDirectory")], ns)
files = ns["files"]
del files["ls/augment/com/hook/TestCollabRuntime.java"]
files["ls/augment/com/hook/TestCollabChargingFrame.java"] = (ROOT / "tools/TestCollabChargingFrame.java").read_text(encoding="utf-8")
files["com/zte/feature/charging/ChargeUtils.java"] = """package com.zte.feature.charging;
import android.graphics.*;import android.content.res.Resources;import ls.augment.com.hook.AugmentModule;
public class ChargeUtils {
 public static final Bitmap nativeBitmap=new Bitmap();public static int nativeCalls;
 public static Bitmap getChargeBitmapByIndex(int frame,Resources resources,boolean ignored,int[] ids,BitmapFactory.Options options,boolean fast,int plug){
  return (Bitmap)AugmentModule.dispatch(ChargeUtils.class,"getChargeBitmapByIndex",new Class[]{int.class,Resources.class,boolean.class,int[].class,BitmapFactory.Options.class,boolean.class,int.class},new Object[]{frame,resources,ignored,ids,options,fast,plug},()->{nativeCalls++;return nativeBitmap;});}
 public static Bitmap getChargeBitmapByIndex(int frame,Resources resources,boolean ignored,int[] ids,BitmapFactory.Options options,boolean fast,int plug,Object layer){
  return (Bitmap)AugmentModule.dispatch(ChargeUtils.class,"getChargeBitmapByIndex",new Class[]{int.class,Resources.class,boolean.class,int[].class,BitmapFactory.Options.class,boolean.class,int.class,Object.class},new Object[]{frame,resources,ignored,ids,options,fast,plug,layer},()->{nativeCalls++;return nativeBitmap;});}
}
"""
files["ls/augment/com/hook/TestCollabChargingRuntime.java"] = """package ls.augment.com.hook;
import android.content.Context;import android.content.res.Resources;import android.graphics.*;
import java.lang.reflect.*;import ls.augment.com.*;import com.zte.feature.charging.ChargeUtils;
public class TestCollabChargingRuntime {
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 public static void main(String[] args)throws Exception{
  AugmentModule module=new AugmentModule();AugmentModule.active=module;
  check(CollabUnlockHook.install(module,TestCollabChargingRuntime.class.getClassLoader(),"com.android.systemui")==2,"both OEM frame adapters register");
  Resources resources=new Resources();BitmapFactory.Options options=new BitmapFactory.Options();
  check(ChargeUtils.getChargeBitmapByIndex(0,resources,false,null,options,false,1)==ChargeUtils.nativeBitmap,"disabled preserves original result");
  check(FeatureSettings.diagnostics.keySet().stream().noneMatch(key->key.startsWith("ls_augment_collab_charging")),"disabled does not claim a frame failure");
  FeatureSettings.set(CollabOptions.CHARGING,true);
  options.inJustDecodeBounds=true;
  check(ChargeUtils.getChargeBitmapByIndex(0,resources,false,null,options,false,1)==ChargeUtils.nativeBitmap,"bounds-only delegates original options unchanged");
  check(FeatureSettings.diagnostics.keySet().stream().noneMatch(key->key.startsWith("ls_augment_collab_charging")),"intentional null bitmap from bounds-only never becomes a false failure");
  options.inJustDecodeBounds=false;
  check(ChargeUtils.getChargeBitmapByIndex(0,resources,false,null,options,false,1,new Object())==ChargeUtils.nativeBitmap,"OEM layered animation is untouched");
  check(FeatureSettings.diagnostics.keySet().stream().noneMatch(key->key.startsWith("ls_augment_collab_charging")),"layered path is not diagnosed as missing");
  check(ChargeUtils.getChargeBitmapByIndex(-1,resources,false,null,options,false,1)==ChargeUtils.nativeBitmap,"invalid frame index falls back");
  check(FeatureSettings.diagnostics.keySet().stream().noneMatch(key->key.startsWith("ls_augment_collab_charging")),"invalid OEM request does not fabricate a resource failure");
  String runtime="ls_augment_collab_charging_runtime",last="ls_augment_collab_charging_last_failure";
  Method report=CollabUnlockHook.class.getDeclaredMethod("reportCharging",AugmentModule.class,Context.class,CollabChargingFrame.Result.class,int.class,boolean.class,int.class);report.setAccessible(true);
  CollabChargingFrame.Result<Bitmap> failed=new CollabChargingFrame.Result<>(null,CollabChargingFrame.Reason.FILE_MISSING,"redmagic_charge_000.webp","stat","missing",-1,-1,-1);
  report.invoke(null,module,null,failed,0,false,1);
  check(FeatureSettings.diagnostics.keySet().stream().noneMatch(key->key.startsWith("ls_augment_collab_charging")),"missing context cannot consume first diagnostic");
  report.invoke(null,module,FeatureSettings.current,failed,0,false,1);
  String failure=FeatureSettings.diagnostics.get(last);
  check(failure.contains("reason=file_missing")&&failure.contains("frame=redmagic_charge_000.webp"),"failure retains specific safe evidence");
  for(int i=0;i<1000;i++)report.invoke(null,module,FeatureSettings.current,failed,0,false,1);
  check(FeatureSettings.writes.get(runtime)==1&&FeatureSettings.writes.get(last)==1&&module.logs.size()==1,"repeated errors cannot flood provider or feature log");
  CollabChargingFrame.Result<Bitmap> ready=new CollabChargingFrame.Result<>(new Bitmap(),CollabChargingFrame.Reason.READY,"redmagic_charge_001.webp","decode","",12,20,30);
  report.invoke(null,module,FeatureSettings.current,ready,0,false,1);
  check(FeatureSettings.diagnostics.get(runtime).contains("scope=single_frame")&&FeatureSettings.diagnostics.get(last).equals(failure),"a good frame never erases prior partial-sequence failure evidence");
  for(int i=0;i<1000;i++)report.invoke(null,module,FeatureSettings.current,i%2==0?failed:ready,0,false,1);
  check(FeatureSettings.writes.get(runtime)==2&&module.logs.size()==2,"mixed good/missing frames are also bounded");
  android.os.SystemClock.now+=30_000;report.invoke(null,module,FeatureSettings.current,failed,0,false,1);
  check(FeatureSettings.writes.get(runtime)==3&&FeatureSettings.writes.get(last)==2,"ongoing failure can refresh its observation after the interval");
  check(module.errors.isEmpty(),"charging hook installation has no unexpected errors");
  System.out.println("PASS charging hook runtime: "+checks+" checks");
 }
}
"""

with tempfile.TemporaryDirectory(prefix="lsa-collab-charge-") as temp:
    sources = []
    for name, source in files.items():
        path = Path(temp) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding="utf-8")
        sources.append(str(path))
    subprocess.run(["javac", "-encoding", "UTF-8", "-d", temp, *sources], check=True)
    subprocess.run(["java", "-cp", temp, "ls.augment.com.hook.TestCollabChargingFrame"], check=True)
    subprocess.run(["java", "-cp", temp, "ls.augment.com.hook.TestCollabChargingRuntime"], check=True)
