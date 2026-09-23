"""Normalize actual shell assets in Java, then syntax-check them without execution.

Windows uses WSL's POSIX shell because Git for Windows can silently ignore CR.
No capture script, hardware write, root process or Android device is executed.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
ASSETS = ROOT / 'android/app/src/main/assets'
HARNESS = r'''package ls.augment.com;
import java.io.*;import java.nio.charset.StandardCharsets;import java.nio.file.*;
public final class TestShellScriptSource {
 static int checks;
 static void same(String expected,String actual,String why){checks++;if(!expected.equals(actual))throw new AssertionError(why);}
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static final class TrackedStream extends ByteArrayInputStream {
  boolean closed;TrackedStream(byte[] bytes){super(bytes);}public void close()throws IOException{closed=true;super.close();}
 }
 public static void main(String[] args)throws Exception {
  same("a\nb\nc\n",ShellScriptSource.normalize("a\r\nb\rc\n"),"mixed Windows/legacy/Unix line endings");
  same("#!/system/bin/sh\necho ready\n",ShellScriptSource.normalize("\uFEFF#!/system/bin/sh\r\necho ready\r\n"),"UTF-8 BOM and CRLF");
  same("",ShellScriptSource.normalize("\uFEFF"),"BOM-only asset");
  same("",ShellScriptSource.normalize(""),"empty asset");
  same("printf '\\r\\n'\necho '\uFEFF'\n",ShellScriptSource.normalize("printf '\\r\\n'\r\necho '\uFEFF'\r\n"),"literal escapes and interior BOM must remain literal");
  TrackedStream stream=new TrackedStream("\uFEFFecho '肩键'\r\n".getBytes(StandardCharsets.UTF_8));
  same("echo '肩键'\n",ShellScriptSource.readUtf8(stream),"UTF-8 stream is normalized");check(!stream.closed,"helper must not close a caller-owned stream");
  boolean propagated=false;try{ShellScriptSource.readUtf8(new InputStream(){public int read()throws IOException{throw new IOException("read failed");}});}catch(IOException expected){propagated=true;}
  check(propagated,"read errors must not silently produce partial shell commands");
  Path assets=Path.of(args[0]),out=Path.of(args[1]);
  for(String name:new String[]{"rapid_input_capture.sh","rapid_input_readonly.sh"}) {
   String original=Files.readString(assets.resolve(name),StandardCharsets.UTF_8);
   String lf=ShellScriptSource.normalize(original);
   String[] forms={lf,lf.replace("\n","\r\n"),lf.replace("\n","\r"),"\uFEFF"+lf,"\uFEFF"+lf.replace("\n","\r\n"),"\uFEFF"+lf.replace("\n","\r"),"\uFEFF"+lf.replaceFirst("\n","\r\n")};
   for(int i=0;i<forms.length;i++) {
    String normalized=ShellScriptSource.readUtf8(new ByteArrayInputStream(forms[i].getBytes(StandardCharsets.UTF_8)));
    same(lf,normalized,name+" source variant "+i);
    same(normalized,ShellScriptSource.normalize(normalized),"normalization is idempotent");
    Files.writeString(out.resolve(name+"."+i),normalized,StandardCharsets.UTF_8);
   }
   Files.writeString(out.resolve(name+".raw-crlf"),lf.replace("\n","\r\n"),StandardCharsets.UTF_8);
  }
  System.out.println("ShellScriptSource: "+checks+" actual-source UTF-8, BOM, line-ending and stream assertions passed");
 }
}
'''


def syntax_checker():
    if os.name != 'nt':
        return [shutil.which('sh') or '/bin/sh', '-n']
    wsl = shutil.which('wsl.exe')
    if not wsl:
        raise RuntimeError('WSL with a POSIX shell is required on Windows for CRLF regression checks')
    distro = os.environ.get('LSA_TEST_WSL_DISTRO')
    if not distro:
        listed = subprocess.run([wsl, '--list', '--quiet'], capture_output=True, check=True)
        names = listed.stdout.decode('utf-16-le').strip().splitlines()
        names = [name.strip().lstrip('*').strip() for name in names if 'docker' not in name.lower()]
        if not names:
            raise RuntimeError('No WSL test distribution found; set LSA_TEST_WSL_DISTRO')
        distro = names[0]
    return [wsl, '-d', distro, '--exec', '/bin/sh', '-n']


with tempfile.TemporaryDirectory(prefix='lsa-shell-source-') as directory:
    temporary = Path(directory)
    harness = temporary / 'ls/augment/com/TestShellScriptSource.java'
    harness.parent.mkdir(parents=True)
    harness.write_text(HARNESS, encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory,
                    str(JAVA / 'ShellScriptSource.java'), str(harness)], check=True)
    subprocess.run(['java', '-cp', directory, 'ls.augment.com.TestShellScriptSource',
                    str(ASSETS), directory], check=True, timeout=20)
    shell = syntax_checker()
    count = 0
    for name in ('rapid_input_capture.sh', 'rapid_input_readonly.sh'):
        raw = (temporary / (name + '.raw-crlf')).read_bytes()
        failed = subprocess.run(shell, input=raw, capture_output=True, timeout=20)
        assert failed.returncode != 0, f'{name}: test shell accepted raw CRLF; invalid regression environment'
        print(f'{name}: raw CRLF rejected with exit {failed.returncode}')
        for index in range(7):
            normalized = (temporary / f'{name}.{index}').read_bytes()
            result = subprocess.run(shell, input=normalized, capture_output=True, timeout=20)
            assert result.returncode == 0, f'{name}/{index}: {result.stderr.decode(errors="replace")}'
            count += 1
    production = (JAVA / 'RapidFirePhysicalCapture.java').read_text(encoding='utf-8')
    assert production.count('ShellScriptSource.readUtf8(input)') == 2, 'both capture paths must normalize assets'
    print(f'POSIX shell: {count} normalized actual-asset syntax checks passed; both capture entry points normalize')
