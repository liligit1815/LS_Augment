"""Build an owned notification probe; broadcasts exercise actual Android notification delivery."""
import subprocess,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/full-device-regression-20260908/attention-fixture';OUT.mkdir(exist_ok=True)
SDK=Path.home()/'AppData/Local/Android/Sdk';BUILD=SDK/'build-tools/36.0.0';ANDROID=SDK/'platforms/android-36/android.jar';JAVA=Path('C:/Program Files/Java/jdk-17/bin')
def run(*args):subprocess.run(list(map(str,args)),check=True,stdout=subprocess.DEVNULL)
source=OUT/'Probe.java'
source.write_text('''package ls.augment.regression.attention;
import android.content.*;import android.app.*;import android.media.*;
public class Probe extends BroadcastReceiver {
 public static class Home extends Activity {public void onCreate(android.os.Bundle b){super.onCreate(b);android.widget.TextView v=new android.widget.TextView(this);v.setText("LS temporary notification test");setContentView(v);}}
 public void onReceive(Context c,Intent i){
  AudioManager a=c.getSystemService(AudioManager.class);NotificationManager n=c.getSystemService(NotificationManager.class);
  if(i.hasExtra("ringer"))a.setRingerMode(i.getIntExtra("ringer",2));
  if(i.hasExtra("volume"))a.setStreamVolume(AudioManager.STREAM_NOTIFICATION,i.getIntExtra("volume",1),0);
  if(i.getBooleanExtra("clear",false))n.cancelAll();
  if(i.getBooleanExtra("post",false)){
   NotificationChannel ch=new NotificationChannel("attention91","LS notification real test",NotificationManager.IMPORTANCE_HIGH);
   ch.enableVibration(true);ch.setVibrationPattern(new long[]{0,120,80,120});
   ch.setSound(android.provider.Settings.System.DEFAULT_NOTIFICATION_URI,new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_NOTIFICATION).build());
   n.createNotificationChannel(ch);
   n.notify(i.getIntExtra("id",9101),new Notification.Builder(c,"attention91").setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle("LS notification test "+i.getIntExtra("id",9101)).setContentText("Temporary local validation").setTimeoutAfter(15000).build());
  }
  setResultData("ringer="+a.getRingerMode()+";notification="+a.getStreamVolume(5)+";ring="+a.getStreamVolume(2)+";system="+a.getStreamVolume(1));
 }
}''',encoding='utf-8')
classes=OUT/'classes';classes.mkdir(exist_ok=True)
run(JAVA/'javac.exe','-encoding','UTF-8','-source','8','-target','8','-cp',ANDROID,'-d',classes,source)
run(BUILD/'d8.bat','--lib',ANDROID,'--min-api','28','--output',OUT,*classes.rglob('*.class'))
manifest=OUT/'AndroidManifest.xml'
manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="ls.augment.regression.attention" android:versionCode="2" android:versionName="2"><uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/><uses-permission android:name="android.permission.POST_NOTIFICATIONS"/><uses-permission android:name="android.permission.VIBRATE"/><uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/><uses-permission android:name="android.permission.ACCESS_NOTIFICATION_POLICY"/><application android:label="LS temporary notification test" android:allowBackup="false"><activity android:name=".Probe$Home" android:exported="true"/><receiver android:name=".Probe" android:exported="true"/></application></manifest>''',encoding='utf-8')
u=OUT/'unsigned.apk';aligned=OUT/'aligned.apk';apk=OUT/'attention.apk'
run(BUILD/'aapt2.exe','link','-o',u,'-I',ANDROID,'--manifest',manifest)
with zipfile.ZipFile(u,'a') as z:z.write(OUT/'classes.dex','classes.dex')
run(BUILD/'zipalign.exe','-f','4',u,aligned)
run(BUILD/'apksigner.bat','sign','--ks',Path.home()/'.android/debug.keystore','--ks-pass','pass:android','--out',apk,aligned)
run(BUILD/'apksigner.bat','verify',apk)
print(apk)
