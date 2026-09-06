.class public final Lcom/android/systemui/shared/Flags;
.super Ljava/lang/Object;
.source "Flags.java"


# static fields
.field private static FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags; = null

.field public static final FLAG_AMBIENT_AOD:Ljava/lang/String; = "com.android.systemui.shared.ambient_aod"

.field public static final FLAG_BOUNCER_AREA_EXCLUSION:Ljava/lang/String; = "com.android.systemui.shared.bouncer_area_exclusion"

.field public static final FLAG_CLOCK_REACTIVE_SMARTSPACE_LAYOUT:Ljava/lang/String; = "com.android.systemui.shared.clock_reactive_smartspace_layout"

.field public static final FLAG_CLOCK_REACTIVE_VARIANTS:Ljava/lang/String; = "com.android.systemui.shared.clock_reactive_variants"

.field public static final FLAG_CURSOR_HOT_CORNER:Ljava/lang/String; = "com.android.systemui.shared.cursor_hot_corner"

.field public static final FLAG_ENABLE_HOME_DELAY:Ljava/lang/String; = "com.android.systemui.shared.enable_home_delay"

.field public static final FLAG_ENABLE_LPP_SQUEEZE_EFFECT:Ljava/lang/String; = "com.android.systemui.shared.enable_lpp_squeeze_effect"

.field public static final FLAG_EXAMPLE_SHARED_FLAG:Ljava/lang/String; = "com.android.systemui.shared.example_shared_flag"

.field public static final FLAG_EXTENDED_WALLPAPER_EFFECTS:Ljava/lang/String; = "com.android.systemui.shared.extended_wallpaper_effects"

.field public static final FLAG_LOCKSCREEN_CUSTOM_CLOCKS:Ljava/lang/String; = "com.android.systemui.shared.lockscreen_custom_clocks"

.field public static final FLAG_NEW_CUSTOMIZATION_PICKER_UI:Ljava/lang/String; = "com.android.systemui.shared.new_customization_picker_ui"

.field public static final FLAG_NEW_TOUCHPAD_GESTURES_TUTORIAL:Ljava/lang/String; = "com.android.systemui.shared.new_touchpad_gestures_tutorial"

.field public static final FLAG_RETURN_ANIMATION_FRAMEWORK_LIBRARY:Ljava/lang/String; = "com.android.systemui.shared.return_animation_framework_library"

.field public static final FLAG_RETURN_ANIMATION_FRAMEWORK_LONG_LIVED:Ljava/lang/String; = "com.android.systemui.shared.return_animation_framework_long_lived"

.field public static final FLAG_SCREENSHOT_CONTEXT_URL:Ljava/lang/String; = "com.android.systemui.shared.screenshot_context_url"

.field public static final FLAG_SHADE_ALLOW_BACK_GESTURE:Ljava/lang/String; = "com.android.systemui.shared.shade_allow_back_gesture"

.field public static final FLAG_SIDEFPS_CONTROLLER_REFACTOR:Ljava/lang/String; = "com.android.systemui.shared.sidefps_controller_refactor"

.field public static final FLAG_SMARTSPACE_REMOTEVIEWS_INTENT_HANDLER:Ljava/lang/String; = "com.android.systemui.shared.smartspace_remoteviews_intent_handler"

.field public static final FLAG_SMARTSPACE_SPORTS_CARD_BACKGROUND:Ljava/lang/String; = "com.android.systemui.shared.smartspace_sports_card_background"

.field public static final FLAG_SMARTSPACE_UI_UPDATE:Ljava/lang/String; = "com.android.systemui.shared.smartspace_ui_update"

.field public static final FLAG_SMARTSPACE_UI_UPDATE_RESOURCES:Ljava/lang/String; = "com.android.systemui.shared.smartspace_ui_update_resources"

.field public static final FLAG_STATUS_BAR_CONNECTED_DISPLAYS:Ljava/lang/String; = "com.android.systemui.shared.status_bar_connected_displays"

.field public static final FLAG_THREE_BUTTON_CORNER_SWIPE:Ljava/lang/String; = "com.android.systemui.shared.three_button_corner_swipe"

.field public static final FLAG_USE_PREFERRED_IMAGE_EDITOR:Ljava/lang/String; = "com.android.systemui.shared.use_preferred_image_editor"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/systemui/shared/FeatureFlagsImpl;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/FeatureFlagsImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static ambientAod()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->ambientAod()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static bouncerAreaExclusion()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->bouncerAreaExclusion()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static clockReactiveSmartspaceLayout()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->clockReactiveSmartspaceLayout()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static clockReactiveVariants()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->clockReactiveVariants()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static cursorHotCorner()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->cursorHotCorner()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static enableHomeDelay()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->enableHomeDelay()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static enableLppSqueezeEffect()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->enableLppSqueezeEffect()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static exampleSharedFlag()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->exampleSharedFlag()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static extendedWallpaperEffects()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->extendedWallpaperEffects()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static lockscreenCustomClocks()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->lockscreenCustomClocks()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static newCustomizationPickerUi()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->newCustomizationPickerUi()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static newTouchpadGesturesTutorial()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->newTouchpadGesturesTutorial()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static returnAnimationFrameworkLibrary()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->returnAnimationFrameworkLibrary()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static returnAnimationFrameworkLongLived()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->returnAnimationFrameworkLongLived()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static screenshotContextUrl()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->screenshotContextUrl()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static shadeAllowBackGesture()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->shadeAllowBackGesture()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static sidefpsControllerRefactor()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->sidefpsControllerRefactor()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static smartspaceRemoteviewsIntentHandler()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->smartspaceRemoteviewsIntentHandler()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static smartspaceSportsCardBackground()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->smartspaceSportsCardBackground()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static smartspaceUiUpdate()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->smartspaceUiUpdate()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static smartspaceUiUpdateResources()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->smartspaceUiUpdateResources()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static statusBarConnectedDisplays()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->statusBarConnectedDisplays()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static threeButtonCornerSwipe()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->threeButtonCornerSwipe()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static usePreferredImageEditor()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/shared/Flags;->FEATURE_FLAGS:Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/systemui/shared/FeatureFlags;->usePreferredImageEditor()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method
