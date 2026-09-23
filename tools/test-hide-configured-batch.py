"""Execute the production batch dispatcher with deterministic command boundaries."""
from pathlib import Path
import importlib.util
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("extract", ROOT / "tools/test-hide-automation-scope.py")
extract = importlib.util.module_from_spec(spec)
spec.loader.exec_module(extract)
source = (ROOT / "android/app/src/main/java/ls/augment/com/RootHideManager.java").read_text(encoding="utf-8")
method = extract.member(source, "private HideBatchExecutor.Outcome<Target> executeBatch(Set<Target> targets, boolean hide) {")
method += "\n" + extract.member(source, "private HideBatchExecutor.Outcome<Target> executeBatch(Set<Target> targets, boolean hide,")
method += "\n" + extract.member(source, "private static void reportProgress(")
java = r'''
import java.util.*;
class HideBatchExecutor {
 static class Outcome<T> { final Set<T> success=new LinkedHashSet<>(); final Map<T,String> failures=new LinkedHashMap<>(); }
}
class AuditLog { static void write(Object context,String event,String value){} }
class HideTargetController {
 static final List<String> calls=new ArrayList<>(); static int badShow=-1,badHide=-1;
 static HideTargetController forCheckedBatch(Object context,RootHideManager manager,RootHideManager.RootStatus root){return new HideTargetController();}
 RootHideManager.OperationResult showInConfirmedBatch(RootHideManager.Target t){calls.add("show:"+t.id);return new RootHideManager.OperationResult(t.id!=badShow,"show result");}
 RootHideManager.OperationResult hide(RootHideManager.Target t){calls.add("hide:"+t.id);return new RootHideManager.OperationResult(t.id!=badHide,"hide result");}
 static void reset(){calls.clear();badShow=badHide=-1;}
}
class RootHideManager {
 Object context=new Object();
 enum RootState{GRANTED,DENIED}
 static class RootStatus{RootState state=RootState.GRANTED;String message="";}
 RootStatus rootStatus(){return new RootStatus();}
 static class Target {final int id; Target(int id){this.id=id;}}
 static class OperationResult {final boolean success; final String message;OperationResult(boolean s,String m){success=s;message=m;}static OperationResult failure(String m){return new OperationResult(false,m);}}
 METHOD
 HideBatchExecutor.Outcome<Target> run(boolean hide){return executeBatch(new LinkedHashSet<>(List.of(new Target(0),new Target(10),new Target(999))),hide);}
 HideBatchExecutor.Outcome<Target> empty(){return executeBatch(Set.of(),false);}
}
public class TestConfiguredBatch {
 static int checks;
 static void check(boolean condition){checks++;if(!condition)throw new AssertionError("check "+checks);}
 static void calls(String... expected){check(HideTargetController.calls.equals(List.of(expected)));}
 public static void main(String[] args){
  RootHideManager m=new RootHideManager();
  var result=m.run(false);check(result.success.size()==3&&result.failures.isEmpty());calls("show:0","show:10","show:999");
  HideTargetController.reset();HideTargetController.badShow=10;result=m.run(false);check(result.success.size()==1&&result.failures.size()==2);calls("show:0","show:10");
  HideTargetController.reset();HideTargetController.badShow=0;result=m.run(false);check(result.success.isEmpty()&&result.failures.size()==3);calls("show:0");
  HideTargetController.reset();result=m.run(true);check(result.success.size()==3);calls("hide:0","hide:10","hide:999");
  HideTargetController.reset();HideTargetController.badHide=10;result=m.run(true);check(result.success.size()==1&&result.failures.size()==2);calls("hide:0","hide:10");
  HideTargetController.reset();result=m.empty();check(result.success.isEmpty()&&result.failures.isEmpty());calls();
  System.out.println("PASS "+checks+" configured batch assertions: multi-space show/hide, invalid target, partial failure, stop without retry, empty selection.");
 }
}
'''.replace("METHOD", method)
with tempfile.TemporaryDirectory(prefix="lsa-configured-batch-") as directory:
    folder = Path(directory)
    target = folder / "TestConfiguredBatch.java"
    target.write_text(java, encoding="utf-8")
    subprocess.run(["javac", "-encoding", "UTF-8", "--release", "17", "-d", directory, str(target)], check=True)
    subprocess.run(["java", "-cp", directory, "TestConfiguredBatch"], check=True)
