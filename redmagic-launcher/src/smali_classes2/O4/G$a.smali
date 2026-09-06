.class public LO4/G$a;
.super Ljava/lang/Object;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LO4/G;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field a:LO4/E;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field b:LO4/C;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field c:I

.field d:Ljava/lang/String;

.field e:LO4/v;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field f:LO4/w$a;

.field g:LO4/H;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field h:LO4/G;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field i:LO4/G;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field j:LO4/G;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field k:J

.field l:J

.field m:Lokhttp3/internal/connection/Exchange;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, LO4/G$a;->c:I

    .line 3
    new-instance v0, LO4/w$a;

    invoke-direct {v0}, LO4/w$a;-><init>()V

    iput-object v0, p0, LO4/G$a;->f:LO4/w$a;

    return-void
.end method

.method constructor <init>(LO4/G;)V
    .locals 2

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 5
    iput v0, p0, LO4/G$a;->c:I

    .line 6
    iget-object v0, p1, LO4/G;->g:LO4/E;

    iput-object v0, p0, LO4/G$a;->a:LO4/E;

    .line 7
    iget-object v0, p1, LO4/G;->h:LO4/C;

    iput-object v0, p0, LO4/G$a;->b:LO4/C;

    .line 8
    iget v0, p1, LO4/G;->i:I

    iput v0, p0, LO4/G$a;->c:I

    .line 9
    iget-object v0, p1, LO4/G;->j:Ljava/lang/String;

    iput-object v0, p0, LO4/G$a;->d:Ljava/lang/String;

    .line 10
    iget-object v0, p1, LO4/G;->k:LO4/v;

    iput-object v0, p0, LO4/G$a;->e:LO4/v;

    .line 11
    iget-object v0, p1, LO4/G;->l:LO4/w;

    invoke-virtual {v0}, LO4/w;->f()LO4/w$a;

    move-result-object v0

    iput-object v0, p0, LO4/G$a;->f:LO4/w$a;

    .line 12
    iget-object v0, p1, LO4/G;->m:LO4/H;

    iput-object v0, p0, LO4/G$a;->g:LO4/H;

    .line 13
    iget-object v0, p1, LO4/G;->n:LO4/G;

    iput-object v0, p0, LO4/G$a;->h:LO4/G;

    .line 14
    iget-object v0, p1, LO4/G;->o:LO4/G;

    iput-object v0, p0, LO4/G$a;->i:LO4/G;

    .line 15
    iget-object v0, p1, LO4/G;->p:LO4/G;

    iput-object v0, p0, LO4/G$a;->j:LO4/G;

    .line 16
    iget-wide v0, p1, LO4/G;->q:J

    iput-wide v0, p0, LO4/G$a;->k:J

    .line 17
    iget-wide v0, p1, LO4/G;->r:J

    iput-wide v0, p0, LO4/G$a;->l:J

    .line 18
    iget-object p1, p1, LO4/G;->s:Lokhttp3/internal/connection/Exchange;

    iput-object p1, p0, LO4/G$a;->m:Lokhttp3/internal/connection/Exchange;

    return-void
.end method

.method private e(LO4/G;)V
    .locals 0

    .line 1
    iget-object p0, p1, LO4/G;->m:LO4/H;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 7
    .line 8
    const-string p1, "priorResponse.body != null"

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method private f(Ljava/lang/String;LO4/G;)V
    .locals 0

    .line 1
    iget-object p0, p2, LO4/G;->m:LO4/H;

    .line 2
    .line 3
    if-nez p0, :cond_3

    .line 4
    .line 5
    iget-object p0, p2, LO4/G;->n:LO4/G;

    .line 6
    .line 7
    if-nez p0, :cond_2

    .line 8
    .line 9
    iget-object p0, p2, LO4/G;->o:LO4/G;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p2, LO4/G;->p:LO4/G;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 19
    .line 20
    new-instance p2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p1, ".priorResponse != null"

    .line 29
    .line 30
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 42
    .line 43
    new-instance p2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p1, ".cacheResponse != null"

    .line 52
    .line 53
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p0

    .line 64
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 65
    .line 66
    new-instance p2, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p1, ".networkResponse != null"

    .line 75
    .line 76
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p0

    .line 87
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 88
    .line 89
    new-instance p2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string p1, ".body != null"

    .line 98
    .line 99
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    throw p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)LO4/G$a;
    .locals 1

    .line 1
    iget-object v0, p0, LO4/G$a;->f:LO4/w$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, LO4/w$a;->a(Ljava/lang/String;Ljava/lang/String;)LO4/w$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b(LO4/H;)LO4/G$a;
    .locals 0
    .param p1    # LO4/H;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, LO4/G$a;->g:LO4/H;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LO4/G;
    .locals 3

    .line 1
    iget-object v0, p0, LO4/G$a;->a:LO4/E;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, LO4/G$a;->b:LO4/C;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget v0, p0, LO4/G$a;->c:I

    .line 10
    .line 11
    if-ltz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, LO4/G$a;->d:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, LO4/G;

    .line 18
    .line 19
    invoke-direct {v0, p0}, LO4/G;-><init>(LO4/G$a;)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 24
    .line 25
    const-string v0, "message == null"

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v2, "code < 0: "

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget p0, p0, LO4/G$a;->c:I

    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw v0

    .line 56
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 57
    .line 58
    const-string v0, "protocol == null"

    .line 59
    .line 60
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p0

    .line 64
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 65
    .line 66
    const-string v0, "request == null"

    .line 67
    .line 68
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p0
.end method

.method public d(LO4/G;)LO4/G$a;
    .locals 1
    .param p1    # LO4/G;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "cacheResponse"

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, LO4/G$a;->f(Ljava/lang/String;LO4/G;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, LO4/G$a;->i:LO4/G;

    .line 9
    .line 10
    return-object p0
.end method

.method public g(I)LO4/G$a;
    .locals 0

    .line 1
    iput p1, p0, LO4/G$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public h(LO4/v;)LO4/G$a;
    .locals 0
    .param p1    # LO4/v;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, LO4/G$a;->e:LO4/v;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;)LO4/G$a;
    .locals 1

    .line 1
    iget-object v0, p0, LO4/G$a;->f:LO4/w$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, LO4/w$a;->f(Ljava/lang/String;Ljava/lang/String;)LO4/w$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public j(LO4/w;)LO4/G$a;
    .locals 0

    .line 1
    invoke-virtual {p1}, LO4/w;->f()LO4/w$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, LO4/G$a;->f:LO4/w$a;

    .line 6
    .line 7
    return-object p0
.end method

.method k(Lokhttp3/internal/connection/Exchange;)V
    .locals 0

    .line 1
    iput-object p1, p0, LO4/G$a;->m:Lokhttp3/internal/connection/Exchange;

    .line 2
    .line 3
    return-void
.end method

.method public l(Ljava/lang/String;)LO4/G$a;
    .locals 0

    .line 1
    iput-object p1, p0, LO4/G$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(LO4/G;)LO4/G$a;
    .locals 1
    .param p1    # LO4/G;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "networkResponse"

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, LO4/G$a;->f(Ljava/lang/String;LO4/G;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, LO4/G$a;->h:LO4/G;

    .line 9
    .line 10
    return-object p0
.end method

.method public n(LO4/G;)LO4/G$a;
    .locals 0
    .param p1    # LO4/G;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, LO4/G$a;->e(LO4/G;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput-object p1, p0, LO4/G$a;->j:LO4/G;

    .line 7
    .line 8
    return-object p0
.end method

.method public o(LO4/C;)LO4/G$a;
    .locals 0

    .line 1
    iput-object p1, p0, LO4/G$a;->b:LO4/C;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(J)LO4/G$a;
    .locals 0

    .line 1
    iput-wide p1, p0, LO4/G$a;->l:J

    .line 2
    .line 3
    return-object p0
.end method

.method public q(LO4/E;)LO4/G$a;
    .locals 0

    .line 1
    iput-object p1, p0, LO4/G$a;->a:LO4/E;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(J)LO4/G$a;
    .locals 0

    .line 1
    iput-wide p1, p0, LO4/G$a;->k:J

    .line 2
    .line 3
    return-object p0
.end method
