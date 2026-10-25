"""Run the production loader methods; replace only JVM native loading with a recorder."""
from pathlib import Path
import re,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/hook/TgkRapidFireNative.java').read_text(encoding='utf-8')
methods=[]
for name in ['loadLibrary','addCandidate','runtimeArchDirectory']:
 start=re.search(r'private static (?:void|String) '+name+r'\(',source).start();body=source.index('{',start);depth=1;end=body+1
 while depth:
  depth+=(source[end]=='{')-(source[end]=='}');end+=1
 methods.append(source[start:end])
harness='''import java.io.*;import java.nio.file.*;import java.util.*;import java.util.zip.*;
class ApplicationInfo {String sourceDir;}
class Build {static final String[] SUPPORTED_ABIS={"arm64-v8a"};}
class System {static int absolute,named;static boolean linkFailure;
 static void load(String path){absolute++;if(linkFailure)throw new UnsatisfiedLinkError("test linker failure");}
 static void loadLibrary(String name){named++;}}
public class TestLoader {
 static int checks;static void check(boolean ok,String s){checks++;if(!ok)throw new AssertionError(s);}
 static void reset(){System.absolute=System.named=0;System.linkFailure=false;}
 static void denied(ApplicationInfo info,Path dir){boolean failed=false;try{loadLibrary(info,dir.toString(),"libduo.so","duo");}
 catch(UnsatisfiedLinkError e){failed=e.getMessage().startsWith("module_native_identity_unverified:");}
 check(failed&&System.absolute==0&&System.named==0,"identity rejection cannot fall through to name loading");}
 public static void main(String[]args)throws Exception {
 Path base=Path.of(args[0]),apk=base.resolve("base.apk"),dir=base.resolve("lib/arm64"),lib=dir.resolve("libduo.so");Files.createDirectories(dir);
 byte[] good={1,2,3};try(ZipOutputStream zip=new ZipOutputStream(Files.newOutputStream(apk))){zip.putNextEntry(new ZipEntry("lib/arm64-v8a/libduo.so"));zip.write(good);zip.closeEntry();}
 ApplicationInfo info=new ApplicationInfo();info.sourceDir=apk.toString();Files.write(lib,good);reset();loadLibrary(info,dir.toString(),"libduo.so","duo");
 check(System.absolute==1&&System.named==0,"verified absolute path");
 Files.write(lib,new byte[]{3,2,1});reset();denied(info,dir);
 Files.write(lib,good);reset();System.linkFailure=true;loadLibrary(info,dir.toString(),"libduo.so","duo");check(System.absolute==1&&System.named==1,"verified linker failure retains standard fallback");
 Files.delete(lib);reset();loadLibrary(info,dir.toString(),"libduo.so","duo");check(System.absolute==0&&System.named==1,"APK-internal resolver without extracted candidate retained");
 Path foreign=base.resolve("cache");Files.createDirectories(foreign);Files.write(foreign.resolve("libduo.so"),good);reset();denied(info,foreign);
 Files.write(lib,good);Files.write(apk,new byte[]{0});reset();denied(info,dir);
 java.lang.System.out.println("PASS native load fallback: "+checks+" production-method checks");}
// METHODS
}'''.replace('// METHODS','\n'.join(methods))
with tempfile.TemporaryDirectory(prefix='duo-native-loader-') as folder:
 path=Path(folder);java=path/'TestLoader.java';java.write_text(harness,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-d',str(path),str(java),str(ROOT/'android/app/src/main/java/ls/augment/com/OwnedNativeLibrary.java')],check=True)
 subprocess.run(['java','-cp',str(path),'TestLoader',str(path/'data')],check=True)
