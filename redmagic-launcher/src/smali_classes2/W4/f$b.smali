.class LW4/f$b;
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
.field final synthetic a:Lrx/internal/schedulers/b;

.field final synthetic b:LW4/f;


# direct methods
.method constructor <init>(LW4/f;Lrx/internal/schedulers/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW4/f$b;->b:LW4/f;

    .line 2
    .line 3
    iput-object p2, p0, LW4/f$b;->a:Lrx/internal/schedulers/b;

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
    .locals 0

    .line 1
    iget-object p0, p0, LW4/f$b;->a:Lrx/internal/schedulers/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/schedulers/b;->b(LT4/a;)Lrx/i;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LT4/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LW4/f$b;->a(LT4/a;)Lrx/i;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
