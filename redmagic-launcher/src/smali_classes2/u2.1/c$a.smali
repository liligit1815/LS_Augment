.class public final Lu2/c$a;
.super Ljava/lang/Object;
.source "ActivityTransitionAnimator.kt"

# interfaces
.implements Lu2/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lu2/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lu2/l<",
        "Landroid/view/IRemoteAnimationFinishedCallback;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Ljava/util/concurrent/Executor;

.field private final b:Lu2/c$d;

.field private final c:Lu2/c$b;

.field private final d:Lu2/c$e;

.field private final e:Lu2/F;

.field private final f:Z

.field private final g:Landroid/view/ViewGroup;

.field private final h:Landroid/content/Context;

.field private final i:Landroid/view/View;

.field private final j:Landroid/view/SyncRtSurfaceTransactionApplier;

.field private final k:Landroid/os/Handler;

.field private final l:Landroid/graphics/Matrix;

.field private final m:Landroid/graphics/Matrix;

.field private n:Landroid/graphics/Rect;

.field private o:Landroid/graphics/RectF;

.field private p:Z

.field private q:Z

.field private r:Lu2/F$a;

.field private s:Z

.field private t:Ljava/lang/Runnable;

.field private u:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Lu2/c$d;Lu2/c$b;Lu2/c$e;)V
    .locals 11

    .line 1
    const-string v0, "mainExecutor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "controller"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v9, 0x70

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v10}, Lu2/c$a;-><init>(Ljava/util/concurrent/Executor;Lu2/c$d;Lu2/c$b;Lu2/c$e;Lu2/F;ZZILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lu2/c$d;Lu2/c$b;Lu2/c$e;Lu2/F;ZZ)V
    .locals 1

    const-string v0, "mainExecutor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "controller"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transitionAnimator"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lu2/c$a;->a:Ljava/util/concurrent/Executor;

    .line 4
    iput-object p2, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 5
    iput-object p3, p0, Lu2/c$a;->c:Lu2/c$b;

    .line 6
    iput-object p4, p0, Lu2/c$a;->d:Lu2/c$e;

    .line 7
    iput-object p5, p0, Lu2/c$a;->e:Lu2/F;

    .line 8
    iput-boolean p7, p0, Lu2/c$a;->f:Z

    .line 9
    invoke-interface {p2}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    move-result-object p1

    iput-object p1, p0, Lu2/c$a;->g:Landroid/view/ViewGroup;

    .line 10
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lu2/c$a;->h:Landroid/content/Context;

    .line 11
    invoke-interface {p2}, Lu2/F$c;->h()Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-interface {p2}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    move-result-object p1

    :cond_0
    iput-object p1, p0, Lu2/c$a;->i:Landroid/view/View;

    .line 12
    new-instance p3, Landroid/view/SyncRtSurfaceTransactionApplier;

    invoke-direct {p3, p1}, Landroid/view/SyncRtSurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    iput-object p3, p0, Lu2/c$a;->j:Landroid/view/SyncRtSurfaceTransactionApplier;

    if-nez p6, :cond_1

    .line 13
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    invoke-direct {p1, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 14
    :goto_0
    iput-object p1, p0, Lu2/c$a;->k:Landroid/os/Handler;

    .line 15
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 16
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lu2/c$a;->m:Landroid/graphics/Matrix;

    .line 17
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lu2/c$a;->n:Landroid/graphics/Rect;

    .line 18
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lu2/c$a;->o:Landroid/graphics/RectF;

    .line 19
    new-instance p1, Lu2/a;

    invoke-direct {p1, p0}, Lu2/a;-><init>(Lu2/c$a;)V

    iput-object p1, p0, Lu2/c$a;->t:Ljava/lang/Runnable;

    .line 20
    new-instance p1, Lu2/b;

    invoke-direct {p1}, Lu2/b;-><init>()V

    iput-object p1, p0, Lu2/c$a;->u:Ljava/lang/Runnable;

    .line 21
    invoke-interface {p2}, Lu2/F$c;->d()Z

    move-result p0

    if-nez p0, :cond_2

    sget-object p0, Lu2/F;->i:Lu2/F$b;

    invoke-virtual {p0}, Lu2/F$b;->c()V

    :cond_2
    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Lu2/c$d;Lu2/c$b;Lu2/c$e;Lu2/F;ZZILkotlin/jvm/internal/j;)V
    .locals 8

    and-int/lit8 v0, p8, 0x8

    if-eqz v0, :cond_0

    const/4 p4, 0x0

    :cond_0
    move-object v4, p4

    and-int/lit8 p4, p8, 0x10

    if-eqz p4, :cond_1

    .line 22
    sget-object p4, Lu2/c;->a:Lu2/c$c;

    invoke-static {p4, p1}, Lu2/c$c;->a(Lu2/c$c;Ljava/util/concurrent/Executor;)Lu2/F;

    move-result-object p5

    :cond_1
    move-object v5, p5

    and-int/lit8 p4, p8, 0x20

    const/4 p5, 0x0

    if-eqz p4, :cond_2

    move v6, p5

    goto :goto_0

    :cond_2
    move v6, p6

    :goto_0
    and-int/lit8 p4, p8, 0x40

    if-eqz p4, :cond_3

    move v7, p5

    :goto_1
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    goto :goto_2

    :cond_3
    move v7, p7

    goto :goto_1

    .line 23
    :goto_2
    invoke-direct/range {v0 .. v7}, Lu2/c$a;-><init>(Ljava/util/concurrent/Executor;Lu2/c$d;Lu2/c$b;Lu2/c$e;Lu2/F;ZZ)V

    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    invoke-static {}, Lu2/c$a;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lu2/c$a;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lu2/c$a;->r(Lu2/c$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic c(Lu2/c$a;Landroid/view/RemoteAnimationTarget;Lu2/F$k;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lu2/c$a;->h(Landroid/view/RemoteAnimationTarget;Lu2/F$k;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic d(Lu2/c$a;Landroid/view/RemoteAnimationTarget;Lu2/F$k;FZLandroid/view/SurfaceControl$Transaction;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lu2/c$a;->i(Landroid/view/RemoteAnimationTarget;Lu2/F$k;FZLandroid/view/SurfaceControl$Transaction;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic e(Lu2/c$a;)Lu2/c$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/c$a;->d:Lu2/c$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic f(Lu2/c$a;Z)F
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lu2/c$a;->m(Z)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic g(Lu2/c$a;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lu2/c$a;->o(Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final h(Landroid/view/RemoteAnimationTarget;Lu2/F$k;F)V
    .locals 8

    .line 1
    iget-object v0, p0, Lu2/c$a;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    sget-object v1, Lu2/F;->i:Lu2/F$b;

    .line 20
    .line 21
    sget-object v2, Lu2/c;->b:Lu2/F$l;

    .line 22
    .line 23
    invoke-static {}, Lu2/c;->a()J

    .line 24
    .line 25
    .line 26
    move-result-wide v4

    .line 27
    const-wide/16 v6, 0x85

    .line 28
    .line 29
    move v3, p3

    .line 30
    invoke-virtual/range {v1 .. v7}, Lu2/F$b;->e(Lu2/F$l;FJJ)F

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    new-instance v0, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 35
    .line 36
    iget-object v4, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 37
    .line 38
    invoke-direct {v0, v4}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;-><init>(Landroid/view/SurfaceControl;)V

    .line 39
    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    cmpl-float v5, p3, v4

    .line 43
    .line 44
    if-lez v5, :cond_1

    .line 45
    .line 46
    iget-object v1, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 52
    .line 53
    invoke-virtual {p2}, Lu2/F$k;->h()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->sourceContainerBounds:Landroid/graphics/Rect;

    .line 58
    .line 59
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    sub-int/2addr v2, p1

    .line 62
    int-to-float p1, v2

    .line 63
    invoke-virtual {v1, v4, p1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lu2/c$a;->n:Landroid/graphics/Rect;

    .line 67
    .line 68
    invoke-virtual {p2}, Lu2/F$k;->f()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {p2}, Lu2/F$k;->g()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual {p2}, Lu2/F$k;->e()I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    const/4 v3, 0x0

    .line 81
    invoke-virtual {p1, v1, v3, v2, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Lu2/c;->c()Landroid/view/animation/Interpolator;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-interface {p1, p3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    invoke-virtual {v0, p1}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withAlpha(F)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iget-object p2, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 97
    .line 98
    invoke-virtual {p1, p2}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withMatrix(Landroid/graphics/Matrix;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-object p2, p0, Lu2/c$a;->n:Landroid/graphics/Rect;

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withWindowCrop(Landroid/graphics/Rect;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    const/4 p2, 0x1

    .line 109
    invoke-virtual {p1, p2}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withVisibility(Z)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    const-wide/16 v4, 0x0

    .line 114
    .line 115
    const-wide/16 v6, 0x85

    .line 116
    .line 117
    invoke-virtual/range {v1 .. v7}, Lu2/F$b;->e(Lu2/F$l;FJJ)F

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    invoke-static {}, Lu2/c;->d()Landroid/view/animation/PathInterpolator;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p2, p1}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    const/high16 p2, 0x3f800000    # 1.0f

    .line 130
    .line 131
    sub-float/2addr p2, p1

    .line 132
    invoke-virtual {v0, p2}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withAlpha(F)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 133
    .line 134
    .line 135
    :goto_0
    iget-object p0, p0, Lu2/c$a;->j:Landroid/view/SyncRtSurfaceTransactionApplier;

    .line 136
    .line 137
    invoke-virtual {v0}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->build()Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    filled-new-array {p1}, [Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, Landroid/view/SyncRtSurfaceTransactionApplier;->scheduleApply([Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;)V

    .line 146
    .line 147
    .line 148
    :cond_2
    :goto_1
    return-void
.end method

.method private final i(Landroid/view/RemoteAnimationTarget;Lu2/F$k;FZLandroid/view/SurfaceControl$Transaction;)V
    .locals 14

    .line 1
    move-object/from16 v1, p5

    .line 2
    .line 3
    iget-object v2, p0, Lu2/c$a;->i:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    if-eqz v2, :cond_8

    .line 10
    .line 11
    iget-object v2, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/view/SurfaceControl;->isValid()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    goto/16 :goto_6

    .line 20
    .line 21
    :cond_0
    iget-object v2, p1, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 22
    .line 23
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    iget v4, v2, Landroid/graphics/Rect;->right:I

    .line 26
    .line 27
    add-int v5, v3, v4

    .line 28
    .line 29
    int-to-float v5, v5

    .line 30
    const/high16 v6, 0x40000000    # 2.0f

    .line 31
    .line 32
    div-float/2addr v5, v6

    .line 33
    iget v7, v2, Landroid/graphics/Rect;->top:I

    .line 34
    .line 35
    iget v8, v2, Landroid/graphics/Rect;->bottom:I

    .line 36
    .line 37
    add-int v9, v7, v8

    .line 38
    .line 39
    int-to-float v9, v9

    .line 40
    div-float/2addr v9, v6

    .line 41
    sub-int/2addr v4, v3

    .line 42
    sub-int/2addr v8, v7

    .line 43
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->k()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    int-to-float v3, v3

    .line 48
    int-to-float v4, v4

    .line 49
    div-float/2addr v3, v4

    .line 50
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->e()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    int-to-float v4, v4

    .line 55
    int-to-float v7, v8

    .line 56
    div-float/2addr v4, v7

    .line 57
    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    iget-object v4, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/graphics/Matrix;->reset()V

    .line 64
    .line 65
    .line 66
    iget-object v4, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 67
    .line 68
    invoke-virtual {v4, v3, v3, v5, v9}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 69
    .line 70
    .line 71
    mul-float v4, v7, v3

    .line 72
    .line 73
    sub-float/2addr v4, v7

    .line 74
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->c()F

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    sub-float/2addr v7, v5

    .line 79
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->h()I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    iget v8, v2, Landroid/graphics/Rect;->top:I

    .line 84
    .line 85
    sub-int/2addr v5, v8

    .line 86
    int-to-float v5, v5

    .line 87
    div-float/2addr v4, v6

    .line 88
    add-float/2addr v5, v4

    .line 89
    iget-object v4, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 90
    .line 91
    invoke-virtual {v4, v7, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->f()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    int-to-float v4, v4

    .line 99
    iget v5, v2, Landroid/graphics/Rect;->left:I

    .line 100
    .line 101
    int-to-float v5, v5

    .line 102
    sub-float/2addr v4, v5

    .line 103
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->h()I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    int-to-float v5, v5

    .line 108
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 109
    .line 110
    int-to-float v2, v2

    .line 111
    sub-float/2addr v5, v2

    .line 112
    iget-object v2, p0, Lu2/c$a;->o:Landroid/graphics/RectF;

    .line 113
    .line 114
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->k()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    int-to-float v6, v6

    .line 119
    add-float/2addr v6, v4

    .line 120
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->e()I

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    int-to-float v7, v7

    .line 125
    add-float/2addr v7, v5

    .line 126
    invoke-virtual {v2, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 130
    .line 131
    iget-object v4, p0, Lu2/c$a;->m:Landroid/graphics/Matrix;

    .line 132
    .line 133
    invoke-virtual {v2, v4}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 134
    .line 135
    .line 136
    iget-object v2, p0, Lu2/c$a;->m:Landroid/graphics/Matrix;

    .line 137
    .line 138
    iget-object v4, p0, Lu2/c$a;->o:Landroid/graphics/RectF;

    .line 139
    .line 140
    invoke-virtual {v2, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, Lu2/c$a;->n:Landroid/graphics/Rect;

    .line 144
    .line 145
    iget-object v4, p0, Lu2/c$a;->o:Landroid/graphics/RectF;

    .line 146
    .line 147
    iget v4, v4, Landroid/graphics/RectF;->left:F

    .line 148
    .line 149
    invoke-static {v4}, Lx4/a;->a(F)I

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    iget-object v5, p0, Lu2/c$a;->o:Landroid/graphics/RectF;

    .line 154
    .line 155
    iget v5, v5, Landroid/graphics/RectF;->top:F

    .line 156
    .line 157
    invoke-static {v5}, Lx4/a;->a(F)I

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    iget-object v6, p0, Lu2/c$a;->o:Landroid/graphics/RectF;

    .line 162
    .line 163
    iget v6, v6, Landroid/graphics/RectF;->right:F

    .line 164
    .line 165
    invoke-static {v6}, Lx4/a;->a(F)I

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    iget-object v7, p0, Lu2/c$a;->o:Landroid/graphics/RectF;

    .line 170
    .line 171
    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    .line 172
    .line 173
    invoke-static {v7}, Lx4/a;->a(F)I

    .line 174
    .line 175
    .line 176
    move-result v7

    .line 177
    invoke-virtual {v2, v4, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 178
    .line 179
    .line 180
    if-eqz p4, :cond_2

    .line 181
    .line 182
    iget-object v2, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 183
    .line 184
    invoke-interface {v2}, Lu2/F$c;->d()Z

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    if-eqz v2, :cond_1

    .line 189
    .line 190
    sget-object v2, Lu2/c;->a:Lu2/c$c;

    .line 191
    .line 192
    invoke-virtual {v2}, Lu2/c$c;->e()Lu2/F$j;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    invoke-virtual {v4}, Lu2/F$j;->a()F

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    invoke-virtual {v2}, Lu2/c$c;->e()Lu2/F$j;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v2}, Lu2/F$j;->b()F

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    goto :goto_0

    .line 209
    :cond_1
    sget-object v2, Lu2/c;->a:Lu2/c$c;

    .line 210
    .line 211
    invoke-virtual {v2}, Lu2/c$c;->e()Lu2/F$j;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    invoke-virtual {v4}, Lu2/F$j;->c()F

    .line 216
    .line 217
    .line 218
    move-result v4

    .line 219
    invoke-virtual {v2}, Lu2/c$c;->e()Lu2/F$j;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-virtual {v2}, Lu2/F$j;->d()F

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    :goto_0
    sget-object v5, Lu2/c;->a:Lu2/c$c;

    .line 228
    .line 229
    invoke-virtual {v5}, Lu2/c$c;->d()Lu2/F$e;

    .line 230
    .line 231
    .line 232
    move-result-object v5

    .line 233
    sget-object v6, Lu2/F;->i:Lu2/F$b;

    .line 234
    .line 235
    move/from16 v9, p3

    .line 236
    .line 237
    invoke-virtual {v6, v9, v4, v2}, Lu2/F$b;->f(FFF)F

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    goto :goto_3

    .line 242
    :cond_2
    move/from16 v9, p3

    .line 243
    .line 244
    iget-object v2, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 245
    .line 246
    invoke-interface {v2}, Lu2/F$c;->d()Z

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    if-eqz v2, :cond_3

    .line 251
    .line 252
    sget-object v2, Lu2/c;->b:Lu2/F$l;

    .line 253
    .line 254
    invoke-virtual {v2}, Lu2/F$l;->c()J

    .line 255
    .line 256
    .line 257
    move-result-wide v4

    .line 258
    invoke-virtual {v2}, Lu2/F$l;->d()J

    .line 259
    .line 260
    .line 261
    move-result-wide v6

    .line 262
    :goto_1
    move-wide v10, v4

    .line 263
    move-wide v12, v6

    .line 264
    goto :goto_2

    .line 265
    :cond_3
    sget-object v2, Lu2/c;->b:Lu2/F$l;

    .line 266
    .line 267
    invoke-virtual {v2}, Lu2/F$l;->e()J

    .line 268
    .line 269
    .line 270
    move-result-wide v4

    .line 271
    invoke-virtual {v2}, Lu2/F$l;->f()J

    .line 272
    .line 273
    .line 274
    move-result-wide v6

    .line 275
    goto :goto_1

    .line 276
    :goto_2
    sget-object v2, Lu2/c;->a:Lu2/c$c;

    .line 277
    .line 278
    invoke-virtual {v2}, Lu2/c$c;->c()Lu2/F$e;

    .line 279
    .line 280
    .line 281
    move-result-object v5

    .line 282
    sget-object v7, Lu2/F;->i:Lu2/F$b;

    .line 283
    .line 284
    sget-object v8, Lu2/c;->b:Lu2/F$l;

    .line 285
    .line 286
    invoke-virtual/range {v7 .. v13}, Lu2/F$b;->e(Lu2/F$l;FJJ)F

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    :goto_3
    iget-boolean v4, p0, Lu2/c$a;->s:Z

    .line 291
    .line 292
    const/4 v6, 0x1

    .line 293
    if-nez v4, :cond_5

    .line 294
    .line 295
    iget-object v4, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 296
    .line 297
    invoke-interface {v4}, Lu2/c$d;->b()Z

    .line 298
    .line 299
    .line 300
    move-result v4

    .line 301
    if-eqz v4, :cond_4

    .line 302
    .line 303
    goto :goto_4

    .line 304
    :cond_4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 305
    .line 306
    goto :goto_5

    .line 307
    :cond_5
    :goto_4
    iget-object v4, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 308
    .line 309
    invoke-interface {v4}, Lu2/F$c;->d()Z

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    if-eqz v4, :cond_6

    .line 314
    .line 315
    invoke-virtual {v5}, Lu2/F$e;->c()Landroid/view/animation/Interpolator;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    invoke-interface {v4, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 320
    .line 321
    .line 322
    move-result v2

    .line 323
    goto :goto_5

    .line 324
    :cond_6
    int-to-float v4, v6

    .line 325
    invoke-virtual {v5}, Lu2/F$e;->d()Landroid/view/animation/Interpolator;

    .line 326
    .line 327
    .line 328
    move-result-object v5

    .line 329
    invoke-interface {v5, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 330
    .line 331
    .line 332
    move-result v2

    .line 333
    sub-float v2, v4, v2

    .line 334
    .line 335
    :goto_5
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->i()F

    .line 336
    .line 337
    .line 338
    move-result v4

    .line 339
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->b()F

    .line 340
    .line 341
    .line 342
    move-result v5

    .line 343
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    .line 344
    .line 345
    .line 346
    move-result v4

    .line 347
    div-float/2addr v4, v3

    .line 348
    new-instance v3, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 349
    .line 350
    iget-object v0, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 351
    .line 352
    invoke-direct {v3, v0}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;-><init>(Landroid/view/SurfaceControl;)V

    .line 353
    .line 354
    .line 355
    invoke-virtual {v3, v2}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withAlpha(F)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    iget-object v2, p0, Lu2/c$a;->l:Landroid/graphics/Matrix;

    .line 360
    .line 361
    invoke-virtual {v0, v2}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withMatrix(Landroid/graphics/Matrix;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    iget-object v2, p0, Lu2/c$a;->n:Landroid/graphics/Rect;

    .line 366
    .line 367
    invoke-virtual {v0, v2}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withWindowCrop(Landroid/graphics/Rect;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    invoke-virtual {v0, v4}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withCornerRadius(F)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-virtual {v0, v6}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withVisibility(Z)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    if-eqz v1, :cond_7

    .line 380
    .line 381
    invoke-virtual {v0, v1}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->withMergeTransaction(Landroid/view/SurfaceControl$Transaction;)Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;

    .line 382
    .line 383
    .line 384
    :cond_7
    iget-object p0, p0, Lu2/c$a;->j:Landroid/view/SyncRtSurfaceTransactionApplier;

    .line 385
    .line 386
    invoke-virtual {v0}, Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams$Builder;->build()Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    filled-new-array {v0}, [Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    invoke-virtual {p0, v0}, Landroid/view/SyncRtSurfaceTransactionApplier;->scheduleApply([Landroid/view/SyncRtSurfaceTransactionApplier$SurfaceParams;)V

    .line 395
    .line 396
    .line 397
    :cond_8
    :goto_6
    return-void
.end method

.method static synthetic j(Lu2/c$a;Landroid/view/RemoteAnimationTarget;Lu2/F$k;FZLandroid/view/SurfaceControl$Transaction;ILjava/lang/Object;)V
    .locals 6

    .line 1
    and-int/lit8 p6, p6, 0x10

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    const/4 p5, 0x0

    .line 6
    :cond_0
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v3, p3

    .line 10
    move v4, p4

    .line 11
    move-object v5, p5

    .line 12
    invoke-direct/range {v0 .. v5}, Lu2/c$a;->i(Landroid/view/RemoteAnimationTarget;Lu2/F$k;FZLandroid/view/SurfaceControl$Transaction;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private final k([Landroid/view/RemoteAnimationTarget;)Landroid/view/RemoteAnimationTarget;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 6
    .line 7
    invoke-interface {v1}, Lu2/F$c;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    xor-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    invoke-static {p1}, Lkotlin/jvm/internal/d;->a([Ljava/lang/Object;)Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_7

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/view/RemoteAnimationTarget;

    .line 28
    .line 29
    iget v3, v2, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 30
    .line 31
    if-ne v3, v1, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lcom/android/systemui/Flags;->activityTransitionUseLargestWindow()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_4

    .line 38
    .line 39
    sget-object v3, Lu2/F;->i:Lu2/F$b;

    .line 40
    .line 41
    invoke-virtual {v3}, Lu2/F$b;->i()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    iget-object v3, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 48
    .line 49
    invoke-interface {v3}, Lu2/c$d;->f()Lu2/c$f;

    .line 50
    .line 51
    .line 52
    :cond_2
    if-eqz v0, :cond_6

    .line 53
    .line 54
    iget-boolean v3, v2, Landroid/view/RemoteAnimationTarget;->hasAnimatingParent:Z

    .line 55
    .line 56
    if-nez v3, :cond_3

    .line 57
    .line 58
    iget-boolean v4, v0, Landroid/view/RemoteAnimationTarget;->hasAnimatingParent:Z

    .line 59
    .line 60
    if-eqz v4, :cond_3

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    if-nez v3, :cond_1

    .line 64
    .line 65
    iget-object v3, v2, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 66
    .line 67
    const-string v4, "screenSpaceBounds"

    .line 68
    .line 69
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v5, v0, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 73
    .line 74
    invoke-static {v5, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0, v3, v5}, Lu2/c$a;->n(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-eqz v3, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    iget-boolean v3, v2, Landroid/view/RemoteAnimationTarget;->hasAnimatingParent:Z

    .line 85
    .line 86
    if-nez v3, :cond_5

    .line 87
    .line 88
    return-object v2

    .line 89
    :cond_5
    if-nez v0, :cond_1

    .line 90
    .line 91
    :cond_6
    :goto_1
    move-object v0, v2

    .line 92
    goto :goto_0

    .line 93
    :cond_7
    return-object v0
.end method

.method private final m(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lu2/c$a;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/internal/policy/ScreenDecorationsUtils;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method private final n(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    mul-int/2addr p0, p1

    .line 10
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    mul-int/2addr p1, p2

    .line 19
    if-le p0, p1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private final o(Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-interface {p1}, Landroid/view/IRemoteAnimationFinishedCallback;->onAnimationFinished()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final p()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lu2/c$a;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "Remote animation timed out"

    .line 7
    .line 8
    const-string v1, "ActivityTransitionAnimator"

    .line 9
    .line 10
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lu2/c$a;->p:Z

    .line 15
    .line 16
    sget-boolean v2, Lu2/c;->g:Z

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    const-string v2, "Calling controller.onTransitionAnimationCancelled() [animation timed out]"

    .line 21
    .line 22
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v1, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-static {v1, v2, v0, v2}, Lu2/c$d;->k(Lu2/c$d;Ljava/lang/Boolean;ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lu2/c$a;->d:Lu2/c$e;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    invoke-interface {p0}, Lu2/c$e;->c()V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method private static final q()V
    .locals 2

    .line 1
    const-string v0, "ActivityTransitionAnimator"

    .line 2
    .line 3
    const-string v1, "The remote animation was neither cancelled or started within 5000"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final r(Lu2/c$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lu2/c$a;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lu2/c$a;->k:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lu2/c$a;->t:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lu2/c$a;->k:Landroid/os/Handler;

    .line 11
    .line 12
    iget-object p0, p0, Lu2/c$a;->u:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private final t([Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)Landroid/view/RemoteAnimationTarget;
    .locals 2

    .line 1
    invoke-direct {p0}, Lu2/c$a;->s()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lu2/c$a;->p:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p2}, Lu2/c$a;->o(Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object v1

    .line 15
    :cond_1
    iget-boolean v0, p0, Lu2/c$a;->q:Z

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_2
    invoke-direct {p0, p1}, Lu2/c$a;->k([Landroid/view/RemoteAnimationTarget;)Landroid/view/RemoteAnimationTarget;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-nez p1, :cond_6

    .line 25
    .line 26
    const-string p1, "Aborting the animation as no window is opening"

    .line 27
    .line 28
    const-string v0, "ActivityTransitionAnimator"

    .line 29
    .line 30
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    if-eqz p2, :cond_3

    .line 34
    .line 35
    invoke-direct {p0, p2}, Lu2/c$a;->o(Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 36
    .line 37
    .line 38
    :cond_3
    sget-boolean p1, Lu2/c;->g:Z

    .line 39
    .line 40
    if-eqz p1, :cond_4

    .line 41
    .line 42
    const-string p1, "Calling controller.onTransitionAnimationCancelled() [no window opening]"

    .line 43
    .line 44
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p1, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 48
    .line 49
    const/4 p2, 0x1

    .line 50
    invoke-static {p1, v1, p2, v1}, Lu2/c$d;->k(Lu2/c$d;Ljava/lang/Boolean;ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lu2/c$a;->d:Lu2/c$e;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    invoke-interface {p0}, Lu2/c$e;->c()V

    .line 58
    .line 59
    .line 60
    :cond_5
    return-object v1

    .line 61
    :cond_6
    return-object p1
.end method

.method private final u(Landroid/view/RemoteAnimationTarget;Landroid/view/RemoteAnimationTarget;ZLandroid/window/WindowAnimationState;Landroid/view/SurfaceControl$Transaction;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 17

    .line 1
    move-object/from16 v2, p0

    .line 2
    .line 3
    move-object/from16 v7, p1

    .line 4
    .line 5
    iget-object v5, v7, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 6
    .line 7
    iget-object v0, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 8
    .line 9
    invoke-interface {v0}, Lu2/F$c;->d()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 16
    .line 17
    invoke-interface {v0}, Lu2/F$c;->a()Landroid/window/WindowAnimationState;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object v1, Lu2/F;->i:Lu2/F$b;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lu2/F$b;->j(Landroid/window/WindowAnimationState;)Lu2/F$k;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    move-object v12, v0

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    :goto_1
    new-instance v8, Lu2/F$k;

    .line 35
    .line 36
    iget v9, v5, Landroid/graphics/Rect;->top:I

    .line 37
    .line 38
    iget v10, v5, Landroid/graphics/Rect;->bottom:I

    .line 39
    .line 40
    iget v11, v5, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    iget v12, v5, Landroid/graphics/Rect;->right:I

    .line 43
    .line 44
    const/16 v15, 0x30

    .line 45
    .line 46
    const/16 v16, 0x0

    .line 47
    .line 48
    const/4 v13, 0x0

    .line 49
    const/4 v14, 0x0

    .line 50
    invoke-direct/range {v8 .. v16}, Lu2/F$k;-><init>(IIIIFFILkotlin/jvm/internal/j;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, v2, Lu2/c$a;->e:Lu2/F;

    .line 54
    .line 55
    iget-object v1, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 56
    .line 57
    invoke-interface {v1}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1, v8}, Lu2/F;->F(Landroid/view/View;Lu2/F$k;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-direct {v2, v0}, Lu2/c$a;->m(Z)F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {v8, v0}, Lu2/F$k;->q(F)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v8, v0}, Lu2/F$k;->m(F)V

    .line 73
    .line 74
    .line 75
    move-object v12, v8

    .line 76
    goto :goto_2

    .line 77
    :cond_2
    iget-object v0, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 78
    .line 79
    invoke-interface {v0}, Lu2/F$c;->e()Lu2/F$k;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    goto :goto_0

    .line 84
    :goto_2
    invoke-static {}, Lcom/android/systemui/Flags;->translucentOccludingActivityFix()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    const/4 v13, 0x0

    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    iget-boolean v0, v7, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    move v14, v13

    .line 96
    goto :goto_4

    .line 97
    :cond_3
    iget-object v0, v7, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 98
    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    iget-object v1, v2, Lu2/c$a;->c:Lu2/c$b;

    .line 102
    .line 103
    invoke-interface {v1, v0}, Lu2/c$b;->a(Landroid/app/TaskInfo;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    :goto_3
    move v14, v0

    .line 108
    goto :goto_4

    .line 109
    :cond_4
    iget v0, v7, Landroid/view/RemoteAnimationTarget;->backgroundColor:I

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :goto_4
    iget-object v0, v2, Lu2/c$a;->e:Lu2/F;

    .line 113
    .line 114
    iget-object v1, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 115
    .line 116
    invoke-interface {v1}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1, v12}, Lu2/F;->F(Landroid/view/View;Lu2/F$k;)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    if-nez p4, :cond_5

    .line 125
    .line 126
    iget-object v0, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 127
    .line 128
    invoke-interface {v0}, Lu2/F$c;->a()Landroid/window/WindowAnimationState;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    move-object v4, v0

    .line 133
    goto :goto_5

    .line 134
    :cond_5
    move-object/from16 v4, p4

    .line 135
    .line 136
    :goto_5
    iget-object v0, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 137
    .line 138
    invoke-interface {v0}, Lu2/F$c;->d()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    iget-object v1, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 143
    .line 144
    invoke-interface {v1}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 149
    .line 150
    .line 151
    move-result-object v9

    .line 152
    iget-boolean v1, v2, Lu2/c$a;->f:Z

    .line 153
    .line 154
    const/4 v15, 0x1

    .line 155
    if-nez v1, :cond_7

    .line 156
    .line 157
    iget-object v1, v7, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 158
    .line 159
    invoke-virtual {v1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_7

    .line 164
    .line 165
    if-nez v9, :cond_6

    .line 166
    .line 167
    goto :goto_6

    .line 168
    :cond_6
    move v1, v13

    .line 169
    goto :goto_7

    .line 170
    :cond_7
    :goto_6
    move v1, v15

    .line 171
    :goto_7
    invoke-static {}, Lcom/android/systemui/Flags;->moveTransitionAnimationLayer()Z

    .line 172
    .line 173
    .line 174
    move-result v6

    .line 175
    if-eqz v6, :cond_8

    .line 176
    .line 177
    if-eqz v0, :cond_8

    .line 178
    .line 179
    if-nez v1, :cond_8

    .line 180
    .line 181
    iput-boolean v15, v2, Lu2/c$a;->s:Z

    .line 182
    .line 183
    :cond_8
    iget-object v1, v2, Lu2/c$a;->b:Lu2/c$d;

    .line 184
    .line 185
    new-instance v0, Lu2/c$a$a;

    .line 186
    .line 187
    move-object/from16 v11, p2

    .line 188
    .line 189
    move/from16 v8, p3

    .line 190
    .line 191
    move-object/from16 v6, p5

    .line 192
    .line 193
    move-object/from16 v10, p6

    .line 194
    .line 195
    invoke-direct/range {v0 .. v11}, Lu2/c$a$a;-><init>(Lu2/c$d;Lu2/c$a;ZLandroid/window/WindowAnimationState;Landroid/graphics/Rect;Landroid/view/SurfaceControl$Transaction;Landroid/view/RemoteAnimationTarget;ZLandroid/view/ViewRootImpl;Landroid/view/IRemoteAnimationFinishedCallback;Landroid/view/RemoteAnimationTarget;)V

    .line 196
    .line 197
    .line 198
    sget-object v1, Lu2/F;->i:Lu2/F$b;

    .line 199
    .line 200
    invoke-virtual {v1}, Lu2/F$b;->h()Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    const/4 v3, 0x0

    .line 205
    if-eqz v1, :cond_a

    .line 206
    .line 207
    if-eqz v4, :cond_9

    .line 208
    .line 209
    iget-object v1, v4, Landroid/window/WindowAnimationState;->velocityPxPerMs:Landroid/graphics/PointF;

    .line 210
    .line 211
    goto :goto_8

    .line 212
    :cond_9
    move-object v1, v3

    .line 213
    :goto_8
    if-eqz v1, :cond_a

    .line 214
    .line 215
    iget-object v1, v4, Landroid/window/WindowAnimationState;->velocityPxPerMs:Landroid/graphics/PointF;

    .line 216
    .line 217
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 218
    .line 219
    const/16 v5, 0x3e8

    .line 220
    .line 221
    int-to-float v5, v5

    .line 222
    mul-float/2addr v3, v5

    .line 223
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 224
    .line 225
    mul-float/2addr v1, v5

    .line 226
    new-instance v5, Landroid/graphics/PointF;

    .line 227
    .line 228
    invoke-direct {v5, v3, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 229
    .line 230
    .line 231
    move-object v3, v5

    .line 232
    goto :goto_9

    .line 233
    :cond_a
    if-eqz p3, :cond_b

    .line 234
    .line 235
    new-instance v3, Landroid/graphics/PointF;

    .line 236
    .line 237
    const/4 v1, 0x0

    .line 238
    invoke-direct {v3, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 239
    .line 240
    .line 241
    :cond_b
    :goto_9
    iget-boolean v1, v2, Lu2/c$a;->s:Z

    .line 242
    .line 243
    if-eqz v1, :cond_d

    .line 244
    .line 245
    :cond_c
    move v10, v13

    .line 246
    goto :goto_a

    .line 247
    :cond_d
    invoke-virtual {v0}, Lu2/c$a$a;->b()Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-nez v1, :cond_c

    .line 252
    .line 253
    move v10, v15

    .line 254
    :goto_a
    iget-object v6, v2, Lu2/c$a;->e:Lu2/F;

    .line 255
    .line 256
    invoke-virtual {v0}, Lu2/c$a$a;->b()Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    xor-int/lit8 v11, v1, 0x1

    .line 261
    .line 262
    if-eqz v4, :cond_e

    .line 263
    .line 264
    iget-wide v4, v4, Landroid/window/WindowAnimationState;->timestamp:J

    .line 265
    .line 266
    :goto_b
    move-object v7, v0

    .line 267
    move-object v8, v12

    .line 268
    move v9, v14

    .line 269
    move-object v12, v3

    .line 270
    move-wide v13, v4

    .line 271
    goto :goto_c

    .line 272
    :cond_e
    const-wide/16 v4, -0x1

    .line 273
    .line 274
    goto :goto_b

    .line 275
    :goto_c
    invoke-virtual/range {v6 .. v14}, Lu2/F;->N(Lu2/F$c;Lu2/F$k;IZZLandroid/graphics/PointF;J)Lu2/F$a;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iput-object v0, v2, Lu2/c$a;->r:Lu2/F$a;

    .line 280
    .line 281
    return-void
.end method

.method static synthetic v(Lu2/c$a;Landroid/view/RemoteAnimationTarget;Landroid/view/RemoteAnimationTarget;ZLandroid/window/WindowAnimationState;Landroid/view/SurfaceControl$Transaction;Landroid/view/IRemoteAnimationFinishedCallback;ILjava/lang/Object;)V
    .locals 1

    .line 1
    and-int/lit8 p8, p7, 0x2

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p8, :cond_0

    .line 5
    .line 6
    move-object p2, v0

    .line 7
    :cond_0
    and-int/lit8 p8, p7, 0x4

    .line 8
    .line 9
    if-eqz p8, :cond_1

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    :cond_1
    and-int/lit8 p8, p7, 0x8

    .line 13
    .line 14
    if-eqz p8, :cond_2

    .line 15
    .line 16
    move-object p4, v0

    .line 17
    :cond_2
    and-int/lit8 p8, p7, 0x10

    .line 18
    .line 19
    if-eqz p8, :cond_3

    .line 20
    .line 21
    move-object p5, v0

    .line 22
    :cond_3
    and-int/lit8 p7, p7, 0x20

    .line 23
    .line 24
    if-eqz p7, :cond_4

    .line 25
    .line 26
    move-object p6, v0

    .line 27
    :cond_4
    invoke-direct/range {p0 .. p6}, Lu2/c$a;->u(Landroid/view/RemoteAnimationTarget;Landroid/view/RemoteAnimationTarget;ZLandroid/window/WindowAnimationState;Landroid/view/SurfaceControl$Transaction;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private final w(Landroid/view/RemoteAnimationTarget;Landroid/window/WindowAnimationState;Landroid/view/SurfaceControl$Transaction;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {v0}, Lu2/F$c;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    :goto_0
    move v4, v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    goto :goto_0

    .line 18
    :goto_1
    const/4 v3, 0x0

    .line 19
    move-object v1, p0

    .line 20
    move-object v2, p1

    .line 21
    move-object v5, p2

    .line 22
    move-object v6, p3

    .line 23
    move-object v7, p4

    .line 24
    invoke-direct/range {v1 .. v7}, Lu2/c$a;->u(Landroid/view/RemoteAnimationTarget;Landroid/view/RemoteAnimationTarget;ZLandroid/window/WindowAnimationState;Landroid/view/SurfaceControl$Transaction;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/c$a;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public onAnimationCancelled()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lu2/c$a;->s()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lu2/c$a;->p:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string v0, "Remote animation was cancelled"

    .line 10
    .line 11
    const-string v1, "ActivityTransitionAnimator"

    .line 12
    .line 13
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lu2/c$a;->q:Z

    .line 18
    .line 19
    iget-object v2, p0, Lu2/c$a;->r:Lu2/F$a;

    .line 20
    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-interface {v2}, Lu2/F$a;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_1
    sget-boolean v2, Lu2/c;->g:Z

    .line 27
    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    const-string v2, "Calling controller.onTransitionAnimationCancelled() [remote animation cancelled]"

    .line 31
    .line 32
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object v1, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v1, v2, v0, v2}, Lu2/c$d;->k(Lu2/c$d;Ljava/lang/Boolean;ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lu2/c$a;->d:Lu2/c$e;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    invoke-interface {p0}, Lu2/c$e;->c()V

    .line 46
    .line 47
    .line 48
    :cond_3
    :goto_0
    return-void
.end method

.method public onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 9

    .line 1
    invoke-direct {p0, p2, p5}, Lu2/c$a;->t([Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Lu2/c$a;->b:Lu2/c$d;

    .line 9
    .line 10
    invoke-interface {p1}, Lu2/F$c;->a()Landroid/window/WindowAnimationState;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 p2, 0x0

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    sget-object p1, Lu2/F;->i:Lu2/F$b;

    .line 18
    .line 19
    invoke-virtual {p1}, Lu2/F$b;->h()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-direct {p0, v1, p2, p2, p5}, Lu2/c$a;->w(Landroid/view/RemoteAnimationTarget;Landroid/window/WindowAnimationState;Landroid/view/SurfaceControl$Transaction;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    :goto_0
    if-eqz p4, :cond_4

    .line 31
    .line 32
    array-length p1, p4

    .line 33
    const/4 p3, 0x0

    .line 34
    :goto_1
    if-ge p3, p1, :cond_4

    .line 35
    .line 36
    aget-object v0, p4, p3

    .line 37
    .line 38
    iget v2, v0, Landroid/view/RemoteAnimationTarget;->windowType:I

    .line 39
    .line 40
    const/16 v3, 0x7e3

    .line 41
    .line 42
    if-ne v2, v3, :cond_3

    .line 43
    .line 44
    move-object v2, v0

    .line 45
    goto :goto_2

    .line 46
    :cond_3
    add-int/lit8 p3, p3, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_4
    move-object v2, p2

    .line 50
    :goto_2
    const/16 v7, 0x1c

    .line 51
    .line 52
    const/4 v8, 0x0

    .line 53
    const/4 v3, 0x0

    .line 54
    const/4 v4, 0x0

    .line 55
    const/4 v5, 0x0

    .line 56
    move-object v0, p0

    .line 57
    move-object v6, p5

    .line 58
    invoke-static/range {v0 .. v8}, Lu2/c$a;->v(Lu2/c$a;Landroid/view/RemoteAnimationTarget;Landroid/view/RemoteAnimationTarget;ZLandroid/window/WindowAnimationState;Landroid/view/SurfaceControl$Transaction;Landroid/view/IRemoteAnimationFinishedCallback;ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
