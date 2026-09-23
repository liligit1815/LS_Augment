"""Run production status-bar identification and failure cleanup with small Android stubs.

The retained-overlay regression needs a failure with an already populated grid:
cleaning only the original transforms put every custom label back at (0, 0).
This harness executes the actual Geometry, stopMetrics, restore, failLayout and
queued metrics callback bodies. It requires a JDK and never accesses a device.
"""
from pathlib import Path
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java'


def extract(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


HARNESS = r'''package ls.augment.com.hook;
import java.util.*;
public final class TestStatusBarFailureCleanup {
 static class View {
  String slot; ViewGroup parent;
  float x,y,sx=1,sy=1,alpha=1;
  ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();
  float getTranslationX(){return x;} float getTranslationY(){return y;}
  float getScaleX(){return sx;} float getScaleY(){return sy;} float getAlpha(){return alpha;}
  void setTranslationX(float v){x=v;} void setTranslationY(float v){y=v;}
  void setScaleX(float v){sx=v;} void setScaleY(float v){sy=v;} void setAlpha(float v){alpha=v;}
  ViewGroup.LayoutParams getLayoutParams(){return params;}
  void setLayoutParams(ViewGroup.LayoutParams value){params=value;}
 }
 static class ViewGroup extends View {
  static class LayoutParams {static final int WRAP_CONTENT=-2;int width=WRAP_CONTENT;}
  final List<View> children=new ArrayList<>();
  boolean clipChildren=true,clipPadding=true,keyguard;
  int width=1216,height=107;
  void addView(View v){children.add(v);v.parent=this;}
  void removeView(View v){if(children.remove(v))v.parent=null;}
  void setClipChildren(boolean value){clipChildren=value;}
  void setClipToPadding(boolean value){clipPadding=value;}
  int getWidth(){return width;} int getHeight(){return height;}
 }
 static class FrameLayout extends ViewGroup {}
 static class TextView extends View {
  String text="initial";
  String getText(){return text;} void setText(String value){text=value;}
 }
 static class VendorIcon extends View {}
 static class StatusBarWifiView extends View {}
 static class ModernStatusBarMobileView extends View {}
 static class StatusBarBluetoothView extends View {}
 static class Context {}
 static class Handler {
  final List<Runnable> pending=new ArrayList<>();int clearCalls;
  void removeCallbacksAndMessages(Object token){pending.clear();clearCalls++;}
 }
 static class HandlerThread {int quitCalls;boolean quitSafely(){quitCalls++;return true;}}
 static class ConnectivityIconView extends View {int closeCalls;void close(){closeCalls++;}}
 static class FeatureSettings {
  static final String SYSTEMUI_LAST_ERROR="error",SYSTEMUI_ACTIVE="active",SYSTEMUI_LAYOUT_STATE="layout";
  static final Map<String,String> diagnostics=new LinkedHashMap<>();
  static void diagnostic(Context context,String key,String value){diagnostics.put(key,value);}
  static boolean enabled(Context context,String key){return false;}
  static int integer(Context context,String key,int fallback,int min,int max){return fallback;}
 }
 static class SystemUiHook {
  static final List<TextView> released=new ArrayList<>();
  static String slotOf(View view){return view.slot;}
  static void releaseGridClock(TextView clock){released.add(clock);}
 }
 static boolean isKeyguard(ViewGroup root){return root.keyguard;}
 // GEOMETRY
 // BASE_ID
 static class State {
  final Context context=new Context();final ViewGroup root=new ViewGroup();
  final Map<View,Geometry> geometry=new IdentityHashMap<>();
  final Map<ViewGroup,boolean[]> clips=new IdentityHashMap<>();
  final Map<String,List<View>> groups=new HashMap<>();
  final Map<String,TextView> metrics=new LinkedHashMap<>();
  final TextView[] clockLines=new TextView[2];
  FrameLayout overlay;TextView keyguardClock;ConnectivityIconView connectivityIcon;
  Handler worker;HandlerThread thread;long metricsGeneration;boolean active=true;
  int px(float value){return Math.round(value);}
  // METHODS
  Runnable pendingSample(Map<String,String> values,long generation){return () -> // SAMPLE_BODY
  ;}
 }
 static int checks;
 static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
 static void close(float expected,float actual,String reason){check(Math.abs(expected-actual)<.0001f,reason+": expected "+expected+", got "+actual);}
 static void identify(State state,View view,String slot,boolean expected,String reason){view.slot=slot;check(state.isConnectivity(view)==expected,reason);}
 static void identification(){
  State state=new State();
  identify(state,new View(),null,false,"null slot is a supported non-connectivity view");
  identify(state,new View(),"",false,"empty slot is not connectivity");
  identify(state,new VendorIcon(),null,false,"unbound vendor icon must never throw");
  identify(state,new VendorIcon(),"fan",false,"ordinary vendor slot remains visible");
  identify(state,new View(),"wifi",true,"wifi slot");
  identify(state,new View(),"WiFi",true,"mixed-case wifi slot");
  identify(state,new View(),"mobile",true,"mobile slot");
  identify(state,new View(),"MOBILE",true,"uppercase mobile slot");
  identify(state,new View(),"bluetooth",false,"bluetooth must not be hidden as connectivity");
  identify(state,new StatusBarWifiView(),null,true,"unbound Wi-Fi view uses class fallback");
  identify(state,new ModernStatusBarMobileView(),null,true,"unbound mobile view uses class fallback");
  identify(state,new StatusBarWifiView(),"",true,"empty Wi-Fi slot uses class fallback");
  identify(state,new ModernStatusBarMobileView(),"unknown",true,"mobile class fallback remains compatible");
  identify(state,new StatusBarBluetoothView(),null,false,"other native icon class remains visible");
 }
 static void cleanup(boolean keyguard){
  FeatureSettings.diagnostics.clear();SystemUiHook.released.clear();
  State state=new State();state.root.keyguard=keyguard;
  if(keyguard){state.root.width=2688;state.root.height=140;}
  View nativeClock=new View();nativeClock.x=16;nativeClock.y=3;nativeClock.sx=.8f;nativeClock.sy=.9f;nativeClock.alpha=.75f;
  View nativeIcon=new View();nativeIcon.x=44;nativeIcon.y=4;
  state.root.addView(nativeClock);state.root.addView(nativeIcon);
  Geometry clockGeometry=new Geometry(nativeClock),iconGeometry=new Geometry(nativeIcon);
  state.geometry.put(nativeClock,clockGeometry);state.geometry.put(nativeIcon,iconGeometry);
  nativeClock.x=80;nativeClock.y=20;nativeClock.sx=1.4f;nativeClock.sy=1.5f;nativeClock.alpha=0;clockGeometry.mark(nativeClock);
  nativeIcon.x=70;nativeIcon.y=20;nativeIcon.alpha=0;iconGeometry.mark(nativeIcon);
  // OEM changes made after the grid's last write must survive failure cleanup.
  nativeIcon.y=7;nativeIcon.alpha=.6f;
  state.overlay=new FrameLayout();FrameLayout oldOverlay=state.overlay;state.root.addView(oldOverlay);
  TextView metric=new TextView();oldOverlay.addView(metric);state.metrics.put("cpu",metric);
  Geometry metricGeometry=new Geometry(metric);state.geometry.put(metric,metricGeometry);
  metric.x=250;metric.y=36;metricGeometry.mark(metric);
  for(int row=0;row<2;row++){state.clockLines[row]=new TextView();oldOverlay.addView(state.clockLines[row]);}
  TextView syntheticClock=null;
  if(keyguard){syntheticClock=new TextView();state.keyguardClock=syntheticClock;oldOverlay.addView(syntheticClock);}
  state.connectivityIcon=new ConnectivityIconView();ConnectivityIconView oldConnectivity=state.connectivityIcon;
  state.root.addView(oldConnectivity);
  ViewGroup nativeRegion=new ViewGroup();nativeRegion.clipChildren=false;nativeRegion.clipPadding=true;
  state.clips.put(state.root,new boolean[]{true,true});state.clips.put(nativeRegion,new boolean[]{false,true});
  state.root.setClipChildren(false);state.root.setClipToPadding(false);nativeRegion.setClipToPadding(false);
  state.groups.put("system_icons",List.of(nativeIcon));
  state.worker=new Handler();Handler oldWorker=state.worker;oldWorker.pending.add(()->{});
  state.thread=new HandlerThread();HandlerThread oldThread=state.thread;
  state.metricsGeneration=7;
  Runnable obsoleteSample=state.pendingSample(Map.of("cpu","obsolete"),state.metricsGeneration);
  state.failLayout(new NullPointerException("unbound icon"));
  check(!state.active,"failure must stop drawing immediately");
  check(state.overlay==null&&oldOverlay.parent==null&&!state.root.children.contains(oldOverlay),"failed overlay is removed instead of leaving labels at zero");
  check(state.root.children.equals(List.of(nativeClock,nativeIcon)),"only native children remain in the root");
  check(state.metrics.isEmpty()&&Arrays.stream(state.clockLines).allMatch(Objects::isNull),"all custom metric and clock references cleared");
  check(state.worker==null&&state.thread==null,"background worker and thread detached");
  check(oldWorker.pending.isEmpty()&&oldWorker.clearCalls==1,"pending background samples removed");
  check(oldThread.quitCalls==1,"metrics thread shut down");
  check(state.metricsGeneration>7,"old posted results invalidated by a new generation");
  check(state.keyguardClock==null,"synthetic clock reference cleared");
  check(keyguard?SystemUiHook.released.equals(List.of(syntheticClock)):SystemUiHook.released.isEmpty(),"only the owned synthetic clock is released");
  check(state.connectivityIcon==null&&oldConnectivity.parent==null&&oldConnectivity.closeCalls==1,"connectivity listener and custom view removed");
  close(16,nativeClock.x,"native clock X restored");close(3,nativeClock.y,"native clock Y restored");
  close(.8f,nativeClock.sx,"native clock X scale restored");close(.9f,nativeClock.sy,"native clock Y scale restored");
  close(.75f,nativeClock.alpha,"native clock opacity restored");
  close(44,nativeIcon.x,"native icon grid translation undone");close(7,nativeIcon.y,"new OEM translation preserved");
  close(.6f,nativeIcon.alpha,"new OEM alpha preserved");
  check(state.geometry.isEmpty()&&state.groups.isEmpty()&&state.clips.isEmpty(),"ownership and row caches released");
  check(state.root.clipChildren&&state.root.clipPadding,"root clipping restored");
  check(!nativeRegion.clipChildren&&nativeRegion.clipPadding,"nested native clipping restored to its own original values");
  String surface=keyguard?"keyguard":"phone";
  String evidence=FeatureSettings.diagnostics.get("ls_augment_statusbar_"+surface+"_layout_state");
  check(evidence!=null&&evidence.contains("surface="+surface)&&evidence.contains("fallback_native=1"),"failed surface publishes native fallback");
  check(evidence.contains("build="+ls.augment.com.BuildConfig.VERSION_CODE)&&evidence.contains("size="+state.root.width+"x"+state.root.height),"failure evidence uses current build and dimensions");
  check(evidence.equals(FeatureSettings.diagnostics.get(FeatureSettings.SYSTEMUI_LAYOUT_STATE)),"global and per-surface failure witnesses agree");
  check("0".equals(FeatureSettings.diagnostics.get(FeatureSettings.SYSTEMUI_ACTIVE)),"diagnostics no longer claim the grid is active");
  check(FeatureSettings.diagnostics.get(FeatureSettings.SYSTEMUI_LAST_ERROR).contains("grid_layout:java.lang.NullPointerException: unbound icon"),"original failure reason retained");
  check(!FeatureSettings.diagnostics.containsKey("ls_augment_statusbar_"+(keyguard?"phone":"keyguard")+"_layout_state"),"one surface cannot overwrite the other surface's evidence");
  long generationAfterFailure=state.metricsGeneration;
  state.failLayout(new IllegalStateException("repeat"));
  check(state.metricsGeneration>generationAfterFailure,"repeat cleanup still invalidates pending generations");
  check(state.root.children.equals(List.of(nativeClock,nativeIcon)),"repeat failure never removes native children");
  check(oldWorker.clearCalls==1&&oldThread.quitCalls==1&&oldConnectivity.closeCalls==1,"repeat cleanup does not stop or release old resources twice");
  close(.75f,nativeClock.alpha,"repeat cleanup cannot hide the restored clock");
  // Simulate a fresh grid being enabled before a previously posted UI sample runs.
  // This executes the production main.post body, not a copy of its generation guard.
  state.active=true;TextView currentMetric=new TextView();state.metrics.put("cpu",currentMetric);
  obsoleteSample.run();check("initial".equals(currentMetric.text),"obsolete sample cannot write into a restarted grid");
  state.pendingSample(Map.of("cpu","current"),state.metricsGeneration).run();
  check("current".equals(currentMetric.text),"current-generation samples still update normally");
 }
 public static void main(String[] args){
  identification();cleanup(false);cleanup(true);
  System.out.println("Status bar failure cleanup: "+checks+" actual-method identification, teardown, stale-sample and diagnostic assertions passed");
 }
}
'''


def main():
    source = SOURCE.read_text(encoding='utf-8')
    methods = '\n'.join(extract(source, marker) for marker in (
        'boolean isConnectivity(View view)', 'void stopMetrics()',
        'void restore()', 'void failLayout(Throwable error)',
    ))
    sample = extract(source, 'main.post(()->{if(!active||metricsGeneration!=generation)return;')
    sample = sample[sample.index('{'):]
    harness = (HARNESS
               .replace('// GEOMETRY', extract(source, 'private static final class Geometry {'))
               .replace('// BASE_ID', extract(source, 'private static String baseId(String id)'))
               .replace('// METHODS', methods)
               .replace('// SAMPLE_BODY', sample))
    with tempfile.TemporaryDirectory(prefix='lsa-statusbar-failure-') as directory:
        temporary = Path(directory)
        files = []
        sources = {
            'ls/augment/com/hook/TestStatusBarFailureCleanup.java': harness,
            'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public final class BuildConfig {public static final int VERSION_CODE=4242;}\n',
        }
        for name, text in sources.items():
            target = temporary / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(text, encoding='utf-8')
            files.append(str(target))
        subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory, *files], check=True)
        subprocess.run(['java', '-cp', directory, 'ls.augment.com.hook.TestStatusBarFailureCleanup'], check=True, timeout=20)


if __name__ == '__main__':
    main()
