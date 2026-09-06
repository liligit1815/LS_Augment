.class Lcom/android/launcher3/W3$a;
.super Ljava/lang/Object;
.source "MFVAnimationSets.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/W3;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:I

.field final synthetic i:Lcom/android/launcher3/W3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/W3;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/W3$a;->g:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/W3$a;->h:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/W3;->b:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/android/launcher3/W3;->b:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    div-int/lit8 v1, v1, 0x2

    .line 28
    .line 29
    add-int/2addr v0, v1

    .line 30
    iget-object v1, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/android/launcher3/W3;->b:Landroid/view/View;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iget-object v2, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/android/launcher3/W3;->b:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    div-int/lit8 v2, v2, 0x2

    .line 47
    .line 48
    add-int/2addr v1, v2

    .line 49
    iget-object v2, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/android/launcher3/W3;->c:Lcom/android/launcher3/K5;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getWidth()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    iget-object v3, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 58
    .line 59
    iget-object v3, v3, Lcom/android/launcher3/W3;->c:Lcom/android/launcher3/K5;

    .line 60
    .line 61
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    mul-int/2addr v2, v3

    .line 66
    iget-object v3, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 67
    .line 68
    iget-object v3, v3, Lcom/android/launcher3/W3;->c:Lcom/android/launcher3/K5;

    .line 69
    .line 70
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    iget-object v4, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 75
    .line 76
    iget-object v4, v4, Lcom/android/launcher3/W3;->c:Lcom/android/launcher3/K5;

    .line 77
    .line 78
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    mul-int/2addr v3, v4

    .line 83
    add-int/2addr v2, v3

    .line 84
    iget-object v3, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 85
    .line 86
    iget-object v3, v3, Lcom/android/launcher3/W3;->c:Lcom/android/launcher3/K5;

    .line 87
    .line 88
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    add-int/lit8 v3, v3, -0x1

    .line 93
    .line 94
    :goto_0
    if-ltz v3, :cond_6

    .line 95
    .line 96
    iget-object v4, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 97
    .line 98
    iget-object v4, v4, Lcom/android/launcher3/W3;->c:Lcom/android/launcher3/K5;

    .line 99
    .line 100
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    if-eqz v4, :cond_5

    .line 105
    .line 106
    iget-object v5, p0, Lcom/android/launcher3/W3$a;->i:Lcom/android/launcher3/W3;

    .line 107
    .line 108
    iget-object v5, v5, Lcom/android/launcher3/W3;->b:Landroid/view/View;

    .line 109
    .line 110
    if-eq v4, v5, :cond_5

    .line 111
    .line 112
    invoke-static {v4}, Lx1/v;->q(Landroid/view/View;)Z

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    if-eqz v5, :cond_0

    .line 117
    .line 118
    goto/16 :goto_2

    .line 119
    .line 120
    :cond_0
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 125
    .line 126
    .line 127
    move-result v6

    .line 128
    div-int/lit8 v6, v6, 0x2

    .line 129
    .line 130
    add-int/2addr v5, v6

    .line 131
    sub-int/2addr v5, v0

    .line 132
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    .line 133
    .line 134
    .line 135
    move-result v6

    .line 136
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    div-int/lit8 v7, v7, 0x2

    .line 141
    .line 142
    add-int/2addr v6, v7

    .line 143
    sub-int/2addr v6, v1

    .line 144
    iget v7, p0, Lcom/android/launcher3/W3$a;->g:I

    .line 145
    .line 146
    int-to-float v8, v7

    .line 147
    mul-int/2addr v5, v5

    .line 148
    mul-int/2addr v6, v6

    .line 149
    add-int/2addr v5, v6

    .line 150
    int-to-float v5, v5

    .line 151
    int-to-float v6, v2

    .line 152
    div-float/2addr v5, v6

    .line 153
    mul-float/2addr v8, v5

    .line 154
    iget v5, p0, Lcom/android/launcher3/W3$a;->h:I

    .line 155
    .line 156
    add-int/lit8 v5, v5, -0x1

    .line 157
    .line 158
    int-to-float v5, v5

    .line 159
    mul-float/2addr v8, v5

    .line 160
    sub-float v5, p1, v8

    .line 161
    .line 162
    const/4 v6, 0x0

    .line 163
    cmpl-float v6, v5, v6

    .line 164
    .line 165
    if-lez v6, :cond_5

    .line 166
    .line 167
    int-to-float v6, v7

    .line 168
    cmpl-float v6, v5, v6

    .line 169
    .line 170
    if-ltz v6, :cond_1

    .line 171
    .line 172
    int-to-float v5, v7

    .line 173
    :cond_1
    float-to-double v6, v5

    .line 174
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    .line 175
    .line 176
    .line 177
    move-result-wide v8

    .line 178
    double-to-int v8, v8

    .line 179
    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    .line 180
    .line 181
    .line 182
    move-result-wide v6

    .line 183
    double-to-int v6, v6

    .line 184
    sget-object v7, Lcom/android/launcher3/W3;->j:[I

    .line 185
    .line 186
    aget v9, v7, v8

    .line 187
    .line 188
    int-to-float v10, v9

    .line 189
    aget v6, v7, v6

    .line 190
    .line 191
    sub-int/2addr v6, v9

    .line 192
    int-to-float v6, v6

    .line 193
    int-to-float v7, v8

    .line 194
    sub-float/2addr v5, v7

    .line 195
    mul-float/2addr v6, v5

    .line 196
    add-float/2addr v10, v6

    .line 197
    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 202
    .line 203
    .line 204
    move-result v6

    .line 205
    if-eqz v6, :cond_4

    .line 206
    .line 207
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 208
    .line 209
    .line 210
    move-result v6

    .line 211
    if-nez v6, :cond_2

    .line 212
    .line 213
    goto :goto_1

    .line 214
    :cond_2
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 215
    .line 216
    .line 217
    move-result v6

    .line 218
    add-int/2addr v6, v5

    .line 219
    int-to-float v6, v6

    .line 220
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 221
    .line 222
    .line 223
    move-result v7

    .line 224
    int-to-float v7, v7

    .line 225
    div-float/2addr v6, v7

    .line 226
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 227
    .line 228
    .line 229
    move-result v7

    .line 230
    add-int/2addr v7, v5

    .line 231
    int-to-float v5, v7

    .line 232
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 233
    .line 234
    .line 235
    move-result v7

    .line 236
    int-to-float v7, v7

    .line 237
    div-float/2addr v5, v7

    .line 238
    instance-of v7, v4, Lcom/android/launcher3/widget/T;

    .line 239
    .line 240
    if-eqz v7, :cond_3

    .line 241
    .line 242
    move-object v7, v4

    .line 243
    check-cast v7, Lcom/android/launcher3/widget/T;

    .line 244
    .line 245
    invoke-virtual {v7}, Lcom/android/launcher3/widget/x0;->getScaleToFit()F

    .line 246
    .line 247
    .line 248
    move-result v7

    .line 249
    mul-float/2addr v6, v7

    .line 250
    mul-float/2addr v5, v7

    .line 251
    :cond_3
    const/high16 v7, 0x40a00000    # 5.0f

    .line 252
    .line 253
    cmpg-float v8, v6, v7

    .line 254
    .line 255
    if-gtz v8, :cond_5

    .line 256
    .line 257
    cmpg-float v7, v5, v7

    .line 258
    .line 259
    if-gtz v7, :cond_5

    .line 260
    .line 261
    invoke-virtual {v4, v6}, Landroid/view/View;->setScaleX(F)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v4, v5}, Landroid/view/View;->setScaleY(F)V

    .line 265
    .line 266
    .line 267
    goto :goto_2

    .line 268
    :cond_4
    :goto_1
    const-string p0, "MFVAnimationSets"

    .line 269
    .line 270
    const-string p1, "onAnimationUpdate--v.getWidth() == 0 || v.getHeight() == 0"

    .line 271
    .line 272
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    return-void

    .line 276
    :cond_5
    :goto_2
    add-int/lit8 v3, v3, -0x1

    .line 277
    .line 278
    goto/16 :goto_0

    .line 279
    .line 280
    :cond_6
    return-void
.end method
