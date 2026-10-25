"""Run the real Activity input gate through delayed frame/Surface layouts."""
from pathlib import Path
import runpy
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))
SUPPORT, SRC, member = BASE["SUPPORT"], BASE["SRC"], BASE["member"]

VIEWS = r'''package android.view;
public class View {
 public int left,top,width=1,height=1;public boolean requested;
 public android.widget.FrameLayout.LayoutParams params=new android.widget.FrameLayout.LayoutParams();
 public int getLeft(){return left;}public int getTop(){return top;}
 public int getWidth(){return width;}public int getHeight(){return height;}
 public Object getLayoutParams(){return params;}public boolean isLayoutRequested(){return requested;}
}'''
FRAME = r'''package android.widget;
public class FrameLayout extends android.view.View {
 public static class LayoutParams {public int leftMargin,topMargin,width=1,height=1,gravity=android.view.Gravity.TOP|android.view.Gravity.LEFT;public boolean isMarginRelative(){return false;}}
}'''
HEAD = r'''package ls.augment.com;
import android.view.View;import android.view.Gravity;import android.widget.FrameLayout;
final class ResetWriteFence {static boolean stale(long generation){return false;}}
final class AtomicWorkbenchClient {int clears;void clearGestureTarget(){clears++;}}
public class TestLayoutInput {
 static class Model {int main;boolean desktop;int mainWindowId(){return main;}boolean desktopVisible(){return desktop;}}
 static class Surface extends View {boolean valid=true;Surface getHolder(){return this;}boolean isValid(){return valid;}}
 static class Slot {final View frame=new View();final Surface surface=new Surface();int displayWidth=1080,displayHeight=2400;boolean ready=true,outputAwaitingFrame;}
 static class Button {boolean enabled;void setEnabled(boolean value){enabled=value;}}
 static class Search {boolean focused;boolean hasFocus(){return focused;}}
 final Model model=new Model();final Slot[] slots={new Slot(),new Slot()};final View workspace=new View();final Button appBack=new Button();
 AtomicWorkbenchClient client=new AtomicWorkbenchClient();int cancelled,published,cleared;
 Search search=new Search();int hidden;void hideHostKeyboard(){hidden++;}
 int mainLayoutWindow=-1,mainLayoutLeft,mainLayoutTop,mainLayoutWidth,mainLayoutHeight,mainLayoutDisplayWidth,mainLayoutDisplayHeight,focusedWindow;
 boolean mainLayoutPresented,active=true,destroyed,surfaceUnavailable,busy,closing,recoveryPending;long launchGeneration;
 boolean hostDialogActive,outputsSyncing,outputsParked;int hostInputPending;
 void finishOutputPresentation(){}
 void cancelGesture(){cancelled++;}
 void invalidateExtractionGeometry(){}
 void publishGestureTarget(){if(mainReady())published++;else cleared++;}
 void frame(int id,int width,int height){Slot s=slots[id];s.frame.left=0;s.frame.top=0;s.frame.width=width;s.frame.height=height;
  s.frame.params.leftMargin=0;s.frame.params.topMargin=0;s.frame.params.width=width;s.frame.params.height=height;}
 void output(int id){Slot s=slots[id];float scale=Math.min(s.frame.width/(float)s.displayWidth,s.frame.height/(float)s.displayHeight);
  s.surface.width=Math.max(1,Math.round(s.displayWidth*scale));s.surface.height=Math.max(1,Math.round(s.displayHeight*scale));
  s.surface.left=(s.frame.width-s.surface.width)/2;s.surface.top=(s.frame.height-s.surface.height)/2;
  s.surface.params.width=s.surface.width;s.surface.params.height=s.surface.height;}
 void prepareMainLayout(int id,int width,int height){prepareMainLayout(id,0,0,width,height);}
 void settle(int id,int width,int height){prepareMainLayout(id,width,height);frame(id,width,height);output(id);onWorkspacePreDraw();}
'''
TEST = r'''
 static int cases,checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static void test(String name,Runnable body){body.run();cases++;System.out.println("PASS actual layout input gate: "+name);}
 public static void main(String[] args){
  test("parked reconnecting or frameless output blocks old input eligibility",()->{
   TestLayoutInput f=new TestLayoutInput();f.settle(0,747,1651);check(f.mainReady(),"baseline not ready");
   f.outputsSyncing=true;check(!f.mainReady(),"reconnect admitted old input");f.outputsSyncing=false;
   f.outputsParked=true;check(!f.mainReady(),"parked output admitted input");f.outputsParked=false;
   f.slots[0].outputAwaitingFrame=true;check(!f.mainReady(),"replacement producer admitted input before frame");
   f.slots[0].outputAwaitingFrame=false;check(f.mainReady()&&f.mainLayoutPresented,"restored output lost geometry proof");
  });
  test("host Dialog and queued focus handoff block virtual input without discarding geometry",()->{
   TestLayoutInput f=new TestLayoutInput();f.settle(0,747,1651);check(f.mainReady(),"baseline not ready");
   f.hostDialogActive=true;check(!f.mainReady(),"Dialog admitted virtual editor input");
   f.hostInputPending=1;f.hostDialogActive=false;check(!f.mainReady(),"closed Dialog admitted input before focus handoff ended");
   f.hostInputPending=0;check(f.mainReady()&&f.mainLayoutPresented,"completed handoff lost stable layout proof");
  });
  test("promotion cannot admit the old side frame or the late fitted output",()->{
   TestLayoutInput f=new TestLayoutInput();f.settle(0,747,1651);check(f.mainReady(),"initial main never ready");
   f.frame(1,245,541);f.output(1);f.model.main=1;f.focusedWindow=1;
   check(!f.mainReady(),"new role inherited the previous main input proof");
   f.prepareMainLayout(1,747,1651);check(!f.mainReady()&&f.client.clears>=2,"promotion kept old route");
   f.onWorkspacePreDraw();check(!f.mainReady(),"side-size pre-draw admitted input");
   f.frame(1,747,1651);f.onWorkspacePreDraw();check(!f.mainReady(),"frame update admitted stale side output");
   f.output(1);check(!f.mainReady(),"layout admitted input before its draw boundary");
   f.onWorkspacePreDraw();check(f.mainReady()&&f.published==2,"settled main did not publish its route");
  });
  test("pending nested layout cannot publish a partially fitted frame",()->{
   TestLayoutInput f=new TestLayoutInput();f.prepareMainLayout(0,747,1651);f.frame(0,747,1651);f.output(0);
   for(View pending:new View[]{f.workspace,f.slots[0].frame,f.slots[0].surface}){
    pending.requested=true;f.onWorkspacePreDraw();check(!f.mainReady(),"pending layout admitted input");pending.requested=false;
   }
   f.onWorkspacePreDraw();check(f.mainReady(),"completed layout stayed blocked");
  });
  test("stable text layout and ordinary pre-draw preserve an admitted gesture",()->{
   TestLayoutInput f=new TestLayoutInput();f.settle(0,747,1651);int cancelled=f.cancelled,published=f.published,clears=f.client.clears;
   f.workspace.requested=true;f.slots[0].frame.requested=true;f.prepareMainLayout(0,747,1651);f.onWorkspacePreDraw();
   check(f.mainReady(),"unchanged label layout revoked stable geometry");
   check(f.cancelled==cancelled&&f.published==published&&f.client.clears==clears,"stable render cancelled or republished input");
  });
  test("size and producer changes revoke proof until a new draw",()->{
   TestLayoutInput f=new TestLayoutInput();f.settle(0,747,1651);f.prepareMainLayout(0,747,1200);
   check(!f.mainReady(),"viewport resize retained input proof");f.frame(0,747,1200);f.output(0);f.onWorkspacePreDraw();check(f.mainReady(),"resize never ready");
   f.slots[0].displayWidth=2400;f.slots[0].displayHeight=1080;check(!f.mainReady(),"producer geometry changed under active mapping");
   f.prepareMainLayout(0,747,1200);f.output(0);check(!f.mainReady(),"producer change bypassed draw boundary");f.onWorkspacePreDraw();check(f.mainReady(),"new producer mapping never ready");
   f.invalidateMainLayout(0);check(!f.mainReady(),"recreated Surface reused old proof");f.onWorkspacePreDraw();check(f.mainReady(),"recreated Surface never ready");
  });
  test("actual bounds and pending LayoutParams must agree with the centered main output",()->{
   TestLayoutInput f=new TestLayoutInput();f.settle(0,747,1651);
   f.slots[0].surface.left++;check(!f.mainReady(),"off-center Surface accepted stale touch transform");f.slots[0].surface.left--;
   f.slots[0].surface.params.width--;check(!f.mainReady(),"pending output resize accepted input");f.slots[0].surface.params.width++;
   f.slots[0].frame.params.leftMargin=751;check(!f.mainReady(),"pending side position accepted input");f.slots[0].frame.params.leftMargin=0;
   f.slots[0].frame.top=1;check(!f.mainReady(),"actual side position accepted input");f.slots[0].frame.top=0;
   check(f.mainReady(),"restored exact geometry stayed blocked");
  });
  test("geometry proof cannot bypass session focus or Surface validity",()->{
   TestLayoutInput f=new TestLayoutInput();f.settle(0,747,1651);f.slots[0].surface.valid=false;check(!f.mainReady(),"invalid output admitted input");
   f.slots[0].surface.valid=true;f.focusedWindow=1;check(!f.mainReady(),"wrong focus admitted input");f.focusedWindow=0;
   f.busy=true;check(!f.mainReady(),"busy mutation admitted input");f.busy=false;f.model.desktop=true;check(!f.mainReady(),"desktop cover admitted app input");
  });
  test("app focus never replaces a virtual editor with the host desktop connection",()->{
   TestLayoutInput f=new TestLayoutInput();f.releaseHostSearchInput();check(f.hidden==0,"virtual IME was hidden without a host search");
   f.search.focused=true;f.releaseHostSearchInput();check(f.hidden==1,"host search did not relinquish input");
   f.search=null;f.releaseHostSearchInput();check(f.hidden==1,"absent search replaced the virtual editor");
  });
  System.out.println("LAYOUT INPUT RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    activity = (SRC / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
    body = "\n".join(member(activity, signature) for signature in (
        "private void prepareMainLayout", "private void invalidateMainLayout",
        "private boolean mainLayoutMatches", "private boolean onWorkspacePreDraw", "private boolean mainReady()", "private void releaseHostSearchInput()"))
    sources = {"android/view/Gravity.java":"package android.view;public final class Gravity{public static final int TOP=48,LEFT=3;}","android/view/View.java": VIEWS, "android/widget/FrameLayout.java": FRAME,
               "ls/augment/com/TestLayoutInput.java": HEAD + body + TEST}
    with tempfile.TemporaryDirectory(prefix="lsa-layout-input-") as directory:
        SUPPORT["compile_run"](Path(directory), sources, [], "ls.augment.com.TestLayoutInput")


if __name__ == "__main__":
    main()
