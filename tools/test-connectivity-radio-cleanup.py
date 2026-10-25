"""Run the production teardown against legacy and callback-owning frameworks.

The new framework invokes its own callback close() during unregistration. The
module must inherit that cleanup, unregister once, and tolerate reentrant stop.
No phone or telephony privileges are needed for this lifecycle regression.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/ConnectivityIconSource.java').read_text(encoding='utf-8')
start = SOURCE.index('void stopListening()')
end = SOURCE.index('{', start) + 1
depth = 1
while depth:
    depth += (SOURCE[end] == '{') - (SOURCE[end] == '}')
    end += 1
method = SOURCE[start:end]

HARNESS = r'''public class RadioCleanupTest {
 static int checks;
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static class TelephonyCallback {int frameworkClosed; /* FRAMEWORK_CLOSE */}
 static class TelephonyManager {
  int calls;boolean fail;Runnable reenter;
  void unregisterTelephonyCallback(TelephonyCallback callback){
   calls++;if(calls>2)throw new AssertionError("recursive unregister");
   /* FRAMEWORK_UNREGISTER */
   if(reenter!=null)reenter.run();
   if(fail)throw new SecurityException("revoked host access");
  }
 }
 static class Radio extends TelephonyCallback {
  TelephonyManager manager;boolean listening;String error="";
  Radio(TelephonyManager value,boolean active){manager=value;listening=active;}
  // PRODUCTION
 }
 public static void main(String[] args)throws Exception {
  TelephonyManager manager=new TelephonyManager();Radio radio=new Radio(manager,true);
  manager.reenter=()->{check(!radio.listening&&radio.manager==null,"state released before framework callback");radio.stopListening();};
  radio.stopListening();radio.stopListening();
  check(manager.calls==1,"unregister once across reentry and repeated stop");
  check(radio.frameworkClosed==/* EXPECTED_CLOSES */,"framework cleanup retains ownership");
  check(!radio.listening&&radio.manager==null,"closed subscription cannot retain its manager");
  for(java.lang.reflect.Method m:Radio.class.getDeclaredMethods())check(!m.getName().equals("close"),"no virtual close collision");
  TelephonyManager inactive=new TelephonyManager();Radio neverStarted=new Radio(inactive,false);neverStarted.stopListening();
  check(inactive.calls==0&&neverStarted.manager==null,"never-registered callbacks are not unregistered");
  Radio absent=new Radio(null,true);absent.stopListening();check(!absent.listening,"missing manager clears active state");
  TelephonyManager denied=new TelephonyManager();denied.fail=true;Radio revoked=new Radio(denied,true);
  revoked.stopListening();revoked.stopListening();
  check(denied.calls==1&&!revoked.listening&&revoked.manager==null,"failure remains idempotent");
  check(revoked.error.equals("radio_unregister:SecurityException"),"failure is diagnosed");
  for(int i=0;i<100;i++){TelephonyManager next=new TelephonyManager();Radio resumed=new Radio(next,true);resumed.stopListening();check(next.calls==1,"fresh callback per resumed subscription");}
  System.out.println("PASS callback teardown /* PROFILE */: "+checks+" assertions");
 }
}'''.replace('// PRODUCTION', method)

jdk = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
binary = lambda name: str(jdk / (name + ('.exe' if os.name == 'nt' else '')))
for modern in (False, True):
    source = HARNESS.replace('/* FRAMEWORK_CLOSE */', 'public void close(){frameworkClosed++;}' if modern else '')
    source = source.replace('/* FRAMEWORK_UNREGISTER */', 'callback.close();' if modern else '')
    source = source.replace('/* EXPECTED_CLOSES */', '1' if modern else '0').replace('/* PROFILE */', 'callback-close' if modern else 'legacy')
    with tempfile.TemporaryDirectory(prefix='duo-radio-cleanup-') as folder:
        file = Path(folder) / 'RadioCleanupTest.java'
        file.write_text(source, encoding='utf-8')
        subprocess.run([binary('javac'), '-encoding', 'UTF-8', '-d', folder, str(file)], check=True)
        subprocess.run([binary('java'), '-cp', folder, 'RadioCleanupTest'], check=True)
