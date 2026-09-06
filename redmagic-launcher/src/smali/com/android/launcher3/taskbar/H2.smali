.class public Lcom/android/launcher3/taskbar/H2;
.super Ljava/lang/Object;
.source "TaskbarForceVisibleImmersiveController.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:Landroid/os/Handler;

.field private final i:Ljava/lang/Runnable;

.field private final j:Ljava/lang/Runnable;

.field private final k:Lcom/android/launcher3/anim/d;

.field private final l:Landroid/view/View$AccessibilityDelegate;

.field private m:Lcom/android/launcher3/taskbar/R1;

.field private n:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/taskbar/H2;->h:Landroid/os/Handler;

    .line 14
    .line 15
    new-instance v0, Lcom/android/launcher3/taskbar/E2;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/E2;-><init>(Lcom/android/launcher3/taskbar/H2;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/launcher3/taskbar/H2;->i:Ljava/lang/Runnable;

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/taskbar/F2;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/F2;-><init>(Lcom/android/launcher3/taskbar/H2;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/taskbar/H2;->j:Ljava/lang/Runnable;

    .line 28
    .line 29
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 30
    .line 31
    new-instance v1, Lcom/android/launcher3/taskbar/G2;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/G2;-><init>(Lcom/android/launcher3/taskbar/H2;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/android/launcher3/taskbar/H2;->k:Lcom/android/launcher3/anim/d;

    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/taskbar/H2$a;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/H2$a;-><init>(Lcom/android/launcher3/taskbar/H2;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/launcher3/taskbar/H2;->l:Landroid/view/View$AccessibilityDelegate;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/android/launcher3/taskbar/H2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/H2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/H2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/H2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/taskbar/H2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/H2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->k:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const v0, 0x3e19999a    # 0.15f

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-wide/16 v0, 0x1f4

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private h()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/H2;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->Y0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

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

.method private j()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/H2;->h:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/H2;->i:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/H2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    const/16 v1, 0x1194

    .line 11
    .line 12
    const/4 v2, 0x5

    .line 13
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->getRecommendedTimeoutMillis(Landroid/content/Context;II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/H2;->h:Landroid/os/Handler;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->i:Ljava/lang/Runnable;

    .line 20
    .line 21
    int-to-long v2, v0

    .line 22
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/H2;->h:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/H2;->i:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/H2;->h:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/taskbar/H2;->j:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/H2;->h:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->j:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->k:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-wide/16 v0, 0xfa

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private m()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/M0;->a0()Lcom/android/launcher3/util/B1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Lcom/android/launcher3/taskbar/H2;->k:Lcom/android/launcher3/anim/d;

    .line 22
    .line 23
    iget v3, v3, Lcom/android/launcher3/anim/d;->d:F

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/M0;->b0()Lcom/android/launcher3/util/B1;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->k:Lcom/android/launcher3/anim/d;

    .line 43
    .line 44
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public g(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->k()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/M0;->Q0(Landroid/view/View$AccessibilityDelegate;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/M0;->N0(Landroid/view/View$AccessibilityDelegate;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public n(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/H2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-wide/32 v0, 0x20000

    .line 11
    .line 12
    .line 13
    and-long/2addr p1, v0

    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    cmp-long p1, p1, v0

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/H2;->n:Z

    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/taskbar/H2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->Y0()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/H2;->n:Z

    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->j()V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->k()V

    .line 42
    .line 43
    .line 44
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 47
    .line 48
    iget-object p2, p0, Lcom/android/launcher3/taskbar/H2;->l:Landroid/view/View$AccessibilityDelegate;

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/M0;->Q0(Landroid/view/View$AccessibilityDelegate;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->l:Landroid/view/View$AccessibilityDelegate;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/M0;->N0(Landroid/view/View$AccessibilityDelegate;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 66
    .line 67
    const/4 p2, 0x0

    .line 68
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/M0;->Q0(Landroid/view/View$AccessibilityDelegate;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/android/launcher3/taskbar/H2;->m:Lcom/android/launcher3/taskbar/R1;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 74
    .line 75
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/M0;->N0(Landroid/view/View$AccessibilityDelegate;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/H2;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->j()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/H2;->k()V

    .line 19
    .line 20
    .line 21
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method
