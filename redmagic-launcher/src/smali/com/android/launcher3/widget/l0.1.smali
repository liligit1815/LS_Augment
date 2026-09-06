.class public Lcom/android/launcher3/widget/l0;
.super Ljava/lang/Object;
.source "LauncherWidgetHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/l0$b;
    }
.end annotation


# instance fields
.field protected final a:Landroid/content/Context;

.field protected final b:Lcom/android/launcher3/widget/p0;

.field protected final c:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/widget/T;",
            ">;"
        }
    .end annotation
.end field

.field final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/widget/p0$b;",
            ">;"
        }
    .end annotation
.end field

.field protected e:Ljava/util/concurrent/atomic/AtomicInteger;

.field protected f:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/widget/T;",
            ">;"
        }
    .end annotation
.end field

.field g:Ljava/util/function/IntConsumer;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/p0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/widget/l0;->d:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 27
    .line 28
    iput-object p2, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 29
    .line 30
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 31
    .line 32
    new-instance p2, Lcom/android/launcher3/widget/k0;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/k0;-><init>(Lcom/android/launcher3/widget/l0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic C(Lcom/android/launcher3/widget/p0$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic D(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/l0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/l0$a;-><init>(Lcom/android/launcher3/widget/l0;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic E()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/widget/p0;->e()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/widget/p0;->e()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic G(Lcom/android/launcher3/widget/p0$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic H(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->a0()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    :goto_0
    if-ltz p1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 27
    .line 28
    instance-of v1, v0, Lcom/android/launcher3/widget/t0;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/widget/T;->T()V

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method private synthetic I()V
    .locals 2

    .line 1
    const-string v0, "LauncherWidgetHolder"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "startListening start"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHost;->startListening()V

    .line 11
    .line 12
    .line 13
    const-string v1, "startListening end"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    invoke-static {v0}, Lcom/android/launcher3/N5;->v(Ljava/lang/Exception;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    :goto_0
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/l0;->S(Z)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 31
    .line 32
    new-instance v1, Lcom/android/launcher3/widget/a0;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/a0;-><init>(Lcom/android/launcher3/widget/l0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 42
    .line 43
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    throw p0
.end method

.method private synthetic J(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->c0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic K()V
    .locals 2

    .line 1
    const-string v0, "stopListening start"

    .line 2
    .line 3
    const-string v1, "LauncherWidgetHolder"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHost;->stopListening()V

    .line 11
    .line 12
    .line 13
    const-string v0, "stopListening end"

    .line 14
    .line 15
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/l0;->S(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static L(Landroid/content/Context;)Lcom/android/launcher3/widget/l0;
    .locals 1

    .line 1
    invoke-static {p0}, Lg1/e;->a(Landroid/content/Context;)Lg1/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/android/quickstep/dagger/QuickstepBaseAppComponent;->getWidgetHolderFactory()Lcom/android/launcher3/widget/l0$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p0}, Lcom/android/launcher3/widget/l0$b;->a(Landroid/content/Context;)Lcom/android/launcher3/widget/l0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private O(Lcom/android/launcher3/v;I)V
    .locals 1

    .line 1
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/widget/h0;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/widget/h0;-><init>(Lcom/android/launcher3/v;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/widget/p0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/l0;->C(Lcom/android/launcher3/widget/p0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/l0;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(II)I
    .locals 0

    .line 1
    or-int/2addr p0, p1

    .line 2
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/l0;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/l0;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(I)I
    .locals 0

    .line 1
    and-int/lit8 p0, p0, -0x2

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/widget/p0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/l0;->G(Lcom/android/launcher3/widget/p0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/widget/l0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/l0;->J(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/v;I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/v;->onActivityResult(IILandroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(I)I
    .locals 0

    .line 1
    or-int/lit8 p0, p0, 0x1

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/l0;->K()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/widget/l0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/l0;->H(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(II)I
    .locals 0

    .line 1
    not-int p0, p0

    .line 2
    and-int/2addr p0, p1

    .line 3
    return p0
.end method

.method public static synthetic o(Lcom/android/launcher3/widget/l0;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/l0;->D(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected A(Lcom/android/launcher3/views/k;I)Landroid/os/Bundle;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/widget/T;

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p2}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    instance-of v1, v0, Lcom/android/launcher3/model/data/y;

    .line 30
    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p2}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 47
    .line 48
    invoke-interface {p1, p0, v0}, Lcom/android/launcher3/views/k;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object p1, p0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/util/b;->a()Landroid/os/Bundle;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "android.activity.splashScreenStyle"

    .line 62
    .line 63
    const/4 p2, 0x0

    .line 64
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    return-object p0
.end method

.method public B()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    and-int/2addr p0, v0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method protected M(Lcom/android/launcher3/widget/T;)Lcom/android/launcher3/widget/T;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    and-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    instance-of v0, p1, Lcom/android/launcher3/widget/F0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    move-object v0, p1

    .line 16
    check-cast v0, Lcom/android/launcher3/widget/F0;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/widget/F0;->g0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    new-instance v0, Lcom/android/launcher3/widget/F0;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object v3, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {v3, p1}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {v0, v1, p0, v2, p1}, Lcom/android/launcher3/widget/F0;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;ILcom/android/launcher3/widget/U;)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 48
    .line 49
    check-cast v0, Lcom/android/launcher3/widget/Q;

    .line 50
    .line 51
    instance-of v1, p1, Lcom/android/launcher3/widget/s0;

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    move-object v1, p1

    .line 56
    check-cast v1, Lcom/android/launcher3/widget/s0;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/Q;->k(Lcom/android/launcher3/widget/s0;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iget-object v2, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {v2, p1}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/widget/l0;->w(ILcom/android/launcher3/widget/U;)Lcom/android/launcher3/widget/T;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const/4 p1, 0x0

    .line 80
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/Q;->k(Lcom/android/launcher3/widget/s0;)V

    .line 81
    .line 82
    .line 83
    return-object p0
.end method

.method public N(Lcom/android/launcher3/widget/p0$b;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/g0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/g0;-><init>(Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/widget/p0$b;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/widget/l0;->U(IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/widget/l0;->U(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public R(Ljava/util/function/IntConsumer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/l0;->g:Ljava/util/function/IntConsumer;

    .line 2
    .line 3
    return-void
.end method

.method protected S(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    new-instance p1, Lcom/android/launcher3/widget/Y;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/android/launcher3/widget/Y;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->updateAndGet(Ljava/util/function/IntUnaryOperator;)I

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    new-instance p1, Lcom/android/launcher3/widget/Z;

    .line 17
    .line 18
    invoke-direct {p1}, Lcom/android/launcher3/widget/Z;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->updateAndGet(Ljava/util/function/IntUnaryOperator;)I

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public T(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/widget/T;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/l0;->f:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-void
.end method

.method U(IZ)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/widget/c0;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/c0;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->updateAndGet(Ljava/util/function/IntUnaryOperator;)I

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/widget/d0;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/d0;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->updateAndGet(Ljava/util/function/IntUnaryOperator;)I

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object p2, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/l0;->W(I)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->Z()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    if-eqz p1, :cond_2

    .line 47
    .line 48
    and-int/lit8 p1, p2, 0x4

    .line 49
    .line 50
    if-nez p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->b0()V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public V(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/widget/l0;->U(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected W(I)Z
    .locals 0

    .line 1
    const/16 p0, 0xe

    .line 2
    .line 3
    and-int/2addr p1, p0

    .line 4
    if-ne p1, p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public X(Lcom/android/launcher3/v;ILandroid/appwidget/AppWidgetProviderInfo;I)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "android.appwidget.action.APPWIDGET_BIND"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "appWidgetId"

    .line 9
    .line 10
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p2, p3, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 15
    .line 16
    const-string v0, "appWidgetProvider"

    .line 17
    .line 18
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p2, "appWidgetProviderProfile"

    .line 23
    .line 24
    invoke-virtual {p3}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-virtual {p0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0, p4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public Y(Lcom/android/launcher3/v;II)V
    .locals 8

    .line 1
    :try_start_0
    const-string v0, "Main"

    .line 2
    .line 3
    const-string v1, "start: startConfigActivity"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/l0;->A(Lcom/android/launcher3/views/k;I)Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object v7
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    const/4 v5, 0x0

    .line 15
    move-object v3, p1

    .line 16
    move v4, p2

    .line 17
    move v6, p3

    .line 18
    :try_start_1
    invoke-virtual/range {v2 .. v7}, Landroid/appwidget/AppWidgetHost;->startAppWidgetConfigureActivityForResult(Landroid/app/Activity;IIILandroid/os/Bundle;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-object v3, p1

    .line 23
    move v6, p3

    .line 24
    :catch_1
    const p1, 0x7f140047

    .line 25
    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    invoke-static {v3, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0, v3, v6}, Lcom/android/launcher3/widget/l0;->O(Lcom/android/launcher3/v;I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/widget/f;->g()Lcom/android/launcher3/widget/f;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/android/launcher3/widget/f0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/f0;-><init>(Lcom/android/launcher3/widget/l0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/f;->i(Ljava/util/function/Consumer;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/p0;->f()Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/widget/X;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/X;-><init>(Lcom/android/launcher3/widget/l0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/widget/f;->g()Lcom/android/launcher3/widget/f;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/android/launcher3/widget/j0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/j0;-><init>(Lcom/android/launcher3/widget/l0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/f;->i(Ljava/util/function/Consumer;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public c0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/p0;->f()Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/widget/b0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/b0;-><init>(Lcom/android/launcher3/widget/l0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected d0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/launcher3/widget/T;

    .line 18
    .line 19
    instance-of v2, v1, Lcom/android/launcher3/widget/F0;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    check-cast v1, Lcom/android/launcher3/widget/F0;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/launcher3/widget/F0;->T()V

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public p(ILcom/android/launcher3/widget/U;Ljava/lang/Runnable;)Lcom/android/launcher3/util/a2;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/l0;->v(ILcom/android/launcher3/widget/U;)Landroid/appwidget/AppWidgetHostView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Lcom/android/launcher3/widget/s0;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/widget/s0;

    .line 10
    .line 11
    invoke-virtual {p0, p3}, Lcom/android/launcher3/widget/s0;->b0(Ljava/lang/Runnable;)Lcom/android/launcher3/util/a2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p0, Lcom/android/launcher3/widget/W;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/widget/W;-><init>()V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public q(Lcom/android/launcher3/widget/p0$b;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/V;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/V;-><init>(Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/widget/p0$b;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public r()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHost;->allocateAppWidgetId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final s(Lcom/android/launcher3/widget/T;)Landroid/appwidget/AppWidgetHostView;
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/F0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/android/launcher3/widget/F0;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/widget/F0;->g0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eq v0, p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/l0;->M(Lcom/android/launcher3/widget/T;)Lcom/android/launcher3/widget/T;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-object p1
.end method

.method public t()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/widget/Q;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/widget/Q;->clearViews()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v(ILcom/android/launcher3/widget/U;)Landroid/appwidget/AppWidgetHostView;
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/android/launcher3/widget/U;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/android/launcher3/widget/U;->A()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/android/launcher3/widget/custom/group/a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/widget/custom/group/a;-><init>(Landroid/content/Context;I)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/widget/U;->x()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    new-instance v0, Lcom/android/launcher3/widget/custom/future/d;

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/custom/future/d;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance v0, Lcom/android/launcher3/widget/T;

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 38
    .line 39
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    const/4 p1, 0x0

    .line 43
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/widget/T;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 44
    .line 45
    .line 46
    sget-object p1, Lk2/k;->m:Lcom/android/launcher3/util/I;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lk2/k;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lk2/k;->L(Lcom/android/launcher3/widget/T;)V

    .line 57
    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/l0;->w(ILcom/android/launcher3/widget/U;)Lcom/android/launcher3/widget/T;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->f:Ljava/util/function/Consumer;

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    invoke-interface {v0, p2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    invoke-static {}, Lx1/O;->M()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_5

    .line 76
    .line 77
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    if-ne v0, v1, :cond_4

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    return-object p2

    .line 89
    :cond_5
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 90
    .line 91
    invoke-virtual {p0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-object p2
.end method

.method protected w(ILcom/android/launcher3/widget/U;)Lcom/android/launcher3/widget/T;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    and-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    if-nez v0, :cond_5

    .line 10
    .line 11
    invoke-static {p2}, Lcom/android/launcher3/widget/suggest/v;->z(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance p2, Lcom/android/launcher3/widget/suggest/m;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/widget/suggest/m;-><init>(Landroid/content/Context;I)V

    .line 22
    .line 23
    .line 24
    return-object p2

    .line 25
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/widget/suggest/g;->e(I)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    new-instance p1, Lcom/android/launcher3/widget/suggest/f;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/suggest/f;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    return-object p1

    .line 39
    :cond_1
    invoke-static {p2}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->i(Lcom/android/launcher3/widget/U;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    new-instance p2, Lcom/android/launcher3/widget/group/b;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 48
    .line 49
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/widget/group/b;-><init>(Landroid/content/Context;I)V

    .line 50
    .line 51
    .line 52
    return-object p2

    .line 53
    :cond_2
    invoke-static {p2, p1}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->k(Lcom/android/launcher3/widget/U;I)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    new-instance p2, Lcom/android/launcher3/widget/group/c;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 62
    .line 63
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/widget/group/c;-><init>(Landroid/content/Context;I)V

    .line 64
    .line 65
    .line 66
    return-object p2

    .line 67
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 68
    .line 69
    invoke-static {v0, p2, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->A(Landroid/content/Context;Lcom/android/launcher3/widget/U;I)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    new-instance v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 78
    .line 79
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;-><init>(Landroid/content/Context;ILcom/android/launcher3/widget/U;)V

    .line 80
    .line 81
    .line 82
    return-object v0

    .line 83
    :cond_4
    new-instance v0, Lcom/android/launcher3/widget/F0;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 86
    .line 87
    invoke-direct {v0, v1, p0, p1, p2}, Lcom/android/launcher3/widget/F0;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;ILcom/android/launcher3/widget/U;)V

    .line 88
    .line 89
    .line 90
    return-object v0

    .line 91
    :cond_5
    invoke-static {}, Lx1/O;->M()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_6

    .line 96
    .line 97
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    if-eq v0, v1, :cond_6

    .line 106
    .line 107
    new-instance v0, Lcom/android/launcher3/widget/s0;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 110
    .line 111
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/s0;-><init>(Landroid/content/Context;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/widget/T;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 115
    .line 116
    .line 117
    return-object v0

    .line 118
    :cond_6
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 121
    .line 122
    invoke-virtual {v0, v1, p1, p2}, Landroid/appwidget/AppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Lcom/android/launcher3/widget/T;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .line 128
    return-object v0

    .line 129
    :catch_0
    move-exception v0

    .line 130
    invoke-static {v0}, Lcom/android/launcher3/N5;->v(Ljava/lang/Exception;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 137
    .line 138
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 143
    .line 144
    if-nez v0, :cond_7

    .line 145
    .line 146
    new-instance v0, Lcom/android/launcher3/widget/s0;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 149
    .line 150
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/s0;-><init>(Landroid/content/Context;)V

    .line 151
    .line 152
    .line 153
    :cond_7
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/widget/T;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->x()V

    .line 157
    .line 158
    .line 159
    return-object v0

    .line 160
    :cond_8
    new-instance p0, Ljava/lang/RuntimeException;

    .line 161
    .line 162
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    throw p0
.end method

.method public x(I)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "deleteAppWidgetId: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " , "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    new-instance v1, Ljava/lang/Throwable;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "LauncherWidgetHolder"

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v2, Lx1/x;

    .line 51
    .line 52
    new-instance v3, Lcom/android/launcher3/widget/e0;

    .line 53
    .line 54
    invoke-direct {v3, p0, p1}, Lcom/android/launcher3/widget/e0;-><init>(Lcom/android/launcher3/widget/l0;I)V

    .line 55
    .line 56
    .line 57
    const/4 v4, 0x1

    .line 58
    invoke-direct {v2, v3, v4}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 65
    .line 66
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_0

    .line 82
    .line 83
    instance-of p0, v0, Lcom/android/launcher3/widget/suggest/m;

    .line 84
    .line 85
    if-eqz p0, :cond_0

    .line 86
    .line 87
    new-instance p0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v2, "deleteAppWidgetId  appWidgetId="

    .line 93
    .line 94
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v2, " hostView="

    .line 101
    .line 102
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    move-object v2, v0

    .line 106
    check-cast v2, Lcom/android/launcher3/widget/suggest/m;

    .line 107
    .line 108
    invoke-virtual {v2}, Lcom/android/launcher3/widget/suggest/m;->getSuggestWidgetHostViewTag()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    iget-object p0, v0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 123
    .line 124
    check-cast p0, Lcom/android/launcher3/C2;

    .line 125
    .line 126
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/widget/suggest/v;->H(Lcom/android/launcher3/C2;ILcom/android/launcher3/widget/T;)V

    .line 127
    .line 128
    .line 129
    :cond_0
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/i0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/i0;-><init>(Lcom/android/launcher3/widget/l0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catch_0
    move-exception p0

    .line 17
    const-string v0, "LauncherWidgetHolder"

    .line 18
    .line 19
    const-string v1, "Failed to remove self from holder list"

    .line 20
    .line 21
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public z()[I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lx1/O;->T3(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "getAppWidgetIds, userUnlocked: "

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "LauncherWidgetHolder"

    .line 25
    .line 26
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    new-array p0, p0, [I

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHost;->getAppWidgetIds()[I

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method
