.class final LJ4/z;
.super Ljava/lang/Object;
.source "ChannelFlow.kt"

# interfaces
.implements Ll4/d;
.implements Lkotlin/coroutines/jvm/internal/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll4/d<",
        "TT;>;",
        "Lkotlin/coroutines/jvm/internal/e;"
    }
.end annotation


# instance fields
.field private final g:Ll4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll4/d<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final h:Ll4/g;


# direct methods
.method public constructor <init>(Ll4/d;Ll4/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-TT;>;",
            "Ll4/g;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ4/z;->g:Ll4/d;

    .line 5
    .line 6
    iput-object p2, p0, LJ4/z;->h:Ll4/g;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getCallerFrame()Lkotlin/coroutines/jvm/internal/e;
    .locals 1

    .line 1
    iget-object p0, p0, LJ4/z;->g:Ll4/d;

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

.method public getContext()Ll4/g;
    .locals 0

    .line 1
    iget-object p0, p0, LJ4/z;->h:Ll4/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ4/z;->g:Ll4/d;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
