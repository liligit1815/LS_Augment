package ls.augment.com.hook;

import android.content.Context;
import android.graphics.RectF;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Map;
import java.util.LinkedHashMap;

/** Use the launcher's native animation fallback for scenes already owned by the island. */
final class NativeIslandLauncherCapsule {
    static void install(AugmentModule module,ClassLoader loader) {
        try {
            Class<?> type=Class.forName("com.android.quickstep.views.CapsuleView",false,loader);
            if (!View.class.isAssignableFrom(type)) throw new NoSuchFieldException("capsule_view_type");
            Map<Integer,String> scenes=new LinkedHashMap<>();
            for (String[] item:new String[][]{{"RECORD_VIEW_CODE","record"},{"CALL_VIEW_CODE","call"},
                    {"MEETING_VIEW_CODE","meeting"},{"MEETING_NEW_VER_VIEW_CODE","meeting"}}) {
                Field code=NativeIslandSceneContract.field(type,item[0],int.class);
                if (code==null || !Modifier.isStatic(code.getModifiers())) {
                    module.logFeatureInfo("NATIVE_LAUNCHER_CAPSULE_MISSING "+item[0]); continue;
                }
                int value=code.getInt(null);
                String old=scenes.put(value,item[1]);
                if (old!=null && !old.equals(item[1])) throw new IllegalStateException("ambiguous_capsule_type");
            }
            if (scenes.isEmpty()) throw new NoSuchFieldException("capsule_scene_types");
            Method factory=null;
            for (Method method:type.getDeclaredMethods()) {
                Class<?>[] p=method.getParameterTypes();
                if (method.getName().equals("getCapsuleView") && Modifier.isStatic(method.getModifiers())
                        && type.isAssignableFrom(method.getReturnType()) && p.length==3
                        && Context.class.isAssignableFrom(p[0]) && p[1]==int.class && p[2]==RectF.class) {
                    if (factory!=null) throw new NoSuchMethodException("ambiguous_capsule_factory");
                    factory=method;
                }
            }
            if (factory==null) throw new NoSuchMethodException("capsule_factory");
            factory.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(factory,"rm.launcher.native_island.recorder_capsule",false).intercept(chain->{
                Object context=chain.getArg(0);
                String scene=scenes.get((Integer)chain.getArg(1));
                if (context instanceof Context && scene!=null
                        && NativeIslandRecorderBridge.owns((Context)context,scene)) return null;
                return chain.proceed();
            }));
        } catch (Throwable missing) { module.logFeatureError("NATIVE_LAUNCHER_CAPSULE",missing); }
    }
    private NativeIslandLauncherCapsule() { }
}
