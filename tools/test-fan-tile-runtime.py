"""Run the production fan tile hook against an Android/OEM facade.

Checks independent activation, the actual OEM stopped-fan visibility
contract, capability feedback, native clicks/labels, and stale callback cancellation.
Real OEM layout and hardware still require device verification.
"""
from pathlib import Path
import ast
import os
import re
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
fixture_tree = ast.parse((ROOT / "tools/test-liquid-glass-control-center-runtime.py").read_text(encoding="utf-8"))
fixture = next(ast.literal_eval(node.value) for node in fixture_tree.body if isinstance(node, ast.Assign)
               and any(isinstance(name, ast.Name) and name.id == "FILES" for name in node.targets))
FILES = {name: fixture[name] for name in ["android/graphics/Rect.java", "android/util/DisplayMetrics.java", "android/view/ViewParent.java"]}
FILES.update({
"android/view/ViewParent.java": "package android.view;public interface ViewParent {ViewParent getParent();}",
"android/R.java": "package android;public final class R {public static final class id {public static final int background=1,progress=2;}public static final class attr {public static final int state_checked=3;}}",
"android/util/TypedValue.java": "package android.util;public class TypedValue {public static final int COMPLEX_UNIT_PX=0;}",
"android/os/Build.java": "package android.os;public class Build {public static String DEVICE=\"NX809J\",MODEL=\"NX809J\",PRODUCT=\"NX809J\";}",
"android/os/SystemClock.java": "package android.os;public class SystemClock {public static long elapsedRealtime(){return 1000;}}",
"android/os/Looper.java": "package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}",
"android/os/Handler.java": """package android.os;public class Handler {
public static final java.util.concurrent.ConcurrentLinkedQueue<Runnable> queue=new java.util.concurrent.ConcurrentLinkedQueue<>();
public final java.util.List<Runnable> delayed=new java.util.ArrayList<>();public Handler(Looper l){}
public void post(Runnable r){queue.add(r);}public void postDelayed(Runnable r,long delay){delayed.add(r);}
public void removeCallbacks(Runnable r){while(queue.remove(r)){}delayed.removeIf(x->x==r);}
public static void drain(){for(int i=0;i<100;i++){Runnable r=queue.poll();if(r==null)return;r.run();}throw new AssertionError("runaway main queue");}}""",
"android/os/Bundle.java": """package android.os;public class Bundle extends java.util.HashMap<String,Object> {
public Bundle(){}public Bundle(Bundle b){super(b);}public void putBoolean(String k,boolean v){put(k,v);}public void putInt(String k,int v){put(k,v);}
public void putLong(String k,long v){put(k,v);}public void putString(String k,String v){put(k,v);}public boolean getBoolean(String k){return getBoolean(k,false);}
public boolean getBoolean(String k,boolean d){return get(k) instanceof Boolean?(Boolean)get(k):d;}public int getInt(String k){return getInt(k,0);}
public int getInt(String k,int d){return get(k) instanceof Integer?(Integer)get(k):d;}public long getLong(String k){return getLong(k,0);}
public long getLong(String k,long d){return get(k) instanceof Long?(Long)get(k):d;}public String getString(String k,String d){return get(k) instanceof String?(String)get(k):d;}}""",
"android/net/Uri.java": "package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}",
"android/content/Context.java": """package android.content;public class Context {
public final ContentResolver resolver=new ContentResolver();public final android.content.res.Resources resources=new android.content.res.Resources();
public ContentResolver getContentResolver(){return resolver;}public android.content.res.Resources getResources(){return resources;}}""",
"android/content/ContentResolver.java": """package android.content;import android.os.Bundle;
public class ContentResolver {
public volatile boolean supported=true,manual,failRead,publishSelections;public volatile int selected,remembered=1,reads,selections,enabled,level=1,rpm,mode=1;
public volatile long revision=10;
public volatile java.util.concurrent.CountDownLatch entered,release,readEntered,readRelease;public Bundle lastCommand;
public Bundle call(android.net.Uri uri,String method,String arg,Bundle extras){
 Bundle b=new Bundle();b.putBoolean("ok",true);
 if(method.equals("fan_tile_select")){selections++;lastCommand=extras;java.util.concurrent.CountDownLatch gate=release;
  if(gate!=null){entered.countDown();try{gate.await();}catch(InterruptedException e){throw new AssertionError(e);}}
  selected=extras.getInt("level",0);if(selected>0)remembered=selected;revision++;
  ls.augment.com.hook.FeatureSettings.fixedActive=selected>0;ls.augment.com.hook.FeatureSettings.fixedLevel=remembered;ls.augment.com.hook.FeatureSettings.configRevision=revision;
  if(publishSelections)android.os.Handler.queue.add(ls.augment.com.hook.FeatureSettings::publish);return b;}
 reads++;if(failRead)return null;b.putBoolean("enhancementEnabled",true);b.putBoolean("supported",supported);b.putLong("revision",revision);
 b.putBoolean("manual",manual);b.putInt("selected",selected);b.putInt("rememberedLevel",remembered);b.putInt("mode",mode);
 b.putBoolean("hardwareValid",true);b.putLong("sampledAt",1000);b.putInt("enabled",enabled);b.putInt("level",level);b.putInt("rpm",rpm);
 java.util.concurrent.CountDownLatch gate=readRelease;if(gate!=null){readEntered.countDown();try{gate.await();}catch(InterruptedException e){throw new AssertionError(e);}}return b;}}
""",
"android/content/res/Resources.java": fixture["android/content/res/Resources.java"],
"android/content/res/ColorStateList.java": "package android.content.res;public class ColorStateList {public static ColorStateList valueOf(int color){return new ColorStateList();}public int getColorForState(int[] state,int fallback){return fallback;}}",
"android/graphics/drawable/Drawable.java": """package android.graphics.drawable;public class Drawable {private final android.graphics.Rect bounds=new android.graphics.Rect();
public android.graphics.Rect getBounds(){return bounds;}public void setBounds(android.graphics.Rect r){bounds.set(r);}public Drawable mutate(){return this;}
public ConstantState getConstantState(){return new ConstantState();}public static class ConstantState {public Drawable newDrawable(android.content.res.Resources r){return new Drawable();}}}""",
"android/graphics/drawable/GradientDrawable.java": "package android.graphics.drawable;public class GradientDrawable extends Drawable {public static final int OVAL=1;public void setColor(int c){}public void setCornerRadius(int r){}public void setShape(int s){}public void setSize(int w,int h){}}",
"android/graphics/drawable/ClipDrawable.java": "package android.graphics.drawable;public class ClipDrawable extends Drawable {public static final int HORIZONTAL=1;public ClipDrawable(Drawable d,int g,int o){}}",
"android/graphics/drawable/LayerDrawable.java": "package android.graphics.drawable;public class LayerDrawable extends Drawable {public LayerDrawable(Drawable[] d){}public void setId(int n,int id){}public void setLayerHeight(int n,int h){}public void setLayerGravity(int n,int g){}}",
"android/view/Gravity.java": "package android.view;public class Gravity {public static final int LEFT=1,CENTER=2,CENTER_VERTICAL=4,FILL_HORIZONTAL=8;}",
"android/view/ViewTreeObserver.java": """package android.view;public class ViewTreeObserver {public interface OnPreDrawListener {boolean onPreDraw();}
public final java.util.List<OnPreDrawListener> listeners=new java.util.ArrayList<>();public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}
public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}public boolean isAlive(){return true;}}""",
"android/view/View.java": """package android.view;import android.content.Context;public class View implements ViewParent {
public static final int VISIBLE=0,INVISIBLE=4,GONE=8,ACCESSIBILITY_LIVE_REGION_NONE=0;public final Context context;
public boolean attached=true,shown=true,enabled=true;public int visibility,width=200,height=80,id,clicks;public float alpha=1;
public ViewGroup parent;public ViewGroup.LayoutParams params=new ViewGroup.LayoutParams(-1,300);public android.graphics.drawable.Drawable background;
public final ViewTreeObserver tree=new ViewTreeObserver();public final java.util.List<OnAttachStateChangeListener> listeners=new java.util.ArrayList<>();
private final java.util.Map<Integer,Object> tags=new java.util.HashMap<>();private OnClickListener click;int pl,pt,pr,pb;
public interface OnClickListener {void onClick(View v);}public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
public View(Context c){context=c;}public Context getContext(){return context;}public ViewParent getParent(){return parent;}public boolean isShown(){return shown&&attached&&visibility==VISIBLE&&(parent==null||parent.isShown());}
public boolean isAttachedToWindow(){return attached;}public ViewTreeObserver getViewTreeObserver(){return tree;}public int getWidth(){return width;}
public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;}public void requestLayout(){}
public void setTag(int k,Object v){tags.put(k,v);}public Object getTag(int k){return tags.get(k);}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}
public void setOnClickListener(OnClickListener l){click=l;}public boolean performClick(){clicks++;if(click!=null)click.onClick(this);return true;}
public void setPadding(int l,int t,int r,int b){pl=l;pt=t;pr=r;pb=b;}public int getPaddingLeft(){return pl;}public int getPaddingTop(){return pt;}
public int getPaddingRight(){return pr;}public int getPaddingBottom(){return pb;}public void setMinHeight(int n){}public void setFocusable(boolean b){}
public void setContentDescription(String d){}public void setStateDescription(String d){}public void setAccessibilityLiveRegion(int n){}
public void setEnabled(boolean b){enabled=b;}public boolean isEnabled(){return enabled;}public void setAlpha(float f){alpha=f;}public void setVisibility(int v){visibility=v;}public int getVisibility(){return visibility;}
public android.graphics.drawable.Drawable getBackground(){return background;}public View findViewById(int n){return n==id?this:null;}
public void getDrawingRect(android.graphics.Rect r){r.set(0,0,width,height);}public void detach(){attached=false;for(OnAttachStateChangeListener l:listeners)l.onViewDetachedFromWindow(this);}
public void attach(){attached=true;for(OnAttachStateChangeListener l:listeners)l.onViewAttachedToWindow(this);}}
""",
"android/view/ViewGroup.java": """package android.view;public class ViewGroup extends View {
public static class LayoutParams {public static final int WRAP_CONTENT=-2;public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
public final java.util.List<View> children=new java.util.ArrayList<>();public ViewGroup(android.content.Context c){super(c);}
public void addView(View v,LayoutParams p){if(v.parent!=null)throw new AssertionError("already attached child");v.params=p;children.add(v);v.parent=this;}
public void addView(View v){addView(v,v.params);}public void removeView(View v){children.remove(v);v.parent=null;}
@Override public View findViewById(int n){View found=super.findViewById(n);if(found!=null)return found;for(View v:children){found=v.findViewById(n);if(found!=null)return found;}return null;}
public void offsetDescendantRectToMyCoords(View v,android.graphics.Rect r){}}
""",
"android/widget/LinearLayout.java": """package android.widget;public class LinearLayout extends android.view.ViewGroup {public static final int VERTICAL=1,HORIZONTAL=0;
public static class LayoutParams extends android.view.ViewGroup.LayoutParams {public LayoutParams(int w,int h){super(w,h);}public LayoutParams(int w,int h,int weight){super(w,h);}}
public LinearLayout(android.content.Context c){super(c);}public void setOrientation(int o){}}""",
"android/widget/FrameLayout.java": """package android.widget;public class FrameLayout extends android.view.ViewGroup {
public static class LayoutParams extends android.view.ViewGroup.LayoutParams {public LayoutParams(int w,int h){super(w,h);}}
public FrameLayout(android.content.Context c){super(c);}}""",
"android/widget/TextView.java": """package android.widget;public class TextView extends android.view.View {public String text="";public TextView(android.content.Context c){super(c);}
public void setText(String s){text=s;}public void setTextSize(float s){}public void setTextSize(int unit,float s){}public float getTextSize(){return 14;}
public Object getTypeface(){return null;}public void setTypeface(Object t){}public int getGravity(){return 0;}public void setGravity(int g){}
public void setTextColor(int c){}public int getCurrentTextColor(){return 0xff000000;}public void setMinLines(int n){}}""",
"android/widget/CheckedTextView.java": """package android.widget;public class CheckedTextView extends TextView {public boolean checked;public CheckedTextView(android.content.Context c){super(c);}
public void setChecked(boolean b){checked=b;}public boolean isChecked(){return checked;}public android.content.res.ColorStateList getCheckMarkTintList(){return null;}
public android.graphics.drawable.Drawable getCheckMarkDrawable(){return null;}public void setCheckMarkDrawable(android.graphics.drawable.Drawable d){}}""",
"android/widget/SeekBar.java": """package android.widget;public class SeekBar extends android.view.View {private int progress;public SeekBar(android.content.Context c){super(c);}
public interface OnSeekBarChangeListener {void onStartTrackingTouch(SeekBar b);void onProgressChanged(SeekBar b,int p,boolean u);void onStopTrackingTouch(SeekBar b);}
private OnSeekBarChangeListener listener;public void setOnSeekBarChangeListener(OnSeekBarChangeListener l){listener=l;}public void setProgress(int p){progress=p;if(listener!=null)listener.onProgressChanged(this,p,false);}
public int getProgress(){return progress;}public void setMax(int n){}public void setKeyProgressIncrement(int n){}public void setSplitTrack(boolean b){}
public void userChange(int p){if(enabled){progress=p;listener.onProgressChanged(this,p,true);}}
public void setProgressDrawable(android.graphics.drawable.Drawable d){}public void setThumb(android.graphics.drawable.Drawable d){}public void setThumbOffset(int n){}
public void setProgressTintList(android.content.res.ColorStateList c){}public void setThumbTintList(android.content.res.ColorStateList c){}}""",
"android/widget/Toast.java": "package android.widget;public class Toast {public static final int LENGTH_SHORT=0;public static Toast makeText(android.content.Context c,String s,int n){return new Toast();}public void show(){}}",
"ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;import android.content.Context;import ls.augment.com.ConfigSchema;
public class FeatureSettings {public static String evidence="";static String diagnosticValue(Context c,String k){return evidence;}public static boolean active,fixedActive;public static int fixedLevel=1,invalidations;public static long configRevision=10;public static final java.util.Set<Runnable> listeners=new java.util.HashSet<>();
static boolean enabled(Context c,String k,boolean fallback){return ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED.equals(k)?active:ConfigSchema.FAN_FIXED_ENABLED.equals(k)?fixedActive:true;}
static int integer(Context c,String k,int d,int min,int max){return ConfigSchema.FAN_FIXED_LEVEL.equals(k)?fixedLevel:d;}
static String text(Context c,String k,String d){return d;}static boolean hasVerifiedSnapshot(Context c){return true;}
static ls.augment.com.ConfigSnapshot snapshot(Context c){java.util.Map<String,String> values=new java.util.HashMap<>();
 values.put(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED,active?"1":"0");values.put(ConfigSchema.GAME_MASTER,"1");values.put(ConfigSchema.FAN_FIXED_ENABLED,fixedActive?"1":"0");values.put(ConfigSchema.FAN_FIXED_LEVEL,String.valueOf(fixedLevel));
 values.put(ConfigSchema.FAN_TILE_REQUEST,"");values.put(ConfigSchema.FAN_CALIBRATION_REQUEST,"");return new ls.augment.com.ConfigSnapshot(configRevision,values);}
static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}
static void removeSnapshotListener(Runnable r){listeners.remove(r);}static void invalidateSnapshot(){invalidations++;}
public static void publish(){for(Runnable r:new java.util.ArrayList<>(listeners))r.run();}
public static void set(boolean value){active=value;publish();}}
""",
"ls/augment/com/ConfigSnapshot.java": """package ls.augment.com;public final class ConfigSnapshot {
public final long revision;private final java.util.Map<String,String> values;
public ConfigSnapshot(long revision,java.util.Map<String,String> values){this.revision=revision;this.values=java.util.Map.copyOf(values);}public String get(String key){return values.get(key);}}
""",
"ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;public class AugmentModule {
public interface Interceptor {Object apply(Chain c)throws Throwable;}public interface Chain {Object proceed()throws Throwable;Object getThisObject();Object getArg(int n);}
public class Hook {String name;Interceptor interceptor;Hook(String n){name=n;}public Hook intercept(Interceptor i){interceptor=i;return this;}}
public final java.util.Map<String,Hook> hooks=new java.util.HashMap<>();public Hook prepareFeatureHook(java.lang.reflect.Method m,String n,boolean b){return new Hook(n);}
public void registerFeatureHook(Hook h){hooks.put(h.name,h);}public void logFeatureError(String tag,Throwable e){throw new AssertionError(tag,e);}public void logFeatureInfo(String s){}}
""",
"com/zte/mifavor/views/CoolingFanPanel.java": """package com.zte.mifavor.views;import android.widget.*;import android.view.View;public class CoolingFanPanel extends FrameLayout {
public CheckedTextView mModeCheck1,mModeCheck2;public LinearLayout mEditContainer;public TextView mEmptyDesc;
public String mCurrentMode="均衡散热";public int nativeClicks;public boolean nativeEnabled;
public java.util.function.Consumer<Boolean> afterSwitchVisibility;
public CoolingFanPanel(android.content.Context c){super(c);mEditContainer=new LinearLayout(c);mEditContainer.params.height=200;addView(mEditContainer);
 mModeCheck1=new CheckedTextView(c);mModeCheck2=new CheckedTextView(c);mModeCheck1.setOnClickListener(this::onClick);mModeCheck2.setOnClickListener(this::onClick);mEditContainer.addView(mModeCheck1);mEditContainer.addView(mModeCheck2);
 mEmptyDesc=new TextView(c);mEmptyDesc.setText("风扇已关闭");addView(mEmptyDesc);updatePanel(mCurrentMode,java.util.List.of("均衡散热","疾速散热"),false);}
public void onFinishInflate(){}
public void updatePanel(String mode,java.util.List<String> modes,boolean enabled){mCurrentMode=mode;if(!modes.isEmpty()){mModeCheck1.setText(modes.get(0));mModeCheck2.setText(modes.get(1));}updateDataSwitch();updateSwitchVisibility(enabled);}
public void updateDataSwitch(){mModeCheck1.setChecked(mCurrentMode.equals(mModeCheck1.text));mModeCheck2.setChecked(mCurrentMode.equals(mModeCheck2.text));}
public void updateSwitchVisibility(boolean enabled){nativeEnabled=enabled;mEditContainer.setVisibility(enabled?View.VISIBLE:View.INVISIBLE);mEmptyDesc.setVisibility(enabled?View.INVISIBLE:View.VISIBLE);if(afterSwitchVisibility!=null)afterSwitchVisibility.accept(enabled);}
public void onClick(android.view.View v){nativeClicks++;if(v instanceof TextView)mCurrentMode=((TextView)v).text;updateDataSwitch();}}
""",
"com/zte/mifavor/qs/QSDetail.java": """package com.zte.mifavor.qs;public class QSDetail extends android.view.ViewGroup {
public boolean mAnimatingOpen,mClosingDetail;public QSDetail(android.content.Context c){super(c);}}
""",
"com/zte/mifavor/qs/QsDetailModule.java": "package com.zte.mifavor.qs;public class QsDetailModule {public static class RoundCornerDrawable extends android.graphics.drawable.Drawable {}}",
"com/zte/qs/tiles/CoolingFanTile.java": """package com.zte.qs.tiles;public class CoolingFanTile {public android.content.Context mContext;
public CoolingFanTile(android.content.Context c){mContext=c;}public void handleSetListening(boolean b){}public void handleUpdateState(State s,Object arg){s.label="原厂风扇";}
public void onChanged(){}public static class State {public boolean value=true;public String label;}}
""",
"ls/augment/com/hook/TestFanTileRuntime.java": r'''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.concurrent.*;import java.util.function.*;import android.content.*;import android.os.*;import android.view.*;import com.zte.mifavor.views.*;import com.zte.mifavor.qs.*;import com.zte.qs.tiles.*;
public class TestFanTileRuntime {
static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
static Object get(Object o,String n)throws Exception {Field f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
static Object uncheckedGet(Object o,String n){try{return get(o,n);}catch(Exception error){throw new AssertionError(error);}}
static Object call(Object o,String n,Class<?>[] types,Object...args)throws Exception {Method m=o.getClass().getDeclaredMethod(n,types);m.setAccessible(true);return m.invoke(o,args);}
static void call(Object o,String n)throws Exception {call(o,n,new Class<?>[0]);}
static void workerBarrier()throws Exception {Field field=FanTileHook.class.getDeclaredField("WORKER");field.setAccessible(true);((ExecutorService)field.get(null)).submit(()->{}).get(1,TimeUnit.SECONDS);}
static Object state(CoolingFanPanel root)throws Exception {Class<?> c=Class.forName("ls.augment.com.hook.FanTileHook$Panel");Constructor<?> ctor=c.getDeclaredConstructor(ViewGroup.class);ctor.setAccessible(true);Object s=ctor.newInstance(root);root.setTag(0x7e0f0349,s);return s;}
static void await(BooleanSupplier condition)throws Exception {long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);while(!condition.getAsBoolean()){Handler.drain();if(System.nanoTime()>end)throw new AssertionError("condition timed out");Thread.sleep(2);}Handler.drain();}
static Object interceptArgs(AugmentModule module,String key,Object owner,Object[] args,Runnable nativeAction)throws Throwable {return module.hooks.get(key).interceptor.apply(new AugmentModule.Chain(){public Object getThisObject(){return owner;}public Object getArg(int n){return args[n];}public Object proceed(){nativeAction.run();return "native-result";}});}
static Object intercept(AugmentModule module,String key,Object owner,Object arg,Runnable nativeAction)throws Throwable {return interceptArgs(module,key,owner,new Object[]{arg},nativeAction);}
static void toggle(AugmentModule module,CoolingFanPanel root,boolean enabled)throws Throwable {Context c=root.getContext();c.resolver.manual=enabled;c.resolver.enabled=enabled?1:0;c.resolver.rpm=enabled?4000:0;intercept(module,"fan.tile.updateSwitchVisibility",root,enabled,()->root.updateSwitchVisibility(enabled));}
static boolean visible(Object s)throws Exception {return ((View)get(s,"fixed")).isShown();}
static boolean enabled(Object s)throws Exception {return ((View)get(s,"fixed")).isEnabled();}
static String status(Object s)throws Exception {return ((android.widget.TextView)get(s,"status")).text;}
static void awaitReady(Object s)throws Exception {await(()->((Bundle)uncheckedGet(s,"snapshot")).getBoolean("ok")&&!((Boolean)uncheckedGet(s,"reading"))&&((Boolean)uncheckedGet(s,"enhanced")));}
public static void main(String[] args)throws Throwable {
class Base {public void update(){}public android.widget.CheckedTextView control;}class Derived extends Base {}
class Wrong {public static void update(){}public String control;}
check(FanTileHook.checkedMethod(Derived.class,"update").getDeclaringClass()==Base.class,"inherited OEM method resolves");
check(FanTileHook.checkedField(Derived.class,"control",android.widget.CheckedTextView.class).getDeclaringClass()==Base.class,"inherited typed OEM field resolves");
boolean rejected=false;try{FanTileHook.checkedMethod(Wrong.class,"update");}catch(IllegalStateException expected){rejected=true;}check(rejected,"static method cannot impersonate instance hook");
rejected=false;try{FanTileHook.checkedField(Wrong.class,"control",android.widget.CheckedTextView.class);}catch(IllegalStateException expected){rejected=true;}check(rejected,"wrong field type rejected");
ClassLoader missing=new ClassLoader(TestFanTileRuntime.class.getClassLoader()){protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException {
if(n.equals("com.zte.qs.tiles.CoolingFanTile"))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
AugmentModule partial=new AugmentModule();try{FanTileHook.install(partial,missing);}catch(AssertionError expected){}check(partial.hooks.isEmpty(),"missing tile contract rejected before any panel hook");
Context context=new Context();CoolingFanPanel root=new CoolingFanPanel(context);root.id=context.getResources().getIdentifier("qs_detail_container","id","com.android.systemui");
QSDetail detail=new QSDetail(context);QsDetailModule.RoundCornerDrawable bg=new QsDetailModule.RoundCornerDrawable();android.graphics.Rect original=new android.graphics.Rect(1,2,100,150);bg.setBounds(original);detail.background=bg;detail.addView(root);
AugmentModule module=new AugmentModule();check(FanTileHook.install(module,TestFanTileRuntime.class.getClassLoader())>0,"hooks installed");
interceptArgs(module,"fan.tile.onFinishInflate",root,new Object[0],root::onFinishInflate);Object s=root.getTag(0x7e0f0349);check(s!=null,"real OEM inflation hook creates the panel adapter");
final int[] restoreCallbacks={0};root.afterSwitchVisibility=(value)->{
 if(!((Boolean)uncheckedGet(s,"restoring")))return;
 restoreCallbacks[0]++;
 try{call(s,"onNativeUpdated",new Class<?>[]{String.class,Boolean.class},"updateSwitchVisibility",value);}
 catch(Exception error){throw new AssertionError("restoring OEM method callback failed",error);}
};
Handler.drain();check(root.mEditContainer.children.size()==2,"default off must retain original children");check(root.params.height==300&&root.mEditContainer.params.height==200,"default off must retain native heights");
check(root.mEditContainer.getVisibility()==View.INVISIBLE&&root.mEmptyDesc.isShown(),"disabled enhancement retains the actual OEM stopped-fan layout");
check(context.resolver.reads==0&&context.resolver.selections==0,"default off must perform no fan commands or polling");
check("native-result".equals(intercept(module,"fan.tile.native_mode",root,root.mModeCheck1,()->root.onClick(root.mModeCheck1)))&&root.nativeClicks==1,"disabled native click passes through");
FeatureSettings.set(true);awaitReady(s);check(root.mEditContainer.children.size()==5&&root.params.height==-2&&root.mEditContainer.params.height==-2,"enabled panel expands with OEM content");
check(((android.widget.TextView)get(s,"fixed")).text.equals("固定转速"),"named fixed-speed choice");check(context.resolver.selections==0,"toggle must not enable fixed speed or start fan");
check(!visible(s)&&root.mEditContainer.getVisibility()==View.INVISIBLE&&root.mEmptyDesc.isShown(),"enhancement preserves the original hidden settings container while the OEM fan is stopped");
check(context.resolver.enabled==0&&context.resolver.rpm==0&&context.resolver.selections==0,"enabling enhancement while stopped does not select a speed or start the fan");
check(root.mModeCheck1.getVisibility()==View.VISIBLE&&root.mModeCheck2.getVisibility()==View.VISIBLE,"enhancement does not separately change original mode-row visibility");
toggle(module,root,true);call(s,"read");awaitReady(s);
check(visible(s)&&enabled(s)&&root.mModeCheck1.isShown()&&root.mModeCheck2.isShown()&&!root.mEmptyDesc.isShown(),"original fan-on switch exposes fixed configuration alongside both OEM modes");
((View)get(s,"fixed")).performClick();await(()->((Bundle)uncheckedGet(s,"snapshot")).getInt("selected")==1&&!((Boolean)uncheckedGet(s,"sending")));
((android.widget.SeekBar)get(s,"slider")).userChange(3);await(()->((Bundle)uncheckedGet(s,"snapshot")).getInt("selected")==4&&!((Boolean)uncheckedGet(s,"sending")));
check(((android.widget.CheckedTextView)get(s,"fixed")).isChecked()&&((android.widget.SeekBar)get(s,"slider")).getProgress()==3,"fixed configuration can select and remember fourth level while the OEM fan is on");
int selectionsBeforeToggle=context.resolver.selections;toggle(module,root,false);call(s,"read");awaitReady(s);
check(!visible(s)&&!((View)get(s,"slider")).isShown()&&root.mEditContainer.getVisibility()==View.INVISIBLE&&root.mEmptyDesc.isShown(),"original fan-off switch hides all settings and displays the OEM stopped-fan description");
check(context.resolver.selected==4&&context.resolver.enabled==0&&context.resolver.rpm==0&&context.resolver.selections==selectionsBeforeToggle,"original fan-off keeps the saved fixed selection without extra enhancement commands");
toggle(module,root,true);call(s,"read");awaitReady(s);
check(visible(s)&&enabled(s)&&((android.widget.CheckedTextView)get(s,"fixed")).isChecked()&&((android.widget.SeekBar)get(s,"slider")).getProgress()==3,"original fan-on restores the saved fixed configuration in the existing panel");
check(context.resolver.selections==selectionsBeforeToggle,"original on-off transitions do not submit another fixed selection");
toggle(module,root,false);call(s,"read");awaitReady(s);
FeatureSettings.set(false);check(root.mEditContainer.children.size()==2&&root.mEditContainer.getVisibility()==View.INVISIBLE&&root.mEmptyDesc.isShown(),"closing enhancement restores the latest OEM stopped-fan description and layout");
check(restoreCallbacks[0]==1,"reflective restoration dispatches the original method hook while restoring is true");
check(root.mModeCheck1.isChecked()&&!root.mModeCheck2.isChecked(),"restoration callback does not overwrite saved OEM radio checks with fixed-mode unchecked controls");
check(context.resolver.selected==4&&context.resolver.enabled==0,"closing enhancement preserves remembered configuration without starting fan");
FeatureSettings.set(true);awaitReady(s);toggle(module,root,true);call(s,"read");awaitReady(s);
call(s,"resizeNativeBackground");check(!bg.getBounds().equals(original),"enabled extension may resize native background");
context.resolver.selected=3;call(s,"read");await(()->!root.mModeCheck1.isChecked()&&!root.mModeCheck2.isChecked());
context.resolver.mode=0;interceptArgs(module,"fan.tile.updatePanel",root,new Object[]{"疾速散热",java.util.List.of("均衡散热","疾速散热"),true},()->root.updatePanel("疾速散热",java.util.List.of("均衡散热","疾速散热"),true));
check(!root.mModeCheck1.isChecked()&&!root.mModeCheck2.isChecked(),"active fixed selection clears the visible OEM checks before restoring the latest mode");
FeatureSettings.fixedActive=true;FeatureSettings.fixedLevel=3;
CoolingFanTile tile=new CoolingFanTile(context);CoolingFanTile.State tileState=new CoolingFanTile.State();intercept(module,"fan.tile.label",tile,tileState,()->tile.handleUpdateState(tileState,null));check(tileState.label.equals("固定三档"),"enabled label shows explicit fixed level");
int callbacksBeforeLatestRestore=restoreCallbacks[0];
FeatureSettings.set(false);check(root.mEditContainer.children.size()==2,"turning off an open panel removes all extra controls");check(root.params.height==300&&root.mEditContainer.params.height==200,"turning off restores original heights");
check(restoreCallbacks[0]==callbacksBeforeLatestRestore+1,"restoring the latest OEM mode also passes through its real hooked visibility method");
check(root.mEditContainer.isShown()&&!root.mEmptyDesc.isShown(),"closing enhancement after OEM fan-on restores its current visible mode layout");
check(bg.getBounds().equals(original)&&root.tree.listeners.isEmpty(),"turning off restores drawable bounds and removes resize listener");check(!root.mModeCheck1.isChecked()&&root.mModeCheck2.isChecked(),"turning off restores the latest OEM mode rather than the original saved mode");
intercept(module,"fan.tile.label",tile,tileState,()->tile.handleUpdateState(tileState,null));check(tileState.label.equals("原厂风扇"),"turning off restores native tile label");
int reads=context.resolver.reads;call(s,"read");check(context.resolver.reads==reads,"turned-off panel stops provider polling");
int selectionsBeforeReopen=context.resolver.selections;FeatureSettings.set(true);awaitReady(s);check(context.resolver.selections==selectionsBeforeReopen,"reopening only restores panel without selecting speed");
context.resolver.entered=new CountDownLatch(1);context.resolver.release=new CountDownLatch(1);final int[] deferredNative={0};
long requestRevision=context.resolver.revision;
call(s,"select",new Class<?>[]{int.class,Runnable.class},0,(Runnable)()->deferredNative[0]++);check(context.resolver.entered.await(1,TimeUnit.SECONDS),"selection entered worker");
check(context.resolver.lastCommand.size()==2&&context.resolver.lastCommand.getInt("level",-1)==0&&context.resolver.lastCommand.getLong("revision",-1)==requestRevision,"commands carry level and current generation revision");
FeatureSettings.set(false);FeatureSettings.set(true);context.resolver.release.countDown();workerBarrier();Handler.drain();FeatureSettings.publish();awaitReady(s);check(deferredNative[0]==0,"old selection must not replay OEM click after closing and reopening");
check(context.resolver.selections==selectionsBeforeReopen+1,"reopening must not issue an additional selection");
intercept(module,"fan.tile.label",tile,tileState,()->tile.handleUpdateState(tileState,null));FeatureSettings.set(false);
intercept(module,"fan.tile.label",tile,tileState,()->{});check(tileState.label.equals("原厂风扇"),"native label restores even when OEM retains its old field on a config-only refresh");
FeatureSettings.set(true);awaitReady(s);
FeatureSettings.fixedActive=true;FeatureSettings.fixedLevel=4;context.resolver.selected=4;context.resolver.remembered=4;call(s,"read");awaitReady(s);
root.detach();check(root.mEditContainer.children.size()==2&&!FeatureSettings.listeners.contains(get(s,"configurationListener")),"detachment restores native panel and removes snapshot listener");
context.resolver.readEntered=new CountDownLatch(1);context.resolver.readRelease=new CountDownLatch(1);
long attachStarted=System.nanoTime();root.attach();
check(System.nanoTime()-attachStarted<TimeUnit.MILLISECONDS.toNanos(100),"reusing an OEM panel does not block the opening frame on provider reads");
check(root.mEditContainer.children.size()==5&&visible(s),"reused OEM panel mounts fixed configuration synchronously before provider reply");
check(((android.widget.CheckedTextView)get(s,"fixed")).isChecked()&&((android.widget.SeekBar)get(s,"slider")).getProgress()==3&&((View)get(s,"extra")).isShown(),"reused panel keeps the saved fixed choice and fourth-level controls in its opening frame");
Handler.drain();check(context.resolver.readEntered.await(1,TimeUnit.SECONDS),"reused panel telemetry read enters delayed provider worker");
check(root.mEditContainer.children.size()==5&&visible(s)&&context.resolver.selections==selectionsBeforeReopen+1,"delayed provider reply cannot hide fixed settings or submit another selection");
context.resolver.readRelease.countDown();context.resolver.readRelease=null;awaitReady(s);check(root.mEditContainer.children.size()==5&&context.resolver.selections==selectionsBeforeReopen+1,"reattaching cannot activate fixed speed");
context.resolver.publishSelections=true;int nativeBeforePublication=root.nativeClicks;
intercept(module,"fan.tile.native_mode",root,root.mModeCheck1,()->root.onClick(root.mModeCheck1));workerBarrier();Handler.drain();
check(root.nativeClicks==nativeBeforePublication+1&&root.mCurrentMode.equals("均衡散热"),"publishing the successful selection configuration before IPC reply must still execute the chosen OEM native mode once");
context.resolver.publishSelections=false;call(s,"read");awaitReady(s);
context.resolver.readEntered=new CountDownLatch(1);context.resolver.readRelease=new CountDownLatch(1);call(s,"read");
check(context.resolver.readEntered.await(1,TimeUnit.SECONDS),"old-revision metadata sample is held in the provider worker");
FeatureSettings.fixedActive=true;FeatureSettings.fixedLevel=5;FeatureSettings.configRevision=context.resolver.revision+1;FeatureSettings.publish();
check(((android.widget.CheckedTextView)get(s,"fixed")).isChecked()&&((android.widget.SeekBar)get(s,"slider")).getProgress()==4&&((Bundle)get(s,"snapshot")).getInt("selected")==5,"new configuration revision updates saved fifth-level controls while an older hardware sample is in flight");
Handler.drain();
context.resolver.selected=5;context.resolver.remembered=5;context.resolver.revision=FeatureSettings.configRevision;context.resolver.readRelease.countDown();workerBarrier();
Runnable oldReply=Handler.queue.poll();check(oldReply!=null,"old-revision provider completion is queued for the main thread");oldReply.run();
check(((Bundle)get(s,"snapshot")).getInt("selected")==5&&((android.widget.SeekBar)get(s,"slider")).getProgress()==4,"stale provider revision cannot replace the newer saved selection before a fresh reply");
context.resolver.readRelease=null;awaitReady(s);check(((Bundle)get(s,"snapshot")).getLong("revision")==FeatureSettings.configRevision,"stale sample automatically schedules fresh metadata without reopening the panel");
context.resolver.supported=false;call(s,"read");await(()->!((View)uncheckedGet(s,"fixed")).isEnabled());
check(visible(s)&&root.mEditContainer.children.size()==5,"unavailable hardware capability retains the requested fixed configuration UI");
check(status(s).contains("未验证")||status(s).contains("就绪")||status(s).contains("不可用"),"unavailable capability gives an explicit reason instead of silently hiding controls");
int selectionsBeforeUnsupported=context.resolver.selections;((android.widget.SeekBar)get(s,"slider")).userChange(1);
check(context.resolver.selections==selectionsBeforeUnsupported,"unavailable capability disables interactive fixed level commands");
int nativeBeforeUnsupported=root.nativeClicks;intercept(module,"fan.tile.native_mode",root,root.mModeCheck1,()->root.onClick(root.mModeCheck1));
check(root.nativeClicks==nativeBeforeUnsupported+1&&context.resolver.selections==selectionsBeforeUnsupported,"unavailable fixed capability does not intercept the original fan mode action");
context.resolver.supported=true;context.resolver.selected=4;call(s,"read");await(()->((View)uncheckedGet(s,"fixed")).isEnabled());
context.resolver.failRead=true;call(s,"read");await(()->!((Bundle)uncheckedGet(s,"snapshot")).getBoolean("ok"));
check(visible(s)&&!enabled(s)&&root.mEditContainer.children.size()==5,"temporary provider failure retains the requested controls and disables unavailable commands");
check(((android.widget.CheckedTextView)get(s,"fixed")).isChecked()&&((android.widget.SeekBar)get(s,"slider")).getProgress()==3,"temporary provider failure preserves the last verified selected level");
check(status(s).contains("暂时不可用"),"temporary provider failure reports an actionable unavailable state");
context.resolver.failRead=false;call(s,"read");awaitReady(s);check(enabled(s),"provider recovery makes existing controls usable again without reopening");
FeatureSettings.set(false);Build.DEVICE=Build.MODEL=Build.PRODUCT="NX769J";context.resolver.supported=true;reads=context.resolver.reads;FeatureSettings.set(true);Handler.drain();
check(root.mEditContainer.children.size()==2&&context.resolver.reads==reads,"unverified device cannot show controls or access fan provider");
Build.DEVICE=Build.MODEL=Build.PRODUCT="NX819J";
FeatureSettings.evidence="hardware_identity=firmware-other;capability=verified_levels_1_5;level_writes=1;fan_enable_writes=0";FeatureSettings.publish();Handler.drain();
check(root.mEditContainer.children.size()==2&&context.resolver.reads==reads,"stale firmware evidence keeps native controls");
FeatureSettings.evidence=FeatureSettings.evidence.replace("firmware-other","firmware-test");FeatureSettings.publish();awaitReady(s);
check(root.mEditContainer.children.size()==5&&enabled(s),"new device uses verified runtime evidence for controls and commands");
FeatureSettings.evidence="";FeatureSettings.publish();Handler.drain();
check(root.mEditContainer.children.size()==2,"revoked capability restores native panel");
root.detach();check(FeatureSettings.listeners.isEmpty(),"all panel listeners released");
Build.DEVICE=Build.MODEL=Build.PRODUCT="NX809J";FeatureSettings.fixedActive=true;FeatureSettings.fixedLevel=3;
Context initialContext=new Context();initialContext.resolver.selected=3;initialContext.resolver.remembered=3;initialContext.resolver.manual=true;initialContext.resolver.enabled=1;
initialContext.resolver.readEntered=new CountDownLatch(1);initialContext.resolver.readRelease=new CountDownLatch(1);
CoolingFanPanel initialRoot=new CoolingFanPanel(initialContext);initialRoot.updatePanel("均衡散热",java.util.List.of("均衡散热","疾速散热"),true);
long inflateStarted=System.nanoTime();interceptArgs(module,"fan.tile.onFinishInflate",initialRoot,new Object[0],initialRoot::onFinishInflate);Object initialState=initialRoot.getTag(0x7e0f0349);
check(System.nanoTime()-inflateStarted<TimeUnit.MILLISECONDS.toNanos(100),"initial fixed UI does not block the opening frame on provider or root access");
check(initialRoot.mEditContainer.children.size()==5&&visible(initialState),"initial OEM panel mounts the fixed entry in the same inflation call as the native modes");
check(((android.widget.CheckedTextView)get(initialState,"fixed")).isChecked()&&((android.widget.SeekBar)get(initialState,"slider")).getProgress()==2&&((View)get(initialState,"extra")).isShown(),"initial panel reads saved third-level choice from the local configuration cache before telemetry");
check(!initialRoot.mModeCheck1.isChecked()&&!initialRoot.mModeCheck2.isChecked(),"initial saved fixed choice cannot briefly show an OEM native mode as selected");
check(!((Bundle)get(initialState,"snapshot")).getBoolean("ok")&&!enabled(initialState)&&!((View)get(initialState,"slider")).isEnabled(),"initial configuration display does not authorize hardware commands before provider validation");
check(initialContext.resolver.reads==0&&initialContext.resolver.selections==0,"initial UI performs no synchronous provider IPC or selection command");
Handler.drain();check(initialContext.resolver.readEntered.await(1,TimeUnit.SECONDS),"initial metadata read enters delayed provider worker");
check(visible(initialState)&&((View)get(initialState,"extra")).isShown()&&!enabled(initialState)&&initialContext.resolver.selections==0,"blocked provider retains the saved settings display with commands safely disabled");
FeatureSettings.set(false);check(initialRoot.mEditContainer.children.size()==2&&initialRoot.mModeCheck1.isChecked()&&!initialRoot.mModeCheck2.isChecked(),"closing enhancement immediately restores original modes even while provider is blocked");
initialContext.resolver.readRelease.countDown();workerBarrier();Handler.drain();
check(initialRoot.mEditContainer.children.size()==2&&initialContext.resolver.selections==0,"late initial provider callback cannot remount closed fixed UI or submit a command");
initialRoot.detach();check(FeatureSettings.listeners.isEmpty(),"initial panel releases its configuration listener");
System.out.println("PASS production FanTileHook runtime: "+checks+" checks (facade; real OEM visuals and hardware unverified)");
}}
''',
})

hook = (SRC / "hook/FanTileHook.java").read_text(encoding="utf-8")
policy = (SRC / "FanTilePolicy.java").read_text(encoding="utf-8")
schema = (SRC / "ConfigSchema.java").read_text(encoding="utf-8")
constants = sorted(set(re.findall(r"ConfigSchema\.([A-Z][A-Z0-9_]+)",
                                  hook + policy + FILES["ls/augment/com/hook/FeatureSettings.java"])))
schema_constants = dict(re.findall(r'public static final String (\w+) = "([^"]+)";', schema))
FILES["ls/augment/com/ConfigSchema.java"] = "package ls.augment.com;public class ConfigSchema {" + "".join(
    f'public static final String {name}="{schema_constants[name]}";' for name in constants) + "}"
FILES["ls/augment/com/FanTilePolicy.java"] = policy
FILES["ls/augment/com/FanCapabilityEvidence.java"] = (SRC / "FanCapabilityEvidence.java").read_text(encoding="utf-8")
FILES["ls/augment/com/FanHardwareIdentity.java"]='package ls.augment.com;public class FanHardwareIdentity {public static String current(){return "firmware-test";}}'
FILES["ls/augment/com/FanCalibrationData.java"] = (SRC / "FanCalibrationData.java").read_text(encoding="utf-8")
FILES["ls/augment/com/hook/FanTileHook.java"] = hook


def java_tool(name):
    found = shutil.which(name)
    if found:
        return found
    candidate = Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin" / (name + (".exe" if os.name == "nt" else ""))
    if candidate.is_file():
        return str(candidate)
    raise SystemExit("Set JAVA_HOME or add a JDK to PATH")


with tempfile.TemporaryDirectory(prefix="lsa-fan-tile-runtime-") as directory:
    sources = []
    for name, content in FILES.items():
        path = Path(directory) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        sources.append(str(path))
    subprocess.run([java_tool("javac"), "-encoding", "UTF-8", "--release", "17", "-d", directory, *sources], check=True)
    subprocess.run([java_tool("java"), "-cp", directory, "ls.augment.com.hook.TestFanTileRuntime"], check=True, timeout=10)
