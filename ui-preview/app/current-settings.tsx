/* eslint-disable nextjs/no-img-element -- Local native assets must retain their measured dimensions; user-selected images are data URLs. */
'use client';
import { useState } from 'react';
import { Card, FeatureTitle, Button, useModel } from './current-ui';
import catalog from './current-catalog.json';
import legal from './current-legal.json';
import scopePackages from './current-scope.json';
export const settingTitles: Record<string, string> = {
  support: '支持',
  contributors: '贡献者',
  scope: '作用域同步',
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
}: {
  route: string;
}) {
  const m = useModel(),
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
  return <p className="c-note">此页面不可用。</p>;
}
