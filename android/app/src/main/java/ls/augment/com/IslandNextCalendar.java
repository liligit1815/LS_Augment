package ls.augment.com;

import android.app.KeyguardManager;
import android.content.ContentUris;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import android.provider.CalendarContract;

/** Only the next timed event of a visible calendar is shared with the verified local SystemUI caller. */
public final class IslandNextCalendar {
    public static final String METHOD="island_next_calendar";
    public static Bundle query(Context ctx,CancellationSignal cancel){
        Bundle out=new Bundle();
        if(ctx.checkSelfPermission(android.Manifest.permission.READ_CALENDAR)!=PackageManager.PERMISSION_GRANTED)return out;
        KeyguardManager lock=ctx.getSystemService(KeyguardManager.class);
        UserManager users=ctx.getSystemService(UserManager.class);
        if(lock==null||users==null||lock.isKeyguardLocked()||!users.isUserUnlocked())return out;
        long now=System.currentTimeMillis();Uri.Builder uri=CalendarContract.Instances.CONTENT_URI.buildUpon();
        ContentUris.appendId(uri,now);ContentUris.appendId(uri,now+86400000L);
        try(Cursor c=ctx.getContentResolver().query(uri.build(),new String[]{"event_id","title","begin"},
                "visible=1 AND allDay=0 AND begin>? AND (eventStatus IS NULL OR eventStatus!=2) AND (selfAttendeeStatus IS NULL OR selfAttendeeStatus!=2)",
                new String[]{Long.toString(now)},"begin ASC",cancel)){
            if(c!=null&&c.moveToFirst()){
                String title=c.isNull(1)?"":c.getString(1).trim();
                if(title.isEmpty())title="未命名日程";
                out.putString("title",title.substring(0,Math.min(512,title.length())));out.putLong("begin",c.getLong(2));out.putLong("id",c.getLong(0));
            }
        }catch(RuntimeException unavailable){return Bundle.EMPTY;}
        return out;
    }
    static Bundle forSystemUi(Context context,String caller,int uid){
        if(!"com.android.systemui".equals(caller)||uid/100000!=android.os.Process.myUid()/100000)return Bundle.EMPTY;
        try{
            ApplicationInfo systemUi=context.getPackageManager().getApplicationInfo(caller,0);
            if(uid!=systemUi.uid||(systemUi.flags&ApplicationInfo.FLAG_SYSTEM)==0)return Bundle.EMPTY;
        }catch(PackageManager.NameNotFoundException unknown){return Bundle.EMPTY;}
        long identity=Binder.clearCallingIdentity();
        try{
            AppConfig config=new AppConfig(context);
            if(!config.getBoolean(SystemUiOptions.ISLAND)||!config.getBoolean(IslandSceneRegistry.key("next_calendar")))return Bundle.EMPTY;
            return query(context,null);
        }finally{Binder.restoreCallingIdentity(identity);}
    }
    private IslandNextCalendar(){}
}
