.class public final Lcom/android/quickstep/HomeVisibilityState$init$1;
.super Lcom/android/wm/shell/shared/k$a;
.source "HomeVisibilityState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/HomeVisibilityState;->init(Lcom/android/wm/shell/shared/l;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/HomeVisibilityState;


# direct methods
.method constructor <init>(Lcom/android/quickstep/HomeVisibilityState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/HomeVisibilityState$init$1;->this$0:Lcom/android/quickstep/HomeVisibilityState;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/wm/shell/shared/k$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/HomeVisibilityState;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/HomeVisibilityState$init$1;->onHomeVisibilityChanged$lambda$1(Lcom/android/quickstep/HomeVisibilityState;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onHomeVisibilityChanged$lambda$1(Lcom/android/quickstep/HomeVisibilityState;Z)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/HomeVisibilityState;->access$setHomeVisible$p(Lcom/android/quickstep/HomeVisibilityState;Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/android/quickstep/HomeVisibilityState;->access$getListeners$p(Lcom/android/quickstep/HomeVisibilityState;)Ljava/util/Set;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;

    .line 23
    .line 24
    invoke-interface {v0, p1}, Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;->onHomeVisibilityChanged(Z)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public onDisplayInsetsChanged(Landroid/view/InsetsState;)V
    .locals 3

    .line 1
    const-string v0, "insetsState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/InsetsState;->getDisplayFrame()Landroid/graphics/Rect;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/InsetsState;->calculateInsets(Landroid/graphics/Rect;IZ)Landroid/graphics/Insets;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v0, v0, Landroid/graphics/Insets;->bottom:I

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/HomeVisibilityState$init$1;->this$0:Lcom/android/quickstep/HomeVisibilityState;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/InsetsState;->getDisplayFrame()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 28
    .line 29
    sub-int/2addr p1, v0

    .line 30
    invoke-virtual {p0, p1}, Lcom/android/quickstep/HomeVisibilityState;->setNavbarInsetPosition(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onHomeVisibilityChanged(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/HomeVisibilityState$init$1;->this$0:Lcom/android/quickstep/HomeVisibilityState;

    .line 8
    .line 9
    new-instance v1, Lcom/android/quickstep/e1;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/e1;-><init>(Lcom/android/quickstep/HomeVisibilityState;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->R(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
