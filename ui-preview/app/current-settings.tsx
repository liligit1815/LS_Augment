/* eslint-disable nextjs/no-img-element -- Local native assets must retain their measured dimensions; user-selected images are data URLs. */
'use client';
import { useRef, useState } from 'react';
import { Card, FeatureTitle, LinkCard, Button, useModel } from './current-ui';
import catalog from './current-catalog.json';
import { CurrentCompatibility } from './current-compatibility';
import legal from './current-legal.json';
import scopePackages from './current-scope.json';
import { backupSettings, downloadBackup } from './current-backup';
export const settingTitles: Record<string, string> = {
  support: '支持',
  contributors: '贡献者',
  scope: '作用域同步',
  config_transfer: '配置备份与重置',
  compatibility_help: '日志及运行诊断',
  framework: '框架兼容性',
  version: '当前版本兼容性',
  launcher_compatibility: '修改版桌面兼容性',
};
export function LegalContent({ kind }: { kind: string }) {
  return (
    <div className="c-legal-text">
      <p>2026 年 9 月 11 日 · 第 1 版</p>
      {(kind === 'terms' ? [0, 1, 2, 5, 6] : [0, 3, 4, 5, 6]).map((i) => (
        <section key={i}>
          <h3>{legal[i][0].split('、').slice(1).join('、')}</h3>
          <p>{legal[i][1]}</p>
        </section>
      ))}
    </div>
  );
}
export function CurrentSettingsPage({
  route,
  reset,
  restore,
}: {
  route: string;
  reset: () => void;
  restore: (settings: Record<string, string>) => void;
}) {
  const m = useModel(),
    file = useRef<HTMLInputElement>(null),
    [error, setError] = useState(''),
    [refresh, setRefresh] = useState(false);
  const notice = (title: string, copy: string) =>
    m.dialog(
      title,
      <>
        <p>{copy}</p>
        <footer>
          <button onClick={m.close}>知道了</button>
        </footer>
      </>,
    );
  if (route === 'support')
    return (
      <>
        <p className="c-support-copy">
          感谢您的支持！
          <br />
          捐赠并不能为您带来特权，但能帮助我继续进行维护。
          <br />
          您可以在<a href="mailto:lililimailq@qq.com">此处</a>联系到我。
        </p>
        <div className="c-two-columns c-support-grid">
          {[
            ['微信', 'wechat'],
            ['支付宝', 'alipay'],
          ].map(([s, k]) => (
            <Card
              key={k}
              className="c-support-card"
              label={s + '收款码'}
              path={'SupportActivity:' + k}
            >
              <h3>{s}</h3>
              <img src={'/current/support_' + k + '.jpg'} alt={s + '收款码'} />
            </Card>
          ))}
        </div>
      </>
    );
  if (route === 'contributors')
    return (
      <>
        <p className="c-note">感谢以下个人与团队的贡献和支持。</p>
        <Card>
          {[
            ['卒迹', '个人贡献者'],
            ['绀漓丨Sevtinge', '个人贡献者'],
            ['红魔助手开发团队', '开发团队'],
            ['HyperCeiler开发团队', '开发团队'],
          ].map(([s, t]) => (
            <div key={s} className="c-contributor">
              <strong>{s}</strong>
              <small>{t}</small>
            </div>
          ))}
        </Card>
      </>
    );
  if (route === 'compatibility_help')
    return (
      <>
        {[
          [
            '框架兼容性',
            '检查框架连接、版本与 API，并区分连接状态和当前模块加载证据。',
            'framework',
          ],
          [
            '当前版本兼容性',
            '对照当前模块收录的适配基准，读取本机系统和目标应用的实际版本。',
            'version',
          ],
          [
            '修改版桌面兼容性',
            '检查修改版桌面所需的机型、系统、原厂签名、版本与关键权限；不会安装或替换桌面。',
            'launcher_compatibility',
          ],
          [
            '日志与诊断',
            '查看详细日志选项并按需导出诊断。进入页面不会自动启用日志或重启应用。',
            'diagnostics',
          ],
        ].map(([title, help, r]) => (
          <LinkCard key={r} title={title} help={help} route={r} />
        ))}
      </>
    );
  if (route === 'scope')
    return (
      <>
        <Card>
          <FeatureTitle
            title="模块在哪些应用中运行"
            help="读取框架实际勾选的应用，并与当前版本的推荐清单核对。勾选状态不代表 Hook 已加载。"
          />
          <div className="c-buttons">
            <Button
              onClick={() => {
                setRefresh(true);
                setTimeout(() => setRefresh(false), 450);
              }}
            >
              {refresh ? '正在读取…' : '刷新状态'}
            </Button>
            <Button
              onClick={() =>
                notice(
                  '打开 LSPosed',
                  '原型演示：从管理器进入「模块 → LS_Augment」查看作用域。',
                )
              }
            >
              打开 LSPosed
            </Button>
          </div>
        </Card>
        <Card>
          <strong>已连接 · LSPosed</strong>
          <p className="c-note">
            当前框架返回 {scopePackages.length} 个作用域。
          </p>
        </Card>
        <Card>
          <FeatureTitle
            title="推荐作用域"
            help="当前版本推荐的应用作用域；同步只补齐本机已安装的应用。"
          />
          <p className="c-note">本机已安装 {scopePackages.length} 个</p>
          <Button
            onClick={() => notice('同步结果', '原型演示：推荐作用域已同步。')}
          >
            同步推荐作用域
          </Button>
          <p className="c-note">
            同步只补齐本机已安装的推荐应用；如框架要求授权，请在框架提示中确认。
          </p>
          {scopePackages.map((pkg) => (
            <div
              key={pkg}
              className="c-scope-row"
              data-native-path={'scope:' + pkg}
              data-ui-label={pkg}
            >
              <div>
                <strong>
                  {catalog.targets.find((t) => t.packageName === pkg)?.title ||
                    pkg}
                </strong>
                <span>已勾选</span>
              </div>
              <small>{pkg}</small>
            </div>
          ))}
        </Card>
        <Card>
          <FeatureTitle
            title="额外作用域"
            help="当前版本使用固定作用域，只支持已适配的推荐应用，暂不支持新增额外应用。"
          />
          <p className="c-note">当前没有额外作用域。</p>
        </Card>
      </>
    );
  if (route === 'config_transfer') {
    const exportConfig = () => {
      downloadBackup(backupSettings(m.values));
      m.tell('网页配置已导出');
    };
    return (
      <>
        <Card>
          <FeatureTitle
            title="配置备份"
            help="导出功能设置、应用选择、自定义图片、字体与肩键候选。不包含账户绑定、执行日志和设备测试凭据。导入后按需重启作用域。"
          />
          <Button onClick={exportConfig}>导出配置</Button>
          <Button onClick={() => file.current?.click()}>导入配置</Button>
          <input
            type="file"
            hidden
            ref={file}
            accept=".json,application/json"
            aria-label="导入配置文件"
            onChange={async (e) => {
              const input = e.currentTarget,
                f = input.files?.[0];
              if (!f) return;
              try {
                if (f.size > 8_000_000) throw Error('文件过大');
                const d = JSON.parse(await f.text());
                if (
                  d.format !== 'LS_Augment.UIPrototype' ||
                  d.version !== 2 ||
                  !d.settings ||
                  typeof d.settings !== 'object' ||
                  Array.isArray(d.settings) ||
                  !Object.values(d.settings).every((v) => typeof v === 'string')
                )
                  throw Error('请选择当前网页原型导出的配置文件');
                const entries = Object.entries(d.settings) as [
                  string,
                  string,
                ][];
                m.dialog(
                  '导入配置',
                  <>
                    <p>
                      已校验 {entries.length} 项网页设置。导入将替换对应设置。
                    </p>
                    <footer>
                      <button onClick={m.close}>取消</button>
                      <button
                        onClick={() => {
                          restore(Object.fromEntries(entries));
                          m.close();
                          m.tell('网页配置已导入');
                        }}
                      >
                        导入
                      </button>
                    </footer>
                  </>,
                );
                setError('');
              } catch (ex) {
                setError(ex instanceof Error ? ex.message : '导入失败');
              }
              input.value = '';
            }}
          />
          {error && (
            <p role="alert" className="c-error">
              {error}
            </p>
          )}
        </Card>
        <Card>
          <FeatureTitle
            title="恢复默认设置"
            help="恢复全部模块设置，清除应用选择、图片和字体选择、健康绑定及肩键快捷候选，并恢复模块桌面入口。重置前可先导出配置。"
          />
          <Button
            onClick={() =>
              m.dialog(
                '重置全部配置？',
                <>
                  <p>
                    将恢复全部模块设置，并先恢复隐藏清单中的应用。健康绑定和本机测试凭据也会清除，需要重新绑定或测试。
                    {'\n\n'}
                    不会卸载应用或重排桌面页面。诊断日志保留。重置完成后需要重启手机。
                  </p>
                  <footer>
                    <button onClick={m.close}>取消</button>
                    <button
                      onClick={() => {
                        reset();
                        m.close();
                        m.tell('原型演示：已恢复网页默认设置');
                      }}
                    >
                      确认重置
                    </button>
                  </footer>
                </>,
              )
            }
          >
            重置全部配置
          </Button>
        </Card>
        <p className="c-note">此原型的备份用于保存界面操作状态。</p>
      </>
    );
  }
  return <CurrentCompatibility route={route} />;
}
