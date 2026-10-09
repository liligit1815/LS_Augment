"""ADB comparison probe: identical idle or alternating panel workload, no setting changes."""
from pathlib import Path
import argparse
import json
import re
import subprocess
import time

ROOT = Path(__file__).resolve().parents[1]


def adb(*args):
    return subprocess.run(["adb", *args], check=True, capture_output=True, encoding="utf-8", errors="replace").stdout


def ticks(pid, main=False):
    path = f"/proc/{pid}/task/{pid}/stat" if main else f"/proc/{pid}/stat"
    raw = adb("shell", "su", "-c", f"cat {path}")
    fields = raw[raw.rindex(")") + 2:].split()
    return int(fields[11]) + int(fields[12])


def battery_temperature():
    match = re.search(r"temperature:\s*(\d+)", adb("shell", "dumpsys", "battery"))
    return int(match.group(1)) / 10 if match else None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--label", required=True)
    parser.add_argument("--scene", choices=["idle", "panels"], default="panels")
    parser.add_argument("--rounds", type=int, default=8)
    args = parser.parse_args()
    if not re.fullmatch(r"[A-Za-z0-9_.-]{1,70}", args.label) or not 1 <= args.rounds <= 20:
        parser.error("invalid label or rounds")
    folder = ROOT / "audit-output/statusbar-assets-performance" / args.label
    folder.mkdir(parents=True, exist_ok=True)
    pid = adb("shell", "pidof", "com.android.systemui").strip()
    if not pid.isdigit():
        raise RuntimeError("A single running SystemUI process is required")
    hz = int(adb("shell", "getconf", "CLK_TCK"))
    adb("shell", "input", "keyevent", "224")
    adb("shell", "wm", "dismiss-keyguard")
    adb("shell", "cmd", "statusbar", "collapse")
    time.sleep(1)
    adb("shell", "dumpsys", "gfxinfo", "com.android.systemui", "reset")
    temperature_start = battery_temperature()
    process_start, main_start = ticks(pid), ticks(pid, True)
    start = time.monotonic()
    try:
        if args.scene == "idle":
            time.sleep(8)
        else:
            for index in range(args.rounds):
                adb("shell", "input", "keyevent", "224")
                adb("shell", "cmd", "statusbar", "expand-settings" if index % 2 == 0 else "expand-notifications")
                time.sleep(.65)
                adb("shell", "cmd", "statusbar", "collapse")
                time.sleep(.65)
    finally:
        adb("shell", "cmd", "statusbar", "collapse")
    elapsed = time.monotonic() - start
    process_end, main_end = ticks(pid), ticks(pid, True)
    gfx = adb("shell", "dumpsys", "gfxinfo", "com.android.systemui", "framestats")
    (folder / "gfx.txt").write_text(gfx, encoding="utf-8")
    (folder / "meminfo.txt").write_text(adb("shell", "dumpsys", "meminfo", "com.android.systemui"), encoding="utf-8")
    fields = {}
    for key in ("Total frames rendered", "Janky frames", "50th percentile", "90th percentile", "95th percentile", "99th percentile"):
        found = re.search(r"^" + re.escape(key) + r":\s*(.+)$", gfx, re.MULTILINE)
        fields[key] = found.group(1).strip() if found else None
    report = {"label": args.label, "scene": args.scene, "rounds": args.rounds, "elapsedSeconds": round(elapsed, 3),
              "processCpuPercent": round((process_end-process_start)/hz/elapsed*100, 2),
              "mainThreadCpuPercent": round((main_end-main_start)/hz/elapsed*100, 2),
              "batteryStartCelsius": temperature_start, "batteryEndCelsius": battery_temperature(), "gfx": fields}
    (folder / "summary.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False))


if __name__ == "__main__":
    main()
