.class public Lz1/I0;
.super Lcom/android/launcher3/util/E1;
.source "DatabaseHelper.java"

# interfaces
.implements Lcom/android/launcher3/s$d;


# static fields
.field public static m:[Ljava/lang/String;


# instance fields
.field private final h:Landroid/content/Context;

.field private final i:Ljava/util/function/ToLongFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/ToLongFunction<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Ljava/lang/Runnable;

.field private final k:Ljava/util/concurrent/atomic/AtomicInteger;

.field public l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "easeFavorites"

    .line 2
    .line 3
    const-string v1, "streamerFavorites"

    .line 4
    .line 5
    const-string v2, "favorites"

    .line 6
    .line 7
    const-string v3, "doubleFavorites"

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lz1/I0;->m:[Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/ToLongFunction;Ljava/lang/Runnable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/function/ToLongFunction<",
            "Landroid/os/UserHandle;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/util/E1;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    invoke-direct {p2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Lz1/I0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    iput-object p1, p0, Lz1/I0;->h:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p3, p0, Lz1/I0;->i:Ljava/util/function/ToLongFunction;

    .line 17
    .line 18
    iput-object p4, p0, Lz1/I0;->j:Ljava/lang/Runnable;

    .line 19
    .line 20
    return-void
.end method

.method private static varargs A(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 3
    .line 4
    invoke-static {v1, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    const/4 p1, 0x0

    .line 13
    :try_start_1
    invoke-static {p0, p1}, Landroid/database/DatabaseUtils;->longForQuery(Landroid/database/sqlite/SQLiteStatement;[Ljava/lang/String;)J

    .line 14
    .line 15
    .line 16
    move-result-wide p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    long-to-int v0, p1

    .line 18
    if-ltz v0, :cond_1

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    :try_start_2
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    .line 23
    .line 24
    .line 25
    return v0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    return v0

    .line 29
    :cond_1
    :try_start_3
    new-instance p1, Ljava/lang/RuntimeException;

    .line 30
    .line 31
    const-string p2, "Error: could not query max id"

    .line 32
    .line 33
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    :try_start_4
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_1
    move-exception p0

    .line 45
    :try_start_5
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    throw p1
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_0

    .line 49
    :goto_1
    invoke-virtual {p0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string p2, "re-open"

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_3

    .line 60
    .line 61
    const-string p2, "already-closed"

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    return v0

    .line 70
    :cond_3
    throw p0
.end method

.method private F(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 1

    .line 1
    const-string p0, "_id"

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 4
    .line 5
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "SELECT MAX(%1$s) FROM %2$s"

    .line 10
    .line 11
    invoke-static {p1, v0, p0}, Lz1/I0;->A(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private I(Landroid/database/sqlite/SQLiteDatabase;I)Z
    .locals 6

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/Y0;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/I0;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-virtual {v0, p2, p0}, Lcom/android/launcher3/widget/Y0;->g(ILandroid/content/ComponentName;)Lcom/android/launcher3/widget/U;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p2, 0x0

    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    sget-object v0, Lz1/I0;->m:[Ljava/lang/String;

    .line 22
    .line 23
    array-length v1, v0

    .line 24
    move v2, p2

    .line 25
    :goto_0
    if-ge v2, v1, :cond_2

    .line 26
    .line 27
    aget-object v3, v0, v2

    .line 28
    .line 29
    const-string v4, "appWidgetProvider"

    .line 30
    .line 31
    const-string v5, "appWidgetId = -1 AND itemType = 4"

    .line 32
    .line 33
    invoke-static {p1, v3, v4, v5}, LE1/a;->f(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    iget-object v5, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 38
    .line 39
    invoke-virtual {v5}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string p2, "isIdValid: "

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p2, " has widget, do not delte, widget: "

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "DatabaseHelper"

    .line 77
    .line 78
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    const/4 p0, 0x1

    .line 82
    return p0

    .line 83
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    :goto_1
    return p2
.end method

.method private d(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z
    .locals 0

    .line 1
    :try_start_0
    new-instance p0, LE1/a$a;

    .line 2
    .line 3
    invoke-direct {p0, p1}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :try_start_1
    invoke-static {p1, p2, p3, p4}, Lz1/I0;->v(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, LE1/a$a;->b()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    .line 11
    .line 12
    :try_start_2
    invoke-virtual {p0}, LE1/a$a;->close()V
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_0

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    :try_start_3
    invoke-virtual {p0}, LE1/a$a;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_1
    move-exception p0

    .line 23
    :try_start_4
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    throw p1
    :try_end_4
    .catch Landroid/database/SQLException; {:try_start_4 .. :try_end_4} :catch_0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    const-string p1, "DatabaseHelper"

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method private static v(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)V
    .locals 7

    .line 1
    const-string v0, "DatabaseHelper"

    .line 2
    .line 3
    sget-object v1, Lz1/I0;->m:[Ljava/lang/String;

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const/4 v3, 0x0

    .line 7
    :goto_0
    if-ge v3, v2, :cond_1

    .line 8
    .line 9
    aget-object v4, v1, v3

    .line 10
    .line 11
    invoke-static {p0, v4}, LE1/a;->h(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    if-eqz v5, :cond_0

    .line 16
    .line 17
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v6, "ALTER TABLE "

    .line 23
    .line 24
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v6, " ADD COLUMN "

    .line 31
    .line 32
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v6, " INTEGER NOT NULL DEFAULT "

    .line 39
    .line 40
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v6, ";"

    .line 47
    .line 48
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-virtual {p0, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance v5, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v6, "dbUpdate tableName:"

    .line 64
    .line 65
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :catch_0
    move-exception v4

    .line 80
    const-string v5, "dbUpdate "

    .line 81
    .line 82
    invoke-static {v0, v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    .line 84
    .line 85
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    return-void
.end method

.method private w()J
    .locals 2

    .line 1
    iget-object p0, p0, Lz1/I0;->i:Ljava/util/function/ToLongFunction;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p0, v0}, Ljava/util/function/ToLongFunction;->applyAsLong(Ljava/lang/Object;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method


# virtual methods
.method protected B(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I
    .locals 0

    .line 1
    const-string p0, "_id"

    .line 2
    .line 3
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p2, "SELECT MAX(%1$s) FROM %2$s"

    .line 8
    .line 9
    invoke-static {p1, p2, p0}, Lz1/I0;->A(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public C()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 6
    .line 7
    const/16 v1, -0x64

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "screen"

    .line 14
    .line 15
    const-string v3, "container"

    .line 16
    .line 17
    filled-new-array {v2, v0, v3, v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "SELECT MAX(%1$s) FROM %2$s WHERE %3$s = %4$d AND %1$s >= 0"

    .line 22
    .line 23
    invoke-static {p0, v1, v0}, Lz1/I0;->A(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    add-int/lit8 p0, p0, 0x1

    .line 28
    .line 29
    return p0
.end method

.method protected D(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 5

    .line 1
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/I0;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, LD1/t;

    .line 10
    .line 11
    invoke-virtual {p0}, LD1/t;->p()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroid/os/UserHandle;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    new-instance v3, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v4, "update "

    .line 41
    .line 42
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    sget-object v4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v4, " set intent = replace(intent, \';l.profile="

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v1, ";\', \';\') where itemType = 0;"

    .line 59
    .line 60
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    return-void
.end method

.method protected E()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/I0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0, v1}, Lz1/I0;->F(Landroid/database/sqlite/SQLiteDatabase;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v1, -0x1

    .line 12
    invoke-virtual {v0, v1, p0}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public J(Landroid/database/sqlite/SQLiteDatabase;Lcom/android/launcher3/s;)I
    .locals 1

    .line 1
    invoke-virtual {p2, p1}, Lcom/android/launcher3/s;->p(Landroid/database/sqlite/SQLiteDatabase;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object v0, p0, Lz1/I0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lz1/I0;->F(Landroid/database/sqlite/SQLiteDatabase;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string p1, "loadFavorites count:"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "DatabaseHelper"

    .line 32
    .line 33
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return p2
.end method

.method public L()Lcom/android/launcher3/widget/l0;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/I0;->h:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/l0;->L(Landroid/content/Context;)Lcom/android/launcher3/widget/l0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public M(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lz1/I0;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "hotseat_restore_backup"

    .line 6
    .line 7
    invoke-static {p1, v0}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lz1/I0;->l:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public P(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 23

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "]"

    .line 4
    .line 5
    const-string v3, "["

    .line 6
    .line 7
    const-string v4, ","

    .line 8
    .line 9
    const-string v5, "DatabaseHelper"

    .line 10
    .line 11
    invoke-virtual {v1}, Lz1/I0;->L()Lcom/android/launcher3/widget/l0;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    :try_start_0
    invoke-virtual {v6}, Lcom/android/launcher3/widget/l0;->z()[I

    .line 16
    .line 17
    .line 18
    move-result-object v7
    :try_end_0
    .catch Ljava/lang/IncompatibleClassChangeError; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    :try_start_1
    const-string v10, "favorites"

    .line 20
    .line 21
    const-string v11, "appWidgetId"

    .line 22
    .line 23
    const-string v12, "itemType=4"

    .line 24
    .line 25
    const/4 v13, 0x0

    .line 26
    const/4 v14, 0x0

    .line 27
    const/4 v8, 0x0

    .line 28
    move-object/from16 v9, p1

    .line 29
    .line 30
    invoke-static/range {v8 .. v14}, LE1/a;->e(ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 35
    .line 36
    .line 37
    move-result-object v15

    .line 38
    const-string v10, "doubleFavorites"

    .line 39
    .line 40
    const-string v11, "appWidgetId"

    .line 41
    .line 42
    const-string v12, "itemType=4"

    .line 43
    .line 44
    const/4 v13, 0x0

    .line 45
    const/4 v14, 0x0

    .line 46
    const/4 v8, 0x0

    .line 47
    move-object/from16 v9, p1

    .line 48
    .line 49
    invoke-static/range {v8 .. v14}, LE1/a;->e(ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    const-string v10, "easeFavorites"

    .line 58
    .line 59
    const-string v11, "appWidgetId"

    .line 60
    .line 61
    const-string v12, "itemType=4"

    .line 62
    .line 63
    const/4 v13, 0x0

    .line 64
    const/4 v14, 0x0

    .line 65
    move-object v9, v8

    .line 66
    const/4 v8, 0x0

    .line 67
    move-object/from16 v16, v2

    .line 68
    .line 69
    move-object v2, v9

    .line 70
    move-object/from16 v9, p1

    .line 71
    .line 72
    invoke-static/range {v8 .. v14}, LE1/a;->e(ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    const-string v10, "streamerFavorites"

    .line 81
    .line 82
    const-string v11, "appWidgetId"

    .line 83
    .line 84
    const-string v12, "itemType=4"

    .line 85
    .line 86
    const/4 v13, 0x0

    .line 87
    const/4 v14, 0x0

    .line 88
    move-object v9, v8

    .line 89
    const/4 v8, 0x0

    .line 90
    move-object/from16 v17, v3

    .line 91
    .line 92
    move-object v3, v9

    .line 93
    move-object/from16 v9, p1

    .line 94
    .line 95
    invoke-static/range {v8 .. v14}, LE1/a;->e(ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    const-string v10, "conciseFavorites"

    .line 104
    .line 105
    const-string v11, "appWidgetId"

    .line 106
    .line 107
    const-string v12, "itemType=4"

    .line 108
    .line 109
    const/4 v13, 0x0

    .line 110
    const/4 v14, 0x0

    .line 111
    move-object v9, v8

    .line 112
    const/4 v8, 0x0

    .line 113
    move-object/from16 v18, v4

    .line 114
    .line 115
    move-object v4, v9

    .line 116
    move-object/from16 v9, p1

    .line 117
    .line 118
    invoke-static/range {v8 .. v14}, LE1/a;->e(ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {v0}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 123
    .line 124
    .line 125
    move-result-object v8

    .line 126
    new-instance v9, Lcom/android/launcher3/util/z0;

    .line 127
    .line 128
    invoke-direct {v9}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v9, v15}, Lcom/android/launcher3/util/z0;->addAll(Lcom/android/launcher3/util/z0;)Lcom/android/launcher3/util/z0;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v9, v2}, Lcom/android/launcher3/util/z0;->addAll(Lcom/android/launcher3/util/z0;)Lcom/android/launcher3/util/z0;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v9, v3}, Lcom/android/launcher3/util/z0;->addAll(Lcom/android/launcher3/util/z0;)Lcom/android/launcher3/util/z0;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v9, v4}, Lcom/android/launcher3/util/z0;->addAll(Lcom/android/launcher3/util/z0;)Lcom/android/launcher3/util/z0;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v9, v8}, Lcom/android/launcher3/util/z0;->addAll(Lcom/android/launcher3/util/z0;)Lcom/android/launcher3/util/z0;

    .line 144
    .line 145
    .line 146
    array-length v10, v7

    .line 147
    const/4 v12, 0x0

    .line 148
    const/4 v13, 0x0

    .line 149
    :goto_0
    if-ge v12, v10, :cond_6

    .line 150
    .line 151
    aget v0, v7, v12

    .line 152
    .line 153
    invoke-virtual {v15, v0}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 154
    .line 155
    .line 156
    move-result v14

    .line 157
    if-nez v14, :cond_5

    .line 158
    .line 159
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 160
    .line 161
    .line 162
    move-result v14

    .line 163
    if-nez v14, :cond_5

    .line 164
    .line 165
    invoke-virtual {v3, v0}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 166
    .line 167
    .line 168
    move-result v14

    .line 169
    if-nez v14, :cond_5

    .line 170
    .line 171
    invoke-virtual {v4, v0}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 172
    .line 173
    .line 174
    move-result v14

    .line 175
    if-nez v14, :cond_5

    .line 176
    .line 177
    invoke-virtual {v8, v0}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 178
    .line 179
    .line 180
    move-result v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    if-nez v14, :cond_5

    .line 182
    .line 183
    move-object/from16 v14, p1

    .line 184
    .line 185
    :try_start_2
    invoke-direct {v1, v14, v0}, Lz1/I0;->I(Landroid/database/sqlite/SQLiteDatabase;I)Z

    .line 186
    .line 187
    .line 188
    move-result v19

    .line 189
    if-nez v19, :cond_4

    .line 190
    .line 191
    iget-object v11, v1, Lz1/I0;->h:Landroid/content/Context;

    .line 192
    .line 193
    invoke-static {v11, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->B(Landroid/content/Context;I)Z

    .line 194
    .line 195
    .line 196
    move-result v11

    .line 197
    if-nez v11, :cond_4

    .line 198
    .line 199
    iget-object v11, v1, Lz1/I0;->h:Landroid/content/Context;

    .line 200
    .line 201
    invoke-static {v11, v0}, Lcom/android/launcher3/widget/suggest/g;->f(Landroid/content/Context;I)Z

    .line 202
    .line 203
    .line 204
    move-result v11

    .line 205
    if-nez v11, :cond_4

    .line 206
    .line 207
    iget-object v11, v1, Lz1/I0;->h:Landroid/content/Context;

    .line 208
    .line 209
    invoke-static {v11, v0}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->j(Landroid/content/Context;I)Z

    .line 210
    .line 211
    .line 212
    move-result v11

    .line 213
    if-nez v11, :cond_4

    .line 214
    .line 215
    const/4 v11, -0x2

    .line 216
    if-eq v0, v11, :cond_4

    .line 217
    .line 218
    new-instance v11, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 221
    .line 222
    .line 223
    move-object/from16 v20, v2

    .line 224
    .line 225
    :try_start_3
    const-string v2, "Deleting invalid widget "

    .line 226
    .line 227
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-static {v5, v2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    new-instance v2, Lcom/android/launcher3/widget/Y0;

    .line 241
    .line 242
    iget-object v11, v1, Lz1/I0;->h:Landroid/content/Context;

    .line 243
    .line 244
    invoke-direct {v2, v11}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 245
    .line 246
    .line 247
    const/4 v11, 0x0

    .line 248
    invoke-virtual {v2, v0, v11}, Lcom/android/launcher3/widget/Y0;->g(ILandroid/content/ComponentName;)Lcom/android/launcher3/widget/U;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    if-eqz v2, :cond_0

    .line 253
    .line 254
    iget-object v11, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 255
    .line 256
    if-eqz v11, :cond_0

    .line 257
    .line 258
    move-object/from16 v21, v3

    .line 259
    .line 260
    :try_start_4
    new-instance v3, Lcom/android/launcher3/util/E;
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 261
    .line 262
    move-object/from16 v22, v4

    .line 263
    .line 264
    :try_start_5
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    invoke-direct {v3, v11, v4}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 269
    .line 270
    .line 271
    iget-object v4, v1, Lz1/I0;->h:Landroid/content/Context;

    .line 272
    .line 273
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 274
    .line 275
    .line 276
    move-result-object v4

    .line 277
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 278
    .line 279
    .line 280
    move-result-object v4
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 281
    const/4 v11, 0x0

    .line 282
    :try_start_6
    invoke-virtual {v4, v3, v11}, Lcom/android/launcher3/H5;->t(Lcom/android/launcher3/util/E;Z)Lcom/android/launcher3/H5$a;

    .line 283
    .line 284
    .line 285
    move-result-object v3

    .line 286
    if-eqz v3, :cond_1

    .line 287
    .line 288
    new-instance v3, Ljava/lang/StringBuilder;

    .line 289
    .line 290
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 291
    .line 292
    .line 293
    const-string v4, "removeGhostWidgets, not Deleting invalid widget:"

    .line 294
    .line 295
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    const-string v0, " info.provider:"

    .line 302
    .line 303
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    iget-object v0, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 307
    .line 308
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-static {v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    goto :goto_7

    .line 319
    :catchall_0
    move-exception v0

    .line 320
    goto/16 :goto_8

    .line 321
    .line 322
    :catch_0
    move-exception v0

    .line 323
    goto :goto_6

    .line 324
    :catch_1
    move-exception v0

    .line 325
    :goto_1
    const/4 v11, 0x0

    .line 326
    goto :goto_6

    .line 327
    :catch_2
    move-exception v0

    .line 328
    :goto_2
    move-object/from16 v22, v4

    .line 329
    .line 330
    goto :goto_1

    .line 331
    :cond_0
    move-object/from16 v21, v3

    .line 332
    .line 333
    move-object/from16 v22, v4

    .line 334
    .line 335
    const/4 v11, 0x0

    .line 336
    goto :goto_4

    .line 337
    :catch_3
    move-exception v0

    .line 338
    :goto_3
    move-object/from16 v21, v3

    .line 339
    .line 340
    goto :goto_2

    .line 341
    :cond_1
    :goto_4
    invoke-static {}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->l()Z

    .line 342
    .line 343
    .line 344
    move-result v2

    .line 345
    if-eqz v2, :cond_2

    .line 346
    .line 347
    iget-object v2, v1, Lz1/I0;->h:Landroid/content/Context;

    .line 348
    .line 349
    invoke-static {v2, v0}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->q(Landroid/content/Context;I)V

    .line 350
    .line 351
    .line 352
    :cond_2
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->G()Z

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    if-eqz v2, :cond_3

    .line 357
    .line 358
    iget-object v2, v1, Lz1/I0;->h:Landroid/content/Context;

    .line 359
    .line 360
    invoke-static {v2, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->Z(Landroid/content/Context;I)V

    .line 361
    .line 362
    .line 363
    :cond_3
    invoke-virtual {v6, v0}, Lcom/android/launcher3/widget/l0;->x(I)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 364
    .line 365
    .line 366
    const/4 v13, 0x1

    .line 367
    goto :goto_7

    .line 368
    :catch_4
    move-exception v0

    .line 369
    move-object/from16 v20, v2

    .line 370
    .line 371
    goto :goto_3

    .line 372
    :cond_4
    :goto_5
    move-object/from16 v20, v2

    .line 373
    .line 374
    move-object/from16 v21, v3

    .line 375
    .line 376
    move-object/from16 v22, v4

    .line 377
    .line 378
    const/4 v11, 0x0

    .line 379
    goto :goto_7

    .line 380
    :goto_6
    :try_start_7
    const-string v2, "removeGhostWidgets "

    .line 381
    .line 382
    invoke-static {v5, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 383
    .line 384
    .line 385
    goto :goto_7

    .line 386
    :cond_5
    move-object/from16 v14, p1

    .line 387
    .line 388
    goto :goto_5

    .line 389
    :goto_7
    add-int/lit8 v12, v12, 0x1

    .line 390
    .line 391
    move-object/from16 v2, v20

    .line 392
    .line 393
    move-object/from16 v3, v21

    .line 394
    .line 395
    move-object/from16 v4, v22

    .line 396
    .line 397
    goto/16 :goto_0

    .line 398
    .line 399
    :cond_6
    if-eqz v13, :cond_7

    .line 400
    .line 401
    invoke-static {v7}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    new-instance v1, Lz1/H0;

    .line 406
    .line 407
    invoke-direct {v1}, Lz1/H0;-><init>()V

    .line 408
    .line 409
    .line 410
    invoke-interface {v0, v1}, Ljava/util/stream/IntStream;->mapToObj(Ljava/util/function/IntFunction;)Ljava/util/stream/Stream;

    .line 411
    .line 412
    .line 413
    move-result-object v0

    .line 414
    move-object/from16 v1, v16

    .line 415
    .line 416
    move-object/from16 v2, v17

    .line 417
    .line 418
    move-object/from16 v3, v18

    .line 419
    .line 420
    invoke-static {v3, v2, v1}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    check-cast v0, Ljava/lang/String;

    .line 429
    .line 430
    invoke-virtual {v9}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 431
    .line 432
    .line 433
    move-result-object v4

    .line 434
    invoke-virtual {v4}, Lcom/android/launcher3/util/x0;->A()[I

    .line 435
    .line 436
    .line 437
    move-result-object v4

    .line 438
    invoke-static {v4}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    .line 439
    .line 440
    .line 441
    move-result-object v4

    .line 442
    new-instance v7, Lz1/H0;

    .line 443
    .line 444
    invoke-direct {v7}, Lz1/H0;-><init>()V

    .line 445
    .line 446
    .line 447
    invoke-interface {v4, v7}, Ljava/util/stream/IntStream;->mapToObj(Ljava/util/function/IntFunction;)Ljava/util/stream/Stream;

    .line 448
    .line 449
    .line 450
    move-result-object v4

    .line 451
    invoke-static {v3, v2, v1}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 452
    .line 453
    .line 454
    move-result-object v1

    .line 455
    invoke-interface {v4, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    move-result-object v1

    .line 459
    check-cast v1, Ljava/lang/String;

    .line 460
    .line 461
    new-instance v2, Ljava/lang/StringBuilder;

    .line 462
    .line 463
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 464
    .line 465
    .line 466
    const-string v3, "One or more widgets was removed:  allLauncherHostWidgetIds="

    .line 467
    .line 468
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    .line 473
    .line 474
    const-string v0, ", allValidLauncherDbWidgetIds="

    .line 475
    .line 476
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    invoke-static {v5, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 487
    .line 488
    .line 489
    :cond_7
    invoke-virtual {v6}, Lcom/android/launcher3/widget/l0;->y()V

    .line 490
    .line 491
    .line 492
    return-void

    .line 493
    :catch_5
    move-exception v0

    .line 494
    :try_start_8
    const-string v1, "getAppWidgetIds not supported"

    .line 495
    .line 496
    invoke-static {v5, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 497
    .line 498
    .line 499
    invoke-virtual {v6}, Lcom/android/launcher3/widget/l0;->y()V

    .line 500
    .line 501
    .line 502
    return-void

    .line 503
    :goto_8
    invoke-virtual {v6}, Lcom/android/launcher3/widget/l0;->y()V

    .line 504
    .line 505
    .line 506
    throw v0
.end method

.method T(Landroid/database/sqlite/SQLiteDatabase;Z)Z
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    new-instance v0, LE1/a$a;

    .line 3
    .line 4
    invoke-direct {v0, p1}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    :try_start_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "ALTER TABLE "

    .line 15
    .line 16
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    sget-object v1, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, " ADD COLUMN rank INTEGER NOT NULL DEFAULT 0;"

    .line 25
    .line 26
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_2

    .line 39
    :cond_0
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v1, "SELECT container, MAX(cellX) FROM "

    .line 45
    .line 46
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    sget-object v1, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, " WHERE container IN (SELECT _id FROM "

    .line 55
    .line 56
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    sget-object v1, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, " WHERE itemType = ?) GROUP BY container;"

    .line 65
    .line 66
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const/4 v1, 0x2

    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    filled-new-array {v1}, [Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p1, p2, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    :goto_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    const/4 v2, 0x1

    .line 91
    if-eqz v1, :cond_1

    .line 92
    .line 93
    new-instance v1, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string v3, "UPDATE "

    .line 99
    .line 100
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    sget-object v3, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v3, " SET rank=cellX+(cellY*?) WHERE container=? AND cellX IS NOT NULL AND cellY IS NOT NULL;"

    .line 109
    .line 110
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-interface {p2, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 118
    .line 119
    .line 120
    move-result-wide v2

    .line 121
    const-wide/16 v4, 0x1

    .line 122
    .line 123
    add-long/2addr v2, v4

    .line 124
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-interface {p2, p0}, Landroid/database/Cursor;->getLong(I)J

    .line 129
    .line 130
    .line 131
    move-result-wide v3

    .line 132
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_1
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0}, LE1/a$a;->b()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 148
    .line 149
    .line 150
    :try_start_2
    invoke-virtual {v0}, LE1/a$a;->close()V
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_0

    .line 151
    .line 152
    .line 153
    return v2

    .line 154
    :catch_0
    move-exception p1

    .line 155
    goto :goto_4

    .line 156
    :goto_2
    :try_start_3
    invoke-virtual {v0}, LE1/a$a;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 157
    .line 158
    .line 159
    goto :goto_3

    .line 160
    :catchall_1
    move-exception p2

    .line 161
    :try_start_4
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 162
    .line 163
    .line 164
    :goto_3
    throw p1
    :try_end_4
    .catch Landroid/database/SQLException; {:try_start_4 .. :try_end_4} :catch_0

    .line 165
    :goto_4
    const-string p2, "DatabaseHelper"

    .line 166
    .line 167
    invoke-virtual {p1}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 172
    .line 173
    .line 174
    return p0
.end method

.method public b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lz1/I0;->t(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()I
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/I0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lz1/I0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 17
    .line 18
    const-string v0, "Error: max item id was not initialized"

    .line 19
    .line 20
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0
.end method

.method public e(Landroid/content/ContentValues;)V
    .locals 1

    .line 1
    const-string v0, "_id"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Lz1/I0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    new-instance v0, Lz1/G0;

    .line 14
    .line 15
    invoke-direct {v0}, Lz1/G0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->accumulateAndGet(ILjava/util/function/IntBinaryOperator;)I

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method g(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 12

    .line 1
    const-string v1, "DatabaseHelper"

    .line 2
    .line 3
    const-string v0, "intent"

    .line 4
    .line 5
    const-string v2, "_id"

    .line 6
    .line 7
    :try_start_0
    new-instance v3, LE1/a$a;

    .line 8
    .line 9
    invoke-direct {v3, p1}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 10
    .line 11
    .line 12
    :try_start_1
    sget-object v5, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 13
    .line 14
    filled-new-array {v2, v0}, [Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    new-instance v4, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v7, "itemType=1 AND profileId="

    .line 24
    .line 25
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lz1/I0;->w()J

    .line 29
    .line 30
    .line 31
    move-result-wide v7

    .line 32
    invoke-virtual {v4, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    const/4 v10, 0x0

    .line 40
    const/4 v11, 0x0

    .line 41
    const/4 v8, 0x0

    .line 42
    const/4 v9, 0x0

    .line 43
    move-object v4, p1

    .line 44
    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 45
    .line 46
    .line 47
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 48
    :try_start_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v5, "UPDATE "

    .line 54
    .line 55
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    sget-object v5, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v5, " SET itemType="

    .line 64
    .line 65
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v6, " WHERE _id=?"

    .line 73
    .line 74
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {v4, p1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 82
    .line 83
    .line 84
    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 85
    :try_start_3
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 103
    :try_start_4
    invoke-static {v0, v5}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 104
    .line 105
    .line 106
    move-result-object v0
    :try_end_4
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 107
    :try_start_5
    invoke-static {v0}, Lcom/android/launcher3/util/J1;->i(Landroid/content/Intent;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_0

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    const/4 v6, 0x1

    .line 119
    int-to-long v7, v0

    .line 120
    invoke-virtual {p1, v6, v7, v8}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :catchall_0
    move-exception v0

    .line 128
    move-object v2, v0

    .line 129
    goto :goto_2

    .line 130
    :catch_0
    move-exception v0

    .line 131
    const-string v6, "Unable to parse intent"

    .line 132
    .line 133
    invoke-static {v1, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_1
    invoke-virtual {v3}, LE1/a$a;->b()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 138
    .line 139
    .line 140
    if-eqz p1, :cond_2

    .line 141
    .line 142
    :try_start_6
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :catchall_1
    move-exception v0

    .line 147
    move-object p1, v0

    .line 148
    goto :goto_4

    .line 149
    :cond_2
    :goto_1
    :try_start_7
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 150
    .line 151
    .line 152
    :try_start_8
    invoke-virtual {v3}, LE1/a$a;->close()V
    :try_end_8
    .catch Landroid/database/SQLException; {:try_start_8 .. :try_end_8} :catch_1

    .line 153
    .line 154
    .line 155
    goto :goto_9

    .line 156
    :catch_1
    move-exception v0

    .line 157
    move-object p0, v0

    .line 158
    goto :goto_8

    .line 159
    :catchall_2
    move-exception v0

    .line 160
    move-object p0, v0

    .line 161
    goto :goto_6

    .line 162
    :goto_2
    if-eqz p1, :cond_3

    .line 163
    .line 164
    :try_start_9
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 165
    .line 166
    .line 167
    goto :goto_3

    .line 168
    :catchall_3
    move-exception v0

    .line 169
    move-object p1, v0

    .line 170
    :try_start_a
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 171
    .line 172
    .line 173
    :cond_3
    :goto_3
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 174
    :goto_4
    if-eqz p0, :cond_4

    .line 175
    .line 176
    :try_start_b
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 177
    .line 178
    .line 179
    goto :goto_5

    .line 180
    :catchall_4
    move-exception v0

    .line 181
    move-object p0, v0

    .line 182
    :try_start_c
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 183
    .line 184
    .line 185
    :cond_4
    :goto_5
    throw p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 186
    :goto_6
    :try_start_d
    invoke-virtual {v3}, LE1/a$a;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 187
    .line 188
    .line 189
    goto :goto_7

    .line 190
    :catchall_5
    move-exception v0

    .line 191
    move-object p1, v0

    .line 192
    :try_start_e
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    :goto_7
    throw p0
    :try_end_e
    .catch Landroid/database/SQLException; {:try_start_e .. :try_end_e} :catch_1

    .line 196
    :goto_8
    const-string p1, "Error deduping shortcuts"

    .line 197
    .line 198
    invoke-static {v1, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 199
    .line 200
    .line 201
    :goto_9
    return-void
.end method

.method public j(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 1
    new-instance v0, LE1/a$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v1, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1, v1}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v1, "workspaceScreens"

    .line 12
    .line 13
    invoke-static {p1, v1}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lz1/I0;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, LE1/a$a;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, LE1/a$a;->close()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    :try_start_1
    invoke-virtual {v0}, LE1/a$a;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_1
    move-exception p1

    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    :goto_0
    throw p0
.end method

.method protected n(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6

    .line 1
    new-instance v0, LE1/a$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v1, Lz1/I0;->m:[Ljava/lang/String;

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    const/4 v3, 0x0

    .line 10
    :goto_0
    if-ge v3, v2, :cond_1

    .line 11
    .line 12
    aget-object v4, v1, v3

    .line 13
    .line 14
    invoke-static {p1, v4}, LE1/a;->h(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    invoke-static {p1, v4}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_2

    .line 26
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string v1, "workspaceScreens"

    .line 30
    .line 31
    invoke-static {p1, v1}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lz1/I0;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 35
    .line 36
    .line 37
    const-string p0, "DatabaseHelper"

    .line 38
    .line 39
    const-string p1, "createEmptyDBZTE"

    .line 40
    .line 41
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, LE1/a$a;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, LE1/a$a;->close()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :goto_2
    :try_start_1
    invoke-virtual {v0}, LE1/a$a;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 52
    .line 53
    .line 54
    goto :goto_3

    .line 55
    :catchall_1
    move-exception p1

    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    :goto_3
    throw p0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3

    .line 1
    const-string v0, "DatabaseHelper"

    .line 2
    .line 3
    const-string v1, "creating new launcher database"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lz1/I0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lz1/I0;->w()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {p1, v0, v1, v2}, Lcom/android/launcher3/S3;->b(Landroid/database/sqlite/SQLiteDatabase;JZ)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lz1/I0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    invoke-direct {p0, p1}, Lz1/I0;->F(Landroid/database/sqlite/SQLiteDatabase;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lz1/I0;->j:Ljava/lang/Runnable;

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lz1/I0;->h:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "downgrade_schema.json"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lz1/J0;->b(Ljava/io/File;)Lz1/J0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1, p2, p3}, Lz1/J0;->a(Landroid/database/sqlite/SQLiteDatabase;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception v0

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "Unable to downgrade from: "

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p2, " to "

    .line 32
    .line 33
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p2, ". Wiping database."

    .line 40
    .line 41
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    const-string p3, "DatabaseHelper"

    .line 49
    .line 50
    invoke-static {p3, p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lz1/I0;->j(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lz1/I0;->h:Landroid/content/Context;

    .line 5
    .line 6
    const-string v1, "downgrade_schema.json"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lz1/I0;->D(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/16 p1, 0x20

    .line 22
    .line 23
    iget-object p0, p0, Lz1/I0;->h:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {v0, p1, p0}, Lz1/J0;->d(Ljava/io/File;ILandroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 9

    .line 1
    new-instance p3, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "onUpgrade triggered: "

    .line 7
    .line 8
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    const-string v1, "DatabaseHelper"

    .line 19
    .line 20
    invoke-static {v1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const-string p3, "screen"

    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    packed-switch p2, :pswitch_data_0

    .line 28
    .line 29
    .line 30
    :goto_0
    move-object v3, p1

    .line 31
    goto/16 :goto_8

    .line 32
    .line 33
    :pswitch_0
    return-void

    .line 34
    :pswitch_1
    move-object v3, p1

    .line 35
    goto/16 :goto_4

    .line 36
    .line 37
    :pswitch_2
    move-object v3, p1

    .line 38
    goto/16 :goto_3

    .line 39
    .line 40
    :pswitch_3
    move-object v3, p1

    .line 41
    goto/16 :goto_2

    .line 42
    .line 43
    :pswitch_4
    :try_start_0
    new-instance p2, LE1/a$a;

    .line 44
    .line 45
    invoke-direct {p2, p1}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    :try_start_1
    const-string v0, "ALTER TABLE favorites ADD COLUMN appWidgetProvider TEXT;"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2}, LE1/a$a;->b()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    .line 55
    .line 56
    :try_start_2
    invoke-virtual {p2}, LE1/a$a;->close()V
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_0

    .line 57
    .line 58
    .line 59
    :pswitch_5
    const-string p2, "modified"

    .line 60
    .line 61
    invoke-direct {p0, p1, p2, v2, v3}, Lz1/I0;->d(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    :pswitch_6
    const-string p2, "restored"

    .line 69
    .line 70
    invoke-direct {p0, p1, p2, v2, v3}, Lz1/I0;->d(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    :pswitch_7
    const-string p2, "profileId"

    .line 78
    .line 79
    invoke-direct {p0}, Lz1/I0;->w()J

    .line 80
    .line 81
    .line 82
    move-result-wide v4

    .line 83
    invoke-direct {p0, p1, p2, v4, v5}, Lz1/I0;->d(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-nez p2, :cond_2

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    :pswitch_8
    const/4 p2, 0x1

    .line 91
    invoke-virtual {p0, p1, p2}, Lz1/I0;->T(Landroid/database/sqlite/SQLiteDatabase;Z)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-nez p2, :cond_3

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    :pswitch_9
    const-string p2, "options"

    .line 99
    .line 100
    invoke-direct {p0, p1, p2, v2, v3}, Lz1/I0;->d(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    if-nez p2, :cond_4

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_4
    :pswitch_a
    invoke-virtual {p0, p1}, Lz1/I0;->g(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 108
    .line 109
    .line 110
    :pswitch_b
    const/4 v7, 0x0

    .line 111
    const-string v8, "screenRank"

    .line 112
    .line 113
    const/4 v2, 0x0

    .line 114
    const-string v4, "workspaceScreens"

    .line 115
    .line 116
    const-string v5, "_id"

    .line 117
    .line 118
    const/4 v6, 0x0

    .line 119
    move-object v3, p1

    .line 120
    invoke-static/range {v2 .. v8}, LE1/a;->e(ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->A()[I

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-static {p2}, Ljava/util/Arrays;->sort([I)V

    .line 129
    .line 130
    .line 131
    const-string v0, ""

    .line 132
    .line 133
    :goto_1
    array-length v4, p2

    .line 134
    if-ge v2, v4, :cond_6

    .line 135
    .line 136
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    aget v5, p2, v2

    .line 141
    .line 142
    if-eq v4, v5, :cond_5

    .line 143
    .line 144
    new-instance v4, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 153
    .line 154
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    aget v6, p2, v2

    .line 163
    .line 164
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    filled-new-array {p3, v5, v6}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    const-string v6, " WHEN %1$s=%2$d THEN %3$d"

    .line 173
    .line 174
    invoke-static {v0, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    if-nez p1, :cond_7

    .line 193
    .line 194
    sget-object p1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 195
    .line 196
    sget-object p2, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 197
    .line 198
    const/16 v2, -0x64

    .line 199
    .line 200
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    const-string v4, "container"

    .line 205
    .line 206
    filled-new-array {p2, p3, v0, v4, v2}, [Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    const-string v0, "UPDATE %1$s SET %2$s=CASE %3$s ELSE %2$s END WHERE %4$s = %5$d"

    .line 211
    .line 212
    invoke-static {p1, v0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {v3, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    :cond_7
    const-string p1, "workspaceScreens"

    .line 220
    .line 221
    invoke-static {v3, p1}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :goto_2
    const-string p1, "appWidgetSource"

    .line 225
    .line 226
    const-wide/16 v4, -0x1

    .line 227
    .line 228
    invoke-direct {p0, v3, p1, v4, v5}, Lz1/I0;->d(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-nez p1, :cond_8

    .line 233
    .line 234
    goto :goto_8

    .line 235
    :cond_8
    :goto_3
    sget-object p1, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 236
    .line 237
    const/16 p2, -0x309

    .line 238
    .line 239
    const/16 v0, -0x30a

    .line 240
    .line 241
    filled-new-array {p2, v0}, [I

    .line 242
    .line 243
    .line 244
    move-result-object p2

    .line 245
    invoke-static {p2}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    .line 246
    .line 247
    .line 248
    move-result-object p2

    .line 249
    invoke-static {p3, p2}, Lcom/android/launcher3/N5;->g(Ljava/lang/String;Lcom/android/launcher3/util/x0;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p2

    .line 253
    const/4 p3, 0x0

    .line 254
    invoke-virtual {v3, p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 255
    .line 256
    .line 257
    :goto_4
    iget-object p0, p0, Lz1/I0;->h:Landroid/content/Context;

    .line 258
    .line 259
    invoke-static {p0, v3}, LE1/a;->d(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :catch_0
    move-exception v0

    .line 264
    move-object v3, p1

    .line 265
    :goto_5
    move-object p1, v0

    .line 266
    goto :goto_7

    .line 267
    :catchall_0
    move-exception v0

    .line 268
    move-object v3, p1

    .line 269
    move-object p1, v0

    .line 270
    :try_start_3
    invoke-virtual {p2}, LE1/a$a;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 271
    .line 272
    .line 273
    goto :goto_6

    .line 274
    :catchall_1
    move-exception v0

    .line 275
    move-object p2, v0

    .line 276
    :try_start_4
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 277
    .line 278
    .line 279
    :goto_6
    throw p1
    :try_end_4
    .catch Landroid/database/SQLException; {:try_start_4 .. :try_end_4} :catch_1

    .line 280
    :catch_1
    move-exception v0

    .line 281
    goto :goto_5

    .line 282
    :goto_7
    invoke-virtual {p1}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p2

    .line 286
    invoke-static {v1, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 287
    .line 288
    .line 289
    :goto_8
    const-string p1, "Destroying all old data."

    .line 290
    .line 291
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    .line 293
    .line 294
    invoke-virtual {p0, v3}, Lz1/I0;->j(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 295
    .line 296
    .line 297
    return-void

    .line 298
    nop

    .line 299
    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_9
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_b
        :pswitch_b
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public t(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)I
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
    invoke-virtual {p0, p3}, Lz1/I0;->e(Landroid/content/ContentValues;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-virtual {p1, p2, p0, p3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    long-to-int p0, p0

    .line 20
    return p0

    .line 21
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 22
    .line 23
    const-string p1, "Error: attempting to add item without specifying an id"

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0

    .line 29
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 30
    .line 31
    const-string p1, "Error: attempting to insert null values"

    .line 32
    .line 33
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p0
.end method
