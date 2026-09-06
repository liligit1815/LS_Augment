.class public final Lcom/android/launcher3/uioverrides/touchcontrollers/w;
.super Ljava/lang/Object;
.source "PortraitOverviewStateTouchHelper.java"


# instance fields
.field a:Lcom/android/quickstep/views/RecentsView;

.field b:Lcom/android/launcher3/C2;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->b:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method a(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->hasTaskViews()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->b:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-le v0, v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Lcom/android/quickstep/views/RecentsView;->getTaskViewAt(I)Lcom/android/quickstep/views/TaskView;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getY()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->getTaskViewAt(I)Lcom/android/quickstep/views/TaskView;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    int-to-float p0, p0

    .line 56
    add-float/2addr v0, p0

    .line 57
    cmpl-float p0, p1, v0

    .line 58
    .line 59
    if-ltz p0, :cond_0

    .line 60
    .line 61
    return v2

    .line 62
    :cond_0
    return v1

    .line 63
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBottom()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    int-to-float p0, p0

    .line 78
    cmpl-float p0, p1, p0

    .line 79
    .line 80
    if-ltz p0, :cond_2

    .line 81
    .line 82
    return v2

    .line 83
    :cond_2
    return v1

    .line 84
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->b:Lcom/android/launcher3/C2;

    .line 85
    .line 86
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->isTouchOverHotseat(Lcom/android/launcher3/C2;Landroid/view/MotionEvent;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0
.end method

.method b(JLandroid/view/animation/Interpolator;)Lcom/android/launcher3/anim/V;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 19
    .line 20
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView;->createTaskLaunchAnimation(Lcom/android/quickstep/views/TaskView;JLandroid/view/animation/Interpolator;)Lcom/android/launcher3/anim/V;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 26
    .line 27
    const-string p1, "There is no task view to animate to."

    .line 28
    .line 29
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p0
.end method

.method c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getNextPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->shouldSwipeDownLaunchApp()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method
