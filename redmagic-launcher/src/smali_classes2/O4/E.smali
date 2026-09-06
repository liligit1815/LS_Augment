.class public final LO4/E;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO4/E$a;
    }
.end annotation


# instance fields
.field final a:LO4/x;

.field final b:Ljava/lang/String;

.field final c:LO4/w;

.field final d:LO4/F;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private volatile f:LO4/d;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(LO4/E$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, LO4/E$a;->a:LO4/x;

    .line 5
    .line 6
    iput-object v0, p0, LO4/E;->a:LO4/x;

    .line 7
    .line 8
    iget-object v0, p1, LO4/E$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, LO4/E;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, LO4/E$a;->c:LO4/w$a;

    .line 13
    .line 14
    invoke-virtual {v0}, LO4/w$a;->d()LO4/w;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, LO4/E;->c:LO4/w;

    .line 19
    .line 20
    iget-object v0, p1, LO4/E$a;->d:LO4/F;

    .line 21
    .line 22
    iput-object v0, p0, LO4/E;->d:LO4/F;

    .line 23
    .line 24
    iget-object p1, p1, LO4/E$a;->e:Ljava/util/Map;

    .line 25
    .line 26
    invoke-static {p1}, Lokhttp3/internal/Util;->immutableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, LO4/E;->e:Ljava/util/Map;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a()LO4/F;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/E;->d:LO4/F;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()LO4/d;
    .locals 1

    .line 1
    iget-object v0, p0, LO4/E;->f:LO4/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, LO4/E;->c:LO4/w;

    .line 7
    .line 8
    invoke-static {v0}, LO4/d;->k(LO4/w;)LO4/d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, LO4/E;->f:LO4/d;

    .line 13
    .line 14
    return-object v0
.end method

.method public c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/E;->c:LO4/w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LO4/w;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()LO4/w;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/E;->c:LO4/w;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LO4/E;->c:LO4/w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LO4/w;->j(Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, LO4/E;->a:LO4/x;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/x;->n()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/E;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()LO4/E$a;
    .locals 1

    .line 1
    new-instance v0, LO4/E$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LO4/E$a;-><init>(LO4/E;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public i()LO4/x;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/E;->a:LO4/x;

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
    const-string v1, "Request{method="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LO4/E;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", url="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, LO4/E;->a:LO4/x;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", tags="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, LO4/E;->e:Ljava/util/Map;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x7d

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
