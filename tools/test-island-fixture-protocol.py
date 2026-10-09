"""Run the actual fixture command-admission policy; no Android/device/APK required."""
from pathlib import Path
import argparse, hashlib, importlib.util, json, subprocess, tempfile, xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1];SOURCE=ROOT/'tools/fixtures/island/IslandFixtureProtocol.java'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
HARNESS='''package ls.augment.regression.island;
public final class FixtureProtocolCases {
 static int checks;
 static final String RUN="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", SECRET="bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
 static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static int admit(String r,String s,int sequence,int next,String command,long now,boolean closed){return IslandFixtureProtocol.admit(RUN,SECRET,sequence,2000,closed,r,s,next,command,now);}
 public static void main(String[] args){
  check(IslandFixtureProtocol.identity(RUN),"valid UUID hex");
  for(String bad:new String[]{null,"","a","A".repeat(32),"a".repeat(31),"a".repeat(33),"/".repeat(32)})check(!IslandFixtureProtocol.identity(bad),"bad identity");
  String[] commands={"play","pause","stop","release","notice-expiry","notice-click","finish","observe"};
  for(String c:commands){
   check(admit(RUN,SECRET,4,5,c,1999,false)==1,"actual known command accepted before deadline");
   check(admit(RUN,SECRET,4,5,c,2000,false)==2,"deadline inclusive; no command extends lifetime");
   check(admit(RUN,SECRET,4,5,c,2001,false)==2,"late authenticated command cleanup only");
   check(admit(RUN,SECRET,4,5,c,1999,true)==0,"closed cannot restart");
  }
  check(admit("c".repeat(32),SECRET,4,5,"play",1000,false)==0,"foreign run");
  check(admit(RUN,"c".repeat(32),4,5,"play",1000,false)==0,"foreign secret");
  check(admit(RUN,"c".repeat(32),4,5,"play",3000,false)==0,"unauthenticated expiry cannot close someone else's run");
  check(admit(null,SECRET,4,5,"play",1000,false)==0,"null run");
  check(admit(RUN,null,4,5,"play",1000,false)==0,"null secret");
  for(int sequence:new int[]{-1,Integer.MAX_VALUE})check(admit(RUN,SECRET,sequence,sequence+1,"play",1000,false)==0,"invalid sequence/overflow");
  for(int next:new int[]{-1,0,3,4,6,Integer.MAX_VALUE})check(admit(RUN,SECRET,4,next,"play",1000,false)==0,"no replay/gap/out-of-order");
  for(String bad:new String[]{null,"","PLAY","cancelAll","pause-user","finish ","observe\\n"})check(admit(RUN,SECRET,4,5,bad,1000,false)==0,"unknown command");
  check(IslandFixtureProtocol.notificationTimeout(2000,1000)==1000,"notification cannot outlive remaining fixed run");
  check(IslandFixtureProtocol.notificationTimeout(2000,1999)==1,"one millisecond remaining");
  check(IslandFixtureProtocol.notificationTimeout(2000,2000)==1,"timeout not zero Android no-timeout sentinel");
  check(IslandFixtureProtocol.notificationTimeout(2000,3000)==1,"expired notification no renewed lifetime");
  System.out.println("PASS "+checks);
 }
}'''

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=Path,default=ROOT/'out/island-validation-fixture-offline/protocol');a=p.parse_args();a.output.mkdir(parents=True,exist_ok=True)
    actual=SOURCE.read_text('utf-8');results=[]
    variants=[('actual',actual),('no-secret',actual.replace('||!secret.equals(receivedSecret)','')),
        ('replay-allowed',actual.replace('||next!=sequence+1','')),
        ('deadline-exclusive',actual.replace('now>=deadline','now>deadline')),
        ('renew-notification-lifetime',actual.replace('Math.max(1,deadline-now)','175000')),
        ('closed-restarts',actual.replace('if(closed||','if('))]
    for name,source in variants:
        if name!='actual' and source==actual:raise AssertionError('Mutation not applied '+name)
        with tempfile.TemporaryDirectory() as td:
            folder=Path(td);(folder/'IslandFixtureProtocol.java').write_text(source,encoding='utf-8');(folder/'FixtureProtocolCases.java').write_text(HARNESS,encoding='utf-8')
            built=subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',str(folder),str(folder/'IslandFixtureProtocol.java'),str(folder/'FixtureProtocolCases.java')],capture_output=True)
            if built.returncode:raise AssertionError(built.stderr.decode('utf-8','replace'))
            run=subprocess.run([str(JAVA/'java.exe'),'-cp',str(folder),'ls.augment.regression.island.FixtureProtocolCases'],capture_output=True)
            row={'variant':name,'compileExit':built.returncode,'exitCode':run.returncode,'stdout':run.stdout.decode('utf-8','replace'),'stderr':run.stderr.decode('utf-8','replace')};results.append(row)
            if (run.returncode==0)!=(name=='actual'):raise AssertionError('Unexpected policy result '+name)
    builder=ROOT/'tools/build-island-runtime-fixture.py';spec=importlib.util.spec_from_file_location('fixture_builder_offline',builder);module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    root=ET.fromstring(module.MANIFEST);ns='{http://schemas.android.com/apk/res/android}'
    assert [e.get(ns+'name') for e in root.findall('uses-permission')]==['android.permission.POST_NOTIFICATIONS']
    assert root.get('package')=='ls.augment.regression.island'
    assert root.find('instrumentation').get(ns+'targetPackage')=='ls.augment.regression.island'
    assert all(e.get(ns+'exported')=='false' for e in root.findall('./application/activity'))
    runner=(SOURCE.parent/'IslandFixtureRunner.java').read_text('utf-8')
    # Static safety contracts supplement actual admission execution; they are not device claims.
    assert 'deadline=started+175000' in runner and runner.count('deadline=')==1
    assert 'IslandFixtureProtocol.admit(' in runner and 'IslandFixtureProtocol.notificationTimeout(' in runner
    assert '"android.permission.DUMP",main,Context.RECEIVER_EXPORTED' in runner
    assert 'cancelAll(' not in runner and 'requestAudioFocus' not in runner and 'MediaPlayer' not in runner and 'AudioTrack' not in runner
    assert 'notifications.cancel(tag,1);notifications.cancel(tag,2)' in runner
    report={'status':'pass','sourceSha256':hashlib.sha256(SOURCE.read_bytes()).hexdigest(),'actual':results[0],'mutantsRejected':results[1:],'manifestPermission':['POST_NOTIFICATIONS'],'phoneUsed':False,'apkBuilt':False,'limitation':'Actual pure admission method and static fixture contracts only; Android service/lifecycle behavior still needs owned phone validation'}
    (a.output/'checks.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps(report,ensure_ascii=False,indent=2))
if __name__=='__main__':main()
