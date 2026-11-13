package ls.augment.com.hook;

import android.app.Notification;
import android.os.Bundle;
import ls.augment.com.AtomicWorkbenchAmapData;
import ls.augment.com.AtomicWorkbenchNavigationCardData;

/** Consumes real route fields with the same units, maneuver map and freshness as Step. */
final class IslandNavigationPresentation {
    final String title,detail,compact;
    final long expires;
    private IslandNavigationPresentation(String title,String detail,long expires){
        this.title=title;this.detail=detail;this.compact=title;this.expires=expires;
    }
    static IslandNavigationPresentation read(String pkg,Notification n,long now){
        Bundle e=n.extras;
        String title=text(e.getCharSequence(Notification.EXTRA_TITLE,"导航中"));
        String detail=text(e.getCharSequence(Notification.EXTRA_BIG_TEXT,e.getCharSequence(Notification.EXTRA_TEXT,"")));
        if(AtomicWorkbenchAmapData.PACKAGE.equals(pkg)&&e.getInt(AtomicWorkbenchAmapData.VERSION,0)==AtomicWorkbenchAmapData.CONTRACT){
            long updated=e.getLong(AtomicWorkbenchAmapData.UPDATED,0);
            String source=e.getString(AtomicWorkbenchAmapData.SOURCE,"");
            if("active".equals(e.getString(AtomicWorkbenchAmapData.STATUS,""))
                    &&AtomicWorkbenchAmapData.fresh(now,updated,"spoken".equals(source))){
                Bundle metrics=AtomicWorkbenchAmapData.structured(e.getBundle(AtomicWorkbenchAmapData.NOTIFICATION_METRICS));
                long expires=updated+("spoken".equals(source)?45000:AtomicWorkbenchAmapData.MAX_AGE_MS)+1;
                if(metrics!=null){
                    Bundle state=new Bundle();state.putBoolean("available",true);state.putBoolean("active",true);
                    state.putString("package",pkg);state.putBundle(AtomicWorkbenchAmapData.METRICS,metrics);
                    AtomicWorkbenchNavigationCardData data=AtomicWorkbenchNavigationCardData.from(state);
                    title=data.title;
                    if(!data.maneuver.isEmpty()&&!title.equals(data.maneuver))title+="后 "+data.maneuver;
                    detail=data.subtitle;
                    if(!data.remaining.isEmpty())detail=join(detail,"剩余 "+data.remaining);
                    if(!data.speed.isEmpty())detail=join(detail,"当前速度 "+data.speed+" 公里/小时");
                    return new IslandNavigationPresentation(title,detail,expires);
                }
                String actualTitle=text(e.getString(AtomicWorkbenchAmapData.TITLE,""));
                String actualDetail=text(e.getString(AtomicWorkbenchAmapData.CONTENT,""));
                if(AtomicWorkbenchAmapData.guidance(actualTitle+" "+actualDetail))
                    return new IslandNavigationPresentation(actualTitle.isEmpty()?title:actualTitle,actualDetail,expires);
            }
        }
        return new IslandNavigationPresentation(title,detail,0);
    }
    private static String text(CharSequence value){return AtomicWorkbenchAmapData.text(value==null?"":value.toString());}
    private static String join(String first,String second){return first.isEmpty()?second:first+"\n"+second;}
}
