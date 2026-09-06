.class public abstract LF4/E;
.super Ll4/a;
.source "CoroutineDispatcher.kt"

# interfaces
.implements Ll4/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LF4/E$a;
    }
.end annotation


# static fields
.field public static final h:LF4/E$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LF4/E$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LF4/E$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LF4/E;->h:LF4/E$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Ll4/e;->f:Ll4/e$b;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll4/a;-><init>(Ll4/g$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(LF4/E;ILjava/lang/String;ILjava/lang/Object;)LF4/E;
    .locals 0

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    and-int/lit8 p3, p3, 0x2

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, LF4/E;->d0(ILjava/lang/String;)LF4/E;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 14
    .line 15
    const-string p1, "Super calls with default arguments not supported in this target, function: limitedParallelism"

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p0
.end method


# virtual methods
.method public E(Ll4/g$c;)Ll4/g;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g$c<",
            "*>;)",
            "Ll4/g;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll4/e$a;->b(Ll4/e;Ll4/g$c;)Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final I(Ll4/d;)Ll4/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll4/d<",
            "-TT;>;)",
            "Ll4/d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LK4/h;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, LK4/h;-><init>(LF4/E;Ll4/d;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public abstract a0(Ll4/g;Ljava/lang/Runnable;)V
.end method

.method public b(Ll4/g$c;)Ll4/g$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ll4/g$b;",
            ">(",
            "Ll4/g$c<",
            "TE;>;)TE;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll4/e$a;->a(Ll4/e;Ll4/g$c;)Ll4/g$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b0(Ll4/g;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, LF4/E;->a0(Ll4/g;Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c0(Ll4/g;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public d0(ILjava/lang/String;)LF4/E;
    .locals 1

    .line 1
    invoke-static {p1}, LK4/l;->a(I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, LK4/k;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2}, LK4/k;-><init>(LF4/E;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public final g(Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "*>;)V"
        }
    .end annotation

    .line 1
    const-string p0, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<*>"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    check-cast p1, LK4/h;

    .line 7
    .line 8
    invoke-virtual {p1}, LK4/h;->t()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, LF4/M;->a(Ljava/lang/Object;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 v1, 0x40

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, LF4/M;->b(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
