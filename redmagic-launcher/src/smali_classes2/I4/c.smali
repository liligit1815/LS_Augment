.class final LI4/c;
.super Ljava/lang/Object;
.source "Distinct.kt"

# interfaces
.implements LI4/d;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LI4/d<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final g:LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/d<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final h:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "TT;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LI4/d;Lu4/l;Lu4/p;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/d<",
            "+TT;>;",
            "Lu4/l<",
            "-TT;+",
            "Ljava/lang/Object;",
            ">;",
            "Lu4/p<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LI4/c;->g:LI4/d;

    .line 5
    .line 6
    iput-object p2, p0, LI4/c;->h:Lu4/l;

    .line 7
    .line 8
    iput-object p3, p0, LI4/c;->i:Lu4/p;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public collect(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-TT;>;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, Lkotlin/jvm/internal/C;

    .line 2
    .line 3
    invoke-direct {v0}, Lkotlin/jvm/internal/C;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, LJ4/s;->a:LK4/D;

    .line 7
    .line 8
    iput-object v1, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 9
    .line 10
    iget-object v1, p0, LI4/c;->g:LI4/d;

    .line 11
    .line 12
    new-instance v2, LI4/c$a;

    .line 13
    .line 14
    invoke-direct {v2, p0, v0, p1}, LI4/c$a;-><init>(LI4/c;Lkotlin/jvm/internal/C;LI4/e;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v1, v2, p2}, LI4/d;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;

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
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 29
    .line 30
    return-object p0
.end method
