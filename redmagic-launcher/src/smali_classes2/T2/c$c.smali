.class public final LT2/c$c;
.super Ljava/lang/Object;
.source "SplashScreenExitAnimationUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LT2/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field private final a:F

.field private final b:F

.field private final c:Landroid/view/View;

.field private final d:Landroid/view/SyncRtSurfaceTransactionApplier;

.field private final e:Landroid/graphics/Matrix;

.field private final f:Landroid/view/SurfaceControl;

.field private final g:Landroid/view/ViewGroup;

.field private final h:Lcom/android/wm/shell/shared/m;

.field private final i:Landroid/graphics/Rect;

.field private final j:I


# direct methods
.method public constructor <init>(FFLandroid/view/View;Landroid/view/SurfaceControl;Landroid/view/ViewGroup;Lcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IF)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LT2/c$c;->e:Landroid/graphics/Matrix;

    .line 10
    .line 11
    iget p1, p7, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    int-to-float v0, p1

    .line 14
    int-to-float p1, p1

    .line 15
    invoke-static {p1, p9}, Ljava/lang/Math;->max(FF)F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    sub-float/2addr v0, p1

    .line 20
    iput v0, p0, LT2/c$c;->a:F

    .line 21
    .line 22
    iput p2, p0, LT2/c$c;->b:F

    .line 23
    .line 24
    iput-object p3, p0, LT2/c$c;->c:Landroid/view/View;

    .line 25
    .line 26
    new-instance p1, Landroid/view/SyncRtSurfaceTransactionApplier;

    .line 27
    .line 28
    invoke-direct {p1, p3}, Landroid/view/SyncRtSurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, LT2/c$c;->d:Landroid/view/SyncRtSurfaceTransactionApplier;

    .line 32
    .line 33
    iput-object p4, p0, LT2/c$c;->f:Landroid/view/SurfaceControl;

    .line 34
    .line 35
    iput-object p5, p0, LT2/c$c;->g:Landroid/view/ViewGroup;

    .line 36
    .line 37
    iput-object p6, p0, LT2/c$c;->h:Lcom/android/wm/shell/shared/m;

    .line 38
    .line 39
    iput-object p7, p0, LT2/c$c;->i:Landroid/graphics/Rect;

    .line 40
    .line 41
    iput p8, p0, LT2/c$c;->j:I

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method a()V
    .locals 5

    .line 1
    iget-object v0, p0, LT2/c$c;->f:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, LT2/c$c;->h:Lcom/android/wm/shell/shared/m;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/wm/shell/shared/m;->a()Landroid/view/SurfaceControl$Transaction;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, LT2/c$c;->g:Landroid/view/ViewGroup;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Landroid/view/Choreographer;->getSfInstance()Landroid/view/Choreographer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/view/Choreographer;->getVsyncId()J

    .line 32
    .line 33
    .line 34
    move-result-wide v3

    .line 35
    invoke-virtual {v0, v3, v4}, Landroid/view/SurfaceControl$Transaction;->setFrameTimelineVsync(J)Landroid/view/SurfaceControl$Transaction;

    .line 36
    .line 37
    .line 38
    new-instance v1, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 39
    .line 40
    iget-object v3, p0, LT2/c$c;->f:Landroid/view/SurfaceControl;

    .line 41
    .line 42
    invoke-direct {v1, v3}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;-><init>(Landroid/view/SurfaceControl;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withWindowCrop(Landroid/graphics/Rect;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, v0}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withMergeTransaction(Landroid/view/SurfaceControl$Transaction;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->build()Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v3, p0, LT2/c$c;->d:Landroid/view/SyncRtSurfaceTransactionApplier;

    .line 58
    .line 59
    filled-new-array {v1}, [Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v3, v1}, Landroid/view/SyncRtSurfaceTransactionApplier;->scheduleApply([Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    iget-object v1, p0, LT2/c$c;->f:Landroid/view/SurfaceControl;

    .line 68
    .line 69
    invoke-virtual {v0, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setWindowCrop(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)Landroid/view/SurfaceControl$Transaction;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 73
    .line 74
    .line 75
    :goto_0
    iget-object v1, p0, LT2/c$c;->h:Lcom/android/wm/shell/shared/m;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Lcom/android/wm/shell/shared/m;->b(Landroid/view/SurfaceControl$Transaction;)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Landroid/view/Choreographer;->getSfInstance()Landroid/view/Choreographer;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object p0, p0, LT2/c$c;->f:Landroid/view/SurfaceControl;

    .line 85
    .line 86
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    new-instance v1, LT2/d;

    .line 90
    .line 91
    invoke-direct {v1, p0}, LT2/d;-><init>(Landroid/view/SurfaceControl;)V

    .line 92
    .line 93
    .line 94
    const/4 p0, 0x4

    .line 95
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/Choreographer;->postCallback(ILjava/lang/Runnable;Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    :goto_1
    return-void
.end method

.method b(F)V
    .locals 4

    .line 1
    iget-object v0, p0, LT2/c$c;->f:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, LT2/c$c;->g:Landroid/view/ViewGroup;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, LT2/c;->d()Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget v0, p0, LT2/c$c;->a:F

    .line 29
    .line 30
    iget v1, p0, LT2/c$c;->b:F

    .line 31
    .line 32
    sub-float/2addr v1, v0

    .line 33
    mul-float/2addr v1, p1

    .line 34
    add-float/2addr v0, v1

    .line 35
    iget-object p1, p0, LT2/c$c;->c:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, LT2/c$c;->e:Landroid/graphics/Matrix;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, LT2/c$c;->h:Lcom/android/wm/shell/shared/m;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/m;->a()Landroid/view/SurfaceControl$Transaction;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {}, Landroid/view/Choreographer;->getSfInstance()Landroid/view/Choreographer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Landroid/view/Choreographer;->getVsyncId()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    invoke-virtual {p1, v0, v1}, Landroid/view/SurfaceControl$Transaction;->setFrameTimelineVsync(J)Landroid/view/SurfaceControl$Transaction;

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, LT2/c$c;->e:Landroid/graphics/Matrix;

    .line 64
    .line 65
    iget-object v1, p0, LT2/c$c;->i:Landroid/graphics/Rect;

    .line 66
    .line 67
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 68
    .line 69
    int-to-float v2, v2

    .line 70
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 71
    .line 72
    iget v3, p0, LT2/c$c;->j:I

    .line 73
    .line 74
    add-int/2addr v1, v3

    .line 75
    int-to-float v1, v1

    .line 76
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 77
    .line 78
    .line 79
    new-instance v0, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 80
    .line 81
    iget-object v1, p0, LT2/c$c;->f:Landroid/view/SurfaceControl;

    .line 82
    .line 83
    invoke-direct {v0, v1}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;-><init>(Landroid/view/SurfaceControl;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, LT2/c$c;->e:Landroid/graphics/Matrix;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withMatrix(Landroid/graphics/Matrix;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0, p1}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withMergeTransaction(Landroid/view/SurfaceControl$Transaction;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->build()Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v1, p0, LT2/c$c;->d:Landroid/view/SyncRtSurfaceTransactionApplier;

    .line 101
    .line 102
    filled-new-array {v0}, [Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v1, v0}, Landroid/view/SyncRtSurfaceTransactionApplier;->scheduleApply([Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, LT2/c$c;->h:Lcom/android/wm/shell/shared/m;

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/shared/m;->b(Landroid/view/SurfaceControl$Transaction;)V

    .line 112
    .line 113
    .line 114
    :cond_1
    :goto_0
    return-void
.end method
