.class public Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;
.super Ljava/lang/Object;
.source "OverviewInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/InputConsumer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S::",
        "Lcom/android/launcher3/statemanager/a<",
        "TS;>;T::",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ":",
        "Lcom/android/launcher3/statemanager/i<",
        "TS;>;>",
        "Ljava/lang/Object;",
        "Lcom/android/quickstep/InputConsumer;"
    }
.end annotation


# instance fields
.field private final mContainer:Lcom/android/quickstep/views/RecentsViewContainer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/BaseContainerInterface<",
            "*TT;>;"
        }
    .end annotation
.end field

.field private final mGestureState:Lcom/android/quickstep/GestureState;

.field private mHasSetTouchModeForFirstDPadEvent:Z

.field private final mInputMonitor:Lcom/android/systemui/shared/system/InputMonitorCompat;

.field private mIsWaitingForAttachToWindow:Z

.field private final mLocationOnScreen:[I

.field private final mStartingInActivityBounds:Z

.field private final mTarget:Lcom/android/launcher3/views/BaseDragLayer;

.field private mTargetHandledTouch:Z


# direct methods
.method public constructor <init>(Lcom/android/quickstep/GestureState;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/systemui/shared/system/InputMonitorCompat;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/GestureState;",
            "TT;",
            "Lcom/android/systemui/shared/system/InputMonitorCompat;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [I

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mLocationOnScreen:[I

    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mInputMonitor:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 12
    .line 13
    iput-boolean p4, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mStartingInActivityBounds:Z

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 22
    .line 23
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mTarget:Lcom/android/launcher3/views/BaseDragLayer;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mIsWaitingForAttachToWindow:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->setTouchModeChanged(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private setTouchModeChanged(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mHasSetTouchModeForFirstDPadEvent:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewRootImpl;->touchModeChanged(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public allowInterceptByParent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mTargetHandledTouch:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public getDisplayId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Lcom/android/quickstep/views/RecentsViewContainer;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onKeyEvent(Landroid/view/KeyEvent;)V
    .locals 2

    .line 1
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x15

    .line 14
    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/16 v1, 0x16

    .line 18
    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    const/16 v1, 0x18

    .line 22
    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    const/16 v1, 0x19

    .line 26
    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    const/16 v1, 0xa4

    .line 30
    .line 31
    if-eq v0, v1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 35
    .line 36
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-class v1, Landroid/media/session/MediaSessionManager;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/media/session/MediaSessionManager;

    .line 47
    .line 48
    const/high16 v1, -0x80000000

    .line 49
    .line 50
    invoke-virtual {v0, p1, v1}, Landroid/media/session/MediaSessionManager;->dispatchVolumeKeyEventAsSystemService(Landroid/view/KeyEvent;I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mHasSetTouchModeForFirstDPadEvent:Z

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 60
    .line 61
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getRootView()Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    invoke-direct {p0, v0}, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->setTouchModeChanged(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mIsWaitingForAttachToWindow:Z

    .line 76
    .line 77
    if-eqz v1, :cond_4

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    const/4 v1, 0x1

    .line 81
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mIsWaitingForAttachToWindow:Z

    .line 82
    .line 83
    new-instance v1, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer$1;

    .line 84
    .line 85
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer$1;-><init>(Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 89
    .line 90
    .line 91
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 92
    .line 93
    invoke-interface {p0, p1}, Lcom/android/quickstep/views/RecentsViewContainer;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 94
    .line 95
    .line 96
    :cond_5
    return-void
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mStartingInActivityBounds:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    or-int/lit16 v1, v0, 0x100

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->setEdgeFlags(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mStartingInActivityBounds:Z

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v3, 0x0

    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mLocationOnScreen:[I

    .line 21
    .line 22
    aget v4, v1, v3

    .line 23
    .line 24
    neg-int v4, v4

    .line 25
    int-to-float v4, v4

    .line 26
    aget v1, v1, v2

    .line 27
    .line 28
    neg-int v1, v1

    .line 29
    int-to-float v1, v1

    .line 30
    invoke-virtual {p1, v4, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 34
    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->isInExtendedSlopRegion()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    move v1, v3

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mTarget:Lcom/android/launcher3/views/BaseDragLayer;

    .line 47
    .line 48
    iget-boolean v4, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mStartingInActivityBounds:Z

    .line 49
    .line 50
    invoke-virtual {v1, p1, v4}, Lcom/android/launcher3/views/BaseDragLayer;->proxyTouchEvent(Landroid/view/MotionEvent;Z)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    :goto_1
    iget-boolean v4, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mStartingInActivityBounds:Z

    .line 55
    .line 56
    if-nez v4, :cond_4

    .line 57
    .line 58
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mLocationOnScreen:[I

    .line 59
    .line 60
    aget v3, v4, v3

    .line 61
    .line 62
    int-to-float v3, v3

    .line 63
    aget v4, v4, v2

    .line 64
    .line 65
    int-to-float v4, v4

    .line 66
    invoke-virtual {p1, v3, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 67
    .line 68
    .line 69
    :cond_4
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setEdgeFlags(I)V

    .line 70
    .line 71
    .line 72
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mTargetHandledTouch:Z

    .line 73
    .line 74
    if-nez p1, :cond_6

    .line 75
    .line 76
    if-eqz v1, :cond_6

    .line 77
    .line 78
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mTargetHandledTouch:Z

    .line 79
    .line 80
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mStartingInActivityBounds:Z

    .line 81
    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->closeOverlay()V

    .line 87
    .line 88
    .line 89
    const-string p1, "recentapps"

    .line 90
    .line 91
    invoke-static {p1}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_5
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mInputMonitor:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 95
    .line 96
    if-eqz p1, :cond_6

    .line 97
    .line 98
    const-string p1, "Pilfer"

    .line 99
    .line 100
    const-string v0, "pilferPointers"

    .line 101
    .line 102
    invoke-static {p1, v0}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mInputMonitor:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/android/systemui/shared/system/InputMonitorCompat;->pilferPointers()V

    .line 108
    .line 109
    .line 110
    :cond_6
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mHasSetTouchModeForFirstDPadEvent:Z

    .line 111
    .line 112
    if-eqz p1, :cond_7

    .line 113
    .line 114
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 115
    .line 116
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getRootView()Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 121
    .line 122
    .line 123
    :cond_7
    return-void
.end method
