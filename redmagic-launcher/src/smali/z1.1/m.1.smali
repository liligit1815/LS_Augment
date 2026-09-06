.class public Lz1/m;
.super Ljava/lang/Object;
.source "AllAppsList.java"


# static fields
.field private static final h:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Ls1/P;

.field private final c:Lcom/android/launcher3/f;

.field private d:Z

.field private e:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field

.field private f:Lcom/android/launcher3/compat/AlphabeticIndexCompat;

.field private g:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lz1/k;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/k;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lz1/m;->h:Ljava/util/function/Consumer;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ls1/P;Lcom/android/launcher3/f;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/16 v1, 0x2a

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lz1/m;->d:Z

    .line 15
    .line 16
    sget-object v0, Lz1/m;->h:Ljava/util/function/Consumer;

    .line 17
    .line 18
    iput-object v0, p0, Lz1/m;->e:Ljava/util/function/Consumer;

    .line 19
    .line 20
    iput-object p1, p0, Lz1/m;->b:Ls1/P;

    .line 21
    .line 22
    iput-object p2, p0, Lz1/m;->c:Lcom/android/launcher3/f;

    .line 23
    .line 24
    new-instance p2, Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 25
    .line 26
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-direct {p2, v0}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;-><init>(Landroid/os/LocaleList;)V

    .line 31
    .line 32
    .line 33
    iput-object p2, p0, Lz1/m;->f:Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 34
    .line 35
    invoke-virtual {p1}, Ls1/P;->y0()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p2, p0}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;->setContext(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lz1/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/m;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static j(Ljava/util/List;Landroid/content/ComponentName;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;",
            "Landroid/content/ComponentName;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/content/pm/LauncherActivityInfo;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method private synthetic r()V
    .locals 1

    .line 1
    sget-object v0, Lz1/m;->h:Ljava/util/function/Consumer;

    .line 2
    .line 3
    iput-object v0, p0, Lz1/m;->e:Ljava/util/function/Consumer;

    .line 4
    .line 5
    return-void
.end method

.method private s(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/launcher3/model/data/d;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lz1/m;->d:Z

    .line 13
    .line 14
    iget-object p0, p0, Lz1/m;->e:Ljava/util/function/Consumer;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public A(LD1/f;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LD1/f;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, LD1/f;->e:Landroid/os/UserHandle;

    .line 7
    .line 8
    iget-object v2, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x1

    .line 15
    sub-int/2addr v2, v3

    .line 16
    :goto_0
    if-ltz v2, :cond_4

    .line 17
    .line 18
    iget-object v4, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    check-cast v4, Lcom/android/launcher3/model/data/d;

    .line 25
    .line 26
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    if-eqz v5, :cond_3

    .line 31
    .line 32
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget-object v6, p1, LD1/f;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-eqz v5, :cond_3

    .line 43
    .line 44
    iget-object v5, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 45
    .line 46
    invoke-virtual {v5, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-eqz v5, :cond_3

    .line 51
    .line 52
    iget v5, p1, LD1/f;->c:I

    .line 53
    .line 54
    const/4 v6, 0x2

    .line 55
    if-eq v5, v6, :cond_1

    .line 56
    .line 57
    if-eq v5, v3, :cond_1

    .line 58
    .line 59
    const/4 v6, 0x3

    .line 60
    if-ne v5, v6, :cond_0

    .line 61
    .line 62
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_0

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_0
    iget v5, p1, LD1/f;->c:I

    .line 70
    .line 71
    if-ne v5, v6, :cond_3

    .line 72
    .line 73
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->z()Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    if-nez v5, :cond_3

    .line 78
    .line 79
    new-instance v5, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v6, "updatePromiseInstallInfo: removing app due to install failure and appInfo not startable. package="

    .line 85
    .line 86
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v4, ", user="

    .line 97
    .line 98
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    const-string v5, "AllAppsList"

    .line 109
    .line 110
    invoke-static {v5, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    invoke-direct {p0, v2}, Lz1/m;->s(I)V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_1
    :goto_1
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->z()Z

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    if-eqz v5, :cond_2

    .line 122
    .line 123
    iget v5, p1, LD1/f;->c:I

    .line 124
    .line 125
    if-ne v5, v3, :cond_2

    .line 126
    .line 127
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    if-nez v5, :cond_2

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_2
    invoke-virtual {v4, p1}, Lcom/android/launcher3/model/data/z;->K(LD1/f;)V

    .line 135
    .line 136
    .line 137
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, -0x1

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_4
    return-object v0
.end method

.method public B(Lcom/android/launcher3/model/data/d;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/m;->f:Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;->computeSectionNameMfv(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, p1, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public c(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lz1/m;->d(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public d(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/m;->c:Lcom/android/launcher3/f;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/m;->b:Ls1/P;

    .line 4
    .line 5
    invoke-virtual {v1}, Ls1/P;->y0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher3/f;->c(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lz1/m;->k(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    :goto_0
    return-void

    .line 35
    :cond_1
    if-eqz p3, :cond_2

    .line 36
    .line 37
    iget-object p3, p0, Lz1/m;->b:Ls1/P;

    .line 38
    .line 39
    sget-object v0, Lt1/g;->d:Lt1/g;

    .line 40
    .line 41
    invoke-virtual {p3, p1, p2, v0}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Lz1/m;->f:Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 45
    .line 46
    iget-object p3, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 47
    .line 48
    invoke-virtual {p2, p3}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;->computeSectionNameMfv(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    iput-object p2, p1, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const-string p2, ""

    .line 56
    .line 57
    iput-object p2, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 58
    .line 59
    :goto_1
    iget-object p2, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    const/4 p1, 0x1

    .line 65
    iput-boolean p1, p0, Lz1/m;->d:Z

    .line 66
    .line 67
    return-void
.end method

.method public e(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/List<",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 8
    .line 9
    invoke-virtual {v0, p2, p3}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Landroid/content/pm/LauncherActivityInfo;

    .line 28
    .line 29
    new-instance v2, Lcom/android/launcher3/model/data/d;

    .line 30
    .line 31
    invoke-direct {v2, p1, v1, p3}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v2, v1}, Lz1/m;->c(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object p2
.end method

.method public f(Landroid/content/Context;LD1/f;)Lcom/android/launcher3/model/data/d;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lz1/m;->g(Landroid/content/Context;LD1/f;Z)Lcom/android/launcher3/model/data/d;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public g(Landroid/content/Context;LD1/f;Z)Lcom/android/launcher3/model/data/d;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/k;

    .line 2
    .line 3
    iget-object v1, p2, LD1/f;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p2, LD1/f;->e:Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, v2}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/util/k;->k()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p1, Lcom/android/launcher3/model/data/d;

    .line 19
    .line 20
    invoke-direct {p1, p2}, Lcom/android/launcher3/model/data/d;-><init>(LD1/f;)V

    .line 21
    .line 22
    .line 23
    if-eqz p3, :cond_1

    .line 24
    .line 25
    iget-object p2, p0, Lz1/m;->b:Ls1/P;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p2, p1, p3}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lz1/m;->f:Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 35
    .line 36
    iget-object p3, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-virtual {p2, p3}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;->computeSectionNameMfv(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iput-object p2, p1, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string p2, ""

    .line 46
    .line 47
    iput-object p2, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 48
    .line 49
    :goto_0
    iget-object p2, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    const/4 p2, 0x1

    .line 55
    iput-boolean p2, p0, Lz1/m;->d:Z

    .line 56
    .line 57
    return-object p1
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lz1/m;->d:Z

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 10
    .line 11
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;-><init>(Landroid/os/LocaleList;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lz1/m;->f:Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 19
    .line 20
    iget-object p0, p0, Lz1/m;->b:Ls1/P;

    .line 21
    .line 22
    invoke-virtual {p0}, Ls1/P;->y0()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;->setContext(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public i()[Lcom/android/launcher3/model/data/d;
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/model/data/d;->o:[Lcom/android/launcher3/model/data/d;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, [Lcom/android/launcher3/model/data/d;

    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/model/data/d;->p:Ljava/util/Comparator;

    .line 12
    .line 13
    invoke-static {p0, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public k(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;
    .locals 2

    .line 1
    iget-object p0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public l(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge p0, v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/launcher3/model/data/d;

    .line 20
    .line 21
    iget-object v2, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 34
    .line 35
    invoke-virtual {p2, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    return-object p0
.end method

.method public m(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;
    .locals 3

    .line 1
    iget-object p0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v2, v0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    iget-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 53
    .line 54
    invoke-virtual {p2, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    :goto_0
    return-object v0

    .line 61
    :cond_2
    const/4 p0, 0x0

    .line 62
    return-object p0
.end method

.method public n(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/model/data/d;

    .line 23
    .line 24
    iget-object v2, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 37
    .line 38
    invoke-virtual {p2, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-object v0
.end method

.method public o()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lz1/m;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Lz1/m;->d:Z

    .line 5
    .line 6
    return v0
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Lz1/m;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 1

    .line 1
    iget p0, p0, Lz1/m;->g:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public t(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v1, :cond_1

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lcom/android/launcher3/model/data/d;

    .line 16
    .line 17
    iget-object v3, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 18
    .line 19
    invoke-virtual {v3, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    iget-object v2, v2, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-direct {p0, v1}, Lz1/m;->s(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method

.method public u(IZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget p2, p0, Lz1/m;->g:I

    .line 4
    .line 5
    or-int/2addr p1, p2

    .line 6
    iput p1, p0, Lz1/m;->g:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget p2, p0, Lz1/m;->g:I

    .line 10
    .line 11
    not-int p1, p1

    .line 12
    and-int/2addr p1, p2

    .line 13
    iput p1, p0, Lz1/m;->g:I

    .line 14
    .line 15
    :goto_0
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lz1/m;->d:Z

    .line 17
    .line 18
    return-void
.end method

.method public v(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/m;->c:Lcom/android/launcher3/f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/f;->c(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public w(Ljava/util/function/Consumer;)Lcom/android/launcher3/util/a2;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/model/data/d;",
            ">;)",
            "Lcom/android/launcher3/util/a2;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lz1/m;->e:Ljava/util/function/Consumer;

    .line 2
    .line 3
    new-instance p1, Lz1/l;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lz1/l;-><init>(Lz1/m;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public x(Ljava/util/function/Predicate;Lcom/android/launcher3/util/p0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Lcom/android/launcher3/util/p0;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    sub-int/2addr v1, v2

    .line 9
    :goto_0
    if-ltz v1, :cond_1

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Lcom/android/launcher3/model/data/d;

    .line 16
    .line 17
    invoke-interface {p1, v3}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_0

    .line 22
    .line 23
    iget v4, v3, Lcom/android/launcher3/model/data/z;->h:I

    .line 24
    .line 25
    invoke-interface {p2, v4}, Lcom/android/launcher3/util/p0;->apply(I)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    iput v4, v3, Lcom/android/launcher3/model/data/z;->h:I

    .line 30
    .line 31
    iput-boolean v2, p0, Lz1/m;->d:Z

    .line 32
    .line 33
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method

.method public y(Ljava/util/HashSet;Landroid/os/UserHandle;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/launcher3/model/data/d;

    .line 18
    .line 19
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 20
    .line 21
    invoke-virtual {v2, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v2, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 28
    .line 29
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    iget-object v2, p0, Lz1/m;->b:Ls1/P;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ls1/P;->a1(Lcom/android/launcher3/model/data/d;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lz1/m;->f:Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 45
    .line 46
    iget-object v3, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;->computeSectionNameMfv(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iput-object v2, v1, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    new-instance v2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v3, "add: section name is empty. info: "

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v2, "AllAppsList"

    .line 78
    .line 79
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    :cond_1
    const/4 v1, 0x1

    .line 83
    iput-boolean v1, p0, Lz1/m;->d:Z

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    return-void
.end method

.method public z(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/List<",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/util/f;

    .line 8
    .line 9
    invoke-static {p1}, LD1/t;->k(Landroid/content/Context;)LD1/t;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/android/launcher3/util/J1;->d:Lcom/android/launcher3/util/I;

    .line 14
    .line 15
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/android/launcher3/util/J1;

    .line 20
    .line 21
    const-class v3, Landroid/content/pm/LauncherApps;

    .line 22
    .line 23
    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Landroid/content/pm/LauncherApps;

    .line 28
    .line 29
    invoke-virtual {v3, p2, p3}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const-string v5, ", user="

    .line 38
    .line 39
    const-string v6, "AllAppsList"

    .line 40
    .line 41
    const/4 v7, 0x1

    .line 42
    if-lez v4, :cond_4

    .line 43
    .line 44
    iget-object v4, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    sub-int/2addr v4, v7

    .line 51
    :goto_0
    if-ltz v4, :cond_2

    .line 52
    .line 53
    iget-object v8, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    check-cast v8, Lcom/android/launcher3/model/data/d;

    .line 60
    .line 61
    iget-object v9, v8, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 62
    .line 63
    invoke-virtual {p3, v9}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    if-eqz v9, :cond_1

    .line 68
    .line 69
    iget-object v9, v8, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 70
    .line 71
    invoke-virtual {v9}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    invoke-virtual {p2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    if-eqz v9, :cond_1

    .line 80
    .line 81
    iget-object v9, v8, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 82
    .line 83
    invoke-static {p1, v9}, Lx1/O;->s1(Landroid/content/Context;Landroid/content/ComponentName;)Z

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    if-eqz v9, :cond_0

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_0
    iget-object v9, v8, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 91
    .line 92
    invoke-static {v3, v9}, Lz1/m;->j(Ljava/util/List;Landroid/content/ComponentName;)Z

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    if-nez v9, :cond_1

    .line 97
    .line 98
    new-instance v9, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v10, "Changing shortcut target due to app component name change. component="

    .line 104
    .line 105
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v8, v8, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 109
    .line 110
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v9, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    invoke-direct {p0, v4}, Lz1/m;->s(I)V

    .line 127
    .line 128
    .line 129
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, -0x1

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    if-eqz v4, :cond_b

    .line 141
    .line 142
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    check-cast v4, Landroid/content/pm/LauncherActivityInfo;

    .line 147
    .line 148
    invoke-virtual {v4}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-virtual {p0, v5, p3}, Lz1/m;->k(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    if-nez v5, :cond_3

    .line 157
    .line 158
    new-instance v5, Lcom/android/launcher3/model/data/d;

    .line 159
    .line 160
    invoke-direct {v5, p1, v4, p3}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, v5, v4}, Lz1/m;->c(Lcom/android/launcher3/model/data/d;Landroid/content/pm/LauncherActivityInfo;)V

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_3
    invoke-static {v4}, Lcom/android/launcher3/model/data/d;->R(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/Intent;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    iget-object v8, p0, Lz1/m;->b:Ls1/P;

    .line 172
    .line 173
    sget-object v9, Lt1/g;->d:Lt1/g;

    .line 174
    .line 175
    invoke-virtual {v8, v5, v4, v9}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 176
    .line 177
    .line 178
    iget-object v8, p0, Lz1/m;->f:Lcom/android/launcher3/compat/AlphabeticIndexCompat;

    .line 179
    .line 180
    iget-object v9, v5, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 181
    .line 182
    invoke-virtual {v8, v9}, Lcom/android/launcher3/compat/AlphabeticIndexCompat;->computeSectionNameMfv(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v8

    .line 186
    iput-object v8, v5, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    .line 187
    .line 188
    iput-object v6, v5, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 189
    .line 190
    invoke-virtual {v1, p3}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 191
    .line 192
    .line 193
    move-result-object v6

    .line 194
    invoke-static {v5, v4, v6, v0, v2}, Lcom/android/launcher3/model/data/d;->T(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;)Z

    .line 195
    .line 196
    .line 197
    iput-boolean v7, p0, Lz1/m;->d:Z

    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 201
    .line 202
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 203
    .line 204
    .line 205
    const-string v1, "updatePackage: no Activities matched updated package, removing any AppInfo with package="

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 227
    .line 228
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    sub-int/2addr v0, v7

    .line 233
    :goto_3
    if-ltz v0, :cond_b

    .line 234
    .line 235
    iget-object v1, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 236
    .line 237
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    check-cast v1, Lcom/android/launcher3/model/data/d;

    .line 242
    .line 243
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 244
    .line 245
    invoke-virtual {p3, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v2

    .line 249
    if-eqz v2, :cond_a

    .line 250
    .line 251
    iget-object v2, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 252
    .line 253
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    if-eqz v2, :cond_a

    .line 262
    .line 263
    sget-object v2, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 264
    .line 265
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v4

    .line 269
    check-cast v4, Lcom/android/launcher3/F1;

    .line 270
    .line 271
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->a0:Z

    .line 272
    .line 273
    if-eqz v4, :cond_5

    .line 274
    .line 275
    const-class v4, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;

    .line 276
    .line 277
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    iget-object v5, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 282
    .line 283
    invoke-virtual {v5}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v5

    .line 287
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v4

    .line 291
    if-eqz v4, :cond_5

    .line 292
    .line 293
    goto :goto_4

    .line 294
    :cond_5
    iget-object v4, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 295
    .line 296
    invoke-static {p1, v4}, Lx1/O;->s1(Landroid/content/Context;Landroid/content/ComponentName;)Z

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    if-eqz v4, :cond_6

    .line 301
    .line 302
    goto :goto_4

    .line 303
    :cond_6
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v4

    .line 307
    check-cast v4, Lcom/android/launcher3/F1;

    .line 308
    .line 309
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->i0:Z

    .line 310
    .line 311
    if-eqz v4, :cond_7

    .line 312
    .line 313
    const-class v4, Lcom/android/launcher3/settings/ConcernModeActivity;

    .line 314
    .line 315
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    iget-object v5, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 320
    .line 321
    invoke-virtual {v5}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v5

    .line 325
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v4

    .line 329
    if-eqz v4, :cond_7

    .line 330
    .line 331
    goto :goto_4

    .line 332
    :cond_7
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v4

    .line 336
    check-cast v4, Lcom/android/launcher3/F1;

    .line 337
    .line 338
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->j0:Z

    .line 339
    .line 340
    if-eqz v4, :cond_8

    .line 341
    .line 342
    const-class v4, Lcom/android/launcher3/settings/StandardModeActivity;

    .line 343
    .line 344
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v4

    .line 348
    iget-object v5, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 349
    .line 350
    invoke-virtual {v5}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v5

    .line 354
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result v4

    .line 358
    if-eqz v4, :cond_8

    .line 359
    .line 360
    goto :goto_4

    .line 361
    :cond_8
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    check-cast v2, Lcom/android/launcher3/F1;

    .line 366
    .line 367
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->k0:Z

    .line 368
    .line 369
    if-eqz v2, :cond_9

    .line 370
    .line 371
    const-class v2, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;

    .line 372
    .line 373
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    iget-object v4, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 378
    .line 379
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v4

    .line 383
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    move-result v2

    .line 387
    if-eqz v2, :cond_9

    .line 388
    .line 389
    goto :goto_4

    .line 390
    :cond_9
    iget-object v2, p0, Lz1/m;->b:Ls1/P;

    .line 391
    .line 392
    iget-object v1, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 393
    .line 394
    invoke-virtual {v2, v1, p3}, Lt1/f;->L(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lt1/f$a;

    .line 395
    .line 396
    .line 397
    invoke-direct {p0, v0}, Lz1/m;->s(I)V

    .line 398
    .line 399
    .line 400
    :cond_a
    :goto_4
    add-int/lit8 v0, v0, -0x1

    .line 401
    .line 402
    goto/16 :goto_3

    .line 403
    .line 404
    :cond_b
    return-object v3
.end method
