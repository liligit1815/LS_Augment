package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.Map;
import org.json.JSONObject;

/** Real layout/search/space-switch checks; never clicks hide/show or changes selections. */
final class HideUiDeviceCases {
    static JSONObject glass(Instrumentation instrumentation) throws Exception {
        boolean unlocked = HiddenEntrySession.isUnlocked();
        for (int i = 0; i < 7; i++) HiddenEntrySession.recordSystemVersionTap(SystemClock.elapsedRealtime());
        Activity activity = instrumentation.startActivitySync(new Intent(instrumentation.getTargetContext(),
                HideAppsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        Map<String,String> before = new AppConfig(activity).snapshot();
        android.app.Dialog[] dialog = new android.app.Dialog[1];
        try {
            awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
                UiKit.Fold fold = field(activity, "hideFold"); fold.show(true);
                Button hide = field(activity, "hideAllButton");
                require(hide.isEnabled(), "Configured hide action unavailable");
                hide.performClick();
                dialog[0] = field(activity, "actionDialog");
                require(dialog[0] != null && dialog[0].isShowing(), "Confirmation did not open");
            });
            SystemClock.sleep(800);
            instrumentation.waitForIdleSync();
            instrumentation.runOnMainSync(() -> {
                LiquidGlassLayout glass = dialog[0].getWindow().getDecorView().findViewWithTag("liquid-glass-dialog");
                require(glass != null && glass.opticalEffectActive(), "Real sampled optical glass is inactive");
                require(glass.captureGeneration() > 0, "Dialog has no backdrop sample");
                require(hasText(glass, "确认") && hasText(glass, "取消"), "Confirmation actions missing");
            });
            File screenshot = new File(activity.getFilesDir(), "device-regression-results/hide-glass-20301.png");
            screenshot.getParentFile().mkdirs();
            Bitmap bitmap = instrumentation.getUiAutomation().takeScreenshot();
            require(bitmap != null, "Dialog screenshot unavailable");
            try (FileOutputStream output = new FileOutputStream(screenshot)) { bitmap.compress(Bitmap.CompressFormat.PNG, 100, output); }
            bitmap.recycle();
            instrumentation.runOnMainSync(() -> dialog[0].cancel());
            require(before.equals(new AppConfig(activity).snapshot()), "Opening/cancelling dialog changed configuration");
            return new JSONObject().put("success", true).put("opticalGlassActive", true)
                    .put("cancelledWithoutAction", true).put("screenshot", screenshot.getAbsolutePath());
        } finally {
            instrumentation.runOnMainSync(() -> { if(dialog[0]!=null)dialog[0].dismiss(); activity.finish(); });
            if (!unlocked) HiddenEntrySession.lock();
        }
    }

    static JSONObject run(Instrumentation instrumentation) throws Exception {
        boolean unlocked = HiddenEntrySession.isUnlocked();
        Map<String,String> before = new AppConfig(instrumentation.getTargetContext()).snapshot();
        RootHideManager manager = new RootHideManager(instrumentation.getTargetContext());
        require(manager.rootStatus().state == RootHideManager.RootState.GRANTED, "Root unavailable");
        java.util.Set<RootHideManager.Target> selectedBefore = manager.targets();
        for (int i = 0; i < 7; i++) HiddenEntrySession.recordSystemVersionTap(SystemClock.elapsedRealtime());
        Activity activity = instrumentation.startActivitySync(new Intent(instrumentation.getTargetContext(),
                HideAppsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        JSONObject result = new JSONObject();
        instrumentation.runOnMainSync(() -> activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON));
        try {
            awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
                LinearLayout panel = field(activity, "appsPanel");
                require(panel.getChildCount() == 2, "Expected actions then configuration only");
                ViewGroup actions = (ViewGroup) panel.getChildAt(0);
                require("全部隐藏".contentEquals(((Button) actions.getChildAt(0)).getText()), "Hide action order");
                require("全部显示".contentEquals(((Button) actions.getChildAt(1)).getText()), "Show action order");
                UiKit.Fold fold = field(activity, "hideFold"); fold.show(true);
                LinearLayout body = field(activity, "appConfigBody");
                View expand = field(activity, "appsExpand");
                require(body.getVisibility() == View.GONE, "List not initially collapsed");
                expand.performClick(); require(body.getVisibility() == View.VISIBLE, "Expand failed");
                expand.performClick(); require(body.getVisibility() == View.GONE, "Collapse failed");
                expand.performClick();
                require(!hasText(panel, "保存修改") && !hasText(panel, "重新读取应用名单"), "Removed buttons remain");
                require(!hasText(panel, "应用显示与历史") && !hasText(panel, "逐个显示"), "Old actions remain");
                LinearLayout browser = field(activity, "appBrowser");
                EditText search = field(activity, "search"); Button sort = field(activity, "sort");
                require(body.indexOfChild((View) sort.getParent()) < body.indexOfChild(browser), "Sort must precede search");
                Button refreshButton = field(activity, "refreshAppsButton");
                require(sort.getLayoutParams().width == refreshButton.getLayoutParams().width
                        && sort.getLayoutParams().height == refreshButton.getLayoutParams().height, "Toolbar button dimensions differ");
                require(sort.getCurrentTextColor() == refreshButton.getCurrentTextColor(), "Toolbar button colors differ");
                require(((LinearLayout.LayoutParams)((View)sort.getParent()).getLayoutParams()).topMargin
                        == Math.round(4*activity.getResources().getDisplayMetrics().density), "Toolbar spacing must be 4dp");
                require((Boolean) field(activity, "allSpaces"), "Default all-space filter missing");
                Button selector = field(activity, "spaceSelector"); Button refresh = field(activity, "refreshAppsButton");
                require(selector.getParent() == refresh.getParent(), "Refresh not next to selector");
                LinearLayout row = (LinearLayout) selector.getParent();
                require(row.indexOfChild(refresh) > row.indexOfChild(selector), "Refresh must be on the right");
                search.setText("__no_such_app_hide_ui_test__");
                require(hasText(field(activity, "appList"), "没有找到匹配的应用"), "Search empty state missing");
                search.setText(""); sort.performClick(); sort.performClick();
            });
            int allCount = count(activity);
            int sum = 0;
            java.util.List<RootHideManager.UserRecord> users = field(activity, "userRecords");
            for (RootHideManager.UserRecord user : users) {
                if (user.serial < 0) continue;
                choose(instrumentation, activity, "space-" + user.userId);
                awaitLoaded(instrumentation, activity);
                instrumentation.runOnMainSync(() -> {
                    require(!(Boolean) field(activity, "allSpaces"), "Individual filter not applied");
                    require((Integer) field(activity, "activeUserId") == user.userId, "Wrong selected space");
                    for (Object item : (java.util.List<?>) field(activity, "loaded")) {
                        try { Field f = item.getClass().getDeclaredField("record"); f.setAccessible(true);
                            require(((RootHideManager.AppRecord) f.get(item)).target.userId == user.userId, "Other-space app leaked into list");
                        } catch (ReflectiveOperationException error) { throw new AssertionError(error); }
                    }
                    Button refresh = field(activity, "refreshAppsButton"); refresh.performClick();
                });
                awaitLoaded(instrumentation, activity);
                require(!(Boolean) field(activity, "allSpaces") && (Integer) field(activity, "activeUserId") == user.userId,
                        "Refresh changed selected space");
                sum += count(activity);
            }
            choose(instrumentation, activity, "space-all");
            awaitLoaded(instrumentation, activity);
            require(count(activity) == sum && allCount == sum, "All-space list is not union of individual lists");
            instrumentation.runOnMainSync(() -> {
                Button refresh = field(activity, "refreshAppsButton"); refresh.performClick();
            });
            awaitLoaded(instrumentation, activity);
            require((Boolean) field(activity, "allSpaces") && count(activity) == sum, "All-space refresh lost filter or entries");
            require(manager.refreshTargets().success && selectedBefore.equals(manager.targets()), "List actions changed selection");
            require(before.equals(new AppConfig(activity).snapshot()), "List actions changed configuration");
            SystemClock.sleep(600);
            File screenshot = new File(activity.getFilesDir(), "device-regression-results/hide-ui-20307.png");
            screenshot.getParentFile().mkdirs();
            Bitmap bitmap = instrumentation.getUiAutomation().takeScreenshot();
            require(bitmap != null, "Screenshot unavailable");
            try (FileOutputStream output = new FileOutputStream(screenshot)) { bitmap.compress(Bitmap.CompressFormat.PNG, 100, output); }
            bitmap.recycle();
            instrumentation.runOnMainSync(() -> {
                Button selector = field(activity, "spaceSelector"); selector.performClick();
            });
            SystemClock.sleep(500);
            File dropdown = new File(activity.getFilesDir(), "device-regression-results/hide-spaces-20307.png");
            Bitmap dropdownBitmap = instrumentation.getUiAutomation().takeScreenshot();
            require(dropdownBitmap != null, "Dropdown screenshot unavailable");
            try (FileOutputStream output = new FileOutputStream(dropdown)) { dropdownBitmap.compress(Bitmap.CompressFormat.PNG, 100, output); }
            dropdownBitmap.recycle();
            instrumentation.runOnMainSync(() -> { android.widget.PopupWindow popup = field(activity, "spacePopup"); popup.dismiss(); });
            result.put("success", true).put("allSpaceApps", sum).put("spaces", users.size())
                    .put("collapseDropdownSortSearchRefreshVerified", true).put("configurationUnchanged", true)
                    .put("screenshot", screenshot.getAbsolutePath()).put("dropdownScreenshot", dropdown.getAbsolutePath());
        } finally {
            instrumentation.runOnMainSync(activity::finish);
            instrumentation.waitForIdleSync();
            if (!unlocked) HiddenEntrySession.lock();
        }
        return result;
    }

    static JSONObject responsiveness(Instrumentation instrumentation) throws Exception {
        boolean unlocked = HiddenEntrySession.isUnlocked();
        ContextSnapshot baseline = new ContextSnapshot(instrumentation.getTargetContext());
        for(int i=0;i<7;i++) HiddenEntrySession.recordSystemVersionTap(SystemClock.elapsedRealtime());
        Activity activity = instrumentation.startActivitySync(new Intent(instrumentation.getTargetContext(),
                HideAppsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        java.util.concurrent.CountDownLatch blocked = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch release = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch drawn = new java.util.concurrent.CountDownLatch(1);
        long[] timing = new long[2]; View[] originalRow = new View[1];
        try {
            awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
                activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                UiKit.Fold fold=field(activity,"hideFold");fold.show(true);
                View expand=field(activity,"appsExpand");expand.performClick();
                LinearLayout list=field(activity,"appList");originalRow[0]=list.getChildAt(0);
                // Deliberately stale UI confirmation exercises the real button path,
                // but must be rejected before any package visibility action.
                java.util.Set<RootHideManager.Target> saved=field(activity,"savedTargets");
                saved.clear();saved.add(new RootHideManager.Target(0,0,"ls.augment.txvictim"));
                TextView progress=field(activity,"operationStatus");
                progress.getViewTreeObserver().addOnDrawListener(() -> {
                    if(progress.getVisibility()==View.VISIBLE && drawn.getCount()>0){timing[1]=SystemClock.elapsedRealtime();drawn.countDown();}
                });
            });
            java.util.concurrent.ExecutorService pageWorker=field(activity,"executor");
            pageWorker.execute(()->{blocked.countDown();try{release.await(30,java.util.concurrent.TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}});
            require(blocked.await(5,java.util.concurrent.TimeUnit.SECONDS),"Could not occupy list worker");
            instrumentation.runOnMainSync(() -> {
                Button show=field(activity,"showAllButton");show.performClick();
                android.app.Dialog confirmation=field(activity,"actionDialog");
                require(confirmation!=null&&confirmation.isShowing(),"Real confirmation missing");
                timing[0]=SystemClock.elapsedRealtime();
                confirmation.getWindow().getDecorView().findViewWithTag("glass-dialog-confirm").performClick();
                TextView progress=field(activity,"operationStatus");require(progress.getVisibility()==View.VISIBLE,"No immediate progress");
                require(((LinearLayout)field(activity,"appList")).getChildAt(0)==originalRow[0],"Click rebuilt application list");
            });
            require(drawn.await(5,java.util.concurrent.TimeUnit.SECONDS),"Progress did not draw promptly");
            boolean[] completed={false};long deadline=SystemClock.elapsedRealtime()+15000;
            while(SystemClock.elapsedRealtime()<deadline) {
                instrumentation.runOnMainSync(()->{android.app.Dialog dialog=field(activity,"actionDialog");
                    completed[0]=dialog!=null&&dialog.isShowing()&&hasText(dialog.getWindow().getDecorView(),"操作未完成");});
                if(completed[0])break;SystemClock.sleep(50);
            }
            require(completed[0],"Operation waited behind list worker");
            long completionMs=SystemClock.elapsedRealtime()-timing[0];
            require(release.getCount()==1,"Page worker was released before completion");
            instrumentation.runOnMainSync(()->{
                android.app.Dialog result=field(activity,"actionDialog");
                require(hasText(result.getWindow().getDecorView(),"配置应用已变化，请重新确认操作"),"Stale confirmation was not rejected");
                require(((LinearLayout)field(activity,"appList")).getChildAt(0)==originalRow[0],"Completion rebuilt list before acknowledgement");
                result.dismiss();
            });
            release.countDown();awaitLoaded(instrumentation,activity);baseline.requireUnchanged();
            return new JSONObject().put("success",true).put("feedbackFrameMs",timing[1]-timing[0])
                    .put("rejectedResultMs",completionMs).put("completedWhileListWorkerBlocked",true)
                    .put("noListRebuildDuringAction",true).put("staleConfirmationRejected",true);
        } finally {
            release.countDown();instrumentation.runOnMainSync(activity::finish);
            if(!unlocked)HiddenEntrySession.lock();
        }
    }
    private static final class ContextSnapshot {
        final android.content.Context context;final Map<String,String> config;
        final java.util.Set<RootHideManager.Target> selected;
        ContextSnapshot(android.content.Context context){this.context=context;config=new AppConfig(context).snapshot();
            RootHideManager manager=new RootHideManager(context);manager.rootStatus();selected=manager.targets();}
        void requireUnchanged(){RootHideManager manager=new RootHideManager(context);manager.rootStatus();
            require(selected.equals(manager.targets())&&config.equals(new AppConfig(context).snapshot()),"UI test altered configuration");}
    }

    static JSONObject autosave(Instrumentation instrumentation) throws Exception {
        final String pkg = "ls.augment.txvictim";
        boolean unlocked = HiddenEntrySession.isUnlocked();
        RootHideManager manager = new RootHideManager(instrumentation.getTargetContext());
        require(manager.rootStatus().state == RootHideManager.RootState.GRANTED, "Root unavailable");
        java.util.Set<RootHideManager.Target> original = manager.targets();
        require(original.stream().noneMatch(t -> t.packageName.equals(pkg)), "Fixture already selected");
        Map<String,String> before = new AppConfig(instrumentation.getTargetContext()).snapshot();
        for (int i=0;i<7;i++) HiddenEntrySession.recordSystemVersionTap(SystemClock.elapsedRealtime());
        Activity activity = instrumentation.startActivitySync(new Intent(instrumentation.getTargetContext(),
                HideAppsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        try {
            awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
                UiKit.Fold fold = field(activity, "hideFold"); fold.show(true);
                View expand = field(activity, "appsExpand"); expand.performClick();
                for (int user : new int[]{0,999}) fixtureCheck(activity, user, true);
                // Refresh during the debounce interval must retain both unsaved selections.
                Button refresh = field(activity, "refreshAppsButton"); refresh.performClick();
            });
            awaitSaved(instrumentation, activity); awaitLoaded(instrumentation, activity);
            require(manager.refreshTargets().success, "Selection refresh failed");
            require(manager.targets().contains(new RootHideManager.Target(0,0,pkg))
                    && manager.targets().contains(new RootHideManager.Target(999,10,pkg)), "Both spaces did not autosave");
            choose(instrumentation, activity, "space-999"); awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> fixtureCheck(activity, 999, false));
            awaitSaved(instrumentation, activity);
            require(manager.refreshTargets().success && manager.targets().contains(new RootHideManager.Target(0,0,pkg))
                    && !manager.targets().contains(new RootHideManager.Target(999,10,pkg)), "Individual-space edit affected other space");
            choose(instrumentation, activity, "space-all"); awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> fixtureCheck(activity, 0, false));
            awaitSaved(instrumentation, activity);
            require(manager.refreshTargets().success && manager.targets().equals(original), "Original selection not restored");
            require(before.equals(new AppConfig(activity).snapshot()), "Original configuration not restored");
            return new JSONObject().put("success", true).put("bothSpacesAutosaved", true)
                    .put("refreshPreservedPendingSelection", true).put("individualSpaceIsolation", true)
                    .put("originalSelectionRestored", true).put("applicationVisibilityActions", 0);
        } finally {
            instrumentation.runOnMainSync(activity::finish);
            if (!unlocked) HiddenEntrySession.lock();
        }
    }

    private static void fixtureCheck(Activity activity, int user, boolean checked) {
        LinearLayout list = field(activity, "appList");
        View row = list.findViewWithTag("app-" + user + "-ls.augment.txvictim");
        require(row != null, "Fixture row missing");
        android.widget.CheckBox box = checkbox(row);
        require(box != null && box.isEnabled(), "Fixture checkbox disabled");
        if (box.isChecked() != checked) box.performClick();
    }
    private static android.widget.CheckBox checkbox(View view) {
        if (view instanceof android.widget.CheckBox) return (android.widget.CheckBox) view;
        if (view instanceof ViewGroup) for(int i=0;i<((ViewGroup)view).getChildCount();i++) {
            android.widget.CheckBox found=checkbox(((ViewGroup)view).getChildAt(i)); if(found!=null)return found;
        }
        return null;
    }
    private static void awaitSaved(Instrumentation instrumentation, Activity activity) {
        long deadline=SystemClock.elapsedRealtime()+60000; boolean[] ready={false};
        while(SystemClock.elapsedRealtime()<deadline) {
            instrumentation.runOnMainSync(()->ready[0]=!(Boolean)field(activity,"dirty") && !(Boolean)field(activity,"saving"));
            if(ready[0])return; SystemClock.sleep(200);
        }
        throw new AssertionError("Automatic save did not finish");
    }

    private static int count(Activity activity) { return ((java.util.List<?>) field(activity, "loaded")).size(); }
    private static void choose(Instrumentation instrumentation, Activity activity, String tag) {
        instrumentation.runOnMainSync(() -> {
            Button selector = field(activity, "spaceSelector"); selector.performClick();
            android.widget.PopupWindow popup = field(activity, "spacePopup");
            require(popup != null && popup.isShowing(), "Space dropdown did not open");
            require(popup.getContentView().findViewWithTag("space-all") != null, "All spaces option missing");
            View option = popup.getContentView().findViewWithTag(tag);
            require(option != null && option.isEnabled(), "Space option unavailable: " + tag);
            option.performClick();
        });
    }

    private static void awaitLoaded(Instrumentation instrumentation, Activity activity) {
        long deadline = SystemClock.elapsedRealtime() + 60000;
        boolean[] ready = new boolean[1];
        while (SystemClock.elapsedRealtime() < deadline) {
            instrumentation.runOnMainSync(() -> ready[0] = !(Boolean) field(activity, "loading")
                    && !(Boolean) field(activity, "selectionLoading"));
            if (ready[0]) return;
            SystemClock.sleep(200);
        }
        throw new AssertionError("Application list did not finish loading");
    }
    @SuppressWarnings("unchecked") private static <T> T field(Activity activity, String name) {
        try { Field f = HideAppsActivity.class.getDeclaredField(name); f.setAccessible(true); return (T) f.get(activity); }
        catch (Exception error) { throw new AssertionError(error); }
    }
    private static boolean hasText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return true;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++)
            if (hasText(((ViewGroup) view).getChildAt(i), text)) return true;
        return false;
    }
    private static void require(boolean value, String message) { if (!value) throw new AssertionError(message); }
}
