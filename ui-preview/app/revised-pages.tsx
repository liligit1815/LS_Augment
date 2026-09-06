'use client';
import {useEffect,useRef,useState,type ReactNode} from 'react';
import {ConfigFeature} from './config-feature';
import {ExtraPage,extraTitles} from './extra-pages';
import {Slider} from '@/components/ui/slider';
import {planTimes,type Values} from './prototype-settings';
export const revisedTitles:Record<string,string>={...extraTitles,health:'步数修改',ai_trigger:'AI 触发器','ai_trigger-expanded':'AI 触发器',signature_install:'签名不一致安装',beautify:'主题无限期试用',super_resolution:'超分破坏神',diablo_coexist:'超分破坏神',store_download:'应用商店下载',config_transfer:'配置导入导出'};
type Props={go:(p:string)=>void,page:string,values:Values,onChange:(k:string,v:unknown)=>void,onBack:()=>void,onRestart:()=>void,onExport:()=>void,onImport:(text:string)=>void,backAsset:string,tell:(s:string)=>void};
function PlanField({value,label,type,max,onChange}:{value:unknown,label:string,type:string,max:number,onChange:(v:unknown)=>void}){
 const [draft,setDraft]=useState(String(value));useEffect(()=>setDraft(String(value)),[value]);
 return <label className="revision-field"><span>{label}</span><input aria-label={label} type={type} min={1} max={max} value={draft} onBlur={()=>setDraft(String(value))} onChange={e=>{const s=e.target.value;setDraft(s);if(type==='time'){if(s)onChange(s)}else{const n=Number(s);if(s&&Number.isInteger(n)&&n>=1&&n<=max)onChange(n)}}}/></label>;
}
export function RevisedPage({page,values:v,onChange:set,onBack,onRestart,onExport,onImport,backAsset,tell,go}:Props){
 const file=useRef<HTMLInputElement>(null),[error,setError]=useState('');
 const toggle=(key:string,title:string,description:string,children?:ReactNode)=><ConfigFeature title={title} description={description} enabled={!!v[key]} onChange={b=>set(key,b)} tell={tell}>{children}</ConfigFeature>;
 const range=(key:string,title:string,min:number,max:number,suffix=' ms')=><label className="revision-range"><span>{title}<b>{String(v[key])}{suffix}</b></span><Slider className="android-slider" thumbAlignment="center" aria-label={title} min={min} max={max} step={1} value={[Number(v[key])]} onValueChange={n=>set(key,Array.isArray(n)?n[0]:n)}/></label>;
 const card=(children:ReactNode,label?:string)=><section className="revision-card" aria-label={label}>{children}</section>;
 const field=(key:string,label:string,type='number',max=100000)=><PlanField key={key} value={v[key]} label={label} type={type} max={max} onChange={value=>set(key,value)}/>;
 const days=v['health:days'] as number[],times=planTimes(String(v['health:start']),String(v['health:end']),Number(v['health:count']),Number(v['health:seed']));
 let body:ReactNode;
 if(page==='health')body=<>
  {card(<><p className="revision-account">已绑定本机账户 · 1f7634d1</p><div className="revision-buttons"><button onClick={()=>tell('原型演示：打开小米运动健康')}>打开小米运动健康</button><button onClick={()=>tell('原型演示：已绑定当前账户')}>绑定当前已登录账户</button></div></>)}
  {card(toggle('health:enabled','真实步数加倍','仅对真实新增步数加倍，与随机增加步数独立开关。',<>{range('health:multiplier','加倍倍数',1,10,' 倍')}<p>1 倍为原始步数；随机增加的步数单独计算。</p></>))}
  {card(toggle('health:plan','随机增加步数','在指定时间段内随机执行，每次增加设定步数。',<>
   <div className="revision-section"><h3>第一步 · 设定计划</h3><div className="revision-fields">{field('health:start','开始时间','time')}{field('health:end','结束时间','time')}{field('health:count','随机执行次数','number',1000)}{field('health:steps','每次增加步数')}</div><p className="revision-summary">每个执行日随机增加 {String(v['health:count'])} 次 × {String(v['health:steps'])} 步，共 {Number(v['health:count'])*Number(v['health:steps'])} 步。</p></div>
   <div className="revision-section"><h3>第二步 · 设定执行频次</h3><p>选择每周执行的日期，可多选。</p><div className="revision-weekdays">{['周一','周二','周三','周四','周五','周六','周日'].map((s,i)=><button key={s} aria-pressed={days.includes(i+1)} onClick={()=>set('health:days',days.includes(i+1)?days.filter(d=>d!==i+1):[...days,i+1].sort())}>{s}</button>)}</div><p className="revision-summary">{days.length?`每周${days.map(d=>['一','二','三','四','五','六','日'][d-1]).join('、')}执行，默认在后台运行。`:'未选择执行日期，计划暂停。'}</p></div>
   <details className="revision-plan-preview"><summary>查看随机时间示例</summary><ul>{times.slice(0,6).map((t,i)=><li key={i}>{t}<span>+{String(v['health:steps'])} 步</span></li>)}</ul>{times.length>6&&<p>共 {times.length} 次，此处显示前 6 次。</p>}<button onClick={()=>set('health:seed',(Number(v['health:seed'])+7919)>>>0)}>换一组时间示例</button></details>
  </>),'随机增加步数计划')}
 </>;
 else if(page.startsWith('ai_trigger'))body=card(toggle('feature:ai','AI 触发器极速响应','调整模板扫描、点击队列与 YOLO 的等待间隔，保留原有识别阈值。',<>{range('ai:scan','模板扫描间隔',80,2000)}{range('ai:click','点击队列间隔',10,500)}{range('ai:cooldown','策略冷却',50,2000)}{range('ai:yolo','YOLO 扫描间隔',150,1500)}<p>推荐值：180 / 25 / 180 / 400 ms。</p></>),'AI 触发器配置');
 else if(page==='signature_install')body=card(toggle('feature:signature','允许安装签名不一致的应用','允许不同签名的 APK 覆盖同包名应用并保留数据。仅处理同包名更新，不放行共享 UID 或其他签名权限。'));
 else if(page==='beautify')body=card(toggle('feature:beautify','主题无限期试用','延长已确认试用资源的使用时间，保持原有主题下载、安装与付费流程。'));
 else if(page==='super_resolution'||page==='diablo_coexist')body=card(<>{toggle('feature:super','性能模式超分','允许其他性能模式使用红魔原生超分辨率。')}<div className="revision-section">{toggle('feature:diablo','超分与破坏神共存','允许同时启用超分和破坏神，避免两项能力互相关闭。')}</div></>,'超分破坏神');
 else if(page==='store_download')body=card(toggle('feature:store','解除同时下载数量限制','按设定数量允许应用商店同时下载应用。',range('store:count','允许同时下载数量',1,50,' 个')));
 else if(extraTitles[page])body=<ExtraPage go={go} page={page} values={v} set={set} tell={tell}/>;
 else body=<>
  {card(<><h2>配置导入导出</h2><p>用 JSON 文件记录当前设置，方便统一多台设备的配置，或在更换设备后恢复。</p><div className="revision-buttons"><button onClick={onExport}>导出当前配置</button><button onClick={()=>file.current?.click()}>导入配置文件</button></div><input ref={file} type="file" accept=".json,application/json" aria-label="选择配置 JSON 文件" hidden onChange={async e=>{const input=e.currentTarget,f=input.files?.[0];if(!f)return;try{if(f.size>2_000_000)throw Error('文件过大，请选择配置 JSON 文件。');onImport(await f.text());setError('')}catch(err){setError(err instanceof Error?err.message:'导入失败')}finally{input.value=''}}}/>{error&&<p role="alert" className="revision-error">{error}</p>}</>)}
  {card(<><h3>包含哪些设置</h3><p>功能开关、状态栏布局、硬件与网速显示、步数计划及每周执行频次等当前配置。</p><p>不包含账户绑定、运行日志、已执行步数记录。</p></>)}
  <p className="revision-note">当前为网页原型配置，可在原型间导入恢复。手机模块的配置文件格式将在功能落地时同步。</p>
 </>;
 const hasRestart=page!=='health'&&page!=='config_transfer';
 return <div className={'revision-page'+(hasRestart?' revision-feature-page':'')}><header className="revision-header"><button aria-label="返回上一页" onClick={onBack}><img src={backAsset} alt=""/></button><h1>{revisedTitles[page]}</h1>{hasRestart&&<button className="revision-restart" onClick={onRestart}>重启作用域</button>}</header><div className="revision-scroll">{body}</div></div>;
}

