.class public Ls1/b0;
.super Landroid/graphics/drawable/Drawable;
.source "MonochromeIconFactory.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x21
.end annotation


# instance fields
.field private final a:Landroid/graphics/Bitmap;

.field private final b:Landroid/graphics/Canvas;

.field private final c:Landroid/graphics/Paint;

.field private final d:Landroid/graphics/Bitmap;

.field private final e:Landroid/graphics/Canvas;

.field private final f:[B

.field private final g:I

.field private final h:I

.field private final i:Landroid/graphics/Paint;

.field private final j:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    mul-float/2addr v0, v1

    .line 11
    const/high16 v1, 0x3f800000    # 1.0f

    .line 12
    .line 13
    add-float/2addr v0, v1

    .line 14
    div-float/2addr v1, v0

    .line 15
    mul-int/lit8 v0, p1, 0x2

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    mul-float/2addr v0, v1

    .line 19
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ls1/b0;->g:I

    .line 24
    .line 25
    mul-int v1, v0, v0

    .line 26
    .line 27
    new-array v1, v1, [B

    .line 28
    .line 29
    iput-object v1, p0, Ls1/b0;->f:[B

    .line 30
    .line 31
    sub-int p1, v0, p1

    .line 32
    .line 33
    mul-int/2addr p1, v0

    .line 34
    const/4 v1, 0x2

    .line 35
    div-int/2addr p1, v1

    .line 36
    iput p1, p0, Ls1/b0;->h:I

    .line 37
    .line 38
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 39
    .line 40
    invoke-static {v0, v0, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Ls1/b0;->a:Landroid/graphics/Bitmap;

    .line 45
    .line 46
    new-instance v2, Landroid/graphics/Canvas;

    .line 47
    .line 48
    invoke-direct {v2, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 49
    .line 50
    .line 51
    iput-object v2, p0, Ls1/b0;->b:Landroid/graphics/Canvas;

    .line 52
    .line 53
    sget-object p1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 54
    .line 55
    invoke-static {v0, v0, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Ls1/b0;->d:Landroid/graphics/Bitmap;

    .line 60
    .line 61
    new-instance v2, Landroid/graphics/Canvas;

    .line 62
    .line 63
    invoke-direct {v2, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 64
    .line 65
    .line 66
    iput-object v2, p0, Ls1/b0;->e:Landroid/graphics/Canvas;

    .line 67
    .line 68
    new-instance p1, Landroid/graphics/Paint;

    .line 69
    .line 70
    invoke-direct {p1, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Ls1/b0;->i:Landroid/graphics/Paint;

    .line 74
    .line 75
    const/4 v2, -0x1

    .line 76
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    .line 78
    .line 79
    new-instance p1, Landroid/graphics/Rect;

    .line 80
    .line 81
    const/4 v2, 0x0

    .line 82
    invoke-direct {p1, v2, v2, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Ls1/b0;->j:Landroid/graphics/Rect;

    .line 86
    .line 87
    new-instance p1, Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-direct {p1, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Ls1/b0;->c:Landroid/graphics/Paint;

    .line 93
    .line 94
    sget-object p0, Landroid/graphics/BlendMode;->SRC:Landroid/graphics/BlendMode;

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setBlendMode(Landroid/graphics/BlendMode;)V

    .line 97
    .line 98
    .line 99
    new-instance p0, Landroid/graphics/ColorMatrix;

    .line 100
    .line 101
    invoke-direct {p0}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/graphics/ColorMatrix;->getArray()[F

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    const/16 v0, 0x11

    .line 109
    .line 110
    const v1, 0x3eaaa64c    # 0.3333f

    .line 111
    .line 112
    .line 113
    aput v1, p0, v0

    .line 114
    .line 115
    const/16 v0, 0x10

    .line 116
    .line 117
    aput v1, p0, v0

    .line 118
    .line 119
    const/16 v0, 0xf

    .line 120
    .line 121
    aput v1, p0, v0

    .line 122
    .line 123
    const/16 v0, 0x13

    .line 124
    .line 125
    const/4 v1, 0x0

    .line 126
    aput v1, p0, v0

    .line 127
    .line 128
    const/16 v0, 0x12

    .line 129
    .line 130
    aput v1, p0, v0

    .line 131
    .line 132
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    .line 133
    .line 134
    invoke-direct {v0, p0}, Landroid/graphics/ColorMatrixColorFilter;-><init>([F)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method private a(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Ls1/b0;->g:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v1, v1, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ls1/b0;->b:Landroid/graphics/Canvas;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private b()V
    .locals 12

    .line 1
    iget-object v0, p0, Ls1/b0;->e:Landroid/graphics/Canvas;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/b0;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget-object v3, p0, Ls1/b0;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ls1/b0;->f:[B

    .line 12
    .line 13
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ls1/b0;->d:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ls1/b0;->f:[B

    .line 26
    .line 27
    array-length v2, v1

    .line 28
    const/16 v3, 0xff

    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    move v6, v3

    .line 32
    move v5, v4

    .line 33
    move v7, v5

    .line 34
    :goto_0
    if-ge v5, v2, :cond_0

    .line 35
    .line 36
    aget-byte v8, v1, v5

    .line 37
    .line 38
    and-int/2addr v8, v3

    .line 39
    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    add-int/lit8 v5, v5, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    if-ge v6, v7, :cond_9

    .line 51
    .line 52
    sub-int/2addr v7, v6

    .line 53
    int-to-float v1, v7

    .line 54
    move v2, v4

    .line 55
    move v5, v2

    .line 56
    :goto_1
    iget v7, p0, Ls1/b0;->h:I

    .line 57
    .line 58
    const/4 v8, 0x1

    .line 59
    if-ge v2, v7, :cond_1

    .line 60
    .line 61
    iget-object v7, p0, Ls1/b0;->f:[B

    .line 62
    .line 63
    aget-byte v9, v7, v2

    .line 64
    .line 65
    and-int/2addr v9, v3

    .line 66
    add-int/2addr v5, v9

    .line 67
    array-length v9, v7

    .line 68
    sub-int/2addr v9, v8

    .line 69
    sub-int/2addr v9, v2

    .line 70
    aget-byte v7, v7, v9

    .line 71
    .line 72
    and-int/2addr v7, v3

    .line 73
    add-int/2addr v5, v7

    .line 74
    add-int/lit8 v2, v2, 0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    int-to-float v2, v5

    .line 78
    int-to-float v5, v7

    .line 79
    const/high16 v7, 0x40000000    # 2.0f

    .line 80
    .line 81
    mul-float/2addr v5, v7

    .line 82
    div-float/2addr v2, v5

    .line 83
    int-to-float v5, v6

    .line 84
    sub-float/2addr v2, v5

    .line 85
    div-float/2addr v2, v1

    .line 86
    const/high16 v5, 0x3f000000    # 0.5f

    .line 87
    .line 88
    cmpl-float v2, v2, v5

    .line 89
    .line 90
    if-lez v2, :cond_2

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    move v8, v4

    .line 94
    :goto_2
    move v2, v4

    .line 95
    :goto_3
    iget-object v5, p0, Ls1/b0;->f:[B

    .line 96
    .line 97
    array-length v7, v5

    .line 98
    if-ge v2, v7, :cond_4

    .line 99
    .line 100
    aget-byte v5, v5, v2

    .line 101
    .line 102
    and-int/2addr v5, v3

    .line 103
    sub-int/2addr v5, v6

    .line 104
    mul-int/2addr v5, v3

    .line 105
    int-to-float v5, v5

    .line 106
    div-float/2addr v5, v1

    .line 107
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    iget-object v7, p0, Ls1/b0;->f:[B

    .line 112
    .line 113
    if-eqz v8, :cond_3

    .line 114
    .line 115
    rsub-int v5, v5, 0xff

    .line 116
    .line 117
    :cond_3
    int-to-byte v5, v5

    .line 118
    aput-byte v5, v7, v2

    .line 119
    .line 120
    add-int/lit8 v2, v2, 0x1

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_4
    move v1, v4

    .line 124
    :goto_4
    iget-object v2, p0, Ls1/b0;->f:[B

    .line 125
    .line 126
    array-length v5, v2

    .line 127
    if-ge v1, v5, :cond_8

    .line 128
    .line 129
    aget-byte v5, v2, v1

    .line 130
    .line 131
    and-int/2addr v5, v3

    .line 132
    const-wide/high16 v6, 0x4060000000000000L    # 128.0

    .line 133
    .line 134
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    .line 135
    .line 136
    const/16 v10, 0x80

    .line 137
    .line 138
    if-le v5, v10, :cond_5

    .line 139
    .line 140
    add-int/lit8 v10, v5, -0x80

    .line 141
    .line 142
    int-to-double v10, v10

    .line 143
    div-double/2addr v10, v6

    .line 144
    sub-double/2addr v8, v10

    .line 145
    rsub-int v5, v5, 0xff

    .line 146
    .line 147
    int-to-double v5, v5

    .line 148
    mul-double/2addr v8, v5

    .line 149
    double-to-int v5, v8

    .line 150
    rsub-int v5, v5, 0xff

    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_5
    rsub-int v10, v5, 0x80

    .line 154
    .line 155
    int-to-double v10, v10

    .line 156
    div-double/2addr v10, v6

    .line 157
    sub-double/2addr v8, v10

    .line 158
    int-to-double v5, v5

    .line 159
    mul-double/2addr v8, v5

    .line 160
    double-to-int v5, v8

    .line 161
    :goto_5
    if-le v5, v3, :cond_6

    .line 162
    .line 163
    move v5, v3

    .line 164
    goto :goto_6

    .line 165
    :cond_6
    if-gez v5, :cond_7

    .line 166
    .line 167
    move v5, v4

    .line 168
    :cond_7
    :goto_6
    int-to-byte v5, v5

    .line 169
    aput-byte v5, v2, v1

    .line 170
    .line 171
    add-int/lit8 v1, v1, 0x1

    .line 172
    .line 173
    goto :goto_4

    .line 174
    :cond_8
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Ls1/b0;->d:Landroid/graphics/Bitmap;

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 180
    .line 181
    .line 182
    :cond_9
    return-void
.end method


# virtual methods
.method public c(Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Path;Ljava/lang/Float;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-object v0, p0, Ls1/b0;->b:Landroid/graphics/Canvas;

    .line 2
    .line 3
    const/high16 v1, -0x1000000

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, v0}, Ls1/b0;->a(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-direct {p0, p1}, Ls1/b0;->a(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ls1/b0;->b()V

    .line 23
    .line 24
    .line 25
    new-instance p1, Lu1/a$b;

    .line 26
    .line 27
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    invoke-direct {p1, p0, p2, p3}, Lu1/a$b;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/Path;F)V

    .line 32
    .line 33
    .line 34
    return-object p1
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/b0;->d:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/b0;->j:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object p0, p0, Ls1/b0;->i:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/b0;->i:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/b0;->i:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method
