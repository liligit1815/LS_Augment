"""Execute production pager and Activity navigation binding at controlled UI boundaries."""
from pathlib import Path
import runpy
import subprocess
import tempfile
BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-quick-apps.py')))
AMAP = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-amap-hook.py')))
SRC, SUPPORT, member = BASE['SRC'], BASE['SUPPORT'], BASE['member']
SOURCES = dict(BASE['SOURCES'])
SOURCES['android/os/Bundle.java'] = AMAP['SOURCES']['android/os/Bundle.java']
SOURCES['android/os/IBinder.java'] = 'package android.os;public interface IBinder {}'
SOURCES['android/content/Context.java'] = '''package android.content;public class Context {
 public android.content.res.Resources getResources(){return new android.content.res.Resources();}}'''
SOURCES['android/content/res/Resources.java'] = '''package android.content.res;public class Resources {
 public static class Metrics {public float density=1;}public Metrics getDisplayMetrics(){return new Metrics();}}'''
SOURCES['android/view/ViewParent.java'] = 'package android.view;public interface ViewParent {void requestDisallowInterceptTouchEvent(boolean value);}'
SOURCES['android/view/View.java'] = SOURCES['android/view/View.java'].replace('IMPORTANT_FOR_ACCESSIBILITY_NO=2', 'IMPORTANT_FOR_ACCESSIBILITY_NO=2,IMPORTANT_FOR_ACCESSIBILITY_YES=1').replace('public View(Context context){}', '''public View(Context context){}public ViewParent parent=value->{};
 public ViewParent getParent(){return parent;}public boolean onTouchEvent(MotionEvent event){return false;}
 public boolean performClick(){if(click==null)return false;click.onClick(this);return true;}
 public void onInitializeAccessibilityNodeInfo(android.view.accessibility.AccessibilityNodeInfo info){}
 public boolean performAccessibilityAction(int action,android.os.Bundle args){return false;}''')
SOURCES['android/view/View.java'] = SOURCES['android/view/View.java'].replace('public void setPadding(int l,int t,int r,int b){}', 'public int paddingTop,paddingBottom;public void setPadding(int l,int t,int r,int b){paddingTop=t;paddingBottom=b;}')
SOURCES['android/widget/LinearLayout.java'] = SOURCES['android/widget/LinearLayout.java'].replace('public void setOrientation', 'public boolean onInterceptTouchEvent(android.view.MotionEvent event){return false;}public void setOrientation')
SOURCES['android/view/ViewGroup.java'] = 'package android.view;public class ViewGroup extends View implements ViewParent {public ViewGroup(android.content.Context c){super(c);}public void requestDisallowInterceptTouchEvent(boolean v){}}'
SOURCES['android/widget/LinearLayout.java'] = SOURCES['android/widget/LinearLayout.java'].replace('extends View {','extends android.view.ViewGroup {').replace('public void removeAllViews()', 'public void removeView(View view){children.remove(view);}public void removeAllViews()')
SOURCES['android/view/ViewConfiguration.java'] = '''package android.view;public class ViewConfiguration {
 public static ViewConfiguration get(android.content.Context c){return new ViewConfiguration();}public int getScaledTouchSlop(){return 8;}}'''
SOURCES['android/view/MotionEvent.java'] = '''package android.view;public class MotionEvent {
 public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;
 final int action,count,id;final float x,y;public MotionEvent(int a,float x,float y){this(a,x,y,1,7);}
 public MotionEvent(int a,float x,float y,int count,int id){action=a;this.x=x;this.y=y;this.count=count;this.id=id;}
 public int getActionMasked(){return action;}public int getPointerCount(){return count;}public int getPointerId(int i){return id;}
 public float getX(){return x;}public float getY(){return y;}}'''
SOURCES['android/view/accessibility/AccessibilityNodeInfo.java'] = '''package android.view.accessibility;public class AccessibilityNodeInfo {
 public static final int ACTION_SCROLL_FORWARD=4096,ACTION_SCROLL_BACKWARD=8192;public boolean scrollable;public Object action;
 public static class AccessibilityAction {public static final Object ACTION_SCROLL_FORWARD=new Object(),ACTION_SCROLL_BACKWARD=new Object();}
 public void setScrollable(boolean value){scrollable=value;}public void addAction(Object value){action=value;}}'''
SOURCES['android/os/Handler.java'] = 'package android.os;public class Handler {public int removed;public void removeCallbacks(Runnable r){removed++;}}'
SOURCES['android/widget/TextView.java'] = SOURCES['android/widget/TextView.java'].replace('value.toString()', 'value == null ? "" : value.toString()')
SOURCES['android/widget/TextView.java'] = SOURCES['android/widget/TextView.java'].replace('public String text="";', 'public String text="";public float textSize;public int textColor;public void setTextSize(float v){textSize=v;}public void setTextColor(int v){textColor=v;}')
SOURCES['ls/augment/com/UiKit.java'] = SOURCES['ls/augment/com/UiKit.java'].replace('int text=1,accent=2', 'int muted=5,text=1,accent=2').replace('int dp(int value)', 'static float compactTextSize(float value){return Math.max(10f,value*.86f);}int dp(int value)')
SOURCES['ls/augment/com/GlassIcon.java'] = 'package ls.augment.com;final class GlassIcon extends android.graphics.drawable.Drawable {final String kind;final int color;GlassIcon(String k,int c){kind=k;color=c;}}'
SOURCES['ls/augment/com/LiquidGlassLayout.java'] = 'package ls.augment.com;final class LiquidGlassLayout extends android.widget.LinearLayout {int tint;LiquidGlassLayout(android.content.Context c){super(c);}void setSurfaceTint(int v){tint=v;}}'
SOURCES['android/widget/ImageView.java'] = SOURCES['android/widget/ImageView.java'].replace('public void setImageDrawable(Object value){}', 'public Object image;public void setImageDrawable(Object value){image=value;}')
HEAD = r'''package ls.augment.com;
import android.content.*;import android.os.*;import android.view.*;import android.view.accessibility.*;import android.widget.*;
final class CardHarness extends Context {
 static class AtomicWorkbenchClient {int stopped;void stopNavigation(){stopped++;}}AtomicWorkbenchClient client;
 static int cases,checks;static void yes(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static void test(String name,Runnable run){run.run();cases++;System.out.println("PASS production card: "+name);}
 final AtomicWorkbenchCardPager cardPager=new AtomicWorkbenchCardPager(this);
 final TextView navigationTitle=new TextView(this),navigationSubtitle=new TextView(this),cardPageHint=new TextView(this);
 final TextView navigationSpeed=new TextView(this),navigationRemaining=new TextView(this);
 final ImageView navigationIcon=new ImageView(this);final UiKit ui=new UiKit(this);
 final LinearLayout music=new LinearLayout(this),navigation=new LinearLayout(this);
 final LinearLayout navigationPage=navigation,navigationSpeedColumn=new LinearLayout(this),navigationMetricsColumn=new LinearLayout(this),mediaCard=new LiquidGlassLayout(this);
 final Handler main=new Handler();final Runnable mediaPoll=()->{};long mediaGeneration;Bundle lastMediaState;
 static class NotificationCards {void setActive(boolean value){}void apply(Bundle b,long n){}long beginUpdate(){return 1;}}NotificationCards notificationCards;
 boolean mediaAvailable,interactable=true;String mediaSessionId="",navigationPackage="",status="";int clicks,buttonUpdates,launches;
 final java.util.ArrayList<AtomicWorkbenchAppRepository.App> apps=new java.util.ArrayList<>();AtomicWorkbenchAppRepository.App launched;
 CardHarness(){cardPager.setPages(music,navigation,this::updateCardPageHint);cardPager.setOnClickListener(v->clicks++);}
 void updateMediaButtons(){buttonUpdates++;}
 boolean canInteract(){return interactable;}void showStatus(String value){status=value;}
 void launchApp(AtomicWorkbenchAppRepository.App app,int task){yes(task==-1,"navigation used original task takeover instead of normal window reuse");launched=app;launches++;}
 Bundle state(boolean active){Bundle b=new Bundle();b.putBoolean("available",true);b.putBoolean("active",active);b.putBoolean("has_session",active);b.putBoolean("has_guidance",active);b.putString("package",active?"com.autonavi.minimap":"");
 b.putString("title","private-current-route");b.putString("subtitle","200米后右转");b.putString("subtext","剩余8分钟");return b;}
 MotionEvent event(int a,float x,float y){return new MotionEvent(a,x,y);}
 Bundle fullMetrics(){Bundle b=new Bundle();b.putInt("eventType",1);b.putInt("curManeuverID",2);b.putDouble("segmentRemainDist",200);b.putDouble("speed",35);b.putDouble("routeRemainTime",1260);b.putDouble("routeRemainDist",8300);b.putString("curRouteName","人民路");b.putString("nextRouteName","前进路");return b;}
 Bundle structured(Bundle metrics){Bundle b=state(true);b.putBundle("metrics",metrics);b.putString("navigation_source","amap_memory_structured");return b;}
 void swipe(boolean left){cardPager.onInterceptTouchEvent(event(0,left?200:20,20));
 yes(cardPager.onInterceptTouchEvent(event(2,left?100:120,21)),"horizontal drag not intercepted");cardPager.onTouchEvent(event(1,left?20:200,21));}
'''
TEST = r'''
 public static void main(String[] args){
 test("authenticated navigation lifetime focuses once and refresh preserves manual choice",()->{CardHarness h=new CardHarness();Bundle state=h.state(true);state.putString("navigation_source_generation","a".repeat(33));h.applyNavigationState(state);yes(h.cardPager.pageId().equals("navigation"),"new true source did not focus");h.cardPager.selectPage("music");state.putString("title","普通更新的实际指引");h.applyNavigationState(state);yes(h.cardPager.pageId().equals("music"),"refresh stole manual selection");h.applyNavigationState(null);h.applyNavigationState(state);yes(h.cardPager.pageId().equals("music"),"transient reconnect repeated source focus");state.putString("navigation_source_generation","a".repeat(32)+"b");h.applyNavigationState(state);yes(h.cardPager.pageId().equals("navigation"),"new NMS lifetime not focused");});
 test("real active navigation enables exact text and second page",()->{
 CardHarness h=new CardHarness();yes(!h.cardPager.hasNavigation()&&h.cardPageHint.visibility==View.GONE,"empty navigation");h.applyNavigationState(h.state(true));
 yes(h.navigationTitle.text.equals("private-current-route")&&h.navigationSubtitle.text.equals("200米后右转\n剩余8分钟"),"text lost");
 yes(h.navigationPackage.equals("com.autonavi.minimap"),"verified map owner not retained for opening window");
 yes(h.cardPager.hasNavigation()&&h.cardPageHint.visibility==View.VISIBLE&&h.music.visibility==View.VISIBLE&&h.navigation.visibility==View.GONE,"initial page");});
 test("left navigation right music without click",()->{CardHarness h=new CardHarness();h.applyNavigationState(h.state(true));h.swipe(true);
 yes(h.cardPager.page()==1&&h.navigation.visibility==View.VISIBLE&&h.music.visibility==View.GONE&&h.clicks==0,"left");yes(h.cardPageHint.text.equals("○ ●"),"navigation dots");yes(h.cardPageHint.description.toString().equals("导航，第 2 页，共 2 页，右滑查看上一页"),"navigation accessible prompt");h.swipe(false);yes(h.cardPager.page()==0&&h.music.visibility==View.VISIBLE&&h.clicks==0,"right");yes(h.cardPageHint.text.equals("● ○"),"music dots");yes(h.cardPageHint.description.toString().equals("音乐，第 1 页，共 2 页，左滑查看下一页"),"music accessible prompt");});
 test("tap and short move preserve controls",()->{CardHarness h=new CardHarness();h.applyNavigationState(h.state(true));
 yes(!h.cardPager.onInterceptTouchEvent(h.event(0,100,20))&&!h.cardPager.onInterceptTouchEvent(h.event(2,104,22))&&!h.cardPager.onInterceptTouchEvent(h.event(1,104,22)),"tap intercepted");
 h.cardPager.onTouchEvent(h.event(0,100,20));h.cardPager.onTouchEvent(h.event(1,102,21));yes(h.clicks==1&&h.cardPager.page()==0,"retry click lost");});
 test("vertical cancel multitouch and pointer change cannot turn page",()->{CardHarness h=new CardHarness();h.applyNavigationState(h.state(true));h.cardPager.onInterceptTouchEvent(h.event(0,200,20));
 yes(!h.cardPager.onInterceptTouchEvent(h.event(2,180,100)),"vertical intercepted");h.cardPager.onTouchEvent(h.event(1,20,100));yes(h.cardPager.page()==0,"vertical flipped");
 h.cardPager.onInterceptTouchEvent(h.event(0,200,20));h.cardPager.onInterceptTouchEvent(h.event(2,100,20));h.cardPager.onTouchEvent(h.event(3,20,20));h.cardPager.onTouchEvent(h.event(1,20,20));yes(h.cardPager.page()==0,"cancel flipped");
 h.cardPager.onInterceptTouchEvent(h.event(0,200,20));h.cardPager.onInterceptTouchEvent(new MotionEvent(5,100,20,2,7));h.cardPager.onTouchEvent(h.event(1,20,20));yes(h.cardPager.page()==0,"multi flipped");
 h.cardPager.onInterceptTouchEvent(h.event(0,200,20));h.cardPager.onInterceptTouchEvent(new MotionEvent(2,100,20,1,8));h.cardPager.onTouchEvent(h.event(1,20,20));yes(h.cardPager.page()==0,"pointer bypass");});
 test("removal permission loss and stop clear stale route",()->{CardHarness h=new CardHarness();h.applyNavigationState(h.state(true));h.swipe(true);h.applyNavigationState(h.state(false));
 yes(h.cardPager.page()==0&&!h.cardPager.hasNavigation()&&h.navigationTitle.text.isEmpty()&&h.navigationSubtitle.text.isEmpty()&&h.navigationPackage.isEmpty()&&h.cardPageHint.visibility==View.GONE,"removed retained");
 h.applyNavigationState(h.state(true));Bundle denied=h.state(true);denied.putBoolean("available",false);h.applyNavigationState(denied);yes(!h.cardPager.hasNavigation()&&h.navigationTitle.text.isEmpty()&&h.navigationPackage.isEmpty(),"permission stale");
 h.applyNavigationState(h.state(true));h.swipe(true);h.client=new CardHarness.AtomicWorkbenchClient();h.stopMedia();yes(h.client.stopped==1,"stopping visible navigation kept the in-memory producer consumer active");yes(!h.cardPager.hasNavigation()&&h.cardPager.page()==0&&h.navigationTitle.text.isEmpty()&&h.navigationPackage.isEmpty()&&h.mediaGeneration==1&&h.main.removed==1,"stop stale");});
 test("detected session without route remains reachable with honest explanation",()->{CardHarness h=new CardHarness();Bundle b=h.state(false);b.putBoolean("has_session",true);b.putString("package","com.autonavi.minimap");b.putString("message","地图通知未提供转向指引，请查看地图窗口");h.applyNavigationState(b);
 yes(h.cardPager.hasNavigation()&&h.cardPageHint.visibility==View.VISIBLE&&h.cardPager.page()==0,"observed no_guidance session hidden or forced away from music");h.swipe(true);
 yes(h.navigationTitle.text.equals("导航进行中")&&h.navigationSubtitle.text.equals(b.getString("message"))&&!h.navigationSubtitle.text.contains("200米"),"missing guidance replaced with fictional route or unexplained placeholder");
 yes(h.navigationPackage.equals("com.autonavi.minimap"),"no_guidance map owner unavailable");});
 test("live guidance withdrawn clears route while navigation session stays reachable",()->{CardHarness h=new CardHarness();h.applyNavigationState(h.state(true));h.swipe(true);Bundle b=h.state(false);b.putBoolean("has_session",true);b.putString("package","com.autonavi.minimap");b.putString("message","地图通知未提供转向指引，请查看地图窗口");h.applyNavigationState(b);
 yes(h.cardPager.page()==1&&h.cardPager.hasNavigation()&&h.navigationTitle.text.equals("导航进行中")&&h.navigationSubtitle.text.equals(b.getString("message")),"same session update hid navigation or retained stale route");h.applyNavigationState(null);
 yes(h.cardPager.page()==0&&!h.cardPager.hasNavigation()&&h.navigationPackage.isEmpty()&&h.navigationTitle.text.isEmpty(),"expired generic session remained reachable");});
 test("legacy active replies without session flags still display real guidance",()->{CardHarness h=new CardHarness();Bundle b=new Bundle();b.putBoolean("available",true);b.putBoolean("active",true);b.putString("title","前方300米右转");h.applyNavigationState(b);
 yes(h.cardPager.hasNavigation()&&h.navigationTitle.text.equals("前方300米右转")&&h.navigationPackage.isEmpty(),"legacy real guidance rejected or fabricated owner");});
 test("navigation window action targets verified package through existing workspace launch",()->{CardHarness h=new CardHarness();AtomicWorkbenchAppRepository.App other=new AtomicWorkbenchAppRepository.App("com.autonavi.minimap.extra"),map=new AtomicWorkbenchAppRepository.App("com.autonavi.minimap");h.apps.add(other);h.apps.add(map);h.applyNavigationState(h.state(true));h.openNavigationWindow();
 yes(h.launches==1&&h.launched==map,"navigation opened wrong app or bypassed existing window launch");h.applyNavigationState(null);h.openNavigationWindow();yes(h.launches==1,"expired navigation kept stale launch target");});
 test("navigation window action honors interaction barriers and unavailable entry",()->{CardHarness h=new CardHarness();h.applyNavigationState(h.state(true));h.interactable=false;h.openNavigationWindow();yes(h.launches==0&&h.status.isEmpty(),"inactive workbench launched navigation");h.interactable=true;h.apps.add(new AtomicWorkbenchAppRepository.App("unrelated.map"));h.openNavigationWindow();
 yes(h.launches==0&&h.status.contains("未找到导航应用入口"),"unavailable map entry silently failed or launched unrelated app");});
 test("navigation ending during swipe cannot revive page",()->{CardHarness h=new CardHarness();h.applyNavigationState(h.state(true));h.cardPager.onInterceptTouchEvent(h.event(0,200,20));h.cardPager.onInterceptTouchEvent(h.event(2,100,20));h.applyNavigationState(null);h.cardPager.onTouchEvent(h.event(1,20,20));yes(h.cardPager.page()==0&&!h.cardPager.hasNavigation()&&h.clicks==0,"expired swipe");});
 test("accessibility pages require real navigation",()->{CardHarness h=new CardHarness();AccessibilityNodeInfo info=new AccessibilityNodeInfo();h.cardPager.onInitializeAccessibilityNodeInfo(info);yes(!info.scrollable&&!h.cardPager.performAccessibilityAction(4096,null),"fake page");h.applyNavigationState(h.state(true));yes(h.cardPager.performAccessibilityAction(4096,null)&&h.cardPager.page()==1,"forward");yes(h.cardPager.performAccessibilityAction(8192,null)&&h.cardPager.page()==0,"backward");});
 test("full current route binds real maneuver distance roads speed and remaining metrics",()->{CardHarness h=new CardHarness();Bundle b=h.structured(h.fullMetrics());h.applyNavigationState(b);h.swipe(true);
 yes(h.navigationTitle.text.equals("200 米")&&h.navigationSubtitle.text.equals("人民路 → 前进路"),"actual next turn distance/roads not bound");yes(h.navigationSpeed.text.equals("35")&&h.navigationSpeedColumn.visibility==View.VISIBLE,"real speed hidden or replaced");yes(h.navigationRemaining.text.equals("21 分钟 · 8.3 公里")&&h.navigationMetricsColumn.visibility==View.VISIBLE,"remaining time/distance units wrong");yes(((GlassIcon)h.navigationIcon.image).kind.equals("turn-left")&&((GlassIcon)h.navigationIcon.image).color==0xffffffff,"verified left maneuver did not use white common vector");yes(Math.abs(h.navigationTitle.textSize-21.5f)<.01f,"public typography applied twice or bypassed");yes(h.mediaCard.paddingTop==4&&h.mediaCard.paddingBottom==4,"navigation card keeps only compact vertical padding");yes(((LiquidGlassLayout)h.mediaCard).tint==0xe8101216&&h.cardPageHint.textColor==0xbfffffff,"reference navigation surface not dark");yes(h.navigationPage.description.toString().contains("速度 35 km/h")&&h.navigationPage.description.toString().contains("左转"),"metrics/direction inaccessible");h.swipe(false);yes(h.mediaCard.paddingTop==8&&h.mediaCard.paddingBottom==8,"navigation padding leaked into music card");yes(((LiquidGlassLayout)h.mediaCard).tint==0,"navigation tint leaked into music surface");});
 test("missing metrics are hidden while real zero remains visible",()->{CardHarness h=new CardHarness();Bundle road=new Bundle();road.putString("curRouteName","人民路");h.applyNavigationState(h.structured(road));yes(h.navigationTitle.text.equals("导航进行中")&&h.navigationSubtitle.text.equals("人民路"),"missing turn distance manufactured");yes(h.navigationSpeed.text.isEmpty()&&h.navigationSpeedColumn.visibility==View.GONE&&h.navigationRemaining.text.isEmpty()&&h.navigationMetricsColumn.visibility==View.GONE,"missing numbers defaulted to zero");Bundle zero=new Bundle();for(String key:new String[]{"speed","segmentRemainDist","routeRemainTime","routeRemainDist"})zero.putDouble(key,0);h.applyNavigationState(h.structured(zero));yes(h.navigationSpeed.text.equals("0")&&h.navigationSpeedColumn.visibility==View.VISIBLE&&h.navigationTitle.text.equals("0 米"),"actual stopped/zero-distance telemetry discarded");yes(h.navigationRemaining.text.equals("0 分钟 · 0 米"),"real zero time/distance invented as missing or one minute");});
 test("negative NaN wrong type and event-only metrics do not fabricate structured data",()->{CardHarness h=new CardHarness();Bundle b=new Bundle();b.putString("curRouteName","真实道路");b.putDouble("speed",Double.NaN);b.putDouble("segmentRemainDist",-1);b.putDouble("routeRemainDist",Double.POSITIVE_INFINITY);b.putString("routeRemainTime","200");h.applyNavigationState(h.structured(b));yes(h.navigationSpeed.text.isEmpty()&&h.navigationRemaining.text.isEmpty()&&h.navigationTitle.text.equals("导航进行中"),"invalid raw metrics became zero or current values");Bundle event=new Bundle();event.putInt("eventType",1);yes(!AtomicWorkbenchNavigationCardData.from(h.structured(event)).structured,"event-only frame manufactured route metrics");});
 test("only verified maneuver IDs select directional icons",()->{CardHarness h=new CardHarness();for(Object[] item:new Object[][]{{2,"turn-left"},{3,"turn-right"},{4,"turn-slight-left"},{5,"turn-slight-right"},{8,"turn-uturn-left"},{19,"turn-uturn-right"},{9,"turn-straight"},{65,"turn-left"},{66,"turn-right"},{999,"navigation"}}){Bundle b=h.fullMetrics();b.putInt("curManeuverID",(Integer)item[0]);h.applyNavigationState(h.structured(b));yes(((GlassIcon)h.navigationIcon.image).kind.equals(item[1]),"maneuver ID guessed: "+item[0]);}});
 test("spoken and notification fallback never inherit or derive real-time metrics",()->{CardHarness h=new CardHarness();h.applyNavigationState(h.structured(h.fullMetrics()));Bundle spoken=h.state(true);spoken.putString("title","前方200米后右转");spoken.putString("subtitle","最近导航播报 · 3秒前");spoken.putString("subtext","");spoken.putString("navigation_source","amap_memory_spoken");h.applyNavigationState(spoken);yes(h.navigationTitle.text.equals("前方200米后右转")&&h.navigationSubtitle.text.equals("最近导航播报 · 3秒前"),"spoken fallback lost honest source label");yes(h.navigationSpeed.text.isEmpty()&&h.navigationRemaining.text.isEmpty()&&h.navigationMetricsColumn.visibility==View.GONE&&((GlassIcon)h.navigationIcon.image).kind.equals("navigation"),"text parsed/inherited numeric speed or turn arrow");h.applyNavigationState(null);yes(h.navigationSpeed.text.isEmpty()&&h.navigationRemaining.text.isEmpty()&&!h.cardPager.hasNavigation(),"ending retained route metrics");});
 test("time and metre formatting uses sampled units without missing-value placeholders",()->{CardHarness h=new CardHarness();Bundle b=h.fullMetrics();b.putDouble("segmentRemainDist",1250);b.putDouble("routeRemainTime",3601);b.putDouble("routeRemainDist",999);h.applyNavigationState(h.structured(b));yes(h.navigationTitle.text.equals("1.3 公里")&&h.navigationRemaining.text.equals("1 小时 1 分钟 · 999 米"),"canonical seconds/metres conversion wrong");b.remove("routeRemainDist");b.putDouble("routeRemainTime",30);h.applyNavigationState(h.structured(b));yes(h.navigationRemaining.text.equals("不足 1 分钟"),"missing route distance fabricated");});
 System.out.println("CARD PAGER RESULT "+cases+" cases; "+checks+" assertions");}}
'''
def main():
 activity = (SRC/'AtomicWorkbenchActivity.java').read_text(encoding='utf-8')
 SOURCES['ls/augment/com/CardHarness.java'] = HEAD+'\n'.join(member(activity,s) for s in ('private void updateCardPageHint()','private void updateNavigationSurface()','private void applyNavigationState(Bundle state)','private void updateNavigationDetails(AtomicWorkbenchNavigationCardData card)','private void openNavigationWindow()','private void stopMedia()'))+TEST
 assert 'navigationPage.setOnClickListener(view -> openNavigationWindow())' in activity, 'navigation page action is not connected'
 with tempfile.TemporaryDirectory(prefix='lsa-workbench-pager-') as temporary:
  work=Path(temporary); files=[]
  for name,content in SOURCES.items():
   path=work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8');files.append(str(path))
  subprocess.run([SUPPORT['JAVAC'],'--release','17','-encoding','UTF-8','-d',str(work),*[str(SRC/(name+'.java')) for name in ('AtomicWorkbenchCardPageModel','AtomicWorkbenchCardPager','AtomicWorkbenchAmapData','AtomicWorkbenchNavigationCardData')],*files],check=True,timeout=60,env=SUPPORT['ENV'])
  subprocess.run([SUPPORT['JAVA'],'-cp',str(work),'ls.augment.com.CardHarness'],check=True,timeout=30,env=SUPPORT['ENV'])
if __name__=='__main__':main()
