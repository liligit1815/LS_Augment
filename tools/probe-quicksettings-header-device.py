"""Observe real header hot changes and scope restarts without assuming success."""
import json
import time
import sys
from statusbar_device_helpers import configure
from quicksettings_device_helpers import OUTPUT, capture, restart_ui

P=(sys.argv[1] if len(sys.argv)>1 else 'round18')+'-qs-header-'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
results=[]
def sample(name,settings=None,restart=False):
    label=P+name
    if settings:configure(label,settings)
    if restart:restart_ui(label+'-restart')
    r=capture(label);results.append({'case':name,'header':r['header']})
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')

sample('baseline',{'rm_qs_grid':0,'rm_qs_search':0,'rm_qs_carrier':0,'rm_qs_clock_seconds':0,'rm_qs_clock_period':0})
sample('on-hot',{'rm_qs_search':1,'rm_qs_carrier':1,'rm_qs_clock_seconds':1,'rm_qs_clock_period':1})
sample('on-restarted',restart=True)
time.sleep(1.2)
sample('on-next-tick')
sample('off-hot',{'rm_qs_search':2,'rm_qs_carrier':2,'rm_qs_clock_seconds':0,'rm_qs_clock_period':0})
sample('off-restarted',restart=True)
