.class public final Lz1/B4;
.super Ljava/lang/Object;
.source "SessionFailureTask.kt"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Landroid/os/UserHandle;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lz1/B4;->a:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p2, p0, Lz1/B4;->b:Landroid/os/UserHandle;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 6

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "apps"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lz1/o3;->W()Ls1/P;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/android/launcher3/util/k;

    .line 21
    .line 22
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, p0, Lz1/B4;->a:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v4, p0, Lz1/B4;->b:Landroid/os/UserHandle;

    .line 29
    .line 30
    invoke-direct {v1, v2, v3, v4}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/util/k;->j()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    monitor-enter p2

    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v2, Landroid/content/ComponentName;

    .line 46
    .line 47
    iget-object v3, p0, Lz1/B4;->a:Ljava/lang/String;

    .line 48
    .line 49
    new-instance v4, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v5, "."

    .line 58
    .line 59
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v3, p0, Lz1/B4;->b:Landroid/os/UserHandle;

    .line 70
    .line 71
    invoke-virtual {v0, v2, v3}, Lt1/f;->L(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lt1/f$a;

    .line 72
    .line 73
    .line 74
    iget-object v2, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 75
    .line 76
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "iterator(...)"

    .line 81
    .line 82
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-eqz v3, :cond_1

    .line 90
    .line 91
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 96
    .line 97
    instance-of v4, v3, Lcom/android/launcher3/model/data/I;

    .line 98
    .line 99
    if-eqz v4, :cond_0

    .line 100
    .line 101
    move-object v4, v3

    .line 102
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 103
    .line 104
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    if-eqz v4, :cond_0

    .line 109
    .line 110
    iget-object v4, p0, Lz1/B4;->b:Landroid/os/UserHandle;

    .line 111
    .line 112
    move-object v5, v3

    .line 113
    check-cast v5, Lcom/android/launcher3/model/data/I;

    .line 114
    .line 115
    iget-object v5, v5, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 116
    .line 117
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    if-eqz v4, :cond_0

    .line 122
    .line 123
    move-object v4, v3

    .line 124
    check-cast v4, Lcom/android/launcher3/model/data/z;

    .line 125
    .line 126
    move-object v5, v3

    .line 127
    check-cast v5, Lcom/android/launcher3/model/data/I;

    .line 128
    .line 129
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-virtual {v0, v4, v5}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :catchall_0
    move-exception p0

    .line 141
    goto/16 :goto_3

    .line 142
    .line 143
    :cond_1
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_2

    .line 148
    .line 149
    invoke-virtual {p1, v1}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 150
    .line 151
    .line 152
    :cond_2
    iget-object v0, p0, Lz1/B4;->a:Ljava/lang/String;

    .line 153
    .line 154
    filled-new-array {v0}, [Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-static {v0}, Li4/M;->c([Ljava/lang/Object;)Ljava/util/HashSet;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object p0, p0, Lz1/B4;->b:Landroid/os/UserHandle;

    .line 163
    .line 164
    invoke-virtual {p3, v0, p0}, Lz1/m;->y(Ljava/util/HashSet;Landroid/os/UserHandle;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1}, Lz1/o3;->y()V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_3
    iget-object p3, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 172
    .line 173
    const-string v0, "itemsIdMap"

    .line 174
    .line 175
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    new-instance v0, Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .line 182
    .line 183
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 184
    .line 185
    .line 186
    move-result-object p3

    .line 187
    :cond_4
    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_5

    .line 192
    .line 193
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    move-object v2, v1

    .line 198
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 199
    .line 200
    instance-of v3, v2, Lcom/android/launcher3/model/data/I;

    .line 201
    .line 202
    if-eqz v3, :cond_4

    .line 203
    .line 204
    move-object v3, v2

    .line 205
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 206
    .line 207
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    if-eqz v3, :cond_4

    .line 212
    .line 213
    iget-object v3, p0, Lz1/B4;->b:Landroid/os/UserHandle;

    .line 214
    .line 215
    move-object v4, v2

    .line 216
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 217
    .line 218
    iget-object v4, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 219
    .line 220
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    if-eqz v3, :cond_4

    .line 225
    .line 226
    iget-object v3, p0, Lz1/B4;->a:Ljava/lang/String;

    .line 227
    .line 228
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 229
    .line 230
    iget-object v2, v2, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 231
    .line 232
    invoke-virtual {v2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    if-eqz v2, :cond_4

    .line 241
    .line 242
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    goto :goto_1

    .line 246
    :cond_5
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 247
    .line 248
    .line 249
    move-result p0

    .line 250
    if-nez p0, :cond_6

    .line 251
    .line 252
    invoke-static {v0}, Lcom/android/launcher3/util/P0;->s(Ljava/util/Collection;)Ljava/util/function/Predicate;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    const-string p3, "ofItems(...)"

    .line 257
    .line 258
    invoke-static {p0, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    const-string p3, "removed because install session failed"

    .line 262
    .line 263
    invoke-virtual {p1, p0, p3}, Lz1/o3;->P(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    :cond_6
    :goto_2
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    .line 268
    monitor-exit p2

    .line 269
    return-void

    .line 270
    :goto_3
    monitor-exit p2

    .line 271
    throw p0
.end method
