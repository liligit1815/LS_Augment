.class public Ls1/P;
.super Lt1/f;
.source "IconCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/P$a;
    }
.end annotation


# instance fields
.field private final I:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/z;",
            ">;"
        }
    .end annotation
.end field

.field private final J:Landroid/content/pm/LauncherApps;

.field private final K:LD1/t;

.field private final L:LD1/b;

.field private final M:Lcom/android/launcher3/util/InstantAppResolver;

.field private final N:Lcom/android/launcher3/util/w;

.field private final O:Ls1/X$b;

.field private final P:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ls1/d;",
            ">;"
        }
    .end annotation
.end field

.field private Q:I

.field private R:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Lt1/f$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/String;LD1/t;Ls1/V;LD1/b;Ls1/X$b;Lcom/android/launcher3/util/K;)V
    .locals 8

    .line 1
    sget-object v1, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v1}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    iget v4, p2, Lcom/android/launcher3/F1;->O0:I

    .line 8
    .line 9
    iget v5, p2, Lcom/android/launcher3/F1;->N0:I

    .line 10
    .line 11
    const/4 v6, 0x1

    .line 12
    move-object v0, p0

    .line 13
    move-object v1, p1

    .line 14
    move-object v2, p3

    .line 15
    move-object v7, p5

    .line 16
    invoke-direct/range {v0 .. v7}, Lt1/f;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;IIZLs1/T;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ls1/N;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ls1/N;-><init>(Ls1/P;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Ls1/P;->I:Ljava/util/function/Predicate;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput v1, p0, Ls1/P;->Q:I

    .line 28
    .line 29
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/content/pm/LauncherApps;

    .line 36
    .line 37
    iput-object v1, p0, Ls1/P;->J:Landroid/content/pm/LauncherApps;

    .line 38
    .line 39
    iput-object p4, p0, Ls1/P;->K:LD1/t;

    .line 40
    .line 41
    iput-object p6, p0, Ls1/P;->L:LD1/b;

    .line 42
    .line 43
    iput-object p7, p0, Ls1/P;->O:Ls1/X$b;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/util/InstantAppResolver;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/util/InstantAppResolver;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, p0, Ls1/P;->M:Lcom/android/launcher3/util/InstantAppResolver;

    .line 50
    .line 51
    invoke-direct {p0}, Ls1/P;->L0()V

    .line 52
    .line 53
    .line 54
    new-instance v1, Landroid/util/SparseArray;

    .line 55
    .line 56
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Ls1/P;->P:Landroid/util/SparseArray;

    .line 60
    .line 61
    new-instance v1, Lcom/android/launcher3/util/w;

    .line 62
    .line 63
    new-instance v2, Ls1/O;

    .line 64
    .line 65
    invoke-direct {v2}, Ls1/O;-><init>()V

    .line 66
    .line 67
    .line 68
    sget-object v3, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 69
    .line 70
    new-instance v4, Ls1/s;

    .line 71
    .line 72
    invoke-direct {v4}, Ls1/s;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-direct {v1, v2, v3, v4}, Lcom/android/launcher3/util/w;-><init>(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V

    .line 76
    .line 77
    .line 78
    iput-object v1, p0, Ls1/P;->N:Lcom/android/launcher3/util/w;

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/android/launcher3/util/w;->e()V

    .line 81
    .line 82
    .line 83
    new-instance v1, Ls1/t;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ls1/t;-><init>(Ls1/P;)V

    .line 86
    .line 87
    .line 88
    move-object/from16 v0, p8

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private L0()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ls1/P;->R:Ljava/util/Map;

    .line 9
    .line 10
    return-void
.end method

.method private synthetic M0(Landroid/content/Intent;Lcom/android/launcher3/model/data/z;)Landroid/content/pm/LauncherActivityInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/P;->J:Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic N0(Lcom/android/launcher3/model/data/q;)Z
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object v0

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
    const-string v1, "Skipping Item info with null component name: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p1, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Launcher.IconCache"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object p1, p1, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 34
    .line 35
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x1

    .line 46
    return p0
.end method

.method private synthetic O0(LI/d;Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-interface {p2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ls1/A;

    .line 6
    .line 7
    invoke-direct {v1}, Ls1/A;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ls1/B;

    .line 15
    .line 16
    invoke-direct {v1}, Ls1/B;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ljava/util/stream/Collectors;->groupingBy(Ljava/util/function/Function;)Ljava/util/stream/Collector;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/util/Map;

    .line 28
    .line 29
    const-string v1, "loadIconSubsectionInBulk"

    .line 30
    .line 31
    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, p1, p2, v0}, Ls1/P;->S0(LI/d;Ljava/util/List;Ljava/util/Map;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic P0(Lcom/android/launcher3/model/data/z;)Z
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ls1/d;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private synthetic Q0(Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/model/data/z;
    .locals 1

    .line 1
    sget-object v0, Lt1/g;->d:Lt1/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method private synthetic R0(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/model/data/z;
    .locals 1

    .line 1
    sget-object v0, Lt1/g;->d:Lt1/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ls1/P;->I0(Lcom/android/launcher3/model/data/B;Lt1/g;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method private S0(LI/d;Ljava/util/List;Ljava/util/Map;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/model/data/z;",
            ">(",
            "LI/d<",
            "Landroid/os/UserHandle;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "TT;>;>;",
            "Ljava/util/Map<",
            "Landroid/content/ComponentName;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "TT;>;>;>;)V"
        }
    .end annotation

    .line 1
    move-object v9, p3

    .line 2
    const-string v10, "Launcher.IconCache"

    .line 3
    .line 4
    const-string v0, "loadIconSubsectionWithDatabase"

    .line 5
    .line 6
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lt1/g;->d:Lt1/g;

    .line 10
    .line 11
    iget-object v2, p1, LI/d;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0, v2}, Lt1/g;->k(Z)Lt1/g;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    :try_start_0
    iget-object v0, p1, LI/d;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Landroid/os/UserHandle;

    .line 26
    .line 27
    invoke-direct {p0, p2, v0, v6}, Ls1/P;->v0(Ljava/util/List;Landroid/os/UserHandle;Lt1/g;)Landroid/database/Cursor;

    .line 28
    .line 29
    .line 30
    move-result-object v7
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 31
    :try_start_1
    sget-object v0, Lt1/f;->s:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    :cond_0
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {p3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    move-object v8, v3

    .line 56
    check-cast v8, Ljava/util/List;

    .line 57
    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    if-eqz v8, :cond_1

    .line 61
    .line 62
    iget-object v3, p1, LI/d;->a:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast v3, Landroid/os/UserHandle;

    .line 65
    .line 66
    new-instance v4, Ls1/D;

    .line 67
    .line 68
    invoke-direct {v4, v8}, Ls1/D;-><init>(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    sget-object v5, Lt1/o;->a:Lt1/o;

    .line 72
    .line 73
    move-object v1, p0

    .line 74
    invoke-virtual/range {v1 .. v7}, Ls1/P;->i(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;Landroid/database/Cursor;)Lt1/f$a;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_0

    .line 87
    .line 88
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    check-cast v4, Lcom/android/launcher3/model/data/q;

    .line 93
    .line 94
    iget-object v4, v4, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 95
    .line 96
    invoke-virtual {p0, v2, v4}, Ls1/P;->r0(Lt1/f$a;Lcom/android/launcher3/model/data/z;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :catchall_0
    move-exception v0

    .line 101
    move-object v2, v0

    .line 102
    goto :goto_3

    .line 103
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v4, "Found entry in icon database but no main activity entry for cn: "

    .line 109
    .line 110
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-static {v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    :try_start_2
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 125
    .line 126
    .line 127
    :goto_2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 128
    .line 129
    .line 130
    goto :goto_6

    .line 131
    :catch_0
    move-exception v0

    .line 132
    goto :goto_5

    .line 133
    :goto_3
    if-eqz v7, :cond_3

    .line 134
    .line 135
    :try_start_3
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 136
    .line 137
    .line 138
    goto :goto_4

    .line 139
    :catchall_1
    move-exception v0

    .line 140
    :try_start_4
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 141
    .line 142
    .line 143
    :cond_3
    :goto_4
    throw v2
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 144
    :goto_5
    :try_start_5
    const-string v2, "Error reading icon cache"

    .line 145
    .line 146
    invoke-static {v10, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 147
    .line 148
    .line 149
    goto :goto_2

    .line 150
    :goto_6
    const-string v0, "loadIconSubsectionWithFallback"

    .line 151
    .line 152
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-eqz v2, :cond_b

    .line 168
    .line 169
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    move-object v7, v2

    .line 174
    check-cast v7, Landroid/content/ComponentName;

    .line 175
    .line 176
    invoke-interface {p3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    check-cast v2, Ljava/util/List;

    .line 181
    .line 182
    const/4 v3, 0x0

    .line 183
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    check-cast v2, Lcom/android/launcher3/model/data/q;

    .line 188
    .line 189
    iget-object v4, v2, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 190
    .line 191
    iget-object v5, v4, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 192
    .line 193
    iget-object v6, v4, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 194
    .line 195
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    if-eqz v5, :cond_5

    .line 200
    .line 201
    iget-object v8, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 202
    .line 203
    invoke-virtual {p0, v5, v8}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 204
    .line 205
    .line 206
    move-result v8

    .line 207
    if-nez v8, :cond_5

    .line 208
    .line 209
    sget-object v8, Ls1/d;->i:Ls1/d;

    .line 210
    .line 211
    if-ne v5, v8, :cond_6

    .line 212
    .line 213
    :cond_5
    const/4 v3, 0x1

    .line 214
    :cond_6
    if-nez v6, :cond_7

    .line 215
    .line 216
    if-eqz v3, :cond_4

    .line 217
    .line 218
    :cond_7
    new-instance v8, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 221
    .line 222
    .line 223
    const-string v11, "Database bulk icon loading failed, using fallback bulk icon loading for: "

    .line 224
    .line 225
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v8

    .line 235
    invoke-static {v10, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    move v8, v3

    .line 239
    new-instance v3, Lt1/f$a;

    .line 240
    .line 241
    invoke-direct {v3}, Lt1/f$a;-><init>()V

    .line 242
    .line 243
    .line 244
    iget-object v2, v2, Lcom/android/launcher3/model/data/q;->b:Landroid/content/pm/LauncherActivityInfo;

    .line 245
    .line 246
    iget-object v11, v4, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 247
    .line 248
    iput-object v11, v3, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 249
    .line 250
    if-eqz v5, :cond_8

    .line 251
    .line 252
    iput-object v5, v3, Lt1/f$a;->a:Ls1/d;

    .line 253
    .line 254
    :cond_8
    iget-object v4, v4, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 255
    .line 256
    iput-object v4, v3, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 257
    .line 258
    if-eqz v8, :cond_9

    .line 259
    .line 260
    sget-object v4, Lt1/o;->a:Lt1/o;

    .line 261
    .line 262
    iget-object v5, p1, LI/d;->a:Ljava/lang/Object;

    .line 263
    .line 264
    move-object v8, v5

    .line 265
    check-cast v8, Landroid/os/UserHandle;

    .line 266
    .line 267
    const/4 v5, 0x0

    .line 268
    move-object v1, p0

    .line 269
    invoke-virtual/range {v1 .. v8}, Lt1/f;->I(Ljava/lang/Object;Lt1/f$a;Lt1/j;ZZLandroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 270
    .line 271
    .line 272
    :cond_9
    if-eqz v2, :cond_a

    .line 273
    .line 274
    sget-object v4, Lt1/o;->a:Lt1/o;

    .line 275
    .line 276
    iget-object v5, p1, LI/d;->a:Ljava/lang/Object;

    .line 277
    .line 278
    check-cast v5, Landroid/os/UserHandle;

    .line 279
    .line 280
    invoke-virtual {p0, v2, v3, v4, v5}, Lt1/f;->J(Ljava/lang/Object;Lt1/f$a;Lt1/j;Landroid/os/UserHandle;)V

    .line 281
    .line 282
    .line 283
    :cond_a
    invoke-interface {p3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    check-cast v2, Ljava/util/List;

    .line 288
    .line 289
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 294
    .line 295
    .line 296
    move-result v4

    .line 297
    if-eqz v4, :cond_4

    .line 298
    .line 299
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    check-cast v4, Lcom/android/launcher3/model/data/q;

    .line 304
    .line 305
    iget-object v4, v4, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 306
    .line 307
    invoke-virtual {p0, v3, v4}, Ls1/P;->r0(Lt1/f$a;Lcom/android/launcher3/model/data/z;)V

    .line 308
    .line 309
    .line 310
    goto :goto_7

    .line 311
    :cond_b
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :catchall_2
    move-exception v0

    .line 316
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 317
    .line 318
    .line 319
    throw v0
.end method

.method private T0()V
    .locals 1

    .line 1
    iget v0, p0, Ls1/P;->Q:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iput v0, p0, Ls1/P;->Q:I

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->t(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private U0(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lx1/g;->b(Ljava/lang/String;)LI/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object v0, p0, LI/d;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p1, Lcom/android/launcher3/model/data/y;->pinyinFull:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, LI/d;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    iput-object p0, p1, Lcom/android/launcher3/model/data/y;->pinyinHeader:Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic W(Lcom/android/launcher3/model/data/q;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 4
    .line 5
    const/4 v1, 0x6

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "Skipping Item info for deep shortcut: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "Launcher.IconCache"

    .line 33
    .line 34
    invoke-static {v1, p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public static synthetic X(Ls1/P;Landroid/content/Intent;Lcom/android/launcher3/model/data/z;)Landroid/content/pm/LauncherActivityInfo;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ls1/P;->M0(Landroid/content/Intent;Lcom/android/launcher3/model/data/z;)Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y(Ls1/h;)Ls1/h;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic Z(Lcom/android/launcher3/model/data/q;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic a0(Ls1/P;Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/model/data/z;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ls1/P;->R0(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c0(Ls1/P;LI/d;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ls1/P;->O0(LI/d;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d0()Landroid/content/pm/LauncherActivityInfo;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static synthetic e0(Ljava/util/List;)Landroid/content/pm/LauncherActivityInfo;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/android/launcher3/model/data/q;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/model/data/q;->b:Landroid/content/pm/LauncherActivityInfo;

    .line 9
    .line 10
    return-object p0
.end method

.method public static synthetic f0(Ls1/P;Lcom/android/launcher3/model/data/q;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ls1/P;->N0(Lcom/android/launcher3/model/data/q;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g0()Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static synthetic h0(Lcom/android/launcher3/model/data/q;)LI/d;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/model/data/q;->d:Z

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, LI/d;->a(Ljava/lang/Object;Ljava/lang/Object;)LI/d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic i0(Lt1/h;)Lt1/h;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic j0(Ls1/P;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ls1/P;->T0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k0(Landroid/content/pm/LauncherActivityInfo;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Landroid/content/pm/ApplicationInfo;->isArchived:Z

    .line 6
    .line 7
    return p0
.end method

.method public static synthetic l0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/pm/LauncherActivityInfo;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic n0(Ls1/P;Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/model/data/z;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ls1/P;->Q0(Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o0(I)[Ljava/lang/String;
    .locals 0

    .line 1
    new-array p0, p0, [Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p0(Ls1/P;Lcom/android/launcher3/model/data/z;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ls1/P;->P0(Lcom/android/launcher3/model/data/z;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic q0(Lcom/android/launcher3/model/data/q;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private v0(Ljava/util/List;Landroid/os/UserHandle;Lt1/g;)Landroid/database/Cursor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/model/data/z;",
            ">(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "TT;>;>;",
            "Landroid/os/UserHandle;",
            "Lt1/g;",
            ")",
            "Landroid/database/Cursor;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ls1/E;

    .line 6
    .line 7
    invoke-direct {v0}, Ls1/E;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Lcom/android/launcher3/folder/P;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/folder/P;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/stream/Stream;->distinct()Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ls1/F;

    .line 28
    .line 29
    invoke-direct {v0}, Ls1/F;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p2}, Ls1/P;->B(Landroid/os/UserHandle;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {p2}, Ljava/util/stream/Stream;->of(Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p1, p2}, Ljava/util/stream/Stream;->concat(Ljava/util/stream/Stream;Ljava/util/stream/Stream;)Ljava/util/stream/Stream;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Ls1/G;

    .line 53
    .line 54
    invoke-direct {p2}, Ls1/G;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, [Ljava/lang/String;

    .line 62
    .line 63
    array-length p2, p1

    .line 64
    add-int/lit8 p2, p2, -0x1

    .line 65
    .line 66
    const-string v0, "?"

    .line 67
    .line 68
    invoke-static {p2, v0}, Ljava/util/Collections;->nCopies(ILjava/lang/Object;)Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    const-string v0, ","

    .line 73
    .line 74
    invoke-static {v0, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    iget-object p0, p0, Lt1/f;->j:Lt1/f$c;

    .line 79
    .line 80
    invoke-static {p3}, Lt1/f;->Q(Lt1/g;)[Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    sget-object v1, Lt1/f;->s:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v1, " IN ( "

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p2, " ) AND "

    .line 103
    .line 104
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    sget-object p2, Lt1/f;->t:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p2, " = ?"

    .line 113
    .line 114
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p0, p3, p2, p1}, Lcom/android/launcher3/util/Z1;->i([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0
.end method

.method private declared-synchronized w0(Ls1/d;Landroid/os/UserHandle;)Ls1/d;
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0, p2}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 5
    .line 6
    .line 7
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return-object p1

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    :try_start_1
    invoke-virtual {p0, p2}, Lt1/f;->E(Landroid/os/UserHandle;)Lcom/android/launcher3/util/p0;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1, p2}, Ls1/d;->t(Lcom/android/launcher3/util/p0;)Ls1/d;

    .line 17
    .line 18
    .line 19
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    monitor-exit p0

    .line 21
    return-object p1

    .line 22
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 23
    throw p1
.end method


# virtual methods
.method public A0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/ShortcutInfo;)V
    .locals 2

    .line 1
    new-instance v0, Ls1/h;

    .line 2
    .line 3
    iget-object v1, p0, Lt1/f;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p2, v1}, Ls1/h;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Ls1/P;->B0(Lcom/android/launcher3/model/data/z;Ls1/h;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public B(Landroid/os/UserHandle;)J
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/P;->K:LD1/t;

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

.method public B0(Lcom/android/launcher3/model/data/z;Ls1/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/P;->I:Ljava/util/function/Predicate;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ls1/P;->C0(Lcom/android/launcher3/model/data/z;Ls1/h;Ljava/util/function/Predicate;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0(Lcom/android/launcher3/model/data/z;Ls1/h;Ljava/util/function/Predicate;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/model/data/z;",
            ">(TT;",
            "Ls1/h;",
            "Ljava/util/function/Predicate<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    sget-object v4, Ls1/g;->a:Ls1/g;

    .line 2
    .line 3
    invoke-virtual {v4, p2}, Ls1/g;->n(Ls1/h;)Landroid/os/UserHandle;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {v4, p2}, Ls1/g;->j(Ls1/h;)Landroid/content/ComponentName;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v3, Ls1/C;

    .line 12
    .line 13
    invoke-direct {v3, p2}, Ls1/C;-><init>(Ls1/h;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lt1/g;->d:Lt1/g;

    .line 17
    .line 18
    invoke-virtual {v0}, Lt1/g;->g()Lt1/g;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    move-object v0, p0

    .line 23
    invoke-virtual/range {v0 .. v5}, Lt1/f;->h(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;)Lt1/f$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lt1/f$a;->a:Ls1/d;

    .line 28
    .line 29
    invoke-virtual {p0}, Ls1/d;->l()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :cond_0
    invoke-virtual {v0, p0, v2}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-interface {p3, p1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    if-eqz p3, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    iput-object p0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 53
    .line 54
    invoke-virtual {p2}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {p3}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    const-string v1, "com.zte.halo.app"

    .line 63
    .line 64
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-eqz p3, :cond_2

    .line 69
    .line 70
    invoke-virtual {p2}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-virtual {p3}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    const-string v1, "ai_agent_"

    .line 79
    .line 80
    invoke-virtual {p3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    if-eqz p3, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    invoke-virtual {p2}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-virtual {p3}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    const-string v1, "com.jiutian.yidonglingxi"

    .line 96
    .line 97
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    if-eqz p3, :cond_3

    .line 102
    .line 103
    :goto_0
    return-void

    .line 104
    :cond_3
    invoke-virtual {p2}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    const-string v1, "needShowBadge"

    .line 109
    .line 110
    invoke-static {p3, v1}, Lcom/android/launcher3/H5;->j0(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result p3

    .line 114
    if-eqz p3, :cond_4

    .line 115
    .line 116
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p3}, Lcom/android/launcher3/resource/B;->z()Z

    .line 121
    .line 122
    .line 123
    move-result p3

    .line 124
    if-nez p3, :cond_4

    .line 125
    .line 126
    invoke-virtual {p2}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-virtual {v0, p2}, Ls1/P;->D0(Landroid/content/pm/ShortcutInfo;)Ls1/d;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-virtual {p0, p2}, Ls1/d;->s(Ls1/d;)Ls1/d;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    iput-object p0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 139
    .line 140
    :cond_4
    :goto_1
    return-void
.end method

.method public D0(Landroid/content/pm/ShortcutInfo;)Ls1/d;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ls1/P;->E0(Landroid/content/pm/ShortcutInfo;)Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 6
    .line 7
    return-object p0
.end method

.method protected E0(Landroid/content/pm/ShortcutInfo;)Lcom/android/launcher3/model/data/z;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "extra_shortcut_badge_override_package"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Ls1/P;->L:LD1/b;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v2, v0, v3}, LD1/b;->g(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    move-object v0, v1

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getActivity()Landroid/content/ComponentName;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    new-instance v0, Lcom/android/launcher3/model/data/d;

    .line 50
    .line 51
    invoke-direct {v0}, Lcom/android/launcher3/model/data/d;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 61
    .line 62
    new-instance p1, Landroid/content/Intent;

    .line 63
    .line 64
    const-string v2, "android.intent.action.MAIN"

    .line 65
    .line 66
    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v2, "android.intent.category.LAUNCHER"

    .line 70
    .line 71
    invoke-virtual {p1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, v0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 80
    .line 81
    sget-object p1, Lt1/g;->d:Lt1/g;

    .line 82
    .line 83
    invoke-virtual {p0, v0, p1}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 84
    .line 85
    .line 86
    return-object v0

    .line 87
    :cond_2
    :goto_1
    new-instance v1, Lcom/android/launcher3/model/data/B;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-direct {v1, v0, p1}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 94
    .line 95
    .line 96
    sget-object p1, Lt1/g;->d:Lt1/g;

    .line 97
    .line 98
    invoke-virtual {p0, v1, p1}, Ls1/P;->I0(Lcom/android/launcher3/model/data/B;Lt1/g;)V

    .line 99
    .line 100
    .line 101
    return-object v1
.end method

.method public declared-synchronized F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-boolean v0, v0, Landroid/content/pm/ActivityInfo;->isArchived:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :goto_0
    new-instance v1, Ls1/u;

    .line 24
    .line 25
    invoke-direct {v1, p2}, Ls1/u;-><init>(Landroid/content/pm/LauncherActivityInfo;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p3, v0}, Lt1/g;->n(Z)Lt1/g;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p1, v1, p2}, Ls1/P;->G0(Lcom/android/launcher3/model/data/z;Ljava/util/function/Supplier;Lt1/g;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public declared-synchronized G0(Lcom/android/launcher3/model/data/z;Ljava/util/function/Supplier;Lt1/g;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/z;",
            "Ljava/util/function/Supplier<",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;",
            "Lt1/g;",
            ")V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 3
    .line 4
    .line 5
    move-result-object v2

    .line 6
    iget-object v3, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 7
    .line 8
    sget-object v5, Lt1/o;->a:Lt1/o;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    .line 10
    move-object v1, p0

    .line 11
    move-object v4, p2

    .line 12
    move-object v6, p3

    .line 13
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Lt1/f;->h(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;)Lt1/f$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v1, p0, p1}, Ls1/P;->r0(Lt1/f$a;Lcom/android/launcher3/model/data/z;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    monitor-exit v1

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    :goto_0
    move-object p0, v0

    .line 24
    goto :goto_1

    .line 25
    :catchall_1
    move-exception v0

    .line 26
    move-object v1, p0

    .line 27
    goto :goto_0

    .line 28
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 29
    throw p0
.end method

.method protected H(Landroid/content/pm/ApplicationInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/P;->M:Lcom/android/launcher3/util/InstantAppResolver;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/InstantAppResolver;->isInstantApp(Landroid/content/pm/ApplicationInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public declared-synchronized H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 15
    .line 16
    const-string p2, ""

    .line 17
    .line 18
    iput-object p2, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 19
    .line 20
    const-string p2, ""

    .line 21
    .line 22
    iput-object p2, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ls1/M;

    .line 32
    .line 33
    invoke-direct {v1, p0, v0, p1}, Ls1/M;-><init>(Ls1/P;Landroid/content/Intent;Lcom/android/launcher3/model/data/z;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Lt1/g;->m()Lt1/g;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p0, p1, v1, p2}, Ls1/P;->G0(Lcom/android/launcher3/model/data/z;Ljava/util/function/Supplier;Lt1/g;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    :goto_0
    monitor-exit p0

    .line 44
    return-void

    .line 45
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    throw p1
.end method

.method public declared-synchronized I0(Lcom/android/launcher3/model/data/B;Lt1/g;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 3
    .line 4
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 5
    .line 6
    invoke-virtual {p0, v0, v1, p2}, Lt1/f;->q(Ljava/lang/String;Landroid/os/UserHandle;Lt1/g;)Lt1/f$a;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p0, p2, p1}, Ls1/P;->r0(Lt1/f$a;Lcom/android/launcher3/model/data/z;)V

    .line 11
    .line 12
    .line 13
    iget p2, p1, Lcom/android/launcher3/model/data/B;->l:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    if-ne p2, v0, :cond_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :cond_0
    :try_start_1
    iget-object p2, p0, Lt1/f;->a:Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/android/launcher3/widget/Z0;->a(Landroid/content/Context;)Landroid/util/SparseArray;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iget v0, p1, Lcom/android/launcher3/model/data/B;->l:I

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Lcom/android/launcher3/widget/Z0$a;

    .line 33
    .line 34
    iget-object v0, p0, Lt1/f;->a:Landroid/content/Context;

    .line 35
    .line 36
    iget v1, p2, Lcom/android/launcher3/widget/Z0$a;->b:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 43
    .line 44
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Lt1/f;->D(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    :try_start_2
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const/16 v0, 0x2000

    .line 67
    .line 68
    :goto_0
    const-string v1, "com.android.systemui"

    .line 69
    .line 70
    const-string v2, ".people.widget.PeopleSpaceWidgetProvider"

    .line 71
    .line 72
    invoke-static {v1, v2}, Landroid/content/ComponentName;->createRelative(Ljava/lang/String;Ljava/lang/String;)Landroid/content/ComponentName;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {p0}, Lt1/f;->A()Landroid/content/pm/PackageManager;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v2, v1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 89
    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0}, Lt1/f;->A()Landroid/content/pm/PackageManager;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :catchall_0
    move-exception p1

    .line 104
    goto :goto_5

    .line 105
    :catch_0
    move-exception v0

    .line 106
    :try_start_3
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 107
    .line 108
    iput-object v1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 111
    .line 112
    .line 113
    :cond_2
    :goto_1
    iget-object v0, p0, Ls1/P;->P:Landroid/util/SparseArray;

    .line 114
    .line 115
    iget v1, p1, Lcom/android/launcher3/model/data/B;->l:I

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Ls1/d;

    .line 122
    .line 123
    if-eqz v0, :cond_3

    .line 124
    .line 125
    iget-object p2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 126
    .line 127
    invoke-direct {p0, v0, p2}, Ls1/P;->w0(Ls1/d;Landroid/os/UserHandle;)Ls1/d;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    iput-object p2, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 132
    .line 133
    monitor-exit p0

    .line 134
    return-void

    .line 135
    :cond_3
    :try_start_4
    iget-object v0, p0, Ls1/P;->O:Ls1/X$b;

    .line 136
    .line 137
    invoke-virtual {v0}, Ls1/X$b;->b()Ls1/X;

    .line 138
    .line 139
    .line 140
    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 141
    :try_start_5
    iget-object v1, p0, Lt1/f;->a:Landroid/content/Context;

    .line 142
    .line 143
    iget p2, p2, Lcom/android/launcher3/widget/Z0$a;->c:I

    .line 144
    .line 145
    invoke-virtual {v1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    new-instance v1, Ls1/b$c;

    .line 150
    .line 151
    invoke-direct {v1}, Ls1/b$c;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, p2, v1}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    iget-object v1, p0, Ls1/P;->P:Landroid/util/SparseArray;

    .line 159
    .line 160
    iget v2, p1, Lcom/android/launcher3/model/data/B;->l:I

    .line 161
    .line 162
    invoke-virtual {v1, v2, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 166
    .line 167
    invoke-direct {p0, p2, v1}, Ls1/P;->w0(Ls1/d;Landroid/os/UserHandle;)Ls1/d;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    iput-object p2, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 172
    .line 173
    :try_start_6
    invoke-virtual {v0}, Ls1/X;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :catch_1
    move-exception p1

    .line 178
    goto :goto_3

    .line 179
    :catchall_1
    move-exception p1

    .line 180
    if-eqz v0, :cond_4

    .line 181
    .line 182
    :try_start_7
    invoke-virtual {v0}, Ls1/X;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :catchall_2
    move-exception p2

    .line 187
    :try_start_8
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 188
    .line 189
    .line 190
    :cond_4
    :goto_2
    throw p1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 191
    :goto_3
    :try_start_9
    const-string p2, "Launcher.IconCache"

    .line 192
    .line 193
    const-string v0, "Error initializing bitmap for icons with widget category"

    .line 194
    .line 195
    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 196
    .line 197
    .line 198
    :goto_4
    monitor-exit p0

    .line 199
    return-void

    .line 200
    :goto_5
    :try_start_a
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 201
    throw p1
.end method

.method public declared-synchronized J0(Lt1/h;)Ljava/lang/String;
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-interface {p1}, Lt1/h;->g()Landroid/content/ComponentName;

    .line 3
    .line 4
    .line 5
    move-result-object v2

    .line 6
    invoke-interface {p1}, Lt1/h;->e()Landroid/os/UserHandle;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    new-instance v4, Ls1/r;

    .line 11
    .line 12
    invoke-direct {v4, p1}, Ls1/r;-><init>(Lt1/h;)V

    .line 13
    .line 14
    .line 15
    sget-object v5, Lt1/i;->a:Lt1/i;

    .line 16
    .line 17
    sget-object p1, Lt1/g;->d:Lt1/g;

    .line 18
    .line 19
    invoke-virtual {p1}, Lt1/g;->j()Lt1/g;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lt1/g;->g()Lt1/g;

    .line 24
    .line 25
    .line 26
    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 27
    move-object v1, p0

    .line 28
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Lt1/f;->h(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;)Lt1/f$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object p0, p0, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    monitor-exit v1

    .line 39
    return-object p0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    :goto_0
    move-object p0, v0

    .line 42
    goto :goto_1

    .line 43
    :catchall_1
    move-exception v0

    .line 44
    move-object v1, p0

    .line 45
    goto :goto_0

    .line 46
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw p0
.end method

.method protected K(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    const-string p0, "BaseIconCache"

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/logging/b;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public declared-synchronized K0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/model/data/z;",
            ">(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    new-instance v0, Ls1/w;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ls1/w;-><init>(Ls1/P;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ls1/x;

    .line 16
    .line 17
    invoke-direct {v0}, Ls1/x;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ljava/util/stream/Collectors;->groupingBy(Ljava/util/function/Function;)Ljava/util/stream/Collector;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ljava/util/Map;

    .line 29
    .line 30
    const-string v0, "loadIconsInBulk"

    .line 31
    .line 32
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ls1/y;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ls1/y;-><init>(Ls1/P;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p1, v0}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return-void

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    throw p1
.end method

.method protected declared-synchronized T(II)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1, p2}, Lt1/f;->T(II)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Ls1/P;->R:Ljava/util/Map;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p1
.end method

.method public V0(Landroid/content/pm/LauncherActivityInfo;Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2, p3}, Lt1/f;->P(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object p1, p0, Ls1/P;->K:LD1/t;

    .line 5
    .line 6
    invoke-virtual {p1, p3}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-object p1, p0, Ls1/P;->J:Landroid/content/pm/LauncherApps;

    .line 11
    .line 12
    invoke-virtual {p1, p2, p3}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Landroid/content/pm/LauncherActivityInfo;

    .line 31
    .line 32
    sget-object p3, Lt1/o;->a:Lt1/o;

    .line 33
    .line 34
    invoke-virtual {p0, p2, p3, v0, v1}, Lt1/f;->e(Ljava/lang/Object;Lt1/j;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-exception p0

    .line 39
    const-string p1, "Launcher.IconCache"

    .line 40
    .line 41
    const-string p2, "Package not found"

    .line 42
    .line 43
    invoke-static {p1, p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public W0(Ls1/P$a;Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/util/w;
    .locals 4

    .line 1
    instance-of v0, p2, Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    instance-of v0, p2, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    instance-of v0, p2, Lcom/android/launcher3/model/data/B;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    check-cast p2, Lcom/android/launcher3/model/data/B;

    .line 15
    .line 16
    new-instance v0, Ls1/I;

    .line 17
    .line 18
    invoke-direct {v0, p0, p2}, Ls1/I;-><init>(Ls1/P;Lcom/android/launcher3/model/data/B;)V

    .line 19
    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v0, "Icon update not supported for "

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    const-string p1, "null"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :goto_0
    const-string p2, "Launcher.IconCache"

    .line 53
    .line 54
    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ls1/P;->N:Lcom/android/launcher3/util/w;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_3
    :goto_1
    new-instance v0, Ls1/H;

    .line 61
    .line 62
    invoke-direct {v0, p0, p2}, Ls1/H;-><init>(Ls1/P;Lcom/android/launcher3/model/data/z;)V

    .line 63
    .line 64
    .line 65
    :goto_2
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    if-ne p2, v1, :cond_5

    .line 74
    .line 75
    iget p2, p0, Ls1/P;->Q:I

    .line 76
    .line 77
    if-gtz p2, :cond_4

    .line 78
    .line 79
    sget-object p2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 80
    .line 81
    const/4 v1, 0x2

    .line 82
    invoke-virtual {p2, v1}, Lcom/android/launcher3/util/p1;->c(I)V

    .line 83
    .line 84
    .line 85
    :cond_4
    iget p2, p0, Ls1/P;->Q:I

    .line 86
    .line 87
    add-int/lit8 p2, p2, 0x1

    .line 88
    .line 89
    iput p2, p0, Ls1/P;->Q:I

    .line 90
    .line 91
    new-instance p2, Ls1/J;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Ls1/J;-><init>(Ls1/P;)V

    .line 94
    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_5
    new-instance p2, Ls1/K;

    .line 98
    .line 99
    invoke-direct {p2}, Ls1/K;-><init>()V

    .line 100
    .line 101
    .line 102
    :goto_3
    new-instance v1, Lcom/android/launcher3/util/w;

    .line 103
    .line 104
    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 105
    .line 106
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    new-instance v3, Ls1/L;

    .line 110
    .line 111
    invoke-direct {v3, p1}, Ls1/L;-><init>(Ls1/P$a;)V

    .line 112
    .line 113
    .line 114
    invoke-direct {v1, v0, v2, v3, p2}, Lcom/android/launcher3/util/w;-><init>(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lt1/f;->i:Landroid/os/Handler;

    .line 118
    .line 119
    invoke-static {p0, v1}, Lcom/android/launcher3/N5;->R(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 120
    .line 121
    .line 122
    return-object v1
.end method

.method public declared-synchronized X0(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ls1/P;->J:Landroid/content/pm/LauncherApps;

    .line 3
    .line 4
    invoke-virtual {v0, p1, p2}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {}, Lcom/android/launcher3/y0;->C0()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ls1/v;

    .line 19
    .line 20
    invoke-direct {v2}, Ls1/v;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 24
    .line 25
    .line 26
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lt1/f;->P(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ls1/P;->K:LD1/t;

    .line 37
    .line 38
    invoke-virtual {p1, p2}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 39
    .line 40
    .line 41
    move-result-wide p1

    .line 42
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Landroid/content/pm/LauncherActivityInfo;

    .line 57
    .line 58
    sget-object v2, Lt1/o;->a:Lt1/o;

    .line 59
    .line 60
    invoke-virtual {p0, v1, v2, p1, p2}, Lt1/f;->e(Ljava/lang/Object;Lt1/j;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    monitor-exit p0

    .line 65
    return-void

    .line 66
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    throw p1
.end method

.method public Y0(Lcom/android/launcher3/model/data/B;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lt1/f;->A()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 13
    .line 14
    invoke-virtual {p0}, Lt1/f;->A()Landroid/content/pm/PackageManager;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iput-object p0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    move-exception p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public Z0(Lcom/android/launcher3/util/L1;Landroid/content/pm/PackageInstaller$SessionInfo;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppIcon()Landroid/graphics/Bitmap;

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
    const-string v2, "updateSessionCache appIcon: "

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, " ,appLabel: "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppLabel()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, " , "

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "Launcher.IconCache"

    .line 47
    .line 48
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    const-string v1, "com.telstra.mobile.android.mytelstra"

    .line 54
    .line 55
    invoke-virtual {p2}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    const-string v0, "updateSessionCache use local icon"

    .line 66
    .line 67
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ls1/P;->y0()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const v1, 0x7f080a16

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    :cond_0
    iget-object v1, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 92
    .line 93
    invoke-virtual {p2}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppLabel()Ljava/lang/CharSequence;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p0, v1, p1, v0, p2}, Lt1/f;->m(Ljava/lang/String;Landroid/os/UserHandle;Landroid/graphics/Bitmap;Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public declared-synchronized a1(Lcom/android/launcher3/model/data/d;)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v2, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 3
    .line 4
    iget-object v3, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 5
    .line 6
    new-instance v4, Ls1/z;

    .line 7
    .line 8
    invoke-direct {v4}, Ls1/z;-><init>()V

    .line 9
    .line 10
    .line 11
    sget-object v5, Lt1/o;->a:Lt1/o;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 14
    .line 15
    .line 16
    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 17
    move-object v1, p0

    .line 18
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Lt1/f;->h(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;)Lt1/f$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object v0, p0, Lt1/f$a;->a:Ls1/d;

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 27
    .line 28
    invoke-virtual {v1, v0, v2}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    :goto_0
    move-object p0, v0

    .line 37
    goto :goto_2

    .line 38
    :cond_0
    :goto_1
    invoke-virtual {v1, p0, p1}, Ls1/P;->r0(Lt1/f$a;Lcom/android/launcher3/model/data/z;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    .line 40
    .line 41
    :cond_1
    monitor-exit v1

    .line 42
    return-void

    .line 43
    :catchall_1
    move-exception v0

    .line 44
    move-object v1, p0

    .line 45
    goto :goto_0

    .line 46
    :goto_2
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw p0
.end method

.method protected i(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;Landroid/database/Cursor;)Lt1/f$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/ComponentName;",
            "Landroid/os/UserHandle;",
            "Ljava/util/function/Supplier<",
            "TT;>;",
            "Lt1/j<",
            "TT;>;",
            "Lt1/g;",
            "Landroid/database/Cursor;",
            ")",
            "Lt1/f$a;"
        }
    .end annotation

    .line 1
    invoke-super/range {p0 .. p6}, Lt1/f;->i(Landroid/content/ComponentName;Landroid/os/UserHandle;Ljava/util/function/Supplier;Lt1/j;Lt1/g;Landroid/database/Cursor;)Lt1/f$a;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance p3, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string p4, "_"

    .line 11
    .line 12
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lx1/O;->k0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    const-string p4, "_gen_nubia_cn"

    .line 27
    .line 28
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    if-eqz p3, :cond_0

    .line 33
    .line 34
    const-string p3, ""

    .line 35
    .line 36
    invoke-static {p3, p1}, Lx1/S;->m(Ljava/lang/String;Landroid/content/ComponentName;)Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    if-eqz p3, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Ls1/P;->y0()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-static {p3, p1, p2}, Lx1/S;->c(Landroid/content/Context;Landroid/content/ComponentName;Lt1/f$a;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object p3, p0, Lt1/f;->a:Landroid/content/Context;

    .line 50
    .line 51
    invoke-static {p3}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    iget-object p4, p0, Lt1/f;->a:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {p3, p1, p4}, Lcom/android/launcher3/r4;->y(Landroid/content/ComponentName;Landroid/content/Context;)Z

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    if-eqz p3, :cond_4

    .line 62
    .line 63
    :try_start_0
    iget-object p3, p0, Lt1/f;->a:Landroid/content/Context;

    .line 64
    .line 65
    invoke-static {p3}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 66
    .line 67
    .line 68
    move-result-object p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :try_start_1
    invoke-static {p1}, Lx1/O;->e0(Landroid/content/ComponentName;)Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    if-nez p4, :cond_1

    .line 74
    .line 75
    invoke-static {p1}, Lx1/O;->f0(Landroid/content/ComponentName;)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p4

    .line 79
    goto :goto_0

    .line 80
    :catchall_0
    move-exception v0

    .line 81
    move-object p0, v0

    .line 82
    goto :goto_2

    .line 83
    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    .line 84
    .line 85
    new-instance p5, Ls1/b$c;

    .line 86
    .line 87
    invoke-direct {p5}, Ls1/b$c;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 91
    .line 92
    .line 93
    move-result-object p6

    .line 94
    invoke-virtual {p5, p6}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 95
    .line 96
    .line 97
    move-result-object p5

    .line 98
    invoke-virtual {p3, p4, p5}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 99
    .line 100
    .line 101
    move-result-object p4

    .line 102
    iput-object p4, p2, Lt1/f$a;->a:Ls1/d;

    .line 103
    .line 104
    iget-object p4, p0, Lt1/f;->a:Landroid/content/Context;

    .line 105
    .line 106
    invoke-static {p4}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 107
    .line 108
    .line 109
    move-result-object p4

    .line 110
    iget-object p0, p0, Lt1/f;->a:Landroid/content/Context;

    .line 111
    .line 112
    invoke-virtual {p4, p1, p0}, Lcom/android/launcher3/H5;->L(Landroid/content/ComponentName;Landroid/content/Context;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    iput-object p0, p2, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 117
    .line 118
    iput-object p0, p2, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p0, p1}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    iput-object p0, p2, Lt1/f$a;->a:Ls1/d;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    .line 131
    :goto_1
    if-eqz p3, :cond_4

    .line 132
    .line 133
    :try_start_2
    invoke-virtual {p3}, Ls1/X;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 134
    .line 135
    .line 136
    return-object p2

    .line 137
    :catch_0
    move-exception v0

    .line 138
    move-object p0, v0

    .line 139
    goto :goto_4

    .line 140
    :goto_2
    if-eqz p3, :cond_3

    .line 141
    .line 142
    :try_start_3
    invoke-virtual {p3}, Ls1/X;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :catchall_1
    move-exception v0

    .line 147
    move-object p1, v0

    .line 148
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 149
    .line 150
    .line 151
    :cond_3
    :goto_3
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 152
    :goto_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    const-string p3, "cacheLocked: getFakeAppIcon e = "

    .line 158
    .line 159
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    const-string p1, "Launcher.IconCache"

    .line 174
    .line 175
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    :cond_4
    return-object p2
.end method

.method protected r0(Lt1/f$a;Lcom/android/launcher3/model/data/z;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 8
    .line 9
    iget-object v0, p1, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 10
    .line 11
    iput-object v0, p2, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 12
    .line 13
    iget-object p1, p1, Lt1/f$a;->a:Ls1/d;

    .line 14
    .line 15
    iput-object p1, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p2, Lcom/android/launcher3/model/data/y;->appTitle:Ljava/lang/CharSequence;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    const-string p1, "Launcher.IconCache"

    .line 23
    .line 24
    const-string v0, "Cannot find bitmap from the cache, default icon was loaded."

    .line 25
    .line 26
    invoke-static {p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    iget-object p1, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 36
    .line 37
    :cond_0
    invoke-direct {p0, p2}, Ls1/P;->U0(Lcom/android/launcher3/model/data/y;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 61
    .line 62
    invoke-virtual {p0, p1, v0}, Lt1/f;->z(Ljava/lang/String;Landroid/os/UserHandle;)Lt1/f$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    if-eqz p0, :cond_4

    .line 67
    .line 68
    iget-object p1, p0, Lt1/f$a;->a:Ls1/d;

    .line 69
    .line 70
    invoke-virtual {p1}, Ls1/d;->k()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    iget-object p1, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p2, Lcom/android/launcher3/model/data/y;->appTitle:Ljava/lang/CharSequence;

    .line 84
    .line 85
    iget-object p1, p0, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-static {p1}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 92
    .line 93
    iget-object p1, p0, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 94
    .line 95
    iput-object p1, p2, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 96
    .line 97
    iget-object p0, p0, Lt1/f$a;->a:Ls1/d;

    .line 98
    .line 99
    iput-object p0, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 100
    .line 101
    :cond_4
    :goto_0
    return-void
.end method

.method public declared-synchronized s0()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "Launcher.IconCache"

    .line 3
    .line 4
    const-string v1, "clearCache"

    .line 5
    .line 6
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lt1/f;->o()Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lt1/f;->j:Lt1/f$c;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1, v1}, Lcom/android/launcher3/util/Z1;->e(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v0
.end method

.method public t0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/P;->R:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lt1/f;->C()Lt1/n;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lt1/f;->j:Lt1/f$c;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z1;->d()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v()Ls1/b;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/P;->O:Ls1/X$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls1/X$b;->b()Ls1/X;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public x0(Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Landroid/os/UserHandle;",
            ")",
            "LI/d<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_8

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_4

    .line 11
    .line 12
    :cond_0
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-direct {v1, p1, p2}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, v1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v2, v1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, "."

    .line 42
    .line 43
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 p2, 0x1

    .line 55
    if-eqz p1, :cond_7

    .line 56
    .line 57
    new-instance p1, Ljava/util/HashSet;

    .line 58
    .line 59
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 60
    .line 61
    .line 62
    :try_start_0
    invoke-virtual {p0}, Lt1/f;->o()Ljava/util/Map;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-interface {p1, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception v3

    .line 75
    new-instance v4, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v5, "set.addAll() exception: "

    .line 81
    .line 82
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    const-string v4, "Launcher.IconCache"

    .line 93
    .line 94
    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    :goto_0
    new-instance v3, Ljava/util/HashMap;

    .line 98
    .line 99
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_2

    .line 111
    .line 112
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    check-cast v4, Lcom/android/launcher3/util/E;

    .line 117
    .line 118
    iget-object v5, v4, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 119
    .line 120
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    iget-object v6, v1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 125
    .line 126
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v5

    .line 134
    if-eqz v5, :cond_1

    .line 135
    .line 136
    iget-object v5, v4, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 137
    .line 138
    iget-object v6, v1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 139
    .line 140
    invoke-virtual {v5, v6}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    if-eqz v5, :cond_1

    .line 145
    .line 146
    invoke-virtual {p0}, Lt1/f;->o()Ljava/util/Map;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    check-cast v5, Lt1/f$a;

    .line 155
    .line 156
    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_2
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-nez p1, :cond_7

    .line 165
    .line 166
    invoke-interface {v3}, Ljava/util/Map;->size()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    const/4 v4, 0x0

    .line 171
    if-ne p1, p2, :cond_3

    .line 172
    .line 173
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-interface {p1}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    aget-object p1, p1, v4

    .line 182
    .line 183
    check-cast p1, Lt1/f$a;

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_3
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 195
    .line 196
    .line 197
    move-result v5

    .line 198
    if-eqz v5, :cond_5

    .line 199
    .line 200
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    check-cast v5, Lcom/android/launcher3/util/E;

    .line 205
    .line 206
    iget-object v6, v5, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 207
    .line 208
    invoke-virtual {v6}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    new-instance v7, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .line 216
    .line 217
    iget-object v8, v5, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 218
    .line 219
    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v8

    .line 223
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v7

    .line 233
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v6

    .line 237
    if-eqz v6, :cond_4

    .line 238
    .line 239
    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    check-cast p1, Lt1/f$a;

    .line 244
    .line 245
    goto :goto_2

    .line 246
    :cond_5
    move-object p1, v0

    .line 247
    :goto_2
    if-nez p1, :cond_6

    .line 248
    .line 249
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    invoke-interface {p1}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    aget-object p1, p1, v4

    .line 258
    .line 259
    check-cast p1, Lt1/f$a;

    .line 260
    .line 261
    :cond_6
    :goto_3
    if-eqz p1, :cond_7

    .line 262
    .line 263
    iget-object v2, p1, Lt1/f$a;->a:Ls1/d;

    .line 264
    .line 265
    if-eqz v2, :cond_7

    .line 266
    .line 267
    iget-object v2, v2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 268
    .line 269
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    if-nez v2, :cond_7

    .line 274
    .line 275
    iget-object v2, p1, Lt1/f$a;->a:Ls1/d;

    .line 276
    .line 277
    invoke-virtual {v2}, Ls1/d;->k()Z

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    if-nez v2, :cond_7

    .line 282
    .line 283
    new-instance p0, LI/d;

    .line 284
    .line 285
    iget-object v0, p1, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 286
    .line 287
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    iget-object p1, p1, Lt1/f$a;->a:Ls1/d;

    .line 292
    .line 293
    iget-object p1, p1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 294
    .line 295
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    invoke-virtual {p1, v1, p2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    invoke-direct {p0, v0, p1}, LI/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 304
    .line 305
    .line 306
    return-object p0

    .line 307
    :cond_7
    invoke-virtual {p0}, Lt1/f;->o()Ljava/util/Map;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    check-cast p0, Lt1/f$a;

    .line 316
    .line 317
    if-eqz p0, :cond_8

    .line 318
    .line 319
    iget-object p1, p0, Lt1/f$a;->a:Ls1/d;

    .line 320
    .line 321
    if-eqz p1, :cond_8

    .line 322
    .line 323
    iget-object p1, p1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 324
    .line 325
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 326
    .line 327
    .line 328
    move-result p1

    .line 329
    if-nez p1, :cond_8

    .line 330
    .line 331
    iget-object p1, p0, Lt1/f$a;->a:Ls1/d;

    .line 332
    .line 333
    invoke-virtual {p1}, Ls1/d;->k()Z

    .line 334
    .line 335
    .line 336
    move-result p1

    .line 337
    if-nez p1, :cond_8

    .line 338
    .line 339
    new-instance p1, LI/d;

    .line 340
    .line 341
    iget-object v0, p0, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 342
    .line 343
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    iget-object p0, p0, Lt1/f$a;->a:Ls1/d;

    .line 348
    .line 349
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 350
    .line 351
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    invoke-virtual {p0, v1, p2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    invoke-direct {p1, v0, p0}, LI/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 360
    .line 361
    .line 362
    return-object p1

    .line 363
    :cond_8
    :goto_4
    return-object v0
.end method

.method public y0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lt1/f;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public z0(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/content/pm/PackageManager;Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;
    .locals 9

    .line 1
    const-string v0, "Launcher.IconCache"

    .line 2
    .line 3
    if-eqz p1, :cond_9

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto/16 :goto_3

    .line 8
    .line 9
    :cond_0
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 10
    .line 11
    invoke-direct {v1, p1, p2}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, v1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v3, v1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v3, "."

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_7

    .line 48
    .line 49
    new-instance p1, Ljava/util/HashSet;

    .line 50
    .line 51
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lt1/f;->o()Ljava/util/Map;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-interface {p1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    new-instance v2, Ljava/util/HashMap;

    .line 66
    .line 67
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_2

    .line 79
    .line 80
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    check-cast v4, Lcom/android/launcher3/util/E;

    .line 85
    .line 86
    iget-object v5, v4, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 87
    .line 88
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    iget-object v6, v1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 93
    .line 94
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-eqz v5, :cond_1

    .line 103
    .line 104
    iget-object v5, v4, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 105
    .line 106
    iget-object v6, v1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 107
    .line 108
    invoke-virtual {v5, v6}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-eqz v5, :cond_1

    .line 113
    .line 114
    invoke-virtual {p0}, Lt1/f;->o()Ljava/util/Map;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    check-cast v5, Lt1/f$a;

    .line 123
    .line 124
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_2
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_7

    .line 133
    .line 134
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    const/4 v4, 0x1

    .line 139
    const/4 v5, 0x0

    .line 140
    if-ne p1, v4, :cond_3

    .line 141
    .line 142
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-interface {p1}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    aget-object p1, p1, v5

    .line 151
    .line 152
    check-cast p1, Lt1/f$a;

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_3
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    const/4 v4, 0x0

    .line 164
    :cond_4
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 165
    .line 166
    .line 167
    move-result v6

    .line 168
    if-eqz v6, :cond_5

    .line 169
    .line 170
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    check-cast v6, Lcom/android/launcher3/util/E;

    .line 175
    .line 176
    new-instance v7, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .line 180
    .line 181
    iget-object v8, v6, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 182
    .line 183
    invoke-virtual {v8}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v8

    .line 187
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    iget-object v8, v6, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 198
    .line 199
    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v8

    .line 203
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v7

    .line 207
    if-nez v7, :cond_4

    .line 208
    .line 209
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    check-cast v4, Lt1/f$a;

    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_5
    if-nez v4, :cond_6

    .line 217
    .line 218
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-interface {p1}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    aget-object p1, p1, v5

    .line 227
    .line 228
    check-cast p1, Lt1/f$a;

    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_6
    move-object p1, v4

    .line 232
    :goto_2
    if-eqz p1, :cond_7

    .line 233
    .line 234
    iget-object p0, p1, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 235
    .line 236
    return-object p0

    .line 237
    :cond_7
    iget-object p1, p0, Ls1/P;->R:Ljava/util/Map;

    .line 238
    .line 239
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    check-cast p1, Lt1/f$a;

    .line 244
    .line 245
    if-eqz p1, :cond_8

    .line 246
    .line 247
    iget-object p0, p1, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 248
    .line 249
    return-object p0

    .line 250
    :cond_8
    new-instance p1, Lt1/f$a;

    .line 251
    .line 252
    invoke-direct {p1}, Lt1/f$a;-><init>()V

    .line 253
    .line 254
    .line 255
    invoke-virtual {p4, p3}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 256
    .line 257
    .line 258
    move-result-object p4

    .line 259
    invoke-virtual {p3, p4, p2}, Landroid/content/pm/PackageManager;->getUserBadgedLabel(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    iput-object p2, p1, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 264
    .line 265
    iget-object p0, p0, Ls1/P;->R:Ljava/util/Map;

    .line 266
    .line 267
    invoke-interface {p0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    new-instance p0, Ljava/lang/StringBuilder;

    .line 271
    .line 272
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 273
    .line 274
    .line 275
    const-string p2, "getLabelFromCache--entry == null--contentDescription:"

    .line 276
    .line 277
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    iget-object p2, p1, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 281
    .line 282
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    .line 291
    .line 292
    iget-object p0, p1, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 293
    .line 294
    return-object p0

    .line 295
    :cond_9
    :goto_3
    const-string p0, "getLabelFromCache--componentName == null || user == null"

    .line 296
    .line 297
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    .line 299
    .line 300
    const-string p0, ""

    .line 301
    .line 302
    return-object p0
.end method
