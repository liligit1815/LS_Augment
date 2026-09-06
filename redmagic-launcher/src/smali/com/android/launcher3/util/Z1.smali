.class public abstract Lcom/android/launcher3/util/Z1;
.super Ljava/lang/Object;
.source "SQLiteCacheHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/Z1$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Lcom/android/launcher3/util/Z1$a;

.field private c:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Lcom/android/launcher3/util/Z1;->a:Ljava/lang/String;

    .line 5
    .line 6
    new-instance p4, Lcom/android/launcher3/util/Z1$a;

    .line 7
    .line 8
    invoke-direct {p4, p0, p1, p2, p3}, Lcom/android/launcher3/util/Z1$a;-><init>(Lcom/android/launcher3/util/Z1;Landroid/content/Context;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    iput-object p4, p0, Lcom/android/launcher3/util/Z1;->b:Lcom/android/launcher3/util/Z1$a;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/android/launcher3/util/Z1;->c:Z

    .line 15
    .line 16
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/util/Z1;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z1;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/util/Z1;Landroid/database/sqlite/SQLiteFullException;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/Z1;->h(Landroid/database/sqlite/SQLiteFullException;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h(Landroid/database/sqlite/SQLiteFullException;)V
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
    iput-boolean p1, p0, Lcom/android/launcher3/util/Z1;->c:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z1;->b:Lcom/android/launcher3/util/Z1$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lcom/android/launcher3/util/Z1$a;->d(Lcom/android/launcher3/util/Z1$a;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z1;->b:Lcom/android/launcher3/util/Z1$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/Z1;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/Z1;->b:Lcom/android/launcher3/util/Z1$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/util/Z1;->a:Ljava/lang/String;

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
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/Z1;->h(Landroid/database/sqlite/SQLiteFullException;)V

    .line 30
    .line 31
    .line 32
    :goto_1
    return-void
.end method

.method public f(Landroid/content/ContentValues;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/Z1;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/Z1;->b:Lcom/android/launcher3/util/Z1$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/util/Z1;->a:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x5

    .line 16
    invoke-virtual {v0, v1, v2, p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p1

    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception p0

    .line 23
    const-string p1, "SQLiteCacheHelper"

    .line 24
    .line 25
    const-string v0, "Ignoring sqlite exception"

    .line 26
    .line 27
    invoke-static {p1, v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/Z1;->h(Landroid/database/sqlite/SQLiteFullException;)V

    .line 32
    .line 33
    .line 34
    :goto_1
    return-void
.end method

.method protected abstract g(Landroid/database/sqlite/SQLiteDatabase;)V
.end method

.method public i([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z1;->b:Lcom/android/launcher3/util/Z1$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/android/launcher3/util/Z1;->a:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v7, 0x0

    .line 10
    const/4 v8, 0x0

    .line 11
    const/4 v6, 0x0

    .line 12
    move-object v3, p1

    .line 13
    move-object v4, p2

    .line 14
    move-object v5, p3

    .line 15
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
