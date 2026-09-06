.class Lcom/android/launcher3/q5$G;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"

# interfaces
.implements Lcom/android/launcher3/M2$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/q5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "G"
.end annotation


# instance fields
.field private final a:Lu2/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu2/l<",
            "Landroid/view/IRemoteAnimationFinishedCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lu2/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu2/l<",
            "Landroid/view/IRemoteAnimationFinishedCallback;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/q5$G;->a:Lu2/l;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/q5$J;Lcom/android/launcher3/C2;Landroid/app/TaskInfo;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/q5$J;->o2(Lcom/android/launcher3/q5$J;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/views/ScrimView;->getBackgroundColor()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/q5$J;->o2(Lcom/android/launcher3/q5$J;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    :goto_0
    const/16 p1, 0xff

    .line 21
    .line 22
    invoke-static {p0, p1}, LB/a;->r(II)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method private static b(Landroid/view/View;ZLandroid/window/WindowAnimationState;)Lu2/c$d;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/q5$G;->c(Landroid/view/View;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-static {p0, v0}, Lu2/c$d;->g(Landroid/view/View;Ljava/lang/Integer;)Lu2/c$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_1
    new-instance v0, Lcom/android/launcher3/q5$G$b;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/q5$G$b;-><init>(Lu2/c$d;ZLandroid/window/WindowAnimationState;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method private static c(Landroid/view/View;)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ":",
            "Lu2/j;",
            ">(",
            "Landroid/view/View;",
            ")TT;"
        }
    .end annotation

    .line 1
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    instance-of v0, p0, Lu2/j;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    return-object p0

    .line 13
    :cond_1
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of v0, p0, Landroid/view/View;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    check-cast p0, Landroid/view/View;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method static d(Landroid/view/View;ZLcom/android/launcher3/C2;Lcom/android/launcher3/q5$J;Lcom/android/launcher3/util/Y1;Landroid/window/WindowAnimationState;)Lcom/android/launcher3/q5$G;
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/q5;->I()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 11
    .line 12
    const-string p1, "forLaunch cannot be false when the enableContainerReturnAnimations or returnAnimationFrameworkLibrary flag is disabled"

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    throw p0

    .line 18
    :cond_1
    :goto_0
    invoke-static {p0, p1, p5}, Lcom/android/launcher3/q5$G;->b(Landroid/view/View;ZLandroid/window/WindowAnimationState;)Lu2/c$d;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-nez p0, :cond_2

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_2
    new-instance p1, Lcom/android/launcher3/u5;

    .line 27
    .line 28
    invoke-direct {p1, p3, p2}, Lcom/android/launcher3/u5;-><init>(Lcom/android/launcher3/q5$J;Lcom/android/launcher3/C2;)V

    .line 29
    .line 30
    .line 31
    new-instance p2, Lcom/android/launcher3/q5$G$a;

    .line 32
    .line 33
    invoke-direct {p2, p4}, Lcom/android/launcher3/q5$G$a;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 34
    .line 35
    .line 36
    new-instance p3, Lcom/android/launcher3/q5$G;

    .line 37
    .line 38
    new-instance p4, Lu2/c$a;

    .line 39
    .line 40
    sget-object p5, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 41
    .line 42
    invoke-direct {p4, p5, p0, p1, p2}, Lu2/c$a;-><init>(Ljava/util/concurrent/Executor;Lu2/c$d;Lu2/c$b;Lu2/c$e;)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p3, p4}, Lcom/android/launcher3/q5$G;-><init>(Lu2/l;)V

    .line 46
    .line 47
    .line 48
    return-object p3
.end method


# virtual methods
.method public e(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$G;->a:Lu2/l;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Lu2/l;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationCancelled()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$G;->a:Lu2/l;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/l;->onAnimationCancelled()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    check-cast p5, Lcom/android/launcher3/M2$a;

    invoke-virtual/range {p0 .. p5}, Lcom/android/launcher3/q5$G;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    return-void
.end method

.method public onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 2
    invoke-virtual/range {p0 .. p5}, Lcom/android/launcher3/q5$G;->e(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V

    return-void
.end method
