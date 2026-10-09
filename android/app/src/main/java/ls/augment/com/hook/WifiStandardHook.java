package ls.augment.com.hook;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import ls.augment.com.ConfigSchema;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** NX809J native-resource display adapter. Never changes WifiIcon/Flow, tags or connectivity. */
final class WifiStandardHook {
    private static final String KEY=SystemUiOptions.PREFIX+"hide_wifi_standard";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ThreadLocal<Boolean> DERIVING=new ThreadLocal<>();
    private static final Map<Integer,Integer> PLAIN=new ConcurrentHashMap<>();
    private static final Map<ImageView,Entry> VIEWS=new WeakHashMap<>();
    private static boolean observing;
    private WifiStandardHook(){}
    static int install(AugmentModule module,ClassLoader loader){
        int count=hookNamed(module,loader,"wifi_standard","com.zte.feature.signal.WifiUtils$Companion",
                "getWifiSignalStrengthIconId",6,null,(o,a,r)->{record(o,a,r);return PASS;});
        count+=hookNamed(module,loader,"wifi_standard","com.android.systemui.common.ui.binder.IconViewBinder",
                "bind",2,null,(o,a,r)->{
                    if(a[1] instanceof ImageView&&a[0]!=null&&a[0].getClass().getName().equals("com.android.systemui.common.shared.model.Icon$Resource")){
                        Object res=call(a[0],"getRes");
                        Object actual=field(a[1],"mResource");
                        if(res instanceof Integer&&res.equals(actual))observe((ImageView)a[1]);
                    }
                    return PASS;
                });
        return count;
    }
    static void record(Object owner,Object[] args,Object result) throws ReflectiveOperationException {
        if(Boolean.TRUE.equals(DERIVING.get())||!(result instanceof Integer)||args.length!=6)return;
        if(!(args[0] instanceof Integer)||!(args[1] instanceof Boolean)||!(args[2] instanceof Boolean)
                ||!(args[3] instanceof Boolean)||!(args[4] instanceof Integer)||!(args[5] instanceof Integer))return;
        int standard=(Integer)args[0],nativeRes=(Integer)result,level=(Integer)args[4];
        if((standard!=6&&standard!=8)||nativeRes<=0||level<0||level>4)return;
        // The ROM has no non-standard MLO family. Keep that native indication intact.
        if((Boolean)args[3]){PLAIN.put(nativeRes,0);return;}
        Object[] plainArgs=args.clone();plainArgs[0]=0;
        Object plain;
        DERIVING.set(true);
        try{plain=call(owner,"getWifiSignalStrengthIconId",plainArgs);}finally{DERIVING.remove();}
        if(!(plain instanceof Integer)||((Integer)plain)<=0||plain.equals(result))return;
        int value=(Integer)plain;
        // A resource reused with inconsistent semantics is unsupported, never guessed.
        PLAIN.compute(nativeRes,(key,old)->old==null?value:old==value?old:0);
    }
    static void observe(ImageView view){
        if(!"wifi_signal".equals(resourceName(view)))return;
        Entry entry=VIEWS.get(view);
        if(entry==null){entry=new Entry(view);VIEWS.put(view,entry);view.addOnAttachStateChangeListener(entry);entry.attach();}
        if(!observing)observing=FeatureSettings.addSnapshotListener(view.getContext(),()->MAIN.post(()->{
            for(Entry current:new ArrayList<>(VIEWS.values()))current.refresh();
        }));
        entry.refresh();
    }
    private static String resourceName(View view){try{return view.getResources().getResourceEntryName(view.getId());}catch(RuntimeException ignored){return "";}}
    static WifiStandardDrawable adapter(Drawable value){
        if(value instanceof StatusBarAssetDrawable)value=((StatusBarAssetDrawable)value).original();
        return value instanceof WifiStandardDrawable?(WifiStandardDrawable)value:null;
    }
    static int nativeResource(ImageView image){WifiStandardDrawable value=adapter(image.getDrawable());return value==null?0:value.nativeResource;}
    static Drawable nativeDrawable(Drawable value){WifiStandardDrawable adapter=adapter(value);return adapter==null?value:adapter.original();}
    private static boolean enabled(Context context){return FeatureSettings.enabled(context,ConfigSchema.SYSTEMUI_MASTER)
            &&!RedMagicLegacyUiHook.positionSizeOnly(context)&&FeatureSettings.enabled(context,KEY);}
    private static final class Entry implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener {
        final WeakReference<ImageView> reference;
        ViewTreeObserver tree;
        Entry(ImageView view){reference=new WeakReference<>(view);}
        void attach(){ImageView view=reference.get();if(view!=null&&view.isAttachedToWindow()){tree=view.getViewTreeObserver();tree.addOnPreDrawListener(this);}}
        void refresh(){
            ImageView view=reference.get();if(view==null)return;
            WifiStandardDrawable wrapped=adapter(view.getDrawable());
            if(wrapped==null){
                // mResource belongs to the just-bound native Resource; an old tag is never evidence.
                Object resource=field(view,"mResource");
                if(!(resource instanceof Integer))return;
                int nativeRes=(Integer)resource,plainRes=PLAIN.getOrDefault(nativeRes,0);
                Drawable current=view.getDrawable();
                if(plainRes==0||current==null||current instanceof StatusBarAssetDrawable)return;
                try{
                    String name=view.getResources().getResourceEntryName(plainRes);
                    if(name.contains("wifi6")||name.contains("wifi7"))return; // ROM Wifi6_DEBUG must not masquerade as plain.
                    Drawable plain=view.getContext().getDrawable(plainRes);
                    if(plain==null)return;
                    wrapped=new WifiStandardDrawable(nativeRes,current,plain.mutate());
                    view.setImageDrawable(wrapped);wrapped.attach();
                }catch(RuntimeException unavailable){return;}
            }
            wrapped.hidden(enabled(view.getContext())&&PLAIN.getOrDefault(wrapped.nativeResource,0)>0);
        }
        @Override public boolean onPreDraw(){refresh();return true;}
        @Override public void onViewAttachedToWindow(View view){attach();refresh();}
        @Override public void onViewDetachedFromWindow(View view){if(tree!=null&&tree.isAlive())tree.removeOnPreDrawListener(this);tree=null;}
    }
}
