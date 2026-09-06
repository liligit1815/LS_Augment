.class LW4/f$c;
.super Ljava/lang/Object;
.source "ScalarSynchronousObservable.java"

# interfaces
.implements LT4/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW4/f;->p(Lrx/e;)Lrx/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LT4/c<",
        "LT4/a;",
        "Lrx/i;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lrx/e;

.field final synthetic b:LW4/f;


# direct methods
.method constructor <init>(LW4/f;Lrx/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW4/f$c;->b:LW4/f;

    .line 2
    .line 3
    iput-object p2, p0, LW4/f$c;->a:Lrx/e;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(LT4/a;)Lrx/i;
    .locals 2

    .line 1
    iget-object v0, p0, LW4/f$c;->a:Lrx/e;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/e;->a()Lrx/e$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, LW4/f$c$a;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, v0}, LW4/f$c$a;-><init>(LW4/f$c;LT4/a;Lrx/e$a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/e$a;->b(LT4/a;)Lrx/i;

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LT4/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LW4/f$c;->a(LT4/a;)Lrx/i;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
