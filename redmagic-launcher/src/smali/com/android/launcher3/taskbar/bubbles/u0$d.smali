.class Lcom/android/launcher3/taskbar/bubbles/u0$d;
.super Lcom/android/launcher3/taskbar/bubbles/u0$g;
.source "BubbleDragController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/u0;->p(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private p:LN2/h;

.field private final q:LN2/f$b;

.field final synthetic r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

.field final synthetic s:Lcom/android/launcher3/taskbar/bubbles/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/x0;)V

    .line 7
    .line 8
    .line 9
    sget-object p1, LN2/h;->h:LN2/h;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->p:LN2/h;

    .line 12
    .line 13
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/u0$d$a;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/u0$d$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0$d;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->q:LN2/f$b;

    .line 19
    .line 20
    return-void
.end method

.method static bridge synthetic x(Lcom/android/launcher3/taskbar/bubbles/u0$d;LN2/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->p:LN2/h;

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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->p:LN2/h;

    .line 19
    .line 20
    return-object p0
.end method


# virtual methods
.method protected h()Landroid/graphics/PointF;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

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
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$d;->y()LN2/h;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r0(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method protected k()V
    .locals 2

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, LN2/x;->f()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->h(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, LN2/f;->r()V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->Z0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->a1()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method l(FF)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->c(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$d;->y()LN2/h;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x2

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/bubbles/t;->d3(LN2/h;I)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, LN2/g;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, LN2/x;->f()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->g(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/u0$f;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/u0$f;->e()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 49
    .line 50
    new-instance v2, Landroid/graphics/Point;

    .line 51
    .line 52
    float-to-int p1, p1

    .line 53
    float-to-int p2, p2

    .line 54
    invoke-direct {v2, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/bubbles/g0;->U0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Landroid/graphics/Point;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 62
    .line 63
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->h(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const/4 p2, 0x0

    .line 68
    invoke-virtual {p1, p2}, LN2/f;->y(LN2/f$b;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->a1()V

    .line 78
    .line 79
    .line 80
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
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, LN2/x;->f()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->g(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/u0$f;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/u0$f;->e()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$d;->y()LN2/h;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->b1(LN2/h;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->h(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, LN2/f;->r()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$d;->y()LN2/h;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->b1(LN2/h;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->c1(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, LN2/g;->b()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    new-instance v0, LN2/t$a;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v1}, LN2/t$a;-><init>(LN2/h;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/android/launcher3/taskbar/bubbles/u0;->j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->i(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/s;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, v0}, LN2/s;->f(LN2/t;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, v0, p0}, LN2/x;->h(LN2/t;Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->h(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->q:LN2/f$b;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, LN2/f;->y(LN2/f$b;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->h(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 71
    .line 72
    invoke-static {v1}, Lcom/android/launcher3/taskbar/bubbles/u0;->e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isLayoutRtl()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    invoke-virtual {v1, p0}, LN2/h;->e(Z)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-virtual {v0, p0}, LN2/f;->s(Z)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method protected o(FFFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setDragTranslationX(F)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->r:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 7
    .line 8
    invoke-virtual {p3, p4}, Landroid/view/ViewGroup;->setTranslationY(F)V

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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$d;->s:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->h(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/y0;

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
