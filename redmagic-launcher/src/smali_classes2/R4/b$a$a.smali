.class LR4/b$a$a;
.super Ljava/lang/Object;
.source "HandlerScheduler.java"

# interfaces
.implements LT4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LR4/b$a;->c(LT4/a;JLjava/util/concurrent/TimeUnit;)Lrx/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lrx/internal/schedulers/e;

.field final synthetic h:LR4/b$a;


# direct methods
.method constructor <init>(LR4/b$a;Lrx/internal/schedulers/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, LR4/b$a$a;->h:LR4/b$a;

    .line 2
    .line 3
    iput-object p2, p0, LR4/b$a$a;->g:Lrx/internal/schedulers/e;

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
    iget-object v0, p0, LR4/b$a$a;->h:LR4/b$a;

    .line 2
    .line 3
    invoke-static {v0}, LR4/b$a;->e(LR4/b$a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, LR4/b$a$a;->g:Lrx/internal/schedulers/e;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
