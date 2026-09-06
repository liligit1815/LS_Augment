.class public LH4/e;
.super Ljava/lang/Object;
.source "BufferedChannel.kt"

# interfaces
.implements LH4/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LH4/e$a;,
        LH4/e$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LH4/g<",
        "TE;>;"
    }
.end annotation


# static fields
.field private static final synthetic j:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field private static final synthetic k:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field private static final synthetic l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field private static final synthetic m:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field private static final synthetic n:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field private static final synthetic o:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field private static final synthetic p:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field private static final synthetic q:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field private static final synthetic r:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile synthetic _closeCause$volatile:Ljava/lang/Object;

.field private volatile synthetic bufferEnd$volatile:J

.field private volatile synthetic bufferEndSegment$volatile:Ljava/lang/Object;

.field private volatile synthetic closeHandler$volatile:Ljava/lang/Object;

.field private volatile synthetic completedExpandBuffersAndPauseFlag$volatile:J

.field private final g:I

.field public final h:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "TE;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Lu4/q;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/q<",
            "LN4/b<",
            "*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Lu4/q<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Object;",
            "Ll4/g;",
            "Lh4/t;",
            ">;>;"
        }
    .end annotation
.end field

.field private volatile synthetic receiveSegment$volatile:Ljava/lang/Object;

.field private volatile synthetic receivers$volatile:J

.field private volatile synthetic sendSegment$volatile:Ljava/lang/Object;

.field private volatile synthetic sendersAndCloseStatus$volatile:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "sendersAndCloseStatus$volatile"

    .line 2
    .line 3
    const-class v1, LH4/e;

    .line 4
    .line 5
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, LH4/e;->j:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 10
    .line 11
    const-string v0, "receivers$volatile"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, LH4/e;->k:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 18
    .line 19
    const-string v0, "bufferEnd$volatile"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, LH4/e;->l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 26
    .line 27
    const-string v0, "completedExpandBuffersAndPauseFlag$volatile"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, LH4/e;->m:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 34
    .line 35
    const-string v0, "sendSegment$volatile"

    .line 36
    .line 37
    const-class v2, Ljava/lang/Object;

    .line 38
    .line 39
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, LH4/e;->n:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 44
    .line 45
    const-string v0, "receiveSegment$volatile"

    .line 46
    .line 47
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, LH4/e;->o:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 52
    .line 53
    const-string v0, "bufferEndSegment$volatile"

    .line 54
    .line 55
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, LH4/e;->p:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 60
    .line 61
    const-string v0, "_closeCause$volatile"

    .line 62
    .line 63
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sput-object v0, LH4/e;->q:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 68
    .line 69
    const-string v0, "closeHandler$volatile"

    .line 70
    .line 71
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, LH4/e;->r:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 76
    .line 77
    return-void
.end method

.method public constructor <init>(ILu4/l;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lu4/l<",
            "-TE;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LH4/e;->g:I

    .line 5
    .line 6
    iput-object p2, p0, LH4/e;->h:Lu4/l;

    .line 7
    .line 8
    if-ltz p1, :cond_2

    .line 9
    .line 10
    invoke-static {p1}, LH4/f;->t(I)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, LH4/e;->bufferEnd$volatile:J

    .line 15
    .line 16
    invoke-direct {p0}, LH4/e;->V()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iput-wide v0, p0, LH4/e;->completedExpandBuffersAndPauseFlag$volatile:J

    .line 21
    .line 22
    new-instance v2, LH4/m;

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    const/4 v7, 0x3

    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    move-object v6, p0

    .line 29
    invoke-direct/range {v2 .. v7}, LH4/m;-><init>(JLH4/m;LH4/e;I)V

    .line 30
    .line 31
    .line 32
    iput-object v2, v6, LH4/e;->sendSegment$volatile:Ljava/lang/Object;

    .line 33
    .line 34
    iput-object v2, v6, LH4/e;->receiveSegment$volatile:Ljava/lang/Object;

    .line 35
    .line 36
    invoke-direct {v6}, LH4/e;->t0()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-static {}, LH4/f;->n()LH4/m;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-string p0, "null cannot be cast to non-null type kotlinx.coroutines.channels.ChannelSegment<E of kotlinx.coroutines.channels.BufferedChannel>"

    .line 47
    .line 48
    invoke-static {v2, p0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iput-object v2, v6, LH4/e;->bufferEndSegment$volatile:Ljava/lang/Object;

    .line 52
    .line 53
    if-eqz p2, :cond_1

    .line 54
    .line 55
    new-instance p0, LH4/b;

    .line 56
    .line 57
    invoke-direct {p0, v6}, LH4/b;-><init>(LH4/e;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const/4 p0, 0x0

    .line 62
    :goto_0
    iput-object p0, v6, LH4/e;->i:Lu4/q;

    .line 63
    .line 64
    invoke-static {}, LH4/f;->l()LK4/D;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    iput-object p0, v6, LH4/e;->_closeCause$volatile:Ljava/lang/Object;

    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string p2, "Invalid channel capacity: "

    .line 77
    .line 78
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string p1, ", should be >=0"

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw p1
.end method

.method public static final synthetic A(LH4/e;LH4/m;IJLl4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, LH4/e;->M0(LH4/m;IJLl4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final A0(Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "TE;",
            "Ll4/g;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/e;->h:Lu4/l;

    .line 2
    .line 3
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p2, p3}, LK4/w;->a(Lu4/l;Ljava/lang/Object;Ll4/g;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final synthetic B(LH4/e;LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, LH4/e;->Z0(LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic C(LH4/e;LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, LH4/e;->b1(LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final C0(LF4/k;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/k<",
            "-",
            "LH4/k<",
            "+TE;>;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lh4/m;->g:Lh4/m$a;

    .line 2
    .line 3
    sget-object v0, LH4/k;->b:LH4/k$b;

    .line 4
    .line 5
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, LH4/k;->b(Ljava/lang/Object;)LH4/k;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p1, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private final D(Lu4/l;)LB4/f;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-TE;",
            "Lh4/t;",
            ">;)",
            "LB4/f<",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p1, LH4/e$c;

    .line 2
    .line 3
    invoke-direct {p1, p0}, LH4/e$c;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method private final D0(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, LF4/l;

    .line 2
    .line 3
    invoke-static {p2}, Lm4/b;->c(Ll4/d;)Ll4/d;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v0, v1, v2}, LF4/l;-><init>(Ll4/d;I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, LF4/l;->D()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, LH4/e;->h:Lu4/l;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-static {v1, p1, v3, v2, v3}, LK4/w;->c(Lu4/l;Ljava/lang/Object;LK4/P;ILjava/lang/Object;)LK4/P;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p1, p0}, Lh4/a;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Lh4/m;->g:Lh4/m$a;

    .line 34
    .line 35
    invoke-static {p1}, Lh4/n;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {v0, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget-object p1, Lh4/m;->g:Lh4/m$a;

    .line 52
    .line 53
    invoke-static {p0}, Lh4/n;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {v0, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    invoke-virtual {v0}, LF4/l;->x()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-ne p0, p1, :cond_1

    .line 73
    .line 74
    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    if-ne p0, p1, :cond_2

    .line 82
    .line 83
    return-object p0

    .line 84
    :cond_2
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 85
    .line 86
    return-object p0
.end method

.method private final E(Lu4/l;Ljava/lang/Object;)Lu4/q;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-TE;",
            "Lh4/t;",
            ">;TE;)",
            "Lu4/q<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Object;",
            "Ll4/g;",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, LH4/c;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, LH4/c;-><init>(Lu4/l;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method private final E0(Ljava/lang/Object;LF4/k;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "LF4/k<",
            "-",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LH4/e;->h:Lu4/l;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p2}, Ll4/d;->getContext()Ll4/g;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, p1, v1}, LK4/w;->a(Lu4/l;Ljava/lang/Object;Ll4/g;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object p1, Lh4/m;->g:Lh4/m$a;

    .line 17
    .line 18
    invoke-static {p0}, Lh4/n;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p2, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private static final F(Lu4/l;Ljava/lang/Object;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p4}, LK4/w;->a(Lu4/l;Ljava/lang/Object;Ll4/g;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method

.method private final G(Lu4/l;)LB4/f;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-TE;",
            "Lh4/t;",
            ">;)",
            "LB4/f<",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p1, LH4/e$d;

    .line 2
    .line 3
    invoke-direct {p1, p0}, LH4/e$d;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method private final H(J)Z
    .locals 4

    .line 1
    invoke-direct {p0}, LH4/e;->V()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long v0, p1, v0

    .line 6
    .line 7
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget p0, p0, LH4/e;->g:I

    .line 14
    .line 15
    int-to-long v2, p0

    .line 16
    add-long/2addr v0, v2

    .line 17
    cmp-long p0, p1, v0

    .line 18
    .line 19
    if-gez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method private static final H0(LH4/e;LN4/b;Ljava/lang/Object;Ljava/lang/Object;)Lu4/q;
    .locals 0

    .line 1
    new-instance p2, LH4/d;

    .line 2
    .line 3
    invoke-direct {p2, p3, p0, p1}, LH4/d;-><init>(Ljava/lang/Object;LH4/e;LN4/b;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method private static final I0(Ljava/lang/Object;LH4/e;LN4/b;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    if-eq p0, p3, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, LH4/e;->h:Lu4/l;

    .line 8
    .line 9
    invoke-interface {p2}, LN4/b;->getContext()Ll4/g;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p1, p0, p2}, LK4/w;->a(Lu4/l;Ljava/lang/Object;Ll4/g;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 17
    .line 18
    return-object p0
.end method

.method private final J(LH4/m;J)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;J)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {v0, v1, v0}, LK4/j;->b(Ljava/lang/Object;ILkotlin/jvm/internal/j;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    const/4 v2, -0x1

    .line 8
    if-eqz p1, :cond_6

    .line 9
    .line 10
    sget v3, LH4/f;->b:I

    .line 11
    .line 12
    sub-int/2addr v3, v1

    .line 13
    :goto_1
    if-ge v2, v3, :cond_5

    .line 14
    .line 15
    iget-wide v4, p1, LK4/A;->i:J

    .line 16
    .line 17
    sget v6, LH4/f;->b:I

    .line 18
    .line 19
    int-to-long v6, v6

    .line 20
    mul-long/2addr v4, v6

    .line 21
    int-to-long v6, v3

    .line 22
    add-long/2addr v4, v6

    .line 23
    cmp-long v4, v4, p2

    .line 24
    .line 25
    if-ltz v4, :cond_6

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1, v3}, LH4/m;->B(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    if-eqz v4, :cond_3

    .line 32
    .line 33
    invoke-static {}, LH4/f;->k()LK4/D;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    if-ne v4, v5, :cond_1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    instance-of v5, v4, LH4/y;

    .line 41
    .line 42
    if-eqz v5, :cond_2

    .line 43
    .line 44
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {p1, v3, v4, v5}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-eqz v5, :cond_0

    .line 53
    .line 54
    check-cast v4, LH4/y;

    .line 55
    .line 56
    iget-object v4, v4, LH4/y;->a:LF4/Y0;

    .line 57
    .line 58
    invoke-static {v0, v4}, LK4/j;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v3, v1}, LH4/m;->C(IZ)V

    .line 63
    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_2
    instance-of v5, v4, LF4/Y0;

    .line 67
    .line 68
    if-eqz v5, :cond_4

    .line 69
    .line 70
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {p1, v3, v4, v5}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-eqz v5, :cond_0

    .line 79
    .line 80
    invoke-static {v0, v4}, LK4/j;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, v3, v1}, LH4/m;->C(IZ)V

    .line 85
    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_3
    :goto_2
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-virtual {p1, v3, v4, v5}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    if-eqz v4, :cond_0

    .line 97
    .line 98
    invoke-virtual {p1}, LK4/A;->t()V

    .line 99
    .line 100
    .line 101
    :cond_4
    :goto_3
    add-int/lit8 v3, v3, -0x1

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_5
    invoke-virtual {p1}, LK4/b;->h()LK4/b;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, LH4/m;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    if-eqz v0, :cond_8

    .line 112
    .line 113
    instance-of p1, v0, Ljava/util/ArrayList;

    .line 114
    .line 115
    if-nez p1, :cond_7

    .line 116
    .line 117
    check-cast v0, LF4/Y0;

    .line 118
    .line 119
    invoke-direct {p0, v0}, LH4/e;->O0(LF4/Y0;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_7
    const-string p1, "null cannot be cast to non-null type java.util.ArrayList<E of kotlinx.coroutines.internal.InlineList>"

    .line 124
    .line 125
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    check-cast v0, Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    sub-int/2addr p1, v1

    .line 135
    :goto_4
    if-ge v2, p1, :cond_8

    .line 136
    .line 137
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    check-cast p2, LF4/Y0;

    .line 142
    .line 143
    invoke-direct {p0, p2}, LH4/e;->O0(LF4/Y0;)V

    .line 144
    .line 145
    .line 146
    add-int/lit8 p1, p1, -0x1

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_8
    return-void
.end method

.method private final J0(LF4/Y0;LH4/m;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/Y0;",
            "LH4/m<",
            "TE;>;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, LH4/e;->G0()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1, p2, p3}, LF4/Y0;->c(LK4/A;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private final K()LH4/m;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LH4/m<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, LH4/e;->W()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, LH4/e;->f0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, LH4/m;

    .line 18
    .line 19
    iget-wide v2, v1, LK4/A;->i:J

    .line 20
    .line 21
    move-object v4, v0

    .line 22
    check-cast v4, LH4/m;

    .line 23
    .line 24
    iget-wide v4, v4, LK4/A;->i:J

    .line 25
    .line 26
    cmp-long v2, v2, v4

    .line 27
    .line 28
    if-lez v2, :cond_0

    .line 29
    .line 30
    move-object v0, v1

    .line 31
    :cond_0
    invoke-static {}, LH4/e;->b0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, LH4/m;

    .line 40
    .line 41
    iget-wide v1, p0, LK4/A;->i:J

    .line 42
    .line 43
    move-object v3, v0

    .line 44
    check-cast v3, LH4/m;

    .line 45
    .line 46
    iget-wide v3, v3, LK4/A;->i:J

    .line 47
    .line 48
    cmp-long v1, v1, v3

    .line 49
    .line 50
    if-lez v1, :cond_1

    .line 51
    .line 52
    move-object v0, p0

    .line 53
    :cond_1
    check-cast v0, LK4/b;

    .line 54
    .line 55
    invoke-static {v0}, LK4/a;->b(LK4/b;)LK4/b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, LH4/m;

    .line 60
    .line 61
    return-object p0
.end method

.method private final K0(LF4/Y0;LH4/m;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/Y0;",
            "LH4/m<",
            "TE;>;I)V"
        }
    .end annotation

    .line 1
    sget p0, LH4/f;->b:I

    .line 2
    .line 3
    add-int/2addr p3, p0

    .line 4
    invoke-interface {p1, p2, p3}, LF4/Y0;->c(LK4/A;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method static synthetic L0(LH4/e;Ll4/d;)Ljava/lang/Object;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "LH4/e<",
            "TE;>;",
            "Ll4/d<",
            "-",
            "LH4/k<",
            "+TE;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, LH4/e$e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LH4/e$e;

    .line 7
    .line 8
    iget v1, v0, LH4/e$e;->i:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LH4/e$e;->i:I

    .line 18
    .line 19
    :goto_0
    move-object v6, v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    new-instance v0, LH4/e$e;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, LH4/e$e;-><init>(LH4/e;Ll4/d;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :goto_1
    iget-object p1, v6, LH4/e$e;->g:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget v1, v6, LH4/e$e;->i:I

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    if-ne v1, v2, :cond_1

    .line 39
    .line 40
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    check-cast p1, LH4/k;

    .line 44
    .line 45
    invoke-virtual {p1}, LH4/k;->k()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 51
    .line 52
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 53
    .line 54
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p0

    .line 58
    :cond_2
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, LH4/e;->n()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, LH4/m;

    .line 70
    .line 71
    :goto_2
    invoke-virtual {p0}, LH4/e;->p0()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    sget-object p1, LH4/k;->b:LH4/k$b;

    .line 78
    .line 79
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :cond_3
    invoke-static {}, LH4/e;->o()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v4

    .line 96
    sget v1, LH4/f;->b:I

    .line 97
    .line 98
    int-to-long v7, v1

    .line 99
    div-long v7, v4, v7

    .line 100
    .line 101
    int-to-long v9, v1

    .line 102
    rem-long v9, v4, v9

    .line 103
    .line 104
    long-to-int v3, v9

    .line 105
    iget-wide v9, p1, LK4/A;->i:J

    .line 106
    .line 107
    cmp-long v1, v9, v7

    .line 108
    .line 109
    if-eqz v1, :cond_5

    .line 110
    .line 111
    invoke-static {p0, v7, v8, p1}, LH4/e;->h(LH4/e;JLH4/m;)LH4/m;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    if-nez v1, :cond_4

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_4
    move-object v8, v1

    .line 119
    goto :goto_3

    .line 120
    :cond_5
    move-object v8, p1

    .line 121
    :goto_3
    const/4 v12, 0x0

    .line 122
    move-object v7, p0

    .line 123
    move v9, v3

    .line 124
    move-wide v10, v4

    .line 125
    invoke-static/range {v7 .. v12}, LH4/e;->B(LH4/e;LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    move-object v1, v7

    .line 130
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    if-eq p0, p1, :cond_a

    .line 135
    .line 136
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    if-ne p0, p1, :cond_7

    .line 141
    .line 142
    invoke-virtual {v1}, LH4/e;->h0()J

    .line 143
    .line 144
    .line 145
    move-result-wide p0

    .line 146
    cmp-long p0, v4, p0

    .line 147
    .line 148
    if-gez p0, :cond_6

    .line 149
    .line 150
    invoke-virtual {v8}, LK4/b;->c()V

    .line 151
    .line 152
    .line 153
    :cond_6
    move-object p0, v1

    .line 154
    move-object p1, v8

    .line 155
    goto :goto_2

    .line 156
    :cond_7
    invoke-static {}, LH4/f;->s()LK4/D;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    if-ne p0, p1, :cond_9

    .line 161
    .line 162
    iput v2, v6, LH4/e$e;->i:I

    .line 163
    .line 164
    move-object v2, v8

    .line 165
    invoke-direct/range {v1 .. v6}, LH4/e;->M0(LH4/m;IJLl4/d;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    if-ne p0, v0, :cond_8

    .line 170
    .line 171
    return-object v0

    .line 172
    :cond_8
    return-object p0

    .line 173
    :cond_9
    invoke-virtual {v8}, LK4/b;->c()V

    .line 174
    .line 175
    .line 176
    sget-object p1, LH4/k;->b:LH4/k$b;

    .line 177
    .line 178
    invoke-virtual {p1, p0}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    return-object p0

    .line 183
    :cond_a
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 184
    .line 185
    const-string p1, "unexpected"

    .line 186
    .line 187
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    throw p0
.end method

.method private final M(J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LH4/e;->N(J)LH4/m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, LH4/e;->N0(LH4/m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final M0(LH4/m;IJLl4/d;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;IJ",
            "Ll4/d<",
            "-",
            "LH4/k<",
            "+TE;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p5, LH4/e$f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p5

    .line 6
    check-cast v0, LH4/e$f;

    .line 7
    .line 8
    iget v1, v0, LH4/e$f;->m:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LH4/e$f;->m:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LH4/e$f;

    .line 21
    .line 22
    invoke-direct {v0, p0, p5}, LH4/e$f;-><init>(LH4/e;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p5, v0, LH4/e$f;->k:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, LH4/e$f;->m:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    iget-object p0, v0, LH4/e$f;->h:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p0, LH4/m;

    .line 41
    .line 42
    iget-object p0, v0, LH4/e$f;->g:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, LH4/e;

    .line 45
    .line 46
    invoke-static {p5}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    goto/16 :goto_5

    .line 50
    .line 51
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 52
    .line 53
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 54
    .line 55
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p0

    .line 59
    :cond_2
    invoke-static {p5}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iput-object p0, v0, LH4/e$f;->g:Ljava/lang/Object;

    .line 63
    .line 64
    iput-object p1, v0, LH4/e$f;->h:Ljava/lang/Object;

    .line 65
    .line 66
    iput p2, v0, LH4/e$f;->i:I

    .line 67
    .line 68
    iput-wide p3, v0, LH4/e$f;->j:J

    .line 69
    .line 70
    iput v3, v0, LH4/e$f;->m:I

    .line 71
    .line 72
    invoke-static {v0}, Lm4/b;->c(Ll4/d;)Ll4/d;

    .line 73
    .line 74
    .line 75
    move-result-object p5

    .line 76
    invoke-static {p5}, LF4/n;->b(Ll4/d;)LF4/l;

    .line 77
    .line 78
    .line 79
    move-result-object p5

    .line 80
    :try_start_0
    new-instance v7, LH4/v;

    .line 81
    .line 82
    const-string v2, "null cannot be cast to non-null type kotlinx.coroutines.CancellableContinuationImpl<kotlinx.coroutines.channels.ChannelResult<E of kotlinx.coroutines.channels.BufferedChannel.receiveCatchingOnNoWaiterSuspend_GKJJFZk$lambda$38>>"

    .line 83
    .line 84
    invoke-static {p5, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-direct {v7, p5}, LH4/v;-><init>(LF4/l;)V

    .line 88
    .line 89
    .line 90
    move-object v2, p0

    .line 91
    move-object v3, p1

    .line 92
    move v4, p2

    .line 93
    move-wide v5, p3

    .line 94
    invoke-static/range {v2 .. v7}, LH4/e;->B(LH4/e;LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    if-ne p0, p1, :cond_3

    .line 103
    .line 104
    invoke-static {v2, v7, v3, v4}, LH4/e;->y(LH4/e;LF4/Y0;LH4/m;I)V

    .line 105
    .line 106
    .line 107
    goto/16 :goto_4

    .line 108
    .line 109
    :catchall_0
    move-exception v0

    .line 110
    move-object p0, v0

    .line 111
    goto/16 :goto_6

    .line 112
    .line 113
    :cond_3
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const/4 p2, 0x0

    .line 118
    if-ne p0, p1, :cond_d

    .line 119
    .line 120
    invoke-virtual {v2}, LH4/e;->h0()J

    .line 121
    .line 122
    .line 123
    move-result-wide p0

    .line 124
    cmp-long p0, v5, p0

    .line 125
    .line 126
    if-gez p0, :cond_4

    .line 127
    .line 128
    invoke-virtual {v3}, LK4/b;->c()V

    .line 129
    .line 130
    .line 131
    :cond_4
    invoke-static {}, LH4/e;->n()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    check-cast p0, LH4/m;

    .line 140
    .line 141
    :goto_1
    invoke-virtual {v2}, LH4/e;->p0()Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-eqz p1, :cond_5

    .line 146
    .line 147
    invoke-static {v2, p5}, LH4/e;->w(LH4/e;LF4/k;)V

    .line 148
    .line 149
    .line 150
    goto/16 :goto_4

    .line 151
    .line 152
    :cond_5
    invoke-static {}, LH4/e;->o()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 157
    .line 158
    .line 159
    move-result-wide v5

    .line 160
    sget p1, LH4/f;->b:I

    .line 161
    .line 162
    int-to-long p3, p1

    .line 163
    div-long p3, v5, p3

    .line 164
    .line 165
    int-to-long v3, p1

    .line 166
    rem-long v3, v5, v3

    .line 167
    .line 168
    long-to-int v4, v3

    .line 169
    iget-wide v8, p0, LK4/A;->i:J

    .line 170
    .line 171
    cmp-long p1, v8, p3

    .line 172
    .line 173
    if-eqz p1, :cond_7

    .line 174
    .line 175
    invoke-static {v2, p3, p4, p0}, LH4/e;->h(LH4/e;JLH4/m;)LH4/m;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    if-nez p1, :cond_6

    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_6
    move-object v3, p1

    .line 183
    goto :goto_2

    .line 184
    :cond_7
    move-object v3, p0

    .line 185
    :goto_2
    invoke-static/range {v2 .. v7}, LH4/e;->B(LH4/e;LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    move-object p1, v3

    .line 190
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 191
    .line 192
    .line 193
    move-result-object p3

    .line 194
    if-ne p0, p3, :cond_8

    .line 195
    .line 196
    invoke-static {v2, v7, p1, v4}, LH4/e;->y(LH4/e;LF4/Y0;LH4/m;I)V

    .line 197
    .line 198
    .line 199
    goto :goto_4

    .line 200
    :cond_8
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 201
    .line 202
    .line 203
    move-result-object p3

    .line 204
    if-ne p0, p3, :cond_a

    .line 205
    .line 206
    invoke-virtual {v2}, LH4/e;->h0()J

    .line 207
    .line 208
    .line 209
    move-result-wide p3

    .line 210
    cmp-long p0, v5, p3

    .line 211
    .line 212
    if-gez p0, :cond_9

    .line 213
    .line 214
    invoke-virtual {p1}, LK4/b;->c()V

    .line 215
    .line 216
    .line 217
    :cond_9
    move-object p0, p1

    .line 218
    goto :goto_1

    .line 219
    :cond_a
    invoke-static {}, LH4/f;->s()LK4/D;

    .line 220
    .line 221
    .line 222
    move-result-object p3

    .line 223
    if-eq p0, p3, :cond_c

    .line 224
    .line 225
    invoke-virtual {p1}, LK4/b;->c()V

    .line 226
    .line 227
    .line 228
    sget-object p1, LH4/k;->b:LH4/k$b;

    .line 229
    .line 230
    invoke-virtual {p1, p0}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-static {p0}, LH4/k;->b(Ljava/lang/Object;)LH4/k;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    iget-object p1, v2, LH4/e;->h:Lu4/l;

    .line 239
    .line 240
    if-eqz p1, :cond_b

    .line 241
    .line 242
    invoke-static {v2, p1}, LH4/e;->g(LH4/e;Lu4/l;)LB4/f;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    :cond_b
    check-cast p2, Lu4/q;

    .line 247
    .line 248
    :goto_3
    invoke-virtual {p5, p0, p2}, LF4/l;->N(Ljava/lang/Object;Lu4/q;)V

    .line 249
    .line 250
    .line 251
    goto :goto_4

    .line 252
    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 253
    .line 254
    const-string p1, "unexpected"

    .line 255
    .line 256
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    throw p0

    .line 260
    :cond_d
    invoke-virtual {v3}, LK4/b;->c()V

    .line 261
    .line 262
    .line 263
    sget-object p1, LH4/k;->b:LH4/k$b;

    .line 264
    .line 265
    invoke-virtual {p1, p0}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-static {p0}, LH4/k;->b(Ljava/lang/Object;)LH4/k;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    iget-object p1, v2, LH4/e;->h:Lu4/l;

    .line 274
    .line 275
    if-eqz p1, :cond_e

    .line 276
    .line 277
    invoke-static {v2, p1}, LH4/e;->g(LH4/e;Lu4/l;)LB4/f;

    .line 278
    .line 279
    .line 280
    move-result-object p2

    .line 281
    :cond_e
    check-cast p2, Lu4/q;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    .line 283
    goto :goto_3

    .line 284
    :goto_4
    invoke-virtual {p5}, LF4/l;->x()Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object p5

    .line 288
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    if-ne p5, p0, :cond_f

    .line 293
    .line 294
    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 295
    .line 296
    .line 297
    :cond_f
    if-ne p5, v1, :cond_10

    .line 298
    .line 299
    return-object v1

    .line 300
    :cond_10
    :goto_5
    check-cast p5, LH4/k;

    .line 301
    .line 302
    invoke-virtual {p5}, LH4/k;->k()Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    return-object p0

    .line 307
    :goto_6
    invoke-virtual {p5}, LF4/l;->L()V

    .line 308
    .line 309
    .line 310
    throw p0
.end method

.method private final N(J)LH4/m;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "LH4/m<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LH4/e;->K()LH4/m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, LH4/e;->s0()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, v0}, LH4/e;->u0(LH4/m;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    const-wide/16 v3, -0x1

    .line 16
    .line 17
    cmp-long v3, v1, v3

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v1, v2}, LH4/e;->P(J)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-direct {p0, v0, p1, p2}, LH4/e;->J(LH4/m;J)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method private final N0(LH4/m;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LH4/e;->h:Lu4/l;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-static {v1, v2, v1}, LK4/j;->b(Ljava/lang/Object;ILkotlin/jvm/internal/j;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    :cond_0
    sget v4, LH4/f;->b:I

    .line 10
    .line 11
    sub-int/2addr v4, v2

    .line 12
    :goto_0
    const/4 v5, -0x1

    .line 13
    if-ge v5, v4, :cond_b

    .line 14
    .line 15
    iget-wide v6, p1, LK4/A;->i:J

    .line 16
    .line 17
    sget v8, LH4/f;->b:I

    .line 18
    .line 19
    int-to-long v8, v8

    .line 20
    mul-long/2addr v6, v8

    .line 21
    int-to-long v8, v4

    .line 22
    add-long/2addr v6, v8

    .line 23
    :cond_1
    invoke-virtual {p1, v4}, LH4/m;->B(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 28
    .line 29
    .line 30
    move-result-object v9

    .line 31
    if-eq v8, v9, :cond_c

    .line 32
    .line 33
    sget-object v9, LH4/f;->d:LK4/D;

    .line 34
    .line 35
    if-ne v8, v9, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 38
    .line 39
    .line 40
    move-result-wide v9

    .line 41
    cmp-long v9, v6, v9

    .line 42
    .line 43
    if-ltz v9, :cond_c

    .line 44
    .line 45
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    invoke-virtual {p1, v4, v8, v9}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    if-eqz v8, :cond_1

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1, v4}, LH4/m;->A(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-static {v0, v5, v1}, LK4/w;->b(Lu4/l;Ljava/lang/Object;LK4/P;)LK4/P;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    :cond_2
    invoke-virtual {p1, v4}, LH4/m;->w(I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, LK4/A;->t()V

    .line 69
    .line 70
    .line 71
    goto/16 :goto_4

    .line 72
    .line 73
    :cond_3
    invoke-static {}, LH4/f;->k()LK4/D;

    .line 74
    .line 75
    .line 76
    move-result-object v9

    .line 77
    if-eq v8, v9, :cond_a

    .line 78
    .line 79
    if-nez v8, :cond_4

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_4
    instance-of v9, v8, LF4/Y0;

    .line 83
    .line 84
    if-nez v9, :cond_7

    .line 85
    .line 86
    instance-of v9, v8, LH4/y;

    .line 87
    .line 88
    if-eqz v9, :cond_5

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_5
    invoke-static {}, LH4/f;->p()LK4/D;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    if-eq v8, v9, :cond_c

    .line 96
    .line 97
    invoke-static {}, LH4/f;->q()LK4/D;

    .line 98
    .line 99
    .line 100
    move-result-object v9

    .line 101
    if-ne v8, v9, :cond_6

    .line 102
    .line 103
    goto :goto_5

    .line 104
    :cond_6
    invoke-static {}, LH4/f;->p()LK4/D;

    .line 105
    .line 106
    .line 107
    move-result-object v9

    .line 108
    if-eq v8, v9, :cond_1

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_7
    :goto_1
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 112
    .line 113
    .line 114
    move-result-wide v9

    .line 115
    cmp-long v9, v6, v9

    .line 116
    .line 117
    if-ltz v9, :cond_c

    .line 118
    .line 119
    instance-of v9, v8, LH4/y;

    .line 120
    .line 121
    if-eqz v9, :cond_8

    .line 122
    .line 123
    move-object v9, v8

    .line 124
    check-cast v9, LH4/y;

    .line 125
    .line 126
    iget-object v9, v9, LH4/y;->a:LF4/Y0;

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_8
    move-object v9, v8

    .line 130
    check-cast v9, LF4/Y0;

    .line 131
    .line 132
    :goto_2
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 133
    .line 134
    .line 135
    move-result-object v10

    .line 136
    invoke-virtual {p1, v4, v8, v10}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    if-eqz v8, :cond_1

    .line 141
    .line 142
    if-eqz v0, :cond_9

    .line 143
    .line 144
    invoke-virtual {p1, v4}, LH4/m;->A(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    invoke-static {v0, v5, v1}, LK4/w;->b(Lu4/l;Ljava/lang/Object;LK4/P;)LK4/P;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    :cond_9
    invoke-static {v3, v9}, LK4/j;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {p1, v4}, LH4/m;->w(I)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1}, LK4/A;->t()V

    .line 160
    .line 161
    .line 162
    goto :goto_4

    .line 163
    :cond_a
    :goto_3
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 164
    .line 165
    .line 166
    move-result-object v9

    .line 167
    invoke-virtual {p1, v4, v8, v9}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v8

    .line 171
    if-eqz v8, :cond_1

    .line 172
    .line 173
    invoke-virtual {p1}, LK4/A;->t()V

    .line 174
    .line 175
    .line 176
    :goto_4
    add-int/lit8 v4, v4, -0x1

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    invoke-virtual {p1}, LK4/b;->h()LK4/b;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    check-cast p1, LH4/m;

    .line 185
    .line 186
    if-nez p1, :cond_0

    .line 187
    .line 188
    :cond_c
    :goto_5
    if-eqz v3, :cond_e

    .line 189
    .line 190
    instance-of p1, v3, Ljava/util/ArrayList;

    .line 191
    .line 192
    if-nez p1, :cond_d

    .line 193
    .line 194
    check-cast v3, LF4/Y0;

    .line 195
    .line 196
    invoke-direct {p0, v3}, LH4/e;->P0(LF4/Y0;)V

    .line 197
    .line 198
    .line 199
    goto :goto_7

    .line 200
    :cond_d
    const-string p1, "null cannot be cast to non-null type java.util.ArrayList<E of kotlinx.coroutines.internal.InlineList>"

    .line 201
    .line 202
    invoke-static {v3, p1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    check-cast v3, Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    sub-int/2addr p1, v2

    .line 212
    :goto_6
    if-ge v5, p1, :cond_e

    .line 213
    .line 214
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, LF4/Y0;

    .line 219
    .line 220
    invoke-direct {p0, v0}, LH4/e;->P0(LF4/Y0;)V

    .line 221
    .line 222
    .line 223
    add-int/lit8 p1, p1, -0x1

    .line 224
    .line 225
    goto :goto_6

    .line 226
    :cond_e
    :goto_7
    if-nez v1, :cond_f

    .line 227
    .line 228
    return-void

    .line 229
    :cond_f
    throw v1
.end method

.method private final O()V
    .locals 0

    .line 1
    invoke-virtual {p0}, LH4/e;->q()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final O0(LF4/Y0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, LH4/e;->Q0(LF4/Y0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private final P0(LF4/Y0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, LH4/e;->Q0(LF4/Y0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private final Q()V
    .locals 13

    .line 1
    invoke-direct {p0}, LH4/e;->t0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, LH4/e;->W()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, LH4/m;

    .line 17
    .line 18
    move-object v4, v0

    .line 19
    :goto_0
    invoke-static {}, LH4/e;->U()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v5

    .line 27
    sget v0, LH4/f;->b:I

    .line 28
    .line 29
    int-to-long v1, v0

    .line 30
    div-long v2, v5, v1

    .line 31
    .line 32
    invoke-virtual {p0}, LH4/e;->h0()J

    .line 33
    .line 34
    .line 35
    move-result-wide v7

    .line 36
    cmp-long v1, v7, v5

    .line 37
    .line 38
    const/4 v7, 0x0

    .line 39
    const/4 v8, 0x1

    .line 40
    const-wide/16 v9, 0x0

    .line 41
    .line 42
    if-gtz v1, :cond_2

    .line 43
    .line 44
    iget-wide v0, v4, LK4/A;->i:J

    .line 45
    .line 46
    cmp-long v0, v0, v2

    .line 47
    .line 48
    if-gez v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {v4}, LK4/b;->f()LK4/b;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-direct {p0, v2, v3, v4}, LH4/e;->y0(JLH4/m;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    invoke-static {p0, v9, v10, v8, v7}, LH4/e;->l0(LH4/e;JILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    iget-wide v11, v4, LK4/A;->i:J

    .line 64
    .line 65
    cmp-long v1, v11, v2

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    move-object v1, p0

    .line 70
    invoke-direct/range {v1 .. v6}, LH4/e;->R(JLH4/m;J)LH4/m;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    if-nez p0, :cond_3

    .line 75
    .line 76
    :goto_1
    move-object p0, v1

    .line 77
    goto :goto_0

    .line 78
    :cond_3
    move-object v4, p0

    .line 79
    goto :goto_2

    .line 80
    :cond_4
    move-object v1, p0

    .line 81
    :goto_2
    int-to-long v2, v0

    .line 82
    rem-long v2, v5, v2

    .line 83
    .line 84
    long-to-int p0, v2

    .line 85
    invoke-direct {v1, v4, p0, v5, v6}, LH4/e;->X0(LH4/m;IJ)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_5

    .line 90
    .line 91
    invoke-static {v1, v9, v10, v8, v7}, LH4/e;->l0(LH4/e;JILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    invoke-static {v1, v9, v10, v8, v7}, LH4/e;->l0(LH4/e;JILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    goto :goto_1
.end method

.method private final Q0(LF4/Y0;Z)V
    .locals 1

    .line 1
    instance-of v0, p1, LH4/e$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, LH4/e$b;

    .line 6
    .line 7
    invoke-virtual {p1}, LH4/e$b;->a()LF4/k;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Lh4/m;->g:Lh4/m$a;

    .line 12
    .line 13
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-static {p1}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    instance-of v0, p1, LF4/k;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    check-cast p1, Ll4/d;

    .line 28
    .line 29
    sget-object v0, Lh4/m;->g:Lh4/m$a;

    .line 30
    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    invoke-direct {p0}, LH4/e;->a0()Ljava/lang/Throwable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p0}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    :goto_0
    invoke-static {p0}, Lh4/n;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p1, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    instance-of p2, p1, LH4/v;

    .line 55
    .line 56
    if-eqz p2, :cond_3

    .line 57
    .line 58
    check-cast p1, LH4/v;

    .line 59
    .line 60
    iget-object p1, p1, LH4/v;->g:LF4/l;

    .line 61
    .line 62
    sget-object p2, Lh4/m;->g:Lh4/m$a;

    .line 63
    .line 64
    sget-object p2, LH4/k;->b:LH4/k$b;

    .line 65
    .line 66
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p2, p0}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, LH4/k;->b(Ljava/lang/Object;)LH4/k;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p1, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_3
    instance-of p2, p1, LH4/e$a;

    .line 87
    .line 88
    if-eqz p2, :cond_4

    .line 89
    .line 90
    check-cast p1, LH4/e$a;

    .line 91
    .line 92
    invoke-virtual {p1}, LH4/e$a;->j()V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_4
    instance-of p2, p1, LN4/b;

    .line 97
    .line 98
    if-eqz p2, :cond_5

    .line 99
    .line 100
    check-cast p1, LN4/b;

    .line 101
    .line 102
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-interface {p1, p0, p2}, LN4/b;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 111
    .line 112
    new-instance p2, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v0, "Unexpected waiter: "

    .line 118
    .line 119
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    throw p0
.end method

.method private final R(JLH4/m;J)LH4/m;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "LH4/m<",
            "TE;>;J)",
            "LH4/m<",
            "TE;>;"
        }
    .end annotation

    .line 1
    move-wide v2, p1

    .line 2
    invoke-static {}, LH4/e;->W()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {}, LH4/f;->y()LB4/f;

    .line 7
    .line 8
    .line 9
    move-result-object v4

    .line 10
    check-cast v4, Lu4/p;

    .line 11
    .line 12
    move-object/from16 v5, p3

    .line 13
    .line 14
    :goto_0
    invoke-static {v5, v2, v3, v4}, LK4/a;->c(LK4/A;JLu4/p;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    invoke-static {v6}, LK4/B;->c(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v7

    .line 22
    if-nez v7, :cond_4

    .line 23
    .line 24
    invoke-static {v6}, LK4/B;->b(Ljava/lang/Object;)LK4/A;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    :cond_0
    :goto_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v8

    .line 32
    check-cast v8, LK4/A;

    .line 33
    .line 34
    iget-wide v9, v8, LK4/A;->i:J

    .line 35
    .line 36
    iget-wide v11, v7, LK4/A;->i:J

    .line 37
    .line 38
    cmp-long v9, v9, v11

    .line 39
    .line 40
    if-ltz v9, :cond_1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_1
    invoke-virtual {v7}, LK4/A;->u()Z

    .line 44
    .line 45
    .line 46
    move-result v9

    .line 47
    if-nez v9, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-static {v0, p0, v8, v7}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    if-eqz v9, :cond_3

    .line 55
    .line 56
    invoke-virtual {v8}, LK4/A;->p()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    invoke-virtual {v8}, LK4/b;->n()V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    invoke-virtual {v7}, LK4/A;->p()Z

    .line 67
    .line 68
    .line 69
    move-result v8

    .line 70
    if-eqz v8, :cond_0

    .line 71
    .line 72
    invoke-virtual {v7}, LK4/b;->n()V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    :goto_2
    invoke-static {v6}, LK4/B;->c(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    const/4 v7, 0x1

    .line 81
    const-wide/16 v8, 0x0

    .line 82
    .line 83
    const/4 v10, 0x0

    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    invoke-direct {p0}, LH4/e;->O()V

    .line 87
    .line 88
    .line 89
    invoke-direct/range {p0 .. p3}, LH4/e;->y0(JLH4/m;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0, v8, v9, v7, v10}, LH4/e;->l0(LH4/e;JILjava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-object v10

    .line 96
    :cond_5
    invoke-static {v6}, LK4/B;->b(Ljava/lang/Object;)LK4/A;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    move-object v6, v0

    .line 101
    check-cast v6, LH4/m;

    .line 102
    .line 103
    iget-wide v4, v6, LK4/A;->i:J

    .line 104
    .line 105
    cmp-long v0, v4, v2

    .line 106
    .line 107
    if-lez v0, :cond_7

    .line 108
    .line 109
    invoke-static {}, LH4/e;->U()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    const-wide/16 v2, 0x1

    .line 114
    .line 115
    add-long v2, p4, v2

    .line 116
    .line 117
    iget-wide v4, v6, LK4/A;->i:J

    .line 118
    .line 119
    sget v11, LH4/f;->b:I

    .line 120
    .line 121
    int-to-long v12, v11

    .line 122
    mul-long/2addr v4, v12

    .line 123
    move-object v1, p0

    .line 124
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_6

    .line 129
    .line 130
    iget-wide v2, v6, LK4/A;->i:J

    .line 131
    .line 132
    int-to-long v4, v11

    .line 133
    mul-long/2addr v2, v4

    .line 134
    sub-long v2, v2, p4

    .line 135
    .line 136
    invoke-direct {p0, v2, v3}, LH4/e;->k0(J)V

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_6
    invoke-static {p0, v8, v9, v7, v10}, LH4/e;->l0(LH4/e;JILjava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    :goto_3
    return-object v10

    .line 144
    :cond_7
    return-object v6
.end method

.method static synthetic R0(LH4/e;Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "LH4/e<",
            "TE;>;TE;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {}, LH4/e;->r()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, LH4/m;

    .line 10
    .line 11
    :cond_0
    :goto_0
    invoke-static {}, LH4/e;->s()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    const-wide v3, 0xfffffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    and-long v9, v1, v3

    .line 25
    .line 26
    invoke-static {p0, v1, v2}, LH4/e;->t(LH4/e;J)Z

    .line 27
    .line 28
    .line 29
    move-result v12

    .line 30
    sget v1, LH4/f;->b:I

    .line 31
    .line 32
    int-to-long v2, v1

    .line 33
    div-long v2, v9, v2

    .line 34
    .line 35
    int-to-long v4, v1

    .line 36
    rem-long v4, v9, v4

    .line 37
    .line 38
    long-to-int v7, v4

    .line 39
    iget-wide v4, v0, LK4/A;->i:J

    .line 40
    .line 41
    cmp-long v1, v4, v2

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-static {p0, v2, v3, v0}, LH4/e;->i(LH4/e;JLH4/m;)LH4/m;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    if-eqz v12, :cond_0

    .line 52
    .line 53
    invoke-direct {p0, p1, p2}, LH4/e;->D0(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    if-ne p0, p1, :cond_9

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_1
    move-object v6, v1

    .line 65
    goto :goto_1

    .line 66
    :cond_2
    move-object v6, v0

    .line 67
    :goto_1
    const/4 v11, 0x0

    .line 68
    move-object v5, p0

    .line 69
    move-object v8, p1

    .line 70
    invoke-static/range {v5 .. v12}, LH4/e;->C(LH4/e;LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_8

    .line 75
    .line 76
    const/4 p1, 0x1

    .line 77
    if-eq p0, p1, :cond_9

    .line 78
    .line 79
    const/4 p1, 0x2

    .line 80
    if-eq p0, p1, :cond_7

    .line 81
    .line 82
    const/4 p1, 0x3

    .line 83
    if-eq p0, p1, :cond_6

    .line 84
    .line 85
    const/4 p1, 0x4

    .line 86
    if-eq p0, p1, :cond_4

    .line 87
    .line 88
    const/4 p1, 0x5

    .line 89
    if-eq p0, p1, :cond_3

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    invoke-virtual {v6}, LK4/b;->c()V

    .line 93
    .line 94
    .line 95
    :goto_2
    move-object p0, v5

    .line 96
    move-object v0, v6

    .line 97
    move-object p1, v8

    .line 98
    goto :goto_0

    .line 99
    :cond_4
    invoke-virtual {v5}, LH4/e;->d0()J

    .line 100
    .line 101
    .line 102
    move-result-wide p0

    .line 103
    cmp-long p0, v9, p0

    .line 104
    .line 105
    if-gez p0, :cond_5

    .line 106
    .line 107
    invoke-virtual {v6}, LK4/b;->c()V

    .line 108
    .line 109
    .line 110
    :cond_5
    invoke-direct {v5, v8, p2}, LH4/e;->D0(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    if-ne p0, p1, :cond_9

    .line 119
    .line 120
    return-object p0

    .line 121
    :cond_6
    move-object v11, p2

    .line 122
    invoke-direct/range {v5 .. v11}, LH4/e;->S0(LH4/m;ILjava/lang/Object;JLl4/d;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    if-ne p0, p1, :cond_9

    .line 131
    .line 132
    return-object p0

    .line 133
    :cond_7
    move-object v11, p2

    .line 134
    if-eqz v12, :cond_9

    .line 135
    .line 136
    invoke-virtual {v6}, LK4/A;->t()V

    .line 137
    .line 138
    .line 139
    invoke-direct {v5, v8, v11}, LH4/e;->D0(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    if-ne p0, p1, :cond_9

    .line 148
    .line 149
    return-object p0

    .line 150
    :cond_8
    invoke-virtual {v6}, LK4/b;->c()V

    .line 151
    .line 152
    .line 153
    :cond_9
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 154
    .line 155
    return-object p0
.end method

.method private final S(JLH4/m;)LH4/m;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "LH4/m<",
            "TE;>;)",
            "LH4/m<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, LH4/e;->b0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, LH4/f;->y()LB4/f;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lu4/p;

    .line 10
    .line 11
    :goto_0
    invoke-static {p3, p1, p2, v1}, LK4/a;->c(LK4/A;JLu4/p;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, LK4/B;->c(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-nez v3, :cond_4

    .line 20
    .line 21
    invoke-static {v2}, LK4/B;->b(Ljava/lang/Object;)LK4/A;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    :cond_0
    :goto_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    check-cast v4, LK4/A;

    .line 30
    .line 31
    iget-wide v5, v4, LK4/A;->i:J

    .line 32
    .line 33
    iget-wide v7, v3, LK4/A;->i:J

    .line 34
    .line 35
    cmp-long v5, v5, v7

    .line 36
    .line 37
    if-ltz v5, :cond_1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    invoke-virtual {v3}, LK4/A;->u()Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-nez v5, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-static {v0, p0, v4, v3}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_3

    .line 52
    .line 53
    invoke-virtual {v4}, LK4/A;->p()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    invoke-virtual {v4}, LK4/b;->n()V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_3
    invoke-virtual {v3}, LK4/A;->p()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_0

    .line 68
    .line 69
    invoke-virtual {v3}, LK4/b;->n()V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    :goto_2
    invoke-static {v2}, LK4/B;->c(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    const/4 v1, 0x0

    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    invoke-direct {p0}, LH4/e;->O()V

    .line 81
    .line 82
    .line 83
    iget-wide p1, p3, LK4/A;->i:J

    .line 84
    .line 85
    sget v0, LH4/f;->b:I

    .line 86
    .line 87
    int-to-long v2, v0

    .line 88
    mul-long/2addr p1, v2

    .line 89
    invoke-virtual {p0}, LH4/e;->h0()J

    .line 90
    .line 91
    .line 92
    move-result-wide v2

    .line 93
    cmp-long p0, p1, v2

    .line 94
    .line 95
    if-gez p0, :cond_5

    .line 96
    .line 97
    invoke-virtual {p3}, LK4/b;->c()V

    .line 98
    .line 99
    .line 100
    :cond_5
    return-object v1

    .line 101
    :cond_6
    invoke-static {v2}, LK4/B;->b(Ljava/lang/Object;)LK4/A;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    check-cast p3, LH4/m;

    .line 106
    .line 107
    invoke-direct {p0}, LH4/e;->t0()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_9

    .line 112
    .line 113
    invoke-direct {p0}, LH4/e;->V()J

    .line 114
    .line 115
    .line 116
    move-result-wide v2

    .line 117
    sget v0, LH4/f;->b:I

    .line 118
    .line 119
    int-to-long v4, v0

    .line 120
    div-long/2addr v2, v4

    .line 121
    cmp-long v0, p1, v2

    .line 122
    .line 123
    if-gtz v0, :cond_9

    .line 124
    .line 125
    invoke-static {}, LH4/e;->W()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    :cond_7
    :goto_3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, LK4/A;

    .line 134
    .line 135
    iget-wide v3, v2, LK4/A;->i:J

    .line 136
    .line 137
    iget-wide v5, p3, LK4/A;->i:J

    .line 138
    .line 139
    cmp-long v3, v3, v5

    .line 140
    .line 141
    if-gez v3, :cond_9

    .line 142
    .line 143
    invoke-virtual {p3}, LK4/A;->u()Z

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    if-eqz v3, :cond_9

    .line 148
    .line 149
    invoke-static {v0, p0, v2, p3}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    if-eqz v3, :cond_8

    .line 154
    .line 155
    invoke-virtual {v2}, LK4/A;->p()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_9

    .line 160
    .line 161
    invoke-virtual {v2}, LK4/b;->n()V

    .line 162
    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_8
    invoke-virtual {p3}, LK4/A;->p()Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-eqz v2, :cond_7

    .line 170
    .line 171
    invoke-virtual {p3}, LK4/b;->n()V

    .line 172
    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_9
    :goto_4
    iget-wide v2, p3, LK4/A;->i:J

    .line 176
    .line 177
    cmp-long p1, v2, p1

    .line 178
    .line 179
    if-lez p1, :cond_b

    .line 180
    .line 181
    sget p1, LH4/f;->b:I

    .line 182
    .line 183
    int-to-long v4, p1

    .line 184
    mul-long/2addr v2, v4

    .line 185
    invoke-direct {p0, v2, v3}, LH4/e;->d1(J)V

    .line 186
    .line 187
    .line 188
    iget-wide v2, p3, LK4/A;->i:J

    .line 189
    .line 190
    int-to-long p1, p1

    .line 191
    mul-long/2addr v2, p1

    .line 192
    invoke-virtual {p0}, LH4/e;->h0()J

    .line 193
    .line 194
    .line 195
    move-result-wide p0

    .line 196
    cmp-long p0, v2, p0

    .line 197
    .line 198
    if-gez p0, :cond_a

    .line 199
    .line 200
    invoke-virtual {p3}, LK4/b;->c()V

    .line 201
    .line 202
    .line 203
    :cond_a
    return-object v1

    .line 204
    :cond_b
    return-object p3
.end method

.method private final S0(LH4/m;ILjava/lang/Object;JLl4/d;)Ljava/lang/Object;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;ITE;J",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static/range {p6 .. p6}, Lm4/b;->c(Ll4/d;)Ll4/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, LF4/n;->b(Ll4/d;)LF4/l;

    .line 6
    .line 7
    .line 8
    move-result-object v6

    .line 9
    const/4 v7, 0x0

    .line 10
    move-object v0, p0

    .line 11
    move-object/from16 v1, p1

    .line 12
    .line 13
    move/from16 v2, p2

    .line 14
    .line 15
    move-object/from16 v3, p3

    .line 16
    .line 17
    move-wide/from16 v4, p4

    .line 18
    .line 19
    :try_start_0
    invoke-static/range {v0 .. v7}, LH4/e;->C(LH4/e;LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 20
    .line 21
    .line 22
    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    if-eqz v7, :cond_10

    .line 24
    .line 25
    const/4 v8, 0x1

    .line 26
    if-eq v7, v8, :cond_f

    .line 27
    .line 28
    const/4 v9, 0x2

    .line 29
    if-eq v7, v9, :cond_e

    .line 30
    .line 31
    const/4 v10, 0x4

    .line 32
    if-eq v7, v10, :cond_d

    .line 33
    .line 34
    const-string v11, "unexpected"

    .line 35
    .line 36
    const/4 v12, 0x5

    .line 37
    if-ne v7, v12, :cond_c

    .line 38
    .line 39
    :try_start_1
    invoke-virtual/range {p1 .. p1}, LK4/b;->c()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, LH4/e;->r()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, LH4/m;

    .line 51
    .line 52
    :goto_0
    invoke-static {}, LH4/e;->s()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    const-wide v13, 0xfffffffffffffffL

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    and-long/2addr v13, v4

    .line 66
    invoke-static {p0, v4, v5}, LH4/e;->t(LH4/e;J)Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    sget v2, LH4/f;->b:I

    .line 71
    .line 72
    int-to-long v4, v2

    .line 73
    div-long v4, v13, v4

    .line 74
    .line 75
    move-wide/from16 p4, v13

    .line 76
    .line 77
    int-to-long v12, v2

    .line 78
    rem-long v13, p4, v12

    .line 79
    .line 80
    long-to-int v2, v13

    .line 81
    iget-wide v12, v1, LK4/A;->i:J

    .line 82
    .line 83
    cmp-long v12, v12, v4

    .line 84
    .line 85
    if-eqz v12, :cond_3

    .line 86
    .line 87
    invoke-static {p0, v4, v5, v1}, LH4/e;->i(LH4/e;JLH4/m;)LH4/m;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    if-nez v4, :cond_2

    .line 92
    .line 93
    if-eqz v7, :cond_1

    .line 94
    .line 95
    :cond_0
    :goto_1
    invoke-static {p0, v3, v6}, LH4/e;->x(LH4/e;Ljava/lang/Object;LF4/k;)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_5

    .line 99
    .line 100
    :catchall_0
    move-exception v0

    .line 101
    move-object p0, v0

    .line 102
    goto/16 :goto_6

    .line 103
    .line 104
    :cond_1
    const/4 v12, 0x5

    .line 105
    goto :goto_0

    .line 106
    :cond_2
    move-object v1, v4

    .line 107
    :cond_3
    move-object v0, p0

    .line 108
    move-wide/from16 v4, p4

    .line 109
    .line 110
    invoke-static/range {v0 .. v7}, LH4/e;->C(LH4/e;LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 111
    .line 112
    .line 113
    move-result v12

    .line 114
    if-eqz v12, :cond_b

    .line 115
    .line 116
    if-eq v12, v8, :cond_a

    .line 117
    .line 118
    if-eq v12, v9, :cond_7

    .line 119
    .line 120
    const/4 v2, 0x3

    .line 121
    if-eq v12, v2, :cond_6

    .line 122
    .line 123
    if-eq v12, v10, :cond_5

    .line 124
    .line 125
    const/4 v2, 0x5

    .line 126
    if-eq v12, v2, :cond_4

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_4
    invoke-virtual {v1}, LK4/b;->c()V

    .line 130
    .line 131
    .line 132
    :goto_2
    move v12, v2

    .line 133
    goto :goto_0

    .line 134
    :cond_5
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 135
    .line 136
    .line 137
    move-result-wide v7

    .line 138
    cmp-long v2, v4, v7

    .line 139
    .line 140
    if-gez v2, :cond_0

    .line 141
    .line 142
    invoke-virtual {v1}, LK4/b;->c()V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 147
    .line 148
    invoke-direct {p0, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    throw p0

    .line 152
    :cond_7
    if-eqz v7, :cond_8

    .line 153
    .line 154
    invoke-virtual {v1}, LK4/A;->t()V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_8
    if-eqz v6, :cond_9

    .line 159
    .line 160
    move-object v3, v6

    .line 161
    goto :goto_3

    .line 162
    :cond_9
    const/4 v3, 0x0

    .line 163
    :goto_3
    if-eqz v3, :cond_11

    .line 164
    .line 165
    invoke-static {p0, v3, v1, v2}, LH4/e;->z(LH4/e;LF4/Y0;LH4/m;I)V

    .line 166
    .line 167
    .line 168
    goto :goto_5

    .line 169
    :cond_a
    sget-object p0, Lh4/m;->g:Lh4/m$a;

    .line 170
    .line 171
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 172
    .line 173
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    :goto_4
    invoke-interface {v6, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    goto :goto_5

    .line 181
    :cond_b
    invoke-virtual {v1}, LK4/b;->c()V

    .line 182
    .line 183
    .line 184
    sget-object p0, Lh4/m;->g:Lh4/m$a;

    .line 185
    .line 186
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 187
    .line 188
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    goto :goto_4

    .line 193
    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 194
    .line 195
    invoke-direct {p0, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    throw p0

    .line 199
    :cond_d
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 200
    .line 201
    .line 202
    move-result-wide v1

    .line 203
    cmp-long v1, p4, v1

    .line 204
    .line 205
    if-gez v1, :cond_0

    .line 206
    .line 207
    invoke-virtual/range {p1 .. p1}, LK4/b;->c()V

    .line 208
    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_e
    move-object/from16 v1, p1

    .line 212
    .line 213
    move/from16 v2, p2

    .line 214
    .line 215
    invoke-static {p0, v6, v1, v2}, LH4/e;->z(LH4/e;LF4/Y0;LH4/m;I)V

    .line 216
    .line 217
    .line 218
    goto :goto_5

    .line 219
    :cond_f
    sget-object p0, Lh4/m;->g:Lh4/m$a;

    .line 220
    .line 221
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 222
    .line 223
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    goto :goto_4

    .line 228
    :cond_10
    move-object/from16 v1, p1

    .line 229
    .line 230
    invoke-virtual {v1}, LK4/b;->c()V

    .line 231
    .line 232
    .line 233
    sget-object p0, Lh4/m;->g:Lh4/m$a;

    .line 234
    .line 235
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 236
    .line 237
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 241
    goto :goto_4

    .line 242
    :cond_11
    :goto_5
    invoke-virtual {v6}, LF4/l;->x()Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    if-ne p0, v0, :cond_12

    .line 251
    .line 252
    invoke-static/range {p6 .. p6}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 253
    .line 254
    .line 255
    :cond_12
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    if-ne p0, v0, :cond_13

    .line 260
    .line 261
    return-object p0

    .line 262
    :cond_13
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 263
    .line 264
    return-object p0

    .line 265
    :goto_6
    invoke-virtual {v6}, LF4/l;->L()V

    .line 266
    .line 267
    .line 268
    throw p0
.end method

.method private final T(JLH4/m;)LH4/m;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "LH4/m<",
            "TE;>;)",
            "LH4/m<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, LH4/e;->f0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, LH4/f;->y()LB4/f;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lu4/p;

    .line 10
    .line 11
    :goto_0
    invoke-static {p3, p1, p2, v1}, LK4/a;->c(LK4/A;JLu4/p;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, LK4/B;->c(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-nez v3, :cond_4

    .line 20
    .line 21
    invoke-static {v2}, LK4/B;->b(Ljava/lang/Object;)LK4/A;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    :cond_0
    :goto_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    check-cast v4, LK4/A;

    .line 30
    .line 31
    iget-wide v5, v4, LK4/A;->i:J

    .line 32
    .line 33
    iget-wide v7, v3, LK4/A;->i:J

    .line 34
    .line 35
    cmp-long v5, v5, v7

    .line 36
    .line 37
    if-ltz v5, :cond_1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    invoke-virtual {v3}, LK4/A;->u()Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-nez v5, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-static {v0, p0, v4, v3}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_3

    .line 52
    .line 53
    invoke-virtual {v4}, LK4/A;->p()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    invoke-virtual {v4}, LK4/b;->n()V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_3
    invoke-virtual {v3}, LK4/A;->p()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_0

    .line 68
    .line 69
    invoke-virtual {v3}, LK4/b;->n()V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    :goto_2
    invoke-static {v2}, LK4/B;->c(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    const/4 v1, 0x0

    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    invoke-direct {p0}, LH4/e;->O()V

    .line 81
    .line 82
    .line 83
    iget-wide p1, p3, LK4/A;->i:J

    .line 84
    .line 85
    sget v0, LH4/f;->b:I

    .line 86
    .line 87
    int-to-long v2, v0

    .line 88
    mul-long/2addr p1, v2

    .line 89
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 90
    .line 91
    .line 92
    move-result-wide v2

    .line 93
    cmp-long p0, p1, v2

    .line 94
    .line 95
    if-gez p0, :cond_5

    .line 96
    .line 97
    invoke-virtual {p3}, LK4/b;->c()V

    .line 98
    .line 99
    .line 100
    :cond_5
    return-object v1

    .line 101
    :cond_6
    invoke-static {v2}, LK4/B;->b(Ljava/lang/Object;)LK4/A;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    check-cast p3, LH4/m;

    .line 106
    .line 107
    iget-wide v2, p3, LK4/A;->i:J

    .line 108
    .line 109
    cmp-long p1, v2, p1

    .line 110
    .line 111
    if-lez p1, :cond_8

    .line 112
    .line 113
    sget p1, LH4/f;->b:I

    .line 114
    .line 115
    int-to-long v4, p1

    .line 116
    mul-long/2addr v2, v4

    .line 117
    invoke-direct {p0, v2, v3}, LH4/e;->e1(J)V

    .line 118
    .line 119
    .line 120
    iget-wide v2, p3, LK4/A;->i:J

    .line 121
    .line 122
    int-to-long p1, p1

    .line 123
    mul-long/2addr v2, p1

    .line 124
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 125
    .line 126
    .line 127
    move-result-wide p0

    .line 128
    cmp-long p0, v2, p0

    .line 129
    .line 130
    if-gez p0, :cond_7

    .line 131
    .line 132
    invoke-virtual {p3}, LK4/b;->c()V

    .line 133
    .line 134
    .line 135
    :cond_7
    return-object v1

    .line 136
    :cond_8
    return-object p3
.end method

.method private final T0(J)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, LH4/e;->r0(J)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    const-wide v0, 0xfffffffffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    and-long/2addr p1, v0

    .line 15
    invoke-direct {p0, p1, p2}, LH4/e;->H(J)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    xor-int/lit8 p0, p0, 0x1

    .line 20
    .line 21
    return p0
.end method

.method private static final synthetic U()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private final U0(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "TE;)Z"
        }
    .end annotation

    .line 1
    instance-of v0, p1, LN4/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, LN4/b;

    .line 6
    .line 7
    invoke-interface {p1, p0, p2}, LN4/b;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of v0, p1, LH4/v;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.channels.ReceiveCatching<E of kotlinx.coroutines.channels.BufferedChannel>"

    .line 18
    .line 19
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    check-cast p1, LH4/v;

    .line 23
    .line 24
    iget-object p1, p1, LH4/v;->g:LF4/l;

    .line 25
    .line 26
    sget-object v0, LH4/k;->b:LH4/k$b;

    .line 27
    .line 28
    invoke-virtual {v0, p2}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p2}, LH4/k;->b(Ljava/lang/Object;)LH4/k;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object v0, p0, LH4/e;->h:Lu4/l;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-direct {p0, v0}, LH4/e;->G(Lu4/l;)LB4/f;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :cond_1
    check-cast v1, Lu4/q;

    .line 45
    .line 46
    invoke-static {p1, p2, v1}, LH4/f;->u(LF4/k;Ljava/lang/Object;Lu4/q;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_2
    instance-of v0, p1, LH4/e$a;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    const-string p0, "null cannot be cast to non-null type kotlinx.coroutines.channels.BufferedChannel.BufferedChannelIterator<E of kotlinx.coroutines.channels.BufferedChannel>"

    .line 56
    .line 57
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    check-cast p1, LH4/e$a;

    .line 61
    .line 62
    invoke-virtual {p1, p2}, LH4/e$a;->i(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_3
    instance-of v0, p1, LF4/k;

    .line 68
    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.CancellableContinuation<E of kotlinx.coroutines.channels.BufferedChannel>"

    .line 72
    .line 73
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    check-cast p1, LF4/k;

    .line 77
    .line 78
    iget-object v0, p0, LH4/e;->h:Lu4/l;

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    invoke-direct {p0, v0}, LH4/e;->D(Lu4/l;)LB4/f;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    :cond_4
    check-cast v1, Lu4/q;

    .line 87
    .line 88
    invoke-static {p1, p2, v1}, LH4/f;->u(LF4/k;Ljava/lang/Object;Lu4/q;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0

    .line 93
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 94
    .line 95
    new-instance p2, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string v0, "Unexpected receiver type: "

    .line 101
    .line 102
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw p0
.end method

.method private final V()J
    .locals 2

    .line 1
    invoke-static {}, LH4/e;->U()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method private final V0(Ljava/lang/Object;LH4/m;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "LH4/m<",
            "TE;>;I)Z"
        }
    .end annotation

    .line 1
    instance-of v0, p1, LF4/k;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "null cannot be cast to non-null type kotlinx.coroutines.CancellableContinuation<kotlin.Unit>"

    .line 8
    .line 9
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p1, LF4/k;

    .line 13
    .line 14
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 15
    .line 16
    invoke-static {p1, p0, v2, v1, v2}, LH4/f;->C(LF4/k;Ljava/lang/Object;Lu4/q;ILjava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    instance-of v0, p1, LN4/b;

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.selects.SelectImplementation<*>"

    .line 26
    .line 27
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    check-cast p1, LN4/a;

    .line 31
    .line 32
    sget-object v0, Lh4/t;->a:Lh4/t;

    .line 33
    .line 34
    invoke-virtual {p1, p0, v0}, LN4/a;->f(Ljava/lang/Object;Ljava/lang/Object;)LN4/d;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object p1, LN4/d;->h:LN4/d;

    .line 39
    .line 40
    if-ne p0, p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p2, p3}, LH4/m;->w(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    sget-object p1, LN4/d;->g:LN4/d;

    .line 46
    .line 47
    if-ne p0, p1, :cond_2

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_2
    const/4 p0, 0x0

    .line 52
    return p0

    .line 53
    :cond_3
    instance-of p0, p1, LH4/e$b;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    check-cast p1, LH4/e$b;

    .line 58
    .line 59
    invoke-virtual {p1}, LH4/e$b;->a()LF4/k;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-static {p0, p1, v2, v1, v2}, LH4/f;->C(LF4/k;Ljava/lang/Object;Lu4/q;ILjava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 71
    .line 72
    new-instance p2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string p3, "Unexpected waiter: "

    .line 78
    .line 79
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw p0
.end method

.method private static final synthetic W()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->p:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private final X0(LH4/m;IJ)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;IJ)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, LH4/m;->B(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, LF4/Y0;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    cmp-long v1, p3, v1

    .line 18
    .line 19
    if-ltz v1, :cond_1

    .line 20
    .line 21
    invoke-static {}, LH4/f;->p()LK4/D;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-direct {p0, v0, p1, p2}, LH4/e;->V0(Ljava/lang/Object;LH4/m;I)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    sget-object p0, LH4/f;->d:LK4/D;

    .line 38
    .line 39
    invoke-virtual {p1, p2, p0}, LH4/m;->F(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_0
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p2, p0}, LH4/m;->F(ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    invoke-virtual {p1, p2, p0}, LH4/m;->C(IZ)V

    .line 53
    .line 54
    .line 55
    return p0

    .line 56
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, LH4/e;->Y0(LH4/m;IJ)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method

.method private static final synthetic Y()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->r:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private final Y0(LH4/m;IJ)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;IJ)Z"
        }
    .end annotation

    .line 1
    :cond_0
    :goto_0
    invoke-virtual {p1, p2}, LH4/m;->B(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, LF4/Y0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v4

    .line 19
    cmp-long v1, p3, v4

    .line 20
    .line 21
    if-gez v1, :cond_1

    .line 22
    .line 23
    new-instance v1, LH4/y;

    .line 24
    .line 25
    move-object v2, v0

    .line 26
    check-cast v2, LF4/Y0;

    .line 27
    .line 28
    invoke-direct {v1, v2}, LH4/y;-><init>(LF4/Y0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    return v3

    .line 38
    :cond_1
    invoke-static {}, LH4/f;->p()LK4/D;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    invoke-direct {p0, v0, p1, p2}, LH4/e;->V0(Ljava/lang/Object;LH4/m;I)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    sget-object p0, LH4/f;->d:LK4/D;

    .line 55
    .line 56
    invoke-virtual {p1, p2, p0}, LH4/m;->F(ILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return v3

    .line 60
    :cond_2
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p2, p0}, LH4/m;->F(ILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, p2, v2}, LH4/m;->C(IZ)V

    .line 68
    .line 69
    .line 70
    return v2

    .line 71
    :cond_3
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    if-ne v0, v1, :cond_4

    .line 76
    .line 77
    return v2

    .line 78
    :cond_4
    if-nez v0, :cond_5

    .line 79
    .line 80
    invoke-static {}, LH4/f;->k()LK4/D;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_0

    .line 89
    .line 90
    return v3

    .line 91
    :cond_5
    sget-object v1, LH4/f;->d:LK4/D;

    .line 92
    .line 93
    if-ne v0, v1, :cond_6

    .line 94
    .line 95
    return v3

    .line 96
    :cond_6
    invoke-static {}, LH4/f;->o()LK4/D;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    if-eq v0, v1, :cond_a

    .line 101
    .line 102
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    if-eq v0, v1, :cond_a

    .line 107
    .line 108
    invoke-static {}, LH4/f;->i()LK4/D;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    if-ne v0, v1, :cond_7

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_7
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    if-ne v0, v1, :cond_8

    .line 120
    .line 121
    return v3

    .line 122
    :cond_8
    invoke-static {}, LH4/f;->q()LK4/D;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    if-ne v0, v1, :cond_9

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_9
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 130
    .line 131
    new-instance p1, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string p2, "Unexpected cell state: "

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    throw p0

    .line 156
    :cond_a
    :goto_1
    return v3
.end method

.method private static final synthetic Z()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->m:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private final Z0(LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;IJ",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, LH4/m;->B(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    const-wide v3, 0xfffffffffffffffL

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    and-long/2addr v1, v3

    .line 21
    cmp-long v1, p3, v1

    .line 22
    .line 23
    if-ltz v1, :cond_1

    .line 24
    .line 25
    if-nez p5, :cond_0

    .line 26
    .line 27
    invoke-static {}, LH4/f;->s()LK4/D;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-virtual {p1, p2, v0, p5}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-direct {p0}, LH4/e;->Q()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    move-object v0, p0

    .line 47
    move-object v1, p1

    .line 48
    move v2, p2

    .line 49
    move-wide v3, p3

    .line 50
    move-object v5, p5

    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object v1, LH4/f;->d:LK4/D;

    .line 53
    .line 54
    if-ne v0, v1, :cond_1

    .line 55
    .line 56
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-direct {p0}, LH4/e;->Q()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p2}, LH4/m;->D(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :goto_0
    invoke-direct/range {v0 .. v5}, LH4/e;->a1(LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method private final a0()Ljava/lang/Throwable;
    .locals 1

    .line 1
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, LH4/p;

    .line 8
    .line 9
    const-string v0, "Channel was closed"

    .line 10
    .line 11
    invoke-direct {p0, v0}, LH4/p;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method private final a1(LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;IJ",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    :cond_0
    invoke-virtual {p1, p2}, LH4/m;->B(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_9

    .line 6
    .line 7
    invoke-static {}, LH4/f;->k()LK4/D;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_1
    sget-object v1, LH4/f;->d:LK4/D;

    .line 16
    .line 17
    if-ne v0, v1, :cond_2

    .line 18
    .line 19
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-direct {p0}, LH4/e;->Q()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, LH4/m;->D(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-ne v0, v1, :cond_3

    .line 42
    .line 43
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_3
    invoke-static {}, LH4/f;->o()LK4/D;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    if-ne v0, v1, :cond_4

    .line 53
    .line 54
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_4
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-ne v0, v1, :cond_5

    .line 64
    .line 65
    invoke-direct {p0}, LH4/e;->Q()V

    .line 66
    .line 67
    .line 68
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_5
    invoke-static {}, LH4/f;->p()LK4/D;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    if-eq v0, v1, :cond_0

    .line 78
    .line 79
    invoke-static {}, LH4/f;->q()LK4/D;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_0

    .line 88
    .line 89
    instance-of p3, v0, LH4/y;

    .line 90
    .line 91
    if-eqz p3, :cond_6

    .line 92
    .line 93
    check-cast v0, LH4/y;

    .line 94
    .line 95
    iget-object v0, v0, LH4/y;->a:LF4/Y0;

    .line 96
    .line 97
    :cond_6
    invoke-direct {p0, v0, p1, p2}, LH4/e;->V0(Ljava/lang/Object;LH4/m;I)Z

    .line 98
    .line 99
    .line 100
    move-result p4

    .line 101
    if-eqz p4, :cond_7

    .line 102
    .line 103
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-virtual {p1, p2, p3}, LH4/m;->F(ILjava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    invoke-direct {p0}, LH4/e;->Q()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, p2}, LH4/m;->D(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0

    .line 118
    :cond_7
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 119
    .line 120
    .line 121
    move-result-object p4

    .line 122
    invoke-virtual {p1, p2, p4}, LH4/m;->F(ILjava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    const/4 p4, 0x0

    .line 126
    invoke-virtual {p1, p2, p4}, LH4/m;->C(IZ)V

    .line 127
    .line 128
    .line 129
    if-eqz p3, :cond_8

    .line 130
    .line 131
    invoke-direct {p0}, LH4/e;->Q()V

    .line 132
    .line 133
    .line 134
    :cond_8
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0

    .line 139
    :cond_9
    :goto_0
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 144
    .line 145
    .line 146
    move-result-wide v1

    .line 147
    const-wide v3, 0xfffffffffffffffL

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    and-long/2addr v1, v3

    .line 153
    cmp-long v1, p3, v1

    .line 154
    .line 155
    if-gez v1, :cond_a

    .line 156
    .line 157
    invoke-static {}, LH4/f;->o()LK4/D;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-eqz v0, :cond_0

    .line 166
    .line 167
    invoke-direct {p0}, LH4/e;->Q()V

    .line 168
    .line 169
    .line 170
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0

    .line 175
    :cond_a
    if-nez p5, :cond_b

    .line 176
    .line 177
    invoke-static {}, LH4/f;->s()LK4/D;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    return-object p0

    .line 182
    :cond_b
    invoke-virtual {p1, p2, v0, p5}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_0

    .line 187
    .line 188
    invoke-direct {p0}, LH4/e;->Q()V

    .line 189
    .line 190
    .line 191
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Object;LH4/e;LN4/b;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)Lh4/t;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, LH4/e;->I0(Ljava/lang/Object;LH4/e;LN4/b;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final synthetic b0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->o:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private final b1(LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;ITE;J",
            "Ljava/lang/Object;",
            "Z)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2, p3}, LH4/m;->G(ILjava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    if-eqz p7, :cond_0

    .line 5
    .line 6
    invoke-direct/range {p0 .. p7}, LH4/e;->c1(LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p1, p2}, LH4/m;->B(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-nez v0, :cond_3

    .line 17
    .line 18
    invoke-direct {p0, p4, p5}, LH4/e;->H(J)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    sget-object v0, LH4/f;->d:LK4/D;

    .line 26
    .line 27
    invoke-virtual {p1, p2, v2, v0}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_6

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    if-nez p6, :cond_2

    .line 35
    .line 36
    const/4 p0, 0x3

    .line 37
    return p0

    .line 38
    :cond_2
    invoke-virtual {p1, p2, v2, p6}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_6

    .line 43
    .line 44
    const/4 p0, 0x2

    .line 45
    return p0

    .line 46
    :cond_3
    instance-of v2, v0, LF4/Y0;

    .line 47
    .line 48
    if-eqz v2, :cond_6

    .line 49
    .line 50
    invoke-virtual {p1, p2}, LH4/m;->w(I)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, v0, p3}, LH4/e;->U0(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    if-eqz p3, :cond_4

    .line 58
    .line 59
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p1, p2, p3}, LH4/m;->F(ILjava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, LH4/e;->F0()V

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x0

    .line 70
    return p0

    .line 71
    :cond_4
    invoke-static {}, LH4/f;->i()LK4/D;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p2, p0}, LH4/m;->x(ILjava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {}, LH4/f;->i()LK4/D;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    if-eq p0, p3, :cond_5

    .line 84
    .line 85
    invoke-virtual {p1, p2, v1}, LH4/m;->C(IZ)V

    .line 86
    .line 87
    .line 88
    :cond_5
    const/4 p0, 0x5

    .line 89
    return p0

    .line 90
    :cond_6
    invoke-direct/range {p0 .. p7}, LH4/e;->c1(LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    return p0
.end method

.method private static final synthetic c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->k:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private final c1(LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;ITE;J",
            "Ljava/lang/Object;",
            "Z)I"
        }
    .end annotation

    .line 1
    :cond_0
    invoke-virtual {p1, p2}, LH4/m;->B(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x4

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    invoke-direct {p0, p4, p5}, LH4/e;->H(J)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v4, 0x0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    if-nez p7, :cond_1

    .line 18
    .line 19
    sget-object v0, LH4/f;->d:LK4/D;

    .line 20
    .line 21
    invoke-virtual {p1, p2, v4, v0}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    return v3

    .line 28
    :cond_1
    if-eqz p7, :cond_2

    .line 29
    .line 30
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, p2, v4, v0}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p1, p2, v2}, LH4/m;->C(IZ)V

    .line 41
    .line 42
    .line 43
    return v1

    .line 44
    :cond_2
    if-nez p6, :cond_3

    .line 45
    .line 46
    const/4 p0, 0x3

    .line 47
    return p0

    .line 48
    :cond_3
    invoke-virtual {p1, p2, v4, p6}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    const/4 p0, 0x2

    .line 55
    return p0

    .line 56
    :cond_4
    invoke-static {}, LH4/f;->k()LK4/D;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    if-ne v0, v4, :cond_5

    .line 61
    .line 62
    sget-object v1, LH4/f;->d:LK4/D;

    .line 63
    .line 64
    invoke-virtual {p1, p2, v0, v1}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    return v3

    .line 71
    :cond_5
    invoke-static {}, LH4/f;->i()LK4/D;

    .line 72
    .line 73
    .line 74
    move-result-object p4

    .line 75
    const/4 p5, 0x5

    .line 76
    if-ne v0, p4, :cond_6

    .line 77
    .line 78
    invoke-virtual {p1, p2}, LH4/m;->w(I)V

    .line 79
    .line 80
    .line 81
    return p5

    .line 82
    :cond_6
    invoke-static {}, LH4/f;->o()LK4/D;

    .line 83
    .line 84
    .line 85
    move-result-object p4

    .line 86
    if-ne v0, p4, :cond_7

    .line 87
    .line 88
    invoke-virtual {p1, p2}, LH4/m;->w(I)V

    .line 89
    .line 90
    .line 91
    return p5

    .line 92
    :cond_7
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 93
    .line 94
    .line 95
    move-result-object p4

    .line 96
    if-ne v0, p4, :cond_8

    .line 97
    .line 98
    invoke-virtual {p1, p2}, LH4/m;->w(I)V

    .line 99
    .line 100
    .line 101
    invoke-direct {p0}, LH4/e;->O()V

    .line 102
    .line 103
    .line 104
    return v1

    .line 105
    :cond_8
    invoke-virtual {p1, p2}, LH4/m;->w(I)V

    .line 106
    .line 107
    .line 108
    instance-of p4, v0, LH4/y;

    .line 109
    .line 110
    if-eqz p4, :cond_9

    .line 111
    .line 112
    check-cast v0, LH4/y;

    .line 113
    .line 114
    iget-object v0, v0, LH4/y;->a:LF4/Y0;

    .line 115
    .line 116
    :cond_9
    invoke-direct {p0, v0, p3}, LH4/e;->U0(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p3

    .line 120
    if-eqz p3, :cond_a

    .line 121
    .line 122
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    invoke-virtual {p1, p2, p3}, LH4/m;->F(ILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, LH4/e;->F0()V

    .line 130
    .line 131
    .line 132
    return v2

    .line 133
    :cond_a
    invoke-static {}, LH4/f;->i()LK4/D;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p1, p2, p0}, LH4/m;->x(ILjava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {}, LH4/f;->i()LK4/D;

    .line 142
    .line 143
    .line 144
    move-result-object p3

    .line 145
    if-eq p0, p3, :cond_b

    .line 146
    .line 147
    invoke-virtual {p1, p2, v3}, LH4/m;->C(IZ)V

    .line 148
    .line 149
    .line 150
    :cond_b
    return p5
.end method

.method public static synthetic d(LH4/e;LN4/b;Ljava/lang/Object;Ljava/lang/Object;)Lu4/q;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, LH4/e;->H0(LH4/e;LN4/b;Ljava/lang/Object;Ljava/lang/Object;)Lu4/q;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final d1(J)V
    .locals 7

    .line 1
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    cmp-long v1, v3, p1

    .line 10
    .line 11
    if-ltz v1, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    move-object v2, p0

    .line 19
    move-wide v5, p1

    .line 20
    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    :goto_1
    return-void

    .line 27
    :cond_1
    move-object p0, v2

    .line 28
    move-wide p1, v5

    .line 29
    goto :goto_0
.end method

.method public static synthetic e(Lu4/l;Ljava/lang/Object;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, LH4/e;->F(Lu4/l;Ljava/lang/Object;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final e1(J)V
    .locals 7

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    const-wide v1, 0xfffffffffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    and-long/2addr v1, v3

    .line 15
    cmp-long v5, v1, p1

    .line 16
    .line 17
    if-ltz v5, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/16 v5, 0x3c

    .line 21
    .line 22
    shr-long v5, v3, v5

    .line 23
    .line 24
    long-to-int v5, v5

    .line 25
    invoke-static {v1, v2, v5}, LH4/f;->b(JI)J

    .line 26
    .line 27
    .line 28
    move-result-wide v5

    .line 29
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    move-object v2, p0

    .line 34
    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    :goto_1
    return-void

    .line 41
    :cond_1
    move-object p0, v2

    .line 42
    goto :goto_0
.end method

.method public static final synthetic f(LH4/e;Lu4/l;Ljava/lang/Object;)Lu4/q;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LH4/e;->E(Lu4/l;Ljava/lang/Object;)Lu4/q;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final synthetic f0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->n:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic g(LH4/e;Lu4/l;)LB4/f;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LH4/e;->G(Lu4/l;)LB4/f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final synthetic g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->j:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic h(LH4/e;JLH4/m;)LH4/m;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LH4/e;->S(JLH4/m;)LH4/m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic i(LH4/e;JLH4/m;)LH4/m;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LH4/e;->T(JLH4/m;)LH4/m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final synthetic i0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LH4/e;->q:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic j(LH4/e;)Ljava/lang/Throwable;
    .locals 0

    .line 1
    invoke-direct {p0}, LH4/e;->a0()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final k0(J)V
    .locals 4

    .line 1
    invoke-static {}, LH4/e;->Z()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 10
    .line 11
    and-long/2addr p1, v0

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long p1, p1, v2

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    :goto_0
    invoke-static {}, LH4/e;->Z()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 23
    .line 24
    .line 25
    move-result-wide p1

    .line 26
    and-long/2addr p1, v0

    .line 27
    cmp-long p1, p1, v2

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method static synthetic l0(LH4/e;JILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    and-int/lit8 p3, p3, 0x1

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const-wide/16 p1, 0x1

    .line 8
    .line 9
    :cond_0
    invoke-direct {p0, p1, p2}, LH4/e;->k0(J)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 14
    .line 15
    const-string p1, "Super calls with default arguments not supported in this target, function: incCompletedExpandBufferAttempts"

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p0
.end method

.method private final m0()V
    .locals 3

    .line 1
    invoke-static {}, LH4/e;->Y()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :cond_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-static {}, LH4/f;->d()LK4/D;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    invoke-static {}, LH4/f;->e()LK4/D;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    :goto_0
    invoke-static {v0, p0, v1, v2}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    const/4 v0, 0x1

    .line 30
    invoke-static {v1, v0}, Lkotlin/jvm/internal/H;->d(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lu4/l;

    .line 35
    .line 36
    check-cast v1, Lu4/l;

    .line 37
    .line 38
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {v1, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static final synthetic n()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    invoke-static {}, LH4/e;->b0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private final n0(LH4/m;IJ)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;IJ)Z"
        }
    .end annotation

    .line 1
    :cond_0
    invoke-virtual {p1, p2}, LH4/m;->B(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_a

    .line 7
    .line 8
    invoke-static {}, LH4/f;->k()LK4/D;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-ne v0, v2, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    sget-object p1, LH4/f;->d:LK4/D;

    .line 16
    .line 17
    const/4 p2, 0x1

    .line 18
    if-ne v0, p1, :cond_2

    .line 19
    .line 20
    return p2

    .line 21
    :cond_2
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-ne v0, p1, :cond_3

    .line 26
    .line 27
    return v1

    .line 28
    :cond_3
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-ne v0, p1, :cond_4

    .line 33
    .line 34
    return v1

    .line 35
    :cond_4
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-ne v0, p1, :cond_5

    .line 40
    .line 41
    return v1

    .line 42
    :cond_5
    invoke-static {}, LH4/f;->o()LK4/D;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    if-ne v0, p1, :cond_6

    .line 47
    .line 48
    return v1

    .line 49
    :cond_6
    invoke-static {}, LH4/f;->p()LK4/D;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    if-ne v0, p1, :cond_7

    .line 54
    .line 55
    return p2

    .line 56
    :cond_7
    invoke-static {}, LH4/f;->q()LK4/D;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    if-ne v0, p1, :cond_8

    .line 61
    .line 62
    return v1

    .line 63
    :cond_8
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 64
    .line 65
    .line 66
    move-result-wide p0

    .line 67
    cmp-long p0, p3, p0

    .line 68
    .line 69
    if-nez p0, :cond_9

    .line 70
    .line 71
    return p2

    .line 72
    :cond_9
    return v1

    .line 73
    :cond_a
    :goto_0
    invoke-static {}, LH4/f;->o()LK4/D;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {p1, p2, v0, v2}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    invoke-direct {p0}, LH4/e;->Q()V

    .line 84
    .line 85
    .line 86
    return v1
.end method

.method public static final synthetic o()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .locals 1

    .line 1
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private final o0(JZ)Z
    .locals 6

    .line 1
    const/16 v0, 0x3c

    .line 2
    .line 3
    shr-long v0, p1, v0

    .line 4
    .line 5
    long-to-int v0, v0

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v0, v2, :cond_4

    .line 11
    .line 12
    const/4 v3, 0x2

    .line 13
    const-wide v4, 0xfffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    if-eq v0, v3, :cond_1

    .line 19
    .line 20
    const/4 p3, 0x3

    .line 21
    if-ne v0, p3, :cond_0

    .line 22
    .line 23
    and-long/2addr p1, v4

    .line 24
    invoke-direct {p0, p1, p2}, LH4/e;->M(J)V

    .line 25
    .line 26
    .line 27
    return v2

    .line 28
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string p1, "unexpected close status: "

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_1
    and-long/2addr p1, v4

    .line 56
    invoke-direct {p0, p1, p2}, LH4/e;->N(J)LH4/m;

    .line 57
    .line 58
    .line 59
    if-eqz p3, :cond_3

    .line 60
    .line 61
    invoke-virtual {p0}, LH4/e;->j0()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_2

    .line 66
    .line 67
    return v2

    .line 68
    :cond_2
    return v1

    .line 69
    :cond_3
    return v2

    .line 70
    :cond_4
    return v1
.end method

.method private final q0(J)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, LH4/e;->o0(JZ)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static final synthetic r()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    invoke-static {}, LH4/e;->f0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private final r0(J)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, LH4/e;->o0(JZ)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static final synthetic s()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .locals 1

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static final synthetic t(LH4/e;J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LH4/e;->r0(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final t0()Z
    .locals 4

    .line 1
    invoke-direct {p0}, LH4/e;->V()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    const-wide v2, 0x7fffffffffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmp-long p0, v0, v2

    .line 17
    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public static final synthetic u(LH4/e;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LH4/e;->z0(Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final u0(LH4/m;)J
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;)J"
        }
    .end annotation

    .line 1
    :cond_0
    sget v0, LH4/f;->b:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    :goto_0
    const-wide/16 v1, -0x1

    .line 6
    .line 7
    const/4 v3, -0x1

    .line 8
    if-ge v3, v0, :cond_5

    .line 9
    .line 10
    iget-wide v3, p1, LK4/A;->i:J

    .line 11
    .line 12
    sget v5, LH4/f;->b:I

    .line 13
    .line 14
    int-to-long v5, v5

    .line 15
    mul-long/2addr v3, v5

    .line 16
    int-to-long v5, v0

    .line 17
    add-long/2addr v3, v5

    .line 18
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 19
    .line 20
    .line 21
    move-result-wide v5

    .line 22
    cmp-long v5, v3, v5

    .line 23
    .line 24
    if-gez v5, :cond_1

    .line 25
    .line 26
    return-wide v1

    .line 27
    :cond_1
    invoke-virtual {p1, v0}, LH4/m;->B(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    invoke-static {}, LH4/f;->k()LK4/D;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-ne v1, v2, :cond_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    sget-object v2, LH4/f;->d:LK4/D;

    .line 41
    .line 42
    if-ne v1, v2, :cond_4

    .line 43
    .line 44
    return-wide v3

    .line 45
    :cond_3
    :goto_1
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {p1, v0, v1, v2}, LH4/m;->v(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p1}, LK4/A;->t()V

    .line 56
    .line 57
    .line 58
    :cond_4
    add-int/lit8 v0, v0, -0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_5
    invoke-virtual {p1}, LK4/b;->h()LK4/b;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, LH4/m;

    .line 66
    .line 67
    if-nez p1, :cond_0

    .line 68
    .line 69
    return-wide v1
.end method

.method public static final synthetic v(LH4/e;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LH4/e;->A0(Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final v0()V
    .locals 6

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const/16 v1, 0x3c

    .line 10
    .line 11
    shr-long v4, v2, v1

    .line 12
    .line 13
    long-to-int v1, v4

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    const-wide v4, 0xfffffffffffffffL

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    and-long/2addr v4, v2

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v4, v5, v1}, LH4/f;->b(JI)J

    .line 24
    .line 25
    .line 26
    move-result-wide v4

    .line 27
    move-object v1, p0

    .line 28
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    move-object p0, v1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    :goto_1
    return-void
.end method

.method public static final synthetic w(LH4/e;LF4/k;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LH4/e;->C0(LF4/k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final w0()V
    .locals 6

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide v4, 0xfffffffffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    and-long/2addr v4, v2

    .line 15
    const/4 v1, 0x3

    .line 16
    invoke-static {v4, v5, v1}, LH4/f;->b(JI)J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    move-object v1, p0

    .line 21
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    move-object p0, v1

    .line 29
    goto :goto_0
.end method

.method public static final synthetic x(LH4/e;Ljava/lang/Object;LF4/k;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LH4/e;->E0(Ljava/lang/Object;LF4/k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final x0()V
    .locals 7

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const/16 v1, 0x3c

    .line 10
    .line 11
    shr-long v4, v2, v1

    .line 12
    .line 13
    long-to-int v1, v4

    .line 14
    const-wide v4, 0xfffffffffffffffL

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    const/4 v6, 0x1

    .line 22
    if-eq v1, v6, :cond_0

    .line 23
    .line 24
    goto :goto_3

    .line 25
    :cond_0
    and-long/2addr v4, v2

    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v4, v5, v1}, LH4/f;->b(JI)J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    :goto_1
    move-object v1, p0

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    and-long/2addr v4, v2

    .line 34
    const/4 v1, 0x2

    .line 35
    invoke-static {v4, v5, v1}, LH4/f;->b(JI)J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    goto :goto_1

    .line 40
    :goto_2
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    :goto_3
    return-void

    .line 47
    :cond_2
    move-object p0, v1

    .line 48
    goto :goto_0
.end method

.method public static final synthetic y(LH4/e;LF4/Y0;LH4/m;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LH4/e;->J0(LF4/Y0;LH4/m;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final y0(JLH4/m;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "LH4/m<",
            "TE;>;)V"
        }
    .end annotation

    .line 1
    :goto_0
    iget-wide v0, p3, LK4/A;->i:J

    .line 2
    .line 3
    cmp-long v0, v0, p1

    .line 4
    .line 5
    if-gez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p3}, LK4/b;->f()LK4/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, LH4/m;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    move-object p3, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    :goto_1
    invoke-virtual {p3}, LK4/A;->k()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p3}, LK4/b;->f()LK4/b;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, LH4/m;

    .line 29
    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_2
    move-object p3, p1

    .line 34
    goto :goto_1

    .line 35
    :cond_3
    :goto_2
    invoke-static {}, LH4/e;->W()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :cond_4
    :goto_3
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, LK4/A;

    .line 44
    .line 45
    iget-wide v0, p2, LK4/A;->i:J

    .line 46
    .line 47
    iget-wide v2, p3, LK4/A;->i:J

    .line 48
    .line 49
    cmp-long v0, v0, v2

    .line 50
    .line 51
    if-ltz v0, :cond_5

    .line 52
    .line 53
    return-void

    .line 54
    :cond_5
    invoke-virtual {p3}, LK4/A;->u()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_6
    invoke-static {p1, p0, p2, p3}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_8

    .line 66
    .line 67
    invoke-virtual {p2}, LK4/A;->p()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_7

    .line 72
    .line 73
    invoke-virtual {p2}, LK4/b;->n()V

    .line 74
    .line 75
    .line 76
    :cond_7
    return-void

    .line 77
    :cond_8
    invoke-virtual {p3}, LK4/A;->p()Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-eqz p2, :cond_4

    .line 82
    .line 83
    invoke-virtual {p3}, LK4/b;->n()V

    .line 84
    .line 85
    .line 86
    goto :goto_3
.end method

.method public static final synthetic z(LH4/e;LF4/Y0;LH4/m;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LH4/e;->K0(LF4/Y0;LH4/m;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final z0(Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V
    .locals 0

    .line 1
    iget-object p0, p0, LH4/e;->h:Lu4/l;

    .line 2
    .line 3
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, LH4/k;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, p1, p3}, LK4/w;->a(Lu4/l;Ljava/lang/Object;Ll4/g;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method protected B0()V
    .locals 0

    .line 1
    return-void
.end method

.method protected F0()V
    .locals 0

    .line 1
    return-void
.end method

.method protected G0()V
    .locals 0

    .line 1
    return-void
.end method

.method public I(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ljava/util/concurrent/CancellationException;

    .line 4
    .line 5
    const-string v0, "Channel was cancelled"

    .line 6
    .line 7
    invoke-direct {p1, v0}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, p1, v0}, LH4/e;->L(Ljava/lang/Throwable;Z)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method protected L(Ljava/lang/Throwable;Z)Z
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, LH4/e;->v0()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-static {}, LH4/e;->i0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, LH4/f;->l()LK4/D;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v0, p0, v1, p1}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, LH4/e;->w0()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-direct {p0}, LH4/e;->x0()V

    .line 25
    .line 26
    .line 27
    :goto_0
    invoke-direct {p0}, LH4/e;->O()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, LH4/e;->B0()V

    .line 31
    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-direct {p0}, LH4/e;->m0()V

    .line 36
    .line 37
    .line 38
    :cond_2
    return p1
.end method

.method protected final P(J)V
    .locals 10

    .line 1
    invoke-static {}, LH4/e;->b0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, LH4/m;

    .line 10
    .line 11
    :goto_0
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v4

    .line 19
    iget v1, p0, LH4/e;->g:I

    .line 20
    .line 21
    int-to-long v1, v1

    .line 22
    add-long/2addr v1, v4

    .line 23
    invoke-direct {p0}, LH4/e;->V()J

    .line 24
    .line 25
    .line 26
    move-result-wide v6

    .line 27
    invoke-static {v1, v2, v6, v7}, Ljava/lang/Math;->max(JJ)J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    cmp-long v1, p1, v1

    .line 32
    .line 33
    if-gez v1, :cond_0

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-wide/16 v6, 0x1

    .line 41
    .line 42
    add-long/2addr v6, v4

    .line 43
    move-object v3, p0

    .line 44
    invoke-virtual/range {v2 .. v7}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    move-object v2, v3

    .line 49
    if-eqz p0, :cond_6

    .line 50
    .line 51
    sget p0, LH4/f;->b:I

    .line 52
    .line 53
    int-to-long v6, p0

    .line 54
    div-long v6, v4, v6

    .line 55
    .line 56
    int-to-long v8, p0

    .line 57
    rem-long v8, v4, v8

    .line 58
    .line 59
    long-to-int p0, v8

    .line 60
    iget-wide v8, v0, LK4/A;->i:J

    .line 61
    .line 62
    cmp-long v1, v8, v6

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-direct {v2, v6, v7, v0}, LH4/e;->S(JLH4/m;)LH4/m;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    if-nez v1, :cond_1

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_1
    move-object v3, v1

    .line 74
    goto :goto_1

    .line 75
    :cond_2
    move-object v3, v0

    .line 76
    :goto_1
    const/4 v7, 0x0

    .line 77
    move-wide v5, v4

    .line 78
    move v4, p0

    .line 79
    invoke-direct/range {v2 .. v7}, LH4/e;->Z0(LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    move-wide v4, v5

    .line 84
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-ne p0, v0, :cond_3

    .line 89
    .line 90
    invoke-virtual {v2}, LH4/e;->h0()J

    .line 91
    .line 92
    .line 93
    move-result-wide v0

    .line 94
    cmp-long p0, v4, v0

    .line 95
    .line 96
    if-gez p0, :cond_5

    .line 97
    .line 98
    invoke-virtual {v3}, LK4/b;->c()V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    invoke-virtual {v3}, LK4/b;->c()V

    .line 103
    .line 104
    .line 105
    iget-object v0, v2, LH4/e;->h:Lu4/l;

    .line 106
    .line 107
    if-eqz v0, :cond_5

    .line 108
    .line 109
    const/4 v1, 0x2

    .line 110
    const/4 v4, 0x0

    .line 111
    invoke-static {v0, p0, v4, v1, v4}, LK4/w;->c(Lu4/l;Ljava/lang/Object;LK4/P;ILjava/lang/Object;)LK4/P;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    if-nez p0, :cond_4

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_4
    throw p0

    .line 119
    :cond_5
    :goto_2
    move-object p0, v2

    .line 120
    move-object v0, v3

    .line 121
    goto :goto_0

    .line 122
    :cond_6
    :goto_3
    move-object p0, v2

    .line 123
    goto :goto_0
.end method

.method protected final W0(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    sget-object v6, LH4/f;->d:LK4/D;

    .line 2
    .line 3
    invoke-static {}, LH4/e;->r()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, LH4/m;

    .line 12
    .line 13
    :cond_0
    :goto_0
    invoke-static {}, LH4/e;->s()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    const-wide v3, 0xfffffffffffffffL

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    and-long v4, v1, v3

    .line 27
    .line 28
    invoke-static {p0, v1, v2}, LH4/e;->t(LH4/e;J)Z

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    sget v8, LH4/f;->b:I

    .line 33
    .line 34
    int-to-long v1, v8

    .line 35
    div-long v1, v4, v1

    .line 36
    .line 37
    int-to-long v9, v8

    .line 38
    rem-long v9, v4, v9

    .line 39
    .line 40
    long-to-int v3, v9

    .line 41
    iget-wide v9, v0, LK4/A;->i:J

    .line 42
    .line 43
    cmp-long v9, v9, v1

    .line 44
    .line 45
    if-eqz v9, :cond_2

    .line 46
    .line 47
    invoke-static {p0, v1, v2, v0}, LH4/e;->i(LH4/e;JLH4/m;)LH4/m;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    if-nez v1, :cond_1

    .line 52
    .line 53
    if-eqz v7, :cond_0

    .line 54
    .line 55
    sget-object p1, LH4/k;->b:LH4/k$b;

    .line 56
    .line 57
    invoke-virtual {p0}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    move-object v0, p0

    .line 67
    move v2, v3

    .line 68
    :goto_1
    move-object v3, p1

    .line 69
    goto :goto_2

    .line 70
    :cond_2
    move-object v1, v0

    .line 71
    move v2, v3

    .line 72
    move-object v0, p0

    .line 73
    goto :goto_1

    .line 74
    :goto_2
    invoke-static/range {v0 .. v7}, LH4/e;->C(LH4/e;LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    move-object p1, v0

    .line 79
    move-object v0, v1

    .line 80
    if-eqz p0, :cond_c

    .line 81
    .line 82
    const/4 v1, 0x1

    .line 83
    if-eq p0, v1, :cond_b

    .line 84
    .line 85
    const/4 v1, 0x2

    .line 86
    if-eq p0, v1, :cond_7

    .line 87
    .line 88
    const/4 v1, 0x3

    .line 89
    if-eq p0, v1, :cond_6

    .line 90
    .line 91
    const/4 v1, 0x4

    .line 92
    if-eq p0, v1, :cond_4

    .line 93
    .line 94
    const/4 v1, 0x5

    .line 95
    if-eq p0, v1, :cond_3

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_3
    invoke-virtual {v0}, LK4/b;->c()V

    .line 99
    .line 100
    .line 101
    :goto_3
    move-object p0, p1

    .line 102
    move-object p1, v3

    .line 103
    goto :goto_0

    .line 104
    :cond_4
    invoke-virtual {p1}, LH4/e;->d0()J

    .line 105
    .line 106
    .line 107
    move-result-wide v1

    .line 108
    cmp-long p0, v4, v1

    .line 109
    .line 110
    if-gez p0, :cond_5

    .line 111
    .line 112
    invoke-virtual {v0}, LK4/b;->c()V

    .line 113
    .line 114
    .line 115
    :cond_5
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 116
    .line 117
    invoke-virtual {p1}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p0, p1}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0

    .line 126
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 127
    .line 128
    const-string p1, "unexpected"

    .line 129
    .line 130
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw p0

    .line 134
    :cond_7
    if-eqz v7, :cond_8

    .line 135
    .line 136
    invoke-virtual {v0}, LK4/A;->t()V

    .line 137
    .line 138
    .line 139
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 140
    .line 141
    invoke-virtual {p1}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0

    .line 150
    :cond_8
    instance-of p0, v6, LF4/Y0;

    .line 151
    .line 152
    if-eqz p0, :cond_9

    .line 153
    .line 154
    check-cast v6, LF4/Y0;

    .line 155
    .line 156
    goto :goto_4

    .line 157
    :cond_9
    const/4 v6, 0x0

    .line 158
    :goto_4
    if-eqz v6, :cond_a

    .line 159
    .line 160
    invoke-static {p1, v6, v0, v2}, LH4/e;->z(LH4/e;LF4/Y0;LH4/m;I)V

    .line 161
    .line 162
    .line 163
    :cond_a
    iget-wide v0, v0, LK4/A;->i:J

    .line 164
    .line 165
    int-to-long v3, v8

    .line 166
    mul-long/2addr v0, v3

    .line 167
    int-to-long v2, v2

    .line 168
    add-long/2addr v0, v2

    .line 169
    invoke-virtual {p1, v0, v1}, LH4/e;->P(J)V

    .line 170
    .line 171
    .line 172
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 173
    .line 174
    sget-object p1, Lh4/t;->a:Lh4/t;

    .line 175
    .line 176
    invoke-virtual {p0, p1}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    return-object p0

    .line 181
    :cond_b
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 182
    .line 183
    sget-object p1, Lh4/t;->a:Lh4/t;

    .line 184
    .line 185
    invoke-virtual {p0, p1}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    return-object p0

    .line 190
    :cond_c
    invoke-virtual {v0}, LK4/b;->c()V

    .line 191
    .line 192
    .line 193
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 194
    .line 195
    sget-object p1, Lh4/t;->a:Lh4/t;

    .line 196
    .line 197
    invoke-virtual {p0, p1}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    return-object p0
.end method

.method protected final X()Ljava/lang/Throwable;
    .locals 1

    .line 1
    invoke-static {}, LH4/e;->i0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Throwable;

    .line 10
    .line 11
    return-object p0
.end method

.method public a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-direct {p0, v0, v1}, LH4/e;->T0(J)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 16
    .line 17
    invoke-virtual {p0}, LH4/k$b;->b()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-static {}, LH4/e;->r()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, LH4/m;

    .line 35
    .line 36
    :cond_1
    :goto_0
    invoke-static {}, LH4/e;->s()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    const-wide v3, 0xfffffffffffffffL

    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    and-long v4, v1, v3

    .line 50
    .line 51
    invoke-static {p0, v1, v2}, LH4/e;->t(LH4/e;J)Z

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    sget v1, LH4/f;->b:I

    .line 56
    .line 57
    int-to-long v2, v1

    .line 58
    div-long v2, v4, v2

    .line 59
    .line 60
    int-to-long v8, v1

    .line 61
    rem-long v8, v4, v8

    .line 62
    .line 63
    long-to-int v1, v8

    .line 64
    iget-wide v8, v0, LK4/A;->i:J

    .line 65
    .line 66
    cmp-long v8, v8, v2

    .line 67
    .line 68
    if-eqz v8, :cond_3

    .line 69
    .line 70
    invoke-static {p0, v2, v3, v0}, LH4/e;->i(LH4/e;JLH4/m;)LH4/m;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    if-nez v2, :cond_2

    .line 75
    .line 76
    if-eqz v7, :cond_1

    .line 77
    .line 78
    sget-object p1, LH4/k;->b:LH4/k$b;

    .line 79
    .line 80
    invoke-virtual {p0}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p1, p0}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_2
    move-object v0, v2

    .line 90
    move v2, v1

    .line 91
    move-object v1, v0

    .line 92
    move-object v0, p0

    .line 93
    move-object v3, p1

    .line 94
    goto :goto_1

    .line 95
    :cond_3
    move-object v3, p1

    .line 96
    move v2, v1

    .line 97
    move-object v1, v0

    .line 98
    move-object v0, p0

    .line 99
    :goto_1
    invoke-static/range {v0 .. v7}, LH4/e;->C(LH4/e;LH4/m;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    move-object p1, v0

    .line 104
    move-object v0, v1

    .line 105
    if-eqz p0, :cond_d

    .line 106
    .line 107
    const/4 v1, 0x1

    .line 108
    if-eq p0, v1, :cond_c

    .line 109
    .line 110
    const/4 v1, 0x2

    .line 111
    if-eq p0, v1, :cond_8

    .line 112
    .line 113
    const/4 v1, 0x3

    .line 114
    if-eq p0, v1, :cond_7

    .line 115
    .line 116
    const/4 v1, 0x4

    .line 117
    if-eq p0, v1, :cond_5

    .line 118
    .line 119
    const/4 v1, 0x5

    .line 120
    if-eq p0, v1, :cond_4

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_4
    invoke-virtual {v0}, LK4/b;->c()V

    .line 124
    .line 125
    .line 126
    :goto_2
    move-object p0, p1

    .line 127
    move-object p1, v3

    .line 128
    goto :goto_0

    .line 129
    :cond_5
    invoke-virtual {p1}, LH4/e;->d0()J

    .line 130
    .line 131
    .line 132
    move-result-wide v1

    .line 133
    cmp-long p0, v4, v1

    .line 134
    .line 135
    if-gez p0, :cond_6

    .line 136
    .line 137
    invoke-virtual {v0}, LK4/b;->c()V

    .line 138
    .line 139
    .line 140
    :cond_6
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 141
    .line 142
    invoke-virtual {p1}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p0, p1}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    return-object p0

    .line 151
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 152
    .line 153
    const-string p1, "unexpected"

    .line 154
    .line 155
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    throw p0

    .line 159
    :cond_8
    if-eqz v7, :cond_9

    .line 160
    .line 161
    invoke-virtual {v0}, LK4/A;->t()V

    .line 162
    .line 163
    .line 164
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 165
    .line 166
    invoke-virtual {p1}, LH4/e;->e0()Ljava/lang/Throwable;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p0, p1}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0

    .line 175
    :cond_9
    instance-of p0, v6, LF4/Y0;

    .line 176
    .line 177
    if-eqz p0, :cond_a

    .line 178
    .line 179
    check-cast v6, LF4/Y0;

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_a
    const/4 v6, 0x0

    .line 183
    :goto_3
    if-eqz v6, :cond_b

    .line 184
    .line 185
    invoke-static {p1, v6, v0, v2}, LH4/e;->z(LH4/e;LF4/Y0;LH4/m;I)V

    .line 186
    .line 187
    .line 188
    :cond_b
    invoke-virtual {v0}, LK4/A;->t()V

    .line 189
    .line 190
    .line 191
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 192
    .line 193
    invoke-virtual {p0}, LH4/k$b;->b()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    return-object p0

    .line 198
    :cond_c
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 199
    .line 200
    sget-object p1, Lh4/t;->a:Lh4/t;

    .line 201
    .line 202
    invoke-virtual {p0, p1}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    return-object p0

    .line 207
    :cond_d
    invoke-virtual {v0}, LK4/b;->c()V

    .line 208
    .line 209
    .line 210
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 211
    .line 212
    sget-object p1, Lh4/t;->a:Lh4/t;

    .line 213
    .line 214
    invoke-virtual {p0, p1}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    return-object p0
.end method

.method public final c(Ljava/util/concurrent/CancellationException;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LH4/e;->I(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public close(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, LH4/e;->L(Ljava/lang/Throwable;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public final d0()J
    .locals 2

    .line 1
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method protected final e0()Ljava/lang/Throwable;
    .locals 1

    .line 1
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, LH4/q;

    .line 8
    .line 9
    const-string v0, "Channel was closed"

    .line 10
    .line 11
    invoke-direct {p0, v0}, LH4/q;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public final f1(J)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-direct {v1}, LH4/e;->t0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_6

    .line 10
    .line 11
    :cond_0
    :goto_0
    invoke-direct {v1}, LH4/e;->V()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v0, v2, p1

    .line 16
    .line 17
    if-lez v0, :cond_8

    .line 18
    .line 19
    invoke-static {}, LH4/f;->g()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v6, 0x0

    .line 24
    move v2, v6

    .line 25
    :goto_1
    const-wide v7, 0x3fffffffffffffffL    # 1.9999999999999998

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    if-ge v2, v0, :cond_2

    .line 31
    .line 32
    invoke-direct {v1}, LH4/e;->V()J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    invoke-static {}, LH4/e;->Z()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v5, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v9

    .line 44
    and-long/2addr v7, v9

    .line 45
    cmp-long v5, v3, v7

    .line 46
    .line 47
    if-nez v5, :cond_1

    .line 48
    .line 49
    invoke-direct {v1}, LH4/e;->V()J

    .line 50
    .line 51
    .line 52
    move-result-wide v7

    .line 53
    cmp-long v3, v3, v7

    .line 54
    .line 55
    if-nez v3, :cond_1

    .line 56
    .line 57
    goto :goto_6

    .line 58
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-static {}, LH4/e;->Z()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    :goto_2
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    and-long v4, v2, v7

    .line 70
    .line 71
    const/4 v9, 0x1

    .line 72
    invoke-static {v4, v5, v9}, LH4/f;->a(JZ)J

    .line 73
    .line 74
    .line 75
    move-result-wide v4

    .line 76
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_7

    .line 81
    .line 82
    :goto_3
    invoke-direct {v1}, LH4/e;->V()J

    .line 83
    .line 84
    .line 85
    move-result-wide v2

    .line 86
    invoke-static {}, LH4/e;->Z()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 91
    .line 92
    .line 93
    move-result-wide v4

    .line 94
    and-long v10, v4, v7

    .line 95
    .line 96
    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    .line 97
    .line 98
    and-long/2addr v12, v4

    .line 99
    const-wide/16 v14, 0x0

    .line 100
    .line 101
    cmp-long v0, v12, v14

    .line 102
    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    move v0, v9

    .line 106
    goto :goto_4

    .line 107
    :cond_3
    move v0, v6

    .line 108
    :goto_4
    cmp-long v12, v2, v10

    .line 109
    .line 110
    if-nez v12, :cond_5

    .line 111
    .line 112
    invoke-direct {v1}, LH4/e;->V()J

    .line 113
    .line 114
    .line 115
    move-result-wide v12

    .line 116
    cmp-long v2, v2, v12

    .line 117
    .line 118
    if-nez v2, :cond_5

    .line 119
    .line 120
    invoke-static {}, LH4/e;->Z()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    :goto_5
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 125
    .line 126
    .line 127
    move-result-wide v2

    .line 128
    and-long v4, v2, v7

    .line 129
    .line 130
    invoke-static {v4, v5, v6}, LH4/f;->a(JZ)J

    .line 131
    .line 132
    .line 133
    move-result-wide v4

    .line 134
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    move-object v1, v0

    .line 139
    if-eqz v2, :cond_4

    .line 140
    .line 141
    :goto_6
    return-void

    .line 142
    :cond_4
    move-object v0, v1

    .line 143
    move-object/from16 v1, p0

    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_5
    if-nez v0, :cond_6

    .line 147
    .line 148
    invoke-static {}, LH4/e;->Z()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {v10, v11, v9}, LH4/f;->a(JZ)J

    .line 153
    .line 154
    .line 155
    move-result-wide v1

    .line 156
    move-wide/from16 v16, v4

    .line 157
    .line 158
    move-wide v4, v1

    .line 159
    move-wide/from16 v2, v16

    .line 160
    .line 161
    move-object/from16 v1, p0

    .line 162
    .line 163
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 164
    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_6
    move-object/from16 v1, p0

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_7
    move-object/from16 v1, p0

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_8
    move-object/from16 v1, p0

    .line 174
    .line 175
    goto/16 :goto_0
.end method

.method public final h0()J
    .locals 4

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide v2, 0xfffffffffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    and-long/2addr v0, v2

    .line 15
    return-wide v0
.end method

.method public iterator()LH4/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LH4/i<",
            "TE;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LH4/e$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LH4/e$a;-><init>(LH4/e;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final j0()Z
    .locals 9

    .line 1
    :cond_0
    :goto_0
    invoke-static {}, LH4/e;->b0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, LH4/m;

    .line 10
    .line 11
    invoke-virtual {p0}, LH4/e;->d0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    invoke-virtual {p0}, LH4/e;->h0()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-gtz v1, :cond_1

    .line 23
    .line 24
    return v2

    .line 25
    :cond_1
    sget v1, LH4/f;->b:I

    .line 26
    .line 27
    int-to-long v5, v1

    .line 28
    div-long v5, v3, v5

    .line 29
    .line 30
    iget-wide v7, v0, LK4/A;->i:J

    .line 31
    .line 32
    cmp-long v7, v7, v5

    .line 33
    .line 34
    if-eqz v7, :cond_2

    .line 35
    .line 36
    invoke-direct {p0, v5, v6, v0}, LH4/e;->S(JLH4/m;)LH4/m;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    invoke-static {}, LH4/e;->b0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, LH4/m;

    .line 51
    .line 52
    iget-wide v0, v0, LK4/A;->i:J

    .line 53
    .line 54
    cmp-long v0, v0, v5

    .line 55
    .line 56
    if-gez v0, :cond_0

    .line 57
    .line 58
    return v2

    .line 59
    :cond_2
    invoke-virtual {v0}, LK4/b;->c()V

    .line 60
    .line 61
    .line 62
    int-to-long v1, v1

    .line 63
    rem-long v1, v3, v1

    .line 64
    .line 65
    long-to-int v1, v1

    .line 66
    invoke-direct {p0, v0, v1, v3, v4}, LH4/e;->n0(LH4/m;IJ)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    return p0

    .line 74
    :cond_3
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-wide/16 v5, 0x1

    .line 79
    .line 80
    add-long/2addr v5, v3

    .line 81
    move-object v2, p0

    .line 82
    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 83
    .line 84
    .line 85
    goto :goto_0
.end method

.method public k()Ljava/lang/Object;
    .locals 11

    .line 1
    invoke-static {}, LH4/e;->c0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    invoke-direct {p0, v2, v3}, LH4/e;->q0(J)Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_0

    .line 22
    .line 23
    sget-object v0, LH4/k;->b:LH4/k$b;

    .line 24
    .line 25
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    const-wide v4, 0xfffffffffffffffL

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    and-long/2addr v2, v4

    .line 40
    cmp-long v0, v0, v2

    .line 41
    .line 42
    if-ltz v0, :cond_1

    .line 43
    .line 44
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 45
    .line 46
    invoke-virtual {p0}, LH4/k$b;->b()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    invoke-static {}, LH4/f;->i()LK4/D;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-static {}, LH4/e;->n()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, LH4/m;

    .line 64
    .line 65
    :goto_0
    invoke-virtual {p0}, LH4/e;->p0()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    sget-object v0, LH4/k;->b:LH4/k$b;

    .line 72
    .line 73
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, LH4/k$b;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_2
    invoke-static {}, LH4/e;->o()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    sget v1, LH4/f;->b:I

    .line 91
    .line 92
    int-to-long v6, v1

    .line 93
    div-long v6, v3, v6

    .line 94
    .line 95
    int-to-long v1, v1

    .line 96
    rem-long v1, v3, v1

    .line 97
    .line 98
    long-to-int v2, v1

    .line 99
    iget-wide v8, v0, LK4/A;->i:J

    .line 100
    .line 101
    cmp-long v1, v8, v6

    .line 102
    .line 103
    if-eqz v1, :cond_4

    .line 104
    .line 105
    invoke-static {p0, v6, v7, v0}, LH4/e;->h(LH4/e;JLH4/m;)LH4/m;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    if-nez v1, :cond_3

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    :goto_1
    move-object v0, p0

    .line 113
    goto :goto_2

    .line 114
    :cond_4
    move-object v1, v0

    .line 115
    goto :goto_1

    .line 116
    :goto_2
    invoke-static/range {v0 .. v5}, LH4/e;->B(LH4/e;LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    move-object v10, v1

    .line 121
    move-object v1, v0

    .line 122
    move-object v0, v10

    .line 123
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    if-ne p0, v6, :cond_7

    .line 128
    .line 129
    instance-of p0, v5, LF4/Y0;

    .line 130
    .line 131
    if-eqz p0, :cond_5

    .line 132
    .line 133
    check-cast v5, LF4/Y0;

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_5
    const/4 v5, 0x0

    .line 137
    :goto_3
    if-eqz v5, :cond_6

    .line 138
    .line 139
    invoke-static {v1, v5, v0, v2}, LH4/e;->y(LH4/e;LF4/Y0;LH4/m;I)V

    .line 140
    .line 141
    .line 142
    :cond_6
    invoke-virtual {v1, v3, v4}, LH4/e;->f1(J)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, LK4/A;->t()V

    .line 146
    .line 147
    .line 148
    sget-object p0, LH4/k;->b:LH4/k$b;

    .line 149
    .line 150
    invoke-virtual {p0}, LH4/k$b;->b()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    return-object p0

    .line 155
    :cond_7
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    if-ne p0, v2, :cond_9

    .line 160
    .line 161
    invoke-virtual {v1}, LH4/e;->h0()J

    .line 162
    .line 163
    .line 164
    move-result-wide v6

    .line 165
    cmp-long p0, v3, v6

    .line 166
    .line 167
    if-gez p0, :cond_8

    .line 168
    .line 169
    invoke-virtual {v0}, LK4/b;->c()V

    .line 170
    .line 171
    .line 172
    :cond_8
    move-object p0, v1

    .line 173
    goto :goto_0

    .line 174
    :cond_9
    invoke-static {}, LH4/f;->s()LK4/D;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    if-eq p0, v1, :cond_a

    .line 179
    .line 180
    invoke-virtual {v0}, LK4/b;->c()V

    .line 181
    .line 182
    .line 183
    sget-object v0, LH4/k;->b:LH4/k$b;

    .line 184
    .line 185
    invoke-virtual {v0, p0}, LH4/k$b;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    return-object p0

    .line 190
    :cond_a
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 191
    .line 192
    const-string v0, "unexpected"

    .line 193
    .line 194
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    throw p0
.end method

.method public l(Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "LH4/k<",
            "+TE;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, LH4/e;->L0(LH4/e;Ll4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Lu4/l;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Ljava/lang/Throwable;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, LH4/e;->Y()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, p0, v1, p1}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, LH4/e;->Y()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :cond_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, LH4/f;->d()LK4/D;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-ne v1, v2, :cond_2

    .line 26
    .line 27
    invoke-static {}, LH4/e;->Y()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {}, LH4/f;->d()LK4/D;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {}, LH4/f;->e()LK4/D;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-static {v1, p0, v2, v3}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p1, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    invoke-static {}, LH4/f;->e()LK4/D;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    if-ne v1, p0, :cond_3

    .line 58
    .line 59
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 60
    .line 61
    const-string p1, "Another handler was already registered and successfully invoked"

    .line 62
    .line 63
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    throw p0

    .line 67
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 68
    .line 69
    new-instance p1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v0, "Another handler is already registered: "

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p0
.end method

.method public p(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, LH4/e;->R0(LH4/e;Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p0()Z
    .locals 2

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-direct {p0, v0, v1}, LH4/e;->q0(J)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public q()Z
    .locals 2

    .line 1
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-direct {p0, v0, v1}, LH4/e;->r0(J)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method protected s0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, LH4/e;->g0()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    const/16 v4, 0x3c

    .line 17
    .line 18
    shr-long/2addr v2, v4

    .line 19
    long-to-int v2, v2

    .line 20
    const/4 v3, 0x3

    .line 21
    const/4 v4, 0x2

    .line 22
    if-eq v2, v4, :cond_1

    .line 23
    .line 24
    if-eq v2, v3, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string v2, "cancelled,"

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string v2, "closed,"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v5, "capacity="

    .line 44
    .line 45
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v5, v0, LH4/e;->g:I

    .line 49
    .line 50
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 v5, 0x2c

    .line 54
    .line 55
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v2, "data=["

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    new-array v2, v3, [LH4/m;

    .line 71
    .line 72
    invoke-static {}, LH4/e;->b0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    const/4 v6, 0x0

    .line 81
    aput-object v3, v2, v6

    .line 82
    .line 83
    invoke-static {}, LH4/e;->f0()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    const/4 v7, 0x1

    .line 92
    aput-object v3, v2, v7

    .line 93
    .line 94
    invoke-static {}, LH4/e;->W()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    aput-object v3, v2, v4

    .line 103
    .line 104
    invoke-static {v2}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    new-instance v3, Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    if-eqz v4, :cond_3

    .line 122
    .line 123
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    move-object v8, v4

    .line 128
    check-cast v8, LH4/m;

    .line 129
    .line 130
    invoke-static {}, LH4/f;->n()LH4/m;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    if-eq v8, v9, :cond_2

    .line 135
    .line 136
    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_3
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    if-eqz v3, :cond_1a

    .line 149
    .line 150
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 155
    .line 156
    .line 157
    move-result v4

    .line 158
    if-nez v4, :cond_4

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_4
    move-object v4, v3

    .line 162
    check-cast v4, LH4/m;

    .line 163
    .line 164
    iget-wide v8, v4, LK4/A;->i:J

    .line 165
    .line 166
    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    move-object v10, v4

    .line 171
    check-cast v10, LH4/m;

    .line 172
    .line 173
    iget-wide v10, v10, LK4/A;->i:J

    .line 174
    .line 175
    cmp-long v12, v8, v10

    .line 176
    .line 177
    if-lez v12, :cond_6

    .line 178
    .line 179
    move-object v3, v4

    .line 180
    move-wide v8, v10

    .line 181
    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 182
    .line 183
    .line 184
    move-result v4

    .line 185
    if-nez v4, :cond_5

    .line 186
    .line 187
    :goto_2
    check-cast v3, LH4/m;

    .line 188
    .line 189
    invoke-virtual {v0}, LH4/e;->d0()J

    .line 190
    .line 191
    .line 192
    move-result-wide v10

    .line 193
    invoke-virtual {v0}, LH4/e;->h0()J

    .line 194
    .line 195
    .line 196
    move-result-wide v12

    .line 197
    :goto_3
    sget v0, LH4/f;->b:I

    .line 198
    .line 199
    move v2, v6

    .line 200
    :goto_4
    if-ge v2, v0, :cond_16

    .line 201
    .line 202
    iget-wide v8, v3, LK4/A;->i:J

    .line 203
    .line 204
    sget v4, LH4/f;->b:I

    .line 205
    .line 206
    int-to-long v14, v4

    .line 207
    mul-long/2addr v8, v14

    .line 208
    int-to-long v14, v2

    .line 209
    add-long/2addr v8, v14

    .line 210
    cmp-long v4, v8, v12

    .line 211
    .line 212
    if-ltz v4, :cond_7

    .line 213
    .line 214
    cmp-long v14, v8, v10

    .line 215
    .line 216
    if-gez v14, :cond_17

    .line 217
    .line 218
    :cond_7
    invoke-virtual {v3, v2}, LH4/m;->B(I)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v14

    .line 222
    invoke-virtual {v3, v2}, LH4/m;->A(I)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v15

    .line 226
    instance-of v6, v14, LF4/k;

    .line 227
    .line 228
    if-eqz v6, :cond_a

    .line 229
    .line 230
    cmp-long v6, v8, v10

    .line 231
    .line 232
    if-gez v6, :cond_8

    .line 233
    .line 234
    if-ltz v4, :cond_8

    .line 235
    .line 236
    const-string v4, "receive"

    .line 237
    .line 238
    goto/16 :goto_6

    .line 239
    .line 240
    :cond_8
    if-gez v4, :cond_9

    .line 241
    .line 242
    if-ltz v6, :cond_9

    .line 243
    .line 244
    const-string v4, "send"

    .line 245
    .line 246
    goto/16 :goto_6

    .line 247
    .line 248
    :cond_9
    const-string v4, "cont"

    .line 249
    .line 250
    goto/16 :goto_6

    .line 251
    .line 252
    :cond_a
    instance-of v6, v14, LN4/b;

    .line 253
    .line 254
    if-eqz v6, :cond_d

    .line 255
    .line 256
    cmp-long v6, v8, v10

    .line 257
    .line 258
    if-gez v6, :cond_b

    .line 259
    .line 260
    if-ltz v4, :cond_b

    .line 261
    .line 262
    const-string v4, "onReceive"

    .line 263
    .line 264
    goto/16 :goto_6

    .line 265
    .line 266
    :cond_b
    if-gez v4, :cond_c

    .line 267
    .line 268
    if-ltz v6, :cond_c

    .line 269
    .line 270
    const-string v4, "onSend"

    .line 271
    .line 272
    goto/16 :goto_6

    .line 273
    .line 274
    :cond_c
    const-string v4, "select"

    .line 275
    .line 276
    goto/16 :goto_6

    .line 277
    .line 278
    :cond_d
    instance-of v4, v14, LH4/v;

    .line 279
    .line 280
    if-eqz v4, :cond_e

    .line 281
    .line 282
    const-string v4, "receiveCatching"

    .line 283
    .line 284
    goto/16 :goto_6

    .line 285
    .line 286
    :cond_e
    instance-of v4, v14, LH4/e$b;

    .line 287
    .line 288
    if-eqz v4, :cond_f

    .line 289
    .line 290
    const-string v4, "sendBroadcast"

    .line 291
    .line 292
    goto/16 :goto_6

    .line 293
    .line 294
    :cond_f
    instance-of v4, v14, LH4/y;

    .line 295
    .line 296
    if-eqz v4, :cond_10

    .line 297
    .line 298
    new-instance v4, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 301
    .line 302
    .line 303
    const-string v6, "EB("

    .line 304
    .line 305
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    const/16 v6, 0x29

    .line 312
    .line 313
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v4

    .line 320
    goto :goto_6

    .line 321
    :cond_10
    invoke-static {}, LH4/f;->q()LK4/D;

    .line 322
    .line 323
    .line 324
    move-result-object v4

    .line 325
    invoke-static {v14, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v4

    .line 329
    if-nez v4, :cond_13

    .line 330
    .line 331
    invoke-static {}, LH4/f;->p()LK4/D;

    .line 332
    .line 333
    .line 334
    move-result-object v4

    .line 335
    invoke-static {v14, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v4

    .line 339
    if-eqz v4, :cond_11

    .line 340
    .line 341
    goto :goto_5

    .line 342
    :cond_11
    if-eqz v14, :cond_15

    .line 343
    .line 344
    invoke-static {}, LH4/f;->k()LK4/D;

    .line 345
    .line 346
    .line 347
    move-result-object v4

    .line 348
    invoke-static {v14, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result v4

    .line 352
    if-nez v4, :cond_15

    .line 353
    .line 354
    invoke-static {}, LH4/f;->f()LK4/D;

    .line 355
    .line 356
    .line 357
    move-result-object v4

    .line 358
    invoke-static {v14, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result v4

    .line 362
    if-nez v4, :cond_15

    .line 363
    .line 364
    invoke-static {}, LH4/f;->o()LK4/D;

    .line 365
    .line 366
    .line 367
    move-result-object v4

    .line 368
    invoke-static {v14, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result v4

    .line 372
    if-nez v4, :cond_15

    .line 373
    .line 374
    invoke-static {}, LH4/f;->i()LK4/D;

    .line 375
    .line 376
    .line 377
    move-result-object v4

    .line 378
    invoke-static {v14, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    move-result v4

    .line 382
    if-nez v4, :cond_15

    .line 383
    .line 384
    invoke-static {}, LH4/f;->j()LK4/D;

    .line 385
    .line 386
    .line 387
    move-result-object v4

    .line 388
    invoke-static {v14, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 389
    .line 390
    .line 391
    move-result v4

    .line 392
    if-nez v4, :cond_15

    .line 393
    .line 394
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 395
    .line 396
    .line 397
    move-result-object v4

    .line 398
    invoke-static {v14, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    move-result v4

    .line 402
    if-eqz v4, :cond_12

    .line 403
    .line 404
    goto :goto_7

    .line 405
    :cond_12
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    goto :goto_6

    .line 410
    :cond_13
    :goto_5
    const-string v4, "resuming_sender"

    .line 411
    .line 412
    :goto_6
    if-eqz v15, :cond_14

    .line 413
    .line 414
    new-instance v6, Ljava/lang/StringBuilder;

    .line 415
    .line 416
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 417
    .line 418
    .line 419
    const/16 v8, 0x28

    .line 420
    .line 421
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    const-string v4, "),"

    .line 434
    .line 435
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v4

    .line 442
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    .line 444
    .line 445
    goto :goto_7

    .line 446
    :cond_14
    new-instance v6, Ljava/lang/StringBuilder;

    .line 447
    .line 448
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 449
    .line 450
    .line 451
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 455
    .line 456
    .line 457
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object v4

    .line 461
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .line 463
    .line 464
    :cond_15
    :goto_7
    add-int/lit8 v2, v2, 0x1

    .line 465
    .line 466
    const/4 v6, 0x0

    .line 467
    goto/16 :goto_4

    .line 468
    .line 469
    :cond_16
    invoke-virtual {v3}, LK4/b;->f()LK4/b;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    move-object v3, v0

    .line 474
    check-cast v3, LH4/m;

    .line 475
    .line 476
    if-nez v3, :cond_19

    .line 477
    .line 478
    :cond_17
    invoke-static {v1}, LD4/g;->j0(Ljava/lang/CharSequence;)C

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    if-ne v0, v5, :cond_18

    .line 483
    .line 484
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 485
    .line 486
    .line 487
    move-result v0

    .line 488
    sub-int/2addr v0, v7

    .line 489
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    const-string v2, "deleteCharAt(...)"

    .line 494
    .line 495
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 496
    .line 497
    .line 498
    :cond_18
    const-string v0, "]"

    .line 499
    .line 500
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 501
    .line 502
    .line 503
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 504
    .line 505
    .line 506
    move-result-object v0

    .line 507
    return-object v0

    .line 508
    :cond_19
    const/4 v6, 0x0

    .line 509
    goto/16 :goto_3

    .line 510
    .line 511
    :cond_1a
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 512
    .line 513
    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 514
    .line 515
    .line 516
    throw v0
.end method
