"""Run the production enum capsule adapter against native-style renderers and producer updates."""
import ast
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-native-island-takeover.py').read_text('utf-8'))
base=next(ast.literal_eval(node.value) for node in tree.body if isinstance(node,ast.Assign)
          and any(isinstance(target,ast.Name) and target.id=='files' for target in node.targets))
files={key:value for key,value in base.items() if key.startswith('android/') or key.endswith('/AugmentModule.java')}
files['ls/augment/com/hook/AugmentModule.java']=files['ls/augment/com/hook/AugmentModule.java'].replace(
    'public class AugmentModule {','public class AugmentModule { public boolean allowDeopt=true; public boolean deoptimize(Method m){return allowDeopt;}')
files['com/zte/feature/callnotify/CallLayoutViewType.java']='''package com.zte.feature.callnotify;
public final class CallLayoutViewType {public final CallLayout.ViewType type;public CallLayoutViewType(CallLayout.ViewType type){this.type=type;}}'''
files['com/zte/feature/callnotify/CallLayout.java']='''package com.zte.feature.callnotify;
import android.view.View;import java.util.*;import ls.augment.com.hook.AugmentModule;
public class CallLayout extends View {
 public enum ViewType {FUTURE,ANTIFRAUD,CALL,HOTSPOT,MEETING,AI,RECORD,SCREEN_RECORD,CAST,SHARE_TO_APP}
 public final EnumMap<ViewType,Integer> mViewTypeVisibility=new EnumMap<>(ViewType.class);
 public final EnumMap<ViewType,CallLayoutViewType> mViewTypes=new EnumMap<>(ViewType.class);
 public ViewType shown;public int launcherCalls,updates;public boolean throwRender,changeSource;
 public CallLayout(){for(ViewType type:ViewType.values()){mViewTypeVisibility.put(type,8);mViewTypes.put(type,new CallLayoutViewType(type));}}
 Object run(String name,Class<?>[] types,Object[] args,AugmentModule.Original body){return AugmentModule.run(this,name,types,args,body);}
 public int getCurrentVisibility(ViewType type){return (Integer)run("getCurrentVisibility",new Class[]{ViewType.class},new Object[]{type},a->mViewTypeVisibility.getOrDefault(a[0],8));}
 public boolean isViewVisible(ViewType type){return (Boolean)run("isViewVisible",new Class[]{ViewType.class},new Object[]{type},a->getCurrentVisibility((ViewType)a[0])==0);}
 public void showView(ViewType type){run("showView",new Class[]{ViewType.class},new Object[]{type},a->{shown=(ViewType)a[0];return null;});}
 public CallLayoutViewType resolveTopVisibleViewType(){return (CallLayoutViewType)run("resolveTopVisibleViewType",new Class[0],new Object[0],a->{
   if(changeSource)mViewTypeVisibility.put(ViewType.RECORD,8);if(throwRender)throw new IllegalStateException("draw failure");
   for(ViewType type:ViewType.values())if(getCurrentVisibility(type)==0)return mViewTypes.get(type);return null;});}
 public boolean hasHigherPriorityViewVisible(ViewType type){return (Boolean)run("hasHigherPriorityViewVisible",new Class[]{ViewType.class},new Object[]{type},a->{
   CallLayoutViewType current=resolveTopVisibleViewType();return current!=null&&current.type.ordinal()<((ViewType)a[0]).ordinal();});}
 public String getTimeCount(ViewType type){return (String)run("getTimeCount",new Class[]{ViewType.class},new Object[]{type},a->mViewTypeVisibility.get(a[0])==0?"00:12":null);}
 public boolean isAnyViewShouldVisible(){return (Boolean)run("isAnyViewShouldVisible",new Class[0],new Object[0],a->getTimeCount(ViewType.RECORD)!=null||getTimeCount(ViewType.CALL)!=null);}
 public void handleVisibilityChanged(){CallLayoutViewType top=resolveTopVisibleViewType();if(top!=null)showView(top.type);setVisibility(top==null?8:0);}
 public void updateVisibility(){updates++;}
 @Override public void setVisibility(int value){run("setVisibility",new Class[]{int.class},new Object[]{value},a->{super.setVisibility((Integer)a[0]);return null;});}
 public void updateViewVisibilityFromLauncher(ViewType type){run("updateViewVisibilityFromLauncher",new Class[]{ViewType.class},new Object[]{type},a->{launcherCalls++;showView((ViewType)a[0]);setVisibility(0);return null;});}
}'''
files['ls/augment/com/hook/TestEnumCapsules.java']='''package ls.augment.com.hook;
import com.zte.feature.callnotify.*;import java.util.*;
public class TestEnumCapsules {
 static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 public static class Child extends CallLayout {}
 public static void main(String[] args)throws Exception {
  String[][] cases={{"CALL","call"},{"RECORD","record"},{"AI","ai"},{"MEETING","meeting"},{"HOTSPOT","hotspot"},{"SCREEN_RECORD","screen_record"}};
  for(Class<? extends CallLayout> type:Arrays.asList(CallLayout.class,Child.class))for(String[] scene:cases){
   AugmentModule.hooks.clear();Set<String> owned=new HashSet<>();NativeIslandCapsules adapter=new NativeIslandCapsules(owned::contains);
   check(adapter.install(new AugmentModule(),type)>=8&&adapter.ready(),"full enum or inherited renderer contract");
   CallLayout layout=type.getConstructor().newInstance();CallLayout.ViewType kind=CallLayout.ViewType.valueOf(scene[0]);
   layout.mViewTypeVisibility.put(kind,0);owned.add(scene[1]);layout.handleVisibilityChanged();
   check(layout.visibility==8&&!layout.isViewVisible(kind),"selected rendered scene is suppressed");
   check(layout.getCurrentVisibility(kind)==0&&layout.mViewTypeVisibility.get(kind)==0,"source map and non-render reads remain original");
   layout.updateViewVisibilityFromLauncher(kind);check(layout.launcherCalls==0&&layout.visibility==8,"launcher cannot reinsert owned content");
   layout.mViewTypeVisibility.put(CallLayout.ViewType.FUTURE,0);layout.handleVisibilityChanged();
   check(layout.visibility==0&&layout.shown==CallLayout.ViewType.FUTURE,"unknown future scene retains native rendering");
   layout.mViewTypeVisibility.put(CallLayout.ViewType.FUTURE,8);layout.throwRender=true;
   try{layout.handleVisibilityChanged();throw new AssertionError("expected renderer failure");}catch(IllegalStateException expected){}
   check(layout.getCurrentVisibility(kind)==0,"renderer failure does not filter later provider reads");layout.throwRender=false;
   owned.clear();adapter.refresh(s->{});check(layout.visibility==0&&layout.shown==kind&&layout.updates==1,"release refreshes current original state");
  }
  AugmentModule.hooks.clear();Set<String> owned=new HashSet<>(Set.of("record"));NativeIslandCapsules adapter=new NativeIslandCapsules(owned::contains);
  adapter.install(new AugmentModule(),CallLayout.class);CallLayout layout=new CallLayout();layout.mViewTypeVisibility.put(CallLayout.ViewType.RECORD,0);
  layout.changeSource=true;layout.handleVisibilityChanged();check(layout.getCurrentVisibility(CallLayout.ViewType.RECORD)==8,"reentrant source withdrawal is never overwritten");
  AugmentModule.hooks.clear();AugmentModule unavailable=new AugmentModule();unavailable.allowDeopt=false;
  NativeIslandCapsules unsupported=new NativeIslandCapsules(s->true);
  check(unsupported.install(unavailable,CallLayout.class)==0&&!unsupported.ready()&&AugmentModule.hooks.isEmpty(),"missing deoptimization fails before render hooks");
  System.out.println("PASS enum capsule renderer: "+checks+" checks");
 }
}'''
with tempfile.TemporaryDirectory(prefix='duo-enum-capsules-') as directory:
    paths=[]
    for name,source in files.items():
        path=Path(directory)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,'utf-8');paths.append(str(path))
    paths += [str(ROOT/f'android/app/src/main/java/ls/augment/com/hook/{name}.java') for name in
              ('EnumIslandCapsules','NativeIslandCapsules','NativeIslandSceneContract')]
    java=Path(os.environ['JAVA_HOME'])/'bin';suffix='.exe' if os.name=='nt' else ''
    subprocess.run([str(java/('javac'+suffix)),'-encoding','UTF-8','-d',directory,*paths],check=True)
    subprocess.run([str(java/('java'+suffix)),'-cp',directory,'ls.augment.com.hook.TestEnumCapsules'],check=True)
