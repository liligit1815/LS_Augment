.class public Lcom/android/launcher3/resource/g;
.super Ljava/lang/Object;
.source "AppsSortInfoManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/resource/g$a;
    }
.end annotation


# static fields
.field private static volatile e:Lcom/android/launcher3/resource/g;


# instance fields
.field private a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/resource/g$a;",
            ">;"
        }
    .end annotation
.end field

.field private final b:LD1/t;

.field private final c:Landroid/content/pm/PackageManager;

.field private final d:Landroid/content/pm/LauncherApps;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/resource/g;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, p0, Lcom/android/launcher3/resource/g;->c:Landroid/content/pm/PackageManager;

    .line 24
    .line 25
    sget-object v1, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, LD1/t;

    .line 32
    .line 33
    iput-object v1, p0, Lcom/android/launcher3/resource/g;->b:LD1/t;

    .line 34
    .line 35
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/launcher3/resource/g;->d:Landroid/content/pm/LauncherApps;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/resource/g;Lcom/android/launcher3/resource/g$a;Lcom/android/launcher3/util/E;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/resource/g;->r(Lcom/android/launcher3/resource/g$a;Lcom/android/launcher3/util/E;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/lang/StringBuilder;Ljava/text/SimpleDateFormat;Ljava/lang/String;Lcom/android/launcher3/resource/g$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2
    .line 3
    .line 4
    const-string p2, ", install time: "

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Lcom/android/launcher3/resource/g$a;->b(Lcom/android/launcher3/resource/g$a;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, ", frequency: "

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-static {p3}, Lcom/android/launcher3/resource/g$a;->a(Lcom/android/launcher3/resource/g$a;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, "\n"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/resource/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/g;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/resource/g;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g;->s(Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Landroid/content/ComponentName;J)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "AppsSortInfoManager"

    .line 8
    .line 9
    const-string p1, "updateComponentFrequency: resource database provider is null."

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p0, p1}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object p1, Lcom/android/launcher3/resource/ResourceDatabaseProvider$a;->a:Landroid/net/Uri;

    .line 28
    .line 29
    const-string p2, "componentName = ? AND userId = ?"

    .line 30
    .line 31
    invoke-virtual {v0, p1, p2, p0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic f(Landroid/content/ComponentName;JLcom/android/launcher3/resource/g$a;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "componentName"

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "userId"

    .line 20
    .line 21
    invoke-virtual {v0, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p3}, Lcom/android/launcher3/resource/g$a;->b(Lcom/android/launcher3/resource/g$a;)J

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "installTime"

    .line 33
    .line 34
    invoke-virtual {v0, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p3}, Lcom/android/launcher3/resource/g$a;->a(Lcom/android/launcher3/resource/g$a;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "frequency"

    .line 46
    .line 47
    invoke-virtual {v0, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    const-string p0, "AppsSortInfoManager"

    .line 57
    .line 58
    const-string p1, "updateComponentFrequency: resource database provider is null."

    .line 59
    .line 60
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    sget-object p1, Lcom/android/launcher3/resource/ResourceDatabaseProvider$a;->a:Landroid/net/Uri;

    .line 65
    .line 66
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->b(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static l()Lcom/android/launcher3/resource/g;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/g;->e:Lcom/android/launcher3/resource/g;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/android/launcher3/resource/g;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/android/launcher3/resource/g;->e:Lcom/android/launcher3/resource/g;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/resource/g;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/android/launcher3/resource/g;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/android/launcher3/resource/g;->e:Lcom/android/launcher3/resource/g;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    sget-object v1, Lcom/android/launcher3/resource/g;->e:Lcom/android/launcher3/resource/g;

    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-object v1

    .line 26
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw v1

    .line 28
    :cond_1
    sget-object v0, Lcom/android/launcher3/resource/g;->e:Lcom/android/launcher3/resource/g;

    .line 29
    .line 30
    return-object v0
.end method

.method private m(Ljava/lang/String;J)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, "/"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method private n(Lcom/android/launcher3/util/E;)Lcom/android/launcher3/resource/g$a;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g;->o(Landroid/os/UserHandle;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-direct {p0, v0, v1, v2}, Lcom/android/launcher3/resource/g;->m(Ljava/lang/String;J)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/android/launcher3/resource/g;->a:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/android/launcher3/resource/g$a;

    .line 24
    .line 25
    return-object p0
.end method

.method private o(Landroid/os/UserHandle;)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g;->b:LD1/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method private synthetic q()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v6, "AppsSortInfoManager"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "initAppsSortInfoManager: resource database provider is null."

    .line 10
    .line 11
    invoke-static {v6, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_0
    sget-object v1, Lcom/android/launcher3/resource/ResourceDatabaseProvider$a;->a:Landroid/net/Uri;

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 22
    .line 23
    .line 24
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const-string v0, "componentName"

    .line 41
    .line 42
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v2, "userId"

    .line 51
    .line 52
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    int-to-long v2, v2

    .line 61
    invoke-direct {p0, v0, v2, v3}, Lcom/android/launcher3/resource/g;->m(Ljava/lang/String;J)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v2, Lcom/android/launcher3/resource/g$a;

    .line 66
    .line 67
    invoke-direct {v2}, Lcom/android/launcher3/resource/g$a;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v3, "installTime"

    .line 71
    .line 72
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 77
    .line 78
    .line 79
    move-result-wide v3

    .line 80
    invoke-static {v2, v3, v4}, Lcom/android/launcher3/resource/g$a;->d(Lcom/android/launcher3/resource/g$a;J)V

    .line 81
    .line 82
    .line 83
    const-string v3, "frequency"

    .line 84
    .line 85
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    invoke-static {v2, v3}, Lcom/android/launcher3/resource/g$a;->c(Lcom/android/launcher3/resource/g$a;I)V

    .line 94
    .line 95
    .line 96
    iget-object v3, p0, Lcom/android/launcher3/resource/g;->a:Ljava/util/HashMap;

    .line 97
    .line 98
    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :catchall_0
    move-exception v0

    .line 103
    move-object p0, v0

    .line 104
    goto :goto_2

    .line 105
    :cond_2
    :goto_1
    const-string p0, "initAppsSortInfoManager: get apps sort info from db failed."

    .line 106
    .line 107
    invoke-static {v6, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    .line 109
    .line 110
    if-eqz v1, :cond_5

    .line 111
    .line 112
    :cond_3
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :goto_2
    if-eqz v1, :cond_4

    .line 117
    .line 118
    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :catchall_1
    move-exception v0

    .line 123
    :try_start_4
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    :cond_4
    :goto_3
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 127
    :catch_0
    move-exception v0

    .line 128
    move-object p0, v0

    .line 129
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 130
    .line 131
    .line 132
    :cond_5
    return-void
.end method

.method private synthetic r(Lcom/android/launcher3/resource/g$a;Lcom/android/launcher3/util/E;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/resource/g$a;->a(Lcom/android/launcher3/resource/g$a;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v1, "frequency"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p2, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 26
    .line 27
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/g;->o(Landroid/os/UserHandle;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p1, p0}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    const-string p0, "AppsSortInfoManager"

    .line 46
    .line 47
    const-string p1, "updateComponentFrequency: resource database provider is null."

    .line 48
    .line 49
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    sget-object p2, Lcom/android/launcher3/resource/ResourceDatabaseProvider$a;->a:Landroid/net/Uri;

    .line 54
    .line 55
    const-string v1, "componentName = ? AND userId = ?"

    .line 56
    .line 57
    invoke-virtual {p1, p2, v0, v1, p0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private synthetic s(Ljava/util/HashMap;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/os/UserHandle;

    .line 26
    .line 27
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/resource/g;->g(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public g(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 8

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/resource/g;->c:Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/android/launcher3/resource/g;->d:Landroid/content/pm/LauncherApps;

    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroid/content/pm/LauncherActivityInfo;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/g;->o(Landroid/os/UserHandle;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-direct {p0, v4, v2, v3}, Lcom/android/launcher3/resource/g;->m(Ljava/lang/String;J)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    new-instance v5, Lcom/android/launcher3/resource/g$a;

    .line 47
    .line 48
    iget-wide v6, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    .line 49
    .line 50
    invoke-direct {v5, v6, v7}, Lcom/android/launcher3/resource/g$a;-><init>(J)V

    .line 51
    .line 52
    .line 53
    iget-object v6, p0, Lcom/android/launcher3/resource/g;->a:Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-virtual {v6, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    new-instance v4, Lcom/android/launcher3/resource/e;

    .line 59
    .line 60
    invoke-direct {v4, v1, v2, v3, v5}, Lcom/android/launcher3/resource/e;-><init>(Landroid/content/ComponentName;JLcom/android/launcher3/resource/g$a;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v4}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catch_0
    move-exception p0

    .line 68
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public h(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/resource/g;->d:Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/content/pm/LauncherActivityInfo;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/g;->o(Landroid/os/UserHandle;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-direct {p0, v3, v1, v2}, Lcom/android/launcher3/resource/g;->m(Ljava/lang/String;J)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iget-object v4, p0, Lcom/android/launcher3/resource/g;->a:Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    new-instance v3, Lcom/android/launcher3/resource/d;

    .line 45
    .line 46
    invoke-direct {v3, v0, v1, v2}, Lcom/android/launcher3/resource/d;-><init>(Landroid/content/ComponentName;J)V

    .line 47
    .line 48
    .line 49
    invoke-static {v3}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catch_0
    move-exception p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public i()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 7
    .line 8
    const-string v2, "yyyy-MM-dd HH:mm:ss"

    .line 9
    .line 10
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/resource/g;->a:Ljava/util/HashMap;

    .line 18
    .line 19
    new-instance v2, Lcom/android/launcher3/resource/a;

    .line 20
    .line 21
    invoke-direct {v2, v0, v1}, Lcom/android/launcher3/resource/a;-><init>(Ljava/lang/StringBuilder;Ljava/text/SimpleDateFormat;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v2}, Ljava/util/HashMap;->forEach(Ljava/util/function/BiConsumer;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "dumpSortInfo: \n"

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v0, "AppsSortInfoManager"

    .line 45
    .line 46
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public j(Lcom/android/launcher3/util/E;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g;->n(Lcom/android/launcher3/util/E;)Lcom/android/launcher3/resource/g$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/resource/g$a;->a(Lcom/android/launcher3/resource/g$a;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public k(Lcom/android/launcher3/util/E;)J
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g;->n(Lcom/android/launcher3/util/E;)Lcom/android/launcher3/resource/g$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/resource/g$a;->b(Lcom/android/launcher3/resource/g$a;)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0

    .line 12
    :cond_0
    const-wide/16 p0, 0x0

    .line 13
    .line 14
    return-wide p0
.end method

.method p()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/f;-><init>(Lcom/android/launcher3/resource/g;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t(Lcom/android/launcher3/util/E;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g;->n(Lcom/android/launcher3/util/E;)Lcom/android/launcher3/resource/g$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "AppsSortInfoManager"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "updateComponentFrequency: get sort info failed. cm: "

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v2, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iget-object v0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v2, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 38
    .line 39
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/resource/g;->g(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g;->n(Lcom/android/launcher3/util/E;)Lcom/android/launcher3/resource/g$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :cond_0
    if-nez v0, :cond_1

    .line 47
    .line 48
    new-instance p0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v0, "updateComponentFrequency: sort info is null, cm: "

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object p1, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-static {v0}, Lcom/android/launcher3/resource/g$a;->a(Lcom/android/launcher3/resource/g$a;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/lit8 v1, v1, 0x1

    .line 76
    .line 77
    invoke-static {v0, v1}, Lcom/android/launcher3/resource/g$a;->c(Lcom/android/launcher3/resource/g$a;I)V

    .line 78
    .line 79
    .line 80
    new-instance v1, Lcom/android/launcher3/resource/c;

    .line 81
    .line 82
    invoke-direct {v1, p0, v0, p1}, Lcom/android/launcher3/resource/c;-><init>(Lcom/android/launcher3/resource/g;Lcom/android/launcher3/resource/g$a;Lcom/android/launcher3/util/E;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public u([Lcom/android/launcher3/model/data/d;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length v1, p1

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_2

    .line 9
    .line 10
    aget-object v3, p1, v2

    .line 11
    .line 12
    iget-object v4, v3, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 13
    .line 14
    if-eqz v4, :cond_1

    .line 15
    .line 16
    invoke-virtual {v4}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    iget-object v6, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 21
    .line 22
    invoke-direct {p0, v6}, Lcom/android/launcher3/resource/g;->o(Landroid/os/UserHandle;)J

    .line 23
    .line 24
    .line 25
    move-result-wide v6

    .line 26
    invoke-direct {p0, v5, v6, v7}, Lcom/android/launcher3/resource/g;->m(Ljava/lang/String;J)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    iget-object v6, p0, Lcom/android/launcher3/resource/g;->a:Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-nez v5, :cond_1

    .line 37
    .line 38
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-nez v5, :cond_0

    .line 47
    .line 48
    iget-object v5, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 49
    .line 50
    if-eqz v5, :cond_0

    .line 51
    .line 52
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 57
    .line 58
    invoke-virtual {v0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v6, "updateInfoMap, componentName.getPackageName(): "

    .line 68
    .line 69
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v4, " appInfo.user:"

    .line 80
    .line 81
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 85
    .line 86
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    const-string v4, "AppsSortInfoManager"

    .line 94
    .line 95
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    new-instance p1, Lcom/android/launcher3/resource/b;

    .line 102
    .line 103
    invoke-direct {p1, p0, v0}, Lcom/android/launcher3/resource/b;-><init>(Lcom/android/launcher3/resource/g;Ljava/util/HashMap;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p1}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
