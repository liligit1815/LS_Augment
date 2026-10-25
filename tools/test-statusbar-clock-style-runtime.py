"""Run the actual clock style method; unchanged ticks must not re-enter native layout."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/SystemUiHook.java').read_text(encoding='utf-8')
start = source.index('        void applyStyle(')
end = source.index('{', start) + 1
depth = 1
while depth:
    depth += (source[end] == '{') - (source[end] == '}')
    end += 1
method = source[start:end]
harness = r'''
import java.util.*;
public class TestClockStyle {
 static class Metrics {float scale=2;}
 static class Resources {Metrics metrics=new Metrics();Metrics getDisplayMetrics(){return metrics;}}
 static class Context {Resources resources=new Resources();Resources getResources(){return resources;}}
 static class TypedValue {static final int COMPLEX_UNIT_SP=2,COMPLEX_UNIT_PX=0;static float applyDimension(int unit,float size,Metrics metrics){return unit==2?size*metrics.scale:size;}}
 static class Typeface {static final int NORMAL=0;String family;int weight;Typeface(String family,int weight){this.family=family;this.weight=weight;}static Typeface create(String f,int s){return new Typeface(f,400);}static Typeface create(Typeface t,int w,boolean italic){return new Typeface(t.family,w);}public boolean equals(Object o){return o instanceof Typeface&&((Typeface)o).family.equals(family)&&((Typeface)o).weight==weight;}public int hashCode(){return family.hashCode()+weight;}}
 static class Gravity {static final int START=1,END=2,CENTER_HORIZONTAL=4,CENTER_VERTICAL=8;}
 static class ViewGroup {static class LayoutParams {int width=-2;}}
 static class Paint {float getFontSpacing(){return 20;}}
 static class TextView {
  Context context=new Context();Typeface face=new Typeface("OEM",400);float size=20,letters,extra,mult=1;int gravity,min=1,max=1,writes;
  boolean padding=true,single=true,scroll=true;Object ellipsis=new Object();ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();
  Context getContext(){return context;}Typeface getTypeface(){return face;}void setTypeface(Typeface f){face=f;writes++;}
  float getTextSize(){return size;}void setTextSize(int unit,float v){size=TypedValue.applyDimension(unit,v,context.resources.metrics);writes++;}
  float getLetterSpacing(){return letters;}void setLetterSpacing(float v){letters=v;writes++;}
  float getLineSpacingExtra(){return extra;}float getLineSpacingMultiplier(){return mult;}void setLineSpacing(float e,float m){extra=e;mult=m;writes++;}
  Paint getPaint(){return new Paint();}int getGravity(){return gravity;}void setGravity(int g){gravity=g;writes++;}
  boolean getIncludeFontPadding(){return padding;}void setIncludeFontPadding(boolean v){padding=v;writes++;}
  boolean isSingleLine(){return single;}void setSingleLine(boolean v){single=v;max=v?1:Integer.MAX_VALUE;scroll=v;writes++;}
  boolean isHorizontallyScrollable(){return scroll;}void setHorizontallyScrolling(boolean v){scroll=v;writes++;}
  Object getEllipsize(){return ellipsis;}void setEllipsize(Object v){ellipsis=v;writes++;}
  int getMinLines(){return min;}int getMaxLines(){return max;}void setMinLines(int v){min=v;writes++;}void setMaxLines(int v){max=v;writes++;}
  ViewGroup.LayoutParams getLayoutParams(){return params;}void setLayoutParams(ViewGroup.LayoutParams v){params=v;writes++;}
 }
 static class FeatureSettings {
  static final String STATUSBAR_CLOCK_FONT_FAMILY="family",STATUSBAR_CLOCK_WEIGHT="weight",STATUSBAR_CLOCK_SIZE_SP="size",STATUSBAR_CLOCK_LETTER_SPACING="letters",STATUSBAR_CLOCK_LINE_SPACING_DP="spacing",STATUSBAR_CLOCK_TEXT_ALIGN="align",STATUSBAR_CLOCK_WIDTH_DP="width";
  static Map<String,Object> values=new HashMap<>();static String text(Context c,String k,String d){return (String)values.getOrDefault(k,d);}static int integer(Context c,String k,int d,int min,int max){return ((Number)values.getOrDefault(k,d)).intValue();}static float decimal(Context c,String k,float d,float min,float max){return ((Number)values.getOrDefault(k,d)).floatValue();}static boolean enabled(Context c,String k){return Boolean.TRUE.equals(values.get(k));}
 }
 static class StatusBarAssetsHook {static Typeface typeface(TextView t,String role,Typeface requested,Typeface original){return requested;}}
 static int dp(Context c,int value){return value*2;}static float dp(Context c,float value){return value*2;}
 static class ClockState {
  final TextView clock;final Typeface originalTypeface;final float originalTextSize;final int originalWidth;
  ClockState(TextView clock){this.clock=clock;originalTypeface=clock.face;originalTextSize=clock.size;originalWidth=clock.params.width;}
  // METHOD
 }
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static void unchanged(ClockState state,TextView view,boolean two){int writes=view.writes;for(int i=0;i<120;i++)state.applyStyle(view,two);check(view.writes==writes,"unchanged clock ticks must not rewrite layout or text styles");}
 public static void main(String[] args){
  TextView clock=new TextView();ClockState state=new ClockState(clock);state.applyStyle(clock,false);
  check(!clock.single&&!clock.scroll&&clock.ellipsis==null&&clock.max==1,"native marquee/ellipsis removed once");unchanged(state,clock,false);
  FeatureSettings.values.put("size",12f);state.applyStyle(clock,false);check(clock.size==24,"SP respects current metrics");unchanged(state,clock,false);
  clock.context.resources.metrics.scale=3;state.applyStyle(clock,false);check(clock.size==36,"font scale change reapplied");unchanged(state,clock,false);
  FeatureSettings.values.put("master",true);FeatureSettings.values.put("gap",3);state.applyStyle(clock,true);
  check(clock.min==2&&clock.max==2&&clock.extra==6,"two-line gap agrees with row configuration");unchanged(state,clock,true);
  state.applyStyle(clock,false);check(clock.min==1&&clock.max==1&&clock.extra==0,"return to single line clears extra gap");unchanged(state,clock,false);
  FeatureSettings.values.put("width",80);state.applyStyle(clock,false);check(clock.params.width==160,"configured width applied");unchanged(state,clock,false);
  clock.params.width=-2;state.applyStyle(clock,false);check(clock.params.width==160,"OEM width reset corrected");
  clock.single=true;clock.scroll=true;clock.ellipsis=new Object();state.applyStyle(clock,false);check(!clock.single&&!clock.scroll&&clock.ellipsis==null&&clock.max==1,"OEM presentation reset corrected");unchanged(state,clock,false);
  TextView preview=new TextView();preview.params=null;state.applyStyle(preview,true);check(preview.max==2,"detached preview has independent style state");unchanged(state,preview,true);
  System.out.println("PASS clock style stability: "+checks+" assertions, 960 unchanged ticks");
 }
}
'''.replace('// METHOD', method)
java = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='duo-clock-style-') as folder:
    work = Path(folder)
    source_file = work / 'TestClockStyle.java'
    source_file.write_text(harness, encoding='utf-8')
    config = work / 'ls/augment/com/ConfigSchema.java'
    config.parent.mkdir(parents=True)
    config.write_text('package ls.augment.com;public class ConfigSchema{public static final String SYSTEMUI_MASTER="master",STATUSBAR_POSITION_SIZE_ONLY="position",STATUSBAR_DUAL_ROW_GAP_DP="gap";}', encoding='utf-8')
    subprocess.run([str(java / 'javac'), '-encoding', 'UTF-8', '-d', folder, str(source_file), str(config)], check=True)
    subprocess.run([str(java / 'java'), '-cp', folder, 'TestClockStyle'], check=True)
