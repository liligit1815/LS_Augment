"""Run production resource classification/diagnostic lookup against signed and generated IDs."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
JAVA = Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin"


def member(source, signature):
    start = source.index(signature)
    end, depth = source.index("{", start) + 1, 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


FILES = {
    "android/content/res/Resources.java": '''package android.content.res;import java.util.*;public class Resources{
 public static class NotFoundException extends RuntimeException{}public int lookups;public final Map<Integer,String[]> entries=new HashMap<>();
 public String getResourcePackageName(int id){lookups++;if(!entries.containsKey(id))throw new NotFoundException();return entries.get(id)[0];}
 public String getResourceEntryName(int id){lookups++;if(!entries.containsKey(id))throw new NotFoundException();return entries.get(id)[1];}}''',
    "android/view/View.java": '''package android.view;import android.content.res.Resources;public class View{
 public static final int NO_ID=-1;public int id=NO_ID;public final Resources resources=new Resources();public int getId(){return id;}public Resources getResources(){return resources;}
 public ViewGroup.LayoutParams getLayoutParams(){return null;}public int getVisibility(){return 0;}public int getLeft(){return 0;}public int getTop(){return 0;}public int getRight(){return 1;}public int getBottom(){return 1;}
 public int getMeasuredWidth(){return 1;}public int getMeasuredHeight(){return 1;}public float getTranslationX(){return 0;}public float getTranslationY(){return 0;}public float getScaleX(){return 1;}public float getScaleY(){return 1;}}''',
    "android/view/ViewGroup.java": '''package android.view;public class ViewGroup extends View{public static class LayoutParams{public int width,height;}public static class MarginLayoutParams extends LayoutParams{public int topMargin,bottomMargin;public int getMarginStart(){return 0;}public int getMarginEnd(){return 0;}}}''',
    "ls/augment/com/TestLintUiTypeSemantics.java": r'''package ls.augment.com;import android.view.*;public class TestLintUiTypeSemantics{
 static int checks;static void yes(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static View view(int id,String pkg,String name){View v=new View();v.id=id;if(pkg!=null)v.resources.entries.put(id,new String[]{pkg,name});return v;}
 public static void main(String[] args){
  View framework=view(0x01020001,"android","customPanel"),app=view(0x7f020001,"ls.augment.com","customPanel");
  yes(AppDialogsHarness.name(framework).equals("customPanel"),"framework dialog resource keeps its styling identity");
  yes(AppDialogsHarness.name(app).isEmpty(),"app-owned customPanel is not styled as an Android framework container");
  View high=view(0x80020001,"vendor.overlay","wifi_signal");
  yes(WifiHarness.describe(high).contains("resource=wifi_signal"),"negative signed resource IDs still resolve diagnostic metadata");
  yes(AppDialogsHarness.name(high).isEmpty(),"a high-bit resource is classified by its real package");
  View frameworkAlias=view(0x80020002,"android","alertTitle");
  yes(AppDialogsHarness.name(frameworkAlias).equals("alertTitle"),"framework ownership follows Resources namespace rather than package-byte arithmetic");
  for(int id:new int[]{View.NO_ID,0}){View absent=view(id,null,null);yes(AppDialogsHarness.name(absent).isEmpty()&&absent.resources.lookups==0,"absent IDs do not call Resources");yes(WifiHarness.describe(absent).contains("resource=none")&&absent.resources.lookups==0,"absent diagnostic IDs do not call Resources");}
  for(int id:new int[]{42,0x0102ffff,0x8002ffff}){View generated=view(id,null,null);yes(AppDialogsHarness.name(generated).isEmpty(),"unresolved/generated ID leaves custom background ownership alone");yes(WifiHarness.describe(generated).contains("resource=none"),"unresolved diagnostic ID is harmless");}
  System.out.println("PASS UI resource type semantics: "+checks+" checks");}}
''',
}


def main():
    dialogs = (SRC / "AppDialogs.java").read_text(encoding="utf-8")
    wifi = (SRC / "hook/StatusBarWifiAssetSpacingHook.java").read_text(encoding="utf-8")
    files = dict(FILES)
    files["ls/augment/com/AppDialogsHarness.java"] = "package ls.augment.com;import android.view.View;final class AppDialogsHarness{static String name(View v){return frameworkResourceName(v);}" + member(dialogs, "private static String frameworkResourceName") + "}"
    files["ls/augment/com/WifiHarness.java"] = "package ls.augment.com;import android.view.*;final class WifiHarness{static String describe(View v){return budgetView(v);}" + member(wifi, "private static String budgetView") + "}"
    with tempfile.TemporaryDirectory(prefix="duo-ui-type-semantics-") as temporary:
        folder = Path(temporary)
        paths = []
        for name, source in files.items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding="utf-8")
            paths.append(path)
        suffix = ".exe" if os.name == "nt" else ""
        subprocess.run([str(JAVA / ("javac" + suffix)), "-encoding", "UTF-8", "--release", "17", "-d", str(folder), *map(str, paths)], check=True)
        subprocess.run([str(JAVA / ("java" + suffix)), "-cp", str(folder), "ls.augment.com.TestLintUiTypeSemantics"], check=True)


if __name__ == "__main__":
    main()
