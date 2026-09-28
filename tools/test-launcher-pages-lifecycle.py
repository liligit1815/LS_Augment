"""Run production page hooks against small Android/OEM/Xposed boundary doubles.

Checks stable IDs, view identity, binding safety, rollback, and async operations.
The fixture has no copied hook logic, database, device, widget renderer, or Android
animation engine. The page editor is a boundary double; layout is built by Android.
"""
from pathlib import Path
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {key: value for key, value in runpy.run_path(
    str(ROOT / 'tools/test-launcher-recents-memory-lifecycle.py'))['SOURCES'].items()
    if 'Recents' not in key}


def append_members(name, members):
    source = SOURCES[name]
    index = source.rfind('}')
    SOURCES[name] = source[:index] + members + source[index:]


SOURCES.update({
    'android/animation/LayoutTransition.java': 'package android.animation;public class LayoutTransition {}',
    'android/util/TypedValue.java': 'package android.util;public class TypedValue {public static final int COMPLEX_UNIT_PX=0,COMPLEX_UNIT_SP=2;public int data;}',
    'android/util/SparseArray.java': '''package android.util;
import java.util.*;
public class SparseArray<T> implements Cloneable {public final TreeMap<Integer,T> values=new TreeMap<>();public void put(int k,T v){values.put(k,v);}public T get(int k){return values.get(k);}public void remove(int k){values.remove(k);}public void clear(){values.clear();}public int size(){return values.size();}public int keyAt(int i){return new ArrayList<>(values.keySet()).get(i);}public T valueAt(int i){return new ArrayList<>(values.values()).get(i);}public SparseArray<T> clone(){SparseArray<T> copy=new SparseArray<>();copy.values.putAll(values);return copy;}}''',
    'android/content/SharedPreferences.java': '''package android.content;
import java.util.*;
public class SharedPreferences {
    public final Map<String,Object> values=new HashMap<>();public int writes;
    public String getString(String k,String fallback){return (String)values.getOrDefault(k,fallback);}public boolean getBoolean(String k,boolean fallback){return (Boolean)values.getOrDefault(k,fallback);}public int getInt(String k,int fallback){return (Integer)values.getOrDefault(k,fallback);}public boolean contains(String k){return values.containsKey(k);}public Editor edit(){return new Editor();}
    public class Editor {final Map<String,Object> edits=new HashMap<>();public Editor putString(String k,String v){edits.put(k,v);return this;}public Editor putBoolean(String k,boolean v){edits.put(k,v);return this;}public Editor putInt(String k,int v){edits.put(k,v);return this;}public Editor remove(String k){edits.put(k,null);return this;}public void apply(){writes++;for(Map.Entry<String,Object> e:edits.entrySet())if(e.getValue()==null)values.remove(e.getKey());else values.put(e.getKey(),e.getValue());}}
}''',
    'android/content/ClipData.java': 'package android.content;public class ClipData {public static ClipData newPlainText(String label,String text){return new ClipData();}}',
    'android/R.java': 'package android;public class R {public static class attr {public static final int textColorPrimary=1,colorControlHighlight=2;}}',
    'android/graphics/Canvas.java': 'package android.graphics;public class Canvas {public void drawRoundRect(RectF r,float a,float b,Paint p){}public int save(){return 0;}public void restoreToCount(int n){}public void translate(float x,float y){}public void scale(float x,float y){}}',
    'android/graphics/Paint.java': 'package android.graphics;public class Paint {public static final int ANTI_ALIAS_FLAG=1;public Paint(int flags){}public void setColor(int v){}}',
    'android/graphics/RectF.java': 'package android.graphics;public class RectF {public RectF(float l,float t,float r,float b){}}',
    'android/view/DragEvent.java': 'package android.view;public class DragEvent {public static final int ACTION_DRAG_ENTERED=5,ACTION_DRAG_EXITED=6,ACTION_DRAG_ENDED=4,ACTION_DROP=3,ACTION_DRAG_LOCATION=2;public int getAction(){return 0;}public Object getLocalState(){return null;}public float getY(){return 0;}}',
    'android/view/ViewGroup.java': '''package android.view;
import android.content.Context;import android.animation.LayoutTransition;import java.util.*;
public class ViewGroup extends View {
    public final List<View> children=new ArrayList<>();public LayoutTransition transition=new LayoutTransition();public ViewGroup(Context c){super(c);}
    public static class LayoutParams {public static final int MATCH_PARENT=-1,WRAP_CONTENT=-2;public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
    public void addView(View v){addView(v,children.size());}public void addView(View v,int i){if(v.parent!=null)throw new IllegalStateException("already parented");children.add(i,v);v.parent=this;if(v.params==null)v.params=new android.widget.FrameLayout.LayoutParams(-2,-2);}
    public void addView(View v,LayoutParams p){v.params=p;addView(v);}public void removeView(View v){children.remove(v);v.parent=null;}public void removeAllViews(){for(View v:new ArrayList<>(children))removeView(v);}
    public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}public int indexOfChild(View v){return children.indexOf(v);}public void setLayoutTransition(LayoutTransition t){transition=t;}public LayoutTransition getLayoutTransition(){return transition;}
    public View findViewById(int id){View own=super.findViewById(id);if(own!=null)return own;for(View child:children){View result=child.findViewById(id);if(result!=null)return result;}return null;}
    @SuppressWarnings("unchecked") public <T extends View>T findViewWithTag(Object tag){if(Objects.equals(this.tag,tag))return (T)this;for(View child:children){if(Objects.equals(child.tag,tag))return (T)child;if(child instanceof ViewGroup){T result=((ViewGroup)child).findViewWithTag(tag);if(result!=null)return result;}}return null;}
}''',
    'android/widget/LinearLayout.java': '''package android.widget;
import android.content.Context;import android.view.ViewGroup;
public class LinearLayout extends ViewGroup {public static final int VERTICAL=1;public int orientation;public LinearLayout(Context c){super(c);}public void setOrientation(int v){orientation=v;}public int getOrientation(){return orientation;}public void setGravity(int v){}public static class LayoutParams extends ViewGroup.LayoutParams {public float weight;public LayoutParams(int w,int h){super(w,h);}public LayoutParams(int w,int h,float f){super(w,h);weight=f;}}}''',
    'android/widget/ScrollView.java': 'package android.widget;import android.content.Context;public class ScrollView extends FrameLayout {public int scrollY;public ScrollView(Context c){super(c);}public int getScrollY(){return scrollY;}public void scrollBy(int x,int y){scrollY+=y;}}',
    'android/widget/Button.java': 'package android.widget;import android.content.Context;public class Button extends TextView {public Button(Context c){super(c);}}',
    'android/widget/Toast.java': 'package android.widget;import android.content.Context;public class Toast {public static final int LENGTH_SHORT=0;public static Toast makeText(Context c,String t,int d){return new Toast();}public void show(){}}',
    'android/app/AlertDialog.java': '''package android.app;
import android.content.Context;import android.view.View;
public class AlertDialog {public interface DismissListener {void dismissed(AlertDialog d);}public boolean showing;public void setOnDismissListener(DismissListener l){}public boolean isShowing(){return showing;}public void show(){showing=true;}public static class Builder {public Builder(Context c){}public Builder setTitle(String s){return this;}public Builder setView(View v){return this;}public Builder setPositiveButton(String s,Object listener){return this;}public AlertDialog create(){return new AlertDialog();}}}''',
    'ls/augment/com/LauncherOptions.java': 'package ls.augment.com;public class LauncherOptions {public static final String KEEP_EMPTY="keep_empty",PAGE_REORDER="page_reorder";}',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;
import java.util.*;import android.content.Context;
final class FeatureSettings {static final Map<String,Boolean> values=new HashMap<>();static final List<Runnable> listeners=new ArrayList<>();static boolean verified=true;static boolean enabled(Context c,String k){return values.getOrDefault(k,false);}static boolean hasVerifiedSnapshot(Context c){return verified;}static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}static void change(String k,boolean v){values.put(k,v);for(Runnable listener:new ArrayList<>(listeners))listener.run();}}
''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
public final class AugmentModule {
    interface Interceptor {Object intercept(Chain c)throws Throwable;}interface Chain {Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;Object proceed(Object[] args)throws Throwable;}
    static class Registration {final Method method;final Interceptor interceptor;Registration(Method m,Interceptor i){method=m;interceptor=i;}}static class Builder {final Method method;Builder(Method m){method=m;}Registration intercept(Interceptor i){return new Registration(method,i);}}
    final Map<String,Registration> hooks=new LinkedHashMap<>();final List<Throwable> errors=new ArrayList<>();Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(m);}void registerFeatureHook(Registration r){hooks.put(r.method.getName(),r);}void logFeatureError(String name,Throwable error){errors.add(error);}
    Object call(String name,Object owner,Object...args)throws Throwable {Registration r=hooks.get(name);if(r==null)throw new AssertionError("missing hook "+name);return r.interceptor.intercept(new Chain(){public Object getThisObject(){return owner;}public Object getArg(int i){return args[i];}public Object proceed()throws Throwable{return proceed(args);}public Object proceed(Object[] replaced)throws Throwable{r.method.setAccessible(true);try{return r.method.invoke(owner,replaced);}catch(InvocationTargetException e){throw e.getCause();}}});}
}''',
    'com/android/launcher3/util/x0.java': '''package com.android.launcher3.util;
import java.util.*;
public class x0 {public final List<Integer> values=new ArrayList<>();public int mutations;public x0(int...ids){for(int id:ids)values.add(id);}public void clear(){mutations++;values.clear();}public void m(int id){mutations++;values.add(id);}public int[] A(){return values.stream().mapToInt(Integer::intValue).toArray();}public x0 q(){return new x0(A());}}''',
    'com/android/launcher3/util/z0.java': 'package com.android.launcher3.util;public class z0 {}',
    'com/android/launcher3/B4.java': 'package com.android.launcher3;public class B4 {public boolean j;}',
    'com/android/launcher3/N5.java': 'package com.android.launcher3;public class N5 {public static boolean j;}',
    'com/android/launcher3/J3.java': 'package com.android.launcher3;import android.content.*;public class J3 {public static SharedPreferences m(Context c){return c.getSharedPreferences("native",0);}}',
    'com/android/launcher3/CellLayout.java': '''package com.android.launcher3;
import android.content.Context;import android.widget.FrameLayout;import android.view.ViewGroup;
public class CellLayout extends FrameLayout {public final FrameLayout contents;public final int stableId;public CellLayout(Context c,int id){super(c);stableId=id;contents=new FrameLayout(c);addView(contents);}public ViewGroup getShortcutsAndWidgets(){return contents;}}''',
    'com/android/launcher3/V4.java': '''package com.android.launcher3;
import android.content.Context;import android.widget.FrameLayout;
public class V4 extends FrameLayout {public int currentPage,indicatorRefreshes;public V4(Context c){super(c);}public int getCurrentPage(){return currentPage;}public void setCurrentPage(int v){currentPage=v;}public void updatePageIndicator(){indicatorRefreshes++;}}
''',
    'com/android/launcher3/Workspace.java': '''package com.android.launcher3;
import android.content.Context;import android.util.SparseArray;import com.android.launcher3.util.x0;import java.util.*;
public class Workspace extends V4 {
    public final SparseArray<CellLayout> n=new SparseArray<>();public C2 x;public final x0 order=new x0();public boolean dragging,inTransition;public int stripCalls,panels=1;
    public Workspace(Context c){super(c);}public x0 getScreenOrder(){return order;}public CellLayout n(int id){return n.get(id);}public int getPanelCount(){return panels;}public boolean getIsDragOccuring(){return dragging;}public boolean isPageInTransition(){return inTransition;}public void setState(Object state){}
    public CellLayout v1(int id,int index){CellLayout page=new CellLayout(context,id);n.put(id,page);order.values.add(index,id);addView(page,index);return page;}
    public void i3(){stripCalls++;for(int id:new ArrayList<>(order.values)){CellLayout page=n.get(id);if(order.values.size()>1&&id>=0&&page.contents.children.isEmpty()){removeView(page);n.remove(id);order.values.remove(Integer.valueOf(id));}}}
    public int convertCalls,cleanupCalls;public void Q0(){convertCalls++;}public void G2(int delay,boolean strip,Runnable callback){cleanupCalls++;for(int id:new int[]{-201,-200}){CellLayout page=n.get(id);if(page!=null){removeView(page);n.remove(id);order.values.remove(Integer.valueOf(id));}}if(callback!=null)callback.run();}
}''',
    'com/android/launcher3/C2.java': '''package com.android.launcher3;
import android.content.Context;import com.android.launcher3.util.*;
public class C2 {public final Workspace workspace;public final B4 h=new B4();public x0 receivedBinding;public int binds,finishes;public final x1.Z util=new x1.Z();public C2(Context c){workspace=new Workspace(c);workspace.x=this;}public Workspace B2(){return workspace;}public void f(x0 ids){binds++;receivedBinding=ids;workspace.removeAllViews();workspace.n.clear();workspace.order.clear();for(int id:ids.A())workspace.v1(id,workspace.order.values.size());}public void h(z0 done){finishes++;}public x1.Z w2(){return util;}public StateManager getStateManager(){return new StateManager();}public static class StateManager {public Object C(){return "NORMAL";}}}''',
    'com/android/launcher3/P2.java': 'package com.android.launcher3;import android.content.Context;public class P2 {public static final P2 value=new P2();public static P2 h(Context c){return value;}public D3 j(){return new D3();}}',
    'com/android/launcher3/D3.java': 'package com.android.launcher3;public class D3 {public z1.k2 m0(){return new z1.k2();}}',
    'z1/k2.java': '''package z1;
import java.util.*;import ls.augment.com.hook.ModelQueue;
public class k2 {public static int nextId=100,allocations;public static boolean failOnce;public static Thread allocatedOn;public static final Deque<Integer> ids=new ArrayDeque<>();public int F(){allocations++;allocatedOn=Thread.currentThread();if(allocatedOn!=ModelQueue.worker)throw new IllegalStateException("ID allocation must use native model executor");if(failOnce){failOnce=false;throw new IllegalStateException("injected database failure");}return ids.isEmpty()?nextId:ids.removeFirst();}public static void reset(){nextId=100;allocations=0;failOnce=false;allocatedOn=null;ids.clear();}}''',
    'x1/Z.java': '''package x1;
import com.android.launcher3.*;import android.content.SharedPreferences;
/** Fixture OEM helper only: preserve the home ID and recompute its positional index. */
public class Z {public static boolean failOnce;public static int refreshes;public void b(Workspace ws){refreshes++;SharedPreferences prefs=J3.m(ws.context);int home=prefs.getInt("launcher.default_screen_id",ws.order.values.get(0));int index=ws.order.values.indexOf(home);if(index<0){index=0;home=ws.order.values.get(0);}prefs.edit().putInt("launcher.default_screen_id",home).putInt("launcher.default_screen",index).apply();if(failOnce){failOnce=false;throw new IllegalStateException("injected OEM failure after home-index write");}}}''',
    'com/android/launcher3/menu/MenuContainer.java': 'package com.android.launcher3.menu;import android.content.Context;import android.widget.*;public class MenuContainer extends FrameLayout {public LinearLayout m;public Object g;public MenuContainer(Context c){super(c);m=new LinearLayout(c);}public void G(){}}',
    'com/android/launcher3/widget/custom/future/AIFutureWidgetUtils.java': 'package com.android.launcher3.widget.custom.future;import android.content.Context;public class AIFutureWidgetUtils {public static int l(Context c){return -1;}}',
    'ls/augment/com/hook/TestLauncherPagesLifecycle.java': '''package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import android.view.*;import android.animation.LayoutTransition;import com.android.launcher3.*;import com.android.launcher3.util.*;import java.lang.reflect.*;import java.util.*;import ls.augment.com.LauncherOptions;
public class TestLauncherPagesLifecycle {
    static int checks;static AugmentModule module;static Context context;static C2 launcher;static Workspace ws;
    static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
    static void setup()throws Exception {FeatureSettings.values.clear();FeatureSettings.listeners.clear();FeatureSettings.verified=true;Handler.clear();ModelQueue.reset();z1.k2.reset();LauncherPagesEditor.reset();android.widget.Toast.messages.clear();x1.Z.failOnce=false;Field installed=LauncherPagesHook.class.getDeclaredField("installed");installed.setAccessible(true);installed.setBoolean(null,false);module=new AugmentModule();context=new Context();launcher=new C2(context);ws=launcher.workspace;LauncherPagesHook.install(module,TestLauncherPagesLifecycle.class.getClassLoader());if(!module.errors.isEmpty())throw new AssertionError("installation failed",module.errors.get(0));check(module.hooks.size()==5,"all page lifecycle hooks installed");}
    static Object controller()throws Exception {Field field=LauncherPagesHook.class.getDeclaredField("controller");field.setAccessible(true);return field.get(null);}
    static void action(String name,Object...args)throws Throwable {Object c=controller();Class<?>[] types=new Class<?>[args.length];Arrays.fill(types,int.class);Method method=c.getClass().getDeclaredMethod(name,types);method.setAccessible(true);try{method.invoke(c,args);}catch(InvocationTargetException error){throw error.getCause();}}
    static void bind(int...ids)throws Throwable {module.call("f",launcher,new x0(ids));module.call("h",launcher,new z0());Handler.drain();}
    static void enable(){FeatureSettings.values.put(LauncherOptions.KEEP_EMPTY,true);FeatureSettings.values.put(LauncherOptions.PAGE_REORDER,true);}
    static View content(int pageId,String text){View child=new View(context);child.tag=text;ws.n(pageId).contents.addView(child);return child;}
    static void order(int...expected){check(Arrays.equals(expected,ws.order.A()),"page order "+Arrays.toString(ws.order.A()));check(ws.getChildCount()==expected.length&&ws.n.size()==expected.length,"page map/list/tree cardinalities match");for(int i=0;i<expected.length;i++)check(ws.getChildAt(i)==ws.n(expected[i]),"view retains stable screen ID "+expected[i]);}
    static SharedPreferences own(){return context.getSharedPreferences("ls_augment_launcher_pages",0);}static SharedPreferences nativePrefs(){return J3.m(context);}
    static void home(int id,int index){nativePrefs().edit().putInt("launcher.default_screen_id",id).putInt("launcher.default_screen",index).apply();}
    static void expectRejected(String name,Object...args)throws Throwable {try{action(name,args);throw new AssertionError("operation unexpectedly accepted: "+name);}catch(IllegalStateException expected){checks++;}}
    public static void main(String[] args)throws Throwable {
        setup();x0 input=new x0(30,10,20);module.call("f",launcher,input);module.call("h",launcher,new z0());
        check(launcher.receivedBinding==input&&input.mutations==0,"first OFF passes native binding argument untouched");check(!own().contains("order"),"first OFF writes no module ordering state");order(30,10,20);

        setup();own().edit().putString("order","10,30,20").putBoolean("keep_empty",true).apply();FeatureSettings.verified=false;input=new x0(10,20);module.call("f",launcher,input);module.call("h",launcher,new z0());
        check(Arrays.equals(input.A(),new int[]{10,20})&&input.mutations==0,"saved order never mutates model-owned binding input");check(launcher.receivedBinding!=input,"restored binding uses copied ID list");order(10,30,20);module.call("i3",ws);check(ws.stripCalls==0,"unverified boot configuration cannot strip saved blank pages");check(own().getBoolean("keep_empty",false),"unverified snapshot keeps persisted protection");

        setup();enable();bind(10,20,-201);module.call("Q0",ws);check(ws.convertCalls==0,"keep-empty blocks native renaming of a stable page into a disposable placeholder");ws.dragging=true;android.os.SystemClock.now+=300;Handler.drain();check(ws.n(-201)!=null&&ws.cleanupCalls==0,"placeholder cleanup waits until dragging ends");ws.dragging=false;android.os.SystemClock.now+=300;Handler.drain();order(10,20);check(ws.cleanupCalls==1,"native placeholder cleanup runs after drag, preserving ordinary blank pages");FeatureSettings.values.put(LauncherOptions.KEEP_EMPTY,false);module.call("Q0",ws);check(ws.convertCalls==1,"OFF leaves native empty-page conversion available");
        setup();enable();bind(-201);android.os.SystemClock.now+=300;Handler.drain();order(-201);check(ws.cleanupCalls==0,"cleanup cannot remove the only remaining page");setup();enable();bind(99);action("delete",99);order(99);

        setup();enable();bind(10,20,30);content(10,"icon");content(20,"widget");module.call("f",launcher,new x0(10,20,30));
        expectRejected("delete",20);expectRejected("move",10,30);expectRejected("add",1000);order(10,20,30);
        module.call("h",launcher,new z0());content(10,"icon");content(20,"widget");action("delete",20);order(10,20,30);check(ws.n(20).contents.getChildCount()==1,"nonempty widget page is never deleted");action("delete",30);order(10,20);check(ws.n(30)==null,"only selected empty page removed");

        setup();enable();bind(10,20,30);View icon=content(10,"icon"),folder=content(10,"folder"),widget=content(30,"widget");CellLayout first=ws.n(10),last=ws.n(30);ws.setCurrentPage(0);home(10,0);LayoutTransition transition=ws.getLayoutTransition();
        action("move",10,30);order(20,30,10);check(ws.n(10)==first&&ws.n(30)==last,"moving retains entire CellLayout objects");check(first.contents.getChildAt(0)==icon&&first.contents.getChildAt(1)==folder&&last.contents.getChildAt(0)==widget,"icons folders widgets preserve identity and placement");check(ws.currentPage==2,"current page follows stable ID across move");check(nativePrefs().getInt("launcher.default_screen_id",-1)==10&&nativePrefs().getInt("launcher.default_screen",-1)==2,"default page keeps stable ID and updates index");check(ws.transition==transition,"native layout animation restored after success");check(own().getString("order","").equals("20,30,10"),"successful order is saved");

        List<View> beforeChildren=new ArrayList<>(ws.children);List<Integer> beforeOrder=new ArrayList<>(ws.order.values);Map<String,Object> beforePrefs=new HashMap<>(nativePrefs().values);String beforeSaved=own().getString("order","");int beforeCurrent=ws.currentPage;
        x1.Z.failOnce=true;try{action("move",10,20);throw new AssertionError("injected refresh failure not propagated");}catch(Exception expected){checks++;}
        check(ws.children.equals(beforeChildren)&&ws.order.values.equals(beforeOrder),"failed move restores tree and order");for(int i=0;i<beforeOrder.size();i++)check(ws.n(beforeOrder.get(i))==beforeChildren.get(i),"failed move restores native page lookup");check(ws.currentPage==beforeCurrent,"failed move restores current stable page");check(nativePrefs().values.equals(beforePrefs),"failed move restores default-page preferences");check(own().getString("order","").equals(beforeSaved),"failed operation never saves partial order");check(ws.transition==transition,"failed move restores native animation");check(first.contents.getChildAt(0)==icon&&first.contents.getChildAt(1)==folder&&last.contents.getChildAt(0)==widget,"rollback preserves every item object");
        x1.Z.failOnce=true;try{action("add",1000);throw new AssertionError("injected add failure not propagated");}catch(Exception expected){checks++;}check(ws.children.equals(beforeChildren)&&ws.order.values.equals(beforeOrder)&&ws.n.size()==beforeOrder.size(),"failed insert removes only new empty page and restores native map");
        x1.Z.failOnce=true;try{action("delete",20);throw new AssertionError("injected delete failure not propagated");}catch(Exception expected){checks++;}check(ws.children.equals(beforeChildren)&&ws.order.values.equals(beforeOrder)&&ws.n(20)==beforeChildren.get(0),"failed delete restores original empty page object");check(nativePrefs().values.equals(beforePrefs)&&ws.currentPage==beforeCurrent,"add/delete rollback restore home/current state");
        action("move",10,20);order(10,20,30);check(ws.n(10)==first,"editing works after one-shot failure recovery");
        testMenuEntry();testEditorEntry();testMoveTargets();testPendingMutations();testAsyncAdd();
        System.out.println("PASS LauncherPages lifecycle "+checks+" safety checks; Android/OEM/Xposed boundary doubles, no device");
    }
}''',
})

append_members('android/content/Context.java', '''
public static final int MODE_PRIVATE=0;public final java.util.Map<String,SharedPreferences> preferences=new java.util.HashMap<>();public SharedPreferences getSharedPreferences(String name,int mode){return preferences.computeIfAbsent(name,k->new SharedPreferences());}public Theme getTheme(){return new Theme();}public static class Theme {public boolean resolveAttribute(int a,android.util.TypedValue value,boolean refs){value.data=0x22888888;return true;}}
''')
append_members('android/view/View.java', '''
public interface OnClickListener {void onClick(View view);}public interface OnLongClickListener {boolean onLongClick(View view);}public interface OnDragListener {boolean onDrag(View view,DragEvent event);}public static class DragShadowBuilder {public DragShadowBuilder(View view){}}
public void setOnClickListener(OnClickListener l){}public void setOnLongClickListener(OnLongClickListener l){}public void setOnDragListener(OnDragListener l){}public void setMinHeight(int n){}public void setPadding(int l,int t,int r,int b){}public void setContentDescription(CharSequence s){}public void setEnabled(boolean value){}public int getTop(){return 0;}public boolean startDragAndDrop(android.content.ClipData d,DragShadowBuilder shadow,Object local,int flags){return true;}public void requestLayout(){}public void invalidate(){}protected void onDraw(android.graphics.Canvas canvas){}public void draw(android.graphics.Canvas canvas){}
''')
append_members('android/widget/TextView.java', 'public void setTextSize(float v){size=v;}public float getTextSize(){return size;}')
SOURCES['android/view/Gravity.java'] = SOURCES['android/view/Gravity.java'].replace('END=8388613', 'CENTER=17,END=8388613')
SOURCES['android/widget/LinearLayout.java'] = SOURCES['android/widget/LinearLayout.java'].replace(
    'public float weight;',
    'public float weight;public LayoutParams(LayoutParams other){super(other.width,other.height);weight=other.weight;}')
SOURCES['android/view/View.java'] = SOURCES['android/view/View.java'].replace(
    'public void setOnClickListener(OnClickListener l){}',
    'public OnClickListener clickListener;public void setOnClickListener(OnClickListener l){clickListener=l;}public boolean performClick(){if(clickListener==null)return false;clickListener.onClick(this);return true;}')

# Queue callbacks under a virtual clock, but execute model work on a real separate
# thread. This verifies the database/UI boundary without relying on sleep timing.
append_members('android/os/Handler.java', 'public static void clear(){synchronized(queue){queue.clear();}}')
SOURCES['android/os/Looper.java'] = '''package android.os;
public class Looper {static final Thread ui=Thread.currentThread();static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return Thread.currentThread()==ui?MAIN:null;}}'''
SOURCES['android/widget/Toast.java'] = '''package android.widget;
import android.content.Context;import java.util.*;
public class Toast {public static final int LENGTH_SHORT=0;public static final List<String> messages=new ArrayList<>();final String text;Toast(String text){this.text=text;}public static Toast makeText(Context c,String text,int duration){return new Toast(text);}public void show(){messages.add(text);}}'''
SOURCES['ls/augment/com/hook/ModelQueue.java'] = '''package ls.augment.com.hook;
import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.AtomicReference;
public final class ModelQueue {
    static final Deque<Runnable> queue=new ArrayDeque<>();public static Thread worker;public static int submitted;public static boolean reject;
    public static final Executor INSTANCE=task->{if(reject)throw new RejectedExecutionException("injected model executor rejection");submitted++;queue.addLast(task);};
    public static int pending(){return queue.size();}public static void reset(){queue.clear();submitted=0;reject=false;worker=null;}
    public static void drain()throws Exception {while(!queue.isEmpty()){Runnable task=queue.removeFirst();AtomicReference<Throwable> error=new AtomicReference<>();Thread thread=new Thread(()->{worker=Thread.currentThread();try{task.run();}catch(Throwable failure){error.set(failure);}},"fixture-native-model");thread.start();thread.join(5000);if(thread.isAlive())throw new AssertionError("model operation did not terminate");if(error.get()!=null)throw new AssertionError("uncaught model operation failure",error.get());}}
}'''
SOURCES['com/android/launcher3/util/m0.java'] = '''package com.android.launcher3.util;
import java.util.concurrent.Executor;import ls.augment.com.hook.ModelQueue;
public class m0 {public static final Executor h=ModelQueue.INSTANCE;}'''
SOURCES['ls/augment/com/hook/LauncherPagesEditor.java'] = '''package ls.augment.com.hook;
import android.content.Context;
final class LauncherPagesEditor {static int opened;boolean showing;LauncherPagesEditor(LauncherPagesHook.Controller controller,Context context){}void show(){showing=true;opened++;}boolean isShowing(){return showing;}void dismiss(){showing=false;}static void reset(){opened=0;}}'''
SOURCES['ls/augment/com/hook/LauncherPagesEntry.java'] = '''package ls.augment.com.hook;
import android.widget.TextView;
final class LauncherPagesEntry {static void style(TextView entry,TextView reference){}}'''
SOURCES['com/android/launcher3/Workspace.java'] = SOURCES['com/android/launcher3/Workspace.java'].replace(
    'public CellLayout v1(int id,int index){',
    'public Thread insertedOn;public CellLayout v1(int id,int index){insertedOn=Thread.currentThread();')

append_members('ls/augment/com/hook/TestLauncherPagesLifecycle.java', '''
    static LauncherPagesHook.Controller c()throws Exception {return (LauncherPagesHook.Controller)controller();}
    static class Result {int successes;final List<String> errors=new ArrayList<>();final Runnable done=()->successes++;final java.util.function.Consumer<String> error=errors::add;}
    static void ticks(int count){for(int i=0;i<count;i++){android.os.SystemClock.now+=80;Handler.drain();}}
    static void finishModel()throws Exception {ModelQueue.drain();Handler.drain();}
    static void testMenuEntry()throws Throwable {
        setup();enable();bind(10,20);com.android.launcher3.menu.MenuContainer menu=new com.android.launcher3.menu.MenuContainer(context);menu.g=launcher;
        for(int i=0;i<4;i++){android.widget.TextView nativeItem=new android.widget.TextView(context);nativeItem.setText("native "+i);menu.m.addView(nativeItem,new android.widget.LinearLayout.LayoutParams(76+i,88+i,i));}
        module.call("G",menu);module.call("G",menu);
        check(menu.m.getChildCount()==5,"native menu initialization installs one page entry without duplication");
        View entry=menu.m.findViewWithTag("ls_augment.pages.entry");check(entry!=null&&entry.getVisibility()==View.VISIBLE,"enabled page tools expose a visible entry");
        for(View child:menu.m.children){android.widget.LinearLayout.LayoutParams layout=(android.widget.LinearLayout.LayoutParams)child.params;check(layout.width==0&&layout.weight==1,"all five entries share available menu width");}
        ws.inTransition=true;entry.performClick();entry.performClick();check(LauncherPagesEditor.opened==0,"real entry click routes through transition guard");ws.inTransition=false;ticks(1);
        check(LauncherPagesEditor.opened==1,"entry listener opens one editor after native transition");
        menu.m.setOrientation(android.widget.LinearLayout.VERTICAL);module.call("G",menu);
        for(int i=0;i<4;i++){android.widget.LinearLayout.LayoutParams restored=(android.widget.LinearLayout.LayoutParams)menu.m.getChildAt(i).params;check(restored.width==76+i&&restored.height==88+i&&restored.weight==i,"vertical layout restores native menu geometry");}
        menu.m.setOrientation(0);module.call("G",menu);FeatureSettings.values.put(LauncherOptions.KEEP_EMPTY,false);FeatureSettings.change(LauncherOptions.PAGE_REORDER,false);Handler.drain();
        check(entry.getVisibility()==View.GONE,"disabling both features hides the page entry");
        for(int i=0;i<4;i++){android.widget.LinearLayout.LayoutParams restored=(android.widget.LinearLayout.LayoutParams)menu.m.getChildAt(i).params;check(restored.width==76+i&&restored.height==88+i&&restored.weight==i,"disabling page tools restores original native item dimensions");}
    }
    static void testEditorEntry()throws Throwable {
        setup();enable();bind(10,20);ws.inTransition=true;
        c().showEditor(context);c().showEditor(context);Handler.drain();
        check(LauncherPagesEditor.opened==0,"entry waits for the native transition instead of opening stale pages");
        check(android.widget.Toast.messages.isEmpty(),"a short transition does not show a spurious failure");
        ws.inTransition=false;ticks(1);
        check(LauncherPagesEditor.opened==1,"repeated entry taps open exactly one editor when transition settles");
        c().showEditor(context);Handler.drain();check(LauncherPagesEditor.opened==1,"an already visible editor is reused");

        setup();enable();module.call("f",launcher,new x0(10,20));
        c().showEditor(context);Handler.drain();check(LauncherPagesEditor.opened==0,"entry waits for native binding completion");
        module.call("h",launcher,new z0());ticks(1);check(LauncherPagesEditor.opened==1,"entry opens after native binding completes");

        setup();enable();bind(10,20);ws.inTransition=true;c().showEditor(context);ticks(30);
        check(LauncherPagesEditor.opened==0,"entry never opens while the workspace remains busy");
        check(android.widget.Toast.messages.size()==1,"bounded entry wait reports one timeout");
        ws.inTransition=false;ticks(5);check(LauncherPagesEditor.opened==0,"expired entry tap does not open later by surprise");
        c().showEditor(context);Handler.drain();check(LauncherPagesEditor.opened==1,"entry can retry after timeout");

        setup();enable();bind(10,20);ws.panels=2;c().showEditor(context);ticks(30);
        check(LauncherPagesEditor.opened==0&&!android.widget.Toast.messages.isEmpty(),"unsupported dual-panel workspace remains protected");

        setup();enable();bind(10,20);com.android.launcher3.menu.MenuContainer menu=new com.android.launcher3.menu.MenuContainer(context);menu.g=launcher;module.call("G",menu);
        View entry=menu.m.findViewWithTag("ls_augment.pages.entry");ws.inTransition=true;entry.performClick();menu.setVisibility(View.GONE);ws.inTransition=false;ticks(1);
        check(LauncherPagesEditor.opened==0,"entry cannot open late after the native edit menu is hidden");
        check(android.widget.Toast.messages.size()==1,"hidden menu rejects the pending entry once");
        menu.setVisibility(View.VISIBLE);entry.performClick();Handler.drain();check(LauncherPagesEditor.opened==1,"returning to edit mode permits a new entry tap");

        setup();enable();bind(10,20);c().showEditor(context);Handler.drain();LauncherPagesEditor previous=c().editor;
        check(previous!=null&&previous.isShowing(),"editor is visible before a model rebind");
        module.call("f",launcher,new x0(10,20));check(!previous.isShowing(),"rebinding immediately dismisses the editor holding old page views");
        module.call("h",launcher,new z0());Handler.drain();c().showEditor(context);Handler.drain();
        check(c().editor!=previous&&c().editor.isShowing()&&LauncherPagesEditor.opened==2,"finished rebind opens a fresh editor against current pages");
    }
    static void testMoveTargets()throws Throwable {
        setup();enable();bind(10,-50,20,30);
        check(!c().canMovePage(10,20)&&!c().canMovePage(20,10),"move targets on either side of a negative system page are unavailable");
        check(!c().canMovePage(-50,20)&&!c().canMovePage(20,-50),"fixed negative pages cannot be move sources or destinations");
        check(c().canMovePage(20,30)&&c().canMovePage(30,20),"ordinary pages on the same side of a fixed page remain movable");
        check(!c().canMovePage(20,20)&&!c().canMovePage(404,20),"same-page and stale targets cannot be selected");
        action("move",10,30);order(10,-50,20,30);
        action("move",20,30);order(10,-50,30,20);

        setup();enable();bind(0,10,20);launcher.h.j=true;
        check(!c().canMovePage(0,10)&&!c().canMovePage(20,0),"protected native first screen is unavailable as a move target");
        check(c().canMovePage(10,20),"native first-screen protection leaves other targets available");
    }
    static void testPendingMutations()throws Throwable {
        setup();enable();bind(10,20);Result result=new Result();Result duplicate=new Result();ws.dragging=true;
        c().perform(()->c().move(10,20),result.done,result.error);
        c().perform(()->c().move(10,20),duplicate.done,duplicate.error);Handler.drain();order(10,20);
        ws.dragging=false;ticks(1);order(20,10);
        check(result.successes==1&&result.errors.isEmpty()&&duplicate.successes==0,"a pending action consumes repeated taps without duplicate mutations");

        setup();enable();bind(10,20);result=new Result();ws.inTransition=true;
        c().perform(()->c().move(10,20),result.done,result.error);ticks(30);order(10,20);
        check(result.successes==0&&result.errors.size()==1,"persistent transition fails once within the bounded wait");
        ws.inTransition=false;Result retry=new Result();c().perform(()->c().move(10,20),retry.done,retry.error);Handler.drain();order(20,10);
        check(retry.successes==1&&retry.errors.isEmpty(),"timed-out operation releases the next action");

        setup();enable();bind(10,20);result=new Result();ws.inTransition=true;
        c().perform(()->c().move(10,20),result.done,result.error);c().cancelPending();ws.inTransition=false;ticks(30);order(10,20);
        check(result.successes==0,"dismissed editor cancels a queued mutation");

        setup();enable();bind(10,20);result=new Result();ws.inTransition=true;
        c().perform(()->c().move(10,20),result.done,result.error);
        Workspace old=ws;C2 replacement=new C2(context);launcher=replacement;ws=replacement.workspace;bind(10,20);ticks(30);
        check(Arrays.equals(old.order.A(),new int[]{10,20}),"queued operation never mutates its detached workspace");order(10,20);
        check(result.successes==0,"queued operation cannot target a replacement workspace");
    }
    static void testAsyncAdd()throws Throwable {
        setup();enable();bind(10,20);View icon=content(10,"icon");CellLayout original=ws.n(10);Thread ui=Thread.currentThread();Result first=new Result(),duplicate=new Result();
        c().addPage(first.done,first.error);c().addPage(duplicate.done,duplicate.error);Handler.drain();
        check(ModelQueue.pending()==1&&z1.k2.allocations==0,"add queues exactly one native model operation despite duplicate taps");order(10,20);
        ModelQueue.drain();check(z1.k2.allocations==1&&z1.k2.allocatedOn!=ui,"native database ID lower bound is read on the model thread");order(10,20);
        Handler.drain();order(10,20,100);
        check(first.successes==1&&first.errors.isEmpty()&&duplicate.successes==0,"async add completes once after main-thread insertion");
        check(ws.insertedOn==ui&&ws.currentPage==2,"new page is inserted and selected on the UI thread");
        check(ws.n(10)==original&&original.contents.getChildAt(0)==icon,"adding an empty page preserves existing page and item identity");
        Result second=new Result();c().addPage(second.done,second.error);Handler.drain();finishModel();order(10,20,100,101);
        check(second.successes==1&&z1.k2.allocations==2,"constant database MAX(screen)+1 still creates a unique second empty page");

        setup();enable();bind(10,20);own().edit().putString("order","10,20,100,101").apply();Result saved=new Result();
        c().addPage(saved.done,saved.error);Handler.drain();finishModel();order(10,20,102);
        check(saved.successes==1&&saved.errors.isEmpty(),"new ID avoids empty pages retained only in persisted state");

        setup();enable();bind(10,20);Result databaseFailure=new Result();z1.k2.failOnce=true;
        c().addPage(databaseFailure.done,databaseFailure.error);Handler.drain();finishModel();order(10,20);
        check(databaseFailure.successes==0&&databaseFailure.errors.size()==1,"database failure reaches UI once without inserting a page");
        Result recovered=new Result();c().addPage(recovered.done,recovered.error);Handler.drain();finishModel();order(10,20,100);
        check(recovered.successes==1,"model failure releases the controller for retry");

        setup();enable();bind(10,20);home(10,0);List<View> before=new ArrayList<>(ws.children);Map<String,Object> preferences=new HashMap<>(nativePrefs().values);String savedOrder=own().getString("order","");LayoutTransition transition=ws.transition;
        Result insertFailure=new Result();c().addPage(insertFailure.done,insertFailure.error);Handler.drain();ModelQueue.drain();x1.Z.failOnce=true;Handler.drain();order(10,20);
        check(insertFailure.successes==0&&insertFailure.errors.size()==1,"async insertion failure returns one useful failure callback");
        check(ws.children.equals(before)&&nativePrefs().values.equals(preferences)&&own().getString("order","").equals(savedOrder)&&ws.transition==transition,"async add rollback preserves page identity, home preferences, saved order and animations");
        check(ModelQueue.submitted==1,"failed native mutation is never retried automatically");

        setup();enable();bind(10,20);Result stale=new Result();c().addPage(stale.done,stale.error);Handler.drain();ModelQueue.drain();Workspace old=ws;
        launcher=new C2(context);ws=launcher.workspace;bind(10,20);Handler.drain();
        check(Arrays.equals(old.order.A(),new int[]{10,20}),"async result does not insert into detached workspace");order(10,20);
        check(stale.successes==0,"async result cannot insert into replacement workspace");

        setup();enable();bind(10,20);Result rebound=new Result();c().addPage(rebound.done,rebound.error);Handler.drain();ModelQueue.drain();
        module.call("f",launcher,new x0(10,20));module.call("h",launcher,new z0());Handler.drain();order(10,20);
        check(rebound.successes==0,"rebinding the same workspace invalidates an outstanding allocation");

        setup();enable();bind(10,20);Result cancelled=new Result();c().addPage(cancelled.done,cancelled.error);Handler.drain();c().cancelPending();finishModel();order(10,20);
        check(cancelled.successes==0,"closing the editor cancels insertion after model allocation");

        setup();enable();bind(10,20);Result rejected=new Result();ModelQueue.reject=true;c().addPage(rejected.done,rejected.error);Handler.drain();order(10,20);
        check(rejected.successes==0&&rejected.errors.size()==1,"executor rejection fails once without leaking an active operation");
        ModelQueue.reject=false;Result afterReject=new Result();c().addPage(afterReject.done,afterReject.error);Handler.drain();finishModel();order(10,20,100);
        check(afterReject.successes==1,"executor rejection permits a later retry");

        setup();enable();bind(10,20);Result slow=new Result();c().addPage(slow.done,slow.error);Handler.drain();ticks(64);order(10,20);
        check(slow.successes==0&&slow.errors.size()==1,"stalled model queue times out and releases the pending action");
        Result next=new Result();c().addPage(next.done,next.error);Handler.drain();finishModel();order(10,20,100);
        check(next.successes==1&&next.errors.isEmpty()&&slow.successes==0&&slow.errors.size()==1,"late result from timed-out request cannot complete or cancel its successor");

        setup();enable();bind(10,20);Result settling=new Result();c().addPage(settling.done,settling.error);Handler.drain();ModelQueue.drain();ws.inTransition=true;Handler.drain();order(10,20);
        check(settling.successes==0,"allocation result waits if a new native transition has started");ws.inTransition=false;ticks(1);order(10,20,100);
        check(settling.successes==1&&ModelQueue.submitted==1,"post-allocation transition reuses the one model result");

        setup();enable();bind(10,20);Result disabled=new Result();c().addPage(disabled.done,disabled.error);Handler.drain();ModelQueue.drain();FeatureSettings.values.put(LauncherOptions.KEEP_EMPTY,false);Handler.drain();order(10,20);
        check(disabled.successes==0&&disabled.errors.size()==1,"feature disabled during allocation cannot create an empty page");

        setup();enable();bind(10,20);Result invalid=new Result();z1.k2.nextId=-1;c().addPage(invalid.done,invalid.error);Handler.drain();finishModel();order(10,20);
        check(invalid.successes==0&&invalid.errors.size()==1,"invalid native ID lower bound fails without a negative page");
    }
''')


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-launcher-pages-') as directory:
        root = Path(directory)
        for name, text in SOURCES.items():
            path = root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding='utf-8')
        hooks = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
        files = list(root.rglob('*.java')) + [hooks / name for name in (
            'LauncherPagesHook.java', 'LauncherPageOrder.java', 'TargetReflection.java')]
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(root / 'classes'), *map(str, files)], check=True)
        subprocess.run(['java', '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestLauncherPagesLifecycle'], check=True)


if __name__ == '__main__':
    main()
