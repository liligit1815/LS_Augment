.class public final Lrx/internal/util/unsafe/s;
.super Lrx/internal/util/unsafe/x;
.source "SpscArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/x<",
        "TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/x;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private s()J
    .locals 3

    .line 1
    sget-object v0, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lrx/internal/util/unsafe/u;->o:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method private t()J
    .locals 3

    .line 1
    sget-object v0, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lrx/internal/util/unsafe/y;->n:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method private u(J)V
    .locals 6

    .line 1
    sget-object v0, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v2, Lrx/internal/util/unsafe/u;->o:J

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move-wide v4, p1

    .line 7
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putOrderedLong(Ljava/lang/Object;JJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private v(J)V
    .locals 6

    .line 1
    sget-object v0, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v2, Lrx/internal/util/unsafe/y;->n:J

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move-wide v4, p1

    .line 7
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putOrderedLong(Ljava/lang/Object;JJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public isEmpty()Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lrx/internal/util/unsafe/s;->t()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0}, Lrx/internal/util/unsafe/s;->s()J

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
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lrx/internal/util/unsafe/a;->h:[Ljava/lang/Object;

    .line 4
    .line 5
    iget-wide v1, p0, Lrx/internal/util/unsafe/y;->producerIndex:J

    .line 6
    .line 7
    invoke-virtual {p0, v1, v2}, Lrx/internal/util/unsafe/a;->e(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-virtual {p0, v0, v3, v4}, Lrx/internal/util/unsafe/a;->o([Ljava/lang/Object;J)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    if-eqz v5, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    const-wide/16 v5, 0x1

    .line 20
    .line 21
    add-long/2addr v1, v5

    .line 22
    invoke-direct {p0, v1, v2}, Lrx/internal/util/unsafe/s;->v(J)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0, v3, v4, p1}, Lrx/internal/util/unsafe/a;->p([Ljava/lang/Object;JLjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    new-instance p0, Ljava/lang/NullPointerException;

    .line 31
    .line 32
    const-string p1, "null elements not allowed"

    .line 33
    .line 34
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p0
.end method

.method public peek()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lrx/internal/util/unsafe/u;->consumerIndex:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lrx/internal/util/unsafe/a;->e(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0, v0, v1}, Lrx/internal/util/unsafe/a;->n(J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public poll()Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lrx/internal/util/unsafe/u;->consumerIndex:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lrx/internal/util/unsafe/a;->e(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    iget-object v4, p0, Lrx/internal/util/unsafe/a;->h:[Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p0, v4, v2, v3}, Lrx/internal/util/unsafe/a;->o([Ljava/lang/Object;J)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v5

    .line 13
    const/4 v6, 0x0

    .line 14
    if-nez v5, :cond_0

    .line 15
    .line 16
    return-object v6

    .line 17
    :cond_0
    const-wide/16 v7, 0x1

    .line 18
    .line 19
    add-long/2addr v0, v7

    .line 20
    invoke-direct {p0, v0, v1}, Lrx/internal/util/unsafe/s;->u(J)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v4, v2, v3, v6}, Lrx/internal/util/unsafe/a;->p([Ljava/lang/Object;JLjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-object v5
.end method

.method public size()I
    .locals 6

    .line 1
    invoke-direct {p0}, Lrx/internal/util/unsafe/s;->s()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :goto_0
    invoke-direct {p0}, Lrx/internal/util/unsafe/s;->t()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-direct {p0}, Lrx/internal/util/unsafe/s;->s()J

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
