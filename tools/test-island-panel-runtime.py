"""Exercise production panel compatibility, transition ownership and media actions without a device."""
from pathlib import Path
import argparse
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com/hook'

def method(text, marker):
    start = text.index(marker)
    end = text.index('{', start) + 1
    depth = 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]

FILES = {
    'android/view/View.java': '''package android.view;
public class View {public static final int GONE=8;public Object parent;public int visibility;
public Object getParent(){return parent;}public void setVisibility(int value){visibility=value;}}''',
    'android/view/ViewGroup.java': '''package android.view;import java.util.*;
public class ViewGroup extends View {public List<View> children=new ArrayList<>();
public void addView(View v){children.add(v);v.parent=this;}public void removeView(View v){children.remove(v);v.parent=null;}
public void removeAllViews(){for(View v:new ArrayList<>(children))removeView(v);}}''',
    'android/animation/AnimatorListenerAdapter.java': '''package android.animation;
public class AnimatorListenerAdapter {public void onAnimationEnd(Animator value){}}''',
    'android/animation/Animator.java': '''package android.animation;import java.util.*;
public class Animator {public List<AnimatorListenerAdapter> listeners=new ArrayList<>();public int ends;public boolean ended;
public void addListener(AnimatorListenerAdapter l){listeners.add(l);}public void removeListener(AnimatorListenerAdapter l){listeners.remove(l);}
public void end(){if(ended)return;ended=true;ends++;for(var l:new ArrayList<>(listeners))l.onAnimationEnd(this);}}''',
    'com/zte/feature/dynamicisland/DynamicPermanentIsland.java': '''package com.zte.feature.dynamicisland;
public class DynamicPermanentIsland extends android.view.View {public android.view.View panel=new android.view.View();
public android.view.View getPanelIsland(){return panel;}}''',
    'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.lang.reflect.*;
class SystemUiAdapter {static Object field(Object o,String n){if(o==null)return null;for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{
Field f=t.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(ReflectiveOperationException absent){}return null;}
static Object call(Object o,String n,Object... args)throws ReflectiveOperationException {if(o==null)return null;
for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())for(Method m:t.getDeclaredMethods())if(m.getName().equals(n)&&m.getParameterCount()==args.length){
m.setAccessible(true);return m.invoke(o,args);}throw new NoSuchMethodException(n);}}''',
}

HARNESS = '''package ls.augment.com.hook;
import java.util.*;import android.view.*;import android.animation.*;import com.zte.feature.dynamicisland.DynamicPermanentIsland;
public class TestIslandPanel {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static final List<String> reports=new ArrayList<>();
 static class Legacy {
  public boolean mDynamicPanelShowing=true;public ViewGroup mDynamicPanelContainer=new ViewGroup();
  public View mDynamicIslandRoot=new View();public Object mWindowManager=new Object(),mParams=new Object();
  public DynamicPermanentIsland selected=new DynamicPermanentIsland(),mTempIsland=selected;
  public int heights,removes;public boolean failHeight;public Object mDisposableIsland;
  public Animation mDynamicAnimation=new Animation();
  public DynamicPermanentIsland getPermanentIsland(){return selected;}
  public void updateDynamicWindowHeightParams(boolean expanded){check(!expanded,"restores compact height");if(failHeight)throw new IllegalStateException();heights++;}
  public void removePermanentIslandInner(DynamicPermanentIsland island){removes++;}
  public void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland island,boolean remove,boolean disposable){}
 }
 static class Modern extends Legacy {
  public View mDynamicIslandPanelRoot;public boolean mDynamicPanelClosing=true;
  Modern(){mDynamicPanelContainer.addView(selected.panel);}
  // Exact operation sequence from the archived target dex: lines 1471-1475.
  @Override public void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland island,boolean remove,boolean disposable){
   mDynamicPanelShowing=false;mDynamicPanelClosing=false;mDynamicPanelContainer.removeAllViews();
   mDynamicIslandPanelRoot.setVisibility(View.GONE);mTempIsland=null;
  }
 }
 static class Child extends Modern {}
 static class WrongField extends Legacy {public View mDynamicIslandPanelRoot;public String mDynamicPanelClosing="wrong";}
 static class WrongSignature {public View mDynamicIslandPanelRoot;public boolean mDynamicPanelClosing,mDynamicPanelShowing;
  public DynamicPermanentIsland mTempIsland;public ViewGroup mDynamicPanelContainer;
  public void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland i,boolean r,boolean d){}
  public void updateDynamicWindowHeightParams(int wrong){} }
 static class Animation {int switches;public void startDisposableChangeAnimation(Object a,Object b){switches++;}}
 static class Handler {Map<Runnable,Long> jobs=new HashMap<>();void removeCallbacks(Runnable r){jobs.remove(r);}void postDelayed(Runnable r,long ms){jobs.put(r,ms);}}
 static class Actions {
  boolean closed,screenOff,enabled=true,isLocked;int ownerUser,user;final Handler MAIN=new Handler();
  final Runnable collapse=()->{},tick=()->{};final Power power=new Power();final Host nativeHost=new Host();int dismisses;
  boolean locked(){return isLocked;}int currentUser(){return user;}void dismiss(){dismisses++;}
  static class Power {boolean interactive=true;boolean isInteractive(){return interactive;}}
  static class Host {boolean expanded=true;boolean expanded(){return expanded;}}
  // ACTION
 }
 static class OwnedHost {
  final Handler MAIN=new Handler();final Runnable publish=()->{};final IslandPanelTransition panelTransition=new IslandPanelTransition();
  final Modern permanent=new Modern();View current=permanent.selected;int closes;boolean callbackComplete;
  void dismiss(){if(current==null||!permanent.mDynamicPanelShowing||!panelTransition.prepareClose(current))return;
   closes++;Animator a=new Animator();a.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){
    check(current!=null,"host must keep its view alive through close callback");close(permanent,false,false);callbackComplete=true;
   }});panelTransition.track(current,a,true);
  }
  void restoreBackgrounds(){}void report(String value){reports.add(value);}String cause(Throwable e){return e.toString();}
  Object call(Object o,String n,Object... args)throws ReflectiveOperationException{
   if(n.equals("removePermanentIslandInner"))check(callbackComplete,"host must complete callback before removing scene");
   return SystemUiAdapter.call(o,n,args);
  }
  // HIDE
 }
 static boolean close(Modern m,boolean remove,boolean disposable){return NativeIslandPanelCompat.closeEnd(m,m.selected,remove,disposable,reports::add);}
 public static void main(String[] args){
  Modern baseline=new Modern();boolean crashed=false;
  try{baseline.onPermanentIslandPanelCloseAnimationEnd(baseline.selected,false,false);}catch(NullPointerException expected){crashed=true;}
  check(crashed,"baseline reproduces the absent fullscreen-root NPE");
  Modern m=new Modern();View unrelated=new View();m.mDynamicPanelContainer.addView(unrelated);
  check(NativeIslandPanelCompat.canExpand(m,reports::add),"known ordinary window admitted");
  check(close(m,false,false),"ordinary callback replaced");
  check(!m.mDynamicPanelShowing&&!m.mDynamicPanelClosing&&m.mTempIsland==null,"both flags and temporary scene cleared");
  check(m.selected.panel.parent==null&&m.mDynamicPanelContainer.children.contains(unrelated),"only matching panel removed");
  check(m.heights==1&&m.removes==0,"compact restore preserves live media scene");
  check(reports.get(reports.size()-1).equals("panel_close_completed:ordinary_window"),"completion reported after work");
  m=new Modern();m.mDynamicIslandPanelRoot=new View();
  check(!close(m,false,false)&&m.mDynamicPanelShowing,"full window stays native");
  m.onPermanentIslandPanelCloseAnimationEnd(m.selected,false,false);
  check(m.mDynamicIslandPanelRoot.visibility==View.GONE,"native fullscreen cleanup still works");
  Legacy old=new Legacy();check(NativeIslandPanelCompat.canExpand(old,reports::add),"old ordinary path admitted");
  check(!NativeIslandPanelCompat.closeEnd(old,old.selected,false,false,reports::add)&&old.heights==0,"old callback preserved");
  Child child=new Child();check(close(child,false,false)&&child.heights==1,"inherited fields and methods supported");
  WrongField wrong=new WrongField();check(!NativeIslandPanelCompat.canExpand(wrong,reports::add),"wrong field type disables module expansion");
  check(!NativeIslandPanelCompat.closeEnd(wrong,wrong.selected,false,false,reports::add),"unknown field contract leaves OEM callback alone");
  check(!NativeIslandPanelCompat.canExpand(new WrongSignature(),reports::add),"wrong method signature rejected");
  m=new Modern();m.mDynamicPanelContainer=null;check(!NativeIslandPanelCompat.canExpand(m,reports::add),"missing runtime container rejects expansion");
  check(close(m,false,false)&&!m.mDynamicPanelClosing,"teardown callback cannot dereference missing full root");
  m=new Modern();DynamicPermanentIsland stale=m.selected;m.selected=new DynamicPermanentIsland();
  check(NativeIslandPanelCompat.closeEnd(m,stale,false,false,reports::add)&&m.mDynamicPanelShowing&&m.heights==0,"stale callback cannot close new selection");
  m=new Modern();check(close(m,true,false)&&m.removes==1,"remove request honored");
  m=new Modern();m.mDisposableIsland=new Object();check(close(m,false,true)&&m.mDynamicAnimation.switches==1,"disposable transition honored");
  m=new Modern();check(close(m,false,true)&&m.mDynamicAnimation.switches==0,"missing disposable target stays safe");
  m=new Modern();m.failHeight=true;reports.clear();check(close(m,false,false),"known failing ordinary callback cannot enter unsafe OEM root access");
  check(reports.stream().anyMatch(s->s.startsWith("panel_close_failed:"))&&!reports.contains("panel_close_completed:ordinary_window"),"failure retained, never reported complete");

  IslandPanelTransition transition=new IslandPanelTransition();Object scene=new Object();Animator opening=new Animator();
  transition.track(scene,opening,false);check(transition.prepareClose(scene)&&opening.ends==1,"opening finishes before closing");
  Animator closing=new Animator();final Modern closingManager=new Modern();
  closing.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){close(closingManager,false,false);}});
  transition.track(scene,closing,true);
  check(!transition.prepareClose(scene)&&closing.ends==0,"duplicate dismissal does not restart closing");
  transition.finish();check(closing.ends==1&&!closingManager.mDynamicPanelShowing&&closingManager.selected.panel.parent==null,"hide drains end callback before removal");
  transition.finish();check(closing.ends==1,"repeated hide idempotent");
  check(transition.prepareClose(scene),"subsequent panel can close");
  Animator next=new Animator();transition.track(scene,next,false);
  check(closing.listeners.size()==1,"transition listener released at end");
  transition.finish();check(next.listeners.isEmpty(),"new animation listener released");
  OwnedHost host=new OwnedHost();host.hide();
  check(host.current==null&&host.permanent.removes==1&&host.closes==1,"production hide completes and removes exactly once");
  host.hide();check(host.permanent.removes==1&&host.closes==1,"production repeated hide is idempotent");
  host=new OwnedHost();host.dismiss();host.hide();
  check(host.closes==1&&host.permanent.removes==1,"existing close reused by hide");

  Actions actions=new Actions();int[] commands={0};
  for(int i=0;i<3;i++)actions.runAction(()->commands[0]++);
  check(commands[0]==3&&actions.dismisses==0,"previous pause next never force panel collapse");
  check(actions.MAIN.jobs.get(actions.collapse)==8000&&actions.MAIN.jobs.get(actions.tick)==150,"media actions renew panel timeout and schedule refresh");
  actions.nativeHost.expanded=false;actions.runAction(()->{});check(!actions.MAIN.jobs.containsKey(actions.collapse),"collapsed controls cannot create stale timeout");
  actions.isLocked=true;actions.runAction(()->commands[0]++);check(commands[0]==3,"locked action blocked");
  actions.isLocked=false;actions.user=10;actions.runAction(()->commands[0]++);check(commands[0]==3,"wrong user blocked");
  actions.user=0;actions.nativeHost.expanded=true;actions.runAction(()->{throw new IllegalStateException();});
  check(actions.dismisses==0,"transport failure does not trigger unsafe collapse");
  System.out.println("Island panel runtime checks passed: "+checks+" (Android facade, not device acceptance)");
 }
}
'''

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--java-home',type=Path,required=True)
    args=parser.parse_args()
    source=(JAVA/'DynamicIslandHook.java').read_text('utf-8')
    host=(JAVA/'NativeIslandHost.java').read_text('utf-8')
    harness=HARNESS.replace('// ACTION',method(source,'void runAction(')).replace('// HIDE',method(host,'void hide('))
    files=dict(FILES)
    for name in ['NativeIslandPanelCompat','IslandPanelTransition']:
        files[f'ls/augment/com/hook/{name}.java']=(JAVA/f'{name}.java').read_text('utf-8')
    files['ls/augment/com/hook/TestIslandPanel.java']=harness
    import os
    suffix='.exe' if os.name=='nt' else ''
    with tempfile.TemporaryDirectory(prefix='duo-panel-') as directory:
        target=Path(directory);paths=[]
        for name,text in files.items():
            path=target/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,'utf-8');paths.append(str(path))
        compile_cmd=[str(args.java_home/'bin'/('javac'+suffix)),'-encoding','UTF-8','-d',str(target),*paths]
        run_cmd=[str(args.java_home/'bin'/('java'+suffix)),'-cp',str(target),'ls.augment.com.hook.TestIslandPanel']
        subprocess.run(compile_cmd,check=True);subprocess.run(run_cmd,check=True)
        # Verify the regression suite rejects restoring forced collapse and bypassing the ordinary fix.
        for filename,old,new,expected in [
            ('TestIslandPanel.java','// Playback callbacks','dismiss(); // Playback callbacks','previous pause next never force panel collapse'),
            ('NativeIslandPanelCompat.java','if (!ordinary(owner)) return false;','if (true) return false;','ordinary callback replaced'),
            ('TestIslandPanel.java','try{panelTransition.finish();}','try{current=null;panelTransition.finish();}','host must keep its view alive through close callback')]:
            path=target/'ls/augment/com/hook'/filename;original=path.read_text('utf-8')
            assert old in original
            path.write_text(original.replace(old,new,1),'utf-8')
            subprocess.run(compile_cmd,check=True,capture_output=True)
            result=subprocess.run(run_cmd,capture_output=True,text=True)
            assert result.returncode!=0 and expected in result.stderr,result.stderr
            path.write_text(original,'utf-8')
            print('PASS rejected regression:',filename)

if __name__=='__main__':main()
