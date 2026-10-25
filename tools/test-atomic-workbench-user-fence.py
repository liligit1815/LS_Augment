"""Execute the Root's actual current-user/session gates, including an IPC user switch."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-lifecycle.py')))
SUPPORT, SRC, member = BASE['SUPPORT'], BASE['SRC'], BASE['member']
HEAD = r'''package ls.augment.com;import android.os.*;
final class AtomicWorkbenchProvider {static final String INPUT_SESSION="current";}
final class AtomicWorkbenchProtocol {static final int VERSION=1;}
final class AtomicWorkbenchEngine {boolean parked;boolean uiParked(){return parked;}}
public final class TestUserFence extends IBinder {
 boolean closing,finished,registered=true;long providerSession=4,providerResetGeneration=7;int appUid=10555,userId=0,queries;String token="fixed";
 IBinder owner=new IBinder();AtomicWorkbenchEngine backend=new AtomicWorkbenchEngine();boolean providerCurrent=true;Runnable queryHook;
 Bundle callWorkbenchProvider(int user,String method,Bundle query){queries++;if(queryHook!=null)queryHook.run();Bundle b=new Bundle();b.putBoolean("current",providerCurrent);return b;}
 static int cases,checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 interface Case {void run()throws Exception;}static void test(String name,Case run)throws Exception{android.app.ActivityManager.user=0;android.app.ActivityManager.failure=false;run.run();cases++;System.out.println("PASS actual Root user fence: "+name);}
'''
TEST = r'''
 public static void main(String[] args)throws Exception{
  test("current exact session permits attached input",()->{var f=new TestUserFence();check(f.inputSessionCurrent(4,7)&&f.queries==1&&!f.uiInputUnavailable(),"current session rejected");});
  test("foreign current user cannot reach Provider or input",()->{var f=new TestUserFence();android.app.ActivityManager.user=10;check(!f.inputSessionCurrent(4,7)&&f.queries==0&&f.uiInputUnavailable(),"foreign current user admitted");});
  test("unknown current user cannot authorize a new input or output attachment",()->{var f=new TestUserFence();android.app.ActivityManager.failure=true;check(!f.registeredSessionCurrent(4,7)&&f.queries==0&&f.uiInputUnavailable(),"unknown user admitted");});
  test("switch during Provider IPC revokes the apparent successful session",()->{var f=new TestUserFence();f.queryHook=()->android.app.ActivityManager.user=10;check(!f.inputSessionCurrent(4,7)&&f.queries==1,"IPC user switch admitted");});
  test("parked session remains eligible for authenticated resume but never for editor input",()->{var f=new TestUserFence();f.backend.parked=true;check(!f.inputSessionCurrent(4,7)&&f.queries==0&&f.uiInputUnavailable(),"parked input admitted");check(f.registeredSessionCurrent(4,7)&&f.queries==1,"parked owner could not authenticate resume");});
  test("dead owner cannot authenticate even if Provider would return current",()->{var f=new TestUserFence();f.owner.alive=false;check(!f.registeredSessionCurrent(4,7)&&f.queries==0,"dead owner admitted");});
  test("retired closing and finished sessions remain rejected",()->{for(int kind=0;kind<3;kind++){var f=new TestUserFence();if(kind==0)f.registered=false;if(kind==1)f.closing=true;if(kind==2)f.finished=true;check(!f.registeredSessionCurrent(4,7)&&f.queries==0,"retired session admitted");}});
  test("session and reset generations are both exact",()->{var f=new TestUserFence();check(!f.registeredSessionCurrent(5,7)&&!f.registeredSessionCurrent(4,8)&&f.queries==0,"stale generation admitted");});
  test("Provider reset refusal cannot be replaced by a known current user",()->{var f=new TestUserFence();f.providerCurrent=false;check(!f.registeredSessionCurrent(4,7)&&f.queries==1,"reset refusal ignored");});
  System.out.println("USER FENCE RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    source = (SRC / 'AtomicWorkbenchRoot.java').read_text(encoding='utf-8')
    body = '\n'.join(member(source, key) for key in ('private boolean inputSessionCurrent',
                    'private boolean registeredSessionCurrent', 'private boolean uiInputUnavailable', 'private static int currentUserId'))
    variants = [('production', body, None)]
    for label, old, new, expected in (
        ('CURRENT_USER_BEFORE_PROVIDER', 'currentUserId() != userId || !registered', '!registered', 'foreign current user admitted'),
        ('CURRENT_USER_AFTER_PROVIDER', '&& currentUserId() == userId;', ';', 'IPC user switch admitted'),
        ('PARKED_EDITOR_MUST_REJECT', '(backend == null || !backend.uiParked())', 'true', 'parked input admitted'),
    ):
        assert old in body, label
        variants.append((label, body.replace(old, new, 1), expected))
    bundle = SUPPORT['BUNDLE'].replace('public void putBoolean', 'public void putBinder(String key,IBinder binder){}public void putBoolean', 1)
    for label, code, expected in variants:
        with tempfile.TemporaryDirectory(prefix='duo-user-fence-') as temporary:
            work = Path(temporary)
            files = {'android/os/Bundle.java': bundle,
                     'android/os/IBinder.java': 'package android.os;public class IBinder {public boolean alive=true;public boolean isBinderAlive(){return alive;}}',
                     'android/app/ActivityManager.java': 'package android.app;public final class ActivityManager {public static int user;public static boolean failure;public static int getCurrentUser(){if(failure)throw new IllegalStateException("fixed");return user;}}',
                     'ls/augment/com/TestUserFence.java': HEAD + code + TEST}
            paths = []
            for name, value in files.items():
                path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(value, encoding='utf-8'); paths.append(str(path))
            subprocess.run([SUPPORT['JAVAC'], '--release', '17', '-encoding', 'UTF-8', '-d', str(work), *paths], check=True, timeout=60, env=SUPPORT['ENV'])
            result = subprocess.run([SUPPORT['JAVA'], '-cp', str(work), 'ls.augment.com.TestUserFence'], text=True, capture_output=True, timeout=30, env=SUPPORT['ENV'])
            if expected is None:
                print(result.stdout, end=''); print(result.stderr, end=''); result.check_returncode()
            else:
                assert result.returncode != 0 and expected in result.stdout + result.stderr, (label, result.stdout, result.stderr)
                print('PASS rejected actual user fence negative:', label)


if __name__ == '__main__':
    main()
