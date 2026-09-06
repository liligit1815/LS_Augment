.class public Lc1/p;
.super Ljava/lang/Object;
.source "ReorderAlgorithm.java"


# instance fields
.field a:Lcom/android/launcher3/CellLayout;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/CellLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lc1/b;

    .line 6
    .line 7
    invoke-virtual {p0}, Lc1/b;->b()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic b(Landroid/graphics/Rect;Lcom/android/launcher3/util/C;)Z
    .locals 3

    .line 1
    iget v0, p1, Lcom/android/launcher3/util/C;->a:I

    .line 2
    .line 3
    iget v1, p1, Lcom/android/launcher3/util/C;->b:I

    .line 4
    .line 5
    iget v2, p1, Lcom/android/launcher3/util/C;->c:I

    .line 6
    .line 7
    add-int/2addr v2, v0

    .line 8
    iget p1, p1, Lcom/android/launcher3/util/C;->d:I

    .line 9
    .line 10
    add-int/2addr p1, v1

    .line 11
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/graphics/Rect;->intersect(IIII)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static synthetic c(Landroid/view/View;Ljava/util/Map$Entry;)Z
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eq p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic d(Landroid/view/View;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lc1/b;

    .line 6
    .line 7
    invoke-virtual {p0}, Lc1/b;->a()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private e(Landroid/view/View;Landroid/graphics/Rect;[ILc1/e;)Z
    .locals 11

    .line 1
    iget-object p4, p4, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {p4, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/launcher3/util/C;

    .line 8
    .line 9
    iget-object p4, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    iget-object p4, p4, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p4, p1, v0}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p4, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 18
    .line 19
    iget-object p4, p4, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p4, p2, v1}, Lcom/android/launcher3/util/t0;->f(Landroid/graphics/Rect;Z)V

    .line 23
    .line 24
    .line 25
    iget v3, p1, Lcom/android/launcher3/util/C;->a:I

    .line 26
    .line 27
    iget v4, p1, Lcom/android/launcher3/util/C;->b:I

    .line 28
    .line 29
    iget v5, p1, Lcom/android/launcher3/util/C;->c:I

    .line 30
    .line 31
    iget v6, p1, Lcom/android/launcher3/util/C;->d:I

    .line 32
    .line 33
    iget-object p2, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 34
    .line 35
    iget-object p2, p2, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 36
    .line 37
    iget-object v8, p2, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 38
    .line 39
    const/4 p2, 0x2

    .line 40
    new-array v10, p2, [I

    .line 41
    .line 42
    const/4 v9, 0x0

    .line 43
    move-object v2, p0

    .line 44
    move-object v7, p3

    .line 45
    invoke-virtual/range {v2 .. v10}, Lc1/p;->l(IIII[I[[Z[[Z[I)[I

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    aget p2, p0, v0

    .line 50
    .line 51
    if-ltz p2, :cond_0

    .line 52
    .line 53
    aget p0, p0, v1

    .line 54
    .line 55
    if-ltz p0, :cond_0

    .line 56
    .line 57
    iput p2, p1, Lcom/android/launcher3/util/C;->a:I

    .line 58
    .line 59
    iput p0, p1, Lcom/android/launcher3/util/C;->b:I

    .line 60
    .line 61
    move v0, v1

    .line 62
    :cond_0
    iget-object p0, v2, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 65
    .line 66
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 67
    .line 68
    .line 69
    return v0
.end method

.method private f(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lc1/e;)Z
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/graphics/Rect;",
            "[I",
            "Landroid/view/View;",
            "Lc1/e;",
            ")Z"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v9, p5

    .line 4
    .line 5
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v10, 0x1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return v10

    .line 13
    :cond_0
    new-instance v11, Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    .line 16
    .line 17
    .line 18
    move-object/from16 v12, p1

    .line 19
    .line 20
    invoke-virtual {v9, v12, v11}, Lc1/e;->d(Ljava/util/ArrayList;Landroid/graphics/Rect;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/4 v13, 0x0

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Landroid/view/View;

    .line 39
    .line 40
    iget-object v3, v9, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 41
    .line 42
    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Lcom/android/launcher3/util/C;

    .line 47
    .line 48
    iget-object v3, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 51
    .line 52
    invoke-virtual {v3, v2, v13}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    new-instance v14, Lcom/android/launcher3/util/t0;

    .line 57
    .line 58
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-direct {v14, v1, v2}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 67
    .line 68
    .line 69
    iget v1, v11, Landroid/graphics/Rect;->top:I

    .line 70
    .line 71
    iget v2, v11, Landroid/graphics/Rect;->left:I

    .line 72
    .line 73
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-eqz v4, :cond_2

    .line 82
    .line 83
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Landroid/view/View;

    .line 88
    .line 89
    iget-object v5, v9, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 90
    .line 91
    invoke-virtual {v5, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    check-cast v4, Lcom/android/launcher3/util/C;

    .line 96
    .line 97
    iget v5, v4, Lcom/android/launcher3/util/C;->a:I

    .line 98
    .line 99
    sub-int v15, v5, v2

    .line 100
    .line 101
    iget v5, v4, Lcom/android/launcher3/util/C;->b:I

    .line 102
    .line 103
    sub-int v16, v5, v1

    .line 104
    .line 105
    iget v5, v4, Lcom/android/launcher3/util/C;->c:I

    .line 106
    .line 107
    iget v4, v4, Lcom/android/launcher3/util/C;->d:I

    .line 108
    .line 109
    const/16 v19, 0x1

    .line 110
    .line 111
    move/from16 v18, v4

    .line 112
    .line 113
    move/from16 v17, v5

    .line 114
    .line 115
    invoke-virtual/range {v14 .. v19}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_2
    iget-object v1, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 122
    .line 123
    move-object/from16 v2, p2

    .line 124
    .line 125
    invoke-virtual {v1, v2, v10}, Lcom/android/launcher3/util/t0;->f(Landroid/graphics/Rect;Z)V

    .line 126
    .line 127
    .line 128
    iget v1, v11, Landroid/graphics/Rect;->left:I

    .line 129
    .line 130
    iget v2, v11, Landroid/graphics/Rect;->top:I

    .line 131
    .line 132
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    iget-object v5, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 141
    .line 142
    iget-object v5, v5, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 143
    .line 144
    iget-object v6, v5, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 145
    .line 146
    iget-object v7, v14, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 147
    .line 148
    const/4 v5, 0x2

    .line 149
    new-array v8, v5, [I

    .line 150
    .line 151
    move-object/from16 v5, p3

    .line 152
    .line 153
    invoke-virtual/range {v0 .. v8}, Lc1/p;->l(IIII[I[[Z[[Z[I)[I

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    aget v2, v1, v13

    .line 158
    .line 159
    if-ltz v2, :cond_4

    .line 160
    .line 161
    aget v1, v1, v10

    .line 162
    .line 163
    if-ltz v1, :cond_4

    .line 164
    .line 165
    iget v3, v11, Landroid/graphics/Rect;->left:I

    .line 166
    .line 167
    sub-int/2addr v2, v3

    .line 168
    iget v3, v11, Landroid/graphics/Rect;->top:I

    .line 169
    .line 170
    sub-int/2addr v1, v3

    .line 171
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    if-eqz v4, :cond_3

    .line 180
    .line 181
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    check-cast v4, Landroid/view/View;

    .line 186
    .line 187
    iget-object v5, v9, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 188
    .line 189
    invoke-virtual {v5, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    check-cast v4, Lcom/android/launcher3/util/C;

    .line 194
    .line 195
    iget v5, v4, Lcom/android/launcher3/util/C;->a:I

    .line 196
    .line 197
    add-int/2addr v5, v2

    .line 198
    iput v5, v4, Lcom/android/launcher3/util/C;->a:I

    .line 199
    .line 200
    iget v5, v4, Lcom/android/launcher3/util/C;->b:I

    .line 201
    .line 202
    add-int/2addr v5, v1

    .line 203
    iput v5, v4, Lcom/android/launcher3/util/C;->b:I

    .line 204
    .line 205
    goto :goto_2

    .line 206
    :cond_3
    move v13, v10

    .line 207
    :cond_4
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    if-eqz v2, :cond_5

    .line 216
    .line 217
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    check-cast v2, Landroid/view/View;

    .line 222
    .line 223
    iget-object v3, v9, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 224
    .line 225
    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    check-cast v2, Lcom/android/launcher3/util/C;

    .line 230
    .line 231
    iget-object v3, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 232
    .line 233
    iget-object v3, v3, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 234
    .line 235
    invoke-virtual {v3, v2, v10}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 236
    .line 237
    .line 238
    goto :goto_3

    .line 239
    :cond_5
    return v13
.end method

.method private g(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lc1/e;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/graphics/Rect;",
            "[I",
            "Landroid/view/View;",
            "Lc1/e;",
            ")Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p3, v0

    .line 3
    .line 4
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x1

    .line 9
    aget v3, p3, v2

    .line 10
    .line 11
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    add-int/2addr v1, v3

    .line 16
    const/4 v3, 0x2

    .line 17
    if-le v1, v2, :cond_2

    .line 18
    .line 19
    move v1, v0

    .line 20
    :goto_0
    if-ge v1, v3, :cond_5

    .line 21
    .line 22
    move v4, v2

    .line 23
    :goto_1
    if-ltz v4, :cond_1

    .line 24
    .line 25
    aget v5, p3, v4

    .line 26
    .line 27
    aput v0, p3, v4

    .line 28
    .line 29
    invoke-direct/range {p0 .. p5}, Lc1/p;->r(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lc1/e;)Z

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    if-eqz v6, :cond_0

    .line 34
    .line 35
    return v2

    .line 36
    :cond_0
    aput v5, p3, v4

    .line 37
    .line 38
    add-int/lit8 v4, v4, -0x1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    invoke-direct {p0, p3}, Lc1/p;->t([I)V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    move v1, v0

    .line 48
    :goto_2
    if-ge v1, v3, :cond_5

    .line 49
    .line 50
    move v4, v0

    .line 51
    :goto_3
    if-ge v4, v3, :cond_4

    .line 52
    .line 53
    invoke-direct/range {p0 .. p5}, Lc1/p;->r(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lc1/e;)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-eqz v5, :cond_3

    .line 58
    .line 59
    return v2

    .line 60
    :cond_3
    invoke-direct {p0, p3}, Lc1/p;->t([I)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v4, v4, 0x1

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_4
    aget v4, p3, v2

    .line 67
    .line 68
    aget v5, p3, v0

    .line 69
    .line 70
    aput v5, p3, v2

    .line 71
    .line 72
    aput v4, p3, v0

    .line 73
    .line 74
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_5
    return v0
.end method

.method private j(FF[I)V
    .locals 7

    .line 1
    div-float p0, p2, p1

    .line 2
    .line 3
    float-to-double v0, p0

    .line 4
    invoke-static {v0, v1}, Ljava/lang/Math;->atan(D)D

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const/4 p0, 0x0

    .line 9
    aput p0, p3, p0

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aput p0, p3, v2

    .line 13
    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 23
    .line 24
    cmpl-double v3, v3, v5

    .line 25
    .line 26
    if-lez v3, :cond_0

    .line 27
    .line 28
    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    float-to-int p1, p1

    .line 33
    aput p1, p3, p0

    .line 34
    .line 35
    :cond_0
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide p0

    .line 39
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    .line 40
    .line 41
    .line 42
    move-result-wide p0

    .line 43
    cmpl-double p0, p0, v5

    .line 44
    .line 45
    if-lez p0, :cond_1

    .line 46
    .line 47
    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    float-to-int p0, p0

    .line 52
    aput p0, p3, v2

    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method private o(IIIIII[ILandroid/view/View;ZLc1/e;)Lc1/e;
    .locals 13

    .line 1
    move/from16 v4, p4

    .line 2
    .line 3
    move-object/from16 v12, p10

    .line 4
    .line 5
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    invoke-virtual {v0, v12}, Lcom/android/launcher3/CellLayout;->y(Lc1/e;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/t0;->b(Lcom/android/launcher3/util/t0;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    new-array v10, v0, [I

    .line 25
    .line 26
    iget-object v5, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 27
    .line 28
    move v6, p1

    .line 29
    move v7, p2

    .line 30
    move/from16 v8, p5

    .line 31
    .line 32
    move/from16 v9, p6

    .line 33
    .line 34
    invoke-virtual/range {v5 .. v10}, Lcom/android/launcher3/CellLayout;->G(IIII[I)[I

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x0

    .line 39
    aget v6, v0, v1

    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    aget v7, v0, v2

    .line 43
    .line 44
    move-object v5, p0

    .line 45
    move-object/from16 v10, p7

    .line 46
    .line 47
    move-object/from16 v11, p8

    .line 48
    .line 49
    invoke-direct/range {v5 .. v12}, Lc1/p;->s(IIII[ILandroid/view/View;Lc1/e;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-nez v3, :cond_3

    .line 54
    .line 55
    move/from16 v3, p3

    .line 56
    .line 57
    if-le v8, v3, :cond_1

    .line 58
    .line 59
    if-eq v4, v9, :cond_0

    .line 60
    .line 61
    if-eqz p9, :cond_1

    .line 62
    .line 63
    :cond_0
    add-int/lit8 v5, v8, -0x1

    .line 64
    .line 65
    const/4 v9, 0x0

    .line 66
    move-object v0, p0

    .line 67
    move v1, p1

    .line 68
    move v2, p2

    .line 69
    move/from16 v6, p6

    .line 70
    .line 71
    move-object/from16 v7, p7

    .line 72
    .line 73
    move-object/from16 v8, p8

    .line 74
    .line 75
    move-object/from16 v10, p10

    .line 76
    .line 77
    invoke-direct/range {v0 .. v10}, Lc1/p;->o(IIIIII[ILandroid/view/View;ZLc1/e;)Lc1/e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_1
    if-le v9, v4, :cond_2

    .line 83
    .line 84
    add-int/lit8 v6, v9, -0x1

    .line 85
    .line 86
    const/4 v9, 0x1

    .line 87
    move-object v0, p0

    .line 88
    move v1, p1

    .line 89
    move v2, p2

    .line 90
    move/from16 v3, p3

    .line 91
    .line 92
    move-object/from16 v7, p7

    .line 93
    .line 94
    move-object/from16 v10, p10

    .line 95
    .line 96
    move v5, v8

    .line 97
    move-object/from16 v8, p8

    .line 98
    .line 99
    invoke-direct/range {v0 .. v10}, Lc1/p;->o(IIIIII[ILandroid/view/View;ZLc1/e;)Lc1/e;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0

    .line 104
    :cond_2
    move-object/from16 v10, p10

    .line 105
    .line 106
    iput-boolean v1, v10, Lc1/e;->i:Z

    .line 107
    .line 108
    return-object v10

    .line 109
    :cond_3
    move-object/from16 v10, p10

    .line 110
    .line 111
    iput-boolean v2, v10, Lc1/e;->i:Z

    .line 112
    .line 113
    aget p0, v0, v1

    .line 114
    .line 115
    iput p0, v10, Lcom/android/launcher3/util/C;->a:I

    .line 116
    .line 117
    aget p0, v0, v2

    .line 118
    .line 119
    iput p0, v10, Lcom/android/launcher3/util/C;->b:I

    .line 120
    .line 121
    iput v8, v10, Lcom/android/launcher3/util/C;->c:I

    .line 122
    .line 123
    iput v9, v10, Lcom/android/launcher3/util/C;->d:I

    .line 124
    .line 125
    return-object v10
.end method

.method private q(Landroid/graphics/Rect;Lc1/e;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p2, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/ArrayMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p2, Lc1/m;

    .line 12
    .line 13
    invoke-direct {p2, p3}, Lc1/m;-><init>(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p2, Lc1/n;

    .line 21
    .line 22
    invoke-direct {p2}, Lc1/n;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p0, p2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p2, Lc1/o;

    .line 30
    .line 31
    invoke-direct {p2, p1}, Lc1/o;-><init>(Landroid/graphics/Rect;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p0, p2}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method private r(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lc1/e;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/graphics/Rect;",
            "[I",
            "Landroid/view/View;",
            "Lc1/e;",
            ")Z"
        }
    .end annotation

    .line 1
    new-instance v0, Lc1/s;

    .line 2
    .line 3
    iget-object v1, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1, p5}, Lc1/s;-><init>(Lcom/android/launcher3/CellLayout;Ljava/util/ArrayList;Lc1/e;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lc1/s;->d()Landroid/graphics/Rect;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x0

    .line 13
    aget v3, p3, v2

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    if-gez v3, :cond_0

    .line 17
    .line 18
    iget p3, v1, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    iget p2, p2, Landroid/graphics/Rect;->left:I

    .line 21
    .line 22
    sub-int/2addr p3, p2

    .line 23
    move p2, v4

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    if-lez v3, :cond_1

    .line 26
    .line 27
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 28
    .line 29
    iget p3, v1, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    sub-int p3, p2, p3

    .line 32
    .line 33
    const/4 p2, 0x4

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    aget p3, p3, v4

    .line 36
    .line 37
    if-gez p3, :cond_2

    .line 38
    .line 39
    iget p3, v1, Landroid/graphics/Rect;->bottom:I

    .line 40
    .line 41
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 42
    .line 43
    sub-int/2addr p3, p2

    .line 44
    const/4 p2, 0x2

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 47
    .line 48
    iget p3, v1, Landroid/graphics/Rect;->top:I

    .line 49
    .line 50
    sub-int p3, p2, p3

    .line 51
    .line 52
    const/16 p2, 0x8

    .line 53
    .line 54
    :goto_0
    if-gtz p3, :cond_3

    .line 55
    .line 56
    return v2

    .line 57
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Landroid/view/View;

    .line 72
    .line 73
    iget-object v3, p5, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 74
    .line 75
    invoke-virtual {v3, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Lcom/android/launcher3/util/C;

    .line 80
    .line 81
    iget-object v3, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 82
    .line 83
    iget-object v3, v3, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 84
    .line 85
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    invoke-virtual {p5}, Lc1/e;->f()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, p2}, Lc1/s;->i(I)V

    .line 93
    .line 94
    .line 95
    move p1, v2

    .line 96
    :goto_2
    if-lez p3, :cond_8

    .line 97
    .line 98
    if-nez p1, :cond_8

    .line 99
    .line 100
    iget-object v1, p5, Lc1/e;->g:Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    :cond_5
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-eqz v3, :cond_7

    .line 111
    .line 112
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Landroid/view/View;

    .line 117
    .line 118
    iget-object v5, v0, Lc1/s;->c:Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-nez v5, :cond_5

    .line 125
    .line 126
    if-eq v3, p4, :cond_5

    .line 127
    .line 128
    invoke-virtual {v0, v3, p2}, Lc1/s;->f(Landroid/view/View;I)Z

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    if-eqz v5, :cond_5

    .line 133
    .line 134
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    check-cast v5, Lc1/b;

    .line 139
    .line 140
    iget-boolean v5, v5, Lc1/b;->i:Z

    .line 141
    .line 142
    if-nez v5, :cond_6

    .line 143
    .line 144
    move p1, v4

    .line 145
    goto :goto_4

    .line 146
    :cond_6
    invoke-virtual {v0, v3}, Lc1/s;->a(Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    iget-object v5, p5, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 150
    .line 151
    invoke-virtual {v5, v3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lcom/android/launcher3/util/C;

    .line 156
    .line 157
    iget-object v5, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 158
    .line 159
    iget-object v5, v5, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 160
    .line 161
    invoke-virtual {v5, v3, v2}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 162
    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_7
    :goto_4
    add-int/lit8 p3, p3, -0x1

    .line 166
    .line 167
    invoke-virtual {v0, p2, v4}, Lc1/s;->h(II)V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_8
    invoke-virtual {v0}, Lc1/s;->d()Landroid/graphics/Rect;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    if-nez p1, :cond_9

    .line 176
    .line 177
    iget p1, p2, Landroid/graphics/Rect;->left:I

    .line 178
    .line 179
    if-ltz p1, :cond_9

    .line 180
    .line 181
    iget p1, p2, Landroid/graphics/Rect;->right:I

    .line 182
    .line 183
    iget-object p3, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 184
    .line 185
    invoke-virtual {p3}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 186
    .line 187
    .line 188
    move-result p3

    .line 189
    if-gt p1, p3, :cond_9

    .line 190
    .line 191
    iget p1, p2, Landroid/graphics/Rect;->top:I

    .line 192
    .line 193
    if-ltz p1, :cond_9

    .line 194
    .line 195
    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    .line 196
    .line 197
    iget-object p2, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 198
    .line 199
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    if-gt p1, p2, :cond_9

    .line 204
    .line 205
    move v2, v4

    .line 206
    goto :goto_5

    .line 207
    :cond_9
    invoke-virtual {p5}, Lc1/e;->e()V

    .line 208
    .line 209
    .line 210
    :goto_5
    iget-object p1, v0, Lc1/s;->c:Ljava/util/ArrayList;

    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-eqz p2, :cond_a

    .line 221
    .line 222
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    check-cast p2, Landroid/view/View;

    .line 227
    .line 228
    iget-object p3, p5, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 229
    .line 230
    invoke-virtual {p3, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object p2

    .line 234
    check-cast p2, Lcom/android/launcher3/util/C;

    .line 235
    .line 236
    iget-object p3, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 237
    .line 238
    iget-object p3, p3, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 239
    .line 240
    invoke-virtual {p3, p2, v4}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 241
    .line 242
    .line 243
    goto :goto_6

    .line 244
    :cond_a
    return v2
.end method

.method private s(IIII[ILandroid/view/View;Lc1/e;)Z
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_a

    .line 3
    .line 4
    if-gez p2, :cond_0

    .line 5
    .line 6
    goto/16 :goto_1

    .line 7
    .line 8
    :cond_0
    move v1, p1

    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    move v2, p2

    .line 15
    new-instance p2, Landroid/graphics/Rect;

    .line 16
    .line 17
    add-int/2addr p3, v1

    .line 18
    add-int/2addr p4, v2

    .line 19
    invoke-direct {p2, v1, v2, p3, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 20
    .line 21
    .line 22
    if-eqz p6, :cond_1

    .line 23
    .line 24
    iget-object v3, p7, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 25
    .line 26
    invoke-virtual {v3, p6}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Lcom/android/launcher3/util/C;

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    iput v1, v3, Lcom/android/launcher3/util/C;->a:I

    .line 35
    .line 36
    iput v2, v3, Lcom/android/launcher3/util/C;->b:I

    .line 37
    .line 38
    :cond_1
    new-instance v3, Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-direct {v3, v1, v2, p3, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 41
    .line 42
    .line 43
    new-instance p3, Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance p4, Lc1/k;

    .line 49
    .line 50
    invoke-direct {p4}, Lc1/k;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {p4}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    new-instance v1, Lc1/l;

    .line 58
    .line 59
    invoke-direct {v1}, Lc1/l;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-interface {p4, v1}, Ljava/util/Comparator;->thenComparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    iget-object v1, p7, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-interface {v1}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v1, p4}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 77
    .line 78
    .line 79
    move-result-object p4

    .line 80
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {p4, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p4

    .line 88
    check-cast p4, Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object p4

    .line 94
    :cond_2
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_5

    .line 99
    .line 100
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Landroid/view/View;

    .line 105
    .line 106
    if-ne v1, p6, :cond_3

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_3
    iget-object v2, p7, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 110
    .line 111
    invoke-virtual {v2, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Lcom/android/launcher3/util/C;

    .line 116
    .line 117
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    check-cast v4, Lc1/b;

    .line 122
    .line 123
    iget v5, v2, Lcom/android/launcher3/util/C;->a:I

    .line 124
    .line 125
    iget v6, v2, Lcom/android/launcher3/util/C;->b:I

    .line 126
    .line 127
    iget v7, v2, Lcom/android/launcher3/util/C;->c:I

    .line 128
    .line 129
    add-int/2addr v7, v5

    .line 130
    iget v2, v2, Lcom/android/launcher3/util/C;->d:I

    .line 131
    .line 132
    add-int/2addr v2, v6

    .line 133
    invoke-virtual {p3, v5, v6, v7, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 134
    .line 135
    .line 136
    invoke-static {v3, p3}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-eqz v2, :cond_2

    .line 141
    .line 142
    iget-boolean v2, v4, Lc1/b;->i:Z

    .line 143
    .line 144
    if-nez v2, :cond_4

    .line 145
    .line 146
    return v0

    .line 147
    :cond_4
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_5
    iput-object p1, p7, Lc1/e;->h:Ljava/util/ArrayList;

    .line 152
    .line 153
    move-object p3, p5

    .line 154
    move-object p4, p6

    .line 155
    move-object p5, p7

    .line 156
    invoke-direct/range {p0 .. p5}, Lc1/p;->g(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lc1/e;)Z

    .line 157
    .line 158
    .line 159
    move-result p6

    .line 160
    const/4 p7, 0x1

    .line 161
    if-eqz p6, :cond_6

    .line 162
    .line 163
    return p7

    .line 164
    :cond_6
    invoke-direct/range {p0 .. p5}, Lc1/p;->f(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lc1/e;)Z

    .line 165
    .line 166
    .line 167
    move-result p4

    .line 168
    if-eqz p4, :cond_7

    .line 169
    .line 170
    return p7

    .line 171
    :cond_7
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    :cond_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 176
    .line 177
    .line 178
    move-result p4

    .line 179
    if-eqz p4, :cond_9

    .line 180
    .line 181
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p4

    .line 185
    check-cast p4, Landroid/view/View;

    .line 186
    .line 187
    invoke-direct {p0, p4, p2, p3, p5}, Lc1/p;->e(Landroid/view/View;Landroid/graphics/Rect;[ILc1/e;)Z

    .line 188
    .line 189
    .line 190
    move-result p4

    .line 191
    if-nez p4, :cond_8

    .line 192
    .line 193
    return v0

    .line 194
    :cond_9
    return p7

    .line 195
    :cond_a
    :goto_1
    return v0
.end method

.method private t([I)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    aget v0, p1, p0

    .line 3
    .line 4
    mul-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    aput v0, p1, p0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    aget v0, p1, p0

    .line 10
    .line 11
    mul-int/lit8 v0, v0, -0x1

    .line 12
    .line 13
    aput v0, p1, p0

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public h(Lc1/q;)Lc1/e;
    .locals 3

    .line 1
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/CellLayout;->f0:[I

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lc1/p;->p(Lc1/q;[I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lc1/p;->k(Lc1/q;)Lc1/e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p0, p1, v1}, Lc1/p;->m(Lc1/q;Z)Lc1/e;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, p1}, Lc1/p;->i(Lc1/q;)Lc1/e;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-boolean p1, v1, Lc1/e;->i:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lc1/e;->c()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0}, Lc1/e;->c()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-lt p1, v2, :cond_0

    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_0
    iget-boolean p1, p0, Lc1/e;->i:Z

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    iget-boolean p0, v0, Lc1/e;->i:Z

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_2
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public i(Lc1/q;)Lc1/e;
    .locals 11

    .line 1
    new-instance v0, Lc1/e;

    .line 2
    .line 3
    invoke-direct {v0}, Lc1/e;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v9, v1, [I

    .line 8
    .line 9
    new-array v10, v1, [I

    .line 10
    .line 11
    iget-object v2, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 12
    .line 13
    invoke-virtual {p1}, Lc1/q;->d()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {p1}, Lc1/q;->e()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {p1}, Lc1/q;->b()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    invoke-virtual {p1}, Lc1/q;->c()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-virtual {p1}, Lc1/q;->g()I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    invoke-virtual {p1}, Lc1/q;->h()I

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    invoke-virtual/range {v2 .. v10}, Lcom/android/launcher3/CellLayout;->H(IIIIII[I[I)[I

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    aget v1, v9, p1

    .line 42
    .line 43
    if-ltz v1, :cond_0

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    aget v2, v9, v1

    .line 47
    .line 48
    if-ltz v2, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/android/launcher3/CellLayout;->y(Lc1/e;)V

    .line 53
    .line 54
    .line 55
    aget p0, v9, p1

    .line 56
    .line 57
    iput p0, v0, Lcom/android/launcher3/util/C;->a:I

    .line 58
    .line 59
    aget p0, v9, v1

    .line 60
    .line 61
    iput p0, v0, Lcom/android/launcher3/util/C;->b:I

    .line 62
    .line 63
    aget p0, v10, p1

    .line 64
    .line 65
    iput p0, v0, Lcom/android/launcher3/util/C;->c:I

    .line 66
    .line 67
    aget p0, v10, v1

    .line 68
    .line 69
    iput p0, v0, Lcom/android/launcher3/util/C;->d:I

    .line 70
    .line 71
    iput-boolean v1, v0, Lc1/e;->i:Z

    .line 72
    .line 73
    return-object v0

    .line 74
    :cond_0
    iput-boolean p1, v0, Lc1/e;->i:Z

    .line 75
    .line 76
    return-object v0
.end method

.method public k(Lc1/q;)Lc1/e;
    .locals 10

    .line 1
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Lc1/q;->d()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p1}, Lc1/q;->e()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p1}, Lc1/q;->g()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-virtual {p1}, Lc1/q;->h()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/4 v5, 0x2

    .line 20
    new-array v5, v5, [I

    .line 21
    .line 22
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->G(IIII[I)[I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lc1/e;

    .line 27
    .line 28
    invoke-direct {v1}, Lc1/e;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Lcom/android/launcher3/CellLayout;->y(Lc1/e;)V

    .line 34
    .line 35
    .line 36
    new-instance v2, Landroid/graphics/Rect;

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    aget v4, v0, v3

    .line 40
    .line 41
    const/4 v5, 0x1

    .line 42
    aget v6, v0, v5

    .line 43
    .line 44
    invoke-virtual {p1}, Lc1/q;->g()I

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    add-int/2addr v7, v4

    .line 49
    aget v8, v0, v5

    .line 50
    .line 51
    invoke-virtual {p1}, Lc1/q;->h()I

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    add-int/2addr v8, v9

    .line 56
    invoke-direct {v2, v4, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lc1/q;->a()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-direct {p0, v2, v1, v4}, Lc1/p;->q(Landroid/graphics/Rect;Lc1/e;Landroid/view/View;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    xor-int/lit8 v2, p0, 0x1

    .line 68
    .line 69
    iput-boolean v2, v1, Lc1/e;->i:Z

    .line 70
    .line 71
    if-eqz p0, :cond_0

    .line 72
    .line 73
    return-object v1

    .line 74
    :cond_0
    aget p0, v0, v3

    .line 75
    .line 76
    iput p0, v1, Lcom/android/launcher3/util/C;->a:I

    .line 77
    .line 78
    aget p0, v0, v5

    .line 79
    .line 80
    iput p0, v1, Lcom/android/launcher3/util/C;->b:I

    .line 81
    .line 82
    invoke-virtual {p1}, Lc1/q;->g()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    iput p0, v1, Lcom/android/launcher3/util/C;->c:I

    .line 87
    .line 88
    invoke-virtual {p1}, Lc1/q;->h()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    iput p0, v1, Lcom/android/launcher3/util/C;->d:I

    .line 93
    .line 94
    return-object v1
.end method

.method public l(IIII[I[[Z[[Z[I)[I
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    move/from16 v2, p4

    .line 6
    .line 7
    const/4 v3, 0x2

    .line 8
    if-eqz p8, :cond_0

    .line 9
    .line 10
    move-object/from16 v4, p8

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-array v4, v3, [I

    .line 14
    .line 15
    :goto_0
    iget-object v5, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    invoke-virtual {v5}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    iget-object v6, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    invoke-virtual {v6}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    const/high16 v9, -0x80000000

    .line 28
    .line 29
    const/4 v10, 0x0

    .line 30
    const v11, 0x7f7fffff    # Float.MAX_VALUE

    .line 31
    .line 32
    .line 33
    :goto_1
    add-int/lit8 v12, v2, -0x1

    .line 34
    .line 35
    sub-int v12, v6, v12

    .line 36
    .line 37
    if-ge v10, v12, :cond_8

    .line 38
    .line 39
    const/4 v12, 0x0

    .line 40
    :goto_2
    add-int/lit8 v14, v1, -0x1

    .line 41
    .line 42
    sub-int v14, v5, v14

    .line 43
    .line 44
    if-ge v12, v14, :cond_7

    .line 45
    .line 46
    const/4 v14, 0x0

    .line 47
    :goto_3
    if-ge v14, v1, :cond_4

    .line 48
    .line 49
    const/4 v15, 0x0

    .line 50
    :goto_4
    if-ge v15, v2, :cond_3

    .line 51
    .line 52
    add-int v16, v12, v14

    .line 53
    .line 54
    aget-object v16, p6, v16

    .line 55
    .line 56
    add-int v17, v10, v15

    .line 57
    .line 58
    aget-boolean v16, v16, v17

    .line 59
    .line 60
    if-eqz v16, :cond_2

    .line 61
    .line 62
    if-eqz p7, :cond_1

    .line 63
    .line 64
    aget-object v16, p7, v14

    .line 65
    .line 66
    aget-boolean v16, v16, v15

    .line 67
    .line 68
    if-eqz v16, :cond_2

    .line 69
    .line 70
    :cond_1
    move-object/from16 v18, v4

    .line 71
    .line 72
    const p8, 0x7f7fffff    # Float.MAX_VALUE

    .line 73
    .line 74
    .line 75
    const/4 v15, 0x0

    .line 76
    const/16 v16, 0x1

    .line 77
    .line 78
    move v4, v3

    .line 79
    goto :goto_5

    .line 80
    :cond_2
    add-int/lit8 v15, v15, 0x1

    .line 81
    .line 82
    goto :goto_4

    .line 83
    :cond_3
    add-int/lit8 v14, v14, 0x1

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_4
    sub-int v14, v12, p1

    .line 87
    .line 88
    const p8, 0x7f7fffff    # Float.MAX_VALUE

    .line 89
    .line 90
    .line 91
    const/4 v15, 0x0

    .line 92
    int-to-double v7, v14

    .line 93
    const/16 v16, 0x1

    .line 94
    .line 95
    sub-int v13, v10, p2

    .line 96
    .line 97
    move-object/from16 v18, v4

    .line 98
    .line 99
    int-to-double v3, v13

    .line 100
    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    double-to-float v3, v3

    .line 105
    const/4 v4, 0x2

    .line 106
    new-array v7, v4, [I

    .line 107
    .line 108
    int-to-float v8, v14

    .line 109
    int-to-float v13, v13

    .line 110
    invoke-direct {v0, v8, v13, v7}, Lc1/p;->j(FF[I)V

    .line 111
    .line 112
    .line 113
    aget v8, p5, v15

    .line 114
    .line 115
    aget v13, v7, v15

    .line 116
    .line 117
    mul-int/2addr v8, v13

    .line 118
    aget v13, p5, v16

    .line 119
    .line 120
    aget v7, v7, v16

    .line 121
    .line 122
    mul-int/2addr v13, v7

    .line 123
    add-int/2addr v8, v13

    .line 124
    invoke-static {v3, v11}, Ljava/lang/Float;->compare(FF)I

    .line 125
    .line 126
    .line 127
    move-result v7

    .line 128
    if-ltz v7, :cond_5

    .line 129
    .line 130
    invoke-static {v3, v11}, Ljava/lang/Float;->compare(FF)I

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    if-nez v7, :cond_6

    .line 135
    .line 136
    if-le v8, v9, :cond_6

    .line 137
    .line 138
    :cond_5
    aput v12, v18, v15

    .line 139
    .line 140
    aput v10, v18, v16

    .line 141
    .line 142
    move v11, v3

    .line 143
    move v9, v8

    .line 144
    :cond_6
    :goto_5
    add-int/lit8 v12, v12, 0x1

    .line 145
    .line 146
    move v3, v4

    .line 147
    move-object/from16 v4, v18

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_7
    move-object/from16 v18, v4

    .line 151
    .line 152
    const p8, 0x7f7fffff    # Float.MAX_VALUE

    .line 153
    .line 154
    .line 155
    const/4 v15, 0x0

    .line 156
    move v4, v3

    .line 157
    add-int/lit8 v10, v10, 0x1

    .line 158
    .line 159
    move-object/from16 v4, v18

    .line 160
    .line 161
    goto/16 :goto_1

    .line 162
    .line 163
    :cond_8
    move-object/from16 v18, v4

    .line 164
    .line 165
    const p8, 0x7f7fffff    # Float.MAX_VALUE

    .line 166
    .line 167
    .line 168
    const/4 v15, 0x0

    .line 169
    const/16 v16, 0x1

    .line 170
    .line 171
    cmpl-float v0, v11, p8

    .line 172
    .line 173
    if-nez v0, :cond_9

    .line 174
    .line 175
    const/4 v0, -0x1

    .line 176
    aput v0, v18, v15

    .line 177
    .line 178
    aput v0, v18, v16

    .line 179
    .line 180
    :cond_9
    return-object v18
.end method

.method public m(Lc1/q;Z)Lc1/e;
    .locals 1

    .line 1
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/CellLayout;->f0:[I

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, p2}, Lc1/p;->n(Lc1/q;[IZ)Lc1/e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public n(Lc1/q;[IZ)Lc1/e;
    .locals 11

    .line 1
    invoke-virtual {p1}, Lc1/q;->d()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    invoke-virtual {p1}, Lc1/q;->e()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {p1}, Lc1/q;->b()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p1}, Lc1/q;->c()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-virtual {p1}, Lc1/q;->g()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    invoke-virtual {p1}, Lc1/q;->h()I

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    invoke-virtual {p1}, Lc1/q;->a()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    invoke-virtual {p1}, Lc1/q;->f()Lc1/e;

    .line 30
    .line 31
    .line 32
    move-result-object v10

    .line 33
    move-object v0, p0

    .line 34
    move-object v7, p2

    .line 35
    move v9, p3

    .line 36
    invoke-direct/range {v0 .. v10}, Lc1/p;->o(IIIIII[ILandroid/view/View;ZLc1/e;)Lc1/e;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public p(Lc1/q;[I)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v8, v2, [I

    .line 7
    .line 8
    iget-object v3, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 9
    .line 10
    invoke-virtual/range {p1 .. p1}, Lc1/q;->d()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    invoke-virtual/range {p1 .. p1}, Lc1/q;->e()I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    invoke-virtual/range {p1 .. p1}, Lc1/q;->g()I

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    invoke-virtual/range {p1 .. p1}, Lc1/q;->h()I

    .line 23
    .line 24
    .line 25
    move-result v7

    .line 26
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/CellLayout;->G(IIII[I)[I

    .line 27
    .line 28
    .line 29
    new-instance v7, Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v2, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 35
    .line 36
    const/4 v9, 0x0

    .line 37
    aget v3, v8, v9

    .line 38
    .line 39
    const/4 v10, 0x1

    .line 40
    aget v4, v8, v10

    .line 41
    .line 42
    invoke-virtual/range {p1 .. p1}, Lc1/q;->g()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    invoke-virtual/range {p1 .. p1}, Lc1/q;->h()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual/range {p1 .. p1}, Lc1/q;->d()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v7}, Landroid/graphics/Rect;->centerX()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    sub-int/2addr v2, v3

    .line 62
    invoke-virtual/range {p1 .. p1}, Lc1/q;->e()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    sub-int/2addr v3, v4

    .line 71
    invoke-virtual {v7, v2, v3}, Landroid/graphics/Rect;->offset(II)V

    .line 72
    .line 73
    .line 74
    new-instance v2, Landroid/graphics/Rect;

    .line 75
    .line 76
    aget v3, v8, v9

    .line 77
    .line 78
    aget v4, v8, v10

    .line 79
    .line 80
    invoke-virtual/range {p1 .. p1}, Lc1/q;->g()I

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    add-int/2addr v5, v3

    .line 85
    aget v6, v8, v10

    .line 86
    .line 87
    invoke-virtual/range {p1 .. p1}, Lc1/q;->h()I

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    add-int/2addr v6, v7

    .line 92
    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 93
    .line 94
    .line 95
    iget-object v3, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 96
    .line 97
    invoke-virtual/range {p1 .. p1}, Lc1/q;->a()Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v3, v2, v4}, Lcom/android/launcher3/CellLayout;->M(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    if-nez v3, :cond_0

    .line 106
    .line 107
    new-instance v3, Landroid/graphics/Rect;

    .line 108
    .line 109
    invoke-direct {v3, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 110
    .line 111
    .line 112
    :cond_0
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    iget-object v11, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 121
    .line 122
    iget v12, v3, Landroid/graphics/Rect;->left:I

    .line 123
    .line 124
    iget v13, v3, Landroid/graphics/Rect;->top:I

    .line 125
    .line 126
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 127
    .line 128
    .line 129
    move-result v14

    .line 130
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 131
    .line 132
    .line 133
    move-result v15

    .line 134
    move-object/from16 v16, v3

    .line 135
    .line 136
    invoke-virtual/range {v11 .. v16}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->centerX()I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    invoke-virtual/range {p1 .. p1}, Lc1/q;->d()I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    sub-int/2addr v3, v5

    .line 148
    invoke-virtual/range {p1 .. p1}, Lc1/q;->g()I

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    div-int/2addr v3, v5

    .line 153
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->centerY()I

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    invoke-virtual/range {p1 .. p1}, Lc1/q;->e()I

    .line 158
    .line 159
    .line 160
    move-result v6

    .line 161
    sub-int/2addr v5, v6

    .line 162
    invoke-virtual/range {p1 .. p1}, Lc1/q;->h()I

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    div-int/2addr v5, v6

    .line 167
    iget-object v6, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 168
    .line 169
    invoke-virtual {v6}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    if-eq v2, v6, :cond_1

    .line 174
    .line 175
    invoke-virtual/range {p1 .. p1}, Lc1/q;->g()I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    iget-object v6, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 180
    .line 181
    invoke-virtual {v6}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    if-ne v2, v6, :cond_2

    .line 186
    .line 187
    :cond_1
    move v3, v9

    .line 188
    :cond_2
    iget-object v2, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 189
    .line 190
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    if-eq v4, v2, :cond_3

    .line 195
    .line 196
    invoke-virtual/range {p1 .. p1}, Lc1/q;->h()I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    iget-object v4, v0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 201
    .line 202
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    if-ne v2, v4, :cond_4

    .line 207
    .line 208
    :cond_3
    move v5, v9

    .line 209
    :cond_4
    if-nez v3, :cond_5

    .line 210
    .line 211
    aput v10, v1, v9

    .line 212
    .line 213
    aput v9, v1, v10

    .line 214
    .line 215
    return-void

    .line 216
    :cond_5
    int-to-float v2, v3

    .line 217
    int-to-float v3, v5

    .line 218
    invoke-direct {v0, v2, v3, v1}, Lc1/p;->j(FF[I)V

    .line 219
    .line 220
    .line 221
    return-void
.end method
