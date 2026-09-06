.class public Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;
.super Landroid/widget/FrameLayout;
.source "BubbleBarView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;
    }
.end annotation


# static fields
.field private static final L:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:Landroid/animation/ValueAnimator;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private B:Landroid/animation/Animator;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private C:Ljava/lang/Runnable;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private D:Ljava/util/function/Consumer;
    .annotation build Landroid/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private E:Z

.field private F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private G:Lcom/android/launcher3/taskbar/bubbles/BubbleView;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private H:F

.field private I:F

.field private J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

.field private K:I

.field private final g:Lcom/android/launcher3/taskbar/bubbles/a;

.field private final h:Landroid/graphics/Rect;

.field private final i:F

.field private final j:F

.field private k:F

.field private l:F

.field private m:F

.field private final n:F

.field private final o:F

.field private final p:I

.field private q:Z

.field private r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private s:LN2/h;

.field private t:Landroid/view/View$OnClickListener;

.field private final u:Landroid/graphics/Rect;

.field private v:F

.field private w:F

.field private x:Landroid/animation/ValueAnimator;

.field private y:Landroid/animation/ValueAnimator;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private z:LV1/b;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$a;

    .line 2
    .line 3
    const-string v1, "bubbleDragAlpha"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->L:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 4
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->h:Landroid/graphics/Rect;

    const/high16 p2, 0x3f800000    # 1.0f

    .line 5
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    const/4 p3, 0x0

    .line 6
    iput-boolean p3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 7
    sget-object p4, LN2/h;->h:LN2/h;

    iput-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 8
    new-instance p4, Landroid/graphics/Rect;

    invoke-direct {p4}, Landroid/graphics/Rect;-><init>()V

    iput-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u:Landroid/graphics/Rect;

    .line 9
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->v:F

    .line 10
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->w:F

    .line 11
    invoke-direct {p0, p3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->E(Z)Landroid/animation/ValueAnimator;

    move-result-object p4

    iput-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    const/4 p4, 0x0

    .line 12
    iput-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->y:Landroid/animation/ValueAnimator;

    .line 13
    iput-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 14
    iput-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 15
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->H:F

    const/4 p2, -0x1

    .line 16
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->K:I

    const/4 p2, 0x4

    .line 17
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f07016c

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->i:F

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f070170

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f07016d

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f070160

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->j:F

    .line 22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f07016b

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n:F

    .line 23
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f0702c7

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->o:F

    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f070176

    .line 25
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p:I

    .line 26
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 27
    new-instance p2, Lcom/android/launcher3/taskbar/bubbles/a;

    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarExpandedHeight()F

    move-result p3

    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/taskbar/bubbles/a;-><init>(Landroid/content/Context;F)V

    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 28
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private A(LN2/h;)F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p1, v1}, LN2/h;->e(Z)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v1, 0x1

    .line 16
    const/4 v2, 0x2

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-le p1, v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v1, 0x0

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    if-lt v0, v2, :cond_2

    .line 31
    .line 32
    move v0, v1

    .line 33
    :cond_2
    move v1, v0

    .line 34
    :goto_0
    iget p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 35
    .line 36
    int-to-float v0, v1

    .line 37
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->i:F

    .line 38
    .line 39
    mul-float/2addr v0, v1

    .line 40
    add-float/2addr p1, v0

    .line 41
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaledIconSize()F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    const/high16 v0, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr p0, v0

    .line 48
    add-float/2addr p1, p0

    .line 49
    return p1
.end method

.method private B(LN2/h;)F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LV1/b;->t()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 12
    .line 13
    invoke-virtual {p1}, LV1/b;->j()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 18
    .line 19
    :goto_0
    add-float/2addr p1, p0

    .line 20
    return p1

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p1, v2}, LN2/h;->e(Z)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-direct {p0, v0, v1, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->N(IIZ)F

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 44
    .line 45
    const/high16 v0, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr p0, v0

    .line 48
    goto :goto_0
.end method

.method private D()Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-wide/16 v1, 0x96

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/J;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/J;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/K;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/bubbles/K;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-direct {p0, v0, v3, v1, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r(Landroid/animation/ValueAnimator;Ljava/lang/Runnable;Ljava/lang/Runnable;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->y:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    return-object v0

    .line 39
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private E(Z)Landroid/animation/ValueAnimator;
    .locals 4

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
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    if-eqz v3, :cond_1

    .line 12
    .line 13
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ljava/lang/Float;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->cancel()V

    .line 34
    .line 35
    .line 36
    :cond_1
    if-eqz p1, :cond_2

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    move v0, v1

    .line 40
    :goto_1
    const/4 p1, 0x2

    .line 41
    new-array p1, p1, [F

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    aput v2, p1, v1

    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    aput v0, p1, v1

    .line 48
    .line 49
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-wide/16 v0, 0x190

    .line 54
    .line 55
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    sget-object v0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    .line 62
    .line 63
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/C;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/C;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/D;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/D;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 71
    .line 72
    .line 73
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/E;

    .line 74
    .line 75
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/bubbles/E;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 76
    .line 77
    .line 78
    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r(Landroid/animation/ValueAnimator;Ljava/lang/Runnable;Ljava/lang/Runnable;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 79
    .line 80
    .line 81
    return-object p1
.end method

.method private G(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/taskbar/bubbles/BubbleView;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    if-ltz v2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->removeViewInLayout(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {p0, v1, v0, v2}, Landroid/widget/FrameLayout;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 42
    .line 43
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r0(LN2/h;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s0()V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->t0()V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method private K(IIZ)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_4

    .line 3
    .line 4
    if-lt p1, p2, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    if-eqz p3, :cond_1

    .line 8
    .line 9
    if-nez p1, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 p2, 0x2

    .line 16
    if-lt p1, p2, :cond_3

    .line 17
    .line 18
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->i:F

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    if-eqz p1, :cond_3

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/4 p2, 0x1

    .line 28
    if-ne p1, p2, :cond_2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->i:F

    .line 32
    .line 33
    :cond_3
    :goto_0
    iget p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 34
    .line 35
    add-float/2addr p1, v0

    .line 36
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaleIconShift()F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    sub-float/2addr p1, p0

    .line 41
    return p1

    .line 42
    :cond_4
    :goto_1
    return v0
.end method

.method private N(IIZ)F
    .locals 2

    .line 1
    if-ltz p1, :cond_3

    .line 2
    .line 3
    if-lt p1, p2, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaledIconSize()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->j:F

    .line 11
    .line 12
    add-float/2addr v0, v1

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, LV1/b;->t()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, LV1/b;->n(I)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 30
    .line 31
    add-float/2addr p1, p0

    .line 32
    return p1

    .line 33
    :cond_1
    if-eqz p3, :cond_2

    .line 34
    .line 35
    iget p3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 36
    .line 37
    sub-int/2addr p2, p1

    .line 38
    add-int/lit8 p2, p2, -0x1

    .line 39
    .line 40
    int-to-float p1, p2

    .line 41
    mul-float/2addr p1, v0

    .line 42
    add-float/2addr p3, p1

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 45
    .line 46
    int-to-float p1, p1

    .line 47
    mul-float/2addr p1, v0

    .line 48
    add-float p3, p2, p1

    .line 49
    .line 50
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaleIconShift()F

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    sub-float/2addr p3, p0

    .line 55
    return p3

    .line 56
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 57
    return p0
.end method

.method private O()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of p0, p0, Lcom/android/launcher3/taskbar/bubbles/x;

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method private S(FF)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->T(F)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->U(F)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private T(F)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private U(F)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private synthetic W(FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k0(FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic X(ZFFZFFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p7}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p7

    .line 5
    check-cast p7, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p7}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p7

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sub-float/2addr p3, p2

    .line 14
    mul-float/2addr p3, p7

    .line 15
    add-float/2addr p2, p3

    .line 16
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 17
    .line 18
    :cond_0
    if-eqz p4, :cond_1

    .line 19
    .line 20
    sub-float/2addr p6, p5

    .line 21
    mul-float/2addr p6, p7

    .line 22
    add-float/2addr p5, p6

    .line 23
    iput p5, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 24
    .line 25
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r0(LN2/h;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic Y(LN2/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x(LN2/h;LN2/h;)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic Z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->y:Landroid/animation/ValueAnimator;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->d0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic a0(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    sub-float/2addr v0, p1

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/a;->m(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->e0(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/a;->m(Z)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->C:Ljava/lang/Runnable;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->C:Ljava/lang/Runnable;

    .line 21
    .line 22
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->D:Ljava/util/function/Consumer;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    instance-of v0, v0, Lcom/android/launcher3/taskbar/bubbles/x;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->D:Ljava/util/function/Consumer;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v1, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 67
    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->t()V

    .line 71
    .line 72
    .line 73
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u0()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;FF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->W(FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r0(LN2/h;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->f0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e0(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->G(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LN2/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Y(LN2/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic f0(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/a;->h(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g0()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, LN2/h;->e(Z)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/bubbles/a;->f(Z)V

    .line 14
    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    :goto_0
    iput v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->v:F

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    const/4 v0, 0x5

    .line 35
    :goto_1
    or-int/lit8 v0, v0, 0x50

    .line 36
    .line 37
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q0()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private getBubbleBarExpandedHeight()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarCollapsedHeight()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p:I

    .line 6
    .line 7
    int-to-float p0, p0

    .line 8
    add-float/2addr v0, p0

    .line 9
    return v0
.end method

.method private getBubbleBarHeight()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarExpandedHeight()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarCollapsedHeight()F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method private getBubbleTranslationY()F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->h:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    :goto_0
    add-int/2addr v0, v1

    .line 18
    int-to-float v0, v0

    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarHeight()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-float/2addr v0, v1

    .line 24
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->I:F

    .line 25
    .line 26
    add-float/2addr v1, v0

    .line 27
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 28
    .line 29
    add-float/2addr v1, v0

    .line 30
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaleIconShift()F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    sub-float/2addr v1, p0

    .line 35
    return v1
.end method

.method private getBubbles()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/taskbar/bubbles/BubbleView;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    instance-of v3, v2, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    check-cast v2, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 22
    .line 23
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-object v0
.end method

.method private getChildViewsInOnScreenOrder()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {v1, p0}, LN2/h;->e(Z)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->reversed()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    return-object v0
.end method

.method private getDistanceFromOtherSide()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 20
    .line 21
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 22
    .line 23
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 24
    .line 25
    add-int/2addr v2, v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v2, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    sub-int/2addr v0, p0

    .line 33
    sub-int/2addr v0, v2

    .line 34
    int-to-float p0, v0

    .line 35
    return p0
.end method

.method private getLocationAnimAlphaProperty()Landroid/util/FloatProperty;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "-",
            "Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->L:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-object p0
.end method

.method private getScaleIconShift()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaledIconSize()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sub-float/2addr v0, p0

    .line 8
    const/high16 p0, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v0, p0

    .line 11
    return v0
.end method

.method private getScaledIconSize()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 4
    .line 5
    mul-float/2addr v0, p0

    .line 6
    return v0
.end method

.method public static synthetic h(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->a0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;ZFFZFFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->X(ZFFZFFLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 15
    .line 16
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setAlphaDuringBubbleDrag(F)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setTranslationX(F)V

    .line 23
    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-lez v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->H:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)Lcom/android/launcher3/taskbar/bubbles/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)LN2/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 2
    .line 3
    return-object p0
.end method

.method private m0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->t:Landroid/view/View$OnClickListener;

    .line 8
    .line 9
    :goto_0
    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method static bridge synthetic n(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LV1/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic o(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setAlphaDuringBubbleDrag(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic p(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LN2/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r0(LN2/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private p0(Z)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 3
    .line 4
    const-string v2, "BubbleBarView"

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const-string p0, "trying to update selection arrow without a selected view!"

    .line 9
    .line 10
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 15
    .line 16
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B(LN2/h;)F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/a;->b()F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    cmpl-float v4, v1, v3

    .line 27
    .line 28
    if-nez v4, :cond_1

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->I()F

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    cmpl-float v4, v3, v4

    .line 38
    .line 39
    if-lez v4, :cond_2

    .line 40
    .line 41
    const-string p1, "arrow out of bounds of expanded view, skip animation"

    .line 42
    .line 43
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move p1, v0

    .line 47
    :cond_2
    if-eqz p1, :cond_3

    .line 48
    .line 49
    const/4 p1, 0x2

    .line 50
    new-array p1, p1, [F

    .line 51
    .line 52
    aput v3, p1, v0

    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    aput v1, p1, v0

    .line 56
    .line 57
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-wide/16 v0, 0xc8

    .line 62
    .line 63
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    .line 66
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/F;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/F;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Lcom/android/launcher3/taskbar/bubbles/a;->h(F)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method static bridge synthetic q(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q0()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setImportantForAccessibility(I)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getChildViewsInOnScreenOrder()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v3, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 35
    .line 36
    .line 37
    new-instance v4, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$f;

    .line 38
    .line 39
    invoke-direct {v4, p0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$f;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v4}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 43
    .line 44
    .line 45
    move-object v1, v3

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setImportantForAccessibility(I)V

    .line 48
    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    move v2, v0

    .line 52
    :goto_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-ge v2, v3, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 66
    .line 67
    .line 68
    add-int/lit8 v2, v2, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    return-void
.end method

.method private r(Landroid/animation/ValueAnimator;Ljava/lang/Runnable;Ljava/lang/Runnable;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V
    .locals 0
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Runnable;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/animation/ValueAnimator$AnimatorUpdateListener;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    new-instance p4, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$g;

    .line 7
    .line 8
    invoke-direct {p4, p0, p2, p3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$g;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p4}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private r0(LN2/h;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ljava/lang/Float;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    int-to-float v2, v2

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->I()F

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->C()F

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleTranslationY()F

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    move-object/from16 v8, p1

    .line 41
    .line 42
    invoke-virtual {v8, v7}, LN2/h;->e(Z)Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    const/high16 v9, 0x3f800000    # 1.0f

    .line 47
    .line 48
    sub-float v10, v9, v1

    .line 49
    .line 50
    const/4 v11, 0x0

    .line 51
    move v12, v11

    .line 52
    :goto_0
    if-ge v12, v5, :cond_c

    .line 53
    .line 54
    invoke-virtual {v0, v12}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v13

    .line 58
    check-cast v13, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 59
    .line 60
    iget-object v14, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 61
    .line 62
    if-eq v13, v14, :cond_b

    .line 63
    .line 64
    iget-object v14, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->G:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 65
    .line 66
    if-ne v13, v14, :cond_0

    .line 67
    .line 68
    goto/16 :goto_6

    .line 69
    .line 70
    :cond_0
    const/4 v14, 0x0

    .line 71
    invoke-virtual {v13, v14}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setDragTranslationX(F)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v13, v14}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setOffsetX(F)V

    .line 75
    .line 76
    .line 77
    iget-object v15, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 78
    .line 79
    if-eqz v15, :cond_1

    .line 80
    .line 81
    invoke-virtual {v15}, LV1/b;->t()Z

    .line 82
    .line 83
    .line 84
    move-result v15

    .line 85
    if-nez v15, :cond_2

    .line 86
    .line 87
    :cond_1
    iget v15, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 88
    .line 89
    invoke-virtual {v13, v15}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 90
    .line 91
    .line 92
    iget v15, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 93
    .line 94
    invoke-virtual {v13, v15}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 95
    .line 96
    .line 97
    :cond_2
    invoke-virtual {v13, v6}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 98
    .line 99
    .line 100
    invoke-direct {v0, v12, v5, v7}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->N(IIZ)F

    .line 101
    .line 102
    .line 103
    move-result v15

    .line 104
    invoke-direct {v0, v12, v5, v7}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->K(IIZ)F

    .line 105
    .line 106
    .line 107
    move-result v16

    .line 108
    const/high16 v17, 0x40a00000    # 5.0f

    .line 109
    .line 110
    iget v9, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n:F

    .line 111
    .line 112
    mul-float v9, v9, v17

    .line 113
    .line 114
    move/from16 v17, v14

    .line 115
    .line 116
    int-to-float v14, v12

    .line 117
    sub-float/2addr v9, v14

    .line 118
    mul-float/2addr v9, v10

    .line 119
    invoke-virtual {v13, v9}, Landroid/view/ViewGroup;->setZ(F)V

    .line 120
    .line 121
    .line 122
    iget-object v9, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    .line 123
    .line 124
    invoke-virtual {v9}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 125
    .line 126
    .line 127
    move-result v9

    .line 128
    if-eqz v9, :cond_5

    .line 129
    .line 130
    iget-object v9, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 131
    .line 132
    if-ne v13, v9, :cond_3

    .line 133
    .line 134
    move v9, v10

    .line 135
    goto :goto_1

    .line 136
    :cond_3
    move v9, v1

    .line 137
    :goto_1
    invoke-virtual {v13, v9}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->x(F)V

    .line 138
    .line 139
    .line 140
    iget-object v9, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 141
    .line 142
    if-ne v13, v9, :cond_4

    .line 143
    .line 144
    const/high16 v9, 0x3f800000    # 1.0f

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_4
    move v9, v1

    .line 148
    :goto_2
    invoke-virtual {v13, v9}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setBadgeScale(F)V

    .line 149
    .line 150
    .line 151
    :cond_5
    iget-boolean v9, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 152
    .line 153
    if-eqz v9, :cond_7

    .line 154
    .line 155
    if-eqz v7, :cond_6

    .line 156
    .line 157
    move/from16 v14, v17

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_6
    sub-float v14, v2, v3

    .line 161
    .line 162
    :goto_3
    add-float/2addr v15, v14

    .line 163
    sub-float v15, v15, v16

    .line 164
    .line 165
    mul-float/2addr v15, v1

    .line 166
    add-float v15, v15, v16

    .line 167
    .line 168
    invoke-virtual {v13, v15}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v13, v11}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 172
    .line 173
    .line 174
    goto :goto_6

    .line 175
    :cond_7
    if-eqz v7, :cond_8

    .line 176
    .line 177
    move/from16 v9, v17

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_8
    sub-float v9, v2, v4

    .line 181
    .line 182
    :goto_4
    add-float v16, v16, v9

    .line 183
    .line 184
    sub-float v15, v15, v16

    .line 185
    .line 186
    mul-float/2addr v15, v1

    .line 187
    add-float v15, v15, v16

    .line 188
    .line 189
    invoke-virtual {v13, v15}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 190
    .line 191
    .line 192
    cmpl-float v9, v1, v17

    .line 193
    .line 194
    if-nez v9, :cond_b

    .line 195
    .line 196
    invoke-virtual {v13}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->q()Z

    .line 197
    .line 198
    .line 199
    move-result v9

    .line 200
    if-nez v9, :cond_a

    .line 201
    .line 202
    const/4 v9, 0x1

    .line 203
    if-le v12, v9, :cond_9

    .line 204
    .line 205
    goto :goto_5

    .line 206
    :cond_9
    invoke-virtual {v13, v11}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 207
    .line 208
    .line 209
    goto :goto_6

    .line 210
    :cond_a
    :goto_5
    const/4 v9, 0x4

    .line 211
    invoke-virtual {v13, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 212
    .line 213
    .line 214
    :cond_b
    :goto_6
    add-int/lit8 v12, v12, 0x1

    .line 215
    .line 216
    const/high16 v9, 0x3f800000    # 1.0f

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_c
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->A(LN2/h;)F

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B(LN2/h;)F

    .line 225
    .line 226
    .line 227
    move-result v6

    .line 228
    sub-float/2addr v3, v4

    .line 229
    mul-float/2addr v3, v1

    .line 230
    add-float/2addr v3, v4

    .line 231
    sub-float v8, v6, v5

    .line 232
    .line 233
    mul-float/2addr v8, v1

    .line 234
    if-eqz v7, :cond_d

    .line 235
    .line 236
    add-float/2addr v5, v8

    .line 237
    goto :goto_7

    .line 238
    :cond_d
    iget-boolean v7, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 239
    .line 240
    if-eqz v7, :cond_e

    .line 241
    .line 242
    sub-float/2addr v2, v3

    .line 243
    add-float/2addr v2, v5

    .line 244
    add-float v5, v2, v8

    .line 245
    .line 246
    goto :goto_7

    .line 247
    :cond_e
    sub-float/2addr v2, v4

    .line 248
    add-float/2addr v2, v5

    .line 249
    sub-float/2addr v6, v2

    .line 250
    mul-float/2addr v6, v1

    .line 251
    add-float v5, v2, v6

    .line 252
    .line 253
    :goto_7
    iget-object v2, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 254
    .line 255
    invoke-virtual {v2, v5}, Lcom/android/launcher3/taskbar/bubbles/a;->h(F)V

    .line 256
    .line 257
    .line 258
    iget-object v2, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 259
    .line 260
    invoke-virtual {v2, v1}, Lcom/android/launcher3/taskbar/bubbles/a;->g(F)V

    .line 261
    .line 262
    .line 263
    iget-object v1, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 264
    .line 265
    invoke-virtual {v1, v3}, Lcom/android/launcher3/taskbar/bubbles/a;->l(F)V

    .line 266
    .line 267
    .line 268
    iget-object v1, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 269
    .line 270
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarExpandedHeight()F

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/bubbles/a;->i(F)V

    .line 275
    .line 276
    .line 277
    return-void
.end method

.method private s0()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string v0, ""

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->O()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    sub-int/2addr v1, v2

    .line 24
    const/4 v2, 0x1

    .line 25
    if-le v1, v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    sub-int/2addr v1, v2

    .line 32
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const v1, 0x7f1400d8

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :cond_1
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private setAlphaDuringBubbleDrag(F)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->H:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 15
    .line 16
    if-eq v2, v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/high16 v0, 0x437f0000    # 255.0f

    .line 29
    .line 30
    mul-float/2addr p1, v0

    .line 31
    float-to-int p1, p1

    .line 32
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/a;->setAlpha(I)V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void
.end method

.method private t0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->w()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->n()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-virtual {v1, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->y(Z)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->p()V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->o()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->p()V

    .line 45
    .line 46
    .line 47
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    :goto_2
    return-void
.end method

.method private u0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarExpandedHeight()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    float-to-int v1, v1

    .line 12
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->I()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->C()F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    :goto_0
    float-to-int v1, v1

    .line 28
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private z()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const v1, 0x7f1400d7

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :goto_0
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const v2, 0x7f1400d2

    .line 30
    .line 31
    .line 32
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v1, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const v2, 0x7f1400d1

    .line 46
    .line 47
    .line 48
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v1, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :goto_1
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method C()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 8
    .line 9
    mul-float/2addr v2, v1

    .line 10
    const/4 v1, 0x2

    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getCollapsedWidthWithMaxVisibleBubbles()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaledIconSize()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    add-float/2addr p0, v2

    .line 23
    return p0
.end method

.method public F(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->y:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->D()Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->y:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {p0, v0, v1, p1, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r(Landroid/animation/ValueAnimator;Ljava/lang/Runnable;Ljava/lang/Runnable;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public H(Ljava/io/PrintWriter;)V
    .locals 4

    .line 1
    const-string v0, "BubbleBarView state:"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "  visibility: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v1, "  alpha: "

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v1, "  translationY: "

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v1, "  childCount: "

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v1, "  hasOverflow:  "

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->O()Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbles()Ljava/util/List;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-eqz v1, :cond_1

    .line 139
    .line 140
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    if-nez v1, :cond_0

    .line 151
    .line 152
    const-string v1, "null"

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    const-string v3, "    bubble key: "

    .line 165
    .line 166
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    const-string v1, "  isExpanded: "

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 205
    .line 206
    if-eqz v0, :cond_2

    .line 207
    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .line 212
    .line 213
    const-string v1, "  mBubbleAnimator.isRunning(): "

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 219
    .line 220
    invoke-virtual {v1}, LV1/b;->t()Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    const-string v0, "  mBubbleAnimator is null"

    .line 235
    .line 236
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 242
    .line 243
    .line 244
    const-string v1, "  mDragging: "

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->E:Z

    .line 250
    .line 251
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method public I()F
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 8
    .line 9
    mul-float/2addr v2, v1

    .line 10
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, LV1/b;->t()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 21
    .line 22
    invoke-virtual {p0}, LV1/b;->s()F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-float/2addr p0, v2

    .line 27
    return p0

    .line 28
    :cond_0
    add-int/lit8 v1, v0, -0x1

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    int-to-float v1, v1

    .line 36
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->j:F

    .line 37
    .line 38
    mul-float/2addr v1, v3

    .line 39
    int-to-float v0, v0

    .line 40
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaledIconSize()F

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    mul-float/2addr v0, p0

    .line 45
    add-float/2addr v0, v1

    .line 46
    add-float/2addr v0, v2

    .line 47
    return v0
.end method

.method public J(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;
    .locals 2

    .line 1
    iget p1, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarLocation()LN2/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, LN2/h;->e(Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p2, v1}, LN2/h;->e(Z)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getDistanceFromOtherSide()F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p2, v0}, LN2/h;->e(Z)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    neg-float p1, p1

    .line 40
    :cond_0
    new-instance p2, Landroid/graphics/PointF;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 43
    .line 44
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;->b()F

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-direct {p2, p1, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 49
    .line 50
    .line 51
    return-object p2
.end method

.method L(II)F
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    add-int/lit8 v2, v0, -0x1

    .line 15
    .line 16
    mul-int/2addr p2, v1

    .line 17
    int-to-float p2, p2

    .line 18
    mul-int/2addr p1, v0

    .line 19
    int-to-float p1, p1

    .line 20
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->i:F

    .line 21
    .line 22
    int-to-float v0, v2

    .line 23
    mul-float/2addr p0, v0

    .line 24
    add-float/2addr p1, p0

    .line 25
    add-float/2addr p1, p2

    .line 26
    return p1
.end method

.method public M(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;
    .locals 4

    .line 1
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p2, v1}, LN2/h;->e(Z)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarLocation()LN2/h;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v2, v3}, LN2/h;->e(Z)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eq v2, v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iget p2, p2, Landroid/graphics/PointF;->x:F

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->N(IIZ)F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    add-float v0, p2, p0

    .line 46
    .line 47
    :cond_0
    new-instance p0, Landroid/graphics/PointF;

    .line 48
    .line 49
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 50
    .line 51
    invoke-direct {p0, v0, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 52
    .line 53
    .line 54
    return-object p0
.end method

.method public P(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getBoundsOnScreen(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u:Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    float-to-int v0, v0

    .line 19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    float-to-int p1, p1

    .line 24
    invoke-virtual {p0, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public Q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public R()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public V()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/a;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q0()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s0()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->t0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method getArrowHeight()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    return p0
.end method

.method public getBubbleBarBounds()Landroid/graphics/Rect;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->h:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTop()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    float-to-int v2, v2

    .line 17
    add-int/2addr v1, v2

    .line 18
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p:I

    .line 19
    .line 20
    add-int/2addr v1, v2

    .line 21
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBottom()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    float-to-int p0, p0

    .line 32
    add-int/2addr v1, p0

    .line 33
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 34
    .line 35
    return-object v0
.end method

.method getBubbleBarCollapsedHeight()F
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaledIconSize()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 6
    .line 7
    const/high16 v1, 0x40000000    # 2.0f

    .line 8
    .line 9
    mul-float/2addr p0, v1

    .line 10
    add-float/2addr v0, p0

    .line 11
    return v0
.end method

.method public getBubbleBarExpandedBounds()Landroid/graphics/Rect;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->R()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-object v0

    .line 19
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v1, v2}, LN2/h;->e(Z)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->I()F

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    float-to-int p0, p0

    .line 38
    add-int/2addr v1, p0

    .line 39
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_2
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->I()F

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    float-to-int p0, p0

    .line 49
    sub-int/2addr v1, p0

    .line 50
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 51
    .line 52
    return-object v0
.end method

.method public getBubbleBarLocation()LN2/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 2
    .line 3
    return-object p0
.end method

.method getBubbleChildCount()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    add-int/lit8 p0, p0, -0x1

    .line 12
    .line 13
    :cond_0
    return p0
.end method

.method getBubbleElevation()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n:F

    .line 2
    .line 3
    return p0
.end method

.method getCollapsedWidthWithMaxVisibleBubbles()F
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaledIconSize()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->i:F

    .line 6
    .line 7
    add-float/2addr v0, v1

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 11
    .line 12
    mul-float/2addr p0, v1

    .line 13
    add-float/2addr v0, p0

    .line 14
    return v0
.end method

.method getHorizontalMargin()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout$LayoutParams;->getMarginEnd()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method getPointerSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getRelativePivotX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->v:F

    .line 2
    .line 3
    return p0
.end method

.method public getRelativePivotY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->w:F

    .line 2
    .line 3
    return p0
.end method

.method public getRestingTopPositionOnScreen()I
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/util/Z;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 18
    .line 19
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarBounds()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    sub-int/2addr v0, v1

    .line 30
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 31
    .line 32
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;->b()F

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    float-to-int p0, p0

    .line 37
    add-int/2addr v0, p0

    .line 38
    return v0
.end method

.method getSelectedBubbleDotColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getDotColor()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method getSelectedBubbleDotDistanceFromTopLeft()Landroid/graphics/PointF;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroid/graphics/PointF;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, v0, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {v1, v2}, LN2/h;->e(Z)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->N(IIZ)F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->K(IIZ)F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getDotCenter()Landroid/graphics/PointF;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Landroid/graphics/PointF;

    .line 56
    .line 57
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 58
    .line 59
    add-float/2addr v0, v3

    .line 60
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 61
    .line 62
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p:I

    .line 63
    .line 64
    int-to-float p0, p0

    .line 65
    add-float/2addr v3, p0

    .line 66
    iget p0, v1, Landroid/graphics/PointF;->y:F

    .line 67
    .line 68
    add-float/2addr v3, p0

    .line 69
    invoke-direct {v2, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 70
    .line 71
    .line 72
    return-object v2
.end method

.method public h0(Landroid/view/View;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-ne v0, p1, :cond_0

    .line 12
    .line 13
    move v3, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v3, v1

    .line 16
    :goto_0
    if-eqz v3, :cond_1

    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->G:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 19
    .line 20
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ne v0, v2, :cond_2

    .line 25
    .line 26
    move v8, v2

    .line 27
    goto :goto_1

    .line 28
    :cond_2
    move v8, v1

    .line 29
    :goto_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    new-instance v4, LV1/b;

    .line 34
    .line 35
    iget v5, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 36
    .line 37
    iget v6, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->j:F

    .line 38
    .line 39
    iget-object v7, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    invoke-virtual {v7, v9}, LN2/h;->e(Z)Z

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    invoke-direct {v4, v5, v6, v0, v7}, LV1/b;-><init>(FFIZ)V

    .line 50
    .line 51
    .line 52
    iput-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 53
    .line 54
    new-instance v9, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;

    .line 55
    .line 56
    invoke-direct {v9, p0, p1, v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$e;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    add-int/lit8 v4, v0, -0x1

    .line 64
    .line 65
    invoke-virtual {p0, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    check-cast v5, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 70
    .line 71
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    const-string v6, "Overflow"

    .line 80
    .line 81
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-eqz v5, :cond_4

    .line 86
    .line 87
    add-int/lit8 v0, v0, -0x2

    .line 88
    .line 89
    if-ne v3, v0, :cond_3

    .line 90
    .line 91
    :goto_2
    move v7, v2

    .line 92
    goto :goto_3

    .line 93
    :cond_3
    move v7, v1

    .line 94
    goto :goto_3

    .line 95
    :cond_4
    if-ne v3, v4, :cond_3

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :goto_3
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    invoke-virtual/range {v4 .. v9}, LV1/b;->g(IIZZLV1/b$b;)V

    .line 111
    .line 112
    .line 113
    if-eqz v8, :cond_5

    .line 114
    .line 115
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->y:Landroid/animation/ValueAnimator;

    .line 116
    .line 117
    if-nez p1, :cond_5

    .line 118
    .line 119
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->D()Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 124
    .line 125
    .line 126
    :cond_5
    return-void

    .line 127
    :cond_6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->removeView(Landroid/view/View;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public i0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/taskbar/bubbles/BubbleView;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->G(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_0
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/L;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/L;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->C:Ljava/lang/Runnable;

    .line 26
    .line 27
    return-void
.end method

.method public k0(FF)V
    .locals 4

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->S(FF)Z

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
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 11
    .line 12
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 13
    .line 14
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 p2, 0x0

    .line 21
    :goto_0
    if-ge p2, p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 30
    .line 31
    .line 32
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 44
    .line 45
    float-to-int v3, v2

    .line 46
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 47
    .line 48
    float-to-int v2, v2

    .line 49
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 p2, p2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 58
    .line 59
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarHeight()F

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/a;->i(F)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u0()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public l0(FF)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 2
    .line 3
    iget p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 4
    .line 5
    div-float/2addr p1, p2

    .line 6
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r0(LN2/h;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public n0(FF)V
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/lang/Float;->min(FF)F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p1, v1}, Ljava/lang/Float;->max(FF)F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->v:F

    .line 13
    .line 14
    invoke-static {p2, v0}, Ljava/lang/Float;->min(FF)F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p1, v1}, Ljava/lang/Float;->max(FF)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->w:F

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public o0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/a;->n(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onInitializeAccessibilityNodeInfoInternal(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfoInternal(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_EXPAND:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_CLICK:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const v2, 0x7f1400d3

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const v2, 0x7f0b004d

    .line 28
    .line 29
    .line 30
    invoke-direct {v0, v2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, LN2/h;->e(Z)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const v1, 0x7f1400d5

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const v1, 0x7f0b0058

    .line 62
    .line 63
    .line 64
    invoke-direct {v0, v1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const v1, 0x7f1400d4

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const v1, 0x7f0b0057

    .line 85
    .line 86
    .line 87
    invoke-direct {v0, v1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;->e()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->h:Landroid/graphics/Rect;

    .line 5
    .line 6
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    iget p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p:I

    .line 9
    .line 10
    add-int/2addr p3, p2

    .line 11
    iput p3, p1, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    iput p4, p1, Landroid/graphics/Rect;->right:I

    .line 14
    .line 15
    iput p5, p1, Landroid/graphics/Rect;->bottom:I

    .line 16
    .line 17
    iget p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->v:F

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    int-to-float p2, p2

    .line 24
    mul-float/2addr p1, p2

    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->w:F

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    int-to-float p2, p2

    .line 35
    mul-float/2addr p1, p2

    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 37
    .line 38
    .line 39
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->E:Z

    .line 40
    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 44
    .line 45
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r0(LN2/h;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 2
    .line 3
    sget-object v1, LN2/h;->h:LN2/h;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->K:I

    .line 8
    .line 9
    if-eq v0, p1, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "BubbleBar RTL properties changed, new layoutDirection="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, " previous layoutDirection="

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->K:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "BubbleBarView"

    .line 39
    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->K:I

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g0()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public performAccessibilityActionInternal(ILandroid/os/Bundle;)Z
    .locals 3

    .line 1
    const/high16 v0, 0x40000

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq p1, v0, :cond_4

    .line 5
    .line 6
    const/16 v0, 0x10

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const v0, 0x7f0b004d

    .line 12
    .line 13
    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 17
    .line 18
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;->f()V

    .line 19
    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    const v0, 0x7f0b0057

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x4

    .line 26
    if-ne p1, v0, :cond_2

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 29
    .line 30
    sget-object p1, LN2/h;->i:LN2/h;

    .line 31
    .line 32
    invoke-interface {p0, p1, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;->a(LN2/h;I)V

    .line 33
    .line 34
    .line 35
    return v1

    .line 36
    :cond_2
    const v0, 0x7f0b0058

    .line 37
    .line 38
    .line 39
    if-ne p1, v0, :cond_3

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 42
    .line 43
    sget-object p1, LN2/h;->j:LN2/h;

    .line 44
    .line 45
    invoke-interface {p0, p1, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;->a(LN2/h;I)V

    .line 46
    .line 47
    .line 48
    return v1

    .line 49
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->performAccessibilityActionInternal(ILandroid/os/Bundle;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 55
    .line 56
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;->c()V

    .line 57
    .line 58
    .line 59
    return v1
.end method

.method public removeView(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/a;->m(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u0()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q0()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s0()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->G:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->t0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public s(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->t(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setBackgroundAlpha(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 2
    .line 3
    const/high16 v0, 0x437f0000    # 255.0f

    .line 4
    .line 5
    mul-float/2addr p1, v0

    .line 6
    float-to-int p1, p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/a;->setAlpha(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setBackgroundScaleX(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/a;->j(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBackgroundScaleY(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/a;->k(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBubbleAlpha(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, p1}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public setBubbleBarLocation(LN2/h;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->j0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 5
    .line 6
    if-eq p1, v0, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setBubbleOffsetY(F)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->I:F

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-ge p1, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleTranslationY()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 p1, p1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method setController(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 2
    .line 3
    return-void
.end method

.method public setDraggedBubble(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 2
    .param p1    # Lcom/android/launcher3/taskbar/bubbles/BubbleView;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setZ(F)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->o:F

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setZ(F)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->G:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 20
    .line 21
    :cond_1
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_2
    const/4 p1, 0x0

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setIsDragging(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setExpanded(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p0(Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m0()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->E(Z)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->q0()V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public setIsDragging(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->E:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->E:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;->d(Z)V

    .line 11
    .line 12
    .line 13
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->E:Z

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->t:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRelativePivotY(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->v:F

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n0(FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSelectedBubble(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    move v4, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v4, v2

    .line 14
    :goto_0
    invoke-virtual {v1, v4}, Lcom/android/launcher3/taskbar/bubbles/a;->m(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    move v2, v3

    .line 24
    :cond_1
    invoke-direct {p0, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->p0(Z)V

    .line 25
    .line 26
    .line 27
    :cond_2
    if-eqz p1, :cond_4

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->t()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_3
    invoke-virtual {p1, v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->y(Z)V

    .line 40
    .line 41
    .line 42
    :cond_4
    return-void
.end method

.method public setTranslationX(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    neg-float p1, p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setOffsetX(F)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setUpdateSelectedBubbleAfterCollapse(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->D:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-void
.end method

.method public t(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 6
    .param p2    # Lcom/android/launcher3/taskbar/bubbles/BubbleView;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 4
    .line 5
    float-to-int v2, v1

    .line 6
    float-to-int v1, v1

    .line 7
    const/4 v3, 0x3

    .line 8
    invoke-direct {v0, v2, v1, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->q()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v1, v2

    .line 24
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_2

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1, v1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->y(Z)V

    .line 41
    .line 42
    .line 43
    new-instance v0, LV1/b;

    .line 44
    .line 45
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 46
    .line 47
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->j:F

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    invoke-virtual {v4, v5}, LN2/h;->e(Z)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    invoke-direct {v0, v1, v2, v3, v4}, LV1/b;-><init>(FFIZ)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 67
    .line 68
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;

    .line 69
    .line 70
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$c;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 71
    .line 72
    .line 73
    if-eqz p2, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p1, v1, p0, v0}, LV1/b;->e(ILjava/lang/Integer;LV1/b$b;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 96
    .line 97
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 98
    .line 99
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    invoke-virtual {p1, p0, v0}, LV1/b;->d(ILV1/b$b;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    invoke-virtual {p0, p1, v1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public u(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;)V
    .locals 9
    .param p3    # Lcom/android/launcher3/taskbar/bubbles/BubbleView;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 4
    .line 5
    float-to-int v2, v1

    .line 6
    float-to-int v1, v1

    .line 7
    const/4 v3, 0x3

    .line 8
    invoke-direct {v0, v2, v1, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->q()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    :goto_0
    move v6, v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    goto :goto_0

    .line 25
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1, v6, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    if-eqz p4, :cond_1

    .line 38
    .line 39
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void

    .line 43
    :cond_2
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1, v6, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    if-nez p3, :cond_3

    .line 64
    .line 65
    move v4, v3

    .line 66
    goto :goto_2

    .line 67
    :cond_3
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    move v4, v0

    .line 72
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 73
    .line 74
    if-ne v0, p2, :cond_4

    .line 75
    .line 76
    if-nez p3, :cond_4

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    const/4 v0, 0x1

    .line 83
    if-le p3, v0, :cond_4

    .line 84
    .line 85
    const-string p3, "BubbleBarView"

    .line 86
    .line 87
    const-string v0, "Remove the currently selected bubble without selecting a new one."

    .line 88
    .line 89
    invoke-static {p3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    :cond_4
    new-instance p3, LV1/b;

    .line 93
    .line 94
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l:F

    .line 95
    .line 96
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->j:F

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    iget-object v7, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s:LN2/h;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    invoke-virtual {v7, v8}, LN2/h;->e(Z)Z

    .line 109
    .line 110
    .line 111
    move-result v7

    .line 112
    invoke-direct {p3, v0, v1, v2, v7}, LV1/b;-><init>(FFIZ)V

    .line 113
    .line 114
    .line 115
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 116
    .line 117
    new-instance v7, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;

    .line 118
    .line 119
    invoke-direct {v7, p0, p2, p4, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$d;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->z:LV1/b;

    .line 123
    .line 124
    invoke-virtual/range {v2 .. v7}, LV1/b;->c(IIIILV1/b$b;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public v(FF)V
    .locals 11

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->S(FF)Z

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->A:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->A:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 v0, 0x2

    .line 24
    new-array v0, v0, [F

    .line 25
    .line 26
    fill-array-data v0, :array_0

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-wide/16 v1, 0xc8

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->U(F)Z

    .line 39
    .line 40
    .line 41
    move-result v8

    .line 42
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->T(F)Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    iget v6, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->m:F

    .line 47
    .line 48
    iget v9, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k:F

    .line 49
    .line 50
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getScaledIconSize()F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    div-float v7, p1, v1

    .line 55
    .line 56
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/H;

    .line 57
    .line 58
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/H;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;FF)V

    .line 59
    .line 60
    .line 61
    new-instance v3, Lcom/android/launcher3/taskbar/bubbles/I;

    .line 62
    .line 63
    move-object v4, p0

    .line 64
    move v10, p2

    .line 65
    invoke-direct/range {v3 .. v10}, Lcom/android/launcher3/taskbar/bubbles/I;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;ZFFZFF)V

    .line 66
    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    invoke-direct {v4, v0, p0, v1, v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r(Landroid/animation/ValueAnimator;Ljava/lang/Runnable;Ljava/lang/Runnable;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 73
    .line 74
    .line 75
    iput-object v0, v4, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->A:Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    return-void

    .line 78
    nop

    .line 79
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public w(LN2/h;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->y(LN2/h;)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 26
    .line 27
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/G;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/G;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LN2/h;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->B:Landroid/animation/Animator;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public x(LN2/h;LN2/h;)Landroid/animation/Animator;
    .locals 4

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->r0(LN2/h;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->g:Lcom/android/launcher3/taskbar/bubbles/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p2, v1}, LN2/h;->e(Z)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/a;->f(Z)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getLocationAnimAlphaProperty()Landroid/util/FloatProperty;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    const/high16 v2, 0x3f800000    # 1.0f

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    aput v2, v1, v3

    .line 28
    .line 29
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getDistanceFromOtherSide()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-static {p2, p1, v1, v0, p0}, Lcom/android/launcher3/taskbar/a;->c(LN2/h;LN2/h;FLandroid/animation/ObjectAnimator;Landroid/view/View;)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public y(LN2/h;)Landroid/animation/Animator;
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getLocationAnimAlphaProperty()Landroid/util/FloatProperty;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    new-array v1, v1, [F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    aput v2, v1, v3

    .line 11
    .line 12
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/taskbar/a;->d(Landroid/view/View;LN2/h;Landroid/animation/ObjectAnimator;)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$b;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$b;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LN2/h;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method
