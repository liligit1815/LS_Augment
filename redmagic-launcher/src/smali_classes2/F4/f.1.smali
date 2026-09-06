.class public final LF4/f;
.super Ljava/lang/Object;
.source "Await.kt"


# direct methods
.method public static final a([LF4/P;Ll4/d;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "LF4/P<",
            "+TT;>;",
            "Ll4/d<",
            "-",
            "Ljava/util/List<",
            "+TT;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    if-nez v0, :cond_0

    .line 3
    .line 4
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, LF4/e;

    .line 10
    .line 11
    invoke-direct {v0, p0}, LF4/e;-><init>([LF4/P;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, LF4/e;->c(Ll4/d;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
