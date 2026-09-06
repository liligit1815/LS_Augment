.class Lcom/android/launcher3/taskbar/q4$a;
.super Ljava/lang/Object;
.source "TaskbarUnfoldAnimationController.java"

# interfaces
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/q4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/q4;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/taskbar/q4;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/taskbar/q4;Lcom/android/launcher3/taskbar/r4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/q4$a;-><init>(Lcom/android/launcher3/taskbar/q4;)V

    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/q4;->c(Lcom/android/launcher3/taskbar/q4;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->onTransitionFinished()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/taskbar/q4;->c(Lcom/android/launcher3/taskbar/q4;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->clearRegisteredViews()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/launcher3/taskbar/q4;->d(Lcom/android/launcher3/taskbar/q4;)Lcom/android/launcher3/taskbar/s2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s2;->B(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/q4;->c(Lcom/android/launcher3/taskbar/q4;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->onTransitionProgress(F)V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    sub-float/2addr v0, p1

    .line 13
    const p1, 0x3d0f5c29    # 0.035f

    .line 14
    .line 15
    .line 16
    mul-float/2addr v0, p1

    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/launcher3/taskbar/q4;->d(Lcom/android/launcher3/taskbar/q4;)Lcom/android/launcher3/taskbar/s2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s2;->B(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onTransitionStarted()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/q4;->c(Lcom/android/launcher3/taskbar/q4;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->updateDisplayProperties()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/taskbar/q4;->e(Lcom/android/launcher3/taskbar/q4;)Lcom/android/launcher3/taskbar/W4;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/W4;->N()[Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    array-length v1, v0

    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_0
    if-ge v2, v1, :cond_0

    .line 23
    .line 24
    aget-object v3, v0, v2

    .line 25
    .line 26
    iget-object v4, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 27
    .line 28
    invoke-static {v4}, Lcom/android/launcher3/taskbar/q4;->c(Lcom/android/launcher3/taskbar/q4;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v4, v3}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->registerViewForAnimation(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q4$a;->g:Lcom/android/launcher3/taskbar/q4;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/android/launcher3/taskbar/q4;->c(Lcom/android/launcher3/taskbar/q4;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->onTransitionStarted()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
