package ls.augment.com;

import android.app.Instrumentation;
import android.content.*;
import android.net.Uri;
import android.os.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.json.*;

/** Exercise private text ClipData and the live provider boundary for retired external handoffs. */
final class AtomicWorkbenchSourceDragDeviceCases {
    private static void require(boolean value, String name) { if (!value) throw new AssertionError(name); }
    private static final Uri WORKBENCH = Uri.parse("content://ls.augment.com.workbench");
    private static void refused(Context context, String method, Bundle request) {
        Bundle response = context.getContentResolver().call(WORKBENCH, method, null, request);
        require(response != null && response.size() == 1 && Boolean.FALSE.equals(response.get("accepted")),
                method + "_must_refuse_without_issuing_a_ticket");
    }

    static JSONObject run(Instrumentation test, Bundle args) throws Exception {
        Context context = test.getTargetContext();
        JSONArray cases = new JSONArray();
        String original = "  Duo native drag fixture\n";
        // Exercise the real encoder still used by private text drags with Android ClipData and Parcel.
        var snapshot = AtomicWorkbenchTransfer.class.getDeclaredMethod("textSnapshot", String.class);
        var encoder = AtomicWorkbenchTransfer.class.getDeclaredMethod("dragClip", AtomicWorkbenchPendingPayload.class, String.class);
        snapshot.setAccessible(true);
        encoder.setAccessible(true);
        AtomicWorkbenchPendingPayload payload = (AtomicWorkbenchPendingPayload) snapshot.invoke(null, original);
        ClipData text = (ClipData) encoder.invoke(null, payload, "local-gesture");
        Parcel parcel = Parcel.obtain();
        try {
            text.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            ClipData copy = ClipData.CREATOR.createFromParcel(parcel);
            require(copy.getItemCount() == 1 && original.contentEquals(copy.getItemAt(0).getText())
                    && copy.getItemAt(0).getIntent() == null && copy.getItemAt(0).getUri() == null,
                    "preserve_text_only");
            PersistableBundle extras = copy.getDescription().getExtras();
            require(extras.size() == 3 && "local-gesture".equals(extras.getString("duo_drag_nonce"))
                    && payload.id.equals(extras.getString("duo_drag_id"))
                    && payload.revision == extras.getLong("duo_drag_revision", -1), "private_gesture_identity");
        } finally { parcel.recycle(); }
        for (String invalid : new String[]{"", "x".repeat(32769)}) {
            try { snapshot.invoke(null, invalid); throw new AssertionError("invalid_text_snapshot"); }
            catch (java.lang.reflect.InvocationTargetException expected) {
                require(expected.getCause() instanceof java.io.IOException, "reject_invalid_text");
            }
        }
        cases.put("private_text_identity_preserved_empty_and_oversize_rejected");

        // A source cancellation still owns exactly one completion. Keep this check on the
        // live transfer job without opening, copying or granting any fixture URI.
        AtomicInteger settled = new AtomicInteger();
        AtomicWorkbenchTransferStage.Job job = new AtomicWorkbenchTransferStage.Job(context,
                new Intent(Intent.ACTION_SEND), false, (value, failure) -> {
                    require(value == null && "fixture canceled".equals(failure), "unexpected_cancel_result");
                    settled.incrementAndGet();
                });
        job.cancel("fixture canceled");
        job.cancel("second cancel");
        require(!job.finish(null, "late completion") && settled.get() == 1, "source_must_complete_once");
        try { job.check(); throw new AssertionError("cancelled_source_reopened"); }
        catch (java.io.IOException expected) { }
        cases.put("cancel_completes_once_and_rejects_late_source");

        // Old hooked processes may send v1 IPC until they restart. Even a correctly shaped
        // offer must be rejected before opening data, invoking a callback or issuing a lease.
        AtomicInteger completions = new AtomicInteger();
        Binder callback = new Binder() {
            @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
                completions.incrementAndGet(); return true;
            }
        };
        Bundle request = new Bundle();
        request.putInt("version", 1);
        request.putLong("down", SystemClock.uptimeMillis());
        for (int display : new int[]{0, 42}) {
            request.putInt("display", display);
            refused(context, "source_drag_probe", request);
        }
        request.putString("ticket", "0123456789abcdef0123456789abcdef");
        request.putBinder("completion", callback);
        ClipData photo = new ClipData("photo", new String[]{"image/png"}, new ClipData.Item(Uri.parse("content://fixture/photo")));
        PersistableBundle hints = new PersistableBundle();
        hints.putBoolean("isFromGallery", true); hints.putString("third_app_drag_drop_flag", "true"); hints.putString("untrusted", "discard");
        photo.getDescription().setExtras(hints);
        ClipData duplicate = new ClipData(photo); duplicate.addItem(photo.getItemAt(0));
        ClipData many = ClipData.newPlainText("many","1");
        for (int i=1; i<18; i++) many.addItem(new ClipData.Item("1"));
        java.util.List<ClipData> external = new java.util.ArrayList<>(java.util.List.of(
                text, photo, duplicate, many, ClipData.newIntent("nested", new Intent(Intent.ACTION_VIEW)),
                ClipData.newPlainText("oversize","x".repeat(32769)), ClipData.newPlainText("empty","")));
        for (String uri : new String[]{"file:///sdcard/a.png","https://example.com/a.png","content://10@fixture/a"})
            external.add(new ClipData("invalid",new String[]{"image/png"},new ClipData.Item(Uri.parse(uri))));
        for (ClipData clip : external) {
            request.putParcelable("clip", clip);
            refused(context, "source_drag_offer", request);
            refused(context, "source_drag_offer", request);
        }
        test.waitForIdleSync();
        require(completions.get() == 0, "retired_handoff_must_never_schedule_a_callback");
        cases.put("external_probes_payloads_and_replays_denied_without_callbacks");
        ModuleScopeService.Snapshot scope = ModuleScopeService.read(context);
        long scopeDeadline = SystemClock.uptimeMillis() + 5000;
        while (!scope.connected && SystemClock.uptimeMillis() < scopeDeadline) {
            SystemClock.sleep(100); scope = ModuleScopeService.read(context);
        }
        JSONObject report=new JSONObject().put("success",true).put("thirdPartySourceVerified",false).put("cases",cases)
                .put("scopeConnected",scope.connected)
                .put("galleryScoped",scope.connected ? scope.actual.contains("com.android.gallery3d") : JSONObject.NULL)
                .put("qqScoped",scope.connected ? scope.actual.contains("com.tencent.mobileqq") : JSONObject.NULL);
        if ("true".equals(args.getString("request_scope"))) {
            if (!scope.connected) throw new AssertionError("scope_service_unavailable");
            CountDownLatch answer = new CountDownLatch(1); AtomicBoolean approved = new AtomicBoolean();
            java.util.List<String> requested=java.util.List.of("com.android.gallery3d");
            require(scope.descriptor != null && scope.descriptor.recommended.containsAll(requested) && !scope.descriptor.recommended.contains("com.tencent.mobileqq"), "only_declared_source_scopes");
            ModuleScopeService.service().requestScope(requested,new io.github.libxposed.service.XposedService.OnScopeEventListener() {
                @Override public void onScopeRequestApproved(java.util.List<String> values) {
                    ModuleScopeService.Snapshot after=ModuleScopeService.read(context); approved.set(after.actual.containsAll(requested)); answer.countDown();
                }
                @Override public void onScopeRequestFailed(String message) { answer.countDown(); }
            });
            report.put("scopeRequestCompleted",answer.await(45,TimeUnit.SECONDS)).put("scopeApproved",approved.get());
        }
        return report;
    }
}
