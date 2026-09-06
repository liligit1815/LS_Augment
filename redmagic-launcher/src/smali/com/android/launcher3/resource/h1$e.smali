.class Lcom/android/launcher3/resource/h1$e;
.super Ljava/lang/Object;
.source "ThirdHiddenAppsManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/resource/h1;->I0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Lcom/android/launcher3/D3;

.field final synthetic i:Lcom/android/launcher3/C2;

.field final synthetic j:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/android/launcher3/resource/h1;Ljava/util/ArrayList;Lcom/android/launcher3/D3;Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/resource/h1$e;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/resource/h1$e;->h:Lcom/android/launcher3/D3;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/launcher3/resource/h1$e;->i:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/android/launcher3/resource/h1$e;->j:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ljava/util/ArrayList;Lcom/android/launcher3/D3;Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V
    .locals 11

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v1, :cond_5

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/util/Pair;

    .line 23
    .line 24
    iget-object v4, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v4, Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Landroid/os/UserHandle;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    monitor-enter v5

    .line 37
    :try_start_0
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    iget-object v6, v6, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 42
    .line 43
    invoke-virtual {v6}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    move v7, v3

    .line 48
    :cond_0
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    if-eqz v8, :cond_4

    .line 53
    .line 54
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    check-cast v8, Lcom/android/launcher3/model/data/y;

    .line 59
    .line 60
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v9

    .line 64
    if-eqz v9, :cond_0

    .line 65
    .line 66
    iget v9, v8, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 67
    .line 68
    if-eqz v9, :cond_1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    invoke-static {v4, v9}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    if-eqz v9, :cond_0

    .line 80
    .line 81
    iget-object v9, v8, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 82
    .line 83
    invoke-static {v1, v9}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    if-eqz v9, :cond_0

    .line 88
    .line 89
    iget v9, v8, Lcom/android/launcher3/model/data/y;->container:I

    .line 90
    .line 91
    if-lez v9, :cond_2

    .line 92
    .line 93
    invoke-static {p2}, Lcom/android/launcher3/resource/h1;->Y(Lcom/android/launcher3/C2;)Ljava/util/ArrayList;

    .line 94
    .line 95
    .line 96
    move-result-object v9

    .line 97
    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    .line 98
    .line 99
    .line 100
    move-result v9

    .line 101
    if-nez v9, :cond_2

    .line 102
    .line 103
    iget v9, v8, Lcom/android/launcher3/model/data/y;->container:I

    .line 104
    .line 105
    invoke-static {p2}, Lcom/android/launcher3/resource/h1;->Y(Lcom/android/launcher3/C2;)Ljava/util/ArrayList;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v10

    .line 113
    check-cast v10, Lcom/android/launcher3/model/data/p;

    .line 114
    .line 115
    iget v10, v10, Lcom/android/launcher3/model/data/y;->id:I

    .line 116
    .line 117
    if-ne v9, v10, :cond_2

    .line 118
    .line 119
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :catchall_0
    move-exception p0

    .line 124
    goto :goto_2

    .line 125
    :cond_2
    if-eqz v7, :cond_3

    .line 126
    .line 127
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_3
    move v7, v2

    .line 132
    goto :goto_1

    .line 133
    :cond_4
    monitor-exit v5

    .line 134
    goto :goto_0

    .line 135
    :goto_2
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    throw p0

    .line 137
    :cond_5
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    if-eqz p3, :cond_b

    .line 146
    .line 147
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    check-cast p3, Landroid/util/Pair;

    .line 152
    .line 153
    iget-object v1, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 154
    .line 155
    check-cast v1, Ljava/lang/String;

    .line 156
    .line 157
    iget-object p3, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 158
    .line 159
    check-cast p3, Landroid/os/UserHandle;

    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    monitor-enter v4

    .line 166
    :try_start_1
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    iget-object v5, v5, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 171
    .line 172
    invoke-virtual {v5}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    move v6, v3

    .line 177
    :cond_6
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 178
    .line 179
    .line 180
    move-result v7

    .line 181
    if-eqz v7, :cond_a

    .line 182
    .line 183
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 188
    .line 189
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v8

    .line 193
    if-eqz v8, :cond_6

    .line 194
    .line 195
    iget v8, v7, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 196
    .line 197
    if-eqz v8, :cond_7

    .line 198
    .line 199
    goto :goto_4

    .line 200
    :cond_7
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v8

    .line 204
    invoke-static {v1, v8}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result v8

    .line 208
    if-eqz v8, :cond_6

    .line 209
    .line 210
    iget-object v8, v7, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 211
    .line 212
    invoke-static {p3, v8}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v8

    .line 216
    if-eqz v8, :cond_6

    .line 217
    .line 218
    iget v8, v7, Lcom/android/launcher3/model/data/y;->container:I

    .line 219
    .line 220
    if-lez v8, :cond_9

    .line 221
    .line 222
    invoke-static {p2}, Lcom/android/launcher3/resource/h1;->Y(Lcom/android/launcher3/C2;)Ljava/util/ArrayList;

    .line 223
    .line 224
    .line 225
    move-result-object v8

    .line 226
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    .line 227
    .line 228
    .line 229
    move-result v8

    .line 230
    if-nez v8, :cond_9

    .line 231
    .line 232
    iget v8, v7, Lcom/android/launcher3/model/data/y;->container:I

    .line 233
    .line 234
    invoke-static {p2}, Lcom/android/launcher3/resource/h1;->Y(Lcom/android/launcher3/C2;)Ljava/util/ArrayList;

    .line 235
    .line 236
    .line 237
    move-result-object v9

    .line 238
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v9

    .line 242
    check-cast v9, Lcom/android/launcher3/model/data/p;

    .line 243
    .line 244
    iget v9, v9, Lcom/android/launcher3/model/data/y;->id:I

    .line 245
    .line 246
    if-ne v8, v9, :cond_9

    .line 247
    .line 248
    if-eqz v6, :cond_8

    .line 249
    .line 250
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    goto :goto_4

    .line 254
    :catchall_1
    move-exception p0

    .line 255
    goto :goto_5

    .line 256
    :cond_8
    move v6, v2

    .line 257
    goto :goto_4

    .line 258
    :cond_9
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    goto :goto_4

    .line 262
    :cond_a
    monitor-exit v4

    .line 263
    goto :goto_3

    .line 264
    :goto_5
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 265
    throw p0

    .line 266
    :cond_b
    const-string p0, "ThirdHiddenAppsManager"

    .line 267
    .line 268
    new-instance p2, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .line 272
    .line 273
    const-string p3, "updateHideOrShowDataInNewPrivateSpace: remove Duplicate icons "

    .line 274
    .line 275
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 279
    .line 280
    .line 281
    move-result p3

    .line 282
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p2

    .line 289
    invoke-static {p0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    .line 291
    .line 292
    invoke-virtual {p1, v0}, Lcom/android/launcher3/D3;->R(Ljava/util/ArrayList;)V

    .line 293
    .line 294
    .line 295
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/resource/h1$e;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/resource/h1$e;->h:Lcom/android/launcher3/D3;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/resource/h1$e;->i:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/resource/h1$e;->j:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v4, Lcom/android/launcher3/resource/i1;

    .line 12
    .line 13
    invoke-direct {v4, v1, v2, v3, p0}, Lcom/android/launcher3/resource/i1;-><init>(Ljava/util/ArrayList;Lcom/android/launcher3/D3;Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v4}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
