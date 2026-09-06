.class Lcom/android/launcher3/ZBackupService$a;
.super Lcom/android/launcher3/J0$a;
.source "ZBackupService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/ZBackupService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Ljava/io/FileInputStream;

.field private h:Ljava/io/FileInputStream;

.field private i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/io/FileInputStream;",
            ">;"
        }
    .end annotation
.end field

.field private j:I

.field final synthetic k:Lcom/android/launcher3/ZBackupService;


# direct methods
.method constructor <init>(Lcom/android/launcher3/ZBackupService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/J0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/ZBackupService$a;->i:Ljava/util/HashMap;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public H1(Z[B)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "readDataShm isShm: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " backup data size: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    array-length v1, p2

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "ZBackupService"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/ZBackupService$a;->g:Ljava/io/FileInputStream;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/ZBackupService$a;->h:Ljava/io/FileInputStream;

    .line 38
    .line 39
    :goto_0
    const/4 p1, 0x0

    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    :try_start_0
    array-length v0, p2

    .line 43
    invoke-virtual {p0, p2}, Ljava/io/FileInputStream;->read([B)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-ge p2, v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    return p2

    .line 53
    :catch_0
    move-exception p2

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    return p2

    .line 56
    :goto_1
    const-string v0, "readDataShm exception"

    .line 57
    .line 58
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    :try_start_1
    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :catch_1
    move-exception p0

    .line 66
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 67
    .line 68
    .line 69
    :goto_2
    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    .line 70
    .line 71
    .line 72
    :cond_2
    return p1
.end method

.method public I(I)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/ZBackupService;->a(Lcom/android/launcher3/ZBackupService;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "launcherNubia.db"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    int-to-long v2, p1

    .line 18
    div-long/2addr v0, v2

    .line 19
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 20
    .line 21
    .line 22
    move-result-wide p0

    .line 23
    rem-long/2addr p0, v2

    .line 24
    const-wide/16 v2, 0x0

    .line 25
    .line 26
    cmp-long p0, p0, v2

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const-wide/16 p0, 0x1

    .line 31
    .line 32
    add-long/2addr v0, p0

    .line 33
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string p1, "getMax: "

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "ZBackupService"

    .line 51
    .line 52
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    return-wide v0
.end method

.method public J0()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "startBackup"

    .line 2
    .line 3
    const-string v1, "ZBackupService"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/android/launcher3/R6;->q(Landroid/content/Context;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/android/launcher3/ZBackupService$a;->j:I

    .line 19
    .line 20
    invoke-static {}, Lcom/android/launcher3/ZBackupService;->b()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {}, Lcom/android/launcher3/ZBackupService;->b()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    invoke-static {v2}, Lcom/android/launcher3/ZBackupService;->c(I)V

    .line 31
    .line 32
    .line 33
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 36
    .line 37
    invoke-static {v3}, Lcom/android/launcher3/ZBackupService;->a(Lcom/android/launcher3/ZBackupService;)Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-string v4, "launcherNubia.db"

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/ZBackupService$a;->e1()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_0

    .line 55
    .line 56
    new-instance v3, Ljava/io/FileInputStream;

    .line 57
    .line 58
    iget-object v4, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 59
    .line 60
    invoke-static {v4}, Lcom/android/launcher3/ZBackupService;->a(Lcom/android/launcher3/ZBackupService;)Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    const-string v5, "launcherNubia.db-shm"

    .line 65
    .line 66
    invoke-virtual {v4, v5}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 71
    .line 72
    .line 73
    iput-object v3, p0, Lcom/android/launcher3/ZBackupService$a;->g:Ljava/io/FileInputStream;

    .line 74
    .line 75
    new-instance v3, Ljava/io/FileInputStream;

    .line 76
    .line 77
    iget-object v4, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 78
    .line 79
    invoke-static {v4}, Lcom/android/launcher3/ZBackupService;->a(Lcom/android/launcher3/ZBackupService;)Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    const-string v5, "launcherNubia.db-wal"

    .line 84
    .line 85
    invoke-virtual {v4, v5}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 90
    .line 91
    .line 92
    iput-object v3, p0, Lcom/android/launcher3/ZBackupService$a;->h:Ljava/io/FileInputStream;

    .line 93
    .line 94
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/ZBackupService$a;->i:Ljava/util/HashMap;

    .line 95
    .line 96
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {p0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    new-instance p0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v2, "startBackup backup id: "

    .line 109
    .line 110
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    return v0

    .line 124
    :catch_0
    const-string p0, "startBackup id invalid"

    .line 125
    .line 126
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    const/4 p0, -0x1

    .line 130
    return p0
.end method

.method public e1()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/ZBackupService;->a(Lcom/android/launcher3/ZBackupService;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "launcherNubia.db-shm"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/android/launcher3/ZBackupService;->a(Lcom/android/launcher3/ZBackupService;)Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v1, "launcherNubia.db-wal"

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v1, "isShmAndWalExist: "

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "ZBackupService"

    .line 58
    .line 59
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    return p0
.end method

.method public u1()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getPageCount: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/ZBackupService$a;->j:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "ZBackupService"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/ZBackupService$a;->k:Lcom/android/launcher3/ZBackupService;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/android/launcher3/R6;->c(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    iget p0, p0, Lcom/android/launcher3/ZBackupService$a;->j:I

    .line 35
    .line 36
    return p0
.end method

.method public y0(I[B)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "readData backup id: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " backup data size: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    array-length v1, p2

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "ZBackupService"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/ZBackupService$a;->i:Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/io/FileInputStream;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    :try_start_0
    array-length v3, p2

    .line 48
    invoke-virtual {v0, p2}, Ljava/io/FileInputStream;->read([B)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-ge p2, v3, :cond_0

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 55
    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    iget-object v3, p0, Lcom/android/launcher3/ZBackupService$a;->i:Ljava/util/HashMap;

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    return p2

    .line 68
    :catch_0
    move-exception p2

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    return p2

    .line 71
    :goto_0
    const-string v3, "readData exception"

    .line 72
    .line 73
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    :try_start_1
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :catch_1
    move-exception p0

    .line 83
    goto :goto_2

    .line 84
    :cond_1
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/ZBackupService$a;->i:Ljava/util/HashMap;

    .line 85
    .line 86
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 91
    .line 92
    .line 93
    goto :goto_3

    .line 94
    :goto_2
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 95
    .line 96
    .line 97
    :goto_3
    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    .line 98
    .line 99
    .line 100
    :cond_2
    return v2
.end method
