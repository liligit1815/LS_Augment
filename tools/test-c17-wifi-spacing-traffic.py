"""Offline safety/regression tests. No ADB operation is permitted by this harness."""
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('wifi_traffic', Path(__file__).with_name('run-c17-wifi-spacing-traffic-device.py'))
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)

ROUTES = 'default via 192.168.10.1 dev wlan0 table 1030 proto static\n192.168.10.0/24 dev wlan0 table 1030 scope link\n'
ADDRESS = '30: wlan0    inet 192.168.10.34/24 brd 192.168.10.255 scope global wlan0\n'
LINK = '30: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 state UP mode DEFAULT\n'
HELP = 'Usage: ping [-c count] [-i interval] [-s packetsize] [-w deadline] [-I interface] destination'
IDENTITY = {'interface':'wlan0','gateway':'192.168.10.1','localAddress':'192.168.10.34','prefix':'192.168.10.0/24'}
VERSION = {'versionCode':20453,'versionName':'2.0.0-alpha1-test20453'}


class SafetyTests(unittest.TestCase):
    def setUp(self):
        self.shell = patch.object(m.ar, 'shell', side_effect=AssertionError('Unmocked device shell is forbidden')).start()
        self.adb = patch.object(m.ar, 'adb', side_effect=AssertionError('Unmocked ADB is forbidden')).start()
        self.instrument = patch.object(m.ar, 'instrument', side_effect=AssertionError('Unmocked instrumentation is forbidden')).start()
        self.popen = patch.object(m.subprocess, 'Popen', side_effect=AssertionError('Unmocked child process is forbidden')).start()
        self.addCleanup(patch.stopall)

    def test_loaded_build_rereads_transient_xml_then_rechecks_pid(self):
        record={'pid':7,'process':'com.android.systemui','moduleVersion':VERSION['versionName']}
        raw='<map><string name="current">'+json.dumps(record)+'</string></map>'
        self.shell.side_effect=['7','<map>',raw,'7']
        with patch.object(m.time,'sleep') as pause:
            self.assertEqual(m.loaded_systemui(VERSION['versionName']),record)
        self.assertEqual(self.shell.call_count,4)
        pause.assert_called_once_with(.15)

    def test_loaded_build_persistent_malformed_json_stays_rejected(self):
        self.shell.side_effect=['7']+['<map><string name="current">{</string></map>']*4
        with patch.object(m.time,'sleep') as pause, self.assertRaises(json.JSONDecodeError):
            m.loaded_systemui(VERSION['versionName'])
        self.assertEqual(self.shell.call_count,5)
        self.assertEqual(pause.call_count,3)

    def test_loaded_build_never_accepts_changed_pid(self):
        record={'pid':7,'process':'com.android.systemui','moduleVersion':VERSION['versionName']}
        self.shell.side_effect=['7','<map><string>'+json.dumps(record)+'</string></map>','8']
        with self.assertRaisesRegex(RuntimeError,'process changed'):
            m.loaded_systemui(VERSION['versionName'])

    def test_loaded_build_wrong_version_is_not_retried(self):
        record={'pid':7,'process':'com.android.systemui','moduleVersion':'wrong'}
        self.shell.side_effect=['7','<map><string>'+json.dumps(record)+'</string></map>','7']
        with patch.object(m.time,'sleep') as pause, self.assertRaisesRegex(RuntimeError,'installed build'):
            m.loaded_systemui(VERSION['versionName'])
        pause.assert_not_called()

    def test_exact_lan_gateway(self):
        self.assertEqual(m.verified_gateway(ROUTES,ADDRESS,LINK),IDENTITY)
        m.verify_route_get('192.168.10.1 dev wlan0 src 192.168.10.34 uid 2000\n cache',IDENTITY)

    def test_unusable_or_nonlocal_routes_fail_closed(self):
        candidates = ['', ROUTES.replace('wlan0','rmnet_data0'), ROUTES.replace('192.168.10.1','8.8.8.8'),
                      ROUTES+'default via 192.168.10.2 dev wlan0 table 1',
                      ROUTES.replace('192.168.10.1','192.168.10.34'),
                      ROUTES.replace('192.168.10.1','192.168.10.255'),
                      ROUTES.replace('192.168.10.1','192.168.11.1'),
                      'default via 192.168.10.1 dev wlan0 linkdown']
        for raw in candidates:
            with self.subTest(raw=raw), self.assertRaises(m.NetworkUnavailable):
                m.verified_gateway(raw,ADDRESS,LINK)
        for addr in ['', ADDRESS.replace('/24','/32')]:
            with self.assertRaises(m.NetworkUnavailable): m.verified_gateway(ROUTES,addr,LINK)
        with self.assertRaises(m.NetworkUnavailable): m.verified_gateway(ROUTES,ADDRESS,LINK.replace(',UP,',','))

    def test_route_lookup_cannot_redirect(self):
        for raw in ['RTNETLINK answers: Network is unreachable','192.168.10.1 via 192.168.10.2 dev wlan0 src 192.168.10.34',
                    '192.168.10.1 dev rmnet_data0 src 192.168.10.34','192.168.10.1 dev wlan0 src 192.168.10.35',
                    '192.168.10.2 dev wlan0 src 192.168.10.34','']:
            with self.subTest(raw=raw),self.assertRaises(m.NetworkUnavailable): m.verify_route_get(raw,IDENTITY)

    def test_command_is_foreground_bounded_and_lan_only(self):
        command=m.ping_command('/system/bin/ping',HELP,IDENTITY)
        self.assertEqual(command,'exec /system/bin/ping -n -I wlan0 -c 100 -s 512 -i 0.25 -w 28 192.168.10.1')
        self.assertNotIn('&',command);self.assertNotIn('su ',command)
        for binary,help_text,identity in [('/data/local/tmp/ping',HELP,IDENTITY),('/system/bin/ping','unsupported',IDENTITY),
                    ('/system/bin/ping',HELP,dict(IDENTITY,gateway='1.1.1.1')),
                    ('/system/bin/ping',HELP,dict(IDENTITY,interface='rmnet_data0'))]:
            with self.assertRaises(m.NetworkUnavailable):m.ping_command(binary,help_text,identity)
        with patch.object(m,'PING_COUNT',129),self.assertRaises(AssertionError):m.ping_command('/system/bin/ping',HELP,IDENTITY)
        with patch.object(m,'PING_BYTES',513),self.assertRaises(AssertionError):m.ping_command('/system/bin/ping',HELP,IDENTITY)
        with patch.object(m,'PING_INTERVAL',.1),self.assertRaises(AssertionError):m.ping_command('/system/bin/ping',HELP,IDENTITY)
        with patch.object(m,'PING_DEADLINE',31),self.assertRaises(AssertionError):m.ping_command('/system/bin/ping',HELP,IDENTITY)

    def test_statistics_not_inferred_from_interface_totals(self):
        self.assertEqual(m.parse_ping_statistics('100 packets transmitted, 98 received, 2% packet loss, time 25100ms'),
                         {'transmitted':100,'received':98,'packetLossPercent':2.0})
        self.assertEqual(m.parse_ping_statistics('1 packets transmitted, 0 packets received, 100% packet loss')['received'],0)
        self.assertIsNone(m.parse_ping_statistics('Permission denied'))

    def test_owned_foreground_process_naturally_exits(self):
        class Proc:
            pid=4141
            def wait(self,timeout): self.timeout=timeout;return 0
        p=Proc()
        def spawn(command,**kw):
            self.assertEqual(command[:4],[str(m.ar.ADB),'-s',m.ar.SERIAL,'shell'])
            self.assertIn('-w 28',command[-1])
            kw['stdout'].write(b'100 packets transmitted, 100 received, 0% packet loss\n');kw['stdout'].flush()
            return p
        self.popen.side_effect=spawn
        with tempfile.TemporaryDirectory() as temp,patch.object(m,'interface_counters',return_value={'rx_packets':1}):
            ping=m.OwnedPing(m.ping_command('/system/bin/ping',HELP,IDENTITY),Path(temp),IDENTITY)
            report=ping.wait()
            self.assertTrue(report['bothDirectionsObserved'])
            self.assertEqual(report['statistics']['transmitted'],100)
            self.assertLessEqual(p.timeout,34)
            self.assertTrue((Path(temp)/'traffic.json').exists())
        self.shell.assert_not_called()

    def test_transport_timeout_only_terminates_owned_host_client(self):
        class Proc:
            pid=4141;terminated=False;n=0
            def wait(self,timeout):
                self.n+=1
                if self.n==1:raise subprocess.TimeoutExpired('owned adb',timeout)
                return 0
            def terminate(self):self.terminated=True
        p=Proc();self.popen.side_effect=None;self.popen.return_value=p
        with tempfile.TemporaryDirectory() as temp,patch.object(m,'interface_counters',return_value={}):
            ping=m.OwnedPing(m.ping_command('/system/bin/ping',HELP,IDENTITY),Path(temp),IDENTITY)
            report=ping.wait()
        self.assertTrue(p.terminated);self.assertTrue(report['hostTransportTimedOut'])
        self.assertFalse(report['bothDirectionsObserved']);self.shell.assert_not_called()

    def fixture(self,output,fail_phase=None):
        baseline={m.spacing.SPACING:'IS1;lock,volume,1,2,3,4;all,nfc,2,2,2,2',m.spacing.MASTER:'1',
                  'ls_augment_statusbar_row_count':'2','unrelated':'keep'}
        state=dict(baseline)
        def instrument(op,label,values=None):
            if op=='set':state.update(values);return {'status':'pass'}
            if op=='snapshot':return {'moduleVersion':20453,'status':'pass','settings':dict(state)}
            raise AssertionError(op)
        self.instrument.side_effect=instrument;self.shell.side_effect=lambda command,**kw:'unchanged'
        c=m.WifiTrafficCollection(Path(output),VERSION,5)
        c.preflight_network=lambda:None
        def phase(name,scope=None):
            if name==fail_phase:raise RuntimeError('Injected phase interruption')
            c.report['phases'].append({'name':name})
            return [{'surface':s,'surfaceVerified':True,'inventoryFreshForSurface':True,
                     'inventory':{'surfaces':{s:[{'id':k,'state':'visible'}for k in m.spacing.WIFI]}}}for s in m.SURFACES]
        c.phase=phase
        return c,baseline,state

    def test_six_sample_flow_and_exact_user_spacing_restore(self):
        with tempfile.TemporaryDirectory() as temp,patch.object(m,'loaded_systemui',return_value={'pid':123}):
            c,baseline,state=self.fixture(temp);c.run()
            self.assertEqual(state,baseline)
            self.assertEqual([p['name']for p in c.report['phases']],['baseline','wifi-edges','wifi-edges-restored'])
            self.assertFalse(json.loads(c.journal_path.read_text())['pending'])
            self.assertTrue(c.report['configurationRestored'])
            mutations=[call.args[2]for call in self.instrument.call_args_list if call.args[0]=='set']
            self.assertTrue(all(set(values)=={m.spacing.SPACING}for values in mutations))
            trial=mutations[0][m.spacing.SPACING]
            self.assertIn('lock,volume,1,2,3,4',trial);self.assertIn('all,nfc,2,2,2,2',trial)
            self.assertIn('control,wifi.signal,8,2,3,1',trial)
            self.assertIn('notification,wifi.activity_inout,1,3,6,2',trial)
            self.assertNotIn('main,wifi',trial);self.assertNotIn('mobile1',trial)

    def test_exception_restores_original_configuration(self):
        for phase in ['baseline','wifi-edges','wifi-edges-restored']:
            with self.subTest(phase=phase),tempfile.TemporaryDirectory() as temp,patch.object(m,'loaded_systemui',return_value={'pid':123}):
                c,baseline,state=self.fixture(temp,phase)
                with self.assertRaisesRegex(RuntimeError,'Injected'):c.run()
                self.assertEqual(state,baseline);self.assertTrue(c.report['configurationRestored'])
                if c.journal_path.exists():self.assertFalse(json.loads(c.journal_path.read_text())['pending'])

    def test_no_gateway_skips_without_settings_or_traffic(self):
        with tempfile.TemporaryDirectory() as temp:
            c=m.WifiTrafficCollection(Path(temp),VERSION,5)
            c.preflight_network=lambda:(_ for _ in ()).throw(m.NetworkUnavailable('no wifi'))
            c.run();self.assertEqual(c.report['status'],'skipped_network_preflight')
        self.instrument.assert_not_called();self.popen.assert_not_called()

    def test_each_phase_captures_exactly_the_two_allowed_surfaces(self):
        with tempfile.TemporaryDirectory() as temp:
            c=m.WifiTrafficCollection(Path(temp),VERSION,5)
            calls=[]
            c.capture=lambda phase,surface:calls.append((phase,surface))
            for name in ('baseline','wifi-edges','wifi-edges-restored'):c.phase(name)
            self.assertEqual(calls,[(p,s)for p in ('baseline','wifi-edges','wifi-edges-restored')for s in ('control','notification')])

    def test_failed_recovery_keeps_durable_pending_journal(self):
        with tempfile.TemporaryDirectory() as temp,patch.object(m,'loaded_systemui',return_value={'pid':123}):
            c,baseline,state=self.fixture(temp,'wifi-edges')
            original=self.instrument.side_effect
            def fail_restore(op,label,values=None):
                if op=='set' and label=='finally-restore-set':raise RuntimeError('simulated connection loss')
                return original(op,label,values)
            self.instrument.side_effect=fail_restore
            with self.assertRaisesRegex(RuntimeError,'connection loss'):c.run()
            self.assertTrue(json.loads(c.journal_path.read_text())['pending'])
            self.assertFalse(c.report['configurationRestored'])
            self.assertEqual(json.loads(c.journal_path.read_text())['values'],{m.spacing.SPACING:baseline[m.spacing.SPACING]})

    def test_restore_rejects_foreign_serial_without_mutation(self):
        with tempfile.TemporaryDirectory() as temp:
            c=m.WifiTrafficCollection(Path(temp),VERSION,5)
            m.spacing.atomic_json(c.journal_path,{'pending':True,'deviceSerial':'foreign','values':{m.spacing.SPACING:''}})
            with self.assertRaisesRegex(RuntimeError,'does not match'):c.run(True)
            self.instrument.assert_not_called();self.popen.assert_not_called()

    def test_restore_only_no_network_and_preserves_previous_evidence(self):
        with tempfile.TemporaryDirectory() as temp:
            c,baseline,state=self.fixture(temp)
            state[m.spacing.SPACING]='IS1;control,wifi.signal,8,2,3,1'
            c.preflight_network=lambda:(_ for _ in ()).throw(AssertionError('restore must not check network'))
            m.spacing.atomic_json(c.journal_path,{'pending':True,'deviceSerial':m.ar.SERIAL,'values':{m.spacing.SPACING:baseline[m.spacing.SPACING]}})
            m.spacing.atomic_json(Path(temp)/'report.json',dict(c.report,cases=[{'label':'prior-real-evidence'}]))
            c.run(True)
            self.assertEqual(state,baseline)
            self.assertEqual(c.report['cases'],[{'label':'prior-real-evidence'}])
            self.assertFalse(json.loads(c.journal_path.read_text())['pending'])
            self.popen.assert_not_called()

    def test_wrong_build_snapshot_rejected(self):
        with tempfile.TemporaryDirectory() as temp:
            c=m.WifiTrafficCollection(Path(temp),VERSION,5)
            self.instrument.side_effect=None
            self.instrument.return_value={'status':'pass','moduleVersion':20452,'settings':{}}
            with self.assertRaisesRegex(RuntimeError,'installed'):c.read_settings('baseline')


if __name__=='__main__':
    unittest.main(verbosity=2)
