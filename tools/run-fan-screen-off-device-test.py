"""Verify real screen-off fan behavior and restore the original settings.

Requires an installed matching test APK, loaded fan scope and an awake, unlocked
NX809J. Uses OEM UI for fan switches, the app's test-only configuration bridge,
and read-only sysfs observations. Never writes hardware nodes.
"""
import argparse
import json
import re
import time
import xml.etree.ElementTree as ET

import adb_regression as adb_tools

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--label", default="fan-screen-off-20443")
args = parser.parse_args()
if not re.fullmatch(r"[A-Za-z0-9_.-]+", args.label):
    raise SystemExit("Invalid evidence label")
adb_tools.OUTPUT = adb_tools.ROOT / "audit-output" / args.label
adb_tools.OUTPUT.mkdir(parents=True, exist_ok=True)
# Import after selecting output so every nested OEM UI snapshot is retained here.
from adb_regression import OUTPUT, instrument, shell
from fan_device_helpers import prefs

FEATURE = "ls_augment_fan_screen_off_enabled"
MASTER = "ls_augment_game_master"
FIXED = "ls_augment_fan_fixed_enabled"
events = []
checks = {}


def sample(stage):
    values = shell("cat /sys/kernel/fan/fan_enable /sys/kernel/fan/fan_speed_level "
                   "/sys/kernel/fan/fan_speed_count /sys/class/power_supply/battery/temp", root=True).splitlines()
    assert len(values) == 4, values
    value = dict(zip(["enable", "level", "rpm", "batteryTenthsC"], map(int, values)))
    value.update(stage=stage, elapsed=round(time.monotonic(), 3),
                 screenOff=any(state in shell("dumpsys power") for state in ["mWakefulness=Asleep", "mWakefulness=Dozing"]),
                 keyguard=shell("settings get system keyguard_is_showing"),
                 manual=shell("settings get system fan_state_of_manual"),
                 mode=shell("settings get system fan_state_of_mode"))
    value["diagnostics"] = {k: v for k, v in prefs("ls_augment_diagnostics_v2").items() if "fan_screen_off" in k}
    events.append(value)
    (OUTPUT / "observations.json").write_text(json.dumps(events, ensure_ascii=False, indent=2), encoding="utf-8")
    return value


def await_state(stage, expected, *, off=False, timeout=15):
    deadline = time.monotonic() + timeout
    while time.monotonic() < deadline:
        value = sample(stage)
        if value["enable"] == int(expected) and (value["rpm"] > 500 if expected else value["rpm"] == 0) \
                and (not off or value["screenOff"] and value["keyguard"] == "1"):
            return value
        time.sleep(.5)
    raise AssertionError(stage + ": requested hardware/screen state not reached")


def wake():
    shell("input keyevent 224")
    shell("input keyevent 82")
    shell("wm dismiss-keyguard")
    for _ in range(15):
        if shell("settings get system keyguard_is_showing") == "0" and "mWakefulness=Awake" in shell("dumpsys power"):
            return
        time.sleep(.3)
    raise AssertionError("Device could not return to its original unlocked state")


def sleep():
    shell("input keyevent 223")


def native_enabled(stage, desired):
    shell("am start -W -n cn.nubia.fan/.components.GameFanSettingsActivity", root=True)
    folder = adb_tools.snapshot(stage, verbose=False)
    root = ET.fromstring((folder / "window.xml").read_bytes())
    rows = [node for node in root.iter("node")
            if node.get("resource-id") == "cn.nubia.fan:id/common_preference_layout"
            and node.get("visible-to-user", "true") != "false"
            and any(child.get("text") == "散热风扇" for child in node.iter("node"))]
    assert len(rows) == 1, "Expected one observed OEM fan preference"
    switches = [node for node in rows[0].iter("node") if node.get("class") == "android.widget.Switch"]
    assert len(switches) == 1, "Expected the observed OEM fan switch"
    if (switches[0].get("checked") == "true") != desired:
        bounds = list(map(int, re.findall(r"-?\d+", switches[0].get("bounds", ""))))
        assert len(bounds) == 4 and bounds[2] > bounds[0] and bounds[3] > bounds[1]
        shell(f"input tap {(bounds[0] + bounds[2]) // 2} {(bounds[1] + bounds[3]) // 2}")
    return await_state(stage + "-hardware", desired)


before = sample("before")
config_before = prefs("ls_augment_config_v2")
restore = {key: config_before.get(key, "0") for key in [FEATURE, MASTER, FIXED]}
assert shell("getprop ro.product.device") == "NX809J"
assert "mWakefulness=Awake" in shell("dumpsys power") and before["keyguard"] == "0", "Start awake and unlocked"
assert shell("settings get system fan_state_of_charging") == "0", "OEM charging fan policy would mask the screen-off gate"
assert before["batteryTenthsC"] < 450, "Test requires normal device temperature"
assert not config_before.get("ls_augment_fan_calibration_request", ""), "Finish active calibration before test"
assert "hooks=2" in before["diagnostics"].get("ls_augment_fan_screen_off_installed", "") \
    or before["diagnostics"].get("ls_augment_fan_screen_off_active", ""), "Restart loaded OEM fan scope first"
(OUTPUT / "before.json").write_text(json.dumps({"hardware": before, "config": restore}, ensure_ascii=False, indent=2), encoding="utf-8")
failure = None
try:
    instrument("set", "baseline-feature-off", {FEATURE: "0", MASTER: "1", FIXED: "0"})
    time.sleep(2)
    native_enabled("baseline-oem-on", True)
    sleep()
    await_state("baseline-off-on-lock", False, off=True)
    checks["nativeScreenOffStopReproduced"] = True

    wake()
    instrument("set", "enable-feature", {FEATURE: "1", MASTER: "1"})
    time.sleep(2)
    native_enabled("feature-oem-on", True)
    sleep()
    await_state("enabled-lock", True, off=True)
    deadline = time.monotonic() + 20
    while time.monotonic() < deadline:
        value = sample("enabled-hold")
        assert value["screenOff"] and value["keyguard"] == "1" and value["enable"] == 1 and value["rpm"] > 500, value
        time.sleep(1)
    assert "kept_running" in value["diagnostics"].get("ls_augment_fan_screen_off_active", ""), value
    checks["continuesWithScreenOffFor20Seconds"] = True

    instrument("set", "disable-while-locked", {FEATURE: "0"})
    await_state("disabled-lock-stops", False, off=True)
    checks["disableRestoresNativeStopWhileLocked"] = True
    instrument("set", "enable-while-stopped", {FEATURE: "1"})
    time.sleep(3)
    await_state("no-background-restart", False, off=True)
    checks["enablingDoesNotStartStoppedFan"] = True

    wake()
    native_enabled("manual-stop", False)
    sleep()
    await_state("manual-stop-remains-off", False, off=True)
    checks["manualStopRemainsEffective"] = True
except BaseException as problem:
    failure = problem
finally:
    try:
        wake()
        instrument("set", "restore-feature-settings", restore)
        time.sleep(2)
        native_enabled("restore-oem-switch", before["enable"] == 1)
        for name in ["mode", "manual"]:
            prior = before[name]
            assert prior == "null" or prior.lstrip("-").isdigit(), prior
            command = "settings delete system fan_state_of_" + name if prior == "null" \
                else "settings put system fan_state_of_" + name + " " + prior
            shell(command, root=True)
        after = await_state("restored", before["enable"] == 1)
        assert after["manual"] == before["manual"] and after["mode"] == before["mode"], after
        actual = prefs("ls_augment_config_v2")
        assert all(actual.get(key, "0") == value for key, value in restore.items())
        checks["originalSettingsAndFanStateRestored"] = True
    except BaseException as cleanup:
        checks["originalSettingsAndFanStateRestored"] = False
        if failure is None:
            failure = cleanup
        else:
            print("RESTORE FAILED:", repr(cleanup), flush=True)
    result = {"pass": failure is None, "checks": checks,
              "error": "" if failure is None else repr(failure), "evidence": str(OUTPUT)}
    (OUTPUT / "result.json").write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False), flush=True)
if failure is not None:
    raise failure
