"""Run the production supplemental card host against ordinary/fullscreen, inherited and missing OEM contracts."""
from pathlib import Path
import ast, os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1];SRC=ROOT/'android/app/src/main/java/ls/augment/com'
fixture=ROOT/'tools/test-island-download-panel.py';tree=ast.parse(fixture.read_text(encoding='utf-8'))
scope={'__file__':str(fixture)}
exec(compile(ast.Module(body=tree.body[:-1],type_ignores=[]),str(fixture),'exec'),scope)
files=dict(scope['FILES'])
files['ls/augment/com/IslandVisualSpec.java']=(SRC/'IslandVisualSpec.java').read_text('utf-8')
files['android/content/Intent.java']='package android.content;public class Intent{}'
files['android/util/DisplayMetrics.java']='package android.util;public class DisplayMetrics{public float density=1;public int heightPixels=1600,widthPixels=400;}'
files['android/content/res/Resources.java']='''package android.content.res;import java.util.*;public class Resources{
public static String missing="";public static Map<Integer,String> names=new HashMap<>();
public int getIdentifier(String n,String t,String p){if(n.equals(missing))return 0;int id=n.hashCode()&0x7fffffff;names.put(id,n);return id;}
public int getDimensionPixelSize(int id){return names.getOrDefault(id,"").equals("dynamic_island_window_width")?340:200;}
public android.content.res.Configuration getConfiguration(){return new android.content.res.Configuration();}
public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}'''
files['android/view/View.java']=files['android/view/View.java'].replace('public int getMeasuredHeight(){return 60;}','').replace('public int visibility,','public float alpha;public int visibility,').replace('public Context getContext()', '''public boolean isShown(){return parent!=null;}public void setAlpha(float a){alpha=a;}
public int measured=300;public int getMeasuredHeight(){return measured;}
public Context getContext()''')
files['android/view/View.java']=files['android/view/View.java'].replace('int UNSPECIFIED=0;', 'int UNSPECIFIED=0,EXACTLY=1;public static int makeMeasureSpec(int s,int m){return s;}')
files['android/view/Gravity.java']='package android.view;public class Gravity{public static int CENTER=17,CENTER_VERTICAL=16,END=8388613;}'
files['android/widget/FrameLayout.java']=files['android/widget/FrameLayout.java'].replace('public LayoutParams(int w,int h)','public int gravity;public LayoutParams(int w,int h)')
files['android/widget/ImageView.java']=files['android/widget/ImageView.java'].replace('CENTER_CROP','CENTER_CROP,CENTER_INSIDE')
files['android/os/Looper.java']='package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}'
files['android/os/Handler.java']='''package android.os;import java.util.*;public class Handler{public static List<Runnable> tasks=new ArrayList<>();public Handler(Looper l){}
public void removeCallbacks(Runnable r){tasks.removeIf(x->x==r);}public void postDelayed(Runnable r,long ms){tasks.add(r);}}'''
files['ls/augment/com/hook/FeatureSettings.java']=files['ls/augment/com/hook/FeatureSettings.java'].replace('static int integer','static void diagnostic(Object c,String k,String v){}static int integer')
files['ls/augment/com/hook/AugmentModule.java']='package ls.augment.com.hook;class AugmentModule{}'
files['ls/augment/com/hook/SystemUiAdapter.java']='''package ls.augment.com.hook;import java.lang.reflect.*;class SystemUiAdapter{
static final Object PASS=new Object();interface Hook{Object apply(Object o,Object[] a,Object r)throws Exception;}
static Hook close,tap,hold,show;static int hookNamed(Object m,ClassLoader l,String f,String c,String n,int k,Hook a,Hook b){
if(n.equals("onPermanentIslandPanelCloseAnimationEnd"))close=a;if(n.equals("onClick"))tap=a;if(n.equals("onLongClick"))hold=a;if(n.equals("showPermanentPanelIsland"))show=a;return 1;}
static Object field(Object o,String n){if(o==null)return null;for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(Exception e){}return null;}
static boolean set(Object o,String n,Object v){for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(n);f.setAccessible(true);f.set(o,v);return true;}catch(Exception e){}return false;}
static Object call(Object o,String n,Object...a)throws ReflectiveOperationException{for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())for(Method m:t.getDeclaredMethods())if(m.getName().equals(n)&&m.getParameterCount()==a.length){m.setAccessible(true);return m.invoke(o,a);}throw new NoSuchMethodException(n);}}
'''
source=(SRC/'hook/MagicIslandScenes.java').read_text(encoding='utf-8')
def member(source,marker):
    start=source.index(marker);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
files['ls/augment/com/hook/MagicIslandScenes.java']='package ls.augment.com.hook;import java.lang.reflect.*;class MagicIslandScenes{'+member(source,'    static Method exact(')+member(source,'    static Field typed(')+'}'
files['com/zte/feature/dynamicisland/DynamicPermanentIsland.java']='''package com.zte.feature.dynamicisland;import android.content.*;import android.widget.*;import android.view.*;import java.util.*;
public class DynamicPermanentIsland extends FrameLayout{public List<View> mViewList=new ArrayList<>();public boolean mKeyguardIsland;public DynamicPermanentIsland(Context c){super(c);}}'''
files['com/zte/feature/dynamicisland/RemoteViewPanelIsland.java']='''package com.zte.feature.dynamicisland;public class RemoteViewPanelIsland extends DynamicPermanentIsland{public RemoteViewPanelIsland(android.content.Context c){super(c);}}'''
files['com/zte/feature/dynamicisland/AppIsland.java']='''package com.zte.feature.dynamicisland;import android.content.*;import android.widget.*;
public class AppIsland extends DynamicPermanentIsland{public TextView mDisplayText,mDisplaySecondText;public ImageView mDisplayIcon,mDisplaySmallIcon;
public AppIsland(Context c){super(c);mDisplayText=new TextView(c);mDisplaySecondText=new TextView(c);mDisplayIcon=new ImageView(c);mDisplaySmallIcon=new ImageView(c);}
public void initAppIsland(String a,String b,String c,byte[] d,byte[] e,String f,byte[] g,String h){}public void initPanelIsland(String a,String b){}
public void setDisplayText(String t){mDisplayText.setText(t);}}'''
files['android/view/LayoutInflater.java']='''package android.view;import android.content.*;import android.content.res.*;import com.zte.feature.dynamicisland.*;
public class LayoutInflater{Context c;LayoutInflater(Context c){this.c=c;}public static LayoutInflater from(Context c){return new LayoutInflater(c);}
public View inflate(int id,Object p){String n=Resources.names.get(id);if(n.equals("remote_view_island_layout"))return new RemoteViewIsland(c);
if(n.equals("remote_view_panel_island_layout"))return new RemoteViewPanelIsland(c);if(n.equals("remote_view_small_island_layout"))return new android.widget.FrameLayout(c);return new AppIsland(c);}}'''
for name in ['IslandDownloadConfig','IslandDownloadPolicy','DuoIslandPolicy']:
    files['ls/augment/com/'+name+'.java']=(SRC/(name+'.java')).read_text(encoding='utf-8')
files['ls/augment/com/ConfigSchema.java']='package ls.augment.com;public class ConfigSchema{public static final String NATIVE_ISLAND_SELECTED="old";}'
files['ls/augment/com/SystemUiOptions.java']='package ls.augment.com;public class SystemUiOptions{public static final String ISLAND="duo",ISLAND_APP_STYLE="style";}'
files['ls/augment/com/hook/DuoPanelShape.java']='package ls.augment.com.hook; class DuoPanelShape{static void attach(android.view.View panel,Object root){}}'
files['android/widget/FrameLayout.java']=files['android/widget/FrameLayout.java'].replace('public void setMarginEnd','public void setMarginStart(int v){}public void setMarginEnd')
files['android/view/View.java']=files['android/view/View.java'].replace('public boolean isShown()', '''public interface OnLayoutChangeListener{void layout(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob);}
public int width; public void addOnLayoutChangeListener(OnLayoutChangeListener l){}public int getWidth(){return width;}
public int getCompoundPaddingLeft(){return 0;}public int getCompoundPaddingRight(){return 0;}public boolean isShown()''')
files['android/text/TextUtils.java']=files['android/text/TextUtils.java'].replace('public enum','public static boolean equals(CharSequence a,CharSequence b){return java.util.Objects.equals(a,b);}public static CharSequence ellipsize(String s,TextPaint p,float room,TruncateAt at){return s.subSequence(0,Math.min(s.length(),(int)(room/9)));}public enum')
files['android/os/Parcelable.java']='package android.os;public interface Parcelable{}'
files['android/os/Bundle.java']=files['android/os/Bundle.java'].replace('public CharSequence','public android.os.Parcelable[] getParcelableArray(String k){return (android.os.Parcelable[])get(k);}public CharSequence')
files['android/app/Person.java']='package android.app;public class Person{public CharSequence getName(){return "Sender";}}'
files['android/app/Notification.java']=files['android/app/Notification.java'].replace('EXTRA_TITLE="title"','EXTRA_MESSAGES="messages",EXTRA_TITLE="title"').replace('public static class Action','public static class MessagingStyle{public static class Message{public Person getSenderPerson(){return new Person();}public static java.util.List<Message> getMessagesFromBundleArray(android.os.Parcelable[] p){return java.util.List.of(new Message());}}}public static class Action')
files['android/text/TextUtils.java']=files['android/text/TextUtils.java'].replace('TruncateAt{END}', 'TruncateAt{END,MARQUEE}')
files['android/widget/TextView.java']=files['android/widget/TextView.java'].replace('public void setMaxLines', 'public boolean selected;public int repeats;public void setSelected(boolean v){selected=v;}public void setMarqueeRepeatLimit(int n){repeats=n;}public void setMaxLines')
files['android/app/Notification.java']=files['android/app/Notification.java'].replace('public Person getSenderPerson()', 'public CharSequence getText(){return "Message body";}public Person getSenderPerson()')
files['android/app/Notification.java']=files['android/app/Notification.java'].replace('EXTRA_TITLE="title"','EXTRA_BIG_TEXT="bigText",EXTRA_TITLE="title"')
for name in ['DuoCompactText','IslandCompactWidth','DuoNotificationCards','DuoDownloadPanel','IslandDownloadSource','NativeIslandPanelCompat','IslandPanelGuard']:
    files['ls/augment/com/hook/'+name+'.java']=(SRC/'hook'/(name+'.java')).read_text(encoding='utf-8')
files['ls/augment/com/hook/FeatureRuntimeLog.java']='package ls.augment.com.hook;class FeatureRuntimeLog{static void event(String s,String d){}static void state(String a,String b,String c){}static String failure(Throwable e){return e.getClass().getName();}}'
# Current shared collaborators; their policies have focused tests of their own.
files['ls/augment/com/hook/IslandEvent.java']=(SRC/'hook/IslandEvent.java').read_text('utf-8')
files['ls/augment/com/hook/Native12IslandStyle.java']='package ls.augment.com.hook;import android.content.Context;import android.widget.TextView;class Native12IslandStyle{static final int SMALL_ICON=20,PANEL_ICON=48,TEXT_GAP=12,TITLE=17,DETAIL=13,COMPACT_TEXT=14;static boolean night(Context c){return false;}static void action(android.widget.Button b){}static void compact(android.view.View v){}static void panel(android.view.View v){}static void text(TextView v,int size,boolean primary){}}'
files['ls/augment/com/hook/IslandFrameProof.java']='package ls.augment.com.hook;class IslandFrameProof{static boolean drawn;static android.view.View last;boolean confirm(android.view.View v,Object revision,Runnable callback){last=v;return drawn;}void clear(){}}'
files['android/view/View.java']=files['android/view/View.java'].replace('VISIBLE=0,GONE=8','VISIBLE=0,INVISIBLE=4,GONE=8').replace('public interface OnClickListener','public interface OnLongClickListener{boolean onLongClick(View v);}public void setOnLongClickListener(OnLongClickListener l){}public void setContentDescription(CharSequence s){}public interface OnClickListener')
files['ls/augment/com/hook/TestUnifiedCards.java']='''package ls.augment.com.hook;import java.util.*;import android.content.*;import android.os.*;import android.service.notification.*;import ls.augment.com.*;import com.zte.feature.dynamicisland.*;
public class TestUnifiedCards{static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
public static void main(String[] args)throws Exception{
DuoNotificationCards.install(new AugmentModule(),TestUnifiedCards.class.getClassLoader());
android.widget.TextView label=new android.widget.TextView(new Context());DuoCompactText format=new DuoCompactText(label);
label.width=40;format.bind("manual.pdf","62%");check("62%".equals(label.getText()),"narrow layout keeps metric");
label.width=180;format.bind("manual.pdf","62%");check("manual.pdf  62%".equals(label.getText()),"wide layout includes name");
android.app.Notification msg=new android.app.Notification();msg.extras.put("title","Topic");check("Topic".equals(DuoCompactText.senderOrTitle(msg,"App")),"plain title lost");
msg.extras.put("messages",new android.os.Parcelable[1]);check("Sender".equals(DuoCompactText.senderOrTitle(msg,"App")),"latest sender lost");
check("Sender  ·  Message body".equals(DuoCompactText.messageSummary(msg,"App")),"message text missing");
String longMessage="消息".repeat(200);format.bind(longMessage,"");check(label.selected&&label.repeats==-1&&label.getText().equals(longMessage),"full message must remain available to marquee");
Context ordinaryContext=new Context();OrdinaryManager ordinary=new OrdinaryManager();
android.view.View bar=new android.view.View(ordinaryContext);
DuoNotificationCards ordinaryHost=new DuoNotificationCards(ordinaryContext,TestUnifiedCards.class.getClassLoader(),ordinary,false,()->{},bar);
check(ordinaryHost.show("Task","Detail","Label",null),"ordinary card missing");
DynamicPermanentIsland owned=ordinary.current;ordinary.mDynamicPanelShowing=true;ordinary.mDynamicPanelClosing=true;
ordinaryHost.close();
check(ordinary.removes==0,"withdrawal started a second close while native animation was running");
check(DuoNotificationCards.closingStatusBar(ordinary)==bar,"withdrawal lost the ordinary status bar during its fade");
Object[] ending={owned,false,false};
check(SystemUiAdapter.close.apply(new OrdinaryManager(),ending,null)==SystemUiAdapter.PASS,"foreign manager callback overridden");
check(SystemUiAdapter.close.apply(ordinary,new Object[]{new DynamicPermanentIsland(ordinaryContext),true,false},null)==SystemUiAdapter.PASS,"foreign card callback overridden");
check(SystemUiAdapter.close.apply(ordinary,ending,null)==null,"retired owned view reached null-root callback");
check(!ordinary.mDynamicPanelShowing&&!ordinary.mDynamicPanelClosing&&ordinary.current==null&&ordinary.removes==1,"ordinary close did not finish withdrawal");
for(Runnable pending:new ArrayList<>(Handler.tasks))pending.run();
for(boolean download:new boolean[]{false,true}){
 OrdinaryManager m=new OrdinaryManager();int[] openedSource={0};DuoNotificationCards h=new DuoNotificationCards(ordinaryContext,TestUnifiedCards.class.getClassLoader(),m,false,()->openedSource[0]++,bar);
 if(download){IslandDownloadPolicy<StatusBarNotification> p=new IslandDownloadPolicy<>();StatusBarNotification n=new StatusBarNotification("task",1,2);
  p.update("task","channel",1,2,true,false,12,100,n);check(h.showDownload(p.get("task"),null,"App",(e,i)->{}),"download scene prepared");}
 else check(h.show("Title","Body","Label",null),"notice scene prepared");
 DynamicPermanentIsland scene=m.current;
 check(SystemUiAdapter.hold.apply(m,new Object[0],null)==null&&openedSource[0]==1&&!m.mDynamicPanelShowing,"ordinary long press opens source only");
 h.expand();check(m.nativeLongs==0&&IslandPanelGuard.owns(m,scene),"tap expansion uses native animation entry");
 m.finish();check(!m.mDynamicPanelShowing&&m.mDynamicPanelContainer.getChildCount()==0,"long press closes without manager hook");
 check(SystemUiAdapter.show.apply(m,new Object[0],null)==SystemUiAdapter.PASS,"ordinary show retains original call");
 m.showPermanentPanelIsland();check(SystemUiAdapter.close.apply(m,new Object[]{scene,false,false},null)==null,"manager close route shares captured ownership");
 check(!IslandPanelGuard.pending(m,scene),"manager close route finishes the same transition");
 m.finish();check(m.opens==2&&m.windowUpdates==2,"common show safely closes second expansion without duplicate completion");
 h.expand();check(m.opens==3,"direct expansion preserved");m.mDynamicPanelClosing=true;h.close();
 m.finish();check(m.removes==1&&m.current==null,"withdrawal ends through captured callback after release");
 for(Runnable pending:new ArrayList<>(Handler.tasks))pending.run();
}
for(boolean full:new boolean[]{false,true}){
Context c=new Context();Manager m=full?new ChildManager():new OrdinaryManager();Object foreign=new Object();m.mAppIslandList.put("foreign",foreign);
int[] opened={0};DuoNotificationCards host=new DuoNotificationCards(c,TestUnifiedCards.class.getClassLoader(),m,full,()->opened[0]++,null);
IslandDownloadPolicy<StatusBarNotification> p=new IslandDownloadPolicy<>();StatusBarNotification n=new StatusBarNotification("task",1,2);
p.update("task","channel",1,2,true,false,12,100,n);
check(host.showDownload(p.get("task"),null,"App",(e,i)->{}),"create failed");Object current=m.current;
check(current!=null&&m.adds==1,"native host did not receive card");
if(full){m.current=null;m.mTempIsland=(DynamicPermanentIsland)current;m.mDynamicPanelShowing=true;IslandFrameProof.drawn=true;
check(host.confirmedFrame("updated",()->{})&&IslandFrameProof.last==SystemUiAdapter.field(host,"panel"),"detached compact must confirm its owned visible expanded panel");
m.mTempIsland=null;check(!host.confirmedFrame("unowned",()->{}),"unowned panel reused frame proof");m.mDynamicPanelShowing=false;m.current=(DynamicPermanentIsland)current;IslandFrameProof.drawn=false;}
if(full){m.consumeThrottle=true;host.expand();check(m.nativeExpansions==1&&m.throttleCalls==1,"fullscreen expansion must consume OEM throttle exactly once");m.consumeThrottle=false;m.blocked=false;}
p.update("task","channel",1,3,true,false,45,100,n);check(host.showDownload(p.get("task"),null,"App",(e,i)->{}),"update failed");
check(m.current==current&&m.adds==1,"update recreated native card");check(m.mAppIslandList.get("foreign")==foreign,"native card replaced");
StatusBarNotification message=new StatusBarNotification("message",2,0);message.notification.flags=0;
check(host.showNotice(message,null,"Chat",(s,pi)->{}),"ordinary message lost its OEM panel");
Object tap=SystemUiAdapter.tap.apply(m,new Object[0],null),hold=SystemUiAdapter.hold.apply(m,new Object[0],null);
check(opened[0]==1&&(full?tap==SystemUiAdapter.PASS&&hold==null:tap==null&&hold==null),"ordinary/fullscreen open and native expansion gestures crossed");
m.blocked=true;SystemUiAdapter.hold.apply(m,new Object[0],null);
check(opened[0]==1,"OEM forceNotClick gate bypassed");m.blocked=false;
if(!full){m.mDynamicPanelShowing=true;host.showDownload(p.get("task"),null,"App",(e,i)->{});
check(m.windowUpdates==1&&m.mDynamicIslandContainer.getLayoutParams().height==316,"expanded ordinary panel height includes native outer padding");m.mDynamicPanelShowing=false;}
check(Collections.frequency(Handler.tasks,SystemUiAdapter.field(host,"pulse"))<=1,"multiple heartbeat loops");
host.hide();check(m.current==null&&m.removes==1,"remove failed");check(!Handler.tasks.contains(SystemUiAdapter.field(host,"pulse")),"removed activity kept heartbeat");
check(m.mAppIslandList.size()==1&&m.mAppIslandList.get("foreign")==foreign,"remove touched native source");
host.close();check(!host.showDownload(p.get("task"),null,"App",(e,i)->{}),"closed host republished");
android.content.res.Resources.missing="app_island_layout";boolean missing=false;
try{new DuoNotificationCards(c,TestUnifiedCards.class.getClassLoader(),m,full,()->{},null);}catch(IllegalStateException expected){missing=true;}
check(missing&&m.adds==1,"missing layout mutated native state");android.content.res.Resources.missing="";
}
for(boolean a:new boolean[]{false,true})for(boolean b:new boolean[]{false,true})check(DuoIslandPolicy.migratedEnabled(a,b)==(a||b),"migration lost selection");
Map<String,String> updates=new HashMap<>(),next=new HashMap<>();updates.put("old","1");DuoIslandPolicy.normalizeSelection(updates,next);
check("1".equals(next.get("duo"))&&"0".equals(next.get("old")),"legacy alias not consumed");
updates.clear();updates.put("duo","0");updates.put("old","1");DuoIslandPolicy.normalizeSelection(updates,next);
check("0".equals(next.get("duo")),"legacy alias overrode explicit unified OFF");
System.out.println("PASS production unified cards and migration: "+checks+" assertions; "+args[0]);}}
'''
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
for shape in ['old','new','identity_flags']:
    variant=dict(files)
    init='public void initIsland(String a,String b,'+('Intent i,' if shape=='new' else '')+'String c,int d){}'
    if shape=='identity_flags':
        init='public void initIsland(String sender,String id,String original,Intent intent,String action,int style,boolean fullscreen,boolean keyguard){if(!"ls.augment.com".equals(sender)||!"ls.augment.com_duo_notification".equals(id)||!"duo_notification".equals(original)||intent!=null||action!=null||style!=1||fullscreen||keyguard)throw new AssertionError("identity/visibility flags changed");}'
    variant['com/zte/feature/dynamicisland/RemoteViewIsland.java']='''package com.zte.feature.dynamicisland;import android.content.*;import android.view.*;
class IslandParent extends DynamicPermanentIsland{public IslandParent(Context c){super(c);}'''+init+'''
DynamicPermanentIsland panel;public void setPanelIsland(DynamicPermanentIsland p){panel=p;}public DynamicPermanentIsland getPanelIsland(){return panel;}public void setSmallIsland(View v){}public boolean handleIslandClick(){return false;}}
public class RemoteViewIsland extends IslandParent{public RemoteViewIsland(Context c){super(c);}}
'''
    variant['ls/augment/com/hook/Manager.java']='''package ls.augment.com.hook;import java.util.*;import android.view.*;import com.zte.feature.dynamicisland.*;
public class Manager{public Map<String,Object> mAppIslandList=new HashMap<>();public DynamicPermanentIsland current;public int adds,removes,beats,windowUpdates;
public boolean mDynamicPanelShowing;public DynamicPermanentIsland mTempIsland;public View mDynamicIslandContainer=new View(new android.content.Context());
public boolean blocked,consumeThrottle;public int throttleCalls,nativeExpansions;
public boolean forceNotClick(){throttleCalls++;boolean result=blocked;if(consumeThrottle)blocked=true;return result;}
public void onClick(){if(!forceNotClick())nativeExpansions++;}public void onLongClick(){}
public Manager(){mDynamicIslandContainer.setLayoutParams(new ViewGroup.LayoutParams(-1,200));}
public void updateDynamicWindowHeightParams(boolean on){windowUpdates++;}
public void addPermanentIslandFullScreen(DynamicPermanentIsland i,boolean a){addPermanentIslandInner(i);}
public void addPermanentIslandInner(DynamicPermanentIsland i){adds++;current=i;i.parent=this;}
public void removePermanentIsland(DynamicPermanentIsland i){removes++;i.parent=null;if(current==i)current=null;}
public void handleRemoveIsland(String id){Object i=mAppIslandList.remove(id);if(i instanceof DynamicPermanentIsland)removePermanentIsland((DynamicPermanentIsland)i);}
public DynamicPermanentIsland getPermanentIsland(){return current;}public void updatePanelHeight(View v){}
'''+('public void handleIslandHeartBeat(String id){beats++;}public void markIslandOnTime(String id){}public void reportIslandStatus(DynamicPermanentIsland i,int s){}public void setIslandShowing(String id,boolean b){}' if shape=='new' else '')+'}\nclass ChildManager extends Manager{}'
    variant['ls/augment/com/hook/OrdinaryManager.java']='''package ls.augment.com.hook;
import android.view.*;import android.widget.*;import com.zte.feature.dynamicisland.DynamicPermanentIsland;
interface OrdinaryCallback{void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland i,boolean r,boolean d);}
public class OrdinaryManager extends Manager implements OrdinaryCallback{
public View mDynamicIslandPanelRoot,mDynamicIslandRoot=mDynamicIslandContainer;
public boolean mDynamicPanelClosing;public DynamicPermanentIsland mTempIsland;
public ViewGroup mDynamicPanelContainer=new FrameLayout(new android.content.Context());
public Object mWindowManager=new Object(),mParams=new Object();
public int opens,nativeLongs;public Animation mDynamicAnimation=new Animation(this);
public static class Factory{public OrdinaryCallback mCallback;Factory(OrdinaryCallback c){mCallback=c;}}
public static class Animation{public Factory mPermanentAnimation;Animation(OrdinaryCallback c){mPermanentAnimation=new Factory(c);}}
public void showPermanentPanelIsland()throws ReflectiveOperationException{if(mDynamicPanelShowing)return;opens++;mDynamicPanelShowing=true;
 mDynamicPanelContainer.addView((View)SystemUiAdapter.call(current,"getPanelIsland"),null);}
@Override public void onLongClick(){nativeLongs++;try{showPermanentPanelIsland();}catch(Exception e){throw new RuntimeException(e);}}
public void finish(){mDynamicAnimation.mPermanentAnimation.mCallback.onPermanentIslandPanelCloseAnimationEnd(current,false,false);}
public void removePermanentIslandInner(DynamicPermanentIsland i){removePermanentIsland(i);}
public void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland i,boolean r,boolean d){throw new AssertionError("null fullscreen root");}
}'''
    from island_panel_test_support import add_status_bar_support
    add_status_bar_support(variant)
    with tempfile.TemporaryDirectory(prefix='duo-unified-cards-') as tmp:
        folder=Path(tmp)
        for name,text in variant.items():
            target=folder/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(text,encoding='utf-8')
        subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
        subprocess.run([str(java/'java.exe'),'-cp',str(folder),'ls.augment.com.hook.TestUnifiedCards',shape],check=True)
