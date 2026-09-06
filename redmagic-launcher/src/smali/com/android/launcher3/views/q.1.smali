.class public Lcom/android/launcher3/views/q;
.super Lcom/android/launcher3/a;
.source "ArrowTipView.java"


# static fields
.field public static final r:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Lcom/android/launcher3/views/q;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final g:Lcom/android/launcher3/views/k;

.field private final h:Landroid/os/Handler;

.field private i:Z

.field private j:Ljava/lang/Runnable;

.field private k:Landroid/view/View;

.field private final l:I

.field private final m:I

.field private final n:I

.field private o:Landroid/animation/AnimatorSet;

.field private p:Landroid/animation/AnimatorSet;

.field private q:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/views/q$a;

    .line 2
    .line 3
    const-string v1, "textAlpha"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/views/q$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/views/q;->r:Landroid/util/IntProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/views/q;-><init>(Landroid/content/Context;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1

    const v0, 0x7f0e0073

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/q;-><init>(Landroid/content/Context;ZI)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZI)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 3
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/views/q;->h:Landroid/os/Handler;

    .line 5
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 6
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 7
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/views/k;

    iput-object v0, p0, Lcom/android/launcher3/views/q;->g:Lcom/android/launcher3/views/k;

    .line 8
    iput-boolean p2, p0, Lcom/android/launcher3/views/q;->i:Z

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070129

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/views/q;->l:I

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0702e4

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/views/q;->m:I

    .line 11
    sget-object p2, Lcom/android/launcher3/x5;->B:[I

    invoke-virtual {p1, p2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 12
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 13
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 14
    :cond_0
    new-instance v0, Landroid/view/ContextThemeWrapper;

    const v1, 0x7f15002a

    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    move-object p1, v0

    .line 15
    :cond_1
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/views/q;->V(Landroid/content/res/TypedArray;Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/views/q;->n:I

    .line 16
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/views/q;->W(Landroid/content/Context;I)V

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/views/q;IIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/views/q;->a0(IIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lcom/android/launcher3/views/q;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/q;->Y(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/views/q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/q;->X()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Lcom/android/launcher3/views/q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/q;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/views/q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/q;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic T(Lcom/android/launcher3/views/q;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/q;->getTextAlpha()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic U(Lcom/android/launcher3/views/q;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/q;->setTextAlpha(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private W(Landroid/content/Context;I)V
    .locals 5

    .line 1
    invoke-static {p1, p2, p0}, Landroid/widget/LinearLayout;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/views/q;->getArrowId()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/android/launcher3/views/q;->k:Landroid/view/View;

    .line 17
    .line 18
    iget-boolean p2, p0, Lcom/android/launcher3/views/q;->i:Z

    .line 19
    .line 20
    invoke-direct {p0, p2}, Lcom/android/launcher3/views/q;->i0(Z)V

    .line 21
    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    sget-object v1, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 30
    .line 31
    new-array v2, p1, [F

    .line 32
    .line 33
    const/high16 v3, 0x3f800000    # 1.0f

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    aput v3, v2, v4

    .line 37
    .line 38
    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 46
    .line 47
    const-wide/16 v2, 0xc8

    .line 48
    .line 49
    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    const-wide/16 v2, 0x12c

    .line 55
    .line 56
    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 60
    .line 61
    sget-object v2, LJ0/h;->I:Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 67
    .line 68
    new-array p1, p1, [F

    .line 69
    .line 70
    aput p2, p1, v4

    .line 71
    .line 72
    invoke-static {p0, v1, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 80
    .line 81
    const-wide/16 v0, 0x0

    .line 82
    .line 83
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 87
    .line 88
    const-wide/16 v0, 0x64

    .line 89
    .line 90
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 94
    .line 95
    sget-object p2, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 96
    .line 97
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 101
    .line 102
    new-instance p2, Lcom/android/launcher3/views/q$b;

    .line 103
    .line 104
    invoke-direct {p2, p0}, Lcom/android/launcher3/views/q$b;-><init>(Lcom/android/launcher3/views/q;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method private synthetic X()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/q;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic Y(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/views/q;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    :goto_0
    sub-int/2addr p1, v0

    .line 12
    int-to-float p1, p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setY(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic Z()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/q;->handleClose(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic a0(IIIIII)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    int-to-float p1, p1

    .line 10
    sub-float v2, p1, v0

    .line 11
    .line 12
    int-to-float v3, p2

    .line 13
    cmpg-float v4, v2, v3

    .line 14
    .line 15
    if-gez v4, :cond_0

    .line 16
    .line 17
    move v2, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    add-float/2addr v0, p1

    .line 20
    sub-int/2addr p3, p2

    .line 21
    int-to-float p2, p3

    .line 22
    cmpl-float p2, v0, p2

    .line 23
    .line 24
    if-lez p2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    sub-int/2addr p3, p2

    .line 31
    int-to-float v2, p3

    .line 32
    :cond_1
    :goto_0
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setX(F)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iget-boolean p3, p0, Lcom/android/launcher3/views/q;->i:Z

    .line 40
    .line 41
    if-eqz p3, :cond_2

    .line 42
    .line 43
    add-int v0, p4, p2

    .line 44
    .line 45
    if-le v0, p5, :cond_3

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    sub-int p5, p6, p2

    .line 49
    .line 50
    if-gez p5, :cond_3

    .line 51
    .line 52
    :goto_1
    xor-int/lit8 p3, p3, 0x1

    .line 53
    .line 54
    :cond_3
    invoke-direct {p0, p3}, Lcom/android/launcher3/views/q;->i0(Z)V

    .line 55
    .line 56
    .line 57
    if-eqz p3, :cond_4

    .line 58
    .line 59
    int-to-float p2, p4

    .line 60
    goto :goto_2

    .line 61
    :cond_4
    sub-int/2addr p6, p2

    .line 62
    int-to-float p2, p6

    .line 63
    :goto_2
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setY(F)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Lcom/android/launcher3/views/q;->k:Landroid/view/View;

    .line 67
    .line 68
    sub-float/2addr p1, v2

    .line 69
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    int-to-float p3, p3

    .line 74
    div-float/2addr p3, v1

    .line 75
    sub-float/2addr p1, p3

    .line 76
    invoke-virtual {p2, p1}, Landroid/view/View;->setX(F)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private synthetic b0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/q;->handleClose(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private g0(Ljava/lang/String;IIIZ)Lcom/android/launcher3/views/q;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/q;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v6

    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v7

    .line 15
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const v2, 0x7f070c82

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const v3, 0x7f070c83

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    mul-int/lit8 v2, v5, 0x2

    .line 46
    .line 47
    add-int/2addr v2, v1

    .line 48
    if-ge v6, v2, :cond_0

    .line 49
    .line 50
    new-instance p0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string p1, "Cannot display tip on a small screen of size: "

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "ArrowTipView"

    .line 68
    .line 69
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return-object p0

    .line 74
    :cond_0
    const v2, 0x7f0b05e0

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-gez p1, :cond_1

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 99
    .line 100
    .line 101
    :cond_1
    move-object v1, p0

    .line 102
    move v2, p2

    .line 103
    move v3, p3

    .line 104
    move v4, p4

    .line 105
    move v8, p5

    .line 106
    invoke-virtual/range {v1 .. v8}, Lcom/android/launcher3/views/q;->f0(IIIIIIZ)Lcom/android/launcher3/views/q;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method private getTextAlpha()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/q;->q:I

    .line 2
    .line 3
    return p0
.end method

.method private i0(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/q;->k:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    .line 8
    .line 9
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 13
    .line 14
    int-to-float v3, v3

    .line 15
    invoke-static {v2, v3, p1}, Ln1/G;->a(FFZ)Ln1/G;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const v4, 0x7f07012a

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    iget v4, p0, Lcom/android/launcher3/views/q;->n:I

    .line 42
    .line 43
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 44
    .line 45
    .line 46
    new-instance v4, Landroid/graphics/CornerPathEffect;

    .line 47
    .line 48
    int-to-float v5, v3

    .line 49
    invoke-direct {v4, v5}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/launcher3/views/q;->k:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/android/launcher3/views/q;->k:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    if-eqz p1, :cond_0

    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/launcher3/views/q;->k:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {p0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 74
    .line 75
    mul-int/lit8 v3, v3, -0x1

    .line 76
    .line 77
    invoke-virtual {v0, v1, v1, v1, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/views/q;->k:Landroid/view/View;

    .line 82
    .line 83
    const/4 v2, 0x1

    .line 84
    invoke-virtual {p0, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 85
    .line 86
    .line 87
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 88
    .line 89
    mul-int/lit8 v3, v3, -0x1

    .line 90
    .line 91
    invoke-virtual {v0, v1, v3, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method private setTextAlpha(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/q;->q:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/android/launcher3/views/q;->q:I

    .line 6
    .line 7
    const p1, 0x7f0b05e0

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget p0, p0, Lcom/android/launcher3/views/q;->q:I

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/content/res/ColorStateList;->withAlpha(I)Landroid/content/res/ColorStateList;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method


# virtual methods
.method protected V(Landroid/content/res/TypedArray;Landroid/content/Context;)I
    .locals 0

    .line 1
    const p0, 0x7f06005e

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2, p0}, Landroid/content/Context;->getColor(I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p1, p2, p0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 14
    .line 15
    .line 16
    return p0
.end method

.method public c0(Ljava/lang/String;III)Lcom/android/launcher3/views/q;
    .locals 6

    .line 1
    const/4 v5, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/views/q;->d0(Ljava/lang/String;IIIZ)Lcom/android/launcher3/views/q;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public d0(Ljava/lang/String;IIIZ)Lcom/android/launcher3/views/q;
    .locals 4

    .line 1
    const v0, 0x7f0b05e0

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/views/q;->g:Lcom/android/launcher3/views/k;

    .line 14
    .line 15
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/views/q;->g:Lcom/android/launcher3/views/k;

    .line 23
    .line 24
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 33
    .line 34
    iput p2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 35
    .line 36
    iget v2, p0, Lcom/android/launcher3/views/q;->m:I

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    add-int/2addr v2, v3

    .line 45
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 46
    .line 47
    iget v2, p0, Lcom/android/launcher3/views/q;->m:I

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    add-int/2addr v2, v0

    .line 56
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 57
    .line 58
    const/4 v0, -0x1

    .line 59
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/views/q;->k:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 68
    .line 69
    iput p2, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutDirection()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    const/4 v3, 0x1

    .line 76
    if-ne v2, v3, :cond_0

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    sub-int p3, v2, p3

    .line 83
    .line 84
    :cond_0
    const v2, 0x800005

    .line 85
    .line 86
    .line 87
    if-ne p2, v2, :cond_1

    .line 88
    .line 89
    iget p2, p0, Lcom/android/launcher3/views/q;->m:I

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 96
    .line 97
    sub-int/2addr p1, v1

    .line 98
    sub-int/2addr p1, p3

    .line 99
    iget p3, p0, Lcom/android/launcher3/views/q;->l:I

    .line 100
    .line 101
    div-int/lit8 p3, p3, 0x2

    .line 102
    .line 103
    sub-int/2addr p1, p3

    .line 104
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    const p1, 0x800003

    .line 113
    .line 114
    .line 115
    if-ne p2, p1, :cond_2

    .line 116
    .line 117
    iget p1, p0, Lcom/android/launcher3/views/q;->m:I

    .line 118
    .line 119
    iget p2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 120
    .line 121
    sub-int/2addr p3, p2

    .line 122
    iget p2, p0, Lcom/android/launcher3/views/q;->l:I

    .line 123
    .line 124
    div-int/lit8 p2, p2, 0x2

    .line 125
    .line 126
    sub-int/2addr p3, p2

    .line 127
    invoke-static {p1, p3}, Ljava/lang/Math;->max(II)I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 132
    .line 133
    .line 134
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 135
    .line 136
    .line 137
    new-instance p1, Lcom/android/launcher3/views/o;

    .line 138
    .line 139
    invoke-direct {p1, p0, p4}, Lcom/android/launcher3/views/o;-><init>(Lcom/android/launcher3/views/q;I)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 143
    .line 144
    .line 145
    iput-boolean v3, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 146
    .line 147
    if-eqz p5, :cond_3

    .line 148
    .line 149
    iget-object p1, p0, Lcom/android/launcher3/views/q;->h:Landroid/os/Handler;

    .line 150
    .line 151
    new-instance p2, Lcom/android/launcher3/views/p;

    .line 152
    .line 153
    invoke-direct {p2, p0}, Lcom/android/launcher3/views/p;-><init>(Lcom/android/launcher3/views/q;)V

    .line 154
    .line 155
    .line 156
    const-wide/16 p3, 0x2710

    .line 157
    .line 158
    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 159
    .line 160
    .line 161
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 162
    .line 163
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 164
    .line 165
    .line 166
    return-object p0
.end method

.method public e0(Ljava/lang/String;ILandroid/graphics/Rect;I)Lcom/android/launcher3/views/q;
    .locals 7

    .line 1
    iget v0, p3, Landroid/graphics/Rect;->top:I

    .line 2
    .line 3
    sub-int v4, v0, p4

    .line 4
    .line 5
    iget p3, p3, Landroid/graphics/Rect;->bottom:I

    .line 6
    .line 7
    add-int v5, p3, p4

    .line 8
    .line 9
    const/4 v6, 0x1

    .line 10
    move-object v1, p0

    .line 11
    move-object v2, p1

    .line 12
    move v3, p2

    .line 13
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/views/q;->g0(Ljava/lang/String;IIIZ)Lcom/android/launcher3/views/q;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method protected f0(IIIIIIZ)Lcom/android/launcher3/views/q;
    .locals 8

    .line 1
    new-instance v0, Lcom/android/launcher3/views/l;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v7, p2

    .line 6
    move v5, p3

    .line 7
    move v3, p4

    .line 8
    move v4, p5

    .line 9
    move v6, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/views/l;-><init>(Lcom/android/launcher3/views/q;IIIIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    iput-boolean p0, v1, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 18
    .line 19
    if-eqz p7, :cond_0

    .line 20
    .line 21
    iget-object p0, v1, Lcom/android/launcher3/views/q;->h:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance p1, Lcom/android/launcher3/views/m;

    .line 24
    .line 25
    invoke-direct {p1, v1}, Lcom/android/launcher3/views/m;-><init>(Lcom/android/launcher3/views/q;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 p2, 0x2710

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, v1, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 36
    .line 37
    .line 38
    return-object v1
.end method

.method protected getArrowId()I
    .locals 0

    .line 1
    const p0, 0x7f0b00e9

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public h0(Ljava/lang/String;IIZ)Lcom/android/launcher3/views/q;
    .locals 6

    .line 1
    move v4, p3

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/views/q;->g0(Ljava/lang/String;IIIZ)Lcom/android/launcher3/views/q;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method protected handleClose(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 15
    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/views/n;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/android/launcher3/views/n;-><init>(Lcom/android/launcher3/views/q;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/launcher3/views/q;->g:Lcom/android/launcher3/views/k;

    .line 46
    .line 47
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/views/q;->j:Ljava/lang/Runnable;

    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 59
    .line 60
    .line 61
    :cond_2
    const/4 p1, 0x0

    .line 62
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 63
    .line 64
    :cond_3
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p1, 0x20

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 6
    .line 7
    .line 8
    return-void
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
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/views/q;->g:Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    return v0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public setCustomCloseAnimation(Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/q;->p:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method public setCustomOpenAnimation(Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/q;->o:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method
