"""OEM NFC event routing, native fallback, independent scene policy and terminal recovery."""
from pathlib import Path
import ast, os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-native-island-clock-source.py').read_text(encoding='utf-8'))
base=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets)))
tree=ast.parse((ROOT/'tools/test-native-island-transfer-cards.py').read_text(encoding='utf-8'))
extra=ast.literal_eval(next(n.value.args[0] for n in tree.body if isinstance(n,ast.Expr) and isinstance(n.value,ast.Call) and isinstance(n.value.func,ast.Attribute) and n.value.func.attr=='update'))
base.update(extra)
files={k:v for k,v in base.items() if (k.startswith('android/') or k.startswith('ls/augment/com/')) and 'TestClockSource' not in k and 'TestTransferCards' not in k}
files['android/content/Context.java']=files['android/content/Context.java'].replace('com.zte.cn.zteshare','com.zte.multscr')
files['ls/augment/com/hook/AugmentModule.java']=files['ls/augment/com/hook/AugmentModule.java'].replace('class AugmentModule {','public class AugmentModule {').replace('static Object invoke(', 'public static Object invoke(').replace('type.getMethod(name,signature);', 'type.getDeclaredMethod(name,signature);m.setAccessible(true);')
files['android/os/Bundle.java']='package android.os;public class Bundle {}'
files['android/widget/RemoteViews.java']='package android.widget;public class RemoteViews {}'
for key in ['com/zte/toolsdk/common/CardMessage.java','com/zte/toolsdk/common/CardProviderContract.java','com/zte/toolsdk/producer/CardPusher.java']:
    files[key]=extra[key].replace('m.sender="com.zte.cn.zteshare"','m.sender=mContext.getPackageName()')
files.update({
'com/zte/multscr/MultiScreenApplication.java':'package com.zte.multscr;public class MultiScreenApplication extends android.content.Context {public void onCreate(){}}',
'com/zte/multscr/nfc/NfcTagDiscoveredService.java':'package com.zte.multscr.nfc;public class NfcTagDiscoveredService extends android.content.Context {public void onDestroy(){}}',
'com/zte/multscr/nfc/Bridge.java':'''package com.zte.multscr.nfc;public class Bridge {
 public static Object call(Object owner,Class<?> type,String name,Class<?>[] params,Object...args){try{return ls.augment.com.hook.AugmentModule.invoke(owner,type,name,params,args);}catch(Throwable e){throw new RuntimeException(e);}}}''',
'com/zte/multscr/nfc/NfcFileTransCardMgr.java':'''package com.zte.multscr.nfc;import android.content.Context;import com.zte.toolsdk.producer.CardPusher;import com.zte.toolsdk.common.CardMessage;
 public class NfcFileTransCardMgr {public static final NfcFileTransCardMgr INSTANCE=new NfcFileTransCardMgr();public static CardPusher cardPusher;
 public static boolean isConnected,currentIsSend;public static int factories;public static String kind;public static Object detail;public static boolean self,throttle;
 public void init(Context c){if(cardPusher==null){cardPusher=new CardPusher(c);cardPusher.connect();isConnected=true;}}
 private void handleCardAction(Context c,int id){}
 public void removeCard(Context c){Bridge.call(cardPusher,CardPusher.class,"removeCard",new Class<?>[]{String.class},"com.zte.multscr.share_transfer");}
 private void emit(String state,Object value,boolean send){factories++;kind=state;detail=value;currentIsSend=send;
 if(throttle&&state.equals("progress"))return;
 Bridge.call(cardPusher,CardPusher.class,"pushCard",new Class<?>[]{CardMessage.class},new CardMessage("com.zte.multscr.share_transfer",value instanceof Integer?(Integer)value:100));}
 public void showProgressCard(Context c,Integer p,boolean send){emit("progress",p,send);}
 public void showSucceedCard(Context c,String count,boolean send){emit("success",count,send);}
 public void showWaitConfirmCard(Context c){emit("confirm",null,false);}public void showWaitReceiveCard(Context c){emit("waiting",null,true);}
 public void showRefusedCanceledCard(Context c,boolean send,boolean own){self=own;emit("canceled",null,send);}
 public void showFailedCard(Context c,String reason,boolean send){emit("failed",reason,send);}}
''',
'com/zte/multscr/nfc/NfcFileTransNotificationMgr.java':'''package com.zte.multscr.nfc;import android.content.Context;import android.os.Bundle;import android.widget.RemoteViews;
 public class NfcFileTransNotificationMgr {public static boolean supportFullScreenLiveIsland,isCardShown;public boolean quiet,throwBuild,skip;public int notifications;
 public enum NotificationType {PROGRESS,PROGRESS_UPDATE,SUCCEED,SEND_CMD_RECEIVED,WAIT_TO_RECEIVE}
 public void cancelNotification(Context c){}
 private void buildAndShowNotification(Context c,RemoteViews v,Bundle b,NotificationType t){quiet=isCardShown;notifications++;if(throwBuild)throw new IllegalStateException("native build failed");}
 public void build(Context c){Bridge.call(this,getClass(),"buildAndShowNotification",new Class<?>[]{Context.class,RemoteViews.class,Bundle.class,NotificationType.class},c,new RemoteViews(),new Bundle(),NotificationType.PROGRESS);}
 public void showProgressNotification(Context c,boolean send){isCardShown=false;build(c);}public void updateProgressNotification(Context c,Integer p,boolean send){if(skip)return;isCardShown=false;build(c);}
 public void showSucceedNotification(Context c,String count,boolean send){isCardShown=false;build(c);}
 public void showSendCmdReceivedNotification(Context c){isCardShown=false;build(c);}public void showWaitToReceiveNotification(Context c){isCardShown=false;build(c);}
 public void showPeerRefusedCanceledNotification(Context c,boolean send){isCardShown=false;build(c);}public void showSelfRefuseCancelNotification(Context c,boolean send){isCardShown=false;build(c);}
 public void showFailedNotification(Context c,String why,boolean send){NfcFileTransCardMgr.INSTANCE.showFailedCard(c,why,send);isCardShown=true;build(c);}}
''',
'ls/augment/com/hook/TestNfcCards.java':'''package ls.augment.com.hook;import android.content.*;import android.os.Handler;import com.zte.multscr.nfc.*;import com.zte.toolsdk.common.CardMessage;import com.zte.toolsdk.producer.CardPusher;
 public class TestNfcCards {static int checks;static Context c=new Context();static NfcFileTransNotificationMgr notices=new NfcFileTransNotificationMgr();
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}static void call(String name,Class<?>[] types,Object...args)throws Throwable{AugmentModule.invoke(notices,NfcFileTransNotificationMgr.class,name,types,args);}
 static void progress(int p,boolean send)throws Throwable{call("updateProgressNotification",new Class<?>[]{Context.class,Integer.class,boolean.class},c,p,send);}
 static void recover(){c.receiver.onReceive(c,new Intent(NativeIslandScenePolicy.NFC_TRANSFER_SYNC_ACTION));Handler.flush();}
 static class MissingLoader extends ClassLoader {MissingLoader(){super(TestNfcCards.class.getClassLoader());}public Class<?> loadClass(String name)throws ClassNotFoundException{if(name.endsWith("NfcFileTransCardMgr"))throw new ClassNotFoundException(name);return super.loadClass(name);}}
 static class WrongNotification {private static String supportFullScreenLiveIsland;private static boolean isCardShown;}
 static class WrongLoader extends ClassLoader {WrongLoader(){super(TestNfcCards.class.getClassLoader());}public Class<?> loadClass(String name)throws ClassNotFoundException{return name.endsWith("NfcFileTransNotificationMgr")?WrongNotification.class:super.loadClass(name);}}
 public static void main(String[]args)throws Throwable {
 AugmentModule module=new AugmentModule();android.os.SystemProperties.full=true;NativeIslandNfcTransferCards.install(module,TestNfcCards.class.getClassLoader());check(AugmentModule.hooks.isEmpty(),"full-screen source preserved before any hook");
 android.os.SystemProperties.full=false;NativeIslandNfcTransferCards.install(module,TestNfcCards.class.getClassLoader());check(module.errors==0&&AugmentModule.hooks.size()==18,"all notification, factory and SDK contracts preflight");
 AugmentModule.invoke(NfcFileTransCardMgr.INSTANCE,NfcFileTransCardMgr.class,"init",new Class<?>[]{Context.class},c);CardPusher p=NfcFileTransCardMgr.cardPusher;ContentProviderClient stable=p.mClient;Object actions=p.originalActions;
 progress(9,true);check(NfcFileTransCardMgr.factories==0&&!notices.quiet&&p.mClient==stable,"disabled default preserves actual notifications and source connection");
 FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("transfer",true);progress(12,true);check(NfcFileTransCardMgr.factories==0,"ordinary transfer selection cannot enable NFC");
 FeatureSettings.change("nfc_transfer",true);NativeIslandCardClient.ready=false;progress(12,true);check(NfcFileTransCardMgr.factories==0&&!notices.quiet,"host must be live before manufacturing OEM views from a real event");
 NativeIslandCardClient.ready=true;progress(37,true);check(NfcFileTransCardMgr.kind.equals("progress")&&NfcFileTransCardMgr.detail.equals(37)&&NfcFileTransCardMgr.currentIsSend&&notices.quiet,"real send progress and direction reach original factory, accepted card quiets notification");
 check(stable.closed&&p.mClient!=stable&&c.resolver.unstable==1&&p.originalActions==actions&&p.callbacks==1,"original actions survive conversion to owned unstable client");
 check(!NfcFileTransNotificationMgr.isCardShown,"notification state restored outside intercepted build");
 check(c.resolver.observers==2&&NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION.equals(c.requiredPermission),"system settings and privileged recovery observed");
 call("showProgressNotification",new Class<?>[]{Context.class,boolean.class},c,false);check(NfcFileTransCardMgr.detail.equals(0)&&!NfcFileTransCardMgr.currentIsSend,"start event maps original zero progress and receive direction");
 notices.skip=true;int factories=NfcFileTransCardMgr.factories;progress(38,false);check(NfcFileTransCardMgr.factories==factories,"native notification throttle prevents extra card production");notices.skip=false;
 NfcFileTransCardMgr.throttle=true;progress(38,false);check(notices.quiet,"still-visible card retained across factory update throttle");NfcFileTransCardMgr.throttle=false;
 call("showWaitToReceiveNotification",new Class<?>[]{Context.class},c);check(NfcFileTransCardMgr.kind.equals("waiting"),"waiting source event calls original waiting factory");
 call("showSendCmdReceivedNotification",new Class<?>[]{Context.class},c);check(NfcFileTransCardMgr.kind.equals("confirm"),"received command calls original confirmation factory");
 call("showPeerRefusedCanceledNotification",new Class<?>[]{Context.class,boolean.class},c,true);check(NfcFileTransCardMgr.currentIsSend&&!NfcFileTransCardMgr.self,"peer cancel preserves direction and ownership");
 call("showSelfRefuseCancelNotification",new Class<?>[]{Context.class,boolean.class},c,false);check(!NfcFileTransCardMgr.currentIsSend&&NfcFileTransCardMgr.self,"local receive cancel remains local");
 factories=NfcFileTransCardMgr.factories;call("showFailedNotification",new Class<?>[]{Context.class,String.class,boolean.class},c,"real source failure",false);
 check(NfcFileTransCardMgr.factories==factories+1&&NfcFileTransCardMgr.detail.equals("real source failure")&&notices.quiet,"unconditional native failure factory runs exactly once");
 p.fail=true;progress(52,false);check(!notices.quiet,"failed new publication cannot use stale successful flag to suppress native alert");p.fail=false;
 call("showSucceedNotification",new Class<?>[]{Context.class,String.class,boolean.class},c,"two files",true);check(NfcFileTransCardMgr.kind.equals("success")&&NfcFileTransCardMgr.detail.equals("two files"),"real terminal metadata preserved");
 CardMessage latest=p.cards.get("com.zte.multscr.share_transfer");ContentProviderClient before=p.mClient;recover();check(before.closed&&p.cards.get("com.zte.multscr.share_transfer")==latest,"host rebuild replays only latest actual message");
 NativeIslandCardClient.ready=false;progress(58,false);check(NfcFileTransCardMgr.detail.equals(58)&&!notices.quiet,"adopted source keeps real progress and native alert during host outage");
 call("showSucceedNotification",new Class<?>[]{Context.class,String.class,boolean.class},c,"outage completion",false);check(NfcFileTransCardMgr.kind.equals("success")&&NfcFileTransCardMgr.detail.equals("outage completion")&&!notices.quiet,"terminal event still executes native factory and removal lifecycle while host is down");
 NativeIslandCardClient.ready=true;recover();check(p.cards.get("com.zte.multscr.share_transfer").progress==100,"recovery uses real terminal state rather than earlier progress");
 call("cancelNotification",new Class<?>[]{Context.class},c);check(!p.cards.isEmpty(),"teardown preserves terminal result until original removal timer");
 NativeIslandCardClient.ready=false;NfcFileTransCardMgr.INSTANCE.removeCard(c);NativeIslandCardClient.ready=true;recover();check(p.cards.isEmpty(),"terminal native removal during host outage cannot resurrect result");
 progress(59,false);NativeIslandCardClient.ready=false;call("cancelNotification",new Class<?>[]{Context.class},c);NativeIslandCardClient.ready=true;recover();check(p.cards.isEmpty(),"native connection error dismisses active card and cache during host outage");
 progress(59,false);NativeIslandCardClient.ready=false;call("cancelNotification",new Class<?>[]{Context.class},c);call("showSelfRefuseCancelNotification",new Class<?>[]{Context.class,boolean.class},c,false);NativeIslandCardClient.ready=true;recover();check(NfcFileTransCardMgr.kind.equals("canceled")&&p.cards.get("com.zte.multscr.share_transfer").progress==100,"cancel result following notification dismissal during outage replaces old progress");
 progress(60,false);AugmentModule.invoke(new NfcTagDiscoveredService(),NfcTagDiscoveredService.class,"onDestroy",new Class<?>[0]);recover();check(p.cards.isEmpty(),"destroyed source service cannot leave or recover active card");
 progress(61,false);FeatureSettings.change("nfc_transfer",false);check(p.cards.isEmpty()&&p.mClient==null,"NFC opt-out removes card and releases own connection");FeatureSettings.change("nfc_transfer",true);recover();check(p.cards.isEmpty(),"reenable waits for next real event");
 progress(63,false);check(p.cards.get("com.zte.multscr.share_transfer").progress==63,"next real progress restores current business");
 android.provider.Settings.System.excluded="share_transfer";FeatureSettings.change("nfc_transfer",true);factories=NfcFileTransCardMgr.factories;progress(64,false);check(p.cards.isEmpty()&&NfcFileTransCardMgr.factories==factories,"OEM shared transfer exclusion remains effective");android.provider.Settings.System.excluded=null;
 FeatureSettings.change("nfc_transfer",true);progress(65,false);android.provider.Settings.System.value=0;FeatureSettings.change("nfc_transfer",true);check(p.cards.isEmpty(),"system island off withdraws NFC");android.provider.Settings.System.value=1;
 FeatureSettings.change("duo",true);factories=NfcFileTransCardMgr.factories;progress(66,false);check(NfcFileTransCardMgr.factories==factories,"custom island selection excludes native NFC adapter");FeatureSettings.change("duo",false);
 progress(67,false);before=p.mClient;p.releaseFail=true;FeatureSettings.change("nfc_transfer",false);check(before.closed&&p.mClient==null,"callback failure cannot leak own connection");p.releaseFail=false;FeatureSettings.change("nfc_transfer",true);progress(68,false);
 before=p.mClient;ContentProviderClient foreign=new ContentProviderClient();p.mClient=foreign;int releases=p.releases;recover();check(before.closed&&!foreign.closed&&p.mClient==foreign&&p.releases==releases,"later foreign connection not closed or unregistered");
 AugmentModule.invoke(p,CardPusher.class,"disconnect",new Class<?>[0]);recover();check(p.mClient==null,"native disconnect retires cache");
 NfcFileTransNotificationMgr.supportFullScreenLiveIsland=true;factories=NfcFileTransCardMgr.factories;progress(70,false);check(NfcFileTransCardMgr.factories==factories,"positive native capability preserves original path even if system property was false");NfcFileTransNotificationMgr.supportFullScreenLiveIsland=false;
 notices.throwBuild=true;boolean threw=false;try{progress(71,false);}catch(Throwable expected){threw=true;}notices.throwBuild=false;check(threw&&!NfcFileTransNotificationMgr.isCardShown,"native exception propagates with notification state restored");
 int old=NfcFileTransCardMgr.factories;notices.build(c);check(NfcFileTransCardMgr.factories==old,"throwing native build cannot leak event scope to unrelated later notification");
 check(NativeIslandNfcTransferCards.knownId("com.zte.multscr_com.zte.multscr.share_transfer")&&!NativeIslandNfcTransferCards.knownId("share_transfer"),"exact source-specific SDK wire identity required");
 AugmentModule.hooks.clear();NativeIslandNfcTransferCards.install(module,new MissingLoader());check(AugmentModule.hooks.isEmpty(),"missing source cannot partially install");
 NativeIslandNfcTransferCards.install(module,new WrongLoader());check(AugmentModule.hooks.isEmpty(),"wrong runtime field type cannot partially install");
 System.out.println("PASS native NFC transfer cards: "+checks+" checks");}}
'''
})
with tempfile.TemporaryDirectory(prefix='duo-nfc-cards-') as folder:
    sources=[]
    for name,value in files.items():
        path=Path(folder)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value,encoding='utf-8');sources.append(str(path))
    sources += [str(ROOT/'android/app/src/main/java/ls/augment/com/hook'/name) for name in ['NativeIslandNfcTransferCards.java','NativeIslandSceneContract.java','NativeIslandScenePolicy.java']]
    java=Path(os.environ['JAVA_HOME'])/'bin';suffix='.exe' if os.name=='nt' else ''
    subprocess.run([str(java/('javac'+suffix)),'-encoding','UTF-8','-d',folder,*sources],check=True)
    subprocess.run([str(java/('java'+suffix)),'-cp',folder,'ls.augment.com.hook.TestNfcCards'],check=True)
