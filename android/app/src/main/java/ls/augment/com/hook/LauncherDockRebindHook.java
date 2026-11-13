package ls.augment.com.hook;

import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Hotseat.resetLayout bypasses HotseatUtils and reinstates the stock five-cell grid.
 * Grow at the actual native insertion boundary, including cached-model rebinds. */
final class LauncherDockRebindHook {
    private static boolean installed;
    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Contract t = new Contract(loader);
            module.registerFeatureHook(module.prepareFeatureHook(t.add, "launcher.dock.rebind", true).intercept(chain -> {
                if (t.hotseat.isInstance(chain.getThisObject())) try {
                    ViewGroup dock = (ViewGroup) chain.getThisObject();
                    View child = (View) chain.getArg(0);
                    Object params = chain.getArg(3);
                    if (t.dockItem(child) && t.valid(params)) {
                        int x = (Integer) t.countX.invoke(dock), y = (Integer) t.countY.invoke(dock);
                        int wantedX = Math.max(x, (Integer) t.x.invoke(params) + 1);
                        int wantedY = Math.max(y, (Integer) t.y.invoke(params) + 1);
                        if (wantedX != x || wantedY != y) {
                            t.grid.invoke(dock, wantedX, wantedY);
                            t.restoreOccupancy(dock);
                            FeatureSettings.diagnostic(dock.getContext(), "ls_augment_launcher_dock_rebind_runtime",
                                    "grid_grown;from=" + x + "x" + y + ";to=" + wantedX + "x" + wantedY + ";database_unchanged=true");
                        }
                    }
                } catch (ReflectiveOperationException | RuntimeException error) {
                    module.logFeatureError("LAUNCHER_DOCK_REBIND", error);
                }
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.grid, "launcher.dock.grid_retain", true).intercept(chain -> {
                if (!t.hotseat.isInstance(chain.getThisObject())) return chain.proceed();
                ViewGroup dock = (ViewGroup) chain.getThisObject();
                int x = (Integer) chain.getArg(0), y = (Integer) chain.getArg(1);
                try {
                    ViewGroup children = (ViewGroup) t.children.invoke(dock);
                    for (int i = 0; i < children.getChildCount(); i++) {
                        View child = children.getChildAt(i); Object params = child.getLayoutParams();
                        if (t.dockItem(child) && t.valid(params)) {
                            x = Math.max(x, (Integer) t.x.invoke(params) + 1);
                            y = Math.max(y, (Integer) t.y.invoke(params) + 1);
                        }
                    }
                } catch (ReflectiveOperationException | RuntimeException error) {
                    module.logFeatureError("LAUNCHER_DOCK_GRID_RETAIN", error);
                    return chain.proceed();
                }
                Object result = chain.proceed(new Object[]{x, y});
                // Native setGridSize allocates empty occupancy arrays. Re-mark existing
                // children so a later drag cannot overwrite a retained shortcut.
                try { t.restoreOccupancy(dock); }
                catch (ReflectiveOperationException | RuntimeException error) { module.logFeatureError("LAUNCHER_DOCK_GRID_OCCUPANCY", error); }
                return result;
            }));
            module.deoptimize(t.add); module.deoptimize(t.grid);
            installed = true;
        } catch (ReflectiveOperationException | RuntimeException error) {
            module.logFeatureError("LAUNCHER_DOCK_REBIND_CAPABILITY", error);
        }
    }

    static final class Contract {
        final Class<?> hotseat, params;
        final Field container, spanX, spanY;
        final Method add, grid, mark, countX, countY, children, x, y;
        Contract(ClassLoader loader) throws ReflectiveOperationException {
            Class<?> cell = Class.forName("com.android.launcher3.CellLayout", false, loader);
            hotseat = Class.forName("com.android.launcher3.Hotseat", false, loader);
            if (!ViewGroup.class.isAssignableFrom(hotseat) || !cell.isAssignableFrom(hotseat)) throw new NoSuchMethodException("Hotseat ancestry");
            Method candidate = null;
            for (Method method : cell.getDeclaredMethods()) {
                Class<?>[] p = method.getParameterTypes();
                if ((method.getName().equals("addViewToCellLayout") || method.getName().equals("e"))
                        && !Modifier.isStatic(method.getModifiers()) && !Modifier.isAbstract(method.getModifiers())
                        && method.getReturnType() == boolean.class && p.length == 5 && p[0] == View.class
                        && p[1] == int.class && p[2] == int.class && ViewGroup.LayoutParams.class.isAssignableFrom(p[3]) && p[4] == boolean.class) {
                    if (candidate != null) throw new NoSuchMethodException("Ambiguous Dock insertion");
                    candidate = method;
                }
            }
            if (candidate == null) throw new NoSuchMethodException("Dock insertion");
            add = candidate; add.setAccessible(true); params = add.getParameterTypes()[3];
            boolean named = add.getName().equals("addViewToCellLayout");
            grid = HookCompatibility.method(cell, void.class, false, new String[]{named ? "setGridSize" : "C0"}, int.class, int.class);
            mark = HookCompatibility.method(cell, void.class, false, new String[]{named ? "markCellsAsOccupiedForView" : "f0"}, View.class);
            countX = HookCompatibility.method(cell, int.class, false, new String[]{"getCountX"});
            countY = HookCompatibility.method(cell, int.class, false, new String[]{"getCountY"});
            children = cell.getDeclaredMethod("getShortcutsAndWidgets"); children.setAccessible(true);
            if (Modifier.isStatic(children.getModifiers()) || !ViewGroup.class.isAssignableFrom(children.getReturnType())) throw new NoSuchMethodException("Dock children");
            x = HookCompatibility.method(params, int.class, false, new String[]{named ? "getCellX" : "a"});
            y = HookCompatibility.method(params, int.class, false, new String[]{named ? "getCellY" : "b"});
            spanX = HookCompatibility.field(params, int.class, false, named ? "cellHSpan" : "f");
            spanY = HookCompatibility.field(params, int.class, false, named ? "cellVSpan" : "g");
            Class<?> item = Class.forName("com.android.launcher3.model.data." + (named ? "ItemInfo" : "y"), false, loader);
            container = HookCompatibility.field(item, int.class, false, "container");
        }
        boolean dockItem(View view) throws IllegalAccessException {
            Object item = view == null ? null : view.getTag();
            return container.getDeclaringClass().isInstance(item) && container.getInt(item) == -101;
        }
        boolean valid(Object value) throws ReflectiveOperationException {
            if (!params.isInstance(value) || spanX.getInt(value) != 1 || spanY.getInt(value) != 1) return false;
            int a = (Integer) x.invoke(value), b = (Integer) y.invoke(value);
            return a >= 0 && b >= 0 && (a == 0 || b == 0)
                    && ((long) a + 1) * ((long) b + 1) <= Runtime.getRuntime().maxMemory() / 128;
        }
        void restoreOccupancy(ViewGroup dock) throws ReflectiveOperationException {
            ViewGroup content = (ViewGroup) children.invoke(dock);
            for (int i = 0; i < content.getChildCount(); i++) mark.invoke(dock, content.getChildAt(i));
        }
    }
}
