.class public Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;
.super Lcom/android/launcher3/views/RecyclerViewFastScroller;
.source "AlphabeticalScroller.java"


# instance fields
.field private T:Landroid/graphics/Paint;

.field private U:Ljava/lang/String;

.field private final V:I

.field private final W:I

.field private final a0:I

.field private final b0:I

.field c0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private d0:F

.field private final e0:Lcom/android/launcher3/v;

.field private f0:I

.field private g0:I

.field private h0:Z

.field i0:I

.field j0:I

.field private k0:J

.field private l0:I

.field private m0:Z

.field private n0:Z

.field private final o0:Ljava/lang/Runnable;

.field private p0:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/views/RecyclerViewFastScroller;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p2, ""

    iput-object p2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->U:Ljava/lang/String;

    .line 4
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->c0:Ljava/util/ArrayList;

    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->n0:Z

    .line 6
    new-instance p3, LQ0/a;

    invoke-direct {p3, p0}, LQ0/a;-><init>(Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;)V

    iput-object p3, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->o0:Ljava/lang/Runnable;

    .line 7
    iput-boolean p2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->p0:Z

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f0700d4

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->l0:I

    .line 9
    invoke-static {}, Lx1/B;->c()V

    .line 10
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    const/4 v0, 0x1

    .line 11
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 12
    iget-object p3, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->l0:I

    int-to-float v0, v0

    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f07030d

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->V:I

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f07031f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr v0, p3

    iput v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->W:I

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f07010f

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    iput p3, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->a0:I

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f070111

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->b0:I

    .line 17
    iget-object p3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->p:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060041

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {p3, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    invoke-static {p1}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->e0:Lcom/android/launcher3/v;

    .line 19
    iput-boolean p2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/h0;->M0()I

    move-result p1

    sub-int/2addr p1, v0

    .line 21
    iput p1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->i0:I

    return-void
.end method

.method private o(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbarTrackHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q:I

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    iget v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->D:I

    .line 11
    .line 12
    sub-int v1, p1, v1

    .line 13
    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    invoke-direct {p0, p1}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->s(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Lcom/android/launcher3/s0;->f(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->H:Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    iput-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->H:Ljava/lang/CharSequence;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->F:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    xor-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->c(Z)V

    .line 59
    .line 60
    .line 61
    :cond_1
    iput v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->w:F

    .line 62
    .line 63
    float-to-int v0, v0

    .line 64
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->setThumbOffsetY(I)V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->U:Ljava/lang/String;

    .line 68
    .line 69
    return-void
.end method

.method public static synthetic r(Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private s(I)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->c0:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "AlphabeticalScroller"

    .line 12
    .line 13
    const-string p1, "mTouchAlphabetY size is 0"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_0
    int-to-float p1, p1

    .line 20
    iget-object v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->c0:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Float;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    cmpl-float v0, p1, v0

    .line 34
    .line 35
    if-lez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->c0:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ljava/lang/Float;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    sub-float/2addr p1, v0

    .line 50
    iget v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->d0:F

    .line 51
    .line 52
    div-float/2addr p1, v0

    .line 53
    float-to-int p1, p1

    .line 54
    iget-object p0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->c0:Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-ge p1, p0, :cond_1

    .line 61
    .line 62
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    array-length p0, p0

    .line 67
    if-ge p1, p0, :cond_1

    .line 68
    .line 69
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    aget-object p0, p0, p1

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_1
    return-object v1
.end method

.method private synthetic v()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 5
    .line 6
    check-cast v3, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 7
    .line 8
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getApps()Lcom/android/launcher3/allapps/M;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-ge v2, v3, :cond_1

    .line 21
    .line 22
    iget-object v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 23
    .line 24
    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    iget-object v4, v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v4}, Landroid/view/View;->clearAnimation()V

    .line 33
    .line 34
    .line 35
    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    const/4 v5, 0x2

    .line 42
    new-array v5, v5, [F

    .line 43
    .line 44
    aput v4, v5, v1

    .line 45
    .line 46
    const/high16 v4, 0x3f800000    # 1.0f

    .line 47
    .line 48
    aput v4, v5, v0

    .line 49
    .line 50
    const-string v4, "alpha"

    .line 51
    .line 52
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    const-wide/16 v4, 0x12c

    .line 57
    .line 58
    invoke-virtual {v3, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 59
    .line 60
    .line 61
    sget-object v4, Lcom/android/launcher3/anim/L;->L:Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    invoke-virtual {v3, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Landroid/animation/ObjectAnimator;->start()V

    .line 67
    .line 68
    .line 69
    :cond_0
    add-int/2addr v2, v0

    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iput-boolean v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->n0:Z

    .line 72
    .line 73
    return-void
.end method


# virtual methods
.method public f(Landroid/view/MotionEvent;Landroid/graphics/Point;)Z
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    float-to-int p2, p2

    .line 14
    iput p2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->j0:I

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    float-to-int p2, p2

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sub-int/2addr p2, v1

    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    float-to-int v1, v1

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    sub-int/2addr v1, v2

    .line 36
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const/4 v3, 0x3

    .line 41
    const/4 v4, 0x2

    .line 42
    const/4 v5, 0x1

    .line 43
    if-eqz v2, :cond_6

    .line 44
    .line 45
    if-eq v2, v5, :cond_2

    .line 46
    .line 47
    if-eq v2, v4, :cond_1

    .line 48
    .line 49
    if-eq v2, v3, :cond_3

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v6

    .line 57
    iget-wide v8, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->k0:J

    .line 58
    .line 59
    sub-long v8, v6, v8

    .line 60
    .line 61
    const-wide/16 v10, 0x14

    .line 62
    .line 63
    cmp-long p2, v8, v10

    .line 64
    .line 65
    if-lez p2, :cond_c

    .line 66
    .line 67
    iput-boolean v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->m0:Z

    .line 68
    .line 69
    iput-wide v6, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->k0:J

    .line 70
    .line 71
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 72
    .line 73
    iput-boolean v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 74
    .line 75
    iget-boolean p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 76
    .line 77
    if-eqz p2, :cond_c

    .line 78
    .line 79
    iget p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->M:I

    .line 80
    .line 81
    invoke-virtual {p0, p2, v1}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->u(II)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-eqz p2, :cond_c

    .line 86
    .line 87
    invoke-direct {p0, v1}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->o(I)V

    .line 88
    .line 89
    .line 90
    goto/16 :goto_0

    .line 91
    .line 92
    :cond_2
    iput-boolean v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 93
    .line 94
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 95
    .line 96
    invoke-virtual {p2}, Lcom/android/launcher3/s0;->c()V

    .line 97
    .line 98
    .line 99
    iput v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->D:I

    .line 100
    .line 101
    const/4 p2, 0x0

    .line 102
    iput p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->w:F

    .line 103
    .line 104
    iput-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->B:Z

    .line 105
    .line 106
    iput-boolean v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 107
    .line 108
    iget-boolean p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 109
    .line 110
    if-eqz p2, :cond_4

    .line 111
    .line 112
    iput-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->c(Z)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n(Z)V

    .line 118
    .line 119
    .line 120
    :cond_4
    iget-boolean p2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->m0:Z

    .line 121
    .line 122
    if-eqz p2, :cond_5

    .line 123
    .line 124
    iput-boolean v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->m0:Z

    .line 125
    .line 126
    invoke-static {}, Lh1/a;->c()V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_0

    .line 130
    .line 131
    :cond_5
    invoke-static {}, Lh1/a;->b()V

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_6
    iget-object v2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->e0:Lcom/android/launcher3/v;

    .line 136
    .line 137
    const/16 v6, 0x100

    .line 138
    .line 139
    invoke-static {v2, v6}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    if-eqz v2, :cond_7

    .line 144
    .line 145
    iget-object v2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->e0:Lcom/android/launcher3/v;

    .line 146
    .line 147
    invoke-static {v2, v6}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v2, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 152
    .line 153
    .line 154
    :cond_7
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 155
    .line 156
    instance-of v6, v2, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 157
    .line 158
    if-eqz v6, :cond_8

    .line 159
    .line 160
    iget-object v6, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->o0:Ljava/lang/Runnable;

    .line 161
    .line 162
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 163
    .line 164
    .line 165
    iput-boolean v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->n0:Z

    .line 166
    .line 167
    :cond_8
    iput p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->M:I

    .line 168
    .line 169
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 170
    .line 171
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->N:I

    .line 172
    .line 173
    iput-boolean v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 174
    .line 175
    iget p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->j:I

    .line 176
    .line 177
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 178
    .line 179
    .line 180
    move-result p2

    .line 181
    int-to-float p2, p2

    .line 182
    iget v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->k:F

    .line 183
    .line 184
    cmpg-float p2, p2, v2

    .line 185
    .line 186
    if-gez p2, :cond_9

    .line 187
    .line 188
    iget-object p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 189
    .line 190
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getScrollState()I

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    if-eqz p2, :cond_9

    .line 195
    .line 196
    iget-object p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 197
    .line 198
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 199
    .line 200
    .line 201
    :cond_9
    iget-object p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 202
    .line 203
    invoke-virtual {p2}, Lcom/android/launcher3/s0;->i()Z

    .line 204
    .line 205
    .line 206
    move-result p2

    .line 207
    if-eqz p2, :cond_a

    .line 208
    .line 209
    iget p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->M:I

    .line 210
    .line 211
    iget v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 212
    .line 213
    invoke-virtual {p0, p2, v2}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->u(II)Z

    .line 214
    .line 215
    .line 216
    move-result p2

    .line 217
    if-eqz p2, :cond_a

    .line 218
    .line 219
    iget p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->N:I

    .line 220
    .line 221
    iget v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 222
    .line 223
    invoke-virtual {p0, p2, v2}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->d(II)V

    .line 224
    .line 225
    .line 226
    invoke-direct {p0, v1}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->o(I)V

    .line 227
    .line 228
    .line 229
    :cond_a
    iget-object p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 230
    .line 231
    instance-of v1, p2, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 232
    .line 233
    if-eqz v1, :cond_b

    .line 234
    .line 235
    check-cast p2, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 236
    .line 237
    invoke-virtual {p2, v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setLastTouchX(I)V

    .line 238
    .line 239
    .line 240
    iget-object p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 241
    .line 242
    invoke-virtual {p2, v4}, Landroid/view/ViewGroup;->setOverScrollMode(I)V

    .line 243
    .line 244
    .line 245
    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 246
    .line 247
    .line 248
    move-result-wide v1

    .line 249
    iput-wide v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->k0:J

    .line 250
    .line 251
    :cond_c
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 252
    .line 253
    .line 254
    move-result p2

    .line 255
    if-eq p2, v5, :cond_d

    .line 256
    .line 257
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    if-ne p1, v3, :cond_f

    .line 262
    .line 263
    :cond_d
    iget-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 264
    .line 265
    instance-of p2, p1, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 266
    .line 267
    if-eqz p2, :cond_f

    .line 268
    .line 269
    check-cast p1, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 270
    .line 271
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getPositionScrollTo()[I

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    if-eqz p1, :cond_e

    .line 276
    .line 277
    array-length p2, p1

    .line 278
    if-ne p2, v4, :cond_e

    .line 279
    .line 280
    aget p2, p1, v0

    .line 281
    .line 282
    const/4 v0, -0x1

    .line 283
    if-ne p2, v0, :cond_e

    .line 284
    .line 285
    aget p1, p1, v5

    .line 286
    .line 287
    if-ne p1, v0, :cond_e

    .line 288
    .line 289
    const-wide/16 p1, 0x15e

    .line 290
    .line 291
    goto :goto_1

    .line 292
    :cond_e
    const-wide/16 p1, 0x3e8

    .line 293
    .line 294
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 295
    .line 296
    iget-object v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->o0:Ljava/lang/Runnable;

    .line 297
    .line 298
    invoke-virtual {v0, v1, p1, p2}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 299
    .line 300
    .line 301
    :cond_f
    iget-boolean p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 302
    .line 303
    return p0
.end method

.method public getIsRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->n0:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsSlideInScroller()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 14

    .line 1
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, LR0/m;->b(Landroid/content/Context;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_d

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    goto/16 :goto_6

    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    instance-of v1, v0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    check-cast v0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->y()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->f0:I

    .line 60
    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->y()V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/4 v1, 0x0

    .line 69
    if-eqz v0, :cond_c

    .line 70
    .line 71
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    array-length v0, v0

    .line 76
    if-lez v0, :cond_c

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget v2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->l0:I

    .line 83
    .line 84
    add-int/2addr v0, v2

    .line 85
    int-to-float v0, v0

    .line 86
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 87
    .line 88
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 93
    .line 94
    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    iput v2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->g0:I

    .line 99
    .line 100
    move v2, v1

    .line 101
    :goto_0
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    array-length v3, v3

    .line 106
    if-ge v2, v3, :cond_c

    .line 107
    .line 108
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    aget-object v3, v3, v2

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 119
    .line 120
    iget v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->V:I

    .line 121
    .line 122
    add-int/2addr v4, v5

    .line 123
    int-to-float v4, v4

    .line 124
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 125
    .line 126
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    const/high16 v6, 0x40000000    # 2.0f

    .line 131
    .line 132
    div-float/2addr v5, v6

    .line 133
    sub-float/2addr v4, v5

    .line 134
    iget v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->a0:I

    .line 135
    .line 136
    int-to-float v5, v5

    .line 137
    sub-float/2addr v4, v5

    .line 138
    iget v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->b0:I

    .line 139
    .line 140
    int-to-float v5, v5

    .line 141
    sub-float/2addr v4, v5

    .line 142
    invoke-virtual {p0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->t()Z

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    const v6, 0x7f06004f

    .line 147
    .line 148
    .line 149
    const v7, 0x7f060050

    .line 150
    .line 151
    .line 152
    const v8, 0x7f060051

    .line 153
    .line 154
    .line 155
    const/4 v9, -0x1

    .line 156
    const v10, 0x7f06059c

    .line 157
    .line 158
    .line 159
    const/4 v11, 0x1

    .line 160
    if-eqz v5, :cond_6

    .line 161
    .line 162
    iget-object v5, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 163
    .line 164
    instance-of v12, v5, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 165
    .line 166
    if-eqz v12, :cond_b

    .line 167
    .line 168
    check-cast v5, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 169
    .line 170
    iget v12, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->g0:I

    .line 171
    .line 172
    iget v13, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->f0:I

    .line 173
    .line 174
    div-int/2addr v12, v13

    .line 175
    invoke-virtual {v5, v12}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    const-string v12, ""

    .line 180
    .line 181
    if-eq v5, v12, :cond_b

    .line 182
    .line 183
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v12

    .line 187
    aget-object v12, v12, v2

    .line 188
    .line 189
    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    if-eqz v5, :cond_2

    .line 194
    .line 195
    iget-boolean v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->p0:Z

    .line 196
    .line 197
    if-nez v5, :cond_2

    .line 198
    .line 199
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 200
    .line 201
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColor(I)I

    .line 206
    .line 207
    .line 208
    move-result v6

    .line 209
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 210
    .line 211
    .line 212
    goto/16 :goto_5

    .line 213
    .line 214
    :cond_2
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->e0:Lcom/android/launcher3/v;

    .line 215
    .line 216
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getForeColor()I

    .line 217
    .line 218
    .line 219
    move-result v5

    .line 220
    if-ne v9, v5, :cond_3

    .line 221
    .line 222
    move v5, v11

    .line 223
    goto :goto_1

    .line 224
    :cond_3
    move v5, v1

    .line 225
    :goto_1
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 226
    .line 227
    .line 228
    move-result-object v9

    .line 229
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    .line 230
    .line 231
    .line 232
    move-result v9

    .line 233
    if-eqz v9, :cond_5

    .line 234
    .line 235
    if-eqz v5, :cond_4

    .line 236
    .line 237
    iget-object v6, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 238
    .line 239
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 240
    .line 241
    .line 242
    move-result-object v7

    .line 243
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 244
    .line 245
    .line 246
    move-result v7

    .line 247
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 248
    .line 249
    .line 250
    goto :goto_2

    .line 251
    :cond_4
    iget-object v6, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 252
    .line 253
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 254
    .line 255
    .line 256
    move-result-object v8

    .line 257
    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 258
    .line 259
    .line 260
    move-result v7

    .line 261
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 262
    .line 263
    .line 264
    :goto_2
    iget-object v6, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 265
    .line 266
    invoke-static {v6, v5}, Lcom/android/launcher3/O6;->e(Landroid/graphics/Paint;Z)V

    .line 267
    .line 268
    .line 269
    goto/16 :goto_5

    .line 270
    .line 271
    :cond_5
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 272
    .line 273
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 274
    .line 275
    .line 276
    move-result-object v7

    .line 277
    invoke-virtual {v7, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 278
    .line 279
    .line 280
    move-result v6

    .line 281
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 282
    .line 283
    .line 284
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 285
    .line 286
    invoke-static {v5, v11}, Lcom/android/launcher3/O6;->e(Landroid/graphics/Paint;Z)V

    .line 287
    .line 288
    .line 289
    goto :goto_5

    .line 290
    :cond_6
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v5

    .line 294
    aget-object v5, v5, v2

    .line 295
    .line 296
    iget-object v12, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->U:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result v5

    .line 302
    if-eqz v5, :cond_7

    .line 303
    .line 304
    iget-boolean v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->p0:Z

    .line 305
    .line 306
    if-nez v5, :cond_7

    .line 307
    .line 308
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 309
    .line 310
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 311
    .line 312
    .line 313
    move-result-object v6

    .line 314
    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColor(I)I

    .line 315
    .line 316
    .line 317
    move-result v6

    .line 318
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 319
    .line 320
    .line 321
    goto :goto_5

    .line 322
    :cond_7
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->e0:Lcom/android/launcher3/v;

    .line 323
    .line 324
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getForeColor()I

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    if-ne v9, v5, :cond_8

    .line 329
    .line 330
    move v5, v11

    .line 331
    goto :goto_3

    .line 332
    :cond_8
    move v5, v1

    .line 333
    :goto_3
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 334
    .line 335
    .line 336
    move-result-object v9

    .line 337
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    .line 338
    .line 339
    .line 340
    move-result v9

    .line 341
    if-eqz v9, :cond_a

    .line 342
    .line 343
    if-eqz v5, :cond_9

    .line 344
    .line 345
    iget-object v6, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 346
    .line 347
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 348
    .line 349
    .line 350
    move-result-object v7

    .line 351
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 352
    .line 353
    .line 354
    move-result v7

    .line 355
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 356
    .line 357
    .line 358
    goto :goto_4

    .line 359
    :cond_9
    iget-object v6, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 360
    .line 361
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 362
    .line 363
    .line 364
    move-result-object v8

    .line 365
    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 366
    .line 367
    .line 368
    move-result v7

    .line 369
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 370
    .line 371
    .line 372
    :goto_4
    iget-object v6, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 373
    .line 374
    invoke-static {v6, v5}, Lcom/android/launcher3/O6;->e(Landroid/graphics/Paint;Z)V

    .line 375
    .line 376
    .line 377
    goto :goto_5

    .line 378
    :cond_a
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 379
    .line 380
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 381
    .line 382
    .line 383
    move-result-object v7

    .line 384
    invoke-virtual {v7, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 385
    .line 386
    .line 387
    move-result v6

    .line 388
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 389
    .line 390
    .line 391
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 392
    .line 393
    invoke-static {v5, v11}, Lcom/android/launcher3/O6;->e(Landroid/graphics/Paint;Z)V

    .line 394
    .line 395
    .line 396
    :cond_b
    :goto_5
    iget-object v5, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->T:Landroid/graphics/Paint;

    .line 397
    .line 398
    invoke-virtual {p1, v3, v4, v0, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 399
    .line 400
    .line 401
    iget v3, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->d0:F

    .line 402
    .line 403
    add-float/2addr v0, v3

    .line 404
    add-int/lit8 v2, v2, 0x1

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :cond_c
    iput-boolean v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->p0:Z

    .line 409
    .line 410
    :cond_d
    :goto_6
    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->x()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setThumbOffsetY(I)V
    .locals 1

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :cond_0
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 5
    .line 6
    if-ne v0, p1, :cond_1

    .line 7
    .line 8
    return-void

    .line 9
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q(I)V

    .line 10
    .line 11
    .line 12
    iput p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public t()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    check-cast v0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getLastTouchX()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->j0:I

    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setLastTouchX(I)V

    .line 21
    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    iget v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->j0:I

    .line 25
    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    iget p0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->i0:I

    .line 29
    .line 30
    if-gt v0, p0, :cond_1

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_1
    return v2
.end method

.method public u(II)Z
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->W:I

    .line 4
    .line 5
    if-gt p1, v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sub-int/2addr p1, v0

    .line 16
    if-ge p2, p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-le p2, p0, :cond_0

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

.method public w()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 8
    .line 9
    iget v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->f0:I

    .line 10
    .line 11
    if-lez v1, :cond_1

    .line 12
    .line 13
    iget v2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->g0:I

    .line 14
    .line 15
    div-int/2addr v2, v1

    .line 16
    invoke-virtual {v0, v2}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->U:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, ""

    .line 23
    .line 24
    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->U:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->U:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "AlphabeticalScroller"

    .line 41
    .line 42
    const-string v1, "refreshCurrentSectionName"

    .line 43
    .line 44
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 48
    .line 49
    .line 50
    :cond_0
    const/4 v0, 0x1

    .line 51
    iput-boolean v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->p0:Z

    .line 52
    .line 53
    :cond_1
    const/4 v0, 0x0

    .line 54
    iput-boolean v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->h0:Z

    .line 55
    .line 56
    iput-boolean v0, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->n0:Z

    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 59
    .line 60
    instance-of v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public x()V
    .locals 5

    .line 1
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, LR0/m;->b(Landroid/content/Context;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v0, v0, Lcom/android/launcher3/C2;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->e0()LR0/k;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const v1, 0x7f070112

    .line 46
    .line 47
    .line 48
    const-string v2, "AlphabeticalScroller"

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0}, LR0/k;->p()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    const-string v0, "setPaddingIfHasRecommend: hasRecommendApps"

    .line 59
    .line 60
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    const v1, 0x7f07010e

    .line 93
    .line 94
    .line 95
    :goto_0
    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {p0, v2, v0, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_2
    const-string v0, "setPaddingIfHasRecommend: recommendModel null"

    .line 116
    .line 117
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 141
    .line 142
    .line 143
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->y()V

    .line 144
    .line 145
    .line 146
    :cond_3
    :goto_2
    return-void
.end method

.method public y()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iget-object v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->c0:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sub-int/2addr v1, v2

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    sub-int/2addr v1, v2

    .line 25
    int-to-float v1, v1

    .line 26
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    array-length v2, v2

    .line 31
    int-to-float v2, v2

    .line 32
    div-float/2addr v1, v2

    .line 33
    iput v1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->d0:F

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    :goto_0
    invoke-static {}, Lx1/B;->b()[Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    array-length v2, v2

    .line 41
    if-ge v1, v2, :cond_0

    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->c0:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget v2, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->d0:F

    .line 53
    .line 54
    add-float/2addr v0, v2

    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method
