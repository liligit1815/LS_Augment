package ls.augment.com;

import android.app.Activity;
import android.app.BroadcastOptions;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Display;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/** This launchable sample exists only in the developer test APK. */
public final class AtomicWorkbenchFixtureActivity extends Activity {
    static final int PROTOCOL = 5;
    static final String TARGET_PACKAGE = "ls.augment.com";
    static final String ACTION_STATE = "ls.augment.com.test.atomic_workbench.STATE";
    static final String ACTION_QUERY = "ls.augment.com.test.atomic_workbench.QUERY";
    static final String ACTION_FINISH = "ls.augment.com.test.atomic_workbench.FINISH";
    private final Handler main = new Handler(Looper.getMainLooper());
    private EditText editor;
    private Button button;
    private ScrollView scroll;
    private String nonce = "";
    private int clickCount;
    private int targetUid = -1;
    private boolean registered, destroyed;
    private long windowFocusElapsed;
    private int windowFocusGainCount, windowFocusLossCount, editorConnectionCount;
    private boolean editorConnectionNonNull;
    private long windowFocusGainElapsed, windowFocusLossElapsed, editorConnectionElapsed;
    private int touchDownCount, touchUpCount, touchCancelCount;
    private int lastTouchAction = -1;
    private int longClickCount, pointerDownCount, pointerUpCount, maxPointerCount;
    private int touchEventCount;
    private float lastTouchX, lastTouchY;
    private int receivedIntentCount;
    private boolean receivedAllRead, receivedReadFlag, receivedPrivateMetadata;
    private String receivedAction="", receivedMime="", receivedTextHash="";
    private String[] receivedDigests=new String[0];
    private long[] receivedBytes=new long[0];
    private final Runnable ticker = new Runnable() {
        @Override public void run() {
            if (destroyed) return;
            publish(false);
            main.postDelayed(this, 250L);
        }
    };
    private final BroadcastReceiver control = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (intent == null || getSentFromUid() != targetUid || targetUid < 0) return;
            String requestNonce = intent.getStringExtra("nonce");
            if (requestNonce == null || !requestNonce.matches("[0-9a-f]{32}")) return;
            if (ACTION_QUERY.equals(intent.getAction())) {
                nonce = requestNonce;
                main.post(() -> publish(false));
            } else if (ACTION_FINISH.equals(intent.getAction())) {
                nonce = requestNonce;
                finishAndRemoveTask();
            }
        }
    };

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null) {
            clickCount = state.getInt("click_count", 0);
            nonce = state.getString("nonce", "");
        }
        try { targetUid = getPackageManager().getApplicationInfo(TARGET_PACKAGE, 0).uid; }
        catch (android.content.pm.PackageManager.NameNotFoundException ignored) { }
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN
                | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setGravity(Gravity.CENTER);
        content.setPadding(dp(24), dp(24), dp(24), dp(24));
        content.setFocusableInTouchMode(true);
        TextView title = new TextView(this);
        title.setText("原子工作台开发验收");
        title.setTextSize(22);
        content.addView(title, new LinearLayout.LayoutParams(-1, -2));
        editor = new EditText(this) {
            @Override public InputConnection onCreateInputConnection(EditorInfo attributes) {
                InputConnection connection = super.onCreateInputConnection(attributes);
                editorConnectionCount++;
                editorConnectionNonNull = connection != null;
                editorConnectionElapsed = SystemClock.uptimeMillis();
                main.post(() -> publish(false));
                return connection;
            }
        };
        editor.setSingleLine(true);
        editor.setHint("点按此处检验真实输入法");
        editor.setInputType(android.text.InputType.TYPE_CLASS_TEXT);
        if (state != null) editor.setText(state.getString("editor_text", ""));
        editor.setOnFocusChangeListener((view, focused) -> {
            if (focused) editor.post(this::showKeyboard);
            main.post(() -> publish(false));
        });
        content.addView(editor, new LinearLayout.LayoutParams(-1, dp(64)));
        button = new Button(this);
        updateButton();
        button.setOnClickListener(view -> {
            clickCount++;
            updateButton();
            publish(false);
        });
        button.setOnLongClickListener(view -> { longClickCount++; publish(false); return true; });
        content.addView(button, new LinearLayout.LayoutParams(-1, dp(64)));
        scroll = new ScrollView(this);
        TextView scrollText = new TextView(this);
        StringBuilder rows = new StringBuilder();
        for (int index = 1; index <= 40; index++) rows.append("滚动验收行 ").append(index).append('\n');
        scrollText.setText(rows.toString()); scrollText.setTextSize(18); scrollText.setLineSpacing(dp(12), 1f);
        scroll.addView(scrollText, new ScrollView.LayoutParams(-1, -2));
        scroll.setOnScrollChangeListener((view, x, y, oldX, oldY) -> publish(false));
        content.addView(scroll, new LinearLayout.LayoutParams(-1, dp(128)));
        setContentView(content);
        content.requestFocus();
        content.setOnApplyWindowInsetsListener((view, insets) -> {
            main.post(() -> publish(false));
            return insets;
        });
        content.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) ->
                main.post(() -> publish(false)));
        IntentFilter filter = new IntentFilter();
        filter.addAction(ACTION_QUERY);
        filter.addAction(ACTION_FINISH);
        registerReceiver(control, filter, Context.RECEIVER_EXPORTED);
        registered = true;
        main.post(ticker);
        receiveContent(getIntent());
    }

    @Override protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);setIntent(intent);receiveContent(intent);
    }

    private void receiveContent(Intent intent) {
        if(intent==null||!Intent.ACTION_SEND.equals(intent.getAction())&&!Intent.ACTION_SEND_MULTIPLE.equals(intent.getAction()))return;
        final Intent frozen=new Intent(intent);
        Thread reader=new Thread(()->{
            java.util.ArrayList<android.net.Uri> uris=new java.util.ArrayList<>();
            java.util.ArrayList<String> digests=new java.util.ArrayList<>();java.util.ArrayList<Long> lengths=new java.util.ArrayList<>();boolean readable=false;
            String textHash="";
            try{
                android.net.Uri one=frozen.getParcelableExtra(Intent.EXTRA_STREAM,android.net.Uri.class);if(one!=null)uris.add(one);
                java.util.ArrayList<android.net.Uri> many=frozen.getParcelableArrayListExtra(Intent.EXTRA_STREAM,android.net.Uri.class);
                if(many!=null)for(android.net.Uri uri:many)if(!uris.contains(uri))uris.add(uri);
                android.content.ClipData clip=frozen.getClipData();if(clip!=null)for(int i=0;i<clip.getItemCount();i++){
                    android.net.Uri uri=clip.getItemAt(i).getUri();if(uri!=null&&!uris.contains(uri))uris.add(uri);}
                if(uris.size()>16)throw new java.io.IOException();long total=0;
                for(android.net.Uri uri:uris){
                    if(!"content".equals(uri.getScheme())||!"ls.augment.com.workbench.transfer".equals(uri.getAuthority()))throw new java.io.IOException();
                    java.security.MessageDigest digest=java.security.MessageDigest.getInstance("SHA-256");long length=0;
                    try(java.io.InputStream input=getContentResolver().openInputStream(uri)){
                        if(input==null)throw new java.io.IOException();byte[] buffer=new byte[65536];int count;
                        while((count=input.read(buffer))!=-1){if(count==0)throw new java.io.IOException();total+=count;length+=count;if(total>32L*1024*1024)throw new java.io.IOException();digest.update(buffer,0,count);}}
                    digests.add(java.util.HexFormat.of().formatHex(digest.digest()));lengths.add(length);
                }
                CharSequence text=frozen.getCharSequenceExtra(Intent.EXTRA_TEXT);
                if(text!=null&&text.length()<=32768)textHash=java.util.HexFormat.of().formatHex(java.security.MessageDigest.getInstance("SHA-256").digest(text.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8)));
                readable=!uris.isEmpty()||!textHash.isEmpty();
            }catch(Exception unavailable){readable=false;}
            boolean success=readable;String hash=textHash;
            main.post(()->{if(destroyed)return;receivedIntentCount++;receivedAllRead=success;receivedAction=frozen.getAction();receivedMime=frozen.getType();receivedTextHash=hash;
                receivedDigests=digests.toArray(new String[0]);receivedBytes=new long[lengths.size()];for(int i=0;i<lengths.size();i++)receivedBytes[i]=lengths.get(i);
                receivedReadFlag=(frozen.getFlags()&Intent.FLAG_GRANT_READ_URI_PERMISSION)!=0;
                receivedPrivateMetadata=frozen.hasExtra("ls.augment.com.atomic_workbench.exact_target");publish(false);});
        },"DuoReceiveFixture");reader.setDaemon(true);reader.start();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putInt("click_count", clickCount);
        state.putString("nonce", nonce);
        state.putString("editor_text", editor == null ? "" : editor.getText().toString());
        super.onSaveInstanceState(state);
    }

    @Override protected void onResume() {
        super.onResume();
        main.post(() -> publish(false));
    }

    @Override public void onWindowFocusChanged(boolean focused) {
        super.onWindowFocusChanged(focused);
        windowFocusElapsed = SystemClock.uptimeMillis();
        if (focused) { windowFocusGainCount++; windowFocusGainElapsed = windowFocusElapsed; }
        else { windowFocusLossCount++; windowFocusLossElapsed = windowFocusElapsed; }
        main.post(() -> {
            if (focused && editor != null && editor.hasFocus()) showKeyboard();
            publish(false);
        });
    }

    private void showKeyboard() {
        if (destroyed || editor == null || !hasWindowFocus() || !editor.isAttachedToWindow()) return;
        InputMethodManager input = getSystemService(InputMethodManager.class);
        if (input != null) input.showSoftInput(editor, InputMethodManager.SHOW_IMPLICIT);
    }

    private void updateButton() { button.setText("点按次数：" + clickCount); }

    @Override public boolean dispatchTouchEvent(MotionEvent event) {
        touchEventCount++;
        lastTouchAction = event.getActionMasked();
        lastTouchX = event.getX(); lastTouchY = event.getY();
        if (lastTouchAction == MotionEvent.ACTION_DOWN) touchDownCount++;
        if (lastTouchAction == MotionEvent.ACTION_UP) touchUpCount++;
        if (lastTouchAction == MotionEvent.ACTION_CANCEL) touchCancelCount++;
        if (lastTouchAction == MotionEvent.ACTION_POINTER_DOWN) pointerDownCount++;
        if (lastTouchAction == MotionEvent.ACTION_POINTER_UP) pointerUpCount++;
        maxPointerCount = Math.max(maxPointerCount, event.getPointerCount());
        boolean handled = super.dispatchTouchEvent(event);
        main.post(() -> publish(false));
        return handled;
    }

    private void publish(boolean finalState) {
        if (nonce.isEmpty() || editor == null || button == null) return;
        Display display = getDisplay();
        WindowInsets insets = getWindow().getDecorView().getRootWindowInsets();
        Intent state = new Intent(ACTION_STATE).setPackage(TARGET_PACKAGE);
        state.putExtra("fixture_package", getPackageName());
        state.putExtra("fixture_protocol", PROTOCOL);
        state.putExtra("nonce", nonce);
        state.putExtra("display_id", display == null ? -1 : display.getDisplayId());
        state.putExtra("task_id", getTaskId());
        state.putExtra("received_count",receivedIntentCount);state.putExtra("received_all_read",receivedAllRead);
        state.putExtra("received_action",receivedAction);state.putExtra("received_mime",receivedMime);state.putExtra("received_text_hash",receivedTextHash);
        state.putExtra("received_digests",receivedDigests);state.putExtra("received_bytes",receivedBytes);
        state.putExtra("received_read_flag",receivedReadFlag);state.putExtra("received_private_metadata",receivedPrivateMetadata);
        state.putExtra("click_count", clickCount);
        state.putExtra("touch_down_count", touchDownCount);
        state.putExtra("touch_up_count", touchUpCount);
        state.putExtra("touch_cancel_count", touchCancelCount);
        state.putExtra("touch_event_count", touchEventCount);
        state.putExtra("last_touch_action", lastTouchAction);
        state.putExtra("last_touch_x", lastTouchX);
        state.putExtra("last_touch_y", lastTouchY);
        state.putExtra("long_click_count", longClickCount);
        state.putExtra("pointer_down_count", pointerDownCount);
        state.putExtra("pointer_up_count", pointerUpCount);
        state.putExtra("max_pointer_count", maxPointerCount);
        state.putExtra("scroll_offset_y", scroll == null ? 0 : scroll.getScrollY());
        state.putExtra("window_focused", hasWindowFocus());
        state.putExtra("window_focus_elapsed", windowFocusElapsed);
        state.putExtra("window_focus_gain_count", windowFocusGainCount);
        state.putExtra("window_focus_loss_count", windowFocusLossCount);
        state.putExtra("window_focus_gain_elapsed", windowFocusGainElapsed);
        state.putExtra("window_focus_loss_elapsed", windowFocusLossElapsed);
        state.putExtra("editor_connection_count", editorConnectionCount);
        state.putExtra("editor_connection_elapsed", editorConnectionElapsed);
        state.putExtra("editor_connection_non_null", editorConnectionNonNull);
        state.putExtra("geometry_ready", editor.isLaidOut() && button.isLaidOut()
                && editor.getWidth() > 0 && editor.getHeight() > 0 && button.getWidth() > 0 && button.getHeight() > 0);
        state.putExtra("ime_visible", insets != null && insets.isVisible(WindowInsets.Type.ime()));
        state.putExtra("ime_bottom", insets == null ? 0 : insets.getInsets(WindowInsets.Type.ime()).bottom);
        state.putExtra("editor_focused", editor.hasFocus());
        state.putExtra("editor_text", editor.getText().toString());
        state.putExtra("editor_composing_start", android.view.inputmethod.BaseInputConnection.getComposingSpanStart(editor.getText()));
        state.putExtra("editor_composing_end", android.view.inputmethod.BaseInputConnection.getComposingSpanEnd(editor.getText()));
        state.putExtra("editor_selection_start", editor.getSelectionStart());
        state.putExtra("editor_selection_end", editor.getSelectionEnd());
        state.putExtra("destroyed", finalState);
        state.putExtra("at_uptime", SystemClock.uptimeMillis());
        center(state, "button", button);
        center(state, "editor", editor);
        if (scroll != null) center(state, "scroll", scroll);
        sendBroadcast(state, null, BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
    }

    private static void center(Intent state, String prefix, View view) {
        int[] origin = new int[2];
        view.getLocationOnScreen(origin);
        state.putExtra(prefix + "_x", origin[0] + view.getWidth() / 2f);
        state.putExtra(prefix + "_y", origin[1] + view.getHeight() / 2f);
        state.putExtra(prefix + "_width", view.getWidth());
        state.putExtra(prefix + "_height", view.getHeight());
    }

    @Override protected void onDestroy() {
        destroyed = true;
        main.removeCallbacksAndMessages(null);
        publish(true);
        if (registered) unregisterReceiver(control);
        super.onDestroy();
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
