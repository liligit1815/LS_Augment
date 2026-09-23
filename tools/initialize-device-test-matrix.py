"""Create the full regression checklist; no source presence is counted as a device pass."""
from pathlib import Path
import json
import re

root = Path(__file__).resolve().parents[1]
out = root / 'out/full-device-regression-20260908/test-matrix.json'
if out.exists():
    raise SystemExit('Matrix already exists; update evidence instead of resetting progress.')
source = (root / 'docs/全功能完整性复核-2026-09-08.md').read_text(encoding='utf-8')
old = source.split('**LS 原功能与此前新增功能逐项核对**', 1)[1].split('**迁入功能的分组覆盖**', 1)[0]
groups = source.split('**迁入功能的分组覆盖**', 1)[1].split('**本轮验证结果与实际设备证据**', 1)[0]
entries = []
for prefix, content in [('LS', old), ('RM', groups)]:
    rows = [line.split('|')[1:-1] for line in content.splitlines() if line.startswith('| ')][1:]
    for i, row in enumerate(rows, 1):
        name = row[0].strip()
        deferred = '肩键' in name or '全应用肩键' in name
        entries.append({'id': f'{prefix}-{i:02d}', 'name': name,
                        'status': 'user_deferred' if deferred else 'not_run',
                        'requires': {'setting_entry': [], 'actual_effect': [], 'off_restore': [], 'restart': [], 'boundaries': [], 'logs': []},
                        'note': 'User explicitly deferred shoulder testing.' if deferred else ''})
entries.insert(0, {'id': 'RESET', 'name': '重置全部模块配置', 'status': 'partial',
    'requires': {'setting_entry': ['round1-reset-page'], 'actual_effect': ['round1-reset-defaults', 'round1-reset-results/results.json'],
                 'off_restore': ['round1-reset-results/results.json'], 'restart': ['round1-reset-after-reboot'],
                 'boundaries': ['round1-reset-results/results.json: cancellation'], 'logs': ['round1-reset-logs/summary.json']},
    'note': 'Root failure, repeated reset and backup/restore integration remain pending.'})
matrix = {'scope': 'All original and migrated LS_Augment features; hardware and shoulder cases explicitly handed back to user.',
          'acceptance': 'ADB-driven real device evidence required; registration and saved parameters do not establish functional success.',
          'features': entries,
          'user_checks': [
              {'id': 'USER-SIM', 'name': '双卡信号与数据卡切换、拔卡恢复', 'reason': '没有插入 SIM'},
              {'id': 'USER-AUDIO', 'name': '有线/USB/蓝牙音频的高音量提示及增益效果', 'reason': '没有耳机'},
              {'id': 'USER-SHOULDER', 'name': '肩键资格、快捷方案、实体连点和相关边界', 'reason': '用户明确暂缓并自行补测'},
              {'id': 'USER-PRIVACY', 'name': '相机、麦克风、定位隐私提醒的目视开启/关闭恢复', 'reason': '原厂指示图层排除在普通截图之外，需目视确认'}]}
out.write_text(json.dumps(matrix, ensure_ascii=False, indent=2), encoding='utf-8')
print(f'Created {len(entries)} feature-group records with evidence requirements; no untested feature marked passed.')
