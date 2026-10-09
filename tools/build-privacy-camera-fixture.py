"""Build/inspect an independent visible-preview fixture locally. Never contacts a device."""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parent.parent
SOURCE = ROOT / "tools/fixtures/privacy-camera"
OUT = ROOT / "out/full-function-audit-20261004/privacy-camera-fixture"
SDK = ROOT / "audit-output/android-sdk"
BUILD = SDK / "build-tools/35.0.0"
ANDROID = SDK / "platforms/android-36/android.jar"
JAVA = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
ENV = dict(os.environ, JAVA_HOME=str(JAVA.parent), PATH=str(JAVA) + os.pathsep + os.environ.get("PATH", ""))


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    work = Path(tempfile.mkdtemp(prefix="build-", dir=OUT))
    classes = work / "classes"; classes.mkdir()
    logs = []
    def run(label, *args):
        result = subprocess.run([str(x) for x in args], capture_output=True, env=ENV)
        log = result.stdout + result.stderr
        (work / (label + ".log")).write_bytes(log)
        logs.append({"step":label,"exitCode":result.returncode,"log":str((work/(label+".log")).relative_to(OUT))})
        if result.returncode: raise RuntimeError(label + " failed; see " + str(work))
        return log.decode("utf-8", errors="replace")
    source = SOURCE / "src/ls/augment/privacycamerafixture/PrivacyCameraActivity.java"
    run("javac",JAVA/"javac.exe","-encoding","UTF-8","-source","8","-target","8","-cp",ANDROID,"-d",classes,source)
    run("d8",BUILD/"d8.bat","--lib",ANDROID,"--min-api","29","--output",work,*sorted(classes.rglob("*.class")))
    unsigned, aligned = work/"unsigned.apk", work/"aligned.apk"
    apk = OUT / "privacy-camera-fixture.apk"
    run("aapt2-link",BUILD/"aapt2.exe","link","-o",unsigned,"-I",ANDROID,"--manifest",SOURCE/"AndroidManifest.xml")
    with zipfile.ZipFile(unsigned,"a",zipfile.ZIP_DEFLATED) as z: z.write(work/"classes.dex","classes.dex")
    run("zipalign",BUILD/"zipalign.exe","-f","4",unsigned,aligned)
    run("sign",BUILD/"apksigner.bat","sign","--ks",Path.home()/".android/debug.keystore","--ks-pass","pass:android","--out",apk,aligned)
    run("verify-signature",BUILD/"apksigner.bat","verify","--verbose",apk)
    run("verify-alignment",BUILD/"zipalign.exe","-c","4",apk)
    badging = run("badging",BUILD/"aapt2.exe","dump","badging",apk)
    manifest = run("manifest",BUILD/"aapt2.exe","dump","xmltree",apk,"--file","AndroidManifest.xml")
    permissions = re.findall(r"uses-permission: name='([^']+)'",badging)
    assert permissions == ["android.permission.CAMERA"], permissions
    assert "targetSdkVersion:'34'" in badging
    assert "ls.augment.privacycamerafixture.PrivacyCameraActivity" in badging
    for forbidden in ["E: service", "E: receiver", "E: provider", "E: instrumentation"]:
        assert forbidden not in manifest, forbidden
    java = source.read_text("utf-8")
    for forbidden in [".capture(",".captureBurst(","ImageReader.newInstance(","new MediaRecorder(","requestPermissions(","new FileOutputStream(","TEMPLATE_STILL_CAPTURE","TEMPLATE_RECORD","PixelCopy.","getBitmap("]:
        assert forbidden not in java, forbidden
    assert java.count(".createCaptureSession(") == 1 and "Collections.singletonList(surface)" in java
    assert java.count(".setRepeatingRequest(") == 1 and "CameraDevice.TEMPLATE_PREVIEW" in java
    assert java.count(".addTarget(") == 1
    assert "versionCode='2'" in badging
    report = {"scope":"Local build and static APK inspection only; updated preview APK not installed or run by this builder", "package":"ls.augment.privacycamerafixture", "activity":"ls.augment.privacycamerafixture.PrivacyCameraActivity", "versionCode":2, "apk":str(apk), "sha256":hashlib.sha256(apk.read_bytes()).hexdigest(), "bytes":apk.stat().st_size, "permissions":permissions, "maximumForegroundMs":120000, "visiblePreviewSession":True,"singleSurfaceViewOutput":True,"previewRepeatingRequest":True,"stillPhotoCapture":False,"frameReadbackOrSaving":False,"recording":False,"deviceCommandsExecuted":False,"checks":logs, "sources":{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [source,SOURCE/"AndroidManifest.xml",Path(__file__)]}}
    (OUT/"build-report.json").write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding="utf-8")
    print(json.dumps(report,ensure_ascii=True))


if __name__ == "__main__":
    main()
