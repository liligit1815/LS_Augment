"""Execute the production SMS receiver with deterministic Android service doubles."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java'
STUBS = {
'android/app/ActivityManager.java': 'package android.app; public class ActivityManager {public static int current;public static int getCurrentUser(){return current;}}',
'android/os/Process.java': 'package android.os; public class Process {public static final int SYSTEM_UID=1000;public static int myUid(){return 1000;}}',
'android/os/UserHandle.java': 'package android.os; public class UserHandle {public final int id;private UserHandle(int id){this.id=id;}public static final UserHandle ALL=new UserHandle(-1);public static UserHandle of(int id){return new UserHandle(id);}}',
'android/os/HandlerThread.java': 'package android.os; public class HandlerThread {public HandlerThread(String n){}public void start(){}public Object getLooper(){return null;}}',
'android/os/Handler.java': 'package android.os; public class Handler {public Handler(Object l){}public void post(Runnable r){r.run();}public void postDelayed(Runnable r,long t){}}',
'android/os/SystemClock.java': 'package android.os; public class SystemClock {public static long now=100;public static long elapsedRealtime(){return now;}}',
'android/os/PersistableBundle.java': 'package android.os; public class PersistableBundle {public boolean sensitive;public void putBoolean(String k,boolean v){sensitive=v;}}',
'android/content/ClipDescription.java': 'package android.content; public class ClipDescription {public static final String EXTRA_IS_SENSITIVE="sensitive";public android.os.PersistableBundle extras;public void setExtras(android.os.PersistableBundle e){extras=e;}}',
'android/content/ClipData.java': 'package android.content; public class ClipData {public String text;final ClipDescription description=new ClipDescription();public static ClipData newPlainText(String l,String t){ClipData c=new ClipData();c.text=t;return c;}public ClipDescription getDescription(){return description;}}',
'android/content/ClipboardManager.java': 'package android.content; public class ClipboardManager {public static int writes;public static ClipData clip;public static boolean fail;public void setPrimaryClip(ClipData c){if(fail)throw new SecurityException();clip=c;writes++;}}',
'android/content/BroadcastReceiver.java': 'package android.content;public abstract class BroadcastReceiver {public static int user;public int getSendingUserId(){return user;}public abstract void onReceive(Context c,Intent i);}',
'android/content/Intent.java': 'package android.content;public class Intent {public String action="sms";public android.telephony.SmsMessage[] parts;public String getAction(){return action;}}',
'android/content/IntentFilter.java': 'package android.content;public class IntentFilter {public final String action;public IntentFilter(String a){action=a;}}',
'android/content/Context.java': '''package android.content;public class Context {
 public static final int RECEIVER_EXPORTED=2;public static BroadcastReceiver receiver;public static int registrations,clipboardUser=-1;
 public void registerReceiverAsUser(BroadcastReceiver r,android.os.UserHandle u,IntentFilter f,String permission,android.os.Handler h,int flags){
  if(u.id!=-1||!"android.permission.BROADCAST_SMS".equals(permission)||flags!=RECEIVER_EXPORTED||!"sms".equals(f.action))throw new AssertionError("unprotected receiver");receiver=r;registrations++;}
 public Context createContextAsUser(android.os.UserHandle u,int flags){clipboardUser=u.id;return this;}
 public <T>T getSystemService(Class<T> t){return t.cast(new ClipboardManager());}}''',
'android/provider/Telephony.java': 'package android.provider;public class Telephony {public static class Sms {public static class Intents {public static final String SMS_RECEIVED_ACTION="sms";public static android.telephony.SmsMessage[] getMessagesFromIntent(android.content.Intent i){return i.parts;}}}}',
'android/telephony/SmsMessage.java': '''package android.telephony;public class SmsMessage {
 public String body,sender="sender";public long time=1;public SmsMessage(String b){body=b;}
 public String getMessageBody(){return body;}public String getOriginatingAddress(){return sender;}public long getTimestampMillis(){return time;}}''',
'android/util/Log.java': 'package android.util;public class Log {public static int w(String t,String m){if(!m.startsWith("SMS clipboard"))throw new AssertionError("unexpected log");return 0;}}',
'ls/augment/com/SystemOptions.java': 'package ls.augment.com;public class SystemOptions {public static final String SMS_CODE_CLIPBOARD="sms";}',
'ls/augment/com/hook/FeatureSettings.java': 'package ls.augment.com.hook;public class FeatureSettings {static boolean enabled;static boolean enabled(android.content.Context c,String k,boolean f){return enabled;}}',
'ls/augment/com/hook/TestSmsClipboard.java': '''package ls.augment.com.hook;
import android.content.*;import android.telephony.SmsMessage;import android.os.*;import android.app.ActivityManager;
public class TestSmsClipboard {
 static final Context context=new Context();
 static Intent sms(String... bodies){Intent i=new Intent();i.parts=new SmsMessage[bodies.length];for(int n=0;n<bodies.length;n++)i.parts[n]=new SmsMessage(bodies[n]);return i;}
 static void receive(Intent i){Context.receiver.onReceive(context,i);}
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);}
 public static void main(String[] args){
  SmsCodeClipboardHook.attach(context);SmsCodeClipboardHook.attach(context);check(Context.registrations==1,"duplicate receiver");
  receive(sms("验证码123456"));check(ClipboardManager.writes==0,"disabled feature copied");FeatureSettings.enabled=true;
  Intent longSms=sms("【测试】您的验证","码是123456，5分钟内有效。");receive(longSms);
  check(ClipboardManager.writes==1&&"123456".equals(ClipboardManager.clip.text),"multipart extraction");
  check(ClipboardManager.clip.getDescription().extras.sensitive,"missing sensitive flag");
  receive(longSms);check(ClipboardManager.writes==1,"duplicate broadcast copied");
  Intent wrong=sms("验证码778899");wrong.action="other";receive(wrong);receive(sms("订单778899"));receive(sms("验证码1234；验证码5678"));
  check(ClipboardManager.writes==1,"non-SMS or ambiguous text copied");
  BroadcastReceiver.user=10;receive(sms("验证码778899"));check(ClipboardManager.writes==1,"background user's SMS copied");
  ActivityManager.current=10;receive(sms("验证码778899"));check(ClipboardManager.writes==2&&Context.clipboardUser==10,"wrong user clipboard");
  Intent mixed=sms("验证码","112233");mixed.parts[1].sender="other";receive(mixed);check(ClipboardManager.writes==2,"mixed sender concatenation");
  receive(sms("x".repeat(8193)));receive(sms());receive(null);check(ClipboardManager.writes==2,"malformed or oversized payload");
  ClipboardManager.fail=true;receive(sms("验证码445566"));check(ClipboardManager.writes==2,"write should fail");
  ClipboardManager.fail=false;receive(sms("验证码445566"));check(ClipboardManager.writes==3,"failed write poisoned dedup");
  FeatureSettings.enabled=false;receive(sms("验证码667788"));check(ClipboardManager.writes==3,"toggle off did not take effect");
  FeatureSettings.enabled=true;SystemClock.now+=31000;receive(sms("验证码445566"));check(ClipboardManager.writes==4,"expired dedup not released");
  System.out.println("PASS SMS clipboard: toggle, multipart, dedup, sender/user isolation, sensitive flag, errors");
 }
}''',
}
with tempfile.TemporaryDirectory(prefix='ls-sms-runtime-') as folder:
    work = Path(folder)
    for name, source in STUBS.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
    sources = [str(path) for path in work.rglob('*.java')]
    sources += [str(JAVA / name) for name in [
        'ls/augment/com/SmsVerificationCode.java', 'ls/augment/com/hook/SmsCodeClipboardHook.java']]
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run(['java', '-cp', folder, 'ls.augment.com.hook.TestSmsClipboard'], check=True, timeout=15)
