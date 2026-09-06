.class final Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;
.super Lcom/android/wm/shell/recents/d$a;
.source "SystemUiProxy.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/SystemUiProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RecentsAnimationListenerStub"
.end annotation


# instance fields
.field private final listener:Lcom/android/systemui/shared/system/RecentsAnimationListener;


# direct methods
.method public constructor <init>(Lcom/android/systemui/shared/system/RecentsAnimationListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/wm/shell/recents/d$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;->listener:Lcom/android/systemui/shared/system/RecentsAnimationListener;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final getListener()Lcom/android/systemui/shared/system/RecentsAnimationListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;->listener:Lcom/android/systemui/shared/system/RecentsAnimationListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public onAnimationCanceled([I[Landroid/window/TaskSnapshot;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;->listener:Lcom/android/systemui/shared/system/RecentsAnimationListener;

    .line 2
    .line 3
    sget-object v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->Companion:Lcom/android/systemui/shared/recents/model/ThumbnailData$Companion;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/android/systemui/shared/recents/model/ThumbnailData$Companion;->wrap([I[Landroid/window/TaskSnapshot;)Ljava/util/HashMap;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/system/RecentsAnimationListener;->onAnimationCanceled(Ljava/util/HashMap;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onAnimationStart(Lcom/android/wm/shell/recents/c;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/os/Bundle;Landroid/window/TransitionInfo;)V
    .locals 1

    .line 1
    const-string v0, "controller"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;->listener:Lcom/android/systemui/shared/system/RecentsAnimationListener;

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    new-instance p1, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 10
    .line 11
    invoke-direct {p1, v0}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;-><init>(Lcom/android/wm/shell/recents/c;)V

    .line 12
    .line 13
    .line 14
    if-eqz p6, :cond_0

    .line 15
    .line 16
    const-class v0, Lcom/android/wm/shell/shared/split/SplitBounds;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p6, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lh4/t;->a:Lh4/t;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p6, 0x0

    .line 29
    :goto_0
    invoke-interface/range {p0 .. p7}, Lcom/android/systemui/shared/system/RecentsAnimationListener;->onAnimationStart(Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/os/Bundle;Landroid/window/TransitionInfo;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onTasksAppeared([Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;->listener:Lcom/android/systemui/shared/system/RecentsAnimationListener;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/system/RecentsAnimationListener;->onTasksAppeared([Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
