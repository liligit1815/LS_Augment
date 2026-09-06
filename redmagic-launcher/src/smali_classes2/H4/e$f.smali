.class final LH4/e$f;
.super Lkotlin/coroutines/jvm/internal/d;
.source "BufferedChannel.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LH4/e;->M0(LH4/m;IJLl4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "kotlinx.coroutines.channels.BufferedChannel"
    f = "BufferedChannel.kt"
    l = {
        0xc2d
    }
    m = "receiveCatchingOnNoWaiterSuspend-GKJJFZk"
.end annotation


# instance fields
.field g:Ljava/lang/Object;

.field h:Ljava/lang/Object;

.field i:I

.field j:J

.field synthetic k:Ljava/lang/Object;

.field final synthetic l:LH4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LH4/e<",
            "TE;>;"
        }
    .end annotation
.end field

.field m:I


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
            "LH4/e$f;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LH4/e$f;->l:LH4/e;

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
    .locals 6

    .line 1
    iput-object p1, p0, LH4/e$f;->k:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LH4/e$f;->m:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LH4/e$f;->m:I

    .line 9
    .line 10
    iget-object v0, p0, LH4/e$f;->l:LH4/e;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const-wide/16 v3, 0x0

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    move-object v5, p0

    .line 17
    invoke-static/range {v0 .. v5}, LH4/e;->A(LH4/e;LH4/m;IJLl4/d;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-ne p0, p1, :cond_0

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-static {p0}, LH4/k;->b(Ljava/lang/Object;)LH4/k;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
