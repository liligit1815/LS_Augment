.class Lcom/android/launcher3/resource/z;
.super Ljava/lang/Object;
.source "IconStatus.java"

# interfaces
.implements Lcom/android/launcher3/resource/s;
.implements Lcom/android/launcher3/resource/r;


# instance fields
.field private a:Lcom/android/launcher3/resource/u1;

.field private b:Lcom/android/launcher3/resource/m;

.field private c:Lcom/android/launcher3/resource/g;

.field private d:Lcom/android/launcher3/resource/y0;

.field private e:Landroid/content/Context;

.field private volatile f:I

.field private g:Lcom/android/launcher3/c1$e;

.field private h:Lcom/android/launcher3/c1$d;

.field private i:Ljava/lang/Runnable;

.field private j:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lcom/android/launcher3/util/E;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/resource/z;->f:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/resource/z;->e:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/resource/z;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/z;->p(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/resource/z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/z;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g(Ljava/util/List;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/resource/u1$d;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "-"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/resource/z;->g:Lcom/android/launcher3/c1$e;

    .line 4
    .line 5
    const-string v2, "R-Loader-ICON"

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string p0, "doUnreadDataChange mUnreadCallback is null, can not connect with model "

    .line 10
    .line 11
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    :try_start_0
    new-instance v3, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const/4 v5, 0x1

    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    const/4 v6, 0x0

    .line 37
    invoke-virtual {v4, v6}, Lcom/android/launcher3/resource/g0;->t2(Lcom/android/launcher3/util/E;)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception p0

    .line 43
    goto/16 :goto_5

    .line 44
    .line 45
    :cond_1
    move v4, v5

    .line 46
    :goto_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    const/4 v7, 0x0

    .line 51
    if-eqz v6, :cond_2

    .line 52
    .line 53
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v6}, Lcom/android/launcher3/resource/g0;->R0()Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v6, v7

    .line 63
    :goto_1
    new-instance v8, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v9, " switch : "

    .line 69
    .line 70
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_6

    .line 108
    .line 109
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Lcom/android/launcher3/resource/u1$d;

    .line 114
    .line 115
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    invoke-virtual {v8}, Lcom/android/launcher3/resource/g0;->B()Lcom/android/launcher3/H5$c;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    sget-object v9, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 124
    .line 125
    if-ne v8, v9, :cond_3

    .line 126
    .line 127
    if-eqz v4, :cond_3

    .line 128
    .line 129
    if-nez v6, :cond_3

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getSwitchState()I

    .line 132
    .line 133
    .line 134
    move-result v8

    .line 135
    if-ne v8, v5, :cond_3

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getUnReadNumber()I

    .line 138
    .line 139
    .line 140
    move-result v8

    .line 141
    goto :goto_3

    .line 142
    :cond_3
    move v8, v7

    .line 143
    :goto_3
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getSwitchState()I

    .line 144
    .line 145
    .line 146
    move-result v9

    .line 147
    if-nez v9, :cond_4

    .line 148
    .line 149
    new-instance v9, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v10, "doUnreadDataChange close app : "

    .line 155
    .line 156
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getPkgName()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v10

    .line 163
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v10, "--"

    .line 167
    .line 168
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getUnReadNumber()I

    .line 172
    .line 173
    .line 174
    move-result v10

    .line 175
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string v10, "\n"

    .line 179
    .line 180
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v9

    .line 187
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getComponentName()Landroid/content/ComponentName;

    .line 191
    .line 192
    .line 193
    move-result-object v9

    .line 194
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getUser()Landroid/os/UserHandle;

    .line 195
    .line 196
    .line 197
    move-result-object v10

    .line 198
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getSwitchState()I

    .line 199
    .line 200
    .line 201
    move-result v11

    .line 202
    if-ne v11, v5, :cond_5

    .line 203
    .line 204
    move v11, v5

    .line 205
    goto :goto_4

    .line 206
    :cond_5
    move v11, v7

    .line 207
    :goto_4
    invoke-static {v9, v10, v11}, Lcom/android/launcher3/nubia/c;->u(Landroid/content/ComponentName;Landroid/os/UserHandle;Z)V

    .line 208
    .line 209
    .line 210
    new-instance v9, Lcom/android/launcher3/util/E;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getComponentName()Landroid/content/ComponentName;

    .line 213
    .line 214
    .line 215
    move-result-object v10

    .line 216
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1$d;->getUser()Landroid/os/UserHandle;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-direct {v9, v10, v0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 221
    .line 222
    .line 223
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-interface {v3, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .line 235
    .line 236
    const-string v0, "doUnreadDataChange"

    .line 237
    .line 238
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->g:Lcom/android/launcher3/c1$e;

    .line 256
    .line 257
    invoke-interface {p0, v3}, Lcom/android/launcher3/c1$e;->b(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :goto_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .line 265
    .line 266
    const-string v0, "onUnReadDataChanged exception "

    .line 267
    .line 268
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    return-void
.end method

.method private synthetic o()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "changeIconFinished iconStatus "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/resource/z;->f:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "R-Loader-ICON"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget v0, p0, Lcom/android/launcher3/resource/z;->f:I

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    if-ne v0, v1, :cond_0

    .line 29
    .line 30
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/resource/u1;->x()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iput v1, p0, Lcom/android/launcher3/resource/z;->f:I

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/resource/z;->d:Lcom/android/launcher3/resource/y0;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/resource/y0;->a()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->x()V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0}, Lcom/android/launcher3/resource/z;->u()V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method private synthetic p(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->a:Lcom/android/launcher3/resource/u1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/u1;->F(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "R-Loader-ICON"

    .line 10
    .line 11
    const-string p1, "setDynamicIconRunningStatus--mUnReadInfoManager is null"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "icon_change_finish"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v1, "R-Loader-ICON"

    .line 18
    .line 19
    const-string v2, "sendIconLoadCompleted action icon_change_finish"

    .line 20
    .line 21
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->g:Lcom/android/launcher3/c1$e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/c1$e;->a()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "R-Loader-ICON"

    .line 10
    .line 11
    const-string v0, "onUnreadPkgChanged mUnreadCallback is null, can not connect with model "

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/E;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->h:Lcom/android/launcher3/c1$d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/android/launcher3/c1$d;->a(Ljava/util/List;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "R-Loader-ICON"

    .line 10
    .line 11
    const-string p1, "onDynamicHiddenAppsInfosChange mDynamicShowHiddenAppsCallback is null"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/resource/u1$d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/launcher3/resource/z;->f:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v0, "onUnReadDataChanged mChangingIcon is "

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget p0, p0, Lcom/android/launcher3/resource/z;->f:I

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "R-Loader-ICON"

    .line 26
    .line 27
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/z;->g(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method f()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/resource/j;->Y0()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/resource/y;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/y;-><init>(Lcom/android/launcher3/resource/z;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method h()Lcom/android/launcher3/resource/w;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->d:Lcom/android/launcher3/resource/y0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/y0;->b()Lcom/android/launcher3/resource/w;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "R-Loader-ICON"

    .line 11
    .line 12
    const-string v0, "mThemeChangeManager is null !"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public i()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/E;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->b:Lcom/android/launcher3/resource/m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/m;->d()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "R-Loader-ICON"

    .line 11
    .line 12
    const-string v0, "getDynamicShowHiddenAppsInfoList is null !"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    new-instance p0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method j()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/z;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public k()Lcom/android/launcher3/resource/y0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->d:Lcom/android/launcher3/resource/y0;

    .line 2
    .line 3
    return-object p0
.end method

.method l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/z;->e:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/resource/y0;->c(Landroid/content/Context;)Lcom/android/launcher3/resource/y0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/resource/z;->d:Lcom/android/launcher3/resource/y0;

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/resource/u1;->l()Lcom/android/launcher3/resource/u1;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/android/launcher3/resource/z;->a:Lcom/android/launcher3/resource/u1;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/resource/u1;->C(Lcom/android/launcher3/resource/s;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/android/launcher3/resource/m;->e()Lcom/android/launcher3/resource/m;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/android/launcher3/resource/z;->b:Lcom/android/launcher3/resource/m;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/android/launcher3/resource/m;->j(Lcom/android/launcher3/resource/r;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/resource/g;->l()Lcom/android/launcher3/resource/g;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/android/launcher3/resource/z;->c:Lcom/android/launcher3/resource/g;

    .line 32
    .line 33
    new-instance v0, Landroid/util/ArrayMap;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/resource/z;->j:Landroid/util/ArrayMap;

    .line 39
    .line 40
    return-void
.end method

.method m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/z;->d:Lcom/android/launcher3/resource/y0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/resource/z;->e:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/resource/y0;->c(Landroid/content/Context;)Lcom/android/launcher3/resource/y0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/resource/z;->d:Lcom/android/launcher3/resource/y0;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->d:Lcom/android/launcher3/resource/y0;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/y0;->h(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->a:Lcom/android/launcher3/resource/u1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/u1;->s(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method q(Lcom/android/launcher3/c1$d;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "registerDynamicHiddenAppsCallback  is "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader-ICON"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/resource/z;->h:Lcom/android/launcher3/c1$d;

    .line 24
    .line 25
    return-void
.end method

.method r(Lcom/android/launcher3/c1$e;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "registerUnreadCallback mUnreadCallback is "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader-ICON"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/resource/z;->g:Lcom/android/launcher3/c1$e;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->a:Lcom/android/launcher3/resource/u1;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/resource/u1;->x()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const-string p0, "registerUnreadCallback mUnReadInfoManager is null"

    .line 34
    .line 35
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method s()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/z;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->C(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->i:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->M(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method t()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/launcher3/resource/z;->f:I

    .line 3
    .line 4
    return-void
.end method

.method v(ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->s()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Lcom/android/launcher3/resource/x;

    .line 5
    .line 6
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/resource/x;-><init>(Lcom/android/launcher3/resource/z;Z)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/resource/z;->i:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/z;->d:Lcom/android/launcher3/resource/y0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/y0;->h(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/resource/z;->a:Lcom/android/launcher3/resource/u1;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1;->q()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/resource/z;->b:Lcom/android/launcher3/resource/m;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/resource/m;->g()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->c:Lcom/android/launcher3/resource/g;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g;->p()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method x()V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/resource/z;->a:Lcom/android/launcher3/resource/u1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/resource/u1;->j()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/resource/u1;->x()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    invoke-static {}, Lcom/android/launcher3/resource/u1;->m()Lcom/android/launcher3/resource/u1;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/resource/u1;->x()V

    .line 24
    .line 25
    .line 26
    :cond_1
    throw p0
.end method
