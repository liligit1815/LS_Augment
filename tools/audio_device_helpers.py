"""Real short AudioTrack playback and independent native audio evidence."""
import concurrent.futures
import json
import re
import time
from adb_regression import OUTPUT, shell, instrument
from fan_device_helpers import prefs
from game_device_helpers import touch

PACKAGE = 'ls.augment.regression.audio'


def player(label, usage):
    shell('am start -W -n ' + PACKAGE + '/.Probe', root=True)
    touch(label + '-play', text={1: 'PLAY MEDIA', 6: 'PLAY RINGTONE', 4: 'PLAY ALARM'}[usage])
    time.sleep(.7)


def config(label, **values):
    return instrument('set', label, {'ls_augment_audio_' + k: str(v) for k, v in values.items()})


def observe(label):
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    def dump(item):
        name, command = item
        value = shell(command, root=name == 'events')
        (folder / (name + ('.jsonl' if name == 'events' else '.txt'))).write_text(value, encoding='utf-8')
        return name, value
    commands = [('audio', 'dumpsys audio'), ('flinger', 'dumpsys media.audio_flinger'),
                ('policy', 'dumpsys media.audio_policy'),
                ('events', '/system/bin/cat /data/user/0/' + PACKAGE + '/files/audio-events.jsonl')]
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        values = dict(pool.map(dump, commands))
    events = [json.loads(row) for row in values['events'].splitlines() if row.strip()]
    latest = events[-1]
    (folder / 'config.json').write_text(json.dumps(prefs('ls_augment_config_v2'), indent=2), encoding='utf-8')
    result = {k: latest.get(k) for k in ('event', 'pid', 'uid', 'session_id', 'usage', 'play_state',
        'playback_head', 'submitted_frames', 'nonzero_samples', 'routed_device_type', 'elapsed_ms')}
    # This is an index for reviewing the full dump, not an effect PASS assertion.
    result['loudness_mentions'] = values['flinger'].count('Loudness Enhancer')
    (folder / 'observation.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    print(label, json.dumps(result), flush=True)
    return result


def stop(label):
    touch(label + '-stop', text='STOP')
    time.sleep(.7)
    return observe(label)


def stream_state(text):
    result = {}
    for match in re.finditer(r'^- (STREAM_[A-Z_]+)([^\n]*):\s*\n(.*?)(?=\n- |\n\nVolume|\Z)', text, re.M | re.S):
        body = match.group(3)
        result[match.group(1)] = {'alias': match.group(2).strip(), **{
            key: (re.search(r'^\s*' + re.escape(key) + r':\s*(.*)$', body, re.M).group(1).strip()
                  if re.search(r'^\s*' + re.escape(key) + r':\s*(.*)$', body, re.M) else None)
            for key in ('Muted', 'Muted Internally', 'Min', 'Max', 'Current', 'Devices')}}
    return result
