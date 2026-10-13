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
        return publishDetailed(input).getBoolean("ok",false);
    }
    /** Preserve the last accepted inventory on rejection; diagnostics contain no row/session text. */
    static synchronized Bundle publishDetailed(String input){
        int chars=input==null?-1:input.length(),surfaceIndex=-1,rowIndex=-1;
        if(input==null)return rejected("payload_missing",chars,-1,-1,-1,-1);
        if(chars>MAX_PAYLOAD)return rejected("payload_too_large",chars,-1,-1,chars,MAX_PAYLOAD);
        String stage="json_invalid";
        try{
            JSONObject root=new JSONObject(input);
            if(root.optInt("version")!=1)return rejected("version_invalid",chars,-1,-1,root.optInt("version",-1),1);
            stage="session_or_time_missing";
            String nextSession=root.getString("session");long nextTime=root.getLong("observedAt");
            if(!nextSession.matches("[A-Za-z0-9_.:-]{1,100}"))return rejected("session_invalid",chars,-1,-1,nextSession.length(),100);
            if(nextTime<=0)return rejected("observed_at_invalid",chars,-1,-1,nextTime,1);
            stage="surfaces_invalid";
            JSONObject surfaces=root.getJSONObject("surfaces");
            java.util.Iterator<String> names=surfaces.keys();
            while(names.hasNext()){
                surfaceIndex++;rowIndex=-1;
                String name=names.next();
                if(!StatusBarSurfaceSpec.valid(name))return rejected("surface_invalid",chars,surfaceIndex,-1,-1,-1);
                stage="surface_rows_invalid";
                JSONArray rows=surfaces.getJSONArray(name);
                if(rows.length()>256)return rejected("too_many_rows",chars,surfaceIndex,-1,rows.length(),256);
                for(int i=0;i<rows.length();i++){
                    rowIndex=i;stage="row_invalid";
                    JSONObject row=rows.getJSONObject(i);
                    stage="row_id_missing";
                    if(!StatusBarIconCatalog.validId(row.getString("id")))return rejected("row_id_invalid",chars,surfaceIndex,i,-1,-1);
                    int rowChars=row.toString().length();
                    if(rowChars>4096)return rejected("row_too_large",chars,surfaceIndex,i,rowChars,4096);
                }
            }
            if(nextSession.equals(session)&&nextTime<observedAt)return rejected("observation_out_of_order",chars,-1,-1,nextTime,observedAt);
            String nextPayload=root.toString();
            session=nextSession;observedAt=nextTime;payload=nextPayload;
            Bundle result=new Bundle();result.putBoolean("ok",true);return result;
        }catch(JSONException error){return rejected(stage,chars,surfaceIndex,rowIndex,-1,-1);}
        catch(RuntimeException error){return rejected(stage,chars,surfaceIndex,rowIndex,-1,-1);}
    }
    static Bundle rejected(String reason,int chars,int surface,int row,long actual,long limit){
        Bundle result=new Bundle();result.putBoolean("ok",false);result.putString("reason",reason);
        result.putInt("payloadChars",chars);result.putInt("surfaceIndex",surface);result.putInt("rowIndex",row);
        result.putLong("actual",actual);result.putLong("limit",limit);return result;
    }
    static synchronized Bundle read(){Bundle result=new Bundle();result.putBoolean("ok",true);result.putString("payload",payload);return result;}
}
