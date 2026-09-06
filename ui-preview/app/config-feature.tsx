'use client';
import {useEffect,useId,useState,type ReactNode} from 'react';
import {ChevronDown} from 'lucide-react';
import {Switch} from '@/components/ui/switch';
export function ConfigFeature({title,description,enabled,onChange,tell,children}:{title:string,description?:string,enabled:boolean,onChange:(b:boolean)=>void,tell:(s:string)=>void,children?:ReactNode}){
 const [collapsed,setCollapsed]=useState(false),id=useId(),open=enabled&&!collapsed;
 useEffect(()=>{if(enabled)setCollapsed(false)},[enabled]);
 return <div className="revision-feature"><div className="revision-feature-title"><h2>{title}</h2><div className="revision-controls"><Switch className="android-switch" aria-label={title} checked={enabled} onCheckedChange={b=>{setCollapsed(false);onChange(b)}}/>{children&&<button className="revision-expand" aria-label={(open?'收起':'展开')+title+'配置'} aria-expanded={open} aria-controls={id} onClick={()=>enabled?setCollapsed(c=>!c):tell('请先开启功能')}><ChevronDown style={{transform:open?'rotate(180deg)':undefined}}/></button>}{!children&&<span className="revision-expand-space" aria-hidden="true"/>}</div></div>{description&&<p>{description}</p>}{children&&open&&<div className="revision-section" id={id}>{children}</div>}</div>;
}
