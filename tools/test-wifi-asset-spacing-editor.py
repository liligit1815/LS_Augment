"""Execute the actual UiKit editor against widget facades; no screenshots/device operations."""
from pathlib import Path
import os, subprocess, tempfile
ROOT=Path(os.environ.get('DUO_SOURCE_ROOT',Path(__file__).resolve().parents[1]))
JAVA=ROOT/'android/app/src/main/java/ls/augment/com'
helper=ROOT/'tools/test-privacy-dot-spacing-editor.py';scope={'__file__':str(helper)}
exec(compile(helper.read_text(encoding='utf-8').split('\nwith tempfile.TemporaryDirectory(',1)[0],str(helper),'exec'),scope)
files={key:value for key,value in scope['files'].items() if key.startswith('android/') or key.endswith('/UiKit.java') or key.endswith('/BuildConfig.java') or key.endswith('/R.java')}
files['ls/augment/com/BuildConfig.java']='package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20454;}'
files['ls/augment/com/ConfigSchema.java']='package ls.augment.com;public class ConfigSchema {public static boolean isRuntimeKey(String key){return !key.startsWith("ui_only");}}'
files['ls/augment/com/AppConfig.java']='package ls.augment.com;public class AppConfig {public static final String DIAGNOSTICS="diagnostics";public static final java.util.Map<String,String> values=new java.util.HashMap<>();public AppConfig(android.content.Context c){}public java.util.Map<String,String> snapshot(){return new java.util.HashMap<>(values);}}'
files['ls/augment/com/TestWifiAssetEditor.java']=r'''package ls.augment.com;
import android.view.*;import android.widget.*;import android.content.*;import java.util.*;
public class TestWifiAssetEditor {
 static int checks,writes,refreshes;static String raw="";static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static List<View> all(View root){List<View> out=new ArrayList<>();out.add(root);if(root instanceof ViewGroup)for(View v:((ViewGroup)root).children)out.addAll(all(v));return out;}
 static List<SeekBar> bars(View root){List<SeekBar> out=new ArrayList<>();for(View v:all(root))if(v instanceof SeekBar)out.add((SeekBar)v);return out;}
 static Button button(View root,String text){for(View v:all(root))if(v instanceof Button&&((Button)v).text.equals(text))return (Button)v;throw new AssertionError(text);}
 static boolean text(View root,String text){for(View v:all(root))if(v instanceof TextView&&((TextView)v).text.contains(text))return true;return false;}
 static void raw(String next){raw=next;AppConfig.values.put(StatusBarIconSpacingSpec.KEY,raw);}
 static View page(Context c,String scope){LinearLayout parent=new LinearLayout(c);StatusBarWifiAssetSpacingEditor.add(c,new UiKit(c),parent,scope,"wifi.signal",()->raw,value->{raw(value);writes++;},()->refreshes++);return parent;}
 static StatusBarHeaderSpacingObservation profile(int vertical){long now=android.os.SystemClock.now;return new StatusBarHeaderSpacingObservation(System.currentTimeMillis()-now,now,20454,0,0,1000,1000,0,vertical);}
 static void evidence(Context c,String surface,int width,int height){
  c.prefs.map.put(StatusBarWifiSpacingObservation.key(surface,0,"wifi.signal"),new StatusBarWifiSpacingObservation("asset_cells",profile(0)).serialize());
  c.prefs.map.put(StatusBarWifiAssetSpacingObservation.key(surface,0,"wifi.signal"),new StatusBarWifiAssetSpacingObservation(profile(0),StatusBarWifiAssetSpacingObservation.environment(AppConfig.values,"wifi.signal"),"grid_slot",46,42,width,height,3.25f,true,true).serialize());
 }
 static void nativeEvidence(Context c,String surface,int cap){c.prefs.map.put(StatusBarWifiSpacingObservation.key(surface,0,"wifi.signal"),new StatusBarWifiSpacingObservation("native",profile(0)).serialize());c.prefs.map.put(StatusBarHeaderSpacingObservation.KEY+surface+"_0",profile(cap).serialize());}
 public static void main(String[] args){Context c=new Context();AppConfig.values.put("grid","A");raw(StatusBarIconSpacingSpec.empty().with("main","battery",new StatusBarIconSpacingSpec.Insets(1,2,3,4)).serialize());
  View missing=page(c,"main");check(writes==0,"opening unknown editor never overwrites a draft");for(SeekBar b:bars(missing))check(!b.enabled,"unknown measured budget has no effective control");check(text(missing,"显示此页面后刷新"),"unknown limit has actionable acquisition condition");
  evidence(c,"main",150,62);View main=page(c,"main");List<SeekBar> sliders=bars(main);check(sliders.size()==4,"all four actual components edges exposed");check(sliders.get(0).max==17&&sliders.get(1).max==6,"ceil-rounded native pixels bound horizontal and vertical independently");for(SeekBar b:sliders)check(b.minimumHeight>=48,"touch target retains UiKit size");
  sliders.get(0).drag(8);sliders.get(0).release();check(StatusBarIconSpacingSpec.parse(raw).resolve("main","wifi.signal").start==8,"exact valid eight dp saved");check(sliders.get(2).max==9,"trailing maximum subtracts own leading edge");check(StatusBarIconSpacingSpec.parse(raw).resolve("main","battery").bottom==4,"saving preserves unrelated draft");
  int before=writes;AppConfig.values.put("grid","B");sliders.get(0).drag(9);sliders.get(0).release();check(writes==before&&Toast.latest.contains("未保存"),"other layout change rejects stale capacity at commit");evidence(c,"main",150,62);main=page(c,"main");check(bars(main).get(0).enabled,"fresh same-profile observation recovers controls");
  raw(StatusBarIconSpacingSpec.parse(raw).with("main","wifi.signal",null).serialize());evidence(c,"main",150,62);View all=page(c,"all");for(SeekBar b:bars(all))check(!b.enabled,"all cannot borrow main capacity for unknown lock and shades");
  raw(StatusBarIconSpacingSpec.parse(raw).with("lock","wifi.signal",StatusBarIconSpacingSpec.ZERO).serialize());evidence(c,"main",150,62);nativeEvidence(c,"control",10);nativeEvidence(c,"notification",10);all=page(c,"all");check(bars(all).get(0).enabled,"explicit lock zero is skipped while inherited real pages are checked");bars(all).get(0).drag(8);bars(all).get(0).release();check(StatusBarIconSpacingSpec.parse(raw).resolve("lock","wifi.signal").isZero(),"shared edit never overwrites explicit lock override");
  raw(StatusBarIconSpacingSpec.parse(raw).with("control","wifi.activity_inout",new StatusBarIconSpacingSpec.Insets(0,9,0,0)).serialize());all=page(c,"all");check(bars(all).get(1).max==1,"shared cap combines actual per-page peer override");
  c.wm.display.rotation=1;all=page(c,"all");for(SeekBar b:bars(all))check(!b.enabled,"rotation invalidates every measured slot");button(all,"清除共享额外边距").performClick();check(StatusBarIconSpacingSpec.parse(raw).explicit("all","wifi.signal")==null,"reset stays usable without capacity");check(StatusBarIconSpacingSpec.parse(raw).resolve("main","battery").bottom==4,"reset cannot clear another icon");
  c.wm.display.rotation=0;raw(StatusBarIconSpacingSpec.parse(raw).with("main","wifi.signal",new StatusBarIconSpacingSpec.Insets(24,24,24,24)).serialize());evidence(c,"main",150,62);main=page(c,"main");check(text(main,"空间未知或不足"),"oversized saved values have honest fallback explanation");check(raw.contains("24,24,24,24"),"opening never silently clamps persisted settings");button(main,"此位置不增加额外边距").performClick();check(StatusBarIconSpacingSpec.parse(raw).resolve("main","wifi.signal").isZero(),"explicit zero remains available to recover oversized input");
  System.out.println("Wi-Fi asset production editor: "+checks+" assertions PASS; widget facade, not Android visual QA");
 }
}'''

# Dialog rendering is covered by NumericParameterUiCases; retain this suite's widget boundary.
files['ls/augment/com/NumericParameterEditor.java']='package ls.augment.com;class NumericParameterEditor{static void linear(UiKit u,android.widget.SeekBar b,String t,double o,double s,String unit,android.view.View...v){}}'


with tempfile.TemporaryDirectory(prefix='duo-wifi-asset-editor-') as tmp:
    paths=[]
    for name,code in files.items():
        p=Path(tmp)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(code,encoding='utf-8');paths.append(str(p))
    jdk=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    names=['StatusBarIconSpacingSpec','StatusBarSurfaceSpec','StatusBarIconCatalog','StatusBarWifiSpacingPolicy','StatusBarWifiSpacingObservation','StatusBarHeaderSpacingObservation','StatusBarWifiAssetSpacingPolicy','StatusBarWifiAssetSpacingObservation','StatusBarWifiAssetSpacingEditor']
    subprocess.run([str(jdk/'javac'),'-J-Duser.language=en','-encoding','UTF-8','--release','17','-d',tmp,*paths,*[str(JAVA/(n+'.java')) for n in names]],check=True)
    subprocess.run([str(jdk/'java'),'-cp',tmp,'ls.augment.com.TestWifiAssetEditor'],check=True,timeout=25)
