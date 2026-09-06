.class public LF0/c;
.super Ljava/lang/Object;
.source "AnimatableTransformParser.java"


# static fields
.field private static final a:LG0/c$a;

.field private static final b:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    const-string v8, "sk"

    .line 2
    .line 3
    const-string v9, "sa"

    .line 4
    .line 5
    const-string v0, "a"

    .line 6
    .line 7
    const-string v1, "p"

    .line 8
    .line 9
    const-string v2, "s"

    .line 10
    .line 11
    const-string v3, "rz"

    .line 12
    .line 13
    const-string v4, "r"

    .line 14
    .line 15
    const-string v5, "o"

    .line 16
    .line 17
    const-string v6, "so"

    .line 18
    .line 19
    const-string v7, "eo"

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, LF0/c;->a:LG0/c$a;

    .line 30
    .line 31
    const-string v0, "k"

    .line 32
    .line 33
    filled-new-array {v0}, [Ljava/lang/String;

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
    sput-object v0, LF0/c;->b:LG0/c$a;

    .line 42
    .line 43
    return-void
.end method

.method private static a(LB0/e;)Z
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, LB0/e;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, LB0/e;->getKeyframes()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, LI0/a;

    .line 19
    .line 20
    iget-object p0, p0, LI0/a;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Landroid/graphics/PointF;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0, v0}, Landroid/graphics/PointF;->equals(FF)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return v1

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method private static b(LB0/m;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LB0/m<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;)Z"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    instance-of v0, p0, LB0/i;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, LB0/m;->b()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, LB0/m;->getKeyframes()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, LI0/a;

    .line 23
    .line 24
    iget-object p0, p0, LI0/a;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Landroid/graphics/PointF;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, v0, v0}, Landroid/graphics/PointF;->equals(FF)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return v1

    .line 37
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method private static c(LB0/b;)Z
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, LB0/b;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, LB0/b;->getKeyframes()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, LI0/a;

    .line 19
    .line 20
    iget-object p0, p0, LI0/a;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ljava/lang/Float;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v0, 0x0

    .line 29
    cmpl-float p0, p0, v0

    .line 30
    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return v1

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method private static d(LB0/g;)Z
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, LB0/g;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, LB0/g;->getKeyframes()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, LI0/a;

    .line 19
    .line 20
    iget-object p0, p0, LI0/a;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, LI0/d;

    .line 23
    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    invoke-virtual {p0, v0, v0}, LI0/d;->a(FF)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return v1

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method private static e(LB0/b;)Z
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, LB0/b;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, LB0/b;->getKeyframes()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, LI0/a;

    .line 19
    .line 20
    iget-object p0, p0, LI0/a;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ljava/lang/Float;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v0, 0x0

    .line 29
    cmpl-float p0, p0, v0

    .line 30
    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return v1

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method private static f(LB0/b;)Z
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, LB0/b;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, LB0/b;->getKeyframes()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, LI0/a;

    .line 19
    .line 20
    iget-object p0, p0, LI0/a;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ljava/lang/Float;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v0, 0x0

    .line 29
    cmpl-float p0, p0, v0

    .line 30
    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return v1

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method public static g(LG0/c;Lv0/h;)LB0/l;
    .locals 26
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v3, LG0/c$b;->i:LG0/c$b;

    .line 10
    .line 11
    const/4 v8, 0x0

    .line 12
    if-ne v1, v3, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    move v9, v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v9, v8

    .line 18
    :goto_0
    if-eqz v9, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, LG0/c;->d()V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 v1, 0x0

    .line 24
    const/4 v11, 0x0

    .line 25
    const/4 v12, 0x0

    .line 26
    const/4 v13, 0x0

    .line 27
    const/4 v14, 0x0

    .line 28
    const/4 v15, 0x0

    .line 29
    const/16 v21, 0x0

    .line 30
    .line 31
    const/16 v22, 0x0

    .line 32
    .line 33
    const/16 v23, 0x0

    .line 34
    .line 35
    :goto_1
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_6

    .line 40
    .line 41
    sget-object v3, LF0/c;->a:LG0/c$a;

    .line 42
    .line 43
    invoke-virtual {v0, v3}, LG0/c;->F(LG0/c$a;)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    packed-switch v3, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, LG0/c;->I()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, LG0/c;->J()V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :pswitch_0
    invoke-static {v0, v2, v8}, LF0/d;->f(LG0/c;Lv0/h;Z)LB0/b;

    .line 58
    .line 59
    .line 60
    move-result-object v15

    .line 61
    goto :goto_1

    .line 62
    :pswitch_1
    invoke-static {v0, v2, v8}, LF0/d;->f(LG0/c;Lv0/h;Z)LB0/b;

    .line 63
    .line 64
    .line 65
    move-result-object v14

    .line 66
    goto :goto_1

    .line 67
    :pswitch_2
    invoke-static {v0, v2, v8}, LF0/d;->f(LG0/c;Lv0/h;Z)LB0/b;

    .line 68
    .line 69
    .line 70
    move-result-object v23

    .line 71
    goto :goto_1

    .line 72
    :pswitch_3
    invoke-static {v0, v2, v8}, LF0/d;->f(LG0/c;Lv0/h;Z)LB0/b;

    .line 73
    .line 74
    .line 75
    move-result-object v22

    .line 76
    goto :goto_1

    .line 77
    :pswitch_4
    invoke-static/range {p0 .. p1}, LF0/d;->h(LG0/c;Lv0/h;)LB0/d;

    .line 78
    .line 79
    .line 80
    move-result-object v21

    .line 81
    goto :goto_1

    .line 82
    :pswitch_5
    const-string v1, "Lottie doesn\'t support 3D layers."

    .line 83
    .line 84
    invoke-virtual {v2, v1}, Lv0/h;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :pswitch_6
    invoke-static {v0, v2, v8}, LF0/d;->f(LG0/c;Lv0/h;Z)LB0/b;

    .line 88
    .line 89
    .line 90
    move-result-object v16

    .line 91
    invoke-virtual/range {v16 .. v16}, LB0/b;->getKeyframes()Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    const/4 v3, 0x0

    .line 100
    if-eqz v1, :cond_2

    .line 101
    .line 102
    invoke-virtual/range {v16 .. v16}, LB0/b;->getKeyframes()Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    move-object v4, v1

    .line 107
    new-instance v1, LI0/a;

    .line 108
    .line 109
    move v5, v3

    .line 110
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    move-object v6, v4

    .line 115
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v2}, Lv0/h;->f()F

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    const/4 v5, 0x0

    .line 128
    move-object/from16 v17, v6

    .line 129
    .line 130
    const/4 v6, 0x0

    .line 131
    move-object/from16 v10, v17

    .line 132
    .line 133
    invoke-direct/range {v1 .. v7}, LI0/a;-><init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {v10, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_2
    move v5, v3

    .line 141
    invoke-virtual/range {v16 .. v16}, LB0/b;->getKeyframes()Ljava/util/List;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast v1, LI0/a;

    .line 150
    .line 151
    iget-object v1, v1, LI0/a;->b:Ljava/lang/Object;

    .line 152
    .line 153
    if-nez v1, :cond_3

    .line 154
    .line 155
    invoke-virtual/range {v16 .. v16}, LB0/b;->getKeyframes()Ljava/util/List;

    .line 156
    .line 157
    .line 158
    move-result-object v10

    .line 159
    new-instance v1, LI0/a;

    .line 160
    .line 161
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-virtual/range {p1 .. p1}, Lv0/h;->f()F

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 174
    .line 175
    .line 176
    move-result-object v7

    .line 177
    const/4 v5, 0x0

    .line 178
    const/4 v6, 0x0

    .line 179
    move-object/from16 v2, p1

    .line 180
    .line 181
    invoke-direct/range {v1 .. v7}, LI0/a;-><init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 182
    .line 183
    .line 184
    invoke-interface {v10, v8, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    :cond_3
    :goto_2
    move-object/from16 v2, p1

    .line 188
    .line 189
    move-object/from16 v1, v16

    .line 190
    .line 191
    goto/16 :goto_1

    .line 192
    .line 193
    :pswitch_7
    invoke-static/range {p0 .. p1}, LF0/d;->j(LG0/c;Lv0/h;)LB0/g;

    .line 194
    .line 195
    .line 196
    move-result-object v13

    .line 197
    :goto_3
    move-object/from16 v2, p1

    .line 198
    .line 199
    goto/16 :goto_1

    .line 200
    .line 201
    :pswitch_8
    invoke-static/range {p0 .. p1}, LF0/a;->b(LG0/c;Lv0/h;)LB0/m;

    .line 202
    .line 203
    .line 204
    move-result-object v12

    .line 205
    goto :goto_3

    .line 206
    :pswitch_9
    invoke-virtual {v0}, LG0/c;->d()V

    .line 207
    .line 208
    .line 209
    :goto_4
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    if-eqz v2, :cond_5

    .line 214
    .line 215
    sget-object v2, LF0/c;->b:LG0/c$a;

    .line 216
    .line 217
    invoke-virtual {v0, v2}, LG0/c;->F(LG0/c$a;)I

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-eqz v2, :cond_4

    .line 222
    .line 223
    invoke-virtual {v0}, LG0/c;->I()V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0}, LG0/c;->J()V

    .line 227
    .line 228
    .line 229
    goto :goto_4

    .line 230
    :cond_4
    invoke-static/range {p0 .. p1}, LF0/a;->a(LG0/c;Lv0/h;)LB0/e;

    .line 231
    .line 232
    .line 233
    move-result-object v11

    .line 234
    goto :goto_4

    .line 235
    :cond_5
    invoke-virtual {v0}, LG0/c;->g()V

    .line 236
    .line 237
    .line 238
    goto :goto_3

    .line 239
    :cond_6
    if-eqz v9, :cond_7

    .line 240
    .line 241
    invoke-virtual {v0}, LG0/c;->g()V

    .line 242
    .line 243
    .line 244
    :cond_7
    invoke-static {v11}, LF0/c;->a(LB0/e;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_8

    .line 249
    .line 250
    const/16 v17, 0x0

    .line 251
    .line 252
    goto :goto_5

    .line 253
    :cond_8
    move-object/from16 v17, v11

    .line 254
    .line 255
    :goto_5
    invoke-static {v12}, LF0/c;->b(LB0/m;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-eqz v0, :cond_9

    .line 260
    .line 261
    const/4 v12, 0x0

    .line 262
    :cond_9
    invoke-static {v1}, LF0/c;->c(LB0/b;)Z

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    if-eqz v0, :cond_a

    .line 267
    .line 268
    const/16 v20, 0x0

    .line 269
    .line 270
    goto :goto_6

    .line 271
    :cond_a
    move-object/from16 v20, v1

    .line 272
    .line 273
    :goto_6
    invoke-static {v13}, LF0/c;->d(LB0/g;)Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_b

    .line 278
    .line 279
    const/16 v19, 0x0

    .line 280
    .line 281
    goto :goto_7

    .line 282
    :cond_b
    move-object/from16 v19, v13

    .line 283
    .line 284
    :goto_7
    invoke-static {v14}, LF0/c;->f(LB0/b;)Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    if-eqz v0, :cond_c

    .line 289
    .line 290
    const/16 v24, 0x0

    .line 291
    .line 292
    goto :goto_8

    .line 293
    :cond_c
    move-object/from16 v24, v14

    .line 294
    .line 295
    :goto_8
    invoke-static {v15}, LF0/c;->e(LB0/b;)Z

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    if-eqz v0, :cond_d

    .line 300
    .line 301
    const/16 v25, 0x0

    .line 302
    .line 303
    goto :goto_9

    .line 304
    :cond_d
    move-object/from16 v25, v15

    .line 305
    .line 306
    :goto_9
    new-instance v16, LB0/l;

    .line 307
    .line 308
    move-object/from16 v18, v12

    .line 309
    .line 310
    invoke-direct/range {v16 .. v25}, LB0/l;-><init>(LB0/e;LB0/m;LB0/g;LB0/b;LB0/d;LB0/b;LB0/b;LB0/b;LB0/b;)V

    .line 311
    .line 312
    .line 313
    return-object v16

    .line 314
    nop

    .line 315
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
