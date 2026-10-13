package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import cn.nubia.tgk.TgkService;
import cn.nubia.tgk.data.TgkData;
import cn.nubia.tgk.widget.TgkShowCaseListViewAdapter;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import ls.augment.com.ShoulderQuickSwitchPolicy;
import ls.augment.com.ShoulderQuickSwitchPolicy.CaseRef;

/** End-to-end transaction scheduling through the production hook and store. */
public final class TestShoulderSwitchRuntime {
    private static int checks;
    private static AugmentModule module;
    private static void check(boolean ok, String why) {
        checks++;
        if (!ok) throw new AssertionError(why);
    }
    private static CaseRef ref(int table, long id) { return new CaseRef(0, "game.one", table, id); }
    private static void candidates(CaseRef... refs) {
        ShoulderQuickSwitchPolicy policy = ShoulderQuickSwitchPolicy.empty();
        for (CaseRef ref : refs) policy = policy.with(ref, true);
        FeatureSettings.candidates = policy.serialize();
    }
    private static final class Fixture {
        final Context context = new Context();
        final TgkService service;
        Fixture(boolean macro) {
            FeatureSettings.current = context;
            FeatureSettings.on = true;
            candidates(ref(0, 11), ref(0, 29));
            TgkData a = new TgkData(11, "A", 100, 0);
            TgkData b = new TgkData(29, "B", 300, macro ? 4 : 2);
            TgkData c = new TgkData(97, "C", 700, 5);
            a.state = 7; // Preserve preset + modified metadata while clearing selection.
            b.state = 6;
            TgkData other = new TgkData(777, "Other", 1300, 3);
            other.packageName = "game.two";
            other.state = 5;
            context.resolver.put(0, a);
            context.resolver.put(0, b);
            context.resolver.put(0, c);
            context.resolver.put(0, other);
            service = new TgkService(context);
            service.mInputManagerProxy.appliedIds.clear();
        }
        void click() throws Throwable { service.onTgkCaseViewBottonClick(1); }
        void block() { context.resolver.block(); }
        void entered() throws Exception {
            check(context.resolver.entered.await(3, TimeUnit.SECONDS), "selection reached real transaction boundary");
        }
        void release() { context.resolver.unblock(); }
        void selected(long id, String title, int point, int mode) {
            check(context.resolver.selected("game.one") == id, "persisted selected ID is " + id);
            check(service.mTgkGameInfo.getSelectedCaseData().ID == id, "loaded full model matches target " + id);
            check(service.mTgkCaseShowView.title.equals(title), "title is " + title);
            check(service.mInputManagerProxy.points.get(137)[0] == point, "real setter receives target coordinate " + point);
            check(service.mInputManagerProxy.modes.get(137) == mode, "real setter receives target mode " + mode);
        }
    }
    private static void settle() throws Exception {
        // Storage workers only enqueue main-thread completion. Drain every production
        // executor and the main-handler queue until rollback/reload work is also done.
        for (int round = 0; round < 4; round++) {
            android.os.AsyncTask.SERIAL_EXECUTOR.submit(() -> {}).get(4, TimeUnit.SECONDS);
            for (Field field : ShoulderQuickSwitchHook.class.getDeclaredFields()) {
                if (!Modifier.isStatic(field.getModifiers())
                        || !ExecutorService.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                ((ExecutorService) field.get(null)).submit(() -> {}).get(4, TimeUnit.SECONDS);
            }
            Handler.drain();
        }
    }
    private static TgkShowCaseListViewAdapter menu(Fixture f) {
        TgkShowCaseListViewAdapter adapter = new TgkShowCaseListViewAdapter();
        adapter.list.addAll(f.service.mTgkGameInfo.presetTableList);
        adapter.list.addAll(f.service.mTgkGameInfo.importTableList);
        adapter.setListener(f.service.tgkCaseListViewAdapterListener);
        return adapter;
    }
    private static void requestEditor(Fixture f, int arg1, int arg2) {
        android.os.Message message = android.os.Message.obtain();
        message.what = 0;message.obj = f.service.mPackageName;message.arg1 = arg1;message.arg2 = arg2;
        f.service.mHandler.sendMessage(message);
        Handler.drain();
    }

    public static void main(String[] args) throws Throwable {
        FeatureSettings.current = new Context();
        FeatureSettings.on = true;
        module = new AugmentModule();
        ShoulderQuickSwitchHook.install(module, TestShoulderSwitchRuntime.class.getClassLoader());
        check(module.errors.isEmpty(), "exact OEM contracts install: " + module.logs);
        check(module.hooks.values().stream().anyMatch(r -> r.id.equals("shoulder.selection_store")),
                "production transactional provider route installed");
        check(module.hooks.values().stream().anyMatch(r -> r.id.equals("shoulder.input.setTgkPoint")),
                "production framework input observation installed");

        Fixture ordinary = new Fixture(false);
        ordinary.click();settle();
        ordinary.selected(29, "B", 305, 2);
        check(ordinary.context.resolver.database.get("0:11").state == 6
                && ordinary.context.resolver.database.get("0:29").state == 7,
                "selection transaction preserves all non-selected metadata flags");
        check(ordinary.context.resolver.database.get("0:777").state == 5,
                "selection transaction leaves another application's scheme intact");
        check(ordinary.service.originalClicks == 0, "successful direct switch consumes its click");
        ordinary.click();settle();ordinary.selected(11, "A", 105, 0);

        Fixture imported = new Fixture(false);
        TgkData importB = imported.context.resolver.database.remove("0:29");
        importB.state = 10;
        imported.context.resolver.put(1, importB);
        imported.service.reload();imported.service.mInputManagerProxy.appliedIds.clear();
        candidates(ref(0, 11), ref(1, 29));
        imported.click();settle();imported.selected(29, "B", 305, 2);
        check(imported.service.mTgkGameInfo.selectedTableId == 1
                && imported.context.resolver.database.get("1:29").state == 11,
                "imported scheme uses real table ID and preserves imported metadata");

        Fixture pending = new Fixture(false);
        pending.block();pending.click();pending.entered();
        check(pending.service.mTgkCaseShowView.title.equals("A")
                && pending.service.mInputManagerProxy.appliedIds.isEmpty(),
                "pending save does not publish target title or apply uncommitted mapping");
        pending.service.reload();
        check(pending.service.mInputManagerProxy.appliedIds.isEmpty(),
                "external OEM reload cannot apply a transient selection while saving");
        pending.release();settle();pending.selected(29, "B", 305, 2);
        check(pending.service.mInputManagerProxy.appliedIds.stream().allMatch(id -> id == 29),
                "deferred reload only uses committed latest target");

        Fixture editorDeferred = new Fixture(false);
        editorDeferred.block();editorDeferred.click();editorDeferred.entered();
        int queriesBeforeEditor = editorDeferred.context.resolver.queries;
        int messageCopies = android.os.Message.copies, messageRecycles = android.os.Message.recycles;
        requestEditor(editorDeferred, 5, 9);requestEditor(editorDeferred, 42, 17);
        check(editorDeferred.service.editorOpened == 0 && editorDeferred.service.mTgkMapView == null,
                "pending MSG_SHOW_VIEW neither creates nor initializes the editor");
        check(editorDeferred.context.resolver.queries == queriesBeforeEditor,
                "pending editor message does not read transient database selection");
        check(android.os.Message.copies == messageCopies + 2
                && android.os.Message.recycles >= messageRecycles + 3,
                "deferral copies messages and recycles replaced copy plus original frames");
        editorDeferred.release();settle();
        check(editorDeferred.service.editorOpened == 1
                && editorDeferred.service.mTgkMapView.initializedId == 29,
                "one queued editor opens using committed B after switch completion");
        check(editorDeferred.service.lastEditorArg1 == 42 && editorDeferred.service.lastEditorArg2 == 17,
                "replayed latest message retains its original arguments");
        check(editorDeferred.context.resolver.selected("game.one") == 29,
                "normal editor initialization releases lease without restoring pre-switch A");

        Fixture directEditor = new Fixture(false);
        directEditor.block();directEditor.click();directEditor.entered();
        cn.nubia.tgk.TgkMapView premature = new cn.nubia.tgk.TgkMapView(directEditor.context);
        int directQueries = directEditor.context.resolver.queries;
        try { premature.initTgkMapView("game.one"); } catch (IllegalStateException refused) { }
        check(premature.initializations == 0 && directEditor.context.resolver.queries == directQueries,
                "direct init entrance is refused while switching without reading DB");
        directEditor.release();settle();directEditor.selected(29, "B", 305, 2);

        for (boolean precommitFailure : new boolean[]{false, true}) {
            Fixture editorFailure = new Fixture(false);
            if (precommitFailure) editorFailure.context.resolver.failUpdateOnce = true;
            else editorFailure.service.mInputManagerProxy.failPointsOnce = true;
            editorFailure.block();editorFailure.click();editorFailure.entered();requestEditor(editorFailure, 7, 11);
            editorFailure.release();settle();
            check(editorFailure.service.editorOpened == 1
                    && editorFailure.service.mTgkMapView.initializedId == 11,
                    precommitFailure ? "editor replays on retained A after pre-commit failure"
                            : "editor replays only after input rollback restored A");
            check(editorFailure.context.resolver.selected("game.one") == 11,
                    "editor opened after failure cannot restore transient failed B");
        }

        for (String cancelledEditor : new String[]{"off", "app", "destroy"}) {
            Fixture editorCancel = new Fixture(false);
            editorCancel.block();editorCancel.click();editorCancel.entered();requestEditor(editorCancel, 3, 8);
            if (cancelledEditor.equals("off")) FeatureSettings.publish(false);
            else if (cancelledEditor.equals("app")) editorCancel.service.enableTgkMap("game.two", 0);
            else editorCancel.service.onDestroy();
            editorCancel.release();settle();FeatureSettings.publish(true);
            check(editorCancel.service.editorOpened == 0 && editorCancel.service.mTgkMapView == null,
                    cancelledEditor + " cancellation clears queued editor message permanently");
            check(editorCancel.context.resolver.selected("game.one") == 11,
                    cancelledEditor + " cancellation still restores actual prior persistent scheme");
        }

        Fixture editorLatest = new Fixture(false);
        candidates(ref(0, 11), ref(0, 29), ref(0, 97));
        TgkShowCaseListViewAdapter latestMenu = menu(editorLatest);
        editorLatest.block();latestMenu.setSelected(latestMenu.getList(), 1, true);editorLatest.entered();
        requestEditor(editorLatest, 21, 34);latestMenu.setSelected(latestMenu.getList(), 2, true);
        editorLatest.release();settle();
        check(editorLatest.service.editorOpened == 1 && editorLatest.service.mTgkMapView.initializedId == 97,
                "editor queued under B follows superseding C rather than an old completion");
        check(editorLatest.context.resolver.selected("game.one") == 97,
                "replayed editor's pure lease release preserves final C selection");

        Fixture rapid = new Fixture(false);
        rapid.block();rapid.click();rapid.entered();rapid.click();rapid.click();
        rapid.release();settle();rapid.selected(29, "B", 305, 2);
        check(rapid.service.mInputManagerProxy.appliedIds.stream().allMatch(id -> id == 29),
                "superseded A/B callbacks do not reapply older mappings");

        Fixture three = new Fixture(false);
        candidates(ref(0, 11), ref(0, 29), ref(0, 97));
        TgkShowCaseListViewAdapter menu = menu(three);
        check(menu.getList().size() == 3, "menu contains actual candidate objects");
        three.block();menu.setSelected(menu.getList(), 1, true);three.entered();
        menu.setSelected(menu.getList(), 0, true);menu.setSelected(menu.getList(), 2, true);
        three.release();settle();three.selected(97, "C", 705, 5);
        check(!three.service.mInputManagerProxy.appliedIds.isEmpty()
                && three.service.mInputManagerProxy.appliedIds.stream().allMatch(id -> id == 97),
                "only C applies after queued B/A/C menu requests");

        Fixture latestContents = new Fixture(false);
        latestContents.block();latestContents.click();latestContents.entered();
        TgkData edited = latestContents.context.resolver.database.get("0:29");
        edited.pointsArray[0][0].left = 900;edited.pointsArray[0][0].right = 910;
        edited.optionArray[0] = 5;
        latestContents.release();settle();latestContents.selected(29, "B", 905, 5);
        check(latestContents.context.resolver.database.get("0:29").pointsArray[0][0].left == 900,
                "selection does not overwrite newer scheme contents from cached model");

        Fixture deleted = new Fixture(false);
        deleted.block();deleted.click();deleted.entered();
        deleted.context.resolver.database.remove("0:29");
        deleted.release();settle();deleted.selected(11, "A", 105, 0);
        check(deleted.service.mInputManagerProxy.appliedIds.stream().noneMatch(id -> id == 29),
                "deleted target ID cannot redirect to another scheme's index or apply stale contents");

        Fixture macro = new Fixture(true);
        macro.block();macro.click();macro.entered();
        check(macro.service.mInputManagerProxy.macroCaseId == -1, "macro is not rebound before commit");
        macro.release();settle();macro.selected(29, "B", 305, 4);
        check(macro.service.mInputManagerProxy.macroCaseId == 29,
                "mode-4 downstream binding sees committed target ID in boundary model");
        check(macro.context.resolver.macroCapabilitiesCalls == 1,
                "macro application requires one matching ready provider capability reply");

        for (String unavailable : new String[]{"missing", "oldVersion", "notReady", "notOk"}) {
            Fixture macroFailure = new Fixture(true);
            if (unavailable.equals("missing")) macroFailure.context.resolver.macroCapabilitiesMissing = true;
            if (unavailable.equals("oldVersion")) macroFailure.context.resolver.macroCapabilitiesVersion = 20530;
            if (unavailable.equals("notReady")) macroFailure.context.resolver.macroCapabilitiesReady = false;
            if (unavailable.equals("notOk")) macroFailure.context.resolver.macroCapabilitiesOk = false;
            macroFailure.click();settle();macroFailure.selected(11, "A", 105, 0);
            check(macroFailure.context.resolver.macroCapabilitiesCalls == 1,
                    unavailable + " macro endpoint was queried before mapping application");
            check(macroFailure.service.mInputManagerProxy.macroCaseId == -1
                    && macroFailure.service.mInputManagerProxy.appliedIds.stream().noneMatch(id -> id == 29),
                    unavailable + " macro endpoint cannot apply B or publish its binding");
            check("A".equals(macroFailure.service.mTgkCaseShowView.title),
                    unavailable + " macro endpoint restores the previous actual title and mapping");
        }

        Fixture dbFailure = new Fixture(false);
        dbFailure.context.resolver.failUpdate = true;dbFailure.click();settle();
        dbFailure.selected(11, "A", 105, 0);
        check(dbFailure.service.mInputManagerProxy.appliedIds.stream().noneMatch(id -> id == 29),
                "failed selection transaction cannot apply target mapping");
        dbFailure.context.resolver.failUpdate = false;

        for (boolean pointFailure : new boolean[]{true, false}) {
            Fixture inputFailure = new Fixture(false);
            if (pointFailure) inputFailure.service.mInputManagerProxy.failPointsOnce = true;
            else inputFailure.service.mInputManagerProxy.failModeOnce = true;
            inputFailure.click();settle();inputFailure.selected(11, "A", 105, 0);
            check(inputFailure.service.mInputManagerProxy.appliedIds.get(
                    inputFailure.service.mInputManagerProxy.appliedIds.size() - 1) == 11,
                    "input failure restores previous full mapping after proxy swallow");
        }

        Fixture disabled = new Fixture(false);
        disabled.block();disabled.click();disabled.entered();
        long cancelStart = System.nanoTime();FeatureSettings.publish(false);
        check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - cancelStart) < 500,
                "disable returns without waiting for an in-flight provider transaction");
        disabled.release();settle();
        check(disabled.service.mInputManagerProxy.appliedIds.stream().noneMatch(id -> id == 29)
                && disabled.service.mTgkCaseShowView.title.equals("A"),
                "feature disable cancels pending target and its old completion");
        check(disabled.context.resolver.selected("game.one") == 11,
                "cancelled save restores previous persistent selection without applying target");
        FeatureSettings.publish(true);

        Fixture committedWindow = new Fixture(false);
        committedWindow.click();android.os.AsyncTask.SERIAL_EXECUTOR.submit(() -> {}).get(4, TimeUnit.SECONDS);
        check(committedWindow.context.resolver.selected("game.one") == 29
                && committedWindow.service.mInputManagerProxy.appliedIds.isEmpty(),
                "commit-to-main-completion window is reached deterministically");
        FeatureSettings.publish(false);settle();FeatureSettings.publish(true);
        check(committedWindow.context.resolver.selected("game.one") == 11
                && committedWindow.service.mInputManagerProxy.appliedIds.isEmpty(),
                "cancellation between commit and main callback restores DB without late input apply");

        Fixture replacedWindow = new Fixture(false);
        replacedWindow.click();android.os.AsyncTask.SERIAL_EXECUTOR.submit(() -> {}).get(4, TimeUnit.SECONDS);
        replacedWindow.click();settle();replacedWindow.selected(11, "A", 105, 0);
        check(!replacedWindow.service.mInputManagerProxy.appliedIds.isEmpty()
                && replacedWindow.service.mInputManagerProxy.appliedIds.stream().allMatch(id -> id == 11),
                "a new click in commit-to-main window prevents old B callback from applying");

        // Pause B after its database commit but before Store.call returns. C supersedes
        // B while B's worker is still in flight. B's lease must survive until C either
        // commits, or restores the actual A on cancellation / pre-commit failure.
        for (boolean cancelC : new boolean[]{true, false}) {
            Fixture inFlight = new Fixture(false);
            candidates(ref(0, 11), ref(0, 29), ref(0, 97));
            TgkShowCaseListViewAdapter inFlightMenu = menu(inFlight);
            inFlight.context.resolver.blockCommit();inFlightMenu.setSelected(inFlightMenu.getList(), 1, true);
            check(inFlight.context.resolver.commitEntered.await(3, TimeUnit.SECONDS),
                    "B committed before its store completion returns");
            check(inFlight.context.resolver.selected("game.one") == 29,
                    "in-flight B persistence changed storage while actual mapping remains A");
            if (!cancelC) inFlight.context.resolver.failUpdateOnce = true;
            inFlightMenu.setSelected(inFlightMenu.getList(), 2, true);
            if (cancelC) FeatureSettings.publish(false);
            inFlight.context.resolver.unblockCommit();settle();
            if (cancelC) FeatureSettings.publish(true);
            inFlight.selected(11, "A", 105, 0);
            check(inFlight.service.mInputManagerProxy.appliedIds.stream().noneMatch(id -> id == 29 || id == 97),
                    cancelC ? "cancelled C restores superseded committed B without applying either target"
                            : "C pre-commit failure restores A under retained B lease, never applying B/C");
        }

        Fixture appChange = new Fixture(false);
        appChange.block();appChange.click();appChange.entered();
        appChange.service.enableTgkMap("game.two", 0);
        appChange.release();settle();
        check(appChange.service.mPackageName.equals("game.two")
                && appChange.service.mInputManagerProxy.points.get(137)[0] == 1305,
                "new application's mapping survives old save completion");
        check(appChange.service.mInputManagerProxy.appliedIds.stream().noneMatch(id -> id == 29),
                "old game target never applies after foreground app change");
        check(appChange.context.resolver.selected("game.one") == 11,
                "app change restores only the cancelled old game's selection");

        Fixture destroyed = new Fixture(false);
        destroyed.block();destroyed.click();destroyed.entered();destroyed.service.onDestroy();
        destroyed.release();settle();
        check(destroyed.service.mInputManagerProxy.appliedIds.isEmpty(),
                "destroyed service receives no late target mapping");
        check(destroyed.context.resolver.selected("game.one") == 11,
                "destroyed owner's pending selection is restored in storage");

        Fixture staleWriter = new Fixture(false);
        cn.nubia.tgk.data.TgkGameInfo oldModel = staleWriter.service.mTgkGameInfo;
        staleWriter.click();settle();
        TgkService.DismissViewAsyncTask oldDismiss = new TgkService.DismissViewAsyncTask(staleWriter.service);
        oldModel.getSelectedCaseData().mainSw = false;
        oldDismiss.setTgkGameInfo(oldModel);oldDismiss.disableNative = true;oldDismiss.execute();
        android.os.AsyncTask.SERIAL_EXECUTOR.submit(() -> {}).get(4, TimeUnit.SECONDS);
        check(!staleWriter.service.mInputManagerProxy.gameEnabled,
                "old OEM dismiss task really disabled native shoulders before reconciliation");
        Handler.drain();settle();
        staleWriter.selected(29, "B", 305, 2);
        check(staleWriter.service.mInputManagerProxy.gameEnabled,
                "main-thread reconciliation reapplies committed target after stale native disable");
        check(oldDismiss.mTgkGameInfo.getSelectedCaseData().ID == 29,
                "late OEM dismiss writer cannot leave an old selected model for post-execute");
        staleWriter.service.reload();
        check(staleWriter.service.mInputManagerProxy.points.get(137)[0] == 305,
                "reload after old OEM writer keeps target actual coordinate mapping");

        new cn.nubia.tgk.TgkMapView().initTgkMapView("game.one");settle();
        TgkService.DismissViewAsyncTask editorChoice = new TgkService.DismissViewAsyncTask(staleWriter.service);
        editorChoice.setTgkGameInfo(oldModel);editorChoice.execute();settle();
        check(staleWriter.context.resolver.selected("game.one") == 11,
                "opening OEM editor releases switch lease and permits user's next native selection");

        Fixture writerSuperseded = new Fixture(false);
        cn.nubia.tgk.data.TgkGameInfo writerSnapshot = writerSuperseded.service.mTgkGameInfo;
        writerSuperseded.click();settle();writerSuperseded.service.mInputManagerProxy.appliedIds.clear();
        candidates(ref(0, 11), ref(0, 29), ref(0, 97));
        TgkShowCaseListViewAdapter writerMenu = menu(writerSuperseded);
        TgkService.DismissViewAsyncTask oldWriter = new TgkService.DismissViewAsyncTask(writerSuperseded.service);
        oldWriter.setTgkGameInfo(writerSnapshot);oldWriter.execute();
        android.os.AsyncTask.SERIAL_EXECUTOR.submit(() -> {}).get(4, TimeUnit.SECONDS);
        writerMenu.setSelected(writerMenu.getList(), 2, true);settle();
        writerSuperseded.selected(97, "C", 705, 5);
        check(writerSuperseded.service.mInputManagerProxy.appliedIds.stream().allMatch(id -> id == 97),
                "new C request invalidates old writer's queued B reconciliation");

        Fixture writerCancelled = new Fixture(false);
        cn.nubia.tgk.data.TgkGameInfo cancelSnapshot = writerCancelled.service.mTgkGameInfo;
        writerCancelled.click();settle();writerCancelled.service.mInputManagerProxy.appliedIds.clear();
        TgkService.DismissViewAsyncTask cancelledWriter = new TgkService.DismissViewAsyncTask(writerCancelled.service);
        cancelledWriter.setTgkGameInfo(cancelSnapshot);cancelledWriter.execute();
        android.os.AsyncTask.SERIAL_EXECUTOR.submit(() -> {}).get(4, TimeUnit.SECONDS);
        FeatureSettings.publish(false);settle();FeatureSettings.publish(true);
        check(writerCancelled.service.mInputManagerProxy.appliedIds.isEmpty(),
                "feature cancel invalidates an old writer's queued mapping reconciliation");

        Fixture duplicates = new Fixture(false);
        duplicates.context.resolver.database.get("0:97").state |= 1;
        duplicates.click();settle();duplicates.selected(29, "B", 305, 2);
        check((duplicates.context.resolver.database.get("0:97").state & 1) == 0,
                "transaction removes all stale selected flags across the app's schemes");
        check(HookTelemetry.events.stream().anyMatch(s -> s.contains("INPUT_THROW")),
                "failure diagnostics retain the setter failure stage");
        System.out.println("PASS production shoulder switch/store integration: " + checks
                + " checks (controlled DB/input boundaries; not on-device proof)");
    }
}
