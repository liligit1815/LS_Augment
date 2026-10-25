package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Process;
import java.util.HashMap;
import java.util.Map;

/** Module-private durable state shared only with the authenticated launcher process. */
final class LauncherOwnedStateStore {
    static final String GRID_PREFS="launcher-grid-recovery-v1";
    static final String PAGES_PREFS="launcher-page-state-v1";
    // The first durable nonempty page record remains available if a later native
    // lifecycle saves a different layout before restoration has completed.
    static final String RECOVERY_RECORD="recovery_record";
    private static final String PACKAGE="com.zte.mifavor.launcher";
    private static final Map<String,SharedPreferences> storage=new HashMap<>();
    private static final Map<String,DurablePreferences> confirmed=new HashMap<>();
    private LauncherOwnedStateStore(){ }

    static Bundle call(Context context,String method,int uid,int pid,String caller,String[] packages,Bundle extras){
        synchronized(ResetWriteFence.class){
            try{
                if(uid/100000!=Process.myUid()/100000||pid<=0||!PACKAGE.equals(caller)
                        ||packages==null||packages.length!=1||!PACKAGE.equals(packages[0])
                        ||context.getPackageManager().getApplicationInfo(PACKAGE,0).uid!=uid)
                    return reply(false,"caller_identity",null);
                if(extras==null||!(extras.get("version") instanceof Integer)
                        ||extras.getInt("version",-1)!=BuildConfig.VERSION_CODE||!(extras.get("kind") instanceof String))
                    return reply(false,"state_contract",null);
                String kind=extras.getString("kind");boolean pages="pages".equals(kind);DurablePreferences prefs=preferences(context,kind);
                String current=prefs.getString("record","{}");
                if(prefs.contains("record")&&!(prefs.getAll().get("record") instanceof String))return reply(false,"storage_invalid",null);
                Map<String,Object> old;
                try{
                    old=LauncherOwnedStateData.decode(kind,current);
                    if(pages&&prefs.contains(RECOVERY_RECORD)){
                        if(!(prefs.getAll().get(RECOVERY_RECORD) instanceof String))return reply(false,"storage_invalid",null);
                        if(LauncherOwnedStateData.decode(kind,prefs.getString(RECOVERY_RECORD,null)).isEmpty())
                            return reply(false,"storage_invalid",null);
                    }
                }catch(Exception invalid){return reply(false,"storage_invalid",null);}
                if("launcher_owned_read".equals(method)){
                    if(extras.size()!=2)return reply(false,"read_contract",null);
                    // Existing private stores predate the recovery copy. Do not
                    // expose their only copy until its preservation is durable.
                    if(pages&&!old.isEmpty()&&!prefs.contains(RECOVERY_RECORD)
                            &&!prefs.edit().putString(RECOVERY_RECORD,LauncherOwnedStateData.encode(kind,old)).commit())
                        return reply(false,"storage_failed",null);
                    return reply(true,"loaded",current);
                }
                boolean importing="launcher_owned_import".equals(method);
                if(!importing&&!"launcher_owned_write".equals(method)||extras.size()!=(importing?4:5)
                        ||!(extras.get("expected") instanceof String)||!(extras.get("payload") instanceof String))
                    return reply(false,"write_contract",null);
                if(!importing&&(!(extras.get("revision") instanceof Long)
                        ||new AppConfig(context).configSnapshot().revision!=extras.getLong("revision",-1)))
                    return reply(false,"configuration_changed",null);
                String expected=LauncherOwnedStateData.encode(kind,LauncherOwnedStateData.decode(kind,extras.getString("expected")));
                Map<String,Object> values=LauncherOwnedStateData.decode(kind,extras.getString("payload"));
                String next=LauncherOwnedStateData.encode(kind,values);
                if(importing&&ResetWriteFence.active())return reply(false,"reset_in_progress",null);
                if(importing&&!old.isEmpty()&&!old.equals(values))return reply(false,"legacy_conflict",null);
                if(!importing&&ResetWriteFence.active()){
                    if(!"grid".equals(kind))return reply(false,"reset_in_progress",null);
                    if(!values.isEmpty()&&(!java.util.Objects.equals(values.get("original_rows"),old.get("original_rows"))
                            ||!java.util.Objects.equals(values.get("original_columns"),old.get("original_columns"))
                            ||!java.util.Objects.equals(values.get("effective_rows"),old.get("original_rows"))
                            ||!java.util.Objects.equals(values.get("effective_columns"),old.get("original_columns"))))
                        return reply(false,"reset_in_progress",null);
                }
                String recovery=null;
                if(pages)recovery=prefs.contains(RECOVERY_RECORD)?prefs.getString(RECOVERY_RECORD,null):
                        !old.isEmpty()?LauncherOwnedStateData.encode(kind,old):!values.isEmpty()?next:null;
                boolean preserveRecovery=recovery!=null&&!prefs.contains(RECOVERY_RECORD);
                if(old.equals(values)&&!preserveRecovery)return reply(true,"saved",next);
                if(!old.equals(values)&&!LauncherOwnedStateData.encode(kind,old).equals(expected))return reply(false,"state_changed",null);
                DurablePreferences.Editor edit=prefs.edit();
                if(!pages)edit.clear();
                edit.putString("record",next);
                if(preserveRecovery)edit.putString(RECOVERY_RECORD,recovery);
                if(!edit.commit())return reply(false,"storage_failed",null);
                return reply(true,"saved",next);
            }catch(Exception unavailable){return reply(false,"state_unavailable",null);}
        }
    }
    /** Only the nonce/PID-bound reset runtime calls this after all page writers were paused. */
    static boolean clearPagesForReset(Context context){
        synchronized(ResetWriteFence.class){
            if(!ResetWriteFence.active())return false;
            try{return preferences(context,"pages").edit().clear().commit();}catch(RuntimeException invalid){return false;}
        }
    }
    static boolean pendingGrid(Context context){
        synchronized(ResetWriteFence.class){try{return !LauncherOwnedStateData.decode("grid",preferences(context,"grid").getString("record","{}")).isEmpty();}
            catch(Exception invalid){return true;}}
    }
    static boolean pagesHistory(Context context){
        synchronized(ResetWriteFence.class){try{
                DurablePreferences prefs=preferences(context,"pages");
                return prefs.contains(RECOVERY_RECORD)||!LauncherOwnedStateData.decode("pages",prefs.getString("record","{}")).isEmpty();}
            catch(Exception invalid){return true;}}
    }
    private static DurablePreferences preferences(Context context,String kind){
        String name=switch(kind){case "grid"->GRID_PREFS;case "pages"->PAGES_PREFS;default->throw new IllegalArgumentException("state_kind");};
        SharedPreferences next=context.getSharedPreferences(name,Context.MODE_PRIVATE);
        if(storage.get(kind)!=next){storage.put(kind,next);confirmed.put(kind,new DurablePreferences(next));}
        return confirmed.get(kind);
    }
    private static Bundle reply(boolean ok,String reason,String payload){Bundle b=new Bundle();b.putBoolean("ok",ok);b.putString("reason",reason);if(ok)b.putString("payload",payload);return b;}
}
