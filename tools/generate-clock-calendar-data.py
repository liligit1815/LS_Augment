"""Generate compact factual calendar data from the retained official HKO tables.

Only dates/month numbers/solar-term dates are redistributed. Full source tables
and their SHA256 manifest remain in test evidence, not in the application.
"""
from datetime import date, timedelta
from pathlib import Path
import hashlib
import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')
root = Path(__file__).resolve().parents[1]
folder = root / 'out/full-device-regression-20260908/round12-calendar-reference'
base = date(1900, 1, 1)
days = ['', '初一', '初二', '初三', '初四', '初五', '初六', '初七', '初八', '初九', '初十',
        '十一', '十二', '十三', '十四', '十五', '十六', '十七', '十八', '十九', '二十',
        '廿一', '廿二', '廿三', '廿四', '廿五', '廿六', '廿七', '廿八', '廿九', '三十']
months = ['正', '二', '三', '四', '五', '六', '七', '八', '九', '十', '十一', '十二']
terms = '小寒 大寒 立春 雨水 驚蟄 春分 清明 穀雨 立夏 小滿 芒種 夏至 小暑 大暑 立秋 處暑 白露 秋分 寒露 霜降 立冬 小雪 大雪 冬至'.split()
all_rows, term_years, packed = [], [], []
cursor = None
for year in range(1901, 2101):
    source = (folder / f'T{year}c.txt').read_text(encoding='utf-8-sig')
    rows = []
    solar = [0] * 24
    for line in source.splitlines():
        match = re.match(r'(\d{4})年(\d{1,2})月(\d{1,2})日\s+(\S+)\s+星期\S\s*(\S*)', line)
        if not match:
            continue
        y, m, d = map(int, match.group(1, 2, 3))
        civil = date(y, m, d)
        lunar, term = match.group(4, 5)
        if '月' in lunar:
            leap = '閏' in lunar
            month = months.index(lunar.replace('閏', '').removesuffix('月')) + 1
            if cursor is None:
                raise AssertionError('Initial partial month must be handled first')
            lunar_year = cursor[1] + (month == 1 and not leap)
            if cursor[0] != civil:
                assert (civil - cursor[0]).days in (29, 30)
            cursor = (civil, lunar_year, month, leap)
            packed.append(((civil - base).days << 13) | ((lunar_year - 1900) << 5) | (16 if leap else 0) | month)
            day = 1
        else:
            day = days.index(lunar)
            if cursor is None:
                # HKO's first row is lunar 1900-11-11; next first-day row is 12th month.
                assert civil == date(1901, 1, 1) and day == 11
                start = civil - timedelta(days=day - 1)
                cursor = (start, 1900, 11, False)
                packed.append(((start - base).days << 13) | 11)
            assert (civil - cursor[0]).days + 1 == day, (civil, cursor, day)
        if term:
            index = terms.index(term)
            assert index // 2 + 1 == m and solar[index] == 0
            solar[index] = d
        row = [civil.isoformat(), cursor[1], cursor[2], int(cursor[3]), day, terms.index(term) if term else -1]
        rows.append(row)
    assert len(rows) == (date(year + 1, 1, 1) - date(year, 1, 1)).days, (year, len(rows))
    assert all(solar)
    all_rows.extend(rows)
    term_years.append(''.join(chr(ord('A') + day - 1) for day in solar))
assert len(all_rows) == 73049
for i, row in enumerate(all_rows):
    assert row[0] == (date(1901, 1, 1) + timedelta(days=i)).isoformat()

java = '''package ls.augment.com.hook;

/** Generated factual date data; regenerate with tools/generate-clock-calendar-data.py.
 * Source: Hong Kong Observatory, 1901–2100 Gregorian/lunar conversion tables.
 * https://www.hko.gov.hk/tc/gts/time/conversion1_text.htm
 * Month entries: days since 1900-01-01, lunar year offset, leap flag, month number.
 * Solar-term dates follow the official Chinese civil calendar (UTC+08 dates).
 */
final class ChineseCalendarData {
    private ChineseCalendarData() { }
    static final int[] MONTHS = {
'''
for i in range(0, len(packed), 10):
    java += '        ' + ', '.join(map(str, packed[i:i + 10])) + ',\n'
java += '    };\n    static final String[] SOLAR_TERM_DAYS = {\n'
for i, text in enumerate(term_years):
    java += f'        "{text}", // {1901 + i}\n'
java += '    };\n}\n'
target = root / 'android/app/src/main/java/ls/augment/com/hook/ChineseCalendarData.java'
target.write_text(java, encoding='utf-8')
# The regression runner independently checks every date against the source rows.
tsv = '\n'.join('\t'.join(map(str, row)) for row in all_rows) + '\n'
(folder / 'expected-dates.tsv').write_text(tsv, encoding='utf-8')
result = {'dates': len(all_rows), 'lunarMonths': len(packed), 'solarTerms': len(term_years) * 24,
          'generatedSha256': hashlib.sha256(java.encode()).hexdigest(), 'sourceManifest': str(folder / 'sources.json')}
(folder / 'generation.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
print(json.dumps(result))
