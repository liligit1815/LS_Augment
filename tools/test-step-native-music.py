"""Run production lyric fallback, native capability and system-session selection contracts."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
STEP = ROOT / "android/app/src/main/java/ls/augment/com/step"
JAVA = Path(os.environ["JAVA_HOME"]) / "bin"
with tempfile.TemporaryDirectory(prefix="step-native-music-") as temp:
    root = Path(temp)
    files = {
        "android/media/session/PlaybackState.java": """package android.media.session;
public class PlaybackState {public static int STATE_PLAYING=3;int state;
public static final long ACTION_SEEK_TO=256;
public PlaybackState(int s){state=s;}public int getState(){return state;}}""",
        "android/media/session/MediaController.java": """package android.media.session;
public class MediaController {String pkg,token;int state;
public MediaController(String p,String t,int s){pkg=p;token=t;state=s;}
public String getPackageName(){return pkg;}public Object getSessionToken(){return token;}
public static class TransportControls {public long lastSeek=-1;public void seekTo(long value){lastSeek=value;}}
private TransportControls controls=new TransportControls();public TransportControls getTransportControls(){return controls;}
public PlaybackState getPlaybackState(){return new PlaybackState(state);}}""",
        "android/media/session/MediaSessionManager.java": """package android.media.session;
public class MediaSessionManager {
public interface OnActiveSessionsChangedListener {}
public int removed;
public void removeOnActiveSessionsChangedListener(OnActiveSessionsChangedListener l){removed++;}
}""",
        "ls/augment/com/step/MusicCases.java": r"""package ls.augment.com.step;
import java.util.*;import java.io.*;import android.media.session.*;
public class MusicCases {
    static int checks;
    static void check(boolean ok,String name){checks++;if(!ok)throw new AssertionError(name);}
    static void rejected(Runnable r,String name){
        boolean no=false;try{r.run();}catch(RuntimeException|LinkageError expected){no=true;}check(no,name);
    }
    public static class Legacy {public Number controller=1;public void listen(boolean on){}}
    public static class Child extends Legacy {}
    public static class NewCard {public Integer controller=2;public void listen(boolean on){}}
    public static class WrongType {public String controller="";public int listen(boolean on){return 1;}}
    public static class StaticField {public static Number controller=1;public static void listen(boolean on){}}
    public static class Current extends MediaSessionManager {
        public Object getMediaKeyEventSession(){return "paused";}
        public String getMediaKeyEventSessionPackageName(){return "same";}
    }
    public static class Old extends MediaSessionManager {public String getMediaKeyEventSessionPackageName(){return "other";}}
    public static class Denied extends Current {
        public Object getMediaKeyEventSession(){throw new SecurityException();}
        public String getMediaKeyEventSessionPackageName(){throw new SecurityException();}
    }
    public static void main(String[] ignored)throws Exception{
        for(Class<?> type:new Class<?>[]{Legacy.class,Child.class,NewCard.class}){
            check(NativeMusicContract.field(type,"controller",Number.class)!=null,"inherited/subtype field");
            check(NativeMusicContract.method(type,"listen",void.class,boolean.class)!=null,"inherited/old method");
        }
        rejected(()->NativeMusicContract.field(WrongType.class,"controller",Number.class),"wrong field type");
        rejected(()->NativeMusicContract.method(WrongType.class,"listen",void.class,boolean.class),"wrong return type");
        rejected(()->NativeMusicContract.field(Child.class,"absent",Number.class),"missing field");
        rejected(()->NativeMusicContract.method(Child.class,"absent",void.class),"missing method");
        rejected(()->NativeMusicContract.field(StaticField.class,"controller",Number.class),"static field");
        rejected(()->NativeMusicContract.method(StaticField.class,"listen",void.class,boolean.class),"static method");
        MediaController playing=new MediaController("same","playing",3);
        MediaController paused=new MediaController("same","paused",2);
        MediaController other=new MediaController("other","other",2);
        List<MediaController> sessions=List.of(playing,paused,other);
        check(SystemMediaSelection.current(new Current(),sessions)==paused,"exact media-key token wins over playback and package");
        check(SystemMediaSelection.current(new Old(),sessions)==other,"old package API");
        check(SystemMediaSelection.current(new Denied(),sessions)==playing,"denial preserves previous capability");
        check(SystemMediaSelection.current(new Current(),List.of())==null,"empty sessions");
        for(int hint=-1;hint<4;hint++){
            int[] order=LyricLookup.order(-1,hint);
            check(order.length==4 && Arrays.stream(order).distinct().count()==4,"all sources once");
            check(order[0]==(hint<0?3:hint),"provider priority");
        }
        check(Arrays.equals(LyricLookup.order(1,2),new int[]{1}),"manual source has no hidden fanout");
        List<Integer> calls=new ArrayList<>();
        LyricLookup.Result found=LyricLookup.query(new int[]{2,3,0,1},i->{
            calls.add(i);if(i==2)throw new IOException("offline");
            return i==0?LyricLookup.Result.text("[00:01]found",i):LyricLookup.Result.state(LyricLookup.Status.NO_MATCH,i);
        });
        check(found.status==LyricLookup.Status.FOUND && found.source==0,"outage and empty source fallback");
        check(calls.equals(List.of(2,3,0)),"stop on found");
        check(LyricLookup.query(new int[]{0,1},i->LyricLookup.Result.state(LyricLookup.Status.NO_MATCH,i)).status==LyricLookup.Status.NO_MATCH,"all successful empty");
        check(LyricLookup.query(new int[]{0,1},i->{if(i==0)throw new IOException();return LyricLookup.Result.state(LyricLookup.Status.NO_MATCH,i);}).status==LyricLookup.Status.UNAVAILABLE,"partial outage not false no-match");
        calls.clear();
        check(LyricLookup.query(new int[]{3,0},i->{calls.add(i);return LyricLookup.Result.state(LyricLookup.Status.INSTRUMENTAL,i);}).status==LyricLookup.Status.INSTRUMENTAL && calls.size()==1,"explicit instrumental");
        calls.clear();boolean interrupted=false;
        try{LyricLookup.query(new int[]{0,1},i->{calls.add(i);Thread.currentThread().interrupt();throw new InterruptedIOException();});}
        catch(InterruptedIOException expected){interrupted=true;}
        finally{Thread.interrupted();}
        check(interrupted && calls.size()==1,"cancel never starts a next source");
        calls.clear();
        found=LyricLookup.query(new int[]{2,3},i->{
            calls.add(i);if(i==2)throw new java.net.SocketTimeoutException();
            return LyricLookup.Result.text("[00:01]after timeout",i);
        });
        check(found.status==LyricLookup.Status.FOUND && calls.equals(List.of(2,3)),"network timeout is not user cancellation");
        LyricLookup.clear();int[] count={0};
        LyricLookup.Source source=i->{count[0]++;return LyricLookup.Result.text("[00:01]cached",i);};
        check(LyricLookup.run("missing",-1,0,false,false,source).status==LyricLookup.Status.INSUFFICIENT && count[0]==0,"missing metadata sends nothing");
        LyricLookup.run("one",-1,0,true,false,source);LyricLookup.run("one",-1,0,true,false,source);
        check(count[0]==1,"same track reuses memory cache");
        LyricLookup.run("one",-1,0,true,true,source);check(count[0]==2,"explicit retry bypasses cache");
        LyricLookup.run("one",3,0,true,false,source);check(count[0]==3,"manual provider has own cache");
        LyricLookup.clear();LyricLookup.run("one",-1,0,true,false,source);check(count[0]==4,"user switch clears cache");
        for(int i=0;i<25;i++)LyricLookup.run("track"+i,-1,0,true,false,source);
        int before=count[0];LyricLookup.run("one",-1,0,true,false,source);check(count[0]==before+1,"bounded LRU");
        LyricLookup.clear();before=count[0];
        LyricLookup.run("in-flight",-1,0,true,false,i->{LyricLookup.clear();return source.query(i);});
        LyricLookup.run("in-flight",-1,0,true,false,source);
        check(count[0]==before+2,"old user response cannot repopulate a cleared cache");
        SongLines lines=new SongLines("[00:01]previous\n[00:02]current\n[00:03]next");
        SongLines.Display display=lines.display(2500,true);
        check(display.text.equals("previous\ncurrent\nnext"),"context before and after");
        check(display.text.substring(display.currentStart,display.currentEnd).equals("current"),"highlight current not previous");
        check(lines.display(0,true).currentStart==-1,"no early false highlight");
        check(new SongLines("plain lyrics").display(0,true).currentStart==-1,"plain lyric is not timed");
        System.out.println("PASS "+checks+" native music and lyric contracts");
    }
}""",
    }
    # StepMembers' unrelated hook bridge is only a compile-time dependency of the resolver.
    files["ls/augment/com/step/StepHook.java"] = "package ls.augment.com.step; class StepHook {}"
    files["ls/augment/com/step/StepHooks.java"] = "package ls.augment.com.step; class StepHooks {static void hookMethod(java.lang.reflect.Method m,StepHook h){throw new AssertionError();}}"
    for name, data in files.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(data, encoding="utf-8")
    production = ["NativeMusicContract", "StepMembers", "SystemMediaSelection", "LyricLookup", "SongLines"]
    subprocess.run([JAVA/"javac", "-encoding", "UTF-8", "-d", root,
                    *[STEP/f"{name}.java" for name in production], *root.rglob("*.java")], check=True)
    subprocess.run([JAVA/"java", "-cp", root, "ls.augment.com.step.MusicCases"], check=True)
    native = (STEP/"NativeMusicCard.java").read_text(encoding="utf-8")
    def method(signature):
        start = native.index("    "+signature)
        end = native.index("{", start)+1
        depth = 1
        while depth:
            depth += (native[end] == "{")-(native[end] == "}")
            end += 1
        return native[start:end]
    binding = r"""package ls.augment.com.step;
import java.util.*;import java.lang.reflect.*;import android.media.session.*;
public class BindingCases {
    static int checks;
    static void check(boolean ok,String name){checks++;if(!ok)throw new AssertionError(name);}
    public static class Adapter {int stopped;public void removeTimeUpdateCallback(){stopped++;}}
    public static class Card {
        public MediaController current;public boolean dead;
        public MediaSessionManager sessions=new MediaSessionManager();
        public MediaSessionManager.OnActiveSessionsChangedListener listener=new MediaSessionManager.OnActiveSessionsChangedListener(){};
        public Adapter adapter=new Adapter();String wanted="one";int registrations,unregistered;boolean listening=true,fail;
        public boolean support(String pkg){return !pkg.equals("unsupported");}
        public void refresh(List<MediaController> list){
            if(fail)throw new IllegalStateException("expired interface");
            for(MediaController c:list)if(c.getSessionToken().equals(wanted)){current=c;dead=false;registrations++;return;}
        }
        public void unreg(){unregistered++;}
        public void listening(boolean on){listening=on;}
    }
    final Card card=new Card();
    final Field controller=StepMembers.findField(Card.class,"current"),destroyed=StepMembers.findField(Card.class,"dead");
    final Field nativeSessions=StepMembers.findField(Card.class,"sessions"),nativeListener=StepMembers.findField(Card.class,"listener"),nativeDetail=StepMembers.findField(Card.class,"adapter");
    final Method support=StepMembers.findMethodExact(Card.class,"support",String.class),refresh=StepMembers.findMethodExact(Card.class,"refresh",List.class);
    final Method unregister=StepMembers.findMethodExact(Card.class,"unreg"),stopDetail=StepMembers.findMethodExact(Adapter.class,"removeTimeUpdateCallback"),listening=StepMembers.findMethodExact(Card.class,"listening",boolean.class);
    boolean closed,detachFails;int missing,dialogsClosed,removes;
    void missing(Throwable e){missing++;}
    void closeDetail(){dialogsClosed++;}
    void removeView(Card view){removes++;if(detachFails)throw new IllegalStateException("partly attached");}
    SELECTED
    MATCHES
    CLOSE
    public static void main(String[] args){
        BindingCases b=new BindingCases();
        MediaController first=new MediaController("supported","one",3),second=new MediaController("supported","two",2),other=new MediaController("unsupported","other",3);
        List<MediaController> active=List.of(first,second,other);
        check(b.selected(active,first)==first,"native first admission");
        check(b.matches(first),"same token matches");
        check(b.selected(active,first)==first && b.card.registrations==1,"no duplicate native callback");
        check(b.selected(active,other)==null && !b.matches(other),"unsupported player preserves native path");
        check(b.selected(List.of(),first)==null,"stale native session rejected");
        b.card.wanted="two";check(b.selected(active,second)==second && !b.matches(first),"session switch follows target");
        b.card.dead=true;check(!b.matches(second),"destroyed session is not actionable");
        check(b.selected(active,second)==second && !b.card.dead,"native readmission");
        b.card.fail=true;check(b.selected(active,first)==null && b.missing==1,"changed capability safely falls back");
        b.detachFails=true;b.close();
        check(b.closed && b.removes==1 && b.dialogsClosed==1,"close own view");
        check(b.card.unregistered==1 && b.card.sessions.removed==1,"cleanup even when detach fails");
        check(b.card.adapter.stopped==1 && !b.card.listening,"cleanup timers and layout listening");
        b.close();check(b.card.unregistered==1,"close idempotent");
        check(!b.matches(second) && b.selected(active,second)==null,"closed instance cannot issue actions");
        BindingCases early=new BindingCases();early.selected(active,first);early.close();
        check(early.card.unregistered==1 && early.card.sessions.removed==1 && early.card.adapter.stopped==1,"pre-attachment failure releases acquired callbacks");
        System.out.println("PASS "+checks+" production native music binding/lifecycle checks");
    }
}"""
    for marker, signature in [("SELECTED","MediaController selected("),("MATCHES","boolean matches("),("CLOSE","void close(")]:
        binding = binding.replace(marker, method(signature))
    path = root/"ls/augment/com/step/BindingCases.java"
    path.write_text(binding, encoding="utf-8")
    subprocess.run([JAVA/"javac","-encoding","UTF-8","-cp",root,"-d",root,path],check=True)
    subprocess.run([JAVA/"java","-cp",root,"ls.augment.com.step.BindingCases"],check=True)
    seeking = r"""package ls.augment.com.step;
import java.lang.reflect.*;import android.media.session.*;
public class SeekCases {
    static int checks;
    static void check(boolean ok,String name){checks++;if(!ok)throw new AssertionError(name);}
    static class View {java.util.function.Consumer<View> click;void setOnClickListener(java.util.function.Consumer<View> c){click=c;}}
    static class SeekBar extends View {
        interface OnSeekBarChangeListener {
            void onStartTrackingTouch(SeekBar b);void onProgressChanged(SeekBar b,int value,boolean user);void onStopTrackingTouch(SeekBar b);
        }
        OnSeekBarChangeListener mOnSeekBarChangeListener;int progress=3500;Object thumb;
        SeekBar(){}SeekBar(Object ctx){thumb=new Object();}
        Object getThumb(){return thumb;}void setThumb(Object t){thumb=t;}int getProgress(){return progress;}
        void setOnSeekBarChangeListener(OnSeekBarChangeListener l){mOnSeekBarChangeListener=l;}
    }
    public static class Panel extends View {
        public SeekBar mProgressSeekBar=new SeekBar();
        public View mPrevButton=new View(),mPlayPauseButton=new View(),mNextButton=new View();int calls;
        public void sendButtonClickEvent(String action){calls++;}
    }
    static class Owner {void checkAction(){}}
    static class Player {
        MediaController controller;String identity="song";long duration=5000;boolean allowed=true;Owner owner=new Owner();
        boolean permitted(long action){return allowed;}
    }
    Player player=new Player();boolean closed,detailSeeking;Object nativeContext=new Object();View detail;
    Method detailClick=StepMembers.findMethodExact(Panel.class,"sendButtonClickEvent",String.class);
    void missing(Throwable e){throw new AssertionError(e);}
    GUARD
    public static void main(String[] args)throws Exception{
        SeekCases h=new SeekCases();Panel panel=new Panel();h.detail=panel;
        MediaController one=new MediaController("a","one",3),two=new MediaController("b","two",3);
        h.player.controller=one;h.guardSeeking(panel,one,"song");
        SeekBar bar=panel.mProgressSeekBar;SeekBar.OnSeekBarChangeListener bridge=bar.mOnSeekBarChangeListener;
        check(bar.thumb!=null,"native read-only widget becomes draggable");
        bridge.onStartTrackingTouch(bar);check(h.detailSeeking,"progress ticks suspended during drag");
        bridge.onStopTrackingTouch(bar);check(!h.detailSeeking && one.getTransportControls().lastSeek==3500,"seek original bound track");
        bar.progress=9000;bridge.onStopTrackingTouch(bar);check(one.getTransportControls().lastSeek==5000,"duration clamp");
        one.getTransportControls().lastSeek=-1;h.player.controller=two;
        bridge.onStopTrackingTouch(bar);check(one.getTransportControls().lastSeek==-1 && two.getTransportControls().lastSeek==-1,"replacement player receives no stale seek");
        h.player.controller=one;h.player.identity="other song";bridge.onStopTrackingTouch(bar);
        check(one.getTransportControls().lastSeek==-1,"same player next song receives no stale seek");
        h.player.identity="song";h.player.allowed=false;bridge.onStopTrackingTouch(bar);
        check(one.getTransportControls().lastSeek==-1,"revoked seek capability");
        h.player.allowed=true;panel.mPlayPauseButton.click.accept(panel.mPlayPauseButton);check(panel.calls==1,"native button implementation retained");
        h.player.controller=two;panel.mPlayPauseButton.click.accept(panel.mPlayPauseButton);check(panel.calls==1,"native button old session refused");
        h.player.controller=one;int[] original={0};Panel newer=new Panel();h.detail=newer;
        newer.mProgressSeekBar.mOnSeekBarChangeListener=new SeekBar.OnSeekBarChangeListener(){
            public void onStartTrackingTouch(SeekBar b){original[0]++;}
            public void onProgressChanged(SeekBar b,int n,boolean user){original[0]++;}
            public void onStopTrackingTouch(SeekBar b){original[0]++;}
        };
        h.guardSeeking(newer,one,"song");bridge=newer.mProgressSeekBar.mOnSeekBarChangeListener;
        bridge.onStartTrackingTouch(newer.mProgressSeekBar);bridge.onProgressChanged(newer.mProgressSeekBar,10,true);bridge.onStopTrackingTouch(newer.mProgressSeekBar);
        check(original[0]==3 && one.getTransportControls().lastSeek==-1,"newer native seek listener retained without duplicate command");
        h.closed=true;bridge.onStopTrackingTouch(newer.mProgressSeekBar);check(original[0]==3,"closed card suppresses late drag");
        System.out.println("PASS "+checks+" production native seek/action checks");
    }
}""".replace("GUARD",method("void guardSeeking("))
    path=root/"ls/augment/com/step/SeekCases.java"
    path.write_text(seeking,encoding="utf-8")
    subprocess.run([JAVA/"javac","-encoding","UTF-8","-cp",root,"-d",root,path],check=True)
    subprocess.run([JAVA/"java","-cp",root,"ls.augment.com.step.SeekCases"],check=True)
