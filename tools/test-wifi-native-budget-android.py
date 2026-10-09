"""Production Wi-Fi budget on real Android 16 Views. No phone, APK, or Gradle.

Uses existing pinned Robolectric dependencies. Only configuration/Grid/asset ports
are doubled; nativeBudget, occupancy, telemetry and nativeWidthLimit are production.
"""
from pathlib import Path
import argparse, os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
JDK=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
DEPS=ROOT/'out/header-clock-20455/android-runtime/deps'
BASE=ROOT/'out/wifi-managed-header-band/android-runtime'

def extract(text,marker):
    start=text.index(marker);end=text.index('{',start)+1;depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}');end+=1
    return text[start:end]

SUPPORT={
'com/zte/controlcenter/widget/CCHeaderView.java':'''package com.zte.controlcenter.widget;public class CCHeaderView extends android.widget.RelativeLayout {public CCHeaderView(android.content.Context c){super(c);}}''',
'ls/augment/com/BuildConfig.java':'''package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20456;}''',
'ls/augment/com/ConfigSnapshot.java':'''package ls.augment.com;public class ConfigSnapshot {public String checksum="local";public java.util.Map<String,String> values(){return java.util.Collections.emptyMap();}}''',
'ls/augment/com/ConfigSchema.java':'''package ls.augment.com;public class ConfigSchema {public static boolean isRuntimeKey(String k){return true;}}''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;public class FeatureSettings {static ls.augment.com.ConfigSnapshot snapshot(android.content.Context c){return new ls.augment.com.ConfigSnapshot();}static void diagnostic(android.content.Context c,String k,String v){}}''',
'ls/augment/com/hook/StatusBarAssetsHook.java':'''package ls.augment.com.hook;import android.view.*;class StatusBarAssetsHook {static String semanticId(View v){return v==null?"":String.valueOf(v.getTag());}static String surfaceFor(View v){return "control";}static class LayoutRendering {long generation=1;boolean current=true,series=true;}static LayoutRendering layoutRendering(View v){return new LayoutRendering();}}''',
'ls/augment/com/hook/StatusBarHeaderSpacingHook.java':'''package ls.augment.com.hook;import android.view.*;class StatusBarHeaderSpacingHook {static int capacity=83;static int assetVerticalCapacity(View v){return capacity;}}''',
'ls/augment/com/hook/StatusBarGridHook.java':'''package ls.augment.com.hook;import android.view.*;class StatusBarGridHook {static boolean configuredIconLayout(View v){return false;}static boolean ownsIconLayout(View v){return false;}}''',
'ls/augment/com/hook/NotificationAppearanceHook.java':'''package ls.augment.com.hook;import android.view.*;import java.util.*;class NotificationAppearanceHook {
 static final Map<View,HeaderState> HEADERS=new WeakHashMap<>();
 static class HeaderState {boolean applied,refreshing;int nativeDepth;float contentBottom;View right,band;}
 static HeaderState manage(View h,View right,View band){HeaderState s=new HeaderState();s.applied=true;s.contentBottom=1;s.right=right;s.band=band;HEADERS.put(h,s);return s;}
 static View nativeChild(View h,String id){HeaderState s=HEADERS.get(h);return s==null?null:id.equals("status_icons_group_container")?s.right:s.band;}
 // OWNED_ICON_BAND
}''',
'ls/augment/com/hook/StatusBarIconLayoutHook.java':'''package ls.augment.com.hook;import android.view.*;import java.util.*;import ls.augment.com.*;class StatusBarIconLayoutHook {
 static Map<ViewGroup,SizeRecord> CHILD_BOXES=new WeakHashMap<>();
 static Map<View,MarginRecord> MARGINS=new WeakHashMap<>();
 static boolean composite(View v){return false;}static void refreshComposite(View v){}static boolean zeroNativeMargins(View v){return true;}
 static float density(View v){return v.getResources().getDisplayMetrics().density;}
 static ViewGroup compositeOwner(View v){return (ViewGroup)v.getParent().getParent();}
 static StatusBarIconSpacingSpec.Insets insets(View v){return StatusBarIconSpacingSpec.ZERO;}
 static void apply(StatusBarWifiAssetSpacingHook.Pair pair){
  for(View child:new View[]{pair.signal,pair.activity}){
   MarginRecord record=MARGINS.get(child);if(record==null||record.params!=child.getLayoutParams()){record=new MarginRecord((ViewGroup.MarginLayoutParams)child.getLayoutParams());MARGINS.put(child,record);}
   int[] p=pair.active?(child==pair.signal?pair.plan.signalMargins:pair.plan.activityMargins):new int[4];record.applyPixels(child,p[0],p[1],p[2],p[3]);
  }resizeChildren((ViewGroup)pair.parent.getParent(),0);
 }
 // NATIVE_WIDTH
 // OWNED_LAYOUT
}''',
}

def run(source_root=ROOT,mutations=False):
    BASE.mkdir(parents=True,exist_ok=True)
    if not (DEPS/'robolectric-4.16.1.jar').exists():raise RuntimeError('Pinned standalone Android test dependencies unavailable')
    production=source_root/'android/app/src/main/java/ls/augment/com'
    cp=os.pathsep.join([str(ROOT/'audit-output/android-sdk/platforms/android-36/android.jar'),*[str(j) for j in DEPS.glob('*.jar')]])
    layout=(production/'hook/StatusBarIconLayoutHook.java').read_text(encoding='utf-8')
    native_width=extract(layout,'static int nativeWidthLimit(')
    owned_layout='\n'.join(extract(layout,m) for m in ['private static final class SizeRecord','private static final class MarginRecord','private static int[] resizeChildren(','private static void restoreChildBoxes(','static void restoreWifiAssetPair('])
    hook=(production/'hook/StatusBarWifiAssetSpacingHook.java').read_text(encoding='utf-8')
    owned_band=extract((production/'hook/NotificationAppearanceHook.java').read_text(encoding='utf-8'),'static View ownedIconBand(')
    candidates=[('production',hook)]
    if mutations:
        for name,old,new in [
            ('reserve-pair-only','nativeBand.union(pending);return nativeBand;','return pending;'),
            ('omit-owned-band', 'if(band!=null&&below(pair.parent,band))branchRect=managedBandRect(pair,band,parent);', '/* leave whole right column */'),
            ('omit-pending-height', 'Math.max(pair.parent.getHeight(),pair.plan.height)', 'pair.parent.getHeight()'),
            ('ignore-pending-matrix', 'at.getMatrix().mapRect(transformed);', '/* lose ancestor matrix */'),
            ('relax-without-current-ownership', 'View band=NotificationAppearanceHook.ownedIconBand(parent,branch);', 'View band=parent.getChildAt(0) instanceof android.view.ViewGroup?((android.view.ViewGroup)parent.getChildAt(0)).getChildAt(0):null;'),
            ('empty-is-overlap','if(occupied.isEmpty()||occupied.bottom<=branchRect.top','if(occupied.bottom<=branchRect.top'),
            ('invisible-frees-slot','if(sibling==branch||sibling.getVisibility()==View.GONE)continue;','if(sibling==branch||sibling.getVisibility()!=View.VISIBLE)continue;'),
            ('ignore-transforms','view.getMatrix().mapRect(transformed);','/* omitted matrix */'),
            ('ignore-overflow','if(view instanceof ViewGroup&&!((ViewGroup)view).getClipChildren())','if(false)'),
            ('unknown-empty-is-free','if(depth>12||!view.isLaidOut())return null;','if(depth>12)return null;'),
            ('first-empty-stops-search','if(occupied.isEmpty()||occupied.bottom<=branchRect.top||occupied.top>=branchRect.bottom)continue;','if(occupied.isEmpty())break;if(occupied.bottom<=branchRect.top||occupied.top>=branchRect.bottom)continue;'),
            ('lose-width-origin','pair.widthLimitOrigin="nativeWidth="+nativeWidth+",available="+available+",consumed="+consumed+",limit="+next+","+budgetView(parent);','pair.widthLimitOrigin="none";'),
            ('forget-oem-envelope','wraps|=nativeWifiEnvelope(pair,parent,branch,nativeWidth);','/* lose known native envelope */'),
            ('every-fixed-box-mutable','wraps|=nativeWifiEnvelope(pair,parent,branch,nativeWidth);','wraps=true;'),
            ('changed-native-width-is-safe','||inner==null||inner.width!=ViewGroup.LayoutParams.WRAP_CONTENT||nativeWidth!=pair.width()','||inner==null||inner.width!=ViewGroup.LayoutParams.WRAP_CONTENT'),
            ('unknown-row-is-safe','||!owner.getParent().getClass().getName().equals("com.android.systemui.statusbar.phone.StatusIconContainer")','||false'),
            ('ignore-actual-parent-size','pair.parent.getWidth()<pair.plan.width||pair.parent.getHeight()<pair.plan.height','false'),
            ('raw-width-omits-native-cost','int cost=Math.max(measuredCost,actualCost);count++;','int cost=Math.max(measured,actual);count++;'),
            ('omit-own-slot-extra','reserved+=cost-Math.max(measured,actual);','reserved+=0;'),
            ('omit-native-gap','reserved+=(long)Math.max(0,count-1)*spacing;','/* omit per-row native gap */'),
            ('ignore-native-icon-limit','if(restrict&&count>maximum)','if(false)'),
            ('ignored-slots-still-count','||((Collection<?>)ignored).contains(slot)',''),
            ('native-invisible-donates-room','View child=row.getChildAt(i);result.blocker=child;','View child=row.getChildAt(i);result.blocker=child;if(child.getVisibility()!=View.VISIBLE)continue;'),
            ('use-only-current-layout-cost','int cost=Math.max(measuredCost,actualCost);count++;','int cost=actualCost;count++;'),
            ('use-only-pending-measure-cost','int cost=Math.max(measuredCost,actualCost);count++;','int cost=measuredCost;count++;'),
            ('native-unknown-becomes-room','}catch(ReflectiveOperationException|RuntimeException unavailable){return result;}','}catch(ReflectiveOperationException|RuntimeException unavailable){result.reason=null;return result;}'),
        ]:
            if old not in hook:raise RuntimeError('Mutation anchor absent: '+name)
            candidates.append((name,hook.replace(old,new)))
    outcomes=[]
    for label,candidate in candidates:
        with tempfile.TemporaryDirectory(prefix='duo-native-wifi-') as tmp:
            folder=Path(tmp);paths=[]
            for name,code in SUPPORT.items():
                f=folder/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code.replace('// NATIVE_WIDTH',native_width).replace('// OWNED_LAYOUT',owned_layout).replace('// OWNED_ICON_BAND',owned_band),encoding='utf-8');paths.append(f)
            paths.extend((ROOT/'tools/tests/wifi-native-support').glob('*.java'))
            f=folder/'ls/augment/com/hook/StatusBarWifiAssetSpacingHook.java';f.write_text(candidate,encoding='utf-8');paths.append(f)
            paths.extend(production/(n+'.java') for n in ['StatusBarIconCatalog','StatusBarSurfaceSpec','StatusBarIconSpacingSpec','StatusBarHeaderSpacingObservation','StatusBarWifiSpacingPolicy','StatusBarWifiAssetSpacingPolicy','StatusBarWifiAssetSpacingObservation','StatusBarWifiBudgetDiagnostic','HeaderClockLayout','HeaderClockGeometry','NotificationLayoutPolicy'])
            paths.append(ROOT/'tools/tests/WifiNativeBudgetAndroidTest.java')
            paths.append(ROOT/'tools/tests/WifiManagedHeaderAndroidTest.java')
            compile=subprocess.run([str(JDK/'javac.exe'),'-J-Duser.language=en','-encoding','UTF-8','-cp',cp,'-d',str(folder),*map(str,paths)],capture_output=True,text=True,encoding='utf-8')
            (BASE/(label+'-compile.log')).write_text(compile.stdout+compile.stderr,encoding='utf-8')
            if compile.returncode:raise RuntimeError('Compilation failed: '+str(BASE/(label+'-compile.log')))
            runtime=os.pathsep.join([str(folder),*[str(j) for j in DEPS.glob('*.jar')]])
            result=subprocess.run([str(JDK/'java.exe'),'-Dfile.encoding=UTF-8','-Drobolectric.dependency.repo.url=https://repo.maven.apache.org/maven2','-cp',runtime,'org.junit.runner.JUnitCore','ls.augment.com.hook.WifiNativeBudgetAndroidTest','ls.augment.com.hook.WifiManagedHeaderAndroidTest'],cwd=BASE,capture_output=True,text=True,encoding='utf-8',timeout=120)
            (BASE/(label+'.log')).write_text(result.stdout+result.stderr,encoding='utf-8')
            okay=result.returncode==0 if label=='production' else result.returncode!=0 and 'java.lang.AssertionError' in result.stdout+result.stderr
            print(label, 'PASS' if okay else 'FAIL',flush=True);outcomes.append(okay)
    return 0 if all(outcomes) else 1

if __name__=='__main__':
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--source-root',type=Path,default=ROOT);ap.add_argument('--mutations',action='store_true');args=ap.parse_args();raise SystemExit(run(args.source_root,args.mutations))
