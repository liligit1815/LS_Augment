"""Offline contract evidence; never grants runtime/ART admission from DEX matching alone."""
import hashlib
import importlib.util
import json
import re
import zipfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
ROM=ROOT/'out/redmagic12-12.0.15MR1'
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)
sources={};origins={};artifacts={}
for source,path in {
    '1':ROM/'files/system_b/system/framework/services.jar',
    '2':ROM/'files/system_b/system/framework/framework.jar',
    'wifi':ROM/'apex/com.android.wifi/files/javalib/service-wifi.jar',
}.items():
    classes={}
    with zipfile.ZipFile(path) as archive:
        for name in archive.namelist():
            if name.endswith('.dex'):
                values=dex.dex_classes(archive.read(name));classes.update(values)
                origins.update({k:source+'/'+name for k in values})
    sources[source]=classes
    artifacts[source]={'path':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
all_classes=sources['2']|sources['1']|sources['wifi'];checks=[]
owner='Lcom/android/server/wifi/WifiSpeedTestLowLatencyController;'
for cls,kind,member in [
    (owner,'methods','isOnSampleThread()Z'),(owner,'methods','runOnSampleThread(Ljava/lang/Runnable;)V'),
    (owner,'methods','detach()V'),(owner,'fields','mSampleThread:Landroid/os/HandlerThread;'),
    (owner,'fields','mSampleHandler:Landroid/os/Handler;'),
    ('Lcom/android/server/SystemServiceManager;','methods','startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;'),
]:
    flags=all_classes.get(cls,{}).get(kind,{}).get(member)
    checks.append({'class':cls,'member':member,'flags':flags,'passed':flags is not None and not flags&8 and (kind=='fields' or not flags&0x500)})

profiles=[]
for name in ['RootRuntimeProfile.java','RootOwnershipProfile.java','RootProcessGroupProfile.java','RootHiddenRequestProfile.java']:
    text=(ROOT/'android/app/src/main/java/ls/augment/com'/name).read_text(encoding='utf-8')
    members=[]
    text=re.sub(r'new Spec\("D\d+",', 'new MethodSpec(', text)
    declared_sources={('L'+name.replace('.','/')+';'):source for name,source in re.findall(r'new ClassSpec\("([^"]+)","([12]/classes\d*\.dex)"',text)}
    for kind,descriptor,explicit_source,expected_flags in re.findall(r'new (Method|Field)Spec\("(L[^"\s]+;->[^"\s]+)"\s*,\s*(?:"([12]/classes\d*\.dex)"\s*,\s*)?(\d+)',text):
        cls,signature=descriptor.split('->',1)
        source=explicit_source or declared_sources.get(cls)
        methods=all_classes.get(cls,{}).get('fields' if kind=='Field' else 'methods',{})
        members.append({'descriptor':descriptor,'expectedSource':source,'actualSource':origins.get(cls),
                        'present':signature in methods,'flags':methods.get(signature),'expectedFlags':int(expected_flags)})
    profiles.append({'profile':name,'members':members,'matchedShapeAndSource':sum(x['present'] and x['expectedSource']==x['actualSource'] for x in members),
                     'classes':[{'name':cls,'expectedSource':source,'actualSource':origins.get(cls),'present':cls in all_classes} for cls,source in declared_sources.items()]})
critical=(ROOT/'android/app/src/main/java/ls/augment/com/RootCriticalProfile.java').read_text(encoding='utf-8')
pins={}
for name,key in [('SERVICES','1'),('FRAMEWORK','2')]:
    expected=re.search(name+r'_SHA256="([0-9a-f]+)"',critical)[1]
    pins[name]={'expected':expected,'actual':artifacts[key]['sha256'],'matches':expected==artifacts[key]['sha256']}
report={'deviceValidated':False,'wifiPassed':all(c['passed'] for c in checks),'wifiChecks':checks,
        'artifacts':artifacts,'rootProfiles':profiles,'rootArchivePins':pins,
        'rootAdmissionChanged':False,'rootReason':'Different retained archives and execution boundaries require a separately audited profile plus live LSPosed early/ART origin and deoptimization proof; do not replace hashes to bypass admission.'}
output=ROM/'tests/stage3/contracts.json';output.write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
print('Wi-Fi contracts:',sum(c['passed'] for c in checks),'/',len(checks))
for p in profiles: print(p['profile'],p['matchedShapeAndSource'],'/',len(p['members']),'existing method+DEX source matches (not admission)')
print('Root archive pins:',{k:v['matches'] for k,v in pins.items()})
raise SystemExit(0 if report['wifiPassed'] else 1)
