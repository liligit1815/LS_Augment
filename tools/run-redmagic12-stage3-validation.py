"""Offline regressions for retained OEM paths and this release's runtime changes."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import json,subprocess,sys
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/redmagic12-12.0.15MR1/tests/stage3'
tests=[
 'test-redmagic12-systemui-contracts','test-redmagic12-stage2-runtime',
 'test-launcher-pages-named-lifecycle','test-launcher-pages-lifecycle',
 'test-launcher-widget-dock-runtime','test-launcher-dock-nx789j-runtime',
 'test-launcher-customization-runtime','test-fan-fixed-runtime','test-fan-tile-runtime',
 'test-fan-screen-off-runtime','test-notification-clock-ownership-runtime',
 'test-notification-clock-geometry-runtime','test-systemui-fatal-dispatch',
 'test-atomic-workbench-root-boundary',
]
def run(name):
    log=OUT/(name+'.log')
    with log.open('w',encoding='utf-8') as stream:
        result=subprocess.run([sys.executable,str(ROOT/'tools'/(name+'.py'))],cwd=ROOT,stdout=stream,stderr=subprocess.STDOUT)
    print(('PASS ' if result.returncode==0 else 'FAIL ')+name,flush=True)
    return {'test':name,'exitCode':result.returncode,'log':str(log.relative_to(ROOT))}
with ThreadPoolExecutor(max_workers=3) as workers:results=list(workers.map(run,tests))
(OUT/'regression-results.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
raise SystemExit(0 if all(r['exitCode']==0 for r in results) else 1)
