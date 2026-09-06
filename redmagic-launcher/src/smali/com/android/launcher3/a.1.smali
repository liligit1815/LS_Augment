.class public abstract Lcom/android/launcher3/a;
.super Landroid/widget/LinearLayout;
.source "AbstractFloatingView.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;
.implements Landroid/window/OnBackAnimationCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x22
.end annotation


# static fields
.field public static final TYPE_ACCESSIBLE:I = 0x7d2afc97

.field public static final TYPE_ACTION_POPUP:I = 0x2

.field public static final TYPE_ADD_TO_HOME_CONFIRMATION:I = 0x80000

.field public static final TYPE_ALL:I = 0x7ffeffff

.field public static final TYPE_ALL_APPS_EDU:I = 0x200

.field public static final TYPE_ALL_APPS_SORT_MENU:I = 0x4000000

.field public static final TYPE_COLOR_PICKER_POP:I = 0x8000000

.field public static final TYPE_DISCOVERY_BOUNCE:I = 0x40

.field public static final TYPE_DRAG_DROP_POPUP:I = 0x400

.field public static final TYPE_FOLDER:I = 0x1

.field public static final TYPE_FOLDER_BATCH:I = 0x1000000

.field public static final TYPE_ICON_SURFACE:I = 0x2000

.field public static final TYPE_LISTENER:I = 0x100

.field public static final TYPE_MFV_ALL_CLEAR_BUTTON:I = 0x2000000

.field public static final TYPE_ONE_GRID_MIGRATION_EDU:I = 0x800000

.field public static final TYPE_ON_BOARD_POPUP:I = 0x20

.field public static final TYPE_OPTIONS_POPUP:I = 0x1000

.field public static final TYPE_OPTIONS_POPUP_DIALOG:I = 0x4000

.field public static final TYPE_PIN_IME_POPUP:I = 0x400000

.field public static final TYPE_PIN_WIDGET_FROM_EXTERNAL_POPUP:I = 0x8000

.field public static final TYPE_REBIND_SAFE:I = 0x70d66274

.field public static final TYPE_SNACKBAR:I = 0x80

.field public static final TYPE_STATUS_BAR_SWIPE_DOWN_DISALLOW:I = 0x78000c7d

.field public static final TYPE_STREAMER_WIDGETS_CUSTOM_TRANSFORM:I = 0x40000000

.field public static final TYPE_STREAMER_WIDGETS_DETAIL:I = 0x20000000

.field public static final TYPE_STREAMER_WIDGETS_FULL:I = 0x10000000

.field public static final TYPE_TASKBAR_ALL_APPS:I = 0x40000

.field public static final TYPE_TASKBAR_EDUCATION_DIALOG:I = 0x20000

.field public static final TYPE_TASKBAR_OVERLAYS:I = 0x60000

.field public static final TYPE_TASKBAR_OVERLAY_PROXY:I = 0x100000

.field public static final TYPE_TASKBAR_PINNING_POPUP:I = 0x200000

.field public static final TYPE_TASK_MENU:I = 0x800

.field public static final TYPE_TOUCH_CONTROLLER_NO_INTERCEPT:I = 0x7ff8febf

.field public static final TYPE_WIDGETS_BOTTOM_SHEET:I = 0x4

.field public static final TYPE_WIDGETS_FULL_SHEET:I = 0x10

.field public static final TYPE_WIDGET_RESIZE_FRAME:I = 0x8


# instance fields
.field protected mIsOpen:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static closeAllOpenViews(Lcom/android/launcher3/views/k;)V
    .locals 1

    const/4 v0, 0x1

    .line 3
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V

    return-void
.end method

.method public static closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V
    .locals 1

    const v0, 0x7ffeffff

    .line 1
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 2
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->finishAutoCancelActionMode()Z

    return-void
.end method

.method public static closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;I)V
    .locals 1

    const/4 v0, 0x1

    .line 3
    invoke-static {p0, v0, p1}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    return-void
.end method

.method public static closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V
    .locals 1

    const v0, 0x7ffeffff

    not-int p2, p2

    and-int/2addr p2, v0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 2
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->finishAutoCancelActionMode()Z

    return-void
.end method

.method public static closeOpenContainer(Lcom/android/launcher3/views/k;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static closeOpenViews(Lcom/android/launcher3/views/k;ZI)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0, p1, p2}, Lcom/android/launcher3/b;->a(Lcom/android/launcher3/views/k;ZI)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static getAnyView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/a;",
            ">(",
            "Lcom/android/launcher3/views/k;",
            "I)TT;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/a;->getView(Lcom/android/launcher3/views/k;IZ)Lcom/android/launcher3/a;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/a;",
            ">(",
            "Lcom/android/launcher3/views/k;",
            "I)TT;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/a;->getView(Lcom/android/launcher3/views/k;IZ)Lcom/android/launcher3/a;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;
    .locals 1

    .line 1
    const v0, 0x7ffeffff

    .line 2
    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static getView(Lcom/android/launcher3/views/k;IZ)Lcom/android/launcher3/a;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/a;",
            ">(",
            "Lcom/android/launcher3/views/k;",
            "IZ)TT;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

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
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, -0x1

    .line 14
    .line 15
    :goto_0
    if-ltz v1, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    instance-of v3, v2, Lcom/android/launcher3/a;

    .line 22
    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    check-cast v2, Lcom/android/launcher3/a;

    .line 26
    .line 27
    invoke-virtual {v2, p1}, Lcom/android/launcher3/a;->isOfType(I)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/android/launcher3/a;->isOpen()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    :cond_1
    return-object v2

    .line 42
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    return-object v0
.end method

.method public static hasOpenView(Lcom/android/launcher3/views/k;I)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method


# virtual methods
.method public addHintCloseAnim(FLandroid/view/animation/Interpolator;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected announceAccessibilityChanges()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->getAccessibilityTarget()Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->isAccessibilityEnabled(Landroid/content/Context;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Landroid/view/View;

    .line 21
    .line 22
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendCustomAccessibilityEvent(Landroid/view/View;ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/a;->getAccessibilityInitialFocusView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/a;->getAccessibilityInitialFocusView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/16 v1, 0x40

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 60
    .line 61
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/16 v0, 0x800

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->sendAccessibilityEvent(I)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public canHandleBack()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public canInterceptEventsInSystemGestureRegion()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final close(Z)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/2addr p1, v0

    .line 6
    const-wide/16 v0, 0x3e8

    .line 7
    .line 8
    invoke-static {v0, v1}, Lx1/O;->p4(J)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->handleClose(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected getAccessibilityInitialFocusView()Landroid/view/View;
    .locals 0

    .line 1
    return-object p0
.end method

.method protected getAccessibilityTarget()Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method protected abstract handleClose(Z)V
.end method

.method protected abstract isOfType(I)Z
.end method

.method public final isOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method public onBackInvoked()V
    .locals 5

    .line 1
    const/high16 v0, 0x2000000

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->isOfType(I)Z

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
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/16 v1, 0x100

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->isOfType(I)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    instance-of v1, v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    move-object v1, v0

    .line 28
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/q5;->g0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/android/launcher3/V3;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    sget-object v4, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 63
    .line 64
    if-ne v1, v4, :cond_1

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Lcom/android/launcher3/V3;->E(Lcom/android/launcher3/C2;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->g0:Z

    .line 82
    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    if-eqz v3, :cond_2

    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const/high16 v1, 0x3f800000    # 1.0f

    .line 96
    .line 97
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 108
    .line 109
    .line 110
    :cond_2
    :goto_0
    return-void

    .line 111
    :cond_3
    invoke-virtual {p0, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public shrink(Z)V
    .locals 0

    .line 1
    return-void
.end method
