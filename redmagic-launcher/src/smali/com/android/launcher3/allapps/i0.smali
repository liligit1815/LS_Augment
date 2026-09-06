.class public Lcom/android/launcher3/allapps/i0;
.super Lcom/android/launcher3/allapps/v0;
.source "PrivateProfileManager.java"


# instance fields
.field private A:Landroid/widget/TextView;

.field private B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

.field private C:Landroidx/constraintlayout/widget/ConstraintLayout;

.field private final D:Ljava/lang/String;

.field private final E:Ljava/lang/String;

.field private final F:Ljava/lang/String;

.field private final k:Lcom/android/launcher3/allapps/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/r<",
            "*>;"
        }
    .end annotation
.end field

.field private final l:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation
.end field

.field private final m:I

.field private final n:I

.field private final o:I

.field private final p:I

.field private final q:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

.field private r:Landroid/content/Intent;

.field private s:Lcom/android/launcher3/allapps/T;

.field private t:Z

.field private u:Z

.field private v:Z

.field private w:Z

.field private x:Z

.field private y:Ljava/lang/Runnable;

.field private z:Landroid/widget/RelativeLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/os/UserManager;Lcom/android/launcher3/allapps/r;Lcom/android/launcher3/logging/StatsLogManager;LD1/t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/UserManager;",
            "Lcom/android/launcher3/allapps/r<",
            "*>;",
            "Lcom/android/launcher3/logging/StatsLogManager;",
            "LD1/t;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p3, p4}, Lcom/android/launcher3/allapps/v0;-><init>(Landroid/os/UserManager;Lcom/android/launcher3/logging/StatsLogManager;LD1/t;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/launcher3/allapps/i0$d;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/i0$d;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->q:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 10
    .line 11
    new-instance p1, Landroid/content/Intent;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->r:Landroid/content/Intent;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 19
    .line 20
    new-instance p1, Lcom/android/launcher3/allapps/b0;

    .line 21
    .line 22
    invoke-direct {p1, p4}, Lcom/android/launcher3/allapps/b0;-><init>(LD1/t;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->l:Ljava/util/function/Predicate;

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget-object p3, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 36
    .line 37
    new-instance p4, Lcom/android/launcher3/allapps/c0;

    .line 38
    .line 39
    invoke-direct {p4, p0, p1}, Lcom/android/launcher3/allapps/c0;-><init>(Lcom/android/launcher3/allapps/i0;Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3, p4}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const p3, 0x7f070a0b

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iput p1, p0, Lcom/android/launcher3/allapps/i0;->m:I

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const p3, 0x7f140311

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->D:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const p3, 0x7f140312

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->E:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const p3, 0x7f140317

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->F:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    const p3, 0x7f070a09

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iput p1, p0, Lcom/android/launcher3/allapps/i0;->n:I

    .line 117
    .line 118
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    const p3, 0x7f070a19

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iput p1, p0, Lcom/android/launcher3/allapps/i0;->o:I

    .line 134
    .line 135
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    const p2, 0x7f070a18

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    iput p1, p0, Lcom/android/launcher3/allapps/i0;->p:I

    .line 151
    .line 152
    return-void
.end method

.method public static synthetic A(Ljava/util/List;Lcom/android/launcher3/model/data/d;)Z
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p1, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static synthetic B(Lcom/android/launcher3/allapps/i0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->s0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Lcom/android/launcher3/allapps/i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->t0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic D(Lcom/android/launcher3/allapps/i0;)Lcom/android/launcher3/allapps/r;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic E(Lcom/android/launcher3/allapps/i0;)Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic F(Lcom/android/launcher3/allapps/i0;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method private F0(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/i0;->w:Z

    .line 3
    .line 4
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/android/launcher3/allapps/i0;->q:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->q:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method static bridge synthetic G(Lcom/android/launcher3/allapps/i0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/i0;->p:I

    .line 2
    .line 3
    return p0
.end method

.method private G0(Z)Landroid/animation/ValueAnimator;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->c0()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    move v2, v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v2, v1

    .line 22
    :goto_0
    if-eqz p1, :cond_2

    .line 23
    .line 24
    move v0, v1

    .line 25
    :cond_2
    const/4 p1, 0x2

    .line 26
    new-array p1, p1, [F

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    aput v2, p1, v1

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    aput v0, p1, v1

    .line 33
    .line 34
    invoke-static {p1}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-wide/16 v0, 0xc8

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    const-wide/16 v0, 0x190

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Lcom/android/launcher3/allapps/i0$l;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Lcom/android/launcher3/allapps/i0$l;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 54
    .line 55
    .line 56
    return-object p1

    .line 57
    :cond_3
    :goto_1
    new-instance p0, Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    invoke-direct {p0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 60
    .line 61
    .line 62
    const-wide/16 v0, 0x0

    .line 63
    .line 64
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method static bridge synthetic H(Lcom/android/launcher3/allapps/i0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/i0;->o:I

    .line 2
    .line 3
    return p0
.end method

.method private H0(Z)Landroid/animation/ValueAnimator;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    move v4, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v4, v0

    .line 25
    :goto_0
    if-eqz p1, :cond_2

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    move v0, v3

    .line 29
    :goto_1
    const/4 v3, 0x2

    .line 30
    new-array v3, v3, [F

    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    aput v4, v3, v5

    .line 34
    .line 35
    const/4 v4, 0x1

    .line 36
    aput v0, v3, v4

    .line 37
    .line 38
    invoke-static {v3}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    const-wide/16 v3, 0x12c

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    const-wide/16 v3, 0x32

    .line 48
    .line 49
    :goto_2
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    if-eqz p1, :cond_4

    .line 53
    .line 54
    const-wide/16 v1, 0x1f4

    .line 55
    .line 56
    :cond_4
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 57
    .line 58
    .line 59
    sget-object p1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    new-instance p1, Lcom/android/launcher3/allapps/i0$c;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/i0$c;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 70
    .line 71
    .line 72
    return-object v0
.end method

.method static bridge synthetic I(Lcom/android/launcher3/allapps/i0;)Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 2
    .line 3
    return-object p0
.end method

.method private I0(Z)V
    .locals 10

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x3

    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, 0x0

    .line 5
    const/4 v4, 0x1

    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 7
    .line 8
    .line 9
    move-result v5

    .line 10
    if-eqz v5, :cond_4

    .line 11
    .line 12
    invoke-static {}, Lcom/android/launcher3/y0;->v0()Z

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    if-nez v5, :cond_0

    .line 17
    .line 18
    goto/16 :goto_1

    .line 19
    .line 20
    :cond_0
    iget-object v5, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 21
    .line 22
    if-nez v5, :cond_1

    .line 23
    .line 24
    new-instance v0, Lcom/android/launcher3/allapps/V;

    .line 25
    .line 26
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/allapps/V;-><init>(Lcom/android/launcher3/allapps/i0;Z)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/android/launcher3/allapps/i0;->y:Ljava/lang/Runnable;

    .line 30
    .line 31
    invoke-virtual {p0, v4}, Lcom/android/launcher3/allapps/i0;->B0(Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->U(Z)V

    .line 36
    .line 37
    .line 38
    new-instance v5, Lcom/android/launcher3/anim/f;

    .line 39
    .line 40
    invoke-direct {v5}, Lcom/android/launcher3/anim/f;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5}, Lcom/android/launcher3/anim/f;->k()Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    new-instance v6, Lcom/android/launcher3/allapps/i0$k;

    .line 48
    .line 49
    invoke-direct {v6, p0, p1}, Lcom/android/launcher3/allapps/i0$k;-><init>(Lcom/android/launcher3/allapps/i0;Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v5, v6}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    new-instance v6, Lcom/android/launcher3/allapps/W;

    .line 56
    .line 57
    invoke-direct {v6, p0, p1}, Lcom/android/launcher3/allapps/W;-><init>(Lcom/android/launcher3/allapps/i0;Z)V

    .line 58
    .line 59
    .line 60
    invoke-static {v6}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-virtual {v5, v6}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 65
    .line 66
    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    invoke-direct {p0, v4}, Lcom/android/launcher3/allapps/i0;->J0(Z)Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-direct {p0, v4}, Lcom/android/launcher3/allapps/i0;->H0(Z)Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-direct {p0, v4}, Lcom/android/launcher3/allapps/i0;->Q(Z)Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    invoke-direct {p0, v4}, Lcom/android/launcher3/allapps/i0;->T(Z)Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    invoke-direct {p0, v3}, Lcom/android/launcher3/allapps/i0;->G0(Z)Landroid/animation/ValueAnimator;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const/4 v9, 0x5

    .line 90
    new-array v9, v9, [Landroid/animation/Animator;

    .line 91
    .line 92
    aput-object p1, v9, v3

    .line 93
    .line 94
    aput-object v6, v9, v4

    .line 95
    .line 96
    aput-object v7, v9, v2

    .line 97
    .line 98
    aput-object v8, v9, v1

    .line 99
    .line 100
    aput-object p0, v9, v0

    .line 101
    .line 102
    invoke-virtual {v5, v9}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_2
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 107
    .line 108
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-direct {p0, v3}, Lcom/android/launcher3/allapps/i0;->J0(Z)Landroid/animation/ValueAnimator;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-direct {p0, v3}, Lcom/android/launcher3/allapps/i0;->H0(Z)Landroid/animation/ValueAnimator;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    invoke-direct {p0, v3}, Lcom/android/launcher3/allapps/i0;->Q(Z)Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    invoke-direct {p0, v3}, Lcom/android/launcher3/allapps/i0;->T(Z)Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    .line 126
    move-result-object v9

    .line 127
    new-array v0, v0, [Landroid/animation/Animator;

    .line 128
    .line 129
    aput-object v6, v0, v3

    .line 130
    .line 131
    aput-object v7, v0, v4

    .line 132
    .line 133
    aput-object v8, v0, v2

    .line 134
    .line 135
    aput-object v9, v0, v1

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->i0()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_3

    .line 145
    .line 146
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->R()Landroid/animation/ValueAnimator;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->S()Landroid/animation/ValueAnimator;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    new-array v1, v1, [Landroid/animation/Animator;

    .line 155
    .line 156
    aput-object p1, v1, v3

    .line 157
    .line 158
    aput-object v0, v1, v4

    .line 159
    .line 160
    aput-object p0, v1, v2

    .line 161
    .line 162
    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_3
    invoke-direct {p0, v4}, Lcom/android/launcher3/allapps/i0;->G0(Z)Landroid/animation/ValueAnimator;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->S()Landroid/animation/ValueAnimator;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    new-array v1, v1, [Landroid/animation/Animator;

    .line 175
    .line 176
    aput-object v0, v1, v3

    .line 177
    .line 178
    aput-object p1, v1, v4

    .line 179
    .line 180
    aput-object p0, v1, v2

    .line 181
    .line 182
    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 183
    .line 184
    .line 185
    :goto_0
    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->start()V

    .line 186
    .line 187
    .line 188
    :cond_4
    :goto_1
    return-void
.end method

.method static bridge synthetic J(Lcom/android/launcher3/allapps/i0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/i0;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method private J0(Z)Landroid/animation/ValueAnimator;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->k0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    move v4, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v4, v0

    .line 22
    :goto_0
    if-eqz p1, :cond_2

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_2
    move v0, v3

    .line 26
    :goto_1
    const/4 v3, 0x2

    .line 27
    new-array v3, v3, [F

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    aput v4, v3, v5

    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    aput v0, v3, v4

    .line 34
    .line 35
    invoke-static {v3}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-wide/16 v3, 0x190

    .line 40
    .line 41
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    move-wide v1, v3

    .line 47
    :cond_3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 48
    .line 49
    .line 50
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Lcom/android/launcher3/allapps/i0$a;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/i0$a;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Lcom/android/launcher3/allapps/i0$b;

    .line 64
    .line 65
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/allapps/i0$b;-><init>(Lcom/android/launcher3/allapps/i0;Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 69
    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_4
    :goto_2
    new-instance p0, Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    invoke-direct {p0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method static bridge synthetic K(Lcom/android/launcher3/allapps/i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->W()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private K0()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "PrivateProfileManager#updateView"

    .line 7
    .line 8
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "bindPrivateSpaceHeaderViewElements: Updating view with state: "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "PrivateProfileManager"

    .line 33
    .line 34
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 38
    .line 39
    const/high16 v1, 0x3f800000    # 1.0f

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 45
    .line 46
    const v2, 0x7f0b04a4

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/view/ViewGroup;

    .line 54
    .line 55
    const v2, 0x7f0b0373

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Landroid/widget/TextView;

    .line 63
    .line 64
    iput-object v2, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 65
    .line 66
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 67
    .line 68
    const v3, 0x7f0b04a5

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 76
    .line 77
    iput-object v2, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 78
    .line 79
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 80
    .line 81
    const v3, 0x7f0b04a6

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    check-cast v2, Landroid/widget/ImageView;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    const/4 v4, 0x2

    .line 95
    const/4 v5, 0x1

    .line 96
    const/16 v6, 0x8

    .line 97
    .line 98
    const/4 v7, 0x0

    .line 99
    if-eq v3, v5, :cond_3

    .line 100
    .line 101
    if-eq v3, v4, :cond_2

    .line 102
    .line 103
    const/4 v1, 0x3

    .line 104
    if-eq v3, v1, :cond_1

    .line 105
    .line 106
    goto/16 :goto_1

    .line 107
    .line 108
    :cond_1
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    goto/16 :goto_1

    .line 115
    .line 116
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 117
    .line 118
    new-instance v3, Lcom/android/launcher3/allapps/Z;

    .line 119
    .line 120
    invoke-direct {v3, p0}, Lcom/android/launcher3/allapps/Z;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 127
    .line 128
    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 132
    .line 133
    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->setImportantForAccessibility(I)V

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 137
    .line 138
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->E:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 144
    .line 145
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 149
    .line 150
    const/4 v3, 0x0

    .line 151
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setAlpha(F)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 155
    .line 156
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 160
    .line 161
    .line 162
    new-instance v1, Lcom/android/launcher3/allapps/a0;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/a0;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    .line 169
    .line 170
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->E:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 176
    .line 177
    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 181
    .line 182
    invoke-virtual {v0, v7}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 186
    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_3
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 190
    .line 191
    const/4 v5, 0x0

    .line 192
    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    .line 194
    .line 195
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 196
    .line 197
    invoke-virtual {v3, v7}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 198
    .line 199
    .line 200
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 201
    .line 202
    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setImportantForAccessibility(I)V

    .line 203
    .line 204
    .line 205
    iget-boolean v3, p0, Lcom/android/launcher3/allapps/i0;->v:Z

    .line 206
    .line 207
    if-nez v3, :cond_5

    .line 208
    .line 209
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 210
    .line 211
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 212
    .line 213
    .line 214
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 215
    .line 216
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 217
    .line 218
    .line 219
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 220
    .line 221
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 222
    .line 223
    .line 224
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->k0()Z

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    if-eqz v3, :cond_4

    .line 231
    .line 232
    move v3, v7

    .line 233
    goto :goto_0

    .line 234
    :cond_4
    move v3, v6

    .line 235
    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 236
    .line 237
    .line 238
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 239
    .line 240
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->k0()Z

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 245
    .line 246
    .line 247
    :cond_5
    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 248
    .line 249
    .line 250
    new-instance v1, Lcom/android/launcher3/allapps/U;

    .line 251
    .line 252
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/U;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 256
    .line 257
    .line 258
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->F:Ljava/lang/String;

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 264
    .line 265
    .line 266
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 267
    .line 268
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->invalidate()V

    .line 269
    .line 270
    .line 271
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 272
    .line 273
    .line 274
    return-void
.end method

.method static bridge synthetic L(Lcom/android/launcher3/allapps/i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->X()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Q(Z)Landroid/animation/ValueAnimator;
    .locals 6

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    move v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v0

    .line 9
    :goto_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_1
    move v0, v1

    .line 13
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getApps()Lcom/android/launcher3/allapps/M;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const/4 v4, 0x2

    .line 34
    new-array v4, v4, [F

    .line 35
    .line 36
    const/4 v5, 0x0

    .line 37
    aput v2, v4, v5

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    aput v0, v4, v2

    .line 41
    .line 42
    invoke-static {v4}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-wide/16 v4, 0x190

    .line 47
    .line 48
    invoke-virtual {v0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    const-wide/16 v4, 0x0

    .line 56
    .line 57
    :goto_2
    invoke-virtual {v2, v4, v5}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 58
    .line 59
    .line 60
    sget-object p1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 63
    .line 64
    .line 65
    new-instance p1, Lcom/android/launcher3/allapps/i0$h;

    .line 66
    .line 67
    invoke-direct {p1, p0, v3, v1}, Lcom/android/launcher3/allapps/i0$h;-><init>(Lcom/android/launcher3/allapps/i0;Ljava/util/List;Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 71
    .line 72
    .line 73
    return-object v0
.end method

.method private R()Landroid/animation/ValueAnimator;
    .locals 5

    .line 1
    const/16 v0, 0xff

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    filled-new-array {v0, v1}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/animation/ObjectAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getApps()Lcom/android/launcher3/allapps/M;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const-wide/16 v3, 0x96

    .line 27
    .line 28
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    new-instance v3, Lcom/android/launcher3/allapps/Y;

    .line 32
    .line 33
    invoke-direct {v3, p0, v2, v1}, Lcom/android/launcher3/allapps/Y;-><init>(Lcom/android/launcher3/allapps/i0;Ljava/util/List;Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method private S()Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [F

    .line 13
    .line 14
    fill-array-data v1, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-wide/16 v2, 0x190

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    new-instance v2, Lcom/android/launcher3/allapps/i0$g;

    .line 27
    .line 28
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/allapps/i0$g;-><init>(Lcom/android/launcher3/allapps/i0;Lcom/android/launcher3/views/RecyclerViewFastScroller;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 32
    .line 33
    .line 34
    return-object v1

    .line 35
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private T(Z)Landroid/animation/ValueAnimator;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance p0, Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-direct {p0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {v1, v0, v0}, Landroid/widget/TextView;->measure(II)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/widget/TextView;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v4, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const/4 v5, 0x0

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    move v1, v5

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    int-to-float v1, v1

    .line 39
    :goto_0
    if-eqz p1, :cond_2

    .line 40
    .line 41
    int-to-float v5, v4

    .line 42
    :cond_2
    const/4 v6, 0x2

    .line 43
    new-array v6, v6, [F

    .line 44
    .line 45
    aput v1, v6, v0

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    aput v5, v6, v0

    .line 49
    .line 50
    invoke-static {v6}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-wide/16 v5, 0x190

    .line 55
    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    move-wide v2, v5

    .line 59
    :cond_3
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    sget-object v1, LJ0/h;->k:Landroid/view/animation/Interpolator;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Lcom/android/launcher3/allapps/i0$i;

    .line 71
    .line 72
    invoke-direct {v1, p0, v4}, Lcom/android/launcher3/allapps/i0$i;-><init>(Lcom/android/launcher3/allapps/i0;I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 76
    .line 77
    .line 78
    new-instance v1, Lcom/android/launcher3/allapps/i0$j;

    .line 79
    .line 80
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/allapps/i0$j;-><init>(Lcom/android/launcher3/allapps/i0;Z)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 84
    .line 85
    .line 86
    return-object v0
.end method

.method private U(Z)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [I

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->getLocationOnScreen([I)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    aget v0, v0, v1

    .line 18
    .line 19
    iget v1, p0, Lcom/android/launcher3/allapps/i0;->m:I

    .line 20
    .line 21
    add-int/2addr v0, v1

    .line 22
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getBottom()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->d0()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    sub-int/2addr v1, v2

    .line 37
    if-le v0, v1, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const v1, 0x7f0e01cb

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/android/launcher3/allapps/FloatingMaskView;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 71
    .line 72
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->c0()F

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 80
    .line 81
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private W()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getApps()Lcom/android/launcher3/allapps/M;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/lit8 v2, v2, -0x1

    .line 20
    .line 21
    :goto_0
    if-lez v2, :cond_5

    .line 22
    .line 23
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Lcom/android/launcher3/allapps/O$a;

    .line 28
    .line 29
    iget v4, v3, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 30
    .line 31
    const/16 v5, 0x40

    .line 32
    .line 33
    const/4 v6, 0x0

    .line 34
    if-ne v4, v5, :cond_1

    .line 35
    .line 36
    new-instance v1, Lcom/android/launcher3/allapps/i0$e;

    .line 37
    .line 38
    iget-object v4, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 39
    .line 40
    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-direct {v1, p0, v4}, Lcom/android/launcher3/allapps/i0$e;-><init>(Lcom/android/launcher3/allapps/i0;Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->i0()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_0

    .line 52
    .line 53
    add-int/lit8 v2, v2, -0x1

    .line 54
    .line 55
    :cond_0
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->setTargetPosition(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    if-eqz v2, :cond_5

    .line 63
    .line 64
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/allapps/i0;->F0(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 68
    .line 69
    if-nez p0, :cond_5

    .line 70
    .line 71
    iput-object v6, v3, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    iget-object v4, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 75
    .line 76
    if-nez v4, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0, v3}, Lcom/android/launcher3/allapps/i0;->j0(Lcom/android/launcher3/allapps/O$a;)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-nez v4, :cond_3

    .line 83
    .line 84
    :cond_2
    iget v4, v3, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 85
    .line 86
    const/16 v5, 0x80

    .line 87
    .line 88
    if-ne v4, v5, :cond_4

    .line 89
    .line 90
    :cond_3
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    if-eqz v4, :cond_4

    .line 95
    .line 96
    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 97
    .line 98
    const/16 v5, 0x8

    .line 99
    .line 100
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    iput-object v6, v3, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 104
    .line 105
    :cond_4
    add-int/lit8 v2, v2, -0x1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_5
    return-void
.end method

.method private X()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    return-void
.end method

.method private Z()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/r;->F0(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher3/allapps/r;->H(ZJ)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/allapps/h0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/h0;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private c0()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/i0;->n:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->d0()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr v0, p0

    .line 12
    int-to-float p0, v0

    .line 13
    return p0
.end method

.method private h0(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/launcher3/util/f;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->f()Landroid/os/UserHandle;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const-string v1, "com.zte.mifavor.launcher"

    .line 19
    .line 20
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/f;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/android/launcher3/allapps/i0;->r:Landroid/content/Intent;

    .line 25
    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/util/f;->i()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p1, 0x0

    .line 35
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/i0;->C0(Z)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic n0(Ljava/util/List;Lcom/android/launcher3/allapps/AllAppsRecyclerView;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/launcher3/allapps/O$a;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/i0;->j0(Lcom/android/launcher3/allapps/O$a;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/O$a;->g(I)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p2}, Landroid/view/ViewGroup;->invalidate()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic o0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/i0;->I0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/allapps/p0;->f()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/r;->C0(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->a0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic q(Lcom/android/launcher3/allapps/i0;Ljava/util/List;Lcom/android/launcher3/allapps/AllAppsRecyclerView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/i0;->n0(Ljava/util/List;Lcom/android/launcher3/allapps/AllAppsRecyclerView;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic q0(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->h0(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Landroid/view/View;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic r0(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->I0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/allapps/i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic s0(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/i0;->x:Z

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/i0;->B0(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->d0()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Lcom/android/launcher3/allapps/X;

    .line 12
    .line 13
    invoke-direct {v2}, Lcom/android/launcher3/allapps/X;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setChildAttachedConsumer(LI/a;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/allapps/v0;->g:Lcom/android/launcher3/logging/StatsLogManager;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->x3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->v3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 31
    .line 32
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-interface {v1, v2, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->sendToInteractionJankMonitor(Lcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v2, "updatePrivateStateAnimator: lockText visibility: "

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v2, " lockTextAlpha: "

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->A:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/widget/TextView;->getAlpha()F

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v2, "PrivateProfileManager"

    .line 79
    .line 80
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v3, "updatePrivateStateAnimator: settingsCog visibility: "

    .line 89
    .line 90
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 94
    .line 95
    invoke-virtual {v3}, Landroid/widget/ImageButton;->getVisibility()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v3, " settingsCogAlpha: "

    .line 103
    .line 104
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Lcom/android/launcher3/allapps/i0;->B:Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;

    .line 108
    .line 109
    invoke-virtual {v3}, Landroid/widget/ImageButton;->getAlpha()F

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    if-nez p1, :cond_2

    .line 124
    .line 125
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 126
    .line 127
    iget-object p1, p1, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    check-cast p1, Lcom/android/launcher3/allapps/r$e;

    .line 134
    .line 135
    iget-object p1, p1, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 136
    .line 137
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->s:Lcom/android/launcher3/allapps/T;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 140
    .line 141
    .line 142
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_1

    .line 147
    .line 148
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getPersonalAppList()Lcom/android/launcher3/allapps/M;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/M;->c()V

    .line 155
    .line 156
    .line 157
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->i0()Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_2

    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->d0()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 172
    .line 173
    .line 174
    :cond_2
    return-void
.end method

.method public static synthetic t(Lcom/android/launcher3/allapps/i0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->q0(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->w0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic u(Lcom/android/launcher3/allapps/i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->v0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic u0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->w0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic v(Lcom/android/launcher3/allapps/i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->o0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->w0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic w(LD1/t;Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/util/N2;->d()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private w0(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->e3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->f3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/v0;->m(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/i0;->D0(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic x(Lcom/android/launcher3/allapps/i0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->r0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/android/launcher3/allapps/i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z(Lcom/android/launcher3/allapps/i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/i0;->u0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A0(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Ljava/util/List;II)I
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/AllAppsRecyclerView;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;II)I"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v0

    .line 4
    move v3, v2

    .line 5
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    if-ge v1, v4, :cond_4

    .line 10
    .line 11
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    check-cast v4, Lcom/android/launcher3/allapps/O$a;

    .line 16
    .line 17
    iget v5, v4, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 18
    .line 19
    const/16 v6, 0x40

    .line 20
    .line 21
    if-ne v5, v6, :cond_1

    .line 22
    .line 23
    :cond_0
    move v2, v1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    if-eq v2, v0, :cond_3

    .line 26
    .line 27
    if-ne v3, v0, :cond_2

    .line 28
    .line 29
    iget v3, v4, Lcom/android/launcher3/allapps/O$a;->b:I

    .line 30
    .line 31
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    sub-int/2addr v2, p3

    .line 38
    int-to-float v2, v2

    .line 39
    iget-object v5, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 40
    .line 41
    invoke-virtual {v5}, Lcom/android/launcher3/allapps/r;->getHeaderProtectionHeight()F

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    sub-float/2addr v2, v5

    .line 46
    float-to-double v5, v2

    .line 47
    int-to-double v7, p4

    .line 48
    div-double/2addr v5, v7

    .line 49
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide v5

    .line 53
    double-to-int v2, v5

    .line 54
    iget-object v5, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 55
    .line 56
    invoke-virtual {v5}, Lcom/android/launcher3/allapps/r;->Z()Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    xor-int/lit8 v5, v5, 0x1

    .line 61
    .line 62
    sub-int/2addr v2, v5

    .line 63
    iget v4, v4, Lcom/android/launcher3/allapps/O$a;->b:I

    .line 64
    .line 65
    sub-int/2addr v4, v3

    .line 66
    add-int/lit8 v2, v2, -0x1

    .line 67
    .line 68
    if-ne v4, v2, :cond_0

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    move v1, v2

    .line 75
    :goto_2
    if-eq v1, v0, :cond_5

    .line 76
    .line 77
    new-instance p2, Lcom/android/launcher3/allapps/i0$f;

    .line 78
    .line 79
    iget-object p3, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 80
    .line 81
    invoke-virtual {p3}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/allapps/i0$f;-><init>(Lcom/android/launcher3/allapps/i0;Landroid/content/Context;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->setTargetPosition(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    if-eqz p3, :cond_5

    .line 96
    .line 97
    invoke-direct {p0, p1, p3, p2}, Lcom/android/launcher3/allapps/i0;->F0(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;)V

    .line 98
    .line 99
    .line 100
    :cond_5
    return v1
.end method

.method B0(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/i0;->v:Z

    .line 5
    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/i0;->u:Z

    .line 7
    .line 8
    return-void
.end method

.method public C0(Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/i0;->t:Z

    .line 2
    .line 3
    return p1
.end method

.method public D0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/allapps/v0;->o(ZLandroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/i0;->v:Z

    .line 10
    .line 11
    return-void
.end method

.method public E0(Landroid/content/Context;)Ljava/util/function/Predicate;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, LD1/t;->k(Landroid/content/Context;)LD1/t;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->f()Landroid/os/UserHandle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, LD1/t;->l(Landroid/os/UserHandle;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Lcom/android/launcher3/allapps/d0;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/d0;-><init>(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method M(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne p1, v2, :cond_3

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0;->s:Lcom/android/launcher3/allapps/T;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Lcom/android/launcher3/allapps/T;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 22
    .line 23
    invoke-direct {p1, v2}, Lcom/android/launcher3/allapps/T;-><init>(Lcom/android/launcher3/allapps/M;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->s:Lcom/android/launcher3/allapps/T;

    .line 27
    .line 28
    :cond_0
    :goto_0
    iget-object p1, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationCount()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-ge v1, p1, :cond_2

    .line 35
    .line 36
    iget-object p1, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationAt(I)Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->s:Lcom/android/launcher3/allapps/T;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object p1, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->s:Lcom/android/launcher3/allapps/T;

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    :goto_1
    return-void
.end method

.method public N(Ljava/util/ArrayList;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)I"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/O$a;

    .line 2
    .line 3
    const/16 v1, 0x40

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->b:Lcom/android/launcher3/allapps/O;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public O(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/model/data/C;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/android/launcher3/model/data/C;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const v3, 0x7f140310

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->r:Landroid/content/Intent;

    .line 26
    .line 27
    iput-object v2, v1, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->y0()Ls1/d;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iput-object v2, v1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const v3, 0x7f14030f

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iput-object v2, v1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 47
    .line 48
    iget v2, v1, Lcom/android/launcher3/model/data/z;->h:I

    .line 49
    .line 50
    or-int/lit16 v2, v2, 0x2000

    .line 51
    .line 52
    iput v2, v1, Lcom/android/launcher3/model/data/z;->h:I

    .line 53
    .line 54
    new-instance v2, Lcom/android/launcher3/allapps/O$a;

    .line 55
    .line 56
    const/4 v3, 0x2

    .line 57
    invoke-direct {v2, v3}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 58
    .line 59
    .line 60
    iput-object v1, v2, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 61
    .line 62
    new-instance v1, Lcom/android/launcher3/allapps/r0;

    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    const/4 v4, 0x1

    .line 66
    invoke-direct {v1, v0, v3, v4}, Lcom/android/launcher3/allapps/r0;-><init>(Landroid/content/Context;IZ)V

    .line 67
    .line 68
    .line 69
    iput-object v1, v2, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 70
    .line 71
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->b:Lcom/android/launcher3/allapps/O;

    .line 85
    .line 86
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    sub-int/2addr p1, v4

    .line 91
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public P(Ljava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)I"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/O$a;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->b:Lcom/android/launcher3/allapps/O;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public V(Landroid/widget/RelativeLayout;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->z:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const-string p1, "PrivateProfileManager"

    .line 4
    .line 5
    const-string v0, "bindPrivateSpaceHeaderViewElements: Binding private space."

    .line 6
    .line 7
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->K0()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0;->y:Ljava/lang/Runnable;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0;->y:Ljava/lang/Runnable;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method Y()V
    .locals 2

    .line 1
    const-string v0, "PrivateProfileManager#executeLock"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v1, Lcom/android/launcher3/allapps/g0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/g0;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method a0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 11
    .line 12
    iget-object v1, v0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "PrivateProfileManager#expandPrivateSpace"

    .line 19
    .line 20
    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/android/launcher3/y0;->v0()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/r;->W()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v2}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 54
    .line 55
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->f0()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    iget v2, v2, Lcom/android/launcher3/h0;->H2:I

    .line 66
    .line 67
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/android/launcher3/allapps/i0;->A0(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Ljava/util/List;II)I

    .line 68
    .line 69
    .line 70
    const/4 v0, 0x1

    .line 71
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/i0;->I0(Z)V

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method b0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/i0;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method d0()Lcom/android/launcher3/allapps/AllAppsRecyclerView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 13
    .line 14
    return-object p0
.end method

.method e0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->D:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method f0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/i0;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Ljava/util/function/Predicate;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/function/Predicate<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->l:Ljava/util/function/Predicate;

    .line 2
    .line 3
    return-object p0
.end method

.method g0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/i0;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public i0()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/android/launcher3/util/p2;

    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/util/p2;->i:Landroid/net/Uri;

    .line 24
    .line 25
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    return v2
.end method

.method j0(Lcom/android/launcher3/allapps/O$a;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->e()Ljava/util/function/Predicate;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p1, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    iget-object p0, p1, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 18
    .line 19
    instance-of p0, p0, Lcom/android/launcher3/model/data/C;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public k0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/i0;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method l0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/i0;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method m0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/i0;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/allapps/e0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/e0;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 21
    .line 22
    new-instance v1, Lcom/android/launcher3/allapps/f0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/f0;-><init>(Lcom/android/launcher3/allapps/i0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method y0()Ls1/d;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const v0, 0x7f0810f1

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p0}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, v0}, Ls1/b;->t(Landroid/content/Intent$ShortcutIconResource;)Ls1/d;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public z0()V
    .locals 6

    .line 1
    const-string v0, "PrivateProfileManager#reset"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/allapps/i0;->K0()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->d0()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setChildAttachedConsumer(LI/a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v2, p0, Lcom/android/launcher3/allapps/i0;->k:Lcom/android/launcher3/allapps/r;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/16 v3, 0x10

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Lcom/android/launcher3/allapps/D;->r(I)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v3, 0x2

    .line 34
    const/4 v4, 0x1

    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    move v2, v4

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v2, v3

    .line 40
    :goto_0
    invoke-virtual {p0, v2}, Lcom/android/launcher3/allapps/v0;->n(I)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/y0;->u0()Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eqz v5, :cond_1

    .line 48
    .line 49
    iput-object v1, p0, Lcom/android/launcher3/allapps/i0;->C:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 50
    .line 51
    :cond_1
    if-eqz v0, :cond_2

    .line 52
    .line 53
    if-eq v0, v2, :cond_2

    .line 54
    .line 55
    move v1, v4

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    const/4 v1, 0x0

    .line 58
    :goto_1
    iput-boolean v1, p0, Lcom/android/launcher3/allapps/i0;->x:Z

    .line 59
    .line 60
    if-ne v0, v3, :cond_3

    .line 61
    .line 62
    if-ne v2, v4, :cond_3

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->x0()V

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_3
    if-ne v0, v4, :cond_4

    .line 69
    .line 70
    if-ne v2, v3, :cond_4

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/i0;->Y()V

    .line 73
    .line 74
    .line 75
    :cond_4
    :goto_2
    invoke-virtual {p0, v2}, Lcom/android/launcher3/allapps/i0;->M(I)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 79
    .line 80
    .line 81
    return-void
.end method
