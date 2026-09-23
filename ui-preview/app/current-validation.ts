/** UI-only validation mirrors the native settings' allowed inputs. */
export function clockPatternValid(s: string) {
  let literal = false;
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c === "'") {
      if (s[i + 1] === "'") {
        i++;
        continue;
      }
      literal = !literal;
      continue;
    }
    if (
      !literal &&
      /[A-Za-z]/.test(c) &&
      !/[GyYuUrQqMLlwWdDFgEecabBhHKkjJmsSAzZOvVXxNIt]/.test(c)
    )
      return false;
  }
  return !literal;
}
export function formatClock(s: string) {
  if (!clockPatternValid(s)) return '格式有误';
  const parts = s.split(/('(?:[^']|'')*')/g);
  return parts
    .map((p, i) =>
      i % 2
        ? p.slice(1, -1).replace(/''/g, "'")
        : p.replace(
            /HH|hh|mm|ss|yyyy|yy|MM|dd|EEEE|EEE|E|NNNN|NNN|NN|N|II|I|aa|a|e|Y|A|t/g,
            (t) =>
              ({
                HH: '17',
                hh: '05',
                mm: '51',
                ss: '30',
                yyyy: '2026',
                yy: '26',
                MM: '09',
                dd: '12',
                EEEE: '星期六',
                EEE: '周六',
                E: '周六',
                NNNN: '八月初二',
                NNN: '八月初二',
                NN: '丁酉',
                N: '八月',
                II: '癸酉',
                I: '酉',
                aa: '下午',
                a: '下午',
                e: '初二',
                Y: '丙午',
                A: '马',
                t: '',
              })[t] || t,
          ),
    )
    .join('');
}
export function validText(key: string, value: string, max: number) {
  if (value.includes('\0') || value.length > max) return false;
  if (key.includes('country')) return !value || /^[A-Za-z]{2}$/.test(value);
  if (key.endsWith('_mac'))
    return !value || /^(?:[\da-f]{2}:){5}[\da-f]{2}$/i.test(value);
  if (key.includes('clock_format') || key.includes('clock_pattern'))
    return clockPatternValid(value);
  return true;
}
