.class public final LK4/q;
.super Ljava/lang/Object;
.source "LockFreeTaskQueue.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LK4/q$a;,
        LK4/q$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final e:LK4/q$a;

.field private static final synthetic f:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field private static final synthetic g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final h:LK4/D;


# instance fields
.field private volatile synthetic _next$volatile:Ljava/lang/Object;

.field private volatile synthetic _state$volatile:J

.field private final a:I

.field private final b:Z

.field private final c:I

.field private final synthetic d:Ljava/util/concurrent/atomic/AtomicReferenceArray;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LK4/q$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LK4/q$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LK4/q;->e:LK4/q$a;

    .line 8
    .line 9
    const-class v0, Ljava/lang/Object;

    .line 10
    .line 11
    const-string v1, "_next$volatile"

    .line 12
    .line 13
    const-class v2, LK4/q;

    .line 14
    .line 15
    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, LK4/q;->f:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 20
    .line 21
    const-string v0, "_state$volatile"

    .line 22
    .line 23
    invoke-static {v2, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, LK4/q;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 28
    .line 29
    new-instance v0, LK4/D;

    .line 30
    .line 31
    const-string v1, "REMOVE_FROZEN"

    .line 32
    .line 33
    invoke-direct {v0, v1}, LK4/D;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sput-object v0, LK4/q;->h:LK4/D;

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LK4/q;->a:I

    .line 5
    .line 6
    iput-boolean p2, p0, LK4/q;->b:Z

    .line 7
    .line 8
    add-int/lit8 p2, p1, -0x1

    .line 9
    .line 10
    iput p2, p0, LK4/q;->c:I

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, LK4/q;->d:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 18
    .line 19
    const p0, 0x3fffffff    # 1.9999999f

    .line 20
    .line 21
    .line 22
    const-string v0, "Check failed."

    .line 23
    .line 24
    if-gt p2, p0, :cond_1

    .line 25
    .line 26
    and-int p0, p1, p2

    .line 27
    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 32
    .line 33
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p0

    .line 37
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 38
    .line 39
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p0
.end method

.method private final b(J)LK4/q;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "LK4/q<",
            "TE;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LK4/q;

    .line 2
    .line 3
    iget v1, p0, LK4/q;->a:I

    .line 4
    .line 5
    mul-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    iget-boolean v2, p0, LK4/q;->b:Z

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, LK4/q;-><init>(IZ)V

    .line 10
    .line 11
    .line 12
    const-wide/32 v1, 0x3fffffff

    .line 13
    .line 14
    .line 15
    and-long/2addr v1, p1

    .line 16
    long-to-int v1, v1

    .line 17
    const-wide v2, 0xfffffffc0000000L

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    and-long/2addr v2, p1

    .line 23
    const/16 v4, 0x1e

    .line 24
    .line 25
    shr-long/2addr v2, v4

    .line 26
    long-to-int v2, v2

    .line 27
    :goto_0
    iget v3, p0, LK4/q;->c:I

    .line 28
    .line 29
    and-int v4, v1, v3

    .line 30
    .line 31
    and-int/2addr v3, v2

    .line 32
    if-eq v4, v3, :cond_1

    .line 33
    .line 34
    invoke-direct {p0}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget v4, p0, LK4/q;->c:I

    .line 39
    .line 40
    and-int/2addr v4, v1

    .line 41
    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    if-nez v3, :cond_0

    .line 46
    .line 47
    new-instance v3, LK4/q$b;

    .line 48
    .line 49
    invoke-direct {v3, v1}, LK4/q$b;-><init>(I)V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-direct {v0}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    iget v5, v0, LK4/q;->c:I

    .line 57
    .line 58
    and-int/2addr v5, v1

    .line 59
    invoke-virtual {v4, v5, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget-object v1, LK4/q;->e:LK4/q$a;

    .line 70
    .line 71
    const-wide/high16 v2, 0x1000000000000000L

    .line 72
    .line 73
    invoke-virtual {v1, p1, p2, v2, v3}, LK4/q$a;->d(JJ)J

    .line 74
    .line 75
    .line 76
    move-result-wide p1

    .line 77
    invoke-virtual {p0, v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->set(Ljava/lang/Object;J)V

    .line 78
    .line 79
    .line 80
    return-object v0
.end method

.method private final c(J)LK4/q;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "LK4/q<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, LK4/q;->h()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, LK4/q;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_0
    invoke-static {}, LK4/q;->h()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-direct {p0, p1, p2}, LK4/q;->b(J)LK4/q;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {v1, p0, v2, v3}, Landroidx/concurrent/futures/b;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    goto :goto_0
.end method

.method private final e(ILjava/lang/Object;)LK4/q;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)",
            "LK4/q<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, LK4/q;->c:I

    .line 6
    .line 7
    and-int/2addr v1, p1

    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, v0, LK4/q$b;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    check-cast v0, LK4/q$b;

    .line 17
    .line 18
    iget v0, v0, LK4/q$b;->a:I

    .line 19
    .line 20
    if-ne v0, p1, :cond_0

    .line 21
    .line 22
    invoke-direct {p0}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget v1, p0, LK4/q;->c:I

    .line 27
    .line 28
    and-int/2addr p1, v1

    .line 29
    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method private final synthetic f()Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .locals 0

    .line 1
    iget-object p0, p0, LK4/q;->d:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2
    .line 3
    return-object p0
.end method

.method private static final synthetic h()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LK4/q;->f:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private static final synthetic i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LK4/q;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private final k()J
    .locals 10

    .line 1
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

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
    const-wide/high16 v4, 0x1000000000000000L

    .line 10
    .line 11
    and-long v6, v2, v4

    .line 12
    .line 13
    const-wide/16 v8, 0x0

    .line 14
    .line 15
    cmp-long v1, v6, v8

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    return-wide v2

    .line 20
    :cond_0
    or-long/2addr v4, v2

    .line 21
    move-object v1, p0

    .line 22
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    return-wide v4

    .line 29
    :cond_1
    move-object p0, v1

    .line 30
    goto :goto_0
.end method

.method private final n(II)LK4/q;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "LK4/q<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/32 v0, 0x3fffffff

    .line 10
    .line 11
    .line 12
    and-long/2addr v0, v2

    .line 13
    long-to-int v6, v0

    .line 14
    const-wide/high16 v0, 0x1000000000000000L

    .line 15
    .line 16
    and-long/2addr v0, v2

    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v0, v0, v4

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, LK4/q;->l()LK4/q;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, LK4/q;->e:LK4/q$a;

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3, p2}, LK4/q$a;->b(JI)J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    move-object v1, p0

    .line 39
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    invoke-direct {v1}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iget p1, v1, LK4/q;->c:I

    .line 50
    .line 51
    and-int/2addr p1, v6

    .line 52
    const/4 p2, 0x0

    .line 53
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-object p2

    .line 57
    :cond_1
    move-object p0, v1

    .line 58
    goto :goto_0
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)I
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)I"
        }
    .end annotation

    .line 1
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :cond_0
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    const-wide/high16 v1, 0x3000000000000000L    # 1.727233711018889E-77

    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    const-wide/16 v7, 0x0

    .line 13
    .line 14
    cmp-long v1, v1, v7

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    sget-object p0, LK4/q;->e:LK4/q$a;

    .line 19
    .line 20
    invoke-virtual {p0, v3, v4}, LK4/q$a;->a(J)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const-wide/32 v1, 0x3fffffff

    .line 26
    .line 27
    .line 28
    and-long/2addr v1, v3

    .line 29
    long-to-int v1, v1

    .line 30
    const-wide v5, 0xfffffffc0000000L

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    and-long/2addr v5, v3

    .line 36
    const/16 v2, 0x1e

    .line 37
    .line 38
    shr-long/2addr v5, v2

    .line 39
    long-to-int v9, v5

    .line 40
    iget v10, p0, LK4/q;->c:I

    .line 41
    .line 42
    add-int/lit8 v2, v9, 0x2

    .line 43
    .line 44
    and-int/2addr v2, v10

    .line 45
    and-int v5, v1, v10

    .line 46
    .line 47
    const/4 v6, 0x1

    .line 48
    if-ne v2, v5, :cond_2

    .line 49
    .line 50
    return v6

    .line 51
    :cond_2
    iget-boolean v2, p0, LK4/q;->b:Z

    .line 52
    .line 53
    const v5, 0x3fffffff    # 1.9999999f

    .line 54
    .line 55
    .line 56
    if-nez v2, :cond_4

    .line 57
    .line 58
    invoke-direct {p0}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    and-int v11, v9, v10

    .line 63
    .line 64
    invoke-virtual {v2, v11}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    if-eqz v2, :cond_4

    .line 69
    .line 70
    iget v2, p0, LK4/q;->a:I

    .line 71
    .line 72
    const/16 v3, 0x400

    .line 73
    .line 74
    if-lt v2, v3, :cond_3

    .line 75
    .line 76
    sub-int/2addr v9, v1

    .line 77
    and-int v1, v9, v5

    .line 78
    .line 79
    shr-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    if-le v1, v2, :cond_0

    .line 82
    .line 83
    :cond_3
    return v6

    .line 84
    :cond_4
    add-int/lit8 v1, v9, 0x1

    .line 85
    .line 86
    and-int/2addr v1, v5

    .line 87
    move v2, v1

    .line 88
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget-object v5, LK4/q;->e:LK4/q$a;

    .line 93
    .line 94
    invoke-virtual {v5, v3, v4, v2}, LK4/q$a;->c(JI)J

    .line 95
    .line 96
    .line 97
    move-result-wide v5

    .line 98
    move-object v2, p0

    .line 99
    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_7

    .line 104
    .line 105
    invoke-direct {v2}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    and-int v0, v9, v10

    .line 110
    .line 111
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    move-object p0, v2

    .line 115
    :cond_5
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 120
    .line 121
    .line 122
    move-result-wide v0

    .line 123
    const-wide/high16 v2, 0x1000000000000000L

    .line 124
    .line 125
    and-long/2addr v0, v2

    .line 126
    cmp-long v0, v0, v7

    .line 127
    .line 128
    if-eqz v0, :cond_6

    .line 129
    .line 130
    invoke-virtual {p0}, LK4/q;->l()LK4/q;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-direct {p0, v9, p1}, LK4/q;->e(ILjava/lang/Object;)LK4/q;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    if-nez p0, :cond_5

    .line 139
    .line 140
    :cond_6
    const/4 p0, 0x0

    .line 141
    return p0

    .line 142
    :cond_7
    move-object p0, v2

    .line 143
    goto/16 :goto_0
.end method

.method public final d()Z
    .locals 12

    .line 1
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

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
    const-wide/high16 v4, 0x2000000000000000L

    .line 10
    .line 11
    and-long v6, v2, v4

    .line 12
    .line 13
    const-wide/16 v8, 0x0

    .line 14
    .line 15
    cmp-long v1, v6, v8

    .line 16
    .line 17
    const/4 v6, 0x1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    return v6

    .line 21
    :cond_0
    const-wide/high16 v10, 0x1000000000000000L

    .line 22
    .line 23
    and-long/2addr v10, v2

    .line 24
    cmp-long v1, v10, v8

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    or-long/2addr v4, v2

    .line 31
    move-object v1, p0

    .line 32
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    return v6

    .line 39
    :cond_2
    move-object p0, v1

    .line 40
    goto :goto_0
.end method

.method public final g()I
    .locals 4

    .line 1
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

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
    const-wide/32 v2, 0x3fffffff

    .line 10
    .line 11
    .line 12
    and-long/2addr v2, v0

    .line 13
    long-to-int p0, v2

    .line 14
    const-wide v2, 0xfffffffc0000000L

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    and-long/2addr v0, v2

    .line 20
    const/16 v2, 0x1e

    .line 21
    .line 22
    shr-long/2addr v0, v2

    .line 23
    long-to-int v0, v0

    .line 24
    sub-int/2addr v0, p0

    .line 25
    const p0, 0x3fffffff    # 1.9999999f

    .line 26
    .line 27
    .line 28
    and-int/2addr p0, v0

    .line 29
    return p0
.end method

.method public final j()Z
    .locals 4

    .line 1
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

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
    const-wide/32 v2, 0x3fffffff

    .line 10
    .line 11
    .line 12
    and-long/2addr v2, v0

    .line 13
    long-to-int p0, v2

    .line 14
    const-wide v2, 0xfffffffc0000000L

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    and-long/2addr v0, v2

    .line 20
    const/16 v2, 0x1e

    .line 21
    .line 22
    shr-long/2addr v0, v2

    .line 23
    long-to-int v0, v0

    .line 24
    if-ne p0, v0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final l()LK4/q;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LK4/q<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LK4/q;->k()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0, v0, v1}, LK4/q;->c(J)LK4/q;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final m()Ljava/lang/Object;
    .locals 11

    .line 1
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :cond_0
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    const-wide/high16 v1, 0x1000000000000000L

    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    const-wide/16 v5, 0x0

    .line 13
    .line 14
    cmp-long v1, v1, v5

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    sget-object p0, LK4/q;->h:LK4/D;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-wide/32 v1, 0x3fffffff

    .line 22
    .line 23
    .line 24
    and-long/2addr v1, v3

    .line 25
    long-to-int v7, v1

    .line 26
    const-wide v1, 0xfffffffc0000000L

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    and-long/2addr v1, v3

    .line 32
    const/16 v5, 0x1e

    .line 33
    .line 34
    shr-long/2addr v1, v5

    .line 35
    long-to-int v1, v1

    .line 36
    iget v2, p0, LK4/q;->c:I

    .line 37
    .line 38
    and-int/2addr v1, v2

    .line 39
    and-int/2addr v2, v7

    .line 40
    const/4 v8, 0x0

    .line 41
    if-ne v1, v2, :cond_2

    .line 42
    .line 43
    return-object v8

    .line 44
    :cond_2
    invoke-direct {p0}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget v2, p0, LK4/q;->c:I

    .line 49
    .line 50
    and-int/2addr v2, v7

    .line 51
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v9

    .line 55
    if-nez v9, :cond_3

    .line 56
    .line 57
    iget-boolean v1, p0, LK4/q;->b:Z

    .line 58
    .line 59
    if-eqz v1, :cond_0

    .line 60
    .line 61
    return-object v8

    .line 62
    :cond_3
    instance-of v1, v9, LK4/q$b;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    return-object v8

    .line 67
    :cond_4
    add-int/lit8 v1, v7, 0x1

    .line 68
    .line 69
    const v2, 0x3fffffff    # 1.9999999f

    .line 70
    .line 71
    .line 72
    and-int v10, v1, v2

    .line 73
    .line 74
    invoke-static {}, LK4/q;->i()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    sget-object v2, LK4/q;->e:LK4/q$a;

    .line 79
    .line 80
    invoke-virtual {v2, v3, v4, v10}, LK4/q$a;->b(JI)J

    .line 81
    .line 82
    .line 83
    move-result-wide v5

    .line 84
    move-object v2, p0

    .line 85
    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_5

    .line 90
    .line 91
    invoke-direct {v2}, LK4/q;->f()Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iget v0, v2, LK4/q;->c:I

    .line 96
    .line 97
    and-int/2addr v0, v7

    .line 98
    invoke-virtual {p0, v0, v8}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-object v9

    .line 102
    :cond_5
    iget-boolean p0, v2, LK4/q;->b:Z

    .line 103
    .line 104
    if-eqz p0, :cond_7

    .line 105
    .line 106
    move-object p0, v2

    .line 107
    :cond_6
    invoke-direct {p0, v7, v10}, LK4/q;->n(II)LK4/q;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    if-nez p0, :cond_6

    .line 112
    .line 113
    return-object v9

    .line 114
    :cond_7
    move-object p0, v2

    .line 115
    goto :goto_0
.end method
