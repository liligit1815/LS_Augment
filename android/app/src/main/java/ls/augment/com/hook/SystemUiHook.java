package ls.augment.com.hook;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.lang.reflect.*;
import java.util.*;
import io.github.libxposed.api.XposedInterface.HookHandle;

/** Clock formatting and window insets; row placement belongs to StatusBarGridHook. */
final class SystemUiHook {
    private static final String CLOCK = "com.android.systemui.statusbar.policy.Clock";
    private static final String SYSTEM_BAR_UTILS = "com.android.internal.policy.SystemBarUtils";
    static final String GRID_CLOCK_TAG = "ls_augment_keyguard_clock";
    private static final Map<TextView, ClockState> CLOCK_STATES = Collections.synchronizedMap(new WeakHashMap<>());
    private SystemUiHook() { }
    static int install(AugmentModule module, ClassLoader loader) {
        StringBuilder compatibility = new StringBuilder();
        int installed = StatusBarGridHook.install(module, loader);
        installed += StatusBarAssetsHook.install(module, loader);
        installed += StatusBarRecentsHook.install(module, loader);
        installed += NotificationStackHook.install(module, loader);
        installed += BluetoothIconHook.install(module, loader);
        installed += installClock(module, loader, compatibility);
        installed += StatusBarWindowSizingHook.install(module, loader);
        module.logFeatureInfo("SYSTEMUI_GRID_READY hooks=" + installed + " compat=" + compatibility);
        return installed;
    }
    private static int installClock(
            AugmentModule module, ClassLoader loader, StringBuilder compatibility) {
        final Class<?> type;
        try {
            type = Class.forName(CLOCK, false, loader);
            addCompat(compatibility, "clock_class", true);
        } catch (Throwable error) {
            addCompat(compatibility, "clock_class", false);
            report(module, "CLOCK_CLASS_MISSING", error);
            return 0;
        }
        Method update = findNoArg(type, "updateClock");
        if (update == null) {
            addCompat(compatibility, "clock_update", false);
            return 0;
        }
        try {
            update.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            update, "systemui.clock.update", false)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        Object owner = chain.getThisObject();
                        if (owner instanceof TextView) updateClock((TextView) owner, true);
                        return result;
                    });
            module.registerFeatureHook(handle);
            addCompat(compatibility, "clock_update", true);
            return 1;
        } catch (Throwable error) {
            addCompat(compatibility, "clock_update", false);
            report(module, "CLOCK_HOOK_FAILED", error);
            return 0;
        }
    }

    private static void updateClock(TextView clock, boolean nativeTextJustRendered) {
        if (!StatusBarGridHook.inBar(clock)) return;
        Context context = clock.getContext();
        ClockState state = CLOCK_STATES.get(clock);
        if (state != null && nativeTextJustRendered) state.nativeText = clock.getText();
        boolean enabled = FeatureSettings.enabled(context, FeatureSettings.SYSTEMUI_MASTER)
                && !FeatureSettings.enabled(context, ls.augment.com.ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY)
                && (GRID_CLOCK_TAG.equals(clock.getTag())
                    || FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_CUSTOM));
        if (!enabled) {
            if (state != null) {
                CLOCK_STATES.remove(clock);
                state.restore(!nativeTextJustRendered);
            }
            StatusBarAssetsHook.applyFont(clock,"clock");
            return;
        }
        if (state == null) {
            state = new ClockState(clock);
            CLOCK_STATES.put(clock, state);
        }
        if (nativeTextJustRendered) state.nativeText = clock.getText();
        renderClock(state);
    }

    static void refreshGridClock(View root) {
        View view = findByNames(root, "clock", "status_bar_clock");
        if(view==null)view=root.findViewWithTag(GRID_CLOCK_TAG);
        if (view instanceof TextView) updateClock((TextView) view, false);
    }
    static void releaseGridClock(TextView clock) {
        ClockState state=CLOCK_STATES.remove(clock);if(state!=null)state.restore(false);
    }

    private static TextView gridClock(View root) {
        View view=findByNames(root,"clock","status_bar_clock");
        if(view==null)view=root.findViewWithTag(GRID_CLOCK_TAG);
        return view instanceof TextView?(TextView)view:null;
    }
    static boolean holdsNativeClock(TextView clock) {
        ClockState state=CLOCK_STATES.get(clock);return state!=null&&state.nativeFallback;
    }
    static void suspendGridClock(View root) {
        TextView clock=gridClock(root);ClockState state=CLOCK_STATES.get(clock);
        if(state!=null&&!GRID_CLOCK_TAG.equals(clock.getTag())){
            state.nativeFallback=true;state.restorePresentation(true);
        }
    }
    static TextView prepareGridClock(View view) {
        if(!(view instanceof TextView))return null;
        ClockState state=CLOCK_STATES.get(view);
        if(state!=null&&state.nativeFallback){state.nativeFallback=false;renderClock(state);}
        return state==null?null:state.clock;
    }
    static void resetGridClock(View root) {
        TextView clock=gridClock(root);ClockState state=CLOCK_STATES.remove(clock);
        if(state!=null)state.restore(true);
    }
    /** Resolve fonts against the attached source; only the detached target is measured. */
    static TextView wantedGridClock(View root) {
        TextView clock=gridClock(root);ClockState state=CLOCK_STATES.get(clock);
        if(state==null)return null;
        if(state.wantedClock==null){
            state.wantedClock=new TextView(clock.getContext());
            state.wantedClock.setLayoutParams(new ViewGroup.LayoutParams(state.originalWidth,ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        TextView wanted=state.wantedClock;
        wanted.setPadding(clock.getPaddingLeft(),clock.getPaddingTop(),clock.getPaddingRight(),clock.getPaddingBottom());
        wanted.setTextScaleX(clock.getTextScaleX());
        if(state.lastValidText==null)wanted.setText(state.nativeText);
        renderClock(state,true,wanted,true);return wanted;
    }

    private static void renderClock(ClockState state) {
        renderClock(state,true);
    }
    private static void renderClock(ClockState state,boolean refreshStyle) {
        if(state.nativeFallback){state.clock.invalidate();return;}
        renderClock(state,refreshStyle,state.clock,false);
    }
    private static void renderClock(ClockState state,boolean refreshStyle,TextView clock,boolean preview) {
        Context context = state.clock.getContext();
        if(GRID_CLOCK_TAG.equals(state.clock.getTag())
                &&!FeatureSettings.enabled(context,FeatureSettings.STATUSBAR_CLOCK_CUSTOM)){
            if(refreshStyle)state.applyStyle(clock,false);
            state.setText(clock,android.text.format.DateFormat.getTimeFormat(context).format(new Date()));
            if(!preview){state.publishError("");state.setSecondTicker(true,false);}return;
        }
        String secondPattern = FeatureSettings.text(
                context, FeatureSettings.STATUSBAR_CLOCK_PATTERN_SECOND, "").trim();
        if(FeatureSettings.integer(context,ls.augment.com.ConfigSchema.STATUSBAR_CLOCK_ROWS,2,1,2)==1) secondPattern="";
        if(refreshStyle)state.applyStyle(clock,!secondPattern.isEmpty());
        Configuration configuration = context.getResources().getConfiguration();
        Locale locale = configuration.getLocales().isEmpty()
                ? Locale.getDefault() : configuration.getLocales().get(0);
        StatusBarClockFormatter.FormatResult result = StatusBarClockFormatter.formatDetailed(
                System.currentTimeMillis(), locale,
                FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_24H, true),
                FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_SECONDS),
                FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_PERIOD),
                FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_WEEK),
                FeatureSettings.text(context, FeatureSettings.STATUSBAR_CLOCK_PATTERN, ""),
                secondPattern);
        if (result.valid) {
            state.setText(clock,result.text);
            if(!preview){state.lastValidText = result.text;state.publishError("");}
        } else {
            if (state.lastValidText != null) clock.setText(state.lastValidText);
            if(!preview)state.publishError(result.error);
        }
        if(!preview){state.setSecondTicker(result.valid && (result.refreshEverySecond||GRID_CLOCK_TAG.equals(clock.getTag())),result.containsMilliseconds);
            clock.invalidate();}
    }

    private static View findByNames(View root, String... names) {
        Context context = root.getContext();
        for (String name : names) {
            int id = context.getResources().getIdentifier(
                    name, "id", context.getPackageName());
            if (id == 0) id = context.getResources().getIdentifier(name, "id", "android");
            if (id == 0) continue;
            View value = root.findViewById(id);
            if (value != null) return value;
        }
        return null;
    }

    private static String resourceName(View view) {
        try {
            int id = view.getId();
            return id == View.NO_ID ? "" : view.getResources().getResourceEntryName(id);
        } catch (Throwable ignored) {
            return "";
        }
    }

    static String slotOf(View view) {
        String className = view.getClass().getName();
        if (!className.contains("StatusBar") && !className.contains("StatusIcon")
                && !className.contains("IconView")) {
            return null;
        }
        try {
            Object value=SystemUiAdapter.callIfPresent(view,"getSlot");
            if(value instanceof String)return cleanSlot((String)value);
        } catch(Throwable ignored) { }
        for (String name : new String[]{"mSlot", "slot"}) {
            Object value=SystemUiAdapter.field(view,name);
            if(value instanceof String)return cleanSlot((String)value);
        }
        return null;
    }

    private static String cleanSlot(String value) {
        if (value == null) return null;
        String clean = value.trim().replace(',', '_').replace(';', '_');
        if(clean.isEmpty()||clean.length()>80)return null;
        for(int i=0;i<clean.length();i++){char c=clean.charAt(i);
            if(!(c>='A'&&c<='Z'||c>='a'&&c<='z'||c>='0'&&c<='9'||c=='_'||c=='.'||c==':'||c=='-'))return null;
        }
        return clean;
    }

    private static Method findNoArg(Class<?> type, String name) {
        for (Method method : allMethods(type)) {
            if (name.equals(method.getName()) && method.getParameterCount() == 0
                    && !Modifier.isAbstract(method.getModifiers())) return method;
        }
        return null;
    }

    private static List<Method> allMethods(Class<?> type) {
        List<Method> methods = new ArrayList<>();
        for (Class<?> cursor = type; cursor != null; cursor = cursor.getSuperclass()) {
            Collections.addAll(methods, cursor.getDeclaredMethods());
        }
        return methods;
    }

    private static int dp(Context context, int value) {
        if (context == null) return value;
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static float dp(Context context, float value) {
        if (context == null) return value;
        return value * context.getResources().getDisplayMetrics().density;
    }

    private static void addCompat(StringBuilder value, String key, boolean present) {
        if (value.length() > 0) value.append(';');
        value.append(key).append('=').append(present ? '1' : '0');
    }

    private static void report(AugmentModule module, String stage, Throwable error) {
        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.SYSTEMUI_LAST_ERROR,
                stage + ":" + error.getClass().getSimpleName() + ":" + safeMessage(error));
        module.logFeatureError("SYSTEMUI_" + stage, error);
    }

    private static String safeMessage(Throwable error) {
        String value = error == null ? "" : error.getMessage();
        return value == null ? "" : value.replace('\n', ' ').replace('\r', ' ');
    }

    private static final class ClockState implements Runnable,View.OnAttachStateChangeListener,android.view.ViewTreeObserver.OnGlobalLayoutListener {
        final TextView clock;
        final Typeface originalTypeface;
        final float originalTextSize;
        final float originalLetterSpacing;
        final float originalLineSpacingExtra;
        final float originalLineSpacingMultiplier;
        final int originalGravity;
        final int originalMinLines;
        final int originalMaxLines;
        final boolean originalSingleLine;
        final boolean originalIncludeFontPadding;
        final android.text.TextUtils.TruncateAt originalEllipsize;
        final int originalWidth;
        CharSequence nativeText;
        String lastValidText;
        String lastReportedError = null;
        boolean ticking,scheduled,milliseconds,listening,nativeFallback;
        TextView wantedClock;
        final Runnable settingsListener=this::refreshSettings;
        final android.content.BroadcastReceiver lifecycle=new android.content.BroadcastReceiver(){
            @Override public void onReceive(Context context,android.content.Intent intent){
                cancelScheduled();
                if(canRun())updateClock(clock,false);
            }
        };

        ClockState(TextView clock) {
            this.clock = clock;
            originalTypeface = StatusBarAssetsHook.nativeTypeface(clock,clock.getTypeface());
            originalTextSize = clock.getTextSize();
            originalLetterSpacing = clock.getLetterSpacing();
            originalLineSpacingExtra = clock.getLineSpacingExtra();
            originalLineSpacingMultiplier = clock.getLineSpacingMultiplier();
            originalGravity = clock.getGravity();
            originalMinLines = clock.getMinLines();
            originalMaxLines = clock.getMaxLines();
            originalSingleLine = originalMaxLines == 1;
            originalIncludeFontPadding = clock.getIncludeFontPadding();
            originalEllipsize=clock.getEllipsize();
            originalWidth = clock.getLayoutParams() == null
                    ? ViewGroup.LayoutParams.WRAP_CONTENT : clock.getLayoutParams().width;
            nativeText = clock.getText();
            clock.addOnAttachStateChangeListener(this);
            if(clock.isAttachedToWindow())attach();
        }

        void applyStyle(TextView target,boolean twoLines) {
            Context context = clock.getContext();
            String family = FeatureSettings.text(context,
                    FeatureSettings.STATUSBAR_CLOCK_FONT_FAMILY, "sans-serif").trim();
            Typeface base = Typeface.create(family.isEmpty() ? "sans-serif" : family,
                    Typeface.NORMAL);
            int weight = FeatureSettings.integer(context,
                    FeatureSettings.STATUSBAR_CLOCK_WEIGHT, 400, 100, 900);
            target.setTypeface(StatusBarAssetsHook.typeface(clock, "clock", Typeface.create(base, weight, false), originalTypeface));
            float size = FeatureSettings.decimal(context,
                    FeatureSettings.STATUSBAR_CLOCK_SIZE_SP, 0.0f, 0.0f, 40.0f);
            target.setTextSize(size > 0.0f ? TypedValue.COMPLEX_UNIT_SP
                    : TypedValue.COMPLEX_UNIT_PX, size > 0.0f ? size : originalTextSize);
            target.setLetterSpacing(FeatureSettings.decimal(context,
                    FeatureSettings.STATUSBAR_CLOCK_LETTER_SPACING,
                    0.0f, -0.20f, 1.0f));
            float lineSpacing=dp(context, FeatureSettings.decimal(context,
                    FeatureSettings.STATUSBAR_CLOCK_LINE_SPACING_DP,0.0f,0.0f,32.0f));
            if(twoLines&&FeatureSettings.enabled(context,ls.augment.com.ConfigSchema.SYSTEMUI_MASTER)
                    &&!FeatureSettings.enabled(context,ls.augment.com.ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY)){
                lineSpacing+=dp(context,Math.max(0,FeatureSettings.integer(context,
                        ls.augment.com.ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,0,-8,64)));
            }
            // Keep line advances positive even on unusually small OEM clock fonts.
            target.setLineSpacing(Math.max(-target.getPaint().getFontSpacing()*.75f,lineSpacing),1.0f);
            String align = FeatureSettings.text(context,
                    FeatureSettings.STATUSBAR_CLOCK_TEXT_ALIGN, "center");
            int horizontal = "left".equals(align) ? Gravity.START
                    : "right".equals(align) ? Gravity.END : Gravity.CENTER_HORIZONTAL;
            target.setGravity(horizontal | Gravity.CENTER_VERTICAL);
            target.setIncludeFontPadding(false);
            // The grid owns fitting. Native single-line marquee/ellipsis can
            // retain a stale clipping interval after switching from two rows.
            target.setSingleLine(false);
            target.setHorizontallyScrolling(false);
            target.setEllipsize(null);
            if (twoLines) {
                target.setMinLines(2);
                target.setMaxLines(2);
            } else {
                target.setMinLines(1);
                target.setMaxLines(1);
            }
            ViewGroup.LayoutParams params = target.getLayoutParams();
            if (params != null) {
                int width = FeatureSettings.integer(context,
                        FeatureSettings.STATUSBAR_CLOCK_WIDTH_DP, 0, 0, 240);
                params.width = width > 0 ? dp(context, width) : originalWidth;
                target.setLayoutParams(params);
            }
        }

        void setText(TextView target,String value){if(!android.text.TextUtils.equals(target.getText(),value))target.setText(value);}
        void refreshSettings(){cancelScheduled();if(clock.isAttachedToWindow())updateClock(clock,false);}
        void setSecondTicker(boolean enabled,boolean milliseconds) {
            if(this.milliseconds!=milliseconds)cancelScheduled();
            this.milliseconds=milliseconds;ticking=enabled;
            if(enabled)schedule();else cancelScheduled();
        }
        void attach(){
            if(listening)return;
            android.content.IntentFilter filter=new android.content.IntentFilter();
            filter.addAction(android.content.Intent.ACTION_SCREEN_ON);filter.addAction(android.content.Intent.ACTION_SCREEN_OFF);
            filter.addAction(android.content.Intent.ACTION_TIME_CHANGED);filter.addAction(android.content.Intent.ACTION_TIMEZONE_CHANGED);
            try{clock.getContext().registerReceiver(lifecycle,filter,Context.RECEIVER_NOT_EXPORTED);
                FeatureSettings.addSnapshotListener(clock.getContext(),settingsListener);
                clock.getViewTreeObserver().addOnGlobalLayoutListener(this);listening=true;
            }catch(RuntimeException ignored){}
        }
        void detach(){
            cancelScheduled();FeatureSettings.removeSnapshotListener(settingsListener);
            if(listening){try{clock.getContext().unregisterReceiver(lifecycle);}catch(RuntimeException ignored){}
                if(clock.getViewTreeObserver().isAlive())clock.getViewTreeObserver().removeOnGlobalLayoutListener(this);}
            listening=false;
        }
        boolean canRun(){
            if(!clock.isAttachedToWindow()||!clock.isShown()||clock.getWindowVisibility()!=View.VISIBLE)return false;
            android.os.PowerManager power=clock.getContext().getSystemService(android.os.PowerManager.class);
            return power!=null&&power.isInteractive();
        }
        void cancelScheduled(){clock.removeCallbacks(this);scheduled=false;}
        @Override public void onViewAttachedToWindow(View view){attach();updateClock(clock,false);}
        @Override public void onViewDetachedFromWindow(View view){detach();}
        @Override public void onGlobalLayout(){if(canRun())schedule();else cancelScheduled();}

        void schedule() {
            if(!ticking||scheduled||!canRun())return;
            long interval = 1000L;
            boolean highFrequency=milliseconds&&FeatureSettings.enabled(clock.getContext(), "ls_augment_rm_clock_milliseconds_refresh");
            if (highFrequency) {
                interval = FeatureSettings.integer(clock.getContext(), "ls_augment_rm_clock_refresh_ms", 100, 16, 1000);
            }
            long delay=interval-Math.floorMod(System.currentTimeMillis(),interval);
            scheduled=true;
            if(highFrequency)clock.postOnAnimationDelayed(this,delay);
            else clock.postDelayed(this,delay);
        }

        void publishError(String value) {
            String clean = value == null ? "" : value;
            if (clean.equals(lastReportedError)) return;
            lastReportedError = clean;
            FeatureSettings.diagnostic(clock.getContext(),
                    FeatureSettings.SYSTEMUI_CLOCK_ERROR, clean);
        }

        void restore(boolean restoreText) {
            ticking = false;
            detach();clock.removeOnAttachStateChangeListener(this);wantedClock=null;nativeFallback=false;
            restorePresentation(restoreText);
        }
        void restorePresentation(boolean restoreText) {
            clock.setTypeface(originalTypeface);
            clock.setTextSize(TypedValue.COMPLEX_UNIT_PX, originalTextSize);
            clock.setLetterSpacing(originalLetterSpacing);
            clock.setLineSpacing(originalLineSpacingExtra, originalLineSpacingMultiplier);
            clock.setGravity(originalGravity);
            clock.setSingleLine(originalSingleLine);
            clock.setEllipsize(originalEllipsize);
            clock.setMinLines(originalMinLines);
            clock.setMaxLines(originalMaxLines);
            clock.setIncludeFontPadding(originalIncludeFontPadding);
            ViewGroup.LayoutParams params = clock.getLayoutParams();
            if (params != null) {
                params.width = originalWidth;
                clock.setLayoutParams(params);
            }
            if (restoreText && nativeText != null) clock.setText(nativeText);
            publishError("");
        }

        @Override public void run() {
            scheduled=false;
            if(!ticking||!canRun())return;
            renderClock(this,false);
            schedule();
        }
    }

}
