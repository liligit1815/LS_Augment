"""Actual AppConfig, schema and durable store preserve selection evidence.

Reuses existing Android/transport doubles without invoking that test runner.
No device, Root or production preferences are accessed. --app-source permits a
behavioral negative control against the pre-finding actual AppConfig source.
"""
import argparse
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--app-source', type=Path, default=SRC / 'AppConfig.java')
    args = parser.parse_args()
    helper = ROOT / 'tools/test-app-config-async.py'
    scope = {'__file__': str(helper)}
    exec(compile(helper.read_text(encoding='utf-8').split(
        "with tempfile.TemporaryDirectory(prefix='ls-app-config-async-')", 1)[0],
        str(helper), 'exec'), scope)
    sources = dict(scope['sources'])
    # The behavior under test is real, including normalization and runtime-key
    # exclusion. Replace the earlier async fixture's lightweight schema doubles.
    runner = (ROOT / 'tools/run-java-tests.sh').read_text(encoding='utf-8')
    production = [ROOT / p for p in re.findall(r'"\$ROOT/([^"]+\.java)"', runner)
                  if p.startswith('android/app/src/main/')]
    for source in production:
        sources.pop('ls/augment/com/' + source.name, None)
    sources.pop('ls/augment/com/ConfigSnapshot.java', None)
    sources.pop('ls/augment/com/TestAppConfigAsync.java', None)
    sources['ls/augment/com/TestHideUserConfigRaw.java'] = r'''package ls.augment.com;
import android.content.*;import java.util.*;import java.util.concurrent.*;
public final class TestHideUserConfigRaw {
 static int passed,failed;
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 public static void main(String[] args){
  List<String> cases=List.of("", "0:com.example.app", "v3:0:0:com.example.app",
   "p3:27:42:com.example.app", "v9:27:42:com.example.app", "0:com.example.app;;",
   " 0:com.example.app ", "v3:0:0:com.example.app\n", "x".repeat(65537));
  for(String raw:cases){
   try {
    var shared=AppConfig.class.getDeclaredField("sharedConfig");shared.setAccessible(true);shared.set(null,null);
    FakeContext context=new FakeContext();
    context.prefs(AppConfig.PREFS).edit().putString(AppConfig.HIDE_TARGETS,raw).commit();
    AppConfig config=new AppConfig(context);
    check(config.get(AppConfig.HIDE_TARGETS).equals(raw),"getter lost exact evidence");
    check(config.snapshot().get(AppConfig.HIDE_TARGETS).equals(raw),"export snapshot lost evidence");
    check(!ConfigSchema.runtimeKeys().contains(AppConfig.HIDE_TARGETS),"selection entered runtime config");
    var before=config.configSnapshot();
    var saved=config.save(Map.of(ConfigSchema.HIDE_MASTER,"0",ConfigSchema.AUTOMATION_ENABLED,"0"));
    check(saved.success,"ordinary pause save rejected by unrelated raw selection");
    check(context.prefs(AppConfig.PREFS).disk.get(AppConfig.HIDE_TARGETS).equals(raw),"ordinary save overwrote raw evidence");
    check(config.get(AppConfig.HIDE_TARGETS).equals(raw)&&config.snapshot().get(AppConfig.HIDE_TARGETS).equals(raw),"save changed current/export view");
    check(config.configSnapshot().revision>before.revision,"runtime snapshot was replaced by safe defaults");
    check(!config.save(Map.of(ConfigSchema.STORE_DOWNLOAD_COUNT,"invalid")).success,"other schema validation weakened");
    passed++;System.out.println("PASS raw selection len="+raw.length()+" prefix="+raw.substring(0,Math.min(36,raw.length())).replace('\n',' '));
   }catch(Throwable error){failed++;System.out.println("FAIL raw selection len="+raw.length()+": "+error);}
  }
  System.out.println("RAW CONFIG RESULT "+passed+" passed, "+failed+" failed; 0 skipped");
  if(failed>0)System.exit(1);
 }
''' + scope['fault_classes'] + '\n}\n'
    with tempfile.TemporaryDirectory(prefix='lsa-user-config-raw-') as folder:
        work = Path(folder)
        files = []
        for relative, code in sources.items():
            path = work / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(code, encoding='utf-8')
            files.append(path)
        # Preserve the declared class filename even for an arbitrary snapshot path.
        app = work / 'ls/augment/com/AppConfig.java'
        app.write_bytes(args.app_source.read_bytes())
        files += [app, *production, *[SRC / name for name in (
            'ConfigSnapshot.java', 'FrameworkConfigSync.java', 'DurablePreferences.java',
            'RuntimeStateStore.java', 'RemoteConfig.java')]]
        subprocess.run(['javac', '--release', '17', '-encoding', 'UTF-8', '-d', folder,
                        *map(str, dict.fromkeys(files))], check=True, timeout=40)
        return subprocess.run(['java', '-cp', folder, 'ls.augment.com.TestHideUserConfigRaw'],
                              timeout=15).returncode


if __name__ == '__main__':
    raise SystemExit(main())
