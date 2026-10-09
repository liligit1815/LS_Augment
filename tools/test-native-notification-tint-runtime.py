"""Execute production native-notification lifecycle and complete shared palette hook.

Android/ROM facades model the inspected ROM signatures. No APK/device operations.
The old MFV hook body is executed as a negative control against the stale-white case.
This proves state/routing contracts, not on-device pixels or actual ROM invocation.
"""
from pathlib import Path
import hashlib, json, os, re, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/native-notification-tint-fix-20481'; OUT.mkdir(exist_ok=True)
PROD=ROOT/'android/app/src/main/java/ls/augment/com'
scope={'__file__':str(ROOT/'tools/test-notification-summary-runtime.py')}
exec(compile(Path(scope['__file__']).read_text('utf-8').split('with tempfile.TemporaryDirectory(',1)[0],scope['__file__'],'exec'),scope)
files={k:v for k,v in scope['FILES'].items() if not k.endswith('TestNotificationSummaryRuntime.java')}

def method(source, marker):
    start=source.index(marker); end=source.index('{',start)+1; depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]

source=(PROD/'hook/RedMagicAdvancedUiHook.java').read_text('utf-8')
block=source.split('// BEGIN native notification tint lifecycle:',1)[1].split('\n',1)[1].split('// END native notification tint lifecycle.',1)[0]
on=method(source,'private static boolean on(')
files['ls/augment/com/hook/RedMagicAdvancedUiHook.java']='''package ls.augment.com.hook;
import android.content.Context;import android.os.Looper;import android.view.*;import android.widget.*;import android.graphics.drawable.Drawable;
import java.util.*;import java.lang.ref.WeakReference;import java.lang.reflect.Method;import static ls.augment.com.hook.SystemUiAdapter.*;
final class RedMagicAdvancedUiHook {private static final String P="ls_augment_rm_";
'''+block+on+'\n}'
files['android/os/Looper.java']='package android.os;public class Looper {static final Looper MAIN=new Looper();public static Looper myLooper(){return MAIN;}public static Looper getMainLooper(){return MAIN;}}'
files['android/widget/ImageView.java']='''package android.widget;import android.graphics.drawable.Drawable;public class ImageView extends android.view.View {
 public Drawable drawable,background;public Drawable getDrawable(){return drawable;}public void setImageDrawable(Drawable d){drawable=d;}
 public Drawable getBackground(){return background;}public void setBackground(Drawable d){background=d;}
}'''
files['android/view/View.java']=files['android/view/View.java'].replace('public int visibility=0','public int x=0;public int visibility=0')
files['android/view/View.java']=files['android/view/View.java'].replace('public ViewParent getParent()', 'public void setBackground(android.graphics.drawable.Drawable d){}public android.graphics.drawable.Drawable getBackground(){return null;}public ViewParent getParent()')
files['android/view/View.java']=files['android/view/View.java'].replace('public ViewParent getParent()', 'public final java.util.Map<Integer,Object> tags=new java.util.HashMap<>();public void setTag(int id,Object v){tags.put(id,v);}public Object getTag(int id){return tags.get(id);}public ViewParent getParent()')
files['android/content/res/Resources.java']=files['android/content/res/Resources.java'].replace('public static class Metrics', 'public static boolean missingTag;public int getIdentifier(String n,String t,String p){return !missingTag&&n.equals("icon_is_grayscale")&&t.equals("id")&&p.equals("com.android.systemui")?501:0;}public static class Metrics')
files['android/graphics/drawable/Drawable.java']=files['android/graphics/drawable/Drawable.java'].replace('public class Drawable {','public class Drawable {public boolean gray=true;public String glyph="unset";')
files['com/android/internal/util/ContrastColorUtil.java']='''package com.android.internal.util;import android.graphics.drawable.Drawable;public class ContrastColorUtil {
 public static int reads;private static final ContrastColorUtil INSTANCE=new ContrastColorUtil();public static ContrastColorUtil getInstance(android.content.Context c){return INSTANCE;}
 public boolean isGrayscaleIcon(Drawable d){reads++;return d!=null&&d.gray;}
}'''
files['com/android/systemui/statusbar/notification/NotificationUtils.java']='''package com.android.systemui.statusbar.notification;
public class NotificationUtils {public static boolean isGrayscale(android.widget.ImageView view,com.android.internal.util.ContrastColorUtil nativeInstance){
 Object cached=view.getTag(501);if(cached!=null)return Boolean.TRUE.equals(cached);boolean gray=nativeInstance.isGrayscaleIcon(view.getDrawable());view.setTag(501,gray);return gray;
}}'''
files['com/android/systemui/statusbar/StatusBarIconView.java']='''package com.android.systemui.statusbar;import android.graphics.drawable.Drawable;public class StatusBarIconView extends android.widget.ImageView {
 public boolean mUseAppIcon,visible=true,blocked,forbidden,hasColoredBackdrop=true;public int state,mDrawableColor=-1,mCurrentSetColor=-1,mIconColor=-1,mDecorColor=-1,updates,colorWrites,nativeCalls;
 public Object notification=new Object(),mBundleEntry;public Drawable small=new Drawable(),app=new Drawable(),nativeBackground=new Drawable();
 public StatusBarIconView(){small.glyph="ring";app.gray=false;app.glyph="app";drawable=small;background=nativeBackground;}
 public void setUseAppIcon(boolean b){mUseAppIcon=b;}public void updateDrawable(){updates++;drawable=mUseAppIcon?app:small;}
 public void setStaticDrawableColor(int c){mDrawableColor=c;mCurrentSetColor=c;mIconColor=c;colorWrites++;}
 public boolean isIconVisible(){return visible;}public boolean isIconBlocked(){return blocked;}public int getVisibleState(){return state;}
 public Object getNotification(){return notification;}public int getStaticDrawableColor(){return mDrawableColor;}
}'''
files['ls/augment/com/hook/NativeTintTestBridge.java']='''package ls.augment.com.hook;public class NativeTintTestBridge {
 public static boolean enabled(Object o){try{java.lang.reflect.Method m=RedMagicAdvancedUiHook.class.getDeclaredMethod("on",Object.class,String.class);m.setAccessible(true);return (Boolean)m.invoke(null,o,"notification_native");}catch(Exception e){throw new RuntimeException(e);}}
}'''
files['com/zte/feature/notification/MfvNotificationExtKt.java']='''package com.zte.feature.notification;import com.android.systemui.statusbar.StatusBarIconView;
public class MfvNotificationExtKt {
 public static StatusBarIconView mfvUpdateBackground(StatusBarIconView v){v.nativeCalls++;if(v.hasColoredBackdrop){v.setBackground(v.nativeBackground);}else{v.setBackground(null);v.setUseAppIcon(true);v.setImageDrawable(v.app);}return v;}
 public static boolean mfvDecideStatusBarNotifIconBeColorized(boolean gray,StatusBarIconView v){return !v.forbidden&&(!v.mUseAppIcon||ls.augment.com.hook.NativeTintTestBridge.enabled(v))&&gray;}
 public static int mfvDecideStatusBarNotifIconColor(int color){return ls.augment.com.hook.NativeTintTestBridge.enabled(null)?color:-1;}
}'''
files['ls/augment/com/hook/RedMagicLegacyUiHook.java']='package ls.augment.com.hook;public class RedMagicLegacyUiHook {public static boolean positionOnly;public static boolean positionSizeOnly(Object c){return positionOnly;}}'
files['ls/augment/com/hook/FeatureSettings.java']=files['ls/augment/com/hook/FeatureSettings.java'].replace('public static ConfigSnapshot current=', 'public static boolean enabled(Object c,String k){return "1".equals(current.get(k));}public static int errors;public static void diagnosticError(Object c,String k,String stage,Throwable e){errors++;}public static ConfigSnapshot current=')
adapter=files['ls/augment/com/hook/SystemUiAdapter.java']
oldcall='public static Object call(Object o,String name,Object...args)throws ReflectiveOperationException {Method m=o.getClass().getMethod(name);return m.invoke(o,args);}'
newcall='''public static Object call(Object o,String name,Object...args)throws ReflectiveOperationException {
 for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())for(Method m:t.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(o,args);}throw new NoSuchMethodException(name);}
 public static android.content.Context context(Object o){return o instanceof android.view.View?((android.view.View)o).getContext():new android.content.Context();}'''
assert oldcall in adapter; files['ls/augment/com/hook/SystemUiAdapter.java']=adapter.replace(oldcall,newcall)
files['com/android/systemui/plugins/DarkIconDispatcher.java']='''package com.android.systemui.plugins;public class DarkIconDispatcher {
 public static android.view.View lastTarget;public static boolean fail;public static int getTint(java.util.Collection<android.graphics.Rect> areas,android.view.View view,int tint){
  if(fail)throw new IllegalStateException("unavailable");lastTarget=view;if(areas.isEmpty())return tint;int left=view.x;
  for(android.view.View p=view.getParent() instanceof android.view.View?(android.view.View)view.getParent():null;p!=null;p=p.getParent() instanceof android.view.View?(android.view.View)p.getParent():null)left+=p.x;
  for(android.graphics.Rect r:areas)if(r.isEmpty()||r.top<=0&&Math.max(0,Math.min(r.right,left+view.width)-Math.max(r.left,left))*2>view.width)return tint;return -1;
 }}'''
# Execute the exact old before-hook lambda body (only the Android context gate is local).
oldsource=(OUT/'baseline/RedMagicAdvancedUiHook.java').read_text('utf-8')
oldbody=oldsource.split('"mfvUpdateBackground",1,',1)[1].split('(o,a,r)->{',1)[1].split('},null);',1)[0]
files['ls/augment/com/hook/OldNativeNotificationHook.java']='''package ls.augment.com.hook;import android.view.View;import static ls.augment.com.hook.SystemUiAdapter.*;
public class OldNativeNotificationHook {static boolean on(Object o,String name){return NativeTintTestBridge.enabled(o);}static Object apply(Object[] a)throws Exception {
'''+oldbody+'\n}}'
files['ls/augment/com/hook/TestNativeNotificationTint.java']=r'''package ls.augment.com.hook;
import java.util.*;import java.lang.reflect.*;import android.view.*;import android.graphics.*;import android.graphics.drawable.*;
import com.android.systemui.statusbar.*;import com.android.systemui.statusbar.phone.*;import com.android.systemui.statusbar.policy.Clock;
public class TestNativeNotificationTint {
 static int checks;static void check(boolean x,String reason){checks++;if(!x)throw new AssertionError(reason);}
 static AugmentModule module=new AugmentModule();static AugmentModule.Hook dark;
 static final String KEY="ls_augment_rm_notification_native";static void on(boolean value){FeatureSettings.current.values.put(KEY,value?"1":"0");}
 static void bind(StatusBarIconView v)throws Exception {Method m=RedMagicAdvancedUiHook.class.getDeclaredMethod("rememberNotificationContrast",Object[].class);m.setAccessible(true);m.invoke(null,(Object)new Object[]{v,null,com.android.internal.util.ContrastColorUtil.getInstance(v.getContext()),null});}
 static void loseDependency(StatusBarIconView v)throws Exception {Field f=RedMagicAdvancedUiHook.class.getDeclaredField("NATIVE_NOTIFICATION_CONTRAST");f.setAccessible(true);((Map<?,?>)f.get(null)).remove(v);}
 static void apply(StatusBarIconView v){RedMagicAdvancedUiHook.applyNativeNotificationIcon(v);}
 static void palette(Clock c,int tint,Rect...rects)throws Throwable {ArrayList<Rect> a=new ArrayList<>(List.of(rects));dark.invoke.call(new AugmentModule.Chain(c,List.of(a,1f,tint),()->{c.onDarkChanged(a,1f,tint);return null;}));}
 static int owned()throws Exception {Field f=RedMagicAdvancedUiHook.class.getDeclaredField("NATIVE_NOTIFICATION_ICONS");f.setAccessible(true);return ((Map<?,?>)f.get(null)).size();}
 static void clearPalette()throws Exception {Field f=StatusBarNotificationSummaryHook.class.getDeclaredField("PALETTES");f.setAccessible(true);((Map<?,?>)f.get(null)).clear();}
 public static void main(String[] args)throws Throwable {
  StatusBarNotificationSummaryHook.install(module,TestNativeNotificationTint.class.getClassLoader());dark=module.hooks.stream().filter(h->h.method.getName().equals("onDarkChanged")).findFirst().orElseThrow();
  PhoneStatusBarView phone=new PhoneStatusBarView();NotificationIconContainer row=new NotificationIconContainer();Clock clock=new Clock();phone.add(row);phone.add(clock);
  StatusBarIconView old=new StatusBarIconView();row.add(old);palette(clock,0xff5d5d5d);on(true);OldNativeNotificationHook.apply(new Object[]{old});
  check(old.getBackground()==null&&old.mCurrentSetColor==-1,"negative control executes old hook: background gone but pre-existing white remains");
  System.out.println("NEGATIVE old production hook reproduces stale-white-on-light-background");row.remove(old);
  StatusBarIconView icon=new StatusBarIconView();bind(icon);row.add(icon);on(false);apply(icon);check(icon.updates==0&&icon.getBackground()!=null,"off leaves original node intact");
  icon.setTag(501,false);
  on(true);apply(icon);check(icon.mDrawableColor==0xff5d5d5d&&icon.getBackground()==null&&icon.updates==1,"hot enable fixes existing small glyph without notification repost");
  check(Boolean.TRUE.equals(icon.getTag(501)),"stale app-image grayscale cache is replaced by native wrapper result");
  check(com.android.systemui.plugins.DarkIconDispatcher.lastTarget==icon,"native palette resolved at actual icon, not clock");
  int updates=icon.updates,colors=icon.colorWrites,grayReads=com.android.internal.util.ContrastColorUtil.reads,listeners=FeatureSettings.listeners.size(),scheduled=icon.scheduled.size();
  for(int i=0;i<100;i++)apply(icon);check(icon.updates==updates&&icon.colorWrites==colors&&com.android.internal.util.ContrastColorUtil.reads==grayReads,"unchanged predraw is a fast path");
  check(FeatureSettings.listeners.size()==listeners&&icon.scheduled.size()==scheduled&&icon.attach.isEmpty(),"no per-icon callbacks accumulate");
  palette(clock,0xffefefef);apply(icon);check(icon.mDrawableColor==0xffefefef&&icon.updates==updates,"existing glyph follows dark surface without reload");
  row.x=100;icon.width=24;palette(clock,0xff333333,new Rect(0,0,50,80));apply(icon);check(icon.mDrawableColor==-1,"split tint resolves outside area at icon location");
  row.x=0;apply(icon);check(icon.mDrawableColor==0xff333333,"moved parent recomputes native tint without new palette event");
  Drawable cross=new Drawable();cross.glyph="cross";icon.small=cross;icon.updateDrawable();icon.setTag(501,false);int nativeUpdates=icon.updates;apply(icon);
  check(icon.getDrawable()==cross&&icon.mDrawableColor==0xff333333&&icon.updates==nativeUpdates,"dynamic glyph update preserved, never replaced with old ring");
  check(Boolean.TRUE.equals(icon.getTag(501)),"dynamic replacement also invalidates stale grayscale cache");
  on(false);apply(icon);check(icon.getBackground()==icon.nativeBackground&&icon.mDrawableColor==-1&&owned()==0,"hot disable restores native backdrop and white glyph, no gray residue");
  int nativeCalls=icon.nativeCalls;apply(icon);check(icon.nativeCalls==nativeCalls,"restored off node no repeated native refresh");
  StatusBarIconView colored=new StatusBarIconView();bind(colored);colored.hasColoredBackdrop=false;colored.mUseAppIcon=true;colored.setImageDrawable(colored.app);colored.small.gray=false;row.add(colored);colored.setTag(501,true);
  on(true);apply(colored);check(colored.getDrawable()==colored.small&&!colored.mUseAppIcon&&colored.mDrawableColor==0,"native colored small icon remains colored");
  check(Boolean.FALSE.equals(colored.getTag(501)),"colored current small icon replaces stale gray cache");
  int beforeGray=com.android.internal.util.ContrastColorUtil.reads;for(int i=0;i<20;i++)apply(colored);check(beforeGray==com.android.internal.util.ContrastColorUtil.reads,"colored artwork fast path also bounded");
  colored.setTag(501,true);on(false);apply(colored);check(colored.getDrawable()==colored.app&&colored.mUseAppIcon&&colored.mDrawableColor==0,"off restores OEM app image without gray tint");
  check(Boolean.FALSE.equals(colored.getTag(501)),"restore path refreshes grayscale for actual returned OEM image");
  on(true);apply(icon);clearPalette();apply(icon);check(icon.getBackground()==icon.nativeBackground&&icon.mDrawableColor==-1&&owned()==0,"lost palette restores complete owned native presentation");
  int before=icon.updates;apply(icon);check(icon.updates==before&&icon.getBackground()!=null,"missing palette never guesses from custom clock text color");
  StatusBarIconView fresh=new StatusBarIconView();bind(fresh);row.add(fresh);apply(fresh);check(fresh.updates==0&&fresh.getBackground()==fresh.nativeBackground&&fresh.mDrawableColor==-1,"fresh no-palette glyph keeps OEM backdrop and is not guessed/recolored");row.remove(fresh);
  NotificationIconContainer shelf=new NotificationIconContainer();StatusBarIconView outside=new StatusBarIconView();shelf.add(outside);apply(outside);check(outside.updates==0&&outside.getBackground()!=null,"shelf/AOD outside phone stays native");
  NotificationIconContainer centered=new NotificationIconContainer();centered.id=2;phone.add(centered);StatusBarIconView center=new StatusBarIconView();centered.add(center);apply(center);check(center.updates==0,"non-notificationIcons container untouched");
  PhoneStatusBarView second=new PhoneStatusBarView();NotificationIconContainer secondRow=new NotificationIconContainer();second.add(secondRow);StatusBarIconView otherPhone=new StatusBarIconView();secondRow.add(otherPhone);apply(otherPhone);check(otherPhone.updates==0,"never borrows another root palette");
  palette(clock,0xff444444);on(true);apply(icon);RedMagicLegacyUiHook.positionOnly=true;apply(icon);check(icon.getBackground()!=null&&icon.mDrawableColor==-1,"position-only pause restores owned native icon");RedMagicLegacyUiHook.positionOnly=false;
  apply(icon);check(icon.mDrawableColor==0xff444444,"leaving position-only reapplies current real palette");
  com.android.systemui.plugins.DarkIconDispatcher.fail=true;apply(icon);check(icon.getBackground()!=null&&icon.mDrawableColor==-1,"native resolver failure restores complete original policy");com.android.systemui.plugins.DarkIconDispatcher.fail=false;
  StatusBarIconView unbound=new StatusBarIconView();row.add(unbound);apply(unbound);check(unbound.updates==0&&unbound.getBackground()!=null,"no observed native dependency means no takeover");
  bind(unbound);android.content.res.Resources.missingTag=true;apply(unbound);check(unbound.updates==0&&unbound.getBackground()!=null,"unknown grayscale tag means no takeover");android.content.res.Resources.missingTag=false;apply(unbound);check(unbound.mDrawableColor==0xff444444,"binding captured before attachment can be used when native dependencies become ready");on(false);apply(unbound);
  on(true);apply(icon);loseDependency(icon);apply(icon);check(icon.getBackground()==icon.nativeBackground&&icon.mDrawableColor==0&&owned()==0,"lost owned dependency returns native background and clears module tint without guessing gray");
  int recoveries=icon.nativeCalls;for(int i=0;i<100;i++)apply(icon);check(icon.nativeCalls==recoveries&&owned()==0,"dependency loss does not cause repeated owned recovery");
  bind(icon);apply(icon);android.content.res.Resources.missingTag=true;apply(icon);check(icon.getBackground()==icon.nativeBackground&&icon.mDrawableColor==0&&owned()==0,"lost owned tag takes the same explicit native handoff");android.content.res.Resources.missingTag=false;
  apply(icon);check(icon.mDrawableColor==0xff444444,"native dependencies returning can resume exact per-surface foreground");on(false);apply(icon);
  check(FeatureSettings.errors==0,"normal transitions have no hidden reflection errors");
  System.out.println("PASS "+checks+" production lifecycle assertions");
 }
}'''

# Verify integration and protected existing behaviors from their actual current source.
summary=(PROD/'hook/StatusBarNotificationSummaryHook.java').read_text('utf-8')
summary_old=(OUT/'baseline/StatusBarNotificationSummaryHook.java').read_text('utf-8')
assert method(summary,'Integer foreground(){')==method(summary_old,'Integer foreground(){')
assert method(source,'private static Object nativeNotificationTemplateIcon(')==method(oldsource,'private static Object nativeNotificationTemplateIcon(')
scan=(PROD/'hook/RedMagicSystemUiHook.java').read_text('utf-8')
assert method(scan,'private static void scan(').count('RedMagicAdvancedUiHook.applyNativeNotificationIcon(view);')==1
assert 'FeatureSettings.addSnapshotListener' not in block and 'postDelayed' not in block
assert '"bindIconColors",4,(o,a,r)->{rememberNotificationContrast(a);return PASS;}' in source
assert 'getDeclaredMethod("getInstance"' not in source and 'getDeclaredMethod("isGrayscaleIcon"' not in source
jdk=Path(os.environ['JAVA_HOME'])/'bin' if os.environ.get('JAVA_HOME') else Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
with tempfile.TemporaryDirectory(prefix='duo-native-notification-tint-') as tmp:
    folder=Path(tmp)
    for name,content in files.items():
        path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,'utf-8')
    sources=['hook/StatusBarNotificationSummaryHook.java','NotificationSummaryOptions.java','StatusBarIconSpacingSpec.java','StatusBarIconCatalog.java','StatusBarSurfaceSpec.java','EnhancementOption.java']
    result=subprocess.run([str(jdk/'javac'),'-J-Duser.language=en','-J-Duser.country=US','-encoding','UTF-8','-d',tmp,*map(str,folder.rglob('*.java')),*(str(PROD/s) for s in sources)],capture_output=True,text=True,errors='replace')
    (OUT/'compile-output.txt').write_text(result.stdout+result.stderr,'utf-8');result.check_returncode()
    result=subprocess.run([str(jdk/'java'),'-cp',tmp,'ls.augment.com.hook.TestNativeNotificationTint'],capture_output=True,text=True,timeout=20)
    (OUT/'runtime-output.txt').write_text(result.stdout+result.stderr,'utf-8')
    print(result.stdout+result.stderr);result.check_returncode()
    (OUT/'checks.json').write_text(json.dumps({'status':'pass','deviceOperations':False,'apkBuild':False,
        'productionBlockExecuted':True,'completeSummaryHookExecuted':True,'oldProductionNegativeControlExecuted':True,
        'negativeControl':'old mfvUpdateBackground hook leaves stale white after removing background',
        'summaryForegroundUnchanged':True,'notificationTemplateHandlerUnchanged':True,'nativeScanIntegration':True,
        'output':result.stdout,'limits':['facade state/routing evidence; actual OEM methods and pixels require device retest',
        'grid transform implementation unchanged; native resolver facade models per-target physical position']},ensure_ascii=False,indent=2),'utf-8')
