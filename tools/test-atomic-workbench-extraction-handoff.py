"""Run the real one-use UI handoff, including concurrent consumption and reset/expiry."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-system-root-authority.py')))
JAVA = BASE['JAVA']
SOURCE = JAVA['SRC'] / 'AtomicWorkbenchExtractionHandoff.java'
TEST = r'''package ls.augment.com;import java.util.concurrent.atomic.*;import java.util.*;
public final class TestExtractionHandoff {
 static int cases,checks;static AtomicLong clock,reset;static AtomicBoolean blocked;static AtomicWorkbenchExtractionHandoff handoff;
 interface Case{void run()throws Exception;}static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static void test(String name,Case run)throws Exception{clock=new AtomicLong(1000);reset=new AtomicLong(7);blocked=new AtomicBoolean();
  handoff=new AtomicWorkbenchExtractionHandoff(clock::get,reset::get,blocked::get);run.run();cases++;System.out.println("PASS extraction handoff: "+name);}
 static AtomicWorkbenchExtractionHandoff.Value value(String text){return new AtomicWorkbenchExtractionHandoff.Value("a".repeat(32),text,"example.editor","b".repeat(64),7);}
 public static void main(String[] args)throws Exception{
  test("exact whitespace Unicode and one-use nonce",()->{var v=value("  中文\n\t😀  ");String key=handoff.offer(v);check(key.matches("[0-9a-f]{32}"),"invalid nonce");
   check(handoff.consume(key)==v&&v.text.equals("  中文\n\t😀  "),"text changed");check(handoff.consume(key)==null,"handoff replayed");});
  test("unknown nonce cannot consume a legitimate result",()->{var v=value("text");String key=handoff.offer(v);check(handoff.consume("f".repeat(32))==null,"foreign nonce accepted");check(handoff.consume(key)==v,"foreign nonce destroyed real result");});
  test("latest capture replaces previous bounded entry",()->{String old=handoff.offer(value("first"));var v=value("second");String key=handoff.offer(v);check(!old.equals(key)&&handoff.consume(old)==null,"old capture remained");check(handoff.consume(key)==v,"latest capture lost");});
  test("old expiry callback cannot clear a new capture",()->{String old=handoff.offer(value("first"));var v=value("new");String key=handoff.offer(v);handoff.expire(old);check(handoff.consume(key)==v,"old expiry cleared new entry");});
  test("own expiry clears the exact pending capture",()->{String key=handoff.offer(value("text"));handoff.expire(key);check(handoff.consume(key)==null,"expiry retained body");});
  test("deadline cannot be extended by a wrong nonce",()->{String key=handoff.offer(value("text"));clock.set(5999);check(handoff.consume("wrong")==null,"wrong nonce accepted");clock.set(6001);check(handoff.consume(key)==null,"expired capture accepted");});
  test("monotonic clock rollback rejects the capture",()->{String key=handoff.offer(value("text"));clock.set(999);check(handoff.consume(key)==null,"clock rollback accepted");});
  test("reset active blocks offering and consuming",()->{String key=handoff.offer(value("text"));blocked.set(true);check(handoff.offer(value("new"))==null&&handoff.consume(key)==null,"active reset accepted");});
  test("changed reset generation rejects an already accepted body",()->{String key=handoff.offer(value("text"));reset.incrementAndGet();check(handoff.consume(key)==null&&handoff.offer(value("new"))==null,"old reset rebranded");});
  test("explicit reset cleanup releases pending text",()->{String key=handoff.offer(value("text"));handoff.clear();check(handoff.consume(key)==null,"reset clear retained text");});
  test("maximum legal text remains exact",()->{String text="中".repeat(32768);var v=value(text);check(handoff.consume(handoff.offer(v)).text.equals(text),"maximum text truncated");});
  test("invalid text and malformed identities cannot enter UI handoff",()->{for(String text:new String[]{""," \n\t","a".repeat(32769),"\ud800","\udc00","x\ud800z"}){
   try{value(text);throw new AssertionError("invalid body accepted");}catch(IllegalArgumentException expected){checks++;}}
   try{new AtomicWorkbenchExtractionHandoff.Value("invalid","text","example.editor","b".repeat(64),7);throw new AssertionError("invalid identity accepted");}catch(IllegalArgumentException expected){checks++;}});
  test("negative clock cannot mint UI nonce",()->{clock.set(-1);check(handoff.offer(value("text"))==null,"negative clock accepted");});
  test("actual two-consumer races have one unique winner",()->{for(int i=0;i<100;i++){String key=handoff.offer(value("race"));AtomicInteger winners=new AtomicInteger();
   Thread first=new Thread(()->{if(handoff.consume(key)!=null)winners.incrementAndGet();});Thread second=new Thread(()->{if(handoff.consume(key)!=null)winners.incrementAndGet();});
   first.start();second.start();first.join();second.join();check(winners.get()==1,"non-unique handoff consumer");}});
  System.out.println("EXTRACTION HANDOFF RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def run(source, label):
    with tempfile.TemporaryDirectory(prefix='duo-extraction-handoff-') as temporary:
        work = Path(temporary)
        production = work / 'AtomicWorkbenchExtractionHandoff.java'
        production.write_text(source, encoding='utf-8')
        test = work / 'TestExtractionHandoff.java'
        test.write_text(TEST, encoding='utf-8')
        compiled = subprocess.run([JAVA['JAVAC'], '-encoding', 'UTF-8', '--release', '17', '-d', str(work), str(production), str(test)], env=JAVA['ENV'], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=60)
        if compiled.returncode:
            raise AssertionError(f'{label} did not compile\n{compiled.stderr}')
        return subprocess.run([JAVA['JAVA'], '-Dfile.encoding=UTF-8', '-cp', str(work), 'ls.augment.com.TestExtractionHandoff'], env=JAVA['ENV'], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=30)


if __name__ == '__main__':
    source = SOURCE.read_text(encoding='utf-8')
    positive = run(source, 'production'); print(positive.stdout, end='')
    if positive.returncode:
        raise SystemExit(positive.stderr)
    mutations = [
        ('single consumption', source.replace('Value accepted = value; clear(); return accepted;', 'return value;', 1)),
        ('expiry deadline', source.replace('now - offered <= MAX_AGE_MS', 'true', 1)),
        ('reset generation', source.replace('value.reset == reset.getAsLong()', 'true', 1)),
        ('old expiry identity', source.replace('candidate != null && candidate.equals(nonce)', 'candidate != null', 1)),
        ('UTF16 validation', source.replace('!validText(text)', 'false', 1)),
    ]
    for label, changed in mutations:
        if changed == source:
            raise AssertionError('mutation did not apply: ' + label)
        negative = run(changed, label)
        if negative.returncode == 0 or 'AssertionError' not in negative.stderr:
            raise AssertionError(f'negative control not killed: {label}\n{negative.stdout}\n{negative.stderr}')
        print('PASS negative control: ' + label)
    print('EXTRACTION HANDOFF NEGATIVE RESULT 5 killed')
