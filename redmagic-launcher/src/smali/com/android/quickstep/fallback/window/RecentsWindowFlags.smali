.class public final Lcom/android/quickstep/fallback/window/RecentsWindowFlags;
.super Ljava/lang/Object;
.source "RecentsWindowFlags.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

.field public static final enableFallbackOverviewInWindow:Landroid/window/DesktopModeFlags$DesktopModeFlag;

.field public static final enableLauncherOverviewInWindow:Landroid/window/DesktopModeFlags$DesktopModeFlag;

.field public static final enableOverviewOnConnectedDisplays:Landroid/window/DesktopModeFlags$DesktopModeFlag;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 8
    .line 9
    new-instance v0, Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/fallback/window/c;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/quickstep/fallback/window/c;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-direct {v0, v1, v2}, Landroid/window/DesktopModeFlags$DesktopModeFlag;-><init>(Ljava/util/function/BooleanSupplier;Z)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->enableLauncherOverviewInWindow:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 21
    .line 22
    new-instance v0, Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 23
    .line 24
    new-instance v1, Lcom/android/quickstep/fallback/window/d;

    .line 25
    .line 26
    invoke-direct {v1}, Lcom/android/quickstep/fallback/window/d;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {v0, v1, v2}, Landroid/window/DesktopModeFlags$DesktopModeFlag;-><init>(Ljava/util/function/BooleanSupplier;Z)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->enableFallbackOverviewInWindow:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 33
    .line 34
    new-instance v0, Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 35
    .line 36
    new-instance v1, Lcom/android/quickstep/fallback/window/e;

    .line 37
    .line 38
    invoke-direct {v1}, Lcom/android/quickstep/fallback/window/e;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-direct {v0, v1, v2}, Landroid/window/DesktopModeFlags$DesktopModeFlag;-><init>(Ljava/util/function/BooleanSupplier;Z)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->enableOverviewOnConnectedDisplays:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 45
    .line 46
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

.method public static final getEnableOverviewInWindow()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method
