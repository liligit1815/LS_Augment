.class final synthetic LH4/e$c;
.super Lkotlin/jvm/internal/m;
.source "BufferedChannel.kt"

# interfaces
.implements Lu4/q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LH4/e;->D(Lu4/l;)LB4/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/m;",
        "Lu4/q<",
        "Ljava/lang/Throwable;",
        "TE;",
        "Ll4/g;",
        "Lh4/t;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 7

    .line 1
    const-string v5, "onCancellationImplDoNotCall(Ljava/lang/Throwable;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)V"

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v1, 0x3

    .line 5
    const-class v3, LH4/e;

    .line 6
    .line 7
    const-string v4, "onCancellationImplDoNotCall"

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v2, p1

    .line 11
    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/m;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "TE;",
            "Ll4/g;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lkotlin/jvm/internal/f;->receiver:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, LH4/e;

    .line 4
    .line 5
    invoke-static {p0, p1, p2, p3}, LH4/e;->v(LH4/e;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    check-cast p3, Ll4/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, LH4/e$c;->b(Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 9
    .line 10
    return-object p0
.end method
