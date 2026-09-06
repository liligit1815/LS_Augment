.class final LI4/v$a;
.super Lkotlin/coroutines/jvm/internal/d;
.source "StateFlow.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LI4/v;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "kotlinx.coroutines.flow.StateFlowImpl"
    f = "StateFlow.kt"
    l = {
        0x185,
        0x191,
        0x196
    }
    m = "collect"
.end annotation


# instance fields
.field g:Ljava/lang/Object;

.field h:Ljava/lang/Object;

.field i:Ljava/lang/Object;

.field j:Ljava/lang/Object;

.field k:Ljava/lang/Object;

.field synthetic l:Ljava/lang/Object;

.field final synthetic m:LI4/v;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/v<",
            "TT;>;"
        }
    .end annotation
.end field

.field n:I


# direct methods
.method constructor <init>(LI4/v;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/v<",
            "TT;>;",
            "Ll4/d<",
            "-",
            "LI4/v$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LI4/v$a;->m:LI4/v;

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
    iput-object p1, p0, LI4/v$a;->l:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LI4/v$a;->n:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LI4/v$a;->n:I

    .line 9
    .line 10
    iget-object p1, p0, LI4/v$a;->m:LI4/v;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, LI4/v;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
