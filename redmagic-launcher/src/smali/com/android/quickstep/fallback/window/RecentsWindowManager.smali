.class public final Lcom/android/quickstep/fallback/window/RecentsWindowManager;
.super Lcom/android/quickstep/fallback/window/RecentsWindowContext;
.source "RecentsWindowManager.kt"

# interfaces
.implements Lcom/android/quickstep/views/RecentsViewContainer;
.implements Lcom/android/launcher3/statemanager/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/fallback/window/RecentsWindowContext;",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        "Lcom/android/launcher3/statemanager/i<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;"
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion;

.field private static final HOME_APPEAR_DURATION:J = 0xfaL

.field private static final TAG:Ljava/lang/String; = "RecentsWindowManager"

.field private static final recentsWindowTracker:Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;


# instance fields
.field private actionsView:Lcom/android/quickstep/views/OverviewActionsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/OverviewActionsView<",
            "*>;"
        }
    .end annotation
.end field

.field private final animationToHomeFactory:Lcom/android/launcher3/M2$b;

.field private callbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

.field private dragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/fallback/RecentsDragLayer<",
            "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
            ">;"
        }
    .end annotation
.end field

.field private final eventCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/Y1;",
            ">;"
        }
    .end annotation
.end field

.field private layoutInflater:Landroid/view/LayoutInflater;

.field private final onBackInvokedCallback:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private final recentsAnimationListener:Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;

.field private recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/fallback/FallbackRecentsView<",
            "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
            ">;"
        }
    .end annotation
.end field

.field private scrimView:Lcom/android/launcher3/views/ScrimView;

.field private stateManager:Lcom/android/launcher3/statemanager/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
            ">;"
        }
    .end annotation
.end field

.field private systemUiController:Lcom/android/launcher3/util/E2;

.field private final taskStackChangeListener:Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;

.field private taskbarUIController:Lcom/android/launcher3/taskbar/o4;

.field private tisBindHelper:Lcom/android/quickstep/util/TISBindHelper;

.field private final windowContext:Landroid/content/Context;

.field private final windowManager:Landroid/view/WindowManager;

.field private windowView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsWindowTracker:Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/fallback/window/RecentsWindowContext;-><init>(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    const/16 p1, 0x7f6

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/view/ContextThemeWrapper;->createWindowContext(ILandroid/os/Bundle;)Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string p2, "createWindowContext(...)"

    .line 17
    .line 18
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowContext:Landroid/content/Context;

    .line 22
    .line 23
    const-class p2, Landroid/view/WindowManager;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    check-cast p1, Landroid/view/WindowManager;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowManager:Landroid/view/WindowManager;

    .line 35
    .line 36
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, p0}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string p2, "cloneInContext(...)"

    .line 45
    .line 46
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->layoutInflater:Landroid/view/LayoutInflater;

    .line 50
    .line 51
    new-instance p1, Lcom/android/launcher3/statemanager/d;

    .line 52
    .line 53
    sget-object p2, Lcom/android/quickstep/fallback/RecentsState;->BG_LAUNCHER:Lcom/android/quickstep/fallback/RecentsState;

    .line 54
    .line 55
    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/statemanager/d;-><init>(Lcom/android/launcher3/statemanager/i;Lcom/android/launcher3/statemanager/a;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->stateManager:Lcom/android/launcher3/statemanager/d;

    .line 59
    .line 60
    new-instance p1, Lcom/android/quickstep/util/TISBindHelper;

    .line 61
    .line 62
    new-instance p2, Lcom/android/quickstep/fallback/window/h;

    .line 63
    .line 64
    invoke-direct {p2}, Lcom/android/quickstep/fallback/window/h;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/util/TISBindHelper;-><init>(Landroid/content/Context;Ljava/util/function/Consumer;)V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->tisBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 71
    .line 72
    new-instance p1, Lcom/android/launcher3/util/Y1;

    .line 73
    .line 74
    invoke-direct {p1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance p2, Lcom/android/launcher3/util/Y1;

    .line 78
    .line 79
    invoke-direct {p2}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 80
    .line 81
    .line 82
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 83
    .line 84
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 85
    .line 86
    .line 87
    new-instance v1, Lcom/android/launcher3/util/Y1;

    .line 88
    .line 89
    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 90
    .line 91
    .line 92
    filled-new-array {p1, p2, v0, v1}, [Lcom/android/launcher3/util/Y1;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p1}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->eventCallbacks:Ljava/util/List;

    .line 101
    .line 102
    new-instance p1, Lcom/android/quickstep/fallback/window/i;

    .line 103
    .line 104
    invoke-direct {p1, p0}, Lcom/android/quickstep/fallback/window/i;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->animationToHomeFactory:Lcom/android/launcher3/M2$b;

    .line 108
    .line 109
    new-instance p1, Lcom/android/quickstep/fallback/window/j;

    .line 110
    .line 111
    invoke-direct {p1, p0}, Lcom/android/quickstep/fallback/window/j;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 112
    .line 113
    .line 114
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->onBackInvokedCallback:Lu4/a;

    .line 115
    .line 116
    new-instance p1, Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;

    .line 117
    .line 118
    invoke-direct {p1, p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->taskStackChangeListener:Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;

    .line 122
    .line 123
    new-instance p2, Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;

    .line 124
    .line 125
    invoke-direct {p2, p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 126
    .line 127
    .line 128
    iput-object p2, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsAnimationListener:Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;

    .line 129
    .line 130
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public static final synthetic access$cleanupRecentsWindow(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->cleanupRecentsWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getRecentsWindowTracker$cp()Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsWindowTracker:Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$isShowing(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$recentAnimationStopped(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentAnimationStopped()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final animationToHomeFactory$lambda$2(Lcom/android/quickstep/fallback/window/RecentsWindowManager;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->BG_LAUNCHER:Lcom/android/quickstep/fallback/RecentsState;

    .line 6
    .line 7
    const-wide/16 v1, 0xfa

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1, v2}, Lcom/android/launcher3/statemanager/d;->n(Lcom/android/launcher3/statemanager/a;J)Lcom/android/launcher3/anim/q;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-direct {v0, p2, p3, p4, v3}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 20
    .line 21
    .line 22
    iget-object p2, v0, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 23
    .line 24
    invoke-static {p2}, Lkotlin/jvm/internal/d;->a([Ljava/lang/Object;)Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    if-eqz p3, :cond_0

    .line 33
    .line 34
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    check-cast p3, Landroid/view/RemoteAnimationTarget;

    .line 39
    .line 40
    new-instance p4, Landroid/view/SurfaceControl$Transaction;

    .line 41
    .line 42
    invoke-direct {p4}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 43
    .line 44
    .line 45
    iget-object p3, p3, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 46
    .line 47
    const/high16 v0, 0x3f800000    # 1.0f

    .line 48
    .line 49
    invoke-virtual {p4, p3, v0}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    invoke-virtual {p3}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 70
    .line 71
    .line 72
    invoke-static {p5}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    new-instance p1, Lcom/android/quickstep/fallback/window/n;

    .line 76
    .line 77
    invoke-direct {p1, p0}, Lcom/android/quickstep/fallback/window/n;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 78
    .line 79
    .line 80
    const/4 p3, 0x1

    .line 81
    invoke-virtual {p5, p2, p0, p1, p3}, Lcom/android/launcher3/M2$a;->u2(Landroid/animation/AnimatorSet;Landroid/content/Context;Ljava/lang/Runnable;Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private static final animationToHomeFactory$lambda$2$lambda$1(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/android/quickstep/fallback/RecentsState;->BG_LAUNCHER:Lcom/android/quickstep/fallback/RecentsState;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->cleanupRecentsWindow()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->tisBindHelper$lambda$0(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final cleanupRecentsWindow()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->logCleanup(Z)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowManager:Landroid/view/WindowManager;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->stateManager:Lcom/android/launcher3/statemanager/d;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->callbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsAnimationListener:Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method private static final destroy$lambda$4(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/s;->onViewDestroyed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->destroy$lambda$4(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final getRecentsWindowTracker()Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion;->getRecentsWindowTracker()Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static synthetic h(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->onBackInvokedCallback$lambda$3(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHome$lambda$8$lambda$7(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static synthetic j(Lu4/a;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startRecentsWindow$lambda$5(Lu4/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHome$lambda$8(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/quickstep/fallback/window/RecentsWindowManager;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->animationToHomeFactory$lambda$2(Lcom/android/quickstep/fallback/window/RecentsWindowManager;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->animationToHomeFactory$lambda$2$lambda$1(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHome$lambda$6()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onBackInvokedCallback$lambda$3(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)Lh4/t;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->launchWithAnimation()Lcom/android/launcher3/util/Y1;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHome()V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 21
    .line 22
    :cond_1
    const-string p0, "Main"

    .line 23
    .line 24
    const-string v0, "onBackInvoked"

    .line 25
    .line 26
    invoke-static {p0, v0}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 30
    .line 31
    return-object p0
.end method

.method private final recentAnimationStopped()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->BACKGROUND_APP:Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isInState(Lcom/android/quickstep/fallback/RecentsState;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->cleanupRecentsWindow()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private static final startHome$lambda$6()V
    .locals 0

    .line 1
    return-void
.end method

.method private static final startHome$lambda$8(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/fallback/window/l;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/fallback/window/l;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private static final startHome$lambda$8$lambda$7(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHomeInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final startHomeInternal()V
    .locals 6

    .line 1
    new-instance v1, Lcom/android/launcher3/M2;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getMainThreadHandler()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v2, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->animationToHomeFactory:Lcom/android/launcher3/M2$b;

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-direct {v1, v0, v2, v3}, Lcom/android/launcher3/M2;-><init>(Landroid/os/Handler;Lcom/android/launcher3/M2$b;Z)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroid/view/RemoteAnimationAdapter;

    .line 14
    .line 15
    const-wide/16 v2, 0xfa

    .line 16
    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    invoke-direct/range {v0 .. v5}, Landroid/view/RemoteAnimationAdapter;-><init>(Landroid/view/IRemoteAnimationRunner;JJ)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Landroid/window/RemoteTransition;

    .line 23
    .line 24
    invoke-virtual {v1}, Lu2/p;->y2()Landroid/window/IRemoteTransition;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getIApplicationThread()Landroid/app/IApplicationThread;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const-string v4, "StartHomeFromRecents"

    .line 33
    .line 34
    invoke-direct {v2, v1, v3, v4}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Landroid/app/IApplicationThread;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v2}, Landroid/app/ActivityOptions;->makeRemoteAnimation(Landroid/view/RemoteAnimationAdapter;Landroid/window/RemoteTransition;)Landroid/app/ActivityOptions;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "RecentsWindowManager"

    .line 46
    .line 47
    invoke-static {p0, v0, v1}, Lcom/android/quickstep/OverviewComponentObserver;->startHomeIntentSafely(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->stateManager:Lcom/android/launcher3/statemanager/d;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic startRecentsWindow$default(Lcom/android/quickstep/fallback/window/RecentsWindowManager;Lcom/android/quickstep/RecentsAnimationCallbacks;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startRecentsWindow(Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final startRecentsWindow$lambda$5(Lu4/a;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final tisBindHelper$lambda$0(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public addEventCallback(ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->eventCallbacks:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Y1;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public addForceInvisibleFlag(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public addMultiWindowModeChangedListener(Lcom/android/launcher3/v$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic asContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public canStartHomeSafely()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->tisBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/TISBindHelper;->getOverviewCommandHelper()Lcom/android/quickstep/OverviewCommandHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewCommandHelper;->canStartHomeSafely()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public bridge synthetic canUseMultipleShadesForPopup()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->canUseMultipleShadesForPopup()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public clearForceInvisibleFlag(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public collectStateHandlers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/statemanager/d$f<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public createAtomicAnimationFactory()Lcom/android/launcher3/statemanager/d$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/statemanager/d$d<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ContextThemeWrapper;->destroy()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    new-instance v1, Lcom/android/quickstep/fallback/window/m;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/quickstep/fallback/window/m;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->cleanupRecentsWindow()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->taskStackChangeListener:Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->callbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsAnimationListener:Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsWindowTracker:Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/H;->onContextDestroyed(Lcom/android/launcher3/views/k;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 41
    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->destroy()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public bridge synthetic dispatchDeviceProfileChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->dispatchDeviceProfileChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic finishAppClosingAnim(ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic finishAutoCancelActionMode()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->finishAutoCancelActionMode()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic finishFolderAnim()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->finishFolderAnim()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getActionsView()Lcom/android/quickstep/views/OverviewActionsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/views/OverviewActionsView<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->actionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/views/k;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getAppsView()Lcom/android/launcher3/allapps/r;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getCellPosMapper()Lc1/c;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getCellPosMapper()Lc1/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getComponentName()Landroid/content/ComponentName;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    const-class v1, Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public bridge synthetic getContent()Lcom/android/launcher3/util/Y0;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getContent()Lcom/android/launcher3/util/Y0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/views/BaseDragLayer<",
            "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->dragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 2
    .line 3
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic getDropTargetHandler()Lcom/android/launcher3/q0;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getDropTargetHandler()Lcom/android/launcher3/q0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getFolderBoundingBox()Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getFolderBoundingBox()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getIfIgnorestylusGesture()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getIfIgnorestylusGesture()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getLayoutInflater()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getOverviewPanel()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getPopupDataProvider()Lcom/android/launcher3/popup/n;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected final getRecentsView()Lcom/android/quickstep/fallback/FallbackRecentsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/fallback/FallbackRecentsView<",
            "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRootView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScrimView()Lcom/android/launcher3/views/ScrimView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->scrimView:Lcom/android/launcher3/views/ScrimView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStateManager()Lcom/android/launcher3/statemanager/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/statemanager/d<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->stateManager:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getStringCache()Lz1/G4;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getSystemUiController()Lcom/android/launcher3/util/E2;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->systemUiController:Lcom/android/launcher3/util/E2;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/util/E2;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getRootView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/E2;-><init>(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->systemUiController:Lcom/android/launcher3/util/E2;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->systemUiController:Lcom/android/launcher3/util/E2;

    .line 17
    .line 18
    return-object p0
.end method

.method public getTaskbarUIController()Lcom/android/launcher3/taskbar/o4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->taskbarUIController:Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getWidgetPickerDataProvider()Ln2/c;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getWindow()Landroid/view/Window;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public handleConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->initDeviceProfile()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    const v0, 0xf289d8b

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->dispatchDeviceProfileChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic handleIncorrectSplitTargetSelection()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->handleIncorrectSplitTargetSelection()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic hasBubbles()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->hasBubbles()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic hideKeyboard()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic isBubbleBarEnabled()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isBubbleBarEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isHardwareKeyboard()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isHardwareKeyboard()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isInState(Lcom/android/launcher3/statemanager/a;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isInState(Lcom/android/quickstep/fallback/RecentsState;)Z

    move-result p0

    return p0
.end method

.method public isInState(Lcom/android/quickstep/fallback/RecentsState;)Z
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->stateManager:Lcom/android/launcher3/statemanager/d;

    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    move-result-object p0

    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public isRecentsViewVisible()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    check-cast p0, Lcom/android/quickstep/fallback/RecentsState;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public bridge synthetic isSoftwareKeyboardHidden()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isSoftwareKeyboardHidden()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSplitSelectionActive()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isSplitSelectionActive()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public isStarted()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isInState(Lcom/android/quickstep/fallback/RecentsState;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public bridge synthetic logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic onStateSetEnd(Lcom/android/launcher3/statemanager/a;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->onStateSetEnd(Lcom/android/quickstep/fallback/RecentsState;)V

    return-void
.end method

.method public onStateSetEnd(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 1

    const-string v0, "state"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/i;->onStateSetEnd(Lcom/android/launcher3/statemanager/a;)V

    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->logOnStateSetEnd(Ljava/lang/String;)V

    .line 4
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->HOME:Lcom/android/quickstep/fallback/RecentsState;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->BG_LAUNCHER:Lcom/android/quickstep/fallback/RecentsState;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 5
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->cleanupRecentsWindow()V

    .line 6
    :cond_1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p1}, Lcom/android/quickstep/fallback/RecentsStateUtilsKt;->toLauncherStateOrdinal(Lcom/android/quickstep/fallback/RecentsState;)I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendStateEventToTest(Landroid/content/Context;I)V

    return-void
.end method

.method public bridge synthetic onStateSetStart(Lcom/android/launcher3/statemanager/a;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->onStateSetStart(Lcom/android/quickstep/fallback/RecentsState;)V

    return-void
.end method

.method public onStateSetStart(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 1

    const-string v0, "state"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/i;->onStateSetStart(Lcom/android/launcher3/statemanager/a;)V

    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->logOnStateSetStart(Ljava/lang/String;)V

    return-void
.end method

.method public removeEventCallback(ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->eventCallbacks:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Y1;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/Y1;->e(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public removeMultiWindowModeChangedListener(Lcom/android/launcher3/v$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic resetDraglayer()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->resetDraglayer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public returnToHomescreen()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHome()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->tisBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TISBindHelper;->runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setLocusContext(Landroid/content/LocusId;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected final setRecentsView(Lcom/android/quickstep/fallback/FallbackRecentsView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/fallback/FallbackRecentsView<",
            "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    return-void
.end method

.method public setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->taskbarUIController:Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    return-void
.end method

.method public shouldAnimateStateChange()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public bridge synthetic startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public startHome()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHome(Z)V

    return-void
.end method

.method public final startHome(Z)V
    .locals 1

    .line 2
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getOverviewPanel()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    if-nez p1, :cond_0

    .line 3
    new-instance p1, Lcom/android/quickstep/fallback/window/f;

    invoke-direct {p1}, Lcom/android/quickstep/fallback/window/f;-><init>()V

    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHomeInternal()V

    return-void

    .line 5
    :cond_0
    new-instance p1, Lcom/android/quickstep/fallback/window/g;

    invoke-direct {p1, v0, p0}, Lcom/android/quickstep/fallback/window/g;-><init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final startRecentsWindow(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    invoke-static {v0, v1}, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->logStartRecentsWindow(ZZ)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isShowing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->layoutInflater:Landroid/view/LayoutInflater;

    .line 28
    .line 29
    const v2, 0x7f0e00d2

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 37
    .line 38
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowManager:Landroid/view/WindowManager;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->getWindowLayoutParams()Landroid/view/WindowManager$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-interface {v0, v2, v3}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/View;->findOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v2, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->onBackInvokedCallback:Lu4/a;

    .line 60
    .line 61
    new-instance v3, Lcom/android/quickstep/fallback/window/k;

    .line 62
    .line 63
    invoke-direct {v3, v2}, Lcom/android/quickstep/fallback/window/k;-><init>(Lu4/a;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {v0, v3}, Landroid/window/OnBackInvokedDispatcher;->registerSystemOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 70
    .line 71
    if-eqz v0, :cond_4

    .line 72
    .line 73
    const/16 v2, 0x700

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 76
    .line 77
    .line 78
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 79
    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    const v2, 0x7f0b045e

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_5
    move-object v0, v1

    .line 93
    :goto_1
    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 96
    .line 97
    if-eqz v0, :cond_6

    .line 98
    .line 99
    const v2, 0x7f0b045d

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/android/quickstep/views/OverviewActionsView;

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_6
    move-object v0, v1

    .line 110
    :goto_2
    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->actionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 111
    .line 112
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 113
    .line 114
    if-eqz v0, :cond_7

    .line 115
    .line 116
    const v2, 0x7f0b050a

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Lcom/android/launcher3/views/ScrimView;

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_7
    move-object v0, v1

    .line 127
    :goto_3
    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->scrimView:Lcom/android/launcher3/views/ScrimView;

    .line 128
    .line 129
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 130
    .line 131
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    move-object v7, v0

    .line 136
    check-cast v7, Lcom/android/quickstep/SystemUiProxy;

    .line 137
    .line 138
    new-instance v2, Lcom/android/quickstep/util/SplitSelectStateController;

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 149
    .line 150
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    move-object v8, v0

    .line 155
    check-cast v8, Lcom/android/quickstep/RecentsModel;

    .line 156
    .line 157
    const/4 v9, 0x0

    .line 158
    const/4 v5, 0x0

    .line 159
    move-object v3, p0

    .line 160
    invoke-direct/range {v2 .. v9}, Lcom/android/quickstep/util/SplitSelectStateController;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/statemanager/d;LP1/h;Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/RecentsModel;Ljava/lang/Runnable;)V

    .line 161
    .line 162
    .line 163
    iget-object p0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 164
    .line 165
    if-eqz p0, :cond_8

    .line 166
    .line 167
    iget-object v0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->actionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 168
    .line 169
    invoke-virtual {p0, v0, v2, v1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->init(Lcom/android/quickstep/views/OverviewActionsView;Lcom/android/quickstep/util/SplitSelectStateController;Lj1/k;)V

    .line 170
    .line 171
    .line 172
    :cond_8
    iget-object p0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 173
    .line 174
    if-eqz p0, :cond_9

    .line 175
    .line 176
    const v0, 0x7f0b022d

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    check-cast p0, Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_9
    move-object p0, v1

    .line 187
    :goto_4
    iput-object p0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->dragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 188
    .line 189
    iget-object p0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->actionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 190
    .line 191
    if-eqz p0, :cond_b

    .line 192
    .line 193
    invoke-virtual {v3}, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iget-object v2, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 198
    .line 199
    if-eqz v2, :cond_a

    .line 200
    .line 201
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getLastComputedTaskSize()Landroid/graphics/Rect;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    :cond_a
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/views/OverviewActionsView;->updateDimension(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)V

    .line 206
    .line 207
    .line 208
    :cond_b
    iget-object p0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->actionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 209
    .line 210
    if-eqz p0, :cond_c

    .line 211
    .line 212
    invoke-static {v3}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/OverviewActionsView;->updateVerticalMargin(Lcom/android/launcher3/util/C1;)I

    .line 217
    .line 218
    .line 219
    :cond_c
    new-instance p0, Lcom/android/launcher3/util/E2;

    .line 220
    .line 221
    iget-object v0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->windowView:Landroid/view/View;

    .line 222
    .line 223
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/E2;-><init>(Landroid/view/View;)V

    .line 224
    .line 225
    .line 226
    iput-object p0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->systemUiController:Lcom/android/launcher3/util/E2;

    .line 227
    .line 228
    sget-object p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsWindowTracker:Lcom/android/quickstep/fallback/window/RecentsWindowManager$Companion$RecentsWindowTracker;

    .line 229
    .line 230
    invoke-virtual {p0, v3}, Lcom/android/launcher3/util/H;->handleCreate(Lcom/android/launcher3/views/k;)Z

    .line 231
    .line 232
    .line 233
    iput-object p1, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->callbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 234
    .line 235
    if-eqz p1, :cond_d

    .line 236
    .line 237
    iget-object p0, v3, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->recentsAnimationListener:Lcom/android/quickstep/fallback/window/RecentsWindowManager$recentsAnimationListener$1;

    .line 238
    .line 239
    invoke-virtual {p1, p0}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 240
    .line 241
    .line 242
    :cond_d
    invoke-virtual {v3}, Lcom/android/launcher3/util/s;->onViewCreated()V

    .line 243
    .line 244
    .line 245
    return-void
.end method

.method public bridge synthetic startSplitSelection(Lcom/android/launcher3/util/y2$c;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->startSplitSelection(Lcom/android/launcher3/util/y2$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic updateOpenFolderPosition([ILandroid/graphics/Rect;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/views/k;->updateOpenFolderPosition([ILandroid/graphics/Rect;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
