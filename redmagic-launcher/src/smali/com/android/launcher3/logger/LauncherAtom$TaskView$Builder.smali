.class public final Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
.super Lcom/google/protobuf/y$a;
.source "LauncherAtom.java"

# interfaces
.implements Lcom/android/launcher3/logger/LauncherAtom$TaskViewOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/LauncherAtom$TaskView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y$a<",
        "Lcom/android/launcher3/logger/LauncherAtom$TaskView;",
        "Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;",
        ">;",
        "Lcom/android/launcher3/logger/LauncherAtom$TaskViewOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->j()Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/y$a;-><init>(Lcom/google/protobuf/y;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/logger/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearCardinality()Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->a(Lcom/android/launcher3/logger/LauncherAtom$TaskView;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearComponentName()Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->b(Lcom/android/launcher3/logger/LauncherAtom$TaskView;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIndex()Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->c(Lcom/android/launcher3/logger/LauncherAtom$TaskView;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearType()Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->d(Lcom/android/launcher3/logger/LauncherAtom$TaskView;)V

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
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getCardinality()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getComponentName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getComponentName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getComponentNameBytes()Lcom/google/protobuf/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getComponentNameBytes()Lcom/google/protobuf/h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIndex()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getIndex()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getType()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasCardinality()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->hasCardinality()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasComponentName()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->hasComponentName()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasIndex()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->hasIndex()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasType()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->hasType()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setCardinality(I)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->e(Lcom/android/launcher3/logger/LauncherAtom$TaskView;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setComponentName(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->f(Lcom/android/launcher3/logger/LauncherAtom$TaskView;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setComponentNameBytes(Lcom/google/protobuf/h;)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->g(Lcom/android/launcher3/logger/LauncherAtom$TaskView;Lcom/google/protobuf/h;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->h(Lcom/android/launcher3/logger/LauncherAtom$TaskView;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setType(I)Lcom/android/launcher3/logger/LauncherAtom$TaskView$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/y$a;->instance:Lcom/google/protobuf/y;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->i(Lcom/android/launcher3/logger/LauncherAtom$TaskView;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
