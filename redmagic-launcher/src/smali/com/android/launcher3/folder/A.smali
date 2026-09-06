.class public Lcom/android/launcher3/folder/A;
.super Ljava/lang/Object;
.source "FolderGridOrganizer.java"


# instance fields
.field private final a:Landroid/graphics/Point;

.field private final b:I

.field private final c:I

.field private final d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:Z


# direct methods
.method public constructor <init>(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Point;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/folder/A;->a:Landroid/graphics/Point;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/folder/A;->h:Z

    .line 13
    .line 14
    iput p1, p0, Lcom/android/launcher3/folder/A;->b:I

    .line 15
    .line 16
    iput p2, p0, Lcom/android/launcher3/folder/A;->c:I

    .line 17
    .line 18
    mul-int/2addr p1, p2

    .line 19
    iput p1, p0, Lcom/android/launcher3/folder/A;->d:I

    .line 20
    .line 21
    return-void
.end method

.method private a(I)V
    .locals 6

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/A;->f:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/folder/A;->g:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/folder/A;->d:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x1

    .line 9
    if-lt p1, v2, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/android/launcher3/folder/A;->b:I

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/folder/A;->c:I

    .line 14
    .line 15
    move v2, v4

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v2, v3

    .line 18
    :goto_0
    sget-object v5, Lf1/a;->D:Lf1/a$a;

    .line 19
    .line 20
    invoke-virtual {v5}, Lf1/a$a;->c()Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-eqz v5, :cond_2

    .line 25
    .line 26
    if-nez v2, :cond_2

    .line 27
    .line 28
    iget p1, p0, Lcom/android/launcher3/folder/A;->f:I

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget p1, p0, Lcom/android/launcher3/folder/A;->b:I

    .line 33
    .line 34
    :cond_1
    iget v0, p0, Lcom/android/launcher3/folder/A;->g:I

    .line 35
    .line 36
    if-nez v0, :cond_c

    .line 37
    .line 38
    iget v0, p0, Lcom/android/launcher3/folder/A;->c:I

    .line 39
    .line 40
    goto/16 :goto_7

    .line 41
    .line 42
    :cond_2
    :goto_1
    if-nez v2, :cond_b

    .line 43
    .line 44
    mul-int v2, v0, v1

    .line 45
    .line 46
    if-ge v2, p1, :cond_6

    .line 47
    .line 48
    if-le v0, v1, :cond_3

    .line 49
    .line 50
    iget v2, p0, Lcom/android/launcher3/folder/A;->c:I

    .line 51
    .line 52
    if-ne v1, v2, :cond_4

    .line 53
    .line 54
    :cond_3
    iget v2, p0, Lcom/android/launcher3/folder/A;->b:I

    .line 55
    .line 56
    if-ge v0, v2, :cond_4

    .line 57
    .line 58
    add-int/lit8 v2, v0, 0x1

    .line 59
    .line 60
    move v5, v2

    .line 61
    :goto_2
    move v2, v1

    .line 62
    goto :goto_3

    .line 63
    :cond_4
    iget v2, p0, Lcom/android/launcher3/folder/A;->c:I

    .line 64
    .line 65
    if-ge v1, v2, :cond_5

    .line 66
    .line 67
    add-int/lit8 v2, v1, 0x1

    .line 68
    .line 69
    move v5, v0

    .line 70
    goto :goto_3

    .line 71
    :cond_5
    move v5, v0

    .line 72
    goto :goto_2

    .line 73
    :goto_3
    if-nez v2, :cond_9

    .line 74
    .line 75
    add-int/lit8 v2, v2, 0x1

    .line 76
    .line 77
    goto :goto_5

    .line 78
    :cond_6
    add-int/lit8 v2, v1, -0x1

    .line 79
    .line 80
    mul-int v5, v2, v0

    .line 81
    .line 82
    if-lt v5, p1, :cond_7

    .line 83
    .line 84
    if-lt v1, v0, :cond_7

    .line 85
    .line 86
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    move v5, v0

    .line 91
    goto :goto_5

    .line 92
    :cond_7
    add-int/lit8 v2, v0, -0x1

    .line 93
    .line 94
    mul-int v5, v2, v1

    .line 95
    .line 96
    if-lt v5, p1, :cond_8

    .line 97
    .line 98
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    move v5, v2

    .line 103
    :goto_4
    move v2, v1

    .line 104
    goto :goto_5

    .line 105
    :cond_8
    move v5, v0

    .line 106
    goto :goto_4

    .line 107
    :cond_9
    :goto_5
    if-ne v5, v0, :cond_a

    .line 108
    .line 109
    if-ne v2, v1, :cond_a

    .line 110
    .line 111
    move v0, v4

    .line 112
    goto :goto_6

    .line 113
    :cond_a
    move v0, v3

    .line 114
    :goto_6
    move v1, v2

    .line 115
    move v2, v0

    .line 116
    move v0, v5

    .line 117
    goto :goto_1

    .line 118
    :cond_b
    move p1, v0

    .line 119
    move v0, v1

    .line 120
    :cond_c
    :goto_7
    iput p1, p0, Lcom/android/launcher3/folder/A;->f:I

    .line 121
    .line 122
    iput v0, p0, Lcom/android/launcher3/folder/A;->g:I

    .line 123
    .line 124
    return-void
.end method

.method public static b(Lcom/android/launcher3/h0;)Lcom/android/launcher3/folder/A;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/A;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/h0;->M1:I

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/h0;->L1:I

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/folder/A;-><init>(II)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/A;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/A;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/A;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/A;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public g(I)Landroid/graphics/Point;
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/A;->d:I

    .line 2
    .line 3
    rem-int/2addr p1, v0

    .line 4
    iget-object v0, p0, Lcom/android/launcher3/folder/A;->a:Landroid/graphics/Point;

    .line 5
    .line 6
    iget p0, p0, Lcom/android/launcher3/folder/A;->f:I

    .line 7
    .line 8
    rem-int v1, p1, p0

    .line 9
    .line 10
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 11
    .line 12
    div-int/2addr p1, p0

    .line 13
    iput p1, v0, Landroid/graphics/Point;->y:I

    .line 14
    .line 15
    return-object v0
.end method

.method public h(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/folder/A;->i(II)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public i(II)Z
    .locals 4

    .line 1
    sget-object v0, Lf1/a;->D:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget v1, p0, Lcom/android/launcher3/folder/A;->b:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x3

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v1, 0x2

    .line 21
    :goto_0
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    if-gtz p1, :cond_6

    .line 24
    .line 25
    iget-boolean p1, p0, Lcom/android/launcher3/folder/A;->h:Z

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_4

    .line 35
    .line 36
    sget p0, Lcom/android/launcher3/folder/i0;->k:I

    .line 37
    .line 38
    if-ge p2, p0, :cond_3

    .line 39
    .line 40
    return v3

    .line 41
    :cond_3
    return v2

    .line 42
    :cond_4
    const/4 p0, 0x4

    .line 43
    if-ge p2, p0, :cond_5

    .line 44
    .line 45
    return v3

    .line 46
    :cond_5
    return v2

    .line 47
    :cond_6
    :goto_1
    iget p0, p0, Lcom/android/launcher3/folder/A;->f:I

    .line 48
    .line 49
    rem-int p1, p2, p0

    .line 50
    .line 51
    div-int/2addr p2, p0

    .line 52
    if-ge p1, v1, :cond_7

    .line 53
    .line 54
    if-ge p2, v1, :cond_7

    .line 55
    .line 56
    return v3

    .line 57
    :cond_7
    return v2
.end method

.method public j(Lcom/android/launcher3/h0;ILjava/util/List;)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:TT;>(",
            "Lcom/android/launcher3/h0;",
            "I",
            "Ljava/util/List<",
            "TT;>;)",
            "Ljava/util/ArrayList<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/android/launcher3/folder/A;->f:I

    .line 7
    .line 8
    iget v2, p0, Lcom/android/launcher3/folder/A;->g:I

    .line 9
    .line 10
    mul-int/2addr v1, v2

    .line 11
    mul-int v2, v1, p2

    .line 12
    .line 13
    add-int/2addr v1, v2

    .line 14
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 23
    .line 24
    iget-object v3, p1, Lcom/android/launcher3/F1;->J0:[I

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    aget v3, v3, v4

    .line 28
    .line 29
    iget-object v5, p1, Lcom/android/launcher3/F1;->K0:[I

    .line 30
    .line 31
    aget v5, v5, v4

    .line 32
    .line 33
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    if-eqz v5, :cond_0

    .line 42
    .line 43
    iget-object v3, p1, Lcom/android/launcher3/F1;->J0:[I

    .line 44
    .line 45
    aget v3, v3, v4

    .line 46
    .line 47
    iget-object p1, p1, Lcom/android/launcher3/F1;->K0:[I

    .line 48
    .line 49
    aget p1, p1, v4

    .line 50
    .line 51
    mul-int/2addr v3, p1

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    mul-int/2addr v3, v3

    .line 54
    :goto_0
    if-ge v2, v1, :cond_4

    .line 55
    .line 56
    invoke-virtual {p0, p2, v4}, Lcom/android/launcher3/folder/A;->i(II)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    sget-object v5, Lf1/a;->D:Lf1/a$a;

    .line 74
    .line 75
    invoke-virtual {v5}, Lf1/a$a;->c()Z

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-eqz v5, :cond_2

    .line 80
    .line 81
    move v5, v3

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    sget v5, Lcom/android/launcher3/folder/i0;->k:I

    .line 84
    .line 85
    :goto_1
    if-ne p1, v5, :cond_3

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 89
    .line 90
    add-int/lit8 v4, v4, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    :goto_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_5

    .line 98
    .line 99
    new-instance p1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string p2, "previewItemsForPage: mCountX = "

    .line 105
    .line 106
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget p2, p0, Lcom/android/launcher3/folder/A;->f:I

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string p2, ", mCountY = "

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget p0, p0, Lcom/android/launcher3/folder/A;->g:I

    .line 120
    .line 121
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p0, ", content size = "

    .line 125
    .line 126
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const-string p1, "b/383526431"

    .line 141
    .line 142
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    :cond_5
    return-object v0
.end method

.method public k(I)Lcom/android/launcher3/folder/A;
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/A;->e:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/A;->a(I)V

    .line 6
    .line 7
    .line 8
    sget v0, Lcom/android/launcher3/folder/i0;->k:I

    .line 9
    .line 10
    if-le p1, v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/folder/A;->h:Z

    .line 16
    .line 17
    iput p1, p0, Lcom/android/launcher3/folder/A;->e:I

    .line 18
    .line 19
    :cond_1
    return-object p0
.end method

.method public l(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/A;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/A;->k(I)Lcom/android/launcher3/folder/A;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public m(Lcom/android/launcher3/model/data/y;I)Z
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/A;->g(I)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 6
    .line 7
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Landroid/graphics/Point;->equals(II)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget v0, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 16
    .line 17
    if-eq p2, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    iput p2, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 23
    .line 24
    iget p2, p0, Landroid/graphics/Point;->x:I

    .line 25
    .line 26
    iput p2, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 27
    .line 28
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 29
    .line 30
    iput p0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0
.end method
