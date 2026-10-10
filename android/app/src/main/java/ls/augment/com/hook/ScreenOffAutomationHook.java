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
import android.os.UserManager;

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
        int startAttempts,runAttempts,queryAttempts,bridgeAttempts;
        long stateSequence,lastBridgeErrorAt;
        final String ownerSession=Process.myPid()+":"+Process.getStartElapsedRealtime();
        String bridge="FAILED",bridgeError="configuration_not_read",lastBridgeError="",runtime="unknown";
        String requestId="",screenEpoch="",transportError="";
        boolean pendingQuery;
        final Runnable retry=()->refreshAndRun("retry");
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
                context.getContentResolver().registerContentObserver(
                        Uri.parse(PROVIDER + "/config"), false, observer);
                startAttempts=0;
                refreshAndRun("system_attached");
            } catch (Throwable error) {
                bridgeFailed("LISTENER_FAILED","listener_failed:"+error);
                try { context.unregisterReceiver(receiver); } catch (Throwable ignored) { }
                try { context.getContentResolver().unregisterContentObserver(observer); }
                catch (Throwable ignored) { }
                handler.postDelayed(this::start,Math.min(30000L,1000L<<Math.min(5,startAttempts++)));
            }
        }

        void refreshAndRun(String event) {
            boolean dispatched=false;
            try {
                UserManager users=context.getSystemService(UserManager.class);
                if(users!=null&&!users.isUserUnlocked()) {
                    // The credential-protected Provider is deliberately unavailable
                    // before unlock. Wait without inventing an execution failure.
                    bridge="WAITING_FOR_UNLOCK";bridgeError="";runtime="unknown";
                    publishOwnerState();scheduleBridgeRetry();return;
                }
                // Read the authoritative snapshot here; never block SystemUI or the
                // system main thread on provider access, Root commands or PackageManager.
                Bundle reply = context.getContentResolver().call(
                        PROVIDER, "snapshot", null, null);
                ConfigSnapshot snapshot=verifiedSnapshot(reply);
                if(snapshot==null)throw new IllegalArgumentException("invalid_or_incomplete_configuration_snapshot");
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
                else {bridgeFailed("FAILED","snapshot_read_failed:"+error);
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
            if(reply==null||!reply.getBoolean("ok",false))return null;
            ConfigSnapshot snapshot=ConfigSnapshot.parse(reply.getString("snapshot"));
            return snapshot!=null&&snapshot.schemaVersion==reply.getInt("schemaVersion",-1)
                    &&snapshot.revision==reply.getLong("revision",-1)
                    &&snapshot.updatedAt==reply.getLong("updatedAt",-1)
                    &&snapshot.scope.equals(reply.getString("scope",""))
                    &&snapshot.checksum.equals(reply.getString("checksum",""))?snapshot:null;
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
