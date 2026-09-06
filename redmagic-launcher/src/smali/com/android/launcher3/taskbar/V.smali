.class public Lcom/android/launcher3/taskbar/V;
.super Lcom/android/launcher3/taskbar/o4;
.source "LauncherTaskbarUIController.java"


# instance fields
.field private final j:Lcom/android/launcher3/anim/d;

.field private final k:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Lcom/android/launcher3/anim/d;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Lcom/android/launcher3/anim/d;

.field private final m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final n:Lcom/android/quickstep/HomeVisibilityState;

.field private final o:Lcom/android/launcher3/X3$b;

.field private final p:Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;

.field private final q:Lcom/android/launcher3/taskbar/X2;

.field private r:Lcom/android/quickstep/views/RecentsViewContainer;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/o4;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/taskbar/O;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/O;-><init>(Lcom/android/launcher3/taskbar/V;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/V;->j:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/util/v1;

    .line 17
    .line 18
    sget-object v2, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 19
    .line 20
    new-instance v3, Lcom/android/launcher3/taskbar/P;

    .line 21
    .line 22
    invoke-direct {v3}, Lcom/android/launcher3/taskbar/P;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v4, 0x5

    .line 26
    invoke-direct {v1, v0, v2, v4, v3}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/android/launcher3/taskbar/V;->k:Lcom/android/launcher3/util/v1;

    .line 30
    .line 31
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 32
    .line 33
    new-instance v1, Lcom/android/launcher3/taskbar/Q;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/Q;-><init>(Lcom/android/launcher3/taskbar/V;)V

    .line 36
    .line 37
    .line 38
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/android/launcher3/taskbar/V;->l:Lcom/android/launcher3/anim/d;

    .line 42
    .line 43
    new-instance v0, Lcom/android/launcher3/taskbar/S;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/S;-><init>(Lcom/android/launcher3/taskbar/V;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/android/launcher3/taskbar/V;->o:Lcom/android/launcher3/X3$b;

    .line 49
    .line 50
    new-instance v0, Lcom/android/launcher3/taskbar/T;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/T;-><init>(Lcom/android/launcher3/taskbar/V;)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/launcher3/taskbar/V;->p:Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;

    .line 56
    .line 57
    new-instance v0, Lcom/android/launcher3/taskbar/X2;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/X2;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 63
    .line 64
    iput-object p1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 65
    .line 66
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/android/quickstep/SystemUiProxy;->getHomeVisibilityState()Lcom/android/quickstep/HomeVisibilityState;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/android/launcher3/taskbar/V;->n:Lcom/android/quickstep/HomeVisibilityState;

    .line 79
    .line 80
    return-void
.end method

.method public static synthetic U(Lcom/android/launcher3/taskbar/V;Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/V;->h0(Lcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Lcom/android/launcher3/taskbar/V;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/V;->g0(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Lcom/android/launcher3/taskbar/V;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/V;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(Lcom/android/launcher3/taskbar/V;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/V;->l0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y(Lcom/android/launcher3/taskbar/V;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/V;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b0(Z)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->z5()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    or-int/2addr v0, v1

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->d1()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez p1, :cond_3

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    const/16 p0, 0x1a1

    .line 44
    .line 45
    return p0

    .line 46
    :cond_2
    const/16 p0, 0x258

    .line 47
    .line 48
    return p0

    .line 49
    :cond_3
    :goto_0
    invoke-static {v0, v1}, Lcom/android/launcher3/q5;->z0(ZZ)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0
.end method

.method private e0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->A0()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method private synthetic g0(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/V;->q0(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/V;->t0()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/W4;->n0(Lcom/android/launcher3/h0;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private synthetic h0(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->j:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    invoke-interface {p1, p0}, LX1/b;->H(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic i0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/V;->e0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/V;->f(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private j0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    const/4 v1, 0x5

    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Lcom/android/launcher3/taskbar/J3;->r:[F

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/taskbar/V;->k:Lcom/android/launcher3/util/v1;

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    aput v2, v1, v0

    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->e1()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method private l0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->l:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    const/4 v1, 0x4

    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/V;->s0(FI)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private o0(ZZZI)Landroid/animation/Animator;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/X2;->G()Lcom/android/launcher3/V3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V3;->hasFlag(I)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Lcom/android/launcher3/V3;->A(Lcom/android/launcher3/C2;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    move v0, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v0, v3

    .line 26
    :goto_0
    if-eqz p1, :cond_2

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/o4;->h:Z

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return-object p0

    .line 36
    :cond_2
    sget-object v0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_WALLPAPER_ACTIVITY:Landroid/window/DesktopModeFlags;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/app/Activity;->getDisplayId()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/S1;->d(I)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    move p1, v3

    .line 61
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 62
    .line 63
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 64
    .line 65
    .line 66
    if-eqz p2, :cond_4

    .line 67
    .line 68
    move p4, v3

    .line 69
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 70
    .line 71
    int-to-long p1, p4

    .line 72
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/X2;->B(JZ)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method private p0(ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/V;->b0(Z)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/taskbar/V;->o0(ZZZI)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private q0(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->h0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    iput-boolean p0, p1, Lcom/android/launcher3/h0;->q3:Z

    .line 12
    .line 13
    return-void
.end method

.method private t0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/V;->e0()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v1, Lcom/android/launcher3/taskbar/U;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/U;-><init>(Lcom/android/launcher3/taskbar/V;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public B(Lcom/android/quickstep/util/SplitTask;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U5(Lcom/android/quickstep/util/SplitTask;Landroid/window/RemoteTransition;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected C()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/V;->p0(ZZ)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/taskbar/V;->o:Lcom/android/launcher3/X3$b;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/android/quickstep/views/RecentsViewContainer;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0}, Lcom/android/launcher3/taskbar/o4;->C()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/X2;->Y()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 30
    .line 31
    if-eq v0, v2, :cond_0

    .line 32
    .line 33
    invoke-interface {v0, v1}, Lcom/android/quickstep/views/RecentsViewContainer;->setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->n:Lcom/android/quickstep/HomeVisibilityState;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->p:Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/android/quickstep/HomeVisibilityState;->removeListener(Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public D()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/taskbar/o4;->D()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->C()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method protected E()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->d0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-static {v0}, LO2/d;->j(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->e1()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/util/Z;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->K()V

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/V;->p0(ZZ)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method protected G()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/V;->q0(Lcom/android/launcher3/h0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public H()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->F1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->a(F)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public I(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/taskbar/o4;->I(Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/logging/f;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v1, p0, p1, v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public K()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->H0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->n:Lcom/android/quickstep/HomeVisibilityState;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/HomeVisibilityState;->isHomeVisible()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/V;->F(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public M()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->g0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected R(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->isResumed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/X2;->P()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Z0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/C2;->N4(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/taskbar/o4;->R(Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public T(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->o0(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected Z(Landroid/animation/AnimatorSet;I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-direct {p0, v0, v1, v1, p2}, Lcom/android/launcher3/taskbar/V;->o0(ZZZI)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a0()Landroid/animation/Animator;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->F0()Z

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
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 12
    .line 13
    const-wide/16 v0, 0x1

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->P()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->L(J)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public b(LN2/h;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/taskbar/X2;->X(LN2/h;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->a6(LN2/h;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c(LN2/h;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/taskbar/X2;->X(LN2/h;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->a6(LN2/h;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 8
    .line 9
    invoke-static {v0}, Ln1/f;->a(Ljava/util/Optional;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public d0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/taskbar/bubbles/t;->G2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Hotseat;->R0(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public f0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->e:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->l()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v0, v1

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/j2;->G()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    return v1

    .line 44
    :cond_2
    :goto_1
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public g(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/taskbar/o4;->g(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->j:Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "%s\tTaskbar in-app display progress: %.2f"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->k:Lcom/android/launcher3/util/v1;

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, "\t\t"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "SYSUI_SURFACE_PROGRESS_INDEX"

    .line 45
    .line 46
    const-string v3, "LAUNCHER_PAUSE_PROGRESS_INDEX"

    .line 47
    .line 48
    const-string v4, "MINUS_ONE_PAGE_PROGRESS_INDEX"

    .line 49
    .line 50
    const-string v5, "ALL_APPS_PAGE_PROGRESS_INDEX"

    .line 51
    .line 52
    const-string v6, "WIDGETS_PAGE_PROGRESS_INDEX"

    .line 53
    .line 54
    filled-new-array {v4, v5, v6, v2, v3}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const-string v3, "mTaskbarInAppDisplayProgressMultiProp"

    .line 59
    .line 60
    invoke-virtual {v0, v1, p2, v3, v2}, Lcom/android/launcher3/util/v1;->dump(Ljava/lang/String;Ljava/io/PrintWriter;Ljava/lang/String;[Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 64
    .line 65
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v1, "%s\tmRecentsWindowContainer=%s"

    .line 70
    .line 71
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 79
    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p1, "\t"

    .line 89
    .line 90
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->F(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->d0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    sget-object v0, Lcom/android/quickstep/LauncherActivityInterface;->INSTANCE:Lcom/android/quickstep/LauncherActivityInterface;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/quickstep/LauncherActivityInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/V3;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p4, p2, p3}, Lcom/android/launcher3/taskbar/X2;->E(Lcom/android/launcher3/V3;Lcom/android/quickstep/RecentsAnimationCallbacks;J)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public k()Lcom/android/quickstep/views/RecentsView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    return-object p0
.end method

.method public k0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->l:Lcom/android/launcher3/anim/d;

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
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->l:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "LauncherTaskbarUIController"

    .line 2
    .line 3
    return-object p0
.end method

.method public n0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->l:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->h()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->l:Lcom/android/launcher3/anim/d;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected p(Lcom/android/launcher3/taskbar/R1;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/taskbar/o4;->p(Lcom/android/launcher3/taskbar/R1;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-wide v2, v2, Lcom/android/launcher3/taskbar/J3;->b:J

    .line 15
    .line 16
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/android/launcher3/taskbar/X2;->K(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/uioverrides/QuickstepLauncher;J)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 22
    .line 23
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->getEnableOverviewInWindow()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {v0, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/android/launcher3/taskbar/V;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 48
    .line 49
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 50
    .line 51
    if-nez p1, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 54
    .line 55
    iput-object p1, p0, Lcom/android/launcher3/taskbar/V;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 56
    .line 57
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 65
    .line 66
    if-eq p1, v0, :cond_2

    .line 67
    .line 68
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->n:Lcom/android/quickstep/HomeVisibilityState;

    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->p:Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Lcom/android/quickstep/HomeVisibilityState;->addListener(Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;)Z

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/android/launcher3/y0;->H0()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->n:Lcom/android/quickstep/HomeVisibilityState;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/android/quickstep/HomeVisibilityState;->isHomeVisible()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    goto :goto_0

    .line 91
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    :goto_0
    const/4 v0, 0x1

    .line 98
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/V;->p0(ZZ)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/V;->q0(Lcom/android/launcher3/h0;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 111
    .line 112
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->o:Lcom/android/launcher3/X3$b;

    .line 113
    .line 114
    invoke-interface {p1, v0}, Lcom/android/quickstep/views/RecentsViewContainer;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iget-object p1, p1, Lcom/android/launcher3/taskbar/J3;->r:[F

    .line 124
    .line 125
    array-length v0, p1

    .line 126
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const/4 v0, 0x0

    .line 131
    :goto_1
    array-length v1, p1

    .line 132
    if-ge v0, v1, :cond_4

    .line 133
    .line 134
    iget-object v1, p0, Lcom/android/launcher3/taskbar/V;->k:Lcom/android/launcher3/util/v1;

    .line 135
    .line 136
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    aget v2, p1, v0

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 143
    .line 144
    .line 145
    add-int/lit8 v0, v0, 0x1

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_4
    return-void
.end method

.method public q()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/X2;->L()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->u()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public r0(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/X2;->b0(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s0(FI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->k:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p2, p2, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/o4;->u()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_2

    .line 22
    .line 23
    iget-object p2, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/X2;->L()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    iget-object p2, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/M0;->j0()Lcom/android/launcher3/anim/d;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->J0()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    int-to-float v0, v0

    .line 50
    iget-object v1, p0, Lcom/android/launcher3/taskbar/V;->j:Lcom/android/launcher3/anim/d;

    .line 51
    .line 52
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 53
    .line 54
    mul-float/2addr v0, v1

    .line 55
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 59
    .line 60
    iget-object p2, p2, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/M0;->d0()Lcom/android/launcher3/anim/d;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p2, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->d0()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 78
    .line 79
    new-instance p2, Lcom/android/launcher3/taskbar/N;

    .line 80
    .line 81
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/N;-><init>(Lcom/android/launcher3/taskbar/V;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, p2}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    :goto_0
    return-void
.end method

.method public t()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/X2;->N()Z

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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->k:Lcom/android/launcher3/util/v1;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v0, 0x0

    .line 21
    cmpl-float p0, p0, v0

    .line 22
    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    return v1
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->M()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public u0(Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->F0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 10
    .line 11
    const-wide/32 v0, 0x10000

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method protected v()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->P()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public v0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/X2;->f0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w0()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x1

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Lcom/android/launcher3/util/H1;->b:Lcom/android/launcher3/util/H1$a;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->m:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/H1$a;->c(Landroid/content/Context;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    xor-int/2addr p0, v2

    .line 29
    return p0

    .line 30
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-ge p0, v2, :cond_2

    .line 39
    .line 40
    return v2

    .line 41
    :cond_2
    return v1
.end method

.method public x0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->j:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    cmpl-float p0, p0, v0

    .line 7
    .line 8
    if-lez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method protected y()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public y0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->w0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->w()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->t()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->x()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public z0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, v1}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/V;->q:Lcom/android/launcher3/taskbar/X2;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->C()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
