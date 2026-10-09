"""Offline behavioral/fault recovery tests; importing/running never contacts ADB."""
from pathlib import Path
import copy
import importlib.util
import json
import sys
import tempfile
import unittest
from unittest.mock import patch
from types import SimpleNamespace

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT/'tools'))
spec = importlib.util.spec_from_file_location('qs_safe_grid', ROOT/'tools/run-safe-quicksettings-grid-device.py')
grid = importlib.util.module_from_spec(spec); spec.loader.exec_module(grid)
P = grid.P; ID = grid.ID


def baseline(): return {P+'grid':'0', P+'columns':'4', P+'rows':'3', P+'brightness_percent':'0',
    'ls_augment_rm_full_brightness':'0', 'user_unrelated':'preserve'}


class Transport:
    def __init__(self, values): self.values=dict(values); self.calls=[]; self.fail=None
    def __call__(self, operation, label, values=None):
        self.calls.append((operation,label,values))
        if operation=='set':
            if self.fail=='before': self.fail=None; raise ConnectionError('lost before apply')
            self.values.update(values)
            if self.fail=='after': self.fail=None; raise ConnectionError('lost after apply')
        return {'settings':dict(self.values)}


def node(identity, rect, children=(), text='null', clickable=False, visible=True, actions=()):
    return {'id':identity,'bounds':'[%d,%d][%d,%d]'%rect,'text':text,'clickable':clickable,
        'visible':visible,'enabled':True,'class':'android.view.ViewGroup','children':list(children),'actionIds':list(actions)}


def fixture(columns=3, rows=3, scroll=0, duplicate=False, overlap=False, nested=True):
    width,height=600,1200
    pool_top=500-scroll; viewport_bottom=500+rows*220
    tiles=[]
    for i in range(9):
        x=20+(i%columns)*(560//columns); y=pool_top+(i//columns)*220
        rect=(x,y,x+560//columns-10,y+210)
        if overlap and i==1: rect=(20,y,170,y+210)
        name='tile-'+str(i if not duplicate or i!=1 else 0)
        label=node(ID+'tile_label',(rect[0]+5,y+160,rect[2]-5,y+205),text=name,visible=y<viewport_bottom and y+210>100)
        title=node(ID+'title_group',(rect[0],y+155,rect[2],y+210),[label],clickable=nested)
        tiles.append(node('null',rect,[title],clickable=True,visible=label['visible']))
    large=[]
    for i in range(4):
        x=20+(i%2)*290; y=220+(i//2)*150-scroll
        rect=(x,y,x+250,y+100)
        large.append(node('big-'+str(i),rect,[node(ID+'tile_label',(x+10,y+40,x+230,y+80),text='big-'+str(i))],clickable=True))
    pool=node(ID+'control_center_all_tiles',(0,pool_top,600,pool_top+((8//columns)+1)*220),tiles)
    max_scroll=max(0,((8//columns)+1-rows)*220)
    actions=([4096] if scroll<max_scroll else [])+([8192] if scroll>0 else [])
    scroller=node(ID+'content_scroller',(0,100,600,viewport_bottom),large+[pool],actions=actions)
    scroller['scrollable']=bool(max_scroll)
    panel=node(ID+'control_panel',(0,0,600,1200),[scroller],clickable=True)
    return [{'root':panel}],(width,height)


def activity(active=False):
    return '\n'.join(['ACTIVITY MANAGER SETTINGS x','ACTIVITY MANAGER ACTIVITIES x',
        'ACTIVITY MANAGER RUNNING PROCESSES (dumpsys activity processes)',
        '  Active instrumentation:', '    Instrumentation #0: ActiveInstrumentation{xx}' if active else '',
        '  OOM levels:', '  Process OOM control (x)', '  Raw LRU list (x)', '  Process LRU list (x)',
        '  mWakefulness=awake', '  mShuttingDown=false', '  mForceBackgroundCheck=false',
        'ACTIVITY MANAGER USERS (dumpsys activity users)', 'ACTIVITY MANAGER COMPONENT-ALIAS x'])


class RecoveryTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup)
        self.path=Path(self.temp.name)/'restore.json'
        self.j=grid.Journal(self.path,baseline(),{'serial':'local-fake','installedVersion':20454})

    def test_write_ahead_survives_applied_disconnect(self):
        values={P+'grid':'1',P+'columns':'3',P+'rows':'1'}
        self.j.plan(values);transport=Transport(baseline());transport.fail='after'
        with self.assertRaises(ConnectionError):transport('set','trial',values)
        loaded=grid.Journal(self.path);loaded.restore(transport)
        self.assertEqual(transport.values,baseline());self.assertFalse(loaded.data['pending'])

    def test_attempt_not_applied_restores_without_config_write(self):
        self.j.plan({P+'grid':'1'});transport=Transport(baseline());self.j.restore(transport)
        self.assertFalse(any(c[0]=='set' for c in transport.calls));self.assertFalse(self.j.data['pending'])

    def test_restore_write_disconnect_retries_idempotently(self):
        for fail in ['before','after']:
            with self.subTest(fail=fail):
                j=grid.Journal(self.path,baseline(),{});j.plan({P+'grid':'1'})
                transport=Transport(baseline()|{P+'grid':'1'});transport.fail=fail
                with self.assertRaises(ConnectionError):j.restore(transport)
                self.assertTrue(grid.Journal(self.path).data['pending'])
                grid.Journal(self.path).restore(transport)
                self.assertEqual(transport.values,baseline())

    def test_original_nondefault_values_preserved(self):
        original=baseline()|{P+'grid':'1',P+'columns':'7',P+'rows':'5',P+'brightness_percent':'1'}
        j=grid.Journal(self.path,original,{});j.plan({P+'grid':'0',P+'columns':'3',P+'rows':'1',P+'brightness_percent':'0'})
        transport=Transport(original|{P+'grid':'0',P+'columns':'3',P+'rows':'1',P+'brightness_percent':'0'})
        j.restore(transport);self.assertEqual(transport.values,original)

    def test_first_original_not_replaced_by_subsequent_phase(self):
        self.j.plan({P+'columns':'3'});self.j.plan({P+'columns':'5'})
        self.assertEqual(self.j.data['restore'][P+'columns'],'4')
        self.assertEqual(self.j.data['allowed'][P+'columns'],['4','3','5'])

    def test_unknown_later_owned_value_refuses_all_writes(self):
        self.j.plan({P+'columns':'3'});transport=Transport(baseline()|{P+'columns':'8'})
        with self.assertRaisesRegex(ValueError,'Unrecognized later'):self.j.restore(transport)
        self.assertEqual(transport.values[P+'columns'],'8');self.assertFalse(any(c[0]=='set' for c in transport.calls))
        self.assertTrue(grid.Journal(self.path).data['pending'])

    def test_unknown_untouched_key_refuses_next_phase(self):
        with self.assertRaisesRegex(ValueError,'Previously untouched'):
            self.j.verify_before_mutation(baseline()|{P+'rows':'8'})

    def test_unrelated_changed_value_never_overwritten_and_retained_pending(self):
        self.j.plan({P+'grid':'1'});transport=Transport(baseline()|{P+'grid':'1','user_unrelated':'new-user-value'})
        with self.assertRaisesRegex(ValueError,'Final complete'):self.j.restore(transport)
        self.assertEqual(transport.values['user_unrelated'],'new-user-value')
        self.assertEqual(transport.values[P+'grid'],'0');self.assertTrue(self.j.data['pending'])

    def test_missing_new_and_foreign_keys_rejected(self):
        for key in ['sysui_qs_tiles','ls_augment_rm_full_brightness','screen_brightness','unregistered']:
            with self.subTest(key=key),self.assertRaises(ValueError):self.j.plan({key:'0'})
        self.assertEqual(self.j.data['restore'],{})

    def test_tampered_recovery_key_rejected(self):
        self.j.data['restore']['sysui_qs_tiles']='original'
        with self.assertRaisesRegex(ValueError,'foreign'):self.j.recovery_values(baseline())

    def test_tampered_original_rejected(self):
        self.j.plan({P+'grid':'1'});self.j.data['restore'][P+'grid']='1'
        with self.assertRaisesRegex(ValueError,'baseline identity'):self.j.recovery_values(baseline())

    def test_missing_current_owned_value_is_unknown(self):
        self.j.plan({P+'grid':'1'});values=baseline();del values[P+'grid']
        with self.assertRaises(ValueError):self.j.recovery_values(values)

    def test_restore_after_final_snapshot_disconnect_still_pending(self):
        self.j.plan({P+'grid':'1'});transport=Transport(baseline()|{P+'grid':'1'})
        def fail(operation,label,values=None):
            if label=='restore-readback':raise ConnectionError('readback lost')
            return transport(operation,label,values)
        with self.assertRaises(ConnectionError):self.j.restore(fail)
        self.assertTrue(grid.Journal(self.path).data['pending'])
        grid.Journal(self.path).restore(transport);self.assertFalse(grid.Journal(self.path).data['pending'])


class GeometryTests(unittest.TestCase):
    def test_dynamic_nine_regular_four_large_not_nested_title_actions(self):
        g=grid.geometry(*fixture());self.assertEqual(len(g['tiles']),13)
        self.assertEqual(len(g['regularNames']),9);self.assertEqual(len(g['largeNames']),4)
        self.assertFalse(g['overlaps']);self.assertTrue(all(i['fullyReachable'] for i in g['tiles']))
        self.assertEqual([len(r['labels']) for r in g['rows']],[3,3,3])

    def test_one_row_does_not_discard_hidden_native_records(self):
        g=grid.geometry(*fixture(rows=1));self.assertEqual(len(g['regularNames']),9)
        self.assertEqual(len(g['rows']),1);self.assertTrue(g['forward'])
        self.assertEqual(len([i for i in g['tiles'] if i['regular'] and i['fullyReachable']]),3)

    def test_lower_rows_reachable_via_real_scrolled_geometry(self):
        reached=set()
        for scroll in (0,220,440):
            g=grid.geometry(*fixture(rows=1,scroll=scroll))
            reached.update(i['label'] for i in g['tiles'] if i['regular'] and i['fullyReachable'])
        self.assertEqual(reached,{'tile-'+str(i) for i in range(9)})
        self.assertFalse(g['forward']);self.assertTrue(g['backward'])

    def test_five_columns_two_rows_keeps_ninth_tile(self):
        g=grid.geometry(*fixture(columns=5,rows=2));self.assertEqual([len(r['labels']) for r in g['rows']],[5,4])

    def test_overlap_is_reported(self):
        g=grid.geometry(*fixture(overlap=True));self.assertTrue(g['overlaps'])

    def test_duplicate_identity_is_not_guessed(self):
        with self.assertRaisesRegex(ValueError,'Duplicate'):grid.geometry(*fixture(duplicate=True))

    def test_swipe_cannot_cross_header_sliders_or_leave_viewport(self):
        g=grid.geometry(*fixture(rows=1))
        invalid=dict(g,viewportBounds=(0,100,600,580))
        with self.assertRaisesRegex(ValueError,'safe observed'):grid.scroll_path(invalid)
        x1,y1,x2,y2=grid.scroll_path(g)
        self.assertEqual(x1,x2);self.assertGreater(y1-y2,100)
        self.assertGreaterEqual(y2,g['poolBounds'][1]);self.assertLessEqual(y1,1000)

    def test_partial_tile_is_not_credited_as_reachable(self):
        windows,size=fixture(rows=1)
        scroller=windows[0]['root']['children'][0];scroller['bounds']='[0,100][600,570]'
        g=grid.geometry(windows,size)
        self.assertFalse(any(i['regular'] and i['fullyReachable'] for i in g['tiles']))

    def test_actual_archived_tree_detects_real_13_targets(self):
        path=ROOT/'out/full-function-audit-20261004/wifi-spacing-traffic-20453-20261004-045651/baseline-control/result-private.json'
        if not path.is_file(): self.skipTest('Optional historical readonly fixture absent')
        g=grid.geometry(json.loads(path.read_text(encoding='utf-8'))['uiWindows'],(1216,2688))
        self.assertEqual(len(g['regularNames']),9);self.assertEqual(len(g['largeNames']),4)
        self.assertFalse(g['overlaps']);self.assertEqual(len(g['tiles']),13)
        self.assertFalse(any(i['targetId']==ID+'control_panel' for i in g['tiles']))


class PreconditionsTests(unittest.TestCase):
    def test_android36_duplicate_consistent_active_viewport(self):
        raw='Viewport INTERNAL: displayId=0, orientation=0, isActive=[1]\n'*2
        self.assertEqual(grid.orientation(raw),0)

    def test_external_and_inactive_displays_do_not_override_internal(self):
        raw='Viewport INTERNAL: displayId=0, orientation=0, isActive=[1]\nViewport INTERNAL: displayId=1, orientation=1, isActive=[1]\nViewport EXTERNAL: displayId=2, orientation=3, isActive=[1]'
        self.assertEqual(grid.orientation(raw),0)

    def test_ambiguous_missing_or_conflicting_rotation_rejected(self):
        for raw in ['', 'SurfaceOrientation: 0\nSurfaceOrientation: 1',
            'Viewport INTERNAL: displayId=0, orientation=0, isActive=[1]\nSurfaceOrientation: 1',
            'Viewport INTERNAL: displayId=0, orientation=3, isActive=[0]']:
            with self.subTest(raw=raw),self.assertRaises(ValueError):grid.orientation(raw)

    def test_legacy_orientation_is_supported(self): self.assertEqual(grid.orientation('SurfaceOrientation: 2'),2)

    def test_complete_idle_activity_report_required(self):
        self.assertTrue(grid.idle_instrumentation(activity()))
        self.assertFalse(grid.idle_instrumentation(activity(True)))
        for raw in ['Unknown command: instrumentation', '', activity().replace('  mShuttingDown=false','')]:
            with self.subTest(raw=raw[:30]),self.assertRaises(ValueError):grid.idle_instrumentation(raw)

    def test_actual_range_percent_uses_minimum_and_rounding(self):
        self.assertEqual(grid.percent({'min':10,'max':110,'current':60}),50)
        self.assertEqual(grid.percent({'min':0,'max':200,'current':1}),1)
        self.assertEqual(grid.percent({'min':0,'max':255,'current':255}),100)

    def test_unknown_or_invalid_range_never_falls_back_to_native_settings(self):
        for value in [{'min':0,'max':0,'current':0},{'min':0,'max':10,'current':11},{'min':0,'max':float('nan'),'current':0}]:
            with self.subTest(value=value),self.assertRaises(ValueError):grid.percent(value)

    def test_pending_gate_blocks_existing_journal(self):
        with tempfile.TemporaryDirectory() as temp:
            old=grid.safe.AUDIT;self.addCleanup(setattr,grid.safe,'AUDIT',old);grid.safe.AUDIT=Path(temp)
            folder=Path(temp)/'quicksettings-grid-safe-20454-test';folder.mkdir();path=folder/'restore.json'
            path.write_text(json.dumps({'pending':True}),encoding='utf-8')
            with self.assertRaisesRegex(ValueError,'pending'):grid.pending_gate()
            grid.pending_gate(path)

    def test_phone_journal_and_foreign_lease_block_without_mutation(self):
        for pending,lease in [('baseline.json','ABSENT'),('','PRESENT'),('','permission denied')]:
            ar=SimpleNamespace(shell=lambda command,root=False: pending if command.startswith('find ') else lease)
            with self.subTest(pending=pending,lease=lease),self.assertRaises(ValueError):grid.device_pending_gate(ar)
        grid.device_pending_gate(SimpleNamespace(shell=lambda command,root=False:'' if command.startswith('find ') else 'ABSENT'))


class CollectionTests(unittest.TestCase):
    def collector(self, rows=1, scroll=0):
        temp=tempfile.TemporaryDirectory();self.addCleanup(temp.cleanup)
        c=object.__new__(grid.Collector);c.folder=Path(temp.name);c.report={'cases':[]};c.scroll=scroll;c.commands=[]
        def sample():return fixture(rows=rows,scroll=c.scroll)
        def opening(label):
            windows,size=sample();return label,windows,size,grid.geometry(windows,size)
        def shell(command):
            c.commands.append(command)
            args=command.split()
            if args[:2]!=['input','swipe']:raise AssertionError('Unexpected device command in fixture')
            c.scroll=max(0,min(440,c.scroll+(220 if int(args[3])>int(args[5]) else -220)))
        c.ar=SimpleNamespace(shell=shell);c.open_panel=opening;c.observe_full=lambda label:sample();c.check_profile=lambda label:{}
        return c

    def test_three_by_one_collects_all_nine_through_scroll_only(self):
        c=self.collector()
        with patch.object(grid.time,'sleep'): identities=c.grid('three-by-one',dimensions=(3,1))
        self.assertEqual(len(identities['regular']),9);self.assertEqual(len(identities['large']),4)
        self.assertTrue(c.report['cases'][0]['allLabelsReachable']);self.assertEqual(len(c.commands),2)
        self.assertTrue(all(command.startswith('input swipe ') for command in c.commands))

    def test_previous_phase_scroll_is_reset_before_initial_row_assertion(self):
        c=self.collector(scroll=440)
        with patch.object(grid.time,'sleep'): c.grid('reopened',dimensions=(3,1))
        self.assertEqual(len(c.commands),4)
        first=list(map(int,c.commands[0].split()[2:6]));self.assertLess(first[1],first[3])

    def test_scroll_no_progress_is_bounded_and_never_clicked(self):
        c=self.collector();c.ar.shell=lambda command:c.commands.append(command)
        with patch.object(grid.time,'sleep'),self.assertRaisesRegex(ValueError,'twelve'):c.grid('stuck')
        self.assertEqual(len(c.commands),12);self.assertFalse(c.report['cases'][0]['allLabelsReachable'])

    def test_tile_inventory_change_is_not_accepted(self):
        c=self.collector(rows=3)
        with self.assertRaisesRegex(ValueError,'differ from baseline'):c.grid('changed',{'regular':['removed-tile'],'large':[]})

    def test_restore_still_runs_when_native_readback_fails(self):
        c=self.collector();j=grid.Journal(c.folder/'restore.json',baseline(),{'nativeBaseline':{}});j.plan({P+'grid':'1'})
        t=Transport(baseline()|{P+'grid':'1'});c.journal=j;c.instrument=t
        def broken():raise ConnectionError('native read failed')
        c.native=broken
        with self.assertRaises(RuntimeError):c.restore()
        self.assertEqual(t.values,baseline());self.assertFalse(j.data['pending']);self.assertTrue(c.report['cleanupErrors'])


if __name__=='__main__': unittest.main(verbosity=2)
