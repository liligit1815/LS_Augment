"""Reject changed OEM executable code; accept only the audited NX819J DEX set.

Pass the extracted original NBFan.apk. No OEM binaries are stored in this repository.
"""
from pathlib import Path
import argparse
import os
import shutil
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("apk", type=Path)
args = parser.parse_args()
JAVA = r'''package ls.augment.com.hook;
public class TestFanOemContract {
 static int checks;
 static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static class Base { private boolean running; private void start(){} public static String read(String p){return p;} }
 static class Child extends Base {}
 static class Shadow extends Base { private String running; }
 static abstract class Abstract { abstract void start(); }
 static class Wrong { int start(){return 1;} static boolean running; }
 interface Action {void run()throws Exception;}
 static void reject(Action action)throws Exception {try{action.run();throw new AssertionError("accepted missing/incorrect member");}catch(NoSuchMethodException|NoSuchFieldException expected){checks++;}}
 public static void main(String[] args)throws Exception {
  check(FanOemContract.screenGate(args[0]),"audited original");
  check(FanOemContract.screenGate(args[1]),"same executable code with changed resource/signature envelope");
  for(int i=2;i<args.length;i++)check(!FanOemContract.screenGate(args[i]),"changed/missing/extra/duplicate code "+args[i]);
  check(!FanOemContract.screenGate(null)&&!FanOemContract.screenGate("missing.apk"),"absent source");
  check(FanMembers.method(Child.class,"start",void.class,false).getDeclaringClass()==Base.class,"inherited private controller method");
  check(FanMembers.method(Child.class,"read",String.class,true,String.class).getDeclaringClass()==Base.class,"inherited utility method");
  check(FanMembers.field(Child.class,"running",boolean.class).getDeclaringClass()==Base.class,"inherited state field");
  reject(()->FanMembers.method(Child.class,"start",void.class,false,boolean.class));
  reject(()->FanMembers.method(Wrong.class,"start",void.class,false));
  reject(()->FanMembers.method(Abstract.class,"start",void.class,false));
  reject(()->FanMembers.method(Child.class,"read",String.class,false,String.class));
  reject(()->FanMembers.field(Shadow.class,"running",boolean.class));
  reject(()->FanMembers.field(Wrong.class,"running",boolean.class));
  reject(()->FanMembers.field(Child.class,"missing",boolean.class));
  System.out.println("PASS OEM code identity and inherited/missing/wrong contracts: "+checks);
 }
}'''

def java(name):
    return shutil.which(name) or str(Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin" / (name + ".exe"))

with tempfile.TemporaryDirectory(prefix="lsa-fan-oem-") as temp:
    folder = Path(temp)
    with zipfile.ZipFile(args.apk) as source:
        dex = {n: source.read(n) for n in source.namelist() if n.endswith(".dex")}
    cases = [args.apk]
    for variant in ("resources", "changed", "missing", "extra", "duplicate", "invalid"):
        path = folder / (variant + ".apk")
        if variant == "invalid":
            path.write_bytes(b"invalid zip")
        else:
            with zipfile.ZipFile(path, "w", zipfile.ZIP_DEFLATED) as archive:
                for name, content in dex.items():
                    if variant == "missing" and name == "classes.dex":
                        continue
                    if variant == "changed" and name == "classes.dex":
                        content = content[:-1] + bytes([content[-1] ^ 1])
                    archive.writestr(name, content)
                archive.writestr("res/new-resource.txt", "changed package resources")
                if variant == "extra":
                    archive.writestr("classes3.dex", dex["classes.dex"])
                if variant == "duplicate":
                    archive.writestr("classes.dex", dex["classes.dex"])
        cases.append(path)
    harness = folder / "TestFanOemContract.java"
    harness.write_text(JAVA, encoding="utf-8")
    src = ROOT / "android/app/src/main/java/ls/augment/com/hook"
    subprocess.run([java("javac"), "-encoding", "UTF-8", "--release", "17", "-d", temp,
                    str(src / "FanOemContract.java"), str(src / "FanMembers.java"), str(harness)], check=True)
    subprocess.run([java("java"), "-cp", temp, "ls.augment.com.hook.TestFanOemContract", *map(str, cases)], check=True)
