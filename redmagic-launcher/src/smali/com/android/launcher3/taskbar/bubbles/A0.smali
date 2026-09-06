.class public Lcom/android/launcher3/taskbar/bubbles/A0;
.super Ljava/lang/Object;
.source "BubbleStashedHandleViewController.java"


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/I1;

.field private final b:Lcom/android/launcher3/taskbar/StashedHandleView;

.field private final c:Lcom/android/launcher3/util/B1;

.field private d:F

.field private e:F

.field private f:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private g:LX1/b;

.field private h:LP2/d;

.field private i:I

.field private j:I

.field private k:I

.field private final l:Landroid/graphics/Rect;

.field private m:F

.field private n:F

.field private o:Ljava/lang/Boolean;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private p:Z

.field private q:Z

.field private r:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/StashedHandleView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->l:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->o:Ljava/lang/Boolean;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 17
    .line 18
    new-instance p1, Lcom/android/launcher3/util/B1;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-direct {p1, p2, v0}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->c:Lcom/android/launcher3/util/B1;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private A(LN2/h;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->i:I

    .line 8
    .line 9
    div-int/lit8 v1, v1, 0x2

    .line 10
    .line 11
    sub-int/2addr v0, v1

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/View;->isLayoutRtl()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1, v1}, LN2/h;->e(Z)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->f:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->t0()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->j:I

    .line 31
    .line 32
    div-int/lit8 v1, v1, 0x2

    .line 33
    .line 34
    add-int/2addr p1, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->f:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->t0()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    sub-int/2addr p1, v1

    .line 49
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->j:I

    .line 50
    .line 51
    div-int/lit8 v1, v1, 0x2

    .line 52
    .line 53
    sub-int/2addr p1, v1

    .line 54
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->l:Landroid/graphics/Rect;

    .line 55
    .line 56
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->j:I

    .line 57
    .line 58
    div-int/lit8 v3, v2, 0x2

    .line 59
    .line 60
    sub-int v3, p1, v3

    .line 61
    .line 62
    iget v4, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->k:I

    .line 63
    .line 64
    div-int/lit8 v5, v4, 0x2

    .line 65
    .line 66
    sub-int v5, v0, v5

    .line 67
    .line 68
    div-int/lit8 v2, v2, 0x2

    .line 69
    .line 70
    add-int/2addr v2, p1

    .line 71
    div-int/lit8 v4, v4, 0x2

    .line 72
    .line 73
    add-int/2addr v4, v0

    .line 74
    invoke-virtual {v1, v3, v5, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 78
    .line 79
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->l:Landroid/graphics/Rect;

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Lcom/android/launcher3/taskbar/StashedHandleView;->d(Landroid/graphics/Rect;)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 85
    .line 86
    int-to-float p1, p1

    .line 87
    invoke-virtual {v1, p1}, Landroid/view/View;->setPivotX(F)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 91
    .line 92
    int-to-float p1, v0

    .line 93
    invoke-virtual {p0, p1}, Landroid/view/View;->setPivotY(F)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private B()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->g:LX1/b;

    .line 10
    .line 11
    invoke-interface {v0}, LX1/b;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->h:LP2/d;

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {v1, v0}, LP2/d;->p(Z)V

    .line 25
    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->l:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/StashedHandleView;->d(Landroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->h:LP2/d;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/StashedHandleView;->getSampledRegion()Landroid/graphics/Rect;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, LP2/d;->q(Landroid/graphics/Rect;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->h:LP2/d;

    .line 49
    .line 50
    invoke-virtual {p0}, LP2/d;->r()V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method private C()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->d:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->e:F

    .line 6
    .line 7
    add-float/2addr v1, p0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private D()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->p:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->r:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->q:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 21
    .line 22
    const/4 v1, 0x4

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->B()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/A0;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/taskbar/bubbles/A0;->q(Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/taskbar/bubbles/A0;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->l:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/taskbar/bubbles/A0;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->m:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/taskbar/bubbles/A0;)Lcom/android/launcher3/taskbar/StashedHandleView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/bubbles/A0;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->n:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/taskbar/bubbles/A0;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->m:F

    .line 2
    .line 3
    return-void
.end method

.method private i()Landroid/graphics/Rect;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->f:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->W()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 23
    .line 24
    sub-int/2addr v2, v1

    .line 25
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->g:LX1/b;

    .line 28
    .line 29
    invoke-interface {p0}, LX1/b;->b()F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    float-to-int p0, p0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method private synthetic q(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->f:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->A(LN2/h;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public g(Z)Landroid/animation/Animator;
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->i()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const/high16 v2, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr v1, v2

    .line 13
    new-instance v2, Lcom/android/launcher3/anim/d0;

    .line 14
    .line 15
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->m:F

    .line 16
    .line 17
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->l:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-direct {v2, v1, v3, v0, v4}, Lcom/android/launcher3/anim/d0;-><init>(FFLandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    xor-int/2addr p1, v0

    .line 24
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->o:Ljava/lang/Boolean;

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eq v1, p1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->o:Ljava/lang/Boolean;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    const/high16 v0, 0x3f800000    # 1.0f

    .line 45
    .line 46
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->n:F

    .line 47
    .line 48
    sub-float/2addr v0, v1

    .line 49
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->n:F

    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 52
    .line 53
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->n:F

    .line 54
    .line 55
    invoke-virtual {v2, v0, p1, v1}, Lcom/android/launcher3/anim/c0;->c(Landroid/view/View;ZF)Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/A0$c;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/A0$c;-><init>(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 65
    .line 66
    .line 67
    return-object p1
.end method

.method public h(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->l:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j()LM2/i;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LM2/i<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    invoke-static {p0}, LM2/i;->u(Ljava/lang/Object;)LM2/i;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k()Lcom/android/launcher3/util/v1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->c:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public n()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public o(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->f:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->g:LX1/b;

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const v1, 0x7f07017a

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->k:I

    .line 29
    .line 30
    const v1, 0x7f07017c

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput v1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->j:I

    .line 38
    .line 39
    const v1, 0x7f070178

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget v2, p1, Lcom/android/launcher3/h0;->g2:I

    .line 47
    .line 48
    iget p1, p1, Lcom/android/launcher3/h0;->t3:I

    .line 49
    .line 50
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 55
    .line 56
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    add-int/2addr v1, p1

    .line 61
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->c:Lcom/android/launcher3/util/B1;

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 72
    .line 73
    .line 74
    const p1, 0x7f07017d

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->i:I

    .line 82
    .line 83
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 84
    .line 85
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/A0$a;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/A0$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 91
    .line 92
    .line 93
    new-instance p1, LP2/d;

    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 96
    .line 97
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/A0$b;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/A0$b;-><init>(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 100
    .line 101
    .line 102
    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 103
    .line 104
    sget-object v3, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 105
    .line 106
    invoke-direct {p1, v0, v1, v2, v3}, LP2/d;-><init>(Landroid/view/View;LP2/d$d;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V

    .line 107
    .line 108
    .line 109
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->h:LP2/d;

    .line 110
    .line 111
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 112
    .line 113
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/z0;

    .line 114
    .line 115
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/z0;-><init>(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public p(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 18
    .line 19
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->i:I

    .line 20
    .line 21
    sub-int/2addr v0, v2

    .line 22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    int-to-float v0, v0

    .line 31
    cmpl-float p1, p1, v0

    .line 32
    .line 33
    if-ltz p1, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->l:Landroid/graphics/Rect;

    .line 36
    .line 37
    iget p1, p0, Landroid/graphics/Rect;->left:I

    .line 38
    .line 39
    int-to-float p1, p1

    .line 40
    cmpl-float p1, v2, p1

    .line 41
    .line 42
    if-ltz p1, :cond_1

    .line 43
    .line 44
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    int-to-float p0, p0

    .line 47
    cmpg-float p0, v2, p0

    .line 48
    .line 49
    if-gtz p0, :cond_1

    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_1
    return v1
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->h:LP2/d;

    .line 2
    .line 3
    invoke-virtual {v0}, LP2/d;->s()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->h:LP2/d;

    .line 8
    .line 9
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t(LN2/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->A(LN2/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->q:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->q:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->D()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public v(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->p:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->p:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->D()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->r:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->D()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->b:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->e:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->C()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/A0;->d:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->C()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
