"""Exercise real recorder-card hook code with OEM lifecycle, state and IPC doubles."""
from pathlib import Path
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
tree = ast.parse((ROOT / 'tools/test-native-island-clock-source.py').read_text(encoding='utf-8'))
files = ast.literal_eval(next(n.value for n in tree.body if isinstance(n, ast.Assign)
                              and any(isinstance(t, ast.Name) and t.id == 'files' for t in n.targets)))
tree = ast.parse((ROOT / 'tools/test-native-island-clock-cards.py').read_text(encoding='utf-8'))
extra = ast.literal_eval(next(n.value.args[0] for n in tree.body if isinstance(n, ast.Expr)
                             and isinstance(n.value, ast.Call) and isinstance(n.value.func, ast.Attribute)
                             and n.value.func.attr == 'update'))
files.update(extra)
files = {k: v for k, v in files.items() if k.startswith('android/') or k.startswith('ls/augment/com/')
         and not k.endswith(('TestClockCards.java', 'TestClockSource.java'))}
files.update({
 'android/os/Bundle.java': 'package android.os;public class Bundle {}',
 'android/app/Activity.java': 'package android.app;public class Activity extends android.content.Context {public boolean finishing;public boolean isFinishing(){return finishing;}}',
 'androidx/fragment/app/Fragment.java': 'package androidx.fragment.app;public class Fragment {}',
 'cn/zte/recorder/common/config/CommonConfig.java': 'package cn.zte.recorder.common.config;public class CommonConfig {public static boolean full;public static boolean supportFullScreenLiveIsland(){return full;}}',
 'com/zte/voicesecretary/view/VoiceSecretaryHomeFragment.java': '''package com.zte.voicesecretary.view;import cn.zte.recorder.common.helper.CardPusherHelper.CardType;
 public class VoiceSecretaryHomeFragment extends androidx.fragment.app.Fragment {public void onCardItemClick(CardType t,int id){}}''',
 'com/zte/voicesecretary/RecordAndRecognitionService.java': '''package com.zte.voicesecretary;import ls.augment.com.hook.AugmentModule;
 public class RecordAndRecognitionService {public static int state=1;public static void setState(int n){AugmentModule.call(null,RecordAndRecognitionService.class,"setState",new Class<?>[]{int.class},new Object[]{n},()->{state=n;return null;});}}''',
 'com/zte/voicesecretary/view/SystemUiResolver.java': '''package com.zte.voicesecretary.view;import android.content.Context;import ls.augment.com.hook.AugmentModule;
 public class SystemUiResolver {public static int visible,infos;public static void updateVisible(Context c,int n){AugmentModule.call(null,SystemUiResolver.class,"updateVisible",new Class<?>[]{Context.class,int.class},new Object[]{c,n},()->{visible=n;return null;});}
 public static void updateInfo(Context c,String a,String b){AugmentModule.call(null,SystemUiResolver.class,"updateInfo",new Class<?>[]{Context.class,String.class,String.class},new Object[]{c,a,b},()->{infos++;return null;});}}''',
 'com/zte/toolsdk/common/CardProviderContract.java': extra['com/zte/toolsdk/common/CardProviderContract.java'],
 'com/zte/toolsdk/producer/CardPusher.java': '''package com.zte.toolsdk.producer;import android.content.*;import ls.augment.com.hook.AugmentModule;
 public class CardPusher {public static final CardPusher INSTANCE=new CardPusher();public ContentProviderClient mClient;public String mTargetPackage="com.android.systemui";
 public int stable,callbacks;public boolean failCallback;public boolean connect(){return (Boolean)AugmentModule.noargs(this,CardPusher.class,"connect",()->{stable++;mClient=new ContentProviderClient();return true;});}
 private void registerCallback(){callbacks++;if(failCallback)throw new IllegalStateException();}
 public void disconnect(){if(mClient!=null)mClient.close();mClient=null;}}''',
 'cn/zte/recorder/common/helper/CardPusherHelper.java': '''package cn.zte.recorder.common.helper;import com.zte.toolsdk.producer.CardPusher;import ls.augment.com.hook.AugmentModule;
 public class CardPusherHelper {public static final CardPusherHelper INSTANCE=new CardPusherHelper();public static boolean isConnected;public static int sent,removed;public static RecordState last;public static long time;
 public enum RecordState {IDLE,RECORDING,PAUSED,SAVING,SAVED}public enum CardType {TYPE_RECORD;public String getCardId(){return "recorder_background";}}
 public interface CardActionListener {void onCardItemClick(CardType t,int id);}public static CardActionListener listener;
 private CardPusher getMCardPusher(){return CardPusher.INSTANCE;}public static void setCardActionListener(CardActionListener l){listener=l;}
 public static void connect(){if(!isConnected){CardPusher.INSTANCE.connect();isConnected=true;}}
 public void release(){CardPusher.INSTANCE.disconnect();isConnected=false;listener=null;}
 public static void removeCard(CardType t){removed++;last=null;}
 public static void updateCard(CardType t,RecordState s,long n,boolean camera){AugmentModule.call(null,CardPusherHelper.class,"updateCard",new Class<?>[]{CardType.class,RecordState.class,long.class,boolean.class},new Object[]{t,s,n,camera},()->{if(isConnected){sent++;last=s;time=n;}return null;});}}
 ''',
 'cn/zte/recorder/RecordingActivity.java': '''package cn.zte.recorder;import android.os.*;import androidx.fragment.app.Fragment;import cn.zte.recorder.common.helper.CardPusherHelper;
 import cn.zte.recorder.common.helper.CardPusherHelper.*;import com.zte.voicesecretary.RecordAndRecognitionService;import ls.augment.com.hook.AugmentModule;
 public class RecordingActivity extends android.app.Activity implements CardActionListener {public Fragment fragment;public java.util.List<Fragment> fragments=new java.util.ArrayList<>(java.util.List.of(new Fragment()));public Handler mIslandCardHandler;public boolean mIsAppInForeground=true,mIsStoppedByIslandCard;
 public int observers,cancelled,updates;public long time=48000;public Fragment getCurrentFragment(){return fragment;}
 public void onCreate(Bundle b){AugmentModule.call(this,RecordingActivity.class,"onCreate",new Class<?>[]{Bundle.class},new Object[]{b},()->null);}
 public void onDestroy(){AugmentModule.noargs(this,RecordingActivity.class,"onDestroy",()->null);}
 public void registerRecorderStateReceiver(){observers++;}public void unregisterRecorderStateReceiver(){observers--;}
 public void registerProcessLifecycleObserver(){observers++;}public void unregisterProcessLifecycleObserver(){observers--;}
 public void registerFrontCameraObserver(){observers++;}public void unregisterFrontCameraObserver(){observers--;}
 public void cancelIslandCardDelayedTasks(){cancelled++;}
 public void updateIslandCardByAppState(){updates++;if(mIsAppInForeground){CardPusherHelper.removeCard(CardType.TYPE_RECORD);return;}
 int s=RecordAndRecognitionService.state;if(s==2||s==3)CardPusherHelper.updateCard(CardType.TYPE_RECORD,s==2?RecordState.RECORDING:RecordState.PAUSED,time,false);else CardPusherHelper.removeCard(CardType.TYPE_RECORD);}
 public void handleIslandCardStateChange(RecordState s){AugmentModule.call(this,RecordingActivity.class,"handleIslandCardStateChange",new Class<?>[]{RecordState.class},new Object[]{s},()->{
 if(s==RecordState.IDLE)CardPusherHelper.removeCard(CardType.TYPE_RECORD);else CardPusherHelper.updateCard(CardType.TYPE_RECORD,s,time,false);return null;});}
 public void onCardItemClick(CardType t,int id){} }
 ''',
 'ls/augment/com/hook/TestRecorderCards.java': '''package ls.augment.com.hook;import android.os.*;import android.content.*;import cn.zte.recorder.RecordingActivity;
 import cn.zte.recorder.common.helper.CardPusherHelper;import cn.zte.recorder.common.helper.CardPusherHelper.*;import cn.zte.recorder.common.config.CommonConfig;
 import com.zte.voicesecretary.RecordAndRecognitionService;import com.zte.voicesecretary.view.VoiceSecretaryHomeFragment;import com.zte.toolsdk.producer.CardPusher;
 public class TestRecorderCards {static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void recover(RecordingActivity a){a.receiver.onReceive(a,new Intent(NativeIslandScenePolicy.RECORDER_SYNC_ACTION));Handler.flush();}
 public static class InheritedActivity extends RecordingActivity {public String getCurrentFragment(String ignored){return ignored;}}
 static class MissingLoader extends ClassLoader {MissingLoader(){super(TestRecorderCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{
 if(n.equals("com.zte.voicesecretary.RecordAndRecognitionService"))throw new ClassNotFoundException(n);return super.loadClass(n);}}
 public static void main(String[]args){AugmentModule m=new AugmentModule();NativeIslandRecorderCards.install(m,TestRecorderCards.class.getClassLoader());
 check(m.errors==0&&AugmentModule.hooks.size()==8,"contracts complete before registering hooks");RecordingActivity a=new InheritedActivity();a.onCreate(null);Handler.flush();
 check(a.fragment==null&&a.observers==3&&a.mIslandCardHandler!=null&&!CardPusherHelper.isConnected,"observers bind before pager fragment becomes current, without fabricating an enabled scene");a.fragment=new androidx.fragment.app.Fragment();
 check(NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION.equals(a.requiredPermission),"recovery requires platform sender permission");
 NativeIslandCardClient.ready=true;FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("record",true);
 check(CardPusherHelper.isConnected&&CardPusherHelper.listener==a&&CardPusher.INSTANCE.stable==0&&a.resolver.unstable==1,"OEM callbacks use live unstable connection");
 a.mIsAppInForeground=false;RecordAndRecognitionService.setState(2);Handler.flush();a.updateIslandCardByAppState();
 check(CardPusherHelper.sent==0,"ordinary audio is not replaced by the three-button transcription card");
 a.fragment=new VoiceSecretaryHomeFragment();recover(a);check(CardPusherHelper.last==RecordState.RECORDING&&CardPusherHelper.time==48000,"transcription publishes actual native state and duration");
 com.zte.voicesecretary.view.SystemUiResolver.updateVisible(a,1);com.zte.voicesecretary.view.SystemUiResolver.updateInfo(a,"actual time","actual time");
 check(com.zte.voicesecretary.view.SystemUiResolver.visible==0&&com.zte.voicesecretary.view.SystemUiResolver.infos==0,"new transcription card excludes ordinary panel with incompatible audio controls");
 RecordAndRecognitionService.setState(3);Handler.flush();check(CardPusherHelper.last==RecordState.PAUSED&&RecordAndRecognitionService.state==3,"state event updates real pause without resuming");
 ContentProviderClient old=CardPusher.INSTANCE.mClient;recover(a);check(old.closed&&CardPusherHelper.last==RecordState.PAUSED&&CardPusherHelper.time==48000,"host restart replaces connection and restores same paused recording");
 FeatureSettings.change("record",false);int sent=CardPusherHelper.sent;a.updateIslandCardByAppState();check(!CardPusherHelper.isConnected&&CardPusherHelper.last==null&&sent==CardPusherHelper.sent,"scene off removes and prevents native observer republish");
 com.zte.voicesecretary.view.SystemUiResolver.updateVisible(a,2);check(com.zte.voicesecretary.view.SystemUiResolver.visible==2,"original publisher remains native when enhancement disabled");
 FeatureSettings.change("record",true);check(CardPusherHelper.last==RecordState.PAUSED&&RecordAndRecognitionService.state==3,"scene on restores same paused transcription");
 a.handleIslandCardStateChange(RecordState.SAVING);RecordAndRecognitionService.setState(1);Handler.flush();check(CardPusherHelper.last==RecordState.SAVING,"real stop event retains OEM saving card across service idle event");
 a.handleIslandCardStateChange(RecordState.SAVED);recover(a);check(CardPusherHelper.last==RecordState.SAVED&&CardPusherHelper.time==48000,"reconnect preserves pending original save result");
 SystemClock.now+=6000;recover(a);check(CardPusherHelper.last==null,"expired result is not resurrected after the native result window");
 RecordAndRecognitionService.setState(2);Handler.flush();NativeIslandCardClient.ready=false;recover(a);check(!CardPusherHelper.isConnected&&CardPusherHelper.last==null,"lost display host withdraws only cards, no source stop");
 NativeIslandCardClient.ready=true;a.resolver.failConnect=true;recover(a);check(!CardPusherHelper.isConnected&&CardPusher.INSTANCE.mClient==null,"failed native connect cannot leave false connected flag");
 a.resolver.failConnect=false;recover(a);check(CardPusherHelper.last==RecordState.RECORDING,"later source recovery reconnects without restarting audio");
 a.mIsAppInForeground=true;a.updateIslandCardByAppState();check(CardPusherHelper.last==null,"foreground source hides background card");
 BroadcastReceiver receiver=a.receiver;a.onDestroy();receiver.onReceive(a,new Intent(NativeIslandScenePolicy.RECORDER_SYNC_ACTION));Handler.flush();
 check(a.observers==0&&a.resolver.observers==0&&a.receiver==null&&FeatureSettings.listeners.isEmpty()&&!CardPusherHelper.isConnected&&a.mIslandCardHandler==null,"destroy unregisters all owned observers and pending work");
 CommonConfig.full=true;RecordingActivity nativeActivity=new RecordingActivity();nativeActivity.onCreate(null);Handler.flush();check(nativeActivity.observers==0&&nativeActivity.mIslandCardHandler==null,"original supported fullscreen lifecycle stays native");CommonConfig.full=false;
 RecordingActivity failing=new RecordingActivity();failing.resolver.failObserver=true;failing.onCreate(null);Handler.flush();check(failing.observers==0&&FeatureSettings.listeners.isEmpty()&&failing.mIslandCardHandler==null,"partial binding failure cleans native observers and listeners");
 AugmentModule.hooks.clear();NativeIslandRecorderCards.install(m,new MissingLoader());check(AugmentModule.hooks.isEmpty(),"missing transcription interface preserves original application without partial hooks");
 System.out.println("PASS native recorder cards: "+checks+" checks");}}
 '''
})
with tempfile.TemporaryDirectory(prefix='duo-recorder-cards-') as folder:
    sources = []
    for name, value in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding='utf-8')
        sources.append(str(path))
    sources += [str(ROOT / 'android/app/src/main/java/ls/augment/com/hook' / name) for name in
                ['NativeIslandRecorderCards.java', 'NativeIslandSceneContract.java', 'NativeIslandScenePolicy.java']]
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', folder, 'ls.augment.com.hook.TestRecorderCards'], check=True)
