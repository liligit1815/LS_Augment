.class Lrx/internal/schedulers/b$a;
.super Lrx/e$a;
.source "EventLoopsScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/schedulers/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final g:LW4/g;

.field private final h:Lb5/b;

.field private final i:LW4/g;

.field private final j:Lrx/internal/schedulers/b$c;


# direct methods
.method constructor <init>(Lrx/internal/schedulers/b$c;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lrx/e$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LW4/g;

    .line 5
    .line 6
    invoke-direct {v0}, LW4/g;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lrx/internal/schedulers/b$a;->g:LW4/g;

    .line 10
    .line 11
    new-instance v1, Lb5/b;

    .line 12
    .line 13
    invoke-direct {v1}, Lb5/b;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lrx/internal/schedulers/b$a;->h:Lb5/b;

    .line 17
    .line 18
    new-instance v2, LW4/g;

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    new-array v3, v3, [Lrx/i;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    aput-object v0, v3, v4

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    aput-object v1, v3, v0

    .line 28
    .line 29
    invoke-direct {v2, v3}, LW4/g;-><init>([Lrx/i;)V

    .line 30
    .line 31
    .line 32
    iput-object v2, p0, Lrx/internal/schedulers/b$a;->i:LW4/g;

    .line 33
    .line 34
    iput-object p1, p0, Lrx/internal/schedulers/b$a;->j:Lrx/internal/schedulers/b$c;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public b(LT4/a;)Lrx/i;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lrx/internal/schedulers/b$a;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lb5/e;->c()Lrx/i;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lrx/internal/schedulers/b$a;->j:Lrx/internal/schedulers/b$c;

    .line 13
    .line 14
    new-instance v1, Lrx/internal/schedulers/b$a$a;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/b$a$a;-><init>(Lrx/internal/schedulers/b$a;LT4/a;)V

    .line 17
    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    iget-object v5, p0, Lrx/internal/schedulers/b$a;->g:LW4/g;

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    invoke-virtual/range {v0 .. v5}, Lrx/internal/schedulers/d;->j(LT4/a;JLjava/util/concurrent/TimeUnit;LW4/g;)Lrx/internal/schedulers/e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public c(LT4/a;JLjava/util/concurrent/TimeUnit;)Lrx/i;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lrx/internal/schedulers/b$a;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lb5/e;->c()Lrx/i;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lrx/internal/schedulers/b$a;->j:Lrx/internal/schedulers/b$c;

    .line 13
    .line 14
    new-instance v1, Lrx/internal/schedulers/b$a$b;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/b$a$b;-><init>(Lrx/internal/schedulers/b$a;LT4/a;)V

    .line 17
    .line 18
    .line 19
    iget-object v5, p0, Lrx/internal/schedulers/b$a;->h:Lb5/b;

    .line 20
    .line 21
    move-wide v2, p2

    .line 22
    move-object v4, p4

    .line 23
    invoke-virtual/range {v0 .. v5}, Lrx/internal/schedulers/d;->k(LT4/a;JLjava/util/concurrent/TimeUnit;Lb5/b;)Lrx/internal/schedulers/e;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/b$a;->i:LW4/g;

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

.method public unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/b$a;->i:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0}, LW4/g;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
