.class public Lz1/z5;
.super Ljava/lang/Object;
.source "WorkspaceItemSpaceFinder.java"


# instance fields
.field private a:Lz1/y0;

.field private b:Lcom/android/launcher3/F1;

.field private c:Lcom/android/launcher3/D3;


# direct methods
.method public constructor <init>(Lz1/y0;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/z5;->a:Lz1/y0;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/z5;->b:Lcom/android/launcher3/F1;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/z5;->c:Lcom/android/launcher3/D3;

    .line 9
    .line 10
    return-void
.end method

.method private a(Ljava/util/ArrayList;[III)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;[III)Z"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/t0;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/z5;->b:Lcom/android/launcher3/F1;

    .line 4
    .line 5
    iget v2, v1, Lcom/android/launcher3/F1;->H0:I

    .line 6
    .line 7
    iget v1, v1, Lcom/android/launcher3/F1;->G0:I

    .line 8
    .line 9
    invoke-direct {v0, v2, v1}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v1, "profile.numColumns:"

    .line 41
    .line 42
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lz1/z5;->b:Lcom/android/launcher3/F1;

    .line 46
    .line 47
    iget v1, v1, Lcom/android/launcher3/F1;->H0:I

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, "--profile.numRows:"

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lz1/z5;->b:Lcom/android/launcher3/F1;

    .line 58
    .line 59
    iget p0, p0, Lcom/android/launcher3/F1;->G0:I

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, "--spanX:"

    .line 65
    .line 66
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p0, "--spanY:"

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "WorkspaceItemSpaceFinder"

    .line 85
    .line 86
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p2, p3, p4}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    return p0
.end method


# virtual methods
.method public b(Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/Workspace;)[I
    .locals 5

    .line 1
    new-instance p1, Landroid/util/LongSparseArray;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/util/LongSparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    monitor-enter p2

    .line 7
    :try_start_0
    iget-object v0, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 24
    .line 25
    iget v2, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 26
    .line 27
    const/16 v3, -0x64

    .line 28
    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    iget v2, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 32
    .line 33
    int-to-long v2, v2

    .line 34
    invoke-virtual {p1, v2, v3}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ljava/util/ArrayList;

    .line 39
    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    new-instance v2, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iget v3, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 48
    .line 49
    int-to-long v3, v3

    .line 50
    invoke-virtual {p1, v3, v4, v2}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_5

    .line 56
    :cond_1
    :goto_1
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    const/4 p2, 0x2

    .line 62
    new-array p2, p2, [I

    .line 63
    .line 64
    invoke-virtual {p4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p4, v0}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 69
    .line 70
    .line 71
    move-result p4

    .line 72
    add-int/lit8 v0, p4, 0x1

    .line 73
    .line 74
    invoke-virtual {p3}, Lcom/android/launcher3/util/x0;->isEmpty()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const/4 v2, 0x0

    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    move v1, v2

    .line 82
    goto :goto_2

    .line 83
    :cond_3
    move v1, p4

    .line 84
    :goto_2
    if-gez v1, :cond_4

    .line 85
    .line 86
    invoke-virtual {p3}, Lcom/android/launcher3/util/x0;->size()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    filled-new-array {p0, v2, v2, v2}, [I

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0

    .line 95
    :cond_4
    const/4 p3, 0x1

    .line 96
    if-ge v1, v0, :cond_7

    .line 97
    .line 98
    int-to-long v3, p4

    .line 99
    invoke-virtual {p1, v3, v4}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    check-cast p1, Ljava/util/ArrayList;

    .line 104
    .line 105
    if-gt v0, p3, :cond_6

    .line 106
    .line 107
    if-eqz p1, :cond_5

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_5
    move p0, v2

    .line 111
    goto :goto_4

    .line 112
    :cond_6
    :goto_3
    invoke-direct {p0, p1, p2, p3, p3}, Lz1/z5;->a(Ljava/util/ArrayList;[III)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    goto :goto_4

    .line 117
    :cond_7
    move p0, v2

    .line 118
    move p4, p0

    .line 119
    :goto_4
    aget p1, p2, p3

    .line 120
    .line 121
    aget p2, p2, v2

    .line 122
    .line 123
    filled-new-array {p4, p1, p2, p0}, [I

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    return-object p0

    .line 128
    :goto_5
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    throw p0
.end method

.method public c(Lcom/android/launcher3/util/x0;Lcom/android/launcher3/util/x0;IIZ)[I
    .locals 9

    .line 1
    new-instance v0, Landroid/util/LongSparseArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lz1/z5;->a:Lz1/y0;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-object v2, p0, Lz1/z5;->a:Lz1/y0;

    .line 10
    .line 11
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_2

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    iget v4, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 32
    .line 33
    const/16 v5, -0x64

    .line 34
    .line 35
    if-ne v4, v5, :cond_0

    .line 36
    .line 37
    iget v4, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 38
    .line 39
    int-to-long v4, v4

    .line 40
    invoke-virtual {v0, v4, v5}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Ljava/util/ArrayList;

    .line 45
    .line 46
    if-nez v4, :cond_1

    .line 47
    .line 48
    new-instance v4, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    iget v5, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 54
    .line 55
    int-to-long v5, v5

    .line 56
    invoke-virtual {v0, v5, v6, v4}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto/16 :goto_7

    .line 62
    .line 63
    :cond_1
    :goto_1
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    const/4 v1, 0x2

    .line 69
    new-array v1, v1, [I

    .line 70
    .line 71
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    iget-object v2, p0, Lz1/z5;->c:Lcom/android/launcher3/D3;

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->h0()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->l(Landroid/content/Context;)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-lez v2, :cond_3

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-eqz v3, :cond_3

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->q()Lcom/android/launcher3/util/x0;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 100
    .line 101
    .line 102
    const-string v2, "WorkspaceItemSpaceFinder"

    .line 103
    .line 104
    new-instance v4, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string v5, "findSpaceForItem remove AIFutureScreenId newWorkspaceScreens="

    .line 110
    .line 111
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v5, " old="

    .line 122
    .line 123
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-object p1, v3

    .line 141
    :cond_3
    const/4 v2, 0x1

    .line 142
    const/4 v3, 0x0

    .line 143
    if-nez p5, :cond_8

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->size()I

    .line 146
    .line 147
    .line 148
    move-result p5

    .line 149
    new-instance v4, Lcom/android/launcher3/util/z0;

    .line 150
    .line 151
    invoke-direct {v4}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 152
    .line 153
    .line 154
    move v5, v3

    .line 155
    move v6, v5

    .line 156
    :goto_2
    if-ge v5, p5, :cond_7

    .line 157
    .line 158
    invoke-virtual {p1, v5}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    iget-object v7, p0, Lz1/z5;->b:Lcom/android/launcher3/F1;

    .line 163
    .line 164
    invoke-virtual {v7}, Lcom/android/launcher3/r4;->e()Z

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    if-nez v7, :cond_4

    .line 169
    .line 170
    if-ne p5, v2, :cond_4

    .line 171
    .line 172
    :goto_3
    move v7, v2

    .line 173
    goto :goto_4

    .line 174
    :cond_4
    if-lez v5, :cond_5

    .line 175
    .line 176
    add-int/lit8 v7, p5, -0x1

    .line 177
    .line 178
    if-ne v5, v7, :cond_5

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_5
    move v7, v3

    .line 182
    :goto_4
    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    if-nez v8, :cond_6

    .line 187
    .line 188
    if-eqz v7, :cond_6

    .line 189
    .line 190
    int-to-long v7, v6

    .line 191
    invoke-virtual {v0, v7, v8}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v7

    .line 195
    check-cast v7, Ljava/util/ArrayList;

    .line 196
    .line 197
    invoke-direct {p0, v7, v1, p3, p4}, Lz1/z5;->a(Ljava/util/ArrayList;[III)Z

    .line 198
    .line 199
    .line 200
    move-result v7

    .line 201
    if-eqz v7, :cond_6

    .line 202
    .line 203
    move p5, v2

    .line 204
    goto :goto_5

    .line 205
    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_7
    move p5, v3

    .line 209
    goto :goto_5

    .line 210
    :cond_8
    move p5, v3

    .line 211
    move v6, p5

    .line 212
    :goto_5
    if-nez p5, :cond_b

    .line 213
    .line 214
    iget-object p5, p0, Lz1/z5;->c:Lcom/android/launcher3/D3;

    .line 215
    .line 216
    invoke-virtual {p5}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 217
    .line 218
    .line 219
    move-result-object p5

    .line 220
    invoke-virtual {p5}, Lz1/k2;->F()I

    .line 221
    .line 222
    .line 223
    move-result v6

    .line 224
    invoke-virtual {p1, v6}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p2, v6}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 228
    .line 229
    .line 230
    int-to-long p1, v6

    .line 231
    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    check-cast p1, Ljava/util/ArrayList;

    .line 236
    .line 237
    invoke-direct {p0, p1, v1, p3, p4}, Lz1/z5;->a(Ljava/util/ArrayList;[III)Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-nez p1, :cond_b

    .line 242
    .line 243
    iget-object p0, p0, Lz1/z5;->b:Lcom/android/launcher3/F1;

    .line 244
    .line 245
    iget p1, p0, Lcom/android/launcher3/F1;->H0:I

    .line 246
    .line 247
    if-lt p1, p3, :cond_a

    .line 248
    .line 249
    iget p0, p0, Lcom/android/launcher3/F1;->G0:I

    .line 250
    .line 251
    if-ge p0, p4, :cond_9

    .line 252
    .line 253
    goto :goto_6

    .line 254
    :cond_9
    new-instance p0, Ljava/lang/RuntimeException;

    .line 255
    .line 256
    const-string p1, "Can\'t find space to add the item"

    .line 257
    .line 258
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    throw p0

    .line 262
    :cond_a
    :goto_6
    aput v3, v1, v3

    .line 263
    .line 264
    aput v3, v1, v2

    .line 265
    .line 266
    const-string p0, "WorkspaceItemSpaceFinder"

    .line 267
    .line 268
    const-string p1, "findSpaceForItem, spanX or spanY of widget is too big"

    .line 269
    .line 270
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    :cond_b
    aget p0, v1, v3

    .line 274
    .line 275
    aget p1, v1, v2

    .line 276
    .line 277
    filled-new-array {v6, p0, p1}, [I

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    return-object p0

    .line 282
    :goto_7
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 283
    throw p0
.end method

.method public d(Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/Workspace;Ljava/util/ArrayList;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/P2;",
            "Lz1/y0;",
            "Lcom/android/launcher3/util/x0;",
            "Lcom/android/launcher3/Workspace;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p4, p1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/16 p4, -0xc9

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-ne p1, p4, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    new-instance p4, Landroid/util/LongSparseArray;

    .line 16
    .line 17
    invoke-direct {p4}, Landroid/util/LongSparseArray;-><init>()V

    .line 18
    .line 19
    .line 20
    monitor-enter p2

    .line 21
    :try_start_0
    iget-object v1, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_3

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 38
    .line 39
    iget v3, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 40
    .line 41
    const/16 v4, -0x64

    .line 42
    .line 43
    if-ne v3, v4, :cond_1

    .line 44
    .line 45
    iget v3, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 46
    .line 47
    int-to-long v3, v3

    .line 48
    invoke-virtual {p4, v3, v4}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Ljava/util/ArrayList;

    .line 53
    .line 54
    if-nez v3, :cond_2

    .line 55
    .line 56
    new-instance v3, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    iget v4, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 62
    .line 63
    int-to-long v4, v4

    .line 64
    invoke-virtual {p4, v4, v5, v3}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto :goto_3

    .line 70
    :cond_2
    :goto_1
    invoke-virtual {p5, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-nez v4, :cond_1

    .line 75
    .line 76
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    const/4 p2, 0x2

    .line 82
    new-array p2, p2, [I

    .line 83
    .line 84
    invoke-virtual {p3}, Lcom/android/launcher3/util/x0;->size()I

    .line 85
    .line 86
    .line 87
    add-int/lit8 p5, p1, 0x1

    .line 88
    .line 89
    invoke-virtual {p3}, Lcom/android/launcher3/util/x0;->isEmpty()Z

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    if-eqz p3, :cond_4

    .line 94
    .line 95
    move p3, v0

    .line 96
    goto :goto_2

    .line 97
    :cond_4
    move p3, p1

    .line 98
    :goto_2
    const/4 v1, 0x1

    .line 99
    if-gez p3, :cond_5

    .line 100
    .line 101
    return v1

    .line 102
    :cond_5
    if-ge p3, p5, :cond_7

    .line 103
    .line 104
    int-to-long v2, p1

    .line 105
    invoke-virtual {p4, v2, v3}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Ljava/util/ArrayList;

    .line 110
    .line 111
    if-gt p5, v1, :cond_6

    .line 112
    .line 113
    if-eqz p1, :cond_7

    .line 114
    .line 115
    :cond_6
    invoke-direct {p0, p1, p2, v1, v1}, Lz1/z5;->a(Ljava/util/ArrayList;[III)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    xor-int/2addr p0, v1

    .line 120
    return p0

    .line 121
    :cond_7
    return v0

    .line 122
    :goto_3
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    throw p0
.end method
