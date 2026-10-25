"""Execute immutable media-open requests and the Root's final dispatch admission."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-lifecycle.py')))
SUPPORT, SRC, member = BASE['SUPPORT'], BASE['SRC'], BASE['member']
HEAD = r'''package ls.augment.com;import android.os.*;
final class AtomicWorkbenchMedia {
 Bundle descriptor;Runnable queryHook;int queries;
 Bundle action(String action,Bundle request){queries++;if(!"describe_open".equals(action))throw new AssertionError("unscoped action");if(queryHook!=null)queryHook.run();Bundle result=new Bundle(descriptor);result.putBoolean("success",true);return result;}
}
public final class TestMediaOpen {
 static final String ID="0123456789abcdef0123456789abcdef",COMPONENT="player/player.Main";
 int userId=0,dispatched,registeredChecks;long providerSession=4,providerResetGeneration=7;boolean unavailable,registered=true;Runnable registeredHook;
 final AtomicWorkbenchMedia value=new AtomicWorkbenchMedia();
 TestMediaOpen(){value.descriptor=descriptor();}
 boolean uiInputUnavailable(){return unavailable;}boolean registeredSessionCurrent(long session,long reset){registeredChecks++;if(registeredHook!=null)registeredHook.run();return registered;}
 AtomicWorkbenchMedia media(){return value;}
 static Bundle descriptor(){Bundle b=new Bundle();b.putString("open_source_id",ID);b.putString("open_component",COMPONENT);b.putString("open_package","player");b.putInt("open_user_id",0);b.putInt("open_owner_uid",10555);b.putLong("open_deadline_elapsed",6000);return b;}
 void dispatch(String component)throws Exception{AtomicWorkbenchLaunchBoundary.require(component);dispatched++;}
 static int cases,checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 interface Case {void run()throws Exception;}
 static void test(String name,Case action)throws Exception{SystemClock.now=1000;action.run();cases++;System.out.println("PASS actual media open: "+name);}
 static void rejects(Runnable action){try{action.run();throw new AssertionError("invalid metadata admitted");}catch(IllegalArgumentException expected){}}
 static void denied(Case action)throws Exception{try{action.run();throw new AssertionError("stale dispatch admitted");}catch(IllegalStateException expected){}}
'''
TEST = r'''
 public static void main(String[] args)throws Exception{
  test("descriptor freezes only exact typed identity and original deadline",()->{Bundle original=descriptor();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(original);Bundle metadata=r.metadata();check(metadata.keySet().size()==7&&r.matches(original),"descriptor metadata lost identity");original.putInt("open_owner_uid",20555);metadata.putLong("deadline",900000);check(r.ownerUid==10555&&r.deadline==6000&&r.metadata().getLong("deadline")==6000,"immutable request changed");});
  test("request expiry cannot be extended by the final refresh",()->{var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());check(r.fresh(1000)&&r.fresh(5999)&&!r.fresh(6000)&&!r.fresh(-1)&&!r.fresh(999),"deadline admission changed");Bundle action=r.actionMetadata(5000);check(action.getLong("created_elapsed")==5000&&action.getLong("deadline_elapsed")==6000&&action.getString("source_id").equals(ID),"refresh minted a new deadline");denied(()->r.actionMetadata(6000));});
  test("metadata parser rejects extra keys and coerced primitive types",()->{var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());Bundle extra=r.metadata();extra.putString("body","synthetic");rejects(()->AtomicWorkbenchMediaOpenRequest.parse(extra));Bundle wrong=r.metadata();wrong.putString("uid","10555");rejects(()->AtomicWorkbenchMediaOpenRequest.parse(wrong));Bundle foreign=r.metadata();foreign.putInt("uid",1010555);rejects(()->AtomicWorkbenchMediaOpenRequest.parse(foreign));});
  test("component and source registry ID are exact",()->{for(String key:new String[]{"open_source_id","open_component","open_package"}){Bundle b=descriptor();b.putString(key,key.equals("open_source_id")?"invalid":"other/Other");rejects(()->AtomicWorkbenchMediaOpenRequest.fromDescriptor(b));}});
  test("final Root admission refreshes a live matching source",()->{var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());check(f.mediaOpenCurrent(r.metadata(),COMPONENT)&&f.value.queries==1,"live source not refreshed");});
  test("queue expiry prevents the real dispatch and ordinary launches retain their own policy",()->{var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());try(AutoCloseable scope=f.mediaOpenBoundary(r.metadata(),COMPONENT,null)){SystemClock.now=6000;denied(()->f.dispatch(COMPONENT));check(f.dispatched==0,"expired media dispatched");}try{f.dispatch(COMPONENT);}catch(Exception error){throw new AssertionError("scope leaked into ordinary launch",error);}check(f.dispatched==1,"media TTL leaked into ordinary launch");});
  test("expiry during the source query remains denied",()->{var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());f.value.queryHook=()->SystemClock.now=6000;check(!f.mediaOpenCurrent(r.metadata(),COMPONENT),"deadline expired during query admitted");});
  test("expiry during the last Provider session check still prevents actual dispatch",()->{var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());f.registeredHook=()->{if(f.registeredChecks==2)SystemClock.now=6000;};try(AutoCloseable scope=f.mediaOpenBoundary(r.metadata(),COMPONENT,null)){denied(()->f.dispatch(COMPONENT));check(f.dispatched==0,"deadline expired during final session check admitted");}});
  test("source UID user component and token changes are all rejected at final dispatch",()->{for(String field:new String[]{"open_owner_uid","open_user_id","open_component","open_source_id"}){var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());try(AutoCloseable scope=f.mediaOpenBoundary(r.metadata(),COMPONENT,null)){if(field.equals("open_owner_uid"))f.value.descriptor.putInt(field,20555);else if(field.equals("open_user_id"))f.value.descriptor.putInt(field,10);else f.value.descriptor.putString(field,field.equals("open_component")?"player/player.Other":"1123456789abcdef0123456789abcdef");denied(()->f.dispatch(COMPONENT));check(f.dispatched==0,"changed media identity dispatched");}}});
  test("reset current-user or parked refusal cannot be replaced by a fresh media token",()->{for(boolean park:new boolean[]{false,true}){var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());if(park)f.unavailable=true;else f.registered=false;check(!f.mediaOpenCurrent(r.metadata(),COMPONENT)&&f.value.queries==0,"session refusal ignored");}});
  test("a reset during source refresh prevents actual dispatch",()->{var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());f.value.queryHook=()->f.registered=false;try(AutoCloseable scope=f.mediaOpenBoundary(r.metadata(),COMPONENT,null)){denied(()->f.dispatch(COMPONENT));check(f.dispatched==0,"reset during refresh dispatched media");}});
  test("the dispatch component cannot substitute another launcher",()->{var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());try(AutoCloseable scope=f.mediaOpenBoundary(r.metadata(),COMPONENT,null)){denied(()->f.dispatch("other/Other"));check(f.dispatched==0,"another launcher dispatched");}});
  test("scope freezes metadata and signals a denied attempt without sending it",()->{var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());Bundle m=r.metadata();var rejected=new java.util.concurrent.atomic.AtomicBoolean();try(AutoCloseable scope=f.mediaOpenBoundary(m,COMPONENT,rejected)){m.putLong("deadline",100000);SystemClock.now=6000;denied(()->f.dispatch(COMPONENT));check(rejected.get()&&f.dispatched==0,"rejection flag or immutable deadline lost");}});
  test("scope exceptions cannot contaminate the next command or another thread",()->{var f=new TestMediaOpen();var r=AtomicWorkbenchMediaOpenRequest.fromDescriptor(descriptor());try(AutoCloseable scope=f.mediaOpenBoundary(r.metadata(),COMPONENT,null)){Thread thread=new Thread(()->{try{AtomicWorkbenchLaunchBoundary.require("other/Other");}catch(Exception error){throw new AssertionError(error);}});thread.start();thread.join(5000);check(!thread.isAlive(),"scope leaked across threads");denied(()->f.dispatch("other/Other"));}f.dispatch("other/Other");check(f.dispatched==1,"failed scope leaked into next command");});
  System.out.println("MEDIA OPEN RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    source = (SRC / 'AtomicWorkbenchRoot.java').read_text(encoding='utf-8')
    body = '\n'.join(member(source, key) for key in ('private boolean mediaOpenCurrent', 'private AutoCloseable mediaOpenBoundary'))
    production = {name: (SRC / name).read_text(encoding='utf-8') for name in ('AtomicWorkbenchMediaOpenRequest.java','AtomicWorkbenchLaunchBoundary.java')}
    variants = [('production', production, body, None)]
    for label, filename, old, new, expected in (
        ('OWNER_UID_MUST_MATCH','AtomicWorkbenchMediaOpenRequest.java','&&userId==other.userId&&ownerUid==other.ownerUid&&deadline==other.deadline','&&userId==other.userId&&deadline==other.deadline','stale dispatch admitted'),
        ('SCOPE_MUST_END','AtomicWorkbenchLaunchBoundary.java','ACTIVE.remove();','','scope leaked into ordinary launch'),
    ):
        assert old in production[filename], label
        changed = dict(production); changed[filename] = changed[filename].replace(old,new,1)
        variants.append((label,changed,body,expected))
    for label,old,new,expected in (
        ('DISPATCH_MUST_RECHECK_SOURCE','!expectedComponent.equals(component) || !mediaOpenCurrent(frozen,component)','!expectedComponent.equals(component)','stale dispatch admitted'),
        ('LAST_PROVIDER_CANNOT_EXTEND_DEADLINE','&& registeredSessionCurrent(providerSession,providerResetGeneration)\n                    && target.fresh(android.os.SystemClock.elapsedRealtime())','&& registeredSessionCurrent(providerSession,providerResetGeneration)','stale dispatch admitted'),
        ('SOURCE_REFRESH_CANNOT_CROSS_RESET','&& registeredSessionCurrent(providerSession,providerResetGeneration)\n                    && target.fresh(android.os.SystemClock.elapsedRealtime())','&& target.fresh(android.os.SystemClock.elapsedRealtime())','stale dispatch admitted'),
    ):
        assert old in body,label
        variants.append((label,production,body.replace(old,new,1),expected))
    bundle = SUPPORT['BUNDLE'].replace('public void putBoolean','public Object get(String key){return data.get(key);}public java.util.Set<String> keySet(){return data.keySet();}public void putBoolean',1)
    for label,files,code,expected in variants:
        with tempfile.TemporaryDirectory(prefix='duo-media-open-') as temporary:
            work=Path(temporary)
            sources={'android/os/Bundle.java':bundle,'android/os/SystemClock.java':'package android.os;public final class SystemClock {public static long now;public static long elapsedRealtime(){return now;}}',
                     'android/content/ComponentName.java':'''package android.content;public final class ComponentName {final String pkg,cls;ComponentName(String p,String c){pkg=p;cls=c;}public String getPackageName(){return pkg;}public String flattenToString(){return pkg+"/"+cls;}public static ComponentName unflattenFromString(String v){if(v==null)return null;int i=v.indexOf('/');if(i<=0||i==v.length()-1)return null;String p=v.substring(0,i),c=v.substring(i+1);return new ComponentName(p,c.startsWith(".")?p+c:c);}}''',
                     'ls/augment/com/TestMediaOpen.java':HEAD+code+TEST}
            sources.update({'ls/augment/com/'+name:value for name,value in files.items()});paths=[]
            for name,value in sources.items():
                path=work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value,encoding='utf-8');paths.append(str(path))
            subprocess.run([SUPPORT['JAVAC'],'--release','17','-encoding','UTF-8','-d',str(work),*paths],check=True,timeout=60,env=SUPPORT['ENV'])
            result=subprocess.run([SUPPORT['JAVA'],'-Dfile.encoding=UTF-8','-cp',str(work),'ls.augment.com.TestMediaOpen'],encoding='utf-8',errors='replace',capture_output=True,timeout=30,env=SUPPORT['ENV'])
            if expected is None:
                print(result.stdout,end='');print(result.stderr,end='');result.check_returncode()
            else:
                assert result.returncode!=0 and expected in result.stdout+result.stderr,(label,result.stdout,result.stderr)
                print('PASS rejected media open negative:',label)


if __name__=='__main__':main()
