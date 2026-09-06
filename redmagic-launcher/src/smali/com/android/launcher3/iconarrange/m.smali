.class public Lcom/android/launcher3/iconarrange/m;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "SpacesItemDecoration.java"


# instance fields
.field private g:Landroid/content/Context;

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field private i:I

.field private j:I

.field private k:I


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/drawable/Drawable;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/m;->h:Ljava/util/List;

    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 11
    .line 12
    check-cast p2, Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const p2, 0x7f0704ad

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    float-to-int p1, p1

    .line 26
    iput p1, p0, Lcom/android/launcher3/iconarrange/m;->j:I

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const p2, 0x7f0704ac

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    float-to-int p1, p1

    .line 42
    iput p1, p0, Lcom/android/launcher3/iconarrange/m;->k:I

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 57
    .line 58
    iget p2, p0, Lcom/android/launcher3/iconarrange/m;->j:I

    .line 59
    .line 60
    iget v0, p0, Lcom/android/launcher3/iconarrange/m;->k:I

    .line 61
    .line 62
    mul-int/lit8 v0, v0, 0x2

    .line 63
    .line 64
    add-int/2addr p2, v0

    .line 65
    div-int/2addr p1, p2

    .line 66
    iput p1, p0, Lcom/android/launcher3/iconarrange/m;->i:I

    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 6
    .line 7
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->getViewLayoutPosition()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    iget-object p4, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {p4}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p4, p2}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    const p4, 0x7f070a37

    .line 30
    .line 31
    .line 32
    const v0, 0x7f0704ac

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    if-eqz p2, :cond_2

    .line 37
    .line 38
    if-nez p3, :cond_0

    .line 39
    .line 40
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->h:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    iget v2, p0, Lcom/android/launcher3/iconarrange/m;->i:I

    .line 47
    .line 48
    if-le p2, v2, :cond_0

    .line 49
    .line 50
    iput v1, p1, Landroid/graphics/Rect;->right:I

    .line 51
    .line 52
    iput v1, p1, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    float-to-int p2, p2

    .line 65
    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    float-to-int p0, p0

    .line 78
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->h:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    add-int/lit8 p2, p2, -0x1

    .line 88
    .line 89
    if-ne p3, p2, :cond_1

    .line 90
    .line 91
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->h:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    iget p3, p0, Lcom/android/launcher3/iconarrange/m;->i:I

    .line 98
    .line 99
    if-le p2, p3, :cond_1

    .line 100
    .line 101
    iput v1, p1, Landroid/graphics/Rect;->right:I

    .line 102
    .line 103
    iput v1, p1, Landroid/graphics/Rect;->left:I

    .line 104
    .line 105
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 106
    .line 107
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    float-to-int p2, p2

    .line 116
    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 117
    .line 118
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    float-to-int p0, p0

    .line 129
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 130
    .line 131
    return-void

    .line 132
    :cond_1
    iput v1, p1, Landroid/graphics/Rect;->right:I

    .line 133
    .line 134
    iput v1, p1, Landroid/graphics/Rect;->left:I

    .line 135
    .line 136
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 137
    .line 138
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    float-to-int p2, p2

    .line 147
    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 148
    .line 149
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    float-to-int p0, p0

    .line 160
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 161
    .line 162
    return-void

    .line 163
    :cond_2
    if-nez p3, :cond_4

    .line 164
    .line 165
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->h:Ljava/util/List;

    .line 166
    .line 167
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    iget v2, p0, Lcom/android/launcher3/iconarrange/m;->i:I

    .line 172
    .line 173
    if-le p2, v2, :cond_4

    .line 174
    .line 175
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 176
    .line 177
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 182
    .line 183
    .line 184
    move-result p2

    .line 185
    if-eqz p2, :cond_3

    .line 186
    .line 187
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 188
    .line 189
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 194
    .line 195
    .line 196
    move-result p2

    .line 197
    float-to-int p2, p2

    .line 198
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 199
    .line 200
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 201
    .line 202
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    float-to-int p0, p0

    .line 211
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 215
    .line 216
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 221
    .line 222
    .line 223
    move-result p2

    .line 224
    float-to-int p2, p2

    .line 225
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 226
    .line 227
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 228
    .line 229
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    float-to-int p0, p0

    .line 238
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 239
    .line 240
    :goto_0
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 241
    .line 242
    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 243
    .line 244
    return-void

    .line 245
    :cond_4
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->h:Ljava/util/List;

    .line 246
    .line 247
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 248
    .line 249
    .line 250
    move-result p2

    .line 251
    add-int/lit8 p2, p2, -0x1

    .line 252
    .line 253
    if-ne p3, p2, :cond_6

    .line 254
    .line 255
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->h:Ljava/util/List;

    .line 256
    .line 257
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    iget p3, p0, Lcom/android/launcher3/iconarrange/m;->i:I

    .line 262
    .line 263
    if-le p2, p3, :cond_6

    .line 264
    .line 265
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 266
    .line 267
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 268
    .line 269
    .line 270
    move-result-object p2

    .line 271
    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 272
    .line 273
    .line 274
    move-result p2

    .line 275
    if-eqz p2, :cond_5

    .line 276
    .line 277
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 278
    .line 279
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 284
    .line 285
    .line 286
    move-result p2

    .line 287
    float-to-int p2, p2

    .line 288
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 289
    .line 290
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 291
    .line 292
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 297
    .line 298
    .line 299
    move-result p0

    .line 300
    float-to-int p0, p0

    .line 301
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 302
    .line 303
    goto :goto_1

    .line 304
    :cond_5
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 305
    .line 306
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 311
    .line 312
    .line 313
    move-result p2

    .line 314
    float-to-int p2, p2

    .line 315
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 316
    .line 317
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 318
    .line 319
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    float-to-int p0, p0

    .line 328
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 329
    .line 330
    :goto_1
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 331
    .line 332
    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 333
    .line 334
    return-void

    .line 335
    :cond_6
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 336
    .line 337
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 338
    .line 339
    .line 340
    move-result-object p2

    .line 341
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 342
    .line 343
    .line 344
    move-result p2

    .line 345
    float-to-int p2, p2

    .line 346
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 347
    .line 348
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/m;->g:Landroid/content/Context;

    .line 349
    .line 350
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 355
    .line 356
    .line 357
    move-result p0

    .line 358
    float-to-int p0, p0

    .line 359
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 360
    .line 361
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 362
    .line 363
    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 364
    .line 365
    return-void
.end method
