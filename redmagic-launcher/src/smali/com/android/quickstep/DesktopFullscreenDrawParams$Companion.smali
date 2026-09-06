.class public final Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;
.super Ljava/lang/Object;
.source "DesktopFullscreenDrawParams.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/DesktopFullscreenDrawParams;
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
    invoke-direct {p0}, Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$computeCornerRadius(Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;->computeCornerRadius(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final computeCornerRadius(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const p1, 0x7f0702a8

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method
