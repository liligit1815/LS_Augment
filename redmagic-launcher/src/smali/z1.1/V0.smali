.class public Lz1/V0;
.super Ljava/lang/Object;
.source "GridBackupTable.java"


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/V0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/V0;->b:Landroid/database/sqlite/SQLiteDatabase;

    .line 7
    .line 8
    return-void
.end method

.method private static a(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1

    .line 1
    invoke-static {p0, p2}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {p0, p3, p4, v0, p2}, Lcom/android/launcher3/S3;->c(Landroid/database/sqlite/SQLiteDatabase;JZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string p4, "INSERT INTO "

    .line 14
    .line 15
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p2, " SELECT * FROM "

    .line 22
    .line 23
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/V0;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, LD1/t;

    .line 10
    .line 11
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-object p0, p0, Lz1/V0;->b:Landroid/database/sqlite/SQLiteDatabase;

    .line 20
    .line 21
    sget-object v2, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0, v2, p1, v0, v1}, Lz1/V0;->a(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;J)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public c(Ljava/lang/String;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/V0;->b:Landroid/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    invoke-static {v0, p1}, LE1/a;->h(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 11
    .line 12
    iget-object v1, p0, Lz1/V0;->a:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, LD1/t;

    .line 19
    .line 20
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iget-object v2, p0, Lz1/V0;->b:Landroid/database/sqlite/SQLiteDatabase;

    .line 29
    .line 30
    sget-object v3, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2, p1, v3, v0, v1}, Lz1/V0;->a(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;J)V

    .line 33
    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lz1/V0;->b:Landroid/database/sqlite/SQLiteDatabase;

    .line 38
    .line 39
    invoke-static {p0, p1}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method
