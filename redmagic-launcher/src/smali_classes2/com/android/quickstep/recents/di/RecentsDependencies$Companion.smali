.class public final Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;
.super Ljava/lang/Object;
.source "RecentsDependencies.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/recents/di/RecentsDependencies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;-><init>()V

    return-void
.end method

.method private final initialize(Landroid/content/Context;)Lcom/android/quickstep/recents/di/RecentsDependencies;
    .locals 2

    .line 1
    const-string v0, "RecentsDependencies"

    .line 2
    .line 3
    const-string v1, "initializing"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    monitor-enter p0

    .line 9
    :try_start_0
    new-instance v0, Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v1, "getApplicationContext(...)"

    .line 16
    .line 17
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-direct {v0, p1, v1}, Lcom/android/quickstep/recents/di/RecentsDependencies;-><init>(Landroid/content/Context;Lkotlin/jvm/internal/j;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$setInstance$cp(Lcom/android/quickstep/recents/di/RecentsDependencies;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    monitor-exit p0

    .line 28
    return-object v0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    monitor-exit p0

    .line 31
    throw p1
.end method


# virtual methods
.method public final destroy(Landroid/content/Context;)V
    .locals 4

    .line 1
    const-string v0, "viewContext"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    invoke-static {}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$getInstance$cp()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 8
    .line 9
    .line 10
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$getScopes$p(Lcom/android/quickstep/recents/di/RecentsDependencies;)Ljava/util/Map;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;

    .line 32
    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    const-string p1, "RecentsDependencies"

    .line 36
    .line 37
    invoke-static {v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$getScopes$p(Lcom/android/quickstep/recents/di/RecentsDependencies;)Ljava/util/Map;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v2, "Trying to destroy an unknown scope. Scopes: "

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .line 64
    .line 65
    monitor-exit p0

    .line 66
    return-void

    .line 67
    :catchall_0
    move-exception p1

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    :try_start_2
    invoke-virtual {v1}, Lcom/android/quickstep/recents/di/RecentsDependenciesScope;->close()V

    .line 70
    .line 71
    .line 72
    invoke-static {v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$getScopes$p(Lcom/android/quickstep/recents/di/RecentsDependencies;)Ljava/util/Map;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    const-string v1, "RecentsDependencies"

    .line 80
    .line 81
    new-instance v2, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v3, "destroyed "

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    invoke-static {v0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$getScopes$p(Lcom/android/quickstep/recents/di/RecentsDependencies;)Ljava/util/Map;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    const/4 v0, 0x1

    .line 110
    if-ne p1, v0, :cond_2

    .line 111
    .line 112
    const/4 p1, 0x0

    .line 113
    invoke-static {p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$setInstance$cp(Lcom/android/quickstep/recents/di/RecentsDependencies;)V

    .line 114
    .line 115
    .line 116
    const-string p1, "RecentsDependencies"

    .line 117
    .line 118
    const-string v0, "also destroyed default scope"

    .line 119
    .line 120
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    :cond_2
    sget-object p1, Lh4/t;->a:Lh4/t;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 124
    .line 125
    monitor-exit p0

    .line 126
    return-void

    .line 127
    :goto_0
    monitor-exit p0

    .line 128
    throw p1
.end method

.method public final getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$getInstance$cp()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Lh4/s;

    .line 9
    .line 10
    const-string v0, "Recents dependencies are not initialized. Call `RecentsDependencies.maybeInitialize` before using this container."

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lh4/s;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method public final maybeInitialize(Landroid/content/Context;)Lcom/android/quickstep/recents/di/RecentsDependencies;
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/quickstep/recents/di/RecentsDependencies;->access$getInstance$cp()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->initialize(Landroid/content/Context;)Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    return-object v0
.end method
