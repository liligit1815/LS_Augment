.class public LK4/z;
.super LF4/a;
.source "Scopes.kt"

# interfaces
.implements Lkotlin/coroutines/jvm/internal/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "LF4/a<",
        "TT;>;",
        "Lkotlin/coroutines/jvm/internal/e;"
    }
.end annotation


# instance fields
.field public final j:Ll4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll4/d<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll4/g;Ll4/d;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g;",
            "Ll4/d<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0, v0}, LF4/a;-><init>(Ll4/g;ZZ)V

    .line 3
    .line 4
    .line 5
    iput-object p2, p0, LK4/z;->j:Ll4/d;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method protected L0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, LK4/z;->j:Ll4/d;

    .line 2
    .line 3
    invoke-static {p1, p0}, LF4/x;->a(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final getCallerFrame()Lkotlin/coroutines/jvm/internal/e;
    .locals 1

    .line 1
    iget-object p0, p0, LK4/z;->j:Ll4/d;

    .line 2
    .line 3
    instance-of v0, p0, Lkotlin/coroutines/jvm/internal/e;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lkotlin/coroutines/jvm/internal/e;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method protected final l0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected x(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LK4/z;->j:Ll4/d;

    .line 2
    .line 3
    invoke-static {v0}, Lm4/b;->c(Ll4/d;)Ll4/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, LK4/z;->j:Ll4/d;

    .line 8
    .line 9
    invoke-static {p1, p0}, LF4/x;->a(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {v0, p0}, LK4/i;->b(Ll4/d;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
