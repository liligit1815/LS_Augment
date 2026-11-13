"""Execute the production navigation dispatcher, including native close ordering and stale actions."""
from pathlib import Path
import os,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/hook/IslandLiveScenes.java').read_text(encoding='utf-8')
start=source.index('    private void dispatch(');end=source.index('{',start)+1;depth=1
while depth:
 depth+=(source[end]=='{')-(source[end]=='}');end+=1
method=source[start:end]
code='''import java.util.*;
public class TestNavigationAction {
 static int checks;static List<String> order=new ArrayList<>();
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class IslandEvent {String key="nav",scene="navigation";static class Action{Runnable run;Action(Runnable r){run=r;}}}
 static class DuoNotificationCards {void dismiss(){order.add("native-close");}}
 static class IslandSceneSelection {static boolean enabled=true;static boolean enabled(Object c,String s){return enabled;}}
 static class FeatureRuntimeLog {static void event(String s,String d){order.add("error");}}
 Object context=new Object();int user,current;boolean allowed=true;
 Map<String,IslandEvent> events=new HashMap<>();Map<String,DuoNotificationCards> cards=new HashMap<>();
 boolean allowed(){return allowed;}int currentUser(){return current;}
 METHOD
 public static void main(String[] args){
  var owner=new TestNavigationAction();var event=new IslandEvent();owner.events.put(event.key,event);owner.cards.put(event.key,new DuoNotificationCards());
  var action=new IslandEvent.Action(()->order.add("launch"));owner.dispatch(event,action);
  check(order.equals(List.of("native-close","launch")),"native close occurs before opening navigation source");
  order.clear();owner.dispatch(new IslandEvent(),action);check(order.isEmpty(),"stale instance cannot close a current card or launch");
  owner.allowed=false;owner.dispatch(event,action);check(order.isEmpty(),"privacy gate rejects action");owner.allowed=true;
  owner.current=10;owner.dispatch(event,action);check(order.isEmpty(),"another user cannot invoke action");owner.current=0;
  IslandSceneSelection.enabled=false;owner.dispatch(event,action);check(order.isEmpty(),"disabled scene rejects action");IslandSceneSelection.enabled=true;
  event.scene="torch";owner.dispatch(event,action);check(order.equals(List.of("launch")),"other live-scene actions retain their panel behavior");
  event.scene="navigation";order.clear();owner.cards.clear();owner.dispatch(event,action);check(order.equals(List.of("launch")),"missing card does not drop valid source action");
  order.clear();owner.cards.put(event.key,new DuoNotificationCards());owner.dispatch(event,new IslandEvent.Action(()->{throw new IllegalStateException();}));
  check(order.equals(List.of("native-close","error")),"source failure stays contained after native closure");
  System.out.println("Navigation native action: "+checks+" checks passed");
 }
}'''.replace('METHOD',method)
with tempfile.TemporaryDirectory(prefix='duo-navigation-action-') as tmp:
 path=Path(tmp)/'TestNavigationAction.java';path.write_text(code,encoding='utf-8');java=Path(os.environ['JAVA_HOME'])/'bin'
 subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',tmp,str(path)],check=True)
 subprocess.run([str(java/'java.exe'),'-cp',tmp,'TestNavigationAction'],check=True)
