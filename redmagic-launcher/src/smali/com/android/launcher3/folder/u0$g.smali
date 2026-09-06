.class Lcom/android/launcher3/folder/u0$g;
.super Ljava/lang/Object;
.source "PreviewBackground.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->p0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;Ljava/util/ArrayList;Ljava/util/ArrayList;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Ljava/util/ArrayList;

.field final synthetic i:Ljava/util/ArrayList;

.field final synthetic j:Landroid/graphics/Rect;

.field final synthetic k:Landroid/graphics/Rect;

.field final synthetic l:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$g;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/folder/u0$g;->h:Ljava/util/ArrayList;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/folder/u0$g;->i:Ljava/util/ArrayList;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/folder/u0$g;->j:Landroid/graphics/Rect;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/folder/u0$g;->k:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 p1, 0x0

    .line 6
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->g:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/high16 v2, 0x3f800000    # 1.0f

    .line 13
    .line 14
    if-ge p1, v1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->g:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    move-object v6, v1

    .line 23
    check-cast v6, Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    if-nez v6, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->h:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Landroid/graphics/Rect;

    .line 35
    .line 36
    iget-object v3, p0, Lcom/android/launcher3/folder/u0$g;->i:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Landroid/graphics/Rect;

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    sub-int/2addr v4, v5

    .line 53
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    sub-int/2addr v5, v7

    .line 62
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    int-to-float v3, v3

    .line 67
    mul-float/2addr v3, v2

    .line 68
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    int-to-float v2, v2

    .line 73
    div-float/2addr v3, v2

    .line 74
    move v2, v4

    .line 75
    const/high16 v4, 0x3f800000    # 1.0f

    .line 76
    .line 77
    move v9, v5

    .line 78
    move v5, v3

    .line 79
    move v3, v9

    .line 80
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/folder/u0;->x0(FLandroid/graphics/Rect;IIFF)Landroid/graphics/Rect;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v6, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 85
    .line 86
    .line 87
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$g;->j:Landroid/graphics/Rect;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->k:Landroid/graphics/Rect;

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_2

    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$g;->j:Landroid/graphics/Rect;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->k:Landroid/graphics/Rect;

    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    sub-int/2addr p1, v1

    .line 113
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->j:Landroid/graphics/Rect;

    .line 114
    .line 115
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    iget-object v3, p0, Lcom/android/launcher3/folder/u0$g;->k:Landroid/graphics/Rect;

    .line 120
    .line 121
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    sub-int v3, v1, v3

    .line 126
    .line 127
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->j:Landroid/graphics/Rect;

    .line 128
    .line 129
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    int-to-float v1, v1

    .line 134
    mul-float/2addr v1, v2

    .line 135
    iget-object v4, p0, Lcom/android/launcher3/folder/u0$g;->k:Landroid/graphics/Rect;

    .line 136
    .line 137
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    int-to-float v4, v4

    .line 142
    div-float v6, v1, v4

    .line 143
    .line 144
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->j:Landroid/graphics/Rect;

    .line 145
    .line 146
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    int-to-float v1, v1

    .line 151
    mul-float/2addr v1, v2

    .line 152
    iget-object v2, p0, Lcom/android/launcher3/folder/u0$g;->k:Landroid/graphics/Rect;

    .line 153
    .line 154
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    int-to-float v2, v2

    .line 159
    div-float v7, v1, v2

    .line 160
    .line 161
    iget-object v8, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 162
    .line 163
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$g;->k:Landroid/graphics/Rect;

    .line 164
    .line 165
    const/high16 v4, 0x3f800000    # 1.0f

    .line 166
    .line 167
    const/high16 v5, 0x3f800000    # 1.0f

    .line 168
    .line 169
    move v2, p1

    .line 170
    invoke-static/range {v0 .. v7}, Lcom/android/launcher3/folder/u0;->y0(FLandroid/graphics/Rect;IIFFFF)Landroid/graphics/Rect;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-static {v8, p1}, Lcom/android/launcher3/folder/u0;->E(Lcom/android/launcher3/folder/u0;Landroid/graphics/Rect;)V

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 179
    .line 180
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$g;->j:Landroid/graphics/Rect;

    .line 181
    .line 182
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->E(Lcom/android/launcher3/folder/u0;Landroid/graphics/Rect;)V

    .line 183
    .line 184
    .line 185
    :goto_2
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_3

    .line 190
    .line 191
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 192
    .line 193
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->o(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/blur/b;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    if-eqz p1, :cond_3

    .line 198
    .line 199
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 200
    .line 201
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->o(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/blur/b;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 206
    .line 207
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    iget-object v3, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 212
    .line 213
    invoke-static {v3}, Lcom/android/launcher3/folder/u0;->r(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 214
    .line 215
    .line 216
    move-result-object v4

    .line 217
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 218
    .line 219
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->s(Lcom/android/launcher3/folder/u0;)Landroid/graphics/Rect;

    .line 220
    .line 221
    .line 222
    move-result-object v5

    .line 223
    iget-object v6, p0, Lcom/android/launcher3/folder/u0$g;->g:Ljava/util/ArrayList;

    .line 224
    .line 225
    const/4 v1, 0x0

    .line 226
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/blur/b;->b(ZLcom/android/launcher3/CellLayout;Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;Ljava/util/ArrayList;)V

    .line 227
    .line 228
    .line 229
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 230
    .line 231
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    if-eqz p1, :cond_4

    .line 236
    .line 237
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$g;->l:Lcom/android/launcher3/folder/u0;

    .line 238
    .line 239
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 244
    .line 245
    .line 246
    :cond_4
    return-void
.end method
