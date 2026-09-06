.class public Lcom/android/launcher3/taskbar/bubbles/s0;
.super Ljava/lang/Object;
.source "BubbleDragAnimator.java"


# instance fields
.field private final a:LM2/i$f;

.field private final b:LM2/i$f;

.field private final c:Landroid/view/View;

.field private final d:LM2/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LM2/i<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private e:LN2/q;

.field private f:LM2/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LM2/i<",
            "LN2/o;",
            ">;"
        }
    .end annotation
.end field

.field private final g:F

.field private final h:F

.field private final i:F


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LM2/i$f;

    .line 5
    .line 6
    const/high16 v1, 0x43480000    # 200.0f

    .line 7
    .line 8
    const/high16 v2, 0x3f400000    # 0.75f

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, LM2/i$f;-><init>(FF)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->a:LM2/i$f;

    .line 14
    .line 15
    new-instance v1, LM2/i$f;

    .line 16
    .line 17
    const/high16 v3, 0x43c80000    # 400.0f

    .line 18
    .line 19
    invoke-direct {v1, v3, v2}, LM2/i$f;-><init>(FF)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->b:LM2/i$f;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->c:Landroid/view/View;

    .line 25
    .line 26
    invoke-static {p1}, LM2/i;->u(Ljava/lang/Object;)LM2/i;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, LM2/i;->z(LM2/i$f;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const v1, 0x7f07015b

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const v2, 0x7f07015a

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    int-to-float v1, v1

    .line 54
    int-to-float v0, v0

    .line 55
    div-float/2addr v1, v0

    .line 56
    iput v1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->i:F

    .line 57
    .line 58
    instance-of p1, p1, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 59
    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    const p1, 0x3f8ccccd    # 1.1f

    .line 63
    .line 64
    .line 65
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->g:F

    .line 66
    .line 67
    iput v1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->h:F

    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    const p1, 0x3f99999a    # 1.2f

    .line 71
    .line 72
    .line 73
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->g:F

    .line 74
    .line 75
    const p1, 0x3f666666    # 0.9f

    .line 76
    .line 77
    .line 78
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->h:F

    .line 79
    .line 80
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/s0;Landroid/graphics/PointF;Ljava/lang/Runnable;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/taskbar/bubbles/s0;->i(Landroid/graphics/PointF;Ljava/lang/Runnable;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/bubbles/s0;Landroid/graphics/PointF;Ljava/lang/Runnable;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/taskbar/bubbles/s0;->h(Landroid/graphics/PointF;Ljava/lang/Runnable;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h(Landroid/graphics/PointF;Ljava/lang/Runnable;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    if-nez p6, :cond_0

    .line 2
    .line 3
    if-eqz p9, :cond_1

    .line 4
    .line 5
    :cond_0
    const/4 p3, 0x1

    .line 6
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/taskbar/bubbles/s0;->j(Landroid/graphics/PointF;Z)V

    .line 7
    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method private synthetic i(Landroid/graphics/PointF;Ljava/lang/Runnable;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    if-nez p6, :cond_0

    .line 2
    .line 3
    if-eqz p9, :cond_1

    .line 4
    .line 5
    :cond_0
    const/4 p3, 0x0

    .line 6
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/taskbar/bubbles/s0;->j(Landroid/graphics/PointF;Z)V

    .line 7
    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method private j(Landroid/graphics/PointF;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->c:Landroid/view/View;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->c:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 11
    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->c:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p2, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->c:Landroid/view/View;

    .line 21
    .line 22
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->c:Landroid/view/View;

    .line 28
    .line 29
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 30
    .line 31
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->e:LN2/q;

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, LN2/q;->getCircle()LN2/o;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->e:LN2/q;

    .line 46
    .line 47
    invoke-virtual {p0}, LN2/q;->getCircle()LN2/o;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method


# virtual methods
.method public c(Landroid/graphics/PointF;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->e:LN2/q;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v1

    .line 13
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->c:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-float/2addr v2, v0

    .line 20
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 21
    .line 22
    sget-object v3, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 23
    .line 24
    invoke-virtual {v0, v3, v2}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v2, Landroidx/dynamicanimation/animation/e;->q:Landroidx/dynamicanimation/animation/e$s;

    .line 29
    .line 30
    invoke-virtual {v0, v2, v1}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v2, Landroidx/dynamicanimation/animation/e;->r:Landroidx/dynamicanimation/animation/e$s;

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v2, Landroidx/dynamicanimation/animation/e;->y:Landroidx/dynamicanimation/animation/e$s;

    .line 41
    .line 42
    invoke-virtual {v0, v2, v1}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/r0;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/r0;-><init>(Lcom/android/launcher3/taskbar/bubbles/s0;Landroid/graphics/PointF;Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, LM2/i;->h(LM2/i$c;)LM2/i;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, LM2/i;->F()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public d()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 2
    .line 3
    invoke-virtual {v0}, LM2/i;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 7
    .line 8
    sget-object v1, Landroidx/dynamicanimation/animation/e;->q:Landroidx/dynamicanimation/animation/e$s;

    .line 9
    .line 10
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->h:F

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v2, Landroidx/dynamicanimation/animation/e;->r:Landroidx/dynamicanimation/animation/e$s;

    .line 17
    .line 18
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->h:F

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v3, Landroidx/dynamicanimation/animation/e;->y:Landroidx/dynamicanimation/animation/e$s;

    .line 25
    .line 26
    iget v4, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->i:F

    .line 27
    .line 28
    invoke-virtual {v0, v3, v4}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, LM2/i;->F()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->f:LM2/i;

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, LM2/i;->k()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->f:LM2/i;

    .line 43
    .line 44
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->i:F

    .line 45
    .line 46
    invoke-virtual {v0, v1, v3}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->i:F

    .line 51
    .line 52
    invoke-virtual {v0, v2, p0}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, LM2/i;->F()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public e()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 2
    .line 3
    invoke-virtual {v0}, LM2/i;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 7
    .line 8
    sget-object v1, Landroidx/dynamicanimation/animation/e;->q:Landroidx/dynamicanimation/animation/e$s;

    .line 9
    .line 10
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->g:F

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v2, Landroidx/dynamicanimation/animation/e;->r:Landroidx/dynamicanimation/animation/e$s;

    .line 17
    .line 18
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->g:F

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v3, Landroidx/dynamicanimation/animation/e;->y:Landroidx/dynamicanimation/animation/e$s;

    .line 25
    .line 26
    const/high16 v4, 0x3f800000    # 1.0f

    .line 27
    .line 28
    invoke-virtual {v0, v3, v4}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, LM2/i;->F()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->f:LM2/i;

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, LM2/i;->k()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->f:LM2/i;

    .line 43
    .line 44
    invoke-virtual {p0, v1, v4}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, v2, v4}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, LM2/i;->F()V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 2
    .line 3
    invoke-virtual {v0}, LM2/i;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 7
    .line 8
    sget-object v1, Landroidx/dynamicanimation/animation/e;->q:Landroidx/dynamicanimation/animation/e$s;

    .line 9
    .line 10
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->g:F

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Landroidx/dynamicanimation/animation/e;->r:Landroidx/dynamicanimation/animation/e$s;

    .line 17
    .line 18
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->g:F

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, LM2/i;->F()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public g(Landroid/graphics/PointF;Landroid/graphics/PointF;Ljava/lang/Runnable;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 2
    .line 3
    invoke-virtual {v0}, LM2/i;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->d:LM2/i;

    .line 7
    .line 8
    sget-object v1, Landroidx/dynamicanimation/animation/e;->q:Landroidx/dynamicanimation/animation/e$s;

    .line 9
    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Landroidx/dynamicanimation/animation/e;->r:Landroidx/dynamicanimation/animation/e$s;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/android/launcher3/taskbar/bubbles/u0;->k:Landroidx/dynamicanimation/animation/g;

    .line 23
    .line 24
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 25
    .line 26
    iget v3, p2, Landroid/graphics/PointF;->x:F

    .line 27
    .line 28
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->b:LM2/i$f;

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3, v4}, LM2/i;->C(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;)LM2/i;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 35
    .line 36
    iget v2, p1, Landroid/graphics/PointF;->y:F

    .line 37
    .line 38
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->b:LM2/i$f;

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2, p2, v3}, LM2/i;->C(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;)LM2/i;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/q0;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1, p3}, Lcom/android/launcher3/taskbar/bubbles/q0;-><init>(Lcom/android/launcher3/taskbar/bubbles/s0;Landroid/graphics/PointF;Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0}, LM2/i;->h(LM2/i$c;)LM2/i;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, LM2/i;->F()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public k(LN2/q;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->e:LN2/q;

    .line 2
    .line 3
    invoke-virtual {p1}, LN2/q;->getCircle()LN2/o;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, LM2/i;->u(Ljava/lang/Object;)LM2/i;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->f:LM2/i;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/s0;->a:LM2/i$f;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, LM2/i;->z(LM2/i$f;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
