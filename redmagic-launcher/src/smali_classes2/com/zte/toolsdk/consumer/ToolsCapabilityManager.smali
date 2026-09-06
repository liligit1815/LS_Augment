.class public Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;
.super Ljava/lang/Object;
.source "ToolsCapabilityManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;,
        Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppInfo;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ToolsCapability"

.field private static instance:Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;


# instance fields
.field private final mAppStatusManager:Lcom/zte/toolsdk/consumer/AppStatusManager;

.field private final mContext:Landroid/content/Context;

.field private mIntent:Landroid/content/Intent;

.field private final mPackageName:Ljava/lang/String;

.field private final mPrivacyAppManager:Lcom/zte/toolsdk/consumer/PrivacyAppManager;

.field private final mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

.field private final mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mContext:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->getInstance(Landroid/content/Context;)Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 15
    .line 16
    invoke-static {}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getInstance()Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 21
    .line 22
    new-instance v0, Lcom/zte/toolsdk/consumer/AppStatusManager;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Lcom/zte/toolsdk/consumer/AppStatusManager;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mAppStatusManager:Lcom/zte/toolsdk/consumer/AppStatusManager;

    .line 28
    .line 29
    new-instance v0, Lcom/zte/toolsdk/consumer/PrivacyAppManager;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Lcom/zte/toolsdk/consumer/PrivacyAppManager;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mPrivacyAppManager:Lcom/zte/toolsdk/consumer/PrivacyAppManager;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mPackageName:Ljava/lang/String;

    .line 41
    .line 42
    return-void
.end method

.method private getAppNameByPackageName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, p2, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    return-object p0

    .line 30
    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v0, "Package not found: "

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "ToolsCapability"

    .line 48
    .line 49
    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-object p0
.end method

.method private getAppStatus(Ljava/lang/String;)Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mAppStatusManager:Lcom/zte/toolsdk/consumer/AppStatusManager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/consumer/AppStatusManager;->isAppInstalled(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mPrivacyAppManager:Lcom/zte/toolsdk/consumer/PrivacyAppManager;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/consumer/PrivacyAppManager;->isAppHidden(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;->PRIVATE:Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mAppStatusManager:Lcom/zte/toolsdk/consumer/AppStatusManager;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/consumer/AppStatusManager;->isAppEnabled(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    sget-object p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;->INSTALLED_ENABLED:Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    sget-object p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;->INSTALLED_DISABLED:Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    sget-object p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;->UNINSTALLED:Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;

    .line 35
    .line 36
    return-object p0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;
    .locals 2

    .line 1
    const-class v0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->instance:Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->instance:Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->instance:Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object p0

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p0
.end method


# virtual methods
.method public declared-synchronized call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppInfo;
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 3
    .line 4
    invoke-virtual {v0, p2}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getToolSdkInfo(Ljava/lang/String;)Lcom/zte/toolsdk/entity/SdkInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const-string p1, "ToolsCapability"

    .line 13
    .line 14
    new-instance p3, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, " not found in tool capability json!"

    .line 23
    .line 24
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-static {p1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->getToolsInfoByToolsName(Ljava/lang/String;)Lcom/zte/toolsmanager/ToolsInfo;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p2, p1, Lcom/zte/toolsmanager/ToolsInfo;->packageName:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p1, Lcom/zte/toolsmanager/ToolsInfo;->appName:Ljava/lang/String;

    .line 45
    .line 46
    goto/16 :goto_0

    .line 47
    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto/16 :goto_1

    .line 50
    .line 51
    :cond_0
    const/4 p2, 0x0

    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_1
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 55
    .line 56
    invoke-virtual {v0, p2}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getToolPackage(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mContext:Landroid/content/Context;

    .line 61
    .line 62
    invoke-direct {p0, v1, v0}, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->getAppNameByPackageName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    iget-object v2, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 73
    .line 74
    invoke-virtual {v2, p2}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->getToolsInfoByToolsName(Ljava/lang/String;)Lcom/zte/toolsmanager/ToolsInfo;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    iget-object v0, v2, Lcom/zte/toolsmanager/ToolsInfo;->packageName:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v1, v2, Lcom/zte/toolsmanager/ToolsInfo;->appName:Ljava/lang/String;

    .line 83
    .line 84
    :cond_2
    iget-object v2, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 85
    .line 86
    invoke-virtual {v2, v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->addAiToolsPkg(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const-string v2, "ToolsCapability"

    .line 90
    .line 91
    new-instance v3, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v4, "Add ai tools pkg:"

    .line 97
    .line 98
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    new-instance v2, Landroid/content/Intent;

    .line 112
    .line 113
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object v2, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 117
    .line 118
    new-instance v2, Landroid/content/ComponentName;

    .line 119
    .line 120
    const-string v3, "com.zte.toolsdk.producer.ToolsReceiver"

    .line 121
    .line 122
    invoke-direct {v2, v0, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 126
    .line 127
    invoke-virtual {v3, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 128
    .line 129
    .line 130
    iget-object v2, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 131
    .line 132
    const-string v3, "command"

    .line 133
    .line 134
    invoke-virtual {v2, v3, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    .line 136
    .line 137
    iget-object p3, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 138
    .line 139
    const-string v2, "packageName"

    .line 140
    .line 141
    iget-object v3, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mPackageName:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p3, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    iget-object p3, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 147
    .line 148
    const-string v2, "agentId"

    .line 149
    .line 150
    invoke-virtual {p3, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 154
    .line 155
    const-string p3, "toolsName"

    .line 156
    .line 157
    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 161
    .line 162
    const-string p2, "messenger"

    .line 163
    .line 164
    iget-object p3, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 165
    .line 166
    invoke-virtual {p3}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->getMessenger()Landroid/os/Messenger;

    .line 167
    .line 168
    .line 169
    move-result-object p3

    .line 170
    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 174
    .line 175
    const/16 p2, 0x20

    .line 176
    .line 177
    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 178
    .line 179
    .line 180
    const-string p1, "ToolsCapability"

    .line 181
    .line 182
    new-instance p2, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .line 186
    .line 187
    const-string p3, "sendBroadcast "

    .line 188
    .line 189
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    iget-object p3, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 193
    .line 194
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mContext:Landroid/content/Context;

    .line 205
    .line 206
    iget-object p2, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mIntent:Landroid/content/Intent;

    .line 207
    .line 208
    invoke-virtual {p1, p2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 209
    .line 210
    .line 211
    move-object p2, v0

    .line 212
    :goto_0
    invoke-direct {p0, p2}, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->getAppStatus(Ljava/lang/String;)Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    new-instance p3, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppInfo;

    .line 217
    .line 218
    invoke-direct {p3, p2, v1, p1}, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/zte/toolsdk/consumer/ToolsCapabilityManager$AppStatus;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    .line 220
    .line 221
    monitor-exit p0

    .line 222
    return-object p3

    .line 223
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 224
    throw p1
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->destroy()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized init()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->init()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method

.method public setFunctionCallback(Lcom/zte/toolsdk/consumer/FunctionCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->setFunctionCallback(Lcom/zte/toolsdk/consumer/FunctionCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setToolsCallback(Lcom/zte/toolsdk/consumer/ToolsCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/consumer/ToolsCapabilityManager;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->setToolsCallback(Lcom/zte/toolsdk/consumer/ToolsCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
