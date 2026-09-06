.class public Ln1/d;
.super Ljava/lang/Object;
.source "DragPreviewProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ln1/d$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/graphics/Rect;

.field protected final b:Landroid/view/View;

.field public final c:I

.field public final d:I

.field public e:Landroid/graphics/Bitmap;

.field private f:Z

.field private g:Landroid/graphics/Bitmap;

.field private h:Ln1/d$a;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Ln1/d;-><init>(Landroid/view/View;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/content/Context;)V
    .locals 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Ln1/d;->a:Landroid/graphics/Rect;

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Ln1/d;->f:Z

    .line 5
    iput-object p1, p0, Ln1/d;->b:Landroid/view/View;

    .line 6
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f070144

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Ln1/d;->d:I

    .line 7
    iput p1, p0, Ln1/d;->c:I

    .line 8
    invoke-static {p2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p1

    iget-boolean p1, p1, Lcom/android/launcher3/r4;->Y:Z

    if-nez p1, :cond_0

    invoke-static {}, Lm1/a;->a()Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    iput-boolean v0, p0, Ln1/d;->f:Z

    return-void
.end method

.method public static synthetic a(Ln1/d;FLandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ln1/d;->o(FLandroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ln1/d;FLandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ln1/d;->q(FLandroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ln1/d;FLandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ln1/d;->p(FLandroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Ln1/d;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ln1/d;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method protected static j(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v0, v2, v2}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v0, v2, v2, v1, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method private l(Landroid/graphics/Bitmap;Landroid/graphics/Rect;F)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    :try_start_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    invoke-static {p0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Landroid/graphics/RectF;

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    add-int/lit8 v2, v2, -0x3

    .line 36
    .line 37
    int-to-float v2, v2

    .line 38
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    add-int/lit8 v3, v3, -0x3

    .line 43
    .line 44
    int-to-float v3, v3

    .line 45
    const/4 v4, 0x0

    .line 46
    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 52
    .line 53
    .line 54
    const/4 v3, 0x1

    .line 55
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 56
    .line 57
    .line 58
    const/4 v3, -0x1

    .line 59
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 60
    .line 61
    .line 62
    new-instance v3, Landroid/graphics/Canvas;

    .line 63
    .line 64
    invoke-direct {v3, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3, v1, p3, p3, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    new-instance p3, Landroid/graphics/PorterDuffXfermode;

    .line 71
    .line 72
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 73
    .line 74
    invoke-direct {p3, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, p3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3, p1, p2, v0, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    return-object p0

    .line 84
    :catch_0
    return-object p1
.end method

.method private synthetic o(FLandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ln1/d;->g(Landroid/graphics/Canvas;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic p(FLandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ln1/d;->g(Landroid/graphics/Canvas;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic q(FLandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ln1/d;->g(Landroid/graphics/Canvas;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected e(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_1
    :goto_0
    const-string p0, "DragPreviewProvider"

    .line 19
    .line 20
    const-string p1, "convertPreviewToAlphaBitmap: preview is null or recycled."

    .line 21
    .line 22
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public f()Landroid/graphics/drawable/Drawable;
    .locals 10

    .line 1
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Ln1/d;->f:Z

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 13
    .line 14
    instance-of v3, v1, Lcom/android/launcher3/dragndrop/y;

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    check-cast v1, Lcom/android/launcher3/dragndrop/y;

    .line 19
    .line 20
    iget-object v3, p0, Ln1/d;->a:Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-interface {v1, v3}, Lcom/android/launcher3/dragndrop/y;->g(Landroid/graphics/Rect;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ln1/d;->a:Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-object v3, p0, Ln1/d;->a:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v3, p0, Ln1/d;->b:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iget-object v3, p0, Ln1/d;->b:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    iget-object v4, p0, Ln1/d;->b:Landroid/view/View;

    .line 62
    .line 63
    instance-of v5, v4, Lcom/android/launcher3/widget/T;

    .line 64
    .line 65
    if-eqz v5, :cond_3

    .line 66
    .line 67
    check-cast v4, Lcom/android/launcher3/widget/T;

    .line 68
    .line 69
    invoke-virtual {v4}, Lcom/android/launcher3/widget/x0;->getScaleToFit()F

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    int-to-float v1, v1

    .line 80
    mul-float/2addr v1, v0

    .line 81
    float-to-int v1, v1

    .line 82
    iget-object v3, p0, Ln1/d;->b:Landroid/view/View;

    .line 83
    .line 84
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    int-to-float v3, v3

    .line 89
    mul-float/2addr v3, v0

    .line 90
    float-to-int v3, v3

    .line 91
    iget-object v4, p0, Ln1/d;->b:Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    check-cast v4, Lcom/android/launcher3/model/data/A;

    .line 98
    .line 99
    if-eqz v4, :cond_2

    .line 100
    .line 101
    iget v4, p0, Ln1/d;->d:I

    .line 102
    .line 103
    add-int/2addr v1, v4

    .line 104
    add-int/2addr v3, v4

    .line 105
    new-instance v4, Ln1/a;

    .line 106
    .line 107
    invoke-direct {v4, p0, v0}, Ln1/a;-><init>(Ln1/d;F)V

    .line 108
    .line 109
    .line 110
    invoke-static {v1, v3, v4}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    iget v4, p0, Ln1/d;->d:I

    .line 118
    .line 119
    add-int/2addr v1, v4

    .line 120
    add-int/2addr v3, v4

    .line 121
    new-instance v4, Ln1/b;

    .line 122
    .line 123
    invoke-direct {v4, p0, v0}, Ln1/b;-><init>(Ln1/d;F)V

    .line 124
    .line 125
    .line 126
    invoke-static {v1, v3, v4}, Ls1/e;->b(IILs1/e;)Landroid/graphics/Bitmap;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 131
    .line 132
    :goto_0
    return-object v2

    .line 133
    :cond_3
    :goto_1
    iget-object v4, p0, Ln1/d;->b:Landroid/view/View;

    .line 134
    .line 135
    instance-of v5, v4, Lcom/android/launcher3/BubbleTextView;

    .line 136
    .line 137
    if-eqz v5, :cond_4

    .line 138
    .line 139
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 140
    .line 141
    invoke-virtual {v4}, Lcom/android/launcher3/BubbleTextView;->getIconDisplay()I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    const/16 v5, 0x9

    .line 146
    .line 147
    if-ne v4, v5, :cond_4

    .line 148
    .line 149
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 150
    .line 151
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0}, Ls1/o;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    iget p0, p0, Ln1/d;->d:I

    .line 166
    .line 167
    int-to-float v0, p0

    .line 168
    add-int/2addr v1, p0

    .line 169
    int-to-float v1, v1

    .line 170
    div-float/2addr v0, v1

    .line 171
    int-to-float v1, p0

    .line 172
    add-int/2addr v3, p0

    .line 173
    int-to-float p0, v3

    .line 174
    div-float/2addr v1, p0

    .line 175
    new-instance v4, Landroid/graphics/drawable/InsetDrawable;

    .line 176
    .line 177
    const/high16 p0, 0x40000000    # 2.0f

    .line 178
    .line 179
    div-float v6, v0, p0

    .line 180
    .line 181
    div-float v7, v1, p0

    .line 182
    .line 183
    move v8, v6

    .line 184
    move v9, v7

    .line 185
    invoke-direct/range {v4 .. v9}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;FFFF)V

    .line 186
    .line 187
    .line 188
    return-object v4

    .line 189
    :cond_4
    iget v4, p0, Ln1/d;->d:I

    .line 190
    .line 191
    add-int/2addr v1, v4

    .line 192
    add-int/2addr v3, v4

    .line 193
    new-instance v4, Ln1/c;

    .line 194
    .line 195
    invoke-direct {v4, p0, v0}, Ln1/c;-><init>(Ln1/d;F)V

    .line 196
    .line 197
    .line 198
    invoke-static {v1, v3, v4}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 203
    .line 204
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 205
    .line 206
    instance-of v1, v0, Lcom/android/launcher3/widget/T;

    .line 207
    .line 208
    if-eqz v1, :cond_5

    .line 209
    .line 210
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_5

    .line 217
    .line 218
    iget-object v0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 219
    .line 220
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 221
    .line 222
    check-cast v1, Lcom/android/launcher3/widget/T;

    .line 223
    .line 224
    invoke-virtual {v1}, Lcom/android/launcher3/widget/h;->getDragViewRectangle()Landroid/graphics/Rect;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iget-object v3, p0, Ln1/d;->b:Landroid/view/View;

    .line 229
    .line 230
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    invoke-static {v3}, Lcom/android/launcher3/widget/I0;->b(Landroid/content/Context;)F

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    invoke-direct {p0, v0, v1, v3}, Ln1/d;->l(Landroid/graphics/Bitmap;Landroid/graphics/Rect;F)Landroid/graphics/Bitmap;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-object v0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 243
    .line 244
    :cond_5
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 245
    .line 246
    instance-of v0, v0, Lcom/android/launcher3/widget/T;

    .line 247
    .line 248
    if-eqz v0, :cond_6

    .line 249
    .line 250
    return-object v2

    .line 251
    :cond_6
    new-instance v0, Ls1/o;

    .line 252
    .line 253
    iget-object p0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 254
    .line 255
    invoke-direct {v0, p0}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 256
    .line 257
    .line 258
    return-object v0
.end method

.method protected g(Landroid/graphics/Canvas;F)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, p2, p2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 6
    .line 7
    .line 8
    iget-boolean p2, p0, Ln1/d;->f:Z

    .line 9
    .line 10
    if-nez p2, :cond_3

    .line 11
    .line 12
    iget-object p2, p0, Ln1/d;->b:Landroid/view/View;

    .line 13
    .line 14
    instance-of v1, p2, Lcom/android/launcher3/dragndrop/y;

    .line 15
    .line 16
    if-eqz v1, :cond_4

    .line 17
    .line 18
    move-object v1, p2

    .line 19
    check-cast v1, Lcom/android/launcher3/dragndrop/y;

    .line 20
    .line 21
    instance-of v2, p2, Lcom/android/launcher3/BubbleTextView;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p2}, Ln1/d;->j(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget v2, p0, Ln1/d;->d:I

    .line 36
    .line 37
    div-int/lit8 v3, v2, 0x2

    .line 38
    .line 39
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 40
    .line 41
    sub-int/2addr v3, v4

    .line 42
    int-to-float v3, v3

    .line 43
    div-int/lit8 v2, v2, 0x2

    .line 44
    .line 45
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    sub-int/2addr v2, v1

    .line 48
    int-to-float v1, v2

    .line 49
    invoke-virtual {p1, v3, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ln1/d;->b:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    instance-of p2, p2, Lcom/android/launcher3/model/data/y;

    .line 62
    .line 63
    if-eqz p2, :cond_4

    .line 64
    .line 65
    iget-object p2, p0, Ln1/d;->b:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 72
    .line 73
    iget-boolean p2, p2, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 74
    .line 75
    if-nez p2, :cond_0

    .line 76
    .line 77
    iget-object p2, p0, Ln1/d;->b:Landroid/view/View;

    .line 78
    .line 79
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 84
    .line 85
    iget-boolean p2, p2, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 86
    .line 87
    if-eqz p2, :cond_4

    .line 88
    .line 89
    :cond_0
    iget-object p0, p0, Ln1/d;->b:Landroid/view/View;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const p2, 0x7f060258

    .line 96
    .line 97
    .line 98
    invoke-static {p0, p2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 103
    .line 104
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    invoke-interface {v1}, Lcom/android/launcher3/dragndrop/y;->e()Lcom/android/launcher3/util/a2;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    :try_start_0
    iget-object v2, p0, Ln1/d;->a:Landroid/graphics/Rect;

    .line 113
    .line 114
    invoke-interface {v1, v2}, Lcom/android/launcher3/dragndrop/y;->g(Landroid/graphics/Rect;)V

    .line 115
    .line 116
    .line 117
    iget v1, p0, Ln1/d;->d:I

    .line 118
    .line 119
    div-int/lit8 v2, v1, 0x2

    .line 120
    .line 121
    iget-object v3, p0, Ln1/d;->a:Landroid/graphics/Rect;

    .line 122
    .line 123
    iget v4, v3, Landroid/graphics/Rect;->left:I

    .line 124
    .line 125
    sub-int/2addr v2, v4

    .line 126
    int-to-float v2, v2

    .line 127
    div-int/lit8 v1, v1, 0x2

    .line 128
    .line 129
    iget v3, v3, Landroid/graphics/Rect;->top:I

    .line 130
    .line 131
    sub-int/2addr v1, v3

    .line 132
    int-to-float v1, v1

    .line 133
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Ln1/d;->b:Landroid/view/View;

    .line 137
    .line 138
    invoke-virtual {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    .line 140
    .line 141
    if-eqz p2, :cond_4

    .line 142
    .line 143
    invoke-interface {p2}, Lcom/android/launcher3/util/a2;->close()V

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :catchall_0
    move-exception p0

    .line 148
    if-eqz p2, :cond_2

    .line 149
    .line 150
    :try_start_1
    invoke-interface {p2}, Lcom/android/launcher3/util/a2;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :catchall_1
    move-exception p1

    .line 155
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 156
    .line 157
    .line 158
    :cond_2
    :goto_0
    throw p0

    .line 159
    :cond_3
    iget-object p2, p0, Ln1/d;->a:Landroid/graphics/Rect;

    .line 160
    .line 161
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 162
    .line 163
    invoke-virtual {v1, p2}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 164
    .line 165
    .line 166
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 167
    .line 168
    invoke-virtual {v1}, Landroid/view/View;->getScrollX()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    neg-int v1, v1

    .line 173
    iget v2, p0, Ln1/d;->d:I

    .line 174
    .line 175
    div-int/lit8 v2, v2, 0x2

    .line 176
    .line 177
    add-int/2addr v1, v2

    .line 178
    int-to-float v1, v1

    .line 179
    iget-object v2, p0, Ln1/d;->b:Landroid/view/View;

    .line 180
    .line 181
    invoke-virtual {v2}, Landroid/view/View;->getScrollY()I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    neg-int v2, v2

    .line 186
    iget v3, p0, Ln1/d;->d:I

    .line 187
    .line 188
    div-int/lit8 v3, v3, 0x2

    .line 189
    .line 190
    add-int/2addr v2, v3

    .line 191
    int-to-float v2, v2

    .line 192
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 196
    .line 197
    .line 198
    iget-object p0, p0, Ln1/d;->b:Landroid/view/View;

    .line 199
    .line 200
    invoke-virtual {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 201
    .line 202
    .line 203
    :cond_4
    :goto_1
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public final h(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 40
    .line 41
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    new-instance v0, Ln1/d$a;

    .line 49
    .line 50
    invoke-direct {v0, p0, p1}, Ln1/d$a;-><init>(Ln1/d;Landroid/graphics/Bitmap;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ln1/d;->h:Ln1/d$a;

    .line 54
    .line 55
    sget-object p0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public i()Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ln1/d;->b:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/widget/T;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public k()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Landroid/graphics/drawable/Drawable;[I)F
    .locals 6

    .line 1
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 24
    .line 25
    instance-of v2, v1, Lcom/android/launcher3/widget/T;

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    check-cast v1, Lcom/android/launcher3/widget/T;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/widget/x0;->getScaleToFit()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    div-float/2addr v0, v1

    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    aget v2, p2, v1

    .line 38
    .line 39
    int-to-float v2, v2

    .line 40
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    int-to-float v3, v3

    .line 45
    iget-object v4, p0, Ln1/d;->b:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    int-to-float v4, v4

    .line 52
    mul-float/2addr v4, v0

    .line 53
    iget-object v5, p0, Ln1/d;->b:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {v5}, Landroid/view/View;->getScaleX()F

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    mul-float/2addr v4, v5

    .line 60
    sub-float/2addr v3, v4

    .line 61
    const/high16 v4, 0x40000000    # 2.0f

    .line 62
    .line 63
    div-float/2addr v3, v4

    .line 64
    sub-float/2addr v2, v3

    .line 65
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    aput v2, p2, v1

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    aget v2, p2, v1

    .line 73
    .line 74
    int-to-float v2, v2

    .line 75
    const/high16 v3, 0x3f800000    # 1.0f

    .line 76
    .line 77
    sub-float/2addr v3, v0

    .line 78
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    int-to-float p1, p1

    .line 83
    mul-float/2addr v3, p1

    .line 84
    div-float/2addr v3, v4

    .line 85
    sub-float/2addr v2, v3

    .line 86
    iget p0, p0, Ln1/d;->c:I

    .line 87
    .line 88
    div-int/lit8 p0, p0, 0x2

    .line 89
    .line 90
    int-to-float p0, p0

    .line 91
    sub-float/2addr v2, p0

    .line 92
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    aput p0, p2, v1

    .line 97
    .line 98
    return v0
.end method

.method public n(Landroid/view/View;[I)F
    .locals 6

    .line 1
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 24
    .line 25
    instance-of v2, v1, Lcom/android/launcher3/widget/T;

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    check-cast v1, Lcom/android/launcher3/widget/T;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/widget/x0;->getScaleToFit()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    div-float/2addr v0, v1

    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    aget v2, p2, v1

    .line 38
    .line 39
    int-to-float v2, v2

    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    int-to-float v3, v3

    .line 45
    iget-object v4, p0, Ln1/d;->b:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    int-to-float v4, v4

    .line 52
    mul-float/2addr v4, v0

    .line 53
    iget-object v5, p0, Ln1/d;->b:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {v5}, Landroid/view/View;->getScaleX()F

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    mul-float/2addr v4, v5

    .line 60
    sub-float/2addr v3, v4

    .line 61
    const/high16 v4, 0x40000000    # 2.0f

    .line 62
    .line 63
    div-float/2addr v3, v4

    .line 64
    sub-float/2addr v2, v3

    .line 65
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    aput v2, p2, v1

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    aget v2, p2, v1

    .line 73
    .line 74
    int-to-float v2, v2

    .line 75
    const/high16 v3, 0x3f800000    # 1.0f

    .line 76
    .line 77
    sub-float/2addr v3, v0

    .line 78
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    int-to-float p1, p1

    .line 83
    mul-float/2addr v3, p1

    .line 84
    div-float/2addr v3, v4

    .line 85
    sub-float/2addr v2, v3

    .line 86
    iget p0, p0, Ln1/d;->c:I

    .line 87
    .line 88
    div-int/lit8 p0, p0, 0x2

    .line 89
    .line 90
    int-to-float p0, p0

    .line 91
    sub-float/2addr v2, p0

    .line 92
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    aput p0, p2, v1

    .line 97
    .line 98
    return v0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ln1/d;->e:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ln1/d;->e:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Ln1/d;->e:Landroid/graphics/Bitmap;

    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public s(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ln1/d;->g:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method
