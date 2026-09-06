.class public Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;
.super Lcom/android/launcher3/views/f;
.source "AddItemWidgetsBottomSheet.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/views/f<",
        "Lcom/android/launcher3/dragndrop/AddItemActivity;",
        ">;",
        "Landroid/view/View$OnApplyWindowInsetsListener;"
    }
.end annotation


# instance fields
.field private final E:Landroid/graphics/Rect;

.field private F:Landroid/widget/ScrollView;

.field private G:I

.field private H:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/views/f;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->H:Z

    .line 4
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->E:Landroid/graphics/Rect;

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070c76

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->G:I

    return-void
.end method

.method private animateOpen()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->j0()Lcom/android/launcher3/anim/q;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->u0()Lcom/android/launcher3/anim/q;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic o0(Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p0(Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->q0(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic q0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static r0(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private t0(FFJZ)Lcom/android/launcher3/anim/q;
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/views/f;->p:F

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/views/f;->q:F

    .line 4
    .line 5
    move-wide v0, p3

    .line 6
    move p3, p1

    .line 7
    move-object p1, p0

    .line 8
    new-instance p0, Lcom/android/launcher3/anim/V;

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 11
    .line 12
    .line 13
    new-instance p4, Lcom/android/launcher3/widget/c;

    .line 14
    .line 15
    invoke-direct {p4, p1}, Lcom/android/launcher3/widget/c;-><init>(Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p4}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 19
    .line 20
    .line 21
    const/high16 p4, 0x3f800000    # 1.0f

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    if-eqz p5, :cond_0

    .line 25
    .line 26
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0, p4, v1}, Lcom/android/launcher3/anim/f;->m(Landroid/view/View;FFLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    :goto_0
    move p4, p2

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    sget-object v1, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 34
    .line 35
    invoke-virtual {p0, p1, p4, v0, v1}, Lcom/android/launcher3/anim/f;->m(Landroid/view/View;FFLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :goto_1
    sget-object p2, Lcom/android/launcher3/views/f;->C:Landroid/util/FloatProperty;

    .line 40
    .line 41
    if-eqz p5, :cond_1

    .line 42
    .line 43
    sget-object p5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    sget-object p5, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 47
    .line 48
    :goto_2
    invoke-virtual/range {p0 .. p5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p0}, Lcom/android/launcher3/views/f;->e0(Lcom/android/launcher3/anim/V;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iput-object p0, p1, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 59
    .line 60
    return-object p0
.end method


# virtual methods
.method protected X(Landroid/content/Context;)I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public Y(ZJ)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->H:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->t:Lcom/android/launcher3/views/f$e;

    .line 18
    .line 19
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Lcom/android/launcher3/views/b;

    .line 24
    .line 25
    invoke-direct {v1}, Lcom/android/launcher3/views/b;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 29
    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->u()V

    .line 36
    .line 37
    .line 38
    const/high16 p1, 0x3f800000    # 1.0f

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->setTranslationShift(F)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->d0()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->s0(J)Lcom/android/launcher3/anim/q;

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->getIdleInterpolator()Landroid/view/animation/Interpolator;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    .line 62
    .line 63
    new-instance p2, Lcom/android/launcher3/widget/b;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/b;-><init>(Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method protected getIdleInterpolator()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/views/f;->getIdleInterpolator()Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method protected handleClose(Z)V
    .locals 2

    .line 1
    const-wide/16 v0, 0xfa

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->Y(ZJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const p0, 0x8000

    .line 2
    .line 3
    .line 4
    and-int/2addr p0, p1

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p2, p1}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->E:Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v1, p1, Landroid/graphics/Insets;->left:I

    .line 12
    .line 13
    iget v2, p1, Landroid/graphics/Insets;->top:I

    .line 14
    .line 15
    iget v3, p1, Landroid/graphics/Insets;->right:I

    .line 16
    .line 17
    iget p1, p1, Landroid/graphics/Insets;->bottom:I

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget-object v0, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 31
    .line 32
    if-ne p1, v0, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingStart()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object v2, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingEnd()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iget-object v3, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->E:Landroid/graphics/Rect;

    .line 53
    .line 54
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 55
    .line 56
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const v0, 0x7f070c76

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget v0, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->G:I

    .line 71
    .line 72
    if-eq p1, v0, :cond_1

    .line 73
    .line 74
    const v0, 0x7f0b0681

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->r0(Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    const v0, 0x7f0b0687

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->r0(Landroid/view/View;I)V

    .line 92
    .line 93
    .line 94
    const v0, 0x7f0b0684

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->r0(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    const v0, 0x7f0b006b

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->r0(Landroid/view/View;I)V

    .line 112
    .line 113
    .line 114
    iput p1, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->G:I

    .line 115
    .line 116
    :cond_1
    return-object p2
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->F:Landroid/widget/ScrollView;

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->F:Landroid/widget/ScrollView;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 32
    .line 33
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->H:Z

    .line 3
    .line 4
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public onDragEnd(F)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    cmpl-float v0, p1, v0

    .line 17
    .line 18
    if-gtz v0, :cond_1

    .line 19
    .line 20
    :cond_0
    iget v0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 21
    .line 22
    const/high16 v1, 0x3f000000    # 0.5f

    .line 23
    .line 24
    cmpl-float v0, v0, v1

    .line 25
    .line 26
    if-lez v0, :cond_2

    .line 27
    .line 28
    :cond_1
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->H:Z

    .line 30
    .line 31
    :cond_2
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onDragEnd(F)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0070

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 14
    .line 15
    const v0, 0x7f0b068f

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/ScrollView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->F:Landroid/widget/ScrollView;

    .line 25
    .line 26
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    sub-int/2addr p4, p2

    .line 2
    sub-int/2addr p5, p3

    .line 3
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p4, p1

    .line 10
    iget-object p2, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->E:Landroid/graphics/Rect;

    .line 11
    .line 12
    iget p3, p2, Landroid/graphics/Rect;->left:I

    .line 13
    .line 14
    sub-int/2addr p4, p3

    .line 15
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 16
    .line 17
    sub-int/2addr p4, p2

    .line 18
    div-int/lit8 p4, p4, 0x2

    .line 19
    .line 20
    add-int/2addr p4, p3

    .line 21
    iget-object p2, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    sub-int p3, p5, p3

    .line 28
    .line 29
    add-int/2addr p1, p4

    .line 30
    invoke-virtual {p2, p4, p3, p1, p5}, Landroid/view/ViewGroup;->layout(IIII)V

    .line 31
    .line 32
    .line 33
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->setTranslationShift(F)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method protected onMeasure(II)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/dragndrop/AddItemActivity;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget v0, v0, Lcom/android/launcher3/h0;->L2:I

    .line 14
    .line 15
    mul-int/lit8 v0, v0, 0x2

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->E:Landroid/graphics/Rect;

    .line 18
    .line 19
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 20
    .line 21
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 22
    .line 23
    add-int/2addr v2, v1

    .line 24
    mul-int/lit8 v2, v2, 0x2

    .line 25
    .line 26
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->E:Landroid/graphics/Rect;

    .line 31
    .line 32
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 33
    .line 34
    if-lez v2, :cond_1

    .line 35
    .line 36
    iget v0, v1, Landroid/graphics/Rect;->left:I

    .line 37
    .line 38
    iget v0, v1, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v0, v0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 42
    .line 43
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 44
    .line 45
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 46
    .line 47
    add-int/2addr v2, v0

    .line 48
    iget v0, v1, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 51
    .line 52
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x2

    .line 54
    .line 55
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 56
    .line 57
    .line 58
    :goto_0
    const/4 v8, 0x0

    .line 59
    iget-object v4, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 60
    .line 61
    const/4 v6, 0x0

    .line 62
    move-object v3, p0

    .line 63
    move v5, p1

    .line 64
    move v7, p2

    .line 65
    invoke-virtual/range {v3 .. v8}, Landroid/widget/LinearLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 66
    .line 67
    .line 68
    invoke-static {v5}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    invoke-static {v7}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-virtual {v3, p0, p1}, Landroid/widget/LinearLayout;->setMeasuredDimension(II)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method protected s0(J)Lcom/android/launcher3/anim/q;
    .locals 6

    .line 1
    const v2, 0x3e4ccccd    # 0.2f

    .line 2
    .line 3
    .line 4
    const/4 v5, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-wide v3, p1

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->t0(FFJZ)Lcom/android/launcher3/anim/q;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method protected setTranslationShift(F)V
    .locals 7

    .line 1
    iput p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/dragndrop/AddItemActivity;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 12
    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 18
    .line 19
    iget v1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 20
    .line 21
    sub-float v1, v0, v1

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 27
    .line 28
    iget v1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 29
    .line 30
    float-to-double v1, v1

    .line 31
    const-wide v3, 0x3fb999999999999aL    # 0.1

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    mul-double/2addr v1, v3

    .line 37
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 38
    .line 39
    sub-double v1, v5, v1

    .line 40
    .line 41
    double-to-float v1, v1

    .line 42
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 46
    .line 47
    iget v1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 48
    .line 49
    float-to-double v1, v1

    .line 50
    mul-double/2addr v1, v3

    .line 51
    sub-double/2addr v5, v1

    .line 52
    double-to-float v1, v5

    .line 53
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 58
    .line 59
    iget v1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getShiftRange()F

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    mul-float/2addr v1, v2

    .line 66
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/views/f;->k:Landroid/view/View;

    .line 70
    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    iget p0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 74
    .line 75
    sub-float/2addr v0, p0

    .line 76
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->T()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p0}, Landroid/widget/LinearLayout;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->animateOpen()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method protected final u0()Lcom/android/launcher3/anim/q;
    .locals 6

    .line 1
    const-wide/16 v3, 0x12c

    .line 2
    .line 3
    const/4 v5, 0x1

    .line 4
    const v1, 0x3e4ccccd    # 0.2f

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    move-object v0, p0

    .line 9
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->t0(FFJZ)Lcom/android/launcher3/anim/q;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method
