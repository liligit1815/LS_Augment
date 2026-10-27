"""Exercise OEM transfer publication, opt-in gates, terminal cleanup and owned connection recovery."""
from pathlib import Path
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
tree = ast.parse((ROOT / 'tools/test-native-island-clock-source.py').read_text(encoding='utf-8'))
base = ast.literal_eval(next(n.value for n in tree.body if isinstance(n, ast.Assign)
                            and any(isinstance(t, ast.Name) and t.id == 'files' for t in n.targets)))
files = {k: v for k, v in base.items() if k.startswith('android/') or k.startswith('ls/augment/com/')
         and not k.endswith('TestClockSource.java')}
files.update({
 'android/os/SystemProperties.java': 'package android.os;public class SystemProperties {public static boolean full;public static boolean getBoolean(String k,boolean d){return full;}}',
 'android/net/Uri.java': 'package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}',
 'android/content/ContentProviderClient.java': 'package android.content;public class ContentProviderClient {public boolean closed;public void close(){closed=true;}}',
 'android/content/ContentResolver.java': '''package android.content;import android.net.Uri;public class ContentResolver {public int unstable,observers;public boolean fail;
 public ContentProviderClient acquireUnstableContentProviderClient(Uri u){unstable++;return fail?null:new ContentProviderClient();}
 public void registerContentObserver(Object u,boolean b,android.database.ContentObserver o){observers++;}public void unregisterContentObserver(android.database.ContentObserver o){observers=0;}}''',
 'android/content/Context.java': '''package android.content;public class Context {public final ContentResolver resolver=new ContentResolver();public String pkg="com.zte.cn.zteshare";
 public static final int RECEIVER_EXPORTED=2;public BroadcastReceiver receiver;public String requiredPermission;
 public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,String permission,android.os.Handler h,int flags){receiver=r;requiredPermission=permission;return null;}
 public void unregisterReceiver(BroadcastReceiver r){if(receiver==r)receiver=null;}public Context getApplicationContext(){return this;}
 public ContentResolver getContentResolver(){return resolver;}public String getPackageName(){return pkg;}}''',
 'android/provider/Settings.java': '''package android.provider;public class Settings {public static class System {public static int value=1;public static String excluded;
 public static int getInt(android.content.ContentResolver r,String k,int d){return value;}public static String getString(android.content.ContentResolver r,String k){return excluded;}
 public static Object getUriFor(String k){return k;}}}''',
 'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=1;}',
 'com/zte/cn/zteshare/ZteShareApplication.java': 'package com.zte.cn.zteshare;public class ZteShareApplication extends android.content.Context {public void onCreate(){}}',
 'com/zte/cn/zteshare/d.java': '''package com.zte.cn.zteshare;public enum d {b,h,c,i,d,j,f,l;
 static {try {java.lang.reflect.Field name=Enum.class.getDeclaredField("name");name.setAccessible(true);
 String[] names={"SENDING_IN_PROGRESS","RECEIVING_IN_PROGRESS","SENDING_SUCCESS","RECEIVING_SUCCESS",
 "SENDING_CANCELED","RECEIVING_CANCELED","SENDING_FAILED","RECEIVING_FAILED"};
 int index=0;for(d value:values())name.set(value,names[index++]);}catch(Exception e){throw new ExceptionInInitializerError(e);}}}''',
 'com/zte/cn/zteshare/o.java': '''package com.zte.cn.zteshare;import android.content.Context;import com.zte.toolsdk.producer.CardPusher;
 public class o {public static Context t;public static boolean original;public static o singleton;public CardPusher a;public d d;
 public o(Context c){t=c;a=new CardPusher(c);a.connect();}public static o x(Context c){if(singleton==null)singleton=new Child(c);return singleton;}
 public static boolean A(){return original;}public void F(){d=null;}public void Y(int percent,long completed,long total){}
 public static class Child extends o {Child(Context c){super(c);}}}''',
 'com/zte/toolsdk/common/CardMessage.java': '''package com.zte.toolsdk.common;public class CardMessage {public String id,sender;public int progress;
 public CardMessage(String id,int progress){this.id=id;this.progress=progress;}public String getCardId(){return sender==null?id:sender+"_"+id;}}''',
 'com/zte/toolsdk/common/CardProviderContract.java': 'package com.zte.toolsdk.common;public class CardProviderContract {public static android.net.Uri getProviderUri(String p){return android.net.Uri.parse(p);}}',
 'com/zte/toolsdk/producer/CardPusher.java': '''package com.zte.toolsdk.producer;import android.content.*;import com.zte.toolsdk.common.CardMessage;import java.util.*;
 public class CardPusher {public ContentProviderClient mClient;public Context mContext;public String mTargetPackage="com.android.systemui";
 public int callbacks,releases,originalConnects;public boolean fail,releaseFail;public final Object originalActions=new Object();public Map<String,CardMessage> cards=new HashMap<>();
 public CardPusher(Context c){mContext=c;}private void registerCallback(){callbacks++;}private void unregisterCallback(){releases++;if(releaseFail)throw new IllegalStateException("dead");}
 public boolean connect(){originalConnects++;if(mClient==null)mClient=new ContentProviderClient();return true;}
 public void disconnect(){if(mClient!=null){mClient.close();mClient=null;}}
 public boolean pushCard(CardMessage m){if(mClient==null||fail)return false;m.sender="com.zte.cn.zteshare";cards.put(m.id,m);return true;}
 public boolean updateCard(CardMessage m){return pushCard(m);}public boolean removeCard(String id){cards.remove(id);return true;}}''',
 'ls/augment/com/hook/NativeIslandCardClient.java': '''package ls.augment.com.hook;import android.content.Context;class NativeIslandCardClient {
 static boolean ready=true;static boolean available(Context c,String s){return ready;}static void invalidate(){}}''',
 'ls/augment/com/hook/TestTransferCards.java': '''package ls.augment.com.hook;import android.content.*;import android.os.Handler;import com.zte.cn.zteshare.o;
 import com.zte.toolsdk.common.CardMessage;import com.zte.toolsdk.producer.CardPusher;import java.lang.reflect.*;
 public class TestTransferCards {static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static final Class<?>[] NONE=new Class<?>[0];static boolean gate()throws Throwable{return (Boolean)AugmentModule.invoke(null,o.class,"A",NONE);}
 static boolean send(CardPusher p,String operation,CardMessage m)throws Throwable{return (Boolean)AugmentModule.invoke(p,CardPusher.class,operation,new Class<?>[]{CardMessage.class},m);}
 static void remove(CardPusher p)throws Throwable {AugmentModule.invoke(p,CardPusher.class,"removeCard",new Class<?>[]{String.class},"share_transfer");}
 static void recover(Context c){c.receiver.onReceive(c,new Intent(NativeIslandScenePolicy.TRANSFER_SYNC_ACTION));Handler.flush();}
 static class MissingLoader extends ClassLoader {MissingLoader(){super(TestTransferCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.equals("com.zte.cn.zteshare.o"))throw new ClassNotFoundException(n);return super.loadClass(n);}}
 public static class WrongManager {public static Context t;public String a;public com.zte.cn.zteshare.d d;public static WrongManager x(Context c){return null;}public static boolean A(){return false;}public void F(){}public void Y(String wrong){}}
 enum MissingState {SENDING_IN_PROGRESS}
 static class WrongLoader extends ClassLoader {WrongLoader(){super(TestTransferCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{return n.equals("com.zte.cn.zteshare.o")?WrongManager.class:super.loadClass(n);}}
 public static void main(String[]args)throws Throwable {AugmentModule module=new AugmentModule();android.os.SystemProperties.full=true;
 NativeIslandTransferCards.install(module,TestTransferCards.class.getClassLoader());check(AugmentModule.hooks.isEmpty()&&module.errors==0,"native fullscreen source preserved before installing hooks");
 android.os.SystemProperties.full=false;NativeIslandTransferCards.install(module,TestTransferCards.class.getClassLoader());check(module.errors==0&&AugmentModule.hooks.size()==8,"typed source and SDK contracts preflight before hooks");
 boolean absent=false;try{com.zte.cn.zteshare.d.class.getField("SENDING_IN_PROGRESS");}catch(NoSuchFieldException expected){absent=true;}
 check(absent&&com.zte.cn.zteshare.d.b.name().equals("SENDING_IN_PROGRESS"),"fixture retains semantic enum names with OEM-obfuscated fields");
 boolean rejected=false;try{NativeIslandTransferCards.requireStates(MissingState.class);}catch(IllegalStateException expected){rejected=expected.getMessage().contains("RECEIVING_IN_PROGRESS");}
 check(rejected,"missing semantic state remains unsupported");
 rejected=false;try{NativeIslandTransferCards.requireStates(String.class);}catch(IllegalStateException expected){rejected=true;}
 check(rejected,"non-enum state remains unsupported");
 Context c=new Context();o m=(o)AugmentModule.invoke(null,o.class,"x",new Class<?>[]{Context.class},c);CardPusher p=m.a;Object originalActions=p.originalActions;ContentProviderClient stable=p.mClient;
 check(!gate()&&c.resolver.unstable==0&&p.mClient==stable,"default preserves original source and does not enable card publishing");
 check(NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION.equals(c.requiredPermission)&&c.resolver.observers==2,"configuration and authenticated host recovery registered");
 FeatureSettings.change("native",true);FeatureSettings.change("master",true);check(!gate(),"transfer requires its independent scene switch");
 NativeIslandCardClient.ready=false;FeatureSettings.change("transfer",true);check(!gate(),"no first activation without live verified display");
 NativeIslandCardClient.ready=true;check(gate(),"explicit selection with live host enables actual OEM producer");
 CardMessage first=new CardMessage("share_transfer",17);check(send(p,"pushCard",first)&&p.cards.get("share_transfer")==first&&first.progress==17,"genuine progress payload is forwarded unchanged");
 check(stable.closed&&p.mClient!=stable&&c.resolver.unstable==1&&p.releases==1&&p.callbacks==1,"known source stable connection replaced with registered unstable connection");
 check(p.originalActions==originalActions,"original cancel action listener is preserved");
 CardMessage latest=new CardMessage("share_transfer",39);send(p,"updateCard",latest);check(p.cards.get("share_transfer")==latest,"source progress update replaces prior real payload");
 ContentProviderClient before=p.mClient;recover(c);check(before.closed&&p.cards.get("share_transfer")==latest&&latest.progress==39,"host recovery replays the same latest live message without advancing progress");
 NativeIslandCardClient.ready=false;check(gate(),"temporary host loss still allows real source terminal cleanup");
 CardMessage terminal=new CardMessage("share_transfer",100);check(!send(p,"pushCard",terminal),"no successful publication claimed while host is unavailable");
 remove(p);NativeIslandCardClient.ready=true;recover(c);check(!p.cards.containsKey("share_transfer"),"real terminal removal during outage is never resurrected");
 send(p,"pushCard",first);FeatureSettings.change("transfer",false);check(p.cards.isEmpty()&&p.mClient==null&&!gate(),"scene off withdraws actual card and releases owned provider");
 FeatureSettings.change("transfer",true);recover(c);check(p.cards.isEmpty(),"reenable cannot replay potentially stale message from before opt-out");
 send(p,"updateCard",latest);check(p.cards.get("share_transfer")==latest,"next real progress after reenable restores current transfer");
 android.provider.Settings.System.excluded="share_transfer";FeatureSettings.change("transfer",true);check(!gate()&&p.cards.isEmpty(),"OEM transfer close-list is honored independently");
 android.provider.Settings.System.excluded=null;FeatureSettings.change("transfer",true);send(p,"pushCard",first);
 android.provider.Settings.System.value=0;FeatureSettings.change("transfer",true);check(!gate()&&p.cards.isEmpty(),"native system switch withdraws transfer");android.provider.Settings.System.value=1;
 FeatureSettings.change("duo",true);check(!gate(),"custom island mode excludes this OEM host");FeatureSettings.change("duo",false);
 CardPusher unrelated=new CardPusher(c);unrelated.mTargetPackage="launcher";unrelated.connect();check(send(unrelated,"pushCard",new CardMessage("share_transfer",1))&&unrelated.originalConnects==1,"unrelated producer remains entirely native");
 CardMessage unknown=new CardMessage("other_card",9);p.connect();check(send(p,"pushCard",unknown)&&p.cards.containsKey("other_card"),"unknown messages retain native SDK path");p.cards.remove("other_card");p.mClient.close();p.mClient=null;
 c.resolver.fail=true;check(!send(p,"pushCard",latest),"failed unstable connection never advertises success");c.resolver.fail=false;recover(c);check(p.cards.get("share_transfer")==latest,"later host discovery retries actual latest source message");
 before=p.mClient;p.releaseFail=true;FeatureSettings.change("transfer",false);check(before.closed&&p.mClient==null,"callback release failure still closes owned connection");p.releaseFail=false;FeatureSettings.change("transfer",true);
 send(p,"pushCard",first);before=p.mClient;ContentProviderClient foreign=new ContentProviderClient();p.mClient=foreign;int releases=p.releases;recover(c);
 check(before.closed&&!foreign.closed&&p.mClient==foreign&&p.releases==releases,"replacement connection is neither closed nor unregistered");
 AugmentModule.invoke(p,CardPusher.class,"disconnect",NONE);recover(c);check(p.mClient==null,"original producer disconnect retires cached business message");
 check(!NativeIslandTransferCards.knownId("other_share_transfer")&&NativeIslandTransferCards.knownId("com.zte.cn.zteshare_share_transfer"),"only exact raw and SDK-prefixed transfer IDs accepted");
 o.original=true;FeatureSettings.change("transfer",false);check(gate(),"original positive capability result is never blocked");o.original=false;
 AugmentModule.hooks.clear();NativeIslandTransferCards.install(module,new MissingLoader());check(AugmentModule.hooks.isEmpty(),"missing source contract cannot partially enable a scene");
 NativeIslandTransferCards.install(module,new WrongLoader());check(AugmentModule.hooks.isEmpty(),"wrong source field types cannot partially install hooks");
 System.out.println("PASS native transfer cards: "+checks+" checks");}}
 '''
})
with tempfile.TemporaryDirectory(prefix='duo-transfer-cards-') as folder:
    sources = []
    for name, value in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding='utf-8')
        sources.append(str(path))
    sources += [str(ROOT / 'android/app/src/main/java/ls/augment/com/hook' / name) for name in
                ['NativeIslandTransferCards.java', 'NativeIslandSceneContract.java', 'NativeIslandScenePolicy.java']]
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run([str(java / ('java' + suffix)), '--add-opens', 'java.base/java.lang=ALL-UNNAMED', '-cp', folder, 'ls.augment.com.hook.TestTransferCards'], check=True)
