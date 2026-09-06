.class public Lz1/h;
.super Ljava/lang/Object;
.source "AddWorkFolderTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/h;->a:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ljava/util/ArrayList;Lcom/android/launcher3/util/x0;Lz1/y0$b;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    add-int/lit8 v2, v2, -0x1

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    iget v2, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 46
    .line 47
    iget v4, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 48
    .line 49
    if-ne v4, v2, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-interface {p2, p1, v1, v0}, Lz1/y0$b;->n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic c(Lz1/o3;Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/y;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lz1/o3;->Y()Lz1/J3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v2, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 6
    .line 7
    iget v3, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 8
    .line 9
    iget v4, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 10
    .line 11
    iget v5, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 12
    .line 13
    move-object v1, p2

    .line 14
    invoke-virtual/range {v0 .. v5}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 9

    .line 1
    iget-object p3, p0, Lz1/h;->a:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p3, :cond_7

    .line 4
    .line 5
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    new-instance v0, Lz1/z5;

    .line 14
    .line 15
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-static {p3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-virtual {p1}, Lz1/o3;->X()Lcom/android/launcher3/D3;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {v0, p2, p3, v1}, Lz1/z5;-><init>(Lz1/y0;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-static {p3}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    invoke-virtual {p3}, Lcom/android/launcher3/H5;->M0()Z

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-nez p3, :cond_1

    .line 47
    .line 48
    const-string p0, "AddWorkFolderTask"

    .line 49
    .line 50
    const-string p1, "not single layer, AddWorkFolderTask return"

    .line 51
    .line 52
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    new-instance p3, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    new-instance v2, Lcom/android/launcher3/util/x0;

    .line 62
    .line 63
    invoke-direct {v2}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 64
    .line 65
    .line 66
    monitor-enter p2

    .line 67
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lz1/h;->a:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_5

    .line 83
    .line 84
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Landroid/util/Pair;

    .line 89
    .line 90
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 93
    .line 94
    if-nez v3, :cond_3

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    iget v4, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 98
    .line 99
    if-nez v4, :cond_4

    .line 100
    .line 101
    instance-of v4, v3, Lcom/android/launcher3/model/data/F;

    .line 102
    .line 103
    if-eqz v4, :cond_4

    .line 104
    .line 105
    check-cast v3, Lcom/android/launcher3/model/data/F;

    .line 106
    .line 107
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-interface {v3, v4}, Lcom/android/launcher3/model/data/F;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    goto :goto_1

    .line 116
    :catchall_0
    move-exception v0

    .line 117
    move-object p0, v0

    .line 118
    goto/16 :goto_2

    .line 119
    .line 120
    :cond_4
    :goto_1
    if-eqz v3, :cond_2

    .line 121
    .line 122
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 123
    .line 124
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_5
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    if-nez p0, :cond_6

    .line 133
    .line 134
    new-instance p0, Lcom/android/launcher3/model/data/p;

    .line 135
    .line 136
    invoke-direct {p0}, Lcom/android/launcher3/model/data/p;-><init>()V

    .line 137
    .line 138
    .line 139
    const/4 v6, 0x1

    .line 140
    iput v6, p0, Lcom/android/launcher3/model/data/p;->k:I

    .line 141
    .line 142
    iput v6, p0, Lcom/android/launcher3/model/data/p;->l:I

    .line 143
    .line 144
    const/16 v3, -0x64

    .line 145
    .line 146
    iput v3, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 147
    .line 148
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    const v4, 0x7f1404a0

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    iput-object v3, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 164
    .line 165
    const/4 v3, 0x0

    .line 166
    const/4 v7, 0x2

    .line 167
    invoke-virtual {p0, v7, v6, v3}, Lcom/android/launcher3/model/data/p;->P(IZLz1/J3;)V

    .line 168
    .line 169
    .line 170
    const/4 v3, -0x1

    .line 171
    iput v3, p0, Lcom/android/launcher3/model/data/p;->j:I

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 178
    .line 179
    .line 180
    invoke-virtual {p2}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    iget v3, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 185
    .line 186
    iget v4, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 187
    .line 188
    iget-boolean v5, p0, Lcom/android/launcher3/model/data/y;->isCollisionInWorkspace:Z

    .line 189
    .line 190
    invoke-virtual/range {v0 .. v5}, Lz1/z5;->c(Lcom/android/launcher3/util/x0;Lcom/android/launcher3/util/x0;IIZ)[I

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    const/4 v1, 0x0

    .line 195
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isCollisionInWorkspace:Z

    .line 196
    .line 197
    aget v1, v0, v1

    .line 198
    .line 199
    invoke-virtual {p1}, Lz1/o3;->Y()Lz1/J3;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    aget v4, v0, v6

    .line 204
    .line 205
    aget v8, v0, v7

    .line 206
    .line 207
    const/16 v5, -0x64

    .line 208
    .line 209
    move v6, v1

    .line 210
    move v7, v4

    .line 211
    move-object v4, p0

    .line 212
    invoke-virtual/range {v3 .. v8}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    new-instance v0, Lz1/f;

    .line 220
    .line 221
    invoke-direct {v0, p1, v4}, Lz1/f;-><init>(Lz1/o3;Lcom/android/launcher3/model/data/p;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    :cond_6
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 231
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    if-nez p0, :cond_7

    .line 236
    .line 237
    new-instance p0, Lz1/g;

    .line 238
    .line 239
    invoke-direct {p0, p3, v2}, Lz1/g;-><init>(Ljava/util/ArrayList;Lcom/android/launcher3/util/x0;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p1, p0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :goto_2
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 247
    throw p0

    .line 248
    :cond_7
    :goto_3
    return-void
.end method
