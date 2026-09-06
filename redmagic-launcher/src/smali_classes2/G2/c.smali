.class public final LG2/c;
.super Ljava/lang/Object;
.source "Flags.java"


# static fields
.field private static a:LG2/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LG2/b;

    .line 2
    .line 3
    invoke-direct {v0}, LG2/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LG2/c;->a:LG2/a;

    .line 7
    .line 8
    return-void
.end method

.method public static a()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->enableDesktopModeThroughDevOption()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static b()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->enableDesktopRecentsTransitionsCornersBugfix()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static c()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->enableDesktopTaskbarOnFreeformDisplays()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static d()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->enableDesktopWindowingMode()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static e()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->enableDesktopWindowingPersistence()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static f()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->enableDesktopWindowingWallpaperActivity()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static g()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->enableMultipleDesktopsFrontend()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static h()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->enableTaskbarConnectedDisplays()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static i()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->moveToExternalDisplayShortcut()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static j()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->predictiveBackThreeButtonNav()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static k()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->predictiveBackTimestampApi()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static l()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->removeDepartTargetFromMotion()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static m()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeFalseForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->showAppHandleLargeScreens()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static n()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->showDesktopWindowingDevOption()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static o()Z
    .locals 1
    .annotation build Landroid/compat/annotation/UnsupportedAppUsage;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AconfigFlagAccessor;
    .end annotation

    .annotation build Lcom/android/aconfig/annotations/AssumeTrueForR8;
    .end annotation

    .line 1
    sget-object v0, LG2/c;->a:LG2/a;

    .line 2
    .line 3
    invoke-interface {v0}, LG2/a;->universalResizableByDefault()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method
