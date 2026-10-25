#!/usr/bin/env python3
"""Actual host cppjieba/JNI + production Java contract; Android runtime remains separate."""
from __future__ import annotations
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import uuid

ROOT = Path(__file__).resolve().parents[1]
JDK = Path(os.environ.get("JAVA_HOME", r"C:\Program Files\Android\openjdk\jdk-21.0.8"))
VS = Path(r"C:\Program Files\Microsoft Visual Studio\18\Enterprise\VC\Auxiliary\Build\vcvars64.bat")

STUBS = {
    "android/content/Context.java": """package android.content;
import android.content.res.AssetManager; import java.io.File;
public class Context {
  private final AssetManager assets; private final File privateFiles;
  public Context(File assets, File privateFiles) {this.assets=new AssetManager(assets);this.privateFiles=privateFiles;privateFiles.mkdirs();}
  public Context getApplicationContext(){return this;} public boolean isDeviceProtectedStorage(){return false;}
  public File getNoBackupFilesDir(){return privateFiles;} public AssetManager getAssets(){return assets;}
}""",
    "android/content/res/AssetManager.java": """package android.content.res;
import java.io.*;
public class AssetManager {
  private final File root; public volatile boolean corrupt;
  public AssetManager(File root){this.root=root;}
  public InputStream open(String path)throws IOException {
    return corrupt?new ByteArrayInputStream(new byte[]{1}):new FileInputStream(new File(root,path));
  }
}""",
    "android/os/Looper.java": """package android.os; public class Looper {
  private static final Looper MAIN=new Looper(); public static Looper getMainLooper(){return MAIN;}
}""",
    "android/os/Handler.java": """package android.os; import java.util.concurrent.*;
public class Handler {
  static final ExecutorService MAIN=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"HostMain");t.setDaemon(true);return t;});
  public Handler(Looper looper){} public boolean post(Runnable r){MAIN.execute(r);return true;}
}""",
}

def run(arguments, log: Path, timeout=120):
    result = subprocess.run([str(x) for x in arguments], cwd=ROOT, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, timeout=timeout)
    log.write_bytes(result.stdout)
    if result.returncode:
        print(result.stdout.decode("utf-8", errors="replace")[-5000:])
        raise RuntimeError(f"Fixed test failure in {log.name}")
    return result.stdout.decode("utf-8", errors="replace")

def compile_java(output: Path, source: str | None = None):
    src, classes = output / "java-src", output / "classes"
    files = []
    for name, code in STUBS.items():
        file = src / name; file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(code, encoding="utf-8"); files.append(file)
    product = src / "ls/augment/com/AtomicWorkbenchTextSegmenter.java"
    product.parent.mkdir(parents=True, exist_ok=True)
    product.write_text(source if source is not None else
        (ROOT / "android/app/src/main/java/ls/augment/com/AtomicWorkbenchTextSegmenter.java").read_text(encoding="utf-8"), encoding="utf-8")
    files.extend([product, ROOT / "tools/tests/AtomicWorkbenchTextSegmenterHostTest.java"])
    run([JDK / "bin/javac.exe", "-encoding", "UTF-8", "-d", classes, *files], output / "java-compile.txt")
    return classes

def java_command(classes: Path, output: Path, dll_directory: Path):
    return [JDK / "bin/java.exe", f"-Djava.library.path={dll_directory}", "-cp", classes,
            "ls.augment.com.AtomicWorkbenchTextSegmenterHostTest", ROOT / "android/app/src/main/assets",
            output / ("private-" + uuid.uuid4().hex)]

def main():
    parser=argparse.ArgumentParser(); parser.add_argument("--output", type=Path,
        default=ROOT / "audit-output/workbench-completion-20261016/text-segmenter")
    args=parser.parse_args(); output=args.output.resolve(); output.mkdir(parents=True,exist_ok=True)
    cpp=ROOT / "android/app/src/main/cpp"; vendor=cpp / "vendor/cppjieba/include"
    if not VS.is_file(): raise RuntimeError("MSVC developer toolchain is unavailable")
    common=f'cl /nologo /std:c++17 /EHsc /utf-8 /W3 /I"{cpp}" /I"{vendor}"'
    commands=["@echo off", f'call "{VS}" >nul', "if errorlevel 1 exit /b 1",
        f'{common} /Fo"{output / "native-test.obj"}" /Fe"{output / "native-test.exe"}" "{ROOT / "tools/tests/atomic-workbench-text-native.cpp"}"',
        "if errorlevel 1 exit /b 1",
        f'"{output / "native-test.exe"}" "{ROOT / "android/app/src/main/assets/workbench-text-dict"}" "{output}"',
        "if errorlevel 1 exit /b 1",
        f'{common} /LD /I"{JDK / "include"}" /I"{JDK / "include/win32"}" /Fo"{output / "text-jni.obj"}" /Fe"{output / "lsaugment_text.dll"}" "{cpp / "atomic_workbench_text_jni.cpp"}"',
        "if errorlevel 1 exit /b 1"]
    batch=output / "build-host-native-and-jni.cmd"; batch.write_text("\r\n".join(commands)+"\r\n",encoding="utf-8")
    native=run(["cmd.exe", "/d", "/c", batch], output / "host-native-and-jni.txt")
    classes=compile_java(output)
    actual=run(java_command(classes,output,output), output / "host-java-jni.txt")
    source=(ROOT / "android/app/src/main/java/ls/augment/com/AtomicWorkbenchTextSegmenter.java").read_text(encoding="utf-8")
    controls=[
        ("accept-mid-byte-offset", "Arrays.fill(byteToUtf16, -1);", "Arrays.fill(byteToUtf16, 0);", "INVALID_NATIVE_OFFSET_REJECTED"),
        ("return-mutable-tokens", "this.tokens = Collections.unmodifiableList(new ArrayList<>(tokens));", "this.tokens = new ArrayList<>(tokens);", "IMMUTABLE_TOKEN_LIST"),
        ("automatic-retry-after-failure", "if (state == State.FAILED) throw new IllegalStateException(\"TEXT_ENGINE_FAILED\");", "if (state == State.FAILED) state = State.NOT_LOADED;", "NO_BACKGROUND_RETRY_OR_FAKE_TOKENS"),
    ]
    negative=[]
    for name,before,after,marker in controls:
        if before not in source: raise RuntimeError("Negative control anchor missing")
        location=output / ("negative-"+name); location.mkdir(exist_ok=True)
        mutant=compile_java(location,source.replace(before,after))
        result=subprocess.run([str(x) for x in java_command(mutant,location,output)],cwd=ROOT,
                              stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=120)
        (location / "result.txt").write_bytes(result.stdout)
        caught=result.returncode!=0 and marker.encode() in result.stdout
        negative.append({"name":name,"caught":caught,"expectedAssertion":marker})
        if not caught: raise RuntimeError("Negative control did not reach the required assertion: "+name)
    scoped=[ROOT / "android/app/src/main/java/ls/augment/com/AtomicWorkbenchTextSegmenter.java",cpp / "atomic_workbench_text_core.hpp",
            cpp / "atomic_workbench_text_jni.cpp",cpp / "CMakeLists.txt",*sorted((cpp / "vendor/cppjieba").rglob("*")),
            *sorted((ROOT / "android/app/src/main/assets/workbench-text-dict").rglob("*")),Path(__file__).resolve(),
            ROOT / "tools/tests/AtomicWorkbenchTextSegmenterHostTest.java", ROOT / "tools/tests/atomic-workbench-text-native.cpp"]
    hashes=[{"path":str(path.relative_to(ROOT)).replace("\\","/"),"sha256":hashlib.sha256(path.read_bytes()).hexdigest()}
            for path in scoped if path.is_file()]
    summary={"success":True,"scope":"ACTUAL_HOST_CPPJIEBA_NATIVE_AND_JNI_PRODUCTION_JAVA_WITH_ANDROID_CONTEXT_DISPATCH_STUBS",
        "androidPhoneValidated":False,"nativeResult":next(line for line in native.splitlines() if line.startswith("PASS actual_cppjieba")),
        "javaJniResult":actual.strip(),"negativeControls":negative,"source":hashes}
    (output / "summary.json").write_text(json.dumps(summary,ensure_ascii=False,indent=2),encoding="utf-8")
    print(json.dumps({k:v for k,v in summary.items() if k!="source"},ensure_ascii=False))

if __name__=="__main__": main()
