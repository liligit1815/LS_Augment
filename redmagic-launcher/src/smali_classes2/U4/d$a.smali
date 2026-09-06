.class LU4/d$a;
.super Lrx/h;
.source "OnSubscribeSingle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU4/d;->a(Lrx/g;)V
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
.field private g:Z

.field private h:Z

.field private i:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final synthetic j:Lrx/g;

.field final synthetic k:LU4/d;


# direct methods
.method constructor <init>(LU4/d;Lrx/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU4/d$a;->k:LU4/d;

    .line 2
    .line 3
    iput-object p2, p0, LU4/d$a;->j:Lrx/g;

    .line 4
    .line 5
    invoke-direct {p0}, Lrx/h;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, LU4/d$a;->g:Z

    .line 10
    .line 11
    iput-boolean p1, p0, LU4/d$a;->h:Z

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, LU4/d$a;->i:Ljava/lang/Object;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LU4/d$a;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, LU4/d$a;->h:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, LU4/d$a;->j:Lrx/g;

    .line 11
    .line 12
    iget-object p0, p0, LU4/d$a;->i:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lrx/g;->c(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object p0, p0, LU4/d$a;->j:Lrx/g;

    .line 19
    .line 20
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 21
    .line 22
    const-string v1, "Observable emitted no items"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lrx/g;->b(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, LU4/d$a;->j:Lrx/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lrx/g;->b(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lrx/h;->unsubscribe()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, LU4/d$a;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, LU4/d$a;->g:Z

    .line 7
    .line 8
    iget-object p1, p0, LU4/d$a;->j:Lrx/g;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 11
    .line 12
    const-string v1, "Observable emitted too many elements"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lrx/g;->b(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lrx/h;->unsubscribe()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iput-boolean v1, p0, LU4/d$a;->h:Z

    .line 25
    .line 26
    iput-object p1, p0, LU4/d$a;->i:Ljava/lang/Object;

    .line 27
    .line 28
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x2

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lrx/h;->request(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
