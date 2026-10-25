"""Execute actual Tool Saved/WindowLease/stale-result bodies; no Android UI claim."""
from pathlib import Path
import json
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
NATIVE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-text-segmenter.py")))

def block(source, marker):
    begin = source.index(marker); opening = source.index("{", begin); depth = 1; end = opening + 1
    while depth:
        if source[end] == "{": depth += 1
        elif source[end] == "}": depth -= 1
        end += 1
    return source[begin:end]

BUNDLE = r'''package android.os; import java.util.*;
public class Bundle {
 final Map<String,Object> values=new HashMap<>();
 public void putString(String k,String v){values.put(k,v);} public String getString(String k){return (String)values.get(k);}
 public void putIntArray(String k,int[] v){values.put(k,v);} public int[] getIntArray(String k){return (int[])values.get(k);}
 public void putInt(String k,int v){values.put(k,v);} public int getInt(String k,int d){return values.containsKey(k)?(Integer)values.get(k):d;}
 public void putLong(String k,long v){values.put(k,v);} public long getLong(String k,long d){return values.containsKey(k)?(Long)values.get(k):d;}
 public void putBoolean(String k,boolean v){values.put(k,v);} public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}
 int modeledSize(){int n=12;for(var e:values.entrySet()){n+=8+((e.getKey().length()+1)*2+3)/4*4;Object v=e.getValue();
 if(v instanceof String)n+=4+((((String)v).length()+1)*2+3)/4*4;else if(v instanceof int[])n+=4+((int[])v).length*4;
 else n+=v instanceof Long?8:4;}return n;}
}'''
PARCEL = r'''package android.os; public class Parcel {
 private int size;public static Parcel obtain(){return new Parcel();} public void writeBundle(Bundle b){size=b.modeledSize();}
 public int dataSize(){return size;} public void recycle(){}
}'''
WINDOW = r'''package android.view; public class Window {
 private WindowManager.LayoutParams attributes=new WindowManager.LayoutParams();
 public WindowManager.LayoutParams getAttributes(){return attributes;} public void setAttributes(WindowManager.LayoutParams p){attributes=p;}
}'''
MANAGER = r'''package android.view; public class WindowManager { public static class LayoutParams {
 public static final int FLAG_NOT_TOUCHABLE=16, FLAG_NOT_FOCUSABLE=8;public int flags;public float alpha=1f;
}}'''
VIEW = r'''package android.view; public class View {Object tag;public void setTag(Object t){tag=t;}public Object getTag(){return tag;}}'''

TEST = r'''
 static int cases, assertions;static void check(boolean v,String code){assertions++;if(!v)throw new AssertionError(code);}
 interface Case{void run();}static void test(Case r){r.run();cases++;}
 static void reject(Case r){boolean failed=false;try{r.run();}catch(IllegalArgumentException expected){failed=true;}check(failed,"INVALID_SAVED_STATE_ACCEPTED");}
 static Saved saved(String text,int[] spans,int[] chosen){return new Saved(text,spans,chosen,7,true,false,true,0,-12,42,0,text.length(),true,55,0,text.length());}
 public static void main(String[] args){
 test(()->{var original=new AtomicWorkbenchTextSelection("中国 Android",new int[]{0,2,2,3,3,10});original.toggle(0);original.splitSelectedWords();original.toggle(1);
  var state=original.snapshot();var saved=saved(state.text,state.spans(),state.selectedRanges());var result=Saved.from(saved.bundle());
  check(result.model().selectedText().equals("中")&&result.model().tokens().size()==4,"EXACT_SPLIT_AND_SELECTED_RESTORE");
  check(result.range&&result.open&&result.preview&&result.top==-12&&result.outerY==42&&result.previewY==55,"UI_POSITION_AND_MODE_RESTORE");});
 test(()->{int[] spans={0,2,2,3,3,10},chosen={0,2};var saved=saved("中国 Android",spans,chosen);spans[0]=9;chosen[0]=9;
  check(saved.model().selectedText().equals("中国"),"SAVED_INPUT_ARRAY_ALIAS");
  var bundle=saved.bundle();bundle.getIntArray("spans")[0]=9;bundle.getIntArray("selected")[0]=9;
  check(saved.bundle().getIntArray("spans")[0]==0&&saved.bundle().getIntArray("selected")[0]==0,"BUNDLE_OUTPUT_ARRAY_ALIAS");
  check(saved.model().selectedText().equals("中国"),"BUNDLE_OUTPUT_CONTENT_CHANGED");});
 test(()->{var bundle=saved("中国 Android",new int[]{0,2,2,3,3,10},new int[]{0,2}).bundle();var restored=Saved.from(bundle);
  bundle.getIntArray("spans")[0]=9;check(restored.model().selectedText().equals("中国"),"RESTORED_BUNDLE_ARRAY_ALIAS");});
 test(()->{String input="x".repeat(32768);int[] spans=new int[input.length()*2];for(int i=0;i<input.length();i++){spans[i*2]=i;spans[i*2+1]=i+1;}
  var maximum=saved(input,spans,spans);Bundle packed=maximum.bundle();Parcel p=Parcel.obtain();p.writeBundle(packed);
  check(p.dataSize()<=600*1024&&Saved.from(packed).model().selectedText().equals(input),"MAXIMUM_FULL_SNAPSHOT_WITHOUT_TRUNCATION");});
 test(()->{var dirty=Saved.fresh("unsegmented draft");check(dirty.model()==null&&Saved.from(dirty.bundle()).text.equals(dirty.text),"UNSEGMENTED_DRAFT_STATE");});
 test(()->{var source=saved("🙂",new int[]{0,2},new int[]{0,2});var modified=source.withScroll(0,-22).withOpen(false);
  check(!modified.open&&modified.top==-22&&source.top==-12,"IMMUTABLE_SCROLL_COPY");});
 test(()->{reject(()->saved("abc",new int[]{0,1},new int[0]));reject(()->saved("abc",new int[]{0,3},new int[]{1,3}));
  reject(()->saved("\ud800",null,null));reject(()->saved("x".repeat(32769),null,null));reject(()->saved("abc",new int[]{0,3},null));});
 test(()->{var base=saved("🙂",new int[]{0,2},new int[]{0,2}).bundle();base.putInt("cursorStart",1);reject(()->Saved.from(base));
  base.putInt("cursorStart",0);base.putInt("anchor",1);reject(()->Saved.from(base));
  base.putInt("anchor",0);base.putInt("previewStart",1);reject(()->Saved.from(base));});
 test(()->{var base=Saved.fresh("abc").bundle();base.putInt("previewStart",-1);base.putInt("previewEnd",2);reject(()->Saved.from(base));
  base.putInt("previewEnd",-1);base.putInt("outerY",-1);reject(()->Saved.from(base));});
 test(()->{var window=new Window();window.getAttributes().flags=8|128;window.getAttributes().alpha=.65f;var lease=new WindowLease(window);lease.hide();
  check(window.getAttributes().flags==(8|16|128)&&window.getAttributes().alpha==0f,"DRAG_WINDOW_YIELD");
  window.getAttributes().flags|=1024;lease.restore();check(window.getAttributes().flags==(8|128|1024)&&window.getAttributes().alpha==.65f,"RESTORE_ONLY_OWN_WINDOW_FLAGS");});
 test(()->{var window=new Window();window.getAttributes().flags=16|8;window.getAttributes().alpha=.8f;var lease=new WindowLease(window);lease.hide();
  window.getAttributes().alpha=.3f;lease.restore();check(window.getAttributes().flags==(16|8)&&window.getAttributes().alpha==.3f,"PRESERVE_EXTERNAL_WINDOW_CHANGES");});
 test(()->{var owner=new ToolLogic();owner.dialog=new Object();owner.input=new Input("source");owner.generation=10;
  check(owner.current(10,"source"),"CURRENT_RESULT_REJECTED");check(!owner.current(9,"source"),"STALE_RESULT_GENERATION_ACCEPTED");
  check(!owner.current(10,"different"),"STALE_RESULT_SOURCE_ACCEPTED");owner.closed=true;check(!owner.current(10,"source"),"CLOSED_OWNER_RESULT_ACCEPTED");
  owner.closed=false;owner.dialog=null;check(!owner.current(10,"source"),"DISMISSED_OWNER_RESULT_ACCEPTED");});
 test(()->{var rows=new WordRows();rows.setModel(null);
  check(rows.cancelled&&rows.cancelRange&&rows.rows.isEmpty()&&rows.renderedTokens.isEmpty()&&!rows.layoutBusy,"CLEAR_OLD_WORD_ROWS_AND_PLANNING");
  check(rows.notifications==1&&rows.layoutNotifications==1&&rows.generation==1,"CLEAR_MODEL_NOTIFIES_REAL_EMPTY_STATE");
  var next=new AtomicWorkbenchTextSelection("word",new int[]{0,4});rows.setModel(next);
  check(rows.model==next&&rows.plans==1,"NEW_MODEL_PLANNED_AFTER_CLEAR");});
 test(()->{var rows=new WordRows();rows.model=new AtomicWorkbenchTextSelection("one two",new int[]{0,3,3,4,4,7});View source=new View();source.setTag(2);
  check(rows.longPress(source)&&rows.dragAttempts==1&&rows.model.selectedText().equals("two"),"HANDLED_LONGPRESS_MUST_NOT_FALL_THROUGH");
  check(!rows.dragStarted&&rows.model.selectedCount()==1,"FAILED_DRAG_IS_NOT_DRAG_SUCCESS");
  rows.rangeMode=true;check(!rows.longPress(source)&&rows.dragAttempts==1,"RANGE_MODE_IS_NOT_NATIVE_DRAG");
  rows.rangeMode=false;rows.valid=false;check(!rows.longPress(source)&&rows.dragAttempts==1,"STALE_CHIP_CANNOT_DRAG");});
 System.out.println("TEXT TOOL LOGIC RESULT "+cases+" cases; "+assertions+" assertions; Android Parcel sizing and UI touch require device");
 }
'''

def execute(tool, expected=None, word_source=None):
    saved=block(tool,"static final class Saved {")
    lease=block(tool,"private static final class WindowLease {")
    current=block(tool,"private boolean current(long operation, String source) {")
    word_source=word_source if word_source is not None else (ROOT/"android/app/src/main/java/ls/augment/com/AtomicWorkbenchWordList.java").read_text(encoding="utf-8")
    clear=block(word_source,"void setModel(AtomicWorkbenchTextSelection next) {")
    long_press=block(word_source,"private boolean longPress(View view) {")
    word_rows=r'''static class WordRows {
 boolean cancelRange,cancelled,layoutBusy=true,rangeMode,valid=true,dragStarted;long generation;int notifications,layoutNotifications,plans,dragAttempts;
 AtomicWorkbenchTextSelection model;java.util.List<?> rows=java.util.List.of(1),renderedTokens=java.util.List.of(1);
 final Planning planning=new Planning();class Planning{void cancel(boolean v){cancelled=v;}}
 static final Layout LAYOUT=new Layout();static class Layout{void purge(){}}
 final Adapter adapter=new Adapter();class Adapter{void notifyDataSetChanged(){notifications++;}}
 final Listener listener=new Listener();class Listener{void layoutState(boolean busy,String text){layoutNotifications++;}void selectionChanged(){}boolean dragSelected(View source){dragAttempts++;return dragStarted;}}
 boolean currentCell(View view){return valid;}void refreshSelection(){}
 void endRange(boolean v){cancelRange=v;}void planRows(){plans++;}
'''+clear+long_press+'}\n'
    wrapper="""package ls.augment.com; import android.os.*; import android.view.*;import java.util.Collections;
public final class ToolLogic {static final int MAX_SAVED_BYTES=600*1024;
 boolean closed;Object dialog;long generation;Input input;static class Input{final String text;Input(String s){text=s;}CharSequence getText(){return text;}}
"""+saved+lease+current+word_rows+TEST+"}\n"
    with tempfile.TemporaryDirectory(prefix="duo-text-tool-") as temporary:
        root=Path(temporary);sources=dict(NATIVE["STUBS"])
        sources.update({"android/os/Bundle.java":BUNDLE,"android/os/Parcel.java":PARCEL,
                        "android/view/Window.java":WINDOW,"android/view/WindowManager.java":MANAGER,"android/view/View.java":VIEW,
                        "ls/augment/com/ToolLogic.java":wrapper,
                        "ls/augment/com/AtomicWorkbenchTextSelection.java":(ROOT/"android/app/src/main/java/ls/augment/com/AtomicWorkbenchTextSelection.java").read_text(encoding="utf-8"),
                        "ls/augment/com/AtomicWorkbenchTextSegmenter.java":(ROOT/"android/app/src/main/java/ls/augment/com/AtomicWorkbenchTextSegmenter.java").read_text(encoding="utf-8")})
        paths=[]
        for name,body in sources.items():
            path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(body,encoding="utf-8");paths.append(str(path))
        build=subprocess.run([SUPPORT["JAVAC"],"-encoding","UTF-8","-d",str(root),*paths],env=SUPPORT["ENV"],capture_output=True,text=True,errors="replace",timeout=60)
        if build.returncode:raise AssertionError(build.stderr)
        result=subprocess.run([SUPPORT["JAVA"],"-cp",str(root),"ls.augment.com.ToolLogic"],env=SUPPORT["ENV"],capture_output=True,text=True,errors="replace",timeout=30)
        if expected:
            if result.returncode==0 or expected not in result.stderr:raise AssertionError("Negative control missed: "+expected+"\n"+result.stderr)
            print("PASS rejected tool negative: "+expected)
        else:
            if result.returncode:raise AssertionError(result.stderr)
            print(result.stdout,end="")

if __name__=="__main__":
    source=(ROOT/"android/app/src/main/java/ls/augment/com/AtomicWorkbenchTextTool.java").read_text(encoding="utf-8")
    execute(source)
    execute(source.replace('spans == null ? null : spans.clone()); out.putIntArray("selected", chosen == null ? null : chosen.clone())',
                           'spans); out.putIntArray("selected", chosen)'),"BUNDLE_OUTPUT_ARRAY_ALIAS")
    execute(source.replace('value.flags &= ~added;', 'value.flags = 0;'),"RESTORE_ONLY_OWN_WINDOW_FLAGS")
    execute(source.replace('operation == generation &&', 'true &&'),"STALE_RESULT_GENERATION_ACCEPTED")
    word=(ROOT/"android/app/src/main/java/ls/augment/com/AtomicWorkbenchWordList.java").read_text(encoding="utf-8")
    execute(source,"CLEAR_OLD_WORD_ROWS_AND_PLANNING",word.replace('rows = Collections.emptyList(); renderedTokens = Collections.emptyList(); adapter.notifyDataSetChanged();',
        'renderedTokens = Collections.emptyList(); adapter.notifyDataSetChanged();'))
    execute(source,"HANDLED_LONGPRESS_MUST_NOT_FALL_THROUGH",word.replace('listener.dragSelected(view);\n        return true;', 'return listener.dragSelected(view);'))
