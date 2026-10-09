"""Execute new pure fixture scheduling/identity policy, preserving old default source bytes. No APK/device."""
from pathlib import Path
import hashlib,json,re,subprocess,tempfile

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/notification-icons-fixture-candidate'
SOURCE=ROOT/'android/app/src/androidTest/java/ls/augment/com/C17RuntimeFixtureCases.java'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
HARNESS=r'''public final class IconTimelineChecks {
 static int checks;
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static void bad(Runnable r,String why){checks++;try{r.run();}catch(IllegalArgumentException expected){return;}throw new AssertionError(why);}
 public static void main(String[] args){
  C17RuntimeFixtureCases.IconTimeline t=new C17RuntimeFixtureCases.IconTimeline(75,10,30,50);
  for(long e:new long[]{0,1,9999})check(t.next(e,0)==0,"no notification before scheduled arrival");
  check(t.next(10000,0)==1,"arrival due inclusive");check(t.next(29999,0)==1,"arrival still in valid first window");
  check(t.next(30000,0)==4,"missed arrival never post-update catchup");check(t.next(50000,0)==4,"missed both windows no notify");
  check(t.next(29999,1)==0,"one id unchanged until update");check(t.next(30000,1)==2,"same id update boundary");
  check(t.next(49999,1)==2,"update before removal");check(t.next(50000,1)==4,"late update cancels, no catchup");
  check(t.next(49999,2)==0,"update retained before remove");check(t.next(50000,2)==3,"remove at deadline");
  for(int state:new int[]{0,1,2,3,4}){check(t.next(75000,state)==5,"inclusive TTL expiry");check(t.next(Long.MAX_VALUE,state)==5,"huge elapsed never extends");}
  for(int state:new int[]{3,4})check(t.next(70000,state)==0,"removed/missed cannot restart");
  bad(()->t.next(-1,0),"reject negative clock");
  new C17RuntimeFixtureCases.IconTimeline(90,20,40,60);checks++;
  for(int[] p:new int[][]{{9,1,2,3},{91,10,30,50},{75,0,30,50},{75,30,30,50},{75,10,50,50},{75,10,30,71},{75,10,30,76}})
    bad(()->new C17RuntimeFixtureCases.IconTimeline(p[0],p[1],p[2],p[3]),"invalid/unsorted schedule");
  check(C17RuntimeFixtureCases.IconTimeline.number(null,75)==75,"default75");check(C17RuntimeFixtureCases.IconTimeline.number("90",75)==90,"explicit90");
  for(String n:new String[]{""," 10","+10","-1","01","1.5","false","999999999999999999"})bad(()->C17RuntimeFixtureCases.IconTimeline.number(n,75),"strict numeric input");
  String run="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",nonce="bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
  check(C17RuntimeFixtureCases.IconTimeline.nonce(nonce),"valid nonce");
  for(String s:new String[]{null,"","a","B".repeat(32),"a".repeat(31),"a".repeat(33),"/".repeat(32)})check(!C17RuntimeFixtureCases.IconTimeline.nonce(s),"invalid nonce");
  check(C17RuntimeFixtureCases.IconTimeline.owns(run,nonce,701,run,nonce,701,74999,75000,false),"exact callback admitted");
  check(!C17RuntimeFixtureCases.IconTimeline.owns(run,nonce,701,"c",nonce,701,100,75000,false),"foreign run rejected");
  check(!C17RuntimeFixtureCases.IconTimeline.owns(run,nonce,701,run,"c",701,100,75000,false),"foreign nonce rejected");
  check(!C17RuntimeFixtureCases.IconTimeline.owns(run,nonce,701,run,nonce,702,100,75000,false),"foreign id rejected");
  check(!C17RuntimeFixtureCases.IconTimeline.owns(run,nonce,701,run,nonce,701,75000,75000,false),"callback at expiry rejected");
  check(!C17RuntimeFixtureCases.IconTimeline.owns(run,nonce,701,run,nonce,701,100,75000,true),"closed callback rejected");
  check(!C17RuntimeFixtureCases.IconTimeline.owns(run,nonce,701,null,null,701,100,75000,false),"null identities rejected");
  check(C17RuntimeFixtureCases.IconTimeline.timeout(75000,10000)==65000,"first notify fixed expiry");
  check(C17RuntimeFixtureCases.IconTimeline.timeout(75000,30000)==45000,"update never renews TTL");
  check(C17RuntimeFixtureCases.IconTimeline.timeout(75000,75000)==1,"zero means Android unlimited so use1");
  check(C17RuntimeFixtureCases.IconTimeline.timeout(75000,80000)==1,"expired cannot restart timeout");
  System.out.println("PASS "+checks);
 }
}'''

def block(source,marker):
    start=source.index(marker);at=source.index('{',start);depth=1;i=at+1
    while depth:
        depth+=(source[i]=='{')-(source[i]=='}');i+=1
    return source[start:i]

def main():
    OUT.mkdir(exist_ok=True);text=SOURCE.read_text('utf-8');old=(OUT/'before-C17RuntimeFixtureCases.java').read_text('utf-8')
    # Byte verification, not normalized-text comparison.
    current_bytes=SOURCE.read_bytes();old_bytes=(OUT/'before-C17RuntimeFixtureCases.java').read_bytes()
    chunks={}
    for name,start,end in [('Fixture',b'    private static final class Fixture {',b'    private static Bitmap art('),
                           ('art-and-ContentActivity',b'    private static Bitmap art(',None)]:
        a=current_bytes[current_bytes.index(start):];b=old_bytes[old_bytes.index(start):]
        if end:a=a[:a.index(end)];b=b[:b.index(end)]
        assert a==b,name+' default bytes changed'
        chunks[name]={'sha256':hashlib.sha256(a).hexdigest(),'bytes':len(a),'equal':True}
    policy=block(text,'    static final class IconTimeline {')
    variants=[('actual',policy),('late-arrival-catchup',policy.replace('elapsed>=updateAfter*1000L?MISSED:','')),
        ('late-update-catchup',policy.replace('elapsed>=removeAfter*1000L?MISSED:','')),
        ('expiry-exclusive',policy.replace('elapsed>=seconds*1000L','elapsed>seconds*1000L')),
        ('callback-no-nonce',policy.replace('&&expectedNonce.equals(nonce)','')),
        ('callback-no-id',policy.replace('&&expectedId==id','')),
        ('timeout-renewed',policy.replace('Math.max(1,deadline-now)','75000'))]
    results=[]
    for name,body in variants:
        assert name=='actual' or body!=policy
        with tempfile.TemporaryDirectory() as td:
            d=Path(td);(d/'C17RuntimeFixtureCases.java').write_text('public final class C17RuntimeFixtureCases {\n'+body+'\n}',encoding='utf-8');(d/'IconTimelineChecks.java').write_text(HARNESS,encoding='utf-8')
            c=subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',td,str(d/'C17RuntimeFixtureCases.java'),str(d/'IconTimelineChecks.java')],capture_output=True)
            assert c.returncode==0,c.stderr.decode('utf-8','replace')
            r=subprocess.run([str(JAVA/'java.exe'),'-cp',td,'IconTimelineChecks'],capture_output=True)
            entry={'variant':name,'compileExit':c.returncode,'exitCode':r.returncode,'stdout':r.stdout.decode('utf-8','replace'),'stderr':r.stderr.decode('utf-8','replace')};results.append(entry)
            assert (r.returncode==0)==(name=='actual'),entry
    runtime=block(text,'    private static final class NotificationIconsFixture {')
    for forbidden in ['new MediaSession','AudioTrack','AudioRecord','MediaPlayer','requestAudioFocus','cancelAll(','config.save','AppConfig']:
        assert forbidden not in runtime,forbidden
    assert runtime.count('manager.notify(')==1 and 'manager.notify(tag,ID,notification)' in runtime
    assert 'manager.cancel(tag,ID)' in runtime and 'setTimeoutAfter(IconTimeline.timeout(deadline,SystemClock.elapsedRealtime()))' in runtime
    assert 'phase="ready";observeOwned();record("ready")' in runtime and 'Ready receipt could not be persisted' in runtime
    assert 'if(notifyReturned>=(updated?timeline.removeAfter:timeline.updateAfter)*1000L)' in runtime
    assert 'IconTimeline.owns(' in runtime and 'Context.RECEIVER_NOT_EXPORTED' in runtime
    assert runtime.count('"/"+nonce+"/"+ID+')>=3 and 'setData(Uri.parse("duo-c17-icons://"+runId+' in runtime
    old_build=ROOT/'out/full-function-audit-20261004/c17-runtime-fixture/build.json';build=json.loads(old_build.read_text('utf-8'))
    assert build['sourceSha256']==hashlib.sha256(old_bytes).hexdigest()
    assert hashlib.sha256(Path(build['apk']).read_bytes()).hexdigest()==build['sha256']=='f3beeefd1a1f8f9b723e0b42e5233e97180b790eec334cdfce5373c06db3427b'
    result={'status':'pass','sourceSha256':hashlib.sha256(current_bytes).hexdigest(),'legacyBytes':chunks,'actual':results[0],
        'negativeMutants':results[1:],'legacyBuildJsonSha256':hashlib.sha256(old_build.read_bytes()).hexdigest(),
        'legacyApkUnchanged':True,'deviceUsed':False,'apkBuilt':False,'legacyTestsRerun':False,
        'limits':['Executed actual pure schedule/identity methods; runtime Android service calls are static contracts only','SmallIcon rendering/eligible membership and actual cleanup need fresh owned-device evidence']}
    (OUT/'checks.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False,indent=2))
if __name__=='__main__':main()
