.class public Lz1/j;
.super Ljava/lang/Object;
.source "AddWorkspaceItemsTask.java"

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

.field private final b:Lz1/z5;

.field private c:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Lz1/z5;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;",
            "Lz1/z5;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/j;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/j;->b:Lz1/z5;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lz1/j;->c:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method private c(Lz1/y0;J)Lcom/android/launcher3/model/data/p;
    .locals 3

    .line 1
    monitor-enter p1

    .line 2
    :try_start_0
    iget-object p0, p1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Lz1/i;

    .line 9
    .line 10
    invoke-direct {v0}, Lz1/i;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 36
    .line 37
    iget v1, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 38
    .line 39
    int-to-long v1, v1

    .line 40
    cmp-long v1, v1, p2

    .line 41
    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    instance-of v1, v0, Lcom/android/launcher3/model/data/p;

    .line 45
    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    check-cast v0, Lcom/android/launcher3/model/data/p;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const/4 v0, 0x0

    .line 54
    :goto_0
    monitor-exit p1

    .line 55
    return-object v0

    .line 56
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    throw p0
.end method

.method private d(Lcom/android/launcher3/P2;Lz1/y0;JJII)Z
    .locals 4

    .line 1
    const-wide/16 v0, -0x65

    .line 2
    .line 3
    cmp-long p0, p3, v0

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "AddWorkspaceItemsTask"

    .line 9
    .line 10
    const-string p1, "location in hotSeat. occupancy."

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    return p3

    .line 16
    :cond_0
    new-instance p0, Landroid/util/LongSparseArray;

    .line 17
    .line 18
    invoke-direct {p0}, Landroid/util/LongSparseArray;-><init>()V

    .line 19
    .line 20
    .line 21
    monitor-enter p2

    .line 22
    :try_start_0
    iget-object p4, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 23
    .line 24
    invoke-virtual {p4}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    :cond_1
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget v1, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 43
    .line 44
    const/16 v2, -0x64

    .line 45
    .line 46
    if-ne v1, v2, :cond_1

    .line 47
    .line 48
    iget v1, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 49
    .line 50
    int-to-long v1, v1

    .line 51
    invoke-virtual {p0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ljava/util/ArrayList;

    .line 56
    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    new-instance v1, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    iget v2, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 65
    .line 66
    int-to-long v2, v2

    .line 67
    invoke-virtual {p0, v2, v3, v1}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :catchall_0
    move-exception p0

    .line 72
    goto :goto_3

    .line 73
    :cond_2
    :goto_1
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    invoke-virtual {p0, p5, p6}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance p2, Lcom/android/launcher3/util/t0;

    .line 89
    .line 90
    iget p4, p1, Lcom/android/launcher3/F1;->H0:I

    .line 91
    .line 92
    iget p1, p1, Lcom/android/launcher3/F1;->G0:I

    .line 93
    .line 94
    invoke-direct {p2, p4, p1}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 95
    .line 96
    .line 97
    if-eqz p0, :cond_5

    .line 98
    .line 99
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_4

    .line 108
    .line 109
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 114
    .line 115
    invoke-virtual {p2, p1, p3}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_4
    invoke-virtual {p2, p7, p8, p3, p3}, Lcom/android/launcher3/util/t0;->d(IIII)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    xor-int/2addr p0, p3

    .line 124
    return p0

    .line 125
    :cond_5
    const-string p0, "AddWorkspaceItemsTask"

    .line 126
    .line 127
    const-string p1, "the screenId does not exist. occupancy."

    .line 128
    .line 129
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    return p3

    .line 133
    :goto_3
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    throw p0
.end method

.method private g(Lz1/o3;Lcom/android/launcher3/model/data/y;Lz1/y0;)[I
    .locals 12

    .line 1
    instance-of v1, p2, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    const/4 v9, 0x0

    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    move-object v1, p2

    .line 7
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    :goto_0
    move-object v3, v1

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    instance-of v1, p2, Lcom/android/launcher3/model/data/d;

    .line 12
    .line 13
    if-eqz v1, :cond_3

    .line 14
    .line 15
    move-object v1, p2

    .line 16
    check-cast v1, Lcom/android/launcher3/model/data/d;

    .line 17
    .line 18
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    goto :goto_0

    .line 27
    :goto_1
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    new-instance v4, Lcom/android/launcher3/util/E;

    .line 42
    .line 43
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 44
    .line 45
    invoke-direct {v4, v1, v0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    invoke-virtual {v2, v4, v0}, Lcom/android/launcher3/H5;->t(Lcom/android/launcher3/util/E;Z)Lcom/android/launcher3/H5$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    move-object v10, v0

    .line 54
    goto :goto_2

    .line 55
    :cond_1
    move-object v10, v9

    .line 56
    :goto_2
    if-eqz v10, :cond_3

    .line 57
    .line 58
    move-object v1, v3

    .line 59
    invoke-virtual {v10}, Lcom/android/launcher3/H5$a;->d()J

    .line 60
    .line 61
    .line 62
    move-result-wide v3

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v2, "saved location container:"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v11, "AddWorkspaceItemsTask"

    .line 81
    .line 82
    invoke-static {v11, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    const-wide/16 v5, 0x0

    .line 86
    .line 87
    cmp-long v0, v3, v5

    .line 88
    .line 89
    if-gez v0, :cond_2

    .line 90
    .line 91
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v10}, Lcom/android/launcher3/H5$a;->e()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    int-to-long v5, v0

    .line 104
    invoke-virtual {v10}, Lcom/android/launcher3/H5$a;->a()I

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    invoke-virtual {v10}, Lcom/android/launcher3/H5$a;->b()I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    move-object v0, p0

    .line 113
    move-object v2, p3

    .line 114
    invoke-direct/range {v0 .. v8}, Lz1/j;->d(Lcom/android/launcher3/P2;Lz1/y0;JJII)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-nez v0, :cond_3

    .line 119
    .line 120
    const-string v0, "location available"

    .line 121
    .line 122
    invoke-static {v11, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    invoke-virtual {v10}, Lcom/android/launcher3/H5$a;->e()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {v10}, Lcom/android/launcher3/H5$a;->a()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    invoke-virtual {v10}, Lcom/android/launcher3/H5$a;->b()I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    filled-new-array {v0, v1, v2}, [I

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    return-object v0

    .line 142
    :cond_2
    if-lez v0, :cond_3

    .line 143
    .line 144
    invoke-direct {p0, p3, v3, v4}, Lz1/j;->c(Lz1/y0;J)Lcom/android/launcher3/model/data/p;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    if-eqz v0, :cond_3

    .line 149
    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    const-string v3, "add icon to folder id:"

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    iget v3, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 161
    .line 162
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-static {v11, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Lz1/o3;->Y()Lz1/J3;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iget v4, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 177
    .line 178
    iget v6, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 179
    .line 180
    iget v7, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 181
    .line 182
    const/4 v5, 0x0

    .line 183
    move-object v3, v1

    .line 184
    invoke-virtual/range {v2 .. v7}, Lz1/J3;->x(Lcom/android/launcher3/model/data/y;IIII)V

    .line 185
    .line 186
    .line 187
    new-instance v2, Lz1/j$b;

    .line 188
    .line 189
    invoke-direct {v2, p0, v0, v1}, Lz1/j$b;-><init>(Lz1/j;Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/I;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p1, v2}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 193
    .line 194
    .line 195
    const/4 v0, -0x1

    .line 196
    filled-new-array {v0, v0, v0}, [I

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    return-object v0

    .line 201
    :cond_3
    return-object v9
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Lz1/j;->a:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v3, :cond_17

    .line 10
    .line 11
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    goto/16 :goto_7

    .line 18
    .line 19
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 25
    .line 26
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Lz1/o3;->V()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v10

    .line 33
    monitor-enter p2

    .line 34
    :try_start_0
    invoke-virtual {v2}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    const-string v4, "AddWorkspaceItemsTask"

    .line 39
    .line 40
    new-instance v7, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v8, "workspaceScreens: "

    .line 46
    .line 47
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v5}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    new-instance v4, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    iget-object v7, v0, Lz1/j;->a:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    :cond_1
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-eqz v8, :cond_7

    .line 80
    .line 81
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    check-cast v8, Landroid/util/Pair;

    .line 86
    .line 87
    iget-object v8, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v8, Lcom/android/launcher3/model/data/y;

    .line 90
    .line 91
    if-nez v8, :cond_2

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    const-string v9, "AddWorkspaceItemsTask"

    .line 95
    .line 96
    new-instance v11, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string v12, "execute item: "

    .line 102
    .line 103
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v11

    .line 117
    invoke-static {v9, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 121
    .line 122
    .line 123
    move-result-object v9

    .line 124
    iget-object v11, v8, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 125
    .line 126
    invoke-static {v9, v11, v10}, Lx1/O;->n2(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/content/Context;)Z

    .line 127
    .line 128
    .line 129
    move-result v9

    .line 130
    if-eqz v9, :cond_3

    .line 131
    .line 132
    const-string v8, "AddWorkspaceItemsTask"

    .line 133
    .line 134
    const-string v9, "execute: no add workspaceItems , the app is hidden from third"

    .line 135
    .line 136
    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :catchall_0
    move-exception v0

    .line 141
    goto/16 :goto_6

    .line 142
    .line 143
    :cond_3
    iget-boolean v9, v0, Lz1/j;->c:Z

    .line 144
    .line 145
    if-nez v9, :cond_5

    .line 146
    .line 147
    iget v9, v8, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 148
    .line 149
    if-nez v9, :cond_5

    .line 150
    .line 151
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 152
    .line 153
    .line 154
    move-result-object v9

    .line 155
    iget-object v11, v8, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 156
    .line 157
    invoke-virtual {v0, v2, v8, v9, v11}, Lz1/j;->f(Lz1/y0;Lcom/android/launcher3/model/data/y;Landroid/content/Intent;Landroid/os/UserHandle;)Z

    .line 158
    .line 159
    .line 160
    move-result v9

    .line 161
    if-eqz v9, :cond_4

    .line 162
    .line 163
    invoke-static {v8}, Lcom/android/launcher3/resource/h1;->h0(Lcom/android/launcher3/model/data/y;)Z

    .line 164
    .line 165
    .line 166
    move-result v9

    .line 167
    if-nez v9, :cond_4

    .line 168
    .line 169
    const-string v8, "AddWorkspaceItemsTask"

    .line 170
    .line 171
    const-string v9, "execute--shortcutExists=true"

    .line 172
    .line 173
    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_4
    instance-of v9, v8, Lcom/android/launcher3/model/data/z;

    .line 178
    .line 179
    if-eqz v9, :cond_5

    .line 180
    .line 181
    move-object v9, v8

    .line 182
    check-cast v9, Lcom/android/launcher3/model/data/z;

    .line 183
    .line 184
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 185
    .line 186
    .line 187
    move-result v9

    .line 188
    if-eqz v9, :cond_5

    .line 189
    .line 190
    goto :goto_0

    .line 191
    :cond_5
    iget v9, v8, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 192
    .line 193
    if-nez v9, :cond_6

    .line 194
    .line 195
    instance-of v9, v8, Lcom/android/launcher3/model/data/F;

    .line 196
    .line 197
    if-eqz v9, :cond_6

    .line 198
    .line 199
    check-cast v8, Lcom/android/launcher3/model/data/F;

    .line 200
    .line 201
    invoke-interface {v8, v10}, Lcom/android/launcher3/model/data/F;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 202
    .line 203
    .line 204
    move-result-object v8

    .line 205
    :cond_6
    if-eqz v8, :cond_1

    .line 206
    .line 207
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :cond_7
    sget-object v7, LD1/b;->f:Lcom/android/launcher3/util/I;

    .line 213
    .line 214
    invoke-virtual {v7, v10}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v7

    .line 218
    check-cast v7, LD1/b;

    .line 219
    .line 220
    const-class v7, Landroid/content/pm/LauncherApps;

    .line 221
    .line 222
    invoke-virtual {v10, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    check-cast v7, Landroid/content/pm/LauncherApps;

    .line 227
    .line 228
    new-instance v11, Ljava/util/ArrayList;

    .line 229
    .line 230
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 231
    .line 232
    .line 233
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 234
    .line 235
    .line 236
    move-result-object v12

    .line 237
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 238
    .line 239
    .line 240
    move-result v4

    .line 241
    if-eqz v4, :cond_15

    .line 242
    .line 243
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v4

    .line 247
    move-object v13, v4

    .line 248
    check-cast v13, Lcom/android/launcher3/model/data/y;

    .line 249
    .line 250
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 251
    .line 252
    .line 253
    move-result-object v4

    .line 254
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    if-eqz v4, :cond_8

    .line 259
    .line 260
    invoke-static {v10}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    if-eqz v4, :cond_8

    .line 265
    .line 266
    invoke-static {}, Lx1/Y;->h()Z

    .line 267
    .line 268
    .line 269
    move-result v4

    .line 270
    if-eqz v4, :cond_8

    .line 271
    .line 272
    invoke-static {v13}, Lcom/android/launcher3/resource/h1;->h0(Lcom/android/launcher3/model/data/y;)Z

    .line 273
    .line 274
    .line 275
    move-result v4

    .line 276
    if-eqz v4, :cond_8

    .line 277
    .line 278
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    goto :goto_1

    .line 282
    :cond_8
    iget-boolean v4, v0, Lz1/j;->c:Z

    .line 283
    .line 284
    const/4 v14, 0x1

    .line 285
    if-nez v4, :cond_a

    .line 286
    .line 287
    iget v4, v13, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 288
    .line 289
    if-eqz v4, :cond_9

    .line 290
    .line 291
    if-ne v4, v14, :cond_a

    .line 292
    .line 293
    :cond_9
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 294
    .line 295
    .line 296
    move-result-object v4

    .line 297
    iget-object v7, v13, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 298
    .line 299
    invoke-virtual {v0, v2, v13, v4, v7}, Lz1/j;->f(Lz1/y0;Lcom/android/launcher3/model/data/y;Landroid/content/Intent;Landroid/os/UserHandle;)Z

    .line 300
    .line 301
    .line 302
    move-result v4

    .line 303
    if-eqz v4, :cond_b

    .line 304
    .line 305
    const-string v4, "AddWorkspaceItemsTask"

    .line 306
    .line 307
    new-instance v7, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 310
    .line 311
    .line 312
    const-string v8, "execute--shortcutExists--item.title="

    .line 313
    .line 314
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    iget-object v8, v13, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 318
    .line 319
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v7

    .line 326
    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    .line 328
    .line 329
    goto :goto_1

    .line 330
    :cond_a
    const-string v4, "AddWorkspaceItemsTask"

    .line 331
    .line 332
    new-instance v7, Ljava/lang/StringBuilder;

    .line 333
    .line 334
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 335
    .line 336
    .line 337
    const-string v8, "execute--isMoveDataFlag:"

    .line 338
    .line 339
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    iget-boolean v8, v0, Lz1/j;->c:Z

    .line 343
    .line 344
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const-string v8, "--item.itemType:"

    .line 348
    .line 349
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    iget v8, v13, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 353
    .line 354
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    const-string v8, "--item.title:"

    .line 358
    .line 359
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    iget-object v8, v13, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 363
    .line 364
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v7

    .line 371
    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    .line 373
    .line 374
    :cond_b
    invoke-direct {v0, v1, v13, v2}, Lz1/j;->g(Lz1/o3;Lcom/android/launcher3/model/data/y;Lz1/y0;)[I

    .line 375
    .line 376
    .line 377
    move-result-object v4

    .line 378
    const/4 v15, -0x1

    .line 379
    const/4 v7, 0x0

    .line 380
    if-eqz v4, :cond_c

    .line 381
    .line 382
    aget v8, v4, v7

    .line 383
    .line 384
    if-eq v8, v15, :cond_c

    .line 385
    .line 386
    move/from16 p3, v15

    .line 387
    .line 388
    move v15, v7

    .line 389
    goto :goto_2

    .line 390
    :cond_c
    if-eqz v4, :cond_d

    .line 391
    .line 392
    aget v4, v4, v7

    .line 393
    .line 394
    if-ne v4, v15, :cond_d

    .line 395
    .line 396
    goto/16 :goto_1

    .line 397
    .line 398
    :cond_d
    iget-object v4, v0, Lz1/j;->b:Lz1/z5;

    .line 399
    .line 400
    move v8, v7

    .line 401
    iget v7, v13, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 402
    .line 403
    move v9, v8

    .line 404
    iget v8, v13, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 405
    .line 406
    move/from16 v16, v9

    .line 407
    .line 408
    iget-boolean v9, v13, Lcom/android/launcher3/model/data/y;->isCollisionInWorkspace:Z

    .line 409
    .line 410
    move/from16 p3, v15

    .line 411
    .line 412
    move/from16 v15, v16

    .line 413
    .line 414
    invoke-virtual/range {v4 .. v9}, Lz1/z5;->c(Lcom/android/launcher3/util/x0;Lcom/android/launcher3/util/x0;IIZ)[I

    .line 415
    .line 416
    .line 417
    move-result-object v4

    .line 418
    iput-boolean v15, v13, Lcom/android/launcher3/model/data/y;->isCollisionInWorkspace:Z

    .line 419
    .line 420
    :goto_2
    aget v7, v4, v15

    .line 421
    .line 422
    const-string v8, "AddWorkspaceItemsTask"

    .line 423
    .line 424
    new-instance v9, Ljava/lang/StringBuilder;

    .line 425
    .line 426
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 427
    .line 428
    .line 429
    const-string v15, "execute--screenId="

    .line 430
    .line 431
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v9

    .line 441
    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    .line 443
    .line 444
    instance-of v8, v13, Lcom/android/launcher3/model/data/p;

    .line 445
    .line 446
    const/4 v9, 0x2

    .line 447
    if-eqz v8, :cond_e

    .line 448
    .line 449
    move-object v8, v13

    .line 450
    check-cast v8, Lcom/android/launcher3/model/data/p;

    .line 451
    .line 452
    const/16 v15, 0x8

    .line 453
    .line 454
    invoke-virtual {v8, v15}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 455
    .line 456
    .line 457
    move-result v8

    .line 458
    if-eqz v8, :cond_e

    .line 459
    .line 460
    aput p3, v4, v14

    .line 461
    .line 462
    aput p3, v4, v9

    .line 463
    .line 464
    :cond_e
    instance-of v8, v13, Lcom/android/launcher3/model/data/I;

    .line 465
    .line 466
    if-nez v8, :cond_11

    .line 467
    .line 468
    instance-of v8, v13, Lcom/android/launcher3/model/data/m;

    .line 469
    .line 470
    if-nez v8, :cond_11

    .line 471
    .line 472
    instance-of v8, v13, Lcom/android/launcher3/model/data/A;

    .line 473
    .line 474
    if-eqz v8, :cond_f

    .line 475
    .line 476
    goto :goto_3

    .line 477
    :cond_f
    instance-of v8, v13, Lcom/android/launcher3/model/data/F;

    .line 478
    .line 479
    if-eqz v8, :cond_10

    .line 480
    .line 481
    check-cast v13, Lcom/android/launcher3/model/data/F;

    .line 482
    .line 483
    invoke-interface {v13, v10}, Lcom/android/launcher3/model/data/F;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 484
    .line 485
    .line 486
    move-result-object v13

    .line 487
    goto :goto_3

    .line 488
    :cond_10
    new-instance v0, Ljava/lang/RuntimeException;

    .line 489
    .line 490
    const-string v1, "Unexpected info type"

    .line 491
    .line 492
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 493
    .line 494
    .line 495
    throw v0

    .line 496
    :cond_11
    :goto_3
    iget-boolean v8, v0, Lz1/j;->c:Z

    .line 497
    .line 498
    if-eqz v8, :cond_13

    .line 499
    .line 500
    instance-of v8, v13, Lcom/android/launcher3/model/data/A;

    .line 501
    .line 502
    if-eqz v8, :cond_12

    .line 503
    .line 504
    move-object v8, v13

    .line 505
    check-cast v8, Lcom/android/launcher3/model/data/A;

    .line 506
    .line 507
    iget v8, v8, Lcom/android/launcher3/model/data/A;->g:I

    .line 508
    .line 509
    const/4 v15, -0x2

    .line 510
    if-ne v8, v15, :cond_12

    .line 511
    .line 512
    const-string v8, "AddWorkspaceItemsTask"

    .line 513
    .line 514
    new-instance v15, Ljava/lang/StringBuilder;

    .line 515
    .line 516
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 517
    .line 518
    .line 519
    move/from16 p3, v9

    .line 520
    .line 521
    const-string v9, "moveItemInDatabase setAppLocationInfo: "

    .line 522
    .line 523
    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 524
    .line 525
    .line 526
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 527
    .line 528
    .line 529
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 530
    .line 531
    .line 532
    move-result-object v9

    .line 533
    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    .line 535
    .line 536
    new-instance v16, Lcom/android/launcher3/H5$a;

    .line 537
    .line 538
    aget v17, v4, v14

    .line 539
    .line 540
    aget v18, v4, p3

    .line 541
    .line 542
    iget v8, v13, Lcom/android/launcher3/model/data/y;->container:I

    .line 543
    .line 544
    int-to-long v8, v8

    .line 545
    iget v15, v13, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 546
    .line 547
    move/from16 v28, v14

    .line 548
    .line 549
    iget v14, v13, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 550
    .line 551
    move-object/from16 v29, v4

    .line 552
    .line 553
    iget v4, v13, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 554
    .line 555
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 556
    .line 557
    .line 558
    move-result-object v25

    .line 559
    move/from16 v24, v4

    .line 560
    .line 561
    move-object v4, v13

    .line 562
    check-cast v4, Lcom/android/launcher3/model/data/A;

    .line 563
    .line 564
    iget-object v4, v4, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 565
    .line 566
    invoke-virtual {v10}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 567
    .line 568
    .line 569
    move-result-object v27

    .line 570
    move-object/from16 v26, v4

    .line 571
    .line 572
    move/from16 v19, v7

    .line 573
    .line 574
    move-wide/from16 v20, v8

    .line 575
    .line 576
    move/from16 v23, v14

    .line 577
    .line 578
    move/from16 v22, v15

    .line 579
    .line 580
    invoke-direct/range {v16 .. v27}, Lcom/android/launcher3/H5$a;-><init>(IIIJIIILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/content/Context;)V

    .line 581
    .line 582
    .line 583
    move-object/from16 v4, v16

    .line 584
    .line 585
    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 586
    .line 587
    .line 588
    move-result-object v7

    .line 589
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 590
    .line 591
    .line 592
    move-result-object v7

    .line 593
    invoke-virtual {v7, v4}, Lcom/android/launcher3/H5;->k1(Lcom/android/launcher3/H5$a;)V

    .line 594
    .line 595
    .line 596
    goto :goto_4

    .line 597
    :cond_12
    move-object/from16 v29, v4

    .line 598
    .line 599
    move/from16 v19, v7

    .line 600
    .line 601
    move/from16 p3, v9

    .line 602
    .line 603
    move/from16 v28, v14

    .line 604
    .line 605
    :goto_4
    invoke-virtual {v1}, Lz1/o3;->Y()Lz1/J3;

    .line 606
    .line 607
    .line 608
    move-result-object v16

    .line 609
    aget v20, v29, v28

    .line 610
    .line 611
    aget v21, v29, p3

    .line 612
    .line 613
    const/16 v18, -0x64

    .line 614
    .line 615
    move-object/from16 v17, v13

    .line 616
    .line 617
    invoke-virtual/range {v16 .. v21}, Lz1/J3;->T(Lcom/android/launcher3/model/data/y;IIII)V

    .line 618
    .line 619
    .line 620
    move-object/from16 v13, v17

    .line 621
    .line 622
    goto :goto_5

    .line 623
    :cond_13
    move-object/from16 v29, v4

    .line 624
    .line 625
    move/from16 v19, v7

    .line 626
    .line 627
    move/from16 p3, v9

    .line 628
    .line 629
    move-object/from16 v17, v13

    .line 630
    .line 631
    move/from16 v28, v14

    .line 632
    .line 633
    invoke-virtual {v1}, Lz1/o3;->Y()Lz1/J3;

    .line 634
    .line 635
    .line 636
    move-result-object v16

    .line 637
    aget v20, v29, v28

    .line 638
    .line 639
    aget v21, v29, p3

    .line 640
    .line 641
    const/16 v18, -0x64

    .line 642
    .line 643
    invoke-virtual/range {v16 .. v21}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 644
    .line 645
    .line 646
    move-object/from16 v13, v17

    .line 647
    .line 648
    :goto_5
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 649
    .line 650
    .line 651
    move-result-object v4

    .line 652
    if-eqz v4, :cond_14

    .line 653
    .line 654
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 655
    .line 656
    .line 657
    move-result-object v4

    .line 658
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 659
    .line 660
    .line 661
    move-result-object v4

    .line 662
    iget-object v7, v13, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 663
    .line 664
    invoke-static {v10, v4, v7}, Lcom/android/launcher3/util/D1;->f(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 665
    .line 666
    .line 667
    move-result v4

    .line 668
    if-eqz v4, :cond_14

    .line 669
    .line 670
    move/from16 v4, v28

    .line 671
    .line 672
    iput-boolean v4, v13, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 673
    .line 674
    const-string v4, "AddWorkspaceItemsTask"

    .line 675
    .line 676
    new-instance v7, Ljava/lang/StringBuilder;

    .line 677
    .line 678
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 679
    .line 680
    .line 681
    const-string v8, "AddWorkspaceItemsTask packageName: "

    .line 682
    .line 683
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 684
    .line 685
    .line 686
    iget-object v8, v13, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 687
    .line 688
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 689
    .line 690
    .line 691
    const-string v8, " info.isNewApp: "

    .line 692
    .line 693
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 694
    .line 695
    .line 696
    iget-boolean v8, v13, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 697
    .line 698
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 699
    .line 700
    .line 701
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 702
    .line 703
    .line 704
    move-result-object v7

    .line 705
    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    .line 707
    .line 708
    :cond_14
    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 709
    .line 710
    .line 711
    const-string v4, "AddWorkspaceItemsTask"

    .line 712
    .line 713
    new-instance v7, Ljava/lang/StringBuilder;

    .line 714
    .line 715
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 716
    .line 717
    .line 718
    const-string v8, "Adding item info to workspace: "

    .line 719
    .line 720
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 721
    .line 722
    .line 723
    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 724
    .line 725
    .line 726
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 727
    .line 728
    .line 729
    move-result-object v7

    .line 730
    invoke-static {v4, v7}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    .line 732
    .line 733
    goto/16 :goto_1

    .line 734
    .line 735
    :cond_15
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 736
    .line 737
    .line 738
    move-result-object v4

    .line 739
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 740
    .line 741
    .line 742
    move-result v4

    .line 743
    if-eqz v4, :cond_16

    .line 744
    .line 745
    invoke-static {v10}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 746
    .line 747
    .line 748
    move-result v4

    .line 749
    if-eqz v4, :cond_16

    .line 750
    .line 751
    invoke-static {}, Lx1/Y;->h()Z

    .line 752
    .line 753
    .line 754
    move-result v4

    .line 755
    if-eqz v4, :cond_16

    .line 756
    .line 757
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 758
    .line 759
    .line 760
    move-result v4

    .line 761
    if-nez v4, :cond_16

    .line 762
    .line 763
    invoke-static {v10, v1, v2, v11}, Lcom/android/launcher3/resource/h1;->Q(Landroid/content/Context;Lz1/o3;Lz1/y0;Ljava/util/ArrayList;)V

    .line 764
    .line 765
    .line 766
    :cond_16
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 767
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 768
    .line 769
    .line 770
    move-result v2

    .line 771
    if-nez v2, :cond_17

    .line 772
    .line 773
    new-instance v2, Lz1/j$a;

    .line 774
    .line 775
    invoke-direct {v2, v0, v3, v6}, Lz1/j$a;-><init>(Lz1/j;Ljava/util/ArrayList;Lcom/android/launcher3/util/x0;)V

    .line 776
    .line 777
    .line 778
    invoke-virtual {v1, v2}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 779
    .line 780
    .line 781
    return-void

    .line 782
    :goto_6
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 783
    throw v0

    .line 784
    :cond_17
    :goto_7
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lz1/j;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method protected f(Lz1/y0;Lcom/android/launcher3/model/data/y;Landroid/content/Intent;Landroid/os/UserHandle;)Z
    .locals 17

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    return v3

    .line 11
    :cond_0
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const/4 v5, 0x0

    .line 16
    const/4 v6, 0x0

    .line 17
    if-eqz v4, :cond_2

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    if-eqz v7, :cond_1

    .line 32
    .line 33
    invoke-virtual {v2, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v7

    .line 37
    new-instance v8, Landroid/content/Intent;

    .line 38
    .line 39
    invoke-direct {v8, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v8, v5}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v5, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    new-instance v5, Landroid/content/Intent;

    .line 52
    .line 53
    invoke-direct {v5, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v5, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    invoke-virtual {v2, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    goto :goto_0

    .line 69
    :cond_2
    invoke-virtual {v2, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    invoke-virtual {v2, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    move-object/from16 v16, v5

    .line 78
    .line 79
    move-object v5, v4

    .line 80
    move-object/from16 v4, v16

    .line 81
    .line 82
    :goto_0
    invoke-static {v2}, Lcom/android/launcher3/util/J1;->i(Landroid/content/Intent;)Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    monitor-enter p1

    .line 87
    :try_start_0
    iget-object v9, v1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 88
    .line 89
    invoke-virtual {v9}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v9

    .line 93
    :cond_3
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v10

    .line 97
    if-eqz v10, :cond_c

    .line 98
    .line 99
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v10

    .line 103
    check-cast v10, Lcom/android/launcher3/model/data/y;

    .line 104
    .line 105
    instance-of v11, v10, Lcom/android/launcher3/model/data/I;

    .line 106
    .line 107
    if-eqz v11, :cond_b

    .line 108
    .line 109
    move-object v11, v10

    .line 110
    check-cast v11, Lcom/android/launcher3/model/data/I;

    .line 111
    .line 112
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    move-result-object v12

    .line 116
    if-eqz v12, :cond_b

    .line 117
    .line 118
    iget-object v12, v11, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 119
    .line 120
    move-object/from16 v13, p4

    .line 121
    .line 122
    invoke-virtual {v12, v13}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v12

    .line 126
    if-eqz v12, :cond_3

    .line 127
    .line 128
    new-instance v12, Landroid/content/Intent;

    .line 129
    .line 130
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 131
    .line 132
    .line 133
    move-result-object v14

    .line 134
    invoke-direct {v12, v14}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v2}, Landroid/content/Intent;->getSourceBounds()Landroid/graphics/Rect;

    .line 138
    .line 139
    .line 140
    move-result-object v14

    .line 141
    invoke-virtual {v12, v14}, Landroid/content/Intent;->setSourceBounds(Landroid/graphics/Rect;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v12, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v12

    .line 148
    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v14

    .line 152
    if-nez v14, :cond_a

    .line 153
    .line 154
    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v14

    .line 158
    if-eqz v14, :cond_4

    .line 159
    .line 160
    goto/16 :goto_3

    .line 161
    .line 162
    :cond_4
    if-eqz v8, :cond_5

    .line 163
    .line 164
    invoke-virtual {v11}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 165
    .line 166
    .line 167
    move-result v14

    .line 168
    if-eqz v14, :cond_5

    .line 169
    .line 170
    const/4 v14, 0x2

    .line 171
    invoke-virtual {v11, v14}, Lcom/android/launcher3/model/data/I;->Z(I)Z

    .line 172
    .line 173
    .line 174
    move-result v14

    .line 175
    if-eqz v14, :cond_5

    .line 176
    .line 177
    invoke-virtual {v11}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 178
    .line 179
    .line 180
    move-result-object v14

    .line 181
    if-eqz v14, :cond_5

    .line 182
    .line 183
    if-eqz v4, :cond_5

    .line 184
    .line 185
    invoke-virtual {v11}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 186
    .line 187
    .line 188
    move-result-object v14

    .line 189
    invoke-virtual {v14}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v14

    .line 193
    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v14

    .line 197
    if-eqz v14, :cond_5

    .line 198
    .line 199
    monitor-exit p1

    .line 200
    return v3

    .line 201
    :catchall_0
    move-exception v0

    .line 202
    goto/16 :goto_4

    .line 203
    .line 204
    :cond_5
    const-string v14, "l.profile=\\d+;"

    .line 205
    .line 206
    const-string v15, ""

    .line 207
    .line 208
    invoke-virtual {v12, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v12

    .line 212
    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v14

    .line 216
    if-nez v14, :cond_9

    .line 217
    .line 218
    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v12

    .line 222
    if-eqz v12, :cond_6

    .line 223
    .line 224
    goto/16 :goto_2

    .line 225
    .line 226
    :cond_6
    iget v12, v11, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 227
    .line 228
    if-nez v12, :cond_7

    .line 229
    .line 230
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 231
    .line 232
    .line 233
    move-result-object v10

    .line 234
    if-eqz v10, :cond_3

    .line 235
    .line 236
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 237
    .line 238
    .line 239
    move-result-object v11

    .line 240
    invoke-virtual {v10, v11}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v11

    .line 244
    if-eqz v11, :cond_3

    .line 245
    .line 246
    const-string v0, "AddWorkspaceItemsTask"

    .line 247
    .line 248
    new-instance v2, Ljava/lang/StringBuilder;

    .line 249
    .line 250
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 251
    .line 252
    .line 253
    const-string v4, "shortcutExist--ITEM_TYPE_APPLICATION--ComponentName:"

    .line 254
    .line 255
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    const-string v4, " is exist!"

    .line 262
    .line 263
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    monitor-exit p1

    .line 274
    return v3

    .line 275
    :cond_7
    if-ne v12, v3, :cond_8

    .line 276
    .line 277
    iget v12, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 278
    .line 279
    if-ne v12, v3, :cond_8

    .line 280
    .line 281
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 282
    .line 283
    .line 284
    move-result-object v12

    .line 285
    if-eqz v12, :cond_3

    .line 286
    .line 287
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 288
    .line 289
    .line 290
    move-result-object v10

    .line 291
    invoke-virtual {v12, v10}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result v10

    .line 295
    if-eqz v10, :cond_3

    .line 296
    .line 297
    iget-object v10, v11, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 298
    .line 299
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 300
    .line 301
    .line 302
    move-result v10

    .line 303
    if-nez v10, :cond_3

    .line 304
    .line 305
    iget-object v10, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 306
    .line 307
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 308
    .line 309
    .line 310
    move-result v10

    .line 311
    if-nez v10, :cond_3

    .line 312
    .line 313
    iget-object v10, v11, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 314
    .line 315
    iget-object v11, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 316
    .line 317
    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v10

    .line 321
    if-eqz v10, :cond_3

    .line 322
    .line 323
    const-string v0, "AddWorkspaceItemsTask"

    .line 324
    .line 325
    new-instance v2, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 328
    .line 329
    .line 330
    const-string v4, "shortcutExist--ITEM_TYPE_SHORTCUT--ITEM_TYPE_SHORTCUT--ComponentName:"

    .line 331
    .line 332
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    const-string v4, " is exist!"

    .line 339
    .line 340
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    .line 349
    .line 350
    monitor-exit p1

    .line 351
    return v3

    .line 352
    :cond_8
    const-string v10, "AddWorkspaceItemsTask"

    .line 353
    .line 354
    const-string v11, "info type is other"

    .line 355
    .line 356
    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    .line 358
    .line 359
    goto/16 :goto_1

    .line 360
    .line 361
    :cond_9
    :goto_2
    const-string v0, "AddWorkspaceItemsTask"

    .line 362
    .line 363
    const-string v2, "shortcutExists--profile"

    .line 364
    .line 365
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    .line 367
    .line 368
    monitor-exit p1

    .line 369
    return v3

    .line 370
    :cond_a
    :goto_3
    monitor-exit p1

    .line 371
    return v3

    .line 372
    :cond_b
    move-object/from16 v13, p4

    .line 373
    .line 374
    goto/16 :goto_1

    .line 375
    .line 376
    :cond_c
    monitor-exit p1

    .line 377
    return v6

    .line 378
    :goto_4
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 379
    throw v0
.end method
