.class Lcom/android/launcher3/q5$H;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/q5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "H"
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final b:Landroid/graphics/Rect;

.field private final c:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/q5$H;->b:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/q5$H;->c:Landroid/graphics/Rect;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/q5$H;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method a(Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;ZLandroid/graphics/RectF;)V
    .locals 3

    .line 1
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/WindowConfiguration;->getRotation()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/android/launcher3/q5$H;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget v1, v0, Lcom/android/launcher3/h0;->X0:I

    .line 16
    .line 17
    invoke-static {p1, v1}, Landroid/util/RotationUtils;->deltaRotation(II)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget v1, v0, Lcom/android/launcher3/h0;->X0:I

    .line 23
    .line 24
    invoke-static {v1, p1}, Landroid/util/RotationUtils;->deltaRotation(II)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    :goto_0
    if-eqz p1, :cond_3

    .line 29
    .line 30
    rem-int/lit8 v1, p1, 0x2

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    if-eqz p3, :cond_2

    .line 36
    .line 37
    iget p3, v0, Lcom/android/launcher3/h0;->X0:I

    .line 38
    .line 39
    if-eqz p3, :cond_1

    .line 40
    .line 41
    const/4 v1, 0x2

    .line 42
    if-ne p3, v1, :cond_2

    .line 43
    .line 44
    :cond_1
    iget-object p3, p0, Lcom/android/launcher3/q5$H;->b:Landroid/graphics/Rect;

    .line 45
    .line 46
    iget v1, v0, Lcom/android/launcher3/h0;->U0:I

    .line 47
    .line 48
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 49
    .line 50
    invoke-virtual {p3, v2, v2, v1, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    iget-object p3, p0, Lcom/android/launcher3/q5$H;->b:Landroid/graphics/Rect;

    .line 55
    .line 56
    iget v1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 57
    .line 58
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 59
    .line 60
    invoke-virtual {p3, v2, v2, v1, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 61
    .line 62
    .line 63
    :goto_1
    iget-object p3, p0, Lcom/android/launcher3/q5$H;->c:Landroid/graphics/Rect;

    .line 64
    .line 65
    invoke-virtual {p2, p3}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/android/launcher3/q5$H;->c:Landroid/graphics/Rect;

    .line 69
    .line 70
    iget-object p3, p0, Lcom/android/launcher3/q5$H;->b:Landroid/graphics/Rect;

    .line 71
    .line 72
    invoke-static {p2, p3, p1}, Landroid/util/RotationUtils;->rotateBounds(Landroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/launcher3/q5$H;->c:Landroid/graphics/Rect;

    .line 76
    .line 77
    invoke-virtual {p4, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    invoke-virtual {p4, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
