"""Execute the production backup reference collector with real JSON and schema classes."""
from pathlib import Path
import os, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/ConfigTransferActivity.java').read_text(encoding='utf8')
collector=source[source.index('    private static Set<String> iconHashes('):source.index('    @Override protected void onActivityResult(',source.index('    private static Set<String> iconHashes('))]
code='''package ls.augment.com;import org.json.*;import java.util.*;import java.io.*;public class TestCleanupBackup {'''+collector+'''
 public static void main(String[] args)throws Exception {
  String a="a".repeat(64),b="b".repeat(64);JSONObject values=new JSONObject();values.put(LauncherOptions.CLEANUP_ICON,a);values.put(LauncherOptions.CLEANUP_BOMB,"0");values.put(ConfigSchema.TILE_ICON,b);
  if(!iconHashes(values).equals(Set.of(a,b)))throw new AssertionError("disabled cleanup selection and other images must be backed up");
  values.put(LauncherOptions.CLEANUP_ICON,"");if(!iconHashes(values).equals(Set.of(b)))throw new AssertionError("reset excludes only cleanup image");
  values.put(LauncherOptions.CLEANUP_ICON,b);if(!iconHashes(values).equals(Set.of(b)))throw new AssertionError("shared content deduplicated");
  System.out.println("PASS cleanup backup references: 3 checks");
 }}'''
jar=next((Path.home()/'.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/*.jar'))
bin=Path(os.environ['JAVA_HOME'])/'bin'
with tempfile.TemporaryDirectory(prefix='duo-cleanup-backup-') as temp:
    path=Path(temp)/'TestCleanupBackup.java';path.write_text(code,encoding='utf8')
    cp=os.pathsep.join([str(jar),str(ROOT/'outputs/prototype-current/native-ui-test-classes')])
    subprocess.run([str(bin/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',temp,str(path)],check=True)
    subprocess.run([str(bin/'java.exe'),'-cp',temp+os.pathsep+cp,'ls.augment.com.TestCleanupBackup'],check=True)
