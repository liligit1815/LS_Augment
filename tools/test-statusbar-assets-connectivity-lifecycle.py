"""Exercise production subscription lifetime and fixed-slot/active-data theme resolution."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')

def extract(marker):
    start = SOURCE.index(marker)
    end = SOURCE.index('{', start) + 1
    depth = 1
    while depth:
        depth += (SOURCE[end] == '{') - (SOURCE[end] == '}')
        end += 1
    return SOURCE[start:end]

HARNESS = r'''import java.util.*;import ls.augment.com.*;
public class TestAssetConnectivityLifetime {
 static class View {}static class ViewGroup extends View {boolean shown=true;String surface="main";}
 static class ConnectivityIconView extends View {ConnectivityIconState state=ConnectivityIconState.unknown();ConnectivityIconState sourceState(){return state;}}
 static final Map<ViewGroup,Object> ROOTS=new HashMap<>();
 static boolean interactive=true;static String activeSurface="main";
 static boolean observingSurface(String surface){return interactive&&surface.equals(activeSurface);}
 static boolean displayed(ViewGroup root){return root.shown;}static String surfaceOf(ViewGroup root){return root.surface;}
 static Object application=new Object();static class Main {void post(Runnable work){}}static Main MAIN=new Main();
 static void refreshAll(){}
 static class ConnectivityIconSource {static int starts,stops;ConnectivityIconState state=ConnectivityIconState.unknown();
  ConnectivityIconSource(Object context,Runnable callback){starts++;}void close(){stops++;}}
 static ConnectivityIconSource connectivity;static ConnectivityIconState lastConnectivity=ConnectivityIconState.unknown();
 static boolean dataAliasBound=true;static Set<String> BOUND_IDS=new HashSet<>();static StatusBarThemeSpec theme=StatusBarThemeSpec.empty();
 // PRODUCTION
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static StatusBarThemeSpec.Binding binding(String id,String layer,String surface){return new StatusBarThemeSpec.Binding(id,"level2",layer,"a".repeat(64),false,100,0,0,100,false,surface);}
 static ConnectivityIconState state(int active){return new ConnectivityIconState(80,ConnectivityIconState.PowerState.NONE,true,false,0,false,active,10,
  List.of(new ConnectivityIconState.Sim(10,0,3),new ConnectivityIconState.Sim(20,1,2)));}
 public static void main(String[] args){
  syncConnectivity();check(connectivity==null&&ConnectivityIconSource.starts==0,"no root creates no observer");
  ViewGroup root=new ViewGroup();ROOTS.put(root,new Object());syncConnectivity();check(connectivity!=null&&ConnectivityIconSource.starts==1,"visible observed root starts identity callbacks before artwork is configured");
  syncConnectivity();check(ConnectivityIconSource.starts==1,"repeated refresh reuses callbacks");
  connectivity.state=state(20);lastConnectivity=connectivity.state;
  BOUND_IDS.add("mobile_data.signal");theme=theme.with(binding("mobile_data.signal","whole","all"));
  check(themeId("mobile2.signal","whole","main").equals("mobile_data.signal")&&themeId("mobile1.signal","whole","main").equals("mobile1.signal"),"active subscription selects SIM2 without changing physical SIM1 identity");
  theme=theme.with(binding("mobile2.signal","whole","lock"));BOUND_IDS.add("mobile2.signal");
  check(themeId("mobile2.signal","whole","main").equals("mobile_data.signal"),"fixed SIM override on another surface cannot mask active-data theme");
  check(themeId("mobile2.signal","whole","lock").equals("mobile2.signal"),"fixed SIM theme on same surface takes precedence");
  theme=theme.with(binding("mobile2.signal","foreground","main"));
  check(themeId("mobile2.signal","whole","main").equals("mobile_data.signal"),"foreground override does not mask another layer");
  connectivity.state=state(10);check(themeId("mobile1.signal","whole","main").equals("mobile_data.signal")&&!activeRole("mobile2.signal"),"active-data change moves the role without slot reordering");
  connectivity.state=state(-1);check(!activeRole("mobile1.signal")&&!activeRole("mobile2.signal"),"unknown active data never guesses first/default SIM");
  interactive=false;syncConnectivity();check(connectivity==null&&ConnectivityIconSource.stops==1,"screen-off unregisters callbacks");
  check(!activeRole("mobile2.signal"),"last observation cannot masquerade as current active data after stop");
  interactive=true;syncConnectivity();check(ConnectivityIconSource.starts==2,"screen-on resubscribes");
  root.shown=false;syncConnectivity();check(connectivity==null&&ConnectivityIconSource.stops==2,"no visible root releases observers");
  root.shown=true;root.surface="lock";syncConnectivity();check(connectivity==null,"attached inactive lock root does not start observers");
  activeSurface="lock";syncConnectivity();check(ConnectivityIconSource.starts==3,"visible lock root starts correctly");
  ROOTS.clear();syncConnectivity();check(connectivity==null&&ConnectivityIconSource.stops==3,"detach releases observers");
  System.out.println("Status-bar subscription lifecycle and semantic roles: "+checks+" assertions passed");
 }
}'''
members = '\n'.join(extract(marker) for marker in (
    'private static void syncConnectivity(', 'private static boolean bound(',
    'private static int mobileSlot(', 'private static boolean activeRole(String id){', 'private static boolean activeRole(String id,View owner)',
    'private static String themeId(String id,String layer,String surface){', 'private static String themeId(String id,String layer,String surface,View owner)',
)).replace('StatusBarAssetsHook::refreshAll', 'TestAssetConnectivityLifetime::refreshAll')
with tempfile.TemporaryDirectory(prefix='statusbar-subscriptions-') as tmp:
    work = Path(tmp)
    source = work / 'TestAssetConnectivityLifetime.java'
    source.write_text(HARNESS.replace('// PRODUCTION', members), encoding='utf-8')
    java = ROOT / 'android/app/src/main/java/ls/augment/com'
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, str(source),
                    *(str(java / name) for name in ('ConnectivityIconState.java', 'StatusBarThemeSpec.java', 'StatusBarSurfaceSpec.java', 'StatusBarIconCatalog.java'))], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestAssetConnectivityLifetime'], check=True)
