"""Behavioral negative controls in temporary copies. Never edits the working production tree."""
from pathlib import Path
import concurrent.futures, json, os, shutil, subprocess, sys, tempfile
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/wifi-asset-spacing-20454/negative-controls';OUT.mkdir(parents=True,exist_ok=True)
base='android/app/src/main/java/ls/augment/com/'
MUTATIONS=[
 ('omit_signal_canvas',base+'StatusBarWifiAssetSpacingPolicy.java','int sw=signalPresent?canvasWidth+s[0]+s[2]:0','int sw=signalPresent?s[0]+s[2]:0','runtime'),
 ('ignore_rtl',base+'StatusBarWifiAssetSpacingPolicy.java','int sx=rtl?width-ss-canvasWidth:ss','int sx=ss','runtime'),
 ('scale_user_margins',base+'hook/StatusBarWifiAssetSpacingHook.java','getDisplayMetrics().density/scale','getDisplayMetrics().density','runtime'),
 ('accept_unloaded_wrapper',base+'hook/StatusBarAssetsHook.java','series=!failed&&(current||entry.readyLayoutGeneration==layoutAssetGeneration)','series=true','runtime'),
 ('accept_old_generation',base+'hook/StatusBarAssetsHook.java',' || generation!=layoutAssetGeneration','', 'runtime'),
 ('accept_replaced_resource',base+'hook/StatusBarAssetsHook.java',' || owner.resources.get(binding.layer)!=this','', 'runtime'),
 ('allow_extra_pack_shrink',base+'hook/StatusBarGridHook.java','box.scale>=.9999f','box.scale>=.8f','runtime'),
 ('overwrite_explicit_scope',base+'StatusBarWifiAssetSpacingPolicy.java','spec.explicit(surface,id)==null','true','runtime'),
 ('borrow_unknown_scope',base+'StatusBarWifiAssetSpacingEditor.java','if(contract==null)return false;','if(contract==null)continue;','editor'),
 ('ignore_invisible_occupant',base+'hook/StatusBarWifiAssetSpacingHook.java','sibling.getVisibility()==View.GONE','sibling.getVisibility()!=View.VISIBLE','runtime'),
 ('render_before_layout',base+'hook/StatusBarWifiAssetSpacingHook.java','return view.getWidth()==pair.width()&&view.getHeight()==pair.height()&&Math.abs(view.getLeft()-x)<=1&&Math.abs(view.getTop()-y)<=1;','return true;','runtime'),
 ('forget_decode_error',base+'hook/StatusBarAssetsHook.java','series=!failed&&(current||entry.readyLayoutGeneration==layoutAssetGeneration)','series=current||entry.readyLayoutGeneration==layoutAssetGeneration','runtime'),
]
TOOLS=['test-wifi-asset-spacing-runtime.py','test-wifi-asset-spacing-editor.py','test-statusbar-child-spacing-runtime.py','test-privacy-dot-spacing-editor.py','test-privacy-dot-spacing-runtime.py','test-notification-media-card-runtime.py']
def run(item):
    name,file,old,new,suite=item
    with tempfile.TemporaryDirectory(prefix='duo-wifi-mutation-') as tmp:
        root=Path(tmp);shutil.copytree(ROOT/'android/app/src/main/java/ls/augment/com',root/'android/app/src/main/java/ls/augment/com')
        (root/'tools').mkdir()
        for tool in TOOLS:shutil.copy2(ROOT/'tools'/tool,root/'tools'/tool)
        path=root/file;source=path.read_text(encoding='utf-8')
        if old not in source:raise AssertionError('Mutation target missing: '+name)
        path.write_text(source.replace(old,new),encoding='utf-8')
        env=os.environ.copy();env['DUO_SOURCE_ROOT']=str(root)
        script=root/'tools'/('test-wifi-asset-spacing-'+suite+'.py')
        result=subprocess.run([sys.executable,str(script)],capture_output=True,text=True,encoding='utf-8',errors='replace',env=env,timeout=70)
        log=result.stdout+result.stderr;(OUT/(name+'.log')).write_text(log,encoding='utf-8')
        killed=result.returncode!=0 and 'AssertionError' in log and 'error: cannot find symbol' not in log and 'error: illegal' not in log
        return {'mutation':name,'suite':suite,'exitCode':result.returncode,'killedByBehavior':killed,'log':str(OUT/(name+'.log'))}
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:results=list(pool.map(run,MUTATIONS))
(OUT/'results.json').write_text(json.dumps({'scope':'local Java facades, not device evidence','results':results},ensure_ascii=False,indent=2),encoding='utf-8')
for row in results:print(row['mutation']+': '+('REJECTED' if row['killedByBehavior'] else 'SURVIVED / INVALID TEST'))
if not all(row['killedByBehavior'] for row in results):sys.exit(1)
