.class Lcom/android/quickstep/LauncherSwipeHandlerV2$2;
.super Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;->createHomeAnimationFactory(Ljava/util/List;JZZLandroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mZoomRatio:F

.field final synthetic this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

.field final synthetic val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/B1;)V

    .line 7
    .line 8
    .line 9
    const/high16 p1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    iput p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->mZoomRatio:F

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getEndRadius(Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const p1, 0x7f07082d

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method protected getWindowAlpha(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public getWindowTargetRect()Landroid/graphics/RectF;
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 10
    .line 11
    iget-object v2, v1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 12
    .line 13
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->G0:Z

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    iget-boolean v2, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    sget-object v2, Lx1/r;->H:Lcom/android/launcher3/util/I;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mMiniWindowTipsView:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 34
    .line 35
    if-eqz v1, :cond_5

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Lcom/android/quickstep/views/MiniWindowTipsView;->getViewRect(Landroid/graphics/RectF;)V

    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 42
    .line 43
    iget-object v2, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 44
    .line 45
    check-cast v2, Lcom/android/launcher3/v;

    .line 46
    .line 47
    iget-object v3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 48
    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    iget v3, v3, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 v3, -0x1

    .line 55
    :goto_0
    iget-boolean v4, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 56
    .line 57
    const/4 v5, 0x2

    .line 58
    if-nez v4, :cond_3

    .line 59
    .line 60
    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mFullScreenToWindowSmallOrMini:Z

    .line 61
    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    const/4 v5, 0x0

    .line 66
    goto :goto_1

    .line 67
    :cond_3
    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    .line 68
    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    const/4 v5, 0x1

    .line 72
    :cond_4
    :goto_1
    invoke-static {v2, v3, v5, v0}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->getMiniWindowRectF(Lcom/android/launcher3/v;IILandroid/graphics/RectF;)F

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    iput v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->mZoomRatio:F

    .line 77
    .line 78
    :cond_5
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v2, "rectF "

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, " "

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->mZoomRatio:F

    .line 97
    .line 98
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const-string v1, "LauncherSwipeHandlerV2"

    .line 106
    .line 107
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    return-object v0
.end method

.method public playAtomicAnimation(FLandroid/animation/AnimatorSet;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-boolean v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    sget-object v1, Lx1/r;->H:Lcom/android/launcher3/util/I;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$2;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mMiniWindowTipsView:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/MiniWindowTipsView;->setCurrentState(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->playAtomicAnimation(FLandroid/animation/AnimatorSet;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
