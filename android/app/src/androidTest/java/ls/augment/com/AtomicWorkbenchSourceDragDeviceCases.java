package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.*;
import android.net.Uri;
import android.os.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.json.*;

/** Native Android parcel/payload and one-use handoff tests; not evidence of third-party UI dragging. */
final class AtomicWorkbenchSourceDragDeviceCases {
    private static void require(boolean value, String name) { if (!value) throw new AssertionError(name); }
    private static void reject(ClipData clip) {
        try { AtomicWorkbenchSourceDragData.read(clip); throw new AssertionError("accepted_invalid_source"); }
        catch (IllegalArgumentException expected) { }
    }
    static JSONObject run(Instrumentation test, Bundle args) throws Exception {
        Context context = test.getTargetContext(); JSONArray cases = new JSONArray();
        ClipData text = ClipData.newPlainText("original", "Duo native drag fixture");
        require("Duo native drag fixture".contentEquals(AtomicWorkbenchSourceDragData.read(text).input.getCharSequenceExtra(Intent.EXTRA_TEXT)), "text_preserved");
        cases.put("real_text_preserved");
        ClipData photo = new ClipData("file drag", new String[]{"image/png"}, new ClipData.Item(Uri.parse("content://fixture/photo")));
        PersistableBundle hints = new PersistableBundle(); hints.putBoolean("isFromGallery", true); hints.putString("third_app_drag_drop_flag", "true"); hints.putString("untrusted", "discard");
        photo.getDescription().setExtras(hints);
        AtomicWorkbenchSourceDragData data = AtomicWorkbenchSourceDragData.read(photo);
        require(data.uris.size() == 1 && data.decoration.size() == 2 && data.decoration.getBoolean("isFromGallery"), "uri_and_bounded_hints");
        require(data.clip.getDescription().getExtras().size()==2 && data.clip.getItemAt(0).getIntent()==null
                && data.clip.getItemAt(0).getHtmlText()==null && data.clip.getItemAt(0).getUri().equals(data.uris.get(0)), "bounded_transport");
        cases.put("original_content_uri_and_known_hints_only");
        for (String uri : new String[]{"file:///sdcard/a.png", "https://example.com/a.png", "content://10@fixture/a"}) {
            reject(new ClipData("invalid", new String[]{"image/png"}, new ClipData.Item(Uri.parse(uri))));
        }
        reject(ClipData.newIntent("nested", new Intent(Intent.ACTION_VIEW)));
        reject(ClipData.newPlainText("oversize", "x".repeat(32769)));
        reject(ClipData.newPlainText("empty", ""));
        ClipData duplicate = new ClipData(photo); duplicate.addItem(photo.getItemAt(0)); reject(duplicate);
        ClipData excessive = ClipData.newPlainText("many", "1"); for (int i=1;i<18;i++) excessive.addItem(new ClipData.Item("1")); reject(excessive);
        cases.put("reject_path_url_cross_user_nested_empty_duplicate_oversize");
        Bundle request = new Bundle(); request.putInt("version", 1); request.putInt("display", 1); request.putLong("down", SystemClock.uptimeMillis());
        require(AtomicWorkbenchSourceDragBridge.call(AtomicWorkbenchSourceDragData.PROBE, null, request).isEmpty(), "same_uid_cannot_impersonate_source");
        cases.put("same_uid_bridge_denied");

        AtomicInteger completed = new AtomicInteger(); AtomicBoolean callbackStarted = new AtomicBoolean(true), callbackFallback = new AtomicBoolean(true);
        CountDownLatch completion = new CountDownLatch(1);
        Binder callback = new Binder() {
            @Override protected boolean onTransact(int code, Parcel parcel, Parcel reply, int flags) {
                parcel.enforceInterface(AtomicWorkbenchSourceDragData.CALLBACK); callbackStarted.set(parcel.readBoolean()); callbackFallback.set(parcel.readBoolean()); parcel.enforceNoDataAvail();
                completed.incrementAndGet(); completion.countDown(); return true;
            }
        };
        AtomicReference<Throwable> failed = new AtomicReference<>();
        test.runOnMainSync(() -> {
            try {
                Activity fixture = new Activity() { @Override public Context getApplicationContext() { return context; } };
                AtomicBoolean valid = new AtomicBoolean(true), preparing = new AtomicBoolean();
                AtomicWorkbenchAppSourceDrag.Capture capture = new AtomicWorkbenchAppSourceDrag.Capture(10001, 42, 7, 0, 1, 200, 1, 1, "fixture", null, null);
                AtomicWorkbenchAppSourceDrag controller = new AtomicWorkbenchAppSourceDrag(fixture, null, new AtomicWorkbenchAppSourceDrag.Host() {
                    public AtomicWorkbenchAppSourceDrag.Capture capture(int uid,int display,long down) { return valid.get() && uid==10001 && display==42 && down==200 ? capture : null; }
                    public boolean current(AtomicWorkbenchAppSourceDrag.Capture value) { return value == capture && valid.get(); }
                    public void preparing(boolean value) { preparing.set(value); }
                });
                require(controller.probe(10001,42,200).isEmpty(), "background_probe"); controller.foreground(true);
                require(controller.probe(10002,42,200).isEmpty() && controller.probe(10001,43,200).isEmpty() && controller.probe(10001,42,201).isEmpty(), "gesture_identity");
                String ticket = controller.probe(10001,42,200).getString("ticket"); require(ticket != null, "valid_probe");
                require(!controller.offer(10002,ticket,text,callback) && !controller.offer(10001,"invalid",text,callback), "offer_identity");
                require(controller.offer(10001,ticket,text,callback) && preparing.get(), "first_offer");
                require(!controller.offer(10001,ticket,text,callback), "replayed_offer");
                valid.set(false); controller.cancel(); controller.cancel(); controller.foreground(false);
                require(!preparing.get(), "cancel_restores_host");
            } catch(Throwable failure) { failed.set(failure); }
        });
        if (failed.get()!=null) throw new AssertionError(failed.get());
        require(completion.await(5, TimeUnit.SECONDS), "cancel_completion");
        long deadline=SystemClock.uptimeMillis()+5000; while(AtomicWorkbenchTransferStage.busy()&&SystemClock.uptimeMillis()<deadline) SystemClock.sleep(20);
        test.waitForIdleSync();
        require(completed.get()==1 && !callbackStarted.get() && !callbackFallback.get(), "cancel_once_no_late_native_drag");
        cases.put("gesture_identity_one_use_offer_cancel_once_no_native_fallback");
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
            java.util.List<String> requested=java.util.List.of("com.android.gallery3d", "com.tencent.mobileqq");
            require(scope.descriptor != null && scope.descriptor.recommended.containsAll(requested), "only_declared_source_scopes");
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
