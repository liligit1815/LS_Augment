.class public final LJ4/y;
.super Ljava/lang/Object;
.source "SendingCollector.kt"

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
.field private final g:LH4/x;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LH4/x<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LH4/x;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/x<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ4/y;->g:LH4/x;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0
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
    iget-object p0, p0, LJ4/y;->g:LH4/x;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, LH4/x;->p(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 15
    .line 16
    return-object p0
.end method
