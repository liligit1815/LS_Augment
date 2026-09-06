.class final LH4/e$e;
.super Lkotlin/coroutines/jvm/internal/d;
.source "BufferedChannel.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LH4/e;->L0(LH4/e;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lkotlin/coroutines/jvm/internal/d;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "kotlinx.coroutines.channels.BufferedChannel"
    f = "BufferedChannel.kt"
    l = {
        0x2f7
    }
    m = "receiveCatching-JP2dKIU$suspendImpl"
.end annotation


# instance fields
.field synthetic g:Ljava/lang/Object;

.field final synthetic h:LH4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LH4/e<",
            "TE;>;"
        }
    .end annotation
.end field

.field i:I


# direct methods
.method constructor <init>(LH4/e;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/e<",
            "TE;>;",
            "Ll4/d<",
            "-",
            "LH4/e$e;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LH4/e$e;->h:LH4/e;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/d;-><init>(Ll4/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, LH4/e$e;->g:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LH4/e$e;->i:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LH4/e$e;->i:I

    .line 9
    .line 10
    iget-object p1, p0, LH4/e$e;->h:LH4/e;

    .line 11
    .line 12
    invoke-static {p1, p0}, LH4/e;->L0(LH4/e;Ll4/d;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-ne p0, p1, :cond_0

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-static {p0}, LH4/k;->b(Ljava/lang/Object;)LH4/k;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
