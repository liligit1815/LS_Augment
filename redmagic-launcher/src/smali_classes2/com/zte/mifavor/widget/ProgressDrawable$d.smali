.class Lcom/zte/mifavor/widget/ProgressDrawable$d;
.super Ljava/lang/Object;
.source "ProgressDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/ProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:Lcom/zte/mifavor/widget/ProgressDrawable$c;

.field private n:Lcom/zte/mifavor/widget/ProgressDrawable$b;

.field final synthetic o:Lcom/zte/mifavor/widget/ProgressDrawable;


# direct methods
.method public constructor <init>(Lcom/zte/mifavor/widget/ProgressDrawable;I)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->a:I

    .line 8
    .line 9
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 10
    .line 11
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 12
    .line 13
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->d:I

    .line 14
    .line 15
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->e:I

    .line 16
    .line 17
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->f:I

    .line 18
    .line 19
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 20
    .line 21
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 22
    .line 23
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 24
    .line 25
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->j:I

    .line 26
    .line 27
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->k:I

    .line 28
    .line 29
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->l:I

    .line 30
    .line 31
    sget-object v0, Lcom/zte/mifavor/widget/ProgressDrawable$c;->g:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->m:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 34
    .line 35
    iput p2, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->a:I

    .line 36
    .line 37
    new-instance v0, Lcom/zte/mifavor/widget/ProgressDrawable$b;

    .line 38
    .line 39
    invoke-direct {v0, p1, p2}, Lcom/zte/mifavor/widget/ProgressDrawable$b;-><init>(Lcom/zte/mifavor/widget/ProgressDrawable;I)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->n:Lcom/zte/mifavor/widget/ProgressDrawable$b;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->j:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->m:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v13, 0x0

    .line 31
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 32
    .line 33
    const-wide/high16 v4, 0x4034000000000000L    # 20.0

    .line 34
    .line 35
    if-eqz v1, :cond_6

    .line 36
    .line 37
    const/4 v6, 0x2

    .line 38
    if-eq v1, v6, :cond_5

    .line 39
    .line 40
    const/4 v6, 0x3

    .line 41
    if-eq v1, v6, :cond_4

    .line 42
    .line 43
    const/4 v6, 0x4

    .line 44
    if-eq v1, v6, :cond_0

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v6, Landroid/graphics/PorterDuffXfermode;

    .line 54
    .line 55
    sget-object v7, Landroid/graphics/PorterDuff$Mode;->DST_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 56
    .line 57
    invoke-direct {v6, v7}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v6}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 61
    .line 62
    .line 63
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->a:I

    .line 64
    .line 65
    if-lez v1, :cond_2

    .line 66
    .line 67
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 68
    .line 69
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget v6, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->l:I

    .line 74
    .line 75
    invoke-virtual {v1, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 76
    .line 77
    .line 78
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 79
    .line 80
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->f(Lcom/zte/mifavor/widget/ProgressDrawable;)Lcom/zte/mifavor/widget/n;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    move-wide v6, v2

    .line 85
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 86
    .line 87
    move-wide v8, v4

    .line 88
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 89
    .line 90
    iget v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->d:I

    .line 91
    .line 92
    move-wide v10, v6

    .line 93
    iget v6, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 94
    .line 95
    iget v7, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 96
    .line 97
    move-wide v14, v8

    .line 98
    iget v8, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 99
    .line 100
    iget-object v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 101
    .line 102
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 103
    .line 104
    .line 105
    move-result-object v9

    .line 106
    iget-object v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 107
    .line 108
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->i(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    move-wide/from16 v16, v10

    .line 113
    .line 114
    int-to-double v10, v2

    .line 115
    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    .line 116
    .line 117
    .line 118
    move-result-wide v14

    .line 119
    mul-double/2addr v10, v14

    .line 120
    mul-double v10, v10, v16

    .line 121
    .line 122
    double-to-float v12, v10

    .line 123
    const v10, 0x3f666666    # 0.9f

    .line 124
    .line 125
    .line 126
    const/high16 v11, 0x40000000    # 2.0f

    .line 127
    .line 128
    move-object/from16 v2, p1

    .line 129
    .line 130
    invoke-virtual/range {v1 .. v12}, Lcom/zte/mifavor/widget/n;->a(Landroid/graphics/Canvas;IIIIIILandroid/graphics/Paint;FFF)V

    .line 131
    .line 132
    .line 133
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 134
    .line 135
    int-to-float v1, v1

    .line 136
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 137
    .line 138
    int-to-float v3, v3

    .line 139
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->d:I

    .line 140
    .line 141
    int-to-float v4, v4

    .line 142
    iget-object v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 143
    .line 144
    invoke-static {v5}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 149
    .line 150
    .line 151
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 152
    .line 153
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->a(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 158
    .line 159
    if-ne v1, v3, :cond_1

    .line 160
    .line 161
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 162
    .line 163
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->b(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 168
    .line 169
    if-ne v1, v3, :cond_1

    .line 170
    .line 171
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 172
    .line 173
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->c(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 178
    .line 179
    if-eq v1, v3, :cond_3

    .line 180
    .line 181
    :cond_1
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 182
    .line 183
    int-to-float v1, v1

    .line 184
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 185
    .line 186
    int-to-float v3, v3

    .line 187
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 188
    .line 189
    int-to-float v4, v4

    .line 190
    iget-object v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 191
    .line 192
    invoke-static {v5}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 193
    .line 194
    .line 195
    move-result-object v5

    .line 196
    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 197
    .line 198
    .line 199
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 200
    .line 201
    iget v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 202
    .line 203
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->l(Lcom/zte/mifavor/widget/ProgressDrawable;I)V

    .line 204
    .line 205
    .line 206
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 207
    .line 208
    iget v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 209
    .line 210
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->m(Lcom/zte/mifavor/widget/ProgressDrawable;I)V

    .line 211
    .line 212
    .line 213
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 214
    .line 215
    iget v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 216
    .line 217
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->n(Lcom/zte/mifavor/widget/ProgressDrawable;I)V

    .line 218
    .line 219
    .line 220
    goto :goto_0

    .line 221
    :cond_2
    move-object/from16 v2, p1

    .line 222
    .line 223
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 224
    .line 225
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->l:I

    .line 230
    .line 231
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 232
    .line 233
    .line 234
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 235
    .line 236
    int-to-float v1, v1

    .line 237
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 238
    .line 239
    int-to-float v3, v3

    .line 240
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 241
    .line 242
    int-to-float v4, v4

    .line 243
    iget-object v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 244
    .line 245
    invoke-static {v5}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 246
    .line 247
    .line 248
    move-result-object v5

    .line 249
    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 250
    .line 251
    .line 252
    :cond_3
    :goto_0
    iget-object v0, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 253
    .line 254
    invoke-static {v0}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0, v13}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :cond_4
    move-object/from16 v2, p1

    .line 263
    .line 264
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 265
    .line 266
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->k:I

    .line 271
    .line 272
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 273
    .line 274
    .line 275
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 276
    .line 277
    int-to-float v1, v1

    .line 278
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 279
    .line 280
    int-to-float v3, v3

    .line 281
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->d:I

    .line 282
    .line 283
    int-to-float v4, v4

    .line 284
    iget-object v0, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 285
    .line 286
    invoke-static {v0}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {v2, v1, v3, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 291
    .line 292
    .line 293
    return-void

    .line 294
    :cond_5
    move-object/from16 v2, p1

    .line 295
    .line 296
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 297
    .line 298
    int-to-float v1, v1

    .line 299
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 300
    .line 301
    int-to-float v3, v3

    .line 302
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->d:I

    .line 303
    .line 304
    int-to-float v4, v4

    .line 305
    iget-object v0, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 306
    .line 307
    invoke-static {v0}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    invoke-virtual {v2, v1, v3, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :cond_6
    move-wide/from16 v16, v2

    .line 316
    .line 317
    move-wide v14, v4

    .line 318
    move-object/from16 v2, p1

    .line 319
    .line 320
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 321
    .line 322
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    .line 327
    .line 328
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->DST_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 329
    .line 330
    invoke-direct {v3, v4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 334
    .line 335
    .line 336
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->a:I

    .line 337
    .line 338
    const/4 v3, 0x5

    .line 339
    if-ge v1, v3, :cond_8

    .line 340
    .line 341
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 342
    .line 343
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->l:I

    .line 348
    .line 349
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 350
    .line 351
    .line 352
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 353
    .line 354
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->f(Lcom/zte/mifavor/widget/ProgressDrawable;)Lcom/zte/mifavor/widget/n;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->e:I

    .line 359
    .line 360
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->f:I

    .line 361
    .line 362
    iget v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 363
    .line 364
    iget v6, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 365
    .line 366
    iget v7, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 367
    .line 368
    iget v8, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->d:I

    .line 369
    .line 370
    iget-object v9, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 371
    .line 372
    invoke-static {v9}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 373
    .line 374
    .line 375
    move-result-object v9

    .line 376
    iget-object v10, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 377
    .line 378
    invoke-static {v10}, Lcom/zte/mifavor/widget/ProgressDrawable;->i(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 379
    .line 380
    .line 381
    move-result v10

    .line 382
    int-to-double v10, v10

    .line 383
    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    .line 384
    .line 385
    .line 386
    move-result-wide v14

    .line 387
    mul-double/2addr v10, v14

    .line 388
    mul-double v10, v10, v16

    .line 389
    .line 390
    double-to-float v12, v10

    .line 391
    const v10, 0x3f666666    # 0.9f

    .line 392
    .line 393
    .line 394
    const/high16 v11, 0x40000000    # 2.0f

    .line 395
    .line 396
    invoke-virtual/range {v1 .. v12}, Lcom/zte/mifavor/widget/n;->a(Landroid/graphics/Canvas;IIIIIILandroid/graphics/Paint;FFF)V

    .line 397
    .line 398
    .line 399
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 400
    .line 401
    int-to-float v1, v1

    .line 402
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 403
    .line 404
    int-to-float v3, v3

    .line 405
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->d:I

    .line 406
    .line 407
    int-to-float v4, v4

    .line 408
    iget-object v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 409
    .line 410
    invoke-static {v5}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 411
    .line 412
    .line 413
    move-result-object v5

    .line 414
    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 415
    .line 416
    .line 417
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 418
    .line 419
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->a(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 424
    .line 425
    if-ne v1, v3, :cond_7

    .line 426
    .line 427
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 428
    .line 429
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->b(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 430
    .line 431
    .line 432
    move-result v1

    .line 433
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 434
    .line 435
    if-ne v1, v3, :cond_7

    .line 436
    .line 437
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 438
    .line 439
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->c(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 444
    .line 445
    if-eq v1, v3, :cond_9

    .line 446
    .line 447
    :cond_7
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 448
    .line 449
    int-to-float v1, v1

    .line 450
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 451
    .line 452
    int-to-float v3, v3

    .line 453
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 454
    .line 455
    int-to-float v4, v4

    .line 456
    iget-object v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 457
    .line 458
    invoke-static {v5}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 459
    .line 460
    .line 461
    move-result-object v5

    .line 462
    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 463
    .line 464
    .line 465
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 466
    .line 467
    iget v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 468
    .line 469
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->l(Lcom/zte/mifavor/widget/ProgressDrawable;I)V

    .line 470
    .line 471
    .line 472
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 473
    .line 474
    iget v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 475
    .line 476
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->m(Lcom/zte/mifavor/widget/ProgressDrawable;I)V

    .line 477
    .line 478
    .line 479
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 480
    .line 481
    iget v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 482
    .line 483
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->n(Lcom/zte/mifavor/widget/ProgressDrawable;I)V

    .line 484
    .line 485
    .line 486
    goto :goto_1

    .line 487
    :cond_8
    iget-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 488
    .line 489
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 490
    .line 491
    .line 492
    move-result-object v1

    .line 493
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->l:I

    .line 494
    .line 495
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 496
    .line 497
    .line 498
    iget v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 499
    .line 500
    int-to-float v1, v1

    .line 501
    iget v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 502
    .line 503
    int-to-float v3, v3

    .line 504
    iget v4, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 505
    .line 506
    int-to-float v4, v4

    .line 507
    iget-object v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 508
    .line 509
    invoke-static {v5}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 510
    .line 511
    .line 512
    move-result-object v5

    .line 513
    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 514
    .line 515
    .line 516
    :cond_9
    :goto_1
    iget-object v0, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 517
    .line 518
    invoke-static {v0}, Lcom/zte/mifavor/widget/ProgressDrawable;->g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;

    .line 519
    .line 520
    .line 521
    move-result-object v0

    .line 522
    invoke-virtual {v0, v13}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 523
    .line 524
    .line 525
    return-void
.end method

.method public b(F)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->n:Lcom/zte/mifavor/widget/ProgressDrawable$b;

    .line 6
    .line 7
    invoke-virtual {v2, v1}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->b(F)F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 12
    .line 13
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->h(Lcom/zte/mifavor/widget/ProgressDrawable;)F

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    add-float/2addr v3, v2

    .line 18
    const/high16 v4, 0x43b40000    # 360.0f

    .line 19
    .line 20
    rem-float/2addr v3, v4

    .line 21
    iget-object v5, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 22
    .line 23
    invoke-static {v5}, Lcom/zte/mifavor/widget/ProgressDrawable;->j(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    int-to-double v5, v5

    .line 28
    iget-object v7, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 29
    .line 30
    invoke-static {v7}, Lcom/zte/mifavor/widget/ProgressDrawable;->i(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    int-to-double v7, v7

    .line 35
    float-to-double v9, v3

    .line 36
    const-wide v11, 0x400921fb54442d18L    # Math.PI

    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    mul-double/2addr v9, v11

    .line 42
    const-wide v13, 0x4066800000000000L    # 180.0

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    div-double/2addr v9, v13

    .line 48
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    .line 49
    .line 50
    .line 51
    move-result-wide v15

    .line 52
    mul-double/2addr v7, v15

    .line 53
    add-double/2addr v5, v7

    .line 54
    double-to-int v3, v5

    .line 55
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b:I

    .line 56
    .line 57
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 58
    .line 59
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->k(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    int-to-double v5, v3

    .line 64
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 65
    .line 66
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->i(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    int-to-double v7, v3

    .line 71
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    .line 72
    .line 73
    .line 74
    move-result-wide v9

    .line 75
    mul-double/2addr v7, v9

    .line 76
    sub-double/2addr v5, v7

    .line 77
    double-to-int v3, v5

    .line 78
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->c:I

    .line 79
    .line 80
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 81
    .line 82
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->e(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->d:I

    .line 87
    .line 88
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 89
    .line 90
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->j(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    int-to-double v5, v3

    .line 95
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 96
    .line 97
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->i(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    int-to-double v7, v3

    .line 102
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 103
    .line 104
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->h(Lcom/zte/mifavor/widget/ProgressDrawable;)F

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    float-to-double v9, v3

    .line 109
    mul-double/2addr v9, v11

    .line 110
    div-double/2addr v9, v13

    .line 111
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    .line 112
    .line 113
    .line 114
    move-result-wide v9

    .line 115
    mul-double/2addr v7, v9

    .line 116
    add-double/2addr v5, v7

    .line 117
    double-to-int v3, v5

    .line 118
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->e:I

    .line 119
    .line 120
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 121
    .line 122
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->k(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    int-to-double v5, v3

    .line 127
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 128
    .line 129
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->i(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    int-to-double v7, v3

    .line 134
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 135
    .line 136
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->h(Lcom/zte/mifavor/widget/ProgressDrawable;)F

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    float-to-double v9, v3

    .line 141
    mul-double/2addr v9, v11

    .line 142
    div-double/2addr v9, v13

    .line 143
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    .line 144
    .line 145
    .line 146
    move-result-wide v9

    .line 147
    mul-double/2addr v7, v9

    .line 148
    sub-double/2addr v5, v7

    .line 149
    double-to-int v3, v5

    .line 150
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->f:I

    .line 151
    .line 152
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 153
    .line 154
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->j(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    int-to-double v5, v3

    .line 159
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 160
    .line 161
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->i(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    int-to-double v7, v3

    .line 166
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 167
    .line 168
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->h(Lcom/zte/mifavor/widget/ProgressDrawable;)F

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    add-float/2addr v3, v4

    .line 173
    float-to-double v9, v3

    .line 174
    mul-double/2addr v9, v11

    .line 175
    div-double/2addr v9, v13

    .line 176
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    .line 177
    .line 178
    .line 179
    move-result-wide v9

    .line 180
    mul-double/2addr v7, v9

    .line 181
    add-double/2addr v5, v7

    .line 182
    double-to-int v3, v5

    .line 183
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->g:I

    .line 184
    .line 185
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 186
    .line 187
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->k(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    int-to-double v5, v3

    .line 192
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 193
    .line 194
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->i(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    int-to-double v7, v3

    .line 199
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->o:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 200
    .line 201
    invoke-static {v3}, Lcom/zte/mifavor/widget/ProgressDrawable;->h(Lcom/zte/mifavor/widget/ProgressDrawable;)F

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    add-float/2addr v3, v4

    .line 206
    float-to-double v3, v3

    .line 207
    mul-double/2addr v3, v11

    .line 208
    div-double/2addr v3, v13

    .line 209
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    .line 210
    .line 211
    .line 212
    move-result-wide v3

    .line 213
    mul-double/2addr v7, v3

    .line 214
    sub-double/2addr v5, v7

    .line 215
    double-to-int v3, v5

    .line 216
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->h:I

    .line 217
    .line 218
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->n:Lcom/zte/mifavor/widget/ProgressDrawable$b;

    .line 219
    .line 220
    invoke-virtual {v3, v1}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e(F)F

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    float-to-int v3, v3

    .line 225
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->i:I

    .line 226
    .line 227
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->n:Lcom/zte/mifavor/widget/ProgressDrawable$b;

    .line 228
    .line 229
    invoke-virtual {v3, v1}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->a(F)F

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    float-to-int v3, v3

    .line 234
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->j:I

    .line 235
    .line 236
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->n:Lcom/zte/mifavor/widget/ProgressDrawable$b;

    .line 237
    .line 238
    invoke-virtual {v3, v1}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->c(F)F

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    float-to-int v3, v3

    .line 243
    iput v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->k:I

    .line 244
    .line 245
    iget-object v3, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->n:Lcom/zte/mifavor/widget/ProgressDrawable$b;

    .line 246
    .line 247
    invoke-virtual {v3, v1}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->d(F)F

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    float-to-int v1, v1

    .line 252
    iput v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->l:I

    .line 253
    .line 254
    const/high16 v1, 0x42200000    # 40.0f

    .line 255
    .line 256
    cmpg-float v1, v2, v1

    .line 257
    .line 258
    if-gtz v1, :cond_0

    .line 259
    .line 260
    sget-object v1, Lcom/zte/mifavor/widget/ProgressDrawable$c;->g:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 261
    .line 262
    iput-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->m:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 263
    .line 264
    return-void

    .line 265
    :cond_0
    const/high16 v1, 0x43a00000    # 320.0f

    .line 266
    .line 267
    cmpl-float v1, v2, v1

    .line 268
    .line 269
    if-ltz v1, :cond_1

    .line 270
    .line 271
    sget-object v1, Lcom/zte/mifavor/widget/ProgressDrawable$c;->k:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 272
    .line 273
    iput-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->m:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 274
    .line 275
    return-void

    .line 276
    :cond_1
    const/high16 v1, 0x438c0000    # 280.0f

    .line 277
    .line 278
    cmpl-float v1, v2, v1

    .line 279
    .line 280
    if-ltz v1, :cond_2

    .line 281
    .line 282
    sget-object v1, Lcom/zte/mifavor/widget/ProgressDrawable$c;->j:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 283
    .line 284
    iput-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->m:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 285
    .line 286
    return-void

    .line 287
    :cond_2
    sget-object v1, Lcom/zte/mifavor/widget/ProgressDrawable$c;->i:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 288
    .line 289
    iput-object v1, v0, Lcom/zte/mifavor/widget/ProgressDrawable$d;->m:Lcom/zte/mifavor/widget/ProgressDrawable$c;

    .line 290
    .line 291
    return-void
.end method
