"""Bounded offline regressions; phone rendering and runtime source proof remain separate."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import json
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/redmagic12-12.0.15MR1/tests/stage4'
tests=[
 ('notification-legacy','test-notification-whole-stack-runtime',[]),
 ('notification-modern','test-notification-whole-stack-runtime',['--modern-contract']),
 ('notification-bundle','test-notification-whole-stack-runtime',['--native-bundle']),
 *[(name,name,[]) for name in [
  'check-redmagic12-stage4-contracts','test-redmagic12-systemui-contracts','test-notification-grouping-policy',
  'test-notification-clear-runtime','test-notification-summary-runtime',
  'test-notification-clock-ownership-runtime','test-notification-clock-geometry-runtime','test-systemui-fatal-dispatch',
  'test-atomic-workbench-home-hook','test-atomic-workbench-home-modern','test-atomic-workbench-home-runtime',
  'test-atomic-workbench-home-launcher','test-atomic-workbench-ime-hook','test-atomic-workbench-root-boundary',
  'test-atomic-workbench-extraction-handoff','test-atomic-workbench-editor-evidence','test-package-ready-dispatch',
  'test-atomic-workbench-media-dispatch-runtime','test-root-archive-stage4',
  'test-wifi-sampler-runtime',
  'test-redmagic12-stage2-runtime','test-launcher-pages-named-lifecycle','test-launcher-pages-lifecycle',
  'test-launcher-widget-dock-runtime','test-launcher-dock-nx789j-runtime','test-launcher-customization-runtime',
  'test-fan-fixed-runtime','test-fan-tile-runtime','test-fan-screen-off-runtime',
 ]],
]
def run(task):
    name,script,args=task;log=OUT/(name+'.log')
    with log.open('w',encoding='utf-8') as stream:
        result=subprocess.run([sys.executable,str(ROOT/'tools'/(script+'.py')),*args],cwd=ROOT,stdout=stream,stderr=subprocess.STDOUT)
    print(('PASS ' if result.returncode==0 else 'FAIL ')+name,flush=True)
    return {'test':name,'exitCode':result.returncode,'log':log.relative_to(ROOT).as_posix()}
with ThreadPoolExecutor(max_workers=3) as pool:results=list(pool.map(run,tests))
bridge=OUT/'watcher-bridge'
results.append(run(('test-root-watcher-bridge','test-root-watcher-bridge',['--output',str(bridge)])))
results.append(run(('test-root-watcher-lifecycle','test-root-watcher-lifecycle',['--bridge-output',str(bridge),'--output',str(OUT/'watcher-lifecycle')])))
(OUT/'regression-results.json').write_text(json.dumps(results,indent=2)+'\n',encoding='utf-8')
raise SystemExit(0 if all(r['exitCode']==0 for r in results) else 1)
