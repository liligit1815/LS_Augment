.class public final LU4/h;
.super Ljava/lang/Object;
.source "OperatorSubscribeOn.java"

# interfaces
.implements Lrx/b$a;


# annotations
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
.field final a:Lrx/e;

.field final b:Lrx/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/b;Lrx/e;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/b<",
            "TT;>;",
            "Lrx/e;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, LU4/h;->a:Lrx/e;

    .line 5
    .line 6
    iput-object p1, p0, LU4/h;->b:Lrx/b;

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
    iget-object v0, p0, LU4/h;->a:Lrx/e;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/e;->a()Lrx/e$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Lrx/h;->add(Lrx/i;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, LU4/h$a;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, v0}, LU4/h$a;-><init>(LU4/h;Lrx/h;Lrx/e$a;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/e$a;->b(LT4/a;)Lrx/i;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU4/h;->a(Lrx/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
