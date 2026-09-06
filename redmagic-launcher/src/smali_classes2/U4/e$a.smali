.class final LU4/e$a;
.super Lrx/h;
.source "OperatorMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LU4/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/h<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final g:Lrx/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/h<",
            "-TR;>;"
        }
    .end annotation
.end field

.field final h:LT4/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LT4/c<",
            "-TT;+TR;>;"
        }
    .end annotation
.end field

.field i:Z


# direct methods
.method public constructor <init>(Lrx/h;LT4/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TR;>;",
            "LT4/c<",
            "-TT;+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lrx/h;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU4/e$a;->g:Lrx/h;

    .line 5
    .line 6
    iput-object p2, p0, LU4/e$a;->h:LT4/c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, LU4/e$a;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, LU4/e$a;->g:Lrx/h;

    .line 7
    .line 8
    invoke-interface {p0}, Lrx/c;->onCompleted()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, LU4/e$a;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, LU4/e$a;->i:Z

    .line 11
    .line 12
    iget-object p0, p0, LU4/e$a;->g:Lrx/h;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Lrx/c;->onError(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, LU4/e$a;->h:LT4/c;

    .line 2
    .line 3
    invoke-interface {v0, p1}, LT4/c;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    iget-object p0, p0, LU4/e$a;->g:Lrx/h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Lrx/c;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    invoke-static {v0}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lrx/h;->unsubscribe()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, p1}, LS4/g;->a(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, LU4/e$a;->onError(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setProducer(Lrx/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, LU4/e$a;->g:Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/h;->setProducer(Lrx/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
