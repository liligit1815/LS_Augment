"""SDK36 compile of the complete changed pending/preview/transfer/UiKit production surface.

Uses existing developer build class/resource outputs only as unchanged dependencies; does
not launch Gradle, install an APK, contact a device, or become a runtime prerequisite.
"""
from pathlib import Path
import importlib.util
import subprocess
import tempfile
SPEC = importlib.util.spec_from_file_location("pending", Path(__file__).with_name("test-atomic-workbench-pending.py"))
P = importlib.util.module_from_spec(SPEC); SPEC.loader.exec_module(P)

def main():
    classpath = [P.ROOT / relative for relative in (
        "audit-output/android-sdk/platforms/android-36/android.jar",
        "android/app/build/intermediates/javac/debug/compileDebugJavaWithJavac/classes",
        "android/app/build/intermediates/compile_and_runtime_not_namespaced_r_class_jar/debug/processDebugResources/R.jar",
    )]
    for path in classpath:
        if not path.exists(): raise FileNotFoundError("SDK36 and existing developer class/resource output required: " + str(path))
    files = sorted(P.SRC.glob("AtomicWorkbenchPending*.java"))
    files += [P.SRC / name for name in (
        "AtomicWorkbenchTransfer.java", "AtomicWorkbenchTransferStore.java", "AtomicWorkbenchTransferStage.java", "AtomicWorkbenchTransferPolicy.java",
        "AtomicWorkbenchShareActivity.java", "AtomicWorkbenchContentPreview.java", "AtomicWorkbenchContentPanel.java", "AtomicWorkbenchHostDialogs.java", "UiKit.java",
        "ModuleResetStorage.java", "ResetWriteFence.java",
        "AtomicWorkbenchExtractionPresentation.java", "AtomicWorkbenchExtractionHandoff.java", "AtomicWorkbenchExtractionActivity.java",
        "AtomicWorkbenchExtractionRequest.java", "AtomicWorkbenchExtractionResult.java", "AtomicWorkbenchExtractionAuthority.java", "AtomicWorkbenchExtractionPolicy.java",
        "AtomicWorkbenchTextTool.java",
    )]
    with tempfile.TemporaryDirectory(prefix="duo-pending-sdk-") as output:
        result = subprocess.run([P.JAVAC, "-encoding", "UTF-8", "-source", "17", "-target", "17", "-Xlint:-options", "-classpath",
                                 P.os.pathsep.join(map(str, classpath)), "-d", output, *map(str, files)], capture_output=True, encoding="utf-8", errors="replace", env=P.ENV, timeout=60)
        if result.returncode: raise AssertionError(result.stderr)
        print("PENDING UI/STORE/STAGE/HOST DIALOGS SDK36 PASS " + str(len(files)) + " complete production files")
        result = subprocess.run([P.JAVAC, "--release", "17", "-encoding", "UTF-8", "-d", output,
                                 str(P.SRC / "AtomicWorkbenchTransferPolicy.java"), str(P.ROOT / "tools/TestAtomicWorkbenchTransferPolicy.java")], capture_output=True, encoding="utf-8", errors="replace", env=P.ENV)
        if result.returncode: raise AssertionError(result.stderr)
        result = subprocess.run([P.JAVA, "-Dfile.encoding=UTF-8", "-cp", output, "ls.augment.com.TestAtomicWorkbenchTransferPolicy"], capture_output=True, encoding="utf-8", errors="replace", env=P.ENV)
        if result.returncode: raise AssertionError(result.stderr)
        print(result.stdout, end="")
    print("NO GRADLE/DEVICE/UI ACCEPTANCE PERFORMED")
if __name__ == "__main__": main()
