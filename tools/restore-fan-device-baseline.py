"""Restore this fan group's saved preferences after all actual device tests finish."""
import json
import sys
import time

from adb_regression import OUTPUT, instrument, shell
from fan_device_helpers import KEYS, prefs, sample

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
original = json.loads((OUTPUT / 'round42f-fan-module-before/state.json').read_text(encoding='utf-8'))
assert (original['enable'], original['level'], original['manual'], original['mode']) == (0, 2, -100, 1)
before = sample()
assert before['enable'] == 0 and before['level'] == 2 and before['mode'] == 1
assert not before['settings']['ls_augment_fan_calibration_request']
config_before = prefs('ls_augment_config_v2')
(out / 'config-before-private.json').write_text(json.dumps(config_before, ensure_ascii=False, indent=2), encoding='utf-8')
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
instrument('set', stage + '-restore-six', original['settings'])
# Actual OEM OFF clicks legitimately change this field to 0. Restore the saved
# neutral -100 baseline as test cleanup; it is not a fan_enable write or proof
# of a module feature. The following trace must show the native fan stays OFF.
shell('settings put system fan_state_of_manual -100', root=True)
observations = []
for _ in range(5):
    value = sample()
    observations.append(value)
    time.sleep(.8)
config_after = prefs('ls_augment_config_v2')
metadata_keys = {'snapshot_revision_v1', 'snapshot_updated_at_v1'}
unchanged = {key for key in config_before.keys() | config_after.keys()
             if key not in KEYS and key not in metadata_keys and config_before.get(key) != config_after.get(key)}
checks = {
    'sixModulePreferencesRestored': all(v['settings'] == original['settings'] for v in observations),
    'savedNativeStateRestored': all(all(v[key] == original[key] for key in ['enable', 'level', 'rpm', 'manual', 'mode']) for v in observations),
    'otherModulePreferencesPreserved': not unchanged,
}
result = {'case': 'Fan-group-baseline-restoration', 'pass': all(checks.values()), **checks,
          'original': original, 'after': observations[-1], 'otherChangedKeys': sorted(unchanged),
          'expectedSnapshotMetadataKeys': sorted(metadata_keys),
          'cleanupNativeSetting': {'key': 'fan_state_of_manual', 'savedValue': -100}, 'observations': observations}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print({'pass': result['pass'], **checks}, flush=True)
assert result['pass']
