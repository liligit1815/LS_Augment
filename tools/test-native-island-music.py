"""Execute the production native music bridge with old/new/inherited OEM contracts."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
FILES = {
 'android/os/Handler.java': '''package android.os;import java.util.*;public class Handler {
 public List<Runnable> queue=new ArrayList<>(),later=new ArrayList<>();public void post(Runnable r){queue.add(r);}
 public void postDelayed(Runnable r,long ms){later.add(r);}public void removeCallbacks(Runnable r){queue.removeIf(x->x==r);later.removeIf(x->x==r);}
 public void drain(){int n=0;while(!queue.isEmpty()){if(++n>50)throw new AssertionError("callback loop");queue.remove(0).run();}}}''',
 'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long elapsedRealtime(){return 1000;}}',
 'android/os/Process.java': 'package android.os;public class Process {public static int myUid(){return 1000;}}',
 'android/os/UserHandle.java': 'package android.os;public record UserHandle(int user){public static UserHandle getUserHandleForUid(int uid){return new UserHandle(uid/100000);}}',
 'android/content/ComponentName.java': 'package android.content;public class ComponentName {}',
 'android/content/Context.java': '''package android.content;public class Context {
 public android.media.session.MediaSessionManager service=new android.media.session.MediaSessionManager();
 public <T>T getSystemService(Class<T> t){return t.cast(service);}}''',
 'android/content/res/ColorStateList.java': 'package android.content.res;public record ColorStateList(int color){public static ColorStateList valueOf(int c){return new ColorStateList(c);}}',
 'android/text/format/DateUtils.java': 'package android.text.format;public class DateUtils {public static String formatElapsedTime(long v){return Long.toString(v);}}',
 'android/view/View.java': '''package android.view;import java.util.*;public class View {
 public boolean attached;public int visibility;public List<OnAttachStateChangeListener> listeners=new ArrayList<>();
 public boolean isAttachedToWindow(){return attached;}public int getVisibility(){return visibility;}
 public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}}''',
 'android/widget/TextView.java': 'package android.widget;public class TextView extends android.view.View {public void setText(String s){}public int getCurrentTextColor(){return -1;}}',
 'android/widget/ImageView.java': '''package android.widget;import android.content.res.ColorStateList;public class ImageView extends android.view.View {
 ColorStateList tint;public ColorStateList getImageTintList(){return tint;}public void setImageTintList(ColorStateList c){tint=c;}}''',
 'android/widget/SeekBar.java': '''package android.widget;import android.content.res.ColorStateList;public class SeekBar extends android.view.View {
 public interface OnSeekBarChangeListener{void onStartTrackingTouch(SeekBar s);void onProgressChanged(SeekBar s,int p,boolean u);void onStopTrackingTouch(SeekBar s);}
 public OnSeekBarChangeListener listener;public int progress,max;public boolean enabled;ColorStateList tint,background;
 public void setOnSeekBarChangeListener(OnSeekBarChangeListener l){listener=l;}public int getProgress(){return progress;}
 public void setProgress(int p){progress=p;}public void setMax(int v){max=v;}public void setEnabled(boolean b){enabled=b;}
 public ColorStateList getProgressTintList(){return tint;}public ColorStateList getProgressBackgroundTintList(){return background;}
 public void setProgressTintList(ColorStateList c){tint=c;}public void setProgressBackgroundTintList(ColorStateList c){background=c;}}''',
 'android/media/MediaMetadata.java': '''package android.media;public class MediaMetadata {
 public static final String METADATA_KEY_DURATION="duration";public long getLong(String k){return 90000;}}''',
 'android/media/session/MediaSession.java': 'package android.media.session;public class MediaSession {public record Token(String id){}}',
 'android/media/session/PlaybackState.java': '''package android.media.session;public class PlaybackState {
 public static final int STATE_PLAYING=3;public static final long ACTION_SEEK_TO=256;public int state;public long actions=256;
 public PlaybackState(int s){state=s;}public int getState(){return state;}public long getActions(){return actions;}
 public long getPosition(){return 500;}public long getLastPositionUpdateTime(){return 0;}public float getPlaybackSpeed(){return 1;}}''',
 'android/media/session/MediaController.java': '''package android.media.session;import java.util.*;import android.os.Handler;import android.media.MediaMetadata;
 public class MediaController {public String pkg;public MediaSession.Token token;public PlaybackState state;
 public List<Callback> callbacks=new ArrayList<>();public final TransportControls controls=new TransportControls();
 public MediaController(String p,String t,int s){pkg=p;token=new MediaSession.Token(t);state=new PlaybackState(s);}
 public String getPackageName(){return pkg;}public MediaSession.Token getSessionToken(){return token;}public PlaybackState getPlaybackState(){return state;}
 public MediaMetadata getMetadata(){return new MediaMetadata();}public TransportControls getTransportControls(){return controls;}
 public void registerCallback(Callback c,Handler h){callbacks.add(c);}public void unregisterCallback(Callback c){callbacks.remove(c);}
 public void change(int s){state=new PlaybackState(s);for(Callback c:new ArrayList<>(callbacks))c.onPlaybackStateChanged(state);}
 public static class Callback{public void onPlaybackStateChanged(PlaybackState s){}public void onMetadataChanged(MediaMetadata m){}public void onSessionDestroyed(){}}
 public static class TransportControls{public long seek=-1;public void seekTo(long p){seek=p;}}}''',
 'android/media/session/MediaSessionManager.java': '''package android.media.session;import java.util.*;import android.os.Handler;import android.content.ComponentName;
 public class MediaSessionManager {public List<MediaController> active=new ArrayList<>();public List<OnActiveSessionsChangedListener> listeners=new ArrayList<>();
 public interface OnActiveSessionsChangedListener {void onActiveSessionsChanged(List<MediaController> v);}
 public void addOnActiveSessionsChangedListener(OnActiveSessionsChangedListener l,ComponentName c,Handler h){listeners.add(l);}
 public void removeOnActiveSessionsChangedListener(OnActiveSessionsChangedListener l){listeners.remove(l);}
 public List<MediaController> getActiveSessions(ComponentName c){return active;}
 public void changed(){for(OnActiveSessionsChangedListener l:new ArrayList<>(listeners))l.onActiveSessionsChanged(active);}}''',
 'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.lang.reflect.*;final class SystemUiAdapter {
 static Object field(Object o,String n){if(o==null)return null;for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(NoSuchFieldException e){}catch(Exception e){throw new RuntimeException(e);}return null;}
 static boolean set(Object o,String n,Object v){for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(n);f.setAccessible(true);f.set(o,v);return true;}catch(NoSuchFieldException e){}catch(Exception e){throw new RuntimeException(e);}return false;}
 static Object call(Object o,String n,Object...args)throws Exception {outer:for(Method m:o.getClass().getMethods()){if(!m.getName().equals(n)||m.getParameterCount()!=args.length)continue;
 Class<?>[] types=m.getParameterTypes();for(int i=0;i<types.length;i++)if(args[i]!=null&&!types[i].isPrimitive()&&!types[i].isInstance(args[i]))continue outer;
 m.setAccessible(true);return m.invoke(o,args);}throw new NoSuchMethodException(n);}}''',
 'ls/augment/com/hook/FeatureRuntimeLog.java': '''package ls.augment.com.hook;class FeatureRuntimeLog {
 static java.util.List<String> events=new java.util.ArrayList<>();static void state(String s,String k,String d){events.add(s+":"+d);}
 static String failure(Throwable e){return e.getClass().getSimpleName();}}''',
 'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.util.*;import java.lang.reflect.*;class AugmentModule {
 interface Interceptor{Object run(Chain c)throws Throwable;}static class Chain {Object owner;Object[] args;int proceeded;
 Chain(Object o,Object...a){owner=o;args=a;}Object proceed(Object...a){proceeded++;return null;}Object getThisObject(){return owner;}List<Object> getArgs(){return Arrays.asList(args);}}
 static class Hook{String name;Interceptor code;Hook(String n){name=n;}Hook intercept(Interceptor c){code=c;return this;}}
 Map<String,Hook> hooks=new HashMap<>();Hook prepareFeatureHook(Method m,String n,boolean b){return new Hook(n);}
 void registerFeatureHook(Hook h){hooks.put(h.name,h);}void logFeatureError(String n,Throwable e){throw new AssertionError(n,e);}}''',
 'test/MediaData.java': '''package test;import android.media.session.*;public class MediaData {
 public int user;public String pkg;public MediaSession.Token token;public MediaData(int u,String p,MediaSession.Token t){user=u;pkg=p;token=t;}
 public int getUserId(){return user;}public String getPackageName(){return pkg;}public MediaSession.Token getToken(){return token;}}''',
 'com/zte/feature/dynamicisland/islands/MediaIsland.java': '''package com.zte.feature.dynamicisland.islands;public class MediaIsland extends android.view.View {
 public test.MediaData mMediaData;public int mCurrentUser;public android.content.Context mCurrentUserContext=new android.content.Context();}''',
 'com/zte/feature/dynamicisland/DynamicIslandManager.java': '''package com.zte.feature.dynamicisland;public class DynamicIslandManager {
 public String mPkgName="launcher";public void updateMediaControllerStatus(){}}''',
 'com/zte/feature/dynamicisland/DynamicIslandUtils.java': '''package com.zte.feature.dynamicisland;import java.util.*;public class DynamicIslandUtils {
 public static final List<String> MEDIA_ISLAND_LIST=new ArrayList<>(List.of("cn.kuwo.player","paused","missing","blocked"));
 public static final List<String> MEDIA_ISLAND_EXCLUDE_LIST=new ArrayList<>(List.of("excluded"));
 public static boolean shouldShowOnMediaIsland(String p){return MEDIA_ISLAND_LIST.contains(p)&&!p.equals("blocked");}}''',
 'ls/augment/com/hook/TestNativeIslandMusic.java': r'''package ls.augment.com.hook;
 import android.media.session.*;import android.os.*;import android.content.*;import android.widget.*;import java.util.*;import test.MediaData;
 import com.zte.feature.dynamicisland.*;import com.zte.feature.dynamicisland.islands.*;
 public class TestNativeIslandMusic {
 static int checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 public static class ChildIsland extends MediaIsland {} public static class ChildManager extends DynamicIslandManager {}
 public static class BadData {public Object mMediaData;}public static class StaticData {public static MediaData mMediaData;}
 public static class BadPermanent {public void updateMediaIsland(String wrong){}}
 public static class NoForeground {public int mPkgName;}
 public static class BadLists {public static String MEDIA_ISLAND_LIST="wrong";}
 public static class ParentLists {private static List<String> MEDIA_ISLAND_LIST=List.of("legacy");}public static class ChildLists extends ParentLists {}
 public static class Panel extends android.view.View {public SeekBar mMediaProgress=new SeekBar();public TextView mElapsedTime=new TextView(),mTotalTime=new TextView(),mDisplayTitle=new TextView();
 public ImageView mPanelPlayPause=new ImageView();public MediaController mMediaController;public Object mSeekBarViewModel;}
 public static class Permanent {boolean present;int adds,removes,updates,delay;MediaData data;String pkg;
 public void updateMediaIsland(MediaData d,boolean playing,String p){updates++;data=d;pkg=p;}
 public void addPermanentIslandInner(MediaIsland s){present=true;adds++;s.attached=true;}
 public void removePermanentIsland(MediaIsland s){present=false;removes++;s.attached=false;}
 public void removeMediaIsland(boolean schedule,int ms){delay=schedule?ms:0;}
 public boolean isIslandExist(MediaIsland s){return present;}}
 public static class ChildPermanent extends Permanent {public void updateMediaIsland(String wrong){throw new AssertionError("wrong overload");}}
 public static class ModernSessions extends MediaSessionManager {int readUser=-1,listenUser=-1;
 public List<MediaController> getActiveSessionsForUser(ComponentName n,UserHandle u){readUser=u.user();return active;}
 public void addOnActiveSessionsChangedListener(ComponentName n,UserHandle u,java.util.concurrent.Executor e,OnActiveSessionsChangedListener l){listenUser=u.user();listeners.add(l);}}
 public static class DeniedListener extends ModernSessions {
 public void addOnActiveSessionsChangedListener(ComponentName n,UserHandle u,java.util.concurrent.Executor e,OnActiveSessionsChangedListener l){throw new SecurityException();}}
 public static class DeniedQuery extends ModernSessions {public List<MediaController> getActiveSessionsForUser(ComponentName n,UserHandle u){throw new SecurityException();}}
 static final AugmentModule module=new AugmentModule();static final List<MediaData> realData=new ArrayList<>();
 static void capture(MediaData data)throws Throwable{realData.add(data);AugmentModule.Chain c=new AugmentModule.Chain(new Object(),data,"key");
 module.hooks.get("rm.ui.native_media.data").code.run(c);check(c.proceeded==1,"capture preserves native bind");}
 static class Fixture {Handler h=new Handler();boolean enabled=true;int user;MediaIsland island;DynamicIslandManager manager;Permanent permanent;Panel panel=new Panel();
 List<String> reports=new ArrayList<>();NativeIslandMedia bridge;Fixture(boolean child,boolean modern)throws Exception{
 island=child?new ChildIsland():new MediaIsland();manager=child?new ChildManager():new DynamicIslandManager();permanent=child?new ChildPermanent():new Permanent();
 if(modern)island.mCurrentUserContext.service=new ModernSessions();bridge=new NativeIslandMedia(getClass().getClassLoader(),manager,permanent,island,panel,h,()->enabled,()->user,reports::add);}
 MediaSessionManager service(){return island.mCurrentUserContext.service;}void sync(){bridge.request();h.drain();}
 MediaController add(String pkg,int state,boolean payload)throws Throwable {MediaController c=new MediaController(pkg,UUID.randomUUID().toString(),state);service().active.add(c);
 if(payload)capture(new MediaData(user,pkg,c.token));return c;}String report(){return reports.get(reports.size()-1);}}
 interface Attempt{void run()throws Exception;}static void rejects(Attempt a,String why)throws Exception {boolean failed=false;try{a.run();}catch(Exception e){failed=true;}check(failed,why);}
 public static void main(String[] args)throws Throwable {
 check(NativeIslandMedia.install(module,TestNativeIslandMusic.class.getClassLoader())==2,"capture and native loop contracts installed");
 check(NativeIslandMedia.dataType(ChildIsland.class)==MediaData.class,"inherited payload determines class without package/version guess");
 rejects(()->NativeIslandMedia.dataType(BadData.class),"unknown payload rejected");rejects(()->NativeIslandMedia.dataType(StaticData.class),"static payload rejected");
 Fixture caps=new Fixture(true,true);
 rejects(()->new NativeIslandMedia(caps.getClass().getClassLoader(),caps.manager,new BadPermanent(),caps.island,caps.panel,caps.h,()->true,()->0,s->{}),"unknown native writer rejected");
 rejects(()->new NativeIslandMedia(caps.getClass().getClassLoader(),new NoForeground(),caps.permanent,caps.island,caps.panel,caps.h,()->true,()->0,s->{}),"wrong foreground contract rejected");
 java.lang.reflect.Method list=NativeIslandMedia.class.getDeclaredMethod("staticList",Class.class,String.class);list.setAccessible(true);
 check(list.invoke(null,Object.class,"MEDIA_ISLAND_LIST")==null,"method-only OEM can omit list");
 check(((List<?>)list.invoke(null,ChildLists.class,"MEDIA_ISLAND_LIST")).contains("legacy"),"inherited private allow-list supported");
 rejects(()->list.invoke(null,BadLists.class,"MEDIA_ISLAND_LIST"),"wrong allow-list type rejected");caps.bridge.close();
 for(boolean child:new boolean[]{false,true})for(boolean modern:new boolean[]{false,true}){
 Fixture f=new Fixture(child,modern);MediaController paused=f.add("paused",2,true),playing=f.add("cn.kuwo.player",3,true);
 f.sync();check(f.permanent.present&&f.permanent.pkg.equals(playing.pkg),"background playing selected after paused session");
 Collections.reverse(f.service().active);f.sync();check(f.permanent.pkg.equals(playing.pkg),"later paused cannot overwrite playing");
 check(f.bridge.ready()&&f.report().contains("member=true"),"real controller and host membership diagnosed");
 AugmentModule.Chain c=new AugmentModule.Chain(f.manager);module.hooks.get("rm.ui.native_media.sessions").code.run(c);
 check(c.proceeded==0,"owned live bridge handles native session ordering");f.h.drain();
 f.manager.mPkgName=playing.pkg;f.sync();check(!f.permanent.present,"foreground app withdraws without playback change");
 f.manager.mPkgName="";f.sync();check(!f.permanent.present&&f.report().contains("foreground=unknown"),"unknown foreground fails closed");
 f.manager.mPkgName="launcher";f.sync();check(f.permanent.present,"background transition recovers without new playback callback");
 f.panel.attached=true;f.sync();check(f.panel.mMediaController==playing&&f.panel.mMediaProgress.enabled,"native panel bound to live session");
 f.panel.mMediaProgress.progress=1234;f.panel.mMediaProgress.listener.onStopTrackingTouch(f.panel.mMediaProgress);check(playing.controls.seek==1234,"actual native seek operation");
 playing.state.actions=0;f.panel.mMediaProgress.progress=6000;f.panel.mMediaProgress.listener.onStopTrackingTouch(f.panel.mMediaProgress);check(playing.controls.seek==1234,"unsupported seek not fabricated");
 f.panel.attached=false;playing.change(2);f.h.drain();check(f.permanent.delay==3000,"pause retains OEM retirement interval");
 playing.change(3);f.h.drain();check(f.permanent.delay==0&&f.permanent.present,"resume cancels pending native removal");
 f.enabled=false;f.sync();check(!f.permanent.present&&f.service().listeners.isEmpty()&&playing.callbacks.isEmpty(),"OFF releases session listeners and island");
 c=new AugmentModule.Chain(f.manager);module.hooks.get("rm.ui.native_media.sessions").code.run(c);check(c.proceeded==1,"OFF preserves native loop");
 f.enabled=true;f.sync();check(f.permanent.present,"re-enable discovers existing playback");
 f.service().active.clear();f.service().changed();f.h.drain();check(!f.permanent.present&&f.report().contains("active=0"),"session removal withdraws and diagnoses");
 f.bridge.close();check(f.panel.listeners.isEmpty()&&f.h.queue.isEmpty()&&f.h.later.isEmpty(),"close clears lifecycle and pending work");}
 Fixture wait=new Fixture(false,false);MediaController a=wait.add("cn.kuwo.player",3,false);wait.sync();
 check(!wait.permanent.present&&wait.report().contains("waiting_real_data"),"no fake content without real MediaData");
 AugmentModule.Chain c=new AugmentModule.Chain(wait.manager);module.hooks.get("rm.ui.native_media.sessions").code.run(c);check(c.proceeded==1,"missing payload preserves native loop");
 capture(new MediaData(1,a.pkg,a.token));wait.h.drain();check(!wait.permanent.present,"wrong user data rejected");
 capture(new MediaData(0,"wrong.package",a.token));wait.h.drain();check(!wait.permanent.present,"same token wrong package rejected");
 capture(new MediaData(0,a.pkg,new MediaSession.Token("wrong")));wait.h.drain();check(!wait.permanent.present,"same package wrong token rejected");
 capture(new MediaData(0,a.pkg,a.token));wait.h.drain();check(wait.permanent.present,"data arrival retries without task/playback change");wait.bridge.close();
 Fixture ext=new Fixture(false,false);MediaController unknown=ext.add("new.music.player",3,false);ext.sync();check(!ext.permanent.present,"outside allow-list requires actual payload");
 capture(new MediaData(0,unknown.pkg,unknown.token));ext.h.drain();check(ext.permanent.present&&ext.report().contains("extended=1"),"unknown music app with proven payload supported");ext.bridge.close();
 Fixture exclude=new Fixture(false,false);exclude.add("excluded",3,true);exclude.add("blocked",3,true);exclude.sync();
 check(!exclude.permanent.present&&exclude.report().contains("excluded=1"),"explicit exclusion and native denial preserved");exclude.bridge.close();
 Fixture order=new Fixture(false,false);order.add("missing",3,false);MediaController valid=order.add("cn.kuwo.player",3,true);order.sync();
 check(order.permanent.present&&order.permanent.pkg.equals(valid.pkg),"missing payload in first playing session does not starve a valid one");order.bridge.close();
 for(boolean listener:new boolean[]{false,true})for(int current:new int[]{0,10}){
 Fixture fallback=new Fixture(false,false);fallback.user=fallback.island.mCurrentUser=current;
 fallback.island.mCurrentUserContext.service=listener?new DeniedListener():new DeniedQuery();fallback.add("cn.kuwo.player",3,true);fallback.sync();
 check(fallback.permanent.present==(current==0),"hidden API rejection falls back only for the calling user");fallback.bridge.close();}
 for(boolean modern:new boolean[]{false,true}){Fixture u=new Fixture(false,modern);u.user=u.island.mCurrentUser=10;u.add("cn.kuwo.player",3,true);u.sync();
 check(u.permanent.present==modern,"other user needs explicit user APIs");if(modern){ModernSessions s=(ModernSessions)u.service();check(s.readUser==10&&s.listenUser==10,"queries and callbacks use same current user");}
 u.user=11;u.sync();check(!u.permanent.present&&u.report().contains("user_mismatch"),"user transition revokes old content immediately");u.bridge.close();}
 check(FeatureRuntimeLog.events.stream().noneMatch(s->s.contains("song title")||s.contains("artist")),"no song/notification text in journal");
 System.out.println("PASS native island music: "+checks+" checks");}}
'''
}

# Recompile the actual bridge against known control-panel locations and a renamed
# payload class supplied by the OEM field. This exercises runtime capability selection.
for panel_package in ('com.android.systemui.media.controls.ui.controller', 'com.android.systemui.media.controls.ui',
                      'com.android.systemui.media'):
    with tempfile.TemporaryDirectory(prefix='duo-native-music-') as directory:
        base = Path(directory)
        files = dict(FILES)
        files[panel_package.replace('.', '/') + '/MediaControlPanel.java'] = (
            f'package {panel_package};public class MediaControlPanel {{'
            'public void bindPlayer(test.MediaData data,String key){}public void bindPlayer(String wrong){}}')
        paths = []
        for name, text in files.items():
            path = base / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding='utf-8')
            paths.append(str(path))
        paths += [str(SRC / (name + '.java')) for name in ('NativeIslandMedia', 'NativeIslandSceneContract')]
        java = Path(os.environ['JAVA_HOME']) / 'bin'
        suffix = '.exe' if os.name == 'nt' else ''
        subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', directory, *paths], check=True)
        subprocess.run([str(java / ('java' + suffix)), '-cp', directory, 'ls.augment.com.hook.TestNativeIslandMusic'], check=True)
        print('Verified control panel:', panel_package)
