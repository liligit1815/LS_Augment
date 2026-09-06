.class public final LU/q;
.super LU/c;
.source "Cubic.kt"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-direct {p0, v0, v1, v0}, LU/c;-><init>([FILkotlin/jvm/internal/j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final q(LU/s;I)V
    .locals 5

    .line 1
    invoke-virtual {p0}, LU/c;->j()[F

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    aget v0, v0, p2

    .line 6
    .line 7
    invoke-virtual {p0}, LU/c;->j()[F

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    add-int/lit8 v2, p2, 0x1

    .line 12
    .line 13
    aget v1, v1, v2

    .line 14
    .line 15
    invoke-interface {p1, v0, v1}, LU/s;->a(FF)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0}, LU/c;->j()[F

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/16 v3, 0x20

    .line 24
    .line 25
    shr-long v3, v0, v3

    .line 26
    .line 27
    long-to-int v3, v3

    .line 28
    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    aput v3, p1, p2

    .line 33
    .line 34
    invoke-virtual {p0}, LU/c;->j()[F

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-wide p1, 0xffffffffL

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    and-long/2addr p1, v0

    .line 44
    long-to-int p1, p1

    .line 45
    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    aput p1, p0, v2

    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public final p(LU/s;)V
    .locals 1

    .line 1
    const-string v0, "f"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, p1, v0}, LU/q;->q(LU/s;I)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-direct {p0, p1, v0}, LU/q;->q(LU/s;I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    invoke-direct {p0, p1, v0}, LU/q;->q(LU/s;I)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x6

    .line 19
    invoke-direct {p0, p1, v0}, LU/q;->q(LU/s;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
