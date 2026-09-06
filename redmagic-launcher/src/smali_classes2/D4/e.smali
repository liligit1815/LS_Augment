.class final LD4/e;
.super Ljava/lang/Object;
.source "Strings.kt"

# interfaces
.implements LC4/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LC4/e<",
        "LA4/c;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/CharSequence;

.field private final b:I

.field private final c:I

.field private final d:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Integer;",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;IILu4/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "II",
            "Lu4/p<",
            "-",
            "Ljava/lang/CharSequence;",
            "-",
            "Ljava/lang/Integer;",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "input"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "getNextMatch"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, LD4/e;->a:Ljava/lang/CharSequence;

    .line 15
    .line 16
    iput p2, p0, LD4/e;->b:I

    .line 17
    .line 18
    iput p3, p0, LD4/e;->c:I

    .line 19
    .line 20
    iput-object p4, p0, LD4/e;->d:Lu4/p;

    .line 21
    .line 22
    return-void
.end method

.method public static final synthetic a(LD4/e;)Lu4/p;
    .locals 0

    .line 1
    iget-object p0, p0, LD4/e;->d:Lu4/p;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b(LD4/e;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, LD4/e;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(LD4/e;)I
    .locals 0

    .line 1
    iget p0, p0, LD4/e;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic d(LD4/e;)I
    .locals 0

    .line 1
    iget p0, p0, LD4/e;->b:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "LA4/c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, LD4/e$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LD4/e$a;-><init>(LD4/e;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
