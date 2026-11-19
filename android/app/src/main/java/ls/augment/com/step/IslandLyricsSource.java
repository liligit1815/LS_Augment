package ls.augment.com.step;

import android.media.MediaMetadata;
import java.util.Locale;

/** Reuses the Step session and matched-provider formats for the native island. */
public final class IslandLyricsSource {
    public static SongLines session(MediaMetadata metadata){
        String original="",translation="";
        if(metadata!=null)for(String key:metadata.keySet()){
            String lower=key.toLowerCase(Locale.ROOT);
            if(!lower.contains("lyric")&&!lower.endsWith("lrc"))continue;
            CharSequence value=metadata.getText(key);
            if(value==null||value.length()>120000)continue;
            String candidate=value.toString();
            if(candidate.contains("://")||candidate.startsWith("/"))continue;
            SongLines parsed=new SongLines(candidate);
            if(parsed.nearby(0).isEmpty())continue;
            if(lower.contains("trans")||lower.contains("tlyric"))translation=candidate;
            else if(original.isEmpty())original=candidate;
        }
        SongLines lines=new SongLines(original);
        if(!translation.isEmpty())lines.addTranslations(new SongLines(translation));
        return lines;
    }
    public static SongLines lookup(int user,String pkg,String mediaId,String title,String artist,long duration,int setting)throws Exception{
        if(setting<1||title.isEmpty()||artist.isEmpty()||duration<=0)return new SongLines(null);
        int provider=setting==1?-1:setting-2;
        String key=user+"\n"+pkg+"\n"+mediaId+"\n"+title+"\n"+artist+"\n"+duration;
        LyricLookup.Result found=LyricLookup.run(key,provider,PlayerLyrics.source(pkg),true,false,
                source->LyricSources.lookup(source,title,artist,duration,pkg,mediaId));
        return new SongLines(found.text);
    }
    private IslandLyricsSource(){}
}
