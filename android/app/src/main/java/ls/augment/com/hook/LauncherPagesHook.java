package ls.augment.com.hook;

import android.animation.LayoutTransition;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.DragEvent;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import ls.augment.com.LauncherOptions;

/** Shared stock/260005 implementation, verified against both launcher DEX files. */
final class LauncherPagesHook {
    private static final String ENTRY_TAG = "ls_augment.pages.entry";
    private static final String PREFS = "ls_augment_launcher_pages";
    private static boolean installed;
    private static Controller controller;

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Targets targets = new Targets(loader);
            controller = new Controller(module, targets);
            module.registerFeatureHook(module.prepareFeatureHook(targets.bind, "launcher.pages.bind", true)
                    .intercept(chain -> {
                        Controller c = controller;
                        ViewGroup workspace = (ViewGroup) targets.workspace.invoke(chain.getThisObject());
                        c.attach(workspace);
                        c.ready = false;
                        c.binding = true;
                        try {
                            List<Integer> saved = c.saved();
                            if (saved.isEmpty()) return chain.proceed();
                            // Modify this binding's IntArray, never the model's stable IDs.
                            Object ids = targets.listClone.invoke(chain.getArg(0));
                            List<Integer> merged = LauncherPageOrder.merge(targets.ids(ids), saved, c.keepEmpty());
                            targets.replaceIds(ids, merged);
                            return chain.proceed(new Object[]{ids});
                        } finally { c.binding = false; }
                    }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.finished, "launcher.pages.bound", true)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        Controller c = controller;
                        c.attach((ViewGroup) targets.workspace.invoke(chain.getThisObject()));
                        c.ready = true;
                        c.scheduleCleanup();
                        c.save();
                        return result;
                    }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.strip, "launcher.pages.keep_empty", true)
                    .intercept(chain -> {
                        Controller c = controller;
                        c.attach((ViewGroup) chain.getThisObject());
                        if (c.keepEmpty()) {
                            // G2 still removes real drag placeholders; Q0 must not rename a
                            // user's stable empty page to -201 before that cleanup runs.
                            c.scheduleCleanup();
                            if (c.ready && !c.binding && !c.mutating) c.save();
                            return null;
                        }
                        Object result = chain.proceed();
                        if (c.ready && !c.binding && !c.mutating) c.save();
                        return result;
                    }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.convertEmpty, "launcher.pages.stable_empty", true)
                    .intercept(chain -> {
                        Controller c = controller;
                        c.attach((ViewGroup) chain.getThisObject());
                        return c.keepEmpty() ? null : chain.proceed();
                    }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.menuInit, "launcher.pages.menu", true)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        controller.attachMenu((ViewGroup) chain.getThisObject());
                        return result;
                    }));
            installed = true;
        } catch (Throwable error) { module.logFeatureError("LAUNCHER_PAGES_INSTALL", error); }
    }

    /** Exact native signatures; an unrelated launcher is never modified by guesswork. */
    private static final class Targets {
        final Class<?> launcher, state, future;
        final Method bind, finished, strip, convertEmpty, removeExtra, workspace, menuInit, screenOrder, insert, pageAtId;
        final Method listClear, listAdd, listArray, listClone, currentPage, setCurrentPage, shortCuts, panelCount;
        final Method stateGet, modelGet, databaseGet, nextId, screenUtil, refreshDefault, updateIndicator, nativePrefs;
        final Field screens, launcherField, menuItems, firstScreen, bindingModel, vendorFirstScreen;

        Targets(ClassLoader loader) throws Exception {
            Class<?> ws = Class.forName("com.android.launcher3.Workspace", false, loader);
            launcher = Class.forName("com.android.launcher3.C2", false, loader);
            Class<?> list = Class.forName("com.android.launcher3.util.x0", false, loader);
            Class<?> finishedList = Class.forName("com.android.launcher3.util.z0", false, loader);
            Class<?> menu = Class.forName("com.android.launcher3.menu.MenuContainer", false, loader);
            Class<?> cell = Class.forName("com.android.launcher3.CellLayout", false, loader);
            Class<?> paged = Class.forName("com.android.launcher3.V4", false, loader);
            state = Class.forName("com.android.launcher3.P2", false, loader);
            Class<?> model = Class.forName("com.android.launcher3.D3", false, loader);
            Class<?> db = Class.forName("z1.k2", false, loader);
            Class<?> util = Class.forName("x1.Z", false, loader);
            future = Class.forName("com.android.launcher3.widget.custom.future.AIFutureWidgetUtils", false, loader);
            bind = method(launcher, "f", list);
            finished = method(launcher, "h", finishedList);
            workspace = method(launcher, "B2");
            strip = method(ws, "i3");
            convertEmpty = method(ws, "Q0");
            removeExtra = method(ws, "G2", int.class, boolean.class, Runnable.class);
            screenOrder = method(ws, "getScreenOrder");
            insert = method(ws, "v1", int.class, int.class);
            pageAtId = method(ws, "n", int.class);
            panelCount = method(ws, "getPanelCount");
            currentPage = method(paged, "getCurrentPage");
            setCurrentPage = method(paged, "setCurrentPage", int.class);
            updateIndicator = method(paged, "updatePageIndicator");
            shortCuts = method(cell, "getShortcutsAndWidgets");
            menuInit = method(menu, "G");
            listClear = method(list, "clear");
            listAdd = method(list, "m", int.class);
            listArray = method(list, "A");
            listClone = method(list, "q");
            screens = field(ws, "n");
            launcherField = field(ws, "x");
            menuItems = field(menu, "m");
            bindingModel = field(launcher, "h");
            firstScreen = field(Class.forName("com.android.launcher3.B4", false, loader), "j");
            vendorFirstScreen = field(Class.forName("com.android.launcher3.N5", false, loader), "j");
            stateGet = method(state, "h", Context.class);
            modelGet = method(state, "j");
            databaseGet = method(model, "m0");
            nextId = method(db, "F");
            screenUtil = method(launcher, "w2");
            refreshDefault = method(util, "b", ws);
            nativePrefs = method(Class.forName("com.android.launcher3.J3", false, loader), "m", Context.class);
            if (screenOrder.getReturnType() != list || insert.getReturnType() != cell
                    || nextId.getReturnType() != int.class || strip.getReturnType() != void.class
                    || !SparseArray.class.isAssignableFrom(screens.getType())) {
                throw new IllegalStateException("桌面页面接口不匹配");
            }
        }

        static Method method(Class<?> type, String name, Class<?>... args) throws Exception {
            Method method = type.getDeclaredMethod(name, args); method.setAccessible(true); return method;
        }
        static Field field(Class<?> type, String name) throws Exception {
            Field field = type.getDeclaredField(name); field.setAccessible(true); return field;
        }
        List<Integer> ids(Object value) throws Exception {
            ArrayList<Integer> ids = new ArrayList<>();
            for (int id : (int[]) listArray.invoke(value)) ids.add(id);
            return ids;
        }
        void replaceIds(Object value, List<Integer> ids) throws Exception {
            listClear.invoke(value);
            for (int id : ids) listAdd.invoke(value, id);
        }
    }

    private static final class Controller {
        final AugmentModule module;
        final Targets t;
        final Handler main = new Handler(Looper.getMainLooper());
        WeakReference<ViewGroup> workspace = new WeakReference<>(null);
        WeakReference<ViewGroup> menu = new WeakReference<>(null);
        Context context;
        SharedPreferences prefs;
        boolean ready, binding, mutating, subscribed;
        final Runnable cleanup = this::cleanupPlaceholders;

        Controller(AugmentModule module, Targets targets) { this.module = module; t = targets; }
        void attach(ViewGroup view) {
            if (view == null) return;
            if (workspace.get() != view) { workspace = new WeakReference<>(view); ready = false; }
            if (context == null) {
                context = view.getContext().getApplicationContext();
                prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            }
            if (!subscribed) {
                subscribed = FeatureSettings.addSnapshotListener(context, () -> main.post(this::configurationChanged));
            }
        }
        boolean enabled(String key) { return context != null && FeatureSettings.enabled(context, key); }
        boolean keepEmpty() {
            return prefs != null && LauncherPageOrder.preserveEmpty(FeatureSettings.hasVerifiedSnapshot(context),
                    enabled(LauncherOptions.KEEP_EMPTY), prefs.getBoolean("keep_empty", false));
        }
        List<Integer> saved() { return prefs == null ? Collections.emptyList() : LauncherPageOrder.parse(prefs.getString("order", "")); }
        List<Integer> order() throws Exception {
            ViewGroup ws = workspace.get();
            return ws == null ? Collections.emptyList() : t.ids(t.screenOrder.invoke(ws));
        }
        void scheduleCleanup() {
            main.removeCallbacks(cleanup);
            if (ready && !binding && !mutating && keepEmpty()) main.postDelayed(cleanup, 250);
        }
        void cleanupPlaceholders() {
            ViewGroup ws = workspace.get();
            if (ws == null || !ws.isAttachedToWindow() || !ready || binding || mutating || !keepEmpty()) return;
            try {
                List<Integer> order = order();
                if (!order.contains(-201) && !order.contains(-200)) return;
                if (order.stream().filter(id -> id >= 0).count() < (Integer) t.panelCount.invoke(ws)) return;
                if ((Boolean) TargetReflection.call(ws, "getIsDragOccuring") || (Boolean) TargetReflection.call(ws, "isPageInTransition")) {
                    scheduleCleanup();
                    return;
                }
                // Native G2 checks loading and the protected edit substates itself.
                t.removeExtra.invoke(ws, 0, false, null);
                save();
            } catch (Throwable error) { failed(error); }
        }
        void configurationChanged() {
            try {
                ViewGroup menuView = menu.get();
                if (menuView != null) attachMenu(menuView);
                ViewGroup ws = workspace.get();
                if (ws == null || !ready || binding || mutating || !FeatureSettings.hasVerifiedSnapshot(context)) return;
                boolean before = prefs.getBoolean("keep_empty", false);
                boolean after = enabled(LauncherOptions.KEEP_EMPTY);
                if (before && !after) t.strip.invoke(ws);
                save();
            } catch (Throwable error) { failed(error); }
        }
        void save() {
            if (prefs == null || !ready || binding || mutating) return;
            if (!prefs.contains("order") && !enabled(LauncherOptions.PAGE_REORDER) && !enabled(LauncherOptions.KEEP_EMPTY)) return;
            try {
                boolean keep = keepEmpty();
                String order = LauncherPageOrder.encode(order());
                if (!order.equals(prefs.getString("order", "")) || keep != prefs.getBoolean("keep_empty", false)) {
                    prefs.edit().putString("order", order).putBoolean("keep_empty", keep).apply();
                }
            } catch (Throwable error) { failed(error); }
        }
        void attachMenu(ViewGroup container) {
            menu = new WeakReference<>(container);
            try {
                Object owner = TargetReflection.field(container, "g");
                if (t.launcher.isInstance(owner)) attach((ViewGroup) t.workspace.invoke(owner));
                LinearLayout row = (LinearLayout) t.menuItems.get(container);
                if (row == null) return;
                TextView entry = row.findViewWithTag(ENTRY_TAG);
                boolean enabled = enabled(LauncherOptions.PAGE_REORDER) || enabled(LauncherOptions.KEEP_EMPTY);
                if (entry == null && enabled) {
                    entry = new TextView(container.getContext());
                    entry.setTag(ENTRY_TAG);
                    entry.setText("页面");
                    entry.setGravity(Gravity.CENTER);
                    entry.setMinHeight(dp(48));
                    entry.setPadding(dp(4), dp(8), dp(4), dp(8));
                    entry.setTextSize(12);
                    entry.setContentDescription("管理桌面页面");
                    entry.setOnClickListener(view -> showEditor(container.getContext()));
                    row.addView(entry, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
                }
                if (entry == null) return;
                TextView reference = null;
                for (int i = 0; i < row.getChildCount(); i++) {
                    View child = row.getChildAt(i);
                    if (child != entry && child instanceof TextView) { reference = (TextView) child; break; }
                }
                if (reference != null) {
                    entry.setTextColor(reference.getTextColors());
                    entry.setTextSize(TypedValue.COMPLEX_UNIT_PX, reference.getTextSize());
                }
                LinearLayout.LayoutParams layout = (LinearLayout.LayoutParams) entry.getLayoutParams();
                boolean vertical = row.getOrientation() == LinearLayout.VERTICAL;
                LinearLayout.LayoutParams referenceLayout = reference != null && reference.getLayoutParams() instanceof LinearLayout.LayoutParams
                        ? (LinearLayout.LayoutParams) reference.getLayoutParams() : null;
                layout.width = vertical ? ViewGroup.LayoutParams.MATCH_PARENT : referenceLayout == null ? dp(76) : referenceLayout.width;
                layout.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                layout.weight = vertical ? 0 : referenceLayout == null ? 1 : referenceLayout.weight;
                entry.setLayoutParams(layout);
                entry.setVisibility(enabled ? View.VISIBLE : View.GONE);
            } catch (Throwable error) { failed(error); }
        }
        int dp(int value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }
        void failed(Throwable error) { module.logFeatureError("LAUNCHER_PAGES", error); }
        void notifyUser(String text) { if (context != null) Toast.makeText(context, text, Toast.LENGTH_SHORT).show(); }

        boolean fixed(int id) throws Exception {
            if (id < 0) return true;
            ViewGroup ws = workspace.get();
            Object launcher = t.launcherField.get(ws);
            if (id == 0 && t.firstScreen.getBoolean(t.bindingModel.get(launcher)) && !t.vendorFirstScreen.getBoolean(null)) return true;
            // AIFutureWidgetUtils owns this page and always inserts it at the first position.
            Object futureId = TargetReflection.call(t.future, "l", context);
            return futureId instanceof Integer && (Integer) futureId > 0 && id == (Integer) futureId;
        }
        boolean empty(int id) throws Exception {
            Object page = t.pageAtId.invoke(workspace.get(), id);
            return page != null && ((ViewGroup) t.shortCuts.invoke(page)).getChildCount() == 0;
        }
        void checkEditable() throws Exception {
            ViewGroup ws = workspace.get();
            if (ws == null || !ws.isAttachedToWindow() || !ready || binding || mutating
                    || (Boolean) TargetReflection.call(ws, "getIsDragOccuring")
                    || (Boolean) TargetReflection.call(ws, "isPageInTransition")) {
                throw new IllegalStateException("桌面正在更新，请稍后再试");
            }
            if ((Integer) t.panelCount.invoke(ws) != 1) throw new IllegalStateException("请在单屏桌面模式下管理页面");
        }
        void move(int fromId, int toId) throws Exception {
            checkEditable();
            if (!enabled(LauncherOptions.PAGE_REORDER)) return;
            List<Integer> order = order();
            int from = order.indexOf(fromId), to = order.indexOf(toId);
            if (from < 0 || to < 0 || from == to || fixed(fromId) || fixed(toId)) return;
            for (int i = Math.min(from, to); i <= Math.max(from, to); i++) if (fixed(order.get(i))) return;
            ViewGroup ws = workspace.get();
            int current = (Integer) t.currentPage.invoke(ws);
            int currentId = current >= 0 && current < order.size() ? order.get(current) : fromId;
            View child = (View) t.pageAtId.invoke(ws, fromId);
            if (child == null || ws.indexOfChild(child) != from || order.size() != ws.getChildCount()) throw new IllegalStateException("桌面页面尚未就绪");
            Snapshot before = new Snapshot(this);
            mutating = true;
            try {
                ws.setLayoutTransition(null);
                ws.removeView(child);
                order = LauncherPageOrder.move(order, fromId, toId);
                t.replaceIds(t.screenOrder.invoke(ws), order);
                ws.addView(child, to);
                refresh(currentId);
            } catch (Exception error) {
                before.restore(this);
                throw error;
            } finally { ws.setLayoutTransition(before.transition); mutating = false; }
            save();
        }
        void add() throws Exception {
            checkEditable();
            if (!enabled(LauncherOptions.KEEP_EMPTY)) return;
            List<Integer> order = order();
            if (order.size() >= LauncherPageOrder.MAX_PAGES) throw new IllegalStateException("桌面页面已达到上限");
            Object state = t.stateGet.invoke(null, context);
            Object model = t.modelGet.invoke(state);
            Object db = t.databaseGet.invoke(model);
            int id;
            int attempts = 0;
            do {
                id = (Integer) t.nextId.invoke(db);
                if (++attempts > LauncherPageOrder.MAX_PAGES * 2 || id < 0) throw new IllegalStateException("无法分配新的页面");
            } while (order.contains(id) || saved().contains(id));
            int index = order.size();
            while (index > 0 && order.get(index - 1) < 0) index--;
            ViewGroup ws = workspace.get();
            Snapshot before = new Snapshot(this);
            mutating = true;
            try {
                ws.setLayoutTransition(null);
                t.insert.invoke(ws, id, index);
                refresh(id);
            } catch (Exception error) {
                before.restore(this);
                throw error;
            } finally { ws.setLayoutTransition(before.transition); mutating = false; }
            save();
        }
        void delete(int id) throws Exception {
            checkEditable();
            if (!enabled(LauncherOptions.KEEP_EMPTY) || fixed(id) || !empty(id)) return;
            List<Integer> order = order();
            int index = order.indexOf(id);
            long pages = order.stream().filter(value -> value >= 0).count();
            if (index < 0 || pages <= 1) return;
            ViewGroup ws = workspace.get();
            View child = (View) t.pageAtId.invoke(ws, id);
            if (child == null || ws.indexOfChild(child) != index) return;
            int current = (Integer) t.currentPage.invoke(ws);
            int currentId = current >= 0 && current < order.size() ? order.get(current) : id;
            Snapshot before = new Snapshot(this);
            mutating = true;
            try {
                ws.setLayoutTransition(null);
                ws.removeView(child);
                ((SparseArray<?>) t.screens.get(ws)).remove(id);
                order.remove(index);
                t.replaceIds(t.screenOrder.invoke(ws), order);
                refresh(currentId == id ? order.get(Math.min(index, order.size() - 1)) : currentId);
            } catch (Exception error) {
                before.restore(this);
                throw error;
            } finally { ws.setLayoutTransition(before.transition); mutating = false; }
            save();
        }
        void refresh(int selectedId) throws Exception {
            ViewGroup ws = workspace.get();
            Object launcher = t.launcherField.get(ws);
            t.refreshDefault.invoke(t.screenUtil.invoke(launcher), ws);
            int index = LauncherPageOrder.selectedIndex(order(), selectedId, 0);
            t.setCurrentPage.invoke(ws, index);
            Object nativeState = TargetReflection.call(TargetReflection.call(launcher, "getStateManager"), "C");
            TargetReflection.call(ws, "setState", nativeState);
            t.updateIndicator.invoke(ws);
            ws.requestLayout();
            ws.invalidate();
        }
        void showEditor(Context activityContext) {
            try {
                checkEditable();
                if (!enabled(LauncherOptions.PAGE_REORDER) && !enabled(LauncherOptions.KEEP_EMPTY)) return;
                new Editor(this, activityContext).show();
            } catch (Throwable error) { failed(error); notifyUser("桌面正在更新或使用双屏布局，请稍后在单屏桌面重试"); }
        }
    }

    /** Roll back native page objects as well as IDs if a launcher callback rejects a mutation. */
    private static final class Snapshot {
        final List<Integer> order;
        final List<View> children = new ArrayList<>();
        final SparseArray<Object> pages;
        final LayoutTransition transition;
        final int currentId;
        final SharedPreferences nativePreferences;
        final boolean hasHomeId, hasHomeIndex;
        final int homeId, homeIndex;
        @SuppressWarnings("unchecked") Snapshot(Controller c) throws Exception {
            ViewGroup ws = c.workspace.get();
            order = c.order();
            for (int i = 0; i < ws.getChildCount(); i++) children.add(ws.getChildAt(i));
            pages = ((SparseArray<Object>) c.t.screens.get(ws)).clone();
            transition = ws.getLayoutTransition();
            int current = (Integer) c.t.currentPage.invoke(ws);
            currentId = current >= 0 && current < order.size() ? order.get(current) : order.get(0);
            nativePreferences = (SharedPreferences) c.t.nativePrefs.invoke(null, c.context);
            hasHomeId = nativePreferences.contains("launcher.default_screen_id");
            hasHomeIndex = nativePreferences.contains("launcher.default_screen");
            homeId = nativePreferences.getInt("launcher.default_screen_id", -1);
            homeIndex = nativePreferences.getInt("launcher.default_screen", -1);
        }
        @SuppressWarnings("unchecked") void restore(Controller c) {
            ViewGroup ws = c.workspace.get();
            if (ws == null) { c.ready = false; return; }
            // A failing view callback must not prevent restoration of the remaining pages.
            ArrayList<View> liveChildren = new ArrayList<>();
            for (int i = 0; i < ws.getChildCount(); i++) liveChildren.add(ws.getChildAt(i));
            for (View child : liveChildren) {
                try { ws.removeView(child); } catch (Throwable error) { c.failed(error); }
            }
            try {
                SparseArray<Object> live = (SparseArray<Object>) c.t.screens.get(ws);
                live.clear();
                for (int i = 0; i < pages.size(); i++) live.put(pages.keyAt(i), pages.valueAt(i));
            } catch (Throwable error) { c.failed(error); }
            try {
                c.t.replaceIds(c.t.screenOrder.invoke(ws), order);
            } catch (Throwable error) { c.failed(error); }
            for (int i = 0; i < children.size(); i++) {
                View child = children.get(i);
                try {
                    if (child.getParent() == ws && ws.indexOfChild(child) != i) ws.removeView(child);
                    if (child.getParent() == null) ws.addView(child, Math.min(i, ws.getChildCount()));
                } catch (Throwable error) { c.failed(error); }
            }
            try {
                SharedPreferences.Editor edit = nativePreferences.edit();
                if (hasHomeId) edit.putInt("launcher.default_screen_id", homeId); else edit.remove("launcher.default_screen_id");
                if (hasHomeIndex) edit.putInt("launcher.default_screen", homeIndex); else edit.remove("launcher.default_screen");
                edit.apply();
            } catch (Throwable error) { c.failed(error); }
            try {
                // Restore the current page even if the optional visual refresh fails again.
                c.t.setCurrentPage.invoke(ws, LauncherPageOrder.selectedIndex(order, currentId, 0));
                ws.requestLayout();
                ws.invalidate();
                try { c.refresh(currentId); } catch (Exception error) { c.failed(error); }
            } catch (Throwable error) { c.failed(error); }
            try {
                if (!order.equals(c.order()) || ws.getChildCount() != children.size()) throw new IllegalStateException("页面顺序未恢复");
                SparseArray<Object> live = (SparseArray<Object>) c.t.screens.get(ws);
                if (live.size() != pages.size()) throw new IllegalStateException("页面映射未恢复");
                for (int i = 0; i < children.size(); i++) if (ws.getChildAt(i) != children.get(i)) throw new IllegalStateException("页面视图未恢复");
                for (int i = 0; i < pages.size(); i++) if (live.get(pages.keyAt(i)) != pages.valueAt(i)) throw new IllegalStateException("页面身份未恢复");
            } catch (Throwable error) {
                c.ready = false;
                c.failed(error);
                c.notifyUser("页面恢复未完成，请重新启动桌面后再操作");
            }
        }
    }

    private static final class Editor {
        final Controller c;
        final Context context;
        final LinearLayout rows;
        final ScrollView scroll;
        final AlertDialog dialog;
        int edgeScroll;
        final Runnable scrollWhileDragging = new Runnable() {
            @Override public void run() {
                if (edgeScroll == 0 || !dialog.isShowing()) return;
                scroll.scrollBy(0, edgeScroll * c.dp(14));
                c.main.postDelayed(this, 32);
            }
        };
        Editor(Controller c, Context context) {
            this.c = c; this.context = context;
            rows = new LinearLayout(context);
            rows.setOrientation(LinearLayout.VERTICAL);
            rows.setPadding(c.dp(12), c.dp(8), c.dp(12), c.dp(8));
            scroll = new ScrollView(context);
            scroll.addView(rows);
            dialog = new AlertDialog.Builder(context).setTitle("桌面页面").setView(scroll)
                    .setPositiveButton("完成", null).create();
            dialog.setOnDismissListener(ignored -> stopScroll());
            scroll.setOnDragListener((view, event) -> {
                if (!isOurDrag(event)) return false;
                if (event.getAction() == DragEvent.ACTION_DRAG_LOCATION) updateScroll(event.getY());
                if (event.getAction() == DragEvent.ACTION_DRAG_ENDED || event.getAction() == DragEvent.ACTION_DROP) stopScroll();
                return true;
            });
        }
        void show() throws Exception { render(); dialog.show(); }
        void action(Action action) {
            try { action.run(); render(); }
            catch (Throwable error) { c.failed(error); c.notifyUser("页面操作未完成，请稍后重试"); }
        }
        void render() throws Exception {
            rows.removeAllViews();
            boolean reorder = c.enabled(LauncherOptions.PAGE_REORDER), keep = c.enabled(LauncherOptions.KEEP_EMPTY);
            TextView hint = new TextView(context);
            hint.setText(reorder ? "长按页面预览，拖到目标页面即可排序；图标、文件夹和组件一起移动。" : "可新增空白页，或删除不含图标和组件的页面。");
            hint.setPadding(0, 0, 0, c.dp(12));
            rows.addView(hint);
            List<Integer> order = c.order();
            int number = 0;
            for (int id : order) {
                if (id < 0) continue;
                boolean fixed = c.fixed(id), empty = c.empty(id);
                LinearLayout row = new LinearLayout(context);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(0, c.dp(6), 0, c.dp(6));
                View source = (View) c.t.pageAtId.invoke(c.workspace.get(), id);
                Preview preview = new Preview(context, source);
                row.addView(preview, new LinearLayout.LayoutParams(c.dp(82), c.dp(132)));
                LinearLayout controls = new LinearLayout(context);
                controls.setOrientation(LinearLayout.VERTICAL);
                controls.setPadding(c.dp(12), 0, 0, 0);
                row.addView(controls, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
                TextView title = new TextView(context);
                title.setText("第 " + (++number) + " 页" + (empty ? " · 空白页" : "") + (fixed ? " · 系统固定页" : ""));
                controls.addView(title);
                preview.setContentDescription(title.getText());
                preview.setOnLongClickListener(view -> {
                    if (!c.enabled(LauncherOptions.PAGE_REORDER) || fixed) return false;
                    return view.startDragAndDrop(ClipData.newPlainText("桌面页面", ""), new View.DragShadowBuilder(view), new DraggedPage(this, id), 0);
                });
                row.setOnDragListener((view, event) -> {
                    if (!isOurDrag(event) || !c.enabled(LauncherOptions.PAGE_REORDER) || fixed) return false;
                    if (event.getAction() == DragEvent.ACTION_DRAG_LOCATION) updateScroll(view.getTop() + event.getY() - scroll.getScrollY());
                    if (event.getAction() == DragEvent.ACTION_DRAG_ENTERED) view.setAlpha(0.5f);
                    if (event.getAction() == DragEvent.ACTION_DRAG_EXITED || event.getAction() == DragEvent.ACTION_DRAG_ENDED) view.setAlpha(1);
                    if (event.getAction() == DragEvent.ACTION_DRAG_ENDED) stopScroll();
                    if (event.getAction() == DragEvent.ACTION_DROP) {
                        stopScroll();
                        view.setAlpha(1);
                        int from = ((DraggedPage) event.getLocalState()).id;
                        action(() -> c.move(from, id));
                    }
                    return true;
                });
                if (reorder && !fixed) {
                    LinearLayout move = new LinearLayout(context);
                    int index = order.indexOf(id);
                    button(move, "前移", index > 0 && !c.fixed(order.get(index - 1)), () -> c.move(id, order.get(index - 1)));
                    button(move, "后移", index + 1 < order.size() && !c.fixed(order.get(index + 1)), () -> c.move(id, order.get(index + 1)));
                    controls.addView(move);
                }
                if (keep && empty && !fixed && order.stream().filter(value -> value >= 0).count() > 1) {
                    button(controls, "删除空白页", true, () -> c.delete(id));
                }
                rows.addView(row);
            }
            if (keep) button(rows, "新增空白页", order.size() < LauncherPageOrder.MAX_PAGES, c::add);
        }
        boolean isOurDrag(DragEvent event) {
            return event.getLocalState() instanceof DraggedPage && ((DraggedPage) event.getLocalState()).owner == this;
        }
        void updateScroll(float y) {
            int direction = y < c.dp(56) ? -1 : y > scroll.getHeight() - c.dp(56) ? 1 : 0;
            if (direction == edgeScroll) return;
            stopScroll();
            edgeScroll = direction;
            if (direction != 0) c.main.post(scrollWhileDragging);
        }
        void stopScroll() { edgeScroll = 0; c.main.removeCallbacks(scrollWhileDragging); }
        void button(LinearLayout parent, String label, boolean enabled, Action action) {
            Button button = new Button(context);
            button.setText(label);
            button.setEnabled(enabled);
            button.setOnClickListener(view -> action(action));
            parent.addView(button, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
    }
    private static final class DraggedPage {
        final Editor owner;
        final int id;
        DraggedPage(Editor owner, int id) { this.owner = owner; this.id = id; }
    }
    private interface Action { void run() throws Exception; }

    /** Paint the existing page into a small preview without copying or reparenting its icons. */
    private static final class Preview extends View {
        final WeakReference<View> page;
        final Paint background = new Paint(Paint.ANTI_ALIAS_FLAG);
        Preview(Context context, View page) {
            super(context);
            this.page = new WeakReference<>(page);
            TypedValue color = new TypedValue();
            context.getTheme().resolveAttribute(android.R.attr.colorControlHighlight, color, true);
            background.setColor(color.data == 0 ? 0x22888888 : color.data);
        }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            canvas.drawRoundRect(new RectF(0, 0, getWidth(), getHeight()), 12, 12, background);
            View source = page.get();
            if (source == null || source.getWidth() <= 0 || source.getHeight() <= 0) return;
            int save = canvas.save();
            try {
                float scale = Math.min((getWidth() - 8f) / source.getWidth(), (getHeight() - 8f) / source.getHeight());
                canvas.translate((getWidth() - source.getWidth() * scale) / 2, (getHeight() - source.getHeight() * scale) / 2);
                canvas.scale(scale, scale);
                source.draw(canvas);
            } catch (RuntimeException ignored) {
                // Some widget hosts can only render into their own window.
            } finally { canvas.restoreToCount(save); }
        }
    }
    private LauncherPagesHook() {}
}
