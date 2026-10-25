"""Exercise the actual bounded archive reader, with real ROM bytes and rejection cases."""
import hashlib
import json
import re
import subprocess
import tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
catalog=json.loads((ROOT/'out/redmagic12-12.0.15MR1/inspected/stage4/root-protection-candidate.json').read_text())
critical=(SRC/'RootCriticalProfile.java').read_text(encoding='utf-8')
pins={key:re.search(name+r'_SHA256="([0-9a-f]+)"',critical)[1] for key,name in [('1','SERVICES'),('2','FRAMEWORK')]}
frozen=catalog['admissionSourceSha256'] | {p['profile']+'.java':p['sourceSha256'] for p in catalog['profiles']}
for name,expected in frozen.items():
    assert hashlib.sha256((SRC/name).read_bytes()).hexdigest()==expected, 'Runtime profile/admission differs from frozen candidate: '+name
harness='''package ls.augment.com;
import java.nio.file.*;import java.io.*;
public class TestArchive {static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError();}
interface Work {void run()throws Exception;}
static void denied(Work work)throws Exception{try{work.run();throw new AssertionError("accepted invalid origin");}catch(IOException expected){checks++;}}
public static void main(String[] a)throws Exception{
 RootDexArchiveIndex actual=RootDexArchiveIndex.read(Path.of(a[0]),a[1]);check(actual.archiveSha256.equals(a[1]));check(actual.dexCount()==Integer.parseInt(a[3]));
 try{RootDexArchiveIndex.read(Path.of(a[0]),a[2]);throw new AssertionError("old profile accepted new archive");}
 catch(IOException expected){check(expected.getMessage().contains("expected="+a[2]));check(expected.getMessage().contains("observed="+a[1]));check(expected.getMessage().contains("admission remains denied"));}
 denied(()->actual.require("classes.dex",-1,0,"Lwrong;"));denied(()->actual.require("classes.dex",0,-1,"Lwrong;"));
 denied(()->actual.require("classes16.dex",0,0,"Lwrong;"));denied(()->actual.require("classes.dex",0,0,"Lwrong;"));
 check(RootDexArchiveIndex.entryFromLocation("/system/framework/services.jar!classes2.dex","/system/framework/services.jar","classes2.dex").equals("classes2.dex"));
 denied(()->RootDexArchiveIndex.entryFromLocation("/tmp/services.jar!classes2.dex","/system/framework/services.jar","classes2.dex"));
 denied(()->RootDexArchiveIndex.entryFromLocation("/system/framework/services.jar!classes3.dex","/system/framework/services.jar","classes2.dex"));
 denied(()->RootDexArchiveIndex.read(Path.of(a[0]),"bad"));System.out.println("PASS production archive reader: "+checks+" checks, runtime admission unchanged");}}
'''
with tempfile.TemporaryDirectory(prefix='duo-root-archive-') as folder:
    path=Path(folder)/'TestArchive.java';path.write_text(harness,encoding='utf-8')
    subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,str(SRC/'RootDexArchiveIndex.java'),str(path)],check=True)
    for family,artifact in catalog['artifacts'].items():
        path=ROOT/artifact['path']
        assert hashlib.sha256(path.read_bytes()).hexdigest()==artifact['sha256']
        subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.TestArchive',str(path),artifact['sha256'],pins[family],str(len(artifact['entries']))],check=True)
