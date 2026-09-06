.class final Lrx/internal/schedulers/a$c;
.super Lrx/internal/schedulers/d;
.source "CachedThreadScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/schedulers/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "c"
.end annotation


# instance fields
.field private p:J


# direct methods
.method constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lrx/internal/schedulers/d;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lrx/internal/schedulers/a$c;->p:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public m()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lrx/internal/schedulers/a$c;->p:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public n(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lrx/internal/schedulers/a$c;->p:J

    .line 2
    .line 3
    return-void
.end method
