.class final LI4/z$a;
.super Lkotlin/coroutines/jvm/internal/d;
.source "Share.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LI4/z;->b(Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "kotlinx.coroutines.flow.SubscribedFlowCollector"
    f = "Share.kt"
    l = {
        0x1a2,
        0x1a6
    }
    m = "onSubscription"
.end annotation


# instance fields
.field g:Ljava/lang/Object;

.field h:Ljava/lang/Object;

.field synthetic i:Ljava/lang/Object;

.field final synthetic j:LI4/z;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/z<",
            "TT;>;"
        }
    .end annotation
.end field

.field k:I


# direct methods
.method constructor <init>(LI4/z;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/z<",
            "TT;>;",
            "Ll4/d<",
            "-",
            "LI4/z$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LI4/z$a;->j:LI4/z;

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
    iput-object p1, p0, LI4/z$a;->i:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LI4/z$a;->k:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LI4/z$a;->k:I

    .line 9
    .line 10
    iget-object p1, p0, LI4/z$a;->j:LI4/z;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, LI4/z;->b(Ll4/d;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
