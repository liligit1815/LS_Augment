.class public final Lokio/r;
.super Li4/b;
.source "Options.kt"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokio/r$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Li4/b<",
        "Lokio/h;",
        ">;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# static fields
.field public static final j:Lokio/r$a;


# instance fields
.field private final h:[Lokio/h;

.field private final i:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lokio/r$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lokio/r$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lokio/r;->j:Lokio/r$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>([Lokio/h;[I)V
    .locals 0

    .line 2
    invoke-direct {p0}, Li4/b;-><init>()V

    .line 3
    iput-object p1, p0, Lokio/r;->h:[Lokio/h;

    .line 4
    iput-object p2, p0, Lokio/r;->i:[I

    return-void
.end method

.method public synthetic constructor <init>([Lokio/h;[ILkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lokio/r;-><init>([Lokio/h;[I)V

    return-void
.end method

.method public static final varargs q([Lokio/h;)Lokio/r;
    .locals 1

    .line 1
    sget-object v0, Lokio/r;->j:Lokio/r$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lokio/r$a;->d([Lokio/h;)Lokio/r;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public final bridge contains(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lokio/h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    check-cast p1, Lokio/h;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lokio/r;->g(Lokio/h;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/r;->h:[Lokio/h;

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public bridge g(Lokio/h;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Li4/a;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lokio/r;->j(I)Lokio/h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .locals 1

    .line 1
    instance-of v0, p1, Lokio/h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    check-cast p1, Lokio/h;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lokio/r;->o(Lokio/h;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public j(I)Lokio/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/r;->h:[Lokio/h;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .locals 1

    .line 1
    instance-of v0, p1, Lokio/h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    check-cast p1, Lokio/h;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lokio/r;->p(Lokio/h;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final m()[Lokio/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/r;->h:[Lokio/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/r;->i:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge o(Lokio/h;)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Li4/b;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge p(Lokio/h;)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Li4/b;->lastIndexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
