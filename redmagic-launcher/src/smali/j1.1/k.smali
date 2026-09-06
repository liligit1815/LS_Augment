.class public final Lj1/k;
.super Ljava/lang/Object;
.source "DesktopRecentsTransitionController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lj1/k$a;,
        Lj1/k$b;
    }
.end annotation


# static fields
.field public static final e:Lj1/k$a;


# instance fields
.field private final a:Lcom/android/launcher3/statemanager/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d<",
            "**>;"
        }
    .end annotation
.end field

.field private final b:Lcom/android/quickstep/SystemUiProxy;

.field private final c:Landroid/app/IApplicationThread;

.field private final d:LP1/h;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lj1/k$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lj1/k$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lj1/k;->e:Lj1/k$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/statemanager/d;Lcom/android/quickstep/SystemUiProxy;Landroid/app/IApplicationThread;LP1/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/statemanager/d<",
            "**>;",
            "Lcom/android/quickstep/SystemUiProxy;",
            "Landroid/app/IApplicationThread;",
            "LP1/h;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "stateManager"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "systemUiProxy"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "appThread"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lj1/k;->a:Lcom/android/launcher3/statemanager/d;

    .line 20
    .line 21
    iput-object p2, p0, Lj1/k;->b:Lcom/android/quickstep/SystemUiProxy;

    .line 22
    .line 23
    iput-object p3, p0, Lj1/k;->c:Landroid/app/IApplicationThread;

    .line 24
    .line 25
    iput-object p4, p0, Lj1/k;->d:LP1/h;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a(Lcom/android/quickstep/views/DesktopTaskView;ZLjava/util/function/Consumer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/DesktopTaskView;",
            "Z",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "desktopTaskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lj1/k$b;

    .line 7
    .line 8
    iget-object v4, p0, Lj1/k;->a:Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    iget-object v5, p0, Lj1/k;->d:LP1/h;

    .line 11
    .line 12
    move-object v2, p1

    .line 13
    move v3, p2

    .line 14
    move-object v6, p3

    .line 15
    invoke-direct/range {v1 .. v6}, Lj1/k$b;-><init>(Lcom/android/quickstep/views/TaskView;ZLcom/android/launcher3/statemanager/d;LP1/h;Ljava/util/function/Consumer;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Landroid/window/RemoteTransition;

    .line 19
    .line 20
    iget-object p2, p0, Lj1/k;->c:Landroid/app/IApplicationThread;

    .line 21
    .line 22
    const-string p3, "RecentsToDesktop"

    .line 23
    .line 24
    invoke-direct {p1, v1, p2, p3}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Landroid/app/IApplicationThread;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p2, Lcom/android/quickstep/util/DesksUtils;->Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/android/quickstep/util/DesksUtils$Companion;->areMultiDesksFlagsEnabled()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lj1/k;->b:Lcom/android/quickstep/SystemUiProxy;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/android/quickstep/views/DesktopTaskView;->getDeskId()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/SystemUiProxy;->activateDesk(ILandroid/window/RemoteTransition;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iget-object p0, p0, Lj1/k;->b:Lcom/android/quickstep/SystemUiProxy;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/android/quickstep/views/DesktopTaskView;->getDisplayId()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApps(ILandroid/window/RemoteTransition;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final b(Lcom/android/quickstep/views/TaskContainer;LO2/e;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "taskContainer"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "transitionSource"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "successCallback"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lj1/k;->b:Lcom/android/quickstep/SystemUiProxy;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 23
    .line 24
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/quickstep/SystemUiProxy;->moveToDesktop(ILO2/e;Landroid/window/RemoteTransition;Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final c(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lj1/k;->b:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->moveToExternalDisplay(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
