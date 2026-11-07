"""Execute production channel, download lifecycle and action gates with framework doubles."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JDK=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
FILES={
'android/content/Context.java':'package android.content;public class Context{}',
'android/os/Bundle.java':'''package android.os;import java.util.*;public class Bundle extends HashMap<String,Object>{
public int getInt(String k,int d){Object v=get(k);return v instanceof Integer?(int)v:d;}
public boolean getBoolean(String k,boolean d){Object v=get(k);return v instanceof Boolean?(boolean)v:d;}}''',
'android/app/PendingIntent.java':'package android.app;public class PendingIntent{}',
'android/app/NotificationChannel.java':'package android.app;public class NotificationChannel{public CharSequence getName(){return "下载";}}',
'android/app/NotificationManager.java':'''package android.app;public class NotificationManager{public static final int IMPORTANCE_LOW=2;
public static class Policy{public static final int SUPPRESSED_EFFECT_STATUS_BAR=1,SUPPRESSED_EFFECT_PEEK=2,SUPPRESSED_EFFECT_NOTIFICATION_LIST=4;}}''',
'android/app/Notification.java':'''package android.app;public class Notification{
public static final int FLAG_ONGOING_EVENT=2,FLAG_GROUP_SUMMARY=512,VISIBILITY_SECRET=-1;
public static final String EXTRA_MEDIA_SESSION="media",EXTRA_PROGRESS="progress",EXTRA_PROGRESS_MAX="max",EXTRA_PROGRESS_INDETERMINATE="indeterminate";
public int flags=2,visibility;public String channel="downloads";public android.os.Bundle extras=new android.os.Bundle();public Action[] actions;public PendingIntent contentIntent;
public String getChannelId(){return channel;}
public static class Action{public CharSequence title;public PendingIntent actionIntent;public Object[] remote,data;
public Action(String t,PendingIntent p){title=t;actionIntent=p;}public Object[] getRemoteInputs(){return remote;}public Object[] getDataOnlyRemoteInputs(){return data;}}}''',
'android/service/notification/StatusBarNotification.java':'''package android.service.notification;public class StatusBarNotification{
public String key,pkg="com.example.downloader";public int uid=12345,user;public long time;public android.app.Notification notification=new android.app.Notification();
public StatusBarNotification(String key,long time,int progress){this.key=key;this.time=time;notification.extras.put("progress",progress);notification.extras.put("max",100);}
public boolean isClearable(){return (notification.flags&(2|32))==0;}
public String getKey(){return key;}public String getPackageName(){return pkg;}public int getUserId(){return user;}public int getUid(){return uid;}
public long getPostTime(){return time;}public android.app.Notification getNotification(){return notification;}}''',
'android/service/notification/NotificationListenerService.java':'''package android.service.notification;public class NotificationListenerService{
public static class Ranking{public int importance=2,effects;public boolean suspended,interruption=true;public int getImportance(){return importance;}
public boolean isSuspended(){return suspended;}public boolean matchesInterruptionFilter(){return interruption;}public int getSuppressedVisualEffects(){return effects;}
public android.app.NotificationChannel getChannel(){return new android.app.NotificationChannel();}}
public static class RankingMap{public Ranking rank=new Ranking();public boolean found=true;public boolean getRanking(String k,Ranking out){
out.importance=rank.importance;out.effects=rank.effects;out.suspended=rank.suspended;out.interruption=rank.interruption;return found;}}}''',
'org/json/JSONException.java':'package org.json;public class JSONException extends Exception{}',
'org/json/JSONArray.java':'package org.json;public class JSONArray extends java.util.ArrayList<Object>{public JSONArray put(Object v){add(v);return this;}}',
'org/json/JSONObject.java':'''package org.json;public class JSONObject{private final java.util.Map<String,Object> values=new java.util.LinkedHashMap<>();
public JSONObject put(String k,Object v)throws JSONException{values.put(k,v);return this;}public String toString(){return values.toString();}}''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import java.util.*;import android.content.Context;class FeatureSettings{
static Map<String,String> values=new HashMap<>(),diagnostics=new HashMap<>();static boolean enabled(Context c,String k){return "1".equals(values.get(k));}
static String text(Context c,String k,String d){return values.getOrDefault(k,d);}static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}}''',
}
HARNESS=r'''package ls.augment.com.hook;
import java.util.*;import ls.augment.com.*;import android.app.*;import android.service.notification.*;
public class DownloadRuntimeTest{
static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
static StatusBarNotification note(String key,long time,int progress){return new StatusBarNotification(key,time,progress);}
public static void main(String[] args){
String key=IslandDownloadConfig.channel(0,"com.example.downloader","downloads");
check(!key.isEmpty()&&IslandDownloadConfig.parts(key)[2].equals("downloads"),"exact channel round trip");
String strange=IslandDownloadConfig.channel(10,"com.example.downloader","下载, | / notification");
check(IslandDownloadConfig.parts(strange)[2].equals("下载, | / notification"),"delimiter-safe channel IDs");
check(!strange.equals(key)&&IslandDownloadConfig.normalize("").equals(""),"users separate; empty is empty");
for(String bad:new String[]{"all","*",key+",",key+",bad","-1|com.test|YQ","00|com.test|YQ","0|com.test|%%%"})
 check(IslandDownloadConfig.normalize(bad)==null,"invalid channel config fails closed");
check(IslandDownloadConfig.normalize(key+","+key).equals(key),"duplicate selection normalized");
check(IslandActivityPolicy.chooseWithDownload(true,true,false,10,true,true,20,true,20,true)==IslandActivityPolicy.NOTICE,"new notice retains precedence over download");
check(IslandActivityPolicy.chooseWithDownload(true,true,false,20,true,true,20,true,30,true)==IslandActivityPolicy.CHARGING,"charging hint keeps brief precedence");
check(IslandActivityPolicy.chooseWithDownload(true,true,false,30,true,false,0,false,0,true)==IslandActivityPolicy.DOWNLOAD,"download resumes after transient hints");
check(IslandActivityPolicy.chooseWithDownload(true,true,false,30,true,false,0,false,0,false)==IslandActivityPolicy.MUSIC,"last download ending restores live music");
check(IslandActivityPolicy.chooseWithDownload(true,true,false,30,false,false,0,false,0,false)==IslandActivityPolicy.NONE,"last download ending with no music hides island");
check(IslandActivityPolicy.chooseWithDownload(true,true,true,30,true,false,0,false,0,true)==IslandActivityPolicy.NONE,"locked download remains hidden");
check(IslandActivityPolicy.chooseWithDownload(true,false,false,30,true,false,0,false,0,true)==IslandActivityPolicy.NONE,"hidden status bar suppresses download");
check(IslandActivityPolicy.chooseWithDownload(false,true,false,30,true,false,0,false,0,true)==IslandActivityPolicy.NONE,"disabled master suppresses download");
List<String> many=new ArrayList<>();for(int i=0;i<33;i++)many.add(IslandDownloadConfig.channel(0,"com.test","c"+i));
check(IslandDownloadConfig.normalize(String.join(",",many))==null,"selection bounded");
IslandDownloadPolicy<String> policy=new IslandDownloadPolicy<>();
policy.update("a",key,1,10,true,false,1500000000,2000000000,"a");
check(policy.get("a").percent==75,"large progress avoids integer overflow");
policy.update("b",key,1,11,true,true,-1,0,"b");
check(policy.choose("a").key.equals("a")&&policy.choose(null).key.equals("b"),"stable selection while another download updates");
check(!policy.remove("a",1,9)&&policy.get("a")!=null,"late deletion cannot remove replacement");
policy.update("a",key,1,12,true,false,100,100,"done");
check(policy.get("a")==null&&policy.choose("a").key.equals("b"),"completion exposes next download");
policy.update("a",key,1,10,true,false,75,100,"late");
check(policy.get("a")==null,"late progress cannot resurrect completed download");
policy.update("a",key,1,12,true,false,75,100,"same time");check(policy.get("a")==null,"terminal generation wins ties");
policy.update("a",key,1,13,true,false,1,100,"new");check(policy.get("a")!=null,"genuinely new task can reuse key");
policy.update("a",key,1,14,false,false,1,100,"end");check(policy.get("a")==null,"nonongoing source ends activity");
policy.remove("b",1,11);check(policy.size()==0,"last removal empties activities");
for(int i=0;i<40;i++)policy.update("n"+i,key,1,i+100,true,false,1,100,"task");
check(policy.size()==32,"active source memory bounded");policy.retainKeys(Set.of("n2"));check(policy.size()==1,"snapshot removes absent tasks");
policy.retainChannels(Set.of());check(policy.size()==0,"deselect removes tasks");policy.clear();
NotificationListenerService.RankingMap ranking=new NotificationListenerService.RankingMap();
IslandDownloadSource source=new IslandDownloadSource(new android.content.Context());source.user(0);
StatusBarNotification first=note("download",10,20);first.notification.extras.put("title","secret-filename-complete.zip");
check(!source.posted(first,ranking)&&source.activities.size()==0,"default disabled");
String discovered=FeatureSettings.diagnostics.get(IslandDownloadConfig.DISCOVERED);
check(discovered.contains(key)&&!discovered.contains("secret-filename"),"discover only channel metadata without file content");
FeatureSettings.values.put(IslandDownloadConfig.ENABLED,"1");
source.posted(first,ranking);check(source.activities.size()==0,"enabled with no channels remains empty");
FeatureSettings.values.put(IslandDownloadConfig.CHANNELS,key);check(source.posted(first,ranking),"selected structured download consumed");
check(source.activities.get("download").percent==20,"LOW importance progress notification supported by explicit selection");
StatusBarNotification second=note("download",11,40);source.posted(second,ranking);source.removed(first);
check(source.activities.get("download").percent==40,"old source removal cannot erase newer progress");
StatusBarNotification plain=note("plain",12,0);plain.notification.extras.clear();
check(!source.posted(plain,ranking)&&source.activities.get("plain")==null,"selected channel alone does not classify ordinary text as download");
StatusBarNotification complete=note("download",12,100);check(source.posted(complete,ranking),"completion consumed rather than replayed as notice");
check(source.activities.size()==0,"100 percent withdraws even if source remains ongoing");source.posted(first,ranking);
check(source.activities.size()==0,"source layer does not resurrect stale completion");
for(int guard=0;guard<10;guard++){
 source.clear();StatusBarNotification n=note("g",20,10);ranking=new NotificationListenerService.RankingMap();
 if(guard==0)n.user=10;if(guard==1)n.uid=1012345;if(guard==2)n.notification.visibility=-1;if(guard==3)n.notification.flags|=512;
 if(guard==4)n.notification.extras.put("media","session");if(guard==5)ranking.found=false;if(guard==6)ranking.rank.suspended=true;
 if(guard==7)ranking.rank.importance=1;if(guard==8)ranking.rank.interruption=false;if(guard==9)ranking.rank.effects=2;
 source.posted(n,ranking);check(source.activities.size()==0,"privacy/ranking guard "+guard);
}
ranking=new NotificationListenerService.RankingMap();source.clear();source.posted(first,ranking);
ranking.rank.effects=1;source.ranking(ranking);check(source.activities.size()==0,"DND change removes existing download");
ranking.rank.effects=0;source.reconcile(new StatusBarNotification[]{first},ranking);
check(source.activities.size()==1,"current active snapshot restores live task");
source.reconcile(new StatusBarNotification[0],ranking);check(source.activities.size()==0,"empty listener snapshot clears stale state");
source.reconcile(null,ranking);check(source.activities.size()==0,"unavailable snapshot fails closed");
source.clear();PendingIntent pause=new PendingIntent(),open=new PendingIntent();first=note("action",30,10);first.notification.contentIntent=open;
Notification.Action genuine=new Notification.Action("暂停",pause),reply=new Notification.Action("回复",new PendingIntent());reply.remote=new Object[]{new Object()};
Notification.Action dataReply=new Notification.Action("附件",new PendingIntent());dataReply.data=new Object[]{new Object()};
first.notification.actions=new Notification.Action[]{reply,dataReply,new Notification.Action("失效",null),genuine};
source.posted(first,ranking);var entry=source.activities.get("action");
check(IslandDownloadSource.actions(first.notification).equals(List.of(genuine)),"only genuine executable non-input actions exposed");
check(source.current(entry,pause)&&source.current(entry,open),"original action/content PendingIntent preserved");
check(source.allowsAction(first,ranking,entry,pause),"fresh live source authorizes original action");
check(!source.current(entry,new PendingIntent()),"foreign action rejected");
first.notification.flags=0;check(!source.allowsAction(first,ranking,entry,pause),"ended source cannot be controlled before removal callback");first.notification.flags=2;
ranking.rank.interruption=false;check(!source.allowsAction(first,ranking,entry,pause),"action rechecks current DND ranking");ranking.rank.interruption=true;
StatusBarNotification updated=note("action",31,20);updated.notification.actions=new Notification.Action[]{genuine};source.posted(updated,ranking);
check(!source.current(entry,pause),"old panel revision cannot execute after task update");
entry=source.activities.get("action");source.removed(updated);check(!source.current(entry,pause),"withdrawn task button cannot execute");
source.clear();source.posted(updated,ranking);FeatureSettings.values.put(IslandDownloadConfig.ENABLED,"0");source.configure();
check(source.activities.size()==0,"disable clears existing activities");FeatureSettings.values.put(IslandDownloadConfig.ENABLED,"1");
source.posted(updated,ranking);source.user(10);check(source.activities.size()==0,"user switch clears content");
check(!FeatureSettings.diagnostics.get(IslandDownloadConfig.DISCOVERED).contains(key),"user switch clears previous user's channel metadata");
System.out.println("PASS download production policy/source/actions: "+checks+" checks");
}}
'''

def main():
    with tempfile.TemporaryDirectory(prefix='duo-download-') as tmp:
        folder=Path(tmp)
        files=dict(FILES)
        for name in ('IslandDownloadConfig','IslandDownloadPolicy','IslandActivityPolicy'):
            files['ls/augment/com/'+name+'.java']=(SRC/(name+'.java')).read_text(encoding='utf-8')
        files['ls/augment/com/hook/IslandDownloadSource.java']=(SRC/'hook/IslandDownloadSource.java').read_text(encoding='utf-8')
        files['ls/augment/com/hook/DownloadRuntimeTest.java']=HARNESS
        for name,content in files.items():
            path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8')
        subprocess.run([str(JDK/'javac'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
        subprocess.run([str(JDK/'java'),'-cp',str(folder),'ls.augment.com.hook.DownloadRuntimeTest'],check=True)

if __name__=='__main__':main()
