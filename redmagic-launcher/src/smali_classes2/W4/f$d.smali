.class final LW4/f$d;
.super Ljava/lang/Object;
.source "ScalarSynchronousObservable.java"

# interfaces
.implements Lrx/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LW4/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/b$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final b:LT4/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LT4/c<",
            "LT4/a;",
            "Lrx/i;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;LT4/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "LT4/c<",
            "LT4/a;",
            "Lrx/i;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LW4/f$d;->a:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, LW4/f$d;->b:LT4/c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lrx/h;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, LW4/f$e;

    .line 2
    .line 3
    iget-object v1, p0, LW4/f$d;->a:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object p0, p0, LW4/f$d;->b:LT4/c;

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, p0}, LW4/f$e;-><init>(Lrx/h;Ljava/lang/Object;LT4/c;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/h;->setProducer(Lrx/d;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LW4/f$d;->a(Lrx/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
