"""Production icon load/draw hooks, asynchronous cancellation and native drawable preservation."""
from pathlib import Path
import os, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
path=ROOT/'tools/test-cleanup-bomb-runtime.py';ns={'__file__':str(path),'__name__':'fixture'}
exec(path.read_text(encoding='utf8').split("with tempfile.TemporaryDirectory(prefix='lsa-bomb-')")[0],ns)
files=ns['files']
files['com/android/quickstep/views/ClearAllButton.java']=files['com/android/quickstep/views/ClearAllButton.java'].replace('draws++;','if(c.clipped)throw new AssertionError("native recents draw received an empty clip");draws++;')
files['ls/augment/com/hook/TestCleanupBomb.java']='''package ls.augment.com.hook;
import android.view.*;import android.widget.*;import android.graphics.*;import android.os.Handler;import android.content.ContentResolver;import com.android.quickstep.views.*;
public class TestCleanupBomb {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void refresh(){for(Runnable r:new java.util.ArrayList<>(FeatureSettings.listeners))r.run();}
 static void draw(ImageView image,Canvas c)throws Throwable{AugmentModule.call(image,ImageView.class,"onDraw",new Class[]{Canvas.class},c);}
 public static void main(String[] args)throws Throwable{
  AugmentModule m=new AugmentModule();AugmentModule.active=m;LauncherCleanupBombHook.install(m,TestCleanupBomb.class.getClassLoader());FeatureSettings.on=true;
  OverviewActionsView host=new OverviewActionsView();ImageView image=new ImageView();host.child=image;
  AugmentModule.call(host,OverviewActionsView.class,"onFinishInflate",new Class[]{});Object nativeDrawable=image.getDrawable();Canvas c=new Canvas();
  FeatureSettings.icon="a".repeat(64);refresh();Handler.await();int nodes=Canvas.nodes;draw(image,c);
  check(Canvas.nodes==nodes+1&&image.getDrawable()==nativeDrawable,"custom image drawn without replacing OEM animated drawable");
  int opens=ContentResolver.opens;for(int i=0;i<20;i++)draw(image,c);refresh();check(ContentResolver.opens==opens,"drawing and unchanged config do not read provider");
  ClearAllButton legacy=new ClearAllButton();AugmentModule.call(legacy,ClearAllButton.class,"draw",new Class[]{Canvas.class},c);Handler.await();nodes=Canvas.nodes;
  AugmentModule.call(legacy,ClearAllButton.class,"draw",new Class[]{Canvas.class},c);check(Canvas.nodes==nodes+1&&legacy.draws==2,"legacy button draws custom icon and native draw executes exactly once");
  FeatureSettings.on=false;refresh();nodes=Canvas.nodes;draw(image,c);check(Canvas.nodes==nodes&&image.getDrawable()==nativeDrawable,"disabled draws original native icon");
  FeatureSettings.on=true;FeatureSettings.icon="";refresh();nodes=Canvas.nodes;draw(image,c);check(Canvas.nodes==nodes,"empty custom selection retains native icon");
  CleanupIconImage artwork=new CleanupIconImage(new View());ContentResolver.missing=true;artwork.update("b".repeat(64));Handler.await();check(!artwork.draw(c,30,40,20),"missing resource allows default fallback");ContentResolver.missing=false;
  BitmapFactory.invalid=true;artwork.update("c".repeat(64));Handler.await();check(!artwork.draw(c,30,40,20),"invalid image bounds allow fallback");BitmapFactory.invalid=false;
  artwork.update("d".repeat(64));artwork.clear();Handler.await();check(!artwork.draw(c,30,40,20),"late decoding cannot undo clear");
  View view=new View();artwork=new CleanupIconImage(view);artwork.update("e".repeat(64));view.attached=false;Handler.await();check(!artwork.draw(c,30,40,20),"detached view never receives image");
  view.attached=true;artwork.update("e".repeat(64));Handler.await();check(artwork.draw(c,30,40,20),"reattach reloads retained selection without an artificial clear");
  opens=ContentResolver.opens;artwork.update("../../invalid");check(!artwork.draw(c,30,40,20)&&ContentResolver.opens==opens,"invalid configuration cannot access provider");
  View beforeAttach=new View();beforeAttach.attached=false;CleanupIconImage early=new CleanupIconImage(beforeAttach);early.update("f".repeat(64));
  check(ContentResolver.opens==opens,"inflation defers file read until attachment");beforeAttach.attached=true;early.update("f".repeat(64));Handler.await();check(early.draw(c,30,40,20),"first attachment loads the same configured hash");
  View restart=new View();restart.attached=false;CleanupIconImage fresh=new CleanupIconImage(restart);fresh.update("f".repeat(64));restart.attached=true;fresh.update("f".repeat(64));Handler.await();check(fresh.draw(c,30,40,20),"fresh process/view path reloads persisted custom selection");
  opens=ContentResolver.opens;artwork.update(CleanupIconImage.C17);check(artwork.ready()&&artwork.draw(c,30,40,20)&&ContentResolver.opens==opens,"C17 draws immediately without provider or bitmap access");
  View wide=new ImageView(),hostView=new View();wide.root=new View();wide.root.width=400;wide.setLayoutParams(new ViewGroup.LayoutParams(40,40));hostView.setLayoutParams(new ViewGroup.LayoutParams(60,60));
  CleanupIconLayout layout=new CleanupIconLayout(wide,hostView);layout.update(true);check(wide.params.width==127&&wide.params.height==40&&hostView.params.width==147&&hostView.params.height==60,"C17 uses measured reference width while preserving native touch height");
  layout.update(true);layout.update(false);check(wide.params.width==40&&hostView.params.width==60,"repeated refresh preserves original dimensions for custom/off restore");
  wide.root.width=100;layout.update(true);check(wide.params.width<=100&&hostView.params.width<=100,"C17 respects available screen width");layout.update(false);
  legacy.setLayoutParams(new ViewGroup.LayoutParams(73,41));CleanupIconLayout pageLayout=new CleanupIconLayout(legacy,null);pageLayout.update(true);pageLayout.update(false);
  check(legacy.params.width==73&&legacy.params.height==41,"clear-all page dimensions remain native because recents derives task/page geometry from them");
  int listeners=FeatureSettings.listeners.size();image.detach();legacy.detach();check(FeatureSettings.listeners.size()==listeners-2,"both button families release config observers");
  System.out.println("PASS production cleanup icon: "+checks+" checks");
 }
}'''
bin=Path(os.environ['JAVA_HOME'])/'bin'
with tempfile.TemporaryDirectory(prefix='duo-cleanup-icon-') as temp:
    paths=[]
    for name,source in files.items():
        path=Path(temp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf8');paths.append(path)
    subprocess.run([str(bin/'javac.exe'),'-encoding','UTF-8','-d',temp,*map(str,paths)],check=True)
    subprocess.run([str(bin/'java.exe'),'-cp',temp,'ls.augment.com.hook.TestCleanupBomb'],check=True)
