"""Verify each memory presentation against real native Recents and real RAM values."""
import json
import re
import time
from adb_regression import OUTPUT, instrument, shell
from recents_device_helpers import overview


def run():
    folder = OUTPUT / 'round40g-memory-content'
    folder.mkdir(exist_ok=True)
    assert not (folder / 'results.json').exists()
    results = []
    total_kb = int(re.search(r'^MemTotal:\s+(\d+)', shell('cat /proc/meminfo'), re.M)[1])
    for style in range(2):
        for content in range(5):
            label = f'round40g-style{style}-content{content}'
            instrument('set', label + '-config', {
                'ls_augment_rm_recents_memory_custom': '1',
                'ls_augment_rm_recents_memory_style': str(style),
                'ls_augment_rm_recents_memory_content': str(content),
                'ls_augment_rm_recents_memory_color_mode': '0',
                'ls_augment_rm_recents_memory_portrait_top': '5',
                'ls_augment_rm_recents_memory_portrait_size': '12',
                'ls_augment_rm_recents_memory_portrait_height': '65',
                'ls_augment_rm_recents_memory_detailed_portrait_size': '12',
                'ls_augment_rm_recents_memory_detailed_portrait_height': '85',
            })
            time.sleep(.8)
            _, evidence = overview(label)
            assert len(evidence['memory']) == 1, evidence['memory']
            node = evidence['memory'][0]
            value = node['text']
            expected = {0: ['可用', '已用', '总量'], 1: ['可用', '已用'],
                        2: ['可用'], 3: ['已用'], 4: ['总量']}[content]
            observed = re.findall(r'(可用|已用|总量)\s+(\d+\.\d+) GB', value)
            assert [name for name, _ in observed] == expected, value
            numbers = {name: float(number) for name, number in observed}
            assert all(0 <= number <= total_kb / (1024 * 1024) + .01 for number in numbers.values())
            if content == 0:
                assert abs(numbers['可用'] + numbers['已用'] - numbers['总量']) <= .011, numbers
            if '总量' in numbers:
                assert abs(numbers['总量'] - total_kb / (1024 * 1024)) <= .006
            percents = [float(n) for n in re.findall(r'\((\d+\.\d+)%\)', value)]
            expected_percent_count = len([n for n in expected if n != '总量']) if style else 0
            assert len(percents) == expected_percent_count, value
            if len(percents) == 2:
                assert abs(sum(percents) - 100) < .11, percents
            assert value.count('\n') == (len(expected) - 1 if style else 0), value
            results.append({'style': style, 'content': content, 'text': value,
                            'bounds': node['bounds'], 'percentages': percents, 'pass': True})
            (folder / 'progress.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    result = {'launcherVersionCode': 260002, 'nativeStyle': 3, 'nativeMemory': True,
              'realTotalKiB': total_kb, 'cases': results, 'pass': len(results) == 10}
    (folder / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(result, ensure_ascii=False), flush=True)


if __name__ == '__main__':
    run()
