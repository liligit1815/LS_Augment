.class public final Lc1/s;
.super Ljava/lang/Object;
.source "ViewCluster.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc1/s$a;,
        Lc1/s$b;
    }
.end annotation


# static fields
.field public static final l:Lc1/s$a;


# instance fields
.field private final a:Lcom/android/launcher3/CellLayout;

.field private final b:Lc1/e;

.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Landroid/graphics/Rect;

.field private final e:[I

.field private final f:[I

.field private final g:[I

.field private final h:[I

.field private i:I

.field private j:Z

.field private final k:Lc1/s$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lc1/s$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lc1/s$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lc1/s;->l:Lc1/s$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/CellLayout;Ljava/util/ArrayList;Lc1/e;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/CellLayout;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Lc1/e;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "mCellLayout"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "views"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "config"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lc1/s;->a:Lcom/android/launcher3/CellLayout;

    .line 20
    .line 21
    iput-object p3, p0, Lc1/s;->b:Lc1/e;

    .line 22
    .line 23
    new-instance p3, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p3, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 26
    .line 27
    .line 28
    iput-object p3, p0, Lc1/s;->c:Ljava/util/ArrayList;

    .line 29
    .line 30
    new-instance p2, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p2, p0, Lc1/s;->d:Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    new-array p2, p2, [I

    .line 42
    .line 43
    iput-object p2, p0, Lc1/s;->e:[I

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    new-array p2, p2, [I

    .line 50
    .line 51
    iput-object p2, p0, Lc1/s;->f:[I

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    new-array p2, p2, [I

    .line 58
    .line 59
    iput-object p2, p0, Lc1/s;->g:[I

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    new-array p1, p1, [I

    .line 66
    .line 67
    iput-object p1, p0, Lc1/s;->h:[I

    .line 68
    .line 69
    new-instance p1, Lc1/s$b;

    .line 70
    .line 71
    invoke-direct {p1, p0}, Lc1/s$b;-><init>(Lc1/s;)V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Lc1/s;->k:Lc1/s$b;

    .line 75
    .line 76
    invoke-direct {p0}, Lc1/s;->g()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private final b(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lc1/s;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/view/View;

    .line 23
    .line 24
    iget-object v3, p0, Lc1/s;->b:Lc1/e;

    .line 25
    .line 26
    iget-object v3, v3, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 27
    .line 28
    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/android/launcher3/util/C;

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_d

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/android/launcher3/util/C;

    .line 55
    .line 56
    iget v2, v1, Lcom/android/launcher3/util/C;->a:I

    .line 57
    .line 58
    iget v3, v1, Lcom/android/launcher3/util/C;->c:I

    .line 59
    .line 60
    add-int/2addr v3, v2

    .line 61
    iget v4, v1, Lcom/android/launcher3/util/C;->b:I

    .line 62
    .line 63
    iget v1, v1, Lcom/android/launcher3/util/C;->d:I

    .line 64
    .line 65
    add-int/2addr v1, v4

    .line 66
    const/4 v5, 0x1

    .line 67
    if-eq p1, v5, :cond_a

    .line 68
    .line 69
    const/4 v5, 0x2

    .line 70
    if-eq p1, v5, :cond_7

    .line 71
    .line 72
    const/4 v5, 0x4

    .line 73
    if-eq p1, v5, :cond_5

    .line 74
    .line 75
    const/16 v4, 0x8

    .line 76
    .line 77
    if-eq p1, v4, :cond_3

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    :goto_2
    if-ge v2, v3, :cond_2

    .line 81
    .line 82
    iget-object v4, p0, Lc1/s;->h:[I

    .line 83
    .line 84
    aget v5, v4, v2

    .line 85
    .line 86
    if-le v1, v5, :cond_4

    .line 87
    .line 88
    aput v1, v4, v2

    .line 89
    .line 90
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_5
    :goto_3
    if-ge v4, v1, :cond_2

    .line 94
    .line 95
    iget-object v2, p0, Lc1/s;->f:[I

    .line 96
    .line 97
    aget v5, v2, v4

    .line 98
    .line 99
    if-le v3, v5, :cond_6

    .line 100
    .line 101
    aput v3, v2, v4

    .line 102
    .line 103
    :cond_6
    add-int/lit8 v4, v4, 0x1

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_7
    :goto_4
    if-ge v2, v3, :cond_2

    .line 107
    .line 108
    iget-object v1, p0, Lc1/s;->g:[I

    .line 109
    .line 110
    aget v5, v1, v2

    .line 111
    .line 112
    if-lt v4, v5, :cond_8

    .line 113
    .line 114
    if-gez v5, :cond_9

    .line 115
    .line 116
    :cond_8
    aput v4, v1, v2

    .line 117
    .line 118
    :cond_9
    add-int/lit8 v2, v2, 0x1

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_a
    :goto_5
    if-ge v4, v1, :cond_2

    .line 122
    .line 123
    iget-object v3, p0, Lc1/s;->e:[I

    .line 124
    .line 125
    aget v5, v3, v4

    .line 126
    .line 127
    if-lt v2, v5, :cond_b

    .line 128
    .line 129
    if-gez v5, :cond_c

    .line 130
    .line 131
    :cond_b
    aput v2, v3, v4

    .line 132
    .line 133
    :cond_c
    add-int/lit8 v4, v4, 0x1

    .line 134
    .line 135
    goto :goto_5

    .line 136
    :cond_d
    return-void
.end method

.method private final c(II[II)Z
    .locals 0

    .line 1
    :goto_0
    if-ge p1, p2, :cond_1

    .line 2
    .line 3
    aget p0, p3, p1

    .line 4
    .line 5
    if-ne p0, p4, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method private final g()V
    .locals 5

    .line 1
    iget-object v0, p0, Lc1/s;->a:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    const/4 v3, -0x1

    .line 10
    if-ge v2, v0, :cond_0

    .line 11
    .line 12
    iget-object v4, p0, Lc1/s;->g:[I

    .line 13
    .line 14
    aput v3, v4, v2

    .line 15
    .line 16
    iget-object v4, p0, Lc1/s;->h:[I

    .line 17
    .line 18
    aput v3, v4, v2

    .line 19
    .line 20
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lc1/s;->a:Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    :goto_1
    if-ge v1, v0, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lc1/s;->e:[I

    .line 32
    .line 33
    aput v3, v2, v1

    .line 34
    .line 35
    iget-object v2, p0, Lc1/s;->f:[I

    .line 36
    .line 37
    aput v3, v2, v1

    .line 38
    .line 39
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/16 v0, 0xf

    .line 43
    .line 44
    iput v0, p0, Lc1/s;->i:I

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    iput-boolean v0, p0, Lc1/s;->j:Z

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "v"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lc1/s;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lc1/s;->g()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final d()Landroid/graphics/Rect;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lc1/s;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lc1/s;->b:Lc1/e;

    .line 6
    .line 7
    iget-object v1, p0, Lc1/s;->c:Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-object v2, p0, Lc1/s;->d:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Lc1/e;->d(Ljava/util/ArrayList;Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lc1/s;->d:Landroid/graphics/Rect;

    .line 15
    .line 16
    return-object p0
.end method

.method public final e()Lc1/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lc1/s;->b:Lc1/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Landroid/view/View;I)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lc1/s;->b:Lc1/e;

    .line 2
    .line 3
    iget-object v0, v0, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/android/launcher3/util/C;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    iget v1, p1, Lcom/android/launcher3/util/C;->a:I

    .line 16
    .line 17
    iget v2, p1, Lcom/android/launcher3/util/C;->c:I

    .line 18
    .line 19
    add-int/2addr v2, v1

    .line 20
    iget v3, p1, Lcom/android/launcher3/util/C;->b:I

    .line 21
    .line 22
    iget p1, p1, Lcom/android/launcher3/util/C;->d:I

    .line 23
    .line 24
    add-int/2addr p1, v3

    .line 25
    iget v4, p0, Lc1/s;->i:I

    .line 26
    .line 27
    and-int/2addr v4, p2

    .line 28
    if-ne v4, p2, :cond_1

    .line 29
    .line 30
    invoke-direct {p0, p2}, Lc1/s;->b(I)V

    .line 31
    .line 32
    .line 33
    iget v4, p0, Lc1/s;->i:I

    .line 34
    .line 35
    not-int v5, p2

    .line 36
    and-int/2addr v4, v5

    .line 37
    iput v4, p0, Lc1/s;->i:I

    .line 38
    .line 39
    :cond_1
    const/4 v4, 0x1

    .line 40
    if-eq p2, v4, :cond_5

    .line 41
    .line 42
    const/4 v4, 0x2

    .line 43
    if-eq p2, v4, :cond_4

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    if-eq p2, v4, :cond_3

    .line 47
    .line 48
    const/16 p1, 0x8

    .line 49
    .line 50
    if-eq p2, p1, :cond_2

    .line 51
    .line 52
    return v0

    .line 53
    :cond_2
    iget-object p1, p0, Lc1/s;->h:[I

    .line 54
    .line 55
    invoke-direct {p0, v1, v2, p1, v3}, Lc1/s;->c(II[II)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0

    .line 60
    :cond_3
    iget-object p2, p0, Lc1/s;->f:[I

    .line 61
    .line 62
    invoke-direct {p0, v3, p1, p2, v1}, Lc1/s;->c(II[II)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_4
    iget-object p2, p0, Lc1/s;->g:[I

    .line 68
    .line 69
    invoke-direct {p0, v1, v2, p2, p1}, Lc1/s;->c(II[II)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    return p0

    .line 74
    :cond_5
    iget-object p2, p0, Lc1/s;->e:[I

    .line 75
    .line 76
    invoke-direct {p0, v3, p1, p2, v2}, Lc1/s;->c(II[II)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    return p0
.end method

.method public final h(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lc1/s;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/view/View;

    .line 23
    .line 24
    iget-object v3, p0, Lc1/s;->b:Lc1/e;

    .line 25
    .line 26
    iget-object v3, v3, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 27
    .line 28
    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/android/launcher3/util/C;

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_6

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/android/launcher3/util/C;

    .line 55
    .line 56
    const/4 v2, 0x1

    .line 57
    if-eq p1, v2, :cond_5

    .line 58
    .line 59
    const/4 v2, 0x2

    .line 60
    if-eq p1, v2, :cond_4

    .line 61
    .line 62
    const/4 v2, 0x4

    .line 63
    if-eq p1, v2, :cond_3

    .line 64
    .line 65
    const/16 v2, 0x8

    .line 66
    .line 67
    if-eq p1, v2, :cond_2

    .line 68
    .line 69
    iget v2, v1, Lcom/android/launcher3/util/C;->b:I

    .line 70
    .line 71
    add-int/2addr v2, p2

    .line 72
    iput v2, v1, Lcom/android/launcher3/util/C;->b:I

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    iget v2, v1, Lcom/android/launcher3/util/C;->b:I

    .line 76
    .line 77
    add-int/2addr v2, p2

    .line 78
    iput v2, v1, Lcom/android/launcher3/util/C;->b:I

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    iget v2, v1, Lcom/android/launcher3/util/C;->a:I

    .line 82
    .line 83
    add-int/2addr v2, p2

    .line 84
    iput v2, v1, Lcom/android/launcher3/util/C;->a:I

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    iget v2, v1, Lcom/android/launcher3/util/C;->b:I

    .line 88
    .line 89
    sub-int/2addr v2, p2

    .line 90
    iput v2, v1, Lcom/android/launcher3/util/C;->b:I

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_5
    iget v2, v1, Lcom/android/launcher3/util/C;->a:I

    .line 94
    .line 95
    sub-int/2addr v2, p2

    .line 96
    iput v2, v1, Lcom/android/launcher3/util/C;->a:I

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_6
    invoke-direct {p0}, Lc1/s;->g()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final i(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lc1/s;->k:Lc1/s$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lc1/s$b;->b(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lc1/s;->b:Lc1/e;

    .line 7
    .line 8
    iget-object p1, p1, Lc1/e;->g:Ljava/util/ArrayList;

    .line 9
    .line 10
    iget-object p0, p0, Lc1/s;->k:Lc1/s$b;

    .line 11
    .line 12
    invoke-static {p1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
