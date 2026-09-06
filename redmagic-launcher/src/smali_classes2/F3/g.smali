.class public final LF3/g;
.super Ljava/lang/Object;
.source "WireFormatNano.java"


# static fields
.field public static final a:[I

.field public static final b:[J

.field public static final c:[F

.field public static final d:[D

.field public static final e:[Z

.field public static final f:[Ljava/lang/String;

.field public static final g:[[B

.field public static final h:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    sput-object v1, LF3/g;->a:[I

    .line 5
    .line 6
    new-array v1, v0, [J

    .line 7
    .line 8
    sput-object v1, LF3/g;->b:[J

    .line 9
    .line 10
    new-array v1, v0, [F

    .line 11
    .line 12
    sput-object v1, LF3/g;->c:[F

    .line 13
    .line 14
    new-array v1, v0, [D

    .line 15
    .line 16
    sput-object v1, LF3/g;->d:[D

    .line 17
    .line 18
    new-array v1, v0, [Z

    .line 19
    .line 20
    sput-object v1, LF3/g;->e:[Z

    .line 21
    .line 22
    new-array v1, v0, [Ljava/lang/String;

    .line 23
    .line 24
    sput-object v1, LF3/g;->f:[Ljava/lang/String;

    .line 25
    .line 26
    new-array v1, v0, [[B

    .line 27
    .line 28
    sput-object v1, LF3/g;->g:[[B

    .line 29
    .line 30
    new-array v0, v0, [B

    .line 31
    .line 32
    sput-object v0, LF3/g;->h:[B

    .line 33
    .line 34
    return-void
.end method

.method public static final a(LF3/a;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LF3/a;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1}, LF3/a;->w(I)Z

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    :goto_0
    invoke-virtual {p0}, LF3/a;->t()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ne v2, p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, LF3/a;->w(I)Z

    .line 16
    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p0, v0}, LF3/a;->v(I)V

    .line 22
    .line 23
    .line 24
    return v1
.end method

.method public static b(I)I
    .locals 0

    .line 1
    ushr-int/lit8 p0, p0, 0x3

    .line 2
    .line 3
    return p0
.end method

.method static c(I)I
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x7

    .line 2
    .line 3
    return p0
.end method

.method static d(II)I
    .locals 0

    .line 1
    shl-int/lit8 p0, p0, 0x3

    .line 2
    .line 3
    or-int/2addr p0, p1

    .line 4
    return p0
.end method

.method public static e(LF3/a;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, LF3/a;->w(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
