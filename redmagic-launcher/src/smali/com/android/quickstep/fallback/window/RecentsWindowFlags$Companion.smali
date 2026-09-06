.class public final Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;
.super Ljava/lang/Object;
.source "RecentsWindowFlags.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/fallback/window/RecentsWindowFlags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;-><init>()V

    return-void
.end method

.method public static synthetic getEnableOverviewInWindow$annotations()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final getEnableOverviewInWindow()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->enableLauncherOverviewInWindow:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->enableFallbackOverviewInWindow:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    sget-object p0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->enableOverviewOnConnectedDisplays:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method
