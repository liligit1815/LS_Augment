.class public Lcom/android/launcher3/taskbar/R0;
.super Ljava/lang/Object;
.source "RecentsHitboxExtender.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;


# instance fields
.field private g:Landroid/view/View;

.field private h:Landroid/view/View;

.field private i:Lcom/android/launcher3/h0;

.field private j:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "[F>;"
        }
    .end annotation
.end field

.field private k:Landroid/view/TouchDelegate;

.field private l:Z

.field private m:F

.field private final n:Landroid/graphics/Rect;

.field private o:Z

.field private p:Landroid/os/Handler;

.field private final q:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
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
    iput-object v0, p0, Lcom/android/launcher3/taskbar/R0;->n:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/taskbar/Q0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/Q0;-><init>(Lcom/android/launcher3/taskbar/R0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/taskbar/R0;->q:Ljava/lang/Runnable;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/R0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/R0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/R0;->l:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R0;->g:Landroid/view/View;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v1, v2}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R0;->n:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    .line 13
    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/R0;->o:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/R0;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public c(Landroid/view/View;Landroid/view/View;Lcom/android/launcher3/h0;Ljava/util/function/Supplier;Landroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Lcom/android/launcher3/h0;",
            "Ljava/util/function/Supplier<",
            "[F>;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R0;->g:Landroid/view/View;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/R0;->h:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/taskbar/R0;->i:Lcom/android/launcher3/h0;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/taskbar/R0;->j:Ljava/util/function/Supplier;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/taskbar/R0;->p:Landroid/os/Handler;

    .line 10
    .line 11
    return-void
.end method

.method public d(F)V
    .locals 5

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    cmpl-float v2, p1, v1

    .line 9
    .line 10
    if-nez v2, :cond_2

    .line 11
    .line 12
    :cond_0
    iput p1, p0, Lcom/android/launcher3/taskbar/R0;->m:F

    .line 13
    .line 14
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/R0;->l:Z

    .line 15
    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/taskbar/R0;->p:Landroid/os/Handler;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R0;->q:Ljava/lang/Runnable;

    .line 23
    .line 24
    const-wide/16 v0, 0x1f4

    .line 25
    .line 26
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R0;->p:Landroid/os/Handler;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/taskbar/R0;->q:Ljava/lang/Runnable;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/R0;->f()V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/R0;->l:Z

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    cmpl-float p1, p1, v1

    .line 46
    .line 47
    if-lez p1, :cond_4

    .line 48
    .line 49
    iget p1, p0, Lcom/android/launcher3/taskbar/R0;->m:F

    .line 50
    .line 51
    cmpl-float p1, p1, v1

    .line 52
    .line 53
    if-nez p1, :cond_4

    .line 54
    .line 55
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/R0;->o:Z

    .line 56
    .line 57
    if-eqz p1, :cond_4

    .line 58
    .line 59
    const/4 p1, 0x1

    .line 60
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/R0;->l:Z

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R0;->j:Ljava/util/function/Supplier;

    .line 63
    .line 64
    invoke-interface {v0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, [F

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    aget v1, v0, v1

    .line 72
    .line 73
    float-to-int v1, v1

    .line 74
    aget p1, v0, p1

    .line 75
    .line 76
    float-to-int p1, p1

    .line 77
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R0;->n:Landroid/graphics/Rect;

    .line 78
    .line 79
    iget-object v2, p0, Lcom/android/launcher3/taskbar/R0;->g:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    add-int/2addr v2, v1

    .line 86
    iget-object v3, p0, Lcom/android/launcher3/taskbar/R0;->g:Landroid/view/View;

    .line 87
    .line 88
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    add-int/2addr v3, p1

    .line 93
    iget-object v4, p0, Lcom/android/launcher3/taskbar/R0;->i:Lcom/android/launcher3/h0;

    .line 94
    .line 95
    invoke-virtual {v4}, Lcom/android/launcher3/h0;->J0()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    add-int/2addr v3, v4

    .line 100
    invoke-virtual {v0, v1, p1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 101
    .line 102
    .line 103
    new-instance p1, Landroid/view/TouchDelegate;

    .line 104
    .line 105
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R0;->n:Landroid/graphics/Rect;

    .line 106
    .line 107
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R0;->g:Landroid/view/View;

    .line 108
    .line 109
    invoke-direct {p1, v0, v1}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 110
    .line 111
    .line 112
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R0;->k:Landroid/view/TouchDelegate;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R0;->h:Landroid/view/View;

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 117
    .line 118
    .line 119
    :cond_4
    :goto_0
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/R0;->o:Z

    .line 3
    .line 4
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R0;->n:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    float-to-int v0, v0

    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    float-to-int p1, p1

    .line 13
    invoke-virtual {p0, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R0;->k:Landroid/view/TouchDelegate;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/TouchDelegate;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
