"""Execute route presentation using real shared units/freshness and Android boundary doubles."""
from pathlib import Path
import ast, os, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-atomic-workbench-amap-hook.py').read_text('utf-8'))
base=next(ast.literal_eval(n.value) for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='SOURCES' for t in n.targets))
files={k:base[k] for k in ['android/os/Bundle.java','android/os/IBinder.java']}
files['android/app/Notification.java']='package android.app;public class Notification{public static final String EXTRA_TITLE="title",EXTRA_TEXT="text",EXTRA_BIG_TEXT="big";public android.os.Bundle extras=new android.os.Bundle();}'
for name in ['AtomicWorkbenchAmapData','AtomicWorkbenchNavigationCardData','hook/IslandNavigationPresentation']:
    files['ls/augment/com/'+name+'.java']=(ROOT/'android/app/src/main/java/ls/augment/com'/(name+'.java')).read_text('utf-8')
files['ls/augment/com/hook/TestNavigationPresentation.java']='''package ls.augment.com.hook;
import android.app.*;import android.os.*;import ls.augment.com.*;
public class TestNavigationPresentation{
 static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static Notification source(){Notification n=new Notification();n.extras.putString("title","高德地图");n.extras.putString("text","正在导航");
 n.extras.putInt(AtomicWorkbenchAmapData.VERSION,1);n.extras.putString(AtomicWorkbenchAmapData.STATUS,"active");n.extras.putLong(AtomicWorkbenchAmapData.UPDATED,10000);n.extras.putString(AtomicWorkbenchAmapData.SOURCE,"structured");return n;}
 static IslandNavigationPresentation read(Notification n,long now){return IslandNavigationPresentation.read(AtomicWorkbenchAmapData.PACKAGE,n,now);}
 public static void main(String[] a){
 Notification n=source();Bundle m=new Bundle();m.putDouble("segmentRemainDist",248.5);m.putDouble("routeRemainDist",5432.75);m.putDouble("routeRemainTime",601);m.putDouble("speed",36.25);m.putInt("curManeuverID",3);m.putString("curRouteName","测试大道");m.putString("nextRouteName","下一条路");
 n.extras.putBundle(AtomicWorkbenchAmapData.NOTIFICATION_METRICS,m);var p=read(n,11000);
 check(p.title.contains("249")&&p.title.contains("右转"),"distance + maneuver missing: "+p.title);
 check(p.detail.contains("测试大道 → 下一条路")&&p.detail.contains("5.4")&&p.detail.contains("11 分钟")&&p.detail.contains("36"),"real remaining data missing: "+p.detail);
 check(p.expires==16001,"explicit expiry missing");check(read(n,16001).title.equals("高德地图"),"expired metrics retained");check(read(n,9999).title.equals("高德地图"),"future data accepted");
 n.extras.putString(AtomicWorkbenchAmapData.STATUS,"ended");check(read(n,11000).detail.equals("正在导航"),"ended data retained");n.extras.putString(AtomicWorkbenchAmapData.STATUS,"active");
 check(IslandNavigationPresentation.read("com.baidu.BaiduMap",n,11000).title.equals("高德地图"),"foreign metadata consumed");
 m.putInt("curManeuverID",999);check(!read(n,11000).title.contains("转"),"invented maneuver");
 m.putDouble("speed",Double.NaN);check(!read(n,11000).detail.contains("NaN"),"non-finite speed shown");
 n=source();n.extras.putString(AtomicWorkbenchAmapData.SOURCE,"spoken");n.extras.putString(AtomicWorkbenchAmapData.CONTENT,"前方 300 米右转进入测试路");p=read(n,12000);check(p.detail.contains("300 米")&&p.expires==55001,"real spoken guidance missing");
 check(read(n,55001).detail.equals("正在导航"),"spoken expiry failed");
 System.out.println("PASS navigation presentation: "+checks+" checks");}}
'''
with tempfile.TemporaryDirectory(prefix='duo-nav-presentation-') as tmp:
    folder=Path(tmp)
    for name,code in files.items():
        path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,'utf-8')
    java=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',tmp,*map(str,folder.rglob('*.java'))],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',tmp,'ls.augment.com.hook.TestNavigationPresentation'],check=True)
