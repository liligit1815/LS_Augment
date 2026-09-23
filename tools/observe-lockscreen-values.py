"""Record actual accessibility text changes with aligned Android battery samples."""
import sys,time,json,threading
from adb_regression import OUTPUT,shell
P=sys.argv[1];duration=int(sys.argv[2]);folder=OUTPUT/P;folder.mkdir(exist_ok=True)
stop=threading.Event()
def touch():
    while not stop.is_set():
        shell('input tap 608 1800')
        if stop.wait(4):return
thread=threading.Thread(target=touch,daemon=True);thread.start()
try:
    result=shell(f'am instrument -w -r -e label {P} -e observeMillis {duration} ls.augment.regression.ui/ls.augment.com.UiWindowRunner',timeout=duration/1000+20)
    (folder/'instrumentation.txt').write_text(result,encoding='utf-8');assert 'status=pass' in result,result
    raw=shell('cat /data/user/0/ls.augment.regression.ui/files/ui-windows/'+P+'.json',root=True)
    (folder/'result-private.json').write_text(raw,encoding='utf-8');data=json.loads(raw)
    print({'events':data['textEvents'],'samples':len(data['batterySamples']),'allLocked':all(s['locked'] for s in data['batterySamples']),'allInteractive':all(s['interactive'] for s in data['batterySamples'])},flush=True)
finally:stop.set();thread.join(timeout=5)
