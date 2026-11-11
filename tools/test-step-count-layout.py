"""Production count geometry plus delayed exact-scene reconfiguration gates."""
import os,re,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
def method(signature):
    s=(STEP/'LiveWorkspace.java').read_text(encoding='utf8');a=s.index('    '+signature);b=s.index('{',a)+1;d=1
    while d:d+=(s[b]=='{')-(s[b]=='}');b+=1
    return s[a:b].replace('android.os.Process','Process').replace('android.os.UserManager','UserManager')
source=r'''
package ls.augment.com.step;
import java.util.*;
public class CountLayoutCases {
 static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static void near(float a,float b,float tolerance,String why){check(Math.abs(a-b)<=tolerance,why+" "+a+" != "+b);}
 static void geometry(){
  for(int[] screen:new int[][]{{1216,2688},{1080,2400},{1440,3200},{1600,2560}})
   for(float density:new float[]{2f,2.75f,3.25f,4f})for(int count=1;count<=5;count++)for(boolean left:new boolean[]{true,false}){
    int w=screen[0],h=screen[1],inset=Math.round(24*density);
    WorkspaceLayout l=new WorkspaceLayout(w,h,density,left,count,inset);
    check(l.top>0&&l.top<h&&l.sideWidth>0&&l.railHeight==h-l.top,"valid screen regions");
    check(l.mainX>=0&&l.mainX+w*l.mainScale<=w+.5&&l.top+h*l.mainScale<=h+.5,"main fits complete logical frame");
    check(left?l.sideWidth+l.gap<=l.mainX+1:l.mainX+w*l.mainScale+l.gap<=l.sideX+1,"regions never overlap");
    int previous=-1;
    for(int n=0;n<count;n++){
     int y=l.rowTop(n,count),height=l.rowHeight(n,count);
     check(y>previous&&y+height<=l.railHeight,"ordered rows stay inside rail");previous=y+height;
     PreviewGeometry fit=new PreviewGeometry(w,h,l.sideWidth,height);
     near(w*fit.scale+2*fit.x,l.sideWidth,.001f,"full app width");near(h*fit.scale+2*fit.y,height,.001f,"full app height");
     if(count>=4){check(fit.x<=1&&fit.y<=2,"only pixel-rounding margin around side app");}
     WorkspaceMotion pose=WorkspaceMotion.place(l,n,count);
     near(pose.x,l.sideX+fit.x,.001f,"transition shares side origin");near(pose.y,l.top+y+fit.y,.001f,"transition shares row origin");
    }
    if(count<=3){WorkspaceLayout baseline=new WorkspaceLayout(w,h,density,left,3,inset);near(l.mainScale,baseline.mainScale,0,"one/two preserve main priority");check(l.top==baseline.top&&l.sideWidth==baseline.sideWidth,"three-row baseline retained");}
    near(w*l.mainScale+l.sideWidth+l.gap,w,1,"main and side fill screen width without gutters");
    near(l.top+h*l.mainScale,h,1,"main fills height without letterboxing");
    WorkspaceImeGeometry.Pose keyboard=WorkspaceImeGeometry.pose(l,true,h*3/4,h*3/4,l.gap*2);
    check(keyboard.y==l.top,"IME retains count-specific top");
    if(h*3/4>l.top+l.gap*2)check(keyboard.y+keyboard.scale*(h*3/4)<=h*3/4-l.gap*2+.1,"input editor above keyboard");
   }
  WorkspaceLayout a=new WorkspaceLayout(1216,2688,3.25f,false,3,0),b=new WorkspaceLayout(1216,2688,3.25f,false,4,0),c=new WorkspaceLayout(1216,2688,3.25f,false,5,0);
  check(b.sideWidth<a.sideWidth&&c.sideWidth<b.sideWidth,"four/five remove oversized three-row column");
  check(b.mainScale>a.mainScale&&c.mainScale>=b.mainScale,"main grows until toolbar safety floor");
  near(a.mainScale,0.74665177f,.000001f,"existing NX809J three-row scale unchanged");
  for(int bad:new int[]{0,6}){try{new WorkspaceLayout(1080,2400,3,false,bad,0);throw new AssertionError("invalid count");}catch(IllegalArgumentException expected){checks++;}}
 }
 static class Bundle {Map<String,Object> v=new HashMap<>();void putInt(String k,int n){v.put(k,n);}void putBoolean(String k,boolean n){v.put(k,n);}int getInt(String k,int fallback){return v.get(k) instanceof Integer?(Integer)v.get(k):fallback;}boolean getBoolean(String k){return Boolean.TRUE.equals(v.get(k));}}
 static class Intent {Bundle data;Intent putExtras(Bundle b){data=b;return this;}Intent putExtra(String k,boolean v){return this;}}
 static class Queue {ArrayDeque<Runnable> items=new ArrayDeque<>();void post(Runnable r){items.add(r);}void drain(){while(!items.isEmpty())items.remove().run();}}
 static class UserManager {boolean foreground=true;boolean isUserForeground(){return foreground;}}
 static class Process {static Object user=new Object();static Object myUserHandle(){return user;}}
 static class Context {boolean unlocked=true,saved=true,wrong;UserManager users=new UserManager();Context getContentResolver(){return this;}Bundle call(Object u,String verb,Object arg,Bundle b){Bundle r=new Bundle();r.v.putAll(b.v);r.putBoolean("saved",saved);if(wrong)r.putInt("sideCount",3);return r;}<T>T getSystemService(Class<T> c){return c.cast(users);}}
 static class Shell {static Context context=new Context();}
 static class StepRuntime {static boolean enabled=true;static void diagnostic(String a,String b){}}
 static class WorkspacePrefsProvider {static Object URI=new Object();}
 static class QuickBar {int warnings;void logUnavailable(String s){warnings++;}void note(Throwable e){warnings++;}void validateLayout(int count){}}
 static class Host {
  static Host current;static int opens;Queue main=new Queue();Intent layoutRestart;Object quickUser=Process.user,reportTo;
  int visibleSlots=3,upperAppId=-1,upperNavigationId=-1;boolean upperEnabled,topAvailable=true,leftSide,renewable=true,closed,closing,busy;String exitReason="";
  SideSlots slots=new SideSlots();int[] retained;QuickBar quickBar=new QuickBar();int closes,logs;
  void preflight(){if(busy||closing||closed)throw new IllegalStateException();}void log(String s){logs++;}
  void close(String reason){if(closing||closed)return;closes++;exitReason=reason;closing=true;}
  static boolean running(){return current!=null&&!current.closed;}
  static boolean interactive(Context c){return c.unlocked;}
  static void open(Object r,Intent i){opens++;}
  METHODS
 }
 static Host fresh(){Host h=Host.current=new Host();Host.opens=0;Shell.context=new Context();StepRuntime.enabled=true;return h;}
 static void restart(){
  Host h=fresh();h.slots.replace(0,-1,100);h.resizeSlots(5,false);
  check(h.closes==1&&h.layoutRestart!=null&&h.visibleSlots==3&&h.slots.task(0)==100,"old dimensions and exact tasks retained until restoration");
  check(Host.opens==0&&h.main.items.isEmpty(),"saving layout never reopens before cleanup");
  h.closed=true;h.restartLayout();check(Host.opens==0&&h.layoutRestart==null,"cleanup queues one restart");h.main.drain();h.restartLayout();check(Host.opens==1,"one reopen after confirmed cleanup");
  h=fresh();Shell.context.saved=false;h.resizeSlots(5,false);check(h.closes==0&&h.layoutRestart==null&&h.visibleSlots==3,"save failure preserves live scene");
  h=fresh();Shell.context.wrong=true;h.resizeSlots(5,false);check(h.closes==0,"wrong saved geometry rejected");
  h=fresh();h.slots.replace(2,-1,12);h.resizeSlots(2,false);check(h.closes==0&&h.quickBar.warnings==1,"occupied tail cannot be discarded");
  h=fresh();h.upperEnabled=true;h.upperAppId=14;h.resizeSlots(5,false);check(h.closes==0,"occupied top cannot be disabled");
  h=fresh();h.topAvailable=false;h.resizeSlots(4,true);check(h.closes==0,"missing top capability stays unchanged");
  h=fresh();h.resizeSlots(5,true);check(h.closes==1,"five side slots and independent upper slot supported");
  h=fresh();h.busy=true;h.resizeSlots(5,false);check(h.closes==0,"in-flight handoff blocks layout");
  for(int kind=0;kind<7;kind++){
   h=fresh();h.resizeSlots(4,false);
   if(kind==0)Host.stop("息屏暂挂");
   h.closed=kind!=1;h.restartLayout();
   if(kind==2)Shell.context.unlocked=false;
   if(kind==3)StepRuntime.enabled=false;
   if(kind==4)h.quickUser=new Object();
   if(kind==5)Shell.context.users.foreground=false;
   if(kind==6)Host.current=new Host();
   h.main.drain();check(Host.opens==0,"interrupted restart must not open: "+kind);
  }
 }
 public static void main(String[] args){geometry();restart();System.out.println("PASS "+checks+" count geometry, physical input and delayed reconfiguration checks");}
}
'''.replace('METHODS','\n'.join(method(n) for n in ['void resizeSlots(', 'void restartLayout(', 'static void stop(']))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-count-layout-') as tmp:
    p=Path(tmp);f=p/'CountLayoutCases.java';f.write_text(source,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f]+[STEP/(n+'.java') for n in ['WorkspaceLayout','PreviewGeometry','WorkspaceMotion','WorkspaceImeGeometry','SideSlots','WorkspaceCapacity']],check=True)
    subprocess.run([java/'java','-cp',p,'ls.augment.com.step.CountLayoutCases'],check=True)
