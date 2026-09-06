.class Lrx/internal/schedulers/a$b$a;
.super Ljava/lang/Object;
.source "CachedThreadScheduler.java"

# interfaces
.implements LT4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/schedulers/a$b;->c(LT4/a;JLjava/util/concurrent/TimeUnit;)Lrx/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LT4/a;

.field final synthetic h:Lrx/internal/schedulers/a$b;


# direct methods
.method constructor <init>(Lrx/internal/schedulers/a$b;LT4/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/schedulers/a$b$a;->h:Lrx/internal/schedulers/a$b;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/schedulers/a$b$a;->g:LT4/a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/a$b$a;->h:Lrx/internal/schedulers/a$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/internal/schedulers/a$b;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lrx/internal/schedulers/a$b$a;->g:LT4/a;

    .line 11
    .line 12
    invoke-interface {p0}, LT4/a;->call()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
