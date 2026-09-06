.class public final Lcom/android/launcher3/taskbar/TaskbarEduTooltip;
.super Lcom/android/launcher3/a;
.source "TaskbarEduTooltip.kt"


# instance fields
.field private final g:Lcom/android/launcher3/views/k;

.field private final h:I

.field private final i:F

.field private final j:F

.field private final k:F

.field private final l:F

.field private final m:F

.field private final n:F

.field private o:Landroid/view/ViewGroup;

.field private p:Landroid/view/View;

.field private q:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private r:Landroid/animation/AnimatorSet;

.field private s:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/views/k;

    iput-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->g:Lcom/android/launcher3/views/k;

    const p2, 0x7f06045b

    .line 5
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->h:I

    .line 6
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->k(Landroid/content/Context;)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->i:F

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0709e4

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->j:F

    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0709dd

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->k:F

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0709dc

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->l:F

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b88

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->m:F

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b89

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->n:F

    .line 12
    new-instance p1, Lcom/android/launcher3/taskbar/v2;

    invoke-direct {p1}, Lcom/android/launcher3/taskbar/v2;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->q:Lu4/a;

    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->s:Z

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 2
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic N()Lh4/t;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->V()Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic O(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->closeComplete()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->U(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->T(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final S(Z)Landroid/animation/AnimatorSet;
    .locals 9

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, 0x2

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    new-array p1, v4, [F

    .line 10
    .line 11
    aput v2, p1, v3

    .line 12
    .line 13
    aput v0, p1, v1

    .line 14
    .line 15
    new-array v0, v4, [F

    .line 16
    .line 17
    iget v5, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->m:F

    .line 18
    .line 19
    aput v5, v0, v3

    .line 20
    .line 21
    aput v2, v0, v1

    .line 22
    .line 23
    sget-object v2, LJ0/h;->k:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    sget-object v5, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    const-wide/16 v6, 0x12c

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-array p1, v4, [F

    .line 31
    .line 32
    aput v0, p1, v3

    .line 33
    .line 34
    aput v2, p1, v1

    .line 35
    .line 36
    new-array v0, v4, [F

    .line 37
    .line 38
    aput v2, v0, v3

    .line 39
    .line 40
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->n:F

    .line 41
    .line 42
    aput v2, v0, v1

    .line 43
    .line 44
    sget-object v2, LJ0/h;->c:Landroid/view/animation/Interpolator;

    .line 45
    .line 46
    const-wide/16 v6, 0x96

    .line 47
    .line 48
    move-object v5, v2

    .line 49
    :goto_0
    array-length v8, p1

    .line 50
    invoke-static {p1, v8}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Lcom/android/launcher3/taskbar/x2;

    .line 62
    .line 63
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/x2;-><init>(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 67
    .line 68
    .line 69
    array-length v2, v0

    .line 70
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 79
    .line 80
    .line 81
    new-instance v2, Lcom/android/launcher3/taskbar/y2;

    .line 82
    .line 83
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/y2;-><init>(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 87
    .line 88
    .line 89
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 90
    .line 91
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 95
    .line 96
    .line 97
    new-array v2, v4, [Landroid/animation/Animator;

    .line 98
    .line 99
    aput-object p1, v2, v3

    .line 100
    .line 101
    aput-object v0, v2, v1

    .line 102
    .line 103
    invoke-virtual {p0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 104
    .line 105
    .line 106
    return-object p0
.end method

.method private static final T(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 11
    .line 12
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->getContent()Landroid/view/ViewGroup;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->p:Landroid/view/View;

    .line 29
    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    const-string p0, "arrow"

    .line 33
    .line 34
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private static final U(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 11
    .line 12
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->getContent()Landroid/view/ViewGroup;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->p:Landroid/view/View;

    .line 29
    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    const-string p0, "arrow"

    .line 33
    .line 34
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private static final V()Lh4/t;
    .locals 1

    .line 1
    sget-object v0, Lh4/t;->a:Lh4/t;

    .line 2
    .line 3
    return-object v0
.end method

.method private final closeComplete()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->r:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->r:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->g:Lcom/android/launcher3/views/k;

    .line 15
    .line 16
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final getAllowTouchDismissal()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getContent()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->o:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "content"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getOnCloseCallback()Lu4/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->q:Lu4/a;

    .line 2
    .line 3
    return-object p0
.end method

.method protected handleClose(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->q:Lu4/a;

    .line 9
    .line 10
    invoke-interface {v0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->closeComplete()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->r:Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_2
    const/4 p1, 0x0

    .line 27
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->S(Z)Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->r:Landroid/animation/AnimatorSet;

    .line 32
    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/taskbar/w2;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/w2;-><init>(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->r:Landroid/animation/AnimatorSet;

    .line 48
    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 52
    .line 53
    .line 54
    :cond_4
    :goto_0
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x20000

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->findOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-interface {v0, v1, p0}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->g:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->s:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->findOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0, p0}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Landroid/widget/LinearLayout;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "launcher_taskbar_education_showing"

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method protected onFinishInflate()V
    .locals 13

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b018d

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->o:Landroid/view/ViewGroup;

    .line 14
    .line 15
    const v0, 0x7f0b00e9

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->p:Landroid/view/View;

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string v0, "arrow"

    .line 27
    .line 28
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    :cond_0
    new-instance v1, Lcom/android/launcher3/popup/A;

    .line 33
    .line 34
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->j:F

    .line 35
    .line 36
    iget v3, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->k:F

    .line 37
    .line 38
    iget v4, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->l:F

    .line 39
    .line 40
    iget v5, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->i:F

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    int-to-float v6, v6

    .line 47
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    int-to-float v7, v7

    .line 52
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    int-to-float v8, v8

    .line 57
    iget v9, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->j:F

    .line 58
    .line 59
    sub-float/2addr v8, v9

    .line 60
    const/4 v9, 0x2

    .line 61
    int-to-float v9, v9

    .line 62
    div-float/2addr v8, v9

    .line 63
    const/4 v11, 0x1

    .line 64
    iget v12, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->h:I

    .line 65
    .line 66
    const/4 v9, 0x0

    .line 67
    const/4 v10, 0x0

    .line 68
    invoke-direct/range {v1 .. v12}, Lcom/android/launcher3/popup/A;-><init>(FFFFFFFFZZI)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final setAllowTouchDismissal(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setOnCloseCallback(Lu4/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->q:Lu4/a;

    .line 7
    .line 8
    return-void
.end method

.method public final show()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->g:Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->g:Lcom/android/launcher3/views/k;

    .line 21
    .line 22
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v1, v2, v2}, Landroid/widget/FrameLayout;->measure(II)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iget-object v2, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->g:Lcom/android/launcher3/views/k;

    .line 35
    .line 36
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget v2, v2, Lcom/android/launcher3/h0;->r3:I

    .line 41
    .line 42
    add-int/2addr v1, v2

    .line 43
    iget-object v2, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->g:Lcom/android/launcher3/views/k;

    .line 44
    .line 45
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget v2, v2, Lcom/android/launcher3/h0;->W0:I

    .line 50
    .line 51
    if-lt v1, v2, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    const/4 v2, -0x1

    .line 60
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    new-instance p0, Ljava/lang/NullPointerException;

    .line 67
    .line 68
    const-string v0, "null cannot be cast to non-null type android.view.ViewGroup.LayoutParams"

    .line 69
    .line 70
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p0

    .line 74
    :cond_2
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->S(Z)Landroid/animation/AnimatorSet;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->r:Landroid/animation/AnimatorSet;

    .line 82
    .line 83
    return-void
.end method
