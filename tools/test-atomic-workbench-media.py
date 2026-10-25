"""Run the production Root media bridge against controlled MediaSession boundaries.

This tests session/user isolation, action gating, payload bounds, loss of permission,
and stale-card controls without a real phone or a player's private metadata.
"""
from pathlib import Path
import argparse
import os
import shutil
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"

STUBS = {
    "android/annotation/SuppressLint.java": "package android.annotation;public @interface SuppressLint {String[] value();}",
    "android/content/ComponentName.java": """package android.content;public class ComponentName {
 public static ComponentName unflattenFromString(String value){int slash=value.indexOf('/');
 return slash>0&&slash<value.length()-1?new ComponentName():null;}}""",
    "android/content/Context.java": """package android.content;public class Context {
 public static final String MEDIA_SESSION_SERVICE="media_session";public Object service;public RuntimeException failure;public LinkageError linkage;
 public Object getSystemService(String name){if(failure!=null)throw failure;if(linkage!=null)throw linkage;
 // Match the device's actual MediaSessionManager constructor: Root must initialize this first.
 android.media.MediaFrameworkPlatformInitializer.getMediaServiceManager().getMediaSessionServiceRegisterer();
 android.media.MediaFrameworkInitializer.getMediaServiceManager().getMediaCommunicationServiceRegisterer();return service;}}""",
    "android/media/MediaServiceManager.java": """package android.media;public class MediaServiceManager {
 public static int created;public MediaServiceManager(){created++;}public Object getMediaSessionServiceRegisterer(){return this;}
 public Object getMediaCommunicationServiceRegisterer(){return this;}}""",
    "android/media/MediaFrameworkPlatformInitializer.java": """package android.media;public class MediaFrameworkPlatformInitializer {
 public static volatile MediaServiceManager manager;public static int sets;public static boolean race,ignore;public static RuntimeException failure;
 public static MediaServiceManager getMediaServiceManager(){return manager;}
 public static void setMediaServiceManager(MediaServiceManager value){sets++;if(failure!=null)throw failure;
 if(race)manager=new MediaServiceManager();if(manager!=null)throw new IllegalStateException("private-double-init");
 if(!ignore)manager=java.util.Objects.requireNonNull(value);}}""",
    "android/media/MediaFrameworkInitializer.java": """package android.media;public class MediaFrameworkInitializer {
 public static volatile MediaServiceManager manager;public static int sets;public static RuntimeException failure;
 public static MediaServiceManager getMediaServiceManager(){return manager;}
 public static void setMediaServiceManager(MediaServiceManager value){sets++;if(failure!=null)throw failure;
 if(manager!=null)throw new IllegalStateException("private-double-init");manager=java.util.Objects.requireNonNull(value);}}""",
    "android/os/Process.java": "package android.os;public class Process {public static int uid;public static int myUid(){return uid;}}",
    "android/os/UserHandle.java": """package android.os;public class UserHandle {public final int id;
 UserHandle(int id){this.id=id;}public static UserHandle getUserHandleForUid(int uid){return new UserHandle(uid/100000);}}""",
    "android/os/Bundle.java": """package android.os;import java.util.*;public class Bundle {
 public final Map<String,Object> values=new HashMap<>();
 public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}
 public void putString(String k,String v){values.put(k,v);}public String getString(String k){return (String)values.get(k);}
 public void putParcelable(String k,Object v){values.put(k,v);}public <T>T getParcelable(String k,Class<T> c){return c.cast(values.get(k));}
 public void remove(String k){values.remove(k);}}""",
    "android/os/Parcel.java": """package android.os;public class Parcel {public static int extraBytes;int size;
 public static Parcel obtain(){return new Parcel();}public void writeBundle(Bundle b){size=128+extraBytes;
 for(Object value:b.values.values()){if(value instanceof String)size+=((String)value).length()*2;
 else if(value instanceof android.graphics.Bitmap)size+=((android.graphics.Bitmap)value).getAllocationByteCount();else size+=4;}}
 public int dataSize(){return size;}public void recycle(){}}""",
    "android/graphics/Bitmap.java": """package android.graphics;public class Bitmap {
 public enum Config {ARGB_8888,HARDWARE,RGBA_F16}public final int width,height;public Config config;
 public boolean recycled,failScale,oversizedCopy;public static Bitmap lastCopy,lastScaled;
 public Bitmap(int w,int h,Config c){width=w;height=h;config=c;}
 public int getWidth(){return width;}public int getHeight(){return height;}public boolean isRecycled(){return recycled;}
 public int getAllocationByteCount(){return width*height*(config==Config.RGBA_F16?8:4)+(oversizedCopy?65536:0);}
 public static Bitmap createScaledBitmap(Bitmap b,int w,int h,boolean filter){if(b.failScale)throw new IllegalStateException("private-cover-error");
 if(w==b.width&&h==b.height)return b;lastScaled=new Bitmap(w,h,b.config);lastScaled.oversizedCopy=b.oversizedCopy;return lastScaled;}
 public Bitmap copy(Config c,boolean mutable){lastCopy=new Bitmap(width,height,c);lastCopy.oversizedCopy=oversizedCopy;return lastCopy;}
 public void recycle(){recycled=true;}}""",
    "android/media/MediaMetadata.java": """package android.media;import java.util.*;import android.graphics.Bitmap;
 public class MediaMetadata {public static final String METADATA_KEY_DISPLAY_TITLE="display_title",METADATA_KEY_TITLE="title",
 METADATA_KEY_DISPLAY_SUBTITLE="display_subtitle",METADATA_KEY_ARTIST="artist",METADATA_KEY_ALBUM_ARTIST="album_artist",
 METADATA_KEY_DISPLAY_ICON="icon",METADATA_KEY_ALBUM_ART="album_art",METADATA_KEY_ART="art";
 public final Map<String,Object> values=new HashMap<>();public CharSequence getText(String k){return (CharSequence)values.get(k);}
 public Bitmap getBitmap(String k){return (Bitmap)values.get(k);}}""",
    "android/media/session/MediaSession.java": """package android.media.session;public class MediaSession {public static class Token {
 public final int uid,id;public Token(int uid,int id){this.uid=uid;this.id=id;}public int getUid(){return uid;}
 public boolean equals(Object o){return o instanceof Token&&((Token)o).uid==uid&&((Token)o).id==id;}
 public int hashCode(){return uid+id;}}}""",
    "android/media/session/PlaybackState.java": """package android.media.session;public class PlaybackState {
 public static final int STATE_NONE=0,STATE_STOPPED=1,STATE_PAUSED=2,STATE_PLAYING=3,STATE_FAST_FORWARDING=4,
 STATE_REWINDING=5,STATE_BUFFERING=6,STATE_CONNECTING=8;
 public static final long ACTION_PLAY=4,ACTION_PAUSE=2,ACTION_PLAY_PAUSE=512,ACTION_SKIP_TO_PREVIOUS=16,ACTION_SKIP_TO_NEXT=32;
 public int state;public long actions;public PlaybackState(int s,long a){state=s;actions=a;}
 public int getState(){return state;}public long getActions(){return actions;}}""",
    "android/media/session/MediaController.java": """package android.media.session;import android.media.MediaMetadata;
 public class MediaController {public MediaSession.Token token;public PlaybackState playback;public MediaMetadata metadata=new MediaMetadata();
 public RuntimeException failure,metadataFailure;public final TransportControls controls=new TransportControls();
 public MediaController(int uid,int id,int state,long actions){token=new MediaSession.Token(uid,id);playback=new PlaybackState(state,actions);}
 public MediaSession.Token getSessionToken(){return token;}public PlaybackState getPlaybackState(){if(failure!=null)throw failure;return playback;}
 public MediaMetadata getMetadata(){if(metadataFailure!=null)throw metadataFailure;return metadata;}public TransportControls getTransportControls(){return controls;}
 public class TransportControls {public int previous,play,pause,next;public RuntimeException failure;
 private void check(){if(failure!=null)throw failure;}public void skipToPrevious(){check();previous++;}
 public void play(){check();play++;}public void pause(){check();pause++;}public void skipToNext(){check();next++;}
 public int total(){return previous+play+pause+next;}}}""",
    "android/media/session/MediaSessionManager.java": """package android.media.session;import android.content.*;import android.os.*;import java.util.*;
 public class MediaSessionManager {public List<MediaController> sessions=new ArrayList<>();public RuntimeException failure;
 public boolean nullDereference;public int lastUser=-1,queries;public List<MediaController> getActiveSessionsForUser(ComponentName ignored,UserHandle user){
 queries++;lastUser=user.id;if(nullDereference)java.util.Objects.requireNonNull(null,"private-session-query");if(failure!=null)throw failure;return sessions;}}""",
    "ls/augment/com/AtomicWorkbenchDiagnostics.java": """package ls.augment.com;import java.util.*;final class AtomicWorkbenchDiagnostics {
 static final List<String> events=new ArrayList<>();static final List<Throwable> errors=new ArrayList<>();
 static void emit(String event,int w,int user,String component,int display,String detail,Throwable error){errors.add(error);
 String stack="";for(int depth=0;error!=null&&depth<4;depth++,error=error.getCause()){stack+=error.getClass().getName();
 StackTraceElement[] frames=error.getStackTrace();for(int i=0;i<Math.min(16,frames.length);i++)stack+=" at "+frames[i];}
 events.add(event+"|"+user+"|"+component+"|"+detail+"|"+stack.substring(0,Math.min(4096,stack.length())));}}""",
}

STUBS = runpy.run_path(str(Path(__file__).with_name("atomic-workbench-media-boundaries.py")))["extend"](STUBS)

TEST = r'''package ls.augment.com;
import android.content.*;import android.os.*;import android.graphics.*;import android.media.*;import android.media.session.*;
import java.util.*;
public final class TestAtomicWorkbenchMedia {
 static int checks;static void yes(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static final long ALL=PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE|PlaybackState.ACTION_SKIP_TO_NEXT|PlaybackState.ACTION_SKIP_TO_PREVIOUS;
 static MediaController session(int uid,int id,int state){return new MediaController(uid,id,state,ALL);}
 static Bitmap art(Bundle b){return b.getParcelable("art",Bitmap.class);}
 static void reject(Runnable action,String message){boolean rejected=false;try{action.run();}catch(IllegalArgumentException expected){rejected=true;}yes(rejected,message);}
 public static void main(String[] args){
  Context context=new Context();MediaSessionManager service=new MediaSessionManager();context.service=service;
  boolean missingBootstrap=false;try{context.getSystemService(Context.MEDIA_SESSION_SERVICE);}catch(NullPointerException expected){missingBootstrap=true;}
  yes(missingBootstrap,"device constructor boundary reproduces NPE before normal framework media initialization");
  android.os.Process.uid=10001;boolean blocked=false;try{new AtomicWorkbenchMedia(context,0);}catch(SecurityException e){blocked=true;}
  yes(blocked,"app process cannot construct Root bridge");android.os.Process.uid=0;
  AtomicWorkbenchMedia media=new AtomicWorkbenchMedia(context,10);Bundle state=media.state();
  yes(state.getBoolean("success")&&state.getBoolean("available")&&!state.getBoolean("has_session"),"empty scoped list is available without a session");
  yes(MediaFrameworkPlatformInitializer.manager!=null&&MediaFrameworkPlatformInitializer.sets==1,"Root repairs missing process-local framework registry before service lookup");
  yes(MediaFrameworkInitializer.manager!=null&&MediaFrameworkInitializer.sets==1,"nested MediaCommunicationManager registry is initialized before service lookup too");
  yes(state.getString("media_status").equals("no_session")&&!state.getBoolean("retryable"),"empty successful query is distinct from an error");
  Object initialized=MediaFrameworkPlatformInitializer.manager;int created=MediaServiceManager.created;media.state();
  yes(initialized==MediaFrameworkPlatformInitializer.manager&&created==MediaServiceManager.created&&MediaFrameworkPlatformInitializer.sets==1,"existing registry is never replaced or initialized twice");
  Object communication=MediaFrameworkInitializer.manager;media.state();
  yes(communication==MediaFrameworkInitializer.manager&&MediaFrameworkInitializer.sets==1,"existing communication registry is preserved too");
  MediaFrameworkInitializer.manager=null;MediaFrameworkInitializer.failure=new NullPointerException("private-communication-bootstrap");state=media.state();
  yes(!state.getBoolean("available")&&state.getBoolean("retryable")&&initialized==MediaFrameworkPlatformInitializer.manager,"secondary bootstrap failure preserves initialized primary registry and allows retry");
  yes(AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1).contains("stage=framework_communication_init"),"nested service bootstrap has a distinct diagnostic stage");
  MediaFrameworkInitializer.failure=null;yes(media.state().getBoolean("available"),"secondary registry initialization recovers without reconnect");
  MediaFrameworkPlatformInitializer.manager=null;MediaFrameworkPlatformInitializer.race=true;state=media.state();MediaFrameworkPlatformInitializer.race=false;
  yes(state.getBoolean("available")&&MediaFrameworkPlatformInitializer.manager!=null,"concurrent setter race accepted only when installed registry can be re-read");
  MediaFrameworkPlatformInitializer.manager=null;MediaFrameworkPlatformInitializer.failure=new NullPointerException("private-bootstrap-failure");state=media.state();
  yes(!state.getBoolean("available")&&state.getBoolean("retryable")&&state.getString("media_status").equals("temporary_error"),"bootstrap NPE is temporary, not claimed unsupported");
  yes(AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1).contains("stage=framework_platform_init"),"bootstrap error includes exact safe stage");
  MediaFrameworkPlatformInitializer.failure=null;state=media.state();yes(state.getBoolean("available"),"failed bootstrap is retried and recovers on same bridge");
  MediaFrameworkPlatformInitializer.manager=null;MediaFrameworkPlatformInitializer.ignore=true;state=media.state();MediaFrameworkPlatformInitializer.ignore=false;
  yes(!state.getBoolean("available")&&state.getBoolean("retryable"),"setter cannot report success when registry remains absent");
  yes(media.state().getBoolean("available"),"unconfirmed initialization remains recoverable");
  yes(service.lastUser==10,"queries owner user rather than Root context user zero");
  yes(state.getString("session_id").isEmpty()&&!state.getBoolean("can_play"),"empty session has no target or enabled actions");
  MediaController paused=session(1010123,1,PlaybackState.STATE_PAUSED),playing=session(1010456,2,PlaybackState.STATE_PLAYING);
  MediaController foreign=session(10077,3,PlaybackState.STATE_PLAYING);
  paused.metadata.values.put("title","paused-private-title");playing.metadata.values.put("title","playing-private-title");
  service.sessions=Arrays.asList(foreign,paused,playing);state=media.state();String id=state.getString("session_id");
  yes(state.getString("title").equals("playing-private-title")&&state.getBoolean("playing"),"playing current-user session outranks paused and foreign sessions");
  yes(id.matches("[0-9a-f]{32}"),"UI receives opaque bounded ID rather than system token");
  yes(state.getBoolean("can_pause")&&!state.getBoolean("can_play")&&state.getBoolean("can_previous")&&state.getBoolean("can_next"),"actions and playback state gate controls");
  state=media.command("pause",id);yes(state.getBoolean("success")&&playing.controls.pause==1,"pause sent to observed scoped controller");
  yes(state.getBoolean("playing"),"asynchronous command does not optimistically overwrite reported playback");
  media.command("previous",id);media.command("next",id);yes(playing.controls.previous==1&&playing.controls.next==1,"skip commands reach correct transport methods");
  int before=playing.controls.total();state=media.command("play",id);
  yes(!state.getBoolean("success")&&playing.controls.total()==before,"play rejected when already playing");
  playing.playback=new PlaybackState(PlaybackState.STATE_PAUSED,PlaybackState.ACTION_PLAY_PAUSE);state=media.state();
  yes(id.equals(state.getString("session_id"))&&state.getBoolean("can_play")&&!state.getBoolean("can_pause"),"same token stays selected and ID survives paused playback");
  state=media.command("play",id);yes(state.getBoolean("success")&&playing.controls.play==1,"toggle-capable session accepts explicit play");
  state=media.command("next",id);yes(!state.getBoolean("success")&&playing.controls.next==1,"unsupported action never invokes transport");
  playing.metadata.values.put("title","next-private-track");
  yes(media.state().getString("session_id").equals(id),"track metadata changes do not change token identity");
  paused.playback.state=PlaybackState.STATE_PLAYING;state=media.command("pause",id);
  yes(!state.getBoolean("success")&&!state.getString("session_id").equals(id)&&paused.controls.total()==0,"stale card rejected when another session becomes preferred");
  String pausedId=state.getString("session_id");service.sessions=Collections.singletonList(foreign);state=media.command("pause",pausedId);
  yes(state.getBoolean("available")&&!state.getBoolean("has_session")&&!state.getBoolean("success")&&foreign.controls.total()==0,"foreign-user session cannot receive stale command");
  service.sessions=Collections.singletonList(paused);state=media.state();
  yes(!state.getString("session_id").equals(pausedId),"session disappears and returns with a new UI identity");
  reject(()->media.command("shell","0".repeat(32)),"arbitrary command rejected");
  reject(()->media.command("play","0".repeat(100000)),"oversized session ID rejected");
  reject(()->media.command("play",null),"missing session ID rejected");
  reject(()->media.command(null,"0".repeat(32)),"missing command rejected");
  reject(()->media.command("pause","A".repeat(32)),"noncanonical session ID rejected");
  reject(()->AtomicWorkbenchProtocol.requireFocusComponent(null),"focus target must be present");
  reject(()->AtomicWorkbenchProtocol.requireFocusComponent("a".repeat(512)+"/.Main"),"focus component is bounded");
  reject(()->AtomicWorkbenchProtocol.requireFocusComponent("app/.Main\n"),"focus component cannot include control characters");
  reject(()->AtomicWorkbenchProtocol.requireFocusComponent("app"),"focus component must be flattened component");
  yes(AtomicWorkbenchProtocol.requireFocusComponent("example.app/.Main")!=null,"canonical focus component accepted");
  service.failure=new SecurityException("private-permission-message");state=media.state();
  yes(!state.getBoolean("available")&&!state.getBoolean("success")&&!state.getBoolean("has_session"),"permission loss is unavailable not empty list");
  yes(state.getString("message").contains("权限")&&!state.getString("message").contains("private"),"permission explanation contains no system exception message");
  yes(state.getString("media_status").equals("permission_denied")&&state.getBoolean("retryable"),"permission denial is distinct and can recover");
  int events=AtomicWorkbenchDiagnostics.events.size();media.state();media.state();
  yes(events==AtomicWorkbenchDiagnostics.events.size(),"repeated unavailable polling does not flood diagnostics");
  service.failure=null;state=media.state();yes(state.getBoolean("available"),"permission restoration recovers capability without reconnect");
  String recoveredId=state.getString("session_id");service.nullDereference=true;state=media.state();
  yes(state.getBoolean("retryable")&&state.getString("media_status").equals("temporary_error")&&!state.getString("message").contains("不支持"),"session query NPE has honest temporary UI explanation");
  yes(AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1).contains("stage=session_query")
    &&AtomicWorkbenchDiagnostics.errors.get(AtomicWorkbenchDiagnostics.errors.size()-1) instanceof NullPointerException,"reflection wrapper is unwrapped and actual throwable reaches bounded diagnostics");
  service.nullDereference=false;state=media.command("pause",recoveredId);
  yes(!state.getBoolean("success")&&paused.controls.total()==0,"error recovery invalidates stale UI session identity before control");
  paused.failure=new NullPointerException("private-playback");state=media.state();paused.failure=null;
  yes(state.getBoolean("retryable")&&AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1).contains("stage=playback"),"playback failure has a distinct stage");
  paused.metadataFailure=new NullPointerException("private-metadata");state=media.state();paused.metadataFailure=null;
  yes(state.getBoolean("retryable")&&AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1).contains("stage=metadata"),"metadata failure records location without metadata contents");
  state=media.state();yes(state.getBoolean("available"),"transient playback and metadata errors recover without a new Root connection");
  String newId=state.getString("session_id");paused.controls.failure=new SecurityException("private-command-error");state=media.command("pause",newId);
  yes(!state.getBoolean("available")&&paused.controls.total()==0,"control permission loss reported without action");
  yes(AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1).contains("stage=transport_command"),"control failure records transport stage without command arguments");
  paused.controls.failure=null;paused.playback=new PlaybackState(PlaybackState.STATE_PLAYING,ALL);
  paused.metadata.values.put("display_title"," T\n"+"x".repeat(300));paused.metadata.values.put("display_subtitle","subtitle-".repeat(100));
  Bitmap original=new Bitmap(1024,512,Bitmap.Config.HARDWARE);paused.metadata.values.put("icon",original);state=media.state();
  yes(state.getString("title").length()<=160&&state.getString("subtitle").length()<=160&&!state.getString("title").contains("\n"),"metadata text is bounded and controls removed");
  yes(art(state)!=null&&art(state).getWidth()==128&&art(state).getHeight()==64&&art(state).config==Bitmap.Config.ARGB_8888,"cover is aspect-preserving bounded software copy");
  yes(art(state).getAllocationByteCount()<=65536&&!original.recycled&&Bitmap.lastScaled.recycled,"cover memory bounded and original metadata bitmap retained");
  Parcel parcel=Parcel.obtain();parcel.writeBundle(state);yes(parcel.dataSize()<=AtomicWorkbenchMedia.MAX_REPLY_BYTES,"ordinary response stays within Binder budget");
  original.failScale=true;state=media.state();yes(state.getBoolean("available")&&state.getBoolean("can_pause")&&art(state)==null,"broken cover does not disable media controls");
  original.failScale=false;original.oversizedCopy=true;state=media.state();
  yes(art(state)==null&&Bitmap.lastCopy.recycled,"unexpected oversized bitmap allocation is rejected and released");
  original.oversizedCopy=false;Parcel.extraBytes=AtomicWorkbenchMedia.MAX_REPLY_BYTES;state=media.state();Parcel.extraBytes=0;
  yes(art(state)==null&&Bitmap.lastCopy.recycled,"parcel budget overflow strips and releases optional art");
  Bitmap small=new Bitmap(20,10,Bitmap.Config.RGBA_F16);paused.metadata.values.put("icon",small);state=media.state();
  yes(art(state).getWidth()==20&&art(state).config==Bitmap.Config.ARGB_8888&&!small.recycled,"small HDR artwork copied without upscaling or recycling source");
  service.sessions=new ArrayList<>();for(int i=0;i<100;i++)service.sessions.add(session(1010000+i,100+i,PlaybackState.STATE_PAUSED));
  service.sessions.get(99).failure=new IllegalStateException("must not examine unbounded list");
  yes(media.state().getBoolean("available"),"session traversal has fixed upper bound");
  service.sessions=null;yes(!media.state().getBoolean("available"),"malformed system response cannot masquerade as empty session list");
  context.service=null;state=media.state();yes(!state.getBoolean("available")&&state.getBoolean("retryable")&&state.getString("media_status").equals("temporary_error"),"temporarily missing service does not claim unsupported API");
  context.service=service;service.sessions=Collections.emptyList();yes(media.state().getBoolean("available"),"service returning later recovers");
  context.linkage=new NoSuchMethodError("private-missing-api");state=media.state();context.linkage=null;
  yes(!state.getBoolean("available")&&!state.getBoolean("retryable")&&state.getString("media_status").equals("unsupported"),"missing required runtime API is explicitly unsupported");
  yes(media.state().getBoolean("available"),"unsupported report is not permanently cached");
  state=AtomicWorkbenchMedia.closed();yes(!state.getBoolean("available")&&!state.getBoolean("success")&&!state.getBoolean("can_play"),"closing backend disables controls");
  yes(state.getString("media_status").equals("closed")&&!state.getBoolean("retryable"),"closed lifecycle is not a retryable media error");
  String diagnostic=String.join("\n",AtomicWorkbenchDiagnostics.events);
  yes(!diagnostic.contains("private")&&!diagnostic.contains(id)&&!diagnostic.contains("1010456")&&!diagnostic.contains("subtitle"),"diagnostics contain no metadata, session IDs, player identity or exception text");
  yes(diagnostic.contains("SecurityException")&&diagnostic.contains("capability=available")&&diagnostic.contains("capability=unavailable")&&diagnostic.contains(" at android.media."),"diagnostics preserve capability transitions, safe stages and actual exception frames");
  System.out.println("PASS atomic workbench media: "+checks+" assertions");
 }
}'''


def contracts():
    root = (SRC / "AtomicWorkbenchRoot.java").read_text(encoding="utf-8")
    client = (SRC / "AtomicWorkbenchClient.java").read_text(encoding="utf-8")
    media = (SRC / "AtomicWorkbenchMedia.java").read_text(encoding="utf-8")
    start = root.index("} else if (code == AtomicWorkbenchProtocol.TX_MEDIA_STATE)")
    section = root[start:root.index("} else if (code == AtomicWorkbenchProtocol.TX_CLOSE_WINDOW)", start)]
    assert root.index("Binder.getCallingUid() != appUid") < root.index("AtomicWorkbenchProtocol.sameToken") < start
    assert section.count("data.enforceNoDataAvail()") >= 2
    assert "AtomicWorkbenchProtocol.requireMediaCommand(command, sessionId)" in section
    assert "backend()" not in section and section.count("state = executeInputMetadata(") >= 3
    assert section.count("closing || finished") >= 2
    assert "AtomicWorkbenchMedia.closed()" in section
    assert "public Bundle mediaState() throws Exception" in client and "public Bundle mediaCommand(String command, String sessionId) throws Exception" in client
    assert "getActiveSessionsForUser" in media and "getActiveSessions(null)" not in media
    assert not any(x in media for x in ("Runtime.getRuntime", "ProcessBuilder", "registerCallback", "postDelayed"))
    home = root[root.index("Bundle state;"):root.index("} else if (code == AtomicWorkbenchProtocol.TX_FOCUS_WINDOW)")]
    assert "code == AtomicWorkbenchProtocol.TX_NATIVE_HOME" in home and "backend().showNativeHome(windowId, surface, width, height, density)" in home
    assert "String component = nativeHome ? null : data.readString()" in home
    assert "bindOwner(supplied)" in home and "closing || finished" in home and "surface.release()" in home
    focus = root[root.index("} else if (code == AtomicWorkbenchProtocol.TX_FOCUS_APP)"):start]
    assert "requireWindow(windowId)" in focus and "data.enforceNoDataAvail()" in focus
    assert "AtomicWorkbenchProtocol.requireFocusComponent(component)" in focus
    assert "backend().focusAppWindow(windowId, component)" in focus and "uiInputUnavailable()" in focus
    print("PASS media transport: existing UID/token authentication, strict payloads, serial engine, no virtual display allocation")
    print("PASS Home/focus transport: owner-bound Surface handoff, strict bounded targets, closing guards")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", default=os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8"))
    parser.add_argument("--android-jar", type=Path, default=ROOT / "audit-output/android-sdk/platforms/android-36/android.jar")
    args = parser.parse_args()
    jdk = Path(args.jdk)
    suffix = ".exe" if os.name == "nt" else ""
    javac = str(jdk / "bin" / ("javac" + suffix)) if jdk.is_dir() else shutil.which("javac")
    java = str(jdk / "bin" / ("java" + suffix)) if jdk.is_dir() else shutil.which("java")
    if not javac or not java:
        parser.error("JDK required; pass --jdk")
    contracts()
    def run_sources(sources, test):
      with tempfile.TemporaryDirectory(prefix="duo-atomic-media-") as tmp:
        directory = Path(tmp)
        sources = dict(sources)
        sources["ls/augment/com/TestAtomicWorkbenchMedia.java"] = test
        files = []
        for relative, content in sources.items():
            path = directory / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            files.append(path)
        files += [SRC / (name + ".java") for name in ("AtomicWorkbenchMedia", "AtomicWorkbenchMediaSources", "AtomicWorkbenchMediaProgress", "AtomicWorkbenchMediaObservers", "AtomicWorkbenchMediaSessionEvidenceClient", "AtomicWorkbenchProtocol")]
        subprocess.run([javac, "-J-Duser.language=en", "-J-Dfile.encoding=UTF-8", "-encoding", "UTF-8", "--release", "17", "-d", tmp, *map(str, files)], check=True)
        subprocess.run([java, "-cp", tmp, "ls.augment.com.TestAtomicWorkbenchMedia"], check=True, timeout=30)
    run_sources(STUBS, TEST)

    # Remove real reflection targets, rather than simulating every mismatch with
    # an exception. The production bridge must distinguish old and missing APIs.
    for variant in ("legacy", "initializer_api_missing", "scoped_api_missing", "owner_api_missing"):
        sources = dict(STUBS)
        if variant in ("legacy", "initializer_api_missing"):
            sources["android/content/Context.java"] = STUBS["android/content/Context.java"].replace("android.media.MediaFrameworkPlatformInitializer.getMediaServiceManager().getMediaSessionServiceRegisterer();", "").replace("android.media.MediaFrameworkInitializer.getMediaServiceManager().getMediaCommunicationServiceRegisterer();", "")
            if variant == "legacy":
                del sources["android/media/MediaFrameworkPlatformInitializer.java"]
                del sources["android/media/MediaFrameworkInitializer.java"]
            else:
                sources["android/media/MediaFrameworkPlatformInitializer.java"] = "package android.media;public class MediaFrameworkPlatformInitializer {}"
        elif variant == "scoped_api_missing":
            key = "android/media/session/MediaSessionManager.java"
            sources[key] = sources[key].replace("getActiveSessionsForUser", "getActiveSessionsLegacy")
        else:
            key = "android/media/session/MediaSession.java"
            sources[key] = sources[key].replace("getUid()", "getLegacyUid()")
        expected = 'state.getBoolean("available")&&state.getString("media_status").equals("no_session")' if variant == "legacy" else \
            '!state.getBoolean("available")&&!state.getBoolean("retryable")&&state.getString("media_status").equals("unsupported")'
        stage = {"legacy": "ready", "initializer_api_missing": "framework_platform_init", "scoped_api_missing": "session_api", "owner_api_missing": "session_owner"}[variant]
        test = '''package ls.augment.com;import android.content.Context;import android.os.Bundle;import android.media.session.MediaSessionManager;
public class TestAtomicWorkbenchMedia {public static void main(String[] args){Context context=new Context();context.service=new MediaSessionManager();
 if("%s".equals("owner_api_missing"))((MediaSessionManager)context.service).sessions.add(new android.media.session.MediaController(1010123,9,3,4));
 Bundle state=new AtomicWorkbenchMedia(context,10).state();if(!(%s))throw new AssertionError("%s classification");
 if(!AtomicWorkbenchDiagnostics.events.get(0).contains("stage=%s"))throw new AssertionError("%s diagnostic stage");
 System.out.println("PASS media compatibility %s: 2 assertions");}}''' % (variant, expected, variant, stage, variant, variant)
        run_sources(sources, test)

    if args.android_jar.is_file():
        with tempfile.TemporaryDirectory(prefix="duo-atomic-media-sdk-") as tmp:
            stub = Path(tmp) / "AtomicWorkbenchDiagnostics.java"
            stub.write_text(STUBS["ls/augment/com/AtomicWorkbenchDiagnostics.java"], encoding="utf-8")
            subprocess.run([javac, "-J-Duser.language=en", "-J-Dfile.encoding=UTF-8", "-encoding", "UTF-8", "--release", "17", "-cp", str(args.android_jar), "-d", tmp,
                            str(stub), *[str(SRC / (name + ".java")) for name in ("AtomicWorkbenchMedia", "AtomicWorkbenchMediaSources", "AtomicWorkbenchMediaProgress", "AtomicWorkbenchMediaObservers", "AtomicWorkbenchMediaSessionEvidenceClient", "AtomicWorkbenchProtocol")]], check=True)
        print("PASS production media bridge compiles against installed Android SDK")


if __name__ == "__main__":
    main()
