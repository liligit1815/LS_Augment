.class public Lcom/android/launcher3/resource/P;
.super Ljava/lang/Object;
.source "ReplaceAppIconManager.java"


# instance fields
.field private a:Landroid/os/UserHandle;

.field private b:Landroid/content/ComponentName;

.field private c:Landroid/content/ComponentName;

.field private d:Z

.field private e:Z


# direct methods
.method public constructor <init>(Landroid/content/ComponentName;Landroid/content/ComponentName;ZZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/resource/P;->a:Landroid/os/UserHandle;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/android/launcher3/resource/P;->c:Landroid/content/ComponentName;

    .line 13
    .line 14
    iput-boolean p3, p0, Lcom/android/launcher3/resource/P;->d:Z

    .line 15
    .line 16
    iput-boolean p4, p0, Lcom/android/launcher3/resource/P;->e:Z

    .line 17
    .line 18
    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string p2, "mHideComponentName:"

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 29
    .line 30
    invoke-virtual {p2}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p2, " mReplaceComponentName:"

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/android/launcher3/resource/P;->c:Landroid/content/ComponentName;

    .line 43
    .line 44
    invoke-virtual {p2}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p2, ",mIsHideAndReplace="

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-boolean p2, p0, Lcom/android/launcher3/resource/P;->d:Z

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p2, ",mIsRestoreShowAndReplace="

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-boolean p0, p0, Lcom/android/launcher3/resource/P;->e:Z

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "ReplaceAppIconManager"

    .line 76
    .line 77
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static synthetic a(Lz1/y0;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    iget v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    instance-of v0, p0, Lcom/android/launcher3/model/data/p;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/android/launcher3/model/data/p;

    .line 16
    .line 17
    iget v0, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/model/data/p;->B(Lcom/android/launcher3/model/data/y;IZ)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/util/x0;Lz1/y0$b;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-interface {p2, p1, v1, v0}, Lz1/y0$b;->n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static c(Landroid/content/Context;Lz1/o3;Lcom/android/launcher3/model/data/I;)V
    .locals 10

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "ReplaceAppIconManager"

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string p0, "addIconToDesktop--bgDataModel is null"

    .line 18
    .line 19
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget v2, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 24
    .line 25
    const/16 v3, -0x64

    .line 26
    .line 27
    if-ne v2, v3, :cond_4

    .line 28
    .line 29
    const-string v2, "addIconToDesktop icon container is desktop"

    .line 30
    .line 31
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v2, Lcom/android/launcher3/util/x0;

    .line 39
    .line 40
    invoke-direct {v2}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 41
    .line 42
    .line 43
    iget v3, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    const-string v0, "addIconToDesktop screenid is not invalid!!"

    .line 52
    .line 53
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    iget v0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    sget-object v0, Lc1/c;->c:Lc1/c;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-virtual {p0, v3, v0, v1}, Lcom/android/launcher3/D3;->o0(ZLc1/c;Lz1/y0$b;)Lz1/J3;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iget v6, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 70
    .line 71
    iget v7, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 72
    .line 73
    iget v8, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 74
    .line 75
    iget v9, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 76
    .line 77
    move-object v5, p2

    .line 78
    invoke-virtual/range {v4 .. v9}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 79
    .line 80
    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    new-instance p0, Lcom/android/launcher3/resource/N;

    .line 84
    .line 85
    invoke-direct {p0, v5, v2}, Lcom/android/launcher3/resource/N;-><init>(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/util/x0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, p0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    if-eqz p0, :cond_3

    .line 97
    .line 98
    new-instance p1, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    new-instance p2, Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, v2, p2, p1}, Lcom/android/launcher3/C2;->n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    return-void

    .line 115
    :cond_4
    move-object v5, p2

    .line 116
    if-lez v2, :cond_5

    .line 117
    .line 118
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 119
    .line 120
    new-instance p1, Lcom/android/launcher3/resource/O;

    .line 121
    .line 122
    invoke-direct {p1, v0, v5}, Lcom/android/launcher3/resource/O;-><init>(Lz1/y0;Lcom/android/launcher3/model/data/I;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_5
    const-string p0, "addIconToDesktop icon container is not desktop"

    .line 130
    .line 131
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method private d(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/resource/P;->e(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private e(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/I;
    .locals 6

    .line 1
    const-string p0, "ReplaceAppIconManager"

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 10
    .line 11
    iget v2, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 12
    .line 13
    iput v2, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 14
    .line 15
    iget v2, p3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 16
    .line 17
    iput v2, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    iput v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 21
    .line 22
    iput v2, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 23
    .line 24
    iget v2, p3, Lcom/android/launcher3/model/data/y;->rank:I

    .line 25
    .line 26
    iput v2, v0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 27
    .line 28
    iget v2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 29
    .line 30
    iput v2, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 31
    .line 32
    iget p3, p3, Lcom/android/launcher3/model/data/y;->container:I

    .line 33
    .line 34
    iput p3, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 35
    .line 36
    new-instance p3, Landroid/content/Intent;

    .line 37
    .line 38
    const-string v2, "android.intent.action.MAIN"

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-direct {p3, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 42
    .line 43
    .line 44
    const-string v4, "android.intent.category.LAUNCHER"

    .line 45
    .line 46
    invoke-virtual {p3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    const/high16 v5, 0x10200000

    .line 51
    .line 52
    invoke-virtual {p3, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-virtual {p3, p2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    iput-object p3, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 61
    .line 62
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    iput-object p3, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 67
    .line 68
    new-instance p3, Landroid/content/Intent;

    .line 69
    .line 70
    invoke-direct {p3, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p3, p2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    const-class p2, Landroid/content/pm/LauncherApps;

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    check-cast v2, Landroid/content/pm/LauncherApps;

    .line 86
    .line 87
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-virtual {v2, p3, v4}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    if-eqz p3, :cond_0

    .line 96
    .line 97
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    sget-object v4, Lt1/g;->d:Lt1/g;

    .line 106
    .line 107
    invoke-virtual {v2, v0, p3, v4}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 108
    .line 109
    .line 110
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    if-eqz v2, :cond_2

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    if-eqz v2, :cond_2

    .line 129
    .line 130
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Landroid/content/pm/LauncherApps;

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 145
    .line 146
    invoke-virtual {p1, p2, v1, v2}, Landroid/content/pm/LauncherApps;->getApplicationInfo(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/pm/ApplicationInfo;

    .line 147
    .line 148
    .line 149
    move-result-object v3
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    goto :goto_0

    .line 151
    :catch_0
    move-exception p1

    .line 152
    new-instance p2, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    const-string v1, "makeShortcutInfo: "

    .line 158
    .line 159
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    :goto_0
    if-eqz v3, :cond_1

    .line 177
    .line 178
    invoke-virtual {v3, p3}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    iget-object p1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 183
    .line 184
    invoke-virtual {p3, p0, p1}, Landroid/content/pm/PackageManager;->getUserBadgedLabel(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    iput-object p0, v0, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_1
    const-string p1, "Failed to get title "

    .line 192
    .line 193
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    :cond_2
    :goto_1
    return-object v0
.end method

.method private i(Landroid/content/Context;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "com.zte.mifavor.miboard"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lz1/h4;

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    filled-new-array {v2}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/4 v3, 0x3

    .line 32
    invoke-direct {v0, v3, v1, v2}, Lz1/h4;-><init>(ILandroid/os/UserHandle;[Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 54
    .line 55
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-direct {v1, p0, v2}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/H5;->E1(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/android/launcher3/resource/P;->a:Landroid/os/UserHandle;

    .line 88
    .line 89
    invoke-static {v0, p0}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1, p0}, Lcom/android/launcher3/D3;->P0(Ljava/util/function/Predicate;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method private j(Ljava/lang/String;)V
    .locals 9

    .line 1
    const-string v1, "ReplaceAppIconManager"

    .line 2
    .line 3
    const-string v0, "%"

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    goto/16 :goto_4

    .line 12
    .line 13
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const-string v2, "_id"

    .line 30
    .line 31
    filled-new-array {v2}, [Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    const-string v6, "itemType = ? AND intent LIKE ? "

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    new-instance v7, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v8, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 51
    .line 52
    invoke-virtual {v8}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    filled-new-array {v4, v7}, [Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    const/4 v8, 0x0

    .line 71
    move-object v4, p1

    .line 72
    invoke-virtual/range {v3 .. v8}, Lz1/k2;->Y(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 73
    .line 74
    .line 75
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :try_start_1
    new-instance v3, Landroid/content/Intent;

    .line 77
    .line 78
    const-string v5, "android.intent.action.MAIN"

    .line 79
    .line 80
    const/4 v6, 0x0

    .line 81
    invoke-direct {v3, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 82
    .line 83
    .line 84
    const-string v5, "android.intent.category.LAUNCHER"

    .line 85
    .line 86
    invoke-virtual {v3, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 87
    .line 88
    .line 89
    iget-object v5, p0, Lcom/android/launcher3/resource/P;->c:Landroid/content/ComponentName;

    .line 90
    .line 91
    invoke-virtual {v5}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-static {v5}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v3, v5}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    new-instance v5, Landroid/content/ContentValues;

    .line 103
    .line 104
    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v6, "intent"

    .line 108
    .line 109
    invoke-virtual {v3, v2}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v5, v6, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    if-eqz p1, :cond_1

    .line 117
    .line 118
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-lez v2, :cond_1

    .line 123
    .line 124
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    const-string v3, "intent LIKE ? "

    .line 141
    .line 142
    new-instance v6, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget-object p0, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    filled-new-array {p0}, [Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {v2, v4, v5, v3, p0}, Lz1/k2;->n0(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    new-instance v0, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .line 178
    .line 179
    const-string v2, "updateAppInfosDataInDb update result = "

    .line 180
    .line 181
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string p0, ", tableName = "

    .line 188
    .line 189
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 200
    .line 201
    .line 202
    goto :goto_0

    .line 203
    :catchall_0
    move-exception v0

    .line 204
    move-object p0, v0

    .line 205
    goto :goto_1

    .line 206
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    .line 207
    .line 208
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :catch_0
    move-exception v0

    .line 213
    move-object p0, v0

    .line 214
    goto :goto_3

    .line 215
    :goto_1
    if-eqz p1, :cond_2

    .line 216
    .line 217
    :try_start_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 218
    .line 219
    .line 220
    goto :goto_2

    .line 221
    :catchall_1
    move-exception v0

    .line 222
    move-object p1, v0

    .line 223
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 224
    .line 225
    .line 226
    :cond_2
    :goto_2
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 227
    :goto_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    .line 231
    .line 232
    const-string v0, "updateAppInfosDataInDb Exception = "

    .line 233
    .line 234
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    :cond_3
    :goto_4
    return-void
.end method

.method private k()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "favorites"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/android/launcher3/resource/P;->j(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    const-string v0, "easeFavorites"

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/android/launcher3/resource/P;->j(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method


# virtual methods
.method public f(Lz1/o3;Lcom/android/launcher3/P2;Lz1/y0;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/resource/P;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashSet;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/resource/P;->a:Landroid/os/UserHandle;

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p3, p3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 22
    .line 23
    invoke-interface {p3}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-static {p3, v1}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-interface {p3, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {p3, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    check-cast p3, Ljava/util/Collection;

    .line 45
    .line 46
    const-string v0, "ReplaceAppIconManager"

    .line 47
    .line 48
    if-eqz p3, :cond_3

    .line 49
    .line 50
    invoke-interface {p3}, Ljava/util/Collection;->size()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_0

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    :cond_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 72
    .line 73
    iget v2, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 74
    .line 75
    if-nez v2, :cond_1

    .line 76
    .line 77
    new-instance p3, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v2, "execute, itemInfo:"

    .line 83
    .line 84
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    iget p3, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 98
    .line 99
    const/16 v0, -0x64

    .line 100
    .line 101
    if-ne p3, v0, :cond_2

    .line 102
    .line 103
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-direct {p0, p3}, Lcom/android/launcher3/resource/P;->i(Landroid/content/Context;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    iget-object v0, p0, Lcom/android/launcher3/resource/P;->c:Landroid/content/ComponentName;

    .line 115
    .line 116
    invoke-direct {p0, p3, v0, v1}, Lcom/android/launcher3/resource/P;->d(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/I;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v0, p1, p3}, Lcom/android/launcher3/resource/P;->c(Landroid/content/Context;Lz1/o3;Lcom/android/launcher3/model/data/I;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/resource/P;->g(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V

    .line 132
    .line 133
    .line 134
    invoke-direct {p0}, Lcom/android/launcher3/resource/P;->k()V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_3
    :goto_0
    const-string p1, "execute tmpHideComponentNames == null"

    .line 139
    .line 140
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    invoke-direct {p0}, Lcom/android/launcher3/resource/P;->k()V

    .line 144
    .line 145
    .line 146
    :cond_4
    return-void
.end method

.method public g(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    iget p2, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/P;->i(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;
    .locals 5

    .line 1
    const-string v0, "uninstallAndCreateDownloadNewItem: sgg0"

    .line 2
    .line 3
    const-string v1, "ReplaceAppIconManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/resource/P;->b:Landroid/content/ComponentName;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v3, 0x0

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    return-object v3

    .line 26
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    return-object v3

    .line 33
    :cond_1
    iget-object v4, p0, Lcom/android/launcher3/resource/P;->a:Landroid/os/UserHandle;

    .line 34
    .line 35
    invoke-static {v0, v4}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 40
    .line 41
    invoke-interface {v2}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const/4 v4, 0x0

    .line 46
    invoke-static {v2, v4}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-interface {v2, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ljava/util/Collection;

    .line 63
    .line 64
    if-eqz v0, :cond_7

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_6

    .line 82
    .line 83
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 88
    .line 89
    iget v4, v2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 90
    .line 91
    if-nez v4, :cond_3

    .line 92
    .line 93
    iget v0, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 94
    .line 95
    const/16 v4, -0x64

    .line 96
    .line 97
    if-ne v0, v4, :cond_4

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-direct {p0, v0}, Lcom/android/launcher3/resource/P;->i(Landroid/content/Context;)V

    .line 104
    .line 105
    .line 106
    :cond_4
    iget v0, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 107
    .line 108
    if-eq v0, v4, :cond_5

    .line 109
    .line 110
    if-lez v0, :cond_6

    .line 111
    .line 112
    :cond_5
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iget-object v0, p0, Lcom/android/launcher3/resource/P;->c:Landroid/content/ComponentName;

    .line 117
    .line 118
    invoke-direct {p0, p1, v0, v2}, Lcom/android/launcher3/resource/P;->d(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/I;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    return-object p0

    .line 123
    :cond_6
    const-string p0, "uninstallAndCreateDownloadNewItem: sgg5"

    .line 124
    .line 125
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    return-object v3

    .line 129
    :cond_7
    :goto_0
    const-string p0, "execute tmpHideComponentNames == null"

    .line 130
    .line 131
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    return-object v3
.end method
