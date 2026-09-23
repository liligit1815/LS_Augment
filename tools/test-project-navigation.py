"""Execute the actual legacy navigation Activity with small Android lifecycle doubles."""
from pathlib import Path
import importlib.util
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
sources = {
    'android/os/Bundle.java': 'package android.os; public class Bundle {}',
    'android/content/Intent.java': '''package android.content;
public class Intent { public final Class<?> target;public Intent(Object owner,Class<?> target){this.target=target;} }''',
    'android/app/Activity.java': '''package android.app;
public class Activity {
 public int launches,finishes;public Class<?> target;
 protected void onCreate(android.os.Bundle state){} protected void onResume(){}
 public void startActivity(android.content.Intent intent){launches++;target=intent.target;}
 public void finish(){finishes++;}
}''',
    'ls/augment/com/HideAppsActivity.java': 'package ls.augment.com; public class HideAppsActivity {}',
    'ls/augment/com/TestHideNavigation.java': '''package ls.augment.com;
public class TestHideNavigation {
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 public static void main(String[] args){
  HiddenEntrySession.lock();HideMenuActivity locked=new HideMenuActivity();locked.onCreate(null);
  check(locked.launches==0&&locked.finishes==1,"locked entry must finish without navigating");
  for(int i=1;i<=7;i++)HiddenEntrySession.recordSystemVersionTap(i*100);
  HideMenuActivity open=new HideMenuActivity();open.onCreate(null);
  check(open.launches==1&&open.target==HideAppsActivity.class&&open.finishes==1,"open entry must redirect exactly once");
  HiddenEntrySession.lock();open.onResume();
  check(open.finishes==2&&open.launches==1,"relocked entry must close on resume");
  System.out.println("Hidden navigation: locked/open/relocked production Activity checks passed");
 }
}''',
}
with tempfile.TemporaryDirectory(prefix='ls-project-navigation-') as directory:
    work = Path(directory)
    files = []
    for name, source in sources.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        files.append(path)
    files += [SRC / name for name in ('HideMenuActivity.java', 'HiddenEntrySession.java')]
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory,
                    *map(str, files)], check=True)
    subprocess.run(['java', '-cp', directory, 'ls.augment.com.TestHideNavigation'], check=True, timeout=10)

# Independent failures must not prevent later project sections from executing.
spec = importlib.util.spec_from_file_location('project_checker', ROOT / 'tools/check-project.py')
checker = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checker)
failures, ran = [], []
def broken():
    raise AssertionError('intentional failure')
checker.run_check('first', broken, failures)
checker.run_check('second', broken, failures)
checker.run_check('later', lambda: ran.append(True), failures)
assert len(failures) == 2 and ran == [True]
print('Project checker: independent failures aggregate and later checks execute')
