"""Execute production scope presentation, observer and pinned-endpoint transport methods.

Android Binder, queue and TextView boundaries are controlled; this does not verify phone rendering.
All negative controls compile the mutated actual production bodies before requiring an assertion failure.
"""
from pathlib import Path
import argparse
import datetime
import hashlib
import json
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
JDK = Path(r'C:\Program Files\Android\openjdk\jdk-21.0.8\bin')

def member(source, signature):
    start = source.index(signature)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

BUNDLE = '''package android.os;import java.util.*;public class Bundle {
 public static final Object CREATOR=new Object();final Map<String,Object>d=new HashMap<>();public Bundle(){}public Bundle(Bundle b){d.putAll(b.d);}
 public Object get(String k){return d.get(k);}public void putString(String k,String v){d.put(k,v);}public void putBoolean(String k,boolean v){d.put(k,v);}public void putInt(String k,int v){d.put(k,v);}public void remove(String k){d.remove(k);}public void put(String k,Object v){d.put(k,v);}public void setClassLoader(ClassLoader l){}
 public String getString(String k,String v){return d.get(k) instanceof String?(String)d.get(k):v;}public boolean getBoolean(String k,boolean v){return d.get(k) instanceof Boolean?(Boolean)d.get(k):v;}
}'''

SUPPORT = r'''package ls.augment.com;
import android.os.*;import java.util.*;import java.io.*;import java.util.concurrent.atomic.*;
class Queue {
 final ArrayDeque<Runnable> jobs=new ArrayDeque<>();final LinkedHashMap<Runnable,Long> delayed=new LinkedHashMap<>();
 void execute(Runnable r){jobs.add(r);}void post(Runnable r){jobs.add(r);}void postDelayed(Runnable r,long delay){delayed.put(r,delay);}void removeCallbacks(Runnable r){delayed.remove(r);jobs.removeIf(x->x==r);}
 void run(){Runnable r=jobs.poll();if(r!=null)r.run();}void drain(){int n=0;while(!jobs.isEmpty()){if(++n>100)throw new AssertionError("queue replay");run();}}void tick(){if(!delayed.isEmpty()){Runnable r=delayed.keySet().iterator().next();delayed.remove(r);r.run();}}
}
class ResetWriteFence {static long now=5;static boolean stale(long n){return n!=now;}}
class AtomicWorkbenchProtocol {static final int WINDOW_COUNT=4,TX_STATUS=3;}
class View {static final int GONE=8,VISIBLE=0;}
class TextUtils {static boolean equals(CharSequence a,CharSequence b){return Objects.equals(a==null?null:a.toString(),b==null?null:b.toString());}}
class TextView {String text="";int visibility=View.GONE,sets,visibilityChanges;CharSequence getText(){return text;}void setText(String s){text=s;sets++;}int getVisibility(){return visibility;}void setVisibility(int v){visibility=v;visibilityChanges++;}}
class Policy {long entry=2;long entryGeneration(){return entry;}}
class FakeBinder implements IBinder {
 boolean alive=true,unsupported,throwRemote;int calls,lastCode;Bundle reply;Runnable during;
 public boolean isBinderAlive(){return alive;}public boolean transact(int code,Parcel data,Parcel out,int flags)throws RemoteException{calls++;lastCode=code;if(during!=null)during.run();if(throwRemote)throw new RemoteException("dead");out.result=reply;return !unsupported;}
}
'''

CLIENT_HEAD = r'''class AtomicWorkbenchClient {
 volatile IBinder endpoint,taskStorageScopeEndpoint;volatile boolean closed;volatile AtomicWorkbenchClient recoveryClient;
 final AtomicReference<String> failure=new AtomicReference<>();int headers,failures;
 AtomicWorkbenchClient(FakeBinder b){endpoint=b;}
 void writeHeader(Parcel p){headers++;}void reportFailure(String s){failure.set(s);failures++;}
 private interface ParcelWriter {void write(Parcel data);}
 void prime(Bundle response)throws Exception {((FakeBinder)endpoint).reply=response;request(AtomicWorkbenchProtocol.TX_STATUS,null);}
'''

ACTIVITY_HEAD = r'''public final class AtomicWorkbenchActivity {
 static final Queue WORKER=new Queue();final Queue main=new Queue();final TextView status=new TextView();final Policy presentationPolicy=new Policy();
 AtomicWorkbenchClient client;boolean active=true,destroyed,closing,exitRequested,recoveryPending,waitingForCleanup,outputsParked,outputsNeedRetry,busy,polling,outputsSyncing,presentationNeedsRetry;
 long launchGeneration=5,sessionGeneration=7,outputTransition=9;int epoch=11,polls,cleanupCalls,closes,taskQueries,syncs,homeRetries;
 Object pendingTaskOperation;String operationNotice;
 int taskStorageNotice;String statusMessage,taskStorageStatusProblem;
 volatile long taskStorageProbeGeneration;long taskStorageProbeSequence,taskStorageProbeInFlight,taskStorageProbeDelay=2000L;boolean taskStorageRecheckWanted;
 final Runnable taskStorageRecheck=this::recheckTaskStorageScope;
 void schedulePoll(){polls++;}void pollStatus(){polls++;}void refreshCleanupWait(){cleanupCalls++;}void requestCloseAll(boolean b){closes++;}void queryPendingTaskOperation(){taskQueries++;}void syncWorkspaceOutputs(){syncs++;}void retryHomePresentation(){homeRetries++;}
 AtomicWorkbenchActivity()throws Exception{FakeBinder b=new FakeBinder();client=new AtomicWorkbenchClient(b);client.prime(scope(1,false));b.calls=0;}
 FakeBinder binder(){return (FakeBinder)client.endpoint;}void all(){WORKER.drain();main.drain();}void ask(){taskStorageRecheckWanted=true;recheckTaskStorageScope();}
'''

TEST = r'''
 static int checks,cases;interface Case{void run()throws Exception;}static void yes(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}static void test(String n,Case c)throws Exception{WORKER.jobs.clear();ResetWriteFence.now=5;Looper.onMain=false;c.run();cases++;System.out.println("PASS scope UI: "+n);}
 static Bundle scope(int value,boolean success){Bundle b=new Bundle();b.putBoolean("success",success);b.putString("task_backend_state",value==0?"ready":value==1?"storage_unverified":"not_configured");b.putString("task_backend_reason",value==0?"":"task_storage_unavailable");b.putBoolean("task_backend_available",value==0);b.putBoolean("task_storage_unverified",value==1);b.putBoolean("task_scope_verified",value==0);ArrayList<Bundle>w=new ArrayList<>();for(int id=0;id<4;id++){Bundle x=new Bundle();x.putInt("window_id",id);w.add(x);}b.put("windows",w);return b;}
 static void denied(AtomicWorkbenchClient c,String why)throws Exception{FakeBinder b=(FakeBinder)c.endpoint;int before=b==null?0:b.calls;try{c.statusForStorageRecheck();throw new AssertionError("probe admitted "+why);}catch(IOException|IllegalStateException expected){}yes(b==null||b.calls==before,"denied probe dispatched "+why);}
 static void change(AtomicWorkbenchActivity a,String gate){switch(gate){case "generation":a.cancelTaskStorageRecheck();break;case "client":a.client=new AtomicWorkbenchClient(new FakeBinder());break;case "session":a.sessionGeneration++;break;case "transition":a.outputTransition++;break;case "reset":a.launchGeneration++;ResetWriteFence.now++;break;case "resetFence":ResetWriteFence.now++;break;case "entry":a.presentationPolicy.entry++;break;case "epoch":a.epoch++;break;case "stop":a.active=false;break;case "destroy":a.destroyed=true;break;case "closing":a.closing=true;break;case "exit":a.exitRequested=true;break;case "recovery":a.recoveryPending=true;break;case "cleanup":a.waitingForCleanup=true;break;default:throw new AssertionError(gate);}}
 public static void main(String[]args)throws Exception{
 test("typed complete metadata is independent of overall success",()->{for(boolean ok:new boolean[]{false,true})for(int v=0;v<3;v++)yes(AtomicWorkbenchClient.taskStorageScope(scope(v,ok))==v,"typed scope rejected");});
 test("missing fields wrong types malformed windows cannot certify scope",()->{String[] keys={"success","task_backend_state","task_backend_reason","task_backend_available","task_storage_unverified","task_scope_verified","windows"};for(String k:keys){Bundle b=scope(0,true);b.remove(k);yes(AtomicWorkbenchClient.taskStorageScope(b)<0,"missing metadata accepted:"+k);b=scope(0,true);b.put(k,"true");yes(AtomicWorkbenchClient.taskStorageScope(b)<0,"wrong metadata type accepted:"+k);}for(String bad:new String[]{"duplicate","count","idType","idRange","element","notList"}){Bundle b=scope(0,true);ArrayList<Bundle>w=(ArrayList<Bundle>)b.get("windows");switch(bad){case "duplicate":w.get(3).putInt("window_id",0);break;case "count":w.remove(3);break;case "idType":w.get(0).putString("window_id","0");break;case "idRange":w.get(0).putInt("window_id",4);break;case "element":((ArrayList)w).set(0,"window");break;case "notList":b.put("windows",new HashMap<>());}yes(AtomicWorkbenchClient.taskStorageScope(b)<0,"invalid windows accepted:"+bad);}Bundle b=scope(0,true);b.putString("task_backend_reason","not_ready");yes(AtomicWorkbenchClient.taskStorageScope(b)<0,"ready reason ignored");b=scope(0,true);b.putBoolean("task_storage_unverified",true);yes(AtomicWorkbenchClient.taskStorageScope(b)<0,"contradictory scope accepted");yes(AtomicWorkbenchClient.taskStorageScope(null)<0,"null scope accepted");});
 test("unknown remains visible across null business status and duplicate polite text",()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));String warning=a.status.text;int sets=a.status.sets;yes(warning.contains("尚未核查")&&a.status.visibility==View.VISIBLE,"unknown hidden");a.showStatus(null);a.observeTaskStorageScope(scope(1,false));yes(a.status.text.equals(warning)&&a.status.sets==sets,"duplicate polite text reset");a.showStatus("原操作失败");yes(a.status.text.contains("原操作失败")&&a.status.text.contains(warning),"business error replaced warning");a.showStatus(null);yes(a.status.text.equals(warning),"null status cleared unknown");});
 test("ready global failure retains exact root error until ready success",()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));Bundle b=scope(0,false);b.putString("message","归还任务仍未确认");a.observeTaskStorageScope(b);a.showStatus(null);yes(a.taskStorageNotice==0&&a.status.text.equals("归还任务仍未确认")&&a.status.visibility==View.VISIBLE,"ready erased global failure");yes(a.closes==0&&a.syncs==0&&a.polls==0,"scope ready performed mutation");a.observeTaskStorageScope(scope(0,false));yes(a.status.text.contains("仍未确认"),"missing failure message became clean");a.observeTaskStorageScope(scope(0,true));yes(a.status.text.isEmpty()&&a.status.visibility==View.GONE,"confirmed ready not cleared");});
 test("invalid and null replies never clear a prior warning",()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(2,false));int sets=a.status.sets;String text=a.status.text;a.observeTaskStorageScope(null);Bundle b=scope(0,true);b.remove("windows");a.observeTaskStorageScope(b);yes(a.taskStorageNotice==2&&text.equals(a.status.text)&&a.status.sets==sets,"missing response cleared warning");});
 test("normal output uses existing poll while parked output schedules bounded read",()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));yes(a.main.delayed.isEmpty(),"duplicate normal poll scheduled");a.outputsParked=true;a.observeTaskStorageScope(scope(1,false));yes(a.main.delayed.get(a.taskStorageRecheck)==2000L,"parked unknown has no observer");long[] expected={4000,8000,16000,30000,30000};for(long delay:expected){a.main.tick();a.all();yes(a.taskStorageProbeDelay==delay&&a.main.delayed.get(a.taskStorageRecheck)==delay,"observer backoff unbounded");}yes(a.binder().calls==5&&a.binder().lastCode==AtomicWorkbenchProtocol.TX_STATUS,"probe used non-status operation");});
 test("ready parked observation does not reconnect focus or mutate windows",()->{var a=new AtomicWorkbenchActivity();a.outputsParked=true;a.showStatus("画面尚未恢复；点此重试。");a.observeTaskStorageScope(scope(1,false));a.binder().reply=scope(0,true);a.main.tick();a.all();yes(a.taskStorageNotice==0&&a.outputsParked&&a.status.text.contains("点此重试")&&a.main.delayed.isEmpty(),"ready resumed parked producers");yes(a.syncs==0&&a.closes==0&&a.polls==0,"ready resumed input chain");a.clickStatus();yes(a.syncs==1,"explicit retry no longer uses original sync");});
 test("unknown click cannot fall through to resume or HOME even when busy",()->{for(boolean busy:new boolean[]{false,true}){var a=new AtomicWorkbenchActivity();a.outputsParked=true;a.presentationNeedsRetry=true;a.observeTaskStorageScope(scope(1,false));a.busy=busy;a.clickStatus();yes(a.syncs==0&&a.homeRetries==0&&a.closes==0,"unknown click reached producer chain");yes(WORKER.jobs.size()==(busy?0:1),"busy probe queued");a.all();}});
 test("cleanup recovery and task query retain existing click priority",()->{for(int p=0;p<3;p++){var a=new AtomicWorkbenchActivity();a.outputsParked=true;a.observeTaskStorageScope(scope(1,false));a.waitingForCleanup=p==0;a.recoveryPending=p==1;a.pendingTaskOperation=p==2?new Object():null;a.clickStatus();yes(a.cleanupCalls==(p==0?1:0)&&a.closes==(p==1?1:0)&&a.taskQueries==(p==2?1:0)&&WORKER.jobs.isEmpty(),"scope swallowed original recovery priority");}});
 test("single flight stays occupied through cancellation queued work and late result",()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));a.ask();long flight=a.taskStorageProbeInFlight;a.ask();yes(WORKER.jobs.size()==1&&flight!=0,"parallel probe queued");a.cancelTaskStorageRecheck();yes(a.taskStorageProbeInFlight==flight,"cancel released live worker slot");a.taskStorageRecheckWanted=true;a.recheckTaskStorageScope();yes(WORKER.jobs.size()==1,"cancel allowed second real worker");WORKER.run();yes(a.taskStorageProbeInFlight==flight,"slot released before worker result");a.main.drain();yes(a.taskStorageProbeInFlight==0&&a.taskStorageNotice==1&&a.binder().calls==0,"canceled queue sent or cleared warning");});
 test("cancel during real Binder operation cannot admit another worker",()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));a.binder().reply=scope(0,true);a.binder().during=()->{long flight=a.taskStorageProbeInFlight;a.cancelTaskStorageRecheck();a.ask();yes(a.taskStorageProbeInFlight==flight&&WORKER.jobs.isEmpty(),"in-flight Binder cancellation freed slot");};a.ask();WORKER.run();yes(a.binder().calls==1&&a.taskStorageProbeInFlight!=0,"blocked transport result not retained");a.main.drain();yes(a.taskStorageProbeInFlight==0&&a.taskStorageNotice==1,"late canceled ready cleared warning");});
 for(String gate:new String[]{"generation","client","session","transition","reset","resetFence","entry","epoch","stop","destroy","closing","exit","recovery","cleanup"}){
  test("queued observer rejects changed "+gate,()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));a.ask();FakeBinder original=a.binder();change(a,gate);a.all();yes(original.calls==0&&a.taskStorageNotice==1,"stale queued probe dispatched:"+gate);});
  test("late ready reply rejects changed "+gate,()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));a.binder().reply=scope(0,true);a.ask();WORKER.run();yes(a.binder().calls==1,"valid readonly probe not sent");change(a,gate);a.main.drain();yes(a.taskStorageNotice==1&&a.taskStorageProbeInFlight==0,"stale ready published:"+gate);});
 }
 test("busy polling and syncing never enqueue another observer",()->{for(int v=0;v<3;v++){var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));a.busy=v==0;a.polling=v==1;a.outputsSyncing=v==2;a.ask();yes(WORKER.jobs.isEmpty()&&a.main.delayed.containsKey(a.taskStorageRecheck),"busy reader overlapped existing work");}});
 for(int flag=0;flag<3;flag++){final int v=flag;test("queued observer rechecks existing operation "+v,()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));a.ask();a.busy=v==0;a.polling=v==1;a.outputsSyncing=v==2;a.all();yes(a.binder().calls==0&&a.taskStorageNotice==1,"queued busy reader overlapped existing work");});}
 test("cold endpoint must first return actual typed scope",()->{FakeBinder b=new FakeBinder();AtomicWorkbenchClient c=new AtomicWorkbenchClient(b);b.reply=scope(0,true);denied(c,"cold");Bundle malformed=scope(0,true);malformed.remove("task_scope_verified");c.prime(malformed);denied(c,"malformed observation");c.prime(scope(1,false));int count=b.calls;Bundle response=c.statusForStorageRecheck();yes(response==b.reply&&b.calls==count+1&&b.lastCode==AtomicWorkbenchProtocol.TX_STATUS,"pinned observer not actual TX_STATUS");});
 for(String reason:new String[]{"closed","recovery","failed","dead","replaced","nullEndpoint","mainThread"})test("pinned client refuses "+reason,()->{FakeBinder b=new FakeBinder();AtomicWorkbenchClient c=new AtomicWorkbenchClient(b);c.prime(scope(1,false));switch(reason){case "closed":c.closed=true;break;case "recovery":c.recoveryClient=new AtomicWorkbenchClient(new FakeBinder());break;case "failed":c.failure.set("failure");break;case "dead":b.alive=false;break;case "replaced":c.endpoint=new FakeBinder();break;case "nullEndpoint":c.endpoint=null;break;case "mainThread":Looper.onMain=true;break;}denied(c,reason);yes(b.calls==1,"original endpoint received refused probe:"+reason);});
 test("transport failure retains warning and recycles real parcels",()->{var a=new AtomicWorkbenchActivity();a.observeTaskStorageScope(scope(1,false));a.binder().throwRemote=true;int recycled=Parcel.recycled;a.ask();a.all();yes(a.taskStorageNotice==1&&a.client.failures==1&&Parcel.recycled==recycled+2,"failure cleared proof or leaked parcel");});
 test("request records scope only while same owner remains live at reply",()->{for(String reason:new String[]{"closed","recovery","failed","dead","replaced"}){FakeBinder b=new FakeBinder();AtomicWorkbenchClient c=new AtomicWorkbenchClient(b);b.reply=scope(1,false);b.during=()->{switch(reason){case "closed":c.closed=true;break;case "recovery":c.recoveryClient=new AtomicWorkbenchClient(new FakeBinder());break;case "failed":c.failure.set("failed");break;case "dead":b.alive=false;break;case "replaced":c.endpoint=new FakeBinder();break;}};c.prime(b.reply);yes(c.taskStorageScopeEndpoint==null,"departed transport minted observation:"+reason);}});
 for(String reason:new String[]{"closed","recovery","failed","dead","replaced"})test("ready read cannot publish departed owner "+reason,()->{FakeBinder b=new FakeBinder();AtomicWorkbenchClient c=new AtomicWorkbenchClient(b);c.prime(scope(1,false));b.reply=scope(0,true);b.during=()->{switch(reason){case "closed":c.closed=true;break;case "recovery":c.recoveryClient=new AtomicWorkbenchClient(new FakeBinder());break;case "failed":c.failure.set("failed");break;case "dead":b.alive=false;break;case "replaced":c.endpoint=new FakeBinder();break;}};try{c.statusForStorageRecheck();throw new AssertionError("departed endpoint published:"+reason);}catch(IOException expected){}yes(b.calls==2,"readonly scope read unexpectedly delegated or replayed");});
 System.out.println("STORAGE SCOPE UI RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''

def sources():
    activity = (SRC / 'AtomicWorkbenchActivity.java').read_text(encoding='utf-8')
    client = (SRC / 'AtomicWorkbenchClient.java').read_text(encoding='utf-8')
    am = ['private void observeTaskStorageScope(', 'private boolean taskStorageRecheckAllowed(',
          'private boolean taskStorageProbeCurrent(', 'private void cancelTaskStorageRecheck(',
          'private void scheduleTaskStorageRecheck(', 'private void recheckTaskStorageScope(',
          'private void showStatus(', 'private void renderSessionStatus(']
    cm = ['Bundle statusForStorageRecheck(', 'static int taskStorageScope(', 'private Bundle request(',
          'private Bundle requestOnEndpoint(', 'private IBinder requireEndpoint(', 'private static void requireWorkerThread(']
    click = member(activity, 'status.setOnClickListener(view ->')
    click_body = click[click.index('{')+1:-1]
    return {
        'android/os/Bundle.java': BUNDLE,
        'android/os/IBinder.java': 'package android.os;public interface IBinder{boolean isBinderAlive();boolean transact(int code,Parcel data,Parcel reply,int flags)throws RemoteException;}',
        'android/os/RemoteException.java': 'package android.os;public class RemoteException extends Exception{public RemoteException(String s){super(s);}}',
        'android/os/Parcel.java': 'package android.os;public class Parcel{public static int recycled;public Bundle result;public static Parcel obtain(){return new Parcel();}public void readException(){}public Bundle readTypedObject(Object creator){return result;}public void recycle(){recycled++;}}',
        'android/os/Looper.java': 'package android.os;public class Looper{public static boolean onMain;static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return onMain?MAIN:null;}}',
        'ls/augment/com/AtomicWorkbenchActivity.java': SUPPORT + CLIENT_HEAD + '\n'.join(member(client, m) for m in cm) + '}\n' + ACTIVITY_HEAD + '\n'.join(member(activity, m) for m in am) + '\nvoid clickStatus(){' + click_body + '}\n' + TEST,
    }, activity, client

CONTROLS = [
    ('missing typed boolean', '!(response.get("success") instanceof Boolean)', 'false', 'missing metadata accepted:success'),
    ('complete windows', 'windows.size() != AtomicWorkbenchProtocol.WINDOW_COUNT', 'false', 'invalid windows accepted:count'),
    ('unique windows', '|| seen[(Integer) id]', '', 'invalid windows accepted:duplicate'),
    ('strict ready reason', '&& "".equals(reason)', '', 'wrong metadata type accepted:task_backend_reason'),
    ('global ready failure', 'if (Boolean.TRUE.equals(response.get("success"))) taskStorageStatusProblem = null;', 'if (true) taskStorageStatusProblem = null;', 'ready erased global failure'),
    ('persistent warning', 'String visible = warning.isEmpty() ? message : message.isEmpty() ? warning : message + "\\n" + warning;', 'String visible = message;', 'unknown hidden'),
    ('polite duplicate', 'if (!TextUtils.equals(status.getText(), visible)) status.setText(visible);', 'status.setText(visible);', 'duplicate polite text reset'),
    ('unknown click priority', 'else if (taskStorageNotice != 0)', 'else if (false)', 'unknown click reached producer chain'),
    ('single flight', '|| taskStorageProbeInFlight != 0L', '', 'parallel probe queued'),
    ('retain flight on cancel', '++taskStorageProbeGeneration;', '++taskStorageProbeGeneration; taskStorageProbeInFlight = 0L;', 'cancel released live worker slot'),
    ('cancellation generation', 'generation == taskStorageProbeGeneration && ', '', 'canceled queue sent or cleared warning'),
    ('worker current busy operation', '&& !busy && !polling && !outputsSyncing', '', 'queued busy reader overlapped existing work'),
    ('session fence', '&& session == sessionGeneration', '', 'stale queued probe dispatched:session'),
    ('endpoint fence', '&& connected == client', '', 'stale queued probe dispatched:client'),
    ('output fence', '&& transition == outputTransition', '', 'stale queued probe dispatched:transition'),
    ('reset epoch fence', '&& reset == launchGeneration', '', 'stale queued probe dispatched:reset'),
    ('UI epoch fence', '&& request == epoch', '', 'stale queued probe dispatched:epoch'),
    ('entry fence', '&& entry == presentationPolicy.entryGeneration()', '', 'stale queued probe dispatched:entry'),
    ('reset active fence', '&& !ResetWriteFence.stale(launchGeneration)', '', 'stale queued probe dispatched:resetFence'),
    ('active lifecycle', 'return active && !destroyed', 'return !destroyed', 'stale queued probe dispatched:stop'),
    ('recovery fence', '&& !recoveryPending', '', 'stale queued probe dispatched:recovery'),
    ('cleanup fence', '&& !waitingForCleanup', '', 'stale queued probe dispatched:cleanup'),
    ('cold endpoint proof', 'IBinder observed = taskStorageScopeEndpoint;', 'IBinder observed = endpoint;', 'probe admitted cold'),
    ('recovery delegation', '|| recoveryClient != null', '', 'denied probe dispatched recovery'),
    ('endpoint identity', '|| endpoint != observed', '', 'original endpoint received refused probe:replaced'),
    ('endpoint failure', '|| failure.get() != null', '', 'denied probe dispatched failed'),
    ('closed endpoint', 'closed || ', '', 'denied probe dispatched closed'),
    ('dead endpoint', '|| !observed.isBinderAlive()', '', 'denied probe dispatched dead'),
    ('scope provenance', 'taskStorageScope(result) >= 0 && ', '', 'probe admitted malformed observation'),
    ('post-read live owner', 'if (endpoint != observed || closed || recoveryClient != null || failure.get() != null\n                || !observed.isBinderAlive()) throw new IOException("原工作台连接已离开，状态未获确认");', '', 'departed endpoint published:closed'),
]

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--negative-controls', action='store_true')
    parser.add_argument('--evidence-dir', type=Path)
    args = parser.parse_args()
    names = ['AtomicWorkbenchActivity.java', 'AtomicWorkbenchClient.java']
    def hashes(): return {str((SRC / n).relative_to(ROOT)).replace('\\','/'): hashlib.sha256((SRC/n).read_bytes()).hexdigest().upper() for n in names}
    before = hashes(); values, activity, client = sources()
    started = datetime.datetime.now(datetime.timezone.utc).isoformat()
    out = args.evidence_dir
    if out: out.mkdir(parents=True, exist_ok=False)
    results = []
    with tempfile.TemporaryDirectory(prefix='duo-storage-scope-ui-') as temporary:
        def run(label, replacement=None):
            work = Path(temporary) / label
            content = dict(values)
            if replacement:
                old, new = replacement
                target = 'ls/augment/com/AtomicWorkbenchActivity.java'
                if content[target].count(old) < 1: raise AssertionError('control missing: ' + old)
                content[target] = content[target].replace(old, new, 1)
            files = []
            for name, text in content.items():
                path=work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,encoding='utf-8');files.append(str(path))
            result = subprocess.run([str(JDK/'javac.exe'), '-J-Dfile.encoding=UTF-8', '--release','17','-encoding','UTF-8','-d',str(work/'classes'),*files],capture_output=True,timeout=60)
            output = result.stdout + result.stderr
            if result.returncode: raise AssertionError('compile failed '+label+'\n'+output.decode('utf-8',errors='replace'))
            result = subprocess.run([str(JDK/'java.exe'),'-Dfile.encoding=UTF-8','-cp',str(work/'classes'),'ls.augment.com.AtomicWorkbenchActivity'],capture_output=True,timeout=60)
            output = (result.stdout+result.stderr).decode('utf-8',errors='replace')
            if out:
                with (out/(label+'.txt')).open('x',encoding='utf-8') as stream:stream.write(output)
            return result.returncode, output
        code, output = run('baseline')
        print(output,end='')
        if code: raise AssertionError('production baseline failed')
        match=re.search(r'STORAGE SCOPE UI RESULT (\d+) cases; (\d+) assertions',output)
        assert match
        if args.negative_controls:
            for number,(label,old,new,message) in enumerate(CONTROLS,1):
                code, output=run(f'negative-{number:02d}',(old,new))
                if code==0 or 'AssertionError' not in output or message not in output:
                    raise AssertionError('control did not fail expected assertion '+label+'\n'+output)
                results.append({'label':label,'compiled':True,'exit_code':code,'expected_assertion':message})
                print('PASS compiled production negative:',label)
    after=hashes()
    assert before==after,'owned source changed during test'
    proof={'scope':'ACTUAL_ACTIVITY_SCOPE_PRESENTATION_OBSERVER_CLICK_AND_CLIENT_TYPED_SCOPE_PINNED_TRANSPORT_BODIES',
        'started_utc':started,'finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'cases':int(match.group(1)),'assertions':int(match.group(2)),'negatives':results,'before':before,'after':after,
        'source_stable':before==after,'phoneValidated':False,'apkBuilt':False,
        'controlled_boundaries':['Binder/Parcel transport, main/worker execution queues, TextView/layout/accessibility renderer, ResetWriteFence generation, Policy entry counter',
            'Other Activity producer/focus/Task paths are counted rejection boundaries here; their production ordering is separately unchanged, not reimplemented as success'],
        'static_integration':{}}
    for signature in ['private void syncWorkspaceOutputs(', 'private void parkWorkspaceOutputs(', 'private void retireSession(', 'private void requestCloseAll(boolean finishWhenRestored, String requestedReason)', 'private void showCleanupPending(', 'protected void onNewIntent(']:
        body=member(activity,signature)
        assert 'cancelTaskStorageRecheck()' in body,signature
        proof['static_integration'][signature]='actual cancellation call present'
    for signature in ['private void syncWorkspaceOutputs(', 'private void pollStatus(', 'private void pollHomePresentation(']:
        assert 'observeTaskStorageScope(response)' in member(activity,signature),signature
        proof['static_integration'][signature]='actual current reply observes metadata'
    assert 'cancelTaskStorageRecheck();' in member(activity,'connected.setFailureListener(message ->'), 'failure cancellation missing'
    assert 'taskStorageProbeInFlight != 0L' in member(activity,'private void pollStatus('), 'normal poll overlaps observer'
    if out:
        with (out/'summary.json').open('x',encoding='utf-8') as stream:json.dump(proof,stream,indent=2)
    print(json.dumps({'cases':proof['cases'],'assertions':proof['assertions'],'compiled_negatives':len(results),'source_stable':proof['source_stable']}))

if __name__=='__main__':main()
