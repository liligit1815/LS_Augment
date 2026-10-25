"""Run production customization hooks with boundary doubles for both inspected ROMs.

Checks native fall-through, bitmap/label replacement and restoration, persistence,
empty boot, incompatible metadata, and the delayed initialization failure path.
"""
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    'android/graphics/Bitmap.java': 'package android.graphics; public class Bitmap {public int getWidth(){return 32;} public int getHeight(){return 32;}}',
    'android/graphics/BitmapFactory.java': 'package android.graphics; public class BitmapFactory {public static final Bitmap IMAGE=new Bitmap(); public static Bitmap decodeStream(java.io.InputStream in){return IMAGE;}}',
    'android/net/Uri.java': 'package android.net; public class Uri {public static Uri parse(String s){return new Uri();}}',
    'android/os/UserHandle.java': 'package android.os; public class UserHandle {public int id;public int getIdentifier(){return id;}}',
    'android/os/Looper.java': 'package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}',
    'android/os/SystemClock.java': 'package android.os; public class SystemClock {public static long now; public static long elapsedRealtime(){return now;}}',
    'android/os/Handler.java': '''package android.os;
import java.util.*;
public class Handler {
    static final Map<Runnable,Long> queue=new LinkedHashMap<>(); public Handler(Looper l){}
    public boolean post(Runnable r){return postDelayed(r,0);}
    public boolean postDelayed(Runnable r,long delay){synchronized(queue){queue.put(r,SystemClock.now+delay);}return true;}
    public void removeCallbacks(Runnable r){synchronized(queue){queue.remove(r);}}
    public static int pending(){synchronized(queue){return queue.size();}}
    public static void drain(){for(int n=0;n<100;n++){Runnable ready=null;synchronized(queue){for(var e:queue.entrySet())if(e.getValue()<=SystemClock.now){ready=e.getKey();break;}if(ready!=null)queue.remove(ready);}if(ready==null)return;ready.run();}throw new AssertionError("unbounded callbacks");}
}''',
    'android/content/pm/PackageManager.java': 'package android.content.pm; public class PackageManager {public CharSequence getUserBadgedLabel(CharSequence s,android.os.UserHandle u){return s+"@"+u.id;}}',
    'android/content/ContentResolver.java': 'package android.content; public class ContentResolver {public java.io.InputStream openInputStream(android.net.Uri uri){return new java.io.ByteArrayInputStream(new byte[1]);}}',
    'android/content/Context.java': '''package android.content; public class Context {
        public boolean broken; public Context getApplicationContext(){if(broken)throw new IllegalStateException("context failure");return this;}
        public ContentResolver getContentResolver(){return new ContentResolver();}
        public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
    }''',
    'android/view/View.java': 'package android.view; public class View {public final android.content.Context context;public View(android.content.Context c){context=c;}public android.content.Context getContext(){return context;}}',
    'ls/augment/com/BuildConfig.java': 'package ls.augment.com; public class BuildConfig {public static final boolean DEBUG=true;}',
    'ls/augment/com/ConfigSchema.java': 'package ls.augment.com; public class ConfigSchema {public static final String LAUNCHER_OVERRIDES="overrides";}',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;
import android.content.Context;import java.util.*;
public class FeatureSettings {
    static volatile String value="";static Context context;static boolean broken,subscribeBroken;
    static final List<Runnable> listeners=new ArrayList<>();static final Map<String,String> diagnostics=new HashMap<>();
    static Context from(Object o){if(broken)throw new LinkageError("application lookup failure");return context;}
    static String text(Context c,String key,String fallback){return value;}
    static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);if(subscribeBroken)throw new IllegalStateException("listener failure");return true;}
    static void removeSnapshotListener(Runnable r){listeners.remove(r);}
    static void diagnostic(Context c,String key,String value){diagnostics.put(key,value);}
}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
public class AugmentModule {
    interface Hook {Object intercept(Chain c)throws Throwable;}
    static class Chain {final Object owner;final Object[] args;final Method method;int proceeds;
        Chain(Object o,Method m,Object[] a){owner=o;method=m;args=a;}
        Object getArg(int i){return args[i];}Object getThisObject(){return owner;}
        Object proceed()throws Throwable{proceeds++;try{return method.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}
    }
    class Builder {final String id;final Method method;Builder(String i,Method m){id=i;method=m;}
        Object intercept(Hook h){hooks.put(id,h);methods.put(id,method);return h;}}
    final Map<String,Hook> hooks=new HashMap<>();final Map<String,Method> methods=new HashMap<>();final List<String> errors=new ArrayList<>();
    Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(id,m);}
    void registerFeatureHook(Object h){}void logFeatureError(String id,Throwable e){errors.add(id);System.err.println(id+": "+e);}
    Object invoke(String id,Object owner,Object...args)throws Throwable{Chain c=new Chain(owner,methods.get(id),args);Object result=hooks.get(id).intercept(c);if(c.proceeds!=1)throw new AssertionError("native call count="+c.proceeds);return result;}
}''',
    'com/android/launcher3/model/data/y.java': '''package com.android.launcher3.model.data;
public class y {public CharSequence title="Original",contentDescription="Original description";public android.os.UserHandle user=new android.os.UserHandle();public int itemType;
    public CharSequence persisted;public String getTargetPackage(){return "test.app";}public void writeToValues(){persisted=title;}}
''',
    'com/android/launcher3/model/data/z.java': '''package com.android.launcher3.model.data;
public class z extends y {public ICON.d g=new ICON.d(new android.graphics.Bitmap(),5);
    public ICON.o G(android.content.Context c,int flags){return new ICON.o(g);}
}''',
    'com/android/launcher3/model/data/I.java': 'package com.android.launcher3.model.data; public class I extends z {public ICON.d savedIcon;public void onAddToDatabase(){persisted=title;savedIcon=g;}}',
    'com/android/launcher3/BubbleTextView.java': '''package com.android.launcher3;
public class BubbleTextView extends android.view.View {public CharSequence text;private ICON.o drawable;
    public BubbleTextView(android.content.Context c){super(c);}public void B(com.android.launcher3.model.data.y i){text=i.title;drawable=new ICON.o(((com.android.launcher3.model.data.z)i).g);}public ICON.o getIcon(){return drawable;}}
''',
    'MODEL_STATE.java': '''package com.android.launcher3;
public class STATE {public static final STATE INSTANCE=new STATE();public static STATE h(android.content.Context c){return INSTANCE;}public Model j(){return new Model();}
public static class Model {public static int refreshes;public void a0(){refreshes++;}}}
''',
    'ICON/d.java': '''package ICON;
public class d {public final android.graphics.Bitmap a;public final int b;public int d;private d f;
    public d(android.graphics.Bitmap bitmap,int color){a=bitmap;b=color;}public void badge(d badge){f=badge;}public d badge(){return f;}}
''',
    'ICON/o.java': 'package ICON;public class o {public final d h;public o(d info){h=info;}}',
    'ls/augment/com/hook/TestLauncherCustomization.java': '''package ls.augment.com.hook;
import android.content.Context;import android.os.*;import android.graphics.*;import com.android.launcher3.*;import com.android.launcher3.model.data.*;import ls.augment.com.LauncherOverrides;import java.lang.reflect.*;
public class TestLauncherCustomization {
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    static Object controller()throws Exception{Field f=LauncherCustomizationHook.class.getDeclaredField("controller");f.setAccessible(true);return f.get(null);}
    static void settle()throws Exception{for(int i=0;i<500;i++){Handler.drain();Object c=controller();if(c!=null){Field f=c.getClass().getDeclaredField("last");f.setAccessible(true);if(FeatureSettings.value.equals(f.get(c)))return;}Thread.sleep(2);}throw new AssertionError("configuration did not settle");}
    static void configure(String text)throws Exception{FeatureSettings.value=text;for(Runnable r:FeatureSettings.listeners)r.run();settle();}
    public static void main(String[] args)throws Throwable {
        String mode=args[0];Context context=new Context();FeatureSettings.context=context;AugmentModule module=new AugmentModule();
        boolean unsupported=Boolean.getBoolean("unsupported");
        try {
            LauncherCustomizationHook.install(module,TestLauncherCustomization.class.getClassLoader());
            check(module.hooks.containsKey("launcher.icon")&&module.hooks.containsKey("launcher.label"),"hooks installed");
            if(mode.equals("delayedFailure")||mode.equals("sourceFailure")||mode.equals("subscribeFailure")){
                context.broken=mode.equals("delayedFailure");FeatureSettings.broken=mode.equals("sourceFailure");FeatureSettings.subscribeBroken=mode.equals("subscribeFailure");
                SystemClock.now=1500;Handler.drain();check(controller()==null,"failed initialization cannot publish a controller");
                int errors=module.errors.size();check(module.errors.contains("LAUNCHER_CUSTOM_DISABLED"),"failure reported");
                for(int n=0;n<50;n++)module.invoke("launcher.icon",new I(),context,0);
                check(module.errors.size()==errors&&Handler.pending()==0&&FeatureSettings.listeners.isEmpty(),"failure latched without delayed retries or listener leaks");
            }else if(mode.equals("lateContext")){
                FeatureSettings.context=null;for(int i=0;i<25;i++){SystemClock.now+=1500;Handler.drain();}
                check(Handler.pending()==0,"context polling bounded");FeatureSettings.context=context;
                module.invoke("launcher.icon",new I(),context,0);settle();check(controller()!=null,"native callback recovers after context becomes available");
            }else{
                I item=new I();ICON.d original=item.g;original.d=7;ICON.d badge=new ICON.d(new Bitmap(),9);original.badge(badge);
                BubbleTextView view=new BubbleTextView(context);
                module.invoke("launcher.icon",item,context,0);settle();SystemClock.now=1500;Handler.drain();
                check(STATE.Model.refreshes==0,"empty boot does not reload launcher model");
                String custom=LauncherOverrides.empty().with(new LauncherOverrides.Entry(0,"test.app","Custom","a".repeat(64))).serialize();
                configure(custom);module.invoke("launcher.label",view,item);ICON.o drawn=(ICON.o)module.invoke("launcher.icon",item,context,0);
                check(view.text.equals("Custom")&&item.contentDescription.equals("Custom@0"),"label and accessibility name updated");
                if(unsupported){check(item.g==original,"unsupported bitmap contract keeps native icon");check(module.errors.contains("LAUNCHER_ICON_UNSUPPORTED_KEEP_NATIVE"),"unsupported binding diagnosed");}
                else {check(drawn.h.a==BitmapFactory.IMAGE&&item.g!=original,"actual model and drawn pixels replaced");check(item.g.d==7&&item.g.badge()==badge,"profile flags and badge retained");}
                I other=new I();other.user.id=10;module.invoke("launcher.label",view,other);check(other.title.equals("Original"),"other user unaffected");
                module.invoke("launcher.persistence.I.onAddToDatabase",item);check(item.persisted.equals("Original")&&item.savedIcon==original,"persistence sees original name and bitmap");check(item.title.equals("Custom"),"customization reapplied after persistence");
                check(STATE.Model.refreshes==1,"edit refreshes native model once");
                configure("");check(item.title.equals("Original")&&item.contentDescription.equals("Original description")&&item.g==original,"clearing edit restores original model");check(STATE.Model.refreshes==2,"removal refreshes native model");
                if(!unsupported)check(module.errors.isEmpty(),"supported contract has no errors: "+module.errors);
            }
            System.out.println("PASS "+System.getProperty("variant")+" "+mode);
        }finally{Object c=controller();if(c!=null){Method close=c.getClass().getDeclaredMethod("close");close.setAccessible(true);close.invoke(c);}}
    }
}''',
}


def main():
    hooks = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
    for variant in ('baseline', 'target', 'unsupported', 'ambiguous', 'named', 'named-unsupported', 'named-ambiguous'):
        named = variant.startswith('named')
        icon = 'com.android.launcher3.icons' if named else ('s1' if variant == 'baseline' else 'u1')
        state = 'LauncherAppState' if named else ('P2' if variant == 'baseline' else 'V2')
        with tempfile.TemporaryDirectory(prefix='lsa-launcher-custom-') as directory:
            root = Path(directory)
            for name, text in SOURCES.items():
                if named:
                    for before, after in [('y', 'ItemInfo'), ('z', 'ItemInfoWithIcon'), ('I', 'WorkspaceItemInfo')]:
                        name = name.replace('/' + before + '.java', '/' + after + '.java')
                        text = re.sub(r'\b' + before + r'\b', after, text)
                    name = name.replace('ICON/d.java', 'ICON/BitmapInfo.java').replace('ICON/o.java', 'ICON/FastBitmapDrawable.java')
                    text = text.replace('ICON.d', 'ICON.BitmapInfo').replace('ICON.o', 'ICON.FastBitmapDrawable')
                    text = text.replace(' G(', ' newIcon(').replace(' void B(', ' void applyLabel(')
                    text = text.replace('STATE h(', 'STATE getInstance(').replace('Model j()', 'Model getModel()').replace('void a0()', 'void forceReload()')
                    text = text.replace('item.g', 'item.bitmap').replace(' g=', ' bitmap=').replace('(g)', '(bitmap)').replace(')i).g', ')i).bitmap').replace('savedIcon=g', 'savedIcon=bitmap')
                    text = text.replace('original.d', 'original.flags').replace('item.bitmap.d', 'item.bitmap.flags').replace('drawn.h.a', 'drawn.h.icon')
                    if name == 'ICON/BitmapInfo.java':
                        text = '''package ICON;
public class BitmapInfo {public final android.graphics.Bitmap icon;public final int color;public int flags;private BitmapInfo badgeInfo;
    public BitmapInfo(android.graphics.Bitmap bitmap,int color){icon=bitmap;this.color=color;}public void badge(BitmapInfo badge){badgeInfo=badge;}public BitmapInfo badge(){return badgeInfo;}}
'''
                    if name == 'ICON/FastBitmapDrawable.java':
                        text = 'package ICON;public class FastBitmapDrawable {public final BitmapInfo h;public FastBitmapDrawable(BitmapInfo info){h=info;}}'
                name = name.replace('MODEL_STATE', 'com/android/launcher3/' + state).replace('ICON', icon)
                name = name.replace(icon + '/', icon.replace('.', '/') + '/')
                text = text.replace('ICON.', icon + '.').replace('package ICON;', 'package ' + icon + ';').replace('STATE', state)
                if variant == 'unsupported' and name == icon + '/d.java':
                    text = text.replace('private d f;', 'private Object f;').replace('return f;', 'return (d)f;')
                if variant == 'ambiguous' and name == 'com/android/launcher3/model/data/z.java':
                    text = text.replace('extends y {', 'extends y {public ' + icon + '.d second;')
                if variant == 'named-unsupported' and name.endswith('/icons/BitmapInfo.java'):
                    text = text.replace('private BitmapInfo badgeInfo;', 'private Object badgeInfo;').replace('return badgeInfo;', 'return (BitmapInfo)badgeInfo;')
                if variant == 'named-ambiguous' and name.endswith('/model/data/ItemInfoWithIcon.java'):
                    text = text.replace('extends ItemInfo {', 'extends ItemInfo {public ' + icon + '.BitmapInfo second;')
                path = root / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(text, encoding='utf-8')
            # The target still contains P2, but it is an unrelated Runnable, not the app state.
            if state == 'V2':
                (root / 'com/android/launcher3/P2.java').write_text('package com.android.launcher3; public class P2 implements Runnable {public void run(){throw new AssertionError("wrong P2");}}')
                decoy = root / 's1/d.java'
                decoy.parent.mkdir(exist_ok=True)
                decoy.write_text('package s1; public class d {}')
            files = list(root.rglob('*.java')) + [hooks / name for name in (
                'LauncherCustomizationHook.java', 'LauncherIconBinding.java', 'LauncherImmutableIcon.java', 'LauncherModelRefresh.java', 'TargetReflection.java')]
            files.append(ROOT / 'android/app/src/main/java/ls/augment/com/LauncherOverrides.java')
            subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(root / 'classes'), *map(str, files)], check=True)
            modes = ('happy', 'delayedFailure', 'sourceFailure', 'subscribeFailure', 'lateContext') if variant in ('target', 'named') else ('happy',)
            for mode in modes:
                subprocess.run(['java', '-cp', str(root / 'classes'), '-Dvariant=' + variant,
                                '-Dunsupported=' + str(variant in ('unsupported', 'ambiguous', 'named-unsupported', 'named-ambiguous')).lower(),
                                'ls.augment.com.hook.TestLauncherCustomization', mode], check=True, timeout=15)


if __name__ == '__main__':
    main()
