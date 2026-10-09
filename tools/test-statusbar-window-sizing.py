"""Execute the real window interceptor and preserve native insets outside its scope."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'

def body(text, marker):
    start = text.index('{', text.index(marker))
    end, depth = start + 1, 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]

interceptor = body((SRC / 'hook/StatusBarWindowSizingHook.java').read_text(encoding='utf-8'),
                   '"statusbar.window."+m.getName()+m.getParameterCount()')
height = body((SRC / 'ConfigSchema.java').read_text(encoding='utf-8'), 'public static int statusBarHeightPx(')
source = '''
public class TestStatusBarWindowSizing {
 static final ThreadLocal<Boolean> NATIVE_DIMENSION=ThreadLocal.withInitial(()->false);
 static final ThreadLocal<Boolean> WINDOW_DIMENSION=ThreadLocal.withInitial(()->true);
 static class Context {Resources getResources(){return new Resources();}}
 static class Resources {Metrics getDisplayMetrics(){return new Metrics();}}
 static class Metrics {float density=3.25f;}
 static class ConfigSchema {
  static final int STATUSBAR_HEIGHT_MIN_DP=-32,STATUSBAR_HEIGHT_MAX_DP=96;
  static final String STATUSBAR_HEIGHT_DP="height",SYSTEMUI_MASTER="master";
  static int statusBarHeightPx(int nativePx,int configuredDp,float density) HEIGHT_BODY
 }
 static class FeatureSettings {
  static int selected;static boolean on=true;
  static boolean enabled(Context c,String k){return on;}
  static int integer(Context c,String k,int f,int min,int max){return selected;}
 }
 interface Original {int run() throws Throwable;}
 static class Chain {Original original;Chain(Original o){original=o;}Object proceed() throws Throwable{return original.run();}Object getArg(int n){return new Context();}}
 static int intercept(Chain chain)throws Throwable INTERCEPTOR
 static int checks;
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static void main(String[] args)throws Throwable {
  check(intercept(new Chain(()->107))==107,"component layout leaves native inset height fixed by default");
  check(intercept(new Chain(()->intercept(new Chain(()->107))))==107,"nested OEM measurements also stay fixed");
  FeatureSettings.selected=48;
  check(intercept(new Chain(()->107))==156,"explicit window height changes application inset");
  check(intercept(new Chain(()->intercept(new Chain(()->107))))==156,"nested window helper applies explicit height only once");
  FeatureSettings.selected=-4;check(intercept(new Chain(()->107))==94,"negative height applies one bounded native offset");FeatureSettings.selected=48;
  FeatureSettings.on=false;check(intercept(new Chain(()->107))==107,"master off restores native height");FeatureSettings.on=true;
  WINDOW_DIMENSION.set(false);check(intercept(new Chain(()->107))==107,"OEM icon dimensions stay native");WINDOW_DIMENSION.set(true);
  FeatureSettings.selected=0;check(intercept(new Chain(()->107))==107,"clearing explicit height restores native inset");
  System.out.println("Status bar window sizing: "+checks+" actual-interceptor assertions passed");
 }
}
'''.replace('HEIGHT_BODY', height).replace('INTERCEPTOR', interceptor)
with tempfile.TemporaryDirectory(prefix='lsa-statusbar-window-') as temp:
    path = Path(temp) / 'TestStatusBarWindowSizing.java'
    path.write_text(source, encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', temp, str(path)], check=True)
    subprocess.run(['java', '-cp', temp, 'TestStatusBarWindowSizing'], check=True)
