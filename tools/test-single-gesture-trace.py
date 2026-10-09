"""Offline only: execute extracted Java gates/single-shot flow; test host identity/restore boundaries."""
from pathlib import Path
import copy, importlib.util, json, os, re, subprocess, sys, tempfile, unittest
from unittest import mock
ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'android/app/src/androidTest/java/ls/augment/com/BackGestureCustomizationDeviceCases.java'
spec=importlib.util.spec_from_file_location('single_trace',ROOT/'tools/run-single-gesture-trace-device.py')
c=importlib.util.module_from_spec(spec);spec.loader.exec_module(c)
ID='a'*32;NONCE='b'*32
ACK='BG1;31;'+'c'*64+';16;19916;20460;99900;84512673;ready;15;15'

def ready():return dict(schema=1,runId=ID,nonce=NONCE,side=1,runtimeAck=ACK,readyElapsed=100000,readyUptime=100000,width=1216,height=2688)
def gate():return c.gate_for(ready(),ID,dict(pid='123',startTicks='12345'),100100,100200,100300)
def evidence(late=False):
    g=gate();h=dict(nonce=NONCE,downTime=101000,side=1,phase='cancelled',cancelReceived=101950 if late else 101330,cancelReturned=101950 if late else 101331,revision=31,generation=16,pid=19916,build=20460,processStarted=84512673)
    return dict(diagnosticOnly=True,traceRunId=ID,traceProbe='right-custom-baseline',actions=[dict(action=0,downTime=101000)],screenshots=[dict(side='right',traceRunId=ID,traceGate=g,runtimeAck=ACK,
        nativeProbe=dict(terminalConfirmed=True,expectedNonce=NONCE,head=h,matched=True,diagnosticComplete=True,nativeStationaryBeforeFirst=True),
        shortTimelineObserved=True,stable=True,shortcutVisibleAfterCancel=False,nativeTerminalBeforeUi=True,launcherRecovered=True)])

class HostTests(unittest.TestCase):
    def test_actual_session_table(self):
        folder=ROOT/'out/back-gesture-trace-plan-20460/idle-calibration-acb43ea2b9414b64a13a70175b221fd8'
        for file,n in [('before-service.txt',0),('active-service.txt',1),('after-service.txt',0)]:
            with self.subTest(file=file):self.assertEqual(c.session_rows((folder/file).read_text('utf-8'))['total'],n)
        self.assertEqual(c.session_rows((folder/'active-service.txt').read_text('utf-8'))['rows'][0]['fields'][2],'STARTED')
    def test_unknown_session_format(self):
        for raw in ['', 'Unknown command', 'Tracing sessions: 1 (started: 1)\nTRACING SESSIONS:\n']:
            with self.subTest(raw=raw):self.assertRaises(RuntimeError,c.session_rows,raw)
    def test_ready_identity(self):
        self.assertTrue(c.ready_valid(ready(),ID,20460,19916,100400))
        for key,value in [('runId','d'*32),('nonce','bad'),('side',0),('width',1080),('height',2400),('schema',0),('runtimeAck',ACK.replace('19916','19917')),('readyElapsed',100500)]:
            r=ready();r[key]=value
            with self.subTest(key=key):self.assertFalse(c.ready_valid(r,ID,20460,19916,100400))
        self.assertFalse(c.ready_valid(ready(),ID,20460,19916,108001))
    def test_gate_start_window(self):
        self.assertEqual(gate()['expiresElapsed'],120100)
        for clocks in [(99999,100200,100300),(100100,100000,100300),(100100,100200,100100),(100100,100200,108001),(100100,100200,115000)]:
            with self.subTest(clocks=clocks):self.assertRaises(RuntimeError,c.gate_for,ready(),ID,dict(pid='123',startTicks='1'),*clocks)
    def test_exact_single_diagnostic(self):
        v=c.classify(evidence(),ID,gate());self.assertTrue(v['effectSampleValid']);self.assertFalse(v['wholeFeaturePassed'])
        late=c.classify(evidence(True),ID,gate());self.assertFalse(late['effectSampleValid']);self.assertTrue(late['nativeTerminalConfirmed'])
        for edit in ['second-down','second-screen','left','stale-run','old-gate','old-nonce']:
            e=evidence()
            if edit=='second-down':e['actions']*=2
            elif edit=='second-screen':e['screenshots']*=2
            elif edit=='left':e['screenshots'][0]['side']='left'
            elif edit=='stale-run':e['traceRunId']='d'*32
            elif edit=='old-gate':e['screenshots'][0]['traceGate']['nonce']='d'*32
            else:e['screenshots'][0]['nativeProbe']['expectedNonce']='d'*32
            with self.subTest(edit=edit):self.assertRaises(RuntimeError,c.classify,e,ID,gate())
    def test_missing_terminal_is_not_safe_cleanup(self):
        e=evidence();e['screenshots'][0]['nativeProbe']['terminalConfirmed']=False
        v=c.classify(e,ID,gate());self.assertFalse(v['nativeTerminalConfirmed']);self.assertFalse(v['effectSampleValid'])
        e['screenshots']=[];self.assertRaises(RuntimeError,c.classify,e,ID,gate())
    def test_config_is_finite_private_scope(self):
        config=c.trace_config(ID)
        self.assertIn('duration_ms: 20000',config);self.assertIn('size_kb: 32768',config)
        self.assertNotIn('atrace_apps: "*"',config);self.assertNotIn('android.inputmethod',config)
        self.assertNotIn('heapprofd',config);self.assertRaises(ValueError,c.trace_config,'../other')
        self.assertEqual(len(c.owned_preset()),20)
    def test_live_instrumentation_refuses_all_recovery_calls(self):
        instance=object.__new__(c.Collector)
        instance.child=type('Live',(),{'poll':lambda self:None})()
        instance.idle_instrumentation=lambda:(_ for _ in ()).throw(AssertionError('Phone read while live'))
        self.assertRaisesRegex(RuntimeError,'remains active',instance.restore)
    def test_normal_runner_untouched(self):
        text=(ROOT/'tools/run-safe-native-function-device.py').read_text('utf-8')
        self.assertNotIn('traceProbe',text)
        self.assertNotIn('traceRunId',text)
    def recovery_fixture(self,folder,*,foreign_before=False,foreign_after=False,wrong_owned=False):
        x=object.__new__(c.Collector);x.folder=Path(folder);x.child=None;x.report={}
        own=c.owned_preset();base={k:'baseline' for k in own};base.update({'unrelated-'+str(i):str(i) for i in range(477)})
        x.journal=c.safe.Journal(x.folder/'restore.json',base,{'runId':ID});x.journal.data.update(ownedExpected=own,protectionBefore={'resources':{},'names':{},'native':{}})
        x.journal.touch(own);x.current=dict(base,**own);x.calls=[]
        if foreign_before:x.current['unrelated-0']='external'
        if wrong_owned:x.current[next(iter(own))]='external'
        def instrument(operation,label,values=None):
            x.calls.append((operation,label))
            if operation=='set':x.current.update(values)
            if label=='restore-final-readback' and foreign_after:x.current['unrelated-0']='external'
            return {'settings':dict(x.current)}
        x.runner=type('Runner',(),{'instrument':staticmethod(instrument)})()
        x.persist=lambda:(x.journal.save(),c.atomic(x.folder/'report.json',x.report))
        x.idle_instrumentation=lambda:None;x.identity_current=lambda label:x.calls.append(('identity',label))
        x.stop_trace=lambda:x.journal.data.update(traceStopped=True)
        x.protection=lambda:copy.deepcopy(x.journal.data['protectionBefore'])
        return x
    def test_full497_restore(self):
        with tempfile.TemporaryDirectory() as f:
            x=self.recovery_fixture(f);x.restore()
            self.assertEqual(len(x.current),497);self.assertEqual(x.current,x.journal.data['baseline'])
            self.assertFalse(x.journal.data['pending']);self.assertTrue(x.report['restoration']['configurationRestored'])
            self.assertEqual(x.calls[-1],('snapshot','restore-final-readback'))
    def test_late_external_change_not_misreported_restored(self):
        with tempfile.TemporaryDirectory() as f:
            x=self.recovery_fixture(f,foreign_after=True)
            self.assertRaisesRegex(RuntimeError,'final observations',x.restore)
            self.assertTrue(x.journal.data['pending']);self.assertFalse(x.report['restoration']['configurationRestored'])
            self.assertEqual(x.current['unrelated-0'],'external')
    def test_external_before_restore_preserved(self):
        for field in ('foreign_before','wrong_owned'):
            with self.subTest(field=field),tempfile.TemporaryDirectory() as f:
                x=self.recovery_fixture(f,**{field:True});before=dict(x.current)
                self.assertRaises(RuntimeError,x.restore);self.assertEqual(x.current,before)
                self.assertFalse(any(a=='set' for a,b in x.calls));self.assertTrue(x.journal.data['pending'])
    def test_identity_failure_precedes_config_and_trace_mutations(self):
        with tempfile.TemporaryDirectory() as f:
            x=self.recovery_fixture(f);x.identity_current=lambda label:(_ for _ in ()).throw(RuntimeError('original identity differs'))
            x.stop_trace=lambda:(_ for _ in ()).throw(AssertionError('stopped before identity checked'))
            self.assertRaisesRegex(RuntimeError,'original identity',x.restore);self.assertEqual(x.calls,[])
    def test_no_adb_after_gate_until_same_instrumentation_exits(self):
        with tempfile.TemporaryDirectory() as f:
            x=self.recovery_fixture(f);x.identity=ID;x.label='gesture-trace-'+ID;x.remote='/owned/'+x.label
            x.journal.data['metadata']['installedVersion']=20460;x.journal.data['systemuiPid']='19916'
            state={'held':False,'waits':0};x.uptime=lambda:100400
            class Ar:
                ADB='not-run';SERIAL='offline'
                def shell(self,command,**kw):
                    if state['held']:raise AssertionError('Phone query in held interval')
                    return json.dumps(ready() if 'trace-ready' in command else evidence())
                def adb(self,*a,**kw):
                    if state['held']:raise AssertionError('Phone pull in held interval')
                    return b''
            class Child:
                def poll(self):return None
                def wait(self,timeout):state['held']=False;state['waits']+=1;return 0
            def started(r):x.journal.data['gate']=gate();state['held']=True
            x.ar=Ar();x.start_trace=started;x.record_threads=lambda:None
            with mock.patch.object(c.subprocess,'Popen',return_value=Child()):x.run()
            self.assertEqual(state['waits'],1);self.assertEqual(x.report['diagnostic']['actualDownCount'],1)
    def test_remote_trace_changed_after_local_persistence_is_not_deleted(self):
        with tempfile.TemporaryDirectory() as f:
            x=self.recovery_fixture(f);x.identity=ID;x.trace_path='/data/misc/perfetto-traces/owned';x.config_path='/data/local/tmp/owned.pbtxt';x.remote='/owned'
            x.journal.data['traceLaunchAttempted']=True;x.sessions=lambda:({'rows':[]},'no session')
            data=b'bounded trace';digest=c.sha(data);calls=[]
            class Ar:
                def shell(self,command,**kw):
                    calls.append(command)
                    if command.startswith('if test -f '+x.trace_path):return 'EXISTS'
                    if command.startswith('if test -L'):return ''
                    if command.startswith('sha256sum'):return (digest if sum(v.startswith('sha256sum') for v in calls)==1 else '0'*64)+'  '+x.trace_path
                    raise AssertionError('Unexpected or deleting command: '+command)
                def adb(self,*a,**kw):return data
            x.ar=Ar()
            self.assertRaisesRegex(RuntimeError,'changed after pull',c.Collector.stop_trace,x)
            self.assertEqual((Path(f)/'gesture.perfetto-trace').read_bytes(),data)
            self.assertFalse(any(v.startswith('rm ') for v in calls))
    def test_thread_map_start_ticks_and_transient_exit(self):
        stat='123 (main (worker)) S '+' '.join(str(x) for x in range(1,30))
        result=c.thread_records('THREAD=123\nmain (worker)\n'+stat+'\nTHREAD=124\n',123)
        self.assertEqual(result['threads'],[{'tid':123,'comm':'main (worker)','startTicks':'19'}])
        self.assertTrue(result['transientReadErrors'])
        self.assertRaises(RuntimeError,c.thread_records,'THREAD=124\ngone\n',123)

def extract(text,name):
    start=re.search(r'    private (?:static )?[\w<>\[\], ]+ '+re.escape(name)+r'\(',text).start()
    a=text.index('{',start);depth=1;b=a+1
    while depth:
        depth+=(text[b]=='{')-(text[b]=='}');b+=1
    return text[start:b]

HARNESS=r'''
package ls.augment.com;
import java.util.*;import java.util.function.*;import java.io.*;import java.nio.file.*;import java.nio.charset.*;
class JSONObject {
 static final Map<String,JSONObject> encoded=new HashMap<>();Map<String,Object> v=new HashMap<>();JSONObject(){}JSONObject(String s){v=new HashMap<>(encoded.get(s).v);}
 JSONObject put(String k,Object x){v.put(k,x);return this;}String optString(String k){return String.valueOf(v.getOrDefault(k,""));}
 long optLong(String k,long d){Object x=v.get(k);return x instanceof Number?((Number)x).longValue():d;}
 int optInt(String k,int d){return (int)optLong(k,d);}boolean optBoolean(String k,boolean d){return v.get(k) instanceof Boolean?(Boolean)v.get(k):d;}
}
class JSONArray{void put(Object x){}}
class SystemClock{static long now=100000;static long elapsedRealtime(){return now;}static long uptimeMillis(){return now;}static void sleep(long n){now+=n;}}
class BuildConfig{static final int VERSION_CODE=20460;}
class BackGestureRuntimeObservation{
 static BackGestureRuntimeObservation current=new BackGestureRuntimeObservation();static boolean valid=true;
 static BackGestureRuntimeObservation parse(String x){return current;}static final String KEY="ack";
 String serialize(){return "ACK";}boolean confirms(long r,Function<String,String> f,int b,int p,long s,long at,long now){return valid;}
}
public class TestSingleTrace {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class Inconclusive extends Exception{Inconclusive(String s){super(s);}}
 static class UnsafeInputState extends Exception{UnsafeInputState(String s){super(s);}}
 static class Snapshot{long revision=31;String get(String k){return "1";}}
 class Config{Snapshot configSnapshot(){return lastExpected;}String diagnostic(String k){return "ACK";}}
 final Config config=new Config();final Snapshot lastExpected=new Snapshot();final JSONObject report=new JSONObject();final JSONArray cases=new JSONArray();
 final String traceRunId="a".repeat(32),nonce="b".repeat(32);final File directory;
 JSONObject traceGate;long traceReadyElapsed,lastExpectedAt;int traceDownClaims,width=1216,height=2688,runtimePid=19916,skipped;
 long runtimeProcessStart=84512673;int downs,gestureCalls,restores;long markerDelay;boolean missing,hover;String fail="";
 Consumer<JSONObject> edit=g->{};List<String> calls=new ArrayList<>();
 TestSingleTrace()throws Exception{directory=Files.createTempDirectory("tracegate-").toFile();SystemClock.now=100000;BackGestureRuntimeObservation.current=new BackGestureRuntimeObservation();BackGestureRuntimeObservation.valid=true;}
 void persist(){}void requireLauncher(){calls.add("launcher");}boolean shortcutVisible(){calls.add("window");return hover;}
 void traceAnchor(String stage,String nonce,JSONObject sample){calls.add("marker");SystemClock.now+=markerDelay;}
 void writeTraceJson(String name,JSONObject ready)throws Exception{
  calls.add("ready");if(missing)return;SystemClock.now+=400;
  JSONObject gate=new JSONObject().put("schema",1).put("runId",traceRunId).put("nonce",nonce).put("side",1).put("runtimeAck","ACK")
   .put("readyElapsed",traceReadyElapsed).put("traceStartBeforeElapsed",traceReadyElapsed+100).put("traceStartedAckElapsed",traceReadyElapsed+200)
   .put("issuedElapsed",traceReadyElapsed+300).put("expiresElapsed",traceReadyElapsed+20100).put("tracePid",123).put("traceStartTicks","456")
   .put("sessionName","lsa_gesture_"+traceRunId).put("dataSourcesStarted",true);
  edit.accept(gate);JSONObject.encoded.put("gate",gate);Files.writeString(new File(directory,"trace-gate.json").toPath(),"gate");
 }
 Map<String,String> snapshot(){return new HashMap<>();}Map<String,String> fixture(boolean l,boolean r){check(l&&r,"fixed custom A fixture");return new HashMap<>();}
 void apply(Map<String,String> v)throws Exception{calls.add("apply");if(fail.equals("ACK"))throw new Inconclusive("ACK unavailable");}
 void restore(Map<String,String> v){restores++;}
 void gesture(String name,int side)throws Exception{gestureCalls++;check(side==1,"single right only");prepareTraceDown(nonce,side,new BackGestureRuntimeObservation(),new JSONObject());downs++;calls.add("DOWN");if(fail.equals("late"))throw new Inconclusive("late native CANCEL");if(fail.equals("terminal"))throw new UnsafeInputState("missing terminal");}
 /*METHODS*/
 void refused(String why)throws Exception{try{prepareTraceDown(nonce,1,new BackGestureRuntimeObservation(),new JSONObject());throw new AssertionError(why+" permitted DOWN");}catch(Inconclusive expected){}check(traceDownClaims==0,why+" zero claims");}
 public static void main(String[] args)throws Exception{
  TestSingleTrace good=new TestSingleTrace();good.singleRightTrace();check(good.gestureCalls==1&&good.downs==1&&good.restores==1,"one gesture once, restored once");check(good.traceDownClaims==1,"one consumed gate");
  try{good.prepareTraceDown(good.nonce,1,new BackGestureRuntimeObservation(),new JSONObject());throw new AssertionError("second allowed");}catch(Inconclusive expected){}check(good.traceDownClaims==1,"second guard cannot rearm");
  for(String field:new String[]{"schema","runId","nonce","side","runtimeAck","readyElapsed","tracePid","traceStartTicks","sessionName","dataSourcesStarted","expiresElapsed","traceStartBeforeElapsed","traceStartedAckElapsed","issuedElapsed"}){
   TestSingleTrace t=new TestSingleTrace();t.edit=g->{if(Set.of("runId","nonce","runtimeAck","traceStartTicks","sessionName").contains(field))g.put(field,"bad");else if(field.equals("dataSourcesStarted"))g.put(field,false);else g.put(field,-1);};t.refused(field);
  }
  TestSingleTrace missing=new TestSingleTrace();missing.missing=true;missing.refused("missing gate");check(SystemClock.now==108000,"missing gate bounded eight seconds");
  TestSingleTrace future=new TestSingleTrace();future.edit=g->g.put("issuedElapsed",120000);future.refused("future gate");
  TestSingleTrace duration=new TestSingleTrace();duration.edit=g->g.put("expiresElapsed",999999);duration.refused("wrong duration");
  TestSingleTrace expired=new TestSingleTrace();expired.markerDelay=15000;expired.refused("expires during final checks");
  TestSingleTrace stale=new TestSingleTrace();stale.markerDelay=3100;stale.refused("freshness expires before DOWN");
  TestSingleTrace changed=new TestSingleTrace();BackGestureRuntimeObservation.valid=false;changed.refused("runtime ACK changed");
  TestSingleTrace absent=new TestSingleTrace();BackGestureRuntimeObservation.current=null;absent.refused("missing runtime ACK");
  TestSingleTrace hover=new TestSingleTrace();hover.hover=true;hover.refused("foreground hover");
  TestSingleTrace left=new TestSingleTrace();try{left.prepareTraceDown(left.nonce,0,new BackGestureRuntimeObservation(),new JSONObject());throw new AssertionError("left allowed");}catch(Inconclusive expected){}check(left.calls.isEmpty(),"left refusal before handshake");
  for(String failure:new String[]{"ACK","late","terminal"}){
   TestSingleTrace t=new TestSingleTrace();t.fail=failure;
   try{t.singleRightTrace();check(!failure.equals("terminal"),"unsafe terminal not swallowed");}catch(UnsafeInputState expected){check(failure.equals("terminal"),"only unsafe terminal propagates");}
   check(t.gestureCalls==(failure.equals("ACK")?0:1),failure+" no second gesture");check(t.downs==(failure.equals("ACK")?0:1),failure+" exact DOWN count");check(t.restores==1,failure+" bounded restore");
   if(failure.equals("late"))check(t.skipped==1,"late remains skipped, never effect pass");
  }
  System.out.println("PASS extracted single trace gate/flow: "+checks+" checks");
 }
}
'''

def java_test(source,negative=False):
    text=HARNESS.replace('/*METHODS*/','\n'.join(extract(source,n) for n in ('validTraceGate','prepareTraceDown','singleRightTrace')))
    # The production JSONObject(Map) constructor is only used to serialize the fixed preset.
    text=text.replace('JSONObject(){}JSONObject(String s)', 'JSONObject(){}JSONObject(Map<String,String> m){v.putAll(m);}JSONObject(String s)')
    jdk=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    with tempfile.TemporaryDirectory(prefix='single-gesture-trace-') as folder:
        p=Path(folder);(p/'TestSingleTrace.java').write_text(text,'utf-8')
        r=subprocess.run([str(jdk/'javac'),'-encoding','UTF-8','--release','17','-d',str(p),str(p/'TestSingleTrace.java')],capture_output=True,text=True)
        assert r.returncode==0,r.stdout+r.stderr
        r=subprocess.run([str(jdk/'java'),'-cp',str(p),'ls.augment.com.TestSingleTrace'],capture_output=True,text=True,timeout=15)
        if negative:
            assert r.returncode!=0 and 'AssertionError' in r.stderr,r.stdout+r.stderr
            return r.stderr.splitlines()[0]
        assert r.returncode==0,r.stdout+r.stderr
        print(r.stdout.strip())

def integration(source):
    g=extract(source,'gesture');before=g[:g.index('input.begin()')];after=g[g.index('input.begin()'):]
    assert before.index('armProbe(')<before.index('prepareTraceDown(')
    held=after[:after.index('input.finish()')]
    assert 'traceAnchor(' not in held and 'writeTraceJson' not in held
    assert 'terminal!=null&&terminal.optBoolean("terminalConfirmed",false)' in after
    assert 'if(traceDiagnostic)singleRightTrace();\n            else {' in source
    assert 'report.put("passed",!traceDiagnostic&&skipped==0)' in source
    assert 'if(side!=1||traceDownClaims!=0)' in source
    print('PASS integration: exclusive one-shot branch, no held trace/file/UI addition, normal cadence unchanged')

if __name__=='__main__':
    source=SOURCE.read_text('utf-8');integration(source);java_test(source)
    suite=unittest.defaultTestLoader.loadTestsFromTestCase(HostTests)
    result=unittest.TextTestRunner(verbosity=2).run(suite)
    if not result.wasSuccessful():raise SystemExit(1)
    if '--mutations' in sys.argv:
        for name,old,new in [
            ('second-down','if(side!=1||traceDownClaims!=0)','if(side!=1)'),
            ('wrong-nonce','&&nonce.equals(gate.optString("nonce"))',''),
            ('no-start-confirmation','&&gate.optBoolean("dataSourcesStarted",false)',''),
            ('wrong-duration','&&expires==start+20000',''),
            ('stale-gate','&&now-issued<=3000',''),
            ('remove-final-gate','if(!validTraceGate(traceGate,traceRunId,nonce,ack.serialize(),traceReadyElapsed,SystemClock.elapsedRealtime()))\n            throw new Inconclusive("Trace window expired','if(false)\n            throw new Inconclusive("Trace window expired'),
            ('left-warmup','apply(values);gesture("trace-right-custom-baseline",1);','apply(values);gesture("trace-left-warmup",0);gesture("trace-right-custom-baseline",1);'),
            ('second-gesture','apply(values);gesture("trace-right-custom-baseline",1);','apply(values);gesture("trace-right-custom-baseline",1);gesture("trace-right-custom-baseline",1);')]:
            assert source.count(old)==1,(name,source.count(old));print('KILLED',name,java_test(source.replace(old,new),True))
