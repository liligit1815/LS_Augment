"""Production full-canvas policy and real adapter methods. Offline; no Android/device claims."""
from pathlib import Path
import ast, os, subprocess, tempfile, argparse

ROOT = Path(os.environ.get('DUO_SOURCE_ROOT', Path(__file__).resolve().parents[1]))
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'

def extract(text, marker):
    start=text.index(marker); end=text.index('{',start)+1; depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}');end+=1
    return text[start:end]

native=ast.parse((ROOT/'tools/test-statusbar-child-spacing-runtime.py').read_text(encoding='utf-8'))
SOURCES=next(ast.literal_eval(n.value) for n in native.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='SOURCES' for t in n.targets))
SOURCES['android/view/View.java']=SOURCES['android/view/View.java'].replace('public float getScaleX()',r'''
 public static final int NO_ID=-1;public int left,top,width=46,height=42,pad; public long invalidations;public boolean zeroNative=true;public int getId(){return 1;}public boolean laidOut=true;public boolean isLaidOut(){return laidOut;}public android.graphics.Matrix getMatrix(){return new android.graphics.Matrix();}
 public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){android.content.res.Resources r=new android.content.res.Resources();r.metrics.density=density;return r;}
 public int getLeft(){return left;}public int getTop(){return top;}public int getRight(){return left+width;}public int getBottom(){return top+height;}
 public int getWidth(){return width;}public int getHeight(){return height;}public int getMeasuredWidth(){return width;}public int getMeasuredHeight(){return height;}
 public int getScrollX(){return 0;}public int getScrollY(){return 0;}public int getPaddingLeft(){return pad;}public int getPaddingRight(){return pad;}public int getPaddingTop(){return 0;}public int getPaddingBottom(){return 0;}
 public void invalidate(){invalidations++;}public void post(Runnable r){}public boolean isShown(){return visibility==VISIBLE;}
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}public OnAttachStateChangeListener attachment;public boolean attached=true;public boolean isAttachedToWindow(){return attached;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener listener){attachment=listener;}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener listener){attachment=null;}
 public float getScaleX()''')
SOURCES['android/view/ViewGroup.java']=SOURCES['android/view/ViewGroup.java'].replace('public int width,height;', 'public static final int WRAP_CONTENT=-2,MATCH_PARENT=-1;public int width,height;')
SOURCES['android/content/Context.java']='package android.content;public class Context {}'
SOURCES['android/content/res/Resources.java']='package android.content.res;public class Resources {public String getResourceEntryName(int id){return "fixture_resource";}public static class Metrics {public float density=1;}public Metrics metrics=new Metrics();public Metrics getDisplayMetrics(){return metrics;}}'
SOURCES['android/graphics/Rect.java']='package android.graphics;public class Rect {public int left,top,right,bottom;public Rect(){}public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public int width(){return right-left;}public int height(){return bottom-top;}}'
SOURCES['android/graphics/RectF.java']='package android.graphics;public class RectF {public float left,top,right,bottom;public RectF(){}public RectF(RectF o){this(o.left,o.top,o.right,o.bottom);}public RectF(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}public boolean isEmpty(){return right<=left||bottom<=top;}public void offset(float x,float y){left+=x;right+=x;top+=y;bottom+=y;}public void union(RectF r){if(r.isEmpty())return;if(isEmpty()){left=r.left;top=r.top;right=r.right;bottom=r.bottom;}else{left=Math.min(left,r.left);top=Math.min(top,r.top);right=Math.max(right,r.right);bottom=Math.max(bottom,r.bottom);}}}'
SOURCES['android/graphics/Matrix.java']='package android.graphics;public class Matrix {public boolean mapRect(RectF r){return true;}}'
SOURCES['com/zte/controlcenter/widget/CCHeaderView.java']='package com.zte.controlcenter.widget;public class CCHeaderView extends android.widget.FrameLayout {}'
SOURCES['ls/augment/com/ConfigSchema.java']='package ls.augment.com;public class ConfigSchema {public static boolean isRuntimeKey(String key){return !key.startsWith("ui_only");}}'

adapter=(JAVA/'hook/StatusBarWifiAssetSpacingHook.java').read_text(encoding='utf-8')
pair=extract(adapter,'static final class Pair')
pair=pair.replace(extract(pair,'void publish()'),'void publish(){reports++;}')
adapter_methods='\n'.join(extract(adapter,m) for m in ['static boolean below(', 'static boolean allowArtwork(', 'static Pair pair(', 'static void prepareGrid(', 'static int[] margins(', 'static Rect bounds(', 'static boolean includeBoundary(', 'static void gridBudget(', 'private static int maximum(', 'private static int[] nativeBudget(', 'private static RectF managedBandRect(', 'private static RectF projectReservation(', 'private static final class NativeRowCost', 'private static boolean nativeWifiEnvelope(', 'private static int[] nativeFailure(', 'private static RectF budgetRect(', 'private static String budgetView(', 'private static int horizontalMargins('])+'\n'+pair
layout=(JAVA/'hook/StatusBarIconLayoutHook.java').read_text(encoding='utf-8')
layout_methods='\n'.join(extract(layout,m) for m in ['static void observeIcon(', 'private static int[] wifiChildMargins(', 'private static boolean wifiAnchor(', 'private static String wifiContract(', 'static void includeChildBoundary(', 'static boolean composite(', 'private static ViewGroup compositeOwner(', 'static void refreshComposite(', 'private static void observeChildren(', 'private static int[] resizeChildren(', 'static boolean zeroNativeMargins(', 'static int nativeWidthLimit(', 'static void restoreWifiAssetPair(', 'private static void restoreChildBoxes(', 'private static final class MarginRecord', 'private static final class SizeRecord'])
assets=(JAVA/'hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')
descriptor='\n'.join(extract(assets,m) for m in ['static final class LayoutRendering', 'static LayoutRendering layoutRendering(', 'static Drawable nativeDrawable('])
resource=extract(assets,'private static final class Resource')
grid_method=extract((JAVA/'hook/StatusBarGridHook.java').read_text(encoding='utf-8'),'boolean wifiAssetBudgets(').replace('StatusBarWifiAssetSpacingHook.','TestWifiAssetSpacing.')

HARNESS=r'''package ls.augment.com.hook;
import android.view.*;import android.widget.*;import android.graphics.*;import android.graphics.drawable.Drawable;import android.content.Context;import java.util.*;import java.lang.ref.WeakReference;import ls.augment.com.*;
public class TestWifiAssetSpacing {
 static int checks,reports,changes;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}static void eq(int a,int b,String why){check(a==b,why+": "+a+" != "+b);}
 static final Map<ViewGroup,Pair> PAIRS=new WeakHashMap<>();static final Map<View,Long> SIGNALS=new WeakHashMap<>();static void changed(View v){changes++;}
 interface Fits {boolean test(float width,float height);}interface IntFits {boolean test(int value);}
 static class StatusBarGridHook {static boolean configuredIconLayout(View v){return v.grid;}static boolean ownsIconLayout(View v){return v.grid;}static boolean isBarRoot(View v){return v instanceof PhoneStatusBarView;}}
 static class NotificationAppearanceHook {static View ownedIconBand(View h,View r){return null;}}
 static class StatusBarHeaderSpacingHook {static int capacity=1000;static int assetVerticalCapacity(View v){return capacity;}static boolean fitsVerticalPixels(View v,int h){return h<=capacity;}static StatusBarIconSpacingSpec.Insets bounded(View v,String id,StatusBarIconSpacingSpec.Insets e){return e;}static void refresh(View v){}}
 static class ModernStatusBarWifiView extends FrameLayout {}static class PhoneStatusBarView extends LinearLayout {}
 static class StatusBarAssetsHook {
  static final Map<View,Entry> ENTRIES=new IdentityHashMap<>();static boolean artworkActive=true;static long layoutAssetGeneration=1;
  static boolean parentReplaced(View view){return covered;}static boolean covered;static boolean hiddenByPolicy(View v){return false;}
  static String semanticId(View view){return view.semantic;}
  // DESCRIPTOR
 }
 static class StatusBarAssetDrawable extends Drawable {final Drawable original=new Drawable();Drawable original(){return original;}}
 static class WifiStandardHook {static Drawable nativeDrawable(Drawable value){return value;}}
 static class RedMagicSystemUiHook {static boolean ownsStackedChildBoundary(View view){return false;}}
 static class StatusBarWifiAssetSpacingHook {
  static int[] margins(View c,View s,View a,String reason){return TestWifiAssetSpacing.margins(c,s,a,reason);}
  static boolean includeBoundary(View c,RectF b){return TestWifiAssetSpacing.includeBoundary(c,b);}
  static void changed(View target){TestWifiAssetSpacing.changed(target);}
 }
 static class GridState {
  ViewGroup root;Map<String,List<View>> groups=new HashMap<>();Map<View,Rect> contentBounds=new HashMap<>();Map<View,Float> iconHeights=new HashMap<>();float density=1;
  float spacingPx(float dp){return density*dp;}
  // GRID
 }
 static class StatusBarIconLayoutHook {
  static final Map<View,MarginRecord> MARGINS=new WeakHashMap<>();static final Map<ViewGroup,SizeRecord> CHILD_BOXES=new WeakHashMap<>();static final Map<ViewGroup,Boolean> COMPOSITES=new WeakHashMap<>();static final Map<ViewGroup,int[]> CHILD_EXTENTS=new WeakHashMap<>();
  static final Map<ViewGroup,Boolean> COMPOSITE_ACTIVE=new WeakHashMap<>();
  static final Map<View,StatusBarIconSpacingSpec.Insets> EDGES=new IdentityHashMap<>();
  static boolean hasChildWork(View view){return StatusBarAssetsHook.artworkActive||!EDGES.isEmpty();}
  static StatusBarIconSpacingSpec.Insets insets(View v){return EDGES.getOrDefault(v,StatusBarIconSpacingSpec.ZERO);}static StatusBarIconSpacingSpec.Insets insets(View v,String id){return insets(v);}static String semanticId(View v){return v.semantic;}
  static float density(View v){return v.density;}static void watch(ViewGroup v){}static void publishWifiContract(ViewGroup p,String id,String reason){}
  // LAYOUT
 }
 static boolean artworkActive=true;static long layoutAssetGeneration=1;static Context application=new Context();
 static class Queue {final List<Runnable> tasks=new ArrayList<>();void execute(Runnable r){tasks.add(r);}void post(Runnable r){tasks.add(r);}void next(){tasks.remove(0).run();}}
 static Queue READER=new Queue(),MAIN=new Queue();static int released,decodes,created;static boolean decodeFails;
 static class StatusBarArtwork {StatusBarArtwork(Drawable d,View v,Rect r){created++;}static Rect staticPngInkBounds(Drawable d,byte[] b){return null;}void dispose(){} }
 static class StatusBarAssetStore {static int MAX_DECODE_SIDE=128;static Drawable decode(byte[] data,int side){decodes++;if(decodeFails)throw new IllegalArgumentException("fixture decode");return new Drawable();}}
 static class Binding {String asset="sha-a",layer="whole";}
 static class Entry {
  final WeakReference<View> view;final Map<String,Resource> resources=new HashMap<>();boolean capable=true,hidden,drawingReady=true,renderEligible=true;long readyLayoutGeneration=-1;
  Entry(View v){view=new WeakReference<>(v);}boolean inScope(View v){return true;}
 }
 static class SystemClock {static long uptimeMillis(){return 100;}}
 static class FeatureSettings {static void diagnostic(Context c,String key,String value){}}
 static byte[] read(Context c,String hash){return new byte[]{1};}static void release(Drawable d){released++;}static void playback(){}static void circleChanged(View target){}
 // RESOURCE
 // ADAPTER
 static ImageView image(String id,ViewGroup parent){ImageView v=new ImageView();v.semantic=id;v.params=new FrameLayout.LayoutParams(46,42);parent.add(v);v.width=46;v.height=42;return v;}
 static void edge(View v,int s,int t,int e,int b){StatusBarIconLayoutHook.EDGES.put(v,new StatusBarIconSpacingSpec.Insets(s,t,e,b));}
 static Entry entry(ImageView v,boolean ready){Entry e=new Entry(v);StatusBarAssetsHook.ENTRIES.put(v,e);v.drawable=new StatusBarAssetDrawable();if(ready)e.readyLayoutGeneration=StatusBarAssetsHook.layoutAssetGeneration;return e;}
 static ViewGroup.MarginLayoutParams lp(View v){return (ViewGroup.MarginLayoutParams)v.params;}
 static void layoutPair(Pair pair){for(View child:new View[]{pair.signal,pair.activity}){ViewGroup.MarginLayoutParams p=lp(child);child.left=child.direction==1?pair.plan.width-p.getMarginStart()-child.width:p.getMarginStart();child.top=p.topMargin;}}
 static void geometry(){
  for(boolean rtl:new boolean[]{false,true})for(float units:new float[]{1,3.25f,3.25f/.6f})for(int mask=0;mask<256;mask++){
   int[] e=new int[8];for(int i=0;i<8;i++)e[i]=(mask>>i&1)*24;
   StatusBarIconSpacingSpec.Insets s=new StatusBarIconSpacingSpec.Insets(e[0],e[1],e[2],e[3]),a=new StatusBarIconSpacingSpec.Insets(e[4],e[5],e[6],e[7]);
   StatusBarWifiAssetSpacingPolicy.Plan p=StatusBarWifiAssetSpacingPolicy.plan(46,42,s,a,units,rtl,true,true);
   eq(p.width,92+Math.round(e[0]*units)+Math.round(e[2]*units)+Math.round(e[4]*units)+Math.round(e[6]*units),"exact whole canvas width");
   check(Math.min(p.signalX+46,p.activityX+46)<=Math.max(p.signalX,p.activityX),"full canvases cannot overlap including future GIF ink");
   eq(p.signalY,Math.round(e[1]*units),"signal top independent");eq(p.activityY,Math.round(e[5]*units),"activity top independent");
   check(p.fits(p.width,p.height)&&!p.fits(p.width-1,p.height)&&!p.fits(p.width,p.height-1),"exact two-axis budget no clipping");
  }
  StatusBarWifiAssetSpacingPolicy.Plan gone=StatusBarWifiAssetSpacingPolicy.plan(46,42,StatusBarIconSpacingSpec.ZERO,new StatusBarIconSpacingSpec.Insets(2,1,3,2),1,false,false,true);eq(gone.width,51,"GONE signal has no canvas or padding");eq(gone.activityX,2,"remaining activity keeps own start");
  StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.empty().with("all","wifi.signal",new StatusBarIconSpacingSpec.Insets(2,1,3,2)).with("lock","wifi.signal",StatusBarIconSpacingSpec.ZERO);
  check(StatusBarWifiAssetSpacingPolicy.affected(spec,"all","main","wifi.signal"),"main inherits shared edit");check(!StatusBarWifiAssetSpacingPolicy.affected(spec,"all","lock","wifi.signal"),"explicit zero lock override remains untouched");
  Map<String,String> config=new HashMap<>();config.put(StatusBarIconSpacingSpec.KEY,spec.serialize());config.put("grid","A");String hash=StatusBarWifiAssetSpacingObservation.environment(config,"wifi.signal");
  config.put(StatusBarIconSpacingSpec.KEY,spec.with("control","wifi.activity_inout",new StatusBarIconSpacingSpec.Insets(4,3,2,1)).serialize());check(hash.equals(StatusBarWifiAssetSpacingObservation.environment(config,"wifi.signal")),"own pair can be re-evaluated without invalidating environment");config.put("grid","B");check(!hash.equals(StatusBarWifiAssetSpacingObservation.environment(config,"wifi.signal")),"layout change invalidates capacity");
  String runtimeKey=StatusBarWifiAssetSpacingObservation.environment(config,"wifi.signal");config.put("ui_only_theme","dark");check(runtimeKey.equals(StatusBarWifiAssetSpacingObservation.environment(config,"wifi.signal")),"APK-only settings absent from SystemUI snapshot cannot invalidate measured budget");
 }
 static void adapter(){
  PhoneStatusBarView root=new PhoneStatusBarView();root.grid=true;ModernStatusBarWifiView owner=new ModernStatusBarWifiView();root.add(owner);owner.semantic="wifi";owner.params=new ViewGroup.MarginLayoutParams(-2,-1);
  FrameLayout carrier=new FrameLayout();owner.add(carrier);carrier.params=new ViewGroup.MarginLayoutParams(-2,42);ImageView signal=image("wifi.signal",carrier),activity=image("wifi.activity_inout",carrier);signal.density=activity.density=carrier.density=3.25f;
  Entry se=entry(signal,false);edge(signal,8,2,3,1);edge(activity,1,3,6,2);
  StatusBarIconLayoutHook.refreshComposite(owner);check(PAIRS.get(carrier)==null,"wrapper without decoded series must not activate isolated layout");check(StatusBarIconLayoutHook.wifiContract(signal,activity).equals("native"),"unmapped wrapper still exposes original contract");
  se.readyLayoutGeneration=1;StatusBarIconLayoutHook.refreshComposite(owner);Pair p=PAIRS.get(carrier);check(p!=null&&p.series&&!p.active,"valid series prepares but unknown Grid capacity cannot draw");check(!allowArtwork(signal),"no first-frame flash before layout admission");
  final int[] calls={0};gridBudget(p,100,(w,h)->{calls[0]++;return w<=240&&h<=180;});check(p.active,"whole snapshot accepts requested pair");check(!allowArtwork(signal),"accepted budget cannot render before native layout consumes new positions");int trialCalls=calls[0];gridBudget(p,100,(w,h)->{calls[0]++;return false;});eq(calls[0],trialCalls,"unchanged Grid geometry performs no repeated trials");
  StatusBarIconLayoutHook.refreshComposite(owner);layoutPair(p);check(allowArtwork(signal)&&allowArtwork(activity),"only final actual isolated positions can render");
  eq(lp(signal).getMarginStart(),26,"signal starts at its own rounded margin");eq(lp(activity).getMarginStart(),26+46+10+3,"activity follows full signal canvas and trailing space");
  Drawable kept=signal.drawable;ViewGroup.LayoutParams keptParams=signal.params;for(int i=0;i<300;i++){StatusBarIconLayoutHook.refreshComposite(owner);layoutPair(p);}check(signal.drawable==kept&&signal.params==keptParams,"same native View LP and animated drawable identity throughout refreshes");
  eq(carrier.params.height,59,"fixed native parent reserves max of independently rounded vertical boxes, never sum");
  prepareGrid(owner,.5f);gridBudget(p,101,(w,h)->w<=500&&h<=400);StatusBarIconLayoutHook.refreshComposite(owner);layoutPair(p);eq(lp(signal).getMarginStart(),52,"normal user half-size scale compensated, margin remains eight screen dp");
  signal.direction=activity.direction=carrier.direction=1;gridBudget(p,102,(w,h)->w<=500&&h<=400);StatusBarIconLayoutHook.refreshComposite(owner);layoutPair(p);check(p.plan.signalX>p.plan.activityX,"RTL places cells in logical order without mirroring artwork");
  int before=activity.visibility;activity.visibility=View.GONE;StatusBarIconLayoutHook.refreshComposite(owner);eq(p.plan.width,46+52+20,"GONE activity contributes no canvas or edges");eq(activity.visibility,View.GONE,"adapter never forces native visibility");activity.visibility=before;
  se.readyLayoutGeneration=-1;StatusBarIconLayoutHook.refreshComposite(owner);check(!p.series&&!p.active,"losing proven series restores original anchor ownership");check(!allowArtwork(signal),"failed or removed art cannot draw into old cells");
  edge(signal,0,0,0,0);edge(activity,0,0,0,0);StatusBarIconLayoutHook.refreshComposite(owner);eq(lp(signal).getMarginStart(),0,"closing returns signal start to native");eq(lp(activity).getMarginStart(),0,"closing returns arrow start to native");eq(carrier.params.height,42,"closing restores original fixed height");
  se.readyLayoutGeneration=1;StatusBarAssetsHook.covered=true;check(!StatusBarAssetsHook.layoutRendering(signal).series,"whole parent replacement excludes child layout claims");StatusBarAssetsHook.covered=false;
  StatusBarAssetsHook.layoutAssetGeneration=2;check(!StatusBarAssetsHook.layoutRendering(signal).series,"previous configuration success cannot authorize new resource family");
  se.readyLayoutGeneration=2;Resource error=new Resource(se,new Binding());error.error="decode_failed";se.resources.put("whole",error);check(!StatusBarAssetsHook.layoutRendering(signal).series,"known decode error defeats stale successful-family latch");
 }
 static void nativeCapacity(){
  com.zte.controlcenter.widget.CCHeaderView header=new com.zte.controlcenter.widget.CCHeaderView();header.width=300;header.height=140;header.params=new ViewGroup.MarginLayoutParams(300,140);
  LinearLayout row=new LinearLayout();row.width=200;row.height=42;row.left=100;row.params=new ViewGroup.MarginLayoutParams(200,42);header.add(row);
  ModernStatusBarWifiView owner=new ModernStatusBarWifiView();owner.semantic="wifi";owner.params=new ViewGroup.MarginLayoutParams(-2,42);row.add(owner);
  FrameLayout frame=new FrameLayout();frame.params=new ViewGroup.MarginLayoutParams(-2,42);owner.add(frame);ImageView s=image("wifi.signal",frame),a=image("wifi.activity_inout",frame);entry(s,true);
  View battery=new View();battery.width=40;battery.params=new ViewGroup.MarginLayoutParams(40,42);row.add(battery);
  StatusBarHeaderSpacingHook.capacity=8;StatusBarIconLayoutHook.refreshComposite(owner);Pair p=PAIRS.get(frame);check(p.active,"native header with real bounded row accepts independent canvases");eq(p.maxWidth,160,"native sibling reserves forty actual pixels");eq(p.maxHeight,50,"native vertical budget derives from observed header capacity");
  row.width=80;row.params.width=80;StatusBarIconLayoutHook.refreshComposite(owner);check(!p.active&&p.maxWidth==40,"native narrowed row rejects pair rather than shrinking it");eq(lp(a).getMarginStart(),0,"capacity failure restores arrow native anchor");
  row.width=200;row.params.width=200;StatusBarHeaderSpacingHook.capacity=-1;StatusBarIconLayoutHook.refreshComposite(owner);check(!p.active&&p.maxHeight==0,"unknown header height never means unlimited space");
  StatusBarHeaderSpacingHook.capacity=8;View blocker=new View();blocker.left=110;blocker.top=0;blocker.width=30;blocker.height=42;blocker.visibility=View.INVISIBLE;header.add(blocker);StatusBarIconLayoutHook.refreshComposite(owner);check(!p.active,"invisible overlapping native sibling still owns its header slot");
  blocker.visibility=View.GONE;StatusBarIconLayoutHook.refreshComposite(owner);check(p.active,"genuine GONE sibling frees reserved native slot");
  lp(s).topMargin=5;StatusBarIconLayoutHook.refreshComposite(owner);check(!p.active,"single-edge OEM rewrite immediately invalidates zero-origin custom contract");eq(lp(s).topMargin,5,"fallback retains latest OEM-written top margin");eq(lp(a).getMarginStart(),0,"fallback still restores module-owned sibling placement");lp(s).topMargin=0;StatusBarIconLayoutHook.refreshComposite(owner);
  s.params.height=a.params.height=48;frame.params.height=48;StatusBarIconLayoutHook.refreshComposite(owner);eq(p.height(),48,"native canvas size rewrite takes new dimensions");
  ((FrameLayout.LayoutParams)a.params).gravity=17;StatusBarIconLayoutHook.refreshComposite(owner);check(!p.active&&p.plan==null,"unsupported changed anchor cannot keep a stale virtual reservation");
  ((FrameLayout.LayoutParams)a.params).gravity=-1;StatusBarIconLayoutHook.refreshComposite(owner);check(p.active,"native valid anchor restores active layout");frame.attached=false;frame.attachment.onViewDetachedFromWindow(frame);check(!PAIRS.containsKey(frame)&&!p.active&&!p.series,"detach releases registry and valid-series ownership");eq(lp(a).getMarginStart(),0,"detach restores actual native arrow margin");check(frame.attachment==null,"detach removes listener and strong retention chain");
 }
 static void lateResources(){
  View target=new View();Entry owner=new Entry(target);Binding binding=new Binding();Resource resource=new Resource(owner,binding);owner.resources.put("whole",resource);resource.load();READER.next();layoutAssetGeneration=2;MAIN.next();check(resource.art==null&&owner.readyLayoutGeneration==-1&&released>0,"generation-late successful decode must be released before attachment");
  Resource next=new Resource(owner,binding);owner.resources.put("whole",next);next.load();READER.next();owner.resources.put("whole",new Resource(owner,binding));MAIN.next();check(next.art==null,"late callback from replaced resource cannot attach even in same generation");
  Resource live=owner.resources.get("whole");live.load();READER.next();MAIN.next();check(live.art!=null&&owner.readyLayoutGeneration==2,"current decoded resource proves its exact family");int decodeCount=decodes;for(int i=0;i<300;i++)check(live.art!=null,"drawing retains decoded object");eq(decodes,decodeCount,"retaining animation never re-decodes per frame");
  decodeFails=true;Resource failed=new Resource(owner,binding);owner.resources.put("whole",failed);failed.load();READER.next();MAIN.next();check(failed.art==null&&owner.readyLayoutGeneration==-1,"decode failure invalidates sticky family success");
 }
 static void fullGrid(){
  PhoneStatusBarView root=new PhoneStatusBarView();root.grid=true;root.width=360;root.height=64;ModernStatusBarWifiView owner=new ModernStatusBarWifiView();root.add(owner);owner.semantic="wifi";owner.params=new ViewGroup.MarginLayoutParams(-2,-1);
  FrameLayout carrier=new FrameLayout();owner.add(carrier);carrier.params=new ViewGroup.MarginLayoutParams(-2,42);ImageView signal=image("wifi.signal",carrier),activity=image("wifi.activity_inout",carrier);entry(signal,true);StatusBarIconLayoutHook.refreshComposite(owner);Pair p=PAIRS.get(carrier);prepareGrid(owner,.5f);
  GridState state=new GridState();state.root=root;state.groups.put("system_icons",List.of(owner));state.contentBounds.put(owner,new Rect(0,0,p.plan.width,p.plan.height));state.iconHeights.put(owner,p.plan.height*.5f);
  List<StatusBarGridLayout.Node> nodes=new ArrayList<>();nodes.add(new StatusBarGridLayout.Node("clock","L1",0,220,20));nodes.add(new StatusBarGridLayout.Node("system_icons","R1",0,p.plan.width*.5f,p.plan.height*.5f));
  check(state.wifiAssetBudgets(nodes,4,4,0,0,0,0,0),"actual complete Grid permits user's half-size base scale");check(p.active,"actual Grid approves pair after all siblings considered");int roomy=p.maxWidth;
  nodes.set(0,new StatusBarGridLayout.Node("clock","L1",0,300,20));check(state.wifiAssetBudgets(nodes,4,4,0,0,0,0,0),"exact compact pair still fits beside longer clock");check(p.maxWidth<roomy,"neighbor growth reduces actual horizontal budget");
  nodes.set(0,new StatusBarGridLayout.Node("clock","L1",0,320,20));check(!state.wifiAssetBudgets(nodes,4,4,0,0,0,0,0)&&!p.active,"remaining space cannot ignore actual other-side clock");
  root.height=36;nodes.set(0,new StatusBarGridLayout.Node("clock","L1",0,200,10));check(!state.wifiAssetBudgets(nodes,4,4,0,0,0,0,0),"reject added pack shrink below one even though adaptive normally permits 0.8");
  root.height=64;nodes.set(0,new StatusBarGridLayout.Node("clock","L1",0,130,20));check(state.wifiAssetBudgets(nodes,4,4,0,0,0,170,190),"real central cutout and both columns considered without consuming hole");
 }
 public static void main(String[] args){geometry();adapter();fullGrid();nativeCapacity();lateResources();System.out.println("Wi-Fi asset spacing production methods: "+checks+" assertions PASS; local facade, not Android/device evidence");}
}
'''
HARNESS=HARNESS.replace('// DESCRIPTOR',descriptor).replace('// LAYOUT',layout_methods).replace('// RESOURCE',resource).replace('// ADAPTER',adapter_methods).replace('// GRID',grid_method)
HARNESS=HARNESS.replace('StatusBarThemeSpec.Binding binding','Binding binding')
SOURCES['ls/augment/com/hook/TestWifiAssetSpacing.java']=HARNESS

def run():
    jdk=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    with tempfile.TemporaryDirectory(prefix='duo-wifi-assets-') as directory:
        folder=Path(directory);paths=[]
        for name,code in SOURCES.items():
            dest=folder/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_text(code,encoding='utf-8');paths.append(str(dest))
        pure=['StatusBarIconSpacingSpec','StatusBarSurfaceSpec','StatusBarIconCatalog','StatusBarWifiSpacingPolicy','StatusBarWifiSpacingObservation','StatusBarHeaderSpacingObservation','StatusBarWifiAssetSpacingPolicy','StatusBarWifiAssetSpacingObservation','StatusBarWifiBudgetDiagnostic','StatusBarGridLayout','StatusBarAdaptiveLayout']
        subprocess.run([str(jdk/'javac'),'-J-Duser.language=en','-encoding','UTF-8','--release','17','-d',str(folder),*paths,*[str(JAVA/(name+'.java')) for name in pure]],check=True)
        subprocess.run([str(jdk/'java'),'-cp',str(folder),'ls.augment.com.hook.TestWifiAssetSpacing'],check=True,timeout=30)

if __name__=='__main__':run()
