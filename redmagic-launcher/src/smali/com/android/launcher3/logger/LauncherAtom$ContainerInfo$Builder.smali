.class public final Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
.super Lcom/google/protobuf/y$a;
.source "LauncherAtom.java"

# interfaces
.implements Lcom/android/launcher3/logger/LauncherAtom$ContainerInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;",
        "Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;",
        ">;",
        "Lcom/android/launcher3/logger/LauncherAtom$ContainerInfoOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->R()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/logger/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAllAppsContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->a(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->b(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearExtendedContainers()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->c(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearFolder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->d(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearHotseat()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->e(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPredictedHotseatContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->f(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPredictionContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->g(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSearchResultContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->h(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSettingsContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->i(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearShortcutsContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->j(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTaskBarContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->k(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTaskSwitcherContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->l(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWallpapersContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->m(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWidgetsContainer()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->n(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWorkspace()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->o(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAllAppsContainer()Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getAllAppsContainer()Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getExtendedContainers()Lcom/android/launcher3/logger/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHotseat()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getHotseat()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPredictedHotseatContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getPredictedHotseatContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPredictionContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getPredictionContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSearchResultContainer()Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getSearchResultContainer()Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSettingsContainer()Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getSettingsContainer()Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getShortcutsContainer()Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getShortcutsContainer()Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTaskBarContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getTaskBarContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTaskSwitcherContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getTaskSwitcherContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWallpapersContainer()Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getWallpapersContainer()Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWidgetsContainer()Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getWidgetsContainer()Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasAllAppsContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasAllAppsContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasExtendedContainers()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasExtendedContainers()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasFolder()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasFolder()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasHotseat()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasHotseat()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasPredictedHotseatContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasPredictedHotseatContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasPredictionContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasPredictionContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasSearchResultContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasSearchResultContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasSettingsContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasSettingsContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasShortcutsContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasShortcutsContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasTaskBarContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasTaskBarContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasTaskSwitcherContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasTaskSwitcherContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasWallpapersContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasWallpapersContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasWidgetsContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasWidgetsContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasWorkspace()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->hasWorkspace()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeAllAppsContainer(Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->p(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeExtendedContainers(Lcom/android/launcher3/logger/d;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->q(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/d;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeFolder(Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->r(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeHotseat(Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->s(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergePredictedHotseatContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->t(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergePredictionContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->u(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeSearchResultContainer(Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->v(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeSettingsContainer(Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->w(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeShortcutsContainer(Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->x(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeTaskBarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->y(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeTaskSwitcherContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->z(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeWallpapersContainer(Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->A(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeWidgetsContainer(Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->B(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeWorkspace(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->C(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAllAppsContainer(Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->D(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;)V

    return-object p0
.end method

.method public setAllAppsContainer(Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->D(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;)V

    return-object p0
.end method

.method public setExtendedContainers(Lcom/android/launcher3/logger/d$a;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/d;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->E(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/d;)V

    return-object p0
.end method

.method public setExtendedContainers(Lcom/android/launcher3/logger/d;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->E(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/d;)V

    return-object p0
.end method

.method public setFolder(Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->F(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;)V

    return-object p0
.end method

.method public setFolder(Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->F(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;)V

    return-object p0
.end method

.method public setHotseat(Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->G(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;)V

    return-object p0
.end method

.method public setHotseat(Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->G(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;)V

    return-object p0
.end method

.method public setPredictedHotseatContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->H(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;)V

    return-object p0
.end method

.method public setPredictedHotseatContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->H(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;)V

    return-object p0
.end method

.method public setPredictionContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->I(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;)V

    return-object p0
.end method

.method public setPredictionContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->I(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;)V

    return-object p0
.end method

.method public setSearchResultContainer(Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->J(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;)V

    return-object p0
.end method

.method public setSearchResultContainer(Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->J(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;)V

    return-object p0
.end method

.method public setSettingsContainer(Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->K(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;)V

    return-object p0
.end method

.method public setSettingsContainer(Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->K(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;)V

    return-object p0
.end method

.method public setShortcutsContainer(Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->L(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;)V

    return-object p0
.end method

.method public setShortcutsContainer(Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->L(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;)V

    return-object p0
.end method

.method public setTaskBarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->M(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)V

    return-object p0
.end method

.method public setTaskBarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->M(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)V

    return-object p0
.end method

.method public setTaskSwitcherContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->N(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;)V

    return-object p0
.end method

.method public setTaskSwitcherContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->N(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;)V

    return-object p0
.end method

.method public setWallpapersContainer(Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->O(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;)V

    return-object p0
.end method

.method public setWallpapersContainer(Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->O(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;)V

    return-object p0
.end method

.method public setWidgetsContainer(Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->P(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;)V

    return-object p0
.end method

.method public setWidgetsContainer(Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->P(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;)V

    return-object p0
.end method

.method public setWorkspace(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->Q(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;)V

    return-object p0
.end method

.method public setWorkspace(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->Q(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;)V

    return-object p0
.end method
