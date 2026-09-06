.class public LP2/d;
.super Ljava/lang/Object;
.source "RegionSamplingHelper.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1d
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LP2/d$d;,
        LP2/d$e;
    }
.end annotation


# instance fields
.field private A:Landroid/view/SurfaceControl;

.field private B:Landroid/view/ViewTreeObserver$OnDrawListener;

.field private C:Ljava/lang/Runnable;

.field private final g:Landroid/os/Handler;

.field private final h:Landroid/view/View;

.field private final i:Landroid/view/CompositionSamplingListener;

.field private final j:Landroid/graphics/Rect;

.field private final k:Landroid/graphics/Rect;

.field private final l:LP2/d$d;

.field private final m:Ljava/util/concurrent/Executor;

.field private final n:LP2/d$e;

.field private o:Z

.field private p:Z

.field private q:F

.field private r:F

.field private s:Z

.field private t:Z

.field private u:Z

.field private v:Z

.field private w:Z

.field private x:Z

.field private y:Z

.field private z:Landroid/view/SurfaceControl;


# direct methods
.method public constructor <init>(Landroid/view/View;LP2/d$d;Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, p3}, LP2/d;-><init>(Landroid/view/View;LP2/d$d;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;LP2/d$d;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V
    .locals 6

    .line 2
    new-instance v5, LP2/d$e;

    invoke-direct {v5}, LP2/d$e;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, LP2/d;-><init>(Landroid/view/View;LP2/d$d;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;LP2/d$e;)V

    return-void
.end method

.method constructor <init>(Landroid/view/View;LP2/d$d;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;LP2/d$e;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, LP2/d;->g:Landroid/os/Handler;

    .line 5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 6
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, LP2/d;->k:Landroid/graphics/Rect;

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, LP2/d;->o:Z

    .line 8
    iput-boolean v0, p0, LP2/d;->p:Z

    .line 9
    iput-boolean v0, p0, LP2/d;->x:Z

    .line 10
    iput-boolean v0, p0, LP2/d;->y:Z

    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, LP2/d;->z:Landroid/view/SurfaceControl;

    .line 12
    iput-object v0, p0, LP2/d;->A:Landroid/view/SurfaceControl;

    .line 13
    new-instance v0, LP2/d$a;

    invoke-direct {v0, p0}, LP2/d$a;-><init>(LP2/d;)V

    iput-object v0, p0, LP2/d;->B:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 14
    new-instance v0, LP2/d$b;

    invoke-direct {v0, p0}, LP2/d$b;-><init>(LP2/d;)V

    iput-object v0, p0, LP2/d;->C:Ljava/lang/Runnable;

    .line 15
    iput-object p4, p0, LP2/d;->m:Ljava/util/concurrent/Executor;

    .line 16
    iput-object p5, p0, LP2/d;->n:LP2/d$e;

    .line 17
    new-instance p4, LP2/d$c;

    invoke-direct {p4, p0, p3}, LP2/d$c;-><init>(LP2/d;Ljava/util/concurrent/Executor;)V

    iput-object p4, p0, LP2/d;->i:Landroid/view/CompositionSamplingListener;

    .line 18
    iput-object p1, p0, LP2/d;->h:Landroid/view/View;

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 20
    invoke-virtual {p1, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 21
    iput-object p2, p0, LP2/d;->l:LP2/d$d;

    return-void
.end method

.method public static synthetic a(LP2/d;Landroid/view/SurfaceControl;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LP2/d;->n(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(LP2/d;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LP2/d;->m(Landroid/view/SurfaceControl;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(LP2/d;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, LP2/d;->g:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(LP2/d;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, LP2/d;->C:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(LP2/d;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, LP2/d;->h:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(LP2/d;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LP2/d;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(LP2/d;)Landroid/view/ViewTreeObserver$OnDrawListener;
    .locals 0

    .line 1
    iget-object p0, p0, LP2/d;->B:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(LP2/d;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LP2/d;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(LP2/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LP2/d;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic j(LP2/d;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LP2/d;->u(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic k(LP2/d;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LP2/d;->v(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic m(Landroid/view/SurfaceControl;)V
    .locals 1

    .line 1
    iget-object v0, p0, LP2/d;->n:LP2/d$e;

    .line 2
    .line 3
    iget-object p0, p0, LP2/d;->i:Landroid/view/CompositionSamplingListener;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, LP2/d$e;->b(Landroid/view/CompositionSamplingListener;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->release()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private synthetic n(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, LP2/d;->n:LP2/d$e;

    .line 11
    .line 12
    iget-object p0, p0, LP2/d;->i:Landroid/view/CompositionSamplingListener;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, p0, v1, p1, p2}, LP2/d$e;->a(Landroid/view/CompositionSamplingListener;ILandroid/view/SurfaceControl;Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private o()V
    .locals 1

    .line 1
    iget-boolean v0, p0, LP2/d;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, LP2/d;->s:Z

    .line 7
    .line 8
    invoke-direct {p0}, LP2/d;->w()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private t()V
    .locals 3

    .line 1
    iget-boolean v0, p0, LP2/d;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, LP2/d;->p:Z

    .line 7
    .line 8
    iget-object v0, p0, LP2/d;->A:Landroid/view/SurfaceControl;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-object v1, p0, LP2/d;->z:Landroid/view/SurfaceControl;

    .line 12
    .line 13
    iput-object v1, p0, LP2/d;->A:Landroid/view/SurfaceControl;

    .line 14
    .line 15
    iget-object v1, p0, LP2/d;->k:Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, LP2/d;->m:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    new-instance v2, LP2/c;

    .line 23
    .line 24
    invoke-direct {v2, p0, v0}, LP2/c;-><init>(LP2/d;Landroid/view/SurfaceControl;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private u(F)V
    .locals 2

    .line 1
    iput p1, p0, LP2/d;->r:F

    .line 2
    .line 3
    iget v0, p0, LP2/d;->q:F

    .line 4
    .line 5
    sub-float v0, p1, v0

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const v1, 0x3d4ccccd    # 0.05f

    .line 12
    .line 13
    .line 14
    cmpl-float v0, v0, v1

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, LP2/d;->l:LP2/d$d;

    .line 19
    .line 20
    const/high16 v1, 0x3f000000    # 0.5f

    .line 21
    .line 22
    cmpg-float v1, p1, v1

    .line 23
    .line 24
    if-gez v1, :cond_0

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v1, 0x0

    .line 29
    :goto_0
    invoke-interface {v0, v1}, LP2/d$d;->b(Z)V

    .line 30
    .line 31
    .line 32
    iput p1, p0, LP2/d;->q:F

    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method private v(F)V
    .locals 4

    .line 1
    iput p1, p0, LP2/d;->r:F

    .line 2
    .line 3
    iget v0, p0, LP2/d;->q:F

    .line 4
    .line 5
    sub-float v0, p1, v0

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const v1, 0x3c23d70a    # 0.01f

    .line 12
    .line 13
    .line 14
    cmpl-float v1, v0, v1

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-lez v1, :cond_0

    .line 18
    .line 19
    iput-boolean v2, p0, LP2/d;->y:Z

    .line 20
    .line 21
    :cond_0
    const v1, 0x3a83126f    # 0.001f

    .line 22
    .line 23
    .line 24
    cmpg-float v0, v0, v1

    .line 25
    .line 26
    if-gez v0, :cond_2

    .line 27
    .line 28
    iget-boolean v0, p0, LP2/d;->y:Z

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, LP2/d;->y:Z

    .line 34
    .line 35
    iget-object v1, p0, LP2/d;->l:LP2/d$d;

    .line 36
    .line 37
    const/high16 v3, 0x3f000000    # 0.5f

    .line 38
    .line 39
    cmpg-float v3, p1, v3

    .line 40
    .line 41
    if-gez v3, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v2, v0

    .line 45
    :goto_0
    invoke-interface {v1, v2}, LP2/d$d;->b(Z)V

    .line 46
    .line 47
    .line 48
    :cond_2
    iput p1, p0, LP2/d;->q:F

    .line 49
    .line 50
    return-void
.end method

.method private w()V
    .locals 5

    .line 1
    iget-boolean v0, p0, LP2/d;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    iget-object v0, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_8

    .line 12
    .line 13
    iget-boolean v0, p0, LP2/d;->v:Z

    .line 14
    .line 15
    if-eqz v0, :cond_8

    .line 16
    .line 17
    iget-boolean v0, p0, LP2/d;->w:Z

    .line 18
    .line 19
    if-nez v0, :cond_8

    .line 20
    .line 21
    iget-object v0, p0, LP2/d;->h:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-boolean v0, p0, LP2/d;->u:Z

    .line 30
    .line 31
    if-eqz v0, :cond_8

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, LP2/d;->h:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/ViewRootImpl;->getSurfaceControl()Landroid/view/SurfaceControl;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move-object v0, v1

    .line 48
    :goto_0
    const/4 v2, 0x1

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-nez v3, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move-object v1, v0

    .line 59
    goto :goto_2

    .line 60
    :cond_3
    :goto_1
    iget-boolean v0, p0, LP2/d;->s:Z

    .line 61
    .line 62
    if-nez v0, :cond_5

    .line 63
    .line 64
    iput-boolean v2, p0, LP2/d;->s:Z

    .line 65
    .line 66
    iget-object v0, p0, LP2/d;->g:Landroid/os/Handler;

    .line 67
    .line 68
    iget-object v3, p0, LP2/d;->C:Ljava/lang/Runnable;

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-object v0, p0, LP2/d;->g:Landroid/os/Handler;

    .line 77
    .line 78
    iget-object v3, p0, LP2/d;->C:Ljava/lang/Runnable;

    .line 79
    .line 80
    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_4
    iget-object v0, p0, LP2/d;->h:Landroid/view/View;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v3, p0, LP2/d;->B:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 91
    .line 92
    invoke-virtual {v0, v3}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 93
    .line 94
    .line 95
    :cond_5
    :goto_2
    iget-object v0, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 96
    .line 97
    iget-object v3, p0, LP2/d;->k:Landroid/graphics/Rect;

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_6

    .line 104
    .line 105
    iget-object v0, p0, LP2/d;->z:Landroid/view/SurfaceControl;

    .line 106
    .line 107
    if-eq v0, v1, :cond_7

    .line 108
    .line 109
    :cond_6
    invoke-direct {p0}, LP2/d;->t()V

    .line 110
    .line 111
    .line 112
    iput-boolean v2, p0, LP2/d;->p:Z

    .line 113
    .line 114
    invoke-virtual {p0, v1}, LP2/d;->y(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    new-instance v2, Landroid/graphics/Rect;

    .line 119
    .line 120
    iget-object v3, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 121
    .line 122
    invoke-direct {v2, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, LP2/d;->m:Ljava/util/concurrent/Executor;

    .line 126
    .line 127
    new-instance v4, LP2/a;

    .line 128
    .line 129
    invoke-direct {v4, p0, v0, v2}, LP2/a;-><init>(LP2/d;Landroid/view/SurfaceControl;Landroid/graphics/Rect;)V

    .line 130
    .line 131
    .line 132
    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, LP2/d;->k:Landroid/graphics/Rect;

    .line 136
    .line 137
    iget-object v3, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 138
    .line 139
    invoke-virtual {v2, v3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 140
    .line 141
    .line 142
    iput-object v1, p0, LP2/d;->z:Landroid/view/SurfaceControl;

    .line 143
    .line 144
    iput-object v0, p0, LP2/d;->A:Landroid/view/SurfaceControl;

    .line 145
    .line 146
    :cond_7
    const/4 v0, 0x0

    .line 147
    iput-boolean v0, p0, LP2/d;->u:Z

    .line 148
    .line 149
    return-void

    .line 150
    :cond_8
    invoke-direct {p0}, LP2/d;->t()V

    .line 151
    .line 152
    .line 153
    return-void
.end method


# virtual methods
.method public l(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "RegionSamplingHelper:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\tsampleView isAttached: "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, LP2/d;->h:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v1, "\tsampleView isScValid: "

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, LP2/d;->h:Landroid/view/View;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    iget-object v1, p0, LP2/d;->h:Landroid/view/View;

    .line 72
    .line 73
    invoke-virtual {v1}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Landroid/view/ViewRootImpl;->getSurfaceControl()Landroid/view/SurfaceControl;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    goto :goto_0

    .line 90
    :cond_0
    const-string v1, "notAttached"

    .line 91
    .line 92
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v1, "\tmSamplingEnabled: "

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget-boolean v1, p0, LP2/d;->o:Z

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v1, "\tmSamplingListenerRegistered: "

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget-boolean v1, p0, LP2/d;->p:Z

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string v1, "\tmSamplingRequestBounds: "

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v1, "\tmRegisteredSamplingBounds: "

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, LP2/d;->k:Landroid/graphics/Rect;

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v1, "\tmLastMedianLuma: "

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    iget v1, p0, LP2/d;->q:F

    .line 216
    .line 217
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v1, "\tmCurrentMedianLuma: "

    .line 236
    .line 237
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    iget v1, p0, LP2/d;->r:F

    .line 241
    .line 242
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v1, "\tmWindowVisible: "

    .line 261
    .line 262
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    iget-boolean v1, p0, LP2/d;->v:Z

    .line 266
    .line 267
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    new-instance v0, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    const-string v1, "\tmWindowHasBlurs: "

    .line 286
    .line 287
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    iget-boolean v1, p0, LP2/d;->w:Z

    .line 291
    .line 292
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    new-instance v0, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    const-string v1, "\tmWaitingOnDraw: "

    .line 311
    .line 312
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    iget-boolean v1, p0, LP2/d;->s:Z

    .line 316
    .line 317
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    new-instance v0, Ljava/lang/StringBuilder;

    .line 328
    .line 329
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    const-string v1, "\tmRegisteredStopLayer: "

    .line 336
    .line 337
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    iget-object v1, p0, LP2/d;->z:Landroid/view/SurfaceControl;

    .line 341
    .line 342
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    new-instance v0, Ljava/lang/StringBuilder;

    .line 353
    .line 354
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    const-string v1, "\tmWrappedStopLayer: "

    .line 361
    .line 362
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    iget-object v1, p0, LP2/d;->A:Landroid/view/SurfaceControl;

    .line 366
    .line 367
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    new-instance v0, Ljava/lang/StringBuilder;

    .line 378
    .line 379
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    const-string p1, "\tmIsDestroyed: "

    .line 386
    .line 387
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    iget-boolean p0, p0, LP2/d;->t:Z

    .line 391
    .line 392
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object p0

    .line 399
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, LP2/d;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LP2/d;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, LP2/d;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LP2/d;->v:Z

    .line 2
    .line 3
    invoke-direct {p0}, LP2/d;->w()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, LP2/d;->l:LP2/d$d;

    .line 2
    .line 3
    invoke-interface {v0}, LP2/d$d;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, LP2/d;->o:Z

    .line 19
    .line 20
    const/high16 v0, -0x40800000    # -1.0f

    .line 21
    .line 22
    iput v0, p0, LP2/d;->q:F

    .line 23
    .line 24
    iput-boolean p1, p0, LP2/d;->u:Z

    .line 25
    .line 26
    invoke-direct {p0}, LP2/d;->w()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, LP2/d;->o:Z

    .line 3
    .line 4
    invoke-direct {p0}, LP2/d;->w()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    invoke-virtual {p0}, LP2/d;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LP2/d;->m:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iget-object v1, p0, LP2/d;->i:Landroid/view/CompositionSamplingListener;

    .line 7
    .line 8
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    new-instance v2, LP2/b;

    .line 12
    .line 13
    invoke-direct {v2, v1}, LP2/b;-><init>(Landroid/view/CompositionSamplingListener;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, LP2/d;->t:Z

    .line 21
    .line 22
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    iget-object v0, p0, LP2/d;->l:LP2/d$d;

    .line 2
    .line 3
    iget-object v1, p0, LP2/d;->h:Landroid/view/View;

    .line 4
    .line 5
    invoke-interface {v0, v1}, LP2/d$d;->c(Landroid/view/View;)Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, LP2/d;->j:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, LP2/d;->w()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method protected y(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance p0, Landroid/view/SurfaceControl;

    .line 6
    .line 7
    const-string v0, "regionSampling"

    .line 8
    .line 9
    invoke-direct {p0, p1, v0}, Landroid/view/SurfaceControl;-><init>(Landroid/view/SurfaceControl;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method
