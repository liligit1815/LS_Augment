.class public final Lcom/android/launcher3/taskbar/S1;
.super Ljava/lang/Object;
.source "TaskbarDesktopModeController.kt"

# interfaces
.implements LP1/k$d;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:LP1/k;

.field private c:Lcom/android/launcher3/taskbar/R1;

.field private d:Lcom/android/launcher3/taskbar/J3;


# direct methods
.method public constructor <init>(Landroid/content/Context;LP1/k;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "desktopVisibilityController"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/taskbar/S1;->a:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/taskbar/S1;->b:LP1/k;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public final b(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/J3;)V
    .locals 1

    .line 1
    const-string v0, "controllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "sharedState"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/taskbar/S1;->c:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/launcher3/taskbar/S1;->d:Lcom/android/launcher3/taskbar/J3;

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/taskbar/S1;->b:LP1/k;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, LP1/k;->N(LP1/k$d;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final c(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/S1;->b:LP1/k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LP1/k;->r(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final d(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/S1;->b:LP1/k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LP1/k;->s(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/S1;->b:LP1/k;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, LP1/k;->X(LP1/k$d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/S1;->c:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "taskbarControllers"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/android/launcher3/taskbar/S1;->a:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {v3}, Landroid/content/Context;->getDisplayId()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {p0, v3}, Lcom/android/launcher3/taskbar/S1;->c(I)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->q2()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_3

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->r2()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/taskbar/S1;->c:Lcom/android/launcher3/taskbar/R1;

    .line 39
    .line 40
    if-nez p0, :cond_1

    .line 41
    .line 42
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move-object v1, p0

    .line 47
    :goto_0
    iget-object p0, v1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->f0()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public h(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/S1;->c:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    const-string v1, "taskbarControllers"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v2

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->Q0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/S1;->d:Lcom/android/launcher3/taskbar/J3;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    const-string v0, "taskbarSharedState"

    .line 26
    .line 27
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    move-object v0, v2

    .line 31
    :cond_2
    iput-boolean p1, v0, Lcom/android/launcher3/taskbar/J3;->x:Z

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/S1;->a(Z)F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p0, p0, Lcom/android/launcher3/taskbar/S1;->c:Lcom/android/launcher3/taskbar/R1;

    .line 38
    .line 39
    if-nez p0, :cond_3

    .line 40
    .line 41
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    move-object v2, p0

    .line 46
    :goto_0
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/R1;->i()Lcom/android/launcher3/anim/d;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 55
    .line 56
    .line 57
    return-void
.end method
