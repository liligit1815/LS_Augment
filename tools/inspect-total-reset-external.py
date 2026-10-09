#!/usr/bin/env python3
"""Read-only ADB total-reset evidence. No reset, force-stop, writes, or UI taps.

Use --baseline <previous .private.json> after resetting so deleted target lists do
not hide failed restorations. Public JSON/stdout omit package names and secrets;
the adjacent .private.json contains only target coordinates and scoped evidence.
Never reads native health databases or health login data.
"""
import argparse
import base64
import datetime
import hashlib
import json
import os
import re
import shlex
import shutil
import subprocess
import xml.etree.ElementTree as ET
from pathlib import Path

PACKAGE = "ls.augment.com"
ROOT = "/data/adb/ls_augment/v2"
PKG_RE = re.compile(r"[A-Za-z][A-Za-z0-9_]*(?:\.[A-Za-z0-9_]+)+\Z")
HIDE_NAMES = ("manual-targets-v1", "recovery-journal-v1", "recovery-history-v1",
              "root-transactions-v1", "restore-grants-v1", "targets.conf",
              "targets.backup.conf", "emergency_restore.sh")
HEALTH_NAMES = ("databases/ls_augment_steps_v1.db", "databases/ls_augment_steps_v1.db-wal",
                "databases/ls_augment_steps_v1.db-shm", "databases/ls_augment_steps_v1.db-journal",
                "files/ls_augment_steps.lock")
LAUNCHER_NAMES = ("ls_augment_launcher_grid_state.xml", "ls_augment_launcher_grid_state.xml.bak",
                  "ls_augment_launcher_pages.xml", "ls_augment_launcher_pages.xml.bak")
SETTINGS_KEYS = {"global": ("development_settings_enabled", "adb_enabled"),
                 "system": ("adb_install_enabled", "lock_refresh_rate", "ringtone", "notification_sound", "alarm_alert"),
                 "secure": ("reduce_bright_colors_activated", "reduce_bright_colors_level", "ls_augment_extra_dim_owned")}


def sha(value):
    return hashlib.sha256(value.encode("utf-8")).hexdigest()


def selection(text):
    result, invalid = [], 0
    for line in re.split(r"[;\r\n]+", text):
        if not line:
            continue
        match = re.fullmatch(r"(v3|p3):([0-9]+):([0-9]+):(.+)", line)
        old = re.fullmatch(r"([0-9]+):(.+)", line)
        if match and PKG_RE.fullmatch(match[4]):
            result.append((int(match[2]), int(match[3]), match[4], match[1] == "v3"))
        elif old and PKG_RE.fullmatch(old[2]):
            result.append((int(old[1]), -1, old[2], False))
        else:
            invalid += 1
    return result, invalid


def parse_targets(source, text):
    result, invalid = [], 0
    if source.endswith("manual-targets-v1/document"):
        lines = text.splitlines()
        if not lines or not re.fullmatch(r"LSAT1\|[0-9]+\|[0-9]+", lines[0]) or lines[-1] != "LSAT_END":
            return [], 1
        expected = int(lines[0].split("|")[2])
        for row in lines[1:-1]:
            p = row.split("|")
            if len(p) == 15 and p[0] == "T" and PKG_RE.fullmatch(p[3]):
                try:
                    result.append((int(p[1]), int(p[2]), p[3], p[4] == "1"))
                except ValueError:
                    invalid += 1
            else:
                invalid += 1
        invalid += int(len(lines) - 2 != expected)
    elif "/recovery-journal-v1/events/" in source and source.endswith(".record"):
        p = text.strip().split("|")
        if len(p) in (13, 14, 18) and p[0] in ("LSARJ1", "LSARJ2", "LSARJ3") and PKG_RE.fullmatch(p[6]):
            try:
                result.append((int(p[4]), int(p[5]), p[6], True))
            except ValueError:
                invalid += 1
        else:
            invalid += 1
    elif source.endswith(("targets.conf", "targets.backup.conf")) or any(
            f"/recovery-history-v1/{kind}/" in source for kind in ("targets", "backup", "selection")):
        result, invalid = selection(text)
    return result, invalid


def parse_preferences(text):
    root = ET.fromstring(text)
    if root.tag != "map":
        raise ValueError("preference root")
    return {item.attrib["name"]: (item.text or "") if item.tag == "string" else item.attrib.get("value", "")
            for item in root if "name" in item.attrib}


def live_jobs(text):
    """Only registered job headers and current pending/active sections.

    JobScheduler retains package statistics, service mappings and job history
    after cancel(). Those string references are not registered or pending jobs.
    """
    lines = text.splitlines()
    registered = [line.strip() for line in lines if re.match(r"\s*JOB\s", line)
                  and "ls.augment.com/" in line]

    def section(start, stop):
        active = False
        result = []
        for line in lines:
            if line.strip() == start:
                active = True
                continue
            if active and line.strip().startswith(stop):
                break
            if active and "ls.augment.com/" in line:
                result.append(line.strip())
        return result

    pending = section("Pending queue:", "Active jobs:")
    active = section("Active jobs:", "Idle contexts")
    return {"registered": registered, "pending": pending, "active": active,
            "registered_boot_204501": [line for line in registered if re.search(r"/204501:", line)
                                       and "BootJobService" in line]}


class Device:
    def __init__(self, adb, serial):
        if not serial or not str(serial).strip():
            raise ValueError('Select a device with --serial, LS_AUGMENT_DEVICE or ANDROID_SERIAL before inspecting it.')
        self.prefix = [str(adb), "-s", str(serial).strip(), "exec-out"]
        self.errors = []

    def query(self, script, label, root=True, timeout=45):
        # exec-out must receive one correctly quoted remote command. This
        # device's su/sh stdin transport can hang instead of delivering EOF.
        command = self.prefix + [("su -c " if root else "sh -c ") + shlex.quote(script)]
        try:
            run = subprocess.run(command, capture_output=True, timeout=timeout)
            if run.returncode:
                self.errors.append({"query": label, "exit": run.returncode,
                                    "stderr_sha256": hashlib.sha256(run.stderr).hexdigest()})
                return None
            if len(run.stdout) > 64 * 1024 * 1024:
                raise ValueError("oversized evidence")
            return run.stdout.decode("utf-8", errors="strict").replace("\r\n", "\n").strip()
        except (subprocess.SubprocessError, OSError, UnicodeError, ValueError) as error:
            self.errors.append({"query": label, "error": type(error).__name__})
            return None

    def file(self, path, contents=False):
        # Fixed or validated module paths only. No native health/login contents.
        read = "base64 \"$p\" | tr -d '\\r\\n'" if contents else ":"
        script = f'''p={shlex.quote(path)}
if [ -L "$p" ]; then printf 'SYMLINK\\n';
elif [ ! -e "$p" ]; then printf 'ABSENT\\n';
elif [ -f "$p" ]; then
  printf 'FILE|'; stat -c '%u:%g:%a:%h:%s:%Y:%Z' "$p" || exit 61
  {'[ "$(stat -c %s "$p")" -le 1048576 ] || exit 62' if contents else ':'}
  {read}; printf '\\n'
elif [ -d "$p" ]; then printf 'DIRECTORY|'; stat -c '%u:%g:%a:%h:%s:%Y:%Z' "$p" || exit 63
else printf 'OTHER\\n'; fi
'''
        text = self.query(script, "scoped_file")
        if text is None:
            return {"status": "UNAVAILABLE"}, None
        lines = text.splitlines()
        meta = {"status": lines[0].split("|", 1)[0]}
        if "|" in lines[0]:
            meta["stat"] = lines[0].split("|", 1)[1]
        raw = base64.b64decode(lines[1]).decode("utf-8") if contents and len(lines) > 1 else None
        return meta, raw

    def descendants(self, path, label):
        text = self.query(f'''p={shlex.quote(path)}
[ ! -L "$p" ] || exit 66
if [ -d "$p" ]; then find "$p" -type f -o -type l;
elif [ -e "$p" ]; then printf '%s\\n' "$p"; fi
''', label)
        if text is None:
            return []
        lines = text.splitlines()
        if len(lines) > 65536 or any(not (p == path or p.startswith(path + "/")) for p in lines):
            self.errors.append({"query": label, "error": "invalid inventory"})
            return []
        return lines


def audit(args):
    d = Device(args.adb, args.serial)
    current = d.query("am get-current-user", "current_user", root=False)
    if current is None or not current.isdigit():
        raise RuntimeError("current device user unavailable")
    user = int(current)
    users = d.query("dumpsys user", "users") or ""
    # User serials are verified from package state and explicit target coordinates;
    # keep the user directory privately, rather than guessing missing serials.
    targets = {}
    invalid_records = 0
    inventory = {}
    for name in HIDE_NAMES:
        base = f"{ROOT}/{name}"
        paths = d.descendants(base, "hide_inventory")
        inventory[name] = []
        for path in paths:
            should_read = (path.endswith("manual-targets-v1/document") or "/recovery-journal-v1/events/" in path
                           or path.endswith(("targets.conf", "targets.backup.conf"))
                           or any(f"/recovery-history-v1/{kind}/" in path for kind in ("targets", "backup", "selection")))
            meta, raw = d.file(path, should_read)
            inventory[name].append({"relative": path[len(ROOT) + 1:], **meta})
            if raw is not None:
                entries, invalid = parse_targets(path, raw)
                invalid_records += invalid
                for uid, serial, package, bound in entries:
                    key = f"{uid}|{serial}|{package}"
                    row = targets.setdefault(key, {"user": uid, "serial": serial, "package": package,
                                                   "bound": False, "sources": []})
                    row["bound"] |= bound
                    row["sources"].append(path[len(ROOT) + 1:])
    config_meta, config = d.file(f"/data/user/{user}/{PACKAGE}/shared_prefs/ls_augment_config_v2.xml", True)
    config_summary = {"file": config_meta}
    if config is not None:
        try:
            prefs = parse_preferences(config)
            selected, invalid = selection(prefs.get("ls_augment_hide_targets_v2", ""))
            invalid_records += invalid
            for uid, serial, package, bound in selected:
                key = f"{uid}|{serial}|{package}"
                row = targets.setdefault(key, {"user": uid, "serial": serial, "package": package,
                                               "bound": False, "sources": []})
                row["bound"] |= bound
                row["sources"].append("private_config_selection")
            config_summary.update(health_binding_present=bool(prefs.get("ls_augment_health_account")),
                                  health_plan_present=bool(prefs.get("ls_augment_health_plan")),
                                  health_since_nonzero=prefs.get("ls_augment_health_since", "0") != "0",
                                  private_hide_selection_count=len(selected), key_count=len(prefs))
        except (ET.ParseError, ValueError):
            d.errors.append({"query": "private_config", "error": "malformed XML"})
    if args.baseline:
        baseline = json.loads(Path(args.baseline).read_text(encoding="utf-8"))
        for row in baseline["targets"]:
            key = f"{row['user']}|{row['serial']}|{row['package']}"
            if key not in targets:
                targets[key] = {k: row[k] for k in ("user", "serial", "package", "bound", "sources")}
                targets[key]["from_baseline_only"] = True
    package_dumps = {}
    for package in sorted({r["package"] for r in targets.values()} | {PACKAGE, "com.mi.health", "com.zte.mifavor.launcher", "cn.nubia.gamehelpmodule"}):
        if not PKG_RE.fullmatch(package):
            raise ValueError("unsafe package evidence")
        package_dumps[package] = d.query("dumpsys package " + shlex.quote(package), "package_state")
    for row in targets.values():
        text = package_dumps[row["package"]]
        line = next((p.strip() for p in (text or "").splitlines() if re.match(rf"\s*User {row['user']}: ", p)), None)
        row["state"] = ({k: v for k, v in re.findall(r"(installed|hidden|stopped|enabled|suspended|notLaunched)=([^\s]+)", line)}
                        if line else {"status": "UNAVAILABLE_OR_ABSENT"})
    user_serials = {}
    for uid in {user} | {r["user"] for r in targets.values()}:
        _, user_xml = d.file(f"/data/system/users/{uid}.xml", True)
        try:
            user_serials[str(uid)] = int(ET.fromstring(user_xml).attrib["serialNumber"])
        except (ET.ParseError, TypeError, KeyError, ValueError):
            user_serials[str(uid)] = None
            d.errors.append({"query": "user_serial", "error": "unavailable"})
    for row in targets.values():
        row["current_serial"] = user_serials.get(str(row["user"]))
        row["serial_matches"] = row["serial"] >= 0 and row["serial"] == row["current_serial"]
    other = {}
    health_dump = package_dumps.get("com.mi.health") or ""
    other["health_package_status"] = {"present_in_package_dump": bool(re.search(r"Package \[com\.mi\.health\]", health_dump)),
                                      "package_dump_reports_absent": "Unable to find package" in health_dump}
    other["health_module_files"] = {name: d.file(f"/data/user/{user}/com.mi.health/{name}")[0] for name in HEALTH_NAMES}
    # Native DB names/stat only; no contents, login token, step values, or hashes.
    other["health_native_databases_metadata"] = {
        sha(p.rsplit("/", 1)[-1]): d.file(p)[0]
        for p in d.descendants(f"/data/user/{user}/com.mi.health/databases", "native_health_metadata")
        if not p.rsplit("/", 1)[-1].startswith("ls_augment_steps_v1.db")}
    cache = f"/data/user/{user}/cn.nubia.gamehelpmodule/cache/ls_augment_combo"
    other["game_generated_files"] = [sha(p.rsplit("/", 1)[-1]) for p in d.descendants(cache, "game_cache")
        if re.fullmatch(r"motion-v3-[0-9a-f]{64}(?:\.json|\.pending-[0-9]{1,20})", p.rsplit("/", 1)[-1])]
    other["launcher_records"] = {}
    for storage, prefix in (("ce", "user"), ("de", "user_de")):
        for name in LAUNCHER_NAMES:
            meta, text = d.file(f"/data/{prefix}/{user}/com.zte.mifavor.launcher/shared_prefs/{name}", True)
            if text is not None:
                try:
                    p = parse_preferences(text)
                    meta["key_count"] = len(p)
                    meta["owned"] = p.get("owned")
                    meta["originals_present"] = any(key.startswith("original") for key in p)
                    # Exact module-owned grid originals/effective dimensions are
                    # needed to validate restoration; never read native DB/layout.
                    meta["grid_state"] = {key: p[key] for key in (
                        "original_rows", "original_columns", "effective_rows", "effective_columns",
                        "owned", "migration_pending") if key in p}
                except (ET.ParseError, ValueError):
                    meta["malformed"] = True
            other["launcher_records"][storage + "/" + name] = meta
    launcher_dump = package_dumps.get("com.zte.mifavor.launcher") or ""
    launcher_dirs = re.findall(r"^\s*(dataDir|deviceProtectedDataDir|credentialProtectedDataDir)=(\S+)",
                               launcher_dump, re.MULTILINE)
    # dumpsys may repeat ApplicationInfo for cloned users; never let the last
    # user 999 directory overwrite user 0's directory and pretend it is current.
    other["launcher_package_dirs"] = {
        "all": [{"role": role, "path": path} for role, path in dict.fromkeys(launcher_dirs)],
        "current_user": [{"role": role, "path": path} for role, path in dict.fromkeys(launcher_dirs)
                         if path in (f"/data/user/{user}/com.zte.mifavor.launcher",
                                     f"/data/user_de/{user}/com.zte.mifavor.launcher")
                         or user == 0 and path == "/data/data/com.zte.mifavor.launcher"]}
    other["fixed_root_files"] = {p: d.file(p)[0] for p in (
        "/data/system/ls_augment/boot-config-v1", "/data/system/ls_augment/boot-config-v1.tmp",
        ROOT + "/battery/life.conf", ROOT + "/runtime.properties")}
    other["legacy_ksu_directory_present"] = d.file("/data/adb/modules/ls_augment")[0]["status"] != "ABSENT"
    mount = d.query("nsenter -t 1 -m -- cat /proc/self/mountinfo", "battery_mount") or ""
    other["battery_mounts"] = [line for line in mount.splitlines() if "/vendor/etc/.tp/zte_battery_life.conf" in line]
    settings = {}
    for namespace in ("global", "system", "secure"):
        text = d.query(f"settings --user {user} list {namespace}", "settings_" + namespace)
        values = dict(line.split("=", 1) for line in (text or "").splitlines() if "=" in line)
        settings[namespace] = {k: values.get(k) for k in SETTINGS_KEYS[namespace]}
        settings[namespace]["module_key_count"] = sum(key.startswith("ls_augment_") for key in values)
        if namespace == "secure":
            tiles = values.get("sysui_qs_tiles", "")
            settings[namespace]["qs_tiles"] = tiles
            settings[namespace]["module_tile_count"] = sum(
                bool(re.fullmatch(r"custom\(ls\.augment\.com/(?:\.|ls\.augment\.com\.)(?:AugmentTileService|ExtraDimTileService)\)", value.strip()))
                for value in tiles.split(","))
    _, recovery_xml = d.file(f"/data/user/{user}/{PACKAGE}/shared_prefs/module-system-settings-v1.xml", True)
    setting_originals = []
    if recovery_xml is not None:
        try:
            for encoded in parse_preferences(recovery_xml).values():
                fields = encoded.split("|")
                if len(fields) != 8 or fields[0] != "MSS1":
                    raise ValueError("invalid setting recovery")
                setting_originals.append({"user": int(fields[1]), "namespace": fields[2], "key": fields[3],
                                         "original_known": fields[4] == "1",
                                         "original": None if fields[5] == "~" else base64.b64decode(fields[5]).decode("utf-8")})
        except (ET.ParseError, ValueError):
            d.errors.append({"query": "system_recovery", "error": "malformed"})
    audio = d.query(f'''content query --user {user} --uri content://media/external_primary/audio/media --projection _id:relative_path:owner_package_name:_display_name --where "owner_package_name='ls.augment.com'"''', "module_audio")
    # Only module-owned media evidence is included privately.
    other["module_audio_rows"] = [line for line in (audio or "").splitlines() if line.startswith("Row:")]
    jobs = d.query("dumpsys jobscheduler", "jobs") or ""
    notification = d.query("dumpsys notification", "notifications") or ""
    # Never persist notification payloads from any app.
    other["module_live_jobs"] = live_jobs(jobs)
    other["module_legacy_channel_refs"] = sum(1 for line in notification.splitlines()
        if "ls_augment_automation" in line or "ls_augment_fan_control" in line)
    # Android keeps deleted channel tombstones in dumpsys. Those are not live
    # notifications and do not imply cancel/deleteNotificationChannel failed.
    other["module_live_legacy_channel_refs"] = sum(1 for line in notification.splitlines()
        if ("ls_augment_automation" in line or "ls_augment_fan_control" in line)
        and "mDeleted=true" not in line and "deleted=true" not in line)
    other["module_active_notification_refs"] = sum(1 for line in notification.splitlines()
        if "NotificationRecord(" in line and "pkg=ls.augment.com" in line)
    private = {"timestamp": datetime.datetime.now(datetime.timezone.utc).isoformat(),
               "phase": args.phase, "user": user, "users_dump": users, "targets": list(targets.values()),
               "user_serials": user_serials, "setting_originals": setting_originals,
               "hide_inventory": inventory, "invalid_hide_records": invalid_records,
               "config_summary": config_summary, "external": other, "settings": settings, "errors": d.errors}
    states = [r["state"] for r in targets.values()]
    public = {"timestamp": private["timestamp"], "phase": args.phase, "user": user,
              "target_count": len(targets), "target_hidden_count": sum(r.get("hidden") == "true" for r in states),
              "target_visible_count": sum(r.get("hidden") == "false" for r in states),
              "target_missing_or_unavailable_count": sum("status" in r for r in states),
              "unbound_record_count": sum(not r["bound"] for r in targets.values()),
              "invalid_hide_records": invalid_records,
              "target_states": [{"coordinate_sha256": sha(f"{r['user']}|{r['serial']}|{r['package']}"),
                                 "state": r["state"], "bound": r["bound"], "source_count": len(r["sources"])}
                                for r in targets.values()],
              "hide_file_counts": {name: len(paths) for name, paths in inventory.items()},
              "config_summary": config_summary,
              "health_module_file_count": sum(m["status"] != "ABSENT" for m in other["health_module_files"].values()),
              "health_package_status": other["health_package_status"],
              "game_generated_file_count": len(other["game_generated_files"]),
              "launcher_records": other["launcher_records"], "fixed_root_files": other["fixed_root_files"],
              "legacy_ksu_directory_present": other["legacy_ksu_directory_present"],
              "battery_mount_count": len(other["battery_mounts"]),
              "module_global_keys": settings["global"]["module_key_count"],
              "module_tile_count": settings["secure"]["module_tile_count"],
              "module_audio_row_count": len(other["module_audio_rows"]),
              "system_recovery_record_count": len(setting_originals),
              "launcher_package_dirs": other["launcher_package_dirs"],
              "module_job_ref_count": len(other["module_live_jobs"]["registered"]),
              "module_registered_job_count": len(other["module_live_jobs"]["registered"]),
              "module_pending_job_count": len(other["module_live_jobs"]["pending"]),
              "module_active_job_count": len(other["module_live_jobs"]["active"]),
              "module_registered_boot_204501_count": len(other["module_live_jobs"]["registered_boot_204501"]),
              "legacy_channel_ref_count": other["module_legacy_channel_refs"],
              "live_legacy_channel_ref_count": other["module_live_legacy_channel_refs"],
              "active_module_notification_count": other["module_active_notification_refs"], "errors": d.errors}
    if args.baseline:
        baseline_targets = {(r["user"], r["serial"], r["package"]): r for r in baseline["targets"]}
        checks = []
        for row in targets.values():
            previous = baseline_targets.get((row["user"], row["serial"], row["package"]))
            if previous:
                before, after = previous["state"], row["state"]
                unchanged_absent = before.get("status") == "UNAVAILABLE_OR_ABSENT" and before == after
                checks.append({"coordinate_sha256": sha(f"{row['user']}|{row['serial']}|{row['package']}"),
                               "visible": after.get("hidden") == "false",
                               "unchanged_absent_or_unavailable": unchanged_absent,
                               "expected_visibility_state_verified": after.get("hidden") == "false" or unchanged_absent,
                               "recorded_user_serial_available": row["serial"] >= 0,
                               "user_serial_matches": row["serial_matches"] if row["serial"] >= 0 else None,
                               "current_user_serial_preserved": previous.get("current_serial") is not None
                                   and previous.get("current_serial") == row.get("current_serial"),
                               "enabled_install_preserved": all(before.get(k) == after.get(k) for k in ("enabled", "installed")),
                               "stopped_preserved": before.get("stopped") == after.get("stopped")})
        public["baseline_target_checks"] = checks
        public["baseline_system_setting_checks"] = [
            {"key": r["key"], "namespace": r["namespace"], "original_known": r["original_known"],
             "matches_original": r["original_known"] and settings.get(r["namespace"], {}).get(r["key"]) == r["original"]}
            for r in baseline.get("setting_originals", [])]
        public["pre_test_native_setting_checks"] = [
            {"key": key, "namespace": namespace, "matches_pre_test_value": settings[namespace].get(key) == previous.get(key),
             "basis": "before_this_reset_test_not_before_module_install"}
            for namespace, previous in baseline["settings"].items()
            for key in SETTINGS_KEYS[namespace] if key != "ls_augment_extra_dim_owned"]
        public["historical_limitations"] = [
            "Old hide records do not retain a trustworthy pre-hide stopped state; only the pre-test stopped state is compared.",
            "Native health history and cloud records do not have a complete original-value backup.",
            "Old OEM page/default-page/icon positions do not have a complete pre-edit snapshot.",
            "The native-setting baseline describes the start of this test, not the state before installing the module."]
        def nonmodule_tiles(tiles):
            return ",".join(t for t in tiles.split(",") if not re.fullmatch(
                r"custom\(ls\.augment\.com/(?:\.|ls\.augment\.com\.)(?:AugmentTileService|ExtraDimTileService)\)", t.strip()))
        public["nonmodule_tiles_preserved"] = nonmodule_tiles(settings["secure"]["qs_tiles"]) == nonmodule_tiles(baseline["settings"]["secure"]["qs_tiles"])
    if args.launcher_baseline:
        launcher_baseline = json.loads(Path(args.launcher_baseline).read_text(encoding="utf-8"))
        public["launcher_grid_recovery_checks"] = []
        for source, old in launcher_baseline["external"]["launcher_records"].items():
            if "grid_state" not in source or old.get("owned") != "true":
                continue
            now = other["launcher_records"].get(source, {"status": "UNAVAILABLE"})
            original = old.get("grid_state", {})
            current_grid = now.get("grid_state", {})
            public["launcher_grid_recovery_checks"].append({
                "store": source.split("/", 1)[0],
                "original_rows": original.get("original_rows"),
                "original_columns": original.get("original_columns"),
                "currently_owned": now.get("owned") == "true",
                "originals_preserved_if_pending": now.get("owned") == "true" and all(
                    current_grid.get(key) == original.get(key) for key in ("original_rows", "original_columns")),
                "module_recovery_metadata_cleared": now.get("status") == "ABSENT"
                    or now.get("status") == "FILE" and now.get("key_count") == 0,
                "native_layout_verification_basis": "OEM/native hook verification required; this audit never reads the native layout database"})
    output = Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)
    private_path = output.with_suffix(".private.json")
    private_path.write_text(json.dumps(private, ensure_ascii=False, indent=2), encoding="utf-8")
    output.write_text(json.dumps(public, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps({"report": str(output), "private_evidence": str(private_path),
                      "target_count": public["target_count"], "hidden_count": public["target_hidden_count"],
                      "health_module_file_count": public["health_module_file_count"], "errors": len(d.errors)}, ensure_ascii=False))


def self_test():
    p = "org.example.app"
    assert selection(f"v3:0:2:{p};1:{p}")[0] == [(0, 2, p, True), (1, -1, p, False)]
    assert selection("v4:0:2:org.example.app")[1] == 1
    row = f"T|0|2|{p}|1|0|-|HIDDEN|3|-|0|-|-|-|-\n"
    assert parse_targets(ROOT + "/manual-targets-v1/document", "LSAT1|4|1\n" + row + "LSAT_END\n")[0] == [(0, 2, p, True)]
    assert parse_targets(ROOT + "/manual-targets-v1/document", "LSAT1|4|2\n" + row + "LSAT_END\n")[1] == 1
    journal = f"LSARJ1|x|x|0|0|2|{p}|unknown|0|PREPARED|VISIBLE|0|0\n"
    assert parse_targets(ROOT + "/recovery-journal-v1/events/a.record", journal)[0] == [(0, 2, p, True)]
    assert parse_preferences('<map><string name="a">x</string><boolean name="b" value="true" /></map>') == {"a": "x", "b": "true"}
    jobs = live_jobs("statistics: ls.augment.com\nRegistered 1 jobs:\n  JOB #u0a515/204501: abc ls.augment.com/.BootJobService\nPending queue:\n  None\nActive jobs:\n  N/A\nIdle contexts (16):\n  historical ls.augment.com/.BootJobService\n")
    assert len(jobs["registered_boot_204501"]) == 1 and not jobs["pending"] and not jobs["active"]
    assert not live_jobs("package cache: ls.augment.com\n  Job history:\n old finished ls.augment.com/.BootJobService\n")["registered"]
    print("read-only inspection parser self-test passed (8 checks)")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--adb", default=os.environ.get("LS_AUGMENT_ADB") or shutil.which("adb") or "adb",
                        help="ADB executable; defaults to LS_AUGMENT_ADB or PATH")
    parser.add_argument("--serial", default=os.environ.get("LS_AUGMENT_DEVICE") or os.environ.get("ANDROID_SERIAL"),
                        help="Target device; defaults to LS_AUGMENT_DEVICE or ANDROID_SERIAL")
    parser.add_argument("--phase", default="baseline")
    parser.add_argument("--output", default="audit-output/total-reset-external/baseline.json")
    parser.add_argument("--baseline", help="Previous private report; continues probing targets after their lists are removed")
    parser.add_argument("--launcher-baseline", help="Augmented private report containing both CE and DE launcher originals")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if not args.self_test and (not args.serial or not args.serial.strip()):
        parser.error("Select a device with --serial, LS_AUGMENT_DEVICE or ANDROID_SERIAL.")
    self_test() if args.self_test else audit(args)
