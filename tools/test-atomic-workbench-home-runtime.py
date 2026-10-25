"""Exercise production Platform + Engine + Journal HOME borrowing and recovery.

The Android service and Unix ownership boundaries are controlled doubles. Journal
serialization, validation, locking, file streams, file sync and recovery ordering
run as production code against fresh temporary directories. No phone is accessed.
"""
from pathlib import Path
import argparse
import os
import runpy
import subprocess
import tempfile
import time

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-launch-runtime.py")))
SUPPORT = BASE["SUPPORT"]
ROOT = BASE["ROOT"]

SOURCES = {
    "ls/augment/com/BuildConfig.java": "package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20562;}",
    "android/content/ContentResolver.java": '''package android.content;public class ContentResolver {public String value="";public android.os.Bundle call(String authority,String method,String key,android.os.Bundle extras){android.os.Bundle b=new android.os.Bundle();b.putBoolean("success",true);b.putString("value",value);return b;}}''',
    "android/os/Process.java": "package android.os;public class Process {public static final int ROOT_UID=0;public static int uid;public static int myUid(){return uid;}}",
    "android/content/pm/ApplicationInfo.java": "package android.content.pm;public class ApplicationInfo {public boolean enabled=true;public int uid=10055;public String dataDir;}",
    "android/content/pm/ActivityInfo.java": "package android.content.pm;public class ActivityInfo {public boolean enabled=true,exported=true;public int flags=0x10000;public ApplicationInfo applicationInfo=new ApplicationInfo();public String permission,packageName,name;}",
    "android/content/pm/PackageManager.java": r'''package android.content.pm;import android.content.*;import java.util.*;
public class PackageManager {public static final int MATCH_DEFAULT_ONLY=0x10000;public int user;public String dataDir;
 public static class NameNotFoundException extends Exception {public NameNotFoundException(String pkg){super(pkg);}}
 public int homeUser=-1,homeFlags=0x10000;public String homePackage="launcher",homeClass="launcher.Home";
 private ApplicationInfo application(String pkg){ApplicationInfo info=new ApplicationInfo();info.uid=user*100000+10055;info.dataDir=dataDir;return info;}
 public ApplicationInfo getApplicationInfo(String pkg,int flags)throws NameNotFoundException{return application(pkg);}
 public ActivityInfo getActivityInfo(ComponentName component,int flags){ActivityInfo info=new ActivityInfo();info.applicationInfo=application(component.getPackageName());info.packageName=component.getPackageName();info.name=component.getClassName();return info;}
 public ResolveInfo resolveActivity(Intent intent,int flags){if(!intent.categories.contains(Intent.CATEGORY_HOME))throw new AssertionError("not a HOME resolution");
  ResolveInfo result=new ResolveInfo();result.activityInfo=getActivityInfo(new ComponentName(homePackage,homeClass),flags);result.activityInfo.flags=homeFlags;
  if(homeUser>=0)result.activityInfo.applicationInfo.uid=homeUser*100000+10055;return result;}
 public List<ResolveInfo> queryIntentActivities(Intent intent,int flags){ResolveInfo value=new ResolveInfo();value.activityInfo=getActivityInfo(new ComponentName(intent.pkg,intent.pkg+".Main"),0);return List.of(value);}
}''',
    "android/view/Display.java": r'''package android.view;public class Display {
 public static final int DEFAULT_DISPLAY=0,FLAG_PRIVATE=4,FLAG_PRESENTATION=8,FLAG_TRUSTED=128,FLAG_OWN_FOCUS=256;public final int id;public String name,unique;public int owner=0,flags=FLAG_PRIVATE|FLAG_TRUSTED|FLAG_OWN_FOCUS;
 public Display(int id,String name){this.id=id;this.name=name;unique="display-"+id;}public int getDisplayId(){return id;}public String getName(){return name;}
 public int getFlags(){return flags;}public int getOwnerUid(){return owner;}public String getUniqueId(){return unique;}
}''',
    "android/hardware/display/DisplayManager.java": r'''package android.hardware.display;import android.view.*;import java.util.*;public class DisplayManager {
 public static final int VIRTUAL_DISPLAY_FLAG_PUBLIC=1,VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY=8,VIRTUAL_DISPLAY_FLAG_PRESENTATION=2,
 VIRTUAL_DISPLAY_FLAG_SUPPORTS_TOUCH=64,VIRTUAL_DISPLAY_FLAG_TRUSTED=1024,VIRTUAL_DISPLAY_FLAG_OWN_FOCUS=16384;
 public int next=88,requestedFlags;public VirtualDisplay latest;public final List<VirtualDisplay> all=new ArrayList<>();
 public VirtualDisplay createVirtualDisplay(String name,int w,int h,int d,Surface surface,int flags){requestedFlags=flags;latest=new VirtualDisplay(new Display(next++,name));if((flags&VIRTUAL_DISPLAY_FLAG_PUBLIC)!=0)latest.display.flags&=~Display.FLAG_PRIVATE;if((flags&VIRTUAL_DISPLAY_FLAG_PRESENTATION)!=0)latest.display.flags|=Display.FLAG_PRESENTATION;all.add(latest);return latest;}
 public Display getDisplay(int id){for(VirtualDisplay vd:all)if(!vd.released&&vd.display.id==id)return vd.display;return null;}
}''',
    "android/view/WindowManagerGlobal.java": r'''package android.view;import java.util.*;public class WindowManagerGlobal {
 public static final WindowService service=new WindowService();public static Object getWindowManagerService(){return service;}
 public static class WindowService {public final Map<Integer,Boolean> decors=new HashMap<>();
 public final Map<Integer,Integer> policies=new HashMap<>();public int forced=-1;
 public void setDisplayImePolicy(int display,int policy){policies.put(display,policy);}public int getDisplayImePolicy(int display){return forced>=0?forced:policies.getOrDefault(display,0);}
 public void setShouldShowSystemDecors(int display,boolean value){decors.put(display,value);}public boolean shouldShowSystemDecors(int display){return Boolean.TRUE.equals(decors.get(display));}}
}''',
    "android/util/Log.java": "package android.util;public class Log {public static int w(String tag,String text,Throwable t){return 0;}}",
    "android/system/ErrnoException.java": "package android.system;public class ErrnoException extends Exception {public final int errno;public ErrnoException(String operation,int errno){super(operation+\":\"+errno);this.errno=errno;}}",
    "android/system/StructStat.java": "package android.system;public class StructStat {public int st_uid,st_mode;public long st_dev=1,st_ino,st_size;}",
    "android/system/OsConstants.java": r'''package android.system;public class OsConstants {
 public static final int O_RDWR=2,O_CREAT=64,O_CLOEXEC=128,O_NOFOLLOW=256,O_RDONLY=0,O_WRONLY=1,O_EXCL=512;
 public static final int ENOENT=2,EEXIST=17,EIO=5;public static boolean S_ISREG(int mode){return mode==1;}public static boolean S_ISDIR(int mode){return mode==2;}
}''',
    "android/system/Os.java": r'''package android.system;
import java.io.*;import java.nio.file.*;import java.util.*;import org.json.*;
public class Os {
 public static final List<String> events=new ArrayList<>();public static boolean failNextHomeWrite,failNextLeaseClear,failNextArchive;public static int directorySyncs,failHomeWindow=-1;
 static long nextInode=1;static final Map<String,StructStat> metadata=new HashMap<>();static final Map<FileDescriptor,Handle> handles=new IdentityHashMap<>();
 static final class Handle {String path;RandomAccessFile stream;Handle(String path,RandomAccessFile stream){this.path=path;this.stream=stream;}}
 static String key(String path){return new File(path).getAbsolutePath();}
 public static StructStat lstat(String path)throws ErrnoException {String k=key(path);File file=new File(k);if(!file.exists())throw new ErrnoException("lstat",2);
  StructStat stat=metadata.get(k);if(stat==null){stat=new StructStat();stat.st_ino=nextInode++;metadata.put(k,stat);}stat.st_mode=file.isDirectory()?2:1;stat.st_size=file.length();return stat;}
 public static StructStat fstat(FileDescriptor fd)throws ErrnoException{return lstat(handles.get(fd).path);}
 public static void mkdir(String path,int mode)throws ErrnoException{File file=new File(path);if(file.exists())throw new ErrnoException("mkdir",17);if(!file.mkdir())throw new ErrnoException("mkdir",5);lstat(path);}
 public static void chown(String path,int uid,int gid)throws ErrnoException{lstat(path).st_uid=uid;}public static void chmod(String path,int mode){}
 public static void fchown(FileDescriptor fd,int uid,int gid)throws ErrnoException{chown(handles.get(fd).path,uid,gid);}public static void fchmod(FileDescriptor fd,int mode){}
 public static FileDescriptor open(String path,int flags,int mode)throws ErrnoException {
  String k=key(path);File file=new File(k);if((flags&OsConstants.O_EXCL)!=0&&file.exists())throw new ErrnoException("open",17);
  if(!file.exists()&&(flags&OsConstants.O_CREAT)==0)throw new ErrnoException("open",2);
  try{if(file.isDirectory()){FileDescriptor fd=new FileDescriptor();handles.put(fd,new Handle(k,null));return fd;}
   RandomAccessFile stream=new RandomAccessFile(file,(flags&(OsConstants.O_WRONLY|OsConstants.O_RDWR))!=0?"rw":"r");
   FileDescriptor fd=stream.getFD();handles.put(fd,new Handle(k,stream));lstat(k);return fd;
  }catch(IOException e){throw new ErrnoException("open",5);}}
 public static void close(FileDescriptor fd)throws ErrnoException{Handle h=handles.remove(fd);if(h!=null&&h.stream!=null)try{h.stream.close();}catch(IOException e){throw new ErrnoException("close",5);}}
 public static void rename(String source,String target)throws ErrnoException{
  try{JSONObject value=new JSONObject(Files.readString(Path.of(source)));int home=value.optInt("home_task_id",-1);
   if(failNextArchive&&target.contains("resolved-home-")){failNextArchive=false;throw new ErrnoException("injected archive persistence",5);}
   if(failNextHomeWrite&&home>=0){failNextHomeWrite=false;throw new ErrnoException("injected home persistence",5);}
   if(failHomeWindow==value.optInt("window_id",-2)&&home>=0){failHomeWindow=-1;throw new ErrnoException("injected target lease persistence",5);}
   if(failNextLeaseClear&&home<0){failNextLeaseClear=false;throw new ErrnoException("injected lease clear",5);}
   Files.move(Path.of(source),Path.of(target),StandardCopyOption.REPLACE_EXISTING);metadata.put(key(target),metadata.remove(key(source)));
   events.add("persist:"+value.optInt("window_id",-1)+":"+home);
  }catch(IOException e){throw new ErrnoException("rename",5);}}
 public static void remove(String path)throws ErrnoException{try{Files.delete(Path.of(path));metadata.remove(key(path));}catch(NoSuchFileException e){throw new ErrnoException("remove",2);}catch(IOException e){throw new ErrnoException("remove",5);}}
 public static void fsync(FileDescriptor fd){directorySyncs++;events.add("directory_sync");}
 public static void cleanup(){for(Handle h:handles.values())if(h.stream!=null)try{h.stream.close();}catch(IOException ignored){}handles.clear();}
}''',
}

TEST = r'''package ls.augment.com;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.system.*;
import java.nio.file.*;import java.util.*;import java.lang.reflect.*;import org.json.*;
public final class TestAtomicWorkbenchHome {
 static int tests,checks;static Path base;
 static final boolean PROFILE=Boolean.getBoolean("duo.home.profile");
 static final java.lang.management.ThreadMXBean CPU=java.lang.management.ManagementFactory.getThreadMXBean();
 static final long START=System.nanoTime();
 static final Thread MAIN=Thread.currentThread();
 static final java.util.concurrent.ConcurrentHashMap<String,java.util.concurrent.atomic.LongAdder> SAMPLES=new java.util.concurrent.ConcurrentHashMap<>();
 static volatile boolean sampling=PROFILE;
 static final Thread SAMPLER=startSampler();
 static Thread startSampler(){if(!PROFILE)return null;Thread worker=new Thread(()->{while(sampling){
   StackTraceElement[] stack=MAIN.getStackTrace();String key=stack.length==0?"no_stack":stack[0].getClassName()+"."+stack[0].getMethodName();
   for(StackTraceElement frame:stack)if(frame.getClassName().startsWith("ls.augment.com.AtomicWorkbench")){
    key+="@"+frame.getClassName()+"."+frame.getMethodName();break;}
   SAMPLES.computeIfAbsent(key,ignored->new java.util.concurrent.atomic.LongAdder()).increment();
   try{Thread.sleep(20);}catch(InterruptedException end){return;}
  }},"HOME-runtime-profiler");worker.setDaemon(true);worker.start();return worker;}
 static long cpu(){return CPU.isCurrentThreadCpuTimeSupported()?CPU.getCurrentThreadCpuTime():-1;}
 static void profileSummary()throws Exception{if(!PROFILE)return;sampling=false;SAMPLER.join(1000);
  System.out.printf(java.util.Locale.ROOT,"PROFILE HOME total_ms=%.3f directory_syncs=%d%n",(System.nanoTime()-START)/1000000.0,Os.directorySyncs);
  SAMPLES.entrySet().stream().sorted((a,b)->Long.compare(b.getValue().sum(),a.getValue().sum())).limit(12)
   .forEach(entry->System.out.println("PROFILE HOME stack="+entry.getKey()+" samples="+entry.getValue().sum()));}
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 interface Case {void run()throws Exception;}static void test(String name,Case body)throws Exception{
  long start=System.nanoTime(),cpuStart=cpu();int syncs=Os.directorySyncs;
  try{body.run();tests++;System.out.println("PASS production HOME: "+name);}
  finally{if(PROFILE)System.out.printf(java.util.Locale.ROOT,"PROFILE HOME case=%s elapsed_ms=%.3f cpu_ms=%.3f directory_syncs=%d%n",name,(System.nanoTime()-start)/1000000.0,(cpu()-cpuStart)/1000000.0,Os.directorySyncs-syncs);}}
 public static class Task {public int taskId,displayId,userId,type;public boolean root=true,leaf=true,stable=true,primaryMember=true,visible=true;public ComponentName baseActivity,topActivity;public android.window.WindowContainerToken token=new android.window.WindowContainerToken();
  Task(int id,int display,int user,int type,String component){taskId=id;displayId=display;userId=user;this.type=type;baseActivity=ComponentName.unflattenFromString(component);topActivity=baseActivity;}public int getActivityType(){return type;}}
 public static class Service {
  final List<Task> list=new ArrayList<>();final Path data;final int user;boolean hook=true,failRestore,failTransfer,failRecreatedCheck,limitTasks,mergeHomeOnRestore,pendingHomeMutation,skipNewTask;Runnable afterStart;int starts,encodedMoves,positiveMoves,verifications,recreatedChecks,focused=-1,nextTask=100;
  Service(Path data,int user){this.data=data;this.user=user;}
  public List<Task> getAllRootTaskInfos(){List<Task> roots=new ArrayList<>();for(Task t:list)if(t.root)roots.add(t);return roots;}public List<Task> getTasks(int count,boolean a,boolean b,int display){if(limitTasks)return Collections.nCopies(1024,list.get(0));List<Task> leaves=new ArrayList<>();for(Task t:list)if(t.leaf)leaves.add(t);return leaves;}
  public List<Task> getAllRootTaskInfosOnDisplay(int display){List<Task> result=new ArrayList<>();for(Task t:list)if(t.root&&t.displayId==display)result.add(t);return result;}
  public Task getFocusedRootTaskInfo(){for(Task t:list)if(t.taskId==focused)return t;return null;}
  public void setFocusedTask(int id){Os.events.add("focus:"+id);FakeFocusController.events.add("focus:"+id);focused=id;for(Task t:new ArrayList<>(list))if(t.taskId==id){list.remove(t);list.add(0,t);}}
  public void moveRootTaskToDisplay(int id,int display)throws Exception{
   if(id<=-1000000&&display<=Integer.MIN_VALUE+Integer.MAX_VALUE/100000){verifications++;Task t=find(-1000000-id);
    if(pendingHomeMutation)throw new IllegalStateException("native_home_primary_lease_unresolved");
    if(!hook||t==null||!t.stable||!t.primaryMember||t.displayId!=0||t.type!=2||t.userId!=display-Integer.MIN_VALUE||t.userId!=user||!t.baseActivity.flattenToString().equals("launcher/launcher.Home"))throw new IllegalStateException("native_home_primary_identity_unconfirmed");return;}
   if(id<=-1000000&&display<0){recreatedChecks++;if(!hook||failRecreatedCheck||find(-1000000-id)!=null||display!=-1-user)throw new IllegalStateException("native_home_missing_unconfirmed");
    boolean home=false;for(Task t:list)if(t.type==2&&t.userId==user&&t.displayId==0&&t.stable&&t.baseActivity.flattenToString().equals("launcher/launcher.Home"))home=true;
    if(!home)throw new IllegalStateException("native_home_primary_structure_unconfirmed");Os.events.add("recreated_check:"+(-1000000-id));return;}
   if(id<0&&display==0){verifications++;Task t=find(-1000000-id);if(!hook||t==null||!t.stable||t.displayId!=0)throw new IllegalStateException("native_home_primary_structure_unconfirmed");return;}
   if(id<0){encodedMoves++;if(!hook)throw new IllegalArgumentException("missing task");id=-1000000-id;
    Task home=find(id);check(home!=null&&home.type==2&&home.userId==user,"Hook request must identify actual HOME");
    if(home.displayId==display)return;
    if(home.displayId!=0){boolean source=false;try(var files=Files.list(data.resolve("files/atomic_workbench"))){for(Path file:files.filter(p->p.toString().endsWith(".json")).toList()){
      JSONObject j=new JSONObject(Files.readString(file));if(j.optInt("home_task_id",-1)==id&&j.optInt("display_id",-1)==home.displayId&&j.optInt("home_transfer_display",-1)==display&&j.optBoolean("home_migration_pending"))source=true;}}
      check(source,"direct HOME transfer lacks durable source handoff identity");if(failTransfer)throw new IllegalStateException("injected transfer refused before mutation");}
    boolean durable=false;try(var files=Files.list(data.resolve("files/atomic_workbench"))){for(Path file:files.filter(p->p.toString().endsWith(".json")).toList()){
     JSONObject j=new JSONObject(Files.readString(file));if(j.optInt("home_task_id",-1)==id&&j.optInt("display_id",-1)==display
       &&j.optInt("user_id",-1)==user&&j.optString("home_component").equals(home.baseActivity.flattenToString()))durable=true;}}
    check(durable,"HOME migration attempted without durable exact task/user/component/display evidence");
    check(!Os.events.isEmpty()&&Os.events.get(Os.events.size()-1).equals("directory_sync"),"HOME migration preceded directory durability boundary");
   }else{positiveMoves++;if(display==0&&failRestore)throw new IllegalStateException("restore blocked");}
   Os.events.add("move:"+id+":"+display);Task task=find(id);if(task==null)throw new IllegalArgumentException("missing task");task.displayId=display;
   if(task.type==2&&display==0){focused=task.taskId;if(mergeHomeOnRestore){task.root=false;task.leaf=false;}}
  }
  Task find(int id){for(Task t:list)if(t.taskId==id)return t;return null;}
  public int startActivityAsUser(IApplicationThread caller,String pkg,String feature,Intent intent,String type,IBinder token,String who,int request,int flags,ProfilerInfo profiler,Bundle options,int user){
   if(skipNewTask){starts++;if(afterStart!=null)afterStart.run();return 0;}
   starts++;Task task=new Task(nextTask++,options.getInt("launchDisplayId"),user,1,intent.getComponent().flattenToString());list.add(0,task);focused=task.taskId;return 0;}
  public int startActivityFromRecents(int id,Bundle options){Task t=find(id);if(t!=null)t.displayId=options.getInt("launchDisplayId");return 0;}
 }
 static final class Fixture implements AutoCloseable {
  final Context context=new Context();final Handler handler=new Handler();final Path data;final Service service;final Task home;final int user;AtomicWorkbenchPlatform platform;AtomicWorkbenchEngine engine;
  Fixture()throws Exception{this(0);}Fixture(int user)throws Exception{this.user=user;data=Files.createTempDirectory(base,"case-");context.packages.dataDir=data.toString();
   service=new Service(data,user);home=new Task(41,0,user,2,"launcher/launcher.Home");service.list.add(home);
   service.list.add(new Task(42,0,user,1,"ls.augment.com/ls.augment.com.AtomicWorkbenchActivity"));ActivityTaskManager.service=service;SystemClock.now=1000;
   Os.events.clear();FakeFocusController.reset();Os.failNextHomeWrite=false;Os.failNextLeaseClear=false;Os.failNextArchive=false;WindowManagerGlobal.service.policies.clear();WindowManagerGlobal.service.forced=-1;platform=createPlatform(0);}
  Bundle show(){return platform.showNativeHome(new Surface(),1080,2400,420);}
  Path file(int window){return data.resolve("files/atomic_workbench/"+(window<0?"recovery.json":"recovery-window-"+window+".json"));}
  JSONObject disk(int window)throws Exception{return new JSONObject(Files.readString(file(window)));}
  AtomicWorkbenchJournal journal()throws Exception{Field f=AtomicWorkbenchPlatform.class.getDeclaredField("journal");f.setAccessible(true);return (AtomicWorkbenchJournal)f.get(platform);}
  void recreateHome(){service.list.remove(home);context.displays.latest.release();service.list.add(0,new Task(61,0,user,2,"launcher/launcher.Home"));}
  Path archive()throws Exception{try(var files=Files.list(data.resolve("files/atomic_workbench"))){return files.filter(p->p.getFileName().toString().startsWith("resolved-home-")).findFirst().orElse(null);}}
  AtomicWorkbenchPlatform createRawPlatform(int id){return new AtomicWorkbenchPlatform(context,user*100000+10055,user,handler,id,q->context.resolver.call("ls.augment.com.workbench","home_readiness",null,q),new FakeFocusController(context));}
  boolean allocationAllowed=true;int allocationChecks;
  void requireFixtureAllocation(int target,int source){allocationChecks++;if(!allocationAllowed||target<0||target>=4||source < -1||source>=4)throw new SecurityException("fixture low4 allocation identity");}
  AtomicWorkbenchPlatform createPlatform(int id){AtomicWorkbenchPlatform p=createRawPlatform(id);p.configureAllocationScopeFence((target,source)->{if(target!=id)throw new SecurityException("fixture foreign slot");requireFixtureAllocation(target,source);});return p;}
  void createEngine(){engine=new AtomicWorkbenchEngine(this::createRawPlatform);engine.configureTaskOperations(new AtomicWorkbenchEngine.TaskController(){
   public Bundle change(Bundle b){throw new AssertionError("task mutation outside HOME fixture");}public Bundle query(String id){throw new AssertionError("task query outside HOME fixture");}public Bundle cancel(String id){throw new AssertionError("task cancel outside HOME fixture");}
   private Bundle empty(){Bundle b=new Bundle();b.putBoolean("success",true);return b;}public Bundle shelf(){return empty();}public Bundle cleanup(){return empty();}public void maintain(){}public boolean hasPending(){return false;}public boolean blocksWindow(int id){return false;}
   public void requireAllocationScope(int target,int source){requireFixtureAllocation(target,source);}
  });}
  void engine()throws Exception{platform.close();createEngine();}
  public void close(){service.failRestore=false;service.hook=true;for(var vd:context.displays.all){vd.display.owner=0;vd.display.unique="display-"+vd.display.id;}
   home.userId=user;home.baseActivity=new ComponentName("launcher","launcher.Home");home.topActivity=home.baseActivity;if(home.displayId!=0&&context.displays.getDisplay(home.displayId)==null)home.displayId=0;
   if(engine!=null)engine.close();else platform.close();Os.cleanup();}
 }
 static Bundle window(Bundle state,int id){for(Bundle b:state.<Bundle>getParcelableArrayList("windows"))if(b.getInt("window_id")==id)return b;throw new AssertionError("missing slot");}
 static void success(Bundle b){check(b.getBoolean("success"),b.getString("message"));}
 public static void main(String[] args)throws Exception{base=Path.of(args[0]);
  test("scope refusal prevents direct and coordinated HOME allocation",()->{try(Fixture f=new Fixture()){
   f.allocationAllowed=false;Bundle direct=f.show();check(!direct.getBoolean("success")&&f.context.displays.all.isEmpty()&&f.home.displayId==0,"direct scope refusal allocated HOME");
   f.engine();Bundle coordinated=f.engine.showNativeHome(0,new Surface(),1080,2400,420);check(!coordinated.getBoolean("success")&&f.context.displays.all.isEmpty()&&f.home.displayId==0&&f.allocationChecks>=2,"engine scope refusal allocated HOME");
  }});
  test("native HOME guard resumes before its real task focus without moving its lease",()->{try(Fixture f=new Fixture()){
   Bundle shown=f.show();success(shown);int display=shown.getInt("display_id"),moves=f.service.encodedMoves;f.platform.suspendInputFocus();FakeFocusController.events.clear();
   success(f.platform.focusWindow());check(FakeFocusController.events.equals(List.of("resume","focus:41")),"HOME focused before guard removal ack");
   check(f.home.displayId==display&&f.service.encodedMoves==moves&&f.disk(0).getInt("home_task_id")==41&&f.context.displays.all.size()==1,"guard cycle moved HOME or recreated display");
  }});
  test("failed existing HOME guard removal preserves task display Surface and durable lease",()->{try(Fixture f=new Fixture()){
   Bundle shown=f.show();success(shown);int display=shown.getInt("display_id"),moves=f.service.encodedMoves;f.platform.suspendInputFocus();FakeFocusController.failResume=true;Surface incoming=new Surface();
   Bundle failed=f.platform.showNativeHome(incoming,1080,2400,420);check(!failed.getBoolean("success")&&failed.getBoolean("existing_session_preserved")&&incoming.released,"failed HOME guard replaced session or leaked incoming Surface");
   check(f.platform.hasLiveDisplay()&&f.context.displays.getDisplay(display)!=null&&f.home.displayId==display&&f.service.encodedMoves==moves&&f.service.positiveMoves==0,"guard error destroyed display or migrated HOME");
   check(f.disk(0).getInt("home_task_id")==41&&f.disk(0).getInt("display_id")==display,"guard error erased durable HOME evidence");
   FakeFocusController.failResume=false;success(f.platform.focusWindow());
  }});
  test("engine HOME handoff demotes old app and returning app resumes its same display",()->{try(Fixture f=new Fixture()){
   f.engine();Bundle first=f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main");success(first);success(f.engine.focusWindow(0));int appDisplay=first.getInt("display_id"),appTask=first.getInt("task_id");
   Bundle home=f.engine.showNativeHome(1,new Surface(),1080,2400,420);success(home);check(window(f.engine.status(),0).getBoolean("input_focus_suspended"),"HOME promotion left old app editor window-focused");
   FakeFocusController.events.clear();success(f.engine.focusAppWindow(0,"sample/sample.Main"));
   check(!window(f.engine.status(),0).getBoolean("input_focus_suspended")&&window(f.engine.status(),1).getBoolean("input_focus_suspended"),"returning app did not exchange actual guard focus");
   check(FakeFocusController.events.indexOf("resume")>=0&&FakeFocusController.events.indexOf("resume")<FakeFocusController.events.indexOf("focus:"+appTask),"returning app focus preceded guard removal");
   check(f.service.find(appTask).displayId==appDisplay&&f.home.displayId==appDisplay&&f.context.displays.all.size()==2&&Files.exists(f.file(0)),"guard rebind changed app/HOME/display lifetime");
  }});
  for(String mode:new String[]{"null","missing_cleanup","missing_focus","missing_success","pending","false_suspended","contradictory_success"})test("managed HOME "+mode+" reply keeps exact cleanup identity while returning HOME",()->{try(Fixture f=new Fixture()){
   Bundle shown=f.show();success(shown);int display=shown.getInt("display_id");FakeFocusController.replyMode=mode;FakeFocusController.mutateIdentity=true;
   try{f.platform.suspendInputFocus();throw new AssertionError("unconfirmed HOME guard accepted");}catch(IllegalStateException expected){checks++;}
   Bundle failed=f.platform.status();check(!f.platform.readyForInput()&&failed.getBoolean("input_focus_failure")&&failed.getBoolean("input_focus_cleanup_pending"),"HOME bridge uncertainty admitted input or lost cleanup: "+mode);
   String name=FakeFocusController.lastIdentity.getString("display_name"),unique=FakeFocusController.lastIdentity.getString("unique_id");
   Bundle closed=f.platform.close();check(!closed.getBoolean("success")&&closed.getBoolean("recovery_pending")&&closed.getBoolean("input_focus_cleanup_pending"),"HOME cleanup uncertainty reported success");
   check(f.home.displayId==0&&!f.platform.hasLiveDisplay()&&!Files.exists(f.file(0)),"managed bridge blocked physical HOME return or erased live lease");
   check(FakeFocusController.lastIdentity.getInt("display_id")==display&&name.equals(FakeFocusController.lastIdentity.getString("display_name"))&&unique.equals(FakeFocusController.lastIdentity.getString("unique_id")),"HOME release recomputed identity or bridge mutated owned lease");
   FakeFocusController.replyMode="";FakeFocusController.mutateIdentity=false;success(f.platform.close());check(!f.platform.hasRecoveryPending(),"managed HOME detach retry still pending");
  }});
  test("native HOME permits the wallpaper UID while excluding automatic cast and mirror routes",()->{try(Fixture f=new Fixture()){
   Bundle shown=f.show();success(shown);int flags=f.context.displays.requestedFlags;
   check((flags&3)==1&&(flags&8)!=0,"native HOME lost wallpaper access, advertised PRESENTATION or dropped own-content isolation");
   check((f.context.displays.latest.display.flags&Display.FLAG_PRIVATE)==0&&(f.context.displays.latest.display.flags&Display.FLAG_PRESENTATION)==0,"native HOME accepted incompatible display flags");
  }});
  test("native HOME and focus retain physical-screen keyboard policy",()->{try(Fixture f=new Fixture()){
   Bundle shown=f.show();success(shown);int display=shown.getInt("display_id");
   check(shown.getInt("ime_policy",-1)==1&&f.disk(0).getInt("ime_policy")==1,"HOME journal did not confirm phone keyboard route");
   check(!WindowManagerGlobal.service.policies.containsKey(0),"HOME keyboard route changed physical display settings");
   WindowManagerGlobal.service.policies.put(display,0);success(f.platform.focusWindow());
   check(WindowManagerGlobal.service.policies.get(display)==1&&f.platform.status().getInt("ime_policy",-1)==1,"focus restored local virtual keyboard");
   WindowManagerGlobal.service.forced=0;Bundle failed=f.platform.focusWindow();
   check(!failed.getBoolean("success"),"mismatched focus keyboard policy falsely accepted");WindowManagerGlobal.service.forced=-1;
  }});
  test("exit intent observes actual first visible primary HOME without treating background or foreign task as HOME",()->{try(Fixture f=new Fixture()){
   check(f.platform.primaryHomeIsForeground(),"real primary HOME not observed");
   f.service.setFocusedTask(42);check(!f.platform.primaryHomeIsForeground(),"background HOME was mistaken for user exit");
   f.service.find(42).visible=false;check(f.platform.primaryHomeIsForeground(),"invisible root masked real HOME");
   f.home.visible=false;check(!f.platform.primaryHomeIsForeground(),"invisible HOME falsely foreground");f.home.visible=true;
   f.home.userId=10;check(!f.platform.primaryHomeIsForeground(),"other user HOME accepted");f.home.userId=0;
   f.home.topActivity=new ComponentName("other","other.Home");check(!f.platform.primaryHomeIsForeground(),"other HOME identity accepted");
   f.home.topActivity=f.home.baseActivity;f.home.displayId=88;check(!f.platform.primaryHomeIsForeground(),"VD HOME became physical exit evidence");
  }});
  test("same actual HOME task is borrowed only after durable journal and returned by positive ID",()->{try(Fixture f=new Fixture(10)){
   Bundle result=f.show();success(result);int display=result.getInt("display_id");
   check(f.home.taskId==41&&f.home.displayId==display&&f.service.starts==0,"HOME was recreated or substituted");
   check(result.getBoolean("native_home")&&result.getInt("task_id")==41&&result.getInt("home_task_id")==41,"actual HOME observation missing");
   check(f.disk(0).getInt("home_task_id")==41&&f.journal().read().homeTaskId==41,"production journal did not roundtrip HOME lease");
   check(Os.events.indexOf("persist:0:41")<Os.events.indexOf("move:41:"+display),"lease persisted after task mutation");
   f.service.hook=false;Bundle pending=f.platform.close();check(!pending.getBoolean("success")&&f.home.displayId==0&&f.disk(0).getBoolean("home_migration_pending"),"missing structural verification discarded HOME responsibility");f.service.hook=true;success(f.platform.close());check(f.service.positiveMoves==1&&!Files.exists(f.file(0)),"verified recovery repeated migration or retained completed lease");
  }});
  test("missing system Hook rejects impossible negative ID without moving HOME",()->{try(Fixture f=new Fixture()){
   f.service.hook=false;Bundle result=f.show();check(!result.getBoolean("success"),"unsupported HOME route falsely succeeded");
   check(f.home.displayId==0&&f.service.encodedMoves==1&&f.service.positiveMoves==0&&f.service.starts==0,"missing Hook changed actual HOME");
   check(f.platform.hasLiveDisplay()&&f.platform.hasRecoveryPending()&&f.disk(0).getBoolean("home_migration_pending"),"unverified HOME state was discarded");
  }});
  test("failed HOME lease persistence prevents any migration",()->{try(Fixture f=new Fixture()){
   Os.failNextHomeWrite=true;Bundle result=f.show();check(!result.getBoolean("success"),"failed journal accepted");
   check(f.service.encodedMoves==0&&f.home.displayId==0&&f.service.starts==0,"HOME moved before durable lease");
  }});
  test("restore failure preserves durable task identity and display until retry succeeds",()->{try(Fixture f=new Fixture()){
   success(f.show());int display=f.home.displayId;f.service.failRestore=true;Bundle failed=f.platform.close();
   check(!failed.getBoolean("success")&&failed.getBoolean("recovery_pending"),"restore failure acknowledged complete");
   check(f.home.displayId==display&&f.platform.hasLiveDisplay()&&f.disk(0).getInt("home_task_id")==41,"failed restoration discarded responsibility");
   f.service.failRestore=false;success(f.platform.close());check(f.home.displayId==0&&!Files.exists(f.file(0)),"successful retry did not discharge lease");
  }});
  test("post-move journal clear failure retains lease until a durable retry",()->{try(Fixture f=new Fixture()){
   success(f.show());Os.failNextLeaseClear=true;Bundle result=f.platform.restoreNativeHome();
   check(!result.getBoolean("success")&&f.home.displayId==0&&f.platform.hasNativeHome(),"clear failure dropped in-memory responsibility");
   check(f.disk(0).getInt("home_task_id")==41,"failed clear changed durable evidence");success(f.platform.restoreNativeHome());
   check(!f.platform.hasNativeHome()&&f.disk(0).getInt("home_task_id")==-1,"retry failed to persist completed HOME return");
  }});
  for(String mismatch:new String[]{"user","component","capability"})test("primary HOME "+mismatch+" mismatch never creates a display",()->{try(Fixture f=new Fixture()){
   if(mismatch.equals("user"))f.home.userId=10;else if(mismatch.equals("component"))f.home.baseActivity=new ComponentName("other","other.Home");else f.context.packages.homeFlags=0;
   Bundle result=f.show();check(!result.getBoolean("success")&&f.service.encodedMoves==0&&f.context.displays.all.isEmpty(),"invalid primary HOME borrowed");
  }});
  for(String mismatch:new String[]{"unique","owner","foreign_display"})test("restore refuses changed display "+mismatch+" and retains lease",()->{try(Fixture f=new Fixture()){
   success(f.show());int before=f.service.positiveMoves;
   if(mismatch.equals("unique"))f.context.displays.latest.display.unique="replacement";else if(mismatch.equals("owner"))f.context.displays.latest.display.owner=10099;else f.home.displayId=999;
   Bundle result=f.platform.restoreNativeHome();check(!result.getBoolean("success")&&result.getBoolean("recovery_pending"),"display identity mismatch ignored");
   check(f.service.positiveMoves==before&&f.disk(0).getInt("home_task_id")==41&&f.platform.hasLiveDisplay(),"unverified display touched or evidence deleted");
   if(mismatch.equals("foreign_display"))f.home.displayId=f.context.displays.latest.display.id;
  }});
  for(String mismatch:new String[]{"user","component"})test("reused HOME task ID with different "+mismatch+" is never controlled",()->{try(Fixture f=new Fixture()){
   success(f.show());int before=f.service.positiveMoves;if(mismatch.equals("user"))f.home.userId=10;else f.home.baseActivity=new ComponentName("other","other.Home");
   Bundle result=f.platform.restoreNativeHome();check(!result.getBoolean("success")&&result.getBoolean("recovery_pending")&&f.disk(0).getInt("home_task_id")==41,"unconfirmed HOME evidence discarded");check(f.service.positiveMoves==before,"foreign reused task ID migrated");
  }});
  test("observed display zero confirms location but never invents user exit intent",()->{try(Fixture f=new Fixture()){
   success(f.show());f.home.displayId=0;Bundle state=f.platform.status();success(state);
   check(!state.getBoolean("physical_home_returned")&&!state.getBoolean("native_home")&&state.getInt("home_task_id")==-1,"task position was mistaken for physical HOME intent");
   check(f.service.positiveMoves==0&&f.disk(0).getInt("home_task_id")==-1,"external return caused extra migration or left lease");
  }});
  test("only one window owns HOME and handoff skips primary while retaining source display",()->{try(Fixture f=new Fixture()){
   f.engine();Bundle first=f.engine.showNativeHome(0,new Surface(),1080,2400,420);success(first);int old=first.getInt("display_id");Os.events.clear();
   Bundle second=f.engine.showNativeHome(1,new Surface(),1080,2400,420);success(second);int next=second.getInt("display_id");
   check(old!=next&&f.home.displayId==next,"HOME reused wrong owned display");
   check(!Os.events.contains("move:41:0")&&Os.events.contains("move:41:"+next),"direct HOME switch detoured through physical display");
   check(!Os.events.contains("focus:42")&&f.context.displays.getDisplay(old)!=null,"source display was closed or physical host refocused");
   check(!window(f.engine.status(),0).getBoolean("native_home")&&window(f.engine.status(),1).getBoolean("native_home"),"HOME active in two slots");
  }});
  test("refused direct HOME migration preserves source and releases only the new display",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));int display=f.home.displayId,moves=f.service.encodedMoves;f.service.failTransfer=true;Surface next=new Surface();
   Bundle result=f.engine.showNativeHome(1,next,1080,2400,420);check(!result.getBoolean("success")&&next.released,"failed handoff accepted or leaked Surface");
   check(f.home.displayId==display&&f.service.encodedMoves==moves+1&&f.context.displays.getDisplay(display)!=null,"refused handoff changed source HOME/display");
   check(f.disk(0).getInt("home_task_id")==41&&f.disk(0).optInt("home_transfer_display",-1)==-1&&!Files.exists(f.file(1)),"refused handoff left duplicate or erased source responsibility");
  }});
  for(boolean observed:new boolean[]{false,true})test("display zero recovery never closes workbench; previously observed="+observed,()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));f.home.displayId=0;f.service.focused=41;
   if(observed)check(!window(f.engine.status(),0).getBoolean("physical_home_returned"),"status invented physical HOME intent");
   Surface incoming=new Surface();Bundle next=f.engine.showNativeHome(1,incoming,1080,2400,420);success(next);
   check(!next.getBoolean("physical_home_returned")&&f.home.displayId==next.getInt("display_id"),"observed recovery caused workbench exit");
  }});
  test("full exit returns HOME without bringing workbench host back to foreground",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));Os.events.clear();success(f.engine.close());
   check(f.home.displayId==0&&f.service.focused==41&&!Os.events.contains("focus:42"),"full exit wrongly focused workbench host");
  }});
  test("an empty HOME-only slot opens a new app in its original HOME display",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));int old=f.home.displayId;Os.events.clear();
   Bundle result=f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main");success(result);
   check(f.home.displayId==old&&result.getInt("display_id")==old&&f.service.starts==1,"empty HOME slot lost HOME or recreated its display");
   check(!result.getBoolean("home_only")&&result.getInt("task_id")>=100,"new app still labeled empty HOME");
  }});
  test("exited explicit app reopens without releasing its borrowed HOME display",()->{try(Fixture f=new Fixture()){
   f.engine();Bundle first=f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main");success(first);
   success(f.engine.focusWindow(0));int display=first.getInt("display_id"),firstTask=first.getInt("task_id");String unique=first.getString("display_unique_id");
   check(!window(f.engine.status(),0).getBoolean("home_only")&&f.home.displayId==display,"test did not start from explicit app with borrowed HOME");
   f.service.list.remove(f.service.find(firstTask));Bundle empty=window(f.engine.status(),0);
   check(empty.getBoolean("native_home")&&empty.getInt("task_count")==1&&empty.getStringArrayList("running_packages").isEmpty(),"exited app did not leave only HOME");
   Bundle reopened=f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main");success(reopened);
   check(reopened.getInt("display_id")==display&&unique.equals(reopened.getString("display_unique_id"))&&f.home.displayId==display,"reopen changed display or HOME lease");
   check(reopened.getInt("task_id")!=firstTask&&f.service.starts==2&&reopened.getStringArrayList("running_packages").contains("sample"),"reopen only reattached old component instead of launching new task");
  }});
  test("same component reservation cannot hide a different live native application",()->{try(Fixture f=new Fixture()){
   f.engine();Bundle first=f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main");success(first);success(f.engine.focusWindow(0));
   int display=first.getInt("display_id"),firstTask=first.getInt("task_id");f.service.list.remove(f.service.find(firstTask));
   Task other=new Task(81,display,0,1,"other/other.Main");f.service.list.add(0,other);f.service.focused=81;
   Surface surface=new Surface();Bundle rejected=f.engine.openWindow(0,surface,1080,2400,420,"sample/sample.Main");
   check(!rejected.getBoolean("success")&&rejected.getBoolean("existing_session_preserved")&&surface.released,"same old component faked successful new launch");
   check(f.service.starts==1&&other.displayId==display&&f.home.displayId==display&&f.context.displays.getDisplay(display)!=null,"race rejection moved another task or released its display");
  }});
  test("a failed existing-display launch preserves racing native tasks at timeout",()->{try(Fixture f=new Fixture()){
   f.engine();Bundle first=f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main");success(first);success(f.engine.focusWindow(0));
   int display=first.getInt("display_id");f.service.list.remove(f.service.find(first.getInt("task_id")));window(f.engine.status(),0);
   Task other=new Task(81,display,0,1,"other/other.Main");f.service.skipNewTask=true;f.service.afterStart=()->{f.service.list.add(0,other);f.service.focused=81;};
   Bundle pending=f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main");success(pending);
   check("launching".equals(pending.getString("state")),"missing target was falsely confirmed at OPEN");f.handler.advance(7100);
   Bundle state=window(f.engine.status(),0);check(state.getBoolean("success")&&!state.getBoolean("recovery_pending"),"launch timeout prevents a fresh real task snapshot");
   check(state.getInt("display_id")==display&&f.home.displayId==display&&other.displayId==display&&f.context.displays.getDisplay(display)!=null,"timeout migrated a racing app or destroyed original HOME display");
   check(state.getStringArrayList("running_packages").contains("other")&&!state.getString("launch_failure","").isEmpty(),"surviving app or failed-launch feedback missing");
   check(!"recovering".equals(state.getString("state")),"ordinary retry would auto-recover actual surviving tasks");
  }});
  test("app launched from native HOME makes its slot nonempty and cannot be silently replaced",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));int display=f.home.displayId;
   Task app=new Task(81,display,0,1,"launched/launched.Main");f.service.list.add(0,app);f.service.focused=81;
   Bundle observed=window(f.engine.status(),0);check(observed.getStringArrayList("running_packages").contains("launched")&&observed.getInt("task_id")==81&&!observed.getBoolean("native_home"),"native-launched app mistaken for empty HOME slot");
   Surface replacement=new Surface();Bundle result=f.engine.openWindow(0,replacement,1080,2400,420,"other/other.Main");
   check(!result.getBoolean("success")&&result.getBoolean("existing_session_preserved")&&f.service.starts==0&&app.displayId==display&&f.context.displays.getDisplay(display)!=null,"nonempty HOME slot was reset or app relaunched");
   success(f.engine.focusAppWindow(0,"launched/launched.Main"));check(f.home.displayId==display&&app.displayId==display&&f.service.focused==81,"app focus lost same-display HOME lease");
  }});
  test("production journal rejects corrupted HOME identity and foreign owner",()->{try(Fixture f=new Fixture()){
   success(f.show());JSONObject original=f.disk(0);for(JSONObject corrupt:new JSONObject[]{new JSONObject(original.toString()).put("home_origin_display",4),
     new JSONObject(original.toString()).put("home_component","invalid"),new JSONObject(original.toString()).put("owner_uid",10099),new JSONObject(original.toString()).put("window_id",3)}){
    Files.writeString(f.file(0),corrupt.toString());boolean rejected=false;try{f.journal().read();}catch(Exception expected){rejected=true;}check(rejected,"corrupt HOME journal was trusted");}
   Files.writeString(f.file(0),original.toString());check(f.journal().read().homeTaskId==41,"valid journal did not recover after corruption test");
  }});
  test("missing HOME remains a recovery obligation and never triggers cleanup or exit",()->{try(Fixture f=new Fixture()){
   success(f.show());int display=f.home.displayId;f.service.list.remove(f.home);Bundle state=f.platform.status();
   check(!state.getBoolean("success")&&state.getBoolean("recovery_pending")&&!state.getBoolean("physical_home_returned"),"missing HOME misclassified as physical exit");
   check(f.disk(0).getInt("home_task_id")==41&&f.context.displays.getDisplay(display)!=null,"missing HOME evidence/display destroyed");
   Bundle close=f.platform.close();check(!close.getBoolean("success")&&Files.exists(f.file(0)),"cleanup discarded missing HOME responsibility");f.service.list.add(f.home);
  }});
  test("same-slot automatic app focus retains HOME and app foreground",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));int display=f.home.displayId;
   Task app=new Task(81,display,0,1,"launched/launched.Main");f.service.list.add(0,app);f.service.focused=81;int moves=f.service.positiveMoves;
   success(f.engine.focusWindow(0));check(f.home.displayId==display&&f.service.positiveMoves==moves&&f.service.focused==81,"automatic focus stole HOME or app foreground");
  }});
  test("promoted ordinary app borrows actual HOME behind current app",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main"));Task app=f.service.find(100);int display=app.displayId;
   success(f.engine.focusWindow(0));check(f.home.displayId==display&&f.service.focused==100,"promoted app lacks same-display swipe destination");
   check(f.disk(0).getInt("home_task_id")==41&&f.service.starts==1,"HOME was substituted with another activity");
   success(f.engine.openWindow(1,new Surface(),1080,2400,420,"other/other.Main"));Task other=f.service.find(101);success(f.engine.focusAppWindow(1,"other/other.Main"));
   check(f.home.displayId==other.displayId&&app.displayId==display&&f.service.focused==101,"slot switch lost app task or HOME destination");
  }});
  test("HOME restored under existing root is confirmed through leaf snapshot",()->{try(Fixture f=new Fixture()){
   success(f.show());f.home.displayId=0;f.home.root=false;Bundle state=f.platform.status();success(state);
   check(state.getInt("home_task_id")==-1&&!state.getBoolean("physical_home_returned"),"restored child HOME missing or mistaken for exit");
   check(f.disk(0).getInt("home_task_id")==-1&&f.service.positiveMoves==0,"child HOME recovery was not persisted");
  }});
  test("explicit physical exit restores apps then focuses actual primary HOME",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main"));success(f.engine.focusWindow(0));Os.events.clear();
   success(f.engine.close(true));check(f.home.displayId==0&&f.service.find(100).displayId==0&&f.service.focused==41,"explicit exit lost primary HOME focus");
   check(Os.events.lastIndexOf("focus:41")>Os.events.indexOf("move:100:0"),"primary HOME focused before app restoration completed");
  }});
  test("stale display-zero snapshot cannot discharge unfinished HOME migration",()->{try(Fixture f=new Fixture()){
   success(f.show());f.home.displayId=0;f.home.stable=false;AtomicWorkbenchJournal.Record record=f.journal().read();record.homeMigrationPending=true;f.journal().save(record);
   Field field=AtomicWorkbenchPlatform.class.getDeclaredField("record");field.setAccessible(true);field.set(f.platform,record);
   Bundle state=f.platform.status();check(!state.getBoolean("success")&&!state.getBoolean("physical_home_returned")&&f.disk(0).getInt("home_task_id")==41,"cached display zero erased unfinished migration");
   check(f.disk(0).getBoolean("home_migration_pending")&&f.service.verifications>0,"pending structural check was bypassed");f.home.stable=true;success(f.platform.restoreNativeHome());
  }});
  test("destroyed display and framework-confirmed recreated HOME retire old lease with durable evidence",()->{try(Fixture f=new Fixture(10)){
   success(f.show());f.recreateHome();success(f.platform.close());Path archive=f.archive();
   check(archive!=null&&!Files.exists(f.file(0))&&!f.platform.hasRecoveryPending(),"recreated HOME kept startup locked or lost evidence");
   JSONObject saved=new JSONObject(Files.readString(archive));check(saved.getInt("home_task_id")==41&&saved.getInt("replacement_home_task_id")==61&&saved.getInt("user_id")==10,"archive lost old exact HOME identity");
   check(f.service.recreatedChecks==1&&f.service.positiveMoves==0&&f.service.starts==0,"recreated HOME recovery moved or relaunched another task");
  }});
  test("archive write failure keeps original journal and permits a durable retry",()->{try(Fixture f=new Fixture()){
   success(f.show());f.recreateHome();Os.failNextArchive=true;Bundle failed=f.platform.close();
   check(!failed.getBoolean("success")&&f.disk(0).getInt("home_task_id")==41&&f.platform.hasNativeHome(),"archive failure erased old HOME evidence");
   success(f.platform.close());check(f.archive()!=null&&!Files.exists(f.file(0)),"archive retry did not unblock restored session");
  }});
  test("recreated HOME requires the current system hook structural handshake",()->{try(Fixture f=new Fixture()){
   success(f.show());f.recreateHome();f.service.failRecreatedCheck=true;Bundle failed=f.platform.close();
   check(!failed.getBoolean("success")&&f.disk(0).getInt("home_task_id")==41&&f.archive()==null,"unconfirmed framework absence discarded lease");
   f.service.failRecreatedCheck=false;success(f.platform.close());
  }});
  for(String mismatch:new String[]{"reused_id","component","user","no_home","limited_snapshot"})test("missing HOME recovery rejects "+mismatch,()->{try(Fixture f=new Fixture()){
   success(f.show());f.recreateHome();Task replacement=f.service.find(61);
   switch(mismatch){case "reused_id":f.service.list.add(new Task(41,0,10,1,"other/other.Main"));break;
    case "component":replacement.baseActivity=new ComponentName("other","other.Home");break;case "user":replacement.userId=10;break;
    case "no_home":f.service.list.remove(replacement);break;default:f.service.limitTasks=true;}
   Bundle failed=f.platform.close();check(!failed.getBoolean("success")&&f.disk(0).getInt("home_task_id")==41&&f.archive()==null,"unconfirmed old lease cleared");
   check(f.service.recreatedChecks==0&&f.service.positiveMoves==0,"unverified identity reached framework mutation");
   f.service.limitTasks=false;f.service.list.removeIf(t->t.taskId==41||t.taskId==61);f.service.list.add(new Task(61,0,0,2,"launcher/launcher.Home"));success(f.platform.close());
  }});
  test("recreated HOME never erases an application still awaiting recovery",()->{try(Fixture f=new Fixture()){
   success(f.show());Task app=new Task(81,f.home.displayId,0,1,"launched/launched.Main");f.service.list.add(0,app);success(f.platform.status());
   f.recreateHome();app.displayId=999;Bundle failed=f.platform.close();
   check(!failed.getBoolean("success")&&failed.getBoolean("recovery_pending")&&f.disk(0).getInt("home_task_id")==-1,"pending app obligation was discarded");
   check(f.disk(0).getJSONArray("tasks").length()==1&&new JSONObject(Files.readString(f.archive())).getJSONArray("tasks").length()==1,"app recovery evidence missing after HOME archive");
   app.displayId=0;success(f.platform.close());check(f.archive()!=null&&!Files.exists(f.file(0)),"app recovery retry erased historical evidence");
  }});
  test("cold engine reconciles a destroyed prior HOME before opening another slot",()->{try(Fixture f=new Fixture()){
   success(f.show());f.recreateHome();f.journal().releaseLock();f.createEngine();
   Bundle opened=f.engine.showNativeHome(1,new Surface(),1080,2400,420);success(opened);
   check(opened.getInt("home_task_id")==61&&f.archive()!=null&&!Files.exists(f.file(0)),"stale journal blocked new opening or borrowed stale HOME");
   check(f.service.recreatedChecks==1&&f.service.find(61).displayId==opened.getInt("display_id"),"cold recovery did not confirm replacement before borrowing");
  }});
  test("live engine clears retired slot focus before opening an app after display destruction",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));f.recreateHome();
   Bundle opened=f.engine.openWindow(1,new Surface(),1080,2400,420,"sample/sample.Main");success(opened);
   check(f.engine.status().getInt("active_window_id")==1&&!Files.exists(f.file(0)),"recovered closed slot retained active ownership");
  }});
  test("HOME merged into an intermediate task completes cleanup while ordinary app is restored",()->{try(Fixture f=new Fixture()){
   success(f.show());int display=f.home.displayId;Task app=new Task(81,display,0,1,"launched/launched.Main");f.service.list.add(0,app);success(f.platform.status());f.service.mergeHomeOnRestore=true;
   success(f.platform.close());check(!f.home.root&&!f.home.leaf&&f.home.displayId==0&&app.displayId==0,"intermediate HOME or ordinary app not returned");
   check(f.service.getAllRootTaskInfos().stream().noneMatch(t->t.taskId==41)&&f.service.getTasks(1024,false,false,-1).stream().noneMatch(t->t.taskId==41),"fixture exposed intermediate HOME in root/leaf enumeration");
   check(!Files.exists(f.file(0))&&!f.platform.hasRecoveryPending()&&f.service.verifications>0,"confirmed intermediate HOME kept cleanup blocked");
  }});
  test("previously merged intermediate HOME is confirmed without migration or display destruction",()->{try(Fixture f=new Fixture(10)){
   success(f.show());int display=f.home.displayId;f.home.displayId=0;f.home.root=false;f.home.leaf=false;success(f.platform.restoreNativeHome());
   check(f.service.positiveMoves==0&&!f.platform.hasNativeHome()&&f.context.displays.getDisplay(display)!=null,"exact primary verification mutated HOME or released a still-owned display");
   success(f.platform.close());check(!Files.exists(f.file(0)),"confirmed prior intermediate HOME still blocked cleanup");
  }});
  for(String mismatch:new String[]{"user","component","virtual_display","unstable","ancestry","pending_transaction"})test("intermediate HOME structural proof rejects "+mismatch,()->{try(Fixture f=new Fixture()){
   success(f.show());int display=f.home.displayId;f.home.root=false;f.home.leaf=false;f.home.displayId=0;
   switch(mismatch){case "user":f.home.userId=10;break;case "component":f.home.baseActivity=new ComponentName("foreign","foreign.Home");break;case "virtual_display":f.home.displayId=display;break;case "unstable":f.home.stable=false;break;case "pending_transaction":f.service.pendingHomeMutation=true;break;default:f.home.primaryMember=false;}
   Bundle result=f.platform.close();check(!result.getBoolean("success")&&result.getBoolean("recovery_pending")&&f.disk(0).getInt("home_task_id")==41,"unverified intermediate HOME responsibility discarded");
   check(f.service.positiveMoves==0&&f.context.displays.getDisplay(display)!=null,"unverified HOME or live VD was changed");
   f.home.userId=0;f.home.baseActivity=new ComponentName("launcher","launcher.Home");f.home.displayId=0;f.home.stable=true;f.home.primaryMember=true;f.service.pendingHomeMutation=false;success(f.platform.close());
  }});
  test("intermediate HOME confirmation still requires durable lease-clear persistence",()->{try(Fixture f=new Fixture()){
   success(f.show());f.home.displayId=0;f.home.root=false;f.home.leaf=false;Os.failNextLeaseClear=true;Bundle failed=f.platform.close();
   check(!failed.getBoolean("success")&&f.disk(0).getInt("home_task_id")==41&&f.platform.hasNativeHome(),"structure confirmation bypassed persistence");success(f.platform.close());
  }});
  test("observing an intermediate returned HOME preserves still-running ordinary applications",()->{try(Fixture f=new Fixture()){
   success(f.show());int display=f.home.displayId;Task app=new Task(81,display,0,1,"launched/launched.Main");f.service.list.add(0,app);f.home.displayId=0;f.home.root=false;f.home.leaf=false;
   Bundle state=f.platform.status();success(state);check(!f.platform.hasNativeHome()&&state.getInt("task_id")==81&&app.displayId==display&&f.context.displays.getDisplay(display)!=null,"confirmed HOME return closed or lost active app");
   check(!state.getBoolean("physical_home_returned")&&f.service.positiveMoves==0,"read-only observation invented exit or moved task");
  }});
  test("same visible HOME alone permits consumer-buffer reuse and status preserves it",()->{try(Fixture f=new Fixture()){
   Bundle initial=f.show();success(initial);check(!initial.getBoolean("home_reused_visible"),"fresh borrow claimed existing visible HOME");
   Bundle repeated=f.show();success(repeated);check(repeated.getBoolean("home_reused_visible")&&f.platform.status().getBoolean("home_reused_visible"),"static HOME reuse lost before readiness poll");
   Task app=new Task(91,f.home.displayId,0,1,"sample/sample.Main");f.service.list.add(0,app);f.service.focused=91;
   Bundle returnHome=f.show();success(returnHome);check(!returnHome.getBoolean("home_reused_visible"),"HOME behind app falsely reused old HOME buffer");
  }});
  test("target journal failure prevents migration and preserves original HOME owner",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));int display=f.home.displayId,moves=f.service.encodedMoves;Os.failHomeWindow=1;
   Bundle failed=f.engine.showNativeHome(1,new Surface(),1080,2400,420);check(!failed.getBoolean("success")&&f.home.displayId==display&&f.service.encodedMoves==moves,"target persistence failure still migrated HOME");
   check(f.disk(0).getInt("home_task_id")==41&&f.disk(0).optInt("home_transfer_display",-1)==-1,"source handoff responsibility was lost or left pending");
   success(f.engine.showNativeHome(1,new Surface(),1080,2400,420));
  }});
  test("post-transfer source clear failure remains recoverable without losing either undo record",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));Os.failNextLeaseClear=true;
   Bundle failed=f.engine.showNativeHome(1,new Surface(),1080,2400,420);check(!failed.getBoolean("success"),"source ACK persistence failure silently succeeded");
   success(f.engine.close());check(f.home.displayId==0&&!Files.exists(f.file(0))&&!Files.exists(f.file(1)),"overlapping handoff journals could not discharge after verified primary return");
  }});
  test("schema one journals without handoff fields remain readable",()->{try(Fixture f=new Fixture()){
   success(f.show());JSONObject old=f.disk(0);old.remove("home_transfer_display");old.remove("home_transfer_name");old.remove("home_transfer_unique_id");Files.writeString(f.file(0),old.toString());
   AtomicWorkbenchJournal.Record read=f.journal().read();check(read.homeTaskId==41&&read.homeTransferDisplay==-1&&read.homeTransferUniqueId.isEmpty(),"legacy schema-one recovery rejected or manufactured handoff");
  }});
  test("readiness rejects stale generation and separates interface from actual drawn evidence",()->{try(Fixture f=new Fixture()){
   success(f.show());int display=f.home.displayId;String unique=f.disk(0).getString("unique_id");SystemClock.now=2000;
   String base="HR1|20562|"+display+"|"+unique+"|41|2000|";
   f.context.resolver.value=base+"true|true|true||1500|1500|1600|0";
   check(!f.platform.status().getBoolean("home_surface_ready"),"old asynchronous publisher bypassed request generation");
   f.context.resolver.value=base+"false|true|false||1500|0|0|"+System.nanoTime();Bundle waiting=f.platform.status();
   check(waiting.getBoolean("success")&&waiting.getBoolean("wallpaper_interface_ready")&&!waiting.getBoolean("home_surface_ready")&&!waiting.getBoolean("wallpaper_frame_verified"),"task success/interface visibility impersonated frames");
   f.context.resolver.value=base+"true|true|true||1500|1500|1600|"+System.nanoTime();Bundle ready=f.platform.status();
   check(ready.getBoolean("home_surface_ready")&&ready.getBoolean("wallpaper_frame_verified")&&ready.getLong("readiness_started_uptime")==1500&&ready.getLong("home_drawn_uptime")==1500&&ready.getLong("wallpaper_drawn_uptime")==1600,"identity-bound draw times absent");
   SystemClock.now=50000;Bundle stale=f.platform.status();check(!stale.getBoolean("home_surface_ready")&&"observation_time".equals(stale.getString("readiness_reason")),"old acknowledgement bypassed live authorization/freshness");
   f.context.resolver.value=base.replace("|2000|","|50000|")+"true|true|true||1500|1500|1600|"+System.nanoTime();Bundle refreshed=f.platform.status();check(refreshed.getBoolean("home_surface_ready")&&refreshed.getLong("wallpaper_drawn_uptime")==1600,"fresh observation lost actual draw timestamps");
  }});
  profileSummary();System.out.println("HOME RUNTIME RESULT "+tests+" cases; "+checks+" assertions");
 }
}'''


def compile_run(work, sources, production, classpath, data, profile=False):
    sources, production = SUPPORT["output_support"](sources, production)
    motion=sources.get('android/view/MotionEvent.java','')
    if motion and 'getPointerId(' not in motion:
        sources['android/view/MotionEvent.java']=motion.rsplit('}',1)[0]+'public int pointerId,deviceId;public int getPointerId(int index){if(index!=0)throw new IndexOutOfBoundsException();return pointerId;}public int getDeviceId(){return deviceId;}}'
    # Current production dependencies; retain real recovery/delivery classes rather than bypassing their gates.
    for name in ("AtomicWorkbenchRecoveryScope.java", "AtomicWorkbenchRecoveryOwners.java", "AtomicWorkbenchDisplayPolicy.java",
                 "AtomicWorkbenchSlotDomain.java", "AtomicWorkbenchBrowserSearch.java", "AtomicWorkbenchDragDeliveryPolicy.java"):
        if name not in production and 'ls/augment/com/'+name not in sources:production.append(name)
    bundle=sources.get('android/os/Bundle.java','')
    if bundle and 'deepCopy(' not in bundle:
        sources['android/os/Bundle.java']=bundle.rsplit('}',1)[0]+'''public Bundle deepCopy(){Bundle copy=new Bundle();for(var entry:data.entrySet()){Object value=entry.getValue();if(value instanceof Bundle)value=((Bundle)value).deepCopy();else if(value instanceof java.util.ArrayList<?>){java.util.ArrayList<Object> list=new java.util.ArrayList<>();for(Object item:(java.util.ArrayList<?>)value)list.add(item instanceof Bundle?((Bundle)item).deepCopy():item);value=list;}copy.data.put(entry.getKey(),value);}return copy;}}'''
    intent=sources.get('android/content/Intent.java','')
    if intent and 'ACTION_VIEW=' not in intent:
        intent=intent.replace('public static final String ACTION_MAIN=', 'public static final String ACTION_VIEW="android.intent.action.VIEW",CATEGORY_BROWSABLE="android.intent.category.BROWSABLE";public static final String ACTION_MAIN=')
        intent=intent.rsplit('}',1)[0]+'''public Intent(String action,android.net.Uri uri){this(action);data=uri;}public ClipData getClipData(){return clip;}public android.os.Bundle getExtras(){android.os.Bundle b=new android.os.Bundle();for(var e:extras.entrySet())if(e.getValue() instanceof android.os.Bundle)b.putBundle(e.getKey(),(android.os.Bundle)e.getValue());else if(e.getValue() instanceof String)b.putString(e.getKey(),(String)e.getValue());return b;}}'''
        sources['android/content/Intent.java']=intent
    files = []
    for name, content in sources.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        files.append(str(path))
    classes = work / "classes"
    started = time.monotonic()
    subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-d", str(classes),
                    "-cp", classpath, *[str(SUPPORT["SRC"] / name) for name in production], *files],
                   check=True, timeout=90, env=SUPPORT["ENV"])
    if profile:
        print(f"PROFILE HOME compile_ms={(time.monotonic() - started) * 1000:.3f}", flush=True)
    # Unlike the in-memory service tests, these cases perform many real file syncs.
    # Keep a finite deadline while allowing slower disks during concurrent builds.
    subprocess.run([SUPPORT["JAVA"], "-Dfile.encoding=UTF-8", f"-Dduo.home.profile={str(profile).lower()}", "-cp", str(classes) + os.pathsep + classpath,
                    "ls.augment.com.TestAtomicWorkbenchHome", str(data)],
                   check=True, timeout=180, env=SUPPORT["ENV"])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json-jar", type=Path)
    parser.add_argument("--profile", action="store_true", help="Print case wall/CPU timings and sampled JVM wait locations")
    args = parser.parse_args()
    sdk = Path(os.environ.get("ANDROID_HOME", str(ROOT / "audit-output/android-sdk"))) / "platforms/android-36/android.jar"
    jars = list((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    json_jar = args.json_jar or (jars[0] if jars else None)
    if not sdk.is_file() or json_jar is None or not json_jar.is_file():
        parser.error("Android API36 and org.json jar are required")
    sources = SUPPORT["migration_sources"]()
    sources.pop("ls/augment/com/TestAtomicWorkbenchMigration.java")
    sources.update(BASE["SOURCES"])
    sources.pop("ls/augment/com/AtomicWorkbenchJournal.java")
    sources.update(SOURCES)
    sources["android/content/Context.java"] = sources["android/content/Context.java"].replace(
        'public ContentResolver getContentResolver(){return new ContentResolver();}', '').replace(
        "public Object getSystemService", "public final android.content.ContentResolver resolver=new android.content.ContentResolver();public android.content.ContentResolver getContentResolver(){return resolver;}public Object getSystemService")
    if "CATEGORY_HOME=" not in sources["android/content/Intent.java"]:
        sources["android/content/Intent.java"] = sources["android/content/Intent.java"].replace(
            'CATEGORY_LAUNCHER="android.intent.category.LAUNCHER"',
            'CATEGORY_HOME="android.intent.category.HOME",CATEGORY_LAUNCHER="android.intent.category.LAUNCHER"')
    if "putStringArrayList" not in sources["android/os/Bundle.java"]:
        sources["android/os/Bundle.java"] = sources["android/os/Bundle.java"].rsplit("}", 1)[0] + r'''
 public void putStringArrayList(String key,ArrayList<String> values){data.put(key,values);}
 @SuppressWarnings("unchecked")public ArrayList<String> getStringArrayList(String key){return (ArrayList<String>)data.get(key);}
}'''
    sources["ls/augment/com/TestAtomicWorkbenchHome.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="duo-atomic-home-") as temporary:
        work = Path(temporary)
        data = work / "cases"
        data.mkdir()
        compile_run(work, sources,
            ["AtomicWorkbenchPlatform.java", "AtomicWorkbenchEngine.java", "AtomicWorkbenchProtocol.java",
             "AtomicWorkbenchLaunchBridge.java", "AtomicWorkbenchJournal.java"],
            os.pathsep.join((str(json_jar), str(sdk))), data, args.profile)


if __name__ == "__main__":
    main()
