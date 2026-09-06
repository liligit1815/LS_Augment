.class public LE1/g;
.super Ljava/lang/Object;
.source "RestoreDbTask.java"


# static fields
.field public static final a:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    const-string v11, "appWidgetId"

    .line 2
    .line 3
    const-string v12, "restored"

    .line 4
    .line 5
    const-string v0, "profileId"

    .line 6
    .line 7
    const-string v1, "title"

    .line 8
    .line 9
    const-string v2, "itemType"

    .line 10
    .line 11
    const-string v3, "screen"

    .line 12
    .line 13
    const-string v4, "container"

    .line 14
    .line 15
    const-string v5, "cellX"

    .line 16
    .line 17
    const-string v6, "cellY"

    .line 18
    .line 19
    const-string v7, "spanX"

    .line 20
    .line 21
    const-string v8, "spanY"

    .line 22
    .line 23
    const-string v9, "intent"

    .line 24
    .line 25
    const-string v10, "appWidgetProvider"

    .line 26
    .line 27
    filled-new-array/range {v0 .. v12}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, LE1/g;->a:[Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static A(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/F1;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/F1;->u0(Landroid/content/Context;Ljava/lang/String;)Lcom/android/launcher3/F1$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "trySettingPreviousGridAsCurrent:, oldPhoneDbFileName: "

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p2, ", oldPhoneGridOption: "

    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p2, ", previousDbs: "

    .line 29
    .line 30
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const-string v1, "RestoreDbTask"

    .line 41
    .line 42
    invoke-static {v1, p2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    const/4 p3, 0x1

    .line 50
    if-ne p2, p3, :cond_0

    .line 51
    .line 52
    iget p2, v0, Lcom/android/launcher3/F1$b;->e:I

    .line 53
    .line 54
    iget p3, p1, Lcom/android/launcher3/F1;->H0:I

    .line 55
    .line 56
    if-gt p2, p3, :cond_0

    .line 57
    .line 58
    iget p2, v0, Lcom/android/launcher3/F1$b;->d:I

    .line 59
    .line 60
    iget p3, p1, Lcom/android/launcher3/F1;->G0:I

    .line 61
    .line 62
    if-gt p2, p3, :cond_0

    .line 63
    .line 64
    const-string p0, "Keeping default db from restore as current grid"

    .line 65
    .line 66
    invoke-static {v1, p0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string p3, "Setting grid from old device as current grid: oldPhoneGridOption:"

    .line 76
    .line 77
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object p3, v0, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-static {v1, p2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object p2, v0, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/F1;->Q0(Landroid/content/Context;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)Landroid/appwidget/AppWidgetHost;
    .locals 2

    .line 1
    new-instance v0, Landroid/appwidget/AppWidgetHost;

    .line 2
    .line 3
    const/16 v1, 0x400

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/appwidget/AppWidgetHost;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static synthetic b(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "intent LIKE \'%%\' || \'%s\' || \'%%\' "

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic d(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static synthetic e(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v0, "Removed old grid db file: "

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "RestoreDbTask"

    .line 29
    .line 30
    invoke-static {p1, p0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static g(Landroid/content/Context;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/W2;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, LE1/b;

    .line 8
    .line 9
    invoke-direct {v1, p0}, LE1/b;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/util/List;

    .line 25
    .line 26
    return-object p0
.end method

.method private i(Landroid/database/sqlite/SQLiteDatabase;J)Landroid/util/LongSparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "J)",
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Landroid/util/LongSparseArray;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/util/LongSparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    filled-new-array {p2}, [Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const-string p3, "SELECT profileId from favorites WHERE profileId != ? GROUP BY profileId"

    .line 15
    .line 16
    invoke-virtual {p1, p3, p2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    const-string p2, "profileId"

    .line 27
    .line 28
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 33
    .line 34
    .line 35
    move-result-wide p2

    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, p2, p3, v0}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 44
    .line 45
    .line 46
    return-object p0

    .line 47
    :goto_1
    if-eqz p1, :cond_1

    .line 48
    .line 49
    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :catchall_1
    move-exception p1

    .line 54
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_2
    throw p0
.end method

.method private static j(Ljava/util/Collection;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, LE1/f;

    .line 6
    .line 7
    invoke-direct {v0}, LE1/f;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, " OR "

    .line 15
    .line 16
    invoke-static {v0}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/String;

    .line 25
    .line 26
    return-object p0
.end method

.method private k(Landroid/app/backup/BackupManager;J)Landroid/os/UserHandle;
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Landroid/app/backup/BackupManager;->getUserForAncestralSerialNumber(J)Landroid/os/UserHandle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static l(Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, LE1/g;->m(Lcom/android/launcher3/J3;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static m(Lcom/android/launcher3/J3;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Lcom/android/launcher3/H1;

    .line 3
    .line 4
    sget-object v1, Lcom/android/launcher3/J3;->p:Lcom/android/launcher3/X;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput-object v1, v0, v2

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/J3;->o([Lcom/android/launcher3/H1;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private static n(Lz1/k2;)V
    .locals 12

    .line 1
    const-string v1, "RestoreDbTask"

    .line 2
    .line 3
    const-string v0, "profileId"

    .line 4
    .line 5
    const-string v2, "restored"

    .line 6
    .line 7
    const-string v3, "appWidgetId"

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p0}, Lz1/k2;->B()Landroid/database/sqlite/SQLiteDatabase;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    sget-object v5, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 14
    .line 15
    filled-new-array {v3, v2, v0}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    const-string v7, "appWidgetId!=-1"

    .line 20
    .line 21
    const/4 v10, 0x0

    .line 22
    const/4 v11, 0x0

    .line 23
    const/4 v8, 0x0

    .line 24
    const/4 v9, 0x0

    .line 25
    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 26
    .line 27
    .line 28
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :try_start_1
    new-instance v4, Lcom/android/launcher3/util/x0;

    .line 30
    .line 31
    invoke-direct {v4}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v5, Lcom/android/launcher3/util/x0;

    .line 35
    .line 36
    invoke-direct {v5}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 37
    .line 38
    .line 39
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 40
    .line 41
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    if-eqz v7, :cond_0

    .line 49
    .line 50
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->isAfterLast()Z

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    if-nez v7, :cond_0

    .line 67
    .line 68
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 73
    .line 74
    .line 75
    move-result v8

    .line 76
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 77
    .line 78
    .line 79
    move-result v9

    .line 80
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v5, v8}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6, v9}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :catchall_0
    move-exception v0

    .line 94
    move-object v2, v0

    .line 95
    goto :goto_2

    .line 96
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string v2, "["

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const/4 v2, 0x0

    .line 107
    :goto_1
    invoke-virtual {v4}, Lcom/android/launcher3/util/x0;->size()I

    .line 108
    .line 109
    .line 110
    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    const-string v7, "]"

    .line 112
    .line 113
    if-ge v2, v3, :cond_1

    .line 114
    .line 115
    :try_start_2
    const-string v3, "[appWidgetId="

    .line 116
    .line 117
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v3, ", restoreFlag="

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v5, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v3, ", profileId="

    .line 140
    .line 141
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    add-int/lit8 v2, v2, 0x1

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_1
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    new-instance v2, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .line 164
    .line 165
    const-string v3, "restoreAppWidgetIds: all widget ids in database: "

    .line 166
    .line 167
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 178
    .line 179
    .line 180
    :try_start_3
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :catch_0
    move-exception v0

    .line 185
    move-object p0, v0

    .line 186
    goto :goto_4

    .line 187
    :goto_2
    if-eqz p0, :cond_2

    .line 188
    .line 189
    :try_start_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 190
    .line 191
    .line 192
    goto :goto_3

    .line 193
    :catchall_1
    move-exception v0

    .line 194
    move-object p0, v0

    .line 195
    :try_start_5
    invoke-virtual {v2, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    :cond_2
    :goto_3
    throw v2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 199
    :goto_4
    const-string v0, "Getting widget ids from the database failed"

    .line 200
    .line 201
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method public static o(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 10

    .line 1
    const-string v0, "\n"

    .line 2
    .line 3
    const-string v1, "RestoreDbTask"

    .line 4
    .line 5
    :try_start_0
    sget-object v3, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v4, LE1/g;->a:[Ljava/lang/String;

    .line 8
    .line 9
    const/4 v8, 0x0

    .line 10
    const/4 v9, 0x0

    .line 11
    const/4 v7, 0x0

    .line 12
    move-object v2, p0

    .line 13
    move-object v5, p2

    .line 14
    move-object v6, p3

    .line 15
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 16
    .line 17
    .line 18
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    invoke-interface {p0}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance p3, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-direct {p3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    array-length p1, p2

    .line 50
    const/4 v2, 0x0

    .line 51
    :goto_0
    if-ge v2, p1, :cond_1

    .line 52
    .line 53
    aget-object v3, p2, v2

    .line 54
    .line 55
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v4, "="

    .line 59
    .line 60
    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v3, " "

    .line 75
    .line 76
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :catchall_0
    move-exception v0

    .line 83
    move-object p1, v0

    .line 84
    goto :goto_2

    .line 85
    :cond_1
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_0

    .line 93
    .line 94
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {v1, p1}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string p3, "logFavoritesTable: No items found from query for \""

    .line 108
    .line 109
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string p1, "\""

    .line 116
    .line 117
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {v1, p1}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    .line 126
    .line 127
    :goto_1
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :catch_0
    move-exception v0

    .line 132
    move-object p0, v0

    .line 133
    goto :goto_4

    .line 134
    :goto_2
    if-eqz p0, :cond_3

    .line 135
    .line 136
    :try_start_3
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :catchall_1
    move-exception v0

    .line 141
    move-object p0, v0

    .line 142
    :try_start_4
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 143
    .line 144
    .line 145
    :cond_3
    :goto_3
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 146
    :goto_4
    const-string p1, "logFavoritesTable: Error reading from database"

    .line 147
    .line 148
    invoke-static {v1, p1, p0}, Lcom/android/launcher3/logging/b;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method protected static p(Landroid/content/Context;Lz1/k2;Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 16

    .line 1
    const-string v8, "profileId"

    .line 2
    .line 3
    const-string v9, "intent"

    .line 4
    .line 5
    const-string v10, "_id"

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    move-object/from16 v1, p0

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/launcher3/util/f;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/util/f;->c()Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object v11

    .line 21
    if-eqz v11, :cond_4

    .line 22
    .line 23
    invoke-interface {v11}, Ljava/util/Map;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto/16 :goto_5

    .line 30
    .line 31
    :cond_0
    :try_start_0
    sget-object v1, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 32
    .line 33
    filled-new-array {v10, v9}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const-string v0, "%s=? AND %s=? AND ( %s )"

    .line 38
    .line 39
    const-string v3, "itemType"

    .line 40
    .line 41
    invoke-interface {v11}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-static {v4}, LE1/g;->j(Ljava/util/Collection;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    filled-new-array {v3, v8, v4}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const/4 v12, 0x0

    .line 58
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    filled-new-array {v0, v4}, [Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    const/4 v6, 0x0

    .line 71
    const/4 v7, 0x0

    .line 72
    const/4 v5, 0x0

    .line 73
    move-object/from16 v0, p2

    .line 74
    .line 75
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 76
    .line 77
    .line 78
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :try_start_1
    new-instance v2, LE1/a$a;

    .line 80
    .line 81
    invoke-direct {v2, v0}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 82
    .line 83
    .line 84
    :try_start_2
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-eqz v5, :cond_2

    .line 97
    .line 98
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-static {v5, v12}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-virtual {v5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    invoke-interface {v11, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Landroid/content/pm/LauncherActivityInfo;

    .line 119
    .line 120
    if-eqz v5, :cond_1

    .line 121
    .line 122
    new-instance v6, Landroid/content/ContentValues;

    .line 123
    .line 124
    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v5}, Landroid/content/pm/LauncherActivityInfo;->getUser()Landroid/os/UserHandle;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    move-object/from16 v13, p1

    .line 132
    .line 133
    invoke-virtual {v13, v7}, Lz1/k2;->H(Landroid/os/UserHandle;)J

    .line 134
    .line 135
    .line 136
    move-result-wide v14

    .line 137
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 138
    .line 139
    .line 140
    move-result-object v7

    .line 141
    invoke-virtual {v6, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v5}, Lcom/android/launcher3/model/data/d;->R(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/Intent;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    invoke-virtual {v5, v12}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-virtual {v6, v9, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    sget-object v5, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 156
    .line 157
    const-string v7, "%s=?"

    .line 158
    .line 159
    filled-new-array {v10}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v14

    .line 163
    invoke-static {v7, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v7

    .line 167
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 168
    .line 169
    .line 170
    move-result v14

    .line 171
    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v14

    .line 175
    filled-new-array {v14}, [Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v14

    .line 179
    invoke-virtual {v0, v5, v6, v7, v14}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    goto :goto_0

    .line 183
    :catchall_0
    move-exception v0

    .line 184
    move-object v3, v0

    .line 185
    goto :goto_1

    .line 186
    :cond_1
    move-object/from16 v13, p1

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_2
    invoke-virtual {v2}, LE1/a$a;->b()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 190
    .line 191
    .line 192
    :try_start_3
    invoke-virtual {v2}, LE1/a$a;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 193
    .line 194
    .line 195
    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :catchall_1
    move-exception v0

    .line 200
    move-object v2, v0

    .line 201
    goto :goto_3

    .line 202
    :goto_1
    :try_start_5
    invoke-virtual {v2}, LE1/a$a;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 203
    .line 204
    .line 205
    goto :goto_2

    .line 206
    :catchall_2
    move-exception v0

    .line 207
    :try_start_6
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 208
    .line 209
    .line 210
    :goto_2
    throw v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 211
    :goto_3
    if-eqz v1, :cond_3

    .line 212
    .line 213
    :try_start_7
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 214
    .line 215
    .line 216
    goto :goto_4

    .line 217
    :catchall_3
    move-exception v0

    .line 218
    :try_start_8
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 219
    .line 220
    .line 221
    :cond_3
    :goto_4
    throw v2
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 222
    :catch_0
    move-exception v0

    .line 223
    const-string v1, "RestoreDbTask"

    .line 224
    .line 225
    const-string v2, "Error while overriding shortcuts"

    .line 226
    .line 227
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 228
    .line 229
    .line 230
    :cond_4
    :goto_5
    return-void
.end method

.method private static r(Landroid/content/Context;Lz1/k2;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Lz1/k2;->B()Landroid/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    const-string v0, "performRestore: starting restore from db"

    .line 6
    .line 7
    const-string v6, "RestoreDbTask"

    .line 8
    .line 9
    invoke-static {v6, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :try_start_0
    new-instance v7, LE1/a$a;

    .line 13
    .line 14
    invoke-direct {v7, v3}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    :try_start_1
    new-instance v0, LE1/g;

    .line 18
    .line 19
    invoke-direct {v0}, LE1/g;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v4, Landroid/app/backup/BackupManager;

    .line 23
    .line 24
    invoke-direct {v4, p0}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    sget-object v1, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->Companion:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;->a(Landroid/content/Context;)Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    move-object v1, p0

    .line 34
    move-object v2, p1

    .line 35
    invoke-virtual/range {v0 .. v5}, LE1/g;->y(Landroid/content/Context;Lz1/k2;Landroid/database/sqlite/SQLiteDatabase;Landroid/app/backup/BackupManager;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)I

    .line 36
    .line 37
    .line 38
    new-instance p0, LE1/e;

    .line 39
    .line 40
    invoke-direct {p0, v1}, LE1/e;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1, v2, v5, p0}, LE1/g;->w(Landroid/content/Context;Lz1/k2;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;Ljava/util/function/Supplier;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v7}, LE1/a$a;->b()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    :try_start_2
    invoke-virtual {v7}, LE1/a$a;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 51
    .line 52
    .line 53
    return p0

    .line 54
    :catch_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    goto :goto_1

    .line 57
    :catchall_0
    move-exception v0

    .line 58
    move-object p0, v0

    .line 59
    :try_start_3
    invoke-virtual {v7}, LE1/a$a;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :catchall_1
    move-exception v0

    .line 64
    move-object p1, v0

    .line 65
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    :goto_0
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 69
    :goto_1
    const-string p1, "Failed to verify db"

    .line 70
    .line 71
    invoke-static {v6, p1, p0}, Lcom/android/launcher3/logging/b;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return p0
.end method

.method public static s(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/W2;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, LE1/c;

    .line 8
    .line 9
    invoke-direct {v1, p1}, LE1/c;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, LE1/d;

    .line 17
    .line 18
    invoke-direct {v0, p0}, LE1/d;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private u(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "SELECT itemType, COUNT(*) AS count FROM favorites WHERE "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p2, " GROUP BY itemType"

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :try_start_0
    invoke-virtual {p1, p0, p3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 24
    .line 25
    .line 26
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    :cond_0
    const-string p1, "itemType"

    .line 34
    .line 35
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const-string p2, "count"

    .line 44
    .line 45
    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-interface {p0, p2}, Landroid/database/Cursor;->getInt(I)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    const-string p3, "profile_not_restored"

    .line 54
    .line 55
    invoke-virtual {p4, p1, p2, p3}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->logFavoritesItemsRestoreFailed(IILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 59
    .line 60
    .line 61
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    if-nez p1, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p1

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    :goto_0
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :goto_1
    if-eqz p0, :cond_2

    .line 72
    .line 73
    :try_start_3
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :catchall_1
    move-exception p0

    .line 78
    :try_start_4
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_2
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 82
    :catch_0
    move-exception p0

    .line 83
    const-string p1, "RestoreDbTask"

    .line 84
    .line 85
    const-string p2, "reportUnrestoredProfiles: Error reading from database"

    .line 86
    .line 87
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/logging/b;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private v(Landroid/content/Context;Lz1/k2;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;[I[ILandroid/appwidget/AppWidgetHost;)V
    .locals 24

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    move-object/from16 v3, p5

    .line 8
    .line 9
    move-object/from16 v4, p6

    .line 10
    .line 11
    invoke-static {v0}, LE1/g;->l(Landroid/content/Context;)Z

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    const-string v6, "Deleting widgetId: "

    .line 16
    .line 17
    const/4 v7, 0x0

    .line 18
    const-string v8, "RestoreDbTask"

    .line 19
    .line 20
    if-nez v5, :cond_1

    .line 21
    .line 22
    const-string v0, "Skipping widget ID remap as DB already in use"

    .line 23
    .line 24
    invoke-static {v8, v0}, Lcom/android/launcher3/logging/b;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    array-length v0, v3

    .line 28
    :goto_0
    if-ge v7, v0, :cond_0

    .line 29
    .line 30
    aget v1, v3, v7

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v8, v2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4, v1}, Landroid/appwidget/AppWidgetHost;->deleteAppWidgetId(I)V

    .line 51
    .line 52
    .line 53
    add-int/lit8 v7, v7, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    return-void

    .line 57
    :cond_1
    invoke-static {v0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    new-instance v9, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v10, "restoreAppWidgetIds: oldWidgetIds="

    .line 67
    .line 68
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-static {v2}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    invoke-virtual {v10}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v10, ", newWidgetIds="

    .line 83
    .line 84
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-static {v3}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    invoke-virtual {v10}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v10

    .line 95
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    invoke-static {v8, v9}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v1}, LE1/g;->n(Lz1/k2;)V

    .line 106
    .line 107
    .line 108
    :goto_1
    array-length v9, v2

    .line 109
    if-ge v7, v9, :cond_6

    .line 110
    .line 111
    new-instance v9, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v10, "migrating appWidgetId: "

    .line 117
    .line 118
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    aget v10, v2, v7

    .line 122
    .line 123
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v10, " => "

    .line 127
    .line 128
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    aget v10, v3, v7

    .line 132
    .line 133
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v9

    .line 140
    invoke-static {v8, v9}, Lcom/android/launcher3/logging/b;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    aget v9, v3, v7

    .line 144
    .line 145
    invoke-virtual {v5, v9}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    .line 146
    .line 147
    .line 148
    move-result-object v9

    .line 149
    invoke-static {v9}, Lz1/c2;->K(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 150
    .line 151
    .line 152
    move-result v9

    .line 153
    if-eqz v9, :cond_2

    .line 154
    .line 155
    const/4 v9, 0x4

    .line 156
    goto :goto_2

    .line 157
    :cond_2
    const/4 v9, 0x2

    .line 158
    :goto_2
    sget-object v11, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 159
    .line 160
    invoke-virtual {v11, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v11

    .line 164
    check-cast v11, LD1/t;

    .line 165
    .line 166
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 167
    .line 168
    .line 169
    move-result-object v12

    .line 170
    invoke-virtual {v11, v12}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 171
    .line 172
    .line 173
    move-result-wide v11

    .line 174
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 175
    .line 176
    .line 177
    move-result-object v13

    .line 178
    invoke-virtual {v1, v13}, Lz1/k2;->H(Landroid/os/UserHandle;)J

    .line 179
    .line 180
    .line 181
    move-result-wide v13

    .line 182
    aget v15, v2, v7

    .line 183
    .line 184
    invoke-static {v15}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v15

    .line 188
    invoke-static {v11, v12}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v11

    .line 192
    filled-new-array {v15, v11}, [Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v12

    .line 196
    new-instance v10, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 199
    .line 200
    .line 201
    const-string v2, "restoreAppWidgetIds: querying profile id="

    .line 202
    .line 203
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string v2, " with controller profile ID="

    .line 210
    .line 211
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v10, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    invoke-static {v8, v2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    new-instance v2, Lcom/android/launcher3/util/G;

    .line 225
    .line 226
    new-instance v10, Lcom/android/launcher3/util/G$a;

    .line 227
    .line 228
    const-string v11, "appWidgetId=? and (restored & 1) = 1 and profileId=?"

    .line 229
    .line 230
    invoke-direct {v10, v1, v11, v12}, Lcom/android/launcher3/util/G$a;-><init>(Lz1/k2;Ljava/lang/String;[Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    invoke-direct {v2, v0, v10}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/G$a;)V

    .line 234
    .line 235
    .line 236
    aget v10, v3, v7

    .line 237
    .line 238
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 239
    .line 240
    .line 241
    move-result-object v10

    .line 242
    const-string v11, "appWidgetId"

    .line 243
    .line 244
    invoke-virtual {v2, v11, v10}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 245
    .line 246
    .line 247
    move-result-object v2

    .line 248
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 249
    .line 250
    .line 251
    move-result-object v9

    .line 252
    const-string v10, "restored"

    .line 253
    .line 254
    invoke-virtual {v2, v10, v9}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    invoke-virtual {v2}, Lcom/android/launcher3/util/G;->b()I

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    if-nez v2, :cond_5

    .line 263
    .line 264
    const-string v2, "restoreAppWidgetIds: remapping failed since the widget is not in the database anymore"

    .line 265
    .line 266
    invoke-static {v8, v2}, Lcom/android/launcher3/logging/b;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v1}, Lz1/k2;->B()Landroid/database/sqlite/SQLiteDatabase;

    .line 270
    .line 271
    .line 272
    move-result-object v16

    .line 273
    sget-object v17, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 274
    .line 275
    filled-new-array {v11}, [Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v18

    .line 279
    filled-new-array {v15}, [Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v20

    .line 283
    const/16 v22, 0x0

    .line 284
    .line 285
    const/16 v23, 0x0

    .line 286
    .line 287
    const-string v19, "appWidgetId=?"

    .line 288
    .line 289
    const/16 v21, 0x0

    .line 290
    .line 291
    invoke-virtual/range {v16 .. v23}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    :try_start_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 296
    .line 297
    .line 298
    move-result v9

    .line 299
    if-nez v9, :cond_3

    .line 300
    .line 301
    new-instance v9, Ljava/lang/StringBuilder;

    .line 302
    .line 303
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    aget v10, v3, v7

    .line 310
    .line 311
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    const-string v10, " with old id: "

    .line 315
    .line 316
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v9

    .line 326
    invoke-static {v8, v9}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    aget v9, v3, v7

    .line 330
    .line 331
    invoke-virtual {v4, v9}, Landroid/appwidget/AppWidgetHost;->deleteAppWidgetId(I)V

    .line 332
    .line 333
    .line 334
    const-string v9, "widget_not_found"

    .line 335
    .line 336
    move-object/from16 v10, p3

    .line 337
    .line 338
    const/4 v11, 0x4

    .line 339
    invoke-virtual {v10, v11, v9}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->logSingleFavoritesItemRestoreFailed(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    .line 341
    .line 342
    goto :goto_3

    .line 343
    :catchall_0
    move-exception v0

    .line 344
    move-object v1, v0

    .line 345
    goto :goto_4

    .line 346
    :cond_3
    move-object/from16 v10, p3

    .line 347
    .line 348
    :goto_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 349
    .line 350
    .line 351
    goto :goto_6

    .line 352
    :goto_4
    if-eqz v2, :cond_4

    .line 353
    .line 354
    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 355
    .line 356
    .line 357
    goto :goto_5

    .line 358
    :catchall_1
    move-exception v0

    .line 359
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 360
    .line 361
    .line 362
    :cond_4
    :goto_5
    throw v1

    .line 363
    :cond_5
    move-object/from16 v10, p3

    .line 364
    .line 365
    :goto_6
    add-int/lit8 v7, v7, 0x1

    .line 366
    .line 367
    move-object/from16 v2, p4

    .line 368
    .line 369
    goto/16 :goto_1

    .line 370
    .line 371
    :cond_6
    invoke-virtual {v1}, Lz1/k2;->B()Landroid/database/sqlite/SQLiteDatabase;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    const-string v2, "launcher db after remap widget ids"

    .line 376
    .line 377
    const/4 v3, 0x0

    .line 378
    invoke-static {v1, v2, v3, v3}, LE1/g;->o(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    sget-object v1, Lcom/android/launcher3/P2;->h:Lcom/android/launcher3/util/I;

    .line 382
    .line 383
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    check-cast v0, Lcom/android/launcher3/P2;

    .line 388
    .line 389
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->M0()V

    .line 394
    .line 395
    .line 396
    return-void
.end method

.method public static x(Landroid/content/Context;Lz1/k2;)V
    .locals 5

    .line 1
    invoke-static {p0}, LE1/g;->l(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "RestoreDbTask"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "No restore task pending, exiting RestoreDbTask"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p0, p1}, LE1/g;->r(Landroid/content/Context;Lz1/k2;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lz1/k2;->j()V

    .line 22
    .line 23
    .line 24
    :cond_1
    sget-object p1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/android/launcher3/F1;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v2, 0x1

    .line 37
    new-array v2, v2, [Lcom/android/launcher3/H1;

    .line 38
    .line 39
    sget-object v3, Lcom/android/launcher3/J3;->p:Lcom/android/launcher3/X;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    aput-object v3, v2, v4

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/android/launcher3/J3;->y([Lcom/android/launcher3/H1;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Lz1/L0;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lz1/L0;-><init>(Landroid/content/Context;)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v3, "restoreIfNeeded: deviceGridState from context: "

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v1, v2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Lz1/L0;->d()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {p0}, LE1/g;->g(Landroid/content/Context;)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {p0, v0}, LE1/g;->s(Landroid/content/Context;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-nez v3, :cond_2

    .line 88
    .line 89
    const-string v3, "Resetting IDP to default for restore dest device"

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p0}, Lcom/android/launcher3/F1;->P0(Landroid/content/Context;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p0, p1, v0, v2}, LE1/g;->A(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/String;Ljava/util/List;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    return-void
.end method

.method public static z(Landroid/content/Context;)V
    .locals 3

    .line 1
    new-instance v0, Lz1/L0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lz1/L0;-><init>(Landroid/content/Context;)V

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
    const-string v2, "restore initiated from backup: DeviceGridState="

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "RestoreDbTask"

    .line 24
    .line 25
    invoke-static {v2, v1}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget-object v2, Lcom/android/launcher3/J3;->p:Lcom/android/launcher3/X;

    .line 33
    .line 34
    invoke-virtual {v0}, Lz1/L0;->e()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v2, v0}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    filled-new-array {v0}, [Lh4/l;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v1, v0}, Lcom/android/launcher3/J3;->u([Lh4/l;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget-object v0, Lcom/android/launcher3/J3;->r:Lcom/android/launcher3/X;

    .line 58
    .line 59
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {v0}, [Lh4/l;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Lcom/android/launcher3/J3;->u([Lh4/l;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method


# virtual methods
.method protected f(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 0

    .line 1
    const-string p0, "ALTER TABLE favorites RENAME TO favorites_old;"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p1, p2, p3, p0}, Lcom/android/launcher3/S3;->b(Landroid/database/sqlite/SQLiteDatabase;JZ)V

    .line 8
    .line 9
    .line 10
    const-string p0, "INSERT INTO favorites SELECT * FROM favorites_old;"

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "favorites_old"

    .line 16
    .line 17
    invoke-static {p1, p0}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method protected h(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string p0, "PRAGMA table_info (favorites)"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    :try_start_0
    const-string p1, "name"

    .line 9
    .line 10
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string v0, "profileId"

    .line 21
    .line 22
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const-string p1, "dflt_value"

    .line 33
    .line 34
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    .line 39
    .line 40
    .line 41
    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 43
    .line 44
    .line 45
    return-wide v0

    .line 46
    :catchall_0
    move-exception p1

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    :try_start_1
    new-instance p1, Ljava/io/InvalidObjectException;

    .line 49
    .line 50
    const-string v0, "Table does not have a profile id column"

    .line 51
    .line 52
    invoke-direct {p1, v0}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    :goto_0
    if-eqz p0, :cond_2

    .line 57
    .line 58
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :catchall_1
    move-exception p0

    .line 63
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_1
    throw p1
.end method

.method protected q(Landroid/database/sqlite/SQLiteDatabase;JJ)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "Changing profile user id from "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, " to "

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "RestoreDbTask"

    .line 27
    .line 28
    invoke-static {v0, p0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Landroid/content/ContentValues;

    .line 32
    .line 33
    invoke-direct {p0}, Landroid/content/ContentValues;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object p4

    .line 40
    const-string p5, "profileId"

    .line 41
    .line 42
    invoke-virtual {p0, p5, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 43
    .line 44
    .line 45
    sget-object p4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    filled-new-array {p2}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    const-string p3, "profileId = ?"

    .line 56
    .line 57
    invoke-virtual {p1, p4, p0, p3, p2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method protected t(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 8

    .line 1
    const-string p0, "RestoreDbTask"

    .line 2
    .line 3
    const-string v0, "Removing gaps between screenIds"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v3, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v6, 0x0

    .line 11
    const-string v7, "screen"

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const-string v4, "screen"

    .line 15
    .line 16
    const-string v5, "container = -100"

    .line 17
    .line 18
    move-object v2, p1

    .line 19
    invoke-static/range {v1 .. v7}, LE1/a;->e(ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v0, "UPDATE "

    .line 33
    .line 34
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, " SET "

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, "screen"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, " =\nCASE\n"

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p0, v1}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    xor-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->size()I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-ge v1, v4, :cond_1

    .line 69
    .line 70
    const-string v4, "WHEN "

    .line 71
    .line 72
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v4, " == "

    .line 79
    .line 80
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v1}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v4, " THEN "

    .line 91
    .line 92
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    add-int/lit8 v4, v3, 0x1

    .line 96
    .line 97
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v3, "\n"

    .line 101
    .line 102
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    add-int/lit8 v1, v1, 0x1

    .line 106
    .line 107
    move v3, v4

    .line 108
    goto :goto_0

    .line 109
    :cond_1
    const-string p0, "ELSE screen\nEND WHERE "

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string p0, "container"

    .line 115
    .line 116
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string p0, " = "

    .line 120
    .line 121
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const/16 p0, -0x64

    .line 125
    .line 126
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p0, ";"

    .line 130
    .line 131
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {v2, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method w(Landroid/content/Context;Lz1/k2;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;Ljava/util/function/Supplier;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lz1/k2;",
            "Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;",
            "Ljava/util/function/Supplier<",
            "Landroid/appwidget/AppWidgetHost;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/android/launcher3/J3;->s:Lcom/android/launcher3/X;

    .line 6
    .line 7
    sget-object v2, Lcom/android/launcher3/J3;->t:Lcom/android/launcher3/X;

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    new-array v4, v3, [Lcom/android/launcher3/H1;

    .line 11
    .line 12
    const/4 v5, 0x0

    .line 13
    aput-object v1, v4, v5

    .line 14
    .line 15
    const/4 v6, 0x1

    .line 16
    aput-object v2, v4, v6

    .line 17
    .line 18
    invoke-virtual {v0, v4}, Lcom/android/launcher3/J3;->o([Lcom/android/launcher3/H1;)Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    check-cast v4, Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v4}, Lcom/android/launcher3/util/x0;->u(Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v4}, Lcom/android/launcher3/util/x0;->A()[I

    .line 35
    .line 36
    .line 37
    move-result-object v11

    .line 38
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v4}, Lcom/android/launcher3/util/x0;->u(Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v4}, Lcom/android/launcher3/util/x0;->A()[I

    .line 49
    .line 50
    .line 51
    move-result-object v12

    .line 52
    invoke-interface/range {p4 .. p4}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    move-object v13, v4

    .line 57
    check-cast v13, Landroid/appwidget/AppWidgetHost;

    .line 58
    .line 59
    move-object v7, p0

    .line 60
    move-object v8, p1

    .line 61
    move-object/from16 v9, p2

    .line 62
    .line 63
    move-object/from16 v10, p3

    .line 64
    .line 65
    invoke-direct/range {v7 .. v13}, LE1/g;->v(Landroid/content/Context;Lz1/k2;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;[I[ILandroid/appwidget/AppWidgetHost;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    const-string p0, "RestoreDbTask"

    .line 70
    .line 71
    const-string p1, "Did not receive new app widget id map during Launcher restore"

    .line 72
    .line 73
    invoke-static {p0, p1}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :goto_0
    new-array p0, v3, [Lcom/android/launcher3/H1;

    .line 77
    .line 78
    aput-object v1, p0, v5

    .line 79
    .line 80
    aput-object v2, p0, v6

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Lcom/android/launcher3/J3;->w([Lcom/android/launcher3/H1;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method protected y(Landroid/content/Context;Lz1/k2;Landroid/database/sqlite/SQLiteDatabase;Landroid/app/backup/BackupManager;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)I
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p2

    .line 4
    .line 5
    move-object/from16 v1, p3

    .line 6
    .line 7
    const-string v2, "Old Launcher Database before sanitizing:"

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-static {v1, v2, v3, v3}, LE1/g;->o(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v6, v2}, Lz1/k2;->H(Landroid/os/UserHandle;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v7

    .line 21
    invoke-virtual {v0, v1}, LE1/g;->h(Landroid/database/sqlite/SQLiteDatabase;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v9

    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v4, "sanitizeDB: myProfileId= "

    .line 31
    .line 32
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v4, ", oldProfileId= "

    .line 39
    .line 40
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const-string v4, "RestoreDbTask"

    .line 51
    .line 52
    invoke-static {v4, v2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {v0, v1, v9, v10}, LE1/g;->i(Landroid/database/sqlite/SQLiteDatabase;J)Landroid/util/LongSparseArray;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    new-instance v11, Landroid/util/LongSparseArray;

    .line 60
    .line 61
    invoke-virtual {v2}, Landroid/util/LongSparseArray;->size()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    const/4 v12, 0x1

    .line 66
    add-int/2addr v5, v12

    .line 67
    invoke-direct {v11, v5}, Landroid/util/LongSparseArray;-><init>(I)V

    .line 68
    .line 69
    .line 70
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {v11, v9, v10, v5}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Landroid/util/LongSparseArray;->size()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    sub-int/2addr v5, v12

    .line 82
    :goto_0
    if-ltz v5, :cond_1

    .line 83
    .line 84
    invoke-virtual {v2, v5}, Landroid/util/LongSparseArray;->keyAt(I)J

    .line 85
    .line 86
    .line 87
    move-result-wide v13

    .line 88
    move-object/from16 v15, p4

    .line 89
    .line 90
    invoke-direct {v0, v15, v13, v14}, LE1/g;->k(Landroid/app/backup/BackupManager;J)Landroid/os/UserHandle;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    if-eqz v3, :cond_0

    .line 95
    .line 96
    move-object/from16 v17, v2

    .line 97
    .line 98
    invoke-virtual {v6, v3}, Lz1/k2;->H(Landroid/os/UserHandle;)J

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 103
    .line 104
    .line 105
    move-result-object v12

    .line 106
    invoke-virtual {v11, v13, v14, v12}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    new-instance v12, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    move/from16 v19, v5

    .line 115
    .line 116
    const-string v5, "sanitizeDB: managed profile id="

    .line 117
    .line 118
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v5, " should be mapped to new id="

    .line 125
    .line 126
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v12, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v4, v2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_0
    move-object/from16 v17, v2

    .line 141
    .line 142
    move/from16 v19, v5

    .line 143
    .line 144
    new-instance v2, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string v3, "sanitizeDB: No User found for old profileId, Ancestral Serial Number: "

    .line 150
    .line 151
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-static {v4, v2}, Lcom/android/launcher3/logging/b;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :goto_1
    add-int/lit8 v5, v19, -0x1

    .line 165
    .line 166
    move-object/from16 v2, v17

    .line 167
    .line 168
    const/4 v3, 0x0

    .line 169
    const/4 v12, 0x1

    .line 170
    goto :goto_0

    .line 171
    :cond_1
    invoke-virtual {v11}, Landroid/util/LongSparseArray;->size()I

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    new-array v3, v2, [Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    const/4 v12, 0x0

    .line 182
    aput-object v5, v3, v12

    .line 183
    .line 184
    add-int/lit8 v5, v2, -0x1

    .line 185
    .line 186
    :goto_2
    const/4 v13, 0x1

    .line 187
    if-lt v5, v13, :cond_2

    .line 188
    .line 189
    invoke-virtual {v11, v5}, Landroid/util/LongSparseArray;->keyAt(I)J

    .line 190
    .line 191
    .line 192
    move-result-wide v13

    .line 193
    invoke-static {v13, v14}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v13

    .line 197
    aput-object v13, v3, v5

    .line 198
    .line 199
    add-int/lit8 v5, v5, -0x1

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_2
    new-array v2, v2, [Ljava/lang/String;

    .line 203
    .line 204
    const-string v5, "?"

    .line 205
    .line 206
    invoke-static {v2, v5}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    new-instance v5, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 212
    .line 213
    .line 214
    const-string v13, "profileId NOT IN ("

    .line 215
    .line 216
    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v13, ", "

    .line 220
    .line 221
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-static {v13, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const-string v2, ")"

    .line 233
    .line 234
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    const-string v5, "items to delete from unrestored profiles:"

    .line 242
    .line 243
    invoke-static {v1, v5, v2, v3}, LE1/g;->o(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    if-eqz v5, :cond_3

    .line 251
    .line 252
    move-object/from16 v5, p5

    .line 253
    .line 254
    invoke-direct {v0, v1, v2, v3, v5}, LE1/g;->u(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)V

    .line 255
    .line 256
    .line 257
    :cond_3
    sget-object v5, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v1, v5, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 260
    .line 261
    .line 262
    move-result v13

    .line 263
    new-instance v2, Ljava/lang/StringBuilder;

    .line 264
    .line 265
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    const-string v3, " total items from unrestored user(s) were deleted"

    .line 272
    .line 273
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-static {v4, v2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    const-string v2, "KeepAllIcons"

    .line 284
    .line 285
    invoke-static {v2}, Lcom/android/launcher3/N5;->C(Ljava/lang/String;)Z

    .line 286
    .line 287
    .line 288
    move-result v2

    .line 289
    new-instance v3, Landroid/content/ContentValues;

    .line 290
    .line 291
    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 292
    .line 293
    .line 294
    const/4 v4, 0x4

    .line 295
    if-eqz v2, :cond_4

    .line 296
    .line 297
    move v5, v4

    .line 298
    :goto_3
    const/16 v18, 0x1

    .line 299
    .line 300
    goto :goto_4

    .line 301
    :cond_4
    move v5, v12

    .line 302
    goto :goto_3

    .line 303
    :goto_4
    or-int/lit8 v5, v5, 0x1

    .line 304
    .line 305
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    const-string v14, "restored"

    .line 310
    .line 311
    invoke-virtual {v3, v14, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 312
    .line 313
    .line 314
    sget-object v5, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 315
    .line 316
    const/4 v15, 0x0

    .line 317
    invoke-virtual {v1, v5, v3, v15, v15}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 318
    .line 319
    .line 320
    if-eqz v2, :cond_5

    .line 321
    .line 322
    const/16 v2, 0x8

    .line 323
    .line 324
    goto :goto_5

    .line 325
    :cond_5
    move v2, v12

    .line 326
    :goto_5
    or-int/lit8 v2, v2, 0x7

    .line 327
    .line 328
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 329
    .line 330
    .line 331
    move-result-object v2

    .line 332
    invoke-virtual {v3, v14, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 333
    .line 334
    .line 335
    sget-object v2, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 336
    .line 337
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v4

    .line 341
    filled-new-array {v4}, [Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    const-string v5, "itemType = ?"

    .line 346
    .line 347
    invoke-virtual {v1, v2, v3, v5, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 348
    .line 349
    .line 350
    new-instance v14, Landroid/util/SparseLongArray;

    .line 351
    .line 352
    invoke-virtual {v11}, Landroid/util/LongSparseArray;->size()I

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    invoke-direct {v14, v2}, Landroid/util/SparseLongArray;-><init>(I)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {v11}, Landroid/util/LongSparseArray;->size()I

    .line 360
    .line 361
    .line 362
    move-result v2

    .line 363
    const/16 v18, 0x1

    .line 364
    .line 365
    add-int/lit8 v2, v2, -0x1

    .line 366
    .line 367
    move/from16 v20, v12

    .line 368
    .line 369
    move v12, v2

    .line 370
    move/from16 v2, v20

    .line 371
    .line 372
    :goto_6
    const-wide/high16 v15, -0x8000000000000000L

    .line 373
    .line 374
    if-ltz v12, :cond_8

    .line 375
    .line 376
    invoke-virtual {v11, v12}, Landroid/util/LongSparseArray;->keyAt(I)J

    .line 377
    .line 378
    .line 379
    move-result-wide v3

    .line 380
    invoke-virtual {v11, v12}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object v5

    .line 384
    check-cast v5, Ljava/lang/Long;

    .line 385
    .line 386
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 387
    .line 388
    .line 389
    move-result-wide v0

    .line 390
    cmp-long v5, v3, v0

    .line 391
    .line 392
    if-eqz v5, :cond_7

    .line 393
    .line 394
    invoke-virtual {v11, v0, v1}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    .line 395
    .line 396
    .line 397
    move-result v5

    .line 398
    if-ltz v5, :cond_6

    .line 399
    .line 400
    invoke-virtual {v14, v2, v0, v1}, Landroid/util/SparseLongArray;->put(IJ)V

    .line 401
    .line 402
    .line 403
    add-int/lit8 v2, v2, 0x1

    .line 404
    .line 405
    add-long/2addr v0, v15

    .line 406
    :cond_6
    move v15, v2

    .line 407
    move-wide v2, v3

    .line 408
    move-wide v4, v0

    .line 409
    move-object/from16 v0, p0

    .line 410
    .line 411
    move-object/from16 v1, p3

    .line 412
    .line 413
    invoke-virtual/range {v0 .. v5}, LE1/g;->q(Landroid/database/sqlite/SQLiteDatabase;JJ)V

    .line 414
    .line 415
    .line 416
    move v2, v15

    .line 417
    :cond_7
    add-int/lit8 v12, v12, -0x1

    .line 418
    .line 419
    move-object/from16 v0, p0

    .line 420
    .line 421
    move-object/from16 v1, p3

    .line 422
    .line 423
    goto :goto_6

    .line 424
    :cond_8
    invoke-virtual {v14}, Landroid/util/SparseLongArray;->size()I

    .line 425
    .line 426
    .line 427
    move-result v0

    .line 428
    const/16 v18, 0x1

    .line 429
    .line 430
    add-int/lit8 v0, v0, -0x1

    .line 431
    .line 432
    move v11, v0

    .line 433
    :goto_7
    if-ltz v11, :cond_9

    .line 434
    .line 435
    invoke-virtual {v14, v11}, Landroid/util/SparseLongArray;->valueAt(I)J

    .line 436
    .line 437
    .line 438
    move-result-wide v4

    .line 439
    add-long v2, v4, v15

    .line 440
    .line 441
    move-object/from16 v0, p0

    .line 442
    .line 443
    move-object/from16 v1, p3

    .line 444
    .line 445
    invoke-virtual/range {v0 .. v5}, LE1/g;->q(Landroid/database/sqlite/SQLiteDatabase;JJ)V

    .line 446
    .line 447
    .line 448
    add-int/lit8 v11, v11, -0x1

    .line 449
    .line 450
    goto :goto_7

    .line 451
    :cond_9
    move-object/from16 v0, p0

    .line 452
    .line 453
    move-object/from16 v1, p3

    .line 454
    .line 455
    cmp-long v2, v7, v9

    .line 456
    .line 457
    if-eqz v2, :cond_a

    .line 458
    .line 459
    invoke-virtual {v0, v1, v7, v8}, LE1/g;->f(Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 460
    .line 461
    .line 462
    :cond_a
    invoke-static/range {p1 .. p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 463
    .line 464
    .line 465
    move-result-object v2

    .line 466
    sget-object v3, Lcom/android/launcher3/J3;->p:Lcom/android/launcher3/X;

    .line 467
    .line 468
    invoke-virtual {v2, v3}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object v2

    .line 472
    check-cast v2, Ljava/lang/Integer;

    .line 473
    .line 474
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 475
    .line 476
    .line 477
    move-result v2

    .line 478
    const/4 v3, 0x1

    .line 479
    if-eq v2, v3, :cond_b

    .line 480
    .line 481
    invoke-virtual {v0, v1}, LE1/g;->t(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 482
    .line 483
    .line 484
    :cond_b
    move-object/from16 v0, p1

    .line 485
    .line 486
    invoke-static {v0, v6, v1, v7, v8}, LE1/g;->p(Landroid/content/Context;Lz1/k2;Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 487
    .line 488
    .line 489
    return v13
.end method
