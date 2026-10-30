"""Run exact production Transfer drag/snapshot members against controlled View callbacks.

The complete production class is separately SDK36-compiled; this isolates real session
members so tests can drive drag start/end and delayed drops without a phone WindowManager.
"""
from pathlib import Path
import importlib.util
import subprocess
import tempfile
import sys
SPEC = importlib.util.spec_from_file_location("storage", Path(__file__).with_name("test-atomic-workbench-transfer-storage.py"))
S = importlib.util.module_from_spec(SPEC); SPEC.loader.exec_module(S)
if hasattr(sys.stdout, "reconfigure"): sys.stdout.reconfigure(encoding="utf-8")

def member(source, signature):
    start = source.index(signature); end = source.index("{", start) + 1; depth = 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}"); end += 1
    return source[start:end]

SIGNATURES = ["static final class DeliverySnapshot", "private static final class DragSession", "DeliverySnapshot deliverySnapshot()", "DeliverySnapshot snapshotForDrop(", "boolean consumeDrop(", "private DragSession session(", "private static boolean ownDescription(", "private static boolean sortEvent(", "private void endDrag(", "private boolean beginDrag(View source, AtomicWorkbenchPendingPayload snapshot, Runnable ended)", "private boolean beginDrag(View source, AtomicWorkbenchPendingPayload snapshot, Runnable ended, boolean accessibility)", "boolean startTextDrag(", "private static void ended(", "private static AtomicWorkbenchPendingPayload textSnapshot(", "private static ClipData clip(", "private static ClipData dragClip(", "private static ClipData contentClip("]
SIGNATURES += ["private static boolean extractedTextDragCurrent(", "private void revokeExtractedTextDrag()", "private boolean beginDrag(View source, AtomicWorkbenchPendingPayload snapshot, Runnable ended, boolean accessibility, boolean extractedText)"]
SIGNATURES += ["boolean requestExtractedTextPasteSetup("]
SIGNATURES += ["boolean consumeDrop(DragEvent event, DeliverySnapshot snapshot, java.util.function.Consumer<Boolean> delivery)"]
STUBS = {
    "android/app/Activity.java": 'package android.app;public class Activity {public boolean destroyed,finishing;public boolean isDestroyed(){return destroyed;}public boolean isFinishing(){return finishing;}}',
    "ls/augment/com/AtomicWorkbenchActivity.java": 'package ls.augment.com;class AtomicWorkbenchActivity extends android.app.Activity {}',
    "ls/augment/com/AtomicWorkbenchExtractionActivity.java": 'package ls.augment.com;class AtomicWorkbenchExtractionActivity extends android.app.Activity {boolean started=true,captureCurrent=true,restored,textDragWindowHidden;int prompts;boolean acceptedValueCurrent(){return captureCurrent;}void showTextPasteSetup(){if(!restored)throw new AssertionError("prompt before source restore");if(currentTextDragSource())prompts++;}CURRENT_TEXT_DRAG_SOURCE CURRENT_TEXT_DELIVERY_SOURCE}',
    "android/content/ClipDescription.java": r'''package android.content;public class ClipDescription {final String[]mimes;android.os.PersistableBundle extras;public ClipDescription(String l,String[]m){mimes=m;}public boolean hasMimeType(String m){for(String v:mimes)if(v.equals(m))return true;return false;}public void setExtras(android.os.PersistableBundle e){extras=new android.os.PersistableBundle(e);}public android.os.PersistableBundle getExtras(){return extras;}}''',
    "android/os/PersistableBundle.java": r'''package android.os;import java.util.*;public class PersistableBundle {final Map<String,Object>data=new HashMap<>();public PersistableBundle(){}public PersistableBundle(PersistableBundle b){data.putAll(b.data);}public void putString(String k,String v){data.put(k,v);}public String getString(String k){return (String)data.get(k);}public void putLong(String k,long v){data.put(k,v);}public long getLong(String k,long d){return data.containsKey(k)?(Long)data.get(k):d;}}''',
    "android/os/Handler.java": r'''package android.os;import java.util.*;public class Handler {final List<Runnable>tasks=new ArrayList<>();public boolean post(Runnable r){tasks.add(r);return true;}public boolean postDelayed(Runnable r,long t){tasks.add(r);return true;}public void removeCallbacks(Runnable r){tasks.remove(r);}public void fire(){var copy=List.copyOf(tasks);tasks.clear();for(Runnable r:copy)r.run();}}''',
    "android/view/DragEvent.java": r'''package android.view;import android.content.*;public class DragEvent {
 public static final int ACTION_DRAG_STARTED=1,ACTION_DROP=3,ACTION_DRAG_ENDED=4;final int action;final Object state;final ClipDescription description;
 public DragEvent(int a,Object s,ClipDescription d){action=a;state=s;description=d;}public int getAction(){return action;}public Object getLocalState(){return state;}public ClipDescription getClipDescription(){return description;}}''',
    "android/view/View.java": r'''package android.view;import android.content.*;public class View {
 public static final int DRAG_FLAG_GLOBAL=256,DRAG_FLAG_GLOBAL_URI_READ=1,DRAG_FLAG_ACCESSIBILITY_ACTION=1024;public interface OnDragListener{boolean onDrag(View v,DragEvent e);}
 public OnDragListener listener;public Object state;public ClipData clip;public int flags;public boolean success=true;public RuntimeException fail;public Runnable duringStart;
 public static class DragShadowBuilder{public DragShadowBuilder(View v){}}
 public void setOnDragListener(OnDragListener l){listener=l;}public boolean startDragAndDrop(ClipData c,DragShadowBuilder s,Object local,int f){state=local;clip=c;flags=f;if(duringStart!=null)duringStart.run();if(fail!=null)throw fail;return success;}
 public void end(){if(listener!=null)listener.onDrag(this,new DragEvent(DragEvent.ACTION_DRAG_ENDED,state,new ClipDescription("",new String[]{"text/plain"})));}public void cancelDragAndDrop(){end();}}''',
    "ls/augment/com/AtomicWorkbenchPendingControls.java": 'package ls.augment.com;class AtomicWorkbenchPendingControls {static final String SORT_MIME="application/vnd.lsaugment.pending-order";}',
}
STUBS.update({
    "ls/augment/com/UiKit.java": 'package ls.augment.com;class UiKit {int cardHigh,text;int dp(int n){return n;}}',
    "android/graphics/Point.java": 'package android.graphics;public class Point {public void set(int x,int y){}}',
    "android/util/DisplayMetrics.java": 'package android.util;public class DisplayMetrics {}',
    "android/util/TypedValue.java": 'package android.util;public class TypedValue {public static final int COMPLEX_UNIT_SP=2;public static float applyDimension(int unit,float value,DisplayMetrics metrics){return value;}}',
    "android/content/res/Resources.java": 'package android.content.res;public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
    "android/graphics/Canvas.java": 'package android.graphics;public class Canvas {public void drawRoundRect(float a,float b,float c,float d,float e,float f,Paint p){}public void drawText(String t,float x,float y,Paint p){}}',
    "android/graphics/Paint.java": 'package android.graphics;public class Paint {public static final int ANTI_ALIAS_FLAG=1;public enum Align{CENTER}public Paint(int flags){}public void setColor(int c){}public void setTextSize(float s){}public void setTextAlign(Align a){}public float ascent(){return 0;}public float descent(){return 0;}}',
})
STUBS["android/content/ClipDescription.java"] = STUBS["android/content/ClipDescription.java"].replace("public boolean hasMimeType", "public int getMimeTypeCount(){return mimes.length;}public String getMimeType(int i){return mimes[i];}public boolean hasMimeType")
STUBS["android/os/PersistableBundle.java"] = STUBS["android/os/PersistableBundle.java"].replace("public void putString", "public void putAll(PersistableBundle b){data.putAll(b.data);}public void putString")
STUBS["android/view/View.java"] = STUBS["android/view/View.java"].replace("public DragShadowBuilder(View v){}", "public DragShadowBuilder(View v){}public void onProvideShadowMetrics(android.graphics.Point s,android.graphics.Point t){}public void onDrawShadow(android.graphics.Canvas c){}")
STUBS["android/view/View.java"] = STUBS["android/view/View.java"].replace("public void end()", "public android.content.res.Resources getResources(){return new android.content.res.Resources();}public void end()")
TEST = r'''package ls.augment.com;import android.content.*;import android.view.*;import java.util.*;import java.util.concurrent.atomic.*;
public class TestTransferSessions {
 static int cases,checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}static void test(String n,Runnable r){r.run();cases++;System.out.println("PASS transfer sessions: "+n);}
 static AtomicWorkbenchPendingPayload payload(String text,int files){var list=new ArrayList<AtomicWorkbenchPendingPayload.FileItem>();for(int i=1;i<=files;i++)list.add(new AtomicWorkbenchPendingPayload.FileItem(String.format("%032x",i),"content://synthetic/"+i,"synthetic","image/png",1,System.currentTimeMillis(),AtomicWorkbenchPendingPayload.Availability.READY));return new AtomicWorkbenchPendingPayload(UUID.randomUUID().toString(),8,text,System.currentTimeMillis(),false,list,AtomicWorkbenchPendingPayload.State.READY);}
 static DragEvent event(int action,Object state,String mime){return new DragEvent(action,state,new ClipDescription("",new String[]{mime}));}
 public static void main(String[] args){
 test("retired file transfer refuses saved file and mixed queues before native drag",()->{
  for(int files:new int[]{1,16}) for(String text:List.of("","companion")){
   var owner=new AtomicWorkbenchTransfer();var view=new View();
   check(!owner.beginForTest(view,payload(text,files)),"retired file drag started");
   check(view.clip==null&&owner.active()==null,"rejected file drag created native payload or session");
  }
 });
 test("temporary text keeps original whitespace and does not mutate current queue",()->{var transfer=new AtomicWorkbenchTransfer();transfer.current=payload("pending",1);var before=transfer.current;View source=new View();AtomicInteger ended=new AtomicInteger();
  check(transfer.startTextDrag(source," \n selected \t",ended::incrementAndGet),"start failed");var frozen=transfer.snapshotForDrop(event(3,source.state,"text/plain"));
  check(transfer.current==before&&frozen.text.equals(" \n selected \t")&&!frozen.hasFiles&&frozen.ready&&frozen.textReady,"text altered/pending replaced");
  check(!frozen.payloadId.equals(before.id),"temporary text shares pending identity");check(source.clip.getItemAt(0).getText().toString().equals(frozen.text),"clip differs from frozen text");source.end();check(ended.get()==1,"end callback");});
 test("late pending replacement cannot alter issued drag and consumption is exact once",()->{var transfer=new AtomicWorkbenchTransfer();View source=new View();transfer.startTextDrag(source,"old",null);var drop=event(3,source.state,"text/plain");var frozen=transfer.snapshotForDrop(drop);transfer.current=payload("new",2);
  check(transfer.snapshotForDrop(drop).text.equals("old"),"drop reread mutable pending");check(transfer.consumeDrop(drop,frozen),"first consume rejected");check(!transfer.consumeDrop(drop,frozen)&&transfer.snapshotForDrop(drop)==null,"duplicate consumed");source.end();check(transfer.snapshotForDrop(drop)==null,"ended session revived");});
 test("same id/revision forged snapshot, other owner, sort and non-drop cannot consume",()->{var transfer=new AtomicWorkbenchTransfer();View source=new View();transfer.startTextDrag(source,"old",null);var drop=event(3,source.state,"text/plain");var frozen=transfer.snapshotForDrop(drop);
  var forged=new AtomicWorkbenchTransfer.DeliverySnapshot(new AtomicWorkbenchPendingPayload(frozen.payloadId,frozen.revision,frozen.text,System.currentTimeMillis(),false,List.of(),AtomicWorkbenchPendingPayload.State.READY));
  check(!transfer.consumeDrop(drop,forged),"forged identity accepted");check(!transfer.consumeDrop(event(1,source.state,"text/plain"),frozen),"non-drop consumed");
  check(transfer.snapshotForDrop(event(3,source.state,AtomicWorkbenchPendingControls.SORT_MIME))==null,"sort content escaped");
  check(new AtomicWorkbenchTransfer().snapshotForDrop(drop)==null,"foreign owner accepted");check(transfer.snapshotForDrop(event(3,new Object(),"text/plain"))==null,"unknown local state accepted");check(transfer.consumeDrop(drop,frozen),"valid session damaged by rejection");source.end();});
 test("end/cancel/close callback is once and rejects late events",()->{var transfer=new AtomicWorkbenchTransfer();View source=new View();AtomicInteger end=new AtomicInteger();transfer.startTextDrag(source,"selected",end::incrementAndGet);var drop=event(3,source.state,"text/plain");
  transfer.closeForTest();source.end();source.end();check(end.get()==1&&transfer.snapshotForDrop(drop)==null,"close/end duplicated or retained");});
 test("failed start and invalid length call end once without truncating or issuing content",()->{
  for(int failure=0;failure<3;failure++){var transfer=new AtomicWorkbenchTransfer();View source=new View();AtomicInteger ended=new AtomicInteger();String text="x";
   if(failure==0)source.success=false;if(failure==1)source.fail=new IllegalStateException();if(failure==2)text="x".repeat(32769);
   check(!transfer.startTextDrag(source,text,ended::incrementAndGet)&&ended.get()==1,"failed start not released");source.end();check(ended.get()==1&&transfer.active()==null,"failed session survived");}
 });
 test("second start cannot prematurely end an existing real drag",()->{var transfer=new AtomicWorkbenchTransfer();AtomicInteger old=new AtomicInteger(),next=new AtomicInteger();View a=new View(),b=new View();check(transfer.startTextDrag(a,"first",old::incrementAndGet),"start first");
  check(!transfer.startTextDrag(b,"second",next::incrementAndGet)&&old.get()==0&&next.get()==1,"second start ended old drag");check(transfer.snapshotForDrop(event(3,a.state,"text/plain")).text.equals("first"),"old session lost");a.end();check(old.get()==1,"old end missing");});
 test("cross Dialog ViewRoot null localState resolves only exact nonce/id/revision",()->{var transfer=new AtomicWorkbenchTransfer();View source=new View();transfer.startTextDrag(source,"selected",null);ClipDescription issued=source.clip.getDescription();var cross=new DragEvent(3,null,issued);
  var snapshot=transfer.snapshotForDrop(cross);check(snapshot!=null&&snapshot.text.equals("selected"),"cross ViewRoot cannot resolve real session");check(issued.hasMimeType("application/vnd.lsaugment.transfer-session"),"marker absent");
  check(issued.getExtras().getString("duo_drag_nonce").matches("[0-9a-f]{32}"),"nonce is not random canonical capability");
  for(String key:List.of("duo_drag_nonce","duo_drag_id","duo_drag_revision")){var bad=new ClipDescription("",new String[]{"application/vnd.lsaugment.transfer-session"});var extra=new android.os.PersistableBundle(issued.getExtras());if(key.equals("duo_drag_revision"))extra.putLong(key,snapshot.revision+1);else extra.putString(key,"forged");bad.setExtras(extra);check(transfer.snapshotForDrop(new DragEvent(3,null,bad))==null,"forged "+key);}
  check(transfer.snapshotForDrop(event(3,null,"application/vnd.lsaugment.transfer-session"))==null,"missing extras accepted");check(new AtomicWorkbenchTransfer().snapshotForDrop(cross)==null,"other owner resolved nonce");check(transfer.consumeDrop(cross,snapshot),"cross consume failed");check(transfer.snapshotForDrop(cross)==null,"cross consumed again");source.end();check(transfer.snapshotForDrop(cross)==null,"ended nonce survived");
  ClipData share=AtomicWorkbenchTransfer.clipForTest(payload("share",1));check(!share.getDescription().hasMimeType("application/vnd.lsaugment.transfer-session")&&share.getDescription().getExtras()==null,"nonce leaked into share Intent clip");});
 test("old nonce and timed out session cannot authorize a new drag",()->{var transfer=new AtomicWorkbenchTransfer();View source=new View();AtomicInteger end=new AtomicInteger();transfer.startTextDrag(source,"first",end::incrementAndGet);var old=new DragEvent(3,null,source.clip.getDescription());source.end();check(transfer.startTextDrag(source,"second",end::incrementAndGet),"second start");check(transfer.snapshotForDrop(old)==null,"old nonce accepted");var current=new DragEvent(3,null,source.clip.getDescription());transfer.main.fire();check(end.get()==2&&transfer.snapshotForDrop(current)==null,"timeout left live capability");source.end();check(end.get()==2,"timeout and true ENDED duplicated callback");});
 test("private extraction text reaches existing workbench and is consumed once across owners",()->{
  var source=new AtomicWorkbenchTransfer(new AtomicWorkbenchExtractionActivity());var target=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());View view=new View();AtomicInteger ended=new AtomicInteger();
  source.current=payload("source pending",1);target.current=payload("target pending",1);var sourceBefore=source.current;var targetBefore=target.current;
  view.duringStart=()->check(target.snapshotForDrop(new DragEvent(1,null,view.clip.getDescription()))!=null,"registration arrived after framework STARTED");
  check(source.startTextDrag(view," \n extracted \t",ended::incrementAndGet),"extraction start failed");var drop=new DragEvent(3,null,view.clip.getDescription());var frozen=target.snapshotForDrop(drop);
  check(frozen!=null&&frozen.text.equals(" \n extracted \t")&&!frozen.hasFiles,"cross Activity frozen text unavailable");
  check(source.current==sourceBefore&&target.current==targetBefore,"source or target pending replaced");
  check(target.consumeDrop(drop,frozen),"workbench rejected accepted capture");check(!target.consumeDrop(drop,frozen)&&source.snapshotForDrop(drop)==null,"cross-owner duplicate consumption");
  view.end();check(ended.get()==1&&target.snapshotForDrop(drop)==null,"source completion did not revoke");
 });
 test("extraction sharing preserves exact source receiver and text-only scope",()->{
  var target=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());View ordinaryView=new View();var ordinary=new AtomicWorkbenchTransfer();ordinary.startTextDrag(ordinaryView,"ordinary",null);
  check(target.snapshotForDrop(new DragEvent(3,null,ordinaryView.clip.getDescription()))==null,"ordinary Transfer exported");ordinaryView.end();
  var host=new AtomicWorkbenchExtractionActivity();var source=new AtomicWorkbenchTransfer(host);View view=new View();
  check(source.beginForTest(view,payload("pending",0)),"pending start");check(target.snapshotForDrop(new DragEvent(3,null,view.clip.getDescription()))==null,"pending queue exported");view.end();
  check(!source.beginForTest(view,payload("with file",1)),"retired file start accepted");check(source.active()==null,"retired file session survived");
  source.startTextDrag(view,"extracted",null);var drop=new DragEvent(3,null,view.clip.getDescription());
  check(new AtomicWorkbenchTransfer().snapshotForDrop(drop)==null,"non-workbench receiver accepted");
  target.foreground=false;check(target.snapshotForDrop(drop)==null,"stopped receiver accepted");target.foreground=true;
  target.activity.finishing=true;check(target.snapshotForDrop(drop)==null,"finishing receiver accepted");target.activity.finishing=false;
  target.activity.destroyed=true;check(target.snapshotForDrop(drop)==null,"destroyed receiver accepted");target.activity.destroyed=false;
  check(target.snapshotForDrop(drop)!=null,"rejection damaged source");target.closed=true;check(target.snapshotForDrop(drop)==null,"closed receiver accepted");view.end();
 });
 test("cross Activity requires exact capability even with local object and never adopts foreign data",()->{
  var source=new AtomicWorkbenchTransfer(new AtomicWorkbenchExtractionActivity());var target=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());View view=new View();source.startTextDrag(view,"actual",null);
  check(target.snapshotForDrop(event(3,view.state,"text/plain"))==null,"local object bypassed capability");
  check(target.snapshotForDrop(new DragEvent(3,new Object(),view.clip.getDescription()))==null,"foreign local object accepted");
  for(String key:List.of("duo_drag_nonce","duo_drag_id","duo_drag_revision")){var bad=new ClipDescription("",new String[]{"application/vnd.lsaugment.transfer-session"});var extras=new android.os.PersistableBundle(view.clip.getDescription().getExtras());if(key.equals("duo_drag_revision"))extras.putLong(key,9);else extras.putString(key,"wrong");bad.setExtras(extras);check(target.snapshotForDrop(new DragEvent(3,null,bad))==null,"wrong cross-owner "+key);}
  check(target.snapshotForDrop(event(3,null,"text/plain"))==null,"external text imported");
  check(target.snapshotForDrop(event(3,view.state,AtomicWorkbenchPendingControls.SORT_MIME))==null,"sort bypassed");
  check(target.snapshotForDrop(new DragEvent(3,view.state,view.clip.getDescription()))!=null,"exact local+nonce rejected");view.end();
 });
 test("source stop capture revocation finish destroy close and timeout permanently revoke extraction lease",()->{
  for(int mode=0;mode<6;mode++){var host=new AtomicWorkbenchExtractionActivity();var source=new AtomicWorkbenchTransfer(host);var target=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());View view=new View();AtomicInteger ended=new AtomicInteger();source.startTextDrag(view,"capture",ended::incrementAndGet);var drop=new DragEvent(3,null,view.clip.getDescription());
   if(mode==0){host.started=false;source.stopForTest();}if(mode==1)host.captureCurrent=false;if(mode==2)host.finishing=true;if(mode==3)host.destroyed=true;if(mode==4)source.closeForTest();if(mode==5)source.main.fire();
   check(target.snapshotForDrop(drop)==null,"revoked source mode="+mode);host.started=host.captureCurrent=true;host.finishing=host.destroyed=false;
   check(target.snapshotForDrop(drop)==null&&ended.get()==1,"revoked source revived mode="+mode);view.end();check(ended.get()==1,"callback repeated mode="+mode);
  }
 });
 test("invalid extraction source cannot start or silently fall back to a global drag",()->{
  var host=new AtomicWorkbenchExtractionActivity();host.captureCurrent=false;var source=new AtomicWorkbenchTransfer(host);View view=new View();AtomicInteger ended=new AtomicInteger();
  check(!source.startTextDrag(view,"stale",ended::incrementAndGet)&&view.state==null&&ended.get()==1,"stale capture leaked through unshared drag");
 });
 test("second private extraction cannot overwrite the live source and old nonce never follows replacement",()->{
  var source=new AtomicWorkbenchTransfer(new AtomicWorkbenchExtractionActivity());var target=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());var second=new AtomicWorkbenchTransfer(new AtomicWorkbenchExtractionActivity());View a=new View(),b=new View();AtomicInteger ended=new AtomicInteger();
  source.startTextDrag(a,"first",null);var old=new DragEvent(3,null,a.clip.getDescription());check(!second.startTextDrag(b,"second",ended::incrementAndGet)&&ended.get()==1,"second capture replaced live owner");
  check(target.snapshotForDrop(old).text.equals("first"),"failed second start revoked first");a.end();check(second.startTextDrag(b,"second",null),"new gesture after first end failed");
  check(target.snapshotForDrop(old)==null,"old nonce authorized replacement");var next=new DragEvent(3,null,b.clip.getDescription());check(target.snapshotForDrop(next).text.equals("second"),"replacement failed");b.end();
 });
 test("refused private drop prompts from source only after restore without consuming text",()->{
  var host=new AtomicWorkbenchExtractionActivity();var source=new AtomicWorkbenchTransfer(host);var target=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());View view=new View();
  source.startTextDrag(view,"preserved",()->host.restored=true);var drop=new DragEvent(3,null,view.clip.getDescription());
  check(!target.requestExtractedTextPasteSetup(new DragEvent(1,null,view.clip.getDescription())),"START queued permission prompt");
  check(!source.requestExtractedTextPasteSetup(drop),"same owner queued cross-Activity prompt");
  check(!target.requestExtractedTextPasteSetup(event(3,null,"text/plain")),"foreign drag queued permission prompt");
  check(target.requestExtractedTextPasteSetup(drop)&&target.requestExtractedTextPasteSetup(drop)&&host.prompts==0,"prompt did not wait for ENDED");
  check(target.snapshotForDrop(drop).text.equals("preserved"),"refusal consumed text");view.end();view.end();
  check(host.restored&&host.prompts==1,"source prompt missing or repeated");check(!target.requestExtractedTextPasteSetup(drop),"ended capability queued prompt");
 });
 test("revoked private drop cannot resurrect permission UI",()->{
  for(int mode=0;mode<6;mode++){var host=new AtomicWorkbenchExtractionActivity();var source=new AtomicWorkbenchTransfer(host);var target=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());View view=new View();
   source.startTextDrag(view,"capture",()->host.restored=true);var drop=new DragEvent(3,null,view.clip.getDescription());check(target.requestExtractedTextPasteSetup(drop),"valid refusal not queued");
   if(mode==0){host.started=false;source.stopForTest();}if(mode==1)host.captureCurrent=false;if(mode==2)host.finishing=true;if(mode==3)host.destroyed=true;if(mode==4)source.closeForTest();if(mode==5)source.main.fire();
   view.end();check(host.prompts==0,"revoked source prompted mode="+mode);
  }
 });
 test("private window delivery waits for source restore and runs once on its queued turn",()->{
  var host=new AtomicWorkbenchExtractionActivity();host.textDragWindowHidden=true;var source=new AtomicWorkbenchTransfer(host);var target=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());View view=new View();AtomicInteger delivered=new AtomicInteger();
  source.startTextDrag(view,"capture",()->{host.restored=true;host.textDragWindowHidden=false;});var drop=new DragEvent(3,null,view.clip.getDescription());var frozen=target.snapshotForDrop(drop);
  check(target.consumeDrop(drop,frozen,owned->{check(owned&&host.restored,"delivery before source restoration");delivered.incrementAndGet();}),"valid private drop refused");
  check(delivered.get()==0&&!target.consumeDrop(drop,frozen,owned->delivered.incrementAndGet()),"delivery repeated before END");
  view.end();view.end();check(delivered.get()==0,"delivery ran inside END");source.main.fire();source.main.fire();check(delivered.get()==1,"queued delivery missing or repeated");
 });
 test("deferred private delivery cannot outlive source or receiver authority",()->{
  for(int mode=0;mode<9;mode++){var host=new AtomicWorkbenchExtractionActivity();var source=new AtomicWorkbenchTransfer(host);var receiver=new AtomicWorkbenchActivity();var target=new AtomicWorkbenchTransfer(receiver);View view=new View();AtomicInteger delivered=new AtomicInteger();
   source.startTextDrag(view,"capture",null);var drop=new DragEvent(3,null,view.clip.getDescription());check(target.consumeDrop(drop,target.snapshotForDrop(drop),owned->delivered.incrementAndGet()),"private drop not queued");view.end();
   if(mode==0)host.started=false;if(mode==1)host.captureCurrent=false;if(mode==2)host.finishing=true;if(mode==3)host.destroyed=true;if(mode==4)source.closed=true;if(mode==5)target.closed=true;if(mode==6)target.foreground=false;if(mode==7)receiver.destroyed=true;if(mode==8)host.textDragWindowHidden=true;
   source.main.fire();check(delivered.get()==0,"revoked deferred delivery ran mode="+mode);
  }
 });
 test("ordinary same-owner window delivery retains immediate semantics",()->{
  var owner=new AtomicWorkbenchTransfer(new AtomicWorkbenchActivity());View view=new View();AtomicInteger delivered=new AtomicInteger();owner.startTextDrag(view,"normal",null);var drop=new DragEvent(3,view.state,view.clip.getDescription());
  check(owner.consumeDrop(drop,owner.snapshotForDrop(drop),privateSource->{check(!privateSource,"ordinary drag borrowed source authority");delivered.incrementAndGet();})&&delivered.get()==1,"ordinary window delivery was deferred");view.end();owner.main.fire();check(delivered.get()==1,"ordinary delivery repeated at END");
 });
 System.out.println("TRANSFER SESSIONS PASS "+cases+" cases / "+checks+" assertions");}}
'''

def execute(folder, mutation=None):
    source = (S.SRC / "AtomicWorkbenchTransfer.java").read_text(encoding="utf-8")
    if mutation:
        assert mutation[0] in source
        source = source.replace(*mutation, 1)
    members = "\n".join(member(source, signature) for signature in SIGNATURES)
    constants = "\n".join(line for line in source.splitlines() if "private static final String DRAG_" in line)
    harness = """package ls.augment.com;import android.content.*;import android.net.Uri;import android.view.*;import java.io.*;
final class AtomicWorkbenchTransfer {final UiKit ui=new UiKit();boolean closed,foreground=true;final android.app.Activity activity;final android.os.Handler main=new android.os.Handler();AtomicWorkbenchPendingPayload current;private DragSession activeDrag;private static DragSession extractedTextDrag;
AtomicWorkbenchTransfer(){this(new android.app.Activity());}AtomicWorkbenchTransfer(android.app.Activity host){activity=host;}
void notice(String value){}Object active(){return activeDrag;}void closeForTest(){closed=true;revokeExtractedTextDrag();if(activeDrag!=null)endDrag(activeDrag);}void stopForTest(){foreground=false;revokeExtractedTextDrag();}
boolean beginForTest(View source,AtomicWorkbenchPendingPayload p){return beginDrag(source,p,null);}static ClipData clipForTest(AtomicWorkbenchPendingPayload p){return clip(p);}
""" + constants + members + "}"
    clip_source = S.STUBS["android/content/ClipData.java"].replace("final List<Item>items", "ClipDescription description;public ClipDescription getDescription(){return description;}final List<Item>items").replace("items.add(i);}public void", "items.add(i);description=new ClipDescription(l,m);}public void", 1)
    clip_source = clip_source.replace("public ClipData(String", "public ClipData(ClipDescription d,Item i){description=d;items.add(i);}public ClipData(String")
    sources = {**STUBS, "android/content/ClipData.java": clip_source,
               "android/content/Intent.java": S.STUBS["android/content/Intent.java"], "android/net/Uri.java": S.STUBS["android/net/Uri.java"],
               "ls/augment/com/AtomicWorkbenchTransfer.java": harness, "ls/augment/com/TestTransferSessions.java": TEST}
    extraction_source = (S.SRC / "AtomicWorkbenchExtractionActivity.java").read_text(encoding="utf-8")
    sources["ls/augment/com/AtomicWorkbenchExtractionActivity.java"] = sources["ls/augment/com/AtomicWorkbenchExtractionActivity.java"].replace("CURRENT_TEXT_DRAG_SOURCE", member(extraction_source, "boolean currentTextDragSource()"))
    sources["ls/augment/com/AtomicWorkbenchExtractionActivity.java"] = sources["ls/augment/com/AtomicWorkbenchExtractionActivity.java"].replace("CURRENT_TEXT_DELIVERY_SOURCE", member(extraction_source, "boolean currentTextDeliverySource()"))
    for name in ("AtomicWorkbenchTransferPolicy.java", "AtomicWorkbenchPendingPayload.java"):
        sources["ls/augment/com/" + name] = (S.SRC / name).read_text(encoding="utf-8")
    files = []
    for name, value in sources.items():
        path = Path(folder) / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(value, encoding="utf-8"); files.append(str(path))
    compile_result = subprocess.run([S.JAVAC, "--release", "17", "-encoding", "UTF-8", "-d", str(Path(folder) / "classes"), *files], capture_output=True, encoding="utf-8", errors="replace", env=S.ENV)
    if compile_result.returncode: raise AssertionError(compile_result.stderr)
    return subprocess.run([S.JAVA, "-Dfile.encoding=UTF-8", "-cp", str(Path(folder) / "classes"), "ls.augment.com.TestTransferSessions"], capture_output=True, encoding="utf-8", errors="replace", env=S.ENV, timeout=15)

def main():
    with tempfile.TemporaryDirectory(prefix="duo-transfer-session-") as temp:
        result = execute(temp); print(result.stdout, end="")
        if result.returncode: raise AssertionError(result.stderr)
    for name, mutation in {
        "retired file drag restored": ("if (closed || source == null || !snapshot.deliverable() || !snapshot.files.isEmpty())", "if (closed || source == null || !snapshot.deliverable())"),
        "drop silently reads new pending": ("new DeliverySnapshot(value.frozen)", "new DeliverySnapshot(current)"),
        "duplicate drop consumption accepted": ("value.consumed = true;\n        if (delivery != null)", "value.consumed = false;\n        if (delivery != null)"),
        "cross ViewRoot falls back to current pending": ("value.nonce.equals(extras.getString(DRAG_NONCE))", "true"),
        "end callback repeats after source end": ("if (value.owner != this || value.ended) return;", "if (value.owner != this) return;"),
        "extraction stays isolated in source Transfer": ("value = extractedTextDrag;", "value = null;"),
        "extraction source guard ignored": ("if (!((AtomicWorkbenchExtractionActivity) source.activity).currentTextDragSource())", "if (false)"),
        "cross Activity local state skips nonce": ("if (local != null && !extracted) return value;", "if (local != null) return value;"),
        "refusal consumes private text": ("value.pasteSetupRequested = true;", "value.pasteSetupRequested = true; value.consumed = true;"),
        "refusal prompt opens before source restoration": ("if (value.onEnded != null) try { value.onEnded.run(); } catch (RuntimeException ignored) { }", "if (value.pasteSetupRequested) ((AtomicWorkbenchExtractionActivity) activity).showTextPasteSetup(); if (value.onEnded != null) try { value.onEnded.run(); } catch (RuntimeException ignored) { }"),
        "private delivery runs in END instead of queued turn": ("main.post(delivery);", "delivery.run();"),
        "stopped source can deliver after END": ("&& !value.expired && !value.owner.closed", "&& !value.expired"),
    }.items():
        with tempfile.TemporaryDirectory(prefix="duo-transfer-session-negative-") as temp:
            result = execute(temp, mutation)
            if result.returncode == 0: raise AssertionError("negative survived: " + name)
            print("EXPECTED FAILURE " + name)
    print("TRANSFER SESSION OFFLINE PASS; ACTUAL CROSS-DIALOG DRAG REQUIRES PHONE ACCEPTANCE")
if __name__ == "__main__": main()
