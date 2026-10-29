"""Modern concrete view lifecycle and render-cache-safe overlay integration."""
from pathlib import Path
import os,shutil,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
p=ROOT/'tools/test-recents-privacy-runtime.py';ns={'__file__':str(p),'__name__':'fixture'}
exec(p.read_text(encoding='utf-8').split("for mode in ('both'")[0],ns)
sources=ns['SOURCES']
name='com/android/quickstep/task/thumbnail/TaskThumbnailView.java'
sources[name]=sources[name].replace('public TaskThumbnailUiState uiState=', 'public void onAttachedToWindow(){}public void onRecycle(){}public void setState(TaskThumbnailUiState state,Integer id){uiState=state;}public TaskThumbnailUiState uiState=')
for name in ['LauncherRecentsPrivacyHook','HookCompatibility']:
 sources[f'ls/augment/com/hook/{name}.java']=(ROOT/f'android/app/src/main/java/ls/augment/com/hook/{name}.java').read_text(encoding='utf-8')
sources['ls/augment/com/AppPackageSet.java']=(ROOT/'android/app/src/main/java/ls/augment/com/AppPackageSet.java').read_text(encoding='utf-8')
for name in ['RecentsPrivacyOptions','EnhancementOption']:
 sources[f'ls/augment/com/{name}.java']=(ROOT/f'android/app/src/main/java/ls/augment/com/{name}.java').read_text(encoding='utf-8')
sources['ls/augment/com/hook/TestRecentsPrivacy.java']='''package ls.augment.com.hook;
import android.graphics.*;import com.android.quickstep.views.*;import com.android.systemui.shared.recents.model.Task;
public class TestRecentsPrivacy{static int n;static void check(boolean b){n++;if(!b)throw new AssertionError("check "+n);}public static void main(String[] args)throws Throwable{
 AugmentModule m=new AugmentModule();LauncherRecentsPrivacyHook.install(m,TestRecentsPrivacy.class.getClassLoader());
 TaskView owner=new TaskView();com.android.quickstep.task.thumbnail.TaskThumbnailView v=new com.android.quickstep.task.thumbnail.TaskThumbnailView();v.parent=owner;TaskContainer item=new TaskContainer(new Task("secret.app"),v);owner.items.add(item);
 FeatureSettings.publish(true,"secret.app");m.call("overlay.onAttachedToWindow",v);check(v.overlay.items.size()==1);Canvas c=new Canvas();v.overlay.items.get(0).draw(c);check(c.masks==1&&c.icons==1);
 int invalidates=v.invalidations;for(var listener:v.observer.listeners)listener.onPreDraw();check(v.invalidations==invalidates);check(v.overlay.items.size()==1);
 item.task=new Task("normal.app");for(var listener:v.observer.listeners)listener.onPreDraw();check(v.overlay.items.isEmpty());
 item.task=new Task("secret.app");for(var listener:v.observer.listeners)listener.onPreDraw();FeatureSettings.publish(false,"secret.app");for(var listener:v.observer.listeners)listener.onPreDraw();check(v.overlay.items.isEmpty());
 FeatureSettings.publish(true,"secret.app");for(var listener:v.observer.listeners)listener.onPreDraw();check(v.overlay.items.size()==1);m.call("overlay.onRecycle",v);check(v.overlay.items.isEmpty()&&v.observer.listeners.isEmpty());
 m.call("overlay.onAttachedToWindow",v);check(v.overlay.items.size()==1);for(var l:new java.util.ArrayList<>(v.attaches))l.onViewDetachedFromWindow(v);check(v.overlay.items.isEmpty()&&v.observer.listeners.isEmpty());check(m.errors.isEmpty());
 AugmentModule probe=new AugmentModule();boolean[] broken={false};
 RecentsPrivacyOverlay.install(probe,v.getClass(),com.android.quickstep.task.thumbnail.TaskThumbnailUiState.class,(view,canvas)->{if(broken[0])throw new IllegalStateException("recycled task");return true;});
 probe.call("overlay.onAttachedToWindow",v);check(v.overlay.items.size()==1);v.overlay.items.get(0).draw(new Canvas());broken[0]=true;
 for(var l:v.observer.listeners)l.onPreDraw();check(v.overlay.items.isEmpty());check(probe.errors.size()==1);for(var l:v.observer.listeners)l.onPreDraw();check(probe.errors.size()==1);
 System.out.println("Modern privacy overlay checks="+n);
}}
'''
bin_dir=Path(os.environ['JAVA_HOME'])/'bin' if os.environ.get('JAVA_HOME') else None
javac_command,java_command=[str(bin_dir/(name+('.exe' if os.name=='nt' else ''))) if bin_dir else (shutil.which(name) or name) for name in ('javac','java')]
with tempfile.TemporaryDirectory(prefix='duo-privacy-overlay-') as folder:
 files=[]
 for name,value in sources.items():
  p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value,encoding='utf-8');files.append(str(p))
 subprocess.run([javac_command,'-encoding','UTF-8','-d',folder,*files],check=True)
 subprocess.run([java_command,'-cp',folder,'ls.augment.com.hook.TestRecentsPrivacy'],check=True)
