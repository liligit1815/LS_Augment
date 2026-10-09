'use client';

import { useEffect, useRef, useState, type ReactNode } from 'react';
import { Download, Upload, RotateCcw, ChevronRight } from 'lucide-react';
import { Card, Help, identity, useModel } from './current-ui';
import { backupSettings, downloadBackup } from './current-backup';
import { downloadLog, recordEvent } from './current-log';

type Settings = Record<string, string>;

type CurrentMaintenanceProps = {
  reset: () => void;
  restore: (settings: Settings) => void;
};

const MAX_BACKUP_BYTES = 8_000_000;
const IMPORT_FORMAT_ERROR = '请选择当前网页原型导出的配置文件';

/** Keep the existing v2 file contract and the shared backup key filters. */
function parseBackup(text: string): Settings {
  const value: unknown = JSON.parse(text);
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    throw new Error(IMPORT_FORMAT_ERROR);
  }
  const document = value as Record<string, unknown>;
  const settings = document.settings;
  if (
    document.format !== 'LS_Augment.UIPrototype' ||
    document.version !== 2 ||
    !settings ||
    typeof settings !== 'object' ||
    Array.isArray(settings) ||
    !Object.values(settings).every((entry) => typeof entry === 'string')
  ) {
    throw new Error(IMPORT_FORMAT_ERROR);
  }
  return backupSettings(settings as Settings);
}

function errorMessage(error: unknown, fallback: string): string {
  return error instanceof Error ? error.message : fallback;
}

function MaintenanceRow({
  title,
  help,
  icon,
  path,
  onClick,
  disabled = false,
  navigate = false,
}: {
  title: string;
  help: string;
  icon: ReactNode;
  path: string;
  onClick: () => void;
  disabled?: boolean;
  navigate?: boolean;
}) {
  return (
    <div className="c-maintenance-row" {...identity(path, title)}>
      <button
        type="button"
        className="c-maintenance-action"
        aria-label={title}
        disabled={disabled}
        onClick={onClick}
        {...identity(navigate ? path : 'action:' + title, title)}
      >
        <span className="c-setting-icon" aria-hidden="true">
          {icon}
        </span>
        <span className="p-maintenance-copy"><strong>{title}</strong><small>{{"导出配置":"保存设置与自定义资源","导入配置":"选择备份文件","重置配置":"恢复默认设置并清除模块信息","导出日志":"设备、权限、功能配置与运行记录"}[title]}</small></span>
      </button>
      <Help title={title} text={help} />
      {navigate && (
        <ChevronRight
          className="c-maintenance-chevron"
          size={15}
          aria-hidden="true"
        />
      )}
    </div>
  );
}

/** One merged settings card; all mutations remain within the webpage model. */
export function CurrentMaintenance({
  reset,
  restore,
}: CurrentMaintenanceProps) {
  const m = useModel();
  const file = useRef<HTMLInputElement>(null);
  const request = useRef(0);
  const [reading, setReading] = useState(false);
  const [error, setError] = useState('');

  useEffect(
    () => () => {
      request.current += 1;
    },
    [],
  );

  function exportConfig() {
    setError('');
    try {
      recordEvent('config_export');
      downloadBackup(backupSettings(m.values));
      m.tell('网页配置已导出');
    } catch (problem) {
      setError(errorMessage(problem, '导出失败'));
    }
  }

  function chooseImport() {
    setError('');
    if (file.current) {
      file.current.value = '';
      file.current.click();
    }
  }

  function confirmReset() {
    setError('');
    m.dialog(
      '重置配置？',
      <>
        <p>
          模块会停止功能，恢复有可靠记录的系统改动及隐藏应用，清除健康绑定、全部应用名单、自定义素材、测试凭据、草稿和旧日志。
          {'\n\n'}旧版本未保存的桌面布局、健康历史及云端数据无法可靠还原。恢复失败时保留所需记录；完成后需要重启手机。
          {'\n\n'}本网页仅重置原型中的演示配置。
        </p>
        <footer>
          <button type="button" onClick={m.close}>
            取消
          </button>
          <button
            type="button"
            onClick={() => {
              recordEvent('config_reset');
              reset();
              m.close();
              m.tell('原型演示：已恢复网页默认设置');
            }}
          >
            确认重置
          </button>
        </footer>
      </>,
    );
  }

  return (
    <><Card
      className="c-maintenance-card"
      label="配置与维护"
      path="SettingsActivity:maintenance"
    >
      <style>{`
        .c-maintenance-card.c-card{padding:0;overflow:hidden}
        .c-maintenance-row{position:relative;display:flex;align-items:center;min-height:68px;padding:0 12px;gap:4px}
        .c-maintenance-row+.c-maintenance-row:before{content:'';position:absolute;top:0;left:12px;right:12px;height:1px;background:#dae6f2;pointer-events:none}
        .c-maintenance-action{display:flex;align-items:center;gap:12px;min-width:0;min-height:66px;flex:1;border:0;background:transparent;text-align:left}
        .c-maintenance-action strong{font-size:12.5px;line-height:1.35}
        .c-maintenance-action:disabled{cursor:default;opacity:.55}
        .c-maintenance-action:not(:disabled):active{background:#1f74c50b}
        .c-maintenance-action>.c-setting-icon,.c-maintenance-chevron{flex:none;pointer-events:none}
        .c-maintenance-chevron{color:#64748b}
        .c-maintenance-card .c-maintenance-feedback{padding:0 12px 12px;margin:0;font-size:11.5px;line-height:1.3;white-space:pre-wrap}
      `}</style>

      <MaintenanceRow
        title="导出配置"
        help="导出功能设置、应用选择、自定义图片、字体与肩键候选。不包含账户绑定、执行日志和设备测试凭据。导入后按需重启作用域。"
        icon={<Download size={22} />}
        path="ConfigTransferActivity:export"
        onClick={exportConfig}
        disabled={reading}
      />
      <MaintenanceRow
        title="导入配置"
        help="选择当前网页原型导出的配置文件，校验后确认导入。导入将替换对应设置；账户绑定与本机兼容性测试状态保留。"
        icon={<Upload size={22} />}
        path="ConfigTransferActivity:import"
        onClick={chooseImport}
        disabled={reading}
      />
      <MaintenanceRow
        title="重置配置"
        help="恢复模块默认设置，显示模块记录中隐藏的应用，清除健康绑定、所有应用名单、导入素材与运行记录。重置前可先导出配置。"
        icon={<RotateCcw size={22} />}
        path="ConfigTransferActivity:reset"
        onClick={confirmReset}
        disabled={reading}
      />

      <input
        type="file"
        hidden
        ref={file}
        accept=".json,application/json"
        aria-label="导入配置文件"
        onChange={async (event) => {
          const input = event.currentTarget;
          const selected = input.files?.[0];
          if (!selected) return;
          const activeRequest = ++request.current;
          setReading(true);
          setError('');
          try {
            if (selected.size > MAX_BACKUP_BYTES) throw new Error('文件过大');
            const imported = parseBackup(await selected.text());
            if (activeRequest !== request.current) return;
            const count = Object.keys(imported).length;
            m.dialog(
              '导入配置',
              <>
                <p>已校验 {count} 项网页设置。导入将替换对应设置。</p>
                <footer>
                  <button type="button" onClick={m.close}>
                    取消
                  </button>
                  <button
                    type="button"
                    onClick={() => {
                      restore(imported);
                      m.close();
                      m.tell('网页配置已导入');
                    }}
                  >
                    导入
                  </button>
                </footer>
              </>,
            );
          } catch (problem) {
            if (activeRequest === request.current) {
              setError(errorMessage(problem, '导入失败'));
            }
          } finally {
            input.value = '';
            if (activeRequest === request.current) setReading(false);
          }
        }}
      />
      {reading && (
        <output className="c-maintenance-feedback c-muted">
          正在校验配置…
        </output>
      )}
      {error && (
        <p className="c-maintenance-feedback c-error" role="alert">
          {error}
        </p>
      )}
    </Card>
    <h3 className="c-group">日志</h3>
    <Card className="c-maintenance-card" label="日志">
      <MaintenanceRow title="导出日志" help="包含设备与模块版本、LSP/ROOT 状态、已开启功能、配置快照、近期操作及错误。原型导出包含手机只读信息快照和网页记录；未采集的真机日志会明确标记。" icon={<Download size={22}/>} path="log-export" onClick={()=>m.dialog('导出日志',<><p>包含设备与版本、权限状态、已开启功能、配置快照、最近操作及错误记录。</p><p className="c-note">当前为网页原型：设备信息来自只读快照，权限与操作来自所选示例；手机运行日志尚未采集。</p><footer><button onClick={m.close}>取消</button><button onClick={()=>{try{downloadLog(m.values);m.close();m.tell('日志已导出');}catch{m.tell('导出失败，请重试');}}}>导出日志文件</button></footer></>)}/>
    </Card></>
  );
}
