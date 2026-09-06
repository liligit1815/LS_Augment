.class Lcom/android/launcher3/menu/MenuScroller$a;
.super LW2/d;
.source "MenuScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/menu/MenuScroller;->k0(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/view/View;

.field final synthetic b:Lcom/android/launcher3/menu/MenuScroller;


# direct methods
.method constructor <init>(Lcom/android/launcher3/menu/MenuScroller;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, LW2/d;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(LW2/e;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, LW2/e;->e()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    double-to-float p1, v0

    .line 6
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->Z(Lcom/android/launcher3/menu/MenuScroller;)Lcom/android/launcher3/C2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const-wide/16 v1, 0x0

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    const-string v4, ").value="

    .line 24
    .line 25
    const-string v5, "doEdgeAnimation \u78b0\u5230\u6700\u8fb9\uff0c\u56de\u5f39 item("

    .line 26
    .line 27
    const-string v6, "BeautyMenuTabsScroller"

    .line 28
    .line 29
    const/4 v7, 0x0

    .line 30
    const/4 v8, 0x0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->Y(Lcom/android/launcher3/menu/MenuScroller;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->T(Lcom/android/launcher3/menu/MenuScroller;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->W(Lcom/android/launcher3/menu/MenuScroller;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->a0(Lcom/android/launcher3/menu/MenuScroller;)Lw1/a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-boolean v0, v0, Lw1/a;->a:Z

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 68
    .line 69
    invoke-virtual {v0, v7}, Landroid/view/View;->setTranslationY(F)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->U(Lcom/android/launcher3/menu/MenuScroller;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_7

    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 87
    .line 88
    iget-object v7, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 89
    .line 90
    invoke-static {v0, v7}, Lcom/android/launcher3/menu/MenuScroller;->h0(Lcom/android/launcher3/menu/MenuScroller;Landroid/view/View;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_7

    .line 95
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget-object v5, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 105
    .line 106
    invoke-static {v5}, Lcom/android/launcher3/menu/MenuScroller;->b0(Lcom/android/launcher3/menu/MenuScroller;)Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    iget-object v7, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 111
    .line 112
    invoke-interface {v5, v7}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {v6, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 133
    .line 134
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuScroller;->a0(Lcom/android/launcher3/menu/MenuScroller;)Lw1/a;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    iput-boolean v3, p1, Lw1/a;->a:Z

    .line 139
    .line 140
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 141
    .line 142
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuScroller;->a0(Lcom/android/launcher3/menu/MenuScroller;)Lw1/a;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1}, Lw1/a;->i()LW2/e;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    if-eqz p1, :cond_2

    .line 151
    .line 152
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 153
    .line 154
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuScroller;->a0(Lcom/android/launcher3/menu/MenuScroller;)Lw1/a;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Lw1/a;->i()LW2/e;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p1, v1, v2}, LW2/e;->n(D)LW2/e;

    .line 163
    .line 164
    .line 165
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 166
    .line 167
    invoke-static {p1, v8}, Lcom/android/launcher3/menu/MenuScroller;->c0(Lcom/android/launcher3/menu/MenuScroller;Z)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 171
    .line 172
    invoke-static {p1, v8}, Lcom/android/launcher3/menu/MenuScroller;->g0(Lcom/android/launcher3/menu/MenuScroller;Z)V

    .line 173
    .line 174
    .line 175
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 176
    .line 177
    invoke-static {p0, v8}, Lcom/android/launcher3/menu/MenuScroller;->d0(Lcom/android/launcher3/menu/MenuScroller;Z)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 182
    .line 183
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->V(Lcom/android/launcher3/menu/MenuScroller;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-nez v0, :cond_4

    .line 188
    .line 189
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 190
    .line 191
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->X(Lcom/android/launcher3/menu/MenuScroller;)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_5

    .line 196
    .line 197
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 198
    .line 199
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->W(Lcom/android/launcher3/menu/MenuScroller;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_5

    .line 204
    .line 205
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 206
    .line 207
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->a0(Lcom/android/launcher3/menu/MenuScroller;)Lw1/a;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget-boolean v0, v0, Lw1/a;->a:Z

    .line 212
    .line 213
    if-eqz v0, :cond_5

    .line 214
    .line 215
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 216
    .line 217
    invoke-virtual {v0, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 218
    .line 219
    .line 220
    goto :goto_1

    .line 221
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 222
    .line 223
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 224
    .line 225
    .line 226
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 227
    .line 228
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuScroller;->U(Lcom/android/launcher3/menu/MenuScroller;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-eqz v0, :cond_7

    .line 233
    .line 234
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 235
    .line 236
    iget-object v7, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 237
    .line 238
    invoke-static {v0, v7}, Lcom/android/launcher3/menu/MenuScroller;->h0(Lcom/android/launcher3/menu/MenuScroller;Landroid/view/View;)Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-eqz v0, :cond_7

    .line 243
    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    .line 245
    .line 246
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    iget-object v5, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 253
    .line 254
    invoke-static {v5}, Lcom/android/launcher3/menu/MenuScroller;->b0(Lcom/android/launcher3/menu/MenuScroller;)Ljava/util/List;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    iget-object v7, p0, Lcom/android/launcher3/menu/MenuScroller$a;->a:Landroid/view/View;

    .line 259
    .line 260
    invoke-interface {v5, v7}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 261
    .line 262
    .line 263
    move-result v5

    .line 264
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    invoke-static {v6, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 281
    .line 282
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuScroller;->a0(Lcom/android/launcher3/menu/MenuScroller;)Lw1/a;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    iput-boolean v3, p1, Lw1/a;->a:Z

    .line 287
    .line 288
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 289
    .line 290
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuScroller;->a0(Lcom/android/launcher3/menu/MenuScroller;)Lw1/a;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-virtual {p1}, Lw1/a;->i()LW2/e;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    if-eqz p1, :cond_6

    .line 299
    .line 300
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 301
    .line 302
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuScroller;->a0(Lcom/android/launcher3/menu/MenuScroller;)Lw1/a;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    invoke-virtual {p1}, Lw1/a;->i()LW2/e;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    invoke-virtual {p1, v1, v2}, LW2/e;->n(D)LW2/e;

    .line 311
    .line 312
    .line 313
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 314
    .line 315
    invoke-static {p1, v8}, Lcom/android/launcher3/menu/MenuScroller;->f0(Lcom/android/launcher3/menu/MenuScroller;Z)V

    .line 316
    .line 317
    .line 318
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 319
    .line 320
    invoke-static {p1, v8}, Lcom/android/launcher3/menu/MenuScroller;->e0(Lcom/android/launcher3/menu/MenuScroller;Z)V

    .line 321
    .line 322
    .line 323
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuScroller$a;->b:Lcom/android/launcher3/menu/MenuScroller;

    .line 324
    .line 325
    invoke-static {p0, v8}, Lcom/android/launcher3/menu/MenuScroller;->d0(Lcom/android/launcher3/menu/MenuScroller;Z)V

    .line 326
    .line 327
    .line 328
    :cond_7
    return-void
.end method
