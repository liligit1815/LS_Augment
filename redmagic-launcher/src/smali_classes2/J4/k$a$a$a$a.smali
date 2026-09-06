.class final LJ4/k$a$a$a$a;
.super Lkotlin/coroutines/jvm/internal/d;
.source "Combine.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LJ4/k$a$a$a;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "kotlinx.coroutines.flow.internal.CombineKt$combineInternal$2$1$1"
    f = "Combine.kt"
    l = {
        0x1d,
        0x1e
    }
    m = "emit"
.end annotation


# instance fields
.field synthetic g:Ljava/lang/Object;

.field final synthetic h:LJ4/k$a$a$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LJ4/k$a$a$a<",
            "TT;>;"
        }
    .end annotation
.end field

.field i:I


# direct methods
.method constructor <init>(LJ4/k$a$a$a;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LJ4/k$a$a$a<",
            "-TT;>;",
            "Ll4/d<",
            "-",
            "LJ4/k$a$a$a$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LJ4/k$a$a$a$a;->h:LJ4/k$a$a$a;

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
    iput-object p1, p0, LJ4/k$a$a$a$a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LJ4/k$a$a$a$a;->i:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LJ4/k$a$a$a$a;->i:I

    .line 9
    .line 10
    iget-object p1, p0, LJ4/k$a$a$a$a;->h:LJ4/k$a$a$a;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, LJ4/k$a$a$a;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
