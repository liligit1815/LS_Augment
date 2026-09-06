.class Lcom/android/launcher3/resource/j$d;
.super Lcom/android/launcher3/resource/I1;
.source "ConfigResource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/resource/I1<",
        "Ljava/util/ArrayList<",
        "LR1/i;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/resource/I1;-><init>(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/resource/I1;-><init>(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    return-void
.end method

.method private l(Lorg/xmlpull/v1/XmlPullParser;)LR1/i;
    .locals 7

    .line 1
    new-instance p0, LR1/i;

    .line 2
    .line 3
    invoke-direct {p0}, LR1/i;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "packageName"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, LR1/i;->a:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "className"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, LR1/i;->b:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "container"

    .line 23
    .line 24
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, LR1/i;->d:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "simcard"

    .line 31
    .line 32
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, LR1/i;->c:Ljava/lang/String;

    .line 37
    .line 38
    const-string v0, "screen"

    .line 39
    .line 40
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, LR1/i;->g:I

    .line 49
    .line 50
    const-string v0, "x"

    .line 51
    .line 52
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, LR1/i;->e:I

    .line 61
    .line 62
    const-string v0, "y"

    .line 63
    .line 64
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, LR1/i;->f:I

    .line 73
    .line 74
    const-string v0, "mccmncs"

    .line 75
    .line 76
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const/4 v1, 0x0

    .line 81
    iput-object v1, p0, LR1/i;->h:[Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    const-string v3, ","

    .line 88
    .line 89
    if-nez v2, :cond_0

    .line 90
    .line 91
    :try_start_1
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, LR1/i;->h:[Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :catch_0
    move-exception p1

    .line 99
    goto/16 :goto_9

    .line 100
    .line 101
    :cond_0
    :goto_0
    const-string v0, "appwidget"

    .line 102
    .line 103
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    const/4 v2, 0x0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    const/4 v0, 0x4

    .line 115
    iput v0, p0, LR1/i;->i:I

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_1
    iput v2, p0, LR1/i;->i:I

    .line 119
    .line 120
    :goto_1
    const-string v0, "spanX"

    .line 121
    .line 122
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    const/4 v5, 0x1

    .line 131
    if-eqz v4, :cond_2

    .line 132
    .line 133
    move v0, v5

    .line 134
    goto :goto_2

    .line 135
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    :goto_2
    iput v0, p0, LR1/i;->j:I

    .line 140
    .line 141
    const-string v0, "spanY"

    .line 142
    .line 143
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    if-eqz v4, :cond_3

    .line 152
    .line 153
    move v0, v5

    .line 154
    goto :goto_3

    .line 155
    :cond_3
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    :goto_3
    iput v0, p0, LR1/i;->k:I

    .line 160
    .line 161
    const-string v0, "setIconOnce"

    .line 162
    .line 163
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result v4
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 171
    const-string v6, "true"

    .line 172
    .line 173
    if-nez v4, :cond_4

    .line 174
    .line 175
    :try_start_2
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_4

    .line 180
    .line 181
    move v0, v5

    .line 182
    goto :goto_4

    .line 183
    :cond_4
    move v0, v2

    .line 184
    :goto_4
    iput-boolean v0, p0, LR1/i;->l:Z

    .line 185
    .line 186
    const-string v0, "ignoreSpns"

    .line 187
    .line 188
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iput-object v1, p0, LR1/i;->m:[Ljava/lang/String;

    .line 193
    .line 194
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    if-nez v4, :cond_5

    .line 199
    .line 200
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iput-object v0, p0, LR1/i;->m:[Ljava/lang/String;

    .line 205
    .line 206
    :cond_5
    const-string v0, "inFolder"

    .line 207
    .line 208
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    if-nez v3, :cond_6

    .line 217
    .line 218
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-eqz v0, :cond_6

    .line 223
    .line 224
    goto :goto_5

    .line 225
    :cond_6
    move v5, v2

    .line 226
    :goto_5
    iput-boolean v5, p0, LR1/i;->n:Z

    .line 227
    .line 228
    const-string v0, "folderName"

    .line 229
    .line 230
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    if-eqz v3, :cond_7

    .line 239
    .line 240
    goto :goto_6

    .line 241
    :cond_7
    move-object v1, v0

    .line 242
    :goto_6
    iput-object v1, p0, LR1/i;->o:Ljava/lang/String;

    .line 243
    .line 244
    const-string v0, "XInFolder"

    .line 245
    .line 246
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    if-eqz v1, :cond_8

    .line 255
    .line 256
    move v0, v2

    .line 257
    goto :goto_7

    .line 258
    :cond_8
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    :goto_7
    iput v0, p0, LR1/i;->p:I

    .line 263
    .line 264
    const-string v0, "YInFolder"

    .line 265
    .line 266
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-eqz v0, :cond_9

    .line 275
    .line 276
    goto :goto_8

    .line 277
    :cond_9
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    :goto_8
    iput v2, p0, LR1/i;->q:I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 282
    .line 283
    return-object p0

    .line 284
    :goto_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 287
    .line 288
    .line 289
    const-string v1, "parseFavorite: "

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    const-string v0, "R-Loader"

    .line 302
    .line 303
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    return-object p0
.end method


# virtual methods
.method bridge synthetic g(Ljava/lang/Object;Landroid/content/res/XmlResourceParser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    check-cast p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/j$d;->j(Ljava/util/ArrayList;Landroid/content/res/XmlResourceParser;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method bridge synthetic h(Ljava/lang/Object;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    check-cast p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/j$d;->k(Ljava/util/ArrayList;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method j(Ljava/util/ArrayList;Landroid/content/res/XmlResourceParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "LR1/i;",
            ">;",
            "Landroid/content/res/XmlResourceParser;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "favorite"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const-string v0, "appwidget"

    .line 14
    .line 15
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/j$d;->l(Lorg/xmlpull/v1/XmlPullParser;)LR1/i;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method k(Ljava/util/ArrayList;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "LR1/i;",
            ">;",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "favorite"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const-string v0, "appwidget"

    .line 14
    .line 15
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/j$d;->l(Lorg/xmlpull/v1/XmlPullParser;)LR1/i;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method
