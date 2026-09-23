"""Real adb installs with distinct signing certificates and private data checks."""
import hashlib
import json
import subprocess
import time
from adb_regression import *

stage = sys.argv[1] if len(sys.argv)>1 else 'round6'
folder = OUTPUT / (stage+'-signature-results');folder.mkdir(exist_ok=True)
variants={v['label']:v for v in json.loads((OUTPUT/'fixtures/inventory.json').read_text())}
packages=['ls.augment.regression.signature','ls.augment.regression.shared']
for package in packages:
    if adb('shell','pm path '+package,check=False).decode('utf-8','replace').strip().startswith('package:'):
        raise RuntimeError('Fixture already exists; inspect and preserve before proceeding: '+package)
results=[]

def install(label, accepted):
    variant=variants[label]
    result=subprocess.run([str(ADB),'-s',SERIAL,'install','-r',variant['apk']],capture_output=True)
    output=(result.stdout+result.stderr).decode('utf-8','replace')
    (folder/(label+'-'+str(len(results))+'.txt')).write_text(output,encoding='utf-8')
    success=result.returncode==0 and 'Success' in output
    if success!=accepted: raise AssertionError(f'{label}: expected acceptance={accepted}: '+output)
    return output.strip()

def flag(enabled,label):
    instrument('set',stage+'-'+label,{'ls_augment_allow_signature_mismatch':'1' if enabled else '0'})
    time.sleep(2)

def data(package):
    return shell('cat /data/user/0/'+package+'/shared_prefs/ls.augment.regression.ProbeActivity.xml',root=True)

try:
    flag(False,'signature-off')
    install('signature-v1',True)
    shell('am start -n '+variants['signature-v1']['component'])
    snapshot(stage+'-signature-v1',False)
    original=data(packages[0]);(folder/'original-fixture-data.xml').write_text(original,encoding='utf-8')
    outcome=install('signature-v2',False)
    assert 'INSTALL_FAILED_UPDATE_INCOMPATIBLE' in outcome and data(packages[0])==original
    results.append({'id':'SIGN-01','case':'Off: mismatched certificate rejected; data preserved','status':'pass','result':outcome})
    flag(True,'signature-on')
    outcome=install('signature-v2',True)
    shell('am start -n '+variants['signature-v2']['component'])
    snapshot(stage+'-signature-v2',False)
    assert data(packages[0])==original
    results.append({'id':'SIGN-02','case':'On: different signer upgrade succeeds; private data preserved','status':'pass','result':outcome})
    install('shared-v1',True)
    state=shell('dumpsys package '+packages[1]);(folder/'shared-uid-package.txt').write_text(state,encoding='utf-8')
    assert 'ls.augment.regression.shared.uid' in state
    outcome=install('shared-v2',False)
    assert 'INCOMPATIBLE' in outcome
    results.append({'id':'SIGN-03','case':'On: shared UID signature boundary remains enforced','status':'pass','result':outcome})
    flag(False,'signature-off-restore')
    outcome=install('signature-v3',False)
    assert 'INSTALL_FAILED_UPDATE_INCOMPATIBLE' in outcome and data(packages[0])==original
    results.append({'id':'SIGN-04','case':'Off again: different signer upgrade rejected again; data preserved','status':'pass','result':outcome})
finally:
    flag(False,'signature-final-off')
    for package in packages:
        result=adb('uninstall',package,check=False).decode('utf-8','replace')
        (folder/(package+'-cleanup.txt')).write_text(result,encoding='utf-8')
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
print(json.dumps({'evidence':str(folder),'cases':results},ensure_ascii=False))
