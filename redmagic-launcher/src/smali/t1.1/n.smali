.class public final Lt1/n;
.super Ljava/lang/Object;
.source "IconCacheUpdateHandler.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lt1/n$a;,
        Lt1/n$b;,
        Lt1/n$c;,
        Lt1/n$d;
    }
.end annotation


# static fields
.field public static final h:Lt1/n$a;


# instance fields
.field private final a:Lt1/f;

.field private final b:Lcom/android/launcher3/util/Z1;

.field private final c:Landroid/os/Handler;

.field private final d:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/os/UserHandle;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/E;",
            "Landroid/content/pm/ApplicationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lt1/n$d;",
            ">;"
        }
    .end annotation
.end field

.field private g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lt1/n$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lt1/n$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lt1/n;->h:Lt1/n$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lt1/f;Lcom/android/launcher3/util/Z1;Landroid/os/Handler;)V
    .locals 1

    .line 1
    const-string v0, "iconCache"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "cacheDb"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "workerHandler"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lt1/n;->a:Lt1/f;

    .line 20
    .line 21
    iput-object p2, p0, Lt1/n;->b:Lcom/android/launcher3/util/Z1;

    .line 22
    .line 23
    iput-object p3, p0, Lt1/n;->c:Landroid/os/Handler;

    .line 24
    .line 25
    new-instance p1, Landroid/util/ArrayMap;

    .line 26
    .line 27
    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lt1/n;->d:Landroid/util/ArrayMap;

    .line 31
    .line 32
    new-instance p1, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lt1/n;->e:Ljava/util/HashMap;

    .line 38
    .line 39
    new-instance p1, Ljava/util/HashSet;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lt1/n;->f:Ljava/util/HashSet;

    .line 45
    .line 46
    const/4 p1, 0x1

    .line 47
    iput-boolean p1, p0, Lt1/n;->g:Z

    .line 48
    .line 49
    return-void
.end method

.method public static synthetic a(Lt1/n$d;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p0}, Lt1/n;->j(Lt1/n$d;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lt1/n;Lt1/n$d;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lt1/n;->h(Lt1/n;Lt1/n$d;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Lu4/l;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lt1/n;->i(Lu4/l;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic d(Lt1/n;)Lt1/f;
    .locals 0

    .line 1
    iget-object p0, p0, Lt1/n;->a:Lt1/f;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic e(Lt1/n;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lt1/n;->c:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method private static final h(Lt1/n;Lt1/n$d;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lt1/n;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 4
    .line 5
    invoke-virtual {p1}, Lt1/n$d;->a()Landroid/content/ComponentName;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Lt1/n$d;->d()Landroid/os/UserHandle;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Lt1/n$d;->b()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p0, p0, Lt1/n;->a:Lt1/f;

    .line 29
    .line 30
    invoke-virtual {p0}, Lt1/f;->w()Ls1/T;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v0}, Ls1/T;->m(Landroid/content/pm/ApplicationInfo;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_0
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method private static final i(Lu4/l;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static final j(Lt1/n$d;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lt1/n$d;->c()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private final l(Landroid/os/UserHandle;Ljava/util/Map;Lt1/j;Lt1/n$b;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/os/UserHandle;",
            "Ljava/util/Map<",
            "Landroid/content/ComponentName;",
            "TT;>;",
            "Lt1/j<",
            "TT;>;",
            "Lt1/n$b;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v4, p1

    .line 4
    .line 5
    const-string v2, "IconCacheUpdateHandler"

    .line 6
    .line 7
    new-instance v6, Ljava/util/ArrayDeque;

    .line 8
    .line 9
    invoke-direct {v6}, Ljava/util/ArrayDeque;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v0, v1, Lt1/n;->a:Lt1/f;

    .line 13
    .line 14
    invoke-virtual {v0, v4}, Lt1/f;->B(Landroid/os/UserHandle;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v7

    .line 18
    :try_start_0
    iget-object v0, v1, Lt1/n;->b:Lcom/android/launcher3/util/Z1;

    .line 19
    .line 20
    sget-object v3, Lt1/f;->r:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v5, Lt1/f;->s:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v9, Lt1/f;->u:Ljava/lang/String;

    .line 25
    .line 26
    filled-new-array {v3, v5, v9}, [Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v10

    .line 30
    sget-object v11, Lt1/f;->t:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v12, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v11, " = ? "

    .line 41
    .line 42
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v11

    .line 49
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v12

    .line 53
    filled-new-array {v12}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v12

    .line 57
    invoke-virtual {v0, v10, v11, v12}, Lcom/android/launcher3/util/Z1;->i([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 58
    .line 59
    .line 60
    move-result-object v10
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 61
    :try_start_1
    iget-object v0, v1, Lt1/n;->d:Landroid/util/ArrayMap;

    .line 62
    .line 63
    invoke-virtual {v0, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Ljava/util/Set;

    .line 68
    .line 69
    if-nez v0, :cond_0

    .line 70
    .line 71
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    goto :goto_2

    .line 76
    :catchall_0
    move-exception v0

    .line 77
    move-object/from16 v3, p2

    .line 78
    .line 79
    :goto_0
    move-object/from16 v14, p3

    .line 80
    .line 81
    :goto_1
    move-object v5, v0

    .line 82
    goto/16 :goto_5

    .line 83
    .line 84
    :cond_0
    :goto_2
    invoke-interface {v10, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    invoke-interface {v10, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v9

    .line 92
    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    :goto_3
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    .line 97
    .line 98
    .line 99
    move-result v11

    .line 100
    if-eqz v11, :cond_6

    .line 101
    .line 102
    invoke-interface {v10, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 103
    .line 104
    .line 105
    move-result v11

    .line 106
    invoke-interface {v10, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    invoke-interface {v10, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    const-string v14, ""

    .line 115
    .line 116
    if-nez v13, :cond_1

    .line 117
    .line 118
    move-object v13, v14

    .line 119
    :cond_1
    :try_start_2
    invoke-static {v12}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 120
    .line 121
    .line 122
    move-result-object v15

    .line 123
    if-nez v15, :cond_3

    .line 124
    .line 125
    new-instance v15, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    move/from16 v16, v3

    .line 131
    .line 132
    const-string v3, "Invalid component name while updating icon cache: "

    .line 133
    .line 134
    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    iget-object v3, v1, Lt1/n;->f:Ljava/util/HashSet;

    .line 148
    .line 149
    new-instance v12, Lt1/n$d;

    .line 150
    .line 151
    new-instance v15, Landroid/content/ComponentName;

    .line 152
    .line 153
    invoke-direct {v15, v14, v14}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-direct {v12, v11, v15, v4, v13}, Lt1/n$d;-><init>(ILandroid/content/ComponentName;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 160
    .line 161
    .line 162
    :cond_2
    :goto_4
    move/from16 v3, v16

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_3
    move/from16 v16, v3

    .line 166
    .line 167
    move-object/from16 v3, p2

    .line 168
    .line 169
    :try_start_3
    invoke-interface {v3, v15}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v12

    .line 173
    if-nez v12, :cond_4

    .line 174
    .line 175
    invoke-virtual {v15}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v12

    .line 179
    invoke-interface {v0, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v12

    .line 183
    if-nez v12, :cond_2

    .line 184
    .line 185
    iget-object v12, v1, Lt1/n;->a:Lt1/f;

    .line 186
    .line 187
    invoke-virtual {v12, v15, v4}, Lt1/f;->L(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lt1/f$a;

    .line 188
    .line 189
    .line 190
    iget-object v12, v1, Lt1/n;->f:Ljava/util/HashSet;

    .line 191
    .line 192
    new-instance v14, Lt1/n$d;

    .line 193
    .line 194
    invoke-direct {v14, v11, v15, v4, v13}, Lt1/n$d;-><init>(ILandroid/content/ComponentName;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v12, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    goto :goto_4

    .line 201
    :catchall_1
    move-exception v0

    .line 202
    goto :goto_0

    .line 203
    :cond_4
    iget-object v11, v1, Lt1/n;->a:Lt1/f;

    .line 204
    .line 205
    invoke-virtual {v11}, Lt1/f;->w()Ls1/T;

    .line 206
    .line 207
    .line 208
    move-result-object v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 209
    move-object/from16 v14, p3

    .line 210
    .line 211
    :try_start_4
    invoke-interface {v14, v12, v11}, Lt1/j;->c(Ljava/lang/Object;Ls1/T;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v11

    .line 215
    invoke-static {v13, v11}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v11

    .line 219
    if-eqz v11, :cond_5

    .line 220
    .line 221
    goto :goto_4

    .line 222
    :cond_5
    invoke-virtual {v6, v12}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    goto :goto_4

    .line 226
    :catchall_2
    move-exception v0

    .line 227
    goto/16 :goto_1

    .line 228
    .line 229
    :cond_6
    move-object/from16 v3, p2

    .line 230
    .line 231
    move-object/from16 v14, p3

    .line 232
    .line 233
    sget-object v0, Lh4/t;->a:Lh4/t;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 234
    .line 235
    const/4 v0, 0x0

    .line 236
    :try_start_5
    invoke-static {v10, v0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_0

    .line 237
    .line 238
    .line 239
    goto :goto_7

    .line 240
    :catch_0
    move-exception v0

    .line 241
    goto :goto_6

    .line 242
    :goto_5
    :try_start_6
    throw v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 243
    :catchall_3
    move-exception v0

    .line 244
    :try_start_7
    invoke-static {v10, v5}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 245
    .line 246
    .line 247
    throw v0
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_0

    .line 248
    :catch_1
    move-exception v0

    .line 249
    move-object/from16 v3, p2

    .line 250
    .line 251
    move-object/from16 v14, p3

    .line 252
    .line 253
    :goto_6
    const-string v5, "Error reading icon cache"

    .line 254
    .line 255
    invoke-static {v2, v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 256
    .line 257
    .line 258
    :goto_7
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-eqz v0, :cond_7

    .line 263
    .line 264
    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-nez v0, :cond_8

    .line 269
    .line 270
    :cond_7
    new-instance v5, Ljava/util/ArrayDeque;

    .line 271
    .line 272
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-direct {v5, v0}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    .line 277
    .line 278
    .line 279
    new-instance v0, Lt1/n$c;

    .line 280
    .line 281
    move-wide v2, v7

    .line 282
    move-object v7, v14

    .line 283
    move-object/from16 v8, p4

    .line 284
    .line 285
    invoke-direct/range {v0 .. v8}, Lt1/n$c;-><init>(Lt1/n;JLandroid/os/UserHandle;Ljava/util/ArrayDeque;Ljava/util/ArrayDeque;Lt1/j;Lt1/n$b;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0}, Lt1/n$c;->a()V

    .line 289
    .line 290
    .line 291
    :cond_8
    return-void
.end method

.method private final m(Landroid/os/UserHandle;Ljava/util/Map;Lt1/j;Lt1/n$b;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/os/UserHandle;",
            "Ljava/util/Map<",
            "Landroid/content/ComponentName;",
            "TT;>;",
            "Lt1/j<",
            "TT;>;",
            "Lt1/n$b;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lt1/n;->a:Lt1/f;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt1/f;->B(Landroid/os/UserHandle;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v3

    .line 7
    new-instance v7, Ljava/util/ArrayDeque;

    .line 8
    .line 9
    invoke-direct {v7}, Ljava/util/ArrayDeque;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lt1/n;->f:Ljava/util/HashSet;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "iterator(...)"

    .line 19
    .line 20
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "next(...)"

    .line 34
    .line 35
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    check-cast v1, Lt1/n$d;

    .line 39
    .line 40
    invoke-virtual {v1}, Lt1/n$d;->d()Landroid/os/UserHandle;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    invoke-virtual {v1}, Lt1/n$d;->a()Landroid/content/ComponentName;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {p2, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    if-nez v2, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Lt1/n$d;->b()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v5, p0, Lt1/n;->a:Lt1/f;

    .line 69
    .line 70
    invoke-virtual {v5}, Lt1/f;->w()Ls1/T;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-interface {p3, v2, v5}, Lt1/j;->c(Ljava/lang/Object;Ls1/T;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-static {v1, v5}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_0

    .line 83
    .line 84
    invoke-virtual {v7, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_3

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    return-void

    .line 102
    :cond_4
    :goto_1
    new-instance v6, Ljava/util/ArrayDeque;

    .line 103
    .line 104
    invoke-direct {v6}, Ljava/util/ArrayDeque;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-virtual {v6, p2}, Ljava/util/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    .line 112
    .line 113
    .line 114
    new-instance v1, Lt1/n$c;

    .line 115
    .line 116
    move-object v2, p0

    .line 117
    move-object v5, p1

    .line 118
    move-object v8, p3

    .line 119
    move-object v9, p4

    .line 120
    invoke-direct/range {v1 .. v9}, Lt1/n$c;-><init>(Lt1/n;JLandroid/os/UserHandle;Ljava/util/ArrayDeque;Ljava/util/ArrayDeque;Lt1/j;Lt1/n$b;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Lt1/n$c;->a()V

    .line 124
    .line 125
    .line 126
    return-void
.end method


# virtual methods
.method public final f(Landroid/os/UserHandle;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "userHandle"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "packageName"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lt1/n;->d:Landroid/util/ArrayMap;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ljava/util/HashSet;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    :cond_0
    check-cast v0, Ljava/util/Set;

    .line 28
    .line 29
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final g()V
    .locals 10

    .line 1
    iget-object v0, p0, Lt1/n;->f:Ljava/util/HashSet;

    .line 2
    .line 3
    new-instance v1, Lt1/k;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lt1/k;-><init>(Lt1/n;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Lt1/l;

    .line 9
    .line 10
    invoke-direct {v2, v1}, Lt1/l;-><init>(Lu4/l;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->removeIf(Ljava/util/function/Predicate;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lt1/n;->f:Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lt1/n;->f:Ljava/util/HashSet;

    .line 25
    .line 26
    new-instance v7, Lt1/m;

    .line 27
    .line 28
    invoke-direct {v7}, Lt1/m;-><init>()V

    .line 29
    .line 30
    .line 31
    const/16 v8, 0x1f

    .line 32
    .line 33
    const/4 v9, 0x0

    .line 34
    const/4 v2, 0x0

    .line 35
    const/4 v3, 0x0

    .line 36
    const/4 v4, 0x0

    .line 37
    const/4 v5, 0x0

    .line 38
    const/4 v6, 0x0

    .line 39
    invoke-static/range {v1 .. v9}, Li4/m;->k0(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lu4/l;ILjava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Lt1/n;->b:Lcom/android/launcher3/util/Z1;

    .line 44
    .line 45
    sget-object v2, Lt1/f;->r:Ljava/lang/String;

    .line 46
    .line 47
    new-instance v3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, " IN ("

    .line 56
    .line 57
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v0, ")"

    .line 64
    .line 65
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/4 v2, 0x0

    .line 73
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/util/Z1;->e(Ljava/lang/String;[Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lt1/n;->f:Ljava/util/HashSet;

    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    const-string v1, "Deleting obsolete entries, count="

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string v0, "IconCacheUpdateHandler"

    .line 100
    .line 101
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    :cond_0
    return-void
.end method

.method public final k(Ljava/util/List;Lt1/j;Lt1/n$b;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;",
            "Lt1/j<",
            "TT;>;",
            "Lt1/n$b;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "apps"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "cachingLogic"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "onUpdateCallback"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {p2, v1}, Lt1/j;->g(Ljava/lang/Object;)Landroid/os/UserHandle;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {p2, v1}, Lt1/j;->h(Ljava/lang/Object;)Landroid/content/ComponentName;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    if-nez v4, :cond_1

    .line 48
    .line 49
    new-instance v4, Ljava/util/HashMap;

    .line 50
    .line 51
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :cond_1
    check-cast v4, Ljava/util/Map;

    .line 58
    .line 59
    invoke-interface {v4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    sget-object v4, Lt1/f;->o:Lt1/f$b;

    .line 63
    .line 64
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    const-string v5, "getPackageName(...)"

    .line 69
    .line 70
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v4, v3, v2}, Lt1/f$b;->a(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/util/E;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iget-object v3, p0, Lt1/n;->e:Ljava/util/HashMap;

    .line 78
    .line 79
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    if-nez v4, :cond_0

    .line 84
    .line 85
    invoke-interface {p2, v1}, Lt1/j;->f(Ljava/lang/Object;)Landroid/content/pm/ApplicationInfo;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    iget-boolean p1, p0, Lt1/n;->g:Z

    .line 94
    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/util/Map$Entry;

    .line 116
    .line 117
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    check-cast v1, Landroid/os/UserHandle;

    .line 122
    .line 123
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Ljava/util/HashMap;

    .line 128
    .line 129
    invoke-direct {p0, v1, v0, p2, p3}, Lt1/n;->l(Landroid/os/UserHandle;Ljava/util/Map;Lt1/j;Lt1/n$b;)V

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_3
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_4

    .line 146
    .line 147
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Ljava/util/Map$Entry;

    .line 152
    .line 153
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    check-cast v1, Landroid/os/UserHandle;

    .line 158
    .line 159
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Ljava/util/HashMap;

    .line 164
    .line 165
    invoke-direct {p0, v1, v0, p2, p3}, Lt1/n;->m(Landroid/os/UserHandle;Ljava/util/Map;Lt1/j;Lt1/n$b;)V

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_4
    const/4 p1, 0x0

    .line 170
    iput-boolean p1, p0, Lt1/n;->g:Z

    .line 171
    .line 172
    return-void
.end method
