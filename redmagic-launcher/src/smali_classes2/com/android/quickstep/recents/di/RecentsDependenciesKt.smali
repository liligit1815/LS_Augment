.class public final Lcom/android/quickstep/recents/di/RecentsDependenciesKt;
.super Ljava/lang/Object;
.source "RecentsDependencies.kt"


# direct methods
.method public static final synthetic get(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;",
            "Ljava/lang/Object;",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            "Lu4/l<",
            "-",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "extras"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 2
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    move-result-object p0

    const/4 p1, 0x4

    .line 3
    const-string v1, "T"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->k(ILjava/lang/String;)V

    const-class p1, Ljava/lang/Object;

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic get(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;",
            "Ljava/lang/Object;",
            "[",
            "Lh4/l<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Lu4/l<",
            "-",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "extras"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    new-instance v0, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    invoke-direct {v0, p2}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>([Lh4/l;)V

    .line 5
    instance-of p2, p1, Ljava/lang/String;

    if-eqz p2, :cond_0

    move-object p2, p1

    check-cast p2, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-nez p2, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    .line 6
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    move-result-object p0

    const/4 p1, 0x4

    .line 7
    const-string v1, "T"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->k(ILjava/lang/String;)V

    const-class p1, Ljava/lang/Object;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic get$default(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    .line 1
    const-string p1, ""

    :cond_0
    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_1

    .line 2
    new-instance p2, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    const/4 p5, 0x1

    invoke-direct {p2, v0, p5, v0}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    :cond_1
    const/4 p5, 0x4

    and-int/2addr p4, p5

    if-eqz p4, :cond_2

    move-object p3, v0

    .line 3
    :cond_2
    const-string p4, "<this>"

    invoke-static {p0, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "scope"

    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "extras"

    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    instance-of p4, p1, Ljava/lang/String;

    if-eqz p4, :cond_3

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    :cond_3
    if-nez v0, :cond_4

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 5
    :cond_4
    invoke-virtual {p0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    move-result-object p0

    .line 6
    const-string p1, "T"

    invoke-static {p5, p1}, Lkotlin/jvm/internal/o;->k(ILjava/lang/String;)V

    const-class p1, Ljava/lang/Object;

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic get$default(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    .line 7
    const-string p1, ""

    :cond_0
    const/4 p5, 0x4

    and-int/2addr p4, p5

    const/4 v0, 0x0

    if-eqz p4, :cond_1

    move-object p3, v0

    .line 8
    :cond_1
    const-string p4, "<this>"

    invoke-static {p0, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "scope"

    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "extras"

    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    new-instance p4, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    invoke-direct {p4, p2}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>([Lh4/l;)V

    .line 10
    instance-of p2, p1, Ljava/lang/String;

    if-eqz p2, :cond_2

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    :cond_2
    if-nez v0, :cond_3

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 11
    :cond_3
    invoke-virtual {p0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    move-result-object p0

    .line 12
    const-string p1, "T"

    invoke-static {p5, p1}, Lkotlin/jvm/internal/o;->k(ILjava/lang/String;)V

    const-class p1, Ljava/lang/Object;

    invoke-virtual {p0, p1, v0, p4, p3}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final getScope(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "scopeId"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->getScope(Ljava/lang/Object;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static final synthetic inject(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;)Lh4/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;",
            "Ljava/lang/Object;",
            "[",
            "Lh4/l<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Lu4/l<",
            "-",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            "+TT;>;)",
            "Lh4/e<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "scope"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "extras"

    .line 12
    .line 13
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lkotlin/jvm/internal/o;->j()V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/android/quickstep/recents/di/RecentsDependenciesKt$inject$1;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/recents/di/RecentsDependenciesKt$inject$1;-><init>(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic inject$default(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;ILjava/lang/Object;)Lh4/e;
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x1

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    const-string p1, ""

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p4, p4, 0x4

    .line 8
    .line 9
    if-eqz p4, :cond_1

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    :cond_1
    const-string p4, "<this>"

    .line 13
    .line 14
    invoke-static {p0, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string p4, "scope"

    .line 18
    .line 19
    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string p4, "extras"

    .line 23
    .line 24
    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lkotlin/jvm/internal/o;->j()V

    .line 28
    .line 29
    .line 30
    new-instance p4, Lcom/android/quickstep/recents/di/RecentsDependenciesKt$inject$1;

    .line 31
    .line 32
    invoke-direct {p4, p0, p1, p2, p3}, Lcom/android/quickstep/recents/di/RecentsDependenciesKt$inject$1;-><init>(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p4}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method
