.class Lcom/android/launcher3/taskbar/bubbles/u0$e;
.super Lcom/android/launcher3/taskbar/bubbles/u0$g;
.source "BubbleDragController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/u0;->o(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private p:LN2/h;

.field private final q:LN2/f$b;

.field final synthetic r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

.field final synthetic s:Landroid/graphics/PointF;

.field final synthetic t:Lcom/android/launcher3/taskbar/bubbles/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->s:Landroid/graphics/PointF;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/x0;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, LN2/h;->h:LN2/h;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->p:LN2/h;

    .line 14
    .line 15
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/u0$e$a;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/u0$e$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0$e;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->q:LN2/f$b;

    .line 21
    .line 22
    return-void
.end method

.method static bridge synthetic x(Lcom/android/launcher3/taskbar/bubbles/u0$e;LN2/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->p:LN2/h;

    .line 2
    .line 3
    return-void
.end method

.method private y()LN2/h;
    .locals 1

    .line 1
    invoke-static {}, LN2/g;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->g(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/u0$f;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$f;->d(Lcom/android/launcher3/taskbar/bubbles/u0$f;)LN2/h;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->p:LN2/h;

    .line 19
    .line 20
    return-object p0
.end method


# virtual methods
.method protected h()Landroid/graphics/PointF;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->g()Landroid/graphics/PointF;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$e;->y()LN2/h;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->a0(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method protected k()V
    .locals 1

    .line 1
    invoke-static {}, LN2/g;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, LN2/x;->f()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->d(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/z;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, LN2/f;->r()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method l(FF)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->c(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/t;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$e;->y()LN2/h;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/t;->d3(LN2/h;I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setIsDragging(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 22
    .line 23
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->s:Landroid/graphics/PointF;

    .line 24
    .line 25
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 26
    .line 27
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 28
    .line 29
    invoke-virtual {p1, v0, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n0(FF)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->X0()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, LN2/g;->b()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, LN2/x;->f()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 58
    .line 59
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->d(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/z;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const/4 p1, 0x0

    .line 64
    invoke-virtual {p0, p1}, LN2/f;->y(LN2/f$b;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method protected m()V
    .locals 1

    .line 1
    invoke-static {}, LN2/g;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, LN2/x;->f()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->d(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/z;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, LN2/f;->r()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->s:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getRelativePivotX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getRelativePivotY()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 19
    .line 20
    const/high16 v1, 0x3f000000    # 0.5f

    .line 21
    .line 22
    invoke-virtual {v0, v1, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n0(FF)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setIsDragging(Z)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, LN2/g;->b()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    new-instance v0, LN2/t$b;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-direct {v0, v1}, LN2/t$b;-><init>(LN2/h;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 59
    .line 60
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->i(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/s;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, v0}, LN2/s;->f(LN2/t;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v1, v0, p0}, LN2/x;->h(LN2/t;Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->d(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/z;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->q:LN2/f$b;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, LN2/f;->y(LN2/f$b;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->d(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/z;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarLocation()LN2/h;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    invoke-virtual {v1, p0}, LN2/h;->e(Z)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    invoke-virtual {v0, p0}, LN2/f;->s(Z)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method protected o(FFFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setTranslationX(F)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 7
    .line 8
    invoke-virtual {p3, p4}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, LN2/g;->b()Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    float-to-int p1, p1

    .line 24
    float-to-int p2, p2

    .line 25
    invoke-virtual {p0, p1, p2}, LN2/x;->i(II)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->t:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->d(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/z;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p1, p2}, LN2/f;->t(FF)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method protected q(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$e;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->q(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
