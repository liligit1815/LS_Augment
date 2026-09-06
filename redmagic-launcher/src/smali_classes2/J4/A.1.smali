.class final LJ4/A;
.super Ljava/lang/Object;
.source "ChannelFlow.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LI4/e<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final g:Ll4/g;

.field private final h:Ljava/lang/Object;

.field private final i:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "TT;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LI4/e;Ll4/g;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
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
    iput-object p2, p0, LJ4/A;->g:Ll4/g;

    .line 5
    .line 6
    invoke-static {p2}, LK4/K;->g(Ll4/g;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, p0, LJ4/A;->h:Ljava/lang/Object;

    .line 11
    .line 12
    new-instance p2, LJ4/A$a;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p2, p1, v0}, LJ4/A$a;-><init>(LI4/e;Ll4/d;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, LJ4/A;->i:Lu4/p;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LJ4/A;->g:Ll4/g;

    .line 2
    .line 3
    iget-object v1, p0, LJ4/A;->h:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object p0, p0, LJ4/A;->i:Lu4/p;

    .line 6
    .line 7
    invoke-static {v0, p1, v1, p0, p2}, LJ4/f;->b(Ll4/g;Ljava/lang/Object;Ljava/lang/Object;Lu4/p;Ll4/d;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-ne p0, p1, :cond_0

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 19
    .line 20
    return-object p0
.end method
