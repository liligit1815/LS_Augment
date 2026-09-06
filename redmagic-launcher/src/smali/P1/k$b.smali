.class final LP1/k$b;
.super Lcom/android/wm/shell/desktopmode/c$a;
.source "DesktopVisibilityController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LP1/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final g:Landroid/content/Context;

.field private final h:I

.field private final i:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "LP1/k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LP1/k;Landroid/content/Context;I)V
    .locals 1

    .line 1
    const-string v0, "controller"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "context"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/wm/shell/desktopmode/c$a;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, LP1/k$b;->g:Landroid/content/Context;

    .line 15
    .line 16
    iput p3, p0, LP1/k$b;->h:I

    .line 17
    .line 18
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    return-void
.end method

.method private static final A2(LP1/k$b;II)V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LP1/k;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1, p2}, LP1/k;->j(LP1/k;II)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private static final B2(ILP1/k$b;LP1/k;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "DesktopTaskListenerImpl: onEnterDesktopModeTransitionStarted with duration= "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "DesktopVisController"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, LP1/k$b;->g:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {p1}, LO2/d;->h(Landroid/content/Context;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {p2, p0}, LP1/k;->e(LP1/k;I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {p2}, LP1/k;->c(LP1/k;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    invoke-static {p2, p1}, LP1/k;->l(LP1/k;Z)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2, p0}, LP1/k;->e(LP1/k;I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method private static final C2(ILP1/k$b;LP1/k;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "DesktopTaskListenerImpl: onExitDesktopModeTransitionStarted with duration= "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "DesktopVisController"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, LP1/k$b;->g:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {p1}, LO2/d;->h(Landroid/content/Context;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {p2, p0}, LP1/k;->f(LP1/k;I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {p2}, LP1/k;->c(LP1/k;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-static {p2, p1}, LP1/k;->l(LP1/k;Z)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2, p0}, LP1/k;->f(LP1/k;I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method private static final D2(LP1/k$b;[Lcom/android/wm/shell/desktopmode/a;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LP1/k;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1, p2}, LP1/k;->k(LP1/k;[Lcom/android/wm/shell/desktopmode/a;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private static final E2(LP1/k$b;Z)V
    .locals 2

    .line 1
    iget-object p0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LP1/k;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "DesktopTaskListenerImpl: doesAnyTaskRequireTaskbarRounding= "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "DesktopVisController"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    invoke-static {p0, p1}, LP1/k;->d(LP1/k;Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private static final F2(LP1/k$b;I)V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LP1/k;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, LP1/k;->V(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic o2(ILP1/k$b;LP1/k;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LP1/k$b;->C2(ILP1/k$b;LP1/k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(LP1/k$b;II)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LP1/k$b;->A2(LP1/k$b;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2(LP1/k$b;III)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, LP1/k$b;->x2(LP1/k$b;III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r2(LP1/k$b;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LP1/k$b;->E2(LP1/k$b;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s2(ILP1/k$b;LP1/k;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LP1/k$b;->B2(ILP1/k$b;LP1/k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t2(LP1/k$b;II)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LP1/k$b;->z2(LP1/k$b;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u2(LP1/k$b;[Lcom/android/wm/shell/desktopmode/a;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LP1/k$b;->D2(LP1/k$b;[Lcom/android/wm/shell/desktopmode/a;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v2(LP1/k$b;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LP1/k$b;->y2(LP1/k$b;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w2(LP1/k$b;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LP1/k$b;->F2(LP1/k$b;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final x2(LP1/k$b;III)V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LP1/k;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1, p2, p3}, LP1/k;->g(LP1/k;III)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private static final y2(LP1/k$b;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LP1/k;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1}, LP1/k;->h(LP1/k;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private static final z2(LP1/k$b;II)V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LP1/k;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1, p2}, LP1/k;->i(LP1/k;II)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public A(II)V
    .locals 1

    .line 1
    iget v0, p0, LP1/k$b;->h:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v0, LP1/t;

    .line 9
    .line 10
    invoke-direct {v0, p0, p2}, LP1/t;-><init>(LP1/k$b;I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public B0([Lcom/android/wm/shell/desktopmode/a;Z)V
    .locals 2

    .line 1
    const-string v0, "displayDeskStates"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v1, LP1/o;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1, p2}, LP1/o;-><init>(LP1/k$b;[Lcom/android/wm/shell/desktopmode/a;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public Z1(IZ)V
    .locals 0

    .line 1
    const-string p0, "DesktopVisController"

    .line 2
    .line 3
    const-string p1, "DesktopTaskListenerImpl: onStashedChanged is deprecated"

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h(Z)V
    .locals 2

    .line 1
    invoke-static {}, LO2/d;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    new-instance v1, LP1/m;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, LP1/m;-><init>(LP1/k$b;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public h2(I)V
    .locals 3

    .line 1
    iget-object v0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LP1/k;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    new-instance v2, LP1/q;

    .line 15
    .line 16
    invoke-direct {v2, p1, p0, v0}, LP1/q;-><init>(ILP1/k$b;LP1/k;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onActiveDeskChanged(III)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, LP1/s;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2, p3}, LP1/s;-><init>(LP1/k$b;III)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onCanCreateDesksChanged(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, LP1/r;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, LP1/r;-><init>(LP1/k$b;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDeskAdded(II)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, LP1/l;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, LP1/l;-><init>(LP1/k$b;II)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDeskRemoved(II)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, LP1/p;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, LP1/p;-><init>(LP1/k$b;II)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public z(I)V
    .locals 3

    .line 1
    iget-object v0, p0, LP1/k$b;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LP1/k;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    new-instance v2, LP1/n;

    .line 15
    .line 16
    invoke-direct {v2, p1, p0, v0}, LP1/n;-><init>(ILP1/k$b;LP1/k;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
