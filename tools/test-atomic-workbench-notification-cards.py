"""Run actual dynamic pager, immutable clock codec/model and notification UI callbacks.

Android views/clock/queue are controlled boundaries; no phone, notification or user data.
Every negative control mutates a production source and must fail the same assertions.
"""
from pathlib import Path
import argparse
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-card-pager.py')))
SRC, SUPPORT = BASE['SRC'], BASE['SUPPORT']
NAMES = ('AtomicWorkbenchCardPageModel', 'AtomicWorkbenchCardPager', 'AtomicWorkbenchNotificationCardData',
         'AtomicWorkbenchNotificationCardsModel', 'AtomicWorkbenchNotificationCards')
SOURCES = dict(BASE['SOURCES'])
SOURCES['android/os/Bundle.java'] = SOURCES['android/os/Bundle.java'].replace('public int size()', 'public <T> void putParcelableArrayList(String k,java.util.ArrayList<T> v){values.put(k,v);}public int size()')
SOURCES['android/content/Context.java'] = '''package android.content;public class Context {
 final android.content.res.Resources resources=new android.content.res.Resources();
 public android.content.res.Resources getResources(){return resources;}public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}'''
SOURCES['android/content/pm/PackageManager.java'] = '''package android.content.pm;public class PackageManager {
 public Object getApplicationInfo(String p,int flags){return p;}public CharSequence getApplicationLabel(Object info){return "Clock";}}'''
SOURCES['android/content/res/Resources.java'] = '''package android.content.res;public class Resources {
 public static class Metrics {public float density=1;public int widthPixels=480;}
 public static class Configuration {public float fontScale=1;}
 final Metrics metrics=new Metrics();final Configuration config=new Configuration();
 public Metrics getDisplayMetrics(){return metrics;}public Configuration getConfiguration(){return config;}}'''
SOURCES['android/view/View.java'] = '''package android.view;import android.content.Context;public class View {
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8,IMPORTANT_FOR_ACCESSIBILITY_NO=2,IMPORTANT_FOR_ACCESSIBILITY_YES=1,TEXT_DIRECTION_LTR=3;
 public interface OnClickListener {void onClick(View v);}public OnClickListener click;
 public Object tag,layout;public CharSequence description;public int visibility=0;public boolean enabled=true;public ViewParent parent;
 public View(Context c){}public ViewParent getParent(){return parent;}public void setTag(Object v){tag=v;}public Object getTag(){return tag;}
 public void setVisibility(int v){visibility=v;}public int getVisibility(){return visibility;}public void setEnabled(boolean v){enabled=v;}public boolean isEnabled(){return enabled;}
 public void setContentDescription(CharSequence v){description=v;}public void setPadding(int a,int b,int c,int d){}public void setMinimumHeight(int v){}public void setMinimumWidth(int v){}
 public void setLayoutParams(Object v){layout=v;}public Object getLayoutParams(){return layout;}public void setImportantForAccessibility(int v){}public void setTextDirection(int v){}
 public void setBackground(Object v){}public void setTooltipText(CharSequence v){}public void setOnClickListener(OnClickListener v){click=v;}
 public boolean performClick(){if(click==null||!enabled)return false;click.onClick(this);return true;}public void clickEvenIfHidden(){if(click!=null)click.onClick(this);}
 public boolean onTouchEvent(MotionEvent e){return false;}protected void onSizeChanged(int a,int b,int c,int d){}
 public void resize(int width){onSizeChanged(width,1,0,1);}public void onInitializeAccessibilityNodeInfo(android.view.accessibility.AccessibilityNodeInfo i){}
 public boolean performAccessibilityAction(int a,android.os.Bundle b){return false;}public void clearFocus(){}public void bringToFront(){}}
'''
SOURCES['android/view/ViewGroup.java'] = '''package android.view;import android.content.Context;import java.util.*;public class ViewGroup extends View implements ViewParent {
 public final List<View> children=new ArrayList<>();public int adds,removes;public ViewGroup(Context c){super(c);}
 public void requestDisallowInterceptTouchEvent(boolean v){}public void addView(View v){addView(v,null);}
 public void addView(View v,Object p){if(v.parent!=null)throw new IllegalStateException("already_parented");v.parent=this;v.layout=p;children.add(v);adds++;}
 public void removeView(View v){if(children.remove(v)){v.parent=null;removes++;}}public void removeAllViews(){for(View v:new ArrayList<>(children))removeView(v);}
 public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}
'''
SOURCES['android/widget/LinearLayout.java'] = '''package android.widget;import android.content.Context;public class LinearLayout extends android.view.ViewGroup {
 public static final int HORIZONTAL=0,VERTICAL=1;public int orientation;public LinearLayout(Context c){super(c);}public void setOrientation(int v){orientation=v;}public void setGravity(int v){}
 public boolean onInterceptTouchEvent(android.view.MotionEvent e){return false;}
 public static class LayoutParams {public int width,height,leftMargin,topMargin,rightMargin,bottomMargin;public float weight;public LayoutParams(int w,int h){width=w;height=h;}public LayoutParams(int w,int h,float f){this(w,h);weight=f;}}}
'''
SOURCES['android/widget/TextView.java'] = '''package android.widget;public class TextView extends android.view.View {
 public String text="";public int maxLines;public float textSize;public TextView(android.content.Context c){super(c);}public void setGravity(int v){}public void setMaxLines(int v){maxLines=v;}
 public void setEllipsize(Object v){}public void setText(CharSequence v){text=v==null?"":v.toString();}public CharSequence getText(){return text;}public void setTextSize(float v){textSize=v;}public void setTextColor(int v){}}
'''
SOURCES['android/widget/Button.java'] = 'package android.widget;public class Button extends TextView {public Button(android.content.Context c){super(c);}}'
SOURCES['android/view/Gravity.java'] = 'package android.view;public class Gravity {public static final int CENTER_VERTICAL=16,CENTER=17,END=8388613;}'
SOURCES['android/os/Process.java'] = 'package android.os;public class Process {public static int myUid(){return 10515;}}'
SOURCES['android/os/SystemClock.java'] = 'package android.os;public class SystemClock {public static long now=1000;public static long elapsedRealtime(){return now;}}'
SOURCES['android/os/Looper.java'] = 'package android.os;public class Looper {static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return MAIN;}}'
SOURCES['android/os/Handler.java'] = '''package android.os;import java.util.*;public class Handler {
 static class Task {long at;Runnable r;Task(long a,Runnable v){at=a;r=v;}}static final List<Task> queue=new ArrayList<>();static long uptime=1000;public Handler(){}public Handler(Looper l){}
 public boolean post(Runnable r){queue.add(new Task(uptime,r));return true;}public boolean postDelayed(Runnable r,long d){queue.add(new Task(uptime+d,r));return true;}
 public void removeCallbacks(Runnable r){queue.removeIf(t->t.r==r);}public static void drain(){int bound=10000;while(true){Task found=null;for(Task t:queue)if(t.at<=uptime){found=t;break;}if(found==null)return;queue.remove(found);if(--bound==0)throw new AssertionError("unbounded_ui_queue");found.r.run();}}
 public static void reset(){queue.clear();SystemClock.now=uptime=1000;}public static void advance(long n){SystemClock.now+=n;uptime+=n;drain();}}
'''
SOURCES['android/app/Dialog.java'] = '''package android.app;public class Dialog {
 public interface OnDismissListener {void onDismiss(Dialog v);}public OnDismissListener listener;public boolean showing=true;public void setOnDismissListener(OnDismissListener v){listener=v;}
 public void dismiss(){showing=false;if(listener!=null)listener.onDismiss(this);}public boolean isShowing(){return showing;}}
'''
SOURCES['android/widget/Toast.java'] = '''package android.widget;public class Toast {public static final int LENGTH_LONG=1;public static String last="";public static Toast makeText(android.content.Context c,CharSequence s,int d){last=s.toString();return new Toast();}public void show(){}}
'''
SOURCES['ls/augment/com/UiKit.java'] = '''package ls.augment.com;import android.content.Context;import android.widget.*;import android.app.Dialog;final class UiKit {
 final Context activity;int text=1,muted=5;boolean failDialog;Dialog lastDialog;UiKit(Context c){activity=c;}int dp(int n){return n;}
 TextView text(String s,int z,int c,boolean bold){TextView v=new TextView(activity);v.setText(s);v.setTextSize(z);return v;}
 Button button(String s){Button b=new Button(activity);b.setText(s);return b;}Button accentButton(String s){return button(s);}
 void setButtonEnabled(Button b,boolean e){b.setEnabled(e);}LinearLayout.LayoutParams wrap(){return new LinearLayout.LayoutParams(-1,-2);}
 LinearLayout.LayoutParams margins(int a,int b,int c,int d){LinearLayout.LayoutParams p=wrap();p.leftMargin=a;p.topMargin=b;p.rightMargin=c;p.bottomMargin=d;return p;}
 LinearLayout groupRow(){return new LinearLayout(activity);}Dialog glassDialog(String t,android.view.View body,String yes,Runnable action,Object other){if(failDialog)throw new IllegalStateException("no_window");return lastDialog=new Dialog();}}
'''
SOURCES['ls/augment/com/NotificationCardsHarness.java'] = r'''package ls.augment.com;
import android.os.*;import android.view.*;import android.widget.*;import android.content.*;import java.util.*;import java.util.function.*;import java.lang.reflect.*;
public class NotificationCardsHarness {
 static int cases,checks;static void yes(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}static void test(String name,Runnable r){Handler.reset();r.run();cases++;System.out.println("PASS production notification UI: "+name);}
 static String id(int n){return String.format(java.util.Locale.ROOT,"%032x",n);}static Bundle card(int n,long appeared){
 Bundle b=new Bundle();b.putString("source_id",id(n));b.putString("source_generation",id(n)+"a");b.putLong("source_revision",1);b.putString("kind","timer");b.putInt("owner_uid",10001);b.putInt("user_id",0);b.putString("package","com.clock");b.putLong("appeared_revision",appeared);
 b.putBoolean("time_known",true);b.putLong("time_ms",10000);b.putLong("sample_elapsed",1000);b.putLong("valid_until_elapsed",3000);b.putInt("display_resolution_ms",1000);b.putBoolean("advancing",true);b.putBoolean("count_down",true);b.putBoolean("can_record",true);b.putBoolean("can_toggle",false);b.putBoolean("can_stop",false);b.putBoolean("can_lap",false);b.putString("time_status","public_chronometer");b.putParcelableArrayList("records",new ArrayList<Bundle>());b.putBoolean("records_full",false);return b;}
 static Bundle state(boolean good,long event,Bundle... cards){Bundle b=new Bundle();b.putInt("schema",1);b.putBoolean("success",good);b.putBoolean("available",good);b.putString("notification_status",good?"verified":"unavailable");b.putLong("event_revision",event);b.putParcelableArrayList("cards",new ArrayList<>(List.of(cards)));b.putInt("card_count",cards.length);b.putBoolean("cards_limited",false);b.putBoolean("record_stored",false);b.putBoolean("recorder_available",false);b.putBoolean("notification_actions_available",false);b.putString("actions_status","source_semantics_unavailable");return b;}
 static void records(Bundle c,int count){ArrayList<Bundle> list=new ArrayList<>();for(int n=1;n<=count;n++){Bundle r=new Bundle();r.putInt("number",n);r.putLong("time_ms",10000-n*1000);r.putLong("sample_elapsed",1000+n);list.add(r);}c.putParcelableArrayList("records",list);c.putBoolean("records_full",count==32);if(count==32)c.putBoolean("can_record",false);}
 static AtomicWorkbenchNotificationCardData.Snapshot parse(Bundle b){return AtomicWorkbenchNotificationCardData.Snapshot.parse(b,0);}
 static AtomicWorkbenchNotificationCardData data(Bundle c){return parse(state(true,c.getLong("appeared_revision"),c)).cards.get(c.getString("source_id"));}
 static Object field(Object o,String name){try{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(Exception e){throw new AssertionError(e);}}
 static TextView time(View v){return (TextView)field(v,"time");}static Button button(View v,String name){return(Button)field(v,name);}
 static class Fixture {Context context=new Context();UiKit ui=new UiKit(context);int changes,requests;Bundle request;Consumer<Bundle> reply;
 final AtomicWorkbenchNotificationCards cards=new AtomicWorkbenchNotificationCards(ui,(b,r)->{requests++;request=b;reply=r;},()->changes++);
 Fixture(){cards.setActive(true);}View page(){return cards.pages().get(0).view;}void apply(Bundle b){cards.apply(b);}void respond(Bundle b){reply.accept(b);Handler.drain();}}
 static AtomicWorkbenchCardPageModel.Item item(String id,long n){return new AtomicWorkbenchCardPageModel.Item(id,n);}
 static AtomicWorkbenchCardPager pager(){AtomicWorkbenchCardPager p=new AtomicWorkbenchCardPager(new Context());p.setPages(new View(new Context()),new View(new Context()),null);return p;}
 static AtomicWorkbenchCardPager.Page page(String id,long n,View v){return new AtomicWorkbenchCardPager.Page(id,id,n,v);}
 static void swipe(AtomicWorkbenchCardPager p,boolean left){p.onInterceptTouchEvent(new MotionEvent(0,left?200:20,20));yes(p.onInterceptTouchEvent(new MotionEvent(2,left?100:120,20)),"not intercepted");p.onTouchEvent(new MotionEvent(1,left?20:200,20));}
 public static void main(String[] args){
 test("stable dynamic selection and each appearance focuses once",()->{AtomicWorkbenchCardPageModel m=new AtomicWorkbenchCardPageModel();m.dynamic(List.of(item("n1",1)),true);yes(m.selected().equals("n1"),"new source not focused");m.select("music");m.dynamic(List.of(item("n1",1)),true);yes(m.selected().equals("music"),"poll stole manual choice");m.dynamic(List.of(item("n1",1),item("n2",2)),true);yes(m.selected().equals("n2"),"second new source");m.select("n1");m.dynamic(List.of(item("n2",2),item("n1",1)),true);yes(m.selected().equals("n1")&&m.ids().equals(List.of("music","n1","n2")),"enumeration reorder lost stable ID/order");});
 test("failed incomplete enumeration cannot withdraw pages",()->{AtomicWorkbenchCardPageModel m=new AtomicWorkbenchCardPageModel();m.dynamic(List.of(item("n1",1)),true);m.dynamic(List.of(),false);yes(m.size()==2&&m.selected().equals("n1"),"failure withdrew");m.dynamic(List.of(),true);yes(m.size()==1&&m.selected().equals("music"),"trusted withdrawal absent");m.dynamic(List.of(item("n1",1)),true);yes(m.selected().equals("music"),"old appeared replay focused");m.resetDynamic();m.dynamic(List.of(item("n1",1)),true);yes(m.selected().equals("n1"),"new backend lifetime did not reset");});
 test("navigation needs real generation and preserves manual selection",()->{AtomicWorkbenchCardPageModel m=new AtomicWorkbenchCardPageModel();m.navigation(true,"");yes(m.selected().equals("music"),"invented navigation event");m.navigation(true,id(1)+"1");yes(m.selected().equals("navigation"),"new navigation missing focus");m.select("music");m.navigation(true,id(1)+"1");m.navigation(false,"");m.navigation(true,id(1)+"1");yes(m.selected().equals("music"),"refresh/reconnect stole focus");m.navigation(true,id(1)+"2");yes(m.selected().equals("navigation"),"new generation ignored");});
 test("bounded pages reject invalid IDs and do not acknowledge omitted source",()->{AtomicWorkbenchCardPageModel m=new AtomicWorkbenchCardPageModel();List<AtomicWorkbenchCardPageModel.Item> all=new ArrayList<>();for(int n=1;n<=16;n++)all.add(item("n"+n,n));m.dynamic(all,true);m.select("music");m.dynamic(List.of(item("later",17)),false);yes(m.size()==17&&m.selected().equals("music"),"over capacity");m.dynamic(List.of(item("later",17)),true);yes(m.selected().equals("later"),"never-visible source acknowledged");for(String reserved:List.of("music","navigation")){boolean rejected=false;try{m.dynamic(List.of(item(reserved,20)),false);}catch(IllegalArgumentException expected){rejected=true;}yes(rejected,"reserved ID accepted");}});
 test("NMS navigation birth is unsigned monotonic and requires explicit boot reset",()->{AtomicWorkbenchCardPageModel m=new AtomicWorkbenchCardPageModel();for(int n=1;n<=200;n++){m.select("music");m.navigation(true,id(1)+Integer.toHexString(n));yes(m.selected().equals("navigation"),"arbitrary source count cap");}m.select("music");m.navigation(true,id(1)+"1");yes(m.selected().equals("music"),"older lifetime stole focus");m.navigation(true,id(1)+"7fffffffffffffff");m.select("music");m.navigation(true,id(1)+"8000000000000000");yes(m.selected().equals("navigation"),"signed birth comparison");m.select("music");m.navigation(true,id(2)+"ffffffffffffffff");yes(m.selected().equals("music"),"unexpected boot swapped epoch");m.resetNavigationSource();m.navigation(true,id(2)+"1");yes(m.selected().equals("navigation"),"explicit boot reset unavailable");m.select("music");for(String suffix:List.of("0","01","0002"))m.navigation(true,id(2)+suffix);yes(m.selected().equals("music"),"noncanonical zero birth accepted");});
 test("actual pager retains exact View and manual ID across base changes",()->{AtomicWorkbenchCardPager p=pager();View a=new View(new Context()),b=new View(new Context());p.setNotificationPages(List.of(page("a",1,a),page("b",2,b)),true);yes(p.pageId().equals("b"),"new page");p.selectPage("a");int adds=p.adds,removes=p.removes;p.setNotificationPages(List.of(page("a",1,a),page("b",2,b)),true);yes(p.adds==adds&&p.removes==removes&&p.pageId().equals("a"),"rebuilt view");p.setNavigationAvailable(true);yes(p.pageId().equals("a")&&a.visibility==View.VISIBLE&&p.page()==2,"index identity changed");p.setNavigationAvailable(false);yes(p.pageId().equals("a")&&p.page()==1,"nav removal stole selection");});
 test("actual pager swipes multiple pages and accessibility both directions",()->{AtomicWorkbenchCardPager p=pager();p.setNavigationSource(true,id(1)+"1");View a=new View(new Context());p.setNotificationPages(List.of(page("a",1,a)),true);p.selectPage("music");swipe(p,true);yes(p.pageId().equals("navigation"),"first left");swipe(p,true);yes(p.pageId().equals("a"),"second left");swipe(p,false);yes(p.pageId().equals("navigation"),"right");yes(p.performAccessibilityAction(4096,null)&&p.pageId().equals("a"),"a11y forward");yes(p.performAccessibilityAction(8192,null)&&p.pageId().equals("navigation"),"a11y back");});
 test("vertical cancel invalid pointers and withdrawal cannot finish stale swipe",()->{AtomicWorkbenchCardPager p=pager();p.setNotificationPages(List.of(page("a",1,new View(new Context()))),true);p.selectPage("music");p.onInterceptTouchEvent(new MotionEvent(0,200,20));yes(!p.onInterceptTouchEvent(new MotionEvent(2,180,100)),"vertical");p.onTouchEvent(new MotionEvent(1,20,100));yes(p.page()==0,"vertical flipped");p.onInterceptTouchEvent(new MotionEvent(0,200,20));p.onInterceptTouchEvent(new MotionEvent(2,100,20));p.setNotificationPages(List.of(),true);p.onTouchEvent(new MotionEvent(1,20,20));yes(p.pageCount()==1&&p.page()==0,"withdrawal revived");});
 test("pager rejects shared views before changing model",()->{AtomicWorkbenchCardPager p=pager();View v=new View(new Context());boolean bad=false;try{p.setNotificationPages(List.of(page("a",1,v),page("b",2,v)),true);}catch(IllegalArgumentException expected){bad=true;}yes(bad&&p.pageCount()==1,"duplicate view corrupted model");});
 test("partial rebind cannot borrow retained view or mutate model before parent validation",()->{AtomicWorkbenchCardPager p=pager();View v=new View(new Context());p.setNotificationPages(List.of(page("a",1,v)),true);boolean denied=false;try{p.setNotificationPages(List.of(page("b",2,v)),false);}catch(IllegalArgumentException expected){denied=true;}yes(denied&&p.pageCount()==2&&p.pageId().equals("a"),"partial duplicate corrupted pages");LinearLayout other=new LinearLayout(new Context());View owned=new View(new Context());other.addView(owned);denied=false;try{p.setNotificationPages(List.of(page("c",3,owned)),true);}catch(IllegalArgumentException expected){denied=true;}yes(denied&&p.pageCount()==2&&p.pageId().equals("a"),"parent rejection mutated model");});
 test("clock extrapolation uses signed time and exact two second fence",()->{Bundle c=card(1,1);AtomicWorkbenchNotificationCardData d=data(c);yes(d.timeAt(999)==null&&d.timeAt(1000)==10000&&d.timeAt(2999)==8001&&d.timeAt(3000)==null,"time fence");c.putLong("time_ms",0);yes(data(c).timeAt(2000)==-1000,"cross-zero source ended");yes(AtomicWorkbenchNotificationCardData.format(-1000).equals("−00:01")&&!AtomicWorkbenchNotificationCardData.format(1000).contains("."),"false precision/sign");});
 test("overflow and frozen source do not fabricate progression",()->{Bundle c=card(1,1);c.putLong("time_ms",Long.MIN_VALUE);yes(data(c).timeAt(2000)==null,"overflow");c.putLong("time_ms",60000);c.putBoolean("advancing",false);yes(data(c).timeAt(2999)==60000,"frozen advanced");yes(!AtomicWorkbenchNotificationCardData.format(Long.MIN_VALUE).isEmpty(),"format overflow");});
 test("strict metadata rejects unsupported actions and wrong types",()->{for(String key:List.of("can_toggle","can_stop","can_lap")){Bundle c=card(1,1);c.putBoolean(key,true);yes(!parse(state(true,1,c)).valid,"unsupported action accepted");}Bundle c=card(1,1);c.putInt("source_revision",1);yes(!parse(state(true,1,c)).valid,"coerced revision");c=card(1,1);c.putInt("user_id",1);yes(!parse(state(true,1,c)).valid,"cross-user");c=card(1,1);c.putString("source_generation",id(1));yes(!parse(state(true,1,c)).valid,"fake generation");c=card(1,1);c.putString("private_notification_text","secret");yes(!parse(state(true,1,c)).valid,"extra content accepted");});
 test("clock changed unavailable and invalid TTL cannot show known time",()->{Bundle c=card(1,1);c.putString("time_status","clock_changed");yes(!parse(state(true,1,c)).valid,"known clock jump");c.putBoolean("time_known",false);c.putLong("valid_until_elapsed",0);c.putBoolean("advancing",false);c.putBoolean("can_record",false);yes(data(c).timeAt(1000)==null,"clock jump extrapolated");c=card(1,1);c.putLong("valid_until_elapsed",3001);yes(!parse(state(true,1,c)).valid,"unsupported TTL");});
 test("parser freezes mutable incoming bundles and records",()->{Bundle c=card(1,1);records(c,1);AtomicWorkbenchNotificationCardData.Snapshot s=parse(state(true,1,c));c.putLong("time_ms",99999);records(c,2);yes(s.cards.get(id(1)).time==10000&&s.cards.get(id(1)).records.size()==1,"input bundle mutated snapshot");boolean immutable=false;try{s.cards.clear();}catch(UnsupportedOperationException e){immutable=true;}yes(immutable,"mutable map");});
 test("model only complete trusted enumeration removes and failed state stops time",()->{AtomicWorkbenchNotificationCardsModel m=new AtomicWorkbenchNotificationCardsModel();Bundle c=card(1,1);records(c,1);m.apply(parse(state(true,1,c)),m.beginUpdate());m.apply(parse(state(false,1,c)),m.beginUpdate());yes(m.cards().size()==1&&m.source(id(1)).timeAt(1000)==null&&m.source(id(1)).records.size()==1&&!m.complete(),"failure cleared/extrapolated");m.apply(parse(state(true,1)),m.beginUpdate());yes(m.cards().isEmpty()&&m.complete(),"complete empty kept page");});
 test("partial success keeps omitted history and marks omitted time unknown",()->{AtomicWorkbenchNotificationCardsModel m=new AtomicWorkbenchNotificationCardsModel();m.apply(parse(state(true,2,card(1,1),card(2,2))),m.beginUpdate());Bundle partial=state(true,2,card(1,1));partial.putBoolean("cards_limited",true);m.apply(parse(partial),m.beginUpdate());yes(m.cards().size()==2&&m.source(id(2)).timeAt(1000)==null&&!m.complete()&&m.limited(),"partial withdrawal/extrapolation");});
 test("same-event late query cannot resurrect withdrawn source",()->{AtomicWorkbenchNotificationCardsModel m=new AtomicWorkbenchNotificationCardsModel();long old=m.beginUpdate(),fresh=m.beginUpdate();m.apply(parse(state(true,1)),fresh);yes(!m.apply(parse(state(true,1,card(1,1))),old)&&m.cards().isEmpty(),"late reply resurrected");});
 test("reset rejects prior identity callbacks",()->{AtomicWorkbenchNotificationCardsModel m=new AtomicWorkbenchNotificationCardsModel();long old=m.beginUpdate();m.reset();yes(!m.apply(parse(state(true,1,card(1,1))),old)&&m.cards().isEmpty(),"reset old source");yes(m.apply(parse(state(true,1,card(1,1))),m.beginUpdate()),"new identity blocked");});
 test("same source cannot change owner generation or go back a revision",()->{AtomicWorkbenchNotificationCardsModel m=new AtomicWorkbenchNotificationCardsModel();Bundle c=card(1,1);c.putLong("source_revision",2);m.apply(parse(state(true,1,c)),m.beginUpdate());for(String key:List.of("generation","revision")){Bundle bad=card(1,1);if(key.equals("generation"))bad.putString("source_generation",id(2)+"a");m.apply(parse(state(true,1,bad)),m.beginUpdate());yes(m.source(id(1)).revision==2&&m.source(id(1)).timeAt(1000)==null&&!m.complete(),"source lifetime changed");}});
 test("UI same-source refresh preserves actual views and does not dispatch changes on ticks",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));View old=f.page();int changed=f.changes;Handler.advance(1000);yes(f.changes==changed&&time(old).text.equals("00:09"),"tick rebuilt pages");f.apply(state(true,1,card(1,1)));yes(f.page()==old,"poll recreated view");Handler.advance(1000);yes(time(old).text.equals("时间未知")&&!button(old,"record").enabled,"stale time/record");});
 test("stop lifecycle stops extrapolation and pending reset cannot revive views",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));View v=f.page();f.cards.setActive(false);yes(time(v).text.equals("时间未知")&&!button(v,"record").enabled,"inactive extrapolated");long token=f.cards.beginUpdate();f.cards.reset();f.cards.apply(state(true,1,card(1,1)),token);yes(f.cards.pages().isEmpty(),"reset revived UI");f.cards.close();f.cards.apply(state(true,1,card(1,1)));yes(f.cards.pages().isEmpty(),"closed revived");});
 test("timer UI sends exactly one frozen seven-key local record request",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));View v=f.page();button(v,"record").performClick();button(v,"record").clickEvenIfHidden();yes(f.requests==1,"duplicate pending write");yes(f.request.keySet().equals(Set.of("schema","request_id","source_id","source_generation","source_revision","created_elapsed","deadline_elapsed")),"request keys");yes(f.request.getString("source_id").equals(id(1))&&f.request.getString("source_generation").equals(id(1)+"a")&&f.request.getLong("source_revision")==1&&f.request.getLong("deadline_elapsed")==6000&&f.request.getString("request_id").matches("[0-9a-f]{32}"),"not frozen exact source");Bundle c=card(1,1);records(c,1);Bundle reply=state(true,1,c);reply.putBoolean("record_stored",true);f.respond(reply);yes(f.cards.pages().get(0).view==v&&button(v,"records").visibility==View.VISIBLE&&Toast.last.equals("已记录当前计时"),"actual committed record not shown");});
 test("unknown record is not replayed and requires a newer trusted refresh",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));View v=f.page();button(v,"record").performClick();f.respond(state(true,1,card(1,1)));button(v,"record").clickEvenIfHidden();yes(f.requests==1&&!button(v,"record").enabled&&Toast.last.contains("未确认"),"unknown replay");f.apply(state(true,1,card(1,1)));yes(button(v,"record").enabled,"new trusted poll did not permit explicit new action");button(v,"record").performClick();yes(f.requests==2,"new explicit action blocked");});
 test("record timeout late callback and reset never report a false success",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));button(f.page(),"record").performClick();Consumer<Bundle> old=f.reply;Handler.advance(5000);Bundle reply=state(true,1,card(1,1));reply.putBoolean("record_stored",true);old.accept(reply);Handler.drain();yes(Toast.last.contains("未确认")&&f.requests==1,"late timeout said success");f.cards.reset();old.accept(reply);Handler.drain();yes(f.cards.pages().isEmpty(),"late reset resurrected");});
 test("sleep elapsed deadline expires even before uptime timeout can run",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));View v=f.page();button(v,"record").performClick();SystemClock.now=6000;Bundle reply=state(true,1,card(1,1));reply.putBoolean("record_stored",true);f.respond(reply);yes(Toast.last.contains("未确认")&&!button(v,"record").enabled,"sleep extended acknowledgement lease");});
 test("background transition revokes pending record callback",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));button(f.page(),"record").performClick();f.cards.setActive(false);String previous=Toast.last;Bundle reply=state(true,1,card(1,1));reply.putBoolean("record_stored",true);f.respond(reply);yes(Toast.last.equals(previous)&&field(f.page(),"pending")==null,"background callback reported new result");});
 test("source removed during record cannot mutate another page",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));button(f.page(),"record").performClick();f.apply(state(true,2,card(2,2)));Bundle reply=state(true,1,card(1,1));reply.putBoolean("record_stored",true);f.respond(reply);yes(f.cards.pages().size()==1&&f.cards.pages().get(0).id.equals("notification:"+id(2)),"old record restored source");});
 test("confirmed local commit remains a fact when following enumeration failed",()->{Fixture f=new Fixture();f.apply(state(true,1,card(1,1)));View v=f.page();button(v,"record").performClick();Bundle c=card(1,1);records(c,1);Bundle b=state(false,1,c);b.putBoolean("record_stored",true);f.respond(b);yes(Toast.last.equals("已记录当前计时")&&button(v,"records").text.contains("1")&&!button(v,"record").enabled&&time(v).text.equals("时间未知"),"commit fact lost or failure extrapolated");});
 test("public stopwatch offers no fabricated source actions or local lap",()->{Fixture f=new Fixture();Bundle c=card(1,1);c.putString("kind","stopwatch");c.putBoolean("count_down",false);c.putBoolean("can_record",false);f.apply(state(true,1,c));View v=f.page();yes(((LinearLayout)field(v,"actions")).getChildCount()==1&&button(v,"record").parent==null&&((LinearLayout)field(v,"actions")).visibility==View.GONE,"fake stopwatch controls");button(v,"record").clickEvenIfHidden();yes(f.requests==0,"fake lap");});
 test("32 records stay readable without eviction and timer write is disabled",()->{Fixture f=new Fixture();Bundle c=card(1,1);records(c,32);f.apply(state(true,1,c));View v=f.page();yes(!button(v,"record").enabled&&button(v,"records").text.contains("32"),"full record state");button(v,"records").performClick();yes(f.ui.lastDialog!=null&&f.ui.lastDialog.showing,"real history dialog");LinearLayout body=(LinearLayout)field(f.cards,"historyBody");yes(body.getChildCount()==32,"history evicted");f.apply(state(false,1));yes(f.ui.lastDialog.showing&&body.getChildCount()==32,"query failure removed history");f.apply(state(true,1));yes(!f.ui.lastDialog.showing,"real source withdrawal kept history dialog");});
 test("late dismiss identity cannot close a new history dialog",()->{Fixture f=new Fixture();Bundle c=card(1,1);records(c,1);f.apply(state(true,1,c));button(f.page(),"records").performClick();android.app.Dialog old=f.ui.lastDialog;button(f.page(),"records").performClick();android.app.Dialog current=f.ui.lastDialog;old.listener.onDismiss(old);yes(field(f.cards,"history")==current&&current.showing,"old dismissal removed new dialog");});
 test("history show failure clears its own state",()->{Fixture f=new Fixture();Bundle c=card(1,1);records(c,1);f.apply(state(true,1,c));f.ui.failDialog=true;button(f.page(),"records").performClick();yes(field(f.cards,"historySource")==null&&field(f.cards,"historyBody")==null,"failed show leaked state");});
 test("background lifecycle closes history and rejects queued hidden clicks",()->{Fixture f=new Fixture();Bundle c=card(1,1);records(c,1);f.apply(state(true,1,c));View v=f.page();button(v,"records").performClick();android.app.Dialog old=f.ui.lastDialog;f.cards.setActive(false);button(v,"records").clickEvenIfHidden();yes(!old.showing&&field(f.cards,"history")==null&&!button(v,"records").enabled,"background reopened dialog");});
 test("large font and narrow cards stack controls without reducing text",()->{Fixture f=new Fixture();f.context.getResources().getConfiguration().fontScale=1.5f;Bundle c=card(1,1);records(c,1);f.apply(state(true,1,c));View v=f.page();LinearLayout actions=(LinearLayout)field(v,"actions");yes(actions.orientation==LinearLayout.VERTICAL&&time(v).textSize==25&&time(v).maxLines==2,"large text compressed");f.context.getResources().getConfiguration().fontScale=1;v.resize(320);yes(actions.orientation==LinearLayout.VERTICAL,"narrow card squeezed controls");v.resize(600);yes(actions.orientation==LinearLayout.HORIZONTAL,"wide card not restored");});
 System.out.println("NOTIFICATION CARDS RESULT "+cases+" cases; "+checks+" assertions");}}
'''

MUTANTS = {
    'failure-withdraws': ('AtomicWorkbenchNotificationCardsModel', 'complete=valid&&snapshot.complete;', 'complete=valid;'),
    'late-reply-revives': ('AtomicWorkbenchNotificationCardsModel', 'if(update<=applied||update>issued)return false;', 'if(update>issued)return false;'),
    'refresh-steals-selection': ('AtomicWorkbenchCardPageModel', 'long newestRevision=acknowledgedAppearance;', 'long newestRevision=0;'),
    'expired-time-extrapolates': ('AtomicWorkbenchNotificationCardData', 'now>=until', 'now>until+2000'),
    'unsupported-action-accepted': ('AtomicWorkbenchNotificationCardData', '||bool(b,"can_toggle")||bool(b,"can_stop")||bool(b,"can_lap")', ''),
    'unknown-write-succeeds': ('AtomicWorkbenchNotificationCards', 'card.needsRefresh=!frozen.stored;', 'card.needsRefresh=false;'),
    'reset-old-ui-revives': ('AtomicWorkbenchNotificationCardsModel', 'applied=beginUpdate();cards.clear()', 'cards.clear()'),
    'navigation-refresh-steals': ('AtomicWorkbenchCardPageModel', 'Long.compareUnsigned(birth,navigationBirth)>0', 'true'),
    'navigation-birth-signed': ('AtomicWorkbenchCardPageModel', 'Long.compareUnsigned(birth,navigationBirth)>0', 'birth>navigationBirth'),
    'navigation-boot-unchecked': ('AtomicWorkbenchCardPageModel', 'navigationBoot.equals(boot)&&', ''),
    'parent-check-after-mutation': ('AtomicWorkbenchCardPager', 'if(page.view.getParent() instanceof ViewGroup&&page.view.getParent()!=this)throw new IllegalArgumentException("card_view_already_parented");', ''),
    'sleep-extends-record-lease': ('AtomicWorkbenchNotificationCards', 'SystemClock.elapsedRealtime()>=deadline', 'false'),
}

def run(overrides=None, quiet=False):
    with tempfile.TemporaryDirectory(prefix='lsa-notification-ui-') as temporary:
        work=Path(temporary); files=[]
        for name,content in SOURCES.items():
            path=work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8');files.append(str(path))
        for name in NAMES:
            content=(SRC/(name+'.java')).read_text(encoding='utf-8')
            if overrides and name in overrides: content=overrides[name]
            path=work/'ls/augment/com'/f'{name}.java';path.write_text(content,encoding='utf-8');files.append(str(path))
        built=subprocess.run([SUPPORT['JAVAC'],'--release','17','-encoding','UTF-8','-d',str(work),*files],capture_output=True,text=True,timeout=60,env=SUPPORT['ENV'])
        if built.returncode: raise RuntimeError(built.stdout+built.stderr)
        result=subprocess.run([SUPPORT['JAVA'],'-cp',str(work),'ls.augment.com.NotificationCardsHarness'],capture_output=True,text=True,timeout=30,env=SUPPORT['ENV'])
        if not quiet: print(result.stdout,end='')
        return result

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--negative-controls',action='store_true');args=parser.parse_args()
    result=run()
    if result.returncode: raise RuntimeError(result.stderr)
    if args.negative_controls:
        for label,(name,before,after) in MUTANTS.items():
            source=(SRC/(name+'.java')).read_text(encoding='utf-8')
            assert before in source, label+' production anchor changed'
            changed=run({name:source.replace(before,after,1)},True)
            assert changed.returncode!=0,label+' escaped behavioral assertions'
            print('NEGATIVE CONTROL killed:',label)
if __name__=='__main__':main()
