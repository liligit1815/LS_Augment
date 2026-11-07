"""Run the production search hooks against the two OEM hierarchies and an unknown layout."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1]
fixtures = {
    'android.graphics.Color': 'public class Color {public static final int TRANSPARENT=0;}',
    'android.graphics.Rect': 'public class Rect {}',
    'android.graphics.drawable.Drawable': 'public class Drawable {}',
    'android.graphics.drawable.ColorDrawable': 'public class ColorDrawable extends Drawable {public ColorDrawable(int color){}}',
    'android.os.Bundle': 'public class Bundle {}',
    'android.os.Looper': 'public class Looper {public static Looper myLooper(){return MAIN;} public static Looper getMainLooper(){return MAIN;} static final Looper MAIN=new Looper();}',
    'android.content.res.Resources': '''public class Resources {
        public static class NotFoundException extends RuntimeException {}
        String[] names={"","search_aty_bg","search_main_aty_layout","search_aty_bg_blur"};
        public int getIdentifier(String name,String type,String pkg){return java.util.Arrays.asList(names).indexOf(name);}
        public String getResourceEntryName(int id){return names[id];}
        public String getResourcePackageName(int id){return "com.zte.mifavor.zsearch";}
    }''',
    'android.view.ViewTreeObserver': '''public class ViewTreeObserver {
        public interface OnGlobalLayoutListener {void onGlobalLayout();}
        public OnGlobalLayoutListener listener;
        public void addOnGlobalLayoutListener(OnGlobalLayoutListener l){listener=l;}
        public void removeOnGlobalLayoutListener(OnGlobalLayoutListener l){if(listener==l)listener=null;}
        public boolean isAlive(){return true;}
    }''',
    'android.view.View': '''import android.graphics.Rect;import android.graphics.drawable.Drawable;
    public class View {
        public static final int NO_ID=-1; public int id=NO_ID; public boolean clickable;
        public ViewGroup parent; public Drawable background; public Rect clip;
        public ViewGroup.LayoutParams size=new ViewGroup.LayoutParams(); public ViewTreeObserver tree=new ViewTreeObserver();
        public int getId(){return id;} public ViewGroup getParent(){return parent;}
        public View getRootView(){return parent==null?this:parent.getRootView();}
        public ViewTreeObserver getViewTreeObserver(){return tree;} public boolean isClickable(){return clickable;}
        public boolean isLongClickable(){return false;} public boolean isFocusable(){return false;}
        public Drawable getBackground(){return background;} public void setBackground(Drawable value){background=value;}
        public void setClipBounds(Rect rect){clip=rect;} public Rect getClipBounds(){return clip;}
        public ViewGroup.LayoutParams getLayoutParams(){return size;}
        public android.content.res.Resources getResources(){return new android.content.res.Resources();}
        public View find(int needle){return needle==id?this:null;}
    }''',
    'android.view.ViewGroup': '''public class ViewGroup extends View {
        public static class LayoutParams {public int width=-1,height=-1;}
        public java.util.List<View> children=new java.util.ArrayList<>();
        public void add(View child){children.add(child);child.parent=this;}
        public View getChildAt(int n){return n<children.size()?children.get(n):null;}
        public int getChildCount(){return children.size();}
        public View find(int needle){if(id==needle)return this;for(View v:children){View match=v.find(needle);if(match!=null)return match;}return null;}
    }''',
    'android.widget.FrameLayout': 'public class FrameLayout extends android.view.ViewGroup {}',
    'android.widget.ImageView': 'public class ImageView extends android.view.View {}',
    'android.view.WindowManager': 'public class WindowManager {public static class LayoutParams {public static final int FLAG_SHOW_WALLPAPER=0x100000;public int flags;}}',
    'android.view.Window': '''public class Window {
        public final ViewGroup decor=new ViewGroup(); public final WindowManager.LayoutParams attrs=new WindowManager.LayoutParams();
        public View getDecorView(){return decor;} public WindowManager.LayoutParams getAttributes(){return attrs;}
        public void addFlags(int f){attrs.flags|=f;} public void clearFlags(int f){attrs.flags&=~f;}
        public void setBackgroundDrawable(android.graphics.drawable.Drawable d){decor.setBackground(d);}
    }''',
    'android.app.Activity': '''public class Activity {
        public final android.view.Window window=new android.view.Window();public android.view.Window getWindow(){return window;}
        public android.view.View findViewById(int id){return window.decor.find(id);}
        public android.content.res.Resources getResources(){return window.decor.getResources();}
    }''',
    'com.zte.mifavor.zsearch.SearchMainAty': '''public class SearchMainAty extends android.app.Activity {
        public void onCreate(android.os.Bundle b){}public void onDestroy(){}
    }''',
    'com.zte.mifavor.zsearch.homepage.SearchBgLayout': 'public class SearchBgLayout extends android.view.ViewGroup {}',
    'com.zte.mifavor.zsearch.SearchMainAtyLayout': 'public class SearchMainAtyLayout extends android.view.ViewGroup {}',
    'com.zte.mifavor.liquidglass.util.a': '''public class a {
        public static float radius; public static void h(Object target,float requested){radius=requested;}
    }''',
    'ls.augment.com.LauncherOptions': 'public class LauncherOptions {public static final String SEARCH_NO_SCRIM="search";}',
    'ls.augment.com.ConfigSnapshot': '''public class ConfigSnapshot {
        public boolean on;public String get(String key){return on?"1":"0";}
    }''',
    'ls.augment.com.hook.FeatureSettings': '''import android.app.Activity;import ls.augment.com.ConfigSnapshot;
    class FeatureSettings {
        static ConfigSnapshot config;static Runnable listener;
        static void addSnapshotListener(Activity a,Runnable r){listener=r;}
        static void removeSnapshotListener(Runnable r){if(listener==r)listener=null;}
        static ConfigSnapshot verifiedSnapshot(Activity a){return config;}
    }''',
    'ls.augment.com.hook.AugmentModule': '''import java.lang.reflect.*;import java.util.*;
    class AugmentModule {
        interface Interceptor {Object intercept(Chain chain)throws Throwable;}
        static class Chain {
            Object self;Object[] args;Method method;
            Object getThisObject(){return self;} Object getArg(int i){return args[i];}
            Object proceed()throws Throwable{return proceed(args);}Object proceed(Object[] values)throws Throwable{return method.invoke(self,values);}
        }
        class Builder { Method method;Interceptor hook;Builder intercept(Interceptor h){hook=h;return this;}}
        Map<Method,Interceptor> hooks=new HashMap<>();int unsupported;
        Builder prepareFeatureHook(Method m,String label,boolean deopt){Builder b=new Builder();b.method=m;return b;}
        void registerFeatureHook(Builder b){hooks.put(b.method,b.hook);}
        void deoptimize(Method method){}
        Object invoke(Method m,Object target,Object...args)throws Throwable{
          Chain c=new Chain();c.self=target;c.args=args;c.method=m;return hooks.get(m).intercept(c);
        }
        void logFeatureInfo(String message){if(message.startsWith("SEARCH_WALLPAPER_UNSUPPORTED"))unsupported++;}
        void logFeatureError(String message,Throwable t){throw new AssertionError(message,t);}
    }''',
    'ls.augment.com.hook.Cases': '''import java.lang.reflect.Method;import android.os.Bundle;import android.view.*;
    import android.widget.*;import android.graphics.Rect;import android.graphics.drawable.*;
    import com.zte.mifavor.zsearch.*;import com.zte.mifavor.zsearch.homepage.SearchBgLayout;
    import com.zte.mifavor.liquidglass.util.a;import ls.augment.com.ConfigSnapshot;
    public class Cases {
        static int checks; static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
        static void run(String layout)throws Throwable {
            boolean legacy=layout.equals("legacy")||layout.equals("subclass"), modern=layout.equals("mask");
            boolean noBlur=layout.equals("missing-blur"), unknown=layout.equals("interactive")||layout.equals("moved")||noBlur||layout.equals("missing-bg");
            ClassLoader loader=new ClassLoader(Cases.class.getClassLoader()){
                @Override protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{
                    if(noBlur && name.equals("com.zte.mifavor.liquidglass.util.a"))throw new ClassNotFoundException(name);
                    return super.loadClass(name,resolve);
                }
            };
            AugmentModule module=new AugmentModule();SearchWallpaperHook.install(module,loader);
            SearchMainAty owner=new SearchMainAty();Window window=owner.getWindow();
            ViewGroup root=layout.equals("subclass")?new SearchBgLayout(){}:legacy?new SearchBgLayout():new FrameLayout();
            ImageView bg=new ImageView(),mask=new ImageView();FrameLayout panel=new FrameLayout();SearchMainAtyLayout content=new SearchMainAtyLayout();
            Drawable original=new ColorDrawable(123);Rect oldClip=new Rect();window.decor.setBackground(original);
            final int flags=0x80|(legacy?WindowManager.LayoutParams.FLAG_SHOW_WALLPAPER:0);window.attrs.flags=flags;
            mask.background=new ColorDrawable(22);bg.clip=oldClip;bg.id=layout.equals("missing-bg")?View.NO_ID:1;content.id=2;
            root.background=legacy?original:null;window.decor.add(root);root.add(bg);
            if(legacy)root.add(content);else{
                if(modern||unknown){panel.id=3;root.add(mask);}
                root.add(panel);panel.add(content);if(layout.equals("interactive"))mask.clickable=true;
                if(layout.equals("moved"))root.add(new ImageView());
            }
            Method radius=a.class.getDeclaredMethod("h",Object.class,float.class);
            if(noBlur)a.h(panel,95f);else if(modern||unknown)module.invoke(radius,null,panel,95f);
            FeatureSettings.config=null;
            module.invoke(SearchMainAty.class.getDeclaredMethod("onCreate",Bundle.class),owner,new Bundle());
            check(bg.clip==oldClip && window.attrs.flags==flags,"unverified startup must retain native scene");
            FeatureSettings.config=new ConfigSnapshot();FeatureSettings.listener.run();
            check(bg.clip==oldClip && mask.clip==null,"default off");
            FeatureSettings.config.on=true;FeatureSettings.listener.run();
            if(unknown){
                check(bg.clip==oldClip && mask.clip==null && window.decor.background==original,"unknown layout untouched");
                check(a.radius==95f && module.unsupported==1,"unknown blur untouched and capability diagnosed");
            }else{
                check(bg.clip!=null && bg.clip!=oldClip && (!modern||mask.clip!=null),"only decoration clipped");
                check(content.clip==null && panel.clip==null && (!legacy||root.background==null),"content and controls preserved");
                check(window.decor.background!=original && (window.attrs.flags&WindowManager.LayoutParams.FLAG_SHOW_WALLPAPER)!=0,"wallpaper window");
                if(modern){
                    check(a.radius==0,"already-applied OEM blur cleared");module.invoke(radius,null,panel,77f);
                    check(a.radius==0,"later OEM blur stays clear");module.invoke(radius,null,new FrameLayout(),31f);
                    check(a.radius==31f,"other blur targets preserved");
                }
                window.decor.tree.listener.onGlobalLayout();
                FeatureSettings.config.on=false;FeatureSettings.listener.run();
                check(bg.clip==oldClip && mask.clip==null && window.decor.background==original && window.attrs.flags==flags,"restore exact original window and view state");
                if(legacy)check(root.background==original,"restore old layout background");
                if(modern)check(a.radius==77f,"restore latest native blur");
                FeatureSettings.config.on=true;FeatureSettings.listener.run();
            }
            module.invoke(SearchMainAty.class.getDeclaredMethod("onDestroy"),owner);
            check(FeatureSettings.listener==null && window.decor.tree.listener==null && bg.clip==oldClip,"release owner on exit");
        }
        public static void main(String[] args)throws Throwable{
            for(String layout:new String[]{"legacy","subclass","image","mask","interactive","moved","missing-bg","missing-blur"})run(layout);
            System.out.println("PASS factory search wallpaper: "+checks+" layout, lifecycle, update, isolation and restore checks");
        }
    }''',
}

with tempfile.TemporaryDirectory() as tmp:
    dest = Path(tmp)
    files = []
    for qualified, source in fixtures.items():
        path = dest.joinpath(*qualified.split('.')).with_suffix('.java')
        path.parent.mkdir(exist_ok=True, parents=True)
        path.write_text('package ' + qualified.rsplit('.', 1)[0] + ';\n' + source, encoding='utf-8')
        files.append(str(path))
    hook = root / 'android/app/src/main/java/ls/augment/com/hook/SearchWallpaperHook.java'
    bin_dir = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path(shutil.which('javac')).parent
    subprocess.run([str(bin_dir / 'javac'), '-encoding', 'UTF-8', '-d', str(dest), *files, str(hook)], check=True)
    subprocess.run([str(bin_dir / 'java'), '-cp', str(dest), 'ls.augment.com.hook.Cases'], check=True)
