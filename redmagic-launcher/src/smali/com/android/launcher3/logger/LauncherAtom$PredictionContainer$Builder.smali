.class public final Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;
.super Lcom/google/protobuf/y$a;
.source "LauncherAtom.java"

# interfaces
.implements Lcom/android/launcher3/logger/LauncherAtom$PredictionContainerOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;",
        "Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;",
        ">;",
        "Lcom/android/launcher3/logger/LauncherAtom$PredictionContainerOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->e()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/logger/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearParentContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->a(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTaskbarContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->b(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getParentContainerCase()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->getParentContainerCase()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTaskbarContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->getTaskbarContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasTaskbarContainer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->hasTaskbarContainer()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeTaskbarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->c(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTaskbarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->d(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)V

    return-object p0
.end method

.method public setTaskbarContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->d(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;)V

    return-object p0
.end method
