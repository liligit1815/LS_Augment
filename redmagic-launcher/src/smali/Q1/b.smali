.class public LQ1/b;
.super Lcom/android/launcher3/V3;
.source "HintState.java"


# static fields
.field private static final D:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Lcom/android/launcher3/V3;->f:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    sget v1, Lcom/android/launcher3/V3;->i:I

    .line 6
    .line 7
    or-int/2addr v0, v1

    .line 8
    sput v0, LQ1/b;->D:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, p1, v0}, LQ1/b;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 2
    sget v0, LQ1/b;->D:I

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/V3;-><init>(III)V

    return-void
.end method


# virtual methods
.method protected g(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->k()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->y()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->y1()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->z1()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string p1, "getDepthUnchecked isInAIFutureWidgetScreen return 1f, isInAIFutureWidgetScreen="

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->y()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "LauncherState_Hit"

    .line 67
    .line 68
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    const/high16 p0, 0x3f800000    # 1.0f

    .line 72
    .line 73
    return p0

    .line 74
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_2

    .line 79
    .line 80
    const p0, 0x3d4ccccd    # 0.05f

    .line 81
    .line 82
    .line 83
    return p0

    .line 84
    :cond_2
    const p0, 0x3e19999a    # 0.15f

    .line 85
    .line 86
    .line 87
    return p0
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    const/16 p0, 0x50

    .line 2
    .line 3
    return p0
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 1

    .line 1
    new-instance p0, Lcom/android/launcher3/V3$h;

    .line 2
    .line 3
    const p1, 0x3f6b851f    # 0.92f

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, p1, v0, v0}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method
