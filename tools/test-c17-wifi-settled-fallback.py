"""Offline current-pair fallback contracts. No device actions or native pixel-pass simulation."""
import copy, importlib.util, io, json, tempfile, unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch
from PIL import Image

spec=importlib.util.spec_from_file_location('wifi_legacy_checks',Path(__file__).with_name('test-c17-wifi-assets-device.py'))
legacy=importlib.util.module_from_spec(spec);spec.loader.exec_module(legacy)
m=legacy.m
VERSION={'versionCode':20460,'versionName':'2.0.0-alpha1-test20460'}
PROFILE=dict(legacy.PROFILE,build=20460)
ENV=legacy.ENV
WAS=legacy.REJECT.replace('|20454|','|20460|')
WAB=legacy.DETAIL.replace('build=20454','build=20460')
THEME='2;wifi.signal,level4,whole,'+'a'*64+',0,100,0,0,100,0,control;wifi.activity_inout,default,background,'+'b'*64+',1,100,0,0,35,0,control'

def inventory(history='applied'):
    rows=[{'id':i,'instance':i+':123','surface':'control','state':'visible','capability':'whole_layers','coveredBy':'','states':states,
           'application':history,'matchedState':state,'matchedAsset':asset*64}
          for i,states,state,asset in [('wifi.signal',['level4','default'],'level4','a'),('wifi.activity_inout',['default'],'default','b')]]
    return {'surfaces':{'control':rows},'surfaceObservedAt':{'control':1004500},'runtime':{'activeSurface':'control','enabled':True,'interactive':True}}

def geometry():
    return [{'id':'com.android.systemui:id/'+i,'visible':True,'bounds':'[745,150][791,192]'} for i in ('wifi_combo','wifi_group','wifi_signal','wifi_inout')]+[
        {'id':'com.android.systemui:id/statusIcons','visible':True,'bounds':'[495,150][996,192]'}]

def diagnostics(env=ENV):
    return {'ls_augment_statusbar_wifi_spacing_contract_control_0_wifi':'asset_cells;'+WAS.split(';')[-1],
            'ls_augment_statusbar_wifi_asset_space_control_0_wifi':WAS.replace(ENV,env),
            'ls_augment_statusbar_wifi_asset_budget_control_0_wifi':WAB}


class SettledContracts(legacy.OfflineGuard):
    def snapshot(self,inv=None,geom=None,diag=None,profile=None,required=m.IDS):
        return m.settled_snapshot(inv or inventory(),geom or geometry(),diag or diagnostics(),profile or PROFILE,ENV,1004000,1004000,THEME,required)

    def test_ready_and_latched_applied_are_decoded_facts_not_pixel_verdicts(self):
        for status in ('ready','applied'):
            a=self.snapshot(inventory(status));result=m.settled_pair(a,copy.deepcopy(a))
            self.assertTrue(result['currentStableCapacityObserved']);self.assertFalse(result['pixelPass'])
            self.assertEqual(result['latchedApplied'],list(m.IDS) if status=='applied' else [])
            self.assertIn('independent review',result['nativePixels'])
        with self.assertRaises(RuntimeError):m.require_resource_rows(inventory()['surfaces']['control'],m.IDS,THEME,'control','ready')

    def test_only_configured_member_needs_decode_but_both_native_cells_are_current(self):
        for required in (('wifi.signal',),('wifi.activity_inout',)):
            inv=inventory()
            for row in inv['surfaces']['control']:
                if row['id'] not in required:row.update(application='native_unmapped',matchedAsset='',matchedState='')
            self.snapshot(inv,required=required)
            inv['surfaces']['control'][0]['state']='hidden'
            with self.assertRaises(RuntimeError):self.snapshot(inv,required=required)

    def test_loading_failed_wrong_hash_or_unbound_is_not_a_capacity_pass(self):
        for fields in ({'application':'matched','matchedAsset':'','matchedState':''},{'application':'loading'},
                       {'application':'load_failed'},{'matchedAsset':'c'*64},{'states':['level3','default']},
                       {'coveredBy':'wifi'},{'capability':'observe_only'},{'instance':''},{'surface':'main'}):
            inv=inventory();inv['surfaces']['control'][0].update(fields)
            with self.subTest(fields=fields),self.assertRaises(RuntimeError):self.snapshot(inv)

    def test_duplicate_or_stale_surface_is_not_current(self):
        for mutate in (lambda i:i['surfaces']['control'].append(copy.deepcopy(i['surfaces']['control'][0])),
                       lambda i:i['surfaceObservedAt'].update(control=1003999),
                       lambda i:i['runtime'].update(activeSurface='main'),lambda i:i['runtime'].update(interactive=False)):
            inv=inventory();mutate(inv)
            with self.assertRaises(RuntimeError):self.snapshot(inv)

    def test_sufficient_120px_capacity_is_never_rejection(self):
        d=diagnostics();d['ls_augment_statusbar_wifi_asset_space_control_0_wifi']=WAS.replace(';84;125;',';120;125;')
        d['ls_augment_statusbar_wifi_asset_budget_control_0_wifi']=WAB.replace('consumed=417,limit=84','consumed=381,limit=120').replace(';limit=84;',';limit=120;')
        with self.assertRaises(ValueError):self.snapshot(diag=d)
        d=diagnostics();d['ls_augment_statusbar_wifi_asset_space_control_0_wifi']=WAS.replace(';capacity;',';native_slot;')
        with self.assertRaises(ValueError):self.snapshot(diag=d)

    def test_environment_profile_pair_flags_and_wab_full_native_cost_are_required(self):
        for raw in (WAS.replace(ENV,'c'*64),WAS.replace('|20460|','|20459|'),WAS.replace(';1;1;HSC1',';1;0;HSC1')):
            d=diagnostics();d['ls_augment_statusbar_wifi_asset_space_control_0_wifi']=raw
            with self.assertRaises(ValueError):self.snapshot(diag=d)
        for raw in (WAB.replace('consumed=417','consumed=416'),WAB.replace('reason=bounded','reason=overlap'),WAB.replace('blocker={none}','blocker={unknown}')):
            d=diagnostics();d['ls_augment_statusbar_wifi_asset_budget_control_0_wifi']=raw
            with self.assertRaises(ValueError):self.snapshot(diag=d)

    def test_expanded_offset_clipped_or_ambiguous_pair_geometry_is_not_native(self):
        for index,box in [(0,'[745,150][837,192]'),(3,'[746,150][792,192]'),(4,'[745,150][760,192]')]:
            g=geometry();g[index]['bounds']=box
            with self.assertRaises(RuntimeError):self.snapshot(geom=g)
        g=geometry();g.append(copy.deepcopy(g[0]))
        with self.assertRaises(RuntimeError):self.snapshot(geom=g)

    def test_between_frame_instance_state_draw_history_or_capacity_change_is_unsettled(self):
        a=self.snapshot()
        for mutation in ('instance','states','application','geometry','budget','profile'):
            b=copy.deepcopy(a)
            if mutation=='geometry':b['boxes']['wifi_signal'][0]+=1
            elif mutation=='budget':b['budget']['maxWidth']=83
            elif mutation=='profile':b['budget']['profile'][7]='1300'
            else:b['rows']['wifi.signal'][mutation]={'instance':'new-instance','states':['level3'],'application':'ready'}[mutation]
            with self.assertRaises(RuntimeError):m.settled_pair(a,b)

    def test_modes_are_mutually_exclusive_and_keep_two_key_ownership(self):
        import sys
        with tempfile.TemporaryDirectory() as temp:
            c=m.Collector(Path(temp),VERSION,observe_settled_fallback=True)
            self.assertEqual(c.mutation_keys,m.KEYS);self.assertFalse(c.header_seconds)
            self.assertEqual(c.report['trafficBudget']['maximumSamples'],7)
            for kw in ({'header_seconds':True},{'expect_capacity_rejection':True},{'surfaces':('control','notification')}):
                with self.assertRaises(ValueError):m.Collector(Path(temp),VERSION,observe_settled_fallback=True,**kw)
            for argv in (['--run','--header-seconds'],['--run','--expect-capacity-rejection'],['--run','--surfaces','control,notification'],['--restore-only','--output',temp]):
                with patch.object(sys,'argv',['collector','--observe-settled-fallback',*argv]),patch('sys.stderr'),self.assertRaises(SystemExit):m.main()
        self.adb.assert_not_called();self.shell.assert_not_called()

    def test_seven_phase_flow_includes_missing_and_restore_without_seconds_or_small_edges(self):
        with tempfile.TemporaryDirectory() as temp:
            phases,events=legacy.CompleteFlowTests.flow(self,temp,False,observe_settled_fallback=True)
            self.assertEqual(phases,['user-baseline','signal-only','activity-only','signal-and-activity','bindings-removed','missing-hash-fallback','restored'])
            saves=[e[3] for e in events if e[:2]==('instrument','set')]
            self.assertEqual(set().union(*(set(v) for v in saves)),set(m.KEYS))
            self.assertFalse(any('small-edges' in str(e) for e in events))
            journal=json.loads((Path(temp)/'restore.json').read_text());self.assertTrue(journal['observeSettledFallback'])
            self.assertNotIn('headerSeconds',journal);m.validate_journal(journal)

    def test_failed_settled_phase_restores_all497_and_does_not_continue_imports(self):
        with tempfile.TemporaryDirectory() as temp:
            phases,events=legacy.CompleteFlowTests.flow(self,temp,False,'activity-only',observe_settled_fallback=True)
            self.assertEqual(phases,['user-baseline','signal-only','activity-only'])
            self.assertFalse(any(m.HEADER_SECONDS in (e[3] or {}) for e in events if e[:2]==('instrument','set')))

    def test_settled_mode_refuses_20459_before_any_phone_call(self):
        with tempfile.TemporaryDirectory() as temp:
            c=m.Collector(Path(temp),{'versionCode':20459},observe_settled_fallback=True)
            with self.assertRaises(RuntimeError):c.run()
        self.adb.assert_not_called();self.shell.assert_not_called();self.instrument.assert_not_called()

    def test_capture_executes_bracket_contracts_keeps_eight_frames_and_no_pixel_pass(self):
        for scenario in ('latched','enough-capacity','instance-changed','gif-still-painted'):
            with tempfile.TemporaryDirectory() as temp,patch.object(m.time,'sleep'):
                c=m.Collector(Path(temp),VERSION,observe_settled_fallback=True);c.not_before=1004000
                c.baseline={m.ART:'',m.spacing.SPACING:''};c.expected={m.ART:THEME,m.spacing.SPACING:''}
                c.expected_runtime_values=lambda:dict(c.expected);d=diagnostics(m.environment(c.expected))
                if scenario=='enough-capacity':
                    d['ls_augment_statusbar_wifi_asset_space_control_0_wifi']=d['ls_augment_statusbar_wifi_asset_space_control_0_wifi'].replace(';84;125;',';120;125;')
                    d['ls_augment_statusbar_wifi_asset_budget_control_0_wifi']=WAB.replace('consumed=417,limit=84','consumed=381,limit=120').replace(';limit=84;',';limit=120;')
                xml='<map>'+''.join('<string name="'+k+'">'+v+'</string>' for k,v in d.items())+'</map>'
                windows=legacy.panel();windows[0]['root']['children']=geometry()
                c.observe=lambda label:windows;c.open_control=lambda label:1004000;c.check_process=lambda:None;c.current_profile=lambda:PROFILE
                def instrument(op,label):
                    inv=inventory()
                    if scenario=='instance-changed' and not label.endswith('-before-inventory'):inv['surfaces']['control'][0]['instance']='later-view'
                    return {'statusbarRuntime':{'inventory':inv}}
                c.instrument=instrument;c.read_settings=lambda label:dict(c.expected)
                c.identity={'gateway':'192.168.1.1'};c.ping_binary=c.ping_help='mock'
                counter=[0]
                def png(*args,**kw):
                    im=Image.new('RGB',(1216,2688),'white')
                    if scenario=='gif-still-painted':im.paste((255,0,0) if counter[0]%2 else (0,255,0),(745,150,791,192))
                    counter[0]+=1;raw=io.BytesIO();im.save(raw,format='PNG');return raw.getvalue()
                self.adb.side_effect=png
                self.shell.side_effect=lambda cmd,**kw:xml if cmd.startswith('cat /data/user/0/ls.augment.com/shared_prefs/') else (_ for _ in ()).throw(AssertionError(cmd))
                ping=SimpleNamespace(process=SimpleNamespace(poll=lambda:None),wait=lambda:{'bothDirectionsObserved':True})
                with patch.object(m.traffic,'network_identity',return_value=(c.identity,{})),patch.object(m.traffic,'ping_command',return_value='bounded mock'),patch.object(m.traffic,'OwnedPing',return_value=ping):
                    if scenario=='latched':
                        result=c.capture('signal-and-activity','control',m.IDS)
                        self.assertFalse(result['settledObservation']['pixelPass']);self.assertTrue(result['visualReviewPending'])
                        self.assertEqual(result['settledObservation']['latchedApplied'],list(m.IDS))
                    else:
                        with self.assertRaises((ValueError,RuntimeError)):c.capture('signal-and-activity','control',m.IDS)
                folder=Path(temp)/'signal-and-activity-control'
                self.assertEqual(len(list(folder.glob('frame-*.png'))),8)
                result=json.loads((folder/'geometry-and-runtime.json').read_text());self.assertIn('settledBefore',result)
                self.assertEqual(result['status'],'evidence_collected_visual_review_pending' if scenario=='latched' else 'incomplete')


if __name__=='__main__':unittest.main(verbosity=2)
