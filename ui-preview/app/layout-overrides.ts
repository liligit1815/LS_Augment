import {walk,type NativeNode} from './native-types';
/** 用户 1–30 号标注。只修改副本，保留真机测量基准。 */
export const layoutOverrides:Record<string,Record<string,Partial<NativeNode>>>={};
const height=(n:NativeNode)=>n.bounds[3]-n.bounds[1];
const move=(n:NativeNode,y:number)=>{const h=height(n);n.bounds[1]=y;n.bounds[3]=y+h};
export function setText(n:NativeNode,text:string,size=n.getTextSize){n.text=text;n.getTextSize=size;delete n.lines}
function find(root:NativeNode,path:string){return walk(root).find(n=>n.path===path)!}
function resize(root:NativeNode,path:string,h:number){
 const node=find(root,path),oldBottom=node.bounds[3],delta=h-height(node);node.bounds[3]+=delta;
 const parent=walk(root).find(n=>n.children?.includes(node));
 if(!parent||parent.class.endsWith('ScrollView')||parent.path.split('.').length<=4)return;
 for(const sibling of parent.children||[])if(sibling!==node&&sibling.bounds[1]>=oldBottom)move(sibling,sibling.bounds[1]+delta);
 resize(root,parent.path,height(parent)+delta);
}
function remove(root:NativeNode,path:string){
 const node=find(root,path);if(!node)return;const parent=walk(root).find(n=>n.children?.includes(node));if(!parent)return;
 const next=parent.children?.find(n=>n!==node&&n.bounds[1]>=node.bounds[3]);const amount=next?next.bounds[1]-node.bounds[1]:height(node);
 resize(root,path,height(node)-amount);parent.children=parent.children?.filter(n=>n!==node);
}
function removeMatching(root:NativeNode,predicate:(n:NativeNode)=>boolean){for(const n of [...walk(root)].reverse())if(predicate(n))remove(root,n.path)}
function repath(n:NativeNode,path:string){n.path=path;n.children?.forEach((c,i)=>repath(c,path+'.'+i))}
function compactUtility(root:NativeNode,row:NativeNode){
 const content=row.children?.find(n=>n.children?.some(c=>c.text));if(!content)return;const badge=content.children?.[2];if(!badge)return;
 const diff=height(badge)+16;content.children=content.children?.slice(0,2);content.bounds[3]-=diff;
 for(const c of row.children||[])if(c!==content)move(c,c.bounds[1]-diff/2);resize(root,row.path,height(row)-diff);
}
function setTitle(root:NativeNode,from:string,to:string){for(const n of walk(root))if(n.text===from)setText(n,to)}
function horizontalButtons(root:NativeNode,parent:NativeNode,buttons:NativeNode[],labels?:string[]){
 const left=buttons[0].bounds[0],right=buttons[0].bounds[2],top=buttons[0].bounds[1],gap=26,w=(right-left-gap*(buttons.length-1))/buttons.length;
 const oldEnd=buttons.at(-1)!.bounds[3],end=top+height(buttons[0]);
 buttons.forEach((n,i)=>{n.bounds=[left+i*(w+gap),top,left+i*(w+gap)+w,end];n.getTextSize=39;n.getGravity=17;n.PaddingLeft=13;n.PaddingRight=13;setText(n,labels?.[i]||n.text||'');n.getBaseline=(end-top)/2+14});resize(root,parent.path,height(parent)-(oldEnd-end));
}
export function annotatedPages(baseline:Record<string,NativeNode>){
 const pages=structuredClone(baseline);
 for(const [page,root] of Object.entries(pages)){
  removeMatching(root,n=>!!n.text?.startsWith('生效提示：'));
  // 同类功能统一为开关行和小字说明，不重复展示一组标题/描述。
  if(['shoulder','shoulder-expanded','combo_speed','combo_speed-expanded','freeform','audio_gain','double_app','fan_control','battery','detailed_diagnostics'].includes(page)){
   for(const card of [...walk(root)]){
    const [heading,line,row]=card.children||[];
    if(heading?.children?.[0]?.text&&line?.class.endsWith('.View')&&row?.children?.some(n=>n.class.endsWith('Switch'))){
     const title=heading.children[0].text,first=walk(row).find(n=>n.text);
     if(first&&first.text?.startsWith('启用'))setText(first,title);
     remove(root,heading.path);remove(root,line.path);
    }
   }
  }
  const save=walk(root).find(n=>n.text==='保存修改');
  if(save){const footer=walk(root).find(n=>n.children?.includes(save))!;const parent=walk(root).find(n=>n.children?.includes(footer))!;parent.children=parent.children?.filter(n=>n!==footer);const scroll=parent.children?.find(n=>n.class.endsWith('ScrollView'));if(scroll)scroll.bounds[3]=2597}
  if(page.startsWith('status-')){
   const apply=walk(root).find(n=>n.text==='应用');if(apply){const parent=walk(root).find(n=>n.children?.includes(apply))!;parent.children=parent.children?.filter(n=>n!==apply);const reset=parent.children?.find(n=>n.text==='恢复默认');if(reset){reset.bounds[2]=parent.bounds[2]-parent.bounds[0];setText(reset,'恢复默认')}}
   const hint=walk(root).find(n=>n.text?.startsWith('选择显示区域和大小'));if(hint)setText(hint,'选择显示区域和大小，修改后自动保存，预览实时更新。');
   const row=walk(root).find(n=>n.children?.length===4&&n.children.every(c=>['布局','时钟','硬件 / 网速','图标'].includes(c.text||'')));
   if(row){const gap=20,w=(row.bounds[2]-row.bounds[0]-60)/4;row.children!.forEach((n,i)=>{n.bounds[0]=i*(w+gap);n.bounds[2]=n.bounds[0]+w;setText(n,n.text||'')})}
  }
  if(page.startsWith('hide')){
   removeMatching(root,n=>!!n.text?.startsWith('Root：GRANTED'));
   const card=walk(root).find(n=>n.path.endsWith('.3')&&n.class.endsWith('LinearLayout')&&walk(n).some(c=>c.text==='消失吧图标'));if(card)remove(root,card.path);
   if(page==='hide-auto'){
    const heading=walk(root).find(n=>n.children?.[0]?.text==='锁屏自动隐藏');if(heading)remove(root,heading.path);
    const desc=walk(root).find(n=>n.text==='由 LSPosed 监听熄屏，无常驻通知。');if(desc){setText(desc,'由LSPosed监听，当锁屏时自动隐藏指定应用',35.75);resize(root,desc.path,86)}
   }
  }
  if(page==='apps'){
   remove(root,'0.0.0.0.2.0.0');remove(root,'0.0.0.0.2.0.1');compactUtility(root,find(root,'0.0.0.0.2.0.2.0'));compactUtility(root,find(root,'0.0.0.0.2.0.2.2'));
   setTitle(root,'小米运动健康','步数修改');setTitle(root,'应用图标与名称','APP图标名称编辑');
   const description=walk(root).find(n=>n.text?.startsWith('真实记录倍速'));if(description)setText(description,'真实记录倍速、随机增步计划与每周执行设置。');
   const card=find(root,'0.0.0.0.2.0.2'),row=structuredClone(card.children![4]);repath(row,'new.store');move(row,height(card)+3);
   setText(walk(row).find(n=>n.text==='允许安装签名不一致的应用')!,'应用商店同时下载限制解除',42.25);setText(walk(row).find(n=>n.text?.startsWith('用不同签名'))!,'允许应用商店同时下载更多应用。');
   const sw=walk(row).find(n=>n.class.endsWith('Switch'))!;sw.description='应用商店同时下载限制解除';sw.isChecked=false;row.children!.at(-1)!.description='打开应用商店同时下载限制解除详情';card.children!.push(row);card.bounds[3]+=204;
  }
  if(['system','game'].includes(page)){remove(root,'0.0.0.0.2.0.0');remove(root,'0.0.0.0.2.0.1')}
  if(page==='launcher_icon')removeMatching(root,n=>n.text==='当前：桌面显示');
  if(page==='system'){const title=walk(root).find(n=>n.text==='状态栏');if(title)setText(title,'系统增强');const card=find(root,'0.0.0.0.2.0.2');const row=card.children?.find(n=>walk(n).some(c=>c.text==='读取硬件数据'));if(row)compactUtility(root,row)}
  if(page==='game'){
   remove(root,'0.0.0.0.2.0.2.10');remove(root,'0.0.0.0.2.0.2.9');setTitle(root,'性能模式超分','超分破坏神');
   const desc=walk(root).find(n=>n.text==='允许其他性能模式使用红魔原生超分辨率。');if(desc)setText(desc,'性能模式超分与破坏神共存设置。');for(const n of walk(root))if(n.description.includes('性能模式超分'))n.description=n.description.replace('性能模式超分','超分破坏神');
  }
  if(page==='launcher'){
   setTitle(root,'应用图标与名称','APP图标名称编辑');const card=find(root,'0.0.0.0.0.4');removeMatching(root,n=>n.text==='恢复此应用的原名和图标');horizontalButtons(root,card,card.children!.filter(n=>n.class.endsWith('Button')),['确认修改','恢复原图标']);const preview=card.children!.find(n=>n.class.endsWith('ImageView'));if(preview){const w=preview.bounds[2]-preview.bounds[0];preview.bounds[0]=(card.bounds[2]-card.bounds[0]-w)/2;preview.bounds[2]=preview.bounds[0]+w;}removeMatching(root,n=>n.text==='应用并刷新桌面');
   const intro=walk(root).find(n=>n.text?.startsWith('先选择空间和应用'));if(intro)setText(intro,'先选择空间和应用，再修改名称或图片，点击确认修改。');
  }
 }
 for(const page of ['home','home-unlocked']){
  const root=pages[page];setTitle(root,'状态栏','系统增强');for(const n of walk(root))if(n.description==='进入状态栏')n.description='进入系统增强';setTitle(root,'Root + LSPosed','红魔11Pro增强');
  const old=find(root,'0.0.0.0.2.0.9'),card=structuredClone(find(pages.tools,'0.0.0.0.2.0.2'));card.bounds=[...old.bounds];card.bounds[3]=card.bounds[1]+750;repath(card,old.path);const parent=find(root,'0.0.0.0.2.0');parent.children=parent.children!.map(n=>n===old?card:n);
  for(const row of [...card.children!].filter(n=>n.children))compactUtility(root,row);
  const row=structuredClone(card.children![0]);repath(row,'new.config');move(row,height(card)+3);setText(walk(row).find(n=>n.text==='桌面图标')!,'配置导入导出');setText(walk(row).find(n=>n.text?.startsWith('隐藏或恢复'))!,'使用 JSON 文件备份、迁移与恢复设置。');row.description='进入配置导入导出';card.children!.push(row);card.bounds[3]+=height(row)+3;parent.bounds[3]=Math.max(parent.bounds[3],card.bounds[3]+60);
 }
 // 菜单只负责导航；保留原控件配置键以兼容此前导出的网页配置。
 for(const page of ['home','home-unlocked']){
  const root=pages[page];
  const old=walk(root).find(n=>n.children?.some(c=>c.children?.some(t=>t.text==='诊断与恢复')));
  if(old){const parent=walk(root).find(n=>n.children?.includes(old));const index=parent?.children?.indexOf(old)??-1;remove(root,old.path);const divider=parent?.children?.[index-1];if(divider?.class.endsWith('.View'))remove(root,divider.path)}
  setTitle(root,'详细诊断','运行诊断');
  for(const n of walk(root))if(n.text?.startsWith('集中管理肩键'))setText(n,'查看运行状态、详细诊断与日志。');
 }
 return pages;
}
