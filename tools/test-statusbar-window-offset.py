"""Execute the production dimension interceptor, including nested framework calls."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'


def body(text, start):
    first = text.index('{', text.index(start))
    end, depth = first + 1, 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[first:end]


interceptor = body((SRC / 'hook/StatusBarWindowSizingHook.java').read_text(encoding='utf-8'),
                   '"statusbar.window."+m.getName()+m.getParameterCount()')
height = body((SRC / 'ConfigSchema.java').read_text(encoding='utf-8'), 'public static int statusBarHeightPx(')
source = '''
public class TestWindowOffset {
 static final ThreadLocal<Boolean> NATIVE_DIMENSION=ThreadLocal.withInitial(()->false);
 static final ThreadLocal<Boolean> WINDOW_DIMENSION=ThreadLocal.withInitial(()->true);
 static class Context {Resources getResources(){return new Resources();}}
 static class Resources {Metrics getDisplayMetrics(){return new Metrics();}}
 static class Metrics {float density=3.25f;}
 static class ConfigSchema {
  static final int STATUSBAR_HEIGHT_MIN_DP=-32,STATUSBAR_HEIGHT_MAX_DP=96;
  static final String STATUSBAR_HEIGHT_DP="height",SYSTEMUI_MASTER="master";
  static int statusBarHeightPx(int nativePx,int configuredDp,float density) /* HEIGHT_BODY */
 }
 static class FeatureSettings {
  static int selected=-4;static boolean on=true;
  static boolean enabled(Context c,String k){return on;}
  static int integer(Context c,String k,int f,int min,int max){return selected;}
 }
 interface Original {int run() throws Throwable;}
 static class Chain {Original original;Chain(Original o){original=o;}Object proceed() throws Throwable{return original.run();}Object getArg(int n){return new Context();}}
 static int intercept(Chain chain)throws Throwable INTERCEPTOR
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);}
 public static void main(String[] args)throws Throwable {
  check(intercept(new Chain(()->107))==94,"simple negative offset");
  check(intercept(new Chain(()->intercept(new Chain(()->107))))==94,"nested helper must not subtract twice");
  check(intercept(new Chain(()->intercept(new Chain(()->70))))==57,"rotation uses its native baseline");
  WINDOW_DIMENSION.set(false);check(intercept(new Chain(()->107))==107,"OEM icon padding stays native");WINDOW_DIMENSION.set(true);
  NATIVE_DIMENSION.set(true);check(intercept(new Chain(()->107))==107,"native baseline read stays native");NATIVE_DIMENSION.set(false);
  FeatureSettings.on=false;check(intercept(new Chain(()->107))==107,"master off restores native");FeatureSettings.on=true;
  FeatureSettings.selected=0;check(intercept(new Chain(()->107))==107,"zero restores native");
  FeatureSettings.selected=96;check(intercept(new Chain(()->intercept(new Chain(()->107))))==312,"full upper bound");
  try{intercept(new Chain(()->{throw new IllegalStateException();}));throw new AssertionError("expected original exception");}catch(IllegalStateException expected){}
  check(!NATIVE_DIMENSION.get(),"exception cannot leak thread-local guard");
  System.out.println("Status bar window offset: 9 actual-interceptor assertions passed");
 }
}
'''.replace('/* HEIGHT_BODY */', height).replace('INTERCEPTOR', interceptor)

with tempfile.TemporaryDirectory(prefix='lsa-window-offset-') as temp:
    path = Path(temp) / 'TestWindowOffset.java'
    path.write_text(source, encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', temp, str(path)], check=True)
    subprocess.run(['java', '-cp', temp, 'TestWindowOffset'], check=True)
