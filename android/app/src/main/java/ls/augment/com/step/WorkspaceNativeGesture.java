package ls.augment.com.step;

import android.view.InputDevice;
import android.view.MotionEvent;
import java.lang.reflect.*;
import java.util.WeakHashMap;
import static ls.augment.com.step.StepRuntime.*;

/** Keep the OEM edge recognizer in physical coordinates after the main pane is scaled.
 * Only its two verified edge bounds are borrowed for this call; settings, hold timing,
 * hover/cancel and the original FloatAssist launch remain entirely native. */
final class WorkspaceNativeGesture {
    static final WeakHashMap<Object,Stream> streams=new WeakHashMap<>();
    static final java.util.Set<Object> blocked=java.util.Collections.newSetFromMap(new WeakHashMap<>());
    static boolean available;
    static Field left,right;
    static final class Stream {
        final LiveWorkspace host;final WorkspaceLayout layout;final long down;
        Stream(LiveWorkspace h,long down){host=h;layout=h.geometry;this.down=down;}
        boolean valid(MotionEvent e){return host==LiveWorkspace.current && host.ready && !host.closing && !host.closed
                && !host.fence.busy() && host.geometry==layout && down==e.getDownTime();}
    }
    static void install(ClassLoader loader){
        try{
            Class<?> controller=Class.forName("com.zte.feature.fullscreen_gesture.GestureController",false,loader);
            Method pointer=LocalLandscape.exact(controller,"onPointerEvent",void.class,MotionEvent.class);
            Class<?> stub=Class.forName("com.zte.feature.fullscreen_gesture.GestureStubView",false,loader);
            Method touch=LocalLandscape.exact(stub,"onTouchEvent",boolean.class,MotionEvent.class);
            if(StepMembers.findField(stub,"mGestureController").getType()!=controller)throw new NoSuchFieldException("native stub recognizer");
            left=StepMembers.findField(controller,"mGestureEdgeLeft");right=StepMembers.findField(controller,"mGestureEdgeRight");
            if(left.getType()!=int.class || right.getType()!=int.class || Modifier.isStatic(left.getModifiers()) || Modifier.isStatic(right.getModifiers()))
                throw new NoSuchFieldException("native instance edge coordinates");
            StepHooks.hookMethod(pointer,new StepHook(){
                @Override protected void beforeHookedMethod(MethodHookParam p)throws Throwable{
                    MotionEvent event=(MotionEvent)p.args[0];LiveWorkspace h=LiveWorkspace.current;
                    if(event.getActionMasked()==MotionEvent.ACTION_DOWN){
                        blocked.remove(p.thisObject);
                        if(h!=null && h.ready && !h.closed && (h.fence.busy() || h.closing))blocked.add(p.thisObject);
                    }
                    if(blocked.contains(p.thisObject)){p.setResult(null);return;}
                    if(event.getActionMasked()==MotionEvent.ACTION_DOWN){
                        streams.remove(p.thisObject);
                        if(h!=null && h.geometry!=null && h.ready && !h.closed && !h.closing && !h.fence.busy()
                                && event.isFromSource(InputDevice.SOURCE_TOUCHSCREEN) && (Integer)call(event,"getDisplayId")==0
                                && contains(h.geometry,event.getRawX(),event.getRawY()))
                            streams.put(p.thisObject,new Stream(h,event.getDownTime()));
                    }
                    Stream stream=streams.get(p.thisObject);if(stream==null || !stream.valid(event)){streams.remove(p.thisObject);return;}
                    int l=left.getInt(p.thisObject),r=right.getInt(p.thisObject);
                    WorkspaceLayout area=stream.layout;
                    // Unknown/reversed bounds are not treated as a supported interface.
                    if(l<0 || r<=l || r>area.width)return;
                    p.setObjectExtra("stepEdges",new int[]{l,r});
                    left.setInt(p.thisObject,Math.round(area.mainX+l*area.mainScale));
                    right.setInt(p.thisObject,Math.round(area.mainX+r*area.mainScale));
                    if(event.getActionMasked()==MotionEvent.ACTION_DOWN){
                        WorkspaceBackFocus.observe(event);
                        diagnostic("NATIVE_GESTURE","main_edges;left="+left.getInt(p.thisObject)+";right="+right.getInt(p.thisObject));
                    }
                }
                @Override protected void afterHookedMethod(MethodHookParam p)throws Throwable{
                    Object saved=p.getObjectExtra("stepEdges");
                    if(saved instanceof int[] old){left.setInt(p.thisObject,old[0]);right.setInt(p.thisObject,old[1]);}
                    int action=((MotionEvent)p.args[0]).getActionMasked();
                    if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){streams.remove(p.thisObject);blocked.remove(p.thisObject);}
                }
            });
            StepHooks.module.deoptimize(touch);
            available=true;diagnostic("NATIVE_GESTURE_CAPABILITY",pointer.toGenericString());
        }catch(ReflectiveOperationException|RuntimeException|LinkageError absent){diagnostic("NATIVE_GESTURE_CAPABILITY","native_fallback;reason="+absent);}
    }
    static boolean contains(WorkspaceLayout area,float x,float y){
        return Float.isFinite(x) && Float.isFinite(y) && x>=area.mainX && x<area.mainX+area.width*area.mainScale && y>=area.top && y<area.height;
    }
}
