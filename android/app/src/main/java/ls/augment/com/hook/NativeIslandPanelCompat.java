package ls.augment.com.hook;

import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.function.Consumer;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Completes an owned ordinary panel when the OEM callback expects a separate fullscreen root. */
final class NativeIslandPanelCompat {
    private NativeIslandPanelCompat() { }

    private static final ClassValue<Contract> CONTRACTS = new ClassValue<>() {
        @Override protected Contract computeValue(Class<?> type) { return new Contract(type); }
    };
    private static final class Contract {
        Field panelRoot, closing, showing, temporary, panelContainer;
        Method height, remove, selected;
        boolean candidate;
        String missing;
        Contract(Class<?> type) {
            candidate=true;
            try {
                // Older ordinary implementations lack this fullscreen-only pair. Keep their original callback.
                candidate = findField(type,"mDynamicIslandPanelRoot") != null
                        && findField(type,"mDynamicPanelClosing") != null;
                if (!candidate) return;
                Class<?> island = Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,type.getClassLoader());
                panelRoot = requireField(type,"mDynamicIslandPanelRoot",View.class);
                closing = requireField(type,"mDynamicPanelClosing",boolean.class);
                showing = requireField(type,"mDynamicPanelShowing",boolean.class);
                temporary = requireField(type,"mTempIsland",island);
                panelContainer = requireField(type,"mDynamicPanelContainer",ViewGroup.class);
                requireMethod(type,"onPermanentIslandPanelCloseAnimationEnd",void.class,island,boolean.class,boolean.class);
                height = requireMethod(type,"updateDynamicWindowHeightParams",void.class,boolean.class);
                remove = requireMethod(type,"removePermanentIslandInner",void.class,island);
                selected = requireMethod(type,"getPermanentIsland",island);
            } catch (ReflectiveOperationException | RuntimeException error) { missing = error.toString(); }
        }
    }

    static boolean canExpand(Object owner, Consumer<String> report) {
        if (owner == null) return false;
        Contract c = CONTRACTS.get(owner.getClass());
        if (!c.candidate) return true;
        try {
            // A real fullscreen root continues through the OEM implementation.
            if (c.panelRoot != null && c.panelRoot.get(owner) instanceof View) return true;
            if (c.missing != null) { report.accept("panel_capability_missing:"+c.missing); return false; }
            if (!(c.panelContainer.get(owner) instanceof ViewGroup)
                    || !(field(owner,"mDynamicIslandRoot") instanceof View)
                    || field(owner,"mWindowManager") == null || field(owner,"mParams") == null) {
                report.accept("panel_capability_missing:ordinary_window"); return false;
            }
            return true;
        } catch (ReflectiveOperationException error) {
            report.accept("panel_capability_failed:"+error.getClass().getSimpleName()); return false;
        }
    }

    static boolean ordinary(Object owner) {
        if (owner == null) return false;
        Contract c = CONTRACTS.get(owner.getClass());
        if (!c.candidate || c.missing != null) return false;
        try { return c.panelRoot.get(owner) == null; }
        catch (ReflectiveOperationException ignored) { return false; }
    }

    /** Only called for Duo-owned scene views. False preserves an unknown or complete native implementation. */
    static boolean closeEnd(Object owner,Object island,boolean remove,boolean disposable,Consumer<String> report) {
        if (!ordinary(owner)) return false;
        Contract c = CONTRACTS.get(owner.getClass());
        try {
            Object selected = c.selected.invoke(owner);
            if (selected != null && selected != island) {
                report.accept("panel_close_stale:selection_changed"); return true;
            }
            c.showing.setBoolean(owner,false);
            c.closing.setBoolean(owner,false);
            c.temporary.set(owner,null);
            Object container = c.panelContainer.get(owner);
            Object panel = island == null ? null : call(island,"getPanelIsland");
            if (container instanceof ViewGroup && panel instanceof View && ((View)panel).getParent() == container)
                ((ViewGroup)container).removeView((View)panel);
            if (!(container instanceof ViewGroup)) report.accept("panel_close_degraded:panel_container_missing");
            // The ordinary window stays alive and returns to its compact height. It has no panel root to hide.
            c.height.invoke(owner,false);
            if (remove && island != null) c.remove.invoke(owner,island);
            if (disposable) {
                Object next = field(owner,"mDisposableIsland"), animation = field(owner,"mDynamicAnimation");
                if (next != null && animation != null) call(animation,"startDisposableChangeAnimation",island,next);
                else report.accept("panel_transition_unavailable:disposable_target");
            }
            report.accept("panel_close_completed:ordinary_window");
        } catch (ReflectiveOperationException | RuntimeException error) {
            // This is a known owned ordinary window: never re-enter the callback that dereferences its absent root.
            // Preserve failure evidence instead of reporting a successful transition or swallowing unrelated OEM faults.
            report.accept("panel_close_failed:"+error.getClass().getSimpleName());
        }
        return true;
    }

    private static Field findField(Class<?> type,String name) {
        for (Class<?> current=type;current!=null;current=current.getSuperclass()) try {
            Field f=current.getDeclaredField(name);f.setAccessible(true);return f;
        } catch (NoSuchFieldException ignored) { }
        return null;
    }
    private static Field requireField(Class<?> type,String name,Class<?> expected) throws NoSuchFieldException {
        Field f=findField(type,name);
        if (f==null || java.lang.reflect.Modifier.isStatic(f.getModifiers()) || !expected.isAssignableFrom(f.getType()))
            throw new NoSuchFieldException(name+":type");
        return f;
    }
    private static Method requireMethod(Class<?> type,String name,Class<?> result,Class<?>... parameters) throws NoSuchMethodException {
        for(Class<?> current=type;current!=null;current=current.getSuperclass()) try {
            Method m=current.getDeclaredMethod(name,parameters);
            if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) || !result.isAssignableFrom(m.getReturnType()))
                throw new NoSuchMethodException(name+":return");
            m.setAccessible(true);return m;
        } catch (NoSuchMethodException ignored) { }
        throw new NoSuchMethodException(name+":signature");
    }
}
