.class Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;
.super Ljava/lang/Object;
.source "LauncherUnfoldAnimationController.java"

# interfaces
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/LauncherUnfoldAnimationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TransitionStatusProvider"
.end annotation


# instance fields
.field private mHasRun:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->mHasRun:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/util/p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;-><init>()V

    return-void
.end method

.method private markAsRun()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->mHasRun:Z

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public hasRun()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->mHasRun:Z

    .line 2
    .line 3
    return p0
.end method

.method public onFolded()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->mHasRun:Z

    .line 3
    .line 4
    return-void
.end method

.method public onTransitionFinished()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->markAsRun()V

    .line 2
    .line 3
    .line 4
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
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->markAsRun()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTransitionStarted()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->markAsRun()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
