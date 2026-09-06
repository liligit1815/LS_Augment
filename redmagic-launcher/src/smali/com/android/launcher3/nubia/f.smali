.class public Lcom/android/launcher3/nubia/f;
.super Ljava/lang/Object;
.source "NubiaPushStatisticUtils.java"


# static fields
.field private static final a:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "content://cn.nubia.neopush.fanIconAck"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/nubia/f;->a:Landroid/net/Uri;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;JLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/launcher3/nubia/f;->a:Landroid/net/Uri;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    :try_start_0
    new-instance v0, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "messageid"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 21
    .line 22
    .line 23
    const-string p1, "fancyAction"

    .line 24
    .line 25
    invoke-virtual {p0, p1, p3, v0}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p1

    .line 35
    :try_start_1
    const-string p2, "NubiaPushStatisticUtils"

    .line 36
    .line 37
    const-string p3, "sendEvent doInBackground error"

    .line 38
    .line 39
    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :goto_0
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V

    .line 47
    .line 48
    .line 49
    throw p1

    .line 50
    :cond_0
    :goto_1
    return-void
.end method

.method public static b(Landroid/content/Context;J)V
    .locals 1

    .line 1
    const-string v0, "click"

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Lcom/android/launcher3/nubia/f;->c(Landroid/content/Context;JLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static c(Landroid/content/Context;JLjava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "send Event msgId= "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " event= "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "NubiaPushStatisticUtils"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    const-wide/16 v0, 0x0

    .line 32
    .line 33
    cmp-long v0, p1, v0

    .line 34
    .line 35
    if-gtz v0, :cond_0

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 39
    .line 40
    new-instance v1, Lcom/android/launcher3/nubia/e;

    .line 41
    .line 42
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/nubia/e;-><init>(Landroid/content/Context;JLjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static d(Landroid/content/Context;J)V
    .locals 1

    .line 1
    const-string v0, "recv"

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Lcom/android/launcher3/nubia/f;->c(Landroid/content/Context;JLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static e(Landroid/content/Context;J)V
    .locals 1

    .line 1
    const-string v0, "show"

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Lcom/android/launcher3/nubia/f;->c(Landroid/content/Context;JLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
