.class public final Lcom/android/quickstep/views/TaskContainer;
.super Ljava/lang/Object;
.source "TaskContainer.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/TaskContainer$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/views/TaskContainer$Companion;

.field public static final TAG:Ljava/lang/String; = "TaskContainer"


# instance fields
.field private final digitalWellBeingToast:Lcom/android/quickstep/views/DigitalWellBeingToast;

.field private final iconTouchDelegate:Lcom/android/launcher3/util/L2;

.field private final iconView:Lcom/android/quickstep/views/TaskViewIcon;

.field private isLocked:Ljava/lang/Boolean;

.field private isThumbnailValid:Z

.field private final overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay<",
            "*>;"
        }
    .end annotation
.end field

.field private overlayEnabledStatus:Z

.field private final showWindowsView:Landroid/view/View;

.field private final snapshotView:Landroid/view/View;

.field private final stagePosition:I

.field public supportResize:Ljava/lang/Boolean;

.field public supportSplit:Ljava/lang/Boolean;

.field private final task:Lcom/android/systemui/shared/recents/model/Task;

.field private final taskView:Lcom/android/quickstep/views/TaskView;

.field private thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

.field private thumbnailPosition:Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

.field private final titleView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/TaskContainer$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/TaskContainer$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/TaskContainer;->Companion:Lcom/android/quickstep/views/TaskContainer$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;Landroid/view/View;Lcom/android/quickstep/views/TaskViewIcon;Landroid/widget/TextView;Lcom/android/launcher3/util/L2;ILcom/android/quickstep/views/DigitalWellBeingToast;Landroid/view/View;Lcom/android/quickstep/TaskOverlayFactory;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    const-string v0, "taskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "task"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "snapshotView"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "iconView"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "iconTouchDelegate"

    .line 22
    .line 23
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "taskOverlayFactory"

    .line 27
    .line 28
    invoke-static {p10, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/quickstep/views/TaskContainer;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/android/quickstep/views/TaskContainer;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 37
    .line 38
    iput-object p3, p0, Lcom/android/quickstep/views/TaskContainer;->snapshotView:Landroid/view/View;

    .line 39
    .line 40
    iput-object p4, p0, Lcom/android/quickstep/views/TaskContainer;->iconView:Lcom/android/quickstep/views/TaskViewIcon;

    .line 41
    .line 42
    iput-object p5, p0, Lcom/android/quickstep/views/TaskContainer;->titleView:Landroid/widget/TextView;

    .line 43
    .line 44
    iput-object p6, p0, Lcom/android/quickstep/views/TaskContainer;->iconTouchDelegate:Lcom/android/launcher3/util/L2;

    .line 45
    .line 46
    iput p7, p0, Lcom/android/quickstep/views/TaskContainer;->stagePosition:I

    .line 47
    .line 48
    iput-object p8, p0, Lcom/android/quickstep/views/TaskContainer;->digitalWellBeingToast:Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 49
    .line 50
    iput-object p9, p0, Lcom/android/quickstep/views/TaskContainer;->showWindowsView:Landroid/view/View;

    .line 51
    .line 52
    iput-object p11, p0, Lcom/android/quickstep/views/TaskContainer;->isLocked:Ljava/lang/Boolean;

    .line 53
    .line 54
    iput-object p12, p0, Lcom/android/quickstep/views/TaskContainer;->supportSplit:Ljava/lang/Boolean;

    .line 55
    .line 56
    iput-object p13, p0, Lcom/android/quickstep/views/TaskContainer;->supportResize:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 67
    .line 68
    invoke-virtual {p10, p0, p1}, Lcom/android/quickstep/TaskOverlayFactory;->createOverlay(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string p2, "createOverlay(...)"

    .line 73
    .line 74
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 78
    .line 79
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    const-string p1, "Failed requirement."

    .line 84
    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    instance-of p0, p3, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 88
    .line 89
    if-eqz p0, :cond_0

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 93
    .line 94
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p0

    .line 98
    :cond_1
    instance-of p0, p3, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 99
    .line 100
    if-eqz p0, :cond_2

    .line 101
    .line 102
    :goto_0
    return-void

    .line 103
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 104
    .line 105
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    throw p0
.end method


# virtual methods
.method public final addChildForAccessibility(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "outChildren"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/TaskContainer;->iconView:Lcom/android/quickstep/views/TaskViewIcon;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0, p1}, Lcom/android/quickstep/ViewUtils;->addAccessibleChildToList(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/views/TaskContainer;->snapshotView:Landroid/view/View;

    .line 16
    .line 17
    invoke-static {v0, p1}, Lcom/android/quickstep/ViewUtils;->addAccessibleChildToList(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/views/TaskContainer;->showWindowsView:Landroid/view/View;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-static {v0, p1}, Lcom/android/quickstep/ViewUtils;->addAccessibleChildToList(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskContainer;->digitalWellBeingToast:Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {v0, p1}, Lcom/android/quickstep/ViewUtils;->addAccessibleChildToList(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->addChildForAccessibility(Ljava/util/ArrayList;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final bind()V
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "TaskContainer.bind"

    .line 8
    .line 9
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/views/TaskContainer;->digitalWellBeingToast:Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, Lcom/android/quickstep/views/TaskContainer;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 17
    .line 18
    iget-object v3, p0, Lcom/android/quickstep/views/TaskContainer;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 19
    .line 20
    iget-object v4, p0, Lcom/android/quickstep/views/TaskContainer;->snapshotView:Landroid/view/View;

    .line 21
    .line 22
    iget v5, p0, Lcom/android/quickstep/views/TaskContainer;->stagePosition:I

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/quickstep/views/DigitalWellBeingToast;->bind(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/views/TaskView;Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v2, p0, Lcom/android/quickstep/views/TaskContainer;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 45
    .line 46
    invoke-virtual {v1, v2, v3, p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->bind(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;Lcom/android/quickstep/views/TaskView;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-static {}, LK0/a;->b()V

    .line 54
    .line 55
    .line 56
    :cond_3
    return-void

    .line 57
    :goto_1
    if-eqz v0, :cond_4

    .line 58
    .line 59
    invoke-static {}, LK0/a;->b()V

    .line 60
    .line 61
    .line 62
    :cond_4
    throw p0
.end method

.method public final destroy()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "TaskContainer.destroy"

    .line 8
    .line 9
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/views/TaskContainer;->digitalWellBeingToast:Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->destroy()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_2

    .line 22
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/views/TaskContainer;->snapshotView:Landroid/view/View;

    .line 23
    .line 24
    const/high16 v2, 0x3f800000    # 1.0f

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/quickstep/views/TaskContainer;->snapshotView:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleY(F)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->reset()V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x0

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    iput-boolean v2, p0, Lcom/android/quickstep/views/TaskContainer;->isThumbnailValid:Z

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    iput-object v1, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->onRecycle()V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1, v2}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setShowSplashForSplitSelection(Z)V

    .line 64
    .line 65
    .line 66
    :goto_1
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->iconView:Lcom/android/quickstep/views/TaskViewIcon;

    .line 73
    .line 74
    const-string v1, "null cannot be cast to non-null type com.android.quickstep.views.IconAppChipView"

    .line 75
    .line 76
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    check-cast p0, Lcom/android/quickstep/views/IconAppChipView;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/quickstep/views/IconAppChipView;->reset()V

    .line 82
    .line 83
    .line 84
    :cond_3
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    invoke-static {}, LK0/a;->b()V

    .line 89
    .line 90
    .line 91
    :cond_4
    return-void

    .line 92
    :goto_2
    if-eqz v0, :cond_5

    .line 93
    .line 94
    invoke-static {}, LK0/a;->b()V

    .line 95
    .line 96
    .line 97
    :cond_5
    throw p0
.end method

.method public final getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->digitalWellBeingToast:Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getIconTouchDelegate()Lcom/android/launcher3/util/L2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->iconTouchDelegate:Lcom/android/launcher3/util/L2;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getIconView()Lcom/android/quickstep/views/TaskViewIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->iconView:Lcom/android/quickstep/views/TaskViewIcon;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getItemInfo()Lcom/android/launcher3/model/data/E;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/E;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/TaskContainer;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/model/data/E;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final getOverlay()Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getShouldShowSplashView()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->shouldShowSplash$Launcher_aospWithQuickstepInternalMiFavorRelease()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->shouldShowSplashView()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public final getShowWindowsView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->showWindowsView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSnapshotView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->snapshotView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getStagePosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskContainer;->stagePosition:I

    .line 2
    .line 3
    return p0
.end method

.method public final getTask()Lcom/android/systemui/shared/recents/model/Task;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getThumbnail()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0

    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->getThumbnail()Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final getThumbnailData$Launcher_aospWithQuickstepInternalMiFavorRelease()Lcom/android/systemui/shared/recents/model/ThumbnailData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getThumbnailPosition()Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailPosition:Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->snapshotView:Landroid/view/View;

    .line 8
    .line 9
    const-string v0, "null cannot be cast to non-null type com.android.quickstep.task.thumbnail.TaskThumbnailView"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    check-cast p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 18
    .line 19
    const-string v0, "Failed requirement."

    .line 20
    .line 21
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0
.end method

.method public final getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->snapshotView:Landroid/view/View;

    .line 8
    .line 9
    const-string v0, "null cannot be cast to non-null type com.android.quickstep.views.TaskThumbnailViewDeprecated"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    check-cast p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 18
    .line 19
    const-string v0, "Failed requirement."

    .line 20
    .line 21
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0
.end method

.method public final getTitleView()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->titleView:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isLocked()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->isLocked:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isThumbnailValid()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskContainer;->isThumbnailValid:Z

    .line 2
    .line 3
    return p0
.end method

.method public final refreshOverlay(Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "TaskContainer.refreshOverlay"

    .line 8
    .line 9
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iput-object p1, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailPosition:Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/android/quickstep/views/TaskContainer;->overlayEnabledStatus:Z

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->reset()V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_2

    .line 26
    :cond_1
    if-nez p1, :cond_2

    .line 27
    .line 28
    const-string p1, "TaskContainer"

    .line 29
    .line 30
    const-string v1, "Thumbnail position was null during overlay refresh"

    .line 31
    .line 32
    new-instance v2, Ljava/lang/Exception;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->reset()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/quickstep/views/TaskContainer;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 p0, 0x0

    .line 60
    :goto_0
    invoke-virtual {p1}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->getMatrix()Landroid/graphics/Matrix;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {p1}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {v1, v2, p0, v3, p1}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->initOverlay(Lcom/android/systemui/shared/recents/model/Task;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Z)V

    .line 69
    .line 70
    .line 71
    :goto_1
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    invoke-static {}, LK0/a;->b()V

    .line 76
    .line 77
    .line 78
    :cond_4
    return-void

    .line 79
    :goto_2
    if-eqz v0, :cond_5

    .line 80
    .line 81
    invoke-static {}, LK0/a;->b()V

    .line 82
    .line 83
    .line 84
    :cond_5
    throw p0
.end method

.method public final setLocked(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskContainer;->isLocked:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public final setOverlayEnabled(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setOverlayEnabled(Z)V

    :cond_0
    return-void
.end method

.method public final setOverlayEnabled(ZLcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;)V
    .locals 1

    .line 3
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskContainer;->overlayEnabledStatus:Z

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailPosition:Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    invoke-static {v0, p2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 5
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskContainer;->overlayEnabledStatus:Z

    .line 6
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/TaskContainer;->refreshOverlay(Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;)V

    :cond_1
    return-void
.end method

.method public final setState(Lcom/android/quickstep/recents/ui/viewmodel/TaskData;ZZLandroid/view/View$OnClickListener;)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "TaskContainer.setState"

    .line 8
    .line 9
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->INSTANCE:Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;

    .line 17
    .line 18
    invoke-virtual {v2, p1, p2, p3, p4}, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->toTaskThumbnailUiState(Lcom/android/quickstep/recents/ui/viewmodel/TaskData;ZZLandroid/view/View$OnClickListener;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const/4 p3, 0x0

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData;->getTaskId()I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move-object p4, p3

    .line 37
    :goto_0
    invoke-virtual {v1, p2, p4}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->setState(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;Ljava/lang/Integer;)V

    .line 38
    .line 39
    .line 40
    instance-of p2, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 41
    .line 42
    if-eqz p2, :cond_2

    .line 43
    .line 44
    check-cast p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    :cond_2
    iput-object p3, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/quickstep/views/TaskContainer;->overlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 53
    .line 54
    invoke-virtual {p0, p3}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->setThumbnailState(Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 55
    .line 56
    .line 57
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-static {}, LK0/a;->b()V

    .line 62
    .line 63
    .line 64
    :cond_3
    return-void

    .line 65
    :goto_1
    if-eqz v0, :cond_4

    .line 66
    .line 67
    invoke-static {}, LK0/a;->b()V

    .line 68
    .line 69
    .line 70
    :cond_4
    throw p0
.end method

.method public final setThumbnailPosition(Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskContainer;->thumbnailPosition:Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 2
    .line 3
    return-void
.end method

.method public final setThumbnailValid$Launcher_aospWithQuickstepInternalMiFavorRelease(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskContainer;->isThumbnailValid:Z

    .line 2
    .line 3
    return-void
.end method

.method public final updateMenuOpenProgress(F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->updateMenuOpenProgress(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final updateThumbnailMatrix(Landroid/graphics/Matrix;)V
    .locals 1

    .line 1
    const-string v0, "matrix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final updateThumbnailSplashProgress(F)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->updateSplashAlpha(F)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setSplashAlpha(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final updateTintAmount(F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->updateTintAmount(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
