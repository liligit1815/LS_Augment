"""Actual native-budget branches plus pure telemetry contracts, entirely offline."""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('wifi_budget_base',ROOT/'tools/test-wifi-asset-spacing-runtime.py')
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)
extra=r'''
 static void budgetDiagnostics(){
  StatusBarWifiBudgetDiagnostic d=new StatusBarWifiBudgetDiagnostic();
  check(d.pending("control",0,"wifi.signal",10,20455)==null,"no synthetic budget before actual observation");
  d.capture("unknown_vertical",-1,0,-1,"ancestor","branch",null);
  String first=d.pending("control",0,"wifi.signal",1000,20455);
  check(first.startsWith("WAB1;reason=unknown_vertical;vertical=-1"),"versioned first reason is retained");
  check(first.contains("build=20455")&&first.contains("uptime=1000"),"capture has build and monotonic time");
  for(int frame=0;frame<10000;frame++)check(d.pending("control",0,"wifi.signal",1001+frame*17L,20455)==null,"unchanged signature never republishes per frame or every thirty seconds");
  d.capture("overlap",8,7,9,"parent","branch","blocker");
  check(d.pending("control",0,"wifi.signal",1500,20455)==null,"changing animated geometry coalesced");
  String next=d.pending("control",0,"wifi.signal",3000,20455);
  check(next!=null&&next.contains("reason=overlap"),"latest coalesced change emits when eligible");
  check(d.pending("control",0,"wifi.signal",5000,20455)==null,"same result stays deduplicated");
  check(d.pending("notification",0,"wifi.signal",5000,20455)!=null,"different real surface receives its own key");
  d.capture("bounded",8,7,90,"parent","branch",null);
  check(d.pending("notification",0,"wifi.signal",7000,20455).contains("reason=bounded"),"successful budget can replace prior failure");
  for(String surface:new String[]{"main","lock","control","notification"})for(int rotation=0;rotation<4;rotation++)for(String id:new String[]{"wifi.signal","secondary_wifi.activity_inout"}){
   String key=StatusBarWifiBudgetDiagnostic.key(surface,rotation,id);check(key.matches("ls_augment_[a-zA-Z0-9_]{1,140}"),"ProviderDiagnostics legal key syntax");
  }
  for(String surface:new String[]{"unknown","control.bad","control;inject",""})check(StatusBarWifiBudgetDiagnostic.key(surface,0,"wifi.signal")==null,"invalid key component rejected");
  check(StatusBarWifiBudgetDiagnostic.key("control",4,"wifi.signal")==null,"invalid rotation rejected");
  check(StatusBarWifiBudgetDiagnostic.key("control",0,"mobile1.signal")==null,"foreign icon identity rejected");
  String oversized="a".repeat(10000);d.capture("overlap",8,0,100,oversized,oversized,oversized);
  String bounded=d.pending("control",1,"wifi.signal",10000,20455);check(bounded.length()<2000,"value retains complete grammar below ProviderDiagnostics hard cap");
  check(bounded.contains(";blocker={")&&bounded.endsWith("uptime=10000"),"bounded output retains last block and profile");
  d.capture("overlap",Integer.MAX_VALUE,Integer.MAX_VALUE,Integer.MAX_VALUE,oversized,oversized,oversized,oversized);
  String allFields=d.pending("control",1,"wifi.signal",12000,20456);check(allFields.length()<2000&&allFields.contains(";widthOrigin={"),"maximum-width provenance still fits complete ProviderDiagnostics value");
  d.capture("overlap",8,0,100,"abc;injected=private\n",null,null);
  String sanitized=d.pending("control",1,"wifi.signal",14000,20455);check(!sanitized.contains(";injected")&&!sanitized.contains("\n"),"record separators cannot be injected");

  com.zte.controlcenter.widget.CCHeaderView header=new com.zte.controlcenter.widget.CCHeaderView();header.width=300;header.height=140;header.params=new ViewGroup.MarginLayoutParams(300,140);
  LinearLayout row=new LinearLayout();row.width=200;row.height=42;row.left=100;row.params=new ViewGroup.MarginLayoutParams(200,42);header.add(row);
  ModernStatusBarWifiView owner=new ModernStatusBarWifiView();owner.width=46;owner.height=42;owner.params=new ViewGroup.MarginLayoutParams(-2,42);row.add(owner);
  FrameLayout frame=new FrameLayout();frame.params=new ViewGroup.MarginLayoutParams(-2,42);owner.add(frame);
  ImageView signal=image("wifi.signal",frame),activity=image("wifi.activity_inout",frame);Pair pair=new Pair(frame,signal,activity);
  StatusBarHeaderSpacingHook.capacity=-1;int[] result=nativeBudget(pair);eq(result[0],0,"unknown vertical still rejects width");eq(result[1],0,"unknown vertical still rejects height");
  String trace=pair.budgetDiagnostic.pending("control",0,"wifi.signal",1000,20455);
  check(trace.contains("reason=unknown_vertical")&&trace.contains("ModernStatusBarWifiView")&&trace.contains("resource=fixture_resource"),"actual first ancestor/resource emitted for vertical failure");
  StatusBarHeaderSpacingHook.capacity=8;owner.width=0;result=nativeBudget(pair);eq(result[0],0,"unmeasured ancestor remains rejected");
  trace=pair.budgetDiagnostic.pending("control",0,"wifi.signal",3000,20455);check(trace.contains("reason=unmeasured")&&trace.contains("measured=0,42"),"actual unmeasured bounds appear");
  owner.width=46;FrameLayout blocker=new FrameLayout();blocker.left=110;blocker.top=10;blocker.width=30;blocker.height=20;blocker.visibility=View.INVISIBLE;header.add(blocker);
  ImageView later=new ImageView();later.left=112;later.width=25;later.height=42;header.add(later);
  result=nativeBudget(pair);eq(result[0],0,"INVISIBLE blocker still reserves layout");
  trace=pair.budgetDiagnostic.pending("control",0,"wifi.signal",5000,20455);
  check(trace.contains("reason=overlap")&&trace.contains("blocker={class=android.widget.FrameLayout")&&trace.contains("visibility=4"),"first actual blocker, never a later one, emitted");
  check(trace.contains("local=110,10,140,30")&&trace.contains("lp=16,16")&&trace.contains("translation=0.0,0.0"),"blocker local bounds LP and translations survive format");
  blocker.height=0;later.visibility=View.GONE;result=nativeBudget(pair);eq(result[0],200,"laid-out zero-height sibling does not occupy horizontal interval");
  trace=pair.budgetDiagnostic.pending("control",0,"wifi.signal",7000,20455);check(trace.contains("reason=bounded")&&trace.contains("widthOrigin={nativeWidth=200,available=200,consumed=0,limit=200"),"successful budget records the ancestor that actually tightened width");
  blocker.visibility=View.GONE;result=nativeBudget(pair);eq(result[0],200,"bounded native success capacity unchanged");eq(result[1],50,"bounded vertical capacity unchanged");
  trace=pair.budgetDiagnostic.pending("control",0,"wifi.signal",9000,20455);check(trace==null,"GONE after a proven empty sibling keeps the same successful budget and emits no duplicate");
  row.parent=null;result=nativeBudget(pair);eq(result[0],0,"missing known header still fail closed");
  trace=pair.budgetDiagnostic.pending("control",0,"wifi.signal",11000,20455);check(trace.contains("reason=no_header"),"no-header distinguished from overlap");
  StatusBarHeaderSpacingHook.capacity=1000;
 }
'''
name='ls/augment/com/hook/TestWifiAssetSpacing.java'
base.SOURCES[name]=base.SOURCES[name].replace('public static void main(String[] args){',extra+'\n public static void main(String[] args){budgetDiagnostics();')
if __name__=='__main__':base.run()
