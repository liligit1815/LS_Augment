"""Run the production edit-only indicator hook against both inspected OEM families.

These boundary doubles verify dispatch, state changes, ownership and redraw requests,
not GPU display-list behavior or the final phone UI.
"""
from pathlib import Path
import os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com/hook/LauncherPageIndicatorHook.java'
COMMON={
'android/graphics/Canvas.java':'package android.graphics;public class Canvas {public int draws;}',
'android/content/res/Resources.java':'''package android.content.res;import java.util.*;public class Resources {
public final Map<String,Integer> ids=new HashMap<>();public int lookups;public Resources(){ids.put("page_indicator_mfv",10);ids.put("mfv_page_indicator_launcher",11);ids.put("mfv_page_indicator_miboard",12);}
public int getIdentifier(String n,String type,String pkg){lookups++;return ids.getOrDefault(n,0);}}''',
'android/content/Context.java':'''package android.content;public class Context {public final android.content.res.Resources res=new android.content.res.Resources();public android.content.res.Resources getResources(){return res;}public String getPackageName(){return "com.zte.mifavor.launcher";}}''',
'android/view/View.java':'''package android.view;import android.content.Context;import android.graphics.Canvas;import java.util.*;
public class View {public final Context context;public ViewGroup parent;public int id,invalidations,visibility=0;public float alpha=1;public static final List<Runnable> queue=new ArrayList<>();
public View(Context c){context=c;}public Context getContext(){return context;}public ViewGroup getParent(){return parent;}public int getId(){return id;}
public View findViewById(int n){return id==n?this:null;}public void postInvalidateOnAnimation(){invalidations++;}public boolean post(Runnable r){queue.add(r);return true;}
public static void drain(){for(Runnable r:new ArrayList<>(queue)){queue.remove(r);r.run();}}protected void onDraw(Canvas c){c.draws++;}public void setVisibility(int v){visibility=v;}}
''',
'android/view/ViewGroup.java':'''package android.view;import java.util.*;public class ViewGroup extends View {
public final List<View> children=new ArrayList<>();public ViewGroup(android.content.Context c){super(c);}public void add(View v){children.add(v);v.parent=this;}
public View findViewById(int id){View self=super.findViewById(id);if(self!=null)return self;for(View v:children){View hit=v.findViewById(id);if(hit!=null)return hit;}return null;}}
''',
'ls/augment/com/LauncherOptions.java':'package ls.augment.com;public class LauncherOptions {public static final String PAGE_INDICATOR_EDIT_ONLY="indicator";}',
'ls/augment/com/ConfigSnapshot.java':'package ls.augment.com;public class ConfigSnapshot {public final boolean enabled;public ConfigSnapshot(boolean on){enabled=on;}public String get(String key){return enabled?"1":"0";}}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import java.util.*;import android.content.Context;import ls.augment.com.ConfigSnapshot;
public class FeatureSettings {static ConfigSnapshot current=new ConfigSnapshot(false);static final List<Runnable> listeners=new ArrayList<>();static final List<String> diagnostics=new ArrayList<>();
static ConfigSnapshot snapshot(Context c){return current;}static boolean addSnapshotListener(Context c,Runnable r){if(!listeners.contains(r))listeners.add(r);return true;}
static void publish(boolean on){current=new ConfigSnapshot(on);for(Runnable r:new ArrayList<>(listeners))r.run();}static void diagnostic(Context c,String k,String v){diagnostics.add(v);}}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
public class AugmentModule {
interface Interceptor {Object call(Chain c)throws Throwable;}interface Chain {Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;}
static class Registration {Method method;Interceptor callback;Registration(Method m,Interceptor c){method=m;callback=c;}}
static class Builder {Method method;Builder(Method m){method=m;}Registration intercept(Interceptor c){return new Registration(method,c);}}
final Map<Method,Registration> hooks=new LinkedHashMap<>();final List<Throwable> errors=new ArrayList<>();final Set<String> ids=new HashSet<>();int failRegistration=-1;
Builder prepareFeatureHook(Method m,String id,boolean before){if(!ids.add(id))throw new AssertionError("duplicate hook id "+id);return new Builder(m);}
void registerFeatureHook(Registration r){if(hooks.size()==failRegistration)throw new IllegalStateException("fixture registration failed");if(hooks.put(r.method,r)!=null)throw new AssertionError("duplicate declaration");}
void deoptimize(Method m){}void logFeatureError(String phase,Throwable error){errors.add(error);}
static Method find(Class<?> type,String name,Class<?>...args)throws Exception{for(Class<?> at=type;at!=null;at=at.getSuperclass())try{Method m=at.getDeclaredMethod(name,args);m.setAccessible(true);return m;}catch(NoSuchMethodException e){}throw new NoSuchMethodException(name);}
Object call(Object target,String name,Class<?>[] types,Object...args)throws Throwable {Method m=find(target.getClass(),name,types);Registration r=hooks.get(m);
Chain chain=new Chain(){public Object getThisObject(){return target;}public Object getArg(int i){return args[i];}public Object proceed()throws Throwable {try{return m.invoke(target,args);}catch(InvocationTargetException e){throw e.getCause();}}};return r==null?chain.proceed():r.callback.call(chain);}
}''',
}

def sources(named,wrong=False):
    n=dict(launcher='Launcher',paged='PagedView',middle='ZtePagedViewImpl',state='LauncherState',base='BaseState',manager='StateManager',menu='MenuOverviewState',edit='MENU_OVERVIEW',normal='NORMAL',getstate='getState',start='onStateSetStart',end='onStateSetEnd',getworkspace='getWorkspace',owner='mLauncher',bound='mPagedView',attach='attach')
    if not named:n.update(launcher='C2',paged='V4',middle='T6',state='V3',base='a',manager='d',menu='l',edit='A',normal='p',getstate='C',start='d4',end='c4',getworkspace='B2',owner='x',bound='v',attach='g')
    data=dict(COMMON)
    def add(path,body):
        for k,v in n.items():path=path.replace('@'+k+'@',v);body=body.replace('@'+k+'@',v)
        data[path]=body
    add('com/android/launcher3/statemanager/@base@.java','package com.android.launcher3.statemanager;public interface @base@ {}')
    add('com/android/launcher3/@state@.java','''package com.android.launcher3;public class @state@ implements com.android.launcher3.statemanager.@base@ {
public static final @state@ @normal@=new @state@(),@edit@=new com.android.launcher3.menu.@menu@(),EDIT_MODE=new @state@(),OVERVIEW=new @state@();}''')
    add('com/android/launcher3/menu/@menu@.java','package com.android.launcher3.menu;public class @menu@ extends com.android.launcher3.@state@ {}')
    add('com/android/launcher3/statemanager/@manager@.java','''package com.android.launcher3.statemanager;public class @manager@ {public @base@ value=com.android.launcher3.@state@.@normal@;public boolean fail;public @base@ @getstate@(){if(fail)throw new IllegalStateException("native getter failed");return value;}}''')
    add('com/android/launcher3/@launcher@.java','''package com.android.launcher3;public class @launcher@ extends android.content.Context {
public Workspace workspace;public int starts,ends,resumes;public com.android.launcher3.statemanager.@manager@ manager=new com.android.launcher3.statemanager.@manager@();
public Workspace @getworkspace@(){return workspace;}public com.android.launcher3.statemanager.@manager@ getStateManager(){return manager;}
public void @start@(@state@ state){starts++;manager.value=state;}public void @end@(@state@ state){ends++;manager.value=state;}protected void onResume(){resumes++;}}''')
    add('com/android/launcher3/SubLauncher.java','''package com.android.launcher3;public class SubLauncher extends @launcher@ {
@Override public void @start@(@state@ state){starts++;manager.value=state;}@Override public void @end@(@state@ state){ends++;manager.value=state;}@Override public void onResume(){resumes++;}}''')
    add('com/android/launcher3/pageindicators/MfvPageIndicatorLayout.java','package com.android.launcher3.pageindicators;public class MfvPageIndicatorLayout extends android.view.ViewGroup {public MfvPageIndicatorLayout(android.content.Context c){super(c);id=10;}}')
    add('com/android/launcher3/pageindicators/MfvPageIndicatorImpl.java','''package com.android.launcher3.pageindicators;public class MfvPageIndicatorImpl extends android.view.View {
public '''+('Object' if wrong else 'android.view.ViewGroup')+''' @bound@;public boolean nativeSkip,throwDraw;public int nativeCalls;
public MfvPageIndicatorImpl(android.content.Context c){super(c);}public void @attach@(android.view.ViewGroup pageOwner){@bound@=pageOwner;}
protected void onDraw(android.graphics.Canvas c){nativeCalls++;if(throwDraw)throw new IllegalStateException("native drawing failed");if(!nativeSkip)c.draws++;}}''')
    add('com/android/launcher3/pageindicators/SubIndicator.java','''package com.android.launcher3.pageindicators;public class SubIndicator extends MfvPageIndicatorImpl {
public SubIndicator(android.content.Context c){super(c);}@Override public void onDraw(android.graphics.Canvas c){nativeCalls++;if(!nativeSkip)c.draws++;}}''')
    add('com/android/launcher3/pageindicators/InheritedIndicator.java','''package com.android.launcher3.pageindicators;public class InheritedIndicator extends MfvPageIndicatorImpl {public InheritedIndicator(android.content.Context c){super(c);}}''')
    add('com/android/launcher3/@paged@.java','''package com.android.launcher3;import com.android.launcher3.pageindicators.*;public class @paged@ extends android.view.ViewGroup {
public MfvPageIndicatorImpl mMfvPageIndicator,mMfvPageIndicatorMiboard;public MfvPageIndicatorLayout layout;public int binds;
public @paged@(android.content.Context c){super(c);}public void iniMfvPageIndicator(android.view.View root){binds++;}public MfvPageIndicatorLayout getMfvPageIndicatorLayout(){return layout;}}''')
    add('com/android/launcher3/@middle@.java','package com.android.launcher3;public class @middle@ extends @paged@ {public @middle@(android.content.Context c){super(c);}}')
    add('com/android/launcher3/Workspace.java','''package com.android.launcher3;public class Workspace extends @middle@ {public @launcher@ @owner@;public Workspace(@launcher@ l){super(l);@owner@=l;l.workspace=this;}}''')
    add('com/android/launcher3/SubWorkspace.java','package com.android.launcher3;public class SubWorkspace extends Workspace {public SubWorkspace(@launcher@ l){super(l);}}')
    add('ls/augment/com/hook/IndicatorCases.java','''package ls.augment.com.hook;
import com.android.launcher3.*;import com.android.launcher3.pageindicators.*;import android.view.*;import android.graphics.Canvas;
public class IndicatorCases {
static int checks;static AugmentModule module;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
static Object call(Object o,String name,Class<?>[] types,Object...args)throws Throwable{return module.call(o,name,types,args);}
static void state(@launcher@ l,String phase,@state@ s)throws Throwable{call(l,phase,new Class[]{@state@.class},s);}
static int draw(MfvPageIndicatorImpl v)throws Throwable{Canvas c=new Canvas();call(v,"onDraw",new Class[]{Canvas.class},c);return c.draws;}
static Workspace setup(@launcher@ l,int variant)throws Throwable{
Workspace w=variant>0?new SubWorkspace(l):new Workspace(l);w.layout=new MfvPageIndicatorLayout(l);
w.mMfvPageIndicator=variant==1?new SubIndicator(l):variant==2?new InheritedIndicator(l):new MfvPageIndicatorImpl(l);
w.mMfvPageIndicatorMiboard=new MfvPageIndicatorImpl(l);w.mMfvPageIndicator.id=11;w.mMfvPageIndicatorMiboard.id=12;
w.layout.add(w.mMfvPageIndicator);w.layout.add(w.mMfvPageIndicatorMiboard);
call(w.mMfvPageIndicator,"@attach@",new Class[]{ViewGroup.class},w);call(w.mMfvPageIndicatorMiboard,"@attach@",new Class[]{ViewGroup.class},w);
call(w,"iniMfvPageIndicator",new Class[]{View.class},w.layout);View.drain();return w;}
public static void main(String[] args)throws Throwable {
module=new AugmentModule();ClassLoader loader=IndicatorCases.class.getClassLoader();
if(args[0].equals("missing"))loader=new ClassLoader(loader){protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.equals("com.android.launcher3.menu.@menu@"))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
if(args[0].equals("partial"))module.failRegistration=2;
LauncherPageIndicatorHook.install(module,loader);
if(args[0].equals("missing")||args[0].equals("wrong")){check(module.hooks.isEmpty(),"incomplete contract registers no hooks");check(module.errors.size()==1,"missing capability is diagnosed");FeatureSettings.publish(true);check(draw(new MfvPageIndicatorImpl(new @launcher@()))==1,"unknown family stays native");System.out.println(args[0]+" passed "+checks);return;}
if(args[0].equals("partial")){check(module.errors.size()==1,"partial install diagnosed");FeatureSettings.publish(true);check(draw(new MfvPageIndicatorImpl(new @launcher@()))==1,"partial hooks cannot suppress native drawing");System.out.println("partial passed "+checks);return;}
check(module.errors.isEmpty(),"installation succeeds");
@launcher@ l=new @launcher@();Workspace w=setup(l,0);MfvPageIndicatorImpl dots=w.mMfvPageIndicator,mi=w.mMfvPageIndicatorMiboard;
for(Throwable error:module.errors)error.printStackTrace();check(module.errors.isEmpty(),"binding completes without errors");
check(draw(dots)==1&&draw(mi)==1,"off retains both native dots");int invalid=dots.invalidations;FeatureSettings.publish(true);
check(dots.invalidations>invalid&&FeatureSettings.listeners.size()==1,"config publication redraws existing views once");
check(draw(dots)==0&&draw(mi)==0,"normal desktop suppresses both");
dots.visibility=0;dots.alpha=.7f;check(draw(dots)==0&&dots.alpha==.7f&&dots.visibility==0,"native visibility refresh cannot bypass draw gate or change geometry");
invalid=dots.invalidations;state(l,"@start@",@state@.@edit@);check(dots.invalidations>invalid,"start invalidates cached draw");check(draw(dots)==1&&draw(mi)==1,"edit restores native drawing");
dots.nativeSkip=true;check(draw(dots)==0,"native single-page/concise suppression retained in edit");dots.nativeSkip=false;
state(l,"@end@",@state@.@edit@);check(draw(dots)==1,"edit end stays visible");
state(l,"@start@",@state@.@normal@);check(draw(dots)==0,"leaving edit hides at start");state(l,"@end@",@state@.@edit@);check(draw(dots)==1,"cancelled exit resyncs native state");
for(@state@ s:new @state@[]{@state@.@normal@,@state@.EDIT_MODE,@state@.OVERVIEW}){state(l,"@start@",s);check(draw(dots)==0,"other native state is not menu edit");}
FeatureSettings.publish(false);check(draw(dots)==1,"disable restores without restarting");FeatureSettings.publish(true);
MfvPageIndicatorImpl folder=new MfvPageIndicatorImpl(l);call(folder,"@attach@",new Class[]{ViewGroup.class},new ViewGroup(l));View.drain();check(draw(folder)==1,"folder is never bound");
MfvPageIndicatorImpl impostor=new MfvPageIndicatorImpl(l);impostor.@bound@=w;check(draw(impostor)==1,"workspace pointer alone does not grant ownership");
ViewGroup parent=dots.parent;dots.parent=new ViewGroup(l);check(draw(dots)==1,"reparented dot stays native");dots.parent=parent;
l.manager.value=null;check(draw(dots)==1,"unknown state keeps native");int errors=module.errors.size();draw(dots);check(module.errors.size()==errors,"runtime diagnostics are bounded");l.manager.value=@state@.@normal@;
int reads=l.res.lookups;for(int i=0;i<1000;i++)draw(dots);check(l.res.lookups==reads,"drawing performs no resource lookups");
@launcher@ sub=new SubLauncher();Workspace sw=setup(sub,1);check(draw(sw.mMfvPageIndicator)==0,"override without super is hooked");int registered=module.hooks.size();
state(sub,"@start@",@state@.@edit@);check(draw(sw.mMfvPageIndicator)==1,"subclass state callback restores");state(sub,"@end@",@state@.@normal@);check(draw(sw.mMfvPageIndicator)==0,"subclass end callback hides");
invalid=sw.mMfvPageIndicator.invalidations;call(sub,"onResume",new Class[]{});check(sw.mMfvPageIndicator.invalidations>invalid,"subclass resume refreshes");check(module.hooks.size()==registered,"declarations are deduplicated");
Workspace inherited=setup(new @launcher@(),2);check(draw(inherited.mMfvPageIndicator)==0,"inherited subclass draw is hooked");
Workspace newer=setup(l,0);check(draw(dots)==1&&draw(newer.mMfvPageIndicator)==0,"rebuild detaches old workspace identity");
@launcher@ bad=new @launcher@();bad.res.ids.remove("mfv_page_indicator_miboard");Workspace bw=setup(bad,0);check(draw(bw.mMfvPageIndicator)==1,"missing resource stays native");
bad.res.ids.put("mfv_page_indicator_miboard",12);call(bw,"iniMfvPageIndicator",new Class[]{View.class},bw.layout);check(draw(bw.mMfvPageIndicator)==0,"valid rebind can recover");
state(bad,"@start@",@state@.@edit@);bw.mMfvPageIndicator.throwDraw=true;int calls=bw.mMfvPageIndicator.nativeCalls;boolean thrown=false;try{draw(bw.mMfvPageIndicator);}catch(IllegalStateException expected){thrown=true;}
check(thrown&&bw.mMfvPageIndicator.nativeCalls==calls+1,"native exception propagates without retrying original");
check(FeatureSettings.listeners.size()==1,"no duplicate snapshot listeners across launchers");check(l.starts>0&&l.ends>0&&w.binds==1,"native lifecycle preserved");
for(java.lang.reflect.Method m:module.hooks.keySet())check(!m.getDeclaringClass().getName().startsWith("android."),"no global framework view hooks");
System.out.println("@launcher@ runtime passed "+checks+" assertions; "+module.hooks.size()+" OEM hook declarations");}
}''')
    return data

def main():
    java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    for named in (False,True):
        for wrong in (False,True):
            with tempfile.TemporaryDirectory(prefix='duo-indicator-') as directory:
                work=Path(directory);paths=[]
                for name,body in sources(named,wrong).items():
                    p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body,encoding='utf-8');paths.append(str(p))
                subprocess.run([str(java/'javac'),'-encoding','UTF-8','--release','17','-d',directory,*paths,str(SRC)],check=True)
                for case in (['wrong'] if wrong else ['runtime','missing','partial']):
                    subprocess.run([str(java/'java'),'-cp',directory,'ls.augment.com.hook.IndicatorCases',case],check=True,timeout=25)

if __name__=='__main__':main()
