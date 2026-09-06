.class public final Lcom/android/quickstep/FullscreenDrawParams$Companion;
.super Ljava/lang/Object;
.source "FullscreenDrawParams.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/FullscreenDrawParams;
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
    invoke-direct {p0}, Lcom/android/quickstep/FullscreenDrawParams$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$computeTaskCornerRadius(Lcom/android/quickstep/FullscreenDrawParams$Companion;Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/FullscreenDrawParams$Companion;->computeTaskCornerRadius(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$computeWindowCornerRadius(Lcom/android/quickstep/FullscreenDrawParams$Companion;Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/FullscreenDrawParams$Companion;->computeWindowCornerRadius(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final computeTaskCornerRadius(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/util/TaskCornerRadius;->get(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final computeWindowCornerRadius(Landroid/content/Context;)F
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/views/k;->Q(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    if-ne p0, v0, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->D(Landroid/content/Context;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const p1, 0x7f0709d5

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    int-to-float p0, p0

    .line 38
    return p0

    .line 39
    :cond_0
    invoke-static {p1}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method
