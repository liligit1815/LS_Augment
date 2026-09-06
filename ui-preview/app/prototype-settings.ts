import type {Status} from './status-preview';
export type Values=Record<string,unknown>;
export const customDefaults:Values={
 'feature:signature':true,'feature:beautify':true,'feature:ai':true,'feature:super':true,'feature:diablo':true,'feature:store':false,
 'health:enabled':true,'health:background':true,'health:multiplier':1,'health:plan':true,
 'health:start':'09:00','health:end':'18:00','health:count':10,'health:steps':200,'health:days':[1,2,3,4,5], 'health:seed':90419,
 'tile:picture':'','launcher:space':0,'launcher:selected':-1,...Object.fromEntries([0,999].flatMap(space=>[0,1,2,3,4,5].flatMap(i=>[[`launcher:${space}:${i}:name`,''],[`launcher:${space}:${i}:picture`,'']]))),
 'tile:added':false,...Object.fromEntries([0,1].flatMap(space=>[0,1,2,3,4,5].map(i=>[`hide:state:${space}:${i}`,false]))),...Object.fromEntries([0,1].flatMap(space=>[3,4,5].map(i=>[`hide:app:${space}:${i}`,false]))),
 'hide:space':0,...Object.fromEntries([0,1].flatMap(space=>[0,1,2].map(i=>[`hide:app:${space}:${i}`,true]))),
 'clock:rows':2,'store:count':5,'shoulder:rate':20,'combo:rate':5,'fan:rpm':20500,'audio:step':5,
 ...Object.fromEntries([0,1,2].flatMap(i=>[0,1,2].map(j=>[`audio:${i}:${j}`,100]))),
 'freeform:gallery':false,'freeform:browser':false,'freeform:settings':false,
 'ai:scan':180,'ai:click':25,'ai:cooldown':180,'ai:yolo':400,
};
export const featureKeys:Record<string,string>={
 '允许安装签名不一致的应用':'feature:signature','主题无限期试用':'feature:beautify','无限期试用':'feature:beautify',
 'AI 触发器极速':'feature:ai','AI 触发器极速响应':'feature:ai','启用极速触发':'feature:ai',
 '超分破坏神':'feature:super','性能模式超分':'feature:super','允许其他性能模式开启超分辨率':'feature:super',
 '超分与破坏神共存':'feature:diablo','允许超分与破坏神共存':'feature:diablo','应用商店同时下载限制解除':'feature:store',
 '小窗增强':'feature:freeform','启用小窗增强':'feature:freeform','音量增强':'feature:audio','启用音量增强':'feature:audio','超过 100% 的音量':'feature:audio',
 '肩键全应用':'feature:shoulder','全应用肩键':'feature:shoulder','启用全应用肩键':'feature:shoulder','风扇固定转速':'feature:fan','启用固定转速':'feature:fan',
 '风扇固定转速与满速解禁':'feature:fan',
 '一键连招速度':'feature:combo','启用自定义连招速度':'feature:combo','扩展应用双开':'feature:double','扩展第三方 App 双开候选':'feature:double',
};
export type Snapshot={format:'LS_Augment.UIPrototype',version:1,exportedAt:string,status:Status,settings:Values};
export function serializeSettings(status:Status,settings:Values):Snapshot{return {format:'LS_Augment.UIPrototype',version:1,exportedAt:new Date().toISOString(),status,settings}}
function sameShape(value:unknown,model:unknown):boolean{
 if(typeof model==='number')return typeof value==='number'&&Number.isFinite(value)&&Math.abs(value)<1e7;
 if(Array.isArray(model))return Array.isArray(value)&&value.length===model.length&&value.every((v,i)=>sameShape(v,model[i]));
 if(model&&typeof model==='object')return !!value&&typeof value==='object'&&!Array.isArray(value)&&Object.keys(value).length===Object.keys(model).length&&Object.entries(model).every(([k,v])=>sameShape((value as Values)[k],v));
 return typeof value===typeof model&&(typeof value!=='string'||value.length<10000);
}
export function parseSettings(text:string,statusModel:Status,valueModel:Values,aliases:Record<string,string>={}):Snapshot{
 if(text.length>2_000_000)throw Error('文件过大，请选择配置 JSON 文件。');
 let data:Snapshot;try{data=JSON.parse(text)}catch{throw Error('无法读取，请选择有效的 JSON 文件。')}
 if(data?.format!=='LS_Augment.UIPrototype'||data.version!==1)throw Error('文件格式或版本不兼容，请选择本原型导出的配置。');
 if(!sameShape(data.status,statusModel)||!data.settings||typeof data.settings!=='object'||Array.isArray(data.settings))throw Error('配置结构不完整，未导入任何设置。');
 const settings={...valueModel};for(const [key,v] of Object.entries(data.settings)){
  if(!Object.hasOwn(valueModel,key))throw Error('配置包含无法识别的设置项。');
  if(key==='health:days'){if(!Array.isArray(v)||v.length>7||v.some(d=>!Number.isInteger(d)||d<1||d>7)||new Set(v).size!==v.length)throw Error('执行星期配置无效。')}
  else if(key==='tile:picture'||/^launcher:(0|999):[0-5]:picture$/.test(key)){if(typeof v!=='string'||v.length>100000||(v!==''&&!/^data:image\/png;base64,[A-Za-z0-9+/]+={0,2}$/.test(v)))throw Error('图片配置无效。')}
  else if(!sameShape(v,valueModel[key]))throw Error('设置值格式有误：'+key);
  settings[key]=v;
 }
 if(!/^([01]\d|2[0-3]):[0-5]\d$/.test(String(settings['health:start']))||!/^([01]\d|2[0-3]):[0-5]\d$/.test(String(settings['health:end'])))throw Error('计划时间无效。');
 for(const k of ['health:count','health:steps'])if(!Number.isInteger(settings[k])||Number(settings[k])<1||Number(settings[k])>(k.endsWith('count')?1000:100000))throw Error('计划次数或步数超出范围。');
 for(const [key,min,max] of [['clock:rows',1,2],['store:count',1,50],['shoulder:rate',10,50],['combo:rate',1,10],['fan:rpm',4680,20680],['audio:step',1,20],...([0,1,2].flatMap(i=>[0,1,2].map(j=>[`audio:${i}:${j}`,100,300] as const))),['health:multiplier',1,10],['ai:scan',80,2000],['ai:click',10,500],['ai:cooldown',50,2000],['ai:yolo',150,1500]] as const)if(!Number.isInteger(settings[key])||Number(settings[key])<min||Number(settings[key])>max)throw Error('配置数值超出范围：'+key);
 if(![0,999].includes(Number(settings['launcher:space']))||!Number.isInteger(settings['launcher:selected'])||Number(settings['launcher:selected'])< -1||Number(settings['launcher:selected'])>5)throw Error('应用图标配置无效。');
 const s=data.status;if(!Number.isInteger(s.mode)||s.mode<1||s.mode>4||s.layout.some(v=>v<0||v>200))throw Error('状态栏配置超出范围。');
 for(const item of Object.values(s.items))if(!['L1','L2','LS','C1','C2','CS','R1','R2','RS'].includes(item.zone)||item.size<6||item.size>100||item.order<0||item.order>1000)throw Error('状态栏位置或大小无效。');
 for(const [oldKey,key] of Object.entries(aliases))if(Object.hasOwn(data.settings,oldKey)&&!Object.hasOwn(data.settings,key))settings[key]=data.settings[oldKey];
 const migrate=(key:string,old:string,base:number,step=1)=>{if(!Object.hasOwn(data.settings,key)&&typeof data.settings[old]==='number')settings[key]=base+Number(data.settings[old])*step};
 migrate('audio:step','audio_gain:0.0.0.0.2.0.2.4',1);
 for(let i=0;i<3;i++)for(let j=0;j<3;j++)migrate(`audio:${i}:${j}`,`audio_gain:0.0.0.0.2.0.${i+3}.${j*2+2}`,100,5);
 migrate('fan:rpm','fan_control:0.0.0.0.2.0.4.2',4680);
 migrate('combo:rate','combo_speed:0.0.0.0.2.0.3.1.1.1',1);
 settings['health:background']=true;
 return {...data,settings};
}
export function planTimes(start:string,end:string,count:number,seed:number){
 const minutes=(s:string)=>Number(s.slice(0,2))*60+Number(s.slice(3));const from=minutes(start),to=minutes(end)+(minutes(end)<=from?1440:0);
 let x=seed>>>0;const random=()=>{x=(Math.imul(x,1664525)+1013904223)>>>0;return x/4294967296};
 return Array.from({length:Math.min(1000,Math.max(0,count))},(_,i)=>{const t=Math.floor((from+(i+random())*(to-from)/count)*60),day=t>=86400?'次日 ':'';return day+[Math.floor(t/3600)%24,Math.floor(t/60)%60,t%60].map(v=>String(v).padStart(2,'0')).join(':')});
}
