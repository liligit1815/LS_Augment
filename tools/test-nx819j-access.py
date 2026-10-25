"""Production contract regressions for AOD, immutable icons, model refresh and tile namespaces."""
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SOURCES={
'android/content/Context.java':'package android.content;public class Context{}',
'android/graphics/Bitmap.java':'package android.graphics;public class Bitmap{}',
'android/view/ViewGroup.java':'package android.view;public class ViewGroup{}',
'androidx/recyclerview/widget/RecyclerView.java':'package androidx.recyclerview.widget;public class RecyclerView{}',
'com/zte/mifavor/keyguard/clock/AnimatableClockView.java':'''package com.zte.mifavor.keyguard.clock;
public class AnimatableClockView {public CharSequence format="HH:mm";public java.util.Calendar calendar=java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Asia/Shanghai"));public int ticks;public void refreshTime(){ticks++;}}''',
'com/android/launcher3/BadgeProvider.java':'package com.android.launcher3;public class BadgeProvider{}',
'com/android/launcher3/icons/IconShape.java':'package com.android.launcher3.icons;public class IconShape{}',
'com/android/launcher3/icons/ThemedBitmap.java':'package com.android.launcher3.icons;public class ThemedBitmap{}',
'com/android/launcher3/icons/FastBitmapDrawableDelegate.java':'package com.android.launcher3.icons;public class FastBitmapDrawableDelegate{public static class DelegateFactory{}}',
'com/android/launcher3/icons/BitmapInfo.java':'''package com.android.launcher3.icons;
import android.graphics.Bitmap;import com.android.launcher3.BadgeProvider;
public class BitmapInfo {
 public final Bitmap icon;public final int color,flags;public final IconShape defaultIconShape;public final ThemedBitmap themedBitmap;
 public final BitmapInfo badgeInfo;public final FastBitmapDrawableDelegate.DelegateFactory delegateFactory;public final BadgeProvider badgeProvider;
 public BitmapInfo(Bitmap i,int c,int f,IconShape s,ThemedBitmap t,BitmapInfo b,FastBitmapDrawableDelegate.DelegateFactory d,BadgeProvider p){icon=i;color=c;flags=f;defaultIconShape=s;themedBitmap=t;badgeInfo=b;delegateFactory=d;badgeProvider=p;}
 public static BitmapInfo fromBitmap(Bitmap b){return new BitmapInfo(b,0,0,new IconShape(),null,null,new FastBitmapDrawableDelegate.DelegateFactory(),null);}
}''',
'com/android/launcher3/LauncherAppState.java':'''package com.android.launcher3;
public class LauncherAppState {public static final LauncherAppState INSTANCE=new LauncherAppState();public static LauncherAppState getInstance(android.content.Context c){return INSTANCE;}public Model getModel(){return model;}public final Model model=new Model();
 public static class Model {public int calls;public String reason;public java.util.concurrent.CompletionStage<Void> forceReload(String r){calls++;reason=r;return java.util.concurrent.CompletableFuture.completedFuture(null);}}}''',
'ls/augment/com/hook/Nx819jAccessTest.java':'''package ls.augment.com.hook;
import android.graphics.Bitmap;import com.android.launcher3.icons.*;import com.android.launcher3.*;
public class Nx819jAccessTest {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class Clock {private CharSequence mFormat="HH:mm",f12="h:mm",f24="HH:mm";public CharSequence getFormat12Hour(){return f12;}public CharSequence getFormat24Hour(){return f24;}public void setFormat12Hour(CharSequence s){f12=s;}public void setFormat24Hour(CharSequence s){f24=s;mFormat=s;}public String getTimeZone(){return "America/Los_Angeles";}}
 static class ClockChild extends Clock{}
 static class Wrong {public String mFormat="HH:mm";}
 static class Animated extends com.zte.mifavor.keyguard.clock.AnimatableClockView{}
 static class Model {public BitmapInfo bitmap;}
 static class ChildModel extends Model{}
 static class Ambiguous extends Model {public BitmapInfo another;}
 static class FinalModel {public final BitmapInfo bitmap=null;}
 static ClassLoader filtered(String blocked){return new ClassLoader(Nx819jAccessTest.class.getClassLoader()){
  @Override public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.startsWith(blocked))throw new ClassNotFoundException(n);return super.loadClass(n);}};}
 public static void main(String[] args)throws Exception {
  Clock c=new ClockChild();AodClockAccess a=AodClockAccess.resolve(c.getClass());check(a!=null,"inherited native TextClock contract");
  CharSequence old=a.format(c,true);a.format(c,true,"HH:mm:ss");check(a.active(c).equals("HH:mm:ss")&&a.format(c,false).equals("h:mm"),"independent 12/24 formats");a.format(c,true,old);check(a.active(c).equals("HH:mm"),"native format restored");
  check(a.zone(c).equals("America/Los_Angeles"),"per-clock time zone retained");check(AodClockAccess.resolve(Wrong.class)==null,"unknown text cannot become AOD clock");
  Animated clock=new Animated();a=AodClockAccess.resolve(clock.getClass());check(a!=null&&a.adapter.equals("zte_animatable_clock"),"animated subclass resolves complete native contract");
  a.format(clock,true,"HH:mm:ss");check(clock.format.equals("HH:mm:ss")&&clock.ticks==1,"uses native refresh after format change");a.format(clock,true,"HH:mm");check(clock.ticks==2&&clock.format.equals("HH:mm"),"animated restore refreshes native time");check(a.zone(clock).equals("Asia/Shanghai"),"animated calendar zone retained");
  Bitmap nativeImage=new Bitmap(),custom=new Bitmap();BitmapInfo badge=BitmapInfo.fromBitmap(new Bitmap());BadgeProvider provider=new BadgeProvider();
  BitmapInfo original=new BitmapInfo(nativeImage,99,7,new IconShape(),new ThemedBitmap(),badge,new FastBitmapDrawableDelegate.DelegateFactory(),provider);
  LauncherIconBinding b=LauncherIconBinding.resolve(ChildModel.class);BitmapInfo result=(BitmapInfo)b.create(custom,original);
  check(result.icon==custom&&original.icon==nativeImage&&result!=original,"immutable icon copy leaves original pixels intact");
  check(result.flags==7&&result.badgeInfo==badge&&result.badgeProvider==provider,"work profile badge and flags preserved");
  check(result.themedBitmap==null&&result.delegateFactory!=original.delegateFactory,"native factory draws replacement without original themed pixels");
  check(((BitmapInfo)b.create(custom,null)).icon==custom,"no original metadata supported");
  for(Class<?> bad:new Class<?>[]{Ambiguous.class,FinalModel.class}){boolean rejected=false;try{LauncherIconBinding.resolve(bad);}catch(ReflectiveOperationException expected){rejected=true;}check(rejected,"ambiguous/final model rejected");}
  LauncherModelRefresh.resolve(Nx819jAccessTest.class.getClassLoader()).refresh(new android.content.Context());
  check(LauncherAppState.INSTANCE.model.calls==1&&!LauncherAppState.INSTANCE.model.reason.isEmpty(),"new reload uses required reason and CompletionStage signature");
  check(SystemUiCompatibility.customizePackage(Nx819jAccessTest.class.getClassLoader()).equals("com.zte.mifavor.qs.customize."),"new complete tile namespace");
  check(SystemUiCompatibility.customizePackage(filtered("com.zte.mifavor.qs.customize.")).equals("com.android.systemui.qs.customize."),"old namespace retained");
  boolean rejected=false;try{SystemUiCompatibility.customizePackage(filtered("com."));}catch(ClassNotFoundException expected){rejected=true;}check(rejected,"missing editor remains unsupported");
  System.out.println("PASS NX819J access contracts: "+checks+" assertions");
 }
}'''
}
for prefix in ['com.zte.mifavor.qs.customize','com.android.systemui.qs.customize']:
    for name,body in {
        'CustomizeTileView':'public class CustomizeTileView{}',
        'QSCustomizer':'public class QSCustomizer{public androidx.recyclerview.widget.RecyclerView getRecyclerView(){return null;}}',
        'TileAdapter':'public class TileAdapter{public static class Holder{}public Holder onCreateViewHolder(android.view.ViewGroup v,int t){return null;}public int getNumColumns(){return 4;}public boolean updateNumColumns(){return true;}}',
    }.items():SOURCES[prefix.replace('.','/')+'/'+name+'.java']='package '+prefix+';'+body
with tempfile.TemporaryDirectory(prefix='nx819j-access-') as temp:
    out=Path(temp)
    for name,content in SOURCES.items():
        path=out/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8')
    hooks=ROOT/'android/app/src/main/java/ls/augment/com/hook'
    production=[hooks/name for name in ['AodClockAccess.java','LauncherIconBinding.java','LauncherImmutableIcon.java','LauncherModelRefresh.java','SystemUiCompatibility.java']]
    subprocess.run(['javac','-encoding','UTF-8','-d',str(out),*map(str,out.rglob('*.java')),*map(str,production)],check=True)
    subprocess.run(['java','-cp',str(out),'ls.augment.com.hook.Nx819jAccessTest'],check=True)
