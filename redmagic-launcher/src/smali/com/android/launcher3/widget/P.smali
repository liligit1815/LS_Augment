.class public Lcom/android/launcher3/widget/P;
.super Ljava/lang/Object;
.source "DatabaseWidgetPreviewLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/P$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/P;LD1/i;IILandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/P;->k(LD1/i;IILandroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/view/View;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/widget/P;Lz1/Z4;Landroid/util/Size;)Lcom/android/launcher3/widget/P$a;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/P;->m(Lz1/Z4;Landroid/util/Size;)Lcom/android/launcher3/widget/P$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/P;ZLandroid/graphics/drawable/Drawable;IIIILcom/android/launcher3/widget/U;Lcom/android/launcher3/h0;FLandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p10}, Lcom/android/launcher3/widget/P;->l(ZLandroid/graphics/drawable/Drawable;IIIILcom/android/launcher3/widget/U;Lcom/android/launcher3/h0;FLandroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f(Lz1/Z4;II)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget-object v0, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, v0, p2, p1}, Lcom/android/launcher3/widget/P;->i(Lcom/android/launcher3/widget/U;I[I)Landroid/graphics/Bitmap;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p1, p1, Lz1/Z4;->e:LD1/i;

    .line 12
    .line 13
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/P;->h(LD1/i;II)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private h(LD1/i;II)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget p2, p2, Lcom/android/launcher3/h0;->J2:I

    .line 14
    .line 15
    iget-object p3, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    const v0, 0x7f070c91

    .line 22
    .line 23
    .line 24
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    mul-int/lit8 v0, p3, 0x2

    .line 29
    .line 30
    add-int/2addr v0, p2

    .line 31
    new-instance v1, Lcom/android/launcher3/widget/O;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1, p3, p2}, Lcom/android/launcher3/widget/O;-><init>(Lcom/android/launcher3/widget/P;LD1/i;II)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v0, v1}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static j()Lcom/android/launcher3/util/p1;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    return-object v0
.end method

.method private synthetic k(LD1/i;IILandroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1, v1}, LD1/i;->h(Lt1/f;)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/P;->o(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ls1/b;->d(Landroid/graphics/drawable/Drawable;)Ls1/d;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0}, Ls1/X;->n0()V

    .line 36
    .line 37
    .line 38
    add-int/2addr p3, p2

    .line 39
    invoke-virtual {p0, p2, p2, p3, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p4}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private synthetic l(ZLandroid/graphics/drawable/Drawable;IIIILcom/android/launcher3/widget/U;Lcom/android/launcher3/h0;FLandroid/graphics/Canvas;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    move/from16 v4, p5

    .line 10
    .line 11
    move/from16 v5, p6

    .line 12
    .line 13
    move-object/from16 v6, p10

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {v1, v0, v0, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v6}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v11, Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-direct {v11, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 29
    .line 30
    .line 31
    new-instance v12, Landroid/graphics/RectF;

    .line 32
    .line 33
    int-to-float v13, v2

    .line 34
    int-to-float v10, v3

    .line 35
    const/4 v7, 0x0

    .line 36
    invoke-direct {v12, v7, v7, v13, v10}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 37
    .line 38
    .line 39
    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 40
    .line 41
    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 42
    .line 43
    .line 44
    const/4 v7, -0x1

    .line 45
    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v7, v0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 49
    .line 50
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    const v8, 0x1050008

    .line 55
    .line 56
    .line 57
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimension(I)F

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    iget-object v8, v0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 62
    .line 63
    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    const v9, 0x7f0702fc

    .line 68
    .line 69
    .line 70
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimension(I)F

    .line 71
    .line 72
    .line 73
    move-result v8

    .line 74
    invoke-static {v8, v7}, Ljava/lang/Math;->min(FF)F

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    invoke-virtual {v6, v12, v7, v7, v11}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 79
    .line 80
    .line 81
    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 82
    .line 83
    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 84
    .line 85
    .line 86
    iget-object v7, v0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 87
    .line 88
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    const v8, 0x7f070c8b

    .line 93
    .line 94
    .line 95
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimension(I)F

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 100
    .line 101
    .line 102
    new-instance v7, Landroid/graphics/PorterDuffXfermode;

    .line 103
    .line 104
    sget-object v8, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 105
    .line 106
    invoke-direct {v7, v8}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 110
    .line 111
    .line 112
    iget v7, v12, Landroid/graphics/RectF;->left:F

    .line 113
    .line 114
    invoke-virtual {v12}, Landroid/graphics/RectF;->width()F

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    int-to-float v9, v4

    .line 119
    div-float v14, v8, v9

    .line 120
    .line 121
    move v15, v1

    .line 122
    :goto_0
    if-ge v15, v4, :cond_1

    .line 123
    .line 124
    add-float/2addr v7, v14

    .line 125
    const/4 v8, 0x0

    .line 126
    move v9, v7

    .line 127
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 128
    .line 129
    .line 130
    add-int/lit8 v15, v15, 0x1

    .line 131
    .line 132
    move-object/from16 v6, p10

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_1
    iget v4, v12, Landroid/graphics/RectF;->top:F

    .line 136
    .line 137
    invoke-virtual {v12}, Landroid/graphics/RectF;->height()F

    .line 138
    .line 139
    .line 140
    move-result v6

    .line 141
    int-to-float v7, v5

    .line 142
    div-float v14, v6, v7

    .line 143
    .line 144
    :goto_1
    if-ge v1, v5, :cond_2

    .line 145
    .line 146
    add-float v8, v4, v14

    .line 147
    .line 148
    const/4 v7, 0x0

    .line 149
    move v10, v8

    .line 150
    move-object/from16 v6, p10

    .line 151
    .line 152
    move v9, v13

    .line 153
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 154
    .line 155
    .line 156
    add-int/lit8 v1, v1, 0x1

    .line 157
    .line 158
    move v4, v8

    .line 159
    goto :goto_1

    .line 160
    :cond_2
    move-object/from16 v6, p10

    .line 161
    .line 162
    :try_start_0
    iget-object v1, v0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 163
    .line 164
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    move-object/from16 v4, p7

    .line 173
    .line 174
    invoke-virtual {v4, v1}, Lcom/android/launcher3/widget/U;->h(Lt1/f;)Landroid/graphics/drawable/Drawable;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    if-eqz v1, :cond_3

    .line 179
    .line 180
    move-object/from16 v4, p8

    .line 181
    .line 182
    iget v4, v4, Lcom/android/launcher3/h0;->B1:I

    .line 183
    .line 184
    int-to-float v4, v4

    .line 185
    mul-float v4, v4, p9

    .line 186
    .line 187
    invoke-virtual {v12}, Landroid/graphics/RectF;->width()F

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    invoke-virtual {v12}, Landroid/graphics/RectF;->height()F

    .line 192
    .line 193
    .line 194
    move-result v7

    .line 195
    invoke-static {v5, v7}, Ljava/lang/Math;->min(FF)F

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    float-to-int v4, v4

    .line 204
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/P;->o(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    sub-int v1, v2, v4

    .line 209
    .line 210
    div-int/lit8 v1, v1, 0x2

    .line 211
    .line 212
    sub-int v2, v3, v4

    .line 213
    .line 214
    div-int/lit8 v2, v2, 0x2

    .line 215
    .line 216
    add-int v3, v1, v4

    .line 217
    .line 218
    add-int/2addr v4, v2

    .line 219
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v0, v6}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    .line 224
    .line 225
    :catch_0
    :cond_3
    return-void
.end method

.method private synthetic m(Lz1/Z4;Landroid/util/Size;)Lcom/android/launcher3/widget/P$a;
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0, p1, v0, p2}, Lcom/android/launcher3/widget/P;->g(Lz1/Z4;II)Lcom/android/launcher3/widget/P$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private o(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    :try_start_0
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/widget/M;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/M;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    new-instance p1, Ljava/lang/RuntimeException;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    throw p1

    .line 29
    :catch_1
    move-exception p0

    .line 30
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 35
    .line 36
    .line 37
    new-instance p1, Ljava/lang/RuntimeException;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    throw p1
.end method


# virtual methods
.method public e(Lcom/android/launcher3/v;Landroid/widget/RemoteViews;II)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    const-string v0, "WidgetPreviewLoader"

    .line 3
    .line 4
    if-gtz p3, :cond_0

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "generateFromRemoteViews: width error: "

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-static {v0, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move p3, p0

    .line 27
    :cond_0
    if-gtz p4, :cond_1

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v2, "generateFromRemoteViews: height error: "

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    invoke-static {v0, p4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move p4, p0

    .line 50
    :cond_1
    :try_start_0
    new-instance p0, Landroid/widget/FrameLayout;

    .line 51
    .line 52
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, p1, p0}, Landroid/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/high16 p1, 0x40000000    # 2.0f

    .line 60
    .line 61
    invoke-static {p3, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    invoke-static {p4, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->measure(II)V

    .line 70
    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    invoke-virtual {p0, p1, p1, p3, p4}, Landroid/view/View;->layout(IIII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    new-instance p1, Lcom/android/launcher3/widget/K;

    .line 77
    .line 78
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/K;-><init>(Landroid/view/View;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p3, p4, p1}, Ls1/e;->b(IILs1/e;)Landroid/graphics/Bitmap;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :catch_0
    const/4 p0, 0x0

    .line 87
    return-object p0
.end method

.method public g(Lz1/Z4;II)Lcom/android/launcher3/widget/P$a;
    .locals 5

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/P$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/widget/P$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 7
    .line 8
    invoke-static {}, LF/a;->c()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/y0;->u()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget v2, v1, Landroid/appwidget/AppWidgetProviderInfo;->generatedPreviewCategories:I

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    and-int/2addr v2, v3

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    new-instance v2, Lcom/android/launcher3/widget/Y0;

    .line 29
    .line 30
    iget-object v4, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 31
    .line 32
    invoke-direct {v2, v4}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1, v3}, Lcom/android/launcher3/widget/Y0;->i(Landroid/appwidget/AppWidgetProviderInfo;I)Landroid/widget/RemoteViews;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, v0, Lcom/android/launcher3/widget/P$a;->b:Landroid/widget/RemoteViews;

    .line 40
    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iput-object v1, v0, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 44
    .line 45
    :cond_0
    iget-object v2, v0, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 46
    .line 47
    if-nez v2, :cond_1

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    iget v2, v1, Landroid/appwidget/AppWidgetProviderInfo;->previewLayout:I

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetProviderInfo;->clone()Landroid/appwidget/AppWidgetProviderInfo;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v2, v1}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 66
    .line 67
    iget-object v2, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 68
    .line 69
    iget v2, v2, Landroid/appwidget/AppWidgetProviderInfo;->previewLayout:I

    .line 70
    .line 71
    iput v2, v1, Landroid/appwidget/AppWidgetProviderInfo;->initialLayout:I

    .line 72
    .line 73
    :cond_1
    iget-object v1, v0, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 74
    .line 75
    if-nez v1, :cond_2

    .line 76
    .line 77
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/P;->f(Lz1/Z4;II)Landroid/graphics/Bitmap;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iput-object p0, v0, Lcom/android/launcher3/widget/P$a;->c:Landroid/graphics/Bitmap;

    .line 82
    .line 83
    :cond_2
    return-object v0
.end method

.method public i(Lcom/android/launcher3/widget/U;I[I)Landroid/graphics/Bitmap;
    .locals 14

    .line 1
    const-string v2, "WidgetPreviewLoader"

    .line 2
    .line 3
    if-gez p2, :cond_0

    .line 4
    .line 5
    const v0, 0x7fffffff

    .line 6
    .line 7
    .line 8
    move v3, v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move/from16 v3, p2

    .line 11
    .line 12
    :goto_0
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {p1, v0, v5}, Landroid/appwidget/AppWidgetProviderInfo;->loadPreviewImage(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    goto :goto_1

    .line 25
    :catch_0
    move-exception v0

    .line 26
    new-instance v6, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v7, "Error loading widget preview for: "

    .line 32
    .line 33
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v7, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 37
    .line 38
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-static {v2, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 46
    .line 47
    .line 48
    :goto_1
    if-eqz v4, :cond_1

    .line 49
    .line 50
    invoke-direct {p0, v4}, Lcom/android/launcher3/widget/P;->o(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    goto :goto_2

    .line 55
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v6, "Can\'t load widget preview drawable 0x"

    .line 61
    .line 62
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget v6, p1, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    .line 66
    .line 67
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v6, " for provider: "

    .line 75
    .line 76
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-object v6, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 80
    .line 81
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    :cond_2
    :goto_2
    const/4 v0, 0x1

    .line 92
    if-eqz v4, :cond_3

    .line 93
    .line 94
    move v2, v0

    .line 95
    goto :goto_3

    .line 96
    :cond_3
    move v2, v5

    .line 97
    :goto_3
    iget v6, p1, Lcom/android/launcher3/widget/U;->g:I

    .line 98
    .line 99
    iget v7, p1, Lcom/android/launcher3/widget/U;->h:I

    .line 100
    .line 101
    iget-object v9, p0, Lcom/android/launcher3/widget/P;->a:Landroid/content/Context;

    .line 102
    .line 103
    invoke-static {v9}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    check-cast v9, Lcom/android/launcher3/views/k;

    .line 108
    .line 109
    invoke-interface {v9}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    if-eqz v2, :cond_4

    .line 114
    .line 115
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 116
    .line 117
    .line 118
    move-result v10

    .line 119
    if-lez v10, :cond_4

    .line 120
    .line 121
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 122
    .line 123
    .line 124
    move-result v10

    .line 125
    if-lez v10, :cond_4

    .line 126
    .line 127
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 128
    .line 129
    .line 130
    move-result v10

    .line 131
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 132
    .line 133
    .line 134
    move-result v11

    .line 135
    goto :goto_4

    .line 136
    :cond_4
    invoke-static {v9, v6, v7}, Lr2/b;->e(Lcom/android/launcher3/h0;II)Landroid/util/Size;

    .line 137
    .line 138
    .line 139
    move-result-object v10

    .line 140
    invoke-virtual {v10}, Landroid/util/Size;->getWidth()I

    .line 141
    .line 142
    .line 143
    move-result v11

    .line 144
    invoke-virtual {v10}, Landroid/util/Size;->getHeight()I

    .line 145
    .line 146
    .line 147
    move-result v10

    .line 148
    move v13, v11

    .line 149
    move v11, v10

    .line 150
    move v10, v13

    .line 151
    :goto_4
    if-eqz p3, :cond_5

    .line 152
    .line 153
    aput v10, p3, v5

    .line 154
    .line 155
    :cond_5
    const/high16 v5, 0x3f800000    # 1.0f

    .line 156
    .line 157
    if-le v10, v3, :cond_6

    .line 158
    .line 159
    int-to-float v3, v3

    .line 160
    int-to-float v12, v10

    .line 161
    div-float/2addr v3, v12

    .line 162
    goto :goto_5

    .line 163
    :cond_6
    move v3, v5

    .line 164
    :goto_5
    cmpl-float v5, v3, v5

    .line 165
    .line 166
    if-eqz v5, :cond_7

    .line 167
    .line 168
    int-to-float v5, v10

    .line 169
    mul-float/2addr v5, v3

    .line 170
    float-to-int v5, v5

    .line 171
    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    .line 172
    .line 173
    .line 174
    move-result v10

    .line 175
    int-to-float v5, v11

    .line 176
    mul-float/2addr v5, v3

    .line 177
    float-to-int v5, v5

    .line 178
    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    .line 179
    .line 180
    .line 181
    move-result v11

    .line 182
    :cond_7
    move v5, v11

    .line 183
    new-instance v0, Lcom/android/launcher3/widget/L;

    .line 184
    .line 185
    move v1, v10

    .line 186
    move v10, v3

    .line 187
    move-object v3, v4

    .line 188
    move v4, v1

    .line 189
    move-object v1, p0

    .line 190
    move-object v8, p1

    .line 191
    invoke-direct/range {v0 .. v10}, Lcom/android/launcher3/widget/L;-><init>(Lcom/android/launcher3/widget/P;ZLandroid/graphics/drawable/Drawable;IIIILcom/android/launcher3/widget/U;Lcom/android/launcher3/h0;F)V

    .line 192
    .line 193
    .line 194
    invoke-static {v4, v5, v0}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    return-object v0
.end method

.method public n(Lz1/Z4;Landroid/util/Size;Ljava/util/function/Consumer;)Lcom/android/launcher3/util/w;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/Z4;",
            "Landroid/util/Size;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/widget/P$a;",
            ">;)",
            "Lcom/android/launcher3/util/w;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/P;->j()Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lcom/android/launcher3/util/w;

    .line 10
    .line 11
    new-instance v2, Lcom/android/launcher3/widget/N;

    .line 12
    .line 13
    invoke-direct {v2, p0, p1, p2}, Lcom/android/launcher3/widget/N;-><init>(Lcom/android/launcher3/widget/P;Lz1/Z4;Landroid/util/Size;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 17
    .line 18
    invoke-direct {v1, v2, p0, p3}, Lcom/android/launcher3/util/w;-><init>(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->R(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-object v1
.end method
