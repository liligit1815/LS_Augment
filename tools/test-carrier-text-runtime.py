"""Exercise the production carrier hook with Android/OEM lifecycle facades.

This verifies reversible ownership, scheduling and routing. It does not verify
Android text rasterization, real shade geometry or firmware hook availability.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
"android/content/Intent.java": """package android.content;public class Intent {public static final String ACTION_TIME_TICK="minute",ACTION_TIME_CHANGED="time",ACTION_TIMEZONE_CHANGED="zone",ACTION_LOCALE_CHANGED="locale",ACTION_SCREEN_ON="on",ACTION_SCREEN_OFF="off";}""",
"android/content/IntentFilter.java": """package android.content;public class IntentFilter {public void addAction(String a){}}""",
"android/content/BroadcastReceiver.java": """package android.content;public abstract class BroadcastReceiver {public abstract void onReceive(Context c,Intent i);}""",
"android/content/Context.java": """package android.content;public class Context {public static final int RECEIVER_NOT_EXPORTED=4;public static final String POWER_SERVICE="power";public final java.util.Set<BroadcastReceiver> receivers=new java.util.HashSet<>();public final android.os.PowerManager power=new android.os.PowerManager();public Context getApplicationContext(){return this;}public Object getSystemService(String name){return power;}public Intent registerReceiver(BroadcastReceiver r,IntentFilter f){receivers.add(r);return null;}public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,int flags){return registerReceiver(r,f);}public void unregisterReceiver(BroadcastReceiver r){if(!receivers.remove(r))throw new IllegalArgumentException();}public void broadcast(){for(BroadcastReceiver r:new java.util.ArrayList<>(receivers))r.onReceive(this,new Intent());}}""",
"android/os/PowerManager.java": """package android.os;public class PowerManager {public boolean interactive=true;public boolean isInteractive(){return interactive;}}""",
"android/os/Build.java": """package android.os;public class Build {public static class VERSION {public static int SDK_INT=36;}}""",
"android/os/LocaleList.java": """package android.os;public class LocaleList {public java.util.Locale get(int index){return java.util.Locale.getDefault();}}""",
"android/content/res/Configuration.java": """package android.content.res;public class Configuration {public android.os.LocaleList getLocales(){return new android.os.LocaleList();}}""",
"android/content/res/Resources.java": """package android.content.res;public class Resources {final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}public Configuration getConfiguration(){return new Configuration();}}""",
"android/util/DisplayMetrics.java": """package android.util;public class DisplayMetrics {public float density=2,scaledDensity=2;}""",
"android/util/TypedValue.java": """package android.util;public class TypedValue {public static final int COMPLEX_UNIT_PX=0,COMPLEX_UNIT_SP=2;public static float applyDimension(int unit,float value,DisplayMetrics metrics){return unit==COMPLEX_UNIT_SP?value*metrics.scaledDensity:value;}}""",
"android/graphics/Rect.java": """package android.graphics;public class Rect {public int left,top,right,bottom;public Rect(){}public Rect(int l,int t,int r,int b){set(l,t,r,b);}public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public int width(){return right-left;}public int height(){return bottom-top;}public boolean isEmpty(){return width()<=0||height()<=0;}}""",
"android/text/Spanned.java": """package android.text;public interface Spanned extends CharSequence {}""",
"android/text/SpannedString.java": """package android.text;public class SpannedString implements Spanned {final String value;public SpannedString(CharSequence text){value=text.toString();}public int length(){return value.length();}public char charAt(int i){return value.charAt(i);}public CharSequence subSequence(int start,int end){return value.subSequence(start,end);}public String toString(){return value;}}""",
"android/text/Editable.java": """package android.text;public interface Editable extends CharSequence {}""",
"android/text/TextWatcher.java": """package android.text;public interface TextWatcher {void beforeTextChanged(CharSequence s,int start,int count,int after);void onTextChanged(CharSequence s,int start,int before,int count);void afterTextChanged(Editable e);}""",
"android/text/TextUtils.java": """package android.text;public class TextUtils {public enum TruncateAt {START,MIDDLE,END,MARQUEE}public static boolean equals(CharSequence a,CharSequence b){return a==null?b==null:b!=null&&a.toString().contentEquals(b);}public static CharSequence ellipsize(CharSequence s,TextPaint p,float width,TruncateAt where){if(p.measureText(s.toString())<=width)return s;int count=Math.max(0,(int)(width/p.size)-1);return count==0&&width<p.size?"":s.subSequence(0,Math.min(count,s.length())).toString()+"…";}}""",
"android/text/TextPaint.java": """package android.text;public class TextPaint {public float size=14;public float measureText(String s){return s.length()*size;}public void getTextBounds(String s,int start,int end,android.graphics.Rect out){out.set(0,-(int)(size*.8f),Math.round((end-start)*size),end>start?0:-(int)(size*.8f));}}""",
"android/text/Layout.java": """package android.text;public class Layout {public float left,right;public int height=2000;public Layout(float l,float r){left=l;right=r;}public int getLineCount(){return 1;}public float getLineLeft(int line){return left;}public float getLineRight(int line){return right;}}""",
"android/view/ViewParent.java": """package android.view;public interface ViewParent {}""",
"android/view/ViewTreeObserver.java": """package android.view;public class ViewTreeObserver {public interface OnPreDrawListener {boolean onPreDraw();}public final java.util.List<OnPreDrawListener> listeners=new java.util.ArrayList<>();public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}public void draw(){for(OnPreDrawListener l:new java.util.ArrayList<>(listeners))l.onPreDraw();}}""",
"android/view/View.java": """package android.view;
public class View implements ViewParent {
public static final int VISIBLE=0,INVISIBLE=4,GONE=8,LAYOUT_DIRECTION_RTL=1;
public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}public interface OnClickListener {void onClick(View v);}
public static final java.util.Queue<Runnable> pending=new java.util.ArrayDeque<>();public final java.util.Map<Runnable,Long> delayed=new java.util.HashMap<>();public final java.util.List<OnAttachStateChangeListener> attachListeners=new java.util.ArrayList<>();
public int x,y,width=80,height=20,visibility=VISIBLE,direction=0,paddingLeft,paddingRight,windowVisibility=VISIBLE;public float alpha=1;public boolean attached=true,laidOut=true,globalVisible=true;public ViewParent parent;public OnClickListener click;public CharSequence description;
final android.content.Context context=new android.content.Context();final android.content.res.Resources resources=new android.content.res.Resources();final ViewTreeObserver observer=new ViewTreeObserver();
public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}public ViewParent getParent(){return parent;}public int getWidth(){return width;}public int getHeight(){return height;}public int getPaddingLeft(){return paddingLeft;}public int getPaddingRight(){return paddingRight;}public int getVisibility(){return visibility;}public int getWindowVisibility(){return windowVisibility;}public void setVisibility(int v){visibility=v;}public float getAlpha(){return alpha;}public int getLayoutDirection(){return direction;}public boolean isLaidOut(){return laidOut;}public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return visibility==VISIBLE&&attached&&(!(parent instanceof View)||((View)parent).isShown());}public boolean getGlobalVisibleRect(android.graphics.Rect r){return globalVisible;}public void getLocationInWindow(int[] a){a[0]=x;a[1]=y;for(ViewParent p=parent;p instanceof View;p=((View)p).parent){a[0]+=((View)p).x;a[1]+=((View)p).y;}}public ViewTreeObserver getViewTreeObserver(){return observer;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){attachListeners.add(l);}public boolean post(Runnable r){pending.add(r);return true;}public boolean postDelayed(Runnable r,long delay){delayed.put(r,delay);return true;}public void removeCallbacks(Runnable r){pending.removeIf(p->p==r);delayed.remove(r);}public static void drain(){for(int i=0;!pending.isEmpty();i++){if(i>100)throw new AssertionError("runaway callback");pending.poll().run();}}public void detach(){attached=false;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(attachListeners))l.onViewDetachedFromWindow(this);}public void attach(){attached=true;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(attachListeners))l.onViewAttachedToWindow(this);}public void performClick(){if(click!=null)click.onClick(this);}public void setContentDescription(CharSequence v){description=v;}public CharSequence getContentDescription(){return description;}
}""",
"android/view/ViewGroup.java": """package android.view;public class ViewGroup extends View {public final java.util.List<View> children=new java.util.ArrayList<>();public ViewGroup(){width=400;height=80;}public void addView(View v){children.add(v);v.parent=this;}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}""",
"android/widget/TextView.java": """package android.widget;
import android.text.*;public class TextView extends android.view.View {CharSequence text="OEM A";float size=14;int maxLines=2,maxHeight=-1,maxWidth=300,maxEms=-1;boolean horizontal=true;TextUtils.TruncateAt ellipsize=TextUtils.TruncateAt.MARQUEE;final java.util.List<TextWatcher> watchers=new java.util.ArrayList<>();
public CharSequence getText(){return text;}public void setText(CharSequence s){text=s;Editable e=s instanceof Spanned?new SpanEdit(s):new Edit(s);for(TextWatcher w:new java.util.ArrayList<>(watchers))w.afterTextChanged(e);}public void addTextChangedListener(TextWatcher w){watchers.add(w);}public void removeTextChangedListener(TextWatcher w){watchers.remove(w);}public float getTextSize(){return size;}public void setTextSize(int unit,float value){size=android.util.TypedValue.applyDimension(unit,value,getResources().getDisplayMetrics());}public int getMaxLines(){return maxLines;}public void setMaxLines(int value){maxLines=value;maxHeight=-1;}public int getMaxHeight(){return maxHeight;}public void setMaxHeight(int v){maxHeight=v;maxLines=-1;}public int getMaxWidth(){return maxWidth;}public void setMaxWidth(int v){maxWidth=v;maxEms=-1;}public int getMaxEms(){return maxEms;}public void setMaxEms(int v){maxEms=v;maxWidth=-1;}public TextUtils.TruncateAt getEllipsize(){return ellipsize;}public void setEllipsize(TextUtils.TruncateAt v){ellipsize=v;}public boolean isHorizontallyScrollable(){return horizontal;}public void setHorizontallyScrolling(boolean v){horizontal=v;}public TextPaint getPaint(){TextPaint p=new TextPaint();p.size=size;return p;}
static class Edit implements Editable {final String s;Edit(CharSequence s){this.s=s.toString();}public int length(){return s.length();}public char charAt(int i){return s.charAt(i);}public CharSequence subSequence(int a,int b){return s.subSequence(a,b);}public String toString(){return s;}}static class SpanEdit extends Edit implements Spanned {SpanEdit(CharSequence s){super(s);}}
}""",
"ls/augment/com/ConfigSnapshot.java": """package ls.augment.com;public class ConfigSnapshot {public final java.util.Map<String,String> values=new java.util.HashMap<>();public String get(String key){return values.get(key);}}""",
"ls/augment/com/CarrierTextOptions.java": """package ls.augment.com;public class CarrierTextOptions {public static String key(String panel,String suffix){return "ls_augment_carrier_"+panel+"_"+suffix;}}""",
"ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;import android.content.Context;public class FeatureSettings {static ls.augment.com.ConfigSnapshot snapshot=new ls.augment.com.ConfigSnapshot();static final java.util.Set<Runnable> listeners=new java.util.HashSet<>();static boolean enabled(Context c,String k){return "1".equals(snapshot.get(k));}static int integer(Context c,String k,int d,int min,int max){try{return Math.max(min,Math.min(max,Integer.parseInt(snapshot.get(k))));}catch(Exception e){return d;}}static ls.augment.com.ConfigSnapshot snapshot(Context c){return snapshot;}static void addSnapshotListener(Context c,Runnable r){listeners.add(r);}static void removeSnapshotListener(Runnable r){listeners.remove(r);}static void diagnostic(Context c,String k,String v){}static void put(String key,String value){ls.augment.com.ConfigSnapshot next=new ls.augment.com.ConfigSnapshot();next.values.putAll(snapshot.values);next.values.put(key,value);snapshot=next;for(Runnable r:new java.util.ArrayList<>(listeners))r.run();}}""",
"ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;public class AugmentModule {}""",
"ls/augment/com/hook/StatusBarGridHook.java": """package ls.augment.com.hook;import android.view.View;import android.graphics.Rect;public class StatusBarGridHook {static final java.util.Map<View,Rect> nativeFrames=new java.util.IdentityHashMap<>();static final java.util.Set<View> overlays=java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());static void carrierNativeFrame(View v,Rect out){Rect r=nativeFrames.get(v);if(r==null)out.set(v.x,v.y,v.x+v.width,v.y+v.height);else out.set(r.left,r.top,r.right,r.bottom);}static boolean isCarrierGridOverlay(View v){return overlays.contains(v);}}""",
"ls/augment/com/hook/SystemUiAdapter.java": """package ls.augment.com.hook;import java.lang.reflect.*;public class SystemUiAdapter {static final Object PASS=new Object();interface Patch {Object apply(Object o,Object[] a,Object r)throws Throwable;}static int hookNamed(AugmentModule m,ClassLoader l,String n,String c,String method,int count,Patch before,Patch after){return 1;}static Object field(Object o,String...names){if(o==null)return null;for(String n:names)for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(ReflectiveOperationException e){}return null;}}""",
"com/zte/controlcenter/widget/CCHeaderView.java": """package com.zte.controlcenter.widget;public class CCHeaderView extends android.view.ViewGroup {public static int QS_CENTER_TYPE=1,NOTIFICATION_CENTER_TYPE=2,PRIMITIVE_CENTER_TYPE=3;public int panelType;public android.widget.TextView carrierText=new android.widget.TextView();public CCHeaderView(int type){panelType=type;addView(carrierText);}}""",
"com/android/systemui/statusbar/phone/KeyguardStatusBarView.java": """package com.android.systemui.statusbar.phone;public class KeyguardStatusBarView extends android.view.ViewGroup {public android.widget.TextView mCarrierLabel=new android.widget.TextView();public KeyguardStatusBarView(){addView(mCarrierLabel);}}""",
}

FILES["ls/augment/com/hook/TestCarrierTextRuntime.java"] = r"""
package ls.augment.com.hook;
import android.view.*;import android.widget.*;import android.text.*;import java.lang.reflect.*;import java.util.*;
import com.zte.controlcenter.widget.CCHeaderView;import com.android.systemui.statusbar.phone.KeyguardStatusBarView;
public class TestCarrierTextRuntime {
static int checks,clicks;
static void check(boolean good,String label){checks++;if(!good)throw new AssertionError(label);}
static void put(String p,String k,String v){FeatureSettings.put(ls.augment.com.CarrierTextOptions.key(p,k),v);}
static Object call(Object target,String name,Object...args)throws Exception{Class<?> c=target instanceof Class?(Class<?>)target:target.getClass();for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(target instanceof Class?null:target,args);}throw new NoSuchMethodException(name);}
static void draw(TextView v){v.getViewTreeObserver().draw();View.drain();}
public static void main(String[] args)throws Exception{
check(CarrierTextHook.install(new AugmentModule(),TestCarrierTextRuntime.class.getClassLoader())==6,"registers actual header/keyguard inflate attach and resource endpoints");
CCHeaderView control=new CCHeaderView(1),notification=new CCHeaderView(2),merged=new CCHeaderView(3),unknown=new CCHeaderView(9);
check("control".equals(CarrierTextHook.headerPanel(control))&&"notification".equals(CarrierTextHook.headerPanel(notification))&&"notification".equals(CarrierTextHook.headerPanel(merged)),"ROM panelType values distinguish three header kinds");
check(CarrierTextHook.headerPanel(unknown)==null&&!CarrierTextHook.headerEnabled(unknown),"unknown firmware panel is not claimed");
CCHeaderView.QS_CENTER_TYPE=8;control.panelType=8;check("control".equals(CarrierTextHook.headerPanel(control)),"firmware static constant wins over fallback");CCHeaderView.QS_CENTER_TYPE=1;control.panelType=1;
TextView c=control.carrierText,n=notification.carrierText;
c.click=v->clicks++;c.setContentDescription("OEM accessibility label");CarrierTextHook.bindHeader(control);CarrierTextHook.bindHeader(notification);
check(c.getText().toString().equals("OEM A")&&c.getMaxLines()==2&&c.isHorizontallyScrollable(),"disabled binding leaves OEM text and marquee untouched");
put("control","text","控制中心");put("notification","text","通知\n页");put("control","enabled","1");put("notification","enabled","1");
check(c.getText().toString().equals("控制中心")&&n.getText().toString().equals("通知 页"),"positions are independent and input newlines collapse");
check(CarrierTextHook.headerEnabled(control)&&CarrierTextHook.headerEnabled(notification),"existing native visibility interceptor can enable each header");
check(c.getMaxLines()==1&&c.getEllipsize()==TextUtils.TruncateAt.END&&c.isHorizontallyScrollable(),"single-line END uses wide internal layout with bounded visible ellipsis width");
c.performClick();check(clicks==1&&c.getContentDescription().equals("OEM accessibility label"),"OEM click listener and explicit accessibility label are retained");
c.setText("OEM B");View.drain();check(c.getText().toString().equals("控制中心"),"native updates do not erase active customization");
put("control","enabled","0");check(c.getText().toString().equals("OEM B"),"disable restores latest carrier update rather than initial OEM A");
check(c.getMaxLines()==2&&c.getMaxWidth()==300&&c.getEllipsize()==TextUtils.TruncateAt.MARQUEE&&c.isHorizontallyScrollable(),"disable restores complete native line and marquee style");
put("control","enabled","1");c.setText(new SpannedString("SIM roaming"));put("control","enabled","0");View.drain();
check(c.getText() instanceof Spanned&&c.getText().toString().equals("SIM roaming"),"disable before queued reapply retains latest native styled text");
put("control","enabled","1");put("control","text","SECOND");put("control","enabled","0");check(c.getText().toString().equals("SIM roaming"),"our own writes cannot poison the native text baseline");
put("control","mode","0");put("control","size","20");put("control","enabled","1");c.setText("OEM C");View.drain();
check(c.getText().toString().equals("OEM C")&&c.getTextSize()==40,"native content mode permits independent sp size using density");
put("control","size","0");check(c.getTextSize()==14,"zero size restores latest native font size while enabled");
put("control","mode","1");put("control","size","20");call(CarrierTextHook.class,"prepareResources",control);c.setTextSize(0,18);c.setMaxLines(3);c.setMaxWidth(280);CarrierTextHook.bindHeader(control);put("control","enabled","0");
check(c.getTextSize()==18&&c.getMaxLines()==3&&c.getMaxWidth()==280,"theme/font configuration restores and recaptures new OEM values");
c.setMaxEms(12);c.setMaxHeight(28);put("control","enabled","1");put("control","enabled","0");
check(c.getMaxEms()==12&&c.getMaxWidth()==-1&&c.getMaxHeight()==28&&c.getMaxLines()==-1,"native em-width and pixel-height units survive disable");
c.setHorizontallyScrolling(false);put("control","enabled","1");check(c.isHorizontallyScrollable(),"native wrapping is temporarily replaced by the one-line layout contract");put("control","enabled","0");check(!c.isHorizontallyScrollable(),"native wrapping preference restores after independent text is disabled");
c.setMaxWidth(1000);c.setMaxLines(2);c.x=10;c.width=90;View sibling=new View();sibling.x=160;sibling.width=50;control.addView(sibling);put("control","enabled","1");draw(c);
check(c.getMaxWidth()==150,"LTR long text stops at a visible same-row native sibling");
sibling.y=40;draw(c);check(c.getMaxWidth()==390,"a sibling on a different row does not truncate the carrier");
sibling.y=0;sibling.alpha=0;draw(c);check(c.getMaxWidth()==390,"fully transparent native sibling does not reserve phantom width");
sibling.alpha=1;sibling.x=70;sibling.width=50;c.direction=View.LAYOUT_DIRECTION_RTL;c.x=210;c.width=90;draw(c);
check(c.getMaxWidth()==180,"RTL long text is constrained from the native right anchor");
c.setMaxWidth(175);put("control","enabled","0");check(c.getMaxWidth()==175,"native width update during ownership wins on disable");
// Regression: native allocation, not previous grid output, is the width input.
c.direction=0;c.x=10;c.width=90;sibling.x=160;put("control","enabled","1");
StatusBarGridHook.nativeFrames.put(c,new android.graphics.Rect(10,0,100,20));
for(int i=0;i<80;i++){c.x=160-i*2;c.width=Math.max(1,90-i);draw(c);check(c.getMaxWidth()==150,"grid frame cannot feed back into carrier width "+i);}
StatusBarGridHook.nativeFrames.remove(c);c.x=10;c.width=90;
View overlay=new View();overlay.x=10;overlay.width=400;overlay.height=80;control.addView(overlay);StatusBarGridHook.overlays.add(overlay);draw(c);
check(c.getMaxWidth()==150,"grid overlay allocation does not consume native carrier space");
StatusBarGridHook.nativeFrames.put(sibling,new android.graphics.Rect(190,0,240,20));draw(c);check(c.getMaxWidth()==175,"new native geometry respects native maxWidth limit");
StatusBarGridHook.nativeFrames.remove(sibling);put("control","enabled","0");
c.visibility=View.GONE;put("control","enabled","1");draw(c);check(c.visibility==View.GONE&&c.alpha==1,"customization never forces native-hidden carrier visible");c.visibility=View.VISIBLE;c.direction=0;c.x=10;
put("control","mode","2");put("control","pattern","HH:mm:ss");draw(c);check(c.delayed.size()==1&&c.getText().toString().matches("\\d{2}:\\d{2}:\\d{2}"),"visible seconds clock renders and schedules exactly one ticker");
for(int i=0;i<100;i++)draw(c);check(c.delayed.size()==1,"repeated pre-draw does not multiply scheduled clock callbacks");
control.alpha=0;draw(c);check(c.delayed.isEmpty(),"ancestor opacity hides clock and cancels ticker");control.alpha=1;c.globalVisible=false;draw(c);check(c.delayed.isEmpty(),"offscreen clipped carrier does not keep ticking");c.globalVisible=true;
c.getContext().power.interactive=false;c.getContext().broadcast();check(c.delayed.isEmpty(),"screen-off broadcast cancels ticker");c.getContext().power.interactive=true;c.getContext().broadcast();check(c.delayed.size()==1,"screen-on resumes a visible clock");
TimeZone saved=TimeZone.getDefault();try{TimeZone.setDefault(TimeZone.getTimeZone("GMT+08:00"));put("control","pattern","XXX");c.getContext().broadcast();check(c.getText().toString().equals("+08:00"),"timezone broadcast invalidates formatter immediately");TimeZone.setDefault(TimeZone.getTimeZone("GMT-05:00"));c.getContext().broadcast();check(c.getText().toString().equals("-05:00"),"formatter follows a second timezone change without settings edits");}finally{TimeZone.setDefault(saved);}
put("control","pattern","HH:mm");check(c.delayed.size()==1&&c.delayed.values().iterator().next()<=60000L,"minute pattern schedules at minute boundary");put("control","pattern","HH:mm:ss");check(c.delayed.values().iterator().next()<=1000L,"switching minute to seconds reschedules existing timer immediately");
put("control","pattern","invalid[");draw(c);check(c.getText().toString().matches("\\d{2}:\\d{2}"),"invalid external configuration fails safely to native-style time");
check(!CarrierTextHook.hasSeconds("HH:mm 'seconds'")&&CarrierTextHook.hasSeconds("HH:mm:ss")&&CarrierTextHook.hasSeconds("HH:mm 'it''s' ss")&&!CarrierTextHook.hasSeconds("HH:mm ''"),"quoted literal s does not create an unnecessary second ticker");
put("control","mode","1");check(c.delayed.isEmpty(),"switching from time to text removes all clock callbacks");
control.panelType=2;CarrierTextHook.bindHeader(control);check(c.getText().toString().equals("通知 页"),"live header type change rebinds to the proper panel settings");
KeyguardStatusBarView lock=new KeyguardStatusBarView();TextView l=lock.mCarrierLabel;put("lock","text","锁屏文字");put("lock","enabled","1");CarrierTextHook.bindHeader(lock);
check(l.getText().toString().equals("锁屏文字")&&n.getText().toString().equals("通知 页"),"keyguard carrier is a third independent native TextView");
check(CarrierTextHook.ownsLockText(l)&&!CarrierTextHook.ownsLockText(n),"grid font ownership is limited to an enabled native keyguard carrier");
put("lock","size","40");l.width=220;l.layout=new Layout(0,2000);l.baseline=100;
android.graphics.Rect ink=CarrierTextHook.gridInk(l);
check(l.getTextSize()==80&&ink.height()==64&&ink.width()==220,"40sp visible ink excludes huge stale Layout height without reducing text size");
put("lock","text","锁屏长文字边界验证 红魔Duo 红魔Duo");check(CarrierTextHook.gridInk(l).height()==64,"long ellipsized text retains its requested glyph height");
put("lock","size","13");put("lock","text","锁屏文字");check(CarrierTextHook.gridInk(l).height()==20,"return from long40 to short13 recovers the requested glyph size");
testPacking();
l.setText("OEM locked SIM");View.drain();l.detach();check(l.getText().toString().equals("OEM locked SIM")&&l.getMaxLines()==2,"detach restores latest carrier and native style");
check(l.getContext().receivers.isEmpty()&&l.delayed.isEmpty()&&l.getViewTreeObserver().listeners.isEmpty(),"detach removes receiver, timer and pre-draw observer");
l.setText("OEM after reattach");l.attach();check(l.getText().toString().equals("锁屏文字"),"reattach reinstalls customization on same native view");put("lock","enabled","0");check(l.getText().toString().equals("OEM after reattach"),"reattach captures fresh native baseline");
c.detach();n.detach();l.detach();check(FeatureSettings.listeners.isEmpty()&&View.pending.isEmpty(),"all detached views release listeners and queued writes");
System.out.println("PASS production carrier lifecycle: "+checks+" checks; facade only, real firmware layout unverified");
}
static void testPacking(){
java.util.List<ls.augment.com.StatusBarGridLayout.Node> nodes=new java.util.ArrayList<>();
ls.augment.com.StatusBarGridLayout.Node carrier=new ls.augment.com.StatusBarGridLayout.Node("clock.carrier","LS",-11,600,100);
nodes.add(carrier);nodes.add(new ls.augment.com.StatusBarGridLayout.Node("clock","LS",0,200,60));nodes.add(new ls.augment.com.StatusBarGridLayout.Node("icons","RS",0,400,50));
int width=CarrierTextHook.fitGridWidth(nodes,carrier,130,1216,130,13,13,0,0,0,0,0);
check(width>=130&&width<600,"carrier gets the remaining width after the same-side clock and opposite icons");
check(CarrierTextHook.fitGridWidth(nodes,carrier,130,1216,80,13,13,0,0,0,0,0)==-1,"physical height shortage cannot be hidden by pack's allowed 0.8 scale");
check(CarrierTextHook.fitGridWidth(nodes,carrier,590,1216,130,13,13,0,0,0,0,0)==-1,"too little room for a readable first glyph plus ellipsis reports fallback");
int cut=CarrierTextHook.fitGridWidth(nodes,carrier,100,1216,130,13,13,0,0,0,580,636);check(cut>0&&cut<width,"real cutout further limits carrier width");
check(nodes.get(0)==carrier&&carrier.width==600,"capacity search never mutates existing native node measurements");
for(String zone:new String[]{"LS","CS","RS"}){
java.util.List<ls.augment.com.StatusBarGridLayout.Node> isolated=new java.util.ArrayList<>();ls.augment.com.StatusBarGridLayout.Node n=new ls.augment.com.StatusBarGridLayout.Node("clock.carrier",zone,0,200,100);isolated.add(n);
check(CarrierTextHook.fitGridWidth(isolated,n,50,1216,130,13,13,0,0,0,0,0)==200,"independent carrier font remains at 1x in "+zone);
}
}}
"""
FILES["ls/augment/com/hook/CarrierTextHook.java"] = (ROOT / "android/app/src/main/java/ls/augment/com/hook/CarrierTextHook.java").read_text(encoding="utf-8")
for name in ("StatusBarAdaptiveLayout", "StatusBarGridLayout"):
    FILES["ls/augment/com/"+name+".java"] = (ROOT / ("android/app/src/main/java/ls/augment/com/"+name+".java")).read_text(encoding="utf-8")
FILES["android/view/View.java"] = FILES["android/view/View.java"].replace("public int getWidth()", "public int getScrollX(){return 0;}public int getScrollY(){return 0;}public int getWidth()")
FILES["android/widget/TextView.java"] = FILES["android/widget/TextView.java"].replace("public CharSequence getText()", "public Layout layout=new Layout(0,80);public int baseline=15;public Layout getLayout(){return layout;}public int getBaseline(){return baseline;}public int getTotalPaddingLeft(){return paddingLeft;}public int getTotalPaddingRight(){return paddingRight;}public CharSequence getText()")

def java_tool(name):
    path = shutil.which(name)
    if path:
        return path
    candidate = Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin" / (name + (".exe" if os.name == "nt" else ""))
    if candidate.is_file():
        return str(candidate)
    raise SystemExit("A local JDK is required for development tests")

with tempfile.TemporaryDirectory(prefix="duo-carrier-") as directory:
    root = Path(directory)
    for name, content in FILES.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
    sources = [str(root / name) for name in FILES]
    subprocess.run([java_tool("javac"), "-encoding", "UTF-8", "-d", str(root / "classes"), *sources], check=True)
    subprocess.run([java_tool("java"), "-cp", str(root / "classes"), "ls.augment.com.hook.TestCarrierTextRuntime"], check=True)
