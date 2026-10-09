package ls.augment.com.hook;

import android.app.ActivityManager;
import android.content.BroadcastReceiver;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.PersistableBundle;
import android.os.Process;
import android.os.SystemClock;
import android.os.UserHandle;
import android.provider.Telephony;
import android.telephony.SmsMessage;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import ls.augment.com.SmsVerificationCode;
import ls.augment.com.SystemOptions;

/** Receives new SMS in system_server; never queries the SMS store or intercepts delivery. */
final class SmsCodeClipboardHook {
    private static Controller controller;
    private SmsCodeClipboardHook() { }

    static synchronized void attach(Context context) {
        if (context == null || controller != null || Process.myUid() != Process.SYSTEM_UID) return;
        controller = new Controller(context);
        controller.handler.post(controller::start);
    }

    private static final class Controller extends BroadcastReceiver {
        final Context context;
        final Handler handler;
        int attempts;
        byte[] lastDigest;
        long lastCopied;
        int lastUser = -1;

        Controller(Context context) {
            this.context = context;
            HandlerThread thread = new HandlerThread("LSA-SmsClipboard");
            thread.start();
            handler = new Handler(thread.getLooper());
        }

        void start() {
            try {
                // ALL receives the per-user telephony broadcast. Sender must hold the
                // signature permission; SMS_RECEIVED itself is also a protected action.
                UserHandle all = (UserHandle) UserHandle.class.getField("ALL").get(null);
                Context.class.getMethod("registerReceiverAsUser", BroadcastReceiver.class,
                        UserHandle.class, IntentFilter.class, String.class, Handler.class, int.class)
                        .invoke(context, this, all, new IntentFilter(Telephony.Sms.Intents.SMS_RECEIVED_ACTION),
                                "android.permission.BROADCAST_SMS", handler, Context.RECEIVER_EXPORTED);
            } catch (ReflectiveOperationException | RuntimeException error) {
                if (++attempts < 30) handler.postDelayed(this::start, 2_000L);
                // Intentionally omit exception messages, PDUs, sender and message content.
                if (attempts == 30) android.util.Log.w("LS_Augment", "SMS clipboard listener unavailable");
            }
        }

        @Override public void onReceive(Context ignored, Intent intent) {
            if (intent == null || !Telephony.Sms.Intents.SMS_RECEIVED_ACTION.equals(intent.getAction())
                    || !FeatureSettings.enabled(context, SystemOptions.SMS_CODE_CLIPBOARD, false)) return;
            try {
                int user = (Integer) BroadcastReceiver.class.getMethod("getSendingUserId").invoke(this);
                int current = (Integer) ActivityManager.class.getMethod("getCurrentUser").invoke(null);
                // No fallback to user 0: never copy another user's broadcast into the
                // foreground user's clipboard, including when user lookup is unavailable.
                if (user < 0 || user != current) return;
                SmsMessage[] parts = Telephony.Sms.Intents.getMessagesFromIntent(intent);
                if (parts == null || parts.length == 0 || parts.length > 64) return;
                StringBuilder body = new StringBuilder();
                String sender = parts[0] == null ? null : parts[0].getOriginatingAddress();
                long timestamp = parts[0] == null ? 0 : parts[0].getTimestampMillis();
                for (SmsMessage part : parts) {
                    if (part == null || part.getMessageBody() == null
                            || !java.util.Objects.equals(sender, part.getOriginatingAddress())) return;
                    body.append(part.getMessageBody());
                    if (body.length() > 8192) return;
                }
                String code = SmsVerificationCode.extract(body.toString());
                if (code == null) return;
                byte[] digest = MessageDigest.getInstance("SHA-256").digest(
                        (sender + "\n" + timestamp + "\n" + body).getBytes(StandardCharsets.UTF_8));
                long now = SystemClock.elapsedRealtime();
                if (lastUser == user && now - lastCopied < 30_000L && Arrays.equals(digest, lastDigest)) return;
                UserHandle handle = (UserHandle) UserHandle.class.getMethod("of", int.class).invoke(null, user);
                Context userContext = (Context) Context.class.getMethod("createContextAsUser", UserHandle.class, int.class)
                        .invoke(context, handle, 0);
                ClipboardManager clipboard = userContext.getSystemService(ClipboardManager.class);
                if (clipboard == null) return;
                ClipData clip = ClipData.newPlainText("短信验证码", code);
                PersistableBundle extras = new PersistableBundle();
                extras.putBoolean(ClipDescription.EXTRA_IS_SENSITIVE, true);
                clip.getDescription().setExtras(extras);
                clipboard.setPrimaryClip(clip);
                lastDigest = digest;
                lastUser = user;
                lastCopied = now;
            } catch (Exception error) {
                // Clipboard/ROM incompatibility must not interrupt SMS delivery or log secrets.
                android.util.Log.w("LS_Augment", "SMS clipboard processing unavailable");
            }
        }
    }
}
