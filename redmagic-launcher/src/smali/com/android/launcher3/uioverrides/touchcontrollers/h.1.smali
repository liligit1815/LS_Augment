.class public Lcom/android/launcher3/uioverrides/touchcontrollers/h;
.super Ljava/lang/Object;
.source "NavBarToHomeTouchController.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;
.implements Lcom/android/launcher3/touch/H$d;


# static fields
.field private static final o:Landroid/view/animation/Interpolator;


# instance fields
.field private final g:Lcom/android/launcher3/C2;

.field private final h:Ljava/util/function/BiConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/BiConsumer<",
            "Landroid/animation/AnimatorSet;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Lcom/android/launcher3/touch/H;

.field private final j:F

.field private k:Z

.field private l:Lcom/android/launcher3/V3;

.field private m:Lcom/android/launcher3/V3;

.field private n:Lcom/android/launcher3/anim/q;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LJ0/h;->N:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->o:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;Ljava/util/function/BiConsumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Ljava/util/function/BiConsumer<",
            "Landroid/animation/AnimatorSet;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->m:Lcom/android/launcher3/V3;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->h:Ljava/util/function/BiConsumer;

    .line 11
    .line 12
    new-instance p2, Lcom/android/launcher3/touch/H;

    .line 13
    .line 14
    sget-object v0, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 15
    .line 16
    invoke-direct {p2, p1, p0, v0}, Lcom/android/launcher3/touch/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i:Lcom/android/launcher3/touch/H;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const p2, 0x7f07048c

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->j:F

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/views/RecentsView;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method private g(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/H4;->b(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v2, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 15
    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    and-int/lit16 p1, p1, 0x100

    .line 24
    .line 25
    if-eqz p1, :cond_5

    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->l:Lcom/android/launcher3/V3;

    .line 28
    .line 29
    iget-boolean v0, p1, Lcom/android/launcher3/V3;->c:Z

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 35
    .line 36
    if-ne p1, v0, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->g0:Z

    .line 46
    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    const p1, 0x7ffefdfe

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const p1, 0x7ffefdff

    .line 54
    .line 55
    .line 56
    :goto_0
    and-int/lit16 p1, p1, -0x101

    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    invoke-static {p0, p1}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-eqz p0, :cond_3

    .line 65
    .line 66
    return v2

    .line 67
    :cond_3
    return v1

    .line 68
    :cond_4
    :goto_1
    return v2

    .line 69
    :cond_5
    return v1
.end method

.method private h()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->n:Lcom/android/launcher3/anim/q;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i:Lcom/android/launcher3/touch/H;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->c()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i:Lcom/android/launcher3/touch/H;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private i()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 8
    .line 9
    int-to-float p0, p0

    .line 10
    return p0
.end method

.method private j()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    mul-float/2addr v0, v1

    .line 8
    float-to-long v0, v0

    .line 9
    new-instance v2, Lcom/android/launcher3/anim/V;

    .line 10
    .line 11
    invoke-direct {v2, v0, v1}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->l:Lcom/android/launcher3/V3;

    .line 15
    .line 16
    iget-boolean v1, v0, Lcom/android/launcher3/V3;->c:Z

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    invoke-static {}, Lx1/O;->Y2()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    invoke-static {v1, v2}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->createRecentsResistanceFromOverviewAnim(Lcom/android/launcher3/C2;Lcom/android/launcher3/anim/V;)Lcom/android/launcher3/anim/V;

    .line 37
    .line 38
    .line 39
    :cond_0
    sget-object v1, Lf1/a;->J:Lf1/a$a;

    .line 40
    .line 41
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/f;

    .line 51
    .line 52
    invoke-direct {v1, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/f;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, v1}, Lcom/android/launcher3/anim/f;->h(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    const/16 v1, 0x800

    .line 61
    .line 62
    invoke-static {v0, v1}, Lcom/android/launcher3/a;->closeOpenContainer(Lcom/android/launcher3/views/k;I)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 67
    .line 68
    if-ne v0, v1, :cond_3

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget-object v1, Lcom/android/launcher3/allapps/G;->v:Landroid/util/FloatProperty;

    .line 77
    .line 78
    iget v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->j:F

    .line 79
    .line 80
    neg-float v3, v3

    .line 81
    sget-object v4, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->o:Landroid/view/animation/Interpolator;

    .line 82
    .line 83
    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 84
    .line 85
    .line 86
    sget-object v1, Lcom/android/launcher3/allapps/G;->w:Landroid/util/FloatProperty;

    .line 87
    .line 88
    const/high16 v3, 0x3f000000    # 0.5f

    .line 89
    .line 90
    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 94
    .line 95
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    iget v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->j:F

    .line 102
    .line 103
    sget-object v3, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->o:Landroid/view/animation/Interpolator;

    .line 104
    .line 105
    invoke-virtual {v0, v1, v3, v2}, Lcom/android/launcher3/a;->addHintCloseAnim(FLandroid/view/animation/Interpolator;Lcom/android/launcher3/anim/V;)V

    .line 106
    .line 107
    .line 108
    :cond_4
    invoke-virtual {v2}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->n:Lcom/android/launcher3/anim/q;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/g;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/g;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v1}, Lcom/android/launcher3/G2;->g(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method private synthetic k()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/h$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h$a;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, v0}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->m:Lcom/android/launcher3/V3;

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->o(Lcom/android/launcher3/V3;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->m:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->o(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->l:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->o(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->l:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    iget v1, v1, Lcom/android/launcher3/V3;->b:I

    .line 14
    .line 15
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withSrcState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->m:Lcom/android/launcher3/V3;

    .line 20
    .line 21
    iget p0, p0, Lcom/android/launcher3/V3;->b:I

    .line 22
    .line 23
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withDstState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->w0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 28
    .line 29
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private o(Lcom/android/launcher3/V3;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->h()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    iget p1, p1, Lcom/android/launcher3/V3;->a:I

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendStateEventToTest(Landroid/content/Context;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/android/launcher3/V3;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->l:Lcom/android/launcher3/V3;

    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    xor-int/lit8 v2, v0, 0x1

    .line 27
    .line 28
    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->k:Z

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    return v1

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i:Lcom/android/launcher3/touch/H;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->k:Z

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    return v1

    .line 44
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i:Lcom/android/launcher3/touch/H;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0
.end method

.method public final onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onDrag(F)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->n:Lcom/android/launcher3/anim/q;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public onDragEnd(F)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i:Lcom/android/launcher3/touch/H;

    .line 3
    .line 4
    invoke-virtual {v1, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->n:Lcom/android/launcher3/anim/q;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/android/launcher3/anim/q;->q()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    sget-object v3, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->o:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    invoke-interface {v3, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const v4, 0x3df5c28f    # 0.12f

    .line 21
    .line 22
    .line 23
    cmpl-float v3, v3, v4

    .line 24
    .line 25
    if-gez v3, :cond_1

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    cmpg-float v4, p1, v3

    .line 29
    .line 30
    if-gez v4, :cond_0

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->n:Lcom/android/launcher3/anim/q;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v1, 0x2

    .line 42
    new-array v1, v1, [F

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    aput v2, v1, v4

    .line 46
    .line 47
    aput v3, v1, v0

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/e;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/e;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 62
    .line 63
    .line 64
    const-wide/16 v0, 0x50

    .line 65
    .line 66
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    :goto_0
    sget-object v1, Lf1/a;->J:Lf1/a$a;

    .line 75
    .line 76
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Lcom/android/quickstep/views/RecentsView;

    .line 89
    .line 90
    new-instance v2, Lcom/android/launcher3/uioverrides/touchcontrollers/b;

    .line 91
    .line 92
    invoke-direct {v2, v1}, Lcom/android/launcher3/uioverrides/touchcontrollers/b;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 93
    .line 94
    .line 95
    const/4 v3, 0x0

    .line 96
    invoke-virtual {v1, v3, v2}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/util/HashMap;Ljava/lang/Runnable;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->l:Lcom/android/launcher3/V3;

    .line 100
    .line 101
    iget-boolean v1, v1, Lcom/android/launcher3/V3;->c:Z

    .line 102
    .line 103
    if-eqz v1, :cond_4

    .line 104
    .line 105
    invoke-static {}, Lx1/O;->Y2()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_3

    .line 110
    .line 111
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 118
    .line 119
    invoke-virtual {p1, v1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_3
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/c;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/c;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V

    .line 126
    .line 127
    .line 128
    new-instance v2, Lcom/android/quickstep/util/OverviewToHomeAnim;

    .line 129
    .line 130
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 131
    .line 132
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->h:Ljava/util/function/BiConsumer;

    .line 133
    .line 134
    invoke-direct {v2, v3, v1, v4}, Lcom/android/quickstep/util/OverviewToHomeAnim;-><init>(Lcom/android/launcher3/C2;Ljava/lang/Runnable;Ljava/util/function/BiConsumer;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v2, p1}, Lcom/android/quickstep/util/OverviewToHomeAnim;->animateWithVelocity(F)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->m:Lcom/android/launcher3/V3;

    .line 148
    .line 149
    new-instance v2, Lcom/android/launcher3/uioverrides/touchcontrollers/d;

    .line 150
    .line 151
    invoke-direct {v2, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/d;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {p1, v1, v0, v2}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 159
    .line 160
    .line 161
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->l:Lcom/android/launcher3/V3;

    .line 162
    .line 163
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->m:Lcom/android/launcher3/V3;

    .line 164
    .line 165
    if-eq p1, v1, :cond_5

    .line 166
    .line 167
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->n()V

    .line 168
    .line 169
    .line 170
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 171
    .line 172
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 173
    .line 174
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 179
    .line 180
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->i:Lcom/android/launcher3/touch/H;

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/android/launcher3/touch/g;->j()Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    sget-object v2, Lw2/a;->h:Lw2/a;

    .line 187
    .line 188
    invoke-virtual {p1, v1, v2}, Lcom/android/quickstep/SystemUiProxy;->updateContextualEduStats(ZLw2/a;)V

    .line 189
    .line 190
    .line 191
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 192
    .line 193
    invoke-static {p1}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    if-eqz p1, :cond_7

    .line 198
    .line 199
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 200
    .line 201
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->g0:Z

    .line 206
    .line 207
    if-eqz p1, :cond_6

    .line 208
    .line 209
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 210
    .line 211
    invoke-static {p0, v0, v0}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    .line 212
    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_6
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->g:Lcom/android/launcher3/C2;

    .line 216
    .line 217
    invoke-static {p0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 218
    .line 219
    .line 220
    :cond_7
    :goto_2
    const-string p0, "recentapps"

    .line 221
    .line 222
    invoke-static {p0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
