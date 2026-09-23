from pathlib import Path
root=Path(__file__).resolve().parents[1]/'app'
p=root/'current-prototype.tsx';s=p.read_text(encoding='utf-8')
s=s.replace("go(parent)};", "if(scroller.current)positions.current[route]=scroller.current.scrollTop;setModal(null);location.hash=parent};")
s=s.replace("target?.restartScope||(['shoulder','ai_trigger','fan_control','combo_speed'].includes(route)?'games':route==='status_layout'?'systemui':'apps')", "target?.restartScope||(['shoulder','ai_trigger','fan_control','combo_speed','super_resolution','diablo_coexist','diagnostics','detailed_diagnostics'].includes(route)?'games':route==='status_layout'?'systemui':['freeform','audio_gain','signature_install'].includes(route)?'device':['hide_apps','automation','tile','battery'].includes(route)?'settings':'apps')")
s=s.replace("target||editorTitles[route]&&route!=='hide'?restart:undefined", "target||editorTitles[route]&&!['hide','launcher_custom'].includes(route)?restart:undefined")
start="{['开发者选项','USB 调试','无线调试','显示刷新率','关闭 GPU 叠加层'].map(t=><LinkCard key={t} title={t} help=\"打开系统中对应的设置项。\" onClick={()=>tell('原型演示：打开'+t)}/>)}"
end="<Card><p className=\"c-note\">以下开关直接修改手机系统设置。</p>{catalog.deviceSettings.map(o=><Toggle key={o.key} name={'device:'+o.key} title={o.title} help={o.help}/>)}<LinkCard title=\"打开系统开发者设置\" help=\"进入手机原厂开发者选项页面，调整模块中未列出的开发者设置。\" onClick={()=>tell('原型演示：打开系统开发者设置')}/></Card>"
assert start in s;s=s.replace(start,end)
p.write_text(s,encoding='utf-8')
p=root/'current-editors.tsx';s=p.read_text(encoding='utf-8')
s=s.replace("import catalog from './current-catalog.json';", "import catalog from './current-catalog.json';\nimport {CurrentStatusPreview} from './current-status-preview';")
s=s.replace('<R name="HEALTH_MULTIPLIER" title="当前" min={1} max={10} suffix=" 倍"/>', '<div className="c-range"><small>当前：{Number(m.values[k(\'HEALTH_MULTIPLIER\')]||100)/100} 倍</small><input type="range" aria-label="步数倍数" min={1} max={10} value={Number(m.values[k(\'HEALTH_MULTIPLIER\')]||100)/100} onChange={e=>m.set(k(\'HEALTH_MULTIPLIER\'),String(+e.target.value*100))}/></div>')
start=s.index('const reset=()=>{',s.index('function StatusEditor'))
end=s.index(';const component=',start)
s=s[:start]+"const reset=()=>{Object.keys(m.values).filter(key=>key.includes('statusbar')).forEach(key=>m.set(key,editorDefaults[key]||''));m.set(k('SYSTEMUI_MASTER'),'0');ids.forEach((id,i)=>{m.set('status:'+id+':on',i<4?'1':'0');m.set('status:'+id+':zone',String(defZones[i]));m.set('status:'+id+':size',String(i<4?13:9));m.set('status:'+id+':order',String(i))});m.tell('状态栏已恢复默认')}"+s[end:]
start=s.index('<div className="c-status-preview" aria-label="状态栏实时预览">')
end=s.index('<nav className="c-tabs"',start)
s=s[:start]+'<CurrentStatusPreview values={m.values}/>'+s[end:]
s=s.replace("<Choice name={k('STATUSBAR_CLOCK_TEXT_ALIGN')} title=\"文字对齐\" choices={['靠左','居中','靠右']} initial=\"1\"/>","<label className=\"c-choice\"><span>文字对齐</span><select aria-label=\"文字对齐\" value={m.values[k('STATUSBAR_CLOCK_TEXT_ALIGN')]||'center'} onChange={e=>m.set(k('STATUSBAR_CLOCK_TEXT_ALIGN'),e.target.value)}><option value=\"left\">靠左</option><option value=\"center\">居中</option><option value=\"right\">靠右</option></select></label>")
s=s.replace('<R key={n} name={String(n)} title={String(t)} min={+min} max={+max} step={n===\'STATUSBAR_CLOCK_LETTER_SPACING\'?.01:1}/>','<Field key={n} name={k(String(n))} title={String(t)} type="number" min={+min} max={+max} initial={editorDefaults[k(String(n))]}/>')
p.write_text(s,encoding='utf-8')
