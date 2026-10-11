"""Execute production Entry lifecycle and InventoryRow methods. Offline Java facade, not pixels/device."""
from pathlib import Path
import argparse, hashlib, json, os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
JAVA=ROOT/'android/app/src/main/java/ls/augment/com'
SOURCE=JAVA/'hook/StatusBarAssetsHook.java'
JDK=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'

def extract(source,marker):
    start=source.index(marker);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]

HARNESS=r'''import java.util.*;import java.lang.ref.WeakReference;import ls.augment.com.*;
public class TestAssetsUnbound {
 static int checks,changes;static boolean enabled=true,artworkActive=true,policyHidden,decodingFails;static long layoutAssetGeneration=1,stateUpdateCount,drawCallbackCount;
 static Object application=new Object();static Set<Entry> ACTIVE_ENTRIES=new HashSet<>();static final String[] LAYERS={"whole","background","foreground"};
 static StatusBarThemeSpec theme=StatusBarThemeSpec.empty();static String[] liveStates={"level4","default"};
 static class Canvas{}static class Rect{Rect(int l,int t,int r,int b){}}
 static class Drawable{}static class Metrics{float density=3.25f;}static class Resources{Metrics getDisplayMetrics(){return new Metrics();}}
 static class View {View parent;Drawable background;int invalidations;String id="wifi.signal";boolean shown=true;
  View getParent(){return parent;}int getPaddingLeft(){return 0;}int getPaddingRight(){return 0;}int getPaddingTop(){return 0;}int getPaddingBottom(){return 0;}
  int getWidth(){return 46;}int getHeight(){return 42;}Resources getResources(){return new Resources();}void invalidate(){invalidations++;}
  Drawable getBackground(){return background;}void setBackground(Drawable v){background=v;}}
 static class ViewGroup extends View{}static class ImageView extends View{Drawable drawable=new Drawable();Drawable getDrawable(){return drawable;}void setImageDrawable(Drawable d){drawable=d;}}
 static class StatusBarAssetDrawable extends Drawable{Drawable original;int released,originalDraws;StatusBarAssetDrawable(Drawable d){original=d;}Drawable original(){return original;}void release(){released++;}int originalAlpha(){return 255;}void drawOriginal(Canvas c){originalDraws++;}}
 static class StatusBarArtwork {boolean disposed;void dispose(){disposed=true;}void draw(Canvas c,Rect a,StatusBarThemeSpec.Binding b,int tint,float d,int alpha){if(disposed)throw new AssertionError("Disposed artwork rendered");}}
 static class Resource {StatusBarThemeSpec.Binding binding;StatusBarArtwork art;boolean loading,disposed,drawn;String error="";long retryAt;
  Resource(Entry owner,StatusBarThemeSpec.Binding b){binding=b;}void load(){if(decodingFails)error="fixture_decode_failure";else art=new StatusBarArtwork();}
  void dispose(){disposed=true;if(art!=null)art.dispose();art=null;}}
 static class SystemClock {static long uptimeMillis(){return 1000;}}
 static class FeatureSettings {static void diagnostic(Object c,String k,String v){}}
 static class StatusBarWifiAssetSpacingHook {static boolean allowed=true;static void changed(View v){changes++;}static boolean allowArtwork(View v){return allowed;}}
 static class StateEvidence {String[] states=liveStates;String source="wifi_callback";}
 static String surfaceOf(ViewGroup v){return "control";}static String privacySurface(){return "main";}
 static boolean scopedHidden(View v,String id,String s){return policyHidden;}static boolean bound(String id){return theme.entries().stream().anyMatch(b->b.id.equals(id));}
 static String semantic(View v,String name,String slot){return v.id;}static String name(View v){return v.id;}static String slotOf(View v){return "";}
 static boolean prepareDrawing(Entry e,View v){if(e.wrapper==null){ImageView image=(ImageView)v;e.wrapper=new StatusBarAssetDrawable(image.getDrawable());image.setImageDrawable(e.wrapper);}return true;}
 static StateEvidence readState(View v,String id){return new StateEvidence();}static boolean observingSurface(String s){return true;}static boolean nativeIcon(View v){return true;}static int tint(View v){return 0xff333333;}
 static String themeId(String id,String layer,String s,View view){return id;}static void circleChanged(View view){}static boolean displayed(View v){return v.shown;}static boolean virtualCovered(View v,String id){return false;}static boolean parentReplaced(View v){return false;}
 static boolean privacyWindow(View v){return true;}static boolean below(View v,View root){for(View a=v;a!=null;a=a.parent)if(a==root)return true;return false;}
 static String bindingKey(Resource r){return r.binding.id+":"+r.binding.asset;}static String inventoryId(String id){return id;}static boolean activeRole(String id){return false;}static String cover="";static String coveringId(View v,String id,boolean virtual){return cover;}
 static class JSONObject {JSONObject put(String k,Object v)throws org.json.JSONException{return this;}}static class JSONArray{JSONArray(Object v){}}
 // PRODUCTION
 static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
 static InventoryRow row(Entry e){return new InventoryRow(e,"visible","当前显示","whole_layers");}
 static Entry entry(){ViewGroup root=new ViewGroup();ImageView v=new ImageView();v.parent=root;return new Entry(v,root,"wifi.signal",true,"");}
 static StatusBarThemeSpec boundTheme(String identity,String hash){return StatusBarThemeSpec.empty().with(new StatusBarThemeSpec.Binding(identity,identity.equals("wifi.signal")?"level4":"default","whole",hash.repeat(64),false,100,0,0,100,false,"control"));}
 static void nativeRow(Entry e,String reason){InventoryRow r=row(e);check(r.application.equals("native_unmapped"),reason+": "+r.application);check(r.matchedState.isEmpty()&&r.matchedAsset.isEmpty(),reason+" clears old hash/state");check(r.applicationReason.equals("当前状态未配置素材，保留原厂显示"),reason+" clears old reason");}
 public static void main(String[] args){
  theme=StatusBarThemeSpec.empty();artworkActive=false;Entry never=entry();never.update();check(row(never).application.equals("native"),"Never configured native icon keeps its existing inventory class");
  for(boolean globalEmpty:new boolean[]{true,false})for(boolean disposedBeforeUpdate:new boolean[]{false,true}){
   enabled=true;policyHidden=false;artworkActive=true;theme=boundTheme("wifi.signal","a");Entry e=entry();ImageView v=(ImageView)e.view.get();Drawable nativeDrawable=v.getDrawable();e.update();
   check(row(e).application.equals("ready"),"Decoded resource has not drawn yet");e.drawWrapped(new Canvas(),new Rect(0,0,46,42));check(row(e).application.equals("applied"),"Production draw latches history");
   Resource resource=e.resources.get("whole");StatusBarAssetDrawable wrapper=e.wrapper;
   if(disposedBeforeUpdate)e.dispose();
   theme=globalEmpty?StatusBarThemeSpec.empty():boundTheme("volume","b");artworkActive=!globalEmpty;e.update();
   nativeRow(e,"Removed binding empty="+globalEmpty+", predisposed="+disposedBeforeUpdate);
   check(e.resources.isEmpty()&&e.wrapper==null&&resource.disposed&&v.getDrawable()==nativeDrawable&&wrapper.released==1,"Removal releases once and restores original drawable");
   e.update();nativeRow(e,"Repeated native observation does not resurrect matched state");
   artworkActive=true;theme=boundTheme("wifi.signal","c");e.update();check(row(e).application.equals("ready")&&row(e).matchedAsset.equals("c".repeat(64)),"Reimport has its new resource and no old draw latch");
   e.drawWrapped(new Canvas(),new Rect(0,0,46,42));check(row(e).application.equals("applied"),"Reimport can render normally");
   StatusBarWifiAssetSpacingHook.allowed=false;e.drawWrapped(new Canvas(),new Rect(0,0,46,42));check(row(e).application.equals("applied")&&e.wrapper.originalDraws==1,"Capacity fallback keeps truthful historical draw latch; no rendering logic changed");StatusBarWifiAssetSpacingHook.allowed=true;
  }
  theme=boundTheme("wifi.signal","d");artworkActive=true;decodingFails=true;Entry failed=entry();failed.update();check(row(failed).application.equals("load_failed"),"Decode error remains distinct while binding exists");
  theme=StatusBarThemeSpec.empty();artworkActive=false;failed.update();nativeRow(failed,"Removing failed resource clears error/matched history");decodingFails=false;
  theme=boundTheme("wifi.signal","e");artworkActive=true;Entry hidden=entry();hidden.update();hidden.drawWrapped(new Canvas(),new Rect(0,0,46,42));policyHidden=true;theme=StatusBarThemeSpec.empty();artworkActive=false;hidden.update();
  check(row(hidden).application.equals("hidden_by_policy"),"Explicit policy-hidden state still wins");policyHidden=false;hidden.update();nativeRow(hidden,"Unhide without a binding is native unmapped");
  enabled=false;hidden.update();check(row(hidden).application.equals("disabled"),"Master disabled still overrides native unmapped");enabled=true;
  cover="wifi";check(row(hidden).application.equals("covered_by_parent"),"Parent replacement still wins");cover="";
  check(new InventoryRow(hidden,"hidden","原厂隐藏","whole_layers").application.equals("native_hidden"),"Native visibility remains authoritative");
  System.out.println("Production Entry/update/dispose/draw + InventoryRow: "+checks+" assertions passed (offline facade, not Android pixels)");
 }
}'''

def run(source,out):
    out.mkdir(parents=True,exist_ok=True)
    file=out/'TestAssetsUnbound.java'
    file.write_text(HARNESS.replace('// PRODUCTION','\n'.join(extract(source,m) for m in ['private static final class Entry {','private static final class InventoryRow{'])),encoding='utf-8')
    stub=out/'org/json/JSONException.java';stub.parent.mkdir(parents=True,exist_ok=True);stub.write_text('package org.json;public class JSONException extends Exception{}',encoding='utf-8')
    cp=[str(JAVA/name) for name in ['StatusBarThemeSpec.java','StatusBarSurfaceSpec.java','StatusBarIconCatalog.java','StatusBarAssetPolicy.java']]
    build=subprocess.run([str(JDK/'javac'),'-J-Duser.language=en','-J-Dfile.encoding=UTF-8','-encoding','UTF-8','-d',str(out),str(file),str(stub),*cp],capture_output=True,text=True,encoding='utf-8',errors='replace')
    if build.returncode:return build.returncode,build.stdout+build.stderr
    result=subprocess.run([str(JDK/'java'),'-Dfile.encoding=UTF-8','-Dstdout.encoding=UTF-8','-Dstderr.encoding=UTF-8','-cp',str(out),'TestAssetsUnbound'],capture_output=True,text=True,encoding='utf-8',errors='replace')
    return result.returncode,result.stdout+result.stderr

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--output',type=Path);parser.add_argument('--mutation',choices=['no-reset','keep-old-reason','only-if-resource-present']);args=parser.parse_args()
    source=SOURCE.read_text(encoding='utf-8')
    # Mutants are compiled in isolation; the workspace source is never changed.
    if args.mutation:
        marker='if(!applicationCode.equals("native")){applicationCode="native_unmapped";applicationReason="当前状态未配置素材，保留原厂显示";}'
        if marker not in source:raise RuntimeError('Expected reviewed production branch absent')
        source=source.replace(marker,{'no-reset':'','keep-old-reason':'if(!applicationCode.equals("native")){applicationCode="native_unmapped";}','only-if-resource-present':'if(!resources.isEmpty()){applicationCode="native_unmapped";applicationReason="当前状态未配置素材，保留原厂显示";}'}[args.mutation],1)
    if args.output:code,log=run(source,args.output)
    else:
        with tempfile.TemporaryDirectory(prefix='assets-unbound-') as temp:code,log=run(source,Path(temp))
    print(log,end='');raise SystemExit(code)
