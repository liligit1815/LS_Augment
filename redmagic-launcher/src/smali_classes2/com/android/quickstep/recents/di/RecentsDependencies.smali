.class public final Lcom/android/quickstep/recents/di/RecentsDependencies;
.super Ljava/lang/Object;
.source "RecentsDependencies.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

.field private static final DEBUG:Z = false

.field public static final DEFAULT_SCOPE_ID:Ljava/lang/String; = "RecentsDependencies::GlobalScope"

.field private static final TAG:Ljava/lang/String; = "RecentsDependencies"

.field private static volatile instance:Lcom/android/quickstep/recents/di/RecentsDependencies;


# instance fields
.field private final scopes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesScope;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/recents/di/RecentsDependencies;->Companion:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/recents/di/RecentsDependencies;->scopes:Ljava/util/Map;

    .line 4
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->startDefaultScope(Landroid/content/Context;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lu4/a;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->provide$lambda$5(Lu4/a;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$getInstance$cp()Lcom/android/quickstep/recents/di/RecentsDependencies;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/recents/di/RecentsDependencies;->instance:Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getScopes$p(Lcom/android/quickstep/recents/di/RecentsDependencies;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/di/RecentsDependencies;->scopes:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$setInstance$cp(Lcom/android/quickstep/recents/di/RecentsDependencies;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/android/quickstep/recents/di/RecentsDependencies;->instance:Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 2
    .line 3
    return-void
.end method

.method private final createDependency(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "createDependency "

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, " with "

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, " and "

    .line 27
    .line 28
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v4, " started"

    .line 35
    .line 36
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const/4 v4, 0x5

    .line 44
    invoke-direct {p0, v1, v4}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p2}, Lcom/android/quickstep/recents/di/RecentsDependencies;->getScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->getScopeIdsLinked()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v5, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v6, "linked scopes: "

    .line 61
    .line 62
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/4 v5, 0x0

    .line 73
    const/4 v6, 0x2

    .line 74
    const/4 v7, 0x0

    .line 75
    invoke-static {p0, v1, v5, v6, v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/String;IILjava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    const-class v1, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;

    .line 79
    .line 80
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const-class v5, Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;

    .line 85
    .line 86
    const/4 v6, 0x1

    .line 87
    if-eqz v1, :cond_0

    .line 88
    .line 89
    new-instance v1, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;

    .line 90
    .line 91
    new-instance v8, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 92
    .line 93
    invoke-direct {v8, v7, v6, v7}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v5, p2, v8, v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    check-cast v5, Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;

    .line 101
    .line 102
    invoke-direct {v1, v5}, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;-><init>(Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    const-class v1, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;

    .line 107
    .line 108
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_1

    .line 113
    .line 114
    new-instance v1, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;

    .line 115
    .line 116
    new-instance v5, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 117
    .line 118
    invoke-direct {v5, v7, v6, v7}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 119
    .line 120
    .line 121
    const-class v6, Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 122
    .line 123
    invoke-virtual {p0, v6, p2, v5, v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    check-cast v5, Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 128
    .line 129
    invoke-direct {v1, v5}, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;-><init>(Lcom/android/quickstep/recents/data/RecentTasksRepository;)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_1
    const-class v1, Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;

    .line 134
    .line 135
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_2

    .line 140
    .line 141
    new-instance v1, Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;

    .line 142
    .line 143
    invoke-direct {v1}, Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;-><init>()V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_2
    const-class v1, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;

    .line 148
    .line 149
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_3

    .line 154
    .line 155
    new-instance v1, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;

    .line 156
    .line 157
    new-instance v8, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 158
    .line 159
    invoke-direct {v8, v7, v6, v7}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 160
    .line 161
    .line 162
    const-class v9, Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;

    .line 163
    .line 164
    invoke-virtual {p0, v9, p2, v8, v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    check-cast v8, Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;

    .line 169
    .line 170
    new-instance v9, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 171
    .line 172
    invoke-direct {v9, v7, v6, v7}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, v5, p2, v9, v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    check-cast v5, Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;

    .line 180
    .line 181
    new-instance v6, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;

    .line 182
    .line 183
    invoke-direct {v6}, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-direct {v1, v8, v5, v6}, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;-><init>(Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;)V

    .line 187
    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_3
    const-class v1, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;

    .line 191
    .line 192
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-eqz v1, :cond_4

    .line 197
    .line 198
    new-instance v1, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;

    .line 199
    .line 200
    invoke-direct {v1}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;-><init>()V

    .line 201
    .line 202
    .line 203
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    new-instance v5, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    const-string p1, " completed"

    .line 231
    .line 232
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-direct {p0, p1, v4}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log(Ljava/lang/String;I)V

    .line 240
    .line 241
    .line 242
    return-object v1

    .line 243
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p2

    .line 247
    new-instance p3, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 250
    .line 251
    .line 252
    const-string v0, "Factory for "

    .line 253
    .line 254
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string p2, " not defined!"

    .line 261
    .line 262
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p3

    .line 269
    const/4 v1, 0x6

    .line 270
    invoke-direct {p0, p3, v1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log(Ljava/lang/String;I)V

    .line 271
    .line 272
    .line 273
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 274
    .line 275
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    new-instance p3, Ljava/lang/StringBuilder;

    .line 280
    .line 281
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    throw p0
.end method

.method private final createScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;
    .locals 6

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 2
    .line 3
    const/4 v4, 0x6

    .line 4
    const/4 v5, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    move-object v1, p1

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;ILkotlin/jvm/internal/j;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/recents/di/RecentsDependencies;->scopes:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static final destroy(Landroid/content/Context;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/recents/di/RecentsDependencies;->Companion:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->destroy(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final getDependency(Lcom/android/quickstep/recents/di/RecentsDependenciesScope;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesScope;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "getSimpleName(...)"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->getScopeIdsLinked()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->getScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 p1, 0x0

    .line 55
    move-object v0, p1

    .line 56
    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    .line 57
    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string p2, "Found dependency: "

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const/4 p2, 0x4

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    :cond_3
    return-object v0
.end method

.method public static synthetic inject$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 5
    const-string p2, "RecentsDependencies::GlobalScope"

    :cond_0
    and-int/lit8 p6, p5, 0x4

    const/4 v0, 0x0

    if-eqz p6, :cond_1

    .line 6
    new-instance p3, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    const/4 p6, 0x1

    invoke-direct {p3, v0, p6, v0}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    move-object p4, v0

    .line 7
    :cond_2
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic inject$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    .line 1
    const-string p1, ""

    :cond_0
    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_1

    .line 2
    new-instance p2, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    const/4 p5, 0x1

    invoke-direct {p2, v0, p5, v0}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    :cond_1
    const/4 p5, 0x4

    and-int/2addr p4, p5

    if-eqz p4, :cond_2

    move-object p3, v0

    .line 3
    :cond_2
    const-string p4, "scopeId"

    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "extras"

    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    const-string p4, "T"

    invoke-static {p5, p4}, Lkotlin/jvm/internal/o;->k(ILjava/lang/String;)V

    const-class p4, Ljava/lang/Object;

    invoke-virtual {p0, p4, p1, p2, p3}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private final log(Ljava/lang/String;I)V
    .locals 0

    .line 1
    return-void
.end method

.method static synthetic log$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/String;IILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x3

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic provide$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/Class;Ljava/lang/String;Lu4/a;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    .line 3
    const-string p2, "RecentsDependencies::GlobalScope"

    .line 4
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/recents/di/RecentsDependencies;->provide(Ljava/lang/Class;Ljava/lang/String;Lu4/a;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic provide$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/String;Lu4/a;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    .line 1
    const-string p1, ""

    :cond_0
    const-string p3, "scopeId"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p3, "factory"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p3, 0x4

    .line 2
    const-string p4, "T"

    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->k(ILjava/lang/String;)V

    const-class p3, Ljava/lang/Object;

    invoke-virtual {p0, p3, p1, p2}, Lcom/android/quickstep/recents/di/RecentsDependencies;->provide(Ljava/lang/Class;Ljava/lang/String;Lu4/a;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static final provide$lambda$5(Lu4/a;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;)Ljava/lang/Object;
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private final startDefaultScope(Landroid/content/Context;)V
    .locals 10

    .line 1
    const-string v0, "RecentsDependencies"

    .line 2
    .line 3
    const-string v1, "startDefaultScope"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const-string v0, "RecentsDependencies::GlobalScope"

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->createScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-class v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "getSimpleName(...)"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 26
    .line 27
    invoke-direct {v2}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0, v2}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    sget-object v9, Li2/c;->a:Li2/c;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-static {v0, v2, v0}, LF4/M0;->b(LF4/u0;ILjava/lang/Object;)LF4/t;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v9}, Li2/b;->a()LF4/E;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v0, v2}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v2, LF4/H;

    .line 50
    .line 51
    const-string v3, "RecentsView"

    .line 52
    .line 53
    invoke-direct {v2, v3}, LF4/H;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-interface {v0, v2}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v0}, LF4/J;->a(Ll4/g;)LF4/I;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    const-class v0, LF4/I;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0, v8}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    const-class v0, Li2/b;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0, v9}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 89
    .line 90
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    move-object v4, p1

    .line 95
    check-cast v4, Lcom/android/quickstep/RecentsModel;

    .line 96
    .line 97
    new-instance v7, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;

    .line 98
    .line 99
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsModel;->getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Lcom/android/quickstep/TaskThumbnailCache;->getHighResLoadingState()Lcom/android/quickstep/HighResLoadingState;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-direct {v7, v4, p1}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;-><init>(Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;)V

    .line 111
    .line 112
    .line 113
    const-class p1, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;

    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, p1, v7}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    new-instance v3, Lcom/android/quickstep/recents/data/TasksRepository;

    .line 126
    .line 127
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsModel;->getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    const-string p1, "getThumbnailCache(...)"

    .line 132
    .line 133
    invoke-static {v5, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsModel;->getIconCache()Lcom/android/quickstep/TaskIconCache;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    const-string p1, "getIconCache(...)"

    .line 141
    .line 142
    invoke-static {v6, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-direct/range {v3 .. v9}, Lcom/android/quickstep/recents/data/TasksRepository;-><init>(Lcom/android/quickstep/recents/data/RecentTasksDataSource;Lcom/android/quickstep/task/thumbnail/data/TaskThumbnailDataSource;Lcom/android/quickstep/task/thumbnail/data/TaskIconDataSource;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;LF4/I;Li2/b;)V

    .line 146
    .line 147
    .line 148
    const-class p1, Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 149
    .line 150
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0, p1, v3}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method


# virtual methods
.method public final createRecentsViewScope(Landroid/content/Context;)Ljava/lang/String;
    .locals 8

    .line 1
    const-string v0, "viewContext"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "createRecentsViewScope "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "RecentsDependencies"

    .line 32
    .line 33
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->createScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-class v1, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "getSimpleName(...)"

    .line 47
    .line 48
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v3, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 52
    .line 53
    invoke-direct {v3}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1, v3}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    sget-object v1, Lcom/android/quickstep/recents/di/RecentsDependencies;->Companion:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    .line 60
    .line 61
    new-instance v3, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    const/4 v5, 0x1

    .line 65
    invoke-direct {v3, v4, v5, v4}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-class v6, Li2/b;

    .line 73
    .line 74
    const-string v7, "RecentsDependencies::GlobalScope"

    .line 75
    .line 76
    invoke-virtual {v1, v6, v7, v3, v4}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Li2/b;

    .line 81
    .line 82
    invoke-static {v4, v5, v4}, LF4/M0;->b(LF4/u0;ILjava/lang/Object;)LF4/t;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-interface {v1}, Li2/b;->a()LF4/E;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {v3, v1}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    new-instance v3, LF4/H;

    .line 95
    .line 96
    new-instance v4, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string v5, "RecentsView"

    .line 102
    .line 103
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-direct {v3, v4}, LF4/H;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-interface {v1, v3}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-static {v1}, LF4/J;->a(Ll4/g;)LF4/I;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const-class v3, LF4/I;

    .line 125
    .line 126
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-static {v3, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v3, v1}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->getScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {v0, p0}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->linkTo(Lcom/android/quickstep/recents/di/RecentsDependenciesScope;)V

    .line 141
    .line 142
    .line 143
    return-object p1
.end method

.method public final getScope(Ljava/lang/Object;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;
    .locals 1

    const-string v0, "scope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 2
    :cond_1
    invoke-virtual {p0, v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->getScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    move-result-object p0

    return-object p0
.end method

.method public final getScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;
    .locals 1

    const-string v0, "scopeId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/recents/di/RecentsDependencies;->scopes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->createScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    move-result-object p0

    return-object p0

    :cond_0
    return-object v0
.end method

.method public final inject(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    const-string v0, "modelClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0xe

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final inject(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 2
    const-string v0, "modelClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scopeId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v1 .. v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            ")TT;"
        }
    .end annotation

    .line 3
    const-string v0, "modelClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scopeId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "extras"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v1 .. v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            "Lu4/l<",
            "-",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "modelClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scopeId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "extras"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "RecentsDependencies::GlobalScope"

    goto :goto_0

    :cond_0
    move-object v0, p2

    .line 6
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/recents/di/RecentsDependencies;->scopes:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    if-nez v1, :cond_1

    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->createScope(Ljava/lang/String;)Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    move-result-object v1

    .line 7
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->getScopeId()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "inject "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " into "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x4

    invoke-direct {p0, v0, v2}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log(Ljava/lang/String;I)V

    .line 8
    monitor-enter p0

    .line 9
    :try_start_0
    invoke-direct {p0, v1, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->getDependency(Lcom/android/quickstep/recents/di/RecentsDependenciesScope;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 10
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "found instance? "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v2}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log(Ljava/lang/String;I)V

    if-nez v0, :cond_4

    const/4 v0, 0x0

    if-eqz p4, :cond_2

    .line 11
    invoke-interface {p4, p3}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_3

    :cond_2
    move-object p4, v0

    :goto_1
    if-nez p4, :cond_3

    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/recents/di/RecentsDependencies;->createDependency(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_2

    :cond_3
    move-object p2, p4

    .line 12
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    const-string p4, "getSimpleName(...)"

    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v1, p3, p2}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result p3

    invoke-virtual {v1}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->getScopeId()Ljava/lang/String;

    move-result-object p4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "instance of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " ("

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ") added to scope "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p3, 0x0

    const/4 p4, 0x2

    .line 14
    invoke-static {p0, p1, p3, p4, v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/String;IILjava/lang/Object;)V

    move-object v0, p2

    .line 15
    :cond_4
    sget-object p1, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    monitor-exit p0

    return-object v0

    :goto_3
    monitor-exit p0

    throw p1
.end method

.method public final synthetic inject(Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            "Lu4/l<",
            "-",
            "Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "scopeId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "extras"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x4

    .line 4
    const-string v1, "T"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->k(ILjava/lang/String;)V

    const-class v0, Ljava/lang/Object;

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final provide(Ljava/lang/Class;Ljava/lang/String;Lu4/a;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            "Lu4/a<",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "modelClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scopeId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "factory"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    new-instance v5, Lcom/android/quickstep/recents/di/a;

    invoke-direct {v5, p3}, Lcom/android/quickstep/recents/di/a;-><init>(Lu4/a;)V

    const/4 v6, 0x4

    const/4 v7, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v1 .. v7}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final provide(Ljava/lang/Class;Lu4/a;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lu4/a<",
            "+TT;>;)TT;"
        }
    .end annotation

    .line 1
    const-string v0, "modelClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "factory"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    invoke-static/range {v1 .. v6}, Lcom/android/quickstep/recents/di/RecentsDependencies;->provide$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/Class;Ljava/lang/String;Lu4/a;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final synthetic provide(Ljava/lang/String;Lu4/a;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lu4/a<",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "scopeId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "factory"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x4

    .line 2
    const-string v1, "T"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->k(ILjava/lang/String;)V

    const-class v0, Ljava/lang/Object;

    invoke-virtual {p0, v0, p1, p2}, Lcom/android/quickstep/recents/di/RecentsDependencies;->provide(Ljava/lang/Class;Ljava/lang/String;Lu4/a;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final removeScope(Ljava/lang/Object;)V
    .locals 3

    .line 1
    const-string v0, "scope"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    instance-of v0, p1, Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Ljava/lang/String;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v0, v1

    .line 16
    :goto_0
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/recents/di/RecentsDependencies;->scopes:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 33
    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->close()V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/recents/di/RecentsDependencies;->scopes:Ljava/util/Map;

    .line 40
    .line 41
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v2, "Scope "

    .line 50
    .line 51
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v0, " removed"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const/4 v0, 0x0

    .line 67
    const/4 v2, 0x2

    .line 68
    invoke-static {p0, p1, v0, v2, v1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->log$default(Lcom/android/quickstep/recents/di/RecentsDependencies;Ljava/lang/String;IILjava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
