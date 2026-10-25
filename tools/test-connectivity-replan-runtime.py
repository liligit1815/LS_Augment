"""Exercise production circle draw/replan transitions without claiming device CPU results."""
from pathlib import Path
import argparse
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/ConnectivityIconView.java').read_text('utf-8')


def extract(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


HARNESS = r'''import java.util.*;
public class TestConnectivityReplan {
 static int checks;static void check(boolean pass,String why){checks++;if(!pass)throw new AssertionError(why);}
 static class Snapshot {String checksum="settings-1";}
 static class Layers {String token="artwork-1";}
 static class Plan {boolean accepted=true,wholeCovered;}
 static class Frame {Object nativeState,font;Snapshot snapshot;Layers layers;Plan plan=new Plan();}
 static class FeatureSettings {static Snapshot settings=new Snapshot();static Snapshot snapshot(Object context){return settings;}}
 static class StatusBarAssetsHook {static Layers layers=new Layers();static Object font=new Object();static Layers circleLayers(Object view){return layers;}static Object typeface(Object view,String role,Object original){return font;}}
 static class Circle {
  boolean committed,preparing,requested;Frame frame;Runnable invalidated;String problem="";
  long generation,committedGeneration=-1;Object nativeState=new Object();int requests,invalidates,callbacks;
  Object getContext(){return this;}Object sourceState(){return nativeState;}
  boolean isLayoutRequested(){return requested;}void requestLayout(){requested=true;requests++;}void invalidate(){invalidates++;}
  Circle(){invalidated=()->callbacks++;}
  void traversal(){requested=false;}
  void prepared(boolean accepted){frame=new Frame();frame.nativeState=nativeState;frame.font=StatusBarAssetsHook.font;
   frame.snapshot=FeatureSettings.settings;frame.layers=StatusBarAssetsHook.layers;frame.plan.accepted=accepted;generation++;}
  // PRODUCTION
 }
 static void passiveDraws(Circle circle,String state){int requests=circle.requests,callbacks=circle.callbacks,invalidates=circle.invalidates;
  for(int i=0;i<1200;i++){circle.traversal();check(!circle.frameCurrent(),state+" never draws uncommitted content");}
  check(circle.requests==requests&&circle.callbacks==callbacks&&circle.invalidates==invalidates,state+" cannot create a 120 Hz draw/layout loop");}
 public static void main(String[] args){
  Circle c=new Circle();passiveDraws(c,"initial source pending");
  c.prepared(false);c.commit();check(c.invalidates==0,"an unusable plan does not schedule a repaint");passiveDraws(c,"capacity rejected");
  c.prepared(true);c.commit();check(c.frameCurrent()&&c.invalidates==1,"a newly committed usable generation paints once");
  for(int i=0;i<1200;i++){c.traversal();c.commit();check(c.frameCurrent(),"stable committed generation remains drawable");}
  check(c.invalidates==1&&c.requests==0,"repacking one unchanged generation does not self-schedule frames");
  c.prepared(true);c.commit();check(c.invalidates==2,"a new prepared generation invalidates even while previously committed");
  c.nativeState=new Object();check(!c.frameCurrent()&&c.requests==1&&c.callbacks==1,"a committed stale source schedules one real replan");
  passiveDraws(c,"stale generation awaiting grid");
  c.traversal();c.dirty();check(c.requests==2&&c.callbacks==2,"a later real source event can wake an uncommitted view");
  c.prepared(true);c.commit();check(c.frameCurrent(),"the next source generation recovers normally");
  c.uncommit();passiveDraws(c,"grid suspended packing");
  int draws=c.invalidates;c.commit();check(c.frameCurrent()&&c.invalidates==draws+1,"restoring ownership of the same generation paints it once");
  c.preparing=true;StatusBarAssetsHook.layers=new Layers();StatusBarAssetsHook.layers.token="artwork-2";int requests=c.requests;
  c.artworkChanged();check(c.requests==requests,"artwork discovery during preparation does not recursively replan");
  c.preparing=false;c.artworkChanged();check(c.requests==requests+1&&!c.committed,"asynchronous artwork completion wakes the grid");
  passiveDraws(c,"artwork awaiting new measurement");
  c.prepared(true);c.commit();check(c.frameCurrent(),"new artwork can become drawable");
  c.traversal();c.drawFailed();check(c.frame==null&&!c.committed&&c.requests==requests+2,"a draw failure withdraws ownership and schedules one retry");
  passiveDraws(c,"failed artwork awaiting fallback");
  c.prepared(false);c.commit();passiveDraws(c,"failed retry remains native");
  System.out.println("Connectivity draw/replan lifecycle: "+checks+" assertions passed (runtime facade, not device CPU evidence)");
 }
}'''


def run(mutations=False):
    candidates = [('production', SOURCE)]
    if mutations:
        assert 'if(!committed)return false;' in SOURCE
        candidates.append(('retry-uncommitted-draws', SOURCE.replace('if(!committed)return false;', '', 1)))
        commit = extract(SOURCE, 'void commit()')
        candidates.append(('invalidate-every-commit', SOURCE.replace(commit, 'void commit(){committed=usable();invalidate();}', 1)))
    configured = os.environ.get('JAVA_HOME')
    jdk = Path(configured) / 'bin' if configured else Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
    with tempfile.TemporaryDirectory(prefix='duo-connectivity-replan-') as tmp:
        path = Path(tmp) / 'TestConnectivityReplan.java'
        for name, source in candidates:
            members = '\n'.join(extract(source, marker) for marker in (
                'boolean usable()', 'void commit()', 'void uncommit()', 'private void dirty()',
                'void drawFailed()', 'void artworkChanged()', 'boolean frameCurrent()'))
            path.write_text(HARNESS.replace('// PRODUCTION', members), 'utf-8')
            subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '--release', '17', '-d', tmp, str(path)], check=True)
            result = subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestConnectivityReplan'], text=True, capture_output=True, timeout=20)
            if name == 'production':
                if result.returncode:
                    raise AssertionError(result.stdout + result.stderr)
                print(result.stdout.strip())
            else:
                if result.returncode == 0:
                    raise AssertionError('Regression survived: ' + name)
                print('Caught regression: ' + name)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--mutations', action='store_true')
    run(parser.parse_args().mutations)
