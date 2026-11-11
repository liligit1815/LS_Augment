package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;

/** Reconcile native provider events and re-check queued additions at their rendering boundary. */
final class NativeIslandRecorderRendering {
    static boolean install(AugmentModule module,ClassLoader loader) {
        try {
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.PermanentIslandManager",false,loader);
            Class<?> island=Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,loader);
            Method status=NativeIslandSceneContract.method(type,"handleDynamicVisibility",void.class,String.class,island);
            Method add=NativeIslandSceneContract.method(type,"addPermanentIslandInner",void.class,island);
            if (status==null || add==null || Modifier.isStatic(status.getModifiers()) || Modifier.isStatic(add.getModifiers()))
                throw new NoSuchMethodException("recorder_visibility_entries");
            ArrayList<Method> additions=new ArrayList<>(); additions.add(add);
            for (Class<?> current=type;current!=null;current=current.getSuperclass())
                for (Method method:current.getDeclaredMethods())
                    if (method.getName().startsWith("lambda$addPermanentIslandInner$")
                            && method.getReturnType()==void.class && !Modifier.isStatic(method.getModifiers())
                            && Arrays.equals(method.getParameterTypes(),new Class<?>[]{island})) {
                        method.setAccessible(true); additions.add(method);
                    }
            if (additions.size()==1) throw new NoSuchMethodException("recorder_queued_add_boundary");
            module.registerFeatureHook(module.prepareFeatureHook(status,"rm.ui.native_scene.recorder_status",false).intercept(chain->{
                if (NativeIslandScenes.recorderReconcile(chain.getThisObject(),chain.getArg(1))) return null;
                return chain.proceed();
            }));
            for (Method method:additions)
                module.registerFeatureHook(module.prepareFeatureHook(method,"rm.ui.native_scene.recorder_add."+method.getName(),false).intercept(chain->{
                    if (NativeIslandScenes.recorderAdditionBlocked(chain.getThisObject(),chain.getArg(0))) return null;
                    return chain.proceed();
                }));
            return true;
        } catch (Throwable missing) { module.logFeatureError("NATIVE_RECORDER_RENDER_BOUNDARY",missing); return false; }
    }
    private NativeIslandRecorderRendering() { }
}
