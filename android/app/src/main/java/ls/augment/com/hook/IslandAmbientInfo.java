package ls.augment.com.hook;

import android.content.*;
import android.content.pm.ProviderInfo;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.*;
import android.provider.CalendarContract;
import android.service.notification.*;
import java.util.*;
import java.util.concurrent.*;
import static ls.augment.com.hook.NotificationWeatherHook.Data;

/** Current-user provider snapshots. Calendar and weather share one low-priority native slot. */
final class IslandAmbientInfo {
    private static final long HOUR=3600000L;
    private static final String WEATHER="com.zte.mifavor.weather";
    private static final ExecutorService IO=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"DuoIslandAgenda");t.setDaemon(true);return t;});
    private final Context context;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Runnable changed;
    private final Runnable invalidate=this::invalidate;
    private final ContentObserver observer=new ContentObserver(main){@Override public void onChange(boolean self){invalidate();}};
    private CancellationSignal signal;
    private Context scoped;
    private int user=-1,generation,mode;
    private boolean loaded,closed;
    private Data weather;
    private Appointment appointment;
    private static final class Appointment{
        final String title;final long begin,id;
        Appointment(String title,long begin,long id){this.title=title;this.begin=begin;this.id=id;}
    }
    IslandAmbientInfo(Context context,Runnable changed){this.context=context;this.changed=changed;}
    boolean enabled(){return mode!=0&&!closed;}
    private void invalidate(){loaded=false;if(signal==null&&!closed)changed.run();}
    private void reset(){
        generation++;if(signal!=null)signal.cancel();signal=null;
        if(scoped!=null)try{scoped.getContentResolver().unregisterContentObserver(observer);}catch(RuntimeException ignored){}
        scoped=null;loaded=false;weather=null;appointment=null;main.removeCallbacks(invalidate);
    }
    IslandEvent snapshot(int current,NotificationListenerService listener){
        int requested=(IslandSceneSelection.enabled(context,"daily_weather")?1:0)|(IslandSceneSelection.enabled(context,"next_calendar")?2:0);
        if(user!=current||mode!=requested){
            reset();user=current;mode=requested;
            if(mode!=0&&user>=0)try{
                scoped=(Context)Context.class.getMethod("createContextAsUser",UserHandle.class,int.class)
                        .invoke(context,UserHandle.getUserHandleForUid(user*100000),0);
                if((mode&1)!=0)watch(Uri.parse("content://com.zte.mifavor.weather.api"));
                if((mode&2)!=0)watch(CalendarContract.Events.CONTENT_URI);
            }catch(Exception missing){scoped=null;}
        }
        if(closed||scoped==null)return null;
        if(!loaded&&signal==null)query();
        long now=System.currentTimeMillis();
        Data data=weather;boolean fresh=data!=null&&fresh(data,now);
        Appointment next=appointment!=null&&appointment.begin>now?appointment:null;
        if(!fresh&&next==null)return null;
        String scene=fresh?"daily_weather":"next_calendar";
        String time=next==null?"":android.text.format.DateFormat.getTimeFormat(scoped).format(new Date(next.begin));
        String nextLine=next==null?"":time+" · "+next.title;
        String title=fresh?data.values[0]+" · 今日天气":"下一项日程";
        String compact=fresh?data.inline():nextLine,metric=fresh?NotificationWeatherText.temperature(data.values[2])+"  "+data.values[1]:time;
        String detail=fresh?data.render():next.title;
        int split=detail.indexOf('\n');if(fresh&&split>=0)detail=detail.substring(split+1);
        if(fresh&&next!=null)detail+="\n下一项日程  "+nextLine;
        StatusBarNotification warning=fresh?warning(listener,data.values[0],now):null;
        if(warning!=null){
            ls.augment.com.IslandNotificationContent notice=IslandNotificationText.read(WEATHER,warning.getNotification());
            title=data.values[0]+" · 天气预警";compact=notice.title;metric=notice.title;detail=notice.detail();
        }
        ArrayList<IslandEvent.Action> actions=new ArrayList<>();
        Context target=scoped;Runnable open=null;
        if(fresh){
            Intent launch=target.getPackageManager().getLaunchIntentForPackage(WEATHER);
            if(launch!=null){open=()->target.startActivity(launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));actions.add(new IslandEvent.Action("查看天气",open));}
        }
        if(next!=null){
            Intent event=new Intent(Intent.ACTION_VIEW,ContentUris.withAppendedId(CalendarContract.Events.CONTENT_URI,next.id));
            if(event.resolveActivity(target.getPackageManager())!=null){
                Runnable calendar=()->{if(System.currentTimeMillis()<next.begin)target.startActivity(event.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));};
                actions.add(new IslandEvent.Action("查看日程",calendar));if(open==null)open=calendar;
            }
        }
        Object revision=Arrays.asList(title,detail,compact,metric,next==null?0:next.id,next==null?0:next.begin,mode,warning==null?0:warning.getPostTime());
        return new IslandEvent("ambient",scene,user,android.os.Process.myUid(),user,revision,title,detail,compact,null,open,actions,8).content(Map.of("emphasis",metric));
    }
    private void watch(Uri uri){
        try{scoped.getContentResolver().registerContentObserver(uri,true,observer);}catch(RuntimeException ignored){}
    }
    private static boolean fresh(Data data,long now){
        try{long at=Long.parseLong(data.values[5]);return !data.values[0].trim().isEmpty()&&!data.values[1].trim().isEmpty()&&at<=now&&now-at<3*HOUR;}
        catch(RuntimeException malformed){return false;}
    }
    private void query(){
        final int epoch=generation,requested=mode;final Context target=scoped;CancellationSignal request=new CancellationSignal();signal=request;loaded=true;
        Runnable timeout=request::cancel;main.postDelayed(timeout,5000);
        IO.execute(()->{
            Data found=null;Appointment item=null;
            if((requested&1)!=0)try{
                ProviderInfo provider=target.getPackageManager().resolveContentProvider("com.zte.mifavor.weather.api",0);
                if(provider!=null&&WEATHER.equals(provider.packageName)){
                    found=NotificationWeatherHook.read(target,"DefaultCityWeather",request);
                    if(found==null)found=NotificationWeatherHook.read(target,"LocCityWeather",request);
                }
            }catch(RuntimeException unavailable){FeatureRuntimeLog.state("ISLAND_DAILY_WEATHER","source","provider_unavailable");}
            if((requested&2)!=0)try{item=calendar(target,request);}catch(RuntimeException unavailable){FeatureRuntimeLog.state("ISLAND_NEXT_CALENDAR","source","calendar_unavailable");}
            Data result=found;Appointment calendar=item;
            main.post(()->{
                main.removeCallbacks(timeout);if(closed||epoch!=generation||signal!=request)return;
                signal=null;weather=result;appointment=calendar;long now=System.currentTimeMillis(),delay=60000;
                if(calendar!=null)delay=Math.min(delay,Math.max(1,calendar.begin-now));
                if(result!=null&&fresh(result,now))delay=Math.min(delay,Math.max(1,Long.parseLong(result.values[5])+3*HOUR-now));
                main.removeCallbacks(invalidate);main.postDelayed(invalidate,delay);changed.run();
            });
        });
    }
    private static Appointment calendar(Context ctx,CancellationSignal request){
        Bundle data=ctx.checkSelfPermission(android.Manifest.permission.READ_CALENDAR)==android.content.pm.PackageManager.PERMISSION_GRANTED
                ?ls.augment.com.IslandNextCalendar.query(ctx,request)
                :ctx.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),ls.augment.com.IslandNextCalendar.METHOD,null,null);
        return data!=null&&data.containsKey("id")?new Appointment(data.getString("title",""),data.getLong("begin"),data.getLong("id")):null;
    }
    private StatusBarNotification warning(NotificationListenerService listener,String city,long now){
        if(listener==null)return null;
        StatusBarNotification chosen=null;
        try{
            StatusBarNotification[] active=listener.getActiveNotifications();if(active==null)return null;
            for(StatusBarNotification n:active){
                if(n==null||!WEATHER.equals(n.getPackageName())||!IslandPublishedActivity.allowed(context,listener,n,user)
                        ||n.getPostTime()>now||now-n.getPostTime()>6*HOUR)continue;
                ls.augment.com.IslandNotificationContent data=IslandNotificationText.read(WEATHER,n.getNotification());
                String text=data.title+" "+data.detail();
                if(!text.contains(city)||!text.contains("预警"))continue;
                if(chosen==null||n.getPostTime()>chosen.getPostTime())chosen=n;
            }
        }catch(RuntimeException unavailable){return null;}
        if(chosen!=null){ls.augment.com.IslandNotificationContent data=IslandNotificationText.read(WEATHER,chosen.getNotification());
            if((data.title+data.detail()).matches("(?s).*(?:解除|取消).*"))return null;}
        return chosen;
    }
    void close(){closed=true;reset();}
}
