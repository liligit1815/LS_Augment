"""Run production status-bar identification and failure cleanup with small Android stubs.

The retained-overlay regression needs a failure with an already populated grid:
cleaning only the original transforms put every custom label back at (0, 0).
This harness executes production cleanup, temporary fallback/recovery, ownership
and adaptive packing bodies. It requires a JDK and never accesses a device.
"""
from pathlib import Path
import argparse
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
import ls.augment.com.StatusBarGridLayout;
import ls.augment.com.StatusBarAdaptiveLayout;
public final class TestStatusBarFailureCleanup {
 static class ViewTreeObserver {
  interface OnGlobalLayoutListener {void onGlobalLayout();}
  final List<OnGlobalLayoutListener> listeners=new ArrayList<>();
  void addOnGlobalLayoutListener(OnGlobalLayoutListener listener){listeners.add(listener);}
  void removeOnGlobalLayoutListener(OnGlobalLayoutListener listener){listeners.remove(listener);}
  boolean isAlive(){return true;}
  void dispatch(){for(OnGlobalLayoutListener listener:List.copyOf(listeners))listener.onGlobalLayout();}
 }
 static class View {
  static final int VISIBLE=0;int visibility;float transitionAlpha=1;
  String slot; ViewGroup parent;
  int left,top,right,bottom,measuredWidth,measuredHeight;
  static class MeasureSpec {static final int EXACTLY=0x40000000;static int makeMeasureSpec(int size,int mode){return size|mode;}}
  int getLeft(){return left;}int getTop(){return top;}int getRight(){return right;}int getBottom(){return bottom;}
  int getMeasuredWidth(){return measuredWidth;}int getMeasuredHeight(){return measuredHeight;}
  void measure(int w,int h){measuredWidth=w&0x3fffffff;measuredHeight=h&0x3fffffff;}
  void layout(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
  float x,y,sx=1,sy=1,alpha=1;
  ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();
  final ViewTreeObserver observer=new ViewTreeObserver();ViewTreeObserver getViewTreeObserver(){return observer;}
  float getTranslationX(){return x;} float getTranslationY(){return y;}
  float getScaleX(){return sx;} float getScaleY(){return sy;} float getAlpha(){return alpha;}
  int getVisibility(){return visibility;}float getTransitionAlpha(){return transitionAlpha;}
  void setTranslationX(float v){x=v;} void setTranslationY(float v){y=v;}
  void setScaleX(float v){sx=v;} void setScaleY(float v){sy=v;} void setAlpha(float v){alpha=v;}
  ViewGroup.LayoutParams getLayoutParams(){return params;}
  void setLayoutParams(ViewGroup.LayoutParams value){params=value;}
  View getParent(){return parent;}
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
 static class StatusBarClipping {void restore(){}}
 static class StatusBarWifiAssetSpacingHook {static int rejects;static void gridRejected(View root){rejects++;}}
 static class Context {}
 static class Handler {
  final List<Runnable> pending=new ArrayList<>();int clearCalls;
  void removeCallbacksAndMessages(Object token){pending.clear();clearCalls++;}
 }
 static class HandlerThread {int quitCalls;boolean quitSafely(){quitCalls++;return true;}}
 static class ConnectivityIconView extends View {int closeCalls;boolean ready=true,placed=true;void close(){closeCalls++;}boolean ready(){return ready;}boolean usable(){return ready;}boolean placed(){return placed;}void uncommit(){placed=false;}void commit(){placed=true;}String reason(){return "ok";}void publish(String state,int w,int h){}}
 static class RedMagicSystemUiHook {static void stackedGridRejected(View root){}}
 static class FeatureSettings {
  static final String SYSTEMUI_LAST_ERROR="error",SYSTEMUI_ACTIVE="active",SYSTEMUI_LAYOUT_STATE="layout";
  static final Map<String,String> diagnostics=new LinkedHashMap<>();
  static void diagnostic(Context context,String key,String value){diagnostics.put(key,value);}
  static String diagnosticValue(Context context,String key){return diagnostics.getOrDefault(key,"");}
  // DIAGNOSTIC_ERROR
  static boolean enabled(Context context,String key){return false;}
  static int integer(Context context,String key,int fallback,int min,int max){return fallback;}
 }
 static class SystemUiHook {
  static final List<TextView> released=new ArrayList<>();
  static int clockRefreshes;static void refreshGridClock(View root){clockRefreshes++;}
  static void resetGridClock(View root){}static void suspendGridClock(View root){}
  static String slotOf(View view){return view.slot;}
  static void releaseGridClock(TextView clock){released.add(clock);}
 }
 static boolean isKeyguard(ViewGroup root){return root.keyguard;}
 // OVERLAY_ALPHA
 static final Map<ViewGroup,State> STATES=new IdentityHashMap<>();
 static State stateFor(View view){for(View at=view;at!=null;at=at.parent){State state=STATES.get(at);if(state!=null)return state;}return null;}
 // OWNERSHIP
 // GEOMETRY
 // BASE_ID
 static class State {
  final Context context=new Context();final ViewGroup root=new ViewGroup();
  final Map<View,Geometry> geometry=new IdentityHashMap<>();
  final Map<ViewGroup,boolean[]> clips=new IdentityHashMap<>();
  final StatusBarClipping explicitClips=new StatusBarClipping();
  final Map<String,List<View>> groups=new HashMap<>();
  final Map<String,TextView> metrics=new LinkedHashMap<>();
  final TextView[] clockLines=new TextView[2];
  FrameLayout overlay;TextView keyguardClock;ConnectivityIconView connectivityIcon;View alphaAnchor;
  Handler worker;HandlerThread thread;long metricsGeneration,lastWitness;boolean active=true,layoutFailed;
  Object batteryInk;View batteryInkView;String batteryInkInputs="",trialClockCapacity;boolean circleTrial;final List<View> circleNative=new ArrayList<>();
  PackingCapacityBlock packingCapacityBlock;String capacityInputs="configured",capacityShape="native";boolean nativePending;
  String nativeCapacityInputs(){return capacityInputs;}String nativeCapacityInputs(String trial){return capacityInputs;}
  String nativeCapacityShape(){return capacityShape;}boolean nativeLayoutPending(View view){return nativePending;}
  // CAPACITY_BLOCK
  boolean packingSuspended,positionOnly;String packingIssue="";
  boolean positionOnly(){return positionOnly;}boolean connectivityGroup(){return !positionOnly;}
  State(){STATES.put(root,this);}
  Geometry own(View view){return geometry.computeIfAbsent(view,Geometry::new);}
  void prepareReplacement(View view){Geometry original=own(view);view.setAlpha(0);original.mark(view);}
  int px(float value){return Math.round(value);}
  // METHODS
  void publishSuccessfulLayout(long now){
   // SUCCESS_WITNESS
  }
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
  check(FeatureSettings.diagnostics.get(FeatureSettings.SYSTEMUI_LAST_ERROR).contains(";build=4242;pid=123;time="),"failure version, PID and timestamp retained");
  check(FeatureSettings.diagnostics.get(FeatureSettings.SYSTEMUI_LAST_ERROR).contains(";stack="),"failure stack retained");
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
 static void recovery(){
  State state=new State();View battery=new View(),wifi=new View();battery.alpha=.7f;wifi.alpha=.8f;
  ViewGroup nativeRegion=new ViewGroup();state.root.addView(nativeRegion);nativeRegion.addView(battery);nativeRegion.addView(wifi);state.alphaAnchor=battery;
  state.overlay=new FrameLayout();state.root.addView(state.overlay);
  TextView metric=new TextView();state.overlay.addView(metric);state.metrics.put("cpu",metric);
  state.connectivityIcon=new ConnectivityIconView();state.root.addView(state.connectivityIcon);
  state.worker=new Handler();state.thread=new HandlerThread();state.metricsGeneration=9;
  check(!ownsConnectivityReplacement(battery),"ready data alone cannot claim a replacement without placement");
  List<StatusBarGridLayout.Node> nodes=List.of(new StatusBarGridLayout.Node("clock","LS",0,170,16),new StatusBarGridLayout.Node("battery","RS",1,28,26));
  // Alternate real crowded and roomy measured layouts; no saved preference changes.
  for(int frame=0;frame<80;frame++){
   boolean fits=frame%4>=2;state.root.width=fits?240:180;
   state.prepareReplacement(battery);state.prepareReplacement(wifi);
   state.overlay.setAlpha(1);state.connectivityIcon.setAlpha(1);
   StatusBarAdaptiveLayout.Result result=StatusBarAdaptiveLayout.pack(nodes,state.root.width,32,4,4,0,0,2,0,0);
   check(result.valid==fits,"actual adaptive layout decides overflow/recovery at the new width");
   if(result.valid){
    nativeRegion.alpha=.5f;
    Geometry original=state.own(state.connectivityIcon);state.connectivityIcon.x=result.boxes.get("battery").x;original.mark(state.connectivityIcon);
    state.connectivityIcon.commit();
    state.resumePacking();
    check(ownsIconLayout(battery)&&ownsConnectivityReplacement(battery),"successful placement regains native/icon ownership");
    close(0,battery.alpha,"successful replacement hides native battery");close(.5f,state.connectivityIcon.alpha,"successful replacement follows native fade on its first frame");
    close(.5f,state.overlay.alpha,"successful recovery immediately shows the newly placed overlay");
    check(state.packingIssue.isEmpty(),"recovery clears transient reason");
   }else{
    state.suspendPacking(result.reason);
    check(state.active&&!state.layoutFailed,"crowding keeps the live controller eligible to recover");
    check(!ownsIconLayout(battery)&&!ownsConnectivityReplacement(battery)&&!hasGridTransform(battery),"fallback yields all native ownership");
    close(.7f,battery.alpha,"fallback restores native battery opacity");close(.8f,wifi.alpha,"fallback restores native Wi-Fi opacity");
    close(0,state.connectivityIcon.alpha,"fallback never displays stale replacement");close(0,state.overlay.alpha,"fallback hides retained metric/clock overlay");
    for(float fade:new float[]{1,.4f,0,1}){
     nativeRegion.alpha=fade;state.syncOverlayAlpha();
     close(0,state.overlay.alpha,"later native fade updates cannot expose the retained fallback overlay");
     close(0,state.connectivityIcon.alpha,"later native fade updates cannot expose the uncommitted replacement");
     close(.7f,battery.alpha,"native battery keeps its restored opacity while the fallback persists");
     close(.8f,wifi.alpha,"native Wi-Fi keeps its restored opacity while the fallback persists");
    }
    check(state.geometry.isEmpty(),"fallback releases transform baselines before the next candidate");
   }
   check(state.worker!=null&&state.thread!=null&&state.metricsGeneration==9,"transient fallback retains listeners and metrics lifecycle");
  }
  state.suspendPacking("crowded");
  check(StatusBarWifiAssetSpacingHook.rejects>0,"packing fallback revokes imported Wi-Fi cell placement before native restore");
  check(!ownsIconLayout(battery)&&!ownsConnectivityReplacement(battery),"packing fallback releases component and replacement ownership");
  state.restore();check(!state.packingSuspended&&state.packingIssue.isEmpty(),"config restore discards old packing suspension");
  close(.7f,battery.alpha,"mode switch preserves the recovered native battery");
 }
 static void successfulWitness(){
  STATES.clear();FeatureSettings.diagnostics.clear();
  State state=new State();state.suspendPacking("height insufficient");state.layoutFailed=true;
  FeatureSettings.diagnostics.put(FeatureSettings.SYSTEMUI_LAST_ERROR,"grid_layout:old failure");
  state.resumePacking();state.publishSuccessfulLayout(200);
  check(!state.layoutFailed,"successful placement clears the runtime failure flag immediately");
  check("".equals(FeatureSettings.diagnostics.get("ls_augment_statusbar_phone_last_error")),"first recovered frame clears the capacity error even in the first five seconds");
  check("".equals(FeatureSettings.diagnostics.get(FeatureSettings.SYSTEMUI_LAST_ERROR)),"recovery clears the global grid error when no surface remains failed");
  check("1".equals(FeatureSettings.diagnostics.get(FeatureSettings.SYSTEMUI_ACTIVE)),"first recovered frame publishes actual active state");
  State other=new State();other.root.keyguard=true;other.layoutFailed=true;
  FeatureSettings.diagnostics.put(FeatureSettings.SYSTEMUI_LAST_ERROR,"grid_layout:keyguard failure");
  state.lastWitness=0;state.publishSuccessfulLayout(300);
  check("grid_layout:keyguard failure".equals(FeatureSettings.diagnostics.get(FeatureSettings.SYSTEMUI_LAST_ERROR)),"phone recovery cannot erase another surface's outstanding failure");
 }
 static void rejectedCapacity(){
  State state=new State();state.overlay=new FrameLayout();state.root.addView(state.overlay);
  View anchor=new View();state.root.addView(anchor);state.alphaAnchor=anchor;
  state.suspendPacking("height insufficient");
  check(state.holdRejectedCapacity(),"rejected input waits for a native traversal");
  state.root.observer.dispatch();state.nativePending=true;
  check(state.holdRejectedCapacity(),"a pending native traversal cannot replace the rejection signature");
  state.nativePending=false;state.capacityShape="restored native";
  check(state.holdRejectedCapacity(),"the first restored native shape is still a rejected candidate");
  check(state.root.observer.listeners.isEmpty(),"capturing the native shape releases the temporary layout listener");
  for(int frame=0;frame<120;frame++){
   check(state.holdRejectedCapacity(),"the same rejected native shape cannot be retried as a smaller successful grid");
   state.syncOverlayAlpha();close(0,state.overlay.alpha,"cached rejection keeps old custom labels hidden");
  }
  state.capacityShape="new native content";
  check(!state.holdRejectedCapacity()&&state.packingCapacityBlock==null,"a real native shape change releases the rejected capacity");
  state.suspendPacking("height insufficient");state.capacityInputs="changed saved height or rows";
  check(!state.holdRejectedCapacity()&&state.packingCapacityBlock==null,"a configuration change releases the rejection and allows an actual retry");
  check(state.root.observer.listeners.isEmpty(),"changed configuration removes the old rejection listener");
  close(0,state.overlay.alpha,"a retry request alone cannot expose unplaced custom content");
  state.resumePacking();close(1,state.overlay.alpha,"a committed successful retry restores the overlay immediately");
 }
 public static void main(String[] args){
  identification();cleanup(false);cleanup(true);recovery();successfulWitness();rejectedCapacity();
  System.out.println("Status bar failure cleanup: "+checks+" actual-method cleanup, adaptive recovery and ownership assertions passed");
 }
}
'''


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--mutation', choices=('expose-retained-overlay', 'omit-recovery-alpha', 'throttle-first-witness'))
    args = parser.parse_args()
    source = SOURCE.read_text(encoding='utf-8')
    if args.mutation:
        before, after = {
            'expose-retained-overlay': ('active&&!packingSuspended?overlayAlpha(root,alphaAnchor):0', 'overlayAlpha(root,alphaAnchor)'),
            'omit-recovery-alpha': ('syncOverlayAlpha();}', '}'),
            'throttle-first-witness': ('if(lastWitness==0||now-lastWitness>5000)', 'if(now-lastWitness>5000)'),
        }[args.mutation]
        if before not in source:
            raise AssertionError(f'mutation target missing: {args.mutation}')
        source = source.replace(before, after, 1)
    methods = '\n'.join(extract(source, marker) for marker in (
        'boolean isConnectivity(View view)', 'void stopMetrics()',
        'void restore()', 'void failLayout(Throwable error)',
        'void suspendPacking(String reason)', 'void resumePacking()',
        'void restorePlacement()',
        'boolean usingConnectivityIcon()', 'boolean connectivityPlaced()',
        'void syncOverlayAlpha()',
        'void clearRejectedCapacity()', 'boolean holdRejectedCapacity()',
    ))
    witness_start = source.rindex('if(', 0, source.index('lastWitness=now;'))
    witness_end = source.index('FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"1");', witness_start)
    witness_end += len('FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"1");')
    success_witness = source[witness_start:witness_end] + '\n}'
    sample = extract(source, 'main.post(()->{if(!active||metricsGeneration!=generation)return;')
    sample = sample[sample.index('{'):]
    harness = (HARNESS
               .replace('// DIAGNOSTIC_ERROR', extract((SOURCE.parent / 'FeatureSettings.java').read_text(encoding='utf-8'), 'static void diagnosticError('))
               .replace('// GEOMETRY', extract(source, 'private static final class Geometry {'))
               .replace('// OVERLAY_ALPHA', extract(source, 'private static float overlayAlpha('))
               .replace('// CAPACITY_BLOCK', extract(source, 'final class PackingCapacityBlock {'))
               .replace('// BASE_ID', extract(source, 'private static String baseId(String id)'))
               .replace('// OWNERSHIP', '\n'.join(extract(source, marker) for marker in (
                   'static boolean ownsIconLayout(',
                   'static boolean ownsConnectivityReplacement(',
                   'static boolean hasGridTransform(',
               )))
               .replace('// METHODS', methods)
               .replace('// SUCCESS_WITNESS', success_witness)
               .replace('// SAMPLE_BODY', sample))
    with tempfile.TemporaryDirectory(prefix='lsa-statusbar-failure-') as directory:
        temporary = Path(directory)
        files = []
        sources = {
            'android/os/Process.java': 'package android.os;public class Process {public static int myPid(){return 123;}}',
            'android/util/Log.java': 'package android.util;public class Log {public static String getStackTraceString(Throwable e){java.io.StringWriter w=new java.io.StringWriter();e.printStackTrace(new java.io.PrintWriter(w));return w.toString();}}',
            'ls/augment/com/hook/TestStatusBarFailureCleanup.java': harness,
            'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public final class BuildConfig {public static final int VERSION_CODE=4242;}\n',
        }
        for name, text in sources.items():
            target = temporary / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(text, encoding='utf-8')
            files.append(str(target))
        files += [str(SOURCE.parent.parent / name) for name in ('StatusBarGridLayout.java','StatusBarAdaptiveLayout.java')]
        subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory, *files], check=True)
        subprocess.run(['java', '-cp', directory, 'ls.augment.com.hook.TestStatusBarFailureCleanup'], check=True, timeout=20)


if __name__ == '__main__':
    main()
