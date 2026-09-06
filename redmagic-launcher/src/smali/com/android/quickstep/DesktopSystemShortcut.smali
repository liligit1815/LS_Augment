.class public final Lcom/android/quickstep/DesktopSystemShortcut;
.super Lcom/android/launcher3/popup/P;
.source "DesktopSystemShortcut.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/DesktopSystemShortcut$Companion;
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
.field public static final Companion:Lcom/android/quickstep/DesktopSystemShortcut$Companion;


# instance fields
.field private final taskContainer:Lcom/android/quickstep/views/TaskContainer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/DesktopSystemShortcut$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/DesktopSystemShortcut$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/DesktopSystemShortcut;->Companion:Lcom/android/quickstep/DesktopSystemShortcut$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/launcher3/b;)V
    .locals 8

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskContainer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "abstractFloatingViewHelper"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    const v2, 0x7f080d21

    .line 25
    .line 26
    .line 27
    const v3, 0x7f140324

    .line 28
    .line 29
    .line 30
    move-object v1, p0

    .line 31
    move-object v4, p1

    .line 32
    move-object v7, p3

    .line 33
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/b;)V

    .line 34
    .line 35
    .line 36
    iput-object p2, v1, Lcom/android/quickstep/DesktopSystemShortcut;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic J(Lcom/android/quickstep/DesktopSystemShortcut;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/DesktopSystemShortcut;->onClick$lambda$0(Lcom/android/quickstep/DesktopSystemShortcut;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onClick$lambda$0(Lcom/android/quickstep/DesktopSystemShortcut;)V
    .locals 1

    .line 1
    const/16 v0, 0x78

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 7
    .line 8
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Lcom/android/quickstep/DesktopSystemShortcut;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->P:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 29
    .line 30
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x78

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 15
    .line 16
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/DesktopSystemShortcut;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 25
    .line 26
    sget-object v1, LO2/e;->i:LO2/e;

    .line 27
    .line 28
    new-instance v2, Lcom/android/quickstep/M0;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Lcom/android/quickstep/M0;-><init>(Lcom/android/quickstep/DesktopSystemShortcut;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0, v1, v2}, Lcom/android/quickstep/views/RecentsView;->moveTaskToDesktop(Lcom/android/quickstep/views/TaskContainer;LO2/e;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
