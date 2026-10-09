package ls.augment.com;

import android.os.Bundle;
import org.json.*;

/** Runtime observations are ephemeral: never configuration and never part of a backup. */
final class StatusBarInventoryBridge {
    static final int MAX_PAYLOAD=512*1024;
    private static String payload="",session="";
    private static long observedAt;
    private StatusBarInventoryBridge() { }
    static synchronized boolean publish(String input){
        if(input==null||input.length()>MAX_PAYLOAD)return false;
        try{
            JSONObject root=new JSONObject(input);if(root.optInt("version")!=1)return false;
            String nextSession=root.getString("session");long nextTime=root.getLong("observedAt");
            if(!nextSession.matches("[A-Za-z0-9_.:-]{1,100}")||nextTime<=0)return false;
            JSONObject surfaces=root.getJSONObject("surfaces");
            java.util.Iterator<String> names=surfaces.keys();
            while(names.hasNext()){
                String name=names.next();if(!StatusBarSurfaceSpec.valid(name))return false;
                JSONArray rows=surfaces.getJSONArray(name);if(rows.length()>256)return false;
                for(int i=0;i<rows.length();i++){
                    JSONObject row=rows.getJSONObject(i);
                    if(!StatusBarIconCatalog.validId(row.getString("id"))||row.toString().length()>4096)return false;
                }
            }
            if(nextSession.equals(session)&&nextTime<observedAt)return false;
            session=nextSession;observedAt=nextTime;payload=root.toString();return true;
        }catch(JSONException|RuntimeException error){return false;}
    }
    static synchronized Bundle read(){Bundle result=new Bundle();result.putBoolean("ok",true);result.putString("payload",payload);return result;}
}
