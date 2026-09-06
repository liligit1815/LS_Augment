.class public LD1/b;
.super Ljava/lang/Object;
.source "InstallSessionHelper.java"


# static fields
.field public static final f:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "LD1/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Landroid/content/pm/LauncherApps;

.field private final b:Landroid/content/Context;

.field private final c:Landroid/content/pm/PackageInstaller;

.field private final d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private e:Lcom/android/launcher3/util/z0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, LD1/a;

    .line 4
    .line 5
    invoke-direct {v1}, LD1/a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, LD1/b;->f:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

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
    iput-object v0, p0, LD1/b;->d:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->getPackageInstaller()Landroid/content/pm/PackageInstaller;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, LD1/b;->c:Landroid/content/pm/PackageInstaller;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, LD1/b;->b:Landroid/content/Context;

    .line 26
    .line 27
    const-class v0, Landroid/content/pm/LauncherApps;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroid/content/pm/LauncherApps;

    .line 34
    .line 35
    iput-object p1, p0, LD1/b;->a:Landroid/content/pm/LauncherApps;

    .line 36
    .line 37
    return-void
.end method

.method private d()Lcom/android/launcher3/util/z0;
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LD1/b;->e:Lcom/android/launcher3/util/z0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-object v0, p0, LD1/b;->b:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/android/launcher3/J3;->f:Lcom/android/launcher3/X;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/util/x0;->u(Ljava/lang/String;)Lcom/android/launcher3/util/x0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, LD1/b;->e:Lcom/android/launcher3/util/z0;

    .line 32
    .line 33
    new-instance v0, Lcom/android/launcher3/util/x0;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, LD1/b;->b()Ljava/util/HashMap;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_1

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/content/pm/PackageInstaller$SessionInfo;->getSessionId()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    new-instance v1, Lcom/android/launcher3/util/x0;

    .line 71
    .line 72
    invoke-direct {v1}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, LD1/b;->e:Lcom/android/launcher3/util/z0;

    .line 76
    .line 77
    invoke-virtual {v2}, Lcom/android/launcher3/util/z0;->size()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    add-int/lit8 v2, v2, -0x1

    .line 82
    .line 83
    :goto_1
    if-ltz v2, :cond_3

    .line 84
    .line 85
    iget-object v3, p0, LD1/b;->e:Lcom/android/launcher3/util/z0;

    .line 86
    .line 87
    invoke-virtual {v3}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-nez v3, :cond_2

    .line 100
    .line 101
    iget-object v3, p0, LD1/b;->e:Lcom/android/launcher3/util/z0;

    .line 102
    .line 103
    invoke-virtual {v3}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 112
    .line 113
    .line 114
    :cond_2
    add-int/lit8 v2, v2, -0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    invoke-virtual {v1}, Lcom/android/launcher3/util/x0;->size()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/lit8 v0, v0, -0x1

    .line 122
    .line 123
    :goto_2
    if-ltz v0, :cond_4

    .line 124
    .line 125
    iget-object v2, p0, LD1/b;->e:Lcom/android/launcher3/util/z0;

    .line 126
    .line 127
    invoke-virtual {v2}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 136
    .line 137
    .line 138
    add-int/lit8 v0, v0, -0x1

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_4
    iget-object p0, p0, LD1/b;->e:Lcom/android/launcher3/util/z0;

    .line 142
    .line 143
    return-object p0
.end method

.method public static e(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/pm/PackageInstaller$SessionInfo;->getUser()Landroid/os/UserHandle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private l()V
    .locals 2

    .line 1
    iget-object v0, p0, LD1/b;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/J3;->f:Lcom/android/launcher3/X;

    .line 8
    .line 9
    invoke-direct {p0}, LD1/b;->d()Lcom/android/launcher3/util/z0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private m(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/content/pm/PackageInstaller$SessionInfo;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getInstallerPackageName()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getInstallerPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {p1}, LD1/b;->e(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/os/UserHandle;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0, v1, v2}, LD1/b;->g(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    return-object p1

    .line 36
    :cond_1
    :goto_0
    return-object v0
.end method


# virtual methods
.method public a(Landroid/os/UserHandle;Ljava/lang/String;)Landroid/content/pm/PackageInstaller$SessionInfo;
    .locals 3

    .line 1
    invoke-virtual {p0}, LD1/b;->c()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {v0}, LD1/b;->e(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/os/UserHandle;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p1, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    :cond_1
    if-eqz v1, :cond_0

    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public b()Ljava/util/HashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/L1;",
            "Landroid/content/pm/PackageInstaller$SessionInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LD1/b;->c()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 25
    .line 26
    new-instance v2, Lcom/android/launcher3/util/L1;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v1}, LD1/b;->e(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/os/UserHandle;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-object v0
.end method

.method public c()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/pm/PackageInstaller$SessionInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, LD1/b;->a:Landroid/content/pm/LauncherApps;

    .line 4
    .line 5
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/pm/LauncherApps;->getAllPackageInstallerSessions()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 30
    .line 31
    invoke-direct {p0, v2}, LD1/b;->m(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-object v0
.end method

.method f(I)Landroid/content/pm/PackageInstaller$SessionInfo;
    .locals 1

    .line 1
    iget-object v0, p0, LD1/b;->c:Landroid/content/pm/PackageInstaller;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/pm/PackageInstaller;->getSessionInfo(I)Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, LD1/b;->m(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public g(Ljava/lang/String;Landroid/os/UserHandle;)Z
    .locals 3

    .line 1
    iget-object v0, p0, LD1/b;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, LD1/b;->d:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_2

    .line 11
    .line 12
    iget-object v1, p0, LD1/b;->b:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    new-instance v1, Lcom/android/launcher3/util/k;

    .line 25
    .line 26
    iget-object v2, p0, LD1/b;->b:Landroid/content/Context;

    .line 27
    .line 28
    invoke-direct {v1, v2, p1, p2}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/util/k;->n()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p2, 0x0

    .line 39
    goto :goto_1

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    :goto_0
    const/4 p2, 0x1

    .line 43
    :goto_1
    iget-object v1, p0, LD1/b;->d:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object p0, p0, LD1/b;->d:Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    monitor-exit v0

    .line 65
    return p0

    .line 66
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    throw p0
.end method

.method public h(I)Z
    .locals 0

    .line 1
    invoke-direct {p0}, LD1/b;->d()Lcom/android/launcher3/util/z0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i(LD1/e$a;)LD1/e;
    .locals 3

    .line 1
    new-instance v0, LD1/e;

    .line 2
    .line 3
    iget-object v1, p0, LD1/b;->c:Landroid/content/pm/PackageInstaller;

    .line 4
    .line 5
    iget-object v2, p0, LD1/b;->a:Landroid/content/pm/LauncherApps;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1, v1, v2}, LD1/e;-><init>(LD1/b;LD1/e$a;Landroid/content/pm/PackageInstaller;Landroid/content/pm/LauncherApps;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, LD1/e;->g()V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public j(I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, LD1/b;->h(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, LD1/b;->d()Lcom/android/launcher3/util/z0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, LD1/b;->l()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method k(Landroid/content/pm/PackageInstaller$SessionInfo;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, LD1/b;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p1}, LD1/b;->e(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/os/UserHandle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lcom/android/launcher3/SessionCommitReceiver;->b(Landroid/content/Context;Landroid/os/UserHandle;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0, p1}, LD1/b;->n(Landroid/content/pm/PackageInstaller$SessionInfo;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getSessionId()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, v0}, LD1/b;->h(I)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->isUnarchival()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v1, "Adding package name to install queue: "

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "InstallSessionHelper"

    .line 65
    .line 66
    invoke-static {v1, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object v0, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 70
    .line 71
    iget-object v1, p0, LD1/b;->b:Landroid/content/Context;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lz1/t1;

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {p1}, LD1/b;->e(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/os/UserHandle;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v0, v1, v2}, Lz1/t1;->z(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    invoke-direct {p0}, LD1/b;->d()Lcom/android/launcher3/util/z0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getSessionId()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 99
    .line 100
    .line 101
    invoke-direct {p0}, LD1/b;->l()V

    .line 102
    .line 103
    .line 104
    :cond_2
    return-void
.end method

.method public n(Landroid/content/pm/PackageInstaller$SessionInfo;)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->isUnarchival()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-direct {p0, p1}, LD1/b;->m(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getInstallReason()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v2, 0x4

    .line 28
    if-ne v0, v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppIcon()Landroid/graphics/Bitmap;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppLabel()Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    new-instance v0, Lcom/android/launcher3/util/k;

    .line 47
    .line 48
    iget-object p0, p0, LD1/b;->b:Landroid/content/Context;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {p1}, LD1/b;->e(Landroid/content/pm/PackageInstaller$SessionInfo;)Landroid/os/UserHandle;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-direct {v0, p0, v2, p1}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/util/k;->k()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_1

    .line 66
    .line 67
    return v1

    .line 68
    :cond_1
    const/4 p0, 0x0

    .line 69
    return p0
.end method
