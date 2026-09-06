.class public final Lcom/android/quickstep/views/DesktopTaskView;
.super Lcom/android/quickstep/views/TaskView;
.source "DesktopTaskView.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/DesktopTaskView$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/views/DesktopTaskView$Companion;

.field private static final DEBUG:Z = false

.field private static final DEFAULT_BOUNDS:Landroid/graphics/Rect;

.field private static final TAG:Ljava/lang/String; = "DesktopTaskView"

.field private static final TEMP_FROM_RECTF:Landroid/graphics/RectF;

.field private static final TEMP_OVERVIEW_TASK_POSITION:Landroid/graphics/Rect;

.field private static final TEMP_TO_RECTF:Landroid/graphics/RectF;

.field private static final VIEW_POOL_INITIAL_SIZE:I = 0x0

.field private static final VIEW_POOL_MAX_SIZE:I = 0x5


# instance fields
.field private backgroundView:Landroid/view/View;

.field private contentView:Lcom/android/quickstep/views/DesktopTaskContentView;

.field private final contentViewFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

.field private desktopTask:Lcom/android/quickstep/util/DesktopTask;

.field private explodeProgress:F

.field private fullscreenTaskPositions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;",
            ">;"
        }
    .end annotation
.end field

.field private iconView:Lcom/android/quickstep/views/TaskViewIcon;

.field private final lastComputedTaskSize:Landroid/graphics/Rect;

.field private remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

.field private final taskThumbnailViewDeprecatedPool:Lcom/android/launcher3/util/b3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/b3<",
            "Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;",
            ">;"
        }
    .end annotation
.end field

.field private final taskThumbnailViewPool:Lcom/android/launcher3/util/b3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/b3<",
            "Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;",
            ">;"
        }
    .end annotation
.end field

.field private final tempPointF:Landroid/graphics/PointF;

.field private viewModel:Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/DesktopTaskView$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/DesktopTaskView$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/DesktopTaskView;->Companion:Lcom/android/quickstep/views/DesktopTaskView$Companion;

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/views/DesktopTaskView;->DEFAULT_BOUNDS:Landroid/graphics/Rect;

    .line 15
    .line 16
    new-instance v0, Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/android/quickstep/views/DesktopTaskView;->TEMP_OVERVIEW_TASK_POSITION:Landroid/graphics/Rect;

    .line 22
    .line 23
    new-instance v0, Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/android/quickstep/views/DesktopTaskView;->TEMP_FROM_RECTF:Landroid/graphics/RectF;

    .line 29
    .line 30
    new-instance v0, Landroid/graphics/RectF;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/quickstep/views/DesktopTaskView;->TEMP_TO_RECTF:Landroid/graphics/RectF;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/DesktopTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    sget-object v7, Lcom/android/quickstep/views/TaskViewType;->DESKTOP:Lcom/android/quickstep/views/TaskViewType;

    .line 4
    new-instance v8, Lcom/android/quickstep/DesktopFullscreenDrawParams;

    const/4 v0, 0x2

    const/4 v11, 0x0

    invoke-direct {v8, p1, v11, v0, v11}, Lcom/android/quickstep/DesktopFullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;ILkotlin/jvm/internal/j;)V

    const/16 v9, 0x3c

    const/4 v10, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 5
    invoke-direct/range {v0 .. v10}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    .line 6
    new-instance v0, Lcom/android/quickstep/FullscreenDrawParams;

    const/4 v4, 0x6

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/FullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;Lu4/l;ILkotlin/jvm/internal/j;)V

    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentViewFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 7
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    move-result v0

    if-nez v0, :cond_0

    .line 8
    new-instance v0, Lcom/android/launcher3/util/b3;

    const/4 v4, 0x5

    const/4 v5, 0x0

    const v3, 0x7f0e0222

    move-object v2, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/b3;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;III)V

    goto :goto_0

    :cond_0
    move-object v0, v11

    .line 9
    :goto_0
    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->taskThumbnailViewDeprecatedPool:Lcom/android/launcher3/util/b3;

    .line 10
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 11
    new-instance v0, Lcom/android/launcher3/util/b3;

    const/4 v4, 0x5

    const/4 v5, 0x0

    const v3, 0x7f0e0221

    move-object v2, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/b3;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;III)V

    move-object v11, v0

    .line 12
    :cond_1
    iput-object v11, p0, Lcom/android/quickstep/views/DesktopTaskView;->taskThumbnailViewPool:Lcom/android/launcher3/util/b3;

    .line 13
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->tempPointF:Landroid/graphics/PointF;

    .line 14
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->lastComputedTaskSize:Landroid/graphics/Rect;

    .line 15
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->fullscreenTaskPositions:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 2
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/DesktopTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic D(Lcom/android/launcher3/util/Y1;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/DesktopTaskView;->launchTaskWithDesktopController$lambda$22(Lcom/android/launcher3/util/Y1;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Lu4/l;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/DesktopTaskView;->launchWithoutAnimation$lambda$23(Lu4/l;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getRemoteTargetHandle(I)Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    array-length v1, p0

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_1

    .line 9
    .line 10
    aget-object v3, p0, v2

    .line 11
    .line 12
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-virtual {v4}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTargetTaskId()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-ne v4, p1, :cond_0

    .line 25
    .line 26
    return-object v3

    .line 27
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-object v0
.end method

.method private final launchTaskWithDesktopController(Z)Lcom/android/launcher3/util/Y1;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "toString(...)"

    .line 18
    .line 19
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v3, "Main"

    .line 23
    .line 24
    const-string v4, "launchDesktopFromRecents"

    .line 25
    .line 26
    invoke-static {v3, v4, v1}, Lcom/android/launcher3/testing/K;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Lcom/android/launcher3/util/Y1;

    .line 30
    .line 31
    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getDesktopRecentsController()Lj1/k;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    new-instance v4, Lcom/android/quickstep/views/e;

    .line 41
    .line 42
    invoke-direct {v4, v1}, Lcom/android/quickstep/views/e;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, p0, p1, v4}, Lj1/k;->a(Lcom/android/quickstep/views/DesktopTaskView;ZLjava/util/function/Consumer;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v3, "launchTaskWithDesktopController: "

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p0, ", withRemoteTransition: "

    .line 73
    .line 74
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "DesktopTaskView"

    .line 85
    .line 86
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->addSideTaskLaunchCallback(Lcom/android/launcher3/util/Y1;)V

    .line 90
    .line 91
    .line 92
    return-object v1

    .line 93
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 94
    .line 95
    const-string p1, "recentsController is null"

    .line 96
    .line 97
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    throw p0
.end method

.method private static final launchTaskWithDesktopController$lambda$22(Lcom/android/launcher3/util/Y1;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final launchWithoutAnimation$lambda$23(Lu4/l;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final positionTaskWindows()V
    .locals 15

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_5

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v0, v0, Lcom/android/launcher3/h0;->S2:I

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 34
    .line 35
    sub-int/2addr v2, v0

    .line 36
    iget-object v0, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v4, p0, Lcom/android/quickstep/views/DesktopTaskView;->tempPointF:Landroid/graphics/PointF;

    .line 47
    .line 48
    invoke-static {v0, v3, v4}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->tempPointF:Landroid/graphics/PointF;

    .line 52
    .line 53
    iget v3, v0, Landroid/graphics/PointF;->x:F

    .line 54
    .line 55
    float-to-int v3, v3

    .line 56
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 57
    .line 58
    float-to-int v0, v0

    .line 59
    new-instance v4, Landroid/graphics/Rect;

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    invoke-direct {v4, v5, v5, v3, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 63
    .line 64
    .line 65
    int-to-float v1, v1

    .line 66
    int-to-float v3, v3

    .line 67
    div-float/2addr v1, v3

    .line 68
    int-to-float v2, v2

    .line 69
    int-to-float v0, v0

    .line 70
    div-float/2addr v2, v0

    .line 71
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_e

    .line 84
    .line 85
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    check-cast v3, Lcom/android/quickstep/views/TaskContainer;

    .line 90
    .line 91
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    iget-object v5, v5, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 96
    .line 97
    iget v5, v5, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 98
    .line 99
    iget-object v6, p0, Lcom/android/quickstep/views/DesktopTaskView;->fullscreenTaskPositions:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    const/4 v8, 0x0

    .line 110
    if-eqz v7, :cond_3

    .line 111
    .line 112
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v7

    .line 116
    move-object v9, v7

    .line 117
    check-cast v9, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 118
    .line 119
    invoke-virtual {v9}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getTaskId()I

    .line 120
    .line 121
    .line 122
    move-result v9

    .line 123
    if-ne v9, v5, :cond_2

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_3
    move-object v7, v8

    .line 127
    :goto_1
    check-cast v7, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 128
    .line 129
    if-nez v7, :cond_4

    .line 130
    .line 131
    goto/16 :goto_5

    .line 132
    .line 133
    :cond_4
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    if-eqz v6, :cond_8

    .line 138
    .line 139
    iget-object v6, p0, Lcom/android/quickstep/views/DesktopTaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;

    .line 140
    .line 141
    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6}, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;->getOrganizedDesktopTaskPositions()Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    :cond_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 153
    .line 154
    .line 155
    move-result v9

    .line 156
    if-eqz v9, :cond_6

    .line 157
    .line 158
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v9

    .line 162
    move-object v10, v9

    .line 163
    check-cast v10, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 164
    .line 165
    invoke-virtual {v10}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getTaskId()I

    .line 166
    .line 167
    .line 168
    move-result v10

    .line 169
    if-ne v10, v5, :cond_5

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_6
    move-object v9, v8

    .line 173
    :goto_2
    check-cast v9, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 174
    .line 175
    if-eqz v9, :cond_7

    .line 176
    .line 177
    sget-object v6, Lcom/android/quickstep/views/DesktopTaskView;->TEMP_OVERVIEW_TASK_POSITION:Landroid/graphics/Rect;

    .line 178
    .line 179
    invoke-virtual {v7}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getBounds()Landroid/graphics/Rect;

    .line 180
    .line 181
    .line 182
    move-result-object v10

    .line 183
    invoke-virtual {v9}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getBounds()Landroid/graphics/Rect;

    .line 184
    .line 185
    .line 186
    move-result-object v9

    .line 187
    iget v11, p0, Lcom/android/quickstep/views/DesktopTaskView;->explodeProgress:F

    .line 188
    .line 189
    invoke-static {v6, v10, v9, v11}, Lj2/a;->a(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;F)V

    .line 190
    .line 191
    .line 192
    if-eqz v6, :cond_7

    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_7
    invoke-virtual {v7}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getBounds()Landroid/graphics/Rect;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    goto :goto_3

    .line 200
    :cond_8
    invoke-virtual {v7}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getBounds()Landroid/graphics/Rect;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    :goto_3
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 205
    .line 206
    .line 207
    move-result v9

    .line 208
    if-eqz v9, :cond_9

    .line 209
    .line 210
    invoke-direct {p0, v5}, Lcom/android/quickstep/views/DesktopTaskView;->getRemoteTargetHandle(I)Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 211
    .line 212
    .line 213
    move-result-object v5

    .line 214
    if-eqz v5, :cond_9

    .line 215
    .line 216
    sget-object v9, Lcom/android/quickstep/views/DesktopTaskView;->TEMP_FROM_RECTF:Landroid/graphics/RectF;

    .line 217
    .line 218
    invoke-virtual {v7}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getBounds()Landroid/graphics/Rect;

    .line 219
    .line 220
    .line 221
    move-result-object v7

    .line 222
    invoke-virtual {v9, v7}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v9, v1}, Landroid/graphics/RectF;->scale(F)V

    .line 226
    .line 227
    .line 228
    iget-object v7, p0, Lcom/android/quickstep/views/DesktopTaskView;->lastComputedTaskSize:Landroid/graphics/Rect;

    .line 229
    .line 230
    iget v10, v7, Landroid/graphics/Rect;->left:I

    .line 231
    .line 232
    int-to-float v10, v10

    .line 233
    iget v7, v7, Landroid/graphics/Rect;->top:I

    .line 234
    .line 235
    int-to-float v7, v7

    .line 236
    invoke-virtual {v9, v10, v7}, Landroid/graphics/RectF;->offset(FF)V

    .line 237
    .line 238
    .line 239
    sget-object v7, Lcom/android/quickstep/views/DesktopTaskView;->TEMP_TO_RECTF:Landroid/graphics/RectF;

    .line 240
    .line 241
    invoke-virtual {v7, v6}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v7, v1}, Landroid/graphics/RectF;->scale(F)V

    .line 245
    .line 246
    .line 247
    iget-object v10, p0, Lcom/android/quickstep/views/DesktopTaskView;->lastComputedTaskSize:Landroid/graphics/Rect;

    .line 248
    .line 249
    iget v11, v10, Landroid/graphics/Rect;->left:I

    .line 250
    .line 251
    int-to-float v11, v11

    .line 252
    iget v10, v10, Landroid/graphics/Rect;->top:I

    .line 253
    .line 254
    int-to-float v10, v10

    .line 255
    invoke-virtual {v7, v11, v10}, Landroid/graphics/RectF;->offset(FF)V

    .line 256
    .line 257
    .line 258
    new-instance v10, Landroid/graphics/Matrix;

    .line 259
    .line 260
    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 261
    .line 262
    .line 263
    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 264
    .line 265
    invoke-virtual {v10, v9, v7, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 266
    .line 267
    .line 268
    invoke-virtual {v5}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 269
    .line 270
    .line 271
    move-result-object v7

    .line 272
    invoke-virtual {v7, v10}, Lcom/android/quickstep/util/TaskViewSimulator;->setTaskRectTransform(Landroid/graphics/Matrix;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v5}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 276
    .line 277
    .line 278
    move-result-object v7

    .line 279
    invoke-virtual {v5}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 280
    .line 281
    .line 282
    move-result-object v5

    .line 283
    invoke-virtual {v7, v5}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;)V

    .line 284
    .line 285
    .line 286
    :cond_9
    iget v5, v6, Landroid/graphics/Rect;->left:I

    .line 287
    .line 288
    int-to-float v5, v5

    .line 289
    mul-float/2addr v5, v1

    .line 290
    iget v7, v6, Landroid/graphics/Rect;->top:I

    .line 291
    .line 292
    int-to-float v7, v7

    .line 293
    mul-float/2addr v7, v2

    .line 294
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    .line 295
    .line 296
    .line 297
    move-result v9

    .line 298
    int-to-float v9, v9

    .line 299
    mul-float/2addr v9, v1

    .line 300
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    .line 301
    .line 302
    .line 303
    move-result v10

    .line 304
    int-to-float v10, v10

    .line 305
    mul-float/2addr v10, v2

    .line 306
    iget v11, p0, Lcom/android/quickstep/views/DesktopTaskView;->explodeProgress:F

    .line 307
    .line 308
    const/4 v12, 0x0

    .line 309
    cmpg-float v13, v11, v12

    .line 310
    .line 311
    const/high16 v14, 0x3f800000    # 1.0f

    .line 312
    .line 313
    if-nez v13, :cond_a

    .line 314
    .line 315
    goto :goto_4

    .line 316
    :cond_a
    cmpg-float v11, v11, v14

    .line 317
    .line 318
    if-nez v11, :cond_d

    .line 319
    .line 320
    :goto_4
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v11

    .line 324
    invoke-virtual {v11, v14}, Landroid/view/View;->setScaleX(F)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v11, v14}, Landroid/view/View;->setScaleY(F)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {v11, v12}, Landroid/view/View;->setTranslationX(F)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v11, v12}, Landroid/view/View;->setTranslationY(F)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 337
    .line 338
    .line 339
    move-result-object v11

    .line 340
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 341
    .line 342
    .line 343
    move-result-object v12

    .line 344
    if-eqz v12, :cond_c

    .line 345
    .line 346
    check-cast v12, Landroid/widget/FrameLayout$LayoutParams;

    .line 347
    .line 348
    const/16 v13, 0x33

    .line 349
    .line 350
    iput v13, v12, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 351
    .line 352
    float-to-int v9, v9

    .line 353
    iput v9, v12, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 354
    .line 355
    float-to-int v9, v10

    .line 356
    iput v9, v12, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 357
    .line 358
    float-to-int v5, v5

    .line 359
    iput v5, v12, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 360
    .line 361
    float-to-int v5, v7

    .line 362
    iput v5, v12, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 363
    .line 364
    invoke-virtual {v11, v12}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 365
    .line 366
    .line 367
    invoke-static {}, Lcom/android/internal/hidden_from_bootclasspath/com/android/window/flags/Flags;->enableDesktopRecentsTransitionsCornersBugfix()Z

    .line 368
    .line 369
    .line 370
    move-result v5

    .line 371
    if-eqz v5, :cond_1

    .line 372
    .line 373
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 374
    .line 375
    .line 376
    move-result v5

    .line 377
    if-eqz v5, :cond_1

    .line 378
    .line 379
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    invoke-static {v6, v4}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 384
    .line 385
    .line 386
    move-result v5

    .line 387
    if-eqz v5, :cond_b

    .line 388
    .line 389
    new-instance v8, Landroid/graphics/Rect;

    .line 390
    .line 391
    invoke-direct {v8, v6}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v8, v4}, Landroid/graphics/Rect;->intersectUnchecked(Landroid/graphics/Rect;)V

    .line 395
    .line 396
    .line 397
    iget v5, v6, Landroid/graphics/Rect;->left:I

    .line 398
    .line 399
    neg-int v5, v5

    .line 400
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 401
    .line 402
    neg-int v6, v6

    .line 403
    invoke-virtual {v8, v5, v6}, Landroid/graphics/Rect;->offset(II)V

    .line 404
    .line 405
    .line 406
    iget v5, v8, Landroid/graphics/Rect;->left:I

    .line 407
    .line 408
    int-to-float v5, v5

    .line 409
    mul-float/2addr v5, v1

    .line 410
    invoke-static {v5}, Lx4/a;->a(F)I

    .line 411
    .line 412
    .line 413
    move-result v5

    .line 414
    iput v5, v8, Landroid/graphics/Rect;->left:I

    .line 415
    .line 416
    iget v5, v8, Landroid/graphics/Rect;->top:I

    .line 417
    .line 418
    int-to-float v5, v5

    .line 419
    mul-float/2addr v5, v2

    .line 420
    invoke-static {v5}, Lx4/a;->a(F)I

    .line 421
    .line 422
    .line 423
    move-result v5

    .line 424
    iput v5, v8, Landroid/graphics/Rect;->top:I

    .line 425
    .line 426
    iget v5, v8, Landroid/graphics/Rect;->right:I

    .line 427
    .line 428
    int-to-float v5, v5

    .line 429
    mul-float/2addr v5, v1

    .line 430
    invoke-static {v5}, Lx4/a;->a(F)I

    .line 431
    .line 432
    .line 433
    move-result v5

    .line 434
    iput v5, v8, Landroid/graphics/Rect;->right:I

    .line 435
    .line 436
    iget v5, v8, Landroid/graphics/Rect;->bottom:I

    .line 437
    .line 438
    int-to-float v5, v5

    .line 439
    mul-float/2addr v5, v2

    .line 440
    invoke-static {v5}, Lx4/a;->a(F)I

    .line 441
    .line 442
    .line 443
    move-result v5

    .line 444
    iput v5, v8, Landroid/graphics/Rect;->bottom:I

    .line 445
    .line 446
    :cond_b
    invoke-virtual {v3, v8}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->setOutlineBounds(Landroid/graphics/Rect;)V

    .line 447
    .line 448
    .line 449
    goto/16 :goto_0

    .line 450
    .line 451
    :cond_c
    new-instance p0, Ljava/lang/NullPointerException;

    .line 452
    .line 453
    const-string v0, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 454
    .line 455
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    throw p0

    .line 459
    :cond_d
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 460
    .line 461
    .line 462
    move-result-object v3

    .line 463
    invoke-virtual {v3, v12}, Landroid/view/View;->setPivotX(F)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v3, v12}, Landroid/view/View;->setPivotY(F)V

    .line 467
    .line 468
    .line 469
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 470
    .line 471
    .line 472
    move-result v6

    .line 473
    int-to-float v6, v6

    .line 474
    sub-float/2addr v5, v6

    .line 475
    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 476
    .line 477
    .line 478
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    .line 479
    .line 480
    .line 481
    move-result v5

    .line 482
    int-to-float v5, v5

    .line 483
    sub-float/2addr v7, v5

    .line 484
    invoke-virtual {v3, v7}, Landroid/view/View;->setTranslationY(F)V

    .line 485
    .line 486
    .line 487
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 488
    .line 489
    .line 490
    move-result v5

    .line 491
    int-to-float v5, v5

    .line 492
    div-float/2addr v9, v5

    .line 493
    invoke-virtual {v3, v9}, Landroid/view/View;->setScaleX(F)V

    .line 494
    .line 495
    .line 496
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 497
    .line 498
    .line 499
    move-result v5

    .line 500
    int-to-float v5, v5

    .line 501
    div-float/2addr v10, v5

    .line 502
    invoke-virtual {v3, v10}, Landroid/view/View;->setScaleY(F)V

    .line 503
    .line 504
    .line 505
    goto/16 :goto_0

    .line 506
    .line 507
    :cond_e
    :goto_5
    return-void
.end method

.method private final removeAndRecycleThumbnailView(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentView:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "contentView"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->taskThumbnailViewPool:Lcom/android/launcher3/util/b3;

    .line 25
    .line 26
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/b3;->j(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->taskThumbnailViewDeprecatedPool:Lcom/android/launcher3/util/b3;

    .line 38
    .line 39
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/b3;->j(Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private final updateTaskPositions()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/android/quickstep/views/DesktopTaskView;->tempPointF:Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-static {v0, v1, v2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Landroid/util/Size;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/quickstep/views/DesktopTaskView;->tempPointF:Landroid/graphics/PointF;

    .line 19
    .line 20
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 21
    .line 22
    float-to-int v2, v2

    .line 23
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    float-to-int v1, v1

    .line 26
    invoke-direct {v0, v2, v1}, Landroid/util/Size;-><init>(II)V

    .line 27
    .line 28
    .line 29
    sget-object v1, Lcom/android/quickstep/views/DesktopTaskView;->DEFAULT_BOUNDS:Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    div-int/lit8 v2, v2, 0x4

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    div-int/lit8 v3, v3, 0x4

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ljava/util/ArrayList;

    .line 52
    .line 53
    const/16 v3, 0xa

    .line 54
    .line 55
    invoke-static {v1, v3}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_1

    .line 71
    .line 72
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/android/quickstep/views/TaskContainer;

    .line 77
    .line 78
    new-instance v4, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 79
    .line 80
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    iget-object v5, v5, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 85
    .line 86
    iget v5, v5, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 87
    .line 88
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object v3, v3, Lcom/android/systemui/shared/recents/model/Task;->appBounds:Landroid/graphics/Rect;

    .line 93
    .line 94
    if-nez v3, :cond_0

    .line 95
    .line 96
    sget-object v3, Lcom/android/quickstep/views/DesktopTaskView;->DEFAULT_BOUNDS:Landroid/graphics/Rect;

    .line 97
    .line 98
    :cond_0
    invoke-direct {v4, v5, v3}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;-><init>(ILandroid/graphics/Rect;)V

    .line 99
    .line 100
    .line 101
    invoke-interface {v2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_1
    iput-object v2, p0, Lcom/android/quickstep/views/DesktopTaskView;->fullscreenTaskPositions:Ljava/util/List;

    .line 106
    .line 107
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/quickstep/views/DesktopTaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;

    .line 114
    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-object v2, p0, Lcom/android/quickstep/views/DesktopTaskView;->fullscreenTaskPositions:Ljava/util/List;

    .line 118
    .line 119
    invoke-virtual {v1, v0, v2}, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;->organizeDesktopTasks(Landroid/util/Size;Ljava/util/List;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    invoke-direct {p0}, Lcom/android/quickstep/views/DesktopTaskView;->positionTaskWindows()V

    .line 123
    .line 124
    .line 125
    return-void
.end method


# virtual methods
.method public addChildrenForAccessibility(Ljava/util/ArrayList;)V
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
    invoke-super {p0, p1}, Lcom/android/quickstep/views/TaskView;->addChildrenForAccessibility(Ljava/util/ArrayList;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->backgroundView:Landroid/view/View;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const-string p0, "backgroundView"

    .line 14
    .line 15
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    :cond_0
    invoke-static {p0, p1}, Lcom/android/quickstep/ViewUtils;->addAccessibleChildToList(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final bind(Lcom/android/quickstep/util/DesktopTask;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/quickstep/TaskOverlayFactory;)V
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v14, p2

    .line 6
    .line 7
    const-string v2, "desktopTask"

    .line 8
    .line 9
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v2, "orientedState"

    .line 13
    .line 14
    invoke-static {v14, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v2, "taskOverlayFactory"

    .line 18
    .line 19
    move-object/from16 v10, p3

    .line 20
    .line 21
    invoke-static {v10, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, v1, Lcom/android/quickstep/views/DesktopTaskView;->desktopTask:Lcom/android/quickstep/util/DesktopTask;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v2, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    move-object v4, v3

    .line 50
    check-cast v4, Lcom/android/systemui/shared/recents/model/Task;

    .line 51
    .line 52
    iget-boolean v4, v4, Lcom/android/systemui/shared/recents/model/Task;->isMinimized:Z

    .line 53
    .line 54
    if-nez v4, :cond_0

    .line 55
    .line 56
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->cancelPendingLoadTasks()V

    .line 61
    .line 62
    .line 63
    iget-object v0, v1, Lcom/android/quickstep/views/DesktopTaskView;->contentView:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 64
    .line 65
    const-string v15, "contentView"

    .line 66
    .line 67
    const/16 v16, 0x0

    .line 68
    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    invoke-static {v15}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    move-object/from16 v0, v16

    .line 75
    .line 76
    :cond_2
    iget-object v3, v1, Lcom/android/quickstep/views/DesktopTaskView;->backgroundView:Landroid/view/View;

    .line 77
    .line 78
    if-nez v3, :cond_3

    .line 79
    .line 80
    const-string v3, "backgroundView"

    .line 81
    .line 82
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    move-object/from16 v3, v16

    .line 86
    .line 87
    :cond_3
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 88
    .line 89
    .line 90
    move-result v17

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    .line 92
    .line 93
    const/16 v3, 0xa

    .line 94
    .line 95
    invoke-static {v2, v3}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 100
    .line 101
    .line 102
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object v18

    .line 106
    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_8

    .line 111
    .line 112
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Lcom/android/systemui/shared/recents/model/Task;

    .line 117
    .line 118
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_4

    .line 123
    .line 124
    iget-object v3, v1, Lcom/android/quickstep/views/DesktopTaskView;->taskThumbnailViewPool:Lcom/android/launcher3/util/b3;

    .line 125
    .line 126
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v3}, Lcom/android/launcher3/util/b3;->d()Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    goto :goto_2

    .line 134
    :cond_4
    iget-object v3, v1, Lcom/android/quickstep/views/DesktopTaskView;->taskThumbnailViewDeprecatedPool:Lcom/android/launcher3/util/b3;

    .line 135
    .line 136
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3}, Lcom/android/launcher3/util/b3;->d()Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    :goto_2
    iget-object v4, v1, Lcom/android/quickstep/views/DesktopTaskView;->contentView:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 144
    .line 145
    if-nez v4, :cond_5

    .line 146
    .line 147
    invoke-static {v15}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    move-object/from16 v4, v16

    .line 151
    .line 152
    :cond_5
    add-int/lit8 v5, v17, 0x1

    .line 153
    .line 154
    invoke-virtual {v4, v3, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 155
    .line 156
    .line 157
    move-object v4, v0

    .line 158
    new-instance v0, Lcom/android/quickstep/views/TaskContainer;

    .line 159
    .line 160
    iget-object v5, v1, Lcom/android/quickstep/views/DesktopTaskView;->iconView:Lcom/android/quickstep/views/TaskViewIcon;

    .line 161
    .line 162
    const-string v6, "iconView"

    .line 163
    .line 164
    if-nez v5, :cond_6

    .line 165
    .line 166
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    move-object/from16 v5, v16

    .line 170
    .line 171
    :cond_6
    move-object v7, v6

    .line 172
    new-instance v6, Lcom/android/launcher3/util/L2;

    .line 173
    .line 174
    iget-object v8, v1, Lcom/android/quickstep/views/DesktopTaskView;->iconView:Lcom/android/quickstep/views/TaskViewIcon;

    .line 175
    .line 176
    if-nez v8, :cond_7

    .line 177
    .line 178
    invoke-static {v7}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    move-object/from16 v8, v16

    .line 182
    .line 183
    :cond_7
    invoke-interface {v8}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    invoke-direct {v6, v7}, Lcom/android/launcher3/util/L2;-><init>(Landroid/view/View;)V

    .line 188
    .line 189
    .line 190
    sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 191
    .line 192
    move-object v7, v4

    .line 193
    move-object v4, v5

    .line 194
    const/4 v5, 0x0

    .line 195
    move-object v8, v7

    .line 196
    const/4 v7, -0x1

    .line 197
    move-object v9, v8

    .line 198
    const/4 v8, 0x0

    .line 199
    move-object v12, v9

    .line 200
    const/4 v9, 0x0

    .line 201
    move-object v13, v12

    .line 202
    move-object v12, v11

    .line 203
    move-object/from16 v19, v13

    .line 204
    .line 205
    move-object v13, v11

    .line 206
    move-object/from16 p1, v15

    .line 207
    .line 208
    move-object/from16 v15, v19

    .line 209
    .line 210
    invoke-direct/range {v0 .. v13}, Lcom/android/quickstep/views/TaskContainer;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;Landroid/view/View;Lcom/android/quickstep/views/TaskViewIcon;Landroid/widget/TextView;Lcom/android/launcher3/util/L2;ILcom/android/quickstep/views/DigitalWellBeingToast;Landroid/view/View;Lcom/android/quickstep/TaskOverlayFactory;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 211
    .line 212
    .line 213
    invoke-interface {v15, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-object/from16 v10, p3

    .line 217
    .line 218
    move-object v0, v15

    .line 219
    move-object/from16 v15, p1

    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_8
    move-object v15, v0

    .line 223
    invoke-virtual {v1, v15}, Lcom/android/quickstep/views/TaskView;->setTaskContainers(Ljava/util/List;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1, v14}, Lcom/android/quickstep/views/DesktopTaskView;->onBind(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 227
    .line 228
    .line 229
    return-void
.end method

.method protected confirmSecondSplitSelectApp()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->canLaunchFullscreenTask()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ne p0, v1, :cond_0

    .line 14
    .line 15
    move v0, v1

    .line 16
    :cond_0
    xor-int/lit8 p0, v0, 0x1

    .line 17
    .line 18
    return p0
.end method

.method public final getDeskId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->desktopTask:Lcom/android/quickstep/util/DesktopTask;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/DesktopTask;->getDeskId()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public getDisplayId()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, LO2/d;->h(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->desktopTask:Lcom/android/quickstep/util/DesktopTask;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/util/DesktopTask;->getDisplayId()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, -0x1

    .line 21
    return p0

    .line 22
    :cond_1
    invoke-super {p0}, Lcom/android/quickstep/views/TaskView;->getDisplayId()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public final getExplodeProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->explodeProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public final getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbnailBounds(Landroid/graphics/Rect;Z)V
    .locals 2

    .line 1
    const-string v0, "bounds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const-string v1, "contentView"

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentView:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v0, p0

    .line 28
    :goto_0
    invoke-virtual {p2, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentView:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 33
    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    move-object v0, p0

    .line 41
    :goto_1
    invoke-static {p1, v0}, Lj2/a;->b(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method protected inflateViewStubs()V
    .locals 1

    .line 1
    const v0, 0x7f0b02fc

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/view/ViewStub;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const v0, 0x7f0e0107

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const v0, 0x7f0e0108

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public launchAsStaticTile()Lcom/android/launcher3/util/Y1;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/DesktopTaskView;->launchTaskWithDesktopController(Z)Lcom/android/launcher3/util/Y1;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public launchWithoutAnimation(ZLu4/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p1, "callback"

    .line 2
    .line 3
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/DesktopTaskView;->launchTaskWithDesktopController(Z)Lcom/android/launcher3/util/Y1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance p1, Lcom/android/quickstep/views/d;

    .line 14
    .line 15
    invoke-direct {p1, p2}, Lcom/android/quickstep/views/d;-><init>(Lu4/l;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-interface {p2, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method protected onBind(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 5

    .line 1
    const-string v0, "orientedState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/android/quickstep/views/TaskView;->onBind(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    new-instance p1, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;

    .line 16
    .line 17
    sget-object v0, Lcom/android/quickstep/recents/di/RecentsDependencies;->Companion:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "getContext(...)"

    .line 24
    .line 25
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    const/4 v4, 0x0

    .line 32
    invoke-direct {v2, v4, v3, v4}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-class v3, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;

    .line 48
    .line 49
    invoke-virtual {v0, v3, v1, v2, v4}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;

    .line 54
    .line 55
    invoke-direct {p1, v0}, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;-><init>(Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Lcom/android/quickstep/views/DesktopTaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;

    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/views/TaskView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b02fc

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "null cannot be cast to non-null type com.android.quickstep.views.TaskViewIcon"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    check-cast v0, Lcom/android/quickstep/views/TaskViewIcon;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const v3, 0x7f080d23

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v3, v2}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/views/TaskView;->setIcon(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const v2, 0x7f140321

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v0, v1}, Lcom/android/quickstep/views/TaskViewIcon;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->iconView:Lcom/android/quickstep/views/TaskViewIcon;

    .line 59
    .line 60
    const v0, 0x7f0b020c

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 68
    .line 69
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    iget v2, v2, Lcom/android/launcher3/h0;->S2:I

    .line 89
    .line 90
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentViewFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/android/quickstep/FullscreenDrawParams;->getCurrentCornerRadius()F

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/DesktopTaskContentView;->setCornerRadius(F)V

    .line 102
    .line 103
    .line 104
    const v1, 0x7f0b00f7

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iput-object v1, p0, Lcom/android/quickstep/views/DesktopTaskView;->backgroundView:Landroid/view/View;

    .line 112
    .line 113
    if-nez v1, :cond_0

    .line 114
    .line 115
    const-string v1, "backgroundView"

    .line 116
    .line 117
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const/4 v1, 0x0

    .line 121
    :cond_0
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    const v4, 0x106002f

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2, v4, v3}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 141
    .line 142
    .line 143
    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentView:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 144
    .line 145
    return-void

    .line 146
    :cond_1
    new-instance p0, Ljava/lang/NullPointerException;

    .line 147
    .line 148
    const-string v0, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 149
    .line 150
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    throw p0
.end method

.method protected onFullscreenProgressChanged(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->backgroundView:Landroid/view/View;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "backgroundView"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    int-to-float v0, v0

    .line 13
    sub-float/2addr v0, p1

    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected onIconLoaded(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 0

    .line 1
    const-string p0, "taskContainer"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected onIconUnloaded(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 0

    .line 1
    const-string p0, "taskContainer"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onRecycle()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/views/TaskView;->onRecycle()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->desktopTask:Lcom/android/quickstep/util/DesktopTask;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/DesktopTaskView;->setExplodeProgress(F)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 36
    .line 37
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/DesktopTaskView;->removeAndRecycleThumbnailView(Lcom/android/quickstep/views/TaskContainer;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method public onTaskListVisibilityChanged(ZI)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->onTaskListVisibilityChanged(ZI)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/views/TaskView;->needsUpdate(II)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentViewFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p2, "getContext(...)"

    .line 18
    .line 19
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p0}, Lcom/android/quickstep/FullscreenDrawParams;->updateCornerRadius(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final removeTaskFromExplodedView(IZ)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "DesktopTaskView"

    .line 8
    .line 9
    const-string p1, "removeTaskFromExplodedView called when enableDesktopExplodedView flag is false"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainerById(I)Lcom/android/quickstep/views/TaskContainer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/DesktopTaskView;->removeAndRecycleThumbnailView(Lcom/android/quickstep/views/TaskContainer;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->destroy()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    move-object v3, v2

    .line 52
    check-cast v3, Lcom/android/quickstep/views/TaskContainer;

    .line 53
    .line 54
    invoke-static {v3, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_2

    .line 59
    .line 60
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/TaskView;->setTaskContainers(Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_5

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    invoke-virtual {p1, p0, p2, v0}, Lcom/android/quickstep/views/RecentsView;->dismissTaskView(Lcom/android/quickstep/views/TaskView;ZZ)V

    .line 85
    .line 86
    .line 87
    :cond_4
    :goto_1
    return-void

    .line 88
    :cond_5
    invoke-direct {p0}, Lcom/android/quickstep/views/DesktopTaskView;->updateTaskPositions()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final setExplodeProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/DesktopTaskView;->explodeProgress:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/DesktopTaskView;->positionTaskWindows()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected setIconState(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/recents/ui/viewmodel/TaskData;)V
    .locals 1

    .line 1
    const-string p0, "container"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    instance-of p1, p2, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    check-cast p2, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-object p2, v0

    .line 19
    :goto_0
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getTitleDescription()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_1
    invoke-virtual {p0, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 1

    .line 1
    const-string v0, "orientationState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/android/quickstep/views/TaskView;->setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->iconView:Lcom/android/quickstep/views/TaskViewIcon;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "iconView"

    .line 14
    .line 15
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-interface {v0, p1, p0}, Lcom/android/quickstep/views/TaskViewIcon;->setIconOrientation(Lcom/android/quickstep/util/RecentsOrientedState;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setOverlayEnabled(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final setRemoteTargetHandles([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/DesktopTaskView;->remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/DesktopTaskView;->positionTaskWindows()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected updateFullscreenParams()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/views/TaskView;->updateFullscreenParams()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentViewFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->updateFullscreenParams(Lcom/android/quickstep/FullscreenDrawParams;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentView:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "contentView"

    .line 14
    .line 15
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskView;->contentViewFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/FullscreenDrawParams;->getCurrentCornerRadius()F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {v0, p0}, Lcom/android/quickstep/views/DesktopTaskContentView;->setCornerRadius(F)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public updateTaskSize(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 1
    const-string v0, "lastComputedTaskSize"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "lastComputedGridTaskSize"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->updateTaskSize(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lcom/android/quickstep/views/DesktopTaskView;->lastComputedTaskSize:Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/quickstep/views/DesktopTaskView;->updateTaskPositions()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method protected updateThumbnailSize()V
    .locals 0

    .line 1
    return-void
.end method
