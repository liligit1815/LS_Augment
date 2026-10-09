"""Execute the complete production summary hook with small Android/ROM facades.

This validates routing, state and measurement contracts, not device rendering.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
'android/content/Context.java': '''package android.content;public class Context {
 public static final android.content.res.Resources R=new android.content.res.Resources();
 public android.content.res.Resources getResources(){return R;}
 public ContentResolver getContentResolver(){return new ContentResolver();}
 public static class ContentResolver {public java.io.InputStream openInputStream(android.net.Uri uri){return new java.io.ByteArrayInputStream(new byte[]{1,2,3});}}
}''',
'android/content/res/Resources.java': '''package android.content.res;public class Resources {
 public static class Metrics {public float density=1;}public final Metrics metrics=new Metrics();
 public Metrics getDisplayMetrics(){return metrics;}public String getResourceEntryName(int id){return id==1?"notificationIcons":id==2?"centeredIcon":"other";}
}''',
'android/net/Uri.java': 'package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}',
'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long uptimeMillis(){return 100;}}',
'android/view/Display.java': 'package android.view;public class Display {public static final int STATE_ON=2;public int state=STATE_ON;public int getState(){return state;}}',
'android/view/ViewParent.java': 'package android.view;public interface ViewParent {}',
'android/view/ViewTreeObserver.java': '''package android.view;import java.util.*;public class ViewTreeObserver {
 public interface OnPreDrawListener {boolean onPreDraw();}public final List<OnPreDrawListener> listeners=new ArrayList<>();
 public void addOnPreDrawListener(OnPreDrawListener v){listeners.add(v);}public void removeOnPreDrawListener(OnPreDrawListener v){listeners.remove(v);}public boolean isAlive(){return true;}
}''',
'android/view/View.java': '''package android.view;import java.util.*;import java.util.concurrent.*;public class View implements ViewParent {
 public static final int VISIBLE=0,GONE=8,LAYOUT_DIRECTION_RTL=1;public int visibility=0,direction=0,width=100,height=24,mw=100,mh=24,id=1,invalidates,requests;public float alpha=1;public boolean attached=true,shown=true;
 public ViewParent parent;public final Display display=new Display();public final ViewTreeObserver observer=new ViewTreeObserver();public final List<OnAttachStateChangeListener> attach=new ArrayList<>();public final List<Runnable> scheduled=new ArrayList<>();
 public static final ConcurrentLinkedQueue<Runnable> POSTS=new ConcurrentLinkedQueue<>();
 public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public ViewParent getParent(){return parent;}public int getVisibility(){return visibility;}public int getLayoutDirection(){return direction;}public float getAlpha(){return alpha;}
 public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown&&visibility==0&&(!(parent instanceof View)||((View)parent).isShown());}
 public Display getDisplay(){return display;}public int getId(){return id;}public int getWidth(){return width;}public int getHeight(){return height;}public int getMeasuredHeight(){return mh;}
 public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return getContext().getResources();}
 public void requestLayout(){requests++;}public void invalidate(){invalidates++;}public void post(Runnable r){POSTS.add(r);}public void postDelayed(Runnable r,long delay){scheduled.add(r);}public void removeCallbacks(Runnable r){scheduled.remove(r);}
 public ViewTreeObserver getViewTreeObserver(){return observer;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){attach.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){attach.remove(l);}
 public void detach(){attached=false;for(OnAttachStateChangeListener l:new ArrayList<>(attach))l.onViewDetachedFromWindow(this);}
 protected void setMeasuredDimension(int w,int h){mw=w;mh=h;}
 public static int resolveSize(int wanted,int spec){int mode=spec&0xc0000000,size=spec&0x3fffffff;return mode==0x40000000?size:mode==0x80000000?Math.min(size,wanted):wanted;}
}''',
'android/view/ViewGroup.java': '''package android.view;import java.util.*;public class ViewGroup extends View {
 public final List<View> children=new ArrayList<>();public void add(View v){children.add(v);v.parent=this;}public void remove(View v){children.remove(v);v.parent=null;}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
 protected void dispatchDraw(android.graphics.Canvas c){c.nativeDraws++;}
}''',
'android/graphics/Paint.java': '''package android.graphics;public class Paint {public static final int ANTI_ALIAS_FLAG=1;public float size;public int color;public Paint(int flags){}public void setTextSize(float s){size=s;}public void setColor(int c){color=c;}public static class FontMetrics {public float ascent=-8,descent=2;}public FontMetrics getFontMetrics(){return new FontMetrics();}}''',
'android/graphics/Color.java': 'package android.graphics;public class Color {public static final int WHITE=-1;}',
'android/graphics/Canvas.java': '''package android.graphics;public class Canvas {public int nativeDraws,textDraws,restores,textColor;public float dx,dy,clipW,clipH,lastTextX,lastTextY;public int save(){return 1;}public void translate(float x,float y){dx=x;dy=y;}public void clipRect(int l,int t,int r,int b){clipW=r-l;clipH=b-t;}public void drawText(String s,float x,float y,Paint p){textDraws++;textColor=p.color;lastTextX=x+dx;lastTextY=y+dy;}public void restoreToCount(int s){restores++;}}''',
'android/graphics/Rect.java': '''package android.graphics;public class Rect {public int left,top,right,bottom;public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public Rect(Rect r){this(r.left,r.top,r.right,r.bottom);}public boolean isEmpty(){return left>=right||top>=bottom;}}''',
'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;import android.graphics.*;public class Drawable {
 public interface Callback {void invalidateDrawable(Drawable w);void scheduleDrawable(Drawable w,Runnable r,long when);void unscheduleDrawable(Drawable w,Runnable r);}
 public Callback callback;public int draws;public int[] bounds;public void setCallback(Callback c){callback=c;}public int getIntrinsicWidth(){return 40;}public int getIntrinsicHeight(){return 20;}public void setBounds(int l,int t,int r,int b){bounds=new int[]{l,t,r,b};}public void draw(Canvas c){draws++;}
}''',
'android/graphics/drawable/AnimatedImageDrawable.java': '''package android.graphics.drawable;public class AnimatedImageDrawable extends Drawable {public boolean running;public int starts,stops;public void start(){running=true;starts++;}public void stop(){running=false;stops++;}public boolean isRunning(){return running;}}''',
'android/text/TextPaint.java': 'package android.text;public class TextPaint extends android.graphics.Paint {public TextPaint(int flags){super(flags);}public float measureText(String s){return s.length()*size*.6f;}}',
'android/text/TextUtils.java': 'package android.text;public class TextUtils {public enum TruncateAt {END}public static CharSequence ellipsize(String s,TextPaint p,float w,TruncateAt at){int length=Math.max(0,Math.min(s.length(),(int)(w/Math.max(.1f,p.size*.6f))));return s.substring(0,length);}}',
'com/android/systemui/statusbar/phone/PhoneStatusBarView.java': 'package com.android.systemui.statusbar.phone;public class PhoneStatusBarView extends android.view.ViewGroup {}',
'com/android/systemui/statusbar/policy/Clock.java': '''package com.android.systemui.statusbar.policy;public class Clock extends android.view.View {public int mNonAdaptedColor=0xff5e6568,textColor=0xff123456;public void onDarkChanged(java.util.ArrayList<android.graphics.Rect> areas,float intensity,int tint){mNonAdaptedColor=com.android.systemui.plugins.DarkIconDispatcher.getTint(areas,this,tint);}public int getCurrentTextColor(){return textColor;}}''',
'com/android/systemui/plugins/DarkIconDispatcher.java': '''package com.android.systemui.plugins;public class DarkIconDispatcher {public static android.view.View lastTarget;public static boolean fail;public static java.util.Collection<android.graphics.Rect> lastAreas;public static int getTint(java.util.Collection<android.graphics.Rect> areas,android.view.View view,int tint){if(fail)throw new IllegalStateException("unavailable");lastTarget=view;lastAreas=areas;if(areas.isEmpty())return tint;for(android.graphics.Rect r:areas)if(r.isEmpty()||r.top<=0&&Math.max(0,Math.min(r.right,view.width)-Math.max(r.left,0))*2>view.width)return tint;return 0xffffffff;}}''',
'com/android/systemui/statusbar/phone/NotificationIconContainer.java': '''package com.android.systemui.statusbar.phone;public class NotificationIconContainer extends android.view.ViewGroup {public java.util.Map<android.view.View,Object> mIconStates=new java.util.HashMap<>();public void onMeasure(int w,int h){}public void onLayout(boolean b,int l,int t,int r,int d){}public void calculateIconXTranslations(){}public void applyIconStates(){}}''',
'com/android/systemui/statusbar/StatusBarIconView.java': '''package com.android.systemui.statusbar;public class StatusBarIconView extends android.view.View {public boolean visible=true,blocked;public int state;public Object notification=new Object(),mBundleEntry;public int mDecorColor=-1;public boolean isIconVisible(){return visible;}public boolean isIconBlocked(){return blocked;}public int getVisibleState(){return state;}public Object getNotification(){return notification;}public int getStaticDrawableColor(){return 0xff55aa11;}}''',
'ls/augment/com/ConfigSchema.java': 'package ls.augment.com;public class ConfigSchema {public static final String SYSTEMUI_MASTER="master";}',
'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com;import java.util.*;public class ConfigSnapshot {public final Map<String,String> values=new HashMap<>();public ConfigSnapshot(){values.put(ConfigSchema.SYSTEMUI_MASTER,"1");for(EnhancementOption o:NotificationSummaryOptions.options())values.put(o.key,o.defaultValue);}public String get(String k){return values.getOrDefault(k,"");}}''',
'ls/augment/com/StatusBarAssetStore.java': '''package ls.augment.com;import java.io.*;import android.graphics.drawable.*;public class StatusBarAssetStore {public static byte[] read(InputStream in)throws IOException{return in.readAllBytes();}public static String hash(byte[] b){return "a".repeat(64);}public static Drawable decode(byte[] b,int size){return new AnimatedImageDrawable();}}''',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import java.util.*;import ls.augment.com.*;public class FeatureSettings {public static ConfigSnapshot current=new ConfigSnapshot();public static final List<Runnable> listeners=new ArrayList<>();public static ConfigSnapshot snapshot(Object c){return current;}public static int integer(Object c,String key,int d,int min,int max){try{return Math.max(min,Math.min(max,Integer.parseInt(current.get(key))));}catch(Exception e){return d;}}public static boolean addSnapshotListener(Object c,Runnable r){return listeners.add(r);}public static void removeSnapshotListener(Runnable r){listeners.remove(r);}public static void diagnostic(Object c,String key,String value){}public static void publish(ConfigSnapshot s){current=s;for(Runnable r:new ArrayList<>(listeners))r.run();}}''',
'ls/augment/com/hook/StatusBarGridHook.java': 'package ls.augment.com.hook;public class StatusBarGridHook {public static boolean grid;public static boolean ownsIconLayout(android.view.View v){return grid;}}',
'ls/augment/com/hook/StatusBarIconLayoutHook.java': 'package ls.augment.com.hook;import ls.augment.com.*;public class StatusBarIconLayoutHook {public static StatusBarIconSpacingSpec.Insets edge=StatusBarIconSpacingSpec.ZERO;public static StatusBarIconSpacingSpec.Insets insets(android.view.View v,String id){return edge;}}',
'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.util.*;import java.lang.reflect.*;public class AugmentModule {
 public interface Invoke {Object call(Chain c)throws Throwable;}public interface Original {Object run()throws Throwable;}
 public static class Chain {Object owner;List<Object> args;Original original;public Chain(Object owner,List<Object> args,Original original){this.owner=owner;this.args=args;this.original=original;}public Object getThisObject(){return owner;}public List<Object> getArgs(){return args;}public Object proceed()throws Throwable{return original.run();}}
 public static class Hook {public Method method;public Invoke invoke;Hook(Method m){method=m;}public Hook intercept(Invoke callback){invoke=callback;return this;}}
 public final List<Hook> hooks=new ArrayList<>();public final List<String> errors=new ArrayList<>();public Hook prepareFeatureHook(Method m,String id,boolean b){return new Hook(m);}public void registerFeatureHook(Hook h){hooks.add(h);}public void deoptimize(Method m){}public void logFeatureError(String message,Throwable error){errors.add(message+":"+error);}
}''',
'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.lang.reflect.*;public class SystemUiAdapter {
 public static final Object PASS=new Object();public interface Patch {Object apply(Object o,Object[] args,Object result)throws Throwable;}
 public static int hookNamed(AugmentModule module,ClassLoader loader,String ns,String type,String name,int n,Patch before,Patch after){int count=0;try{for(Method m:Class.forName(type,false,loader).getDeclaredMethods())if(m.getName().equals(name)&&(n<0||m.getParameterCount()==n)){module.registerFeatureHook(module.prepareFeatureHook(m,ns,false).intercept(chain->{Object[] args=chain.getArgs().toArray();if(before!=null){Object result=before.apply(chain.getThisObject(),args,null);if(result!=PASS)return result;}Object result=chain.proceed();if(after!=null){Object changed=after.apply(chain.getThisObject(),args,result);if(changed!=PASS)return changed;}return result;}));count++;}}catch(Exception e){throw new RuntimeException(e);}return count;}
 public static Object call(Object o,String name,Object...args)throws ReflectiveOperationException {Method m=o.getClass().getMethod(name);return m.invoke(o,args);}
 public static Object field(Object o,String... names){if(o==null)return null;for(String name:names)for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(Exception ignored){}return null;}
}''',
'ls/augment/com/hook/TestNotificationSummaryRuntime.java': r'''package ls.augment.com.hook;
import java.util.*;import java.lang.reflect.*;import android.view.*;import android.graphics.*;import android.graphics.drawable.*;import ls.augment.com.*;import com.android.systemui.statusbar.*;import com.android.systemui.statusbar.phone.*;
public class TestNotificationSummaryRuntime {
 static int checks;static void check(boolean v,String m){checks++;if(!v)throw new AssertionError(m);}
 static AugmentModule.Hook hook(AugmentModule module,String name){return module.hooks.stream().filter(h->h.method.getName().equals(name)).findFirst().orElseThrow();}
 static Object draw(AugmentModule.Hook hook,ViewGroup view,Canvas canvas)throws Throwable{return hook.invoke.call(new AugmentModule.Chain(view,List.of(canvas),()->{canvas.nativeDraws++;return null;}));}
 static ConfigSnapshot config(String... entries){ConfigSnapshot next=new ConfigSnapshot();next.values.put(NotificationSummaryOptions.ENABLED,"1");for(int i=0;i<entries.length;i+=2)next.values.put(entries[i],entries[i+1]);return next;}
 static Object state(ViewGroup view)throws Exception {Field f=StatusBarNotificationSummaryHook.class.getDeclaredField("STATES");f.setAccessible(true);return ((Map<?,?>)f.get(null)).get(view);}
 static Object field(Object o,String key)throws Exception {Field f=o.getClass().getDeclaredField(key);f.setAccessible(true);return f.get(o);}
 static void awaitImage(Object state)throws Exception {long until=System.currentTimeMillis()+3000;while(Boolean.TRUE.equals(field(state,"loading"))&&System.currentTimeMillis()<until){Runnable next;while((next=View.POSTS.poll())!=null)next.run();Thread.sleep(1);}check(!Boolean.TRUE.equals(field(state,"loading")),"image completion must arrive");}
 public static class NativeState {public boolean hidden;}
 public static void main(String[] args)throws Throwable {
  AugmentModule module=new AugmentModule();StatusBarNotificationSummaryHook.install(module,TestNotificationSummaryRuntime.class.getClassLoader());
  check(module.errors.isEmpty(),"all required hooks install against facade inherited dispatch");AugmentModule.Hook dispatch=hook(module,"dispatchDraw");check(dispatch.method.getDeclaringClass()==ViewGroup.class,"inherited drawing declaration must be found");
  Canvas unrelatedCanvas=new Canvas();draw(dispatch,new ViewGroup(),unrelatedCanvas);check(unrelatedCanvas.nativeDraws==1,"base hook cannot intercept unrelated containers");
  NotificationIconContainer outside=new NotificationIconContainer();outside.add(new StatusBarIconView());check(StatusBarNotificationSummaryHook.measure(outside)==null,"shelf/AOD/no phone root must remain native");
  PhoneStatusBarView phone=new PhoneStatusBarView();NotificationIconContainer owner=new NotificationIconContainer();phone.add(owner);com.android.systemui.statusbar.policy.Clock clock=new com.android.systemui.statusbar.policy.Clock();phone.add(clock);StatusBarIconView icon=new StatusBarIconView();owner.add(icon);NativeState nativeState=new NativeState();owner.mIconStates.put(icon,nativeState);
  FeatureSettings.publish(config());int[] size=StatusBarNotificationSummaryHook.measure(owner);check(size!=null&&size[0]>0&&size[1]==18,"active notification has real content geometry");
  owner.id=2;check(StatusBarNotificationSummaryHook.measure(owner)==null,"centered icon container cannot inherit notification-area summary");owner.id=1;
  icon.blocked=true;check(StatusBarNotificationSummaryHook.measure(owner)==null,"blocked notification not promoted");icon.blocked=false;icon.visible=false;check(StatusBarNotificationSummaryHook.measure(owner)==null,"inactive icon not promoted");icon.visible=true;
  nativeState.hidden=true;check(StatusBarNotificationSummaryHook.measure(owner)==null,"pending native hidden state wins");nativeState.hidden=false;icon.state=2;check(StatusBarNotificationSummaryHook.measure(owner)==null,"native hidden visibleState wins");icon.state=0;
  icon.notification=null;check(StatusBarNotificationSummaryHook.measure(owner)==null,"non-notification status icon does not create summary");icon.notification=new Object();
  StatusBarGridHook.grid=true;Canvas grid=new Canvas();draw(dispatch,owner,grid);check(grid.nativeDraws==0&&grid.textDraws==1&&grid.dx==0&&grid.dy==0,"grid draws only summary in its zero-origin measured box");check(grid.clipW==StatusBarNotificationSummaryHook.measure(owner)[0],"draw width and measurement agree");
  check(grid.textColor==0xff5e6568,"late enable uses same-phone native clock foreground, never colorful notification or clock customization");
  AugmentModule.Hook dark=hook(module,"onDarkChanged");ArrayList<Rect> areas=new ArrayList<>();int beforeTintInvalidation=owner.invalidates;
  dark.invoke.call(new AugmentModule.Chain(clock,List.of(areas,1f,0xff313739),()->{clock.onDarkChanged(areas,1f,0xff313739);return null;}));Canvas lightApp=new Canvas();draw(dispatch,owner,lightApp);
  check(lightApp.textColor==0xff313739&&owner.invalidates>beforeTintInvalidation,"native light-background transition invalidates and applies actual dynamic dark tint");
  check(com.android.systemui.plugins.DarkIconDispatcher.lastTarget==owner,"palette resolves at summary container rather than neighbor clock or notification artwork");
  dark.invoke.call(new AugmentModule.Chain(clock,List.of(areas,0f,0xfffaf7f1),()->{clock.onDarkChanged(areas,0f,0xfffaf7f1);return null;}));Canvas darkApp=new Canvas();draw(dispatch,owner,darkApp);check(darkApp.textColor==0xfffaf7f1,"dark application transition follows native light tint without hardcoded white");
  dark.invoke.call(new AugmentModule.Chain(clock,List.of(areas,.5f,0xff889094),()->{clock.onDarkChanged(areas,.5f,0xff889094);return null;}));Canvas transition=new Canvas();draw(dispatch,owner,transition);check(transition.textColor==0xff889094,"intermediate native tint is preserved during light-bar animation");
  areas.add(new Rect(0,0,40,50));clock.width=20;
  dark.invoke.call(new AugmentModule.Chain(clock,List.of(areas,1f,0xff212325),()->{clock.onDarkChanged(areas,1f,0xff212325);return null;}));Canvas split=new Canvas();draw(dispatch,owner,split);check(clock.mNonAdaptedColor==0xff212325&&split.textColor==0xffffffff,"summary outside a split dark area does not blindly inherit neighbor clock color");
  areas.get(0).right=500;Canvas immutable=new Canvas();draw(dispatch,owner,immutable);check(immutable.textColor==0xffffffff,"later OEM rectangle mutation cannot silently corrupt captured palette");
  owner.width=20;Canvas moved=new Canvas();draw(dispatch,owner,moved);check(moved.textColor==0xff212325,"layout change re-resolves the summary within the native tint area without a new callback");owner.width=100;
  com.android.systemui.plugins.DarkIconDispatcher.fail=true;Canvas unavailableTint=new Canvas();draw(dispatch,owner,unavailableTint);check(unavailableTint.textColor==clock.mNonAdaptedColor,"missing native palette resolver falls back to current real clock tint");com.android.systemui.plugins.DarkIconDispatcher.fail=false;
  PhoneStatusBarView otherPhone=new PhoneStatusBarView();com.android.systemui.statusbar.policy.Clock otherClock=new com.android.systemui.statusbar.policy.Clock();otherPhone.add(otherClock);int ownInvalidations=owner.invalidates;
  dark.invoke.call(new AugmentModule.Chain(otherClock,List.of(new ArrayList<Rect>(),1f,0xffff0000),()->null));check(owner.invalidates==ownInvalidations,"another status-bar root cannot publish its palette into this display");
  phone.remove(clock);Canvas missingClock=new Canvas();draw(dispatch,owner,missingClock);check(missingClock.nativeDraws==1&&missingClock.textDraws==0,"missing safe native tint source falls back to native notifications rather than guessed white");phone.add(clock);
  StatusBarGridHook.grid=false;StatusBarIconLayoutHook.edge=new StatusBarIconSpacingSpec.Insets(3,2,7,4);owner.direction=View.LAYOUT_DIRECTION_RTL;Canvas rtl=new Canvas();draw(dispatch,owner,rtl);check(rtl.dx==owner.width-rtl.clipW-3,"native RTL respects logical start boundary");check(rtl.dy==(owner.height-rtl.clipH-6)/2f+2,"vertical edge offsets remain inside measured row");
  owner.height=80;android.content.Context.R.metrics.density=2;check(StatusBarNotificationSummaryHook.measure(owner)[1]==36,"density changes recompute size without configuration snapshot changes");owner.height=24;android.content.Context.R.metrics.density=1;
  AugmentModule.Hook measure=hook(module,"onMeasure");measure.invoke.call(new AugmentModule.Chain(owner,List.of(0x80000000|100,0x40000000|24),()->null));check(owner.mw==StatusBarNotificationSummaryHook.measure(owner)[0]+10,"native summary reserves both horizontal edges once");
  owner.remove(icon);Canvas empty=new Canvas();draw(dispatch,owner,empty);check(empty.nativeDraws==1&&empty.textDraws==0,"no notifications immediately returns to native drawing");owner.add(icon);
  FeatureSettings.publish(config(NotificationSummaryOptions.ENABLED,"0"));Canvas off=new Canvas();draw(dispatch,owner,off);check(off.nativeDraws==1,"turning off restores original drawing without child mutations");
  FeatureSettings.publish(config(NotificationSummaryOptions.MODE,"2",NotificationSummaryOptions.ASSET,"b".repeat(64)));Object state=state(owner);check(StatusBarNotificationSummaryHook.measure(owner)==null,"unready image preserves native icons");awaitImage(state);check(StatusBarNotificationSummaryHook.measure(owner)==null,"hash mismatch falls back to native");
  FeatureSettings.publish(config(NotificationSummaryOptions.MODE,"2",NotificationSummaryOptions.ASSET,"a".repeat(64)));awaitImage(state);check(StatusBarNotificationSummaryHook.measure(owner)!=null,"verified decoded asset participates in measurement");AnimatedImageDrawable art=(AnimatedImageDrawable)field(state,"art");StatusBarIconLayoutHook.edge=StatusBarIconSpacingSpec.ZERO;Canvas animated=new Canvas();draw(dispatch,owner,animated);check(art.running&&art.draws==1,"animation starts only while rendering actual notification");
  owner.display.state=1;for(ViewTreeObserver.OnPreDrawListener l:new ArrayList<>(owner.observer.listeners))l.onPreDraw();check(!art.running,"screen off stops animation");owner.display.state=Display.STATE_ON;draw(dispatch,owner,new Canvas());check(art.running,"screen on can resume active notification artwork");
  phone.alpha=0;for(ViewTreeObserver.OnPreDrawListener l:new ArrayList<>(owner.observer.listeners))l.onPreDraw();check(!art.running,"hidden ancestor stops animation even when isShown stays true");phone.alpha=1;
  Field artField=state.getClass().getDeclaredField("art");artField.setAccessible(true);artField.set(state,new Drawable(){@Override public void draw(Canvas c){throw new IllegalStateException("bad decoded frame");}});Canvas badFrame=new Canvas();draw(dispatch,owner,badFrame);check(badFrame.nativeDraws==1&&badFrame.restores==1,"failed custom draw restores canvas and falls back to original notifications");artField.set(state,art);
  owner.remove(icon);for(ViewTreeObserver.OnPreDrawListener l:new ArrayList<>(owner.observer.listeners))l.onPreDraw();check(!art.running&&StatusBarNotificationSummaryHook.measure(owner)==null,"removing final notification stops animated summary");owner.add(icon);draw(dispatch,owner,new Canvas());
  int listeners=FeatureSettings.listeners.size();owner.detach();check(state(owner)==null&&FeatureSettings.listeners.size()==listeners-1&&owner.observer.listeners.isEmpty()&&owner.attach.isEmpty()&&!art.running&&art.callback==null,"detach releases state, callbacks, animation and snapshot listener");
  owner.attached=true;check(StatusBarNotificationSummaryHook.measure(owner)!=null||state(owner)!=null,"reattach creates fresh state safely");
  System.out.println("Notification summary production hook facade: "+checks+" assertions passed (not on-device rendering evidence)");
 }
}''',
}

with tempfile.TemporaryDirectory(prefix='duo-notification-summary-') as tmp:
    folder = Path(tmp)
    for name, content in FILES.items():
        path = folder / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    production = ROOT / 'android/app/src/main/java/ls/augment/com'
    sources = ['hook/StatusBarNotificationSummaryHook.java', 'NotificationSummaryOptions.java',
               'StatusBarIconSpacingSpec.java', 'StatusBarIconCatalog.java', 'StatusBarSurfaceSpec.java',
               'EnhancementOption.java']
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp,
                    *map(str, folder.rglob('*.java')), *(str(production / s) for s in sources)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'ls.augment.com.hook.TestNotificationSummaryRuntime'], check=True, timeout=15)
