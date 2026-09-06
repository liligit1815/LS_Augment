.class public Lcom/android/launcher3/touch/J;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "WorkspaceTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final g:Landroid/graphics/Rect;

.field private final h:Lcom/android/launcher3/C2;

.field private final i:Lcom/android/launcher3/Workspace;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/Workspace<",
            "*>;"
        }
    .end annotation
.end field

.field private final j:Landroid/graphics/PointF;

.field private final k:F

.field private l:I

.field private final m:Landroid/view/GestureDetector;

.field private final n:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Lcom/android/launcher3/Workspace<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

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
    iput-object v0, p0, Lcom/android/launcher3/touch/J;->g:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/touch/J;->j:Landroid/graphics/PointF;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/android/launcher3/touch/J;->l:I

    .line 20
    .line 21
    new-instance v0, Landroid/graphics/PointF;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/touch/J;->n:Landroid/graphics/PointF;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 31
    .line 32
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    mul-int/lit8 p1, p1, 0x2

    .line 41
    .line 42
    int-to-float p1, p1

    .line 43
    iput p1, p0, Lcom/android/launcher3/touch/J;->k:F

    .line 44
    .line 45
    new-instance p1, Landroid/view/GestureDetector;

    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-direct {p1, p2, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Lcom/android/launcher3/touch/J;->m:Landroid/view/GestureDetector;

    .line 55
    .line 56
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/touch/J;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->v2()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->x2()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isHandlingTouch()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_1

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_1
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method private c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/launcher3/touch/J;->l:I

    .line 3
    .line 4
    return-void
.end method

.method private d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->j:Landroid/graphics/PointF;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->n:Landroid/graphics/PointF;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 10
    .line 11
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 12
    .line 13
    sub-float/2addr p0, v0

    .line 14
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/high16 v0, 0x41700000    # 15.0f

    .line 19
    .line 20
    cmpg-float p0, p0, v0

    .line 21
    .line 22
    if-gez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method private e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/LongClickTextView;->d()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const-string p0, "WorkspaceTouchListener"

    .line 34
    .line 35
    const-string v0, "checkLongClickHelpTextNeedHandleWorkspaceLongClick handled"

    .line 36
    .line 37
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method private synthetic g()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->performHapticFeedback(II)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private h()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "WorkspaceTouchListener"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "onLongPress checkLongClickHelpTextNeedHandleWorkspaceLongClick return"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Lx1/O;->k1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget v0, p0, Lcom/android/launcher3/touch/J;->l:I

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    if-ne v0, v2, :cond_6

    .line 26
    .line 27
    const-string v0, "Main"

    .line 28
    .line 29
    const-string v3, "Workspace.longPress"

    .line 30
    .line 31
    invoke-static {v0, v3}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->b()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_5

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->d()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_5

    .line 45
    .line 46
    const/4 v0, 0x2

    .line 47
    iput v0, p0, Lcom/android/launcher3/touch/J;->l:I

    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 69
    .line 70
    const/4 v3, 0x0

    .line 71
    invoke-virtual {v0, v3, v2}, Landroid/view/ViewGroup;->performHapticFeedback(II)Z

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$e;->w:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 85
    .line 86
    invoke-interface {v0, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    const-string p0, "onLongPress not response in concise mode!"

    .line 100
    .line 101
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    sget-boolean v0, Lcom/android/launcher3/W3;->A:Z

    .line 106
    .line 107
    if-nez v0, :cond_4

    .line 108
    .line 109
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 116
    .line 117
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    const-string p0, "onLongPress: springChainRunning!"

    .line 122
    .line 123
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_5
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->c()V

    .line 128
    .line 129
    .line 130
    :cond_6
    :goto_0
    return-void
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isHandlingTouch()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->V0(Z)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string v0, "WorkspaceTouchListener"

    .line 29
    .line 30
    const-string v1, "GoToNormalState, onClick blank area, go to normal state"

    .line 31
    .line 32
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1, v0}, Lcom/android/launcher3/Workspace;->g3(I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/touch/J;->f()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v2, 0x0

    .line 10
    const-string v3, "WorkspaceTouchListener"

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v5, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 22
    .line 23
    invoke-virtual {v0, v5}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->e()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string p0, "onLongClick MENU_OVERVIEW checkLongClickHelpTextNeedHandleWorkspaceLongClick return"

    .line 36
    .line 37
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return v4

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->O0()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_9

    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 58
    .line 59
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    const/16 v0, -0xc9

    .line 66
    .line 67
    if-eq p1, v0, :cond_9

    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-le p1, v4, :cond_9

    .line 76
    .line 77
    const-string p1, "onLongClick--isSupportReorderScreen--hideHomeEditor"

    .line 78
    .line 79
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Lcom/android/launcher3/menu/c;->l()V

    .line 89
    .line 90
    .line 91
    return v4

    .line 92
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 93
    .line 94
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 95
    .line 96
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_9

    .line 101
    .line 102
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->b()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_2

    .line 107
    .line 108
    return v2

    .line 109
    :cond_2
    invoke-static {}, Lx1/O;->k1()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    return v2

    .line 116
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_4

    .line 127
    .line 128
    const-string p0, "launcherState is normal, and the dragState is dragging."

    .line 129
    .line 130
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    return v2

    .line 134
    :cond_4
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->e()Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_5

    .line 139
    .line 140
    const-string p0, "onLongClick NORMAL checkLongClickHelpTextNeedHandleWorkspaceLongClick return"

    .line 141
    .line 142
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    return v4

    .line 146
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 147
    .line 148
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-interface {p1, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_6

    .line 164
    .line 165
    const-string p1, "onLongClick not response in concise mode!"

    .line 166
    .line 167
    invoke-static {v3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_6
    sget-boolean p1, Lcom/android/launcher3/W3;->A:Z

    .line 172
    .line 173
    if-nez p1, :cond_7

    .line 174
    .line 175
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 176
    .line 177
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p1, v1, v4}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 182
    .line 183
    .line 184
    goto :goto_0

    .line 185
    :cond_7
    const-string p1, "onLongClick: springChainRunning!"

    .line 186
    .line 187
    invoke-static {v3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-nez p1, :cond_8

    .line 199
    .line 200
    sget-object p1, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 201
    .line 202
    new-instance v0, Lcom/android/launcher3/touch/I;

    .line 203
    .line 204
    invoke-direct {v0, p0}, Lcom/android/launcher3/touch/I;-><init>(Lcom/android/launcher3/touch/J;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 208
    .line 209
    .line 210
    :cond_8
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->w:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 221
    .line 222
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 223
    .line 224
    .line 225
    return v4

    .line 226
    :cond_9
    return v2
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/16 v0, 0x2002

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->H()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->h()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->m:Landroid/view/GestureDetector;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-object v0, p0, Lcom/android/launcher3/touch/J;->n:Landroid/graphics/PointF;

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    if-nez p1, :cond_2

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->b()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object v1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iget-object v3, p0, Lcom/android/launcher3/touch/J;->g:Landroid/graphics/Rect;

    .line 49
    .line 50
    iget v4, v2, Landroid/graphics/Rect;->left:I

    .line 51
    .line 52
    iget v5, v2, Landroid/graphics/Rect;->top:I

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    iget v7, v2, Landroid/graphics/Rect;->right:I

    .line 59
    .line 60
    sub-int/2addr v6, v7

    .line 61
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 66
    .line 67
    sub-int/2addr v1, v2

    .line 68
    invoke-virtual {v3, v4, v5, v6, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/android/launcher3/touch/J;->g:Landroid/graphics/Rect;

    .line 72
    .line 73
    iget p1, p1, Lcom/android/launcher3/h0;->r1:I

    .line 74
    .line 75
    invoke-virtual {v1, p1, p1}, Landroid/graphics/Rect;->inset(II)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->g:Landroid/graphics/Rect;

    .line 79
    .line 80
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    float-to-int v1, v1

    .line 85
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    float-to-int v2, v2

    .line 90
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    :cond_0
    if-eqz p1, :cond_1

    .line 95
    .line 96
    iput v0, p0, Lcom/android/launcher3/touch/J;->l:I

    .line 97
    .line 98
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->j:Landroid/graphics/PointF;

    .line 99
    .line 100
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-virtual {p1, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 109
    .line 110
    .line 111
    invoke-static {p2}, Lcom/android/launcher3/util/H2;->a(Landroid/view/MotionEvent;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_1

    .line 116
    .line 117
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->h()V

    .line 118
    .line 119
    .line 120
    return v0

    .line 121
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 122
    .line 123
    invoke-virtual {p0, p2}, Lcom/android/launcher3/Workspace;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 124
    .line 125
    .line 126
    return v0

    .line 127
    :cond_2
    iget v1, p0, Lcom/android/launcher3/touch/J;->l:I

    .line 128
    .line 129
    const/4 v2, 0x2

    .line 130
    const/4 v3, 0x3

    .line 131
    if-ne v1, v2, :cond_3

    .line 132
    .line 133
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->setAction(I)V

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 137
    .line 138
    invoke-virtual {v1, p2}, Lcom/android/launcher3/Workspace;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2, p1}, Landroid/view/MotionEvent;->setAction(I)V

    .line 142
    .line 143
    .line 144
    iput v3, p0, Lcom/android/launcher3/touch/J;->l:I

    .line 145
    .line 146
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 147
    .line 148
    sget-object v4, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 149
    .line 150
    invoke-interface {v1, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_4

    .line 155
    .line 156
    iget-object v1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->e1()Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-eqz v1, :cond_4

    .line 167
    .line 168
    move v1, v0

    .line 169
    goto :goto_0

    .line 170
    :cond_4
    const/4 v1, 0x0

    .line 171
    :goto_0
    iget v5, p0, Lcom/android/launcher3/touch/J;->l:I

    .line 172
    .line 173
    if-ne v5, v3, :cond_6

    .line 174
    .line 175
    :cond_5
    :goto_1
    move v2, v0

    .line 176
    goto :goto_2

    .line 177
    :cond_6
    if-ne v5, v0, :cond_8

    .line 178
    .line 179
    iget-object v5, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 180
    .line 181
    invoke-virtual {v5, p2}, Lcom/android/launcher3/Workspace;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 182
    .line 183
    .line 184
    iget-object v5, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 185
    .line 186
    invoke-virtual {v5}, Lcom/android/launcher3/V4;->isHandlingTouch()Z

    .line 187
    .line 188
    .line 189
    move-result v5

    .line 190
    if-eqz v5, :cond_7

    .line 191
    .line 192
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->c()V

    .line 193
    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_7
    if-ne p1, v2, :cond_5

    .line 197
    .line 198
    iget-object v2, p0, Lcom/android/launcher3/touch/J;->j:Landroid/graphics/PointF;

    .line 199
    .line 200
    iget v2, v2, Landroid/graphics/PointF;->x:F

    .line 201
    .line 202
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    sub-float/2addr v2, v5

    .line 207
    iget-object v5, p0, Lcom/android/launcher3/touch/J;->j:Landroid/graphics/PointF;

    .line 208
    .line 209
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 210
    .line 211
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 212
    .line 213
    .line 214
    move-result v6

    .line 215
    sub-float/2addr v5, v6

    .line 216
    invoke-static {v2, v5}, Landroid/graphics/PointF;->length(FF)F

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    iget v5, p0, Lcom/android/launcher3/touch/J;->k:F

    .line 221
    .line 222
    cmpl-float v2, v2, v5

    .line 223
    .line 224
    if-lez v2, :cond_5

    .line 225
    .line 226
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->c()V

    .line 227
    .line 228
    .line 229
    goto :goto_1

    .line 230
    :cond_8
    move v2, v1

    .line 231
    :goto_2
    if-eq p1, v0, :cond_9

    .line 232
    .line 233
    const/4 v5, 0x6

    .line 234
    if-ne p1, v5, :cond_a

    .line 235
    .line 236
    :cond_9
    iget-object v5, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 237
    .line 238
    invoke-virtual {v5}, Lcom/android/launcher3/V4;->isHandlingTouch()Z

    .line 239
    .line 240
    .line 241
    move-result v5

    .line 242
    if-nez v5, :cond_a

    .line 243
    .line 244
    iget-object v5, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 245
    .line 246
    invoke-virtual {v5}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 247
    .line 248
    .line 249
    move-result v6

    .line 250
    invoke-virtual {v5, v6}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 251
    .line 252
    .line 253
    move-result-object v5

    .line 254
    check-cast v5, Lcom/android/launcher3/CellLayout;

    .line 255
    .line 256
    if-eqz v5, :cond_a

    .line 257
    .line 258
    iget-object v5, p0, Lcom/android/launcher3/touch/J;->i:Lcom/android/launcher3/Workspace;

    .line 259
    .line 260
    invoke-virtual {v5, p2}, Lcom/android/launcher3/Workspace;->z2(Landroid/view/MotionEvent;)V

    .line 261
    .line 262
    .line 263
    :cond_a
    if-eq p1, v0, :cond_b

    .line 264
    .line 265
    if-ne p1, v3, :cond_c

    .line 266
    .line 267
    :cond_b
    invoke-direct {p0}, Lcom/android/launcher3/touch/J;->c()V

    .line 268
    .line 269
    .line 270
    :cond_c
    if-ne p1, v0, :cond_d

    .line 271
    .line 272
    if-eqz v1, :cond_d

    .line 273
    .line 274
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 275
    .line 276
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    sget-object p2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 281
    .line 282
    invoke-virtual {p1, p2}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 283
    .line 284
    .line 285
    iget-object p1, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 286
    .line 287
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    iget v0, v4, Lcom/android/launcher3/V3;->b:I

    .line 296
    .line 297
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withSrcState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    iget p2, p2, Lcom/android/launcher3/V3;->b:I

    .line 302
    .line 303
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withDstState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 308
    .line 309
    .line 310
    move-result-object p2

    .line 311
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    iget-object p0, p0, Lcom/android/launcher3/touch/J;->h:Lcom/android/launcher3/C2;

    .line 316
    .line 317
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 322
    .line 323
    .line 324
    move-result p0

    .line 325
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setPageIndex(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    invoke-virtual {p2, p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setWorkspace(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 334
    .line 335
    .line 336
    move-result-object p0

    .line 337
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 338
    .line 339
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->l0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 344
    .line 345
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 346
    .line 347
    .line 348
    :cond_d
    return v2
.end method
