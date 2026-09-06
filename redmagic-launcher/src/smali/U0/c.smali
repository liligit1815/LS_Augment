.class public final LU0/c;
.super Ljava/lang/Object;
.source "IconSurfaceHolder.java"


# instance fields
.field private final a:Lcom/android/launcher3/h0;

.field private b:Z

.field private final c:LU0/a;

.field private d:Z

.field private e:Landroid/view/View;

.field private final f:Lcom/android/launcher3/C2;

.field private g:Lcom/android/launcher3/views/FloatingIconView;

.field private h:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private i:I

.field private j:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "launcher"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "deviceProfile"

    .line 10
    .line 11
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, LU0/c;->f:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    iput-object p2, p0, LU0/c;->a:Lcom/android/launcher3/h0;

    .line 17
    .line 18
    const/4 p2, -0x1

    .line 19
    iput p2, p0, LU0/c;->i:I

    .line 20
    .line 21
    sget-object p2, LU0/g;->h:Lcom/android/launcher3/util/I;

    .line 22
    .line 23
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, LU0/a;

    .line 28
    .line 29
    iput-object p1, p0, LU0/c;->c:LU0/a;

    .line 30
    .line 31
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, LU0/c;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 38
    .line 39
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 40
    .line 41
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, LU0/c;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a(LU0/c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LU0/c;->d(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LU0/c;->f(LU0/c;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final f(LU0/c;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$it"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, LU0/c;->g(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private final g(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "IconSurfaceHolder"

    .line 2
    .line 3
    const-string v0, "resetIconToVisibleImp"

    .line 4
    .line 5
    invoke-static {p1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, LU0/c;->b:Z

    .line 10
    .line 11
    return-void
.end method

.method public static j(LU0/c;Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;ZIZILjava/lang/Object;)V
    .locals 6

    .line 1
    and-int/lit8 p6, p6, 0x10

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    const/4 p5, 0x1

    .line 6
    :cond_0
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v3, p3

    .line 10
    move v4, p4

    .line 11
    move v5, p5

    .line 12
    invoke-virtual/range {v0 .. v5}, LU0/c;->i(Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;ZIZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final b(ZZ)Z
    .locals 6

    .line 1
    iget-object v0, p0, LU0/c;->c:LU0/a;

    .line 2
    .line 3
    iget-object v1, p0, LU0/c;->e:Landroid/view/View;

    .line 4
    .line 5
    invoke-interface {v0, v1}, LU0/a;->d(Landroid/view/View;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, LU0/c;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, LU0/c;->i:I

    .line 16
    .line 17
    const-string v3, ", releaseDirectly: "

    .line 18
    .line 19
    const-string v4, ", suppressIconSurfaceAlphaWhenIdChanged: "

    .line 20
    .line 21
    const-string v5, "endWindowAnim, isOpen: "

    .line 22
    .line 23
    invoke-static {v5, p1, v3, p2, v4}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const-string v4, ", originalIconViewId: "

    .line 28
    .line 29
    const-string v5, "  allAppsId: "

    .line 30
    .line 31
    invoke-static {v3, v1, v4, v2, v5}, Lcom/android/quickstep/util/MFVStringUtils;->appendToStringBuilder(Ljava/lang/StringBuilder;ZLjava/lang/String;ILjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "IconSurfaceHolder"

    .line 35
    .line 36
    invoke-static {v3, v0, v1}, Lcom/android/quickstep/util/MFVStringUtils;->appendAndLog(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-boolean v1, p0, LU0/c;->d:Z

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    return v2

    .line 45
    :cond_0
    iget v1, p0, LU0/c;->i:I

    .line 46
    .line 47
    const/4 v3, -0x1

    .line 48
    const/4 v4, 0x1

    .line 49
    if-eq v1, v3, :cond_2

    .line 50
    .line 51
    if-ne v0, v1, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    move v1, v4

    .line 55
    goto :goto_1

    .line 56
    :cond_2
    :goto_0
    move v1, v2

    .line 57
    :goto_1
    if-nez p2, :cond_3

    .line 58
    .line 59
    iget-object p2, p0, LU0/c;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_3

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    :cond_3
    move v2, v4

    .line 70
    :cond_4
    iget-object p2, p0, LU0/c;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-nez p2, :cond_5

    .line 77
    .line 78
    if-eqz v1, :cond_6

    .line 79
    .line 80
    :cond_5
    iget v0, p0, LU0/c;->i:I

    .line 81
    .line 82
    :cond_6
    if-eqz p1, :cond_7

    .line 83
    .line 84
    iget-object p2, p0, LU0/c;->c:LU0/a;

    .line 85
    .line 86
    iget-object v1, p0, LU0/c;->e:Landroid/view/View;

    .line 87
    .line 88
    invoke-interface {p2, v1, v4}, LU0/a;->c(Landroid/view/View;Z)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-eqz p2, :cond_7

    .line 93
    .line 94
    iget-object p2, p0, LU0/c;->e:Landroid/view/View;

    .line 95
    .line 96
    invoke-virtual {p0, p2}, LU0/c;->e(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_7
    if-nez p1, :cond_8

    .line 101
    .line 102
    iget-object p2, p0, LU0/c;->e:Landroid/view/View;

    .line 103
    .line 104
    invoke-virtual {p0, p2}, LU0/c;->e(Landroid/view/View;)V

    .line 105
    .line 106
    .line 107
    :cond_8
    :goto_2
    iget-object p2, p0, LU0/c;->c:LU0/a;

    .line 108
    .line 109
    iget-object p0, p0, LU0/c;->e:Landroid/view/View;

    .line 110
    .line 111
    invoke-interface {p2, p0, p1, v2, v0}, LU0/a;->g(Landroid/view/View;ZZI)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    return p0
.end method

.method public final c()Lcom/android/launcher3/views/FloatingIconView;
    .locals 0

    .line 1
    iget-object p0, p0, LU0/c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string v0, "IconSurfaceHolder"

    .line 2
    .line 3
    const-string v1, "reset icon when anim exception"

    .line 4
    .line 5
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-direct {p0, p1}, LU0/c;->g(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, LU0/b;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, LU0/b;-><init>(LU0/c;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    iget-object p0, p0, LU0/c;->c:LU0/a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, LU0/a;->j(Landroid/view/SurfaceControl;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final i(Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;ZIZ)V
    .locals 0

    .line 1
    iget-object p3, p0, LU0/c;->c:LU0/a;

    .line 2
    .line 3
    invoke-interface {p3, p2}, LU0/a;->b(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iput-boolean p2, p0, LU0/c;->d:Z

    .line 8
    .line 9
    iput-object p1, p0, LU0/c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 10
    .line 11
    return-void
.end method

.method public final k(Landroid/view/View;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, LU0/c;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, LU0/c;->e:Landroid/view/View;

    .line 6
    .line 7
    iget-object v0, p0, LU0/c;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, LU0/c;->c:LU0/a;

    .line 14
    .line 15
    invoke-interface {p0, p1, p2}, LU0/a;->e(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
