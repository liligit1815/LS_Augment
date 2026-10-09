"""Exercise the real instance drawable adapter with Android-like callback ownership."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOK = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')
def hook_method(marker):
    start = HOOK.index(marker)
    end = HOOK.index('{', start) + 1
    depth = 1
    while depth:
        depth += (HOOK[end] == '{') - (HOOK[end] == '}')
        end += 1
    return HOOK[start:end]

start = HOOK.index('if(target instanceof ImageView){', HOOK.index('private static boolean prepareDrawing('))
end = HOOK.index('{', start) + 1
depth = 1
while depth:
    depth += (HOOK[end] == '{') - (HOOK[end] == '}')
    end += 1
IMAGE_ADAPTER = HOOK[start:end]
FILES = {
    'android/graphics/Canvas.java': 'package android.graphics;public class Canvas {}',
    'android/graphics/ColorFilter.java': 'package android.graphics;public class ColorFilter {}',
    'android/graphics/PixelFormat.java': 'package android.graphics;public class PixelFormat {public static final int TRANSLUCENT=-3;}',
    'android/graphics/Rect.java': '''package android.graphics;public class Rect {
        public int left,top,right,bottom;public Rect(){}public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
        public boolean equals(Object o){if(!(o instanceof Rect))return false;Rect r=(Rect)o;return left==r.left&&top==r.top&&right==r.right&&bottom==r.bottom;}
    }''',
    'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;
        import android.graphics.*;import java.util.Arrays;
        public abstract class Drawable {
            public interface Callback {void invalidateDrawable(Drawable who);void scheduleDrawable(Drawable who,Runnable what,long when);void unscheduleDrawable(Drawable who,Runnable what);}
            private Callback callback;private Rect bounds=new Rect();private int[] state=new int[0];private int level;private boolean visible=true;
            public abstract void draw(Canvas canvas);public abstract void setAlpha(int alpha);public int getAlpha(){return 255;}public abstract void setColorFilter(ColorFilter filter);public abstract int getOpacity();
            public void setCallback(Callback c){callback=c;}public Callback getCallback(){return callback;}
            public void invalidateSelf(){if(callback!=null)callback.invalidateDrawable(this);}
            public void scheduleSelf(Runnable r,long at){if(callback!=null)callback.scheduleDrawable(this,r,at);}
            public void unscheduleSelf(Runnable r){if(callback!=null)callback.unscheduleDrawable(this,r);}
            public void setBounds(Rect r){if(bounds.equals(r))return;bounds=new Rect(r.left,r.top,r.right,r.bottom);onBoundsChange(bounds);invalidateSelf();}
            public Rect getBounds(){return bounds;}protected void onBoundsChange(Rect bounds){}
            public int getIntrinsicWidth(){return -1;}public int getIntrinsicHeight(){return -1;}
            public boolean isStateful(){return false;}public boolean setState(int[] next){if(Arrays.equals(state,next))return false;state=next.clone();return onStateChange(state);}
            protected boolean onStateChange(int[] state){return false;}public boolean setLevel(int next){if(level==next)return false;level=next;return onLevelChange(next);}
            protected boolean onLevelChange(int level){return false;}public boolean setVisible(boolean next,boolean restart){boolean changed=visible!=next;visible=next;if(changed)invalidateSelf();return changed;}
        }
    ''',
    'ls/augment/com/hook/TestAssetResourceIdentity.java': '''package ls.augment.com.hook;
        import android.graphics.*;import android.graphics.drawable.Drawable;import java.util.*;import java.lang.ref.WeakReference;
        public final class TestAssetResourceIdentity {
            static class View {}
            static class WifiStandardHook {static int nativeResource(ImageView view){return 0;}}
            static class StatusBarWifiAssetSpacingHook {static boolean allowed=true;static boolean allowArtwork(View view){return allowed;}}
            static class Resources {String getResourceEntryName(int id){return "signal_"+id;}}
            static class ImageView extends View {Drawable drawable;int mResource;
                Drawable getDrawable(){return drawable;}Resources getResources(){return new Resources();}
                void setImageDrawable(Drawable value){drawable=value;mResource=0;}
                void setImageResource(int id,Drawable value){drawable=value;mResource=id;}}
            static class NativeDrawable extends Drawable {int draws;public void draw(Canvas c){draws++;}public void setAlpha(int value){}
                public void setColorFilter(ColorFilter filter){}public int getOpacity(){return -3;}}
            static boolean enabled=true,observing=true;static int drawCallbackCount;
            static boolean observingSurface(String surface){return observing;}
            static class Entry {StatusBarAssetDrawable wrapper;boolean wrappedBackground,hidden,drawingReady=true,render;int customDraws;WeakReference<View> view;
                String surface(){return "control";}boolean inScope(View target){return true;}boolean canRender(){return render;}
                boolean draw(Canvas canvas,String layer,Rect area){if(render){customDraws++;return true;}return false;}
                SUPPRESSED_METHOD
                DRAW_WRAPPED_METHOD
            }
            static final Map<View,String> RESOURCE_NAMES=new WeakHashMap<>();
            static final Map<Drawable,String> DRAWABLE_RESOURCES=new WeakHashMap<>();
            static Object cachedField(ImageView view,String name){return view.mResource;}
            static boolean prepareDrawing(Entry entry,View target){IMAGE_ADAPTER return false;}
            static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
            public static void main(String[] args){
                ImageView view=new ImageView();Entry entry=new Entry();NativeDrawable nativeIcon=new NativeDrawable();
                entry.view=new WeakReference<View>(view);
                view.setImageResource(102,nativeIcon);prepareDrawing(entry,view);
                check(view.mResource==0&&"signal_102".equals(RESOURCE_NAMES.get(view)),"wrapper captures resource before ImageView clears resource field");
                StatusBarAssetDrawable first=entry.wrapper;prepareDrawing(entry,view);
                check(first==entry.wrapper,"stable binding reuses wrapper and native identity");
                view.setImageDrawable(entry.wrapper.original());entry.wrapper.release();entry.wrapper=null;
                check(view.getDrawable()==nativeIcon&&view.mResource==0,"disable restores original with Android resource field cleared");
                prepareDrawing(entry,view);
                check("signal_102".equals(RESOURCE_NAMES.get(view)),"re-enable recovers exact native identity without requiring OEM state refresh");
                view.setImageDrawable(new NativeDrawable());prepareDrawing(entry,view);
                check(!RESOURCE_NAMES.containsKey(view),"unknown replacement never borrows old view identity");
                view.setImageResource(305,new NativeDrawable());prepareDrawing(entry,view);
                check("signal_305".equals(RESOURCE_NAMES.get(view)),"native resource refresh replaces original identity");
                NativeDrawable arrow=(NativeDrawable)entry.wrapper.original();entry.hidden=true;entry.wrapper.draw(new Canvas());
                check(arrow.draws==0,"scoped hidden combined arrow suppresses only this drawable instance");
                entry.hidden=false;entry.wrapper.draw(new Canvas());
                check(arrow.draws==1,"removing scoped hiding restores current native arrow draw without forcing native visibility");
                entry.hidden=true;observing=false;entry.wrapper.draw(new Canvas());
                check(arrow.draws==2,"inactive surface cannot suppress another displayed context");
                entry.hidden=false;observing=true;entry.render=true;StatusBarWifiAssetSpacingHook.allowed=false;entry.wrapper.draw(new Canvas());check(arrow.draws==3&&entry.customDraws==0,"unadmitted custom pair uses actual original drawable, never a blank placeholder");
                StatusBarWifiAssetSpacingHook.allowed=true;entry.wrapper.draw(new Canvas());check(entry.customDraws==1&&arrow.draws==3,"admitted cells use the same existing painter and wrapper");
                System.out.println("Status-bar drawable resource restoration: "+checks+" assertions passed");
            }
        }
    '''.replace('IMAGE_ADAPTER', IMAGE_ADAPTER)
       .replace('SUPPRESSED_METHOD', hook_method('boolean suppressed(){'))
       .replace('DRAW_WRAPPED_METHOD', hook_method('void drawWrapped(Canvas canvas,Rect area){')),
    'ls/augment/com/hook/TestAssetDrawable.java': '''package ls.augment.com.hook;
        import android.graphics.*;import android.graphics.drawable.Drawable;
        public final class TestAssetDrawable {
            private static int checks;private static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
            private static final class NativeDrawable extends Drawable {
                int draws,alpha=255,levels,states;ColorFilter filter;
                public void draw(Canvas c){draws++;}public void setAlpha(int a){alpha=a;invalidateSelf();}public int getAlpha(){return alpha;}
                public void setColorFilter(ColorFilter c){filter=c;invalidateSelf();}public int getOpacity(){return -3;}
                public int getIntrinsicWidth(){return 28;}public int getIntrinsicHeight(){return 32;}public boolean isStateful(){return true;}
                protected boolean onStateChange(int[] s){states++;invalidateSelf();return true;}protected boolean onLevelChange(int n){levels++;invalidateSelf();return true;}
            }
            private static final class ImageHost implements Drawable.Callback {
                Drawable drawable,lastWho;int invalidations,schedules,unschedules;
                void install(Drawable next){if(drawable!=null)drawable.setCallback(null);drawable=next;if(next!=null)next.setCallback(this);}
                public void invalidateDrawable(Drawable who){lastWho=who;invalidations++;}
                public void scheduleDrawable(Drawable who,Runnable what,long when){lastWho=who;schedules++;}
                public void unscheduleDrawable(Drawable who,Runnable what){lastWho=who;unschedules++;}
            }
            public static void main(String[] args){
                ImageHost host=new ImageHost();NativeDrawable original=new NativeDrawable();host.install(original);
                StatusBarAssetDrawable[] handle=new StatusBarAssetDrawable[1];
                handle[0]=new StatusBarAssetDrawable(original,(canvas,area)->handle[0].drawOriginal(canvas));
                StatusBarAssetDrawable wrapper=handle[0];
                check(original.getCallback()==host,"constructing wrapper cannot steal installed drawable callback");
                host.install(wrapper);wrapper.attach();
                check(original.getCallback()==wrapper&&wrapper.getCallback()==host,"attachment after ImageView clears old callback restores forwarding");
                original.invalidateSelf();check(host.invalidations==1&&host.lastWho==wrapper,"native invalidation reaches host with installed wrapper token");
                Runnable task=()->{};original.scheduleSelf(task,42);original.unscheduleSelf(task);
                check(host.schedules==1&&host.unschedules==1&&host.lastWho==wrapper,"native animation scheduling and cancellation use wrapper token");
                check(wrapper.getIntrinsicWidth()==28&&wrapper.getIntrinsicHeight()==32&&wrapper.isStateful(),"wrapper preserves native dimensions and statefulness");
                wrapper.setBounds(new Rect(2,3,30,35));check(original.getBounds().equals(wrapper.getBounds()),"native bounds track installed drawable bounds");
                wrapper.setState(new int[]{1});wrapper.setLevel(7);check(original.states==1&&original.levels==1,"native state and level updates survive wrapper");
                ColorFilter filter=new ColorFilter();wrapper.setColorFilter(filter);wrapper.setAlpha(91);
                check(wrapper.originalAlpha()==91&&wrapper.getAlpha()==91,"replacement layers can inherit native inactive-icon alpha");
                check(original.filter==filter&&original.alpha==91,"native tint and alpha setter behavior remains available");
                int before=host.invalidations;Canvas canvas=new Canvas();for(int i=0;i<120;i++)wrapper.draw(canvas);
                check(original.draws==120&&host.invalidations==before,"drawing stable native fallback cannot schedule additional frames");
                host.install(wrapper.original());wrapper.release();
                check(original.getCallback()==host,"release does not erase callback installed during restoration");
                original.invalidateSelf();check(host.lastWho==original&&host.invalidations==before+1,"restored native drawable invalidates host directly");
                wrapper.attach();wrapper.release();wrapper.release();check(original.getCallback()==null,"release removes owned callback idempotently");
                StatusBarAssetDrawable empty=new StatusBarAssetDrawable(null,(c,r)->{});host.install(empty);empty.attach();empty.draw(canvas);empty.release();
                check(empty.getIntrinsicWidth()==-1&&empty.getIntrinsicHeight()==-1,"missing native drawable remains valid and introduces no layout size");
                System.out.println("Status-bar drawable wrapper: "+checks+" assertions passed");
            }
        }
    ''',
}

with tempfile.TemporaryDirectory(prefix='statusbar-wrapper-') as tmp:
    work = Path(tmp)
    for name, source in FILES.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    production = ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarAssetDrawable.java'
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', str(work),
                    *map(str, work.rglob('*.java')), str(production)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', str(work), 'ls.augment.com.hook.TestAssetDrawable'], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', str(work), 'ls.augment.com.hook.TestAssetResourceIdentity'], check=True)
