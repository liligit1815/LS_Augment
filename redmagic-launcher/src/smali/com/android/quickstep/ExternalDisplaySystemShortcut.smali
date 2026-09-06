.class public final Lcom/android/quickstep/ExternalDisplaySystemShortcut;
.super Lcom/android/launcher3/popup/P;
.source "ExternalDisplaySystemShortcut.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/popup/P<",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">;"
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;


# instance fields
.field private final taskContainer:Lcom/android/quickstep/views/TaskContainer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/ExternalDisplaySystemShortcut;->Companion:Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/b;Lcom/android/quickstep/views/TaskContainer;)V
    .locals 8

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "abstractFloatingViewHelper"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "taskContainer"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {p3}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    const v2, 0x7f080d2a

    .line 25
    .line 26
    .line 27
    const v3, 0x7f140325

    .line 28
    .line 29
    .line 30
    move-object v1, p0

    .line 31
    move-object v4, p1

    .line 32
    move-object v7, p2

    .line 33
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/b;)V

    .line 34
    .line 35
    .line 36
    iput-object p3, v1, Lcom/android/quickstep/ExternalDisplaySystemShortcut;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic J(Lcom/android/quickstep/ExternalDisplaySystemShortcut;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/ExternalDisplaySystemShortcut;->onClick$lambda$0(Lcom/android/quickstep/ExternalDisplaySystemShortcut;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onClick$lambda$0(Lcom/android/quickstep/ExternalDisplaySystemShortcut;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/android/quickstep/ExternalDisplaySystemShortcut;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->Q:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 24
    .line 25
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 12
    .line 13
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/ExternalDisplaySystemShortcut;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    new-instance v1, Lcom/android/quickstep/O0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/android/quickstep/O0;-><init>(Lcom/android/quickstep/ExternalDisplaySystemShortcut;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/android/quickstep/views/RecentsView;->moveTaskToExternalDisplay(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
