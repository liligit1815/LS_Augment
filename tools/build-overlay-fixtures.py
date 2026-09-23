"""Build two owned UIDs for real cross-app overlay touch testing."""
import subprocess,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'out/full-device-regression-20260908/overlay-fixtures';OUT.mkdir(exist_ok=True)
SDK=Path.home()/'AppData/Local/Android/Sdk';BUILD=SDK/'build-tools/36.0.0';ANDROID=SDK/'platforms/android-36/android.jar';JAVA=Path('C:/Program Files/Java/jdk-17/bin')
def run(*args):subprocess.run(list(map(str,args)),check=True,stdout=subprocess.DEVNULL)
source=OUT/'Probe.java'
source.write_text('''package ls.augment.regression.overlayprobe;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
public class Probe extends Activity {
 static View cover,coverTwo;static WindowManager manager;
 static void clear(){if(coverTwo!=null){manager.removeViewImmediate(coverTwo);coverTwo=null;}if(cover!=null){manager.removeViewImmediate(cover);cover=null;}}
 public static class Control extends BroadcastReceiver {public void onReceive(Context c,Intent i){clear();}}
 public void onCreate(Bundle b){super.onCreate(b);
  LinearLayout layout=new LinearLayout(this);layout.setGravity(Gravity.CENTER);layout.setOrientation(1);layout.setBackgroundColor(0xffeeeeee);
  TextView state=new TextView(this);state.setTextSize(22);state.setText("LS local touch probe");layout.addView(state);
  Button button=new Button(this);button.setText("LS TOUCH TARGET");button.setContentDescription("owned_touch_target");layout.addView(button,new LinearLayout.LayoutParams(650,250));
  button.setOnClickListener(v->{android.content.SharedPreferences p=getSharedPreferences("touch",0);int n=p.getInt("count",0)+1;p.edit().putInt("count",n).commit();state.setText("Recorded taps: "+n);});setContentView(layout);
  if(getIntent().getBooleanExtra("overlay",false)){
   clear();manager=getSystemService(WindowManager.class);TextView view=new TextView(this);view.setText("LS TEMPORARY TEST OVERLAY");view.setTextSize(18);view.setGravity(Gravity.TOP|Gravity.CENTER_HORIZONTAL);view.setBackgroundColor(0x40ff0000);
   WindowManager.LayoutParams w=new WindowManager.LayoutParams(-1,-1,WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE|WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,android.graphics.PixelFormat.TRANSLUCENT);
   w.alpha=1.0f;w.setTitle("LSA-Owned-Overlay-93");manager.addView(view,w);cover=view;TextView second=new TextView(this);second.setBackgroundColor(0x20ff0000);WindowManager.LayoutParams w2=new WindowManager.LayoutParams();w2.copyFrom(w);w2.setTitle("LSA-Owned-Overlay-93-B");manager.addView(second,w2);coverTwo=second;new Handler(getMainLooper()).postDelayed(Probe::clear,120000);
   new Handler(getMainLooper()).postDelayed(()->startActivity(new Intent().setClassName("ls.augment.regression.touch","ls.augment.regression.overlayprobe.Probe")),200);
  }
 }
 public void onDestroy(){super.onDestroy();clear();}
}''',encoding='utf-8')
classes=OUT/'classes';classes.mkdir(exist_ok=True)
run(JAVA/'javac.exe','-encoding','UTF-8','-source','8','-target','8','-cp',ANDROID,'-d',classes,source)
run(BUILD/'d8.bat','--lib',ANDROID,'--min-api','28','--output',OUT,*classes.rglob('*.class'))
for suffix in ['touch','cover']:
 manifest=OUT/(suffix+'.xml');manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="ls.augment.regression.'''+suffix+'''" android:versionCode="2" android:versionName="2"><uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/><uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW"/><application android:label="LS owned '''+suffix+''' test" android:allowBackup="false"><activity android:name="ls.augment.regression.overlayprobe.Probe" android:exported="true"/><receiver android:name="ls.augment.regression.overlayprobe.Probe$Control" android:exported="true"/></application></manifest>''',encoding='utf-8')
 u=OUT/(suffix+'-unsigned.apk');aligned=OUT/(suffix+'-aligned.apk');apk=OUT/(suffix+'.apk')
 run(BUILD/'aapt2.exe','link','-o',u,'-I',ANDROID,'--manifest',manifest)
 with zipfile.ZipFile(u,'a') as z:z.write(OUT/'classes.dex','classes.dex')
 run(BUILD/'zipalign.exe','-f','4',u,aligned)
 run(BUILD/'apksigner.bat','sign','--ks',Path.home()/'.android/debug.keystore','--ks-pass','pass:android','--out',apk,aligned)
 run(BUILD/'apksigner.bat','verify',apk)
 print(apk)
