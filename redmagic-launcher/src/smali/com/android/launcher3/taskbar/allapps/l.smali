.class final Lcom/android/launcher3/taskbar/allapps/l;
.super Ljava/lang/Object;
.source "TaskbarAllAppsViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/allapps/l$a;
    }
.end annotation


# instance fields
.field private final a:La2/a;

.field private final b:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

.field private final c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

.field private final d:Lcom/android/launcher3/taskbar/a4;

.field private final e:Lcom/android/launcher3/taskbar/M0;

.field private final f:La2/e;

.field private final g:Lcom/android/launcher3/taskbar/J3;

.field private final h:Z


# direct methods
.method constructor <init>(La2/a;Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/l;->a:La2/a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/allapps/l;->b:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->getAppsView()Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/l;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 13
    .line 14
    iget-object p1, p3, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/l;->d:Lcom/android/launcher3/taskbar/a4;

    .line 17
    .line 18
    iget-object p1, p3, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/l;->e:Lcom/android/launcher3/taskbar/M0;

    .line 21
    .line 22
    iget-object p1, p3, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/l;->f:La2/e;

    .line 25
    .line 26
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/l;->g:Lcom/android/launcher3/taskbar/J3;

    .line 31
    .line 32
    iput-boolean p5, p0, Lcom/android/launcher3/taskbar/allapps/l;->h:Z

    .line 33
    .line 34
    new-instance p1, Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 35
    .line 36
    const/4 p3, 0x0

    .line 37
    invoke-direct {p1, p0, p4, p3}, Lcom/android/launcher3/taskbar/allapps/l$a;-><init>(Lcom/android/launcher3/taskbar/allapps/l;Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;Lcom/android/launcher3/taskbar/allapps/m;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->v0(Lcom/android/launcher3/taskbar/allapps/l$a;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/allapps/l;->h()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/allapps/l;->i()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/J3;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/J3;->n:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/J3;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/J3;->n:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/allapps/l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/allapps/l;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/taskbar/allapps/l;)Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/allapps/l;)La2/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l;->f:La2/e;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/taskbar/allapps/l;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/allapps/l;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method private synthetic g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->g:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/taskbar/allapps/k;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/allapps/k;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->e:Lcom/android/launcher3/taskbar/M0;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/M0;->S0(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->a:La2/a;

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    invoke-static {v0, v2}, Lcom/android/launcher3/a;->closeOpenContainer(Lcom/android/launcher3/views/k;I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->a:La2/a;

    .line 28
    .line 29
    invoke-virtual {v0}, La2/a;->c()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->d:Lcom/android/launcher3/taskbar/a4;

    .line 36
    .line 37
    const-wide/16 v2, 0x20

    .line 38
    .line 39
    invoke-virtual {v0, v2, v3, v1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l;->d:Lcom/android/launcher3/taskbar/a4;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->D()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method private h()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-class v1, Lcom/android/launcher3/appprediction/AppsDividerView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/appprediction/AppsDividerView;

    .line 14
    .line 15
    sget-object v1, Lcom/android/launcher3/util/H1;->e:Lcom/android/launcher3/util/H1$a;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/taskbar/allapps/l;->a:La2/a;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/H1$a;->c(Landroid/content/Context;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    xor-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/android/launcher3/appprediction/AppsDividerView;->setShowAllAppsLabel(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l;->a:La2/a;

    .line 29
    .line 30
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/H1$a;->d(Landroid/content/Context;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private i()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->a:La2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, La2/a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->d:Lcom/android/launcher3/taskbar/a4;

    .line 11
    .line 12
    const-wide/16 v2, 0x20

    .line 13
    .line 14
    invoke-virtual {v0, v2, v3, v1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->d:Lcom/android/launcher3/taskbar/a4;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->D()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->g:Lcom/android/launcher3/taskbar/J3;

    .line 23
    .line 24
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v2, Lcom/android/launcher3/taskbar/allapps/i;

    .line 29
    .line 30
    invoke-direct {v2}, Lcom/android/launcher3/taskbar/allapps/i;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->e:Lcom/android/launcher3/taskbar/M0;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/M0;->S0(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l;->b:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 42
    .line 43
    new-instance v1, Lcom/android/launcher3/taskbar/allapps/j;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/allapps/j;-><init>(Lcom/android/launcher3/taskbar/allapps/l;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/f;->setOnCloseBeginListener(Lcom/android/launcher3/views/f$e;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l;->b:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->y0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
