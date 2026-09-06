.class public abstract Lrx/h;
.super Ljava/lang/Object;
.source "Subscriber.java"

# interfaces
.implements Lrx/c;
.implements Lrx/i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c<",
        "TT;>;",
        "Lrx/i;"
    }
.end annotation


# static fields
.field private static final NOT_SET:Ljava/lang/Long;


# instance fields
.field private producer:Lrx/d;

.field private requested:J

.field private final subscriber:Lrx/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/h<",
            "*>;"
        }
    .end annotation
.end field

.field private final subscriptions:LW4/g;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/high16 v0, -0x8000000000000000L

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lrx/h;->NOT_SET:Ljava/lang/Long;

    .line 8
    .line 9
    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, v0, v1}, Lrx/h;-><init>(Lrx/h;Z)V

    return-void
.end method

.method protected constructor <init>(Lrx/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "*>;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lrx/h;-><init>(Lrx/h;Z)V

    return-void
.end method

.method protected constructor <init>(Lrx/h;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "*>;Z)V"
        }
    .end annotation

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    sget-object v0, Lrx/h;->NOT_SET:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lrx/h;->requested:J

    .line 5
    iput-object p1, p0, Lrx/h;->subscriber:Lrx/h;

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    .line 6
    iget-object p1, p1, Lrx/h;->subscriptions:LW4/g;

    goto :goto_0

    :cond_0
    new-instance p1, LW4/g;

    invoke-direct {p1}, LW4/g;-><init>()V

    :goto_0
    iput-object p1, p0, Lrx/h;->subscriptions:LW4/g;

    return-void
.end method

.method private addToRequested(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lrx/h;->requested:J

    .line 2
    .line 3
    sget-object v2, Lrx/h;->NOT_SET:Ljava/lang/Long;

    .line 4
    .line 5
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iput-wide p1, p0, Lrx/h;->requested:J

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-wide v0, p0, Lrx/h;->requested:J

    .line 17
    .line 18
    add-long/2addr v0, p1

    .line 19
    const-wide/16 p1, 0x0

    .line 20
    .line 21
    cmp-long p1, v0, p1

    .line 22
    .line 23
    if-gez p1, :cond_1

    .line 24
    .line 25
    const-wide p1, 0x7fffffffffffffffL

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    iput-wide p1, p0, Lrx/h;->requested:J

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iput-wide v0, p0, Lrx/h;->requested:J

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final add(Lrx/i;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/h;->subscriptions:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LW4/g;->a(Lrx/i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/h;->subscriptions:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0}, LW4/g;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onStart()V
    .locals 0

    .line 1
    return-void
.end method

.method protected final request(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-object v0, p0, Lrx/h;->producer:Lrx/d;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    invoke-interface {v0, p1, p2}, Lrx/d;->request(J)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    :try_start_1
    invoke-direct {p0, p1, p2}, Lrx/h;->addToRequested(J)V

    .line 20
    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1

    .line 26
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v1, "number requested cannot be negative: "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw p0
.end method

.method public setProducer(Lrx/d;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lrx/h;->requested:J

    .line 3
    .line 4
    iput-object p1, p0, Lrx/h;->producer:Lrx/d;

    .line 5
    .line 6
    iget-object p1, p0, Lrx/h;->subscriber:Lrx/h;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    sget-object p1, Lrx/h;->NOT_SET:Ljava/lang/Long;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    cmp-long p1, v0, v2

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    const/4 p1, 0x0

    .line 25
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Lrx/h;->subscriber:Lrx/h;

    .line 29
    .line 30
    iget-object p0, p0, Lrx/h;->producer:Lrx/d;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lrx/h;->setProducer(Lrx/d;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    sget-object p1, Lrx/h;->NOT_SET:Ljava/lang/Long;

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    cmp-long p1, v0, v2

    .line 43
    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Lrx/h;->producer:Lrx/d;

    .line 47
    .line 48
    const-wide v0, 0x7fffffffffffffffL

    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    invoke-interface {p0, v0, v1}, Lrx/d;->request(J)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-object p0, p0, Lrx/h;->producer:Lrx/d;

    .line 58
    .line 59
    invoke-interface {p0, v0, v1}, Lrx/d;->request(J)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    throw p1
.end method

.method public final unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/h;->subscriptions:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0}, LW4/g;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
