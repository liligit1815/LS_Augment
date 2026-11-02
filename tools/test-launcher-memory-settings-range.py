"""Run the real settings loader/shared sizing without visiting Recents or supplying diagnostics."""
from pathlib import Path
import importlib.util
import subprocess
import tempfile
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
source=(SRC/'EnhancementSettingsActivity.java').read_text(encoding='utf-8')
spec=importlib.util.spec_from_file_location('lifecycle', ROOT/'tools/test-launcher-recents-memory-lifecycle.py')
boundary=importlib.util.module_from_spec(spec);spec.loader.exec_module(boundary)
files={k:v for k,v in boundary.SOURCES.items() if not k.endswith('TestLauncherRecentsMemoryLifecycle.java')}
def method(name):
    start=source.index('    private void '+name+'(');brace=source.index('{',start);depth=1;end=brace+1
    while depth:
        if source[end]=='{':depth+=1
        elif source[end]=='}':depth-=1
        end+=1
    return source[start:end]
files.update({
    'android/content/SharedPreferences.java': '''package android.content;import java.util.*;
public class SharedPreferences{public final Map<String,String> values=new HashMap<>();public String getString(String k,String d){return values.getOrDefault(k,d);}public Editor edit(){return new Editor();}public class Editor{public Editor putString(String k,String v){values.put(k,v);return this;}public void apply(){}}}''',
    'ls/augment/com/ParameterSlider.java': '''package ls.augment.com;class ParameterSlider extends android.view.View{
int max,calls;Integer marker;boolean enabled;String reason="";
ParameterSlider(){super(new android.content.Context());}
void measuredMarker(String s,String l,Integer p,int m,String w,boolean e){calls++;marker=p;max=p==null?0:m;enabled=e&&p!=null;}
void measuredRange(Integer m,String w,boolean e){calls++;max=m==null?0:m;enabled=e&&m!=null;}
void unavailable(String s){reason=s;enabled=false;}}''',
    'ls/augment/com/AppConfig.java':'package ls.augment.com;class AppConfig{static final String DIAGNOSTICS="diagnostics";}',
    'ls/augment/com/ConfigSchema.java':'package ls.augment.com;class ConfigSchema{static boolean truthy(String v){return "1".equals(v);}}',
})
harness=r'''package ls.augment.com;
import java.util.*;import android.view.*;import android.widget.TextView;import android.content.SharedPreferences;
public class SettingsRangeTest extends android.content.Context{
    static final int MODE_PRIVATE=0;static final String P="ls_augment_rm_recents_memory_";
    final Map<String,View> controls=new HashMap<>();final Map<String,String> values=new HashMap<>();
    final SharedPreferences preferences=new SharedPreferences();int memoryGeometryRequest;
    static class Queue{final ArrayDeque<Runnable> tasks=new ArrayDeque<>();boolean isShutdown(){return false;}void execute(Runnable r){tasks.add(r);}void post(Runnable r){tasks.add(r);}void postDelayed(Runnable r,int n){}void drain(){while(!tasks.isEmpty())tasks.remove().run();}}
    final Queue worker=new Queue(),main=new Queue();boolean destroyed;
    boolean isDestroyed(){return destroyed;}Display getDisplay(){View v=new View(this);v.width=1216;v.height=2688;return new Display(v);}
    SharedPreferences getSharedPreferences(String n,int m){return preferences;}
    String value(String key){return values.get(key);}
    ParameterSlider slider(String name){return (ParameterSlider)controls.get(P+name);}
    SettingsRangeTest(){
        resources.metrics.density=3.25f;resources.metrics.scaledDensity=5f;android.provider.Settings.System.scale=.85f;
        for(String o:new String[]{"portrait_","landscape_"})for(String a:new String[]{"left","top"})controls.put(P+o+a,new ParameterSlider());
        values.put(P+"style","1");values.put(P+"content","6");values.put(P+"detailed_size","11.53");values.put(P+"portrait_height","65");values.put(P+"landscape_height","60");values.put(P+"custom","1");values.put(P+"simple_size","12");
        values.put(P+"portrait_left","177");values.put(P+"portrait_top","1010");
    }
    void settle(){worker.drain();main.drain();}
    static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    public static void main(String[] args){
        SettingsRangeTest f=new SettingsRangeTest();f.refreshMemoryPosition();f.settle();
        for(String o:new String[]{"portrait_","landscape_"})for(String a:new String[]{"left","top"})check(f.slider(o+a).max>0&&f.slider(o+a).max<2000&&f.slider(o+a).enabled,"first settings entry has both ranges without Recents");
        check(f.slider("portrait_left").marker>0&&f.slider("portrait_left").marker<f.slider("portrait_left").max,"center tick at actual interior distance");
        check(f.slider("portrait_top").max==762&&f.slider("landscape_top").max==314,"screen and chosen heights define top ranges");
        check(f.value(P+"portrait_top").equals("1010")&&f.value(P+"portrait_left").equals("177"),"preserve saved offsets");
        check(f.preferences.values.size()==1&&f.preferences.getString(LauncherMemoryGeometry.UI_STATE,"").contains("local_calculation;portrait=ready;landscape=ready"),"no launcher measurement prerequisite");
        int before=f.slider("portrait_left").max;
        f.preferences.values.put(LauncherMemoryGeometry.KEY,"corrupt");f.preferences.values.put(LauncherMemoryGeometry.LANDSCAPE_KEY,"1;stale");
        f.refreshMemoryPosition();f.settle();check(f.slider("portrait_left").max==before,"stale diagnostics cannot hide marker");
        f.resources.metrics.scaledDensity=9;f.refreshMemoryPosition();f.settle();check(f.slider("portrait_left").max==before,"settings font override ignored");
        android.provider.Settings.System.scale=1.1f;f.refreshMemoryPosition();f.settle();check(f.slider("portrait_left").max<before,"system font recalculates immediately");
        android.provider.Settings.System.scale=.85f;
        f.values.put(P+"detailed_size","12");f.refreshMemoryPosition();f.values.put(P+"detailed_size","16");f.refreshMemoryPosition();f.settle();
        check(f.slider("portrait_left").max<before&&f.slider("portrait_left").enabled,"latest asynchronous draft wins");
        int wide=f.slider("portrait_left").max;
        f.values.put(P+"content","2");f.refreshMemoryPosition();f.settle();check(f.slider("portrait_left").max>wide,"short content expands range immediately");
        f.values.put(P+"portrait_height","100");f.values.put(P+"landscape_height","80");f.refreshMemoryPosition();f.settle();
        check(f.slider("portrait_top").max==727&&f.slider("landscape_top").max==294,"height changes update both ranges");
        WindowInsets.nav=new android.graphics.Insets(0,0,0,78);
        f.resources.ids.put("navigation_bar_height",78);f.resources.ids.put("navigation_bar_height_landscape",52);
        f.refreshMemoryPosition();f.settle();check(f.slider("portrait_top").max==703&&f.slider("landscape_top").max==278,"independent navigation heights");
        f.resources.ids.put("config_navBarInteractionMode",900);f.resources.ids.put("config_navBarCanMove",1);f.resources.ids.put("navigation_bar_width",90);
        LauncherMemorySizing.Screen screen=LauncherMemorySizing.readScreen(f,f.getDisplay());
        check(screen.region(true).width==2598&&screen.region(true).height==1216,"landscape button navigation reserves side");
        for(int rotation:new int[]{0,90,180,270}){
            boolean sideways=rotation==90||rotation==270;
            LauncherMemoryLayout rotated=screen.region(true,rotation,0,0,sideways?1216:2688,sideways?2688:1216);
            check(rotated.width==screen.region(true).width&&rotated.height==screen.region(true).height,"rotated host shares editor bounds");
        }
        WindowInsets.nav=android.graphics.Insets.NONE;
        Display.cutout=new DisplayCutout();Display.cutout.top=80;
        screen=LauncherMemorySizing.readScreen(f,f.getDisplay());
        check(screen.region(true).left==80&&screen.region(true).width==2608,"portrait physical cutout maps to landscape left");
        LauncherMemoryLayout reversed=screen.region(true,270,0,0,1216,2688);
        check(reversed.top==80&&reversed.bottom==2688,"reverse landscape reserves the same physical cutout edge");
        Display.physicalWidth=2688;Display.physicalHeight=1216;Display.rotation=3;Display.cutout.top=0;Display.cutout.right=80;
        screen=LauncherMemorySizing.readScreen(f,f.getDisplay());
        check(screen.region(true).left==0&&screen.region(true).right==2608,"already rotated reverse-landscape window reserves right cutout");
        Display.physicalWidth=0;Display.physicalHeight=0;Display.rotation=0;Display.cutout=null;
        for(float density:new float[]{1,2.75f,3.25f})for(float scale:new float[]{.85f,1,1.5f})for(int style:new int[]{0,1})for(int content=0;content<=6;content++){
            LauncherMemorySizing.Screen device=new LauncherMemorySizing.Screen(1216,2688,density,scale,new int[3],new int[3]);
            for(boolean horizontal:new boolean[]{false,true}){
                TextView text=new TextView(f);LauncherMemoryLayout region=device.region(horizontal);
                LauncherMemorySizing.Result result=LauncherMemorySizing.measure(text,device,region,24341727642L,14882027642L,style,content,18,65);
                check(device.px(result.maximumDp)+result.width+result.endInset<=region.width+1,"left endpoint stays inside display");
                check(device.px(result.maximumTopDp)+result.height<=region.height+1,"top endpoint stays inside display");
                double center=result.centerPx+text.getPaddingLeft()+(result.width-text.getPaddingLeft()-text.getPaddingRight())/2d;
                check(result.maximumDp==0||Math.abs(center-region.width/2d)<=.5,"tick centers actual text");
            }
        }
        f.values.put(P+"custom","0");f.refreshMemoryPosition();f.settle();check(!f.slider("portrait_left").enabled&&!f.slider("landscape_top").enabled,"disabled feature stays disabled");
        f.values.put(P+"custom","1");f.refreshMemoryPosition();ParameterSlider old=f.slider("portrait_left");int count=old.calls;
        f.controls.put(P+"portrait_left",new ParameterSlider());f.settle();check(old.calls==count&&f.slider("portrait_left").calls==0,"departed controls ignore queued results");
        System.out.println("PASS settings entry and shared sizing: "+checks+" checks; Android doubles, no device");
    }
'''
harness+=method('refreshMemoryPosition')+'\n'+method('applyMemoryPosition')+'\n}'
files['ls/augment/com/SettingsRangeTest.java']=harness
with tempfile.TemporaryDirectory(prefix='duo-memory-settings-') as temporary:
    root=Path(temporary)
    for name,content in files.items():
        target=root/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(content,encoding='utf-8')
    sources=list(root.rglob('*.java'))+[SRC/(name+'.java') for name in ('LauncherMemorySizing','LauncherMemoryGeometry','LauncherMemoryPresentation','LauncherMemoryLayout')]
    subprocess.run(['javac','-encoding','UTF-8','-d',str(root/'classes'),*map(str,sources)],check=True)
    subprocess.run(['java','-cp',str(root/'classes'),'ls.augment.com.SettingsRangeTest'],check=True)
