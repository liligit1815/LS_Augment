"""Production native-view selection -> pair -> layout/draw/observation identity regression.
View allocation, tint delivery and the Canvas are recording substitutes. The original
production methods and DualSignalLayout execute; actual paths/tint/GPU have separate tests.
"""
from pathlib import Path
import argparse
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--source-root',type=Path,default=ROOT)
parser.add_argument('--case',choices=['constructor','switch','layout','input','events','ios','badge_capacity','all'],default='all')
args=parser.parse_args()
base=args.source_root/'android/app/src/main/java'
source=(base/'ls/augment/com/hook/RedMagicSystemUiHook.java').read_text(encoding='utf-8')
pair=source[source.index('private static final class SignalPair'):source.index('/** Compact bars')]
drawing=source[source.index('private static final class SignalDrawable'):source.index('private static View find(View root')]

def method(text,marker):
    start=text.index(marker);end=text.index('{',start)+1;depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}');end+=1
    return text[start:end]

def adapt(code):return code.replace('ImageView','View')

select_start=source.index('View one = null, two = null;')
select_end=source.index('if (!stack || !signalsReady',select_start)
pair_fields=pair[pair.index('final View one, two;'):pair.index('SignalPair(View one,')]
draw_fields=drawing[drawing.index('final View owner;'):drawing.index('void refresh()')]
# Old source need not contain a later diagnostic field to compile the negative
# control. Behavior (constructor/matches/layout/input), never field presence, decides.
if 'fallbackReason' not in draw_fields:draw_fields+='String fallbackReason="slot_unknown";\n'
pair_methods=['SignalPair(View one,','static SignalPair create(','boolean matches(','boolean canDraw()',
              'private static boolean occupied(', 'private void releaseOwner(',
              'private static boolean visibleWithin(','private static Object subscription(',
              'ls.augment.com.DualSignalSpacingObservation observation(']
draw_methods=['ls.augment.com.ConnectivityIconState.Sim rowSim(',
              'ls.augment.com.DualSignalLayout layout(','float[] badgeAspects(',
              'float badgeAspect(','String planInputs()','void refuseIdentity()',
              'SignalDrawable(View owner,','SignalStackLayout.Geometry geometry()',
              '@Override public void draw(','void drawBadge(','boolean iosStyle()','boolean unavailable(', 'boolean artworkReady()']
if 'void refuse(String reason)' in drawing:draw_methods.append('void refuse(String reason)')

HARNESS=r'''package ls.augment.com.hook;
import java.util.*;import java.lang.ref.WeakReference;import ls.augment.com.*;import android.graphics.Canvas;import android.telephony.SubscriptionManager;
public final class TestDualSlot {
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 public static class View {
  static final int VISIBLE=0,LAYOUT_DIRECTION_RTL=1;public int subId;int visibility=0;View parent;int width=65;float transition=1;
  LayoutParams params=new LayoutParams();Map<String,View> children=new HashMap<>();Resources resources=new Resources();Observer observer=new Observer();Overlay overlay=new Overlay();
  public int getSubId(){return subId;}int getVisibility(){return visibility;}Object getParent(){return parent;}Object getContext(){return this;}
  int getLayoutDirection(){return 0;}Display getDisplay(){return new Display();}Resources getResources(){return resources;}
  float getTransitionAlpha(){return transition;}void setTransitionAlpha(float value){transition=value;}LayoutParams getLayoutParams(){return params;}
  int getMinimumWidth(){return 0;}int getMeasuredWidth(){return width;}Observer getViewTreeObserver(){return observer;}Overlay getOverlay(){return overlay;}
  Object getDrawable(){return new Object();}
  void invalidate(){}
 }
 static class LayoutParams{int width=65;}static class Display{int getDisplayId(){return 0;}int getRotation(){return 0;}}
 static class Resources{Metrics getDisplayMetrics(){return new Metrics();}Configuration getConfiguration(){return new Configuration();}}
 static class Metrics{float density=1;}static class Configuration{float fontScale=1;}
 static class Overlay{void add(Object item){}void remove(Object item){}}
 static class ViewTreeObserver{interface OnGlobalLayoutListener{void onGlobalLayout();}void addOnGlobalLayoutListener(OnGlobalLayoutListener listener){}}
 static class Observer extends ViewTreeObserver{void addOnGlobalLayoutListener(OnGlobalLayoutListener listener){}boolean isAlive(){return true;}void removeOnGlobalLayoutListener(OnGlobalLayoutListener listener){}}
 static class Drawable{public void draw(Canvas canvas){}}
 static class RootState{SignalPair pair;ConnectivityIconSource signalSource;int forced;void refresh(boolean force){if(force)forced++;}}static Map<View,RootState> ROOTS=new HashMap<>();
 static class Main{void post(Runnable callback){callback.run();}}static Main MAIN=new Main();
 static class SystemClock{static long elapsedRealtime(){return 1000;}}
 static class DualSignalTint{static void watch(View owner,View signal){}static void unwatch(View owner){}static Integer color(View owner,View signal){return 0xff123456;}}
 static class RedMagicLegacyUiHook{static boolean positionSizeOnly(Object context){return false;}}
 static class SignalTypeBadge{float ratio=.5f;float aspect(){return ratio;}void draw(Canvas c,float x,float y,float w,float h,int color){}}
 static class FeatureSettings{
  static StatusBarIconSpacingSpec spacing=StatusBarIconSpacingSpec.empty();
  static String style="0";
  static ConfigSnapshot snapshot(Object context){return ConfigSnapshot.create(1,1,Map.of(StatusBarIconSpacingSpec.KEY,spacing.serialize(),ConfigSchema.SYSTEMUI_MASTER,"1",SystemUiOptions.SIGNAL_DUAL_STYLE,style));}
  static boolean enabled(Object context,String key){return true;}
 }
 static class StatusBarAssetsHook{
  static String surfaceFor(View owner){return "main";}static boolean virtualWholeReady(View owner,String key){return false;}static boolean isHidden(View owner,String key){return false;}
  static boolean drawLayer(View owner,Canvas c,String id,String layer,float l,float t,float r,float b,int color){return false;}
  static boolean drawLayer(View owner,View nativeSource,Canvas c,String id,String layer,float l,float t,float r,float b,int color,boolean... fit){
   c.sources.put(id,nativeSource==null?-1:nativeSource.subId);return false;
  }
 }
 static View find(View view,String name){return view==null?null:view.children.get(name);}
 static Object field(Object owner,String name){return owner instanceof View?((View)owner).subId:null;}
 // SLOT
 static class ConnectivityIconSource{ConnectivityIconState state;ConnectivityIconSource(ConnectivityIconState value){state=value;}}
 static class SignalPair{
  // PAIR_FIELDS
  // PAIR_METHODS
  void restore(){restore("disabled");}void restore(String reason){closed=true;releaseOwner(one);releaseOwner(two);}
 }
 static class SignalDrawable extends Drawable{
  // DRAW_FIELDS
  // DRAW_METHODS
  SignalStackLayout.Geometry nativeGeometry(){return iosStyle()?SignalStackLayout.ios(0,0,18,24,65,42,otherOwner==null)
    :otherOwner==null?SignalStackLayout.compactSingle(0,0,18,24,65,42):SignalStackLayout.compact(0,0,18,24,65,42,1);}
  int tint(){return DualSignalTint.color(owner,position);}
 }
 static ConnectivityIconState.Sim sim(int id,int slot,int level,int bars,int activity){return new ConnectivityIconState.Sim(id,slot,level,bars,true,true,false,true,true,activity,true,13);}
 static ConnectivityIconState state(int active,int preferred,List<ConnectivityIconState.Sim> sims){return new ConnectivityIconState(70,ConnectivityIconState.PowerState.NONE,true,false,0,false,active,preferred,sims);}
 static ConnectivityIconState radios(int active){return state(active,active==2?1:2,List.of(sim(1,1,2,4,2),sim(2,0,4,5,1)));}
 static View mobile(int id){View owner=new View();owner.subId=id;for(String name:new String[]{"mobile_signal","mobile_type","mobile_roaming","mobile_volte"}){View child=new View();child.subId=id;child.parent=owner;owner.children.put(name,child);}return owner;}
 static SignalPair selected(List<View> mobiles,ConnectivityIconSource source){
  SubscriptionManager.slots.clear();for(ConnectivityIconState.Sim sim:source.state.sims)SubscriptionManager.slots.put(sim.subscriptionId,sim.slot);
  // SELECT
  return one==null?null:SignalPair.create(one,two,source);
 }
 static SignalPair pair(int active,boolean reverse){View one=mobile(2),two=mobile(1);View root=new View();one.parent=root;two.parent=root;return selected(reverse?List.of(two,one):List.of(one,two),new ConnectivityIconSource(radios(active)));}
 static void owners(SignalPair pair){check(pair!=null&&pair.anchor.subId==2&&pair.collapsed.subId==1,"constructor pins physical SIM1/sub2 above SIM2/sub1");}
 static void constructor(){for(int active:new int[]{2,1})for(boolean reverse:new boolean[]{false,true})owners(pair(active,reverse));}
 static void input(){SignalPair p=pair(2,true);String before=p.drawable.planInputs();p.drawable.source.state=radios(1);check(!before.equals(p.drawable.planInputs()),"active subscription changes real plan inputs without re-pairing");}
 static void switched(){SignalPair p=pair(2,true);for(int active:new int[]{2,1,2}){p.drawable.source.state=radios(active);check(p.matches(p.one,p.two,p.drawable.source),"data switch keeps the same native physical pair");owners(p);}}
 static void layout(){for(int initial:new int[]{2,1})for(boolean reverse:new boolean[]{false,true}){
  SignalPair p=pair(initial,reverse);p.drawable.activity=true;p.drawable.readyToDraw=true;
  for(int active:new int[]{2,1,2}){
   p.drawable.source.state=radios(active);DualSignalLayout result=p.drawable.layout(p.drawable.geometry());int row=active==2?0:1;
   check(result!=null&&result.plan.rows[0].slot==0&&result.plan.rows[1].slot==1,"real layout keeps physical rowSlots [0,1]");
   Canvas canvas=new Canvas();p.drawable.draw(canvas);
   check(canvas.activeRow==row&&canvas.activity==(active==2?1:2),"real draw routes the active subscription's direction to its fixed row");
   check(canvas.first==4&&canvas.second==2&&canvas.firstBars==5&&canvas.secondBars==4,"signals retain independent physical levels and bar counts");
   check(canvas.color==0xff123456,"switching data leaves native tint input intact");
   check(canvas.sources.get("mobile1.signal")==2&&canvas.sources.get("mobile2.signal")==1,"artwork routing keeps physical source identity");
   check(canvas.sources.get("mobile1.type")==2&&canvas.sources.get("mobile2.type")==1,"badge source identities never swap with data role");
   DualSignalSpacingObservation observed=p.observation("ok");check(Arrays.equals(observed.rowSlots,new int[]{0,1})&&observed.activityRow==row,"runtime spacing observation matches the same layout/draw identities");
  }
 }}
 static void events(){
  View sim1=mobile(2),sim2=mobile(1);ConnectivityIconSource source=new ConnectivityIconSource(state(1,2,List.of(sim(2,0,4,5,1))));
  SignalPair one=selected(List.of(sim2,sim1),source);one.drawable.activity=true;
  DualSignalLayout single=one.drawable.layout(one.drawable.geometry());check(single.plan.rows.length==1&&single.plan.rows[0].slot==0&&single.plan.rows[0].signal.y==0,"removing SIM2 makes a true single row without an empty upper row");
  check(Math.abs(single.height-single.plan.rows[0].signal.height)<.001,"single allocation consumes exactly one row height");
  one.drawable.readyToDraw=true;Canvas absent=new Canvas();one.drawable.draw(absent);check(absent.activeRow==-1&&absent.activity==0,"absent active subscription cannot inherit another SIM's arrow");
  source.state=radios(1);check(!one.matches(sim1,sim2,source),"native reinsertion changes physical pair membership");
  check(selected(List.of(sim2,sim1),source)==null,"second pair stole an unreleased native owner");one.restore();
  SignalPair restored=selected(List.of(sim2,sim1),source);owners(restored);
  View replacement=mobile(3);source.state=state(1,3,List.of(sim(1,1,2,4,2),sim(3,0,4,5,1)));restored.restore();SignalPair inserted=selected(List.of(sim2,replacement),source);
  check(inserted.anchor==replacement&&inserted.drawable.layout(inserted.drawable.geometry()).plan.rows[0].slot==0,"a new subscription in SIM1 keeps its physical row after reinsertion");
  source.state=state(1,2,List.of(sim(1,1,2,4,3)));inserted.restore();SignalPair only2=selected(List.of(sim2),source);only2.drawable.activity=true;
  check(only2.drawable.layout(only2.drawable.geometry()).plan.rows[0].slot==1,"single SIM2 keeps physical slot identity");
  source.state=state(-1,1,List.of(sim(1,1,2,4,3)));only2.drawable.readyToDraw=true;Canvas unknown=new Canvas();only2.drawable.draw(unknown);check(unknown.activeRow==-1&&unknown.activity==0,"unknown active does not use the preferred subscription for arrows");
  source.state=state(2,1,List.of(sim(2,-1,4,5,3)));check(selected(List.of(sim1),source)==null,"native unknown slot cannot borrow SIM1's row");
  SignalPair duplicate=pair(2,false);duplicate.drawable.source.state=state(2,1,List.of(sim(2,0,4,5,1),sim(1,0,2,4,2)));
  check(duplicate.drawable.layout(duplicate.drawable.geometry())==null,"duplicate physical slots decline virtual layout");
  FeatureSettings.spacing=StatusBarIconSpacingSpec.empty().with("main","mobile1.signal",new StatusBarIconSpacingSpec.Insets(1,2,3,4)).with("main","mobile2.signal",new StatusBarIconSpacingSpec.Insets(4,3,2,1));
  SignalPair spaced=pair(2,true);spaced.drawable.activity=true;DualSignalLayout before=spaced.drawable.layout(spaced.drawable.geometry());spaced.drawable.source.state=radios(1);DualSignalLayout after=spaced.drawable.layout(spaced.drawable.geometry());
  for(int i=0;i<2;i++){check(before.plan.rows[i].signal.x==after.plan.rows[i].signal.x&&before.plan.rows[i].signal.y==after.plan.rows[i].signal.y,"per-slot spacing does not move with the data role");}
  DualSignalSpacingObservation missingTint=DualSignalSpacingObservation.parse(spaced.observation("tint_unknown").serialize());
  check(missingTint!=null&&missingTint.reason.equals("tint_unknown")&&!missingTint.accepts(FeatureSettings.spacing),"unknown native tint diagnostics parse but cannot claim a usable spacing allocation");
  FeatureSettings.spacing=StatusBarIconSpacingSpec.empty();
 }
 static void ios(){
  FeatureSettings.style="1";
  SignalPair p=pair(2,true);p.drawable.activity=true;p.drawable.readyToDraw=true;
  Canvas dual=new Canvas();p.drawable.draw(dual);
  DualSignalLayout measured=p.drawable.layout(p.drawable.geometry());
  check(measured.ios&&Math.abs(measured.plan.rows[0].signal.width/measured.plan.rows[0].signal.height-47f/26f)<.001,"iOS runtime uses the dual source's upper bars rather than repeating a single-row glyph");
  check(Math.abs(measured.plan.rows[1].signal.width/measured.plan.rows[1].signal.height-47f/9f)<.001,"lower SIM uses the distinct short-dot source crop");
  check(Math.abs(measured.height-24)<.001,"iOS pair keeps actual native glyph height");
  DualSignalSpacingObservation published=p.observation("ok"),decoded=DualSignalSpacingObservation.parse(published.serialize());
  check(decoded!=null&&decoded.ios&&published.serialize().startsWith("DSS2;"),"spacing observations preserve the active iOS geometry through export and decode");
  DualSignalLayout decodedPlan=decoded.plan(StatusBarIconSpacingSpec.empty());
  check(Math.abs(decodedPlan.width-measured.width)<.001&&Math.abs(decodedPlan.height-measured.height)<.001,"spacing validation measures the same complete iOS cells as runtime");
  String[] fields=published.serialize().split(";",-1);fields[0]="DSS1";String old=String.join(";",java.util.Arrays.copyOf(fields,15))+";"+fields[16];
  DualSignalSpacingObservation legacy=DualSignalSpacingObservation.parse(old);
  check(legacy!=null&&!legacy.ios,"previous DSS1 observations still decode with their original Honor proportions");
  fields[0]="DSS2";fields[15]="2";check(DualSignalSpacingObservation.parse(String.join(";",fields))==null,"invalid style flags cannot authorize spacing");
  check(dual.iosNames.equals(List.of("dual/stat_sys_signal_3_darkmode.png","dual/stat_sys_signal_2_darkmode.png")),"iOS dual assets receive each physical SIM's independent native scale");
  check(dual.iosRows.equals(List.of(0,1))&&dual.iosSingles.equals(List.of(false,false)),"two physical SIMs choose upper and lower crops of the dual artwork");
  check(dual.iosLevels.equals(List.of(4,2)),"artwork does not fabricate equal SIM levels");
  p.drawable.source.state=radios(1);Canvas switched=new Canvas();p.drawable.draw(switched);
  check(switched.iosNames.equals(dual.iosNames)&&switched.activeRow==1,"data switch changes only activity ownership, not iOS artwork order");
  String iosInput=p.drawable.planInputs();FeatureSettings.style="0";check(!iosInput.equals(p.drawable.planInputs()),"style change is a runtime plan input");
  Canvas honor=new Canvas();p.drawable.draw(honor);check(honor.iosNames.isEmpty(),"returning to Honor releases iOS painter immediately");
  FeatureSettings.style="1";View mobile=mobile(1);ConnectivityIconSource only2=new ConnectivityIconSource(state(1,1,List.of(sim(1,1,2,4,3))));
  SignalPair single=selected(List.of(mobile),only2);single.drawable.readyToDraw=true;Canvas one=new Canvas();single.drawable.draw(one);
  check(one.iosNames.size()==1&&single.drawable.layout(single.drawable.geometry()).plan.rows.length==1,"iOS single SIM uses exactly one PNG and one real row");
  check(one.iosSingles.equals(List.of(true))&&!one.iosNames.get(0).startsWith("dual/"),"a lone SIM2 still uses the original single-row material");
  check(single.drawable.layout(single.drawable.geometry()).plan.rows[0].signal.y==0,"iOS single row has no empty upper row");
  check(Math.abs(single.drawable.layout(single.drawable.geometry()).height-24)<.001,"single iOS SIM preserves native glyph height independently of the dual frame");
  ConnectivityIconState.Sim unavailable=new ConnectivityIconState.Sim(1,1,0,4,true,false,false,true,false,0,true,0);
  only2.state=state(1,1,List.of(unavailable));Canvas noService=new Canvas();single.drawable.draw(noService);
  check(noService.iosNames.equals(List.of("stat_sys_signal_null_darkmode.png")),"known no-service SIM uses the supplied X glyph, never fake signal");
  only2.state=state(1,1,List.of(new ConnectivityIconState.Sim(1,1,-1,4)));Canvas unknown=new Canvas();single.drawable.draw(unknown);
  check(unknown.iosNames.equals(List.of("stat_sys_signal_null_darkmode.png")),"unknown level uses the unavailable artwork");
  IosSignalAssets.available=false;check(!single.canDraw(),"loading or failed iOS artwork retains the native signal presentation");IosSignalAssets.available=true;
  RootState root=new RootState();root.signalSource=only2;ROOTS.put(mobile,root);single.drawable.artworkInvalidated.run();
  check(root.forced==1,"ready callback forces a live source retry even when loading had cleared its pair");ROOTS.clear();
  FeatureSettings.style="0";
 }
 static void badgeCapacity(){for(String style:new String[]{"0","1"}){
  FeatureSettings.style=style;SignalPair p=pair(2,false);p.drawable.activity=true;
  p.drawable.firstType.ratio=p.drawable.secondType.ratio=1.5f;p.drawable.firstRoaming.ratio=.65f;p.drawable.firstHd.ratio=1.5f;
  p.drawable.secondRoaming.ratio=p.drawable.secondHd.ratio=0;
  var geometry=p.drawable.geometry();var plan=p.drawable.layout(geometry);var upper=plan.plan.rows[0].badges[0];var lower=plan.plan.rows[1].badges[0];
  check(Math.abs(upper.width-lower.width)<.001&&Math.abs(upper.height-lower.height)<.001,"runtime plan still squeezes one SIM's type label");
  int[] required=DualSignalSpacingObservation.rounded(geometry.left,geometry.top,plan.width,plan.height);
  p.budgetWidth=required[0];p.budgetHeight=required[1];var observation=p.observation("ok");var decoded=DualSignalSpacingObservation.parse(observation.serialize());
  check(decoded!=null&&decoded.accepts(StatusBarIconSpacingSpec.empty()),"expanded native badges no longer fit their exact measured budget");
  check(Arrays.equals(required,decoded.required(StatusBarIconSpacingSpec.empty())),"settings/runtime/export measure different badge columns");
  p.budgetWidth--;check(!p.observation("ok").accepts(StatusBarIconSpacingSpec.empty()),"insufficient width silently shrinks type labels or bypasses capacity");
  p.restore();
 }FeatureSettings.style="0";}
 public static void main(String[] args){for(String name:args[0].equals("all")?new String[]{"constructor","switch","layout","input","events","ios","badge_capacity"}:args)switch(name){
  case "constructor":constructor();break;case "switch":switched();break;case "layout":layout();break;case "input":input();break;case "events":events();break;
  case "ios":ios();break;
  case "badge_capacity":badgeCapacity();break;
  default:throw new IllegalArgumentException(name);
 }System.out.println("PASS production SIM slot identity: "+checks+" assertions");}
}'''
HARNESS=HARNESS.replace('// SLOT',adapt(method(source,'private static int slot(')))
HARNESS=HARNESS.replace('// SELECT',source[select_start:select_end])
HARNESS=HARNESS.replace('// PAIR_FIELDS',adapt(pair_fields)).replace('// PAIR_METHODS',adapt('\n'.join(method(pair,m) for m in pair_methods)))
HARNESS=HARNESS.replace('// DRAW_FIELDS',adapt(draw_fields)).replace('// DRAW_METHODS',adapt('\n'.join(method(drawing,m) for m in draw_methods)))
FILES={
 'ls/augment/com/hook/TestDualSlot.java':HARNESS,
 'ls/augment/com/BuildConfig.java':'package ls.augment.com;public class BuildConfig{public static final int VERSION_CODE=20528;}',
 'android/telephony/SubscriptionManager.java':'package android.telephony;public class SubscriptionManager{public static java.util.Map<Integer,Integer> slots=new java.util.HashMap<>();public static int getSlotIndex(int id){return slots.getOrDefault(id,-1);}}',
 'android/graphics/Canvas.java':'''package android.graphics;public class Canvas{public int activeRow,activity,first,second,firstBars,secondBars,color;public java.util.List<String> iosNames=new java.util.ArrayList<>();public java.util.List<Integer> iosLevels=new java.util.ArrayList<>(),iosRows=new java.util.ArrayList<>();public java.util.List<Boolean> iosSingles=new java.util.ArrayList<>();public java.util.Map<String,Integer> sources=new java.util.HashMap<>();}''',
 'ls/augment/com/IosSignalAssets.java':'''package ls.augment.com;public class IosSignalAssets{public static boolean available=true;public static boolean ready(Object context,String name,Runnable invalidated){return available;}}''',
 'ls/augment/com/IosSignalPainter.java':'''package ls.augment.com;public class IosSignalPainter{public boolean drawRow(Object context,android.graphics.Canvas canvas,float l,float t,float r,float b,int level,int bars,boolean unavailable,int color,int row,boolean single,Runnable invalidated){canvas.iosNames.add(IosSignalPolicy.filename(level,bars,unavailable,color,single));canvas.iosLevels.add(level);canvas.iosRows.add(row);canvas.iosSingles.add(single);return IosSignalAssets.available;}}''',
 'ls/augment/com/DualSignalPainter.java':'''package ls.augment.com;import android.graphics.Canvas;public class DualSignalPainter{
  private ArtworkLayers artwork;public void setArtwork(ArtworkLayers value){artwork=value;}
  public interface Badges{void draw(Canvas c,int row,int badge,DualSignalLayout.Box box,int color);}
  public void drawSpaced(Canvas c,float x,float y,DualSignalLayout layout,int first,int second,int firstBars,int secondBars,int color,int activity,int activeRow,Badges badges){
   c.activeRow=activeRow;c.activity=activity;c.first=first;c.second=second;c.firstBars=firstBars;c.secondBars=secondBars;c.color=color;
   for(int i=0;i<layout.plan.rows.length;i++){DualSignalLayout.Box b=layout.plan.rows[i].signal;artwork.draw(c,"row"+i+".signal","whole",b.x,b.y,b.x+b.width,b.y+b.height,color);for(int badge=0;badge<3;badge++)if(layout.plan.rows[i].badges[badge]!=null)badges.draw(c,i,badge,layout.plan.rows[i].badges[badge],color);}
   if(activeRow>=0&&activity>=1&&activity<=3){DualSignalLayout.Box b=layout.plan.rows[activeRow].activity;artwork.draw(c,activity==1?"data.activity_in":"data.activity_out","whole",b.x,b.y,b.x+b.width,b.y+b.height,color);}
  }
 }'''
}
with tempfile.TemporaryDirectory(prefix='duo-sim-slot-identity-') as folder:
    folder=Path(folder);sources=[]
    for name,code in FILES.items():
        path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,encoding='utf-8');sources.append(str(path))
    sources.extend(str(base/'ls/augment/com'/name) for name in ['ConnectivityIconState.java','DualSignalLayout.java','ArtworkLayers.java','DualSignalSpacingObservation.java','IosSignalPolicy.java'])
    sources.append(str(base/'ls/augment/com/hook/SignalStackLayout.java'))
    if args.case=='all':sources.append(str(ROOT/'tools/TestConnectivityIconState.java'))
    subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-sourcepath',str(base),'-d',str(folder),*sources],check=True)
    if args.case=='all':subprocess.run([str(JAVA/'java.exe'),'-cp',str(folder),'TestConnectivityIconState'],check=True)
    subprocess.run([str(JAVA/'java.exe'),'-cp',str(folder),'ls.augment.com.hook.TestDualSlot',args.case],check=True)
