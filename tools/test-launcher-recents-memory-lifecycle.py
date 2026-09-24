"""Execute the production Recents hook with Android/Xposed boundary doubles.

The fake view tree verifies lifecycle, visibility, ownership, and configuration
selection. It does not emulate Android typography, animation, or a physical phone.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    'ls/augment/com/LauncherOptions.java': 'package ls.augment.com;public class LauncherOptions {public static final int RECENTS_MEMORY_MAX_TOP_DP=2000;}',
    'android/graphics/Insets.java': 'package android.graphics;public class Insets {public int left,top,right,bottom;}',
    'android/view/WindowInsets.java': 'package android.view;public class WindowInsets {public android.graphics.Insets safe=new android.graphics.Insets();public android.graphics.Insets getInsetsIgnoringVisibility(int type){return safe;}public static class Type {public static int systemBars(){return 1;}public static int displayCutout(){return 2;}}}',
    'android/os/Looper.java': 'package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }',
    'android/os/SystemClock.java': 'package android.os; public class SystemClock { public static long now=10000; public static long elapsedRealtime(){return now;} }',
    'android/os/Handler.java': '''package android.os;
import java.util.*;
public class Handler {
    static final Map<Runnable,Long> queue=new LinkedHashMap<>(); public Handler(Looper l){}
    public boolean post(Runnable r){return postDelayed(r,0);}
    public boolean postDelayed(Runnable r,long delay){synchronized(queue){queue.put(r,SystemClock.now+delay);}return true;}
    public void removeCallbacks(Runnable r){synchronized(queue){queue.remove(r);}}
    public static void drain(){for(int n=0;n<100;n++){Runnable ready=null;synchronized(queue){for(Map.Entry<Runnable,Long> e:queue.entrySet())if(e.getValue()<=SystemClock.now){ready=e.getKey();break;}if(ready!=null)queue.remove(ready);}if(ready==null)return;ready.run();}throw new AssertionError("unbounded immediate callbacks");}
}''',
    'android/util/TypedValue.java': 'package android.util; public class TypedValue {public static final int COMPLEX_UNIT_SP=2;}',
    'android/util/DisplayMetrics.java': 'package android.util; public class DisplayMetrics {public float density=1;}',
    'android/content/res/Configuration.java': '''package android.content.res;
public class Configuration {public static final int ORIENTATION_LANDSCAPE=2,UI_MODE_NIGHT_MASK=48,UI_MODE_NIGHT_YES=32; public int orientation=1,uiMode=16;}''',
    'android/content/res/ColorStateList.java': '''package android.content.res;
public class ColorStateList {public final int color;private ColorStateList(int c){color=c;}public static ColorStateList valueOf(int c){return new ColorStateList(c);}}''',
    'android/content/res/TypedArray.java': '''package android.content.res;
public class TypedArray {public ColorStateList getColorStateList(int i){return ColorStateList.valueOf(0xccffffff);}public void recycle(){}}''',
    'android/content/res/Resources.java': '''package android.content.res;
import java.util.*;import android.util.DisplayMetrics;
public class Resources {public final Configuration config=new Configuration();public final DisplayMetrics metrics=new DisplayMetrics();public final Map<String,Integer> ids=new HashMap<>();public Configuration getConfiguration(){return config;}public DisplayMetrics getDisplayMetrics(){return metrics;}public int getIdentifier(String name,String type,String pkg){return ids.getOrDefault(name,0);}}''',
    'android/content/Context.java': '''package android.content;
import android.content.res.*;import android.app.ActivityManager;
public class Context {public static final String ACTIVITY_SERVICE="activity";public final Resources resources=new Resources();public final ActivityManager memory=new ActivityManager();public Context getApplicationContext(){return this;}public Resources getResources(){return resources;}public String getPackageName(){return "com.android.launcher3";}public Object getSystemService(String name){return memory;}public TypedArray obtainStyledAttributes(int[] attrs){return new TypedArray();}}''',
    'android/app/ActivityManager.java': '''package android.app;
public class ActivityManager {public volatile int samples;public volatile Thread sampledThread;public static class MemoryInfo {public long totalMem,availMem;}public void getMemoryInfo(MemoryInfo out){sampledThread=Thread.currentThread();samples++;out.totalMem=8L*1024*1024*1024;out.availMem=3L*1024*1024*1024;}}''',
    'android/R.java': 'package android;public final class R {public static final class attr {public static final int textColorPrimary=1;}}',
    'android/graphics/Color.java': '''package android.graphics;public class Color {public static final int WHITE=0xffffffff,BLACK=0xff000000;public static int parseColor(String value){if(value==null||!value.matches("#[A-Fa-f0-9]{8}"))throw new IllegalArgumentException();return (int)Long.parseLong(value.substring(1),16);}}''',
    'android/view/Gravity.java': 'package android.view;public class Gravity {public static final int LEFT=3,END=8388613,TOP=48,CENTER_VERTICAL=16;}',
    'android/view/View.java': '''package android.view;
import android.content.Context;import android.content.res.Resources;
public class View {
    public static final int VISIBLE=0,INVISIBLE=4,GONE=8,TEXT_DIRECTION_LOCALE=5,IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS=4;
    public final Context context;public ViewGroup parent;public int id,visibility=VISIBLE,windowVisibility=VISIBLE,width=1080,height=1920,accessibility,measuredHeight,measuredWidth;public float rotation;public boolean attached=true;public float alpha=1;public Object tag;public ViewGroup.LayoutParams params;
    public View(Context c){context=c;}public Context getContext(){return context;}public Resources getResources(){return context.getResources();}
    public ViewGroup getParent(){return parent;}public View getRootView(){return parent==null?this:parent.getRootView();}
    public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return visibility==VISIBLE&&(parent==null||parent.isShown());}
    public int getWindowVisibility(){return windowVisibility;}public void setVisibility(int v){visibility=v;}public int getVisibility(){return visibility;}
    public void setAlpha(float v){alpha=v;}public float getAlpha(){return alpha;}public int getWidth(){return width;}public int getHeight(){return height;}
    public void setTag(Object v){tag=v;}public void setClickable(boolean v){}public void setFocusable(boolean v){}public int getImportantForAccessibility(){return accessibility;}public void setImportantForAccessibility(int v){accessibility=v;}
    public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;}
    public void setPivotX(float v){}public void setPivotY(float v){}public void setRotation(float v){rotation=v;}public int getPaddingTop(){return 0;}public int getPaddingBottom(){return 0;}public WindowInsets insets;public WindowInsets getRootWindowInsets(){return insets;}public void getLocationInWindow(int[] out){out[0]=0;out[1]=0;}public int getMeasuredWidth(){return measuredWidth;}public int getPaddingLeft(){return 0;}public int getPaddingRight(){return 0;}public int getMeasuredHeight(){return measuredHeight;}
    public View findViewById(int value){return value!=0&&id==value?this:null;}
    public static class MeasureSpec {public static final int EXACTLY=0x40000000,AT_MOST=0x80000000,UNSPECIFIED=0;public static int makeMeasureSpec(int n,int mode){return n|mode;}}
}''',
    'android/view/ViewGroup.java': '''package android.view;
import android.content.Context;import java.util.*;
public class ViewGroup extends View {
    public final List<View> children=new ArrayList<>();public ViewGroup(Context c){super(c);}
    public static class LayoutParams {public static final int MATCH_PARENT=-1;public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
    public void addView(View v){children.add(v);v.parent=this;v.params=new android.widget.FrameLayout.LayoutParams(-2,-2);}
    public void removeView(View v){children.remove(v);v.parent=null;}
    public View findViewById(int id){View own=super.findViewById(id);if(own!=null)return own;for(View child:children){View result=child.findViewById(id);if(result!=null)return result;}return null;}
}''',
    'android/widget/FrameLayout.java': '''package android.widget;
import android.content.Context;import android.view.ViewGroup;
public class FrameLayout extends ViewGroup {public FrameLayout(Context c){super(c);}public static class LayoutParams extends ViewGroup.LayoutParams {public int gravity,topMargin,leftMargin;public LayoutParams(int w,int h){super(w,h);}}}''',
    'android/widget/TextView.java': '''package android.widget;
import android.content.Context;import android.content.res.ColorStateList;import android.view.View;
public class TextView extends View {
    public CharSequence text="";public float size=12;public ColorStateList colors=ColorStateList.valueOf(0xccffffff);public int gravity;
    public TextView(Context c){super(c);}public void setGravity(int v){gravity=v;}public void setTextDirection(int v){}public void setIncludeFontPadding(boolean v){}
    public void setTextSize(int unit,float v){size=v;}public void setText(CharSequence v){text=v;}public CharSequence getText(){return text;}
    public void setTextColor(ColorStateList c){colors=c;}public ColorStateList getTextColors(){return colors;}public void setPadding(int a,int b,int c,int d){}public void setPaddingRelative(int a,int b,int c,int d){}
    public void measure(int w,int h){int lines=text.toString().split("\\n",-1).length;measuredHeight=Math.round(size*1.3f*lines);measuredWidth=Math.min(w & 0x3fffffff,Math.round(text.length()*size*.5f));}
}''',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;
import java.util.*;import android.content.Context;
final class FeatureSettings {
    static final Map<String,String> values=new HashMap<>();static final List<Runnable> listeners=new ArrayList<>();static boolean verified=true;
    static boolean enabled(Context c,String k){return "1".equals(values.get(k));}static String text(Context c,String k,String fallback){return values.getOrDefault(k,fallback);}
    static int integer(Context c,String k,int fallback,int min,int max){return Math.max(min,Math.min(max,Integer.parseInt(text(c,k,""+fallback))));}
    static float decimal(Context c,String k,float fallback,float min,float max){return Math.max(min,Math.min(max,Float.parseFloat(text(c,k,""+fallback))));}
    static boolean hasVerifiedSnapshot(Context c){return verified;}static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}static void removeSnapshotListener(Runnable r){listeners.remove(r);}
    static final java.util.Map<String,String> diagnostics=new java.util.HashMap<>();
    static void diagnostic(android.content.Context c,String k,String v){diagnostics.put(k,v);}
    static void set(String k,String value){values.put("ls_augment_rm_recents_memory_"+k,value);for(Runnable listener:new ArrayList<>(listeners))listener.run();}
}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
public final class AugmentModule {
    interface Interceptor {Object intercept(Chain c)throws Throwable;}interface Chain {Object getThisObject();Object proceed()throws Throwable;}
    static class Registration {final Method method;final Interceptor interceptor;Registration(Method m,Interceptor i){method=m;interceptor=i;}}
    static class Builder {final Method method;Builder(Method m){method=m;}Registration intercept(Interceptor i){return new Registration(method,i);}}
    final Map<String,Registration> hooks=new LinkedHashMap<>();final List<Throwable> errors=new ArrayList<>();
    Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(m);}void registerFeatureHook(Registration r){hooks.put(r.method.getName(),r);}void logFeatureError(String name,Throwable error){errors.add(error);}
    void call(String name,Object owner,Object...args)throws Throwable {Registration r=hooks.get(name);if(r==null)throw new AssertionError("missing hook "+name);r.interceptor.intercept(new Chain(){public Object getThisObject(){return owner;}public Object proceed()throws Throwable {r.method.setAccessible(true);try{return r.method.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}});}
}''',
    'com/android/quickstep/views/RecentsView.java': '''package com.android.quickstep.views;
import android.widget.FrameLayout;import android.content.Context;
public class RecentsView extends FrameLayout {
    public static class Orientation {public float getDegreesRotated(){return degrees;}public int degrees;}public final Orientation orientation=new Orientation();public Orientation getPagedOrientationHandler(){return orientation;}public void setLayoutRotation(int touch,int display){orientation.degrees=touch;originals++;}private boolean mOverviewStateEnabled;protected float mContentAlpha=1f;public int originals;
    public RecentsView(Context c){super(c);}protected void onAttachedToWindow(){attached=true;originals++;}protected void onDetachedFromWindow(){attached=false;originals++;}
    protected void onLayout(boolean b,int l,int t,int r,int bottom){originals++;}public void setOverviewStateEnabled(boolean value){mOverviewStateEnabled=value;originals++;}
    public void setContentAlpha(float value){mContentAlpha=value;originals++;}public void setVisibility(int v){super.setVisibility(v);originals++;}protected void onWindowVisibilityChanged(int v){windowVisibility=v;originals++;}
}''',
    'ls/augment/com/hook/TestLauncherRecentsMemoryLifecycle.java': '''package ls.augment.com.hook;
import android.content.Context;import android.os.Handler;import android.view.*;import android.widget.*;import com.android.quickstep.views.RecentsView;
public class TestLauncherRecentsMemoryLifecycle {
    static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    static TextView label(FrameLayout host){for(View v:host.children)if("ls_augment_recents_memory".equals(v.tag))return (TextView)v;return null;}
    static void settle(FrameLayout host)throws Exception {for(int n=0;n<100;n++){Handler.drain();TextView t=label(host);if(t!=null&&t.visibility==View.VISIBLE)return;Thread.sleep(3);}throw new AssertionError("memory never became visible");}
    public static void main(String[] args)throws Throwable {
        AugmentModule module=new AugmentModule();LauncherRecentsMemoryHook.install(module,TestLauncherRecentsMemoryLifecycle.class.getClassLoader());
        check(module.hooks.size()==8,"all attested lifecycle methods registered");
        for(String variant:new String[]{"stock","260005","legacy-memory-container"}) {
            FeatureSettings.values.clear();Context context=new Context();FrameLayout host=new FrameLayout(context);RecentsView recents=new RecentsView(context);host.addView(recents);View task=new View(context);recents.addView(task);
            FrameLayout nativeMemory=null;
            if(variant.equals("legacy-memory-container")){context.resources.ids.put("recents_stack_memory_container",11);context.resources.ids.put("recents_stack_memory_available",12);nativeMemory=new FrameLayout(context);nativeMemory.id=11;nativeMemory.alpha=.7f;nativeMemory.accessibility=2;TextView nativeText=new TextView(context);nativeText.id=12;nativeText.setText("native original");nativeMemory.addView(nativeText);host.addView(nativeMemory);}
            int baseline=host.children.size();
            module.call("onAttachedToWindow",recents);module.call("setOverviewStateEnabled",recents,true);Handler.drain();
            check(label(host)==null,"module OFF creates no visible decoration "+variant);check(context.memory.samples==0,"OFF reads no RAM");
            if(nativeMemory!=null)check(nativeMemory.alpha==0f,"module OFF suppresses legacy memory independent of native switch");
            FeatureSettings.set("custom","1");settle(host);TextView text=label(host);
            check(FeatureSettings.diagnostics.get("ls_augment_rm_recents_memory_state").startsWith("visible;"),"visible diagnostic");check(text.text.toString().contains("总量 8.00 GB"),"ON uses physical RAM "+variant);check(context.memory.sampledThread!=Thread.currentThread(),"RAM sampled off UI thread");
            check(recents.children.size()==1&&recents.children.get(0)==task,"pager task membership unchanged");check(host.children.size()==baseline+1,"exactly one sibling decoration");
            FeatureSettings.set("content","2");Handler.drain();check(text.text.toString().equals("可用 3.00 GB"),"snapshot updates existing text");
            for(int i=0;i<4;i++){context.resources.config.orientation=i%2==0?1:2;FeatureSettings.set("style",i<2?"0":"1");FeatureSettings.set(i<2?"simple_size":"detailed_size",""+(21+i));FeatureSettings.set(i%2==0?"portrait_height":"landscape_height",""+(111+i));FeatureSettings.set(i%2==0?"portrait_top":"landscape_top",""+(31+i));Handler.drain();check(text.size==21+i,"unified style font "+i);FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)text.params;check(p.height==111+i&&p.topMargin==31+i,"orientation geometry "+i);}
            context.resources.config.orientation=1;FeatureSettings.set("landscape_top","50");FeatureSettings.set("landscape_left","16");FeatureSettings.set("portrait_top","36");
            module.call("setLayoutRotation",recents,90,0);Handler.drain();FrameLayout.LayoutParams rotated=(FrameLayout.LayoutParams)text.params;
            check(text.rotation==90&&rotated.leftMargin==1030&&rotated.topMargin==16,"portrait host follows landscape recents with transformed origin");
            check(rotated.height==114,"rotated recents uses landscape settings");
            module.call("setLayoutRotation",recents,270,0);Handler.drain();check(text.rotation==270&&rotated.leftMargin==50&&rotated.topMargin==1904,"reverse landscape anchor");
            context.resources.config.orientation=2;host.width=1920;host.height=1080;module.call("setLayoutRotation",recents,0,0);Handler.drain();check(text.rotation==0&&rotated.topMargin==50,"rotated Android window is not rotated twice");
            context.resources.config.orientation=1;host.width=1080;host.height=1920;module.call("setLayoutRotation",recents,0,0);Handler.drain();check(text.rotation==0&&rotated.topMargin==36,"return to portrait restores anchor and rotation");
            FeatureSettings.set("color_mode","1");context.resources.config.uiMode=16;module.call("onLayout",recents,false,0,0,1080,1920);Handler.drain();check(text.colors.color==0xff000000,"system light color");context.resources.config.uiMode=32;module.call("onLayout",recents,false,0,0,1080,1920);Handler.drain();check(text.colors.color==0xffffffff,"system dark color");
            FeatureSettings.set("color_mode","2");FeatureSettings.set("light_color","#FFFF00FF");FeatureSettings.set("dark_color","#FF00FF00");Handler.drain();check(text.colors.color==0xff00ff00,"custom dark color");context.resources.config.uiMode=16;module.call("onLayout",recents,false,0,0,1080,1920);Handler.drain();check(text.colors.color==0xffff00ff,"custom light color");FeatureSettings.set("light_color","invalid");Handler.drain();check(text.colors.color==0xff000000,"invalid color falls back");FeatureSettings.set("color_mode","0");Handler.drain();check(text.colors.color==0xccffffff,"native/theme color preserved");
            FeatureSettings.set("style","1");FeatureSettings.set("content","0");FeatureSettings.set("detailed_size","40");FeatureSettings.set("portrait_height","24");Handler.drain();check(((FrameLayout.LayoutParams)text.params).height==24&&text.size<40,"large multiline text shrinks within configured height");
            module.call("setContentAlpha",recents,.4f);Handler.drain();check(text.alpha==.4f,"decoration follows native content animation alpha");
            module.call("setOverviewStateEnabled",recents,false);check(text.visibility==View.GONE,"HOME hides immediately before queued callbacks");Handler.drain();check(text.visibility==View.GONE,"HOME cannot be reopened by pending update");
            module.call("setOverviewStateEnabled",recents,true);settle(host);module.call("onWindowVisibilityChanged",recents,View.INVISIBLE);check(text.visibility==View.GONE,"background window hides immediately");module.call("onWindowVisibilityChanged",recents,View.VISIBLE);settle(host);
            FeatureSettings.set("custom","0");check(text.visibility==View.GONE,"module OFF hides immediately");Handler.drain();if(nativeMemory!=null)check(nativeMemory.alpha==0f,"legacy native switch cannot bypass module OFF");
            FeatureSettings.set("custom","1");settle(host);check(label(host)==text,"ON reuses one decoration");check(recents.children.size()==1&&host.children.size()==baseline+1,"toggles never accumulate views");
            module.call("onDetachedFromWindow",recents);Handler.drain();check(host.children.size()==baseline,"detach removes only module decoration");check(FeatureSettings.listeners.isEmpty(),"detach unregisters settings listener");check(FeatureSettings.diagnostics.get("ls_augment_rm_recents_memory_state").startsWith("detached;"),"detached diagnostic");if(nativeMemory!=null)check(nativeMemory.alpha==.7f&&nativeMemory.accessibility==2,"detached legacy view returns original attributes");
            check(recents.originals>8,"native callbacks proceed");
        }
        if(!module.errors.isEmpty())throw new AssertionError("hook errors",module.errors.get(0));
        System.out.println("PASS LauncherRecentsMemory lifecycle "+checks+" checks; Android/Xposed boundary doubles, no device");
    }
}''',
}


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-recents-memory-') as directory:
        root = Path(directory)
        for name, text in SOURCES.items():
            path = root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding='utf-8')
        source_root = ROOT / 'android/app/src/main/java'
        files = list(root.rglob('*.java')) + [
            source_root / 'ls/augment/com/hook/LauncherRecentsMemoryHook.java',
            source_root / 'ls/augment/com/LauncherMemoryPresentation.java',
            source_root / 'ls/augment/com/LauncherMemoryLayout.java',
        ]
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(root / 'classes'), *map(str, files)], check=True)
        subprocess.run(['java', '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestLauncherRecentsMemoryLifecycle'], check=True)


if __name__ == '__main__':
    main()
