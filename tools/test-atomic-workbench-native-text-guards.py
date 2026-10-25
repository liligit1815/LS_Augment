"""Execute production anonymous TextView/EditText overrides against framework native-action delegation."""
from pathlib import Path
import argparse
import runpy
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-extraction-root-fence.py")))
JAVA, MEMBER = SUPPORT["JAVA"], SUPPORT["MEMBER"]
SRC = JAVA["SRC"]
STUBS = {
 "android/os/Bundle.java": "package android.os;public class Bundle {}",
 "android/graphics/Typeface.java": '''package android.graphics;public class Typeface {public static final int NORMAL=0,BOLD=1;public final String family;public final int style;Typeface(String f,int s){family=f;style=s;}public static Typeface create(String f,int s){return new Typeface(f,s);}}''',
 "android/widget/TextView.java": '''package android.widget;public class TextView {
 public int nativeContextCalls,nativeAccessibilityCalls,clipboardWrites;public String text;public float size;public int color;public boolean padding=true;public android.graphics.Typeface font;
 public TextView(Object activity){}public void setText(String s){text=s;}public void setTextSize(float s){size=s;}public void setTextColor(int c){color=c;}public void setIncludeFontPadding(boolean b){padding=b;}public void setTypeface(android.graphics.Typeface t){font=t;}
 public boolean onTextContextMenuItem(int id){nativeContextCalls++;if(id==123)clipboardWrites++;return true;}
 public boolean performAccessibilityAction(int action,android.os.Bundle args){nativeAccessibilityCalls++;return action==16384?onTextContextMenuItem(123):true;}}
''',
 "android/widget/EditText.java": "package android.widget;public class EditText extends TextView {public EditText(Object activity){super(activity);}}",
}
TEST = r'''package ls.augment.com;import android.widget.*;import java.util.function.BooleanSupplier;
public class TestNativeTextGuards {
 static int cases,checks;static void yes(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}interface Case{void run();}static void test(String name,Case c){c.run();cases++;System.out.println("PASS native text guard: "+name);}
 static TextView text(BooleanSupplier guard){return new UiKit().guardedText("synthetic",14,0x123456,true,guard);}
 static TextView edit(BooleanSupplier guard){AtomicWorkbenchTextTool tool=new AtomicWorkbenchTextTool();tool.setActionGuard(guard);return tool.create();}
 static void denied(TextView v){yes(!v.onTextContextMenuItem(123),"native context COPY bypassed revoked guard");yes(!v.performAccessibilityAction(16384,new android.os.Bundle()),"native accessibility COPY bypassed revoked guard");yes(!v.performAccessibilityAction(1,new android.os.Bundle()),"native accessibility action bypassed revoked guard");yes(v.nativeContextCalls==0&&v.nativeAccessibilityCalls==0&&v.clipboardWrites==0,"invalid guard delegated to native widget");}
 public static void main(String[] args){
  for(boolean editor:new boolean[]{false,true}){
   test("actual anonymous "+(editor?"EditText":"TextView")+" preserves admitted native actions",()->{TextView v=editor?edit(()->true):text(()->true);yes(v.onTextContextMenuItem(123)&&v.clipboardWrites==1,"valid context copy refused");yes(v.performAccessibilityAction(16384,new android.os.Bundle())&&v.clipboardWrites==2&&v.nativeAccessibilityCalls==1,"valid accessibility copy refused");});
   test("revoked current capture blocks all native action entries "+editor,()->denied(editor?edit(()->false):text(()->false)));
   test("throwing guard fails closed "+editor,()->denied(editor?edit(()->{throw new IllegalStateException("synthetic");}):text(()->{throw new IllegalStateException("synthetic");})));
   test("already created widget sees new reset/owner/config state "+editor,()->{boolean[] current={true};TextView v=editor?edit(()->current[0]):text(()->current[0]);current[0]=false;denied(v);current[0]=true;yes(v.onTextContextMenuItem(123)&&v.clipboardWrites==1,"restored current widget did not delegate");});
   test("native accessibility COPY reenters current context guard after first authorization "+editor,()->{int[] calls={0};BooleanSupplier guard=()->calls[0]++==0;TextView v=editor?edit(guard):text(guard);yes(!v.performAccessibilityAction(16384,new android.os.Bundle())&&v.nativeAccessibilityCalls==1&&v.nativeContextCalls==0&&v.clipboardWrites==0,"late reset passed native accessibility COPY");});
  }
  test("legacy and guarded UiKit typography share exact production style method",()->{UiKit ui=new UiKit();TextView a=ui.text("synthetic",16,0xabcdef,true),b=ui.guardedText("synthetic",16,0xabcdef,true,()->true);yes(a.text.equals(b.text)&&a.size==b.size&&a.color==b.color&&a.padding==b.padding&&a.font.family.equals(b.font.family)&&a.font.style==b.font.style,"guarded widget changed existing UiKit text style");});
  test("optional TextTool guard keeps normal tools compatible and closed tools revoke",()->{AtomicWorkbenchTextTool tool=new AtomicWorkbenchTextTool();EditText v=tool.create();yes(v.onTextContextMenuItem(123),"default unguarded tool changed behavior");tool.closed=true;int writes=v.clipboardWrites;yes(!v.onTextContextMenuItem(123)&&v.clipboardWrites==writes,"closed tool native copy bypassed lifecycle");});
  test("null TextTool action guard restores optional default and null guardedText refuses",()->{AtomicWorkbenchTextTool tool=new AtomicWorkbenchTextTool();tool.setActionGuard(()->false);tool.setActionGuard(null);yes(tool.create().onTextContextMenuItem(123),"optional null guard incompatible");denied(text(null));});
  System.out.println("NATIVE TEXT GUARDS RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def run(mutation=None):
    ui_source = (SRC / "UiKit.java").read_text(encoding="utf-8")
    tool_source = (SRC / "AtomicWorkbenchTextTool.java").read_text(encoding="utf-8")
    ui = "package ls.augment.com;import android.widget.*;import android.graphics.Typeface;class UiKit {final Object activity=new Object();float compactTextSize(float v){return v*.95f;}" + "\n".join(MEMBER(ui_source, marker) for marker in ["TextView text(String value", "TextView guardedText(", "private TextView styleText("]) + "}"
    edit = MEMBER(tool_source, "new EditText(ui.activity)")
    tool = "package ls.augment.com;import android.widget.EditText;import android.os.Bundle;class AtomicWorkbenchTextTool {final UiKit ui=new UiKit();boolean closed;private java.util.function.BooleanSupplier actionGuard=()->true;" + MEMBER(tool_source, "void setActionGuard(") + MEMBER(tool_source, "private boolean actionAllowed(") + "EditText create(){return " + edit + ";}}"
    sources = dict(STUBS)
    sources.update({"ls/augment/com/UiKit.java": ui, "ls/augment/com/AtomicWorkbenchTextTool.java": tool, "ls/augment/com/TestNativeTextGuards.java": TEST})
    if mutation:
        key, before, after, expected = mutation
        assert sources[key].count(before) == 1, before
        sources[key] = sources[key].replace(before, after)
    with tempfile.TemporaryDirectory(prefix="duo-native-text-guards-") as temporary:
        work = Path(temporary); files = []
        for name, source in sources.items():
            path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(source, encoding="utf-8"); files.append(str(path))
        result = subprocess.run([JAVA["JAVAC"], "-encoding", "UTF-8", "--release", "17", "-d", str(work / "classes"), *files], env=JAVA["ENV"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=45)
        if result.returncode: raise AssertionError(result.stdout + result.stderr)
        return subprocess.run([JAVA["JAVA"], "-cp", str(work / "classes"), "ls.augment.com.TestNativeTextGuards"], env=JAVA["ENV"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=30)


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument("--negative-controls", action="store_true"); args = parser.parse_args()
    result = run(); print(result.stdout, end="")
    if result.returncode: raise AssertionError(result.stderr)
    if not args.negative_controls: return
    mutations = [
        ("ls/augment/com/UiKit.java", "return allowed() && super.onTextContextMenuItem(id);", "return super.onTextContextMenuItem(id);", "native context COPY bypassed revoked guard"),
        ("ls/augment/com/UiKit.java", "return allowed() && super.performAccessibilityAction(action, arguments);", "return super.performAccessibilityAction(action, arguments);", "native accessibility action bypassed revoked guard"),
        ("ls/augment/com/AtomicWorkbenchTextTool.java", "return actionAllowed() && super.onTextContextMenuItem(id);", "return super.onTextContextMenuItem(id);", "native context COPY bypassed revoked guard"),
        ("ls/augment/com/AtomicWorkbenchTextTool.java", "return !closed && actionGuard.getAsBoolean();", "return actionGuard.getAsBoolean();", "closed tool native copy bypassed lifecycle"),
    ]
    for mutation in mutations:
        result = run(mutation)
        if result.returncode == 0 or mutation[3] not in result.stdout + result.stderr: raise AssertionError(result.stdout + result.stderr)
        print("PASS native text guard negative control: " + mutation[3])


if __name__ == "__main__": main()
