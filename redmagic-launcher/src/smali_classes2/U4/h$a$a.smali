.class LU4/h$a$a;
.super Lrx/h;
.source "OperatorSubscribeOn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU4/h$a;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/h<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic g:Ljava/lang/Thread;

.field final synthetic h:LU4/h$a;


# direct methods
.method constructor <init>(LU4/h$a;Lrx/h;Ljava/lang/Thread;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 2
    .line 3
    iput-object p3, p0, LU4/h$a$a;->g:Ljava/lang/Thread;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lrx/h;-><init>(Lrx/h;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 2
    .line 3
    iget-object v0, v0, LU4/h$a;->g:Lrx/h;

    .line 4
    .line 5
    invoke-interface {v0}, Lrx/c;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 9
    .line 10
    iget-object p0, p0, LU4/h$a;->h:Lrx/e$a;

    .line 11
    .line 12
    invoke-interface {p0}, Lrx/i;->unsubscribe()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    iget-object p0, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 18
    .line 19
    iget-object p0, p0, LU4/h$a;->h:Lrx/e$a;

    .line 20
    .line 21
    invoke-interface {p0}, Lrx/i;->unsubscribe()V

    .line 22
    .line 23
    .line 24
    throw v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 2
    .line 3
    iget-object v0, v0, LU4/h$a;->g:Lrx/h;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lrx/c;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 9
    .line 10
    iget-object p0, p0, LU4/h$a;->h:Lrx/e$a;

    .line 11
    .line 12
    invoke-interface {p0}, Lrx/i;->unsubscribe()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    iget-object p0, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 18
    .line 19
    iget-object p0, p0, LU4/h$a;->h:Lrx/e$a;

    .line 20
    .line 21
    invoke-interface {p0}, Lrx/i;->unsubscribe()V

    .line 22
    .line 23
    .line 24
    throw p1
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 2
    .line 3
    iget-object p0, p0, LU4/h$a;->g:Lrx/h;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lrx/c;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setProducer(Lrx/d;)V
    .locals 2

    .line 1
    iget-object v0, p0, LU4/h$a$a;->h:LU4/h$a;

    .line 2
    .line 3
    iget-object v0, v0, LU4/h$a;->g:Lrx/h;

    .line 4
    .line 5
    new-instance v1, LU4/h$a$a$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, LU4/h$a$a$a;-><init>(LU4/h$a$a;Lrx/d;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/h;->setProducer(Lrx/d;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
