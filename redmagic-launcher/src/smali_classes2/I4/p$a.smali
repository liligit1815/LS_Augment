.class public final LI4/p$a;
.super Ljava/lang/Object;
.source "Limit.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LI4/p;->a(LI4/d;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI4/e<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic g:Lkotlin/jvm/internal/C;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/C;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI4/p$a;->g:Lkotlin/jvm/internal/C;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
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
    iget-object p2, p0, LI4/p$a;->g:Lkotlin/jvm/internal/C;

    .line 2
    .line 3
    iput-object p1, p2, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 4
    .line 5
    new-instance p1, LJ4/a;

    .line 6
    .line 7
    invoke-direct {p1, p0}, LJ4/a;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    throw p1
.end method
