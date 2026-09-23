"""Fast simultaneous read-only snapshots of two actual, owned AudioTracks."""
import concurrent.futures
import json
from adb_regression import OUTPUT, shell
from fan_device_helpers import prefs

PACKAGES = ['ls.augment.regression.audio', 'ls.augment.regression.audio2']


def observe(label):
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    jobs = [('audio', 'dumpsys audio'), ('flinger', 'dumpsys media.audio_flinger')]
    jobs += [('events' + str(i), 'cat /data/user/0/' + p + '/files/audio-events.jsonl')
             for i, p in enumerate(PACKAGES)]

    def read(job):
        name, command = job
        value = shell(command, root=True)
        (folder / (name + '-private.txt')).write_text(value, encoding='utf-8')
        return name, value

    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        values = dict(pool.map(read, jobs))
    result = {}
    for i, package in enumerate(PACKAGES):
        rows = []
        for line in values['events' + str(i)].splitlines():
            if not line.strip():
                continue
            try:
                rows.append(json.loads(line))
            except json.JSONDecodeError:
                # The raw append-in-progress remains saved, never fabricate it.
                continue
        if not rows:
            raise AssertionError('No complete event for ' + package)
        result[package] = rows[-1]
    (folder / 'observation.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    (folder / 'config.json').write_text(json.dumps(prefs('ls_augment_config_v2'), indent=2), encoding='utf-8')
    return result


def brief(result):
    keys = ['event', 'run_id', 'pid', 'uid', 'session_id', 'elapsed_realtime_ms',
            'play_state', 'playback_head', 'nonzero_samples', 'routed_device_type', 'reason']
    return {package: {k: row.get(k) for k in keys} for package, row in result.items()}
