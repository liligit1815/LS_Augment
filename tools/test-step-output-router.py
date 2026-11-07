"""Run the production Step output-router binding with independently granted host permissions."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
STEP = ROOT / 'android/app/src/main/java/ls/augment/com/step'
source = (STEP / 'PlayerCard.java').read_text(encoding='utf-8')
method = source[source.index('    private void bindOutputRouter('):source.index('    boolean permitted(')]
java = Path(os.environ['JAVA_HOME']) / 'bin' if 'JAVA_HOME' in os.environ else Path()
with tempfile.TemporaryDirectory(prefix='step-output-router-') as temp:
    folder = Path(temp)
    files = {
        'android/Manifest.java': 'package android; public class Manifest {public static class permission {public static final String MEDIA_CONTENT_CONTROL="content", MEDIA_ROUTING_CONTROL="routing";}}',
        'android/content/pm/PackageManager.java': 'package android.content.pm; public class PackageManager {public static final int PERMISSION_GRANTED=0;}',
        'TestRoute.java': '''import java.util.*;
public class TestRoute {
    static final int GONE=8;
    static class Owner {
        Owner ctx=this,host=this,main=this,output=this;
        Set<String> grants=new HashSet<>();
        String message=""; int visibility;
        int checkSelfPermission(String permission){return grants.contains(permission)?0:-1;}
        void post(Runnable action){action.run();}
        void log(String s){message=s;}
        void setVisibility(int value){visibility=value;}
    }
    static class MediaController {String getPackageName(){return "example.player";}}
    static class MediaRouter2 {
        static int calls,fail; static Runnable invalidated;
        static MediaRouter2 getInstance(Owner ctx,String pkg,java.util.concurrent.Executor executor,Runnable remove) {
            if(!pkg.equals("example.player"))throw new AssertionError("lost selected source");
            calls++; if(fail==1)throw new SecurityException();if(fail==2)throw new NoSuchMethodError();
            invalidated=remove;return new MediaRouter2();
        }
    }
    Owner owner=new Owner(),output=owner;
    MediaController controller=new MediaController();MediaRouter2 router;
''' + method + '''
    public static void main(String[] args) {
        TestRoute t=new TestRoute();t.bindOutputRouter(t.controller);
        if(MediaRouter2.calls!=0 || t.router!=null || t.owner.message.isEmpty())throw new AssertionError("no permission");
        for(String grant:List.of("content","routing")){
            t.owner.grants.clear();t.owner.grants.add(grant);t.bindOutputRouter(t.controller);
            if(t.router==null)throw new AssertionError("single permission rejected: "+grant);
            Runnable previous=MediaRouter2.invalidated;t.controller=new MediaController();t.bindOutputRouter(t.controller);
            previous.run();if(t.router==null)throw new AssertionError("stale callback");
            MediaRouter2.invalidated.run();if(t.router!=null||t.output.visibility!=GONE)throw new AssertionError("live invalidation");
        }
        for(int fail:new int[]{1,2}) {
            MediaRouter2.fail=fail;t.owner.message="";t.bindOutputRouter(t.controller);
            if(t.router!=null||t.owner.message.isEmpty())throw new AssertionError("missing capability "+fail);
        }
        System.out.println("PASS Step media router: both alternative grants, denial, revocation, stale player, missing API");
    }
}''',
    }
    for name,content in files.items():
        path=folder/name
        path.parent.mkdir(exist_ok=True,parents=True)
        path.write_text(content,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,*folder.rglob('*.java')],check=True)
    subprocess.run([java/'java','-cp',folder,'TestRoute'],check=True)

    # Run the title/lyric normalization used before the track key is computed.
    package='ls.augment.com.step'
    lyrics=folder/'LyricCases.java'
    lyrics.write_text("""package ls.augment.com.step;
public class LyricCases {
    static void check(boolean result){if(!result)throw new AssertionError();}
    public static void main(String[] args){
        for(String sep:new String[]{" – "," — "," - ","－"," —"," − "}){
            String credit="弯弯的月亮"+sep+"瑞-Gary";
            PlayerLyrics first=PlayerLyrics.from("com.luna.music","作曲：李海鹰",credit);
            PlayerLyrics next=PlayerLyrics.from("com.luna.music","遥远的夜空",credit);
            check(first.title.equals("弯弯的月亮") && next.title.equals(first.title));
            check(first.artist.equals("瑞-Gary") && next.line.equals("遥远的夜空"));
            check(PlayerLyrics.from("com.luna.music","弯弯的月亮",credit).line.isEmpty());
            check(PlayerLyrics.from("other.player","普通标题",credit).artist.equals(credit));
        }
        check(PlayerLyrics.from("com.luna.music","歌","歌手").line.isEmpty());
        check(PlayerLyrics.source("com.netease.cloudmusic")==0 && PlayerLyrics.source("com.kugou.android")==1);
        check(PlayerLyrics.source("com.luna.music")==2 && PlayerLyrics.source("unknown")==-1);
    }
}
""",encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,STEP/'PlayerLyrics.java',lyrics],check=True)
    subprocess.run([java/'java','-cp',folder,package+'.LyricCases'],check=True)
    print('PASS Step player metadata: live line, stable track, normal metadata and player-specific fallback')

    binding=source[source.index('        String pkg=current==null?'):source.index('        Bitmap art=null;')]
    session=folder/'SessionCases.java'
    session.write_text('''package ls.augment.com.step;
class SessionCases {
    static class Player {
        String pkg;
        Player(String pkg){this.pkg=pkg;}
        String getPackageName(){return pkg;}
        Object getSessionToken(){return this;}
    }
    static class MediaMetadata {
        static String METADATA_KEY_MEDIA_ID="id",METADATA_KEY_DURATION="duration";
        String lyrics="",id="one";
        long getLong(String k){return 240000;}
    }
    static class Owner {int userId=1;}
    static class Bookmark {
        int user;Object player;String track,sessionLyrics;SongLines lines;boolean manualLyrics;
    }
    static String value(MediaMetadata m,String k){return m.id;}
    static String lyric(MediaMetadata m){return m.lyrics;}
    final Owner owner=new Owner();
    Bookmark bookmark;String identity="",rawLyrics="",liveLine="",titleText="",artist="";
    long duration;boolean failed,manualLyrics;int generation,queries,selected=-1,lyricSource;
    LyricLookup.Status lyricStatus;
    SongLines lines=new SongLines(null);
    void cancelLookup(){generation++;}
    void findLyrics(int src,boolean manual){if(manual)throw new AssertionError();queries++;selected=src;}
    void bind(Player current,boolean boundPlayerChanged,MediaMetadata m,String title,String by){
        titleText=title;artist=by;
        BINDING
    }
    static void check(boolean yes){if(!yes)throw new AssertionError();}
    public static void main(String[] args){
        SessionCases c=new SessionCases();Player q=new Player("com.luna.music");
        MediaMetadata m=new MediaMetadata();String credit="弯弯的月亮 – 瑞-Gary";
        c.bind(q,true,m,"作曲：李海鹰",credit);String key=c.identity;int generation=c.generation;
        c.bind(q,false,m,"遥远的夜空",credit);
        check(c.queries==0 && c.liveLine.equals("遥远的夜空") && c.identity.equals(key) && c.generation==generation);
        c.manualLyrics=true;c.lines=new SongLines("自选歌词");c.bind(q,false,m,"有一个弯弯的月亮",credit);
        check(c.manualLyrics && c.lines.context(0).equals("自选歌词"));
        m.id="two";c.bind(q,false,m,"下一首","歌手");c.bind(q,false,m,"下一首","歌手");
        check(!c.manualLyrics && c.queries==1 && c.selected==-1);
        m.lyrics="[00:01]播放器原文";c.bind(q,false,m,"下一首","歌手");
        check(c.lines.context(1000).equals("播放器原文") && c.queries==1);
        m.lyrics="";c.bind(new Player("unknown"),true,m,"下一首","歌手");
        check(c.lines.empty() && c.queries==2 && c.selected==-1);
    }
}'''.replace('BINDING',binding),encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-cp',folder,'-d',folder,STEP/'SongLines.java',STEP/'LyricLookup.java',session],check=True)
    subprocess.run([java/'java','-cp',folder,package+'.SessionCases'],check=True)
    print('PASS Step production binding: lyric ticks, manual choice, track switch, automatic source and session replacement')
