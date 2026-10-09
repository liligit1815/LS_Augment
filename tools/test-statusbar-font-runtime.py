"""Test actual font resolution, late font arrival, painter invalidation and restoration."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')


def extract(marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


harness = r'''import java.util.*;
public class TestStatusFonts {
 static class Typeface {static final int NORMAL=0;static final Typeface DEFAULT=new Typeface("native",400,false),DEFAULT_BOLD=new Typeface("native",700,false);String family;int weight;boolean italic;Typeface(String n,int w,boolean i){family=n;weight=w;italic=i;}int getWeight(){return weight;}boolean isItalic(){return italic;}static Typeface create(Typeface t,int w,boolean i){return new Typeface(t.family,w,i);}static Typeface create(String n,int ignored){return new Typeface(n,500,false);}public boolean equals(Object o){return o instanceof Typeface t&&t.family.equals(family)&&t.weight==weight&&t.italic==italic;}public int hashCode(){return Objects.hash(family,weight,italic);}}
 static class View {boolean inBar=true;int invalidations,layouts;Object tag;Object getContext(){return this;}Object getTag(){return tag;}void invalidate(){invalidations++;}void requestLayout(){layouts++;}}
 static class TextView extends View {Typeface current=Typeface.DEFAULT;Typeface getTypeface(){return current;}void setTypeface(Typeface t){current=t;}}
 static class StatusBarGridHook {static int scopeCalls;static boolean inBar(View view){scopeCalls++;return view.inBar;}}
 static boolean inAssetSurface(View view){return StatusBarGridHook.inBar(view);}static String surfaceFor(View view){return "main";}
 static class ConfigSchema {static final String STATUSBAR_CLOCK_CUSTOM="custom",STATUSBAR_CLOCK_WEIGHT="weight";}
 static class SystemUiHook {static final String GRID_CLOCK_TAG="grid-clock";}
 static class FeatureSettings {static boolean custom=true;static int weight=800;static boolean enabled(Object c,String k){return custom;}static int integer(Object c,String k,int d,int min,int max){return weight;}}
 static class FontSpec {String selected="font:"+"a".repeat(64);String resolve(String role,String surface){return selected;}}
 static class ManagedFont {static Typeface loaded;static Runnable pending;static Typeface loadAsync(Object c,String v,Runnable r){pending=r;return loaded;}}
 static final FontSpec fonts=new FontSpec();static boolean enabled=true,typographyActive=true;static int refreshes;
 static final Map<TextView,FontState> FONTS=new WeakHashMap<>();static final Map<TextView,Typeface> CLOCK_BASELINES=new WeakHashMap<>();static final Set<View> PAINT_FONTS=Collections.newSetFromMap(new WeakHashMap<>());
 static void refreshAll(){refreshes++;}
 static String fontRole(View view){return "clock";}
 // MEMBERS
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static void main(String[] args){
  View battery=new View();check(typeface(battery,"battery",null,null)==null,"late font keeps original painter fallback");check(PAINT_FONTS.contains(battery),"painter is registered even before font ready");
  ManagedFont.loaded=new Typeface("imported",300,true);ManagedFont.pending.run();check(battery.invalidations==1&&refreshes==0,"font arrival invalidates non-TextView consumers without a tree refresh or radio event");
  Typeface b=typeface(battery,"battery",null,null);check(b.family.equals("imported")&&b.weight==700&&!b.italic,"battery painter retains its native bold style");
  TextView clock=new TextView();Typeface rendered=typeface(clock,"clock",new Typeface("legacy",800,false),Typeface.DEFAULT);applyFont(clock,"clock");
  check(rendered.weight==800&&clock.current.weight==800,"clock tick and inventory scan agree on configured clock weight");check(clock.current.family.equals("imported"),"real TextView receives imported family");
  int layouts=clock.layouts;applyFont(clock,"clock");check(clock.layouts==layouts,"unchanged typography does not request layout each scan");
  fonts.selected="original";applyFont(clock,"clock");check(clock.current.equals(Typeface.DEFAULT),"original role restores the native baseline rather than the imported family");
  fonts.selected="font:"+"a".repeat(64);applyFont(clock,"clock");enabled=false;applyFont(clock,"clock");check(clock.current.equals(Typeface.DEFAULT)&&FONTS.isEmpty(),"disabling releases typeface ownership and restores native font");
  View shade=new View();shade.inBar=false;enabled=true;check(typeface(shade,"battery",null,null)==null&&!PAINT_FONTS.contains(shade),"shade paint consumers never enter statusbar font registry");
  TextView legacyFirst=new TextView();Typeface clockStateOriginal=nativeTypeface(legacyFirst,legacyFirst.current);legacyFirst.current=new Typeface("serif",700,false);fonts.selected="font:"+"a".repeat(64);applyFont(legacyFirst,"clock");fonts.selected="original";Typeface tick=typeface(legacyFirst,"clock",legacyFirst.current,clockStateOriginal);applyFont(legacyFirst,"clock");check(tick.equals(Typeface.DEFAULT)&&legacyFirst.current.equals(tick),"legacy custom clock before import shares OEM baseline with original-font scan");
  TextView importedFirst=new TextView();fonts.selected="font:"+"a".repeat(64);applyFont(importedFirst,"clock");Typeface lateClockOriginal=nativeTypeface(importedFirst,importedFirst.current);check(lateClockOriginal.equals(Typeface.DEFAULT),"enabling custom clock after import does not capture imported family as original");
  fonts.selected="original";Typeface restored=typeface(importedFirst,"clock",importedFirst.current,lateClockOriginal);applyFont(importedFirst,"clock");check(restored.equals(importedFirst.current)&&restored.equals(Typeface.DEFAULT),"both enable orders restore identical OEM typography");
  fonts.selected="font:"+"a".repeat(64);ManagedFont.loaded=null;TextView waiting=new TextView();applyFont(waiting,"clock");check(waiting.current.equals(Typeface.DEFAULT),"pending font keeps native family");ManagedFont.loaded=new Typeface("arrived",400,false);ManagedFont.pending.run();check(waiting.current.family.equals("arrived")&&refreshes==0,"production font callback applies asynchronously loaded text without root scanning");
  typographyActive=false;int scopes=StatusBarGridHook.scopeCalls;TextView empty=new TextView();for(int i=0;i<72000;i++){typeface(empty,"clock",Typeface.DEFAULT,Typeface.DEFAULT);applyFont(empty,"clock");ownsFont(empty);}check(StatusBarGridHook.scopeCalls==scopes,"empty typography performs zero hierarchy lookups across 216,000 production font calls");
  check(weighted(Typeface.DEFAULT,new Typeface("vendor-zero",0,false)).weight==1,"vendor zero weight is bounded for Typeface.create");
  System.out.println("Status-bar fonts: "+checks+" assertions passed");
 }
}'''
members = '\n'.join(extract(marker) for marker in [
    'static Typeface typeface(View view, String role, Typeface fallback, Typeface original)',
    'static void applyFont(', 'private static void restoreFont(', 'private static final class FontState',
    'private static Typeface weighted(', 'private static Typeface weightBase(', 'private static void invalidatePaintFonts(',
    'static Typeface nativeTypeface(',
    'static boolean ownsFont(',
]) + '\n' + extract('private static final Runnable FONT_READY =') + ';'
with tempfile.TemporaryDirectory(prefix='statusbar-fonts-') as tmp:
    path = Path(tmp) / 'TestStatusFonts.java'
    path.write_text(harness.replace('// MEMBERS', members), encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, str(path)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestStatusFonts'], check=True)
