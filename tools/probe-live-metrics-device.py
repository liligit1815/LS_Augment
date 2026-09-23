"""Retain rendered metrics, independent phone sensor samples, and real Wi-Fi transfers."""
import json,re,shlex,subprocess,sys,threading,time,uuid
import xml.etree.ElementTree as ET
from http.server import BaseHTTPRequestHandler,ThreadingHTTPServer
from adb_regression import OUTPUT,ADB,SERIAL,adb,shell,instrument
from statusbar_device_helpers import grid,require_systemui_build
from native_ui_helpers import all_windows

prefix=sys.argv[1];host_ip=sys.argv[2]
out=OUTPUT/(prefix+'results');out.mkdir(exist_ok=True)
base=instrument('snapshot',prefix+'baseline')['settings'];touched={};observations=[];transfers=[]
payload_size=32*1024*1024;token=uuid.uuid4().hex;active_transfer=None

class TransferHandler(BaseHTTPRequestHandler):
    def log_message(self,*args):pass
    def do_GET(self):
        if self.path not in ['/'+token+'/ready','/'+token+'/download']:
            self.send_error(404);return
        length=2 if self.path.endswith('/ready') else payload_size
        self.send_response(200);self.send_header('Content-Length',str(length));self.end_headers()
        if length==2:self.wfile.write(b'OK');return
        started=time.time();sent=0;block=bytes(65536)
        try:
            while sent<length:self.wfile.write(block);sent+=len(block)
            self.wfile.flush()
        finally:transfers.append({'direction':'download','bytesSent':sent,'startedAt':started,'endedAt':time.time()})
    def do_POST(self):
        if self.path!='/'+token+'/upload':self.send_error(404);return
        length=int(self.headers.get('Content-Length','0'))
        if length!=payload_size:self.send_error(400);return
        started=time.time();received=0;nonzero=0
        while received<length:
            block=self.rfile.read(min(65536,length-received))
            if not block:break
            received+=len(block);nonzero+=sum(v!=0 for v in block)
        transfers.append({'direction':'upload','bytesReceived':received,'nonzeroBytes':nonzero,'startedAt':started,'endedAt':time.time()})
        self.send_response(200 if received==length and nonzero==0 else 400);self.send_header('Content-Length','2');self.end_headers();self.wfile.write(b'OK')

server=ThreadingHTTPServer((host_ip,0),TransferHandler)
threading.Thread(target=server.serve_forever,daemon=True).start()
url='http://'+host_ip+':'+str(server.server_port)+'/'+token

def configure(name,values):
    values={'ls_augment_'+k:str(v) for k,v in values.items()}
    for key in values:
        assert key in base,key
        touched.setdefault(key,base[key])
    instrument('set',prefix+name+'-config',values)
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('am start -W -n ls.augment.com/.SettingsActivity')
    time.sleep(6)

def reference():
    command='cat /proc/uptime; for f in temp current_now voltage_now status; do printf "%s=" "$f"; cat "/sys/class/power_supply/battery/$f"; done; for z in /sys/class/thermal/thermal_zone*; do read -r t < "$z/type"; case "$t" in *cpu*|*gpu*) read -r v < "$z/temp"; printf "%s|%s\\n" "$t" "$v";; esac; done; cat /proc/net/dev'
    return shell(command,root=True)

def capture(name):
    label=prefix+name;folder=OUTPUT/label;folder.mkdir(exist_ok=True)
    before=reference();at=time.time()
    (folder/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    raw=shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
    parsed=ET.fromstring(raw)
    diagnostics={n.get('name'):n.text for n in parsed if 'statusbar_' in n.get('name','') or n.get('name')=='ls_augment_systemui_layout_state'}
    after=reference();all_windows(label)
    (folder/'reference-before.txt').write_text(before,encoding='utf-8');(folder/'reference-after.txt').write_text(after,encoding='utf-8')
    (folder/'diagnostics.json').write_text(json.dumps(diagnostics,ensure_ascii=False,indent=2),encoding='utf-8')
    item={'case':name,'at':at,'metrics':diagnostics.get('ls_augment_statusbar_phone_metrics_state',diagnostics.get('ls_augment_statusbar_metrics_state')),'result':'observed','evidence':label}
    observations.append(item);(out/'observations.json').write_text(json.dumps(observations,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(item,ensure_ascii=False),flush=True)

def begin_transfer(direction):
    global active_transfer
    target=url+'/'+direction
    curl='curl --noproxy "*" --silent --show-error --limit-rate 512k --max-time 100 --output /dev/null --write-out "%{http_code} %{size_download} %{size_upload} %{time_total}" '
    command=curl+shlex.quote(target) if direction=='download' else 'head -c '+str(payload_size)+' /dev/zero | '+curl+' --data-binary @- '+shlex.quote(target)
    active_transfer=subprocess.Popen([str(ADB),'-s',SERIAL,'shell',command],stdout=subprocess.PIPE,stderr=subprocess.PIPE)

def finish_transfer(direction):
    global active_transfer
    stdout,stderr=active_transfer.communicate(timeout=105)
    (out/(direction+'-curl.txt')).write_bytes(stdout+b'\n'+stderr)
    assert active_transfer.returncode==0 and stdout.startswith(b'200 '),(stdout,stderr)
    active_transfer=None
    (out/'transfers.json').write_text(json.dumps(transfers,indent=2),encoding='utf-8')

try:
    require_systemui_build(prefix+'loaded')
    ready=shell('curl --noproxy "*" --silent --show-error --connect-timeout 4 --max-time 6 '+shlex.quote(url+'/ready'),timeout=10)
    assert ready=='OK',ready
    kinds=['cpu','gpu','battery_temp','current','power','network']
    positions=dict(zip(kinds,['L1','C1','R1','L2','C2','R2']))
    spec=grid({k:{'zone':positions[k],'size':12} for k in kinds},only=kinds)
    configure('native-metrics',{'systemui_master':1,'statusbar_grid_v2':spec,'statusbar_height_dp':80,'statusbar_network_display':4,'rm_metrics_custom':0,'rm_network_custom':0})
    for index in range(4):capture('native-sample-'+str(index));time.sleep(1)
    configure('prefixes',{'rm_metrics_custom':1,'rm_metrics_hide_units':1,**{'rm_metric_prefix_'+k:k.upper()+'=' for k in kinds[:-1]}});capture('prefixes')
    configure('empty-prefixes',{'rm_metrics_hide_units':0,**{'rm_metric_prefix_'+k:'' for k in kinds[:-1]}});capture('empty-prefixes')
    configure('charging-only',{'rm_metrics_charging_only':1});capture('charging-only')
    configure('width60',{'rm_metrics_charging_only':0,**{'rm_metric_width_'+k:60 for k in kinds[:-1]}});capture('width60')
    configure('width-auto',{'rm_metrics_custom':0});capture('width-auto')
    configure('network-kb5',{'rm_network_custom':1,'rm_network_unit':1,'rm_network_digits':5,'rm_network_per_second':1,'rm_network_width_dp':0,'rm_network_hide_below_kb':0});capture('network-kb5-idle')
    begin_transfer('upload')
    for mode in [1,2,3,4]:
        configure('upload-mode'+str(mode),{'statusbar_network_display':mode});capture('upload-mode'+str(mode))
    finish_transfer('upload')
    begin_transfer('download')
    for name,values in [('download-mb5',{'rm_network_unit':2,'rm_network_digits':5}),('download-mb1',{'rm_network_digits':1}),('download-auto',{'rm_network_unit':0,'rm_network_per_second':0}),('download-hide',{'rm_network_hide_below_kb':10240})]:
        configure(name,values);capture(name)
    finish_transfer('download')
    configure('network-restored',{'rm_network_custom':0});capture('network-restored')
    configure('native-bar',{'systemui_master':0});capture('native-bar')
finally:
    if active_transfer is not None:
        active_transfer.terminate();active_transfer.communicate(timeout=10)
    server.shutdown();server.server_close()
    (out/'transfers.json').write_text(json.dumps(transfers,indent=2),encoding='utf-8')
    if touched:instrument('set',prefix+'restore',touched)
