.class public Lcom/zte/toolsdk/consumer/PrivacyAppManager;
.super Ljava/lang/Object;
.source "PrivacyAppManager.java"


# static fields
.field private static final APP_HIDE_DATA_CHANGED:Landroid/net/Uri;

.field private static final APP_HIDE_QUERY_URI:Ljava/lang/String; = "com.zte.heartyservice.privacy.provider/app/hide_apps_str"

.field private static final AUTHORITY_PRIVACY:Ljava/lang/String; = "com.zte.heartyservice.privacy.provider"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mHideAppObserver:Landroid/database/ContentObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "content://com.zte.heartyservice.privacy.provider/app_hide/data_change"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->APP_HIDE_DATA_CHANGED:Landroid/net/Uri;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mContext:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getHiddenApps()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "content://com.zte.heartyservice.privacy.provider/app/hide_apps_str"

    .line 3
    .line 4
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object p0, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mContext:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, v1}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance p0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->close()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-object p0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_3

    .line 33
    :catch_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :try_start_1
    invoke-virtual {v0, v1}, Landroid/content/ContentProviderClient;->getType(Landroid/net/Uri;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    const-string v1, ";"

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->close()V

    .line 58
    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_2
    :goto_0
    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->close()V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :goto_1
    :try_start_2
    const-string v1, "ZTEPrivacy"

    .line 66
    .line 67
    const-string v2, "\u83b7\u53d6\u9690\u85cf\u5e94\u7528\u5931\u8d25"

    .line 68
    .line 69
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 70
    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    :goto_2
    new-instance p0, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    return-object p0

    .line 81
    :goto_3
    if-eqz v0, :cond_4

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->close()V

    .line 84
    .line 85
    .line 86
    :cond_4
    throw p0
.end method

.method public isAppHidden(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->getHiddenApps()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public registerHideAppChangeListener(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mHideAppObserver:Landroid/database/ContentObserver;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->unregisterHideAppChangeListener()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/consumer/PrivacyAppManager$1;

    .line 9
    .line 10
    new-instance v1, Landroid/os/Handler;

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {v0, p0, v1, p1}, Lcom/zte/toolsdk/consumer/PrivacyAppManager$1;-><init>(Lcom/zte/toolsdk/consumer/PrivacyAppManager;Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mHideAppObserver:Landroid/database/ContentObserver;

    .line 23
    .line 24
    iget-object p1, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mContext:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget-object v0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->APP_HIDE_DATA_CHANGED:Landroid/net/Uri;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    iget-object p0, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mHideAppObserver:Landroid/database/ContentObserver;

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public unregisterHideAppChangeListener()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mHideAppObserver:Landroid/database/ContentObserver;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mHideAppObserver:Landroid/database/ContentObserver;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->mHideAppObserver:Landroid/database/ContentObserver;

    .line 18
    .line 19
    :cond_0
    return-void
.end method
