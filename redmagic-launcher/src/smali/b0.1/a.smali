.class final Lb0/a;
.super Ljava/lang/Object;
.source "ColorCutQuantizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb0/a$b;
    }
.end annotation


# static fields
.field private static final f:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lb0/a$b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final a:[I

.field final b:[I

.field final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lb0/b$d;",
            ">;"
        }
    .end annotation
.end field

.field final d:[Lb0/b$c;

.field private final e:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lb0/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lb0/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lb0/a;->f:Ljava/util/Comparator;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>([II[Lb0/b$c;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Lb0/a;->e:[F

    .line 8
    .line 9
    iput-object p3, p0, Lb0/a;->d:[Lb0/b$c;

    .line 10
    .line 11
    const p3, 0x8000

    .line 12
    .line 13
    .line 14
    new-array v0, p3, [I

    .line 15
    .line 16
    iput-object v0, p0, Lb0/a;->b:[I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    move v2, v1

    .line 20
    :goto_0
    array-length v3, p1

    .line 21
    if-ge v2, v3, :cond_0

    .line 22
    .line 23
    aget v3, p1, v2

    .line 24
    .line 25
    invoke-static {v3}, Lb0/a;->g(I)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    aput v3, p1, v2

    .line 30
    .line 31
    aget v4, v0, v3

    .line 32
    .line 33
    add-int/lit8 v4, v4, 0x1

    .line 34
    .line 35
    aput v4, v0, v3

    .line 36
    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move p1, v1

    .line 41
    move v2, p1

    .line 42
    :goto_1
    if-ge p1, p3, :cond_3

    .line 43
    .line 44
    aget v3, v0, p1

    .line 45
    .line 46
    if-lez v3, :cond_1

    .line 47
    .line 48
    invoke-direct {p0, p1}, Lb0/a;->l(I)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_1

    .line 53
    .line 54
    aput v1, v0, p1

    .line 55
    .line 56
    :cond_1
    aget v3, v0, p1

    .line 57
    .line 58
    if-lez v3, :cond_2

    .line 59
    .line 60
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    new-array p1, v2, [I

    .line 66
    .line 67
    iput-object p1, p0, Lb0/a;->a:[I

    .line 68
    .line 69
    move v3, v1

    .line 70
    move v4, v3

    .line 71
    :goto_2
    if-ge v3, p3, :cond_5

    .line 72
    .line 73
    aget v5, v0, v3

    .line 74
    .line 75
    if-lez v5, :cond_4

    .line 76
    .line 77
    add-int/lit8 v5, v4, 0x1

    .line 78
    .line 79
    aput v3, p1, v4

    .line 80
    .line 81
    move v4, v5

    .line 82
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_5
    if-gt v2, p2, :cond_7

    .line 86
    .line 87
    new-instance p2, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p2, p0, Lb0/a;->c:Ljava/util/List;

    .line 93
    .line 94
    :goto_3
    if-ge v1, v2, :cond_6

    .line 95
    .line 96
    aget p2, p1, v1

    .line 97
    .line 98
    iget-object p3, p0, Lb0/a;->c:Ljava/util/List;

    .line 99
    .line 100
    new-instance v3, Lb0/b$d;

    .line 101
    .line 102
    invoke-static {p2}, Lb0/a;->a(I)I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    aget p2, v0, p2

    .line 107
    .line 108
    invoke-direct {v3, v4, p2}, Lb0/b$d;-><init>(II)V

    .line 109
    .line 110
    .line 111
    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    add-int/lit8 v1, v1, 0x1

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_6
    return-void

    .line 118
    :cond_7
    invoke-direct {p0, p2}, Lb0/a;->h(I)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lb0/a;->c:Ljava/util/List;

    .line 123
    .line 124
    return-void
.end method

.method private static a(I)I
    .locals 2

    .line 1
    invoke-static {p0}, Lb0/a;->k(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0}, Lb0/a;->j(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p0}, Lb0/a;->i(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {v0, v1, p0}, Lb0/a;->b(III)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method static b(III)I
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    const/16 v1, 0x8

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lb0/a;->f(III)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    invoke-static {p1, v0, v1}, Lb0/a;->f(III)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {p2, v0, v1}, Lb0/a;->f(III)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-static {p0, p1, p2}, Landroid/graphics/Color;->rgb(III)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private c(Ljava/util/Collection;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lb0/a$b;",
            ">;)",
            "Ljava/util/List<",
            "Lb0/b$d;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lb0/a$b;

    .line 25
    .line 26
    invoke-virtual {v1}, Lb0/a$b;->d()Lb0/b$d;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {p0, v1}, Lb0/a;->n(Lb0/b$d;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-object v0
.end method

.method static e([IIII)V
    .locals 2

    .line 1
    const/4 v0, -0x2

    .line 2
    if-eq p1, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    :goto_0
    if-gt p2, p3, :cond_2

    .line 9
    .line 10
    aget p1, p0, p2

    .line 11
    .line 12
    invoke-static {p1}, Lb0/a;->i(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    shl-int/lit8 v0, v0, 0xa

    .line 17
    .line 18
    invoke-static {p1}, Lb0/a;->j(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    shl-int/lit8 v1, v1, 0x5

    .line 23
    .line 24
    or-int/2addr v0, v1

    .line 25
    invoke-static {p1}, Lb0/a;->k(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    or-int/2addr p1, v0

    .line 30
    aput p1, p0, p2

    .line 31
    .line 32
    add-int/lit8 p2, p2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    :goto_1
    if-gt p2, p3, :cond_2

    .line 36
    .line 37
    aget p1, p0, p2

    .line 38
    .line 39
    invoke-static {p1}, Lb0/a;->j(I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    shl-int/lit8 v0, v0, 0xa

    .line 44
    .line 45
    invoke-static {p1}, Lb0/a;->k(I)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    shl-int/lit8 v1, v1, 0x5

    .line 50
    .line 51
    or-int/2addr v0, v1

    .line 52
    invoke-static {p1}, Lb0/a;->i(I)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    or-int/2addr p1, v0

    .line 57
    aput p1, p0, p2

    .line 58
    .line 59
    add-int/lit8 p2, p2, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    :goto_2
    return-void
.end method

.method private static f(III)I
    .locals 0

    .line 1
    if-le p2, p1, :cond_0

    .line 2
    .line 3
    sub-int p1, p2, p1

    .line 4
    .line 5
    shl-int/2addr p0, p1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sub-int/2addr p1, p2

    .line 8
    shr-int/2addr p0, p1

    .line 9
    :goto_0
    const/4 p1, 0x1

    .line 10
    shl-int p2, p1, p2

    .line 11
    .line 12
    sub-int/2addr p2, p1

    .line 13
    and-int/2addr p0, p2

    .line 14
    return p0
.end method

.method private static g(I)I
    .locals 4

    .line 1
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    const/4 v2, 0x5

    .line 8
    invoke-static {v0, v1, v2}, Lb0/a;->f(III)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-static {v3, v1, v2}, Lb0/a;->f(III)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {p0, v1, v2}, Lb0/a;->f(III)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    shl-int/lit8 v0, v0, 0xa

    .line 29
    .line 30
    shl-int/lit8 v1, v3, 0x5

    .line 31
    .line 32
    or-int/2addr v0, v1

    .line 33
    or-int/2addr p0, v0

    .line 34
    return p0
.end method

.method private h(I)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lb0/b$d;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/PriorityQueue;

    .line 2
    .line 3
    sget-object v1, Lb0/a;->f:Ljava/util/Comparator;

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lb0/a$b;

    .line 9
    .line 10
    iget-object v2, p0, Lb0/a;->a:[I

    .line 11
    .line 12
    array-length v2, v2

    .line 13
    add-int/lit8 v2, v2, -0x1

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-direct {v1, p0, v3, v2}, Lb0/a$b;-><init>(Lb0/a;II)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, v0, p1}, Lb0/a;->o(Ljava/util/PriorityQueue;I)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, v0}, Lb0/a;->c(Ljava/util/Collection;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method static i(I)I
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x1f

    .line 2
    .line 3
    return p0
.end method

.method static j(I)I
    .locals 0

    .line 1
    shr-int/lit8 p0, p0, 0x5

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x1f

    .line 4
    .line 5
    return p0
.end method

.method static k(I)I
    .locals 0

    .line 1
    shr-int/lit8 p0, p0, 0xa

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x1f

    .line 4
    .line 5
    return p0
.end method

.method private l(I)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lb0/a;->a(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lb0/a;->e:[F

    .line 6
    .line 7
    invoke-static {p1, v0}, LB/a;->i(I[F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lb0/a;->e:[F

    .line 11
    .line 12
    invoke-direct {p0, p1, v0}, Lb0/a;->m(I[F)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method private m(I[F)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lb0/a;->d:[Lb0/b$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    array-length v2, v0

    .line 7
    if-lez v2, :cond_1

    .line 8
    .line 9
    array-length v0, v0

    .line 10
    move v2, v1

    .line 11
    :goto_0
    if-ge v2, v0, :cond_1

    .line 12
    .line 13
    iget-object v3, p0, Lb0/a;->d:[Lb0/b$c;

    .line 14
    .line 15
    aget-object v3, v3, v2

    .line 16
    .line 17
    invoke-interface {v3, p1, p2}, Lb0/b$c;->a(I[F)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return v1
.end method

.method private n(Lb0/b$d;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lb0/b$d;->e()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lb0/b$d;->c()[F

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, v0, p1}, Lb0/a;->m(I[F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private o(Ljava/util/PriorityQueue;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/PriorityQueue<",
            "Lb0/a$b;",
            ">;I)V"
        }
    .end annotation

    .line 1
    :goto_0
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ge p0, p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lb0/a$b;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lb0/a$b;->a()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lb0/a$b;->h()Lb0/a$b;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method


# virtual methods
.method d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lb0/b$d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lb0/a;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
