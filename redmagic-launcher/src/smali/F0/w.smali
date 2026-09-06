.class public LF0/w;
.super Ljava/lang/Object;
.source "LottieCompositionMoshiParser.java"


# static fields
.field private static final a:LG0/c$a;

.field static b:LG0/c$a;

.field private static final c:LG0/c$a;

.field private static final d:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    const-string v9, "chars"

    .line 2
    .line 3
    const-string v10, "markers"

    .line 4
    .line 5
    const-string v0, "w"

    .line 6
    .line 7
    const-string v1, "h"

    .line 8
    .line 9
    const-string v2, "ip"

    .line 10
    .line 11
    const-string v3, "op"

    .line 12
    .line 13
    const-string v4, "fr"

    .line 14
    .line 15
    const-string v5, "v"

    .line 16
    .line 17
    const-string v6, "layers"

    .line 18
    .line 19
    const-string v7, "assets"

    .line 20
    .line 21
    const-string v8, "fonts"

    .line 22
    .line 23
    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, LF0/w;->a:LG0/c$a;

    .line 32
    .line 33
    const-string v5, "p"

    .line 34
    .line 35
    const-string v6, "u"

    .line 36
    .line 37
    const-string v1, "id"

    .line 38
    .line 39
    const-string v2, "layers"

    .line 40
    .line 41
    const-string v3, "w"

    .line 42
    .line 43
    const-string v4, "h"

    .line 44
    .line 45
    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, LF0/w;->b:LG0/c$a;

    .line 54
    .line 55
    const-string v0, "list"

    .line 56
    .line 57
    filled-new-array {v0}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, LF0/w;->c:LG0/c$a;

    .line 66
    .line 67
    const-string v0, "tm"

    .line 68
    .line 69
    const-string v1, "dr"

    .line 70
    .line 71
    const-string v2, "cm"

    .line 72
    .line 73
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sput-object v0, LF0/w;->d:LG0/c$a;

    .line 82
    .line 83
    return-void
.end method

.method public static a(LG0/c;)Lv0/h;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, LH0/h;->e()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    new-instance v8, Lo/j;

    .line 8
    .line 9
    invoke-direct {v8}, Lo/j;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v7, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v9, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v10, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v12, Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v13, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v11, Lo/s;

    .line 38
    .line 39
    invoke-direct {v11}, Lo/s;-><init>()V

    .line 40
    .line 41
    .line 42
    new-instance v2, Lv0/h;

    .line 43
    .line 44
    invoke-direct {v2}, Lv0/h;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, LG0/c;->d()V

    .line 48
    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    move v5, v3

    .line 52
    move v6, v5

    .line 53
    const/4 v14, 0x0

    .line 54
    const/4 v15, 0x0

    .line 55
    :goto_0
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 56
    .line 57
    .line 58
    move-result v16

    .line 59
    if-eqz v16, :cond_1

    .line 60
    .line 61
    const/16 v16, 0x0

    .line 62
    .line 63
    sget-object v4, LF0/w;->a:LG0/c$a;

    .line 64
    .line 65
    invoke-virtual {v0, v4}, LG0/c;->F(LG0/c$a;)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    packed-switch v4, :pswitch_data_0

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, LG0/c;->I()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, LG0/c;->J()V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :pswitch_0
    invoke-static {v0, v13}, LF0/w;->f(LG0/c;Ljava/util/List;)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :pswitch_1
    invoke-static {v0, v2, v11}, LF0/w;->c(LG0/c;Lv0/h;Lo/s;)V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :pswitch_2
    invoke-static {v0, v12}, LF0/w;->d(LG0/c;Ljava/util/Map;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :pswitch_3
    invoke-static {v0, v2, v9, v10}, LF0/w;->b(LG0/c;Lv0/h;Ljava/util/Map;Ljava/util/Map;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :pswitch_4
    invoke-static {v0, v2, v7, v8}, LF0/w;->e(LG0/c;Lv0/h;Ljava/util/List;Lo/j;)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :pswitch_5
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    const-string v0, "\\."

    .line 104
    .line 105
    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    aget-object v4, v0, v16

    .line 110
    .line 111
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v17

    .line 115
    const/4 v4, 0x1

    .line 116
    aget-object v4, v0, v4

    .line 117
    .line 118
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v18

    .line 122
    const/4 v4, 0x2

    .line 123
    aget-object v0, v0, v4

    .line 124
    .line 125
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v19

    .line 129
    const/16 v21, 0x4

    .line 130
    .line 131
    const/16 v22, 0x0

    .line 132
    .line 133
    const/16 v20, 0x4

    .line 134
    .line 135
    invoke-static/range {v17 .. v22}, LH0/h;->j(IIIIII)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-nez v0, :cond_0

    .line 140
    .line 141
    const-string v0, "Lottie only supports bodymovin >= 4.4.0"

    .line 142
    .line 143
    invoke-virtual {v2, v0}, Lv0/h;->a(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_0
    :goto_1
    move-object/from16 v0, p0

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :pswitch_6
    move v4, v1

    .line 150
    invoke-virtual/range {p0 .. p0}, LG0/c;->v()D

    .line 151
    .line 152
    .line 153
    move-result-wide v0

    .line 154
    double-to-float v6, v0

    .line 155
    :goto_2
    move-object/from16 v0, p0

    .line 156
    .line 157
    move v1, v4

    .line 158
    goto :goto_0

    .line 159
    :pswitch_7
    move v4, v1

    .line 160
    invoke-virtual/range {p0 .. p0}, LG0/c;->v()D

    .line 161
    .line 162
    .line 163
    move-result-wide v0

    .line 164
    double-to-float v0, v0

    .line 165
    const v1, 0x3c23d70a    # 0.01f

    .line 166
    .line 167
    .line 168
    sub-float v5, v0, v1

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :pswitch_8
    move v4, v1

    .line 172
    invoke-virtual/range {p0 .. p0}, LG0/c;->v()D

    .line 173
    .line 174
    .line 175
    move-result-wide v0

    .line 176
    double-to-float v3, v0

    .line 177
    goto :goto_2

    .line 178
    :pswitch_9
    move v4, v1

    .line 179
    invoke-virtual/range {p0 .. p0}, LG0/c;->w()I

    .line 180
    .line 181
    .line 182
    move-result v15

    .line 183
    goto :goto_1

    .line 184
    :pswitch_a
    move v4, v1

    .line 185
    invoke-virtual/range {p0 .. p0}, LG0/c;->w()I

    .line 186
    .line 187
    .line 188
    move-result v14

    .line 189
    goto :goto_1

    .line 190
    :cond_1
    move v4, v1

    .line 191
    const/16 v16, 0x0

    .line 192
    .line 193
    int-to-float v0, v14

    .line 194
    mul-float/2addr v0, v4

    .line 195
    float-to-int v0, v0

    .line 196
    int-to-float v1, v15

    .line 197
    mul-float/2addr v1, v4

    .line 198
    float-to-int v1, v1

    .line 199
    move v4, v3

    .line 200
    new-instance v3, Landroid/graphics/Rect;

    .line 201
    .line 202
    move/from16 v14, v16

    .line 203
    .line 204
    invoke-direct {v3, v14, v14, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 205
    .line 206
    .line 207
    invoke-virtual/range {v2 .. v13}, Lv0/h;->s(Landroid/graphics/Rect;FFFLjava/util/List;Lo/j;Ljava/util/Map;Ljava/util/Map;Lo/s;Ljava/util/Map;Ljava/util/List;)V

    .line 208
    .line 209
    .line 210
    return-object v2

    .line 211
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
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static b(LG0/c;Lv0/h;Ljava/util/Map;Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LG0/c;",
            "Lv0/h;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "LD0/e;",
            ">;>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lv0/q;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LG0/c;->c()V

    .line 2
    .line 3
    .line 4
    :goto_0
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_9

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v1, Lo/j;

    .line 16
    .line 17
    invoke-direct {v1}, Lo/j;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, LG0/c;->d()V

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    move v5, v2

    .line 26
    move v6, v5

    .line 27
    move-object v7, v3

    .line 28
    move-object v8, v7

    .line 29
    move-object v9, v8

    .line 30
    :goto_1
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_7

    .line 35
    .line 36
    sget-object v2, LF0/w;->b:LG0/c$a;

    .line 37
    .line 38
    invoke-virtual {p0, v2}, LG0/c;->F(LG0/c$a;)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_6

    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    if-eq v2, v3, :cond_4

    .line 46
    .line 47
    const/4 v3, 0x2

    .line 48
    if-eq v2, v3, :cond_3

    .line 49
    .line 50
    const/4 v3, 0x3

    .line 51
    if-eq v2, v3, :cond_2

    .line 52
    .line 53
    const/4 v3, 0x4

    .line 54
    if-eq v2, v3, :cond_1

    .line 55
    .line 56
    const/4 v3, 0x5

    .line 57
    if-eq v2, v3, :cond_0

    .line 58
    .line 59
    invoke-virtual {p0}, LG0/c;->I()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, LG0/c;->J()V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_0
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    goto :goto_1

    .line 71
    :cond_1
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    invoke-virtual {p0}, LG0/c;->w()I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    invoke-virtual {p0}, LG0/c;->w()I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    goto :goto_1

    .line 86
    :cond_4
    invoke-virtual {p0}, LG0/c;->c()V

    .line 87
    .line 88
    .line 89
    :goto_2
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_5

    .line 94
    .line 95
    invoke-static {p0, p1}, LF0/v;->a(LG0/c;Lv0/h;)LD0/e;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, LD0/e;->d()J

    .line 100
    .line 101
    .line 102
    move-result-wide v3

    .line 103
    invoke-virtual {v1, v3, v4, v2}, Lo/j;->i(JLjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    invoke-virtual {p0}, LG0/c;->e()V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_6
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    goto :goto_1

    .line 119
    :cond_7
    invoke-virtual {p0}, LG0/c;->g()V

    .line 120
    .line 121
    .line 122
    if-eqz v8, :cond_8

    .line 123
    .line 124
    new-instance v4, Lv0/q;

    .line 125
    .line 126
    invoke-direct/range {v4 .. v9}, Lv0/q;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v4}, Lv0/q;->d()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-interface {p3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    invoke-interface {p2, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_9
    invoke-virtual {p0}, LG0/c;->e()V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method private static c(LG0/c;Lv0/h;Lo/s;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LG0/c;",
            "Lv0/h;",
            "Lo/s<",
            "LA0/d;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LG0/c;->c()V

    .line 2
    .line 3
    .line 4
    :goto_0
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p0, p1}, LF0/m;->a(LG0/c;Lv0/h;)LA0/d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, LA0/d;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p2, v1, v0}, Lo/s;->i(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, LG0/c;->e()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private static d(LG0/c;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LG0/c;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "LA0/c;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LG0/c;->d()V

    .line 2
    .line 3
    .line 4
    :goto_0
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    sget-object v0, LF0/w;->c:LG0/c$a;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, LG0/c;->F(LG0/c$a;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, LG0/c;->I()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, LG0/c;->J()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0}, LG0/c;->c()V

    .line 26
    .line 27
    .line 28
    :goto_1
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-static {p0}, LF0/n;->a(LG0/c;)LA0/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, LA0/c;->b()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    invoke-virtual {p0}, LG0/c;->e()V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {p0}, LG0/c;->g()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private static e(LG0/c;Lv0/h;Ljava/util/List;Lo/j;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LG0/c;",
            "Lv0/h;",
            "Ljava/util/List<",
            "LD0/e;",
            ">;",
            "Lo/j<",
            "LD0/e;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LG0/c;->c()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :cond_0
    :goto_0
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    invoke-static {p0, p1}, LF0/v;->a(LG0/c;Lv0/h;)LD0/e;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, LD0/e;->f()LD0/e$a;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    sget-object v3, LD0/e$a;->i:LD0/e$a;

    .line 20
    .line 21
    if-ne v2, v3, :cond_1

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    :cond_1
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, LD0/e;->d()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    invoke-virtual {p3, v2, v3, v1}, Lo/j;->i(JLjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x4

    .line 36
    if-le v0, v1, :cond_0

    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v2, "You have "

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v2, " images. Lottie should primarily be used with shapes. If you are using Adobe Illustrator, convert the Illustrator layers to shape layers."

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v1}, LH0/d;->c(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {p0}, LG0/c;->e()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private static f(LG0/c;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LG0/c;",
            "Ljava/util/List<",
            "LA0/h;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LG0/c;->c()V

    .line 2
    .line 3
    .line 4
    :goto_0
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-virtual {p0}, LG0/c;->d()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v1, 0x0

    .line 15
    move-object v2, v1

    .line 16
    move v1, v0

    .line 17
    :goto_1
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_3

    .line 22
    .line 23
    sget-object v3, LF0/w;->d:LG0/c$a;

    .line 24
    .line 25
    invoke-virtual {p0, v3}, LG0/c;->F(LG0/c$a;)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_2

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    if-eq v3, v4, :cond_1

    .line 33
    .line 34
    const/4 v4, 0x2

    .line 35
    if-eq v3, v4, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, LG0/c;->I()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, LG0/c;->J()V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    invoke-virtual {p0}, LG0/c;->v()D

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    double-to-float v1, v3

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {p0}, LG0/c;->v()D

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    double-to-float v0, v3

    .line 55
    goto :goto_1

    .line 56
    :cond_2
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    goto :goto_1

    .line 61
    :cond_3
    invoke-virtual {p0}, LG0/c;->g()V

    .line 62
    .line 63
    .line 64
    new-instance v3, LA0/h;

    .line 65
    .line 66
    invoke-direct {v3, v2, v0, v1}, LA0/h;-><init>(Ljava/lang/String;FF)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    invoke-virtual {p0}, LG0/c;->e()V

    .line 74
    .line 75
    .line 76
    return-void
.end method
