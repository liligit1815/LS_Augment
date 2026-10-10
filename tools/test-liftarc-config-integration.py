"""Run real LiftArc backup export/prepareImport and reset registries without ADB.

Reuses the existing transfer-host Android/JSON/media/Root doubles, but compiles
the unchanged production Activity, catalog, schema and snapshot. Save and reset
boundaries deliberately throw; this does not execute a phone import or reset.
"""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"


def without_class(text, name):
    start = text.index("final class " + name + " ")
    end = text.index("{", start) + 1
    depth = 1
    while depth:
        depth += (text[end] == "{") - (text[end] == "}")
        end += 1
    return text[:start] + text[end:]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", type=Path, help="JDK bin directory")
    parser.add_argument("--report", type=Path, default=ROOT / "audit-output/liftarc-integration-20261010/config-management-report.json")
    args = parser.parse_args()
    if args.jdk:
        jdk = args.jdk
    elif os.environ.get("JAVA_HOME"):
        jdk = Path(os.environ["JAVA_HOME"]) / "bin"
    elif shutil.which("javac"):
        jdk = Path(shutil.which("javac")).resolve().parent
    else:
        parser.error("Pass --jdk or set JAVA_HOME")
    suffix = ".exe" if (jdk / "javac.exe").is_file() else ""
    spec = importlib.util.spec_from_file_location("transfer_host", ROOT / "tools/test-config-transfer-action-host.py")
    host = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(host)
    boundaries = host.BOUNDARIES.replace(" TARGET_MODEL", host.target_model())
    # These production types participate in the true schema. Keep media I/O
    # doubles, but do not shadow their real validation/normalization classes.
    for name in ("BackGestureIconPolicy", "LauncherOverrides", "StatusBarSheetSpec"):
        boundaries = without_class(boundaries, name)
    sources = dict(host.STUBS)
    sources.update({"ls/augment/com/Boundaries.java": boundaries,
                    "ls/augment/com/TestTransferActionHost.java": host.TEST})
    production = ["ConfigTransferActivity.java", "HideTargetCodec.java", "ConfigSchema.java", "ConfigSnapshot.java"]
    with tempfile.TemporaryDirectory(prefix="liftarc-config-") as folder:
        work = Path(folder)
        (work / "cache").mkdir()
        paths = []
        for name, code in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(code, encoding="utf-8")
            paths.append(str(path))
        paths.extend(str(SRC / name) for name in production)
        paths.append(str(ROOT / "tools/TestLiftArcConfigIntegration.java"))
        commands = [[str(jdk / ("javac" + suffix)), "-J-Dfile.encoding=UTF-8", "-J-Duser.language=en", "-J-Duser.country=US",
                     "--release", "17", "-encoding", "UTF-8", "-sourcepath", str(SRC.parents[2]), "-d", str(work / "classes"), *paths],
                    [str(jdk / ("java" + suffix)), "-Dfile.encoding=UTF-8", f"-Dfixture.cache={work / 'cache'}",
                     "-cp", str(work / "classes"), "ls.augment.com.TestLiftArcConfigIntegration"]]
        transcript = ""
        result = None
        for command in commands:
            result = subprocess.run(command, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=90)
            transcript += result.stdout + result.stderr
            print(result.stdout + result.stderr, end="")
            if result.returncode:
                break
        passed = result.returncode == 0 and "PASS TestLiftArcConfigIntegration:" in transcript
        report = {"status": "passed" if passed else "failed", "transcript": transcript,
                  "configurationUnchanged": passed, "adbUsed": False, "featureEfficacyChecked": False,
                  "productionClasses": ["ConfigTransferActivity", "LiftArcOptions", "EnhancementCatalog", "ConfigSchema", "ConfigSnapshot"],
                  "boundaries": ["Android/JSON/SAF/media/Root doubles", "AppConfig in-memory persistence fixture; save/reset forbidden"],
                  "resetScope": "actual ConfigSchema defaults and ConfigSnapshot safe defaults; no phone reset executed",
                  "sourceSha256": {name: hashlib.sha256((SRC / name).read_bytes()).hexdigest()
                                   for name in production + ["LiftArcOptions.java", "EnhancementCatalog.java"]}}
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print("REPORT " + str(args.report.resolve()))
        return 0 if passed else 1


if __name__ == "__main__":
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    raise SystemExit(main())
