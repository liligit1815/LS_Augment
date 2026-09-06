.class public final Lj0/a$b$b$a$a;
.super Lkotlin/coroutines/jvm/internal/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lj0/a$b$b$a;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "androidx.slidingpanelayout.widget.FoldingFeatureObserver$registerLayoutStateChangeCallback$1$invokeSuspend$$inlined$mapNotNull$1$2"
    f = "FoldingFeatureObserver.kt"
    l = {
        0x8a
    }
    m = "emit"
.end annotation


# instance fields
.field synthetic g:Ljava/lang/Object;

.field h:I

.field final synthetic i:Lj0/a$b$b$a;


# direct methods
.method public constructor <init>(Lj0/a$b$b$a;Ll4/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj0/a$b$b$a$a;->i:Lj0/a$b$b$a;

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
    iput-object p1, p0, Lj0/a$b$b$a$a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, Lj0/a$b$b$a$a;->h:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lj0/a$b$b$a$a;->h:I

    .line 9
    .line 10
    iget-object p1, p0, Lj0/a$b$b$a$a;->i:Lj0/a$b$b$a;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, Lj0/a$b$b$a;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
