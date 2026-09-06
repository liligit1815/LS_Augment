.class public Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;
.super Lcom/android/launcher3/streamer/colorpicker/a;
.source "AlphaSliderView.java"


# instance fields
.field private r:Landroid/graphics/Bitmap;

.field private s:Landroid/graphics/Canvas;

.field private final t:Landroid/graphics/drawable/Drawable;

.field private final u:Landroid/graphics/Paint;

.field private final v:F

.field private final w:Landroid/graphics/Paint;

.field private final x:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/streamer/colorpicker/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Lcom/android/launcher3/streamer/colorpicker/b$a;

    invoke-direct {p2, p1}, Lcom/android/launcher3/streamer/colorpicker/b$a;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2}, Lcom/android/launcher3/streamer/colorpicker/b$a;->d()Lcom/android/launcher3/streamer/colorpicker/b;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->t:Landroid/graphics/drawable/Drawable;

    .line 4
    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->w:Landroid/graphics/Paint;

    .line 5
    new-instance p2, Landroid/graphics/Paint;

    const/16 p3, 0x101

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->u:Landroid/graphics/Paint;

    const p3, 0x7f04006f

    .line 6
    invoke-static {p1, p3}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f07010d

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    .line 8
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07010c

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->v:F

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070109

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->x:F

    return-void
.end method


# virtual methods
.method protected c()I
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/a;->m:I

    .line 5
    .line 6
    invoke-static {v1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/streamer/colorpicker/a;->j:F

    .line 10
    .line 11
    const/high16 v1, 0x437f0000    # 255.0f

    .line 12
    .line 13
    mul-float/2addr p0, v1

    .line 14
    float-to-int p0, p0

    .line 15
    invoke-static {p0, v0}, Landroid/graphics/Color;->HSVToColor(I[F)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method protected e(Landroid/graphics/Paint;)V
    .locals 10

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/a;->m:I

    .line 5
    .line 6
    invoke-static {v1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1, v0}, Landroid/graphics/Color;->HSVToColor(I[F)I

    .line 11
    .line 12
    .line 13
    move-result v7

    .line 14
    const/16 v1, 0xff

    .line 15
    .line 16
    invoke-static {v1, v0}, Landroid/graphics/Color;->HSVToColor(I[F)I

    .line 17
    .line 18
    .line 19
    move-result v8

    .line 20
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v5, v0

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    int-to-float v6, p0

    .line 32
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method protected g(I)F
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 p1, 0x437f0000    # 255.0f

    .line 7
    .line 8
    div-float/2addr p0, p1

    .line 9
    return p0
.end method

.method protected i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/a;->h:LT1/h;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/streamer/colorpicker/a;->m:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, LT1/h;->a(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->t:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->s:Landroid/graphics/Canvas;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->s:Landroid/graphics/Canvas;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/graphics/Canvas;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->t:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->s:Landroid/graphics/Canvas;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->r:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/a;->i:F

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iget v3, p0, Lcom/android/launcher3/streamer/colorpicker/a;->k:I

    .line 35
    .line 36
    sub-int/2addr v2, v3

    .line 37
    int-to-float v2, v2

    .line 38
    const/high16 v3, 0x40000000    # 2.0f

    .line 39
    .line 40
    div-float/2addr v2, v3

    .line 41
    iget-object v4, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->w:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1, v2, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 44
    .line 45
    .line 46
    invoke-super {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/a;->onDraw(Landroid/graphics/Canvas;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/a;->j:F

    .line 55
    .line 56
    const/high16 v2, 0x42c80000    # 100.0f

    .line 57
    .line 58
    mul-float/2addr v1, v2

    .line 59
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v1, "%"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->u:Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iget v2, p0, Lcom/android/launcher3/streamer/colorpicker/a;->j:F

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    int-to-float v4, v4

    .line 88
    iget v5, p0, Lcom/android/launcher3/streamer/colorpicker/a;->i:F

    .line 89
    .line 90
    mul-float v6, v5, v3

    .line 91
    .line 92
    sub-float/2addr v4, v6

    .line 93
    mul-float/2addr v2, v4

    .line 94
    add-float/2addr v2, v5

    .line 95
    div-float/2addr v1, v3

    .line 96
    sub-float/2addr v2, v1

    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/a;->k:I

    .line 102
    .line 103
    sub-int/2addr v1, v4

    .line 104
    int-to-float v1, v1

    .line 105
    div-float/2addr v1, v3

    .line 106
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->x:F

    .line 107
    .line 108
    sub-float/2addr v1, v4

    .line 109
    iget-object v4, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->u:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-virtual {p1, v0, v2, v1, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 112
    .line 113
    .line 114
    iget v0, p0, Lcom/android/launcher3/streamer/colorpicker/a;->i:F

    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    iget v2, p0, Lcom/android/launcher3/streamer/colorpicker/a;->k:I

    .line 121
    .line 122
    add-int/2addr v1, v2

    .line 123
    int-to-float v1, v1

    .line 124
    div-float/2addr v1, v3

    .line 125
    iget v2, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->v:F

    .line 126
    .line 127
    add-float/2addr v1, v2

    .line 128
    iget-object v2, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->u:Landroid/graphics/Paint;

    .line 129
    .line 130
    const-string v4, "0%"

    .line 131
    .line 132
    invoke-virtual {p1, v4, v0, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->u:Landroid/graphics/Paint;

    .line 136
    .line 137
    const-string v1, "100%"

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    int-to-float v2, v2

    .line 148
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/a;->i:F

    .line 149
    .line 150
    sub-float/2addr v2, v4

    .line 151
    sub-float/2addr v2, v0

    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/a;->k:I

    .line 157
    .line 158
    add-int/2addr v0, v4

    .line 159
    int-to-float v0, v0

    .line 160
    div-float/2addr v0, v3

    .line 161
    iget v3, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->v:F

    .line 162
    .line 163
    add-float/2addr v0, v3

    .line 164
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->u:Landroid/graphics/Paint;

    .line 165
    .line 166
    invoke-virtual {p1, v1, v2, v0, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/streamer/colorpicker/a;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    int-to-float p1, p1

    .line 5
    const/high16 p2, 0x40000000    # 2.0f

    .line 6
    .line 7
    iget p3, p0, Lcom/android/launcher3/streamer/colorpicker/a;->i:F

    .line 8
    .line 9
    mul-float/2addr p3, p2

    .line 10
    sub-float/2addr p1, p3

    .line 11
    float-to-int p1, p1

    .line 12
    iget p2, p0, Lcom/android/launcher3/streamer/colorpicker/a;->k:I

    .line 13
    .line 14
    sget-object p3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 15
    .line 16
    invoke-static {p1, p2, p3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->r:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    new-instance p1, Landroid/graphics/Canvas;

    .line 23
    .line 24
    iget-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->r:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    invoke-direct {p1, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;->s:Landroid/graphics/Canvas;

    .line 30
    .line 31
    return-void
.end method
