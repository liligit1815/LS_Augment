package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Color;
import ls.augment.com.ConfigSnapshot;

/** A main-thread configuration view over Duo's verified in-memory snapshot. */
final class LiftArcConfig {
    static final String PREFIX = "ls_augment_liftarc_";
    static final int DEFAULT_HINT_COLOR = 0xD9FFFFFF, HINT_FONT_COUNT = 5;
    static final String KEY_DEBUG_STATUS = PREFIX + "detail";
    static final String KEY_DEBUG_VIEWS = PREFIX + "views";
    static final String KEY_DEBUG_BLOCK = PREFIX + "block";
    interface Listener { void onConfigChanged(LiftArcConfig config); }
    private Context context;
    private ConfigSnapshot snapshot;
    private Listener listener;
    private final Runnable changed = this::reload;
    boolean enabled, requested;
    boolean showHandle = true, parallax = true, haptic = true, releaseReturn = true;
    boolean arcEnabled = true, arcDim = true, interceptSwipe, handleWide;
    boolean flickUnlock = true, dimUpper, glassLive, blurEnabled;
    float handleAlpha = 1, dragRatio = .85f, flickVelocity = 1200, unlockMs = 340;
    float arcWidth = 3, arcAlpha = 1, dimStrength = .57f, glassThick = 20;
    float blurStrength = .7f, glassDiffuse = .05f, glassBlur = 1, glassRefract = .85f;
    float glassEdgeRef = .4f, glassRefractW = .45f, glassFresnel = .22f;
    float glassHighlight = .46f, glassHlWidth = .85f, glassOpacity = .96f;
    float hintSize = 12, hintGap = 10, hintOffsetX;
    int arcColor = Color.WHITE, hintColor = DEFAULT_HINT_COLOR, hintWeight = 400, hintFont;
    String hintText = "";
    void bind(Context value) {
        if (context != null || value == null) return;
        context = value;
        LiftArcLog.setContext(value);
        FeatureSettings.addSnapshotListener(value, changed);
        reload();
    }
    void unbind() { FeatureSettings.removeSnapshotListener(changed); context = null; }
    boolean isReady() { return context != null && FeatureSettings.hasVerifiedSnapshot(context); }
    void load() { reload(); }
    void setListener(Listener value) { listener = value; }
    private void reload() {
        if (context == null) return;
        ConfigSnapshot next = FeatureSettings.snapshot(context);
        if (next == snapshot) return;
        snapshot = next;
        requested = bool("enabled", false);
        enabled = requested && !LiftArcRuntime.paused() && !LiftArcRuntime.conflicted();
        showHandle = bool("show_handle", true); parallax = bool("parallax", true);
        haptic = bool("haptic", true); releaseReturn = bool("release_return", true);
        interceptSwipe = bool("intercept_swipe", false); handleWide = bool("handle_wide", false);
        flickUnlock = bool("flick_unlock", true); flickVelocity = number("flick_velocity",1200,300,3000);
        unlockMs = number("unlock_ms",340,150,800); dragRatio = number("drag_ratio",.85f,.3f,1);
        handleAlpha = number("handle_alpha",1,.1f,1); arcEnabled = bool("arc_enabled",true);
        arcDim = bool("arc_dim",true); dimUpper = bool("dim_upper",false);
        dimStrength = number("dim_strength",.57f,.05f,1); arcWidth = number("arc_width",3,1,10);
        arcAlpha = number("arc_alpha",1,.1f,1); arcColor = color("arc_color",Color.WHITE);
        blurEnabled = bool("blur_enabled",false); blurStrength = number("blur_strength",.7f,.01f,1);
        glassLive = bool("glass_live",false); glassThick = number("glass_thick",20,1,40);
        glassOpacity = number("glass_opacity",.96f,.2f,1); glassDiffuse = number("glass_diffuse",.05f,0,1);
        glassBlur = number("glass_blur",1,0,20); glassRefract = number("glass_refract",.85f,0,.9f);
        glassEdgeRef = number("glass_edge_ref",.4f,0,.5f); glassRefractW = number("glass_refract_w",.45f,0,1);
        glassFresnel = number("glass_fresnel",.22f,0,1); glassHighlight = number("glass_highlight",.46f,0,1);
        glassHlWidth = number("glass_hl_width",.85f,.3f,1.5f);
        hintText = text("hint_text", ""); hintSize = number("hint_size",12,6,40);
        hintWeight = Math.round(number("hint_weight",400,100,900)/100f)*100;
        hintFont = Math.round(number("hint_font",0,0,4)); hintColor = color("hint_color",DEFAULT_HINT_COLOR);
        hintGap = number("hint_gap",10,0,96); hintOffsetX = number("hint_offset_x",0,-120,120);
        if (listener != null) listener.onConfigChanged(this);
        LiftArcRuntime.publish();
    }
    void pause() { enabled = false; if (listener != null) listener.onConfigChanged(this); }
    void refreshEffective() {
        boolean effective=requested&&!LiftArcRuntime.paused()&&!LiftArcRuntime.conflicted();
        if(enabled==effective)return;enabled=effective;
        if(listener!=null)listener.onConfigChanged(this);
    }
    private String text(String key,String fallback) {
        String raw = snapshot.get(PREFIX+key); return raw == null ? fallback : raw;
    }
    private boolean bool(String key,boolean fallback) {
        String raw = text(key,""); return raw.isEmpty() ? fallback : "1".equals(raw) || "true".equalsIgnoreCase(raw);
    }
    private float number(String key,float fallback,float min,float max) {
        try { float v=Float.parseFloat(text(key,"")); return Float.isFinite(v) ? Math.max(min,Math.min(max,v)) : fallback; }
        catch (RuntimeException invalid) { return fallback; }
    }
    private int color(String key,int fallback) {
        try { String value=text(key,""); return value.isEmpty()?fallback:Color.parseColor(value); }
        catch (RuntimeException invalid) { return fallback; }
    }
    void putDebug(String key,String value) {
        if (context != null) FeatureSettings.diagnostic(context,key,value == null?"":value.substring(0,Math.min(1800,value.length())));
    }
}
