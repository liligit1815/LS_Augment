.class LU4/g$b$a;
.super Lrx/h;
.source "OperatorOnErrorResumeNextViaFunction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU4/g$b;->onError(Ljava/lang/Throwable;)V
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
.field final synthetic g:LU4/g$b;


# direct methods
.method constructor <init>(LU4/g$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU4/g$b$a;->g:LU4/g$b;

    .line 2
    .line 3
    invoke-direct {p0}, Lrx/h;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, LU4/g$b$a;->g:LU4/g$b;

    .line 2
    .line 3
    iget-object p0, p0, LU4/g$b;->i:Lrx/h;

    .line 4
    .line 5
    invoke-interface {p0}, Lrx/c;->onCompleted()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, LU4/g$b$a;->g:LU4/g$b;

    .line 2
    .line 3
    iget-object p0, p0, LU4/g$b;->i:Lrx/h;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lrx/c;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LU4/g$b$a;->g:LU4/g$b;

    .line 2
    .line 3
    iget-object p0, p0, LU4/g$b;->i:Lrx/h;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lrx/c;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setProducer(Lrx/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, LU4/g$b$a;->g:LU4/g$b;

    .line 2
    .line 3
    iget-object p0, p0, LU4/g$b;->j:LV4/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, LV4/a;->c(Lrx/d;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
