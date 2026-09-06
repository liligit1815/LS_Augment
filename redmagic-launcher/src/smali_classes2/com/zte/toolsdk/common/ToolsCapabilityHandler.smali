.class public Lcom/zte/toolsdk/common/ToolsCapabilityHandler;
.super Ljava/lang/Object;
.source "ToolsCapabilityHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ToolsCapability"

.field private static instance:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;


# instance fields
.field private final mToolsFilterMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mToolsFunctionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mToolsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mToolsPackageMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mToolsSdkInfoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/zte/toolsdk/entity/SdkInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsList:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsFunctionMap:Ljava/util/Map;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsPackageMap:Ljava/util/Map;

    .line 24
    .line 25
    new-instance v0, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsSdkInfoMap:Ljava/util/Map;

    .line 31
    .line 32
    new-instance v0, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsFilterMap:Ljava/util/Map;

    .line 38
    .line 39
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/zte/toolsdk/entity/SdkInfo;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/zte/toolsdk/entity/SdkInfo;->getExecutor()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-boolean p0, Lcom/zte/toolsdk/utils/FeatureUtil;->LOG_DEBUG:Z

    .line 8
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
    const-string v0, "Executor: "

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/zte/toolsdk/entity/SdkInfo;->getExecutor()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "ToolsCapability"

    .line 33
    .line 34
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/zte/toolsdk/common/ToolsCapabilityHandler;
    .locals 2

    .line 1
    const-class v0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->instance:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->instance:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->instance:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method private parseJson()V
    .locals 14

    .line 1
    const-string v0, "function_provider_package"

    .line 2
    .line 3
    const-string v1, "filter"

    .line 4
    .line 5
    const-string v2, "sdk"

    .line 6
    .line 7
    const-string v3, "name"

    .line 8
    .line 9
    const-string v4, "function"

    .line 10
    .line 11
    new-instance v5, Lcom/google/gson/f;

    .line 12
    .line 13
    invoke-direct {v5}, Lcom/google/gson/f;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v6, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsList:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v7

    .line 26
    if-eqz v7, :cond_6

    .line 27
    .line 28
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    check-cast v7, Ljava/lang/String;

    .line 33
    .line 34
    :try_start_0
    invoke-static {v7}, Lcom/google/gson/p;->c(Ljava/lang/String;)Lcom/google/gson/k;

    .line 35
    .line 36
    .line 37
    move-result-object v7

    .line 38
    invoke-virtual {v7}, Lcom/google/gson/k;->g()Lcom/google/gson/n;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    invoke-virtual {v7}, Lcom/google/gson/n;->w()Ljava/util/Set;

    .line 43
    .line 44
    .line 45
    move-result-object v8

    .line 46
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v8

    .line 50
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    check-cast v8, Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v7, v8}, Lcom/google/gson/n;->u(Ljava/lang/String;)Lcom/google/gson/n;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-virtual {v5, v7}, Lcom/google/gson/f;->r(Lcom/google/gson/k;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    sget-boolean v9, Lcom/zte/toolsdk/utils/FeatureUtil;->LOG_DEBUG:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    const-string v10, "ToolsCapability"

    .line 67
    .line 68
    if-eqz v9, :cond_1

    .line 69
    .line 70
    :try_start_1
    new-instance v11, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string v12, "toolJson: "

    .line 76
    .line 77
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :catch_0
    move-exception v7

    .line 92
    goto/16 :goto_2

    .line 93
    .line 94
    :cond_1
    :goto_1
    const-string v8, ""

    .line 95
    .line 96
    invoke-virtual {v7, v4}, Lcom/google/gson/n;->v(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v11

    .line 100
    if-eqz v11, :cond_3

    .line 101
    .line 102
    invoke-virtual {v7, v4}, Lcom/google/gson/n;->u(Ljava/lang/String;)Lcom/google/gson/n;

    .line 103
    .line 104
    .line 105
    move-result-object v11

    .line 106
    invoke-virtual {v5, v11}, Lcom/google/gson/f;->r(Lcom/google/gson/k;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    if-eqz v9, :cond_2

    .line 111
    .line 112
    new-instance v9, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v13, "functionJson: "

    .line 118
    .line 119
    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    invoke-static {v10, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    :cond_2
    invoke-virtual {v11, v3}, Lcom/google/gson/n;->v(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result v9

    .line 136
    if-eqz v9, :cond_3

    .line 137
    .line 138
    invoke-virtual {v11, v3}, Lcom/google/gson/n;->t(Ljava/lang/String;)Lcom/google/gson/k;

    .line 139
    .line 140
    .line 141
    move-result-object v8

    .line 142
    invoke-virtual {v8}, Lcom/google/gson/k;->m()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    iget-object v9, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsFunctionMap:Ljava/util/Map;

    .line 147
    .line 148
    invoke-interface {v9, v8, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    :cond_3
    invoke-virtual {v7, v2}, Lcom/google/gson/n;->v(Ljava/lang/String;)Z

    .line 152
    .line 153
    .line 154
    move-result v9

    .line 155
    if-eqz v9, :cond_4

    .line 156
    .line 157
    invoke-virtual {v7, v2}, Lcom/google/gson/n;->u(Ljava/lang/String;)Lcom/google/gson/n;

    .line 158
    .line 159
    .line 160
    move-result-object v9

    .line 161
    invoke-virtual {v5, v9}, Lcom/google/gson/f;->r(Lcom/google/gson/k;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v9

    .line 165
    iget-object v10, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsSdkInfoMap:Ljava/util/Map;

    .line 166
    .line 167
    const-class v11, Lcom/zte/toolsdk/entity/SdkInfo;

    .line 168
    .line 169
    invoke-virtual {v5, v9, v11}, Lcom/google/gson/f;->j(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    check-cast v9, Lcom/zte/toolsdk/entity/SdkInfo;

    .line 174
    .line 175
    invoke-interface {v10, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    :cond_4
    invoke-virtual {v7, v1}, Lcom/google/gson/n;->v(Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v9

    .line 182
    if-eqz v9, :cond_5

    .line 183
    .line 184
    invoke-virtual {v7, v1}, Lcom/google/gson/n;->u(Ljava/lang/String;)Lcom/google/gson/n;

    .line 185
    .line 186
    .line 187
    move-result-object v9

    .line 188
    invoke-virtual {v5, v9}, Lcom/google/gson/f;->r(Lcom/google/gson/k;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    iget-object v10, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsFilterMap:Ljava/util/Map;

    .line 193
    .line 194
    invoke-interface {v10, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    :cond_5
    invoke-virtual {v7, v0}, Lcom/google/gson/n;->v(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v9

    .line 201
    if-eqz v9, :cond_0

    .line 202
    .line 203
    invoke-virtual {v7, v0}, Lcom/google/gson/n;->t(Ljava/lang/String;)Lcom/google/gson/k;

    .line 204
    .line 205
    .line 206
    move-result-object v7

    .line 207
    invoke-virtual {v7}, Lcom/google/gson/k;->m()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v7

    .line 211
    iget-object v9, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsPackageMap:Ljava/util/Map;

    .line 212
    .line 213
    invoke-interface {v9, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 214
    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :goto_2
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 219
    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :cond_6
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsSdkInfoMap:Ljava/util/Map;

    .line 224
    .line 225
    new-instance v0, Lcom/zte/toolsdk/common/a;

    .line 226
    .line 227
    invoke-direct {v0}, Lcom/zte/toolsdk/common/a;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-interface {p0, v0}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 231
    .line 232
    .line 233
    return-void
.end method


# virtual methods
.method public getAllFilter()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsFilterMap:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAllFunction()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsFunctionMap:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToolPackage(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsPackageMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getToolSdkInfo(Ljava/lang/String;)Lcom/zte/toolsdk/entity/SdkInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsSdkInfoMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/zte/toolsdk/entity/SdkInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public declared-synchronized parseToolsCapability(Ljava/lang/String;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Lcom/google/gson/p;->c(Ljava/lang/String;)Lcom/google/gson/k;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p1}, Lcom/google/gson/k;->g()Lcom/google/gson/n;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/google/gson/n;->s()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

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
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/util/Map$Entry;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/String;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/google/gson/k;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/google/gson/k;->g()Lcom/google/gson/n;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v2, "{\"%s\":%s}"

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/google/gson/k;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->mToolsList:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception p1

    .line 67
    goto :goto_1

    .line 68
    :cond_0
    invoke-direct {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->parseJson()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    .line 70
    .line 71
    monitor-exit p0

    .line 72
    return-void

    .line 73
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    throw p1
.end method
