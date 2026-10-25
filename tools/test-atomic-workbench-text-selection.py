"""Run original-text, Unicode, gesture and restored-selection behavior without Android UI."""
from pathlib import Path
import runpy
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))

TEST = r'''package ls.augment.com;
import java.util.*;
public final class TestWorkbenchTextSelection {
 static int cases,assertions;interface Case{void run();}static void check(boolean v,String m){assertions++;if(!v)throw new AssertionError(m);}
 static void test(String name,Case body){body.run();cases++;System.out.println("PASS text selection: "+name);}
 static AtomicWorkbenchTextSelection words(String... parts){StringBuilder s=new StringBuilder();int[] spans=new int[parts.length*2];
  for(int i=0;i<parts.length;i++){spans[i*2]=s.length();s.append(parts[i]);spans[i*2+1]=s.length();}return new AtomicWorkbenchTextSelection(s.toString(),spans);}
 static void rejected(Runnable r){try{r.run();throw new AssertionError("invalid state accepted");}catch(IllegalArgumentException expected){assertions++;}}
 static int[] codePoints(String text){int[] spans=new int[text.codePointCount(0,text.length())*2];int n=0;
  for(int p=0;p<text.length();){spans[n++]=p;p+=Character.charCount(text.codePointAt(p));spans[n++]=p;}return spans;}
 static void complete(AtomicWorkbenchTextSelection m){StringBuilder restored=new StringBuilder();int end=0;
  for(var token:m.tokens()){check(token.start==end&&token.end>token.start,"token gap/overlap");restored.append(token.text);end=token.end;}
  check(restored.toString().equals(m.originalText())&&end==m.originalText().length(),"source changed");}
 public static void main(String[] args){
  test("all selection preserves leading trailing and internal exact whitespace",()->{var m=words(" \t","中国","\r\n","Android","\u00a0 ");m.selectAll();
   check(m.selectedCount()==2&&m.selectedText().equals(m.originalText()),"all lost whitespace");complete(m);});
  test("adjacent chosen words preserve original gap",()->{var m=words("中国","\r\n\u00a0","人民","!","别处");m.toggle(0);m.toggle(2);
   check("中国\r\n\u00a0人民".equals(m.selectedText()),"original gap replaced");});
  test("disjoint chosen words never copy unselected content",()->{var m=words("中国"," ","不要","\n","Android");m.toggle(0);m.toggle(4);
   check("中国Android".equals(m.selectedText()),"unselected source copied");});
  test("punctuation remains selectable",()->{var m=words("词语","！","尾词");m.toggle(1);check("！".equals(m.selectedText()),"punctuation lost");
   check(!m.splitSelectedWords(),"punctuation split as word");});
  test("word and whitespace categories use full Unicode",()->{var m=words("𠮷野家","\u00a0\t","123abc","——");
   check(m.tokens().get(0).kind==AtomicWorkbenchTextSelection.Kind.WORD&&m.tokens().get(1).kind==AtomicWorkbenchTextSelection.Kind.WHITESPACE,"wrong categories");
   rejected(()->m.toggle(1));rejected(()->m.beginRange(1));});
  test("select range crosses line breaks and can shrink",()->{var m=words("one"," ","two","\n","three");var g=m.beginRange(0);g.moveTo(4);
   check(m.selectedCount()==3&&m.selectedText().equals(m.originalText()),"expanded range lost content");g.moveTo(2);
   check(m.selectedCount()==2&&"one two".equals(m.selectedText()),"shrunk range left stale selection");g.finish();check(!g.moveTo(4),"finished gesture active");});
  test("range can deselect already selected words",()->{var m=words("one"," ","two"," ","three");m.selectAll();var g=m.beginRange(2);g.moveTo(4);
   check(m.selectedCount()==1&&"one".equals(m.selectedText()),"deselect range failed");g.finish();});
  test("cancel restores exact pregesture selection",()->{var m=words("one"," ","two"," ","three");m.toggle(4);var g=m.beginRange(0);g.moveTo(2);
   check(g.cancel()&&m.selectedCount()==1&&m.selected(4),"cancel changed prior selection");check(!g.cancel(),"double cancel accepted");});
  test("stale gesture cannot overwrite a later selection",()->{var m=words("one"," ","two");var g=m.beginRange(0);g.moveTo(0);m.toggle(2);
   check(!g.moveTo(2)&&!g.cancel()&&m.selectedCount()==2,"stale gesture overwrote state");});
  test("invert and clear are real selected-state changes",()->{var m=words("a"," ","b","!");m.toggle(0);m.invert();
   check(m.selectedCount()==2&&"b!".equals(m.selectedText()),"invert wrong");m.clear();check(!m.hasSelection()&&m.selectedText().isEmpty(),"clear wrong");
   long revision=m.revision();m.clear();check(m.revision()==revision,"empty no-op changed revision");});
  test("split only selected words and preserve unrelated words",()->{var m=words("中国人民"," ","Android");m.toggle(0);long r=m.revision();
   check(m.splitSelectedWords()&&m.tokens().size()==6&&m.selectedCount()==4&&m.revision()==r+1,"selected split missing");
   check(m.tokens().get(5).text.equals("Android")&&!m.selected(5)&&m.selectedText().equals("中国人民"),"unselected word changed");complete(m);});
  test("split handles supplementary ideographs without surrogate fragments",()->{var m=words("𠮷野家"," ","tail");m.toggle(0);m.splitSelectedWords();
   check(m.tokens().get(0).text.equals("𠮷")&&m.tokens().get(0).end==2&&m.selectedCount()==3,"supplementary split invalid");complete(m);});
  test("combining characters stay one visible selectable glyph",()->{var m=words("A","\u0301","!","other");
   check(m.tokens().get(0).text.equals("A\u0301")&&m.tokens().size()==3,"combining glyph split");m.toggle(0);check(!m.splitSelectedWords(),"combined glyph split");});
  test("ZWJ emoji flags and skin tones are never selected in fragments",()->{for(String text:new String[]{"👨‍👩‍👧‍👦","🇨🇳","👍🏽"}){
   var m=new AtomicWorkbenchTextSelection(text,codePoints(text));check(m.tokens().size()==1,"emoji grapheme was fragmented");m.selectAll();
   check(m.selectedText().equals(text)&&!m.splitSelectedWords(),"emoji changed");complete(m);}});
  test("snapshot retains split boundaries and chosen subset",()->{var m=words("中国人民"," ","Android");m.toggle(0);m.splitSelectedWords();m.toggle(1);
   var restored=AtomicWorkbenchTextSelection.restore(m.snapshot());check(restored.selectedText().equals(m.selectedText())&&restored.selectedCount()==3,"selection not restored");
   check(restored.tokens().size()==m.tokens().size()&&restored.revision()==m.revision(),"split or revision lost");complete(restored);});
  test("saved arrays and token lists cannot mutate live or saved state",()->{var m=words("中国"," ","Android");m.toggle(0);var saved=m.snapshot();
   int[] spans=saved.spans(),selected=saved.selectedRanges();spans[0]=999;selected[0]=999;
   check(AtomicWorkbenchTextSelection.restore(saved).selectedText().equals("中国"),"snapshot leaked arrays");
   try{m.tokens().clear();throw new AssertionError("mutable token list");}catch(UnsupportedOperationException expected){assertions++;}});
  test("saved partial overlapping duplicate or whitespace selection rejected",()->{int[] spans={0,2,2,3,3,5};
   rejected(()->AtomicWorkbenchTextSelection.restore("中国 人民",spans,new int[]{1,2},0));
   rejected(()->AtomicWorkbenchTextSelection.restore("中国 人民",spans,new int[]{0,2,0,2},0));
   rejected(()->AtomicWorkbenchTextSelection.restore("中国 人民",spans,new int[]{2,3},0));
   rejected(()->AtomicWorkbenchTextSelection.restore("中国 人民",spans,new int[]{0},0));
   rejected(()->AtomicWorkbenchTextSelection.restore("中国 人民",spans,new int[]{0,2},-1));});
  test("incomplete overlapping out-of-range native spans rejected without fallback",()->{
   for(int[] spans:new int[][]{{0,1},{0,2,1,3},{1,3},{0,4},{0,0,0,3},{0,1,2,3},{0}})
    rejected(()->new AtomicWorkbenchTextSelection("abc",spans));});
  test("invalid UTF16 and half-surrogate spans rejected",()->{rejected(()->words("\ud800"));rejected(()->words("\udc00"));
   rejected(()->new AtomicWorkbenchTextSelection("𠮷",new int[]{0,1,1,2}));rejected(()->new AtomicWorkbenchTextSelection(null,new int[0]));});
  test("empty or whitespace-only input has no fake word action",()->{for(var m:new AtomicWorkbenchTextSelection[]{words(),words("\r\n\t\u00a0")}){
   m.selectAll();check(!m.hasSelection()&&m.selectedText().isEmpty()&&!m.splitSelectedWords(),"fake blank word");complete(m);}});
  test("text length bound and large split roundtrip",()->{String input="x".repeat(AtomicWorkbenchTextSelection.MAX_TEXT);var m=words(input);m.selectAll();
   check(m.splitSelectedWords()&&m.selectedCount()==input.length(),"large word split failed");
   check(AtomicWorkbenchTextSelection.restore(m.snapshot()).selectedText().equals(input),"large snapshot corrupted");rejected(()->words(input+"x"));});
  test("random original-text coverage and state roundtrip",()->{Random random=new Random(711);String[] parts={"中国","𠮷野家"," \n","abc","12.3","！","A\u0301","👨‍👩‍👧‍👦"};
   for(int run=0;run<150;run++){StringBuilder input=new StringBuilder();for(int i=0;i<1+random.nextInt(15);i++)input.append(parts[random.nextInt(parts.length)]);
    var m=new AtomicWorkbenchTextSelection(input.toString(),codePoints(input.toString()));for(int i=0;i<m.tokens().size();i++)if(m.tokens().get(i).selectable()&&random.nextBoolean())m.toggle(i);
    m.splitSelectedWords();complete(m);var r=AtomicWorkbenchTextSelection.restore(m.snapshot());complete(r);
    check(r.selectedText().equals(m.selectedText())&&r.selectedCount()==m.selectedCount(),"random state drift");m.selectAll();
    check(m.hasSelection()?m.selectedText().equals(input.toString()):m.selectedText().isEmpty(),"all changed original");}});
  System.out.println("TEXT SELECTION RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''


def run(source, negative=None, expected=None):
    with tempfile.TemporaryDirectory(prefix="duo-text-selection-") as temporary:
        work = Path(temporary)
        sources = {"AtomicWorkbenchTextSelection.java": source, "TestWorkbenchTextSelection.java": TEST}
        paths = []
        for name, content in sources.items():
            path = work / "ls/augment/com" / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            paths.append(str(path))
        compiled = subprocess.run([SUPPORT["JAVAC"], "-J-Duser.language=en", "--release", "17", "-encoding", "UTF-8", "-d", str(work), *paths],
                                  env=SUPPORT["ENV"], timeout=60, capture_output=True, text=True, errors="replace")
        if compiled.returncode:
            raise AssertionError(compiled.stderr)
        result = subprocess.run([SUPPORT["JAVA"], "-Dfile.encoding=UTF-8", "-cp", str(work), "ls.augment.com.TestWorkbenchTextSelection"],
                                env=SUPPORT["ENV"], timeout=30, capture_output=True, text=True, encoding="utf-8")
        if negative:
            if result.returncode == 0 or "AssertionError: " + expected not in result.stderr:
                raise AssertionError("negative control was not rejected for its intended behavior: " + negative + "\n" + result.stderr)
            print("PASS rejected negative control: " + negative)
        else:
            print(result.stdout, end="")
            if result.returncode:
                raise AssertionError(result.stderr)


def main():
    source = (SUPPORT["SRC"] / "AtomicWorkbenchTextSelection.java").read_text(encoding="utf-8")
    run(source)
    for old, replacement, label, expected in (
        ("result.append(text, previous.end, token.start)", "result.append(' ')", "normalize selected whitespace", "original gap replaced"),
        ("closed || revision != expectedRevision", "closed", "stale gesture overwrites newer selection", "stale gesture overwrote state"),
        ("|| end < text.length() && Character.isLowSurrogate(text.charAt(end))", "", "accept native half-surrogate offset", "invalid state accepted"),
    ):
        if old not in source:
            raise AssertionError("negative boundary changed: " + label)
        run(source.replace(old, replacement), label, expected)


if __name__ == "__main__":
    main()
