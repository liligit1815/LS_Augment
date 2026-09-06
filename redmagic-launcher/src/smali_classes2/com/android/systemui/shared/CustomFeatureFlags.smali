.class public Lcom/android/systemui/shared/CustomFeatureFlags;
.super Ljava/lang/Object;
.source "CustomFeatureFlags.java"

# interfaces
.implements Lcom/android/systemui/shared/FeatureFlags;


# instance fields
.field private mGetValueImpl:Ljava/util/function/BiPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/BiPredicate<",
            "Ljava/lang/String;",
            "Ljava/util/function/Predicate<",
            "Lcom/android/systemui/shared/FeatureFlags;",
            ">;>;"
        }
    .end annotation
.end field

.field private mReadOnlyFlagsSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/function/BiPredicate;)V
    .locals 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/BiPredicate<",
            "Ljava/lang/String;",
            "Ljava/util/function/Predicate<",
            "Lcom/android/systemui/shared/FeatureFlags;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashSet;

    .line 7
    .line 8
    const-string v25, "com.android.systemui.shared.use_preferred_image_editor"

    .line 9
    .line 10
    const-string v26, ""

    .line 11
    .line 12
    const-string v2, "com.android.systemui.shared.ambient_aod"

    .line 13
    .line 14
    const-string v3, "com.android.systemui.shared.bouncer_area_exclusion"

    .line 15
    .line 16
    const-string v4, "com.android.systemui.shared.clock_reactive_smartspace_layout"

    .line 17
    .line 18
    const-string v5, "com.android.systemui.shared.clock_reactive_variants"

    .line 19
    .line 20
    const-string v6, "com.android.systemui.shared.cursor_hot_corner"

    .line 21
    .line 22
    const-string v7, "com.android.systemui.shared.enable_home_delay"

    .line 23
    .line 24
    const-string v8, "com.android.systemui.shared.enable_lpp_squeeze_effect"

    .line 25
    .line 26
    const-string v9, "com.android.systemui.shared.example_shared_flag"

    .line 27
    .line 28
    const-string v10, "com.android.systemui.shared.extended_wallpaper_effects"

    .line 29
    .line 30
    const-string v11, "com.android.systemui.shared.lockscreen_custom_clocks"

    .line 31
    .line 32
    const-string v12, "com.android.systemui.shared.new_customization_picker_ui"

    .line 33
    .line 34
    const-string v13, "com.android.systemui.shared.new_touchpad_gestures_tutorial"

    .line 35
    .line 36
    const-string v14, "com.android.systemui.shared.return_animation_framework_library"

    .line 37
    .line 38
    const-string v15, "com.android.systemui.shared.return_animation_framework_long_lived"

    .line 39
    .line 40
    const-string v16, "com.android.systemui.shared.screenshot_context_url"

    .line 41
    .line 42
    const-string v17, "com.android.systemui.shared.shade_allow_back_gesture"

    .line 43
    .line 44
    const-string v18, "com.android.systemui.shared.sidefps_controller_refactor"

    .line 45
    .line 46
    const-string v19, "com.android.systemui.shared.smartspace_remoteviews_intent_handler"

    .line 47
    .line 48
    const-string v20, "com.android.systemui.shared.smartspace_sports_card_background"

    .line 49
    .line 50
    const-string v21, "com.android.systemui.shared.smartspace_ui_update"

    .line 51
    .line 52
    const-string v22, "com.android.systemui.shared.smartspace_ui_update_resources"

    .line 53
    .line 54
    const-string v23, "com.android.systemui.shared.status_bar_connected_displays"

    .line 55
    .line 56
    const-string v24, "com.android.systemui.shared.three_button_corner_swipe"

    .line 57
    .line 58
    filled-new-array/range {v2 .. v26}, [Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 67
    .line 68
    .line 69
    iput-object v1, v0, Lcom/android/systemui/shared/CustomFeatureFlags;->mReadOnlyFlagsSet:Ljava/util/Set;

    .line 70
    .line 71
    move-object/from16 v1, p1

    .line 72
    .line 73
    iput-object v1, v0, Lcom/android/systemui/shared/CustomFeatureFlags;->mGetValueImpl:Ljava/util/function/BiPredicate;

    .line 74
    .line 75
    return-void
.end method

.method private isOptimizationEnabled()Z
    .locals 0
    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method


# virtual methods
.method public ambientAod()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/r;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/r;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.ambient_aod"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public bouncerAreaExclusion()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/u;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/u;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.bouncer_area_exclusion"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public clockReactiveSmartspaceLayout()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/j;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/j;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.clock_reactive_smartspace_layout"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public clockReactiveVariants()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/h;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/h;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.clock_reactive_variants"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public cursorHotCorner()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/o;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/o;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.cursor_hot_corner"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public enableHomeDelay()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/n;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/n;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.enable_home_delay"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public enableLppSqueezeEffect()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/m;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/m;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.enable_lpp_squeeze_effect"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public exampleSharedFlag()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/b;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.example_shared_flag"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public extendedWallpaperEffects()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/l;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/l;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.extended_wallpaper_effects"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public getFlagNames()Ljava/util/List;
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v23, "com.android.systemui.shared.three_button_corner_swipe"

    .line 2
    .line 3
    const-string v24, "com.android.systemui.shared.use_preferred_image_editor"

    .line 4
    .line 5
    const-string v1, "com.android.systemui.shared.ambient_aod"

    .line 6
    .line 7
    const-string v2, "com.android.systemui.shared.bouncer_area_exclusion"

    .line 8
    .line 9
    const-string v3, "com.android.systemui.shared.clock_reactive_smartspace_layout"

    .line 10
    .line 11
    const-string v4, "com.android.systemui.shared.clock_reactive_variants"

    .line 12
    .line 13
    const-string v5, "com.android.systemui.shared.cursor_hot_corner"

    .line 14
    .line 15
    const-string v6, "com.android.systemui.shared.enable_home_delay"

    .line 16
    .line 17
    const-string v7, "com.android.systemui.shared.enable_lpp_squeeze_effect"

    .line 18
    .line 19
    const-string v8, "com.android.systemui.shared.example_shared_flag"

    .line 20
    .line 21
    const-string v9, "com.android.systemui.shared.extended_wallpaper_effects"

    .line 22
    .line 23
    const-string v10, "com.android.systemui.shared.lockscreen_custom_clocks"

    .line 24
    .line 25
    const-string v11, "com.android.systemui.shared.new_customization_picker_ui"

    .line 26
    .line 27
    const-string v12, "com.android.systemui.shared.new_touchpad_gestures_tutorial"

    .line 28
    .line 29
    const-string v13, "com.android.systemui.shared.return_animation_framework_library"

    .line 30
    .line 31
    const-string v14, "com.android.systemui.shared.return_animation_framework_long_lived"

    .line 32
    .line 33
    const-string v15, "com.android.systemui.shared.screenshot_context_url"

    .line 34
    .line 35
    const-string v16, "com.android.systemui.shared.shade_allow_back_gesture"

    .line 36
    .line 37
    const-string v17, "com.android.systemui.shared.sidefps_controller_refactor"

    .line 38
    .line 39
    const-string v18, "com.android.systemui.shared.smartspace_remoteviews_intent_handler"

    .line 40
    .line 41
    const-string v19, "com.android.systemui.shared.smartspace_sports_card_background"

    .line 42
    .line 43
    const-string v20, "com.android.systemui.shared.smartspace_ui_update"

    .line 44
    .line 45
    const-string v21, "com.android.systemui.shared.smartspace_ui_update_resources"

    .line 46
    .line 47
    const-string v22, "com.android.systemui.shared.status_bar_connected_displays"

    .line 48
    .line 49
    filled-new-array/range {v1 .. v24}, [Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    return-object v0
.end method

.method protected getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/function/Predicate<",
            "Lcom/android/systemui/shared/FeatureFlags;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/CustomFeatureFlags;->mGetValueImpl:Ljava/util/function/BiPredicate;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/function/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isFlagReadOnlyOptimized(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/CustomFeatureFlags;->mReadOnlyFlagsSet:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/systemui/shared/CustomFeatureFlags;->isOptimizationEnabled()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public lockscreenCustomClocks()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/p;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/p;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.lockscreen_custom_clocks"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public newCustomizationPickerUi()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/i;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/i;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.new_customization_picker_ui"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public newTouchpadGesturesTutorial()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/s;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/s;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.new_touchpad_gestures_tutorial"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public returnAnimationFrameworkLibrary()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/k;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/k;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.return_animation_framework_library"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public returnAnimationFrameworkLongLived()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/d;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/d;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.return_animation_framework_long_lived"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public screenshotContextUrl()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/a;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.screenshot_context_url"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public shadeAllowBackGesture()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/x;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/x;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.shade_allow_back_gesture"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public sidefpsControllerRefactor()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/g;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/g;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.sidefps_controller_refactor"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public smartspaceRemoteviewsIntentHandler()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/t;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/t;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.smartspace_remoteviews_intent_handler"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public smartspaceSportsCardBackground()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/w;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/w;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.smartspace_sports_card_background"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public smartspaceUiUpdate()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/e;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/e;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.smartspace_ui_update"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public smartspaceUiUpdateResources()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/q;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/q;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.smartspace_ui_update_resources"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public statusBarConnectedDisplays()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/v;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/v;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.status_bar_connected_displays"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public threeButtonCornerSwipe()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/c;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/c;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.three_button_corner_swipe"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public usePreferredImageEditor()Z
    .locals 2
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/f;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.systemui.shared.use_preferred_image_editor"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/android/systemui/shared/CustomFeatureFlags;->getValue(Ljava/lang/String;Ljava/util/function/Predicate;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method
