.class public final LO4/G;
.super Ljava/lang/Object;
.source "Response.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO4/G$a;
    }
.end annotation


# instance fields
.field final g:LO4/E;

.field final h:LO4/C;

.field final i:I

.field final j:Ljava/lang/String;

.field final k:LO4/v;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final l:LO4/w;

.field final m:LO4/H;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final n:LO4/G;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final o:LO4/G;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final p:LO4/G;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final q:J

.field final r:J

.field final s:Lokhttp3/internal/connection/Exchange;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private volatile t:LO4/d;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(LO4/G$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, LO4/G$a;->a:LO4/E;

    .line 5
    .line 6
    iput-object v0, p0, LO4/G;->g:LO4/E;

    .line 7
    .line 8
    iget-object v0, p1, LO4/G$a;->b:LO4/C;

    .line 9
    .line 10
    iput-object v0, p0, LO4/G;->h:LO4/C;

    .line 11
    .line 12
    iget v0, p1, LO4/G$a;->c:I

    .line 13
    .line 14
    iput v0, p0, LO4/G;->i:I

    .line 15
    .line 16
    iget-object v0, p1, LO4/G$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, LO4/G;->j:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p1, LO4/G$a;->e:LO4/v;

    .line 21
    .line 22
    iput-object v0, p0, LO4/G;->k:LO4/v;

    .line 23
    .line 24
    iget-object v0, p1, LO4/G$a;->f:LO4/w$a;

    .line 25
    .line 26
    invoke-virtual {v0}, LO4/w$a;->d()LO4/w;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, LO4/G;->l:LO4/w;

    .line 31
    .line 32
    iget-object v0, p1, LO4/G$a;->g:LO4/H;

    .line 33
    .line 34
    iput-object v0, p0, LO4/G;->m:LO4/H;

    .line 35
    .line 36
    iget-object v0, p1, LO4/G$a;->h:LO4/G;

    .line 37
    .line 38
    iput-object v0, p0, LO4/G;->n:LO4/G;

    .line 39
    .line 40
    iget-object v0, p1, LO4/G$a;->i:LO4/G;

    .line 41
    .line 42
    iput-object v0, p0, LO4/G;->o:LO4/G;

    .line 43
    .line 44
    iget-object v0, p1, LO4/G$a;->j:LO4/G;

    .line 45
    .line 46
    iput-object v0, p0, LO4/G;->p:LO4/G;

    .line 47
    .line 48
    iget-wide v0, p1, LO4/G$a;->k:J

    .line 49
    .line 50
    iput-wide v0, p0, LO4/G;->q:J

    .line 51
    .line 52
    iget-wide v0, p1, LO4/G$a;->l:J

    .line 53
    .line 54
    iput-wide v0, p0, LO4/G;->r:J

    .line 55
    .line 56
    iget-object p1, p1, LO4/G$a;->m:Lokhttp3/internal/connection/Exchange;

    .line 57
    .line 58
    iput-object p1, p0, LO4/G;->s:Lokhttp3/internal/connection/Exchange;

    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public A()LO4/G;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/G;->p:LO4/G;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()LO4/C;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/G;->h:LO4/C;

    .line 2
    .line 3
    return-object p0
.end method

.method public C()J
    .locals 2

    .line 1
    iget-wide v0, p0, LO4/G;->r:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public D()LO4/E;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/G;->g:LO4/E;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()J
    .locals 2

    .line 1
    iget-wide v0, p0, LO4/G;->q:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public b()LO4/H;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/G;->m:LO4/H;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LO4/d;
    .locals 1

    .line 1
    iget-object v0, p0, LO4/G;->t:LO4/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, LO4/G;->l:LO4/w;

    .line 7
    .line 8
    invoke-static {v0}, LO4/d;->k(LO4/w;)LO4/d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, LO4/G;->t:LO4/d;

    .line 13
    .line 14
    return-object v0
.end method

.method public close()V
    .locals 1

    .line 1
    iget-object p0, p0, LO4/G;->m:LO4/H;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LO4/H;->close()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 10
    .line 11
    const-string v0, "response is not eligible for a body and must not be closed"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, LO4/G;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public e()LO4/v;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/G;->k:LO4/v;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, LO4/G;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/G;->l:LO4/w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LO4/w;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    return-object p2
.end method

.method public n()LO4/w;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/G;->l:LO4/w;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/G;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Response{protocol="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LO4/G;->h:LO4/C;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", code="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, LO4/G;->i:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", message="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, LO4/G;->j:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", url="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, LO4/G;->g:LO4/E;

    .line 42
    .line 43
    invoke-virtual {p0}, LO4/E;->i()LO4/x;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x7d

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public v()LO4/G;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/G;->n:LO4/G;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()LO4/G$a;
    .locals 1

    .line 1
    new-instance v0, LO4/G$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LO4/G$a;-><init>(LO4/G;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public z()Z
    .locals 1

    .line 1
    iget p0, p0, LO4/G;->i:I

    .line 2
    .line 3
    const/16 v0, 0xc8

    .line 4
    .line 5
    if-lt p0, v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x12c

    .line 8
    .line 9
    if-ge p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
