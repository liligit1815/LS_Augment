.class LF0/L;
.super Ljava/lang/Object;
.source "ShapeStrokeParser.java"


# static fields
.field private static final a:LG0/c$a;

.field private static final b:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    const-string v7, "hd"

    .line 2
    .line 3
    const-string v8, "d"

    .line 4
    .line 5
    const-string v0, "nm"

    .line 6
    .line 7
    const-string v1, "c"

    .line 8
    .line 9
    const-string v2, "w"

    .line 10
    .line 11
    const-string v3, "o"

    .line 12
    .line 13
    const-string v4, "lc"

    .line 14
    .line 15
    const-string v5, "lj"

    .line 16
    .line 17
    const-string v6, "ml"

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, LF0/L;->a:LG0/c$a;

    .line 28
    .line 29
    const-string v0, "n"

    .line 30
    .line 31
    const-string v1, "v"

    .line 32
    .line 33
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, LF0/L;->b:LG0/c$a;

    .line 42
    .line 43
    return-void
.end method

.method static a(LG0/c;Lv0/h;)LC0/r;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-instance v5, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    move v11, v3

    .line 12
    move v13, v4

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x0

    .line 16
    const/4 v8, 0x0

    .line 17
    const/4 v9, 0x0

    .line 18
    const/4 v10, 0x0

    .line 19
    const/4 v12, 0x0

    .line 20
    :cond_0
    :goto_0
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 21
    .line 22
    .line 23
    move-result v14

    .line 24
    if-eqz v14, :cond_8

    .line 25
    .line 26
    sget-object v14, LF0/L;->a:LG0/c$a;

    .line 27
    .line 28
    invoke-virtual {v0, v14}, LG0/c;->F(LG0/c$a;)I

    .line 29
    .line 30
    .line 31
    move-result v14

    .line 32
    packed-switch v14, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, LG0/c;->J()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :pswitch_0
    invoke-virtual {v0}, LG0/c;->c()V

    .line 40
    .line 41
    .line 42
    :goto_1
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 43
    .line 44
    .line 45
    move-result v14

    .line 46
    if-eqz v14, :cond_7

    .line 47
    .line 48
    invoke-virtual {v0}, LG0/c;->d()V

    .line 49
    .line 50
    .line 51
    const/4 v14, 0x0

    .line 52
    const/4 v15, 0x0

    .line 53
    :goto_2
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 54
    .line 55
    .line 56
    move-result v16

    .line 57
    if-eqz v16, :cond_3

    .line 58
    .line 59
    sget-object v2, LF0/L;->b:LG0/c$a;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, LG0/c;->F(LG0/c$a;)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_2

    .line 66
    .line 67
    if-eq v2, v1, :cond_1

    .line 68
    .line 69
    invoke-virtual {v0}, LG0/c;->I()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, LG0/c;->J()V

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_1
    invoke-static/range {p0 .. p1}, LF0/d;->e(LG0/c;Lv0/h;)LB0/b;

    .line 77
    .line 78
    .line 79
    move-result-object v15

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v14

    .line 85
    goto :goto_2

    .line 86
    :cond_3
    invoke-virtual {v0}, LG0/c;->g()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v14}, Ljava/lang/String;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v17

    .line 96
    sparse-switch v17, :sswitch_data_0

    .line 97
    .line 98
    .line 99
    :goto_3
    const/4 v2, -0x1

    .line 100
    goto :goto_4

    .line 101
    :sswitch_0
    const-string v2, "o"

    .line 102
    .line 103
    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-nez v2, :cond_4

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_4
    const/4 v2, 0x2

    .line 111
    goto :goto_4

    .line 112
    :sswitch_1
    const-string v2, "g"

    .line 113
    .line 114
    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-nez v2, :cond_5

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_5
    move v2, v1

    .line 122
    goto :goto_4

    .line 123
    :sswitch_2
    const-string v2, "d"

    .line 124
    .line 125
    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-nez v2, :cond_6

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    move v2, v4

    .line 133
    :goto_4
    packed-switch v2, :pswitch_data_1

    .line 134
    .line 135
    .line 136
    move-object/from16 v2, p1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :pswitch_1
    move-object/from16 v2, p1

    .line 140
    .line 141
    move-object v7, v15

    .line 142
    goto :goto_1

    .line 143
    :pswitch_2
    move-object/from16 v2, p1

    .line 144
    .line 145
    invoke-virtual {v2, v1}, Lv0/h;->u(Z)V

    .line 146
    .line 147
    .line 148
    invoke-interface {v5, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_7
    move-object/from16 v2, p1

    .line 153
    .line 154
    invoke-virtual {v0}, LG0/c;->e()V

    .line 155
    .line 156
    .line 157
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 158
    .line 159
    .line 160
    move-result v14

    .line 161
    if-ne v14, v1, :cond_0

    .line 162
    .line 163
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v14

    .line 167
    check-cast v14, LB0/b;

    .line 168
    .line 169
    invoke-interface {v5, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :pswitch_3
    move-object/from16 v2, p1

    .line 175
    .line 176
    invoke-virtual {v0}, LG0/c;->t()Z

    .line 177
    .line 178
    .line 179
    move-result v13

    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :pswitch_4
    move-object/from16 v2, p1

    .line 183
    .line 184
    invoke-virtual {v0}, LG0/c;->v()D

    .line 185
    .line 186
    .line 187
    move-result-wide v14

    .line 188
    double-to-float v11, v14

    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :pswitch_5
    move-object/from16 v2, p1

    .line 192
    .line 193
    invoke-static {}, LC0/r$c;->values()[LC0/r$c;

    .line 194
    .line 195
    .line 196
    move-result-object v12

    .line 197
    invoke-virtual {v0}, LG0/c;->w()I

    .line 198
    .line 199
    .line 200
    move-result v14

    .line 201
    sub-int/2addr v14, v1

    .line 202
    aget-object v12, v12, v14

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :pswitch_6
    move-object/from16 v2, p1

    .line 207
    .line 208
    invoke-static {}, LC0/r$b;->values()[LC0/r$b;

    .line 209
    .line 210
    .line 211
    move-result-object v10

    .line 212
    invoke-virtual {v0}, LG0/c;->w()I

    .line 213
    .line 214
    .line 215
    move-result v14

    .line 216
    sub-int/2addr v14, v1

    .line 217
    aget-object v10, v10, v14

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :pswitch_7
    move-object/from16 v2, p1

    .line 222
    .line 223
    invoke-static/range {p0 .. p1}, LF0/d;->h(LG0/c;Lv0/h;)LB0/d;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :pswitch_8
    move-object/from16 v2, p1

    .line 230
    .line 231
    invoke-static/range {p0 .. p1}, LF0/d;->e(LG0/c;Lv0/h;)LB0/b;

    .line 232
    .line 233
    .line 234
    move-result-object v9

    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :pswitch_9
    move-object/from16 v2, p1

    .line 238
    .line 239
    invoke-static/range {p0 .. p1}, LF0/d;->c(LG0/c;Lv0/h;)LB0/a;

    .line 240
    .line 241
    .line 242
    move-result-object v8

    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :pswitch_a
    move-object/from16 v2, p1

    .line 246
    .line 247
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v6

    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :cond_8
    if-nez v3, :cond_9

    .line 254
    .line 255
    new-instance v3, LB0/d;

    .line 256
    .line 257
    new-instance v0, LI0/a;

    .line 258
    .line 259
    const/16 v1, 0x64

    .line 260
    .line 261
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-direct {v0, v1}, LI0/a;-><init>(Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-direct {v3, v0}, LB0/d;-><init>(Ljava/util/List;)V

    .line 273
    .line 274
    .line 275
    :cond_9
    new-instance v2, LC0/r;

    .line 276
    .line 277
    move-object v4, v7

    .line 278
    move-object v7, v3

    .line 279
    move-object v3, v6

    .line 280
    move-object v6, v8

    .line 281
    move-object v8, v9

    .line 282
    move-object v9, v10

    .line 283
    move-object v10, v12

    .line 284
    move v12, v13

    .line 285
    invoke-direct/range {v2 .. v12}, LC0/r;-><init>(Ljava/lang/String;LB0/b;Ljava/util/List;LB0/a;LB0/d;LB0/b;LC0/r$b;LC0/r$c;FZ)V

    .line 286
    .line 287
    .line 288
    return-object v2

    .line 289
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
    .end packed-switch

    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_2
        0x67 -> :sswitch_1
        0x6f -> :sswitch_0
    .end sparse-switch

    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
