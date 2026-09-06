.class LF0/q;
.super Ljava/lang/Object;
.source "GradientStrokeParser.java"


# static fields
.field private static final a:LG0/c$a;

.field private static final b:LG0/c$a;

.field private static final c:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const-string v10, "hd"

    .line 2
    .line 3
    const-string v11, "d"

    .line 4
    .line 5
    const-string v0, "nm"

    .line 6
    .line 7
    const-string v1, "g"

    .line 8
    .line 9
    const-string v2, "o"

    .line 10
    .line 11
    const-string v3, "t"

    .line 12
    .line 13
    const-string v4, "s"

    .line 14
    .line 15
    const-string v5, "e"

    .line 16
    .line 17
    const-string v6, "w"

    .line 18
    .line 19
    const-string v7, "lc"

    .line 20
    .line 21
    const-string v8, "lj"

    .line 22
    .line 23
    const-string v9, "ml"

    .line 24
    .line 25
    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, LF0/q;->a:LG0/c$a;

    .line 34
    .line 35
    const-string v0, "p"

    .line 36
    .line 37
    const-string v1, "k"

    .line 38
    .line 39
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, LF0/q;->b:LG0/c$a;

    .line 48
    .line 49
    const-string v0, "n"

    .line 50
    .line 51
    const-string v1, "v"

    .line 52
    .line 53
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, LF0/q;->c:LG0/c$a;

    .line 62
    .line 63
    return-void
.end method

.method static a(LG0/c;Lv0/h;)LC0/f;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v11, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    move-object v5, v2

    .line 13
    move-object v6, v5

    .line 14
    move-object v7, v6

    .line 15
    move-object v8, v7

    .line 16
    move-object v9, v8

    .line 17
    move-object v12, v9

    .line 18
    move-object v13, v12

    .line 19
    move-object v14, v13

    .line 20
    move-object v15, v14

    .line 21
    move v10, v3

    .line 22
    const/16 v16, 0x0

    .line 23
    .line 24
    move-object v3, v15

    .line 25
    :goto_0
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 26
    .line 27
    .line 28
    move-result v17

    .line 29
    if-eqz v17, :cond_c

    .line 30
    .line 31
    sget-object v6, LF0/q;->a:LG0/c$a;

    .line 32
    .line 33
    invoke-virtual {v0, v6}, LG0/c;->F(LG0/c$a;)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    packed-switch v6, :pswitch_data_0

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, LG0/c;->I()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, LG0/c;->J()V

    .line 44
    .line 45
    .line 46
    :goto_1
    const/4 v6, 0x0

    .line 47
    goto :goto_0

    .line 48
    :pswitch_0
    invoke-virtual {v0}, LG0/c;->c()V

    .line 49
    .line 50
    .line 51
    :goto_2
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    if-eqz v6, :cond_6

    .line 56
    .line 57
    invoke-virtual {v0}, LG0/c;->d()V

    .line 58
    .line 59
    .line 60
    const/4 v6, 0x0

    .line 61
    const/16 v18, 0x0

    .line 62
    .line 63
    :goto_3
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 64
    .line 65
    .line 66
    move-result v19

    .line 67
    if-eqz v19, :cond_2

    .line 68
    .line 69
    sget-object v4, LF0/q;->c:LG0/c$a;

    .line 70
    .line 71
    invoke-virtual {v0, v4}, LG0/c;->F(LG0/c$a;)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_1

    .line 76
    .line 77
    move-object/from16 v20, v2

    .line 78
    .line 79
    const/4 v2, 0x1

    .line 80
    if-eq v4, v2, :cond_0

    .line 81
    .line 82
    invoke-virtual {v0}, LG0/c;->I()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, LG0/c;->J()V

    .line 86
    .line 87
    .line 88
    :goto_4
    move-object/from16 v2, v20

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_0
    invoke-static/range {p0 .. p1}, LF0/d;->e(LG0/c;Lv0/h;)LB0/b;

    .line 92
    .line 93
    .line 94
    move-result-object v18

    .line 95
    goto :goto_4

    .line 96
    :cond_1
    move-object/from16 v20, v2

    .line 97
    .line 98
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    goto :goto_3

    .line 103
    :cond_2
    move-object/from16 v20, v2

    .line 104
    .line 105
    invoke-virtual {v0}, LG0/c;->g()V

    .line 106
    .line 107
    .line 108
    const-string v2, "o"

    .line 109
    .line 110
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_4

    .line 115
    .line 116
    move-object/from16 v15, v18

    .line 117
    .line 118
    :cond_3
    const/4 v2, 0x1

    .line 119
    goto :goto_5

    .line 120
    :cond_4
    const-string v2, "d"

    .line 121
    .line 122
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-nez v2, :cond_5

    .line 127
    .line 128
    const-string v2, "g"

    .line 129
    .line 130
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-eqz v2, :cond_3

    .line 135
    .line 136
    :cond_5
    const/4 v2, 0x1

    .line 137
    invoke-virtual {v1, v2}, Lv0/h;->u(Z)V

    .line 138
    .line 139
    .line 140
    move-object/from16 v4, v18

    .line 141
    .line 142
    invoke-interface {v11, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    :goto_5
    move-object/from16 v2, v20

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_6
    move-object/from16 v20, v2

    .line 149
    .line 150
    const/4 v2, 0x1

    .line 151
    invoke-virtual {v0}, LG0/c;->e()V

    .line 152
    .line 153
    .line 154
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 155
    .line 156
    .line 157
    move-result v4

    .line 158
    if-ne v4, v2, :cond_7

    .line 159
    .line 160
    const/4 v2, 0x0

    .line 161
    invoke-interface {v11, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    check-cast v4, LB0/b;

    .line 166
    .line 167
    invoke-interface {v11, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    goto :goto_6

    .line 171
    :cond_7
    const/4 v2, 0x0

    .line 172
    :goto_6
    move-object/from16 v2, v20

    .line 173
    .line 174
    goto/16 :goto_1

    .line 175
    .line 176
    :pswitch_1
    move-object/from16 v20, v2

    .line 177
    .line 178
    const/4 v2, 0x0

    .line 179
    invoke-virtual {v0}, LG0/c;->t()Z

    .line 180
    .line 181
    .line 182
    move-result v16

    .line 183
    goto :goto_6

    .line 184
    :pswitch_2
    move-object/from16 v20, v2

    .line 185
    .line 186
    move-object v4, v3

    .line 187
    invoke-virtual {v0}, LG0/c;->v()D

    .line 188
    .line 189
    .line 190
    move-result-wide v2

    .line 191
    double-to-float v10, v2

    .line 192
    :goto_7
    move-object v3, v4

    .line 193
    goto :goto_6

    .line 194
    :pswitch_3
    move-object/from16 v20, v2

    .line 195
    .line 196
    move-object v4, v3

    .line 197
    invoke-static {}, LC0/r$c;->values()[LC0/r$c;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    invoke-virtual {v0}, LG0/c;->w()I

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    const/4 v6, 0x1

    .line 206
    sub-int/2addr v3, v6

    .line 207
    aget-object v14, v2, v3

    .line 208
    .line 209
    goto :goto_7

    .line 210
    :pswitch_4
    move-object/from16 v20, v2

    .line 211
    .line 212
    move-object v4, v3

    .line 213
    const/4 v6, 0x1

    .line 214
    invoke-static {}, LC0/r$b;->values()[LC0/r$b;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-virtual {v0}, LG0/c;->w()I

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    sub-int/2addr v3, v6

    .line 223
    aget-object v13, v2, v3

    .line 224
    .line 225
    goto :goto_7

    .line 226
    :pswitch_5
    move-object/from16 v20, v2

    .line 227
    .line 228
    move-object v4, v3

    .line 229
    invoke-static/range {p0 .. p1}, LF0/d;->e(LG0/c;Lv0/h;)LB0/b;

    .line 230
    .line 231
    .line 232
    move-result-object v12

    .line 233
    goto/16 :goto_1

    .line 234
    .line 235
    :pswitch_6
    move-object/from16 v20, v2

    .line 236
    .line 237
    move-object v4, v3

    .line 238
    invoke-static/range {p0 .. p1}, LF0/d;->i(LG0/c;Lv0/h;)LB0/f;

    .line 239
    .line 240
    .line 241
    move-result-object v9

    .line 242
    goto/16 :goto_1

    .line 243
    .line 244
    :pswitch_7
    move-object/from16 v20, v2

    .line 245
    .line 246
    move-object v4, v3

    .line 247
    invoke-static/range {p0 .. p1}, LF0/d;->i(LG0/c;Lv0/h;)LB0/f;

    .line 248
    .line 249
    .line 250
    move-result-object v8

    .line 251
    goto/16 :goto_1

    .line 252
    .line 253
    :pswitch_8
    move-object v4, v3

    .line 254
    const/4 v6, 0x1

    .line 255
    invoke-virtual {v0}, LG0/c;->w()I

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    if-ne v2, v6, :cond_8

    .line 260
    .line 261
    sget-object v2, LC0/g;->g:LC0/g;

    .line 262
    .line 263
    goto :goto_8

    .line 264
    :cond_8
    sget-object v2, LC0/g;->h:LC0/g;

    .line 265
    .line 266
    :goto_8
    move-object v3, v4

    .line 267
    goto/16 :goto_1

    .line 268
    .line 269
    :pswitch_9
    move-object/from16 v20, v2

    .line 270
    .line 271
    invoke-static/range {p0 .. p1}, LF0/d;->h(LG0/c;Lv0/h;)LB0/d;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    goto/16 :goto_1

    .line 276
    .line 277
    :pswitch_a
    move-object/from16 v20, v2

    .line 278
    .line 279
    move-object v4, v3

    .line 280
    invoke-virtual {v0}, LG0/c;->d()V

    .line 281
    .line 282
    .line 283
    const/4 v2, -0x1

    .line 284
    :goto_9
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    if-eqz v3, :cond_b

    .line 289
    .line 290
    sget-object v3, LF0/q;->b:LG0/c$a;

    .line 291
    .line 292
    invoke-virtual {v0, v3}, LG0/c;->F(LG0/c$a;)I

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    if-eqz v3, :cond_a

    .line 297
    .line 298
    const/4 v6, 0x1

    .line 299
    if-eq v3, v6, :cond_9

    .line 300
    .line 301
    invoke-virtual {v0}, LG0/c;->I()V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0}, LG0/c;->J()V

    .line 305
    .line 306
    .line 307
    goto :goto_9

    .line 308
    :cond_9
    invoke-static {v0, v1, v2}, LF0/d;->g(LG0/c;Lv0/h;I)LB0/c;

    .line 309
    .line 310
    .line 311
    move-result-object v7

    .line 312
    goto :goto_9

    .line 313
    :cond_a
    const/4 v6, 0x1

    .line 314
    invoke-virtual {v0}, LG0/c;->w()I

    .line 315
    .line 316
    .line 317
    move-result v2

    .line 318
    goto :goto_9

    .line 319
    :cond_b
    invoke-virtual {v0}, LG0/c;->g()V

    .line 320
    .line 321
    .line 322
    goto/16 :goto_7

    .line 323
    .line 324
    :pswitch_b
    move-object/from16 v20, v2

    .line 325
    .line 326
    move-object v4, v3

    .line 327
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v5

    .line 331
    goto/16 :goto_1

    .line 332
    .line 333
    :cond_c
    move-object/from16 v20, v2

    .line 334
    .line 335
    move-object v4, v3

    .line 336
    if-nez v4, :cond_d

    .line 337
    .line 338
    new-instance v3, LB0/d;

    .line 339
    .line 340
    new-instance v0, LI0/a;

    .line 341
    .line 342
    const/16 v1, 0x64

    .line 343
    .line 344
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    invoke-direct {v0, v1}, LI0/a;-><init>(Ljava/lang/Object;)V

    .line 349
    .line 350
    .line 351
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-direct {v3, v0}, LB0/d;-><init>(Ljava/util/List;)V

    .line 356
    .line 357
    .line 358
    move-object v4, v3

    .line 359
    :cond_d
    new-instance v0, LC0/f;

    .line 360
    .line 361
    move-object v1, v5

    .line 362
    move-object v3, v7

    .line 363
    move-object v5, v8

    .line 364
    move-object v6, v9

    .line 365
    move-object v7, v12

    .line 366
    move-object v8, v13

    .line 367
    move-object v9, v14

    .line 368
    move-object v12, v15

    .line 369
    move/from16 v13, v16

    .line 370
    .line 371
    move-object/from16 v2, v20

    .line 372
    .line 373
    invoke-direct/range {v0 .. v13}, LC0/f;-><init>(Ljava/lang/String;LC0/g;LB0/c;LB0/d;LB0/f;LB0/f;LB0/b;LC0/r$b;LC0/r$c;FLjava/util/List;LB0/b;Z)V

    .line 374
    .line 375
    .line 376
    return-object v0

    .line 377
    :pswitch_data_0
    .packed-switch 0x0
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
.end method
