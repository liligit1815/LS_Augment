.class public final LC4/c;
.super Ljava/lang/Object;
.source "Sequences.kt"

# interfaces
.implements LC4/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LC4/e<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final a:LC4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LC4/e<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final b:Z

.field private final c:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "TT;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LC4/e;ZLu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC4/e<",
            "+TT;>;Z",
            "Lu4/l<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "sequence"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "predicate"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, LC4/c;->a:LC4/e;

    .line 15
    .line 16
    iput-boolean p2, p0, LC4/c;->b:Z

    .line 17
    .line 18
    iput-object p3, p0, LC4/c;->c:Lu4/l;

    .line 19
    .line 20
    return-void
.end method

.method public static final synthetic a(LC4/c;)Lu4/l;
    .locals 0

    .line 1
    iget-object p0, p0, LC4/c;->c:Lu4/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b(LC4/c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC4/c;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic c(LC4/c;)LC4/e;
    .locals 0

    .line 1
    iget-object p0, p0, LC4/c;->a:LC4/e;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LC4/c$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LC4/c$a;-><init>(LC4/c;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
