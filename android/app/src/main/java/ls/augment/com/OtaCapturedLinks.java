package ls.augment.com;

import android.content.SharedPreferences;
import android.net.Uri;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Phone-local captured addresses; the legacy latest-address fields remain readable. */
final class OtaCapturedLinks {
    static final String PREFS="ota_capture";
    static final int LIMIT=20;
    private OtaCapturedLinks() { }

    static final class Entry {
        final String url;
        final long time;
        Entry(String url,long time){this.url=url;this.time=time;}
        OtaPackageLabel label(){
            Uri uri=Uri.parse(url);
            // ZTE's download.do endpoint carries the actual firmware package in filename.
            String name=uri.getQueryParameter("filename");
            if(name==null||name.isEmpty())name=uri.getQueryParameter("fileName");
            if(name==null||name.isEmpty())name=uri.getLastPathSegment();
            if(name!=null)name=name.substring(name.lastIndexOf('/')+1);
            return OtaPackageLabel.describe(name,uri.getHost());
        }
    }

    static synchronized List<Entry> read(SharedPreferences prefs){
        List<Entry> entries=new ArrayList<>();
        // Keep an existing capture even before this version has written a history array.
        add(entries,prefs.getString("url",""),prefs.getLong("time",0));
        try{
            JSONArray saved=new JSONArray(prefs.getString("links","[]"));
            for(int i=0;i<saved.length()&&entries.size()<LIMIT;i++){
                JSONObject item=saved.optJSONObject(i);
                if(item!=null)add(entries,item.optString("url",""),item.optLong("time",0));
            }
        }catch(JSONException ignored){ /* The latest capture above is still usable. */ }
        return entries;
    }

    static synchronized boolean record(SharedPreferences prefs,String url,long time){
        if(!OtaBufferPolicy.validUrl(url))return false;
        List<Entry> entries=read(prefs);
        entries.removeIf(entry->entry.url.equals(url));
        entries.add(0,new Entry(url,time));
        JSONArray saved=new JSONArray();
        try{
            for(int i=0;i<entries.size()&&i<LIMIT;i++){
                Entry entry=entries.get(i);
                saved.put(new JSONObject().put("url",entry.url).put("time",entry.time));
            }
        }catch(JSONException impossible){return false;}
        return prefs.edit().putString("url",url).putLong("time",time).putString("links",saved.toString()).commit();
    }

    private static void add(List<Entry> entries,String url,long time){
        if(!OtaBufferPolicy.validUrl(url))return;
        for(Entry entry:entries)if(entry.url.equals(url))return;
        entries.add(new Entry(url,time));
    }
}
