from pathlib import Path
root=Path(__file__).resolve().parents[1]/'app'
(root/'current-background.tsx').write_text('''/** Pixel-verified port of AppearanceController.Background; the page stays real DOM. */
export function CurrentBackground({opacity=1}:{opacity?:number}){return <img aria-hidden="true" alt="" className="c-backdrop" src="/current/native-background.png" style={{opacity}}/>}
''',encoding='utf-8')
p=root/'current-ui.tsx';s=p.read_text(encoding='utf-8')
s=s.replace("import {CircleAlert", "import editorHelp from './current-editor-help.json';\nimport {validText,clockPatternValid} from './current-validation';\nconst keyHelp=editorHelp.forKey as Record<string,string>,inlineHelp=editorHelp.inlineByKey as Record<string,string>,titleHelp=editorHelp.byTitle as Record<string,string>;\nimport {CircleAlert")
s=s.replace('help={help}/><button type="button" role="switch"','help={inlineHelp[name]||help||titleHelp[title]}/><button type="button" role="switch"')
s=s.replace('help={`调整${title}。可选范围：${min}–${max}。`}', 'help={keyHelp[name]||titleHelp[title]||`调整${title}。可选范围：${min}–${max}。`}')
s=s.replace("type='text',initial='',min,max}:{name:string;title:string;type?:string;initial?:string;min?:number;max?:number}","type='text',initial='',min,max,decimal=false,maxLength}:{name:string;title:string;type?:string;initial?:string;min?:number;max?:number;decimal?:boolean;maxLength?:number}")
s=s.replace("help={type==='number'?", "help={keyHelp[name]||titleHelp[title]||(type==='number'?")
s=s.replace("'设置'+title+'。'}/><input", "'设置'+title+'。')}/><input")
s=s.replace('value={draft} min={min} max={max}', 'value={draft} min={min} max={max} maxLength={maxLength} step={decimal?\'any\':1}')
s=s.replace("const valid=type!=='number'||(value.trim()!==''", "const valid=(maxLength===undefined||Array.from(value).length<=maxLength)&&(type!=='number'||(value.trim()!==''")
s=s.replace("&&Number.isInteger(+value));setError", "&&(decimal||Number.isInteger(+value))))&&(!name.includes('clock_pattern')||clockPatternValid(value));setError")
s=s.replace("请输入{min}–{max}范围内的有效整数；此项未保存。", "{type==='number'?`请输入${min}–${max}范围内的有效${decimal?'数值':'整数'}`:'请输入有效内容'}；此项未保存。")
s=s.replace("else valid=draft.length<=o.maximum||o.maximum===0;", "else valid=validText(o.key,draft,o.maximum||65536);")
p.write_text(s,encoding='utf-8')
p=root/'current-editors.tsx';s=p.read_text(encoding='utf-8')
s=s.replace("fan_control:'风扇转速'", "fan_control:'风扇控制'")
s=s.replace("'启用极速触发'", "'AI 触发器极速响应'")
s=s.replace("'模板扫描间隔',80", "'模板扫描间隔（ms）',80").replace("'点击队列间隔',10", "'点击队列间隔（ms）',10").replace("'策略冷却',50", "'策略冷却（ms）',50").replace("'YOLO 扫描间隔',150", "'YOLO 扫描间隔（ms）',150")
s=s.replace("'启用自定义连招速度'", "'一键连招速度'").replace('title="连招速度倍数"','title="播放倍率（×）"')
s=s.replace("const val=(key:string,d:string)=>m.values[key]??d;", "const val=(key:string,d:string)=>key===k('STATUSBAR_NETWORK_DISPLAY')&&![1,2,3,4].includes(Number(m.values[key]))?(m.values[k('STATUSBAR_NETWORK_TWO_ROWS')]==='0'?'3':'4'):m.values[key]??d;")
s=s.replace('initial={editorDefaults[k(String(n))]}/>', 'initial={editorDefaults[k(String(n))]} decimal={[\'STATUSBAR_CLOCK_SIZE_SP\',\'STATUSBAR_CLOCK_LETTER_SPACING\',\'STATUSBAR_CLOCK_LINE_SPACING_DP\'].includes(String(n))}/>')
s=s.replace('title="字体名称" initial="sans-serif"', 'title="字体名称（sans-serif / serif / monospace）" initial="sans-serif" maxLength={40}')
s=s.replace('title="磁贴名称" initial="LS_Augment"', 'title="磁贴名称" initial="LS_Augment" maxLength={30}')
s=s.replace('title="磁贴说明" initial="应用隐藏"', 'title="磁贴说明" initial="应用隐藏" maxLength={60}')
s=s.replace('<Button onClick={()=>{showTest(true);setStage(0)}}>兼容性测试</Button>', '{!passed&&<Button onClick={()=>{showTest(true);setStage(0)}}>兼容性测试</Button>}{passed&&<p className="c-note">兼容性测试通过；开关已解锁但未自动开启。建议先从20次/秒开始。</p>}')
s=s.replace('{testVisible&&<Card>', '{testVisible&&!passed&&<Card>')
s=s.replace('<small>当前：{Number(m.values[k(\'HEALTH_MULTIPLIER\')]||100)/100} 倍</small>', '<FeatureTitle title="步数倍数" help="只对真实新增步数按倍数计算，随机增加的步数不会再次加倍。"/><small>当前：{Number(m.values[k(\'HEALTH_MULTIPLIER\')]||100)/100} 倍</small>')
s=s.replace('help="限制当天通过倍速和计划新增的总步数。真实步行仍正常记录，已有步数不会减少。"','help="设置当日步数上限，范围1–1000000。两类增步共用额度，当日总步数达到上限后停止额外新增；真实步行继续记录，已有步数不会减少。"')
p.write_text(s,encoding='utf-8')
p=root/'current-status-preview.tsx';s=p.read_text(encoding='utf-8');s=s.replace("network=n('network_display',4)", "network=[1,2,3,4].includes(n('network_display'))?n('network_display'):(on('network_two_rows',true)?4:3)");p.write_text(s,encoding='utf-8')
p=root/'current.css';s=p.read_text(encoding='utf-8')+'''
.c-card+.c-group{margin-top:17px!important}.c-main-scroll .c-intro+.c-group{margin-top:12px!important}
.c-toggle-row{gap:0}.c-toggle-row .c-feature-title{flex:1}.c-switch-slot,.c-fold-arrow{width:28px;height:44px;flex:none}.c-fold-arrow{display:grid;place-items:center;color:#64748b!important}.c-range small{display:block;color:#64748b;font-size:12px;margin-top:3px}.c-range{margin-top:10px;margin-bottom:12px}.c-field input{min-height:48px;padding:8px 13px}.c-live-status{display:block;width:100%;height:100px}.c-status-fixed>.c-note{padding:0 0 4px}.c-card{background:linear-gradient(120deg,#efffff59,#e5f7ff66);border-color:#deffffd0;box-shadow:inset 1.2px 1.2px 1px #ffffffed,inset -1px -1px 1px #75b5d791,inset 3px 3px 7px #e8ffffc4,inset -2px -2px 4px #69a6cf40,0 1px 3px #498cb60c}
.c-link,.c-card,.c-launcher-setting{flex-shrink:0}.c-setting-icon{background:#dcefff!important}.c-support-card{height:261.54px;padding:10px 12px 12px}.c-support-card img{height:auto;max-height:218px;width:100%;object-fit:contain}.c-support-copy{font-size:11.5px;line-height:1.35}
''';p.write_text(s,encoding='utf-8')
