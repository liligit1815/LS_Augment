.class public Ls1/b;
.super Ljava/lang/Object;
.source "BaseIconFactory.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/b$b;,
        Ls1/b$c;,
        Ls1/b$d;,
        Ls1/b$a;
    }
.end annotation


# static fields
.field private static final t:F

.field private static u:I

.field private static v:Z

.field private static w:Z


# instance fields
.field private final g:Landroid/graphics/Rect;

.field private final h:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/util/N2;",
            ">;"
        }
    .end annotation
.end field

.field protected final i:Landroid/content/Context;

.field private final j:Landroid/graphics/Canvas;

.field private final k:Landroid/content/pm/PackageManager;

.field protected final l:I

.field protected final m:I

.field protected n:Ls1/U;

.field private o:Ls1/m0;

.field private volatile p:Landroid/graphics/Bitmap;

.field private q:I

.field private final r:Z

.field private s:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    mul-float/2addr v1, v0

    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    add-float/2addr v1, v0

    .line 11
    div-float/2addr v0, v1

    .line 12
    const v1, 0x3f333333    # 0.7f

    .line 13
    .line 14
    .line 15
    mul-float/2addr v0, v1

    .line 16
    sput v0, Ls1/b;->t:F

    .line 17
    .line 18
    const/16 v0, 0xf5

    .line 19
    .line 20
    invoke-static {v0, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sput v0, Ls1/b;->u:I

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    sput-boolean v0, Ls1/b;->v:Z

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    sput-boolean v0, Ls1/b;->w:Z

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ls1/b;->g:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ls1/b;->h:Landroid/util/SparseArray;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Ls1/b;->q:I

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ls1/b;->i:Landroid/content/Context;

    .line 26
    .line 27
    iput p2, p0, Ls1/b;->l:I

    .line 28
    .line 29
    iput p3, p0, Ls1/b;->m:I

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iput-object p2, p0, Ls1/b;->k:Landroid/content/pm/PackageManager;

    .line 36
    .line 37
    new-instance p2, Landroid/graphics/Canvas;

    .line 38
    .line 39
    invoke-direct {p2}, Landroid/graphics/Canvas;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p2, p0, Ls1/b;->j:Landroid/graphics/Canvas;

    .line 43
    .line 44
    new-instance p3, Landroid/graphics/PaintFlagsDrawFilter;

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    const/4 v2, 0x2

    .line 48
    invoke-direct {p3, v1, v2}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, p3}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ls1/b;->c()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget p3, Ls1/f0;->a:I

    .line 62
    .line 63
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iput-boolean p2, p0, Ls1/b;->r:Z

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    sget p3, Ls1/h0;->n:I

    .line 74
    .line 75
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sget p3, Ls1/h0;->m:I

    .line 84
    .line 85
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iput p1, p0, Ls1/b;->s:I

    .line 94
    .line 95
    return-void
.end method

.method private A(Landroid/graphics/drawable/Drawable;F)Landroid/graphics/drawable/Drawable;
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    cmpl-float v1, p0, v0

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-lez v1, :cond_0

    .line 15
    .line 16
    cmpl-float v1, v0, v2

    .line 17
    .line 18
    if-lez v1, :cond_0

    .line 19
    .line 20
    div-float/2addr v0, p0

    .line 21
    mul-float/2addr v0, p2

    .line 22
    move p0, p2

    .line 23
    move p2, v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    cmpl-float v1, v0, p0

    .line 26
    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    cmpl-float v1, p0, v2

    .line 30
    .line 31
    if-lez v1, :cond_1

    .line 32
    .line 33
    div-float/2addr p0, v0

    .line 34
    mul-float/2addr p0, p2

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move p0, p2

    .line 37
    :goto_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 38
    .line 39
    sub-float p2, v0, p2

    .line 40
    .line 41
    const/high16 v1, 0x40000000    # 2.0f

    .line 42
    .line 43
    div-float v4, p2, v1

    .line 44
    .line 45
    sub-float/2addr v0, p0

    .line 46
    div-float v5, v0, v1

    .line 47
    .line 48
    new-instance v2, Landroid/graphics/drawable/InsetDrawable;

    .line 49
    .line 50
    move v6, v4

    .line 51
    move v7, v5

    .line 52
    move-object v3, p1

    .line 53
    invoke-direct/range {v2 .. v7}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;FFFF)V

    .line 54
    .line 55
    .line 56
    return-object v2
.end method

.method private D(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FILandroid/graphics/Bitmap;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    move-object/from16 v5, p5

    .line 12
    .line 13
    iget v6, v0, Ls1/b;->m:I

    .line 14
    .line 15
    iget-object v7, v0, Ls1/b;->g:Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v8

    .line 21
    invoke-virtual {v7, v8}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 22
    .line 23
    .line 24
    instance-of v7, v2, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 25
    .line 26
    const/high16 v8, 0x3f800000    # 1.0f

    .line 27
    .line 28
    const/4 v9, 0x2

    .line 29
    if-eqz v7, :cond_3

    .line 30
    .line 31
    move-object v5, v2

    .line 32
    check-cast v5, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 33
    .line 34
    int-to-float v7, v6

    .line 35
    const v10, 0x3d0f5c29    # 0.035f

    .line 36
    .line 37
    .line 38
    mul-float/2addr v10, v7

    .line 39
    float-to-double v10, v10

    .line 40
    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    .line 41
    .line 42
    .line 43
    move-result-wide v10

    .line 44
    double-to-int v10, v10

    .line 45
    sub-float/2addr v8, v3

    .line 46
    mul-float/2addr v7, v8

    .line 47
    const/high16 v3, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float/2addr v7, v3

    .line 50
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-static {v10, v3}, Ljava/lang/Math;->max(II)I

    .line 55
    .line 56
    .line 57
    iget v3, v0, Ls1/b;->s:I

    .line 58
    .line 59
    mul-int/lit8 v7, v3, 0x2

    .line 60
    .line 61
    sub-int/2addr v6, v7

    .line 62
    const/4 v7, 0x0

    .line 63
    invoke-virtual {v2, v7, v7, v6, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-virtual {v0, v5, v6}, Ls1/b;->T(Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Rect;)Landroid/graphics/Path;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    int-to-float v3, v3

    .line 79
    invoke-virtual {v1, v3, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 80
    .line 81
    .line 82
    if-eq v4, v9, :cond_0

    .line 83
    .line 84
    const/4 v3, 0x4

    .line 85
    if-ne v4, v3, :cond_1

    .line 86
    .line 87
    :cond_0
    invoke-virtual {v0}, Ls1/b;->P()Ls1/m0;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v3, v6, v1}, Ls1/m0;->a(Landroid/graphics/Path;Landroid/graphics/Canvas;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    instance-of v3, v2, Ls1/d$a;

    .line 95
    .line 96
    if-eqz v3, :cond_2

    .line 97
    .line 98
    move-object v3, v2

    .line 99
    check-cast v3, Ls1/d$a;

    .line 100
    .line 101
    invoke-interface {v3, v1}, Ls1/d$a;->a(Landroid/graphics/Canvas;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    invoke-virtual {v0, v1, v5, v6}, Ls1/b;->C(Landroid/graphics/Canvas;Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Path;)V

    .line 106
    .line 107
    .line 108
    :goto_0
    invoke-virtual {v1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 109
    .line 110
    .line 111
    goto/16 :goto_2

    .line 112
    .line 113
    :cond_3
    instance-of v7, v2, Landroid/graphics/drawable/BitmapDrawable;

    .line 114
    .line 115
    const-string v10, "BaseIconFactory"

    .line 116
    .line 117
    if-eqz v7, :cond_5

    .line 118
    .line 119
    move-object v7, v2

    .line 120
    check-cast v7, Landroid/graphics/drawable/BitmapDrawable;

    .line 121
    .line 122
    invoke-virtual {v7}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 123
    .line 124
    .line 125
    move-result-object v11

    .line 126
    if-eqz v11, :cond_4

    .line 127
    .line 128
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getDensity()I

    .line 129
    .line 130
    .line 131
    move-result v12

    .line 132
    if-nez v12, :cond_4

    .line 133
    .line 134
    iget-object v12, v0, Ls1/b;->i:Landroid/content/Context;

    .line 135
    .line 136
    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 137
    .line 138
    .line 139
    move-result-object v12

    .line 140
    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 141
    .line 142
    .line 143
    move-result-object v12

    .line 144
    invoke-virtual {v7, v12}, Landroid/graphics/drawable/BitmapDrawable;->setTargetDensity(Landroid/util/DisplayMetrics;)V

    .line 145
    .line 146
    .line 147
    :cond_4
    if-nez v11, :cond_5

    .line 148
    .line 149
    const-string v7, "createIconBitmap: bitmap is null."

    .line 150
    .line 151
    invoke-static {v10, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    :cond_5
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 155
    .line 156
    .line 157
    move-result v7

    .line 158
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 159
    .line 160
    .line 161
    move-result v11

    .line 162
    if-lez v7, :cond_7

    .line 163
    .line 164
    if-lez v11, :cond_7

    .line 165
    .line 166
    int-to-float v12, v7

    .line 167
    int-to-float v13, v11

    .line 168
    div-float/2addr v12, v13

    .line 169
    if-le v7, v11, :cond_6

    .line 170
    .line 171
    int-to-float v7, v6

    .line 172
    div-float/2addr v7, v12

    .line 173
    float-to-int v7, v7

    .line 174
    move v11, v7

    .line 175
    move v7, v6

    .line 176
    goto :goto_1

    .line 177
    :cond_6
    if-le v11, v7, :cond_7

    .line 178
    .line 179
    int-to-float v7, v6

    .line 180
    mul-float/2addr v7, v12

    .line 181
    float-to-int v7, v7

    .line 182
    move v11, v6

    .line 183
    goto :goto_1

    .line 184
    :cond_7
    move v7, v6

    .line 185
    move v11, v7

    .line 186
    :goto_1
    sub-int v12, v6, v7

    .line 187
    .line 188
    div-int/2addr v12, v9

    .line 189
    sub-int v13, v6, v11

    .line 190
    .line 191
    div-int/2addr v13, v9

    .line 192
    iget v14, v0, Ls1/b;->s:I

    .line 193
    .line 194
    mul-int/2addr v14, v9

    .line 195
    sub-int v14, v6, v14

    .line 196
    .line 197
    int-to-float v14, v14

    .line 198
    int-to-float v15, v6

    .line 199
    div-float/2addr v14, v15

    .line 200
    const/4 v15, 0x0

    .line 201
    invoke-static {v14, v15}, Ljava/lang/Float;->compare(FF)I

    .line 202
    .line 203
    .line 204
    move-result v15

    .line 205
    move/from16 v16, v9

    .line 206
    .line 207
    const/4 v9, 0x1

    .line 208
    if-ne v15, v9, :cond_8

    .line 209
    .line 210
    invoke-static {v8, v14}, Ljava/lang/Float;->compare(FF)I

    .line 211
    .line 212
    .line 213
    move-result v8

    .line 214
    if-eq v8, v9, :cond_9

    .line 215
    .line 216
    :cond_8
    new-instance v8, Ljava/lang/StringBuilder;

    .line 217
    .line 218
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 219
    .line 220
    .line 221
    const-string v9, "createIconBitmap scale out of range, restore scale"

    .line 222
    .line 223
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    const-string v9, "=="

    .line 230
    .line 231
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v8

    .line 241
    invoke-static {v10, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    .line 243
    .line 244
    move v14, v3

    .line 245
    :cond_9
    add-int/2addr v7, v12

    .line 246
    add-int/2addr v11, v13

    .line 247
    invoke-virtual {v2, v12, v13, v7, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 251
    .line 252
    .line 253
    div-int/lit8 v6, v6, 0x2

    .line 254
    .line 255
    int-to-float v3, v6

    .line 256
    invoke-virtual {v1, v14, v14, v3, v3}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getSaveCount()I

    .line 263
    .line 264
    .line 265
    move-result v6

    .line 266
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 267
    .line 268
    .line 269
    move/from16 v6, v16

    .line 270
    .line 271
    if-ne v4, v6, :cond_a

    .line 272
    .line 273
    if-eqz v5, :cond_a

    .line 274
    .line 275
    invoke-virtual {v0}, Ls1/b;->P()Ls1/m0;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    invoke-virtual {v4, v5, v1}, Ls1/m0;->b(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 283
    .line 284
    .line 285
    invoke-virtual {v1, v14, v14, v3, v3}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 292
    .line 293
    .line 294
    :cond_a
    :goto_2
    iget-object v0, v0, Ls1/b;->g:Landroid/graphics/Rect;

    .line 295
    .line 296
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 297
    .line 298
    .line 299
    return-void
.end method

.method public static E(I)I
    .locals 1

    .line 1
    const v0, 0x3ee353f8    # 0.444f

    .line 2
    .line 3
    .line 4
    int-to-float p0, p0

    .line 5
    mul-float/2addr p0, v0

    .line 6
    float-to-int p0, p0

    .line 7
    return p0
.end method

.method public static I(I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x1080093

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Landroid/content/res/Resources;->getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public static M()Z
    .locals 1

    .line 1
    sget-boolean v0, Ls1/b;->v:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic b(Ls1/b;Landroid/graphics/drawable/Drawable;FILandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ls1/b;->c0(Landroid/graphics/drawable/Drawable;FILandroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c0(Landroid/graphics/drawable/Drawable;FILandroid/graphics/Canvas;)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v2, p1

    .line 4
    move v3, p2

    .line 5
    move v4, p3

    .line 6
    move-object v1, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Ls1/b;->D(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FILandroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private f0(Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;[F)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance p2, Ls1/S;

    .line 6
    .line 7
    iget p0, p0, Ls1/b;->m:I

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ls1/S;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ls1/S;->c(Landroid/graphics/drawable/Drawable;)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 p2, 0x0

    .line 17
    aput p0, p3, p2

    .line 18
    .line 19
    return-object p1
.end method

.method private g(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-direct {p0, p1, v1, v0}, Ls1/b;->f0(Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;[F)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v1, 0x0

    .line 10
    aget v2, v0, v1

    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    move v3, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget v3, p2, Ls1/b$c;->c:I

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1, v2, v3}, Ls1/b;->n(Landroid/graphics/drawable/Drawable;FI)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    iget-object v3, p2, Ls1/b$c;->f:Ljava/lang/Integer;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-static {v2}, Ls1/l;->a(Landroid/graphics/Bitmap;)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    :goto_1
    invoke-static {v2, v3}, Ls1/d;->p(Landroid/graphics/Bitmap;I)Ls1/d;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    instance-of v5, p1, Ls1/d$a;

    .line 42
    .line 43
    if-eqz v5, :cond_2

    .line 44
    .line 45
    check-cast p1, Ls1/d$a;

    .line 46
    .line 47
    aget v0, v0, v1

    .line 48
    .line 49
    invoke-interface {p1, v2, v3, p0, v0}, Ls1/d$a;->b(Landroid/graphics/Bitmap;ILs1/b;F)Ls1/d;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    :cond_2
    invoke-virtual {p0, p2}, Ls1/b;->F(Ls1/b$c;)Lcom/android/launcher3/util/p0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v4, p0}, Ls1/d;->t(Lcom/android/launcher3/util/p0;)Ls1/d;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public static h0(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ls1/b;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method public static i0(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ls1/b;->v:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public B(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/AdaptiveIconDrawable;
    .locals 6

    .line 1
    new-instance v1, Ls1/b$b;

    .line 2
    .line 3
    invoke-direct {v1, p1}, Ls1/b$b;-><init>(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/high16 p1, 0x40000000    # 2.0f

    .line 11
    .line 12
    mul-float/2addr p1, p0

    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    add-float/2addr p1, v0

    .line 16
    div-float v2, p0, p1

    .line 17
    .line 18
    new-instance p0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 19
    .line 20
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    .line 21
    .line 22
    const/high16 v0, -0x1000000

    .line 23
    .line 24
    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Landroid/graphics/drawable/InsetDrawable;

    .line 28
    .line 29
    move v3, v2

    .line 30
    move v4, v2

    .line 31
    move v5, v2

    .line 32
    invoke-direct/range {v0 .. v5}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;FFFF)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0, p1, v0}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method protected C(Landroid/graphics/Canvas;Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Path;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1, p3}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 12
    .line 13
    .line 14
    const/high16 p0, -0x1000000

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    return-void
.end method

.method public F(Ls1/b$c;)Lcom/android/launcher3/util/p0;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-boolean v1, p1, Ls1/b$c;->a:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-interface {v0, v1}, Lcom/android/launcher3/util/p0;->b(I)Lcom/android/launcher3/util/p0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_0
    iget-object v1, p1, Ls1/b$c;->e:Lcom/android/launcher3/util/N2;

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    iget-object p1, p1, Ls1/b$c;->d:Landroid/os/UserHandle;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ls1/b;->a0(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :cond_1
    if-eqz v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/N2;->a(Lcom/android/launcher3/util/p0;)Lcom/android/launcher3/util/p0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_2
    return-object v0
.end method

.method public J()I
    .locals 0

    .line 1
    iget p0, p0, Ls1/b;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public L()F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public P()Ls1/m0;
    .locals 2

    .line 1
    iget-object v0, p0, Ls1/b;->o:Ls1/m0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ls1/m0;

    .line 6
    .line 7
    iget v1, p0, Ls1/b;->m:I

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ls1/m0;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ls1/b;->o:Ls1/m0;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ls1/b;->o:Ls1/m0;

    .line 15
    .line 16
    return-object p0
.end method

.method public T(Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Rect;)Landroid/graphics/Path;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getIconMask()Landroid/graphics/Path;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public U()Ls1/U;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/b;->n:Ls1/U;

    .line 2
    .line 3
    return-object p0
.end method

.method protected a0(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/os/UserHandle;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ls1/b;->h:Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/android/launcher3/util/N2;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Ls1/b$d;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-direct {v1, v2}, Ls1/b$d;-><init>(Ls1/c;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ls1/b;->k:Landroid/content/pm/PackageManager;

    .line 22
    .line 23
    invoke-virtual {v2, v1, p1}, Landroid/content/pm/PackageManager;->getUserBadgedIcon(Landroid/graphics/drawable/Drawable;Landroid/os/UserHandle;)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-eq v1, v2, :cond_0

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v1, 0x0

    .line 32
    :goto_0
    new-instance v2, Lcom/android/launcher3/util/N2;

    .line 33
    .line 34
    invoke-direct {v2, p1, v1}, Lcom/android/launcher3/util/N2;-><init>(Landroid/os/UserHandle;I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ls1/b;->h:Landroid/util/SparseArray;

    .line 38
    .line 39
    invoke-virtual {p0, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-object v2

    .line 43
    :cond_1
    return-object v1
.end method

.method public b0()Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/b;->p:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 6
    .line 7
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x4

    .line 18
    invoke-virtual {p0, v0, v1}, Ls1/b;->w(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ls1/b;->p:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ls1/b;->p:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    return-object p0
.end method

.method protected c()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ls1/b;->q:I

    .line 3
    .line 4
    return-void
.end method

.method public close()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/b;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Landroid/graphics/drawable/Drawable;)Ls1/d;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public d0(Ls1/T;)Ls1/d;
    .locals 1

    .line 1
    iget v0, p0, Ls1/b;->l:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ls1/T;->g(I)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ls1/b;->d(Landroid/graphics/drawable/Drawable;)Ls1/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x21
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p2, Ls1/b$c;->d:Landroid/os/UserHandle;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p2, Ls1/b$c;->d:Landroid/os/UserHandle;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x3e7

    .line 18
    .line 19
    if-ne v1, v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ls1/b;->k:Landroid/content/pm/PackageManager;

    .line 22
    .line 23
    iget-object v1, p2, Ls1/b$c;->d:Landroid/os/UserHandle;

    .line 24
    .line 25
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getUserBadgedIcon(Landroid/graphics/drawable/Drawable;Landroid/os/UserHandle;)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_0
    instance-of v0, p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    sget-boolean v0, Ls1/b;->w:Z

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-direct {p0, p1, p2}, Ls1/b;->g(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    const/4 v0, 0x1

    .line 43
    new-array v0, v0, [F

    .line 44
    .line 45
    if-eqz p2, :cond_2

    .line 46
    .line 47
    iget-boolean v1, p2, Ls1/b$c;->b:Z

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    instance-of v1, p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Ls1/b;->B(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    :cond_2
    invoke-virtual {p0, p1, v0}, Ls1/b;->e0(Landroid/graphics/drawable/Drawable;[F)Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const/4 v1, 0x0

    .line 70
    aget v2, v0, v1

    .line 71
    .line 72
    if-nez p2, :cond_3

    .line 73
    .line 74
    const/4 v3, 0x2

    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget v3, p2, Ls1/b$c;->c:I

    .line 77
    .line 78
    :goto_0
    invoke-virtual {p0, p1, v2, v3}, Ls1/b;->n(Landroid/graphics/drawable/Drawable;FI)Landroid/graphics/Bitmap;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    if-eqz p2, :cond_4

    .line 83
    .line 84
    iget-object v3, p2, Ls1/b$c;->f:Ljava/lang/Integer;

    .line 85
    .line 86
    if-eqz v3, :cond_4

    .line 87
    .line 88
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    goto :goto_1

    .line 93
    :cond_4
    invoke-static {v2}, Ls1/l;->a(Landroid/graphics/Bitmap;)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    :goto_1
    invoke-static {v2, v3}, Ls1/d;->p(Landroid/graphics/Bitmap;I)Ls1/d;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    instance-of v5, p1, Ls1/d$a;

    .line 102
    .line 103
    if-eqz v5, :cond_5

    .line 104
    .line 105
    check-cast p1, Ls1/d$a;

    .line 106
    .line 107
    aget v0, v0, v1

    .line 108
    .line 109
    invoke-interface {p1, v2, v3, p0, v0}, Ls1/d$a;->b(Landroid/graphics/Bitmap;ILs1/b;F)Ls1/d;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    goto :goto_3

    .line 114
    :cond_5
    sget-boolean v0, Ls1/T;->h:Z

    .line 115
    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    iget-object v0, p0, Ls1/b;->n:Ls1/U;

    .line 119
    .line 120
    if-eqz v0, :cond_7

    .line 121
    .line 122
    if-eqz p1, :cond_7

    .line 123
    .line 124
    invoke-static {}, Ls1/b;->M()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_7

    .line 129
    .line 130
    iget-object v0, p0, Ls1/b;->n:Ls1/U;

    .line 131
    .line 132
    if-nez p2, :cond_6

    .line 133
    .line 134
    const/4 v1, 0x0

    .line 135
    goto :goto_2

    .line 136
    :cond_6
    iget-object v1, p2, Ls1/b$c;->g:Ls1/n0;

    .line 137
    .line 138
    :goto_2
    invoke-interface {v0, p1, v4, p0, v1}, Ls1/U;->d(Landroid/graphics/drawable/AdaptiveIconDrawable;Ls1/d;Ls1/b;Ls1/n0;)Ls1/p0;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {v4, p1}, Ls1/d;->r(Ls1/p0;)V

    .line 143
    .line 144
    .line 145
    :cond_7
    :goto_3
    invoke-virtual {p0, p2}, Ls1/b;->F(Ls1/b$c;)Lcom/android/launcher3/util/p0;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {v4, p0}, Ls1/d;->t(Lcom/android/launcher3/util/p0;)Ls1/d;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    return-object p0
.end method

.method protected e0(Landroid/graphics/drawable/Drawable;[F)Landroid/graphics/drawable/AdaptiveIconDrawable;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    const v1, 0x3f6b851f    # 0.92f

    .line 7
    .line 8
    .line 9
    aput v1, p2, v0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ls1/b;->l0(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public g0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ls1/b;->p:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    return-void
.end method

.method public j(Landroid/graphics/drawable/Drawable;F)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ls1/b;->n(Landroid/graphics/drawable/Drawable;FI)Landroid/graphics/Bitmap;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public j0(I)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xff

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    :cond_0
    iput p1, p0, Ls1/b;->q:I

    .line 11
    .line 12
    return-void
.end method

.method public k0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ls1/b;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public l0(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/AdaptiveIconDrawable;
    .locals 4

    .line 1
    instance-of v0, p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    new-instance v0, Ls1/b$a;

    .line 9
    .line 10
    invoke-direct {v0}, Ls1/b$a;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 14
    .line 15
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    .line 16
    .line 17
    iget v3, p0, Ls1/b;->q:I

    .line 18
    .line 19
    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v1, v2, v0}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    const/4 v3, 0x1

    .line 27
    invoke-virtual {v1, v2, v2, v3, v3}, Landroid/graphics/drawable/AdaptiveIconDrawable;->setBounds(IIII)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ls1/S;

    .line 31
    .line 32
    iget v3, p0, Ls1/b;->m:I

    .line 33
    .line 34
    invoke-direct {v2, v3}, Ls1/S;-><init>(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, p1}, Ls1/S;->c(Landroid/graphics/drawable/Drawable;)F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    sget v3, Ls1/b;->t:F

    .line 42
    .line 43
    mul-float/2addr v2, v3

    .line 44
    invoke-direct {p0, p1, v2}, Ls1/b;->A(Landroid/graphics/drawable/Drawable;F)Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/DrawableWrapper;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    return-object v1
.end method

.method public n(Landroid/graphics/drawable/Drawable;FI)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    iget v0, p0, Ls1/b;->m:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq p3, v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    if-eq p3, v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    if-eq p3, v1, :cond_0

    .line 11
    .line 12
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 13
    .line 14
    invoke-static {v0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    move-object v6, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    new-instance v1, Ls1/a;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2, p3}, Ls1/a;-><init>(Ls1/b;Landroid/graphics/drawable/Drawable;FI)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v0, v1}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 31
    .line 32
    invoke-static {v0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    goto :goto_0

    .line 37
    :goto_1
    if-nez p1, :cond_2

    .line 38
    .line 39
    return-object v6

    .line 40
    :cond_2
    iget-object v0, p0, Ls1/b;->j:Landroid/graphics/Canvas;

    .line 41
    .line 42
    invoke-virtual {v0, v6}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ls1/b;->j:Landroid/graphics/Canvas;

    .line 46
    .line 47
    move-object v1, p0

    .line 48
    move-object v3, p1

    .line 49
    move v4, p2

    .line 50
    move v5, p3

    .line 51
    invoke-direct/range {v1 .. v6}, Ls1/b;->D(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FILandroid/graphics/Bitmap;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, v1, Ls1/b;->j:Landroid/graphics/Canvas;

    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    invoke-virtual {p0, p1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 58
    .line 59
    .line 60
    return-object v6
.end method

.method public t(Landroid/content/Intent$ShortcutIconResource;)Ls1/d;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ls1/b;->k:Landroid/content/pm/PackageManager;

    .line 3
    .line 4
    iget-object v2, p1, Landroid/content/Intent$ShortcutIconResource;->packageName:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Landroid/content/Intent$ShortcutIconResource;->resourceName:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, p1, v0, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget v2, p0, Ls1/b;->l:I

    .line 19
    .line 20
    invoke-virtual {v1, p1, v2}, Landroid/content/res/Resources;->getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ls1/b;->d(Landroid/graphics/drawable/Drawable;)Ls1/d;

    .line 25
    .line 26
    .line 27
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return-object p0

    .line 29
    :catch_0
    :cond_0
    return-object v0
.end method

.method public v(Landroid/graphics/Bitmap;)Ls1/d;
    .locals 2

    .line 1
    iget v0, p0, Ls1/b;->m:I

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ls1/b;->m:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 18
    .line 19
    iget-object v1, p0, Ls1/b;->i:Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 26
    .line 27
    .line 28
    const/high16 p1, 0x3f800000    # 1.0f

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Ls1/b;->j(Landroid/graphics/drawable/Drawable;F)Landroid/graphics/Bitmap;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :cond_1
    invoke-static {p1}, Ls1/l;->a(Landroid/graphics/Bitmap;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-static {p1, p0}, Ls1/d;->p(Landroid/graphics/Bitmap;I)Ls1/d;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public w(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0}, Ls1/b;->e0(Landroid/graphics/drawable/Drawable;[F)Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v1, 0x0

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const v1, 0x3f6e147b    # 0.93f

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0, p1, v0, p2}, Ls1/b;->n(Landroid/graphics/drawable/Drawable;FI)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
