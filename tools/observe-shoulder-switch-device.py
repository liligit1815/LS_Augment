"""Observe physical shoulder events and fixture touches without changing the phone.

Run while the independent fixture is foreground. The operator must press and
release the named shoulder. This observer never injects input, changes a scheme,
clears logs, installs apps, or writes phone files. A missing press stays unverified.
"""
import argparse
import json
from pathlib import Path
import re
import shlex
import subprocess
import time

ROOT = Path(__file__).resolve().parents[1]
FIXTURE = "ls.augment.regression.game"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--serial", required=True)
    parser.add_argument("--adb", type=Path, default=ROOT / "audit-output/android-sdk/platform-tools/adb.exe")
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--seconds", type=int, default=12, choices=range(4, 61))
    parser.add_argument("--source", default="/dev/input/event4")
    parser.add_argument("--targets", required=True, help="Expected target indices for one press, e.g. 0 or 0,1")
    parser.add_argument("--right-targets", help="Also observe event5; expected target indices for each right press")
    args = parser.parse_args()
    if not re.fullmatch(r"/dev/input/event\d{1,3}", args.source):
        raise ValueError("Invalid source")
    if not re.fullmatch(r"[01](,[01]){0,15}", args.targets):
        raise ValueError("Expected target pattern must be A/B indices")
    if args.right_targets and not re.fullmatch(r"[01](,[01]){0,15}", args.right_targets):
        raise ValueError("Invalid right target pattern")
    args.out.mkdir(parents=True, exist_ok=False)
    prefix = [str(args.adb), "-s", args.serial]

    def adb(*values):
        result = subprocess.run(prefix + list(values), capture_output=True, timeout=20)
        if result.returncode:
            raise RuntimeError((result.stderr + result.stdout).decode("utf-8", "replace"))
        return result.stdout

    def shell(command, root=False):
        return adb("shell", "su -c " + shlex.quote(command) if root else command).decode("utf-8", "replace").strip()

    name = shell("cat /sys/class/input/" + args.source.rsplit("/", 1)[1] + "/device/name", root=True)
    if not any(token in name.lower() for token in ["tgk", "shoulder", "airtrigger", "gametrigger"]):
        raise RuntimeError("Source is not a discovered shoulder device")
    foreground = shell("dumpsys activity activities")
    resumed = [line.strip() for line in foreground.splitlines() if "topResumedActivity" in line]
    if not any(FIXTURE in line for line in resumed):
        raise RuntimeError("The independent input fixture must be foreground")
    fixture_pid = shell("pidof " + FIXTURE)
    start_wall = float(shell("date +%s.%N"))
    sources = {"left": args.source}
    if args.right_targets:
        sources["right"] = "/dev/input/event5"
    paths = {"physical-" + side: args.out / ("physical-" + side + ".txt") for side in sources}
    paths["logcat"] = args.out / "runtime-logcat.txt"
    processes = []
    streams = []
    try:
        commands = {"physical-" + side: "timeout " + str(args.seconds) + " getevent -lt " + source
                    for side, source in sources.items()}
        commands["logcat"] = ("timeout " + str(args.seconds) + " logcat -v epoch -T 1 -s "
                             "LSA-GameValidation:I LS_Augment_TGK:I InputManagerProxy:E TgkHelper:E TgkService:W '*:S'")
        for label, command in commands.items():
            stream = paths[label].open("wb")
            streams.append(stream)
            processes.append(subprocess.Popen(prefix + ["exec-out", "su -c " + shlex.quote(command)],
                                               stdout=stream, stderr=stream))
        print(json.dumps({"status": "observing", "source": args.source, "name": name,
                          "seconds": args.seconds, "operatorAction": "Press and release the physical shoulder"}), flush=True)
        for process in processes:
            process.wait(timeout=args.seconds + 8)
    finally:
        for process in processes:
            if process.poll() is None:
                process.terminate()
                process.wait(timeout=5)
        for stream in streams:
            stream.close()
    end_foreground = [line.strip() for line in shell("dumpsys activity activities").splitlines()
                      if "topResumedActivity" in line]
    physical = []
    for side in sources:
        for line in paths["physical-" + side].read_text("utf-8", errors="replace").splitlines():
            match = re.search(r"\[\s*(\d+\.\d+)\]\s+EV_KEY\s+(KEY_F1|KEY_F7|KEY_F8)\s+(DOWN|UP)\b", line)
            if match:
                physical.append({"side": side, "seconds": float(match[1]), "code": match[2], "action": match[3]})
    physical.sort(key=lambda event: event["seconds"])
    touches = []
    delivered = shell("cat /data/user/0/" + FIXTURE + "/files/shoulder-validation-events.jsonl", root=True)
    (args.out / "fixture-delivered-input.jsonl").write_text(delivered, encoding="utf-8")
    for line in delivered.splitlines():
        event = json.loads(line)
        if event["wall"] >= start_wall * 1000 and str(event["pid"]) == fixture_pid:
            touches.append(event)
    pattern = [int(value) for value in args.targets.split(",")]
    patterns = {"left": pattern}
    if args.right_targets: patterns["right"] = [int(value) for value in args.right_targets.split(",")]
    down_count = sum(event["action"] == "DOWN" for event in physical)
    up_count = sum(event["action"] == "UP" for event in physical)
    actual_targets = [event["target"] for event in touches if event["action"] == 0]
    ordered_actions = [event["action"] for event in touches] == [0, 1] * len(actual_targets)
    # OEM macro replay preserves recorded eventTime (e.g. 1000 ms), so correlate
    # physical packets with delivery time, never with the source recording clock.
    presses = [event["seconds"] * 1000 for event in physical if event["action"] == "DOWN"]
    correlated = bool(touches) and bool(presses) and all(
        any(-100 <= event["now"] - press <= 8000 for press in presses) for event in touches)
    grouped = {side: [] for side in sources}
    for event in touches:
        preceding = [press for press in physical if press["action"] == "DOWN"
                     and -100 <= event["now"] - press["seconds"] * 1000 <= 8000]
        if preceding: grouped[preceding[-1]["side"]].append(event)
    per_side = {}
    for side in sources:
        downs = sum(event["action"] == "DOWN" and event["side"] == side for event in physical)
        ups = sum(event["action"] == "UP" and event["side"] == side for event in physical)
        actual = [event["target"] for event in grouped[side] if event["action"] == 0]
        per_side[side] = {"presses": downs, "releases": ups, "targets": actual,
                          "pass": downs > 0 and downs == ups and actual == patterns[side] * downs}
    checks = {"sameFixtureForeground": any(FIXTURE in line for line in end_foreground),
              "physicalPressReleasePresent": down_count > 0 and down_count == up_count,
              "actualTouchPairsOrdered": ordered_actions and bool(touches),
              "actualTargetsMatchEachPress": all(value["pass"] for value in per_side.values()),
              "physicalAndTouchTimesCorrelate": correlated}
    report = {"pass": all(checks.values()), "checks": checks, "expectedTargetsPerPress": pattern,
              "source": args.source, "sourceName": name, "fixturePid": fixture_pid, "startWall": start_wall,
              "perShoulder": per_side,
              "physicalEvents": physical, "actualTouches": touches, "mutations": [],
              "scope": "Observed physical source packets plus delivered fixture MotionEvents; no input injection by this observer"}
    (args.out / "results.json").write_text(json.dumps(report, indent=2), encoding="utf-8")
    print(json.dumps({"pass": report["pass"], "checks": checks, "presses": down_count,
                      "actualTargets": actual_targets, "out": str(args.out)}), flush=True)
    if not report["pass"]:
        raise SystemExit(2)


if __name__ == "__main__":
    main()
