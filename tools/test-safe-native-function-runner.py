"""Offline fault injection for the actual device runner journal; never contact ADB."""
from pathlib import Path
import importlib.util
import base64
import hashlib
import json
import shlex
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('safe_runner',ROOT/'tools/run-safe-native-function-device.py')
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
checks=0


def check(value, message):
    global checks
    checks+=1
    if not value: raise AssertionError(message)


class Fake:
    def __init__(self, baseline): self.current=dict(baseline);self.calls=[];self.fail=False
    def instrument(self, operation, label, values=None):
        self.calls.append((operation,label,values))
        if operation=='set':
            self.current.update(values)
            if self.fail: self.fail=False;raise RuntimeError('transport disconnected after apply')
            return {'keys':list(values)}
        return {'settings':dict(self.current)}


with tempfile.TemporaryDirectory(prefix='duo-safe-runner-') as tmp:
    folder=Path(tmp);before={'gesture':'1','capture':'custom','unrelated':'keep'}
    journal=module.Journal(folder/'restore.json',before,{'serial':'test'})
    check(journal.data['pending'],'durable recovery starts pending before changes')
    journal.touch(['gesture','capture'])
    disk=json.loads((folder/'restore.json').read_text())
    check(disk['restore']=={'gesture':'1','capture':'custom'},'original nondefault parameters written before transport')
    fake=Fake(before);fake.fail=True
    try: fake.instrument('set','first',{'gesture':'0','capture':'new'})
    except RuntimeError: pass
    check(fake.current['capture']=='new','fault model applies values before connection failure')
    journal=module.Journal(folder/'restore.json')
    journal.restore_config(fake.instrument)
    check(fake.current==before,'fresh recovery object restores pre-crash values')
    check(journal.data['configurationRestored'],'readback is required for restoration success')
    journal.touch(['gesture']);fake.current['gesture']='new';journal.touch(['gesture'])
    check(journal.data['restore']['gesture']=='1','second write never replaces first baseline')
    fake.current['gesture']='0' # Old Java finally writes default instead of original.
    journal.restore_config(fake.instrument)
    check(fake.current['gesture']=='1','outer restoration repairs Java default-finally override')
    fake.current['unrelated']='external-change'
    try: journal.restore_config(fake.instrument);raise AssertionError('unexpected acceptance')
    except RuntimeError: pass
    check(fake.current['unrelated']=='external-change','unrelated external value is never silently overwritten')
    check(not journal.data['configurationRestored'] and journal.data['pending'],'unexpected external mutation retains unresolved journal')
    check('unrelated' in journal.data['configurationDifferences'],'unrelated drift is explicitly reported')
    original_restore=dict(journal.data['restore'])
    try: journal.touch(['removed_legacy_key']);raise AssertionError('unexpected acceptance')
    except ValueError: pass
    check(journal.data['restore']==original_restore,'retired key fails before modification')
    fake.current=dict(before);fake.fail=True
    try: journal.restore_config(fake.instrument);raise AssertionError('unexpected acceptance')
    except RuntimeError: pass
    check(module.Journal(folder/'restore.json').data['pending'],'failed recovery transport cannot clear the durable pending flag')
    journal.restore_config(fake.instrument)
    check(fake.current==before,'repeated recovery converges after an ambiguous restoration write')
    check(not list(folder.glob('*.tmp')),'atomic journal leaves no incomplete temporary file')

    # Exercise real cleanup with an instrument adapter, without constructing any Android transport.
    runner=object.__new__(module.Runner)
    runner.folder=folder;runner.journal=journal;runner.report={};runner.instrument=fake.instrument
    runner.cleanup()
    check(not journal.data['pending'],'successful complete cleanup closes journal only after full readback')
    check(json.loads((folder/'report.json').read_text())['restoration']['configurationRestored'],'persistent final report records verified restoration')
    journal.data['nativeCapturePending']={'label':'unknown-output','before':[]};journal.data['pending']=True;journal.save()
    try: runner.cleanup();raise AssertionError('unexpected acceptance')
    except RuntimeError: pass
    check(journal.data['pending'],'unidentified native gallery output is not treated as a fully cleaned run')
    check('no unknown gallery file was removed' in journal.data['cleanupErrors'][0],'uncertain output is retained and called out explicitly')

    journal.data['nativeCapturePending']=None;journal.data['ownedFiles']=[{'path':'/data/local/tmp/owned.mp4','sha256':'a'*64}]
    class ChangedFile:
        def __init__(self):self.commands=[]
        def shell(self,command,root=False):
            self.commands.append(command)
            return 'exists' if command.startswith('if [') else 'b'*64+' owned.mp4'
    runner.ar=ChangedFile()
    try: runner.cleanup();raise AssertionError('unexpected acceptance')
    except RuntimeError: pass
    check(not any(command.startswith('rm ') for command in runner.ar.commands),'changed generated artifact is never deleted')
    check(journal.data['pending'] and len(journal.data['ownedFiles'])==1,'changed file retains exact ownership record for manual review')

    journal.data['ownedFiles']=[];journal.data['plannedFiles']=[{'path':'/data/local/tmp/pending.mp4','purpose':'interrupted'}]
    try: runner.cleanup();raise AssertionError('unexpected acceptance')
    except RuntimeError: pass
    check(journal.data['pending'],'creation interrupted before checksum cannot silently close recovery')
    check(any('no confirmed hash' in value for value in journal.data['cleanupErrors']),'planned-file ambiguity is explicit')
    journal.data['plannedFiles']=[]

    journal.data['ownedFiles']=[{'path':'/sdcard/Pictures/Screenshots/owned.jpg','sha256':'a'*64,
                                'mediaUri':'content://media/external/file/72','mediaData':'/storage/emulated/0/Pictures/Screenshots/owned.jpg'}]
    class ChangedMedia:
        def __init__(self):self.commands=[]
        def shell(self,command,root=False):
            self.commands.append(command)
            if command.startswith('if ['):return 'exists'
            if command.startswith('sha256sum'):return 'a'*64+' owned.jpg'
            return 'Row: 0 _data=/storage/emulated/0/Pictures/foreign.jpg'
    runner.ar=ChangedMedia()
    try: runner.cleanup();raise AssertionError('unexpected acceptance')
    except RuntimeError: pass
    check(not any(command.startswith('content delete') for command in runner.ar.commands),'reused MediaStore row cannot delete a different gallery entry')
    check(journal.data['pending'],'changed MediaStore row retains durable ownership record')

    media_item=dict(journal.data['ownedFiles'][0])
    class OemMedia:
        def __init__(self,row='owned',hash_after_delete=None,query_error=False):
            self.row=row;self.hash='a'*64;self.exists=True;self.commands=[]
            self.hash_after_delete=hash_after_delete;self.query_error=query_error;self.root_content=[];self.delete_error=False
        def shell(self,command,root=False):
            self.commands.append(command)
            if command.startswith('content '):self.root_content.append(root)
            if command.startswith('if ['):return 'exists' if self.exists else ''
            if command.startswith('sha256sum'):return self.hash+' owned.jpg'
            if command.startswith('content query'):
                if self.query_error:return 'Permission Denial: cannot query MediaStore'
                if self.row=='missing':return 'No result found.'
                return 'Row: 0 _data='+('/storage/emulated/0/Pictures/Screenshots/owned.jpg' if self.row=='owned' else '/storage/emulated/0/Pictures/foreign.jpg')
            if command.startswith('content delete'):
                if self.delete_error:return 'Error while accessing provider: java.lang.IllegalArgumentException: UID 0 has no associated package'
                self.row='missing'
                if self.hash_after_delete:self.hash=self.hash_after_delete
                return 'Deleted 1 rows.' # Reproduce NX809J: physical file remains.
            if command.startswith('rm '):self.exists=False;return ''
            raise AssertionError(command)
    runner.ar=OemMedia();runner.remove_owned_media_file(media_item)
    check(not runner.ar.exists and runner.ar.row=='missing','OEM row-only deletion also removes reverified exact owned physical file')
    check(sum(c.startswith('sha256sum') for c in runner.ar.commands)>=2,'hash is rechecked after deleting MediaStore row')
    check(runner.ar.root_content and not any(runner.ar.root_content),'MediaStore uses shell identity for both query and deletion')
    runner.ar=OemMedia(row='missing');runner.remove_owned_media_file(media_item)
    check(not runner.ar.exists and not any(c.startswith('content delete') for c in runner.ar.commands),
          'fresh recovery can clean same-hash owned file whose recorded row was already deleted')
    for description,transport in [('reused row',OemMedia(row='foreign')),
                                  ('changed file after row delete',OemMedia(hash_after_delete='b'*64)),
                                  ('failed query is not absence',OemMedia(query_error=True))]:
        runner.ar=transport
        try:runner.remove_owned_media_file(media_item);raise AssertionError('unexpected acceptance')
        except RuntimeError:pass
        check(transport.exists and not any(c.startswith('rm ') for c in transport.commands),
              'uncertain/foreign media remains untouched: '+description)
    runner.ar=OemMedia(row='missing');runner.ar.hash='b'*64
    try:runner.remove_owned_media_file(media_item);raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(runner.ar.exists and not any(c.startswith('rm ') for c in runner.ar.commands),
          'missing MediaStore row alone never authorizes deleting changed file')
    runner.ar=OemMedia(row='missing')
    try:runner.remove_owned_media_file(dict(media_item,mediaData='/storage/emulated/0/Pictures/foreign.jpg'));raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(not runner.ar.commands,'journaled row path must have originally matched owned path, even when row is absent')
    runner.ar=OemMedia();runner.ar.delete_error=True
    try:runner.remove_owned_media_file(media_item);raise AssertionError('unexpected acceptance')
    except RuntimeError as error:check('UID 0' in str(error),'exit-zero provider exception is surfaced explicitly')
    check(runner.ar.exists and not any(c.startswith('rm ') for c in runner.ar.commands),
          'provider deletion error never falls through to physical-file deletion')

    journal.data['ownedFiles']=[];journal.data['fixtureInstallAttempted']=True;journal.data['fixtureWasPresent']=False
    journal.data['fixtureSha256']='a'*64;runner.package_hash=lambda:'b'*64
    try: runner.cleanup();raise AssertionError('unexpected acceptance')
    except RuntimeError: pass
    check(journal.data['pending'],'a replaced fixture package cannot be silently uninstalled')
    check(any('identity changed' in value for value in journal.data['cleanupErrors']),'identity mismatch restoration failure is explicit')

    journal.data['fixtureWasPresent']=True
    runner.package_hash=lambda:(_ for _ in ()).throw(AssertionError('must not inspect/remove pre-existing fixture'))
    runner.cleanup()
    check(not journal.data['pending'],'a fixture which predated the run is preserved')

    import numpy as np
    white=np.full((2688,1216,3),255,dtype=np.uint8)
    check(module.Runner.bar_pixels(white)==0,'white fixture has no false icon ink')
    white[45:100,570:645]=0
    check(module.Runner.bar_pixels(white)==0,'camera cutout cannot masquerade as icon ink')
    white[65:100,80:180]=0
    check(module.Runner.bar_pixels(white)==3500,'actual physical glyph pixels enter capture measurement')

    class NativeRecorder:
        def __init__(self, values=None, pid=''):
            self.values = dict(values or {}); self.pid = pid; self.commands=[]; self.fail_put=False
            self.apk=module.RECORDER_APK_SHA256
            self.position=None;self.backup=None;self.temporary=None
            self.boot='12345678-1234-1234-1234-123456789abc';self.start_ticks='700'
        def adb(self,*args,**kwargs):
            self.commands.append(args)
            if args[0]=='shell' and args[1]=='pidof '+module.RECORDER:return self.pid.encode()
            raise AssertionError('Unexpected transport '+str(args))
        def shell(self, command, root=False):
            self.commands.append(command)
            words=shlex.split(command)
            if words[:2]==['pm','path']:return 'package:/system_ext/priv-app/ZteScreenshot_MFV/ZteScreenshot_MFV.apk'
            if words[0]=='sha256sum':
                return (hashlib.sha256(self.temporary).hexdigest() if '.duo-audit-' in command else self.apk)+' file'
            if words[:2]==['am','force-stop']:self.pid='';return ''
            if words[0]=='pidof':return self.pid
            if words[:2]==['cat','/proc/sys/kernel/random/boot_id']:return self.boot
            if words[0]=='cat' and words[1].endswith('/stat'):
                return self.pid+' (zte screenshot) S '+'0 '*18+self.start_ticks+' 0'
            if command.startswith('if [ -f '):
                raw=self.backup if '.xml.bak' in command else self.position
                return 'ABSENT' if raw is None else base64.b64encode(raw).decode()
            if words[0]=='stat':return '10001 10001 660'
            if command.startswith('if [ -e '):return 'exists' if self.temporary is not None else ''
            if words[0]=='printf':self.temporary=base64.b64decode(words[2]);return ''
            if words[0]=='mv':self.position=self.temporary;self.temporary=None;return ''
            if words[0] in ('chown','chmod','restorecon'):return ''
            if words[0]=='rm':
                if '.duo-audit-' in words[-1]:self.temporary=None
                elif words[-1].endswith('.bak'):self.backup=None
                else:self.position=None
                return ''
            if words[0]=='settings':
                assert words[1:3]==['--user','0']
                operation,namespace,key=words[3:6]; identity=(namespace,key)
                if operation=='get':return self.values.get(identity,'null')
                if operation=='delete':self.values.pop(identity,None)
                elif operation=='put':self.values[identity]=words[6]
                else:raise AssertionError(operation)
                if self.fail_put:self.fail_put=False;raise RuntimeError('disconnect after native restore applied')
                return ''
            if words[:2]==['input','tap']:return ''
            raise AssertionError('Unexpected shell '+command)

    recorder=NativeRecorder({('system','0'):'1',('system','record_sound_index'):'3'})
    native_journal=module.Journal(folder/'native-restore.json',before,{'serial':'test'})
    runner.journal=native_journal;runner.ar=recorder;runner.observe=lambda label:[]
    runner.prepare_recorder()
    native_baseline=json.loads(native_journal.path.read_text())['nativeRecorderSettings']
    check(native_baseline['system']['0']=='1' and native_baseline['system']['1'] is None,
          'native nondefault and absent audio values are durable before opening recorder')
    check(native_baseline['system']['selectRecordTypeSwitchOn'] is None,
          'native full-screen default absence is preserved, not replaced with one')
    check(not any(isinstance(c,str) and (' put ' in c or ' delete ' in c) for c in recorder.commands),
          'native preflight does not change audio settings')

    # A cold screenshot process with still-identical preferences needs no stop/write.
    recorder.pid='45';runner.restore_recorder_settings()
    check(native_journal.data['nativeRecorderSettingsRestored'] and recorder.pid=='45',
          'failed-before-recorder-open can verify identical preferences without killing background screenshot app')
    native_journal.data.update(recorderUiMayBeOpen=True,recorderPid='45',recordingMayBeActive=False)
    runner.claim_recorder()
    def process_replaced_during_observation(label):
        recorder.start_ticks='999'
        return []
    runner.observe=process_replaced_during_observation;recorder.commands=[]
    try:runner.close_recorder();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.pid=='45' and not any(isinstance(c,str) and c.startswith('am force-stop') for c in recorder.commands),
          'process replaced during UI observation is checked again before force-stop')
    recorder.start_ticks='700';runner.observe=lambda label:[]
    native_journal.save();recorder.values.update({('system','0'):'0',('system','1'):'0',
                                                  ('system','record_sound_index'):'0',('system','selectRecordTypeSwitchOn'):'1'})
    runner.close_recorder()
    check(recorder.pid=='' and not native_journal.data['recorderUiMayBeOpen'],
          'self-opened unstarted floating UI is closed after runtime-check failure')
    check(not native_journal.data['recordingMayBeActive'],'unstarted floating UI does not acquire an active recording')
    runner.restore_recorder_settings()
    check(recorder.values=={('system','0'):'1',('system','record_sound_index'):'3'},
          'native restore reinstates nondefaults and deletes originally absent keys')
    stop_index=recorder.commands.index('am force-stop '+module.RECORDER)
    writes=[i for i,c in enumerate(recorder.commands) if isinstance(c,str) and (' put ' in c or ' delete ' in c)]
    check(all(i>stop_index for i in writes),'native settings restored only after app observers exit')
    check(native_journal.data['nativeRecorderSettingsReadback']==native_baseline,
          'native restoration success uses full actual readback')
    recorder.position=b'<map><int name="record_window_x" value="15"/><int name="record_window_y" value="20"/></map>'
    runner.restore_recorder_position()
    check(recorder.position is None and native_journal.data['nativeRecorderPositionRestored'],
          'position file absent before test is removed only after validating its two known keys')
    recorder.position=b'<map><string name="foreign">changed</string></map>'
    try:runner.restore_recorder_position();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.position is not None,'unrelated added preference is preserved instead of deleting whole file')
    original_position=b'<?xml version="1.0" encoding="utf-8"?><map><int name="record_window_x" value="77"/></map>'
    recorder.position=original_position;runner.prepare_recorder_position()
    recorder.position=b'<map><int name="record_window_x" value="15"/><int name="record_window_y" value="20"/></map>'
    recorder.backup=original_position
    runner.restore_recorder_position()
    check(recorder.position==original_position and recorder.backup is None,
          'existing position preferences are restored byte-for-byte and owned interrupted backup removed')
    check(any(isinstance(c,str) and c.startswith('chown 10001:10001') for c in recorder.commands),
          'restored original preferences retain saved Android app ownership')

    recorder.temporary=b'foreign replacement'
    native_journal.data.update(nativeRecorderPositionTemporaryOwned=True,
                               nativeRecorderPositionTemporaryHash=hashlib.sha256(original_position).hexdigest())
    recorder.commands=[]
    try:runner.restore_recorder_position();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.temporary==b'foreign replacement' and not any(isinstance(c,str) and c.startswith('rm ') for c in recorder.commands),
          'replacement recovery temporary cannot be deleted from stale owned flag')
    recorder.position=b'<map><int name="record_window_x" value="32"/></map>'
    recorder.commands=[]
    try:runner.restore_recorder_position();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(not any(isinstance(c,str) and c.startswith('printf ') for c in recorder.commands),
          'replacement recovery temporary cannot be overwritten during retry')
    recorder.position=original_position;recorder.temporary=None
    runner.restore_recorder_position()
    check(not native_journal.data['nativeRecorderPositionTemporaryOwned'],
          'atomic rename completed before crash clears an already-absent temporary safely')

    recorder.pid='45';native_journal.data.update(recorderUiMayBeOpen=True,recorderPid='45')
    recorder.start_ticks='701';recorder.commands=[]
    try:runner.close_recorder();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.pid=='45' and not any(isinstance(c,str) and c.startswith('am force-stop') for c in recorder.commands),
          'same numeric PID with different process birth cannot stop a foreign recorder')
    recorder.start_ticks='700';recorder.boot='87654321-1234-1234-1234-123456789abc';recorder.commands=[]
    try:runner.close_recorder();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.pid=='45' and not any(isinstance(c,str) and c.startswith('am force-stop') for c in recorder.commands),
          'same PID/start ticks after reboot still cannot claim a live recorder')
    recorder.boot='12345678-1234-1234-1234-123456789abc';runner.recorder_lease=None;recorder.commands=[]
    try:runner.close_recorder();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.pid=='45' and not any(isinstance(c,str) and c.startswith('am force-stop') for c in recorder.commands),
          'new recovery process does not treat saved boot/PID/start ticks as a live-session ownership grant')
    runner.claim_recorder()

    # Natural OEM exit between pidof and /proc must not trigger UI or force-stop.
    normal_identity = runner.recorder_identity
    def disappeared_identity(pid):
        recorder.pid=''
        raise RuntimeError('cat: /proc/'+pid+'/stat: No such file or directory')
    runner.recorder_identity=disappeared_identity
    recorder.commands=[]
    runner.close_recorder()
    check(not native_journal.data['recorderUiMayBeOpen'] and not any(
          isinstance(c,str) and c.startswith('am force-stop') for c in recorder.commands),
          'confirmed natural exit during identity read completes cleanup without touching another process')
    recorder.pid='45'
    try:runner.assert_owned_recorder(require_alive=True);raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.pid=='','natural exit cannot authorize a pending input action')
    def replaced_identity(pid):
        recorder.pid='99'
        raise RuntimeError('old process disappeared')
    runner.recorder_identity=replaced_identity;recorder.pid='45'
    try:runner.assert_owned_recorder();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.pid=='99','new process after failed identity read remains unowned')
    def unreadable_identity(pid):raise RuntimeError('permission denied')
    runner.recorder_identity=unreadable_identity;recorder.pid='45'
    try:runner.assert_owned_recorder();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(recorder.pid=='45','live process metadata failure never means exited')
    runner.recorder_identity=normal_identity

    recorder.pid='99';native_journal.data.update(recorderUiMayBeOpen=True,recorderPid='45')
    recorder.commands=[]
    try:runner.close_recorder();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    try:runner.restore_recorder_settings();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(not any(isinstance(c,str) and (c.startswith('am force-stop') or ' put ' in c or ' delete ' in c)
                  for c in recorder.commands),'different recorder process is neither stopped nor given old audio preferences')
    check(native_journal.data['recorderUiMayBeOpen'],'unresolved recorder ownership remains recoverable')

    recorder.pid='';native_journal.data.update(recorderUiMayBeOpen=False,recordingMayBeActive=False)
    recorder.values[('system','0')]='0';recorder.fail_put=True
    try:runner.restore_recorder_settings();raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(not module.Journal(native_journal.path).data['nativeRecorderSettingsRestored'],
          'ambiguous native restoration transport cannot claim success')
    runner.journal=module.Journal(native_journal.path);runner.restore_recorder_settings()
    check(runner.journal.data['nativeRecorderSettingsRestored'],'fresh recovery converges after native partial restoration')
    native_journal=runner.journal

    def new_preflight(values, apk=None):
        runner.journal=module.Journal(folder/'gate-restore.json',before,{'serial':'test'})
        runner.ar=NativeRecorder(values)
        if apk:runner.ar.apk=apk
        try:runner.prepare_recorder();raise AssertionError('unexpected acceptance')
        except RuntimeError:pass
        return runner.journal
    check('nativeRecorderSettings' not in new_preflight({},'a'*64).data,
          'unknown native APK cannot reuse this ROM-specific sound adapter')
    check('nativeRecorderSettings' not in new_preflight({('global','record_screen_state'):'2'}).data,
          'paused pre-existing native recording is rejected before changes')
    check('nativeRecorderSettings' not in new_preflight({('system','selectRecordTypeSwitchOn'):'0'}).data,
          'existing area-recording preference is preserved without silently switching to full screen')

    runner.journal=native_journal;runner.ar=NativeRecorder({('system','0'):'1',('system','1'):'1',
                                                          ('system','record_sound_index'):'3',('system','selectRecordTypeSwitchOn'):'1'},pid='45')
    runner.journal.data.update(recorderUiMayBeOpen=True,recorderPid='45')
    runner.claim_recorder()
    real_tap=module.Runner.tap.__get__(runner,module.Runner)
    clicks=[];menu={'open':False}
    def ui_audio(label):
        controls=[{'id':module.RECORDER+':id/sound_type','bounds':'[0,0][20,20]'},
                  {'id':module.RECORDER+':id/start_bn','bounds':'[20,0][40,20]'}]
        if menu['open']:
            controls += [{'id':module.RECORDER+':id/'+name,'checked':runner.ar.values[('system',key)]=='1',
                          'bounds':'[0,20][20,40]'} for name,key in [('record_mic_on_switch','0'),('record_system_on_switch','1')]]
        return controls
    def ui_click(label,identity=None,text=None,before_tap=None):
        if before_tap:before_tap()
        clicks.append(identity)
        if identity.endswith('/sound_type'):menu['open']=True
        if identity.endswith('/record_mic_on_switch'):runner.ar.values[('system','0')]='0'
        if identity.endswith('/record_system_on_switch'):runner.ar.values[('system','1')]='0'
        a,b=runner.ar.values[('system','0')],runner.ar.values[('system','1')]
        runner.ar.values[('system','record_sound_index')]=('0' if a==b=='0' else '3' if a==b=='1' else '1' if a=='1' else '2')
    runner.observe=ui_audio;runner.tap=ui_click
    original_sleep=module.time.sleep;module.time.sleep=lambda seconds:None
    try:runner.mute_recorder('native-audio')
    finally:module.time.sleep=original_sleep
    check([c.rsplit('/',1)[1] for c in clicks]==['sound_type','record_mic_on_switch','record_system_on_switch'],
          'native mute is exercised through observed sound menu and both actual switches')
    check(json.loads((folder/'native-audio-audio-gate.json').read_text())['muted'],
          'native mute evidence is written only after all three actual settings equal zero')

    tile_node={'package':'com.android.systemui','text':'录屏','clickable':True,'enabled':True,
               'visible':True,'bounds':'[645,1505][830,1744]'}
    observed=[0];tile_clicks=[]
    def animated_tiles(label):
        observed[0]+=1
        return [dict(tile_node,visible=observed[0]>=3)]
    runner.observe=animated_tiles
    def tap_tile(label,identity=None,text=None,before_tap=None):
        if before_tap:before_tap()
        tile_clicks.append(text)
    runner.tap=tap_tile;module.time.sleep=lambda seconds:None
    try:runner.tap_stable_recorder_tile('settling')
    finally:module.time.sleep=original_sleep
    check(observed[0]==4 and tile_clicks==['录屏'],'tile waits for two matching visible fresh observations after hidden animation frames')
    runner.observe=lambda label:[dict(tile_node,visible=False)];tile_clicks=[]
    runner.journal.data['recorderUiMayBeOpen']=False
    module.time.sleep=lambda seconds:None
    try:
        try:runner.tap_stable_recorder_tile('still-hidden');raise AssertionError('unexpected acceptance')
        except RuntimeError:pass
    finally:module.time.sleep=original_sleep
    check(not tile_clicks and not runner.journal.data['recorderUiMayBeOpen'],
          'all invisible retries do not click or claim a recorder-open attempt')
    runner.observe=ui_audio;runner.journal.data['recorderUiMayBeOpen']=True
    runner.claim_recorder()
    check(not runner.journal.data['recorderLaunchPending'],'actual recorder process claim resolves the launch before recording/cleanup')

    runner.tap=real_tap;runner.ar.values[('system','0')]='1';runner.ar.commands=[]
    try:runner.start_muted_recording('blocked');raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(not any(isinstance(c,str) and c.startswith('input tap') for c in runner.ar.commands),
          'unmuted source cannot click the start control')
    runner.ar.values[('system','0')]='0'
    def begin(label):
        runner.journal.data['nativeCapturePending']={'label':label,'before':[]};runner.journal.save()
    runner.capture_begin=begin
    def late_change(label):
        nodes=ui_audio(label);runner.ar.values[('system','1')]='1';return nodes
    runner.observe=late_change;runner.ar.commands=[]
    try:runner.start_muted_recording('stale-gate');raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(not any(isinstance(c,str) and c.startswith('input tap') for c in runner.ar.commands),
          'audio change during slow UI observation is caught immediately before input')
    check(runner.journal.data['nativeCapturePending']['triggerAttempted'] is False,
          'late gate rejection is distinguished from an ambiguous sent recording trigger')
    runner.observe=lambda label:[];runner.close_recorder()
    check(runner.journal.data['nativeCapturePending'] is None,
          'never-sent start does not leave a fictitious unknown gallery artifact')

    def box(kind,payload):return (len(payload)+8).to_bytes(4,'big')+kind+payload
    def track(handler):return box(b'trak',box(b'mdia',box(b'hdlr',b'\0'*8+handler+b'\0'*12)))
    video=box(b'ftyp',b'isom'+b'\0'*4)+box(b'mdat',b'soun is only compressed bytes')+box(b'moov',track(b'vide'))
    check(module.mp4_handlers(video)==['vide'],'declared video-only track accepted; arbitrary mdat audio text ignored')
    check(module.mp4_handlers(video+box(b'moov',track(b'soun')))==['vide','soun'],
          'real declared audio track is identified for rejection')
    for label,raw in [('truncated',video[:-1]),('invalid-size',b'\0\0\0\4moov'),
                      ('audio-only',box(b'moov',track(b'soun'))),('no-tracks',box(b'mdat',b'vide'))]:
        try:module.mp4_handlers(raw);raise AssertionError('unexpected acceptance')
        except ValueError:pass
        check(True,'malformed/unknown MP4 cannot establish silence: '+label)

runner=object.__new__(module.Runner)
prefix='com.android.packageinstaller:id/'
permission=[{'id':prefix+'alwaysTrust','checked':False},
            {'id':'android:id/button1','text':'允许安装','enabled':True,'clickable':True}]
confirmation=[{'id':prefix+'ok_button','package':'com.android.packageinstaller'}]
frames=iter([[],[],permission,[],confirmation]);allowed=[]
runner.observe=lambda label:next(frames)
runner.tap=lambda label,identity=None:allowed.append(identity)
original_sleep=module.time.sleep;module.time.sleep=lambda seconds:None
try:
    result=runner.await_installer_confirmation('delayed-source')
    check(prefix+'ok_button' in result and allowed==['android:id/button1'],
          'delayed source prompt is handled once before native confirmation is assessed')
    for label,nodes in [('checked',[dict(permission[0],checked=True),permission[1]]),
                        ('missing-trust',[permission[1]]),
                        ('disabled',[permission[0],dict(permission[1],enabled=False)])]:
        runner.observe=lambda _,nodes=nodes:nodes;allowed=[]
        try:runner.await_installer_confirmation(label);raise AssertionError('unexpected acceptance')
        except RuntimeError:pass
        check(not allowed,'unsafe one-time source state cannot cause a tap: '+label)
    runner.observe=lambda _:permission;allowed=[]
    try:runner.await_installer_confirmation('repeated');raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(allowed==['android:id/button1'],'repeated source prompt stops instead of granting again')
    runner.observe=lambda _:[];allowed=[]
    try:runner.await_installer_confirmation('absent');raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(not allowed,'missing installer confirmation is a precondition failure, not a feature verdict')
finally:module.time.sleep=original_sleep

runner=object.__new__(module.Runner)
claims=[]
runner.claim_recorder=lambda:claims.append(True)
menu={'id':module.RECORDER+':id/start_bn','package':module.RECORDER,'enabled':True}
frames=iter([[],[],[menu]])
runner.observe=lambda label:next(frames)
module.time.sleep=lambda seconds:None
try:
    runner.await_recorder_menu('late-menu')
    check(claims==[True],'native recorder ownership is claimed after a delayed actual start control appears')
    runner.observe=lambda label:[];claims=[]
    try:runner.await_recorder_menu('no-menu');raise AssertionError('unexpected acceptance')
    except RuntimeError:pass
    check(not claims,'absent native recorder menu is not claimed or started')
finally:module.time.sleep=original_sleep

class PendingJournal:
    data={'recorderUiMayBeOpen':True,'recorderLaunchPending':True}
runner=object.__new__(module.Runner);runner.journal=PendingJournal()
try:runner.close_recorder();raise AssertionError('unexpected acceptance')
except RuntimeError as error:
    check('unresolved' in str(error),'unresolved asynchronous recorder launch retains recovery instead of clearing a delayed launch')
check(runner.journal.data['recorderUiMayBeOpen'] and runner.journal.data['recorderLaunchPending'],
      'pending native launch is never converted into a false restored state')

class PartialXmlTransport:
    def __init__(self, fail_all=False):self.calls=0;self.fail_all=fail_all
    def shell(self, command, **kwargs):
        self.calls+=1
        if self.fail_all or self.calls==1:return '<map><string'
        return '<map></map>'
with tempfile.TemporaryDirectory(prefix='duo-capture-xml-') as tmp:
    runner=object.__new__(module.Runner);runner.folder=Path(tmp);runner.ar=PartialXmlTransport()
    original_sleep=module.time.sleep;module.time.sleep=lambda _:None
    try:
        runner.capture_state('retry')
        check(runner.ar.calls==4,'partial live XML retried before reading subsequent complete snapshots')
        check((runner.folder/'retry-capture-state.json').exists(),'only complete XML creates a diagnostic observation')
        runner.ar=PartialXmlTransport(True)
        try:runner.capture_state('invalid');raise AssertionError('unexpected acceptance')
        except module.ET.ParseError:pass
        check(runner.ar.calls==6,'unreadable live XML has bounded retry')
        check(not (runner.folder/'invalid-capture-state.json').exists(),'no fabricated record from incomplete telemetry')
    finally:module.time.sleep=original_sleep

with tempfile.TemporaryDirectory(prefix='duo-capture-process-history-') as tmp:
    tree=module.ET.Element('map')
    for index in range(9):
        node=module.ET.SubElement(tree,'string',{'name':str(index)})
        node.text=json.dumps({'process':'com.android.systemui' if index==0 else module.RECORDER,
                              'pid':100+index,'receivedAt':index,'hooks':[]})
    class ProcessHistoryTransport:
        def shell(self,command,**kwargs):
            return module.ET.tostring(tree,encoding='unicode') if 'hook-processes' in command else '<map></map>'
    runner=object.__new__(module.Runner);runner.folder=Path(tmp);runner.ar=ProcessHistoryTransport()
    runner.capture_state('many-clients')
    records=json.loads((Path(tmp)/'many-clients-capture-state.json').read_text())['recentProcesses']
    check(any(row['pid']==100 for row in records),'new short-lived clients cannot evict the older SystemUI process evidence')
    check(len(records)==5 and len([row for row in records if row['process']==module.RECORDER])==4,'client process history stays bounded independently')

helper_spec=importlib.util.spec_from_file_location('gesture_transport',ROOT/'tools/adb_regression.py')
helper=importlib.util.module_from_spec(helper_spec);helper_spec.loader.exec_module(helper)
check(helper.projection_is_idle('MEDIA PROJECTION MANAGER (dumpsys media_projection)\n\nMedia Projection: \n\nnull\n'),'actual NX809J empty projection format is recognized')
check(helper.projection_is_idle('MEDIA PROJECTION MANAGER\n mProjectionGrant = null\n'),'explicit empty legacy grant is recognized')
for projection in ('MEDIA PROJECTION MANAGER\nMedia Projection: package=other.recorder uid=10000',
                   'MEDIA PROJECTION MANAGER\n mProjectionGrant = active', '', 'permission denied',
                   'MEDIA PROJECTION MANAGER\n Media Projection: null.package active'):
    check(not helper.projection_is_idle(projection),'active or unknown projection cannot be treated as idle')
with tempfile.TemporaryDirectory(prefix='duo-case-filter-') as tmp:
    helper.OUTPUT=Path(tmp);commands=[]
    def fake_shell(command, **kwargs):
        commands.append(command)
        return 'INSTRUMENTATION_RESULT: status=pass' if command.startswith('am instrument') else '{}'
    helper.shell=fake_shell
    helper.instrument('back-gesture-customization','single',case_filter='left-custom-right-stock')
    check('-e case left-custom-right-stock' in commands[0],'single gesture case reaches the native Bundle as case, not config values')
    check('-e values' not in commands[0] and 'holdMillis' not in commands[0],'case selection does not write configuration or extend gesture duration')
    for operation, value in [('set','left-custom-right-stock'),('back-gesture-customization','x; input keyevent HOME')]:
        previous=len(commands)
        try:helper.instrument(operation,'invalid',case_filter=value);raise AssertionError('unexpected acceptance')
        except ValueError:pass
        check(len(commands)==previous,'invalid case transport is rejected before shell execution')
    runner=object.__new__(module.Runner);runner.gesture_case='left-custom-right-stock'
    runner.journal=module.Journal(Path(tmp)/'restore.json',{'ls_augment_systemui_master':'1'})
    received=[]
    def filtered_result(operation,label,**kwargs):
        received.append(kwargs)
        return {'backGestureCustomization':{'caseFilter':['left-custom-right-stock'],'passed':True,'configurationRestored':True}}
    runner.instrument=filtered_result
    check(runner.gesture()['status']=='observed' and received==[{'case_filter':'left-custom-right-stock'}],'runner forwards and verifies the requested single case')
    runner.instrument=lambda *args,**kwargs:{'backGestureCustomization':{'passed':True,'configurationRestored':True}}
    try:runner.gesture();raise AssertionError('unexpected acceptance')
    except AssertionError as error:check('requested single case' in str(error),'older unfiltered native result cannot masquerade as a single-case run')

check(sum(len(value) for value in module.FEATURES.values())==9,'suite maps exactly nine inventory entries')
check(module.FEATURES['capture']==['V2-001','V2-002'],'capture does not inflate status-bar feature coverage')
print('Safe native runner: %d offline recovery/pixel assertions passed; no device contacted'%checks)
