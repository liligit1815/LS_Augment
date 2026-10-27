package ls.augment.com;

import android.content.Context;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;

/** Bounded, device-local history of submitted searches, never partially typed input. */
final class FeatureSearchHistory {
    private static final String PREFS="feature_search", KEY="recent";
    static List<String> read(Context context){
        List<String> result=new ArrayList<>();
        try{
            JSONArray values=new JSONArray(context.getSharedPreferences(PREFS,Context.MODE_PRIVATE).getString(KEY,"[]"));
            for(int i=0;i<values.length()&&result.size()<10;i++){
                String value=values.optString(i,"").trim();
                if(!value.isEmpty()&&value.length()<=80&&!result.contains(value))result.add(value);
            }
        }catch(org.json.JSONException ignored){}
        return result;
    }
    static void remember(Context context,String query){
        String value=query.trim();if(value.isEmpty()||value.length()>80)return;
        List<String> entries=read(context);entries.removeIf(old->old.equalsIgnoreCase(value));entries.add(0,value);
        while(entries.size()>10)entries.remove(entries.size()-1);
        context.getSharedPreferences(PREFS,Context.MODE_PRIVATE).edit().putString(KEY,new JSONArray(entries).toString()).apply();
    }
    static void clear(Context context){context.getSharedPreferences(PREFS,Context.MODE_PRIVATE).edit().remove(KEY).apply();}
    private FeatureSearchHistory(){}
}
