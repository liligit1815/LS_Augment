.class public Lz1/V3;
.super Ljava/lang/Object;
.source "PackageInstallStateChangedTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:LD1/f;


# direct methods
.method public constructor <init>(LD1/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/V3;->a:LD1/f;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/d;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->r(Lcom/android/launcher3/model/data/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/A;
    .locals 0

    .line 1
    check-cast p0, Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lz1/V3;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/V3;->i(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic e(Lz1/V3;Ljava/util/HashSet;Lcom/android/launcher3/model/data/A;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/V3;->k(Ljava/util/HashSet;Lcom/android/launcher3/model/data/A;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lz1/V3;Lcom/android/launcher3/model/data/A;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/V3;->j(Lcom/android/launcher3/model/data/A;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g(Lz1/V3;Ljava/util/HashSet;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/V3;->h(Ljava/util/HashSet;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h(Ljava/util/HashSet;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lz1/V3;->a:LD1/f;

    .line 8
    .line 9
    iget-object v0, v0, LD1/f;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lz1/V3;->a:LD1/f;

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Lcom/android/launcher3/model/data/z;->K(LD1/f;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private synthetic i(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/V3;->a:LD1/f;

    .line 2
    .line 3
    iget-object p0, p0, LD1/f;->e:Landroid/os/UserHandle;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private synthetic j(Lcom/android/launcher3/model/data/A;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lz1/V3;->a:LD1/f;

    .line 8
    .line 9
    iget-object p0, p0, LD1/f;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private synthetic k(Ljava/util/HashSet;Lcom/android/launcher3/model/data/A;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/V3;->a:LD1/f;

    .line 2
    .line 3
    iget p0, p0, LD1/f;->d:I

    .line 4
    .line 5
    iput p0, p2, Lcom/android/launcher3/model/data/A;->j:I

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/V3;->a:LD1/f;

    .line 2
    .line 3
    iget v0, v0, LD1/f;->c:I

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iget-object v0, p0, Lz1/V3;->a:LD1/f;

    .line 16
    .line 17
    iget-object v0, v0, LD1/f;->b:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p3, v0, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-static {p2}, Lcom/android/launcher3/util/InstantAppResolver;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/util/InstantAppResolver;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/InstantAppResolver;->isInstantApp(Landroid/content/pm/ApplicationInfo;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Lz1/o3;->X()Lcom/android/launcher3/D3;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p2, p3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p0, p0, Lz1/V3;->a:LD1/f;

    .line 45
    .line 46
    iget-object p0, p0, LD1/f;->e:Landroid/os/UserHandle;

    .line 47
    .line 48
    invoke-virtual {p1, p2, p0}, Lz1/Q2;->onPackageAdded(Ljava/lang/String;Landroid/os/UserHandle;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    :catch_0
    :cond_0
    return-void

    .line 52
    :cond_1
    monitor-enter p3

    .line 53
    :try_start_1
    iget-object v0, p0, Lz1/V3;->a:LD1/f;

    .line 54
    .line 55
    invoke-virtual {p3, v0}, Lz1/m;->A(LD1/f;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Lcom/android/launcher3/model/data/d;

    .line 80
    .line 81
    new-instance v2, Lz1/P3;

    .line 82
    .line 83
    invoke-direct {v2, v1}, Lz1/P3;-><init>(Lcom/android/launcher3/model/data/d;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, v2}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :catchall_0
    move-exception p0

    .line 91
    goto :goto_3

    .line 92
    :cond_2
    invoke-virtual {p1}, Lz1/o3;->y()V

    .line 93
    .line 94
    .line 95
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    monitor-enter p2

    .line 97
    :try_start_2
    new-instance p3, Ljava/util/HashSet;

    .line 98
    .line 99
    invoke-direct {p3}, Ljava/util/HashSet;-><init>()V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lz1/V3;->a:LD1/f;

    .line 103
    .line 104
    iget-object v0, v0, LD1/f;->e:Landroid/os/UserHandle;

    .line 105
    .line 106
    new-instance v1, Lz1/Q3;

    .line 107
    .line 108
    invoke-direct {v1, p0, p3}, Lz1/Q3;-><init>(Lz1/V3;Ljava/util/HashSet;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2, v0, v1}, Lz1/y0;->p(Landroid/os/UserHandle;Ljava/util/function/Consumer;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    sget-object v1, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 121
    .line 122
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v1, Lz1/R3;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Lz1/R3;-><init>(Lz1/V3;)V

    .line 129
    .line 130
    .line 131
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Lz1/S3;

    .line 136
    .line 137
    invoke-direct {v1}, Lz1/S3;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v1, Lz1/T3;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Lz1/T3;-><init>(Lz1/V3;)V

    .line 147
    .line 148
    .line 149
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    new-instance v1, Lz1/U3;

    .line 154
    .line 155
    invoke-direct {v1, p0, p3}, Lz1/U3;-><init>(Lz1/V3;Ljava/util/HashSet;)V

    .line 156
    .line 157
    .line 158
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p3}, Ljava/util/HashSet;->isEmpty()Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-nez p0, :cond_3

    .line 166
    .line 167
    invoke-virtual {p1, p3}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 168
    .line 169
    .line 170
    goto :goto_1

    .line 171
    :catchall_1
    move-exception p0

    .line 172
    goto :goto_2

    .line 173
    :cond_3
    :goto_1
    monitor-exit p2

    .line 174
    return-void

    .line 175
    :goto_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 176
    throw p0

    .line 177
    :goto_3
    :try_start_3
    monitor-exit p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 178
    throw p0
.end method
