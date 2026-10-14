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
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.Map;
import org.json.JSONObject;

/** Real layout/search/space checks; confirmations are cancelled without visibility actions. */
final class HideUiDeviceCases {
    static JSONObject glass(Instrumentation instrumentation) throws Exception {
        boolean unlocked = HiddenEntrySession.isUnlocked();
        for (int i = 0; i < 7; i++) HiddenEntrySession.recordSystemVersionTap(SystemClock.elapsedRealtime());
        Activity activity = instrumentation.startActivitySync(new Intent(instrumentation.getTargetContext(),
                HideMenuActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        Map<String,String> before = new AppConfig(activity).snapshot();
        android.app.Dialog[] dialog = new android.app.Dialog[1];
        try {
            awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
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
                require(hasText(glass, "确认隐藏") && hasText(glass, "取消"), "Confirmation actions missing");
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
        Map<RootHideManager.Target, RootHideManager.State> visibilityBefore = manager.queryStates(selectedBefore);
        for (int i = 0; i < 7; i++) HiddenEntrySession.recordSystemVersionTap(SystemClock.elapsedRealtime());
        Activity activity = instrumentation.startActivitySync(new Intent(instrumentation.getTargetContext(),
                HideMenuActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        JSONObject result = new JSONObject();
        String[] automaticGate = new String[1];
        boolean[] automaticPrerequisites = new boolean[1];
        instrumentation.runOnMainSync(() -> activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON));
        try {
            awaitLoaded(instrumentation, activity);
            instrumentation.waitForIdleSync();
            prepareCollapsibleManager(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
                automaticGate[0] = activationProblem(activity, field(activity, "automationEnabled"));
                automaticPrerequisites[0] = (Boolean) field(activity, "rootReady")
                        && (Boolean) field(activity, "selectionReady")
                        && !(Boolean) field(activity, "selectionLoading") && !(Boolean) field(activity, "loading")
                        && ((Switch) field(activity, "master")).isChecked()
                        && !((java.util.Set<?>) field(activity, "savedTargets")).isEmpty();
                if (automaticPrerequisites[0]) {
                    require((Boolean) field(activity, "automationReady"),
                            "Real system listener prerequisites rejected automatic hiding: " + automaticGate[0]);
                    require(automaticGate[0].isEmpty(), "Automatic hiding gate rejected verified prerequisites: " + automaticGate[0]);
                } else require(!automaticGate[0].isEmpty(), "Automatic hiding gate omitted a missing real prerequisite");
                LinearLayout panel = field(activity, "appsPanel");
                require(activity instanceof HideAppsActivity, "Third-level page does not host the real manager");
                require(panel.getVisibility() == View.VISIBLE, "Management tools must be visible on entry");
                LinearLayout body = field(activity, "appConfigBody");
                require(body.getVisibility() == View.VISIBLE, "Direct selection did not leave the candidate list visible");
                chooseFilter(activity, "已配置", 0);
                assertFilter(activity, 0);
                chooseFilter(activity, "已隐藏", 1); assertFilter(activity, 1);
                chooseFilter(activity, "全部应用", 2); assertFilter(activity, 2);
                require(!hasText(panel, "保存修改") && !hasText(panel, "重新读取应用名单"), "Removed buttons remain");
                require(!hasText(panel, "应用显示与历史") && !hasText(panel, "逐个显示"), "Old actions remain");
                EditText search = field(activity, "search"); Button sort = field(activity, "sort");
                Button refreshButton = field(activity, "refreshAppsButton");
                int touchTarget = Math.round(44 * activity.getResources().getDisplayMetrics().density);
                require(sort.getHeight() >= touchTarget && refreshButton.getHeight() >= touchTarget,
                        "Toolbar touch targets are below the public component size");
                int primaryTouchTarget = Math.round(48 * activity.getResources().getDisplayMetrics().density);
                require(((Button) field(activity, "hideAllButton")).getHeight() >= primaryTouchTarget
                        && ((Button) field(activity, "showAllButton")).getHeight() >= primaryTouchTarget,
                        "Primary action touch targets are below 48dp");
                UiKit ui = field(activity, "ui");
                require(sort.getCurrentTextColor() == ui.text && refreshButton.getCurrentTextColor() == ui.accent,
                        "Toolbar colors do not use the common theme roles");
                requireRecoveryAvailable(activity);
                require((Boolean) field(activity, "allSpaces"), "Default all-space filter missing");
                Button selector = field(activity, "spaceSelector"); Button refresh = field(activity, "refreshAppsButton");
                require(selector.getParent() == refresh.getParent(), "Refresh not next to selector");
                LinearLayout row = (LinearLayout) selector.getParent();
                require(row.indexOfChild(refresh) > row.indexOfChild(selector), "Refresh must be on the right");
                String batchScope = restoreConfirmation(activity);
                search.setText("__no_such_app_hide_ui_test__");
                require(hasText(field(activity, "appList"), "没有找到匹配的应用"), "Search empty state missing");
                require(batchScope.equals(restoreConfirmation(activity)), "Search changed the confirmed batch scope");
                chooseFilter(activity, "已隐藏", 1);
                require(batchScope.equals(restoreConfirmation(activity)), "List filter changed the confirmed batch scope");
                chooseFilter(activity, "全部应用", 2);
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
            verifyRecreation(instrumentation, activity, users);
            require(manager.refreshTargets().success && selectedBefore.equals(manager.targets()), "Recreation changed saved selection");
            require(before.equals(new AppConfig(activity).snapshot()), "Recreation changed configuration");
            require(visibilityBefore.equals(manager.queryStates(selectedBefore)), "Layout or fold checks changed application visibility");
            result.put("success", true).put("allSpaceApps", sum).put("spaces", users.size())
                    .put("collapsibleListFiltersSpaceSortSearchRefreshVerified", true).put("configurationUnchanged", true)
                    .put("featureFoldStatePreserved", true).put("runtimeFooterRemoved", true)
                    .put("applicationVisibilityUnchanged", true)
                    .put("automaticPrerequisitesSatisfied", automaticPrerequisites[0])
                    .put("automaticActivationProblem", automaticGate[0])
                    .put("recreationStateVerified", true)
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
                HideMenuActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        java.util.concurrent.CountDownLatch blocked = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch release = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch drawn = new java.util.concurrent.CountDownLatch(1);
        long[] timing = new long[2]; View[] originalRow = new View[1];
        try {
            awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
                activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                LinearLayout list=field(activity,"appList");originalRow[0]=list.getChildAt(0);
                // Deliberately stale UI confirmation exercises the real button path,
                // but must be rejected before any package visibility action.
                java.util.Set<RootHideManager.Target> saved=field(activity,"savedTargets");
                RootHideManager.Target stale=new RootHideManager.Target(0,Long.MAX_VALUE,"ls.augment.txvictim");
                require(!(saved.size()==1&&saved.contains(stale)),"Stale confirmation fixture matches the saved selection");
                saved.clear();saved.add(stale);
                invoke(activity,"updateActionButtons");
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
                require(((View)field(activity,"appConfigBody")).getVisibility()==View.GONE,"Operation reopened the collapsed list");
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
                require(((View)field(activity,"appConfigBody")).getVisibility()==View.GONE,"Result reopened the collapsed list");
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
                HideMenuActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        try {
            awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
                showAppList(activity, true);
                chooseFilter(activity, "全部应用", 2);
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
    private static void prepareCollapsibleManager(Instrumentation instrumentation, Activity activity) {
            instrumentation.runOnMainSync(() -> {
                require(activity.getWindow().getDecorView().findViewWithTag("hide-environment") == null,
                        "Runtime-condition footer remains under the feature switch");
                requireNavigationGap(activity);
                LinearLayout body = field(activity, "appConfigBody");
                require(body.getVisibility() == View.GONE, "Application list must start collapsed");
                require((Integer) field(activity, "listFilter") == 0, "Configured list is not the initial filter");
                require(((View) field(activity, "spaceSelector")).isShown()
                        && ((View) field(activity, "hideAllButton")).isShown()
                        && ((View) field(activity, "showAllButton")).isShown()
                        && ((View) field(activity, "chooseAppsButton")).isShown(),
                        "Collapsed list concealed scope or management actions");
                View arrow = field(activity, "appsExpand");
                require(arrow.performClick() && body.getVisibility() == View.VISIBLE, "List arrow did not expand");
                require(arrow.performClick() && body.getVisibility() == View.GONE, "List arrow did not collapse");
                requireFeatureFoldStability(activity);
                invoke(activity, "renderApps");
                require(body.getVisibility() == View.GONE, "Rendering reopened the manually collapsed list");
                ((Button) field(activity, "refreshAppsButton")).performClick();
            });
            awaitLoaded(instrumentation, activity);
            instrumentation.runOnMainSync(() -> {
                require(((View) field(activity, "appConfigBody")).getVisibility() == View.GONE,
                        "Refresh reopened the manually collapsed list");
                require(((Button) field(activity, "chooseAppsButton")).performClick(), "Direct app selection did not respond");
                require((Integer) field(activity, "listFilter") == 2
                        && ((View) field(activity, "appConfigBody")).getVisibility() == View.VISIBLE,
                        "Direct app selection did not expand the candidate list");
                require(!(Boolean) field(activity, "dirty"), "Folding or selecting a list mode changed saved configuration");
            });
            instrumentation.waitForIdleSync();
    }
    private static void chooseFilter(Activity activity, String title, int expected) {
        View button = textView(field(activity, "appsPanel"), title);
        require(button instanceof Button && button.isEnabled(), "List filter unavailable: " + title);
        button.performClick();
        require((Integer) field(activity, "listFilter") == expected, "Wrong list filter selected: " + title);
    }
    private static void requireFeatureFoldStability(Activity activity) {
        UiKit.Fold tile = field(activity, "tileFold"), automatic = field(activity, "automationFold");
        for (UiKit.Fold fold : new UiKit.Fold[]{tile, automatic}) {
            boolean checked = fold.control.isChecked();
            if (checked) {
                fold.show(true);
                require(fold.arrow.performClick() && fold.content.getVisibility() == View.GONE,
                        "Enabled feature could not be manually collapsed");
            } else require(!fold.arrow.isEnabled(), "Disabled feature permits expanding its configuration");
            invoke(activity, "setOperationControls", false);
            invoke(activity, "setOperationControls", true);
            require(fold.control.isChecked() == checked && fold.content.getVisibility() == View.GONE,
                    "Temporary control locking changed the feature or discarded its collapsed state");
            if (checked) {
                require(fold.arrow.performClick() && fold.content.getVisibility() == View.VISIBLE,
                        "Feature did not expand after controls were restored");
                invoke(activity, "setOperationControls", false);
                invoke(activity, "setOperationControls", true);
                require(fold.content.getVisibility() == View.VISIBLE && fold.control.isChecked(),
                        "Temporary control locking discarded the expanded state");
                require(fold.arrow.performClick() && fold.content.getVisibility() == View.GONE,
                        "Feature could not collapse again after controls were restored");
            }
        }
        require(!(Boolean) field(activity, "dirty"), "Changing a fold changed saved feature settings");
    }
    private static void requireNavigationGap(Activity activity) {
        View path = activity.getWindow().getDecorView().findViewWithTag("page-path");
        require(path != null, "Common detail navigation missing");
        ViewGroup chrome = (ViewGroup) path.getParent();
        View first = firstContent(chrome.getChildAt(chrome.indexOfChild(path) + 2));
        require(first != null, "Detail content missing");
        int[] pathPoint = new int[2], firstPoint = new int[2];
        path.getLocationInWindow(pathPoint); first.getLocationInWindow(firstPoint);
        float gap = (firstPoint[1] - pathPoint[1] - path.getHeight())
                / activity.getResources().getDisplayMetrics().density;
        require(gap >= 7.5f && gap <= 12.5f, "Actual path-to-content gap is outside 8–12dp: " + gap);
    }
    private static View firstContent(View view) {
        if (!view.isShown() || view.getHeight() == 0) return null;
        if (view instanceof LiquidGlassLayout || view instanceof TextView || !(view instanceof ViewGroup)) return view;
        ViewGroup children = (ViewGroup) view;
        for (int i = 0; i < children.getChildCount(); i++) {
            View first = firstContent(children.getChildAt(i)); if (first != null) return first;
        }
        return null;
    }
    private static void showAppList(Activity activity, boolean expanded) { invoke(activity, "showAppList", expanded); }
    private static String activationProblem(Activity activity, Switch control) {
        try {
            java.lang.reflect.Method method = HideAppsActivity.class.getDeclaredMethod("activationProblem", Switch.class);
            method.setAccessible(true); return (String) method.invoke(activity, control);
        } catch (Exception error) { throw new AssertionError(error); }
    }
    private static void assertFilter(Activity activity, int filter) {
        LinearLayout list = field(activity, "appList");
        java.util.Set<RootHideManager.Target> selected = field(activity, "selected");
        java.util.Set<RootHideManager.Target> saved = field(activity, "savedTargets");
        for (Object item : (java.util.List<?>) field(activity, "loaded")) {
            try {
                Field recordField = item.getClass().getDeclaredField("record"); recordField.setAccessible(true);
                Field stateField = item.getClass().getDeclaredField("state"); stateField.setAccessible(true);
                RootHideManager.AppRecord record = (RootHideManager.AppRecord) recordField.get(item);
                boolean managed = selected.contains(record.target) || saved.contains(record.target);
                boolean eligible = !record.system && (filter == 2 || filter == 0 && managed
                        || filter == 1 && managed && stateField.get(item) == RootHideManager.State.HIDDEN);
                boolean shown = list.findViewWithTag("app-" + record.target.userId + "-" + record.target.packageName) != null;
                require(eligible == shown, "Filter shows the wrong app: " + record.target);
            } catch (ReflectiveOperationException error) { throw new AssertionError(error); }
        }
    }
    // Exercise the real enablement method without changing the saved feature switch.
    private static void requireRecoveryAvailable(Activity activity) {
        Switch original = field(activity, "master");
        Switch off = new Switch(activity);
        try {
            setField(activity, "master", off); invoke(activity, "updateActionButtons");
            Button hide = field(activity, "hideAllButton"), show = field(activity, "showAllButton");
            require(!hide.isEnabled(), "Hide action remained enabled while the feature is off");
            if (!((java.util.Set<?>) field(activity, "savedTargets")).isEmpty())
                require(show.isEnabled(), "Restoration was disabled with the master switch off");
            require(((View) field(activity, "appsPanel")).getVisibility() == View.VISIBLE
                    && ((View) field(activity, "showAllButton")).isShown(),
                    "Feature-off state concealed management controls");
        } finally { setField(activity, "master", original); invoke(activity, "updateActionButtons"); }
    }
    private static String restoreConfirmation(Activity activity) {
        Button show = field(activity, "showAllButton");
        if (!show.isEnabled()) return "unavailable";
        show.performClick();
        android.app.Dialog dialog = field(activity, "actionDialog");
        require(dialog != null && dialog.isShowing(), "Restore confirmation did not open");
        StringBuilder text = new StringBuilder(); collectText(dialog.getWindow().getDecorView(), text);
        dialog.cancel(); return text.toString();
    }
    private static void collectText(View view, StringBuilder text) {
        if (view instanceof TextView) text.append(((TextView) view).getText()).append('\n');
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++)
            collectText(((ViewGroup) view).getChildAt(i), text);
    }
    private static View textView(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            View found = textView(((ViewGroup) view).getChildAt(i), text); if (found != null) return found;
        }
        return null;
    }
    private static void verifyRecreation(Instrumentation instrumentation, Activity original,
            java.util.List<RootHideManager.UserRecord> users) {
        for (RootHideManager.UserRecord user : users) if (user.serial >= 0) {
            choose(instrumentation, original, "space-" + user.userId); awaitLoaded(instrumentation, original); break;
        }
        instrumentation.runOnMainSync(() -> {
            showAppList(original, true);
            chooseFilter(original, "已隐藏", 1);
            EditText search = field(original, "search"); search.setText("__recreation_hide_ui_test__");
            if (!(Boolean) field(original, "sortByInstall")) ((Button) field(original, "sort")).performClick();
            ((UiKit.Fold) field(original, "tileFold")).show(false);
            ((UiKit.Fold) field(original, "automationFold")).show(false);
            showAppList(original, false);
        });
        final boolean allSpaces = field(original, "allSpaces");
        final int userId = field(original, "activeUserId");
        final long serial = field(original, "activeUserSerial");
        final java.util.concurrent.atomic.AtomicReference<Activity> replacement = new java.util.concurrent.atomic.AtomicReference<>();
        android.app.Application app = original.getApplication();
        android.app.Application.ActivityLifecycleCallbacks callback = new android.app.Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity activity, android.os.Bundle state) { }
            @Override public void onActivityStarted(Activity activity) { }
            @Override public void onActivityResumed(Activity activity) {
                if (activity != original && activity.getClass() == original.getClass()) replacement.set(activity);
            }
            @Override public void onActivityPaused(Activity activity) { }
            @Override public void onActivityStopped(Activity activity) { }
            @Override public void onActivitySaveInstanceState(Activity activity, android.os.Bundle state) { }
            @Override public void onActivityDestroyed(Activity activity) { }
        };
        app.registerActivityLifecycleCallbacks(callback);
        try {
            instrumentation.runOnMainSync(original::recreate);
            long deadline = SystemClock.elapsedRealtime() + 15000;
            while (replacement.get() == null && SystemClock.elapsedRealtime() < deadline) SystemClock.sleep(100);
            Activity restored = replacement.get(); require(restored != null, "Manager did not recreate");
            awaitLoaded(instrumentation, restored);
            instrumentation.runOnMainSync(() -> {
                require((Boolean) field(restored, "allSpaces") == allSpaces
                        && (Integer) field(restored, "activeUserId") == userId
                        && (Long) field(restored, "activeUserSerial") == serial, "Recreation lost selected space");
                require((Integer) field(restored, "listFilter") == 1 && (Boolean) field(restored, "sortByInstall"),
                        "Recreation lost filtering or sorting");
                require("__recreation_hide_ui_test__".contentEquals(((EditText) field(restored, "search")).getText()),
                        "Recreation lost the search query");
                require(((View) field(restored, "appConfigBody")).getVisibility() == View.GONE
                        && ((View) field(restored, "tilePanel")).getVisibility() == View.GONE
                        && ((View) field(restored, "automationPanel")).getVisibility() == View.GONE,
                        "Recreation reopened a manually collapsed configuration");
            });
            instrumentation.runOnMainSync(() -> {
                showAppList(restored, true);
                UiKit.Fold tile = field(restored, "tileFold"); if (tile.control.isChecked()) tile.show(true);
            });
            boolean tileOpen = ((UiKit.Fold) field(restored, "tileFold")).control.isChecked();
            replacement.set(null);
            instrumentation.runOnMainSync(restored::recreate);
            deadline = SystemClock.elapsedRealtime() + 15000;
            while (replacement.get() == null && SystemClock.elapsedRealtime() < deadline) SystemClock.sleep(100);
            Activity expanded = replacement.get(); require(expanded != null, "Manager did not recreate expanded controls");
            awaitLoaded(instrumentation, expanded);
            instrumentation.runOnMainSync(() -> {
                require(((View) field(expanded, "appConfigBody")).getVisibility() == View.VISIBLE,
                        "Recreation discarded the expanded list state");
                require((((View) field(expanded, "tilePanel")).getVisibility() == View.VISIBLE) == tileOpen,
                        "Recreation discarded the tile configuration state");
                require((Integer) field(expanded, "listFilter") == 1 && (Boolean) field(expanded, "sortByInstall")
                        && "__recreation_hide_ui_test__".contentEquals(((EditText) field(expanded, "search")).getText()),
                        "Expanded recreation lost the browsing state");
            });
        } finally {
            app.unregisterActivityLifecycleCallbacks(callback);
            Activity restored = replacement.get(); if (restored != null) instrumentation.runOnMainSync(restored::finish);
        }
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
    private static void setField(Activity activity, String name, Object value) {
        try { Field f = HideAppsActivity.class.getDeclaredField(name); f.setAccessible(true); f.set(activity, value); }
        catch (Exception error) { throw new AssertionError(error); }
    }
    private static void invoke(Activity activity, String name) {
        try { java.lang.reflect.Method method = HideAppsActivity.class.getDeclaredMethod(name); method.setAccessible(true); method.invoke(activity); }
        catch (Exception error) { throw new AssertionError(error); }
    }
    private static void invoke(Activity activity, String name, boolean value) {
        try { java.lang.reflect.Method method = HideAppsActivity.class.getDeclaredMethod(name, boolean.class); method.setAccessible(true); method.invoke(activity, value); }
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
