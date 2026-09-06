.class public Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;
.super Ljava/lang/Object;
.source "TaskOverlayFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskOverlayFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaskOverlay"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$OverlayUICallbacksImpl;,
        Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ScreenshotSystemShortcut;,
        Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ShareSystemShortcut;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/quickstep/views/OverviewActionsView;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "TaskOverlay"


# instance fields
.field private mActionsView:Lcom/android/quickstep/views/OverviewActionsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected final mApplicationContext:Landroid/content/Context;

.field private mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field protected mImageApi:Lcom/android/quickstep/ImageActionsApi;

.field protected final mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

.field private mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;


# direct methods
.method protected constructor <init>(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/RecentsViewContainer;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mApplicationContext:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 22
    .line 23
    new-instance p1, Lcom/android/quickstep/ImageActionsApi;

    .line 24
    .line 25
    new-instance v1, Lcom/android/quickstep/h5;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/android/quickstep/h5;-><init>(Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p1, v0, v1}, Lcom/android/quickstep/ImageActionsApi;-><init>(Landroid/content/Context;Ljava/util/function/Supplier;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mImageApi:Lcom/android/quickstep/ImageActionsApi;

    .line 34
    .line 35
    iput-object p2, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/RecentsView;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;)Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public addChildForAccessibility(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public endLiveTileMode(Ljava/lang/Runnable;)V
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
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    new-instance v0, Lcom/android/quickstep/g5;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/g5;-><init>(Lcom/android/quickstep/views/RecentsView;Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method protected enterSplitSelect()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelect(Lcom/android/quickstep/views/TaskContainer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected getActionsView()Lcom/android/quickstep/views/OverviewActionsView;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mActionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 20
    .line 21
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getActionsView()Lcom/android/quickstep/views/OverviewActionsView;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mActionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mActionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 28
    .line 29
    return-object p0
.end method

.method public getModalStateSystemShortcut(Lcom/android/launcher3/model/data/I;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getScreenshotShortcut(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ScreenshotSystemShortcut;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ScreenshotSystemShortcut;-><init>(Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getShareShortcut(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ShareSystemShortcut;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ShareSystemShortcut;-><init>(Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getSnapshotView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTaskSnapshotBounds()Landroid/graphics/Rect;
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 5
    .line 6
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/graphics/Rect;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    aget v3, v0, v2

    .line 17
    .line 18
    const/4 v4, 0x1

    .line 19
    aget v5, v0, v4

    .line 20
    .line 21
    iget-object v6, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 22
    .line 23
    invoke-virtual {v6}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    aget v2, v0, v2

    .line 32
    .line 33
    add-int/2addr v6, v2

    .line 34
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    aget v0, v0, v4

    .line 45
    .line 46
    add-int/2addr p0, v0

    .line 47
    invoke-direct {v1, v3, v5, v6, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 48
    .line 49
    .line 50
    return-object v1
.end method

.method public getTaskSnapshotInsets()Landroid/graphics/Insets;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->getThumbnail()Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Landroid/graphics/Insets;->NONE:Landroid/graphics/Insets;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v1, Landroid/graphics/RectF;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-float v0, v0

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-direct {v1, v3, v3, v2, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v2, Landroid/graphics/RectF;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    int-to-float v4, v4

    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    int-to-float v0, v0

    .line 44
    invoke-direct {v2, v3, v3, v4, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Landroid/graphics/Matrix;

    .line 48
    .line 49
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    iget-object v3, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 59
    .line 60
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailPosition()Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    if-eqz v3, :cond_1

    .line 65
    .line 66
    iget-object v3, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 67
    .line 68
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailPosition()Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->getMatrix()Landroid/graphics/Matrix;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    goto :goto_0

    .line 77
    :cond_1
    sget-object v3, Landroid/graphics/Matrix;->IDENTITY_MATRIX:Landroid/graphics/Matrix;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    iget-object v3, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 81
    .line 82
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->getThumbnailMatrix()Landroid/graphics/Matrix;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    :goto_0
    invoke-virtual {v3, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 91
    .line 92
    .line 93
    new-instance v3, Landroid/graphics/RectF;

    .line 94
    .line 95
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v3, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 114
    .line 115
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 120
    .line 121
    const/4 v0, 0x0

    .line 122
    if-eqz p0, :cond_3

    .line 123
    .line 124
    iget p0, v1, Landroid/graphics/RectF;->bottom:F

    .line 125
    .line 126
    iget v1, v3, Landroid/graphics/RectF;->bottom:F

    .line 127
    .line 128
    sub-float/2addr p0, v1

    .line 129
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    goto :goto_1

    .line 134
    :cond_3
    move p0, v0

    .line 135
    :goto_1
    invoke-static {v0, v0, v0, p0}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0
.end method

.method public getTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected getThumbnail()Landroid/graphics/Bitmap;
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
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->getThumbnail()Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public initOverlay(Lcom/android/systemui/shared/recents/model/Task;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->getActionsView()Lcom/android/quickstep/views/OverviewActionsView;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance p3, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$OverlayUICallbacksImpl;

    .line 6
    .line 7
    const/4 p4, 0x0

    .line 8
    invoke-direct {p3, p0, p4, p1}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$OverlayUICallbacksImpl;-><init>(Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;ZLcom/android/systemui/shared/recents/model/Task;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p3}, Lcom/android/quickstep/views/OverviewActionsView;->setCallbacks(Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected isRealSnapshot()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-boolean v0, v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->isRealSnapshot:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-boolean p0, p0, Lcom/android/systemui/shared/recents/model/Task;->isLocked:Z

    .line 24
    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    return v1

    .line 30
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->isRealSnapshot()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public isThumbnailRotationDifferentFromTask()Z
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
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailPosition()Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->isThumbnailRotationDifferentFromTask()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public reset()V
    .locals 0

    .line 1
    return-void
.end method

.method public resetModalVisuals()V
    .locals 0

    .line 1
    return-void
.end method

.method protected saveAppPair()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/views/GroupedTaskView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getAppPairsController()Lcom/android/quickstep/util/AppPairsController;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/AppPairsController;->saveAppPair(Lcom/android/quickstep/views/GroupedTaskView;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method protected saveScreenshot(Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->isRealSnapshot()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mImageApi:Lcom/android/quickstep/ImageActionsApi;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->getThumbnail()Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->getTaskSnapshotBounds()Landroid/graphics/Rect;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->getTaskSnapshotInsets()Landroid/graphics/Insets;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2, p0, p1}, Lcom/android/quickstep/ImageActionsApi;->saveScreenshot(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Insets;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->showBlockedByPolicyMessage()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setFullscreenParams(Lcom/android/quickstep/FullscreenDrawParams;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setFullscreenProgress(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public setThumbnailState(Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    return-void
.end method

.method public setVisibility(I)V
    .locals 0

    .line 1
    return-void
.end method

.method protected showBlockedByPolicyMessage()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lz1/G4;->n:Ljava/lang/String;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const v1, 0x7f1400c9

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/views/W;->X(Lcom/android/launcher3/views/k;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public updateOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 0

    .line 1
    return-void
.end method
