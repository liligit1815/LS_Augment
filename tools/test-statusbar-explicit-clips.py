"""Exercise explicit clipping across OEM animation updates and module teardown."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarClipping.java'
sources = {
    'android/graphics/Rect.java': '''package android.graphics;
public class Rect {public int left;public Rect(int l){left=l;}public Rect(Rect r){left=r.left;}}''',
    'android/view/View.java': '''package android.view;import android.graphics.Rect;
public class View {Rect clip;boolean outline;public Rect getClipBounds(){return clip;}
public void setClipBounds(Rect r){clip=r;}public boolean getClipToOutline(){return outline;}
public void setClipToOutline(boolean b){outline=b;}}''',
    'ls/augment/com/hook/TestClips.java': '''package ls.augment.com.hook;
import android.graphics.Rect;import android.view.View;
public class TestClips {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 public static void main(String[] args){
  StatusBarClipping state=new StatusBarClipping();View clock=new View(),fanParent=new View(),nativeView=new View();
  clock.setClipBounds(new Rect(40));fanParent.setClipToOutline(true);
  state.release(clock);state.release(fanParent);state.release(nativeView);
  check(clock.getClipBounds()==null,"hour clipping removed");check(!fanParent.getClipToOutline(),"vendor ancestor outline removed");
  clock.setClipBounds(new Rect(60));state.release(clock);state.release(clock);
  state.restore();check(clock.getClipBounds().left==60,"latest native animation clip restored");
  check(fanParent.getClipToOutline(),"native outline restored");check(nativeView.getClipBounds()==null&&!nativeView.getClipToOutline(),"unclipped view untouched");
  state.release(clock);clock.setClipBounds(new Rect(80));state.restore();
  check(clock.getClipBounds().left==80,"new OEM write wins over restore");
  clock.setClipBounds(null);state.restore();check(clock.getClipBounds()==null,"restore clears ownership");
  System.out.println("PASS explicit status-bar clipping: "+checks+" assertions");
 }
}''',
}
sources['ls/augment/com/hook/StatusBarClipping.java'] = source.read_text(encoding='utf-8')
grid = (source.parent / 'StatusBarGridHook.java').read_text(encoding='utf-8')
assert 'explicitClips.release(v)' in grid and 'explicitClips.release(p)' in grid
assert 'explicitClips.restore();' in grid
with tempfile.TemporaryDirectory(prefix='lsa-clips-') as directory:
    root = Path(directory)
    files = []
    for name, text in sources.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf-8')
        files.append(str(path))
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', directory, *files], check=True)
    subprocess.run(['java', '-cp', directory, 'ls.augment.com.hook.TestClips'], check=True)
