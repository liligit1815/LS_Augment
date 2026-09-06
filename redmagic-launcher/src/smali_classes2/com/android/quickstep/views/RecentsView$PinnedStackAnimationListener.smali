.class public Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;
.super Lcom/android/wm/shell/common/pip/b$a;
.source "RecentsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/RecentsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PinnedStackAnimationListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">",
        "Lcom/android/wm/shell/common/pip/b$a;"
    }
.end annotation


# instance fields
.field private mActivity:Lcom/android/quickstep/views/RecentsViewContainer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mRecentsView:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wm/shell/common/pip/b$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onExpandPip$1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->D()V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic lambda$onPipAnimationStarted$0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->mActivity:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x9

    .line 6
    .line 7
    invoke-interface {p0, v0}, Lcom/android/quickstep/views/RecentsViewContainer;->clearForceInvisibleFlag(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->lambda$onPipAnimationStarted$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->lambda$onExpandPip$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onExpandPip()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/views/H1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/H1;-><init>(Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onPipAnimationStarted()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/views/G1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/G1;-><init>(Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onPipResourceDimensionsChanged(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Lcom/android/quickstep/views/RecentsView;->F1(Lcom/android/quickstep/views/RecentsView;I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 9
    .line 10
    invoke-static {p0, p2}, Lcom/android/quickstep/views/RecentsView;->G1(Lcom/android/quickstep/views/RecentsView;I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setActivityAndRecentsView(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/RecentsView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/quickstep/views/RecentsView;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->clearOnScrollChangedListener()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->mActivity:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    return-void
.end method
