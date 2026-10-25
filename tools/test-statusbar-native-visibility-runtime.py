"""Execute the production icon-visibility callback against native header layout facades.

The row models StatusIconContainer's eligibility contract. This is not ROM/device evidence.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(os.environ.get('DUO_SOURCE_ROOT', Path(__file__).resolve().parents[1]))
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
SOURCE = (JAVA / 'hook/RedMagicLegacyUiHook.java').read_text(encoding='utf-8')


def extract(marker, source=SOURCE):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


begin = SOURCE.index('for (String type : new String[]{"com.android.systemui.statusbar.StatusBarIconView"')
end = SOURCE.index('count += hook(module, loader, "com.zte.feature.volume.MfvVolumeDialog"', begin)

HARNESS = r'''import java.util.*;import ls.augment.com.*;
public final class TestNativeIconVisibility {
 static final Object PASS=new Object();static int checks;
 interface After {Object run(Object owner,Object[] args,Object result);}
 static final class AugmentModule {final Map<String,After> callbacks=new HashMap<>();}
 static AugmentModule module=new AugmentModule();
 static int hook(AugmentModule m,ClassLoader loader,String type,String name,int count,Object before,After after){
  check(name.equals("isIconVisible")&&count==0&&before==null,"existing visibility adapter remains after-only");
  m.callbacks.put(type,after);return 1;
 }
 static int install(AugmentModule module,ClassLoader loader){int count=0;
 // INSTALL
 return count;}
 static class View {
  final String id,slot,type;String surface="control";boolean nativeVisible=true,blocked,legacyHidden;int width=24,x=-1;
  View(String id,String slot,String type){this.id=id;this.slot=slot;this.type=type;}
  boolean isIconVisible(){After callback=module.callbacks.get(type);Object result=callback.run(this,new Object[0],nativeVisible);return result==PASS?nativeVisible:(Boolean)result;}
 }
 static View classic(String id){return new View(id,id,"com.android.systemui.statusbar.StatusBarIconView");}
 static View mobile(String id){return new View(id,"mobile","com.android.systemui.statusbar.pipeline.shared.ui.view.ModernStatusBarView");}
 static boolean shouldHideStatusIcon(View view){return view.legacyHidden;}
 static final class StatusBarAssetsHook {
  static boolean enabled=true,visibilityActive;static int semanticCalls;static StatusBarVisibilitySpec policy=StatusBarVisibilitySpec.empty();
  static String semanticId(View view){semanticCalls++;return view.id;}static String surfaceFor(View view){return view.surface;}
  static boolean scopedHidden(View view,String id,String surface){return policy.hidden(surface,id);}
  // NATIVE_HIDDEN
 }
 // HELPER
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static void hide(String raw){StatusBarAssetsHook.policy=Objects.requireNonNull(StatusBarVisibilitySpec.parse(raw));StatusBarAssetsHook.visibilityActive=!StatusBarAssetsHook.policy.isEmpty();}
 // Native rows query StatusIconDisplayable independently of draw suppression.
 // Width and spacing are only consumed by eligible views, packed from the end.
 static final class Row {
  final List<View> children;final Set<String> ignored=new HashSet<>();int measured;final int gap=3;
  Row(View... icons){children=Arrays.asList(icons);}
  boolean eligible(View v){return v.isIconVisible()&&!v.blocked&&!ignored.contains(v.slot);}
  void measure(){int count=0;measured=0;for(View v:children)if(eligible(v)){measured+=v.width;count++;}measured+=Math.max(0,count-1)*gap;}
  void layout(){int x=measured;for(int i=children.size()-1;i>=0;i--){View v=children.get(i);v.x=-1;if(!eligible(v))continue;x-=v.width;v.x=x;x-=gap;}}
 }
 public static void main(String[] args){
  check(install(module,TestNativeIconVisibility.class.getClassLoader())==2,"classic and modern adapters registered");
  View volume=classic("volume"),ims=classic("ims_icon"),sim1=mobile("mobile1"),sim2=mobile("mobile2");
  Row row=new Row(volume,ims,sim1,sim2);row.measure();row.layout();check(row.measured==105&&sim1.x==54,"unconfigured native measurements preserved");
  check(StatusBarAssetsHook.semanticCalls==0,"unconfigured native queries perform no semantic lookup");
  // Exact log configuration: no artwork, no hint prioritization, IMS hidden.
  hide("SV1;all,ims_icon,hide;all,mobile1.activity_in,hide;all,mobile1.activity_inout,hide;all,mobile2.activity_inout,hide");
  row.measure();row.layout();check(row.measured==78&&ims.x==-1&&sim1.x==27,"hidden IMS consumes neither width nor a middle spacing cell");
  check(sim1.isIconVisible()&&sim2.isIconVisible(),"hiding traffic child leaves both whole SIM cells eligible");
  for(String surface:new String[]{"main","lock","notification","control"}){
   ims.surface=surface;check(!ims.isIconVisible(),"all-surface rule reaches native state at "+surface);
  }
  hide("SV1;notification,ims_icon,hide");ims.surface="control";check(ims.isIconVisible(),"notification-only rule leaves control header intact");
  ims.surface="notification";check(!ims.isIconVisible(),"notification-only rule reaches selected header");
  hide("SV1;all,mobile1,hide");row.measure();row.layout();check(!sim1.isIconVisible()&&sim2.isIconVisible()&&sim2.x==54,"same-slot SIM2 remains independently visible");
  check(row.ignored.isEmpty(),"per-instance rule never rewrites OEM ignored slot set");
  hide("");row.measure();row.layout();check(ims.isIconVisible()&&sim1.isIconVisible()&&row.measured==105,"removing visibility policy restores current native cells");
  ims.nativeVisible=false;check(!ims.isIconVisible(),"no rule never forces native-invisible icon to appear");
  hide("SV1;all,ims_icon,hide");ims.nativeVisible=true;StatusBarAssetsHook.enabled=false;
  check(ims.isIconVisible(),"disabled appearance preserves native state");StatusBarAssetsHook.enabled=true;
  check(!ims.isIconVisible(),"resuming icon appearance reapplies policy");
  hide("");volume.legacyHidden=true;check(!volume.isIconVisible(),"legacy hide rule still excludes native layout");
  volume.legacyHidden=false;sim2.blocked=true;row.measure();check(row.measured==78,"native blocked icons remain excluded");
  sim2.blocked=false;row.ignored.add("ims_icon");row.measure();check(row.measured==78,"native ignored slots remain authoritative");
  for(int i=0;i<1000;i++){hide(i%2==0?"SV1;all,ims_icon,hide":"");row.ignored.clear();row.measure();row.layout();}
  check(row.measured==105&&ims.nativeVisible,"repeated toggles do not mutate native visibility or accumulate spacing");
  System.out.println("Native icon visibility production callback: "+checks+" assertions passed (not device evidence)");
 }
}'''

body = HARNESS.replace('// INSTALL', SOURCE[begin:end]).replace(
    '// HELPER', extract('private static boolean hiddenStatusIcon(View view)'))
body = body.replace('// NATIVE_HIDDEN', extract('static boolean nativeLayoutHidden(View view)',
                    (JAVA / 'hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')))
with tempfile.TemporaryDirectory(prefix='duo-native-icon-visibility-') as tmp:
    path = Path(tmp) / 'TestNativeIconVisibility.java'
    path.write_text(body, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, str(path),
                    *(str(JAVA / name) for name in ['StatusBarVisibilitySpec.java', 'StatusBarIconCatalog.java'])], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestNativeIconVisibility'], check=True, timeout=15)
