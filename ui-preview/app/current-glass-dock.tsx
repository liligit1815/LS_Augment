'use client';
import {useRef,useState,type ComponentType,type CSSProperties} from 'react';
import {Home,Info} from 'lucide-react';
import {identity} from './current-ui';

export function CurrentGlassDock({route,go,moduleIcon:ModuleIcon}:{route:string;go:(route:string)=>void;moduleIcon:ComponentType<{size?:number}>}) {
  const items=[{route:'home',label:'主页',Icon:Home},{route:'settings',label:'模块',Icon:ModuleIcon},{route:'about',label:'关于',Icon:Info}];
  const selected=Math.max(0,items.findIndex(item=>item.route===route));
  const [drag,setDrag]=useState<number|null>(null);
  const [pressed,setPressed]=useState(false);
  const [stretch,setStretch]=useState(0);
  const gesture=useRef<{id:number;startX:number;startY:number;lastX:number;dragging:boolean}|null>(null);
  const suppressClick=useRef(false);
  const position=drag??selected;
  function release(commit:boolean){
    const active=gesture.current;
    suppressClick.current=!!active?.dragging;
    if(commit&&active?.dragging&&drag!==null)go(items[Math.round(drag)].route);
    gesture.current=null;setDrag(null);setPressed(false);setStretch(0);
  }
  return <nav className="c-bottom-nav c-glass-dock" aria-label="主导航" data-dragging={drag!==null} data-pressed={pressed}
    style={{'--dock-position':position,'--dock-stretch':stretch} as CSSProperties}
    onPointerDown={event=>{if(event.button!==0)return;suppressClick.current=false;gesture.current={id:event.pointerId,startX:event.clientX,startY:event.clientY,lastX:event.clientX,dragging:false};setPressed(true);}}
    onKeyDown={()=>{suppressClick.current=false;}}
    onPointerMove={event=>{
      const active=gesture.current;if(!active||active.id!==event.pointerId)return;
      const dx=event.clientX-active.startX,dy=event.clientY-active.startY;
      if(!active.dragging&&Math.abs(dx)>8&&Math.abs(dx)>Math.abs(dy)){active.dragging=true;event.currentTarget.setPointerCapture(event.pointerId);}
      if(active.dragging){const bounds=event.currentTarget.getBoundingClientRect();const slot=(bounds.width-14*bounds.width/event.currentTarget.offsetWidth)/3;
        setDrag(Math.max(0,Math.min(2,(event.clientX-bounds.left-7*bounds.width/event.currentTarget.offsetWidth)/slot-.5)));
        setStretch(Math.min(.18,Math.abs(event.clientX-active.lastX)/slot*.35));active.lastX=event.clientX;}
    }}
    onPointerUp={event=>{const bounds=event.currentTarget.getBoundingClientRect();release(event.clientY>bounds.top-bounds.height*.5&&event.clientY<bounds.bottom+bounds.height*.5);}}
    onPointerCancel={()=>release(false)} onLostPointerCapture={()=>{if(gesture.current)release(false);}}
  >
    <div className="c-dock-base" aria-hidden="true"/>
    <div className="c-dock-lens" aria-hidden="true"/>
    {items.map(({route:target,label,Icon},index)=><button key={target} aria-current={route===target?'page':undefined} data-lens-focus={Math.round(position)===index}
      style={{'--dock-zoom':1+(.08+(pressed?.04:0))*Math.max(0,1-Math.abs(position-index))} as CSSProperties}
      onClick={event=>{if(suppressClick.current||drag!==null||gesture.current?.dragging){event.preventDefault();suppressClick.current=false;return;}go(target);}}
      {...identity('SettingsActivity:tab-'+target,label)}>
      <Icon size={22}/><span>{label}</span>
    </button>)}
  </nav>;
}
