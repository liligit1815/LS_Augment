'use client';
import {useState} from 'react';
import {AppWindow} from 'lucide-react';
import type {Values} from './prototype-settings';
// Sample records, with the same sorting, search and per-space selection rules as HideAppsActivity.
export const hideApps=[
 {name:'小米运动健康',pkg:'com.mi.health',date:'2026-09-01'},
 {name:'微信',pkg:'com.tencent.mm',date:'2026-08-25'},
 {name:'QQ',pkg:'com.tencent.mobileqq',date:'2026-08-20'},
 {name:'哔哩哔哩',pkg:'tv.danmaku.bili',date:'2026-09-04'},
 {name:'网易云音乐',pkg:'com.netease.cloudmusic',date:'2026-09-02'},
 {name:'淘宝',pkg:'com.taobao.taobao',date:'2026-08-15'},
];
export function HideAppPicker({values:v,set}:{values:Values,set:(k:string,v:unknown)=>void}){
 const [expanded,expand]=useState(false),[query,search]=useState(''),[byInstall,sort]=useState(false);
 const space=Number(v['hide:space'])||0,key=(i:number)=>`hide:app:${space}:${i}`,stateKey=(i:number)=>`hide:state:${space}:${i}`;
 const rows=hideApps.map((app,i)=>({...app,i})).filter(a=>!query.trim()||(`${a.name} ${a.pkg}`).toLowerCase().includes(query.trim().toLowerCase())).sort((a,b)=>Number(!!v[key(b.i)])-Number(!!v[key(a.i)])||(byInstall?b.date.localeCompare(a.date):a.name.toLowerCase().localeCompare(b.name.toLowerCase(),'en'))||a.pkg.localeCompare(b.pkg));
 const count=hideApps.filter((_,i)=>v[key(i)]).length;
 return <div className="revision-section hide-picker"><h3>选择应用</h3><p>仅显示用户安装的应用；系统应用不支持隐藏。列表默认收起，已勾选项排在最前。</p><p>空间 {space===0?0:999} · 可选 {rows.length} 个 · 已勾选 {count} 个</p><div className="revision-buttons"><button className="revision-accent" aria-expanded={expanded} onClick={()=>expand(!expanded)}>{expanded?'收起应用列表':`管理应用（${rows.length}）`}</button></div>{expanded&&<><input className="hide-search" aria-label="搜索应用名称或包名" placeholder="搜索应用名称或包名" value={query} onChange={e=>search(e.target.value)}/><div className="hide-sort"><button onClick={()=>sort(!byInstall)}>{byInstall?'按安装时间排序':'按名称排序'}</button></div><div className="hide-app-list">{rows.map(a=><section className="hide-app-row" key={a.pkg} data-app-package={a.pkg}><div className="hide-app-top"><AppWindow aria-hidden="true"/><div><h3>{a.name}</h3><p>{a.pkg} · 第三方 · {a.date}{v[key(a.i)]?` · ${v[stateKey(a.i)]?'已隐藏':'已显示'}`:''}</p></div><input type="checkbox" aria-label={`选择${a.name}`} checked={!!v[key(a.i)]} onChange={e=>set(key(a.i),e.target.checked)}/></div>{!!v[key(a.i)]&&<div className="revision-buttons"><button aria-label={'隐藏'+a.name} onClick={()=>set(stateKey(a.i),true)}>隐藏</button><button aria-label={'显示'+a.name} onClick={()=>set(stateKey(a.i),false)}>显示</button></div>}</section>)}{!rows.length&&<p className="revision-note">未找到匹配的应用</p>}</div></>}<p className="revision-note">网页展示示例应用；各空间独立保存选择，修改自动保存。</p></div>;
}
