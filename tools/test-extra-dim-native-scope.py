"""Exercise the real scoped native-read adapter, including cleanup and isolation."""
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
fixture=ROOT/'tools/test-extra-dim-runtime.py'
env={'__file__':str(fixture)}
exec(compile(fixture.read_text(encoding='utf-8').split('with tempfile.TemporaryDirectory(',1)[0],str(fixture),'exec'),env)
files=env['files'];SRC=env['SRC'];JDK=env['JDK']
files['ls/augment/com/hook/TestNativeScope.java']=r'''package ls.augment.com.hook;
import android.content.*;import android.provider.Settings.Secure;import java.lang.reflect.*;
public final class TestNativeScope {
 static int checks;static void check(boolean b,String label){checks++;if(!b)throw new AssertionError(label);}
 public static final class Target {
  final ContentResolver resolver=new ContentResolver(),other=new ContentResolver();
  ExtraDimNativeRequest adapter;int first,second,key,user,foreign,thread,nested;
  public void reads(){
   key=Secure.getIntForUser(resolver,"other",4,0);user=Secure.getIntForUser(resolver,"reduce_bright_colors_activated",9,10);
   foreign=Secure.getIntForUser(other,"reduce_bright_colors_activated",7,0);
   first=Secure.getIntForUser(resolver,"reduce_bright_colors_activated",0,0);
   second=Secure.getIntForUser(resolver,"reduce_bright_colors_activated",0,0);
  }
  public void nested()throws Exception{
   adapter.invoke(Target.class.getMethod("level"),this,resolver,0,"reduce_bright_colors_level",80,()->true);
   first=Secure.getIntForUser(resolver,"reduce_bright_colors_activated",0,0);
  }
  public void level(){nested=Secure.getIntForUser(resolver,"reduce_bright_colors_level",50,0);}
  public void throwsAfter(){first=Secure.getIntForUser(resolver,"reduce_bright_colors_activated",0,0);throw new IllegalStateException("native callback");}
  public void noRead(){first=27;}
  public void worker()throws Exception{
   Thread t=new Thread(()->thread=Secure.getIntForUser(resolver,"reduce_bright_colors_activated",0,0));t.start();t.join();
   first=Secure.getIntForUser(resolver,"reduce_bright_colors_activated",0,0);
  }
 }
 static void invoke(Target t,String method,java.util.function.BooleanSupplier guard)throws Exception{
  t.adapter.invoke(Target.class.getMethod(method),t,t.resolver,0,"reduce_bright_colors_activated",1,guard);
 }
 public static void main(String[] args)throws Exception{
  AugmentModule m=new AugmentModule();Target t=new Target();t.adapter=ExtraDimNativeRequest.install(m,TestNativeScope.class.getClassLoader());
  check(t.adapter!=null,"getter resolved by exact return and parameter types");
  invoke(t,"reads",()->true);
  check(t.first==1&&t.second==0,"one intended native read is substituted; listener reads remain native");
  check(t.key==4&&t.user==9&&t.foreign==7,"other key user and resolver never overridden");
  check(Secure.getIntForUser(t.resolver,"reduce_bright_colors_activated",0,0)==0,"scope is removed after callback returns");
  invoke(t,"nested",()->true);check(t.nested==80&&t.first==1,"nested scopes restore previous callback context");
  invoke(t,"worker",()->true);check(t.thread==0&&t.first==1,"scope cannot cross threads");
  boolean threw=false;try{invoke(t,"throwsAfter",()->true);}catch(InvocationTargetException e){threw=e.getCause() instanceof IllegalStateException;}
  check(threw&&Secure.getIntForUser(t.resolver,"reduce_bright_colors_activated",0,0)==0,"native exception is preserved and scope cleared");
  int before=t.first;threw=false;try{invoke(t,"reads",()->false);}catch(IllegalStateException e){threw=true;}
  check(threw&&t.first==before,"superseded delivery cannot start native callback");
  Secure.fail=true;threw=false;try{invoke(t,"reads",()->true);}catch(InvocationTargetException e){threw=true;}finally{Secure.fail=false;}
  check(threw&&Secure.getIntForUser(t.resolver,"reduce_bright_colors_activated",0,0)==0,"native getter failure cannot leak scope or fabricate success");
  invoke(t,"noRead",()->true);check(t.first==27&&FeatureRuntimeLog.events.stream().anyMatch(v->v.startsWith("EXTRA_DIM_NATIVE_READ_UNAVAILABLE:")),"unknown getter shape keeps original execution and reports missing capability");
  check(FeatureRuntimeLog.events.stream().anyMatch(v->v.contains("native=0;requested=1")),"actual native/provider disagreement is recorded");
  System.out.println("PASS ExtraDimNativeRequest: "+checks+" scope/isolation/exception checks");
 }
}'''
with tempfile.TemporaryDirectory(prefix='duo-dim-scope-') as tmp:
    work=Path(tmp);sources=[]
    for name,source in files.items():
        file=work/name;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(source,encoding='utf-8');sources.append(file)
    sources += [SRC/name for name in ('ExtraDimRuntime.java','ExtraDimControl.java','hook/ExtraDimHook.java','hook/ExtraDimNativeRequest.java')]
    subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','--release','17','-d',tmp,*map(str,sources)],check=True)
    subprocess.run([str(JDK/'java.exe'),'-cp',tmp,'ls.augment.com.hook.TestNativeScope'],check=True,timeout=20)
    mutant=work/'ls/augment/com/hook/ExtraDimNativeRequest.java'
    mutant.write_text((SRC/'hook/ExtraDimNativeRequest.java').read_text(encoding='utf-8').replace('return read.value;','return nativeValue;'),encoding='utf-8')
    subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','--release','17','-cp',tmp,'-d',tmp,str(mutant)],check=True)
    result=subprocess.run([str(JDK/'java.exe'),'-cp',tmp,'ls.augment.com.hook.TestExtraDimHook'],capture_output=True,text=True,timeout=20)
    assert result.returncode!=0 and 'fresh provider values correct both native callbacks despite divergent Secure cache' in result.stderr,result.stdout+result.stderr
    print('PASS stale native-read regression mutant rejected by production-hook test')
