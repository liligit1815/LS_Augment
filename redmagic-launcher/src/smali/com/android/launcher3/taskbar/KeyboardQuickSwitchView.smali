.class public Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "KeyboardQuickSwitchView.java"


# static fields
.field private static final A:Landroid/view/animation/Interpolator;

.field private static final B:Landroid/view/animation/Interpolator;

.field private static final C:Landroid/view/animation/Interpolator;

.field private static final D:Landroid/view/animation/Interpolator;

.field private static final z:Landroid/view/animation/Interpolator;


# instance fields
.field private final g:Lcom/android/launcher3/anim/d;

.field private h:Z

.field private i:Landroid/view/View;

.field private j:Landroid/widget/HorizontalScrollView;

.field private k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field private l:Z

.field private m:Landroid/widget/ImageButton;

.field private n:Landroid/widget/ImageButton;

.field private o:I

.field private p:I

.field private q:I

.field private r:I

.field private s:I

.field private t:Z

.field private u:I

.field private v:I

.field private w:Landroid/animation/AnimatorSet;

.field private x:Z

.field private y:Lcom/android/launcher3/taskbar/L$b;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->z:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    sget-object v1, LJ0/h;->c:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    sput-object v1, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->A:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    sget-object v2, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    sput-object v2, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->B:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->C:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    sput-object v1, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->D:Landroid/view/animation/Interpolator;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 4
    new-instance p1, Lcom/android/launcher3/anim/d;

    new-instance p2, Lcom/android/launcher3/taskbar/x;

    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/x;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V

    invoke-direct {p1, p2}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->g:Lcom/android/launcher3/anim/d;

    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->l:Z

    const/4 p2, -0x1

    .line 6
    iput p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->u:I

    .line 7
    iput p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->v:I

    .line 8
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->x:Z

    return-void
.end method

.method static bridge synthetic A(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->U(ZLjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic B(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->V(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic C(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->X(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic D(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic E()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->z:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object v0
.end method

.method private F(Landroid/view/View;Landroid/animation/AnimatorSet;)V
    .locals 5

    .line 1
    sget-object p0, Landroid/view/ViewGroup;->TRANSLATION_Y:Landroid/util/Property;

    .line 2
    .line 3
    const/high16 v0, 0x42200000    # 40.0f

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    neg-int v0, v0

    .line 10
    int-to-float v0, v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v3, v2, [F

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    aput v1, v3, v4

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    aput v0, v3, v1

    .line 20
    .line 21
    invoke-static {p1, p0, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-wide/16 v0, 0x14d

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->D:Landroid/view/animation/Interpolator;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 36
    .line 37
    .line 38
    sget-object p0, Landroid/view/ViewGroup;->ALPHA:Landroid/util/Property;

    .line 39
    .line 40
    new-array v0, v2, [F

    .line 41
    .line 42
    fill-array-data v0, :array_0

    .line 43
    .line 44
    .line 45
    invoke-static {p1, p0, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-wide/16 v0, 0x53

    .line 50
    .line 51
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    nop

    .line 59
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private G(Landroid/view/View;Landroid/animation/AnimatorSet;)V
    .locals 7

    .line 1
    sget-object p0, Landroid/view/ViewGroup;->TRANSLATION_X:Landroid/util/Property;

    .line 2
    .line 3
    const/high16 v0, 0x42000000    # 32.0f

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    neg-int v0, v0

    .line 10
    int-to-float v0, v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v3, v2, [F

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    aput v0, v3, v4

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    aput v1, v3, v0

    .line 20
    .line 21
    invoke-static {p1, p0, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-wide/16 v5, 0x1f4

    .line 26
    .line 27
    invoke-virtual {p0, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    sget-object v3, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->B:Landroid/view/animation/Interpolator;

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 36
    .line 37
    .line 38
    sget-object p0, Landroid/view/ViewGroup;->TRANSLATION_Y:Landroid/util/Property;

    .line 39
    .line 40
    const/high16 v3, 0x42200000    # 40.0f

    .line 41
    .line 42
    invoke-static {v3}, Lcom/android/launcher3/N5;->i(F)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    neg-int v3, v3

    .line 47
    int-to-float v3, v3

    .line 48
    new-array v5, v2, [F

    .line 49
    .line 50
    aput v3, v5, v4

    .line 51
    .line 52
    aput v1, v5, v0

    .line 53
    .line 54
    invoke-static {p1, p0, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-wide/16 v3, 0x14d

    .line 59
    .line 60
    invoke-virtual {p0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->C:Landroid/view/animation/Interpolator;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 72
    .line 73
    .line 74
    sget-object p0, Landroid/view/ViewGroup;->ALPHA:Landroid/util/Property;

    .line 75
    .line 76
    new-array v0, v2, [F

    .line 77
    .line 78
    fill-array-data v0, :array_0

    .line 79
    .line 80
    .line 81
    invoke-static {p1, p0, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-wide/16 v0, 0x53

    .line 86
    .line 87
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private K(IZZILandroid/view/LayoutInflater;Landroid/view/View;)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p5, p4, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p4

    .line 8
    check-cast p4, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 9
    .line 10
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 11
    .line 12
    .line 13
    move-result p5

    .line 14
    invoke-virtual {p4, p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->setId(I)V

    .line 15
    .line 16
    .line 17
    new-instance p5, Lcom/android/launcher3/taskbar/A;

    .line 18
    .line 19
    invoke-direct {p5, p0, p1}, Lcom/android/launcher3/taskbar/A;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p4, p5}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 26
    .line 27
    const/4 p5, -0x2

    .line 28
    invoke-direct {p1, p5, p5}, Landroidx/constraintlayout/widget/ConstraintLayout$b;-><init>(II)V

    .line 29
    .line 30
    .line 31
    if-eqz p6, :cond_0

    .line 32
    .line 33
    invoke-virtual {p6}, Landroid/view/View;->getId()I

    .line 34
    .line 35
    .line 36
    move-result p5

    .line 37
    iput p5, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->s:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->t:I

    .line 41
    .line 42
    :goto_0
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->i:I

    .line 43
    .line 44
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->l:I

    .line 45
    .line 46
    if-eqz p3, :cond_1

    .line 47
    .line 48
    iget p3, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->r:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    iget p3, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q:I

    .line 52
    .line 53
    :goto_1
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 54
    .line 55
    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->v:I

    .line 59
    .line 60
    iget p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q:I

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 63
    .line 64
    .line 65
    const/high16 p2, 0x3f800000    # 1.0f

    .line 66
    .line 67
    iput p2, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->G:F

    .line 68
    .line 69
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 70
    .line 71
    invoke-virtual {p0, p4, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    return-object p4
.end method

.method private N(IZ)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->M(I)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->t:Z

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-direct {p0, p1, p2, v2, v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->W(Landroid/view/View;ZZZ)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_2
    invoke-direct {p0, p1, p2, v2, v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->Y(Landroid/view/View;ZZZ)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private O(Landroid/window/OnBackInvokedDispatcher;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/window/WindowOnBackInvokedDispatcher;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/window/WindowOnBackInvokedDispatcher;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/window/WindowOnBackInvokedDispatcher;->isOnBackInvokedCallbackEnabled()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private synthetic P(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/L$b;->d(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic Q(Landroid/view/View;ZZ)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    div-int/lit8 p1, p1, 0x2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move p1, v1

    .line 26
    :goto_0
    sub-int/2addr v0, p1

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 30
    .line 31
    invoke-virtual {p0, v0, v1}, Landroid/widget/HorizontalScrollView;->smoothScrollTo(II)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic R(Landroid/view/View;ZZ)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    div-int/lit8 p1, p1, 0x2

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move p1, v1

    .line 19
    :goto_0
    add-int/2addr v0, p1

    .line 20
    if-eqz p3, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Landroid/widget/HorizontalScrollView;->smoothScrollTo(II)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private S()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->O(Landroid/window/OnBackInvokedDispatcher;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->x:Z

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/android/launcher3/taskbar/L$b;->a:Landroid/window/OnBackInvokedCallback;

    .line 18
    .line 19
    const v2, 0xf4240

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v2, v1}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->x:Z

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private U(ZLjava/lang/Runnable;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/widget/HorizontalScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$i;

    .line 14
    .line 15
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$i;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private V(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->W(Landroid/view/View;ZZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private W(Landroid/view/View;ZZZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p3, :cond_1

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->Z(Landroid/view/View;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    new-instance v0, Lcom/android/launcher3/taskbar/C;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/C;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;ZZ)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p4, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->U(ZLjava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private X(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->Y(Landroid/view/View;ZZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private Y(Landroid/view/View;ZZZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p3, :cond_1

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->Z(Landroid/view/View;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    new-instance v0, Lcom/android/launcher3/taskbar/B;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/B;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;ZZ)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p4, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->U(ZLjava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private Z(Landroid/view/View;Z)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget-object v2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    add-int/2addr v1, v2

    .line 21
    const/4 v2, 0x0

    .line 22
    if-gt v0, v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q:I

    .line 29
    .line 30
    sub-int/2addr p1, v0

    .line 31
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-ge p1, p0, :cond_1

    .line 42
    .line 43
    :cond_0
    if-nez p2, :cond_1

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    return v2
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->R(Landroid/view/View;ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->O(Landroid/window/OnBackInvokedDispatcher;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->x:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/android/launcher3/taskbar/L$b;->a:Landroid/window/OnBackInvokedCallback;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->x:Z

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private b0()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->t:Z

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x1

    .line 16
    if-eqz v1, :cond_3

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->n:Landroid/widget/ImageButton;

    .line 19
    .line 20
    if-lez v0, :cond_1

    .line 21
    .line 22
    move v4, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v4, v2

    .line 25
    :goto_0
    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m:Landroid/widget/ImageButton;

    .line 29
    .line 30
    iget-object v4, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 31
    .line 32
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    sub-int/2addr v4, p0

    .line 43
    if-ge v0, v4, :cond_2

    .line 44
    .line 45
    move v2, v3

    .line 46
    :cond_2
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m:Landroid/widget/ImageButton;

    .line 51
    .line 52
    if-lez v0, :cond_4

    .line 53
    .line 54
    move v4, v3

    .line 55
    goto :goto_1

    .line 56
    :cond_4
    move v4, v2

    .line 57
    :goto_1
    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->n:Landroid/widget/ImageButton;

    .line 61
    .line 62
    iget-object v4, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 63
    .line 64
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    sub-int/2addr v4, p0

    .line 75
    if-ge v0, v4, :cond_5

    .line 76
    .line 77
    move v2, v3

    .line 78
    :cond_5
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->Q(Landroid/view/View;ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->P(ILandroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/ImageButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->n:Landroid/widget/ImageButton;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->g:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->s:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic r(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic s(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/ImageButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m:Landroid/widget/ImageButton;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic t(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic u(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->o:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic v(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->p:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic w(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Lcom/android/launcher3/taskbar/L$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic x(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic y(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->N(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic z(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected H(II)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->M(I)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->o(Z)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->M(I)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-virtual {v2, v3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->o(Z)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 38
    .line 39
    .line 40
    :cond_2
    new-instance v2, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;

    .line 41
    .line 42
    invoke-direct {v2, p0, v0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;II)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method protected I(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

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
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Landroid/widget/HorizontalScrollView;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->i:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->g:Lcom/android/launcher3/anim/d;

    .line 30
    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-wide/16 v1, 0x14d

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 45
    .line 46
    .line 47
    sget-object v0, Landroid/view/ViewGroup;->ALPHA:Landroid/util/Property;

    .line 48
    .line 49
    const/4 v1, 0x2

    .line 50
    new-array v1, v1, [F

    .line 51
    .line 52
    fill-array-data v1, :array_0

    .line 53
    .line 54
    .line 55
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-wide/16 v1, 0x53

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 67
    .line 68
    .line 69
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 70
    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->i:Landroid/view/View;

    .line 77
    .line 78
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->G(Landroid/view/View;Landroid/animation/AnimatorSet;)V

    .line 81
    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->l:Z

    .line 84
    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m:Landroid/widget/ImageButton;

    .line 88
    .line 89
    iget-object v2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 90
    .line 91
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->G(Landroid/view/View;Landroid/animation/AnimatorSet;)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->n:Landroid/widget/ImageButton;

    .line 95
    .line 96
    iget-object v2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 97
    .line 98
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->G(Landroid/view/View;Landroid/animation/AnimatorSet;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getTaskCount()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    const/4 v3, 0x1

    .line 110
    sub-int/2addr v2, v3

    .line 111
    const/4 v4, -0x1

    .line 112
    if-ne p1, v4, :cond_3

    .line 113
    .line 114
    move p1, v3

    .line 115
    :cond_3
    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    iget-object v2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 120
    .line 121
    new-instance v3, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 122
    .line 123
    invoke-direct {v3, p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;ILandroid/view/View;Landroid/view/ViewOutlineProvider;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w:Landroid/animation/AnimatorSet;

    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected J(Landroid/content/Context;Ljava/util/List;IZILcom/android/launcher3/taskbar/L$b;Z)V
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;IZI",
            "Lcom/android/launcher3/taskbar/L$b;",
            "Z)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    move-object/from16 v1, p6

    .line 9
    .line 10
    iput-object v1, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 11
    .line 12
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v7

    .line 16
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 17
    .line 18
    .line 19
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v8

    .line 27
    const/4 v9, 0x0

    .line 28
    const/4 v10, 0x0

    .line 29
    move-object v6, v9

    .line 30
    move v1, v10

    .line 31
    :goto_0
    const/4 v11, 0x1

    .line 32
    if-ge v1, v8, :cond_7

    .line 33
    .line 34
    move-object/from16 v12, p2

    .line 35
    .line 36
    invoke-interface {v12, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    move-object v13, v2

    .line 41
    check-cast v13, Lcom/android/quickstep/util/GroupTask;

    .line 42
    .line 43
    add-int/lit8 v2, v8, -0x1

    .line 44
    .line 45
    if-ne v1, v2, :cond_0

    .line 46
    .line 47
    if-nez p3, :cond_0

    .line 48
    .line 49
    if-nez p7, :cond_0

    .line 50
    .line 51
    move v2, v11

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    move v2, v10

    .line 54
    :goto_1
    iget-object v3, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 55
    .line 56
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/L$b;->b()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_1

    .line 61
    .line 62
    const v3, 0x7f0e0113

    .line 63
    .line 64
    .line 65
    :goto_2
    move v4, v3

    .line 66
    goto :goto_3

    .line 67
    :cond_1
    const v3, 0x7f0e0112

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :goto_3
    const/4 v3, 0x0

    .line 72
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->K(IZZILandroid/view/LayoutInflater;Landroid/view/View;)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 73
    .line 74
    .line 75
    move-result-object v14

    .line 76
    instance-of v2, v13, Lcom/android/quickstep/util/SplitTask;

    .line 77
    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    move-object v3, v13

    .line 81
    check-cast v3, Lcom/android/quickstep/util/SplitTask;

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/android/quickstep/util/SplitTask;->getTopLeftTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v3}, Lcom/android/quickstep/util/SplitTask;->getBottomRightTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    move-object/from16 v16, v3

    .line 92
    .line 93
    :goto_4
    move-object v15, v4

    .line 94
    goto :goto_5

    .line 95
    :cond_2
    instance-of v3, v13, Lcom/android/quickstep/util/SingleTask;

    .line 96
    .line 97
    if-eqz v3, :cond_6

    .line 98
    .line 99
    move-object v3, v13

    .line 100
    check-cast v3, Lcom/android/quickstep/util/SingleTask;

    .line 101
    .line 102
    invoke-virtual {v3}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    move-object/from16 v16, v9

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :goto_5
    invoke-virtual {v14, v1, v8}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->t(II)V

    .line 110
    .line 111
    .line 112
    if-eqz p4, :cond_3

    .line 113
    .line 114
    iget-object v3, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 115
    .line 116
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    new-instance v4, Lcom/android/launcher3/taskbar/y;

    .line 120
    .line 121
    invoke-direct {v4, v3}, Lcom/android/launcher3/taskbar/y;-><init>(Lcom/android/launcher3/taskbar/L$b;)V

    .line 122
    .line 123
    .line 124
    move-object/from16 v17, v4

    .line 125
    .line 126
    goto :goto_6

    .line 127
    :cond_3
    move-object/from16 v17, v9

    .line 128
    .line 129
    :goto_6
    if-eqz p4, :cond_4

    .line 130
    .line 131
    iget-object v3, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 132
    .line 133
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    new-instance v4, Lcom/android/launcher3/taskbar/z;

    .line 137
    .line 138
    invoke-direct {v4, v3}, Lcom/android/launcher3/taskbar/z;-><init>(Lcom/android/launcher3/taskbar/L$b;)V

    .line 139
    .line 140
    .line 141
    move-object/from16 v18, v4

    .line 142
    .line 143
    goto :goto_7

    .line 144
    :cond_4
    move-object/from16 v18, v9

    .line 145
    .line 146
    :goto_7
    if-eqz v2, :cond_5

    .line 147
    .line 148
    check-cast v13, Lcom/android/quickstep/util/SplitTask;

    .line 149
    .line 150
    invoke-virtual {v13}, Lcom/android/quickstep/util/SplitTask;->getSplitBounds()Lcom/android/launcher3/util/y2$a;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    move-object/from16 v19, v2

    .line 155
    .line 156
    goto :goto_8

    .line 157
    :cond_5
    move-object/from16 v19, v9

    .line 158
    .line 159
    :goto_8
    invoke-virtual/range {v14 .. v19}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->v(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$a;Lcom/android/launcher3/util/y2$a;)V

    .line 160
    .line 161
    .line 162
    move-object v6, v14

    .line 163
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :cond_7
    move-object/from16 v12, p2

    .line 168
    .line 169
    const v8, 0x7f0b0560

    .line 170
    .line 171
    .line 172
    if-lez p3, :cond_8

    .line 173
    .line 174
    new-instance v9, Ljava/util/HashMap;

    .line 175
    .line 176
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    const-string v2, "count"

    .line 184
    .line 185
    invoke-virtual {v9, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getTaskCount()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    iput v1, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->u:I

    .line 193
    .line 194
    xor-int/lit8 v2, p7, 0x1

    .line 195
    .line 196
    const/4 v3, 0x0

    .line 197
    const v4, 0x7f0e0111

    .line 198
    .line 199
    .line 200
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->K(IZZILandroid/view/LayoutInflater;Landroid/view/View;)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    const v1, 0x7f0b0337

    .line 205
    .line 206
    .line 207
    invoke-virtual {v6, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    check-cast v1, Landroid/widget/TextView;

    .line 212
    .line 213
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    const-string v4, "%d"

    .line 226
    .line 227
    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    check-cast v1, Landroid/widget/TextView;

    .line 239
    .line 240
    new-instance v2, Landroid/icu/text/MessageFormat;

    .line 241
    .line 242
    const v3, 0x7f14031a

    .line 243
    .line 244
    .line 245
    invoke-virtual {v7, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    invoke-direct {v2, v3, v4}, Landroid/icu/text/MessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2, v9}, Landroid/icu/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    :cond_8
    if-eqz p7, :cond_a

    .line 264
    .line 265
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getTaskCount()I

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    iput v1, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->v:I

    .line 270
    .line 271
    if-lez p3, :cond_9

    .line 272
    .line 273
    move v3, v11

    .line 274
    goto :goto_9

    .line 275
    :cond_9
    move v3, v10

    .line 276
    :goto_9
    const v4, 0x7f0e0110

    .line 277
    .line 278
    .line 279
    const/4 v2, 0x1

    .line 280
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->K(IZZILandroid/view/LayoutInflater;Landroid/view/View;)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    check-cast v1, Landroid/widget/TextView;

    .line 289
    .line 290
    const v2, 0x7f140319

    .line 291
    .line 292
    .line 293
    invoke-virtual {v7, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 298
    .line 299
    .line 300
    :cond_a
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    if-eqz v1, :cond_b

    .line 305
    .line 306
    if-eqz p7, :cond_c

    .line 307
    .line 308
    :cond_b
    move v10, v11

    .line 309
    :cond_c
    iput-boolean v10, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 310
    .line 311
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    new-instance v2, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;

    .line 316
    .line 317
    move/from16 v3, p5

    .line 318
    .line 319
    invoke-direct {v2, v0, v3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 323
    .line 324
    .line 325
    return-void
.end method

.method L()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->l:Z

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->t:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m:Landroid/widget/ImageButton;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const v3, 0x7f14031d

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->n:Landroid/widget/ImageButton;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const v3, 0x7f14031c

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m:Landroid/widget/ImageButton;

    .line 46
    .line 47
    new-instance v2, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->n:Landroid/widget/ImageButton;

    .line 56
    .line 57
    new-instance v2, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$c;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$c;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 66
    .line 67
    new-instance v2, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$d;

    .line 68
    .line 69
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$d;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v2}, Landroid/widget/HorizontalScrollView;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroid/widget/HorizontalScrollView;->setClipToOutline(Z)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 81
    .line 82
    new-instance v1, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$e;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$e;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/HorizontalScrollView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method protected M(I)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-ltz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getTaskCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lt p1, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method T()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->a0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 6
    .line 7
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    const-string v0, "Main"

    .line 2
    .line 3
    const-string v1, "KeyboardQuickSwitchView key event"

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Lcom/android/launcher3/testing/K;->d(Ljava/lang/String;Ljava/lang/String;Landroid/view/KeyEvent;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method protected getCloseAnimation()Landroid/animation/Animator;
    .locals 4

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->g:Lcom/android/launcher3/anim/d;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v1, v2}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-wide/16 v2, 0x14d

    .line 14
    .line 15
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    sget-object v2, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->A:Landroid/view/animation/Interpolator;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 24
    .line 25
    .line 26
    sget-object v1, Landroid/view/ViewGroup;->ALPHA:Landroid/util/Property;

    .line 27
    .line 28
    const/4 v2, 0x2

    .line 29
    new-array v2, v2, [F

    .line 30
    .line 31
    fill-array-data v2, :array_0

    .line 32
    .line 33
    .line 34
    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-wide/16 v2, 0x43

    .line 39
    .line 40
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 41
    .line 42
    .line 43
    const-wide/16 v2, 0x53

    .line 44
    .line 45
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 49
    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 52
    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->i:Landroid/view/View;

    .line 59
    .line 60
    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->F(Landroid/view/View;Landroid/animation/AnimatorSet;)V

    .line 61
    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->l:Z

    .line 64
    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m:Landroid/widget/ImageButton;

    .line 68
    .line 69
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->F(Landroid/view/View;Landroid/animation/AnimatorSet;)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->n:Landroid/widget/ImageButton;

    .line 73
    .line 74
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->F(Landroid/view/View;Landroid/animation/AnimatorSet;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    new-instance v1, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$f;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$f;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    nop

    .line 87
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method getDesktopTaskIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->v:I

    .line 2
    .line 3
    return p0
.end method

.method getOverviewTaskIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public getTaskCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L$b;->f()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b041a

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->i:Landroid/view/View;

    .line 12
    .line 13
    const v0, 0x7f0b0512

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/HorizontalScrollView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->j:Landroid/widget/HorizontalScrollView;

    .line 23
    .line 24
    const v0, 0x7f0b018d

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 34
    .line 35
    const v0, 0x7f0b0510

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/widget/ImageButton;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m:Landroid/widget/ImageButton;

    .line 45
    .line 46
    const v0, 0x7f0b050f

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/widget/ImageButton;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->n:Landroid/widget/ImageButton;

    .line 56
    .line 57
    const/high16 v0, 0x60000

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const v1, 0x7f070502

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    iput v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q:I

    .line 74
    .line 75
    const v1, 0x7f070501

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iput v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->r:I

    .line 83
    .line 84
    const v1, 0x7f070500

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    iput v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->s:I

    .line 92
    .line 93
    const v1, 0x7f0704eb

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    iput v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->o:I

    .line 101
    .line 102
    const v1, 0x7f0704f8

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    iput v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->p:I

    .line 110
    .line 111
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->t:Z

    .line 116
    .line 117
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->i:Landroid/view/View;

    .line 118
    .line 119
    const v0, 0x7f0b041b

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    check-cast p0, Landroid/widget/TextView;

    .line 127
    .line 128
    sget-object v0, Lcom/android/wm/shell/shared/o$b;->q:Lcom/android/wm/shell/shared/o$b;

    .line 129
    .line 130
    invoke-static {p0, v0}, Lcom/android/wm/shell/shared/o;->a(Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y:Lcom/android/launcher3/taskbar/L$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->t:Z

    .line 6
    .line 7
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->h:Z

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/android/launcher3/taskbar/L$b;->e(ILandroid/view/KeyEvent;ZZ)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyUp(ILandroid/view/KeyEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method
