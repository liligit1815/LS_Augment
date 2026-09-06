.class abstract Lcom/android/launcher3/taskbar/bubbles/u0$g;
.super Ljava/lang/Object;
.source "BubbleDragController.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/bubbles/u0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/u0$g$a;
    }
.end annotation


# instance fields
.field private final g:Landroid/graphics/PointF;

.field private final h:Landroid/graphics/PointF;

.field private final i:Landroid/view/VelocityTracker;

.field private final j:J

.field private k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

.field private l:I

.field private m:Lcom/android/launcher3/taskbar/bubbles/s0;

.field private n:Ljava/lang/Runnable;

.field final synthetic o:Lcom/android/launcher3/taskbar/bubbles/u0;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/taskbar/bubbles/u0;)V
    .locals 2

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->g:Landroid/graphics/PointF;

    .line 4
    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->h:Landroid/graphics/PointF;

    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->i:Landroid/view/VelocityTracker;

    .line 6
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result p1

    int-to-long v0, p1

    iput-wide v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->j:J

    .line 7
    sget-object p1, Lcom/android/launcher3/taskbar/bubbles/u0$g$a;->g:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    const/4 p1, -0x1

    .line 8
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->l:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/x0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/u0$g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->i(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/bubbles/u0$g;Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->j(Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->d(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->i:Landroid/view/VelocityTracker;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    .line 7
    .line 8
    .line 9
    sget-object p1, Lcom/android/launcher3/taskbar/bubbles/u0$g$a;->g:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 12
    .line 13
    return-void
.end method

.method private d(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->n:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->n:Ljava/lang/Runnable;

    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method private e(Landroid/view/View;Landroid/view/MotionEvent;FFFF)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->f(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/o0;->e(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->h:Landroid/graphics/PointF;

    .line 15
    .line 16
    iget p2, p1, Landroid/graphics/PointF;->x:F

    .line 17
    .line 18
    add-float/2addr p2, p3

    .line 19
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 20
    .line 21
    add-float/2addr p1, p4

    .line 22
    invoke-virtual {p0, p5, p6, p2, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o(FFFF)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private f()Landroid/graphics/PointF;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->i:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    const/16 v1, 0x3e8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/graphics/PointF;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->i:Landroid/view/VelocityTracker;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->i:Landroid/view/VelocityTracker;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-direct {v0, v1, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/u0$g$a;->i:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->u(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic j(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->b(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/I1;->l2(Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->c(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->l(FF)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private t(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->d(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/w0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/w0;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0$g;Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->n:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->n:Ljava/lang/Runnable;

    .line 16
    .line 17
    iget-wide v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->j:J

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private u(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/u0;->n(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->b(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/I1;->l2(Z)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/s0;-><init>(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->m:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/s0;->f()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->f(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->m:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 36
    .line 37
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/taskbar/bubbles/o0;->j(Landroid/view/View;Lcom/android/launcher3/taskbar/bubbles/s0;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->f(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/o0;->m()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private v(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/u0;->n(Z)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/v0;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/v0;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0$g;Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->f(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/o0;->e(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->m:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 28
    .line 29
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->h:Landroid/graphics/PointF;

    .line 30
    .line 31
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/s0;->c(Landroid/graphics/PointF;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->m()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, LN2/g;->b()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->g(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/u0$f;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u0$f;->e()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->m:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->h()Landroid/graphics/PointF;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->f()Landroid/graphics/PointF;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p1, p2, v1, v0}, Lcom/android/launcher3/taskbar/bubbles/s0;->g(Landroid/graphics/PointF;Landroid/graphics/PointF;Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->m:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->h()Landroid/graphics/PointF;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->f()Landroid/graphics/PointF;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {p1, p2, v1, v0}, Lcom/android/launcher3/taskbar/bubbles/s0;->g(Landroid/graphics/PointF;Landroid/graphics/PointF;Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->o:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 88
    .line 89
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/u0;->f(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/o0;->f()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private w(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sub-float/2addr v1, v2

    .line 19
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->i:Landroid/view/VelocityTracker;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 25
    .line 26
    .line 27
    neg-float p0, v0

    .line 28
    neg-float v0, v1

    .line 29
    invoke-virtual {p1, p0, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method protected g()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->h:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method protected abstract h()Landroid/graphics/PointF;
.end method

.method protected abstract k()V
.end method

.method abstract l(FF)V
.end method

.method protected abstract m()V
.end method

.method abstract n()V
.end method

.method protected abstract o(FFFF)V
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->w(Landroid/view/MotionEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq v0, v1, :cond_2

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-eq v0, v2, :cond_1

    .line 15
    .line 16
    const/4 v2, 0x3

    .line 17
    if-eq v0, v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->p(Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->r(Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->s(Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    return v1

    .line 32
    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->q(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method protected p(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/taskbar/bubbles/u0$g$a;->i:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->v(Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->c(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected q(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/u0$g$a;->h:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->l:I

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->g:Landroid/graphics/PointF;

    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-virtual {v0, v1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->h:Landroid/graphics/PointF;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p2, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->t(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0
.end method

.method protected r(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 7

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    .line 2
    .line 3
    .line 4
    move-result v5

    .line 5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 6
    .line 7
    .line 8
    move-result v6

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->g:Landroid/graphics/PointF;

    .line 10
    .line 11
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 12
    .line 13
    sub-float v3, v5, v1

    .line 14
    .line 15
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 16
    .line 17
    sub-float v4, v6, v0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eq v0, v1, :cond_1

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    if-eq v0, v1, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    move-object v0, p0

    .line 33
    move-object v1, p1

    .line 34
    move-object v2, p2

    .line 35
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->e(Landroid/view/View;Landroid/view/MotionEvent;FFFF)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    move-object v0, p0

    .line 40
    move-object v1, p1

    .line 41
    float-to-double p0, v3

    .line 42
    float-to-double v2, v4

    .line 43
    invoke-static {p0, p1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    .line 44
    .line 45
    .line 46
    move-result-wide p0

    .line 47
    iget p2, v0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->l:I

    .line 48
    .line 49
    int-to-double v2, p2

    .line 50
    cmpl-double p0, p0, v2

    .line 51
    .line 52
    if-lez p0, :cond_2

    .line 53
    .line 54
    sget-object p0, Lcom/android/launcher3/taskbar/bubbles/u0$g$a;->j:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 55
    .line 56
    iput-object p0, v0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 57
    .line 58
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->d(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method protected s(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$g;->k:Lcom/android/launcher3/taskbar/bubbles/u0$g$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->c(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->v(Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$g;->c(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
