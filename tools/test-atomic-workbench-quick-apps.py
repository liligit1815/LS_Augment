"""Execute production Activity quick-app row callbacks against offline UI boundaries.

The tested methods and click listeners are extracted verbatim from the current
Activity. Android view rendering and ROOT requests are controlled doubles; the
real workspace model verifies that appearance changes preserve window identity.
No device, application, or user data is accessed.
"""
from pathlib import Path
import runpy
import subprocess
import tempfile

LIFECYCLE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))
SUPPORT = LIFECYCLE["SUPPORT"]
SRC = SUPPORT["SRC"]
member = LIFECYCLE["member"]

SOURCES = {
    "android/content/Context.java": "package android.content;public class Context {public Object getResources(){return null;}}",
    "android/content/ComponentName.java": r'''package android.content;public final class ComponentName {
 final String pkg,cls;public ComponentName(String pkg,String cls){this.pkg=pkg;this.cls=cls;}
 public String getPackageName(){return pkg;}public String flattenToString(){return pkg+"/"+cls;}
 public static ComponentName unflattenFromString(String value){int split=value.indexOf('/');return split<0?null:new ComponentName(value.substring(0,split),value.substring(split+1));}
}''',
    "android/graphics/drawable/Drawable.java": r'''package android.graphics.drawable;public class Drawable {
 public ConstantState getConstantState(){return null;}public static class ConstantState {public Drawable newDrawable(Object resources){return new Drawable();}}
}''',
    "android/view/Gravity.java": "package android.view;public class Gravity {public static final int CENTER=17,CENTER_VERTICAL=16;}",
    "android/view/View.java": r'''package android.view;import android.content.Context;public class View {
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8,IMPORTANT_FOR_ACCESSIBILITY_NO=2;
 public interface OnClickListener {void onClick(View value);}public OnClickListener click;public Object tag,background,layout;public CharSequence description;public boolean enabled=true;public int visibility=VISIBLE;
 public View(Context context){}public void setTag(Object value){tag=value;}public Object getTag(){return tag;}
 public void setVisibility(int value){visibility=value;}public int getVisibility(){return visibility;}
 public void setEnabled(boolean value){enabled=value;}public boolean isEnabled(){return enabled;}
 public void setBackground(Object value){background=value;}public void setContentDescription(CharSequence value){description=value;}
 public void setTooltipText(CharSequence value){}public void setPadding(int l,int t,int r,int b){}
 public void setMinimumWidth(int value){}public void setMinimumHeight(int value){}public void setImportantForAccessibility(int value){}
 public void setOnClickListener(OnClickListener value){click=value;}public void clickEvenIfHidden(){if(click!=null)click.onClick(this);}
 public void setLayoutParams(Object value){layout=value;}public Object getLayoutParams(){return layout;}public void bringToFront(){}public void clearFocus(){}
}''',
    "android/widget/LinearLayout.java": r'''package android.widget;import android.content.Context;import android.view.View;import java.util.*;public class LinearLayout extends View {
 public static final int HORIZONTAL=0,VERTICAL=1;public final List<View> children=new ArrayList<>();public LinearLayout(Context context){super(context);}
 public void setOrientation(int value){}public void setGravity(int value){}public void addView(View child){children.add(child);}
 public void addView(View child,Object layout){child.setLayoutParams(layout);children.add(child);}public void removeAllViews(){children.clear();}
 public int getChildCount(){return children.size();}public View getChildAt(int index){return children.get(index);}
 public static class LayoutParams {public int width,height,leftMargin,rightMargin,topMargin,bottomMargin;public float weight;public LayoutParams(int w,int h){width=w;height=h;}public LayoutParams(int w,int h,float f){this(w,h);weight=f;}}
}''',
    "android/widget/HorizontalScrollView.java": r'''package android.widget;import android.content.Context;public class HorizontalScrollView extends LinearLayout {
 public HorizontalScrollView(Context context){super(context);}public void setHorizontalScrollBarEnabled(boolean value){}public void setFillViewport(boolean value){}
}''',
    "android/widget/ImageView.java": r'''package android.widget;import android.content.Context;import android.view.View;public class ImageView extends View {
 public enum ScaleType {FIT_CENTER,CENTER_CROP}public ImageView(Context context){super(context);}public void setImageDrawable(Object value){}
 public void setImageResource(int value){}public void setColorFilter(int value){}public void setScaleType(ScaleType value){}
}''',
    "android/widget/ImageButton.java": "package android.widget;import android.content.Context;public class ImageButton extends ImageView {public ImageButton(Context context){super(context);}}",
    "android/widget/TextView.java": r'''package android.widget;import android.content.Context;import android.view.View;public class TextView extends View {
 public String text="";public TextView(Context context){super(context);}public void setGravity(int value){}public void setMaxLines(int value){}
 public void setEllipsize(Object value){}public void setText(CharSequence value){text=value.toString();}public CharSequence getText(){return text;}
}''',
    "android/widget/EditText.java": "package android.widget;import android.content.Context;public class EditText extends TextView {public EditText(Context context){super(context);}}",
    "android/text/TextUtils.java": "package android.text;public class TextUtils {public enum TruncateAt {END}}",
    "android/os/Bundle.java": SUPPORT["BUNDLE"],
    "ls/augment/com/AtomicWorkbenchConfig.java": "package ls.augment.com;final class AtomicWorkbenchConfig {static final String QUICK_OPEN_APPS=\"quick\",SHOW_MEDIA=\"media\",EMPTY_SIDE_SLOTS=\"slots\";}",
    "ls/augment/com/AppConfig.java": r'''package ls.augment.com;import java.util.*;final class AppConfig {
 final Map<String,Boolean> values=new HashMap<>();boolean getBoolean(String key){return Boolean.TRUE.equals(values.get(key));}int getInt(String key,int fallback){return fallback;}
}''',
    "ls/augment/com/AtomicWorkbenchAppRepository.java": r'''package ls.augment.com;import android.content.ComponentName;import android.graphics.drawable.Drawable;final class AtomicWorkbenchAppRepository {
 static final class App {final ComponentName component;final String label,searchKey;Drawable icon;
  App(String pkg){component=new ComponentName(pkg,pkg+".Main");label=pkg;searchKey=pkg;}String key(){return component.flattenToString();}}
}''',
    "ls/augment/com/UiKit.java": r'''package ls.augment.com;import android.content.Context;import android.widget.TextView;final class UiKit {
 final Context context;int text=1,accent=2,accentContainer=3,card=4;UiKit(Context c){context=c;}int dp(int value){return value;}int surfaceRadiusDp(int value){return value;}
 Object round(int color,int radius){return new Object();}TextView text(String value,int size,int color,boolean bold){TextView result=new TextView(context);result.setText(value);return result;}
}''',
    "ls/augment/com/AtomicWorkbenchTransfer.java": r'''package ls.augment.com;import android.view.View;import java.util.function.Supplier;
final class AtomicWorkbenchTransfer {void bindDropTarget(View target,Supplier<String> destination){}void refreshAppearance(UiKit ui){}}
''',
    "ls/augment/com/R.java": "package ls.augment.com;final class R {static final class drawable {static final int ice_app_window=1;}}",
}

HEAD = r'''package ls.augment.com;
import android.content.*;import android.graphics.drawable.Drawable;import android.view.*;import android.widget.*;import android.text.TextUtils;import java.util.*;
public final class QuickAppsHarness extends Context {
 static int cases,checks;static final int COUNT=4;
 static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
 interface Case {void run();}static void test(String name,Case body){body.run();cases++;System.out.println("PASS production quick-apps: "+name);}
 final UiKit ui=new UiKit(this);final AppConfig config=new AppConfig();final AtomicWorkbenchWorkspaceModel model=new AtomicWorkbenchWorkspaceModel();
 final AtomicWorkbenchTransfer transfer=new AtomicWorkbenchTransfer();
 final ArrayList<AtomicWorkbenchAppRepository.App> apps=new ArrayList<>();
 static final class Slot {final int id,displayId,taskId;boolean retainedEmptyTaskDisplay;String topComponent="";final Object surface=new Object();final ArrayList<String> runningPackages=new ArrayList<>();Slot(int id){this.id=id;displayId=100+id;taskId=1000+id;}}
 final Slot[] slots={new Slot(0),new Slot(1),new Slot(2),new Slot(3)};
 final LinearLayout root=new LinearLayout(this),mediaCard=new LinearLayout(this);HorizontalScrollView appStripScroll;LinearLayout appStrip;
 boolean quickOpenApps,appsLoaded=true,showMedia,mediaEnabled,mediaRetryRequired,appListRequested,nativeHomePending,interactable=true;
 int emptySideSlots=3,launches,homeCalls,lastHomeSide=-99,keyboardHides;String stripSignature="";AtomicWorkbenchAppRepository.App launched;
 QuickAppsHarness(boolean enabled){config.values.put(AtomicWorkbenchConfig.QUICK_OPEN_APPS,enabled);quickOpenApps=enabled;
  apps.add(new AtomicWorkbenchAppRepository.App("first"));apps.add(new AtomicWorkbenchAppRepository.App("second"));createAppStrip(root);renderStrip();}
 boolean canInteract(){return interactable;}void launchApp(AtomicWorkbenchAppRepository.App app,int task){launches++;launched=app;check(task==-1,"quick icon requested original-task takeover");}
 void openAppOrShelvedTask(AtomicWorkbenchAppRepository.App app){launchApp(app,-1);}
 void showNativeHome(int side){homeCalls++;lastHomeSide=side;}void hideHostKeyboard(){keyboardHides++;}
 void stopMedia(){}void scheduleMedia(){}void renderWorkspace(){renderStrip();}
 void toggle(boolean enabled){config.values.put(AtomicWorkbenchConfig.QUICK_OPEN_APPS,enabled);refreshAppearance();}
 String state(){StringBuilder value=new StringBuilder().append(model.mainWindowId()).append(':').append(model.desktopVisible());
  for(int id=0;id<COUNT;id++)value.append('|').append(id).append(':').append(model.component(id)).append(':').append(model.hasWindow(id)).append(':').append(slots[id].displayId).append(':').append(slots[id].taskId).append(':').append(System.identityHashCode(slots[id].surface));
  for(int side=0;side<3;side++)value.append('/').append(model.sideWindowId(side));return value.toString();}
'''

TEST = r'''
 public static void main(String[] args){
  test("enabled row contains only application icons with working production listeners",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);check(h.appStripScroll.getVisibility()==View.VISIBLE&&h.appStripScroll.isEnabled(),"enabled row hidden");
   check(h.root.getChildCount()==1&&h.appStripScroll.getChildAt(0)==h.appStrip,"row was not attached");
   check(h.appStrip.getChildCount()==h.apps.size(),"row contains an extra app-list button");
   for(int i=0;i<h.apps.size();i++){View tile=h.appStrip.getChildAt(i);check(tile.getTag().equals("atomic-workbench-quick-app:"+h.apps.get(i).key()),"non-app control in icon row");
    check(((LinearLayout)tile).getChildCount()==1,"compact icon unexpectedly contains a second control");tile.clickEvenIfHidden();check(h.launched==h.apps.get(i),"actual tile listener dispatched wrong app");}
   check(h.launches==2&&h.homeCalls==0,"quick icons dispatched wrong operation");
  });
  test("disabled row removes every icon and rejects detached old icon clicks",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);View stale=h.appStrip.getChildAt(0);h.toggle(false);
   check(h.appStripScroll.getVisibility()==View.GONE&&!h.appStripScroll.isEnabled()&&h.appStrip.getChildCount()==0,"disabled row retains visible controls");
   stale.clickEvenIfHidden();check(h.launches==0&&h.homeCalls==0,"detached icon bypassed disabled setting");
   h.toggle(true);check(h.appStrip.getChildCount()==2&&h.appStripScroll.getVisibility()==View.VISIBLE,"reenabled row did not rebuild");h.appStrip.getChildAt(1).clickEvenIfHidden();check(h.launches==1&&h.launched==h.apps.get(1),"rebuilt icon not functional");
  });
  test("saved configuration disables an old click before the UI refresh arrives",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);View old=h.appStrip.getChildAt(0);h.config.values.put(AtomicWorkbenchConfig.QUICK_OPEN_APPS,false);old.clickEvenIfHidden();
   check(h.launches==0&&h.quickOpenApps,"stale UI state bypassed saved setting");
  });
  test("local disabled state also rejects a stale icon while saved state changes",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);View old=h.appStrip.getChildAt(0);h.quickOpenApps=false;old.clickEvenIfHidden();check(h.launches==0,"local disabled state bypassed");
  });
  test("empty plus opens native HOME with either switch state and preserves side routing",()->{
   for(boolean enabled:new boolean[]{false,true}){QuickAppsHarness h=new QuickAppsHarness(enabled);h.openEmptyWorkspace(h.model.mainWindowId());check(h.homeCalls==1&&h.lastHomeSide==-1,"main plus did not request native HOME");
    for(int side=0;side<3;side++){h.openEmptyWorkspace(h.model.sideWindowId(side));check(h.lastHomeSide==side,"side plus routed to wrong HOME slot");}
    check(h.homeCalls==4&&h.launches==0&&!h.appListRequested,"plus was replaced by application selection");}
  });
  test("occupied or noninteractive workspace plus cannot launch or replace a window",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);var plan=h.model.planLaunch(h.apps.get(0).key());check(h.model.commitLaunch(plan),"fixture did not occupy main");String before=h.state();h.openEmptyWorkspace(plan.windowId);
   h.interactable=false;h.openEmptyWorkspace(h.model.sideWindowId(0));check(h.homeCalls==0&&h.launches==0&&before.equals(h.state()),"plus replaced active window or bypassed interaction gate");
  });
  test("appearance toggle preserves all existing component display task and Surface identities",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);for(var app:h.apps){var plan=h.model.planLaunch(app.key());check(h.model.commitLaunch(plan),"fixture app plan rejected");h.slots[plan.windowId].runningPackages.add(app.component.getPackageName());}
   h.model.setHostedWindow(h.model.sideWindowId(1),true);String before=h.state();
   for(boolean enabled:new boolean[]{false,true,false,true}){h.toggle(enabled);check(before.equals(h.state()),"setting toggle changed a live workspace identity");check(h.launches==0&&h.homeCalls==0,"setting toggle launched or refocused HOME");}
   check(h.appStrip.getChildCount()==h.apps.size(),"toggle lost application icons");
  });
  test("foreground main precedes side foregrounds and remaining apps",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);h.apps.add(new AtomicWorkbenchAppRepository.App("third"));h.apps.add(new AtomicWorkbenchAppRepository.App("fourth"));
   var first=h.apps.get(0);var second=h.apps.get(1);var third=h.apps.get(2);var fourth=h.apps.get(3);
   check(h.model.commitLaunch(h.model.planLaunch(first.key())),"first launch");check(h.model.commitLaunch(h.model.planLaunch(second.key())),"second launch");
   int main=h.model.mainWindowId(),side=h.model.sideWindowId(0);h.slots[main].topComponent=third.key();h.slots[side].topComponent=first.key();
   h.slots[main].runningPackages.add("third");h.slots[main].runningPackages.add("second");h.slots[side].runningPackages.add("first");
   check(h.quickAppOrder().equals(Arrays.asList(third,first,second,fourth)),"actual main/side foreground not before background running and idle");
   h.renderStrip();check(h.appStrip.getChildAt(0).getTag().equals("atomic-workbench-quick-app:"+third.key()),"render ignored actual foreground");
   String signature=h.appsSignature();h.model.promote(side);check(!signature.equals(h.appsSignature()),"role exchange did not invalidate signature");h.renderStrip();
   check(h.quickAppOrder().equals(Arrays.asList(first,third,second,fourth)),"promoted main did not move first");
  });
  test("native task changes invalidate row and package fallback resolves a non-launcher Activity",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);h.model.setHostedWindow(0,true);h.slots[0].topComponent="second/second.Route";
   check(h.quickAppOrder().get(0)==h.apps.get(1),"non-launcher foreground was missed");String signature=h.appsSignature();h.slots[0].topComponent=h.apps.get(0).key();
   check(!signature.equals(h.appsSignature())&&h.quickAppOrder().get(0)==h.apps.get(0),"native navigation failed to update foreground");
   h.model.setHostedWindow(1,true);h.slots[1].topComponent=h.apps.get(0).key();check(new HashSet<>(h.quickAppOrder()).size()==h.apps.size(),"same app in multiple panes duplicated");
  });
  test("side foregrounds follow onscreen order and HOME does not promote a background app",()->{
   QuickAppsHarness h=new QuickAppsHarness(true);h.apps.add(new AtomicWorkbenchAppRepository.App("third"));
   check(h.model.commitLaunch(h.model.planLaunch(h.apps.get(1).key())),"launch second");h.slots[0].topComponent="launcher/launcher.Home";
   h.model.setHostedWindow(1,true);h.model.setHostedWindow(2,true);h.slots[1].topComponent=h.apps.get(2).key();h.slots[2].topComponent=h.apps.get(0).key();
   check(h.quickAppOrder().equals(Arrays.asList(h.apps.get(2),h.apps.get(0),h.apps.get(1))),"HOME incorrectly treated original app as current main foreground");
   h.slots[0].topComponent="";check(h.quickAppOrder().get(0)==h.apps.get(1),"missing observation should retain confirmed model app fallback");
  });
  System.out.println("QUICK APPS RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    activity = (SRC / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
    signatures = (
        "private void createAppStrip(LinearLayout root)", "private void renderStrip()",
        "private View appTile(AtomicWorkbenchAppRepository.App app, boolean compact)",
        "private String appsSignature()", "private int findRunningApp(AtomicWorkbenchAppRepository.App app)",
        "private ArrayList<AtomicWorkbenchAppRepository.App> quickAppOrder()", "private AtomicWorkbenchAppRepository.App findApp(String key)", "private AtomicWorkbenchAppRepository.App findDisplayApp(String component)",
        "private void openQuickApp(AtomicWorkbenchAppRepository.App app)",
        "private void openEmptyWorkspace(int id)", "private void refreshAppearance()",
    )
    sources = dict(SOURCES)
    sources["ls/augment/com/QuickAppsHarness.java"] = HEAD + "\n".join(member(activity, signature) for signature in signatures) + TEST
    with tempfile.TemporaryDirectory(prefix="lsa-workbench-quick-apps-") as temporary:
        work = Path(temporary)
        files = []
        for name, content in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            files.append(str(path))
        subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-d", str(work),
                        str(SRC / "AtomicWorkbenchWorkspaceModel.java"), str(SRC / "AtomicWorkbenchPoolTopology.java"), *files], check=True, timeout=60, env=SUPPORT["ENV"])
        subprocess.run([SUPPORT["JAVA"], "-cp", str(work), "ls.augment.com.QuickAppsHarness"], check=True, timeout=30, env=SUPPORT["ENV"])



# App display preferences: real model/App body; Android UI and reload are boundaries.
SOURCES['ls/augment/com/AtomicWorkbenchAppListModel.java']=(SRC/'AtomicWorkbenchAppListModel.java').read_text(encoding='utf-8')
_app_source=(SRC/'AtomicWorkbenchAppRepository.java').read_text(encoding='utf-8')
_app_body=member(_app_source,'static final class App extends AtomicWorkbenchAppListModel.Item')
_app_body=_app_body.rsplit('}',1)[0]+'App(String pkg){this(new ComponentName(pkg,pkg+".Main"),pkg,null,pkg,10001,1L);}}'
SOURCES['ls/augment/com/AtomicWorkbenchAppRepository.java']='package ls.augment.com;import android.content.ComponentName;import android.graphics.drawable.Drawable;import java.util.Locale;final class AtomicWorkbenchAppRepository{'+_app_body+'}'
HEAD+='\nAtomicWorkbenchAppListModel.State appPreferencesState=new AtomicWorkbenchAppListModel.State(0);AtomicWorkbenchAppListModel.Usage appUsage=AtomicWorkbenchAppListModel.Usage.unavailable("");long appCatalogRevision;int appReloadRequests;String appNotice;void showStatus(String text){appNotice=text;}void loadApps(){appReloadRequests++;}\n'


# Actual route ordering dependency; defaults stay at three visible sides.
HEAD=HEAD.replace('static final int COUNT=4;', 'static final int COUNT=AtomicWorkbenchWorkspaceModel.WINDOW_COUNT;')
HEAD=HEAD.replace('new Slot(0),new Slot(1),new Slot(2),new Slot(3)', 'new Slot(0),new Slot(1),new Slot(2),new Slot(3),new Slot(4),new Slot(5),new Slot(6),new Slot(7)')
HEAD+='\nint requestedSideCount=3;boolean sideCountPending;\n'+member((SRC/'AtomicWorkbenchActivity.java').read_text(encoding='utf-8'),'private int[] presentationOrder(')+'\n'
SOURCES['ls/augment/com/AtomicWorkbenchConfig.java']=SOURCES['ls/augment/com/AtomicWorkbenchConfig.java'].replace('EMPTY_SIDE_SLOTS="slots";', 'EMPTY_SIDE_SLOTS="slots",SIDE_COUNT="side_count";')

if __name__ == "__main__":
    main()
