.class Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;
.super Ljava/lang/Object;
.source "LauncherUnfoldAnimationController.java"

# interfaces
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/LauncherUnfoldAnimationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "QsbAnimationListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;Lcom/android/quickstep/util/p0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;-><init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)V

    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->c(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/util/u0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->c(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/util/u0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p0, v0}, Lcom/android/launcher3/util/u0;->b(F)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public bridge synthetic onTransitionFinishing()V
    .locals 0

    .line 1
    invoke-super {p0}, LC2/i$a;->onTransitionFinishing()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->c(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/util/u0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    sub-float/2addr v0, p1

    .line 12
    const p1, 0x3d23d70a    # 0.04f

    .line 13
    .line 14
    .line 15
    mul-float/2addr v0, p1

    .line 16
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->c(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/util/u0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0, v0}, Lcom/android/launcher3/util/u0;->b(F)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onTransitionStarted()V
    .locals 0

    .line 1
    return-void
.end method
