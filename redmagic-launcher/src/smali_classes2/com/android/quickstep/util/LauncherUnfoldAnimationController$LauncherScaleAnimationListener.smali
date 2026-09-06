.class Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;
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
    name = "LauncherScaleAnimationListener"
.end annotation


# static fields
.field private static final SCALE_LAUNCHER_FROM:F = 0.92f


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;Lcom/android/quickstep/util/p0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;-><init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)V

    return-void
.end method

.method private setScale(F)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->e()Landroid/util/FloatProperty;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->b(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1, p1}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->d()Landroid/util/FloatProperty;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->b(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0, p1}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;->setScale(F)V

    .line 4
    .line 5
    .line 6
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
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const v2, 0x3f6b851f    # 0.92f

    .line 5
    .line 6
    .line 7
    invoke-static {v2, v0, v1, v0, p1}, Landroid/util/MathUtils;->constrainedMap(FFFFF)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;->setScale(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onTransitionStarted()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->b(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;->this$0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->b(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/Workspace;->setPivotToScaleWithSelf(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
