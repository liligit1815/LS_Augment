"""Observe real OEM media surfaces and transport callbacks with a silent, self-cleaning session."""
import json, re, subprocess, time, xml.etree.ElementTree as ET
import adb_regression as ar
import native_ui_helpers as ui

version = re.search(r'versionCode=(\d+)', (ar.ROOT/'android/version.properties').read_text())[1]
OUT = ar.ROOT/('out/full-function-audit-20261004/media-native-'+version)
OUT.mkdir(parents=True, exist_ok=True); ar.OUTPUT = OUT; ui.OUTPUT = OUT
baseline = ar.instrument('snapshot', 'baseline')['settings']
values = {'ls_augment_rm_cc_media_cover_enabled':'1','ls_augment_rm_cc_media_opacity':'80',
          'ls_augment_rm_cc_media_blur':'8','ls_augment_rm_cc_media_glow':'1',
          'ls_augment_rm_cc_media_glow_opacity':'60','ls_augment_rm_cc_media_glow_width_dp':'12'}
restore = {key:baseline[key] for key in values}
(OUT/'restore.json').write_text(json.dumps(restore, ensure_ascii=False, indent=2), encoding='utf-8')
proc = None; log = None; observations = []; actions = []; progress_path = None; final = None

def fixture():
    return json.loads(ar.shell('cat '+progress_path, root=True))

def capture(label):
    windows = ui.all_windows(label); folder = OUT/label
    (folder/'screen.png').write_bytes(ar.adb('exec-out', 'screencap -p'))
    nodes = [n for n in ui.nodes(windows) if n.get('visible')]
    assert any(n.get('id','').endswith('/control_panel') for n in nodes), 'Control center must remain visible'
    xml = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
    diag = {n.attrib['name']:n.text for n in ET.fromstring(xml) if any(t in n.attrib.get('name','') for t in ('cc_media','cc_appearance','systemui_last_error'))}
    snap = fixture(); (folder/'fixture.json').write_text(json.dumps(snap, ensure_ascii=False, indent=2), encoding='utf-8')
    (folder/'diagnostics.json').write_text(json.dumps(diag, ensure_ascii=False, indent=2), encoding='utf-8')
    observations.append({'label':label,'fixtureCover':snap['lastCover'],'playing':snap['lastPlaying'],'diagnostics':diag})
    print(label, snap['lastCover'], diag, flush=True)
    return nodes

def click(nodes, resource, callback):
    # OEM's unbound play button can launch a user's last music app. Only touch
    # transport controls after the real card identifies this exact fixture track.
    if not any('无声测试' in n.get('text','') for n in nodes):
        actions.append({'resource':resource,'status':'not-exercised','reason':'OEM card has not adopted the owned fixture'}); return
    # Read current native nodes first. No coordinate is assumed from screenshots.
    found = [n for n in nodes if n.get('id')=='com.android.systemui:id/'+resource and n.get('clickable') and n.get('enabled')]
    if len(found)!=1:
        actions.append({'resource':resource,'status':'not-exercised','reason':'unique enabled native target missing'}); return
    b = list(map(int,re.findall(r'-?\d+',found[0]['bounds']))); assert len(b)==4 and b[2]>b[0] and b[3]>b[1]
    before = fixture()[callback]; ar.shell(f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}')
    deadline=time.monotonic()+3
    while time.monotonic()<deadline:
        after=fixture()[callback]
        if after>before:break
        time.sleep(.1)
    actions.append({'resource':resource,'bounds':b,'callback':callback,'before':before,'after':after,'callbackReceived':after>before})

try:
    ar.instrument('set','appearance-on',values)
    ar.shell('input keyevent 224'); ar.shell('wm dismiss-keyguard')
    ar.shell('am start -W -n ls.augment.com/.SettingsActivity'); ar.shell('cmd statusbar collapse')
    log=(OUT/'instrumentation.txt').open('wb')
    proc=subprocess.Popen([str(ar.ADB),'-s',ar.SERIAL,'shell','am','instrument','-w','-r','-e','operation','c17-runtime-fixture','-e','label','media-native-'+version,
        '-e','seconds','115','-e','coverAfter','35','-e','noCoverAfter','65','-e','restoreCoverAfter','90','ls.augment.regression.c17/ls.augment.com.C17FixtureRunner'],stdout=log,stderr=subprocess.STDOUT)
    started=time.monotonic(); time.sleep(2)
    progress_path=ar.shell('ls -t /data/user/0/ls.augment.regression.c17/cache/c17-runtime-fixture/*.json', root=True).splitlines()[0]
    snap=fixture(); assert snap['elapsedMs']<10000 and not snap['error'], 'Fresh fixture must be active'
    ar.shell('cmd statusbar expand-settings'); time.sleep(1)
    nodes=capture('blue-cover'); click(nodes,'play_pause_button','pauseCallbacks')
    nodes=capture('paused'); click(nodes,'play_pause_button','playCallbacks')
    nodes=capture('playing'); click(nodes,'next_button','nextCallbacks'); capture('next-track')
    for when,label in [(40,'orange-cover'),(70,'no-cover'),(95,'blue-restored')]:
        while time.monotonic()-started<when:time.sleep(max(0,min(.5,when-(time.monotonic()-started))))
        capture(label)
    proc.wait(timeout=30); final=fixture(); assert final['cleanupComplete'] and not final['error'], 'Own fixture state must be removed'
    capture('session-ended')
finally:
    # Let the phone-side fixture's finally release its own session and notifications.
    if proc is not None and proc.poll() is None:proc.wait(timeout=130)
    if log:log.close()
    if progress_path:
        try:final=fixture()
        except Exception:pass
    ar.instrument('set','restore',restore)
    after=ar.instrument('snapshot','restored')['settings']; restored=all(after.get(k)==v for k,v in restore.items())
    (OUT/'report.json').write_text(json.dumps({'version':version,'observations':observations,'transportActions':actions,'fixtureFinal':final,'settingsRestored':restored,
        'evidenceScope':'Actual native controls, screenshots and callback counts; visual appearance requires screenshot review'},ensure_ascii=False,indent=2),encoding='utf-8')
    ar.shell('cmd statusbar collapse'); assert restored
