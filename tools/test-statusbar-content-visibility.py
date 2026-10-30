"""Real content-hide policy and Duo host visibility: OEM islands, native fades, reparenting and overlays."""
from pathlib import Path
import os,subprocess,tempfile

ROOT=Path(__file__).resolve().parents[1];SRC=ROOT/'android/app/src/main/java/ls/augment/com/hook'
island=(SRC/'DynamicIslandHook.java').read_text(encoding='utf8')
start=island.index('boolean hostVisible()');end=island.index('{',start)+1;depth=1
while depth:
    depth+=(island[end]=='{')-(island[end]=='}');end+=1
host_visible=island[start:end]
S={
'android/content/Context.java':'package android.content;public class Context {}',
'android/content/res/Resources.java':'''package android.content.res;import java.util.*;public class Resources {
 public static Map<Integer,String> names=new HashMap<>();public String getResourceEntryName(int id){if(!names.containsKey(id))throw new IllegalArgumentException();return names.get(id);}}''',
'android/view/ViewParent.java':'package android.view;public interface ViewParent {}',
'android/view/View.java':'''package android.view;import java.util.*;import android.content.*;import android.content.res.*;
public class View implements ViewParent {
 public static final int NO_ID=-1,VISIBLE=0,INVISIBLE=4,GONE=8;public int id=NO_ID,visibility=VISIBLE,windowVisibility=VISIBLE;
 public float alpha=1,transition=1;public boolean attached=true;public Object tag;public ViewGroup parent;public List<OnAttachStateChangeListener> listeners=new ArrayList<>();
 public View(){}public View(String name){id=Resources.names.size()+1;Resources.names.put(id,name);}
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}
 public void detach(){attached=false;for(var l:new ArrayList<>(listeners))l.onViewDetachedFromWindow(this);if(parent!=null)parent.children.remove(this);parent=null;}
 public int getId(){return id;}public Object getTag(){return tag;}public ViewParent getParent(){return parent;}public Context getContext(){return new Context();}
 public Resources getResources(){return new Resources();}public float getTransitionAlpha(){return transition;}public void setTransitionAlpha(float v){transition=v;}
 public float getAlpha(){return alpha;}public boolean isAttachedToWindow(){return attached;}public int getWindowVisibility(){return windowVisibility;}
 public boolean isShown(){return visibility==VISIBLE&&(parent==null||parent.isShown());}
 public float visibleAlpha(){return isShown()?alpha*transition*(parent==null?1:parent.visibleAlpha()):0;}
}''',
'android/view/ViewGroup.java':'''package android.view;import java.util.*;public class ViewGroup extends View {
 public List<View> children=new ArrayList<>();public ViewGroup(){}public ViewGroup(String n){super(n);}
 public <T extends View>T add(T v){children.add(v);v.parent=this;v.attached=true;return v;}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}''',
'com/android/systemui/statusbar/phone/PhoneStatusBarView.java':'package com.android.systemui.statusbar.phone;public class PhoneStatusBarView extends android.view.ViewGroup {public PhoneStatusBarView(){super("status_bar");}}',
'com/android/systemui/statusbar/phone/KeyguardStatusBarView.java':'package com.android.systemui.statusbar.phone;public class KeyguardStatusBarView extends android.view.ViewGroup {}',
'ls/augment/com/SystemUiOptions.java':'package ls.augment.com;public class SystemUiOptions{public static final String PREFIX="ls_augment_rm_";}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import android.content.*;public class FeatureSettings {
 public static boolean hide;public static String diagnostic="";public static boolean enabled(Context c,String key){if(!key.equals("ls_augment_rm_statusbar_hide"))throw new AssertionError(key);return hide;}
 public static void diagnostic(Context c,String k,String v){diagnostic=v;}}''',
'ls/augment/com/hook/TestContentVisibility.java':'''package ls.augment.com.hook;
import android.view.*;import com.android.systemui.statusbar.phone.*;
public class TestContentVisibility {
 static int checks;static void yes(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static void frame(View v){StatusBarContentVisibility.apply(v);if(v instanceof ViewGroup)for(View child:((ViewGroup)v).children)frame(child);}
 static class ModernPhone extends PhoneStatusBarView {}static class DynamicIslandView extends ViewGroup {}static class MagicIslandView extends ViewGroup {}static class NativeIslandView extends ViewGroup {}
 static class NativeHost {boolean fade;boolean ownsStatusBarFade(){return fade;}}
 static class Duo {View host;NativeHost nativeHost=new NativeHost();Duo(View root){host=root;}/*HOST*/}
 public static void main(String[] args){
  for(PhoneStatusBarView root:new PhoneStatusBarView[]{new PhoneStatusBarView(),new ModernPhone()}){
   ViewGroup contents=root.add(new ViewGroup("status_bar_contents"));
   ViewGroup start=contents.add(new ViewGroup("status_bar_start_side_content")),end=contents.add(new ViewGroup("status_bar_end_side_content"));
   View clock=start.add(new View("clock")),notification=start.add(new View("notification_icon_area"));
   ViewGroup systems=end.add(new ViewGroup("system_icons"));View battery=systems.add(new View("battery"));
   View speed=end.add(new View("speed_group"));clock.alpha=.6f;clock.transition=.8f;
   ViewGroup duo=contents.add(new DynamicIslandView()),magic=contents.add(new MagicIslandView()),nativeIsland=contents.add(new NativeIslandView());
   View magicClock=magic.add(new View("clock"));Duo policy=new Duo(root);
   View metric=root.add(new View());metric.tag="ls_augment_metrics_thermal";
   View split=root.add(new View());split.tag="ls_augment_clock_line";
   View circle=root.add(new View());circle.tag="ls_augment_connectivity_circle";
   FeatureSettings.hide=true;frame(root);
   for(View v:new View[]{clock,notification,battery,speed,metric,split,circle})yes(v.visibleAlpha()==0,"only status content hidden");
   for(View v:new View[]{duo,magic,nativeIsland,magicClock,root,contents,start,end})yes(v.visibleAlpha()==1,"island/shared parent remains native");
   yes(clock.alpha==.6f&&clock.visibility==View.VISIBLE,"native alpha and lifecycle untouched");
   yes(policy.hostVisible(),"Duo host remains eligible when status content hidden");
   for(int i=0;i<30;i++)frame(root);FeatureSettings.hide=false;frame(root);
   yes(Math.abs(clock.visibleAlpha()-.48f)<.0001f,"repeated hide restores original multipliers");
   yes(clock.listeners.isEmpty()&&notification.visibleAlpha()==1,"disable releases ownership and restores notifications");
   FeatureSettings.hide=true;frame(root);clock.alpha=.2f;clock.transition=.35f;frame(root);FeatureSettings.hide=false;frame(root);
   yes(Math.abs(clock.visibleAlpha()-.07f)<.0001f,"restores latest native transition rather than stale alpha");
   FeatureSettings.hide=true;frame(root);root.alpha=0;
   yes(!policy.hostVisible()&&magic.visibleAlpha()==0,"OEM root/fullscreen policy remains authoritative");
   FeatureSettings.hide=false;frame(root);yes(root.alpha==0,"disabling content hide cannot force native root visible");root.alpha=1;
   root.visibility=View.INVISIBLE;yes(!policy.hostVisible(),"native root visibility still controls island");root.visibility=View.VISIBLE;
   root.attached=false;yes(!policy.hostVisible(),"detached host stays unavailable");root.attached=true;
   FeatureSettings.hide=true;frame(root);clock.detach();yes(clock.transition==.35f&&clock.listeners.isEmpty(),"detaching restores owned multiplier");
   ViewGroup foreign=new ViewGroup();foreign.add(clock);frame(foreign);yes(clock.visibleAlpha()>.06f,"reparented view cannot remain module-hidden");
   FeatureSettings.hide=false;frame(root);
  }
  PhoneStatusBarView mixed=new PhoneStatusBarView();ViewGroup icons=mixed.add(new ViewGroup("system_icons"));
  View sibling=icons.add(new View("battery"));ViewGroup island=icons.add(new ViewGroup("dynamic_island_container"));View islandBattery=island.add(new View("battery"));
  FeatureSettings.hide=true;frame(mixed);yes(icons.visibleAlpha()==1&&island.visibleAlpha()==1&&islandBattery.visibleAlpha()==1,"island nested in content region protects ancestor and descendants");
  yes(sibling.visibleAlpha()==0&&FeatureSettings.diagnostic.contains("protected_island_subtree"),"known sibling hidden and unusual contract reported");
  KeyguardStatusBarView lock=new KeyguardStatusBarView();View lockClock=lock.add(new View("clock"));frame(lock);yes(lockClock.visibleAlpha()==1,"phone setting does not change keyguard");
  ViewGroup unknown=new ViewGroup("status_bar");View foreignClock=unknown.add(new View("clock"));frame(unknown);yes(foreignClock.visibleAlpha()==1,"resource ID alone cannot claim an unknown root");
  PhoneStatusBarView nativeOnly=new PhoneStatusBarView();View nativeHidden=nativeOnly.add(new View("clock"));nativeHidden.alpha=0;
  frame(nativeOnly);FeatureSettings.hide=false;frame(nativeOnly);yes(nativeHidden.visibleAlpha()==0,"native hidden icon remains hidden after disable");
  System.out.println("PASS status content/island isolation: "+checks+" checks");
 }
}'''.replace('/*HOST*/',host_visible)
}
bin=Path(os.environ['JAVA_HOME'])/'bin';exe='.exe' if os.name=='nt' else ''
with tempfile.TemporaryDirectory(prefix='duo-status-content-') as temp:
    paths=[SRC/'StatusBarContentVisibility.java']
    for name,source in S.items():
        path=Path(temp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf8');paths.append(path)
    subprocess.run([str(bin/('javac'+exe)),'-encoding','UTF-8','--release','17','-d',temp,*map(str,paths)],check=True)
    subprocess.run([str(bin/('java'+exe)),'-cp',temp,'ls.augment.com.hook.TestContentVisibility'],check=True)
