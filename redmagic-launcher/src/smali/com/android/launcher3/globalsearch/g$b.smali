.class abstract Lcom/android/launcher3/globalsearch/g$b;
.super Ljava/lang/Object;
.source "GSRecommendApp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/globalsearch/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/globalsearch/g$b$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Lcom/android/launcher3/globalsearch/g$b$a;

.field private c:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Lcom/android/launcher3/globalsearch/g$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    new-instance p4, Lcom/android/launcher3/globalsearch/g$b$a;

    .line 7
    .line 8
    invoke-direct {p4, p0, p1, p2, p3}, Lcom/android/launcher3/globalsearch/g$b$a;-><init>(Lcom/android/launcher3/globalsearch/g$b;Landroid/content/Context;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    iput-object p4, p0, Lcom/android/launcher3/globalsearch/g$b;->b:Lcom/android/launcher3/globalsearch/g$b$a;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/android/launcher3/globalsearch/g$b;->c:Z

    .line 15
    .line 16
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/globalsearch/g$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/g$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private e(Landroid/database/sqlite/SQLiteFullException;)V
    .locals 2

    .line 1
    const-string v0, "SQLiteCacheHelper"

    .line 2
    .line 3
    const-string v1, "Disk full, all write operations will be ignored"

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/android/launcher3/globalsearch/g$b;->c:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/globalsearch/g$b;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/g$b;->b:Lcom/android/launcher3/globalsearch/g$b$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/g$b;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p1

    .line 19
    goto :goto_0

    .line 20
    :catch_1
    move-exception p0

    .line 21
    const-string p1, "SQLiteCacheHelper"

    .line 22
    .line 23
    const-string p2, "Ignoring sqlite exception"

    .line 24
    .line 25
    invoke-static {p1, p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/g$b;->e(Landroid/database/sqlite/SQLiteFullException;)V

    .line 30
    .line 31
    .line 32
    :goto_1
    return-void
.end method

.method public c(Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "insertOrReplace ("

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "), mIgnoreWrites="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/android/launcher3/globalsearch/g$b;->c:Z

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "SQLiteCacheHelper"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-boolean v0, p0, Lcom/android/launcher3/globalsearch/g$b;->c:Z

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/g$b;->b:Lcom/android/launcher3/globalsearch/g$b$a;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v2, p0, Lcom/android/launcher3/globalsearch/g$b;->a:Ljava/lang/String;

    .line 45
    .line 46
    const/4 v3, 0x5

    .line 47
    invoke-virtual {v0, v2, p1, p2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catch_0
    move-exception p0

    .line 52
    goto :goto_0

    .line 53
    :catch_1
    move-exception p1

    .line 54
    goto :goto_1

    .line 55
    :goto_0
    const-string p1, "Ignoring sqlite exception"

    .line 56
    .line 57
    invoke-static {v1, p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :goto_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/g$b;->e(Landroid/database/sqlite/SQLiteFullException;)V

    .line 62
    .line 63
    .line 64
    :goto_2
    return-void
.end method

.method protected abstract d(Landroid/database/sqlite/SQLiteDatabase;)V
.end method

.method public f([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/g$b;->b:Lcom/android/launcher3/globalsearch/g$b$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/android/launcher3/globalsearch/g$b;->a:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v6, 0x0

    .line 10
    const/4 v7, 0x0

    .line 11
    move-object v3, p1

    .line 12
    move-object v4, p2

    .line 13
    move-object v5, p3

    .line 14
    move-object v8, p4

    .line 15
    move-object v9, p5

    .line 16
    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public g(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/globalsearch/g$b;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/g$b;->b:Lcom/android/launcher3/globalsearch/g$b$a;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v2, p0, Lcom/android/launcher3/globalsearch/g$b;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v2, p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p0
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    return p0

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception p1

    .line 23
    goto :goto_1

    .line 24
    :goto_0
    const-string p1, "SQLiteCacheHelper"

    .line 25
    .line 26
    const-string p2, "Ignoring sqlite exception"

    .line 27
    .line 28
    invoke-static {p1, p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    .line 30
    .line 31
    goto :goto_2

    .line 32
    :goto_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/g$b;->e(Landroid/database/sqlite/SQLiteFullException;)V

    .line 33
    .line 34
    .line 35
    :goto_2
    return v1
.end method
