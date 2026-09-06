.class public Lr1/c;
.super Ls1/o;
.source "DownloadInstallDrawable.java"


# instance fields
.field private final A:Landroid/graphics/Rect;

.field private final B:Lr1/k;

.field private final C:Landroid/graphics/Rect;

.field D:Landroid/graphics/drawable/Drawable;

.field E:Landroid/graphics/drawable/Drawable;

.field F:Landroid/graphics/Bitmap;

.field G:Z

.field H:F

.field I:Landroid/animation/ValueAnimator;

.field J:F

.field K:Landroid/animation/ValueAnimator;

.field L:F

.field M:Landroid/animation/ValueAnimator;

.field N:F

.field O:Landroid/animation/ValueAnimator;

.field P:F

.field Q:Landroid/animation/ValueAnimator;

.field R:F

.field S:Lcom/android/launcher3/BubbleTextView;

.field T:Lcom/android/launcher3/model/data/I;

.field public U:I

.field V:Z

.field private W:Lr1/g;

.field private X:Lr1/h;

.field private Y:Lr1/b;

.field private Z:Lr1/i;

.field private a0:Lr1/j;

.field private b0:Lr1/d;

.field private c0:Lr1/e;

.field private d0:Lr1/f;

.field private final y:Landroid/graphics/Paint;

.field final z:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ls1/o;-><init>(Ls1/d;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lr1/k;

    .line 7
    .line 8
    invoke-direct {v0}, Lr1/k;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lr1/c;->B:Lr1/k;

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lr1/c;->C:Landroid/graphics/Rect;

    .line 19
    .line 20
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    const/high16 v0, 0x42340000    # 45.0f

    .line 28
    .line 29
    iput v0, p0, Lr1/c;->J:F

    .line 30
    .line 31
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    const/high16 v0, 0x44070000    # 540.0f

    .line 39
    .line 40
    iput v0, p0, Lr1/c;->L:F

    .line 41
    .line 42
    new-instance v1, Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    invoke-direct {v1}, Landroid/animation/ValueAnimator;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    iput v0, p0, Lr1/c;->N:F

    .line 50
    .line 51
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    const/high16 v0, 0x44010000    # 516.0f

    .line 59
    .line 60
    iput v0, p0, Lr1/c;->P:F

    .line 61
    .line 62
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    iput-boolean v0, p0, Lr1/c;->V:Z

    .line 71
    .line 72
    iput-object p2, p0, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 73
    .line 74
    iput-object p1, p0, Lr1/c;->S:Lcom/android/launcher3/BubbleTextView;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, p0, Lr1/c;->z:Landroid/graphics/drawable/Drawable;

    .line 81
    .line 82
    if-eqz v1, :cond_0

    .line 83
    .line 84
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {p0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    new-instance v2, Landroid/graphics/Rect;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-direct {v2, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 98
    .line 99
    .line 100
    iput-object v2, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 101
    .line 102
    iget-object v3, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 103
    .line 104
    iget-object v3, v3, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 105
    .line 106
    iput-object v3, p0, Lr1/c;->F:Landroid/graphics/Bitmap;

    .line 107
    .line 108
    if-eqz v3, :cond_1

    .line 109
    .line 110
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-nez v3, :cond_1

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget-object v3, p0, Lr1/c;->F:Landroid/graphics/Bitmap;

    .line 121
    .line 122
    invoke-direct {p0, v3, v0}, Lr1/c;->v(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v1, v0}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lr1/c;->D:Landroid/graphics/drawable/Drawable;

    .line 131
    .line 132
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iget-object v0, p0, Lr1/c;->F:Landroid/graphics/Bitmap;

    .line 137
    .line 138
    const/16 v1, 0x70

    .line 139
    .line 140
    invoke-direct {p0, v0, v1}, Lr1/c;->v(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-static {p1, v0}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iput-object p1, p0, Lr1/c;->E:Landroid/graphics/drawable/Drawable;

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .line 155
    .line 156
    const-string v3, "(zteMarketIcon == null): "

    .line 157
    .line 158
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    if-nez v1, :cond_2

    .line 162
    .line 163
    const/4 v0, 0x1

    .line 164
    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    const-string v0, "DownloadInstallDrawable"

    .line 172
    .line 173
    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    iput-object v1, p0, Lr1/c;->D:Landroid/graphics/drawable/Drawable;

    .line 177
    .line 178
    iput-object v1, p0, Lr1/c;->E:Landroid/graphics/drawable/Drawable;

    .line 179
    .line 180
    :goto_0
    new-instance p1, Landroid/graphics/Paint;

    .line 181
    .line 182
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 183
    .line 184
    .line 185
    iput-object p1, p0, Lr1/c;->y:Landroid/graphics/Paint;

    .line 186
    .line 187
    const/4 v0, -0x1

    .line 188
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 189
    .line 190
    .line 191
    const/high16 v0, 0x40400000    # 3.0f

    .line 192
    .line 193
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->U()Ljava/lang/Boolean;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    iput-boolean p1, p0, Lr1/c;->G:Z

    .line 205
    .line 206
    const/4 p1, 0x0

    .line 207
    iput p1, p0, Lr1/c;->H:F

    .line 208
    .line 209
    iget p1, v2, Landroid/graphics/Rect;->right:I

    .line 210
    .line 211
    int-to-double p1, p1

    .line 212
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 213
    .line 214
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 215
    .line 216
    .line 217
    move-result-wide v0

    .line 218
    mul-double/2addr p1, v0

    .line 219
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 220
    .line 221
    mul-double/2addr p1, v0

    .line 222
    const-wide/high16 v0, 0x4010000000000000L    # 4.0

    .line 223
    .line 224
    div-double/2addr p1, v0

    .line 225
    double-to-float p1, p1

    .line 226
    iput p1, p0, Lr1/c;->R:F

    .line 227
    .line 228
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {p0, p1}, Lr1/c;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method private v(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance p1, Landroid/graphics/Canvas;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p2, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 22
    .line 23
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method


# virtual methods
.method public A(I)V
    .locals 1

    .line 1
    int-to-float v0, p1

    .line 2
    iput v0, p0, Lr1/c;->H:F

    .line 3
    .line 4
    if-lez p1, :cond_3

    .line 5
    .line 6
    iget-object p1, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_3

    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-boolean p1, p0, Lr1/c;->V:Z

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Lr1/c;->D()V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Lr1/c;->V:Z

    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    invoke-virtual {p0}, Lr1/c;->F()V

    .line 39
    .line 40
    .line 41
    :cond_3
    :goto_0
    return-void
.end method

.method public B()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lr1/c;->I()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lr1/c;->G()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setTarget(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    new-array v1, v1, [F

    .line 27
    .line 28
    fill-array-data v1, :array_0

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    const/4 v1, -0x1

    .line 37
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 43
    .line 44
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lr1/c;->b0:Lr1/d;

    .line 51
    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    new-instance v0, Lr1/d;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lr1/d;-><init>(Lr1/c;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lr1/c;->b0:Lr1/d;

    .line 60
    .line 61
    iget-object v1, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    const-wide/16 v1, 0x3e8

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :array_0
    .array-data 4
        0x441d0000    # 628.0f
        0x44260000    # 664.0f
    .end array-data
.end method

.method public C()V
    .locals 8

    .line 1
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "DownloadInstallDrawable"

    .line 12
    .line 13
    const-string v0, "startInstallCompleteAnim: mInstallCompleteAnim is running , return !!!"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Lr1/c;->I()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lr1/c;->G()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setTarget(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 42
    .line 43
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    int-to-double v0, v0

    .line 46
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 47
    .line 48
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 49
    .line 50
    .line 51
    move-result-wide v4

    .line 52
    mul-double/2addr v0, v4

    .line 53
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 54
    .line 55
    mul-double/2addr v0, v4

    .line 56
    const-wide/high16 v4, 0x4010000000000000L    # 4.0

    .line 57
    .line 58
    div-double/2addr v0, v4

    .line 59
    double-to-float v0, v0

    .line 60
    iget-object v1, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 61
    .line 62
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 63
    .line 64
    int-to-double v4, v1

    .line 65
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 66
    .line 67
    .line 68
    move-result-wide v6

    .line 69
    mul-double/2addr v4, v6

    .line 70
    div-double/2addr v4, v2

    .line 71
    double-to-float v1, v4

    .line 72
    iget-object v2, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    const/4 v3, 0x2

    .line 75
    new-array v3, v3, [F

    .line 76
    .line 77
    const/4 v4, 0x0

    .line 78
    aput v0, v3, v4

    .line 79
    .line 80
    const/4 v0, 0x1

    .line 81
    aput v1, v3, v0

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lr1/c;->d0:Lr1/f;

    .line 87
    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    new-instance v0, Lr1/f;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Lr1/f;-><init>(Lr1/c;)V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lr1/c;->d0:Lr1/f;

    .line 96
    .line 97
    iget-object v1, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    const v0, 0x3f028f5c    # 0.51f

    .line 103
    .line 104
    .line 105
    const v1, 0x3e6b851f    # 0.23f

    .line 106
    .line 107
    .line 108
    const/high16 v2, 0x3f800000    # 1.0f

    .line 109
    .line 110
    invoke-static {v0, v2, v1, v2}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v1, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 115
    .line 116
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    const-wide/16 v1, 0x7d0

    .line 122
    .line 123
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 127
    .line 128
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lr1/c;->c0:Lr1/e;

    .line 132
    .line 133
    if-nez v0, :cond_3

    .line 134
    .line 135
    new-instance v0, Lr1/e;

    .line 136
    .line 137
    invoke-direct {v0, p0}, Lr1/e;-><init>(Lr1/c;)V

    .line 138
    .line 139
    .line 140
    iput-object v0, p0, Lr1/c;->c0:Lr1/e;

    .line 141
    .line 142
    iget-object p0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 145
    .line 146
    .line 147
    :cond_3
    return-void
.end method

.method public D()V
    .locals 3

    .line 1
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setTarget(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    new-array v1, v1, [F

    .line 10
    .line 11
    fill-array-data v1, :array_0

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    const-wide/16 v1, 0x9c4

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    .line 24
    const/high16 v0, 0x3f000000    # 0.5f

    .line 25
    .line 26
    const/high16 v1, 0x3f800000    # 1.0f

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-static {v2, v2, v0, v1}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lr1/c;->X:Lr1/h;

    .line 44
    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    new-instance v0, Lr1/h;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lr1/h;-><init>(Lr1/c;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lr1/c;->X:Lr1/h;

    .line 53
    .line 54
    iget-object v1, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Lr1/c;->W:Lr1/g;

    .line 60
    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    new-instance v0, Lr1/g;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Lr1/g;-><init>(Lr1/c;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lr1/c;->W:Lr1/g;

    .line 69
    .line 70
    iget-object p0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void

    .line 76
    nop

    .line 77
    :array_0
    .array-data 4
        0x42340000    # 45.0f
        0x44070000    # 540.0f
    .end array-data
.end method

.method public E()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lr1/c;->I()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setTarget(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [F

    .line 24
    .line 25
    fill-array-data v1, :array_0

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lr1/c;->a0:Lr1/j;

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    new-instance v0, Lr1/j;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lr1/j;-><init>(Lr1/c;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lr1/c;->a0:Lr1/j;

    .line 41
    .line 42
    iget-object v1, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    const-wide/16 v1, 0x640

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lr1/c;->Z:Lr1/i;

    .line 60
    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    new-instance v0, Lr1/i;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Lr1/i;-><init>(Lr1/c;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lr1/c;->Z:Lr1/i;

    .line 69
    .line 70
    iget-object p0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    return-void

    .line 76
    nop

    .line 77
    :array_0
    .array-data 4
        0x44070000    # 540.0f
        0x441d0000    # 628.0f
    .end array-data
.end method

.method public F()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lr1/c;->I()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setTarget(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [F

    .line 24
    .line 25
    fill-array-data v1, :array_0

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    const/4 v1, -0x1

    .line 34
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 40
    .line 41
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    const-wide/16 v1, 0x320

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lr1/c;->Y:Lr1/b;

    .line 60
    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    new-instance v0, Lr1/b;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Lr1/b;-><init>(Lr1/c;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lr1/c;->Y:Lr1/b;

    .line 69
    .line 70
    iget-object p0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void

    .line 76
    nop

    .line 77
    :array_0
    .array-data 4
        0x44070000    # 540.0f
        0x44124000    # 585.0f
    .end array-data
.end method

.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lr1/c;->b0:Lr1/d;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 25
    .line 26
    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    iput-object v0, p0, Lr1/c;->b0:Lr1/d;

    .line 31
    .line 32
    return-void
.end method

.method public H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lr1/c;->c0:Lr1/e;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    iget-object v1, p0, Lr1/c;->d0:Lr1/f;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 32
    .line 33
    .line 34
    :cond_1
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    iput-object v0, p0, Lr1/c;->c0:Lr1/e;

    .line 38
    .line 39
    iput-object v0, p0, Lr1/c;->d0:Lr1/f;

    .line 40
    .line 41
    return-void
.end method

.method public I()V
    .locals 2

    .line 1
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lr1/c;->Y:Lr1/b;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 25
    .line 26
    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    iput-object v0, p0, Lr1/c;->Y:Lr1/b;

    .line 31
    .line 32
    return-void
.end method

.method public c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lr1/c;->D:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    iget p2, v0, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    int-to-float v2, p2

    .line 14
    iget p2, v0, Landroid/graphics/Rect;->top:I

    .line 15
    .line 16
    int-to-float v3, p2

    .line 17
    iget p2, v0, Landroid/graphics/Rect;->right:I

    .line 18
    .line 19
    int-to-float v4, p2

    .line 20
    iget p2, v0, Landroid/graphics/Rect;->bottom:I

    .line 21
    .line 22
    int-to-float v5, p2

    .line 23
    const/4 v6, 0x0

    .line 24
    const/16 v7, 0x1f

    .line 25
    .line 26
    move-object v1, p1

    .line 27
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object p2, p0, Lr1/c;->E:Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lr1/c;->y:Landroid/graphics/Paint;

    .line 37
    .line 38
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    .line 39
    .line 40
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    .line 41
    .line 42
    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lr1/c;->B:Lr1/k;

    .line 49
    .line 50
    iget v2, p0, Lr1/c;->J:F

    .line 51
    .line 52
    iget-object v3, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 53
    .line 54
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 55
    .line 56
    int-to-float v3, v3

    .line 57
    iget v4, v0, Landroid/graphics/Rect;->right:I

    .line 58
    .line 59
    const/4 v5, 0x2

    .line 60
    div-int/2addr v4, v5

    .line 61
    int-to-float v4, v4

    .line 62
    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    .line 63
    .line 64
    div-int/2addr v6, v5

    .line 65
    int-to-float v6, v6

    .line 66
    invoke-virtual {p2, v2, v3, v4, v6}, Lr1/k;->g(FFFF)V

    .line 67
    .line 68
    .line 69
    iget p2, p0, Lr1/c;->U:I

    .line 70
    .line 71
    const/4 v2, 0x1

    .line 72
    if-eq p2, v2, :cond_1

    .line 73
    .line 74
    if-eq p2, v5, :cond_1

    .line 75
    .line 76
    const/4 v2, 0x3

    .line 77
    if-eq p2, v2, :cond_0

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_0
    invoke-virtual {p0}, Lr1/c;->G()V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lr1/c;->B:Lr1/k;

    .line 85
    .line 86
    iget v2, p0, Lr1/c;->P:F

    .line 87
    .line 88
    iget v3, p0, Lr1/c;->R:F

    .line 89
    .line 90
    iget v4, v0, Landroid/graphics/Rect;->right:I

    .line 91
    .line 92
    div-int/2addr v4, v5

    .line 93
    int-to-float v4, v4

    .line 94
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 95
    .line 96
    div-int/2addr v0, v5

    .line 97
    int-to-float v0, v0

    .line 98
    invoke-virtual {p2, v2, v3, v4, v0}, Lr1/k;->f(FFFF)V

    .line 99
    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :cond_1
    iget-object p2, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    if-eqz p2, :cond_2

    .line 106
    .line 107
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-nez p2, :cond_3

    .line 112
    .line 113
    :cond_2
    iget-boolean p2, p0, Lr1/c;->V:Z

    .line 114
    .line 115
    if-nez p2, :cond_4

    .line 116
    .line 117
    :cond_3
    iget-object p2, p0, Lr1/c;->B:Lr1/k;

    .line 118
    .line 119
    iget v2, p0, Lr1/c;->J:F

    .line 120
    .line 121
    iget-object v3, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 122
    .line 123
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 124
    .line 125
    int-to-float v3, v3

    .line 126
    iget v4, v0, Landroid/graphics/Rect;->right:I

    .line 127
    .line 128
    div-int/2addr v4, v5

    .line 129
    int-to-float v4, v4

    .line 130
    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    .line 131
    .line 132
    div-int/2addr v6, v5

    .line 133
    int-to-float v6, v6

    .line 134
    invoke-virtual {p2, v2, v3, v4, v6}, Lr1/k;->g(FFFF)V

    .line 135
    .line 136
    .line 137
    :cond_4
    iget-object p2, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 138
    .line 139
    if-eqz p2, :cond_5

    .line 140
    .line 141
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-eqz p2, :cond_5

    .line 146
    .line 147
    iget-object p2, p0, Lr1/c;->B:Lr1/k;

    .line 148
    .line 149
    iget v2, p0, Lr1/c;->L:F

    .line 150
    .line 151
    iget-object v3, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 152
    .line 153
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 154
    .line 155
    int-to-float v3, v3

    .line 156
    iget v4, v0, Landroid/graphics/Rect;->right:I

    .line 157
    .line 158
    div-int/2addr v4, v5

    .line 159
    int-to-float v4, v4

    .line 160
    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    .line 161
    .line 162
    div-int/2addr v6, v5

    .line 163
    int-to-float v6, v6

    .line 164
    invoke-virtual {p2, v2, v3, v4, v6}, Lr1/k;->h(FFFF)V

    .line 165
    .line 166
    .line 167
    :cond_5
    iget-object p2, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 168
    .line 169
    if-eqz p2, :cond_6

    .line 170
    .line 171
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    if-eqz p2, :cond_6

    .line 176
    .line 177
    iget-object p2, p0, Lr1/c;->B:Lr1/k;

    .line 178
    .line 179
    iget v2, p0, Lr1/c;->N:F

    .line 180
    .line 181
    iget-object v3, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 182
    .line 183
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 184
    .line 185
    int-to-float v3, v3

    .line 186
    iget v4, v0, Landroid/graphics/Rect;->right:I

    .line 187
    .line 188
    div-int/2addr v4, v5

    .line 189
    int-to-float v4, v4

    .line 190
    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    .line 191
    .line 192
    div-int/2addr v6, v5

    .line 193
    int-to-float v6, v6

    .line 194
    invoke-virtual {p2, v2, v3, v4, v6}, Lr1/k;->g(FFFF)V

    .line 195
    .line 196
    .line 197
    :cond_6
    iget-object p2, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 198
    .line 199
    if-eqz p2, :cond_7

    .line 200
    .line 201
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    if-eqz p2, :cond_7

    .line 206
    .line 207
    iget-object p2, p0, Lr1/c;->B:Lr1/k;

    .line 208
    .line 209
    iget v2, p0, Lr1/c;->P:F

    .line 210
    .line 211
    iget v3, p0, Lr1/c;->R:F

    .line 212
    .line 213
    iget v4, v0, Landroid/graphics/Rect;->right:I

    .line 214
    .line 215
    div-int/2addr v4, v5

    .line 216
    int-to-float v4, v4

    .line 217
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 218
    .line 219
    div-int/2addr v0, v5

    .line 220
    int-to-float v0, v0

    .line 221
    invoke-virtual {p2, v2, v3, v4, v0}, Lr1/k;->f(FFFF)V

    .line 222
    .line 223
    .line 224
    :cond_7
    :goto_0
    iget-object p2, p0, Lr1/c;->B:Lr1/k;

    .line 225
    .line 226
    invoke-virtual {p2}, Lr1/k;->c()Landroid/graphics/Path;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    iget-object v0, p0, Lr1/c;->y:Landroid/graphics/Paint;

    .line 231
    .line 232
    invoke-virtual {v1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 233
    .line 234
    .line 235
    iget-object p2, p0, Lr1/c;->y:Landroid/graphics/Paint;

    .line 236
    .line 237
    const/4 v0, 0x0

    .line 238
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 242
    .line 243
    .line 244
    iget-boolean p1, p0, Lr1/c;->G:Z

    .line 245
    .line 246
    if-eqz p1, :cond_8

    .line 247
    .line 248
    iget-object p1, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 249
    .line 250
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 251
    .line 252
    .line 253
    iget-object p1, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 254
    .line 255
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    const/high16 p2, 0x41600000    # 14.0f

    .line 260
    .line 261
    mul-float/2addr p1, p2

    .line 262
    const/high16 v0, 0x41800000    # 16.0f

    .line 263
    .line 264
    div-float v2, p1, v0

    .line 265
    .line 266
    iget-object p1, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 267
    .line 268
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    const/high16 v7, 0x40800000    # 4.0f

    .line 273
    .line 274
    mul-float/2addr p1, v7

    .line 275
    const/high16 v8, 0x40a00000    # 5.0f

    .line 276
    .line 277
    div-float v3, p1, v8

    .line 278
    .line 279
    iget-object p1, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 280
    .line 281
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    mul-float/2addr p1, p2

    .line 286
    div-float v4, p1, v0

    .line 287
    .line 288
    iget-object p1, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 289
    .line 290
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    const/high16 p2, 0x40c00000    # 6.0f

    .line 295
    .line 296
    mul-float/2addr p1, p2

    .line 297
    div-float v5, p1, v8

    .line 298
    .line 299
    iget-object v6, p0, Lr1/c;->y:Landroid/graphics/Paint;

    .line 300
    .line 301
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 302
    .line 303
    .line 304
    iget-object p1, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 305
    .line 306
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    const/high16 v2, 0x41900000    # 18.0f

    .line 311
    .line 312
    mul-float/2addr p1, v2

    .line 313
    div-float/2addr p1, v0

    .line 314
    iget-object v3, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 315
    .line 316
    invoke-virtual {v3}, Landroid/graphics/Rect;->exactCenterY()F

    .line 317
    .line 318
    .line 319
    move-result v3

    .line 320
    mul-float/2addr v3, v7

    .line 321
    div-float/2addr v3, v8

    .line 322
    iget-object v4, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 323
    .line 324
    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterX()F

    .line 325
    .line 326
    .line 327
    move-result v4

    .line 328
    mul-float/2addr v4, v2

    .line 329
    div-float/2addr v4, v0

    .line 330
    iget-object v0, p0, Lr1/c;->A:Landroid/graphics/Rect;

    .line 331
    .line 332
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    mul-float/2addr v0, p2

    .line 337
    div-float v5, v0, v8

    .line 338
    .line 339
    iget-object v6, p0, Lr1/c;->y:Landroid/graphics/Paint;

    .line 340
    .line 341
    move v2, p1

    .line 342
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 343
    .line 344
    .line 345
    :cond_8
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lr1/c;->z:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lr1/c;->D:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lr1/c;->C:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lr1/c;->D:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    iget-object v1, p0, Lr1/c;->C:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lr1/c;->E:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lr1/c;->C:Landroid/graphics/Rect;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lr1/c;->E:Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    iget-object p0, p0, Lr1/c;->C:Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lr1/c;->D:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lr1/c;->E:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lr1/c;->y:Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lr1/c;->z:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lr1/c;->D:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lr1/c;->E:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lr1/c;->y:Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lr1/c;->z:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 19
    .line 20
    .line 21
    invoke-super {p0, p1}, Ls1/o;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public w()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lr1/c;->G:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public x()V
    .locals 3

    .line 1
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    const-string v1, "DownloadInstallDrawable"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 8
    .line 9
    .line 10
    const-string v0, "reset mPreDownLoadAnim"

    .line 11
    .line 12
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Lr1/c;->W:Lr1/g;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    iget-object v2, p0, Lr1/c;->X:Lr1/h;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 46
    .line 47
    .line 48
    const-string v0, "reset mDownLoadAnim"

    .line 49
    .line 50
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    iget-object v2, p0, Lr1/c;->Y:Lr1/b;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 70
    .line 71
    .line 72
    :cond_3
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 77
    .line 78
    .line 79
    const-string v0, "reset mPreInstallAnim"

    .line 80
    .line 81
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    :cond_4
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    iget-object v2, p0, Lr1/c;->Z:Lr1/i;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 99
    .line 100
    iget-object v2, p0, Lr1/c;->a0:Lr1/j;

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 108
    .line 109
    .line 110
    :cond_5
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    if-eqz v0, :cond_6

    .line 113
    .line 114
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 115
    .line 116
    .line 117
    const-string v0, "reset mInstallAnim"

    .line 118
    .line 119
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    :cond_6
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 123
    .line 124
    if-eqz v0, :cond_7

    .line 125
    .line 126
    iget-object v2, p0, Lr1/c;->b0:Lr1/d;

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 137
    .line 138
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 139
    .line 140
    .line 141
    :cond_7
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 142
    .line 143
    if-eqz v0, :cond_8

    .line 144
    .line 145
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 146
    .line 147
    .line 148
    const-string v0, "reset mInstallCompleteAnim"

    .line 149
    .line 150
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    :cond_8
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 154
    .line 155
    if-eqz v0, :cond_9

    .line 156
    .line 157
    iget-object v1, p0, Lr1/c;->c0:Lr1/e;

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 163
    .line 164
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 168
    .line 169
    iget-object v1, p0, Lr1/c;->d0:Lr1/f;

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 175
    .line 176
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 177
    .line 178
    .line 179
    :cond_9
    const/4 v0, 0x0

    .line 180
    iput-object v0, p0, Lr1/c;->I:Landroid/animation/ValueAnimator;

    .line 181
    .line 182
    iput-object v0, p0, Lr1/c;->W:Lr1/g;

    .line 183
    .line 184
    iput-object v0, p0, Lr1/c;->X:Lr1/h;

    .line 185
    .line 186
    iput-object v0, p0, Lr1/c;->K:Landroid/animation/ValueAnimator;

    .line 187
    .line 188
    iput-object v0, p0, Lr1/c;->Y:Lr1/b;

    .line 189
    .line 190
    iput-object v0, p0, Lr1/c;->M:Landroid/animation/ValueAnimator;

    .line 191
    .line 192
    iput-object v0, p0, Lr1/c;->Z:Lr1/i;

    .line 193
    .line 194
    iput-object v0, p0, Lr1/c;->a0:Lr1/j;

    .line 195
    .line 196
    iput-object v0, p0, Lr1/c;->O:Landroid/animation/ValueAnimator;

    .line 197
    .line 198
    iput-object v0, p0, Lr1/c;->b0:Lr1/d;

    .line 199
    .line 200
    iput-object v0, p0, Lr1/c;->Q:Landroid/animation/ValueAnimator;

    .line 201
    .line 202
    iput-object v0, p0, Lr1/c;->c0:Lr1/e;

    .line 203
    .line 204
    iput-object v0, p0, Lr1/c;->d0:Lr1/f;

    .line 205
    .line 206
    iput-object v0, p0, Lr1/c;->S:Lcom/android/launcher3/BubbleTextView;

    .line 207
    .line 208
    return-void
.end method

.method public y(Z)V
    .locals 4

    .line 1
    iput-boolean p1, p0, Lr1/c;->G:Z

    .line 2
    .line 3
    iget v0, p0, Lr1/c;->H:F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v1, v0, v1

    .line 7
    .line 8
    const-string v2, "DownloadInstallDrawable"

    .line 9
    .line 10
    const/high16 v3, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-ltz v1, :cond_1

    .line 13
    .line 14
    cmpg-float v1, v0, v3

    .line 15
    .line 16
    if-gez v1, :cond_1

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v0, "loadPause: "

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-boolean v0, p0, Lr1/c;->G:Z

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {v2, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    cmpl-float p1, v0, v3

    .line 48
    .line 49
    if-lez p1, :cond_2

    .line 50
    .line 51
    iput v3, p0, Lr1/c;->H:F

    .line 52
    .line 53
    :cond_2
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v0, "setPauseState---loadPause: "

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-boolean p0, p0, Lr1/c;->G:Z

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {v2, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public z(I)V
    .locals 0

    .line 1
    iput p1, p0, Lr1/c;->U:I

    .line 2
    .line 3
    return-void
.end method
