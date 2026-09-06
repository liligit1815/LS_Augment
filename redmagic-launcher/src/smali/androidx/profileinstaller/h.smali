.class public final Landroidx/profileinstaller/h;
.super Ljava/lang/Object;
.source "ProfileVerifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/profileinstaller/h$c;,
        Landroidx/profileinstaller/h$b;,
        Landroidx/profileinstaller/h$a;
    }
.end annotation


# static fields
.field private static final a:Landroidx/concurrent/futures/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/c<",
            "Landroidx/profileinstaller/h$c;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Ljava/lang/Object;

.field private static c:Landroidx/profileinstaller/h$c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Landroidx/concurrent/futures/c;->q()Landroidx/concurrent/futures/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Landroidx/profileinstaller/h;->a:Landroidx/concurrent/futures/c;

    .line 6
    .line 7
    new-instance v0, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Landroidx/profileinstaller/h;->b:Ljava/lang/Object;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-object v0, Landroidx/profileinstaller/h;->c:Landroidx/profileinstaller/h$c;

    .line 16
    .line 17
    return-void
.end method

.method private static a(Landroid/content/Context;)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    const/16 v2, 0x21

    .line 12
    .line 13
    if-lt v1, v2, :cond_0

    .line 14
    .line 15
    invoke-static {v0, p0}, Landroidx/profileinstaller/h$a;->a(Landroid/content/pm/PackageManager;Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 20
    .line 21
    return-wide v0

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 32
    .line 33
    return-wide v0
.end method

.method private static b(IZZZ)Landroidx/profileinstaller/h$c;
    .locals 1

    .line 1
    new-instance v0, Landroidx/profileinstaller/h$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/profileinstaller/h$c;-><init>(IZZZ)V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/profileinstaller/h;->c:Landroidx/profileinstaller/h$c;

    .line 7
    .line 8
    sget-object p0, Landroidx/profileinstaller/h;->a:Landroidx/concurrent/futures/c;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/concurrent/futures/c;->o(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    sget-object p0, Landroidx/profileinstaller/h;->c:Landroidx/profileinstaller/h$c;

    .line 14
    .line 15
    return-object p0
.end method

.method static c(Landroid/content/Context;Z)Landroidx/profileinstaller/h$c;
    .locals 19

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Landroidx/profileinstaller/h;->c:Landroidx/profileinstaller/h$c;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v1, Landroidx/profileinstaller/h;->b:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    :try_start_0
    sget-object v0, Landroidx/profileinstaller/h;->c:Landroidx/profileinstaller/h$c;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    return-object v0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto/16 :goto_9

    .line 21
    .line 22
    :cond_1
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    const/4 v5, 0x1

    .line 26
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v6, "dexopt/baseline.prof"

    .line 31
    .line 32
    invoke-virtual {v0, v6}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    .line 33
    .line 34
    .line 35
    move-result-object v6
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    :try_start_2
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 37
    .line 38
    .line 39
    move-result-wide v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 40
    cmp-long v0, v7, v2

    .line 41
    .line 42
    if-lez v0, :cond_2

    .line 43
    .line 44
    move v0, v5

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    move v0, v4

    .line 47
    :goto_0
    :try_start_3
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :catchall_1
    move-exception v0

    .line 52
    move-object v7, v0

    .line 53
    if-eqz v6, :cond_3

    .line 54
    .line 55
    :try_start_4
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catchall_2
    move-exception v0

    .line 60
    :try_start_5
    invoke-virtual {v7, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_1
    throw v7
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 64
    :catch_0
    move v0, v4

    .line 65
    :goto_2
    :try_start_6
    new-instance v6, Ljava/io/File;

    .line 66
    .line 67
    new-instance v7, Ljava/io/File;

    .line 68
    .line 69
    const-string v8, "/data/misc/profiles/ref/"

    .line 70
    .line 71
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    invoke-direct {v7, v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    const-string v8, "primary.prof"

    .line 79
    .line 80
    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v6}, Ljava/io/File;->length()J

    .line 84
    .line 85
    .line 86
    move-result-wide v7

    .line 87
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    if-eqz v6, :cond_4

    .line 92
    .line 93
    cmp-long v6, v7, v2

    .line 94
    .line 95
    if-lez v6, :cond_4

    .line 96
    .line 97
    move v6, v5

    .line 98
    goto :goto_3

    .line 99
    :cond_4
    move v6, v4

    .line 100
    :goto_3
    new-instance v9, Ljava/io/File;

    .line 101
    .line 102
    new-instance v10, Ljava/io/File;

    .line 103
    .line 104
    const-string v11, "/data/misc/profiles/cur/0/"

    .line 105
    .line 106
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    invoke-direct {v10, v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    const-string v11, "primary.prof"

    .line 114
    .line 115
    invoke-direct {v9, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v9}, Ljava/io/File;->length()J

    .line 119
    .line 120
    .line 121
    move-result-wide v17

    .line 122
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    .line 123
    .line 124
    .line 125
    move-result v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 126
    if-eqz v9, :cond_5

    .line 127
    .line 128
    cmp-long v2, v17, v2

    .line 129
    .line 130
    if-lez v2, :cond_5

    .line 131
    .line 132
    move v2, v5

    .line 133
    goto :goto_4

    .line 134
    :cond_5
    move v2, v4

    .line 135
    :goto_4
    :try_start_7
    invoke-static/range {p0 .. p0}, Landroidx/profileinstaller/h;->a(Landroid/content/Context;)J

    .line 136
    .line 137
    .line 138
    move-result-wide v15
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 139
    :try_start_8
    new-instance v3, Ljava/io/File;

    .line 140
    .line 141
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    const-string v10, "profileInstalled"

    .line 146
    .line 147
    invoke-direct {v3, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 151
    .line 152
    .line 153
    move-result v9
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 154
    if-eqz v9, :cond_6

    .line 155
    .line 156
    :try_start_9
    invoke-static {v3}, Landroidx/profileinstaller/h$b;->a(Ljava/io/File;)Landroidx/profileinstaller/h$b;

    .line 157
    .line 158
    .line 159
    move-result-object v9
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 160
    goto :goto_5

    .line 161
    :catch_1
    const/high16 v3, 0x20000

    .line 162
    .line 163
    :try_start_a
    invoke-static {v3, v6, v2, v0}, Landroidx/profileinstaller/h;->b(IZZZ)Landroidx/profileinstaller/h$c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    monitor-exit v1

    .line 168
    return-object v0

    .line 169
    :cond_6
    const/4 v9, 0x0

    .line 170
    :goto_5
    const/4 v10, 0x2

    .line 171
    if-eqz v9, :cond_8

    .line 172
    .line 173
    iget-wide v11, v9, Landroidx/profileinstaller/h$b;->c:J

    .line 174
    .line 175
    cmp-long v11, v11, v15

    .line 176
    .line 177
    if-nez v11, :cond_8

    .line 178
    .line 179
    iget v11, v9, Landroidx/profileinstaller/h$b;->b:I

    .line 180
    .line 181
    if-ne v11, v10, :cond_7

    .line 182
    .line 183
    goto :goto_6

    .line 184
    :cond_7
    move v4, v11

    .line 185
    goto :goto_7

    .line 186
    :cond_8
    :goto_6
    if-nez v0, :cond_9

    .line 187
    .line 188
    const/high16 v4, 0x50000

    .line 189
    .line 190
    goto :goto_7

    .line 191
    :cond_9
    if-eqz v6, :cond_a

    .line 192
    .line 193
    move v4, v5

    .line 194
    goto :goto_7

    .line 195
    :cond_a
    if-eqz v2, :cond_b

    .line 196
    .line 197
    move v4, v10

    .line 198
    :cond_b
    :goto_7
    if-eqz p1, :cond_c

    .line 199
    .line 200
    if-eqz v2, :cond_c

    .line 201
    .line 202
    if-eq v4, v5, :cond_c

    .line 203
    .line 204
    move v4, v10

    .line 205
    :cond_c
    if-eqz v9, :cond_d

    .line 206
    .line 207
    iget v11, v9, Landroidx/profileinstaller/h$b;->b:I

    .line 208
    .line 209
    if-ne v11, v10, :cond_d

    .line 210
    .line 211
    if-ne v4, v5, :cond_d

    .line 212
    .line 213
    iget-wide v10, v9, Landroidx/profileinstaller/h$b;->d:J

    .line 214
    .line 215
    cmp-long v5, v7, v10

    .line 216
    .line 217
    if-gez v5, :cond_d

    .line 218
    .line 219
    const/4 v4, 0x3

    .line 220
    :cond_d
    move v14, v4

    .line 221
    new-instance v12, Landroidx/profileinstaller/h$b;

    .line 222
    .line 223
    const/4 v13, 0x1

    .line 224
    invoke-direct/range {v12 .. v18}, Landroidx/profileinstaller/h$b;-><init>(IIJJ)V

    .line 225
    .line 226
    .line 227
    if-eqz v9, :cond_e

    .line 228
    .line 229
    invoke-virtual {v9, v12}, Landroidx/profileinstaller/h$b;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 233
    if-nez v4, :cond_f

    .line 234
    .line 235
    :cond_e
    :try_start_b
    invoke-virtual {v12, v3}, Landroidx/profileinstaller/h$b;->b(Ljava/io/File;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 236
    .line 237
    .line 238
    goto :goto_8

    .line 239
    :catch_2
    const/high16 v14, 0x30000

    .line 240
    .line 241
    :cond_f
    :goto_8
    :try_start_c
    invoke-static {v14, v6, v2, v0}, Landroidx/profileinstaller/h;->b(IZZZ)Landroidx/profileinstaller/h$c;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    monitor-exit v1

    .line 246
    return-object v0

    .line 247
    :catch_3
    const/high16 v3, 0x10000

    .line 248
    .line 249
    invoke-static {v3, v6, v2, v0}, Landroidx/profileinstaller/h;->b(IZZZ)Landroidx/profileinstaller/h$c;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    monitor-exit v1

    .line 254
    return-object v0

    .line 255
    :goto_9
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 256
    throw v0
.end method
