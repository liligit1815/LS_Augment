.class public final Lrx/internal/util/unsafe/k;
.super Lrx/internal/util/unsafe/o;
.source "SpmcArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/o<",
        "TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/o;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public isEmpty()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/unsafe/l;->v()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Lrx/internal/util/unsafe/q;->s()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Lrx/internal/util/unsafe/a;->h:[Ljava/lang/Object;

    .line 4
    .line 5
    iget-wide v1, p0, Lrx/internal/util/unsafe/a;->g:J

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/internal/util/unsafe/q;->s()J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-virtual {p0, v3, v4}, Lrx/internal/util/unsafe/a;->e(J)J

    .line 12
    .line 13
    .line 14
    move-result-wide v5

    .line 15
    invoke-virtual {p0, v0, v5, v6}, Lrx/internal/util/unsafe/a;->o([Ljava/lang/Object;J)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    if-eqz v7, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lrx/internal/util/unsafe/l;->v()J

    .line 22
    .line 23
    .line 24
    move-result-wide v7

    .line 25
    sub-long v7, v3, v7

    .line 26
    .line 27
    cmp-long v1, v7, v1

    .line 28
    .line 29
    if-lez v1, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_0
    :goto_0
    invoke-virtual {p0, v0, v5, v6}, Lrx/internal/util/unsafe/a;->o([Ljava/lang/Object;J)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {p0, v0, v5, v6, p1}, Lrx/internal/util/unsafe/a;->r([Ljava/lang/Object;JLjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    const-wide/16 v0, 0x1

    .line 44
    .line 45
    add-long/2addr v3, v0

    .line 46
    invoke-virtual {p0, v3, v4}, Lrx/internal/util/unsafe/q;->t(J)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    .line 52
    .line 53
    const-string p1, "Null is not a valid element"

    .line 54
    .line 55
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p0
.end method

.method public peek()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/unsafe/r;->w()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lrx/internal/util/unsafe/l;->v()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long v4, v2, v0

    .line 10
    .line 11
    if-ltz v4, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/internal/util/unsafe/q;->s()J

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    cmp-long v6, v2, v4

    .line 18
    .line 19
    if-ltz v6, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-virtual {p0, v4, v5}, Lrx/internal/util/unsafe/r;->x(J)V

    .line 24
    .line 25
    .line 26
    :cond_2
    invoke-virtual {p0, v2, v3}, Lrx/internal/util/unsafe/a;->e(J)J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    invoke-virtual {p0, v2, v3}, Lrx/internal/util/unsafe/a;->n(J)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    return-object v2
.end method

.method public poll()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/unsafe/r;->w()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lrx/internal/util/unsafe/l;->v()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long v4, v2, v0

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    if-ltz v4, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Lrx/internal/util/unsafe/q;->s()J

    .line 15
    .line 16
    .line 17
    move-result-wide v6

    .line 18
    cmp-long v4, v2, v6

    .line 19
    .line 20
    if-ltz v4, :cond_1

    .line 21
    .line 22
    return-object v5

    .line 23
    :cond_1
    invoke-virtual {p0, v6, v7}, Lrx/internal/util/unsafe/r;->x(J)V

    .line 24
    .line 25
    .line 26
    :cond_2
    const-wide/16 v6, 0x1

    .line 27
    .line 28
    add-long/2addr v6, v2

    .line 29
    invoke-virtual {p0, v2, v3, v6, v7}, Lrx/internal/util/unsafe/l;->u(JJ)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v2, v3}, Lrx/internal/util/unsafe/a;->e(J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iget-object v2, p0, Lrx/internal/util/unsafe/a;->h:[Ljava/lang/Object;

    .line 40
    .line 41
    invoke-virtual {p0, v2, v0, v1}, Lrx/internal/util/unsafe/a;->m([Ljava/lang/Object;J)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {p0, v2, v0, v1, v5}, Lrx/internal/util/unsafe/a;->p([Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-object v3
.end method

.method public size()I
    .locals 6

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/unsafe/l;->v()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :goto_0
    invoke-virtual {p0}, Lrx/internal/util/unsafe/q;->s()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-virtual {p0}, Lrx/internal/util/unsafe/l;->v()J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    cmp-long v0, v0, v4

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sub-long/2addr v2, v4

    .line 18
    long-to-int p0, v2

    .line 19
    return p0

    .line 20
    :cond_0
    move-wide v0, v4

    .line 21
    goto :goto_0
.end method
