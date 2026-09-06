'use client';
import {useEffect,useRef,useState,type CSSProperties} from 'react';
import {Switch} from '@/components/ui/switch';
import {Slider} from '@/components/ui/slider';
import {Select,SelectContent,SelectItem,SelectTrigger} from '@/components/ui/select';
import {Checkbox} from '@/components/ui/checkbox';
import {Bluetooth,Wifi,BatteryMedium,VolumeX,Zap} from 'lucide-react';
import data from './native-pages.json';
import {color,walk,type NativeNode,type Background} from './native-types';
import {layoutOverrides,annotatedPages} from './layout-overrides';
import {LauncherEditor} from './launcher-editor';
import {StatusPage} from './status-page';
import {StatusConfig} from './status-config';
import {StatusPreview,type Status} from './status-preview';
import {RevisedPage,revisedTitles} from './revised-pages';
import {customDefaults,featureKeys,parseSettings,serializeSettings,type Values} from './prototype-settings';
const pages=annotatedPages(data as unknown as Record<string,NativeNode>);
const names:Record<string,string>={'时钟':'clock','通知图标':'notifications','系统图标':'system_icons','电池图标':'battery','CPU 温度':'cpu','GPU 温度':'gpu','电池温度':'battery_temp','电流':'current','功率':'power','网速':'network'};
const zones=['L1','L2','LS','C1','C2','CS','R1','R2','RS'],zoneLabels=['左上','左下','左侧跨两排','中上','中下','中间跨两排','右上','右下','右侧跨两排'],pairLabels=['左侧（上下两排）','中间（上下两排）','右侧（上下两排）'];
const tabs:Record<string,string>={'布局':'status-layout','时钟':'status-clock','硬件 / 网速':'status-hardware','图标':'status-icons'};
const destinations:Record<string,string>={'肩键全应用':'shoulder','AI 触发器极速':'ai_trigger','风扇固定转速':'fan_control','一键连招速度':'combo_speed','性能模式超分':'super_resolution','超分与破坏神共存':'diablo_coexist','小窗增强':'freeform','音量增强':'audio_gain','电池与循环次数':'battery','状态栏':'status-layout','小米运动健康':'health','应用图标与名称':'launcher','允许安装签名不一致的应用':'signature_install','扩展应用双开':'double_app','主题无限期试用':'beautify','桌面图标':'launcher_icon','详细诊断':'detailed_diagnostics','诊断与恢复':'diagnostics'};
const parentPage:Record<string,string>={...Object.fromEntries(['shoulder','ai_trigger','fan_control','combo_speed','super_resolution','diablo_coexist'].map(k=>[k,'game'])),...Object.fromEntries(['freeform','audio_gain','battery'].map(k=>[k,'system'])),...Object.fromEntries(['signature_install','double_app','beautify','health','launcher'].map(k=>[k,'apps'])),...Object.fromEntries(['launcher_icon','detailed_diagnostics','diagnostics'].map(k=>[k,'tools']))};
const mainDest:Record<string,string>={'应用增强':'apps','游戏增强':'game','工具':'tools','状态栏':'system','系统增强':'system','消失吧APP':'hide-menu'};
Object.assign(destinations,{'步数修改':'health','APP图标名称编辑':'launcher','超分破坏神':'super_resolution','应用商店同时下载限制解除':'store_download','配置导入导出':'config_transfer','运行诊断':'diagnostics'});
Object.assign(parentPage,{hide:'hide-menu','hide-auto':'hide-menu','hide-tile':'hide-menu',store_download:'apps',config_transfer:'home-unlocked',launcher_icon:'home-unlocked',detailed_diagnostics:'home-unlocked',diagnostics:'home-unlocked'});
function controlKey(page:string,n:NativeNode,parent?:NativeNode){
 if(n.class.endsWith('Switch')){const label=(n.text||n.description||walk(parent||n).find(x=>x.text)?.text||'').replace(/已开启$|已关闭$/,'');if(featureKeys[label])return featureKeys[label];}
 return page.replace('-expanded','')+':'+n.path;
}
const defaultValues:Values={...customDefaults};const controlAliases:Record<string,string>={};
for(const [page,root] of Object.entries(pages))for(const n of walk(root)){
 const parent=walk(root).find(p=>p.children?.includes(n));const key=controlKey(page,n,parent);
 if(n.class.endsWith('Switch')||n.class.endsWith('CheckBox'))defaultValues[key]=n.isChecked||false;
 if(n.class.endsWith('SeekBar'))defaultValues[key]=n.Progress||0;
 if(n.class.endsWith('Spinner'))defaultValues[key]=n.selected||0;
 if(n.class.endsWith('EditText'))defaultValues[key]=n.text||'';
 const oldKey=page.replace('-expanded','')+':'+n.path;if(key!==oldKey){defaultValues[oldKey]=defaultValues[key];controlAliases[oldKey]=key}
}
Object.assign(defaultValues,customDefaults);
type Binding={kind:string,id?:string,index?:number};const bindings:Record<string,Binding>={};
const initial:Status={enabled:true,items:{},mode:4,nr:true,sr:true,layout:[0,0,0,0,0,0],custom:true,formats:['HH:mmIIE','MM.ddN月e'],clockFlags:[true,false,true]};
for(const page of Object.values(tabs)){
 const root=pages[page];if(!root)continue;const all=walk(root);
 for(const card of all){const children=card.children||[],id=names[children[0]?.text||''];if(!id||!children[0].class.endsWith('Switch'))continue;
 const spinners=children.filter(c=>c.class.endsWith('Spinner')),sliders=children.filter(c=>c.class.endsWith('SeekBar')),zone=spinners[spinners.length-1];
 initial.items[id]={on:!!children[0].isChecked,size:(sliders[0]?.Progress||0)+6,order:sliders[1]?.Progress||0,zone:zone?.options?.length===3?'LCR'[zone.selected||0]+'S':zones[zone?.selected||0]};
 children.forEach((n,i)=>{let b:Binding|undefined;if(i===0)b={kind:'item-on',id};else if(n.text==='通知图标分两排')b={kind:'nr'};else if(n.text==='系统图标分两排')b={kind:'sr'};else if(n.class.endsWith('Spinner'))b={kind:n===zone?'zone':'mode',id};else if(n.class.endsWith('SeekBar'))b={kind:sliders.indexOf(n)===0?'size':'order',id};else if(n.text?.startsWith('大小 ·'))b={kind:'size-label',id};else if(n.text?.startsWith('区内顺序 ·'))b={kind:'order-label',id};if(b){bindings[page+':'+n.path]=b;if(b.kind==='nr')initial.nr=!!n.isChecked;if(b.kind==='sr')initial.sr=!!n.isChecked;if(b.kind==='mode')initial.mode=(n.selected||0)+1}});
 }
 if(page==='status-layout'){let index=0;for(const n of all){if(n.text==='启用状态栏增强'){bindings[page+':'+n.path]={kind:'master'};initial.enabled=!!n.isChecked}if(n.class.endsWith('SeekBar')){initial.layout[index]=n.Progress||0;bindings[page+':'+n.path]={kind:'layout',index:index++}}else if(n.text?.includes(' · '))bindings[page+':'+n.path]={kind:'layout-label',index:index}}}
 if(page==='status-clock'){let index=0;for(const n of all){if(n.class.endsWith('EditText')){bindings[page+':'+n.path]={kind:'format',index};initial.formats[index++]=n.text||''}if(n.text==='自定义时钟文字'){bindings[page+':'+n.path]={kind:'custom'};initial.custom=!!n.isChecked}const flag=['默认使用 24 小时制','默认显示秒','默认显示星期'].indexOf(n.text||'');if(flag>=0){bindings[page+':'+n.path]={kind:'clockFlag',index:flag};initial.clockFlags[flag]=!!n.isChecked}}}
}
const fresh=()=>structuredClone(initial);
const flattenBackground=(b:Background):Background=>b.layers?.length?flattenBackground(b.layers[0]):b;
function background(b:Background):CSSProperties{b=flattenBackground(b);return {background:b.gradient?`linear-gradient(155.659deg,${(b.gradient.every(v=>v===0)?['#e1f1ff','#f5faff','#f8fcff']:b.gradient.map(color)).join(',')})`:color(b.color),borderRadius:b.mRadius||0,boxShadow:b.mStrokeWidth&&b.mStrokeWidth>0?`inset 0 0 0 ${b.mStrokeWidth}px ${color(b.stroke)}`:undefined};}
const labelOf=(n:NativeNode)=>n.description||walk(n).find(x=>x.text)?.text||'';
function NativeText({node,text=node.text||'',dynamic=false}:{node:NativeNode,text?:string,dynamic?:boolean}){
 const size=node.getTextSize||39,lines=node.lines||[[0,text.length,0,0]],first=lines[0]?.[2]||0,baseline=node.getBaseline??size*.91;
 const style:CSSProperties={fontFamily:'Device',fontSize:size,fontWeight:node.fontStyle===1?700:400,color:color(node.getCurrentTextColor??0xff14233a),letterSpacing:(node.getLetterSpacing||0)*size,lineHeight:1};
 if(!node.lines){const gravity=(node.getGravity||0)&7;return <span className="native-text" style={{...style,left:node.PaddingLeft,top:baseline-size*.848876953,width:node.bounds[2]-node.bounds[0]-node.PaddingLeft-node.PaddingRight,whiteSpace:'pre-wrap',lineHeight:1.15,textAlign:gravity===1?'center':gravity===5?'right':'left'}}>{text}</span>}
 if(dynamic){const gravity=(node.getGravity||0)&7;return <span className="native-text" style={{...style,left:node.PaddingLeft,top:baseline-size*.848876953,width:node.bounds[2]-node.bounds[0]-node.PaddingLeft-node.PaddingRight,textAlign:gravity===1?'center':gravity===5?'right':'left'}}>{text}</span>}
 return <>{lines.map((l,i)=><span className="native-text" key={i} style={{...style,left:node.PaddingLeft+l[3],top:baseline+l[2]-first-size*.848876953}}>{text.slice(l[0],l[1]).replace(/\n$/,'')}</span>)}</>;
}
export default function NativePrototype(){
 const [page,setPage]=useState('home-unlocked'),[status,setStatus]=useState(fresh),[values,setValues]=useState<Values>(()=>structuredClone(defaultValues)),[dirty,setDirty]=useState<Record<string,boolean>>({}),[toast,setToast]=useState(''),[restart,setRestart]=useState(false),[scope,setScope]=useState(5),[scale,setScale]=useState(.3),[ready,setReady]=useState(false),[saveError,setSaveError]=useState(false);
 const savedStatus=useRef(fresh()),versionTaps=useRef(0),timer=useRef<ReturnType<typeof setTimeout>|null>(null);
 useEffect(()=>{const resize=()=>setScale(Math.max(.12,Math.min(Math.min(500,window.innerWidth-24)/1216,(window.innerHeight-58)/2688)));resize();window.addEventListener('resize',resize);return()=>window.removeEventListener('resize',resize)},[]);
 useEffect(()=>{const h=window.location.hash.slice(1);if(pages[h]||revisedTitles[h])setPage(h);const back=()=>{setToast('');const p=window.location.hash.slice(1);setPage(pages[p]||revisedTitles[p]?p:'home-unlocked')};window.addEventListener('hashchange',back);return()=>window.removeEventListener('hashchange',back)},[]);
 useEffect(()=>{try{const text=localStorage.getItem('ls-augment-prototype-v2');if(text){const loaded=parseSettings(text,fresh(),defaultValues,controlAliases);setStatus(loaded.status);setValues(loaded.settings)}}catch{setToast('未能恢复上次网页配置，已使用默认配置。')}setReady(true)},[]);
 useEffect(()=>{if(!ready)return;try{localStorage.setItem('ls-augment-prototype-v2',JSON.stringify(serializeSettings(status,values)));setSaveError(false)}catch{setSaveError(true)}},[status,values,ready]);
 const go=(p:string)=>{if(!pages[p]&&!revisedTitles[p])return;if(p===page)document.querySelectorAll('.native-scroll').forEach(n=>{n.scrollTop=0;n.scrollLeft=0});setPage(p);window.history.pushState(null,'','#'+p);setToast('')};
 const tell=(s:string)=>{setToast(s);if(timer.current)clearTimeout(timer.current);timer.current=setTimeout(()=>setToast(''),2500)};
 const change=(n:NativeNode,value:unknown)=>{if(page==='system'&&n.class.endsWith('Switch')&&n.description.startsWith('状态栏')){setStatus(s=>({...s,enabled:!!value}));return}const key=page+':'+n.path,b=bindings[key],parent=walk(pages[page]).find(p=>p.children?.includes(n));setDirty(d=>({...d,[page]:true}));if(!b)setValues(o=>({...o,[controlKey(page,n,parent)]:value}));if(!b)return;setStatus(old=>{const s=structuredClone(old);if(b.id){const item=s.items[b.id];if(b.kind==='item-on')item.on=!!value;if(b.kind==='size')item.size=Number(value)+6;if(b.kind==='order')item.order=Number(value);if(b.kind==='zone')item.zone=String(value)}if(b.kind==='mode')s.mode=Number(value);if(b.kind==='nr')s.nr=!!value;if(b.kind==='sr')s.sr=!!value;if(b.kind==='layout')s.layout[b.index!]=Number(value);if(b.kind==='format')s.formats[b.index!]=String(value);if(b.kind==='custom')s.custom=!!value;if(b.kind==='master')s.enabled=!!value;if(b.kind==='clockFlag')s.clockFlags[b.index!]=!!value;return s})};
 const action=(n:NativeNode)=>{const t=labelOf(n),text=n.text||'';
 if((page==='home'||page==='home-unlocked')&&['桌面图标','详细诊断','诊断与恢复','配置导入导出','运行诊断'].some(k=>walk(n).some(x=>x.text===k))){const name=walk(n).find(x=>['桌面图标','详细诊断','诊断与恢复','配置导入导出','运行诊断'].includes(x.text||''))!.text!;go(destinations[name]);return}
 if(n.class.endsWith('ImageButton')||t.includes('返回')){go(page.startsWith('status-')?'system':parentPage[page.replace('-expanded','')]||'home-unlocked');return}
 if((text==='展开'||t==='极速连点')&&pages[page+'-expanded']){go(page+'-expanded');return}if((text==='收起'||t==='极速连点')&&page.endsWith('-expanded')){go(page.replace('-expanded',''));return}if(text==='重启作用域'){setRestart(true);return}
 if(page==='home'||page==='home-unlocked'){if(t.includes('版本图标')){if(++versionTaps.current>=7){go('home-unlocked');tell('完整功能已开放')};return}const found=Object.entries(mainDest).find(([label])=>t==='进入'+label||t===label);if(found){go(found[1]);return}}
 if(['apps','game','system','tools'].includes(page)){const texts=walk(n).map(c=>c.text).filter(Boolean);const found=texts.find(t=>t&&destinations[t])||Object.keys(destinations).find(k=>t==='打开'+k+'详情');if(found){go(destinations[found]);return}}
 if(page.startsWith('status-')){
 if(tabs[text]&&n.class.endsWith('Button')){go(tabs[text]);return}
 if(text==='恢复默认'){setValues(v=>Object.fromEntries(Object.entries(v).filter(([k])=>!k.startsWith('status-'))));setStatus({...fresh(),enabled:false,items:Object.fromEntries(['clock','notifications','system_icons','battery','cpu','gpu','battery_temp','current','power','network'].map((id,i)=>[id,{zone:['LS','LS','RS','RS','L2','L2','C2','R2','R2','CS'][i],order:i,size:i<4?13:9,on:i<4}])),mode:4,nr:true,sr:true,custom:false,formats:['',''],clockFlags:[false,false,false]});tell('已恢复默认');return}
 if(text==='应用'){savedStatus.current=structuredClone(status);tell('配置已保存');return}
 if(['单行','双行','秒'].includes(text)){setStatus(s=>({...s,custom:true,formats:text==='单行'?['HH:mm','']:text==='双行'?['HH:mm','MM/dd E']:['HH:mm:ss','MM/dd'],items:{...s.items,clock:{...s.items.clock,on:true,zone:text==='单行'?s.items.clock.zone:s.items.clock.zone[0]+'S'}}}));return}
 }
 if(page.startsWith('hide')){if(text==='应用管理')go('hide');if(text==='自动隐藏')go('hide-auto');if(text==='快捷磁贴')go('hide-tile')}
 if(text.startsWith('小窗例外应用')){tell('加入名单的应用保持系统原有小窗规则，不使用全应用小窗放行。');return}
 if(text.includes('保存')||text.includes('应用')){setDirty(d=>({...d,[page]:false}));tell('网页配置已自动保存')}else if(text)tell('原型中的操作已响应');
 };
 function render(original:NativeNode,parent?:NativeNode){
 const n={...original,...layoutOverrides[page]?.[original.path]};const key=page+':'+n.path,b=bindings[key],valueKey=controlKey(page,original,parent),has=Object.prototype.hasOwnProperty.call(values,valueKey),value=values[valueKey];let dynamic=false;
 if(b){const item=b.id?status.items[b.id]:undefined;
 if(b.kind==='item-on')n.isChecked=item!.on;if(b.kind==='nr')n.isChecked=status.nr;if(b.kind==='sr')n.isChecked=status.sr;
 if(b.kind==='master')n.isChecked=status.enabled;if(b.kind==='custom')n.isChecked=status.custom;if(b.kind==='clockFlag')n.isChecked=status.clockFlags[b.index!];
 if(b.kind==='format'){n.text=status.formats[b.index!];dynamic=n.text!==original.text}
 if(b.kind==='size')n.Progress=item!.size-6;if(b.kind==='order')n.Progress=item!.order;
 if(b.kind.endsWith('-label')){let v:number;if(b.kind==='layout-label')v=status.layout[b.index!];else v=b.kind==='size-label'?item!.size:item!.order;n.text=n.text?.replace(/ · .*$/,' · '+v);dynamic=n.text!==original.text}
 if(b.kind==='layout')n.Progress=status.layout[b.index!];if(b.kind==='mode')n.selected=status.mode-1;
 if(b.kind==='zone'){const paired=b.id==='network'?status.mode===4:b.id==='notifications'?status.nr:b.id==='system_icons'&&status.sr;n.options=paired?pairLabels:zoneLabels;n.selected=paired?'LCR'.indexOf(item!.zone[0]):zones.indexOf(item!.zone)}
 }else if(has){if(n.class.endsWith('Switch')||n.class.endsWith('CheckBox'))n.isChecked=!!value;else if(n.class.endsWith('SeekBar'))n.Progress=Number(value);else if(n.class.endsWith('Spinner'))n.selected=Number(value);else if(n.class.endsWith('EditText')){n.text=String(value);dynamic=true}}
 if(n.class.endsWith('TextView')&&parent&&!b){const siblings=parent.children||[],i=siblings.indexOf(original),next=siblings[i+1];const v=next?values[controlKey(page,next,parent)]:undefined;if(next?.class.endsWith('SeekBar')&&v!==undefined&&n.text?.match(/\d/)){const raw=Number(n.text.match(/\d+(?=\D*$)/)?.[0]||0);n.text=n.text.replace(/\d+(?=\D*$)/,String(raw+Number(v)-(next.Progress||0)));dynamic=n.text!==original.text}}
 if(page==='system'&&n.class.endsWith('Switch')&&n.description.startsWith('状态栏'))n.isChecked=status.enabled;
 if(n.text==='保存修改'&&dirty[page]){n.background={color:0xff3791f4,mRadius:39};n.getCurrentTextColor=0xffffffff}const [x,y,r,bottom]=n.bounds,w=r-x,h=bottom-y,cls=n.class.split('.').pop()!,scroll=cls==='ScrollView'||cls==='HorizontalScrollView';
 const style:CSSProperties={position:'absolute',left:x,top:y,width:w,height:h,...background(n.background)};
 const attr={'data-native-path':n.path,'data-native-class':cls,'data-ui-label':labelOf(n)};
 if(w<=0||h<=0)return null;
 if(cls==='Switch'&&['home','home-unlocked','apps','system','game','tools'].includes(page))return null;
 if(cls==='ScrollView'&&page.startsWith('status-'))return <div key={n.path} className="native-scroll" style={{...style,overflowY:'auto'}}><StatusConfig page={page} state={status} set={setStatus} tell={tell} values={values} setValue={(k,v)=>setValues(old=>({...old,[k]:v}))}/></div>;
 if(cls.includes('Preview'))return <div key={n.path} {...attr} style={style}><StatusPreview notificationCount={Number(values['status-icons:0.0.0.0.4.0.5'])||0} clockRows={Number(values['clock:rows'])} state={status} width={w} height={h}/></div>;
 if(cls==='Spinner'){
 const options=n.options||n.children?.map(c=>c.text||'')||[],selected=Math.max(0,n.selected||0),textNode=n.children?.[0];
 return <div key={n.path} {...attr} style={style}><Select value={String(selected)} onValueChange={v=>{const i=Number(v);change(original,b?.kind==='zone'?(options.length===3?'LCR'[i]+'S':zones[i]):b?.kind==='mode'?i+1:i)}} items={Object.fromEntries(options.map((t,i)=>[i,t]))}><SelectTrigger className="android-select" aria-label={b?.kind==='mode'?'网速显示方式':b?.kind==='zone'?(Object.keys(names).find(k=>names[k]===b.id)||'')+'显示位置':'选择选项'} style={{width:w,height:h}}><span style={{position:'absolute',left:0,top:0,width:w-156,height:h}}>{textNode&&<NativeText node={textNode} text={options[selected]||''} dynamic/>}</span><img className="spinner-arrow" src="/native-assets/spinner-arrow.png" alt=""/></SelectTrigger><SelectContent alignItemWithTrigger={false} align="start" sideOffset={-h*scale} className="android-options" style={{fontFamily:'Device',fontSize:52*scale,'--option-height':`${156*scale}px`} as CSSProperties}>{options.map((t,i)=><SelectItem key={i} value={String(i)}>{t}</SelectItem>)}</SelectContent></Select></div>}
 if(cls==='SeekBar')return <div key={n.path} {...attr} style={{...style,padding:`0 ${n.PaddingRight}px 0 ${n.PaddingLeft}px`,display:'flex',alignItems:'center'}}><Slider thumbAlignment="center" className="android-slider" aria-label={parent?.children?.[parent.children.indexOf(original)-1]?.text||'调整数值'} value={[n.Progress||0]} min={n.Min||0} max={n.Max||100} onValueChange={v=>change(original,Array.isArray(v)?v[0]:v)}/></div>;
 if(cls==='Switch')return <div key={n.path} {...attr} style={style}><NativeText node={n}/><Switch className="android-switch" aria-label={(n.text||n.description||labelOf(parent||n)||'开关').replace(/已开启$|已关闭$/,'')} style={{position:'absolute',right:26,top:(h-65)/2}} checked={!!n.isChecked} onCheckedChange={v=>change(original,v)} onClick={e=>e.stopPropagation()}/></div>;
 if(cls==='CheckBox')return <div key={n.path} {...attr} style={style}><NativeText node={{...n,PaddingLeft:Math.max(n.PaddingLeft,104)}}/><Checkbox className="android-checkbox" aria-label={n.text||'选项'} checked={!!n.isChecked} onCheckedChange={v=>change(original,v)} style={{position:'absolute',left:24,top:(h-58)/2}}/></div>;
 if(cls==='EditText'){const fs=n.getTextSize||45.5,pt=2*((n.getBaseline||98)-fs*.348876953)-h+n.PaddingBottom;return <div key={n.path} {...attr} className="native-edit" style={style}><input className="android-input" aria-label={parent?.children?.[parent.children.indexOf(original)-1]?.text||'输入内容'} value={n.text||''} placeholder={n.hint||''} onChange={e=>change(original,e.target.value)} style={{position:'absolute',inset:0,width:w,height:h,fontFamily:'Device',fontSize:fs,color:color(n.getCurrentTextColor),padding:`${Math.max(0,pt)}px ${n.PaddingRight}px ${n.PaddingBottom}px ${n.PaddingLeft}px`}}/>{!flattenBackground(n.background).mStrokeWidth&&<span className="native-edit-line" style={{left:n.PaddingLeft,right:n.PaddingRight,bottom:n.PaddingBottom}}/>}</div>}
 if(n.asset)return <button key={n.path} {...attr} tabIndex={n.ViewFlags&0x4000?0:-1} aria-label={n.description||'图标'} onClick={e=>{if(n.ViewFlags&0x4000){e.stopPropagation();action(n)}}} className="native-image" style={style}><img src={n.asset} width={w} height={h} alt=""/></button>;
 if(cls==='Button')return <button key={n.path} {...attr} className="native-button" style={style} onClick={e=>{e.stopPropagation();action(n)}}><NativeText node={n} dynamic={dynamic}/></button>;
 if(n.text!==undefined)return <div key={n.path} {...attr} style={style} role={n.ViewFlags&0x4000?'button':undefined} tabIndex={n.ViewFlags&0x4000?0:undefined} onClick={n.ViewFlags&0x4000?e=>{e.stopPropagation();action(n)}:undefined}><NativeText node={n} dynamic={dynamic}/></div>;
 const clickable=!!(n.ViewFlags&0x4000)&&!scroll;
 return <div key={n.path} {...attr} className={scroll?'native-scroll':undefined} style={{...style,overflowY:cls==='ScrollView'?'auto':undefined,overflowX:cls==='HorizontalScrollView'?'auto':undefined}} role={clickable?'button':undefined} tabIndex={clickable||scroll?0:undefined} aria-label={clickable?labelOf(n):undefined} onClick={clickable?()=>action(n):undefined} onKeyDown={clickable?e=>{if(e.key==='Enter')action(n)}:undefined}>{n.children?.map(c=>render(c,n))}</div>;
 }
 const exportConfig=()=>{
  let frame=document.querySelector<HTMLIFrameElement>('iframe[name="prototype-download"]');if(!frame){frame=document.createElement('iframe');frame.name='prototype-download';frame.hidden=true;document.body.appendChild(frame)}
  const form=document.createElement('form');form.method='POST';form.action='/api/config-export';form.target='prototype-download';const input=document.createElement('input');input.type='hidden';input.name='configuration';input.value=JSON.stringify(serializeSettings(status,values));form.appendChild(input);document.body.appendChild(form);form.requestSubmit();form.remove();tell('已生成当前网页配置文件');
 };
 const importConfig=(text:string)=>{const loaded=parseSettings(text,fresh(),defaultValues,controlAliases);setStatus(loaded.status);setValues(loaded.settings);tell('配置已导入并自动保存')};
 return <main className="prototype-stage"><div className="prototype-caption">界面布局原型 · {saveError?'自动保存失败，请导出配置备份':page==='launcher'?'确认修改后保存（仅网页）':'修改自动保存（仅网页）'}</div><div className="native-frame" data-testid="device-screen" data-route={page} style={{width:1216,height:2688,zoom:scale}} key={page}>
 {page==='launcher'?<LauncherEditor values={values} set={(key,value)=>setValues(v=>({...v,[key]:value}))} onBack={()=>go('apps')} tell={tell} backAsset={walk(pages.launcher).find(n=>n.class.endsWith('ImageButton'))!.asset!}/>:page.startsWith('status-')?<StatusPage page={page} state={status} values={values} set={setStatus} setValue={(key,value)=>setValues(v=>({...v,[key]:value}))} tell={tell} go={go} onBack={()=>go('system')} onRestart={()=>setRestart(true)} onReset={()=>action(walk(pages[page]).find(n=>n.text==='恢复默认')!)} backAsset={walk(pages.apps).find(n=>n.class.endsWith('ImageButton'))!.asset!}/>:revisedTitles[page]?<RevisedPage go={go} page={page} values={values} onChange={(key,value)=>setValues(v=>({...v,[key]:value}))} onBack={()=>go(parentPage[page.replace('-expanded','')]||'home-unlocked')} onRestart={()=>setRestart(true)} onExport={exportConfig} onImport={importConfig} backAsset={walk(pages.apps).find(n=>n.class.endsWith('ImageButton'))!.asset!} tell={tell}/>:render(pages[page]||pages.home)}
 <div className="native-system-bar" aria-hidden="true"><div>08:50戊辰周日 C:40°B:32.0°<br/>09.06九月初六 G:35°P:0.8W</div><div className="system-icons"><span>↑0K<br/>↓0K</span><Bluetooth/><Wifi/><BatteryMedium/><Zap/><VolumeX className="muted-volume"/></div></div><div className="native-home-indicator"/>
 {toast&&<div className="native-toast" role="status">{toast}</div>}
 {restart&&<div className="native-scrim" onClick={()=>setRestart(false)}><section className="native-dialog" onClick={e=>e.stopPropagation()} role="dialog" aria-label="重启作用域"><h2>重启作用域</h2>{['隐藏列表（系统设置）','状态栏（SystemUI）','小窗核心（重启手机）','应用增强（安装兼容、双开与主题商店）','游戏增强（游戏空间与风扇）','全部作用域'].map((label,i)=><label key={label}><input type="radio" name="scope" checked={scope===i} onChange={()=>setScope(i)}/>{label}</label>)}<footer><button onClick={()=>setRestart(false)}>取消</button><button onClick={()=>{setRestart(false);tell('作用域已重启')}}>立即重启</button></footer></section></div>}
 </div></main>;
}
