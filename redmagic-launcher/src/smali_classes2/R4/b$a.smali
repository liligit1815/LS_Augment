.class LR4/b$a;
.super Lrx/e$a;
.source "HandlerScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LR4/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private final g:Landroid/os/Handler;

.field private final h:Lb5/b;


# direct methods
.method constructor <init>(Landroid/os/Handler;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lrx/e$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lb5/b;

    .line 5
    .line 6
    invoke-direct {v0}, Lb5/b;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LR4/b$a;->h:Lb5/b;

    .line 10
    .line 11
    iput-object p1, p0, LR4/b$a;->g:Landroid/os/Handler;

    .line 12
    .line 13
    return-void
.end method

.method static synthetic e(LR4/b$a;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, LR4/b$a;->g:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b(LT4/a;)Lrx/i;
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, v1, v2}, LR4/b$a;->c(LT4/a;JLjava/util/concurrent/TimeUnit;)Lrx/i;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(LT4/a;JLjava/util/concurrent/TimeUnit;)Lrx/i;
    .locals 1

    .line 1
    iget-object v0, p0, LR4/b$a;->h:Lb5/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lb5/b;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lb5/e;->c()Lrx/i;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-static {}, LQ4/a;->a()LQ4/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, LQ4/a;->b()LQ4/b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, LQ4/b;->c(LT4/a;)LT4/a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Lrx/internal/schedulers/e;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Lrx/internal/schedulers/e;-><init>(LT4/a;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, LR4/b$a;->h:Lb5/b;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lrx/internal/schedulers/e;->c(Lb5/b;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, LR4/b$a;->h:Lb5/b;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Lb5/b;->a(Lrx/i;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, LR4/b$a;->g:Landroid/os/Handler;

    .line 42
    .line 43
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 44
    .line 45
    .line 46
    move-result-wide p2

    .line 47
    invoke-virtual {p1, v0, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 48
    .line 49
    .line 50
    new-instance p1, LR4/b$a$a;

    .line 51
    .line 52
    invoke-direct {p1, p0, v0}, LR4/b$a$a;-><init>(LR4/b$a;Lrx/internal/schedulers/e;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p1}, Lb5/e;->a(LT4/a;)Lrx/i;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/internal/schedulers/e;->b(Lrx/i;)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, LR4/b$a;->h:Lb5/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lb5/b;->isUnsubscribed()Z

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
    iget-object p0, p0, LR4/b$a;->h:Lb5/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lb5/b;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
