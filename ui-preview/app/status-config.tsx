'use client';
import {ConfigFeature} from './config-feature';
import {Slider} from '@/components/ui/slider';
import type {Status,Item} from './status-preview';
import type {Values} from './prototype-settings';
const zones=['L1','L2','LS','C1','C2','CS','R1','R2','RS'],labels=['左上','左下','左侧跨两排','中上','中下','中间跨两排','右上','右下','右侧跨两排'];
export function StatusConfig({page,state:s,set,tell,values,setValue}:{page:string,state:Status,set:(s:Status)=>void,tell:(t:string)=>void,values:Values,setValue:(k:string,v:unknown)=>void}){
 const update=(id:string,v:Partial<Item>)=>set({...s,items:{...s.items,[id]:{...s.items[id],...v}}});
 const range=(label:string,value:number,max:number,change:(n:number)=>void,min=0)=><label className="revision-range"><span>{label}<b>{value}</b></span><Slider className="android-slider" thumbAlignment="center" aria-label={label} min={min} max={max} value={[value]} onValueChange={n=>change(Array.isArray(n)?n[0]:n)}/></label>;
 const select=(label:string,value:string,options:string[],texts:string[],change:(v:string)=>void)=><label className="revision-field revision-select"><span>{label}</span><select aria-label={label} value={value} onChange={e=>change(e.target.value)}>{options.map((v,i)=><option key={v} value={v}>{texts[i]}</option>)}</select></label>;
 const names:Record<string,string>={clock:'时钟',cpu:'CPU 温度',gpu:'GPU 温度',battery_temp:'电池温度',current:'电流',power:'功率',network:'网速',notifications:'通知图标',system_icons:'系统图标',battery:'电池图标'};
 const items=page==='status-clock'?['clock']:page==='status-hardware'?['cpu','gpu','battery_temp','current','power','network']:['notifications','system_icons','battery'];
 return <div className="status-config">{page==='status-layout'?<section className="revision-card"><ConfigFeature title="状态栏增强" enabled={s.enabled} onChange={enabled=>set({...s,enabled})} tell={tell}>{['状态栏高度','左侧边距','右侧边距','顶部边距','底部边距','两排间距'].map((label,i)=><div key={label}>{range(label,s.layout[i],[80,40,40,12,12,8][i],n=>{const layout=[...s.layout];layout[i]=n;set({...s,layout})})}</div>)}</ConfigFeature></section>:items.map(id=>{const item=s.items[id],paired=id==='network'?s.mode===4:id==='notifications'?s.nr:id==='system_icons'&&s.sr;return <section className="revision-card" key={id}><ConfigFeature title={names[id]} enabled={item.on} onChange={on=>update(id,{on})} tell={tell}>
 {id==='clock'&&select('时钟显示方式',String(values['clock:rows']),['1','2'],['单排时钟','双排时钟'],v=>setValue('clock:rows',Number(v)))}
 {id==='network'&&select('网速显示方式',String(s.mode),['1','2','3','4'],['仅上传','仅下载','上传与下载单排','上传与下载双排'],v=>set({...s,mode:Number(v),items:{...s.items,network:{...item,zone:Number(v)===4?item.zone[0]+'S':item.zone}}}))}
 {['notifications','system_icons'].includes(id)&&<label className="revision-check"><input type="checkbox" checked={id==='notifications'?s.nr:s.sr} onChange={e=>set({...s,[id==='notifications'?'nr':'sr']:e.target.checked,items:{...s.items,[id]:{...item,zone:e.target.checked?item.zone[0]+'S':item.zone}}})}/>{names[id]}分两排</label>}
 {select(names[id]+'位置',paired?item.zone[0]+'S':item.zone,paired?['LS','CS','RS']:zones,paired?['左侧（上下两排）','中间（上下两排）','右侧（上下两排）']:labels,zone=>update(id,{zone}))}
 {range(names[id]+'大小',item.size,32,size=>update(id,{size}),6)}{range(names[id]+'区内顺序',item.order,20,order=>update(id,{order}))}
 {id==='notifications'&&range('通知数量（0 跟随系统）',Number(values['status-icons:0.0.0.0.4.0.5'])||0,20,n=>setValue('status-icons:0.0.0.0.4.0.5',n))}
 {id==='clock'&&<div className="revision-section"><ConfigFeature title="自定义时钟文字" enabled={s.custom} onChange={custom=>set({...s,custom})} tell={tell}>{s.formats.slice(0,Number(values['clock:rows'])).map((format,i)=><label className="revision-field" key={i}><span>第{i+1}行格式</span><input aria-label={`第${i+1}行格式`} value={format} onChange={e=>{const formats=[...s.formats];formats[i]=e.target.value;set({...s,formats})}}/></label>)}<p>例如 HH:mm 表示小时和分钟，MM.dd E 表示日期和星期。</p></ConfigFeature>{!s.custom&&['默认使用 24 小时制','默认显示秒','默认显示星期'].map((label,i)=><label className="revision-check" key={label}><input type="checkbox" checked={s.clockFlags[i]} onChange={e=>{const clockFlags=[...s.clockFlags];clockFlags[i]=e.target.checked;set({...s,clockFlags})}}/>{label}</label>)}</div>}
 </ConfigFeature></section>})}</div>;
}
