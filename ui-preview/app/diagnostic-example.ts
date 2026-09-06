export function diagnosticExample(shoulder:boolean,ai:boolean,now=new Date().toISOString()){
 const lines=[
 'LS_Augment 网页原型 · 日志导出结构示例',
 'IMPORTANT: 本文件不读取手机；以下状态和调用均为模拟，不可用于判断真实设备是否 Hook 成功。',
 `exported_at=${now}`,
 '',
 '[采集概览]',
 'source=web_prototype',
 'device=未连接手机',
 'module_version=网页原型',
 'actual_capture=NOT_COLLECTED',
 `shoulder_detailed=${shoulder}`,`ai_detailed=${ai}`,
 'capture_window=原型示例，无真实采集时段',
 '',
 '[基础运行状态：字段示例]',
 'feature=shoulder process=system_server pid=EXAMPLE process_start=EXAMPLE module_loaded=UNKNOWN hook_installed=UNKNOWN last_hit=UNKNOWN result=UNKNOWN',
 'feature=ai process=cn.nubia.gameassist pid=EXAMPLE process_start=EXAMPLE module_loaded=UNKNOWN hook_installed=UNKNOWN last_hit=UNKNOWN result=UNKNOWN',
 '说明：未采集、未触发与接入失败必须区分，安装 Hook 成功也不等于功能已实际生效。',
 '',
 '[日常操作日志：示例]',
 'EXAMPLE [TARGETS] space=0 saved_count=3 result=simulated',
 'EXAMPLE [HIDE] success=true failures=0 result=simulated',
 'EXAMPLE [TILE] action=restore result=simulated',
 ];
 if(shoulder)lines.push('', '[肩键详细诊断：模拟调用样例]',
 'EXAMPLE seq=1 session=demo-shoulder process=system_server pid=EXAMPLE tid=EXAMPLE stage=hook_install target=InputManagerService method=EXAMPLE result=simulated_success',
 'EXAMPLE seq=2 session=demo-shoulder wall=EXAMPLE uptime=1000 thread=EXAMPLE stage=key_down key=left result=simulated_hit',
 'EXAMPLE seq=3 session=demo-shoulder wall=EXAMPLE uptime=1050 thread=EXAMPLE stage=dispatch expected_interval_ms=50 actual_interval_ms=50 result=simulated_success',
 'EXAMPLE seq=4 session=demo-shoulder wall=EXAMPLE uptime=1100 thread=EXAMPLE stage=key_up stop_verified=simulated_true',
 'errors=示例无异常；真实导出应包含异常类型、消息、相关堆栈和熔断状态');
 if(ai)lines.push('', '[AI 触发器详细诊断：模拟调用样例]',
 'EXAMPLE seq=1 session=demo-ai process=cn.nubia.gameassist pid=EXAMPLE tid=EXAMPLE stage=hook_install target=EXAMPLE method=EXAMPLE result=simulated_success',
 'EXAMPLE seq=2 session=demo-ai wall=EXAMPLE uptime=2000 thread=EXAMPLE stage=scan_start engine=template result=simulated_hit',
 'EXAMPLE seq=3 session=demo-ai wall=EXAMPLE uptime=2180 thread=EXAMPLE stage=template_recheck result=simulated_match',
 'EXAMPLE seq=4 session=demo-ai wall=EXAMPLE uptime=2205 thread=EXAMPLE stage=click_dispatch result=simulated_success',
 'errors=示例无异常；真实导出应保留扫描、识别、复核、入队、执行或取消过程及错误');
 lines.push('', '[采集完整性]', 'real_system_logs=NOT_COLLECTED', 'real_lsposed_logs=NOT_COLLECTED', 'truncated=not_applicable', '说明：实际模块尚需接入详细日志采集；关闭详细诊断时不应伪造或补录过去的调用记录。');
 return lines.join('\n')+'\n';
}
