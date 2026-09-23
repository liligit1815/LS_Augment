"""Offline SystemUI adapter checks: compile the production resolver and inspect real APK DEX definitions.

Example: python tools/test-systemui-version-compat.py --apk nx769j /path/SystemUI.apk
No application code is executed and no device is accessed.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import struct
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
WINDOW = "com.android.systemui.statusbar.window.StatusBarWindowController"
PRIVACY = "com.android.systemui.statusbar.events.PrivacyDotViewController"
VIEW = "Landroid/view/View;"
LP = "Landroid/view/WindowManager$LayoutParams;"


def dex_definitions(data):
    """Read only definitions, including access flags and complete descriptors (not method references)."""
    if not data.startswith(b"dex\n") or len(data) < 112:
        raise ValueError("Invalid DEX header")

    def uleb(offset):
        value = 0
        for shift in range(0, 35, 7):
            byte = data[offset]
            offset += 1
            value |= (byte & 127) << shift
            if byte < 128:
                return value, offset
        raise ValueError("Invalid ULEB128")

    count, offset = struct.unpack_from("<II", data, 56)
    strings = []
    for i in range(count):
        start = struct.unpack_from("<I", data, offset + 4 * i)[0]
        _, start = uleb(start)
        strings.append(data[start:data.index(b"\0", start)].decode("utf-8", "replace"))
    count, offset = struct.unpack_from("<II", data, 64)
    types = [strings[struct.unpack_from("<I", data, offset + i * 4)[0]] for i in range(count)]
    count, offset = struct.unpack_from("<II", data, 72)
    prototypes = []
    for i in range(count):
        _, result, arguments = struct.unpack_from("<III", data, offset + i * 12)
        argc = struct.unpack_from("<I", data, arguments)[0] if arguments else 0
        args = [types[struct.unpack_from("<H", data, arguments + 4 + p * 2)[0]] for p in range(argc)]
        prototypes.append("(" + "".join(args) + ")" + types[result])
    count, offset = struct.unpack_from("<II", data, 80)
    fields = [struct.unpack_from("<HHI", data, offset + i * 8) for i in range(count)]
    count, offset = struct.unpack_from("<II", data, 88)
    methods = [struct.unpack_from("<HHI", data, offset + i * 8) for i in range(count)]
    count, offset = struct.unpack_from("<II", data, 96)
    wanted = {"L" + n.replace(".", "/") + ";" for n in (
        WINDOW, WINDOW + "Impl", PRIVACY, PRIVACY + "Impl",
        "com.zte.mifavor.views.MFVBatteryViewLayout",
        "com.zte.mifavor.views.MFVBatteryLevelView",
        "com.zte.mifavor.keyguard.settings.LockScreenClockClip",
        "com.zte.mifavor.keyguard.settings.BaseLockScreenClock",
        "com.android.systemui.statusbar.events.SystemStatusAnimationSchedulerImpl",
        "com.android.systemui.statusbar.events.SystemEventChipAnimationControllerImpl",
    )}
    for i in range(count):
        owner, access, parent, _, _, _, encoded, _ = struct.unpack_from("<8I", data, offset + i * 32)
        if types[owner] not in wanted:
            continue
        item = {"access": access, "parent": types[parent] if parent != 0xffffffff else "", "fields": {}, "methods": {}}
        if encoded:
            sizes = []
            for _ in range(4):
                size, encoded = uleb(encoded)
                sizes.append(size)
            for size in sizes[:2]:
                index = 0
                for _ in range(size):
                    diff, encoded = uleb(encoded)
                    index += diff
                    flags, encoded = uleb(encoded)
                    _, field_type, name = fields[index]
                    item["fields"][strings[name] + ":" + types[field_type]] = flags
            for size in sizes[2:]:
                index = 0
                for _ in range(size):
                    diff, encoded = uleb(encoded)
                    index += diff
                    flags, encoded = uleb(encoded)
                    _, encoded = uleb(encoded)
                    _, prototype, name = methods[index]
                    item["methods"][strings[name] + prototypes[prototype]] = flags
        yield types[owner][1:-1].replace("/", "."), item


def instance_method(item, signature):
    flags = item["methods"].get(signature)
    return flags is not None and not flags & (0x8 | 0x400 | 0x1000)


def inspect_apk(label, path):
    members = {}
    with zipfile.ZipFile(path) as apk:
        for name in apk.namelist():
            if name.startswith("classes") and name.endswith(".dex"):
                for owner, item in dex_definitions(apk.read(name)):
                    if owner in members:
                        raise AssertionError("Duplicate definition: " + owner)
                    members[owner] = item
    selected = {}
    signatures = {}
    for name in (WINDOW + "Impl", WINDOW):
        if name not in members:
            continue
        item = members[name]
        state = "L" + name.replace(".", "/") + "$State;"
        required = ["attach()V", "refreshStatusBarHeight()V", "getStatusBarHeight()I",
                    "getBarLayoutParamsForRotation(I)" + LP, "applyHeight(" + state + ")V"]
        fields = ["mContext:Landroid/content/Context;", "mBarHeight:I", "mLpChanged:" + LP]
        if not item["access"] & 0x400 and all(instance_method(item, m) for m in required) and all(f in item["fields"] for f in fields):
            selected["window"] = name
            signatures["window"] = required
            signatures["window_fields"] = fields
            break
    for name in (PRIVACY + "Impl", PRIVACY):
        if name not in members:
            continue
        item = members[name]
        required = ["initialize(" + VIEW * 4 + ")V", "showDotView(" + VIEW + "Z)V", "hideDotView(" + VIEW + "Z)V",
                    "updateDesignatedCorner(" + VIEW + "Z)V", "updateDotView(Lcom/android/systemui/statusbar/events/ViewState;)V"]
        if all(instance_method(item, m) for m in required):
            selected["privacy"] = name
            signatures["privacy"] = required
            aliases = [("topLeft", "tl"), ("topRight", "tr"), ("bottomLeft", "bl"), ("bottomRight", "br")]
            signatures["privacy_fields"] = []
            for pair in aliases:
                found = next((n + ":" + VIEW for n in pair if n + ":" + VIEW in item["fields"]), None)
                assert found, f"{label}: missing privacy corner {pair}"
                signatures["privacy_fields"].append(found)
            break
    assert len(selected) == 2, f"{label}: no complete supported contracts: {selected}"
    battery = members["com.zte.mifavor.views.MFVBatteryViewLayout"]
    assert instance_method(battery, "updateColor()V"), label + ": battery refresh missing"
    selected["battery_refresh"] = next((m for m in ("updateBatteryLevelColor(Z)V", "updateBatteryLevelColor()V") if instance_method(battery, m)), None)
    assert selected["battery_refresh"], label + ": no battery color refresh contract"
    assert "mCurrentUsedBatteryLevelView:Lcom/zte/mifavor/views/MFVBatteryLevelView;" in battery["fields"], label + ": battery label type differs"
    assert members["com.zte.mifavor.views.MFVBatteryLevelView"]["parent"] == "Landroid/widget/TextView;", label + ": label is not the inspected TextView subclass"
    clock = members["com.zte.mifavor.keyguard.settings.LockScreenClockClip"]
    for method in ("refreshTime()V", "refreshAmPm()V"):
        assert instance_method(clock, method), label + ": clock method missing " + method
    font = "updateClockFont(Lcom/zte/mifavor/keyguard/personalclock/MyClockStyleModel$StyleData;)V"
    selected["clock_font_refresh"] = font if instance_method(clock, font) else "refreshClockViewLayout()V"
    assert instance_method(clock, selected["clock_font_refresh"]), label + ": clock font/fallback signature missing"
    print("PASS real APK", label, selected)
    with open(path, "rb") as binary:
        digest = hashlib.file_digest(binary, "sha256").hexdigest()
    return {"label": label, "path": str(path), "sha256": digest,
            "selected": selected, "signatures": signatures, "definitions": members}


def compile_resolver_tests(folder):
    java_home = os.environ.get("JAVA_HOME")
    java = Path(java_home) / "bin/java.exe" if os.name == "nt" and java_home else "java"
    javac = Path(java_home) / "bin/javac.exe" if os.name == "nt" and java_home else "javac"
    host = folder / "host"
    host.mkdir()
    runner = folder / "ResolverTest.java"
    runner.write_text('''package ls.augment.com.hook;
import java.net.*; import java.nio.file.*; import java.lang.reflect.*;
public class ResolverTest {
 public static void main(String[] args) throws Exception {
  try(URLClassLoader loader=new URLClassLoader(new URL[]{Path.of(args[0]).toUri().toURL()},null)) {
   for(int n=0;n<2;n++) {
    String expected=args[n+1]; Class<?> found=null;
    try { found=n==0?SystemUiCompatibility.windowController(loader):SystemUiCompatibility.privacyController(loader); }
    catch(ClassNotFoundException unavailable) { if(!expected.equals("REJECT"))throw unavailable; }
    if(expected.equals("REJECT")){if(found!=null)throw new AssertionError("accepted unsupported "+found);continue;}
    if(found==null||!found.getName().equals(expected))throw new AssertionError("selected "+found+" expected "+expected);
    int selected=0, rejected=0;
    for(Method method:found.getDeclaredMethods()) {
     boolean match=n==0?SystemUiCompatibility.windowSizing(method):SystemUiCompatibility.privacyMethod(method);
     if(match)selected++;
     if(method.getName().equals("wrongSignature")&&match)throw new AssertionError("accepted unrelated method");
     if(method.getName().equals("refreshStatusBarHeight")&&method.getParameterCount()>0){if(match)throw new AssertionError("accepted overload");rejected++;}
    }
    if(selected!=(n==0?3:5))throw new AssertionError("incorrect selected method count "+selected);
   }
  }
 }
}''', encoding="utf-8")
    source = ROOT / "android/app/src/main/java/ls/augment/com/hook/SystemUiCompatibility.java"
    subprocess.run([str(javac), "-encoding", "UTF-8", "-d", str(host), str(source), str(runner)], check=True)

    def fixture(label, window="Impl", privacy="Impl", bad_window=None, bad_privacy=None, fallback=False):
        src = folder / label / "src"
        classes = folder / label / "classes"
        def write(name, value):
            path = src / (name.replace(".", "/") + ".java")
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, encoding="utf-8")
        for name in ("android.content.Context", "android.view.View", "com.android.systemui.statusbar.events.ViewState"):
            package, simple = name.rsplit(".", 1)
            write(name, f"package {package}; public class {simple} {{}}")
        write("android.view.WindowManager", "package android.view; public interface WindowManager { public static class LayoutParams {} }")
        def window_type(suffix, bad=None):
            name = WINDOW + suffix
            package, simple = name.rsplit(".", 1)
            height_type = "long" if bad == "field" else "int"
            lp_result = "Object" if bad == "return" else "android.view.WindowManager.LayoutParams"
            state_arg = "Object" if bad == "state" else "State"
            refresh = "public static void" if bad == "static" else "public void"
            write(name, f"""package {package}; public {'abstract ' if bad == 'abstract' else ''}class {simple} {{
 public android.content.Context mContext; public {height_type} mBarHeight; public android.view.WindowManager.LayoutParams mLpChanged;
 public static class State {{}} public void attach(){{}} {refresh} refreshStatusBarHeight(){{}}
 public int getStatusBarHeight(){{return 0;}} public {lp_result} getBarLayoutParamsForRotation(int r){{return null;}}
 public void applyHeight({state_arg} state){{}} public void refreshStatusBarHeight(int wrong){{}} public void wrongSignature(){{}}
}}""")
        def privacy_type(suffix, bad=None):
            name = PRIVACY + suffix
            package, simple = name.rsplit(".", 1)
            last = "int" if bad == "param" else "boolean"
            result = "boolean" if bad == "return" else "void"
            body = "return true;" if bad == "return" else ""
            modifier = "static " if bad == "static" else ""
            write(name, f"""package {package}; public class {simple} {{
 public void initialize(android.view.View a,android.view.View b,android.view.View c,android.view.View d){{}}
 public {modifier}{result} showDotView(android.view.View v,{last} animate){{{body}}}
 public void hideDotView(android.view.View v,boolean animate){{}}
 public void updateDesignatedCorner(android.view.View v,boolean animate){{}}
 public void updateDotView(ViewState state){{}} public void updateDotView(Object decoy){{}} public void wrongSignature(){{}}
}}""")
        window_type(window, bad_window)
        privacy_type(privacy, bad_privacy)
        if fallback:
            window_type("")
            privacy_type("")
        subprocess.run([str(javac), "-encoding", "UTF-8", "-d", str(classes), *map(str, src.rglob("*.java"))], check=True)
        expected_window = WINDOW + ("" if fallback and bad_window else window) if not bad_window or fallback else "REJECT"
        expected_privacy = PRIVACY + ("" if fallback and bad_privacy else privacy) if not bad_privacy or fallback else "REJECT"
        subprocess.run([str(java), "-cp", str(host), "ls.augment.com.hook.ResolverTest", str(classes), expected_window, expected_privacy], check=True)
        print("PASS production resolver", label)

    fixture("new-impl")
    fixture("old-concrete", window="", privacy="")
    fixture("both-valid-prefer-impl", fallback=True)
    fixture("invalid-impl-falls-back", bad_window="field", bad_privacy="param", fallback=True)
    for case in ("field", "return", "state", "static", "abstract"):
        fixture("reject-window-" + case, bad_window=case)
    for case in ("return", "param", "static"):
        fixture("reject-privacy-" + case, bad_privacy=case)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apk", nargs=2, action="append", default=[], metavar=("LABEL", "APK"))
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix="lsa-systemui-compat-") as temp:
        compile_resolver_tests(Path(temp))
    results = [inspect_apk(label, Path(path)) for label, path in args.apk]
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps({"production_resolver_tests": "PASS", "apks": results}, indent=2), encoding="utf-8")
    print("PASS SystemUI version compatibility checks (offline; no visual/runtime claim)")


if __name__ == "__main__":
    main()
