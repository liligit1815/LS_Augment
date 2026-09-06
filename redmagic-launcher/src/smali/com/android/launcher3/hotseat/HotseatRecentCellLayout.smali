.class public Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;
.super Lcom/android/launcher3/CellLayout;
.source "HotseatRecentCellLayout.java"


# static fields
.field public static final A0:Landroid/animation/TimeInterpolator;

.field public static final z0:Landroid/animation/TimeInterpolator;


# instance fields
.field private x0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field

.field private y0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const v0, 0x3f2e147b    # 0.68f

    .line 2
    .line 3
    .line 4
    const v1, 0x3ea8f5c3    # 0.33f

    .line 5
    .line 6
    .line 7
    const/high16 v2, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-static {v1, v2, v0, v2}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->z0:Landroid/animation/TimeInterpolator;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const v1, 0x3f2147ae    # 0.63f

    .line 17
    .line 18
    .line 19
    const v3, 0x3ebd70a4    # 0.37f

    .line 20
    .line 21
    .line 22
    invoke-static {v3, v0, v1, v2}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->A0:Landroid/animation/TimeInterpolator;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    return-void
.end method

.method public static synthetic H0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->U0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic I0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic J0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic K0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;ILcom/android/launcher3/model/data/I;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->P0(ILcom/android/launcher3/model/data/I;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic L0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->Y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic M0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->e1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic N0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method private O0(Landroid/view/View;Lcom/android/launcher3/model/data/I;I)V
    .locals 6

    .line 1
    new-instance v4, Lc1/b;

    .line 2
    .line 3
    iget v0, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 4
    .line 5
    iget v1, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v4, p3, v2, v0, v1}, Lc1/b;-><init>(IIII)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getViewId()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const/4 v5, 0x1

    .line 16
    move-object v0, p0

    .line 17
    move-object v1, p1

    .line 18
    move v2, p3

    .line 19
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, v1}, Lcom/android/launcher3/K5;->setupLp(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private P0(ILcom/android/launcher3/model/data/I;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p3}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iget-object p3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p3, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 15
    .line 16
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-direct {p0, p2, p1, p3, v0}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->Q0(Lcom/android/launcher3/model/data/I;ILcom/android/launcher3/C2;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 p2, 0x2

    .line 26
    new-array p2, p2, [F

    .line 27
    .line 28
    fill-array-data p2, :array_0

    .line 29
    .line 30
    .line 31
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    const-wide/16 v0, 0xc8

    .line 36
    .line 37
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    sget-object p3, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->A0:Landroid/animation/TimeInterpolator;

    .line 41
    .line 42
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 43
    .line 44
    .line 45
    new-instance p3, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$g;

    .line 46
    .line 47
    invoke-direct {p3, p0, p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$g;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$h;

    .line 54
    .line 55
    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$h;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Landroid/animation/ValueAnimator;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->start()V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    nop

    .line 71
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private Q0(Lcom/android/launcher3/model/data/I;ILcom/android/launcher3/C2;Z)Landroid/view/View;
    .locals 6

    .line 1
    const/4 v5, -0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->R0(Lcom/android/launcher3/model/data/I;ILcom/android/launcher3/C2;ZI)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private R0(Lcom/android/launcher3/model/data/I;ILcom/android/launcher3/C2;ZI)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->b()Lcom/android/launcher3/util/B0;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3, p1, p0}, Lcom/android/launcher3/util/B0;->a(Lcom/android/launcher3/model/data/I;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    if-ltz p5, :cond_0

    .line 10
    .line 11
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p5

    .line 15
    const v0, 0x7f0b04c8

    .line 16
    .line 17
    .line 18
    invoke-virtual {p3, v0, p5}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p5

    .line 25
    invoke-static {p5}, Lx1/O;->M2(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p5

    .line 29
    if-nez p5, :cond_1

    .line 30
    .line 31
    new-instance p5, Lp1/b;

    .line 32
    .line 33
    invoke-direct {p5, p0}, Lp1/b;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3, p5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    if-eqz p4, :cond_2

    .line 40
    .line 41
    invoke-direct {p0, p3, p1, p2}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->O0(Landroid/view/View;Lcom/android/launcher3/model/data/I;I)V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-object p3
.end method

.method private S0(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/I;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    if-eqz p2, :cond_2

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    :cond_2
    :goto_0
    return p0
.end method

.method private T0(Ljava/util/ArrayList;Ljava/util/ArrayList;Z)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;Z)I"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eqz p1, :cond_8

    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto :goto_4

    .line 7
    :cond_0
    if-eqz p3, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eq v1, v2, :cond_2

    .line 20
    .line 21
    :cond_1
    if-nez p3, :cond_8

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int/lit8 v1, v1, -0x1

    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ne v1, v2, :cond_8

    .line 34
    .line 35
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    .line 36
    .line 37
    if-eqz p3, :cond_3

    .line 38
    .line 39
    move-object v2, p1

    .line 40
    goto :goto_0

    .line 41
    :cond_3
    move-object v2, p2

    .line 42
    :goto_0
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ljava/util/ArrayList;

    .line 46
    .line 47
    if-eqz p3, :cond_4

    .line 48
    .line 49
    move-object p1, p2

    .line 50
    :cond_4
    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 51
    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    move p2, p1

    .line 55
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-ge p2, p3, :cond_8

    .line 60
    .line 61
    move p3, p1

    .line 62
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-ge p3, v3, :cond_7

    .line 67
    .line 68
    if-lt p3, p2, :cond_5

    .line 69
    .line 70
    add-int/lit8 v3, p3, 0x1

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_5
    move v3, p3

    .line 74
    :goto_3
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 79
    .line 80
    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 85
    .line 86
    invoke-direct {p0, v3, v4}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->S0(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/I;)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-nez v3, :cond_6

    .line 91
    .line 92
    add-int/lit8 p2, p2, 0x1

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_6
    add-int/lit8 p3, p3, 0x1

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_7
    return p2

    .line 99
    :cond_8
    :goto_4
    return v0
.end method

.method private synthetic U0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static X0(Lcom/android/launcher3/Hotseat;)V
    .locals 3

    .line 1
    const-string v0, "HotseatRecentCellLayout"

    .line 2
    .line 3
    const-string v1, "resetTagWhenChildToPositionEnd"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v2, 0x7f0b04c5

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    instance-of v0, v0, Landroid/graphics/Point;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    const v0, 0x7f0b04c6

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    const v0, 0x7f0b04c7

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private Y0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    add-int/lit8 v0, v0, -0x1

    .line 12
    .line 13
    :goto_0
    if-ltz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    instance-of v2, v2, Lc1/b;

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lc1/b;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Lc1/b;->e(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method

.method private b1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v6, p2

    .line 4
    .line 5
    const/4 v9, 0x1

    .line 6
    move-object/from16 v7, p1

    .line 7
    .line 8
    invoke-direct {v1, v7, v6, v9}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->T0(Ljava/util/ArrayList;Ljava/util/ArrayList;Z)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v10, 0x0

    .line 13
    if-gez v2, :cond_0

    .line 14
    .line 15
    return v10

    .line 16
    :cond_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v11

    .line 20
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    iget-object v0, v1, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    if-nez v8, :cond_1

    .line 35
    .line 36
    return v10

    .line 37
    :cond_1
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 42
    .line 43
    iget-object v4, v1, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v4, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {v1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->e1()V

    .line 49
    .line 50
    .line 51
    const/4 v4, 0x1

    .line 52
    move-object/from16 v16, v1

    .line 53
    .line 54
    move-object v1, v0

    .line 55
    move-object/from16 v0, v16

    .line 56
    .line 57
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->R0(Lcom/android/launcher3/model/data/I;ILcom/android/launcher3/C2;ZI)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    move v12, v2

    .line 62
    move-object v14, v3

    .line 63
    move v13, v5

    .line 64
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->Y0()V

    .line 65
    .line 66
    .line 67
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const v2, 0x7f0b04c8

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x4

    .line 78
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-ne v0, v9, :cond_2

    .line 92
    .line 93
    move v2, v9

    .line 94
    goto :goto_0

    .line 95
    :cond_2
    move v2, v10

    .line 96
    :goto_0
    const/4 v0, 0x2

    .line 97
    new-array v0, v0, [F

    .line 98
    .line 99
    fill-array-data v0, :array_0

    .line 100
    .line 101
    .line 102
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 103
    .line 104
    .line 105
    move-result-object v15

    .line 106
    sget-object v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->A0:Landroid/animation/TimeInterpolator;

    .line 107
    .line 108
    invoke-virtual {v15, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 109
    .line 110
    .line 111
    const-wide/16 v3, 0xc8

    .line 112
    .line 113
    invoke-virtual {v15, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 114
    .line 115
    .line 116
    new-instance v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$c;

    .line 117
    .line 118
    move v7, v2

    .line 119
    const/4 v2, 0x0

    .line 120
    const/high16 v3, 0x3f800000    # 1.0f

    .line 121
    .line 122
    const v4, 0x3f4ccccd    # 0.8f

    .line 123
    .line 124
    .line 125
    const/high16 v5, 0x3f800000    # 1.0f

    .line 126
    .line 127
    move-object v6, v1

    .line 128
    move-object/from16 v1, p0

    .line 129
    .line 130
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$c;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;FFFFLandroid/view/View;ZLcom/android/launcher3/Hotseat;)V

    .line 131
    .line 132
    .line 133
    move-object v5, v6

    .line 134
    move-object v3, v8

    .line 135
    invoke-virtual {v15, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 136
    .line 137
    .line 138
    new-instance v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;

    .line 139
    .line 140
    move v2, v7

    .line 141
    move-object v4, v15

    .line 142
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;ZLcom/android/launcher3/Hotseat;Landroid/animation/ValueAnimator;Landroid/view/View;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v4, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 146
    .line 147
    .line 148
    new-instance v0, Lp1/c;

    .line 149
    .line 150
    invoke-direct {v0, v1, v4}, Lp1/c;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Landroid/animation/ValueAnimator;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v10}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 154
    .line 155
    .line 156
    :goto_1
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    if-ge v10, v2, :cond_5

    .line 165
    .line 166
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v2, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    if-nez v2, :cond_3

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_3
    if-le v10, v12, :cond_4

    .line 178
    .line 179
    add-int/lit8 v3, v10, -0x1

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_4
    move v3, v10

    .line 183
    :goto_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    const v4, 0x7f0b04c4

    .line 188
    .line 189
    .line 190
    invoke-virtual {v2, v4, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    const v4, 0x7f0b04c3

    .line 198
    .line 199
    .line 200
    invoke-virtual {v2, v4, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    :goto_3
    add-int/2addr v10, v9

    .line 204
    goto :goto_1

    .line 205
    :cond_5
    invoke-virtual {v14}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    const v3, 0x7f0b04c7

    .line 210
    .line 211
    .line 212
    sget-object v4, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->z0:Landroid/animation/TimeInterpolator;

    .line 213
    .line 214
    invoke-virtual {v2, v3, v4}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v14}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    const/16 v3, 0x12c

    .line 222
    .line 223
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    const v4, 0x7f0b04c6

    .line 228
    .line 229
    .line 230
    invoke-virtual {v2, v4, v3}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    new-instance v2, Landroid/graphics/Point;

    .line 234
    .line 235
    invoke-direct {v2, v11, v13}, Landroid/graphics/Point;-><init>(II)V

    .line 236
    .line 237
    .line 238
    const v3, 0x7f0b04c5

    .line 239
    .line 240
    .line 241
    invoke-virtual {v1, v3, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 242
    .line 243
    .line 244
    iget-object v2, v1, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 245
    .line 246
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->i()V

    .line 255
    .line 256
    .line 257
    const-wide/16 v2, 0x64

    .line 258
    .line 259
    invoke-virtual {v1, v0, v2, v3}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 260
    .line 261
    .line 262
    return v9

    .line 263
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private c1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    move-object/from16 v3, p2

    .line 5
    .line 6
    invoke-direct {p0, v0, v3, v2}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->T0(Ljava/util/ArrayList;Ljava/util/ArrayList;Z)I

    .line 7
    .line 8
    .line 9
    move-result v7

    .line 10
    if-gez v7, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 14
    .line 15
    invoke-static {v4}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    if-nez v5, :cond_1

    .line 24
    .line 25
    return v2

    .line 26
    :cond_1
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    move-object v8, v4

    .line 31
    check-cast v8, Lcom/android/launcher3/model/data/I;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-ge v7, v4, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    if-eqz v4, :cond_2

    .line 52
    .line 53
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    instance-of v6, v6, Lcom/android/launcher3/model/data/I;

    .line 58
    .line 59
    if-eqz v6, :cond_2

    .line 60
    .line 61
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 66
    .line 67
    invoke-direct {p0, v6, v8}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->S0(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/I;)Z

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    if-eqz v6, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 v4, 0x0

    .line 75
    :goto_0
    if-nez v4, :cond_3

    .line 76
    .line 77
    const-string v0, "HotseatRecentCellLayout"

    .line 78
    .line 79
    const-string v1, "handleRemove view data not same"

    .line 80
    .line 81
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    return v2

    .line 85
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 86
    .line 87
    .line 88
    move-result v6

    .line 89
    const/4 v10, 0x1

    .line 90
    if-ne v6, v10, :cond_4

    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    if-nez v6, :cond_4

    .line 97
    .line 98
    move v2, v10

    .line 99
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 100
    .line 101
    .line 102
    move-result v9

    .line 103
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 104
    .line 105
    .line 106
    move-result v11

    .line 107
    const/4 v0, 0x2

    .line 108
    new-array v0, v0, [F

    .line 109
    .line 110
    fill-array-data v0, :array_0

    .line 111
    .line 112
    .line 113
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 114
    .line 115
    .line 116
    move-result-object v12

    .line 117
    sget-object v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->A0:Landroid/animation/TimeInterpolator;

    .line 118
    .line 119
    invoke-virtual {v12, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 120
    .line 121
    .line 122
    const-wide/16 v13, 0x96

    .line 123
    .line 124
    invoke-virtual {v12, v13, v14}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 125
    .line 126
    .line 127
    new-instance v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$a;

    .line 128
    .line 129
    move-object v6, v5

    .line 130
    move v5, v2

    .line 131
    const/high16 v2, 0x3f800000    # 1.0f

    .line 132
    .line 133
    const/4 v3, 0x0

    .line 134
    move-object v1, p0

    .line 135
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$a;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;FFLandroid/view/View;ZLcom/android/launcher3/Hotseat;)V

    .line 136
    .line 137
    .line 138
    move-object v3, v4

    .line 139
    invoke-virtual {v12, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 140
    .line 141
    .line 142
    new-instance v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;

    .line 143
    .line 144
    move v4, v5

    .line 145
    move-object v5, v6

    .line 146
    move v6, v7

    .line 147
    move-object v2, v8

    .line 148
    move v7, v9

    .line 149
    move v8, v11

    .line 150
    move-object v9, v12

    .line 151
    invoke-direct/range {v0 .. v9}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Lcom/android/launcher3/model/data/I;Landroid/view/View;ZLcom/android/launcher3/Hotseat;IIILandroid/animation/ValueAnimator;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v9, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v9}, Landroid/animation/ValueAnimator;->start()V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    .line 161
    .line 162
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    return v10

    .line 166
    nop

    .line 167
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private d1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_8

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-ne v2, v3, :cond_8

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_8

    .line 24
    .line 25
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    goto/16 :goto_4

    .line 32
    .line 33
    :cond_1
    const/4 v2, -0x1

    .line 34
    move v3, v1

    .line 35
    move v4, v2

    .line 36
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-ge v3, v5, :cond_4

    .line 41
    .line 42
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    check-cast v5, Lcom/android/launcher3/model/data/I;

    .line 47
    .line 48
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 53
    .line 54
    invoke-direct {p0, v5, v6}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->S0(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/I;)Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-nez v5, :cond_3

    .line 59
    .line 60
    if-ltz v4, :cond_2

    .line 61
    .line 62
    move v7, v2

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    move v4, v3

    .line 65
    :cond_3
    add-int/2addr v3, v0

    .line 66
    goto :goto_0

    .line 67
    :cond_4
    move v7, v4

    .line 68
    :goto_1
    if-gez v7, :cond_5

    .line 69
    .line 70
    return v1

    .line 71
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-ge v7, p1, :cond_6

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    :goto_2
    move-object v9, p1

    .line 90
    goto :goto_3

    .line 91
    :cond_6
    const/4 p1, 0x0

    .line 92
    goto :goto_2

    .line 93
    :goto_3
    if-nez v9, :cond_7

    .line 94
    .line 95
    return v1

    .line 96
    :cond_7
    const/4 p1, 0x2

    .line 97
    new-array p1, p1, [F

    .line 98
    .line 99
    fill-array-data p1, :array_0

    .line 100
    .line 101
    .line 102
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 103
    .line 104
    .line 105
    move-result-object v10

    .line 106
    const-wide/16 v1, 0xc8

    .line 107
    .line 108
    invoke-virtual {v10, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 109
    .line 110
    .line 111
    sget-object p1, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->A0:Landroid/animation/TimeInterpolator;

    .line 112
    .line 113
    invoke-virtual {v10, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 114
    .line 115
    .line 116
    new-instance p1, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$e;

    .line 117
    .line 118
    invoke-direct {p1, p0, v9}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$e;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Landroid/view/View;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v10, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 122
    .line 123
    .line 124
    new-instance v5, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;

    .line 125
    .line 126
    move-object v6, p0

    .line 127
    move-object v8, p2

    .line 128
    invoke-direct/range {v5 .. v10}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;-><init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;ILjava/util/ArrayList;Landroid/view/View;Landroid/animation/ValueAnimator;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v10, v5}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v10}, Landroid/animation/ValueAnimator;->start()V

    .line 135
    .line 136
    .line 137
    iget-object p0, v6, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    .line 138
    .line 139
    invoke-virtual {p0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    return v0

    .line 143
    :cond_8
    :goto_4
    return v1

    .line 144
    nop

    .line 145
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private e1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public V0(Lcom/android/launcher3/Hotseat;ZIIII)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getLeft()I

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p4}, Landroid/view/ViewGroup;->getRight()I

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 23
    .line 24
    .line 25
    move-result-object p4

    .line 26
    invoke-virtual {p4}, Landroid/view/ViewGroup;->getTop()I

    .line 27
    .line 28
    .line 29
    move-result p4

    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBottom()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iget p2, p2, Lcom/android/launcher3/h0;->T0:I

    .line 43
    .line 44
    add-int/2addr p2, p3

    .line 45
    invoke-virtual {p0, p3, p4, p2, p1}, Landroid/view/ViewGroup;->layout(IIII)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public W0(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->T0()Lcom/android/launcher3/dragndrop/p$a;

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public Z0(Ljava/util/ArrayList;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_3

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "HotseatRecentCellLayout"

    .line 12
    .line 13
    if-eqz v0, :cond_9

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    goto/16 :goto_4

    .line 22
    .line 23
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v3, "updateDatas mRunningAnim not empty, size="

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    new-instance v2, Ljava/util/ArrayList;

    .line 58
    .line 59
    iget-object v3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->y0:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Landroid/animation/Animator;

    .line 79
    .line 80
    invoke-virtual {v3}, Landroid/animation/Animator;->end()V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    if-eqz p2, :cond_5

    .line 85
    .line 86
    new-instance p2, Ljava/util/ArrayList;

    .line 87
    .line 88
    iget-object v2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {p2, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->c1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_3

    .line 98
    .line 99
    const-string p0, "updateDatasHandleByRemove handled"

    .line 100
    .line 101
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->b1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-eqz v2, :cond_4

    .line 110
    .line 111
    const-string p0, "updateDatasHandleByAdded handled"

    .line 112
    .line 113
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->d1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-eqz p2, :cond_5

    .line 122
    .line 123
    const-string p0, "updateDatasHandleByReplaced handled"

    .line 124
    .line 125
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    const-string v2, "updateDatas without animation or below all not handle, enter itemList="

    .line 135
    .line 136
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 156
    .line 157
    .line 158
    const/4 p2, 0x0

    .line 159
    move v1, p2

    .line 160
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    if-ge v1, v2, :cond_7

    .line 165
    .line 166
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 171
    .line 172
    iget-object v3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    const/4 v4, 0x3

    .line 179
    if-ge v3, v4, :cond_6

    .line 180
    .line 181
    iget-object v3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 182
    .line 183
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    if-nez v3, :cond_6

    .line 188
    .line 189
    iget-object v3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    const/4 v1, 0x1

    .line 204
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 212
    .line 213
    .line 214
    :goto_2
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 215
    .line 216
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    if-ge p2, p1, :cond_8

    .line 221
    .line 222
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 223
    .line 224
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 229
    .line 230
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->Q0(Lcom/android/launcher3/model/data/I;ILcom/android/launcher3/C2;Z)Landroid/view/View;

    .line 231
    .line 232
    .line 233
    add-int/lit8 p2, p2, 0x1

    .line 234
    .line 235
    goto :goto_2

    .line 236
    :cond_8
    :goto_3
    return-void

    .line 237
    :cond_9
    :goto_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .line 241
    .line 242
    const-string p1, "recentApp: updateDatas return because "

    .line 243
    .line 244
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    if-nez v0, :cond_a

    .line 248
    .line 249
    const-string p1, "launcher"

    .line 250
    .line 251
    goto :goto_5

    .line 252
    :cond_a
    const-string p1, "hotseat"

    .line 253
    .line 254
    :goto_5
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    const-string p1, " is null!!!"

    .line 258
    .line 259
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    .line 268
    .line 269
    return-void
.end method

.method public a1(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lx1/O;->H2(Lcom/android/launcher3/C2;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->T()Lcom/android/launcher3/MFVDockExpandSupport;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/MFVDockExpandSupport;->r()Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->Z0(Ljava/util/ArrayList;Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public getRecentCount()I
    .locals 2

    .line 1
    const v0, 0x7f0b04c5

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v1, v0, Landroid/graphics/Point;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast v0, Landroid/graphics/Point;

    .line 13
    .line 14
    iget p0, v0, Landroid/graphics/Point;->x:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->x0:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method protected i0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
