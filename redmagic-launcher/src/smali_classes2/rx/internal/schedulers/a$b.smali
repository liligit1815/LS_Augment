.class final Lrx/internal/schedulers/a$b;
.super Lrx/e$a;
.source "CachedThreadScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/schedulers/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# static fields
.field static final k:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater<",
            "Lrx/internal/schedulers/a$b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Lb5/b;

.field private final h:Lrx/internal/schedulers/a$a;

.field private final i:Lrx/internal/schedulers/a$c;

.field volatile j:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Lrx/internal/schedulers/a$b;

    .line 2
    .line 3
    const-string v1, "j"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lrx/internal/schedulers/a$b;->k:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 10
    .line 11
    return-void
.end method

.method constructor <init>(Lrx/internal/schedulers/a$a;)V
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
    iput-object v0, p0, Lrx/internal/schedulers/a$b;->g:Lb5/b;

    .line 10
    .line 11
    iput-object p1, p0, Lrx/internal/schedulers/a$b;->h:Lrx/internal/schedulers/a$a;

    .line 12
    .line 13
    invoke-virtual {p1}, Lrx/internal/schedulers/a$a;->b()Lrx/internal/schedulers/a$c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lrx/internal/schedulers/a$b;->i:Lrx/internal/schedulers/a$c;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public b(LT4/a;)Lrx/i;
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, v1, v2}, Lrx/internal/schedulers/a$b;->c(LT4/a;JLjava/util/concurrent/TimeUnit;)Lrx/i;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public c(LT4/a;JLjava/util/concurrent/TimeUnit;)Lrx/i;
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/a$b;->g:Lb5/b;

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
    iget-object v0, p0, Lrx/internal/schedulers/a$b;->i:Lrx/internal/schedulers/a$c;

    .line 15
    .line 16
    new-instance v1, Lrx/internal/schedulers/a$b$a;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/a$b$a;-><init>(Lrx/internal/schedulers/a$b;LT4/a;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1, p2, p3, p4}, Lrx/internal/schedulers/d;->i(LT4/a;JLjava/util/concurrent/TimeUnit;)Lrx/internal/schedulers/e;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p2, p0, Lrx/internal/schedulers/a$b;->g:Lb5/b;

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Lb5/b;->a(Lrx/i;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lrx/internal/schedulers/a$b;->g:Lb5/b;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lrx/internal/schedulers/e;->c(Lb5/b;)V

    .line 33
    .line 34
    .line 35
    return-object p1
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/a$b;->g:Lb5/b;

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
    .locals 3

    .line 1
    sget-object v0, Lrx/internal/schedulers/a$b;->k:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lrx/internal/schedulers/a$b;->h:Lrx/internal/schedulers/a$a;

    .line 12
    .line 13
    iget-object v1, p0, Lrx/internal/schedulers/a$b;->i:Lrx/internal/schedulers/a$c;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/internal/schedulers/a$a;->d(Lrx/internal/schedulers/a$c;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lrx/internal/schedulers/a$b;->g:Lb5/b;

    .line 19
    .line 20
    invoke-virtual {p0}, Lb5/b;->unsubscribe()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
