'use client';
import reference from './current-clock-format-reference.json';
import { useModel } from './current-ui';
import { NativeFold } from './current-native-controls';
const examples = [
  ['HH:mm', '14:05'],
  ['HH:mm:ss', '14:05:09'],
  ['HH:mm:ss.SSS', '14:05:09.123'],
  ['aa h:mm', '下午 2:05'],
  ['yyyy-MM-dd EEEE', '2026-09-23 星期三'],
  ['MM/dd E', '09/23 周三'],
  ["HH'时'mm'分'", '14时05分'],
  ["yyyy-MM-dd'T'HH:mm:ssXXX", '2026-09-23T14:05:09+08:00'],
  ["'o''clock' HH:mm", "o'clock 14:05"],
  ['NNNN', '农历月日；当天有节气时追加节气'],
  ["Y'年' N'月'e", '干支年与农历月日'],
  ["A'年' II'时'", '生肖与时干支'],
];
export function ClockFormatHelp() {
  const m = useModel();
  const copy = async (text: string) => {
    try {
      await navigator.clipboard.writeText(text);
      m.tell('已复制格式：' + text);
    } catch {
      m.tell('无法自动复制，请长按选择格式文字复制');
    }
  };
  return (
    <div className="sd-clock-help">
      <p className="c-native-note">
        格式区分大小写。含 s 或 S
        时可按秒更新；需要更快刷新毫秒时另开启“毫秒刷新”。先选择单排或双排，再分别填写格式。
      </p>
      <NativeFold title="可复制格式示例">
        <p className="c-native-note">
          示例：2026-09-23
          14:05:09.123，中文、UTC+8。农历示例说明含义，实际结果由手机当地日期和历表确定。
        </p>
        {examples.map(([format, result]) => (
          <button
            className="sd-format-example"
            key={format}
            onClick={() => copy(format)}
            aria-label={'复制格式 ' + format}
          >
            <code>{format}</code>
            <small>{result}</small>
            <span>点击复制</span>
          </button>
        ))}
      </NativeFold>
      {reference
        .split('\n\n')
        .filter(Boolean)
        .slice(1)
        .map((section) => {
          const [title, ...lines] = section.split('\n');
          return (
            <NativeFold key={title} title={title}>
              {lines.map((line, index) => (
                <p key={index} className="c-native-note">
                  {line}
                </p>
              ))}
            </NativeFold>
          );
        })}
      <p className="c-native-note">
        c、b、B 等额外格式由 Android
        本机能力决定；本网页不将浏览器支持情况当作手机支持证明。未支持格式应使用
        a／aa 等已明确支持的格式。
      </p>
    </div>
  );
}
