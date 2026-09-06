.class public Lcom/android/launcher3/R6;
.super Ljava/lang/Object;
.source "ZBackupRecoverData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/R6$a;,
        Lcom/android/launcher3/R6$b;,
        Lcom/android/launcher3/R6$d;,
        Lcom/android/launcher3/R6$c;
    }
.end annotation


# direct methods
.method public static synthetic a(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ljava/io/File;Z)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 10
    .line 11
    .line 12
    const-string p0, "ZBackupRecoverData"

    .line 13
    .line 14
    const-string v0, "recoverEnd: delete sourceDBFile."

    .line 15
    .line 16
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string p0, "/storage/emulated/0/Documents/nubiaLauncher/cn.nubia.launcher/databases/"

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    new-instance p1, Ljava/io/File;

    .line 24
    .line 25
    const-string v0, "launcher.db-journal"

    .line 26
    .line 27
    invoke-direct {p1, p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    new-instance p1, Ljava/io/File;

    .line 41
    .line 42
    const-string v0, "launcher.db-wal"

    .line 43
    .line 44
    invoke-direct {p1, p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ljava/io/File;

    .line 48
    .line 49
    const-string v1, "launcher.db-shm"

    .line 50
    .line 51
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_3

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 70
    .line 71
    .line 72
    :cond_3
    return-void
.end method

.method protected static c(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "launcherNubia.db"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v2, "."

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {v1, v2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {v0, p0}, Lcom/android/launcher3/R6;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method private static d(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    const/4 v3, 0x0

    .line 22
    const/4 v4, -0x1

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    packed-switch v5, :pswitch_data_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :pswitch_0
    const-string v5, "4"

    .line 32
    .line 33
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v4, 0x3

    .line 41
    goto :goto_0

    .line 42
    :pswitch_1
    const-string v5, "3"

    .line 43
    .line 44
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/4 v4, 0x2

    .line 52
    goto :goto_0

    .line 53
    :pswitch_2
    const-string v5, "2"

    .line 54
    .line 55
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    move v4, v2

    .line 63
    goto :goto_0

    .line 64
    :pswitch_3
    const-string v5, "1"

    .line 65
    .line 66
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    move v4, v3

    .line 74
    :goto_0
    packed-switch v4, :pswitch_data_1

    .line 75
    .line 76
    .line 77
    move p1, v0

    .line 78
    move v4, v1

    .line 79
    goto :goto_2

    .line 80
    :pswitch_4
    move v4, v2

    .line 81
    move p1, v3

    .line 82
    goto :goto_2

    .line 83
    :pswitch_5
    move p1, v2

    .line 84
    :goto_1
    move v4, p1

    .line 85
    goto :goto_2

    .line 86
    :pswitch_6
    move p1, v3

    .line 87
    goto :goto_1

    .line 88
    :pswitch_7
    move p1, v2

    .line 89
    move v4, v3

    .line 90
    :goto_2
    if-eqz p1, :cond_7

    .line 91
    .line 92
    if-eqz v4, :cond_5

    .line 93
    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    invoke-static {p0}, Lcom/android/launcher3/R6;->i(Landroid/content/Context;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_4
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0, v2, v2, v3, v3}, Lcom/android/launcher3/resource/B;->G(ZZZZ)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_5
    if-eqz v0, :cond_6

    .line 111
    .line 112
    if-nez v1, :cond_6

    .line 113
    .line 114
    invoke-static {p0}, Lcom/android/launcher3/R6;->i(Landroid/content/Context;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_6
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0, v3, v2, v3, v3}, Lcom/android/launcher3/resource/B;->G(ZZZZ)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_7
    if-eqz v4, :cond_9

    .line 127
    .line 128
    if-nez v0, :cond_8

    .line 129
    .line 130
    if-eqz v1, :cond_8

    .line 131
    .line 132
    invoke-static {p0}, Lcom/android/launcher3/R6;->i(Landroid/content/Context;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_8
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0, v2, v3, v3, v3}, Lcom/android/launcher3/resource/B;->G(ZZZZ)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_9
    if-nez v0, :cond_a

    .line 145
    .line 146
    if-nez v1, :cond_a

    .line 147
    .line 148
    invoke-static {p0}, Lcom/android/launcher3/R6;->i(Landroid/content/Context;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_a
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0, v3, v3, v3, v3}, Lcom/android/launcher3/resource/B;->G(ZZZZ)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    nop

    .line 161
    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method private static e(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 10

    .line 1
    new-instance v0, Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p0}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    iget v3, v1, Landroid/graphics/Point;->y:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v3, "|"

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 36
    .line 37
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    const-string v1, "3|4"

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const-string v1, "4|5"

    .line 59
    .line 60
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v3, "createLauncherSettings layoutStyleValue: "

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const-string v3, "ZBackupRecoverData"

    .line 78
    .line 79
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    const-string v2, "layoutStyle"

    .line 83
    .line 84
    const-string v4, "name"

    .line 85
    .line 86
    invoke-virtual {v0, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const-string v2, "value"

    .line 90
    .line 91
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const-string v5, "launcherSettings"

    .line 95
    .line 96
    const/4 v6, 0x0

    .line 97
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 98
    .line 99
    .line 100
    const-string v7, "layoutStyle_6x4"

    .line 101
    .line 102
    invoke-virtual {v0, v4, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 109
    .line 110
    .line 111
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->s:Z

    .line 120
    .line 121
    new-instance v7, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    const-string v8, "createLauncherSettings: customPageState: "

    .line 127
    .line 128
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    invoke-static {v3, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    const-string v7, "customScreen"

    .line 142
    .line 143
    invoke-virtual {v0, v4, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 154
    .line 155
    .line 156
    const-string v1, "recommendFolder"

    .line 157
    .line 158
    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 162
    .line 163
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 167
    .line 168
    .line 169
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    iget v1, v1, Lcom/android/launcher3/r4;->q:I

    .line 178
    .line 179
    const/4 v7, 0x0

    .line 180
    const/4 v8, 0x1

    .line 181
    if-ne v1, v8, :cond_2

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_2
    move v8, v7

    .line 185
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    .line 189
    .line 190
    const-string v9, "createLauncherSettings quickSearch: "

    .line 191
    .line 192
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    .line 204
    .line 205
    const-string v1, "quickSearch"

    .line 206
    .line 207
    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 218
    .line 219
    .line 220
    const-string v1, "fancyIcon"

    .line 221
    .line 222
    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->j:Z

    .line 234
    .line 235
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 243
    .line 244
    .line 245
    const-string v1, "festivalWallpaperSwitch"

    .line 246
    .line 247
    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 258
    .line 259
    .line 260
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->p:Z

    .line 269
    .line 270
    if-eqz p0, :cond_3

    .line 271
    .line 272
    const-string p0, "1"

    .line 273
    .line 274
    goto :goto_2

    .line 275
    :cond_3
    const-string p0, "2"

    .line 276
    .line 277
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 280
    .line 281
    .line 282
    const-string v7, "createLauncherSettings autoAlign: "

    .line 283
    .line 284
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    .line 296
    .line 297
    const-string v1, "uninstallSortOrder"

    .line 298
    .line 299
    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0, v2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 306
    .line 307
    .line 308
    const-string p0, "launcher_state"

    .line 309
    .line 310
    invoke-virtual {v0, v4, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    const-string p0, "false"

    .line 314
    .line 315
    invoke-virtual {v0, v2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 319
    .line 320
    .line 321
    const-string p0, "launcher_mode"

    .line 322
    .line 323
    invoke-virtual {v0, v4, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    invoke-static {}, Lcom/android/launcher3/R6;->j()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    invoke-virtual {v0, v2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 334
    .line 335
    .line 336
    return-void
.end method

.method static f(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .locals 1

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    const-string v0, "_id"

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    return-wide p0

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 17
    .line 18
    const-string p1, "Error: attempting to add item without specifying an id"

    .line 19
    .line 20
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0

    .line 24
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 25
    .line 26
    const-string p1, "Error: attempting to insert null values"

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p0
.end method

.method private static g(Landroid/content/Context;)V
    .locals 5

    .line 1
    const-string v0, "CloudFolder-"

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Lcom/android/launcher3/P6;

    .line 24
    .line 25
    invoke-direct {v2}, Lcom/android/launcher3/P6;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 51
    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget v4, v2, Lcom/android/launcher3/model/data/y;->id:I

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const/4 v4, -0x1

    .line 70
    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eq v3, v4, :cond_0

    .line 75
    .line 76
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    new-instance v4, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v2, v2, Lcom/android/launcher3/model/data/y;->id:I

    .line 89
    .line 90
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-interface {v3, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :catch_0
    move-exception v0

    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v2, "deleteCloudFolderKey: "

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const-string v1, "ZBackupRecoverData"

    .line 124
    .line 125
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 133
    .line 134
    .line 135
    :cond_2
    return-void
.end method

.method private static h(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    :goto_0
    if-eqz p0, :cond_3

    .line 26
    .line 27
    array-length v0, p0

    .line 28
    if-lez v0, :cond_3

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    :goto_1
    array-length v1, p0

    .line 32
    if-ge v0, v1, :cond_3

    .line 33
    .line 34
    aget-object v1, p0, v0

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    aget-object v1, p0, v0

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    aget-object v1, p0, v0

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    aget-object v1, p0, v0

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 65
    .line 66
    .line 67
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    :goto_2
    return-void
.end method

.method private static i(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "ZBackupRecoverData"

    .line 2
    .line 3
    const-string v1, "doNotChangeMode"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lz1/k2;->j()V

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "need_show_empty_icon"

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 35
    .line 36
    .line 37
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 38
    .line 39
    .line 40
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-virtual {p0, v0}, Lcom/android/launcher3/H5;->o(LN1/e;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private static j()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string v0, "3"

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    const-string v0, "4"

    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const-string v0, "1"

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    const-string v0, "2"

    .line 41
    .line 42
    return-object v0
.end method

.method private static k(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z
    .locals 5

    .line 1
    const-string v0, "ZBackupRecoverData"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v4, "select count(*) from "

    .line 13
    .line 14
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p0, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 35
    .line 36
    .line 37
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    if-lez p0, :cond_0

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :catch_0
    move-exception p0

    .line 45
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v4, "isDatabaseTableExist exception "

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    .line 67
    .line 68
    :cond_0
    :goto_0
    invoke-static {v2}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :goto_1
    invoke-static {v2}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 73
    .line 74
    .line 75
    throw p0

    .line 76
    :goto_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v2, "isDatabaseTableExist "

    .line 82
    .line 83
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p1, " exist: "

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    return v1
.end method

.method protected static l(Landroid/content/Context;Ljava/lang/String;ZZ)Z
    .locals 3

    .line 1
    const-string v0, "recover"

    .line 2
    .line 3
    const-string v1, "ZBackupRecoverData"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/io/File;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const-string p0, "recover dbFile is not exist!"

    .line 21
    .line 22
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    :try_start_0
    invoke-static {p1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    .line 28
    .line 29
    .line 30
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    sget-object v0, Lcom/android/launcher3/R6$b;->a:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1, v0}, Lcom/android/launcher3/R6;->k(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    invoke-static {p1}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 49
    .line 50
    .line 51
    const-string p0, "recover contentResolver is null"

    .line 52
    .line 53
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return v2

    .line 57
    :cond_2
    invoke-static {p0, p1}, Lcom/android/launcher3/R6;->p(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)Z

    .line 58
    .line 59
    .line 60
    invoke-static {p0}, Lcom/android/launcher3/R6;->g(Landroid/content/Context;)V

    .line 61
    .line 62
    .line 63
    invoke-static {p0, p1}, Lcom/android/launcher3/R6;->n(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)Z

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p0, p2, p3}, Lcom/android/launcher3/R6;->m(Landroid/content/Context;ZZ)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    return p0

    .line 74
    :cond_3
    :goto_0
    invoke-static {p1}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 75
    .line 76
    .line 77
    const-string p0, "recover db not exist"

    .line 78
    .line 79
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    return v2

    .line 83
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string p2, "recover cannot open database"

    .line 89
    .line 90
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    invoke-static {v0}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 104
    .line 105
    .line 106
    return v2
.end method

.method private static m(Landroid/content/Context;ZZ)V
    .locals 9

    .line 1
    const-string v1, "ZBackupRecoverData"

    .line 2
    .line 3
    const-string v0, "temp.db"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v5, "."

    .line 32
    .line 33
    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {v4, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v2, v0}, Lcom/android/launcher3/R6;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    if-eqz p1, :cond_1

    .line 45
    .line 46
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v2, "launcher_upgrade"

    .line 55
    .line 56
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 61
    .line 62
    .line 63
    new-instance v0, Ljava/io/File;

    .line 64
    .line 65
    const-string v2, "/storage/emulated/0/Documents/nubiaLauncher/cn.nubia.launcher/databases/"

    .line 66
    .line 67
    const-string v4, "launcher.db"

    .line 68
    .line 69
    invoke-direct {v0, v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    sget-object v2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    new-instance v4, Lcom/android/launcher3/Q6;

    .line 85
    .line 86
    invoke-direct {v4, v0, p2}, Lcom/android/launcher3/Q6;-><init>(Ljava/io/File;Z)V

    .line 87
    .line 88
    .line 89
    const-wide/16 v5, 0xbb8

    .line 90
    .line 91
    invoke-virtual {v2, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 92
    .line 93
    .line 94
    :cond_1
    const/4 p2, 0x0

    .line 95
    :try_start_0
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0, p2, p2, p2, p2}, Lz1/k2;->Z([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 108
    .line 109
    .line 110
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    .line 112
    .line 113
    .line 114
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 115
    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 116
    .line 117
    .line 118
    move v3, v0

    .line 119
    goto :goto_2

    .line 120
    :catch_0
    move-exception v0

    .line 121
    goto :goto_1

    .line 122
    :catchall_0
    move-exception v0

    .line 123
    move-object v4, v0

    .line 124
    if-eqz v2, :cond_2

    .line 125
    .line 126
    :try_start_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :catchall_1
    move-exception v0

    .line 131
    :try_start_4
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 132
    .line 133
    .line 134
    :cond_2
    :goto_0
    throw v4
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 135
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    const-string v4, "recoverEnd failed "

    .line 141
    .line 142
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    const-string v2, "recoverEnd: "

    .line 165
    .line 166
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    if-eqz v3, :cond_3

    .line 180
    .line 181
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0}, Lz1/k2;->f()V

    .line 194
    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0}, Lz1/k2;->j()V

    .line 210
    .line 211
    .line 212
    :goto_3
    if-eqz v3, :cond_5

    .line 213
    .line 214
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->r()Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_5

    .line 223
    .line 224
    if-eqz p1, :cond_4

    .line 225
    .line 226
    sget-object p1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 227
    .line 228
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    move-object v2, p1

    .line 233
    check-cast v2, Lcom/android/launcher3/F1;

    .line 234
    .line 235
    const/4 v7, 0x0

    .line 236
    const/4 v8, 0x0

    .line 237
    const/4 v4, 0x0

    .line 238
    const/4 v5, 0x0

    .line 239
    const/4 v6, 0x0

    .line 240
    move-object v3, p0

    .line 241
    invoke-virtual/range {v2 .. v8}, Lcom/android/launcher3/F1;->q0(Landroid/content/Context;ZZZZZ)V

    .line 242
    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_4
    move-object v3, p0

    .line 246
    invoke-static {}, Lx1/O;->Z3()V

    .line 247
    .line 248
    .line 249
    goto :goto_4

    .line 250
    :cond_5
    move-object v3, p0

    .line 251
    :goto_4
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->r()Z

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    if-eqz p0, :cond_8

    .line 260
    .line 261
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->y()Z

    .line 266
    .line 267
    .line 268
    move-result p0

    .line 269
    if-eqz p0, :cond_6

    .line 270
    .line 271
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 276
    .line 277
    .line 278
    move-result p0

    .line 279
    new-instance p1, Ljava/lang/StringBuilder;

    .line 280
    .line 281
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 282
    .line 283
    .line 284
    const-string v0, "isDiffRestored targetSingleMode: "

    .line 285
    .line 286
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    .line 298
    .line 299
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    invoke-virtual {p1, p0}, Lcom/android/launcher3/H5;->w1(Z)V

    .line 308
    .line 309
    .line 310
    :cond_6
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 311
    .line 312
    .line 313
    move-result-object p0

    .line 314
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->t()Z

    .line 315
    .line 316
    .line 317
    move-result p0

    .line 318
    if-eqz p0, :cond_7

    .line 319
    .line 320
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 325
    .line 326
    .line 327
    move-result p0

    .line 328
    new-instance p1, Ljava/lang/StringBuilder;

    .line 329
    .line 330
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 331
    .line 332
    .line 333
    const-string v0, "isDiffRestored Set ease to "

    .line 334
    .line 335
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p0

    .line 345
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    .line 347
    .line 348
    :try_start_5
    const-string p0, "content://com.zte.easymode.settings.SettingsProvider"

    .line 349
    .line 350
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    const-string v0, "ease_mode_set"

    .line 359
    .line 360
    const-string v1, "mfvLauncher"

    .line 361
    .line 362
    invoke-virtual {p1, p0, v0, v1, p2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 363
    .line 364
    .line 365
    goto :goto_5

    .line 366
    :catch_1
    move-exception v0

    .line 367
    move-object p0, v0

    .line 368
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 369
    .line 370
    .line 371
    goto :goto_5

    .line 372
    :cond_7
    invoke-static {}, Lx1/O;->Z3()V

    .line 373
    .line 374
    .line 375
    :cond_8
    :goto_5
    return-void
.end method

.method private static n(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 49

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "recoverFavorite start"

    .line 4
    .line 5
    const-string v2, "ZBackupRecoverData"

    .line 6
    .line 7
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    new-instance v3, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v4, Ljava/util/HashMap;

    .line 16
    .line 17
    const/16 v0, 0xa

    .line 18
    .line 19
    invoke-direct {v4, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 20
    .line 21
    .line 22
    const-string v0, "workspaceScreens"

    .line 23
    .line 24
    move-object/from16 v5, p1

    .line 25
    .line 26
    invoke-static {v5, v0}, Lcom/android/launcher3/R6;->k(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-string v13, "_id"

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    const/4 v11, 0x0

    .line 35
    const/4 v12, 0x0

    .line 36
    const-string v6, "workspaceScreens"

    .line 37
    .line 38
    const/4 v7, 0x0

    .line 39
    const/4 v8, 0x0

    .line 40
    const/4 v9, 0x0

    .line 41
    const/4 v10, 0x0

    .line 42
    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    invoke-interface {v6, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const-string v5, "screenRank"

    .line 51
    .line 52
    invoke-interface {v6, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    :goto_0
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    .line 57
    .line 58
    .line 59
    move-result v7

    .line 60
    if-eqz v7, :cond_0

    .line 61
    .line 62
    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 63
    .line 64
    .line 65
    move-result-wide v7

    .line 66
    invoke-interface {v6, v5}, Landroid/database/Cursor;->getLong(I)J

    .line 67
    .line 68
    .line 69
    move-result-wide v9

    .line 70
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    invoke-virtual {v4, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :catchall_0
    move-exception v0

    .line 83
    goto :goto_3

    .line 84
    :catch_0
    move-exception v0

    .line 85
    goto :goto_2

    .line 86
    :cond_0
    :goto_1
    invoke-static {v6}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 87
    .line 88
    .line 89
    goto :goto_4

    .line 90
    :goto_2
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :goto_3
    invoke-static {v6}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 95
    .line 96
    .line 97
    throw v0

    .line 98
    :cond_1
    :goto_4
    sget-object v6, Lcom/android/launcher3/R6$b;->a:Ljava/lang/String;

    .line 99
    .line 100
    const/4 v11, 0x0

    .line 101
    const/4 v12, 0x0

    .line 102
    const/4 v7, 0x0

    .line 103
    const/4 v8, 0x0

    .line 104
    const/4 v9, 0x0

    .line 105
    const/4 v10, 0x0

    .line 106
    move-object/from16 v5, p1

    .line 107
    .line 108
    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    const/4 v6, 0x0

    .line 113
    if-nez v5, :cond_2

    .line 114
    .line 115
    return v6

    .line 116
    :cond_2
    new-instance v7, Ljava/util/HashMap;

    .line 117
    .line 118
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 119
    .line 120
    .line 121
    const-string v0, "cn.nubia.contacts/.DialerActivity"

    .line 122
    .line 123
    const-string v8, "com.android.contacts;com.android.contacts.activities.DialtactsActivity"

    .line 124
    .line 125
    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    const-string v0, "cn.nubia.contacts/.mainlist.PeopleActivity"

    .line 129
    .line 130
    const-string v8, "com.android.contacts;com.android.contacts.activities.PeopleActivity"

    .line 131
    .line 132
    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    const-string v0, "cn.nubia.mms/.tab.MmsMainActivity"

    .line 136
    .line 137
    const-string v8, "com.android.messaging;com.android.messaging.ui.conversationlist.ConversationListActivity"

    .line 138
    .line 139
    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    const-string v0, "cn.nubia.calculator2.preset/cn.nubia.calculator2.Calculator"

    .line 143
    .line 144
    const-string v8, "com.android.calculator2;com.android.calculator2.Calculator"

    .line 145
    .line 146
    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    const-string v0, "cn.nubia.soundrecorder.preset/cn.nubia.soundrecorder.ui.RecordingActivity"

    .line 150
    .line 151
    const-string v9, "cn.zte.recorder;cn.zte.recorder.RecordHomeActivity"

    .line 152
    .line 153
    invoke-virtual {v7, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    const-string v0, "cn.nubia.security2/cn.nubia.security.NubiaSecurity"

    .line 157
    .line 158
    const-string v9, "com.zte.heartyservice;com.zte.heartyservice.main.HeartServiceActivityLauncher"

    .line 159
    .line 160
    invoke-virtual {v7, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    const-string v0, "cn.nubia.voiceassist/.LauncherActivity"

    .line 164
    .line 165
    const-string v9, "com.zte.halo.app;com.zte.halo.app.help.VoiceSettings"

    .line 166
    .line 167
    invoke-virtual {v7, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    const-string v0, "cn.nubia.calendar.preset/cn.nubia.calendar.AllInOneActivity"

    .line 171
    .line 172
    const-string v10, "com.android.calendar;com.android.calendar.AllInOneActivity"

    .line 173
    .line 174
    invoke-virtual {v7, v0, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    const-string v0, "cn.nubia.deskclock.preset/cn.nubia.deskclock.DeskClock"

    .line 178
    .line 179
    const-string v11, "zte.com.cn.alarmclock;zte.com.cn.alarmclock.activity.AlarmClockActivity"

    .line 180
    .line 181
    invoke-virtual {v7, v0, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    const-string v0, "cn.nubia.myfile/.CategoryActivity"

    .line 185
    .line 186
    const-string v12, "zte.com.cn.filer;zte.com.cn.filer.FileMgrActivity"

    .line 187
    .line 188
    invoke-virtual {v7, v0, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    const-string v0, "cn.nubia.weather/.ui.activity.MainActivity"

    .line 192
    .line 193
    const-string v14, "com.zte.mifavor.weather;com.zte.mifavor.weather.adver.SplashActivity"

    .line 194
    .line 195
    invoke-virtual {v7, v0, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    const-string v0, "cn.nubia.gallery3d/.app.Gallery"

    .line 199
    .line 200
    const-string v15, "com.android.gallery3d;com.zte.gallery3d.activity.launcher.MainGallery"

    .line 201
    .line 202
    invoke-virtual {v7, v0, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    const-string v0, "cn.nubia.deskclock.preset/zte.com.cn.alarmclock.activity.AlarmClockActivity"

    .line 206
    .line 207
    invoke-virtual {v7, v0, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    const-string v0, "cn.nubia.thememanager/.ui.activity.MainActivity"

    .line 211
    .line 212
    const-string v11, "com.zte.beautify;com.zte.beautify.view.beauty.splashscreen.LogoActivity"

    .line 213
    .line 214
    invoke-virtual {v7, v0, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    const-string v0, "cn.nubia.calendar.preset/com.android.calendar.AllInOneActivity"

    .line 218
    .line 219
    invoke-virtual {v7, v0, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    const-string v0, "cn.nubia.weather/com.zte.mifavor.weather.adver.SplashActivity"

    .line 223
    .line 224
    invoke-virtual {v7, v0, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    const-string v0, "cn.nubia.myfile/zte.com.cn.filer.FileMgrActivity"

    .line 228
    .line 229
    invoke-virtual {v7, v0, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    const-string v0, "cn.nubia.calculator2.preset/com.android.calculator2.Calculator"

    .line 233
    .line 234
    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    const-string v0, "cn.nubia.voiceassist.new/com.zte.halo.app.help.VoiceSettings"

    .line 238
    .line 239
    invoke-virtual {v7, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    const-string v0, "cn.nubia.redmagickyi/.shortcut.LauncherActivity"

    .line 243
    .line 244
    const-string v8, "cn.nubia.redmagickyi;cn.nubia.redmagickyi.guide.activity.RedmagicStartActivity"

    .line 245
    .line 246
    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    new-instance v8, Ljava/util/HashMap;

    .line 250
    .line 251
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 252
    .line 253
    .line 254
    const-string v0, "cn.nubia.calendar.preset/com.android.calendar.widget.CalendarAppWidgetProvider"

    .line 255
    .line 256
    const-string v9, "com.android.calendar/com.android.calendar.widget.CalendarAppWidgetProvider"

    .line 257
    .line 258
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    const-string v0, "cn.nubia.calendar.preset/com.android.calendar.widget.Agenda3x3WidgetProvider"

    .line 262
    .line 263
    const-string v9, "com.android.calendar/com.android.calendar.widget.Agenda3x3WidgetProvider"

    .line 264
    .line 265
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    const-string v0, "cn.nubia.calendar.preset/com.android.calendar.widget.widget4x2.AgendaMonth4x2WidgetProvider"

    .line 269
    .line 270
    const-string v9, "com.android.calendar/com.android.calendar.widget.widget4x2.AgendaMonth4x2WidgetProvider"

    .line 271
    .line 272
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    const-string v0, "cn.nubia.calendar.preset/com.android.calendar.widget.CalendarWidget"

    .line 276
    .line 277
    const-string v9, "com.android.calendar/com.android.calendar.widget.CalendarWidget"

    .line 278
    .line 279
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    const-string v0, "cn.nubia.deskclock.preset/zte.com.cn.alarmappwidget.ZteAlarmWidget"

    .line 283
    .line 284
    const-string v9, "zte.com.cn.alarmclock/zte.com.cn.alarmappwidget.ZteAlarmWidget"

    .line 285
    .line 286
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    const-string v0, "cn.nubia.deskclock.preset/zte.com.cn.alarmappwidget.HorizontalAlarmWidget"

    .line 290
    .line 291
    const-string v9, "zte.com.cn.alarmclock/zte.com.cn.alarmappwidget.HorizontalAlarmWidget"

    .line 292
    .line 293
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    const-string v0, "cn.nubia.deskclock.preset/zte.com.cn.alarmappwidget.MyOSAlarmWidget"

    .line 297
    .line 298
    const-string v9, "zte.com.cn.alarmclock/zte.com.cn.alarmappwidget.MyOSAlarmWidget"

    .line 299
    .line 300
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    const-string v0, "cn.nubia.weather/com.zte.mifavor.weather.widget.launcher.SimpleWeatherAppWidgetProvider"

    .line 304
    .line 305
    const-string v9, "com.zte.mifavor.weather/com.zte.mifavor.weather.widget.launcher.SimpleWeatherAppWidgetProvider"

    .line 306
    .line 307
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    const-string v0, "cn.nubia.weather/com.zte.mifavor.weather.widget.launcher.WeatherAppWidgetProvider"

    .line 311
    .line 312
    const-string v9, "com.zte.mifavor.weather/com.zte.mifavor.weather.widget.launcher.WeatherAppWidgetProvider"

    .line 313
    .line 314
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    const-string v0, "cn.nubia.weather/com.zte.mifavor.weather.widget.launcher.DefaultWeatherAppWidgetProvider"

    .line 318
    .line 319
    const-string v9, "com.zte.mifavor.weather/com.zte.mifavor.weather.widget.launcher.DefaultWeatherAppRedMagicWidgetProvider"

    .line 320
    .line 321
    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    move-result v9

    .line 328
    const-string v10, "title"

    .line 329
    .line 330
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 331
    .line 332
    .line 333
    move-result v11

    .line 334
    const-string v0, "titleResName"

    .line 335
    .line 336
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 337
    .line 338
    .line 339
    move-result v12

    .line 340
    const-string v14, "intent"

    .line 341
    .line 342
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 343
    .line 344
    .line 345
    move-result v15

    .line 346
    const-string v6, "container"

    .line 347
    .line 348
    move-object/from16 v16, v8

    .line 349
    .line 350
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 351
    .line 352
    .line 353
    move-result v8

    .line 354
    move-object/from16 v17, v3

    .line 355
    .line 356
    const-string v3, "screen"

    .line 357
    .line 358
    move-object/from16 v18, v7

    .line 359
    .line 360
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 361
    .line 362
    .line 363
    move-result v7

    .line 364
    move-object/from16 v19, v10

    .line 365
    .line 366
    const-string v10, "cellX"

    .line 367
    .line 368
    move/from16 v20, v12

    .line 369
    .line 370
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 371
    .line 372
    .line 373
    move-result v12

    .line 374
    move-object/from16 v21, v2

    .line 375
    .line 376
    const-string v2, "cellY"

    .line 377
    .line 378
    move-object/from16 v22, v3

    .line 379
    .line 380
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 381
    .line 382
    .line 383
    move-result v3

    .line 384
    move-object/from16 v23, v4

    .line 385
    .line 386
    const-string v4, "spanX"

    .line 387
    .line 388
    move-object/from16 v24, v2

    .line 389
    .line 390
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 391
    .line 392
    .line 393
    move-result v2

    .line 394
    move-object/from16 v25, v4

    .line 395
    .line 396
    const-string v4, "spanY"

    .line 397
    .line 398
    move/from16 v26, v2

    .line 399
    .line 400
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 401
    .line 402
    .line 403
    move-result v2

    .line 404
    move-object/from16 v27, v4

    .line 405
    .line 406
    const-string v4, "itemType"

    .line 407
    .line 408
    move-object/from16 v28, v10

    .line 409
    .line 410
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 411
    .line 412
    .line 413
    move-result v10

    .line 414
    move-object/from16 v29, v4

    .line 415
    .line 416
    const-string v4, "appWidgetId"

    .line 417
    .line 418
    move/from16 v30, v12

    .line 419
    .line 420
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 421
    .line 422
    .line 423
    move-result v12

    .line 424
    const-string v0, "icon"

    .line 425
    .line 426
    move-object/from16 v31, v4

    .line 427
    .line 428
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 429
    .line 430
    .line 431
    move-result v4

    .line 432
    move/from16 v32, v4

    .line 433
    .line 434
    const-string v4, "appWidgetProvider"

    .line 435
    .line 436
    move/from16 v33, v12

    .line 437
    .line 438
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 439
    .line 440
    .line 441
    move-result v12

    .line 442
    const-string v0, "modified"

    .line 443
    .line 444
    move-object/from16 v34, v4

    .line 445
    .line 446
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 447
    .line 448
    .line 449
    move-result v4

    .line 450
    move/from16 v35, v4

    .line 451
    .line 452
    const-string v4, "restored"

    .line 453
    .line 454
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 455
    .line 456
    .line 457
    const-string v0, "profileId"

    .line 458
    .line 459
    move-object/from16 v36, v4

    .line 460
    .line 461
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 462
    .line 463
    .line 464
    move-result v4

    .line 465
    move/from16 v37, v4

    .line 466
    .line 467
    :try_start_2
    invoke-static {v1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-virtual {v0, v1}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 476
    .line 477
    .line 478
    move-result-object v4

    .line 479
    :goto_5
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 480
    .line 481
    .line 482
    move-result v0

    .line 483
    if-eqz v0, :cond_1c

    .line 484
    .line 485
    new-instance v1, Landroid/content/ContentValues;

    .line 486
    .line 487
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 488
    .line 489
    .line 490
    move-object/from16 v39, v6

    .line 491
    .line 492
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 493
    .line 494
    .line 495
    move-result v6

    .line 496
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 497
    .line 498
    .line 499
    move-result v0

    .line 500
    move/from16 v40, v9

    .line 501
    .line 502
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v9

    .line 506
    move/from16 v41, v10

    .line 507
    .line 508
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v10

    .line 512
    move/from16 v42, v11

    .line 513
    .line 514
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v11

    .line 518
    move/from16 v43, v12

    .line 519
    .line 520
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 521
    .line 522
    .line 523
    move-result v12

    .line 524
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getLong(I)J

    .line 525
    .line 526
    .line 527
    move-result-wide v44

    .line 528
    if-eqz v4, :cond_4

    .line 529
    .line 530
    move/from16 v46, v7

    .line 531
    .line 532
    iget v7, v4, Landroid/graphics/Point;->x:I

    .line 533
    .line 534
    if-lez v7, :cond_3

    .line 535
    .line 536
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 537
    .line 538
    .line 539
    move-result v7

    .line 540
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 541
    .line 542
    .line 543
    move-result v47

    .line 544
    add-int v7, v7, v47

    .line 545
    .line 546
    move/from16 v47, v8

    .line 547
    .line 548
    iget v8, v4, Landroid/graphics/Point;->x:I

    .line 549
    .line 550
    if-le v7, v8, :cond_5

    .line 551
    .line 552
    move-object/from16 v1, p0

    .line 553
    .line 554
    move-object/from16 v6, v39

    .line 555
    .line 556
    move/from16 v9, v40

    .line 557
    .line 558
    move/from16 v10, v41

    .line 559
    .line 560
    move/from16 v11, v42

    .line 561
    .line 562
    move/from16 v12, v43

    .line 563
    .line 564
    move/from16 v7, v46

    .line 565
    .line 566
    move/from16 v8, v47

    .line 567
    .line 568
    goto :goto_5

    .line 569
    :catchall_1
    move-exception v0

    .line 570
    move-object/from16 v2, v17

    .line 571
    .line 572
    goto/16 :goto_19

    .line 573
    .line 574
    :catch_1
    move-exception v0

    .line 575
    move-object/from16 v2, v17

    .line 576
    .line 577
    goto/16 :goto_17

    .line 578
    .line 579
    :cond_3
    :goto_6
    move/from16 v47, v8

    .line 580
    .line 581
    goto :goto_7

    .line 582
    :cond_4
    move/from16 v46, v7

    .line 583
    .line 584
    goto :goto_6

    .line 585
    :cond_5
    :goto_7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 586
    .line 587
    .line 588
    move-result-object v7

    .line 589
    invoke-virtual {v1, v13, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 590
    .line 591
    .line 592
    invoke-virtual {v1, v14, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    .line 594
    .line 595
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 596
    .line 597
    .line 598
    move-result-object v7

    .line 599
    move-object/from16 v8, v39

    .line 600
    .line 601
    invoke-virtual {v1, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 602
    .line 603
    .line 604
    move/from16 v7, v30

    .line 605
    .line 606
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 607
    .line 608
    .line 609
    move-result v30

    .line 610
    move-object/from16 v39, v4

    .line 611
    .line 612
    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 613
    .line 614
    .line 615
    move-result-object v4

    .line 616
    move/from16 v30, v7

    .line 617
    .line 618
    move-object/from16 v7, v28

    .line 619
    .line 620
    invoke-virtual {v1, v7, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 621
    .line 622
    .line 623
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 624
    .line 625
    .line 626
    move-result v4

    .line 627
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 628
    .line 629
    .line 630
    move-result-object v4

    .line 631
    move/from16 v28, v3

    .line 632
    .line 633
    move-object/from16 v3, v24

    .line 634
    .line 635
    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 636
    .line 637
    .line 638
    move/from16 v4, v26

    .line 639
    .line 640
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 641
    .line 642
    .line 643
    move-result v24

    .line 644
    move-object/from16 v26, v3

    .line 645
    .line 646
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 647
    .line 648
    .line 649
    move-result-object v3

    .line 650
    move/from16 v24, v4

    .line 651
    .line 652
    move-object/from16 v4, v25

    .line 653
    .line 654
    invoke-virtual {v1, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 655
    .line 656
    .line 657
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 658
    .line 659
    .line 660
    move-result v3

    .line 661
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 662
    .line 663
    .line 664
    move-result-object v3

    .line 665
    move/from16 v25, v2

    .line 666
    .line 667
    move-object/from16 v2, v27

    .line 668
    .line 669
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 670
    .line 671
    .line 672
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 673
    .line 674
    .line 675
    move-result-object v3

    .line 676
    move-object/from16 v27, v2

    .line 677
    .line 678
    move-object/from16 v2, v29

    .line 679
    .line 680
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 681
    .line 682
    .line 683
    move/from16 v3, v33

    .line 684
    .line 685
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 686
    .line 687
    .line 688
    move-result v29

    .line 689
    move/from16 v33, v3

    .line 690
    .line 691
    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 692
    .line 693
    .line 694
    move-result-object v3

    .line 695
    move-object/from16 v29, v4

    .line 696
    .line 697
    move-object/from16 v4, v31

    .line 698
    .line 699
    invoke-virtual {v1, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 700
    .line 701
    .line 702
    const-string v3, "icon"

    .line 703
    .line 704
    move-object/from16 v31, v7

    .line 705
    .line 706
    move/from16 v7, v32

    .line 707
    .line 708
    move-object/from16 v32, v8

    .line 709
    .line 710
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getBlob(I)[B

    .line 711
    .line 712
    .line 713
    move-result-object v8

    .line 714
    invoke-virtual {v1, v3, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 715
    .line 716
    .line 717
    move-object/from16 v3, v34

    .line 718
    .line 719
    invoke-virtual {v1, v3, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    .line 721
    .line 722
    const-string v8, "modified"

    .line 723
    .line 724
    move/from16 v34, v7

    .line 725
    .line 726
    move/from16 v7, v35

    .line 727
    .line 728
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 729
    .line 730
    .line 731
    move-result v35

    .line 732
    move/from16 v48, v7

    .line 733
    .line 734
    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 735
    .line 736
    .line 737
    move-result-object v7

    .line 738
    invoke-virtual {v1, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 739
    .line 740
    .line 741
    const-string v7, "profileId"

    .line 742
    .line 743
    move/from16 v8, v37

    .line 744
    .line 745
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 746
    .line 747
    .line 748
    move-result v35

    .line 749
    move-object/from16 v37, v13

    .line 750
    .line 751
    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 752
    .line 753
    .line 754
    move-result-object v13

    .line 755
    invoke-virtual {v1, v7, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 756
    .line 757
    .line 758
    const/16 v7, -0x64

    .line 759
    .line 760
    if-ne v12, v7, :cond_7

    .line 761
    .line 762
    invoke-virtual/range {v23 .. v23}, Ljava/util/HashMap;->size()I

    .line 763
    .line 764
    .line 765
    move-result v7

    .line 766
    if-lez v7, :cond_7

    .line 767
    .line 768
    invoke-static/range {v44 .. v45}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 769
    .line 770
    .line 771
    move-result-object v7

    .line 772
    move-object/from16 v12, v23

    .line 773
    .line 774
    invoke-virtual {v12, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 775
    .line 776
    .line 777
    move-result-object v7

    .line 778
    if-eqz v7, :cond_6

    .line 779
    .line 780
    invoke-static/range {v44 .. v45}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 781
    .line 782
    .line 783
    move-result-object v7

    .line 784
    invoke-virtual {v12, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 785
    .line 786
    .line 787
    move-result-object v7

    .line 788
    check-cast v7, Ljava/lang/Long;

    .line 789
    .line 790
    move-object/from16 v13, v22

    .line 791
    .line 792
    invoke-virtual {v1, v13, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 793
    .line 794
    .line 795
    goto :goto_9

    .line 796
    :cond_6
    move-object/from16 v13, v22

    .line 797
    .line 798
    goto :goto_8

    .line 799
    :cond_7
    move-object/from16 v13, v22

    .line 800
    .line 801
    move-object/from16 v12, v23

    .line 802
    .line 803
    :goto_8
    invoke-static/range {v44 .. v45}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 804
    .line 805
    .line 806
    move-result-object v7

    .line 807
    invoke-virtual {v1, v13, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 808
    .line 809
    .line 810
    :goto_9
    const/4 v7, 0x2

    .line 811
    if-ne v6, v7, :cond_9

    .line 812
    .line 813
    new-instance v7, Ljava/lang/StringBuilder;

    .line 814
    .line 815
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 816
    .line 817
    .line 818
    move-object/from16 v23, v12

    .line 819
    .line 820
    const-string v12, "recoverFavorite: folder.title "

    .line 821
    .line 822
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 823
    .line 824
    .line 825
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 826
    .line 827
    .line 828
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 829
    .line 830
    .line 831
    move-result-object v7

    .line 832
    move-object/from16 v12, v21

    .line 833
    .line 834
    invoke-static {v12, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 835
    .line 836
    .line 837
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 838
    .line 839
    .line 840
    move-result-object v7

    .line 841
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 842
    .line 843
    .line 844
    move-result-object v7

    .line 845
    move-object/from16 v22, v13

    .line 846
    .line 847
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 848
    .line 849
    .line 850
    move-result-object v13

    .line 851
    move/from16 v21, v15

    .line 852
    .line 853
    const/4 v15, 0x0

    .line 854
    invoke-virtual {v7, v0, v15, v13}, Lcom/android/launcher3/H5;->p1(IILjava/lang/String;)V

    .line 855
    .line 856
    .line 857
    move/from16 v7, v20

    .line 858
    .line 859
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 860
    .line 861
    .line 862
    move-result-object v13

    .line 863
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 864
    .line 865
    .line 866
    move-result-object v15

    .line 867
    move/from16 v20, v7

    .line 868
    .line 869
    const-string v7, "folder_life_funs"

    .line 870
    .line 871
    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 872
    .line 873
    .line 874
    move-result v7

    .line 875
    if-eqz v7, :cond_8

    .line 876
    .line 877
    invoke-interface {v15}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 878
    .line 879
    .line 880
    move-result-object v7

    .line 881
    new-instance v13, Ljava/lang/StringBuilder;

    .line 882
    .line 883
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 884
    .line 885
    .line 886
    const-string v15, "CloudFolder-"

    .line 887
    .line 888
    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 889
    .line 890
    .line 891
    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 892
    .line 893
    .line 894
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 895
    .line 896
    .line 897
    move-result-object v0

    .line 898
    const/4 v13, 0x3

    .line 899
    invoke-interface {v7, v0, v13}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 900
    .line 901
    .line 902
    move-result-object v0

    .line 903
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 904
    .line 905
    .line 906
    goto :goto_a

    .line 907
    :cond_8
    const-string v7, "folder_social_news"

    .line 908
    .line 909
    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 910
    .line 911
    .line 912
    move-result v7

    .line 913
    if-eqz v7, :cond_a

    .line 914
    .line 915
    invoke-interface {v15}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 916
    .line 917
    .line 918
    move-result-object v7

    .line 919
    new-instance v13, Ljava/lang/StringBuilder;

    .line 920
    .line 921
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 922
    .line 923
    .line 924
    const-string v15, "CloudFolder-"

    .line 925
    .line 926
    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 927
    .line 928
    .line 929
    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 930
    .line 931
    .line 932
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 933
    .line 934
    .line 935
    move-result-object v0

    .line 936
    const/4 v13, 0x1

    .line 937
    invoke-interface {v7, v0, v13}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 938
    .line 939
    .line 940
    move-result-object v0

    .line 941
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 942
    .line 943
    .line 944
    goto :goto_a

    .line 945
    :cond_9
    move-object/from16 v23, v12

    .line 946
    .line 947
    move-object/from16 v22, v13

    .line 948
    .line 949
    move-object/from16 v12, v21

    .line 950
    .line 951
    move/from16 v21, v15

    .line 952
    .line 953
    :cond_a
    :goto_a
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 954
    .line 955
    .line 956
    move-result v0

    .line 957
    if-nez v0, :cond_b

    .line 958
    .line 959
    move-object/from16 v7, v19

    .line 960
    .line 961
    invoke-virtual {v1, v7, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 962
    .line 963
    .line 964
    goto :goto_b

    .line 965
    :cond_b
    move-object/from16 v7, v19

    .line 966
    .line 967
    const-string v0, ""

    .line 968
    .line 969
    invoke-virtual {v1, v7, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 970
    .line 971
    .line 972
    :goto_b
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 973
    .line 974
    .line 975
    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 976
    if-nez v0, :cond_14

    .line 977
    .line 978
    const/4 v15, 0x0

    .line 979
    :try_start_3
    invoke-static {v10, v15}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 980
    .line 981
    .line 982
    move-result-object v0
    :try_end_3
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 983
    goto :goto_c

    .line 984
    :catch_2
    move-exception v0

    .line 985
    :try_start_4
    invoke-virtual {v0}, Ljava/net/URISyntaxException;->printStackTrace()V

    .line 986
    .line 987
    .line 988
    const/4 v0, 0x0

    .line 989
    :goto_c
    if-nez v6, :cond_c

    .line 990
    .line 991
    if-eqz v0, :cond_c

    .line 992
    .line 993
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 994
    .line 995
    .line 996
    move-result-object v9

    .line 997
    if-eqz v9, :cond_c

    .line 998
    .line 999
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1000
    .line 1001
    .line 1002
    move-result-object v9

    .line 1003
    invoke-virtual {v9}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 1004
    .line 1005
    .line 1006
    move-result-object v9

    .line 1007
    move-object/from16 v13, v18

    .line 1008
    .line 1009
    invoke-virtual {v13, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 1010
    .line 1011
    .line 1012
    move-result v9

    .line 1013
    if-eqz v9, :cond_d

    .line 1014
    .line 1015
    new-instance v9, Ljava/lang/StringBuilder;

    .line 1016
    .line 1017
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 1018
    .line 1019
    .line 1020
    const-string v10, "recoverFavorite intent before: "

    .line 1021
    .line 1022
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1023
    .line 1024
    .line 1025
    const/4 v15, 0x0

    .line 1026
    invoke-virtual {v0, v15}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 1027
    .line 1028
    .line 1029
    move-result-object v10

    .line 1030
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1031
    .line 1032
    .line 1033
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1034
    .line 1035
    .line 1036
    move-result-object v9

    .line 1037
    invoke-static {v12, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1038
    .line 1039
    .line 1040
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1041
    .line 1042
    .line 1043
    move-result-object v9

    .line 1044
    invoke-virtual {v9}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 1045
    .line 1046
    .line 1047
    move-result-object v9

    .line 1048
    invoke-virtual {v13, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1049
    .line 1050
    .line 1051
    move-result-object v9

    .line 1052
    check-cast v9, Ljava/lang/String;

    .line 1053
    .line 1054
    const-string v10, ";"

    .line 1055
    .line 1056
    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v9

    .line 1060
    new-instance v10, Landroid/content/ComponentName;

    .line 1061
    .line 1062
    const/16 p1, 0x0

    .line 1063
    .line 1064
    aget-object v15, v9, p1

    .line 1065
    .line 1066
    const/16 v38, 0x1

    .line 1067
    .line 1068
    aget-object v9, v9, v38

    .line 1069
    .line 1070
    invoke-direct {v10, v15, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1071
    .line 1072
    .line 1073
    invoke-virtual {v0, v10}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1074
    .line 1075
    .line 1076
    new-instance v9, Ljava/lang/StringBuilder;

    .line 1077
    .line 1078
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 1079
    .line 1080
    .line 1081
    const-string v10, "recoverFavorite intent after: "

    .line 1082
    .line 1083
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1084
    .line 1085
    .line 1086
    const/4 v15, 0x0

    .line 1087
    invoke-virtual {v0, v15}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 1088
    .line 1089
    .line 1090
    move-result-object v10

    .line 1091
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1092
    .line 1093
    .line 1094
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v9

    .line 1098
    invoke-static {v12, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1099
    .line 1100
    .line 1101
    invoke-virtual {v0, v15}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 1102
    .line 1103
    .line 1104
    move-result-object v0

    .line 1105
    invoke-virtual {v1, v14, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1106
    .line 1107
    .line 1108
    :goto_d
    move-object/from16 v9, p0

    .line 1109
    .line 1110
    move-object/from16 v19, v2

    .line 1111
    .line 1112
    goto/16 :goto_10

    .line 1113
    .line 1114
    :cond_c
    move-object/from16 v13, v18

    .line 1115
    .line 1116
    :cond_d
    const/4 v9, 0x6

    .line 1117
    if-eq v6, v9, :cond_e

    .line 1118
    .line 1119
    const/4 v9, 0x1

    .line 1120
    if-ne v6, v9, :cond_f

    .line 1121
    .line 1122
    :cond_e
    if-eqz v0, :cond_f

    .line 1123
    .line 1124
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1125
    .line 1126
    .line 1127
    move-result-object v9

    .line 1128
    if-eqz v9, :cond_f

    .line 1129
    .line 1130
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1131
    .line 1132
    .line 1133
    move-result-object v9

    .line 1134
    invoke-virtual {v9}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1135
    .line 1136
    .line 1137
    move-result-object v9

    .line 1138
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1139
    .line 1140
    .line 1141
    move-result v9

    .line 1142
    if-nez v9, :cond_f

    .line 1143
    .line 1144
    const-string v9, "cn.nubia.redmagickyi"

    .line 1145
    .line 1146
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1147
    .line 1148
    .line 1149
    move-result-object v15

    .line 1150
    invoke-virtual {v15}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1151
    .line 1152
    .line 1153
    move-result-object v15

    .line 1154
    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1155
    .line 1156
    .line 1157
    move-result v9

    .line 1158
    if-eqz v9, :cond_f

    .line 1159
    .line 1160
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1161
    .line 1162
    .line 1163
    move-result-object v9

    .line 1164
    invoke-virtual {v9}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 1165
    .line 1166
    .line 1167
    move-result-object v9

    .line 1168
    invoke-virtual {v13, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 1169
    .line 1170
    .line 1171
    move-result v9

    .line 1172
    if-eqz v9, :cond_f

    .line 1173
    .line 1174
    new-instance v9, Ljava/lang/StringBuilder;

    .line 1175
    .line 1176
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 1177
    .line 1178
    .line 1179
    const-string v10, "recoverFavorite ITEM_TYPE_DEEP_SHORTCUT intent before: "

    .line 1180
    .line 1181
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1182
    .line 1183
    .line 1184
    const/4 v15, 0x0

    .line 1185
    invoke-virtual {v0, v15}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 1186
    .line 1187
    .line 1188
    move-result-object v10

    .line 1189
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1190
    .line 1191
    .line 1192
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1193
    .line 1194
    .line 1195
    move-result-object v9

    .line 1196
    invoke-static {v12, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1197
    .line 1198
    .line 1199
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1200
    .line 1201
    .line 1202
    move-result-object v0

    .line 1203
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 1204
    .line 1205
    .line 1206
    move-result-object v0

    .line 1207
    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1208
    .line 1209
    .line 1210
    move-result-object v0

    .line 1211
    check-cast v0, Ljava/lang/String;

    .line 1212
    .line 1213
    const-string v9, ";"

    .line 1214
    .line 1215
    invoke-virtual {v0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 1216
    .line 1217
    .line 1218
    move-result-object v0

    .line 1219
    new-instance v9, Landroid/content/Intent;

    .line 1220
    .line 1221
    invoke-direct {v9}, Landroid/content/Intent;-><init>()V

    .line 1222
    .line 1223
    .line 1224
    const-string v10, "android.intent.action.MAIN"

    .line 1225
    .line 1226
    invoke-virtual {v9, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1227
    .line 1228
    .line 1229
    const-string v10, "android.intent.category.LAUNCHER"

    .line 1230
    .line 1231
    invoke-virtual {v9, v10}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1232
    .line 1233
    .line 1234
    const/high16 v10, 0x10200000

    .line 1235
    .line 1236
    invoke-virtual {v9, v10}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1237
    .line 1238
    .line 1239
    new-instance v10, Landroid/content/ComponentName;

    .line 1240
    .line 1241
    const/16 p1, 0x0

    .line 1242
    .line 1243
    aget-object v15, v0, p1

    .line 1244
    .line 1245
    const/16 v38, 0x1

    .line 1246
    .line 1247
    aget-object v0, v0, v38

    .line 1248
    .line 1249
    invoke-direct {v10, v15, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1250
    .line 1251
    .line 1252
    invoke-virtual {v9, v10}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1253
    .line 1254
    .line 1255
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1256
    .line 1257
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1258
    .line 1259
    .line 1260
    const-string v10, "recoverFavorite ITEM_TYPE_APPLICATION newIntent after: "

    .line 1261
    .line 1262
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1263
    .line 1264
    .line 1265
    const/4 v15, 0x0

    .line 1266
    invoke-virtual {v9, v15}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 1267
    .line 1268
    .line 1269
    move-result-object v10

    .line 1270
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1271
    .line 1272
    .line 1273
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1274
    .line 1275
    .line 1276
    move-result-object v0

    .line 1277
    invoke-static {v12, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1278
    .line 1279
    .line 1280
    invoke-virtual {v9, v15}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 1281
    .line 1282
    .line 1283
    move-result-object v0

    .line 1284
    invoke-virtual {v1, v14, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1285
    .line 1286
    .line 1287
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1288
    .line 1289
    .line 1290
    move-result-object v0

    .line 1291
    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1292
    .line 1293
    .line 1294
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/InstallShortcutReceiver;->h(Landroid/content/Context;)V

    .line 1295
    .line 1296
    .line 1297
    goto/16 :goto_d

    .line 1298
    .line 1299
    :cond_f
    if-nez v6, :cond_11

    .line 1300
    .line 1301
    if-eqz v0, :cond_11

    .line 1302
    .line 1303
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1304
    .line 1305
    .line 1306
    move-result-object v9

    .line 1307
    if-eqz v9, :cond_11

    .line 1308
    .line 1309
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1310
    .line 1311
    .line 1312
    move-result-object v9

    .line 1313
    invoke-virtual {v9}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1314
    .line 1315
    .line 1316
    move-result-object v9

    .line 1317
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1318
    .line 1319
    .line 1320
    move-result v9

    .line 1321
    if-nez v9, :cond_11

    .line 1322
    .line 1323
    const-string v9, "cn.nubia.gamelauncher"

    .line 1324
    .line 1325
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1326
    .line 1327
    .line 1328
    move-result-object v15

    .line 1329
    invoke-virtual {v15}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1330
    .line 1331
    .line 1332
    move-result-object v15

    .line 1333
    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1334
    .line 1335
    .line 1336
    move-result v9

    .line 1337
    if-eqz v9, :cond_11

    .line 1338
    .line 1339
    invoke-static {}, Lx1/S;->r()Z

    .line 1340
    .line 1341
    .line 1342
    move-result v0

    .line 1343
    if-eqz v0, :cond_10

    .line 1344
    .line 1345
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 1346
    .line 1347
    .line 1348
    move-result-object v0

    .line 1349
    const-string v1, "game_space_shortcut"

    .line 1350
    .line 1351
    const/4 v15, 0x0

    .line 1352
    invoke-static {v0, v1, v15}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1353
    .line 1354
    .line 1355
    :cond_10
    const/4 v15, 0x0

    .line 1356
    move-object/from16 v9, p0

    .line 1357
    .line 1358
    invoke-static {v9, v15}, Lx1/O;->q5(Landroid/content/Context;Z)V

    .line 1359
    .line 1360
    .line 1361
    const-string v0, "recoverFavorite: GameSpace icon, continue!"

    .line 1362
    .line 1363
    invoke-static {v12, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1364
    .line 1365
    .line 1366
    move-object/from16 v1, v29

    .line 1367
    .line 1368
    move-object/from16 v29, v2

    .line 1369
    .line 1370
    move/from16 v2, v25

    .line 1371
    .line 1372
    move-object/from16 v25, v1

    .line 1373
    .line 1374
    move-object/from16 v1, v26

    .line 1375
    .line 1376
    move/from16 v26, v24

    .line 1377
    .line 1378
    move-object/from16 v24, v1

    .line 1379
    .line 1380
    move-object/from16 v19, v7

    .line 1381
    .line 1382
    move-object v1, v9

    .line 1383
    move-object/from16 v18, v13

    .line 1384
    .line 1385
    move/from16 v15, v21

    .line 1386
    .line 1387
    move-object/from16 v6, v32

    .line 1388
    .line 1389
    move/from16 v32, v34

    .line 1390
    .line 1391
    move-object/from16 v13, v37

    .line 1392
    .line 1393
    move/from16 v9, v40

    .line 1394
    .line 1395
    move/from16 v10, v41

    .line 1396
    .line 1397
    move/from16 v11, v42

    .line 1398
    .line 1399
    move/from16 v7, v46

    .line 1400
    .line 1401
    move/from16 v35, v48

    .line 1402
    .line 1403
    move-object/from16 v34, v3

    .line 1404
    .line 1405
    move/from16 v37, v8

    .line 1406
    .line 1407
    move-object/from16 v21, v12

    .line 1408
    .line 1409
    move/from16 v3, v28

    .line 1410
    .line 1411
    move-object/from16 v28, v31

    .line 1412
    .line 1413
    move/from16 v12, v43

    .line 1414
    .line 1415
    move/from16 v8, v47

    .line 1416
    .line 1417
    move-object/from16 v31, v4

    .line 1418
    .line 1419
    move-object/from16 v4, v39

    .line 1420
    .line 1421
    goto/16 :goto_5

    .line 1422
    .line 1423
    :cond_11
    move-object/from16 v9, p0

    .line 1424
    .line 1425
    const/4 v15, 0x1

    .line 1426
    if-ne v6, v15, :cond_12

    .line 1427
    .line 1428
    if-eqz v0, :cond_12

    .line 1429
    .line 1430
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v15

    .line 1434
    if-eqz v15, :cond_12

    .line 1435
    .line 1436
    const-string v15, "com.android.settings"

    .line 1437
    .line 1438
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1439
    .line 1440
    .line 1441
    move-result-object v18

    .line 1442
    move-object/from16 v19, v2

    .line 1443
    .line 1444
    invoke-virtual/range {v18 .. v18}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1445
    .line 1446
    .line 1447
    move-result-object v2

    .line 1448
    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1449
    .line 1450
    .line 1451
    move-result v2

    .line 1452
    if-eqz v2, :cond_13

    .line 1453
    .line 1454
    const-string v2, "cn.nubia.dualscreen.aod.MainActivity"

    .line 1455
    .line 1456
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1457
    .line 1458
    .line 1459
    move-result-object v0

    .line 1460
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 1461
    .line 1462
    .line 1463
    move-result-object v0

    .line 1464
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1465
    .line 1466
    .line 1467
    move-result v0

    .line 1468
    if-eqz v0, :cond_13

    .line 1469
    .line 1470
    const-string v0, "recoverFavorite: aod.MainActivity shortcut, continue!"

    .line 1471
    .line 1472
    invoke-static {v12, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1473
    .line 1474
    .line 1475
    move-object/from16 v1, v26

    .line 1476
    .line 1477
    move/from16 v26, v24

    .line 1478
    .line 1479
    move-object/from16 v24, v1

    .line 1480
    .line 1481
    :goto_e
    move-object v1, v9

    .line 1482
    :goto_f
    move-object/from16 v18, v13

    .line 1483
    .line 1484
    move/from16 v15, v21

    .line 1485
    .line 1486
    move/from16 v2, v25

    .line 1487
    .line 1488
    move-object/from16 v25, v29

    .line 1489
    .line 1490
    move-object/from16 v6, v32

    .line 1491
    .line 1492
    move/from16 v32, v34

    .line 1493
    .line 1494
    move-object/from16 v13, v37

    .line 1495
    .line 1496
    move/from16 v9, v40

    .line 1497
    .line 1498
    move/from16 v10, v41

    .line 1499
    .line 1500
    move/from16 v11, v42

    .line 1501
    .line 1502
    move/from16 v35, v48

    .line 1503
    .line 1504
    move-object/from16 v34, v3

    .line 1505
    .line 1506
    move/from16 v37, v8

    .line 1507
    .line 1508
    move-object/from16 v21, v12

    .line 1509
    .line 1510
    move-object/from16 v29, v19

    .line 1511
    .line 1512
    move/from16 v3, v28

    .line 1513
    .line 1514
    move-object/from16 v28, v31

    .line 1515
    .line 1516
    move/from16 v12, v43

    .line 1517
    .line 1518
    move/from16 v8, v47

    .line 1519
    .line 1520
    move-object/from16 v31, v4

    .line 1521
    .line 1522
    move-object/from16 v19, v7

    .line 1523
    .line 1524
    move-object/from16 v4, v39

    .line 1525
    .line 1526
    move/from16 v7, v46

    .line 1527
    .line 1528
    goto/16 :goto_5

    .line 1529
    .line 1530
    :cond_12
    move-object/from16 v19, v2

    .line 1531
    .line 1532
    :cond_13
    invoke-virtual {v1, v14, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1533
    .line 1534
    .line 1535
    goto :goto_10

    .line 1536
    :cond_14
    move-object/from16 v9, p0

    .line 1537
    .line 1538
    move-object/from16 v19, v2

    .line 1539
    .line 1540
    move-object/from16 v13, v18

    .line 1541
    .line 1542
    :goto_10
    :try_start_5
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 1543
    .line 1544
    .line 1545
    move-result-object v0

    .line 1546
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 1547
    .line 1548
    .line 1549
    move-result v0

    .line 1550
    if-eqz v0, :cond_16

    .line 1551
    .line 1552
    if-nez v6, :cond_16

    .line 1553
    .line 1554
    invoke-virtual {v1, v14}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 1555
    .line 1556
    .line 1557
    move-result-object v0

    .line 1558
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1559
    .line 1560
    .line 1561
    move-result-object v0

    .line 1562
    const/4 v15, 0x0

    .line 1563
    invoke-static {v0, v15}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1564
    .line 1565
    .line 1566
    move-result-object v0

    .line 1567
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1568
    .line 1569
    .line 1570
    move-result-object v0

    .line 1571
    if-eqz v0, :cond_16

    .line 1572
    .line 1573
    invoke-virtual {v1, v14}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 1574
    .line 1575
    .line 1576
    move-result-object v0

    .line 1577
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1578
    .line 1579
    .line 1580
    move-result-object v0

    .line 1581
    invoke-static {v0, v15}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1582
    .line 1583
    .line 1584
    move-result-object v0

    .line 1585
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1586
    .line 1587
    .line 1588
    move-result-object v0

    .line 1589
    invoke-virtual {v0}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    .line 1590
    .line 1591
    .line 1592
    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1593
    move-object/from16 v2, v17

    .line 1594
    .line 1595
    :try_start_6
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 1596
    .line 1597
    .line 1598
    move-result v0

    .line 1599
    if-eqz v0, :cond_15

    .line 1600
    .line 1601
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 1602
    .line 1603
    .line 1604
    move-result v0

    .line 1605
    invoke-virtual {v1, v14}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 1606
    .line 1607
    .line 1608
    move-result-object v10

    .line 1609
    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1610
    .line 1611
    .line 1612
    move-result-object v10

    .line 1613
    const/4 v15, 0x0

    .line 1614
    invoke-static {v10, v15}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1615
    .line 1616
    .line 1617
    move-result-object v10

    .line 1618
    invoke-virtual {v10}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1619
    .line 1620
    .line 1621
    move-result-object v10

    .line 1622
    invoke-virtual {v10}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    .line 1623
    .line 1624
    .line 1625
    move-result-object v10

    .line 1626
    invoke-virtual {v2, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1627
    .line 1628
    .line 1629
    move-result-object v10

    .line 1630
    check-cast v10, Ljava/lang/Integer;

    .line 1631
    .line 1632
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 1633
    .line 1634
    .line 1635
    move-result v10

    .line 1636
    if-ne v0, v10, :cond_15

    .line 1637
    .line 1638
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1639
    .line 1640
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1641
    .line 1642
    .line 1643
    const-string v10, "recoverFavorite: the icon exit! "

    .line 1644
    .line 1645
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1646
    .line 1647
    .line 1648
    invoke-virtual {v1, v14}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 1649
    .line 1650
    .line 1651
    move-result-object v10

    .line 1652
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1653
    .line 1654
    .line 1655
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1656
    .line 1657
    .line 1658
    move-result-object v0

    .line 1659
    invoke-static {v12, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1660
    .line 1661
    .line 1662
    move-object/from16 v1, v26

    .line 1663
    .line 1664
    move/from16 v26, v24

    .line 1665
    .line 1666
    move-object/from16 v24, v1

    .line 1667
    .line 1668
    move-object/from16 v17, v2

    .line 1669
    .line 1670
    goto/16 :goto_e

    .line 1671
    .line 1672
    :catchall_2
    move-exception v0

    .line 1673
    goto/16 :goto_19

    .line 1674
    .line 1675
    :catch_3
    move-exception v0

    .line 1676
    goto :goto_11

    .line 1677
    :cond_15
    invoke-virtual {v1, v14}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 1678
    .line 1679
    .line 1680
    move-result-object v0

    .line 1681
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1682
    .line 1683
    .line 1684
    move-result-object v0

    .line 1685
    const/4 v15, 0x0

    .line 1686
    invoke-static {v0, v15}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1687
    .line 1688
    .line 1689
    move-result-object v0

    .line 1690
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 1691
    .line 1692
    .line 1693
    move-result-object v0

    .line 1694
    invoke-virtual {v0}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    .line 1695
    .line 1696
    .line 1697
    move-result-object v0

    .line 1698
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 1699
    .line 1700
    .line 1701
    move-result v10

    .line 1702
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1703
    .line 1704
    .line 1705
    move-result-object v10

    .line 1706
    invoke-virtual {v2, v0, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1707
    .line 1708
    .line 1709
    goto :goto_12

    .line 1710
    :catch_4
    move-exception v0

    .line 1711
    move-object/from16 v2, v17

    .line 1712
    .line 1713
    goto :goto_11

    .line 1714
    :cond_16
    move-object/from16 v2, v17

    .line 1715
    .line 1716
    goto :goto_12

    .line 1717
    :goto_11
    :try_start_7
    new-instance v10, Ljava/lang/StringBuilder;

    .line 1718
    .line 1719
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 1720
    .line 1721
    .line 1722
    const-string v15, "restore icon error "

    .line 1723
    .line 1724
    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1725
    .line 1726
    .line 1727
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1728
    .line 1729
    .line 1730
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1731
    .line 1732
    .line 1733
    move-result-object v0

    .line 1734
    invoke-static {v12, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1735
    .line 1736
    .line 1737
    :goto_12
    const/4 v0, 0x4

    .line 1738
    if-eq v6, v0, :cond_17

    .line 1739
    .line 1740
    const/4 v0, 0x5

    .line 1741
    if-ne v6, v0, :cond_18

    .line 1742
    .line 1743
    :cond_17
    move-object/from16 v6, v36

    .line 1744
    .line 1745
    goto :goto_13

    .line 1746
    :cond_18
    const/16 v38, 0x1

    .line 1747
    .line 1748
    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1749
    .line 1750
    .line 1751
    move-result-object v0

    .line 1752
    move-object/from16 v6, v36

    .line 1753
    .line 1754
    invoke-virtual {v1, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1755
    .line 1756
    .line 1757
    move-object/from16 v10, v16

    .line 1758
    .line 1759
    :cond_19
    const/4 v15, 0x0

    .line 1760
    goto :goto_15

    .line 1761
    :catch_5
    move-exception v0

    .line 1762
    goto/16 :goto_17

    .line 1763
    .line 1764
    :goto_13
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1765
    .line 1766
    .line 1767
    move-result v0

    .line 1768
    if-nez v0, :cond_1b

    .line 1769
    .line 1770
    move-object/from16 v10, v16

    .line 1771
    .line 1772
    invoke-virtual {v10, v11}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 1773
    .line 1774
    .line 1775
    move-result v0

    .line 1776
    if-eqz v0, :cond_1a

    .line 1777
    .line 1778
    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1779
    .line 1780
    .line 1781
    move-result-object v0

    .line 1782
    check-cast v0, Ljava/lang/String;

    .line 1783
    .line 1784
    invoke-virtual {v1, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1785
    .line 1786
    .line 1787
    goto :goto_14

    .line 1788
    :cond_1a
    invoke-virtual {v1, v3, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1789
    .line 1790
    .line 1791
    goto :goto_14

    .line 1792
    :cond_1b
    move-object/from16 v10, v16

    .line 1793
    .line 1794
    :goto_14
    const/4 v0, 0x7

    .line 1795
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1796
    .line 1797
    .line 1798
    move-result-object v0

    .line 1799
    invoke-virtual {v1, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1800
    .line 1801
    .line 1802
    invoke-static {}, Lx1/O;->J1()Z

    .line 1803
    .line 1804
    .line 1805
    move-result v0

    .line 1806
    if-eqz v0, :cond_19

    .line 1807
    .line 1808
    if-eqz v11, :cond_19

    .line 1809
    .line 1810
    const-string v0, "com.android.gallery3d/com.android.gallery3d.widget.PhotoMyOSFreelyAppWidgetProvider"

    .line 1811
    .line 1812
    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1813
    .line 1814
    .line 1815
    move-result v0

    .line 1816
    if-eqz v0, :cond_19

    .line 1817
    .line 1818
    const/4 v15, 0x0

    .line 1819
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1820
    .line 1821
    .line 1822
    move-result-object v0

    .line 1823
    invoke-virtual {v1, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1824
    .line 1825
    .line 1826
    const/4 v0, -0x1

    .line 1827
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1828
    .line 1829
    .line 1830
    move-result-object v0

    .line 1831
    invoke-virtual {v1, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1832
    .line 1833
    .line 1834
    :goto_15
    invoke-static {v9}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1835
    .line 1836
    .line 1837
    move-result-object v0

    .line 1838
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 1839
    .line 1840
    .line 1841
    move-result-object v0

    .line 1842
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 1843
    .line 1844
    .line 1845
    move-result-object v0

    .line 1846
    invoke-virtual {v0, v1}, Lz1/k2;->J(Landroid/content/ContentValues;)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 1847
    .line 1848
    .line 1849
    move-object/from16 v1, v26

    .line 1850
    .line 1851
    move/from16 v26, v24

    .line 1852
    .line 1853
    move-object/from16 v24, v1

    .line 1854
    .line 1855
    move-object/from16 v17, v2

    .line 1856
    .line 1857
    move-object/from16 v36, v6

    .line 1858
    .line 1859
    move-object v1, v9

    .line 1860
    move-object/from16 v16, v10

    .line 1861
    .line 1862
    goto/16 :goto_f

    .line 1863
    .line 1864
    :cond_1c
    move-object/from16 v2, v17

    .line 1865
    .line 1866
    :goto_16
    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 1867
    .line 1868
    .line 1869
    invoke-static {v5}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 1870
    .line 1871
    .line 1872
    const/16 v38, 0x1

    .line 1873
    .line 1874
    goto :goto_18

    .line 1875
    :goto_17
    :try_start_8
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 1876
    .line 1877
    .line 1878
    goto :goto_16

    .line 1879
    :goto_18
    return v38

    .line 1880
    :goto_19
    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 1881
    .line 1882
    .line 1883
    invoke-static {v5}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 1884
    .line 1885
    .line 1886
    throw v0
.end method

.method static o(Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private static p(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 14

    .line 1
    const-string v0, "launcherSettings"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/android/launcher3/R6;->k(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_e

    .line 9
    .line 10
    const/4 v8, 0x0

    .line 11
    const/4 v9, 0x0

    .line 12
    const-string v3, "launcherSettings"

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x0

    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v7, 0x0

    .line 18
    move-object v2, p1

    .line 19
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "name"

    .line 24
    .line 25
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const-string v2, "value"

    .line 30
    .line 31
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3, p0}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->s:Z

    .line 56
    .line 57
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v5}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    iget v5, v5, Lcom/android/launcher3/r4;->q:I

    .line 66
    .line 67
    const/4 v6, 0x1

    .line 68
    if-ne v5, v6, :cond_0

    .line 69
    .line 70
    move v5, v6

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    move v5, v1

    .line 73
    :goto_0
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    iget-boolean v7, v7, Lcom/android/launcher3/r4;->p:Z

    .line 82
    .line 83
    invoke-static {}, Lcom/android/launcher3/R6;->j()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 88
    .line 89
    .line 90
    move-result-object v9

    .line 91
    invoke-virtual {v9}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    iget-boolean v9, v9, Lcom/android/launcher3/r4;->j:Z

    .line 96
    .line 97
    :cond_1
    :goto_1
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 98
    .line 99
    .line 100
    move-result v10

    .line 101
    if-eqz v10, :cond_a

    .line 102
    .line 103
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v10

    .line 107
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v11

    .line 111
    const-string v12, "layoutStyle_6x4"

    .line 112
    .line 113
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v12

    .line 117
    if-nez v12, :cond_9

    .line 118
    .line 119
    const-string v12, "layoutStyle"

    .line 120
    .line 121
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v12

    .line 125
    if-eqz v12, :cond_2

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_2
    const-string v12, "customScreen"

    .line 129
    .line 130
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    const-string v13, "1"

    .line 135
    .line 136
    if-eqz v12, :cond_3

    .line 137
    .line 138
    :try_start_1
    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    goto :goto_1

    .line 143
    :catchall_0
    move-exception v0

    .line 144
    move-object p0, v0

    .line 145
    goto/16 :goto_8

    .line 146
    .line 147
    :catch_0
    move-exception v0

    .line 148
    goto/16 :goto_5

    .line 149
    .line 150
    :cond_3
    const-string v12, "quickSearch"

    .line 151
    .line 152
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v12

    .line 156
    if-eqz v12, :cond_4

    .line 157
    .line 158
    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    goto :goto_1

    .line 163
    :cond_4
    const-string v12, "fancyIcon"

    .line 164
    .line 165
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v12

    .line 169
    if-eqz v12, :cond_5

    .line 170
    .line 171
    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v9

    .line 175
    goto :goto_1

    .line 176
    :cond_5
    const-string v12, "uninstallSortOrder"

    .line 177
    .line 178
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v12

    .line 182
    if-eqz v12, :cond_8

    .line 183
    .line 184
    const-string v10, "0"

    .line 185
    .line 186
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v10

    .line 190
    if-nez v10, :cond_7

    .line 191
    .line 192
    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v7

    .line 196
    if-eqz v7, :cond_6

    .line 197
    .line 198
    goto :goto_2

    .line 199
    :cond_6
    move v7, v1

    .line 200
    goto :goto_1

    .line 201
    :cond_7
    :goto_2
    move v7, v6

    .line 202
    goto :goto_1

    .line 203
    :cond_8
    const-string v12, "launcher_mode"

    .line 204
    .line 205
    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v10

    .line 209
    if-eqz v10, :cond_1

    .line 210
    .line 211
    move-object v8, v11

    .line 212
    goto :goto_1

    .line 213
    :cond_9
    :goto_3
    const/4 v10, 0x2

    .line 214
    invoke-virtual {v11, v10}, Ljava/lang/String;->charAt(I)C

    .line 215
    .line 216
    .line 217
    move-result v10

    .line 218
    invoke-static {v10}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v10

    .line 222
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 223
    .line 224
    .line 225
    move-result v10

    .line 226
    iput v10, v3, Landroid/graphics/Point;->x:I

    .line 227
    .line 228
    invoke-virtual {v11, v1}, Ljava/lang/String;->charAt(I)C

    .line 229
    .line 230
    .line 231
    move-result v10

    .line 232
    invoke-static {v10}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v10

    .line 236
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    move-result v10

    .line 240
    iput v10, v3, Landroid/graphics/Point;->y:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 241
    .line 242
    goto/16 :goto_1

    .line 243
    .line 244
    :cond_a
    :goto_4
    invoke-static {p1}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 245
    .line 246
    .line 247
    goto :goto_6

    .line 248
    :goto_5
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 249
    .line 250
    .line 251
    goto :goto_4

    .line 252
    :goto_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 255
    .line 256
    .line 257
    const-string v0, "recoverSettings old ROWS_COLUMNS: "

    .line 258
    .line 259
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    const-string v0, "ZBackupRecoverData"

    .line 270
    .line 271
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    .line 273
    .line 274
    iget p1, v3, Landroid/graphics/Point;->x:I

    .line 275
    .line 276
    iget v1, v3, Landroid/graphics/Point;->y:I

    .line 277
    .line 278
    invoke-static {p1, v1}, Lcom/android/launcher3/b0;->p(II)I

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    sget-object v1, Lcom/android/launcher3/b0$f;->h:Lcom/android/launcher3/b0$f;

    .line 283
    .line 284
    invoke-virtual {v1}, Lcom/android/launcher3/b0$f;->c()I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    if-ne v1, p1, :cond_b

    .line 289
    .line 290
    sget-object p1, Lcom/android/launcher3/b0$f;->j:Lcom/android/launcher3/b0$f;

    .line 291
    .line 292
    invoke-virtual {p1}, Lcom/android/launcher3/b0$f;->c()I

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    invoke-static {p1}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    goto :goto_7

    .line 301
    :cond_b
    sget-object v1, Lcom/android/launcher3/b0$f;->i:Lcom/android/launcher3/b0$f;

    .line 302
    .line 303
    invoke-virtual {v1}, Lcom/android/launcher3/b0$f;->c()I

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    if-ne v1, p1, :cond_c

    .line 308
    .line 309
    sget-object p1, Lcom/android/launcher3/b0$f;->k:Lcom/android/launcher3/b0$f;

    .line 310
    .line 311
    invoke-virtual {p1}, Lcom/android/launcher3/b0$f;->c()I

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    invoke-static {p1}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    goto :goto_7

    .line 320
    :cond_c
    const/16 v1, 0x74

    .line 321
    .line 322
    if-ne v1, p1, :cond_d

    .line 323
    .line 324
    sget-object p1, Lcom/android/launcher3/b0$f;->j:Lcom/android/launcher3/b0$f;

    .line 325
    .line 326
    invoke-virtual {p1}, Lcom/android/launcher3/b0$f;->c()I

    .line 327
    .line 328
    .line 329
    move-result p1

    .line 330
    invoke-static {p1}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    :cond_d
    :goto_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 335
    .line 336
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    .line 338
    .line 339
    const-string v1, "recoverSettings point: "

    .line 340
    .line 341
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const-string v1, " ,customScreen: "

    .line 348
    .line 349
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    const-string v1, " ,quickSearch: "

    .line 356
    .line 357
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    const-string v1, " ,uninstallSortOrder: "

    .line 364
    .line 365
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p1

    .line 375
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    .line 377
    .line 378
    invoke-static {p0, v8}, Lcom/android/launcher3/R6;->d(Landroid/content/Context;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 382
    .line 383
    .line 384
    move-result-object p1

    .line 385
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    iget v0, v3, Landroid/graphics/Point;->x:I

    .line 394
    .line 395
    iget v1, v3, Landroid/graphics/Point;->y:I

    .line 396
    .line 397
    invoke-virtual {p1, p0, v0, v1}, Lcom/android/launcher3/b0;->q(Landroid/content/Context;II)Z

    .line 398
    .line 399
    .line 400
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    const v0, 0x7f1403bb

    .line 409
    .line 410
    .line 411
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    invoke-interface {p1, v0, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 416
    .line 417
    .line 418
    const v0, 0x7f1403a6

    .line 419
    .line 420
    .line 421
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    invoke-interface {p1, v0, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 426
    .line 427
    .line 428
    const v0, 0x7f1403ad

    .line 429
    .line 430
    .line 431
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    invoke-interface {p1, v0, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 436
    .line 437
    .line 438
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 439
    .line 440
    .line 441
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 442
    .line 443
    .line 444
    move-result-object p1

    .line 445
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 446
    .line 447
    .line 448
    move-result-object p1

    .line 449
    invoke-virtual {p1, v9}, Lcom/android/launcher3/r4;->H(Z)V

    .line 450
    .line 451
    .line 452
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 453
    .line 454
    .line 455
    move-result-object p1

    .line 456
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 457
    .line 458
    .line 459
    move-result-object p1

    .line 460
    const v0, 0x7f1403b1

    .line 461
    .line 462
    .line 463
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object p0

    .line 467
    invoke-interface {p1, p0, v9}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 468
    .line 469
    .line 470
    move-result-object p0

    .line 471
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 472
    .line 473
    .line 474
    return v6

    .line 475
    :goto_8
    invoke-static {p1}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 476
    .line 477
    .line 478
    throw p0

    .line 479
    :cond_e
    return v1
.end method

.method protected static q(Landroid/content/Context;)I
    .locals 43

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "transMFV start"

    .line 4
    .line 5
    const-string v2, "ZBackupRecoverData"

    .line 6
    .line 7
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    new-instance v3, Lcom/android/launcher3/R6$a;

    .line 11
    .line 12
    const-string v0, "launcherNubia.db"

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    invoke-direct {v3, v1, v0, v4}, Lcom/android/launcher3/R6$a;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v3, v0, v4}, Lcom/android/launcher3/R6$a;->b(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v4, 0x0

    .line 38
    invoke-virtual {v0, v4, v4, v4, v4}, Lz1/k2;->Z([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    const-string v6, "_id"

    .line 43
    .line 44
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const-string v7, "title"

    .line 49
    .line 50
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    const-string v9, "intent"

    .line 55
    .line 56
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v10

    .line 60
    const-string v11, "container"

    .line 61
    .line 62
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v12

    .line 66
    const-string v13, "screen"

    .line 67
    .line 68
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v14

    .line 72
    const-string v15, "cellX"

    .line 73
    .line 74
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    const-string v1, "cellY"

    .line 79
    .line 80
    move-object/from16 v16, v2

    .line 81
    .line 82
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    move-object/from16 v17, v3

    .line 87
    .line 88
    const-string v3, "spanX"

    .line 89
    .line 90
    move-object/from16 v18, v1

    .line 91
    .line 92
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    move-object/from16 v19, v3

    .line 97
    .line 98
    const-string v3, "spanY"

    .line 99
    .line 100
    move/from16 v20, v1

    .line 101
    .line 102
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    move-object/from16 v21, v3

    .line 107
    .line 108
    const-string v3, "itemType"

    .line 109
    .line 110
    move/from16 v22, v1

    .line 111
    .line 112
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    move-object/from16 v23, v3

    .line 117
    .line 118
    const-string v3, "appWidgetId"

    .line 119
    .line 120
    move/from16 v24, v1

    .line 121
    .line 122
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    move-object/from16 v25, v3

    .line 127
    .line 128
    const-string v3, "icon"

    .line 129
    .line 130
    move/from16 v26, v1

    .line 131
    .line 132
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    move-object/from16 v27, v3

    .line 137
    .line 138
    const-string v3, "appWidgetProvider"

    .line 139
    .line 140
    move/from16 v28, v1

    .line 141
    .line 142
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    move-object/from16 v29, v3

    .line 147
    .line 148
    const-string v3, "modified"

    .line 149
    .line 150
    move/from16 v30, v1

    .line 151
    .line 152
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    move-object/from16 v31, v3

    .line 157
    .line 158
    const-string v3, "restored"

    .line 159
    .line 160
    move/from16 v32, v1

    .line 161
    .line 162
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    move-object/from16 v33, v3

    .line 167
    .line 168
    const-string v3, "profileId"

    .line 169
    .line 170
    move/from16 v34, v1

    .line 171
    .line 172
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    move-object/from16 v35, v3

    .line 177
    .line 178
    new-instance v3, Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .line 182
    .line 183
    :goto_0
    :try_start_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 184
    .line 185
    .line 186
    move-result v36
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 187
    if-eqz v36, :cond_1

    .line 188
    .line 189
    move-object/from16 v36, v3

    .line 190
    .line 191
    :try_start_1
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    move/from16 v38, v1

    .line 196
    .line 197
    move/from16 v37, v2

    .line 198
    .line 199
    int-to-long v1, v3

    .line 200
    new-instance v3, Landroid/content/ContentValues;

    .line 201
    .line 202
    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 206
    .line 207
    .line 208
    move-result v39

    .line 209
    move/from16 v40, v0

    .line 210
    .line 211
    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v3, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 216
    .line 217
    .line 218
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {v3, v7, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    const-string v0, "titleResId"

    .line 226
    .line 227
    const/16 v39, -0x1

    .line 228
    .line 229
    move-wide/from16 v41, v1

    .line 230
    .line 231
    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-virtual {v3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 236
    .line 237
    .line 238
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v3, v9, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {v3, v11, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-static/range {v41 .. v42}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-virtual {v3, v13, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 257
    .line 258
    .line 259
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {v3, v15, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 268
    .line 269
    .line 270
    move/from16 v0, v37

    .line 271
    .line 272
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    move-object/from16 v2, v18

    .line 281
    .line 282
    invoke-virtual {v3, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 283
    .line 284
    .line 285
    move/from16 v1, v20

    .line 286
    .line 287
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 288
    .line 289
    .line 290
    move-result v18

    .line 291
    move/from16 v37, v0

    .line 292
    .line 293
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    move/from16 v20, v1

    .line 298
    .line 299
    move-object/from16 v1, v19

    .line 300
    .line 301
    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 302
    .line 303
    .line 304
    move/from16 v0, v22

    .line 305
    .line 306
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 307
    .line 308
    .line 309
    move-result v18

    .line 310
    move/from16 v22, v0

    .line 311
    .line 312
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    move-object/from16 v19, v1

    .line 317
    .line 318
    move-object/from16 v1, v21

    .line 319
    .line 320
    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 321
    .line 322
    .line 323
    move/from16 v0, v24

    .line 324
    .line 325
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 326
    .line 327
    .line 328
    move-result v18

    .line 329
    move/from16 v24, v0

    .line 330
    .line 331
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    move-object/from16 v21, v1

    .line 336
    .line 337
    move-object/from16 v1, v23

    .line 338
    .line 339
    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 340
    .line 341
    .line 342
    move/from16 v0, v26

    .line 343
    .line 344
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 345
    .line 346
    .line 347
    move-result v18

    .line 348
    move/from16 v26, v0

    .line 349
    .line 350
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    move-object/from16 v23, v1

    .line 355
    .line 356
    move-object/from16 v1, v25

    .line 357
    .line 358
    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 359
    .line 360
    .line 361
    move-object/from16 v25, v1

    .line 362
    .line 363
    move/from16 v0, v28

    .line 364
    .line 365
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    move/from16 v28, v0

    .line 370
    .line 371
    move-object/from16 v0, v27

    .line 372
    .line 373
    invoke-virtual {v3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 374
    .line 375
    .line 376
    move-object/from16 v27, v0

    .line 377
    .line 378
    move/from16 v1, v30

    .line 379
    .line 380
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    move/from16 v30, v1

    .line 385
    .line 386
    move-object/from16 v1, v29

    .line 387
    .line 388
    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    move/from16 v0, v32

    .line 392
    .line 393
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 394
    .line 395
    .line 396
    move-result v18

    .line 397
    move/from16 v32, v0

    .line 398
    .line 399
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    move-object/from16 v29, v1

    .line 404
    .line 405
    move-object/from16 v1, v31

    .line 406
    .line 407
    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 408
    .line 409
    .line 410
    move/from16 v0, v34

    .line 411
    .line 412
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 413
    .line 414
    .line 415
    move-result v18

    .line 416
    move/from16 v34, v0

    .line 417
    .line 418
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 419
    .line 420
    .line 421
    move-result-object v0

    .line 422
    move-object/from16 v31, v1

    .line 423
    .line 424
    move-object/from16 v1, v33

    .line 425
    .line 426
    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 427
    .line 428
    .line 429
    move/from16 v0, v38

    .line 430
    .line 431
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 432
    .line 433
    .line 434
    move-result v18

    .line 435
    move/from16 v38, v0

    .line 436
    .line 437
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    move-object/from16 v33, v1

    .line 442
    .line 443
    move-object/from16 v1, v35

    .line 444
    .line 445
    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 446
    .line 447
    .line 448
    invoke-static/range {v41 .. v42}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 449
    .line 450
    .line 451
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 452
    move-object/from16 v35, v1

    .line 453
    .line 454
    move-object/from16 v1, v36

    .line 455
    .line 456
    :try_start_2
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    if-nez v0, :cond_0

    .line 461
    .line 462
    invoke-static/range {v41 .. v42}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    .line 468
    .line 469
    goto :goto_2

    .line 470
    :catchall_0
    move-exception v0

    .line 471
    goto/16 :goto_7

    .line 472
    .line 473
    :catch_0
    move-exception v0

    .line 474
    move-object/from16 v36, v1

    .line 475
    .line 476
    :goto_1
    move-object/from16 v2, v17

    .line 477
    .line 478
    goto :goto_4

    .line 479
    :cond_0
    :goto_2
    invoke-virtual/range {v17 .. v17}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 480
    .line 481
    .line 482
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 483
    move-object/from16 v36, v1

    .line 484
    .line 485
    :try_start_3
    sget-object v1, Lcom/android/launcher3/R6$b;->a:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 486
    .line 487
    move-object/from16 v18, v2

    .line 488
    .line 489
    move-object/from16 v2, v17

    .line 490
    .line 491
    :try_start_4
    invoke-virtual {v2, v0, v1, v3}, Lcom/android/launcher3/R6$a;->e(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 492
    .line 493
    .line 494
    move-object/from16 v17, v2

    .line 495
    .line 496
    move-object/from16 v3, v36

    .line 497
    .line 498
    move/from16 v2, v37

    .line 499
    .line 500
    move/from16 v1, v38

    .line 501
    .line 502
    move/from16 v0, v40

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :catch_1
    move-exception v0

    .line 507
    goto :goto_4

    .line 508
    :catch_2
    move-exception v0

    .line 509
    goto :goto_1

    .line 510
    :cond_1
    move-object/from16 v36, v3

    .line 511
    .line 512
    move-object/from16 v2, v17

    .line 513
    .line 514
    :goto_3
    invoke-static {v5}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 515
    .line 516
    .line 517
    goto :goto_5

    .line 518
    :catch_3
    move-exception v0

    .line 519
    move-object/from16 v36, v3

    .line 520
    .line 521
    goto :goto_1

    .line 522
    :goto_4
    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 523
    .line 524
    .line 525
    goto :goto_3

    .line 526
    :goto_5
    invoke-virtual/range {v36 .. v36}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 527
    .line 528
    .line 529
    move-result-object v0

    .line 530
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 531
    .line 532
    .line 533
    move-result v1

    .line 534
    if-eqz v1, :cond_2

    .line 535
    .line 536
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 537
    .line 538
    .line 539
    move-result-object v1

    .line 540
    check-cast v1, Ljava/lang/Long;

    .line 541
    .line 542
    new-instance v3, Ljava/lang/StringBuilder;

    .line 543
    .line 544
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 545
    .line 546
    .line 547
    const-string v4, "transMFV screenId: "

    .line 548
    .line 549
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 553
    .line 554
    .line 555
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v3

    .line 559
    move-object/from16 v4, v16

    .line 560
    .line 561
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    .line 563
    .line 564
    new-instance v3, Landroid/content/ContentValues;

    .line 565
    .line 566
    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 567
    .line 568
    .line 569
    invoke-virtual {v3, v6, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 570
    .line 571
    .line 572
    const-string v5, "screenRank"

    .line 573
    .line 574
    invoke-virtual {v3, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 575
    .line 576
    .line 577
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 578
    .line 579
    .line 580
    move-result-object v1

    .line 581
    const-string v5, "workspaceScreens"

    .line 582
    .line 583
    const/4 v7, 0x0

    .line 584
    invoke-virtual {v1, v5, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 585
    .line 586
    .line 587
    goto :goto_6

    .line 588
    :cond_2
    move-object/from16 v4, v16

    .line 589
    .line 590
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 591
    .line 592
    .line 593
    move-result-object v0

    .line 594
    move-object/from16 v1, p0

    .line 595
    .line 596
    invoke-static {v1, v0}, Lcom/android/launcher3/R6;->e(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 597
    .line 598
    .line 599
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    .line 600
    .line 601
    .line 602
    const-string v0, "transMFV end"

    .line 603
    .line 604
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 605
    .line 606
    .line 607
    invoke-virtual/range {v36 .. v36}, Ljava/util/ArrayList;->size()I

    .line 608
    .line 609
    .line 610
    move-result v0

    .line 611
    return v0

    .line 612
    :goto_7
    invoke-static {v5}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 613
    .line 614
    .line 615
    throw v0
.end method
