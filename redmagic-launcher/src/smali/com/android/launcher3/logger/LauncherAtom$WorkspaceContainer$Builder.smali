.class public final Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;
.super Lcom/google/protobuf/y$a;
.source "LauncherAtom.java"

# interfaces
.implements Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainerOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;",
        "Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;",
        ">;",
        "Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainerOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->g()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/logger/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearGridX()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->a(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGridY()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->b(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPageIndex()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->c(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getGridX()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getGridX()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getGridY()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getGridY()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getPageIndex()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getPageIndex()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasGridX()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->hasGridX()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasGridY()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->hasGridY()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasPageIndex()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->hasPageIndex()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setGridX(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->d(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGridY(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->e(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPageIndex(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->f(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
