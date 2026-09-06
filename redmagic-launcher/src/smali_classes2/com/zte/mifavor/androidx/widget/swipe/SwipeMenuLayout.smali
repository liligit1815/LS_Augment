.class public Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;
.super Landroid/widget/FrameLayout;
.source "SwipeMenuLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;
    }
.end annotation


# instance fields
.field private A:I

.field private B:Z

.field private final C:Ljava/lang/Object;

.field private D:Ljava/lang/Boolean;

.field private E:Ljava/lang/Boolean;

.field private F:Z

.field private G:Landroid/animation/ValueAnimator;

.field private H:Landroid/animation/ValueAnimator;

.field private I:Landroid/os/Handler;

.field private J:I

.field private K:Ljava/lang/String;

.field private L:Z

.field M:Landroid/view/animation/PathInterpolator;

.field private N:I

.field private O:I

.field private g:I

.field private h:I

.field private final i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:Lcom/zte/mifavor/androidx/widget/swipe/a;

.field private o:Z

.field private p:Z

.field private final q:Landroid/widget/OverScroller;

.field private r:Landroid/view/VelocityTracker;

.field private final s:I

.field private final t:I

.field private u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

.field private v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

.field private w:F

.field private x:F

.field private y:I

.field private z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x0

    .line 3
    iput p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->g:I

    .line 4
    iput p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->h:I

    .line 5
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 6
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    const v0, 0x3ee66666    # 0.45f

    .line 7
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->w:F

    const v0, 0x3d75c28f    # 0.06f

    .line 8
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->x:F

    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 10
    iput p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->A:I

    .line 11
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->B:Z

    .line 12
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->C:Ljava/lang/Object;

    .line 13
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->D:Ljava/lang/Boolean;

    .line 14
    iput-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->E:Ljava/lang/Boolean;

    .line 15
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->F:Z

    .line 16
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->G:Landroid/animation/ValueAnimator;

    .line 17
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->H:Landroid/animation/ValueAnimator;

    .line 18
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->I:Landroid/os/Handler;

    const/4 v0, 0x1

    .line 19
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->J:I

    .line 20
    const-string v1, ""

    iput-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 21
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 22
    new-instance v1, Landroid/view/animation/PathInterpolator;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const v4, 0x3ea8f5c3    # 0.33f

    invoke-direct {v1, v4, v2, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->M:Landroid/view/animation/PathInterpolator;

    .line 23
    iput p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->N:I

    .line 24
    iput p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->O:I

    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 26
    sget-object p3, LR3/m;->H3:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 27
    sget p2, LR3/m;->I3:I

    iget p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->g:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->g:I

    .line 28
    sget p2, LR3/m;->J3:I

    iget p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->h:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->h:I

    .line 29
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 30
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->i:I

    .line 32
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->s:I

    .line 33
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->t:I

    .line 34
    new-instance p1, Landroid/widget/OverScroller;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->M:Landroid/view/animation/PathInterpolator;

    invoke-direct {p1, p2, p3}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 35
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 36
    const-string p2, "{"

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    .line 37
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "["

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, p2, 0x1

    add-int/lit8 p2, p2, 0x7

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "] "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->A:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->N:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->O:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->A:I

    .line 2
    .line 3
    return-void
.end method

.method private k()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r:Landroid/view/VelocityTracker;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 18
    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->B:Z

    .line 21
    .line 22
    return-void
.end method

.method private n(F)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->y:I

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->J:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    int-to-float p0, v0

    .line 7
    cmpg-float p0, p1, p0

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private p(II)Z
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->F:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    new-instance p1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, "judge Delete Unique Item. mSwipeContentView is null."

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "Z#SwipeMenuLayout"

    .line 31
    .line 32
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    return v1

    .line 36
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    :cond_2
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->getSlidingPause()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iget v3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->y:I

    .line 55
    .line 56
    int-to-float v4, v3

    .line 57
    iget v5, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->w:F

    .line 58
    .line 59
    mul-float/2addr v4, v5

    .line 60
    int-to-float v3, v3

    .line 61
    const/high16 v5, 0x3f800000    # 1.0f

    .line 62
    .line 63
    iget v6, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->x:F

    .line 64
    .line 65
    sub-float/2addr v5, v6

    .line 66
    mul-float/2addr v3, v5

    .line 67
    const/4 v5, 0x1

    .line 68
    if-lez p1, :cond_3

    .line 69
    .line 70
    int-to-float v6, v0

    .line 71
    cmpl-float v6, v6, v4

    .line 72
    .line 73
    if-lez v6, :cond_3

    .line 74
    .line 75
    const/16 v6, 0x190

    .line 76
    .line 77
    if-ge p2, v6, :cond_3

    .line 78
    .line 79
    if-eqz v2, :cond_3

    .line 80
    .line 81
    iget-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    .line 82
    .line 83
    if-nez v2, :cond_3

    .line 84
    .line 85
    iput-boolean v5, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->h(Z)V

    .line 88
    .line 89
    .line 90
    return v5

    .line 91
    :cond_3
    if-gez p1, :cond_4

    .line 92
    .line 93
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    .line 94
    .line 95
    if-eqz p1, :cond_4

    .line 96
    .line 97
    int-to-float p1, v0

    .line 98
    cmpg-float v0, v4, p1

    .line 99
    .line 100
    if-gez v0, :cond_4

    .line 101
    .line 102
    cmpg-float p1, p1, v3

    .line 103
    .line 104
    if-gez p1, :cond_4

    .line 105
    .line 106
    const/16 p1, 0x7d

    .line 107
    .line 108
    if-le p2, p1, :cond_4

    .line 109
    .line 110
    iput-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    .line 111
    .line 112
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->j(Z)V

    .line 113
    .line 114
    .line 115
    return v5

    .line 116
    :cond_4
    return v1
.end method

.method private q(IZ)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "judgeOpenClose mSwipeCurrentHorizontal is null."

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "Z#SwipeMenuLayout"

    .line 25
    .line 26
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 39
    .line 40
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/zte/mifavor/androidx/widget/swipe/a;->d()I

    .line 47
    .line 48
    .line 49
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->y:I

    .line 50
    .line 51
    int-to-float v0, v0

    .line 52
    iget v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->w:F

    .line 53
    .line 54
    mul-float/2addr v0, v1

    .line 55
    const/4 v1, 0x0

    .line 56
    if-lez p1, :cond_4

    .line 57
    .line 58
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->F:Z

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    int-to-float p1, p2

    .line 63
    cmpl-float p1, p1, v0

    .line 64
    .line 65
    if-lez p1, :cond_2

    .line 66
    .line 67
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    .line 68
    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    new-instance p1, Landroid/os/Handler;

    .line 72
    .line 73
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 74
    .line 75
    .line 76
    new-instance p2, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$a;

    .line 77
    .line 78
    invoke-direct {p2, p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$a;-><init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)V

    .line 79
    .line 80
    .line 81
    const-wide/16 v0, 0xbe

    .line 82
    .line 83
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/swipe/a;->b()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    div-int/lit8 p1, p1, 0x2

    .line 94
    .line 95
    if-ge p2, p1, :cond_3

    .line 96
    .line 97
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->i(Z)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->j(Z)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_4
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->i(Z)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method private r()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->F:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 23
    .line 24
    :cond_1
    new-instance v1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-direct {v1, v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->z:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 31
    .line 32
    new-instance v2, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;-><init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)V

    .line 35
    .line 36
    .line 37
    const-wide/16 v5, 0x1

    .line 38
    .line 39
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 40
    .line 41
    const-wide/16 v3, 0x1

    .line 42
    .line 43
    invoke-virtual/range {v1 .. v7}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private s(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->G:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->G:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    iget p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->N:I

    .line 17
    .line 18
    :cond_0
    filled-new-array {p1, p2}, [I

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->G:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    const-wide/16 v0, 0xc8

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->G:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    new-instance p2, Landroid/view/animation/LinearInterpolator;

    .line 38
    .line 39
    invoke-direct {p2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->G:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    new-instance p2, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;-><init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->G:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    new-instance p2, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$c;

    .line 58
    .line 59
    invoke-direct {p2, p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$c;-><init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->G:Landroid/animation/ValueAnimator;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method private t(Landroid/view/ViewGroup;II)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p2, "+++++++++++ Start value View-Translation Anim out. mIsCardDelete="

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "Z#SwipeMenuLayout"

    .line 30
    .line 31
    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->H:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->H:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 48
    .line 49
    .line 50
    iget p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->O:I

    .line 51
    .line 52
    :cond_1
    filled-new-array {p2, p3}, [I

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iput-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->H:Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    if-eqz p2, :cond_2

    .line 63
    .line 64
    const-wide/16 v0, 0xc8

    .line 65
    .line 66
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->H:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    new-instance p3, Landroid/view/animation/LinearInterpolator;

    .line 72
    .line 73
    invoke-direct {p3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->H:Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    new-instance p3, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$d;

    .line 82
    .line 83
    invoke-direct {p3, p0, p1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$d;-><init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;Landroid/view/ViewGroup;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->H:Landroid/animation/ValueAnimator;

    .line 90
    .line 91
    new-instance p2, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$e;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$e;-><init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->H:Landroid/animation/ValueAnimator;

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 102
    .line 103
    .line 104
    :cond_2
    return-void
.end method


# virtual methods
.method public computeScroll()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrX()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {v0, v2, v1}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public getItemDisableHorizontalSwipe()Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "getItemDisableHorizontalSwipe out. mIsDisableHorizontalSwipe="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->E:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "Z#SwipeMenuLayout"

    .line 26
    .line 27
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->E:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method public getItemMenuCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/swipe/a;->a()I

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

.method public getSlidingPause()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->C:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->B:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public h(Z)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->F:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    :cond_1
    move v2, v0

    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->y:I

    .line 28
    .line 29
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    sub-int v4, p1, v0

    .line 34
    .line 35
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    const/16 v6, 0xc8

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iget p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->y:I

    .line 46
    .line 47
    invoke-direct {p0, v2, p1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->s(II)V

    .line 48
    .line 49
    .line 50
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 51
    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 61
    .line 62
    iget v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->y:I

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->getITEM_WIDTH()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    div-int/lit8 v2, v2, 0x2

    .line 69
    .line 70
    sub-int/2addr v1, v2

    .line 71
    invoke-direct {p0, v0, p1, v1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->t(Landroid/view/ViewGroup;II)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_0
    return-void
.end method

.method public i(Z)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :cond_0
    move v2, v0

    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    neg-int v4, v2

    .line 24
    const/4 v5, 0x0

    .line 25
    const/16 v6, 0xc8

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-direct {p0, v2, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->s(II)V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 46
    .line 47
    invoke-direct {p0, v1, p1, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->t(Landroid/view/ViewGroup;II)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public j(Z)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :cond_0
    move v2, v0

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->J:I

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    sub-int/2addr p1, v0

    .line 29
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 30
    .line 31
    neg-int v4, p1

    .line 32
    const/4 v5, 0x0

    .line 33
    const/16 v6, 0xc8

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->J:I

    .line 41
    .line 42
    invoke-direct {p0, v2, p1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->s(II)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 46
    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 56
    .line 57
    iget v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->J:I

    .line 58
    .line 59
    invoke-direct {p0, v0, p1, v1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->t(Landroid/view/ViewGroup;II)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/swipe/a;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public o()Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 12
    .line 13
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    new-instance v4, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v5, "isMenuOpen, scrollx="

    .line 29
    .line 30
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v5, ", scrollx1="

    .line 37
    .line 38
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v5, ", scrollx2="

    .line 45
    .line 46
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    const-string v5, "Z#SwipeMenuLayout"

    .line 57
    .line 58
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    if-gtz v0, :cond_1

    .line 62
    .line 63
    if-gtz v3, :cond_1

    .line 64
    .line 65
    if-lez p0, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    return v2

    .line 69
    :cond_1
    :goto_0
    return v1

    .line 70
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-lez p0, :cond_3

    .line 75
    .line 76
    return v1

    .line 77
    :cond_3
    return v2
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "onFinishInflate: in."

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Z#SwipeMenuLayout"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->h:I

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v2, Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 37
    .line 38
    invoke-direct {v2, v0}, Lcom/zte/mifavor/androidx/widget/swipe/a;-><init>(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    iput-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 42
    .line 43
    instance-of v2, v0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    check-cast v0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->getIsCardDelete()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 56
    .line 57
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->g:I

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    instance-of v2, v0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 66
    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    check-cast v0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 72
    .line 73
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v2, "onFinishInflate out. mIsCardDelete="

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v2, ", mSwipeMenuView="

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v2, ", mSwipeContentView="

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 109
    .line 110
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->D:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_8

    .line 16
    .line 17
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->E:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :cond_0
    const/4 v2, 0x0

    .line 28
    if-eqz v0, :cond_7

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    if-eq v0, v3, :cond_5

    .line 32
    .line 33
    const/4 v4, 0x2

    .line 34
    if-eq v0, v4, :cond_3

    .line 35
    .line 36
    const/4 p1, 0x3

    .line 37
    if-eq v0, p1, :cond_1

    .line 38
    .line 39
    return v1

    .line 40
    :cond_1
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 51
    .line 52
    .line 53
    :cond_2
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l()V

    .line 54
    .line 55
    .line 56
    return v2

    .line 57
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    float-to-int v0, v0

    .line 62
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    float-to-int p1, p1

    .line 67
    iget v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l:I

    .line 68
    .line 69
    sub-int/2addr v0, v1

    .line 70
    iget v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->m:I

    .line 71
    .line 72
    sub-int/2addr p1, v1

    .line 73
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->i:I

    .line 78
    .line 79
    if-le v1, p0, :cond_4

    .line 80
    .line 81
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-le p0, p1, :cond_4

    .line 90
    .line 91
    return v3

    .line 92
    :cond_4
    return v2

    .line 93
    :cond_5
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    invoke-direct {p0, p1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n(F)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_6

    .line 111
    .line 112
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->i(Z)V

    .line 113
    .line 114
    .line 115
    return v3

    .line 116
    :cond_6
    return v2

    .line 117
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    float-to-int v0, v0

    .line 122
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->j:I

    .line 123
    .line 124
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l:I

    .line 125
    .line 126
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    float-to-int v0, v0

    .line 131
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->m:I

    .line 132
    .line 133
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    float-to-int v0, v0

    .line 138
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->j:I

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    float-to-int p1, p1

    .line 145
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->k:I

    .line 146
    .line 147
    iput-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 148
    .line 149
    iput-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    .line 150
    .line 151
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r()V

    .line 152
    .line 153
    .line 154
    return v2

    .line 155
    :cond_8
    :goto_0
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l()V

    .line 156
    .line 157
    .line 158
    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->getIsCardDelete()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 8
    .line 9
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredWidthAndState()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeightAndState()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iget-object p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 24
    .line 25
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    check-cast p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 36
    .line 37
    .line 38
    move-result p5

    .line 39
    iget p3, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 40
    .line 41
    add-int/2addr p5, p3

    .line 42
    add-int/2addr p1, p4

    .line 43
    add-int/2addr p2, p5

    .line 44
    iget-object p3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 45
    .line 46
    invoke-virtual {p3, p4, p5, p1, p2}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p4, 0x0

    .line 51
    move p5, p4

    .line 52
    :goto_0
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/swipe/a;->c()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidthAndState()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeightAndState()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 69
    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    add-int/2addr p2, p4

    .line 73
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/high16 v1, 0x42800000    # 64.0f

    .line 78
    .line 79
    invoke-static {v0, v1}, Lb4/h;->c(Landroid/content/Context;F)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p2, v0

    .line 84
    :goto_1
    add-int/2addr p3, p5

    .line 85
    goto :goto_2

    .line 86
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidthAndState()I

    .line 87
    .line 88
    .line 89
    move-result p4

    .line 90
    add-int/2addr p2, p4

    .line 91
    goto :goto_1

    .line 92
    :goto_2
    invoke-virtual {p1, p4, p5, p2, p3}, Landroid/view/View;->layout(IIII)V

    .line 93
    .line 94
    .line 95
    :cond_2
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 96
    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 100
    .line 101
    if-eqz p2, :cond_3

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/swipe/a;->a()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->n:Lcom/zte/mifavor/androidx/widget/swipe/a;

    .line 108
    .line 109
    invoke-virtual {p2}, Lcom/zte/mifavor/androidx/widget/swipe/a;->b()I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    mul-int/2addr p1, p2

    .line 114
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->J:I

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->m()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->F:Z

    .line 121
    .line 122
    :cond_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->y:I

    .line 127
    .line 128
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->D:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_10

    .line 16
    .line 17
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->E:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    goto/16 :goto_3

    .line 26
    .line 27
    :cond_0
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r:Landroid/view/VelocityTracker;

    .line 28
    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r:Landroid/view/VelocityTracker;

    .line 36
    .line 37
    :cond_1
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r:Landroid/view/VelocityTracker;

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    invoke-virtual {v2, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    const/4 v2, 0x0

    .line 45
    if-eqz v0, :cond_e

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    if-eq v0, v3, :cond_b

    .line 49
    .line 50
    const/4 v4, 0x2

    .line 51
    if-eq v0, v4, :cond_4

    .line 52
    .line 53
    const/4 v3, 0x3

    .line 54
    if-eq v0, v3, :cond_3

    .line 55
    .line 56
    goto/16 :goto_3

    .line 57
    .line 58
    :cond_3
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l()V

    .line 59
    .line 60
    .line 61
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l:I

    .line 62
    .line 63
    int-to-float v0, v0

    .line 64
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    sub-float/2addr v0, p1

    .line 69
    float-to-int p1, v0

    .line 70
    invoke-direct {p0, p1, v2}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q(IZ)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->k()V

    .line 74
    .line 75
    .line 76
    iput-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 77
    .line 78
    iput-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    .line 79
    .line 80
    return v1

    .line 81
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    float-to-int v0, v0

    .line 86
    iget v4, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->j:I

    .line 87
    .line 88
    int-to-float v4, v4

    .line 89
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    sub-float/2addr v4, v5

    .line 94
    float-to-int v4, v4

    .line 95
    iget v5, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->k:I

    .line 96
    .line 97
    int-to-float v5, v5

    .line 98
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    sub-float/2addr v5, v6

    .line 103
    float-to-int v5, v5

    .line 104
    iget-boolean v6, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 105
    .line 106
    if-nez v6, :cond_5

    .line 107
    .line 108
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    iget v7, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->i:I

    .line 113
    .line 114
    if-le v6, v7, :cond_5

    .line 115
    .line 116
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-le v6, v5, :cond_5

    .line 125
    .line 126
    iput-boolean v3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 127
    .line 128
    :cond_5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    iget-boolean v5, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 133
    .line 134
    if-eqz v5, :cond_a

    .line 135
    .line 136
    if-gtz v4, :cond_6

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o()Z

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    if-eqz v5, :cond_a

    .line 143
    .line 144
    :cond_6
    if-ltz v3, :cond_a

    .line 145
    .line 146
    if-gez v4, :cond_7

    .line 147
    .line 148
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    if-le v5, v6, :cond_7

    .line 157
    .line 158
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 159
    .line 160
    .line 161
    move-result v4

    .line 162
    neg-int v4, v4

    .line 163
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 164
    .line 165
    .line 166
    iget-boolean v5, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->F:Z

    .line 167
    .line 168
    if-nez v5, :cond_8

    .line 169
    .line 170
    if-nez v5, :cond_a

    .line 171
    .line 172
    int-to-float v3, v3

    .line 173
    iget v5, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->J:I

    .line 174
    .line 175
    int-to-float v5, v5

    .line 176
    const v6, 0x3f99999a    # 1.2f

    .line 177
    .line 178
    .line 179
    mul-float/2addr v5, v6

    .line 180
    cmpg-float v3, v3, v5

    .line 181
    .line 182
    if-gez v3, :cond_a

    .line 183
    .line 184
    :cond_8
    iget-boolean v3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->L:Z

    .line 185
    .line 186
    if-eqz v3, :cond_9

    .line 187
    .line 188
    iget-object v3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->v:Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 189
    .line 190
    invoke-virtual {v3, v4, v2}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->scrollBy(II)V

    .line 191
    .line 192
    .line 193
    iget-object v3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->u:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 194
    .line 195
    invoke-virtual {v3, v4, v2}, Landroid/widget/LinearLayout;->scrollBy(II)V

    .line 196
    .line 197
    .line 198
    goto :goto_0

    .line 199
    :cond_9
    invoke-virtual {p0, v4, v2}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->scrollBy(II)V

    .line 200
    .line 201
    .line 202
    :cond_a
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    float-to-int v3, v3

    .line 207
    iput v3, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->j:I

    .line 208
    .line 209
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    float-to-int p1, p1

    .line 214
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->k:I

    .line 215
    .line 216
    invoke-direct {p0, v4, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p(II)Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    if-eqz p1, :cond_10

    .line 221
    .line 222
    iput-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 223
    .line 224
    return v2

    .line 225
    :cond_b
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l()V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r:Landroid/view/VelocityTracker;

    .line 229
    .line 230
    if-eqz v0, :cond_c

    .line 231
    .line 232
    iget v4, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->t:I

    .line 233
    .line 234
    int-to-float v4, v4

    .line 235
    const/16 v5, 0x3e8

    .line 236
    .line 237
    invoke-virtual {v0, v5, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->r:Landroid/view/VelocityTracker;

    .line 241
    .line 242
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    float-to-int v0, v0

    .line 247
    goto :goto_1

    .line 248
    :cond_c
    move v0, v2

    .line 249
    :goto_1
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    iget v4, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->s:I

    .line 254
    .line 255
    mul-int/lit8 v4, v4, 0x4

    .line 256
    .line 257
    if-le v0, v4, :cond_d

    .line 258
    .line 259
    goto :goto_2

    .line 260
    :cond_d
    move v3, v2

    .line 261
    :goto_2
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->l:I

    .line 262
    .line 263
    int-to-float v0, v0

    .line 264
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    sub-float/2addr v0, p1

    .line 269
    float-to-int p1, v0

    .line 270
    invoke-direct {p0, p1, v3}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q(IZ)V

    .line 271
    .line 272
    .line 273
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->k()V

    .line 274
    .line 275
    .line 276
    iput-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 277
    .line 278
    iput-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->p:Z

    .line 279
    .line 280
    return v1

    .line 281
    :cond_e
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    float-to-int v0, v0

    .line 286
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->j:I

    .line 287
    .line 288
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    float-to-int p1, p1

    .line 293
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->k:I

    .line 294
    .line 295
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 296
    .line 297
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    if-nez p1, :cond_f

    .line 302
    .line 303
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q:Landroid/widget/OverScroller;

    .line 304
    .line 305
    invoke-virtual {p1}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 306
    .line 307
    .line 308
    :cond_f
    iput-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o:Z

    .line 309
    .line 310
    :cond_10
    :goto_3
    return v1
.end method

.method public scrollBy(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->scrollBy(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setDisableSwipeDelete(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->D:Ljava/lang/Boolean;

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, "setDisableSwipeDelete out. mIsDisableSwipe="

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->D:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "Z#SwipeMenuLayout"

    .line 28
    .line 29
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setItemDisableHorizontalSwipe(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->E:Ljava/lang/Boolean;

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->K:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, "setItemDisableHorizontalSwipe out. mIsDisableHorizontalSwipe="

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->E:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "Z#SwipeMenuLayout"

    .line 28
    .line 29
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setSlidingPause(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->C:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->B:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method
