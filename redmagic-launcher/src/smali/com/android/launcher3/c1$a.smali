.class Lcom/android/launcher3/c1$a;
.super Ljava/lang/Object;
.source "IconUpdateProxy.java"

# interfaces
.implements Lcom/android/launcher3/c1$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/c1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/c1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/c1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/c1$a;Ljava/util/Map$Entry;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/c1$a;->d(Ljava/util/Map$Entry;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d(Ljava/util/Map$Entry;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/android/launcher3/util/E;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/android/launcher3/c1;->g(Lcom/android/launcher3/c1;Lcom/android/launcher3/util/E;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/launcher3/c1;->d(Lcom/android/launcher3/c1;)Lcom/android/launcher3/D3;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v1, Lz1/D4;

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/android/launcher3/util/E;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/android/launcher3/util/E;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-direct {v1, v2, v0, p1, v3}, Lz1/D4;-><init>(Ljava/lang/String;Ljava/util/List;Landroid/os/UserHandle;Z)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v1}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/c1;->e(Lcom/android/launcher3/c1;)Landroid/util/ArrayMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 14
    .line 15
    invoke-static {v2}, Lcom/android/launcher3/c1;->e(Lcom/android/launcher3/c1;)Landroid/util/ArrayMap;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/util/ArrayMap;->entrySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ljava/util/Map$Entry;

    .line 38
    .line 39
    iget-object v4, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 40
    .line 41
    invoke-static {v4}, Lcom/android/launcher3/c1;->d(Lcom/android/launcher3/c1;)Lcom/android/launcher3/D3;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    if-nez v4, :cond_1

    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_2

    .line 51
    :cond_1
    iget-object v4, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 52
    .line 53
    invoke-static {v4}, Lcom/android/launcher3/c1;->d(Lcom/android/launcher3/c1;)Lcom/android/launcher3/D3;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v4}, Lcom/android/launcher3/D3;->h0()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    const-class v5, Landroid/content/pm/LauncherApps;

    .line 62
    .line 63
    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Landroid/content/pm/LauncherApps;

    .line 68
    .line 69
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    check-cast v5, Lcom/android/launcher3/util/L1;

    .line 74
    .line 75
    iget-object v5, v5, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 76
    .line 77
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    check-cast v6, Lcom/android/launcher3/util/L1;

    .line 82
    .line 83
    iget-object v6, v6, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 84
    .line 85
    invoke-virtual {v4, v5, v6}, Landroid/content/pm/LauncherApps;->isPackageEnabled(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-nez v4, :cond_0

    .line 90
    .line 91
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Lcom/android/launcher3/util/L1;

    .line 96
    .line 97
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-eqz v2, :cond_3

    .line 110
    .line 111
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Lcom/android/launcher3/util/L1;

    .line 116
    .line 117
    iget-object v3, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 118
    .line 119
    invoke-static {v3}, Lcom/android/launcher3/c1;->e(Lcom/android/launcher3/c1;)Landroid/util/ArrayMap;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_3
    monitor-exit v0

    .line 128
    return-void

    .line 129
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    throw p0
.end method

.method public b(Ljava/util/Map;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_4

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ljava/util/Map$Entry;

    .line 35
    .line 36
    new-instance v4, Lcom/android/launcher3/util/L1;

    .line 37
    .line 38
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    check-cast v5, Lcom/android/launcher3/util/E;

    .line 43
    .line 44
    invoke-direct {v4, v5}, Lcom/android/launcher3/util/L1;-><init>(Lcom/android/launcher3/util/E;)V

    .line 45
    .line 46
    .line 47
    iget-object v5, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 48
    .line 49
    invoke-virtual {v5, v4}, Lcom/android/launcher3/c1;->z(Lcom/android/launcher3/util/L1;)Lk1/a;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v6, ","

    .line 61
    .line 62
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v6, ", cache num: "

    .line 73
    .line 74
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v6, ";"

    .line 81
    .line 82
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    if-eqz v5, :cond_1

    .line 86
    .line 87
    invoke-virtual {v5}, Lk1/a;->d()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    check-cast v6, Ljava/lang/Integer;

    .line 96
    .line 97
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    if-ne v5, v6, :cond_1

    .line 102
    .line 103
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    check-cast v5, Lcom/android/launcher3/util/E;

    .line 108
    .line 109
    iget-object v5, v5, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 110
    .line 111
    invoke-static {v5}, Lcom/android/launcher3/nubia/c;->i(Landroid/content/ComponentName;)Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    if-eqz v5, :cond_0

    .line 116
    .line 117
    :cond_1
    iget-object v5, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 118
    .line 119
    invoke-static {v5}, Lcom/android/launcher3/c1;->d(Lcom/android/launcher3/c1;)Lcom/android/launcher3/D3;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v5}, Lcom/android/launcher3/D3;->s0()Z

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    if-eqz v5, :cond_0

    .line 128
    .line 129
    iget-object v5, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 130
    .line 131
    invoke-static {v5}, Lcom/android/launcher3/c1;->e(Lcom/android/launcher3/c1;)Landroid/util/ArrayMap;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    monitor-enter v5

    .line 136
    :try_start_0
    iget-object v6, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 137
    .line 138
    invoke-static {v6}, Lcom/android/launcher3/c1;->e(Lcom/android/launcher3/c1;)Landroid/util/ArrayMap;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    invoke-virtual {v6, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    check-cast v6, Lk1/a;

    .line 147
    .line 148
    if-nez v6, :cond_2

    .line 149
    .line 150
    new-instance v6, Lk1/a;

    .line 151
    .line 152
    invoke-direct {v6}, Lk1/a;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v6, v4}, Lk1/a;->b(Lcom/android/launcher3/util/L1;)V

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :catchall_0
    move-exception p0

    .line 160
    goto/16 :goto_2

    .line 161
    .line 162
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v7

    .line 166
    check-cast v7, Ljava/lang/Integer;

    .line 167
    .line 168
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 169
    .line 170
    .line 171
    move-result v7

    .line 172
    invoke-virtual {v6, v7}, Lk1/a;->h(I)V

    .line 173
    .line 174
    .line 175
    iget-object v7, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 176
    .line 177
    invoke-static {v7}, Lcom/android/launcher3/c1;->e(Lcom/android/launcher3/c1;)Landroid/util/ArrayMap;

    .line 178
    .line 179
    .line 180
    move-result-object v7

    .line 181
    invoke-virtual {v7, v4, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    const-string v7, "com.tencent.wework"

    .line 185
    .line 186
    iget-object v8, v4, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v7

    .line 192
    if-eqz v7, :cond_3

    .line 193
    .line 194
    const-string v7, "com.tencent.wework.launch.LaunchSplashActivity"

    .line 195
    .line 196
    iget-object v8, v4, Lcom/android/launcher3/util/L1;->e:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v7

    .line 202
    if-eqz v7, :cond_3

    .line 203
    .line 204
    new-instance v7, Landroid/content/ComponentName;

    .line 205
    .line 206
    const-string v8, "com.tencent.wework"

    .line 207
    .line 208
    const-string v9, "com.tencent.wework.launch.LaunchSplashGovActivity"

    .line 209
    .line 210
    invoke-direct {v7, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    new-instance v8, Lcom/android/launcher3/util/L1;

    .line 214
    .line 215
    new-instance v9, Lcom/android/launcher3/util/E;

    .line 216
    .line 217
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v10

    .line 221
    check-cast v10, Lcom/android/launcher3/util/E;

    .line 222
    .line 223
    iget-object v10, v10, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 224
    .line 225
    invoke-direct {v9, v7, v10}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 226
    .line 227
    .line 228
    invoke-direct {v8, v9}, Lcom/android/launcher3/util/L1;-><init>(Lcom/android/launcher3/util/E;)V

    .line 229
    .line 230
    .line 231
    const-string v9, "Launcher.Model"

    .line 232
    .line 233
    new-instance v10, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    const-string v11, "onUnreadNumberChanged: add wechat gov data to unread map: "

    .line 239
    .line 240
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    iget-object v11, v4, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    const-string v11, ", "

    .line 249
    .line 250
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    iget-object v11, v4, Lcom/android/launcher3/util/L1;->e:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    const-string v11, ","

    .line 259
    .line 260
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v6}, Lk1/a;->d()I

    .line 264
    .line 265
    .line 266
    move-result v11

    .line 267
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    const-string v11, ", cm: "

    .line 271
    .line 272
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v7

    .line 282
    invoke-static {v9, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    iget-object v7, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 286
    .line 287
    invoke-static {v7}, Lcom/android/launcher3/c1;->e(Lcom/android/launcher3/c1;)Landroid/util/ArrayMap;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    invoke-virtual {v7, v8, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    new-instance v7, Landroid/content/ComponentName;

    .line 295
    .line 296
    const-string v8, "com.tencent.wework"

    .line 297
    .line 298
    const-string v9, "com.tencent.wework.launch.LaunchSplashEduActivity"

    .line 299
    .line 300
    invoke-direct {v7, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    new-instance v8, Lcom/android/launcher3/util/L1;

    .line 304
    .line 305
    new-instance v9, Lcom/android/launcher3/util/E;

    .line 306
    .line 307
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v10

    .line 311
    check-cast v10, Lcom/android/launcher3/util/E;

    .line 312
    .line 313
    iget-object v10, v10, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 314
    .line 315
    invoke-direct {v9, v7, v10}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 316
    .line 317
    .line 318
    invoke-direct {v8, v9}, Lcom/android/launcher3/util/L1;-><init>(Lcom/android/launcher3/util/E;)V

    .line 319
    .line 320
    .line 321
    const-string v9, "Launcher.Model"

    .line 322
    .line 323
    new-instance v10, Ljava/lang/StringBuilder;

    .line 324
    .line 325
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 326
    .line 327
    .line 328
    const-string v11, "onUnreadNumberChanged: add wechat edu data to unread map: "

    .line 329
    .line 330
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    iget-object v11, v4, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    const-string v11, ", "

    .line 339
    .line 340
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    iget-object v4, v4, Lcom/android/launcher3/util/L1;->e:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    const-string v4, ","

    .line 349
    .line 350
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v6}, Lk1/a;->d()I

    .line 354
    .line 355
    .line 356
    move-result v4

    .line 357
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    const-string v4, ", cm: "

    .line 361
    .line 362
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    invoke-static {v9, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    .line 374
    .line 375
    iget-object v4, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 376
    .line 377
    invoke-static {v4}, Lcom/android/launcher3/c1;->e(Lcom/android/launcher3/c1;)Landroid/util/ArrayMap;

    .line 378
    .line 379
    .line 380
    move-result-object v4

    .line 381
    invoke-virtual {v4, v8, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    :cond_3
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    iget-object v4, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 386
    .line 387
    invoke-static {v4}, Lcom/android/launcher3/c1;->d(Lcom/android/launcher3/c1;)Lcom/android/launcher3/D3;

    .line 388
    .line 389
    .line 390
    move-result-object v4

    .line 391
    new-instance v5, Lx1/x;

    .line 392
    .line 393
    new-instance v6, Lcom/android/launcher3/b1;

    .line 394
    .line 395
    invoke-direct {v6, p0, v3}, Lcom/android/launcher3/b1;-><init>(Lcom/android/launcher3/c1$a;Ljava/util/Map$Entry;)V

    .line 396
    .line 397
    .line 398
    const/4 v7, 0x1

    .line 399
    invoke-direct {v5, v6, v7}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v4, v5}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 403
    .line 404
    .line 405
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    check-cast v4, Lcom/android/launcher3/util/E;

    .line 410
    .line 411
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    move-result-object v4

    .line 418
    check-cast v4, Lcom/android/launcher3/util/E;

    .line 419
    .line 420
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    const-string v5, ", "

    .line 424
    .line 425
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    .line 427
    .line 428
    const-string v5, "com.tencent.wework"

    .line 429
    .line 430
    iget-object v6, v4, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 431
    .line 432
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v6

    .line 436
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 437
    .line 438
    .line 439
    move-result v5

    .line 440
    if-eqz v5, :cond_0

    .line 441
    .line 442
    const-string v5, "com.tencent.wework.launch.LaunchSplashActivity"

    .line 443
    .line 444
    iget-object v4, v4, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 445
    .line 446
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 451
    .line 452
    .line 453
    move-result v4

    .line 454
    if-eqz v4, :cond_0

    .line 455
    .line 456
    new-instance v4, Landroid/content/ComponentName;

    .line 457
    .line 458
    const-string v5, "com.tencent.wework"

    .line 459
    .line 460
    const-string v6, "com.tencent.wework.launch.LaunchSplashGovActivity"

    .line 461
    .line 462
    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    new-instance v5, Lcom/android/launcher3/util/E;

    .line 466
    .line 467
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 468
    .line 469
    .line 470
    move-result-object v6

    .line 471
    check-cast v6, Lcom/android/launcher3/util/E;

    .line 472
    .line 473
    iget-object v6, v6, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 474
    .line 475
    invoke-direct {v5, v4, v6}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 476
    .line 477
    .line 478
    const-string v4, "Launcher.Model"

    .line 479
    .line 480
    const-string v6, "onUnreadNumberChanged: add wechat gov data to unread infos."

    .line 481
    .line 482
    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    .line 484
    .line 485
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 486
    .line 487
    .line 488
    new-instance v4, Landroid/content/ComponentName;

    .line 489
    .line 490
    const-string v5, "com.tencent.wework"

    .line 491
    .line 492
    const-string v6, "com.tencent.wework.launch.LaunchSplashEduActivity"

    .line 493
    .line 494
    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 495
    .line 496
    .line 497
    new-instance v5, Lcom/android/launcher3/util/E;

    .line 498
    .line 499
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 500
    .line 501
    .line 502
    move-result-object v3

    .line 503
    check-cast v3, Lcom/android/launcher3/util/E;

    .line 504
    .line 505
    iget-object v3, v3, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 506
    .line 507
    invoke-direct {v5, v4, v3}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 508
    .line 509
    .line 510
    const-string v3, "Launcher.Model"

    .line 511
    .line 512
    const-string v4, "onUnreadNumberChanged: add wechat edu data to unread infos."

    .line 513
    .line 514
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    .line 516
    .line 517
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    goto/16 :goto_0

    .line 521
    .line 522
    :goto_2
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 523
    throw p0

    .line 524
    :cond_4
    const-string p1, "Launcher.Model"

    .line 525
    .line 526
    new-instance v3, Ljava/lang/StringBuilder;

    .line 527
    .line 528
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 529
    .line 530
    .line 531
    const-string v4, "onUnreadNumberChanged: original data: "

    .line 532
    .line 533
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    const-string v1, "\n update unread: "

    .line 540
    .line 541
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v1

    .line 551
    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    .line 553
    .line 554
    iget-object p0, p0, Lcom/android/launcher3/c1$a;->a:Lcom/android/launcher3/c1;

    .line 555
    .line 556
    invoke-static {p0}, Lcom/android/launcher3/c1;->d(Lcom/android/launcher3/c1;)Lcom/android/launcher3/D3;

    .line 557
    .line 558
    .line 559
    move-result-object p0

    .line 560
    new-instance p1, Lcom/android/launcher3/f1;

    .line 561
    .line 562
    invoke-direct {p1, v0}, Lcom/android/launcher3/f1;-><init>(Ljava/util/List;)V

    .line 563
    .line 564
    .line 565
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 566
    .line 567
    .line 568
    return-void
.end method
