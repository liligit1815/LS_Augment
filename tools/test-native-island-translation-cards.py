"""Execute translation hooks against real producer messages and independent lifecycle gates."""
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
 'android/net/Uri.java': 'package android.net;public class Uri {public String value;public static Uri parse(String s){Uri u=new Uri();u.value=s;return u;}}',
 'android/content/ContentValues.java': 'package android.content;public class ContentValues extends java.util.HashMap<String,Object>{}',
 'android/content/ContentProviderClient.java': 'package android.content;public class ContentProviderClient {public boolean closed;public void close(){closed=true;}}',
 'android/content/ContentResolver.java': '''package android.content;import android.net.Uri;import java.util.*;public class ContentResolver {
 public int unstable,observers;public boolean fail;public Map<String,Object> values=new HashMap<>();
 public ContentProviderClient acquireUnstableContentProviderClient(Uri u){unstable++;return fail?null:new ContentProviderClient();}
 public void registerContentObserver(Object u,boolean b,android.database.ContentObserver o){observers++;}public void unregisterContentObserver(android.database.ContentObserver o){observers--;}
 public int update(Uri u,ContentValues v,String s,String[] a){values.putAll(v);return 1;}}''',
 'kotlin/coroutines/Continuation.java': 'package kotlin.coroutines;public interface Continuation {}',
 'kotlinx/coroutines/flow/StateFlow.java': 'package kotlinx.coroutines.flow;public interface StateFlow {Object getValue();}',
 'com/zte/nebulatranslation/ui/model/service/SimultaneousSubtitlesService.java': '''package com.zte.nebulatranslation.ui.model.service;public class SimultaneousSubtitlesService {
 public static class RecordUiState {public boolean recording;public RecordUiState(boolean b){recording=b;}public boolean isRecording(){return recording;}}}''',
 'com/zte/nebulatranslation/ui/model/fragment/SimultaneousSubtitlesViewModel.java': '''package com.zte.nebulatranslation.ui.model.fragment;import kotlinx.coroutines.flow.StateFlow;
 public class SimultaneousSubtitlesViewModel {public Object state;public StateFlow getRecordState(){return ()->state;}}''',
 'com/zte/nebulatranslation/ui/view/fragments/SimultaneousSubtitlesFragment.java': '''package com.zte.nebulatranslation.ui.view.fragments;
 import com.zte.nebulatranslation.ui.IslandManager;import com.zte.nebulatranslation.ui.model.fragment.SimultaneousSubtitlesViewModel;
 public class SimultaneousSubtitlesFragment {public SimultaneousSubtitlesViewModel viewModel=new SimultaneousSubtitlesViewModel();
 public boolean toFloatingWindow,isNeedShow;public IslandManager manager;public IslandManager getIslandMgr(){return manager;}
 public void onResume(){}public void onPause(){}public void onDestroy(){}}''',
 'com/zte/android/api/Feature.java': 'package com.zte.android.api;public interface Feature {boolean getBoolean(String key,boolean fallback);}',
 'com/zte/domain/api/IsIslandSupportedUseCase.java': 'package com.zte.domain.api;public interface IsIslandSupportedUseCase {}',
 'com/zte/domain/impl/DefaultIslandSupportedUseCase.java': '''package com.zte.domain.impl;import com.zte.android.api.Feature;public class DefaultIslandSupportedUseCase implements com.zte.domain.api.IsIslandSupportedUseCase {
 public boolean full;public Feature feature=(k,f)->full;}''',
 'com/zte/toolsdk/common/CardMessage.java': '''package com.zte.toolsdk.common;public class CardMessage {public String id,sender;public int time;
 public CardMessage(String id,int time){this.id=id;this.time=time;}public String getCardId(){return sender==null?id:sender+"_"+id;}}''',
 'com/zte/toolsdk/common/CardProviderContract.java': 'package com.zte.toolsdk.common;public class CardProviderContract {public static android.net.Uri getProviderUri(String p){return android.net.Uri.parse(p);}}',
 'com/zte/toolsdk/producer/CardPusher.java': '''package com.zte.toolsdk.producer;import android.content.*;import com.zte.toolsdk.common.CardMessage;import java.util.*;
 public class CardPusher {public ContentProviderClient mClient;public String mTargetPackage="com.android.systemui";public int callbacks,releases;public boolean fail,failRelease;
 public Map<String,CardMessage> cards=new HashMap<>();public void registerCallback(){callbacks++;}
 private void unregisterCallback(){releases++;if(failRelease)throw new IllegalStateException("dead provider");}
 public boolean pushCard(CardMessage m){if(fail||mClient==null)return false;m.sender="com.zte.nebulatranslation";cards.put(m.id,m);return true;}
 public boolean removeCard(String id){cards.remove(id);return true;}}''',
 'com/zte/nebulatranslation/domain/BaseSystemUiResolver.java': '''package com.zte.nebulatranslation.domain;import android.content.*;import android.net.Uri;
 public class BaseSystemUiResolver {public boolean state;public String prefix;public int infos;public BaseSystemUiResolver(String p){prefix=p;}
 public boolean isVisible(){return state;}public void setVisible(boolean b){state=b;}
 public void updateVisible(Context c,int n){state=n==1;ContentValues v=new ContentValues();v.put(prefix+"_visible_status",n);c.getContentResolver().update(Uri.parse(prefix),v,null,null);}
 public void updateInfo(Context c,String text,String state){infos++;}}''',
 'com/zte/nebulatranslation/domain/MeetingSystemUiResolver.java': 'package com.zte.nebulatranslation.domain;public class MeetingSystemUiResolver extends BaseSystemUiResolver {public static final MeetingSystemUiResolver INSTANCE=new MeetingSystemUiResolver();public MeetingSystemUiResolver(){super("meeting");}}',
 'com/zte/nebulatranslation/domain/NCSystemUiResolver.java': 'package com.zte.nebulatranslation.domain;public class NCSystemUiResolver extends BaseSystemUiResolver {public static final NCSystemUiResolver INSTANCE=new NCSystemUiResolver();public NCSystemUiResolver(){super("ai");}}',
 'com/zte/nebulatranslation/ui/IslandManager.java': '''package com.zte.nebulatranslation.ui;import android.content.*;import com.zte.toolsdk.common.CardMessage;import kotlin.coroutines.Continuation;
 public class IslandManager {public Context appCtx=new Context();public com.zte.toolsdk.producer.CardPusher cardPusher=new com.zte.toolsdk.producer.CardPusher();
 public com.zte.domain.api.IsIslandSupportedUseCase isIslandSupported=new com.zte.domain.impl.DefaultIslandSupportedUseCase();public int nativeCalls;
 public Object notify(CardMessage m,Continuation c){nativeCalls++;return "original";}public Object cancel(String id,Continuation c){nativeCalls++;return "original";}
 private boolean isCardVisible(CardMessage m){return !m.getCardId().contains("transcription")||com.zte.nebulatranslation.domain.MeetingSystemUiResolver.INSTANCE.isVisible();}}''',
 'ls/augment/com/hook/NativeIslandCardClient.java': '''package ls.augment.com.hook;import android.content.Context;class NativeIslandCardClient {
 static boolean ready=true;static boolean available(Context c,String s){return ready;}static void invalidate(){}}''',
 'ls/augment/com/hook/TestTranslationCards.java': '''package ls.augment.com.hook;import android.os.Handler;import android.content.*;import com.zte.nebulatranslation.ui.IslandManager;
 import com.zte.nebulatranslation.domain.*;import com.zte.toolsdk.common.CardMessage;import com.zte.domain.impl.DefaultIslandSupportedUseCase;import kotlin.coroutines.Continuation;
 import com.zte.nebulatranslation.ui.view.fragments.SimultaneousSubtitlesFragment;
 import com.zte.nebulatranslation.ui.model.service.SimultaneousSubtitlesService.RecordUiState;
 public class TestTranslationCards {static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static Object send(IslandManager m,CardMessage card)throws Throwable {Object r=AugmentModule.invoke(m,IslandManager.class,"notify",new Class<?>[]{CardMessage.class,Continuation.class},card,null);Handler.flush();return r;}
 static void cancel(IslandManager m,String id)throws Throwable {AugmentModule.invoke(m,IslandManager.class,"cancel",new Class<?>[]{String.class,Continuation.class},id,null);Handler.flush();}
 static void visible(IslandManager m,BaseSystemUiResolver r,int n)throws Throwable {AugmentModule.invoke(r,BaseSystemUiResolver.class,"updateVisible",new Class<?>[]{Context.class,int.class},m.appCtx,n);Handler.flush();}
 static void recover(IslandManager m){m.appCtx.receiver.onReceive(m.appCtx,new Intent(NativeIslandScenePolicy.TRANSLATION_SYNC_ACTION));Handler.flush();}
 static void lifecycle(SimultaneousSubtitlesFragment f,String name)throws Throwable {AugmentModule.invoke(f,SimultaneousSubtitlesFragment.class,name,new Class<?>[]{});Handler.flush();}
 static class ChildFragment extends SimultaneousSubtitlesFragment {}
 public static class WrongFragment {public String viewModel;public boolean toFloatingWindow,isNeedShow;public IslandManager getIslandMgr(){return null;}public void onResume(){}public void onPause(){}public void onDestroy(){}}
 static class WrongLoader extends ClassLoader {WrongLoader(){super(TestTranslationCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{return n.endsWith(".SimultaneousSubtitlesFragment")?WrongFragment.class:super.loadClass(n);}}
 static class OldLoader extends ClassLoader {OldLoader(){super(TestTranslationCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.endsWith(".SimultaneousSubtitlesFragment"))throw new ClassNotFoundException(n);return super.loadClass(n);}}
 static class MissingLoader extends ClassLoader {MissingLoader(){super(TestTranslationCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.endsWith(".CardPusher"))throw new ClassNotFoundException(n);return super.loadClass(n);}}
 public static void main(String[]args)throws Throwable {AugmentModule module=new AugmentModule();NativeIslandTranslationCards.install(module,TestTranslationCards.class.getClassLoader());
 check(module.errors==0&&AugmentModule.hooks.size()==7,"all typed contracts preflight before installation");
 IslandManager full=new IslandManager();((DefaultIslandSupportedUseCase)full.isIslandSupported).full=true;send(full,new CardMessage("transcription",9));
 check(full.nativeCalls==1&&full.appCtx.receiver==null,"native fullscreen uses original producer without binding");
 IslandManager unknown=new IslandManager();unknown.isIslandSupported=new com.zte.domain.api.IsIslandSupportedUseCase(){};send(unknown,new CardMessage("call",0));
 check(unknown.appCtx.receiver==null,"unknown capability implementation stays original");
 IslandManager m=new IslandManager();send(m,new CardMessage("unknown",0));check(m.appCtx.receiver==null,"unknown card leaves original lifecycle alone");
 MeetingSystemUiResolver meeting=MeetingSystemUiResolver.INSTANCE;visible(m,meeting,1);CardMessage live=new CardMessage("transcription",37);
 check("original".equals(send(m,live))&&m.cardPusher.cards.isEmpty(),"original coroutine result preserved with enhancement off");
 check(NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION.equals(m.appCtx.requiredPermission),"recovery only accepts platform-authorized sender");
 FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("meeting",true);
 check(m.cardPusher.cards.get("transcription")==live&&live.time==37&&m.appCtx.resolver.unstable==1,"enabling reuses genuine latest producer message and unstable IPC");
 check(Integer.valueOf(0).equals(m.appCtx.resolver.values.get("meeting_visible_status"))&&meeting.isVisible(),"new card withdraws old duplicate but preserves real source visibility");
 visible(m,meeting,1);check(meeting.isVisible()&&Integer.valueOf(0).equals(m.appCtx.resolver.values.get("meeting_visible_status")),"ordinary visibility updates cannot duplicate card");
 AugmentModule.invoke(meeting,BaseSystemUiResolver.class,"updateInfo",new Class<?>[]{Context.class,String.class,String.class},m.appCtx,"00:37","");Handler.flush();
 check(meeting.infos==0,"old info publishing suppressed while real card is displayed");
 FeatureSettings.change("ai",true);CardMessage call=new CardMessage("call",0);send(m,call);FeatureSettings.change("meeting",false);
 check(!m.cardPusher.cards.containsKey("transcription")&&m.cardPusher.cards.get("call")==call,"meeting gate independent of AI-assistant gate");
 check(Integer.valueOf(1).equals(m.appCtx.resolver.values.get("meeting_visible_status"))&&"00:37".equals(m.appCtx.resolver.values.get("meeting_count_status")),"disabled new card restores current ordinary source state and time");
 FeatureSettings.change("meeting",true);ContentProviderClient before=m.cardPusher.mClient;recover(m);
 check(before.closed&&m.cardPusher.cards.get("transcription")==live&&live.time==37,"recovery restores same source state without starting business");
 visible(m,meeting,0);check(!m.cardPusher.cards.containsKey("transcription")&&m.cardPusher.cards.containsKey("call"),"returning to meeting hides only its background card");
 visible(m,meeting,1);check(m.cardPusher.cards.get("transcription")==live,"background can restore paused source message");
 cancel(m,"transcription");recover(m);check(!m.cardPusher.cards.containsKey("transcription"),"actual source cancellation cannot be replayed after restart");
 cancel(m,"call");check(m.cardPusher.mClient==null&&m.cardPusher.cards.isEmpty(),"last real activity cancellation releases owned provider");
 send(m,new CardMessage("transcription",51));NativeIslandCardClient.ready=false;recover(m);check(m.cardPusher.mClient==null&&meeting.isVisible(),"host loss leaves original business active");
 NativeIslandCardClient.ready=true;m.appCtx.resolver.fail=true;recover(m);check(m.cardPusher.mClient==null,"failed provider connection never advertises published card");
 m.appCtx.resolver.fail=false;recover(m);check(m.cardPusher.cards.get("transcription").time==51,"later host recovery restores real latest message");
 android.provider.Settings.System.value=0;FeatureSettings.change("meeting",true);check(m.cardPusher.mClient==null,"system native switch disables adaptation");android.provider.Settings.System.value=1;
 check(NativeIslandTranslationCards.sourceScene("other_transcription")==null&&NativeIslandTranslationCards.sourceScene("com.zte.nebulatranslation_call").equals("ai"),"source IDs exact before and after SDK sender prefix");
 ChildFragment screen=new ChildFragment();screen.manager=m;RecordUiState actual=new RecordUiState(false);screen.viewModel.state=actual;
 lifecycle(screen,"onResume");visible(m,meeting,1);send(m,live);
 check(!m.cardPusher.cards.containsKey("transcription"),"foreground inherited fragment rejects stale ordinary visible flag");
 lifecycle(screen,"onPause");visible(m,meeting,0);actual.recording=true;CardMessage resumed=new CardMessage("transcription",52);send(m,resumed);
 check(m.cardPusher.cards.get("transcription")==resumed&&meeting.isVisible(),"real timer message repairs resume completed after background transition");
 actual.recording=false;send(m,resumed);check(!m.cardPusher.cards.containsKey("transcription")&&!meeting.isVisible(),"actual pause/stop cannot replay a stale visible card");
 actual.recording=true;screen.toFloatingWindow=true;send(m,resumed);check(m.cardPusher.cards.isEmpty(),"floating transition retains original window ownership");
 screen.toFloatingWindow=false;screen.isNeedShow=true;send(m,resumed);check(m.cardPusher.cards.isEmpty(),"pending floating window cannot show duplicate island");
 screen.isNeedShow=false;send(m,resumed);ContentProviderClient owned=m.cardPusher.mClient;int releases=m.cardPusher.releases;
 lifecycle(screen,"onResume");check(owned.closed&&m.cardPusher.releases==releases+1,"foreground withdrawal unregisters owned SDK callback before closing");
 lifecycle(screen,"onPause");screen.viewModel.state=new Object();visible(m,meeting,1);send(m,resumed);
 check(m.cardPusher.cards.containsKey("transcription"),"unknown runtime state preserves original visibility");
 screen.viewModel.state=actual;lifecycle(screen,"onDestroy");send(m,resumed);
 check(m.cardPusher.cards.isEmpty(),"destroyed screen cannot be resurrected by queued genuine timer message");
 ChildFragment other=new ChildFragment();other.manager=new IslandManager();other.viewModel.state=new RecordUiState(false);lifecycle(other,"onResume");visible(m,meeting,1);send(m,resumed);
 check(m.cardPusher.cards.containsKey("transcription"),"unrelated manager does not override original producer visibility");
 owned=m.cardPusher.mClient;m.cardPusher.failRelease=true;cancel(m,"transcription");
 check(owned.closed&&m.cardPusher.mClient==null,"callback failure still closes and clears owned connection");m.cardPusher.failRelease=false;
 send(m,resumed);owned=m.cardPusher.mClient;ContentProviderClient replacement=new ContentProviderClient();m.cardPusher.mClient=replacement;releases=m.cardPusher.releases;recover(m);
 check(owned.closed&&!replacement.closed&&m.cardPusher.mClient==replacement&&m.cardPusher.releases==releases,"another producer connection is neither unregistered nor closed");
 AugmentModule.hooks.clear();int errors=module.errors;NativeIslandTranslationCards.install(module,new OldLoader());
 check(module.errors==errors+1&&AugmentModule.hooks.size()==4,"missing optional lifecycle contract retains legacy producer hooks");
 IslandManager old=new IslandManager();visible(old,meeting,1);send(old,new CardMessage("transcription",61));
 check(old.cardPusher.cards.get("transcription").time==61,"older source still follows original real visibility");
 AugmentModule.hooks.clear();errors=module.errors;NativeIslandTranslationCards.install(module,new WrongLoader());
 check(module.errors==errors+1&&AugmentModule.hooks.size()==4,"wrong field type rejects all optional lifecycle hooks without losing original path");
 AugmentModule.hooks.clear();NativeIslandTranslationCards.install(module,new MissingLoader());check(AugmentModule.hooks.isEmpty(),"missing producer contract never partially installs");
 System.out.println("PASS native translation cards: "+checks+" checks");}}
 '''
})
with tempfile.TemporaryDirectory(prefix='duo-translation-cards-') as folder:
    sources = []
    for name, value in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding='utf-8')
        sources.append(str(path))
    sources += [str(ROOT / 'android/app/src/main/java/ls/augment/com/hook' / name) for name in
                ['NativeIslandTranslationCards.java', 'NativeIslandMeetingState.java', 'NativeIslandSceneContract.java', 'NativeIslandScenePolicy.java']]
    sources.append(str(ROOT / 'android/app/src/main/java/ls/augment/com/NativeIslandCardProtocol.java'))
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', folder, 'ls.augment.com.hook.TestTranslationCards'], check=True)
