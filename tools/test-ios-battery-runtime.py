"""Exercise the production iOS battery hook with live OEM-shaped fields and async assets.

The facade verifies adapter ownership/restoration and scene inputs, not Android GPU output.
"""
from pathlib import Path
import hashlib
import json
import os
import shutil
import struct
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
ASSETS = ROOT / 'android/app/src/main/assets/battery/ios'
manifest = json.loads((ASSETS / 'manifest.json').read_text(encoding='utf-8'))['assets']
assert len(manifest) == 20
for item in manifest:
    data = (ASSETS / item['name']).read_bytes()
    assert hashlib.sha256(data).hexdigest() == item['sha256'], item['name']
    assert struct.unpack('>II', data[16:24]) == (item['width'], item['frames'] * 60), item['name']
assert sorted(item['frames'] for item in manifest) == [10, 10] + [100] * 18

FILES = {
    'android/os/Looper.java': 'package android.os;public class Looper{static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return MAIN;}}',
    'android/os/Handler.java': 'package android.os;public class Handler{public Handler(Looper l){}public boolean post(Runnable r){r.run();return true;}}',
    'android/database/ContentObserver.java': 'package android.database;import android.os.Handler;public class ContentObserver{public ContentObserver(Handler h){}public void onChange(boolean s){}}',
    'android/content/ContentResolver.java': 'package android.content;public class ContentResolver{public void registerContentObserver(Object u,boolean b,android.database.ContentObserver o){}}',
    'android/content/Context.java': 'package android.content;public class Context{public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return new ContentResolver();}}',
    'android/content/res/Resources.java': 'package android.content.res;public class Resources{public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
    'android/util/DisplayMetrics.java': 'package android.util;public class DisplayMetrics{public float density=3;}',
    'android/provider/Settings.java': 'package android.provider;public class Settings{public static class Global{public static Object getUriFor(String s){return s;}public static int getInt(android.content.ContentResolver c,String k,int d){return 0;}}}',
    'android/graphics/Color.java': 'package android.graphics;public class Color{public static final int WHITE=-1;public static int red(int c){return(c>>16)&255;}public static int green(int c){return(c>>8)&255;}public static int blue(int c){return c&255;}}',
    'android/graphics/drawable/Drawable.java': 'package android.graphics.drawable;public class Drawable{}',
    'android/view/View.java': '''package android.view;public class View{public Object parent;public float alpha=1;public int layouts,invalidations;public Object getParent(){return parent;}public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return new android.content.res.Resources();}public float getAlpha(){return alpha;}public void setAlpha(float a){alpha=a;}public void requestLayout(){layouts++;}public void invalidate(){invalidations++;}}''',
    'android/widget/ImageView.java': '''package android.widget;public class ImageView extends android.view.View{public android.graphics.drawable.Drawable image=new android.graphics.drawable.Drawable(),background=new android.graphics.drawable.Drawable();public android.graphics.drawable.Drawable getDrawable(){return image;}public void setImageDrawable(android.graphics.drawable.Drawable d){image=d;}public android.graphics.drawable.Drawable getBackground(){return background;}public void setBackground(android.graphics.drawable.Drawable d){background=d;}}''',
    'ls/augment/com/ConfigSchema.java': '''package ls.augment.com;public class ConfigSchema{public static final String STATUSBAR_NATIVE_BATTERY_ENABLED="native",STATUSBAR_CONNECTIVITY_GROUP="circle";}''',
    'ls/augment/com/SystemUiOptions.java': '''package ls.augment.com;public class SystemUiOptions{public static final String PREFIX="rm_",BATTERY_PRESET=PREFIX+"battery_preset";}''',
    'ls/augment/com/IosBatteryAssets.java': '''package ls.augment.com;import java.util.*;import java.util.function.*;public class IosBatteryAssets{public static class Sheet{public final String name;public Sheet(String n){name=n;}}public static boolean immediate=true;public static Map<String,List<Consumer<Sheet>>> pending=new HashMap<>();public static Sheet cached(String n){return immediate?new Sheet(n):null;}public static void request(android.content.Context c,String n,Consumer<Sheet> r){pending.computeIfAbsent(n,k->new ArrayList<>()).add(r);}public static void complete(String n,boolean success){List<Consumer<Sheet>> r=pending.remove(n);if(r!=null)for(Consumer<Sheet> cb:r)cb.accept(success?new Sheet(n):null);}}''',
    'ls/augment/com/IosBatteryDrawable.java': '''package ls.augment.com;public class IosBatteryDrawable extends android.graphics.drawable.Drawable{public final String name;public int level;public IosBatteryDrawable(IosBatteryAssets.Sheet s,int l,float d){name=s.name;level=l;}public void updateLevel(int l){level=l;}}''',
    'ls/augment/com/hook/AugmentModule.java': 'package ls.augment.com.hook;public class AugmentModule{}',
    'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.util.*;public class SystemUiAdapter{public static final Object PASS=new Object();public interface Patch{Object apply(Object o,Object[] a,Object r)throws Throwable;}public static Map<String,Patch> after=new HashMap<>();public static int hookNamed(AugmentModule m,ClassLoader l,String n,String c,String k,int count,Patch b,Patch a){after.put(k,a);return 1;}public static Object field(Object o,String...names){if(o==null)return null;for(String n:names)try{var f=o.getClass().getField(n);f.setAccessible(true);return f.get(o);}catch(Exception e){}return null;}public static boolean set(Object o,String n,Object v){try{var f=o.getClass().getField(n);f.setAccessible(true);f.set(o,v);return true;}catch(Exception e){return false;}}public static Object call(Object o,String n,Object...args)throws ReflectiveOperationException{for(var m:o.getClass().getMethods())if(m.getName().equals(n)&&m.getParameterCount()==args.length)return m.invoke(o,args);throw new NoSuchMethodException(n);}}''',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import java.util.*;public class FeatureSettings{public static Map<String,String> values=new HashMap<>();public static String lastDiagnostic="";public static boolean enabled(android.content.Context c,String k){return enabled(c,k,false);}public static boolean enabled(android.content.Context c,String k,boolean d){return values.containsKey(k)?values.get(k).equals("1"):d;}public static int integer(android.content.Context c,String k,int d,int min,int max){return Integer.parseInt(values.getOrDefault(k,""+d));}public static void diagnostic(android.content.Context c,String k,String v){lastDiagnostic=v;}}''',
    'ls/augment/com/hook/StatusBarGridHook.java': '''package ls.augment.com.hook;public class StatusBarGridHook{public static boolean bar=true;public static boolean inBar(android.view.View v){return bar;}}''',
    'ls/augment/com/hook/RedMagicLegacyUiHook.java': '''package ls.augment.com.hook;public class RedMagicLegacyUiHook{public static boolean position;public static boolean positionSizeOnly(android.content.Context c){return position;}}''',
    'ls/augment/com/hook/TestIosBatteryRuntime.java': r'''package ls.augment.com.hook;
import android.view.View;import android.widget.ImageView;import android.graphics.drawable.Drawable;import java.util.*;import ls.augment.com.*;
public class TestIosBatteryRuntime{
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static class Colors{public int mTint=0xff000000;}
 public static class MFVBatteryViewLayout extends View{
  public int mBateryLevel=73,mShowMode=1,mChargingSeparation;public float mDarkIntensity=1;
  public boolean mIsCharing,mIsPowerSave,mTextHollowEffectAvailable=true,childHollow=true,nativeDerivedHollow=true;public int hollowReplays;
  public ImageView mBatteryIconView=new ImageView();public View mBatteryLevelInsideView=new View(),mInsideChargeView=new View(),mOutsideChargeView=new View();public Colors mBatteryColors=new Colors();
  MFVBatteryViewLayout(){mBatteryIconView.parent=this;}
  public void updateTextHollowEffectAvailable(boolean colors,boolean force){hollowReplays++;mTextHollowEffectAvailable=nativeDerivedHollow;childHollow=nativeDerivedHollow;try{callback("updateBattery",mBatteryIconView);callback("updateTextHollowEffectAvailable",this);}catch(Throwable t){throw new AssertionError(t);}}
 }
 static void config(String k,int v){FeatureSettings.values.put(k,""+v);}
 static void power(int p)throws Exception{var f=IosBatteryHook.class.getDeclaredField("gamePowerMode");f.setAccessible(true);f.setInt(null,p);}
 static IosBatteryDrawable icon(MFVBatteryViewLayout v){check(v.mBatteryIconView.image instanceof IosBatteryDrawable,"real image view holds preset");return(IosBatteryDrawable)v.mBatteryIconView.image;}
 static void callback(String n,Object v)throws Throwable{SystemUiAdapter.after.get(n).apply(v,new Object[0],null);}
 public static void main(String[] args)throws Throwable{
  IosBatteryHook.install(new AugmentModule(),TestIosBatteryRuntime.class.getClassLoader());config("native",1);config("rm_battery_preset",1);
  MFVBatteryViewLayout v=new MFVBatteryViewLayout();Drawable original=v.mBatteryIconView.image,background=v.mBatteryIconView.background;
  v.mBatteryLevelInsideView.alpha=.7f;v.mInsideChargeView.alpha=.6f;v.mOutsideChargeView.alpha=.8f;
  IosBatteryHook.apply(v);check(icon(v).name.equals("stat_sys_battery_digital_darkmode.png"),"inside dark digit scene");check(icon(v).level==73,"current level");
  check(v.mBatteryIconView.background==null&&v.mBatteryLevelInsideView.alpha==0&&!v.mTextHollowEffectAvailable,"remove duplicate native background/text/hollow rendering");
  check(v.mInsideChargeView.alpha==0&&v.mOutsideChargeView.alpha==0,"embedded charge artwork owns indicator");
  v.mIsCharing=true;callback("updateBatteryLevelText",v);check(icon(v).name.equals("stat_sys_battery_charge_digit_darkmode.png"),"charging update scene");
  v.mBatteryColors.mTint=-1;v.mDarkIntensity=1;callback("onKeyguardColorChanged",v);check(icon(v).name.equals("stat_sys_battery_charge_digit.png"),"keyguard uses its actual tint, not stale dark intensity");
  config("rm_battery_style",2);IosBatteryHook.apply(v);check(icon(v).name.equals("stat_sys_battery_charge.png"),"external number uses nondigit strip");
  v.mIsPowerSave=true;callback("onPowerSaveChanged",v);check(icon(v).name.equals("stat_sys_battery_power_save_charge.png"),"saving charging ten-frame strip");
  v.mIsCharing=false;v.mIsPowerSave=false;power(3);IosBatteryHook.apply(v);check(icon(v).name.equals("stat_sys_battery_performance_mode.png"),"live high performance");
  power(4);IosBatteryHook.apply(v);check(icon(v).name.equals("stat_sys_battery_performance_mode.png"),"live chicken mode");
  power(2);IosBatteryHook.apply(v);check(icon(v).name.equals("stat_sys_battery.png"),"balanced exits performance");
  power(1);IosBatteryHook.apply(v);check(icon(v).name.equals("stat_sys_battery_power_save.png"),"game saving tier");
  power(0);v.mChargingSeparation=1;IosBatteryHook.apply(v);check(v.mInsideChargeView.alpha==.6f&&v.mOutsideChargeView.alpha==.8f,"bypass indicator retained");
  v.mChargingSeparation=0;config("rm_battery_style",5);IosBatteryHook.apply(v);check(v.mOutsideChargeView.alpha==.8f,"number only mode keeps native external charge");
  config("rm_battery_style",1);v.mBateryLevel=100;IosBatteryHook.apply(v);check(icon(v).level==100,"full battery live update");
  Drawable nextNative=new Drawable(),nextBackground=new Drawable();v.mBatteryIconView.image=nextNative;v.mBatteryIconView.background=nextBackground;callback("updateBattery",v.mBatteryIconView);
  check(icon(v).level==100,"native palette rebuild reapplies preset");
  v.updateTextHollowEffectAvailable(true,false);check(!v.mTextHollowEffectAvailable&&v.childHollow,"nested native color callback suppresses parent after child calculates hollow");
  config("rm_battery_preset",0);IosBatteryHook.apply(v);check(v.mBatteryIconView.image==nextNative&&v.mBatteryIconView.background==nextBackground,"restore most recent native palette after several scene changes");
  check(v.mBatteryLevelInsideView.alpha==.7f&&v.mInsideChargeView.alpha==.6f&&v.mOutsideChargeView.alpha==.8f&&v.mTextHollowEffectAvailable&&v.childHollow,"native overlays and both hollow states restored after nested callbacks");
  check(v.hollowReplays==2,"one native hollow replay, no recursive restoration");
  config("rm_battery_preset",1);IosBatteryHook.apply(v);config("circle",1);IosBatteryHook.apply(v);check(v.mBatteryIconView.image==nextNative,"three-in-one releases preset");
  config("circle",0);IosBatteryHook.apply(v);RedMagicLegacyUiHook.position=true;IosBatteryHook.apply(v);check(v.mBatteryIconView.image==nextNative,"position-only preserves native appearance");
  RedMagicLegacyUiHook.position=false;IosBatteryHook.apply(v);config("native",0);IosBatteryHook.apply(v);check(v.mBatteryIconView.image==nextNative,"disabling native customization restores native");
  config("native",1);StatusBarGridHook.bar=false;IosBatteryHook.apply(v);check(v.mBatteryIconView.image==nextNative,"non-bar battery never customized");StatusBarGridHook.bar=true;
  IosBatteryAssets.immediate=false;config("rm_battery_style",1);IosBatteryHook.apply(v);check(v.mBatteryIconView.image==nextNative&&v.mBatteryLevelInsideView.alpha==.7f,"loading keeps real native icon/text");
  String first="stat_sys_battery_digital.png";v.mIsCharing=true;IosBatteryHook.apply(v);String latest="stat_sys_battery_charge_digit.png";
  IosBatteryAssets.complete(first,true);check(v.mBatteryIconView.image==nextNative,"stale loading callback cannot install prior scene");
  IosBatteryAssets.complete(latest,true);check(icon(v).name.equals(latest),"only current asynchronous scene installed");
  config("rm_battery_preset",0);IosBatteryHook.apply(v);config("rm_battery_preset",1);v.mIsCharing=false;IosBatteryHook.apply(v);config("rm_battery_preset",0);IosBatteryHook.apply(v);IosBatteryAssets.complete(first,true);
  check(v.mBatteryIconView.image==nextNative,"disabled request cannot reactivate preset");
  config("rm_battery_preset",1);IosBatteryHook.apply(v);IosBatteryAssets.complete(first,false);check(v.mBatteryIconView.image==nextNative&&v.mBatteryLevelInsideView.alpha==.7f,"missing asset fails to native with no suppression");
  check(FeatureSettings.lastDiagnostic.startsWith("asset_unavailable:"),"material failure visible to diagnostics");
  System.out.println("iOS battery runtime: "+checks+" ownership/state/lifecycle checks passed; 20 asset hashes verified");
 }
}''',
}
with tempfile.TemporaryDirectory(prefix='ios-battery-runtime-') as scratch:
    root = Path(scratch)
    for name, source in FILES.items():
        target = root / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(source, encoding='utf-8')
    for relative in ['ls/augment/com/IosBatteryPolicy.java', 'ls/augment/com/hook/IosBatteryHook.java']:
        target = root / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(ROOT / 'android/app/src/main/java' / relative, target)
    javac = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin/javac.exe'
    java = javac.with_name('java.exe')
    if not javac.exists():
        javac = shutil.which('javac')
        java = shutil.which('java')
    subprocess.run([str(javac), '-encoding', 'UTF-8', '-d', str(root / 'classes'), *map(str, root.rglob('*.java'))], check=True)
    subprocess.run([str(java), '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestIosBatteryRuntime'], check=True)
