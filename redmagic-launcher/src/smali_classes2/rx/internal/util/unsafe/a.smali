.class public abstract Lrx/internal/util/unsafe/a;
.super Lrx/internal/util/unsafe/b;
.source "ConcurrentCircularArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/b<",
        "TE;>;"
    }
.end annotation


# static fields
.field protected static final i:I

.field private static final j:J

.field private static final k:I


# instance fields
.field protected final g:J

.field protected final h:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TE;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "sparse.shift"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sput v0, Lrx/internal/util/unsafe/a;->i:I

    .line 13
    .line 14
    sget-object v1, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 15
    .line 16
    const-class v2, [Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x4

    .line 23
    if-ne v4, v3, :cond_0

    .line 24
    .line 25
    add-int/lit8 v3, v0, 0x2

    .line 26
    .line 27
    sput v3, Lrx/internal/util/unsafe/a;->k:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/16 v4, 0x8

    .line 31
    .line 32
    if-ne v4, v3, :cond_1

    .line 33
    .line 34
    add-int/lit8 v3, v0, 0x3

    .line 35
    .line 36
    sput v3, Lrx/internal/util/unsafe/a;->k:I

    .line 37
    .line 38
    :goto_0
    invoke-virtual {v1, v2}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    sget v2, Lrx/internal/util/unsafe/a;->k:I

    .line 43
    .line 44
    sub-int/2addr v2, v0

    .line 45
    const/16 v0, 0x20

    .line 46
    .line 47
    shl-int/2addr v0, v2

    .line 48
    add-int/2addr v1, v0

    .line 49
    int-to-long v0, v1

    .line 50
    sput-wide v0, Lrx/internal/util/unsafe/a;->j:J

    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 54
    .line 55
    const-string v1, "Unknown pointer size"

    .line 56
    .line 57
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw v0
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lrx/internal/util/unsafe/b;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lrx/internal/util/unsafe/j;->a(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    add-int/lit8 v0, p1, -0x1

    .line 9
    .line 10
    int-to-long v0, v0

    .line 11
    iput-wide v0, p0, Lrx/internal/util/unsafe/a;->g:J

    .line 12
    .line 13
    sget v0, Lrx/internal/util/unsafe/a;->i:I

    .line 14
    .line 15
    shl-int/2addr p1, v0

    .line 16
    add-int/lit8 p1, p1, 0x40

    .line 17
    .line 18
    new-array p1, p1, [Ljava/lang/Object;

    .line 19
    .line 20
    iput-object p1, p0, Lrx/internal/util/unsafe/a;->h:[Ljava/lang/Object;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    :cond_0
    :goto_0
    invoke-interface {p0}, Lrx/internal/util/unsafe/d;->poll()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/AbstractQueue;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    return-void
.end method

.method protected final e(J)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lrx/internal/util/unsafe/a;->g:J

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0, v1}, Lrx/internal/util/unsafe/a;->g(JJ)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method protected final g(JJ)J
    .locals 2

    .line 1
    sget-wide v0, Lrx/internal/util/unsafe/a;->j:J

    .line 2
    .line 3
    and-long p0, p1, p3

    .line 4
    .line 5
    sget p2, Lrx/internal/util/unsafe/a;->k:I

    .line 6
    .line 7
    shl-long/2addr p0, p2

    .line 8
    add-long/2addr v0, p0

    .line 9
    return-wide v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method protected final j(J)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/unsafe/a;->h:[Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lrx/internal/util/unsafe/a;->m([Ljava/lang/Object;J)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected final m([Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;J)TE;"
        }
    .end annotation

    .line 1
    sget-object p0, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected final n(J)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/unsafe/a;->h:[Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lrx/internal/util/unsafe/a;->o([Ljava/lang/Object;J)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected final o([Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;J)TE;"
        }
    .end annotation

    .line 1
    sget-object p0, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected final p([Ljava/lang/Object;JLjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;JTE;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lsun/misc/Unsafe;->putOrderedObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected final q(JLjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTE;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/unsafe/a;->h:[Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2, p3}, Lrx/internal/util/unsafe/a;->r([Ljava/lang/Object;JLjava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected final r([Ljava/lang/Object;JLjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;JTE;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lrx/internal/util/unsafe/z;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
