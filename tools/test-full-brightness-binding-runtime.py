"""Run the complete production brightness hook with dispatched Android/OEM method facades."""
from pathlib import Path
import argparse
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PRODUCTION = ROOT / 'android/app/src/main/java/ls/augment/com'
tree = ast.parse((ROOT / 'tools/test-notification-summary-runtime.py').read_text('utf-8'))
base = next(ast.literal_eval(node.value) for node in tree.body if isinstance(node, ast.Assign)
            and any(isinstance(target, ast.Name) and target.id == 'FILES' for target in node.targets))
FILES = {name: value for name, value in base.items() if name.startswith('android/graphics/')}
FILES.update({
'android/os/Bundle.java': '''package android.os;public class Bundle {private final java.util.Map<String,Object> values=new java.util.concurrent.ConcurrentHashMap<>();public void putBoolean(String k,boolean v){values.put(k,v);}public void putInt(String k,int v){values.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}public int getInt(String k,int fallback){Object v=values.get(k);return v instanceof Integer?(Integer)v:fallback;}}''',
'android/net/Uri.java': 'package android.net;public class Uri {public static Uri parse(String value){return new Uri();}}',
'android/os/Looper.java': 'package android.os;public class Looper {private static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}}',
'android/os/Handler.java': '''package android.os;public class Handler {public static final java.util.List<Runnable> pending=new java.util.ArrayList<>();public Handler(Looper l){}public void removeCallbacks(Runnable r){pending.removeIf(item->item==r);}public void postDelayed(Runnable r,long delay){pending.add(r);}}''',
'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long now=100;public static long uptimeMillis(){return now;}}',
'android/provider/Settings.java': '''package android.provider;public class Settings {public static class System {public static final String SCREEN_BRIGHTNESS_MODE="mode";public static int mode;public static int getInt(Object resolver,String key,int fallback){return mode;}}}''',
'android/content/Context.java': '''package android.content;public class Context {public static final android.os.Bundle reply=new android.os.Bundle();static {reply.putBoolean("ready",true);reply.putBoolean("enabled",true);}public static class ContentResolver {public android.os.Bundle call(android.net.Uri uri,String method,String arg,android.os.Bundle extras){return reply;}}public ContentResolver getContentResolver(){return new ContentResolver();}public Context getApplicationContext(){return this;}public String getPackageName(){return "com.android.systemui";}public android.content.res.Resources getResources(){return new android.content.res.Resources();}}''',
'android/content/res/Resources.java': 'package android.content.res;public class Resources {public static class Metrics{public float density=1;}public Metrics getDisplayMetrics(){return new Metrics();}}',
'android/view/View.java': '''package android.view;public class View {public boolean attached=true;public final java.util.List<OnAttachStateChangeListener> attaches=new java.util.ArrayList<>();public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return getContext().getResources();}public int getWidth(){return 400;}public int getHeight(){return 48;}public boolean isAttachedToWindow(){return attached;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){attaches.add(l);}public void attach(){attached=true;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(attaches))l.onViewAttachedToWindow(this);}public void detach(){attached=false;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(attaches))l.onViewDetachedFromWindow(this);}public void setStateDescription(CharSequence text){}public Overlay getOverlay(){return new Overlay();}public static class Overlay{public void add(android.graphics.drawable.Drawable d){}public void remove(android.graphics.drawable.Drawable d){}}}''',
'android/widget/ProgressBar.java': '''package android.widget;import ls.augment.com.hook.HookRuntime;public class ProgressBar extends android.view.View {public int minimum=10,maximum=110,progress=60;public int getMin(){return (Integer)HookRuntime.call(ProgressBar.class,"getMin",new Class<?>[0],this,new Object[0],a->minimum);}public int getMax(){return (Integer)HookRuntime.call(ProgressBar.class,"getMax",new Class<?>[0],this,new Object[0],a->maximum);}public int getProgress(){return (Integer)HookRuntime.call(ProgressBar.class,"getProgress",new Class<?>[0],this,new Object[0],a->progress);}public void setMin(int value){HookRuntime.call(ProgressBar.class,"setMin",new Class<?>[]{int.class},this,new Object[]{value},a->{minimum=(Integer)a[0];return null;});}public void setMax(int value){HookRuntime.call(ProgressBar.class,"setMax",new Class<?>[]{int.class},this,new Object[]{value},a->{maximum=(Integer)a[0];return null;});}public boolean setProgressInternal(int value,boolean user,boolean animate){return (Boolean)HookRuntime.call(ProgressBar.class,"setProgressInternal",new Class<?>[]{int.class,boolean.class,boolean.class},this,new Object[]{value,user,animate},a->{progress=(Integer)a[0];changed(progress,(Boolean)a[1]);return true;});}protected void changed(int value,boolean user){}public void setProgress(int value){setProgressInternal(value,false,false);}}''',
'android/widget/SeekBar.java': '''package android.widget;import ls.augment.com.hook.HookRuntime;public class SeekBar extends ProgressBar {public OnSeekBarChangeListener listener;public interface OnSeekBarChangeListener{void onProgressChanged(SeekBar bar,int value,boolean user);void onStartTrackingTouch(SeekBar bar);void onStopTrackingTouch(SeekBar bar);}public void setOnSeekBarChangeListener(OnSeekBarChangeListener listener){HookRuntime.call(SeekBar.class,"setOnSeekBarChangeListener",new Class<?>[]{OnSeekBarChangeListener.class},this,new Object[]{listener},a->{this.listener=(OnSeekBarChangeListener)a[0];return null;});}public void setInlinedListener(OnSeekBarChangeListener listener){this.listener=listener;}@Override protected void changed(int value,boolean user){if(listener!=null)listener.onProgressChanged(this,value,user);}public void userProgress(int value){setProgressInternal(value,true,false);}}''',
'ls/augment/com/hook/HookRuntime.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;public class HookRuntime {public interface Original{Object run(Object[] args)throws Throwable;}public static final Map<Method,AugmentModule.Hook> hooks=new HashMap<>();public static Object call(Class<?> type,String name,Class<?>[] types,Object owner,Object[] args,Original original){try{Method method=type.getDeclaredMethod(name,types);AugmentModule.Hook hook=hooks.get(method);return hook==null?original.run(args):hook.callback.run(new AugmentModule.Chain(owner,args,original));}catch(RuntimeException|Error error){throw error;}catch(Throwable error){throw new IllegalStateException(error);}}}''',
'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;public class AugmentModule {public interface Callback{Object run(Chain chain)throws Throwable;}public static class Chain {final Object owner;final Object[] args;final HookRuntime.Original original;Chain(Object owner,Object[] args,HookRuntime.Original original){this.owner=owner;this.args=args;this.original=original;}public Object getThisObject(){return owner;}public Object getArg(int index){return args[index];}public List<Object> getArgs(){return Arrays.asList(args);}public Object proceed()throws Throwable{return original.run(args);}public Object proceed(Object[] changed)throws Throwable{return original.run(changed);}}public static class Hook{final Method method;Callback callback;Hook(Method method){this.method=method;}public Hook intercept(Callback callback){this.callback=callback;return this;}}public final List<String> errors=new ArrayList<>();public Hook prepareFeatureHook(Method method,String id,boolean optional){return new Hook(method);}public void registerFeatureHook(Hook hook){HookRuntime.hooks.put(hook.method,hook);}public void logFeatureError(String stage,Throwable error){errors.add(stage+":"+error);}public void logFeatureInfo(String message){}}''',
'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.lang.reflect.*;public class SystemUiAdapter {public static final Object PASS=new Object();public interface Patch{Object run(Object owner,Object[] args,Object result)throws Throwable;}public static Object field(Object owner,String name){try{Field f=owner.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(owner);}catch(Exception error){return null;}}public static int hookNamed(AugmentModule module,ClassLoader loader,String namespace,String type,String name,int count,Patch before,Patch after){try{int found=0;for(Method method:Class.forName(type,false,loader).getDeclaredMethods())if(method.getName().equals(name)&&method.getParameterCount()==count){module.registerFeatureHook(module.prepareFeatureHook(method,namespace,false).intercept(chain->{Object result=chain.proceed();Object next=after.run(chain.getThisObject(),chain.getArgs().toArray(),result);return next==PASS?result:next;}));found++;}return found;}catch(ClassNotFoundException missing){return 0;}}}''',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;public class FeatureSettings {public static boolean enabled=true;public static int diagnosticWrites;public static final java.util.List<Runnable> listeners=new java.util.ArrayList<>();public static boolean enabled(android.content.Context c,String key){return enabled;}public static boolean addSnapshotListener(android.content.Context c,Runnable listener){listeners.add(listener);return true;}public static void removeSnapshotListener(Runnable listener){listeners.remove(listener);}public static void publish(){for(Runnable listener:new java.util.ArrayList<>(listeners))listener.run();}public static void diagnostic(android.content.Context c,String key,String value){diagnosticWrites++;}}''',
'com/zte/controlcenter/view/ToggleSliderView.java': r'''package com.zte.controlcenter.view;
import android.widget.*;import ls.augment.com.hook.HookRuntime;
public class ToggleSliderView extends android.view.View {
 public final SeekBar mSlider=new SeekBar();
 public int changes,starts,stops,lastValue,lastMax,lastProgress,nativeAttaches,checkedValue,checkedMax,mirrorValue,mirrorMax;
 public boolean failProgress,failGetValue,failChecked,failMirror;
 public interface CheckListener {void onCheckedChanged(boolean checked);}
 public final CheckListener mCheckListener=new CheckListener(){public void onCheckedChanged(boolean checked){
  HookRuntime.call(getClass(),"onCheckedChanged",new Class<?>[]{boolean.class},this,new Object[]{checked},a->{
   checkedValue=mSlider.getProgress();checkedMax=mSlider.getMax();if(failChecked)throw new IllegalStateException("native check failure");return null;});}};
 public final SeekBar.OnSeekBarChangeListener mSeekListener=new SeekBar.OnSeekBarChangeListener(){
  public void onProgressChanged(SeekBar bar,int value,boolean user){changes++;lastValue=value;lastMax=bar.getMax();lastProgress=bar.getProgress();if(failProgress)throw new IllegalStateException("native progress failure");}
  public void onStartTrackingTouch(SeekBar bar){starts++;lastMax=bar.getMax();}
  public void onStopTrackingTouch(SeekBar bar){stops++;lastMax=bar.getMax();}};
 public ToggleSliderView(boolean inlined){if(inlined)mSlider.setInlinedListener(mSeekListener);else mSlider.setOnSeekBarChangeListener(mSeekListener);}
 public void onAttachedToWindow(){HookRuntime.call(ToggleSliderView.class,"onAttachedToWindow",new Class<?>[0],this,new Object[0],a->{nativeAttaches++;return null;});}
 public int getValue(){return (Integer)HookRuntime.call(ToggleSliderView.class,"getValue",new Class<?>[0],this,new Object[0],a->{if(failGetValue)throw new IllegalStateException("native getter failure");return mSlider.getProgress();});}
 public int getMax(){return (Integer)HookRuntime.call(ToggleSliderView.class,"getMax",new Class<?>[0],this,new Object[0],a->mSlider.getMax());}
 public void updateSlider(int value){HookRuntime.call(ToggleSliderView.class,"updateSlider",new Class<?>[]{int.class},this,new Object[]{value},a->{mSlider.setProgress((Integer)a[0]);return null;});}
 public void setMirror(ToggleSliderView mirror){HookRuntime.call(ToggleSliderView.class,"setMirror",new Class<?>[]{ToggleSliderView.class},this,new Object[]{mirror},a->{mirrorValue=mSlider.getProgress();mirrorMax=mSlider.getMax();if(failMirror)throw new IllegalStateException("native mirror failure");return null;});}
}''',
'ls/augment/com/hook/TestFullBrightnessBinding.java': r'''package ls.augment.com.hook;
import java.lang.reflect.*;import android.os.*;import android.widget.*;import ls.augment.com.*;import com.zte.controlcenter.view.*;
public class TestFullBrightnessBinding {
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static int callbacks(){return FeatureSettings.listeners.size();}static int tasks(){return Handler.pending.size();}
 static void reset(){FeatureSettings.enabled=true;android.provider.Settings.System.mode=0;}
 static void nativeCoordinates(ToggleSliderView owner){check(owner.getValue()==BrightnessRange.toNative(owner.mSlider.getProgress(),10,110),"owner getValue is scoped to native coordinates");check(owner.getMax()==110&&owner.mSlider.getMax()==BrightnessRange.SLIDER_MAX,"owner getMax is native while unrelated direct reads retain extended range");}
 public static void main(String[] args)throws Exception {
  Field snapshot=FullBrightnessHook.class.getDeclaredField("snapshot");snapshot.setAccessible(true);snapshot.set(null,android.content.Context.reply);
  AugmentModule module=new AugmentModule();check(FullBrightnessHook.install(module,TestFullBrightnessBinding.class.getClassLoader())>0&&module.errors.isEmpty(),"complete production hook installs against exposed OEM classes");
  check(FullBrightnessHook.install(module,TestFullBrightnessBinding.class.getClassLoader())==0,"second installation adds no hooks");
  ToggleSliderView detected=new ToggleSliderView(false);check(detected.mSeekListener.getClass().getName().equals("com.zte.controlcenter.view.ToggleSliderView$2"),"facade exercises the actual omitted listener class identity");
  SeekBar bar=detected.mSlider;check(bar.listener!=detected.mSeekListener&&bar.attaches.size()==1&&callbacks()==1&&tasks()==1,"ToggleSliderView$2 setter immediately binds one wrapper and one session");
  check(bar.getMin()==0&&bar.getMax()==BrightnessRange.SLIDER_MAX&&bar.getProgress()==5500,"full brightness expands 10..110 native range while preserving midpoint");
  check("50%".equals(FullBrightnessHook.label(bar)),"percentage label is exposed from actual expanded state");nativeCoordinates(detected);
  for(int i=0;i<20;i++)detected.onAttachedToWindow();check(detected.nativeAttaches==20&&bar.attaches.size()==1&&callbacks()==1&&tasks()==1,"repeated OEM attaches preserve original lifecycle and do not stack state, listeners or polls");
  int diagnosticWrites=FeatureSettings.diagnosticWrites;for(int i=0;i<40;i++)FeatureSettings.publish();check(FeatureSettings.diagnosticWrites==diagnosticWrites,"unchanged refreshes do not flood full-brightness runtime diagnostics");
  int changes=detected.changes;bar.userProgress(8000);check(detected.changes==changes+1&&detected.lastValue==85&&detected.lastProgress==85&&detected.lastMax==110,"user drag preserves the native callback with mapped progress and native getters");
  check(bar.getProgress()==8000&&bar.getMax()==BrightnessRange.SLIDER_MAX&&"75%".equals(FullBrightnessHook.label(bar)),"native callback scope ends before presentation getters run");
  check(detected.mCheckListener.getClass().getName().equals("com.zte.controlcenter.view.ToggleSliderView$1"),"checked-change callback has the production anonymous class identity");
  detected.mCheckListener.onCheckedChanged(true);check(detected.checkedValue==85&&detected.checkedMax==110&&bar.getProgress()==8000,"checked-change callback sends native progress while outside reads remain expanded");
  detected.setMirror(null);check(detected.mirrorValue==85&&detected.mirrorMax==110&&bar.getMax()==BrightnessRange.SLIDER_MAX,"mirror initialization reads native maximum and progress only inside native scope");
  detected.failChecked=true;try{detected.mCheckListener.onCheckedChanged(false);throw new AssertionError("expected checked failure");}catch(IllegalStateException expected){}detected.failChecked=false;
  detected.failMirror=true;try{detected.setMirror(null);throw new AssertionError("expected mirror failure");}catch(IllegalStateException expected){}detected.failMirror=false;
  check(bar.getProgress()==8000&&bar.getMax()==BrightnessRange.SLIDER_MAX,"checked and mirror exceptions both restore native scope");
  bar.listener.onStartTrackingTouch(bar);bar.listener.onStopTrackingTouch(bar);check(detected.starts==1&&detected.stops==1&&detected.lastMax==110,"native start/stop callbacks remain live and scoped");
  detected.updateSlider(35);check(bar.getProgress()==3000&&detected.lastValue==35&&detected.getValue()==35,"native updateSlider maps native animator coordinates exactly once");
  detected.failGetValue=true;try{detected.getValue();throw new AssertionError("expected getter failure");}catch(IllegalStateException expected){}detected.failGetValue=false;check(bar.getMax()==BrightnessRange.SLIDER_MAX,"native getter exception always restores ThreadLocal scope");
  detected.failProgress=true;try{bar.userProgress(7000);throw new AssertionError("expected native callback failure");}catch(IllegalStateException expected){}detected.failProgress=false;check(bar.getMax()==BrightnessRange.SLIDER_MAX,"native callback exception always restores ThreadLocal scope");
  bar.userProgress(0);check(detected.lastValue==10&&FullBrightnessHook.label(bar).startsWith("极低"),"lower extension preserves native minimum and exposes real extended label");
  bar.userProgress(BrightnessRange.SLIDER_MAX);check(detected.lastValue==110&&FullBrightnessHook.label(bar).equals(BrightnessRange.label(BrightnessRange.SLIDER_MAX)),"upper extension maps native maximum while retaining extended presentation position");
  bar.setMax(210);bar.setMin(20);bar.userProgress(5500);check(bar.getMax()==BrightnessRange.SLIDER_MAX&&bar.getMin()==0&&detected.getMax()==210&&detected.getValue()==115&&detected.lastValue==115,"native range updates preserve physical extension and update scoped coordinate conversion");
  bar.detach();check(callbacks()==0&&tasks()==0&&bar.attaches.size()==1,"detach releases poll and configuration listener without accumulating attach callbacks");
  for(int i=0;i<15;i++){bar.attach();detected.onAttachedToWindow();check(callbacks()==1&&tasks()==1&&bar.attaches.size()==1,"reattach owns exactly one runtime session");bar.detach();check(callbacks()==0&&tasks()==0,"every detach cancels that session");}
  reset();ToggleSliderView inlined=new ToggleSliderView(true);SeekBar inline=inlined.mSlider;check(inline.listener==inlined.mSeekListener&&inline.attaches.isEmpty()&&callbacks()==0,"an inlined constructor setter is not spuriously observed");
  inlined.onAttachedToWindow();check(inline.listener!=inlined.mSeekListener&&inline.attaches.size()==1&&callbacks()==1&&tasks()==1,"horizontal attach binds mSlider/mSeekListener even when setter was bypassed");
  nativeCoordinates(inlined);inline.userProgress(6500);check(inlined.lastValue==70&&inlined.lastMax==110&&inlined.lastProgress==70,"attach fallback retains original OEM callbacks and native gamma coordinates");
  inline.setOnSeekBarChangeListener(inline.listener);inlined.onAttachedToWindow();check(inline.attaches.size()==1&&callbacks()==1&&tasks()==2,"supplying the wrapper again does not recursively wrap or add a session; only one pending drag send exists");
  FeatureSettings.enabled=false;FeatureSettings.publish();check(inline.getMin()==10&&inline.getMax()==110&&FullBrightnessHook.label(inline)==null,"turning off restores native range and removes extended label");
  changes=inlined.changes;inline.userProgress(75);check(inlined.changes==changes+1&&inlined.lastValue==75&&inlined.lastMax==110,"disabled wrapper preserves native behavior");
  FeatureSettings.enabled=true;android.provider.Settings.System.mode=1;FeatureSettings.publish();check(inline.getMax()==110,"automatic brightness retains the native range");
  android.provider.Settings.System.mode=0;FeatureSettings.publish();check(inline.getMax()==BrightnessRange.SLIDER_MAX,"returning to manual brightness reenables verified extension");
  android.content.Context.reply.putBoolean("ready",false);FeatureSettings.publish();check(inline.getMax()==110&&FullBrightnessHook.label(inline)==null,"an unready phone brightness bridge cannot expose an ineffective extended range");
  android.content.Context.reply.putBoolean("ready",true);FeatureSettings.publish();check(inline.getMax()==BrightnessRange.SLIDER_MAX,"verified bridge readiness recovers without restarting the slider");inline.detach();check(callbacks()==0&&tasks()==0,"last horizontal detach cleans up pending work");
  SeekBar unrelated=new SeekBar();final int[] regular={0};SeekBar.OnSeekBarChangeListener listener=new SeekBar.OnSeekBarChangeListener(){public void onProgressChanged(SeekBar b,int value,boolean user){regular[0]++;}public void onStartTrackingTouch(SeekBar b){}public void onStopTrackingTouch(SeekBar b){}};unrelated.setOnSeekBarChangeListener(listener);unrelated.userProgress(44);check(unrelated.listener==listener&&regular[0]==1&&unrelated.attaches.isEmpty()&&unrelated.getMax()==110,"unrelated SeekBars retain original listeners, ranges and lifecycle");
  System.out.println("Full brightness binding production hook: "+checks+" assertions passed (facade, not phone rendering/backlight evidence)");
 }
}''',
})

# Extend reused graphics facades only to the APIs required by FullBrightnessHook.
FILES['android/graphics/Rect.java'] = 'package android.graphics;public class Rect{public int left,top,right,bottom;public int width(){return right-left;}public int height(){return bottom-top;}}'
FILES['android/graphics/Paint.java'] = 'package android.graphics;public class Paint{public static final int ANTI_ALIAS_FLAG=1;public enum Align{RIGHT}public Paint(int flags){}public void setTextSize(float size){}public void setTextAlign(Align align){}public void setColor(int color){}public void setAlpha(int alpha){}public void setColorFilter(ColorFilter filter){}}'
FILES['android/graphics/Canvas.java'] = 'package android.graphics;public class Canvas{public void drawText(String text,float x,float y,Paint paint){}}'
FILES['android/graphics/ColorFilter.java'] = 'package android.graphics;public class ColorFilter{}'
FILES['android/graphics/PixelFormat.java'] = 'package android.graphics;public class PixelFormat{public static final int TRANSLUCENT=-3;}'
FILES['android/graphics/drawable/Drawable.java'] = '''package android.graphics.drawable;import android.graphics.*;public abstract class Drawable{private final Rect bounds=new Rect();public Rect getBounds(){return bounds;}public void setBounds(int l,int t,int r,int b){bounds.left=l;bounds.top=t;bounds.right=r;bounds.bottom=b;}public void invalidateSelf(){}public abstract void draw(Canvas canvas);public abstract void setAlpha(int alpha);public abstract void setColorFilter(ColorFilter filter);public abstract int getOpacity();}'''
FILES.pop('android/graphics/drawable/AnimatedImageDrawable.java', None)


def run(mutations=False):
    FILES['android/os/Bundle.java']=FILES['android/os/Bundle.java'].replace('public class Bundle {',
        'public class Bundle {public void putString(String k,String v){if(v!=null)values.put(k,v);}public String getString(String k){return (String)values.get(k);}')
    FILES['android/widget/SeekBar.java']=FILES['android/widget/SeekBar.java'].replace('public OnSeekBarChangeListener listener;',
        'public OnSeekBarChangeListener listener,mOnSeekBarChangeListener;').replace('this.listener=listener;','this.listener=listener;this.mOnSeekBarChangeListener=listener;')
    FILES['com/zte/settings/display/brightness/BrightSeekPreference.java']='''package com.zte.settings.display.brightness;
public class BrightSeekPreference {public final android.widget.SeekBar mSeekBar=new android.widget.SeekBar();
public BrightSeekPreference(){mSeekBar.setInlinedListener(new android.widget.SeekBar.OnSeekBarChangeListener(){
public void onProgressChanged(android.widget.SeekBar b,int v,boolean u){}public void onStartTrackingTouch(android.widget.SeekBar b){}public void onStopTrackingTouch(android.widget.SeekBar b){}});}
public void onBindViewHolder(Object holder){ls.augment.com.hook.HookRuntime.call(BrightSeekPreference.class,"onBindViewHolder",new Class<?>[]{Object.class},this,new Object[]{holder},a->null);}}'''
    FILES['ls/augment/com/hook/TestFullBrightnessBinding.java']=FILES['ls/augment/com/hook/TestFullBrightnessBinding.java'].replace(
        'System.out.println("Full brightness binding',
        '''com.zte.settings.display.brightness.BrightSeekPreference settings=new com.zte.settings.display.brightness.BrightSeekPreference();
  check(settings.mSeekBar.getMax()==110,"settings inlined listener is initially native");settings.onBindViewHolder(new Object());
  check(settings.mSeekBar.getMax()==BrightnessRange.SLIDER_MAX&&FullBrightnessHook.label(settings.mSeekBar)!=null,"settings bind fallback captures the real SeekBar listener when its setter was inlined");
  settings.mSeekBar.detach();
  System.out.println("Full brightness binding''')
    FILES['com/zte/mifavor/widget/ColorSeekBarZTE.java']='package com.zte.mifavor.widget;public class ColorSeekBarZTE extends android.widget.SeekBar{}'
    FILES['ls/augment/com/hook/TestFullBrightnessBinding.java']=FILES['ls/augment/com/hook/TestFullBrightnessBinding.java'].replace(
        'System.out.println("Full brightness binding',
        '''com.zte.mifavor.widget.ColorSeekBarZTE vendor=new com.zte.mifavor.widget.ColorSeekBarZTE();
  com.zte.settings.display.brightness.BrightSeekPreference owner=new com.zte.settings.display.brightness.BrightSeekPreference();
  vendor.setOnSeekBarChangeListener(owner.mSeekBar.mOnSeekBarChangeListener);
  check(vendor.getMax()==BrightnessRange.SLIDER_MAX,"a vendor SeekBar inheriting its listener setter cannot abort the framework hooks");vendor.detach();owner.mSeekBar.detach();
  System.out.println("Full brightness binding''')
    production = (PRODUCTION / 'hook/FullBrightnessHook.java').read_text('utf-8')
    candidates = [('production', production)]
    if mutations:
        candidates.append(('omit-horizontal-listener', production.replace('|| name.equals("com.zte.controlcenter.view.ToggleSliderView$2")', '', 1)))
        candidates.append(('omit-attach-binding', production.replace('bindHorizontal(owner);', '/* missing attach fallback */', 1)))
        candidates.append(('omit-native-max-scope', production.replace('&& !method.getName().equals("getMax")', '', 1)))
        candidates.append(('omit-checked-listener-scope', production.replace(', "com.zte.controlcenter.view.ToggleSliderView$1"', '', 1)))
        candidates.append(('omit-mirror-scope', production.replace('&& !method.getName().equals("setMirror")', '', 1)))
    configured = os.environ.get('JAVA_HOME')
    jdk = Path(configured) / 'bin' if configured else Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
    with tempfile.TemporaryDirectory(prefix='duo-full-brightness-') as tmp:
        folder = Path(tmp)
        for name, value in FILES.items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, 'utf-8')
        hook = folder / 'ls/augment/com/hook/FullBrightnessHook.java'
        for name, source in candidates:
            hook.write_text(source, 'utf-8')
            subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '--release', '17', '-d', tmp,
                            *map(str, folder.rglob('*.java')), str(PRODUCTION / 'BrightnessRange.java')], check=True)
            result = subprocess.run([str(jdk / 'java'), '-cp', tmp, 'ls.augment.com.hook.TestFullBrightnessBinding'],
                                    capture_output=True, text=True, timeout=20)
            if name == 'production':
                if result.returncode:
                    raise AssertionError(result.stdout + result.stderr)
                print(result.stdout.strip())
            elif result.returncode == 0:
                raise AssertionError('Regression survived: ' + name)
            else:
                print('Caught regression: ' + name)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--mutations', action='store_true')
    run(parser.parse_args().mutations)
