.class public final Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
.super Lcom/google/protobuf/y$a;
.source "LauncherAtom.java"

# interfaces
.implements Lcom/android/launcher3/logger/LauncherAtom$FolderIconOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;",
        "Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;",
        ">;",
        "Lcom/android/launcher3/logger/LauncherAtom$FolderIconOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->j()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/logger/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearCardinality()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->a(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearFromLabelState()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->b(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLabelInfo()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->c(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearToLabelState()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->d(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCardinality()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getCardinality()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getFromLabelState()Lcom/android/launcher3/logger/LauncherAtom$FromState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getFromLabelState()Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLabelInfo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getLabelInfo()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLabelInfoBytes()Lcom/google/protobuf/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getLabelInfoBytes()Lcom/google/protobuf/h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getToLabelState()Lcom/android/launcher3/logger/LauncherAtom$ToState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getToLabelState()Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasCardinality()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->hasCardinality()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasFromLabelState()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->hasFromLabelState()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasLabelInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->hasLabelInfo()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasToLabelState()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->hasToLabelState()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setCardinality(I)Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->e(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFromLabelState(Lcom/android/launcher3/logger/LauncherAtom$FromState;)Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->f(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;Lcom/android/launcher3/logger/LauncherAtom$FromState;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLabelInfo(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->g(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLabelInfoBytes(Lcom/google/protobuf/h;)Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->h(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;Lcom/google/protobuf/h;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setToLabelState(Lcom/android/launcher3/logger/LauncherAtom$ToState;)Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->i(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;Lcom/android/launcher3/logger/LauncherAtom$ToState;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
