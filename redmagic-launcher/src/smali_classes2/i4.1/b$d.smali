.class final Li4/b$d;
.super Li4/b;
.source "AbstractList.kt"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Li4/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Li4/b<",
        "TE;>;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# instance fields
.field private final h:Li4/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Li4/b<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final i:I

.field private j:I


# direct methods
.method public constructor <init>(Li4/b;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Li4/b<",
            "+TE;>;II)V"
        }
    .end annotation

    .line 1
    const-string v0, "list"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Li4/b;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Li4/b$d;->h:Li4/b;

    .line 10
    .line 11
    iput p2, p0, Li4/b$d;->i:I

    .line 12
    .line 13
    sget-object v0, Li4/b;->g:Li4/b$a;

    .line 14
    .line 15
    invoke-virtual {p1}, Li4/a;->size()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {v0, p2, p3, p1}, Li4/b$a;->d(III)V

    .line 20
    .line 21
    .line 22
    sub-int/2addr p3, p2

    .line 23
    iput p3, p0, Li4/b$d;->j:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Li4/b$d;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public get(I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    sget-object v0, Li4/b;->g:Li4/b$a;

    .line 2
    .line 3
    iget v1, p0, Li4/b$d;->j:I

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Li4/b$a;->b(II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Li4/b$d;->h:Li4/b;

    .line 9
    .line 10
    iget p0, p0, Li4/b$d;->i:I

    .line 11
    .line 12
    add-int/2addr p0, p1

    .line 13
    invoke-virtual {v0, p0}, Li4/b;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
