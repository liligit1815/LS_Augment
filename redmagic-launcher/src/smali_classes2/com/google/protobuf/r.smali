.class final Lcom/google/protobuf/r;
.super Lcom/google/protobuf/q;
.source "ExtensionSchemaLite.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/q<",
        "Lcom/google/protobuf/y$d;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/q;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method a(Ljava/util/Map$Entry;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "**>;)I"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/google/protobuf/y$d;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method b(Lcom/google/protobuf/p;Lcom/google/protobuf/T;I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Lcom/google/protobuf/p;->a(Lcom/google/protobuf/T;I)Lcom/google/protobuf/y$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method c(Ljava/lang/Object;)Lcom/google/protobuf/u;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/protobuf/u<",
            "Lcom/google/protobuf/y$d;",
            ">;"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/protobuf/y$c;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/google/protobuf/y$c;->g:Lcom/google/protobuf/u;

    .line 4
    .line 5
    return-object p0
.end method

.method d(Ljava/lang/Object;)Lcom/google/protobuf/u;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/protobuf/u<",
            "Lcom/google/protobuf/y$d;",
            ">;"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/protobuf/y$c;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/protobuf/y$c;->a()Lcom/google/protobuf/u;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method e(Lcom/google/protobuf/T;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/google/protobuf/y$c;

    .line 2
    .line 3
    return p0
.end method

.method f(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/protobuf/r;->c(Ljava/lang/Object;)Lcom/google/protobuf/u;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/google/protobuf/u;->t()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method g(Ljava/lang/Object;Lcom/google/protobuf/i0;Ljava/lang/Object;Lcom/google/protobuf/p;Lcom/google/protobuf/u;Ljava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Lcom/google/protobuf/i0;",
            "Ljava/lang/Object;",
            "Lcom/google/protobuf/p;",
            "Lcom/google/protobuf/u<",
            "Lcom/google/protobuf/y$d;",
            ">;TUB;",
            "Lcom/google/protobuf/q0<",
            "TUT;TUB;>;)TUB;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    check-cast p3, Lcom/google/protobuf/y$e;

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->d()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object p0, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->h()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/google/protobuf/r$a;->a:[I

    .line 24
    .line 25
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->b()Lcom/google/protobuf/w0$b;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    invoke-virtual {p4}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result p4

    .line 33
    aget p0, p0, p4

    .line 34
    .line 35
    packed-switch p0, :pswitch_data_0

    .line 36
    .line 37
    .line 38
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 39
    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string p2, "Type cannot be packed: "

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object p2, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/google/protobuf/y$d;->l()Lcom/google/protobuf/w0$b;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    throw p0

    .line 67
    :pswitch_0
    new-instance v2, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->k(Ljava/util/List;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->c()Lcom/google/protobuf/A$d;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    move-object v0, p1

    .line 82
    move-object v4, p6

    .line 83
    move-object v5, p7

    .line 84
    invoke-static/range {v0 .. v5}, Lcom/google/protobuf/l0;->z(Ljava/lang/Object;ILjava/util/List;Lcom/google/protobuf/A$d;Ljava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p6

    .line 88
    goto/16 :goto_0

    .line 89
    .line 90
    :pswitch_1
    move-object v4, p6

    .line 91
    new-instance v2, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->c(Ljava/util/List;)V

    .line 97
    .line 98
    .line 99
    goto/16 :goto_0

    .line 100
    .line 101
    :pswitch_2
    move-object v4, p6

    .line 102
    new-instance v2, Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->u(Ljava/util/List;)V

    .line 108
    .line 109
    .line 110
    goto/16 :goto_0

    .line 111
    .line 112
    :pswitch_3
    move-object v4, p6

    .line 113
    new-instance v2, Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->A(Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :pswitch_4
    move-object v4, p6

    .line 124
    new-instance v2, Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->b(Ljava/util/List;)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :pswitch_5
    move-object v4, p6

    .line 134
    new-instance v2, Ljava/util/ArrayList;

    .line 135
    .line 136
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->w(Ljava/util/List;)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :pswitch_6
    move-object v4, p6

    .line 144
    new-instance v2, Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->n(Ljava/util/List;)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :pswitch_7
    move-object v4, p6

    .line 154
    new-instance v2, Ljava/util/ArrayList;

    .line 155
    .line 156
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->C(Ljava/util/List;)V

    .line 160
    .line 161
    .line 162
    goto :goto_0

    .line 163
    :pswitch_8
    move-object v4, p6

    .line 164
    new-instance v2, Ljava/util/ArrayList;

    .line 165
    .line 166
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->t(Ljava/util/List;)V

    .line 170
    .line 171
    .line 172
    goto :goto_0

    .line 173
    :pswitch_9
    move-object v4, p6

    .line 174
    new-instance v2, Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->B(Ljava/util/List;)V

    .line 180
    .line 181
    .line 182
    goto :goto_0

    .line 183
    :pswitch_a
    move-object v4, p6

    .line 184
    new-instance v2, Ljava/util/ArrayList;

    .line 185
    .line 186
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->h(Ljava/util/List;)V

    .line 190
    .line 191
    .line 192
    goto :goto_0

    .line 193
    :pswitch_b
    move-object v4, p6

    .line 194
    new-instance v2, Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->j(Ljava/util/List;)V

    .line 200
    .line 201
    .line 202
    goto :goto_0

    .line 203
    :pswitch_c
    move-object v4, p6

    .line 204
    new-instance v2, Ljava/util/ArrayList;

    .line 205
    .line 206
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 207
    .line 208
    .line 209
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->I(Ljava/util/List;)V

    .line 210
    .line 211
    .line 212
    goto :goto_0

    .line 213
    :pswitch_d
    move-object v4, p6

    .line 214
    new-instance v2, Ljava/util/ArrayList;

    .line 215
    .line 216
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 217
    .line 218
    .line 219
    invoke-interface {p2, v2}, Lcom/google/protobuf/i0;->M(Ljava/util/List;)V

    .line 220
    .line 221
    .line 222
    :goto_0
    iget-object p0, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 223
    .line 224
    invoke-virtual {p5, p0, v2}, Lcom/google/protobuf/u;->x(Lcom/google/protobuf/u$b;Ljava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    return-object p6

    .line 228
    :cond_0
    move-object v0, p1

    .line 229
    move-object v4, p6

    .line 230
    move-object v5, p7

    .line 231
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->b()Lcom/google/protobuf/w0$b;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    sget-object p1, Lcom/google/protobuf/w0$b;->v:Lcom/google/protobuf/w0$b;

    .line 236
    .line 237
    if-ne p0, p1, :cond_2

    .line 238
    .line 239
    invoke-interface {p2}, Lcom/google/protobuf/i0;->s()I

    .line 240
    .line 241
    .line 242
    move-result p0

    .line 243
    iget-object p1, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 244
    .line 245
    invoke-virtual {p1}, Lcom/google/protobuf/y$d;->c()Lcom/google/protobuf/A$d;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-interface {p1, p0}, Lcom/google/protobuf/A$d;->findValueByNumber(I)Lcom/google/protobuf/A$c;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    if-nez p1, :cond_1

    .line 254
    .line 255
    invoke-static {v0, v1, p0, v4, v5}, Lcom/google/protobuf/l0;->J(Ljava/lang/Object;IILjava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    return-object p0

    .line 260
    :cond_1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    goto/16 :goto_1

    .line 265
    .line 266
    :cond_2
    sget-object p0, Lcom/google/protobuf/r$a;->a:[I

    .line 267
    .line 268
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->b()Lcom/google/protobuf/w0$b;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    aget p0, p0, p1

    .line 277
    .line 278
    packed-switch p0, :pswitch_data_1

    .line 279
    .line 280
    .line 281
    const/4 p0, 0x0

    .line 282
    goto/16 :goto_1

    .line 283
    .line 284
    :pswitch_e
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->e()Z

    .line 285
    .line 286
    .line 287
    move-result p0

    .line 288
    if-nez p0, :cond_4

    .line 289
    .line 290
    iget-object p0, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 291
    .line 292
    invoke-virtual {p5, p0}, Lcom/google/protobuf/u;->i(Lcom/google/protobuf/u$b;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    instance-of p1, p0, Lcom/google/protobuf/y;

    .line 297
    .line 298
    if-eqz p1, :cond_4

    .line 299
    .line 300
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    .line 301
    .line 302
    .line 303
    move-result-object p1

    .line 304
    invoke-virtual {p1, p0}, Lcom/google/protobuf/f0;->d(Ljava/lang/Object;)Lcom/google/protobuf/j0;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    move-object p6, p0

    .line 309
    check-cast p6, Lcom/google/protobuf/y;

    .line 310
    .line 311
    invoke-virtual {p6}, Lcom/google/protobuf/y;->isMutable()Z

    .line 312
    .line 313
    .line 314
    move-result p6

    .line 315
    if-nez p6, :cond_3

    .line 316
    .line 317
    invoke-interface {p1}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object p6

    .line 321
    invoke-interface {p1, p6, p0}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    iget-object p0, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 325
    .line 326
    invoke-virtual {p5, p0, p6}, Lcom/google/protobuf/u;->x(Lcom/google/protobuf/u$b;Ljava/lang/Object;)V

    .line 327
    .line 328
    .line 329
    move-object p0, p6

    .line 330
    :cond_3
    invoke-interface {p2, p0, p1, p4}, Lcom/google/protobuf/i0;->H(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 331
    .line 332
    .line 333
    return-object v4

    .line 334
    :cond_4
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->c()Lcom/google/protobuf/T;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    invoke-interface {p2, p0, p4}, Lcom/google/protobuf/i0;->x(Ljava/lang/Class;Lcom/google/protobuf/p;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    goto/16 :goto_1

    .line 347
    .line 348
    :pswitch_f
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->e()Z

    .line 349
    .line 350
    .line 351
    move-result p0

    .line 352
    if-nez p0, :cond_6

    .line 353
    .line 354
    iget-object p0, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 355
    .line 356
    invoke-virtual {p5, p0}, Lcom/google/protobuf/u;->i(Lcom/google/protobuf/u$b;)Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object p0

    .line 360
    instance-of p1, p0, Lcom/google/protobuf/y;

    .line 361
    .line 362
    if-eqz p1, :cond_6

    .line 363
    .line 364
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    invoke-virtual {p1, p0}, Lcom/google/protobuf/f0;->d(Ljava/lang/Object;)Lcom/google/protobuf/j0;

    .line 369
    .line 370
    .line 371
    move-result-object p1

    .line 372
    move-object p6, p0

    .line 373
    check-cast p6, Lcom/google/protobuf/y;

    .line 374
    .line 375
    invoke-virtual {p6}, Lcom/google/protobuf/y;->isMutable()Z

    .line 376
    .line 377
    .line 378
    move-result p6

    .line 379
    if-nez p6, :cond_5

    .line 380
    .line 381
    invoke-interface {p1}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object p6

    .line 385
    invoke-interface {p1, p6, p0}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 386
    .line 387
    .line 388
    iget-object p0, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 389
    .line 390
    invoke-virtual {p5, p0, p6}, Lcom/google/protobuf/u;->x(Lcom/google/protobuf/u$b;Ljava/lang/Object;)V

    .line 391
    .line 392
    .line 393
    move-object p0, p6

    .line 394
    :cond_5
    invoke-interface {p2, p0, p1, p4}, Lcom/google/protobuf/i0;->y(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 395
    .line 396
    .line 397
    return-object v4

    .line 398
    :cond_6
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->c()Lcom/google/protobuf/T;

    .line 399
    .line 400
    .line 401
    move-result-object p0

    .line 402
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 403
    .line 404
    .line 405
    move-result-object p0

    .line 406
    invoke-interface {p2, p0, p4}, Lcom/google/protobuf/i0;->o(Ljava/lang/Class;Lcom/google/protobuf/p;)Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object p0

    .line 410
    goto/16 :goto_1

    .line 411
    .line 412
    :pswitch_10
    invoke-interface {p2}, Lcom/google/protobuf/i0;->E()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object p0

    .line 416
    goto/16 :goto_1

    .line 417
    .line 418
    :pswitch_11
    invoke-interface {p2}, Lcom/google/protobuf/i0;->r()Lcom/google/protobuf/h;

    .line 419
    .line 420
    .line 421
    move-result-object p0

    .line 422
    goto/16 :goto_1

    .line 423
    .line 424
    :pswitch_12
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 425
    .line 426
    const-string p1, "Shouldn\'t reach here."

    .line 427
    .line 428
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    throw p0

    .line 432
    :pswitch_13
    invoke-interface {p2}, Lcom/google/protobuf/i0;->D()J

    .line 433
    .line 434
    .line 435
    move-result-wide p0

    .line 436
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    goto/16 :goto_1

    .line 441
    .line 442
    :pswitch_14
    invoke-interface {p2}, Lcom/google/protobuf/i0;->m()I

    .line 443
    .line 444
    .line 445
    move-result p0

    .line 446
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 447
    .line 448
    .line 449
    move-result-object p0

    .line 450
    goto :goto_1

    .line 451
    :pswitch_15
    invoke-interface {p2}, Lcom/google/protobuf/i0;->g()J

    .line 452
    .line 453
    .line 454
    move-result-wide p0

    .line 455
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 456
    .line 457
    .line 458
    move-result-object p0

    .line 459
    goto :goto_1

    .line 460
    :pswitch_16
    invoke-interface {p2}, Lcom/google/protobuf/i0;->K()I

    .line 461
    .line 462
    .line 463
    move-result p0

    .line 464
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    goto :goto_1

    .line 469
    :pswitch_17
    invoke-interface {p2}, Lcom/google/protobuf/i0;->i()I

    .line 470
    .line 471
    .line 472
    move-result p0

    .line 473
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 474
    .line 475
    .line 476
    move-result-object p0

    .line 477
    goto :goto_1

    .line 478
    :pswitch_18
    invoke-interface {p2}, Lcom/google/protobuf/i0;->e()Z

    .line 479
    .line 480
    .line 481
    move-result p0

    .line 482
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 483
    .line 484
    .line 485
    move-result-object p0

    .line 486
    goto :goto_1

    .line 487
    :pswitch_19
    invoke-interface {p2}, Lcom/google/protobuf/i0;->z()I

    .line 488
    .line 489
    .line 490
    move-result p0

    .line 491
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 492
    .line 493
    .line 494
    move-result-object p0

    .line 495
    goto :goto_1

    .line 496
    :pswitch_1a
    invoke-interface {p2}, Lcom/google/protobuf/i0;->a()J

    .line 497
    .line 498
    .line 499
    move-result-wide p0

    .line 500
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 501
    .line 502
    .line 503
    move-result-object p0

    .line 504
    goto :goto_1

    .line 505
    :pswitch_1b
    invoke-interface {p2}, Lcom/google/protobuf/i0;->s()I

    .line 506
    .line 507
    .line 508
    move-result p0

    .line 509
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 510
    .line 511
    .line 512
    move-result-object p0

    .line 513
    goto :goto_1

    .line 514
    :pswitch_1c
    invoke-interface {p2}, Lcom/google/protobuf/i0;->v()J

    .line 515
    .line 516
    .line 517
    move-result-wide p0

    .line 518
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    goto :goto_1

    .line 523
    :pswitch_1d
    invoke-interface {p2}, Lcom/google/protobuf/i0;->N()J

    .line 524
    .line 525
    .line 526
    move-result-wide p0

    .line 527
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 528
    .line 529
    .line 530
    move-result-object p0

    .line 531
    goto :goto_1

    .line 532
    :pswitch_1e
    invoke-interface {p2}, Lcom/google/protobuf/i0;->readFloat()F

    .line 533
    .line 534
    .line 535
    move-result p0

    .line 536
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 537
    .line 538
    .line 539
    move-result-object p0

    .line 540
    goto :goto_1

    .line 541
    :pswitch_1f
    invoke-interface {p2}, Lcom/google/protobuf/i0;->readDouble()D

    .line 542
    .line 543
    .line 544
    move-result-wide p0

    .line 545
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 546
    .line 547
    .line 548
    move-result-object p0

    .line 549
    :goto_1
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->e()Z

    .line 550
    .line 551
    .line 552
    move-result p1

    .line 553
    if-eqz p1, :cond_7

    .line 554
    .line 555
    iget-object p1, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 556
    .line 557
    invoke-virtual {p5, p1, p0}, Lcom/google/protobuf/u;->a(Lcom/google/protobuf/u$b;Ljava/lang/Object;)V

    .line 558
    .line 559
    .line 560
    return-object v4

    .line 561
    :cond_7
    sget-object p1, Lcom/google/protobuf/r$a;->a:[I

    .line 562
    .line 563
    invoke-virtual {p3}, Lcom/google/protobuf/y$e;->b()Lcom/google/protobuf/w0$b;

    .line 564
    .line 565
    .line 566
    move-result-object p2

    .line 567
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 568
    .line 569
    .line 570
    move-result p2

    .line 571
    aget p1, p1, p2

    .line 572
    .line 573
    const/16 p2, 0x11

    .line 574
    .line 575
    if-eq p1, p2, :cond_8

    .line 576
    .line 577
    const/16 p2, 0x12

    .line 578
    .line 579
    if-eq p1, p2, :cond_8

    .line 580
    .line 581
    goto :goto_2

    .line 582
    :cond_8
    iget-object p1, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 583
    .line 584
    invoke-virtual {p5, p1}, Lcom/google/protobuf/u;->i(Lcom/google/protobuf/u$b;)Ljava/lang/Object;

    .line 585
    .line 586
    .line 587
    move-result-object p1

    .line 588
    if-eqz p1, :cond_9

    .line 589
    .line 590
    invoke-static {p1, p0}, Lcom/google/protobuf/A;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 591
    .line 592
    .line 593
    move-result-object p0

    .line 594
    :cond_9
    :goto_2
    iget-object p1, p3, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 595
    .line 596
    invoke-virtual {p5, p1, p0}, Lcom/google/protobuf/u;->x(Lcom/google/protobuf/u$b;Ljava/lang/Object;)V

    .line 597
    .line 598
    .line 599
    return-object v4

    .line 600
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
    .end packed-switch
.end method

.method h(Lcom/google/protobuf/i0;Ljava/lang/Object;Lcom/google/protobuf/p;Lcom/google/protobuf/u;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/i0;",
            "Ljava/lang/Object;",
            "Lcom/google/protobuf/p;",
            "Lcom/google/protobuf/u<",
            "Lcom/google/protobuf/y$d;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    check-cast p2, Lcom/google/protobuf/y$e;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/google/protobuf/y$e;->c()Lcom/google/protobuf/T;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p1, p0, p3}, Lcom/google/protobuf/i0;->x(Ljava/lang/Class;Lcom/google/protobuf/p;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p2, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 16
    .line 17
    invoke-virtual {p4, p1, p0}, Lcom/google/protobuf/u;->x(Lcom/google/protobuf/u$b;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method i(Lcom/google/protobuf/h;Ljava/lang/Object;Lcom/google/protobuf/p;Lcom/google/protobuf/u;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/h;",
            "Ljava/lang/Object;",
            "Lcom/google/protobuf/p;",
            "Lcom/google/protobuf/u<",
            "Lcom/google/protobuf/y$d;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    check-cast p2, Lcom/google/protobuf/y$e;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/google/protobuf/y$e;->c()Lcom/google/protobuf/T;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/google/protobuf/T;->newBuilderForType()Lcom/google/protobuf/T$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Lcom/google/protobuf/h;->w()Lcom/google/protobuf/i;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1, p3}, Lcom/google/protobuf/T$a;->mergeFrom(Lcom/google/protobuf/i;Lcom/google/protobuf/p;)Lcom/google/protobuf/T$a;

    .line 16
    .line 17
    .line 18
    iget-object p2, p2, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/google/protobuf/T$a;->buildPartial()Lcom/google/protobuf/T;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p4, p2, p0}, Lcom/google/protobuf/u;->x(Lcom/google/protobuf/u$b;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-virtual {p1, p0}, Lcom/google/protobuf/i;->a(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method j(Lcom/google/protobuf/x0;Ljava/util/Map$Entry;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/x0;",
            "Ljava/util/Map$Entry<",
            "**>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/y$d;

    .line 2
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->h()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    sget-object v0, Lcom/google/protobuf/r$a;->a:[I

    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->l()Lcom/google/protobuf/w0$b;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 4
    :pswitch_0
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 6
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    .line 7
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 8
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    move-result-object v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/protobuf/f0;->c(Ljava/lang/Class;)Lcom/google/protobuf/j0;

    move-result-object v0

    .line 9
    invoke-static {p0, p2, p1, v0}, Lcom/google/protobuf/l0;->W(ILjava/util/List;Lcom/google/protobuf/x0;Lcom/google/protobuf/j0;)V

    return-void

    .line 10
    :pswitch_1
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    .line 13
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 14
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    move-result-object v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/protobuf/f0;->c(Ljava/lang/Class;)Lcom/google/protobuf/j0;

    move-result-object v0

    .line 15
    invoke-static {p0, p2, p1, v0}, Lcom/google/protobuf/l0;->T(ILjava/util/List;Lcom/google/protobuf/x0;Lcom/google/protobuf/j0;)V

    return-void

    .line 16
    :pswitch_2
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 17
    invoke-static {p0, p2, p1}, Lcom/google/protobuf/l0;->b0(ILjava/util/List;Lcom/google/protobuf/x0;)V

    return-void

    .line 18
    :pswitch_3
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 19
    invoke-static {p0, p2, p1}, Lcom/google/protobuf/l0;->N(ILjava/util/List;Lcom/google/protobuf/x0;)V

    return-void

    .line 20
    :pswitch_4
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 21
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 22
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 23
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->U(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 24
    :pswitch_5
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 25
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 26
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 27
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->a0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 28
    :pswitch_6
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 29
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 30
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 31
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->Z(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 32
    :pswitch_7
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 33
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 34
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 35
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->Y(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 36
    :pswitch_8
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 37
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 38
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 39
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->X(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 40
    :pswitch_9
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 41
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 42
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 43
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->c0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 44
    :pswitch_a
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 45
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 46
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 47
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->M(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 48
    :pswitch_b
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 49
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 50
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 51
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->Q(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 52
    :pswitch_c
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 53
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 54
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 55
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->R(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 56
    :pswitch_d
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 57
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 58
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 59
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->U(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 60
    :pswitch_e
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 61
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 62
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 63
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->d0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 64
    :pswitch_f
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 65
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 66
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 67
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->V(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 68
    :pswitch_10
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 69
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 70
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 71
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->S(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 72
    :pswitch_11
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result v0

    .line 73
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 74
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->r()Z

    move-result p0

    .line 75
    invoke-static {v0, p2, p1, p0}, Lcom/google/protobuf/l0;->O(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    return-void

    .line 76
    :cond_0
    sget-object v0, Lcom/google/protobuf/r$a;->a:[I

    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->l()Lcom/google/protobuf/w0$b;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1

    :cond_1
    :goto_0
    return-void

    .line 77
    :pswitch_12
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    .line 78
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 79
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    move-result-object v1

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/google/protobuf/f0;->c(Ljava/lang/Class;)Lcom/google/protobuf/j0;

    move-result-object p2

    .line 80
    invoke-interface {p1, p0, v0, p2}, Lcom/google/protobuf/x0;->w(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    return-void

    .line 81
    :pswitch_13
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    .line 82
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 83
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    move-result-object v1

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/google/protobuf/f0;->c(Ljava/lang/Class;)Lcom/google/protobuf/j0;

    move-result-object p2

    .line 84
    invoke-interface {p1, p0, v0, p2}, Lcom/google/protobuf/x0;->i(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    return-void

    .line 85
    :pswitch_14
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->f(ILjava/lang/String;)V

    return-void

    .line 86
    :pswitch_15
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/protobuf/h;

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->j(ILcom/google/protobuf/h;)V

    return-void

    .line 87
    :pswitch_16
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->k(II)V

    return-void

    .line 88
    :pswitch_17
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Lcom/google/protobuf/x0;->p(IJ)V

    return-void

    .line 89
    :pswitch_18
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->N(II)V

    return-void

    .line 90
    :pswitch_19
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Lcom/google/protobuf/x0;->l(IJ)V

    return-void

    .line 91
    :pswitch_1a
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->B(II)V

    return-void

    .line 92
    :pswitch_1b
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->s(II)V

    return-void

    .line 93
    :pswitch_1c
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->A(IZ)V

    return-void

    .line 94
    :pswitch_1d
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->d(II)V

    return-void

    .line 95
    :pswitch_1e
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Lcom/google/protobuf/x0;->x(IJ)V

    return-void

    .line 96
    :pswitch_1f
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->k(II)V

    return-void

    .line 97
    :pswitch_20
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Lcom/google/protobuf/x0;->g(IJ)V

    return-void

    .line 98
    :pswitch_21
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Lcom/google/protobuf/x0;->z(IJ)V

    return-void

    .line 99
    :pswitch_22
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-interface {p1, p0, p2}, Lcom/google/protobuf/x0;->H(IF)V

    return-void

    .line 100
    :pswitch_23
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    move-result p0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Double;

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Lcom/google/protobuf/x0;->t(ID)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
    .end packed-switch
.end method
