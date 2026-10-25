"""Exercise production private history/repository and compile its Android phone adapters; no device I/O."""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
JAVAC = str(JDK / "javac.exe") if (JDK / "javac.exe").exists() else "javac"
JAVA = str(JDK / "java.exe") if (JDK / "java.exe").exists() else "java"
ENV = dict(os.environ)
if JDK.exists():
    ENV["PATH"] = str(JDK) + os.pathsep + ENV.get("PATH", "")
CORE = ["AtomicWorkbenchContent" + suffix + ".java" for suffix in (
    "Item", "Policy", "PermissionState", "Source", "Snapshot", "Access", "Store", "Repository")]


def execute(folder, mutation=None):
    sources = []
    for name in CORE:
        text = (SRC / name).read_text(encoding="utf-8")
        if mutation and name == "AtomicWorkbenchContentRepository.java":
            old, new = mutation
            assert text.count(old) == 1, "negative-control target changed"
            text = text.replace(old, new)
        path = folder / name
        path.write_text(text, encoding="utf-8")
        sources.append(str(path))
    sources.append(str(ROOT / "tools/TestAtomicWorkbenchContentRepository.java"))
    subprocess.run([JAVAC, "--release", "17", "-encoding", "UTF-8", "-d", str(folder / "classes"), *sources], check=True, env=ENV)
    return subprocess.run([JAVA, "-Dfile.encoding=UTF-8", "-cp", str(folder / "classes"), "ls.augment.com.TestAtomicWorkbenchContentRepository"],
                          text=True, encoding="utf-8", errors="replace", capture_output=True, env=ENV)


def main():
    with tempfile.TemporaryDirectory(prefix="duo-content-tests-") as temp:
        folder = Path(temp)
        production = execute(folder)
        print(production.stdout, end="")
        if production.returncode:
            raise SystemExit(production.stderr)
    controls = {
        "clear-generation-disabled": ("if (generations.get(kind) != requested)", "if (false)"),
        "system-clipboard-denial-blocks-private-history": (
            "snapshot.permission.scope == AtomicWorkbenchContentPermissionState.Scope.LOCKED",
            "!snapshot.permission.accessible()"),
    }
    for name, mutation in controls.items():
        with tempfile.TemporaryDirectory(prefix="duo-content-negative-") as temp:
            negative = execute(Path(temp), mutation)
            if negative.returncode == 0:
                raise AssertionError("negative control did not fail: " + name)
            print("EXPECTED FAILURE " + name)
            print(negative.stderr.splitlines()[0].split(":", 1)[0])
    sdk = ROOT / "audit-output/android-sdk/platforms/android-36/android.jar"
    if not sdk.exists():
        raise FileNotFoundError("Android SDK36 required for phone adapter compile")
    android_sources = [str(SRC / name) for name in CORE]
    android_sources.extend(str(SRC / name) for name in (
        "AtomicWorkbenchPhoneContentSource.java", "AtomicWorkbenchContentCollector.java", "AtomicWorkbenchContentSelection.java"))
    with tempfile.TemporaryDirectory(prefix="duo-content-sdk-") as temp:
        subprocess.run([JAVAC, "-encoding", "UTF-8", "-source", "17", "-target", "17", "-Xlint:-options", "-classpath", str(sdk),
                        "-d", temp, *android_sources], check=True, env=ENV)
    print("CONTENT ANDROID SDK36 COMPILE PASS")


if __name__ == "__main__":
    main()
