"""Native spring dismiss selection must remain the sole owner of task removal."""
from pathlib import Path
import subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
path=ROOT/'tools/test-cleanup-bomb-runtime.py';ns={'__file__':str(path),'__name__':'fixture'}
exec(path.read_text(encoding='utf-8').split('with tempfile.TemporaryDirectory(')[0],ns)
files=ns['files']
files['com/android/quickstep/views/RecentsView.java']='''package com.android.quickstep.views;import android.view.View;import ls.augment.com.hook.AugmentModule;
public class RecentsView extends View{
 public boolean mOverviewStateEnabled=true,fail;public int calls,locked=2;public TaskView selected=new TaskView(),protectedCard=new TaskView();
 public final RecentsDismissUtils utils=new RecentsDismissUtils(this);
 public void dismissAllTasks(View source)throws Throwable{calls++;if(fail)throw new IllegalStateException("native");AugmentModule.call(utils,RecentsDismissUtils.class,"createTaskDismissSpringAnimation",new Class[]{TaskView.class,boolean.class,RecentsDismissUtils.DismissedTaskData.class,boolean.class,boolean.class},selected,true,new RecentsDismissUtils.DismissedTaskData(),false,true);}}
'''
files['com/android/quickstep/views/TaskView.java']='package com.android.quickstep.views;public class TaskView extends android.view.View{}'
files['com/android/quickstep/views/RecentsDismissUtils.java']='''package com.android.quickstep.views;public class RecentsDismissUtils{
 public final RecentsView recentsView;public int calls;public RecentsDismissUtils(RecentsView v){recentsView=v;}
 public static class DismissedTaskData{}public static class SpringSet{}
 public SpringSet createTaskDismissSpringAnimation(TaskView t,boolean a,DismissedTaskData d,boolean b,boolean c){calls++;return new SpringSet();}}
'''
files['ls/augment/com/hook/TestCleanupBomb.java']='''package ls.augment.com.hook;import android.view.*;import android.animation.*;import com.android.quickstep.views.*;
public class TestCleanupBomb{static int n;static void check(boolean b){n++;if(!b)throw new AssertionError("check "+n);}
public static void main(String[] args)throws Throwable{AugmentModule m=new AugmentModule();AugmentModule.active=m;LauncherCleanupBombHook.install(m,TestCleanupBomb.class.getClassLoader());FeatureSettings.on=true;FeatureSettings.style="1";
 RecentsView r=new RecentsView();AugmentModule.call(r,RecentsView.class,"dismissAllTasks",new Class[]{View.class},new View());check(r.calls==1&&r.utils.calls==1);check(r.selected.alpha==0&&r.protectedCard.alpha==1&&r.locked==2);ValueAnimator.last.tick(1);check(r.calls==1&&r.selected.alpha==1&&r.overlay.items.isEmpty());
 r=new RecentsView();AugmentModule.call(r.utils,RecentsDismissUtils.class,"createTaskDismissSpringAnimation",new Class[]{TaskView.class,boolean.class,RecentsDismissUtils.DismissedTaskData.class,boolean.class,boolean.class},r.selected,true,new RecentsDismissUtils.DismissedTaskData(),false,true);check(r.selected.alpha==1&&r.utils.calls==1);
 r=new RecentsView();r.fail=true;try{AugmentModule.call(r,RecentsView.class,"dismissAllTasks",new Class[]{View.class},new View());throw new AssertionError();}catch(IllegalStateException expected){}check(r.calls==1&&r.overlay.items.isEmpty());
 FeatureSettings.on=false;r=new RecentsView();AugmentModule.call(r,RecentsView.class,"dismissAllTasks",new Class[]{View.class},new View());check(r.calls==1&&r.selected.alpha==1);
 System.out.println("native spring cleanup checks="+n);}}
'''
java=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
with tempfile.TemporaryDirectory(prefix='duo-cleanup-spring-') as folder:
    paths=[]
    for name,value in files.items():
        p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value,encoding='utf-8');paths.append(str(p))
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',folder,*paths],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestCleanupBomb'],check=True)
