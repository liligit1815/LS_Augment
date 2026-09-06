.class abstract Lrx/internal/util/unsafe/r;
.super Lrx/internal/util/unsafe/p;
.source "SpmcArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/p<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private volatile n:J


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/p;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected final w()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lrx/internal/util/unsafe/r;->n:J

    .line 2
    .line 3
    return-wide v0
.end method

.method protected final x(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lrx/internal/util/unsafe/r;->n:J

    .line 2
    .line 3
    return-void
.end method
