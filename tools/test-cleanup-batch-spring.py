"""Actual batch capture and completion with OEM-selected cards, not task re-selection."""
from pathlib import Path
import os,shutil,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
path=ROOT/'tools/test-cleanup-spring-compat.py';ns={'__file__':str(path),'__name__':'fixture'}
exec(path.read_text(encoding='utf-8').split("java=Path(")[0],ns)
files=ns['files']
files['com/android/quickstep/views/RecentsView.java']='''package com.android.quickstep.views;import android.view.View;import ls.augment.com.hook.AugmentModule;
public class RecentsView extends View{public boolean mOverviewStateEnabled=true;public int calls,locked=2;public TaskView selected=new TaskView(),protectedCard=new TaskView();public final RecentsDismissUtils utils=new RecentsDismissUtils(this);
public void dismissAllTasks(View source)throws Throwable{calls++;utils.dismissAllTasks();}}
'''
files['com/android/quickstep/views/RecentsDismissUtils.java']='''package com.android.quickstep.views;import ls.augment.com.hook.AugmentModule;
public class RecentsDismissUtils{public final RecentsView recentsView;public int captures;public SpringSet set=new SpringSet();public RecentsDismissUtils(RecentsView v){recentsView=v;}
 public static class DismissedTaskData{}public static class SpringAnimation{}
 public SpringAnimation createDismissedTaskViewSpringAnimation(TaskView card){captures++;return new SpringAnimation();}
 public void dismissAllTasks()throws Throwable{AugmentModule.call(this,RecentsDismissUtils.class,"createDismissedTaskViewSpringAnimation",new Class[]{TaskView.class},recentsView.selected);AugmentModule.call(set,SpringSet.class,"start",new Class[]{});}
 public static class SpringSet{public int starts,ends;public SpringSet start(){starts++;return this;}public void onEnd(){ends++;}public void complete()throws Throwable{AugmentModule.call(this,SpringSet.class,"onEnd",new Class[]{});}}
}'''
files['ls/augment/com/hook/TestCleanupBomb.java']='''package ls.augment.com.hook;import android.view.*;import android.animation.*;import com.android.quickstep.views.*;
public class TestCleanupBomb{static int n;static void check(boolean b){n++;if(!b)throw new AssertionError("check "+n);}static void click(RecentsView r)throws Throwable{AugmentModule.call(r,RecentsView.class,"dismissAllTasks",new Class[]{View.class},new View());}
 public static void main(String[] args)throws Throwable{AugmentModule m=new AugmentModule();AugmentModule.active=m;LauncherCleanupBombHook.install(m,TestCleanupBomb.class.getClassLoader());FeatureSettings.on=true;FeatureSettings.style="1";
 RecentsView r=new RecentsView();click(r);check(r.calls==1&&r.utils.captures==1&&r.utils.set.starts==1);check(r.selected.alpha==0&&r.protectedCard.alpha==1&&r.locked==2);
 r.utils.set.complete();r.utils.set.complete();check(r.utils.set.ends==0);ValueAnimator.last.tick(1);check(r.utils.set.ends==1&&r.selected.alpha==1&&r.overlay.items.isEmpty());
 RecentsView detached=new RecentsView();click(detached);detached.utils.set.complete();detached.detach();check(detached.utils.set.ends==1&&detached.selected.alpha==1&&detached.overlay.items.isEmpty());
 RecentsDismissUtils.SpringSet unrelated=new RecentsDismissUtils.SpringSet();unrelated.complete();check(unrelated.ends==1);
 FeatureSettings.on=false;RecentsView off=new RecentsView();click(off);off.utils.set.complete();check(off.utils.set.ends==1&&off.selected.alpha==1);
 System.out.println("Batch spring checks="+n);}}
'''
bin_dir=Path(os.environ['JAVA_HOME'])/'bin' if os.environ.get('JAVA_HOME') else None
javac_command,java_command=[str(bin_dir/(name+('.exe' if os.name=='nt' else ''))) if bin_dir else (shutil.which(name) or name) for name in ('javac','java')]
with tempfile.TemporaryDirectory(prefix='duo-cleanup-batch-') as folder:
 paths=[]
 for name,value in files.items():
  p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value,encoding='utf-8');paths.append(str(p))
 subprocess.run([javac_command,'-encoding','UTF-8','-d',folder,*paths],check=True)
 subprocess.run([java_command,'-cp',folder,'ls.augment.com.hook.TestCleanupBomb'],check=True)
