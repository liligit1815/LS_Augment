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
parser.add_argument('--case',choices=['constructor','switch','layout','input','events','all'],default='all')
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
              'private static boolean visibleWithin(','private static Object subscription(',
              'ls.augment.com.DualSignalSpacingObservation observation(']
draw_methods=['ls.augment.com.ConnectivityIconState.Sim rowSim(',
              'ls.augment.com.DualSignalLayout layout(','float[] badgeAspects(',
              'float badgeAspect(','String planInputs()','void refuseIdentity()',
              'SignalDrawable(View owner,','SignalStackLayout.Geometry geometry()',
              '@Override public void draw(','void drawBadge(']
if 'void refuse(String reason)' in drawing:draw_methods.append('void refuse(String reason)')

HARNESS=r'''package ls.augment.com.hook;
import java.util.*;import ls.augment.com.*;import android.graphics.Canvas;import android.telephony.SubscriptionManager;
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
 }
 static class LayoutParams{int width=65;}static class Display{int getDisplayId(){return 0;}int getRotation(){return 0;}}
 static class Resources{Metrics getDisplayMetrics(){return new Metrics();}Configuration getConfiguration(){return new Configuration();}}
 static class Metrics{float density=1;}static class Configuration{float fontScale=1;}
 static class Overlay{void add(Object item){}void remove(Object item){}}
 static class ViewTreeObserver{interface OnGlobalLayoutListener{void onGlobalLayout();}void addOnGlobalLayoutListener(OnGlobalLayoutListener listener){}}
 static class Observer extends ViewTreeObserver{void addOnGlobalLayoutListener(OnGlobalLayoutListener listener){}boolean isAlive(){return true;}void removeOnGlobalLayoutListener(OnGlobalLayoutListener listener){}}
 static class Drawable{public void draw(Canvas canvas){}}
 static class RootState{SignalPair pair;}static Map<View,RootState> ROOTS=new HashMap<>();
 static class Main{void post(Runnable callback){callback.run();}}static Main MAIN=new Main();
 static class SystemClock{static long elapsedRealtime(){return 1000;}}
 static class DualSignalTint{static void watch(View owner,View signal){}static void unwatch(View owner){}static Integer color(View owner,View signal){return 0xff123456;}}
 static class RedMagicLegacyUiHook{static boolean positionSizeOnly(Object context){return false;}}
 static class SignalTypeBadge{float aspect(){return .5f;}void draw(Canvas c,float x,float y,float w,float h,int color){}}
 static class FeatureSettings{
  static StatusBarIconSpacingSpec spacing=StatusBarIconSpacingSpec.empty();
  static ConfigSnapshot snapshot(Object context){return ConfigSnapshot.create(1,1,Map.of(StatusBarIconSpacingSpec.KEY,spacing.serialize(),ConfigSchema.SYSTEMUI_MASTER,"1"));}
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
  void restore(){restore("disabled");}void restore(String reason){closed=true;}
 }
 static class SignalDrawable extends Drawable{
  // DRAW_FIELDS
  // DRAW_METHODS
  SignalStackLayout.Geometry nativeGeometry(){return SignalStackLayout.compact(0,0,65,42,65,42,1);}
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
  DualSignalLayout single=one.drawable.layout(one.drawable.geometry());check(single.plan.rows.length==1&&single.plan.rows[0].slot==0&&single.plan.rows[0].signal.y>0,"removing SIM2 keeps single SIM1 in the legacy lower row");
  one.drawable.readyToDraw=true;Canvas absent=new Canvas();one.drawable.draw(absent);check(absent.activeRow==-1&&absent.activity==0,"absent active subscription cannot inherit another SIM's arrow");
  source.state=radios(1);check(!one.matches(sim1,sim2,source),"native reinsertion changes physical pair membership");SignalPair restored=selected(List.of(sim2,sim1),source);owners(restored);
  View replacement=mobile(3);source.state=state(1,3,List.of(sim(1,1,2,4,2),sim(3,0,4,5,1)));SignalPair inserted=selected(List.of(sim2,replacement),source);
  check(inserted.anchor==replacement&&inserted.drawable.layout(inserted.drawable.geometry()).plan.rows[0].slot==0,"a new subscription in SIM1 keeps its physical row after reinsertion");
  source.state=state(1,2,List.of(sim(1,1,2,4,3)));SignalPair only2=selected(List.of(sim2),source);only2.drawable.activity=true;
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
 public static void main(String[] args){for(String name:args[0].equals("all")?new String[]{"constructor","switch","layout","input","events"}:args)switch(name){
  case "constructor":constructor();break;case "switch":switched();break;case "layout":layout();break;case "input":input();break;case "events":events();break;
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
 'android/graphics/Canvas.java':'''package android.graphics;public class Canvas{public int activeRow,activity,first,second,firstBars,secondBars,color;public java.util.Map<String,Integer> sources=new java.util.HashMap<>();}''',
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
    sources.extend(str(base/'ls/augment/com'/name) for name in ['ConnectivityIconState.java','DualSignalLayout.java','ArtworkLayers.java','DualSignalSpacingObservation.java'])
    sources.append(str(base/'ls/augment/com/hook/SignalStackLayout.java'))
    if args.case=='all':sources.append(str(ROOT/'tools/TestConnectivityIconState.java'))
    subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-sourcepath',str(base),'-d',str(folder),*sources],check=True)
    if args.case=='all':subprocess.run([str(JAVA/'java.exe'),'-cp',str(folder),'TestConnectivityIconState'],check=True)
    subprocess.run([str(JAVA/'java.exe'),'-cp',str(folder),'ls.augment.com.hook.TestDualSlot',args.case],check=True)
