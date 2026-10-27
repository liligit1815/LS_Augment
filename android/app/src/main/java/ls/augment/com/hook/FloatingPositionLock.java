package ls.augment.com.hook;

import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.HapticFeedbackConstants;
import android.widget.Toast;
import android.view.WindowManager;
import android.content.SharedPreferences;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import ls.augment.com.GameOptions;

/** Observe only verified OEM overlay roots; retain native taps, window owner and persistence. */
final class FloatingPositionLock {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View,Gesture> ROOTS=new WeakHashMap<>();
    private static boolean installed, forwarding;
    private static boolean cancelling;
    static boolean cancelling(){return cancelling;}
    static void monitor(View root){if(root!=null&&!ROOTS.containsKey(root))ROOTS.put(root,new Gesture(root,GameOptions.MONITOR_PIN,GameOptions.PERFORMANCE_MONITOR));}
    static void install(AugmentModule module){
        if(installed)return;
        try {
            Class<?> windows=Class.forName("android.view.WindowManagerImpl");
            for(String name:new String[]{"addView","updateViewLayout"}) {
                java.lang.reflect.Method method=windows.getDeclaredMethod(name,View.class,android.view.ViewGroup.LayoutParams.class);
                module.registerFeatureHook(module.prepareFeatureHook(method,"game.overlay.position_lock.window."+name,false).intercept(chain->{
                    View view=(View)chain.getArg(0);Gesture gesture=ROOTS.get(view);
                    if(gesture!=null&&chain.getArg(1) instanceof WindowManager.LayoutParams)
                        gesture.position(view,(WindowManager.LayoutParams)chain.getArg(1));
                    return chain.proceed();
                }));
            }
            for(Class<?> type:new Class<?>[]{View.class,android.view.ViewGroup.class}) {
                module.registerFeatureHook(module.prepareFeatureHook(type.getDeclaredMethod("dispatchTouchEvent",MotionEvent.class),"game.overlay.position_lock."+type.getSimpleName(),false).intercept(chain->{
                    if(forwarding)return chain.proceed();
                    View view=(View)chain.getThisObject();Gesture gesture=ROOTS.get(view);
                    if(gesture==null&&shoulder(view.getClass())){
                        gesture=new Gesture(view,GameOptions.SHOULDER_PIN,GameOptions.QUICK_SWITCH);ROOTS.put(view,gesture);
                    }
                    if(gesture!=null&&gesture.touch((MotionEvent)chain.getArg(0)))return true;
                    if(gesture==null)return chain.proceed();
                    forwarding=true;try{return chain.proceed();}finally{forwarding=false;}
                }));
            }
            installed=true;
        }catch(ReflectiveOperationException error){module.logFeatureError("OVERLAY_PIN_UNAVAILABLE",error);}
    }
    private static boolean shoulder(Class<?> type){
        for(Class<?> c=type;c!=null;c=c.getSuperclass())
            if(c.getName().equals("cn.nubia.tgk.widget.TgkCaseShowView"))return true;
        return false;
    }
    private static final class Gesture implements Runnable {
        final WeakReference<View> reference;final String key,parent;
        MotionEvent down;boolean swallow;float x,y;
        Gesture(View view,String key,String parent){reference=new WeakReference<>(view);this.key=key;this.parent=parent;
            view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
                public void onViewAttachedToWindow(View v){}
                public void onViewDetachedFromWindow(View v){reset();}
            });}
        boolean enabled(View view){return FeatureSettings.enabled(view.getContext(),parent)&&FeatureSettings.enabled(view.getContext(),key);}
        boolean locked(View view){return view.getContext().getSharedPreferences("duo_overlay_positions",0).getBoolean(key,false);}
        String positionKey(View view,WindowManager.LayoutParams p){
            android.util.DisplayMetrics metrics=view.getResources().getDisplayMetrics();
            // getDisplay() is null before addView. Use the same resource profile
            // before attachment and while long-pressing the attached window.
            int orientation=view.getResources().getConfiguration().orientation;
            return key+".position."+orientation+"."+metrics.widthPixels+"x"+metrics.heightPixels+"."+metrics.densityDpi+"."+p.gravity;
        }
        void position(View view,WindowManager.LayoutParams params){
            if(!enabled(view)||!locked(view))return;
            SharedPreferences saved=view.getContext().getSharedPreferences("duo_overlay_positions",0);
            String prefix=positionKey(view,params);
            // Old lock booleans contain no coordinates. Capture the first observed
            // window once; never overwrite an existing pin during native re-entry.
            if(!saved.contains(prefix+".x")){
                saved.edit().putInt(prefix+".x",params.x).putInt(prefix+".y",params.y).apply();return;
            }
            params.x=saved.getInt(prefix+".x",params.x);params.y=saved.getInt(prefix+".y",params.y);
        }
        boolean touch(MotionEvent event){
            View view=reference.get();if(view==null)return false;
            if(!enabled(view)){
                if(swallow){if(event.getActionMasked()==MotionEvent.ACTION_UP||event.getActionMasked()==MotionEvent.ACTION_CANCEL)reset();return true;}
                reset();return false;
            }
            int action=event.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){reset();down=MotionEvent.obtain(event);x=event.getRawX();y=event.getRawY();MAIN.postDelayed(this,ViewConfiguration.getLongPressTimeout());return false;}
            if(down==null)return false;
            if(action==MotionEvent.ACTION_POINTER_DOWN){MAIN.removeCallbacks(this);if(locked(view)){cancelNative(view);swallow=true;}}
            if(action==MotionEvent.ACTION_MOVE){
                int slop=ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                if(Math.hypot(event.getRawX()-x,event.getRawY()-y)>slop){MAIN.removeCallbacks(this);
                    if(locked(view)&&!swallow){cancelNative(view);swallow=true;}}
                // A pinned gesture must never reach native movement code, even below slop.
                if(locked(view)||swallow)return true;
            }
            boolean handled=swallow;
            if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL)reset();
            return handled;
        }
        public void run(){
            View view=reference.get();if(view==null||down==null||!view.isAttachedToWindow()||!enabled(view))return;
            boolean next=!locked(view);
            SharedPreferences.Editor edit=view.getContext().getSharedPreferences("duo_overlay_positions",0).edit().putBoolean(key,next);
            if(next&&view.getLayoutParams() instanceof WindowManager.LayoutParams){
                WindowManager.LayoutParams p=(WindowManager.LayoutParams)view.getLayoutParams();String prefix=positionKey(view,p);
                edit.putInt(prefix+".x",p.x).putInt(prefix+".y",p.y);
            }
            if(!edit.commit())return;
            cancelNative(view);swallow=true;
            view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            Toast.makeText(view.getContext(),next?"位置已固定，长按可解除":"已解除固定，可拖动位置",Toast.LENGTH_SHORT).show();
            FeatureSettings.diagnostic(view.getContext(),key+"_state",next?"locked":"movable");
        }
        void cancelNative(View view){
            MotionEvent cancel=MotionEvent.obtain(down);cancel.setAction(MotionEvent.ACTION_CANCEL);
            forwarding=true;cancelling=true;try{view.dispatchTouchEvent(cancel);}finally{forwarding=false;cancelling=false;cancel.recycle();}
        }
        void reset(){MAIN.removeCallbacks(this);if(down!=null){down.recycle();down=null;}swallow=false;}
    }
    private FloatingPositionLock(){}
}
