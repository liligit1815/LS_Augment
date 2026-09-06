.class public Lcom/android/launcher3/iconarrange/a;
.super Landroid/graphics/drawable/Drawable;
.source "DragonDrawable.java"


# instance fields
.field private a:Landroid/graphics/drawable/Drawable;

.field private b:I

.field private c:I

.field private d:Landroid/animation/ValueAnimator;

.field private e:Landroid/animation/ValueAnimator;

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:Landroid/graphics/Rect;

.field private k:[I

.field private l:I

.field private m:Lcom/android/launcher3/dragndrop/v;

.field private n:F

.field o:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/iconarrange/a;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field p:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/iconarrange/a;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Lcom/android/launcher3/dragndrop/v;F)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

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
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/a;->j:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/a;->k:[I

    .line 15
    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput v0, p0, Lcom/android/launcher3/iconarrange/a;->n:F

    .line 19
    .line 20
    new-instance v0, Lcom/android/launcher3/iconarrange/a$a;

    .line 21
    .line 22
    const-string v1, "transX"

    .line 23
    .line 24
    const-class v2, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-direct {v0, p0, v2, v1}, Lcom/android/launcher3/iconarrange/a$a;-><init>(Lcom/android/launcher3/iconarrange/a;Ljava/lang/Class;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/a;->o:Landroid/util/Property;

    .line 30
    .line 31
    new-instance v0, Lcom/android/launcher3/iconarrange/a$b;

    .line 32
    .line 33
    const-string v1, "transY"

    .line 34
    .line 35
    invoke-direct {v0, p0, v2, v1}, Lcom/android/launcher3/iconarrange/a$b;-><init>(Lcom/android/launcher3/iconarrange/a;Ljava/lang/Class;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/a;->p:Landroid/util/Property;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/a;->a:Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    iput-object p2, p0, Lcom/android/launcher3/iconarrange/a;->m:Lcom/android/launcher3/dragndrop/v;

    .line 43
    .line 44
    iput p3, p0, Lcom/android/launcher3/iconarrange/a;->n:F

    .line 45
    .line 46
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/iconarrange/a;)Lcom/android/launcher3/dragndrop/v;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a;->m:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/iconarrange/a;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a;->k:[I

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/iconarrange/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/iconarrange/a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/iconarrange/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/iconarrange/a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/iconarrange/a;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/iconarrange/a;->b:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/iconarrange/a;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/iconarrange/a;->c:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/iconarrange/a;->n:F

    .line 5
    .line 6
    const v1, 0x3f8f5c29    # 1.12f

    .line 7
    .line 8
    .line 9
    mul-float v2, v0, v1

    .line 10
    .line 11
    mul-float/2addr v0, v1

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/a;->k:[I

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    aget v4, v1, v3

    .line 16
    .line 17
    int-to-float v4, v4

    .line 18
    const/4 v5, 0x1

    .line 19
    aget v1, v1, v5

    .line 20
    .line 21
    int-to-float v1, v1

    .line 22
    invoke-virtual {p1, v2, v0, v4, v1}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->k:[I

    .line 26
    .line 27
    aget v1, v0, v3

    .line 28
    .line 29
    int-to-float v1, v1

    .line 30
    aget v0, v0, v5

    .line 31
    .line 32
    int-to-float v0, v0

    .line 33
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a;->a:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/iconarrange/a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/iconarrange/a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public i(IIIILandroid/graphics/Rect;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/iconarrange/a;->f:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/iconarrange/a;->g:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/iconarrange/a;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/iconarrange/a;->i:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/iconarrange/a;->j:Landroid/graphics/Rect;

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/iconarrange/a;->l:I

    .line 12
    .line 13
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/iconarrange/a;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public k(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/iconarrange/a;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public l()V
    .locals 9

    .line 1
    iget v0, p0, Lcom/android/launcher3/iconarrange/a;->h:I

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/iconarrange/a;->i:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->k:[I

    .line 42
    .line 43
    iget v1, p0, Lcom/android/launcher3/iconarrange/a;->h:I

    .line 44
    .line 45
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/a;->j:Landroid/graphics/Rect;

    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    int-to-float v2, v2

    .line 52
    iget v3, p0, Lcom/android/launcher3/iconarrange/a;->n:F

    .line 53
    .line 54
    mul-float/2addr v2, v3

    .line 55
    const/high16 v3, 0x40000000    # 2.0f

    .line 56
    .line 57
    div-float/2addr v2, v3

    .line 58
    float-to-int v2, v2

    .line 59
    sub-int/2addr v1, v2

    .line 60
    const/4 v2, 0x0

    .line 61
    aput v1, v0, v2

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->k:[I

    .line 64
    .line 65
    iget v1, p0, Lcom/android/launcher3/iconarrange/a;->i:I

    .line 66
    .line 67
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/a;->j:Landroid/graphics/Rect;

    .line 68
    .line 69
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    int-to-float v4, v4

    .line 74
    iget v5, p0, Lcom/android/launcher3/iconarrange/a;->n:F

    .line 75
    .line 76
    mul-float/2addr v4, v5

    .line 77
    div-float/2addr v4, v3

    .line 78
    float-to-int v4, v4

    .line 79
    sub-int/2addr v1, v4

    .line 80
    const/4 v4, 0x1

    .line 81
    aput v1, v0, v4

    .line 82
    .line 83
    iget v0, p0, Lcom/android/launcher3/iconarrange/a;->f:I

    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/a;->j:Landroid/graphics/Rect;

    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    int-to-float v1, v1

    .line 92
    iget v5, p0, Lcom/android/launcher3/iconarrange/a;->n:F

    .line 93
    .line 94
    mul-float/2addr v1, v5

    .line 95
    div-float/2addr v1, v3

    .line 96
    float-to-int v1, v1

    .line 97
    sub-int/2addr v0, v1

    .line 98
    iget v1, p0, Lcom/android/launcher3/iconarrange/a;->g:I

    .line 99
    .line 100
    iget-object v5, p0, Lcom/android/launcher3/iconarrange/a;->j:Landroid/graphics/Rect;

    .line 101
    .line 102
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    int-to-float v5, v5

    .line 107
    iget v6, p0, Lcom/android/launcher3/iconarrange/a;->n:F

    .line 108
    .line 109
    mul-float/2addr v5, v6

    .line 110
    div-float/2addr v5, v3

    .line 111
    float-to-int v3, v5

    .line 112
    sub-int/2addr v1, v3

    .line 113
    const v3, 0x3f0ccccd    # 0.55f

    .line 114
    .line 115
    .line 116
    const v5, 0x3f3d70a4    # 0.74f

    .line 117
    .line 118
    .line 119
    const v6, 0x3f07ae14    # 0.53f

    .line 120
    .line 121
    .line 122
    const v7, 0x3e851eb8    # 0.26f

    .line 123
    .line 124
    .line 125
    invoke-static {v6, v7, v3, v5}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    iget-object v5, p0, Lcom/android/launcher3/iconarrange/a;->o:Landroid/util/Property;

    .line 130
    .line 131
    iget-object v6, p0, Lcom/android/launcher3/iconarrange/a;->k:[I

    .line 132
    .line 133
    aget v2, v6, v2

    .line 134
    .line 135
    filled-new-array {v2, v0}, [I

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v5, v0}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 152
    .line 153
    new-instance v2, Lcom/android/launcher3/iconarrange/a$c;

    .line 154
    .line 155
    invoke-direct {v2, p0}, Lcom/android/launcher3/iconarrange/a$c;-><init>(Lcom/android/launcher3/iconarrange/a;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 162
    .line 163
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 167
    .line 168
    const-wide/16 v5, 0x64

    .line 169
    .line 170
    invoke-virtual {v0, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 174
    .line 175
    iget v2, p0, Lcom/android/launcher3/iconarrange/a;->l:I

    .line 176
    .line 177
    int-to-long v7, v2

    .line 178
    invoke-virtual {v0, v7, v8}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 182
    .line 183
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->p:Landroid/util/Property;

    .line 187
    .line 188
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/a;->k:[I

    .line 189
    .line 190
    aget v2, v2, v4

    .line 191
    .line 192
    filled-new-array {v2, v1}, [I

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-static {v0, v1}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 209
    .line 210
    new-instance v1, Lcom/android/launcher3/iconarrange/a$d;

    .line 211
    .line 212
    invoke-direct {v1, p0}, Lcom/android/launcher3/iconarrange/a$d;-><init>(Lcom/android/launcher3/iconarrange/a;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 219
    .line 220
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 221
    .line 222
    .line 223
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 224
    .line 225
    invoke-virtual {v0, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 229
    .line 230
    iget v1, p0, Lcom/android/launcher3/iconarrange/a;->l:I

    .line 231
    .line 232
    int-to-long v1, v1

    .line 233
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 234
    .line 235
    .line 236
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 237
    .line 238
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 239
    .line 240
    .line 241
    :cond_3
    :goto_0
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->d:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a;->e:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
