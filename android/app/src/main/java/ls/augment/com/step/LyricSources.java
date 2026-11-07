package ls.augment.com.step;

import android.net.Uri;
import android.util.Base64;
import org.json.*;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;

/** Exact title, artist and duration matching; all requests run off the UI thread. */
final class LyricSources {
    static final String[] names={"网易云音乐","酷狗","汽水音乐","LRCLIB"};
    static LyricLookup.Result lookup(int source,String title,String artist,long ms,String pkg,String mediaId)throws Exception{
        if(title.isEmpty() || artist.isEmpty() || ms<=0)return LyricLookup.Result.state(LyricLookup.Status.INSUFFICIENT,source);
        String query=title+" "+artist;
        switch(source){
            case 0:
                String id="";
                if(pkg.equals("com.netease.cloudmusic") && mediaId.matches("[0-9]{1,18}"))id=mediaId;
                if(id.isEmpty()){
                    JSONObject result=json(url("https://music.163.com/api/search/get","s",query,"type","1","limit","15")).optJSONObject("result");
                    id=matching(result==null?null:result.optJSONArray("songs"),title,artist,ms);
                }
                if(!id.matches("[0-9]{1,18}"))return LyricLookup.Result.state(LyricLookup.Status.NO_MATCH,source);
                JSONObject lyrics=json(url("https://music.163.com/api/song/lyric","id",id,"lv","-1","tv","-1"));
                return LyricLookup.Result.text(channel(lyrics,"lrc")+"\n"+channel(lyrics,"tlyric"),source);
            case 1:
                Uri.Builder search=url("https://lyrics.kugou.com/search","ver","1","man","yes","client","pc","keyword",query,"duration",Long.toString(ms)).buildUpon();
                if(pkg.startsWith("com.kugou.android") && mediaId.matches("[a-fA-F0-9]{16,64}"))search.appendQueryParameter("hash",mediaId);
                JSONArray rows=json(search.build()).optJSONArray("candidates");
                for(int i=0;rows!=null && i<Math.min(rows.length(),20);i++){
                    JSONObject r=rows.optJSONObject(i);
                    if(r==null || !match(title,artist,ms,r.optString("song"),r.optString("singer"),r.optLong("duration")))continue;
                    String key=r.optString("accesskey"),kid=r.optString("id");
                    if(key.isEmpty() || kid.isEmpty())continue;
                    String payload=json(url("https://lyrics.kugou.com/download","ver","1","client","pc","id",kid,"accesskey",key,"fmt","lrc","charset","utf8")).optString("content");
                    return LyricLookup.Result.text(new String(Base64.decode(payload,Base64.DEFAULT),StandardCharsets.UTF_8),source);
                }
                return LyricLookup.Result.state(LyricLookup.Status.NO_MATCH,source);
            case 2:
                String track=pkg.equals("com.luna.music") && mediaId.matches("[0-9]{1,20}")?mediaId:"";
                if(track.isEmpty()){
                    JSONArray groups=json(url("https://api.qishui.com/luna/search/track","aid","386088","app_name","luna","q",query,"cursor","0","count","20")).optJSONArray("result_groups");
                    for(int n=0;groups!=null && n<groups.length() && track.isEmpty();n++){
                        JSONObject group=groups.optJSONObject(n);JSONArray items=group==null?null:group.optJSONArray("data");
                        JSONArray songs=new JSONArray();
                        for(int i=0;items!=null && i<Math.min(items.length(),20);i++){
                            JSONObject row=items.optJSONObject(i),entity=row==null?null:row.optJSONObject("entity");
                            if(entity!=null && entity.optJSONObject("track")!=null)songs.put(entity.getJSONObject("track"));
                        }
                        track=matching(songs,title,artist,ms);
                    }
                }
                if(!track.matches("[0-9]{1,20}"))return LyricLookup.Result.state(LyricLookup.Status.NO_MATCH,source);
                JSONObject lyric=json(url("https://beta-luna.douyin.com/luna/h5/seo_track","track_id",track,"device_platform","web")).optJSONObject("lyric");
                return LyricLookup.Result.text(lyric==null?"":lyric.optString("content",""),source);
            case 3:
                JSONArray matches=new JSONArray(get(url("https://lrclib.net/api/search","track_name",title,"artist_name",artist)));
                for(int i=0;i<matches.length();i++){
                    JSONObject r=matches.optJSONObject(i);
                    if(r==null || !match(title,artist,ms,r.optString("trackName"),r.optString("artistName"),Math.round(r.optDouble("duration",0)*1000)))continue;
                    if(r.optBoolean("instrumental",false))return LyricLookup.Result.state(LyricLookup.Status.INSTRUMENTAL,source);
                    for(String k:new String[]{"syncedLyrics","plainLyrics"})if(!r.isNull(k) && !r.optString(k).isEmpty())return LyricLookup.Result.text(r.optString(k),source);
                }
        }
        return LyricLookup.Result.state(LyricLookup.Status.NO_MATCH,source);
    }
    static String matching(JSONArray rows,String title,String artist,long ms)throws JSONException{
        for(int i=0;rows!=null && i<Math.min(rows.length(),20);i++){
            JSONObject r=rows.optJSONObject(i);if(r==null)continue;
            JSONArray people=r.optJSONArray("artists");StringBuilder by=new StringBuilder();
            for(int j=0;people!=null && j<people.length();j++){
                JSONObject who=people.optJSONObject(j);if(who!=null){if(by.length()>0)by.append('/');by.append(who.optString("name"));}
            }
            if(match(title,artist,ms,r.optString("name"),by.toString(),r.optLong("duration")))return r.optString("id","");
        }
        return "";
    }
    static boolean match(String title,String artist,long ms,String track,String by,long length){
        return title.trim().equalsIgnoreCase(track.trim()) && artist.trim().equalsIgnoreCase(by.trim()) && length>0 && Math.abs(length-ms)<=3000;
    }
    static String channel(JSONObject obj,String key){JSONObject c=obj.optJSONObject(key);return c==null?"":c.optString("lyric","");}
    static Uri url(String base,String... params){
        Uri.Builder uri=Uri.parse(base).buildUpon();for(int i=0;i<params.length;i+=2)uri.appendQueryParameter(params[i],params[i+1]);return uri.build();
    }
    static JSONObject json(Uri u)throws Exception{
        JSONObject data=new JSONObject(get(u));
        if(data.has("code") && data.optInt("code",200)!=200 || data.optInt("status_code",0)!=0)
            throw new IOException("歌词服务拒绝查询");
        return data;
    }
    static String get(Uri u)throws Exception{
        if(Thread.currentThread().isInterrupted())throw new InterruptedIOException();
        HttpURLConnection c=(HttpURLConnection)new URL(u.toString()).openConnection();
        c.setConnectTimeout(3500);c.setReadTimeout(4000);c.setInstanceFollowRedirects(false);
        c.setRequestProperty("User-Agent","RedMagicStep/0.20");
        try{
            if(c.getResponseCode()!=200)throw new IOException("HTTP "+c.getResponseCode());
            ByteArrayOutputStream body=new ByteArrayOutputStream();
            try(InputStream in=c.getInputStream()){
                byte[] buf=new byte[4096];int n;
                while((n=in.read(buf))!=-1){
                    if(Thread.currentThread().isInterrupted())throw new InterruptedIOException();
                    if(body.size()+n>524288)throw new IOException("歌词响应过大");
                    body.write(buf,0,n);
                }
            }
            return body.toString("UTF-8");
        }finally{c.disconnect();}
    }
}
