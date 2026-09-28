package ls.augment.com.hook;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.ComponentName;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import ls.augment.com.EntryVisibilityOptions;
import ls.augment.com.EntryVisibilityPolicy;

/** Excludes the exact minors shortcut from both workspace children and cell occupancy. */
final class MinorsWorkspaceHook {
    private final AugmentModule module;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ArrayList<Slot> slots = new ArrayList<>();
    private final Method add, occupied, vacant, find, x, y, setX, setY, writer, move;
    private final Class<?> launcher;
    private Context context;
    private boolean restoring, listening;

    static void install(AugmentModule module, ClassLoader loader) {
        try { new MinorsWorkspaceHook(module, loader); }
        catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            module.logFeatureError("ENTRY_WORKSPACE_INSTALL", error);
        }
    }

    private MinorsWorkspaceHook(AugmentModule module, ClassLoader loader)
            throws ReflectiveOperationException {
        this.module = module;
        Class<?> cell = Class.forName("com.android.launcher3.CellLayout", false, loader);
        Class<?> params = Class.forName("c1.b", false, loader);
        Class<?> item = Class.forName("com.android.launcher3.model.data.y", false, loader);
        Class<?> grid = Class.forName("com.android.launcher3.util.t0", false, loader);
        Class<?> cursor = Class.forName("z1.y1", false, loader);
        Class<?> modelWriter = Class.forName("z1.J3", false, loader);
        launcher = Class.forName("com.android.launcher3.C2", false, loader);
        add = cell.getDeclaredMethod("e", View.class, int.class, int.class, params, boolean.class);
        occupied = cell.getDeclaredMethod("getOccupied");
        vacant = grid.getDeclaredMethod("d", int.class, int.class, int.class, int.class);
        find = grid.getDeclaredMethod("c", int[].class, int.class, int.class);
        x = params.getDeclaredMethod("a"); y = params.getDeclaredMethod("b");
        setX = params.getDeclaredMethod("e", int.class); setY = params.getDeclaredMethod("g", int.class);
        writer = launcher.getDeclaredMethod("i2");
        move = modelWriter.getDeclaredMethod("T", item, int.class, int.class, int.class, int.class);
        Method placement = cursor.getDeclaredMethod("e", item, boolean.class);
        placement.setAccessible(true);
        module.registerFeatureHook(module.prepareFeatureHook(placement,
                "entries.launcher.placement", false).intercept(chain -> {
            // The hidden row remains in the model. Do not reserve its former grid cell
            // or delete a real shortcut placed there on the next model load. When the
            // option is off, bind this one item last and relocate it if necessary.
            return workspaceItem(chain.getArg(0)) ? true : chain.proceed();
        }));
        module.registerFeatureHook(module.prepareFeatureHook(add,
                "entries.launcher.workspace", false).intercept(chain -> {
            View view = (View) chain.getArg(0);
            if (restoring || !workspaceItem(view.getTag())) return chain.proceed();
            ViewGroup owner = (ViewGroup) chain.getThisObject();
            ensure(owner.getContext());
            Slot slot = new Slot(owner, view, (Integer) chain.getArg(1),
                    (Integer) chain.getArg(2), chain.getArg(3), (Boolean) chain.getArg(4));
            slots.removeIf(old -> old.view == view || old.cell.get() == null);
            slots.add(slot);
            owner.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                public void onViewAttachedToWindow(View v) { }
                public void onViewDetachedFromWindow(View v) {
                    slots.remove(slot); v.removeOnAttachStateChangeListener(this);
                }
            });
            // All native items in this binding batch claim their cells first.
            main.post(this::refresh);
            return true;
        }));
    }

    private void ensure(Context value) {
        context = value.getApplicationContext();
        if (context == null) context = value;
        if (!listening) listening = FeatureSettings.addSnapshotListener(context,
                () -> main.post(this::refresh));
    }

    private boolean enabled() {
        return FeatureSettings.enabled(context, EntryVisibilityOptions.HIDE_MINORS_ICON);
    }

    private void refresh() {
        for (Slot slot : new ArrayList<>(slots)) {
            ViewGroup cell = slot.cell.get();
            if (cell == null) { slots.remove(slot); continue; }
            try {
                if (enabled()) {
                    if (slot.view.getParent() != null) {
                        // CellLayout.removeView also clears native permanent occupancy.
                        cell.removeView(slot.view);
                    }
                    FeatureSettings.diagnostic(context, "ls_augment_minors_workspace_runtime",
                            "隐藏且释放桌面网格；子视图已移除");
                } else if (slot.view.getParent() == null) {
                    restore(cell, slot);
                }
            } catch (ReflectiveOperationException | RuntimeException error) {
                module.logFeatureError("ENTRY_WORKSPACE_REFRESH", error);
                FeatureSettings.diagnosticError(context, "ls_augment_minors_workspace_runtime",
                        "恢复桌面图标", error);
            }
        }
    }

    private void restore(ViewGroup cell, Slot slot) throws ReflectiveOperationException {
        int oldX = (Integer) x.invoke(slot.params), oldY = (Integer) y.invoke(slot.params);
        int[] at = {oldX, oldY};
        Object grid = occupied.invoke(cell);
        if (!(Boolean) vacant.invoke(grid, oldX, oldY, 1, 1)
                && !(Boolean) find.invoke(grid, at, 1, 1)) {
            // Never overlap or evict another user's shortcut on a full page.
            FeatureSettings.diagnostic(context, "ls_augment_minors_workspace_runtime",
                    "当前页面无空位；保留图标数据，待空位恢复");
            return;
        }
        Object item = slot.view.getTag();
        boolean relocated = at[0] != oldX || at[1] != oldY;
        Object modelWriter = null;
        if (relocated) {
            Context owner = cell.getContext();
            for (int n = 0; n < 8 && !launcher.isInstance(owner)
                    && owner instanceof ContextWrapper; n++) {
                Context next = ((ContextWrapper) owner).getBaseContext();
                if (next == owner) break;
                owner = next;
            }
            if (!launcher.isInstance(owner)) return;
            modelWriter = writer.invoke(owner);
            setX.invoke(slot.params, at[0]); setY.invoke(slot.params, at[1]);
        }
        restoring = true;
        boolean added;
        try { added = (Boolean) add.invoke(cell, slot.view, slot.index, slot.id, slot.params, slot.mark); }
        finally { restoring = false; }
        if (!added) {
            setX.invoke(slot.params, oldX); setY.invoke(slot.params, oldY);
            return;
        }
        if (relocated) {
            move.invoke(modelWriter, item, field(item, "container"), field(item, "screenId"), at[0], at[1]);
        }
        cell.requestLayout();
        FeatureSettings.diagnostic(context, "ls_augment_minors_workspace_runtime",
                "图标已恢复；网格=" + at[0] + "," + at[1]);
    }

    private static int field(Object item, String name) throws ReflectiveOperationException {
        return item.getClass().getField(name).getInt(item);
    }

    private static boolean workspaceItem(Object item) {
        if (item == null) return false;
        try {
            // Folder positions are managed by the folder model, not CellLayout.
            int container = field(item, "container");
            if (container != -100 && container != -101) return false;
            Object target = OemHooks.invoke(item, "getTargetComponent");
            if (!(target instanceof ComponentName)) return false;
            ComponentName component = (ComponentName) target;
            return EntryVisibilityPolicy.hideMinors(true, EntryVisibilityPolicy.LAUNCHER_HOST,
                    new EntryVisibilityPolicy.Component(component.getPackageName(), component.getClassName()));
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static final class Slot {
        final WeakReference<ViewGroup> cell;
        final View view;
        final int index, id;
        final Object params;
        final boolean mark;
        Slot(ViewGroup cell, View view, int index, int id, Object params, boolean mark) {
            this.cell = new WeakReference<>(cell); this.view = view;
            this.index = index; this.id = id; this.params = params; this.mark = mark;
        }
    }
}
