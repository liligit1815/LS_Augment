.class LC4/k;
.super LC4/j;
.source "Sequences.kt"


# direct methods
.method public static c(Ljava/util/Iterator;)LC4/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Iterator<",
            "+TT;>;)",
            "LC4/e<",
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
    new-instance v0, LC4/k$a;

    .line 7
    .line 8
    invoke-direct {v0, p0}, LC4/k$a;-><init>(Ljava/util/Iterator;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, LC4/k;->d(LC4/e;)LC4/e;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static final d(LC4/e;)LC4/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LC4/e<",
            "+TT;>;)",
            "LC4/e<",
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
    instance-of v0, p0, LC4/a;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, LC4/a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, LC4/a;-><init>(LC4/e;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static e()LC4/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "LC4/e<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, LC4/b;->a:LC4/b;

    .line 2
    .line 3
    return-object v0
.end method

.method public static f(Ljava/lang/Object;Lu4/l;)LC4/e;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lu4/l<",
            "-TT;+TT;>;)",
            "LC4/e<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "nextFunction"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    sget-object p0, LC4/b;->a:LC4/b;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, LC4/d;

    .line 12
    .line 13
    new-instance v1, LC4/k$b;

    .line 14
    .line 15
    invoke-direct {v1, p0}, LC4/k$b;-><init>(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1, p1}, LC4/d;-><init>(Lu4/a;Lu4/l;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method
