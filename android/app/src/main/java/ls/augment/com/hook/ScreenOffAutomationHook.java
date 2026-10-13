package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.PowerManager;
import android.os.Process;
import android.os.SystemClock;

import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ScreenAutomationPolicy;
import ls.augment.com.AutomationDiagnosticState;
import ls.augment.com.ConfigSnapshot;

/** One event owner in system_server; all Root work remains in the shared hide queue. */
final class ScreenOffAutomationHook {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static volatile Controller controller;

    private ScreenOffAutomationHook() { }

    static synchronized void attach(Context context) {
        if (controller != null || context == null || Process.myUid() != Process.SYSTEM_UID) return;
        Controller next = new Controller(context);
        controller = next;
        next.handler.post(next::start);
    }

    private static final class Controller {
        final Context context;
        final HandlerThread thread = new HandlerThread("LSA-ScreenAutomation");
        final Handler handler;
        final ScreenAutomationPolicy.Epoch epoch = new ScreenAutomationPolicy.Epoch();
        int runAttempts,queryAttempts,bridgeAttempts;
        boolean receiverRegistered,observerRegistered,listening;
        final ConfigBridgeReadiness readiness=new ConfigBridgeReadiness();
        long stateSequence,lastBridgeErrorAt;
        final String ownerSession=Process.myPid()+":"+Process.getStartElapsedRealtime();
        String bridge="FAILED",bridgeError="configuration_not_read",lastBridgeError="",runtime="unknown";
        String requestId="",screenEpoch="",transportError="";
        boolean pendingQuery;
        final Runnable retry=()->{if(listening)refreshAndRun("retry");else start();};
        final BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override public void onReceive(Context ignored, Intent intent) {
                if (Intent.ACTION_SCREEN_ON.equals(intent.getAction())) {
                    epoch.screenOn();
                    handler.removeCallbacks(retry);runAttempts=0;queryAttempts=0;
                    requestId="";screenEpoch="";pendingQuery=false;transportError="";
                }
                refreshAndRun(intent.getAction());
            }
        };
        final ContentObserver observer;

        Controller(Context context) {
            this.context = context;
            thread.start();
            handler = new Handler(thread.getLooper());
            observer = new ContentObserver(handler) {
                @Override public void onChange(boolean selfChange) {
                    refreshAndRun("config_changed");
                }
            };
        }

        void start() {
            if(listening){refreshAndRun("system_attached");return;}
            if(!bridgeReady())return;
            if((receiverRegistered||observerRegistered)&&!cleanupListeners()){scheduleBridgeRetry();return;}
            try {
                IntentFilter filter = new IntentFilter();
                filter.addAction(Intent.ACTION_SCREEN_OFF);
                filter.addAction(Intent.ACTION_SCREEN_ON);
                filter.addAction(Intent.ACTION_USER_UNLOCKED);
                filter.addAction(Intent.ACTION_BOOT_COMPLETED);
                if (Build.VERSION.SDK_INT >= 33) {
                    context.registerReceiver(receiver, filter, null, handler,
                            Context.RECEIVER_NOT_EXPORTED);
                } else context.registerReceiver(receiver, filter, null, handler);
                receiverRegistered=true;
                // If registration throws after touching its transport, cleanup
                // must still unregister this exact observer before another try.
                observerRegistered=true;
                context.getContentResolver().registerContentObserver(
                        Uri.parse(PROVIDER + "/config"), false, observer);
                listening=true;
                refreshAndRun("system_attached");
            } catch (Throwable error) {
                bridgeFailed("LISTENER_FAILED","listener_failed:"+error);
                cleanupListeners();scheduleBridgeRetry();
            }
        }

        boolean cleanupListeners(){
            listening=false;
            String failure="";
            if(receiverRegistered){try{context.unregisterReceiver(receiver);receiverRegistered=false;}catch(Throwable error){failure="receiver:"+error;}}
            if(observerRegistered){try{context.getContentResolver().unregisterContentObserver(observer);observerRegistered=false;}
                catch(Throwable error){failure+=(failure.isEmpty()?"":";")+"observer:"+error;}}
            if(!failure.isEmpty()){bridgeFailed("LISTENER_FAILED","listener_cleanup_failed:"+failure);return false;}
            return true;
        }

        boolean bridgeReady(){
            ConfigBridgeReadiness.Result status=readiness.check(context);
            report("ls_augment_automation_bridge_probe_error",status.probeError);
            if(status.ready())return true;
            if(status.waiting()){
                bridge=status.state;bridgeError="";runtime="unknown";publishOwnerState();
            }else bridgeFailed("FAILED",status.error);
            scheduleBridgeRetry();return false;
        }

        void refreshAndRun(String event) {
            if(!listening){start();return;}
            boolean dispatched=false;
            try {
                if(!bridgeReady())return;
                // Read the authoritative snapshot here; never block SystemUI or the
                // system main thread on provider access, Root commands or PackageManager.
                Bundle reply = context.getContentResolver().call(
                        PROVIDER, "snapshot", null, null);
                SnapshotCheck checked=inspectSnapshot(reply);
                ConfigSnapshot snapshot=checked.snapshot;
                if(snapshot==null){
                    bridgeFailed("FAILED","snapshot_read_failed:invalid_or_incomplete_configuration_snapshot:"+checked.error);
                    scheduleBridgeRetry();return;
                }
                bridge="READY";bridgeError="";bridgeAttempts=0;handler.removeCallbacks(retry);
                boolean enabled = ConfigSchema.truthy(snapshot.get(ConfigSchema.HIDE_MASTER))
                        && ConfigSchema.truthy(snapshot.get(ConfigSchema.AUTOMATION_ENABLED));
                PowerManager power = context.getSystemService(PowerManager.class);
                boolean off = power != null && !power.isInteractive()
                        && !Intent.ACTION_SCREEN_ON.equals(event);
                runtime=!enabled?"disabled":!off?"waiting_screen_off":pendingQuery?"unknown":"ready";
                publishOwnerState(); // A valid disabled snapshot recovers only the bridge.
                if(!enabled||!off){handler.removeCallbacks(retry);runAttempts=0;
                    epoch.claim(false,off);
                    if(!off){requestId="";screenEpoch="";pendingQuery=false;transportError="";}
                }
                report("ls_augment_automation_runtime", "version=" + BuildConfig.VERSION_NAME
                        + ";pid=" + Process.myPid() + ";listener=system_server;enabled=" + enabled
                        + ";time=" + System.currentTimeMillis());
                if(!enabled||!off)return;
                if(pendingQuery){queryExistingRequest();return;}
                if (!epoch.claim(enabled, off)) return;
                if(requestId.isEmpty())requestId=Process.myPid()+":"+SystemClock.elapsedRealtimeNanos();
                if(screenEpoch.isEmpty())screenEpoch=requestId;
                Bundle extras = new Bundle();
                extras.putString("event", event);
                extras.putString("requestId",requestId);
                extras.putString("screenEpoch",screenEpoch);
                extras.putInt("protocol",AutomationDiagnosticState.PROTOCOL);
                runtime="dispatched";publishOwnerState();
                dispatched=true; // Any failure after dispatch is uncertain; only query this ID.
                Bundle result = context.getContentResolver().call(
                        PROVIDER, "automation_execute", null, extras);
                acceptExecutionReply(result);
            } catch (Throwable error) {
                if(dispatched)executionUncertain("execution_reply_unavailable:"+error);
                else {bridgeFailed("FAILED","snapshot_read_failed:"+ConfigBridgeReadiness.callFailure(error));
                    // Configuration reads are idempotent. Keep a bounded backoff
                    // across long boot/update windows, separate from operation retries.
                    scheduleBridgeRetry();}
            }
        }

        void scheduleBridgeRetry() {
            long delay=Math.min(30_000L,1000L<<Math.min(5,bridgeAttempts));
            if(bridgeAttempts<Integer.MAX_VALUE)bridgeAttempts++;
            handler.removeCallbacks(retry);handler.postDelayed(retry,delay);
        }

        static ConfigSnapshot verifiedSnapshot(Bundle reply) {
            return inspectSnapshot(reply).snapshot;
        }
        static final class SnapshotCheck {
            final ConfigSnapshot snapshot;final String error;
            SnapshotCheck(ConfigSnapshot snapshot,String error){this.snapshot=snapshot;this.error=error;}
        }
        static SnapshotCheck inspectSnapshot(Bundle reply) {
            if(reply==null)return new SnapshotCheck(null,"reply_missing");
            if(!reply.getBoolean("ok",false))return new SnapshotCheck(null,"reply_not_accepted");
            String payload=reply.getString("snapshot");
            String size=";chars="+(payload==null?-1:payload.length());
            ConfigSnapshot.ParseResult parsed=ConfigSnapshot.parseDetailed(payload);
            if(parsed.snapshot==null)return new SnapshotCheck(null,parsed.error+size);
            ConfigSnapshot snapshot=parsed.snapshot;
            for(String field:new String[]{"schemaVersion","revision","updatedAt","scope","checksum"})
                if(!reply.containsKey(field))return new SnapshotCheck(null,"metadata_missing;field="+field+size);
            if(snapshot.schemaVersion!=reply.getInt("schemaVersion",-1))
                return new SnapshotCheck(null,"schema_metadata_mismatch;actual="+reply.getInt("schemaVersion",-1)+";expected="+snapshot.schemaVersion+size);
            if(snapshot.revision!=reply.getLong("revision",-1))
                return new SnapshotCheck(null,"revision_metadata_mismatch;actual="+reply.getLong("revision",-1)+";expected="+snapshot.revision+size);
            if(snapshot.updatedAt!=reply.getLong("updatedAt",-1))
                return new SnapshotCheck(null,"updated_at_metadata_mismatch;actual="+reply.getLong("updatedAt",-1)+";expected="+snapshot.updatedAt+size);
            if(!snapshot.scope.equals(reply.getString("scope","")))return new SnapshotCheck(null,"scope_metadata_mismatch"+size);
            if(!snapshot.checksum.equals(reply.getString("checksum","")))return new SnapshotCheck(null,"checksum_metadata_mismatch"+size);
            return new SnapshotCheck(snapshot,"");
        }

        void bridgeFailed(String state,String message) {
            bridge=state;bridgeError=message;lastBridgeError=message;lastBridgeErrorAt=System.currentTimeMillis();
            publishOwnerState();
        }
        void queryExistingRequest() {
            try {
                Bundle extras=new Bundle();extras.putString("requestId",requestId);
                extras.putInt("protocol",AutomationDiagnosticState.PROTOCOL);
                acceptExecutionReply(context.getContentResolver().call(PROVIDER,"automation_query",null,extras));
            }catch(Throwable error){executionUncertain("execution_query_unavailable:"+error);}
        }
        void acceptExecutionReply(Bundle reply) {
            if(reply!=null&&reply.getInt("protocol",-1)==AutomationDiagnosticState.PROTOCOL
                    &&requestId.equals(reply.getString("requestId",""))
                    &&AutomationDiagnosticState.terminal(reply.getString("outcome",""))) {
                String outcome=reply.getString("outcome","");
                pendingQuery=false;transportError="";queryAttempts=0;handler.removeCallbacks(retry);
                if("SUCCEEDED".equals(outcome)){runtime="handled";runAttempts=0;}
                else {
                    // Only a matching, explicit non-success result permits the bounded retry.
                    if(runAttempts<6) {
                        epoch.failed();requestId="";runtime="ready";
                        handler.postDelayed(retry,Math.min(30000L,1000L<<runAttempts++));
                    }else runtime="handled";
                }
                publishOwnerState();
                // Only the provider records real execution success/failure.
            }else executionUncertain("execution_result_unknown");
        }
        void executionUncertain(String message) {
            pendingQuery=true;transportError=message;runtime="unknown";publishOwnerState();
            handler.removeCallbacks(retry);
            if(queryAttempts++<6)handler.postDelayed(retry,5000L);
        }
        void publishOwnerState() {
            AutomationDiagnosticState.Update update=new AutomationDiagnosticState.Update(ownerSession,++stateSequence,
                    System.currentTimeMillis(),bridge,bridgeError,lastBridgeError,lastBridgeErrorAt,runtime,requestId,transportError);
            report(AutomationDiagnosticState.OWNER_KEY,update.encode());
        }

        void report(String key, String value) {
            FeatureSettings.diagnostic(context, key, value);
        }
    }
}
