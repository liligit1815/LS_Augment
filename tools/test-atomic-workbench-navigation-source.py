"""Actual Amap memory + actual LinkSDK merge must not borrow another source lifetime.

This adds no route inference: only same-Amap, already authenticated NMS generation
may survive a merger's rebuilt Bundle. Original LinkSDK lifecycle suite stays intact.
"""
from pathlib import Path
import argparse
import runpy
import subprocess
import tempfile

MEMORY=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-amap-memory.py')))
LINK=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-amap-link.py')))
SUPPORT=MEMORY['SUPPORT'];SRC=SUPPORT['SRC']
MEMORY_TEST=r'''package ls.augment.com;import android.os.*;
public class NavigationMemorySourceHarness {
 static int tests,checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static class F {Object owner=new Object();AtomicWorkbenchAmapMemory memory=new AtomicWorkbenchAmapMemory();
 F(){SystemClock.now=1000;memory.touch(owner,1000);Binder producer=new Binder();Bundle r=new Bundle();r.putInt("version",1);r.putBinder("producer",producer);r.putLong("route",1);Bundle credentials=memory.register(owner,10446,8001,r);check(credentials.getBoolean("success"),"actual registration");
 Bundle b=new Bundle(r);b.putString("writer",credentials.getString("writer"));b.putLong("session",credentials.getLong("session"));b.putLong("sequence",1);b.putString("status","active");b.putString("source","drive");b.putString("title","前方 200 米右转");b.putString("content","");b.putLong("elapsed",1000);check(memory.publish(owner,10446,8001,b).getBoolean("success"),"actual publication");}
 Bundle fallback(String pkg,Object generation){Bundle b=new Bundle();b.putBoolean("owner_user_current",true);b.putString("navigation_status","no_guidance");b.putString("package",pkg);if(generation instanceof String)b.putString("navigation_source_generation",(String)generation);else if(generation instanceof Integer)b.putInt("navigation_source_generation",(Integer)generation);return b;}}
 public static void main(String[] args){
 for(int mode=0;mode<6;mode++){F f=new F();String pkg=mode==1?"com.other.map":AtomicWorkbenchAmapData.PACKAGE;Object generation=mode==2?"not-a-proof":mode==3?"a".repeat(32):mode==4?null:mode==5?Integer.valueOf(3):"a".repeat(33);Bundle b=f.memory.merge(f.owner,f.fallback(pkg,generation));check(b.getBoolean("has_guidance"),"merge lost actual route");check(mode==0?b.getString("navigation_source_generation","").equals(generation):!b.containsKey("navigation_source_generation"),"wrong source lifetime propagated");tests++;}
 System.out.println("NAVIGATION MEMORY SOURCE RESULT "+tests+" cases; "+checks+" assertions");}}
'''
LINK_EXTRA=r'''
  test("rebuilt Link frame retains only same-Amap authenticated NMS lifetime",()->{for(int mode=0;mode<6;mode++)try(Fixture f=new Fixture()){f.send(payload(12));idle(f.client);Bundle b=fallback();b.putString("package",mode==1?"com.other.map":AtomicWorkbenchAmapData.PACKAGE);if(mode!=4){if(mode==5)b.putInt("navigation_source_generation",3);else b.putString("navigation_source_generation",mode==2?"not-a-proof":mode==3?"a".repeat(32):"a".repeat(33));}Bundle merged=f.client.merge(b);check(merged.containsKey(AtomicWorkbenchAmapData.METRICS),"actual Link frame absent");check(mode==0?"a".repeat(33).equals(merged.getString("navigation_source_generation")):!merged.containsKey("navigation_source_generation"),"Link borrowed unrelated or fabricated lifetime");}});
'''

def run(kind, override=None, quiet=False):
    if kind=='memory':
        sources={**MEMORY['SOURCES'],'ls/augment/com/NavigationMemorySourceHarness.java':MEMORY_TEST}
        names=('AtomicWorkbenchAmapMemory','AtomicWorkbenchAmapData');entry='ls.augment.com.NavigationMemorySourceHarness';jar=None
    else:
        test=LINK['TEST'];anchor='  System.out.println("WORKBENCH AMAP LINK RESULT '
        assert anchor in test
        sources={**LINK['SOURCES'],'ls/augment/com/TestWorkbenchAmapLink.java':test.replace(anchor,LINK_EXTRA+'\n'+anchor,1)}
        names=('AtomicWorkbenchAmapLinkClient','AtomicWorkbenchAmapLinkData','AtomicWorkbenchAmapData');entry='ls.augment.com.TestWorkbenchAmapLink'
        jars=list((Path.home()/'.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/*.jar'))
        jar=next(iter(jars),Path(__file__).resolve().parents[1]/'audit-output/release-test20497/dependencies/json-20240303.jar')
        assert jar.is_file(),'actual org.json runtime required'
    with tempfile.TemporaryDirectory(prefix='lsa-nav-source-') as temporary:
        work=Path(temporary);files=[]
        for name in names:
            sources['ls/augment/com/'+name+'.java']=(override or {}).get(name,(SRC/(name+'.java')).read_text(encoding='utf-8'))
        for name,content in sources.items():
            p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(str(p))
        command=[SUPPORT['JAVAC'],'--release','17','-encoding','UTF-8','-d',str(work)]
        if jar: command+=['-cp',str(jar)]
        built=subprocess.run(command+files,timeout=60,capture_output=True,text=True,env=SUPPORT['ENV'])
        if built.returncode:raise RuntimeError(built.stdout+built.stderr)
        result=subprocess.run([SUPPORT['JAVA'],'-cp',str(work)+((';' if __import__('os').name=='nt' else ':')+str(jar) if jar else ''),entry],timeout=40,capture_output=True,text=True,env=SUPPORT['ENV'])
        if not quiet:print(result.stdout,end='')
        return result

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--negative-controls',action='store_true');args=parser.parse_args()
    for kind in ('memory','link'):
        result=run(kind)
        if result.returncode:raise RuntimeError(result.stderr)
    if args.negative_controls:
        for kind,name,before,after in (
            ('memory','AtomicWorkbenchAmapMemory','amapFallback&&sourceGeneration','sourceGeneration'),
            ('link','AtomicWorkbenchAmapLinkClient','AtomicWorkbenchAmapData.PACKAGE.equals(fallback.getString("package",""))&&sourceGeneration','sourceGeneration')):
            content=(SRC/(name+'.java')).read_text(encoding='utf-8');assert before in content
            result=run(kind,{name:content.replace(before,after,1)},True)
            assert result.returncode!=0,kind+' unrelated-lifetime mutant survived'
            print('NEGATIVE CONTROL killed:',kind+'-borrows-other-map-generation')
if __name__=='__main__':main()
