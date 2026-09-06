.class public Lcom/zte/mifavor/widget/k;
.super Ljava/lang/Object;
.source "InnerShadowHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/k$a;
    }
.end annotation


# instance fields
.field private a:Landroid/graphics/Paint;

.field private b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zte/mifavor/widget/k$a;",
            ">;"
        }
    .end annotation
.end field

.field private c:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/mifavor/widget/k;->c:Landroid/content/Context;

    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/zte/mifavor/widget/k;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/zte/mifavor/widget/k;->f()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private a(Landroid/graphics/Path;Lcom/zte/mifavor/widget/k$a;)Landroid/graphics/Path;
    .locals 4

    .line 1
    new-instance p0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    cmpg-float v3, v0, v2

    .line 25
    .line 26
    if-lez v3, :cond_1

    .line 27
    .line 28
    cmpg-float v2, v1, v2

    .line 29
    .line 30
    if-gtz v2, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget v2, p2, Lcom/zte/mifavor/widget/k$a;->e:F

    .line 34
    .line 35
    const/high16 v3, 0x40000000    # 2.0f

    .line 36
    .line 37
    mul-float/2addr v2, v3

    .line 38
    sub-float v3, v0, v2

    .line 39
    .line 40
    div-float/2addr v3, v0

    .line 41
    sub-float v0, v1, v2

    .line 42
    .line 43
    div-float/2addr v0, v1

    .line 44
    const v1, 0x3ca3d70a    # 0.02f

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    new-instance v1, Landroid/graphics/Matrix;

    .line 56
    .line 57
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {v1, v2, v0, v3, p1}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 69
    .line 70
    .line 71
    iget p1, p2, Lcom/zte/mifavor/widget/k$a;->b:F

    .line 72
    .line 73
    neg-float p1, p1

    .line 74
    iget p2, p2, Lcom/zte/mifavor/widget/k$a;->c:F

    .line 75
    .line 76
    neg-float p2, p2

    .line 77
    invoke-virtual {v1, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    :goto_0
    return-object p0
.end method

.method private b(F)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/k;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 12
    .line 13
    mul-float/2addr p1, p0

    .line 14
    return p1
.end method

.method private e(Landroid/graphics/Canvas;Landroid/graphics/Path;Lcom/zte/mifavor/widget/k$a;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p2, p3}, Lcom/zte/mifavor/widget/k;->a(Landroid/graphics/Path;Lcom/zte/mifavor/widget/k$a;)Landroid/graphics/Path;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    new-instance v1, Landroid/graphics/Path;

    .line 21
    .line 22
    invoke-direct {v1, p2}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    .line 23
    .line 24
    .line 25
    sget-object p2, Landroid/graphics/Path$Op;->DIFFERENCE:Landroid/graphics/Path$Op;

    .line 26
    .line 27
    invoke-virtual {v1, v0, p2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/zte/mifavor/widget/k;->a:Landroid/graphics/Paint;

    .line 31
    .line 32
    iget v0, p3, Lcom/zte/mifavor/widget/k$a;->a:I

    .line 33
    .line 34
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 35
    .line 36
    .line 37
    const p2, 0x3d4ccccd    # 0.05f

    .line 38
    .line 39
    .line 40
    iget v0, p3, Lcom/zte/mifavor/widget/k$a;->d:F

    .line 41
    .line 42
    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    const/4 v0, 0x0

    .line 47
    cmpl-float v0, p2, v0

    .line 48
    .line 49
    if-lez v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/zte/mifavor/widget/k;->a:Landroid/graphics/Paint;

    .line 52
    .line 53
    new-instance v2, Landroid/graphics/BlurMaskFilter;

    .line 54
    .line 55
    sget-object v3, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    .line 56
    .line 57
    invoke-direct {v2, p2, v3}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object p2, p0, Lcom/zte/mifavor/widget/k;->a:Landroid/graphics/Paint;

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 68
    .line 69
    .line 70
    :goto_0
    iget-object p2, p0, Lcom/zte/mifavor/widget/k;->a:Landroid/graphics/Paint;

    .line 71
    .line 72
    iget-object p3, p3, Lcom/zte/mifavor/widget/k$a;->f:Landroid/graphics/BlendMode;

    .line 73
    .line 74
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setBlendMode(Landroid/graphics/BlendMode;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/zte/mifavor/widget/k;->a:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {p1, v1, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    :goto_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private f()V
    .locals 32

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 9
    .line 10
    new-instance v2, Lcom/zte/mifavor/widget/k$a;

    .line 11
    .line 12
    const v3, 0x3e6147ae    # 0.22f

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    const v3, 0x3ee66666    # 0.45f

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 23
    .line 24
    .line 25
    move-result v7

    .line 26
    const/4 v8, 0x0

    .line 27
    const v3, 0x40ffffff    # 7.9999995f

    .line 28
    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    const/4 v5, 0x0

    .line 32
    invoke-direct/range {v2 .. v8}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 39
    .line 40
    new-instance v2, Lcom/zte/mifavor/widget/k$a;

    .line 41
    .line 42
    const v9, -0x40666666    # -1.2f

    .line 43
    .line 44
    .line 45
    invoke-direct {v0, v9}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const v3, -0x4019999a    # -1.8f

    .line 50
    .line 51
    .line 52
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    const v10, 0x3ec28f5c    # 0.38f

    .line 57
    .line 58
    .line 59
    invoke-direct {v0, v10}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    const v3, -0x40b33333    # -0.8f

    .line 64
    .line 65
    .line 66
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    sget-object v17, Landroid/graphics/BlendMode;->SCREEN:Landroid/graphics/BlendMode;

    .line 71
    .line 72
    const v3, -0x79000001

    .line 73
    .line 74
    .line 75
    move-object/from16 v8, v17

    .line 76
    .line 77
    invoke-direct/range {v2 .. v8}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 78
    .line 79
    .line 80
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 84
    .line 85
    new-instance v11, Lcom/zte/mifavor/widget/k$a;

    .line 86
    .line 87
    const v2, 0x3f933333    # 1.15f

    .line 88
    .line 89
    .line 90
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 91
    .line 92
    .line 93
    move-result v13

    .line 94
    const v3, 0x3fd9999a    # 1.7f

    .line 95
    .line 96
    .line 97
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 98
    .line 99
    .line 100
    move-result v14

    .line 101
    invoke-direct {v0, v10}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 102
    .line 103
    .line 104
    move-result v15

    .line 105
    const/high16 v4, -0x40c00000    # -0.75f

    .line 106
    .line 107
    invoke-direct {v0, v4}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 108
    .line 109
    .line 110
    move-result v16

    .line 111
    const v12, -0x3f000001    # -7.9999995f

    .line 112
    .line 113
    .line 114
    invoke-direct/range {v11 .. v17}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 115
    .line 116
    .line 117
    invoke-interface {v1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 121
    .line 122
    new-instance v10, Lcom/zte/mifavor/widget/k$a;

    .line 123
    .line 124
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 125
    .line 126
    .line 127
    move-result v12

    .line 128
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 129
    .line 130
    .line 131
    move-result v13

    .line 132
    const v2, 0x3e8f5c29    # 0.28f

    .line 133
    .line 134
    .line 135
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 136
    .line 137
    .line 138
    move-result v14

    .line 139
    const v3, -0x4099999a    # -0.9f

    .line 140
    .line 141
    .line 142
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 143
    .line 144
    .line 145
    move-result v15

    .line 146
    sget-object v16, Landroid/graphics/BlendMode;->DARKEN:Landroid/graphics/BlendMode;

    .line 147
    .line 148
    const v11, 0x526b6756

    .line 149
    .line 150
    .line 151
    invoke-direct/range {v10 .. v16}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 152
    .line 153
    .line 154
    move-object/from16 v24, v16

    .line 155
    .line 156
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 160
    .line 161
    new-instance v10, Lcom/zte/mifavor/widget/k$a;

    .line 162
    .line 163
    const/high16 v3, 0x3f800000    # 1.0f

    .line 164
    .line 165
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 166
    .line 167
    .line 168
    move-result v12

    .line 169
    const/high16 v3, 0x3fc00000    # 1.5f

    .line 170
    .line 171
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 172
    .line 173
    .line 174
    move-result v13

    .line 175
    const v3, 0x3ea3d70a    # 0.32f

    .line 176
    .line 177
    .line 178
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 179
    .line 180
    .line 181
    move-result v14

    .line 182
    const/high16 v3, -0x40800000    # -1.0f

    .line 183
    .line 184
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 185
    .line 186
    .line 187
    move-result v15

    .line 188
    sget-object v31, Landroid/graphics/BlendMode;->LIGHTEN:Landroid/graphics/BlendMode;

    .line 189
    .line 190
    const v11, 0x3d616161

    .line 191
    .line 192
    .line 193
    move-object/from16 v16, v31

    .line 194
    .line 195
    invoke-direct/range {v10 .. v16}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 196
    .line 197
    .line 198
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 202
    .line 203
    new-instance v10, Lcom/zte/mifavor/widget/k$a;

    .line 204
    .line 205
    invoke-direct {v0, v9}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 206
    .line 207
    .line 208
    move-result v12

    .line 209
    const v4, -0x3ff33333    # -2.2f

    .line 210
    .line 211
    .line 212
    invoke-direct {v0, v4}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 213
    .line 214
    .line 215
    move-result v13

    .line 216
    const v4, 0x3eb33333    # 0.35f

    .line 217
    .line 218
    .line 219
    invoke-direct {v0, v4}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 220
    .line 221
    .line 222
    move-result v14

    .line 223
    const v4, -0x40a66666    # -0.85f

    .line 224
    .line 225
    .line 226
    invoke-direct {v0, v4}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 227
    .line 228
    .line 229
    move-result v15

    .line 230
    sget-object v16, Landroid/graphics/BlendMode;->SOFT_LIGHT:Landroid/graphics/BlendMode;

    .line 231
    .line 232
    const v11, 0x62ffffff

    .line 233
    .line 234
    .line 235
    invoke-direct/range {v10 .. v16}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 236
    .line 237
    .line 238
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 242
    .line 243
    new-instance v25, Lcom/zte/mifavor/widget/k$a;

    .line 244
    .line 245
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 246
    .line 247
    .line 248
    move-result v27

    .line 249
    const/high16 v4, -0x40400000    # -1.5f

    .line 250
    .line 251
    invoke-direct {v0, v4}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 252
    .line 253
    .line 254
    move-result v28

    .line 255
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 256
    .line 257
    .line 258
    move-result v29

    .line 259
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 260
    .line 261
    .line 262
    move-result v30

    .line 263
    const v26, 0x3d616161

    .line 264
    .line 265
    .line 266
    invoke-direct/range {v25 .. v31}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 267
    .line 268
    .line 269
    move-object/from16 v2, v25

    .line 270
    .line 271
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 275
    .line 276
    new-instance v2, Lcom/zte/mifavor/widget/k$a;

    .line 277
    .line 278
    const v3, 0x3f99999a    # 1.2f

    .line 279
    .line 280
    .line 281
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 282
    .line 283
    .line 284
    move-result v6

    .line 285
    const v3, 0x3f666666    # 0.9f

    .line 286
    .line 287
    .line 288
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 289
    .line 290
    .line 291
    move-result v7

    .line 292
    sget-object v8, Landroid/graphics/BlendMode;->OVERLAY:Landroid/graphics/BlendMode;

    .line 293
    .line 294
    const/high16 v3, 0x1a000000

    .line 295
    .line 296
    const/4 v4, 0x0

    .line 297
    const/4 v5, 0x0

    .line 298
    invoke-direct/range {v2 .. v8}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 299
    .line 300
    .line 301
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 305
    .line 306
    new-instance v11, Lcom/zte/mifavor/widget/k$a;

    .line 307
    .line 308
    const v2, 0x3e3851ec    # 0.18f

    .line 309
    .line 310
    .line 311
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 312
    .line 313
    .line 314
    move-result v15

    .line 315
    const v2, -0x41333333    # -0.4f

    .line 316
    .line 317
    .line 318
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 319
    .line 320
    .line 321
    move-result v16

    .line 322
    const v12, 0x46ffffff

    .line 323
    .line 324
    .line 325
    const/4 v13, 0x0

    .line 326
    const/4 v14, 0x0

    .line 327
    invoke-direct/range {v11 .. v17}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 328
    .line 329
    .line 330
    invoke-interface {v1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    iget-object v1, v0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 334
    .line 335
    new-instance v18, Lcom/zte/mifavor/widget/k$a;

    .line 336
    .line 337
    const v2, 0x3f333333    # 0.7f

    .line 338
    .line 339
    .line 340
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 341
    .line 342
    .line 343
    move-result v21

    .line 344
    const v2, 0x3e75c28f    # 0.24f

    .line 345
    .line 346
    .line 347
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 348
    .line 349
    .line 350
    move-result v22

    .line 351
    const v2, -0x40f33333    # -0.55f

    .line 352
    .line 353
    .line 354
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;->b(F)F

    .line 355
    .line 356
    .line 357
    move-result v23

    .line 358
    const v19, 0x156c6248

    .line 359
    .line 360
    .line 361
    const/16 v20, 0x0

    .line 362
    .line 363
    invoke-direct/range {v18 .. v24}, Lcom/zte/mifavor/widget/k$a;-><init>(IFFFFLandroid/graphics/BlendMode;)V

    .line 364
    .line 365
    .line 366
    move-object/from16 v0, v18

    .line 367
    .line 368
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    return-void
.end method


# virtual methods
.method protected c(Landroid/graphics/Canvas;Landroid/graphics/Path;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/k;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/k;->d(Landroid/graphics/Canvas;Landroid/graphics/Path;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected d(Landroid/graphics/Canvas;Landroid/graphics/Path;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Path;",
            "Ljava/util/List<",
            "Lcom/zte/mifavor/widget/k$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/graphics/Path;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    :goto_0
    if-ltz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/zte/mifavor/widget/k$a;

    .line 31
    .line 32
    invoke-direct {p0, p1, p2, v1}, Lcom/zte/mifavor/widget/k;->e(Landroid/graphics/Canvas;Landroid/graphics/Path;Lcom/zte/mifavor/widget/k$a;)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    :goto_1
    return-void
.end method

.method protected g(ZZ)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/zte/mifavor/widget/k;->f()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method
