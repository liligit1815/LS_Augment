.class Lcom/android/quickstep/views/RecentsView$24;
.super Landroid/animation/AnimatorListenerAdapter;
.source "RecentsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsView;->createAdjacentPageAnimForTaskLaunch(Lcom/android/quickstep/views/TaskView;)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/RecentsView;

.field final synthetic val$taskView:Lcom/android/quickstep/views/TaskView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/RecentsView$24;->val$taskView:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/RecentsView$24;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/RecentsView$24;->lambda$onAnimationStart$0(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/TaskViewSimulator;->setPivotOverride(Landroid/graphics/PointF;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onAnimationStart$0(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/quickstep/views/RecentsView;->A1(Lcom/android/quickstep/views/RecentsView;)Landroid/graphics/PointF;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/TaskViewSimulator;->setPivotOverride(Landroid/graphics/PointF;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$24;->val$taskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    new-instance p1, Lcom/android/quickstep/views/E1;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/android/quickstep/views/E1;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$24;->val$taskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mTempRect:Landroid/graphics/Rect;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds(Landroid/graphics/Rect;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->access$1200(Lcom/android/quickstep/views/RecentsView;)Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 20
    .line 21
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->A1(Lcom/android/quickstep/views/RecentsView;)Landroid/graphics/PointF;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {p1, v0, v1}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Landroid/graphics/Rect;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/android/quickstep/views/RecentsView;->A1(Lcom/android/quickstep/views/RecentsView;)Landroid/graphics/PointF;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 45
    .line 46
    float-to-int v0, v0

    .line 47
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->A1(Lcom/android/quickstep/views/RecentsView;)Landroid/graphics/PointF;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 54
    .line 55
    float-to-int v1, v1

    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 61
    .line 62
    iget-object v1, v0, Lcom/android/quickstep/views/RecentsView;->mTempRect:Landroid/graphics/Rect;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/android/quickstep/views/RecentsView;->A1(Lcom/android/quickstep/views/RecentsView;)Landroid/graphics/PointF;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v1, p1, v0}, Lcom/android/launcher3/N5;->q(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/PointF;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->A1(Lcom/android/quickstep/views/RecentsView;)Landroid/graphics/PointF;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setPivotX(F)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 83
    .line 84
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->A1(Lcom/android/quickstep/views/RecentsView;)Landroid/graphics/PointF;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setPivotY(F)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$24;->val$taskView:Lcom/android/quickstep/views/TaskView;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_0

    .line 100
    .line 101
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 102
    .line 103
    new-instance v0, Lcom/android/quickstep/views/F1;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/F1;-><init>(Lcom/android/quickstep/views/RecentsView$24;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/RecentsView;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$24;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mBlurUtils:Lcom/android/quickstep/views/BlurUtils;

    .line 114
    .line 115
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/BlurUtils;->setDrawLiveTileBelowRecents(Z)V

    .line 116
    .line 117
    .line 118
    :cond_0
    return-void
.end method
